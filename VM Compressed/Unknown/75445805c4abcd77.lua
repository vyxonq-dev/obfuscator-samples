local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Snow Lover BABFT",
    Icon = 6534621140, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
    LoadingTitle = "Loading",
    LoadingSubtitle = "I love analog horror. My favourite: Winter of '83",
    Theme = "Default",
 
    DisableRayfieldPrompts = true,
    DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface
 
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "SnowOwl"
    },
 
    Discord = {
       Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
       Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
 
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
       Title = "Untitled",
       Subtitle = "Key System",
       Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"NOKEY!YIPPIE!"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
})

local AFKTab = Window:CreateTab("AFK", 5481079067) -- Title, Image

local PlayerTab = Window:CreateTab("Player", 10149736922) -- Title, Image

local MiscTab = Window:CreateTab("Misc", 9907495253) -- Title, Image

local BasicSection = AFKTab:CreateSection("Basic")

local Button = AFKTab:CreateButton({
    Name = "Complete once",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

        local teleportLocations = {
            {108, -1, 1335, 2},
            {53, 92, 2132, 2},
            {61, 92, 2902, 2},
            {60, 56, 3673, 2}, -- This one will not trigger ClaimRiverResultsGold
            {-56, -364, 9496, 0.25}, -- This one with 0.25 second delay will not trigger ClaimRiverResultsGold
            {62, 81, 4443, 2},
            {60, 69, 5212, 2},
            {41, 40, 5985, 2},
            {47, 37, 6755, 2}
        }

        local function createInvisiblePlatform(position)
            local part = Instance.new("Part")
            part.Size = Vector3.new(2, 0.25, 2)
            part.Position = position - Vector3.new(0, 3, 0) -- Slightly below the player
            part.Anchored = true
            part.Transparency = 1 -- Makes the platform invisible
            part.CanCollide = true
            part.Parent = game.Workspace
        end

        for _, loc in ipairs(teleportLocations) do
            local x, y, z, delayTime = unpack(loc)
            if humanoidRootPart then
                humanoidRootPart.CFrame = CFrame.new(x, y, z)
                createInvisiblePlatform(Vector3.new(x, y, z))

                task.wait(delayTime)
            end
        end
    end,
})

local antiAfkEnabled = false

local Toggle = AFKTab:CreateToggle({ 
    Name = "Anti-AFK", 
    CurrentValue = false,
    Flag = "Toggle_AntiAFK",
    Callback = function(Value)
        antiAfkEnabled = Value
        
        if antiAfkEnabled then
            local vu = game:GetService("VirtualUser")
            game:GetService("Players").LocalPlayer.Idled:Connect(function()
                if antiAfkEnabled then
                    vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                    task.wait(1)
                    vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                end
            end)
        end
    end,
})

local AdvancedSection = AFKTab:CreateSection("Advanced")

local Button = AFKTab:CreateButton({
    Name = "Complete once",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

        local teleportLocations = {
            {108, -1, 1335, 2},
            {53, 92, 2132, 2},
            {61, 92, 2902, 2},
            {60, 56, 3673, 2}, -- This one will not trigger ClaimRiverResultsGold
            {-56, -364, 9496, 0.25}, -- This one with 0.25 second delay will not trigger ClaimRiverResultsGold
            {62, 81, 4443, 2}, -- This one will not trigger ClaimRiverResultsGold
            {60, 69, 5212, 2},
            {41, 40, 5985, 2},
            {47, 37, 6755, 2}
        }

        local function createInvisiblePlatform(position)
            local part = Instance.new("Part")
            part.Size = Vector3.new(2, 0.25, 2)
            part.Position = position - Vector3.new(0, 3, 0) -- Slightly below the player
            part.Anchored = true
            part.Transparency = 1 -- Makes the platform invisible
            part.CanCollide = true
            part.Parent = game.Workspace
        end

        for _, loc in ipairs(teleportLocations) do
            local x, y, z, delayTime = unpack(loc)
            if humanoidRootPart then
                if not ((x == 60 and y == 56 and z == 3673) or
                (x == 62 and y == 81 and z == 4443) or
                (x == -56 and y == -364 and z == 9496 and delayTime == 0.25)) then
            -- Debugging: Check if the function exists and fire it
                    if workspace:FindFirstChild("ClaimRiverResultsGold") then
                        print("Firing ClaimRiverResultsGold")
                        workspace.ClaimRiverResultsGold:FireServer()
                else
                    print("ClaimRiverResultsGold not found in workspace!")
                end
            end

                humanoidRootPart.CFrame = CFrame.new(x, y, z)
                createInvisiblePlatform(Vector3.new(x, y, z))

                task.wait(delayTime)
            end
        end
    end,
})

local autofarmEnabled = false
local completionCount = 0 -- Tracks number of autofarm cycles

local Toggle = AFKTab:CreateToggle({ 
    Name = "Autofarm", 
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        autofarmEnabled = Value

        -- Moved the autofarm logic here
        if autofarmEnabled then
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

            local teleportLocations = {
                {108, -1, 1335, 2},
                {53, 92, 2132, 2},
                {61, 92, 2902, 2},
                {60, 56, 3673, 2}, -- This teleport will NOT trigger ClaimRiverResultsGold
                {-56, -364, 9496, 0.25}, -- This teleport will also NOT trigger ClaimRiverResultsGold
                {62, 81, 4443, 2}, -- Skip this one as well
                {60, 69, 5212, 2},
                {41, 40, 5985, 2},
                {47, 37, 6755, 2}
            }

            local function createInvisiblePlatform(position)
                local part = Instance.new("Part")
                part.Size = Vector3.new(2, 1, 2)
                part.Position = position - Vector3.new(0, 3, 0) -- Slightly below the player
                part.Anchored = true
                part.Transparency = 1 -- Invisible
                part.CanCollide = true
                part.Parent = game.Workspace
            end

            while autofarmEnabled do
                local player = game.Players.LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()
                local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                for _, loc in ipairs(teleportLocations) do
                    if not autofarmEnabled then return end -- Stop if toggled off
                    local x, y, z, delayTime = unpack(loc)

                    -- Debugging: print the location and check if we're skipping any teleport
                    print("Teleporting to:", x, y, z, "Delay:", delayTime)

                    if humanoidRootPart then
                        -- Trigger ClaimRiverResultsGold for all locations except {60, 56, 3673, 2}, {62, 81, 4443, 2}, and {-56, -364, 9496, 0.25}
                        if not ((x == 60 and y == 56 and z == 3673) or
                                (x == 62 and y == 81 and z == 4443) or
                                (x == -56 and y == -364 and z == 9496 and delayTime == 0.25)) then
                            -- Debugging: Check if the function exists and fire it
                            if workspace:FindFirstChild("ClaimRiverResultsGold") then
                                print("Firing ClaimRiverResultsGold")
                                workspace.ClaimRiverResultsGold:FireServer()
                            else
                                print("ClaimRiverResultsGold not found in workspace!")
                            end
                        end

                        humanoidRootPart.CFrame = CFrame.new(x, y, z)
                        createInvisiblePlatform(Vector3.new(x, y, z))

                        task.wait(delayTime)
                    end
                end

                -- Increment completion count and notify player
                completionCount = completionCount + 1
                Rayfield:Notify({
                    Title = "Completions",
                    Content = "Completed " .. completionCount .. " times",
                    Duration = 7,
                    Image = 14000021871,
                })
                task.wait(8)
            end
        end
    end,
})

local Toggle = MiscTab:CreateToggle({ 
    Name = "Random Notifications", 
    CurrentValue = true, -- Enabled by default
    Flag = "Toggle_RandomNotify",
    Callback = function(Value)
        local notifyEnabled = Value -- Set notifyEnabled based on toggle state

        local messages = {
            "I love you for using this script!",
            "Do not try copying this...",
            "I like how this is keyless.",
            "Are you enjoying this script?",
            "This was originally posted on uranium discord.",
            "This was made by a cutie!",
            "Imagine using this. NVM!"
        }

        -- Function to send random notifications
        local function sendRandomNotification()
            while notifyEnabled do
                -- Pick a random message from the messages list
                local message = messages[math.random(1, #messages)]

                -- Notify the user with the random message
                Rayfield:Notify({
                    Title = "Random Notification",
                    Content = message,
                    Duration = 5, -- How long the notification stays visible
                    Image = 14000021871, -- You can change the image ID if needed
                })

                -- Wait for a random amount of time between notifications
                task.wait(math.random(5, 15)) -- Wait between 5 to 15 seconds
            end
        end

        -- Start the random notifications in a separate task if enabled
        if notifyEnabled then
            task.spawn(function()
                sendRandomNotification()
            end)
        end
    end,
})

local Divider = MiscTab:CreateDivider()

local Button = MiscTab:CreateButton({
    Name = "Aura, kill yourself (Destroys menu)",
    Callback = function()
        Rayfield:Destroy()
    end,
})

local Slider = PlayerTab:CreateSlider({
    Name = "Walkspeed",
    Range = {0, 200},  -- The range for walk speed can go from 0 to 200 (or higher if needed)
    Increment = 1,     -- The slider increments by 1 each time
    Suffix = " Speed", -- Suffix to indicate it's the walk speed
    CurrentValue = 16, -- Default walk speed (could be set to 16 as the default Roblox speed)
    Flag = "WalkspeedSlider", -- The flag to identify this slider (unique identifier)
    Callback = function(Value)
        -- This is the callback function that updates the player's walkspeed when the slider is adjusted
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid") -- Access the humanoid part to change the walkspeed
        humanoid.WalkSpeed = Value -- Set the walkspeed to the value selected in the slider
    end,
})

local Slider = PlayerTab:CreateSlider({
    Name = "Jump Power",
    Range = {0, 200},  -- The range for jump power can go from 0 to 200 (or higher if needed)
    Increment = 1,     -- The slider increments by 1 each time
    Suffix = " Power", -- Suffix to indicate it's the jump power
    CurrentValue = 50, -- Default jump power (default Roblox jump power is 50)
    Flag = "JumpPowerSlider", -- The flag to identify this slider (unique identifier)
    Callback = function(Value)
        -- This is the callback function that updates the player's jump power when the slider is adjusted
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid") -- Access the humanoid part to change the jump power
        humanoid.JumpPower = Value -- Set the jump power to the value selected in the slider
    end,
})

Rayfield:LoadConfiguration()

-- For whomever is reading this this is made to be open source and I am considering making it not open source
