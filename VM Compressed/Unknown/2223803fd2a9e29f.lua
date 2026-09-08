-- Run the bring script first
local function runBringScript()
    print("Bring script started!") -- Debug: Confirm the bring script is running

    local targetPlayer = game.Players.LocalPlayer
    print("Target player set to: " .. targetPlayer.Name) -- Debug: Confirm target player

    -- Disable collision between players and the LocalPlayer
    local function disableCollision(player)
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            print("Disabling collision for: " .. player.Name) -- Debug: Confirm player
            local character = player.Character
            for _, part in ipairs(character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        else
            warn("Player character or HumanoidRootPart not found for: " .. player.Name) -- Debug: Warn if player character is missing
        end
    end

    -- Disable collision for the LocalPlayer so other players' items don't touch
    local function disableLocalPlayerCollision()
        if targetPlayer.Character then
            print("Disabling collision for LocalPlayer: " .. targetPlayer.Name) -- Debug: Confirm LocalPlayer
            local character = targetPlayer.Character
            for _, part in ipairs(character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        else
            warn("LocalPlayer character not found!") -- Debug: Warn if LocalPlayer character is missing
        end
    end

    -- Function to teleport players to LocalPlayer's current position with a small offset
    local function teleportPlayers()
        local targetPosition = targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") and targetPlayer.Character.HumanoidRootPart.Position
        if targetPosition then
            print("Teleporting players to: " .. tostring(targetPosition)) -- Debug: Confirm target position
            for _, player in ipairs(game.Players:GetPlayers()) do
                -- Check if the player is not the LocalPlayer and the player character exists
                if player ~= targetPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    -- Create a small random offset around the targetPosition
                    local offset = Vector3.new(math.random(-2, 2), 0, math.random(-2, 2)) -- Slight offset of 2 studs in x and z direction

                    -- Apply the offset and teleport the player
                    local teleportPosition = targetPosition + offset
                    print("Teleporting " .. player.Name .. " to: " .. tostring(teleportPosition)) -- Debug: Confirm teleport position
                    local success, errorMessage = pcall(function()
                        player.Character.HumanoidRootPart.CFrame = CFrame.new(teleportPosition)
                    end)

                    if not success then
                        warn("Failed to teleport player " .. player.Name .. ": " .. errorMessage) -- Debug: Warn if teleport fails
                    else
                        print("Successfully teleported " .. player.Name) -- Debug: Confirm successful teleport
                    end
                    -- Disable their collision
                    disableCollision(player)
                else
                    warn("Player " .. player.Name .. " character or HumanoidRootPart not found!") -- Debug: Warn if player character is missing
                end
            end
        else
            warn("Target player's HumanoidRootPart not found!") -- Debug: Warn if target position is missing
        end
    end

    -- Run the teleport function every second
    while true do
        print("Running teleport loop...") -- Debug: Confirm loop is running
        -- In case there are issues, try to teleport players
        local success, errorMessage = pcall(function()
            -- Disable the LocalPlayer's collision
            disableLocalPlayerCollision()
            -- Teleport other players
            teleportPlayers()
        end)

        if not success then
            warn("Error in teleporting players: " .. errorMessage) -- Debug: Warn if loop fails
        end
        wait(1) -- Update every second
    end
end

-- Start the bring script in a new thread
print("Starting bring script in a new thread...") -- Debug: Confirm thread creation
coroutine.wrap(runBringScript)()

-- Load the Universal Script Touch Fling Script after the bring script
print("Loading Universal Script Touch Fling Script...") -- Debug: Confirm loadstring is starting
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Touch-Fling-Script-19645"))()
print("Universal Script Touch Fling Script loaded!") -- Debug: Confirm loadstring is done
