local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

-- // Get Player Info
local LocalPlayer = game:GetService("Players").LocalPlayer
local Username = LocalPlayer.Name  

-- // Show Notification on Script Load
Library:Notify("Welcome to farthub. - " .. Username .. " enjoy.", 5)
task.wait(1) 
Library:Notify("Status: 🟢 ", 5)

-- // Create Main UI Window
local Window = Library:CreateWindow({
    Title = 'FARTHUB-pc Version',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

-- // Tabs
local Tabs = {
    Main = Window:AddTab('Main'),
    Player = Window:AddTab('Player'),
   -- Autofarm = Window:AddTab('Autofarm'),
    Combat = Window:AddTab('Combat'),
    Visuals = Window:AddTab('Visuals'),
    ['Settings'] = Window:AddTab('Settings'),
}

-- // Create Groupboxes
local DupeBox = Tabs.Main:AddLeftGroupbox("Dupe")
local QuickShop = Tabs.Main:AddLeftGroupbox('Quick Shop')
local Tele = Tabs.Main:AddLeftGroupbox('Teleport')

local ATMBank = Tabs.Main:AddRightGroupbox('ATM / Bank')
local Misc = Tabs.Main:AddRightGroupbox('Misc')
local TargetBox = Tabs.Player:AddLeftGroupbox("Target")
local Troll = Tabs.Player:AddLeftGroupbox("Troll")
local Gun = Tabs.Player:AddLeftGroupbox("Gun Mods")
--local TeleportBox = Tabs.Combat:AddLeftGroupbox("Teleports")
local Movement = Tabs.Player:AddRightGroupbox("Movement")
local ExtraBox = Tabs.Player:AddRightGroupbox("Player Mods")
local Visuals = Tabs.Visuals:AddLeftGroupbox("Visuals Settings")
local World = Tabs.Visuals:AddRightGroupbox("World Visuals")
-- local Autofarm = Tabs.Autofarm:AddLeftGroupbox("Autofarm")
local Combat = Tabs.Combat:AddRightGroupbox("Fov Settings")
local Extra = Tabs.Combat:AddLeftGroupbox("HitBox")
local Farm = Tabs.Main:AddRightGroupbox('Quick Farms')

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local character
local humanoidRootPart
local humanoid

local function updateCharacterReferences()
    character = player.Character or player.CharacterAdded:Wait()
    humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    humanoid = character:WaitForChild("Humanoid")
end

updateCharacterReferences()

local speed = 16 -- Default walking speed
local flightSpeed = 100 -- Default flight speed
local boostMultiplier = 2 -- Speed boost when holding Shift
local enhancedWalk = false
local flying = false

local bodyVelocity
local bodyGyro

-- Function to stop all movement
local function cleanupMovement()
    if bodyVelocity then bodyVelocity:Destroy() end
    if bodyGyro then bodyGyro:Destroy() end
    bodyVelocity = nil
    bodyGyro = nil
end

local function startEnhancedWalk()
    if enhancedWalk then return end
    enhancedWalk = true

    cleanupMovement()

    -- Disable BodyVelocity, use HumanoidRootPart velocity directly
    humanoidRootPart.AssemblyLinearVelocity = Vector3.zero 

    bodyGyro = Instance.new("BodyGyro")
    bodyGyro.MaxTorque = Vector3.new(0, math.huge, 0)
    bodyGyro.CFrame = humanoidRootPart.CFrame
    bodyGyro.Parent = humanoidRootPart

    RunService.RenderStepped:Connect(function()
        if not enhancedWalk then return end
        local camera = workspace.CurrentCamera
        local moveDirection = Vector3.zero

        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            moveDirection = moveDirection + Vector3.new(camera.CFrame.LookVector.X, 0, camera.CFrame.LookVector.Z)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            moveDirection = moveDirection - Vector3.new(camera.CFrame.LookVector.X, 0, camera.CFrame.LookVector.Z)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            moveDirection = moveDirection - camera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            moveDirection = moveDirection + camera.CFrame.RightVector
        end

        local currentSpeed = speed
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
            currentSpeed = speed * boostMultiplier
        end

        if moveDirection.Magnitude > 0 then
            moveDirection = moveDirection.Unit * currentSpeed
        else
            moveDirection = Vector3.zero
        end

        -- Apply velocity directly instead of using BodyVelocity
        humanoidRootPart.AssemblyLinearVelocity = Vector3.new(moveDirection.X, humanoidRootPart.AssemblyLinearVelocity.Y * 0.85, moveDirection.Z) 

        -- Keep rotation smooth
        bodyGyro.CFrame = CFrame.new(humanoidRootPart.Position, humanoidRootPart.Position + Vector3.new(camera.CFrame.LookVector.X, 0, camera.CFrame.LookVector.Z))
    end)
end

local function stopEnhancedWalk()
    enhancedWalk = false
    cleanupMovement()
    if bodyGyro then
        bodyGyro:Destroy()
    end
    humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
end

-- Function to start flying
local function startFlying()
    if flying then return end
    flying = true
    
    cleanupMovement()
    
    bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bodyVelocity.Velocity = Vector3.zero
    bodyVelocity.Parent = humanoidRootPart

    bodyGyro = Instance.new("BodyGyro")
    bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    bodyGyro.CFrame = humanoidRootPart.CFrame
    bodyGyro.Parent = humanoidRootPart

    RunService.RenderStepped:Connect(function()
        if not flying then return end
        local camera = workspace.CurrentCamera
        local moveDirection = Vector3.zero

        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            moveDirection = moveDirection + camera.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            moveDirection = moveDirection - camera.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            moveDirection = moveDirection - camera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            moveDirection = moveDirection + camera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            moveDirection = moveDirection + Vector3.new(0, 1, 0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
            moveDirection = moveDirection - Vector3.new(0, 1, 0)
        end

        local currentSpeed = flightSpeed
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
            currentSpeed = flightSpeed * boostMultiplier
        end

        if moveDirection.Magnitude > 0 then
            bodyVelocity.Velocity = moveDirection.Unit * currentSpeed
        else
            bodyVelocity.Velocity = Vector3.zero
        end
        bodyGyro.CFrame = camera.CFrame
    end)
end

local function stopFlying()
    flying = false
    cleanupMovement()
end

-- GUI Toggle for Enhanced Walking


-- Speed Slider for Walkspeed
Movement:AddSlider('WalkspeedSlider', {
    Text = 'Change Walkspeed',
    Default = 16,
    Min = 16,
    Max = 300,
    Rounding = 1,
    Callback = function(value)
        speed = value
    end
})


-- Speed Slider for Flight Speed
Movement:AddSlider('FlightSpeedSlider', {
    Text = 'Change Fly Speed',
    Default = 100,
    Min = 50,
    Max = 2000,
    Rounding = 0,
    Callback = function(value)
        flightSpeed = value
    end
})
-- Character Respawn Handling
player.CharacterAdded:Connect(function()
    updateCharacterReferences()
    cleanupMovement()
    if enhancedWalk then startEnhancedWalk() end
    if flying then stopFlying() end -- Ensure flight stops completely before restarting
end)






Troll:AddButton("Spam Call Police", function()
    for i = 1,getgenv().intsdp do
        task.wait(0.05)
        game:GetService("ReplicatedStorage").CallPolice:FireServer()
    end
end)


local localPlayer = game:GetService("Players").LocalPlayer
local uis = game:GetService("UserInputService")
local rs = game:GetService("RunService")
local isMoving = {W = false, A = false, S = false, D = false} -- Table to track movement keys
local multiplier = 1  -- Default multiplier (adjustable by the slider)
local movementEnabled = false -- Movement starts disabled
local SwimMethodEnabled = false -- Freefall starts disabled
local currentWalkSpeed = 16  -- Default Walkspeed

-- Display a hint for 2 seconds
task.spawn(function()
    local hint = Instance.new("Hint", workspace)
    task.wait(2)
    hint:Destroy()
end)

-- Function to move the character based on key input
local function moveCharacter()
    if movementEnabled and localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local direction = Vector3.new(0, 0, 0)
        local camera = workspace.CurrentCamera

        -- Adjust the direction based on pressed keys
        if isMoving.W then
            direction = direction + Vector3.new(camera.CFrame.LookVector.X, 0, camera.CFrame.LookVector.Z) -- Forward
        end
        if isMoving.A then
            direction = direction - Vector3.new(camera.CFrame.RightVector.X, 0, camera.CFrame.RightVector.Z) -- Left
        end
        if isMoving.S then
            direction = direction - Vector3.new(camera.CFrame.LookVector.X, 0, camera.CFrame.LookVector.Z) -- Backward
        end
        if isMoving.D then
            direction = direction + Vector3.new(camera.CFrame.RightVector.X, 0, camera.CFrame.RightVector.Z) -- Right
        end

        -- Normalize direction and move the character
        if direction.Magnitude > 0 then
            direction = direction.Unit * multiplier
            localPlayer.Character.HumanoidRootPart.CFrame = localPlayer.Character.HumanoidRootPart.CFrame + direction
        end
    end
end

-- Key press detection for W, A, S, D
uis.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.W then
        isMoving.W = true
    elseif input.KeyCode == Enum.KeyCode.A then
        isMoving.A = true
    elseif input.KeyCode == Enum.KeyCode.S then
        isMoving.S = true
    elseif input.KeyCode == Enum.KeyCode.D then
        isMoving.D = true
    end
end)

-- Stop moving when the key is released
uis.InputEnded:Connect(function(input, gameProcessed)
    if gameProcessed then return end

    if input.KeyCode == Enum.KeyCode.W then
        isMoving.W = false
    elseif input.KeyCode == Enum.KeyCode.A then
        isMoving.A = false
    elseif input.KeyCode == Enum.KeyCode.S then
        isMoving.S = false
    elseif input.KeyCode == Enum.KeyCode.D then
        isMoving.D = false
    end
end)

-- Update the character's position every frame based on key input
rs.RenderStepped:Connect(moveCharacter)



-- Freefall Method Logic
getgenv().SwimMethod = false

task.spawn(function()
    while task.wait() do
        if getgenv().SwimMethod then
            local player = game:GetService("Players").LocalPlayer
            if player and player.Character and player.Character:FindFirstChild("Humanoid") then
                local humanoid = player.Character.Humanoid
                humanoid:ChangeState(Enum.HumanoidStateType.FallingDown     )
            end
        end
    end
end)
print("bypassed lol")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

local movementEnabled = false
local currentWalkSpeed = 16  -- Default speed

--- Movement:AddSlider('WalkspeedSlider', {
   ---  Text = 'Change Walkspeed',
  ---   Default = 16,
  ---   Min = 16,
  ---   Max = 300,
 ---    Rounding = 1,
  ---   Callback = function(value)
  ---       currentWalkSpeed = value  -- Save the new speed
  ---   end
--- })




Movement:AddSlider('JumpPowerSlider', {
    Text = 'Change Jump Height',
    Default = 1,  -- Default jump height
    Min = 1,  -- Minimum jump height
    Max = 20000,  -- Maximum jump height
    Rounding = 1,
    Callback = function(value)
        currentJumpPower = value  -- Save the new jump height
        local humanoid = game.Players.LocalPlayer.Character.Humanoid
        if jumpPowerEnabled then
            humanoid.JumpHeight = value  -- Change jump height in real-time
        else
            humanoid.JumpHeight = 9  -- Set jump height to 9 when disabled
        end
    end
})



Movement:AddToggle('EnableWalkspeed', {
    Text = 'Walkspeed',
    Default = false,  
    Callback = function(enabled)
        if enabled then
            startEnhancedWalk()
        else
            stopEnhancedWalk()
        end
    end
})

-- GUI Toggle for Flight
Movement:AddToggle('EnableFlight', {
    Text = 'Fly',
    Default = false,  
    Callback = function(enabled)
        if enabled then
            startFlying()
        else
            stopFlying()
        end
    end
})


Movement:AddToggle('EnableJumpPower', {
    Text = 'Jump Power',
    Default = false,  -- Default to off
    Callback = function(Value)
        if Value then
            -- Enable Jump Power with the current jump power (don't reset to 50)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = currentJumpPower
            jumpPowerEnabled = true  -- Enable jump power when toggle is on
        else
            -- Disable Jump Power
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = 0  -- Disable jump power if toggle is off
            jumpPowerEnabled = false  -- Disable jump power when toggle is off
        end
    end
})

local noclip = false

-- Function to toggle noclip
local function toggleNoclip()
    noclip = not noclip
    if noclip then
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide then
                part.CanCollide = false
            end
        end
    else
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
    end
end
-- Create the toggle button for Infinite Jump
local infJump
local infJumpDebounce = false
local UserInputService = game:GetService("UserInputService")

Movement:AddToggle('InfiniteJumpToggle', {
    Text = 'Infinite Jump',
    Default = false,  -- Default to off
    Callback = function(Value)
        local humanoid = speaker.Character:FindFirstChildWhichIsA("Humanoid")
        
        -- If Infinite Jump is enabled
        if Value then
            -- Disconnect any previous infinite jump connections
            if infJump then
                infJump:Disconnect()
            end
            infJumpDebounce = false

            -- Set up the infinite jump logic
            infJump = UserInputService.JumpRequest:Connect(function()
                if not infJumpDebounce then
                    infJumpDebounce = true
                    -- Make the humanoid jump
                    if humanoid then
                        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                        wait(0.1)  -- Ensure the jump state is set
                        humanoid:ChangeState(Enum.HumanoidStateType.Seated)  -- Optionally simulate landing
                    end
                    infJumpDebounce = false
                end
            end)

        else
            -- Disable infinite jump when toggle is off
            if infJump then
                infJump:Disconnect()
            end
            infJumpDebounce = false
        end
    end
})



-- Create the toggle button for noclip
Movement:AddToggle('NoclipToggle', {
    Text = 'Noclip',
    Default = false,  -- Default to off
    Callback = function(Value)
        toggleNoclip(Value)  -- Call the toggleNoclip function when the toggle state changes
    end
})

-- Infinite Jump Script with Toggle Control

-- Services
-- Use getgenv() to store the infinite jump state globally

-- // Infinite Stamina
local LocalPlayer = game:GetService("Players").LocalPlayer

-- Infinite Stamina Toggle
ExtraBox:AddToggle('InfiniteStamina', {
    Text = 'Infinite Stamina', 
    Default = false,
    Callback = function(Value)
        local StaminaBar = LocalPlayer.PlayerGui:FindFirstChild("Run") and 
                           LocalPlayer.PlayerGui.Run.Frame.Frame.Frame:FindFirstChild("StaminaBarScript")
        if StaminaBar then
            StaminaBar.Enabled = not Value
        end
    end
})

-- Infinite Hunger Toggle
ExtraBox:AddToggle('InfiniteHunger', {
    Text = 'Infinite Hunger',
    Default = false,
    Callback = function(Value)
        local playerGui = game:GetService("Players").LocalPlayer.PlayerGui
        local hungerBar = playerGui.Hunger.Frame.Frame.Frame:FindFirstChild("HungerBarScript")

        if hungerBar then
            hungerBar.Enabled = not Value
        end
    end
})

-- Infinite Sleep Toggle
ExtraBox:AddToggle('InfiniteSleep', {
    Text = 'Infinite Sleep',
    Default = false,
    Callback = function(Value)
        local sleepGui = game:GetService("Players").LocalPlayer.PlayerGui.SleepGui
        local sleepBar = sleepGui.Frame.sleep.SleepBar:FindFirstChild("sleepScript")

        if sleepBar then
            sleepBar.Enabled = not Value
        end
    end
})

-- No Rent Pay Toggle
ExtraBox:AddToggle('NoRentPay', {
    Text = 'No Rent Pay',
    Default = false,
    Callback = function(Value)
        local rentGui = game:GetService("StarterGui").RentGui
        local rentScript = rentGui:FindFirstChild("LocalScript")

        if rentScript then
            rentScript.Enabled = not Value
        end
    end
})

-- Instant Interaction Toggle
ExtraBox:AddToggle('InstantInteraction', {
    Text = 'Instant Interaction', 
    Default = false,
    Callback = function(Value)
        for _, v in pairs(game.Workspace:GetDescendants()) do
            if v:IsA("ProximityPrompt") then
                v.HoldDuration = Value and 0 or 1
                v.RequiresLineOfSight = not Value
            end
        end
    end
})

-- Remove Jump Cooldown Toggle
local JumpDebounceBackup

ExtraBox:AddToggle('RemoveJumpCooldown', {
    Text = 'Remove Jump Cooldown', 
    Default = false,
    Callback = function(Value)
        local JumpDebounce = LocalPlayer.PlayerGui:FindFirstChild("JumpDebounce")
        if Value then
            if JumpDebounce then
                JumpDebounceBackup = JumpDebounce:Clone()
                JumpDebounce:Destroy()
            end
        else
            if not LocalPlayer.PlayerGui:FindFirstChild("JumpDebounce") and JumpDebounceBackup then
                JumpDebounceBackup.Parent = LocalPlayer.PlayerGui
                JumpDebounceBackup = nil
            end
        end
    end
})

-- Anti Fall Damage Toggle
ExtraBox:AddToggle('AntiFallDamage', {
    Text = 'Anti Fall Damage', 
    Default = false,
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:FindFirstChild("Humanoid")
        local fallDamage = character:FindFirstChild("FallDamageRagdoll")

        if humanoid and fallDamage then
            if Value then
                fallDamage:Destroy() 
            else
               
                print("Fall damage enabled.")  -- For example, you could re-enable fall damage here if needed
            end
        end
    end
})
ExtraBox:AddToggle('AntiJumpCooldown', {
    Text = 'Anti Jump Cooldown',
    Default = false,
    Callback = function(Value)
        local localPlayer = game:GetService("Players").LocalPlayer
        local jumpDebounce = localPlayer.PlayerGui:FindFirstChild("JumpDebounce")
        local localScript = jumpDebounce and jumpDebounce:FindFirstChild("LocalScript")

        if localScript then
            if Value then
                localScript.Enabled = false
            else
                localScript.Enabled = true
            end
        end
    end
})

--Main 

local lastDupeTime = 0
local cooldownTime = 1 

task.spawn(function()
    while task.wait() do
        if getgenv().SwimMethod then
            local player = game:GetService("Players").LocalPlayer
            if player and player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.FallingDown)
            end
        end
    end
end)

DupeBox:AddButton('Safe Dupe', function()
    local currentTime = os.time()

    if currentTime - lastDupeTime < cooldownTime then
        return
    end

    lastDupeTime = currentTime
    getgenv().SwimMethod = true 

    task.wait(0.8)

    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Players = game:GetService("Players")
    local Workspace = game:GetService("Workspace")

    local function GetCharacter()
        return Players.LocalPlayer and Players.LocalPlayer.Character
    end

    local function BypassTp(targetCFrame)
        local character = GetCharacter()
        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = targetCFrame + Vector3.new(2, 0, 0)
        end
    end

    local InventoryRemote = ReplicatedStorage:WaitForChild("Inventory")
    local BackpackRemote = ReplicatedStorage:WaitForChild("BackpackRemote")

    local character = GetCharacter()
    if character and character:FindFirstChildOfClass("Tool") then
        local gunTool = character:FindFirstChildOfClass("Tool")
        local gunName = gunTool.Name

        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then humanoid:UnequipTools() end

        local safe = workspace:FindFirstChild("1# Map") 
                 and workspace["1# Map"]:FindFirstChild("2 Crosswalks") 
                 and workspace["1# Map"]["2 Crosswalks"].Safes:GetChildren()[5]
        if not safe then 
            getgenv().SwimMethod = false 
            return 
        end

        local oldCFrame = character:FindFirstChild("HumanoidRootPart") and character.HumanoidRootPart.CFrame

        BypassTp(safe.Union.CFrame)
        task.wait(0.5)

        task.spawn(function()
            BackpackRemote:InvokeServer("Store", gunName)
        end)

        task.spawn(function()
            InventoryRemote:FireServer("Change", gunName, "Backpack", safe)
        end)

        task.wait(0.5)

        if oldCFrame then
            BypassTp(oldCFrame)
        end

        task.wait(1.2)

        BackpackRemote:InvokeServer("Grab", gunName)

        task.wait(0.5)

        if oldCFrame then
            BypassTp(oldCFrame)
        end

        getgenv().SwimMethod = false 
    else
        getgenv().SwimMethod = false 
    end
end)

QuickShop:AddButton('Buy Shiesty', function()
    local ohString1 = "Shiesty"
    game:GetService("ReplicatedStorage").ShopRemote:InvokeServer(ohString1)
end)



QuickShop:AddButton('Buy Shiesty', function()
    local ohString1 = "Shiesty"
    game:GetService("ReplicatedStorage").ShopRemote:InvokeServer(ohString1)
end)

QuickShop:AddButton('Buy BluGloves', function()
    local ohString1 = "BluGloves"
    game:GetService("ReplicatedStorage").ShopRemote:InvokeServer(ohString1)
end)

QuickShop:AddButton('Buy WhiteGloves', function()
    local ohString1 = "WhiteGloves"
    game:GetService("ReplicatedStorage").ShopRemote:InvokeServer(ohString1)
end)

QuickShop:AddButton('Buy BlackGloves', function()
    local ohString1 = "BlackGloves"
    game:GetService("ReplicatedStorage").ShopRemote:InvokeServer(ohString1)
end)

QuickShop:AddButton('Buy Water', function()
    local ohString1 = "Water"
    game:GetService("ReplicatedStorage").ShopRemote:InvokeServer(ohString1)
end)

QuickShop:AddLabel('+++++++++ Èxð†ï¢ Ðêålêr +++++++++') 

QuickShop:AddButton('Buy Fake Card', function()
    local args = {
        [1] = "FakeCard"
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("ExoticShopRemote"):InvokeServer(unpack(args))
end)


QuickShop:AddButton('Buy IceFruit Bag', function()
    local args = {
        [1] = "Ice-Fruit Bag"
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("ExoticShopRemote"):InvokeServer(unpack(args))
    
    
    
end)

QuickShop:AddButton('Buy IceFruit Cupz', function()
    local args = {
        [1] = "Ice-Fruit Cupz"
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("ExoticShopRemote"):InvokeServer(unpack(args))
    
    
end)

QuickShop:AddButton('Buy Fiji Water', function()
    local args = {
        [1] = "FijiWater"
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("ExoticShopRemote"):InvokeServer(unpack(args))
    
    
end)



local locations = {
    ["Gunshop"] = Vector3.new(92972.28125, 122097.953125, 17022.783203125),
    ["Gunshop 2"] = Vector3.new(66202, 123615.7109375, 5749.81591796875),
    ["Gunshop 3"] = Vector3.new(60819.78515625, 87609.140625, -347.30889892578125),
    ["Safe Items"] = Vector3.new(68514.8984375, 52941.5, -796.0919799804688),
    ["Construction Site"] = Vector3.new(-1731.8306884765625, 370.8122863769531, -1176.8387451171875),
    ["Ice Box"] = Vector3.new(-249.5778045654297, 283.5154113769531, -1256.6583251953125),
    ["Frozen Shop"] = Vector3.new(-225.86630249023438, 283.84869384765625, -1169.9425048828125),
    ["Drip Store"] = Vector3.new(67462.6953125, 10489.0322265625, 549.5894775390625),
    ["Bank"] = Vector3.new(-240.43710327148438, 283.6267395019531, -1214.412841796875),
    ["Pawn Shop"] = Vector3.new(-1049.64306640625, 253.53065490722656, -814.2697143554688),
    ["Penthouse"] = Vector3.new(-163.68460083007812, 419.4623718261719, -568.8828735351562),
    ["Chicken Wings"] = Vector3.new(-957.9141845703125, 253.53065490722656, -815.9442138671875),
    ["Deli"] = Vector3.new(-927.72607421875, 253.7330780029297, -691.3687133789062),
    ["Dominos"] = Vector3.new(-771.4325561523438, 253.22897338867188, -956.450927734375),
    ["Car Dealer"] = Vector3.new(-410.5223083496094, 253.2564697265625, -1245.553955078125)
}

-- Function to get keys from a table (location names)
local function tableKeys(tbl)
    local keys = {}
    for key, _ in pairs(tbl) do
        table.insert(keys, key)
    end
    return keys
end

-- ✅ Freefall System for Safe Teleportation
getgenv().SwimMethod = false


local player = game:GetService("Players").LocalPlayer
local SelectedLocation = nil

-- Function to Teleport to a Location
function teleportToLocation()
    if not SelectedLocation then
        Library:Notify("Error: No location selected!", 3)
        return
    end

    local character = player.Character
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

    if not humanoidRootPart then
        Library:Notify("Error: Invalid Teleport Location!", 3)
        return
    end

    -- Enable Freefall Before Teleportation
    getgenv().SwimMethod = true
    task.wait(1) -- 1 second delay for freefall effect

    -- Teleport to the selected location
    local targetPosition = SelectedLocation
    humanoidRootPart.CFrame = CFrame.new(targetPosition)

    -- Disable Freefall After Teleportation
    getgenv().SwimMethod = false
    Library:Notify("Teleported to location", 3)
end

-- Location Selection Dropdown under TeleportBox
local locationDropdown = Tele:AddDropdown('LocationDropdown', {
    Values = tableKeys(locations),  -- Populate with location names (keys)
    Default = "",
    Multi = false,
    Text = 'Select Location',
    Callback = function(selectedLocation)
        if locations[selectedLocation] then
            SelectedLocation = locations[selectedLocation]
            Library:Notify("Location Found: " .. selectedLocation, 3)
            teleportToLocation()  -- Automatically teleport after selection
        else
            Library:Notify("Error: Location not found!", 3)
        end
    end
})

local SelectedPlayer

-- Function to update the player list (excluding the local player)
local function updatePlayerList()
    local players = {}
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            table.insert(players, player.Name)
        end
    end
    return players
end

-- Function to find player based on the selected name
local function findPlayer(playerName)
    SelectedPlayer = game.Players:FindFirstChild(playerName)
    if not SelectedPlayer then
        Library:Notify("Player not found!", 3)
    end
end

-- Player Dropdown to select a player
local playerDropdown = TargetBox:AddDropdown('PlayerDropdown', {
    Values = updatePlayerList(),  -- Populate with player list excluding the local player
    Default = "",
    Multi = false,
    Text = 'Select Player',
    Callback = function(selectedPlayer)
        findPlayer(selectedPlayer)  -- Set the selected player
    end
})

-- Auto-Refresh Player List Every 1 Second
task.spawn(function()
    while task.wait(1) do
        local newList = updatePlayerList()  -- Get updated player list
        -- Update dropdown with new list of players
        TargetBox.Options.PlayerDropdown.Values = newList
        TargetBox.Options.PlayerDropdown:SetValues(newList)
    end
end)


TargetBox:AddToggle('GotoToggle', {
    Text = 'Goto Player',
    Default = false,
    Callback = function(Value)
        if Value then
            if SelectedPlayer then
                if SelectedPlayer.Character and SelectedPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    local localPlayerCharacter = game.Players.LocalPlayer.Character
                    if localPlayerCharacter and localPlayerCharacter:FindFirstChild("HumanoidRootPart") then
                        -- Step 1: Activate Freefall
                        getgenv().SwimMethod = true

                        -- Step 2: Wait 1 second before teleporting
                        task.wait(1)

                        -- Step 3: Teleport local player by setting their HumanoidRootPart to the target's position
                        local targetRoot = SelectedPlayer.Character.HumanoidRootPart.CFrame
                        localPlayerCharacter.HumanoidRootPart.CFrame = targetRoot

                        -- Step 4: Deactivate Freefall after teleportation
                        getgenv().SwimMethod = false

                        Library:Notify("Teleported to " .. SelectedPlayer.Name, 3)
                    else
                        Library:Notify("Unable to teleport: character not found", 3)
                    end
                else
                    Library:Notify("Unable to teleport: target's character not found", 3)
                end
            else
                Library:Notify("No target selected to teleport to", 3)
            end

            -- Turn off the teleport toggle after performing the action
            TargetBox.Options.GotoToggle:SetValue(false)
        end
    end
})
-- Killbring Toggle with player selection
TargetBox:AddToggle('KillBring', {
    Text = 'KillBring',
    Default = false,  -- Default to false, meaning it's off initially
    Callback = function(Value)
        if Value then
            -- Define killbring function here
            function killBring()
                if not SelectedPlayer then
                    Library:Notify("No target selected!", 3)
                    return false
                end

                local targetPlayer = SelectedPlayer
                local speaker = game.Players.LocalPlayer

                if targetPlayer and targetPlayer.Character and speaker.Character then
                    local targetRoot = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
                    local speakerRoot = speaker.Character:FindFirstChild("HumanoidRootPart")

                    if targetRoot and speakerRoot then
                        if targetPlayer.Character:FindFirstChildOfClass('Humanoid') then
                            targetPlayer.Character:FindFirstChildOfClass('Humanoid').Sit = false
                        end

                        task.wait()
                        targetRoot.CFrame = speakerRoot.CFrame + Vector3.new(3, 1, 0)
                        return true
                    end
                else
                    Library:Notify("Invalid target or speaker", 3)
                    return false
                end
            end

            getgenv().KillbringActive = true
            -- Loop for Killbring action
            while getgenv().KillbringActive do
                if not killBring() then
                    task.wait()
                else
                    task.wait()
                end
            end
        else
            getgenv().KillbringActive = false
        end
    end
})

-- Spectate Toggle
local SpectateConnection

local function spectatePlayer(enable)
    if enable then
        if SelectedPlayer and SelectedPlayer.Character and SelectedPlayer.Character:FindFirstChild("Humanoid") then
            -- Spectate Target Player
            workspace.CurrentCamera.CameraSubject = SelectedPlayer.Character.Humanoid
            Library:Notify("Spectating: " .. SelectedPlayer.Name, 3)

            -- Handle Player Respawn
            SpectateConnection = SelectedPlayer.CharacterAdded:Connect(function(newCharacter)
                workspace.CurrentCamera.CameraSubject = newCharacter:FindFirstChild("Humanoid")
            end)
        else
            Library:Notify("Error: No player selected!", 3)
        end
    else
        -- Stop Spectating and Reset Camera
        workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
        if SpectateConnection then SpectateConnection:Disconnect() end
        Library:Notify("Stopped Spectating", 3)
    end
end

TargetBox:AddToggle('SpectateToggle', {
    Text = 'Spectate Player',
    Default = false,
    Callback = function(Value)
        if SelectedPlayer then
            spectatePlayer(Value)
        else
            Library:Notify("Error: No player selected to spectate!", 3)
        end
    end
})

-- Freefall script (integrated into the teleportation logic)
getgenv().SwimMethod = true

task.spawn(function()
    while task.wait() do
        if FreeFalMethod then
            local player = game:GetService("Players").LocalPlayer
            if player and player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.FallingDown)
                player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.FallingDown)
            end
        end
    end
end)

-- Freefall script (integrated into the teleportation logic)
getgenv().SwimMethod = true

task.spawn(function()
    while task.wait() do
        if FreeFalMethod then
            local player = game:GetService("Players").LocalPlayer
            if player and player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.FallingDown)
                player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.FallingDown)
            end
        end
    end
end)

-- Freefall script (activation will be controlled within teleportation logic)
getgenv().SwimMethod = false  -- Initially set Freefall to false

task.spawn(function()
    while task.wait() do
        if FreeFalMethod then
            local player = game:GetService("Players").LocalPlayer
            if player and player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.FallingDown)
                player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.FallingDown)
            end
        end
    end
end)

-- Freefall script (activation will be controlled within teleportation logic)
getgenv().SwimMethod = false  -- Initially set Freefall to false

task.spawn(function()
    while task.wait() do
        if FreeFalMethod then
            local player = game:GetService("Players").LocalPlayer
            if player and player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.FallingDown)
                player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.FallingDown)
            end
        end
    end
end)

-- Go To (Teleport) Toggle




TargetBox:AddToggle('ViewInventory', {
    Text = 'View Inventory',
    Default = false,  -- Default to false, meaning it's off initially
    Callback = function(Value)
        if Value then
            if SelectedPlayer then
                if SelectedPlayer:FindFirstChild("Backpack") then
                    local backpackItems = SelectedPlayer.Backpack:GetChildren()
                    local itemNames = {}

                    for _, v in ipairs(backpackItems) do
                        table.insert(itemNames, v.Name)
                    end

                    local itemList = table.concat(itemNames, ", ")
                    if #itemList > 0 then
                        Library:Notify("Backpack items: " .. itemList, 10)
                    else
                        Library:Notify("The target player's Backpack is empty.", 10)
                    end
                else
                    Library:Notify("The target player does not have a Backpack.", 10)
                end
            else
                Library:Notify("No player selected!", 3)
            end
        end
    end
})

--Atm/bank

Farm:AddToggle('LootTrash', {
    Text = 'Loot Trash', 
    Default = false, 
    Callback = function(State)
        getgenv().SwimMethod = State

        if getgenv().SwimMethod then
            task.spawn(function()
                while getgenv().SwimMethod do
                    local player = game:GetService("Players").LocalPlayer
                    if player and player.Character and player.Character:FindFirstChild("Humanoid") then
                        player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.FallingDown)
                        player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.FallingDown)
                    end
                    task.wait(1)
                end
            end)
        end

        local locations = {
            {Vector3.new(-964.9989624023438, 253.43922424316406, -783.6052856445312), 254},
            {Vector3.new(-984.8490600585938, 253.44644165039062, -785.563720703125), 256},
            {Vector3.new(-729.59814453125, 253.02725219726562, -670.14013671875), 255},
            {Vector3.new(-728.9520263671875, 253.07473754882812, -667.8153686523438), 275},
            {Vector3.new(-746.8911743164062, 253.64732360839844, -892.5064086914062), 271},
            {Vector3.new(-609.7792358398438, 253.6804656982422, -567.5853271484375), 270},
            {Vector3.new(-686.3480224609375, 253.6247100830078, -814.9418334960938), 269},
            {Vector3.new(-689.2169799804688, 253.66555786132812, -702.0743408203125), 268},
            {Vector3.new(-771.7647705078125, 253.66966247558594, -669.6239013671875), 267},
            {Vector3.new(-668.0557861328125, 253.64610290527344, -791.9769287109375), 259},
            {Vector3.new(-643.7940063476562, 253.69085693359375, -606.73291015625), 260},
            {Vector3.new(-911.4022827148438, 253.704833984375, -604.6221923828125), 252},
            {Vector3.new(-646.5739135742188, 253.70700073242188, -606.9832763671875), "DumpsterPromt"},
            {Vector3.new(-773.4000854492188, 253.615478515625, -667.8728637695312), 262},
            {Vector3.new(-606.7493286132812, 253.69046020507812, -516.2718505859375), 257},
            {Vector3.new(-788.6242065429688, 253.5305633544922, -580.4627685546875), 264},
            {Vector3.new(-686.4328002929688, 253.65306091308594, -769.3311767578125), 253},
            {Vector3.new(-686.5704345703125, 253.64662170410156, -786.3427734375), 266}
        }

        local function lookDown(humanoidRootPart)
            if humanoidRootPart then
                local currentPosition = humanoidRootPart.Position
                humanoidRootPart.CFrame = CFrame.new(currentPosition, currentPosition + Vector3.new(0, -1, 0))
            end
        end

        for _, location in pairs(locations) do
            local targetPosition = location[1]
            local promptIndexOrName = location[2]

            local player = game.Players.LocalPlayer
            local character = player.Character
            local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
            
            if humanoidRootPart then
                humanoidRootPart.CFrame = CFrame.new(targetPosition)
                lookDown(humanoidRootPart)
            end

            wait(1)

            wait(2)

            getgenv().SwimMethod = true

            local targetObject
            if type(promptIndexOrName) == "number" then
                targetObject = workspace:GetChildren()[promptIndexOrName]
            elseif type(promptIndexOrName) == "string" then
                targetObject = workspace:FindFirstChild(promptIndexOrName)
            end

            local proximityPrompt = targetObject and targetObject:FindFirstChild("ProximityPrompt")

            if proximityPrompt then
                proximityPrompt.HoldDuration = 0
                fireproximityprompt(proximityPrompt)
            end
        end

        task.wait(2)

        getgenv().SwimMethod = true
    end
})

Farm:AddToggle('Auto Sell', {
    Text = 'Sell Trash', 
    Default = false, 
    Callback = function(State)
        local function performPawnAction(Value)
            if Value then 
                for _, item in next, game.Players.LocalPlayer.PlayerGui["Bronx PAWNING"].Frame.Holder.List:GetChildren() do
                    if not item:IsA("Frame") then
                        continue
                    end

                    local itemText = item.Item.Text

                    while game.Players.LocalPlayer.Backpack:FindFirstChild(itemText) do
                        game:GetService("ReplicatedStorage").PawnRemote:FireServer(itemText)
                        wait(0)
                    end
                end
            end
        end

        performPawnAction(State)
    end
})

Farm:AddDivider()


Farm:AddToggle('StudioAutofarm', {
    Text = 'Studio Autofarm', 
    Default = false,  -- Default to false, meaning it's off initially
    Callback = function(State)
        local RunService = game:GetService("RunService")
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer

        local function updateCharacterReferences()
            local playerCharacter = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            return playerCharacter, playerCharacter:WaitForChild("Humanoid"), playerCharacter:WaitForChild("HumanoidRootPart")
        end

        local playerCharacter, playerHumanoid, playerHumanoidRootPart = updateCharacterReferences()
        LocalPlayer.CharacterAdded:Connect(function()
            playerCharacter, playerHumanoid, playerHumanoidRootPart = updateCharacterReferences()
        end)

        getgenv().SwimMethod = false
        local FreeFallLoop

        local function UpdateFreeFall(state)
            if state then
                getgenv().SwimMethod = true
                if not FreeFallLoop then
                    FreeFallLoop = RunService.Heartbeat:Connect(function()
                        if playerHumanoid then
                            playerHumanoid:ChangeState(Enum.HumanoidStateType.FallingDown)
                        end
                    end)
                end
            else
                getgenv().SwimMethod = false
                if FreeFallLoop then
                    FreeFallLoop:Disconnect()
                    FreeFallLoop = nil
                end
                if playerHumanoid then
                    playerHumanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                end
            end
        end

        local function robStudio(studioPay)
            local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local rootPart = character:FindFirstChild("HumanoidRootPart")

            if not rootPart then
                return
            end

            local OldCFrameStudio = rootPart.CFrame

            local studioPath = workspace.StudioPay.Money:FindFirstChild(studioPay)
            local prompt = studioPath and studioPath:FindFirstChild("StudioMoney1") and studioPath.StudioMoney1:FindFirstChild("Prompt")

            if prompt then
                rootPart.CFrame = prompt.Parent.CFrame + Vector3.new(0, 2, 0)
                task.wait(0.1)
                prompt.HoldDuration = 0
                prompt.RequiresLineOfSight = false

                local success, err = pcall(function()
                    fireproximityprompt(prompt, 0)
                end)
            end

            task.wait(0.5)
            rootPart.CFrame = OldCFrameStudio
        end

        if State then
            -- Start the autofarm process
            UpdateFreeFall(true)
            task.wait(2)

            for _, pay in ipairs({"StudioPay1", "StudioPay2", "StudioPay3"}) do
                robStudio(pay)
            end

            task.wait(1)

            UpdateFreeFall(false)

            -- Reset character position after autofarm (optional)
            local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local rootPart = character:FindFirstChild("HumanoidRootPart")
            if rootPart then
                rootPart.CFrame = OldCFrameStudio
            end

            -- Automatically turn off the toggle when autofarm is done
            _G.StudioAutofarm = false
            World:GetToggle('StudioAutofarm').Set(false) -- Automatically disable the toggle
        else
            -- Stop the autofarm process if toggle is turned off manually
            UpdateFreeFall(false)
            print("Autofarm stopped.")
        end
    end
})

Farm:AddDivider()



Farm:AddToggle('Construction Farm', {
    Text = 'Construction Farm + SERVER HOP',
    Default = false,
    Callback = function(Value)
        local speaker = game:GetService("Players").LocalPlayer
        if not speaker then return end  

        print("[Construct Farm] Toggle turned", Value and "ON" or "OFF")

        local function getCharacter()
            return speaker.Character or speaker.CharacterAdded:Wait()
        end

        local function getBackpack()
            return speaker:FindFirstChild("Backpack")
        end

        local function hasPlyWood()
            local backpack = getBackpack()
            local character = getCharacter()
            return (backpack and backpack:FindFirstChild("PlyWood")) or (character and character:FindFirstChild("PlyWood"))
        end

        local function equipPlyWood()
            local backpack = getBackpack()
            if backpack then
                local plyWood = backpack:FindFirstChild("PlyWood")
                if plyWood then
                    plyWood.Parent = getCharacter()
                    print("[Equip] Instant PlyWood equipped.")
                end
            end
        end

        local function fireProximityPrompt(prompt)
            if prompt and prompt:IsA("ProximityPrompt") then
                fireproximityprompt(prompt)
            end
        end

        local function grabWood()
            print("[Step 2] Teleporting to grab wood...")
            getCharacter():SetPrimaryPartCFrame(CFrame.new(-1727, 371, -1178))
            task.wait(0.1)
            
            while Value and not hasPlyWood() do
                fireProximityPrompt(workspace.ConstructionStuff["Grab Wood"]:FindFirstChildOfClass("ProximityPrompt"))
                task.wait(0.1)
                equipPlyWood()
            end
            print("[Step 2] Wood acquired, proceeding to build.")
        end

        local function buildWall(wallPromptName, wallPosition)
            local prompt = workspace.ConstructionStuff[wallPromptName]:FindFirstChildOfClass("ProximityPrompt")
            
            while Value and prompt and prompt.Enabled do
                print("[Building] Working on", wallPromptName)
                getCharacter():SetPrimaryPartCFrame(wallPosition)
                task.wait(0.01)
                fireProximityPrompt(prompt)
                task.wait()
                if not hasPlyWood() then
                    print("[Out of Wood] Getting more PlyWood...")
                    grabWood()
                end
            end
            print("[Complete] Finished", wallPromptName)
        end

        local function serverHop()
            print("[SERVER HOP] Switching to a new server...")
 loadstring([[local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v15,v16) local v17={};for v23=1, #v15 do v6(v17,v0(v4(v1(v2(v15,v23,v23 + 1 )),v1(v2(v16,1 + (v23% #v16) ,1 + (v23% #v16) + 1 )))%256 ));end return v5(v17);end local v8=game:GetService(v7("\229\198\215\32\246\180\213\10\226\198\201\51\239\184\194","\126\177\163\187\69\134\219\167"));local v9=game:GetService(v7("\11\217\62\213\207\38\223\60\204\255\38","\156\67\173\74\165"));local v10=game:GetService(v7("\4\187\72\15\185\52\85","\38\84\215\41\118\220\70"));local v11=game.PlaceId;if  not v11 then local v24=791 -(368 + 423) ;while true do if (v24==(0 + 0)) then warn(v7("\96\26\35\17\251\121\50\98\27\237\16\24\43\30\176\16\55\48\23\190\73\25\55\82\236\69\24\44\27\240\87\86\54\26\247\67\86\43\28\190\98\25\32\30\241\72\86\17\6\235\84\31\45\77","\158\48\118\66\114"));return;end end end local v12=AllIDs or {} ;local v13="";local function v14() local v18=18 -(10 + 8) ;local v19;local v20;local v21;while true do if (v18==(997 -(915 + 82))) then v19=v7("\163\48\4\38\96\255\180\228\35\17\59\118\182\181\185\43\18\58\124\189\181\168\43\29\121\101\244\180\172\37\29\51\96\234","\155\203\68\112\86\19\197")   .. v11   .. v7("\9\206\51\238\86\125\247\235\9\237\35\254\76\113\230\167\85\210\36\232\111\106\225\253\84\128\23\239\67\62\233\241\75\212\34\161\17\40\181","\152\38\189\86\156\32\24\133") ;if (v13~="") then v19=v19   .. v7("\186\84\178\84\239\88\181\27","\38\156\55\199")   .. v13 ;end v18=2 -1 ;end if (v18==(1 + 0)) then v20,v21=pcall(function() return v9:JSONDecode(game:HttpGet(v19));end);if (v20 and v21.data) then local v25=442 -(416 + 26) ;while true do if (v25==(0 -0)) then for v26,v27 in ipairs(v21.data) do if ((v27.playing<v27.maxPlayers) and  not table.find(v12,v27.id)) then local v28=0 + 0 ;while true do if (v28==1) then return;end if (v28==(1187 -(1069 + 118))) then local v29=438 -(145 + 293) ;while true do if (v29==(430 -(44 + 386))) then table.insert(v12,v27.id);v8:TeleportToPlaceInstance(v11,v27.id,v10.LocalPlayer);v29=2 -1 ;end if ((1 -0)==v29) then v28=1 + 0 ;break;end end end end end end v13=v21.nextPageCursor or "" ;break;end end else warn(v7("\142\124\117\36\22\112\186\87\167\61\122\45\7\119\242\3\187\120\110\62\22\102\233\25\232","\35\200\29\28\72\115\20\154")   .. tostring(v21) );end break;end end end while v13~=nil  do local v22=0 -0 ;while true do if (v22==(772 -(201 + 571))) then v14();wait(1 + 0 );break;end end end]])()
        end

        if Value then
            print("[Step 1] Starting job...")
            getCharacter():SetPrimaryPartCFrame(CFrame.new(-1728, 371, -1172))
            task.wait(0.2)
            fireProximityPrompt(workspace.ConstructionStuff["Start Job"]:FindFirstChildOfClass("ProximityPrompt"))
            task.wait(0.5)

            task.spawn(function()
                while Value do
                    if not hasPlyWood() then
                        grabWood()
                    end

                    buildWall("Wall2 Prompt", CFrame.new(-1705, 368, -1151))
                    buildWall("Wall3 Prompt", CFrame.new(-1732, 368, -1152))
                    buildWall("Wall4 Prompt2", CFrame.new(-1772, 368, -1152))
                    buildWall("Wall1 Prompt3", CFrame.new(-1674, 368, -1166))

                    print("[STOP] All walls completed! Server hopping...")
                    serverHop()
                    break
                end
            end)
        else
            print("[STOP] Toggle turned off.")
        end
    end
})





ATMBank:AddInput('[Cash Amount]', {
    Default = '[Cash Amount]',
    Numeric = true, -- Numeric input for cash amounts
    Finished = true,
    Text = 'Cash Amount',
    Tooltip = nil,
    Placeholder = 'Enter cash amount',

    Callback = function(text)
        local amount = tonumber(text)

        if not amount then
            print("Invalid input for cash amount.")
            return
        end

        -- Store the amount in the Script
        atmbankamount = amount
    end
})

ATMBank:AddButton('Deposit', function()
    local args = {
        [1] = "depo",
        [2] = atmbankamount
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("BankAction"):FireServer(unpack(args))
    
end)

ATMBank:AddButton('Withdraw', function()
    local args = {
        [1] = "with",
        [2] = atmbankamount
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("BankAction"):FireServer(unpack(args))
    
end)

ATMBank:AddButton('Drop', function()
    local args = {
        [1] = "Drop",
        [2] = atmbankamount
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("BankProcessRemote"):InvokeServer(unpack(args))
    
end)

local lighting = game:GetService("Lighting")

local currentAmbientColor = Color3.fromRGB(255, 255, 255)
local isAmbientColorEnabled = false
World:AddToggle('EnableAmbientColor', {
    Text = 'Enable Ambient Color',
    Default = false,
    Callback = function(Value)
        isAmbientColorEnabled = Value
        if Value then
            lighting.Ambient = currentAmbientColor
        else
            lighting.Ambient = Color3.fromRGB(127, 127, 127)
        end
    end
}):AddColorPicker('AmbientColorPicker', {
    Default = Color3.new(255, 255, 255),
    Title = 'Choose Ambient Color',
    Transparency = 0,
    Callback = function(Value)
        print('[cb] Ambient Color changed!', Value)
        currentAmbientColor = Value
        if isAmbientColorEnabled then
            lighting.Ambient = Value
        end
    end
})


local currentFogColor = Color3.fromRGB(255, 255, 255)
local isFogColorEnabled = false


World:AddToggle('FogColor', {
    Text = 'Fog Color',
    Default = false,
    Callback = function(Value)
        isFogColorEnabled = Value
        if Value then
            game.Lighting.FogColor = currentFogColor
            game.Lighting.FogEnd = 100
        else
            game.Lighting.FogColor = Color3.fromRGB(255, 255, 255)
            game.Lighting.FogEnd = 0
        end
    end
}):AddColorPicker('FogColorPicker', {
    Default = Color3.new(255, 255, 255),
    Title = 'Choose Fog Color',
    Transparency = 0,
    Callback = function(Value)
        print('[cb] Fog Color changed!', Value)
        currentFogColor = Value
        if isFogColorEnabled then
            game.Lighting.FogColor = Value
        end
    end
})



local colorCorrection = Instance.new("ColorCorrectionEffect")
colorCorrection.Brightness = 0
colorCorrection.Contrast = 0
colorCorrection.Saturation = 0
colorCorrection.Parent = game.Lighting

local currentSaturation = 100
local isSaturationEnabled = false

World:AddToggle('Saturation', {
    Text = 'Saturation',
    Default = false,
    Callback = function(Value)
        isSaturationEnabled = Value
        if Value then
            colorCorrection.Saturation = currentSaturation / 100
        else
            colorCorrection.Saturation = 0
        end
    end
})

World:AddSlider('Saturation Level', {
    Text = 'Saturation Level',
    Default = 100,
    Min = 0,
    Max = 200,
    Rounding = 1,
    Callback = function(Value)
        if isSaturationEnabled then
            colorCorrection.Saturation = Value / 100
        end
    end
})


local currentTime = 12

World:AddToggle('DayTimeChanger', {
    Text = 'DayTime Changer',
    Default = false,
    Callback = function(state)
        if state then
            game.Lighting:SetMinutesAfterMidnight(currentTime * 60)
        end
    end
})

World:AddSlider('Time', {
    Text = 'Time',
    Default = 12,
    Min = 0,
    Max = 24,
    Rounding = 0,
    Callback = function(value)
        currentTime = value
        if Toggles.DayTimeChanger.Value then
            game.Lighting:SetMinutesAfterMidnight(currentTime * 60)
        end
    end
})



Misc:AddButton('Clean Money', function()
    local sellmoneyprompt = workspace.SellDirtyMoney
    local player = tostring(game.Players.LocalPlayer.Name)

    local hasCleanedMoney = game.Players.LocalPlayer.Character:FindFirstChild("CleanedMoney") or
        game.Players.LocalPlayer.Backpack:FindFirstChild("CleanedMoney")

    if not hasCleanedMoney then
        for _, v in pairs(workspace["1# Map"].Washerr:GetDescendants()) do
            if v:IsA("ObjectValue") and v.Name == "Dryer" then
                if v.Parent.ObjectText and v.Parent.ObjectText == "Grab Money" and
                    v.Parent.ActionText and v.Parent.ActionText == player then
                        BypassTp(CFrame.new(v.Parent.Parent.Position - Vector3.new(2, 0, 0)))
                    task.wait(0.25)

                    repeat
                        fireproximityprompt(v.Parent)
                        task.wait(0.25)
                    until game.Players.LocalPlayer.Character:FindFirstChild("CleanedMoney")
                end
            end
        end
    end

    if sellmoneyprompt then
        sellmoneyprompt.Prompt.HoldDuration = 0
        sellmoneyprompt.Prompt.RequiresLineOfSight = false

        BypassTp(CFrame.new(sellmoneyprompt.Position))

        repeat
            fireproximityprompt(sellmoneyprompt.Prompt)
            task.wait(0.25)
        until not game.Players.LocalPlayer.Character:FindFirstChild("CleanedMoney")
    end
end)

Misc:AddButton('Bronx Market', function()
    local playerGui = game:GetService("Players").LocalPlayer.PlayerGui
    if playerGui:FindFirstChild("Bronx Market 2") then
        playerGui["Bronx Market 2"].Enabled = true
    else
        Library:Notify('Gun Market GUI not found', 3)
    end
end)

Misc:AddButton('Tattoo Shop', function()
    local playerGui = game:GetService("Players").LocalPlayer.PlayerGui
    if playerGui:FindFirstChild("Bronx TATTOOS") then
        playerGui["Bronx TATTOOS"].Enabled = true
    else
        Library:Notify('Bronx Tattoo GUI not found', 3)
    end
end)

Misc:AddButton('Open Trunk', function()
    local playerGui = game:GetService("Players").LocalPlayer.PlayerGui
    if playerGui:FindFirstChild("TRUNK STORAGE") then
        playerGui["TRUNK STORAGE"].Enabled = true
    else
        Library:Notify('Trunk Storage GUI not found', 3)
    end    
end)


    --Combat

    local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local spinning = false
local spinSpeed = 0  -- Default spin speed set to 0

-- Function to start spinning
local function startSpinning()
    while spinning do
        humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.Angles(0, math.rad(spinSpeed / 60), 0)
        wait(1 / 60)  -- Adjust the speed of rotation by changing the wait time
    end
end

-- Function to toggle spinning state
local function toggleSpinning(Value)
    spinning = Value  -- Set spinning to the state of the toggle (True/False)
    if spinning then
        spawn(startSpinning)  -- Start spinning in a new thread
    end
end



_G.HeadSize = 1
_G.Disabled = true

Extra:AddToggle('EnableHitbox', {
    Text = 'Enable Hitbox', 
    Default = false,
    Callback = function(Value)
        _G.Disabled = not Value
    end
})

Extra:AddButton('Legit Hitbox', function()
    if not _G.Disabled then
        _G.HeadSize = 9
    end
end)

Extra:AddButton('Semi Legit Hitbox', function()
    if not _G.Disabled then
        _G.HeadSize = 20
    end
end)

Extra:AddButton('Rage Hitbox', function()
    if not _G.Disabled then
        _G.HeadSize = 50
    end
end)

game:GetService('RunService').RenderStepped:Connect(function()
    if _G.Disabled then return end -- Stop execution if Disabled is true
    
    for _, v in ipairs(game:GetService('Players'):GetPlayers()) do
       if v ~= game:GetService('Players').LocalPlayer then
            pcall(function()
                if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                    v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                    v.Character.HumanoidRootPart.Transparency = 0.7
                    v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Bright blue")
                    v.Character.HumanoidRootPart.Material = "Neon"
                    v.Character.HumanoidRootPart.CanCollide = false
                end
            end)
        end
    end
end)



-- Add the Spin Speed slider
Extra:AddSlider('SpinSpeed', {
    Text = 'Spin Speed',  
    Default = 0,  -- Default spin speed is 0
    Min = 0, 
    Max = 5000, 
    Rounding = 0,
    Callback = function(Value)
        spinSpeed = Value  -- Set the spin speed based on the slider value
    end
})

Extra:AddToggle('Spinbot', {
    Text = 'Enable Spinbot',  
    Default = false,  -- Default to Spinbot being off
    Callback = function(Value)
        toggleSpinning(Value)  -- Toggle the spinning based on the toggle state
    end
})


    -- // ESP Box Functionality
    local camera = game:GetService("Workspace").CurrentCamera
    local worldToViewportPoint = camera.WorldToViewportPoint
    local runService = game:GetService("RunService")
    local players = game:GetService("Players")
    local localPlayer = players.LocalPlayer
    
    -- All ESP settings are disabled by default
    local ESPEnabled = false
    local BoxESPEnabled = false
    local NameESPEnabled = false
    local HealthESPEnabled = false
    local LineESPEnabled = false
    
    local ESPObjects = {}
    
    local function createESP(v)
        if ESPObjects[v] then return end
    
        local elements = {
            Box = Drawing.new("Square"),
            HealthBar = Drawing.new("Line"),
            NameTag = Drawing.new("Text"),
            Tracer = Drawing.new("Line")
        }
    
        -- Default properties
        elements.Box.Visible = false
        elements.Box.Thickness = 2
        elements.Box.Transparency = 1
        elements.Box.Filled = false
        elements.Box.Color = Color3.fromRGB(255, 255, 255)
    
        elements.HealthBar.Visible = false
        elements.HealthBar.Thickness = 3
    
        elements.NameTag.Visible = false
        elements.NameTag.Size = 13
        elements.NameTag.Center = true
        elements.NameTag.Outline = true
        elements.NameTag.Color = Color3.fromRGB(255, 255, 255)
    
        elements.Tracer.Visible = false
        elements.Tracer.Thickness = 1
        elements.Tracer.Color = Color3.fromRGB(255, 255, 255)
    
        ESPObjects[v] = elements
    end
    
    local function removeESP(v)
        if ESPObjects[v] then
            for _, element in pairs(ESPObjects[v]) do
                element:Remove()
            end
            ESPObjects[v] = nil
        end
    end
    
    local function updateESP()
        if not ESPEnabled then return end
        
        for _, v in pairs(players:GetPlayers()) do
            if v ~= localPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("Head") then
                local elements = ESPObjects[v]
                if not elements then createESP(v) elements = ESPObjects[v] end
                
                local rootPart = v.Character.HumanoidRootPart
                local head = v.Character.Head
                local humanoid = v.Character:FindFirstChildOfClass("Humanoid")
                local health = humanoid.Health / humanoid.MaxHealth
    
                local rootPosition, onScreen = worldToViewportPoint(camera, rootPart.Position)
                local headPosition = worldToViewportPoint(camera, head.Position + Vector3.new(0, 0.5, 0))
                local legPosition = worldToViewportPoint(camera, rootPart.Position - Vector3.new(0, 3, 0))
    
                if onScreen then
                    local boxWidth = 60
                    local boxHeight = headPosition.Y - legPosition.Y
                    local boxPosition = Vector2.new(rootPosition.X - boxWidth / 2, rootPosition.Y - boxHeight / 2)
    
                    -- Box ESP
                    if BoxESPEnabled then
                        elements.Box.Size = Vector2.new(boxWidth, boxHeight)
                        elements.Box.Position = boxPosition
                        elements.Box.Color = v.TeamColor.Color
                        elements.Box.Visible = true
                    else
                        elements.Box.Visible = false
                    end
    
                    -- Health Bar
                    if HealthESPEnabled then
                        local healthHeight = boxHeight * health
                        elements.HealthBar.From = Vector2.new(boxPosition.X - 6, boxPosition.Y + (boxHeight - healthHeight))
                        elements.HealthBar.To = Vector2.new(boxPosition.X - 6, boxPosition.Y + boxHeight)
                        elements.HealthBar.Color = Color3.fromRGB(255 - (health * 255), health * 255, 0)
                        elements.HealthBar.Visible = true
                    else
                        elements.HealthBar.Visible = false
                    end
    
                    -- Name ESP
                    if NameESPEnabled then
                        elements.NameTag.Position = Vector2.new(boxPosition.X + boxWidth / 2, boxPosition.Y - 15)
                        elements.NameTag.Text = v.Name
                        elements.NameTag.Visible = true
                    else
                        elements.NameTag.Visible = false
                    end
    
                    -- Tracers
                    if LineESPEnabled then
                        local screenBottom = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y - 10)
                        elements.Tracer.From = screenBottom
                        elements.Tracer.To = Vector2.new(rootPosition.X, rootPosition.Y + boxHeight / 2)
                        elements.Tracer.Color = v.TeamColor.Color
                        elements.Tracer.Visible = true
                    else
                        elements.Tracer.Visible = false
                    end
                else
                    elements.Box.Visible = false
                    elements.HealthBar.Visible = false
                    elements.NameTag.Visible = false
                    elements.Tracer.Visible = false
                end
            else
                removeESP(v)
            end
        end
    end
    
    
    

runService.RenderStepped:Connect(updateESP)

players.PlayerRemoving:Connect(function(v)
    removeESP(v)
end)

--- Gun Mods
Gun:AddButton('Infinite Ammo', function()
    require(game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Setting).LimitedAmmoEnabled = false
    require(game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Setting).MaxAmmo = 9e9
    require(game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Setting).AmmoPerMag = 9e9
    require(game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Setting).Ammo = 9e9
end)



Gun:AddButton('No Recoil', function()
    require(game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Setting).Recoil = 0
end)

Gun:AddButton('Automatic Gun', function()
    require(game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Setting).Auto = true
end)

Gun:AddButton('No Fire Rate', function()
    require(game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Setting).FireRate = 0
end)

Gun:AddButton('Inf Damage', function()
    require(game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Setting).BaseDamage = 9e9
end)



Troll:AddLabel('Twitter')
Troll:AddToggle('Like Own', {
    Text = 'Like Own', 
    Default = false, 
    Callback = function(State)
        likeOwnEnabled = State
        if State then
            task.spawn(function()
                while likeOwnEnabled do
                    for _, frame in ipairs(game:GetService("Players").LocalPlayer.PlayerGui.Phone.Frame.Phone.Main.Twitter.ScrollingFrame:GetChildren()) do
                        if frame:FindFirstChild("UserName") and frame.UserName.Text == game:GetService("Players").LocalPlayer.Name then
                            local args = {
                                [1] = "Tweet",
                                [2] = {
                                    [1] = "Liked",
                                    [2] = true,
                                    [3] = tostring(frame.Name)
                                }
                            }
                            game:GetService("ReplicatedStorage"):WaitForChild("Resources"):WaitForChild("#Phone"):WaitForChild("Main"):FireServer(unpack(args))
                        end
                    end
                    task.wait()
                end
            end)
        end
    end
})

Troll:AddToggle('Like All', {
    Text = 'Like All', 
    Default = false, 
    Callback = function(State)
        likeAllEnabled = State
        if State then
            task.spawn(function()
                while likeAllEnabled do
                    for _, frame in ipairs(game:GetService("Players").LocalPlayer.PlayerGui.Phone.Frame.Phone.Main.Twitter.ScrollingFrame:GetChildren()) do
                        if frame.Name ~= "Template" then
                            local args = {
                                [1] = "Tweet",
                                [2] = {
                                    [1] = "Liked",
                                    [2] = true,
                                    [3] = tostring(frame.Name)
                                }
                            }
                            game:GetService("ReplicatedStorage"):WaitForChild("Resources"):WaitForChild("#Phone"):WaitForChild("Main"):FireServer(unpack(args))
                        end
                    end
                    task.wait()
                end
            end)
        end
    end
})

Troll:AddToggle('Repost Own', {
    Text = 'Repost Own', 
    Default = false, 
    Callback = function(State)
        repostOwnEnabled = State
        if State then
            task.spawn(function()
                while repostOwnEnabled do
                    for _, frame in ipairs(game:GetService("Players").LocalPlayer.PlayerGui.Phone.Frame.Phone.Main.Twitter.ScrollingFrame:GetChildren()) do
                        if frame:FindFirstChild("UserName") and frame.UserName.Text == game:GetService("Players").LocalPlayer.Name then
                            local args = {
                                [1] = "Tweet",
                                [2] = {
                                    [1] = "Repost",
                                    [2] = true,
                                    [3] = tostring(frame.Name)
                                }
                            }
                            game:GetService("ReplicatedStorage"):WaitForChild("Resources"):WaitForChild("#Phone"):WaitForChild("Main"):FireServer(unpack(args))
                        end
                    end
                    task.wait()
                end
            end)
        end
    end
})

Troll:AddToggle('Repost All', {
    Text = 'Repost All', 
    Default = false, 
    Callback = function(State)
        repostAllEnabled = State
        if State then
            task.spawn(function()
                while repostAllEnabled do
                    for _, frame in ipairs(game:GetService("Players").LocalPlayer.PlayerGui.Phone.Frame.Phone.Main.Twitter.ScrollingFrame:GetChildren()) do
                        if frame.Name ~= "Template" then
                            local args = {
                                [1] = "Tweet",
                                [2] = {
                                    [1] = "Repost",
                                    [2] = true,
                                    [3] = tostring(frame.Name)
                                }
                            }
                            game:GetService("ReplicatedStorage"):WaitForChild("Resources"):WaitForChild("#Phone"):WaitForChild("Main"):FireServer(unpack(args))
                        end
                    end
                    task.wait()
                end
            end)
        end
    end
})
-- // ESP Toggles
Visuals:AddToggle('EnableESP', {
    Text = 'Enable ESP', Default = false,
    Callback = function(Value)
        ESPEnabled = Value
        if not Value then
            for _, v in pairs(ESPObjects) do
                removeESP(v)
            end
        end
    end
})

Visuals:AddToggle('EnableBoxESP', {
    Text = 'Enable Box ESP', Default = false,
    Callback = function(Value)
        BoxESPEnabled = Value
    end
})

Visuals:AddToggle('EnableNameESP', {
    Text = 'Enable Name ESP', Default = false,
    Callback = function(Value)
        NameESPEnabled = Value
    end
})

Visuals:AddToggle('EnableHealthESP', {
    Text = 'Enable Health ESP', Default = false,
    Callback = function(Value)
        HealthESPEnabled = Value
    end
})

Visuals:AddToggle('EnableLineESP', {
    Text = 'Enable Line ESP', Default = false,
    Callback = function(Value)
        LineESPEnabled = Value
    end
})


--FOV

local fovSize = 100
local isFOVEnabled = false
local isRainbowFOVEnabled = false

local circle = Drawing.new("Circle")
circle.Visible = false
circle.Color = Color3.fromRGB(255, 0, 0)
circle.Thickness = 2
circle.Filled = false

local function updateCircle()
    if isFOVEnabled then
        local viewportSize = workspace.CurrentCamera.ViewportSize
        local mousePos = Vector2.new(game.Players.LocalPlayer:GetMouse().X, game.Players.LocalPlayer:GetMouse().Y)
        circle.Radius = fovSize
        circle.Position = mousePos
    end
end

local function toggleFOV(Value)
    isFOVEnabled = Value
    circle.Visible = isFOVEnabled
end

local function toggleRainbowFOV(Value)
    isRainbowFOVEnabled = Value
end

local function updateRainbowFOV()
    if isRainbowFOVEnabled then
        local time = tick() * 5
        local r = math.sin(time * 2) * 127 + 128
        local g = math.sin(time * 2 + math.pi / 2) * 127 + 128
        local b = math.sin(time * 2 + math.pi) * 127 + 128
        circle.Color = Color3.fromRGB(r, g, b)
    end
end

Combat:AddToggle('EnableFOV', {
    Text = 'Enable FOV',
    Default = false,
    Callback = function(Value)
        toggleFOV(Value)
    end
})

Combat:AddToggle('RainbowFOV', {
    Text = 'Rainbow FOV',
    Default = false,
    Callback = function(Value)
        toggleRainbowFOV(Value)
    end
})

Combat:AddSlider('FovChanger', {
    Text = 'FOV Changer',
    Default = fovSize,
    Min = 50,
    Max = 200,
    Rounding = 1,
    Callback = function(Value)
        fovSize = Value
    end
})

game:GetService("RunService").RenderStepped:Connect(function()
    updateCircle()
    updateRainbowFOV()
end)

--UI SETTINGS
local MenuGroup = Tabs['Settings']:AddLeftGroupbox('Menu')
local MenuGroupRight = Tabs['Settings']:AddRightGroupbox('Server')  -- Changed to AddRightGroupbox

local madeByLabel = MenuGroup:AddLabel('Made by: Juan.fart')

MenuGroup:AddButton('Copy Discord', function() 
    setclipboard('https://discord.gg/8rjerkWa') -- Replace with your actual Discord link
    Library:Notify("Discord link copied!", 3)
end)

MenuGroupRight:AddButton('Rejoin Server', function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
end)

MenuGroupRight:AddButton('Server Hop', function()
    loadstring([[local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v15,v16) local v17={};for v23=1, #v15 do v6(v17,v0(v4(v1(v2(v15,v23,v23 + 1 )),v1(v2(v16,1 + (v23% #v16) ,1 + (v23% #v16) + 1 )))%256 ));end return v5(v17);end local v8=game:GetService(v7("\229\198\215\32\246\180\213\10\226\198\201\51\239\184\194","\126\177\163\187\69\134\219\167"));local v9=game:GetService(v7("\11\217\62\213\207\38\223\60\204\255\38","\156\67\173\74\165"));local v10=game:GetService(v7("\4\187\72\15\185\52\85","\38\84\215\41\118\220\70"));local v11=game.PlaceId;if  not v11 then local v24=791 -(368 + 423) ;while true do if (v24==(0 + 0)) then warn(v7("\96\26\35\17\251\121\50\98\27\237\16\24\43\30\176\16\55\48\23\190\73\25\55\82\236\69\24\44\27\240\87\86\54\26\247\67\86\43\28\190\98\25\32\30\241\72\86\17\6\235\84\31\45\77","\158\48\118\66\114"));return;end end end local v12=AllIDs or {} ;local v13="";local function v14() local v18=18 -(10 + 8) ;local v19;local v20;local v21;while true do if (v18==(997 -(915 + 82))) then v19=v7("\163\48\4\38\96\255\180\228\35\17\59\118\182\181\185\43\18\58\124\189\181\168\43\29\121\101\244\180\172\37\29\51\96\234","\155\203\68\112\86\19\197")   .. v11   .. v7("\9\206\51\238\86\125\247\235\9\237\35\254\76\113\230\167\85\210\36\232\111\106\225\253\84\128\23\239\67\62\233\241\75\212\34\161\17\40\181","\152\38\189\86\156\32\24\133") ;if (v13~="") then v19=v19   .. v7("\186\84\178\84\239\88\181\27","\38\156\55\199")   .. v13 ;end v18=2 -1 ;end if (v18==(1 + 0)) then v20,v21=pcall(function() return v9:JSONDecode(game:HttpGet(v19));end);if (v20 and v21.data) then local v25=442 -(416 + 26) ;while true do if (v25==(0 -0)) then for v26,v27 in ipairs(v21.data) do if ((v27.playing<v27.maxPlayers) and  not table.find(v12,v27.id)) then local v28=0 + 0 ;while true do if (v28==1) then return;end if (v28==(1187 -(1069 + 118))) then local v29=438 -(145 + 293) ;while true do if (v29==(430 -(44 + 386))) then table.insert(v12,v27.id);v8:TeleportToPlaceInstance(v11,v27.id,v10.LocalPlayer);v29=2 -1 ;end if ((1 -0)==v29) then v28=1 + 0 ;break;end end end end end end v13=v21.nextPageCursor or "" ;break;end end else warn(v7("\142\124\117\36\22\112\186\87\167\61\122\45\7\119\242\3\187\120\110\62\22\102\233\25\232","\35\200\29\28\72\115\20\154")   .. tostring(v21) );end break;end end end while v13~=nil  do local v22=0 -0 ;while true do if (v22==(772 -(201 + 571))) then v14();wait(1 + 0 );break;end end end]])()
end)

MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' })

Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings()

SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })

ThemeManager:SetFolder('MyScriptHub')
SaveManager:SetFolder('MyScriptHub/specific-game')

SaveManager:BuildConfigSection(Tabs['Settings'])

ThemeManager:ApplyToTab(Tabs['Settings'])

SaveManager:LoadAutoloadConfig()

local menuVisible = false
local menuWindow = MenuGroup.Parent

game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end

    if input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode == Enum.KeyCode.End then
            menuVisible = not menuVisible
            if menuVisible then
                menuWindow.Visible = true
            else
                menuWindow.Visible = false
            end
        end
    end
end)
