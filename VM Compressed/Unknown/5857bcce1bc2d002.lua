local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")

-- Настройки
local Settings = {
    FarmEnabled = false,
    TeleportDelay = 0.1,
    CollectDistance = 5,
    ToggleKey = Enum.KeyCode.K,
    ESPEnabled = false,
    AutoRespawn = true,
    WalkSpeedEnabled = false,
    WalkSpeedValue = 16,
    FlyEnabled = false,
    NoclipEnabled = false,
    FullBrightEnabled = false,
    PalletESPEnabled = false,
    LockerESPEnabled = false,
    PlayerESPEnabled = false
}

local collectedCount = 0
local espObjects = {}
local palletESPObjects = {}
local lockerESPObjects = {}
local playerESPObjects = {}

-- Connections
local walkSpeedConnection = nil
local flyConnection = nil
local noclipConnection = nil
local originalAmbient = Lighting.Ambient
local originalBrightness = Lighting.Brightness
local originalOutdoorAmbient = Lighting.OutdoorAmbient

-- Создание GUI
local Window = Rayfield:CreateWindow({
    Name = "pizatiy67",
    LoadingTitle = "pizatiy67",
    LoadingSubtitle = "by t.me/puzatiy_5",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "pizatiy67",
        FileName = "Config"
    },
    Discord = {
        Enabled = false
    },
    KeySystem = false
})

-- Вкладка AutoFarm
local MainTab = Window:CreateTab("AutoFarm", 4483362458)
local Section = MainTab:CreateSection("AutoFarm")

-- Toggle для автофарма
local FarmToggle = MainTab:CreateToggle({
    Name = "Enable AutoFarm",
    CurrentValue = false,
    Flag = "FarmToggle",
    Callback = function(Value)
        Settings.FarmEnabled = Value
    end,
})

-- Keybind для переключения
local FarmKeybind = MainTab:CreateKeybind({
    Name = "Toggle AutoFarm Keybind",
    CurrentKeybind = "K",
    HoldToInteract = false,
    Flag = "FarmKeybind",
    Callback = function(Keybind)
        Settings.ToggleKey = Keybind
    end,
})

local CollectButton = MainTab:CreateButton({
    Name = "Collect All Tokens Now",
    Callback = function()
        local tokens = findTargetBloodTokens()
        for _, token in pairs(tokens) do
            if token and token.Parent then
                local pos = getPosition(token)
                if pos then
                    teleportTo(pos)
                    wait(0.05)
                end
            end
        end
    end,
})

-- Вкладка Movement
local MovementTab = Window:CreateTab("Movement", 4483362458)
local MovementSection = MovementTab:CreateSection("Movement Settings")

local WalkSpeedToggle = MovementTab:CreateToggle({
    Name = "Enable WalkSpeed",
    CurrentValue = false,
    Flag = "WalkSpeedToggle",
    Callback = function(Value)
        Settings.WalkSpeedEnabled = Value
        if Value then
            enableWalkSpeed()
        else
            disableWalkSpeed()
        end
    end,
})

-- WalkSpeed Slider
local WalkSpeedSlider = MovementTab:CreateSlider({
    Name = "WalkSpeed Value",
    Range = {16, 200},
    Increment = 1,
    CurrentValue = 16,
    Flag = "WalkSpeedValue",
    Callback = function(Value)
        Settings.WalkSpeedValue = Value
        if Settings.WalkSpeedEnabled then
            local humanoid = character and character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = Value
            end
        end
    end,
})

local WalkSpeedKeybind = MovementTab:CreateKeybind({
    Name = "Toggle WalkSpeed Keybind",
    CurrentKeybind = "LeftShift",
    HoldToInteract = false,
    Flag = "WalkSpeedKeybind",
    Callback = function(Keybind)
        Settings.WalkSpeedEnabled = not Settings.WalkSpeedEnabled
        if Settings.WalkSpeedEnabled then
            enableWalkSpeed()
        else
            disableWalkSpeed()
        end
    end,
})

local FlyToggle = MovementTab:CreateToggle({
    Name = "Enable Fly",
    CurrentValue = false,
    Flag = "FlyToggle",
    Callback = function(Value)
        Settings.FlyEnabled = Value
        if Value then
            enableFly()
        else
            disableFly()
        end
    end,
})

local FlyKeybind = MovementTab:CreateKeybind({
    Name = "Toggle Fly Keybind",
    CurrentKeybind = "F",
    HoldToInteract = false,
    Flag = "FlyKeybind",
    Callback = function(Keybind)
        Settings.FlyEnabled = not Settings.FlyEnabled
        if Settings.FlyEnabled then
            enableFly()
        else
            disableFly()
        end
    end,
})

local NoclipToggle = MovementTab:CreateToggle({
    Name = "Enable Noclip",
    CurrentValue = false,
    Flag = "NoclipToggle",
    Callback = function(Value)
        Settings.NoclipEnabled = Value
        if Value then
            enableNoclip()
        else
            disableNoclip()
        end
    end,
})

local NoclipKeybind = MovementTab:CreateKeybind({
    Name = "Toggle Noclip Keybind",
    CurrentKeybind = "N",
    HoldToInteract = false,
    Flag = "NoclipKeybind",
    Callback = function(Keybind)
        Settings.NoclipEnabled = not Settings.NoclipEnabled
        if Settings.NoclipEnabled then
            enableNoclip()
        else
            disableNoclip()
        end
    end,
})

-- Вкладка Settings
local SettingsTab = Window:CreateTab("Settings", 4483362458)
local SettingsSection = SettingsTab:CreateSection("Farm Settings")

local DelaySlider = SettingsTab:CreateSlider({
    Name = "Teleport Delay (seconds)",
    Range = {0, 1},
    Increment = 0.05,
    CurrentValue = 0.1,
    Flag = "TeleportDelay",
    Callback = function(Value)
        Settings.TeleportDelay = Value
    end,
})

local DistanceSlider = SettingsTab:CreateSlider({
    Name = "Collect Distance",
    Range = {1, 20},
    Increment = 1,
    CurrentValue = 5,
    Flag = "CollectDistance",
    Callback = function(Value)
        Settings.CollectDistance = Value
    end,
})

local RespawnToggle = SettingsTab:CreateToggle({
    Name = "Auto Respawn on Death",
    CurrentValue = true,
    Flag = "AutoRespawn",
    Callback = function(Value)
        Settings.AutoRespawn = Value
    end,
})

local FullBrightToggle = SettingsTab:CreateToggle({
    Name = "Enable FullBright",
    CurrentValue = false,
    Flag = "FullBrightToggle",
    Callback = function(Value)
        Settings.FullBrightEnabled = Value
        if Value then
            enableFullBright()
        else
            disableFullBright()
        end
    end,
})

-- Вкладка ESP
local ESPTab = Window:CreateTab("ESP", 4483362458)
local ESPSection = ESPTab:CreateSection("Token ESP")

local ESPToggle = ESPTab:CreateToggle({
    Name = "Enable Token ESP",
    CurrentValue = false,
    Flag = "ESPToggle",
    Callback = function(Value)
        Settings.ESPEnabled = Value
        if Value then
            createESP()
        else
            clearESP()
        end
    end,
})

local ESPSection2 = ESPTab:CreateSection("Object ESP")

local PalletESPToggle = ESPTab:CreateToggle({
    Name = "Enable Pallet ESP",
    CurrentValue = false,
    Flag = "PalletESPToggle",
    Callback = function(Value)
        Settings.PalletESPEnabled = Value
        if Value then
            createPalletESP()
        else
            clearPalletESP()
        end
    end,
})

local LockerESPToggle = ESPTab:CreateToggle({
    Name = "Enable Locker ESP",
    CurrentValue = false,
    Flag = "LockerESPToggle",
    Callback = function(Value)
        Settings.LockerESPEnabled = Value
        if Value then
            createLockerESP()
        else
            clearLockerESP()
        end
    end,
})

local ESPSection3 = ESPTab:CreateSection("Player ESP")

local PlayerESPToggle = ESPTab:CreateToggle({
    Name = "Enable Player ESP",
    CurrentValue = false,
    Flag = "PlayerESPToggle",
    Callback = function(Value)
        Settings.PlayerESPEnabled = Value
        if Value then
            createPlayerESP()
        else
            clearPlayerESP()
        end
    end,
})

-- Вкладка Rage
local RageTab = Window:CreateTab("Rage", 4483362458)
local RageSection = RageTab:CreateSection("Rage Functions")

local GrabPlayersToggle = RageTab:CreateToggle({
    Name = "Grab All Players",
    CurrentValue = false,
    Flag = "GrabPlayersToggle",
    Callback = function(Value)
        if Value then
            grabAllPlayers()
        else
            releaseAllPlayers()
        end
    end,
})

local SpinPlayersToggle = RageTab:CreateToggle({
    Name = "Spin All Players",
    CurrentValue = false,
    Flag = "SpinPlayersToggle",
    Callback = function(Value)
        if Value then
            spinAllPlayers()
        else
            stopSpinPlayers()
        end
    end,
})

local RagdollPlayersToggle = RageTab:CreateToggle({
    Name = "Ragdoll All Players",
    CurrentValue = false,
    Flag = "RagdollPlayersToggle",
    Callback = function(Value)
        if Value then
            ragdollAllPlayers()
        else
            unragdollAllPlayers()
        end
    end,
})

local FlingPlayersToggle = RageTab:CreateToggle({
    Name = "Fling All Players",
    CurrentValue = false,
    Flag = "FlingPlayersToggle",
    Callback = function(Value)
        if Value then
            startFlingPlayers()
        else
            stopFlingPlayers()
        end
    end,
})

local FreezePlayersToggle = RageTab:CreateToggle({
    Name = "Freeze All Players",
    CurrentValue = false,
    Flag = "FreezePlayersToggle",
    Callback = function(Value)
        if Value then
            freezeAllPlayers()
        else
            unfreezeAllPlayers()
        end
    end,
})

-- Информационная вкладка
local InfoTab = Window:CreateTab("Info", 4483362458)
local InfoSection = InfoTab:CreateSection("Statistics")

local StatsLabel = InfoTab:CreateLabel("Tokens Collected: 0")
local BalanceLabel = InfoTab:CreateLabel("Current Balance: 0")

local InfoSection2 = InfoTab:CreateSection("Contact")

local TelegramButton = InfoTab:CreateButton({
    Name = "t.me/puzatiy_5",
    Callback = function()
        setclipboard("https://t.me/puzatiy_5")
    end,
})

-- Функция для поиска BloodToken объектов
function findTargetBloodTokens()
    local tokens = {}
    for _, obj in pairs(workspace:GetDescendants()) do
        if (obj.Name == "BloodToken" or obj.Name == "BloodToken1") and (obj:IsA("Part") or obj:IsA("Model")) then
            table.insert(tokens, obj)
        end
    end
    return tokens
end

-- Функция телепортации
function teleportTo(position)
    if humanoidRootPart then
        humanoidRootPart.CFrame = CFrame.new(position)
    end
end

-- Функция для получения позиции объекта
function getPosition(obj)
    if obj:IsA("Model") then
        local part = obj:FindFirstChildWhichIsA("BasePart", true)
        if part then
            return part.Position
        end
    elseif obj:IsA("BasePart") then
        return obj.Position
    end
    return nil
end

-- Функция WalkSpeed
function enableWalkSpeed()
    if walkSpeedConnection then
        walkSpeedConnection:Disconnect()
    end
    
    walkSpeedConnection = RunService.Heartbeat:Connect(function()
        if Settings.WalkSpeedEnabled and character then
            local humanoid = character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = Settings.WalkSpeedValue
            end
        end
    end)
end

function disableWalkSpeed()
    if walkSpeedConnection then
        walkSpeedConnection:Disconnect()
        walkSpeedConnection = nil
    end
    
    if character then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = 16
        end
    end
end

-- Функция Fly
function enableFly()
    if flyConnection then
        flyConnection:Disconnect()
    end
    
    local humanoid = character and character:FindFirstChild("Humanoid")
    local root = character and character:FindFirstChild("HumanoidRootPart")
    
    if humanoid then
        humanoid.PlatformStand = true
    end
    
    if root then
        root.Velocity = Vector3.new(0, 0, 0)
    end
    
    flyConnection = RunService.Heartbeat:Connect(function()
        if Settings.FlyEnabled and character then
            local root = character:FindFirstChild("HumanoidRootPart")
            local camera = workspace.CurrentCamera
            
            if root and camera then
                local forward = camera.CFrame.LookVector
                local right = camera.CFrame.RightVector
                local up = Vector3.new(0, 1, 0)
                
                local direction = Vector3.new(0, 0, 0)
                local speed = 50
                
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then direction = direction + forward end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then direction = direction - forward end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then direction = direction + right end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then direction = direction - right end
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then direction = direction + up end
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then direction = direction - up end
                
                if direction.Magnitude > 0 then
                    direction = direction.Unit * speed
                    root.Velocity = direction
                else
                    root.Velocity = Vector3.new(0, 0, 0)
                end
            end
        end
    end)
end

function disableFly()
    if flyConnection then
        flyConnection:Disconnect()
        flyConnection = nil
    end
    
    local humanoid = character and character:FindFirstChild("Humanoid")
    local root = character and character:FindFirstChild("HumanoidRootPart")
    
    if humanoid then
        humanoid.PlatformStand = false
    end
    
    if root then
        root.Velocity = Vector3.new(0, 0, 0)
    end
end

-- Функция Noclip
function enableNoclip()
    if noclipConnection then
        noclipConnection:Disconnect()
    end
    
    noclipConnection = RunService.Stepped:Connect(function()
        if Settings.NoclipEnabled and character then
            for _, part in ipairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end)
end

function disableNoclip()
    if noclipConnection then
        noclipConnection:Disconnect()
        noclipConnection = nil
    end
    
    if character then
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
    end
end

-- Функция FullBright
function enableFullBright()
    originalAmbient = Lighting.Ambient
    originalBrightness = Lighting.Brightness
    originalOutdoorAmbient = Lighting.OutdoorAmbient
    
    Lighting.Ambient = Color3.new(1, 1, 1)
    Lighting.Brightness = 2
    Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
    Lighting.ClockTime = 14
    Lighting.FogEnd = 100000
    Lighting.GlobalShadows = false
end

function disableFullBright()
    Lighting.Ambient = originalAmbient
    Lighting.Brightness = originalBrightness
    Lighting.OutdoorAmbient = originalOutdoorAmbient
    Lighting.GlobalShadows = true
end

-- Функция создания ESP для токенов
function createESP()
    clearESP()
    local tokens = findTargetBloodTokens()
    
    for _, token in pairs(tokens) do
        if token and token.Parent then
            local part = token:IsA("BasePart") and token or token:FindFirstChildWhichIsA("BasePart", true)
            
            if part then
                local billboard = Instance.new("BillboardGui")
                billboard.Name = "TokenESP"
                billboard.Adornee = part
                billboard.Size = UDim2.new(0, 100, 0, 50)
                billboard.StudsOffset = Vector3.new(0, 2, 0)
                billboard.AlwaysOnTop = true
                billboard.Parent = part
                
                local textLabel = Instance.new("TextLabel")
                textLabel.Size = UDim2.new(1, 0, 1, 0)
                textLabel.BackgroundTransparency = 1
                textLabel.Text = token.Name
                textLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
                textLabel.TextStrokeTransparency = 0.5
                textLabel.TextScaled = true
                textLabel.Font = Enum.Font.SourceSansBold
                textLabel.Parent = billboard
                
                local highlight = Instance.new("Highlight")
                highlight.Name = "TokenHighlight"
                highlight.Adornee = part
                highlight.FillColor = Color3.fromRGB(255, 0, 0)
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                highlight.FillTransparency = 0.5
                highlight.OutlineTransparency = 0
                highlight.Parent = part
                
                table.insert(espObjects, {billboard, highlight})
            end
        end
    end
end

-- Функция очистки ESP токенов
function clearESP()
    for _, espPair in pairs(espObjects) do
        for _, obj in pairs(espPair) do
            if obj and obj.Parent then
                obj:Destroy()
            end
        end
    end
    espObjects = {}
    
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj.Name == "TokenESP" or obj.Name == "TokenHighlight" then
            obj:Destroy()
        end
    end
end

-- Функция создания ESP для паллет
function createPalletESP()
    clearPalletESP()
    
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj.Name:lower():find("pallet") or obj.Name:lower():find("pallete") then
            local part = obj:IsA("BasePart") and obj or obj:FindFirstChildWhichIsA("BasePart", true)
            
            if part then
                local billboard = Instance.new("BillboardGui")
                billboard.Name = "PalletESP"
                billboard.Adornee = part
                billboard.Size = UDim2.new(0, 100, 0, 50)
                billboard.StudsOffset = Vector3.new(0, 2, 0)
                billboard.AlwaysOnTop = true
                billboard.Parent = part
                
                local textLabel = Instance.new("TextLabel")
                textLabel.Size = UDim2.new(1, 0, 1, 0)
                textLabel.BackgroundTransparency = 1
                textLabel.Text = "Pallet"
                textLabel.TextColor3 = Color3.fromRGB(218, 216, 113)
                textLabel.TextStrokeTransparency = 0.5
                textLabel.TextScaled = true
                textLabel.Font = Enum.Font.SourceSansBold
                textLabel.Parent = billboard
                
                local highlight = Instance.new("Highlight")
                highlight.Name = "PalletHighlight"
                highlight.Adornee = part
                highlight.FillColor = Color3.fromRGB(218, 216, 113)
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                highlight.FillTransparency = 0.5
                highlight.OutlineTransparency = 0
                highlight.Parent = part
                
                table.insert(palletESPObjects, {billboard, highlight})
            end
        end
    end
end

-- Функция очистки ESP паллет
function clearPalletESP()
    for _, espPair in pairs(palletESPObjects) do
        for _, obj in pairs(espPair) do
            if obj and obj.Parent then
                obj:Destroy()
            end
        end
    end
    palletESPObjects = {}
    
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj.Name == "PalletESP" or obj.Name == "PalletHighlight" then
            obj:Destroy()
        end
    end
end

-- Функция создания ESP для локеров
function createLockerESP()
    clearLockerESP()
    
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj.Name:lower():find("locker") then
            local part = obj:IsA("BasePart") and obj or obj:FindFirstChildWhichIsA("BasePart", true)
            
            if part then
                local billboard = Instance.new("BillboardGui")
                billboard.Name = "LockerESP"
                billboard.Adornee = part
                billboard.Size = UDim2.new(0, 100, 0, 50)
                billboard.StudsOffset = Vector3.new(0, 2, 0)
                billboard.AlwaysOnTop = true
                billboard.Parent = part
                
                local textLabel = Instance.new("TextLabel")
                textLabel.Size = UDim2.new(1, 0, 1, 0)
                textLabel.BackgroundTransparency = 1
                textLabel.Text = "Locker"
                textLabel.TextColor3 = Color3.fromRGB(205, 87, 0)
                textLabel.TextStrokeTransparency = 0.5
                textLabel.TextScaled = true
                textLabel.Font = Enum.Font.SourceSansBold
                textLabel.Parent = billboard
                
                local highlight = Instance.new("Highlight")
                highlight.Name = "LockerHighlight"
                highlight.Adornee = part
                highlight.FillColor = Color3.fromRGB(205, 87, 0)
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                highlight.FillTransparency = 0.5
                highlight.OutlineTransparency = 0
                highlight.Parent = part
                
                table.insert(lockerESPObjects, {billboard, highlight})
            end
        end
    end
end

-- Функция очистки ESP локеров
function clearLockerESP()
    for _, espPair in pairs(lockerESPObjects) do
        for _, obj in pairs(espPair) do
            if obj and obj.Parent then
                obj:Destroy()
            end
        end
    end
    lockerESPObjects = {}
    
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj.Name == "LockerESP" or obj.Name == "LockerHighlight" then
            obj:Destroy()
        end
    end
end

-- Функция создания ESP для игроков
function createPlayerESP()
    clearPlayerESP()
    
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr ~= player and plr.Character then
            local char = plr.Character
            local part = char:FindFirstChild("HumanoidRootPart")
            
            if part then
                local billboard = Instance.new("BillboardGui")
                billboard.Name = "PlayerESP"
                billboard.Adornee = part
                billboard.Size = UDim2.new(0, 100, 0, 50)
                billboard.StudsOffset = Vector3.new(0, 3, 0)
                billboard.AlwaysOnTop = true
                billboard.Parent = part
                
                local textLabel = Instance.new("TextLabel")
                textLabel.Size = UDim2.new(1, 0, 1, 0)
                textLabel.BackgroundTransparency = 1
                textLabel.Text = plr.Name
                textLabel.TextColor3 = Color3.fromRGB(175, 238, 238)
                textLabel.TextStrokeTransparency = 0.5
                textLabel.TextScaled = true
                textLabel.Font = Enum.Font.SourceSansBold
                textLabel.Parent = billboard
                
                local highlight = Instance.new("Highlight")
                highlight.Name = "PlayerHighlight"
                highlight.Adornee = char
                highlight.FillColor = Color3.fromRGB(175, 238, 238)
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                highlight.FillTransparency = 0.5
                highlight.OutlineTransparency = 0
                highlight.Parent = char
                
                table.insert(playerESPObjects, {billboard, highlight})
            end
        end
    end
end

-- Функция очистки ESP игроков
function clearPlayerESP()
    for _, espPair in pairs(playerESPObjects) do
        for _, obj in pairs(espPair) do
            if obj and obj.Parent then
                obj:Destroy()
            end
        end
    end
    playerESPObjects = {}
    
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj.Name == "PlayerESP" or obj.Name == "PlayerHighlight" then
            obj:Destroy()
        end
    end
end

-- Rage функции
local grabConnection = nil
local spinConnection = nil
local flingConnection = nil
local originalCFrames = {}

function grabAllPlayers()
    if grabConnection then grabConnection:Disconnect() end
    
    grabConnection = RunService.Heartbeat:Connect(function()
        for _, plr in pairs(game.Players:GetPlayers()) do
            if plr ~= player and plr.Character then
                local root = plr.Character:FindFirstChild("HumanoidRootPart")
                if root and humanoidRootPart then
                    root.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 0, -5)
                end
            end
        end
    end)
end

function releaseAllPlayers()
    if grabConnection then
        grabConnection:Disconnect()
        grabConnection = nil
    end
end

function spinAllPlayers()
    if spinConnection then spinConnection:Disconnect() end
    
    local angle = 0
    spinConnection = RunService.Heartbeat:Connect(function()
        angle = angle + 5
        for _, plr in pairs(game.Players:GetPlayers()) do
            if plr ~= player and plr.Character then
                local root = plr.Character:FindFirstChild("HumanoidRootPart")
                if root then
                    root.CFrame = root.CFrame * CFrame.Angles(0, math.rad(angle), 0)
                end
            end
        end
    end)
end

function stopSpinPlayers()
    if spinConnection then
        spinConnection:Disconnect()
        spinConnection = nil
    end
end

function ragdollAllPlayers()
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr ~= player and plr.Character then
            local humanoid = plr.Character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.PlatformStand = true
            end
        end
    end
end

function unragdollAllPlayers()
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr ~= player and plr.Character then
            local humanoid = plr.Character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.PlatformStand = false
            end
        end
    end
end

-- Реальный фlinг через физику
function startFlingPlayers()
    if flingConnection then flingConnection:Disconnect() end
    
    -- Сохраняем оригинальные свойства своего персонажа
    if character and humanoidRootPart then
        local originalSize = humanoidRootPart.Size
        local originalMassless = humanoidRootPart.Massless
        
        -- Делаем свой HumanoidRootPart невидимым и массивным
        humanoidRootPart.Size = Vector3.new(8, 8, 8)
        humanoidRootPart.Transparency = 1
        humanoidRootPart.Massless = false
        humanoidRootPart.CanCollide = false
        
        flingConnection = RunService.Heartbeat:Connect(function()
            if humanoidRootPart then
                -- Быстрое вращение для создания силы
                humanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                humanoidRootPart.RotVelocity = Vector3.new(9e9, 9e9, 9e9)
                
                -- Телепортируемся к игрокам для столкновения
                for _, plr in pairs(game.Players:GetPlayers()) do
                    if plr ~= player and plr.Character then
                        local targetRoot = plr.Character:FindFirstChild("HumanoidRootPart")
                        if targetRoot then
                            humanoidRootPart.CFrame = targetRoot.CFrame
                        end
                    end
                end
            end
        end)
    end
end

function stopFlingPlayers()
    if flingConnection then
        flingConnection:Disconnect()
        flingConnection = nil
    end
    
    -- Восстанавливаем оригинальные свойства
    if humanoidRootPart then
        humanoidRootPart.Size = Vector3.new(2, 2, 1)
        humanoidRootPart.Transparency = 1
        humanoidRootPart.Massless = true
        humanoidRootPart.CanCollide = false
        humanoidRootPart.Velocity = Vector3.new(0, 0, 0)
        humanoidRootPart.RotVelocity = Vector3.new(0, 0, 0)
    end
end

function freezeAllPlayers()
    originalCFrames = {}
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr ~= player and plr.Character then
            local root = plr.Character:FindFirstChild("HumanoidRootPart")
            if root then
                originalCFrames[plr.UserId] = root.CFrame
                root.Anchored = true
            end
        end
    end
end

function unfreezeAllPlayers()
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr ~= player and plr.Character then
            local root = plr.Character:FindFirstChild("HumanoidRootPart")
            if root then
                root.Anchored = false
            end
        end
    end
    originalCFrames = {}
end

-- Emote Wheel (всегда активно, нажми B)
local emoteWheelGui = nil
local emoteWheelConnections = {}

local function initEmoteWheel()
    emoteWheelGui = Instance.new("ScreenGui")
    emoteWheelGui.Name = "EmoteWheel"
    emoteWheelGui.ResetOnSpawn = false
    
    local success, _ = pcall(function() 
        emoteWheelGui.Parent = game:GetService("CoreGui") 
    end)
    if not success then 
        emoteWheelGui.Parent = player:WaitForChild("PlayerGui") 
    end

    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.BackgroundTransparency = 1
    bg.Visible = false
    bg.Parent = emoteWheelGui

    local pages = {
        {
            {name = "Griddy", id = 71864055176836},
            {name = "TakeTheL", id = 107795487146601},
            {name = "SnoopsWalk", id = 110204898807330},
            {name = "ElectroShuffle", id = 138727713064496},
            {name = "Twerk", id = 71683179159204},
            {name = "PopularVibe", id = 93062298566806},
            {name = "OrangeJustice", id = 95127716920692},
            {name = "Floss", id = 80550101607592},
            {name = "Fresh", id = 137039451581216}
        },
        {
            {name = "CaliforniaGirls", id = 96463900850916},
            {name = "GetSturdy", id = 102571052202995},
            {name = "CoffinWalkout", id = 126771729094882},
            {name = "TheRobot", id = 83514960413286},
            {name = "RusDance", id = 119473524290403},
            {name = "FrightFunk", id = 111355126129291},
            {name = "Zany", id = 90683763183723},
            {name = "ElectroSwing", id = 137750876111662},
            {name = "BillyBounce", id = 133394554631338}
        },
        {
            {name = "DiscoFever", id = 77383821395491},
            {name = "Condition", id = 107828342516230},
            {name = "Drunk", id = 95689071082560},
            {name = "Rollie", id = 125146305865250},
            {name = "Xavier", id = 111079103818250},
            {name = "Flying", id = 127571436160081},
            {name = "Backflip", id = 133675142555339},
            {name = "CrissCross", id = 77044871585499},
            {name = "RideDaPony", id = 119284187579961}
        },
        {
            {name = "PeacemakerBounce", id = 111906563478881},
            {name = "WhatYouWant", id = 115781688996859},
            {name = "RaceCar", id = 72382226286301},
            {name = "BestMates", id = 71192538790916},
            {name = "GangnamStyle", id = 129764254213842},
            {name = "BoogieDown", id = 99662142344622},
            {name = "DefaultDance", id = 101011728520473},
            {name = "Rambunctious", id = 129991743366120},
            {name = "Macaroni", id = 71693227925289}
        },
    }

    local currentPage = 1
    local currentTrack = nil
    local buttons = {}
    
    local pageText = Instance.new("TextLabel")
    pageText.Size = UDim2.new(0, 200, 0, 30)
    pageText.Position = UDim2.new(0.5, -100, 0.95, 0)
    pageText.BackgroundTransparency = 1
    pageText.Text = "1/"..#pages
    pageText.TextColor3 = Color3.new(1, 1, 1)
    pageText.Font = Enum.Font.SourceSansBold
    pageText.TextSize = 24
    pageText.Visible = false
    pageText.Parent = bg

    local radius = 200
    local step = 360/9

    for i = 1, 9 do
        local btn = Instance.new("ImageButton")
        btn.Size = UDim2.new(0, 110, 0, 110)
        btn.BackgroundTransparency = 1
        btn.Image = "rbxassetid://3570695787"
        btn.ImageColor3 = Color3.fromRGB(70, 70, 70)
        btn.ImageTransparency = 0.4
        btn.ScaleType = Enum.ScaleType.Slice
        btn.SliceCenter = Rect.new(128, 128, 128, 128)
        btn.Visible = false
        btn.Parent = bg

        local txt = Instance.new("TextLabel")
        txt.Size = UDim2.new(1, 0, 1, 0)
        txt.BackgroundTransparency = 1
        txt.TextColor3 = Color3.new(1, 1, 1)
        txt.Font = Enum.Font.SourceSansBold
        txt.TextSize = 22
        txt.TextScaled = false
        txt.Parent = btn

        local ang = math.rad(step * (i - 1) - 90)
        btn.Position = UDim2.new(0.5, math.cos(ang) * radius, 0.5, math.sin(ang) * radius)
        btn.AnchorPoint = Vector2.new(0.5, 0.5)

        table.insert(buttons, {button = btn, text = txt, connection = nil})
    end

    local function stopEmote()
        if currentTrack then
            currentTrack:Stop()
            currentTrack = nil
        end
    end

    local function playEmote(id)
        stopEmote()
        local char = player.Character
        local hum = char and char:FindFirstChild("Humanoid")
        if not hum then return end
        
        local anim = Instance.new("Animation")
        anim.AnimationId = "rbxassetid://" .. id
        currentTrack = hum:LoadAnimation(anim)
        currentTrack.Priority = Enum.AnimationPriority.Action4
        currentTrack:Play()
    end

    local LastMouseBehavior = Enum.MouseBehavior.Default
    local LastMouseIconEnabled = true

    local function closeMenu()
        bg.Visible = false
        pageText.Visible = false
        UserInputService.MouseBehavior = LastMouseBehavior 
        UserInputService.MouseIconEnabled = LastMouseIconEnabled
    end
    
    local function openMenu()
        bg.Visible = true
        pageText.Visible = true
        
        LastMouseBehavior = UserInputService.MouseBehavior
        LastMouseIconEnabled = UserInputService.MouseIconEnabled
        
        UserInputService.MouseBehavior = Enum.MouseBehavior.Default
        UserInputService.MouseIconEnabled = true
    end

    local function updatePage()
        local pageData = pages[currentPage]
        if not pageData then return end
        
        pageText.Text = currentPage .. "/" .. #pages

        for i = 1, 9 do
            local btnData = buttons[i]
            local emoteData = pageData[i]
            
            if emoteData then
                btnData.button.Visible = true
                btnData.text.Text = emoteData.name:gsub("([A-Z])", " %1"):sub(2):gsub(" ", "\n")
                
                if btnData.connection then btnData.connection:Disconnect() end
                
                btnData.connection = btnData.button.MouseButton1Click:Connect(function()
                    playEmote(emoteData.id)
                    closeMenu()
                end)
            else
                btnData.button.Visible = false
            end
        end
    end

    local centerBtn = Instance.new("TextButton")
    centerBtn.Size = UDim2.new(0, 300, 0, 300)
    centerBtn.Position = UDim2.new(0.5, -150, 0.5, -150)
    centerBtn.BackgroundTransparency = 1
    centerBtn.Text = ""
    centerBtn.Visible = false
    centerBtn.Parent = bg
    
    local stopConn = centerBtn.MouseButton1Click:Connect(function()
        stopEmote()
        closeMenu()
    end)
    table.insert(emoteWheelConnections, stopConn)

    local wheelConn = UserInputService.InputChanged:Connect(function(input, gp)
        if gp then return end
        if not bg.Visible then return end
        
        if input.UserInputType == Enum.UserInputType.MouseWheel then
            if input.Position.Z > 0 then
                currentPage = currentPage - 1
                if currentPage < 1 then currentPage = #pages end
            else
                currentPage = currentPage + 1
                if currentPage > #pages then currentPage = 1 end
            end
            updatePage()
        end
    end)
    table.insert(emoteWheelConnections, wheelConn)

    local keyConn = UserInputService.InputBegan:Connect(function(input, gp)
        if gp then return end
        if input.KeyCode == Enum.KeyCode.B then
            if bg.Visible then
                closeMenu()
                centerBtn.Visible = false
            else
                updatePage()
                openMenu()
                centerBtn.Visible = true
            end
        end
    end)
    table.insert(emoteWheelConnections, keyConn)
    
    updatePage()
end

initEmoteWheel()

spawn(function()
    while wait(5) do
        if Settings.ESPEnabled then
            createESP()
        end
        if Settings.PalletESPEnabled then
            createPalletESP()
        end
        if Settings.LockerESPEnabled then
            createLockerESP()
        end
        if Settings.PlayerESPEnabled then
            createPlayerESP()
        end
    end
end)

-- Обновление статистики
spawn(function()
    while wait(1) do
        StatsLabel:Set("Tokens Collected: " .. collectedCount)
        if player.leaderstats and player.leaderstats:FindFirstChild("BloodTokens") then
            BalanceLabel:Set("Current Balance: " .. player.leaderstats.BloodTokens.Value)
        end
    end
end)

player.CharacterAdded:Connect(function(newChar)
    character = newChar
    humanoidRootPart = newChar:WaitForChild("HumanoidRootPart")
    
    if Settings.WalkSpeedEnabled then
        enableWalkSpeed()
    end
    if Settings.FlyEnabled then
        enableFly()
    end
    if Settings.NoclipEnabled then
        enableNoclip()
    end
end)

spawn(function()
    while wait(0.5) do
        if Settings.FarmEnabled then
            if not character or not character.Parent then
                character = player.Character or player.CharacterAdded:Wait()
                humanoidRootPart = character:WaitForChild("HumanoidRootPart")
            end
            
            local tokens = findTargetBloodTokens()
            
            if #tokens == 0 then
                wait(2)
            else
                for _, token in pairs(tokens) do
                    if not Settings.FarmEnabled then break end
                    
                    if token and token.Parent then
                        local pos = getPosition(token)
                        
                        if pos then
                            teleportTo(pos)
                            collectedCount = collectedCount + 1
                            wait(Settings.TeleportDelay)
                        end
                    end
                end
            end
            
            wait(0.5)
        end
    end
end)
