-- I would be happy for credits

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local MarketplaceService = game:GetService("MarketplaceService")


local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

    local Window = Rayfield:CreateWindow({
   Name = "XYLO HUB V.0.2",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "XYLO HUB",
   LoadingSubtitle = "BETA",
   ShowText = "XYLO HUB", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "c5uVTcHtzJ", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "XYLO KEY",
      Subtitle = "Key System",
      Note = "KEY IN https://discord.gg/c5uVTcHtzJ", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"XYLO-9F4T-Q7LM-2V8R"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})


local MainTab = Window:CreateTab("🏠 HOME", nil) -- Title, Image


local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HRP = Character:WaitForChild("HumanoidRootPart")
local Humanoid = Character:WaitForChild("Humanoid")

local SpeedMultiplier = 1.0 -- wird sofort vom Slider überschrieben

-- // Slider Setup \\ --
local Slider = MainTab:CreateSlider({ 
    Name = "Walkspeed", 
    Range = {1, 20}, -- 1x = normal, 2x = doppelt so schnell usw.
    Increment = 0.1,
    Suffix = "x",
    CurrentValue = 1.0,
    Flag = "WSlider",
    Callback = function(Value)
        SpeedMultiplier = Value
    end,
})

-- // Bewegung per RenderStepped \\ --
RunService.RenderStepped:Connect(function(dt)
    if Humanoid and HRP and SpeedMultiplier > 1 and Humanoid.MoveDirection.Magnitude > 0 then
        local moveDir = Humanoid.MoveDirection.Unit
        local extraSpeed = Humanoid.WalkSpeed * (SpeedMultiplier - 1)
        HRP.CFrame = HRP.CFrame + (moveDir * extraSpeed * dt)
    end
end)

-- // Fix nach Respawn \\ --
LocalPlayer.CharacterAdded:Connect(function(char)
    Character = char
    HRP = char:WaitForChild("HumanoidRootPart")
    Humanoid = char:WaitForChild("Humanoid")
end)




local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local activeESPs = {} -- speichert ESP-GUI & Connections pro Player

local function createESP(player)
    if player == LocalPlayer then return end
    if activeESPs[player] then return end -- Schon ESP aktiv

    if not player.Character or not player.Character:FindFirstChild("Head") then return end
    local head = player.Character.Head

    -- BillboardGui
    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Name = "ESPBillboard"
    billboardGui.Size = UDim2.new(0, 150, 0, 70)
    billboardGui.Adornee = head
    billboardGui.AlwaysOnTop = true
    billboardGui.StudsOffset = Vector3.new(0, 2, 0)

    local nameLabel = Instance.new("TextLabel", billboardGui)
    nameLabel.Size = UDim2.new(1, 0, 0.4, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.TextColor3 = Color3.new(1, 1, 1)
    nameLabel.TextStrokeTransparency = 0
    nameLabel.Text = player.Name
    nameLabel.TextScaled = true
    nameLabel.Font = Enum.Font.SourceSansBold

    local distanceLabel = Instance.new("TextLabel", billboardGui)
    distanceLabel.Size = UDim2.new(1, 0, 0.3, 0)
    distanceLabel.Position = UDim2.new(0, 0, 0.4, 0)
    distanceLabel.BackgroundTransparency = 1
    distanceLabel.TextColor3 = Color3.new(1, 1, 0)
    distanceLabel.TextStrokeTransparency = 0
    distanceLabel.TextScaled = true
    distanceLabel.Font = Enum.Font.SourceSans

    local teamLabel = Instance.new("TextLabel", billboardGui)
    teamLabel.Size = UDim2.new(1, 0, 0.3, 0)
    teamLabel.Position = UDim2.new(0, 0, 0.7, 0)
    teamLabel.BackgroundTransparency = 1
    teamLabel.TextStrokeTransparency = 0
    teamLabel.TextScaled = true
    teamLabel.Font = Enum.Font.SourceSansBold

    if player.Team then
        teamLabel.Text = "Team: " .. player.Team.Name
        teamLabel.TextColor3 = player.Team.TeamColor.Color
    else
        teamLabel.Text = "Team: None"
        teamLabel.TextColor3 = Color3.new(1, 1, 1)
    end

    billboardGui.Parent = head

    -- Box
    local box = Instance.new("BoxHandleAdornment")
    box.Name = "ESPBox"
    box.Adornee = player.Character:FindFirstChild("HumanoidRootPart") or head
    box.AlwaysOnTop = true
    box.ZIndex = 5
    box.Size = Vector3.new(4, 6, 2)
    box.Color3 = Color3.new(0, 1, 0)
    box.Transparency = 0.5
    box.Parent = head

    -- Linie
    local line = Instance.new("Beam")
    line.Name = "ESPLine"

    local attachment0 = Instance.new("Attachment")
    attachment0.Name = "Attachment0"
    local localHRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not localHRP then return end
    attachment0.Parent = localHRP

    local attachment1 = Instance.new("Attachment")
    attachment1.Name = "Attachment1"
    attachment1.Parent = player.Character:FindFirstChild("HumanoidRootPart") or head

    line.Attachment0 = attachment0
    line.Attachment1 = attachment1
    line.FaceCamera = true
    line.Width0 = 0.1
    line.Width1 = 0.1
    line.Color = ColorSequence.new(Color3.new(0, 1, 0))
    line.Parent = attachment0

    -- Update Distanz
    local conn = RunService.RenderStepped:Connect(function()
        if not player.Character or not player.Character.Parent or not LocalPlayer.Character or not LocalPlayer.Character.Parent then
            conn:Disconnect()
            if billboardGui then billboardGui:Destroy() end
            if box then box:Destroy() end
            if line then line:Destroy() end
            activeESPs[player] = nil
            return
        end
        local dist = (player.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        distanceLabel.Text = ("Distance: %.1f studs"):format(dist)
    end)

    activeESPs[player] = {
        Billboard = billboardGui,
        Box = box,
        Line = line,
        Connection = conn,
        Attachments = {attachment0, attachment1}
    }
end

local function removeESP(player)
    local esp = activeESPs[player]
    if esp then
        esp.Connection:Disconnect()
        if esp.Billboard then esp.Billboard:Destroy() end
        if esp.Box then esp.Box:Destroy() end
        if esp.Line then esp.Line:Destroy() end
        for _, attach in pairs(esp.Attachments) do
            if attach then attach:Destroy() end
        end
        activeESPs[player] = nil
    end
end

-- Einmalige Events außerhalb Toggle
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        if Toggle:Get() then
            createESP(player)
        end
    end)
end)

-- Toggle
local Toggle = MainTab:CreateToggle({
   Name = "ESP",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
      if Value then
         for _, player in pairs(Players:GetPlayers()) do
            createESP(player)
         end
      else
         for _, player in pairs(Players:GetPlayers()) do
            removeESP(player)
         end
      end
   end,
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local AIM_RADIUS = 150
local AIM_SMOOTHNESS = 0.35

local aiming = false
local connection

local function getClosestTarget()
    local closestTarget = nil
    local shortestDistance = AIM_RADIUS

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
            local part = player.Character:FindFirstChild("Head") or player.Character:FindFirstChild("HumanoidRootPart")
            if part then
                local screenPoint, onScreen = Camera:WorldToViewportPoint(part.Position)
                local mousePos = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                local targetPos = Vector2.new(screenPoint.X, screenPoint.Y)
                local distance = (mousePos - targetPos).Magnitude

                if onScreen and distance < shortestDistance then
                    shortestDistance = distance
                    closestTarget = part
                end
            end
        end
    end
    return closestTarget
end

local Toggle = MainTab:CreateToggle({
    Name = "Aimbot",
    CurrentValue = false,
    Flag = "AB",
    Callback = function(Value)
        aiming = Value

        if aiming then
            connection = RunService.RenderStepped:Connect(function()
                local target = getClosestTarget()
                if target then
                    local camPos = Camera.CFrame.Position
                    local direction = (target.Position - camPos).Unit
                    local newCF = CFrame.new(camPos, camPos + direction)

                    Camera.CFrame = Camera.CFrame:Lerp(newCF, AIM_SMOOTHNESS)
                end
            end)
        else
            if connection then
                connection:Disconnect()
                connection = nil
            end
        end
    end,
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

-- Funktion zur Aktualisierung
local function updateJumpPower(value)
    if Humanoid then
        Humanoid.JumpPower = value
    end
end

-- Bei Respawn JumpPower erneut setzen
LocalPlayer.CharacterAdded:Connect(function(char)
    local newHumanoid = char:WaitForChild("Humanoid")
    Humanoid = newHumanoid
    newHumanoid.JumpPower = Slider.CurrentValue
end)

-- UI Slider
local Slider = MainTab:CreateSlider({ 
   Name = "Jump Power", 
   Range = {0, 1000},
   Increment = 10,
   Suffix = "JP", -- kannst wieder "Bananas" machen lol
   CurrentValue = 10,
   Flag = "Slider1",
   Callback = function(Value)
       updateJumpPower(Value)
   end,
})

-- Rayfield-Toggle
local Toggle = MainTab:CreateToggle({
    Name = "NoClip",
    CurrentValue = false,
    Flag = "NC",
    Callback = function(state)
        _G.NoclipCharacter = state
        
        -- Noclip deaktivieren
        if state == false then
            if game.Players.LocalPlayer.Character ~= nil then
                for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v:IsA("BasePart") and v.CanCollide == false then
                        v.CanCollide = true
                    end
                end
            end
            return
        end
        
        -- Noclip aktivieren (Loop)
        while _G.NoclipCharacter and task.wait() do
            if game.Players.LocalPlayer.Character ~= nil then
                for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
        end
    end,
})


local VisualsTab = Window:CreateTab("👁️Visuals", nil) -- Title, Image

local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")

local LocalPlayer = Players.LocalPlayer
local AuraFarmingEnabled = false

-- 🛠️ Toggle UI (an dein UI-System anpassen, z. B. Rayfield oder Kavo)
local Toggle = VisualsTab:CreateToggle({
    Name = "AURA FARMING",
    CurrentValue = false,
    Flag = "AuraFarmingToggle",
    Callback = function(Value)
        AuraFarmingEnabled = Value

        if Value and LocalPlayer.Character then
            activateAuraFarming(LocalPlayer.Character)
        else
            deactivateAuraFarming(LocalPlayer.Character)
        end
    end,
})

-- ✅ Effekt aktivieren
function activateAuraFarming(character)
    if not character then return end
    local head = character:FindFirstChild("Head")
    if not head then return end

    -- 🔴 Licht
    if not head:FindFirstChild("AuraLight") then
        local light = Instance.new("PointLight")
        light.Name = "AuraLight"
        light.Color = Color3.new(1, 0, 0)
        light.Brightness = 7
        light.Range = 14
        light.Shadows = true
        light.Parent = head
    end

    -- 🔊 Sound
    if not head:FindFirstChild("AuraSound") then
        local sound = Instance.new("Sound")
        sound.Name = "AuraSound"
        sound.SoundId = "rbxassetid://129098116998483" -- Deine Sound ID
        sound.Volume = 1
        sound.Looped = false
        sound.Parent = head
        sound:Play()
    end

    -- 🌌 Rote Atmosphäre
    if not Lighting:FindFirstChild("AuraAtmosphere") then
        local atmosphere = Instance.new("Atmosphere")
        atmosphere.Name = "AuraAtmosphere"
        atmosphere.Density = 0.4
        atmosphere.Offset = 0.25
        atmosphere.Color = Color3.new(1, 0, 0)
        atmosphere.Decay = Color3.new(0.6, 0, 0)
        atmosphere.Parent = Lighting
    end

    -- 🌃 Himmel rot färben
    Lighting.Ambient = Color3.new(0.4, 0, 0)
    Lighting.OutdoorAmbient = Color3.new(0.7, 0, 0)
    Lighting.FogColor = Color3.new(0.8, 0.1, 0.1)
    Lighting.FogStart = 0
    Lighting.FogEnd = 200
    Lighting.Brightness = 0.5
end

-- ❌ Effekt deaktivieren
function deactivateAuraFarming(character)
    if not character then return end
    local head = character:FindFirstChild("Head")
    if not head then return end

    if head:FindFirstChild("AuraLight") then
        head.AuraLight:Destroy()
    end
    if head:FindFirstChild("AuraSound") then
        head.AuraSound:Stop()
        head.AuraSound:Destroy()
    end
    if Lighting:FindFirstChild("AuraAtmosphere") then
        Lighting.AuraAtmosphere:Destroy()
    end

    -- 🌈 Lighting zurücksetzen (falls du Defaults hast, kannst du die hier anpassen)
    Lighting.Ambient = Color3.new(0.5, 0.5, 0.5)
    Lighting.OutdoorAmbient = Color3.new(0.5, 0.5, 0.5)
    Lighting.FogColor = Color3.new(1, 1, 1)
    Lighting.FogStart = 1000
    Lighting.FogEnd = 100000
    Lighting.Brightness = 1
end

-- 🔁 Für Respawns
LocalPlayer.CharacterAdded:Connect(function(char)
    if AuraFarmingEnabled then
        activateAuraFarming(char)
    else
        deactivateAuraFarming(char)
    end
end)

-- Toggle in deiner GUI
local Toggle = VisualsTab:CreateToggle({
    Name = "Invincibility",
    CurrentValue = false,
    Flag = "SelfReviveToggle",
    Callback = function(Value)
        SelfReviveEnabled = Value
    end,
})

-- Funktion, die deine Gesundheit wiederherstellt
local function keepAlive()
    local character = LocalPlayer.Character
    if not character then return end

    local humanoid = character:FindFirstChild("Humanoid")
    if not humanoid then return end

    if humanoid.Health < humanoid.MaxHealth then
        humanoid.Health = humanoid.MaxHealth
    end
end

-- Wiederholtes Heilen, solange Toggle aktiv
RunService.Heartbeat:Connect(function()
    if SelfReviveEnabled then
        keepAlive()
    end
end)

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

local flying = false
local speed = 10 -- Standardwert vom Slider
local bodyGyro, bodyVelocity

-- Fly starten
local function startFly()
	if flying then return end
	flying = true

	bodyGyro = Instance.new("BodyGyro")
	bodyGyro.P = 9e4
	bodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
	bodyGyro.CFrame = HumanoidRootPart.CFrame
	bodyGyro.Parent = HumanoidRootPart

	bodyVelocity = Instance.new("BodyVelocity")
	bodyVelocity.Velocity = Vector3.zero
	bodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
	bodyVelocity.Parent = HumanoidRootPart

	task.spawn(function()
		while flying do
			bodyGyro.CFrame = workspace.CurrentCamera.CFrame
			local moveDirection = Vector3.zero

			if UserInputService.KeyboardEnabled then
				-- PC Steuerung
				if UserInputService:IsKeyDown(Enum.KeyCode.W) then
					moveDirection += workspace.CurrentCamera.CFrame.LookVector
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.S) then
					moveDirection -= workspace.CurrentCamera.CFrame.LookVector
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.A) then
					moveDirection -= workspace.CurrentCamera.CFrame.RightVector
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.D) then
					moveDirection += workspace.CurrentCamera.CFrame.RightVector
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
					moveDirection += Vector3.new(0, 1, 0)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
					moveDirection -= Vector3.new(0, 1, 0)
				end
			elseif UserInputService.TouchEnabled then
				-- Mobile Steuerung mit Kamera
				local camLook = workspace.CurrentCamera.CFrame.LookVector
				local flatLook = Vector3.new(camLook.X, 0, camLook.Z).Unit

				if Player.Character:FindFirstChildOfClass("Humanoid").MoveDirection.Magnitude > 0 then
					moveDirection += flatLook
				end

				local camY = camLook.Y
				if camY > 0.3 then
					moveDirection += Vector3.new(0, 1, 0)
				elseif camY < -0.3 then
					moveDirection -= Vector3.new(0, 1, 0)
				end
			end

			bodyVelocity.Velocity = moveDirection * speed
			RunService.RenderStepped:Wait()
		end
	end)
end

-- Fly stoppen
local function stopFly()
	flying = false
	if bodyGyro then bodyGyro:Destroy() bodyGyro = nil end
	if bodyVelocity then bodyVelocity:Destroy() bodyVelocity = nil end
end

-- Toggle
local Toggle = MainTab:CreateToggle({ 
	Name = "Fly", 
	CurrentValue = false,
	Flag = "FLY",
	Callback = function(Value)
		if Value then
			startFly()
		else
			stopFly()
		end
	end,
})

-- Slider
local Slider = MainTab:CreateSlider({ 
	Name = "Fly speed", 
	Range = {0, 1000},
	Increment = 10,
	Suffix = " FSPEED",
	CurrentValue = 10,
	Flag = "FSLIDER",
	Callback = function(Value)
		speed = Value -- Geschwindigkeit live anpassen
	end,
})
