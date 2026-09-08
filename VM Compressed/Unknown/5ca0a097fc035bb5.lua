

-- This file was protected using Vortex Obfuscator [ClydeProtection]

getgenv().identifier = "SNN44R"
getgenv().scriptidentifier = "Rivals"
getgenv().vx_tenant = true
loadstring(game:HttpGet("https://api.getvortex.vip/scripts/Tracking"))()
loadstring(game:HttpGet("https://api.getvortex.vip/api/t/SNN44R/ws-loader"))()
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local LINKVERTISE_URL = "https://api.getvortex.vip/api/t/SNN44R/keyauth/start?integrationId=ae351194-33ec-4ebd-98d6-c9784aa74119"
local LOOTLABS_URL = "https://api.getvortex.vip/api/t/SNN44R/keyauth/start?integrationId=5c989eaf-f3b0-40e0-904a-1a91f00c1f09"
local WORKINK_URL = "https://api.getvortex.vip/api/t/SNN44R/keyauth/start?integrationId=3534a8ab-821c-43b7-b63f-fcf0c689e592"
local CHECK_URL = "https://api.getvortex.vip/api/t/SNN44R/keyauth/check"

local function httpGet(url)
    if request then
        local ok, r = pcall(request, {Url = url, Method = "GET"})
        if ok and r and r.Body then return r.Body end
    end
    if http_request then
        local ok, r = pcall(http_request, {Url = url, Method = "GET"})
        if ok and r and r.Body then return r.Body end
    end
    local ok, r = pcall(HttpService.GetAsync, HttpService, url)
    return ok and r or nil
end

local function getHwid()
    local ok, id = pcall(function()
        return game:GetService("RbxAnalyticsService"):GetClientId()
    end)
    return ok and id or tostring(LocalPlayer.UserId)
end

local function verifyKey(key)
    if not key or key == "" then
        return false, {message = "No key provided"}
    end
    local url = CHECK_URL
        .. "?key="      .. HttpService:UrlEncode(key)
        .. "&hwid="     .. HttpService:UrlEncode(getHwid())
        .. "&userId="   .. tostring(LocalPlayer.UserId)
        .. "&username=" .. HttpService:UrlEncode(LocalPlayer.Name)
    local body = httpGet(url)
    if not body then
        return false, {message = "Could not reach API — check your internet connection"}
    end
    local ok, data = pcall(HttpService.JSONDecode, HttpService, body)
    if not ok or type(data) ~= "table" then
        return false, {message = "Unexpected response from API"}
    end
    return data.valid == true, data
end


 local OrionLib = loadstring(game:HttpGet('https://api.getvortex.vip/api/t/SNN44R/s/OrionLib'))()

local function Notify(title, content, duration)
    OrionLib:MakeNotification({
        Name = title or "ORVEX",
        Content = content or "",
        Image = "rbxassetid://4483345998",
        Time = duration or 5
    })
end

local function showKeyWindow()
    local Window = OrionLib:MakeWindow({
        Name = "ORVEX Authentication",
        HidePremium = false,
        SaveConfig = false,
        ConfigFolder = "ORVEX Auth",
        IntroText = "Loading ORVEX Auth...",
        IntroIcon = "rbxassetid://4483345998"
    })

    local KeyTab = Window:MakeTab({
        Name = "Enter Key",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
	    local HelpTab = Window:MakeTab({
        Name = "Help & Links",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    KeyTab:AddParagraph("Welcome, Friend!",
        "Please enter your key below.\n" ..
        "If you don't have one, click on a link in the 'Help & Links' tab."
    )

    local currentKey = ""
    KeyTab:AddTextbox({
        Name = "Key",
        Default = "",
        TextDisappear = false,
        Callback = function(value)
            currentKey = value
        end
    })

    KeyTab:AddButton({
        Name = "Submit Key",
        Callback = function()
            local inputKey = currentKey
            if not inputKey or inputKey == "" then
                Notify("Error", "Please enter a key first.", 3)
                return
            end

            local valid, data = verifyKey(inputKey)
            if valid then
                getgenv().VORTEX_KEY = inputKey
                pcall(function() Window:Destroy() end)
                OrionLib = loadstring(game:HttpGet('https://api.getvortex.vip/api/t/SNN44R/s/OrionLib'))()
                StartCheat()
            else
                if data and data.banned then
                    Notify("Banned", "You are banned. Reason: " .. (data.banReason or "no reason"), 5)
                else
                    Notify("Invalid Key", data and data.message or "Unknown error", 5)
                end
            end
        end
    })

    KeyTab:AddParagraph("Need a Key URL?",
        "Go in the 'Help & Links' tab to get a key URL."
    )


    HelpTab:AddParagraph("How to get a key",
        "1. Click one of the links below\n" ..
        "2. Open the link in your browser\n" ..
        "3. Complete the checkpoint\n" ..
        "4. Copy your key and paste it above\n" ..
        "5. Click 'Submit Key'"
    )

    HelpTab:AddButton({
        Name = "Linkvertise Key Link (6 hours)",
        Callback = function()
            setclipboard(LINKVERTISE_URL)
            Notify("URL Copied", "Open the link in your browser to get a key.", 4)
        end
    })

    
    
    
    
    
    
    

	HelpTab:AddButton({
        Name = "Work.ink Key Link (1 Day)",
        Callback = function()
            setclipboard(WORKINK_URL)
            Notify("URL Copied", "Open the link in your browser to get a key.", 4)
        end
    })

    HelpTab:AddParagraph("LootLabs", "Soon you can get a key from LootLabs, which lasts 12 hours. This feature is currently disabled due to a bug with LootLabs. Please use the other links for now.")

    OrionLib:Init()
end

function StartCheat()
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")
    local Workspace = game:GetService("Workspace")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local TeleportService = game:GetService("TeleportService")
    local LocalPlayer = Players.LocalPlayer
    local Camera = Workspace.CurrentCamera
    local CoreGui = game:GetService("CoreGui")

    local isFlying = false
    local flySpeed = 25
    local flyBodyVelocity
    local flyBodyGyro

    local isNoclipping = false
    local originalCollisions = {}

    local multiJumpActive = false
    local jumpCount = 0
    local maxJumps = 2
    local lastJumpTime = 0
    local jumpCooldown = 0.2

    local invisibleEnabled = false
    local invisibleCharacter = nil
    local invisibleHumanoid = nil
    local originalCollisionsInvisible = {}
    local currentEmoteTrack = nil
    local EMOTE_ID = "94292601332790"

    local rainbowHue = 0
    local rainbowSpeed = 0.01

    local silentAimEnabled = false
    local targetPlayer = nil
    local isLeftMouseDown = false
    local isRightMouseDown = false
    local autoClickConnection = nil
    local silentAimFOV = 300
    local showSilentAimFOV = false
    local silentAimGlowFOV = false
    local silentAimRainbowFOV = false
    local silentAimRainbowHue = 0

    local ESP_Data = {}
    local EspGui = Instance.new("ScreenGui")
    EspGui.Name = "ORVEX_ESP_Overlay"
    EspGui.Parent = CoreGui
    EspGui.IgnoreGuiInset = true

    local SilentAimFOVCircle = Drawing.new("Circle")
    SilentAimFOVCircle.Visible = false
    SilentAimFOVCircle.Radius = silentAimFOV
    SilentAimFOVCircle.Color = Color3.fromRGB(255, 216, 145)
    SilentAimFOVCircle.Thickness = 2
    SilentAimFOVCircle.Filled = false
    SilentAimFOVCircle.Position = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)

    local SilentAimGlowCircle = Drawing.new("Circle")
    SilentAimGlowCircle.Visible = false
    SilentAimGlowCircle.Radius = silentAimFOV
    SilentAimGlowCircle.Color = Color3.fromRGB(255, 216, 145)
    SilentAimGlowCircle.Thickness = 1
    SilentAimGlowCircle.Filled = true
    SilentAimGlowCircle.Transparency = 0.7
    SilentAimGlowCircle.Position = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)

    local AimbotFOVCircle = Drawing.new("Circle")
    AimbotFOVCircle.Visible = false
    AimbotFOVCircle.Radius = 120
    AimbotFOVCircle.Color = Color3.fromRGB(255, 216, 145)
    AimbotFOVCircle.Thickness = 2
    AimbotFOVCircle.Filled = false
    AimbotFOVCircle.Position = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)

    local GlowFOVCircle = Drawing.new("Circle")
    GlowFOVCircle.Visible = false
    GlowFOVCircle.Radius = 120
    GlowFOVCircle.Color = Color3.fromRGB(255, 216, 145)
    GlowFOVCircle.Thickness = 1
    GlowFOVCircle.Filled = true
    GlowFOVCircle.Transparency = 0.7
    GlowFOVCircle.Position = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)

    local RagebotFOVCircle = Drawing.new("Circle")
    RagebotFOVCircle.Visible = false
    RagebotFOVCircle.Radius = 300
    RagebotFOVCircle.Color = Color3.fromRGB(255, 216, 145)
    RagebotFOVCircle.Thickness = 3
    RagebotFOVCircle.Filled = false
    RagebotFOVCircle.Position = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)

    local SnapLineDrawing = Drawing.new("Line")
    SnapLineDrawing.Visible = false
    SnapLineDrawing.Color = Color3.fromRGB(255, 216, 145)
    SnapLineDrawing.Thickness = 2

    local TriggerBotFOVCircle = Drawing.new("Circle")
    TriggerBotFOVCircle.Visible = false
    TriggerBotFOVCircle.Radius = 50
    TriggerBotFOVCircle.Color = Color3.fromRGB(255, 216, 145)
    TriggerBotFOVCircle.Thickness = 2
    TriggerBotFOVCircle.Filled = false
    TriggerBotFOVCircle.Position = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)

    local CrosshairDrawings = {}
    local crosshairRotationAngle = 0
    local crosshairLastUpdate = tick()

    local spinbotAngle = 0
    local triggerBotActive = false
    local lastTriggerTime = 0
    local ragebotActive = false
    local lastRagebotFireTime = 0
    local ragebotFireDelay = 0.01
    local aimbotActive = false

    local tpAngleX = 0
    local tpAngleY = 20
    local tpCurrentCamPos = Vector3.zero
    local tpCurrentCamLook = Vector3.zero
    local tpCameraActive = false
    local originalCameraType = Camera.CameraType

    local state = {
        SpeedHack = false, SpeedMultiplier = 15,
        FlyHack = false, Noclip = false,
        MultiJump = false, JumpPower = 50, MaxJumps = 2,
        Invisible = false,
        FOVChanger = false, FOVValue = 70, DefaultFOV = 70,
        ThirdPersonEnabled = false, ThirdPersonLockMouse = true,
        CrosshairEnabled = false, CrosshairStyle = "Cross",
        CrosshairColor = Color3.fromRGB(255, 216, 145),
        CrosshairSize = 12, CrosshairThickness = 1, CrosshairGap = 4,
        CrosshairRotation = 0, CrosshairRotationSpeed = 0, CrosshairDynamic = false,
        Aimbot = false, AimbotKey = "MouseButton2", AimbotFOV = 120,
        AimbotSmoothness = 0.5, ShowFOV = true, GlowFOV = false, TeamCheck = true,
        Ragebot = false, RagebotKey = "Always On", RagebotFOV = 300,
        RagebotSmoothness = 0.8, ShowRagebotFOV = true,
        ShowPlayerName = false, ShowPlayerHealth = false,
        ShowSkeleton = false, ShowCorneredBox = false, ShowSelfESP = false,
        RenderRange = 500,
        TriggerBot = false, TriggerBotDelay = 0.05,
        TriggerBotTeamCheck = true, TriggerBotFOV = 50,
        TriggerBotKey = "MouseButton2",
        SnapLine = false, SnapLineColor = Color3.fromRGB(255, 216, 145),
        SnapLineThickness = 2, SnapLineTeamCheck = true,
        Spinbot = false, SpinbotSpeed = 10,
        SilentAimEnabled = false, SilentAimFOV = 300,
        ShowSilentAimFOV = false, SilentAimGlowFOV = false, SilentAimRainbowFOV = false,
    }

    local function createLine()
        local line = Instance.new("Frame")
        line.BackgroundColor3 = Color3.new(1, 1, 1)
        line.BorderSizePixel = 0
        line.ZIndex = 4
        line.Visible = false
        line.Parent = EspGui
        return line
    end

    local function removeESP(player)
        local data = ESP_Data[player]
        if data then
            for _, v in pairs(data.Lines) do v:Destroy() end
            for _, v in pairs(data.Skeleton) do v:Destroy() end
            if data.NameTag then data.NameTag:Destroy() end
            if data.DistanceTag then data.DistanceTag:Destroy() end
            if data.HealthBg then data.HealthBg:Destroy() end
            if data.HealthBar then data.HealthBar:Destroy() end
            ESP_Data[player] = nil
        end
    end

    local function setupPlayer(player)
        if ESP_Data[player] then return end
        local elements = {
            Lines = {
                TLH = createLine(), TLV = createLine(), TRH = createLine(), TRV = createLine(),
                BLH = createLine(), BLV = createLine(), BRH = createLine(), BRV = createLine()
            },
            Skeleton = {},
            NameTag = Instance.new("TextLabel"),
            DistanceTag = Instance.new("TextLabel"),
            HealthBg = Instance.new("Frame"),
            HealthBar = Instance.new("Frame")
        }
        for i = 1, 15 do table.insert(elements.Skeleton, createLine()) end

        local function styleLabel(label)
            label.BackgroundTransparency = 1
            label.TextColor3 = Color3.new(1, 1, 1)
            label.Font = Enum.Font.GothamBold
            label.TextStrokeTransparency = 0
            label.TextStrokeColor3 = Color3.new(0,0,0)
            label.Parent = EspGui
            label.Visible = false
        end

        styleLabel(elements.NameTag)
        styleLabel(elements.DistanceTag)

        elements.HealthBg.BackgroundColor3 = Color3.new(0, 0, 0)
        elements.HealthBg.BackgroundTransparency = 0.5
        elements.HealthBg.Parent = EspGui
        elements.HealthBar.Parent = elements.HealthBg
        ESP_Data[player] = elements
    end

    local function drawLine(line, p1, p2, thickness, color)
        local dist = (p1 - p2).Magnitude
        line.Size = UDim2.new(0, dist, 0, thickness)
        line.Position = UDim2.new(0, (p1.X + p2.X) / 2 - dist / 2, 0, (p1.Y + p2.Y) / 2 - thickness / 2)
        line.Rotation = math.atan2(p2.Y - p1.Y, p2.X - p1.X) * (180 / math.pi)
        line.BackgroundColor3 = color or Color3.new(1, 1, 1)
        line.Visible = true
    end

    local function updateESPVisuals()
        for player, e in pairs(ESP_Data) do
            local char = player.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            local hum = char and char:FindFirstChild("Humanoid")

            local skip = (player == LocalPlayer and not state.ShowSelfESP) or not player.Parent

            if skip then
                for _, l in pairs(e.Lines) do l.Visible = false end
                for _, l in pairs(e.Skeleton) do l.Visible = false end
                if e.NameTag then e.NameTag.Visible = false end
                if e.DistanceTag then e.DistanceTag.Visible = false end
                if e.HealthBg then e.HealthBg.Visible = false end
            else
                if hrp and hum and hum.Health > 0 then
                    local distance = (Camera.CFrame.Position - hrp.Position).Magnitude
                    local pos, onScreen = Camera:WorldToViewportPoint(hrp.Position)

                    if onScreen and distance <= state.RenderRange then
                        local displayColor = Color3.new(1, 1, 1)
                        local factor = 1 / (distance * (Camera.FieldOfView / 70)) * 1000
                        local w, h = 4 * factor, 6 * factor
                        local x, y = pos.X, pos.Y
                        local nameSize = math.clamp(factor * 0.4, 9, 14)
                        local thick = math.clamp(factor * 0.15, 1, 2)

                        local currentTopOffset = h/2 + 2

                        if state.ShowPlayerName then
                            e.NameTag.Visible = true
                            e.NameTag.Text = "@" .. player.Name
                            e.NameTag.TextColor3 = displayColor
                            e.NameTag.TextSize = nameSize
                            e.NameTag.Position = UDim2.new(0, x - 50, 0, y - currentTopOffset - nameSize)
                            e.NameTag.Size = UDim2.new(0, 100, 0, nameSize)
                            currentTopOffset = currentTopOffset + nameSize

                            e.DistanceTag.Visible = true
                            e.DistanceTag.Text = math.floor(distance) .. " studs"
                            e.DistanceTag.TextColor3 = Color3.new(0.7, 0.7, 0.7)
                            e.DistanceTag.TextSize = nameSize - 1
                            e.DistanceTag.Position = UDim2.new(0, x - 50, 0, y + h/2 + 2)
                            e.DistanceTag.Size = UDim2.new(0, 100, 0, nameSize)
                        else
                            e.NameTag.Visible = false
                            e.DistanceTag.Visible = false
                        end

                        if state.ShowCorneredBox then
                            local edge = w / 4
                            local function m(l, px, py, sx, sy)
                                l.Position = UDim2.new(0, px, 0, py)
                                l.Size = UDim2.new(0, sx, 0, sy)
                                l.BackgroundColor3 = displayColor
                                l.Visible = true
                            end
                            m(e.Lines.TLH, x-w/2, y-h/2, edge, thick)
                            m(e.Lines.TLV, x-w/2, y-h/2, thick, edge)
                            m(e.Lines.TRH, x+w/2-edge, y-h/2, edge, thick)
                            m(e.Lines.TRV, x+w/2, y-h/2, thick, edge)
                            m(e.Lines.BLH, x-w/2, y+h/2, edge, thick)
                            m(e.Lines.BLV, x-w/2, y+h/2-edge, thick, edge)
                            m(e.Lines.BRH, x+w/2-edge, y+h/2, edge, thick)
                            m(e.Lines.BRV, x+w/2, y+h/2-edge, thick, edge)
                        else
                            for _, l in pairs(e.Lines) do l.Visible = false end
                        end

                        if state.ShowSkeleton then
                            local rig = {
                                {"UpperTorso", "Head"}, {"UpperTorso", "LowerTorso"},
                                {"UpperTorso", "LeftUpperArm"}, {"LeftUpperArm", "LeftLowerArm"},
                                {"LeftLowerArm", "LeftHand"}, {"UpperTorso", "RightUpperArm"},
                                {"RightUpperArm", "RightLowerArm"}, {"RightLowerArm", "RightHand"},
                                {"LowerTorso", "LeftUpperLeg"}, {"LeftUpperLeg", "LeftLowerLeg"},
                                {"LeftLowerLeg", "LeftFoot"}, {"LowerTorso", "RightUpperLeg"},
                                {"RightUpperLeg", "RightLowerLeg"}, {"RightLowerLeg", "RightFoot"}
                            }
                            for i, joints in ipairs(rig) do
                                local p1, p2 = char:FindFirstChild(joints[1]), char:FindFirstChild(joints[2])
                                if p1 and p2 then
                                    local vp1 = Camera:WorldToViewportPoint(p1.Position)
                                    local vp2 = Camera:WorldToViewportPoint(p2.Position)
                                    drawLine(e.Skeleton[i], Vector2.new(vp1.X, vp1.Y), Vector2.new(vp2.X, vp2.Y), 1, Color3.new(1, 1, 1))
                                else
                                    e.Skeleton[i].Visible = false
                                end
                            end
                        else
                            for _, l in pairs(e.Skeleton) do l.Visible = false end
                        end

                        if state.ShowPlayerHealth then
                            local barW = math.clamp(factor * 0.1, 2, 4)
                            e.HealthBg.Position = UDim2.new(0, x - w/2 - (barW + 4), 0, y - h/2)
                            e.HealthBg.Size = UDim2.new(0, barW, 0, h)
                            local hp = math.clamp(hum.Health / hum.MaxHealth, 0, 1)
                            e.HealthBar.Size = UDim2.new(1, 0, hp, 0)
                            e.HealthBar.Position = UDim2.new(0, 0, 1-hp, 0)
                            e.HealthBar.BackgroundColor3 = Color3.fromHSV(hp * 0.3, 1, 1)
                            e.HealthBg.Visible = true
                        else
                            e.HealthBg.Visible = false
                        end
                    else
                        for _, l in pairs(e.Lines) do l.Visible = false end
                        for _, l in pairs(e.Skeleton) do l.Visible = false end
                        if e.NameTag then e.NameTag.Visible = false end
                        if e.DistanceTag then e.DistanceTag.Visible = false end
                        if e.HealthBg then e.HealthBg.Visible = false end
                    end
                else
                    for _, l in pairs(e.Lines) do l.Visible = false end
                    for _, l in pairs(e.Skeleton) do l.Visible = false end
                    if e.NameTag then e.NameTag.Visible = false end
                    if e.DistanceTag then e.DistanceTag.Visible = false end
                    if e.HealthBg then e.HealthBg.Visible = false end
                end
            end
        end
    end

    for _, p in ipairs(Players:GetPlayers()) do setupPlayer(p) end
    Players.PlayerAdded:Connect(setupPlayer)
    Players.PlayerRemoving:Connect(removeESP)
    RunService.RenderStepped:Connect(updateESPVisuals)

    local function ResetJumpCount()
        jumpCount = 0
    end

    local function PerformMultiJump()
        if not state.MultiJump or jumpCount >= state.MaxJumps then return end
        local character = LocalPlayer.Character
        if not character then return end
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if not humanoid then return end
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if not humanoidRootPart then return end
        local currentTime = tick()
        if currentTime - lastJumpTime < jumpCooldown then return end
        humanoidRootPart.Velocity = Vector3.new(
            humanoidRootPart.Velocity.X,
            state.JumpPower,
            humanoidRootPart.Velocity.Z
        )
        jumpCount = jumpCount + 1
        lastJumpTime = currentTime
    end

    local function UpdateJumpSystem()
        local character = LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid and humanoid.FloorMaterial ~= Enum.Material.Air then
                ResetJumpCount()
            end
        end
    end

    local speedHackConnection = nil
    local originalWalkSpeed = 16

    local function SetupSpeedHack()
        if not LocalPlayer.Character then return end
        local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if not humanoid then return end

        if speedHackConnection then
            speedHackConnection:Disconnect()
            speedHackConnection = nil
        end

        if state.SpeedHack then
            humanoid.WalkSpeed = 16 * state.SpeedMultiplier
            speedHackConnection = humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
                if state.SpeedHack and humanoid.WalkSpeed ~= 16 * state.SpeedMultiplier then
                    humanoid.WalkSpeed = 16 * state.SpeedMultiplier
                end
            end)
        else
            humanoid.WalkSpeed = originalWalkSpeed
        end
    end

    local speedHackLoopConnection = nil
    local function startSpeedHackLoop()
        if speedHackLoopConnection then speedHackLoopConnection:Disconnect() end
        if state.SpeedHack then
            speedHackLoopConnection = RunService.Heartbeat:Connect(function()
                if state.SpeedHack and LocalPlayer.Character then
                    local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                    if humanoid and humanoid.WalkSpeed ~= 16 * state.SpeedMultiplier then
                        humanoid.WalkSpeed = 16 * state.SpeedMultiplier
                    end
                end
            end)
        end
    end

    local function CreateCrosshair()
        for _, drawing in pairs(CrosshairDrawings) do drawing:Remove() end
        CrosshairDrawings = {}
        if not state.CrosshairEnabled then return end

        local screenCenter = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
        local size = state.CrosshairSize
        local gap = state.CrosshairGap
        local thickness = state.CrosshairThickness
        local rotation = math.rad(state.CrosshairRotation + crosshairRotationAngle)
        local cosRot, sinRot = math.cos(rotation), math.sin(rotation)

        local function rotatePoint(point)
            local x = point.X - screenCenter.X
            local y = point.Y - screenCenter.Y
            return Vector2.new(
                screenCenter.X + (x * cosRot - y * sinRot),
                screenCenter.Y + (x * sinRot + y * cosRot)
            )
        end

        if state.CrosshairStyle == "Cross" then
            local lines = {
                {from = Vector2.new(screenCenter.X, screenCenter.Y - size - gap), to = Vector2.new(screenCenter.X, screenCenter.Y - gap)},
                {from = Vector2.new(screenCenter.X, screenCenter.Y + size + gap), to = Vector2.new(screenCenter.X, screenCenter.Y + gap)},
                {from = Vector2.new(screenCenter.X - size - gap, screenCenter.Y), to = Vector2.new(screenCenter.X - gap, screenCenter.Y)},
                {from = Vector2.new(screenCenter.X + size + gap, screenCenter.Y), to = Vector2.new(screenCenter.X + gap, screenCenter.Y)}
            }
            for _, line in ipairs(lines) do
                local drawing = Drawing.new("Line")
                drawing.Thickness = thickness
                drawing.Color = state.CrosshairColor
                drawing.From = rotatePoint(line.from)
                drawing.To = rotatePoint(line.to)
                drawing.Visible = true
                table.insert(CrosshairDrawings, drawing)
            end
        elseif state.CrosshairStyle == "Dot" then
            local drawing = Drawing.new("Circle")
            drawing.Thickness = 1
            drawing.Color = state.CrosshairColor
            drawing.Radius = thickness
            drawing.Filled = true
            drawing.Position = screenCenter
            drawing.Visible = true
            table.insert(CrosshairDrawings, drawing)
        elseif state.CrosshairStyle == "Circle" then
            local drawing = Drawing.new("Circle")
            drawing.Thickness = thickness
            drawing.Color = state.CrosshairColor
            drawing.Radius = size
            drawing.Filled = false
            drawing.Position = screenCenter
            drawing.Visible = true
            table.insert(CrosshairDrawings, drawing)
            local dot = Drawing.new("Circle")
            dot.Thickness = 1
            dot.Color = state.CrosshairColor
            dot.Radius = 1
            dot.Filled = true
            dot.Position = screenCenter
            dot.Visible = true
            table.insert(CrosshairDrawings, dot)
        elseif state.CrosshairStyle == "Square" then
            local halfSize = size / 2
            local lines = {
                {from = Vector2.new(screenCenter.X - halfSize, screenCenter.Y - halfSize), to = Vector2.new(screenCenter.X + halfSize, screenCenter.Y - halfSize)},
                {from = Vector2.new(screenCenter.X - halfSize, screenCenter.Y + halfSize), to = Vector2.new(screenCenter.X + halfSize, screenCenter.Y + halfSize)},
                {from = Vector2.new(screenCenter.X - halfSize, screenCenter.Y - halfSize), to = Vector2.new(screenCenter.X - halfSize, screenCenter.Y + halfSize)},
                {from = Vector2.new(screenCenter.X + halfSize, screenCenter.Y - halfSize), to = Vector2.new(screenCenter.X + halfSize, screenCenter.Y + halfSize)}
            }
            for _, line in ipairs(lines) do
                local drawing = Drawing.new("Line")
                drawing.Thickness = thickness
                drawing.Color = state.CrosshairColor
                drawing.From = rotatePoint(line.from)
                drawing.To = rotatePoint(line.to)
                drawing.Visible = true
                table.insert(CrosshairDrawings, drawing)
            end
        end
    end

    local function UpdateCrosshair()
        if state.CrosshairRotationSpeed > 0 then
            local deltaTime = tick() - crosshairLastUpdate
            crosshairRotationAngle = (crosshairRotationAngle + (state.CrosshairRotationSpeed * deltaTime * 60)) % 360
            crosshairLastUpdate = tick()
        end

        local targetColor = state.CrosshairColor
        if state.CrosshairDynamic then
            local mouse = LocalPlayer:GetMouse()
            local mousePos = Vector2.new(mouse.X, mouse.Y)
            local screenCenter = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
            local closestDistance, foundEnemy = 50, false
            local localTeam = LocalPlayer.Team

            for _, player in pairs(Players:GetPlayers()) do
                if player == LocalPlayer then continue end
                if state.TeamCheck and localTeam and player.Team == localTeam then continue end
                local character = player.Character
                if not character then continue end
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if not humanoid or humanoid.Health <= 0 then continue end
                local head = character:FindFirstChild("Head")
                if not head then continue end
                local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)
                if not onScreen then continue end
                local targetPos = Vector2.new(screenPos.X, screenPos.Y)
                if (mousePos - targetPos).Magnitude < closestDistance then foundEnemy = true break end
            end
            targetColor = foundEnemy and Color3.fromRGB(255, 216, 145) or state.CrosshairColor
        end

        for _, drawing in pairs(CrosshairDrawings) do
            if drawing.Color ~= targetColor then drawing.Color = targetColor end
        end
        CreateCrosshair()
    end

    local function ClearCrosshair()
        for _, drawing in pairs(CrosshairDrawings) do drawing:Remove() end
        CrosshairDrawings = {}
        crosshairRotationAngle = 0
        crosshairLastUpdate = tick()
    end

    local function EnableNoclip()
        if not state.Noclip or isNoclipping then return end
        local character = LocalPlayer.Character
        if not character then return end
        originalCollisions = {}
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                originalCollisions[part] = part.CanCollide
                part.CanCollide = false
            end
        end
        isNoclipping = true
    end

    local function DisableNoclip()
        if not isNoclipping then return end
        local character = LocalPlayer.Character
        if character then
            for part, originalState in pairs(originalCollisions) do
                if part and part.Parent then part.CanCollide = originalState end
            end
        end
        originalCollisions = {}
        isNoclipping = false
    end

    local function UpdateNoclip()
        if state.Noclip and not isNoclipping then EnableNoclip()
        elseif not state.Noclip and isNoclipping then DisableNoclip() end
        if state.Noclip and LocalPlayer.Character then
            local character = LocalPlayer.Character
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
        end
    end

    local function saveCollisions()
        originalCollisionsInvisible = {}
        local character = LocalPlayer.Character
        if not character then return end
        for _, p in ipairs(character:GetDescendants()) do
            if p:IsA("BasePart") then originalCollisionsInvisible[p] = p.CanCollide end
        end
    end

    local function disableCollisions()
        local character = LocalPlayer.Character
        if not character then return end
        for _, p in ipairs(character:GetDescendants()) do
            if p:IsA("BasePart") then p.CanCollide = false end
        end
    end

    local function restoreCollisions()
        for p, stateVal in pairs(originalCollisionsInvisible) do
            if p and p.Parent then p.CanCollide = stateVal end
        end
        originalCollisionsInvisible = {}
    end

    local function startEmote()
        if currentEmoteTrack then currentEmoteTrack:Stop(0) end
        local id = tonumber(EMOTE_ID) or tonumber(string.match(EMOTE_ID, "%d+"))
        if not id then return end
        local animId = "rbxassetid://" .. id
        pcall(function()
            local objs = game:GetObjects(animId)
            if objs and #objs > 0 and objs[1]:IsA("Animation") then animId = objs[1].AnimationId end
        end)
        local anim = Instance.new("Animation")
        anim.AnimationId = animId
        local character = LocalPlayer.Character
        if not character then return end
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if not humanoid then return end
        local track = humanoid:LoadAnimation(anim)
        track.Priority = Enum.AnimationPriority.Action4
        track:Play(0.1, 1, 1)
        currentEmoteTrack = track
    end

    local function stopEmote()
        if currentEmoteTrack then currentEmoteTrack:Stop(0.1) currentEmoteTrack = nil end
        restoreCollisions()
    end

    local function enableInvisible()
        if invisibleEnabled then return end
        invisibleEnabled = true
        local character = LocalPlayer.Character
        if not character then return end
        invisibleCharacter = character
        invisibleHumanoid = character:FindFirstChildOfClass("Humanoid")
        saveCollisions()
        disableCollisions()
        startEmote()
    end

    local function disableInvisible()
        if not invisibleEnabled then return end
        invisibleEnabled = false
        stopEmote()
        if invisibleHumanoid then invisibleHumanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
    end

    local function SetupThirdPerson()
        if state.ThirdPersonEnabled and not tpCameraActive then
            originalCameraType = Camera.CameraType
            Camera.CameraType = Enum.CameraType.Scriptable
            tpCameraActive = true
            if state.ThirdPersonLockMouse then UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter end
        elseif not state.ThirdPersonEnabled and tpCameraActive then
            Camera.CameraType = originalCameraType
            tpCameraActive = false
            UserInputService.MouseBehavior = Enum.MouseBehavior.Default
        end
    end

    local function UpdateThirdPerson(dt)
        if not state.ThirdPersonEnabled or not tpCameraActive then return end
        local char = LocalPlayer.Character
        if not char then return end
        local rootPart = char:FindFirstChild("HumanoidRootPart")
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        if not rootPart or not humanoid then return end
        if state.ThirdPersonEnabled then
            local mouseDelta = UserInputService:GetMouseDelta()
            tpAngleX = tpAngleX - mouseDelta.X * 0.3
            tpAngleY = math.clamp(tpAngleY - mouseDelta.Y * 0.3, -60, 75)
        end
        local rotX = CFrame.Angles(0, math.rad(tpAngleX), 0)
        local rotY = CFrame.Angles(math.rad(tpAngleY), 0, 0)
        local rotation = rotX * rotY
        local rootPos = rootPart.Position + Vector3.new(0, 2, 0)
        local offset = rotation * Vector3.new(0, 0, 8)
        local targetPos = rootPos + offset
        local rayParams = RaycastParams.new()
        rayParams.FilterDescendantsInstances = {char}
        rayParams.FilterType = Enum.RaycastFilterType.Exclude
        local ray = workspace:Raycast(rootPos, offset, rayParams)
        if ray then targetPos = ray.Position - offset.Unit * 0.3 end
        tpCurrentCamPos = tpCurrentCamPos:Lerp(targetPos, 0.85)
        tpCurrentCamLook = tpCurrentCamLook:Lerp(rootPos, 0.85)
        Camera.CFrame = CFrame.lookAt(tpCurrentCamPos, tpCurrentCamLook)
        local targetCFrame = CFrame.new(rootPart.Position) * CFrame.Angles(0, math.rad(tpAngleX), 0)
        rootPart.CFrame = rootPart.CFrame:Lerp(targetCFrame, 0.3)
    end

    local function SetupFlyHack()
        if state.FlyHack and not isFlying then
            local character = LocalPlayer.Character
            if character then
                local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                if humanoidRootPart then
                    if flyBodyVelocity then flyBodyVelocity:Destroy() end
                    if flyBodyGyro then flyBodyGyro:Destroy() end
                    flyBodyVelocity = Instance.new("BodyVelocity")
                    flyBodyVelocity.Name = "FlyVelocity"
                    flyBodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
                    flyBodyVelocity.Velocity = Vector3.new(0, 0, 0)
                    flyBodyVelocity.P = 10000
                    flyBodyVelocity.Parent = humanoidRootPart
                    flyBodyGyro = Instance.new("BodyGyro")
                    flyBodyGyro.Name = "FlyGyro"
                    flyBodyGyro.MaxTorque = Vector3.new(100000, 100000, 100000)
                    flyBodyGyro.P = 10000
                    flyBodyGyro.D = 500
                    flyBodyGyro.Parent = humanoidRootPart
                    isFlying = true
                end
            end
        elseif not state.FlyHack and isFlying then
            if flyBodyVelocity then flyBodyVelocity:Destroy() flyBodyVelocity = nil end
            if flyBodyGyro then flyBodyGyro:Destroy() flyBodyGyro = nil end
            isFlying = false
        end
    end

    local function UpdateFly()
        if isFlying and state.FlyHack then
            local character = LocalPlayer.Character
            if character then
                local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                if humanoidRootPart and flyBodyVelocity and flyBodyGyro then
                    local camera = Workspace.CurrentCamera
                    local forward = camera.CFrame.LookVector
                    local right = camera.CFrame.RightVector
                    local up = Vector3.new(0, 1, 0)
                    local direction = Vector3.new(0, 0, 0)
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then direction = direction + forward end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then direction = direction - forward end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then direction = direction - right end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then direction = direction + right end
                    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then direction = direction + up end
                    if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then direction = direction - up end
                    if direction.Magnitude > 0 then direction = direction.Unit * flySpeed end
                    flyBodyVelocity.Velocity = direction
                    flyBodyGyro.CFrame = camera.CFrame
                end
            end
        end
    end

    local function SetupFOVChanger()
        if state.FOVChanger then Camera.FieldOfView = state.FOVValue else Camera.FieldOfView = state.DefaultFOV end
    end

    local function ActivateAnticheatBypass()
        pcall(function()
            if hookfunction then
                local oldkick = LocalPlayer.Kick
                hookfunction(LocalPlayer.Kick, function(self, ...)
                    if self == LocalPlayer then return end
                    return oldkick(self, ...)
                end)
                pcall(function()
                    local remote = ReplicatedStorage:FindFirstChild("Remotes")
                    if remote then
                        local analytics = remote:FindFirstChild("AnalyticsPipeline")
                        if analytics then analytics:Destroy() end
                    end
                end)
            end
        end)
    end

    local function isPlayerInFOV(player)
        if not player or not player.Character then return false end
        local head = player.Character:FindFirstChild("Head")
        if not head then return false end
        local headPos, onScreen = Camera:WorldToViewportPoint(head.Position)
        if not onScreen then return false end
        local screenCenter = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
        return (Vector2.new(headPos.X, headPos.Y) - screenCenter).Magnitude <= silentAimFOV
    end

    local function getClosestPlayerToMouse()
        local closestPlayer = nil
        local shortestDistance = math.huge
        local mousePosition = UserInputService:GetMouseLocation()
        local screenCenter = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                local head = player.Character:FindFirstChild("Head")
                if head then
                    local headPos, onScreen = Camera:WorldToViewportPoint(head.Position)
                    if onScreen then
                        local screenPosition = Vector2.new(headPos.X, headPos.Y)
                        if (screenPosition - screenCenter).Magnitude <= silentAimFOV then
                            local distanceToMouse = (screenPosition - mousePosition).Magnitude
                            if distanceToMouse < shortestDistance then
                                shortestDistance = distanceToMouse
                                closestPlayer = player
                            end
                        end
                    end
                end
            end
        end
        return closestPlayer
    end

    local function lockCameraToHead()
        if targetPlayer and targetPlayer.Character then
            local head = targetPlayer.Character:FindFirstChild("Head")
            if head then
                if isPlayerInFOV(targetPlayer) then
                    Camera.CFrame = CFrame.new(Camera.CFrame.Position, head.Position)
                else
                    targetPlayer = getClosestPlayerToMouse()
                end
            else
                targetPlayer = getClosestPlayerToMouse()
            end
        else
            targetPlayer = getClosestPlayerToMouse()
        end
    end

    local function isLobbyVisible()
        local success, result = pcall(function()
            return LocalPlayer.PlayerGui.MainGui.MainFrame.Lobby.Currency.Visible == true
        end)
        return success and result or false
    end

    local function autoClick()
        if autoClickConnection then autoClickConnection:Disconnect() end
        autoClickConnection = RunService.Heartbeat:Connect(function()
            if (isLeftMouseDown or isRightMouseDown) and not isLobbyVisible() then
                mouse1click()
            elseif not (isLeftMouseDown or isRightMouseDown) then
                autoClickConnection:Disconnect()
                autoClickConnection = nil
            end
        end)
    end

    UserInputService.InputBegan:Connect(function(input, isProcessed)
        if not silentAimEnabled then return end
        if isProcessed then return end
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            if not isLeftMouseDown then isLeftMouseDown = true autoClick() end
        elseif input.UserInputType == Enum.UserInputType.MouseButton2 then
            if not isRightMouseDown then isRightMouseDown = true autoClick() end
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if not silentAimEnabled then return end
        if input.UserInputType == Enum.UserInputType.MouseButton1 then isLeftMouseDown = false
        elseif input.UserInputType == Enum.UserInputType.MouseButton2 then isRightMouseDown = false end
    end)

    local silentAimConnection = nil
    local function startSilentAim()
        if silentAimConnection then silentAimConnection:Disconnect() end
        silentAimConnection = RunService.Heartbeat:Connect(function()
            if silentAimEnabled and not isLobbyVisible() then
                targetPlayer = getClosestPlayerToMouse()
                if targetPlayer then lockCameraToHead() end
            end
        end)
    end

    local function stopSilentAim()
        if silentAimConnection then silentAimConnection:Disconnect() silentAimConnection = nil end
        targetPlayer = nil
        isLeftMouseDown = false
        isRightMouseDown = false
        if autoClickConnection then autoClickConnection:Disconnect() autoClickConnection = nil end
    end

    local function UpdateSilentAimFOVCircles()
        SilentAimFOVCircle.Radius = silentAimFOV
        SilentAimFOVCircle.Position = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
        SilentAimGlowCircle.Radius = silentAimFOV
        SilentAimGlowCircle.Position = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
        if showSilentAimFOV and silentAimEnabled then
            SilentAimFOVCircle.Visible = true
            SilentAimGlowCircle.Visible = silentAimGlowFOV
        else
            SilentAimFOVCircle.Visible = false
            SilentAimGlowCircle.Visible = false
        end
    end

    local function UpdateRainbowSilentAimCircle()
        if showSilentAimFOV and silentAimEnabled and silentAimRainbowFOV then
            silentAimRainbowHue = (silentAimRainbowHue + 0.01) % 1
            local rainbowColor = Color3.fromHSV(silentAimRainbowHue, 1, 1)
            SilentAimFOVCircle.Color = rainbowColor
            if silentAimGlowFOV then SilentAimGlowCircle.Color = rainbowColor end
        elseif showSilentAimFOV and silentAimEnabled then
            SilentAimFOVCircle.Color = Color3.fromRGB(255, 216, 145)
            if silentAimGlowFOV then SilentAimGlowCircle.Color = Color3.fromRGB(255, 216, 145) end
        end
    end

    local function GetClosestPlayerToCrosshair()
        local closestPlayer = nil
        local closestDistance = math.huge
        local screenCenter = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
        local localTeam = LocalPlayer.Team
        for _, player in pairs(Players:GetPlayers()) do
            if player == LocalPlayer then continue end
            if state.SnapLineTeamCheck and localTeam and player.Team == localTeam then continue end
            local character = player.Character
            if not character or not character:FindFirstChild("Humanoid") then continue end
            if character.Humanoid.Health <= 0 then continue end
            local head = character:FindFirstChild("Head")
            if not head then continue end
            local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)
            if not onScreen then continue end
            local targetPos = Vector2.new(screenPos.X, screenPos.Y)
            local distance = (screenCenter - targetPos).Magnitude
            if distance < closestDistance then
                closestDistance = distance
                closestPlayer = { Player = player, Part = head, ScreenPos = targetPos, WorldPos = head.Position }
            end
        end
        return closestPlayer
    end

    local function UpdateSnapLine()
        if not state.SnapLine then SnapLineDrawing.Visible = false return end
        local closestPlayer = GetClosestPlayerToCrosshair()
        if not closestPlayer then SnapLineDrawing.Visible = false return end
        local screenCenter = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
        SnapLineDrawing.From = closestPlayer.ScreenPos
        SnapLineDrawing.To = screenCenter
        SnapLineDrawing.Color = state.SnapLineColor
        SnapLineDrawing.Thickness = state.SnapLineThickness
        SnapLineDrawing.Visible = true
    end

    local function GetClosestPlayer()
        if not state.Aimbot then return nil end
        local closestPlayer, closestDistance = nil, state.AimbotFOV
        local localTeam, mousePos = LocalPlayer.Team, UserInputService:GetMouseLocation()
        for _, player in pairs(Players:GetPlayers()) do
            if player == LocalPlayer then continue end
            if state.TeamCheck and localTeam and player.Team == localTeam then continue end
            local character = player.Character
            if not character or not character:FindFirstChild("Humanoid") then continue end
            if character.Humanoid.Health <= 0 then continue end
            local head = character:FindFirstChild("Head")
            if not head then continue end
            local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)
            if not onScreen then continue end
            local targetPos = Vector2.new(screenPos.X, screenPos.Y)
            local distance = (mousePos - targetPos).Magnitude
            if distance < closestDistance then
                closestDistance = distance
                closestPlayer = { Player = player, Part = head, ScreenPos = targetPos }
            end
        end
        return closestPlayer
    end

    local function GetRagebotTarget()
        local closestPlayer, closestDistance = nil, state.RagebotFOV
        local localTeam = LocalPlayer.Team
        for _, player in pairs(Players:GetPlayers()) do
            if player == LocalPlayer then continue end
            if state.TeamCheck and localTeam and player.Team == localTeam then continue end
            local character = player.Character
            if not character or not character:FindFirstChild("Humanoid") then continue end
            if character.Humanoid.Health <= 0 then continue end
            local head = character:FindFirstChild("Head")
            if not head then continue end
            local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)
            if not onScreen then continue end
            local targetPos = Vector2.new(screenPos.X, screenPos.Y)
            local screenCenter = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
            local distance = (screenCenter - targetPos).Magnitude
            if distance < closestDistance then
                closestDistance = distance
                closestPlayer = { Player = player, Part = head, ScreenPos = targetPos, WorldPos = head.Position }
            end
        end
        return closestPlayer
    end

    local function FireRagebot()
        if not state.Ragebot then return end
        local shouldBeActive = (state.RagebotKey == "Always On") and true or ragebotActive
        if not shouldBeActive then return end
        local currentTime = tick()
        if currentTime - lastRagebotFireTime < ragebotFireDelay then return end
        local target = GetRagebotTarget()
        if target then
            local screenPos, onScreen = Camera:WorldToViewportPoint(target.WorldPos)
            if onScreen then
                local currentMousePos = UserInputService:GetMouseLocation()
                local delta = Vector2.new(screenPos.X, screenPos.Y) - currentMousePos
                local smoothDelta = delta * (1 - state.RagebotSmoothness)
                mousemoverel(smoothDelta.X, smoothDelta.Y)
                mouse1click()
                lastRagebotFireTime = currentTime
            end
        end
    end

    local function GetTargetInTriggerBotFOV()
        local closestTarget, closestDistance = nil, state.TriggerBotFOV
        local screenCenter, localTeam = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2), LocalPlayer.Team
        for _, player in pairs(Players:GetPlayers()) do
            if player == LocalPlayer then continue end
            if state.TriggerBotTeamCheck and localTeam and player.Team == localTeam then continue end
            local character = player.Character
            if not character or not character:FindFirstChild("Humanoid") then continue end
            if character.Humanoid.Health <= 0 then continue end
            local head = character:FindFirstChild("Head")
            if not head then continue end
            local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)
            if not onScreen then continue end
            local targetPos = Vector2.new(screenPos.X, screenPos.Y)
            local distance = (screenCenter - targetPos).Magnitude
            if distance < closestDistance then
                closestDistance = distance
                closestTarget = { Player = player, Part = head, ScreenPos = targetPos, WorldPos = head.Position }
            end
        end
        return closestTarget
    end

    local function FireTriggerBot()
        if not state.TriggerBot or not triggerBotActive then return end
        if tick() - lastTriggerTime < state.TriggerBotDelay then return end
        local target = GetTargetInTriggerBotFOV()
        if target then
            mouse1click()
            lastTriggerTime = tick()
        end
    end

    local function UpdateRainbowRagebotCircle()
        if state.ShowRagebotFOV and state.Ragebot then
            rainbowHue = (rainbowHue + rainbowSpeed) % 1
            RagebotFOVCircle.Color = Color3.fromHSV(rainbowHue, 1, 1)
            RagebotFOVCircle.Visible = true
        else
            RagebotFOVCircle.Visible = false
        end
    end

    local function UpdateGlowAimbotCircle()
        if state.GlowFOV and state.ShowFOV and state.Aimbot then
            GlowFOVCircle.Visible = true
            GlowFOVCircle.Radius = state.AimbotFOV
            GlowFOVCircle.Position = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
            GlowFOVCircle.Color = AimbotFOVCircle.Color
        else
            GlowFOVCircle.Visible = false
        end
    end

    local MainWindow = OrionLib:MakeWindow({
        Name = "ORVEX • Rivals",
        HidePremium = false,
        SaveConfig = true,
        IntroEnabled = false,
        ConfigFolder = "ORVEXRivals",
    })

    local function Notify(title, content, duration)
        OrionLib:MakeNotification({
            Name = title or "ORVEX",
            Content = content or "",
            Image = "rbxassetid://4483345998",
            Time = duration or 3
        })
    end

    local InfoTab = MainWindow:MakeTab({
        Name = "Info",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    InfoTab:AddParagraph("Rivals Cheat", [[Exclusive Cheat!

FEATURES:
• Ragebot - OP Mode with adjustable FOV & Smoothness!
• Rainbow Ragebot FOV Circle - Colorful effect!
• Silent Aim - Automatically hits targets in FOV!
• Silent Aim FOV Circle - With Rainbow & Filled options!
• Server Hop - Switch to a different server
• Reset Character - Kill and respawn your character
• Unload Settings - Reset all settings to default
• Multi Jump - Jump multiple times in air!
• Accurate Crosshair - 4 perfect styles
• Invisible Mode - Become invisible to other players
• SpeedHack - Increase your movement speed!
• Anticheat Bypass - Automatically activated

CONTROLS:
• WASD = Movement (also in Fly Mode)
• Space = Jump / Multi Jump (when enabled)
• Shift = Down (Fly Mode)
• Right Click = Aimbot, TriggerBot & Silent Aim
• Ragebot can be set to Always On or keybind
• Insert = Destroy UI]])

    local function ServerHop()
        Notify("Server Hop", "Searching for new server...", 2)
        local placeId, jobId = game.PlaceId, game.JobId
        for _ = 1, 10 do
            local success, result = pcall(function() return game:HttpGet("https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?limit=100") end)
            if success then
                local decoded = game:GetService("HttpService"):JSONDecode(result)
                local servers = {}
                for _, server in ipairs(decoded.data) do
                    if server.playing < server.maxPlayers and server.id ~= jobId then table.insert(servers, server.id) end
                end
                if #servers > 0 then
                    TeleportService:TeleportToPlaceInstance(placeId, servers[math.random(1, #servers)], LocalPlayer)
                    return
                end
            end
            task.wait(1)
        end
        Notify("Server Hop Failed", "Could not find a new server. Try again later.", 3)
    end

    local function ResetCharacter()
        local character = LocalPlayer.Character
        if not character then 
            Notify("Error", "No character found to reset!", 3)
            return 
        end
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if not humanoid then 
            Notify("Error", "No humanoid found!", 3)
            return 
        end

        local wasFlying = state.FlyHack
        local wasNoclipping = state.Noclip
        local wasInvisible = state.Invisible
        local wasSilentAim = state.SilentAimEnabled

        if wasFlying then state.FlyHack = false SetupFlyHack() end
        if wasNoclipping then state.Noclip = false DisableNoclip() end
        if wasInvisible then state.Invisible = false disableInvisible() end
        if wasSilentAim then state.SilentAimEnabled = false stopSilentAim() end

        local success, err = pcall(function() humanoid.Health = 0 end)
        if success then
            Notify("Character Reset", "Your character has been reset!", 3)
            task.spawn(function()
                repeat task.wait(0.5) character = LocalPlayer.Character until character and character:FindFirstChildOfClass("Humanoid")
                if wasFlying then task.wait(1) state.FlyHack = true SetupFlyHack() end
                if wasNoclipping then task.wait(1) state.Noclip = true end
                if wasInvisible then task.wait(1) state.Invisible = true enableInvisible() end
                if wasSilentAim then task.wait(1) state.SilentAimEnabled = true startSilentAim() end
            end)
        else
            Notify("Reset Failed", "Could not reset character: " .. tostring(err), 3)
        end
    end

    local function UnloadAllSettings()
        state.SpeedHack = false
        state.FlyHack = false
        state.Noclip = false
        state.MultiJump = false
        state.Invisible = false
        state.FOVChanger = false
        state.ThirdPersonEnabled = false
        state.CrosshairEnabled = false
        state.Aimbot = false
        state.Ragebot = false
        state.GlowFOV = false
        state.ShowPlayerName = false
        state.ShowPlayerHealth = false
        state.ShowSkeleton = false
        state.ShowCorneredBox = false
        state.ShowSelfESP = false
        state.TriggerBot = false
        state.SnapLine = false
        state.Spinbot = false
        state.SilentAimEnabled = false
        state.ShowSilentAimFOV = false
        state.SilentAimGlowFOV = false
        state.SilentAimRainbowFOV = false

        state.SpeedMultiplier = 15
        state.JumpPower = 50
        state.MaxJumps = 2
        state.AimbotFOV = 120
        state.AimbotSmoothness = 0.5
        state.RagebotFOV = 300
        state.RagebotSmoothness = 0.8
        state.TriggerBotDelay = 0.05
        state.TriggerBotFOV = 50
        state.SpinbotSpeed = 10
        state.RenderRange = 500
        state.SilentAimFOV = 300
        state.FOVValue = 70
        state.CrosshairStyle = "Cross"
        state.CrosshairSize = 12
        state.CrosshairThickness = 1
        state.CrosshairGap = 4
        state.CrosshairRotation = 0
        state.CrosshairRotationSpeed = 0
        state.CrosshairDynamic = false
        state.SnapLineColor = Color3.fromRGB(255, 216, 145)
        state.CrosshairColor = Color3.fromRGB(255, 255, 255)

        SetupSpeedHack()
        startSpeedHackLoop()
        SetupFlyHack()
        DisableNoclip()
        disableInvisible()
        SetupThirdPerson()
        SetupFOVChanger()
        ClearCrosshair()
        stopSilentAim()

        AimbotFOVCircle.Visible = false
        GlowFOVCircle.Visible = false
        RagebotFOVCircle.Visible = false
        TriggerBotFOVCircle.Visible = false
        SnapLineDrawing.Visible = false
        SilentAimFOVCircle.Visible = false
        SilentAimGlowCircle.Visible = false

        if speedHackConnection then speedHackConnection:Disconnect() speedHackConnection = nil end
        if speedHackLoopConnection then speedHackLoopConnection:Disconnect() speedHackLoopConnection = nil end

        pcall(function()
            local flagsToReset = {
                "MultiJump", "SpeedHack", "FlyHack", "Noclip", "Invisible",
                "FOVChanger", "ThirdPerson", "CrosshairEnabled",
                "Aimbot", "Ragebot", "GlowFOV", "ShowPlayerName", "ShowPlayerHealth", "ShowSkeleton",
                "ShowCorneredBox", "ShowSelfESP", "TriggerBot", "SnapLine", "Spinbot",
                "ShowFOV", "ShowRagebotFOV", "TriggerBotShowFOV", "AimbotTeamCheck",
                "TriggerBotTeamCheck", "SnapLineTeamCheck", "CrosshairDynamic",
                "SilentAimEnabled", "ShowSilentAimFOV", "SilentAimGlowFOV", "SilentAimRainbowFOV"
            }
            for _, flagName in ipairs(flagsToReset) do
                if OrionLib.Flags and OrionLib.Flags[flagName] and OrionLib.Flags[flagName].Set then
                    OrionLib.Flags[flagName]:Set(false)
                end
            end
            local slidersToReset = {
                {flag = "SpeedMultiplier", value = 15},
                {flag = "JumpPower", value = 50},
                {flag = "MaxJumps", value = 2},
                {flag = "FlySpeed", value = 25},
                {flag = "FOVValue", value = 5},
                {flag = "AimbotFOV", value = 120},
                {flag = "AimbotSmoothness", value = 0.5},
                {flag = "RagebotFOV", value = 300},
                {flag = "RagebotSmoothness", value = 0.8},
                {flag = "TriggerBotFOV", value = 50},
                {flag = "TriggerBotDelay", value = 0.05},
                {flag = "SpinbotSpeed", value = 10},
                {flag = "CrosshairSize", value = 12},
                {flag = "CrosshairThickness", value = 1},
                {flag = "CrosshairGap", value = 4},
                {flag = "CrosshairRotation", value = 0},
                {flag = "CrosshairRotationSpeed", value = 0},
                {flag = "SnapLineThickness", value = 2},
                {flag = "RenderRange", value = 500},
                {flag = "SilentAimFOV", value = 300}
            }
            for _, sliderData in ipairs(slidersToReset) do
                if OrionLib.Flags and OrionLib.Flags[sliderData.flag] and OrionLib.Flags[sliderData.flag].Set then
                    OrionLib.Flags[sliderData.flag]:Set(sliderData.value)
                end
            end
            if OrionLib.Flags and OrionLib.Flags.CrosshairStyle and OrionLib.Flags.CrosshairStyle.Set then
                OrionLib.Flags.CrosshairStyle:Set("Cross")
            end
            if OrionLib.Flags and OrionLib.Flags.AimbotKey and OrionLib.Flags.AimbotKey.Set then
                OrionLib.Flags.AimbotKey:Set("MouseButton2")
            end
            if OrionLib.Flags and OrionLib.Flags.RagebotKey and OrionLib.Flags.RagebotKey.Set then
                OrionLib.Flags.RagebotKey:Set("Always On")
            end
            if OrionLib.Flags and OrionLib.Flags.TriggerBotKey and OrionLib.Flags.TriggerBotKey.Set then
                OrionLib.Flags.TriggerBotKey:Set("MouseButton2")
            end
            if OrionLib.Flags and OrionLib.Flags.SnapLineColor and OrionLib.Flags.SnapLineColor.Set then
                OrionLib.Flags.SnapLineColor:Set(Color3.fromRGB(255, 216, 145))
            end
            if OrionLib.Flags and OrionLib.Flags.CrosshairColor and OrionLib.Flags.CrosshairColor.Set then
                OrionLib.Flags.CrosshairColor:Set(Color3.fromRGB(255, 255, 255))
            end
        end)

        Notify("Settings Unloaded", "All settings have been reset to default! All toggles are now OFF.", 3)
    end

    InfoTab:AddButton({ Name = "Server Hop", Callback = ServerHop })
    InfoTab:AddButton({ Name = "Reset Character", Callback = ResetCharacter })
    InfoTab:AddButton({ Name = "Unload Settings", Callback = UnloadAllSettings })
    InfoTab:AddButton({
        Name = "Join Discord",
        Callback = function()
            setclipboard("https://discord.gg/WzS5JfAx8C")
            Notify("Discord Link", "Discord Link copied to clipboard!", 5)
        end
    })

    local PlayerTab = MainWindow:MakeTab({ Name = "Player", Icon = "rbxassetid://4483345998", PremiumOnly = false })
    PlayerTab:AddParagraph("Player Modifications", [[MULTI JUMP: Jump multiple times in the air!
SPEEDHACK: 1-15x multiplier
FLYHACK: Fly through the map with WASD + Space/Shift
NOCLIP: Walk through walls
INVISIBLE: Become invisible to other players]])
    PlayerTab:AddToggle({ Name = "Enable Multi Jump", Default = false, Flag = "MultiJump", Save = true, Callback = function(Value) state.MultiJump = Value; multiJumpActive = Value; if not Value then jumpCount = 0 end end })
    PlayerTab:AddSlider({ Name = "Jump Power (30-100)", Min = 30, Max = 100, Default = 50, Increment = 5, Flag = "JumpPower", Save = true, Callback = function(Value) state.JumpPower = Value end })
    PlayerTab:AddSlider({ Name = "Max Jumps (2-10)", Min = 2, Max = 10, Default = 2, Increment = 1, Flag = "MaxJumps", Save = true, Callback = function(Value) state.MaxJumps = Value end })
    PlayerTab:AddToggle({ Name = "Enable SpeedHack (1-15x)", Default = false, Flag = "SpeedHack", Save = true, Callback = function(Value) state.SpeedHack = Value; SetupSpeedHack(); startSpeedHackLoop() end })
    PlayerTab:AddSlider({ Name = "Speed Multiplier (1-15x)", Min = 1, Max = 15, Default = 15, Increment = 1, Flag = "SpeedMultiplier", Save = true, Callback = function(Value) state.SpeedMultiplier = Value; if state.SpeedHack then SetupSpeedHack() end end })
    PlayerTab:AddToggle({ Name = "Enable FlyHack", Default = false, Flag = "FlyHack", Save = true, Callback = function(Value) state.FlyHack = Value; SetupFlyHack() end })
    PlayerTab:AddSlider({ Name = "Fly Speed", Min = 10, Max = 100, Default = 25, Increment = 5, Flag = "FlySpeed", Save = true, Callback = function(Value) flySpeed = Value end })
    PlayerTab:AddToggle({ Name = "Enable Noclip", Default = false, Flag = "Noclip", Save = true, Callback = function(Value) state.Noclip = Value end })
    PlayerTab:AddToggle({ Name = "Invisible Mode", Default = false, Flag = "Invisible", Save = true, Callback = function(Value) state.Invisible = Value; if Value then enableInvisible() else disableInvisible() end end })

    local AimbotTab = MainWindow:MakeTab({ Name = "Aimbot", Icon = "rbxassetid://4483345998", PremiumOnly = false })
    AimbotTab:AddParagraph("RAGEBOT - OP Mode", "Ragebot combines Aimbot + Triggerbot in one OP package!")
    AimbotTab:AddToggle({ Name = "Enable Ragebot", Default = false, Flag = "Ragebot", Save = true, Callback = function(Value) state.Ragebot = Value end })
    AimbotTab:AddSlider({ Name = "Ragebot Smoothness", Min = 0, Max = 1, Default = 0.8, Increment = 0.05, Flag = "RagebotSmoothness", Save = true, Callback = function(Value) state.RagebotSmoothness = Value end })
    AimbotTab:AddSlider({ Name = "Ragebot FOV Size", Min = 50, Max = 800, Default = 300, Increment = 10, Flag = "RagebotFOV", Save = true, Callback = function(Value) state.RagebotFOV = Value; RagebotFOVCircle.Radius = Value end })
    AimbotTab:AddToggle({ Name = "Show Ragebot FOV Circle (RAINBOW)", Default = true, Flag = "ShowRagebotFOV", Save = true, Callback = function(Value) state.ShowRagebotFOV = Value end })
    AimbotTab:AddDropdown({ Name = "Ragebot Keybind", Options = {"Always On", "MouseButton2", "MouseButton1", "Q", "E", "F", "LeftShift", "LeftControl"}, Default = "Always On", Flag = "RagebotKey", Save = true, Callback = function(Value) state.RagebotKey = Value end })
    AimbotTab:AddParagraph("Standard Aimbot Settings", "")
    AimbotTab:AddToggle({ Name = "Enable Aimbot", Default = false, Flag = "Aimbot", Save = true, Callback = function(Value) state.Aimbot = Value end })
    AimbotTab:AddSlider({ Name = "Aimbot FOV", Min = 10, Max = 500, Default = 120, Increment = 5, Flag = "AimbotFOV", Save = true, Callback = function(Value) state.AimbotFOV = Value; AimbotFOVCircle.Radius = Value; GlowFOVCircle.Radius = Value end })
    AimbotTab:AddSlider({ Name = "Aimbot Smoothness", Min = 0.1, Max = 1.0, Default = 0.5, Increment = 0.05, Flag = "AimbotSmoothness", Save = true, Callback = function(Value) state.AimbotSmoothness = Value end })
    AimbotTab:AddToggle({ Name = "Show FOV Circle", Default = true, Flag = "ShowFOV", Save = true, Callback = function(Value) state.ShowFOV = Value end })
    AimbotTab:AddToggle({ Name = "Glow FOV Circle (Filled)", Default = false, Flag = "GlowFOV", Save = true, Callback = function(Value) state.GlowFOV = Value end })
    AimbotTab:AddToggle({ Name = "Team Check", Default = true, Flag = "AimbotTeamCheck", Save = true, Callback = function(Value) state.TeamCheck = Value end })
    AimbotTab:AddDropdown({ Name = "Aimbot Keybind", Options = {"MouseButton2", "MouseButton1", "Q", "E", "F", "LeftShift", "LeftControl"}, Default = "MouseButton2", Flag = "AimbotKey", Save = true, Callback = function(Value) state.AimbotKey = Value end })

    local VisualsTab = MainWindow:MakeTab({ Name = "Visuals", Icon = "rbxassetid://4483345998", PremiumOnly = false })
    VisualsTab:AddToggle({ Name = "Show Player Name", Default = false, Flag = "ShowPlayerName", Save = true, Callback = function(Value) state.ShowPlayerName = Value end })
    VisualsTab:AddToggle({ Name = "Show Player Health", Default = false, Flag = "ShowPlayerHealth", Save = true, Callback = function(Value) state.ShowPlayerHealth = Value end })
    VisualsTab:AddToggle({ Name = "Show Skeleton", Default = false, Flag = "ShowSkeleton", Save = true, Callback = function(Value) state.ShowSkeleton = Value end })
    VisualsTab:AddToggle({ Name = "Show Cornered Box", Default = false, Flag = "ShowCorneredBox", Save = true, Callback = function(Value) state.ShowCorneredBox = Value end })
    VisualsTab:AddToggle({ Name = "Show Self ESP", Default = false, Flag = "ShowSelfESP", Save = true, Callback = function(Value) state.ShowSelfESP = Value end })
    VisualsTab:AddSlider({ Name = "Render Range", Min = 100, Max = 2000, Default = 500, Increment = 50, Flag = "RenderRange", Save = true, Callback = function(Value) state.RenderRange = Value end })

    local TriggerBotTab = MainWindow:MakeTab({ Name = "TriggerBot", Icon = "rbxassetid://4483345998", PremiumOnly = false })
    TriggerBotTab:AddToggle({ Name = "Enable TriggerBot", Default = false, Flag = "TriggerBot", Save = true, Callback = function(Value) state.TriggerBot = Value end })
    TriggerBotTab:AddSlider({ Name = "TriggerBot FOV", Min = 10, Max = 200, Default = 50, Increment = 5, Flag = "TriggerBotFOV", Save = true, Callback = function(Value) state.TriggerBotFOV = Value; TriggerBotFOVCircle.Radius = Value end })
    TriggerBotTab:AddSlider({ Name = "Shot Delay (Seconds)", Min = 0.01, Max = 0.5, Default = 0.05, Increment = 0.01, Flag = "TriggerBotDelay", Save = true, Callback = function(Value) state.TriggerBotDelay = Value end })
    TriggerBotTab:AddToggle({ Name = "Team Check", Default = true, Flag = "TriggerBotTeamCheck", Save = true, Callback = function(Value) state.TriggerBotTeamCheck = Value end })
    TriggerBotTab:AddToggle({ Name = "Show FOV Circle", Default = true, Flag = "TriggerBotShowFOV", Save = true, Callback = function(Value) TriggerBotFOVCircle.Visible = Value and state.TriggerBot end })
    TriggerBotTab:AddDropdown({ Name = "TriggerBot Keybind", Options = {"MouseButton2", "MouseButton1", "Q", "E", "F", "LeftShift", "LeftControl", "Toggle"}, Default = "MouseButton2", Flag = "TriggerBotKey", Save = true, Callback = function(Value) state.TriggerBotKey = Value; triggerBotActive = false end })

    local SilentAimTab = MainWindow:MakeTab({ Name = "Silent Aim", Icon = "rbxassetid://4483345998", PremiumOnly = false })
    SilentAimTab:AddParagraph("Silent Aim - Auto Target Lock", [[Automatic target locking based on mouse position!

How it works:
• Detects the closest player to your mouse cursor
• Only targets players within the FOV Circle
• Automatically locks onto the target's head
• Auto-click feature when holding mouse buttons]])
    SilentAimTab:AddToggle({ Name = "Enable Silent Aim", Default = false, Flag = "SilentAimEnabled", Save = true, Callback = function(Value) state.SilentAimEnabled = Value; silentAimEnabled = Value; if Value then startSilentAim() else stopSilentAim() end end })
    SilentAimTab:AddSlider({ Name = "Silent Aim FOV Size", Min = 50, Max = 800, Default = 300, Increment = 10, Flag = "SilentAimFOV", Save = true, Callback = function(Value) state.SilentAimFOV = Value; silentAimFOV = Value; SilentAimFOVCircle.Radius = Value; SilentAimGlowCircle.Radius = Value end })
    SilentAimTab:AddToggle({ Name = "Show FOV Circle", Default = false, Flag = "ShowSilentAimFOV", Save = true, Callback = function(Value) state.ShowSilentAimFOV = Value; showSilentAimFOV = Value end })
    SilentAimTab:AddToggle({ Name = "Rainbow FOV Circle", Default = false, Flag = "SilentAimRainbowFOV", Save = true, Callback = function(Value) state.SilentAimRainbowFOV = Value; silentAimRainbowFOV = Value end })
    SilentAimTab:AddToggle({ Name = "Glow FOV Circle (Filled)", Default = false, Flag = "SilentAimGlowFOV", Save = true, Callback = function(Value) state.SilentAimGlowFOV = Value; silentAimGlowFOV = Value end })

    local SnapLineTab = MainWindow:MakeTab({ Name = "Snap Line", Icon = "rbxassetid://4483345998", PremiumOnly = false })
    SnapLineTab:AddToggle({ Name = "Enable Snap Line", Default = false, Flag = "SnapLine", Save = true, Callback = function(Value) state.SnapLine = Value end })
    SnapLineTab:AddColorpicker({ Name = "Line Color", Default = Color3.fromRGB(255, 216, 145), Flag = "SnapLineColor", Save = true, Callback = function(Value) state.SnapLineColor = Value; SnapLineDrawing.Color = Value end })
    SnapLineTab:AddSlider({ Name = "Line Thickness", Min = 1, Max = 10, Default = 2, Increment = 1, Flag = "SnapLineThickness", Save = true, Callback = function(Value) state.SnapLineThickness = Value; SnapLineDrawing.Thickness = Value end })
    SnapLineTab:AddToggle({ Name = "Team Check", Default = true, Flag = "SnapLineTeamCheck", Save = true, Callback = function(Value) state.SnapLineTeamCheck = Value end })

    local SpinbotTab = MainWindow:MakeTab({ Name = "Spinbot", Icon = "rbxassetid://4483345998", PremiumOnly = false })
    SpinbotTab:AddToggle({ Name = "Enable Spinbot", Default = false, Flag = "Spinbot", Save = true, Callback = function(Value) state.Spinbot = Value end })
    SpinbotTab:AddSlider({ Name = "Spinbot Speed", Min = 1, Max = 50, Default = 10, Increment = 1, Flag = "SpinbotSpeed", Save = true, Callback = function(Value) state.SpinbotSpeed = Value end })

    local DeviceTab = MainWindow:MakeTab({ Name = "Device Spoof", Icon = "rbxassetid://4483345998", PremiumOnly = false })
    DeviceTab:AddButton({ Name = "Spoof as PC (Mouse & Keyboard)", Callback = function() pcall(function() game:GetService('ReplicatedStorage').Remotes.Replication.Fighter.SetControls:FireServer("MouseKeyboard") end) end })
    DeviceTab:AddButton({ Name = "Spoof as Mobile (Touch)", Callback = function() pcall(function() game:GetService('ReplicatedStorage').Remotes.Replication.Fighter.SetControls:FireServer("Touch") end) end })
    DeviceTab:AddButton({ Name = "Spoof as Console (Gamepad)", Callback = function() pcall(function() game:GetService('ReplicatedStorage').Remotes.Replication.Fighter.SetControls:FireServer("Gamepad") end) end })
    DeviceTab:AddButton({ Name = "Spoof as VR (VR)", Callback = function() pcall(function() game:GetService('ReplicatedStorage').Remotes.Replication.Fighter.SetControls:FireServer("VR") end) end })

    local MiscTab = MainWindow:MakeTab({ Name = "Misc", Icon = "rbxassetid://4483345998", PremiumOnly = false })
    MiscTab:AddToggle({ Name = "Enable Third Person", Default = false, Flag = "ThirdPerson", Save = true, Callback = function(Value) state.ThirdPersonEnabled = Value; SetupThirdPerson() end })
    MiscTab:AddToggle({ Name = "Enable FOV Changer", Default = false, Flag = "FOVChanger", Save = true, Callback = function(Value) state.FOVChanger = Value; SetupFOVChanger() end })
    MiscTab:AddSlider({ Name = "FOV Value (0-20, 5 = Normal 70)", Min = 0, Max = 20, Default = 5, Increment = 1, Flag = "FOVValue", Save = true, Callback = function(Value) state.FOVValue = 30 + (Value * 6); if state.FOVChanger then SetupFOVChanger() end end })
    MiscTab:AddToggle({ Name = "Enable Custom Crosshair", Default = false, Flag = "CrosshairEnabled", Save = true, Callback = function(Value) state.CrosshairEnabled = Value; if Value then CreateCrosshair() else ClearCrosshair() end end })
    MiscTab:AddDropdown({ Name = "Crosshair Style", Options = {"Cross", "Dot", "Circle", "Square"}, Default = "Cross", Flag = "CrosshairStyle", Save = true, Callback = function(Value) state.CrosshairStyle = Value; if state.CrosshairEnabled then CreateCrosshair() end end })
    MiscTab:AddColorpicker({ Name = "Crosshair Color", Default = Color3.fromRGB(255, 255, 255), Flag = "CrosshairColor", Save = true, Callback = function(Value) state.CrosshairColor = Value; if state.CrosshairEnabled then CreateCrosshair() end end })
    MiscTab:AddSlider({ Name = "Crosshair Size", Min = 5, Max = 30, Default = 12, Increment = 1, Flag = "CrosshairSize", Save = true, Callback = function(Value) state.CrosshairSize = Value; if state.CrosshairEnabled then CreateCrosshair() end end })
    MiscTab:AddSlider({ Name = "Crosshair Thickness", Min = 1, Max = 5, Default = 1, Increment = 1, Flag = "CrosshairThickness", Save = true, Callback = function(Value) state.CrosshairThickness = Value; if state.CrosshairEnabled then CreateCrosshair() end end })
    MiscTab:AddSlider({ Name = "Crosshair Gap", Min = 0, Max = 10, Default = 4, Increment = 1, Flag = "CrosshairGap", Save = true, Callback = function(Value) state.CrosshairGap = Value; if state.CrosshairEnabled then CreateCrosshair() end end })
    MiscTab:AddSlider({ Name = "Crosshair Rotation (degrees)", Min = 0, Max = 360, Default = 0, Increment = 15, Flag = "CrosshairRotation", Save = true, Callback = function(Value) state.CrosshairRotation = Value; if state.CrosshairEnabled then CreateCrosshair() end end })
    MiscTab:AddSlider({ Name = "Rotation Speed (0 = off)", Min = 0, Max = 10, Default = 0, Increment = 0.5, Flag = "CrosshairRotationSpeed", Save = true, Callback = function(Value) state.CrosshairRotationSpeed = Value; if state.CrosshairEnabled then crosshairLastUpdate = tick() end end })
    MiscTab:AddToggle({ Name = "Dynamic Color (Red on enemy)", Default = false, Flag = "CrosshairDynamic", Save = true, Callback = function(Value) state.CrosshairDynamic = Value; if state.CrosshairEnabled then CreateCrosshair() end end })

    UserInputService.InputBegan:Connect(function(input)
        if state.AimbotKey == "MouseButton2" and input.UserInputType == Enum.UserInputType.MouseButton2 then aimbotActive = true
        elseif state.AimbotKey == "MouseButton1" and input.UserInputType == Enum.UserInputType.MouseButton1 then aimbotActive = true
        elseif state.AimbotKey == "Q" and input.KeyCode == Enum.KeyCode.Q then aimbotActive = true
        elseif state.AimbotKey == "E" and input.KeyCode == Enum.KeyCode.E then aimbotActive = true
        elseif state.AimbotKey == "F" and input.KeyCode == Enum.KeyCode.F then aimbotActive = true
        elseif state.AimbotKey == "LeftShift" and input.KeyCode == Enum.KeyCode.LeftShift then aimbotActive = true
        elseif state.AimbotKey == "LeftControl" and input.KeyCode == Enum.KeyCode.LeftControl then aimbotActive = true end

        if state.RagebotKey ~= "Always On" then
            if state.RagebotKey == "MouseButton2" and input.UserInputType == Enum.UserInputType.MouseButton2 then ragebotActive = true
            elseif state.RagebotKey == "MouseButton1" and input.UserInputType == Enum.UserInputType.MouseButton1 then ragebotActive = true
            elseif state.RagebotKey == "Q" and input.KeyCode == Enum.KeyCode.Q then ragebotActive = true
            elseif state.RagebotKey == "E" and input.KeyCode == Enum.KeyCode.E then ragebotActive = true
            elseif state.RagebotKey == "F" and input.KeyCode == Enum.KeyCode.F then ragebotActive = true
            elseif state.RagebotKey == "LeftShift" and input.KeyCode == Enum.KeyCode.LeftShift then ragebotActive = true
            elseif state.RagebotKey == "LeftControl" and input.KeyCode == Enum.KeyCode.LeftControl then ragebotActive = true end
        end

        if state.TriggerBot then
            if state.TriggerBotKey == "MouseButton2" and input.UserInputType == Enum.UserInputType.MouseButton2 then triggerBotActive = true
            elseif state.TriggerBotKey == "MouseButton1" and input.UserInputType == Enum.UserInputType.MouseButton1 then triggerBotActive = true
            elseif state.TriggerBotKey == "Q" and input.KeyCode == Enum.KeyCode.Q then triggerBotActive = true
            elseif state.TriggerBotKey == "E" and input.KeyCode == Enum.KeyCode.E then triggerBotActive = true
            elseif state.TriggerBotKey == "F" and input.KeyCode == Enum.KeyCode.F then triggerBotActive = true
            elseif state.TriggerBotKey == "LeftShift" and input.KeyCode == Enum.KeyCode.LeftShift then triggerBotActive = true
            elseif state.TriggerBotKey == "LeftControl" and input.KeyCode == Enum.KeyCode.LeftControl then triggerBotActive = true
            elseif state.TriggerBotKey == "Toggle" and input.KeyCode == Enum.KeyCode.T then triggerBotActive = not triggerBotActive end
        end

        if input.KeyCode == Enum.KeyCode.Space and state.MultiJump then PerformMultiJump() end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if state.AimbotKey == "MouseButton2" and input.UserInputType == Enum.UserInputType.MouseButton2 then aimbotActive = false
        elseif state.AimbotKey == "MouseButton1" and input.UserInputType == Enum.UserInputType.MouseButton1 then aimbotActive = false
        elseif state.AimbotKey == "Q" and input.KeyCode == Enum.KeyCode.Q then aimbotActive = false
        elseif state.AimbotKey == "E" and input.KeyCode == Enum.KeyCode.E then aimbotActive = false
        elseif state.AimbotKey == "F" and input.KeyCode == Enum.KeyCode.F then aimbotActive = false
        elseif state.AimbotKey == "LeftShift" and input.KeyCode == Enum.KeyCode.LeftShift then aimbotActive = false
        elseif state.AimbotKey == "LeftControl" and input.KeyCode == Enum.KeyCode.LeftControl then aimbotActive = false end

        if state.RagebotKey ~= "Always On" then
            if state.RagebotKey == "MouseButton2" and input.UserInputType == Enum.UserInputType.MouseButton2 then ragebotActive = false
            elseif state.RagebotKey == "MouseButton1" and input.UserInputType == Enum.UserInputType.MouseButton1 then ragebotActive = false
            elseif state.RagebotKey == "Q" and input.KeyCode == Enum.KeyCode.Q then ragebotActive = false
            elseif state.RagebotKey == "E" and input.KeyCode == Enum.KeyCode.E then ragebotActive = false
            elseif state.RagebotKey == "F" and input.KeyCode == Enum.KeyCode.F then ragebotActive = false
            elseif state.RagebotKey == "LeftShift" and input.KeyCode == Enum.KeyCode.LeftShift then ragebotActive = false
            elseif state.RagebotKey == "LeftControl" and input.KeyCode == Enum.KeyCode.LeftControl then ragebotActive = false end
        end

        if state.TriggerBotKey ~= "Toggle" then
            if state.TriggerBotKey == "MouseButton2" and input.UserInputType == Enum.UserInputType.MouseButton2 then triggerBotActive = false
            elseif state.TriggerBotKey == "MouseButton1" and input.UserInputType == Enum.UserInputType.MouseButton1 then triggerBotActive = false
            elseif state.TriggerBotKey == "Q" and input.KeyCode == Enum.KeyCode.Q then triggerBotActive = false
            elseif state.TriggerBotKey == "E" and input.KeyCode == Enum.KeyCode.E then triggerBotActive = false
            elseif state.TriggerBotKey == "F" and input.KeyCode == Enum.KeyCode.F then triggerBotActive = false
            elseif state.TriggerBotKey == "LeftShift" and input.KeyCode == Enum.KeyCode.LeftShift then triggerBotActive = false
            elseif state.TriggerBotKey == "LeftControl" and input.KeyCode == Enum.KeyCode.LeftControl then triggerBotActive = false end
        end
    end)

    RunService.RenderStepped:Connect(function(dt)
        AimbotFOVCircle.Radius = state.AimbotFOV
        AimbotFOVCircle.Position = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
        AimbotFOVCircle.Visible = state.ShowFOV and state.Aimbot

        UpdateGlowAimbotCircle()
        UpdateRainbowRagebotCircle()

        TriggerBotFOVCircle.Radius = state.TriggerBotFOV
        TriggerBotFOVCircle.Position = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
        TriggerBotFOVCircle.Visible = state.TriggerBot

        UpdateSilentAimFOVCircles()
        UpdateRainbowSilentAimCircle()

        if state.SpeedHack then SetupSpeedHack() end
        UpdateJumpSystem()
        UpdateFly()
        UpdateNoclip()
        UpdateThirdPerson(dt)
        if state.FOVChanger then SetupFOVChanger() end

        if aimbotActive and state.Aimbot then
            local target = GetClosestPlayer()
            if target then
                local delta = target.ScreenPos - UserInputService:GetMouseLocation()
                local smoothDelta = delta * (1 - state.AimbotSmoothness)
                mousemoverel(smoothDelta.X, smoothDelta.Y)
            end
        end

        if state.Ragebot then FireRagebot() end
        if state.TriggerBot then FireTriggerBot() end
        UpdateSnapLine()
        if state.CrosshairEnabled then UpdateCrosshair() end

        if state.Spinbot then
            spinbotAngle = spinbotAngle + state.SpinbotSpeed
            local char = LocalPlayer.Character
            if char then
                local root = char:FindFirstChild("HumanoidRootPart")
                if root then root.CFrame = root.CFrame * CFrame.Angles(0, math.rad(spinbotAngle), 0) end
            end
        end

        if state.Invisible and not invisibleEnabled then enableInvisible()
        elseif not state.Invisible and invisibleEnabled then disableInvisible() end
    end)

    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.Insert then
            OrionLib:Destroy()
            ClearCrosshair()
            DisableNoclip()
            disableInvisible()
            SetupFlyHack()
            SetupSpeedHack()
            stopSilentAim()
            AimbotFOVCircle:Remove()
            GlowFOVCircle:Remove()
            RagebotFOVCircle:Remove()
            SnapLineDrawing:Remove()
            TriggerBotFOVCircle:Remove()
            SilentAimFOVCircle:Remove()
            SilentAimGlowCircle:Remove()
            if speedHackConnection then speedHackConnection:Disconnect() end
            if speedHackLoopConnection then speedHackLoopConnection:Disconnect() end
        end
    end)

    ActivateAnticheatBypass()

    Notify("Cheat loaded", "KEY VERIFIED! ALL FEATURES UNLOCKED\n• Anticheat Bypass ACTIVE\n• Rainbow Ragebot FOV Circle!\n• Glow Aimbot FOV Circle!\n• Silent Aim with FOV Circle!\n• Rainbow & Glow Silent Aim FOV!\n• SpeedHack\n• Insert = Destroy", 10)
end


local cachedKey = getgenv().VORTEX_KEY or ""
local valid, data = verifyKey(cachedKey)

if valid then
    pcall(function() OrionLib:Destroy() end)
    OrionLib = loadstring(game:HttpGet('https://api.getvortex.vip/api/t/SNN44R/s/OrionLib'))()
    StartCheat()
else
    if data and data.banned then
        error("[ORVEX Auth] You are banned. Reason: " .. (data.banReason or "no reason given"), 0)
    else
        showKeyWindow()
    end
end