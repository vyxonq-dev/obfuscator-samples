local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Auto Attack + Orbit + Kill Aura | Heckman900",
    Icon = "sword",
    LoadingTitle = "Loading...",
    LoadingSubtitle = "by Heckman900",
    Theme = "DarkBlue",
    DisableRayfieldPrompts = true,
    DisableBuildWarnings = true
})

local MainTab = Window:CreateTab("Main", "sword")
local LocalPlayerTab = Window:CreateTab("Local Player", "user")
local KillAuraTab = Window:CreateTab("Kill Aura", "crosshair")
local MysteryTab = Window:CreateTab("???", "shield")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local PathfindingService = game:GetService("PathfindingService")

local AttackRemote = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Attack")
local WindChargeRemote = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("WindCharge")

local AutoAttack = {
    Enabled = false,
    AttackValue = 0.62,
    AttackSpeed = 0.32,
    LoopConnection = nil
}

local AutoCrit = {
    Enabled = false,
    AttackSpeed = 0.32,
    LoopConnection = nil,
    waitingForLanding = false,
    LookAim = false,
    CritRange = 7
}

local BotCrit = {
    Enabled = false,
    CritRange = 7,
    PathUpdateDelay = 0.5,
    Connection = nil
}

local WindChargeLoop = {
    Enabled = false,
    AttackSpeed = 0.05,
    Connection = nil
}

local Orbit = {
    Enabled = false,
    DetectionRange = 30,
    OrbitDistance = 5,
    Speed = 8,
    Target = nil,
    Connection = nil,
    Angle = 0
}

local KillAura = {
    Enabled = false,
    Range = 15,
    AttackSpeed = 0.2,
    AttackValue = 0.381,
    Connection = nil,
    LastAttack = 0
}

local SlowFalling = {
    Enabled = false,
    FallSpeed = 10,
    Connection = nil
}

local InfiniteJump = {
    Enabled = false,
    Connection = nil
}

local TpWalk = {
    Enabled = false,
    Speed = 5,
    Connection = nil
}

local Spin = {
    Enabled = false,
    Speed = 5,
    Connection = nil
}

local SemiGod = {
    Enabled = false,
    Connection = nil
}

local function getCurrentToolName()
    local char = LocalPlayer.Character
    if not char then return nil end
    local tool = char:FindFirstChildWhichIsA("Tool")
    return tool and tool.Name or nil
end

local function getNearestTarget(range)
    local char = LocalPlayer.Character
    if not char then return nil end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return nil end

    local nearest = nil
    local shortestDist = range or math.huge

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local targetRoot = player.Character:FindFirstChild("HumanoidRootPart")
            local targetHumanoid = player.Character:FindFirstChild("Humanoid")
            if targetRoot and targetHumanoid and targetHumanoid.Health > 0 then
                local dist = (root.Position - targetRoot.Position).Magnitude
                if dist < shortestDist then
                    shortestDist = dist
                    nearest = player
                end
            end
        end
    end
    return nearest
end

local function getNearestTargetInSight(range)
    local char = LocalPlayer.Character
    if not char then return nil end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return nil end

    local camera = workspace.CurrentCamera
    local camCFrame = camera and camera.CFrame
    if not camCFrame then return getNearestTarget(range) end

    local forward = camCFrame.LookVector
    local nearest = nil
    local shortestDist = math.huge

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local targetRoot = player.Character:FindFirstChild("HumanoidRootPart")
            local targetHumanoid = player.Character:FindFirstChild("Humanoid")
            if targetRoot and targetHumanoid and targetHumanoid.Health > 0 then
                local dist = (root.Position - targetRoot.Position).Magnitude
                if dist <= (range or math.huge) then
                    local dirToTarget = (targetRoot.Position - root.Position).Unit
                    local dotProduct = forward:Dot(dirToTarget)
                    if dotProduct > 0.3 then
                        if dist < shortestDist then
                            shortestDist = dist
                            nearest = player
                        end
                    end
                end
            end
        end
    end
    return nearest
end

local function getNearestNPC(range)
    local char = LocalPlayer.Character
    if not char then return nil end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return nil end

    local nearest = nil
    local shortestDist = range

    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("Model") and not Players:GetPlayerFromCharacter(obj) then
            local humanoid = obj:FindFirstChildWhichIsA("Humanoid")
            local targetRoot = obj:FindFirstChild("HumanoidRootPart")
            if humanoid and humanoid.Health > 0 and targetRoot then
                local dist = (root.Position - targetRoot.Position).Magnitude
                if dist <= shortestDist then
                    shortestDist = dist
                    nearest = obj
                end
            end
        end
    end
    return nearest
end

local function attackTarget(targetCharacter, damageOverride)
    if not targetCharacter then return end
    local toolName = getCurrentToolName()
    if not toolName then return end

    local damage = damageOverride or AutoAttack.AttackValue
    local args = {
        targetCharacter,
        damage,
        nil,
        toolName
    }
    pcall(function()
        AttackRemote:FireServer(unpack(args))
    end)
end

local function windChargeAttack(targetPlayer)
    local ourChar = LocalPlayer.Character
    if not ourChar then return end
    local ourRoot = ourChar:FindFirstChild("HumanoidRootPart")
    if not ourRoot then return end

    local targetRoot = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not targetRoot then return end

    local direction = (targetRoot.Position - ourRoot.Position).Unit
    local cframe = CFrame.lookAt(ourRoot.Position, ourRoot.Position + direction)

    pcall(function()
        WindChargeRemote:FireServer(cframe)
    end)
end

local function startAutoAttackLoop()
    if AutoAttack.LoopConnection then AutoAttack.LoopConnection:Disconnect() end
    AutoAttack.LoopConnection = RunService.RenderStepped:Connect(function()
        if not AutoAttack.Enabled or not LocalPlayer.Character then return end
        local targetPlayer = getNearestTarget(math.huge)
        if targetPlayer then
            local now = tick()
            if not AutoAttack._lastAttack or (now - AutoAttack._lastAttack) >= AutoAttack.AttackSpeed then
                AutoAttack._lastAttack = now
                attackTarget(targetPlayer.Character)
            end
        end
    end)
end

local function startAutoCritLoop()
    if AutoCrit.LoopConnection then AutoCrit.LoopConnection:Disconnect() end
    AutoCrit.waitingForLanding = false
    AutoCrit.LoopConnection = RunService.RenderStepped:Connect(function()
        if not AutoCrit.Enabled or not LocalPlayer.Character then return end
        local char = LocalPlayer.Character
        local humanoid = char:FindFirstChild("Humanoid")
        local root = char:FindFirstChild("HumanoidRootPart")
        if not humanoid or not root then return end

        local grounded = humanoid.FloorMaterial ~= Enum.Material.Air
        local targetPlayer = nil

        if AutoCrit.LookAim then
            targetPlayer = getNearestTargetInSight(AutoCrit.CritRange)
        else
            local candidate = getNearestTarget(math.huge)
            if candidate then
                local dist = (root.Position - candidate.Character.HumanoidRootPart.Position).Magnitude
                if dist <= AutoCrit.CritRange then
                    targetPlayer = candidate
                end
            end
        end

        if not targetPlayer then
            AutoCrit.waitingForLanding = false
            return
        end

        if grounded and not AutoCrit.waitingForLanding then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            attackTarget(targetPlayer.Character, 1)
            AutoCrit.waitingForLanding = true
        elseif grounded and AutoCrit.waitingForLanding then
            AutoCrit.waitingForLanding = false
        end
    end)
end

local FloatingButton = Instance.new("ScreenGui")
FloatingButton.Name = "FloatingCritToggle"
FloatingButton.ResetOnSpawn = false
FloatingButton.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
FloatingButton.Parent = LocalPlayer:WaitForChild("PlayerGui")

local ButtonFrame = Instance.new("Frame")
ButtonFrame.Size = UDim2.new(0, 56, 0, 56)
ButtonFrame.Position = UDim2.new(0.8, 0, 0.7, 0)
ButtonFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ButtonFrame.BorderSizePixel = 0
ButtonFrame.Active = true
ButtonFrame.Draggable = true
ButtonFrame.Selectable = false
ButtonFrame.Parent = FloatingButton

local UICornerBtn = Instance.new("UICorner")
UICornerBtn.CornerRadius = UDim.new(1, 0)
UICornerBtn.Parent = ButtonFrame

local UIStrokeBtn = Instance.new("UIStroke")
UIStrokeBtn.Thickness = 2
UIStrokeBtn.Color = Color3.fromRGB(255, 80, 80)
UIStrokeBtn.Parent = ButtonFrame

local ButtonLabel = Instance.new("TextLabel")
ButtonLabel.Size = UDim2.new(1, 0, 1, 0)
ButtonLabel.BackgroundTransparency = 1
ButtonLabel.Text = "CRIT"
ButtonLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ButtonLabel.TextSize = 14
ButtonLabel.Font = Enum.Font.SourceSansBold
ButtonLabel.Parent = ButtonFrame

local StatusIndicator = Instance.new("Frame")
StatusIndicator.Size = UDim2.new(0, 12, 0, 12)
StatusIndicator.Position = UDim2.new(1, -6, 0, -6)
StatusIndicator.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
StatusIndicator.BorderSizePixel = 0
StatusIndicator.ZIndex = 5
StatusIndicator.Parent = ButtonFrame
local StatusCorner = Instance.new("UICorner")
StatusCorner.CornerRadius = UDim.new(1, 0)
StatusCorner.Parent = StatusIndicator

local function updateFloatingButtonState()
    if AutoCrit.Enabled then
        StatusIndicator.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    else
        StatusIndicator.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    end
end

local function toggleAutoCrit()
    AutoCrit.Enabled = not AutoCrit.Enabled
    if AutoCrit.Enabled then
        startAutoCritLoop()
    else
        if AutoCrit.LoopConnection then
            AutoCrit.LoopConnection:Disconnect()
            AutoCrit.LoopConnection = nil
        end
    end
    updateFloatingButtonState()
end

ButtonFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        toggleAutoCrit()
    end
end)

updateFloatingButtonState()

local function startWindChargeLoop()
    if WindChargeLoop.Connection then WindChargeLoop.Connection:Disconnect() end
    WindChargeLoop.Connection = RunService.RenderStepped:Connect(function()
        if not WindChargeLoop.Enabled or not LocalPlayer.Character then return end
        local target = getNearestTarget(math.huge)
        if target then
            local now = tick()
            if not WindChargeLoop._last or (now - WindChargeLoop._last) >= WindChargeLoop.AttackSpeed then
                WindChargeLoop._last = now
                windChargeAttack(target)
            end
        end
    end)
end

local function startOrbitLoop()
    if Orbit.Connection then Orbit.Connection:Disconnect() end
    Orbit.Connection = RunService.RenderStepped:Connect(function(deltaTime)
        if not Orbit.Enabled then return end
        local char = LocalPlayer.Character
        if not char then return end
        local root = char:FindFirstChild("HumanoidRootPart")
        if not root then return end

        if not Orbit.Target or not Orbit.Target.Character then
            Orbit.Target = getNearestTarget(Orbit.DetectionRange)
            if not Orbit.Target then return end
            Orbit.Angle = math.random() * math.pi * 2
        end

        local targetRoot = Orbit.Target.Character:FindFirstChild("HumanoidRootPart")
        local targetHumanoid = Orbit.Target.Character:FindFirstChild("Humanoid")
        if not targetRoot or not targetHumanoid or targetHumanoid.Health <= 0 then
            Orbit.Target = getNearestTarget(Orbit.DetectionRange)
            if not Orbit.Target then return end
            Orbit.Angle = math.random() * math.pi * 2
            return
        end

        local dist = (root.Position - targetRoot.Position).Magnitude
        if dist > Orbit.DetectionRange * 1.5 then
            Orbit.Target = getNearestTarget(Orbit.DetectionRange)
            if not Orbit.Target then return end
            Orbit.Angle = math.random() * math.pi * 2
            return
        end

        local targetPos = targetRoot.Position
        Orbit.Angle = Orbit.Angle + Orbit.Speed * deltaTime
        local offset = Vector3.new(math.cos(Orbit.Angle) * Orbit.OrbitDistance, 0, math.sin(Orbit.Angle) * Orbit.OrbitDistance)
        local newPos = targetPos + offset
        newPos = Vector3.new(newPos.X, targetPos.Y, newPos.Z)
        local lookDir = (targetPos - newPos).Unit
        local right = lookDir:Cross(Vector3.new(0,1,0)).Unit
        local up = right:Cross(lookDir).Unit
        root.CFrame = CFrame.fromMatrix(newPos, right, up)
        root.AssemblyLinearVelocity = Vector3.zero
        root.AssemblyAngularVelocity = Vector3.zero
    end)
end

local function startKillAuraLoop()
    if KillAura.Connection then KillAura.Connection:Disconnect() end
    KillAura.Connection = RunService.RenderStepped:Connect(function()
        if not KillAura.Enabled or not LocalPlayer.Character then return end
        local npc = getNearestNPC(KillAura.Range)
        if npc then
            local now = tick()
            if now - KillAura.LastAttack >= KillAura.AttackSpeed then
                KillAura.LastAttack = now
                attackTarget(npc, KillAura.AttackValue)
            end
        end
    end)
end

local function startSlowFallingLoop()
    if SlowFalling.Connection then SlowFalling.Connection:Disconnect() end
    SlowFalling.Connection = RunService.RenderStepped:Connect(function()
        if not SlowFalling.Enabled then return end
        local char = LocalPlayer.Character
        if not char then return end
        local root = char:FindFirstChild("HumanoidRootPart")
        if not root then return end
        local vel = root.Velocity
        if vel.Y < -1 then
            local newVel = Vector3.new(vel.X, math.max(vel.Y, -SlowFalling.FallSpeed), vel.Z)
            root.Velocity = newVel
        end
    end)
end

local function startInfiniteJumpLoop()
    if InfiniteJump.Connection then InfiniteJump.Connection:Disconnect() end
    InfiniteJump.Connection = UserInputService.JumpRequest:Connect(function()
        if not InfiniteJump.Enabled then return end
        local char = LocalPlayer.Character
        if not char then return end
        local humanoid = char:FindFirstChild("Humanoid")
        if not humanoid then return end
        pcall(function()
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end)
    end)
end

local function startTpWalkLoop()
    if TpWalk.Connection then TpWalk.Connection:Disconnect() end
    TpWalk.Connection = RunService.RenderStepped:Connect(function()
        if not TpWalk.Enabled then return end
        local char = LocalPlayer.Character
        if not char then return end
        local humanoid = char:FindFirstChild("Humanoid")
        local root = char:FindFirstChild("HumanoidRootPart")
        if not humanoid or not root then return end
        local moveDir = humanoid.MoveDirection
        if moveDir.Magnitude > 0 then
            local newPos = root.Position + moveDir * TpWalk.Speed
            root.CFrame = CFrame.new(newPos)
        end
    end)
end

local function startSpinLoop()
    if Spin.Connection then Spin.Connection:Disconnect() end
    local char = LocalPlayer.Character
    if not char then return end
    local humanoid = char:FindFirstChild("Humanoid")
    if humanoid then humanoid.AutoRotate = false end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    local angle = 0
    Spin.Connection = RunService.RenderStepped:Connect(function(deltaTime)
        if not Spin.Enabled then return end
        if not root or not root:IsDescendantOf(workspace) then return end
        angle = angle + Spin.Speed * deltaTime * 5
        local pos = root.CFrame.Position
        root.CFrame = CFrame.new(pos) * CFrame.Angles(0, angle, 0)
    end)
end

local function stopSpinLoop()
    if Spin.Connection then
        Spin.Connection:Disconnect()
        Spin.Connection = nil
    end
    local char = LocalPlayer.Character
    if char then
        local humanoid = char:FindFirstChild("Humanoid")
        if humanoid then humanoid.AutoRotate = true end
        local root = char:FindFirstChild("HumanoidRootPart")
        if root then root.RotVelocity = Vector3.zero end
    end
end

local function startSemiGodLoop()
    if SemiGod.Connection then SemiGod.Connection:Disconnect() end
    SemiGod.Connection = RunService.RenderStepped:Connect(function()
        if not SemiGod.Enabled then return end
        local char = LocalPlayer.Character
        if not char then return end
        local fireShield = char:FindFirstChild("FireShield")
        if fireShield then
            pcall(function()
                fireShield:FireServer(true)
            end)
        end
    end)
end

local function getNearestPlayerForBot()
    local char = LocalPlayer.Character
    if not char then return nil end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return nil end

    local nearest = nil
    local shortestDist = math.huge
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local targetRoot = player.Character:FindFirstChild("HumanoidRootPart")
            local targetHumanoid = player.Character:FindFirstChild("Humanoid")
            if targetRoot and targetHumanoid and targetHumanoid.Health > 0 then
                local dist = (root.Position - targetRoot.Position).Magnitude
                if dist < shortestDist then
                    shortestDist = dist
                    nearest = player
                end
            end
        end
    end
    return nearest
end

local function startBotCritLoop()
    if BotCrit.Connection then BotCrit.Connection:Disconnect() end
    local char = LocalPlayer.Character
    if not char then return end
    local humanoid = char:FindFirstChild("Humanoid")
    if not humanoid then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end

    local currentPath = nil
    local waypointIndex = 1
    local lastPathUpdate = 0

    BotCrit.Connection = RunService.Heartbeat:Connect(function(deltaTime)
        if not BotCrit.Enabled or not LocalPlayer.Character then return end
        local char = LocalPlayer.Character
        local humanoid = char:FindFirstChild("Humanoid")
        local root = char:FindFirstChild("HumanoidRootPart")
        if not humanoid or not root then return end

        local target = getNearestPlayerForBot()
        if not target then return end
        local targetRoot = target.Character:FindFirstChild("HumanoidRootPart")
        if not targetRoot then return end

        local distance = (root.Position - targetRoot.Position).Magnitude

        root.CFrame = CFrame.lookAt(root.Position, Vector3.new(targetRoot.Position.X, root.Position.Y, targetRoot.Position.Z))

        if distance <= BotCrit.CritRange then
            humanoid:MoveTo(root.Position)
            if not AutoCrit.Enabled then
                AutoCrit.Enabled = true
                startAutoCritLoop()
                updateFloatingButtonState()
            end
        else
            if TpWalk.Enabled then
                local direction = (targetRoot.Position - root.Position).Unit
                local newPos = root.Position + direction * TpWalk.Speed
                root.CFrame = CFrame.new(newPos)
            else
                if tick() - lastPathUpdate > BotCrit.PathUpdateDelay then
                    lastPathUpdate = tick()
                    local path = PathfindingService:CreatePath({
                        AgentRadius = 2,
                        AgentHeight = 5,
                        AgentCanJump = true,
                        AgentMaxSlope = 60,
                        WaypointSpacing = 3
                    })
                    local success = pcall(function()
                        path:ComputeAsync(root.Position, targetRoot.Position)
                    end)
                    if success and path.Status == Enum.PathStatus.Success then
                        currentPath = path
                        waypointIndex = 1
                    else
                        currentPath = nil
                    end
                end

                if currentPath then
                    local waypoints = currentPath:GetWaypoints()
                    if #waypoints > 0 then
                        if waypointIndex > #waypoints then waypointIndex = 1 end
                        local waypoint = waypoints[waypointIndex]
                        if waypoint.Action == Enum.PathWaypointAction.Jump then
                            humanoid.Jump = true
                        end
                        humanoid:MoveTo(waypoint.Position)
                        if (root.Position - waypoint.Position).Magnitude < 4 then
                            waypointIndex = waypointIndex + 1
                        end
                    end
                else
                    humanoid:MoveTo(targetRoot.Position)
                end
            end
        end
    end)
end

LocalPlayer.CharacterAdded:Connect(function()
    task.wait(0.5)
    if Spin.Enabled then startSpinLoop() end
    if AutoAttack.Enabled then startAutoAttackLoop() end
    if AutoCrit.Enabled then startAutoCritLoop() end
    if WindChargeLoop.Enabled then startWindChargeLoop() end
    if Orbit.Enabled then startOrbitLoop() end
    if KillAura.Enabled then startKillAuraLoop() end
    if SlowFalling.Enabled then startSlowFallingLoop() end
    if InfiniteJump.Enabled then startInfiniteJumpLoop() end
    if TpWalk.Enabled then startTpWalkLoop() end
    if SemiGod.Enabled then startSemiGodLoop() end
    if BotCrit.Enabled then startBotCritLoop() end
    updateFloatingButtonState()
end)

MainTab:CreateToggle({
    Name = "Enable Auto Attack (Players)",
    CurrentValue = false,
    Callback = function(Value)
        AutoAttack.Enabled = Value
        if Value then startAutoAttackLoop() else
            if AutoAttack.LoopConnection then AutoAttack.LoopConnection:Disconnect() end
        end
    end
})

MainTab:CreateSlider({
    Name = "Attack Speed",
    Range = {0.01, 1},
    Increment = 0.01,
    Suffix = "s",
    CurrentValue = 0.32,
    Callback = function(v) AutoAttack.AttackSpeed = v end
})

MainTab:CreateSlider({
    Name = "Attack Value",
    Range = {0.01, 2},
    Increment = 0.001,
    Suffix = "",
    CurrentValue = 0.62,
    Callback = function(v) AutoAttack.AttackValue = v end
})

MainTab:CreateDivider()

MainTab:CreateToggle({
    Name = "Enable Auto Crit (Jump + Hit)",
    CurrentValue = false,
    Callback = function(Value)
        AutoCrit.Enabled = Value
        if Value then startAutoCritLoop() else
            if AutoCrit.LoopConnection then AutoCrit.LoopConnection:Disconnect() end
        end
        updateFloatingButtonState()
    end
})

MainTab:CreateSlider({
    Name = "Crit Speed",
    Range = {0.01, 1},
    Increment = 0.01,
    Suffix = "s",
    CurrentValue = 0.32,
    Callback = function(v) AutoCrit.AttackSpeed = v end
})

MainTab:CreateToggle({
    Name = "Auto Crit Look-Aim",
    CurrentValue = false,
    Callback = function(Value) AutoCrit.LookAim = Value end
})

MainTab:CreateSlider({
    Name = "Crit Range",
    Range = {3, 15},
    Increment = 1,
    Suffix = "studs",
    CurrentValue = 7,
    Callback = function(v) AutoCrit.CritRange = v end
})

MainTab:CreateDivider()

MainTab:CreateToggle({
    Name = "Bot Crit (Auto Walk + Crit)",
    CurrentValue = false,
    Callback = function(Value)
        BotCrit.Enabled = Value
        if Value then
            startBotCritLoop()
        else
            if BotCrit.Connection then BotCrit.Connection:Disconnect() end
            if AutoCrit.Enabled then
                AutoCrit.Enabled = false
                if AutoCrit.LoopConnection then AutoCrit.LoopConnection:Disconnect() end
                updateFloatingButtonState()
            end
        end
    end
})

MainTab:CreateSlider({
    Name = "Bot Crit Range",
    Range = {3, 15},
    Increment = 1,
    Suffix = "studs",
    CurrentValue = 7,
    Callback = function(v) BotCrit.CritRange = v end
})

MainTab:CreateLabel("Made by Heckman900", Color3.fromRGB(255, 215, 0))

MainTab:CreateDivider()

MainTab:CreateToggle({
    Name = "Auto Throw Wind Charge (Needs Wind Charge)",
    CurrentValue = false,
    Callback = function(Value)
        WindChargeLoop.Enabled = Value
        if Value then
            Rayfield:Notify({
                Title = "Wind Charge Warning",
                Content = "You need a Wind Charge item to use this!",
                Duration = 4,
                Image = "sword"
            })
            startWindChargeLoop()
        else
            if WindChargeLoop.Connection then WindChargeLoop.Connection:Disconnect() end
        end
    end
})

MainTab:CreateSlider({
    Name = "WindCharge Speed",
    Range = {0.01, 0.5},
    Increment = 0.01,
    Suffix = "s",
    CurrentValue = 0.05,
    Callback = function(v) WindChargeLoop.AttackSpeed = v end
})

MainTab:CreateDivider()

MainTab:CreateToggle({
    Name = "Orbit Nearest Player",
    CurrentValue = false,
    Callback = function(Value)
        Orbit.Enabled = Value
        if Value then
            startOrbitLoop()
        else
            if Orbit.Connection then Orbit.Connection:Disconnect() end
            Orbit.Target = nil
        end
    end
})

MainTab:CreateSlider({
    Name = "Detection Range",
    Range = {5, 60},
    Increment = 1,
    Suffix = "studs",
    CurrentValue = 30,
    Callback = function(v) Orbit.DetectionRange = v end
})

MainTab:CreateSlider({
    Name = "Orbit Distance",
    Range = {3, 10},
    Increment = 1,
    Suffix = "studs",
    CurrentValue = 5,
    Callback = function(v) Orbit.OrbitDistance = v end
})

MainTab:CreateSlider({
    Name = "Orbit Speed",
    Range = {2, 20},
    Increment = 1,
    Suffix = "rad/s",
    CurrentValue = 8,
    Callback = function(v) Orbit.Speed = v end
})

MainTab:CreateLabel("Made by Heckman900", Color3.fromRGB(255, 215, 0))

KillAuraTab:CreateToggle({
    Name = "Enable Kill Aura (NPCs)",
    CurrentValue = false,
    Callback = function(Value)
        KillAura.Enabled = Value
        if Value then startKillAuraLoop() else
            if KillAura.Connection then KillAura.Connection:Disconnect() end
        end
    end
})

KillAuraTab:CreateSlider({
    Name = "Kill Aura Range",
    Range = {5, 30},
    Increment = 1,
    Suffix = "studs",
    CurrentValue = 15,
    Callback = function(v) KillAura.Range = v end
})

KillAuraTab:CreateSlider({
    Name = "Attack Speed",
    Range = {0.05, 1},
    Increment = 0.01,
    Suffix = "s",
    CurrentValue = 0.2,
    Callback = function(v) KillAura.AttackSpeed = v end
})

KillAuraTab:CreateSlider({
    Name = "Damage (Attack Value)",
    Range = {0.01, 5},
    Increment = 0.01,
    Suffix = "",
    CurrentValue = 0.381,
    Callback = function(v) KillAura.AttackValue = v end
})

KillAuraTab:CreateLabel("Made by Heckman900", Color3.fromRGB(255, 215, 0))

LocalPlayerTab:CreateToggle({
    Name = "TP Walk",
    CurrentValue = false,
    Callback = function(Value)
        TpWalk.Enabled = Value
        if Value then startTpWalkLoop() else
            if TpWalk.Connection then TpWalk.Connection:Disconnect() end
        end
    end
})

LocalPlayerTab:CreateSlider({
    Name = "TP Walk Speed",
    Range = {1, 20},
    Increment = 1,
    Suffix = "studs",
    CurrentValue = 5,
    Callback = function(v) TpWalk.Speed = v end
})

LocalPlayerTab:CreateToggle({
    Name = "Slow Falling",
    CurrentValue = false,
    Callback = function(Value)
        SlowFalling.Enabled = Value
        if Value then startSlowFallingLoop() else
            if SlowFalling.Connection then SlowFalling.Connection:Disconnect() end
        end
    end
})

LocalPlayerTab:CreateSlider({
    Name = "Fall Speed",
    Range = {2, 30},
    Increment = 1,
    Suffix = "studs/s",
    CurrentValue = 10,
    Callback = function(v) SlowFalling.FallSpeed = v end
})

LocalPlayerTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Callback = function(Value)
        InfiniteJump.Enabled = Value
        if Value then startInfiniteJumpLoop() else
            if InfiniteJump.Connection then InfiniteJump.Connection:Disconnect() end
        end
    end
})

LocalPlayerTab:CreateToggle({
    Name = "Spin",
    CurrentValue = false,
    Callback = function(Value)
        Spin.Enabled = Value
        if Value then startSpinLoop() else stopSpinLoop() end
    end
})

LocalPlayerTab:CreateSlider({
    Name = "Spin Speed",
    Range = {1, 20},
    Increment = 1,
    Suffix = "",
    CurrentValue = 5,
    Callback = function(v) Spin.Speed = v end
})

LocalPlayerTab:CreateLabel("Made by Heckman900", Color3.fromRGB(255, 215, 0))

MysteryTab:CreateToggle({
    Name = "Semi God",
    CurrentValue = false,
    Callback = function(Value)
        SemiGod.Enabled = Value
        if Value then startSemiGodLoop() else
            if SemiGod.Connection then SemiGod.Connection:Disconnect() end
        end
    end
})

MysteryTab:CreateLabel("Made by Heckman900", Color3.fromRGB(255, 215, 0))

Rayfield:Notify({Title = "Script Loaded", Content = "All features ready. Made by Heckman900", Duration = 5, Image = "sword"})