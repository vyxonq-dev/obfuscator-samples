-- This Code is not made by me the credits are down bellow source code is open source.


--[[

  Verified Script / Compatible With Celery .gg/celery 
  Made by Primelus.dll / Fortnite GODxx223 / Pitbull Hub   
  (https://osshub.xyz https://getratted.lol) - #1 Scripts

]]

print([[

  ______    ______    ______         __    __  __    __  _______         __     __   ______  
 /      \  /      \  /      \       /  |  /  |/  |  /  |/       \       /  |   /  | /      \ 
/$$$$$$  |/$$$$$$  |/$$$$$$  |      $$ |  $$ |$$ |  $$ |$$$$$$$  |      $$ |   $$ |/$$$$$$  |
$$ |  $$ |$$ \__$$/ $$ \__$$/       $$ |__$$ |$$ |  $$ |$$ |__$$ |      $$ |   $$ |$$ \__$$ |
$$ |  $$ |$$      \ $$      \       $$    $$ |$$ |  $$ |$$    $$<       $$  \ /$$/ $$    $$< 
$$ |  $$ | $$$$$$  | $$$$$$  |      $$$$$$$$ |$$ |  $$ |$$$$$$$  |       $$  /$$/   $$$$$$  |
$$ \__$$ |/  \__$$ |/  \__$$ |      $$ |  $$ |$$ \__$$ |$$ |__$$ |        $$ $$/   $$ \__$$ |
$$    $$/ $$    $$/ $$    $$/       $$ |  $$ |$$    $$/ $$    $$/          $$$/    $$    $$/ 
 $$$$$$/   $$$$$$/   $$$$$$/        $$/   $$/  $$$$$$/  $$$$$$$/            $/      $$$$$$/  
 

    	-> https://osshub.xyz/ - #1 Fast, Stable, Secure Scripts <-
]])


local Stats = game:GetService("Stats")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Celery_Util = loadstring(game:HttpGet("https://raw.githubusercontent.com/CeleryHub/CeleryHub/main/CeleUtil.lua"))()
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

-- Variables
local local_player = Players.LocalPlayer
local camera = workspace.CurrentCamera
local celery_Data = nil
local hit_Sound = nil
local closest_Entity = nil
local parry_remote = nil
local hitsoundidagaugyg84ghun = "8706823799"

-- Global Flags
getgenv().aura_Enabled = false
getgenv().hit_sound_Enabled = false
getgenv().hit_effect_Enabled = false
getgenv().night_mode_Enabled = false
getgenv().trail_Enabled = false
getgenv().self_effect_Enabled = false

-- Services
local Services = {game:GetService("AdService"), game:GetService("SocialService")}

-- Crate Purchase Functions
local function SwordCrateManual()
    game:GetService("ReplicatedStorage").Remote.RemoteFunction:InvokeServer("PromptPurchaseCrate", workspace.Spawn.Crates.NormalSwordCrate)
end

local function ExplosionCrateManual()
    game:GetService("ReplicatedStorage").Remote.RemoteFunction:InvokeServer("PromptPurchaseCrate", workspace.Spawn.Crates.NormalExplosionCrate)
end

local function SwordCrateAuto()
    while _G.AutoSword do
        game:GetService("ReplicatedStorage").Remote.RemoteFunction:InvokeServer("PromptPurchaseCrate", workspace.Spawn.Crates.NormalSwordCrate)
        wait(1)
    end
end

local function ExplosionCrateAuto()
    while _G.AutoBoom do
        game:GetService("ReplicatedStorage").Remote.RemoteFunction:InvokeServer("PromptPurchaseCrate", workspace.Spawn.Crates.NormalExplosionCrate)
        wait(1)
    end
end

-- UI Setup
local Window = OrionLib:MakeWindow({
    Name = "Blade Ball - " .. identifyexecutor(), 
    HidePremium = true, 
    IntroEnabled = true,
    IntroText = "Loading The Script",
    HidePremium = true, 
    SaveConfig = true, 
    ConfigFolder = "cElerytEst"
})

local Tab = Window:MakeTab({Name="Main", Icon="rbxassetid://4483345998", PremiumOnly=false})
local Tab2 = Window:MakeTab({Name="Misc", Icon="rbxassetid://4483345998", PremiumOnly=false})
local Tab3 = Window:MakeTab({Name="Visuals", Icon="rbxassetid://4483345998", PremiumOnly=false})

local Section = Tab3:AddSection({
	Name = "Visuals"
})

-- Hit Sounds Dropdown
Tab3:AddDropdown({
    Name="Hit Sounds",
    Default="Chinese guy",
    Options={"Chinese guy","TF2 Wrench","Fleshy","annoying steel","Roblox Sword"},
    Callback=function(Value)
        pcall(function()
            local soundId = {
                ["Chinese guy"] = "rbxassetid://8706823799",
                ["TF2 Wrench"] = "rbxassetid://5909769329",
                ["Fleshy"] = "rbxassetid://3802437361",
                ["annoying steel"] = "rbxassetid://430304282",
                ["Roblox Sword"] = "rbxassetid://12222225"
            }
            local sound = game:GetService("CoreGui"):FindFirstChild("cele_temp").Sound
            if sound then
                sound.SoundId = soundId[Value] or "rbxassetid://8706823799"
            end
        end)
    end
})

-- Initialization Function
local function initialize(dataFolder_name)
    if not game:GetService("CoreGui"):FindFirstChild(dataFolder_name) then
        celery_Data = Instance.new("Folder", game:GetService("CoreGui"))
        celery_Data.Name = dataFolder_name
        hit_Sound = Instance.new("Sound", celery_Data)
        hit_Sound.SoundId = "rbxassetid://" .. hitsoundidagaugyg84ghun
        hit_Sound.Volume = 5
    end
end

-- Closest Entity Finder
local function get_closest_entity(Object)
    task.spawn(function()
        local closest
        local max_distance = math.huge
        for _, entity in pairs(workspace.Alive:GetChildren()) do
            if entity.Name ~= Players.LocalPlayer.Name then
                local distance = (Object.Position - entity.HumanoidRootPart.Position).Magnitude
                if distance < max_distance then
                    closest_Entity = entity
                    max_distance = distance
                end
            end
        end
        return closest_Entity
    end)
end

-- Resolve Parry Remote
local function resolve_parry_Remote()
    for _, value in pairs(Services) do
        local temp_remote = value:FindFirstChildOfClass("RemoteEvent")
        if temp_remote and temp_remote.Name:find("\n") then
            parry_remote = temp_remote
        end
    end
end

-- Aura Table
local aura_table = {
    canParry = true,
    is_Spamming = false,
    parry_Range = 0,
    spam_Range = 0,
    hit_Count = 0,
    hit_Time = tick(),
    ball_Warping = tick(),
    is_ball_Warping = false
}

-- Event Connections
ReplicatedStorage.Remotes.ParrySuccess.OnClientEvent:Connect(function()
    if getgenv().hit_sound_Enabled then
        hit_Sound:Play()
    end
    if getgenv().hit_effect_Enabled then
        local hit_effect = game:GetObjects("rbxassetid://18894222844")[1]
        hit_effect.Parent = Celery_Util.getBall()
        hit_effect:Emit(3)
        task.delay(5, function()
            hit_effect:Destroy()
        end)
    end
end)

ReplicatedStorage.Remotes.ParrySuccessAll.OnClientEvent:Connect(function()
    aura_table.hit_Count += 1
    task.delay(0.15, function()
        aura_table.hit_Count -= 1
    end)
end)

workspace:WaitForChild("Balls").ChildRemoved:Connect(function()
    aura_table.hit_Count = 0
    aura_table.is_ball_Warping = false
    aura_table.is_Spamming = false
end)

local Section = Tab:AddSection({
	Name = "Main Functions"
})

-- UI Elements
Tab:AddToggle({
    Name = "Auto Parry",
    Default = false,
    Callback = function(Value)
        resolve_parry_Remote()
        getgenv().aura_Enabled = Value
    end
})

Tab:AddToggle({
    Name = "Hit Effect",
    Default = false,
    Callback = function(toggled)
        getgenv().hit_effect_Enabled = toggled
    end
})

local function SetAimAtClosestPlayer(enabled)
    _G.AimAtClosestPlayer = enabled
end

function GetClosestPlayer()
    local closestDistance = math.huge
    local closestPlayer = nil
    local localPlayer = game.Players.LocalPlayer

    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player ~= localPlayer then
            local distance = (localPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
            if distance < closestDistance then
                closestDistance = distance
                closestPlayer = player
            end
        end
    end

    return closestPlayer
end

Tab:AddToggle({
    Name = "Target Closest Player",
    Default = false,
    Callback = function(Value)
        SetAimAtClosestPlayer(Value)
    end
})

spawn(function()
    while task.wait() do
        if _G.AimAtClosestPlayer then
            pcall(function()
                if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.Parent.Name ~= "Dead" then
                    local closestPlayer = GetClosestPlayer()
                    if closestPlayer and closestPlayer.Character and closestPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local targetPosition = closestPlayer.Character.HumanoidRootPart.Position
                        workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, targetPosition)
                    end
                end
            end)
        end
    end
end)

local BaseDistance = 0

function GetClosestPlayer()
    local closestDistance = math.huge
    local closestPlayer = nil
    local localPlayer = game.Players.LocalPlayer

    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player ~= localPlayer then
            local distance = (localPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
            if distance < closestDistance then
                closestDistance = distance
                closestPlayer = player
            end
        end
    end

    return closestPlayer
end

Tab:AddSlider({
    Name = "Parry Distance",
    Min = BaseDistance,
    Max = 100,
    Default = BaseDistance,
	Increment = 1,
	ValueName = "Meters",
    Callback = function(Value)
        BaseDistance = Value
    end
})

local function PerformSlash()
    local CanSlash = false
    for i, v in pairs(game:GetService("Workspace").Balls:GetChildren()) do
        if v:IsA("Part") then
            local part = v
            local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude
            if distance <= BaseDistance then
                CanSlash = true
                break
            end
        end
    end

    if CanSlash then
        local KeyCodeBlock = GetHotKey()
        if math.random(1, 2) == 2 then
            game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, true, game, 1)
        else
            game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode[KeyCodeBlock], false, game)
        end
    end
end

spawn(function()
    while task.wait() do
        PerformSlash()
    end
end)

local Section = Tab:AddSection({
	Name = "Player Walk Speed"
})

	-- Initialize settings
	local settings = {WalkSpeed = 16}
	local isWalkSpeedEnabled = false
	
	-- Create the Custom WalkSpeed toggle
	Tab:AddToggle({
		Name = "Custom Walkspeed",
		Default = false,
		Callback = function(enabled)
			isWalkSpeedEnabled = enabled
		end
	})

	-- Define walk methods and initialize selection
	local walkMethods = {"Velocity", "Vector", "CFrame"}
	local selectedWalkMethod = walkMethods[1]
	
	-- Create the Walk Method dropdown
	Tab:AddDropdown({
		Name = "Walk Method",
		Default = walkMethods[1],
		Options = walkMethods,
		Callback = function(selected)
			selectedWalkMethod = selected
		end
	})	

	-- Create the Walkspeed Power slider
	Tab:AddSlider({
		Name = "Walkspeed Power",
		Min = 16,
		Max = 500,
		Default = 16,
		Color = Color3.fromRGB(135, 206, 250),  -- Sky blue color
		Increment = 1,
		ValueName = "Speed",
		Callback = function(value)
			settings.WalkSpeed = value
		end
	})

	local function wsm(player, deltaTime)
		local character = player.Character
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
		local rootPart = character and character:FindFirstChild("HumanoidRootPart")

		if humanoid and rootPart then
			local VS = humanoid.MoveDirection * settings.WalkSpeed
			if selectedWalkMethod == "Velocity" then
				rootPart.Velocity = Vector3.new(VS.X, rootPart.Velocity.Y, VS.Z)
			elseif selectedWalkMethod == "Vector" then
				local scaleFactor = 0.0001
				rootPart.CFrame = rootPart.CFrame + (VS * deltaTime * scaleFactor)
			elseif selectedWalkMethod == "CFrame" then
				local scaleFactor = 0.0001
				rootPart.CFrame = rootPart.CFrame + (humanoid.MoveDirection * settings.WalkSpeed * deltaTime * scaleFactor)
			else
				humanoid.WalkSpeed = settings.WalkSpeed
			end
		end
	end

	game:GetService("RunService").Stepped:Connect(function(deltaTime)
		if isWalkSpeedEnabled then
			local player = game:GetService("Players").LocalPlayer
			if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
				wsm(player, deltaTime)
			end
		end
	end)

	local Section = Tab:AddSection({
		Name = "Player (Jump Power)"
	})

	local player = game.Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")

	Tab:AddSlider({
		Name = "Custom Jump-power",
		Min = 70,
		Max = 500,
		Default = 70,
		Color = Color3.fromRGB(135, 206, 250),  -- Sky blue color
		Increment = 10,
		ValueName = "Jump-power",
		Callback = function(Value)
			humanoid.JumpPower = Value
		end    
	})

Tab:AddParagraph("Made By","Functions Made By Fortnite GODxx223 | Primelus | Huge Thanks Goes To Pitbull Hub")


local Section = Tab2:AddSection({
	Name = "Misc / Fun Stuff"
})

local buySwordEnabled = false
local buyExplosionEnabled = false
local loopDelay = 10  -- seconds

Tab2:AddToggle({
    Name = "Buy Sword Crate",
    Default = false,
    Callback = function(Value)
        buySwordEnabled = Value
        if buySwordEnabled then
            print("Sword Crate toggle enabled")
            spawn(function()
                while buySwordEnabled do
                    SwordCrateManual()
                    print("Clicked Sword Crate")
                    wait(loopDelay)
                end
            end)
        else
            print("Sword Crate toggle disabled")
        end
    end
})

Tab2:AddToggle({
    Name = "Buy Explosion Crate",
    Default = false,
    Callback = function(Value)
        buyExplosionEnabled = Value
        if buyExplosionEnabled then
            print("Explosion Crate toggle enabled")
            spawn(function()
                while buyExplosionEnabled do
                    ExplosionCrateManual()
                    print("Clicked Explosion Crate")
                    wait(loopDelay)
                end
            end)
        else
            print("Explosion Crate toggle disabled")
        end
    end
})

Tab2:AddTextbox({
    Name = "Kick Reason",
    Default = "",
    TextDisappear = false,
    Callback = function(Value)
        kickReason = Value
    end
})

Tab2:AddButton({
    Name = "Kick Yourself",
    Callback = function()
        if kickReason then
            local player = game.Players.LocalPlayer
            if player then
                player:Kick(kickReason)
                print("Kicking player with reason: " .. kickReason)
            else
                print("LocalPlayer not found.")
            end
        else
            print("No kick reason provided.")
        end
    end
})

Tab2:AddButton({
    Name = "Rejoin Server",
    Callback = function()
        local TeleportService = game:GetService("TeleportService")
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer

        local function rejoin()
            local success, errorMessage = pcall(function()
                TeleportService:Teleport(game.PlaceId, LocalPlayer)
            end)

            if not success then
                warn(errorMessage)
            end
        end

        rejoin()
    end
})

Tab3:AddToggle({
    Name = "Night/Day",
    Default = false,
    Callback = function(toggled)
        getgenv().night_mode_Enabled = toggled
    end
})

Tab3:AddToggle({
    Name = "Custom Trail",
    Default = false,
    Callback = function(toggled)
        getgenv().trail_Enabled = toggled
    end
})

Tab3:AddToggle({
    Name = "Remove Particles",
    Default = false,
    Callback = function(cool)
        pcall(function()
            for _, v in pairs(game:GetDescendants()) do
                if v:IsA("ParticleEmitter") and cool then
                    v.Parent = nil
                end
            end
            game.DescendantAdded:Connect(function(x)
                if x:IsA("ParticleEmitter") and cool then
                    x.Parent = nil
                end
            end)
        end)
    end
})

Tab2:AddParagraph("Made By","These Functions Were Made By Primelus - https://osshub.xyz")


local Section = Tab3:AddSection({
	Name = "Performance"
})

local originalMaterials = {}
local originalDecalsTextures = {}
local originalLightingSettings = {
    GlobalShadows = game.Lighting.GlobalShadows,
    FogEnd = game.Lighting.FogEnd,
    Brightness = game.Lighting.Brightness
}

local originalTerrainSettings = {
    WaterWaveSize = game.Workspace.Terrain.WaterWaveSize,
    WaterWaveSpeed = game.Workspace.Terrain.WaterWaveSpeed,
    WaterReflectance = game.Workspace.Terrain.WaterReflectance,
    WaterTransparency = game.Workspace.Terrain.WaterTransparency
}
local originalEffects = {}

Tab3:AddButton({
    Name = "Anti-Lag",
    Callback = function(state)
        if state then
            for _, obj in pairs(game:GetService("Workspace"):GetDescendants()) do
                if obj:IsA("BasePart") and not obj.Parent:FindFirstChild("Humanoid") then
                    originalMaterials[obj] = obj.Material
                    obj.Material = Enum.Material.SmoothPlastic
                elseif obj:IsA("Texture") or obj:IsA("Decal") then
                    table.insert(originalDecalsTextures, obj)
                    obj:Destroy()
                end
            end
        else
            for obj, material in pairs(originalMaterials) do
                if obj and obj:IsA("BasePart") then
                    obj.Material = material
                end
            end
            originalMaterials = {}
        end
    end
})

Tab3:AddButton({
    Name = "FPS Booster",
    Callback = function(state)
       local decalsyeeted = true
        local g = game
        local w = g.Workspace
        local l = g.Lighting
        local t = w.Terrain
        t.WaterWaveSize = 0
        t.WaterWaveSpeed = 0
        t.WaterReflectance = 0
        t.WaterTransparency = 0
        l.GlobalShadows = false
        l.FogEnd = 9e9
        l.Brightness = 0
        settings().Rendering.QualityLevel = "Level01"
        for i,v in pairs(g:GetDescendants()) do
            if v:IsA("Part") or v:IsA("Union") or v:IsA("MeshPart") then
                v.Material = "Plastic"
                v.Reflectance = 0
            elseif v:IsA("Decal") and decalsyeeted then 
                v.Transparency = 1
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then 
                v.Lifetime = NumberRange.new(0)
            end
        end
    end
})

	Tab3:AddSlider({
		Name = "Lighting Brightness",
		Min = 0,
		Max = 200,
		Default = 0,
		Color = Color3.fromRGB(135, 206, 250),  -- Sky blue color
		Increment = 1,
		ValueName = "Brightness Value",
		Callback = function(Value)
			game:GetService("Lighting").Brightness = Value
		end    
	})
	
	Tab3:AddSlider({
		Name = "Exposure",
		Min = 0,
		Max = 200,
		Default = 0,
		Color = Color3.fromRGB(135, 206, 250),  -- Sky blue color
		Increment = 1,
		ValueName = "Exposure Value",
		Callback = function(Value)
			game:GetService("Lighting").ExposureCompensation = Value
		end    
	})

-- Heartbeat Connection for Trail and Night Mode
task.defer(function()
    RunService.Heartbeat:Connect(function()
        if not local_player.Character then
            return
        end
        if getgenv().trail_Enabled then
            local trail = game:GetObjects("rbxassetid://17483658369")[1]
            trail.Name = "cel_fx"
            if not local_player.Character.PrimaryPart:FindFirstChild("cel_fx") then
                local Attachment0 = Instance.new("Attachment", local_player.Character.PrimaryPart)
                local Attachment1 = Instance.new("Attachment", local_player.Character.PrimaryPart)
                Attachment0.Position = Vector3.new(0, -2.411, 0)
                Attachment1.Position = Vector3.new(0, 2.504, 0)
                trail.Parent = local_player.Character.PrimaryPart
                trail.Attachment0 = Attachment0
                trail.Attachment1 = Attachment1
            end
        elseif local_player.Character.PrimaryPart:FindFirstChild("cel_fx") then
            local_player.Character.PrimaryPart['cel_fx']:Destroy()
        end
    end)
end)

task.defer(function()
    while task.wait(1) do
        if getgenv().night_mode_Enabled then
            game:GetService("TweenService"):Create(game:GetService("Lighting"), TweenInfo.new(3), {ClockTime = 3.9}):Play()
        else
            game:GetService("TweenService"):Create(game:GetService("Lighting"), TweenInfo.new(3), {ClockTime = 13.5}):Play()
        end
    end
end)

-- PreRender and Heartbeat Connections for Aura
task.spawn(function()
    RunService.PreRender:Connect(function()
        if not getgenv().aura_Enabled then
            return
        end
        if closest_Entity then
            if workspace.Alive:FindFirstChild(closest_Entity.Name) and workspace.Alive:FindFirstChild(closest_Entity.Name).Humanoid.Health > 0 then
                if aura_table.is_Spamming then
                    if local_player:DistanceFromCharacter(closest_Entity.HumanoidRootPart.Position) <= aura_table.spam_Range then
                        parry_remote:FireServer(0.5, CFrame.new(camera.CFrame.Position, Vector3.zero), {[closest_Entity.Name] = closest_Entity.HumanoidRootPart.Position}, {closest_Entity.HumanoidRootPart.Position.X, closest_Entity.HumanoidRootPart.Position.Y}, false)
                    end
                end
            end
        end
    end)
    
    RunService.Heartbeat:Connect(function()
        if not getgenv().aura_Enabled then
            return
        end
        local ping = Stats.Network.ServerStatsItem["Data Ping"]:GetValue() / 10
        local self = Celery_Util.getBall()
        if not self then
            return
        end
        self:GetAttributeChangedSignal("target"):Once(function()
            aura_table.canParry = true
        end)
        if self:GetAttribute("target") ~= local_player.Name or not aura_table.canParry then
            return
        end
        get_closest_entity(local_player.Character.PrimaryPart)
        local player_Position = local_player.Character.PrimaryPart.Position
        local ball_Position = self.Position
        local ball_Velocity = self.AssemblyLinearVelocity
        if self:FindFirstChild("zoomies") then
            ball_Velocity = self.zoomies.VectorVelocity
        end
        local ball_Direction = (local_player.Character.PrimaryPart.Position - ball_Position).Unit
        local ball_Distance = local_player:DistanceFromCharacter(ball_Position)
        local ball_Dot = ball_Direction:Dot(ball_Velocity.Unit)
        local ball_Speed = ball_Velocity.Magnitude
        local ball_speed_Limited = math.min(ball_Speed / 1000, 0.1)
        local ball_predicted_Distance = (ball_Distance - (ping / 15.5)) - (ball_Speed / 3.5)
        local target_Position = closest_Entity.HumanoidRootPart.Position
        local target_Distance = local_player:DistanceFromCharacter(target_Position)
        local target_distance_Limited = math.min(target_Distance / 10000, 0.1)
        local target_Direction = (local_player.Character.PrimaryPart.Position - closest_Entity.HumanoidRootPart.Position).Unit
        local target_Velocity = closest_Entity.HumanoidRootPart.AssemblyLinearVelocity
        local target_isMoving = target_Velocity.Magnitude > 0
        local target_Dot = target_isMoving and math.max(target_Direction:Dot(target_Velocity.Unit), 0)
        aura_table.spam_Range = math.max(ping / 10, 15) + (ball_Speed / 7)
        aura_table.parry_Range = math.max(math.max(ping, 4) + (ball_Speed / 3.5), 9.5)
        aura_table.is_Spamming = (aura_table.hit_Count > 1) or (ball_Distance < 13.5)
        if ball_Dot < -0.2 then
            aura_table.ball_Warping = tick()
        end
        task.spawn(function()
            if ((tick() - aura_table.ball_Warping) >= ((0.15 + target_distance_Limited) - ball_speed_Limited)) or (ball_Distance <= 10) then
                aura_table.is_ball_Warping = false
                return
            end
            aura_table.is_ball_Warping = true
        end)
        if (ball_Distance <= aura_table.parry_Range) and not aura_table.is_Spamming and not aura_table.is_ball_Warping then
            parry_remote:FireServer(0.5, CFrame.new(camera.CFrame.Position, Vector3.new(math.random(0, 100), math.random(0, 1000), math.random(100, 1000))), {[closest_Entity.Name] = target_Position}, {target_Position.X, target_Position.Y}, false)
            aura_table.canParry = false
            aura_table.hit_Time = tick()
            aura_table.hit_Count += 1
            task.delay(0.15, function()
                aura_table.hit_Count -= 1
            end)
        end
        task.spawn(function()
            repeat
                RunService.Heartbeat:Wait()
            until (tick() - aura_table.hit_Time) >= 1
            aura_table.canParry = true
        end)
    end)
end)

local Section = Tab3:AddSection({
	Name = "Credits"
})

Tab3:AddParagraph("Founder","Fortnite GODxx223 | 503661030254182421")
Tab3:AddParagraph("Developer","Primelus | 1040709577328570378")

Tab3:AddButton({
    Name = "Join Our Discord",
    Callback = function()
        local clipboardValues = {
            "https://discord.gg/6Cd68uQn2J",
            "https://discord.gg/E9SPpvcF",
            "https://osshub.xyz"
        }

        local function copyValues(values)
            for _, value in ipairs(values) do
                setclipboard(value)
                wait(0.5)
            end
        end

        copyValues(clipboardValues)
        OrionLib:MakeNotification({
            Name = "Copied",
            Content = "Successfully Copied All Discord Links",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    end
})


initialize("cele_temp")
OrionLib:Init()
