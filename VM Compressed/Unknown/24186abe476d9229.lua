-- =================================
-- DEV -- > R-77
-- =================================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "Ultimate UI V2 by R-77",
    Icon = 0,
    LoadingTitle = "Ultimate UI V2",
    LoadingSubtitle = "made with love by R-77",
    ShowText = "made with love by R-77",
    Theme = "Default",
    ToggleUIKeybind = "K",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = { Enabled = true, FolderName = "UltimateUIV2", FileName = "Config" },
    KeySystem = false
})

local player = LocalPlayer
local selectedAircraft = nil
local autoTeleport = false
local autoTeleportConnection = nil
local aircraftOptions = {}
local originalCanCollide = {}
local noclipConnection = nil
local stabilityConnections = {}
local currentStability = 0
local RocketESPEnabled = false
local AircraftESPEnabled = false
local rocketNames = {"AIM-120","R-27R","R-73E","Jdam","AIM-9B","AIM-54","Missile","Rocket","Bomb"}
local AircraftESPColor = Color3.fromRGB(255,165,0)
local RocketESPColor   = Color3.fromRGB(116,158,238)
local customMaxForce  = 8000
local customMaxTorque = 4000
local customPower     = 10000
local customAngular   = 0

local function isRocketModel(obj)
    return obj and obj:IsA("Model") and table.find(rocketNames, obj.Name) ~= nil
end

local function getAircraftOwner(aircraft)
    if aircraft:FindFirstChild("MainParts") and aircraft.MainParts:FindFirstChild("Owner") then
        return aircraft.MainParts.Owner.Value
    end
    return "Unknown"
end

local function isAircraftModel(obj)
    if not (obj and obj:IsA("Model")) then return false end
    if not obj:FindFirstChild("MainParts") then return false end
    local af = Workspace:FindFirstChild("Aircrafts")
    if af and obj:IsDescendantOf(af) then return true end
    return false
end

local function getAircraftList()
    local aircrafts = {}
    local options = {}
    local aircraftsFolder = workspace:FindFirstChild("Aircrafts")
    if not aircraftsFolder then
        aircraftOptions = {}
        return {}
    end
    for _, aircraft in ipairs(aircraftsFolder:GetDescendants()) do
        if isAircraftModel(aircraft) then
            local owner = getAircraftOwner(aircraft)
            local displayName = aircraft.Name .. " (" .. owner .. ")"
            aircrafts[displayName] = aircraft
            table.insert(options, displayName)
        end
    end
    aircraftOptions = aircrafts
    return options
end

local function getMyAircraft()
    local aircraftsFolder = workspace:FindFirstChild("Aircrafts")
    if not aircraftsFolder then return nil end
    for _, aircraft in ipairs(aircraftsFolder:GetDescendants()) do
        if isAircraftModel(aircraft) and getAircraftOwner(aircraft) == player.Name then
            return aircraft
        end
    end
    return nil
end

local function clearStability(aircraft)
    if not aircraft then return end
    for _, connection in pairs(stabilityConnections) do
        if connection then connection:Disconnect() end
    end
    stabilityConnections = {}
    for _, part in pairs(aircraft:GetDescendants()) do
        if part:IsA("BasePart") then
            for i = 1, 5 do
                local sp = part:FindFirstChild("StabilityPosition" .. i)
                local sa = part:FindFirstChild("StabilityAngular" .. i)
                if sp then sp:Destroy() end
                if sa then sa:Destroy() end
            end
            local cp = part:FindFirstChild("CustomStabilityPosition")
            local ca = part:FindFirstChild("CustomStabilityAngular")
            if cp then cp:Destroy() end
            if ca then ca:Destroy() end
        end
    end
end

local function applyEnhancedStability(aircraft, level)
    if not aircraft or currentStability == level then return end
    clearStability(aircraft)
    if level == 0 then
        currentStability = 0
        return
    end
    local configs = {
        [1] = {maxForce=4000,  maxTorque=2000,  power=5000,  angular=0},
        [2] = {maxForce=8000,  maxTorque=4000,  power=10000, angular=0},
        [3] = {maxForce=15000, maxTorque=8000,  power=20000, angular=0},
        [4] = {maxForce=25000, maxTorque=15000, power=30000, angular=0},
        [5] = {maxForce=50000, maxTorque=30000, power=50000, angular=0}
    }
    local cfg = configs[level]
    if not cfg then return end
    for _, part in pairs(aircraft:GetDescendants()) do
        if part:IsA("BasePart") and (part.Name:lower():find("body") or part.Name:lower():find("fuselage") or part.Name:lower():find("main")) then
            local bodyVel = Instance.new("BodyVelocity")
            bodyVel.Name = "StabilityPosition" .. level
            bodyVel.MaxForce = Vector3.new(cfg.maxForce, cfg.maxForce, cfg.maxForce)
            bodyVel.Velocity = part.CFrame.LookVector * (cfg.power / 100)
            bodyVel.Parent = part
            local conn = RunService.Heartbeat:Connect(function()
                if bodyVel.Parent == part then
                    bodyVel.Velocity = part.CFrame.LookVector * (cfg.power / 100)
                end
            end)
            table.insert(stabilityConnections, conn)
            local bodyAngular = Instance.new("BodyAngularVelocity")
            bodyAngular.Name = "StabilityAngular" .. level
            bodyAngular.MaxTorque = Vector3.new(cfg.maxTorque, cfg.maxTorque, cfg.maxTorque)
            bodyAngular.AngularVelocity = Vector3.new(cfg.angular, cfg.angular, cfg.angular)
            bodyAngular.P = math.max(1, cfg.power / 10)
            bodyAngular.Parent = part
        end
    end
    currentStability = level
end

local function applyCustomStability(aircraft, cfg)
    if not aircraft or not cfg then return end
    clearStability(aircraft)
    for _, part in pairs(aircraft:GetDescendants()) do
        if part:IsA("BasePart") and (part.Name:lower():find("body") or part.Name:lower():find("fuselage") or part.Name:lower():find("main")) then
            local bodyVel = Instance.new("BodyVelocity")
            bodyVel.Name = "CustomStabilityPosition"
            bodyVel.MaxForce = Vector3.new(cfg.maxForce, cfg.maxForce, cfg.maxForce)
            bodyVel.Velocity = part.CFrame.LookVector * (cfg.power / 100)
            bodyVel.Parent = part
            local conn = RunService.Heartbeat:Connect(function()
                if bodyVel.Parent == part then
                    bodyVel.Velocity = part.CFrame.LookVector * (cfg.power / 100)
                end
            end)
            table.insert(stabilityConnections, conn)
            local bodyAngular = Instance.new("BodyAngularVelocity")
            bodyAngular.Name = "CustomStabilityAngular"
            bodyAngular.MaxTorque = Vector3.new(cfg.maxTorque, cfg.maxTorque, cfg.maxTorque)
            bodyAngular.AngularVelocity = Vector3.new(cfg.angular, cfg.angular, cfg.angular)
            bodyAngular.P = math.max(1, cfg.power / 10)
            bodyAngular.Parent = part
        end
    end
end

local function updateESPVisualsForObject(object)
    if not object or not object:IsA("Model") then return end
    if not object.PrimaryPart then
        local firstPart = object:FindFirstChildWhichIsA("BasePart")
        if firstPart then object.PrimaryPart = firstPart else return end
    end
    local isRocket = isRocketModel(object)
    local isAircraft = isAircraftModel(object)
    local targetColor = nil
    if isRocket then
        targetColor = RocketESPColor
    elseif isAircraft then
        targetColor = AircraftESPColor
    else
        return
    end
    local billboard = object:FindFirstChild("ESPBillboard")
    if billboard and billboard:IsA("BillboardGui") then
        local label = billboard:FindFirstChildOfClass("TextLabel")
        if label then label.TextColor3 = targetColor end
    end
    local marker = object:FindFirstChild("ESPMarker")
    if not marker or not marker:IsA("BasePart") then
        marker = Instance.new("Part")
        marker.Name = "ESPMarker"
        marker.Size = Vector3.new(3, 3, 3)
        marker.Shape = Enum.PartType.Ball
        marker.Transparency = 0.5
        marker.Anchored = true
        marker.CanCollide = false
        marker.Parent = object
    end
    marker.Color = targetColor
    if isRocket then
        local primaryPart = object.PrimaryPart
        if primaryPart then
            if not primaryPart:FindFirstChild("TrailAttachment0") then
                local a0 = Instance.new("Attachment"); a0.Name = "TrailAttachment0"; a0.Parent = primaryPart
            end
            if not primaryPart:FindFirstChild("TrailAttachment1") then
                local a1 = Instance.new("Attachment"); a1.Name = "TrailAttachment1"; a1.Parent = primaryPart; a1.Position = Vector3.new(0,-5,0)
            end
            local trail = primaryPart:FindFirstChild("RocketTrail")
            if not trail then
                trail = Instance.new("Trail")
                trail.Name = "RocketTrail"
                trail.Attachment0 = primaryPart:FindFirstChild("TrailAttachment0")
                trail.Attachment1 = primaryPart:FindFirstChild("TrailAttachment1")
                trail.Lifetime = 30
                trail.MinLength = 0
                trail.WidthScale = NumberSequence.new({ NumberSequenceKeypoint.new(0,6), NumberSequenceKeypoint.new(1,6) })
                trail.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0,0.2), NumberSequenceKeypoint.new(1,1) })
                trail.Parent = primaryPart
            end
            trail.Color = ColorSequence.new(targetColor)
        end
    end
end

local function createESP(object)
    if not object or not object:IsA("Model") then return end
    if object:FindFirstChild("ESPBillboard") then return end
    if not object.PrimaryPart then
        local firstPart = object:FindFirstChildWhichIsA("BasePart")
        if firstPart then object.PrimaryPart = firstPart else return end
    end
    local objectType = ""
    local markerColor = Color3.new(1,1,1)
    local textColor = Color3.new(1,1,1)
    if isRocketModel(object) then
        objectType = "Rocket"
        markerColor = RocketESPColor
        textColor = RocketESPColor
        if not object:GetAttribute("CreationTime") then object:SetAttribute("CreationTime", tick()) end
    elseif isAircraftModel(object) then
        objectType = "Aircraft"
        markerColor = AircraftESPColor
        textColor = AircraftESPColor
    else
        objectType = object.Name
    end
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESPBillboard"
    billboard.Adornee = object.PrimaryPart
    billboard.Size = UDim2.new(0, 80, 0, 24)
    billboard.StudsOffset = Vector3.new(0, 2, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = object
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = textColor
    label.TextStrokeTransparency = 0.3
    label.TextStrokeColor3 = Color3.new(0, 0, 0)
    label.Font = Enum.Font.GothamBold
    label.TextScaled = false
    label.TextSize = 10
    label.Parent = billboard
    local marker = Instance.new("Part")
    marker.Name = "ESPMarker"
    marker.Size = Vector3.new(3, 3, 3)
    marker.Shape = Enum.PartType.Ball
    marker.Color = markerColor
    marker.Transparency = 0.5
    marker.Anchored = true
    marker.CanCollide = false
    marker.Parent = object
    RunService.Heartbeat:Connect(function()
        if object and object.PrimaryPart then
            local pos = object.PrimaryPart.Position
            marker.Position = pos
            local dist = (Camera.CFrame.Position - pos).Magnitude
            local txt
            if objectType == "Aircraft" then
                txt = string.format("Aircraft: %s (%s)\n%d studs", object.Name, getAircraftOwner(object), math.floor(dist))
            else
                txt = string.format("%s: %s\n%d studs", objectType, object.Name, math.floor(dist))
            end
            label.Text = txt
            local _, onScreen = Camera:WorldToScreenPoint(pos)
            local visible = false
            if onScreen then
                if objectType == "Rocket" and RocketESPEnabled then visible = true
                elseif objectType == "Aircraft" and AircraftESPEnabled then visible = true end
            end
            marker.Transparency = visible and 0.5 or 1
            billboard.Enabled = visible
        end
    end)
end

local function addESPForObjects()
    for _, obj in ipairs(Workspace:GetChildren()) do
        if obj:IsA("Model") and isRocketModel(obj) then
            createESP(obj); updateESPVisualsForObject(obj)
        end
    end
    local aircraftsFolder = Workspace:FindFirstChild("Aircrafts")
    if aircraftsFolder then
        for _, aircraft in ipairs(aircraftsFolder:GetDescendants()) do
            if isAircraftModel(aircraft) then
                createESP(aircraft); updateESPVisualsForObject(aircraft)
            end
        end
    end
end

local function refreshAllESPColors()
    for _, obj in ipairs(Workspace:GetChildren()) do
        if obj:IsA("Model") and (isRocketModel(obj) or isAircraftModel(obj)) then
            updateESPVisualsForObject(obj)
        end
    end
end

local ESPTab = Window:CreateTab("ESP", 4483362458)

ESPTab:CreateToggle({
    Name = "Aircraft ESP",
    CurrentValue = false,
    Flag = "AircraftESPToggle",
    Callback = function(v)
        AircraftESPEnabled = v
        Rayfield:Notify({Title="Aircraft ESP",Content=v and "ON" or "OFF",Duration=2,Image=4483362458})
    end
})

ESPTab:CreateToggle({
    Name = "Rocket ESP",
    CurrentValue = false,
    Flag = "RocketESPToggle",
    Callback = function(v)
        RocketESPEnabled = v
        Rayfield:Notify({Title="Rocket ESP",Content=v and "ON" or "OFF",Duration=2,Image=4483362458})
    end
})

ESPTab:CreateColorPicker({
    Name = "Aircraft ESP Color",
    Color = AircraftESPColor,
    Flag = "AircraftESPColor",
    Callback = function(val)
        if typeof(val) == "Color3" then
            AircraftESPColor = val
            refreshAllESPColors()
            Rayfield:Notify({Title="ESP",Content="Aircraft ESP color updated",Duration=2,Image=4483362458})
        end
    end
})

ESPTab:CreateColorPicker({
    Name = "Rocket ESP Color (Trail too)",
    Color = RocketESPColor,
    Flag = "RocketESPColor",
    Callback = function(val)
        if typeof(val) == "Color3" then
            RocketESPColor = val
            refreshAllESPColors()
            Rayfield:Notify({Title="ESP",Content="Rocket ESP & trail color updated",Duration=2,Image=4483362458})
        end
    end
})

local TeleportTab = Window:CreateTab("Teleport", 4483362458)

local aircraftOptionsCache = {}
local function arraysEqual(a, b)
    if #a ~= #b then return false end
    for i = 1, #a do if a[i] ~= b[i] then return false end end
    return true
end
local AutoUpdateAircraftList = true

local AircraftDropdown = TeleportTab:CreateDropdown({
    Name = "Select Aircraft",
    Options = getAircraftList(),
    CurrentOption = {"None"},
    MultipleOptions = false,
    Flag = "AircraftDropdown",
    Callback = function(opts)
        if opts[1] and aircraftOptions[opts[1]] then
            selectedAircraft = aircraftOptions[opts[1]]
            Rayfield:Notify({Title="Aircraft Selected",Content="Selected: "..opts[1],Duration=2,Image=4483362458})
        else
            selectedAircraft = nil
        end
    end
})

TeleportTab:CreateToggle({
    Name = "Auto update aircraft list (reopen to see changes)",
    CurrentValue = true,
    Flag = "AutoUpdateAircraftList",
    Callback = function(v)
        AutoUpdateAircraftList = v
        Rayfield:Notify({Title="Aircraft List",Content=v and "Auto update: ON" or "Auto update: OFF",Duration=2,Image=4483362458})
    end
})

TeleportTab:CreateButton({
    Name = "Refresh aircraft list now",
    Callback = function()
        local newOptions = getAircraftList()
        if not arraysEqual(newOptions, aircraftOptionsCache) then
            AircraftDropdown:Refresh(newOptions, false)
            aircraftOptionsCache = newOptions
        end
        Rayfield:Notify({Title="Aircraft List",Content="Manually refreshed",Duration=2,Image=4483362458})
    end
})

TeleportTab:CreateButton({
    Name = "Teleport to Aircraft",
    Callback = function()
        if selectedAircraft and selectedAircraft.Parent and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local aircraftPosition
            if selectedAircraft:FindFirstChild("MainParts") and selectedAircraft.MainParts:FindFirstChild("Body") then
                aircraftPosition = selectedAircraft.MainParts.Body.CFrame
            elseif selectedAircraft.PrimaryPart then
                aircraftPosition = selectedAircraft.PrimaryPart.CFrame
            elseif selectedAircraft:FindFirstChildOfClass("Part") then
                aircraftPosition = selectedAircraft:FindFirstChildOfClass("Part").CFrame
            end
            if aircraftPosition then
                player.Character.HumanoidRootPart.CFrame = aircraftPosition + Vector3.new(0,10,0)
                Rayfield:Notify({Title="Teleported!",Content="Teleported to aircraft",Duration=2,Image=4483362458})
            end
        end
    end
})

TeleportTab:CreateToggle({
    Name = "Auto Follow Aircraft",
    CurrentValue = false,
    Flag = "AutoTeleportToggle",
    Callback = function(v)
        autoTeleport = v
        if autoTeleport then
            if selectedAircraft and selectedAircraft.Parent then
                autoTeleportConnection = RunService.Heartbeat:Connect(function()
                    if autoTeleport and selectedAircraft and selectedAircraft.Parent and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        local aircraftPosition
                        if selectedAircraft:FindFirstChild("MainParts") and selectedAircraft.MainParts:FindFirstChild("Body") then
                            aircraftPosition = selectedAircraft.MainParts.Body.CFrame
                        elseif selectedAircraft.PrimaryPart then
                            aircraftPosition = selectedAircraft.PrimaryPart.CFrame
                        end
                        if aircraftPosition then
                            player.Character.HumanoidRootPart.CFrame = aircraftPosition + Vector3.new(0,10,0)
                        end
                    end
                end)
            end
        else
            if autoTeleportConnection then autoTeleportConnection:Disconnect(); autoTeleportConnection = nil end
        end
    end
})

local MyAircraftTab = Window:CreateTab("My Aircraft", 4483362458)

MyAircraftTab:CreateSection("Presets")

MyAircraftTab:CreateButton({
    Name = "Best Engine Power (can fly without fuel/engine)",
    Callback = function()
        local myAircraft = getMyAircraft()
        if myAircraft then
            local cfg = { maxForce=100000, maxTorque=100000, power=100000, angular=0 }
            applyCustomStability(myAircraft, cfg)
            Rayfield:Notify({
                Title = "Preset Applied",
                Content = "Best Engine Power: MaxForce 100k, MaxTorque 100k, Power 100k",
                Duration = 3,
                Image = 4483362458
            })
        else
            Rayfield:Notify({Title="Error",Content="Your aircraft not found!",Duration=3,Image=4483362458})
        end
    end
})

MyAircraftTab:CreateSection("Enhanced Stability (forward thrust)")

local function makeEnh(name, lvl, msg)
    MyAircraftTab:CreateButton({
        Name = name,
        Callback = function()
            local myAircraft = getMyAircraft()
            if myAircraft then
                applyEnhancedStability(myAircraft, lvl)
                Rayfield:Notify({Title=name,Content=msg,Duration=2,Image=4483362458})
            else
                Rayfield:Notify({Title="Error",Content="Your aircraft not found!",Duration=3,Image=4483362458})
            end
        end
    })
end

makeEnh("Enhanced Stability 1", 1, "Basic stability & forward thrust applied!")
makeEnh("Enhanced Stability 2", 2, "Improved stability & forward thrust applied!")
makeEnh("Enhanced Stability 3", 3, "Advanced stability & forward thrust applied!")
makeEnh("Enhanced Stability 4", 4, "Superior stability & forward thrust applied!")
makeEnh("Enhanced Stability 5 (LOW SPEED & ULTIMATE MANEUVERABILITY)", 5, "Maximum stability & forward thrust applied!")

MyAircraftTab:CreateButton({
    Name = "Disable Enhanced Stability",
    Callback = function()
        local myAircraft = getMyAircraft()
        if myAircraft then
            applyEnhancedStability(myAircraft, 0)
            Rayfield:Notify({Title="Enhanced Stability OFF",Content="Stability enhancements removed",Duration=2,Image=4483362458})
        else
            Rayfield:Notify({Title="Error",Content="Your aircraft not found!",Duration=3,Image=4483362458})
        end
    end
})

MyAircraftTab:CreateToggle({
    Name = "Aircraft Noclip",
    CurrentValue = false,
    Flag = "NoclipToggle",
    Callback = function(v)
        local myAircraft = getMyAircraft()
        if not myAircraft then
            Rayfield:Notify({Title="Error",Content="Your aircraft not found!",Duration=3,Image=4483362458})
            return
        end
        if v then
            for _, part in pairs(myAircraft:GetDescendants()) do
                if part:IsA("BasePart") then
                    if originalCanCollide[part] == nil then originalCanCollide[part] = part.CanCollide end
                    part.CanCollide = false
                end
            end
            noclipConnection = RunService.Heartbeat:Connect(function()
                local myA = getMyAircraft()
                if myA then
                    for _, part in pairs(myA:GetDescendants()) do
                        if part:IsA("BasePart") then part.CanCollide = false end
                    end
                end
            end)
            Rayfield:Notify({Title="Noclip ON",Content="Your aircraft can fly through objects!",Duration=2,Image=4483362458})
        else
            if noclipConnection then noclipConnection:Disconnect(); noclipConnection = nil end
            for _, part in pairs(myAircraft:GetDescendants()) do
                if part:IsA("BasePart") and originalCanCollide[part] ~= nil then
                    part.CanCollide = originalCanCollide[part]
                end
            end
            originalCanCollide = {}
            Rayfield:Notify({Title="Noclip OFF",Content="Aircraft collision restored",Duration=2,Image=4483362458})
        end
    end
})

MyAircraftTab:CreateButton({
    Name = "Instant Repair (on land)",
    Callback = function()
        local myAircraft = getMyAircraft()
        if myAircraft then
            local repaired = 0
            for _, d in pairs(myAircraft:GetDescendants()) do
                if d:IsA("NumberValue") and d.Name:lower():find("health") then
                    if d:FindFirstChild("MaxValue") then d.Value = d.MaxValue.Value else d.Value = 100 end
                    repaired += 1
                elseif d:IsA("IntValue") and d.Name:lower():find("health") then
                    if d:FindFirstChild("MaxValue") then d.Value = d.MaxValue.Value else d.Value = 100 end
                    repaired += 1
                elseif d:IsA("Humanoid") then
                    d.Health = d.MaxHealth
                    repaired += 1
                elseif d:IsA("BasePart") then
                    local h = d:GetAttribute("Health")
                    local mh = d:GetAttribute("MaxHealth")
                    if h and mh then d:SetAttribute("Health", mh); repaired += 1
                    elseif h then d:SetAttribute("Health", 100); repaired += 1 end
                end
            end
            Rayfield:Notify({Title="Repaired!",Content=("Repaired %d components!"):format(repaired),Duration=2,Image=4483362458})
        else
            Rayfield:Notify({Title="Error",Content="Your aircraft not found!",Duration=3,Image=4483362458})
        end
    end
})

MyAircraftTab:CreateSection("Custom Stability (forward thrust)")

MyAircraftTab:CreateSlider({
    Name = "MaxForce",
    Range = {0, 100000}, Increment = 100, CurrentValue = customMaxForce, Flag = "CustomMaxForce",
    Callback = function(v) customMaxForce = v end
})
MyAircraftTab:CreateSlider({
    Name = "MaxTorque",
    Range = {0, 100000}, Increment = 100, CurrentValue = customMaxTorque, Flag = "CustomMaxTorque",
    Callback = function(v) customMaxTorque = v end
})
MyAircraftTab:CreateSlider({
    Name = "Power (forward thrust)",
    Range = {0, 100000}, Increment = 100, CurrentValue = customPower, Flag = "CustomPower",
    Callback = function(v) customPower = v end
})
MyAircraftTab:CreateSlider({
    Name = "Angular (deg/s)",
    Range = {0, 500}, Increment = 1, CurrentValue = customAngular, Flag = "CustomAngular",
    Callback = function(v) customAngular = v end
})
MyAircraftTab:CreateButton({
    Name = "Apply Custom Stability",
    Callback = function()
        local myAircraft = getMyAircraft()
        if myAircraft then
            local cfg = { maxForce=customMaxForce, maxTorque=customMaxTorque, power=customPower, angular=customAngular }
            applyCustomStability(myAircraft, cfg)
            Rayfield:Notify({Title="Custom Stability",Content="Custom forward thrust applied!",Duration=2,Image=4483362458})
        else
            Rayfield:Notify({Title="Error",Content="Your aircraft not found!",Duration=3,Image=4483362458})
        end
    end
})

local FlyTab = Window:CreateTab("Fly", "rocket")

do
    FlyTab:CreateSection("VFLY")
    local QEfly = true
    local inputSpeed = 1
    local vehicleflyspeed = 1
    local FLYING = false
    local flyKeyDown, flyKeyUp
    local IYMouse = LocalPlayer:GetMouse()
    local function getRoot(char)
        return char and char:FindFirstChild("HumanoidRootPart")
    end
    local function sFLY()
        repeat task.wait() until Players.LocalPlayer and Players.LocalPlayer.Character and getRoot(Players.LocalPlayer.Character) and Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        repeat task.wait() until IYMouse
        if flyKeyDown then flyKeyDown:Disconnect() end
        if flyKeyUp   then flyKeyUp:Disconnect()   end
        local T = getRoot(Players.LocalPlayer.Character)
        local CONTROL = {F=0,B=0,L=0,R=0,Q=0,E=0}
        local lCONTROL = {F=0,B=0,L=0,R=0,Q=0,E=0}
        local SPEED = 0
        local function FLY()
            FLYING = true
            local BG = Instance.new("BodyGyro")
            local BV = Instance.new("BodyVelocity")
            BG.P = 9e4
            BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
            BG.cframe = T.CFrame
            BG.Parent = T
            BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
            BV.velocity  = Vector3.new(0,0,0)
            BV.Parent = T
            task.spawn(function()
                repeat task.wait()
                    if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
                        SPEED = 50
                    elseif SPEED ~= 0 then
                        SPEED = 0
                    end
                    if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
                        BV.velocity = (
                            (workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B))
                            + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E)*0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)
                        ) * SPEED
                        lCONTROL = {F=CONTROL.F,B=CONTROL.B,L=CONTROL.L,R=CONTROL.R,Q=CONTROL.Q,E=CONTROL.E}
                    elseif SPEED ~= 0 then
                        BV.velocity = (
                            (workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B))
                            + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + lCONTROL.Q + lCONTROL.E)*0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)
                        ) * SPEED
                    else
                        BV.velocity = Vector3.new(0,0,0)
                    end
                    BG.cframe = workspace.CurrentCamera.CoordinateFrame
                until not FLYING
                CONTROL = {F=0,B=0,L=0,R=0,Q=0,E=0}
                lCONTROL = {F=0,B=0,L=0,R=0,Q=0,E=0}
                SPEED = 0
                BG:Destroy()
                BV:Destroy()
                pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Custom end)
            end)
        end
        flyKeyDown = IYMouse.KeyDown:Connect(function(KEY)
            KEY = KEY:lower()
            if KEY == "w" then CONTROL.F = vehicleflyspeed
            elseif KEY == "s" then CONTROL.B = -vehicleflyspeed
            elseif KEY == "a" then CONTROL.L = -vehicleflyspeed
            elseif KEY == "d" then CONTROL.R = vehicleflyspeed
            elseif QEfly and KEY == "e" then CONTROL.Q = vehicleflyspeed * 2
            elseif QEfly and KEY == "q" then CONTROL.E = -vehicleflyspeed * 2 end
            pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Track end)
        end)
        flyKeyUp = IYMouse.KeyUp:Connect(function(KEY)
            KEY = KEY:lower()
            if KEY == "w" then CONTROL.F = 0
            elseif KEY == "s" then CONTROL.B = 0
            elseif KEY == "a" then CONTROL.L = 0
            elseif KEY == "d" then CONTROL.R = 0
            elseif KEY == "e" then CONTROL.Q = 0
            elseif KEY == "q" then CONTROL.E = 0 end
        end)
        FLY()
    end
    local function NOFLY()
        FLYING = false
        if flyKeyDown then flyKeyDown:Disconnect() end
        if flyKeyUp   then flyKeyUp:Disconnect()   end
        pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Custom end)
    end
    local vehicleToggle
    vehicleToggle = FlyTab:CreateToggle({
        Name = "Vehicle Fly — ON/OFF",
        CurrentValue = false,
        Flag = "FE_VFLY_Toggle",
        Callback = function(state)
            if state then
                vehicleflyspeed = inputSpeed
                sFLY()
                Rayfield:Notify({Title="Vehicle Fly",Content="ON (speed x"..tostring(vehicleflyspeed)..") — W/A/S/D, Q/E vertical",Duration=4})
            else
                NOFLY()
                Rayfield:Notify({Title="Vehicle Fly",Content="OFF",Duration=3})
            end
            if Rayfield and Rayfield.SaveConfiguration then pcall(function() Rayfield:SaveConfiguration() end) end
        end
    })
    FlyTab:CreateInput({
        Name = "Set VFLY Speed (×)",
        PlaceholderText = "e.g., 1, 2.5, 10",
        RemoveTextAfterFocusLost = false,
        NumbersOnly = true,
        OnEnter = true,
        Flag = "FE_VFLY_SpeedInput",
        Callback = function(text)
            local n = tonumber(text)
            if n and n > 0 then
                inputSpeed = n
                Rayfield:Notify({Title="VFLY Speed (pending)",Content="Will apply on next VFLY toggle: x"..tostring(inputSpeed),Duration=4})
                if Rayfield and Rayfield.SaveConfiguration then pcall(function() Rayfield:SaveConfiguration() end) end
            else
                Rayfield:Notify({Title="Error",Content="Enter a positive number (e.g., 1.5)",Duration=4})
            end
        end
    })
    FlyTab:CreateKeybind({
        Name = "Toggle VFLY",
        CurrentKeybind = "Z",
        HoldToInteract = false,
        Flag = "FE_VFLY_Bind",
        Callback = function()
            vehicleToggle:Set(not vehicleToggle.CurrentValue)
            if Rayfield and Rayfield.SaveConfiguration then pcall(function() Rayfield:SaveConfiguration() end) end
        end
    })
    FlyTab:CreateParagraph({Title = "Note", Content = "Speed is applied only when VFLY is toggled ON."})
end

local GuiTab = Window:CreateTab("GUI", "settings")
GuiTab:CreateSection("Interface")
GuiTab:CreateButton({
    Name = "Destroy this GUI",
    Callback = function()
        if Rayfield and Rayfield.SaveConfiguration then pcall(function() Rayfield:SaveConfiguration() end) end
        Rayfield:Destroy()
    end
})
if Rayfield and Rayfield.LoadConfiguration then
    pcall(function() Rayfield:LoadConfiguration() end)
end

Workspace.ChildAdded:Connect(function(child)
    if child:IsA("Model") and isRocketModel(child) then
        createESP(child); updateESPVisualsForObject(child)
    end
    if child.Name == "Aircrafts" and child:IsA("Folder") then
        child.DescendantAdded:Connect(function(d)
            if isAircraftModel(d) then
                createESP(d); updateESPVisualsForObject(d)
            end
        end)
    end
end)

local aircraftsFolder = Workspace:FindFirstChild("Aircrafts")
if aircraftsFolder then
    aircraftsFolder.DescendantAdded:Connect(function(d)
        if isAircraftModel(d) then
            createESP(d); updateESPVisualsForObject(d)
        end
    end)
end

addESPForObjects()

task.spawn(function()
    while task.wait(1) do
        local folder = Workspace:FindFirstChild("Aircrafts")
        if folder then
            for _, aircraft in ipairs(folder:GetDescendants()) do
                if isAircraftModel(aircraft) and not aircraft:FindFirstChild("ESPBillboard") then
                    createESP(aircraft); updateESPVisualsForObject(aircraft)
                end
            end
        end
    end
end)

task.spawn(function()
    while task.wait(1) do
        for _, obj in ipairs(Workspace:GetChildren()) do
            if obj:IsA("Model") and isRocketModel(obj) then
                if not obj:FindFirstChild("ESPBillboard") then
                    createESP(obj); updateESPVisualsForObject(obj)
                end
                local creationTime = obj:GetAttribute("CreationTime")
                if not creationTime then
                    obj:SetAttribute("CreationTime", tick())
                elseif tick() - creationTime >= 120 then
                    obj:Destroy()
                end
            end
        end
    end
end)

task.spawn(function()
    aircraftOptionsCache = getAircraftList()
    AircraftDropdown:Refresh(aircraftOptionsCache, false)
    while task.wait(2) do
        if AutoUpdateAircraftList then
            local ok, newOptions = pcall(getAircraftList)
            if ok and type(newOptions) == "table" then
                if not arraysEqual(newOptions, aircraftOptionsCache) then
                    local selectedName
                    if selectedAircraft and selectedAircraft.Parent then
                        local owner = getAircraftOwner(selectedAircraft)
                        selectedName = selectedAircraft.Name .. " (" .. tostring(owner) .. ")"
                    end
                    AircraftDropdown:Refresh(newOptions, false)
                    aircraftOptionsCache = newOptions
                    if selectedName then
                        for _, opt in ipairs(newOptions) do
                            if opt == selectedName and AircraftDropdown.Set then
                                AircraftDropdown:Set({selectedName}); break
                            end
                        end
                    end
                end
            end
        end
    end
end)

local function cleanup()
    if autoTeleportConnection then autoTeleportConnection:Disconnect() end
    if noclipConnection then noclipConnection:Disconnect() end
    for _, connection in pairs(stabilityConnections) do
        if connection then connection:Disconnect() end
    end
end

Players.PlayerRemoving:Connect(function(plr)
    if plr == player then cleanup() end
end)
-- =================================
-- DEV -- > R-77
-- =================================