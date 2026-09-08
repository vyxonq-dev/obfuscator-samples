
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Hvh Ware",
   LoadingTitle = "Loading Hvh Ware...",
   LoadingSubtitle = "by Horus Team",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "HvhWare",
      FileName = "Config"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },
   KeySystem = false,
   KeySettings = {
      Title = "Hvh Ware",
      Subtitle = "Key System",
      Note = "No key required",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = "HVH-WARE-FREE"
   }
})

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()

local currentChar
local currentHRP
local currentHead

local CustomAimbot = {
    Enabled = false,
    Target = nil,
    Smoothing = 0.3,
    FOV = 100,
    ShowFOV = true,
    FOVColor = Color3.fromRGB(255, 0, 0),
    TargetPart = "Head",
    TeamCheck = false,
    VisibleCheck = true,
    MaxDistance = 1000,
    TargetLock = true,
    Keybind = "Q"
}

local BunnyHop = {
    Enabled = false,
    JumpThread = nil
}

local AutoMove = {
    Enabled = false,
    MoveThread = nil,
    Speed = 1.0
}

local Fly = {
    Enabled = false,
    Speed = 50,
    Noclip = true,
    Tool = nil,
    Event = nil,
    Position = nil
}

local TriggerBot = {
    Enabled = false,
    Delay = 0.1,
    Range = 100,
    LastShot = 0,
    CheckVisible = true,
    TeamCheck = false
}

local AutoCrouch = {
    Enabled = false,
    Speed = 0.15,
    CrouchThread = nil
}

local ESP = {
    Enabled = false,
    ShowBox = true,
    ShowName = true,
    BoxColor = Color3.fromRGB(0, 255, 0),
    NameColor = Color3.fromRGB(255, 255, 255)
}

local MainTab = Window:CreateTab("Main", "target")
local VisualTab = Window:CreateTab("Visual", "eye")
local PlayerTab = Window:CreateTab("Player", "user")
local TeleportTab = Window:CreateTab("Teleport", "map-pin")
local MiscTab = Window:CreateTab("Misc", "settings")

local FOVCircle = Drawing.new("Circle")
FOVCircle.Visible = false
FOVCircle.Thickness = 2
FOVCircle.Color = CustomAimbot.FOVColor
FOVCircle.Transparency = 1
FOVCircle.Filled = false
FOVCircle.Radius = CustomAimbot.FOV
FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)

local ESPDrawings = {}

local function UpdateFOVCircle()
    FOVCircle.Visible = CustomAimbot.ShowFOV and CustomAimbot.Enabled
    FOVCircle.Radius = CustomAimbot.FOV
    FOVCircle.Color = CustomAimbot.FOVColor
    FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
end

local function GetPlayers()
    local players = {}
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            table.insert(players, player)
        end
    end
    return players
end

local function IsValidTarget(player)
    if not player then return false end
    if player == LocalPlayer then return false end

    if CustomAimbot.TeamCheck then
        if player.Team and LocalPlayer.Team and player.Team == LocalPlayer.Team then
            return false
        end
    end

    return true
end

local function GetClosestPlayerToMouse()
    if not currentChar or not currentHRP then return nil end

    local closestPlayer = nil
    local closestDistance = math.huge
    local mousePos = Vector2.new(Mouse.X, Mouse.Y)

    for _, player in pairs(GetPlayers()) do
        if not IsValidTarget(player) then continue end

        local character = player.Character
        if not character then continue end

        local humanoid = character:FindFirstChild("Humanoid")
        local targetPart = character:FindFirstChild(CustomAimbot.TargetPart)

        if not humanoid or humanoid.Health <= 0 or not targetPart then continue end

        local distance = (currentHRP.Position - targetPart.Position).Magnitude
        if distance > CustomAimbot.MaxDistance then continue end

        if CustomAimbot.VisibleCheck then
            local ray = Ray.new(currentHead.Position, (targetPart.Position - currentHead.Position).Unit * distance)
            local hit, pos = Workspace:FindPartOnRayWithIgnoreList(ray, {currentChar, character})
            if hit and not hit:IsDescendantOf(character) then
                continue
            end
        end

        local screenPoint = Camera:WorldToViewportPoint(targetPart.Position)
        if screenPoint.Z > 0 then
            local screenPos = Vector2.new(screenPoint.X, screenPoint.Y)
            local distanceToMouse = (mousePos - screenPos).Magnitude

            if distanceToMouse <= CustomAimbot.FOV and distanceToMouse < closestDistance then
                closestDistance = distanceToMouse
                closestPlayer = player
            end
        end
    end

    return closestPlayer
end

local function SmoothAim(targetPosition)
    local currentPosition = Camera.CFrame.Position
    local direction = (targetPosition - currentPosition).Unit
    local smoothFactor = 1 - math.clamp(CustomAimbot.Smoothing, 0, 0.99)

    return currentPosition + (direction * ((targetPosition - currentPosition).Magnitude * smoothFactor))
end

local function StartBunnyHop()
    if BunnyHop.JumpThread then
        coroutine.close(BunnyHop.JumpThread)
        BunnyHop.JumpThread = nil
    end

    BunnyHop.JumpThread = coroutine.create(function()
        while BunnyHop.Enabled and currentChar do
            wait(0.1)
            
            if currentChar then
                local humanoid = currentChar:FindFirstChild("Humanoid")
                if humanoid then
                    humanoid.Jump = true
                end
            end
        end
    end)

    coroutine.resume(BunnyHop.JumpThread)
end

local function StartAutoMove()
    if AutoMove.MoveThread then
        coroutine.close(AutoMove.MoveThread)
        AutoMove.MoveThread = nil
    end

    AutoMove.MoveThread = coroutine.create(function()
        while AutoMove.Enabled and currentChar do
            local humanoid = currentChar:FindFirstChild("Humanoid")
            if humanoid then
                humanoid:Move(Camera.CFrame.LookVector * AutoMove.Speed)
            end
            RunService.Heartbeat:Wait()
        end
    end)

    coroutine.resume(AutoMove.MoveThread)
end

local function StartAutoCrouch()
    if AutoCrouch.CrouchThread then
        coroutine.close(AutoCrouch.CrouchThread)
        AutoCrouch.CrouchThread = nil
    end

    AutoCrouch.CrouchThread = coroutine.create(function()
        while AutoCrouch.Enabled do
            keypress(0x43)
            wait(AutoCrouch.Speed)
            keyrelease(0x43)
            wait(AutoCrouch.Speed)
        end
    end)

    coroutine.resume(AutoCrouch.CrouchThread)
end

local function StartFly()
    if Fly.Enabled or not LocalPlayer.Character then return end

    Fly.Enabled = true

    local char = LocalPlayer.Character
    local root = char:FindFirstChild("HumanoidRootPart")
    local humanoid = char:FindFirstChild("Humanoid")

    if not root or not humanoid then
        Fly.Enabled = false
        return
    end

    Fly.Position = root.Position

    Fly.Tool = Instance.new("Tool")
    Fly.Tool.Name = "HvhFly"
    Fly.Tool.RequiresHandle = false
    Fly.Tool.Parent = LocalPlayer.Backpack

    Fly.Tool.Equipped:Connect(function()
        Fly.Event = RunService.Heartbeat:Connect(function()
            if not Fly.Enabled then return end

            local cam = Workspace.CurrentCamera
            local cf = cam.CFrame.Rotation
            local moveDir = humanoid.MoveDirection * Fly.Speed

            if moveDir.Magnitude == 0 then
                Fly.Position = Fly.Position
            else
                local dir = cf:VectorToObjectSpace(moveDir)
                local direction = cf:VectorToWorldSpace(Vector3.new(dir.X, 0, dir.Z).Unit * dir.Magnitude)
                Fly.Position = Fly.Position + direction
            end

            root.CFrame = CFrame.new(Fly.Position, cam.CFrame.Position + (Fly.Position - cam.CFrame.Position) * 2)
            root.Velocity = Vector3.new(0, 0, 0)
            root.RotVelocity = Vector3.new(0, 0, 0)

            if Fly.Noclip then
                for _, part in pairs(char:GetChildren()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
    end)

    Fly.Tool.Unequipped:Connect(function()
        if Fly.Event then
            Fly.Event:Disconnect()
            Fly.Event = nil
        end
    end)

    if LocalPlayer.Backpack then
        Fly.Tool.Parent = LocalPlayer.Backpack
        Fly.Tool:Activate()
    end
end

local function StopFly()
    if not Fly.Enabled then return end

    Fly.Enabled = false

    if Fly.Event then
        Fly.Event:Disconnect()
        Fly.Event = nil
    end

    if Fly.Tool then
        Fly.Tool:Destroy()
        Fly.Tool = nil
    end

    local char = LocalPlayer.Character
    if char then
        for _, part in pairs(char:GetChildren()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
    end
end

local function TriggerBotCheck()
    if not TriggerBot.Enabled then return end
    if not currentChar or not currentHead then return end

    local currentTime = tick()
    if currentTime - TriggerBot.LastShot < TriggerBot.Delay then return end

    local mouse = LocalPlayer:GetMouse()
    local target = mouse.Target

    if target and target.Parent then
        local player = Players:GetPlayerFromCharacter(target.Parent)

        if player and player ~= LocalPlayer then
            if TriggerBot.TeamCheck and player.Team == LocalPlayer.Team then
                return
            end

            local character = player.Character
            if not character then return end

            local humanoid = character:FindFirstChild("Humanoid")
            if not humanoid or humanoid.Health <= 0 then return end

            local distance = (currentHead.Position - target.Position).Magnitude
            if distance > TriggerBot.Range then return end

            if TriggerBot.CheckVisible then
                local ray = Ray.new(currentHead.Position, (target.Position - currentHead.Position).Unit * distance)
                local hit, pos = Workspace:FindPartOnRayWithIgnoreList(ray, {currentChar, character})
                if hit and not hit:IsDescendantOf(character) then
                    return
                end
            end

            mouse1press()
            task.wait(0.05)
            mouse1release()

            TriggerBot.LastShot = currentTime
        end
    end
end

local function UpdateESP()
    for _, drawing in pairs(ESPDrawings) do
        if drawing then
            drawing:Remove()
        end
    end
    ESPDrawings = {}

    if not ESP.Enabled then return end

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local character = player.Character
            if character then
                local humanoid = character:FindFirstChild("Humanoid")
                local head = character:FindFirstChild("Head")
                local hrp = character:FindFirstChild("HumanoidRootPart")

                if humanoid and humanoid.Health > 0 and head and hrp then
                    if ESP.ShowBox then
                        local box = Drawing.new("Square")
                        box.Visible = true
                        box.Color = ESP.BoxColor
                        box.Thickness = 2
                        box.Filled = false
                        
                        table.insert(ESPDrawings, box)
                        
                        spawn(function()
                            while box do
                                local screenPos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
                                if onScreen then
                                    local size = Vector2.new(50, 80)
                                    box.Size = size
                                    box.Position = Vector2.new(screenPos.X - size.X/2, screenPos.Y - size.Y/2)
                                    box.Visible = true
                                else
                                    box.Visible = false
                                end
                                RunService.RenderStepped:Wait()
                            end
                        end)
                    end

                    if ESP.ShowName then
                        local nameTag = Drawing.new("Text")
                        nameTag.Visible = true
                        nameTag.Color = ESP.NameColor
                        nameTag.Size = 16
                        nameTag.Text = player.Name
                        nameTag.Center = true
                        
                        table.insert(ESPDrawings, nameTag)
                        
                        spawn(function()
                            while nameTag do
                                local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)
                                if onScreen then
                                    nameTag.Position = Vector2.new(screenPos.X, screenPos.Y - 50)
                                    nameTag.Visible = true
                                else
                                    nameTag.Visible = false
                                end
                                RunService.RenderStepped:Wait()
                            end
                        end)
                    end
                end
            end
        end
    end
end

local function TeleportToPlayer(playerName)
    local targetPlayer = Players:FindFirstChild(playerName)
    if not targetPlayer then return end

    local targetChar = targetPlayer.Character
    if not targetChar then return end

    local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
    if not targetHRP then return end

    local localChar = LocalPlayer.Character
    if not localChar then return end

    local localHRP = localChar:FindFirstChild("HumanoidRootPart")
    if not localHRP then return end

    local offset = targetHRP.CFrame.LookVector * -5
    localHRP.CFrame = CFrame.new(targetHRP.Position + offset + Vector3.new(0, 3, 0))
end

MainTab:CreateToggle({
    Name = "Enable Aimbot",
    CurrentValue = false,
    Callback = function(value)
        CustomAimbot.Enabled = value
        UpdateFOVCircle()
    end
})

MainTab:CreateToggle({
    Name = "Target Lock",
    CurrentValue = CustomAimbot.TargetLock,
    Callback = function(value)
        CustomAimbot.TargetLock = value
    end
})

MainTab:CreateSlider({
    Name = "Smoothing",
    Range = {0, 1},
    Increment = 0.05,
    CurrentValue = CustomAimbot.Smoothing,
    Callback = function(value)
        CustomAimbot.Smoothing = value
    end
})

MainTab:CreateSlider({
    Name = "FOV",
    Range = {10, 500},
    Increment = 5,
    CurrentValue = CustomAimbot.FOV,
    Callback = function(value)
        CustomAimbot.FOV = value
        UpdateFOVCircle()
    end
})

MainTab:CreateToggle({
    Name = "Show FOV Circle",
    CurrentValue = CustomAimbot.ShowFOV,
    Callback = function(value)
        CustomAimbot.ShowFOV = value
        UpdateFOVCircle()
    end
})

MainTab:CreateDropdown({
    Name = "Target Part",
    Options = {"Head", "HumanoidRootPart", "Torso"},
    CurrentOption = CustomAimbot.TargetPart,
    Callback = function(value)
        CustomAimbot.TargetPart = value
    end
})

MainTab:CreateToggle({
    Name = "Team Check",
    CurrentValue = CustomAimbot.TeamCheck,
    Callback = function(value)
        CustomAimbot.TeamCheck = value
    end
})

MainTab:CreateToggle({
    Name = "Visible Check",
    CurrentValue = CustomAimbot.VisibleCheck,
    Callback = function(value)
        CustomAimbot.VisibleCheck = value
    end
})

MainTab:CreateToggle({
    Name = "Enable Bunny Hop",
    CurrentValue = false,
    Callback = function(value)
        BunnyHop.Enabled = value
        
        if value then
            StartBunnyHop()
        else
            if BunnyHop.JumpThread then
                coroutine.close(BunnyHop.JumpThread)
                BunnyHop.JumpThread = nil
            end
        end
    end
})

MainTab:CreateToggle({
    Name = "Enable Auto Move",
    CurrentValue = false,
    Callback = function(value)
        AutoMove.Enabled = value
        
        if value then
            StartAutoMove()
        else
            if AutoMove.MoveThread then
                coroutine.close(AutoMove.MoveThread)
                AutoMove.MoveThread = nil
            end
        end
    end
})

MainTab:CreateSlider({
    Name = "Move Speed",
    Range = {0.5, 3.0},
    Increment = 0.1,
    CurrentValue = AutoMove.Speed,
    Callback = function(value)
        AutoMove.Speed = value
    end
})

MainTab:CreateToggle({
    Name = "Enable Auto Crouch",
    CurrentValue = false,
    Callback = function(value)
        AutoCrouch.Enabled = value
        
        if value then
            StartAutoCrouch()
        else
            if AutoCrouch.CrouchThread then
                coroutine.close(AutoCrouch.CrouchThread)
                AutoCrouch.CrouchThread = nil
            end
        end
    end
})

MainTab:CreateSlider({
    Name = "Crouch Speed",
    Range = {0.05, 0.5},
    Increment = 0.05,
    CurrentValue = AutoCrouch.Speed,
    Callback = function(value)
        AutoCrouch.Speed = value
        if AutoCrouch.Enabled then
            StartAutoCrouch()
        end
    end
})

MainTab:CreateToggle({
    Name = "Enable Trigger Bot",
    CurrentValue = false,
    Callback = function(value)
        TriggerBot.Enabled = value
    end
})

MainTab:CreateSlider({
    Name = "Trigger Delay",
    Range = {0.01, 0.5},
    Increment = 0.01,
    CurrentValue = TriggerBot.Delay,
    Callback = function(value)
        TriggerBot.Delay = value
    end
})

VisualTab:CreateToggle({
    Name = "Enable ESP",
    CurrentValue = false,
    Callback = function(value)
        ESP.Enabled = value
        UpdateESP()
    end
})

VisualTab:CreateToggle({
    Name = "Show Box",
    CurrentValue = ESP.ShowBox,
    Callback = function(value)
        ESP.ShowBox = value
        UpdateESP()
    end
})

VisualTab:CreateToggle({
    Name = "Show Name",
    CurrentValue = ESP.ShowName,
    Callback = function(value)
        ESP.ShowName = value
        UpdateESP()
    end
})

PlayerTab:CreateToggle({
    Name = "Enable Fly",
    CurrentValue = false,
    Callback = function(value)
        if value then
            StartFly()
        else
            StopFly()
        end
    end
})

PlayerTab:CreateSlider({
    Name = "Fly Speed",
    Range = {10, 200},
    Increment = 5,
    CurrentValue = Fly.Speed,
    Callback = function(value)
        Fly.Speed = value
    end
})

local function GetPlayerList()
    local players = {}
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            table.insert(players, player.Name)
        end
    end
    return players
end

local playerList = GetPlayerList()
TeleportTab:CreateDropdown({
    Name = "Select Player",
    Options = playerList,
    CurrentOption = playerList[1] or "",
    Callback = function(value)
        TeleportToPlayer(value)
    end
})

MiscTab:CreateButton({
    Name = "Destroy GUI",
    Callback = function()
        Rayfield:Destroy()
        for _, drawing in pairs(ESPDrawings) do
            if drawing then drawing:Remove() end
        end
        if FOVCircle then FOVCircle:Remove() end
    end
})

LocalPlayer.CharacterAdded:Connect(function(character)
    currentChar = character
    currentHRP = character:WaitForChild("HumanoidRootPart")
    currentHead = character:WaitForChild("Head")
end)

if LocalPlayer.Character then
    currentChar = LocalPlayer.Character
    currentHRP = currentChar:WaitForChild("HumanoidRootPart")
    currentHead = currentChar:WaitForChild("Head")
end

RunService.RenderStepped:Connect(function()
    if CustomAimbot.Enabled then
        local targetPlayer = GetClosestPlayerToMouse()
        
        if targetPlayer and targetPlayer.Character then
            local targetPart = targetPlayer.Character:FindFirstChild(CustomAimbot.TargetPart)
            
            if targetPart then
                if CustomAimbot.TargetLock or (not CustomAimbot.Target and Mouse.Target) then
                    CustomAimbot.Target = targetPlayer
                end
                
                if CustomAimbot.Target == targetPlayer then
                    local targetPosition = targetPart.Position
                    local smoothedPosition = SmoothAim(targetPosition)
                    
                    Camera.CFrame = CFrame.lookAt(Camera.CFrame.Position, smoothedPosition)
                end
            end
        elseif not CustomAimbot.TargetLock then
            CustomAimbot.Target = nil
        end
    end

    TriggerBotCheck()
    
    if ESP.Enabled then
        UpdateESP()
    end
end)

Rayfield:Notify({
    Title = "Hvh Ware v1.3",
    Content = "Loaded successfully!",
    Duration = 3,
    Image = "check"
})