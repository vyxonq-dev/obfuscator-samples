--loadstring(game:HttpGet("https://raw.githubusercontent.com/mafuasahina/whatever/main/sharkbite2"))()

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Sharkbite 2",
    LoadingTitle = "Sharkbite 2 whatever",
    LoadingSubtitle = "by mafuyu",
    Theme = "Default",
    ToggleUIKeybind = "K",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "SharkConfig"
    },
    Discord = {
        Enabled = false,
        Invite = "",
        RememberJoins = true
    },
    KeySystem = false
})

local Tab = Window:CreateTab("Main", 4483362458)

local remote = nil
local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")
local character = player.Character or player.CharacterAdded:Wait()
local sharkName = nil
local remotesFolder = game:GetService("ReplicatedStorage"):WaitForChild("Projectiles"):WaitForChild("Events"):WaitForChild("Weapons"):WaitForChild("remotes")

local function hookRemote(remoteObject)
    local mt = getrawmetatable(game)
    setreadonly(mt, false)
    local oldNamecall = mt.__namecall
    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        if self == remoteObject and (method == "FireServer" or method == "InvokeServer") then
            remote = self.Name
        end
        return oldNamecall(self, ...)
    end)
end

for _, child in ipairs(remotesFolder:GetChildren()) do
    if child:IsA("RemoteEvent") or child:IsA("RemoteFunction") then
        pcall(function()
            hookRemote(child)
        end)
    end
end

local afk = player.PlayerScripts:FindFirstChild("AFK")
if afk then
    afk:Destroy()
end

local hud = player.PlayerScripts:FindFirstChild("HUD")
if hud then
    local oxygen = hud:FindFirstChild("Oxygen")
    if oxygen then
        oxygen:Destroy()
    end
end

local function getShark()
    local sharksFolder = workspace:FindFirstChild("Sharks")
    if sharksFolder then
        for _, shark in ipairs(sharksFolder:GetChildren()) do
            if shark:IsA("Model") then
                sharkName = shark.Name
                return
            end
        end
    end
    sharkName = nil
end

local function KillShark()
    for _, tool in ipairs(backpack:GetChildren()) do
        if tool:IsA("Tool") then
            tool.Parent = character
        end
    end
    for j = 1, 20 do
        if sharkName and remote then
            local shark = workspace:WaitForChild("Sharks"):FindFirstChild(sharkName)
            game:GetService("ReplicatedStorage")
                :WaitForChild("Projectiles")
                :WaitForChild("Events")
                :WaitForChild("Weapons")
                :WaitForChild("remotes")
                :WaitForChild(remote):FireServer(shark,true)
        end
    end
end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local center = Vector3.new(0, -100, 0)
local radius = 1000
local speed = math.pi * 2
local angle = 0
local hrp

local function updateHRP()
    character = player.Character or player.CharacterAdded:Wait()
    backpack = player:WaitForChild("Backpack")
    hrp = character:WaitForChild("HumanoidRootPart")
end

player.CharacterAdded:Connect(updateHRP)
if player.Character then updateHRP() end

local runningConnection
local Toggle

local Section1 = Tab:CreateSection("Autofarm")

Toggle = Tab:CreateToggle({
    Name = "Auto Instakill shark [Shoot shark once to enable]",
    CurrentValue = false,
    Flag = "AutoKillShark",
    Callback = function(on)
        if on and (not getrawmetatable or not setreadonly or not newcclosure) then
            task.delay(.2, function()
                Rayfield.Flags["AutoKillShark"]:Set(false)
            end)

            Rayfield:Notify({
                Title = "Executor too weak",
                Content = "Your executor does not support getrawmetatable, setreadonly, or newcclosure.",
                Duration = 3
            })

            return
        end

        if on then
            local lastNotify = 0
            runningConnection = RunService.Heartbeat:Connect(function(dt)
                if player.Team and player.Team.Name ~= "Shark" and hrp then
                    if not remote then
                        if tick() - lastNotify >= 3 then
                            Rayfield:Notify({
                                Title = "Waiting for shark to be shot",
                                Content = "Shoot shark to enable autofarm",
                                Duration = 3
                            })
                            lastNotify = tick()
                        end
                        return
                    end
                    KillShark()
                    getShark()
                    if not sharkName then
                        local chinook = workspace:FindFirstChild("Chinook")
                        local interior = chinook and chinook:FindFirstChild("interior")
                        if interior then
                            hrp.CFrame = interior.CFrame
                        end
                    else
                        angle += speed * dt
                        local t = (angle % (math.pi * 2)) / (math.pi * 2)
                        local offset
                        if t < 0.25 then
                            offset = Vector3.new(radius, 0, -radius + 8 * radius * t)
                        elseif t < 0.5 then
                            offset = Vector3.new(radius - 8 * radius * (t - 0.25), 0, radius)
                        elseif t < 0.75 then
                            offset = Vector3.new(-radius, 0, radius - 8 * radius * (t - 0.5))
                        else
                            offset = Vector3.new(-radius + 8 * radius * (t - 0.75), 0, -radius)
                        end
                        hrp.CFrame = CFrame.new(center + offset, center)
                    end
                end
            end)
            player.CharacterAdded:Connect(updateHRP)
        else
            if runningConnection then
                runningConnection:Disconnect()
                runningConnection = nil
            end
        end
    end,
})

local AutoWinConnection
local SharksDescendantConnection
local DestructionParts = {}

local function addDestructionPart(part)
    table.insert(DestructionParts, part)
    part.AncestryChanged:Connect(function(_, parent)
        if not parent then
            for i = #DestructionParts, 1, -1 do
                if DestructionParts[i] == part then
                    table.remove(DestructionParts, i)
                    break
                end
            end
        end
    end)
end

local function getNearestSurvivorToPart(part)
    local nearestPlayer = nil
    local nearestDist = math.huge
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= player and plr.Team and plr.Team.Name == "Survivor" then
            local char = plr.Character
            local hrpTarget = char and char:FindFirstChild("HumanoidRootPart")
            if hrpTarget and not hrpTarget:FindFirstChild("Attachment") then
                local dist = (hrpTarget.Position - part.Position).Magnitude
                if dist < nearestDist then
                    nearestDist = dist
                    nearestPlayer = plr
                end
            end
        end
    end
    return nearestPlayer
end

Tab:CreateToggle({
    Name = "Auto win as shark",
    CurrentValue = false,
    Flag = "AutoWinShark",
    Callback = function(state)
        if state then
            local sharksFolder = workspace:FindFirstChild("Sharks")
            if sharksFolder then
                for _, d in ipairs(sharksFolder:GetDescendants()) do
                    if d:IsA("BasePart") and d.Name == "DestructionPart" then
                        addDestructionPart(d)
                    end
                end
                SharksDescendantConnection = sharksFolder.DescendantAdded:Connect(function(descendant)
                    if descendant:IsA("BasePart") and descendant.Name == "DestructionPart" then
                        addDestructionPart(descendant)
                    end
                end)
            end
            AutoWinConnection = RunService.Heartbeat:Connect(function()
                if player.Team and player.Team.Name == "Shark" and #DestructionParts > 0 then
                    for i = #DestructionParts, 1, -1 do
                        if not DestructionParts[i] or not DestructionParts[i].Parent then
                            table.remove(DestructionParts, i)
                        end
                    end
                    local count = #DestructionParts
                    if count > 0 then
                        local randomPart = DestructionParts[math.random(1, count)]
                        local targetPlayer = getNearestSurvivorToPart(randomPart)
                        if randomPart and targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            local targetPos = targetPlayer.Character.HumanoidRootPart.Position
                            randomPart.CFrame = CFrame.new(targetPos)
                        end
                    end
                end
            end)
        else
            if AutoWinConnection then
                AutoWinConnection:Disconnect()
                AutoWinConnection = nil
            end
            if SharksDescendantConnection then
                SharksDescendantConnection:Disconnect()
                SharksDescendantConnection = nil
            end
            table.clear(DestructionParts)
        end
    end
})

local Section2 = Tab:CreateSection("Shark ESP")

local sharkESPConnection = {}

local function setSharkESP(enabled)
    local sharksFolder = workspace:FindFirstChild("Sharks")
    if not sharksFolder then return end

    for _, conn in ipairs(sharkESPConnection) do
        conn:Disconnect()
    end
    table.clear(sharkESPConnection)

    for _, shark in ipairs(sharksFolder:GetDescendants()) do
        if shark:IsA("Highlight") then
            if enabled then
                shark.Enabled = true
                shark.OutlineTransparency = 0
                table.insert(sharkESPConnection, shark:GetPropertyChangedSignal("Enabled"):Connect(function()
                    if not shark.Enabled then
                        shark.Enabled = true
                    end
                end))
                table.insert(sharkESPConnection, shark:GetPropertyChangedSignal("OutlineTransparency"):Connect(function()
                    if shark.OutlineTransparency ~= 0 then
                        shark.OutlineTransparency = 0
                    end
                end))
            else
                shark.Enabled = false
                shark.OutlineTransparency = 1
            end
        end
    end
end

local function watchForNewSharks(toggleState)
    local sharksFolder = workspace:FindFirstChild("Sharks")
    if sharksFolder then
        table.insert(sharkESPConnection, sharksFolder.DescendantAdded:Connect(function(desc)
            if desc:IsA("Highlight") then
                setSharkESP(toggleState)
            end
        end))
    end
end

Tab:CreateToggle({
    Name = "Highlight sharks [ESP]",
    CurrentValue = false,
    Flag = "SharkESP",
    Callback = function(state)
        setSharkESP(state)
        watchForNewSharks(state)
    end
})

local Section3 = Tab:CreateSection("Auto Vase")

local VaseTouchParts = {}
local VaseConnections = {}
local VaseHeartbeat

local function AddVaseTouch(part)
    table.insert(VaseTouchParts, part)
    part.AncestryChanged:Connect(function(_, parent)
        if not parent then
            for i, v in ipairs(VaseTouchParts) do
                if v == part then
                    table.remove(VaseTouchParts, i)
                    break
                end
            end
        end
    end)
end

Tab:CreateToggle({
    Name = "Auto touch vases",
    CurrentValue = false,
    Flag = "AutoTouchVases",
    Callback = function(state)
        if state then
            local folder = workspace:FindFirstChild("Vases")
            if folder then
                for _, d in ipairs(folder:GetDescendants()) do
                    if d:IsA("TouchTransmitter") then
                        AddVaseTouch(d)
                    end
                end
                table.insert(VaseConnections, folder.DescendantAdded:Connect(function(desc)
                    if desc:IsA("TouchTransmitter") then
                        AddVaseTouch(desc)
                    end
                end))
            end
            VaseHeartbeat = RunService.Heartbeat:Connect(function()
                for _, t in ipairs(VaseTouchParts) do
                    if t and t.Parent and t.Parent:IsA("BasePart") then
                        local part = t.Parent
                        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                            player.Character.HumanoidRootPart.CFrame = part.CFrame
                            firetouchinterest(player.Character.HumanoidRootPart, part, 0)
                            firetouchinterest(player.Character.HumanoidRootPart, part, 1)
                        end
                    end
                end
            end)
        else
            for _, c in ipairs(VaseConnections) do
                c:Disconnect()
            end
            table.clear(VaseConnections)
            table.clear(VaseTouchParts)
            if VaseHeartbeat then
                VaseHeartbeat:Disconnect()
                VaseHeartbeat = nil
            end
        end
    end,
})
