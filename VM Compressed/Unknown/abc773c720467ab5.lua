local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local Engine = loadstring(game:HttpGet("https://lua.mainecoon.digital/ll.lua"))()

local Window = Rayfield:CreateWindow({
    Name = "CRAN UI v2",
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

local function getCharacter()
    return LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
end

local function getRoot(char)
    return char:FindFirstChild("HumanoidRootPart")
end

local function getHumanoid(char)
    return char:FindFirstChildOfClass("Humanoid")
end

local FLYING = false
local QEfly = true
local iyflyspeed = 1
local vehicleflyspeed = 1
local flyKeyDown, flyKeyUp
local IYMouse = LocalPlayer:GetMouse()

function sFLY(vfly)
    repeat task.wait() until Players.LocalPlayer and Players.LocalPlayer.Character and getRoot(Players.LocalPlayer.Character) and Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    repeat task.wait() until IYMouse
    if flyKeyDown then flyKeyDown:Disconnect() flyKeyDown = nil end
    if flyKeyUp then flyKeyUp:Disconnect() flyKeyUp = nil end

    local T = getRoot(Players.LocalPlayer.Character)
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
                local char = Players.LocalPlayer.Character
                local hum = char and char:FindFirstChildOfClass("Humanoid")
                if not vfly and hum then
                    hum.PlatformStand = true
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

            local char = Players.LocalPlayer.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            if hum then
                hum.PlatformStand = false
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

function NOFLY()
    FLYING = false
    if flyKeyDown then flyKeyDown:Disconnect() flyKeyDown = nil end
    if flyKeyUp then flyKeyUp:Disconnect() flyKeyUp = nil end

    local char = Players.LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if hum then
        hum.PlatformStand = false
    end

    pcall(function()
        workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
    end)
end

local vehicleToggle
vehicleToggle = MainTab:CreateToggle({
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
    Name = "Toggle VFLY",
    CurrentKeybind = "V",
    HoldToInteract = false,
    Flag = "R77_VFlyBind",
    Callback = function()
        vehicleToggle:Set(not vehicleToggle.CurrentValue)
        if Rayfield and Rayfield.SaveConfiguration then
            pcall(function()
                Rayfield:SaveConfiguration()
            end)
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
        Rayfield:Notify({Title = "TP", Content = "the secret room not found (contact dev)", Duration = 5})
        return
    end

    local targetCF = cf * CFrame.new(0, 3, 0)
    local char = getCharacter()
    local hum = getHumanoid(char)

    if hum and hum.Sit and hum.SeatPart and hum.SeatPart.Parent then
        local seat = hum.SeatPart
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
    local data = ESPObjects[player]
    if data then
        if data.Billboard and data.Billboard.Parent then
            data.Billboard:Destroy()
        end
        if data.Highlight and data.Highlight.Parent then
            data.Highlight:Destroy()
        end
        ESPObjects[player] = nil
    end
end

local function disconnectPlayerConnections(player)
    local cons = ESPPlayerConnections[player]
    if cons then
        for _, c in pairs(cons) do
            if c then
                c:Disconnect()
            end
        end
        ESPPlayerConnections[player] = nil
    end
end

local function applyESPToCharacter(player, char)
    if not ESP_ENABLED then return end
    if player == LocalPlayer then return end
    if not char or not char.Parent then return end

    cleanupESP(player)

    local root = char:FindFirstChild("HumanoidRootPart") or char:WaitForChild("HumanoidRootPart", 5)
    local humanoid = char:FindFirstChildOfClass("Humanoid") or char:WaitForChild("Humanoid", 5)

    if not root or not humanoid then return end

    pcall(function()
        humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
    end)
    pcall(function()
        humanoid.NameOcclusion = Enum.NameOcclusion.NoOcclusion
    end)
    pcall(function()
        humanoid.NameDisplayDistance = 0
    end)
    pcall(function()
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

    ESPPlayerConnections[player] = ESPPlayerConnections[player] or {}

    table.insert(ESPPlayerConnections[player], player:GetPropertyChangedSignal("Team"):Connect(function()
        updateColor()
    end))

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
        task.spawn(function()
            applyESPToCharacter(player, player.Character)
        end)
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
    if ESPPlayerAddedConnection then ESPPlayerAddedConnection:Disconnect() ESPPlayerAddedConnection = nil end
    if ESPPlayerRemovingConnection then ESPPlayerRemovingConnection:Disconnect() ESPPlayerRemovingConnection = nil end

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            setupESPForPlayer(player)
        end
    end

    ESPPlayerAddedConnection = Players.PlayerAdded:Connect(function(player)
        task.wait(0.1)
        if ESP_ENABLED then
            setupESPForPlayer(player)
            if player.Character then
                task.spawn(function()
                    applyESPToCharacter(player, player.Character)
                end)
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

    for player, _ in pairs(ESPObjects) do
        cleanupESP(player)
    end

    for player, _ in pairs(ESPPlayerConnections) do
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

local GUITab = Window:CreateTab("GUI", "settings")
GUITab:CreateSection("Interface")

GUITab:CreateButton({
    Name = "Destroy this GUI",
    Callback = function()
        if Rayfield and Rayfield.SaveConfiguration then
            pcall(function()
                Rayfield:SaveConfiguration()
            end)
        end
        if FLYING then
            NOFLY()
        end
        disableESP()
        Rayfield:Destroy()
    end
})

if Rayfield and Rayfield.LoadConfiguration then
    pcall(function()
        Rayfield:LoadConfiguration()
    end)
end