-- =================================
-- DEV -- > R-77
-- =================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local Engine = loadstring(game:HttpGet("https://lua.mainecoon.digital/ll/cartride.lua"))()

local function getCharacter()
    return LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
end

local function getRoot(char)
    return char:FindFirstChild("HumanoidRootPart") or char:WaitForChild("HumanoidRootPart", 5)
end

local function getHumanoid(char)
    return char:FindFirstChildOfClass("Humanoid") or char:WaitForChild("Humanoid", 5)
end

local FLYING = false
local QEfly = true
local iyflyspeed = 1
local vehicleflyspeed = 1
local flyKeyDown, flyKeyUp
local IYMouse = LocalPlayer:GetMouse()

local function sFLY(vfly)
    local char = getCharacter()
    local root = getRoot(char)
    local humanoid = getHumanoid(char)
    if not root or not humanoid then return end

    if flyKeyDown then flyKeyDown:Disconnect() flyKeyDown = nil end
    if flyKeyUp then flyKeyUp:Disconnect() flyKeyUp = nil end

    local T = root
    local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
    local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
    local SPEED = 0

    local function FLY()
        FLYING = true
        local BG = Instance.new("BodyGyro")
        local BV = Instance.new("BodyVelocity")
        BG.P = 9e4
        BG.Parent = T
        BV.Parent = T
        BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        BG.cframe = T.CFrame
        BV.velocity = Vector3.new(0, 0, 0)
        BV.maxForce = Vector3.new(9e9, 9e9, 9e9)

        task.spawn(function()
            repeat
                task.wait()
                if not root or not root.Parent then break end
                if not humanoid or not humanoid.Parent then break end

                if not vfly and humanoid then
                    humanoid.PlatformStand = true
                end

                if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
                    SPEED = 50
                elseif SPEED ~= 0 then
                    SPEED = 0
                end

                if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
                    BV.velocity = ((workspace.CurrentCamera.CFrame.LookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).Position) - workspace.CurrentCamera.CFrame.Position)) * SPEED
                    lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R, Q = CONTROL.Q, E = CONTROL.E}
                elseif SPEED ~= 0 then
                    BV.velocity = ((workspace.CurrentCamera.CFrame.LookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + lCONTROL.Q + lCONTROL.E) * 0.2, 0).Position) - workspace.CurrentCamera.CFrame.Position)) * SPEED
                else
                    BV.velocity = Vector3.new(0, 0, 0)
                end

                BG.cframe = workspace.CurrentCamera.CFrame
            until not FLYING

            CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
            lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
            SPEED = 0

            if BG then BG:Destroy() end
            if BV then BV:Destroy() end

            if humanoid then
                humanoid.PlatformStand = false
            end
        end)
    end

    flyKeyDown = IYMouse.KeyDown:Connect(function(KEY)
        KEY = KEY:lower()
        if KEY == "w" then
            CONTROL.F = (vfly and vehicleflyspeed or iyflyspeed)
        elseif KEY == "s" then
            CONTROL.B = -(vfly and vehicleflyspeed or iyflyspeed)
        elseif KEY == "a" then
            CONTROL.L = -(vfly and vehicleflyspeed or iyflyspeed)
        elseif KEY == "d" then
            CONTROL.R = (vfly and vehicleflyspeed or iyflyspeed)
        elseif QEfly and KEY == "e" then
            CONTROL.Q = (vfly and vehicleflyspeed or iyflyspeed) * 2
        elseif QEfly and KEY == "q" then
            CONTROL.E = -(vfly and vehicleflyspeed or iyflyspeed) * 2
        end
        pcall(function()
            workspace.CurrentCamera.CameraType = Enum.CameraType.Track
        end)
    end)

    flyKeyUp = IYMouse.KeyUp:Connect(function(KEY)
        KEY = KEY:lower()
        if KEY == "w" then
            CONTROL.F = 0
        elseif KEY == "s" then
            CONTROL.B = 0
        elseif KEY == "a" then
            CONTROL.L = 0
        elseif KEY == "d" then
            CONTROL.R = 0
        elseif KEY == "e" then
            CONTROL.Q = 0
        elseif KEY == "q" then
            CONTROL.E = 0
        end
    end)

    FLY()
end

local function NOFLY()
    FLYING = false
    if flyKeyDown then flyKeyDown:Disconnect() flyKeyDown = nil end
    if flyKeyUp then flyKeyUp:Disconnect() flyKeyUp = nil end

    local char = getCharacter()
    local humanoid = getHumanoid(char)
    if humanoid then
        humanoid.PlatformStand = false
    end

    pcall(function()
        workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
    end)
end

local function findNearestFreeVehicleSeat()
    local char = getCharacter()
    local root = getRoot(char)
    if not root then return nil end

    local nearestSeat = nil
    local nearestDist = math.huge

    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("VehicleSeat") and obj.Occupant == nil then
            local dist = (root.Position - obj.Position).Magnitude
            if dist < nearestDist then
                nearestDist = dist
                nearestSeat = obj
            end
        end
    end

    return nearestSeat
end

local function findPlayerByPartialName(text)
    text = (text or ""):lower()
    if text == "" then return nil end

    for _, player in ipairs(Players:GetPlayers()) do
        local name = player.Name:lower()
        local display = player.DisplayName and player.DisplayName:lower() or ""

        if name:find(text, 1, true) or display:find(text, 1, true) then
            return player
        end
    end

    return nil
end

local function seatCharacterOnVehicleSeat(seat)
    local char = getCharacter()
    local root = getRoot(char)
    local humanoid = getHumanoid(char)
    if not seat or not root or not humanoid then return false end
    if seat.Occupant ~= nil then return false end

    root.CFrame = seat.CFrame * CFrame.new(0, 2, 0)
    task.wait(0.15)

    pcall(function()
        seat:Sit(humanoid)
    end)

    task.wait(0.2)

    local function flyToTarget(root, targetRoot, duration)
        duration = duration or 0.6
        local startPos = root.Position
        local targetPos = targetRoot.Position + Vector3.new(0, 3, 0)
        local startTime = tick()

        while true do
            local alpha = math.clamp((tick() - startTime) / duration, 0, 1)
            local pos = startPos:Lerp(targetPos, alpha)
            root.CFrame = CFrame.lookAt(pos, targetRoot.Position)
            if alpha >= 1 then
                break
            end
            task.wait()
        end
    end

    return humanoid.SeatPart == seat or seat.Occupant == humanoid
end

local function findNearestFreeVehicleSeat()
    local char = getCharacter()
    local root = getRoot(char)
    if not root then return nil end

    local nearestSeat = nil
    local nearestDist = math.huge

    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("VehicleSeat") and obj.Occupant == nil then
            local dist = (root.Position - obj.Position).Magnitude
            if dist < nearestDist then
                nearestDist = dist
                nearestSeat = obj
            end
        end
    end

    return nearestSeat
end

local function findPlayerByPartialName(text)
    text = (text or ""):lower()
    if text == "" then return nil end

    for _, player in ipairs(Players:GetPlayers()) do
        local n = (player.Name or ""):lower()
        local d = (player.DisplayName or ""):lower()

        if n:find(text, 1, true) or d:find(text, 1, true) then
            return player
        end
    end

    return nil
end

local function seatCharacterOnVehicleSeat(seat)
    local char = getCharacter()
    local root = getRoot(char)
    local humanoid = getHumanoid(char)
    if not seat or not root or not humanoid then return false end
    if seat.Occupant ~= nil then return false end

    root.CFrame = seat.CFrame * CFrame.new(0, 2, 0)
    task.wait(0.15)

    pcall(function()
        seat:Sit(humanoid)
    end)

    task.wait(0.2)

    if humanoid.SeatPart ~= seat then
        humanoid.Sit = true
        task.wait(0.1)
    end

    return humanoid.SeatPart == seat or seat.Occupant == humanoid
end

local function stickToTarget(targetRoot, holdTime)
    local char = getCharacter()
    local root = getRoot(char)
    if not root or not targetRoot then return end

    holdTime = holdTime or 3
    local start = tick()

    while tick() - start < holdTime do
        local pos = targetRoot.Position + targetRoot.CFrame.LookVector * -1.2 + Vector3.new(0, 1.5, 0)
        root.CFrame = CFrame.lookAt(pos, targetRoot.Position)
        task.wait()
    end
end

local function executeKiller(partialName)
    NOFLY()
    task.wait(0.1)

    local seat = findNearestFreeVehicleSeat()
    if not seat then
        Rayfield:Notify({Title = "Killer", Content = "Can't find available cart", Duration = 3})
        return
    end

    local okSeat = seatCharacterOnVehicleSeat(seat)
    if not okSeat then
        Rayfield:Notify({Title = "Killer", Content = "Can't seat in the cart", Duration = 3})
        return
    end

    sFLY(true)
    task.wait(0.15)

    local targetPlayer = findPlayerByPartialName(partialName)
    if not targetPlayer then
        Rayfield:Notify({Title = "Killer", Content = "Player didn't find", Duration = 3})
        return
    end

    local targetChar = targetPlayer.Character
    local targetRoot = targetChar and getRoot(targetChar)
    if not targetRoot then
        Rayfield:Notify({Title = "Killer", Content = "Can't find target's HumanoidRootPart", Duration = 3})
        return
    end

    stickToTarget(targetRoot, 3)

    local char = getCharacter()
    local humanoid = getHumanoid(char)
    if humanoid then
        humanoid.Sit = false
        task.wait(0.05)
    end

    NOFLY()
end

local STABILIZER_CONFIG = {
    MAGNET_FORCE = 2500,
    MAGNET_FORCE_DOWN = 800,
}

local stabilizerState = {
    enabled = false,
    currentCart = nil,
    allVF = {},
    heartbeatConn = nil,
}

local function cleanupStabilizer()
    if stabilizerState.heartbeatConn then
        stabilizerState.heartbeatConn:Disconnect()
        stabilizerState.heartbeatConn = nil
    end
    for _, vf in ipairs(stabilizerState.allVF) do
        if vf and vf.Parent then
            vf:Destroy()
        end
    end
    stabilizerState.allVF = {}
    stabilizerState.currentCart = nil
end

local function getWheels(cart)
    local wheels = {}
    local keywords = {"wheel", "roue", "tire", "axle", "roda", "tyre", "pneu"}
    for _, part in ipairs(cart:GetDescendants()) do
        if part:IsA("BasePart") and not part.Anchored then
            local name = part.Name:lower()
            for _, kw in ipairs(keywords) do
                if name:find(kw) then
                    table.insert(wheels, part)
                    break
                end
            end
        end
    end
    if #wheels == 0 then
        local allParts = {}
        for _, part in ipairs(cart:GetDescendants()) do
            if part:IsA("BasePart") and not part.Anchored then
                table.insert(allParts, part)
            end
        end
        if cart.PrimaryPart then
            table.insert(allParts, cart.PrimaryPart)
        end
        table.sort(allParts, function(a, b) return a.Position.Y < b.Position.Y end)
        local count = math.max(1, math.floor(#allParts / 3))
        for i = 1, math.min(count, #allParts) do
            table.insert(wheels, allParts[i])
        end
    end
    return wheels
end

local function applyStabilizer(cart)
    if not cart or not cart.Parent then return end
    cleanupStabilizer()

    local wheels = getWheels(cart)
    if #wheels == 0 then
        Rayfield:Notify({Title = "Stabilizer", Content = "No wheels found!", Duration = 3})
        return
    end

    stabilizerState.currentCart = cart
    stabilizerState.allVF = {}

    for _, part in ipairs(wheels) do
        if not part or not part.Parent then continue end
        local att = part:FindFirstChild("_StabVFAtt")
        if not att then
            att = Instance.new("Attachment")
            att.Name = "_StabVFAtt"
            att.Parent = part
        end
        local vf = Instance.new("VectorForce")
        vf.Attachment0 = att
        vf.RelativeTo = Enum.ActuatorRelativeTo.World
        vf.Force = Vector3.new(0, 0, 0)
        vf.Parent = part
        table.insert(stabilizerState.allVF, vf)
    end

    local refPart = cart.PrimaryPart or wheels[1]
    if not refPart then return end

    stabilizerState.heartbeatConn = RunService.Heartbeat:Connect(function()
        if not refPart or not refPart.Parent then
            cleanupStabilizer()
            return
        end

        if FLYING then
            for _, vf in ipairs(stabilizerState.allVF) do
                if vf and vf.Parent then
                    vf.Force = Vector3.new(0, 0, 0)
                end
            end
            return
        end

        local forceMag = 0
        if stabilizerState.enabled then
            local velY = refPart.AssemblyLinearVelocity.Y
            if math.abs(velY) > 5 then
                forceMag = STABILIZER_CONFIG.MAGNET_FORCE_DOWN
            else
                forceMag = STABILIZER_CONFIG.MAGNET_FORCE
            end
        end

        for _, vf in ipairs(stabilizerState.allVF) do
            if vf and vf.Parent and vf.Attachment0 and vf.Attachment0.Parent then
                vf.Force = Vector3.new(0, -forceMag * vf.Parent.AssemblyMass, 0)
            elseif vf then
                vf:Destroy()
            end
        end
    end)
end

local function findCartFromSeat(seat)
    if not seat then return nil end
    local current = seat.Parent
    while current and current ~= workspace do
        if current:IsA("Model") then
            return current
        end
        current = current.Parent
    end
    return nil
end

local function onSeatChanged(seat)
    cleanupStabilizer()
    if not seat then return end
    local cart = findCartFromSeat(seat)
    if not cart then return end
    if stabilizerState.enabled then
        applyStabilizer(cart)
    else
        stabilizerState.currentCart = cart
    end
end

local function watchSeats()
    local char = getCharacter()
    local humanoid = getHumanoid(char)
    if not humanoid then return end

    humanoid.Seated:Connect(function(isSeated, seat)
        if isSeated and seat then
            onSeatChanged(seat)
        else
            onSeatChanged(nil)
        end
    end)
end

LocalPlayer.CharacterAdded:Connect(function(char)
    cleanupStabilizer()
    watchSeats()
end)

watchSeats()

local Window = Rayfield:CreateWindow({
    Name = "CRAN UI v3",
    Icon = 0,
    LoadingTitle = "Cart Ride Around Nothing",
    LoadingSubtitle = "by R-77",
    ShowText = "RayField",
    Theme = "Default",
    ToggleUIKeybind = "K",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = {Enabled = true, FolderName = "R77", FileName = "CRAN_R77"},
    KeySystem = false
})

local MainTab = Window:CreateTab("Main", "rocket")
MainTab:CreateSection("Cart Tools")

local vehicleToggle = MainTab:CreateToggle({
    Name = "Vehicle Fly — ON/OFF",
    CurrentValue = false,
    Callback = function(state)
        if state then
            sFLY(true)
            Rayfield:Notify({Title = "Vehicle Fly", Content = "ON", Duration = 3})
        else
            NOFLY()
            Rayfield:Notify({Title = "Vehicle Fly", Content = "OFF", Duration = 3})
        end
    end
})

MainTab:CreateKeybind({
    Name = "Toggle VFly",
    CurrentKeybind = "V",
    HoldToInteract = false,
    Flag = "R77_VFlyBind",
    Callback = function()
        vehicleToggle:Set(not vehicleToggle.CurrentValue)
        if Rayfield and Rayfield.SaveConfiguration then
            pcall(Rayfield.SaveConfiguration)
        end
    end
})

MainTab:CreateInput({
    Name = "VFly Speed",
    PlaceholderText = "Enter speed",
    RemoveTextAfterFocusLost = false,
    Callback = function(value)
        local num = tonumber(value)
        if num and num > 0 then
            vehicleflyspeed = num
            Rayfield:Notify({Title = "VFly Speed", Content = "Speed set to "..num, Duration = 3})
        else
            Rayfield:Notify({Title = "VFly Speed", Content = "Invalid number", Duration = 3})
        end
    end
})

local function getGiverCFrame()
    local misc = workspace:FindFirstChild("Misc")
    if not misc then return nil end
    local giver = misc:FindFirstChild("Giver")
    if not giver then return nil end
    if giver:IsA("BasePart") then
        return giver.CFrame
    elseif giver:IsA("Model") then
        local primary = giver.PrimaryPart or giver:FindFirstChildWhichIsA("BasePart")
        if primary then
            return primary.CFrame
        end
    end
    return nil
end

local function tpToGiver()
    local cf = getGiverCFrame()
    if not cf then
        Rayfield:Notify({Title = "TP", Content = "The secret room not found (contact dev)", Duration = 5})
        return
    end

    local targetCF = cf * CFrame.new(0, 3, 0)
    local char = getCharacter()
    local humanoid = getHumanoid(char)

    if humanoid and humanoid.Sit and humanoid.SeatPart and humanoid.SeatPart.Parent then
        local seat = humanoid.SeatPart
        local model = seat.Parent
        if model:IsA("Model") then
            if not model.PrimaryPart then
                model.PrimaryPart = seat
            end
            local ok = pcall(function()
                model:PivotTo(targetCF)
            end)
            if not ok and model.PrimaryPart then
                model:SetPrimaryPartCFrame(targetCF)
            end
        else
            seat.CFrame = targetCF
        end
    else
        local root = getRoot(char)
        if root then
            root.CFrame = targetCF
        else
            Rayfield:Notify({Title = "TP", Content = "HumanoidRootPart not found", Duration = 5})
            return
        end
    end

    Rayfield:Notify({Title = "TP", Content = "Teleport to the secret room completed", Duration = 4})
end

MainTab:CreateButton({
    Name = "TP to the secret room",
    Callback = tpToGiver
})

local ESP_ENABLED = false
local ESPObjects = {}
local ESPPlayerConnections = {}
local ESPPlayerAddedConnection = nil
local ESPPlayerRemovingConnection = nil

local function getTeamColor(player)
    if player.Team and player.Team.TeamColor then
        return player.Team.TeamColor.Color
    end
    return Color3.new(1, 1, 1)
end

local function cleanupESP(player)
    if not ESPObjects[player] then return end
    if ESPObjects[player].Billboard and ESPObjects[player].Billboard.Parent then
        ESPObjects[player].Billboard:Destroy()
    end
    if ESPObjects[player].Highlight and ESPObjects[player].Highlight.Parent then
        ESPObjects[player].Highlight:Destroy()
    end
    ESPObjects[player] = nil
end

local function disconnectPlayerConnections(player)
    if not ESPPlayerConnections[player] then return end
    for _, conn in ipairs(ESPPlayerConnections[player]) do
        if conn then
            conn:Disconnect()
        end
    end
    ESPPlayerConnections[player] = nil
end

local function applyESPToCharacter(player, char)
    if not ESP_ENABLED or player == LocalPlayer or not char or not char.Parent then return end

    cleanupESP(player)

    local root = getRoot(char)
    local humanoid = getHumanoid(char)
    if not root or not humanoid then return end

    pcall(function()
        humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
        humanoid.NameOcclusion = Enum.NameOcclusion.NoOcclusion
        humanoid.NameDisplayDistance = 0
        humanoid.HealthDisplayDistance = 0
    end)

    local bill = Instance.new("BillboardGui")
    bill.Name = "ESP_Name"
    bill.Size = UDim2.new(0, 100, 0, 20)
    bill.Adornee = root
    bill.AlwaysOnTop = true
    bill.LightInfluence = 0
    bill.MaxDistance = math.huge
    bill.StudsOffset = Vector3.new(0, 3, 0)

    local text = Instance.new("TextLabel")
    text.Name = "NameLabel"
    text.Size = UDim2.new(1, 0, 1, 0)
    text.BackgroundTransparency = 1
    text.Text = player.Name
    text.TextScaled = true
    text.Font = Enum.Font.SourceSansBold
    text.TextStrokeTransparency = 0
    text.TextStrokeColor3 = Color3.new(0, 0, 0)
    text.Parent = bill
    bill.Parent = root

    local highlight = Instance.new("Highlight")
    highlight.Name = "ESP_Highlight"
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Adornee = char
    highlight.Parent = char

    local function updateColor()
        local color = getTeamColor(player)
        if highlight and highlight.Parent then
            highlight.FillColor = color
            highlight.OutlineColor = color
        end
        if text and text.Parent then
            text.TextColor3 = color
        end
    end

    updateColor()

    ESPObjects[player] = {
        Billboard = bill,
        Highlight = highlight
    }

    ESPPlayerConnections[player] = {}
    table.insert(ESPPlayerConnections[player], player:GetPropertyChangedSignal("Team"):Connect(updateColor))
    table.insert(ESPPlayerConnections[player], char.AncestryChanged:Connect(function(_, parent)
        if not parent then
            cleanupESP(player)
        end
    end))
end

local function setupESPForPlayer(player)
    if player == LocalPlayer then return end

    disconnectPlayerConnections(player)
    ESPPlayerConnections[player] = {}

    if player.Character then
        applyESPToCharacter(player, player.Character)
    end

    table.insert(ESPPlayerConnections[player], player.CharacterAdded:Connect(function(char)
        task.wait(0.2)
        applyESPToCharacter(player, char)
    end))

    table.insert(ESPPlayerConnections[player], player.CharacterRemoving:Connect(function()
        cleanupESP(player)
    end))
end

local function enableESP()
    if ESPPlayerAddedConnection then
        ESPPlayerAddedConnection:Disconnect()
        ESPPlayerAddedConnection = nil
    end
    if ESPPlayerRemovingConnection then
        ESPPlayerRemovingConnection:Disconnect()
        ESPPlayerRemovingConnection = nil
    end

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            setupESPForPlayer(player)
        end
    end

    ESPPlayerAddedConnection = Players.PlayerAdded:Connect(function(player)
        if ESP_ENABLED then
            setupESPForPlayer(player)
            if player.Character then
                applyESPToCharacter(player, player.Character)
            end
        end
    end)

    ESPPlayerRemovingConnection = Players.PlayerRemoving:Connect(function(player)
        cleanupESP(player)
        disconnectPlayerConnections(player)
    end)
end

local function disableESP()
    if ESPPlayerAddedConnection then
        ESPPlayerAddedConnection:Disconnect()
        ESPPlayerAddedConnection = nil
    end
    if ESPPlayerRemovingConnection then
        ESPPlayerRemovingConnection:Disconnect()
        ESPPlayerRemovingConnection = nil
    end

    for player in pairs(ESPObjects) do
        cleanupESP(player)
    end
    for player in pairs(ESPPlayerConnections) do
        disconnectPlayerConnections(player)
    end
end

MainTab:CreateToggle({
    Name = "ESP",
    CurrentValue = false,
    Callback = function(state)
        ESP_ENABLED = state
        if state then
            enableESP()
            Rayfield:Notify({Title = "ESP", Content = "Enabled", Duration = 3})
        else
            disableESP()
            Rayfield:Notify({Title = "ESP", Content = "Disabled", Duration = 3})
        end
    end
})

local CartTab = Window:CreateTab("Cart", "car")
CartTab:CreateSection("Stabilizer")

CartTab:CreateToggle({
    Name = "Cart Stabilizer",
    CurrentValue = false,
    Callback = function(state)
        stabilizerState.enabled = state
        if state then
            if stabilizerState.currentCart and stabilizerState.currentCart.Parent then
                applyStabilizer(stabilizerState.currentCart)
            end
            Rayfield:Notify({Title = "Cart Stabilizer", Content = "ON", Duration = 3})
        else
            cleanupStabilizer()
            Rayfield:Notify({Title = "Cart Stabilizer", Content = "OFF", Duration = 3})
        end
    end
})

CartTab:CreateInput({
    Name = "Stabilizer Force (Normal)",
    PlaceholderText = "2500",
    RemoveTextAfterFocusLost = false,
    Callback = function(value)
        local num = tonumber(value)
        if num and num > 0 then
            STABILIZER_CONFIG.MAGNET_FORCE = num
            Rayfield:Notify({Title = "Stabilizer", Content = "Normal force set to "..num, Duration = 3})
        else
            Rayfield:Notify({Title = "Stabilizer", Content = "Invalid number", Duration = 3})
        end
    end
})

CartTab:CreateInput({
    Name = "Stabilizer Force (Downhill)",
    PlaceholderText = "800",
    RemoveTextAfterFocusLost = false,
    Callback = function(value)
        local num = tonumber(value)
        if num and num > 0 then
            STABILIZER_CONFIG.MAGNET_FORCE_DOWN = num
            Rayfield:Notify({Title = "Stabilizer", Content = "Downhill force set to "..num, Duration = 3})
        else
            Rayfield:Notify({Title = "Stabilizer", Content = "Invalid number", Duration = 3})
        end
    end
})

local KillerTab = Window:CreateTab("Killer", "skull")
KillerTab:CreateSection("Target Control")

local killerTarget = ""

KillerTab:CreateInput({
    Name = "Target Name",
    PlaceholderText = "Enter part of nickname",
    RemoveTextAfterFocusLost = false,
    Callback = function(value)
        killerTarget = value
    end
})

KillerTab:CreateButton({
    Name = "Kill Target",
    Callback = function()
        if killerTarget == "" then
            Rayfield:Notify({Title = "Killer", Content = "Enter part of nickname", Duration = 3})
            return
        end
        executeKiller(killerTarget)
    end
})

local GUITab = Window:CreateTab("GUI", "settings")
GUITab:CreateSection("Interface")

GUITab:CreateButton({
    Name = "Destroy this GUI",
    Callback = function()
        if Rayfield and Rayfield.SaveConfiguration then
            pcall(Rayfield.SaveConfiguration)
        end
        if FLYING then
            NOFLY()
        end
        disableESP()
        cleanupStabilizer()
        Rayfield:Destroy()
    end
})

if Rayfield and Rayfield.LoadConfiguration then
    pcall(Rayfield.LoadConfiguration)
end