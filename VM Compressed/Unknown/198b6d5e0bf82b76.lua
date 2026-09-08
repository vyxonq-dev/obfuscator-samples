-- =================================
-- DEV -- > R-77
-- =================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "Aircraft Carrier Exploits by R-77",
    Icon = 0,
    LoadingTitle = "Aircraft Carrie Exploits",
    LoadingSubtitle = "By R-77",
    ShowText = "RayField",
    Theme = "Default",
    ToggleUIKeybind = "K",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = { Enabled = true, FolderName = "R-77", FileName = "AC_EXPLOITMASTER" },
    KeySystem = false
})

local EngineTab = Window:CreateTab("Engine exploit", 4483362458)

do
    local player = LocalPlayer
    local Camera = Workspace.CurrentCamera

    local engineMultiplier = 10
    local isEngineBoostActive = false
    local originalEngineValues = {}
    local engineBoostConnection = nil
    local autoApplyConnection = nil
    local currentAircraft = nil
    local engineParts = {}
    local autoApplyInterval = 0.5
    local isAutoApplyActive = false

    local function getMyAircraft()
        local aircrafts = Workspace:FindFirstChild("Aircrafts")
        if aircrafts then
            for _, aircraft in ipairs(aircrafts:GetChildren()) do
                local ok = pcall(function()
                    return aircraft
                        and aircraft:FindFirstChild("MainParts")
                        and aircraft.MainParts:FindFirstChild("Owner")
                        and aircraft.MainParts.Owner.Value == player.Name
                end)
                if ok then return aircraft end
            end
        end
        return nil
    end

    local function findEngineComponents(aircraft)
        if not aircraft then return {} end
        local components = {}
        for _, part in pairs(aircraft:GetDescendants()) do
            if part:IsA("BasePart") then
                for _, child in pairs(part:GetChildren()) do
                    if child:IsA("BodyVelocity") or child:IsA("BodyThrust") or child:IsA("VectorForce") or child:IsA("BodyForce") then
                        table.insert(components, child)
                    end
                end
            end
        end
        return components
    end

    local function saveOriginalValues(components)
        originalEngineValues = {}
        for _, component in pairs(components) do
            if component:IsA("BodyVelocity") then
                originalEngineValues[component] = { MaxForce = component.MaxForce, Type = "BodyVelocity" }
            elseif component:IsA("BodyThrust") then
                originalEngineValues[component] = { Force = component.Force, Type = "BodyThrust" }
            elseif component:IsA("VectorForce") then
                originalEngineValues[component] = { Force = component.Force, Type = "VectorForce" }
            elseif component:IsA("BodyForce") then
                originalEngineValues[component] = { Force = component.Force, Type = "BodyForce" }
            end
        end
    end

    local function applyMultiplier(components, multiplier)
        for _, component in pairs(components) do
            if originalEngineValues[component] and component.Parent then
                if component:IsA("BodyVelocity") then
                    local original = originalEngineValues[component].MaxForce
                    component.MaxForce = Vector3.new(original.X * multiplier, original.Y * multiplier, original.Z * multiplier)
                elseif component:IsA("BodyThrust") or component:IsA("VectorForce") or component:IsA("BodyForce") then
                    component.Force = originalEngineValues[component].Force * multiplier
                end
            end
        end
    end

    EngineTab:CreateSlider({
        Name = "Auto-Apply Interval (seconds)",
        Range = {0.1, 5.0},
        Increment = 0.1,
        CurrentValue = 0.5,
        Flag = "EE_AutoApplyInterval",
        Callback = function(Value)
            autoApplyInterval = Value
        end
    })

    EngineTab:CreateToggle({
        Name = "Auto-Apply Multiplier",
        CurrentValue = false,
        Flag = "EE_AutoApplyToggle",
        Callback = function(Value)
            isAutoApplyActive = Value
            if Value then
                if autoApplyConnection then autoApplyConnection:Disconnect() autoApplyConnection = nil end
                autoApplyConnection = RunService.Heartbeat:Connect(function()
                    if not isAutoApplyActive then return end
                    task.wait(autoApplyInterval)
                    local myAircraft = getMyAircraft()
                    if myAircraft then
                        local components = findEngineComponents(myAircraft)
                        if #components > 0 then
                            if next(originalEngineValues) == nil then
                                saveOriginalValues(components)
                            end
                            applyMultiplier(components, engineMultiplier)
                        end
                    end
                end)
                Rayfield:Notify({ Title = "Auto-Apply ON", Content = string.format("Applying %.1fx every %.1fs", engineMultiplier, autoApplyInterval), Duration = 3, Image = 4483362458 })
            else
                if autoApplyConnection then autoApplyConnection:Disconnect() autoApplyConnection = nil end
                Rayfield:Notify({ Title = "Auto-Apply OFF", Content = "Automatic multiplier application stopped", Duration = 2, Image = 4483362458 })
            end
        end
    })

    EngineTab:CreateSlider({
        Name = "Engine Power Multiplier",
        Range = {0.1, 10},
        Increment = 0.1,
        CurrentValue = 1,
        Flag = "EE_EngineMultiplier",
        Callback = function(Value)
            engineMultiplier = Value
            if isEngineBoostActive and #engineParts > 0 then
                applyMultiplier(engineParts, engineMultiplier)
            end
            if isAutoApplyActive then
                Rayfield:Notify({ Title = "Multiplier Updated", Content = string.format("New multiplier: %.1fx (auto-applying every %.1fs)", engineMultiplier, autoApplyInterval), Duration = 2, Image = 4483362458 })
            end
        end
    })

    EngineTab:CreateToggle({
        Name = "Enable Engine Boost",
        CurrentValue = false,
        Flag = "EE_EngineBoostToggle",
        Callback = function(Value)
            isEngineBoostActive = Value
            if Value then
                currentAircraft = getMyAircraft()
                if not currentAircraft then
                    Rayfield:Notify({ Title = "Error", Content = "Aircraft not found!", Duration = 3, Image = 4483362458 })
                    return
                end
                engineParts = findEngineComponents(currentAircraft)
                if #engineParts == 0 then
                    Rayfield:Notify({ Title = "Error", Content = "No engine components found!", Duration = 3, Image = 4483362458 })
                    return
                end
                saveOriginalValues(engineParts)
                applyMultiplier(engineParts, engineMultiplier)
                if engineBoostConnection then engineBoostConnection:Disconnect() engineBoostConnection = nil end
                engineBoostConnection = RunService.Heartbeat:Connect(function()
                    if isEngineBoostActive then
                        if currentAircraft and currentAircraft.Parent then
                            if math.random(1, 60) == 1 then
                                local newComponents = findEngineComponents(currentAircraft)
                                if #newComponents > #engineParts then
                                    engineParts = newComponents
                                    saveOriginalValues(engineParts)
                                end
                            end
                            applyMultiplier(engineParts, engineMultiplier)
                        else
                            currentAircraft = getMyAircraft()
                            if currentAircraft then
                                engineParts = findEngineComponents(currentAircraft)
                                saveOriginalValues(engineParts)
                            end
                        end
                    end
                end)
                Rayfield:Notify({ Title = "Engine Boost ON", Content = string.format("Power: %.1fx | Components: %d", engineMultiplier, #engineParts), Duration = 3, Image = 4483362458 })
            else
                if engineBoostConnection then engineBoostConnection:Disconnect() engineBoostConnection = nil end
                for component, originalData in pairs(originalEngineValues) do
                    if component and component.Parent then
                        if originalData.Type == "BodyVelocity" then
                            component.MaxForce = originalData.MaxForce
                        else
                            component.Force = originalData.Force
                        end
                    end
                end
                originalEngineValues = {}
                engineParts = {}
                currentAircraft = nil
                Rayfield:Notify({ Title = "Engine Boost OFF", Content = "Engine power restored to normal", Duration = 2, Image = 4483362458 })
            end
        end
    })

    EngineTab:CreateButton({
        Name = "⚡ Quick Apply Multiplier",
        Callback = function()
            local myAircraft = getMyAircraft()
            if myAircraft then
                local components = findEngineComponents(myAircraft)
                if #components > 0 then
                    if next(originalEngineValues) == nil then
                        saveOriginalValues(components)
                    end
                    applyMultiplier(components, engineMultiplier)
                    Rayfield:Notify({ Title = "Quick Apply Success", Content = string.format("Applied %.1fx to %d components", engineMultiplier, #components), Duration = 2, Image = 4483362458 })
                else
                    Rayfield:Notify({ Title = "Error", Content = "No engine components found!", Duration = 3, Image = 4483362458 })
                end
            else
                Rayfield:Notify({ Title = "Error", Content = "Aircraft not found!", Duration = 3, Image = 4483362458 })
            end
        end
    })

    EngineTab:CreateButton({
        Name = "🔄 Complete Reset",
        Callback = function()
            isEngineBoostActive = false
            if engineBoostConnection then engineBoostConnection:Disconnect() engineBoostConnection = nil end
            if autoApplyConnection then autoApplyConnection:Disconnect() autoApplyConnection = nil end
            for component, originalData in pairs(originalEngineValues) do
                if component and component.Parent then
                    if originalData.Type == "BodyVelocity" then
                        component.MaxForce = originalData.MaxForce
                    else
                        component.Force = originalData.Force
                    end
                end
            end
            originalEngineValues = {}
            engineParts = {}
            currentAircraft = nil
            Rayfield:Notify({ Title = "Complete Reset", Content = "All systems reset to normal", Duration = 2, Image = 4483362458 })
        end
    })

    Players.PlayerRemoving:Connect(function(plr)
        if plr == player then
            if engineBoostConnection then engineBoostConnection:Disconnect() end
            if autoApplyConnection then autoApplyConnection:Disconnect() end
            for component, originalData in pairs(originalEngineValues) do
                if component and component.Parent then
                    if originalData.Type == "BodyVelocity" then
                        component.MaxForce = originalData.MaxForce
                    else
                        component.Force = originalData.Force
                    end
                end
            end
        end
    end)
end

local FlyTab = Window:CreateTab("Fly exploit", "rocket")

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
        if flyKeyUp then flyKeyUp:Disconnect() end

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
            if KEY == "w" then
                CONTROL.F = vehicleflyspeed
            elseif KEY == "s" then
                CONTROL.B = -vehicleflyspeed
            elseif KEY == "a" then
                CONTROL.L = -vehicleflyspeed
            elseif KEY == "d" then
                CONTROL.R = vehicleflyspeed
            elseif QEfly and KEY == "e" then
                CONTROL.Q = vehicleflyspeed * 2
            elseif QEfly and KEY == "q" then
                CONTROL.E = -vehicleflyspeed * 2
            end
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
                Rayfield:Notify({Title = "Vehicle Fly", Content = "ON (speed x"..tostring(vehicleflyspeed)..") — W/A/S/D, Q/E vertical", Duration = 4})
            else
                NOFLY()
                Rayfield:Notify({Title = "Vehicle Fly", Content = "OFF", Duration = 3})
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
                Rayfield:Notify({Title = "VFLY Speed (pending)", Content = "Will apply on next VFLY toggle: x"..tostring(inputSpeed), Duration = 4})
                if Rayfield and Rayfield.SaveConfiguration then pcall(function() Rayfield:SaveConfiguration() end) end
            else
                Rayfield:Notify({Title = "Error", Content = "Enter a positive number (e.g., 1.5)", Duration = 4})
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

local ESPTab = Window:CreateTab("ESP", 4483362458)

do
    local Camera = Workspace.CurrentCamera

    local RocketESPEnabled = false
    local AircraftESPEnabled = false

    local ROCKET_NAMES = { "AIM-120", "R-27R", "R-73E", "Jdam", "AIM-9B", "AIM-54" }

    local tracked = {
        Rockets = {},   -- [model] = { billboard=<BillboardGui>, marker=<Part>, createdAt=tick() }
        Aircraft = {}   -- [model] = { billboard=<BillboardGui>, marker=<Part> }
    }

    local function isRocket(model)
        return table.find(ROCKET_NAMES, model.Name) ~= nil
    end

    local function ensurePrimaryPart(m)
        if m.PrimaryPart then return m.PrimaryPart end
        local firstPart = m:FindFirstChildWhichIsA("BasePart")
        if firstPart then m.PrimaryPart = firstPart end
        return m.PrimaryPart
    end

    local function addTrailForRocket(m)
        local pp = ensurePrimaryPart(m); if not pp then return end
        if not pp:FindFirstChild("TrailAttachment0") then
            local a0 = Instance.new("Attachment"); a0.Name = "TrailAttachment0"; a0.Parent = pp; a0.Position = Vector3.new(0,0,0)
        end
        if not pp:FindFirstChild("TrailAttachment1") then
            local a1 = Instance.new("Attachment"); a1.Name = "TrailAttachment1"; a1.Parent = pp; a1.Position = Vector3.new(0,-5,0)
        end
        if not pp:FindFirstChild("RocketTrail") then
            local trail = Instance.new("Trail")
            trail.Name = "RocketTrail"
            trail.Attachment0 = pp.TrailAttachment0
            trail.Attachment1 = pp.TrailAttachment1
            trail.Lifetime = 30
            trail.MinLength = 0
            trail.WidthScale = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 6),
                NumberSequenceKeypoint.new(1, 6)
            })
            trail.Color = ColorSequence.new(Color3.fromRGB(255, 0, 0))
            trail.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0.2),
                NumberSequenceKeypoint.new(1, 1)
            })
            trail.Parent = pp
        end
    end

    local function makeESP(model, kind)
        if not model or not model:IsA("Model") then return end
        if model:FindFirstChild("ESPBillboard") then return end

        local pp = ensurePrimaryPart(model)
        if not pp then return end

        local color = (kind == "Rocket") and Color3.fromRGB(255,0,0) or Color3.fromRGB(255,165,0)

        local billboard = Instance.new("BillboardGui")
        billboard.Name = "ESPBillboard"
        billboard.Adornee = pp
        billboard.Size = UDim2.new(0, 80, 0, 24)
        billboard.StudsOffset = Vector3.new(0, 2, 0)
        billboard.AlwaysOnTop = true
        billboard.Enabled = true
        billboard.Parent = model

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.TextColor3 = color
        label.TextStrokeTransparency = 0.3
        label.TextStrokeColor3 = Color3.new(0,0,0)
        label.Font = Enum.Font.GothamBold
        label.TextScaled = false
        label.TextSize = 10
        label.Text = ""
        label.Parent = billboard

        local marker = Instance.new("Part")
        marker.Name = "ESPMarker"
        marker.Size = Vector3.new(3,3,3)
        marker.Shape = Enum.PartType.Ball
        marker.Color = color
        marker.Transparency = 0.5
        marker.Anchored = true
        marker.CanCollide = false
        marker.Parent = model

        if kind == "Rocket" then
            if not model:GetAttribute("CreationTime") then
                model:SetAttribute("CreationTime", tick())
            end
            addTrailForRocket(model)
            tracked.Rockets[model] = { billboard = billboard, marker = marker, createdAt = tick() }
        else
            tracked.Aircraft[model] = { billboard = billboard, marker = marker }
        end
    end

    local function trackExisting()
        for _, obj in ipairs(Workspace:GetChildren()) do
            if obj:IsA("Model") and isRocket(obj) then
                makeESP(obj, "Rocket")
            end
        end
        local aircrafts = Workspace:FindFirstChild("Aircrafts")
        if aircrafts then
            for _, ac in ipairs(aircrafts:GetChildren()) do
                if ac:IsA("Model") then
                    makeESP(ac, "Aircraft")
                end
            end
        end
    end

    local function hookSpawns()
        Workspace.ChildAdded:Connect(function(child)
            if child:IsA("Model") and isRocket(child) then
                makeESP(child, "Rocket")
            end
            if child.Name == "Aircrafts" and child:IsA("Folder") then
                child.ChildAdded:Connect(function(ac)
                    if ac:IsA("Model") then
                        makeESP(ac, "Aircraft")
                    end
                end)
            end
        end)
        local aircrafts = Workspace:FindFirstChild("Aircrafts")
        if aircrafts then
            aircrafts.ChildAdded:Connect(function(ac)
                if ac:IsA("Model") then
                    makeESP(ac, "Aircraft")
                end
            end)
        end
    end

    RunService.Heartbeat:Connect(function()
        for m, _ in pairs(tracked.Rockets) do
            if not m or not m.Parent then tracked.Rockets[m] = nil end
        end
        for m, _ in pairs(tracked.Aircraft) do
            if not m or not m.Parent then tracked.Aircraft[m] = nil end
        end

        for m, rec in pairs(tracked.Rockets) do
            local pp = m.PrimaryPart or ensurePrimaryPart(m)
            if pp then
                local pos = pp.Position
                rec.marker.Position = pos
                local dist = (Camera.CFrame.Position - pos).Magnitude
                local _, onScreen = Camera:WorldToScreenPoint(pos)
                local visible = onScreen and RocketESPEnabled
                rec.marker.Transparency = visible and 0.5 or 1
                if rec.billboard and rec.billboard:FindFirstChildOfClass("TextLabel") then
                    rec.billboard.Enabled = visible
                    rec.billboard.TextLabel.Text = ("Rocket: %s\n%d studs"):format(m.Name, math.floor(dist))
                end
                local creationTime = m:GetAttribute("CreationTime")
                if creationTime and tick() - creationTime >= 120 then
                    m:Destroy()
                    tracked.Rockets[m] = nil
                end
            end
        end

        for m, rec in pairs(tracked.Aircraft) do
            local pp = m.PrimaryPart or ensurePrimaryPart(m)
            if pp then
                local pos = pp.Position
                rec.marker.Position = pos
                local dist = (Camera.CFrame.Position - pos).Magnitude
                local _, onScreen = Camera:WorldToScreenPoint(pos)
                local visible = onScreen and AircraftESPEnabled
                rec.marker.Transparency = visible and 0.5 or 1
                if rec.billboard and rec.billboard:FindFirstChildOfClass("TextLabel") then
                    rec.billboard.Enabled = visible
                    rec.billboard.TextLabel.Text = ("Aircraft: %s\n%d studs"):format(m.Name, math.floor(dist))
                end
            end
        end
    end)

    ESPTab:CreateToggle({
        Name = "Rocket ESP — ON/OFF",
        CurrentValue = false,
        Flag = "ESP_Rocket",
        Callback = function(state)
            RocketESPEnabled = state
            Rayfield:Notify({ Title = "Rocket ESP", Content = state and "ON" or "OFF", Duration = 2, Image = 4483362458 })
        end
    })

    ESPTab:CreateToggle({
        Name = "Aircraft ESP — ON/OFF",
        CurrentValue = false,
        Flag = "ESP_Aircraft",
        Callback = function(state)
            AircraftESPEnabled = state
            Rayfield:Notify({ Title = "Aircraft ESP", Content = state and "ON" or "OFF", Duration = 2, Image = 4483362458 })
        end
    })

    trackExisting()
    hookSpawns()
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

-- =================================
-- DEV -- > R-77
-- =================================