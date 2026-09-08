-- GoryHub for Doors
-- By Gorynych

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "GoryHub for Doors by Gorynych",
    LoadingTitle = "Loading GoryHub...",
    LoadingSubtitle = "By Gorynych (@Robloxianq6w9k8t4b)",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "DoorsCheatsV1"
    }
})

local MainTab = Window:CreateTab("Main cheats", 4483362458)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local ESPDoors = false
local ESPKeys = false
local ESPItems = false
local ESPLevers = false
local ESPMonsters = false
local ESPPlayers = false
local ESPBooks = false
local ESPWardrobes = false
local MonsterNotify = false

local fullbrightConn = nil
local fovConn = nil
local speedConn = nil
local monsterNotifyConn = nil

local monsterNames = {"RushMoving", "AmbushMoving", "Eyes", "Halt", "SeekMoving", "A60", "A120"}

local itemNames = {"Crucifix", "Flashlight", "Lighter", "Lockpick", "SkeletonKey", "Battery", "Vitamins", "Smoothie", "Candle", "Bandage"}

local defaultFOV = 70
local defaultSpeed = 15
local currentFOV = defaultFOV
local currentSpeed = defaultSpeed
local seekChaseSpeed = 23

local trackedBooks = {}
local trackedFigure50 = nil
local trackedFigure100 = nil
local trackedWardrobes = {}
local trackedKeys = {}
local trackedLevers = {}

local function playAlertSound()
    pcall(function()
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://124951621656853"
        sound.Volume = 1
        sound.Parent = game:GetService("SoundService")
        sound:Play()
        
        game:GetService("Debris"):AddItem(sound, 3)
    end)
end

local function createESP(part, color, name, sizeMultiplier, showText)
    if not part or not part:IsA("BasePart") then return end
    
    sizeMultiplier = sizeMultiplier or 1
    showText = showText == nil and true or showText
    
    pcall(function()
        if part:FindFirstChild("ESPBox") then part.ESPBox:Destroy() end
        if part:FindFirstChild("ESPBillboard") then part.ESPBillboard:Destroy() end
        
        local box = Instance.new("BoxHandleAdornment")
        box.Name = "ESPBox"
        box.Parent = part
        box.Adornee = part
        box.Size = part.Size * sizeMultiplier
        box.Color3 = color
        box.Transparency = 0.3
        box.AlwaysOnTop = true
        box.ZIndex = 10
        box.Visible = true
        
        if showText and name and name ~= "" then
            local billboard = Instance.new("BillboardGui")
            billboard.Name = "ESPBillboard"
            billboard.Parent = part
            billboard.Adornee = part
            billboard.Size = UDim2.new(0, 200, 0, 50)
            billboard.StudsOffset = Vector3.new(0, 4, 0)
            billboard.AlwaysOnTop = true
            
            local textLabel = Instance.new("TextLabel")
            textLabel.Parent = billboard
            textLabel.Size = UDim2.new(1, 0, 1, 0)
            textLabel.BackgroundTransparency = 1
            textLabel.Text = name
            textLabel.TextColor3 = color
            textLabel.TextScaled = true
            textLabel.Font = Enum.Font.SourceSansBold
            textLabel.TextStrokeTransparency = 0
            textLabel.TextStrokeColor3 = Color3.new(0,0,0)
        end
    end)
end

local function removeESP(part)
    pcall(function()
        if part:FindFirstChild("ESPBox") then part.ESPBox:Destroy() end
        if part:FindFirstChild("ESPBillboard") then part.ESPBillboard:Destroy() end
    end)
end

local function findBooks()
    if not ESPBooks then
        for _, part in pairs(trackedBooks) do
            removeESP(part)
        end
        trackedBooks = {}
        return
    end
    
    local currentRooms = Workspace:FindFirstChild("CurrentRooms")
    if not currentRooms then return end
    
    local room50 = currentRooms:FindFirstChild("50")
    if room50 then
        local assets = room50:FindFirstChild("Assets")
        if assets then
            for _, bookshelf in pairs(assets:GetChildren()) do
                if bookshelf.Name:find("Bookshelves") then
                    for _, item in pairs(bookshelf:GetChildren()) do
                        local liveHintBook = item:FindFirstChild("LiveHintBook")
                        if liveHintBook then
                            local base = liveHintBook:FindFirstChild("Base")
                            if base and base:IsA("BasePart") and not base:FindFirstChild("ESPBox") then
                                createESP(base, Color3.fromRGB(255, 255, 0), "", 1, false)
                                table.insert(trackedBooks, base)
                            end
                        end
                    end
                end
            end
        end
    end
    
    local room100 = currentRooms:FindFirstChild("100")
    if room100 then
        for _, child in pairs(room100:GetChildren()) do
            local base = child:FindFirstChild("Base")
            if base and base:IsA("BasePart") and not base:FindFirstChild("ESPBox") then
                createESP(base, Color3.fromRGB(255, 255, 0), "", 1, false)
                table.insert(trackedBooks, base)
            end
        end
    end
end

local function findFigure()
    if not ESPMonsters then
        if trackedFigure50 then
            removeESP(trackedFigure50)
            trackedFigure50 = nil
        end
        if trackedFigure100 then
            removeESP(trackedFigure100)
            trackedFigure100 = nil
        end
        return
    end
    
    local currentRooms = Workspace:FindFirstChild("CurrentRooms")
    if not currentRooms then return end
    
    local room50 = currentRooms:FindFirstChild("50")
    if room50 then
        local figureSetup = room50:FindFirstChild("FigureSetup")
        if figureSetup then
            local figureRig = figureSetup:FindFirstChild("FigureRig")
            if figureRig then
                local hitbox = figureRig:FindFirstChild("Hitbox")
                if hitbox and hitbox:IsA("BasePart") and not hitbox:FindFirstChild("ESPBox") then
                    createESP(hitbox, Color3.fromRGB(255, 0, 0), "Monster: Figure")
                    trackedFigure50 = hitbox
                end
            end
        end
    end
    
    local room100 = currentRooms:FindFirstChild("100")
    if room100 then
        local figureSetup = room100:FindFirstChild("FigureSetup")
        if figureSetup then
            local figureRig = figureSetup:FindFirstChild("FigureRig")
            if figureRig then
                local hitbox = figureRig:FindFirstChild("Hitbox")
                if hitbox and hitbox:IsA("BasePart") and not hitbox:FindFirstChild("ESPBox") then
                    createESP(hitbox, Color3.fromRGB(255, 0, 0), "Monster: Figure")
                    trackedFigure100 = hitbox
                end
            end
        end
    end
end

local function findWardrobes()
    if not ESPWardrobes then
        for _, part in pairs(trackedWardrobes) do
            removeESP(part)
        end
        trackedWardrobes = {}
        return
    end
    
    local currentRooms = Workspace:FindFirstChild("CurrentRooms")
    if not currentRooms then return end
    
    for _, room in pairs(currentRooms:GetChildren()) do
        local assets = room:FindFirstChild("Assets")
        if assets then
            for _, wardrobe in pairs(assets:GetChildren()) do
                if wardrobe.Name == "Wardrobe" then
                    local main = wardrobe:FindFirstChild("Main")
                    if main and main:IsA("BasePart") and not main:FindFirstChild("ESPBox") then
                        createESP(main, Color3.fromRGB(224, 145, 76), "Closet")
                        table.insert(trackedWardrobes, main)
                    end
                end
            end
        end
    end
end

local function findKeys()
    if not ESPKeys then
        for _, part in pairs(trackedKeys) do
            removeESP(part)
        end
        trackedKeys = {}
        return
    end
    
    local currentRooms = Workspace:FindFirstChild("CurrentRooms")
    if not currentRooms then return end
    
    for _, room in pairs(currentRooms:GetChildren()) do
        local assets = room:FindFirstChild("Assets")
        if assets then
            local keyObtain = assets:FindFirstChild("KeyObtain")
            if keyObtain then
                local hitbox = keyObtain:FindFirstChild("Hitbox")
                if hitbox and hitbox:IsA("BasePart") and not hitbox:FindFirstChild("ESPBox") then
                    createESP(hitbox, Color3.fromRGB(255, 255, 0), "Key", 0.5)
                    table.insert(trackedKeys, hitbox)
                end
            end
            
            for _, child in pairs(assets:GetDescendants()) do
                if child.Name == "KeyObtain" and child:IsA("Model") then
                    local hitbox = child:FindFirstChild("Hitbox")
                    if hitbox and hitbox:IsA("BasePart") and not hitbox:FindFirstChild("ESPBox") then
                        createESP(hitbox, Color3.fromRGB(255, 255, 0), "Key", 0.5)
                        table.insert(trackedKeys, hitbox)
                    end
                end
            end
        end
    end
end

local function findLevers()
    if not ESPLevers then
        for _, part in pairs(trackedLevers) do
            removeESP(part)
        end
        trackedLevers = {}
        return
    end
    
    local currentRooms = Workspace:FindFirstChild("CurrentRooms")
    if not currentRooms then return end
    
    for _, room in pairs(currentRooms:GetChildren()) do
        local assets = room:FindFirstChild("Assets")
        if assets then
            local leverForGate = assets:FindFirstChild("LeverForGate")
            if leverForGate then
                local main = leverForGate:FindFirstChild("Main")
                if main and main:IsA("BasePart") and not main:FindFirstChild("ESPBox") then
                    createESP(main, Color3.fromRGB(255, 165, 0), "Lever")
                    table.insert(trackedLevers, main)
                end
            end
        end
    end
end

local function updateESP()
    while true do
        pcall(function()
            local currentRooms = Workspace:FindFirstChild("CurrentRooms")
            if not currentRooms then return end
            
            if ESPDoors then
                for _, room in pairs(currentRooms:GetChildren()) do
                    local door = room:FindFirstChild("Door")
                    if door and door.PrimaryPart and not door.PrimaryPart:FindFirstChild("ESPBox") then
                        local roomNum = room.Name
                        createESP(door.PrimaryPart, Color3.fromRGB(100, 255, 100), "Door " .. roomNum+1, 1)
                    end
                end
            else
                for _, room in pairs(currentRooms:GetChildren()) do
                    local door = room:FindFirstChild("Door")
                    if door and door.PrimaryPart then
                        removeESP(door.PrimaryPart)
                    end
                end
            end
            
            if ESPItems then
                for _, room in pairs(currentRooms:GetChildren()) do
                    for _, descendant in pairs(room:GetDescendants()) do
                        if descendant:IsA("Model") and table.find(itemNames, descendant.Name) then
                            local part = descendant.PrimaryPart or descendant:FindFirstChildWhichIsA("BasePart")
                            if part and not part:FindFirstChild("ESPBox") then
                                createESP(part, Color3.fromRGB(255, 0, 255), descendant.Name)
                            end
                        end
                    end
                end
            else
                for _, room in pairs(currentRooms:GetChildren()) do
                    for _, descendant in pairs(room:GetDescendants()) do
                        if descendant:IsA("Model") and table.find(itemNames, descendant.Name) then
                            local part = descendant.PrimaryPart or descendant:FindFirstChildWhichIsA("BasePart")
                            if part then removeESP(part) end
                        end
                    end
                end
            end
        end)
        
        pcall(findBooks)
        
        pcall(findFigure)
        
        pcall(findWardrobes)
        
        pcall(findKeys)
        
        pcall(findLevers)
        
        pcall(function()
            if ESPMonsters then
                for _, monster in pairs(Workspace:GetChildren()) do
                    if monster:IsA("Model") and table.find(monsterNames, monster.Name) then
                        local part = monster.PrimaryPart or monster:FindFirstChild("HumanoidRootPart") or monster:FindFirstChildWhichIsA("BasePart")
                        if part and not part:FindFirstChild("ESPBox") then
                            createESP(part, Color3.fromRGB(255, 0, 0), "Monster: " .. monster.Name)
                        end
                    end
                end
            else
                for _, monster in pairs(Workspace:GetChildren()) do
                    if monster:IsA("Model") and table.find(monsterNames, monster.Name) then
                        local part = monster.PrimaryPart or monster:FindFirstChild("HumanoidRootPart") or monster:FindFirstChildWhichIsA("BasePart")
                        if part then removeESP(part) end
                    end
                end
            end
        end)
        
        pcall(function()
            if ESPPlayers then
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character and player.Character.PrimaryPart and not player.Character.PrimaryPart:FindFirstChild("ESPBox") then
                        createESP(player.Character.PrimaryPart, Color3.fromRGB(0, 255, 255), player.Name)
                    end
                end
            else
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character and player.Character.PrimaryPart then
                        removeESP(player.Character.PrimaryPart)
                    end
                end
            end
        end)
        
        wait(0.5)
    end
end

spawn(updateESP)

MainTab:CreateToggle({
    Name = "Fullbright",
    CurrentValue = false,
    Flag = "FullbrightV1",
    Callback = function(Value)
        if Value then
            fullbrightConn = RunService.Heartbeat:Connect(function()
                Lighting.Brightness = 2
                Lighting.ClockTime = 14
                Lighting.FogEnd = 9e9
                Lighting.GlobalShadows = false
                Lighting.OutdoorAmbient = Color3.new(1,1,1)
                Lighting.Ambient = Color3.new(1,1,1)
                Lighting.ShadowSoftness = 0
            end)
        else
            if fullbrightConn then fullbrightConn:Disconnect(); fullbrightConn = nil end
            Lighting.Brightness = 1
            Lighting.ClockTime = 0
            Lighting.FogEnd = 100000
            Lighting.GlobalShadows = true
            Lighting.OutdoorAmbient = Color3.new(0.5,0.5,0.5)
            Lighting.Ambient = Color3.new(0.4,0.4,0.5)
        end
    end,
})

MainTab:CreateToggle({
    Name = "Door ESP",
    CurrentValue = false,
    Flag = "ESPDoorsV1",
    Callback = function(Value)
        ESPDoors = Value
    end,
})

MainTab:CreateToggle({
    Name = "Key ESP",
    CurrentValue = false,
    Flag = "ESPKeysV1",
    Callback = function(Value)
        ESPKeys = Value
        if not Value then
            for _, part in pairs(trackedKeys) do
                removeESP(part)
            end
            trackedKeys = {}
        end
    end,
})

MainTab:CreateToggle({
    Name = "Items ESP (sometimes it doesn't work)",
    CurrentValue = false,
    Flag = "ESPItemsV1",
    Callback = function(Value)
        ESPItems = Value
    end,
})

MainTab:CreateToggle({
    Name = "Lever ESP",
    CurrentValue = false,
    Flag = "ESPLeversV1",
    Callback = function(Value)
        ESPLevers = Value
        if not Value then
            for _, part in pairs(trackedLevers) do
                removeESP(part)
            end
            trackedLevers = {}
        end
    end,
})

MainTab:CreateToggle({
    Name = "Closet ESP",
    CurrentValue = false,
    Flag = "ESPWardrobesV1",
    Callback = function(Value)
        ESPWardrobes = Value
        if not Value then
            for _, part in pairs(trackedWardrobes) do
                removeESP(part)
            end
            trackedWardrobes = {}
        end
    end,
})

MainTab:CreateToggle({
    Name = "Book/Fuses ESP",
    CurrentValue = false,
    Flag = "ESPBooksV1",
    Callback = function(Value)
        ESPBooks = Value
        if not Value then
            for _, part in pairs(trackedBooks) do
                removeESP(part)
            end
            trackedBooks = {}
        end
    end,
})

MainTab:CreateToggle({
    Name = "Monster ESP",
    CurrentValue = false,
    Flag = "ESPMonstersV1",
    Callback = function(Value)
        ESPMonsters = Value
        if not Value then
            if trackedFigure50 then
                removeESP(trackedFigure50)
                trackedFigure50 = nil
            end
            if trackedFigure100 then
                removeESP(trackedFigure100)
                trackedFigure100 = nil
            end
        end
    end,
})

MainTab:CreateToggle({
    Name = "Player ESP",
    CurrentValue = false,
    Flag = "ESPPlayersV1",
    Callback = function(Value)
        ESPPlayers = Value
    end,
})

-- Уведомления о Монстрах
MainTab:CreateToggle({
    Name = "Monster notification",
    CurrentValue = false,
    Flag = "MonsterNotifyV1",
    Callback = function(Value)
        if Value then
            monsterNotifyConn = Workspace.ChildAdded:Connect(function(child)
                if table.find(monsterNames, child.Name) then
                    playAlertSound()
                    
                    Rayfield:Notify({
                        Title = "MONSTER SPAWNED!",
                        Content = "ALERT: " .. child.Name .. " spawned!",
                        Duration = 5,
                        Image = 4483362458
                    })
                end
            end)
        else
            if monsterNotifyConn then monsterNotifyConn:Disconnect(); monsterNotifyConn = nil end
        end
    end,
})

MainTab:CreateSlider({
    Name = "FOV Changer",
    Range = {30, 120},
    Increment = 1,
    Suffix = "°",
    CurrentValue = defaultFOV,
    Flag = "FOVV1",
    Callback = function(Value)
        currentFOV = Value
        if fovConn then fovConn:Disconnect() end
        local camera = Workspace.CurrentCamera
        fovConn = RunService.RenderStepped:Connect(function()
            camera.FieldOfView = currentFOV
        end)
    end,
})

MainTab:CreateSlider({
    Name = "Speed (16-21)",
    Range = {16, 21},
    Increment = 1,
    Suffix = "",
    CurrentValue = defaultSpeed,
    Flag = "SpeedV1",
    Callback = function(Value)
        currentSpeed = Value
        if speedConn then speedConn:Disconnect() end
        speedConn = RunService.Heartbeat:Connect(function()
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("Humanoid") then
                local seekActive = Workspace:FindFirstChild("SeekMoving") ~= nil
                char.Humanoid.WalkSpeed = seekActive and seekChaseSpeed or currentSpeed
            end
        end)
    end,
})

MainTab:CreateButton({
    Name = "Reset FOV (default: 70)",
    Callback = function()
        currentFOV = defaultFOV
        if fovConn then fovConn:Disconnect(); fovConn = nil end
        Workspace.CurrentCamera.FieldOfView = defaultFOV
    end,
})

MainTab:CreateButton({
    Name = "Reset speed (default: 16)",
    Callback = function()
        currentSpeed = defaultSpeed
        if speedConn then speedConn:Disconnect(); speedConn = nil end
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = defaultSpeed
        end
    end,
})

LocalPlayer.CharacterAdded:Connect(function()
    wait(1)
    local char = LocalPlayer.Character
    if fovConn then
        Workspace.CurrentCamera.FieldOfView = currentFOV
    end
    if speedConn and char:FindFirstChild("Humanoid") then
        char.Humanoid.WalkSpeed = currentSpeed
    end
end)

Rayfield:Notify({
    Title = "Ready to use!",
    Content = "Have fun with GoryHub!",
    Duration = 8,
    Image = 4483362458
})
