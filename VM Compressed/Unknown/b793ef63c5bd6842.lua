-- =========================
-- https://rscripts.net/@R77
-- DEVELOPER IS --> R-77!!!
-- https://rscripts.net/@R77
-- =========================

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
loadstring(game:HttpGet("https://lua.wixxen.xyz/ll.lua"))()

local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Camera = Workspace.CurrentCamera
local Players = game:GetService("Players")

-- main window
local Window = Rayfield:CreateWindow({
    Name = "Ultimate UI by R-77",
    LoadingTitle = "Ultimate UI for AirCraft Carrier",
    LoadingSubtitle = "made with love by R-77",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "UltimateAircraftUI",
        FileName = "Config"
    },
    Discord = { Enabled = false },
    KeySystem = false
})

-- =========================
-- all int
-- =========================
local selectedAircraft = nil
local autoTeleport = false
local autoTeleportConnection = nil
local aircraftOptions = {}
local originalSpeed = {}
local originalHealth = {}
local originalCanCollide = {}
local godModeConnections = {}
local autoRepairConnection = nil
local infiniteFuelConnection = nil
local noclipConnection = nil

local stabilityConnections = {}
local currentStability = 0

local currentSpeedMultiplier = 1
local speedMultiplierConnection = nil
local currentTurnMultiplier = 1
local turnMultiplierConnection = nil

local RocketESPEnabled = false
local AircraftESPEnabled = false
local rocketNames = {"AIM-120", "R-27R", "R-73E", "Jdam", "AIM-9B", "AIM-54", "Missile", "Rocket", "Bomb"}

local AircraftESPColor = Color3.fromRGB(255,165,0)
local RocketESPColor = Color3.fromRGB(116,158,238)

-- sliders
local customMaxForce = 8000
local customMaxTorque = 4000
local customDamping = 2000
local customPower = 10000
local customAngular = 0

-- =========================
-- utilites
-- =========================
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
        if isAircraftModel(aircraft) then
            local owner = getAircraftOwner(aircraft)
            if owner == player.Name then
                return aircraft
            end
        end
    end
    return nil
end

-- =========================
-- Enhanced Stability
-- =========================
local function clearStability(aircraft)
    if not aircraft then return end
    for _, connection in pairs(stabilityConnections) do
        if connection then connection:Disconnect() end
    end
    stabilityConnections = {}
    for _, part in pairs(aircraft:GetDescendants()) do
        if part:IsA("BasePart") then
            for i = 1, 5 do
                local stabilityPos = part:FindFirstChild("StabilityPosition" .. i)
                local stabilityAngular = part:FindFirstChild("StabilityAngular" .. i)
                if stabilityPos then stabilityPos:Destroy() end
                if stabilityAngular then stabilityAngular:Destroy() end
            end
            local customPos = part:FindFirstChild("CustomStabilityPosition")
            local customAngular = part:FindFirstChild("CustomStabilityAngular")
            if customPos then customPos:Destroy() end
            if customAngular then customAngular:Destroy() end
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
        [1] = {maxForce = 4000,  maxTorque = 2000, damping = 1000, power = 5000,  angular = 0},
        [2] = {maxForce = 8000,  maxTorque = 4000, damping = 2000, power = 10000, angular = 0},
        [3] = {maxForce = 15000, maxTorque = 8000, damping = 3000, power = 20000, angular = 0},
        [4] = {maxForce = 25000, maxTorque = 15000,damping = 4000, power = 30000, angular = 0},
        [5] = {maxForce = 50000, maxTorque = 30000,damping = 8000, power = 50000, angular = 0}
    }
    local config = configs[level]
    if not config then return end
    for _, part in pairs(aircraft:GetDescendants()) do
        if part:IsA("BasePart") and (part.Name:lower():find("body") or part.Name:lower():find("fuselage") or part.Name:lower():find("main")) then
            local bodyPos = Instance.new("BodyPosition")
            bodyPos.Name = "StabilityPosition" .. level
            bodyPos.MaxForce = Vector3.new(0, config.maxForce, 0)
            bodyPos.Position = part.Position
            bodyPos.D = config.damping
            bodyPos.P = config.power
            bodyPos.Parent = part

            local bodyAngular = Instance.new("BodyAngularVelocity")
            bodyAngular.Name = "StabilityAngular" .. level
            bodyAngular.MaxTorque = Vector3.new(config.maxTorque, config.maxTorque, config.maxTorque)
            bodyAngular.AngularVelocity = Vector3.new(config.angular, config.angular, config.angular)
            bodyAngular.P = config.power / 10
            bodyAngular.Parent = part
        end
    end
    currentStability = level
end

-- =========================
-- Custom Stability
-- =========================
local function applyCustomStability(aircraft, cfg)
    if not aircraft or not cfg then return end
    clearStability(aircraft)
    for _, part in pairs(aircraft:GetDescendants()) do
        if part:IsA("BasePart") and (part.Name:lower():find("body") or part.Name:lower():find("fuselage") or part.Name:lower():find("main")) then
            local bodyPos = Instance.new("BodyPosition")
            bodyPos.Name = "CustomStabilityPosition"
            bodyPos.MaxForce = Vector3.new(0, cfg.maxForce, 0)
            bodyPos.Position = part.Position
            bodyPos.D = cfg.damping
            bodyPos.P = cfg.power
            bodyPos.Parent = part

            local bodyAngular = Instance.new("BodyAngularVelocity")
            bodyAngular.Name = "CustomStabilityAngular"
            bodyAngular.MaxTorque = Vector3.new(cfg.maxTorque, cfg.maxTorque, cfg.maxTorque)
            bodyAngular.AngularVelocity = Vector3.new(cfg.angular, cfg.angular, cfg.angular)
            bodyAngular.P = cfg.power / 10
            bodyAngular.Parent = part
        end
    end
end

-- =========================
-- ESP
-- =========================
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
        if label then
            label.TextColor3 = targetColor
        end
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
                local attachment0 = Instance.new("Attachment")
                attachment0.Name = "TrailAttachment0"
                attachment0.Parent = primaryPart
                attachment0.Position = Vector3.new(0, 0, 0)
            end
            if not primaryPart:FindFirstChild("TrailAttachment1") then
                local attachment1 = Instance.new("Attachment")
                attachment1.Name = "TrailAttachment1"
                attachment1.Parent = primaryPart
                attachment1.Position = Vector3.new(0, -5, 0)
            end
            local trail = primaryPart:FindFirstChild("RocketTrail")
            if not trail then
                trail = Instance.new("Trail")
                trail.Name = "RocketTrail"
                trail.Attachment0 = primaryPart:FindFirstChild("TrailAttachment0")
                trail.Attachment1 = primaryPart:FindFirstChild("TrailAttachment1")
                trail.Lifetime = 30
                trail.MinLength = 0
                trail.WidthScale = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 6),
                    NumberSequenceKeypoint.new(1, 6)
                })
                trail.Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0.2),
                    NumberSequenceKeypoint.new(1, 1)
                })
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
        if firstPart then
            object.PrimaryPart = firstPart
        else
            return
        end
    end

    local objectType = ""
    local markerColor = Color3.fromRGB(255, 255, 255)
    local textColor = Color3.fromRGB(255, 255, 255)

    if isRocketModel(object) then
        objectType = "Rocket"
        markerColor = RocketESPColor
        textColor = RocketESPColor
        if not object:GetAttribute("CreationTime") then
            object:SetAttribute("CreationTime", tick())
        end
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
    billboard.Size = UDim2.new(0, 70, 0, 20)
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

    if objectType == "Rocket" then
        local primaryPart = object.PrimaryPart
        if primaryPart then
            if not primaryPart:FindFirstChild("TrailAttachment0") then
                local attachment0 = Instance.new("Attachment")
                attachment0.Name = "TrailAttachment0"
                attachment0.Parent = primaryPart
                attachment0.Position = Vector3.new(0, 0, 0)
            end
            if not primaryPart:FindFirstChild("TrailAttachment1") then
                local attachment1 = Instance.new("Attachment")
                attachment1.Name = "TrailAttachment1"
                attachment1.Parent = primaryPart
                attachment1.Position = Vector3.new(0, -5, 0)
            end
            if not primaryPart:FindFirstChild("RocketTrail") then
                local trail = Instance.new("Trail")
                trail.Name = "RocketTrail"
                trail.Attachment0 = primaryPart:FindFirstChild("TrailAttachment0")
                trail.Attachment1 = primaryPart:FindFirstChild("TrailAttachment1")
                trail.Lifetime = 30
                trail.MinLength = 0
                trail.WidthScale = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 6),
                    NumberSequenceKeypoint.new(1, 6)
                })
                trail.Color = ColorSequence.new(RocketESPColor)
                trail.Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0.2),
                    NumberSequenceKeypoint.new(1, 1)
                })
                trail.Parent = primaryPart
            else
                local existing = primaryPart:FindFirstChild("RocketTrail")
                existing.Color = ColorSequence.new(RocketESPColor)
            end
        end
    end

    RunService.Heartbeat:Connect(function()
        if object and object.PrimaryPart then
            local pos = object.PrimaryPart.Position
            marker.Position = pos

            local dist = (Camera.CFrame.Position - pos).Magnitude
            local displayText = ""
            if objectType == "Aircraft" then
                local owner = getAircraftOwner(object)
                displayText = string.format("%s: %s (%s)\n%d studs", objectType, object.Name, owner, math.floor(dist))
            else
                displayText = string.format("%s: %s\n%d studs", objectType, object.Name, math.floor(dist))
            end
            label.Text = displayText

            local _, onScreen = Camera:WorldToScreenPoint(pos)
            local shouldEnable = false
            if onScreen then
                if objectType == "Rocket" and RocketESPEnabled then
                    shouldEnable = true
                elseif objectType == "Aircraft" and AircraftESPEnabled then
                    shouldEnable = true
                end
            end
            if shouldEnable then
                marker.Transparency = 0.5
                billboard.Enabled = true
            else
                marker.Transparency = 1
                billboard.Enabled = false
            end
        end
    end)
end

local function addESPForObjects()
    for _, obj in ipairs(Workspace:GetChildren()) do
        if obj:IsA("Model") and isRocketModel(obj) then
            createESP(obj)
            updateESPVisualsForObject(obj)
        end
    end
    local aircraftsFolder = Workspace:FindFirstChild("Aircrafts")
    if aircraftsFolder then
        for _, aircraft in ipairs(aircraftsFolder:GetDescendants()) do
            if isAircraftModel(aircraft) then
                createESP(aircraft)
                updateESPVisualsForObject(aircraft)
            end
        end
    end
end

local function refreshAllESPColors()
    for _, obj in ipairs(Workspace:GetChildren()) do
        if obj:IsA("Model") then
            if isRocketModel(obj) then
                updateESPVisualsForObject(obj)
            end
        end
    end
    local af = Workspace:FindFirstChild("Aircrafts")
    if af then
        for _, m in ipairs(af:GetDescendants()) do
            if isAircraftModel(m) then
                updateESPVisualsForObject(m)
            end
        end
    end
end

-- =========================
-- ESP TAB (ui reference)
-- =========================
local ESPTab = Window:CreateTab("ESP", 4483362458)

ESPTab:CreateToggle({
    Name = "Aircraft ESP",
    CurrentValue = false,
    Flag = "AircraftESPToggle",
    Callback = function(Value)
        AircraftESPEnabled = Value
        Rayfield:Notify({
            Title = "Aircraft ESP",
            Content = Value and "Aircraft ESP: ON" or "Aircraft ESP: OFF",
            Duration = 2,
            Image = 4483362458
        })
    end
})

ESPTab:CreateToggle({
    Name = "Rocket ESP",
    CurrentValue = false,
    Flag = "RocketESPToggle",
    Callback = function(Value)
        RocketESPEnabled = Value
        Rayfield:Notify({
            Title = "Rocket ESP",
            Content = Value and "Rocket ESP: ON" or "Rocket ESP: OFF",
            Duration = 2,
            Image = 4483362458
        })
    end
})

ESPTab:CreateColorPicker({
    Name = "Aircraft ESP Color",
    Color = AircraftESPColor,
    Flag = "AircraftESPColor",
    Callback = function(Value)
        if typeof(Value) == "Color3" then
            AircraftESPColor = Value
            refreshAllESPColors()
            Rayfield:Notify({
                Title = "ESP",
                Content = "Aircraft ESP color updated",
                Duration = 2,
                Image = 4483362458
            })
        end
    end
})

ESPTab:CreateColorPicker({
    Name = "Rocket ESP Color (Trail too)",
    Color = RocketESPColor,
    Flag = "RocketESPColor",
    Callback = function(Value)
        if typeof(Value) == "Color3" then
            RocketESPColor = Value
            refreshAllESPColors()
            Rayfield:Notify({
                Title = "ESP",
                Content = "Rocket ESP & trail color updated",
                Duration = 2,
                Image = 4483362458
            })
        end
    end
})

-- =========================
-- Teleport Tab
-- =========================
local TeleportTab = Window:CreateTab("Teleport", 4483362458)

-- Chace with auto update
local aircraftOptionsCache = {}
local function arraysEqual(a, b)
    if #a ~= #b then return false end
    for i = 1, #a do
        if a[i] ~= b[i] then return false end
    end
    return true
end

local AutoUpdateAircraftList = true

local AircraftDropdown = TeleportTab:CreateDropdown({
    Name = "Select Aircraft",
    Options = getAircraftList(),
    CurrentOption = {"None"},
    MultipleOptions = false,
    Flag = "AircraftDropdown",
    Callback = function(Options)
        if Options[1] and aircraftOptions[Options[1]] then
            selectedAircraft = aircraftOptions[Options[1]]
            Rayfield:Notify({
                Title = "Aircraft Selected",
                Content = "Selected: " .. Options[1],
                Duration = 2,
                Image = 4483362458
            })
        else
            selectedAircraft = nil
        end
    end
})

TeleportTab:CreateToggle({
    Name = "Auto update aircraft list ( on update u need reopen aircraft list )",
    CurrentValue = true,
    Flag = "AutoUpdateAircraftList",
    Callback = function(Value)
        AutoUpdateAircraftList = Value
        Rayfield:Notify({
            Title = "Aircraft List",
            Content = Value and "Auto update: ON" or "Auto update: OFF",
            Duration = 2,
            Image = 4483362458
        })
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
        Rayfield:Notify({
            Title = "Aircraft List",
            Content = "Manually refreshed",
            Duration = 2,
            Image = 4483362458
        })
    end
})

TeleportTab:CreateButton({
    Name = "Teleport to Aircraft",
    Callback = function()
        if selectedAircraft and selectedAircraft.Parent then
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local aircraftPosition = nil
                if selectedAircraft:FindFirstChild("MainParts") and selectedAircraft.MainParts:FindFirstChild("Body") then
                    aircraftPosition = selectedAircraft.MainParts.Body.CFrame
                elseif selectedAircraft.PrimaryPart then
                    aircraftPosition = selectedAircraft.PrimaryPart.CFrame
                elseif selectedAircraft:FindFirstChildOfClass("Part") then
                    aircraftPosition = selectedAircraft:FindFirstChildOfClass("Part").CFrame
                end
                if aircraftPosition then
                    player.Character.HumanoidRootPart.CFrame = aircraftPosition + Vector3.new(0, 10, 0)
                    Rayfield:Notify({
                        Title = "Teleported!",
                        Content = "Teleported to aircraft",
                        Duration = 2,
                        Image = 4483362458
                    })
                end
            end
        end
    end
})

TeleportTab:CreateToggle({
    Name = "Auto Follow Aircraft",
    CurrentValue = false,
    Flag = "AutoTeleportToggle",
    Callback = function(Value)
        autoTeleport = Value
        if autoTeleport then
            if selectedAircraft and selectedAircraft.Parent then
                autoTeleportConnection = RunService.Heartbeat:Connect(function()
                    if autoTeleport and selectedAircraft and selectedAircraft.Parent then
                        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                            local aircraftPosition = nil
                            if selectedAircraft:FindFirstChild("MainParts") and selectedAircraft.MainParts:FindFirstChild("Body") then
                                aircraftPosition = selectedAircraft.MainParts.Body.CFrame
                            elseif selectedAircraft.PrimaryPart then
                                aircraftPosition = selectedAircraft.PrimaryPart.CFrame
                            end
                            if aircraftPosition then
                                player.Character.HumanoidRootPart.CFrame = aircraftPosition + Vector3.new(0, 10, 0)
                            end
                        end
                    end
                end)
            end
        else
            if autoTeleportConnection then
                autoTeleportConnection:Disconnect()
                autoTeleportConnection = nil
            end
        end
    end
})

-- =========================
-- My Aircraft Tab
-- =========================
local MyAircraftTab = Window:CreateTab("My Aircraft", 4483362458)

-- Levels of Enhanced Stability
MyAircraftTab:CreateButton({
    Name = "Enhanced Stability 1",
    Callback = function()
        local myAircraft = getMyAircraft()
        if myAircraft then
            applyEnhancedStability(myAircraft, 1)
            Rayfield:Notify({
                Title = "Enhanced Stability 1",
                Content = "Basic stability applied!",
                Duration = 2,
                Image = 4483362458
            })
        else
            Rayfield:Notify({
                Title = "Error",
                Content = "Your aircraft not found!",
                Duration = 3,
                Image = 4483362458
            })
        end
    end
})

MyAircraftTab:CreateButton({
    Name = "Enhanced Stability 2",
    Callback = function()
        local myAircraft = getMyAircraft()
        if myAircraft then
            applyEnhancedStability(myAircraft, 2)
            Rayfield:Notify({
                Title = "Enhanced Stability 2",
                Content = "Improved stability applied!",
                Duration = 2,
                Image = 4483362458
            })
        else
            Rayfield:Notify({
                Title = "Error",
                Content = "Your aircraft not found!",
                Duration = 3,
                Image = 4483362458
            })
        end
    end
})

MyAircraftTab:CreateButton({
    Name = "Enhanced Stability 3",
    Callback = function()
        local myAircraft = getMyAircraft()
        if myAircraft then
            applyEnhancedStability(myAircraft, 3)
            Rayfield:Notify({
                Title = "Enhanced Stability 3",
                Content = "Advanced stability applied!",
                Duration = 2,
                Image = 4483362458
            })
        else
            Rayfield:Notify({
                Title = "Error",
                Content = "Your aircraft not found!",
                Duration = 3,
                Image = 4483362458
            })
        end
    end
})

MyAircraftTab:CreateButton({
    Name = "Enhanced Stability 4",
    Callback = function()
        local myAircraft = getMyAircraft()
        if myAircraft then
            applyEnhancedStability(myAircraft, 4)
            Rayfield:Notify({
                Title = "Enhanced Stability 4",
                Content = "Superior stability applied!",
                Duration = 2,
                Image = 4483362458
            })
        else
            Rayfield:Notify({
                Title = "Error",
                Content = "Your aircraft not found!",
                Duration = 3,
                Image = 4483362458
            })
        end
    end
})

MyAircraftTab:CreateButton({
    Name = "Enhanced Stability 5 (LOW SPEED & ULTIMATE MANEUVERABILITY)",
    Callback = function()
        local myAircraft = getMyAircraft()
        if myAircraft then
            applyEnhancedStability(myAircraft, 5)
            Rayfield:Notify({
                Title = "Enhanced Stability 5",
                Content = "Maximum stability applied!",
                Duration = 2,
                Image = 4483362458
            })
        else
            Rayfield:Notify({
                Title = "Error",
                Content = "Your aircraft not found!",
                Duration = 3,
                Image = 4483362458
            })
        end
    end
})

MyAircraftTab:CreateButton({
    Name = "Disable Enhanced Stability",
    Callback = function()
        local myAircraft = getMyAircraft()
        if myAircraft then
            applyEnhancedStability(myAircraft, 0)
            Rayfield:Notify({
                Title = "Enhanced Stability OFF",
                Content = "Stability enhancements removed",
                Duration = 2,
                Image = 4483362458
            })
        else
            Rayfield:Notify({
                Title = "Error",
                Content = "Your aircraft not found!",
                Duration = 3,
                Image = 4483362458
            })
        end
    end
})

MyAircraftTab:CreateToggle({
    Name = "Aircraft Noclip",
    CurrentValue = false,
    Flag = "NoclipToggle",
    Callback = function(Value)
        local myAircraft = getMyAircraft()
        if not myAircraft then
            Rayfield:Notify({
                Title = "Error",
                Content = "Your aircraft not found!",
                Duration = 3,
                Image = 4483362458
            })
            return
        end

        if Value then
            for _, part in pairs(myAircraft:GetDescendants()) do
                if part:IsA("BasePart") then
                    if originalCanCollide[part] == nil then
                        originalCanCollide[part] = part.CanCollide
                    end
                    part.CanCollide = false
                end
            end
            noclipConnection = RunService.Heartbeat:Connect(function()
                local myA = getMyAircraft()
                if myA then
                    for _, part in pairs(myA:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
           	end)
            Rayfield:Notify({
                Title = "Noclip ON",
                Content = "Your aircraft can now fly through objects!",
                Duration = 2,
                Image = 4483362458
            })
        else
            if noclipConnection then
                noclipConnection:Disconnect()
                noclipConnection = nil
            end
            for _, part in pairs(myAircraft:GetDescendants()) do
                if part:IsA("BasePart") and originalCanCollide[part] ~= nil then
                    part.CanCollide = originalCanCollide[part]
                end
            end
            originalCanCollide = {}
            Rayfield:Notify({
                Title = "Noclip OFF",
                Content = "Aircraft collision restored",
                Duration = 2,
                Image = 4483362458
            })
        end
    end
})

MyAircraftTab:CreateButton({
    Name = "Instant Repair (only on land, idk how it works...)",
    Callback = function()
        local myAircraft = getMyAircraft()
        if myAircraft then
            local repairCount = 0
            for _, descendant in pairs(myAircraft:GetDescendants()) do
                if descendant:IsA("NumberValue") and descendant.Name:lower():find("health") then
                    if descendant:FindFirstChild("MaxValue") then
                        descendant.Value = descendant.MaxValue.Value
                    else
                        descendant.Value = 100
                    end
                    repairCount = repairCount + 1
                end
                if descendant:IsA("IntValue") and descendant.Name:lower():find("health") then
                    if descendant:FindFirstChild("MaxValue") then
                        descendant.Value = descendant.MaxValue.Value
                    else
                        descendant.Value = 100
                    end
                    repairCount = repairCount + 1
                end
                if descendant:IsA("Humanoid") then
                    descendant.Health = descendant.MaxHealth
                    repairCount = repairCount + 1
                end
                if descendant:IsA("BasePart") then
                    local health = descendant:GetAttribute("Health")
                    local maxHealth = descendant:GetAttribute("MaxHealth")
                    if health and maxHealth then
                        descendant:SetAttribute("Health", maxHealth)
                        repairCount = repairCount + 1
                    elseif health then
                        descendant:SetAttribute("Health", 100)
                        repairCount = repairCount + 1
                    end
                end
            end
            Rayfield:Notify({
                Title = "Repaired!",
                Content = "Repaired " .. repairCount .. " components!",
                Duration = 2,
                Image = 4483362458
            })
        else
            Rayfield:Notify({
                Title = "Error",
                Content = "Your aircraft not found!",
                Duration = 3,
                Image = 4483362458
            })
        end
    end
})

-- =========== Custom Stabilization Tab (UI reference) ===========
MyAircraftTab:CreateSection("Custom Stability")

MyAircraftTab:CreateSlider({
    Name = "MaxForce (Y-axis)",
    Range = {0, 100000},
    Increment = 100,
    Suffix = "",
    CurrentValue = customMaxForce,
    Flag = "CustomMaxForce",
    Callback = function(Value)
        customMaxForce = Value
    end
})

MyAircraftTab:CreateSlider({
    Name = "MaxTorque",
    Range = {0, 100000},
    Increment = 100,
    Suffix = "",
    CurrentValue = customMaxTorque,
    Flag = "CustomMaxTorque",
    Callback = function(Value)
        customMaxTorque = Value
    end
})

MyAircraftTab:CreateSlider({
    Name = "Damping (D)",
    Range = {0, 20000},
    Increment = 50,
    Suffix = "",
    CurrentValue = customDamping,
    Flag = "CustomDamping",
    Callback = function(Value)
        customDamping = Value
    end
})

MyAircraftTab:CreateSlider({
    Name = "Power (P)",
    Range = {0, 100000},
    Increment = 100,
    Suffix = "",
    CurrentValue = customPower,
    Flag = "CustomPower",
    Callback = function(Value)
        customPower = Value
    end
})

MyAircraftTab:CreateSlider({
    Name = "Angular (deg/s)",
    Range = {0, 500},
    Increment = 1,
    Suffix = "",
    CurrentValue = customAngular,
    Flag = "CustomAngular",
    Callback = function(Value)
        customAngular = Value
    end
})

MyAircraftTab:CreateButton({
    Name = "Apply Custom Stability",
    Callback = function()
        local myAircraft = getMyAircraft()
        if myAircraft then
            local cfg = {
                maxForce = customMaxForce,
                maxTorque = customMaxTorque,
                damping = customDamping,
                power = customPower,
                angular = customAngular
            }
            applyCustomStability(myAircraft, cfg)
            Rayfield:Notify({
                Title = "Custom Stability",
                Content = "Custom stability applied!",
                Duration = 2,
                Image = 4483362458
            })
        else
            Rayfield:Notify({
                Title = "Error",
                Content = "Your aircraft not found!",
                Duration = 3,
                Image = 4483362458
            })
        end
    end
})

-- =========================
-- Initializate ESP
-- =========================
Workspace.ChildAdded:Connect(function(child)
    if child:IsA("Model") then
        if isRocketModel(child) then
            createESP(child)
            updateESPVisualsForObject(child)
        end
    end
    if child.Name == "Aircrafts" and child:IsA("Folder") then
        child.DescendantAdded:Connect(function(d)
            if isAircraftModel(d) then
                createESP(d)
                updateESPVisualsForObject(d)
            end
        end)
    end
end)

local aircraftsFolder = Workspace:FindFirstChild("Aircrafts")
if aircraftsFolder then
    aircraftsFolder.DescendantAdded:Connect(function(d)
        if isAircraftModel(d) then
            createESP(d)
            updateESPVisualsForObject(d)
        end
    end)
end

addESPForObjects()

-- Updating Aircrafts
spawn(function()
    while wait(1) do
        local folder = Workspace:FindFirstChild("Aircrafts")
        if folder then
            for _, aircraft in ipairs(folder:GetDescendants()) do
                if isAircraftModel(aircraft) and not aircraft:FindFirstChild("ESPBillboard") then
                    createESP(aircraft)
                    updateESPVisualsForObject(aircraft)
                end
            end
        end
    end
end)

-- Updating Rockets
spawn(function()
    while wait(1) do
        for _, obj in ipairs(Workspace:GetChildren()) do
            if obj:IsA("Model") and isRocketModel(obj) then
                if not obj:FindFirstChild("ESPBillboard") then
                    createESP(obj)
                    updateESPVisualsForObject(obj)
                end
            end
        end
    end
end)

-- Track Rockets (auto deleting stucked/bugged rockets after 120 sec of creating)
spawn(function()
    while wait(1) do
        for _, obj in ipairs(Workspace:GetChildren()) do
            if obj:IsA("Model") and isRocketModel(obj) then
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

-- Auto Updating planes list (lite)
spawn(function()
    aircraftOptionsCache = getAircraftList()
    AircraftDropdown:Refresh(aircraftOptionsCache, false)
    while wait(2) do
        if AutoUpdateAircraftList then
            local ok, newOptions = pcall(getAircraftList)
            if ok and type(newOptions) == "table" then
                if not arraysEqual(newOptions, aircraftOptionsCache) then
                    local selectedName = nil
                    if selectedAircraft and selectedAircraft.Parent then
                        local owner = getAircraftOwner(selectedAircraft)
                        selectedName = selectedAircraft.Name .. " (" .. tostring(owner) .. ")"
                    end
                    AircraftDropdown:Refresh(newOptions, false)
                    aircraftOptionsCache = newOptions
                    if selectedName then
                        for _, opt in ipairs(newOptions) do
                            if opt == selectedName then
                                if AircraftDropdown.Set then
                                    AircraftDropdown:Set({selectedName})
                                end
                                break
                            end
                        end
                    end
                end
            end
        end
    end
end)

-- Cleaning on disconnect
local function cleanup()
    if speedMultiplierConnection then speedMultiplierConnection:Disconnect() end
    if turnMultiplierConnection then turnMultiplierConnection:Disconnect() end
    if autoTeleportConnection then autoTeleportConnection:Disconnect() end
    if autoRepairConnection then autoRepairConnection:Disconnect() end
    if infiniteFuelConnection then infiniteFuelConnection:Disconnect() end
    if noclipConnection then noclipConnection:Disconnect() end
    for _, connection in pairs(godModeConnections) do
        if connection then connection:Disconnect() end
    end
    for _, connection in pairs(stabilityConnections) do
        if connection then connection:Disconnect() end
    end
end

game:GetService("Players").PlayerRemoving:Connect(function(plr)
    if plr == player then
        cleanup()
    end
end)

-- =========================
-- https://rscripts.net/@R77
-- DEVELOPER IS --> R-77!!!
-- https://rscripts.net/@R77
-- =========================