--Stars real BluuGui
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()


local Window = Rayfield:CreateWindow({
   Name = "c00lgui",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Attaching into client...",
   LoadingSubtitle = "by 007n7",
   ShowText = "c00lgui", -- for mobile users to unhide rayfield, change if you'd like
   
    Theme = { -- <-- added key here
    TextColor = Color3.fromRGB(240, 240, 240),

    Background = Color3.fromRGB(20, 20, 20),
    Topbar = Color3.fromRGB(25, 25, 25),
    Shadow = Color3.fromRGB(10, 10, 10),

    NotificationBackground = Color3.fromRGB(25, 25, 25),
    NotificationActionsBackground = Color3.fromRGB(255, 59, 59),

    TabBackground = Color3.fromRGB(35, 35, 35),
    TabStroke = Color3.fromRGB(50, 50, 50),
    TabBackgroundSelected = Color3.fromRGB(255, 59, 59),
    TabTextColor = Color3.fromRGB(240, 240, 240),
    SelectedTabTextColor = Color3.fromRGB(20, 20, 20),

    ElementBackground = Color3.fromRGB(30, 30, 30),
    ElementBackgroundHover = Color3.fromRGB(50, 50, 50),
    SecondaryElementBackground = Color3.fromRGB(20, 20, 20),
    ElementStroke = Color3.fromRGB(60, 60, 60),
    SecondaryElementStroke = Color3.fromRGB(40, 40, 40),
            
    SliderBackground = Color3.fromRGB(255, 59, 59),
    SliderProgress = Color3.fromRGB(255, 59, 59),
    SliderStroke = Color3.fromRGB(200, 40, 40),

    ToggleBackground = Color3.fromRGB(25, 25, 25),
    ToggleEnabled = Color3.fromRGB(255, 59, 59),
    ToggleDisabled = Color3.fromRGB(80, 80, 80),
    ToggleEnabledStroke = Color3.fromRGB(200, 40, 40),
    ToggleDisabledStroke = Color3.fromRGB(65, 65, 65),
    ToggleEnabledOuterStroke = Color3.fromRGB(60, 60, 60),
    ToggleDisabledOuterStroke = Color3.fromRGB(40, 40, 40),

    DropdownSelected = Color3.fromRGB(30, 30, 30),
    DropdownUnselected = Color3.fromRGB(20, 20, 20),

    InputBackground = Color3.fromRGB(25, 25, 25),
    InputStroke = Color3.fromRGB(50, 50, 50),
    PlaceholderColor = Color3.fromRGB(178, 178, 178)
   }, -- <-- comma after the theme table is required
 
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
 
   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Verification",
      Subtitle = "Are u bluudud?",
      Note = "Type (No) to verificate", -- Use this to tell the user how to get a key
      FileName = "Question", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"No"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("Player managament", 4483362458) -- Title, Image

local Useful = Window:CreateTab("Useful", 4483362458) -- Título y icono

--Misc tab on top for fix bugs
  local Misc = Window:CreateTab("Misc", 4483362458) -- Title, Image

local MainSection = MainTab:CreateSection("Movility managament")

-- 🎵 Dead sounds
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local SoundIds = {
    82347871291422,
    115927698649509,
    82520834438491
}

-- Function to play random death sound
local function PlayDeathSound(character)
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.Died:Connect(function()
            local randomId = SoundIds[math.random(1, #SoundIds)]
            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://" .. randomId
            sound.Volume = 2 -- 🔊 Double volume
            sound.Parent = character -- Parent to character for localized sound
            sound:Play()
            game:GetService("Debris"):AddItem(sound, 5)
        end)
    end
end

-- Connect to CharacterAdded
LocalPlayer.CharacterAdded:Connect(function(character)
    task.wait(1) -- Wait a bit for character to fully load
    PlayDeathSound(character)
end)

-- If player already has character
if LocalPlayer.Character then
    PlayDeathSound(LocalPlayer.Character)
end

 
 --features down

  local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

-- Default values
local walkSpeedValue = 16
local jumpPowerValue = 50

-- Function to apply WalkSpeed and JumpPower
local function applyMovement(character)
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = walkSpeedValue
        humanoid.JumpPower = jumpPowerValue
    end
end

-- Freeze WalkSpeed & JumpPower every frame
RunService.RenderStepped:Connect(function()
    local character = LocalPlayer.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = walkSpeedValue
            humanoid.JumpPower = jumpPowerValue
        end
    end
end)

-- Apply movement on respawn
LocalPlayer.CharacterAdded:Connect(function(char)
    task.wait(0.5)
    applyMovement(char)
end)

-- WalkSpeed Slider
MainTab:CreateSlider({
    Name = "WalkSpeed",
    Range = {16, 100},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = walkSpeedValue,
    Flag = "Slider1",
    Callback = function(Value)
        walkSpeedValue = Value
        if LocalPlayer.Character then
            applyMovement(LocalPlayer.Character)
        end
    end,
})

-- JumpPower Slider
MainTab:CreateSlider({
    Name = "JumpPower",
    Range = {0, 300},
    Increment = 2,
    Suffix = "Stuts",
    CurrentValue = jumpPowerValue,
    Flag = "Slider2",
    Callback = function(Value)
        jumpPowerValue = Value
        if LocalPlayer.Character then
            applyMovement(LocalPlayer.Character)
        end
    end,
})

        local Button = MainTab:CreateButton({
   Name = "Fly Gui",
   Callback = function()

local STARTERGUI = game:GetService("StarterGui")

if game:GetService("ReplicatedStorage"):FindFirstChild("BZn2q91BzN") then
STARTERGUI:SetCore("SendNotification",{
        Title = "BluuGui fly",
        Text = "Script is already running",
         Icon = "rbxassetid://278315432",
         Duration = 4
    })
return
end

local ScreenGui = Instance.new("ScreenGui")
local FlyButton = Instance.new("TextButton")
local SpeedBox = Instance.new("TextBox")

local NSound = Instance.new("Sound", FlyButton)
NSound.SoundId = "rbxassetid://9086208751"
NSound.Volume = 1

function Notify(Txt, Dur)
STARTERGUI:SetCore("SendNotification",{
        Title = "type in chat[!stop] to stop script",
        Text = Txt,
         Icon = "rbxassetid://278315432",
         Duration = Dur
    })
NSound:Play()
end

-- Detect if script already ran

local VdbwjS = Instance.new("StringValue",game:GetService("ReplicatedStorage"))
VdbwjS.Name = "BZn2q91BzN"

Notify("BluuGui fly", 5)

local plr = game:GetService"Players"
local Lp = plr.LocalPlayer
local rs = game:GetService"RunService"
local UserInputService = game:GetService"UserInputService"

local buttonIsOn = false

ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false

FlyButton.Name = "FlyButton"
FlyButton.Parent = ScreenGui
FlyButton.BackgroundColor3 = Color3.new(0.168627, 0.513726, 0.25098)
FlyButton.BorderColor3 = Color3.new(0,0,0)
FlyButton.Position = UDim2.new(0.912970064, 0, 0.194202876, 0)
FlyButton.Size = UDim2.new(0, 50, 0, 50)
FlyButton.Font = Enum.Font.Code
FlyButton.Text = "Fly"
FlyButton.TextColor3 = Color3.new(0,0,0)
FlyButton.TextSize = 14
FlyButton.TextStrokeColor3 = Color3.new(1, 1, 1)
FlyButton.TextWrapped = true
FlyButton.Transparency = 0.2
FlyButton.Active = true
FlyButton.Draggable = true

SpeedBox.Name = "SpeedBox"
SpeedBox.Parent = FlyButton
SpeedBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SpeedBox.Position = UDim2.new(-1.716970064, 0, 0.004202876, 0)
SpeedBox.Size = UDim2.new(0, 80, 0, 50)
SpeedBox.Font = Enum.Font.Code
SpeedBox.PlaceholderText = "Speed"
SpeedBox.Text = ""
SpeedBox.TextColor3 = Color3.fromRGB(0, 0, 0)
SpeedBox.TextScaled = true
SpeedBox.TextSize = 14.000
SpeedBox.TextWrapped = true

local controlModule = require(Lp.PlayerScripts:WaitForChild('PlayerModule'):WaitForChild("ControlModule"))
-- Get joystick

local bv = Instance.new("BodyVelocity")
bv.Name = "VelocityHandler"
bv.Parent = Lp.Character.HumanoidRootPart
bv.MaxForce = Vector3.new(0,0,0)
bv.Velocity = Vector3.new(0,0,0)

local bg = Instance.new("BodyGyro")
bg.Name = "GyroHandler"
bg.Parent = Lp.Character.HumanoidRootPart
bg.MaxTorque = Vector3.new(9e9,9e9,9e9)
bg.P = 1000
bg.D = 50

local Signal1
Signal1 = Lp.CharacterAdded:Connect(function(NewChar)
local bv = Instance.new("BodyVelocity")
bv.Name = "VelocityHandler"
bv.Parent = NewChar:WaitForChild("Humanoid").RootPart
bv.MaxForce = Vector3.new(0,0,0)
bv.Velocity = Vector3.new(0,0,0)

local bg = Instance.new("BodyGyro")
bg.Name = "GyroHandler"
bg.Parent = NewChar:WaitForChild("Humanoid").RootPart
bg.MaxTorque = Vector3.new(9e9,9e9,9e9)
bg.P = 1000
bg.D = 50
end)

local camera = Workspace.CurrentCamera
local speed = 50

local Signal2
Signal2 = rs.RenderStepped:Connect(function()
if Lp.Character and Lp.Character:FindFirstChildOfClass("Humanoid") and Lp.Character.Humanoid.RootPart and Lp.Character.HumanoidRootPart:FindFirstChild("VelocityHandler") and Lp.Character.HumanoidRootPart:FindFirstChild("GyroHandler") then

if buttonIsOn then
FlyButton.Text = "Fly: On"
FlyButton.BackgroundColor3 = Color3.new(0,255,0)
Lp.Character.HumanoidRootPart.VelocityHandler.MaxForce = Vector3.new(9e9,9e9,9e9)
Lp.Character.HumanoidRootPart.GyroHandler.MaxTorque = Vector3.new(9e9,9e9,9e9)
Lp.Character.Humanoid.PlatformStand = true
elseif buttonIsOn == false then
FlyButton.Text = "Fly: Off"
FlyButton.BackgroundColor3 = Color3.new(255,0,0)
Lp.Character.HumanoidRootPart.VelocityHandler.MaxForce = Vector3.new(0,0,0)
Lp.Character.HumanoidRootPart.GyroHandler.MaxTorque = Vector3.new(0,0,0)
Lp.Character.Humanoid.PlatformStand = false
return
end

Lp.Character.HumanoidRootPart.GyroHandler.CFrame = camera.CoordinateFrame
local direction = controlModule:GetMoveVector()
Lp.Character.HumanoidRootPart.VelocityHandler.Velocity = Vector3.new()
if direction.X > 0 then
Lp.Character.HumanoidRootPart.VelocityHandler.Velocity = Lp.Character.HumanoidRootPart.VelocityHandler.Velocity + camera.CFrame.RightVector*(direction.X*speed)
end
if direction.X < 0 then
Lp.Character.HumanoidRootPart.VelocityHandler.Velocity = Lp.Character.HumanoidRootPart.VelocityHandler.Velocity + camera.CFrame.RightVector*(direction.X*speed)
end
if direction.Z > 0 then
Lp.Character.HumanoidRootPart.VelocityHandler.Velocity = Lp.Character.HumanoidRootPart.VelocityHandler.Velocity - camera.CFrame.LookVector*(direction.Z*speed)
end
if direction.Z < 0 then
Lp.Character.HumanoidRootPart.VelocityHandler.Velocity = Lp.Character.HumanoidRootPart.VelocityHandler.Velocity - camera.CFrame.LookVector*(direction.Z*speed)
end
end
end)

FlyButton.TouchTap:Connect(function()
buttonIsOn = not buttonIsOn
end)

local Signal3
Signal3 = SpeedBox:GetPropertyChangedSignal("Text"):Connect(function()
if tonumber(SpeedBox.Text) then
speed = tonumber(SpeedBox.Text)
end
end)

Lp.Chatted:Connect(function(msg)
if msg:sub(1,5) == "!stop" then
Signal1:Disconnect()
Signal2:Disconnect()
Signal3:Disconnect()
game:GetService("ReplicatedStorage"):FindFirstChild("BZn2q91BzN"):Destroy()
ScreenGui:Destroy()
Lp.Character.Humanoid.Health = 0
end
end)
 
   end,
})
 
 
        local Button = MainTab:CreateButton({
   Name = "Tp on click (Press X to tp)",
   Callback = function()
  -- LocalScript dentro de StarterPlayerScripts
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local mouse = player:GetMouse()
 
-- Tecla X para teleport
local TPKey = Enum.KeyCode.X
 
local UserInputService = game:GetService("UserInputService")
 
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.KeyCode == TPKey then
		local char = player.Character
		local hrp = char and char:FindFirstChild("HumanoidRootPart")
		if hrp and mouse.Target then
			-- Teleportar ligeramente arriba del punto para no caer dentro del suelo
			hrp.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0,3,0))
		end
	end
end)
 
   end,
})


        local Section = Misc:CreateSection("Random stuff")
        
       -- NOCLIP
local noclipEnabled = false
local noclipConnection
local function toggleNoclip(state)
    noclipEnabled = state
    if state then
        noclipConnection = game:GetService("RunService").Stepped:Connect(function()
            for _, part in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end)
    else
        if noclipConnection then noclipConnection:Disconnect() end
    end
end

MainTab:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Flag = "NoclipToggle",
    Callback = toggleNoclip
})
        -- FULL BRIGHT
local fullBrightEnabled = false
local function toggleFullBright(state)
    fullBrightEnabled = state
    if state then
        game.Lighting.Brightness = 2
        game.Lighting.ClockTime = 12
        game.Lighting.FogEnd = 1e6
        game.Lighting.GlobalShadows = false
        game.Lighting.OutdoorAmbient = Color3.fromRGB(128,128,128)
    else
        -- Reset Lighting (puedes ajustarlo)
        game.Lighting.Brightness = 1
        game.Lighting.ClockTime = 14
        game.Lighting.FogEnd = 1000
        game.Lighting.GlobalShadows = true
        game.Lighting.OutdoorAmbient = Color3.fromRGB(0,0,0)
    end
end

Misc:CreateToggle({
    Name = "Full Bright",
    CurrentValue = false,
    Flag = "FullBrightToggle",
    Callback = toggleFullBright
})
 
 
        -- Global ESP toggle
_G.ESP = false
local ESPColor = Color3.fromRGB(50, 138, 220) -- Bluu color

-- Services
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Function to add highlight to a character
local function addHighlight(character)
    if not character:FindFirstChild("Highlight") then
        local highlight = Instance.new("Highlight")
        highlight.FillTransparency = 1
        highlight.OutlineColor = ESPColor
        highlight.Parent = character
    end
end

-- Update highlights every frame
RunService.RenderStepped:Connect(function()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            addHighlight(player.Character)
            local highlight = player.Character:FindFirstChild("Highlight")
            if highlight then
                highlight.Enabled = _G.ESP
                highlight.OutlineColor = ESPColor
            end
        end
    end
end)

-- Automatically add highlight for players joining later
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        addHighlight(character)
    end)
end)

-- Toggle via your Misc tab
Misc:CreateToggle({
    Name = "ESP",
    CurrentValue = false,
    Callback = function(Value)
        _G.ESP = Value
    end
})
 
        local Button = Misc:CreateButton({
   Name = "FE Invisible",
   Callback = function()
 
loadstring(game:HttpGet('https://pastebin.com/raw/3Rnd9rHf'))()
   end,
})
 
-- Crear la tab Scripts
local ScriptsTab = Window:CreateTab("Scripts", 4483362458)
 
-- Crear sección Hubs dentro de Scripts
local HubsSection = ScriptsTab:CreateSection("Hubs")
 
-- Botones dentro de la sección Hubs
local Button = ScriptsTab:CreateButton({
    Name = "NameLess Admin",
    Callback = function()
        loadstring(game:HttpGet("https://github.com/FilteringEnabled/NamelessAdmin/blob/main/Source?raw=true"))()
    end,
})
 
local Button = ScriptsTab:CreateButton({
    Name = "Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Infinite-Yield-43437"))()
    end,
})
 
local Button = ScriptsTab:CreateButton({
    Name = "GhostHub",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-X-Ghost-Hub-X-7595"))()
    end,
})
 
local Button = ScriptsTab:CreateButton({
    Name = "Aimbot (Not for Mobile)",
    Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/agreed69-scripts/open-src-scripts/refs/heads/main/Universal%20Aimbot.lua",true))()
    end,
})
 
        local Button = Misc:CreateButton({
   Name = "Check FPS and ping",
   Callback = function()
           local player = game.Players.LocalPlayer
local gui = player:WaitForChild("PlayerGui")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")
 
-- Revisar si ya existe el HUD
local existingHUD = gui:FindFirstChild("FPSHUD")
if existingHUD then
    existingHUD:Destroy()
    return
end
 
-- Crear sonido de notificación
local sound = gui:FindFirstChild("FPSNotifySound")
if not sound then
    sound = Instance.new("Sound")
    sound.Name = "FPSNotifySound"
    sound.SoundId = "rbxassetid://911882330" -- Sonido de notificación
    sound.Volume = 1
    sound.Parent = gui
end
sound:Play()
 
-- Crear ScreenGui y TextLabel para HUD
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FPSHUD"
screenGui.Parent = gui
 
local fpsLabel = Instance.new("TextLabel")
fpsLabel.Size = UDim2.new(0,200,0,50)
fpsLabel.Position = UDim2.new(0,10,0,10)
fpsLabel.BackgroundTransparency = 0.5
fpsLabel.BackgroundColor3 = Color3.fromRGB(121,156,208) -- #799CD0
fpsLabel.TextColor3 = Color3.fromRGB(255,255,255)
fpsLabel.TextScaled = true
fpsLabel.Font = Enum.Font.SourceSansBold
fpsLabel.Text = "FPS: 0 | Ping: 0ms"
fpsLabel.Parent = screenGui
 
-- Variables
local fps = 0
local ping = 0
local frames = 0
local lastTime = tick()
 
-- Calcular FPS
RunService.RenderStepped:Connect(function()
    frames = frames + 1
    if tick() - lastTime >= 1 then
        fps = frames
        frames = 0
        lastTime = tick()
    end
end)
 
-- Calcular ping
RunService.Heartbeat:Connect(function(delta)
    ping = math.floor(delta * 1000) -- ms aproximado
end)
 
-- Actualizar HUD cada segundo
task.spawn(function()
    while fpsLabel.Parent do
        fpsLabel.Text = "FPS: "..fps.." | Ping: "..ping.."ms"
        task.wait(1)
    end
end)
 
   end,
})
 
        local Button = Misc:CreateButton({
   Name = "Check Health",
   Callback = function()
           local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local gui = player:WaitForChild("PlayerGui")
 
-- Crear sonido en PlayerGui si no existe
local sound = gui:FindFirstChild("HealthNotifySound")
if not sound then
    sound = Instance.new("Sound")
    sound.Name = "HealthNotifySound"
    sound.SoundId = "rbxassetid://911882330" -- Sonido de notificación
    sound.Volume = 1
    sound.Parent = gui
end
sound:Play()
 
-- Mostrar notificación con salud
pcall(function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "Health Check",
        Text = "Your actualy live is: " .. math.floor(humanoid.Health) .. " / " .. humanoid.MaxHealth,
        Duration = 5
    })
end)
 
   end,
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Function to set HP to max
local function MaxHealth(character)
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.MaxHealth = 999999
            humanoid.Health = 999999
        end
    end
end

-- Automatically apply max HP on respawn
LocalPlayer.CharacterAdded:Connect(function(character)
    task.wait(0.5) -- wait for character to load
    if _G.GodmodeHP then
        MaxHealth(character)
    end
end)

-- Rayfield toggle
Misc:CreateToggle({
    Name = "Godmode HP",
    CurrentValue = false,
    Callback = function(Value)
        _G.GodmodeHP = Value

        -- Create continuous loop only once
        if not _G.GodmodeLoop then
            _G.GodmodeLoop = true
            spawn(function()
                while true do
                    task.wait(0.1) -- check 10 times per second
                    if _G.GodmodeHP then
                        MaxHealth(LocalPlayer.Character)
                    end
                end
            end)
        end

        -- Immediately restore HP if toggle is turned on
        if _G.GodmodeHP then
            MaxHealth(LocalPlayer.Character)
        end
    end
})


        local Button = Misc:CreateButton({
   Name = "Restore Live",
   Callback = function()

            -- Get the local player
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Function to restore full health
local function RestoreFullHealth()
    local character = LocalPlayer.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.Health = humanoid.MaxHealth
        end
    end
end

-- Example usage
RestoreFullHealth()
 
   end,
})

local InvisToggle = Misc:CreateToggle({
    Name = "Invisibility v2",
    CurrentValue = false,
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        local sound = Instance.new("Sound", player:WaitForChild("PlayerGui"))
        sound.SoundId = "rbxassetid://942127495"
        sound.Volume = 1

        local function setTransparency(character, transparency)
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") or part:IsA("Decal") then
                    part.Transparency = transparency
                end
            end
        end

        if Value then
            -- Invis ON
            local savedpos = player.Character.HumanoidRootPart.CFrame
            task.wait()
            player.Character:MoveTo(Vector3.new(-25.95, 84, 3537.55))
            task.wait(0.15)

            local Seat = Instance.new("Seat", workspace)
            Seat.Anchored = false
            Seat.CanCollide = false
            Seat.Name = "invischair"
            Seat.Transparency = 1
            Seat.Position = Vector3.new(-25.95, 84, 3537.55)

            local Weld = Instance.new("Weld", Seat)
            Weld.Part0 = Seat
            Weld.Part1 = player.Character:FindFirstChild("Torso") or player.Character:FindFirstChild("UpperTorso")

            task.wait()
            Seat.CFrame = savedpos
            setTransparency(player.Character, 0.5)

            sound:Play()
            game.StarterGui:SetCore("SendNotification", {
                Title = "Invis ON",
                Duration = 3,
                Text = "Now you are invisible"
            })
        else
            -- Invis OFF
            local invisChair = workspace:FindFirstChild("invischair")
            if invisChair then invisChair:Destroy() end
            setTransparency(player.Character, 0)

            sound:Play()
            game.StarterGui:SetCore("SendNotification", {
                Title = "Invis OFF",
                Duration = 3,
                Text = "Now you are visible"
            })
        end
    end
})

 
        local Trolling = Window:CreateTab("Trolling", 4483362458) -- Title, Image
        local Section = Trolling:CreateSection("Random stuff")
 
        local Button = Trolling:CreateButton({
   Name = "Kill All (need tool)",
   Callback = function()
           -- LocalScript: Kill All en loop sin GUI
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
 
-- Toggle global
if _G.killAllActive == nil then
    _G.killAllActive = false
end
 
-- Función principal para matar a todos usando firetouchinterest
local function killAllLoop()
    while _G.killAllActive do
        local tool = char:FindFirstChildOfClass("Tool")
        if tool and tool:FindFirstChild("Handle") then
            tool:Activate()
            for _, plr in pairs(game.Players:GetPlayers()) do
                if plr ~= player and plr.Character then
                    local character = plr.Character
                    for _, part in ipairs(character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            firetouchinterest(tool.Handle, part, 0)
                            firetouchinterest(tool.Handle, part, 1)
                        end
                    end
                end
            end
        end
        task.wait(0.5) -- espera medio segundo antes de repetir
    end
end
 
-- Toggle al ejecutar
if not _G.killAllActive then
    _G.killAllActive = true
    spawn(killAllLoop) -- ejecuta en loop en un hilo separado
else
    _G.killAllActive = false
    warn("Kill All loop detenido.")
end
 
   end,
})
 
        local Button = Trolling:CreateButton({
   Name = "Fe Kill npc Katana",
   Callback = function()
           loadstring(game:HttpGet("https://pastebin.com/raw/NTNHKeMZ", true))()
   end,
})
 
        local Button = Trolling:CreateButton({
   Name = "Super Ring (by lukas)",
   Callback = function()
           loadstring(game:HttpGet("https://pastebin.com/raw/aZjaAr6F"))()
   end,
})

local Button = Trolling:CreateButton({
   Name = "Forsaken animations (credits to owner)",
   Callback = function()
   		loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d1226ca454068d9251732f34884a375e.lua"))()
   end,
})

local Button = Trolling:CreateButton({
   Name = "Fe Angel of death (R6)",
   Callback = function()

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local InsertService = game:GetService("InsertService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local rightArm = character:FindFirstChild("Right Arm") or character:FindFirstChild("RightHand")

-- Function to check if the character is R6 or R15
local function isR15()
    return humanoid.RigType == Enum.HumanoidRigType.R15
end

-- Create animations
local animation1 = Instance.new("Animation")
local animation2 = Instance.new("Animation")
local animation3 = Instance.new("Animation")
local animationL = Instance.new("Animation")
local walkAnimation = Instance.new("Animation")
local flyAnimation = Instance.new("Animation")
local zAnimation = Instance.new("Animation")
local zFollowUpAnimation = Instance.new("Animation")

if isR15() then
    animation2.AnimationId = "rbxassetid://15392759696"
    animation3.AnimationId = "rbxassetid://55630898"
    animationL.AnimationId = "rbxassetid://10714395441"
    walkAnimation.AnimationId = "rbxassetid://10714174918"
    flyAnimation.AnimationId = "rbxassetid://15549124879"
else
    animation1.AnimationId = "rbxassetid://55306564"
    animation2.AnimationId = "rbxassetid://55306564"
    animation3.AnimationId = "rbxassetid://42070830"
    animationL.AnimationId = "rbxassetid://35978913"
    walkAnimation.AnimationId = "rbxassetid://28440069"
    flyAnimation.AnimationId = "rbxassetid://35152447"
end

zAnimation.AnimationId = "rbxassetid://44418205"
zFollowUpAnimation.AnimationId = "rbxassetid://28090053"

-- Load animations onto the humanoid
local animationTrack1 = humanoid:LoadAnimation(animation1)
local animationTrack2 = humanoid:LoadAnimation(animation2)
local animationTrack3 = humanoid:LoadAnimation(animation3)
local animationTrackL = humanoid:LoadAnimation(animationL)
local walkTrack = humanoid:LoadAnimation(walkAnimation)
local flyTrack = humanoid:LoadAnimation(flyAnimation)
local zTrack = humanoid:LoadAnimation(zAnimation)
local zFollowUpTrack = humanoid:LoadAnimation(zFollowUpAnimation)

-- Create sound effects
local gunSound = Instance.new("Sound")
gunSound.SoundId = "rbxassetid://1906350651"
gunSound.Volume = 1
gunSound.Looped = false
gunSound.Parent = character:WaitForChild("HumanoidRootPart")

local zSound = Instance.new("Sound")
zSound.SoundId = "rbxassetid://9113122694"
zSound.Volume = 1
zSound.Looped = false
zSound.PlaybackSpeed = 1
zSound.Parent = character:WaitForChild("HumanoidRootPart")

-- Create particle emitter
local particleEmitter = Instance.new("ParticleEmitter")
particleEmitter.Texture = "rbxassetid://410049012"
particleEmitter.Color = ColorSequence.new(Color3.fromRGB(255, 0, 0))
particleEmitter.Lifetime = NumberRange.new(5.10)
particleEmitter.Rate = 100
particleEmitter.EmissionDirection = Enum.NormalId.Bottom
particleEmitter.Enabled = false
particleEmitter.Parent = rightArm

-- Function to play the animations in order when "K" is pressed (only for R6)
local function onKeyPressK(input)
    if input.KeyCode == Enum.KeyCode.K and not isR15() then
        animationTrack1:Play()
        animationTrack1.Stopped:Wait()
        animationTrack2:Play()
        animationTrack2.Stopped:Wait()
        animationTrack3:Play()
        wait(0.5)  -- Stop the third animation after 0.5 seconds
        animationTrack3:Stop()
    elseif input.KeyCode == Enum.KeyCode.K and isR15() then
        animationTrack2:Play()
        animationTrack2.Stopped:Wait()
        animationTrack3:Play()
        wait(0.5)  -- Stop the third animation after 0.5 seconds
        animationTrack3:Stop()
    end
end

-- Function to play the animation with gun sound and particles when "L" is pressed
local function onKeyPressL(input)
    if input.KeyCode == Enum.KeyCode.L then
        animationTrackL:Play()
        gunSound:Play()
        particleEmitter.Enabled = true
        wait(0.5)
        particleEmitter.Enabled = false
    end
end

-- Function to make the player fly and play the animation when "Q" is pressed
local function onKeyPressQ(input)
    if input.KeyCode == Enum.KeyCode.Q then
        flyTrack:Play()
        character.HumanoidRootPart.Anchored = true
        character.HumanoidRootPart.CFrame = character.HumanoidRootPart.CFrame * CFrame.new(0, 6, 0)

        if isR15() then
            wait(flyTrack.Length)  -- Wait for the duration of the animation
        else
            for i = 1, 3 do
                flyTrack:Play()
                wait(flyTrack.Length)  -- Wait for the duration of the animation before playing it again
            end
        end

        flyTrack:Stop()
        character.HumanoidRootPart.Anchored = false

        -- Add highlight effect to the character
        local highlight = Instance.new("Highlight")
        highlight.FillColor = Color3.fromRGB(255, 255, 0)
        highlight.FillTransparency = 0.5
        highlight.Parent = character
    end
end

-- Function to play the Z animation and follow-up animation when "Z" is pressed
local function onKeyPressZ(input)
    if input.KeyCode == Enum.KeyCode.Z then
        zTrack:Play()
        zSound:Play()
        wait(2)  -- Play the Z animation and sound for 2 seconds
        zTrack:Stop()
        zSound:Stop()
        zFollowUpTrack:Play()  -- Play the follow-up animation
    end
end

-- Function to play the walk animation
local function playWalk()
    if not walkTrack.IsPlaying then
        walkTrack:Play()
    end
end

-- Detect when the player starts moving
humanoid.Running:Connect(function(speed)
    if speed > 0 then
        playWalk()
    else
        walkTrack:Stop()
    end
end)

-- Connect the functions to the InputBegan event
UserInputService.InputBegan:Connect(onKeyPressK)
UserInputService.InputBegan:Connect(onKeyPressL)
UserInputService.InputBegan:Connect(onKeyPressQ)
UserInputService.InputBegan:Connect(onKeyPressZ)

   end,
})

        -- Useful stuff down here
        -- TP TO NEAREST TOOL/MODEL WITH HANDLE + PROXIMITYPROMPT
local function tpNearest()
    local player = game.Players.LocalPlayer
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end

    local root = player.Character.HumanoidRootPart
    local nearest, dist = nil, math.huge

    for _, obj in ipairs(workspace:GetDescendants()) do
        if (obj:IsA("Tool") or obj:IsA("Model")) and obj:FindFirstChild("Handle") and obj:FindFirstChildWhichIsA("ProximityPrompt", true) then
            local handle = obj:FindFirstChild("Handle")
            if handle then
                local d = (handle.Position - root.Position).Magnitude
                if d < dist then
                    dist = d
                    nearest = handle
                end
            end
        end
    end

    if nearest then
        root.CFrame = nearest.CFrame + Vector3.new(0,3,0)
    end
end

Misc:CreateButton({
    Name = "TP to Nearest Tool/Model",
    Callback = tpNearest
}) --Clean

-- Sección Protection
local Inmunity = Useful:CreateSection("Protection")
--No fall  damage

local Button = Useful:CreateButton({
   Name = "No Fall damage",
   Callback = function()
local v0=game:GetService("Players");local v1=game:GetService("RunService");local v2=game:GetService("UserInputService");local v3=v0.LocalPlayer;local v4=v3.Character or v3.CharacterAdded:Wait() ;local v5=v4:WaitForChild("Humanoid");local v6=v4:WaitForChild("HumanoidRootPart");local v7=false;local v8=v6.Position.Y;local v9=false;local v10= -(1847 -(1228 + 618));local v11=50;v3.CharacterAdded:Connect(function(v12) local v13=0;while true do if (v13==0) then v4=v12;v5=v12:WaitForChild("Humanoid");v13=1 -0 ;end if (v13==1) then v6=v12:WaitForChild("HumanoidRootPart");v7=false;v13=7 -5 ;end if (v13==2) then pcall(function() v5.PlatformStand=false;end);v8=v6.Position.Y;break;end end end);v2.InputBegan:Connect(function(v14) if v7 then local v20=952 -(802 + 150) ;local v21;while true do if (v20==(0 -0)) then v21={Enum.KeyCode.W,Enum.KeyCode.A,Enum.KeyCode.S,Enum.KeyCode.D,Enum.KeyCode.Space,Enum.KeyCode.LeftShift};for v33=1 + 0 , #v21 do if (v14.KeyCode==v21[v33]) then return;end end break;end end end end);v2.InputChanged:Connect(function(v15) if v7 then local v22={Enum.KeyCode.W,Enum.KeyCode.A,Enum.KeyCode.S,Enum.KeyCode.D,Enum.KeyCode.Space,Enum.KeyCode.LeftShift};for v24=1 -0 , #v22 do if (v15.KeyCode==v22[v24]) then return;end end end end);v1.Heartbeat:Connect(function(v16) local v17=0 + 0 ;local v18;local v19;while true do if (v17==(792 -(368 + 423))) then v19=v18-v8 ;v8=v18;v17=6 -4 ;end if (0==v17) then if v5.SeatPart then local v27=18 -(10 + 8) ;while true do if (1==v27) then return;end if (v27==0) then if v7 then local v39=0 -0 ;while true do if (v39==(443 -(416 + 26))) then print("Flug pausiert wegen Sitzen");break;end if (v39==0) then v7=false;pcall(function() v5.PlatformStand=false;end);v39=3 -2 ;end end end v9=true;v27=1 + 0 ;end end else v9=false;end v18=v6.Position.Y;v17=1 -0 ;end if (v17==2) then if ((v19<v10) and  not v7 and  not v9) then local v28=438 -(145 + 293) ;while true do if (v28==(431 -(44 + 386))) then print("Flugmodus: AN");break;end if (v28==(1486 -(998 + 488))) then v7=true;pcall(function() v5.PlatformStand=true;end);v28=1 + 0 ;end end end if (v7 and (math.abs(v19)<(0.01 + 0))) then v7=false;pcall(function() v5.PlatformStand=false;end);print("Flugmodus: AUS (Y stabil)");return;end v17=775 -(201 + 571) ;end if (v17==3) then if v7 then local v29=1138 -(116 + 1022) ;local v30;local v31;local v32;while true do if (v29==(0 -0)) then v30=v6.Position;v31,v32,v31=v6.Orientation:ToEulerAnglesYXZ();v29=1 + 0 ;end if (v29==(3 -2)) then v6.CFrame=CFrame.new(v30) * CFrame.Angles(0 -0 ,math.rad(v32),859 -(814 + 45) ) ;v6.Velocity=Vector3.new(0 -0 ,v6.Velocity.Y,0);break;end end end break;end end end);
   end,
})
    
-- Anti Void
Useful:CreateToggle({
    Name = "Anti Void",
    CurrentValue = false,
    Flag = "AntiVoid",
    Callback = function(Value)
        _G.AntiVoid = Value
        if Value then
            spawn(function()
                while _G.AntiVoid do
                    local player = game.Players.LocalPlayer
                    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        if player.Character.HumanoidRootPart.Position.Y < -20 then
                            player.Character.HumanoidRootPart.CFrame = CFrame.new(0,50,0)
                        end
                    end
                    task.wait(0.2)
                end
            end)
        end
    end
})

-- Anti Seat Lock
Useful:CreateToggle({
    Name = "Anti Seat Lock",
    CurrentValue = false,
    Flag = "AntiSeat",
    Callback = function(Value)
        _G.AntiSeat = Value
        if Value then
            spawn(function()
                while _G.AntiSeat do
                    local player = game.Players.LocalPlayer
                    if player.Character then
                        local hum = player.Character:FindFirstChildOfClass("Humanoid")
                        if hum and hum.Sit then
                            hum.Sit = false
                        end
                    end
                    task.wait(0.2)
                end
            end)
        end
    end
})

-- Anti Freeze
Useful:CreateToggle({
    Name = "Anti Freeze",
    CurrentValue = false,
    Flag = "AntiFreeze",
    Callback = function(Value)
        _G.AntiFreeze = Value
        if Value then
            spawn(function()
                while _G.AntiFreeze do
                    local player = game.Players.LocalPlayer
                    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        local root = player.Character.HumanoidRootPart
                        if root.Anchored == true then
                            root.Anchored = false
                        end
                    end
                    task.wait(0.2)
                end
            end)
        end
    end
})

-- Reset Stats
Useful:CreateToggle({
    Name = "Reset Stats",
    CurrentValue = false,
    Flag = "ResetStats",
    Callback = function(Value)
        _G.ResetStats = Value
        local player = game.Players.LocalPlayer
        local defaultWalkSpeed = 16
        local defaultJumpPower = 50

        local function applyReset(char)
            local hum = char:WaitForChild("Humanoid")
            hum:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
                if _G.ResetStats and hum.WalkSpeed ~= defaultWalkSpeed then
                    hum.WalkSpeed = defaultWalkSpeed
                end
            end)
            hum:GetPropertyChangedSignal("JumpPower"):Connect(function()
                if _G.ResetStats and hum.JumpPower ~= defaultJumpPower then
                    hum.JumpPower = defaultJumpPower
                end
            end)
        end

        if player.Character then
            applyReset(player.Character)
        end
        player.CharacterAdded:Connect(applyReset)
    end
})

-- Sección Teleport
local TP = Useful:CreateSection("Teleport")

-- Variable global para guardar posición
_G.SavedPosition = nil

-- Botón Set Position
Useful:CreateButton({
    Name = "Set Position",
    Callback = function()
        local player = game.Players.LocalPlayer
        local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            _G.SavedPosition = hrp.Position
            game.StarterGui:SetCore("SendNotification", {
                Title = "Position Saved",
                Text = "Coordinates saved successfully!",
                Duration = 3
            })
        end
    end
})

-- Botón Teleport
Useful:CreateButton({
    Name = "Teleport 2 Saved Position",
    Callback = function()
        local player = game.Players.LocalPlayer
        local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            if _G.SavedPosition then
                hrp.CFrame = CFrame.new(_G.SavedPosition)
                game.StarterGui:SetCore("SendNotification", {
                    Title = "Teleported",
                    Text = "You have been teleported 2 the saved position!",
                    Duration = 3
                })
            else
                game.StarterGui:SetCore("SendNotification", {
                    Title = "Error",
                    Text = "No saved position found. Press 'Set Position' first.",
                    Duration = 3
                })
            end
        end
    end
})

local Combat = Useful:CreateSection("Combat")

local Button = Useful:CreateButton({
   Name = "Hitbox Expander (Not Mine)",
   Callback = function()
   		loadstring(game:HttpGet("https://raw.githubusercontent.com/Qwoqeex/Hitbox-Expander/refs/heads/main/Hitboxes"))()
   end,
})


    local Devs = Useful:CreateSection("Devs")
   
    local Fun = Window:CreateTab("Fun", 4483362458) -- Title, Image

    local Tools = Fun:CreateSection("Tools")


local Button = Fun:CreateButton({
   Name = "Tp tool",
   Callback = function()
   --// Simple TP Tool (persists after death)
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local camera = Workspace.CurrentCamera

local tp_height = 3
local cooldown = 0.3
local last_tp = 0

--// Create the TP Tool
local function createTPTool()
	local tool = Instance.new("Tool")
	tool.Name = "TP Tool"
	tool.RequiresHandle = false
	tool.ToolTip = "Click to teleport"
	
	local function canTeleport()
		local now = tick()
		if now - last_tp < cooldown then
			return false
		end

		local char = player.Character
		if not char then return false end

		local hum = char:FindFirstChild("Humanoid")
		local root = char:FindFirstChild("HumanoidRootPart")
		if not hum or not root or hum.Health <= 0 then
			return false
		end

		return true
	end

	local function teleportTo(pos)
		if not canTeleport() then return end
		last_tp = tick()

		local char = player.Character
		local root = char and char:FindFirstChild("HumanoidRootPart")
		if root then
			root.CFrame = CFrame.new(pos + Vector3.new(0, tp_height, 0))
		end
	end

	-- PC: click to teleport
	tool.Activated:Connect(function()
		if not UserInputService.TouchEnabled then
			local mouse = player:GetMouse()
			if mouse and mouse.Hit then
				teleportTo(mouse.Hit.Position)
			end
		end
	end)

	-- Mobile: tap to teleport
	local touchConnection
	tool.Equipped:Connect(function()
		if UserInputService.TouchEnabled then
			touchConnection = UserInputService.InputEnded:Connect(function(input, processed)
				if input.UserInputType == Enum.UserInputType.Touch and not processed then
					local ray = camera:ScreenPointToRay(input.Position.X, input.Position.Y)
					local result = Workspace:Raycast(ray.Origin, ray.Direction * 1000)
					if result then
						teleportTo(result.Position)
					else
						teleportTo(ray.Origin + ray.Direction * 20)
					end
				end
			end)
		end
	end)

	tool.Unequipped:Connect(function()
		if touchConnection then
			touchConnection:Disconnect()
			touchConnection = nil
		end
	end)

	return tool
end

--// Give the TP tool every spawn
local function giveTPTool()
	local backpack = player:WaitForChild("Backpack")
	local tpTool = createTPTool()
	tpTool.Parent = backpack
end

-- Give when the player spawns
if player.Character then
	giveTPTool()
end

player.CharacterAdded:Connect(function()
	task.wait(1)
	giveTPTool()
end)

   end,
})
        
local Button = Useful:CreateButton({
   Name = "Free private server",
   Callback = function()
   
loadstring(game:HttpGet("https://gist.githubusercontent.com/Tesker-103/ed48b3ae8120b0c040584b661cbda063/raw/210408b3f107dc740a4c9b832bfa647f92aa25d1/FreePrivateServerGUI"))()
   end,
})

local Button = Fun:CreateButton({
   Name = "Delete gui",
   Callback = function()

-- Source Code Skidds

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local lp = Players.LocalPlayer
local Mouse = lp:GetMouse()

local history = {}
local uiVisible = true

-- UI Creation
local gui = Instance.new("ScreenGui", lp:WaitForChild("PlayerGui"))
gui.Name = "DeleteUndoGUI"
gui.ResetOnSpawn = false

local main = Instance.new("Frame", gui)
main.Name = "MainUI"
main.Size = UDim2.new(0, 200, 0, 130)
main.Position = UDim2.new(0.02, 0, 0.2, 0)
main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
main.BorderSizePixel = 0
main.BackgroundTransparency = 0.1
main.Visible = true
main.Active = true
main.Draggable = true

local UIStroke = Instance.new("UIStroke", main)
UIStroke.Thickness = 2
UIStroke.Color = Color3.fromRGB(100, 255, 255)
UIStroke.Transparency = 0.3

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 25)
title.BackgroundTransparency = 1
title.Text = "🧱 Delete / Undo"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 16

local deleteToggle = Instance.new("TextButton", main)
deleteToggle.Size = UDim2.new(1, -20, 0, 30)
deleteToggle.Position = UDim2.new(0, 10, 0, 35)
deleteToggle.Text = "Delete: ON"
deleteToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
deleteToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
deleteToggle.Font = Enum.Font.Gotham
deleteToggle.TextSize = 14

local undoBtn = Instance.new("TextButton", main)
undoBtn.Size = UDim2.new(1, -20, 0, 30)
undoBtn.Position = UDim2.new(0, 10, 0, 70)
undoBtn.Text = "Undo"
undoBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
undoBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
undoBtn.Font = Enum.Font.Gotham
undoBtn.TextSize = 14

local toggleBtn = Instance.new("TextButton", gui)
toggleBtn.Size = UDim2.new(0, 40, 0, 40)
toggleBtn.Position = UDim2.new(0, 10, 0.8, 0)
toggleBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
toggleBtn.Text = "⛶"
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextSize = 20
toggleBtn.BorderSizePixel = 0

-- Functionality
local deleting = true

deleteToggle.MouseButton1Click:Connect(function()
	deleting = not deleting
	deleteToggle.Text = "Delete: " .. (deleting and "ON" or "OFF")
	deleteToggle.BackgroundColor3 = deleting and Color3.fromRGB(50, 50, 50) or Color3.fromRGB(80, 20, 20)
end)

Mouse.Button1Down:Connect(function()
	if not deleting then return end
	local target = Mouse.Target
	if target and target:IsA("BasePart") and not target:IsDescendantOf(lp.Character) then
		local clone = target:Clone()
		local props = {
			Parent = target.Parent,
			Material = target.Material,
			Color = target.Color,
			Size = target.Size,
			CFrame = target.CFrame,
			Anchored = target.Anchored,
			Transparency = target.Transparency,
			CanCollide = target.CanCollide,
			Name = target.Name
		}
		table.insert(history, {props = props, clone = clone})
		target:Destroy()
	end
end)

undoBtn.MouseButton1Click:Connect(function()
	if #history == 0 then return end
	local data = table.remove(history)
	local newPart = data.clone:Clone()
	for prop, val in pairs(data.props) do
		newPart[prop] = val
	end
	newPart.Parent = data.props.Parent
end)

toggleBtn.MouseButton1Click:Connect(function()
	uiVisible = not uiVisible
	main.Visible = uiVisible
end)
            
   end,
})



    local Button = Fun:CreateButton({
   Name = "F3X tool (NOT FE)",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/SkireScripts/F3X-Panel/main/Main.lua"))()
   end,
}) --Clean

    local Jerk = Fun:CreateSection("SUS")

    local Button = Fun:CreateButton({
   Name = "Sus anim (r6)",
   Callback = function()


loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/LuauIsBluu/BluuGui-by-118o8/refs/heads/main/Sus%20anim"))()
   
    end,
})

local Button = Fun:CreateButton({
   Name = "Sus anim (r15)",
   Callback = function()


loadstring(game:HttpGet("https://raw.githubusercontent.com/LuauIsBluu/BluuGui-by-118o8/refs/heads/main/Sus%20anim%20(r15)"))()

   
    end,
})

local Button = Useful:CreateButton({
   Name = "StrawberryCMD",
   Callback = function()
   
loadstring(game:HttpGet("https://raw.githubusercontent.com/StrawberryRBLX/Strawberry-Scanner/refs/heads/main/release/scanner.lua"))()
   end,
})

local Button = Useful:CreateButton({
   Name = "QuirkyCMD",
   Callback = function()
   
loadstring(game:HttpGet("https://gist.github.com/someunknowndude/38cecea5be9d75cb743eac8b1eaf6758/raw"))()
   end,
})

local Button = Useful:CreateButton({
   Name = "Dex",
   Callback = function()
   
loadstring(game:HttpGet("https://github.com/AZYsGithub/DexPlusPlus/releases/latest/download/out.lua"))()
   end,
})


  local Button = Trolling:CreateButton({
   Name = "Touch fling",
   Callback = function()
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextButton = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderColor3 = Color3.fromRGB(255, 255, 255)
Frame.BorderSizePixel = 2
Frame.Position = UDim2.new(0.341826946, 0, 0.367763907, 0)
Frame.Size = UDim2.new(0, 148, 0, 106)

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BorderSizePixel = 2
TextButton.Position = UDim2.new(0.0835492909, 0, 0.552504063, 0)
TextButton.Size = UDim2.new(0, 124, 0, 37)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "OFF"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextSize = 41.000

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.0649713054, 0, 0.0727680102, 0)
TextLabel.Size = UDim2.new(0, 128, 0, 39)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Touch Fling"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 34.000

-- Scripts:

local function CTIKC_fake_script() -- TextButton.LocalScript 
	local script = Instance.new('LocalScript', TextButton)

	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local RunService = game:GetService("RunService")
	local Players = game:GetService("Players")
	
	local toggleButton = script.Parent
	local hiddenfling = false
	
	
	if not ReplicatedStorage:FindFirstChild("juisdfj0i32i0eidsuf0iok") then
		local detection = Instance.new("Decal")
		detection.Name = "juisdfj0i32i0eidsuf0iok"
		detection.Parent = ReplicatedStorage
	end
	
	local function fling()
		local hrp, c, vel, movel = nil, nil, nil, 0.1
		local lp = Players.LocalPlayer
	
		while true do
			RunService.Heartbeat:Wait()
			if hiddenfling then
				while hiddenfling and not (c and c.Parent and hrp and hrp.Parent) do
					RunService.Heartbeat:Wait()
					c = lp.Character
					hrp = c and c:FindFirstChild("HumanoidRootPart")
				end
	
				if hiddenfling then
					vel = hrp.Velocity
					hrp.Velocity = vel * 10000 + Vector3.new(0, 10000, 0)
					RunService.RenderStepped:Wait()
					if c and c.Parent and hrp and hrp.Parent then
						hrp.Velocity = vel
					end
					RunService.Stepped:Wait()
					if c and c.Parent and hrp and hrp.Parent then
						hrp.Velocity = vel + Vector3.new(0, movel, 0)
						movel = movel * -1
					end
				end
			end
		end
	end
	
	toggleButton.MouseButton1Click:Connect(function()
		hiddenfling = not hiddenfling
		if hiddenfling then
			toggleButton.Text = "ON"
		else
			toggleButton.Text = "OFF"
		end
	end)
	
	fling()
	
end
coroutine.wrap(CTIKC_fake_script)()
local function FFJFK_fake_script() -- Frame.LocalScript 
	local script = Instance.new('LocalScript', Frame)

	script.Parent.Active = true
	script.Parent.Draggable = true
end
coroutine.wrap(FFJFK_fake_script)()
                                                            
   end,
})

local Button = MainTab:CreateButton({
   Name = "tp gui",
   Callback = function()
   local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

-- Colors
local bluuColor = Color3.fromRGB(121,156,208) -- #799cd0
local blackColor = Color3.fromRGB(0,0,0)

-- Create mini GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MiniTPGUI"
screenGui.Parent = game.CoreGui

-- Notification function
local function notify(title, text, duration)
    local notif = Instance.new("TextLabel")
    notif.Size = UDim2.new(0,250,0,50)
    notif.Position = UDim2.new(0.5,-125,0.05,0)
    notif.BackgroundColor3 = blackColor
    notif.TextColor3 = bluuColor
    notif.TextScaled = true
    notif.Text = title.."\n"..text
    notif.Parent = screenGui

    delay(duration, function()
        notif:Destroy()
    end)
end

notify("Mini TP", "Loaded! Drag and click TP ON/OFF", 3)

-- Main frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0,160,0,80)
frame.Position = UDim2.new(0.85,0,0.05,0) -- corner
frame.BackgroundColor3 = blackColor
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

-- TP toggle button
local tpToggle = Instance.new("TextButton")
tpToggle.Size = UDim2.new(1, -10, 0, 50)
tpToggle.Position = UDim2.new(0,5,0,15)
tpToggle.Text = "TP: OFF"
tpToggle.BackgroundColor3 = blackColor
tpToggle.TextColor3 = bluuColor
tpToggle.TextScaled = true
tpToggle.Parent = frame

-- Close button
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0,25,0,25)
closeBtn.Position = UDim2.new(1,-30,0,5)
closeBtn.Text = "X"
closeBtn.BackgroundColor3 = blackColor
closeBtn.TextColor3 = bluuColor
closeBtn.TextScaled = true
closeBtn.Parent = frame

local tpOn = false

tpToggle.MouseButton1Click:Connect(function()
    tpOn = not tpOn
    tpToggle.Text = tpOn and "TP: ON" or "TP: OFF"
end)

closeBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Teleport logic
mouse.Button1Down:Connect(function()
    if tpOn and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local pos = mouse.Hit.Position + Vector3.new(0,2.5,0)
        player.Character.HumanoidRootPart.CFrame = CFrame.new(pos)
    end
end)

   end,
})

local Button = Useful:CreateButton({
   Name = "Debug tools",
   Callback = function()
            
loadstring(game:HttpGet("https://raw.githubusercontent.com/LuauIsBluu/BluuGui-by-118o8/refs/heads/main/Debuger"))()
  
    end,
})

local Section = Useful:CreateSection("Byapass")

local Button = Useful:CreateButton({
   Name = "Try to delete ani-cheat",
   Callback = function()

-- Long list of AC keywords
local ACS = {
    "anti", "ac", "anti-cheat", "anticheat", "antifly", "antispeed", "antitp", "antiteleport",
    "antidex", "antiflight", "anti remote", "client", "anti remote manipulation",
    "antihack", "antigrief", "antijump", "antifreeze", "antigravity", "antiteleportation",
    "antibot", "antispawn", "antidetect", "antithief", "antiwall", "antiscript", "anticlone",
    "antiexploit", "antitamper", "antitampering", "antisabotage", "antimalware", "antivirus",
    "acscript", "acmodule", "aclua", "anticheater", "antihacker", "antiplayer", "anticheatsystem",
    "clientguard", "clientprotect", "securitymodule", "safescript", "antiforce", "antiautofarm",
    "antispam", "antiremote", "aclocal", "acserver"
}

-- Scripts to ignore
local ignore = {"animate", "animation", "attacks", "bite", "ability", "abilities"}

-- Convert all keywords to lowercase
for i,v in ipairs(ACS) do ACS[i] = v:lower() end
for i,v in ipairs(ignore) do ignore[i] = v:lower() end

-- Helper function
local function containsKeyword(name, keywords)
    name = name:lower()
    for _, kw in ipairs(keywords) do
        if string.find(name, kw) then
            return true
        end
    end
    return false
end

-- Single scan of Workspace
for _, v in ipairs(game.Workspace:GetDescendants()) do
    if v:IsA("LocalScript") and not containsKeyword(v.Name, ignore) then
        if containsKeyword(v.Name, ACS) then
            -- Print parent hierarchy
            local directory = v.Name
            local parent = v.Parent
            while parent do
                directory = parent.Name .. "/" .. directory
                parent = parent.Parent
            end

            print("AC Detected and Destroyed: " .. directory .. " | Type = LocalScript")

            -- Rayfield notification
            if Rayfield then
                Rayfield:Notify({
                    Title = "Bluugui",
                    Content = "Eliminated: "..v.Name,
                    Duration = 6.5,
                    Image = 4483362458,
                })
            end

            -- Destroy the script
            v:Destroy()
        end
    end
end

            
   end,
})

local Button = Useful:CreateButton({
   Name = "Bypass adonis",
   Callback = function()
 
for k, v in pairs(getgc(true)) do
	if pcall(function()
		return rawget(v, "indexInstance")
	end) and type(rawget(v, "indexInstance")) == "table" and (rawget(v, "indexInstance"))[1] == "kick" then
		setreadonly(v, false)
		v.tvk = {
			"kick",
			function()
				return game.Workspace:WaitForChild("")
			end
		}
	end
end
   end,
})

local Button = Useful:CreateButton({
   Name = "Anti Kick (client Sided)",
   Callback = function()
           loadstring(game:HttpGet("https://raw.githubusercontent.com/LuauIsBluu/BluuGui-by-118o8/refs/heads/main/Anti%20Kick"))()
   end,
})
 
        local Button = Useful:CreateButton({
   Name = "Unban VC",
   Callback = function()
           voiceChatService = game:GetService("VoiceChatService")
voiceChatService:joinVoice()
   end,
})

Rayfield:Notify({
   Title = "Notification",
   Content = "BluuGui executed!",
   Duration = 3,
   Image = 4483362458,
})
