-- ============================================
-- Triple Cheats -- Build a Boat
-- Версия: 4.1
-- Author: breaddd
-- ============================================

-- Load Rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Create Window
local Window = Rayfield:CreateWindow({
    Name = "Triple Cheats -- Build a Boat",
    Icon = 0,
    LoadingTitle = "Triple Cheats",
    LoadingSubtitle = "by breaddd",
    Theme = "Default",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = {
       Enabled = true,
       FolderName = "TripleCheats",
       FileName = "Settings"
    }
})

-- ============================================
-- VARIABLES
-- ============================================

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local isFarming = false
local currentStage = 1
local espEnabled = false
local espObjects = {}
local highlightObjects = {}

-- Player functions variables
local noclipEnabled = false
local flyEnabled = false
local flySpeed = 50
local bodyVelocity = nil
local bodyGyro = nil
local flyConnection = nil
local noclipConnection = nil
local infinityJumpEnabled = false
local jumpConnection = nil
local speedEnabled = false
local speedValue = 50
local originalSpeed = 16

-- ============================================
-- FUNCTIONS
-- ============================================

local function UpdateInfo()
    local char = Player.Character
    if char and char:FindFirstChild("Humanoid") then
        local hum = char.Humanoid
        return {
            Name = Player.Name,
            DisplayName = Player.DisplayName,
            Health = math.floor(hum.Health),
            MaxHealth = math.floor(hum.MaxHealth)
        }
    end
    return {
        Name = Player.Name,
        DisplayName = Player.DisplayName,
        Health = 0,
        MaxHealth = 100
    }
end

local function GetPlayerGold(player)
    local success, gold = pcall(function()
        return player.Data.Gold.Value
    end)
    if success and gold then
        return gold
    end
    return 0
end

-- Функция для безопасной телепортации
local function SafeTeleport(cframe)
    local char = Player.Character
    if not char then return false end
    
    local rootPart = char:FindFirstChild("HumanoidRootPart")
    if not rootPart then return false end
    
    rootPart.CFrame = cframe
    return true
end

-- Функция ожидания с проверкой на смерть
local function SafeWait(time)
    local start = tick()
    while tick() - start < time do
        if not isFarming then return false end
        local char = Player.Character
        if not char then return false end
        local hum = char:FindFirstChild("Humanoid")
        if not hum then return false end
        if hum.Health <= 0 then return false end
        wait(0.1)
    end
    return true
end

-- ============================================
-- FARM FUNCTIONS
-- ============================================

local function FarmLoop()
    while isFarming do
        -- Всегда гравитация 0
        game.Workspace.Gravity = 0
        
        -- Проверяем жив ли игрок перед каждым действием
        local char = Player.Character
        if not char then
            print("[Triple Cheats] Waiting for character...")
            wait(1)
            continue
        end
        
        local hum = char:FindFirstChild("Humanoid")
        if not hum or hum.Health <= 0 then
            print("[Triple Cheats] Player is dead, waiting for respawn...")
            wait(2)
            continue
        end
        
        if currentStage <= 10 then
            -- Телепорт на стадии
            local stageName = "CaveStage" .. currentStage
            local part = workspace.BoatStages.NormalStages[stageName] and workspace.BoatStages.NormalStages[stageName]:FindFirstChild("DarknessPart")
            
            if part then
                local success = SafeTeleport(part.CFrame + Vector3.new(0, 0, 0))
                if success then
                    print("[Triple Cheats] Teleported to stage: " .. currentStage)
                else
                    print("[Triple Cheats] Failed to teleport to stage: " .. currentStage)
                    wait(1)
                    continue
                end
                
                -- Безопасное ожидание
                if not SafeWait(2) then
                    print("[Triple Cheats] Interrupted during stage wait")
                    continue
                end
            end
            
            currentStage = currentStage + 1
        else
            -- Телепорт к сундуку
            local normalStages = workspace.BoatStages:FindFirstChild("NormalStages")
            if normalStages then
                local theEnd = normalStages:FindFirstChild("TheEnd")
                if theEnd then
                    local goldenChest = theEnd:FindFirstChild("GoldenChest")
                    if goldenChest then
                        local trigger = goldenChest:FindFirstChild("Trigger")
                        if trigger then
                            local success = SafeTeleport(trigger.CFrame + Vector3.new(0, 0, 0))
                            if success then
                                print("[Triple Cheats] Teleported to GoldenChest.Trigger!")
                            else
                                print("[Triple Cheats] Failed to teleport to chest")
                                wait(1)
                                currentStage = 1
                                continue
                            end
                            
                            -- Безопасное ожидание у сундука
                            if not SafeWait(0.5) then
                                print("[Triple Cheats] Interrupted at chest, restarting cycle...")
                                currentStage = 1
                                continue
                            end
                            
                            print("[Triple Cheats] Restarting cycle from stage 1...")
                            currentStage = 1
                        else
                            print("[Triple Cheats] ERROR: Trigger not found")
                            currentStage = 1
                            wait(1)
                        end
                    else
                        print("[Triple Cheats] ERROR: GoldenChest not found")
                        currentStage = 1
                        wait(1)
                    end
                else
                    print("[Triple Cheats] ERROR: TheEnd not found")
                    currentStage = 1
                    wait(1)
                end
            else
                print("[Triple Cheats] ERROR: NormalStages not found")
                currentStage = 1
                wait(1)
            end
        end
    end
end

-- ============================================
-- PLAYER FUNCTIONS
-- ============================================

-- Speed
local function ToggleSpeed()
    speedEnabled = not speedEnabled
    
    local char = Player.Character
    if not char then return end
    
    local hum = char:FindFirstChild("Humanoid")
    if not hum then return end
    
    if speedEnabled then
        originalSpeed = hum.WalkSpeed
        hum.WalkSpeed = speedValue
        print("[Triple Cheats] Speed enabled: " .. speedValue)
    else
        hum.WalkSpeed = originalSpeed
        print("[Triple Cheats] Speed disabled")
    end
end

local function UpdateSpeed(value)
    speedValue = value
    if speedEnabled then
        local char = Player.Character
        if char then
            local hum = char:FindFirstChild("Humanoid")
            if hum then
                hum.WalkSpeed = speedValue
            end
        end
    end
end

-- Noclip
local function ToggleNoclip()
    noclipEnabled = not noclipEnabled
    
    if noclipEnabled then
        noclipConnection = RunService.Heartbeat:Connect(function()
            local char = Player.Character
            if char then
                for _, part in ipairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
    else
        if noclipConnection then
            noclipConnection:Disconnect()
            noclipConnection = nil
        end
        local char = Player.Character
        if char then
            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                end
            end
        end
    end
end

-- Fly
local function ToggleFly()
    flyEnabled = not flyEnabled
    
    if flyEnabled then
        local char = Player.Character
        if not char then return end
        
        local rootPart = char:FindFirstChild("HumanoidRootPart")
        if not rootPart then return end
        
        local hum = char:FindFirstChild("Humanoid")
        if hum then
            hum.PlatformStand = true
        end
        
        bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
        bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
        bodyVelocity.Parent = rootPart
        
        bodyGyro = Instance.new("BodyGyro")
        bodyGyro.MaxTorque = Vector3.new(100000, 100000, 100000)
        bodyGyro.Parent = rootPart
        
        flyConnection = RunService.Heartbeat:Connect(function()
            if not flyEnabled then return end
            
            local char = Player.Character
            if not char then return end
            
            local root = char:FindFirstChild("HumanoidRootPart")
            if not root then return end
            
            local moveDirection = Vector3.new(0, 0, 0)
            local camera = workspace.CurrentCamera
            
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                moveDirection = moveDirection + camera.CFrame.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                moveDirection = moveDirection - camera.CFrame.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                moveDirection = moveDirection - camera.CFrame.RightVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                moveDirection = moveDirection + camera.CFrame.RightVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                moveDirection = moveDirection + Vector3.new(0, 1, 0)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                moveDirection = moveDirection - Vector3.new(0, 1, 0)
            end
            
            if moveDirection.Magnitude > 0 then
                moveDirection = moveDirection.Unit * flySpeed
            end
            
            bodyVelocity.Velocity = moveDirection
            
            local lookDirection = camera.CFrame.LookVector * Vector3.new(1, 0, 1)
            if lookDirection.Magnitude > 0 then
                bodyGyro.CFrame = CFrame.lookAt(root.Position, root.Position + lookDirection)
            end
        end)
    else
        if flyConnection then
            flyConnection:Disconnect()
            flyConnection = nil
        end
        
        if bodyVelocity then
            bodyVelocity:Destroy()
            bodyVelocity = nil
        end
        
        if bodyGyro then
            bodyGyro:Destroy()
            bodyGyro = nil
        end
        
        local char = Player.Character
        if char then
            local hum = char:FindFirstChild("Humanoid")
            if hum then
                hum.PlatformStand = false
            end
        end
    end
end

-- Infinity Jump
local function ToggleInfinityJump()
    infinityJumpEnabled = not infinityJumpEnabled
    
    if infinityJumpEnabled then
        local char = Player.Character
        if char then
            local hum = char:FindFirstChild("Humanoid")
            if hum then
                hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
            end
        end
        
        jumpConnection = RunService.Heartbeat:Connect(function()
            if not infinityJumpEnabled then
                if jumpConnection then
                    jumpConnection:Disconnect()
                    jumpConnection = nil
                end
                return
            end
            
            local char = Player.Character
            if not char then return end
            
            local hum = char:FindFirstChild("Humanoid")
            if not hum then return end
            
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                if hum:GetState() ~= Enum.HumanoidStateType.Dead and 
                   hum:GetState() ~= Enum.HumanoidStateType.FallingDown and
                   hum:GetState() ~= Enum.HumanoidStateType.Ragdoll then
                    hum:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end
        end)
    else
        if jumpConnection then
            jumpConnection:Disconnect()
            jumpConnection = nil
        end
        
        local char = Player.Character
        if char then
            local hum = char:FindFirstChild("Humanoid")
            if hum then
                hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
            end
        end
    end
end

-- ============================================
-- ESP SYSTEM
-- ============================================

local function CreatePlayerLabel(player, distance, health, gold)
    local char = player.Character
    if not char then return nil end
    
    local head = char:FindFirstChild("Head")
    if not head then return nil end
    
    local billboard = Instance.new("BillboardGui")
    billboard.Adornee = head
    billboard.Size = UDim2.new(0, 180, 0, 40)
    billboard.StudsOffset = Vector3.new(0, 2.5, 0)
    billboard.AlwaysOnTop = true
    billboard.MaxDistance = 99999
    billboard.Parent = char
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextStrokeTransparency = 0
    label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    label.TextSize = 13
    label.Font = Enum.Font.GothamBold
    label.Text = string.format("%s | %.0fst | %dHP | Gold: %d", player.DisplayName, distance, health, gold)
    label.Parent = billboard
    
    return billboard
end

local function CreateHighlight(player)
    local char = player.Character
    if not char then return nil end
    
    local highlight = Instance.new("Highlight")
    highlight.Adornee = char
    highlight.FillColor = Color3.fromRGB(255, 255, 255)
    highlight.FillTransparency = 0.3
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.OutlineTransparency = 0.2
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Parent = char
    
    return highlight
end

local function UpdatePlayerESP(player)
    if player == Player then return end
    
    local char = player.Character
    if not char then
        if espObjects[player] then
            for _, obj in ipairs(espObjects[player]) do
                obj:Destroy()
            end
            espObjects[player] = nil
        end
        if highlightObjects[player] then
            highlightObjects[player]:Destroy()
            highlightObjects[player] = nil
        end
        return
    end
    
    local myChar = Player.Character
    local distance = 0
    if myChar and myChar:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("HumanoidRootPart") then
        distance = (myChar.HumanoidRootPart.Position - char.HumanoidRootPart.Position).Magnitude
    end
    
    local health = 0
    local hum = char:FindFirstChild("Humanoid")
    if hum then
        health = math.floor(hum.Health)
    end
    
    local gold = GetPlayerGold(player)
    
    if espObjects[player] then
        for _, obj in ipairs(espObjects[player]) do
            obj:Destroy()
        end
        espObjects[player] = nil
    end
    
    if highlightObjects[player] then
        highlightObjects[player]:Destroy()
        highlightObjects[player] = nil
    end
    
    local objects = {}
    
    local highlight = CreateHighlight(player)
    if highlight then
        highlightObjects[player] = highlight
    end
    
    local label = CreatePlayerLabel(player, distance, health, gold)
    if label then
        table.insert(objects, label)
    end
    
    espObjects[player] = objects
end

local function UpdateAllESP()
    if not espEnabled then
        for player, objects in pairs(espObjects) do
            for _, obj in ipairs(objects) do
                obj:Destroy()
            end
        end
        espObjects = {}
        
        for player, highlight in pairs(highlightObjects) do
            highlight:Destroy()
        end
        highlightObjects = {}
        return
    end
    
    for _, player in ipairs(Players:GetPlayers()) do
        UpdatePlayerESP(player)
    end
end

local function ESPLoop()
    while true do
        if espEnabled then
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= Player then
                    local char = player.Character
                    if char then
                        local myChar = Player.Character
                        local distance = 0
                        if myChar and myChar:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("HumanoidRootPart") then
                            distance = (myChar.HumanoidRootPart.Position - char.HumanoidRootPart.Position).Magnitude
                        end
                        
                        local health = 0
                        local hum = char:FindFirstChild("Humanoid")
                        if hum then
                            health = math.floor(hum.Health)
                        end
                        
                        local gold = GetPlayerGold(player)
                        
                        if espObjects[player] and #espObjects[player] > 0 then
                            local label = espObjects[player][1]
                            if label and label:IsA("BillboardGui") then
                                local textLabel = label:FindFirstChild("TextLabel")
                                if textLabel then
                                    textLabel.Text = string.format("%s | %.0fst | %dHP | Gold: %d", player.DisplayName, distance, health, gold)
                                end
                            end
                        end
                    end
                end
            end
        end
        wait(0.5)
    end
end

local function SetupESPListeners()
    Players.PlayerAdded:Connect(function(player)
        if espEnabled then
            player.CharacterAdded:Connect(function()
                wait(0.5)
                UpdatePlayerESP(player)
            end)
        end
    end)
    
    Players.PlayerRemoving:Connect(function(player)
        if espObjects[player] then
            for _, obj in ipairs(espObjects[player]) do
                obj:Destroy()
            end
            espObjects[player] = nil
        end
        if highlightObjects[player] then
            highlightObjects[player]:Destroy()
            highlightObjects[player] = nil
        end
    end)
    
    for _, player in ipairs(Players:GetPlayers()) do
        player.CharacterAdded:Connect(function()
            wait(0.5)
            if espEnabled then
                UpdatePlayerESP(player)
            end
        end)
    end
end

-- ============================================
-- CREATE GUI
-- ============================================

-- INFO TAB
local InfoTab = Window:CreateTab("Info", 1)

local NameLabel = InfoTab:CreateLabel("Player: " .. Player.Name)
local DisplayNameLabel = InfoTab:CreateLabel("Display Name: " .. Player.DisplayName)
local HealthLabel = InfoTab:CreateLabel("Health: " .. (Character and Character:FindFirstChild("Humanoid") and math.floor(Character.Humanoid.Health) or 0))
local MaxHealthLabel = InfoTab:CreateLabel("Max Health: " .. (Character and Character:FindFirstChild("Humanoid") and math.floor(Character.Humanoid.MaxHealth) or 0))
local GoldLabel = InfoTab:CreateLabel("Gold: " .. GetPlayerGold(Player))

local function UpdateInfoLabels()
    while true do
        local info = UpdateInfo()
        NameLabel:Set("Player: " .. info.Name)
        DisplayNameLabel:Set("Display Name: " .. info.DisplayName)
        HealthLabel:Set("Health: " .. info.Health)
        MaxHealthLabel:Set("Max Health: " .. info.MaxHealth)
        GoldLabel:Set("Gold: " .. GetPlayerGold(Player))
        wait(1)
    end
end

coroutine.wrap(UpdateInfoLabels)()

-- AUTO FARM TAB
local FarmTab = Window:CreateTab("Auto Farm", 2)

local FarmToggle = FarmTab:CreateToggle({
    Name = "Auto Farm",
    CurrentValue = false,
    Flag = "AutoFarmToggle",
    Callback = function(Value)
        isFarming = Value
        if Value then
            currentStage = 1
            coroutine.wrap(FarmLoop)()
        else
            game.Workspace.Gravity = 196.2
            currentStage = 1
        end
    end
})

-- PLAYER TAB
local PlayerTab = Window:CreateTab("Player", 4)

PlayerTab:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Flag = "NoclipToggle",
    Callback = function(Value)
        if Value then
            if not noclipEnabled then
                ToggleNoclip()
            end
        else
            if noclipEnabled then
                ToggleNoclip()
            end
        end
    end
})

PlayerTab:CreateToggle({
    Name = "Fly",
    CurrentValue = false,
    Flag = "FlyToggle",
    Callback = function(Value)
        if Value then
            if not flyEnabled then
                ToggleFly()
            end
        else
            if flyEnabled then
                ToggleFly()
            end
        end
    end
})

PlayerTab:CreateSlider({
    Name = "Fly Speed",
    Range = {10, 200},
    Increment = 5,
    Suffix = "",
    CurrentValue = 50,
    Flag = "FlySpeed",
    Callback = function(Value)
        flySpeed = Value
    end
})

PlayerTab:CreateToggle({
    Name = "Speed",
    CurrentValue = false,
    Flag = "SpeedToggle",
    Callback = function(Value)
        if Value then
            if not speedEnabled then
                ToggleSpeed()
            end
        else
            if speedEnabled then
                ToggleSpeed()
            end
        end
    end
})

PlayerTab:CreateSlider({
    Name = "Speed Value",
    Range = {16, 200},
    Increment = 1,
    Suffix = "",
    CurrentValue = 50,
    Flag = "SpeedValue",
    Callback = function(Value)
        UpdateSpeed(Value)
    end
})

PlayerTab:CreateToggle({
    Name = "Infinity Jump",
    CurrentValue = false,
    Flag = "InfinityJumpToggle",
    Callback = function(Value)
        if Value then
            if not infinityJumpEnabled then
                ToggleInfinityJump()
            end
        else
            if infinityJumpEnabled then
                ToggleInfinityJump()
            end
        end
    end
})

-- ESP TAB
local ESPTab = Window:CreateTab("ESP", 3)

local ESPToggle = ESPTab:CreateToggle({
    Name = "Player ESP",
    CurrentValue = false,
    Flag = "ESPToggle",
    Callback = function(Value)
        espEnabled = Value
        UpdateAllESP()
    end
})

ESPTab:CreateButton({
    Name = "Refresh ESP",
    Callback = function()
        if espEnabled then
            UpdateAllESP()
            Rayfield:Notify({
                Title = "ESP",
                Content = "ESP Refreshed!",
                Duration = 2,
                Image = 0
            })
        else
            Rayfield:Notify({
                Title = "ESP",
                Content = "Enable ESP first!",
                Duration = 2,
                Image = 0
            })
        end
    end
})

-- ============================================
-- STARTUP
-- ============================================

coroutine.wrap(ESPLoop)()
SetupESPListeners()

for _, player in ipairs(Players:GetPlayers()) do
    if player ~= Player then
        player.CharacterAdded:Connect(function()
            wait(0.5)
            if espEnabled then
                UpdatePlayerESP(player)
            end
        end)
    end
end

-- ============================================
-- NOTIFICATIONS
-- ============================================

Rayfield:Notify({
    Title = "Triple Cheats",
    Content = "Script loaded successfully!",
    Duration = 3,
    Image = 0,
    Actions = {}
})

-- ============================================
-- EVENT HANDLERS
-- ============================================

game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(char)
    Character = char
    Humanoid = char:WaitForChild("Humanoid")
    if espEnabled then
        wait(1)
        UpdateAllESP()
    end
    if speedEnabled then
        wait(0.5)
        local hum = char:FindFirstChild("Humanoid")
        if hum then
            hum.WalkSpeed = speedValue
        end
    end
end)

game:GetService("Players").LocalPlayer.OnTeleport:Connect(function()
    isFarming = false
    game.Workspace.Gravity = 196.2
    espEnabled = false
    for player, objects in pairs(espObjects) do
        for _, obj in ipairs(objects) do
            obj:Destroy()
        end
    end
    espObjects = {}
    for player, highlight in pairs(highlightObjects) do
        highlight:Destroy()
    end
    highlightObjects = {}
end)

-- ============================================
-- FINISH
-- ============================================

print("========================================")
print("Triple Cheats -- Build a Boat")
print("Version: 4.1")
print("Author: breaddd")
print("========================================")
print("Features:")
print(" - Info (Player Info + Gold)")
print(" - Auto Farm (Auto Farm - Instant cycle restart)")
print(" - Player (Noclip, Fly, Speed, Infinity Jump)")
print(" - ESP (Player ESP + Gold)")
print("========================================")
print("Farm Logic:")
print("1. Teleport through CaveStage1-10 (Gravity: 0)")
print("2. Teleport to NormalStages.TheEnd.GoldenChest.Trigger")
print("3. Wait 0.5 seconds")
print("4. INSTANTLY restart cycle from stage 1")
print("5. Gravity stays 0 always")
print("6. Anti-freeze protection if player dies")
print("========================================")