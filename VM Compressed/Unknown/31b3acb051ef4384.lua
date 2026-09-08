local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Stats = game:GetService("Stats")
local player = Players.LocalPlayer
workspace.FallenPartsDestroyHeight = -math.huge

pcall(function()
    ReplicatedStorage.RE["1RPNam1eTex1t"]:FireServer(table.unpack({[1]="RolePlayBio",[2]="toma chá "}))
    ReplicatedStorage.RE["1RPNam1eTex1t"]:FireServer(table.unpack({[1]="RolePlayName",[2]="CHACHADO USER†"}))
    ReplicatedStorage.RE["1RPNam1eColo1r"]:FireServer(table.unpack({[1]="PickingRPBioColor",[2]=Color3.new(0,0,0)}))
    ReplicatedStorage.RE["1RPNam1eColo1r"]:FireServer(table.unpack({[1]="PickingRPNameColor",[2]=Color3.new(1,1,1)}))
end)

local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Yuna-ux/Other-scripts/refs/heads/main/UI-Library.lua"))()
local Window = redzlib:MakeWindow({
    Title = "Chachado hub☕",
    Subtitle = "Brookhaven RP 🏡 - by ixi362",
    SaveFolder = "ChachadoHub"
})

Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://112995768245239", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(0, 35) }
})

local InfoTab = Window:MakeTab({ "Informations", "info" })

InfoTab:AddSection({ "Informations" })

InfoTab:AddSection({ "Credits" })
InfoTab:AddParagraph({ "Programmer:", "@ixi362Hack and chachado" })
InfoTab:AddParagraph({ "Team:", "ixi362 chachado Developers" })

InfoTab:AddSection({ "Discord" })
InfoTab:AddDiscordInvite({
    Name = "Chachado Studios",
    Description = "Stay up to date with all the news from our Hub",
    Logo = "rbxassetid://112995768245239",
    Invite = "https://discord.gg/zzkbTZmYb",
})

InfoTab:AddSection({ "Information" })
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")
local UserInputService = game:GetService("UserInputService")
local LocalizationService = game:GetService("LocalizationService")
local player = Players.LocalPlayer

local function getStatValue(parent, name)
    if parent then
        local obj = parent:FindFirstChild(name)
        if obj and obj.GetValue then
            local success, value = pcall(function() return obj:GetValue() end)
            if success then
                return math.floor(value)
            end
        end
    end
    return "Unidentified"
end

local info = {}

info["You Username:"] = player.Name or "Unidentified"
info["You Display Name:"] = player.DisplayName or "Unidentified"
info["You User Id:"] = player.UserId or "Unidentified"

local netStats = Stats:FindFirstChild("Network")
local serverStats = netStats and netStats:FindFirstChild("ServerStatsItem")
info["You Ping:"] = (serverStats and getStatValue(serverStats, "Data Ping") .. " ms") or "Unidentified"

if identifyexecutor then
    local success, name, version = pcall(function() return identifyexecutor() end)
    info["You Executor:"] = success and (name .. (version and (" v" .. version) or "")) or "Unidentified"
else
    info["You Executor:"] = "Unidentified"
end

for key, value in pairs(info) do
    InfoTab:AddParagraph({key, tostring(value)})
end
InfoTab:AddParagraph({ "You Language:", "English" })
InfoTab:AddParagraph({ "You are Playing:", "Brookhaven RP 🏡" })
InfoTab:AddParagraph({ "You are Using:", "Chachado hub" })
InfoTab:AddParagraph({ "You are Using Version:", "1.1.7 - Beta" })

InfoTab:AddSection({ "Warns" })
InfoTab:AddParagraph({ "Some functions in this script are not made by us, they are from other scripters" })
InfoTab:AddParagraph({ "Found an error? Just report it to one of our programmers" })

InfoTab:AddSection({ "Others" })
InfoTab:AddButton({
    Name = "Rejoin",
    Callback = function()
        local TeleportService = game:GetService("TeleportService")
        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
    end
})

local ShadersTab = Window:MakeTab({ "Shaders", "server" })

ShadersTab:AddSection({ "Shaders" })

ShadersTab:AddSection({ "Type 1 (Client-Sided)" })
ShadersTab:AddButton({
Name = "Enable Shaders (Irreversible)",
Callback = function()
local workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local Debris = game:GetService("Debris")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local model = workspace:FindFirstChild("Model")

if model then
	local function setMat(obj)
		for _, c in pairs(obj:GetChildren()) do
			if c:IsA("BasePart") then
				c.Material = Enum.Material.Basalt
			elseif c:IsA("Model") or c:IsA("Folder") then
				setMat(c)
			end
		end
	end
	if model:FindFirstChild("001_SnowStreet") then
		setMat(model["001_SnowStreet"])
	end
	if model:FindFirstChild("Street") then
		for _, o in pairs(model.Street:GetDescendants()) do
			if o:IsA("BasePart") then
				o.Material = Enum.Material.Basalt
			end
		end
	end
	for _, o in pairs(model:GetChildren()) do
		if o:IsA("BasePart") and (o.Name == "Sidewalk" or o.Name == "Wedge") and o.Material == Enum.Material.SmoothPlastic then
			o.Material = Enum.Material.Cobblestone
		end
	end
	model.ChildAdded:Connect(function(obj)
		if obj:IsA("BasePart") and (obj.Name == "Sidewalk" or obj.Name == "Wedge") and obj.Material == Enum.Material.SmoothPlastic then
			obj.Material = Enum.Material.Cobblestone
		end
	end)
end

local soundPart = Instance.new("Part")
soundPart.Size = Vector3.new(1,1,1)
soundPart.Transparency = 1
soundPart.Anchored = true
soundPart.CanCollide = false
soundPart.Parent = workspace
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

local birdSound = Instance.new("Sound")
birdSound.Name = "BirdsSound"
birdSound.SoundId = "rbxassetid://1237969272"
birdSound.Looped = true
birdSound.Volume = 0.05
birdSound.Parent = soundPart

local wolfSound = Instance.new("Sound")
wolfSound.SoundId = "rbxassetid://6654360741"
wolfSound.Volume = 0.05
wolfSound.Looped = false
wolfSound.Parent = workspace

RunService.Heartbeat:Connect(function()
	if hrp and hrp.Parent then
		soundPart.Position = hrp.Position + Vector3.new(0,10,0)
	end
end)

local function isNight()
	local t = Lighting.ClockTime
	return (t >= 18 or t <= 6)
end

task.spawn(function()
	while true do
		if isNight() then
			if birdSound.IsPlaying then birdSound:Stop() end
			if wolfSound.IsPlaying then wolfSound:Stop() end
			wolfSound:Play()
		else
			if wolfSound.IsPlaying then wolfSound:Stop() end
			if not birdSound.IsPlaying then birdSound:Play() end
		end
		wait(20)
	end
end)

local fountainPart = Instance.new("Part")
fountainPart.Anchored = true
fountainPart.CanCollide = false
fountainPart.Transparency = 1
fountainPart.Size = Vector3.new(1,1,1)
fountainPart.Position = Vector3.new(-27,19,15)
fountainPart.Parent = workspace

local attachment = Instance.new("Attachment")
attachment.Position = Vector3.new(-27,19,15)
attachment.Parent = fountainPart

local fountainSound = Instance.new("Sound")
fountainSound.Name = "FountainSound"
fountainSound.SoundId = "rbxassetid://4766793559"
fountainSound.Looped = true
fountainSound.Volume = 0.03
fountainSound.EmitterSize = 10
fountainSound.RollOffMode = Enum.RollOffMode.Linear
fountainSound.MaxDistance = 100
fountainSound.Parent = attachment
fountainSound:Play()

local customSound = Instance.new("Sound")
customSound.Name = "MyCustomSound"
customSound.SoundId = "rbxassetid://9048659736"
customSound.Volume = 0.01
customSound.Looped = true
customSound.PlayOnRemove = false
customSound.Parent = workspace
customSound:Play()

local active = false
local stars = {}
local shootingStarsFolder = Instance.new("Folder",workspace)
shootingStarsFolder.Name = "ShootingStars"
local STAR_COUNT = 300
local SHOOTING_STAR_CHANCE = 0.3
local SHOOTING_STAR_MAX = 12
local shootingStarCooldown = 0.1

local spaceSound = Instance.new("Sound",workspace)
spaceSound.SoundId = "rbxassetid://1843520836"
spaceSound.Volume = 0.3
spaceSound.Looped = true
spaceSound.Name = "SpaceAmbience"

local function createStar()
	local star = Instance.new("Part")
	local size = math.random(1,3)*0.5
	star.Size = Vector3.new(size,size,size)
	star.Position = Vector3.new(math.random(-1000,1000),math.random(300,700),math.random(-1000,1000))
	star.Anchored = true
	star.CanCollide = false
	star.Material = Enum.Material.Neon
	local colors = {Color3.fromRGB(255,255,255),Color3.fromRGB(255,255,180),Color3.fromRGB(180,200,255)}
	star.Color = colors[math.random(1,#colors)]
	star.Name = "Star"
	star.Parent = workspace
	local light = Instance.new("PointLight",star)
	light.Brightness = 2 + math.random()*1.5
	light.Range = 12
	spawn(function()
		while star.Parent and active do
			star.Transparency = 0.2 + math.sin(tick()*math.random(2,5))*0.2
			RunService.Heartbeat:Wait()
		end
		if star.Parent then star:Destroy() end
	end)
	table.insert(stars,star)
end

local function createShootingStar()
	if not active then return end
	local startPos = Vector3.new(math.random(-1000,1000),math.random(350,600),math.random(-1000,1000))
	local dir = Vector3.new(math.random(-1,1),math.random(-0.1,0.1),math.random(-1,1)).Unit
	local speed = math.random(350,550)
	local isFire = math.random() <= SHOOTING_STAR_CHANCE
	local color = isFire and Color3.fromRGB(255,50,50) or Color3.fromRGB(255,255,220)
	local trailColor = isFire and ColorSequence.new(Color3.fromRGB(255,120,0),Color3.fromRGB(255,230,50)) or ColorSequence.new(Color3.fromRGB(255,255,255),Color3.fromRGB(255,255,180))
	local star = Instance.new("Part")
	star.Size = Vector3.new(0.5,0.5,3)
	star.Position = startPos
	star.Anchored = true
	star.CanCollide = false
	star.Material = Enum.Material.Neon
	star.Color = color
	star.Name = "ShootingStar"
	star.Parent = shootingStarsFolder
	local att0 = Instance.new("Attachment",star)
	local att1 = Instance.new("Attachment",star)
	att1.Position = Vector3.new(0,0,-3)
	local trail = Instance.new("Trail",star)
	trail.Attachment0 = att0
	trail.Attachment1 = att1
	trail.Lifetime = 0.35
	trail.Color = trailColor
	trail.LightEmission = 1
	trail.WidthScale = NumberSequence.new({NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(1,0)})
	local light = Instance.new("PointLight",star)
	light.Brightness = isFire and 12 or 7
	light.Range = 35
	light.Color = color
	if isFire then
		local fire = Instance.new("Fire",star)
		fire.Heat = 15
		fire.Size = 3.5
		fire.Color = Color3.fromRGB(255,110,0)
		fire.SecondaryColor = Color3.fromRGB(255,210,0)
	end
	local lifetime = math.random(1,1.5)
	local timePassed = 0
	local moveConn
	moveConn = RunService.Heartbeat:Connect(function(dt)
		if not active then moveConn:Disconnect() if star.Parent then star:Destroy() end return end
		timePassed += dt
		if timePassed >= lifetime then moveConn:Disconnect() if star.Parent then star:Destroy() end return end
		local curve = math.sin(timePassed*20)*0.5
		star.Position += (dir+Vector3.new(0,curve,0)).Unit*speed*dt
	end)
	Debris:AddItem(star,4)
end

local function updateSky()
	local hour = Lighting.ClockTime
	local shouldBeActive = hour >= 18 or hour < 6
	if shouldBeActive and not active then
		active = true
		Lighting.FogColor = Color3.fromRGB(10,10,30)
		Lighting.FogEnd = 5000
		Lighting.Brightness = 2
		for _,s in ipairs(stars) do if s and s.Parent then s:Destroy() end end
		stars = {}
		for _,p in ipairs(shootingStarsFolder:GetChildren()) do p:Destroy() end
		for i=1,STAR_COUNT do createStar() end
		spaceSound:Play()
	elseif not shouldBeActive and active then
		active = false
		for _,s in ipairs(stars) do if s and s.Parent then s:Destroy() end end
		stars = {}
		for _,p in ipairs(shootingStarsFolder:GetChildren()) do p:Destroy() end
		spaceSound:Stop()
		Lighting.FogColor = Color3.fromRGB(192,192,192)
		Lighting.FogEnd = 100000
		Lighting.Brightness = 2
	end
end

task.spawn(function()
	while true do
		if active then
			for i=1,SHOOTING_STAR_MAX do
				createShootingStar()
				task.wait(shootingStarCooldown)
			end
		else
			task.wait(1)
		end
	end
end)

task.spawn(function()
	while true do
		updateSky()
		task.wait(1)
	end
end)

local rainFolder = Instance.new("Folder",workspace)
rainFolder.Name = "FakeRain"
local isRaining = false

local birds = Instance.new("Sound",SoundService)
birds.SoundId = "rbxassetid://9111139882"
birds.Volume = 0.2
birds.Looped = true
birds:Play()

local rainSound = Instance.new("Sound",SoundService)
rainSound.SoundId = "rbxassetid://9118823106"
rainSound.Volume = 0.3
rainSound.Looped = true
rainSound:Play()

local thunder = Instance.new("Sound",SoundService)
thunder.SoundId = "rbxassetid://9120018695"
thunder.Volume = 0.4

local function updateBirdSound()
	birds.Volume = isRaining and 0 or 0.2
end

local function spawnRain()
	isRaining = true
	updateBirdSound()
	for i=1,120 do
		local drop = Instance.new("Part")
		drop.Size = Vector3.new(0.1,2,0.1)
		drop.Anchored = true
		drop.CanCollide = false
		drop.Material = Enum.Material.Glass
		drop.Transparency = 0.5
		drop.Color = Color3.fromRGB(160,160,255)
		drop.Position = Vector3.new(math.random(-150,150),100,math.random(-150,150))
		drop.Parent = rainFolder
		local tween = TweenService:Create(drop,TweenInfo.new(1),{Position=drop.Position-Vector3.new(0,60,0)})
		tween:Play()
		Debris:AddItem(drop,1.5)
	end
	wait(1.5)
	isRaining = false
	updateBirdSound()
end

local function lightningStrike()
	local flash = Instance.new("Part")
	flash.Size = Vector3.new(1,1000,1)
	flash.Anchored = true
	flash.CanCollide = false
	flash.Transparency = 0.4
	flash.Material = Enum.Material.Neon
	flash.Color = Color3.new(1,1,1)
	flash.Position = Vector3.new(math.random(-100,100),500,math.random(-100,100))
	flash.Parent = workspace
	Lighting.Brightness = Lighting.Brightness + 1.5
	thunder:Play()
	wait(0.1)
	Lighting.Brightness = Lighting.Brightness - 1.5
	flash:Destroy()
end

for _,part in pairs(workspace:GetDescendants()) do
	if part:IsA("BasePart") and part.Material == Enum.Material.SmoothPlastic then
		part.Reflectance = 0.25
	end
end

task.spawn(function()
	while true do
		spawnRain()
		if math.random() < 0.2 then lightningStrike() end
		wait(1)
	end
end)

Lighting.Brightness = 2
Lighting.GlobalShadows = true
Lighting.OutdoorAmbient = Color3.fromRGB(70, 70, 70)
Lighting.FogColor = Color3.fromRGB(120, 130, 140)
Lighting.FogStart = 80
Lighting.FogEnd = 600
Lighting.EnvironmentSpecularScale = 1
Lighting.EnvironmentDiffuseScale = 0.5

local sky = Instance.new("Sky")
sky.SkyboxBk = "rbxassetid://159454299"
sky.SkyboxDn = "rbxassetid://159454296"
sky.SkyboxFt = "rbxassetid://159454293"
sky.SkyboxLf = "rbxassetid://159454286"
sky.SkyboxRt = "rbxassetid://159454300"
sky.SkyboxUp = "rbxassetid://159454304"
sky.Parent = Lighting

local color = Instance.new("ColorCorrectionEffect", Lighting)
color.Brightness = 0.03
color.Contrast = 0.15
color.Saturation = 0.05
color.TintColor = Color3.fromRGB(255, 240, 220)

local bloom = Instance.new("BloomEffect", Lighting)
bloom.Intensity = 0.8
bloom.Size = 56
bloom.Threshold = 0.9

local sunRays = Instance.new("SunRaysEffect", Lighting)
sunRays.Intensity = 0.05
sunRays.Spread = 0.8

local blur = Instance.new("BlurEffect", Lighting)
blur.Size = 0
end
})

local Tab = Window:MakeTab({"Teleports", "tp"}) 

local Section = Tab:AddSection({
    Name = "Teleports"
})

local teleportButtons = {
    {"Hotel", CFrame.new(192, 4, 272)},
    {"Urban Center", CFrame.new(136, 4, 117)},
    {"Criminal Area", CFrame.new(-119, -28, 235)},
    {"Abandoned House", CFrame.new(986, 4, 63)},
    {"Agency Portal", CFrame.new(672, 4, -296)},
    {"Hideout", CFrame.new(505, -75, 143)},
    {"School", CFrame.new(-312, 4, 211)},
    {"Burguer Barn", CFrame.new(161, 8, 52)},
    {"Starting Point", CFrame.new(-26, 4, -23)},
    {"Main Arch", CFrame.new(-589, 141, -59)},
    {"Hospital", CFrame.new(-309, 4, 71)},
    {"Agency Base", CFrame.new(179, 4, -464)},
    {"Hidden Place of the Workshop", CFrame.new(0, 4, -495)},
    {"Secret Place", CFrame.new(-343, 4, -613)},
    {"Isolated Island", CFrame.new(-1925, 23, 127)},
    {"Hotel Square", CFrame.new(182, 4, 150)},
    {"Climb Mountain", CFrame.new(-670, 251, 765)},
    {"Main Bank", CFrame.new(2.28, 4.65, 254.58)},
    {"Clothing Store", CFrame.new(-46.15, 4.65, 253.20)},
    {"Veterinary", CFrame.new(-88.48, 22.05, 262.34)},
    {"Dental Clinic", CFrame.new(-53.58, 22.15, 265.61)},
    {"Coffee", CFrame.new(-97.12, 4.65, 254.99)}
}

local Troll = Window:MakeTab({ Title = "Troll Players", Icon = "user" })

Troll:AddSection({Name = "Troll Players"})

Troll:AddSection({Name = "Players"})
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualInputManager = game:GetService("VirtualInputManager")
local RunService = game:GetService("RunService")
local cam = workspace.CurrentCamera

local selectedPlayerName = nil
local methodKill = nil
getgenv().Target = nil
local Character = LocalPlayer.Character
local Humanoid = Character and Character:WaitForChild("Humanoid")
local RootPart = Character and Character:WaitForChild("HumanoidRootPart")

local function cleanupCouch()
    local char = LocalPlayer.Character
    if char then
        local couch = char:FindFirstChild("Chaos.Couch") or LocalPlayer.Backpack:FindFirstChild("Chaos.Couch")
        if couch then
            couch:Destroy()
        end
    end
    ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer("ClearAllTools")
end

LocalPlayer.CharacterAdded:Connect(function(newCharacter)
    Character = newCharacter
    Humanoid = newCharacter:WaitForChild("Humanoid")
    RootPart = newCharacter:WaitForChild("HumanoidRootPart")
    cleanupCouch()
    
    Humanoid.Died:Connect(function()
        cleanupCouch()
    end)
end)

if Humanoid then
    Humanoid.Died:Connect(function()
        cleanupCouch()
    end)
end

local function KillPlayerCouch()
    if not selectedPlayerName then
        return
    end
    local target = Players:FindFirstChild(selectedPlayerName)
    if not target or not target.Character then
        return
    end

    local char = LocalPlayer.Character
    if not char then
        return
    end
    local hum = char:FindFirstChildOfClass("Humanoid")
    local root = char:FindFirstChild("HumanoidRootPart")
    local tRoot = target.Character and target.Character:FindFirstChild("HumanoidRootPart")
    if not hum or not root or not tRoot then
        return
    end

    local originalPos = root.Position 
    local sitPos = Vector3.new(145.51, -350.09, 21.58)

    ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer("ClearAllTools")
    task.wait(0.2)

    ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
    task.wait(0.3)

    local tool = LocalPlayer.Backpack:FindFirstChild("Couch")
    if tool then tool.Parent = char end
    task.wait(0.1)

    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F, false, game)
    task.wait(0.1)

    hum:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
    hum.PlatformStand = false
    cam.CameraSubject = target.Character:FindFirstChild("Head") or tRoot or hum

    local align = Instance.new("BodyPosition")
    align.Name = "BringPosition"
    align.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    align.D = 10
    align.P = 30000
    align.Position = root.Position
    align.Parent = tRoot

    task.spawn(function()
        local angle = 0
        local startTime = tick()
        while tick() - startTime < 5 and target and target.Character and target.Character:FindFirstChildOfClass("Humanoid") do
            local tHum = target.Character:FindFirstChildOfClass("Humanoid")
            if not tHum or tHum.Sit then break end

            local hrp = target.Character.HumanoidRootPart
            local adjustedPos = hrp.Position + (hrp.Velocity / 1.5)

            angle += 50
            root.CFrame = CFrame.new(adjustedPos + Vector3.new(0, 2, 0)) * CFrame.Angles(math.rad(angle), 0, 0)
            align.Position = root.Position + Vector3.new(2, 0, 0)

            task.wait()
        end

        align:Destroy()
        hum:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
        hum.PlatformStand = false
        cam.CameraSubject = hum

        for _, p in pairs(char:GetDescendants()) do
            if p:IsA("BasePart") then
                p.Velocity = Vector3.zero
                p.RotVelocity = Vector3.zero
            end
        end

        task.wait(0.1)
        root.CFrame = CFrame.new(sitPos)
        task.wait(0.3)

        local tool = char:FindFirstChild("Couch")
        if tool then tool.Parent = LocalPlayer.Backpack end

        task.wait(0.01)
        ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
        task.wait(0.2)
        root.CFrame = CFrame.new(originalPos)
    end)
end

local function BringPlayerLLL()
    if not selectedPlayerName then
        return
    end
    local target = Players:FindFirstChild(selectedPlayerName)
    if not target or not target.Character then
        return
    end

    local char = LocalPlayer.Character
    if not char then
        return
    end
    local hum = char:FindFirstChildOfClass("Humanoid")
    local root = char:FindFirstChild("HumanoidRootPart")
    local tRoot = target.Character and target.Character:FindFirstChild("HumanoidRootPart")
    if not hum or not root or not tRoot then
        return
    end

    local originalPos = root.Position 
    ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer("ClearAllTools")
    task.wait(0.2)

    ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
    task.wait(0.3)

    local tool = LocalPlayer.Backpack:FindFirstChild("Couch")
    if tool then
        tool.Parent = char
    end
    task.wait(0.1)

    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F, false, game)
    task.wait(0.1)

    hum:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
    hum.PlatformStand = false
    cam.CameraSubject = target.Character:FindFirstChild("Head") or tRoot or hum

    local align = Instance.new("BodyPosition")
    align.Name = "BringPosition"
    align.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    align.D = 10
    align.P = 30000
    align.Position = root.Position
    align.Parent = tRoot

    task.spawn(function()
        local angle = 0
        local startTime = tick()
        while tick() - startTime < 5 and target and target.Character and target.Character:FindFirstChildOfClass("Humanoid") do
            local tHum = target.Character:FindFirstChildOfClass("Humanoid")
            if not tHum or tHum.Sit then break end

            local hrp = target.Character.HumanoidRootPart
            local adjustedPos = hrp.Position + (hrp.Velocity / 1.5)

            angle += 50
            root.CFrame = CFrame.new(adjustedPos + Vector3.new(0, 2, 0)) * CFrame.Angles(math.rad(angle), 0, 0)
            align.Position = root.Position + Vector3.new(2, 0, 0)

            task.wait()
        end

        align:Destroy()
        hum:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
        hum.PlatformStand = false
        cam.CameraSubject = hum

        for _, p in pairs(char:GetDescendants()) do
            if p:IsA("BasePart") then
                p.Velocity = Vector3.zero
                p.RotVelocity = Vector3.zero
            end
        end

        task.wait(0.1)
        root.Anchored = true
        root.CFrame = CFrame.new(originalPos)
        task.wait(0.001)
        root.Anchored = false

        task.wait(0.7)
        local tool = char:FindFirstChild("Couch")
        if tool then
            tool.Parent = LocalPlayer.Backpack
        end

        task.wait(0.001)
        ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
    end)
end

local function BringWithCouch()
    local targetPlayer = Players:FindFirstChild(getgenv().Target)
    if not targetPlayer then
        return
    end
    if not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        return
    end

    local args = { [1] = "ClearAllTools" }
    ReplicatedStorage.RE["1Clea1rTool1s"]:FireServer(unpack(args))
    local args = { [1] = "PickingTools", [2] = "Couch" }
    ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))

    local couch = LocalPlayer.Backpack:WaitForChild("Couch", 2)
    if not couch then
        return
    end

    couch.Name = "Chaos.Couch"
    local seat1 = couch:FindFirstChild("Seat1")
    local seat2 = couch:FindFirstChild("Seat2")
    local handle = couch:FindFirstChild("Handle")
    if seat1 and seat2 and handle then
        seat1.Disabled = true
        seat2.Disabled = true
        handle.Name = "Handle "
    else
        return
    end
    couch.Parent = LocalPlayer.Character

    local tet = Instance.new("BodyVelocity", seat1)
    tet.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    tet.P = 1250
    tet.Velocity = Vector3.new(0, 0, 0)
    tet.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"

    repeat
        for m = 1, 35 do
            local pos = { x = 0, y = 0, z = 0 }
            local tRoot = targetPlayer.Character and targetPlayer.Character.HumanoidRootPart
            if not tRoot then break end
            pos.x = tRoot.Position.X + (tRoot.Velocity.X / 2)
            pos.y = tRoot.Position.Y + (tRoot.Velocity.Y / 2)
            pos.z = tRoot.Position.Z + (tRoot.Velocity.Z / 2)
            seat1.CFrame = CFrame.new(Vector3.new(pos.x, pos.y, pos.z)) * CFrame.new(-2, 2, 0)
            task.wait()
        end
        tet:Destroy()
        couch.Parent = LocalPlayer.Backpack
        task.wait()
        couch:FindFirstChild("Handle ").Name = "Handle"
        task.wait(0.2)
        couch.Parent = LocalPlayer.Character
        task.wait()
        couch.Parent = LocalPlayer.Backpack
        couch.Handle.Name = "Handle "
        task.wait(0.2)
        couch.Parent = LocalPlayer.Character
        tet = Instance.new("BodyVelocity", seat1)
        tet.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        tet.P = 1250
        tet.Velocity = Vector3.new(0, 0, 0)
        tet.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"
    until targetPlayer.Character and targetPlayer.Character.Humanoid and targetPlayer.Character.Humanoid.Sit == true
    task.wait()
    tet:Destroy()
    couch.Parent = LocalPlayer.Backpack
    task.wait()
    couch:FindFirstChild("Handle ").Name = "Handle"
    task.wait(0.3)
    couch.Parent = LocalPlayer.Character
    task.wait(0.3)
    couch.Grip = CFrame.new(Vector3.new(0, 0, 0))
    task.wait(0.3)
    ReplicatedStorage.RE["1Clea1rTool1s"]:FireServer("ClearAllTools")
end

local function KillWithCouch()
    local targetPlayer = Players:FindFirstChild(getgenv().Target)
    if not targetPlayer then
        return
    end
    if not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        return
    end

    local args = { [1] = "ClearAllTools" }
    ReplicatedStorage.RE["1Clea1rTool1s"]:FireServer(unpack(args))
    local args = { [1] = "PickingTools", [2] = "Couch" }
    ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))

    local couch = LocalPlayer.Backpack:WaitForChild("Couch", 2)
    if not couch then
        return
    end

    couch.Name = "Chaos.Couch"
    local seat1 = couch:FindFirstChild("Seat1")
    local seat2 = couch:FindFirstChild("Seat2")
    local handle = couch:FindFirstChild("Handle")
    if seat1 and seat2 and handle then
        seat1.Disabled = true
        seat2.Disabled = true
        handle.Name = "Handle "
    else
        return
    end
    couch.Parent = LocalPlayer.Character

    local tet = Instance.new("BodyVelocity", seat1)
    tet.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    tet.P = 1250
    tet.Velocity = Vector3.new(0, 0, 0)
    tet.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"

    repeat
        for m = 1, 35 do
            local pos = { x = 0, y = 0, z = 0 }
            local tRoot = targetPlayer.Character and targetPlayer.Character.HumanoidRootPart
            if not tRoot then break end
            pos.x = tRoot.Position.X + (tRoot.Velocity.X / 2)
            pos.y = tRoot.Position.Y + (tRoot.Velocity.Y / 2)
            pos.z = tRoot.Position.Z + (tRoot.Velocity.Z / 2)
            seat1.CFrame = CFrame.new(Vector3.new(pos.x, pos.y, pos.z)) * CFrame.new(-2, 2, 0)
            task.wait()
        end
        tet:Destroy()
        couch.Parent = LocalPlayer.Backpack
        task.wait()
        couch:FindFirstChild("Handle ").Name = "Handle"
        task.wait(0.2)
        couch.Parent = LocalPlayer.Character
        task.wait()
        couch.Parent = LocalPlayer.Backpack
        couch.Handle.Name = "Handle "
        task.wait(0.2)
        couch.Parent = LocalPlayer.Character
        tet = Instance.new("BodyVelocity", seat1)
        tet.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        tet.P = 1250
        tet.Velocity = Vector3.new(0, 0, 0)
        tet.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"
    until targetPlayer.Character and targetPlayer.Character.Humanoid and targetPlayer.Character.Humanoid.Sit == true
    task.wait()
    couch.Parent = LocalPlayer.Backpack
    seat1.CFrame = CFrame.new(Vector3.new(9999, -450, 9999))
    seat2.CFrame = CFrame.new(Vector3.new(9999, -450, 9999))
    couch.Parent = LocalPlayer.Character
    task.wait(0.1)
    couch.Parent = LocalPlayer.Backpack
    task.wait(2)
    local bv = seat1:FindFirstChild("#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W")
    if bv then bv:Destroy() end
    ReplicatedStorage.RE["1Clea1rTool1s"]:FireServer("ClearAllTools")
end
    
    local function getPlayerList()
        local players = Players:GetPlayers()
        local playerNames = {}
        for _, player in ipairs(players) do
            if player ~= LocalPlayer then
                table.insert(playerNames, player.Name)
            end
        end
        return playerNames
    end

local function playerCorrupt()
    local targetPlayer = Players:FindFirstChild(getgenv().Target)
    if not targetPlayer then
        return
    end
    if not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        return
    end

    local args = { [1] = "ClearAllTools" }
    ReplicatedStorage.RE["1Clea1rTool1s"]:FireServer(unpack(args))
    local args = { [1] = "PickingTools", [2] = "Couch" }
    ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))

    local couch = LocalPlayer.Backpack:WaitForChild("Couch", 2)
    if not couch then
        return
    end

    couch.Name = "Chaos.Couch"
    local seat1 = couch:FindFirstChild("Seat1")
    local seat2 = couch:FindFirstChild("Seat2")
    local handle = couch:FindFirstChild("Handle")
    if seat1 and seat2 and handle then
        seat1.Disabled = true
        seat2.Disabled = true
        handle.Name = "Handle "
    else
        return
    end
    couch.Parent = LocalPlayer.Character

    local tet = Instance.new("BodyVelocity", seat1)
    tet.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    tet.P = 1250
    tet.Velocity = Vector3.new(0, 0, 0)
    tet.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"

    repeat
        for m = 1, 35 do
            local pos = { x = 0, y = 0, z = 0 }
            local tRoot = targetPlayer.Character and targetPlayer.Character.HumanoidRootPart
            if not tRoot then break end
            pos.x = tRoot.Position.X + (tRoot.Velocity.X / 2)
            pos.y = tRoot.Position.Y + (tRoot.Velocity.Y / 2)
            pos.z = tRoot.Position.Z + (tRoot.Velocity.Z / 2)
            seat1.CFrame = CFrame.new(Vector3.new(pos.x, pos.y, pos.z)) * CFrame.new(-2, 2, 0)
            task.wait()
        end
        tet:Destroy()
        couch.Parent = LocalPlayer.Backpack
        task.wait()
        couch:FindFirstChild("Handle ").Name = "Handle"
        task.wait(0.2)
        couch.Parent = LocalPlayer.Character
        task.wait()
        couch.Parent = LocalPlayer.Backpack
        couch.Handle.Name = "Handle "
        task.wait(0.2)
        couch.Parent = LocalPlayer.Character
        tet = Instance.new("BodyVelocity", seat1)
        tet.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        tet.P = 1250
        tet.Velocity = Vector3.new(0, 0, 0)
        tet.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"
    until targetPlayer.Character and targetPlayer.Character.Humanoid and targetPlayer.Character.Humanoid.Sit == true
    task.wait()
    couch.Parent = LocalPlayer.Backpack
    seat1.CFrame = CFrame.new(Vector3.new(0/0, 0/0, 0/0))
    seat2.CFrame.new(Vector3.new(0/0, 0/0, 0/0))
    couch.Parent = LocalPlayer.Character
    task.wait(0.1)
    couch.Parent = LocalPlayer.Backpack
    task.wait(2)
    local bv = seat1:FindFirstChild("#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W")
    if bv then bv:Destroy() end
    ReplicatedStorage.RE["1Clea1rTool1s"]:FireServer("ClearAllTools")
end

    local killDropdown = Troll:AddDropdown({
        Name = "Select Player",
        Options = getPlayerList(),
        Default = "",
        Callback = function(value)
            selectedPlayerName = value
            getgenv().Target = value
        end
    })

    Troll:AddButton({
        Name = "Update Player List",
        Callback = function()
            local tablePlayers = Players:GetPlayers()
            local newPlayers = {}
            if killDropdown and #tablePlayers > 0 then
                for _, player in ipairs(tablePlayers) do
                    if player.Name ~= LocalPlayer.Name then
                        table.insert(newPlayers, player.Name)
                    end
                end
                killDropdown:Set(newPlayers)
                if selectedPlayerName and not Players:FindFirstChild(selectedPlayerName) then
                    selectedPlayerName = nil
                    getgenv().Target = nil
                    killDropdown:SetValue("")
                end
            else
            end
        end
    })

    Troll:AddButton({
        Name = "Teleport to Player",
        Callback = function()
            if not selectedPlayerName or not Players:FindFirstChild(selectedPlayerName) then
                return
            end
            local character = LocalPlayer.Character
            local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
            if not humanoidRootPart then
                return
            end

            local targetPlayer = Players:FindFirstChild(selectedPlayerName)
            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                humanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
            else
            end
        end
    })

    Troll:AddToggle({
        Name = "View Player",
        Default = false,
        Callback = function(value)
            local Camera = workspace.CurrentCamera

            local function UpdateCamera()
                if value then
                    local targetPlayer = Players:FindFirstChild(selectedPlayerName)
                    if targetPlayer and targetPlayer.Character then
                        local humanoid = targetPlayer.Character:FindFirstChild("Humanoid")
                        if humanoid then
                            Camera.CameraSubject = humanoid
                        end
                    end
                else
                    if LocalPlayer.Character then
                        local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
                        if humanoid then
                            Camera.CameraSubject = humanoid
                        end
                    end
                end
            end

            if value then
                if not getgenv().CameraConnection then
                    getgenv().CameraConnection = RunService.Heartbeat:Connect(UpdateCamera)
                end
            else
                if getgenv().CameraConnection then
                    getgenv().CameraConnection:Disconnect()
                    getgenv().CameraConnection = nil
                end
                UpdateCamera()
            end
        end
    })

    local MethodSection = Troll:AddSection({ Name = "Methods" })

    Troll:AddDropdown({
        Name = "Select Killing Method",
        Options = {"Bus", "Couch", "Couch without going to the target"},
        Default = "Bus",
        Callback = function(value)
            methodKill = value
        end
    })

    Troll:AddButton({
        Name = "Kill Player",
        Callback = function()
            if not selectedPlayerName or not Players:FindFirstChild(selectedPlayerName) then
                return
            end
            if methodKill == "Couch" then
                KillPlayerCouch()
            elseif methodKill == "Couch without going to the target" then
                KillWithCouch()
            else
                local character = LocalPlayer.Character
                local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
                if not humanoidRootPart then
                    return
                end

                local originalPosition = humanoidRootPart.CFrame

                local function GetBus()
                    local vehicles = game.Workspace:FindFirstChild("Vehicles")
                    if vehicles then
                        return vehicles:FindFirstChild(LocalPlayer.Name .. "Car")
                    end
                    return nil
                end

                local bus = GetBus()

                if not bus then
                    humanoidRootPart.CFrame = CFrame.new(1118.81, 75.998, -1138.61)
                    task.wait(0.5)
                    local remoteEvent = ReplicatedStorage:FindFirstChild("RE")
                    if remoteEvent and remoteEvent:FindFirstChild("1Ca1r") then
                        remoteEvent["1Ca1r"]:FireServer("PickingCar", "SchoolBus")
                    end
                    task.wait(1)
                    bus = GetBus()
                end

                if bus then
                    local seat = bus:FindFirstChild("Body") and bus.Body:FindFirstChild("VehicleSeat")
                    if seat and character:FindFirstChildOfClass("Humanoid") and not character.Humanoid.Sit then
                        repeat
                            humanoidRootPart.CFrame = seat.CFrame * CFrame.new(0, 2, 0)
                            task.wait()
                        until character.Humanoid.Sit or not bus.Parent
                        if character.Humanoid.Sit or not bus.Parent then
                            for k, v in pairs(bus.Body:GetChildren()) do
                                if v:IsA("Seat") then
                                    v.CanTouch = false
                                end
                            end
                        end
                    end
                end

                local function TrackPlayer()
                    while true do
                        if selectedPlayerName then
                            local targetPlayer = Players:FindFirstChild(selectedPlayerName)
                            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                local targetHumanoid = targetPlayer.Character:FindFirstChildOfClass("Humanoid")
                                if targetHumanoid and targetHumanoid.Sit then
                                    if character.Humanoid then
                                        bus:SetPrimaryPartCFrame(CFrame.new(Vector3.new(9999, -450, 9999)))
                                        task.wait(0.2)

                                        local function simulateJump()
                                            local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
                                            if humanoid then
                                                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                                            end
                                        end

                                        simulateJump()
                                        task.wait(0.5)
                                        humanoidRootPart.CFrame = originalPosition
                                    end
                                    break
                                else
                                    local targetRoot = targetPlayer.Character.HumanoidRootPart
                                    local time = tick() * 35
                                    local lateralOffset = math.sin(time) * 4
                                    local frontBackOffset = math.cos(time) * 20
                                    bus:SetPrimaryPartCFrame(targetRoot.CFrame * CFrame.new(lateralOffset, 0, frontBackOffset))
                                end
                            end
                        end
                        RunService.RenderStepped:Wait()
                    end
                end

                spawn(TrackPlayer)
            end
        end
    })

    Troll:AddButton({
        Name = "Bring Player",
        Callback = function()
            if not selectedPlayerName or not Players:FindFirstChild(selectedPlayerName) then
                return
            end
            if methodKill == "Couch" then
                BringPlayerLLL()
            elseif methodKill == "Couch without going to the target" then
                BringWithCouch()
            else
                local character = LocalPlayer.Character
                local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
                if not humanoidRootPart then
                    return
                end

                local originalPosition = humanoidRootPart.CFrame

                local function GetBus()
                    local vehicles = game.Workspace:FindFirstChild("Vehicles")
                    if vehicles then
                        return vehicles:FindFirstChild(LocalPlayer.Name .. "Car")
                    end
                    return nil
                end

                local bus = GetBus()

                if not bus then
                    humanoidRootPart.CFrame = CFrame.new(1118.81, 75.998, -1138.61)
                    task.wait(0.5)
                    local remoteEvent = ReplicatedStorage:FindFirstChild("RE")
                    if remoteEvent and remoteEvent:FindFirstChild("1Ca1r") then
                        remoteEvent["1Ca1r"]:FireServer("PickingCar", "SchoolBus")
                    end
                    task.wait(1)
                    bus = GetBus()
                end

                if bus then
                    local seat = bus:FindFirstChild("Body") and bus.Body:FindFirstChild("VehicleSeat")
                    if seat and character:FindFirstChildOfClass("Humanoid") and not character.Humanoid.Sit then
                        repeat
                            humanoidRootPart.CFrame = seat.CFrame * CFrame.new(0, 2, 0)
                            task.wait()
                        until character.Humanoid.Sit or not bus.Parent
                    end
                end

                local function TrackPlayer()
                    while true do
                        if selectedPlayerName then
                            local targetPlayer = Players:FindFirstChild(selectedPlayerName)
                            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                local targetHumanoid = targetPlayer.Character:FindFirstChildOfClass("Humanoid")
                                if targetHumanoid and targetHumanoid.Sit then
                                    if character.Humanoid then
                                        bus:SetPrimaryPartCFrame(originalPosition)
                                        task.wait(0.7)
                                        local args = { [1] = "DeleteAllVehicles" }
                                        ReplicatedStorage.RE:FindFirstChild("1Ca1r"):FireServer(unpack(args))
                                    end
                                    break
                                else
                                    local targetRoot = targetPlayer.Character.HumanoidRootPart
                                    local time = tick() * 35
                                    local lateralOffset = math.sin(time) * 4
                                    local frontBackOffset = math.cos(time) * 20
                                    bus:SetPrimaryPartCFrame(targetRoot.CFrame * CFrame.new(lateralOffset, 0, frontBackOffset))
                                end
                            end
                        end
                        RunService.RenderStepped:Wait()
                    end
                end

                spawn(TrackPlayer)
            end
        end
    })

local kill = Troll:AddSection({Name = "Click Methods"})

local function AutoKartFling()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local backpack = player:WaitForChild("Backpack")
    local root = character:WaitForChild("HumanoidRootPart")

    local bav = Instance.new("BodyAngularVelocity")
    bav.AngularVelocity = Vector3.new(0, 500, 0)
    bav.MaxTorque = Vector3.new(0, math.huge, 0)
    bav.P = 1000
    bav.Parent = root

    local args = {"PickingTools", "ShoppingCart"}
    game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Too1l"):InvokeServer(unpack(args))

    local function equipCartTools()
        for _, tool in pairs(backpack:GetChildren()) do
            if tool:IsA("Tool") and string.find(string.lower(tool.Name), "cart") then
                player.Character.Humanoid:EquipTool(tool)
            end
        end
    end

    equipCartTools()

    backpack.ChildAdded:Connect(function(child)
        if child:IsA("Tool") and string.find(string.lower(child.Name), "cart") then
            player.Character.Humanoid:EquipTool(child)
        end
    end)
end

Troll:AddButton({
  Name = "[BETA] Click Fling Doors",
Description = "We recommend getting close to other doors, after it comes to you, click on the player you want to fling",
  Callback = function()
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HRP = Character:WaitForChild("HumanoidRootPart")

local BlackHole = Instance.new("Part")
BlackHole.Size = Vector3.new(100000, 100000, 100000)
BlackHole.Transparency = 1
BlackHole.Anchored = true
BlackHole.CanCollide = false
BlackHole.Name = "BlackHoleTarget"
BlackHole.Parent = Workspace

local baseAttachment = Instance.new("Attachment")
baseAttachment.Name = "Luscaa_BlackHoleAttachment"
baseAttachment.Parent = BlackHole

RunService.Heartbeat:Connect(function()
	BlackHole.CFrame = HRP.CFrame
end)

local ControlledDoors = {}

local function SetupPart(part)
	if not part:IsA("BasePart") or part.Anchored or not string.find(part.Name, "Door") then return end
	if part:FindFirstChild("Luscaa_Attached") then return end

	part.CanCollide = false

	for _, obj in ipairs(part:GetChildren()) do
		if obj:IsA("AlignPosition") or obj:IsA("Torque") or obj:IsA("Attachment") then
			obj:Destroy()
		end
	end

	local marker = Instance.new("BoolValue", part)
	marker.Name = "Luscaa_Attached"

	local a1 = Instance.new("Attachment", part)

	local align = Instance.new("AlignPosition", part)
	align.Attachment0 = a1
	align.Attachment1 = baseAttachment
	align.MaxForce = 1e20
	align.MaxVelocity = math.huge
	align.Responsiveness = 99999

	local torque = Instance.new("Torque", part)
	torque.Attachment0 = a1
	torque.RelativeTo = Enum.ActuatorRelativeTo.World
	torque.Torque = Vector3.new(
		math.random(-10e5, 10e5) * 10000,
		math.random(-10e5, 10e5) * 10000,
		math.random(-10e5, 10e5) * 10000
	)

	table.insert(ControlledDoors, {Part = part, Align = align})
end

for _, obj in ipairs(Workspace:GetDescendants()) do
	if obj:IsA("BasePart") and string.find(obj.Name, "Door") then
		SetupPart(obj)
	end
end

Workspace.DescendantAdded:Connect(function(obj)
	if obj:IsA("BasePart") and string.find(obj.Name, "Door") then
		SetupPart(obj)
	end
end)

local function FlingPlayer(player)
	local char = player.Character
	if not char then return end
	local targetHRP = char:FindFirstChild("HumanoidRootPart")
	if not targetHRP then return end

	local targetAttachment = targetHRP:FindFirstChild("SHNMAX_TargetAttachment")
	if not targetAttachment then
		targetAttachment = Instance.new("Attachment", targetHRP)
		targetAttachment.Name = "SHNMAX_TargetAttachment"
	end

	for _, data in ipairs(ControlledDoors) do
		if data.Align then
			data.Align.Attachment1 = targetAttachment
		end
	end

	local start = tick()
	local flingDetected = false

	while tick() - start < 5 do
		if targetHRP.Velocity.Magnitude >= 20 then
			flingDetected = true
			break
		end
		RunService.Heartbeat:Wait()
	end

	for _, data in ipairs(ControlledDoors) do
		if data.Align then
			data.Align.Attachment1 = baseAttachment
		end
	end
end

UserInputService.TouchTap:Connect(function(touchPositions, processed)
	if processed then return end
	local pos = touchPositions[1]
	local camera = Workspace.CurrentCamera
	local unitRay = camera:ScreenPointToRay(pos.X, pos.Y)
	local raycast = Workspace:Raycast(unitRay.Origin, unitRay.Direction * 1000)

	if raycast and raycast.Instance then
		local hit = raycast.Instance
		local player = Players:GetPlayerFromCharacter(hit:FindFirstAncestorOfClass("Model"))
		if player and player ~= LocalPlayer then
			FlingPlayer(player)
		end
	end
end)
  end
})

Troll:AddButton({
  Name = "[BETA] Click Fling Admin",
  Callback = function()
    local Players = game:GetService("Players")
    local Workspace = game:GetService("Workspace")
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")

    local LocalPlayer = Players.LocalPlayer
    local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local HRP = Character:WaitForChild("HumanoidRootPart")

    local BlackHole = Instance.new("Part")
    BlackHole.Size = Vector3.new(100000, 100000, 100000)
    BlackHole.Transparency = 1
    BlackHole.Anchored = true
    BlackHole.CanCollide = false
    BlackHole.Name = "BlackHoleTarget"
    BlackHole.Parent = Workspace

    local baseAttachment = Instance.new("Attachment")
    baseAttachment.Name = "Luscaa_BlackHoleAttachment"
    baseAttachment.Parent = BlackHole

    RunService.Heartbeat:Connect(function()
      BlackHole.CFrame = HRP.CFrame
    end)

    local ControlledDoors = {}

    local function SetupPart(part)
      if not part:IsA("BasePart") or part.Anchored or not string.find(part.Name, "Door") then return end
      if part:FindFirstChild("Luscaa_Attached") then return end

      part.CanCollide = false
      part.Transparency = 1

      for _, obj in ipairs(part:GetChildren()) do
        if obj:IsA("AlignPosition") or obj:IsA("Torque") or obj:IsA("Attachment") then
          obj:Destroy()
        end
      end

      local marker = Instance.new("BoolValue", part)
      marker.Name = "Luscaa_Attached"

      local a1 = Instance.new("Attachment", part)

      local align = Instance.new("AlignPosition", part)
      align.Attachment0 = a1
      align.Attachment1 = baseAttachment
      align.MaxForce = 1e20
      align.MaxVelocity = math.huge
      align.Responsiveness = 99999

      local torque = Instance.new("Torque", part)
      torque.Attachment0 = a1
      torque.RelativeTo = Enum.ActuatorRelativeTo.World
      torque.Torque = Vector3.new(
        math.random(-10e5, 10e5) * 10000,
        math.random(-10e5, 10e5) * 10000,
        math.random(-10e5, 10e5) * 10000
      )

      table.insert(ControlledDoors, {Part = part, Align = align})
    end

    for _, obj in ipairs(Workspace:GetDescendants()) do
      if obj:IsA("BasePart") and string.find(obj.Name, "Door") then
        SetupPart(obj)
      end
    end

    Workspace.DescendantAdded:Connect(function(obj)
      if obj:IsA("BasePart") and string.find(obj.Name, "Door") then
        SetupPart(obj)
      end
    end)

    local function FlingPlayer(player)
      local char = player.Character
      if not char then return end
      local targetHRP = char:FindFirstChild("HumanoidRootPart")
      if not targetHRP then return end

      local targetAttachment = targetHRP:FindFirstChild("SHNMAX_TargetAttachment")
      if not targetAttachment then
        targetAttachment = Instance.new("Attachment", targetHRP)
        targetAttachment.Name = "SHNMAX_TargetAttachment"
      end

      for _, data in ipairs(ControlledDoors) do
        if data.Align then
          data.Align.Attachment1 = targetAttachment
        end
      end

      local start = tick()
      local flingDetected = false

      while tick() - start < 5 do
        if targetHRP.Velocity.Magnitude >= 20 then
          flingDetected = true
          break
        end
        RunService.Heartbeat:Wait()
      end

      for _, data in ipairs(ControlledDoors) do
        if data.Align then
          data.Align.Attachment1 = baseAttachment
        end
      end
    end

    UserInputService.TouchTap:Connect(function(touchPositions, processed)
      if processed then return end
      local pos = touchPositions[1]
      local camera = Workspace.CurrentCamera
      local unitRay = camera:ScreenPointToRay(pos.X, pos.Y)
      local raycast = Workspace:Raycast(unitRay.Origin, unitRay.Direction * 1000)

      if raycast and raycast.Instance then
        local hit = raycast.Instance
        local player = Players:GetPlayerFromCharacter(hit:FindFirstAncestorOfClass("Model"))
        if player and player ~= LocalPlayer then
          FlingPlayer(player)
        end
      end
    end)
  end
})

Troll:AddButton({
    Name = "Click Fling Couch (Tool)",
    Callback = function()

local jogadores = game:GetService("Players")
local rep = game:GetService("ReplicatedStorage")
local entrada = game:GetService("UserInputService")
local eu = jogadores.LocalPlayer
local cam = workspace.CurrentCamera

local podeClicar = true
local ferramentaEquipada = false
local NOME_FERRAMENTA = "Click Fling Couch"

local mochila = eu:WaitForChild("Backpack")

if not mochila:FindFirstChild(NOME_FERRAMENTA) and not (eu.Character and eu.Character:FindFirstChild(NOME_FERRAMENTA)) then
	local ferramenta = Instance.new("Tool")
	ferramenta.Name = NOME_FERRAMENTA
	ferramenta.RequiresHandle = false
	ferramenta.CanBeDropped = false

	ferramenta.Equipped:Connect(function()
		ferramentaEquipada = true
	end)

	ferramenta.Unequipped:Connect(function()
		ferramentaEquipada = false
	end)

	ferramenta.Parent = mochila
end

local function jogarComSofa(alvo)
	if not ferramentaEquipada then return end
	if not alvo or not alvo.Character or alvo == eu then return end

	local jogando = true
	local raiz = eu.Character and eu.Character:FindFirstChild("HumanoidRootPart")
	local alvoRaiz = alvo.Character and alvo.Character:FindFirstChild("HumanoidRootPart")
	if not raiz or not alvoRaiz then return end

	local boneco = eu.Character
	local humano = boneco:FindFirstChildOfClass("Humanoid")
	local posOriginal = raiz.CFrame

	rep:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer("ClearAllTools")
	task.wait(0.2)

	rep.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
	task.wait(0.3)

	local sofa = eu.Backpack:FindFirstChild("Couch")
	if sofa then
		sofa.Parent = boneco
	end
	task.wait(0.1)

	game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.F, false, game)
	task.wait(0.25)

	workspace.FallenPartsDestroyHeight = 0/0

	local forca = Instance.new("BodyVelocity")
	forca.Name = "ForcaJogada"
	forca.Velocity = Vector3.new(9e8, 9e8, 9e8)
	forca.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
	forca.Parent = raiz

	humano:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
	humano.PlatformStand = false
	cam.CameraSubject = alvo.Character:FindFirstChild("Head") or alvoRaiz or humano

	task.spawn(function()
		local angulo = 0
		local partes = {raiz}
		while jogando and alvo and alvo.Character and alvo.Character:FindFirstChildOfClass("Humanoid") do
			local alvoHum = alvo.Character:FindFirstChildOfClass("Humanoid")
			if alvoHum.Sit then break end
			angulo += 50

			for _, parte in ipairs(partes) do
				local hrp = alvo.Character.HumanoidRootPart
				local pos = hrp.Position + hrp.Velocity / 1.5
				raiz.CFrame = CFrame.new(pos) * CFrame.Angles(math.rad(angulo), 0, 0)
			end

			raiz.Velocity = Vector3.new(9e8, 9e8, 9e8)
			raiz.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
			task.wait()
		end

		jogando = false
		forca:Destroy()
		humano:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
		humano.PlatformStand = false
		raiz.CFrame = posOriginal
		cam.CameraSubject = humano

		for _, p in pairs(boneco:GetDescendants()) do
			if p:IsA("BasePart") then
				p.Velocity = Vector3.zero
				p.RotVelocity = Vector3.zero
			end
		end

		humano:UnequipTools()
		rep.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
	end)

	while jogando do
		task.wait()
	end
end

entrada.TouchTap:Connect(function(toques, processado)
	if processado or not podeClicar or not ferramentaEquipada then return end

	local pos = toques[1]
	local raio = cam:ScreenPointToRay(pos.X, pos.Y)
	local acerto = workspace:Raycast(raio.Origin, raio.Direction * 1000)

	if acerto and acerto.Instance then
		local alvo = jogadores:GetPlayerFromCharacter(acerto.Instance:FindFirstAncestorOfClass("Model"))
		if alvo and alvo ~= eu then
			podeClicar = false
			jogarComSofa(alvo)
			task.delay(2, function()
				podeClicar = true
			end)
		end
	end
end)
end
})

Troll:AddButton({
    Name = "Click Fling Ball (Tool)",
    Callback = function()
local jogadores = game:GetService("Players")
local rep = game:GetService("ReplicatedStorage")
local mundo = game:GetService("Workspace")
local entrada = game:GetService("UserInputService")
local cam = mundo.CurrentCamera
local eu = jogadores.LocalPlayer

local NOME_FERRAMENTA = "Click Fling Ball"
local ferramentaEquipada = false

local mochila = eu:WaitForChild("Backpack")
if not mochila:FindFirstChild(NOME_FERRAMENTA) then
	local ferramenta = Instance.new("Tool")
	ferramenta.Name = NOME_FERRAMENTA
	ferramenta.RequiresHandle = false
	ferramenta.CanBeDropped = false

	ferramenta.Equipped:Connect(function()
		ferramentaEquipada = true
	end)

	ferramenta.Unequipped:Connect(function()
		ferramentaEquipada = false
	end)

	ferramenta.Parent = mochila
end

local function FlingBall(target)
    

    local players = game:GetService("Players")
    local player = players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    local hrp = character:WaitForChild("HumanoidRootPart")
    local backpack = player:WaitForChild("Backpack")
    local ServerBalls = workspace.WorkspaceCom:WaitForChild("001_SoccerBalls")

    local function GetBall()
        if not backpack:FindFirstChild("SoccerBall") and not character:FindFirstChild("SoccerBall") then
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "SoccerBall")
        end

        repeat task.wait() until backpack:FindFirstChild("SoccerBall") or character:FindFirstChild("SoccerBall")

        local ballTool = backpack:FindFirstChild("SoccerBall")
        if ballTool then
            ballTool.Parent = character
        end

        repeat task.wait() until ServerBalls:FindFirstChild("Soccer" .. player.Name)

        return ServerBalls:FindFirstChild("Soccer" .. player.Name)
    end

    local Ball = ServerBalls:FindFirstChild("Soccer" .. player.Name) or GetBall()
    Ball.CanCollide = false
    Ball.Massless = true
    Ball.CustomPhysicalProperties = PhysicalProperties.new(0.0001, 0, 0)

    if target ~= player then
        local tchar = target.Character
        if tchar and tchar:FindFirstChild("HumanoidRootPart") and tchar:FindFirstChild("Humanoid") then
            local troot = tchar.HumanoidRootPart
            local thum = tchar.Humanoid

            if Ball:FindFirstChildWhichIsA("BodyVelocity") then
                Ball:FindFirstChildWhichIsA("BodyVelocity"):Destroy()
            end

            local bv = Instance.new("BodyVelocity")
            bv.Name = "FlingPower"
            bv.Velocity = Vector3.new(9e8, 9e8, 9e8)
            bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            bv.P = 9e900
            bv.Parent = Ball

            workspace.CurrentCamera.CameraSubject = thum

            repeat
                if troot.Velocity.Magnitude > 0 then
                    local pos = troot.Position + (troot.Velocity / 1.5)
                    Ball.CFrame = CFrame.new(pos)
                    Ball.Orientation += Vector3.new(45, 60, 30)
                else
                    for i, v in pairs(tchar:GetChildren()) do
                        if v:IsA("BasePart") and v.CanCollide and not v.Anchored then
                            Ball.CFrame = v.CFrame
                            task.wait(1/6000)
                        end
                    end
                end
                task.wait(1/6000)
            until troot.Velocity.Magnitude > 1000 or thum.Health <= 0 or not tchar:IsDescendantOf(workspace) or target.Parent ~= players

            workspace.CurrentCamera.CameraSubject = humanoid
        end
    end
end

entrada.TouchTap:Connect(function(toques, processado)
	if not ferramentaEquipada or processado then return end
	local pos = toques[1]
	local raio = cam:ScreenPointToRay(pos.X, pos.Y)
	local hit = mundo:Raycast(raio.Origin, raio.Direction * 1000)
	if hit and hit.Instance then
		local modelo = hit.Instance:FindFirstAncestorOfClass("Model")
		local jogador = jogadores:GetPlayerFromCharacter(modelo)
		if jogador and jogador ~= eu then
			FlingBall(jogador)
		end
	end
end)

end
})

Troll:AddButton({
    Name = "Click Kill Couch (Tool)",
    Callback = function()

local jogadores = game:GetService("Players")
local rep = game:GetService("ReplicatedStorage")
local loop = game:GetService("RunService")
local mundo = game:GetService("Workspace")
local entrada = game:GetService("UserInputService")

local eu = jogadores.LocalPlayer
local cam = mundo.CurrentCamera

local NOME_FERRAMENTA = "Click Kill Couch"
local ferramentaEquipada = false
local nomeAlvo = nil
local loopTP = nil
local sofaEquipado = false
local base = nil
local posInicial = nil
local raiz = nil

local mochila = eu:WaitForChild("Backpack")
if not mochila:FindFirstChild(NOME_FERRAMENTA) then
	local ferramenta = Instance.new("Tool")
	ferramenta.Name = NOME_FERRAMENTA
	ferramenta.RequiresHandle = false
	ferramenta.CanBeDropped = false

	ferramenta.Equipped:Connect(function()
		ferramentaEquipada = true
	end)

	ferramenta.Unequipped:Connect(function()
		ferramentaEquipada = false
		nomeAlvo = nil
		limparSofa()
	end)

	ferramenta.Parent = mochila
end

function limparSofa()
	if loopTP then
		loopTP:Disconnect()
		loopTP = nil
	end

	if sofaEquipado then
		local boneco = eu.Character
		if boneco then
			local sofa = boneco:FindFirstChild("Couch")
			if sofa then
				sofa.Parent = eu.Backpack
				sofaEquipado = false
			end
		end
	end

	if base then
		base:Destroy()
		base = nil
	end

	if getgenv().AntiSit then
		getgenv().AntiSit:Set(false)
	end

	local humano = eu.Character and eu.Character:FindFirstChildOfClass("Humanoid")
	if humano then
		humano:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
		humano:ChangeState(Enum.HumanoidStateType.GettingUp)
	end

	if posInicial and raiz then
		raiz.CFrame = posInicial
		posInicial = nil
	end
end

function pegarSofa()
	local boneco = eu.Character
	if not boneco then return end
	local mochila = eu.Backpack

	if not mochila:FindFirstChild("Couch") and not boneco:FindFirstChild("Couch") then
		local args = { "PickingTools", "Couch" }
		rep.RE["1Too1l"]:InvokeServer(unpack(args))
		task.wait(0.1)
	end

	local sofa = mochila:FindFirstChild("Couch") or boneco:FindFirstChild("Couch")
	if sofa then
		sofa.Parent = boneco
		sofaEquipado = true
	end
end

function posAleatoriaAbaixo(boneco)
	local rp = boneco:FindFirstChild("HumanoidRootPart")
	if not rp then return Vector3.new() end
	local offset = Vector3.new(math.random(-2, 2), -5.1, math.random(-2, 2))
	return rp.Position + offset
end

function tpAbaixo(alvo)
	if not alvo or not alvo.Character or not alvo.Character:FindFirstChild("HumanoidRootPart") then return end

	local meuBoneco = eu.Character
	local minhaRaiz = meuBoneco and meuBoneco:FindFirstChild("HumanoidRootPart")
	local humano = meuBoneco and meuBoneco:FindFirstChildOfClass("Humanoid")

	if not minhaRaiz or not humano then return end

	humano:SetStateEnabled(Enum.HumanoidStateType.Physics, false)

	if not base then
		base = Instance.new("Part")
		base.Size = Vector3.new(10, 1, 10)
		base.Anchored = true
		base.CanCollide = true
		base.Transparency = 0.5
		base.Parent = mundo
	end

	local destino = posAleatoriaAbaixo(alvo.Character)
	base.Position = destino
	minhaRaiz.CFrame = CFrame.new(destino)

	humano:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
end

function arremessarComSofa(alvo)
	if not alvo then return end
	nomeAlvo = alvo.Name
	local boneco = eu.Character
	if not boneco then return end

	posInicial = boneco:FindFirstChild("HumanoidRootPart") and boneco.HumanoidRootPart.CFrame
	raiz = boneco:FindFirstChild("HumanoidRootPart")
	pegarSofa()

	loopTP = loop.Heartbeat:Connect(function()
		local alvoAtual = jogadores:FindFirstChild(nomeAlvo)
		if not alvoAtual or not alvoAtual.Character or not alvoAtual.Character:FindFirstChild("Humanoid") then
			limparSofa()
			return
		end
		if getgenv().AntiSit then
			getgenv().AntiSit:Set(true)
		end
		tpAbaixo(alvoAtual)
	end)

	task.spawn(function()
		local alvoAtual = jogadores:FindFirstChild(nomeAlvo)
		while alvoAtual and alvoAtual.Character and alvoAtual.Character:FindFirstChild("Humanoid") do
			task.wait(0.05)
			if alvoAtual.Character.Humanoid.SeatPart then
				local buraco = CFrame.new(265.46, -450.83, -59.93)
				alvoAtual.Character.HumanoidRootPart.CFrame = buraco
				eu.Character.HumanoidRootPart.CFrame = buraco
				task.wait(0.4)
				limparSofa()
				task.wait(0.2)
				if posInicial then
					eu.Character.HumanoidRootPart.CFrame = posInicial
				end
				break
			end
		end
	end)
end

entrada.TouchTap:Connect(function(toques, processado)
	if not ferramentaEquipada or processado then return end
	local pos = toques[1]
	local raio = cam:ScreenPointToRay(pos.X, pos.Y)
	local hit = mundo:Raycast(raio.Origin, raio.Direction * 1000)
	if hit and hit.Instance then
		local modelo = hit.Instance:FindFirstAncestorOfClass("Model")
		local jogador = jogadores:GetPlayerFromCharacter(modelo)
		if jogador and jogador ~= eu then
			arremessarComSofa(jogador)
		end
	end
end)
end
})

Troll:AddSection({Name = "Auto Method"})

Troll:AddButton({
  Name = "Auto Kart Fling",
Description = "If you crash on the ground, reset your character",
  Callback = function()
          AutoKartFling()
end
})
Troll:AddButton({
    Name = "Auto Fling All",
    Callback = function()
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local LocalPlayer = Players.LocalPlayer
    local cam = workspace.CurrentCamera


    local function ProcessPlayer(target)
        if not target or not target.Character or target == LocalPlayer then return end
        
        local flingActive = true
        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local tRoot = target.Character and target.Character:FindFirstChild("HumanoidRootPart")
        if not root or not tRoot then return end
        
        local char = LocalPlayer.Character
        local hum = char:FindFirstChildOfClass("Humanoid")
        local original = root.CFrame

    
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer("ClearAllTools")
        task.wait(0.2)

  
        ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
        task.wait(0.3)

        local tool = LocalPlayer.Backpack:FindFirstChild("Couch")
        if tool then
            tool.Parent = char
        end
task.wait(0.1)

game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.F, false, game)
task.wait(0.25)

        workspace.FallenPartsDestroyHeight = 0/0

        local bv = Instance.new("BodyVelocity")
        bv.Name = "FlingForce"
        bv.Velocity = Vector3.new(9e8, 9e8, 9e8)
        bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bv.Parent = root

        hum:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
        hum.PlatformStand = false
        cam.CameraSubject = target.Character:FindFirstChild("Head") or tRoot or hum

 
        task.spawn(function()
            local angle = 0
            local parts = {root}
            while flingActive and target and target.Character and target.Character:FindFirstChildOfClass("Humanoid") do
                local tHum = target.Character:FindFirstChildOfClass("Humanoid")
                if tHum.Sit then break end
                angle += 50

                for _, part in ipairs(parts) do
                    local hrp = target.Character.HumanoidRootPart
                    local pos = hrp.Position + hrp.Velocity / 1.5
                    root.CFrame = CFrame.new(pos) * CFrame.Angles(math.rad(angle), 0, 0)
                end

                root.Velocity = Vector3.new(9e8, 9e8, 9e8)
                root.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
                task.wait()
            end

         
            flingActive = false
            bv:Destroy()
            hum:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
            hum.PlatformStand = false
            root.CFrame = original
            cam.CameraSubject = hum

            for _, p in pairs(char:GetDescendants()) do
                if p:IsA("BasePart") then
                    p.Velocity = Vector3.zero
                    p.RotVelocity = Vector3.zero
                end
            end

            hum:UnequipTools()
            ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
        end)
       
        while flingActive do
            task.wait()
        end
    end


    for _, player in ipairs(Players:GetPlayers()) do
        ProcessPlayer(player)
			end
    end
})

local kill = Troll:AddSection({Name = "Boat Method"})

Troll:AddButton({
    Name = "Fling Boat All",
    Callback = function()
        local Player = game.Players.LocalPlayer
    local Character = Player.Character
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Character:FindFirstChild("HumanoidRootPart")
    local Vehicles = game.Workspace:FindFirstChild("Vehicles")
    local OldPos = RootPart.CFrame
    local Angles = 0
    local PCar = Vehicles:FindFirstChild(Player.Name.."Car")
    
            if not PCar then  
                if RootPart then  
                    RootPart.CFrame = CFrame.new(1754, -2, 58)  
                    task.wait(0.5)  
                    game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer("PickingBoat", "MilitaryBoatFree")  
                    task.wait(0.5)  
                    PCar = Vehicles:FindFirstChild(Player.Name.."Car")  
                    task.wait(0.5)  
                    local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")  
                    if Seat then  
                        repeat  
                            task.wait()  
                            RootPart.CFrame = Seat.CFrame * CFrame.new(0, math.random(-1, 1), 0)  
                        until Humanoid.Sit  
                    end  
                end  
            end  
      
            task.wait(0.5)  
            PCar = Vehicles:FindFirstChild(Player.Name.."Car")  
      
            if PCar then  
                if not Humanoid.Sit then  
                    local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")  
                    if Seat then  
                        repeat  
                            task.wait()  
                            RootPart.CFrame = Seat.CFrame * CFrame.new(0, math.random(-1, 1), 0)  
                        until Humanoid.Sit  
                    end  
                end  
            end  
      
            local SpinGyro = Instance.new("BodyGyro")  
            SpinGyro.Parent = PCar.PrimaryPart  
            SpinGyro.MaxTorque = Vector3.new(1e7, 1e7, 1e7)  
            SpinGyro.P = 1e7  
            SpinGyro.CFrame = PCar.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(90), 0)  
      
            local function flingPlayer(TargetC, TargetRP, TargetH)
    Angles = 0  
                local endTime = tick() + 1  
                while tick() < endTime do  
                    Angles = Angles + 100  
                    task.wait()  
      
                    local kill = function(alvo, pos, angulo)  
                        PCar:SetPrimaryPartCFrame(CFrame.new(alvo.Position) * pos * angulo)  
                    end  
      
                    kill(TargetRP, CFrame.new(0, 3, 0), CFrame.Angles(math.rad(Angles), 0, 0))  
                    kill(TargetRP, CFrame.new(0, -1.5, 2), CFrame.Angles(math.rad(Angles), 0, 0))  
                    kill(TargetRP, CFrame.new(2, 1.5, 2.25), CFrame.Angles(math.rad(50), 0, 0))  
                    kill(TargetRP, CFrame.new(-2.25, -1.5, 2.25), CFrame.Angles(math.rad(30), 0, 0))  
                    kill(TargetRP, CFrame.new(0, 1.5, 0), CFrame.Angles(math.rad(Angles), 0, 0))  
                    kill(TargetRP, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(Angles), 0, 0))  
                end  
            end  
      
            for _, Target in pairs(game.Players:GetPlayers()) do  
                if Target ~= Player then  
                    local TargetC = Target.Character  
                    local TargetH = TargetC and TargetC:FindFirstChildOfClass("Humanoid")  
                    local TargetRP = TargetC and TargetC:FindFirstChild("HumanoidRootPart")  
      
                    if TargetC and TargetH and TargetRP then  
                        flingPlayer(TargetC, TargetRP, TargetH)  
                    end  
                end  
            end  
      
            task.wait(0.5)  
            PCar:SetPrimaryPartCFrame(CFrame.new(0, 0, 0))  
            task.wait(0.5)  
            Humanoid.Sit = false  
            task.wait(0.5)  
            RootPart.CFrame = OldPos  
      
            SpinGyro:Destroy()  
    end
})

Troll:AddButton({
    Name = "Fling Boat",
    Callback = function()
        if not selectedPlayerName or not game.Players:FindFirstChild(selectedPlayerName) then
            return
        end

        local Player = game.Players.LocalPlayer
        local Character = Player.Character
        local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
        local RootPart = Character and Character:FindFirstChild("HumanoidRootPart")
        local Vehicles = game.Workspace:FindFirstChild("Vehicles")

        if not Humanoid or not RootPart then
            return
        end

        local function spawnBoat()
            RootPart.CFrame = CFrame.new(1754, -2, 58)
            task.wait(0.5)
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer("PickingBoat", "MilitaryBoatFree")
            task.wait(1)
            return Vehicles:FindFirstChild(Player.Name.."Car")
        end

        local PCar = Vehicles:FindFirstChild(Player.Name.."Car") or spawnBoat()
        if not PCar then
            return
        end

        local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")
        if not Seat then
            return
        end

        repeat 
            task.wait(0.1)
            RootPart.CFrame = Seat.CFrame * CFrame.new(0, 1, 0)
        until Humanoid.SeatPart == Seat

        local TargetPlayer = game.Players:FindFirstChild(selectedPlayerName)
        if not TargetPlayer or not TargetPlayer.Character then
            return
        end

        local TargetC = TargetPlayer.Character
        local TargetH = TargetC:FindFirstChildOfClass("Humanoid")
        local TargetRP = TargetC:FindFirstChild("HumanoidRootPart")

        if not TargetRP or not TargetH then
            return
        end

        local Spin = Instance.new("BodyAngularVelocity")
        Spin.Name = "Spinning"
        Spin.Parent = PCar.PrimaryPart
        Spin.MaxTorque = Vector3.new(0, math.huge, 0)
        Spin.AngularVelocity = Vector3.new(0, 369, 0) 

        local function moveCar(TargetRP, offset)
            if PCar and PCar.PrimaryPart then
                PCar:SetPrimaryPartCFrame(CFrame.new(TargetRP.Position + offset))
            end
        end

        task.spawn(function()
            while PCar and PCar.Parent and TargetRP and TargetRP.Parent do
                task.wait(0.01) 
                
                moveCar(TargetRP, Vector3.new(0, 1, 0))  
                moveCar(TargetRP, Vector3.new(0, -2.25, 5))  
                moveCar(TargetRP, Vector3.new(0, 2.25, 0.25))  
                moveCar(TargetRP, Vector3.new(-2.25, -1.5, 2.25))  
                moveCar(TargetRP, Vector3.new(0, 1.5, 0))  
                moveCar(TargetRP, Vector3.new(0, -1.5, 0))  

                if PCar and PCar.PrimaryPart then
                    local Rotation = CFrame.Angles(
                        math.rad(math.random(-369, 369)),  
                        math.rad(math.random(-369, 369)), 
                        math.rad(math.random(-369, 369))
                    )
                    PCar:SetPrimaryPartCFrame(CFrame.new(TargetRP.Position + Vector3.new(0, 1.5, 0)) * Rotation)
                end
            end

            if Spin and Spin.Parent then
                Spin:Destroy()
            end
        end)
    end
})

Troll:AddButton({
    Name = "Cancel Fling Boat",
    Callback = function()
        local Player = game.Players.LocalPlayer
        local Character = Player.Character
        local RootPart = Character and Character:FindFirstChild("HumanoidRootPart")
        local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
        local Vehicles = game.Workspace:FindFirstChild("Vehicles")

        if not RootPart or not Humanoid then
            return
        end

        Humanoid.PlatformStand = true

        for _, obj in pairs(RootPart:GetChildren()) do
            if obj:IsA("BodyAngularVelocity") or obj:IsA("BodyVelocity") then
                obj:Destroy()
            end
        end

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer("DeleteAllVehicles")
        task.wait(0.5)

        local PCar = Vehicles and Vehicles:FindFirstChild(Player.Name.."Car")
        if PCar and PCar.PrimaryPart then
            for _, obj in pairs(PCar.PrimaryPart:GetChildren()) do
                if obj:IsA("BodyAngularVelocity") or obj:IsA("BodyVelocity") then
                    obj:Destroy()
                end
            end
        end

        task.wait(1)

        local safePos = Vector3.new(0, 1000, 0)
        local bp = Instance.new("BodyPosition", RootPart)
        bp.Position = safePos
        bp.MaxForce = Vector3.new(math.huge, math.huge, math.huge)

        local bg = Instance.new("BodyGyro", RootPart)
        bg.CFrame = RootPart.CFrame
        bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)

        task.wait(3)

        bp:Destroy()
        bg:Destroy()
        Humanoid.PlatformStand = false

    end
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local cam = workspace.CurrentCamera
local currentPlayers, selectedPlayer = {}, nil
local viewing = false
local flingActive = false

local function FlingBall(target)

    local players = game:GetService("Players")
    local player = players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    local hrp = character:WaitForChild("HumanoidRootPart")
    local backpack = player:WaitForChild("Backpack")
    local ServerBalls = workspace.WorkspaceCom:WaitForChild("001_SoccerBalls")

    local function GetBall()
        if not backpack:FindFirstChild("SoccerBall") then
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "SoccerBall")
        end
        repeat task.wait() until backpack:FindFirstChild("SoccerBall")
        backpack.SoccerBall.Parent = character
        repeat task.wait() until ServerBalls:FindFirstChild("Soccer" .. player.Name)
        character.SoccerBall.Parent = backpack
        return ServerBalls:FindFirstChild("Soccer" .. player.Name)
    end

    local Ball = ServerBalls:FindFirstChild("Soccer" .. player.Name) or GetBall()
    Ball.CanCollide = false
    Ball.Massless = true
    Ball.CustomPhysicalProperties = PhysicalProperties.new(0.0001, 0, 0)

    if target ~= player then
        local tchar = target.Character
        if tchar and tchar:FindFirstChild("HumanoidRootPart") and tchar:FindFirstChild("Humanoid") then
            local troot = tchar.HumanoidRootPart
            local thum = tchar.Humanoid

            if Ball:FindFirstChildWhichIsA("BodyVelocity") then
                Ball:FindFirstChildWhichIsA("BodyVelocity"):Destroy()
            end

            local bv = Instance.new("BodyVelocity")
            bv.Name = "FlingPower"
            bv.Velocity = Vector3.new(9e8, 9e8, 9e8)
            bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            bv.P = 9e900
            bv.Parent = Ball

            workspace.CurrentCamera.CameraSubject = thum
            local StartTime = os.time()
            repeat
                if troot.Velocity.Magnitude > 0 then
                
                local pos_x = troot.Position.X + (troot.Velocity.X / 1.5)
                local pos_y = troot.Position.Y + (troot.Velocity.Y / 1.5)
                local pos_z = troot.Position.Z + (troot.Velocity.Z / 1.5)

                local position = Vector3.new(pos_x, pos_y, pos_z)
                Ball.CFrame = CFrame.new(position)
                Ball.Orientation += Vector3.new(45, 60, 30)
else
for i, v in pairs(tchar:GetChildren()) do
if v:IsA("BasePart") and v.CanCollide and not v.Anchored then
Ball.CFrame = v.CFrame
task.wait(1/6000)
end
end
end
                task.wait(1/6000)
            until troot.Velocity.Magnitude > 1000 or thum.Health <= 0 or not tchar:IsDescendantOf(workspace) or target.Parent ~= players
            workspace.CurrentCamera.CameraSubject = humanoid
        end
    end
end

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

local RE = ReplicatedStorage:WaitForChild("RE")
local ClearEvent = RE:FindFirstChild("1Clea1rTool1s")
local ToolEvent = RE:FindFirstChild("1Too1l")
local FireEvent = RE:FindFirstChild("1Gu1n")

local FlingSystem = { power = 1e16, damage = 9999999999999999999999999999998, interval = 0.02 }

local function clearTools()
    if ClearEvent then
        ClearEvent:FireServer("ClearAllTools")
    end
end

local function requestAssault()
    if ToolEvent then
        ToolEvent:InvokeServer("PickingTools", "Assault")
    end
end

local function hasWeapon()
    return LocalPlayer.Backpack:FindFirstChild("Assault") or (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Assault"))
end

local function equipWeapon()
    local weapon = LocalPlayer.Backpack:FindFirstChild("Assault")
    if weapon and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid:EquipTool(weapon)
            return true
        end
    end
    return false
end

local function getGunScript()
    if LocalPlayer.Character then
        local weapon = LocalPlayer.Character:FindFirstChild("Assault") or LocalPlayer.Backpack:FindFirstChild("Assault")
        if weapon then
            return weapon:FindFirstChild("GunScript_Local")
        end
    end
    return nil
end

local function executeShot(targetPart)
    local gunScript = getGunScript()
    if not gunScript or not targetPart or not FireEvent then return end

    local muzzle = gunScript:FindFirstChild("MuzzleEffect")
    local hit = gunScript:FindFirstChild("HitEffect")
    if not muzzle or not hit then return end

    local args = {
        targetPart,
        targetPart,
        Vector3.new(FlingSystem.power, FlingSystem.power, FlingSystem.power),
        targetPart.Position,
        muzzle,
        hit,
        0,
        0,
        { false },
        {
            FlingSystem.damage,
            Vector3.new(5000, 5000, 5000),
            BrickColor.new(29),
            0.25,
            Enum.Material.SmoothPlastic,
            0.25
        },
        true,
        false
    }

    FireEvent:FireServer(unpack(args))
end

local function getSelectedTarget()
    if not selectedPlayerName then return nil end
    local player = Players:FindFirstChild(selectedPlayerName)
    if player and player.Character then
        local humanoid = player.Character:FindFirstChild("Humanoid")
        local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
        if humanoid and humanoid.Health > 0 and rootPart then
            return { player = player, part = rootPart }
        end
    end
    return nil
end

local function flingTarget()
    local target = getSelectedTarget()
    if not target then return end

    executeShot(target.part)

    local char = target.player.Character
    if not char then return end

    local head = char:FindFirstChild("Head")
    if head then executeShot(head) end

    local torso = char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
    if torso then executeShot(torso) end
end

local function maintainWeapon()
    if not hasWeapon() then
        clearTools()
        task.wait(0.1)
        requestAssault()
        task.wait(0.2)

        local attempts = 0
        while not hasWeapon() and attempts < 20 do
            task.wait(0.1)
            attempts = attempts + 1
        end

        if hasWeapon() then
            equipWeapon()
        end
    end
end

function Stephannythrow()
    maintainWeapon()
    task.spawn(function()
        while true do
            maintainWeapon()
            if hasWeapon() and getGunScript() then
                pcall(flingTarget)
            end
            task.wait(FlingSystem.interval)
        end
    end)
end

Troll:AddSection({Name = "Stephanny Method"})

Troll:AddButton({
  Name = "Stephanny Throw",
Description = "Completely disrupts the target player",
  Callback = function()
            Stephannythrow()
end
})

Troll:AddSection({Name = "Fling Method"})

Troll:AddButton({
    Name = "Fling Ball",
    Callback = function()
        FlingBall(game:GetService("Players")[selectedPlayerName])
    end
})

local TrollTab = Window:MakeTab({ "Trolling Map", "map" })

TrollTab:AddSection({ "Trolling Map" })
--[[
TrollTab:AddSection({ "Landmark" })
local Facs = {
    [1] = {Name = "House #1", Position = Vector3.new(260.29, 4.37, 209.32)},
    [2] = {Name = "House #2", Position = Vector3.new(234.49, 4.37, 228.00)},
    [3] = {Name = "House #3", Position = Vector3.new(262.79, 21.37, 210.84)},
    [4] = {Name = "House #4", Position = Vector3.new(229.60, 21.37, 225.40)},
    [5] = {Name = "House #5", Position = Vector3.new(173.44, 21.37, 228.11)},
    [6] = {Name = "House #6", Position = Vector3.new(-43, 21, -137)},
    [7] = {Name = "House #7", Position = Vector3.new(-40, 36, -137)},
    [11] = {Name = "House #11", Position = Vector3.new(-21, 40, 436)},
    [12] = {Name = "House #12", Position = Vector3.new(155, 37, 433)},
    [13] = {Name = "House #13", Position = Vector3.new(255, 35, 431)},
    [14] = {Name = "House #14", Position = Vector3.new(254, 38, 394)},
    [15] = {Name = "House #15", Position = Vector3.new(148, 39, 387)},
    [16] = {Name = "House #16", Position = Vector3.new(-17, 42, 395)},
    [17] = {Name = "House #17", Position = Vector3.new(-189, 37, -247)},
    [18] = {Name = "House #18", Position = Vector3.new(-354, 37, -244)},
    [19] = {Name = "House #19", Position = Vector3.new(-456, 36, -245)},
    [20] = {Name = "House #20", Position = Vector3.new(-453, 38, -295)},
    [21] = {Name = "House #21", Position = Vector3.new(-356, 38, -294)},
    [22] = {Name = "House #22", Position = Vector3.new(-187, 37, -295)},
    [23] = {Name = "House #23", Position = Vector3.new(-410, 68, -447)},
    [24] = {Name = "House #24", Position = Vector3.new(-348, 69, -496)},
    [28] = {Name = "House #28", Position = Vector3.new(-103, 12, 1087)},
    [29] = {Name = "House #29", Position = Vector3.new(-730, 6, 808)},
    [30] = {Name = "House #30", Position = Vector3.new(-245, 7, 822)},
    [31] = {Name = "House #31", Position = Vector3.new(639, 76, -361)},
    [32] = {Name = "House #32", Position = Vector3.new(-908, 6, -361)},
    [33] = {Name = "House #33", Position = Vector3.new(-111, 70, -417)},
    [34] = {Name = "House #34", Position = Vector3.new(230, 38, 569)},
    [35] = {Name = "House #35", Position = Vector3.new(-30, 13, 2209)}
}

local FacOP = {}
for id, data in pairs(Facs) do
    table.insert(FacOP, {ID = id, Name = data.Name})
end

table.sort(FacOP, function(a, b)
    local numA = tonumber(a.Name:match("%d+")) or 0
    local numB = tonumber(b.Name:match("%d+")) or 0
    return numA < numB
end)

TrollTab:AddDropdown({
        Name = "Select a House",
        Options = (function()
        local t = {}
        for _, v in ipairs(FacOP) do
            table.insert(t, v.Name)
        end
        return t
    end)(),
        Callback = function(selectedName)
local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local hrp = character:WaitForChild("HumanoidRootPart")

        local FacID, FacPos
        for _, data in ipairs(FacOP) do
            if data.Name == selectedName then
                FacID = data.ID
                FacPos = Facs[FacID].Position
                break
            end
        end
        if not FacID or not FacPos then return end

        hrp.CFrame = CFrame.new(FacPos)
        
        task.wait(0.5)

        local args1 = {FacID}
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Lot:Claim"):InvokeServer(unpack(args1))

        local args2 = {FacID, "001_Landmark"}
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Lot:BuildProperty"):FireServer(unpack(args2))
    end
})

TrollTab:AddParagraph({ "Warn", "This is not visual, it applies directly to the shirt you are wearing" })
--]]
TrollTab:AddSection({ "Naruto" })

cancelShinra = false

TrollTab:AddButton({
    Name = "[OP] Shinra Tensei - Pain",
    Callback = function()
local TextChatService = game:GetService("TextChatService")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Player = Players.LocalPlayer

cancelShinra = false

if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then 
    TextChatService.TextChannels.RBXGeneral:SendAsync(
        "hi\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\rShinra Tensei!"
    )
else 
end

task.spawn(function()
local player = game.Players.LocalPlayer
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
    local root = player.Character.HumanoidRootPart

    local bodyPos = Instance.new("BodyPosition")
    bodyPos.MaxForce = Vector3.new(1e5, 1e5, 1e5)
    bodyPos.Position = root.Position
    bodyPos.Parent = root

    local targetUp = root.Position + Vector3.new(0, 10, 0)
    for i = 1, 10 do
        bodyPos.Position = bodyPos.Position:Lerp(targetUp, 0.1)
        task.wait(0.03)
    end

    task.wait(2)

    for i = 1, 10 do
        bodyPos.Position = bodyPos.Position:Lerp(root.Position, 0.1)
        task.wait(0.03)
    end
    
    bodyPos:Destroy()
end)

local RE = ReplicatedStorage:WaitForChild("RE")
local ClearEvent = RE:FindFirstChild("1Clea1rTool1s")
local ToolEvent = RE:FindFirstChild("1Too1l")
local FireEvent = RE:FindFirstChild("1Gu1n")

local function clearAllTools()
    if ClearEvent then
        ClearEvent:FireServer("ClearAllTools")
    end
end

local function getAssault()
    if ToolEvent then
        ToolEvent:InvokeServer("PickingTools", "Assault")
    end
end

local function hasAssault()
    return Player.Backpack:FindFirstChild("Assault") ~= nil
end

local function fireAtPart(targetPart)
    local gunScript = Player.Backpack:FindFirstChild("Assault")
        and Player.Backpack.Assault:FindFirstChild("GunScript_Local")

    if not gunScript or not targetPart then return end

    local args = {
        targetPart,
        targetPart,
        Vector3.new(1e14, 1e14, 1e14),
        targetPart.Position,
        gunScript:FindFirstChild("MuzzleEffect"),
        gunScript:FindFirstChild("HitEffect"),
        0,
        0,
        { false },
        {
            25,
            Vector3.new(100, 100, 100),
            BrickColor.new(29),
            0.25,
            Enum.Material.SmoothPlastic,
            0.25
        },
        true,
        false
    }

    FireEvent:FireServer(unpack(args))
end

local function fireAtAllPlayers(times)
    for i = 1, times do
        if cancelShinra then break end
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= Player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                fireAtPart(player.Character.HumanoidRootPart)
                task.wait(0.1)
            end
        end
    end
end

local selectedAudioID55 = 127171723747143

task.spawn(function()
local remote = ReplicatedStorage:FindFirstChild("RE") and ReplicatedStorage.RE:FindFirstChild("1Gu1nSound1s")
if remote then
remote:FireServer(workspace, selectedAudioID55, 1)
end

local root = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
if root then
local sound5 = Instance.new("Sound")
sound5.SoundId = "rbxassetid://" .. selectedAudioID55
sound5.Volume = 1
sound5.Looped = false
sound5.Parent = root
sound5:Play()
sound5.Ended:Connect(function() sound5:Destroy() end)
else
end
end)
            
task.spawn(function()
    while not cancelShinra do
        clearAllTools()
        getAssault()

        repeat
            task.wait(0.2)
        until hasAssault() or cancelShinra

        if not cancelShinra then
            fireAtAllPlayers(3)
            task.wait(1)
        end
    end
end)
end
})

TrollTab:AddButton({
    Name = "Cancel Shinra Tensei",
    Callback = function()
        cancelShinra = true
    end
})

cancelSharingan = false
ShModel = nil

TrollTab:AddButton({
    Name = "[OP] Sharingan - Uchiha",
    Callback = function()
local TextChatService = game:GetService("TextChatService")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Player = Players.LocalPlayer

cancelSharingan = false

if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then 
    TextChatService.TextChannels.RBXGeneral:SendAsync(
        "hi\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\rSharingan!"
    )
else 
end

local RE = ReplicatedStorage:WaitForChild("RE")
local ClearEvent = RE:FindFirstChild("1Clea1rTool1s")
local ToolEvent = RE:FindFirstChild("1Too1l")
local FireEvent = RE:FindFirstChild("1Gu1n")

local function clearAllTools()
    if ClearEvent then
        ClearEvent:FireServer("ClearAllTools")
    end
end

local function getAssault()
    if ToolEvent then
        ToolEvent:InvokeServer("PickingTools", "Assault")
    end
end

local function hasAssault()
    return Player.Backpack:FindFirstChild("Assault") ~= nil
end

local function fireAtPart(targetPart)
    local gunScript = Player.Backpack:FindFirstChild("Assault")
        and Player.Backpack.Assault:FindFirstChild("GunScript_Local")

    if not gunScript or not targetPart then return end

    local args = {
        targetPart,
        targetPart,
        Vector3.new(1e14, 1e14, 1e14),
        targetPart.Position,
        gunScript:FindFirstChild("MuzzleEffect"),
        gunScript:FindFirstChild("HitEffect"),
        0,
        0,
        { false },
        {
            25,
            Vector3.new(100, 100, 100),
            BrickColor.new(29),
            0.25,
            Enum.Material.SmoothPlastic,
            0.25
        },
        true,
        false
    }

    FireEvent:FireServer(unpack(args))
end

local function fireAtAllPlayers(times)
    for i = 1, times do
        if cancelSharingan then break end
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= Player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                fireAtPart(player.Character.HumanoidRootPart)
                task.wait(0.1)
            end
        end
    end
end

local selectedAudioID77 = 405593386

task.spawn(function()
local remote = ReplicatedStorage:FindFirstChild("RE") and ReplicatedStorage.RE:FindFirstChild("1Gu1nSound1s")
if remote then
remote:FireServer(workspace, selectedAudioID77, 1)
end

local root = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
if root then
local sound7 = Instance.new("Sound")
sound7.SoundId = "rbxassetid://" .. selectedAudioID77
sound7.Volume = 1
sound7.Looped = false
sound7.Parent = root
sound7:Play()
sound7.Ended:Connect(function() sound7:Destroy() end)
else
end
end)
            
task.spawn(function()
    while not cancelSharingan do
        clearAllTools()
        getAssault()

        repeat
            task.wait(0.2)
        until hasAssault() or cancelSharingan

        if not cancelSharingan then
            fireAtAllPlayers(3)
            task.wait(1)
        end
    end
end)
end
})

TrollTab:AddButton({
    Name = "Cancel Sharingan",
    Callback = function()
        cancelSharingan = true
        
        if ShModel and ShModel.Parent then
            ShModel:Destroy()
            ShModel = nil
        end
    end
})

TrollTab:AddSection({ "Jujutsu Kaisen" })

cancelExpansion = false
expansionSound = nil
expansionModel = nil
originalSky = nil

TrollTab:AddButton({
    Name = "[OP] Domain Expansion - Gojo",
    Callback = function()
local TextChatService = game:GetService("TextChatService")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Player = Players.LocalPlayer

cancelExpansion = false

if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then 
    TextChatService.TextChannels.RBXGeneral:SendAsync(
        "hi\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\rDomain Expansion!"
    )
else 
end

local function ativarDominio()
    local char = Player.Character or Player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")

    local dominio = Instance.new("Model", workspace)
    dominio.Name = "InfiniteVoid"
    expansionModel = dominio

    local esfera = Instance.new("Part")
    esfera.Shape = Enum.PartType.Ball
    esfera.Size = Vector3.new(300, 300, 300)
    esfera.Position = hrp.Position
    esfera.Anchored = true
    esfera.CanCollide = false
    esfera.Material = Enum.Material.ForceField
    esfera.Transparency = 0.3
    esfera.Color = Color3.fromRGB(0, 0, 0)
    esfera.Parent = dominio

    local luz = Instance.new("PointLight", esfera)
    luz.Color = Color3.fromRGB(0, 153, 255)
    luz.Brightness = 10
    luz.Range = 300

    local ps = Instance.new("ParticleEmitter", esfera)
    ps.Texture = "rbxassetid://243660364"
    ps.Color = ColorSequence.new(Color3.fromRGB(0, 153, 255))
    ps.LightEmission = 1
    ps.Size = NumberSequence.new(3)
    ps.Transparency = NumberSequence.new(0.2)
    ps.Rate = 1000
    ps.Lifetime = NumberRange.new(2)
    ps.Speed = NumberRange.new(0)
    ps.VelocitySpread = 180

    local som = Instance.new("Sound", esfera)
    som.SoundId = "rbxassetid://1843527678"
    som.Volume = 2
    som.Looped = true
    som:Play()
    expansionSound = som

    originalSky = Lighting:FindFirstChildOfClass("Sky")
    if originalSky then
        originalSky.Parent = nil
    end

    local newSky = Instance.new("Sky", Lighting)
    newSky.SkyboxBk = "rbxassetid://159454299"
    newSky.SkyboxDn = "rbxassetid://159454296"
    newSky.SkyboxFt = "rbxassetid://159454293"
    newSky.SkyboxLf = "rbxassetid://159454286"
    newSky.SkyboxRt = "rbxassetid://159454300"
    newSky.SkyboxUp = "rbxassetid://159454288"
end

ativarDominio()

local selectedAudioID99 = 95428790677335

task.spawn(function()
local remote = ReplicatedStorage:FindFirstChild("RE") and ReplicatedStorage.RE:FindFirstChild("1Gu1nSound1s")
if remote then
remote:FireServer(workspace, selectedAudioID99, 1)
end

local root = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
if root then
local sound9 = Instance.new("Sound")
sound9.SoundId = "rbxassetid://" .. selectedAudioID99
sound9.Volume = 1
sound9.Looped = false
sound9.Parent = root
sound9:Play()
sound9.Ended:Connect(function() sound9:Destroy() end)
else
end
end)

local selectedAudioID = 140031333626044

task.spawn(function()
    while not cancelExpansion do
        local remote = ReplicatedStorage:FindFirstChild("RE") and ReplicatedStorage.RE:FindFirstChild("1Gu1nSound1s")
        if remote then
            remote:FireServer(workspace, selectedAudioID, 1)
        end

        local root = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
        if root then
            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://" .. selectedAudioID
            sound.Volume = 1
            sound.Looped = false
            sound.Parent = root
            sound:Play()
            sound.Ended:Connect(function() sound:Destroy() end)
            task.wait(sound.TimeLength + 0.1)
        else
            break
        end
    end
end)

local RE = ReplicatedStorage:WaitForChild("RE")
local ClearEvent = RE:FindFirstChild("1Clea1rTool1s")
local ToolEvent = RE:FindFirstChild("1Too1l")
local FireEvent = RE:FindFirstChild("1Gu1n")

local function clearAllTools()
    if ClearEvent then
        ClearEvent:FireServer("ClearAllTools")
    end
end

local function getAssault()
    if ToolEvent then
        ToolEvent:InvokeServer("PickingTools", "Assault")
    end
end

local function hasAssault()
    return Player.Backpack:FindFirstChild("Assault") ~= nil
end

local function fireAtPart(targetPart)
    local gunScript = Player.Backpack:FindFirstChild("Assault")
        and Player.Backpack.Assault:FindFirstChild("GunScript_Local")

    if not gunScript or not targetPart then return end

    local args = {
        targetPart,
        targetPart,
        Vector3.new(1e14, 1e14, 1e14),
        targetPart.Position,
        gunScript:FindFirstChild("MuzzleEffect"),
        gunScript:FindFirstChild("HitEffect"),
        0,
        0,
        { false },
        {
            25,
            Vector3.new(100, 100, 100),
            BrickColor.new(29),
            0.25,
            Enum.Material.SmoothPlastic,
            0.25
        },
        true,
        false
    }

    FireEvent:FireServer(unpack(args))
end

local function fireAtAllPlayers(times)
    for i = 1, times do
        if cancelExpansion then break end
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= Player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                fireAtPart(player.Character.HumanoidRootPart)
                task.wait(0.1)
            end
        end
    end
end

task.spawn(function()
    while not cancelExpansion do
        clearAllTools()
        getAssault()

        repeat
            task.wait(0.2)
        until hasAssault() or cancelExpansion

        if not cancelExpansion then
            fireAtAllPlayers(3)
            task.wait(1)
        end
    end
end)
end
})

TrollTab:AddButton({
    Name = "Cancel Domain Expansion",
    Callback = function()
        cancelExpansion = true

        if expansionSound then
            expansionSound:Stop()
            expansionSound:Destroy()
            expansionSound = nil
        end

        if expansionModel and expansionModel.Parent then
            expansionModel:Destroy()
            expansionModel = nil
        end

        local Lighting = game:GetService("Lighting")
        local currentSky = Lighting:FindFirstChildOfClass("Sky")
        if currentSky then currentSky:Destroy() end

        if originalSky then
            originalSky.Parent = Lighting
            originalSky = nil
        end
    end
})

TrollTab:AddSection({ "Natural Disasters" })
TrollTab:AddButton({
    Name = "[OP] Tornado - Pirate Ship (Large)",
    Callback = function()
local RS = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TextChatService = game:GetService("TextChatService")
local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local RootPart = Character:WaitForChild("HumanoidRootPart")
local Vehicles = workspace:WaitForChild("Vehicles")

if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then 
    TextChatService.TextChannels.RBXGeneral:SendAsync(
        "hi\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\rTornado has appeared! Be careful..."
    )
else 
end

local selectedAudioID = 9068077052
local function playAudio()
    if not selectedAudioID then
        return
    end

    local args = {
        [1] = workspace,
        [2] = selectedAudioID,
        [3] = 1,
    }

    for i = 1, 5 do
        RS.RE:FindFirstChild("1Gu1nSound1s"):FireServer(unpack(args))

        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://" .. tostring(selectedAudioID)
        sound.Parent = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
        if sound.Parent then
            sound:Play()
        else
            break
        end

        task.wait(1.5)
        sound:Destroy()
    end
end

local function spawnBoat()
    RootPart.CFrame = CFrame.new(1754, -2, 58)
    task.wait(0.5)
    RS:WaitForChild("RE"):FindFirstChild("1Ca1r"):FireServer("PickingBoat", "PirateFree")
    task.wait(1)
    return Vehicles:FindFirstChild(Player.Name .. "Car")
end

local PCar = spawnBoat()
if not PCar then
    return
end

local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")
if not Seat then
    return
end

repeat
    task.wait(0.1)
    RootPart.CFrame = Seat.CFrame * CFrame.new(0, 1, 0)
until Humanoid.SeatPart == Seat

task.spawn(playAudio)

task.delay(4, function()
    if Humanoid.SeatPart then
        Humanoid.Sit = false
    end
    RootPart.CFrame = CFrame.new(0, 0, 0)
end)

local RE_Flip = RS:WaitForChild("RE"):WaitForChild("1Player1sCa1r")
task.spawn(function()
    while PCar and PCar.Parent do
        RE_Flip:FireServer("Flip")
        task.wait(0.5)
    end
end)

local waypoints = {
    Vector3.new(-16, 0, -47),
    Vector3.new(-110, 0, -45),
    Vector3.new(16, 0, -55)
}

local currentIndex = 1
local nextIndex = 2
local moveSpeed = 15
local rotationSpeed = math.rad(720)
local progress = 0
local currentRotation = 0

local function lerpCFrame(a, b, t)
    return a:lerp(b, t)
end

RunService.Heartbeat:Connect(function(dt)
    if not (PCar and PCar.PrimaryPart) then return end

    local startPos = waypoints[currentIndex]
    local endPos = waypoints[nextIndex]

    progress += (moveSpeed * dt) / (startPos - endPos).Magnitude
    if progress >= 1 then
        progress = 0
        currentIndex = nextIndex
        nextIndex = (nextIndex % #waypoints) + 1
    end

    local newPos = lerpCFrame(CFrame.new(startPos), CFrame.new(endPos), progress).p
    currentRotation += rotationSpeed * dt

    local cf = CFrame.new(newPos) * CFrame.Angles(0, currentRotation, 0)
    PCar:SetPrimaryPartCFrame(cf)
end)
end
})

TrollTab:AddButton({
    Name = "Cancel Tornado",
    Callback = function()
        local success, err = pcall(function()
            local args = { "DeleteAllVehicles" }
            game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
        end)

        if not success then
        else
        end
    end
})

TrollTab:AddSection({ "Others" })
TrollTab:AddButton({
    Name = "Black Hole",
    Description = "Activating this pulls Parts to your character",
    Callback = function()
        local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

local angle = 1
local radius = 10
local blackHoleActive = false

local function setupPlayer()
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

    local Folder = Instance.new("Folder", Workspace)
    local Part = Instance.new("Part", Folder)
    local Attachment1 = Instance.new("Attachment", Part)
    Part.Anchored = true
    Part.CanCollide = false
    Part.Transparency = 1

    return humanoidRootPart, Attachment1
end

local humanoidRootPart, Attachment1 = setupPlayer()

if not getgenv().Network then
    getgenv().Network = {
        BaseParts = {},
        Velocity = Vector3.new(14.46262424, 14.46262424, 14.46262424)
    }

    Network.RetainPart = function(part)
        if typeof(part) == "Instance" and part:IsA("BasePart") and part:IsDescendantOf(Workspace) then
            table.insert(Network.BaseParts, part)
            part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
            part.CanCollide = false
        end
    end

    local function EnablePartControl()
        LocalPlayer.ReplicationFocus = Workspace
        RunService.Heartbeat:Connect(function()
            sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
            for _, part in pairs(Network.BaseParts) do
                if part:IsDescendantOf(Workspace) then
                    part.Velocity = Network.Velocity
                end
            end
        end)
    end

    EnablePartControl()
end

local function ForcePart(v)
    if v:IsA("Part") and not v.Anchored and not v.Parent:FindFirstChild("Humanoid") and not v.Parent:FindFirstChild("Head") and v.Name ~= "Handle" then
        for _, x in next, v:GetChildren() do
            if x:IsA("BodyAngularVelocity") or x:IsA("BodyForce") or x:IsA("BodyGyro") or x:IsA("BodyPosition") or x:IsA("BodyThrust") or x:IsA("BodyVelocity") or x:IsA("RocketPropulsion") then
                x:Destroy()
            end
        end
        if v:FindFirstChild("Attachment") then
            v:FindFirstChild("Attachment"):Destroy()
        end
        if v:FindFirstChild("AlignPosition") then
            v:FindFirstChild("AlignPosition"):Destroy()
        end
        if v:FindFirstChild("Torque") then
            v:FindFirstChild("Torque"):Destroy()
        end
        v.CanCollide = false
        
        local Torque = Instance.new("Torque", v)
        Torque.Torque = Vector3.new(1000000, 1000000, 1000000)
        local AlignPosition = Instance.new("AlignPosition", v)
        local Attachment2 = Instance.new("Attachment", v)
        Torque.Attachment0 = Attachment2
        AlignPosition.MaxForce = math.huge
        AlignPosition.MaxVelocity = math.huge
        AlignPosition.Responsiveness = 500
        AlignPosition.Attachment0 = Attachment2
        AlignPosition.Attachment1 = Attachment1
    end
end

local function toggleBlackHole()
    blackHoleActive = not blackHoleActive
    if blackHoleActive then
        for _, v in next, Workspace:GetDescendants() do
            ForcePart(v)
        end

        Workspace.DescendantAdded:Connect(function(v)
            if blackHoleActive then
                ForcePart(v)
            end
        end)

        spawn(function()
            while blackHoleActive and RunService.RenderStepped:Wait() do
                angle = angle + math.rad(2)

                local offsetX = math.cos(angle) * radius
                local offsetZ = math.sin(angle) * radius

                Attachment1.WorldCFrame = humanoidRootPart.CFrame * CFrame.new(offsetX, 0, offsetZ)
            end
        end)
    else
        Attachment1.WorldCFrame = CFrame.new(0, -1000, 0)
    end
end

LocalPlayer.CharacterAdded:Connect(function()
    humanoidRootPart, Attachment1 = setupPlayer()
    if blackHoleActive then
        toggleBlackHole()
    end
end)

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/miroeramaa/TurtleLib/main/TurtleUiLib.lua"))()
local window = library:Window("Black Hole")

window:Slider("Radius Black Hole",1,100,10, function(Value)
   radius = Value
end)

window:Toggle("Toggle Black Hole", true, function(Value)
       if Value then
            toggleBlackHole()
        else
            blackHoleActive = false
        end
end)

spawn(function()
    while true do
        RunService.RenderStepped:Wait()
        if blackHoleActive then
            angle = angle + math.rad(angleSpeed)
        end
    end
end)

toggleBlackHole()
    end
})
TrollTab:AddButton({
    Name = "Bring Parts",
    Description = "To use, approach the Selected Player",
    Callback = function()
local Gui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Box = Instance.new("TextBox")
local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
local Label = Instance.new("TextLabel")
local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint")
local Button = Instance.new("TextButton")
local UITextSizeConstraint_3 = Instance.new("UITextSizeConstraint")

Gui.Name = "Gui"
Gui.Parent = gethui()
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = Gui
Main.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.335954279, 0, 0.542361975, 0)
Main.Size = UDim2.new(0.240350261, 0, 0.166880623, 0)
Main.Active = true
Main.Draggable = true

Box.Name = "Box"
Box.Parent = Main
Box.BackgroundColor3 = Color3.fromRGB(95, 95, 95)
Box.BorderColor3 = Color3.fromRGB(0, 0, 0)
Box.BorderSizePixel = 0
Box.Position = UDim2.new(0.0980926454, 0, 0.218712583, 0)
Box.Size = UDim2.new(0.801089942, 0, 0.364963502, 0)
Box.FontFace = Font.new("rbxasset://fonts/families/SourceSansSemibold.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
Box.PlaceholderText = "Player Name..."
Box.Text = ""
Box.TextColor3 = Color3.fromRGB(255, 255, 255)
Box.TextScaled = true
Box.TextSize = 31.000
Box.TextWrapped = true

UITextSizeConstraint.Parent = Box
UITextSizeConstraint.MaxTextSize = 31

Label.Name = "Label"
Label.Parent = Main
Label.BackgroundColor3 = Color3.fromRGB(95, 95, 95)
Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
Label.BorderSizePixel = 0
Label.Size = UDim2.new(1, 0, 0.160583943, 0)
Label.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
Label.Text = "Bring Parts"
Label.TextColor3 = Color3.fromRGB(255, 255, 255)
Label.TextScaled = true
Label.TextSize = 14.000
Label.TextWrapped = true

UITextSizeConstraint_2.Parent = Label
UITextSizeConstraint_2.MaxTextSize = 21

Button.Name = "Button"
Button.Parent = Main
Button.BackgroundColor3 = Color3.fromRGB(95, 95, 95)
Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
Button.BorderSizePixel = 0
Button.Position = UDim2.new(0.183284417, 0, 0.656760991, 0)
Button.Size = UDim2.new(0.629427791, 0, 0.277372271, 0)
Button.Font = Enum.Font.Nunito
Button.Text = "Bring Parts (Off)"
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.TextScaled = true
Button.TextSize = 28.000
Button.TextWrapped = true

UITextSizeConstraint_3.Parent = Button
UITextSizeConstraint_3.MaxTextSize = 28

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

local character
local humanoidRootPart

mainStatus = true
UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
	if input.KeyCode == Enum.KeyCode.RightControl and not gameProcessedEvent then
		mainStatus = not mainStatus
		Main.Visible = mainStatus
	end
end)

local Folder = Instance.new("Folder", Workspace)
local Part = Instance.new("Part", Folder)
local Attachment1 = Instance.new("Attachment", Part)
Part.Anchored = true
Part.CanCollide = false
Part.Transparency = 1

if not getgenv().Network then
	getgenv().Network = {
		BaseParts = {},
		Velocity = Vector3.new(14.46262424, 14.46262424, 14.46262424)
	}

	Network.RetainPart = function(Part)
		if Part:IsA("BasePart") and Part:IsDescendantOf(Workspace) then
			table.insert(Network.BaseParts, Part)
			Part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
			Part.CanCollide = false
		end
	end

	local function EnablePartControl()
		LocalPlayer.ReplicationFocus = Workspace
		RunService.Heartbeat:Connect(function()
			sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
			for _, Part in pairs(Network.BaseParts) do
				if Part:IsDescendantOf(Workspace) then
					Part.Velocity = Network.Velocity
				end
			end
		end)
	end

	EnablePartControl()
end

local function ForcePart(v)
	if v:IsA("BasePart") and not v.Anchored and not v.Parent:FindFirstChildOfClass("Humanoid") and not v.Parent:FindFirstChild("Head") and v.Name ~= "Handle" then
		for _, x in ipairs(v:GetChildren()) do
			if x:IsA("BodyMover") or x:IsA("RocketPropulsion") then
				x:Destroy()
			end
		end
		if v:FindFirstChild("Attachment") then
			v:FindFirstChild("Attachment"):Destroy()
		end
		if v:FindFirstChild("AlignPosition") then
			v:FindFirstChild("AlignPosition"):Destroy()
		end
		if v:FindFirstChild("Torque") then
			v:FindFirstChild("Torque"):Destroy()
		end
		v.CanCollide = false
		local Torque = Instance.new("Torque", v)
		Torque.Torque = Vector3.new(100000, 100000, 100000)
		local AlignPosition = Instance.new("AlignPosition", v)
		local Attachment2 = Instance.new("Attachment", v)
		Torque.Attachment0 = Attachment2
		AlignPosition.MaxForce = math.huge
		AlignPosition.MaxVelocity = math.huge
		AlignPosition.Responsiveness = 200
		AlignPosition.Attachment0 = Attachment2
		AlignPosition.Attachment1 = Attachment1
	end
end

local blackHoleActive = false
local DescendantAddedConnection

local function toggleBlackHole()
	blackHoleActive = not blackHoleActive
	if blackHoleActive then
		Button.Text = "Bring Parts (On)"
		for _, v in ipairs(Workspace:GetDescendants()) do
			ForcePart(v)
		end

		DescendantAddedConnection = Workspace.DescendantAdded:Connect(function(v)
			if blackHoleActive then
				ForcePart(v)
			end
		end)

		spawn(function()
			while blackHoleActive and RunService.RenderStepped:Wait() do
				Attachment1.WorldCFrame = humanoidRootPart.CFrame
			end
		end)
	else
		Button.Text = "Bring Parts (Off)"
		if DescendantAddedConnection then
			DescendantAddedConnection:Disconnect()
		end
	end
end

local function getPlayer(name)
	local lowerName = string.lower(name)
	for _, p in pairs(Players:GetPlayers()) do
		local lowerPlayer = string.lower(p.Name)
		if string.find(lowerPlayer, lowerName) then
			return p
		elseif string.find(string.lower(p.DisplayName), lowerName) then
			return p
		end
	end
end

local player = nil

local function VDOYZQL_fake_script() 
	local script = Instance.new('Script', Box)

	script.Parent.FocusLost:Connect(function(enterPressed)
		if enterPressed then
			player = getPlayer(Box.Text)
			if player then
				Box.Text = player.Name
			else
			end
		end
	end)
end
coroutine.wrap(VDOYZQL_fake_script)()
local function JUBNQKI_fake_script()
	local script = Instance.new('Script', Button)

	script.Parent.MouseButton1Click:Connect(function()
		if player then
			character = player.Character or player.CharacterAdded:Wait()
			humanoidRootPart = character:WaitForChild("HumanoidRootPart")
			toggleBlackHole()
		else
		end
	end)
end
coroutine.wrap(JUBNQKI_fake_script)()
    end
})

local Tab = Window:MakeTab({"Lag Server", "bomb"})

Tab:AddSection({
    Name = "Lag Server"
})

local Section = Tab:AddSection({
    Name = "Shutdown"
})

Tab:AddButton({
    Name = "[OLD] Shutdown Server",
    Callback = function()
        for m = 1, 495 do
            local args = {
                [1] = "PickingTools",
                [2] = "FireHose"
            }
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
            local args = {
                [1] = "FireHose",
                [2] = "DestroyFireHose"
            }
            game:GetService("Players").LocalPlayer.Backpack.FireHose.ToolSound:FireServer(unpack(args))
        end
        local oldcf = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(999999999.414, -475, 999999999.414)
        local rootpart = game.Players.LocalPlayer.Character.HumanoidRootPart
        repeat wait() until rootpart.Parent == nil
        repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldcf
        wait()
        for _, ergeg in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if ergeg.Name == "FireHose" then
                ergeg.Parent = game.Players.LocalPlayer.Character
            end
        end
        wait(0.5)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(9999, -475, 9999)
    end
})

local toggles = { LagFireX = false }

local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")

local function clickNormally(object)
    local clickDetector = object:FindFirstChildWhichIsA("ClickDetector")
    if clickDetector then
        fireclickdetector(clickDetector)
    end
end

local function lagarJogoFireX(fireXPath, maxTeleports)
    if fireXPath then
        local teleportCount = 0
        local connection
        connection = RunService.Heartbeat:Connect(function()
            if not toggles.LagFireX or teleportCount >= maxTeleports then
                connection:Disconnect()
                return
            end
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = fireXPath.CFrame
            clickNormally(fireXPath)
            teleportCount = teleportCount + 1
        end)
        task.delay(300, function()
            if toggles.LagFireX then
                toggles.LagFireX = false
                connection:Disconnect()

                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 900000, 0)

                local clickConnection
                clickConnection = RunService.Heartbeat:Connect(function()
                    VirtualUser:CaptureController()
                    VirtualUser:ClickButton1(Vector2.new(500, 500))
                end)
            end
        end)
    else
    end
end

Tab:AddToggle({
    Name = "[NEW] Shutdown Server",
    Default = false,
    Callback = function(state)
        toggles.LagFireX = state
        if state then
            local fireXPath = workspace:FindFirstChild("WorkspaceCom"):FindFirstChild("001_GiveTools"):FindFirstChild("FireX")
            if fireXPath then
                lagarJogoFireX(fireXPath, 999999999)
            else
            end
        else
        end
    end
})

local Section = Tab:AddSection({
    Name = "Laptop"
})

local toggles = { LagLaptop = false }

local function clickNormally(object)
    local clickDetector = object:FindFirstChildWhichIsA("ClickDetector")
    if clickDetector then
        fireclickdetector(clickDetector)
    end
end

local function lagarJogoLaptop(laptopPath, maxTeleports)
    if laptopPath then
        local teleportCount = 0
        while teleportCount < maxTeleports and toggles.LagLaptop do
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = laptopPath.CFrame
            clickNormally(laptopPath)
            teleportCount = teleportCount + 1
            wait(0.0001)
        end
    else
    end
end

Tab:AddToggle({
    Name = "Lag Laptop (Hard)",
    Default = false,
    Callback = function(state)
        toggles.LagLaptop = state
        if state then
            local laptopPath = workspace:FindFirstChild("WorkspaceCom"):FindFirstChild("001_GiveTools"):FindFirstChild("Laptop")
            if laptopPath then
                spawn(function()
                    lagarJogoLaptop(laptopPath, 999999999)
                end)
            else
            end
        else
        end
    end
})

Tab:AddParagraph({
    "Warn",
    "The lag effect starts after 20 seconds"
})

local Section = Tab:AddSection({
    Name = "Bomb"
})


local BombActive = false

Tab:AddToggle({
    Name = "Lag Bomb",
    Default = false,
    Callback = function(Value)
        if Value then
            BombActive = true

            local Player = game.Players.LocalPlayer
            local Character = Player.Character or Player.CharacterAdded:Wait()
            local RootPart = Character:WaitForChild("HumanoidRootPart")
            local WorkspaceService = game:GetService("Workspace")
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local Bomb = WorkspaceService:WaitForChild("WorkspaceCom"):WaitForChild("001_CriminalWeapons"):WaitForChild("GiveTools"):WaitForChild("Bomb")

            task.spawn(function()
                while BombActive do
                    if Bomb and RootPart then
                        RootPart.CFrame = Bomb.CFrame
                        fireclickdetector(Bomb.ClickDetector) 
                        task.wait(0.00001) 
                    else
                        task.wait(0.0001) 
                    end
                end
            end)

            task.spawn(function()
                while BombActive do
                    if Bomb and RootPart then
                        local VirtualInputManager = game:GetService("VirtualInputManager")
                        VirtualInputManager:SendMouseButtonEvent(500, 500, 0, true, game, 0) 
                        task.wait(1.5)
                        VirtualInputManager:SendMouseButtonEvent(500, 500, 0, false, game, 0) 

                        local args = {
                            [1] = "Bomb" .. Player.Name 
                        }
                        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Blo1wBomb1sServe1r"):FireServer(unpack(args))
                    end
                    task.wait(1.5) 
                end
            end)
        else
            BombActive = false
        end
    end
})

Tab:AddParagraph({
    "Warn",
    "The lag effect starts after 35 seconds"
})

local UniversalTab = Window:MakeTab({"Scripts Universal", "codesandbox"})

UniversalTab:AddSection({
    Name = "Scripts Universal"
})

UniversalTab:AddSection({
    Name = "All Places"
})
UniversalTab:AddButton({
    Name = "Shift Lock",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/N2tiHgyv"))()
    end
})

UniversalTab:AddButton({
    Name = "Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end
})

UniversalTab:AddButton({
    Name = "Teleport Tool",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/err0r129/KptHadesBlair/main/Bao.lua"))()
    end
})

UniversalTab:AddButton({
    Name = "Fly Gui",
    Callback = function()
        loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Fly-v3-7412"))()
    end
})
 
UniversalTab:AddButton({
    Name = "fe GONER",
    Callback = function()
        -- by shelby 
pcall(function()
    local args = {
        [1] = {
            [1] = 0,
            [2] = 0,
            [3] = 0,
            [4] = 0,
            [5] = 0,
            [6] = 0
        }
    }

    game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local UserInputService = game:GetService("UserInputService")
    local StarterGui = game:GetService("StarterGui")

    local LocalPlayer = Players.LocalPlayer
    local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    if not Humanoid then return end

    local Remotes = ReplicatedStorage:WaitForChild("Remotes")
    local WearRemote = Remotes:WaitForChild("Wear")
    local WearShirtRemote = Remotes:WaitForChild("WearShirt")
    local WearPantsRemote = Remotes:WaitForChild("WearPants")

    local Desc = Humanoid:GetAppliedDescription()
    for _, accessory in ipairs(Desc:GetAccessories(true)) do
        if accessory.AssetId then
            WearRemote:InvokeServer(accessory.AssetId)
        end
    end

    local accessoriesToWear = {
        17770317484,
        17771175724,
        17822749561,
        17822722698,
        81713181781035,
        12866137394,
        17772174303
    }
    for _, id in ipairs(accessoriesToWear) do
        WearRemote:InvokeServer(id)
    end

    local shirtsToWear = {17812415139}
    local pantsToWear = {17812417356}
    for _, id in ipairs(shirtsToWear) do
        WearShirtRemote:InvokeServer(id)
    end
    for _, id in ipairs(pantsToWear) do
        WearPantsRemote:InvokeServer(id)
    end

    local animate = Character:WaitForChild("Animate")

    local tool = Instance.new("Tool")
    tool.Name = "GonerV2"
    tool.RequiresHandle = false
    tool.CanBeDropped = false
    tool.TextureId = "rbxassetid://85295330623575"
    tool.Parent = LocalPlayer:WaitForChild("Backpack")

    local equipped = false
    local selectedAnimation = {id = 139707883040856}
    local active = {}
    local remote = ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Gu1nSound1s")
    local soundId = 94301308694277
    local volume = 0.65

    local function playEmote()
        pcall(function()
            local track = Humanoid:PlayEmoteAndGetAnimTrackById(selectedAnimation.id)
            if track then
                track.Looped = true
                track.Priority = Enum.AnimationPriority.Action
                active[selectedAnimation.id] = track
                track.Stopped:Connect(function()
                    active[selectedAnimation.id] = nil
                end)
            end
        end)
    end

    local function playLocalSound(parent)
        pcall(function()
            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://"..soundId
            sound.Volume = volume
            sound.Parent = parent
            sound:Play()
            sound.Ended:Connect(function()
                sound:Destroy()
            end)
        end)
    end

    tool.Equipped:Connect(function() equipped = true end)
    tool.Unequipped:Connect(function() equipped = false end)

    UserInputService.InputBegan:Connect(function(input, gpe)
        if not equipped or gpe then return end
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            playEmote()
            if remote then
                pcall(function()
                    remote:FireServer(Character.HumanoidRootPart, soundId, volume)
                end)
            end
            playLocalSound(Character.HumanoidRootPart)
        end
    end)

    local char = LocalPlayer.Character
    local animate = char:WaitForChild("Animate")
    local humanoid = char:WaitForChild("Humanoid")

    for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
        pcall(function()
            track:Stop()
            track:Destroy()
        end)
    end

    animate.walk.WalkAnim.AnimationId   = "http://www.roblox.com/asset/?id=0"
    animate.run.RunAnim.AnimationId     = "http://www.roblox.com/asset/?id=0"
    animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=0"
    animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=0"
    animate.jump.JumpAnim.AnimationId   = "http://www.roblox.com/asset/?id=0"
    animate.fall.FallAnim.AnimationId   = "http://www.roblox.com/asset/?id=0"
    animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=0"

    humanoid.Jump = false

    animate.walk.WalkAnim.AnimationId   = "http://www.roblox.com/asset/?id=121350640829746"
    animate.run.RunAnim.AnimationId     = "http://www.roblox.com/asset/?id=121350640829746"
    animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=135425213693488"
    animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=135579638960045"
    animate.jump.JumpAnim.AnimationId   = "http://www.roblox.com/asset/?id=104108770420406"
    animate.fall.FallAnim.AnimationId   = "http://www.roblox.com/asset/?id=104108770420406"
    animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=421121499"

    humanoid.Jump = false

    StarterGui:SetCore("SendNotification", {
        Title = "GonerV2",
        Text = "By Shelby/Usuario_X1x1x1",
        Icon = "rbxassetid://85295330623575",
        Duration = 8,
        Button1 = "OK"
    })
end)
    end
})

UniversalTab:AddButton({
    Name = "Telekinesis",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SAZXHUB/Control-update/main/README.md", true))()
    end

})

local ScriptsTab = Window:MakeTab({"Scripts", "codesandbox"})

ScriptsTab:AddSection({
    Name = "Scripts"
})

ScriptsTab:AddSection({
    Name = "This Place"
})
ScriptsTab:AddButton({
    Name = "Chaos Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Venom-devX/ChaosHub/refs/heads/main/loader.lua"))()
    end
})

ScriptsTab:AddButton({
    Name = "Rael Hub",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/The-Mimic-Rael-Hub-20921"))()
    end
})

ScriptsTab:AddButton({
    Name = "Nytherune Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/wx-sources/spacecomm/refs/heads/main/nytheruneplus"))()
    end
})

ScriptsTab:AddButton({
    Name = "Cartola Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Davi999z/Cartola-Hub/refs/heads/main/Brookhaven",true))()
    end
})

ScriptsTab:AddButton({
    Name = "Coquette Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Daivd977/Deivd999/refs/heads/main/pessal"))()
    end
})

ScriptsTab:AddButton({
    Name = "Furia Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Dboas123432sx/bsx_hub/refs/heads/main/FURIAHUB-v1"))()
    end
})

ScriptsTab:AddButton({
    Name = "Drip Client",
    Callback = function()
        loadstring(game:HttpGet(("https://raw.githubusercontent.com/realgengar/Main/refs/heads/main/base.lua"),true))()
   
 end
})

local pl = game.Players.LocalPlayer
local players = {}

local function updatePlayerList()
    players = {}
    for _, player in pairs(game.Players:GetPlayers()) do
        table.insert(players, player.Name)
    end
    return players
end

updatePlayerList()

local ChildTab = Window:MakeTab({"Child", "baby"})

local Section = ChildTab:AddSection({
    Name = "Child"
})

local chasingplayer = nil
local playerChild = ChildTab:AddDropdown({
    Name = "Select a player to chase",
    Options = players,
    Default = "",
    Callback = function(selected)
        if game.Players:FindFirstChild(selected) then
            chasingplayer = selected
        else
            chasingplayer = nil
        end
    end
})

ChildTab:AddButton({
    Name = "Update Player List",
    Callback = function()
        local updatedPlayers = updatePlayerList()
        if playerChild and updatedPlayers then
            pcall(function()
                playerChild:Refresh(updatedPlayers)
            end)
            if chasingplayer and not game.Players:FindFirstChild(chasingplayer) then
                chasingplayer = nil
                pcall(function()
                    playerChild:Set("")
                end)
            end
        end
    end
})

game.Players.PlayerAdded:Connect(function()
    task.wait(0.1)
    local updatedPlayers = updatePlayerList()
    if playerChild and updatedPlayers then
        pcall(function()
            playerChild:Refresh(updatedPlayers)
        end)
    end
end)

game.Players.PlayerRemoving:Connect(function(player)
    task.wait(0.1)
    local updatedPlayers = updatePlayerList()
    if playerChild and updatedPlayers then
        pcall(function()
            playerChild:Refresh(updatedPlayers)
        end)
        if chasingplayer == player.Name then
            chasingplayer = nil
            pcall(function()
                playerChild:Set("")
            end)
        end
    end
end)

ChildTab:AddButton({
    Name = "Send Child",
    Callback = function()
        if not chasingplayer then
            return
        end
        if not workspace:FindFirstChild(pl.Name) or not workspace[pl.Name]:FindFirstChild("FollowCharacter") then
            local args = {
                [1] = "CharacterFollowSpawnPlayer",
                [2] = "BabyBoy"
            }
            local success, err = pcall(function()
                game:GetService("ReplicatedStorage").RE:FindFirstChild("1Bab1yFollo1w"):FireServer(unpack(args))
            end)
            if not success then
            end
        end
        
        task.wait(0.2)
        
        if workspace:FindFirstChild(pl.Name) then
            for _, v in pairs(workspace[pl.Name]:GetChildren()) do
                if v:IsA("BasePart") then
                    v.CanCollide = true
                end
            end
        end

        local target = chasingplayer
        if workspace:FindFirstChild(target) and workspace:FindFirstChild(pl.Name) and workspace[pl.Name]:FindFirstChild("FollowCharacter") then
            workspace[pl.Name].FollowCharacter.Parent = workspace[target]

            if rawget(getgenv(), "RunService") then
                return
            end

            getgenv().RunService = game:GetService("RunService").Heartbeat:Connect(function()
                local followCharacter = workspace[target]:FindFirstChild("FollowCharacter")
                if followCharacter and followCharacter:FindFirstChild("Torso") and followCharacter.Torso:FindFirstChild("BodyPosition") then
                    local humanoidRootPart = workspace[target]:FindFirstChild("HumanoidRootPart")
                    if humanoidRootPart then
                        followCharacter.Torso.BodyPosition.Position = humanoidRootPart.Position - (humanoidRootPart.CFrame.LookVector * 3)
                        followCharacter.Torso.BodyGyro.CFrame = humanoidRootPart.CFrame
                    end
                end
            end)
        end
    end
})

ChildTab:AddButton({
    Name = "Return Child",
    Callback = function()
        if rawget(getgenv(), "RunService") then
            getgenv().RunService:Disconnect()
            getgenv().RunService = nil
        end

        local args = { [1] = "DeleteFollowCharacter" }
        local success, err = pcall(function()
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Bab1yFollo1w"):FireServer(unpack(args))
        end)
        if not success then
        end

        local args1 = { [1] = "CharacterFollowSpawnPlayer", [2] = "BabyBoy" }
        success, err = pcall(function()
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Bab1yFollo1w"):FireServer(unpack(args1))
        end)
        if not success then
        end
    end
})

ChildTab:AddToggle({
    Name = "View Player",
    Default = false,
    Callback = function(Value)
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local LocalPlayer = Players.LocalPlayer
        local Camera = workspace.CurrentCamera

        if Value then
            if not chasingplayer then
                return false
            end

            if not rawget(getgenv(), "CameraConnection") then
                getgenv().CameraConnection = RunService.Heartbeat:Connect(function()
                    local targetPlayer = Players:FindFirstChild(chasingplayer)
                    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") then
                        Camera.CameraSubject = targetPlayer.Character.Humanoid
                    else
                        if rawget(getgenv(), "CameraConnection") then
                            getgenv().CameraConnection:Disconnect()
                            getgenv().CameraConnection = nil
                        end
                        Camera.CameraSubject = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") or nil
                    end
                end)
            end
        else
            if rawget(getgenv(), "CameraConnection") then
                getgenv().CameraConnection:Disconnect()
                getgenv().CameraConnection = nil
            end
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                Camera.CameraSubject = LocalPlayer.Character.Humanoid
            end
        end
    end
})

local LocalPlayerTab = Window:MakeTab({"Local Player", "user"})

Section = LocalPlayerTab:AddSection({
    Name = "Chat"
})

local TextSave
local tcs = game:GetService("TextChatService")
local chat = tcs.ChatInputBarConfiguration and tcs.ChatInputBarConfiguration.TargetTextChannel

function sendchat(msg)
    if not msg or msg == "" then return end
    if tcs.ChatVersion == Enum.ChatVersion.LegacyChatService then
        local success, err = pcall(function()
            game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents").SayMessageRequest:FireServer(msg, "All")
        end)
        if not success then
        end
    elseif chat then
        local success, err = pcall(function()
            chat:SendAsync(msg)
        end)
        if not success then
        end
    end
end

LocalPlayerTab:AddTextBox({
    Name = "Enter Text",
    PlaceholderText = "Uh... Hi!",
    Callback = function(text)
        TextSave = text
    end
})

LocalPlayerTab:AddButton({
    Name = "Send Chat",
    Callback = function()
        sendchat(TextSave)
    end
})

getgenv().ChaosHubEnviarDelay = 1

LocalPlayerTab:AddSlider({
    Name = "Delay Spam",
    Min = 0.4,
    Max = 10,
    Default = 1,
    Increment = 0.1,
    Callback = function(Value)
        getgenv().ChaosHubEnviarDelay = Value
    end
})

LocalPlayerTab:AddToggle({
    Name = "Spam Chat",
    Default = false,
    Flag = "SpamXhati",
    Callback = function(Value)
        getgenv().ChaosHubSpawnText = Value
        while getgenv().ChaosHubSpawnText do
            sendchat(TextSave)
            task.wait(getgenv().ChaosHubEnviarDelay)
        end
    end
})

LocalPlayerTab:AddButton({
    Name = "Spam Chat - Hacked by S4turn Hub",
    Callback = function()
        if game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.TextChatService then 
            game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("hi\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\rSystem: Hacked by S4turn Hub")
        else 
    end
end
})

LocalPlayerTab:AddButton({
    Name = "Clear Chat",
    Callback = function()
        if game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.TextChatService then 
            game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("hi\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\rServer: Chat Cleared")
        else 
    end
end
})

local FunT = Window:MakeTab({ "Fun Players", "fun" })

FunT:AddSection({ "Fun Players" })

Section = FunT:AddSection({
    Name = "Head Sit"
})

local selectedHeadSit = nil
local headSitConnection = nil

local pl = game.Players.LocalPlayer
local players = {}

local function updatePlayerList()
    players = {}
    for _, player in pairs(game.Players:GetPlayers()) do
        table.insert(players, player.Name)
    end
    return players
end

updatePlayerList()

local headSitDropdown = FunT:AddDropdown({
    Name = "Select a Player",
    Default = "",
    Options = players,
    Callback = function(Value)
        selectedHeadSit = Value
    end
})

FunT:AddToggle({
    Name = "Head Sit",
    Default = false,
    Callback = function(bool)
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        local humanoid = character:WaitForChild("Humanoid")

        if not selectedHeadSit or selectedHeadSit == "" then
            return false
        end

        local selectedPlayer = game.Players:FindFirstChild(selectedHeadSit)

        if bool then
            if selectedPlayer and selectedPlayer.Character then
                humanoid.Sit = true

                if headSitConnection then
                    headSitConnection:Disconnect()
                end

                headSitConnection = game:GetService("RunService").Heartbeat:Connect(function()
                    if selectedPlayer.Character and selectedPlayer.Character:FindFirstChild("Head") and humanoid.Sit then
                        local targetHead = selectedPlayer.Character.Head
                        humanoidRootPart.CFrame = targetHead.CFrame * CFrame.Angles(0, 0, 0) * CFrame.new(0, 1.6, 0.4)
                    else
                        if headSitConnection then
                            headSitConnection:Disconnect()
                            headSitConnection = nil
                            humanoid.Sit = false
                        end
                    end
                end)
            else
                return false
            end
        else
            if headSitConnection then
                headSitConnection:Disconnect()
                headSitConnection = nil
            end
            humanoid.Sit = false
        end
    end
})

FunT:AddButton({
    Name = "Update Player List",
    Callback = function()
        local updatedPlayers = updatePlayerList()
        if headSitDropdown and updatedPlayers then
            pcall(function()
                headSitDropdown:Refresh(updatedPlayers)
            end)
            if selectedHeadSit and not game.Players:FindFirstChild(selectedHeadSit) then
                selectedHeadSit = nil
                pcall(function()
                    headSitDropdown:Set("")
                end)
            end
        end
    end
})

local Tab = Window:MakeTab({"Protection", "rbxassetid://11322093465"})

local LocalPlayer = game:GetService("Players").LocalPlayer
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")

local backupTables = {
    Vehicles = {},
    Canoes = {},
    Jets = {},
    Helis = {},
    Balls = {}
}

local TeleportCarro = {}
function TeleportCarro:MostrarNotificacao(msg)
    print("Ã°Å¸â€â€ "..msg)
end

local function AntiFlingLoop(name, getFolderFunc)
    local active = false
    task.spawn(function()
        while true do
            if active and LocalPlayer.Character then
                local folder = getFolderFunc()
                if folder then
                    for _, item in ipairs(folder:GetChildren()) do
                        local isMine = false
                        if name == "Vehicles" then
                            for _, seat in ipairs(item:GetDescendants()) do
                                if (seat:IsA("VehicleSeat") or seat:IsA("Seat")) and seat.Occupant and seat.Occupant.Parent == LocalPlayer.Character then
                                    isMine = true
                                    break
                                end
                            end
                        elseif name == "Canoes" then
                            local owner = item:FindFirstChild("Owner")
                            isMine = owner and owner.Value == LocalPlayer
                        elseif name == "Jets" or name == "Helis" then
                            isMine = item.Name == LocalPlayer.Name
                        end
                        if not isMine then
                            table.insert(backupTables[name], item:Clone())
                            item:Destroy()
                        end
                    end
                end
            end
            task.wait(0.03)
        end
    end)
    return function(state)
        active = state
        TeleportCarro:MostrarNotificacao(name.." "..(state and "ativado!" or "desativado!"))
        if not state then
            for _, item in ipairs(backupTables[name]) do
                local parentFolder = getFolderFunc()
                if parentFolder then item.Parent = parentFolder end
            end
            backupTables[name] = {}
        end
    end
end

Tab:AddButton({
    Name = "Anti Som",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/267266273ffsfs/antsom/refs/heads/main/Main.txt"))()
    end
})

-- TOGGLES DE ANTI-FLING / SIT
Tab:AddToggle({
    Name = "Anti fling Carros",
    Description = "",
    Default = false,
    Callback = AntiFlingLoop("Vehicles", function()
        return Workspace:FindFirstChild("Vehicles")
    end)
})

Tab:AddToggle({
    Name = "Anti Canoe Fling",
    Description = "",
    Default = false,
    Callback = AntiFlingLoop("Canoes", function()
        local workspaceCom = Workspace:FindFirstChild("WorkspaceCom")
        return workspaceCom and workspaceCom:FindFirstChild("001_CanoeStorage")
    end)
})

Tab:AddToggle({
    Name = "Anti Fling Jets",
    Description = "",
    Default = false,
    Callback = AntiFlingLoop("Jets", function()
        local folder = Workspace:FindFirstChild("WorkspaceCom")
        if folder and folder:FindFirstChild("001_Airport") then
            local storage = folder["001_Airport"]:FindFirstChild("AirportHanger")
            if storage then return storage:FindFirstChild("001_JetStorage") and storage["001_JetStorage"]:FindFirstChild("JetAirport") end
        end
    end)
})

Tab:AddToggle({
    Name = "Anti Fling HelicÃ³pteros",
    Description = "",
    Default = false,
    Callback = AntiFlingLoop("Helis", function()
        local folder = Workspace:FindFirstChild("WorkspaceCom")
        return folder and folder:FindFirstChild("001_HeliStorage") and folder["001_HeliStorage"]:FindFirstChild("PoliceStationHeli")
    end)
})

Tab:AddToggle({
    Name = "Anti Fling Ball",
    Description = "",
    Default = false,
    Callback = AntiFlingLoop("Balls", function()
        local folder = Workspace:FindFirstChild("WorkspaceCom")
        return folder and folder:FindFirstChild("001_SoccerBalls")
    end)
})

-- Anti Sit
local antiSitActive = false
Tab:AddToggle({
    Name = "Anti Sit",
    Description = "",
    Default = false,
    Callback = function(state)
        antiSitActive = state
        TeleportCarro:MostrarNotificacao("Anti Sit "..(state and "ativado!" or "desativado!"))
        task.spawn(function()
            while antiSitActive and LocalPlayer.Character do
                local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
                    if humanoid:GetState() == Enum.HumanoidStateType.Seated then
                        humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                    end
                end
                task.wait(0.05)
            end
            if not antiSitActive then
                local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
                end
            end
        end)
    end
})

Tab:AddToggle({
    Name = "Anti-Lag",
    Description = "",
    Default = false,
    Callback = function(state)
        local Players = game:GetService("Players")
        local dedupLock = {}
        local IGNORED_PLAYER

        if not state then return end

        local function marcarIgnorado(player)
            IGNORED_PLAYER = player
        end

        local function isTargetTool(inst)
            return inst:IsA("Tool")
        end

        local function gatherTools(player)
            local found = {}
            local containers = {}
            if player.Character then table.insert(containers, player.Character) end
            local backpack = player:FindFirstChildOfClass("Backpack")
            if backpack then table.insert(containers, backpack) end
            local sg = player:FindFirstChild("StarterGear")
            if sg then table.insert(containers, sg) end
            for _, container in ipairs(containers) do
                for _, child in ipairs(container:GetChildren()) do
                    if isTargetTool(child) then table.insert(found, child) end
                end
            end
            return found
        end

        local function dedupePlayer(player)
            if player == IGNORED_PLAYER then return end
            if dedupLock[player] then return end
            dedupLock[player] = true
            local tools = gatherTools(player)
            if #tools > 1 then
                for i = 2, #tools do pcall(function() tools[i]:Destroy() end) end
            end
            dedupLock[player] = false
        end

        local function hookPlayer(player)
            if not IGNORED_PLAYER then marcarIgnorado(player) end
            task.defer(dedupePlayer, player)
            local function setupChar(char)
                task.delay(0.5, function() dedupePlayer(player) end)
                char.ChildAdded:Connect(function(child)
                    if isTargetTool(child) then task.delay(0.1, function() dedupePlayer(player) end) end
                end)
            end
            if player.Character then setupChar(player.Character) end
            player.CharacterAdded:Connect(setupChar)
            local backpack = player:WaitForChild("Backpack", 10)
            if backpack then
                backpack.ChildAdded:Connect(function(child)
                    if isTargetTool(child) then task.delay(0.1, function() dedupePlayer(player) end) end
                end)
            end
            local sg = player:FindFirstChild("StarterGear") or player:WaitForChild("StarterGear", 10)
            if sg then
                sg.ChildAdded:Connect(function(child)
                    if isTargetTool(child) then task.delay(0.1, function() dedupePlayer(player) end) end
                end)
            end
        end

        Players.PlayerAdded:Connect(hookPlayer)
        for _, plr in ipairs(Players:GetPlayers()) do hookPlayer(plr) end

        task.spawn(function()
            while state do
                for _, plr in ipairs(Players:GetPlayers()) do dedupePlayer(plr) end
                task.wait(2)
            end
        end)
    end
})

local Tab = Window:MakeTab({"Name & Bio", "Paper"})

local rgbSpeed = 1

Tab:AddSlider({
    Name = "Speed RGB",
    Description = "Color change speed",
    Min = 1,
    Max = 5,
    Increase = 1,
    Default = 3,
    Callback = function(Value)
        rgbSpeed = Value
    end
})

local function getRainbowColor(speedMultiplier)
    local h = (tick() * speedMultiplier % 5) / 5
    return Color3.fromHSV(h, 1, 1)
end

local function fireServer(eventName, args)
    local event = game:GetService("ReplicatedStorage"):FindFirstChild("RE")
    if event and event:FindFirstChild(eventName) then
        pcall(function()
            event[eventName]:FireServer(unpack(args))
        end)
    end
end

local SectionRGBName = Tab:AddSection({
    Name = "Name"
})

local nameRGBActive = false
Tab:AddToggle({
    Name = "Name RGB",
    Description = "Make the Name colorful",
    Default = true,
    Callback = function(state)
        nameRGBActive = state
        if state then
            task.spawn(function()
                while nameRGBActive and LocalPlayer.Character do
                    local color = getRainbowColor(rgbSpeed)
                    fireServer("1RPNam1eColo1r", { "PickingRPNameColor", color })
                    task.wait(0.03)
                end
            end)
        end
    end
})


local SectionRGBBio = Tab:AddSection({
    Name = "Bio"
})

local bioRGBActive = false
Tab:AddToggle({
    Name = "Bio RGB",
    Description = "Make the Bio colorful",
    Default = false,
    Callback = function(state)
        bioRGBActive = state
        if state then
            task.spawn(function()
                while bioRGBActive and LocalPlayer.Character do
                    local color = getRainbowColor(rgbSpeed)
                    fireServer("1RPNam1eColo1r", { "PickingRPBioColor", color })
                    task.wait(0.03)
                end
            end)
        end
    end
})

local SectionNames = Tab:AddSection({
    Name = "Custom Names"
})

local names = {
    {"Anonymus", " Anonymus "},
    {"PRO", " PRO "},
    {"ERR0R_666", " ERR0R_666 "},
    {"DARKNE1SSS", " DARKNE1SSS "},
    {"GHOST", " GHOST "},
    {"JOKER", " JOKER "},
    {"ADMIN", " ADMIN "},
    {"TUBERS93", " TUBERS 93 "},
    {"CO0LKID", " CO0 LKID "},
    {"GAME ATTACKED BY S4TURN", " GAME ATTACKED BY S4TURN "},
    {"INC0MUN", " INC0MUN "},
    {"BAD BOY", " BAD BOY "}
}

for _, name in ipairs(names) do
    Tab:AddButton({
        Name = name[1],
        Callback = function()
            game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", name[2])
        end
    })
end

local Tab = Window:MakeTab({"Sound All", "music"})

Tab:AddSection({"Sound All"})

Tab:AddParagraph({"Warn", "Everyone on the servers can hear the sound"})

local audios = {
    {Name = "Yamete Kudasai", ID = 108494476595033},
    {Name = "Gritinho", ID = 5710016194},
    {Name = "Jumpscare Horroroso", ID = 85435253347146},
    {Name = "Áudio Alto", ID = 6855150757},
    {Name = "Ruído", ID = 120034877160791},
    {Name = "Jumpscare 2", ID = 110637995610528},
    {Name = "Risada Da Bruxa Minecraft", ID = 116214940486087},
    {Name = "The Boiled One", ID = 137177653817621},
    {Name = "Deitei Um Ave Maria Doido", ID = 128669424001766},
    {Name = "Mandrake Detected", ID = 9068077052},
    {Name = "Aaaaaaaaa", ID = 80156405968805},
    {Name = "AAAHHHH", ID = 9084006093},
    {Name = "amongus", ID = 6651571134},
    {Name = "Sus", ID = 6701126635},
    {Name = "Gritao AAAAAAAAA", ID = 5853668794},
    {Name = "UHHHHH COFFCOFF", ID = 7056720271},
    {Name = "SUS", ID = 7153419575},
    {Name = "Sonic.exe", ID = 2496367477},
    {Name = "Tubers93 1", ID = 270145703},
    {Name = "Tubers93 2", ID = 18131809532},
    {Name = "John's Laugh", ID = 130759239},
    {Name = "Nao sei KKKK", ID = 6549021381},
    {Name = "Grito", ID = 80156405968805},
    {Name = "audio estranho", ID = 7705506391},
    {Name = "AAAH", ID = 7772283448},
    {Name = "Gay, gay", ID = 18786647417},
    {Name = "Bat Hit", ID = 7129073354},
    {Name = "Nuclear Siren", ID = 675587093},
    {Name = "Sem ideia de nome KK", ID = 7520729342},
    {Name = "Grito 2", ID = 91412024101709},
    {Name = "Estora tímpano", ID = 268116333},
    --{Name = "[ Content Deleted ]", ID = 106835463235574},
    {Name = "Toma Jack", ID = 132603645477541},
    {Name = "Pede ifood pede", ID = 133843750864059},
    {Name = "I Ghost The down", ID = 84663543883498},
    {Name = "Compre OnLine Na shoope", ID = 8747441609},
    {Name = "Meu nome é ???", ID = 7339658122},
    {Name = "FAZ O L!!!!", ID = 94350012510206},
    {Name = "Uh Que Nojo", ID = 103440368630269},
    {Name = "Sai dai Lava Prato", ID = 101232400175829},
    {Name = "Seloko num compensa", ID = 78442476709262},
    --{Name = "Chimpanzini Bananini Funk", ID = 137148228908678},
    --{Name = "Candyland Tobu", ID = 118939739460633},
    {Name = "Meme do Dom pollo What the hell", ID = 100656590080703},
    {Name = "Não to entendendo nada Estourado", ID = 7962533987},
    {Name = "Cachorro Rindo", ID = 8449305114},
}

local selectedAudioID

Tab:AddTextBox({
    Name = "Enter Sound ID",
    PlaceholderText = "Type Here...",
    Callback = function(value)
        selectedAudioID = tonumber(value)
    end
})

local audioNames = {}
for _, audio in ipairs(audios) do
    table.insert(audioNames, audio.Name)
end

Tab:AddDropdown({
    Name = "Select Sound",
    Description = "Choose an audio from the list",
    Options = audioNames,
    Default = audioNames[1],
    Flag = "selected_audio",
    Callback = function(value)
        for _, audio in ipairs(audios) do
            if audio.Name == value then
                selectedAudioID = audio.ID
                break
            end
        end
    end
})

local audioLoop = false

Tab:AddSection({"Loop Sound"})

local function playLoopedAudio()
    while audioLoop do
        if selectedAudioID then
            local args = {
                [1] = game:GetService("Workspace"),
                [2] = selectedAudioID,
                [3] = 1,
            }
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Gu1nSound1s"):FireServer(unpack(args))

            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://" .. selectedAudioID
            sound.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
            sound:Play()
        else
        end

        task.wait(0.5) 
    end
end

Tab:AddToggle({
    Name = "Loop Play Sound",
    Default = false,
    Flag = "audio_loop",
    Callback = function(value)
        audioLoop = value
        if audioLoop then
            task.spawn(playLoopedAudio) 
        end
    end
})

local function playAudio()
    if selectedAudioID then
        local args = {
            [1] = game:GetService("Workspace"),
            [2] = selectedAudioID,
            [3] = 1,
        }
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Gu1nSound1s"):FireServer(unpack(args))

        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://" .. selectedAudioID
        sound.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
        sound:Play()
    else
    end
end

Tab:AddButton({"Play Sound", function()
    playAudio()
end})

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local audioID = 6314880174

local function Audio_All_ClientSide(ID)
    local function CheckFolderAudioAll()
        local FolderAudio = workspace:FindFirstChild("Audio all client")
        if not FolderAudio then
            FolderAudio = Instance.new("Folder")
            FolderAudio.Name = "Audio all client"
            FolderAudio.Parent = workspace
        end
        return FolderAudio
    end

    local function CreateSound(ID)
        if type(ID) ~= "number" then
            return nil
        end

        local Folder_Audio = CheckFolderAudioAll()
        if Folder_Audio then
            local Sound = Instance.new("Sound")
            Sound.SoundId = "rbxassetid://" .. ID
            Sound.Volume = 1
            Sound.Looped = false
            Sound.Parent = Folder_Audio
            Sound:Play()
            task.wait(1) 
            Sound:Destroy()
        end
    end

    CreateSound(ID)
end

local function Audio_All_ServerSide(ID)
    if type(ID) ~= "number" then
        return nil
    end

    local GunSoundEvent = ReplicatedStorage:FindFirstChild("1Gu1nSound1s", true)
    if GunSoundEvent then
        GunSoundEvent:FireServer(workspace, ID, 1)
    end
end

Tab:AddToggle({
    Name = "Blow everyone's ears... lol...",
    Description = "Play burst audio repeatedly for everyone",
    Default = false,
    Flag = "audio_spam",
    Callback = function(value)
        getgenv().Audio_All_loop_fast = value

        while getgenv().Audio_All_loop_fast do
            Audio_All_ServerSide(audioID)
            task.spawn(function()
                Audio_All_ClientSide(audioID)
            end)
            task.wait(0.03) 
        end
    end
})
