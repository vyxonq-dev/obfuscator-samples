local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Bxnks Hub Slap Battles", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

--[[
Name = <string> - The name of the UI.
HidePremium = <bool> - Whether or not the user details shows Premium status or not.
SaveConfig = <bool> - Toggles the config saving in the UI.
ConfigFolder = <string> - The name of the folder where the configs are saved.
IntroEnabled = <bool> - Whether or not to show the intro animation.
IntroText = <string> - Text to show in the intro animation.
IntroIcon = <string> - URL to the image you want to use in the intro animation.
Icon = <string> - URL to the image you want displayed on the window.
CloseCallback = <function> - Function to execute when the window is closed.
]]


OrionLib:MakeNotification({
	Name = "Notification!!!",
	Content = "Made By Bxnks Hub",
	Image = "rbxassetid://4483345998",
	Time = 5
})


local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})


-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local VU = game:GetService("VirtualUser")

-- Configuration
local DetectionRadius = 10 -- Distance to detect nearby players
local KeyToPress = Enum.KeyCode.LeftShift -- Key to simulate click
local clickInterval = 0 -- Time in seconds between clicks

-- State
local isDetectionEnabled = false
local isCameraAdjustmentEnabled = false

-- Function to check if a player is near
local function isPlayerNear()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).magnitude
            if distance <= DetectionRadius then
                return player
            end
        end
    end
    return nil
end

-- Function to simulate a click
local function simulateClick()
    VU:CaptureController()
    VU:ClickButton1(Vector2.new())
end

-- Function to handle key press, camera adjustment, and continuous clicking
local function onUpdate()
    if isDetectionEnabled then
        local nearbyPlayer = isPlayerNear()
        if nearbyPlayer then
            if isCameraAdjustmentEnabled then
                -- Turn camera to the nearby player
                Camera.CFrame = CFrame.new(Camera.CFrame.Position, nearbyPlayer.Character.HumanoidRootPart.Position)
            end

            -- Continuously simulate clicks
            while isDetectionEnabled and isPlayerNear() do
                simulateClick()
                wait(clickInterval) -- Adjust click speed here
            end
        end
    end
end


Tab:AddToggle({
    Name = "Enable Detection",
    Default = false,
    Callback = function(value)
        isDetectionEnabled = value
        if isDetectionEnabled then
            print("Detection enabled.")
        else
            print("Detection disabled.")
        end
    end
})

Tab:AddToggle({
    Name = "Enable Camera Adjustment",
    Default = false,
    Callback = function(value)
        isCameraAdjustmentEnabled = value
        if isCameraAdjustmentEnabled then
            print("Camera adjustment enabled.")
        else
            print("Camera adjustment disabled.")
        end
    end
})

-- Connect the update function to Heartbeat
RunService.Heartbeat:Connect(onUpdate)


local antivoid

Tab:AddToggle({
	Name = "Anti Void",
	Default = false,
	Callback = function(Value)
		if Value then
			if not antivoid then
				antivoid = Instance.new("Part")
				antivoid.Parent = Workspace
				antivoid.Anchored = true
				antivoid.CanCollide = true
				antivoid.CFrame = CFrame.new(-4.08799744, -8.92285156, 1.83599997, 0, 1, -0, -1, 0, 0, 0, 0, 1)
				antivoid.Size = Vector3.new(1.5, 2000, 2000)
				antivoid.Transparency = 1
				antivoid.Name = "VoidFall"
			end
		else
			if antivoid then
				antivoid:Destroy()
				antivoid = nil
			end
		end
	end    
})


-- Services
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- State
local isAntiKnockbackEnabled = false

-- Function to detect if the player is ragdolled
local function IsRagdolled()
    if workspace:FindFirstChild(LocalPlayer.Name) then
        local character = workspace[LocalPlayer.Name]
        if character:FindFirstChild("Ragdolled") then
            return character.Ragdolled.Value
        end
    end
    return false
end

-- Function to apply anti-knockback
local function AntiKnockback()
    if IsRagdolled() and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        -- Set the HumanoidRootPart's velocity to zero to prevent knockback
        LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
        print("Knockback detected and neutralized!")
    end
end

-- Function to handle the anti-knockback loop
local function onUpdate()
    if isAntiKnockbackEnabled then
        AntiKnockback()
    end
end


Tab:AddToggle({
    Name = "Anti Knockback",
    Default = false,
    Callback = function(value)
        isAntiKnockbackEnabled = value
        if isAntiKnockbackEnabled then
            print("Anti Knockback enabled.")
        else
            print("Anti Knockback disabled.")
        end
    end
})

-- Connect the update function to RenderStepped
RunService.RenderStepped:Connect(onUpdate)

-- Debug print to confirm script running
print("Enhanced Anti-Knockback Script with Ragdoll Detection Activated")


-- Services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local Camera = Workspace.CurrentCamera
local VU = game:GetService("VirtualUser")
local Toggle = false
local SpecificToggle = false
local SpecificUsername = ""

-- Function to make the player jump
local function makePlayerJump()
    local character = LocalPlayer.Character
    if character and character:FindFirstChildOfClass("Humanoid") then
        character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
    end
end

-- Function to teleport without causing physics issues
local function safeTeleport(playerCFrame)
    local character = LocalPlayer.Character
    if not character then return end

    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return end

    makePlayerJump() -- Make the player jump first
    wait(0.2) -- Wait for 0.2 seconds after jump to teleport
    humanoidRootPart.CFrame = playerCFrame
end

-- Function to check if player is in the arena or default arena
local function IsPlayerInArena(player)
    local playerFolder = Workspace:FindFirstChild(player.Name)
    if playerFolder then
        local isInArena = playerFolder:FindFirstChild("isInArena")
        local isInDefaultArena = playerFolder:FindFirstChild("IsInDefaultArena")
        return (isInArena and isInArena.Value) or (isInDefaultArena and isInDefaultArena.Value)
    end
    return false
end

-- Function to teleport to a player, simulate a click, and change camera CFrame
local function TeleportToPlayer(targetPlayer)
    if (Toggle or SpecificToggle) and targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") and IsPlayerInArena(targetPlayer) then
        local targetHRP = targetPlayer.Character.HumanoidRootPart

        makePlayerJump() -- Make the player jump
safeTeleport(targetHRP.CFrame) -- Use the safeTeleport function to move the player

        Camera.CFrame = targetHRP.CFrame -- Change camera CFrame to player's CFrame

        -- Simulate the click after teleporting
        VU:ClickButton1(Vector2.new())

        print("Teleported to player in arena, jumped, clicked, and adjusted camera: " .. targetPlayer.Name)
        wait(0.5) -- Reduce the delay to 0.5 seconds
    end
end

-- Function to teleport to all players in the arena
local function TeleportToArenaPlayers()
    while Toggle do
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then -- Avoid teleporting to yourself
                TeleportToPlayer(player)
            end
        end
        RunService.RenderStepped:Wait() -- Use RenderStepped for faster iteration
    end
end

-- Function to teleport to a specific player
local function TeleportToSpecificPlayer()
    while SpecificToggle do
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Name == SpecificUsername then -- Avoid teleporting to yourself and check specific username
                TeleportToPlayer(player)
            end
        end
        RunService.RenderStepped:Wait() -- Use RenderStepped for faster iteration
    end
end

-- Toggle button for auto slap all players
Tab:AddToggle({
    Name = "Auto Slap All",
    Default = false,
    Callback = function(Value)
        Toggle = Value
        print("Auto Slap All is now", Value and "Enabled" or "Disabled")
        if Toggle then
            TeleportToArenaPlayers()
        end
    end
})

-- Toggle button for auto slap specific player
Tab:AddToggle({
    Name = "Auto Slap Specific Player",
    Default = false,
    Callback = function(Value)
        SpecificToggle = Value
        print("Auto Slap Specific Player is now", Value and "Enabled" or "Disabled")
        if SpecificToggle then
            TeleportToSpecificPlayer()
        end
    end
})

-- Textbox for specific username
Tab:AddTextbox({
    Name = "Specific Username",
    Default = "",
    TextDisappear = true,
    Callback = function(Value)
        SpecificUsername = Value
        print("Set Specific Username to:", SpecificUsername)
    end
})

-- Debug print to confirm script running
print("Auto Slap All Script with Pre-Teleport Jump and Specific Player Activated")


Tab:AddToggle({
    Name = "Anti Rock",
    Default = false,
    Callback = function(Value)
        getgenv().Rock = Value

        while getgenv().Rock do
            -- Iterate through all players in the game
            for _, player in pairs(game.Players:GetPlayers()) do
                -- Check if the player has a character and the character has a rock part
                local character = player.Character
                if character then
                    local rock = character:FindFirstChild("rock")
                    if rock then
                        rock:Destroy()  -- Remove the rock part
                    end
                end
            end
            wait(0.01)  -- Wait before checking again
        end
    end
})


local Players = game:GetService("Players")
local validPlaceIds = {6403373529} -- Replace with the correct place IDs

-- Function to check if the current place ID is valid
local function isPlaceIdValid()
    for _, placeId in ipairs(validPlaceIds) do
        if game.PlaceId == placeId then
            return true
        end
    end
    return false
end

-- Function to check place ID and kick the player if it's incorrect
local function checkPlaceId()
    if not isPlaceIdValid() then
        local player = Players.LocalPlayer
        player:Kick("This script is not supported by this game.")
    end
end

-- Run the place ID check
checkPlaceId()