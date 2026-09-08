local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- Services
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Global Settings
_G.AimbotEnabled = false
_G.AimbotFOV = 150
_G.CameraFOV = 70
_G.PhysicalRecoil = false
_G.RecoilStrength = 2
_G.RapidFire = false
_G.NoSpread = false
_G.ChamsEnabled = false
_G.NameESP = false
_G.HealthESP = false
_G.DistanceESP = false
_G.Noclip = false
_G.CustomWalkspeed = false
_G.WalkspeedValue = 16
_G.HitboxEnabled = false
_G.HitboxSize = 10
_G.HitboxTransparency = 0.7
_G.DealerESP = false
_G.SafeESP = false
_G.RegisterESP = false
_G.ScrapESP = false
_G.ATMESP = false
_G.InfiniteStamina = false
_G.AutoLockpick = false
_G.InvisEnabled = false
_G.AutoPickupMoney = false

local CurrentTarget = nil
local ESPObjects = {}
local PlayerESPObjects = {}
local UpdateCounter = 0
local HitboxCache = {}

-- Simple CoolDown / Settings for money
local CoolDowns = {
    AutoPickUps = {
        MoneyCooldown = false
    }
}

local Settings = {
    IsDead = false
}

-- Create Window
local Window = Fluent:CreateWindow({
    Title = "R0OBii's Crim Hub",
    SubTitle = "Premium Edition",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.RightControl
})

-- Create Tabs
local Tabs = {
    Combat = Window:AddTab({ Title = "Aimbot", Icon = "crosshair" }),
    GunMods = Window:AddTab({ Title = "Gun Mods", Icon = "gun" }),
    Visuals = Window:AddTab({ Title = "Player ESP", Icon = "eye" }),
    WorldESP = Window:AddTab({ Title = "World ESP", Icon = "map" }),
    Movement = Window:AddTab({ Title = "Movement", Icon = "zap" }),
    Misc = Window:AddTab({ Title = "Misc", Icon = "star" }),
    World = Window:AddTab({ Title = "World", Icon = "globe" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

---------------------------------------------------------------------
-- WALK TELEPORT FUNCTION (ULTRA SAFE - AC BYPASS)
---------------------------------------------------------------------
local function WalkTeleport(targetCFrame)
    local player = Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChild("Humanoid")
    
    if not hrp or not hum then return end
    
    -- Check if shift is held
    local shiftHeld = UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or 
                     UserInputService:IsKeyDown(Enum.KeyCode.RightShift)
    
    if not shiftHeld then
        Fluent:Notify({
            Title = "⚠️ Hold SHIFT!",
            Content = "Hold SHIFT while clicking to bypass anticheat",
            Duration = 5
        })
        return
    end
    
    -- Temporarily disable other features for maximum stealth
    local oldWalkspeed = _G.CustomWalkspeed
    local oldNoclip = _G.Noclip
    _G.CustomWalkspeed = false
    _G.Noclip = false
    
    -- Calculate path waypoints
    local startPos = hrp.Position
    local endPos = targetCFrame.Position
    local distance = (endPos - startPos).Magnitude
    
    -- Create MANY waypoints (every 20 studs for maximum realism)
    local waypointCount = math.max(math.floor(distance / 20), 5)
    local waypoints = {}
    
    for i = 1, waypointCount do
        local alpha = i / waypointCount
        local waypointPos = startPos:Lerp(endPos, alpha)
        -- Add random height variation and slight horizontal offset for natural movement
        local randomOffset = Vector3.new(
            math.random(-2, 2) * 0.5,
            math.sin(i) * 1.5 + math.random(-1, 1) * 0.3,
            math.random(-2, 2) * 0.5
        )
        waypointPos = waypointPos + randomOffset
        table.insert(waypoints, waypointPos)
    end
    
    Fluent:Notify({
        Title = "🚶 Walking Safely...",
        Content = "Ultra-stealth mode (" .. waypointCount .. " waypoints)",
        Duration = 3
    })
    
    -- Move through each waypoint with REALISTIC speed and random pauses
    for i, waypointPos in ipairs(waypoints) do
        -- Calculate time based on REALISTIC walking speed (24 studs/sec - slightly faster than normal)
        local segmentDistance = i == 1 and (waypointPos - startPos).Magnitude
                                 or (waypointPos - waypoints[i-1]).Magnitude
        local baseSpeed = 24 -- Faster walk speed
        local speedVariation = math.random(22, 26) -- Slight speed variation for realism
        local duration = segmentDistance / speedVariation
        
        -- Use Sine easing for smooth, human-like acceleration/deceleration
        local tweenInfo = TweenInfo.new(
            duration,
            Enum.EasingStyle.Sine,
            Enum.EasingDirection.InOut
        )
        
        -- Preserve rotation while moving
        local currentRotation = hrp.CFrame - hrp.CFrame.Position
        local targetCFrameAtWaypoint = CFrame.new(waypointPos) * currentRotation
        
        local tween = TweenService:Create(hrp, tweenInfo, {
            CFrame = targetCFrameAtWaypoint
        })
        
        tween:Play()
        tween.Completed:Wait()
        
        -- Random micro-pauses (simulates natural human movement/hesitation)
        local pauseChance = math.random(1, 100)
        if pauseChance <= 30 then -- 30% chance to pause
            task.wait(math.random(5, 15) / 100) -- 0.05 to 0.15 second pause
        else
            task.wait(0.03) -- Minimum frame delay
        end
        
        -- Occasionally "look around" by adjusting camera (more human-like)
        if i % 5 == 0 then
            local lookOffset = CFrame.Angles(0, math.rad(math.random(-20, 20)), 0)
            hrp.CFrame = hrp.CFrame * lookOffset
            task.wait(0.05)
        end
    end
    
    -- Final position adjustment with smooth landing
    local finalTween = TweenService:Create(hrp, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        CFrame = targetCFrame * CFrame.new(0, 3, 0)
    })
    finalTween:Play()
    finalTween.Completed:Wait()
    
    task.wait(0.2)
    
    -- Reset velocity smoothly
    hrp.AssemblyLinearVelocity = Vector3.zero
    hrp.AssemblyAngularVelocity = Vector3.zero
    
    -- Ensure proper landing state
    if hum then
        hum:ChangeState(Enum.HumanoidStateType.Landed)
    end
    
    -- Restore previous settings
    task.wait(0.5)
    _G.CustomWalkspeed = oldWalkspeed
    _G.Noclip = oldNoclip
    
    Fluent:Notify({
        Title = "✅ Arrived Safely",
        Content = "Teleport complete - AC bypassed",
        Duration = 2
    })
end

---------------------------------------------------------------------
-- PHYSICAL MOUSE PULL-DOWN
---------------------------------------------------------------------
task.spawn(function()
    while task.wait(0.01) do
        if _G.PhysicalRecoil
            and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
            and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
            if mousemoverel then
                mousemoverel(0, _G.RecoilStrength)
            end
        end
    end
end)

---------------------------------------------------------------------
-- RAPID FIRE
---------------------------------------------------------------------
task.spawn(function()
    while task.wait(0.05) do
        if _G.RapidFire and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
            if mouse1click then mouse1click() end
        end
    end
end)

---------------------------------------------------------------------
-- GUN MODS - NO SPREAD
---------------------------------------------------------------------
task.spawn(function()
    while task.wait(1) do
        if _G.NoSpread then
            pcall(function()
                local char = LocalPlayer.Character
                if not char then return end
                for _, v in pairs(char:GetChildren()) do
                    if v:IsA("Tool") and v:FindFirstChild("Stats") then
                        local s = v.Stats
                        if s:FindFirstChild("Spread") then
                            s.Spread.Value = 0
                        end
                        if s:FindFirstChild("Sway") then
                            s.Sway.Value = 0
                        end
                    end
                end
            end)
        end
    end
end)

---------------------------------------------------------------------
-- NOCLIP
---------------------------------------------------------------------
RunService.Stepped:Connect(function()
    if _G.Noclip and LocalPlayer.Character then
        pcall(function()
            for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end)
    end
end)

---------------------------------------------------------------------
-- CUSTOM WALKSPEED
---------------------------------------------------------------------
RunService.Heartbeat:Connect(function()
    if _G.CustomWalkspeed and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        pcall(function()
            local hrp = LocalPlayer.Character.HumanoidRootPart
            local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")

            if humanoid and humanoid.MoveDirection.Magnitude > 0 then
                local speed = _G.WalkspeedValue / 16
                hrp.CFrame = hrp.CFrame + (humanoid.MoveDirection * speed * 0.5)
            end
        end)
    end
end)

---------------------------------------------------------------------
-- HITBOX EXTENDER
---------------------------------------------------------------------
RunService.Heartbeat:Connect(function()
    if _G.HitboxEnabled then
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                pcall(function()
                    local hrp = player.Character:FindFirstChild("HumanoidRootPart")
                    local head = player.Character:FindFirstChild("Head")

                    if hrp and not HitboxCache[player] then
                        hrp.Size = Vector3.new(_G.HitboxSize, _G.HitboxSize, _G.HitboxSize)
                        hrp.Transparency = _G.HitboxTransparency
                        hrp.CanCollide = false
                        hrp.Massless = true
                        HitboxCache[player] = true
                    end

                    if head and not HitboxCache[player.."_head"] then
                        head.Size = Vector3.new(_G.HitboxSize, _G.HitboxSize, _G.HitboxSize)
                        head.Transparency = _G.HitboxTransparency
                        head.CanCollide = false
                        head.Massless = true
                        HitboxCache[player.."_head"] = true
                    end
                end)
            end
        end
    else
        HitboxCache = {}
    end
end)

---------------------------------------------------------------------
-- INFINITE STAMINA
---------------------------------------------------------------------
RunService.Heartbeat:Connect(function()
    if _G.InfiniteStamina and LocalPlayer.Character then
        pcall(function()
            local stamina = LocalPlayer.Character:FindFirstChild("Stamina")
            if stamina and stamina:IsA("NumberValue") then
                stamina.Value = 100
            end
        end)
    end
end)

---------------------------------------------------------------------
-- AUTO LOCKPICK
---------------------------------------------------------------------
local LockpickCooldown = false
task.spawn(function()
    while task.wait(0.5) do
        if _G.AutoLockpick and not LockpickCooldown then
            pcall(function()
                local character = LocalPlayer.Character
                if not character then return end

                local hrp = character:FindFirstChild("HumanoidRootPart")
                if not hrp then return end

                for _, v in pairs(Workspace:GetChildren()) do
                    if v.Name:find("Door") and v:FindFirstChild("ClickDetector") then
                        local doorPart = v:FindFirstChildWhichIsA("BasePart")
                        if doorPart and (doorPart.Position - hrp.Position).Magnitude < 20 then
                            fireclickdetector(v.ClickDetector)
                            LockpickCooldown = true
                            task.wait(1)
                            LockpickCooldown = false
                            break
                        end
                    end
                end
            end)
        end
    end
end)

---------------------------------------------------------------------
-- ESP HELPERS
---------------------------------------------------------------------
local function CreateESP(object, name, color, maxDistance, showDistance)
    if ESPObjects[object] then return end

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP"
    billboard.Adornee = object
    billboard.Size = UDim2.new(0, 100, 0, 30)
    billboard.StudsOffset = Vector3.new(0, 2, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = object

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = color
    label.TextStrokeTransparency = 0.5
    label.TextSize = 14
    label.Text = name
    label.Font = Enum.Font.SourceSansBold
    label.Parent = billboard

    ESPObjects[object] = billboard

    if showDistance then
        task.spawn(function()
            while billboard.Parent and object.Parent do
                local distance = (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                    (LocalPlayer.Character.HumanoidRootPart.Position - object.Position).Magnitude) or math.huge

                if distance > maxDistance then
                    billboard.Enabled = false
                else
                    billboard.Enabled = true
                    label.Text = string.format("%s [%d]", name, math.floor(distance))
                end
                task.wait(1)
            end
        end)
    end
end

local function RemoveESP(object)
    if ESPObjects[object] then
        ESPObjects[object]:Destroy()
        ESPObjects[object] = nil
    end
end

---------------------------------------------------------------------
-- WORLD ESP CACHE + SCAN
---------------------------------------------------------------------
local WorldESPCache = {
    Dealers = {},
    Safes = {},
    Registers = {},
    Scraps = {},
    ATMs = {}
}

local function ScanWorldESP()
    for k in pairs(WorldESPCache) do
        WorldESPCache[k] = {}
    end

    for _, obj in pairs(Workspace:GetDescendants()) do
        -- DEALERS
        if obj:IsA("Model") and obj:FindFirstChild("Humanoid") then
            local lower = obj.Name:lower()
            local isDealer = lower:find("dealer")
                or lower:find("armory")
                or lower:find("gun")
                or obj.Name == "Dealer_1"
                or obj.Name == "Dealer_2"
                or obj.Name == "Dealer_3"

            if isDealer then
                local hrp = obj:FindFirstChild("HumanoidRootPart") or obj:FindFirstChild("Head")
                if hrp then
                    table.insert(WorldESPCache.Dealers, {part = hrp, name = obj.Name})
                end
            end
        end

        -- SAFES
        if obj:IsA("Model") then
            local lower = obj.Name:lower()
            if lower:find("safe") or lower:find("vault") then
                local mainPart = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
                if mainPart then
                    local safeName = obj.Name:find("Big") and "🔐 Big Safe" or "🔒 Safe"
                    table.insert(WorldESPCache.Safes, {part = mainPart, name = safeName})
                end
            end
        end

        -- REGISTERS
        if obj:IsA("Model") and obj.Name:lower():find("register") then
            local mainPart = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
            if mainPart then
                table.insert(WorldESPCache.Registers, {part = mainPart, name = "💵 Register"})
            end
        end

        -- ATMS
        if obj:IsA("Model") and obj.Name:lower():find("atm") then
            local mainPart = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
            if mainPart then
                table.insert(WorldESPCache.ATMs, {part = mainPart, name = "🏧 ATM"})
            end
        end

        -- SCRAPS
        if obj:IsA("BasePart") then
            local lower = obj.Name:lower()
            if lower:find("scrap") or lower:find("pile") then
                table.insert(WorldESPCache.Scraps, {part = obj, name = "🔩 Scrap"})
            end
        end
    end
end

local function UpdateWorldESP()
    -- Dealers
    if _G.DealerESP then
        for _, item in pairs(WorldESPCache.Dealers) do
            if item.part.Parent then
                CreateESP(item.part, "💰 " .. item.name, Color3.fromRGB(255, 215, 0), 1000, true)
            end
        end
    else
        for _, item in pairs(WorldESPCache.Dealers) do
            RemoveESP(item.part)
        end
    end

    -- Safes
    if _G.SafeESP then
        for _, item in pairs(WorldESPCache.Safes) do
            if item.part.Parent then
                CreateESP(item.part, item.name, Color3.fromRGB(0, 255, 0), 800, true)
            end
        end
    else
        for _, item in pairs(WorldESPCache.Safes) do
            RemoveESP(item.part)
        end
    end

    -- Registers
    if _G.RegisterESP then
        for _, item in pairs(WorldESPCache.Registers) do
            if item.part.Parent then
                CreateESP(item.part, item.name, Color3.fromRGB(0, 255, 127), 600, true)
            end
        end
    else
        for _, item in pairs(WorldESPCache.Registers) do
            RemoveESP(item.part)
        end
    end

    -- Scraps
    if _G.ScrapESP then
        for _, item in pairs(WorldESPCache.Scraps) do
            if item.part.Parent then
                CreateESP(item.part, item.name, Color3.fromRGB(255, 165, 0), 500, true)
            end
        end
    else
        for _, item in pairs(WorldESPCache.Scraps) do
            RemoveESP(item.part)
        end
    end

    -- ATMs
    if _G.ATMESP then
        for _, item in pairs(WorldESPCache.ATMs) do
            if item.part.Parent then
                CreateESP(item.part, item.name, Color3.fromRGB(135, 206, 250), 700, true)
            end
        end
    else
        for _, item in pairs(WorldESPCache.ATMs) do
            RemoveESP(item.part)
        end
    end
end

-- Scan on load
task.spawn(function()
    task.wait(5)
    ScanWorldESP()
    Fluent:Notify({
        Title = "World Scan Complete",
        Content = "Found " .. #WorldESPCache.Dealers .. " dealers, " .. #WorldESPCache.Safes .. " safes",
        Duration = 5
    })
end)

---------------------------------------------------------------------
-- PLAYER ESP
---------------------------------------------------------------------
local function CreatePlayerESP(player)
    if not player.Character or PlayerESPObjects[player] then return end

    local char = player.Character
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "PlayerESP"
    billboard.Adornee = hrp
    billboard.Size = UDim2.new(0, 120, 0, 60)
    billboard.StudsOffset = Vector3.new(0, 2, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = hrp

    local nameLabel = Instance.new("TextLabel")
    nameLabel.Name = "NameLabel"
    nameLabel.Size = UDim2.new(1, 0, 0.33, 0)
    nameLabel.Position = UDim2.new(0, 0, 0, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    nameLabel.TextStrokeTransparency = 0
    nameLabel.TextSize = 12
    nameLabel.Font = Enum.Font.SourceSansBold
    nameLabel.Parent = billboard

    local healthLabel = Instance.new("TextLabel")
    healthLabel.Name = "HealthLabel"
    healthLabel.Size = UDim2.new(1, 0, 0.33, 0)
    healthLabel.Position = UDim2.new(0, 0, 0.33, 0)
    healthLabel.BackgroundTransparency = 1
    healthLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
    healthLabel.TextStrokeTransparency = 0
    healthLabel.TextSize = 12
    healthLabel.Font = Enum.Font.SourceSansBold
    healthLabel.Parent = billboard

    local distanceLabel = Instance.new("TextLabel")
    distanceLabel.Name = "DistanceLabel"
    distanceLabel.Size = UDim2.new(1, 0, 0.33, 0)
    distanceLabel.Position = UDim2.new(0, 0, 0.66, 0)
    distanceLabel.BackgroundTransparency = 1
    distanceLabel.TextColor3 = Color3.fromRGB(173, 216, 230)
    distanceLabel.TextStrokeTransparency = 0
    distanceLabel.TextSize = 12
    distanceLabel.Font = Enum.Font.SourceSansBold
    distanceLabel.Parent = billboard

    PlayerESPObjects[player] = {
        Billboard = billboard,
        NameLabel = nameLabel,
        HealthLabel = healthLabel,
        DistanceLabel = distanceLabel
    }
end

local function UpdatePlayerESP()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            if _G.NameESP or _G.HealthESP or _G.DistanceESP then
                if not PlayerESPObjects[player] then
                    CreatePlayerESP(player)
                end

                local esp = PlayerESPObjects[player]
                if esp and esp.Billboard.Parent then
                    local humanoid = player.Character:FindFirstChild("Humanoid")
                    local hrp = player.Character.HumanoidRootPart

                    if _G.NameESP then
                        esp.NameLabel.Visible = true
                        esp.NameLabel.Text = player.Name
                    else
                        esp.NameLabel.Visible = false
                    end

                    if _G.HealthESP and humanoid then
                        esp.HealthLabel.Visible = true
                        local health = math.floor(humanoid.Health)
                        esp.HealthLabel.Text = "HP: " .. health

                        if health > 75 then
                            esp.HealthLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
                        elseif health > 50 then
                            esp.HealthLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
                        elseif health > 25 then
                            esp.HealthLabel.TextColor3 = Color3.fromRGB(255, 165, 0)
                        else
                            esp.HealthLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
                        end
                    else
                        esp.HealthLabel.Visible = false
                    end

                    if _G.DistanceESP and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        esp.DistanceLabel.Visible = true
                        local distance = (LocalPlayer.Character.HumanoidRootPart.Position - hrp.Position).Magnitude
                        esp.DistanceLabel.Text = math.floor(distance) .. " studs"
                    else
                        esp.DistanceLabel.Visible = false
                    end

                    if not _G.NameESP and not _G.HealthESP and not _G.DistanceESP then
                        esp.Billboard.Enabled = false
                    else
                        esp.Billboard.Enabled = true
                    end
                end
            else
                if PlayerESPObjects[player] then
                    PlayerESPObjects[player].Billboard:Destroy()
                    PlayerESPObjects[player] = nil
                end
            end
        end
    end
end

-- Optimized: update every 3rd frame
RunService.RenderStepped:Connect(function()
    UpdateCounter = UpdateCounter + 1
    if UpdateCounter % 3 == 0 then
        UpdatePlayerESP()
    end
end)

Players.PlayerRemoving:Connect(function(player)
    if PlayerESPObjects[player] then
        PlayerESPObjects[player].Billboard:Destroy()
        PlayerESPObjects[player] = nil
    end
end)

---------------------------------------------------------------------
-- INVISIBILITY (simple: high transparency on character)
---------------------------------------------------------------------
local function SetCharacterVisible(state)
    local char = LocalPlayer.Character
    if not char then return end

    for _, v in pairs(char:GetDescendants()) do
        if v:IsA("BasePart") or v:IsA("Decal") then
            if state then
                if v:IsA("BasePart") then
                    v.LocalTransparencyModifier = 0
                else
                    v.Transparency = 0
                end
            else
                if v:IsA("BasePart") then
                    v.LocalTransparencyModifier = 0.9
                else
                    v.Transparency = 0.9
                end
            end
        end
    end
end

task.spawn(function()
    while task.wait(0.1) do
        if _G.InvisEnabled then
            SetCharacterVisible(false)
        else
            SetCharacterVisible(true)
        end
    end
end)

---------------------------------------------------------------------
-- BREDMAKURZ SAFE / REGISTER ESP (from other script)
---------------------------------------------------------------------
local BredMakurzEnabled = false
local BredMakurzConnection

local function formatName(name)
    name = string.gsub(name, "([a-z])([A-Z])", "%1 %2")
    local underscoreIndex = string.find(name, "_")
    if underscoreIndex then
        name = string.sub(name, 1, underscoreIndex - 1)
    end
    return name
end

local function ApplyBredMakurzModification()
    local bredMakurzFolder =
        (Workspace:FindFirstChild("Map") and Workspace.Map:FindFirstChild("BredMakurz"))
        or (Workspace:FindFirstChild("Filter") and Workspace.Filter:FindFirstChild("BredMakurz"))

    if not bredMakurzFolder then return end

    local character = LocalPlayer.Character
    local hrp = character and character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    local playerPosition = hrp.Position

    for _, v in pairs(bredMakurzFolder:GetChildren()) do
        local objectPosition
        if v.PrimaryPart and v.PrimaryPart:IsA("BasePart") then
            objectPosition = v.PrimaryPart.Position
        else
            local part = v:FindFirstChildOfClass("BasePart")
            if part then
                objectPosition = part.Position
            else
                continue
            end
        end

        local distance = (objectPosition - playerPosition).Magnitude
        local existingGui = v:FindFirstChild("Ahh")

        if distance <= 200 then
            if not existingGui then
                local x = Instance.new("BillboardGui", v)
                x.Name = "Ahh"
                x.AlwaysOnTop = true
                x.Size = UDim2.new(8, 0, 4, 0)
                x.MaxDistance = 200

                local textLabel = Instance.new("TextLabel", x)
                textLabel.Size = UDim2.new(1, 0, 1, 0)
                textLabel.BackgroundTransparency = 1
                textLabel.Font = Enum.Font.SourceSansBold
                textLabel.TextScaled = false
                textLabel.TextSize = 15
                textLabel.Text = formatName(v.Name)

                x.Adornee = v

                local values = v:FindFirstChild("Values")
                local brokenValue = values and values:FindFirstChild("Broken")

                if brokenValue then
                    if brokenValue.Value == false then
                        textLabel.TextColor3 = Color3.new(0, 1, 0)
                    else
                        textLabel.TextColor3 = Color3.new(1, 0, 0)
                    end

                    brokenValue:GetPropertyChangedSignal("Value"):Connect(function()
                        if brokenValue.Value == false then
                            textLabel.TextColor3 = Color3.new(0, 1, 0)
                        else
                            textLabel.TextColor3 = Color3.new(1, 0, 0)
                        end
                    end)
                else
                    textLabel.TextColor3 = Color3.new(0, 1, 0)
                end
            end
        elseif existingGui then
            existingGui:Destroy()
        end
    end
end

local function BredMakurzEnable()
    if BredMakurzEnabled then return end
    BredMakurzEnabled = true
    BredMakurzConnection = RunService.Heartbeat:Connect(ApplyBredMakurzModification)
end

local function BredMakurzDisable()
    if not BredMakurzEnabled then return end
    BredMakurzEnabled = false
    if BredMakurzConnection then
        BredMakurzConnection:Disconnect()
        BredMakurzConnection = nil
    end

    local bredMakurzFolder =
        (Workspace:FindFirstChild("Map") and Workspace.Map:FindFirstChild("BredMakurz"))
        or (Workspace:FindFirstChild("Filter") and Workspace.Filter:FindFirstChild("BredMakurz"))

    if bredMakurzFolder then
        for _, v in pairs(bredMakurzFolder:GetChildren()) do
            pcall(function()
                local g = v:FindFirstChild("Ahh")
                if g then g:Destroy() end
            end)
        end
    end
end

---------------------------------------------------------------------
-- AUTO PICKUP MONEY (SpawnedBread + CZDPZUS)
---------------------------------------------------------------------
local AutoPickupMoneyEnabled = false
local AutoPickupMoneyConnection

local function AutoPickupMoneyEnable()
    if AutoPickupMoneyEnabled then return end
    AutoPickupMoneyEnabled = true

    if AutoPickupMoneyConnection then
        AutoPickupMoneyConnection:Disconnect()
        AutoPickupMoneyConnection = nil
    end

    AutoPickupMoneyConnection = RunService.RenderStepped:Connect(function()
        if not AutoPickupMoneyEnabled then return end
        if Settings.IsDead then return end

        local cashFolder = Workspace:FindFirstChild("Filter") and Workspace.Filter:FindFirstChild("SpawnedBread")
        local eventsFolder = ReplicatedStorage:FindFirstChild("Events")
        local remoteEvent = eventsFolder and eventsFolder:FindFirstChild("CZDPZUS")

        if not cashFolder or not remoteEvent then return end

        local player = Players.LocalPlayer
        local character = player and player.Character
        local hrp = character and character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end

        if CoolDowns.AutoPickUps.MoneyCooldown then return end

        local rootPosition = hrp.Position
        for _, v in ipairs(cashFolder:GetChildren()) do
            if (rootPosition - v.Position).Magnitude <= 5 then
                if not CoolDowns.AutoPickUps.MoneyCooldown then
                    CoolDowns.AutoPickUps.MoneyCooldown = true
                    pcall(function()
                        remoteEvent:FireServer(v)
                    end)
                    task.wait(1.1)
                    CoolDowns.AutoPickUps.MoneyCooldown = false
                    break
                end
            end
        end
    end)
end

local function AutoPickupMoneyDisable()
    if not AutoPickupMoneyEnabled then return end
    AutoPickupMoneyEnabled = false
    if AutoPickupMoneyConnection then
        AutoPickupMoneyConnection:Disconnect()
        AutoPickupMoneyConnection = nil
    end
    if CoolDowns and CoolDowns.AutoPickUps then
        CoolDowns.AutoPickUps.MoneyCooldown = false
    end
end

task.spawn(function()
    while task.wait(0.1) do
        if _G.AutoPickupMoney and not AutoPickupMoneyEnabled then
            AutoPickupMoneyEnable()
        elseif not _G.AutoPickupMoney and AutoPickupMoneyEnabled then
            AutoPickupMoneyDisable()
        end
    end
end)

---------------------------------------------------------------------
-- MAIN RENDER LOOP (Aimbot + Chams + FOV)
---------------------------------------------------------------------
RunService.RenderStepped:Connect(function()
    Camera.FieldOfView = _G.CameraFOV

    -- Aimbot
    if _G.AimbotEnabled and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
        if not CurrentTarget then
            local closest = _G.AimbotFOV
            for _, v in pairs(Players:GetPlayers()) do
                if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Head") then
                    local pos, onScreen = Camera:WorldToViewportPoint(v.Character.Head.Position)
                    if onScreen then
                        local dist = (Vector2.new(pos.X, pos.Y) - UserInputService:GetMouseLocation()).Magnitude
                        if dist < closest then
                            closest = dist
                            CurrentTarget = v
                        end
                    end
                end
            end
        end
        if CurrentTarget and CurrentTarget.Character and CurrentTarget.Character:FindFirstChild("Head") then
            if CurrentTarget.Character.Humanoid.Health > 0 then
                Camera.CFrame = CFrame.new(Camera.CFrame.Position, CurrentTarget.Character.Head.Position)
            else
                CurrentTarget = nil
            end
        else
            CurrentTarget = nil
        end
    else
        CurrentTarget = nil
    end

    -- Chams
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local highlight = player.Character:FindFirstChild("EliteHighlight")
            if _G.ChamsEnabled and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
                if not highlight then
                    highlight = Instance.new("Highlight", player.Character)
                    highlight.Name = "EliteHighlight"
                    highlight.FillColor = Color3.fromRGB(255, 255, 0)
                    highlight.FillTransparency = 0.5
                    highlight.OutlineColor = Color3.fromRGB(0, 255, 0)
                    highlight.OutlineTransparency = 0
                end
            elseif highlight then
                highlight:Destroy()
            end
        end
    end
end)

---------------------------------------------------------------------
-- UI: TABS + TOGGLES / SLIDERS
---------------------------------------------------------------------

-- Aimbot Tab
Tabs.Combat:AddToggle("AimbotToggle", {
    Title = "Lock-On Aimbot",
    Description = "Right-click to lock onto targets",
    Default = false,
    Callback = function(v)
        _G.AimbotEnabled = v
    end
})

Tabs.Combat:AddSlider("AimbotFOV", {
    Title = "Aimbot FOV",
    Description = "Target detection radius",
    Default = 150,
    Min = 50,
    Max = 800,
    Rounding = 0,
    Callback = function(v)
        _G.AimbotFOV = v
    end
})

-- Gun Mods Tab
Tabs.GunMods:AddToggle("PhysicalRecoil", {
    Title = "Physical Mouse Pull-Down",
    Description = "Auto compensate for recoil",
    Default = false,
    Callback = function(v)
        _G.PhysicalRecoil = v
    end
})

Tabs.GunMods:AddSlider("RecoilStrength", {
    Title = "Pull Strength",
    Description = "Recoil compensation power",
    Default = 3,
    Min = 1,
    Max = 15,
    Rounding = 0,
    Callback = function(v)
        _G.RecoilStrength = v
    end
})

Tabs.GunMods:AddToggle("RapidFire", {
    Title = "Rapid Fire",
    Description = "Increase fire rate",
    Default = false,
    Callback = function(v)
        _G.RapidFire = v
    end
})

Tabs.GunMods:AddToggle("NoSpread", {
    Title = "No Spread/Sway",
    Description = "Remove weapon inaccuracy",
    Default = false,
    Callback = function(v)
        _G.NoSpread = v
    end
})

-- Player ESP Tab
Tabs.Visuals:AddSlider("CameraFOV", {
    Title = "Camera FOV",
    Description = "Adjust field of view",
    Default = 70,
    Min = 70,
    Max = 250,
    Rounding = 0,
    Callback = function(v)
        _G.CameraFOV = v
    end
})

Tabs.Visuals:AddToggle("ChamsToggle", {
    Title = "Player Chams",
    Description = "Highlight players through walls",
    Default = false,
    Callback = function(v)
        _G.ChamsEnabled = v
    end
})

Tabs.Visuals:AddToggle("NameESP", {
    Title = "Name ESP",
    Description = "Show player names",
    Default = false,
    Callback = function(v)
        _G.NameESP = v
    end
})

Tabs.Visuals:AddToggle("HealthESP", {
    Title = "Health ESP",
    Description = "Show player health",
    Default = false,
    Callback = function(v)
        _G.HealthESP = v
    end
})

Tabs.Visuals:AddToggle("DistanceESP", {
    Title = "Distance ESP",
    Description = "Show distance to players",
    Default = false,
    Callback = function(v)
        _G.DistanceESP = v
    end
})

-- World ESP Tab
Tabs.WorldESP:AddToggle("DealerESP", {
    Title = "Dealer ESP",
    Description = "Show weapon dealers",
    Default = false,
    Callback = function(v)
        _G.DealerESP = v
        UpdateWorldESP()
    end
})

Tabs.WorldESP:AddToggle("SafeESP", {
    Title = "Safe ESP (BredMakurz)",
    Description = "Show safes/registers (green = fine, red = broken)",
    Default = false,
    Callback = function(v)
        _G.SafeESP = v
        if v then
            BredMakurzEnable()
        else
            BredMakurzDisable()
        end
        UpdateWorldESP()
    end
})

Tabs.WorldESP:AddToggle("RegisterESP", {
    Title = "Register ESP",
    Description = "Show cash registers",
    Default = false,
    Callback = function(v)
        _G.RegisterESP = v
        UpdateWorldESP()
    end
})

Tabs.WorldESP:AddToggle("ScrapESP", {
    Title = "Scrap ESP",
    Description = "Show scrap piles",
    Default = false,
    Callback = function(v)
        _G.ScrapESP = v
        UpdateWorldESP()
    end
})

Tabs.WorldESP:AddToggle("ATMESP", {
    Title = "ATM ESP",
    Description = "Show ATMs",
    Default = false,
    Callback = function(v)
        _G.ATMESP = v
        UpdateWorldESP()
    end
})

Tabs.WorldESP:AddButton({
    Title = "Re-Scan World",
    Description = "Refresh ESP detection",
    Callback = function()
        ScanWorldESP()
        UpdateWorldESP()
        Fluent:Notify({
            Title = "Scan Complete",
            Content = "Found " .. #WorldESPCache.Dealers .. " dealers",
            Duration = 3
        })
    end
})

-- Movement Tab
Tabs.Movement:AddToggle("Noclip", {
    Title = "Noclip",
    Description = "Walk through walls",
    Default = false,
    Callback = function(v)
        _G.Noclip = v
    end
})

Tabs.Movement:AddToggle("CustomWalkspeed", {
    Title = "Custom Walkspeed",
    Description = "Modify movement speed",
    Default = false,
    Callback = function(v)
        _G.CustomWalkspeed = v
    end
})

Tabs.Movement:AddSlider("Walkspeed", {
    Title = "Walkspeed Value",
    Description = "Speed multiplier",
    Default = 16,
    Min = 16,
    Max = 150,
    Rounding = 0,
    Callback = function(v)
        _G.WalkspeedValue = v
    end
})

Tabs.Movement:AddToggle("InfiniteStamina", {
    Title = "Infinite Stamina",
    Description = "Never run out of stamina",
    Default = false,
    Callback = function(v)
        _G.InfiniteStamina = v
    end
})

Tabs.Movement:AddToggle("InvisToggle", {
    Title = "Invis (Shadow)",
    Description = "High transparency on your character",
    Default = false,
    Callback = function(v)
        _G.InvisEnabled = v
    end
})

-- Misc Tab
Tabs.Misc:AddToggle("HitboxExtender", {
    Title = "Hitbox Extender",
    Description = "Increase player hitboxes",
    Default = false,
    Callback = function(v)
        _G.HitboxEnabled = v
        if not v then HitboxCache = {} end
    end
})

Tabs.Misc:AddSlider("HitboxSize", {
    Title = "Hitbox Size",
    Description = "Size of extended hitboxes",
    Default = 10,
    Min = 5,
    Max = 30,
    Rounding = 0,
    Callback = function(v)
        _G.HitboxSize = v
        HitboxCache = {}
    end
})

Tabs.Misc:AddSlider("HitboxTransparency", {
    Title = "Hitbox Transparency",
    Description = "Visibility of hitboxes",
    Default = 0.7,
    Min = 0,
    Max = 1,
    Rounding = 1,
    Callback = function(v)
        _G.HitboxTransparency = v
    end
})

Tabs.Misc:AddToggle("AutoLockpick", {
    Title = "Auto Lockpick",
    Description = "Automatically open doors",
    Default = false,
    Callback = function(v)
        _G.AutoLockpick = v
    end
})

Tabs.Misc:AddToggle("AutoPickupMoney", {
    Title = "Auto Pickup Money",
    Description = "Pick up SpawnedBread near you",
    Default = false,
    Callback = function(v)
        _G.AutoPickupMoney = v
    end
})

-- WALK TP SECTION
Tabs.Misc:AddParagraph({
    Title = "🚶 Safe Walk Teleport",
    Content = "⚠️ HOLD SHIFT when clicking to bypass AC!"
})

-- Coordinate Display
local coordLabel = Tabs.Misc:AddParagraph({
    Title = "📍 Your Coordinates",
    Content = "Loading..."
})

spawn(function()
    while true do
        local player = Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local pos = player.Character.HumanoidRootPart.Position
            coordLabel:SetDesc(string.format("X: %.2f, Y: %.2f, Z: %.2f", pos.X, pos.Y, pos.Z))
        end
        task.wait(0.1)
    end
end)

Tabs.Misc:AddButton({
    Title = "Walk TP: Cafe",
    Description = "Simulates walking to Cafe (HOLD SHIFT!)",
    Callback = function()
        WalkTeleport(CFrame.new(-4616.97, 6.00, -281.97))
    end
})

Tabs.Misc:AddButton({
    Title = "Walk TP: Subway",
    Description = "Simulates walking to Subway (HOLD SHIFT!)",
    Callback = function()
        WalkTeleport(CFrame.new(-4600.73, 2.39, -684.50))
    end
})

Tabs.Misc:AddButton({
    Title = "Walk TP: Motel",
    Description = "Simulates walking to Motel (HOLD SHIFT!)",
    Callback = function()
        WalkTeleport(CFrame.new(-4619.04, 5.33, -897.38))
    end
})

Tabs.Misc:AddButton({
    Title = "Walk TP: Tower (Vibin)",
    Description = "Simulates walking to Tower (HOLD SHIFT!)",
    Callback = function()
        WalkTeleport(CFrame.new(-4483.96, 5.33, -787.30))
    end
})

Tabs.Misc:AddButton({
    Title = "Walk TP: Dealer (Vibin)",
    Description = "Simulates walking to Dealer (HOLD SHIFT!)",
    Callback = function()
        WalkTeleport(CFrame.new(-4526.13, 5.33, -842.42))
    end
})

---------------------------------------------------------------------
-- AUTOFARM SYSTEM (From Crimson Script)
---------------------------------------------------------------------
local Autofarm_Enabled = false
local Autofarm_Cooldown = false
local IgnoredSafes = {}
local AutofarmSettings = {
    IsDead = false
}

-- Shadow Mode (Invisibility for Autofarm)
local ShadowActive = false
local ShadowUsable = true

do
    local svc = {
        RS = RunService,
        Players = Players,
        Workspace = Workspace
    }
    
    local P = LocalPlayer
    local Char = P.Character or P.CharacterAdded:Wait()
    local HMND, HRP
    
    local function RefreshCharRefs()
        Char = P.Character
        if Char then
            HRP = Char:FindFirstChild("HumanoidRootPart")
            HMND = Char:FindFirstChildOfClass("Humanoid")
        end
    end
    
    RefreshCharRefs()
    
    local AnimTrack = nil
    local CamoAnim = Instance.new("Animation")
    CamoAnim.AnimationId = "rbxassetid://215384594"
    
    if Char and not Char:FindFirstChild("Torso") then
        ShadowUsable = false
    end
    
    local function CheckGrounded()
        return HMND and HMND:IsDescendantOf(Workspace) and HMND.FloorMaterial ~= Enum.Material.Air
    end
    
    local function LoadAnimTrack()
        if AnimTrack then pcall(function() AnimTrack:Stop() end) AnimTrack = nil end
        if HMND then
            local s, r = pcall(function() return HMND:LoadAnimation(CamoAnim) end)
            if s then AnimTrack = r; AnimTrack.Priority = Enum.AnimationPriority.Action4 end
        end
    end
    
    function DeactivateShadow()
        if not ShadowActive then return end
        ShadowActive = false
        if AnimTrack then pcall(function() AnimTrack:Stop() end) end
        if HMND then Camera.CameraSubject = HMND end
        if Char then
            for _, v in pairs(Char:GetDescendants()) do
                if v:IsA("BasePart") and v.Transparency == 0.5 then v.Transparency = 0 end
            end
        end
    end
    
    function ActivateShadow()
        if ShadowActive or not ShadowUsable then return end
        RefreshCharRefs()
        if not Char or not HMND or not HRP or not Char:FindFirstChild("Torso") then return end
        ShadowActive = true
        Camera.CameraSubject = HRP
        LoadAnimTrack()
    end
    
    local function ShadowStep(dt)
        if not Char or not HMND or not HRP or not HMND:IsDescendantOf(Workspace) or HMND.Health <= 0 then return end
        
        local speed = 12
        if HMND.MoveDirection.Magnitude > 0 then
            HRP.CFrame = HRP.CFrame + (HMND.MoveDirection * speed * dt)
        end
        
        local InitCF = HRP.CFrame
        local InitCamOff = HMND.CameraOffset
        
        local _, yaw = Camera.CFrame:ToOrientation()
        HRP.CFrame = CFrame.new(HRP.CFrame.Position) * CFrame.fromOrientation(0, yaw, 0)
        HRP.CFrame = HRP.CFrame * CFrame.Angles(math.rad(90), 0, 0)
        HMND.CameraOffset = Vector3.new(0, 1.44, 0)
        
        if AnimTrack then
            pcall(function()
                if not AnimTrack.IsPlaying then AnimTrack:Play() end
                AnimTrack:AdjustSpeed(0)
                AnimTrack.TimePosition = 0.3
            end)
        end
        
        RunService.RenderStepped:Wait()
        
        if HMND then HMND.CameraOffset = InitCamOff end
        if HRP then HRP.CFrame = InitCF end
        if AnimTrack then pcall(function() AnimTrack:Stop() end) end
        
        if HRP then
            local look = Camera.CFrame.LookVector
            local flat = Vector3.new(look.X, 0, look.Z).Unit
            if flat.Magnitude > 0.1 then
                HRP.CFrame = CFrame.new(HRP.Position, HRP.Position + flat)
            end
        end
        
        if Char then
            for _, v in pairs(Char:GetDescendants()) do
                if v:IsA("BasePart") and v.Transparency ~= 1 then v.Transparency = 0.5 end
            end
        end
    end
    
    RunService.Heartbeat:Connect(function(dt)
        if not ShadowActive or not ShadowUsable then return end
        ShadowStep(dt)
    end)
    
    P.CharacterAdded:Connect(function()
        if ShadowActive then DeactivateShadow() end
        if AnimTrack then pcall(function() AnimTrack:Stop() end) AnimTrack = nil end
        task.wait()
        RefreshCharRefs()
        if HMND and HMND.RigType ~= Enum.HumanoidRigType.R6 then
            ShadowUsable = false
        else
            ShadowUsable = true
        end
    end)
end

-- Walk to target (USING SAFE WALK TP LOGIC)
local function WalkToTarget(targetPart)
    local char = LocalPlayer.Character
    if not char then return false end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChild("Humanoid")
    
    if not hrp or not hum or not targetPart or not targetPart:IsA("BasePart") then return false end
    
    local startPos = hrp.Position
    local targetCF = targetPart.CFrame
    local endPos = (targetCF + targetCF.LookVector * 3).Position
    local distance = (endPos - startPos).Magnitude
    
    -- Don't walk if too far (over 500 studs)
    if distance > 500 then
        Fluent:Notify({
            Title = "Autofarm",
            Content = "Target too far, skipping...",
            Duration = 2
        })
        return false
    end
    
    -- Create waypoints every 15 studs (more frequent for accuracy)
    local waypointCount = math.max(math.floor(distance / 15), 3)
    local waypoints = {}
    
    for i = 1, waypointCount do
        local alpha = i / waypointCount
        local waypointPos = startPos:Lerp(endPos, alpha)
        -- Add slight random variation
        waypointPos = waypointPos + Vector3.new(
            math.random(-1, 1) * 0.5,
            math.sin(i) * 1.5,
            math.random(-1, 1) * 0.5
        )
        table.insert(waypoints, waypointPos)
    end
    
    -- Move through waypoints
    for i, waypointPos in ipairs(waypoints) do
        if not Autofarm_Enabled then return false end
        
        local segmentDistance = i == 1 and (waypointPos - startPos).Magnitude
                                 or (waypointPos - waypoints[i-1]).Magnitude
        local speedVariation = math.random(20, 24) -- Speed variation
        local duration = segmentDistance / speedVariation
        
        local tweenInfo = TweenInfo.new(
            duration,
            Enum.EasingStyle.Sine,
            Enum.EasingDirection.InOut
        )
        
        local currentRotation = hrp.CFrame - hrp.CFrame.Position
        local targetCFrameAtWaypoint = CFrame.new(waypointPos) * currentRotation
        
        local tween = TweenService:Create(hrp, tweenInfo, {
            CFrame = targetCFrameAtWaypoint
        })
        
        tween:Play()
        tween.Completed:Wait()
        
        -- Random micro-pauses
        if math.random(1, 100) <= 20 then
            task.wait(math.random(5, 10) / 100)
        else
            task.wait(0.03)
        end
        
        -- Occasional look around
        if i % 4 == 0 then
            local lookOffset = CFrame.Angles(0, math.rad(math.random(-15, 15)), 0)
            hrp.CFrame = hrp.CFrame * lookOffset
            task.wait(0.05)
        end
    end
    
    -- Final smooth landing
    local finalTween = TweenService:Create(hrp, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        CFrame = CFrame.new(endPos) * (targetCF - targetCF.Position)
    })
    finalTween:Play()
    finalTween.Completed:Wait()
    
    task.wait(0.3)
    hrp.AssemblyLinearVelocity = Vector3.zero
    hrp.AssemblyAngularVelocity = Vector3.zero
    if hum then hum:ChangeState(Enum.HumanoidStateType.Landed) end
    
    -- Verify we made it
    task.wait(0.5)
    if not hrp or not hrp.Parent then return false end
    local finalDist = (hrp.Position - endPos).Magnitude
    return finalDist < 15 -- Success if within 15 studs
end

-- Check if has crowbar
local function HasTool(toolName)
    return LocalPlayer.Backpack:FindFirstChild(toolName) or 
           (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild(toolName))
end

-- Find nearest safe/register
local function FindNearestTarget()
    local folder = Workspace.Map:FindFirstChild("BredMakurz") or Workspace.Filter:FindFirstChild("BredMakurz")
    if not folder then return nil end
    
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return nil end
    
    local nearest = nil
    local shortest = math.huge
    local playerPos = char.HumanoidRootPart.Position
    
    for _, v in ipairs(folder:GetChildren()) do
        if (v.Name:find("Safe") or v.Name:find("Register")) and not table.find(IgnoredSafes, v) then
            local values = v:FindFirstChild("Values")
            if values then
                local broken = values:FindFirstChild("Broken")
                if broken and not broken.Value then
                    local mainPart = v.PrimaryPart or v:FindFirstChild("MainPart")
                    if mainPart then
                        local dist = (mainPart.Position - playerPos).Magnitude
                        if dist < shortest then
                            shortest = dist
                            nearest = v
                        end
                    end
                end
            end
        end
    end
    
    return nearest
end

-- Find nearest dealer
local function FindNearestDealer()
    local shopz = Workspace.Map:FindFirstChild("Shopz")
    if not shopz then return nil end
    
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return nil end
    
    local nearest = nil
    local shortest = math.huge
    local playerPos = char.HumanoidRootPart.Position
    
    for _, dealer in ipairs(shopz:GetChildren()) do
        local stock = dealer:FindFirstChild("CurrentStocks")
        if stock and stock:FindFirstChild("Crowbar") and stock.Crowbar.Value > 0 then
            local mainPart = dealer:FindFirstChild("MainPart")
            if mainPart then
                local dist = (mainPart.Position - playerPos).Magnitude
                if dist < shortest then
                    shortest = dist
                    nearest = dealer
                end
            end
        end
    end
    
    return nearest
end

-- Open safe (WITH SAFE DELAYS)
local function OpenSafe(safeModel)
    local crowbar = HasTool("Crowbar")
    if not crowbar then return end
    
    local remote1 = ReplicatedStorage.Events:FindFirstChild("XMHH.2")
    local remote2 = ReplicatedStorage.Events:FindFirstChild("XMHH2.2")
    local mainPart = safeModel:FindFirstChild("MainPart")
    
    if not remote1 or not remote2 or not mainPart then return end
    
    -- Wait before starting
    task.wait(1.5)
    
    local startTime = tick()
    local hitCount = 0
    while Autofarm_Enabled and safeModel and safeModel.Parent and safeModel.Values and not safeModel.Values.Broken.Value and (tick() - startTime < 25) do
        local char = LocalPlayer.Character
        if not char then break end
        
        task.wait(0.4) -- Delay between hits
        
        local success, val = pcall(function()
            return remote1:InvokeServer("🍞", tick(), crowbar, "DZDRRRKI", safeModel, "Register")
        end)
        
        if success and val then
            pcall(function()
                remote2:FireServer("🍞", tick(), crowbar, "2389ZFX34", val, false, 
                    char["Right Arm"], mainPart, safeModel, mainPart.Position, mainPart.Position)
            end)
            hitCount = hitCount + 1
        end
        
        -- Longer pause every few hits
        if hitCount % 4 == 0 then
            task.wait(0.8)
        end
    end
    
    task.wait(2)
end

-- Handle respawn
LocalPlayer.CharacterAdded:Connect(function(character)
    if not Autofarm_Enabled then return end
    
    character:WaitForChild("HumanoidRootPart", 5)
    task.wait(3)
    
    Autofarm_Cooldown = false
    IgnoredSafes = {}
    
    if ShadowUsable then
        task.wait(1)
        ActivateShadow()
    end
    
    Fluent:Notify({
        Title = "Autofarm",
        Content = "Respawned, resuming...",
        Duration = 2
    })
end)

-- Main autofarm loop (USING WALK LOGIC)
task.spawn(function()
    while true do
        task.wait(2)
        
        if not Autofarm_Enabled or Autofarm_Cooldown then continue end
        
        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then AutofarmSettings.IsDead = hum.Health <= 0 end
        if not char or not hum or hum.Health <= 0 then 
            task.wait(5)
            continue 
        end
        
        local crowbar = HasTool("Crowbar")
        if not crowbar then
            Fluent:Notify({
                Title = "Autofarm",
                Content = "🛒 Walking to dealer...",
                Duration = 2
            })
            
            local dealer = FindNearestDealer()
            if dealer and dealer.MainPart then
                if WalkToTarget(dealer.MainPart) then -- WALK instead of TP
                    task.wait(1.5)
                    
                    pcall(function()
                        ReplicatedStorage.Events.BYZERSPROTEC:FireServer(true, "shop", dealer.MainPart, "IllegalStore")
                    end)
                    
                    task.wait(1)
                    
                    pcall(function()
                        ReplicatedStorage.Events.SSHPRMTE1:InvokeServer("IllegalStore", "Melees", "Crowbar", dealer.MainPart, nil, true)
                    end)
                    
                    task.wait(20)
                    
                    pcall(function()
                        ReplicatedStorage.Events.BYZERSPROTEC:FireServer(false)
                    end)
                    
                    Fluent:Notify({
                        Title = "Autofarm",
                        Content = "✅ Crowbar purchased",
                        Duration = 2
                    })
                else
                    task.wait(5)
                end
            else
                Fluent:Notify({
                    Title = "Autofarm",
                    Content = "❌ No dealer found",
                    Duration = 3
                })
                task.wait(15)
            end
        else
            local target = FindNearestTarget()
            if target and target.MainPart then
                Fluent:Notify({
                    Title = "Autofarm",
                    Content = "🚶 Walking to " .. target.Name,
                    Duration = 2
                })
                
                if WalkToTarget(target.MainPart) then -- WALK instead of TP
                    -- Equip crowbar
                    if not LocalPlayer.Character:FindFirstChild("Crowbar") then
                        local backpackCrowbar = LocalPlayer.Backpack:FindFirstChild("Crowbar")
                        if backpackCrowbar then
                            task.wait(0.5)
                            pcall(function()
                                LocalPlayer.Character.Humanoid:EquipTool(backpackCrowbar)
                            end)
                            task.wait(1)
                        end
                    end
                    
                    Fluent:Notify({
                        Title = "Autofarm",
                        Content = "🔓 Cracking safe...",
                        Duration = 2
                    })
                    
                    task.wait(1)
                    OpenSafe(target)
                    
                    Fluent:Notify({
                        Title = "Autofarm",
                        Content = "✅ Safe cracked!",
                        Duration = 2
                    })
                    
                    task.wait(2)
                else
                    table.insert(IgnoredSafes, target)
                    Fluent:Notify({
                        Title = "Autofarm",
                        Content = "⚠️ Failed to reach, skipping",
                        Duration = 2
                    })
                    task.wait(1)
                end
            else
                if #IgnoredSafes > 0 then
                    Fluent:Notify({
                        Title = "Autofarm",
                        Content = "🔄 Resetting ignored list...",
                        Duration = 2
                    })
                    IgnoredSafes = {}
                end
                task.wait(15)
            end
        end
    end
end)

-- Autofarm Enable/Disable
local function Autofarm_Enable()
    if Autofarm_Enabled then return end
    Autofarm_Enabled = true
    Autofarm_Cooldown = false
    IgnoredSafes = {}
    
    if ShadowUsable then
        ActivateShadow()
    else
        Fluent:Notify({
            Title = "Warning",
            Content = "⚠️ Shadow mode requires R6. Using visible mode.",
            Duration = 5
        })
    end
    
    Fluent:Notify({
        Title = "Autofarm Started",
        Content = "🤖 Safe cracking with walk navigation",
        Duration = 3
    })
end

local function Autofarm_Disable()
    if not Autofarm_Enabled then return end
    Autofarm_Enabled = false
    Autofarm_Cooldown = true
    DeactivateShadow()
    Fluent:Notify({
        Title = "Autofarm Stopped",
        Content = "❌ Automation disabled",
        Duration = 3
    })
end

-- Add Autofarm Toggle
Tabs.Misc:AddToggle("Autofarm", {
    Title = "Autofarm Safes/Registers",
    Description = "Walks naturally to safes (AC bypass)",
    Default = false,
    Callback = function(v)
        if v then
            Autofarm_Enable()
        else
            Autofarm_Disable()
        end
    end
})