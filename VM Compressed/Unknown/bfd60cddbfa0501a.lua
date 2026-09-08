
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "WarneX v0.3",
    LoadingTitle = "Version v0.3",
    LoadingSubtitle = "by WinetoX",
    ConfigurationSaving = { Enabled = false }
})


local TabMovement = Window:CreateTab("Movement", 4483362458)
local TabCombat = Window:CreateTab("Combat", 4483362458)
local TabMain = Window:CreateTab("Main", 4483362458)
local TabVisuals = Window:CreateTab("Visuals", 4483362458)


local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local Player = Players.LocalPlayer


local normalSpeed = 24
local hackSpeed = 102
local smallSpeed = 12
local speedBypass = false
local speedMultiplier = 0.02

local noclipEnabled = false
local infJumpEnabled = false
local promptBypass = false

local Humanoid
local Character


local function setupCharacter(char)
    Character = char
    Humanoid = char:WaitForChild("Humanoid")
    if speedBypass then
        task.spawn(function() speedLoop() end)
    else
        Humanoid.WalkSpeed = normalSpeed
    end
end

local function SendMessage(title, content, duration)
    Rayfield:Notify({
        Title = title or "Заходите в ТГК @StealaYT здесь будут новости о скрипте ",
        Content = content or "ТГК @StealaYT",
        Duration = duration or 6,
        Image = 4483362458, 
    })
end


TabMain:CreateButton({
    Name = "ТГК @StealaYT",
    Callback = function()
        SendMessage("Реклама", "Заходите в ТГК @StealaYT здесь будут новости о скрипте", 8)
    end,
})

local function SendMessage(title, content, duration)
    Rayfield:Notify({
        Title = title or "Заходите в ТГК @StealaYT здесь будут новости о скрипте ",
        Content = content or "ТГК @StealaYT",
        Duration = duration or 6,
        Image = 4483362458, 
    })
end


TabMovement:CreateButton({
    Name = "ТГК @StealaYT",
    Callback = function()
        SendMessage("Реклама", "Заходите в ТГК @StealaYT здесь будут новости о скрипте", 8)
    end,
})

local function SendMessage(title, content, duration)
    Rayfield:Notify({
        Title = title or "Заходите в ТГК @StealaYT здесь будут новости о скрипте ",
        Content = content or "ТГК @StealaYT",
        Duration = duration or 6,
        Image = 4483362458, 
    })
end


TabCombat:CreateButton({
    Name = "ТГК @StealaYT",
    Callback = function()
        SendMessage("Реклама", "Заходите в ТГК @StealaYT здесь будут новости о скрипте", 8)
    end,
})

local function SendMessage(title, content, duration)
    Rayfield:Notify({
        Title = title or "Заходите в ТГК @StealaYT здесь будут новости о скрипте ",
        Content = content or "ТГК @StealaYT",
        Duration = duration or 6,
        Image = 4483362458, 
    })
end


TabVisuals:CreateButton({
    Name = "ТГК @StealaYT",
    Callback = function()
        SendMessage("Реклама", "Заходите в ТГК @StealaYT здесь будут новости о скрипте", 8)
    end,
})

Player.CharacterAdded:Connect(setupCharacter)
if Player.Character then
    setupCharacter(Player.Character)
end


RunService.Stepped:Connect(function()
    if noclipEnabled and Character then
        for _, part in pairs(Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

TabMovement:CreateToggle({
    Name = "🚧 NoClip 🚧",
    CurrentValue = false,
    Flag = "NoClip",
    Callback = function(value)
        noclipEnabled = value
    end
})


UserInputService.JumpRequest:Connect(function()
    if infJumpEnabled and Humanoid then
        Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

TabMovement:CreateToggle({
    Name = "🔹 Infinite Jump 🔹",
    CurrentValue = false,
    Flag = "InfJump",
    Callback = function(value)
        infJumpEnabled = value
    end
})


function speedLoop()
    while speedBypass and Character and Humanoid do
        local root = Character:FindFirstChild("HumanoidRootPart")
        if root then
            local moveDir = Humanoid.MoveDirection
            if moveDir.Magnitude > 0 then
                local delta = moveDir.Unit * hackSpeed * speedMultiplier
                root.CFrame = root.CFrame + delta
            end
        end
        Humanoid.WalkSpeed = smallSpeed
        task.wait(0.0005)
    end
    if Humanoid then Humanoid.WalkSpeed = normalSpeed end
end

TabMovement:CreateToggle({
    Name = "🏃 Speed 🏃",
    CurrentValue = false,
    Flag = "Speed",
    Callback = function(value)
        speedBypass = value
        if Humanoid and Character then
            if speedBypass then
                task.spawn(speedLoop)
            else
                Humanoid.WalkSpeed = normalSpeed
            end
        end
    end
})

TabMovement:CreateSlider({
    Name = "🏃 Speed Boost 🏃",
    Range = {0.003, 0.04},
    Increment = 0.001,
    Suffix = "",
    CurrentValue = speedMultiplier,
    Flag = "SpeedMultiplier",
    Callback = function(Value)
        speedMultiplier = Value
    end
})


local jumpPowerEnabled = false
local jumpPowerValue = 50

local function applyJumpPower(char)
    local hum = char:WaitForChild("Humanoid")
    while jumpPowerEnabled and hum.Parent do
        hum.UseJumpPower = true
        hum.JumpPower = jumpPowerValue
        task.wait(0.2)
    end
end

TabMovement:CreateToggle({
    Name = "🔹 Jump 🔹",
    CurrentValue = false,
    Flag = "JumpPowerToggle",
    Callback = function(value)
        jumpPowerEnabled = value
        if jumpPowerEnabled and Player.Character then
            task.spawn(function()
                applyJumpPower(Player.Character)
            end)
        end
    end
})

TabMovement:CreateSlider({
    Name = "🔹 Jump Boost 🔹",
    Range = {50, 80},
    Increment = 1,
    Suffix = "",
    CurrentValue = jumpPowerValue,
    Flag = "JumpPowerSlider",
    Callback = function(Value)
        jumpPowerValue = Value
        if jumpPowerEnabled and Player.Character then
            local hum = Player.Character:FindFirstChild("Humanoid")
            if hum then
                hum.JumpPower = jumpPowerValue
            end
        end
    end
})

Player.CharacterAdded:Connect(function(char)
    if jumpPowerEnabled then
        task.spawn(function()
            applyJumpPower(char)
        end)
    end
end)


local autoStealEnabled = false

local function findPlayerPlot()
    local plots = workspace:FindFirstChild("Plots")
    if not plots then return nil end
    for i = 1, 8 do
        local plot = plots:FindFirstChild("Plot" .. i)
        if plot and plot:FindFirstChild("Owner") and plot.Owner:IsA("StringValue") then
            if plot.Owner.Value == Player.Name then
                return plot
            end
        end
    end
    return nil
end

TabCombat:CreateToggle({
    Name = "💰 Instant Steal 💰",
    CurrentValue = false,
    Flag = "AutoStealNPCHold",
    Callback = function(Value)
        autoStealEnabled = Value
        if autoStealEnabled then
            task.spawn(function()
                while autoStealEnabled do
                    local plot = findPlayerPlot()
                    if plot then
                        local npcZone = plot:FindFirstChild("NPCZone")
                        if npcZone then
                            while not npcZone:FindFirstChildOfClass("TouchTransmitter") do
                                task.wait(0.1)
                            end
                            local char = Player.Character
                            if char and char:FindFirstChild("HumanoidRootPart") then
                                local hrp = char.HumanoidRootPart
                                local originalPos = hrp.Position
                                local platform = Instance.new("Part")
                                platform.Size = Vector3.new(10,1,10)
                                platform.Anchored = true
                                platform.Transparency = 1
                                platform.CanCollide = true
                                platform.Position = originalPos + Vector3.new(0,1,0)
                                platform.Parent = workspace

                                hrp.CFrame = CFrame.new(platform.Position + Vector3.new(0,1,0))
                                hrp.Anchored = true
                                task.wait(0.1)
                                task.wait(2.5)

                                local npcOriginalPos = npcZone.Position
                                hrp.Anchored = false
                                npcZone.Position = hrp.Position
                                task.wait(0.3)
                                npcZone.Position = npcOriginalPos

                                repeat task.wait(0.1)
                                until not npcZone:FindFirstChildOfClass("TouchTransmitter")

                                hrp.CFrame = CFrame.new(originalPos)
                                hrp.Anchored = false
                                platform:Destroy()
                            end
                        end
                    end
                    task.wait(1)
                end
            end)
        end
    end
})

TabMovement:CreateButton({
    Name = "Bypass Noclipe",
    Callback = function()
        local connection = RunService.RenderStepped:Connect(WallTPOnce)
        task.delay(0.5, function()
            local character = Player.Character
            if character then
                local humanoid = character:FindFirstChild("Humanoid")
                if humanoid then
                    humanoid.Health = 0
                end
            end

            if connection then
                connection:Disconnect()
            end

            Rayfield:Notify({
                Title = "Bypass Noclipe",
                Content = "Система античит-защиты была успешно нейтрализована можете дальше бегал с No-clip",
                Duration = 5,
                Image = 4483362458
            })
        end)
    end
})
 
local function setPromptInstant(prompt)
    if prompt:IsA("ProximityPrompt") then
        prompt.HoldDuration = 0
    end
end

local function enablePromptBypass()
    for _, obj in pairs(workspace:GetDescendants()) do
        setPromptInstant(obj)
    end
    promptConnection = workspace.DescendantAdded:Connect(function(obj)
        setPromptInstant(obj)
    end)
end

local function disablePromptBypass()
    if promptConnection then
        promptConnection:Disconnect()
        promptConnection = nil
    end
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("ProximityPrompt") then
            obj.HoldDuration = 2 
        end
    end
end

TabCombat:CreateToggle({
    Name = "Instant ProximityPrompt",
    CurrentValue = false,
    Flag = "PromptBypass",
    Callback = function(value)
        promptBypass = value
        if promptBypass then
            enablePromptBypass()
        else
            disablePromptBypass()
        end
    end
})

do
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer

    local ESP_ON = false
    local Conns = {PlayerAdded=nil, PlayerRemoving=nil, ByPlayer={}}

    local function getAdornee(char)
        return char:FindFirstChild("Head")
            or char:FindFirstChild("UpperTorso")
            or char:FindFirstChild("Torso")
            or char:FindFirstChild("HumanoidRootPart")
    end

    local function applyESP(plr, char)
        if not ESP_ON or not plr or not char then return end
        local adornee = getAdornee(char)
        if not adornee then return end

       
        if not char:FindFirstChild("ESP_Highlight") then
            local h = Instance.new("Highlight")
            h.Name = "ESP_Highlight"
            h.FillTransparency = 1
            h.OutlineTransparency = 0
            h.OutlineColor = Color3.fromRGB(255,255,255)
            h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            h.Adornee = char
            h.Parent = char
        end

        
        local gui = char:FindFirstChild("ESP_Name")
        if not gui then
            gui = Instance.new("BillboardGui")
            gui.Name = "ESP_Name"
            gui.AlwaysOnTop = true
            gui.Size = UDim2.fromOffset(200, 50)
            gui.StudsOffset = Vector3.new(0, 2.6, 0)
            gui.Adornee = adornee
            gui.Parent = char

            local lbl = Instance.new("TextLabel")
            lbl.Name = "Text"
            lbl.BackgroundTransparency = 1
            lbl.Size = UDim2.fromScale(1, 1)
            lbl.Font = Enum.Font.SourceSansBold
            lbl.TextScaled = true
            lbl.TextColor3 = Color3.fromRGB(255,255,255)
            lbl.TextStrokeTransparency = 0
            lbl.TextStrokeColor3 = Color3.fromRGB(0,0,0)
            lbl.Text = plr.DisplayName and (plr.DisplayName.." (@"..plr.Name..")") or plr.Name
            lbl.Parent = gui
        else
            gui.Adornee = adornee
            local lbl = gui:FindFirstChildOfClass("TextLabel")
            if lbl then
                lbl.Text = plr.DisplayName and (plr.DisplayName.." (@"..plr.Name..")") or plr.Name
            end
        end
    end

    local function onCharAdded(plr, char)
        if not char then return end
        task.defer(function()
            char:WaitForChild("Humanoid", 5)
            applyESP(plr, char)
        end)
    end

    local function startESP()
        ESP_ON = true


        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer then
                Conns.ByPlayer[plr] = Conns.ByPlayer[plr] or {}
                table.insert(Conns.ByPlayer[plr], plr.CharacterAdded:Connect(function(ch)
                    onCharAdded(plr, ch)
                end))
                if plr.Character then onCharAdded(plr, plr.Character) end
            end
        end


        Conns.PlayerAdded = Players.PlayerAdded:Connect(function(plr)
            if plr == LocalPlayer then return end
            Conns.ByPlayer[plr] = Conns.ByPlayer[plr] or {}
            table.insert(Conns.ByPlayer[plr], plr.CharacterAdded:Connect(function(ch)
                onCharAdded(plr, ch)
            end))
            if plr.Character then onCharAdded(plr, plr.Character) end
        end)


        Conns.PlayerRemoving = Players.PlayerRemoving:Connect(function(plr)
            local list = Conns.ByPlayer[plr]
            if list then for _,c in ipairs(list) do c:Disconnect() end end
            Conns.ByPlayer[plr] = nil
        end)
    end

    local function stopESP()
        ESP_ON = false
        if Conns.PlayerAdded then Conns.PlayerAdded:Disconnect(); Conns.PlayerAdded=nil end
        if Conns.PlayerRemoving then Conns.PlayerRemoving:Disconnect(); Conns.PlayerRemoving=nil end
        for plr, list in pairs(Conns.ByPlayer) do
            for _,c in ipairs(list) do c:Disconnect() end
            Conns.ByPlayer[plr] = nil
        end
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Character then
                local ch = plr.Character
                local h = ch:FindFirstChild("ESP_Highlight"); if h then h:Destroy() end
                local b = ch:FindFirstChild("ESP_Name");     if b then b:Destroy() end
            end
        end
    end

    TabVisuals:CreateToggle({
        Name = "👀 ESP 👀",
        CurrentValue = false,
        Flag = "ESPPlayers",
        Callback = function(v)
            if v then startESP() else stopESP() end
        end
    })
end

local lockBaseEnabled = false
local lockBaseThread

local function getPlayerPlot()
    local Plots = workspace:WaitForChild("Plots")
    for i = 1, 8 do
        local plot = Plots:FindFirstChild("Plot" .. i)
        if plot and plot:FindFirstChild("Owner") then
            local ownerVal = plot.Owner
            if ownerVal:IsA("StringValue") and ownerVal.Value == Player.Name then
                return plot
            end
        end
    end
    return nil
end

local function lockBaseLoop()
    while lockBaseEnabled do
        local plot = getPlayerPlot()
        if plot then
            local baseLock = plot:FindFirstChild("BaseLock")
            if baseLock and baseLock:FindFirstChild("TouchPart") then
                local touchPart = baseLock.TouchPart
				touchPart.CanCollide = true
                local billboard = touchPart:FindFirstChild("BillboardGui")
                if billboard then
                    local timeLabel = billboard:FindFirstChild("TimeLabel")
                    if timeLabel and timeLabel:IsA("TextLabel") then
                        if timeLabel.Text == "Lock Base" then
                            local oldCFrame = touchPart.CFrame
                            local root = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
                            if root then
                                touchPart.CFrame = root.CFrame
                                task.wait(0.3)
                                touchPart.CFrame = oldCFrame
                            end
                        end
                    end
                end
            end
        end
        task.wait(0.1)
    end
end

TabMovement:CreateToggle({
    Name = "🔒 Auto Lock 🔒",
    CurrentValue = false,
    Flag = "LockBase",
    Callback = function(value)
        lockBaseEnabled = value
        if value then
            lockBaseThread = task.spawn(lockBaseLoop)
        else
            if lockBaseThread then
                task.cancel(lockBaseThread)
                lockBaseThread = nil
            end
        end
    end
})

local activeBillboards = {}

local function createBillboard(part, sourceLabel)
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "CustomBillboard"
    billboard.Adornee = part
    billboard.Size = UDim2.new(50, 0, 15, 0) 
    billboard.AlwaysOnTop = true
    billboard.MaxDistance = 1000
    billboard.ResetOnSpawn = false
    billboard.Parent = part

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.TextScaled = true
    textLabel.TextStrokeTransparency = 0
    textLabel.TextStrokeColor3 = Color3.new(0,0,0)
    textLabel.TextColor3 = Color3.new(1, 1, 1)
    textLabel.Font = Enum.Font.FredokaOne
    textLabel.Parent = billboard


    task.spawn(function()
        while billboard.Parent do
            if sourceLabel and sourceLabel:IsDescendantOf(game) then
                textLabel.Text = sourceLabel.Text
            else
                textLabel.Text = "???"
            end
            task.wait(0.2)
        end
    end)

    table.insert(activeBillboards, billboard)
end

local function enableBillboards()
    for i = 1,8 do
        local plot = workspace.Plots:FindFirstChild("Plot"..i)
        if plot then
            local baseLock = plot:FindFirstChild("BaseLock")
            local touchPart = baseLock and baseLock:FindFirstChild("TouchPart")
            local billboardGui = touchPart and touchPart:FindFirstChild("BillboardGui")
            local sign = plot:FindFirstChild("Sign")
            local part1 = sign and sign:FindFirstChild("Part1")

            if touchPart and billboardGui and part1 then
                local timeLabel = billboardGui:FindFirstChild("TimeLabel")
                if timeLabel then
                    createBillboard(part1, timeLabel)
                end
            end
        end
    end
end

local function disableBillboards()
    for _, bb in pairs(activeBillboards) do
        if bb and bb.Parent then
            bb:Destroy()
        end
    end
    activeBillboards = {}
end


TabVisuals:CreateToggle({
   Name = "👀ESP TIMER BASE 👀",
   CurrentValue = false,
   Flag = "TimersToggle",
   Callback = function(state)
       if state then
           enableBillboards()
       else
           disableBillboards()
       end
   end,
})
