local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local Connections = {}
local ESPObjects = {}
local Settings = {
    AimlockEnabled = false,
    AimlockType = "Nearest Player",
    SmoothAimlock = false,
    SmoothSpeed = 0.4,
    AimPart = "Head",
    EnableFOV = false,
    ShowFOV = false,
    FOVColor = Color3.fromRGB(255, 255, 255),
    FOVSize = 100,
    FOVStroke = 2,
    RainbowFOV = false,
    AutoFire = false,
    AutoFireDelay = 1.5,
    AutoFireShootDelay = 0.1,
    WallCheck = true,
    IgnoreShielded = true,
    IgnoreLobby = true,
    NearestPlayerDistance = 1000,
    NearestMouseDistance = 500,
    FOVLockDistance = 1000,
    AimlockOffsetX = 0,
    AimlockOffsetY = 0,
    SilentAimEnabled = false,
    WallCheckSilent = false,
    CenterFOV = false,
    FOVVisible = false,
    SilentFOVSize = 100,
    MaxDistance = 2000,
    ESPEnabled = false,
    NameESP = false,
    DisplayNameESP = false,
    MagnitudeESP = false,
    BoxESP = false,
    TracerESP = false,
    ESPColor = Color3.fromRGB(255, 255, 255),
    BoxColor = Color3.fromRGB(255, 255, 255),
    LineColor = Color3.fromRGB(255, 255, 255),
    ESPSize = 16,
    HitboxEnabled = false,
    HitboxSize = 10,
    HitboxTransparency = 0.7,
    AutoRespawn = false,
    FOV = 70,
    CameraResolution = false,
    CameraResValue = 0.65,
    FullBright = false,
    NoFog = false
}

local function CreateConnection(name, connection)
    if Connections[name] then
        Connections[name]:Disconnect()
    end
    Connections[name] = connection
    return connection
end

local function DisconnectConnection(name)
    if Connections[name] then
        Connections[name]:Disconnect()
        Connections[name] = nil
    end
end

local function GetCharacter()
    return LocalPlayer.Character
end

local function GetHumanoidRootPart()
    local char = GetCharacter()
    return char and char:FindFirstChild("HumanoidRootPart")
end

local function GetClosestPlayerToMouse()
    local closestPlayer = nil
    local shortestDistance = Settings.NearestMouseDistance
    local mousePos = UserInputService:GetMouseLocation()
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            if Settings.IgnoreLobby and player.Team and player.Team.Name == "Lobby" then
                continue
            end
            
            local hrp = player.Character.HumanoidRootPart
            local screenPos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
            
            if onScreen then
                local distance = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
                if distance < shortestDistance then
                    closestPlayer = player
                    shortestDistance = distance
                end
            end
        end
    end
    
    return closestPlayer
end

local function GetClosestPlayer()
    local closestPlayer = nil
    local shortestDistance = Settings.NearestPlayerDistance
    local hrp = GetHumanoidRootPart()
    if not hrp then return nil end
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            if Settings.IgnoreLobby and player.Team and player.Team.Name == "Lobby" then
                continue
            end
            
            local targetHRP = player.Character.HumanoidRootPart
            local distance = (targetHRP.Position - hrp.Position).Magnitude
            
            if distance < shortestDistance then
                closestPlayer = player
                shortestDistance = distance
            end
        end
    end
    
    return closestPlayer
end

local function PerformWallCheck(origin, target)
    if not Settings.WallCheck then return true end
    
    local ray = Ray.new(origin, (target - origin).Unit * (target - origin).Magnitude)
    local part = workspace:FindPartOnRayWithIgnoreList(ray, {GetCharacter()})
    
    return part == nil or part:IsDescendantOf(workspace)
end

local Window = Rayfield:CreateWindow({
    LoadingTitle = "Loading...",
    LoadingSubtitle = "by Leakg0d & UNX!",
    Name = "Flash Hub | Flick | BETA v1",
    Theme = {
        Shadow = Color3.fromRGB(5, 10, 20),
        SliderProgress = Color3.fromRGB(100, 150, 255),
        PlaceholderColor = Color3.fromRGB(140, 180, 255),
        InputStroke = Color3.fromRGB(70, 110, 190),
        ToggleDisabledStroke = Color3.fromRGB(60, 60, 60),
        InputBackground = Color3.fromRGB(15, 25, 45),
        ElementBackgroundHover = Color3.fromRGB(30, 45, 80),
        DropdownUnselected = Color3.fromRGB(20, 30, 55),
        SelectedTabTextColor = Color3.fromRGB(120, 170, 255),
        NotificationBackground = Color3.fromRGB(20, 30, 55),
        DropdownSelected = Color3.fromRGB(30, 45, 80),
        SecondaryElementStroke = Color3.fromRGB(50, 90, 160),
        Background = Color3.fromRGB(10, 15, 30),
        ToggleDisabledOuterStroke = Color3.fromRGB(40, 40, 40),
        TabStroke = Color3.fromRGB(50, 70, 120),
        ElementBackground = Color3.fromRGB(20, 30, 55),
        ToggleEnabledOuterStroke = Color3.fromRGB(50, 90, 160),
        ToggleEnabled = Color3.fromRGB(100, 150, 255),
        ToggleEnabledStroke = Color3.fromRGB(70, 120, 200),
        ToggleDisabled = Color3.fromRGB(90, 90, 90),
        SecondaryElementBackground = Color3.fromRGB(15, 25, 45),
        ToggleBackground = Color3.fromRGB(20, 25, 45),
        TabTextColor = Color3.fromRGB(170, 200, 255),
        ElementStroke = Color3.fromRGB(70, 110, 180),
        SliderBackground = Color3.fromRGB(40, 70, 120),
        SliderStroke = Color3.fromRGB(70, 120, 200),
        NotificationActionsBackground = Color3.fromRGB(35, 50, 80),
        Topbar = Color3.fromRGB(15, 25, 45),
        TabBackground = Color3.fromRGB(40, 60, 100),
        TabBackgroundSelected = Color3.fromRGB(25, 40, 80),
        TextColor = Color3.fromRGB(170, 200, 255),
    },
})

task.spawn(function()
    local success, bulletHandler = pcall(function()
        local modules = ReplicatedStorage:WaitForChild("ModuleScripts")
        local gunModules = modules:WaitForChild("GunModules")
        local bulletModule = gunModules:WaitForChild("BulletHandler")
        return require(bulletModule)
    end)
    
    if success and bulletHandler then
        print("Bullet handler loaded!")
        
        local originalFire = bulletHandler.Fire
        bulletHandler.Fire = function(...)
            if Settings.SilentAimEnabled then
                local args = {...}
                local target = GetClosestPlayer()
                
                if target and target.Character then
                    local aimPart = target.Character:FindFirstChild(Settings.AimPart)
                    if aimPart then
                        args[2] = aimPart.Position
                    end
                end
                
                return originalFire(unpack(args))
            end
            return originalFire(...)
        end
        
        print("Silent Aim hook installed!")
    end
end)

local AutoShootTab = Window:CreateTab("Auto Shoot", 4483362458)

AutoShootTab:CreateSection("Aimlock")

AutoShootTab:CreateToggle({
    Name = "Activate Aimlock",
    Flag = "AimlockToggle",
    CurrentValue = false,
    Callback = function(enabled)
        Settings.AimlockEnabled = enabled
        
        if enabled then
            CreateConnection("Aimlock", RunService.RenderStepped:Connect(function()
                local target = Settings.AimlockType == "Nearest Player" and GetClosestPlayer() or GetClosestPlayerToMouse()
                
                if target and target.Character then
                    local aimPart = target.Character:FindFirstChild(Settings.AimPart)
                    if aimPart then
                        local hrp = GetHumanoidRootPart()
                        if hrp and PerformWallCheck(hrp.Position, aimPart.Position) then
                            local aimPos = aimPart.Position + Vector3.new(Settings.AimlockOffsetX, Settings.AimlockOffsetY, 0)
                            
                            if Settings.SmoothAimlock then
                                Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position, aimPos), Settings.SmoothSpeed)
                            else
                                Camera.CFrame = CFrame.new(Camera.CFrame.Position, aimPos)
                            end
                        end
                    end
                end
            end))
        else
            DisconnectConnection("Aimlock")
        end
    end,
})

AutoShootTab:CreateDropdown({
    Name = "Aimlock Type",
    CurrentOption = "Nearest Player",
    Flag = "AimlockType",
    Options = {"Nearest Player", "Nearest Mouse"},
    Callback = function(option)
        Settings.AimlockType = option
    end,
})

AutoShootTab:CreateToggle({
    Name = "Smooth Aimlock",
    Flag = "SmoothAimlock",
    CurrentValue = false,
    Callback = function(enabled)
        Settings.SmoothAimlock = enabled
    end,
})

AutoShootTab:CreateSlider({
    Name = "Smooth Aimlock Speed",
    Flag = "SmoothAimlockSpeed",
    Suffix = "ms",
    CurrentValue = 400,
    Range = {100, 1000},
    Increment = 10,
    Callback = function(value)
        Settings.SmoothSpeed = value / 1000
    end,
})

AutoShootTab:CreateDropdown({
    Name = "Aim Part",
    CurrentOption = "Head",
    Flag = "AimPart",
    Options = {"Head", "Torso", "Feet"},
    Callback = function(option)
        Settings.AimPart = option
    end,
})

AutoShootTab:CreateSection("FOV Settings")

AutoShootTab:CreateToggle({
    Name = "Enable FOV",
    Flag = "EnableFOV",
    CurrentValue = false,
    Callback = function(enabled)
        Settings.EnableFOV = enabled
    end,
})

local FOVCircle
AutoShootTab:CreateToggle({
    Name = "Show FOV",
    Flag = "ShowFOV",
    CurrentValue = false,
    Callback = function(enabled)
        Settings.ShowFOV = enabled
        
        if enabled then
            local screenGui = Instance.new("ScreenGui")
            screenGui.Name = "FOVCircle"
            screenGui.IgnoreGuiInset = true
            screenGui.Parent = game:GetService("CoreGui")
            
            local frame = Instance.new("Frame")
            frame.Name = "Circle"
            frame.AnchorPoint = Vector2.new(0.5, 0.5)
            frame.Position = UDim2.new(0.5, 0, 0.5, 0)
            frame.BackgroundTransparency = 1
            frame.BorderSizePixel = 0
            frame.Parent = screenGui
            
            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(1, 0)
            corner.Parent = frame
            
            local stroke = Instance.new("UIStroke")
            stroke.Color = Settings.FOVColor
            stroke.Thickness = Settings.FOVStroke
            stroke.Parent = frame
            
            frame.Size = UDim2.new(0, Settings.FOVSize, 0, Settings.FOVSize)
            frame.Visible = true
            
            FOVCircle = {Frame = frame, Stroke = stroke}
        else
            if FOVCircle then
                FOVCircle.Frame.Parent:Destroy()
                FOVCircle = nil
            end
        end
    end,
})

AutoShootTab:CreateColorPicker({
    Name = "FOV Color",
    Flag = "FOVColor",
    Color = Color3.fromRGB(255, 255, 255),
    Callback = function(color)
        Settings.FOVColor = color
        if FOVCircle then
            FOVCircle.Stroke.Color = color
        end
    end,
})

AutoShootTab:CreateSlider({
    Name = "FOV Size",
    Flag = "FOVSize",
    Suffix = "px",
    CurrentValue = 100,
    Range = {1, 750},
    Increment = 1,
    Callback = function(value)
        Settings.FOVSize = value
        if FOVCircle then
            FOVCircle.Frame.Size = UDim2.new(0, value, 0, value)
        end
    end,
})

AutoShootTab:CreateSlider({
    Name = "FOV Stroke Thickness",
    Flag = "FOVStroke",
    Suffix = "px",
    CurrentValue = 2,
    Range = {1, 10},
    Increment = 1,
    Callback = function(value)
        Settings.FOVStroke = value
        if FOVCircle then
            FOVCircle.Stroke.Thickness = value
        end
    end,
})

AutoShootTab:CreateToggle({
    Name = "Rainbow FOV",
    Flag = "RainbowFOV",
    CurrentValue = false,
    Callback = function(enabled)
        Settings.RainbowFOV = enabled
        
        if enabled then
            CreateConnection("RainbowFOV", RunService.RenderStepped:Connect(function()
                if FOVCircle then
                    local hue = tick() % 5 / 5
                    FOVCircle.Stroke.Color = Color3.fromHSV(hue, 1, 1)
                end
            end))
        else
            DisconnectConnection("RainbowFOV")
        end
    end,
})

AutoShootTab:CreateSection("Auto Fire")

AutoShootTab:CreateToggle({
    Name = "Auto-Shoot",
    Flag = "AutoFire",
    CurrentValue = false,
    Callback = function(enabled)
        Settings.AutoFire = enabled
        
        if enabled then
            CreateConnection("AutoFire", RunService.Heartbeat:Connect(function()
                if Settings.EnableFOV then
                    local target = GetClosestPlayer()
                    if target and target.Character then
                        local aimPart = target.Character:FindFirstChild(Settings.AimPart)
                        if aimPart then
                            local hrp = GetHumanoidRootPart()
                            if hrp and PerformWallCheck(hrp.Position, aimPart.Position) then
                                wait(Settings.AutoFireDelay)
                                wait(Settings.AutoFireShootDelay)
                            end
                        end
                    end
                end
            end))
        else
            DisconnectConnection("AutoFire")
        end
    end,
})

AutoShootTab:CreateSlider({
    Name = "Auto-Shoot Delay",
    Flag = "AutoFireDelay",
    Suffix = "s",
    CurrentValue = 1.5,
    Range = {1.5, 3},
    Increment = 0.1,
    Callback = function(value)
        Settings.AutoFireDelay = value
    end,
})

AutoShootTab:CreateSlider({
    Name = "Auto-Fire Shoot Delay",
    Flag = "AutoFireShootDelay",
    Suffix = "s",
    CurrentValue = 0.1,
    Range = {0.1, 1},
    Increment = 0.1,
    Callback = function(value)
        Settings.AutoFireShootDelay = value
    end,
})

AutoShootTab:CreateLabel("Enable the FOV toggle for Auto Shoot to work efficiently!")

AutoShootTab:CreateSection("Configuration")

AutoShootTab:CreateToggle({
    Name = "Wall Check",
    Flag = "WallCheck",
    CurrentValue = true,
    Callback = function(enabled)
        Settings.WallCheck = enabled
    end,
})

AutoShootTab:CreateToggle({
    Name = "Ignore Shielded",
    Flag = "IgnoreShielded",
    CurrentValue = true,
    Callback = function(enabled)
        Settings.IgnoreShielded = enabled
    end,
})

AutoShootTab:CreateToggle({
    Name = "Ignore Lobby",
    Flag = "IgnoreLobby",
    CurrentValue = true,
    Callback = function(enabled)
        Settings.IgnoreLobby = enabled
    end,
})

AutoShootTab:CreateSlider({
    Name = "Nearest Player Distance",
    Flag = "NearestPlayerDistance",
    Suffix = "studs",
    CurrentValue = 1000,
    Range = {10, 5000},
    Increment = 10,
    Callback = function(value)
        Settings.NearestPlayerDistance = value
    end,
})

AutoShootTab:CreateSlider({
    Name = "Nearest Mouse Distance",
    Flag = "NearestMouseDistance",
    Suffix = "studs",
    CurrentValue = 500,
    Range = {10, 5000},
    Increment = 10,
    Callback = function(value)
        Settings.NearestMouseDistance = value
    end,
})

AutoShootTab:CreateSlider({
    Name = "FOV Lock Distance",
    Flag = "FOVLockDistance",
    Suffix = "studs",
    CurrentValue = 1000,
    Range = {50, 5000},
    Increment = 10,
    Callback = function(value)
        Settings.FOVLockDistance = value
    end,
})

AutoShootTab:CreateSlider({
    Name = "Aimlock Offset X",
    Flag = "AimlockOffsetX",
    Suffix = "studs",
    CurrentValue = 0,
    Range = {-1, 1},
    Increment = 0.1,
    Callback = function(value)
        Settings.AimlockOffsetX = value
    end,
})

AutoShootTab:CreateSlider({
    Name = "Aimlock Offset Y",
    Flag = "AimlockOffsetY",
    Suffix = "studs",
    CurrentValue = 0,
    Range = {-1, 1},
    Increment = 0.1,
    Callback = function(value)
        Settings.AimlockOffsetY = value
    end,
})

local SilentAimTab = Window:CreateTab("Silent Aim", 4483362458)

SilentAimTab:CreateSection("Silent Aim")

local silentCircle = Drawing.new("Circle")
silentCircle.Visible = false
silentCircle.Color = Color3.fromRGB(255, 255, 255)
silentCircle.Radius = 100
silentCircle.Transparency = 1
silentCircle.Filled = false
silentCircle.NumSides = 64

CreateConnection("SilentCircleUpdate", RunService.RenderStepped:Connect(function()
    silentCircle.Position = UserInputService:GetMouseLocation()
end))

SilentAimTab:CreateToggle({
    Name = "Enable Silent Aim",
    Flag = "SilentAimToggle",
    CurrentValue = false,
    Callback = function(enabled)
        Settings.SilentAimEnabled = enabled
        
        Rayfield:Notify({
            Title = "Silent Aim",
            Content = enabled and "Silent Aim Enabled" or "Silent Aim Disabled",
            Duration = 1,
            Image = 4483362458,
        })
    end,
})

SilentAimTab:CreateToggle({
    Name = "Wall Check",
    Flag = "WallCheckToggle",
    CurrentValue = false,
    Callback = function(enabled)
        Settings.WallCheckSilent = enabled
        
        Rayfield:Notify({
            Title = "Wall Check",
            Content = enabled and "Wall Check Enabled" or "Wall Check Disabled",
            Duration = 1,
            Image = 4483362458,
        })
    end,
})

SilentAimTab:CreateToggle({
    Name = "Center FOV",
    Flag = "CenterFOVToggle",
    CurrentValue = false,
    Callback = function(enabled)
        Settings.CenterFOV = enabled
        
        Rayfield:Notify({
            Title = "Center FOV",
            Content = "FOV locked to screen center",
            Duration = 1,
            Image = 4483362458,
        })
    end,
})

SilentAimTab:CreateToggle({
    Name = "Show FOV Circle",
    Flag = "FOVVisibleToggle",
    CurrentValue = false,
    Callback = function(enabled)
        Settings.FOVVisible = enabled
        silentCircle.Visible = enabled
        
        Rayfield:Notify({
            Title = "FOV Circle",
            Content = enabled and "FOV Circle Visible" or "FOV Circle Hidden",
            Duration = 1,
            Image = 4483362458,
        })
    end,
})

SilentAimTab:CreateSlider({
    Name = "FOV Size",
    Flag = "FOVSizeSlider",
    Suffix = "px",
    CurrentValue = 100,
    Range = {10, 500},
    Increment = 10,
    Callback = function(value)
        Settings.SilentFOVSize = value
        silentCircle.Radius = value
    end,
})

SilentAimTab:CreateSlider({
    Name = "Max Distance",
    Flag = "MaxDistanceSlider",
    Suffix = "studs",
    CurrentValue = 2000,
    Range = {100, 5000},
    Increment = 100,
    Callback = function(value)
        Settings.MaxDistance = value
    end,
})

SilentAimTab:CreateLabel("What other features should we add to Flick script? - Tell us in Flash Hub")

local ESPTab = Window:CreateTab("ESP Features", 4483362458)

ESPTab:CreateSection("Enable ESP")

local function CreateESPForPlayer(player)
    ESPObjects[player] = {
        NameText = Drawing.new("Text"),
        DisplayText = Drawing.new("Text"),
        MagnitudeText = Drawing.new("Text"),
        Box = Drawing.new("Square"),
        Line = Drawing.new("Line")
    }
    
    local esp = ESPObjects[player]
    
    for _, text in pairs({esp.NameText, esp.DisplayText, esp.MagnitudeText}) do
        text.Size = Settings.ESPSize
        text.Center = true
        text.Outline = true
        text.Color = Settings.ESPColor
        text.Font = 2
        text.Visible = false
    end
    
    esp.Box.Thickness = 2
    esp.Box.Filled = false
    esp.Box.Color = Settings.BoxColor
    esp.Box.Visible = false
    
    esp.Line.Thickness = 2
    esp.Line.Transparency = 1
    esp.Line.Color = Settings.LineColor
    esp.Line.Visible = false
end

ESPTab:CreateToggle({
    Name = "Enable ESP",
    Flag = "ESPToggle",
    CurrentValue = false,
    Callback = function(enabled)
        Settings.ESPEnabled = enabled
        
        if enabled then
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer then
                    CreateESPForPlayer(player)
                end
            end
            
            CreateConnection("ESPUpdate", RunService.RenderStepped:Connect(function()
                for player, esp in pairs(ESPObjects) do
                    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        local hrp = player.Character.HumanoidRootPart
                        local head = player.Character:FindFirstChild("Head")
                        local screenPos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
                        
                        if onScreen and Settings.ESPEnabled then
                            if Settings.NameESP and esp.NameText then
                                esp.NameText.Position = Vector2.new(screenPos.X, screenPos.Y - 40)
                                esp.NameText.Text = player.Name
                                esp.NameText.Visible = true
                            else
                                esp.NameText.Visible = false
                            end
                            
                            if Settings.MagnitudeESP and esp.MagnitudeText then
                                local distance = (hrp.Position - GetHumanoidRootPart().Position).Magnitude
                                esp.MagnitudeText.Position = Vector2.new(screenPos.X, screenPos.Y + 20)
                                esp.MagnitudeText.Text = math.floor(distance) .. " studs"
                                esp.MagnitudeText.Visible = true
                            else
                                esp.MagnitudeText.Visible = false
                            end
                        else
                            esp.NameText.Visible = false
                            esp.DisplayText.Visible = false
                            esp.MagnitudeText.Visible = false
                        end
                    end
                end
            end))
        else
            DisconnectConnection("ESPUpdate")
            for _, esp in pairs(ESPObjects) do
                for _, obj in pairs(esp) do
                    obj.Visible = false
                end
            end
        end
    end,
})

ESPTab:CreateToggle({
    Name = "Name ESP",
    Flag = "NameESP",
    CurrentValue = false,
    Callback = function(enabled)
        Settings.NameESP = enabled
    end,
})

ESPTab:CreateToggle({
    Name = "Display Name ESP",
    Flag = "DisplayNameESP",
    CurrentValue = false,
    Callback = function(enabled)
        Settings.DisplayNameESP = enabled
    end,
})

ESPTab:CreateToggle({
    Name = "Magnitude ESP",
    Flag = "MagnitudeESP",
    CurrentValue = false,
    Callback = function(enabled)
        Settings.MagnitudeESP = enabled
    end,
})

ESPTab:CreateToggle({
    Name = "Box ESP",
    Flag = "BoxESP",
    CurrentValue = false,
    Callback = function(enabled)
        Settings.BoxESP = enabled
    end,
})

ESPTab:CreateToggle({
    Name = "Tracer ESP",
    Flag = "LineESP",
    CurrentValue = false,
    Callback = function(enabled)
        Settings.TracerESP = enabled
    end,
})

ESPTab:CreateSection("Color Customization")

ESPTab:CreateColorPicker({
    Name = "ESP Color",
    Flag = "ESPColor",
    Color = Color3.fromRGB(255, 255, 255),
    Callback = function(color)
        Settings.ESPColor = color
    end,
})

ESPTab:CreateColorPicker({
    Name = "Box Color",
    Flag = "BoxColor",
    Color = Color3.fromRGB(255, 255, 255),
    Callback = function(color)
        Settings.BoxColor = color
    end,
})

ESPTab:CreateColorPicker({
    Name = "Line Color",
    Flag = "LineColor",
    Color = Color3.fromRGB(255, 255, 255),
    Callback = function(color)
        Settings.LineColor = color
    end,
})

ESPTab:CreateSection("Configuration")

ESPTab:CreateSlider({
    Name = "ESP Text Size",
    Flag = "ESPSize",
    Suffix = "px",
    CurrentValue = 16,
    Range = {12, 24},
    Increment = 1,
    Callback = function(value)
        Settings.ESPSize = value
    end,
})

local ExtraTab = Window:CreateTab("Extra Tab", 4483362458)

ExtraTab:CreateSection("Hitbox Expander Settings")

ExtraTab:CreateToggle({
    Name = "Enable Hitbox Expander",
    Flag = "EnableHitboxExpander",
    CurrentValue = false,
    Callback = function(enabled)
        Settings.HitboxEnabled = enabled
        
        if enabled then
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local hrp = player.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        hrp.Size = Vector3.new(Settings.HitboxSize, Settings.HitboxSize, Settings.HitboxSize)
                        hrp.Transparency = Settings.HitboxTransparency
                        hrp.CanCollide = false
                    end
                end
            end
        else
            for _, player in pairs(Players:GetPlayers()) do
                if player.Character then
                    local hrp = player.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        hrp.Size = Vector3.new(2, 2, 1)
                        hrp.Transparency = 1
                        hrp.CanCollide = false
                    end
                end
            end
        end
    end,
})

ExtraTab:CreateSlider({
    Name = "Hitbox Size (Working)",
    Flag = "HitboxSize",
    Suffix = "studs",
    CurrentValue = 10,
    Range = {1, 50},
    Increment = 1,
    Callback = function(value)
        Settings.HitboxSize = value
    end,
})

ExtraTab:CreateSlider({
    Name = "Hitbox Transparency",
    Flag = "HitboxTransparency",
    Suffix = "",
    CurrentValue = 0.7,
    Range = {0.1, 1},
    Increment = 0.1,
    Callback = function(value)
        Settings.HitboxTransparency = value
    end,
})

ExtraTab:CreateLabel("It will say Callback Error, but it 100% works!")

ExtraTab:CreateSection("Auto Respawn")

ExtraTab:CreateToggle({
    Name = "Auto Respawn",
    Flag = "AutoRespawn",
    CurrentValue = false,
    Callback = function(enabled)
        Settings.AutoRespawn = enabled
        
        if enabled then
            CreateConnection("AutoRespawn", RunService.Heartbeat:Connect(function()
                local char = GetCharacter()
                if char then
                    local humanoid = char:FindFirstChildOfClass("Humanoid")
                    if humanoid and humanoid.Health <= 0 then
                        LocalPlayer:LoadCharacter()
                    end
                end
            end))
        else
            DisconnectConnection("AutoRespawn")
        end
    end,
})

ExtraTab:CreateLabel("Auto respawn to it's max baby")

ExtraTab:CreateSection("FOV Modifier")

ExtraTab:CreateSlider({
    Name = "Field of View",
    Flag = "FOV",
    Suffix = "°",
    CurrentValue = 70,
    Range = {60, 120},
    Increment = 1,
    Callback = function(value)
        Settings.FOV = value
        Camera.FieldOfView = value
    end,
})

ExtraTab:CreateLabel("If you don't want it anymore just put it back to your Normal FOV (70).")

ExtraTab:CreateSection("Camera Section")

ExtraTab:CreateToggle({
    Name = "Camera Resolution Modifier",
    Flag = "CameraResolution",
    CurrentValue = false,
    Callback = function(enabled)
        Settings.CameraResolution = enabled
        
        if enabled then
            CreateConnection("CameraRes", RunService.RenderStepped:Connect(function()
                Camera.CFrame = Camera.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, Settings.CameraResValue, 0, 0, 0, 1)
            end))
        else
            DisconnectConnection("CameraRes")
        end
    end,
})

ExtraTab:CreateSlider({
    Name = "Camera Resolution Slider",
    Flag = "CameraResolutionValue",
    Suffix = "",
    CurrentValue = 0.65,
    Range = {0.1, 2},
    Increment = 0.01,
    Callback = function(value)
        Settings.CameraResValue = value
    end,
})

ExtraTab:CreateSection("World Section")

ExtraTab:CreateToggle({
    Name = "Full Bright",
    Flag = "FullBright",
    CurrentValue = false,
    Callback = function(enabled)
        Settings.FullBright = enabled
        
        if enabled then
            Lighting.Brightness = 2
            Lighting.Ambient = Color3.fromRGB(255, 255, 255)
            Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
        else
            Lighting.Brightness = 1
            Lighting.Ambient = Color3.fromRGB(0, 0, 0)
            Lighting.OutdoorAmbient = Color3.fromRGB(127, 127, 127)
        end
    end,
})

ExtraTab:CreateToggle({
    Name = "No Fog",
    Flag = "NoFog",
    CurrentValue = false,
    Callback = function(enabled)
        Settings.NoFog = enabled
        
        if enabled then
            Lighting.FogEnd = 100000
            Lighting.FogStart = 0
        else
            Lighting.FogEnd = 10000
            Lighting.FogStart = 100
        end
    end,
})

local CreditsTab = Window:CreateTab("Credits", 4483362458)

CreditsTab:CreateSection("BETA")

CreditsTab:CreateLabel("Script still in BETA, all features work, we are still working on other features!")

CreditsTab:CreateSection("Credits")

CreditsTab:CreateLabel("Credits to UNX & Credits to Flash Hub!")

Players.PlayerAdded:Connect(function(player)
    if Settings.ESPEnabled then
        CreateESPForPlayer(player)
    end
end)

Players.PlayerRemoving:Connect(function(player)
    if ESPObjects[player] then
        for _, obj in pairs(ESPObjects[player]) do
            obj:Remove()
        end
        ESPObjects[player] = nil
    end
end)

print("Silent Aim loaded successfully! All features are OFF by default.")