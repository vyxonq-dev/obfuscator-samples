local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local Settings = {
    Aimbot = {
        Enabled = false,
        Keybind = Enum.KeyCode.E,
        TeamCheck = true,
        VisibilityCheck = true,
        TargetPart = "Head",
        Smoothness = 5,
        StickyLock = false,
        FOVCheck = true,
        YOffset = 0
    },
    FOV = {
        Visible = true,
        Radius = 100,
        Color = Color3.fromRGB(255, 255, 255),
        Rainbow = false,
        RainbowSpeed = 5,
        Transparency = 0.5,
        Thickness = 2,
        Filled = false
    },
    Player = {
        WalkSpeed = 16,
        JumpPower = 50,
        InfiniteJump = false,
        Fly = false,
        FlySpeed = 50,
        Noclip = false
    },
    Triggerbot = {
        Enabled = false,
        Delay = 0.1,
        TeamCheck = true,
        OnlyWhenAiming = true
    },
    Combat = {
        AutoParry = false,
        AutoBlock = false,
        SilentAim = false,
        NoRecoil = false,
        NoSpread = false,
        InstantHit = false
    },
    Visual = {
        ESP = false,
        ESPColor = Color3.fromRGB(255, 0, 0),
        Tracers = false,
        Boxes = false
    },
    Universal = {
        FullBright = false,
        FPSBoost = false,
        Crosshair = false
    }
}

local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = Settings.FOV.Thickness
FOVCircle.NumSides = 100
FOVCircle.Radius = Settings.FOV.Radius
FOVCircle.Filled = Settings.FOV.Filled
FOVCircle.Visible = Settings.FOV.Visible
FOVCircle.ZIndex = 999
FOVCircle.Transparency = Settings.FOV.Transparency
FOVCircle.Color = Settings.FOV.Color

local RainbowHue = 0

local Window = Rayfield:CreateWindow({
    Name = "stable-ware v0.0.1",
    LoadingTitle = "stable-ware",
    LoadingSubtitle = "by v.ertflex",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "StablewareConfig",
        FileName = "Config"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvite",
        RememberJoins = true
    },
    KeySystem = false
})

local AimbotTab = Window:CreateTab("Aimbot", 4483362458)

local AimbotSection = AimbotTab:CreateSection("Aimbot Settings")

local AimbotToggle = AimbotTab:CreateToggle({
    Name = "Enable Aimbot",
    CurrentValue = false,
    Flag = "AimbotToggle",
    Callback = function(Value)
        Settings.Aimbot.Enabled = Value
    end,
})

local SmoothnessSlider = AimbotTab:CreateSlider({
    Name = "Smoothness Amount",
    Range = {1, 20},
    Increment = 0.5,
    Suffix = "",
    CurrentValue = 5,
    Flag = "SmoothnessSlider",
    Callback = function(Value)
        Settings.Aimbot.Smoothness = Value
    end,
})

local TeamCheckToggle = AimbotTab:CreateToggle({
    Name = "Team Check",
    CurrentValue = true,
    Flag = "TeamCheckToggle",
    Callback = function(Value)
        Settings.Aimbot.TeamCheck = Value
    end,
})

local VisibilityCheckToggle = AimbotTab:CreateToggle({
    Name = "Visibility Check",
    CurrentValue = true,
    Flag = "VisibilityCheckToggle",
    Callback = function(Value)
        Settings.Aimbot.VisibilityCheck = Value
    end,
})

local TargetPartDropdown = AimbotTab:CreateDropdown({
    Name = "Target Part",
    Options = {"Head", "Torso", "HumanoidRootPart"},
    CurrentOption = "Head",
    Flag = "TargetPartDropdown",
    Callback = function(Option)
        Settings.Aimbot.TargetPart = Option
    end,
})

local StickyLockToggle = AimbotTab:CreateToggle({
    Name = "Sticky Lock",
    CurrentValue = false,
    Flag = "StickyLockToggle",
    Callback = function(Value)
        Settings.Aimbot.StickyLock = Value
    end,
})

local AimbotKeybind = AimbotTab:CreateKeybind({
    Name = "Aimbot Keybind",
    CurrentKeybind = "E",
    HoldToInteract = false,
    Flag = "AimbotKeybind",
    Callback = function(Keybind)
        Settings.Aimbot.Keybind = Keybind
    end,
})

local OffsetSlider = AimbotTab:CreateSlider({
    Name = "Vertical Offset",
    Range = {-100, 100},
    Increment = 1,
    Suffix = "px",
    CurrentValue = 0,
    Flag = "OffsetSlider",
    Callback = function(Value)
        Settings.Aimbot.YOffset = Value
    end,
})

local FOVTab = Window:CreateTab("FOV Circle", 4483362458)

local FOVSection = FOVTab:CreateSection("FOV Circle Settings")

local FOVVisibleToggle = FOVTab:CreateToggle({
    Name = "Show FOV Circle",
    CurrentValue = true,
    Flag = "FOVVisibleToggle",
    Callback = function(Value)
        Settings.FOV.Visible = Value
        FOVCircle.Visible = Value
    end,
})

local FOVRadiusSlider = FOVTab:CreateSlider({
    Name = "FOV Radius",
    Range = {20, 500},
    Increment = 5,
    Suffix = "px",
    CurrentValue = 100,
    Flag = "FOVRadiusSlider",
    Callback = function(Value)
        Settings.FOV.Radius = Value
        FOVCircle.Radius = Value
    end,
})

local FOVColorPicker = FOVTab:CreateColorPicker({
    Name = "FOV Color",
    Color = Color3.fromRGB(255, 255, 255),
    Flag = "FOVColorPicker",
    Callback = function(Value)
        Settings.FOV.Color = Value
        if not Settings.FOV.Rainbow then
            FOVCircle.Color = Value
        end
    end,
})

local RainbowToggle = FOVTab:CreateToggle({
    Name = "Rainbow FOV",
    CurrentValue = false,
    Flag = "RainbowToggle",
    Callback = function(Value)
        Settings.FOV.Rainbow = Value
    end,
})

local RainbowSpeedSlider = FOVTab:CreateSlider({
    Name = "Rainbow Speed",
    Range = {1, 20},
    Increment = 1,
    Suffix = "x",
    CurrentValue = 5,
    Flag = "RainbowSpeedSlider",
    Callback = function(Value)
        Settings.FOV.RainbowSpeed = Value
    end,
})

local FOVTransparencySlider = FOVTab:CreateSlider({
    Name = "Transparency",
    Range = {0, 1},
    Increment = 0.05,
    Suffix = "",
    CurrentValue = 0.5,
    Flag = "FOVTransparencySlider",
    Callback = function(Value)
        Settings.FOV.Transparency = Value
        FOVCircle.Transparency = Value
    end,
})

local FOVThicknessSlider = FOVTab:CreateSlider({
    Name = "Thickness",
    Range = {1, 10},
    Increment = 1,
    Suffix = "px",
    CurrentValue = 2,
    Flag = "FOVThicknessSlider",
    Callback = function(Value)
        Settings.FOV.Thickness = Value
        FOVCircle.Thickness = Value
    end,
})

local FOVFilledToggle = FOVTab:CreateToggle({
    Name = "Filled Circle",
    CurrentValue = false,
    Flag = "FOVFilledToggle",
    Callback = function(Value)
        Settings.FOV.Filled = Value
        FOVCircle.Filled = Value
    end,
})

local PlayerTab = Window:CreateTab("Player", 4483362458)

local PlayerSection = PlayerTab:CreateSection("Player Modifications")

local WalkSpeedSlider = PlayerTab:CreateSlider({
    Name = "Walk Speed",
    Range = {16, 500},
    Increment = 1,
    Suffix = "",
    CurrentValue = 16,
    Flag = "WalkSpeedSlider",
    Callback = function(Value)
        Settings.Player.WalkSpeed = Value
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end
    end,
})

local JumpPowerSlider = PlayerTab:CreateSlider({
    Name = "Jump Power",
    Range = {50, 500},
    Increment = 5,
    Suffix = "",
    CurrentValue = 50,
    Flag = "JumpPowerSlider",
    Callback = function(Value)
        Settings.Player.JumpPower = Value
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            local humanoid = LocalPlayer.Character.Humanoid
            if humanoid.UseJumpPower then
                humanoid.JumpPower = Value
            else
                humanoid.JumpHeight = Value / 5
            end
        end
    end,
})

local InfiniteJumpToggle = PlayerTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "InfiniteJumpToggle",
    Callback = function(Value)
        Settings.Player.InfiniteJump = Value
    end,
})

local FlyToggle = PlayerTab:CreateToggle({
    Name = "Fly",
    CurrentValue = false,
    Flag = "FlyToggle",
    Callback = function(Value)
        Settings.Player.Fly = Value
    end,
})

local FlySpeedSlider = PlayerTab:CreateSlider({
    Name = "Fly Speed",
    Range = {10, 200},
    Increment = 5,
    Suffix = "",
    CurrentValue = 50,
    Flag = "FlySpeedSlider",
    Callback = function(Value)
        Settings.Player.FlySpeed = Value
    end,
})

local NoclipToggle = PlayerTab:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Flag = "NoclipToggle",
    Callback = function(Value)
        Settings.Player.Noclip = Value
    end,
})

local ResetButton = PlayerTab:CreateButton({
    Name = "Reset to Default",
    Callback = function()
        Settings.Player.WalkSpeed = 16
        Settings.Player.JumpPower = 50
        Settings.Player.InfiniteJump = false
        Settings.Player.Fly = false
        Settings.Player.Noclip = false
        
        WalkSpeedSlider:Set(16)
        JumpPowerSlider:Set(50)
        InfiniteJumpToggle:Set(false)
        FlyToggle:Set(false)
        NoclipToggle:Set(false)
        
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = 16
            local humanoid = LocalPlayer.Character.Humanoid
            if humanoid.UseJumpPower then
                humanoid.JumpPower = 50
            else
                humanoid.JumpHeight = 10
            end
        end
        
        Rayfield:Notify({
            Title = "Reset Complete",
            Content = "Player settings reset to default",
            Duration = 3,
            Image = 4483362458,
        })
    end,
})

local TriggerbotTab = Window:CreateTab("Triggerbot", 4483362458)

local TriggerbotSection = TriggerbotTab:CreateSection("Triggerbot Settings")

local TriggerbotToggle = TriggerbotTab:CreateToggle({
    Name = "Enable Triggerbot",
    CurrentValue = false,
    Flag = "TriggerbotToggle",
    Callback = function(Value)
        Settings.Triggerbot.Enabled = Value
    end,
})

local TriggerbotDelaySlider = TriggerbotTab:CreateSlider({
    Name = "Delay",
    Range = {0, 1},
    Increment = 0.05,
    Suffix = "s",
    CurrentValue = 0.1,
    Flag = "TriggerbotDelaySlider",
    Callback = function(Value)
        Settings.Triggerbot.Delay = Value
    end,
})

local TriggerbotTeamCheckToggle = TriggerbotTab:CreateToggle({
    Name = "Team Check",
    CurrentValue = true,
    Flag = "TriggerbotTeamCheckToggle",
    Callback = function(Value)
        Settings.Triggerbot.TeamCheck = Value
    end,
})

local TriggerbotOnlyAimingToggle = TriggerbotTab:CreateToggle({
    Name = "Only Shoot When Aiming",
    CurrentValue = true,
    Flag = "TriggerbotOnlyAimingToggle",
    Callback = function(Value)
        Settings.Triggerbot.OnlyWhenAiming = Value
    end,
})

local CombatTab = Window:CreateTab("Combat", 4483362458)

local CombatSection = CombatTab:CreateSection("Combat Features")

local SilentAimToggle = CombatTab:CreateToggle({
    Name = "Silent Aim",
    CurrentValue = false,
    Flag = "SilentAimToggle",
    Callback = function(Value)
        Settings.Combat.SilentAim = Value
    end,
})

local AutoParryToggle = CombatTab:CreateToggle({
    Name = "Auto Parry",
    CurrentValue = false,
    Flag = "AutoParryToggle",
    Callback = function(Value)
        Settings.Combat.AutoParry = Value
    end,
})

local AutoBlockToggle = CombatTab:CreateToggle({
    Name = "Auto Block",
    CurrentValue = false,
    Flag = "AutoBlockToggle",
    Callback = function(Value)
        Settings.Combat.AutoBlock = Value
    end,
})

local NoRecoilToggle = CombatTab:CreateToggle({
    Name = "No Recoil",
    CurrentValue = false,
    Flag = "NoRecoilToggle",
    Callback = function(Value)
        Settings.Combat.NoRecoil = Value
    end,
})

local NoSpreadToggle = CombatTab:CreateToggle({
    Name = "No Spread",
    CurrentValue = false,
    Flag = "NoSpreadToggle",
    Callback = function(Value)
        Settings.Combat.NoSpread = Value
    end,
})

local InstantHitToggle = CombatTab:CreateToggle({
    Name = "Instant Hit",
    CurrentValue = false,
    Flag = "InstantHitToggle",
    Callback = function(Value)
        Settings.Combat.InstantHit = Value
    end,
})

local VisualTab = Window:CreateTab("Visual", 4483362458)

local VisualSection = VisualTab:CreateSection("ESP Settings")

local ESPToggle = VisualTab:CreateToggle({
    Name = "ESP",
    CurrentValue = false,
    Flag = "ESPToggle",
    Callback = function(Value)
        Settings.Visual.ESP = Value
    end,
})

local ESPColorPicker = VisualTab:CreateColorPicker({
    Name = "ESP Color",
    Color = Color3.fromRGB(255, 0, 0),
    Flag = "ESPColorPicker",
    Callback = function(Value)
        Settings.Visual.ESPColor = Value
    end,
})

local TracersToggle = VisualTab:CreateToggle({
    Name = "Tracers",
    CurrentValue = false,
    Flag = "TracersToggle",
    Callback = function(Value)
        Settings.Visual.Tracers = Value
    end,
})

local BoxesToggle = VisualTab:CreateToggle({
    Name = "Boxes",
    CurrentValue = false,
    Flag = "BoxesToggle",
    Callback = function(Value)
        Settings.Visual.Boxes = Value
    end,
})

local UniversalTab = Window:CreateTab("Universal", 4483362458)
local UniversalSection = UniversalTab:CreateSection("Utility")

local FullBrightToggle = UniversalTab:CreateToggle({
    Name = "Fullbright",
    CurrentValue = false,
    Flag = "FullBrightToggle",
    Callback = function(Value)
        Settings.Universal.FullBright = Value
        if Value then
            game:GetService("Lighting").Brightness = 2
            game:GetService("Lighting").ClockTime = 14
            game:GetService("Lighting").FogEnd = 100000
            game:GetService("Lighting").GlobalShadows = false
            game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(128, 128, 128)
        else
            game:GetService("Lighting").Brightness = 1
            game:GetService("Lighting").ClockTime = 12
            game:GetService("Lighting").FogEnd = 10000
            game:GetService("Lighting").GlobalShadows = true
            game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(127, 127, 127)
        end
    end,
})

local FPSBoostButton = UniversalTab:CreateButton({
    Name = "FPS Booster",
    Callback = function()
        if setfpscap then setfpscap(999) end
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("BasePart") then
                v.Material = Enum.Material.SmoothPlastic
                v.Reflectance = 0
                v.CastShadow = false
            elseif v:IsA("Decal") or v:IsA("Texture") then
                v.Transparency = 1
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                v.Enabled = false
            end
        end
    end,
})

local RejoinButton = UniversalTab:CreateButton({
    Name = "Rejoin Server",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
    end,
})

local GamesTab = Window:CreateTab("Games", 4483362458)

local BigPaintballSection = GamesTab:CreateSection("Big Paintball")

local UnlockGunsButton = GamesTab:CreateButton({
    Name = "Unlock All Guns (Big Paintball)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))()
    end,
})

local RivalsSection = GamesTab:CreateSection("Rivals")

local RivalsSilentAim = GamesTab:CreateButton({
    Name = "Rivals Silent Aim",
    Callback = function()
        local camera = workspace.CurrentCamera
        local mt = getrawmetatable(game)
        local old = mt.__namecall
        setreadonly(mt, false)
        
        mt.__namecall = newcclosure(function(...)
            local args = {...}
            local method = getnamecallmethod()
            
            if method == "FireServer" and args[2] == "Hit" then

            end
            
            return old(...)
        end)
        setreadonly(mt, true)
    end,
})

local function IsVisible(target)
    if not Settings.Aimbot.VisibilityCheck then return true end
    
    local origin = Camera.CFrame.Position
    local direction = (target.Position - origin).Unit * 500
    
    local raycastParams = RaycastParams.new()
    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
    raycastParams.FilterDescendantsInstances = {LocalPlayer.Character}
    raycastParams.IgnoreWater = true
    
    local raycastResult = workspace:Raycast(origin, direction, raycastParams)
    
    if raycastResult then
        local hit = raycastResult.Instance
        return hit:IsDescendantOf(target.Parent)
    end
    
    return false
end

local function GetClosestPlayer()
    local closestPlayer = nil
    local shortestDistance = Settings.FOV.Radius
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local character = player.Character
            local humanoid = character:FindFirstChild("Humanoid")
            local targetPart = character:FindFirstChild(Settings.Aimbot.TargetPart)
            
            if humanoid and humanoid.Health > 0 and targetPart then
                if Settings.Aimbot.TeamCheck and player.Team == LocalPlayer.Team then
                    continue
                end
                
                local screenPos, onScreen = Camera:WorldToViewportPoint(targetPart.Position)
                
                if onScreen then
                    local mousePos = Vector2.new(Mouse.X, Mouse.Y)
                    local targetPos = Vector2.new(screenPos.X, screenPos.Y)
                    local distance = (mousePos - targetPos).Magnitude
                    
                    if distance < shortestDistance then
                        if IsVisible(targetPart) then
                            closestPlayer = player
                            shortestDistance = distance
                        end
                    end
                end
            end
        end
    end
    
    return closestPlayer
end

local currentTarget = nil
local aimbotActive = false

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Settings.Aimbot.Keybind and not gameProcessed then
        aimbotActive = true
    end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessed)
    if input.KeyCode == Settings.Aimbot.Keybind then
        aimbotActive = false
        currentTarget = nil
    end
end)

RunService.RenderStepped:Connect(function()
    local mousePos = UserInputService:GetMouseLocation()
    FOVCircle.Position = mousePos
    
    if Settings.FOV.Rainbow then
        RainbowHue = (RainbowHue + (Settings.FOV.RainbowSpeed / 1000)) % 1
        FOVCircle.Color = Color3.fromHSV(RainbowHue, 1, 1)
    else
        FOVCircle.Color = Settings.FOV.Color
    end
    
    if Settings.Aimbot.Enabled and aimbotActive then
        if not Settings.Aimbot.StickyLock or currentTarget == nil then
            currentTarget = GetClosestPlayer()
        end
        
        if currentTarget and currentTarget.Character then
            local targetPart = currentTarget.Character:FindFirstChild(Settings.Aimbot.TargetPart)
            
            if targetPart then
                local targetPos, onScreen = Camera:WorldToViewportPoint(targetPart.Position)
                
                if onScreen then
                    local mouseX = Mouse.X
                    local mouseY = Mouse.Y
                    
                    local targetX = targetPos.X
                    local targetY = targetPos.Y + (Settings.Aimbot.YOffset or 0)
                    
                    local deltaX = targetX - mouseX
                    local deltaY = targetY - mouseY
                    
                    local moveX = deltaX / Settings.Aimbot.Smoothness
                    local moveY = deltaY / Settings.Aimbot.Smoothness
                    
                    mousemoverel(moveX, moveY)
                end
            end
        end
    else
        if not aimbotActive then
            currentTarget = nil
        end
    end
end)

UserInputService.JumpRequest:Connect(function()
    if Settings.Player.InfiniteJump and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

RunService.Heartbeat:Connect(function()
    if LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        
        if humanoid then
            if humanoid.WalkSpeed ~= Settings.Player.WalkSpeed then
                humanoid.WalkSpeed = Settings.Player.WalkSpeed
            end
            
            if humanoid.UseJumpPower then
                if humanoid.JumpPower ~= Settings.Player.JumpPower then
                    humanoid.JumpPower = Settings.Player.JumpPower
                end
            else
                local jumpHeight = Settings.Player.JumpPower / 5
                if humanoid.JumpHeight ~= jumpHeight then
                    humanoid.JumpHeight = jumpHeight
                end
            end
        end
    end
end)

local lastShot = 0

RunService.Heartbeat:Connect(function()
    if Settings.Triggerbot.Enabled then
        local target = Mouse.Target
        
        if target then
            local player = Players:GetPlayerFromCharacter(target.Parent)
            
            if player and player ~= LocalPlayer then
                if Settings.Triggerbot.TeamCheck and player.Team == LocalPlayer.Team then
                    return
                end
                
                if Settings.Triggerbot.OnlyWhenAiming and not UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
                    return
                end
                
                if tick() - lastShot >= Settings.Triggerbot.Delay then
                    mouse1click()
                    lastShot = tick()
                end
            end
        end
    end
end)

LocalPlayer.CharacterAdded:Connect(function(character)
    wait(0.5)
    local humanoid = character:WaitForChild("Humanoid")
    
    humanoid.WalkSpeed = Settings.Player.WalkSpeed
    
    if humanoid.UseJumpPower then
        humanoid.JumpPower = Settings.Player.JumpPower
    else
        humanoid.JumpHeight = Settings.Player.JumpPower / 5
    end
end)

local flyBodyVelocity = nil
local flyBodyGyro = nil

RunService.Heartbeat:Connect(function()
    if Settings.Player.Fly and LocalPlayer.Character then
        local humanoidRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        
        if humanoidRootPart then
            if not flyBodyVelocity then
                flyBodyVelocity = Instance.new("BodyVelocity")
                flyBodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
                flyBodyVelocity.Velocity = Vector3.new(0, 0, 0)
                flyBodyVelocity.Parent = humanoidRootPart
                
                flyBodyGyro = Instance.new("BodyGyro")
                flyBodyGyro.MaxTorque = Vector3.new(100000, 100000, 100000)
                flyBodyGyro.P = 10000
                flyBodyGyro.Parent = humanoidRootPart
            end
            
            local moveDirection = Vector3.new(0, 0, 0)
            
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                moveDirection = moveDirection + Camera.CFrame.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                moveDirection = moveDirection - Camera.CFrame.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                moveDirection = moveDirection - Camera.CFrame.RightVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                moveDirection = moveDirection + Camera.CFrame.RightVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                moveDirection = moveDirection + Vector3.new(0, 1, 0)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                moveDirection = moveDirection - Vector3.new(0, 1, 0)
            end
            
            flyBodyVelocity.Velocity = moveDirection * Settings.Player.FlySpeed
            flyBodyGyro.CFrame = Camera.CFrame
        end
    else
        if flyBodyVelocity then
            flyBodyVelocity:Destroy()
            flyBodyVelocity = nil
        end
        if flyBodyGyro then
            flyBodyGyro:Destroy()
            flyBodyGyro = nil
        end
    end
end)

RunService.Stepped:Connect(function()
    if Settings.Player.Noclip and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

Rayfield:Notify({
    Title = "stable-ware loaded",
    Content = "script ready",
    Duration = 5,
    Image = 4483362458,
})

print("stable-ware v0.0.1 loaded")

task.spawn(function()
    local TweenService = game:GetService("TweenService")
    
    local notifGui = Instance.new("ScreenGui")
    notifGui.Name = "StablewareNotification"
    notifGui.Parent = game:GetService("CoreGui")
    
    local container = Instance.new("Frame")
    container.Name = "Container"
    container.Parent = notifGui
    container.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    container.BorderSizePixel = 0
    container.Position = UDim2.new(0.5, -150, 1, 50) 
    container.Size = UDim2.new(0, 300, 0, 50)
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = container
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(58, 113, 193) 
    stroke.Thickness = 2
    stroke.Parent = container
    
    local icon = Instance.new("ImageLabel")
    icon.Name = "Icon"
    icon.Parent = container
    icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    icon.BackgroundTransparency = 1
    icon.Position = UDim2.new(0, 10, 0.5, -15)
    icon.Size = UDim2.new(0, 30, 0, 30)
    icon.Image = "rbxassetid://9034873977" 
    
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Parent = container
    title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    title.BackgroundTransparency = 1
    title.Position = UDim2.new(0, 50, 0, 5)
    title.Size = UDim2.new(1, -60, 0, 20)
    title.Font = Enum.Font.GothamBold
    title.Text = "Join the Discord!"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextSize = 14
    title.TextXAlignment = Enum.TextXAlignment.Left
    
    local link = Instance.new("TextLabel")
    link.Name = "Link"
    link.Parent = container
    link.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    link.BackgroundTransparency = 1
    link.Position = UDim2.new(0, 50, 0, 25)
    link.Size = UDim2.new(1, -60, 0, 20)
    link.Font = Enum.Font.Gotham
    link.Text = "gg/5nHH27zAdF"
    link.TextColor3 = Color3.fromRGB(200, 200, 200)
    link.TextSize = 12
    link.TextXAlignment = Enum.TextXAlignment.Left
    
    local tweenInfoIn = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    local tweenIn = TweenService:Create(container, tweenInfoIn, {Position = UDim2.new(0.5, -150, 0.9, -20)})
    tweenIn:Play()
    
    task.wait(5)
    
    local tweenInfoOut = TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
    local tweenOut = TweenService:Create(container, tweenInfoOut, {Position = UDim2.new(0.5, -150, 1, 50)})
    tweenOut:Play()
    
    tweenOut.Completed:Wait()
    notifGui:Destroy()
end)
