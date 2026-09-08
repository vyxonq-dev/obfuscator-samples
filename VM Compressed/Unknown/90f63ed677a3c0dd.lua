 local p = game.Players.LocalPlayer
        local TS = game:GetService("TweenService")
        local RunService = game:GetService("RunService")
        
        local FinalDamage = 75
        local sped = 200
        local candash = true
        local hit = 0
        local Character = p.Character
        local Humanoid = Character:WaitForChild("Humanoid")
        local RootPart = Character:WaitForChild("HumanoidRootPart")
        local move = Instance.new("BodyVelocity", RootPart)
        move.MaxForce = Vector3.new(math.huge, 0, math.huge)
        
        local hitbox = Instance.new("Part")
        hitbox.CanCollide = false
        hitbox.Anchored = false
        hitbox.Name = "Hitbox"
        hitbox.Material = Enum.Material.ForceField
        hitbox.Size = Vector3.new(8, 8, 10)
        hitbox.CanQuery = false
        hitbox.Transparency = 1
        hitbox.Color = Color3.fromRGB(255, 0, 0)
        hitbox.Massless = true
        hitbox.Parent = workspace
        
        function getRoot(char)
            local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
            return rootPart
        end
        
        local hitlist = {}
        
        local AnimAnim = Instance.new("Animation")
        AnimAnim.AnimationId = "rbxassetid://17354976067"
        local Anim = Humanoid:LoadAnimation(AnimAnim)
        AnimAnim.AnimationId = "rbxassetid://0"
        Anim:Play()
        
        local soundId = 17429233290 -- Correct sound ID
        
        -- Create a new Sound instance
        local sound = Instance.new("Sound")
        sound.Name = "Dropkick_Miss"
        sound.SoundId = "rbxassetid://" .. soundId
        sound.Volume = 1
        sound.Pitch = 1.0 -- Pitch set to 1.0
        sound.PlaybackSpeed = 1.0 -- Adjusted playback speed
        
        -- Parent the sound to Workspace
        sound.Parent = workspace
        
        -- Play the sound
        sound:Play()
        
        local soundId = 17356346310 -- Correct sound ID
        
        -- Create a new Sound instance
        local sound = Instance.new("Sound")
        sound.Name = "Dropkick_SFX"
        sound.SoundId = "rbxassetid://" .. soundId
        sound.Volume = 1
        sound.Pitch = 1.0 -- Pitch set to 1.0
        sound.PlaybackSpeed = 1.0 -- Adjusted playback speed
        
        -- Parent the sound to Workspace
        sound.Parent = workspace
        
        -- Play the sound
        sound:Play()
        
        Humanoid.WalkSpeed = 0
        local p = game.Players.LocalPlayer
        local Humanoid = p.Character:WaitForChild("Humanoid")
        
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
            end
        Anim:GetMarkerReachedSignal("StartHitbox"):Connect(function()
            
            move.Velocity = sped * RootPart.CFrame.LookVector
            move.Parent = RootPart
            hitbox.CFrame = RootPart.CFrame * CFrame.new(0, 0, -9)
        
            local function onHeartbeat()
                if candash then
                    move.Velocity = sped * RootPart.CFrame.LookVector
                    hitbox.CFrame = RootPart.CFrame * CFrame.new(0, 0, -9)
                end
            end
        
            local heartbeatConnection
            heartbeatConnection = RunService.Heartbeat:Connect(onHeartbeat)
        
            hitbox.Touched:Connect(function(hitPart)
                local hitHumanoid = hitPart.Parent:FindFirstChildOfClass("Humanoid")
                if hitHumanoid and hitPart.Parent ~= Character and hit == 0 then
                    if not hitlist[hitHumanoid] then
                        hitlist[hitHumanoid] = true
                        candash = false
                        hit = 1
        
                        local speaker = p
                        speaker.Character:FindFirstChildOfClass('Humanoid').AutoRotate  = false
                        heartbeatConnection:Disconnect()
                        move:Destroy()
                        hitbox:Destroy()
                        Anim:Stop()
        
                        if speaker.Character:FindFirstChildOfClass('Humanoid') and speaker.Character:FindFirstChildOfClass('Humanoid').SeatPart then
                            speaker.Character:FindFirstChildOfClass('Humanoid').Sit = false
                            task.wait(.1)
                        end
                        getRoot(speaker.Character).CFrame = getRoot(hitPart.Parent).CFrame + Vector3.new(-10,1,0)
        
                        local BeenASecond, V3 = false, Vector3.new(0, 0, 0)
                        delay(0, function()
                            BeenASecond = true
                        end)
                        while not BeenASecond do
                            for _, v in ipairs(speaker.Character:GetDescendants()) do
                                if v:IsA("BasePart") then
                                    v.Velocity, v.RotVelocity = V3, V3
                                end
                            end
                            task.wait()
                        end
                        -- Stops the sound
                        sound:stop()
        
                        Humanoid.WalkSpeed = 0
                        
                        local PlayerAnim = Instance.new("Animation")
                        PlayerAnim.AnimationId = "rbxassetid://17420452843"
                        local Player = Humanoid:LoadAnimation(PlayerAnim)
                        PlayerAnim.AnimationId = "rbxassetid://0"
                        Player:Play()
        
        local Players = game:GetService("Players")
        local player = Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        
        -- Get the current orientation of the HumanoidRootPart
        local currentCFrame = humanoidRootPart.CFrame
        
        -- Calculate the new orientation to look behind (180-degree rotation on Y axis)
        local newCFrame = currentCFrame * CFrame.Angles(0, math.rad(180), 0)
        
        -- Update the HumanoidRootPart CFrame to the new orientation
        humanoidRootPart.CFrame = newCFrame
        spawn(function()
            wait(9.5)
            local Players = game:GetService("Players")
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            
            local p = Players.LocalPlayer
            local playerGui = p:WaitForChild("PlayerGui")
            
            -- Clone the ImpactFrames from ReplicatedStorage to PlayerGui
            local replicatedGui = ReplicatedStorage:WaitForChild("Resources"):WaitForChild("KJEffects"):WaitForChild("ImpactFrames")
            local clonedGui1 = replicatedGui:Clone()
            clonedGui1.Parent = playerGui
            
            local impactframe = clonedGui1
            
            -- Function to handle the visibility of frames
            local function showFrames1()
                local frameSequence = {
                    { "Frame1", 0.02 },
                    { "Frame2", 0.02 },
                    { "Frame3", 0.02 },
                    { "Frame4", 0.02 },
                    { "Frame5", 0.02 },
                    { "Frame6", 0.02 },
                    { "Frame7", 0.02 },
                    { "Frame8", 0.02 },
                    { "Frame9", 0.02 },
                    { "Frame10", 0.02 },
                    { "Frame11", 0.02 },
                    { "Frame12", 0.02 },
                    { "Frame13", 0.02 },
                    { "Frame14", 0.02 },
                    { "Frame15", 0.02 },
                    { "Frame16", 3.7 }
                }
            
                for _, frameData in ipairs(frameSequence) do
                    local frameName, duration = unpack(frameData)
                    local frame = impactframe:FindFirstChild(frameName)
                    if frame then
                        frame.Visible = true
                        wait(duration)
                        frame.Visible = false
                    end
                end
            end
            
            -- Call the function to start the frame sequence
            showFrames1()
            
            local p = game.Players.LocalPlayer
            local Thrown = workspace
            local RS = game:GetService("ReplicatedStorage")
            local background = RS.Resources.KJEffects["202020BACKSCREEN"]:Clone()
            
            local Humanoid = p.Character:WaitForChild("Humanoid")
            local RootPart = p.Character:WaitForChild("HumanoidRootPart")
            background.Parent = Thrown
            background.CFrame = RootPart.CFrame * CFrame.new(0, -2.6, -180)
            
            local Players = game:GetService("Players")
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            
            local p = Players.LocalPlayer
            local playerGui = p:WaitForChild("PlayerGui")
            
            -- Clone the ImpactFrames from ReplicatedStorage to PlayerGui
            local replicatedGui = ReplicatedStorage:WaitForChild("Resources"):WaitForChild("KJEffects"):WaitForChild("Text")
            local clonedGui2 = replicatedGui:Clone()
            clonedGui2.Parent = playerGui
            
            local TextFrame = clonedGui2
            
            -- Wait for 0.5 seconds
            wait(0.5)
            
            -- Function to handle the visibility of frames
            local function showFrames2()
                local frameSequence = {
                    {"Frame1", 0.03},
                    {"Frame2", 0.03},
                    {"Frame3", 0.03},
                    {"Frame4", 0.5},
                    {"Frame5", 0.03},
                    {"Frame6", 0.03},
                    {"Frame7", 0.03},
                    {"Frame8", 0.5},
                    {"Frame9", 0.03},
                    {"Frame10", 0.03},
                    {"Frame11", 0.03},
                    {"Frame12", 0.5},
                    {"Frame13", 0.03},
                    {"Frame14", 0.03},
                    {"Frame15", 0.03},
                    {"Frame16", 3.7}
                }
            
                for _, frameData in ipairs(frameSequence) do
                    local frameName, duration = unpack(frameData)
                    local frame = TextFrame:FindFirstChild(frameName)
                    if frame then
                        frame.Visible = true
                        wait(duration)
                        frame.Visible = false
                    end
                end
            end
            
            -- Call the function to start the frame sequence
            showFrames2()
            
            clonedGui1:Destroy()
            
            clonedGui2:Destroy()
            
            background:Destroy()
        end)
        local soundId = 17363377920 -- Correct sound ID
        
        -- Create a new Sound instance
        local sound = Instance.new("Sound")
        sound.Name = "Audio/kj-20-20-20_user"
        sound.SoundId = "rbxassetid://" .. soundId
        sound.Volume = 1
        sound.Pitch = 1.0 -- Pitch set to 1.0
        sound.PlaybackSpeed = 1.0 -- Adjusted playback speed
        
        -- Parent the sound to Workspace
        sound.Parent = workspace
        
        -- Play the sound
        sound:Play()
        
        local soundId = 17363383992 -- Correct sound ID
        
        -- Create a new Sound instance
        local sound = Instance.new("Sound")
        sound.Name = "Audio/kj-20-20-20_cutscene_music"
        sound.SoundId = "rbxassetid://" .. soundId
        sound.Volume = 1
        sound.Pitch = 1.0 -- Pitch set to 1.0
        sound.PlaybackSpeed = 1.0 -- Adjusted playback speed
        
        -- Parent the sound to Workspace
        sound.Parent = workspace
        
        -- Play the sound
        sound:Play()
        
        local soundId = 17363374089 -- Correct sound ID
        
        -- Create a new Sound instance
        local sound = Instance.new("Sound")
        sound.Name = "Audio/kj-20-20-20_victim_reedit"
        sound.SoundId = "rbxassetid://" .. soundId
        sound.Volume = 1
        sound.Pitch = 1.0 -- Pitch set to 1.0
        sound.PlaybackSpeed = 1.0 -- Adjusted playback speed
        
        -- Parent the sound to Workspace
        sound.Parent = workspace
        
        -- Play the sound
        sound:Play()
        
        local final2 = game.ReplicatedStorage.Resources.KJEffects["KJWallCombo"].FinalImpact.Origin:Clone()
        final2.Parent = game.Players.LocalPlayer.Character["Right Arm"]
            for _, child in ipairs(final2:GetChildren()) do
                if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
                    child:Emit(1) -- Emit 20 particles
                end
            end
        local final3 = game.ReplicatedStorage.Resources.KJEffects["KJWallCombo"].FinalImpact.Attachment:Clone()
        final3.Parent = game.Players.LocalPlayer.Character["Right Arm"]
            for _, child in ipairs(final3:GetChildren()) do
                if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
                    child:Emit(1) -- Emit 20 particles
                end
            end
        local final4 = game.ReplicatedStorage.Resources.KJEffects["KJWallCombo"].FinalImpact.Attachment:Clone()
        final4.Parent = game.Players.LocalPlayer.Character["Right Arm"]
            for _, child in ipairs(final4:GetChildren()) do
                if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
                    child:Emit(1) -- Emit 20 particles
                end
            end
        local final5 = game.ReplicatedStorage.Resources.KJEffects["KJWallCombo"].FinalImpact.Attachment:Clone()
        final5.Parent = game.Players.LocalPlayer.Character["Right Arm"]
            for _, child in ipairs(final5:GetChildren()) do
                if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
                    child:Emit(1) -- Emit 20 particles
                end
            end
        local final6 = game.ReplicatedStorage.Resources.KJEffects["KJWallCombo"].FinalImpact.Attachment:Clone()
        final6.Parent = game.Players.LocalPlayer.Character["Right Arm"]
            for _, child in ipairs(final6:GetChildren()) do
                if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
                    child:Emit(1) -- Emit 20 particles
                end
            end
        
        local launch1 = game.ReplicatedStorage.Resources.KJEffects["launchup"].launchything:Clone()
        launch1.Parent = game.Workspace.Live["Weakest Dummy"]["Torso"]
            for _, child in ipairs(launch1:GetChildren()) do
                if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
                    child:Emit(3) -- Emit 20 particles
                end
            end
            spawn(function()
            wait(15)
            local targetName = "thespeedthingunderultik"
            for i = 1, 15 do
                character:WaitForChild("HumanoidRootPart").Anchored = false
            character:WaitForChild("Humanoid").AutoRotate = true
            wait(1)
            end
            
        -- Workspace'teki tÃƒÂ¼m objeleri dÃƒÂ¶ner
        for _, obj in pairs(workspace:GetDescendants()) do
            -- EÃ„Å¸er objenin adÃ„Â± 'speedlines' ise
            if obj:IsA("BasePart") and obj.Name == targetName then
                -- Objeyi sil
                obj:Destroy()
            end
        end
        -- TÃƒÂ¼m 'speedlines' adÃ„Â±ndaki parÃƒÂ§alarÃ„Â± bulup silen script
        local targetName = "speedlines"
        
        -- Workspace'teki tÃƒÂ¼m objeleri dÃƒÂ¶ner
        for _, obj in pairs(workspace:GetDescendants()) do
            -- EÃ„Å¸er objenin adÃ„Â± 'speedlines' ise
            if obj:IsA("BasePart") and obj.Name == targetName then
                -- Objeyi sil
                obj:Destroy()
            end
        end
        local targetName = "speedlinesandstuff"
        
        -- Workspace'teki tÃƒÂ¼m objeleri dÃƒÂ¶ner
        for _, obj in pairs(workspace:GetDescendants()) do
            -- EÃ„Å¸er objenin adÃ„Â± 'speedlines' ise
            if obj:IsA("BasePart") and obj.Name == targetName then
                -- Objeyi sil
                obj:Destroy()
            end
        end
            end)
            local VictimAnim = Instance.new("Animation")
            VictimAnim.AnimationId = "rbxassetid://17363256069"
            local Victim = hitHumanoid:LoadAnimation(VictimAnim)
            VictimAnim.AnimationId = "rbxassetid://0"
            Victim:Play()
            workspace.Dropkick_SFX:Destroy()
            workspace.Dropkick_Miss:Destroy()
            
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            for _, part in ipairs(character:GetDescendants()) do
                if part:IsA("Part") then
                    part.CanCollide = false
                end
            end
            local weakDummy = game.Workspace.Live["Weakest Dummy"]
            local weakDummyHRP = weakDummy:FindFirstChild("HumanoidRootPart")
            
            -- Karakterin pozisyonunu ve rotasyonunu ayarla
            local offset = CFrame.new(0, 0, 10) -- Karakteri sola (negatif x) ve biraz geriye (negatif z) kaydÃ„Â±r
            local rotation = CFrame.Angles(0, math.pi, 0) -- 180 derece dÃƒÂ¶ndÃƒÂ¼r
            
            -- Karakterin CFrame'ini ayarla
            character:WaitForChild("HumanoidRootPart").CFrame = weakDummyHRP.CFrame * rotation * offset
            character:WaitForChild("HumanoidRootPart").Anchored = true
            character:WaitForChild("Humanoid").AutoRotate = false
        
        wait(1.4)
        
        
        local launch1 = game.ReplicatedStorage.Resources.KJEffects["launchup"].launchything:Clone()
        launch1.Parent = game.Workspace.Live["Weakest Dummy"]["Torso"]
            for _, child in ipairs(launch1:GetChildren()) do
                if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
                    child:Emit(3) -- Emit 20 particles
                end
            end
        
        
        wait(0.6)
        
        
        local launch1 = game.ReplicatedStorage.Resources.KJEffects["launchup"].launchything:Clone()
        launch1.Parent = game.Workspace.Live["Weakest Dummy"]["Torso"]
            for _, child in ipairs(launch1:GetChildren()) do
                if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
                    child:Emit(3) -- Emit 20 particles
                end
            end
        
        
        wait(0.5)
        
        
        local launch1 = game.ReplicatedStorage.Resources.KJEffects["launchup"].launchything:Clone()
        launch1.Parent = game.Workspace.Live["Weakest Dummy"]["Torso"]
            for _, child in ipairs(launch1:GetChildren()) do
                if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
                    child:Emit(3) -- Emit 20 particles
                end
            end
        
        
        wait(0.7)
        
        
        local launch1 = game.ReplicatedStorage.Resources.KJEffects["launchup"].launchything:Clone()
        launch1.Parent = game.Workspace.Live["Weakest Dummy"]["Torso"]
            for _, child in ipairs(launch1:GetChildren()) do
                if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
                    child:Emit(3) -- Emit 20 particles
                end
            end
        wait(1.4)
        
        
        local soundId = 17419337758 -- Correct sound ID
        
        -- Create a new Sound instance
        local sound = Instance.new("Sound")
        sound.Name = "Audio/kj-20-20-20_camera_ambience"
        sound.SoundId = "rbxassetid://" .. soundId
        sound.Volume = 1
        sound.Pitch = 1.0 -- Pitch set to 1.0
        sound.PlaybackSpeed = 1.0 -- Adjusted playback speed
        
        -- Parent the sound to Workspace
        sound.Parent = workspace
        
        -- Play the sound
        sound:Play()
        
                        wait(2)
                        speaker.Character:FindFirstChildOfClass('Humanoid').AutoRotate  = true
                        Humanoid.WalkSpeed = 0
                        candash = true
                        hitlist[hitHumanoid] = nil
                        hit = 0
                    end
                end
            end)
        end)
        
        Anim:GetMarkerReachedSignal("End"):Connect(function()
            move:Destroy()
            candash = false
            hitbox:Destroy()
            Humanoid.WalkSpeed = 16
            workspace.Dropkick_SFX:Destroy()
            workspace.Dropkick_Miss:Destroy()
            -- TÃƒÂ¼m 'speedlines' adÃ„Â±ndaki parÃƒÂ§alarÃ„Â± bulup silen script
        local targetName = "thespeedthingunderultik"
        
        -- Workspace'teki tÃƒÂ¼m objeleri dÃƒÂ¶ner
        for _, obj in pairs(workspace:GetDescendants()) do
            -- EÃ„Å¸er objenin adÃ„Â± 'speedlines' ise
            if obj:IsA("BasePart") and obj.Name == targetName then
                -- Objeyi sil
                obj:Destroy()
            end
        end
        -- TÃƒÂ¼m 'speedlines' adÃ„Â±ndaki parÃƒÂ§alarÃ„Â± bulup silen script
        local targetName = "speedlines"
        
        -- Workspace'teki tÃƒÂ¼m objeleri dÃƒÂ¶ner
        for _, obj in pairs(workspace:GetDescendants()) do
            -- EÃ„Å¸er objenin adÃ„Â± 'speedlines' ise
            if obj:IsA("BasePart") and obj.Name == targetName then
                -- Objeyi sil
                obj:Destroy()
            end
        end
        local targetName = "speedlinesandstuff"
        
        -- Workspace'teki tÃƒÂ¼m objeleri dÃƒÂ¶ner
        for _, obj in pairs(workspace:GetDescendants()) do
            -- EÃ„Å¸er objenin adÃ„Â± 'speedlines' ise
            if obj:IsA("BasePart") and obj.Name == targetName then
                -- Objeyi sil
                obj:Destroy()
            end
        end
        end)	