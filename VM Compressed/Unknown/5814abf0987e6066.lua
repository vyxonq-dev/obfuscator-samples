local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0.5, -100, 0.5, -50)
frame.BackgroundColor3 = Color3.new(1, 1, 1)
frame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 20)
title.Position = UDim2.new(0, 0, 0, -20)
title.Text = "Key System"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundColor3 = Color3.new(0, 0, 0)
title.Parent = frame

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

title.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

title.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
        dragInput = nil
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

local KeySystem = Instance.new("TextBox")
KeySystem.Size = UDim2.new(1, 0, 0.5, 0)
KeySystem.Position = UDim2.new(0, 0, 0, 0)
KeySystem.Text = "Enter the Key"
KeySystem.TextColor3 = Color3.new(0, 0, 0)
KeySystem.BackgroundTransparency = 0.5
KeySystem.BackgroundColor3 = Color3.new(1, 1, 1)
KeySystem.TextWrapped = true
KeySystem.Parent = frame

local SubmitButton = Instance.new("TextButton")
SubmitButton.Size = UDim2.new(0.5, 0, 0.5, 0)
SubmitButton.Position = UDim2.new(0, 0, 0.5, 0)
SubmitButton.Text = "Submit"
SubmitButton.Parent = frame

local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 20, 0, 20)
CloseButton.Position = UDim2.new(1, -20, 0, 0)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.new(1, 1, 1)
CloseButton.BackgroundColor3 = Color3.new(1, 0, 0)
CloseButton.Parent = frame

CloseButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

local GetKeyButton = Instance.new("TextButton")
GetKeyButton.Size = UDim2.new(0.5, 0, 0.5, 0)
GetKeyButton.Position = UDim2.new(0.5, 0, 0.5, 0)
GetKeyButton.Text = "Get Key"
GetKeyButton.Parent = frame
--------------------------------------------------------------------------
SubmitButton.MouseButton1Click:Connect(function()
    local KeySystem = KeySystem.Text
    if KeySystem == "Kanan" then   
screenGui:Destroy()

local DesyncedLibrary = loadstring(game:HttpGet("https://bytesoftware.net/roblox/desynced/library.lua"))()

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local player = Players.LocalPlayer
local placeId = game.PlaceId
local StarterGui = game:GetService("StarterGui")
local runService = game:GetService("RunService")
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")
local player = game.Players.LocalPlayer

local function getServerList(url)
    local raw = game:HttpGet(url)
    return HttpService:JSONDecode(raw)
end

function LowestPlayer()
    local api = "https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?sortOrder=Asc&limit=100"
    local nextCursor, server
    repeat
        local servers = getServerList(api .. (nextCursor and "&cursor=" .. nextCursor or ""))
        server = servers.data[1]
        nextCursor = servers.nextPageCursor
    until server
    TeleportService:TeleportToPlaceInstance(placeId, server.id, player)
end

function Rejoin()
    TeleportService:TeleportToPlaceInstance(placeId, game.JobId, player)
end

function Serverhop()
    local api = "https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?sortOrder=Desc&limit=100"
    local nextCursor, chosen
    repeat
        local servers = getServerList(api .. (nextCursor and "&cursor=" .. nextCursor or ""))
        for _, s in ipairs(servers.data) do
            if s.maxPlayers > s.playing then
                chosen = s
                break
            end
        end
        nextCursor = servers.nextPageCursor
    until chosen
    TeleportService:TeleportToPlaceInstance(placeId, chosen.id, player)
end

local TeleportService = game:GetService("TeleportService")
local placeId = game.PlaceId
local player = game.Players.LocalPlayer

local Player = game:GetService("Players").LocalPlayer
local antiKickConnection

local isAuto = {

    autoWeight = false,
    safeAutoWeight = false,
    autoPushups = false,
    safeAutoPushups = false,
    autoHandstands = false,
    safeAutoHandstands = false,
    autoSitups = false,
    safeAutoSitups = false,

    autoBeachSquatRack = false,
    autoBeachBenchPress = false,
    autoBeachPullups = false,
    autoBeachDeadlift = false,
    autoBeachBoulderThrow = false,

    autoFrostSquatRack = false,
    autoFrostBenchPress = false,
    autoFrostDeadlift = false,

    autoMythicalPullups = false,
    autoMythicalBenchPress = false,
    autoMythicalBoulderThrow = false,

    autoEternalBenchPress = false,

    autoLegendPullups = false,
    autoLegendSquatRack = false,
    autoLegendBenchPress = false,
    autoLegendDeadlift = false,
    autoLegendBoulderThrow = false,

    autoMuscleKingSquatRack = false,
    autoMuscleKingBenchPress = false,
    autoMuscleKingDeadlift = false,
    autoMuscleKingBoulder = false,

    autoJungleBenchPress = false,
    autoJungleDeadlift = false,
    autoJungleSquatRack = false,
    autoJungleBoulderThrow = false,

    rebirth = false,
    rebirthCooldown = 0.2,
    rebirthTarget = false,
    rebirthTargetCooldown = 0.5,
    rebirthTargetAmount = 0,

    autoStrength = false,
    autoKill = false,

    selectedDurability = nil,
    autoDurabilityFarm = false,

    hatchBasicPets = false,
    hatchAdvancedPets = false,
    hatchRarePets = false,
    hatchEpicPets = false,
    hatchUniquePets = false,
    hatchOmegaPets = false,

    selectedbasicpettohatch = "",
    selectedadvancedpettohatch = "",
    selectedrarepettohatch = "",
    selectedepicpettohatch = "",
    selecteduniquepettohatch = "",

    evolveBasicPets = false,
    evolveAdvancedcPets = false,
    evolveRarePets = false,
    evolveEpicPets = false,
    evolveUniquePets = false,
    evolveOmegaPets = false,

    selectedbasicpettoevolve = "",
    selectedadvancedpettoevolve = "",
    selectedrarepettoevolve = "",
    selectedepicpettoevolve = "",
    selecteduniquepettoevolve = "",

    basicexercise = "",
    beachgymlift = "",
    frostgymlift = "",
    mythicalgymlift = "",
    eternalgymlift = "",
    legendgymlift = "",
    musclekinggymlift = "",
    junglegymlift = "",
    durabilityrock = "",

    gifts = false,
    spinWheel = false,
    setsize = false,
    sizeamount = 0
}

local function teleportToBaseplate()
    local baseplate = Instance.new("Part")
    baseplate.Size = Vector3.new(2000, 2, 2000)
    baseplate.Anchored = true
    baseplate.Position = Vector3.new(0, 2000, 0)
    baseplate.Parent = game.Workspace

    game.Players.LocalPlayer.Character:MoveTo(baseplate.Position)
end

local function teleportBack()
    game.Players.LocalPlayer.Character:MoveTo(Vector3.new(0, 0, 0))
end

local function teleportTo(cframe)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cframe
end

local function equipPunchTool()
    local player = game.Players.LocalPlayer
    for _, tool in pairs(player.Backpack:GetChildren()) do
        if tool:IsA("Tool") and tool.Name == "Punch" then
            player.Character:WaitForChild("Humanoid"):EquipTool(tool)
        end
    end
end

local function UltimateKillAura()
    while isAuto.autoKill do
        task.wait(0.05)

        local player = game.Players.LocalPlayer
        local character = player.Character
        if not character then continue end

        equipPunchTool()

        for i = 1, 5 do
            player.muscleEvent:FireServer("punch", "rightHand")
            player.muscleEvent:FireServer("punch", "leftHand")
        end

        for _, target in pairs(game.Players:GetPlayers()) do
            if target ~= player and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                local targetChar = target.Character
                local localHand = character:FindFirstChild("LeftHand")

                if targetChar and localHand then

                    for _, part in pairs(targetChar:GetChildren()) do
                        if part:IsA("BasePart") then
                            part.CFrame = localHand.CFrame
                            part.Transparency = 1
                            part.CanCollide = false
                        end
                    end

                    for _, item in pairs(targetChar:GetChildren()) do
                        if item:IsA("Accessory") or item:IsA("Hat") or item:IsA("Tool") then
                            item:Destroy()
                        end
                    end
                end
            end
        end
    end
end

local Window = DesyncedLibrary:CreateWindow("Desynced", "Muscle Legends")

DesyncedLibrary:createNotification("The script for Muscle Legends has been successfully loaded.")

local Tab1 = Window:CreateTab("Universal Tools", "96221607452840")
local Tab2 = Window:CreateTab("Auto Farming", "127006372331103")
local Tab3 = Window:CreateTab("Rock Farming","78085483643024")
local Tab4 = Window:CreateTab("Pet Hatching","84773625854784")
local Tab5 = Window:CreateTab("Pet Evolution","84773625854784")

local Tab6 = Window:CreateTab("Crystals","91838642891131")
local Tab7 = Window:CreateTab("Auras","88426869189754")

local Tab8 = Window:CreateTab("Ultimates","88426869189754")
local Tab9 = Window:CreateTab("Teleportation", "140134362123695")
local Tab90 = Window:CreateTab("Rebirth System", "98702116897863")
local Tab10 = Window:CreateTab("Script Settings", "139117814373418")
local Tab12 = Window:CreateTab("Player Statistics", "133249606271733")

Tab1:CreateSection("Miscellaneous")
Tab1:CreateButton("Join Desynced Discord", function()
    setclipboard("https://discord.gg/bytesoftware")
    DesyncedLibrary:createNotification("Discord invite link has been copied to your clipboard.")
end)

Tab1:CreateToggle("Safe Lock", function(state) end)
Tab1:CreateBox("Enter FPS Cap", function(v)
    runService:Set3dRenderingEnabled(true)
    setfpscap(tonumber(v) or 60)
    DesyncedLibrary:createNotification("FPS cap set to " .. (tonumber(v) or 60))
end)


    Tab1:CreateSection("Network Optimization")
    Tab1:CreateToggle("Enable Ping Stabilizer", function(state)
        pingMonitorActive = state
        if state then
            spawn(function()
                while pingMonitorActive do
                    local ping = getPing()
                    if ping and ping > pingLimits.max then
                        repeat
                            wait(1)
                            ping = getPing()
                        until not pingMonitorActive or (ping and ping < pingLimits.min)
                    end
                    wait(0.5)
                end
            end)
        end
    end)
    Tab1:CreateToggle("Connection Enhancer", function(state)
        isAuto.enhanceConnection = state
        if state then
            spawn(function()
                while isAuto.enhanceConnection do
                    local networkClient = game:GetService("NetworkClient")
                    networkClient:SetOutgoingKBPSLimit(800000)
                    networkClient:SetIncomingKBPSLimit(800000)
                    wait(5)
                end
            end)
        end
    end)

Tab1:CreateSection("Kill Farming")
Tab1:CreateToggle("Auto Kill", function(state)
    isAuto.autoKill = state
    if state then
        spawn(UltimateKillAura)
    else
        wait(0.5)
        local humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then humanoid:UnequipTools() end
    end
end)

    Tab1:CreateSection("Extra Farming Options")

    Tab1:CreateBox("Enter Size", function(input)
        local num = tonumber(input)
        if num then
            isAuto.sizeamount = num
        else
            DesyncedLibrary:createNotification("Invalid size input!")
        end
    end)

    Tab1:CreateToggle("Auto Set Size", function(state)
        isAuto.setsize = state
        if state then
            spawn(function()
                while isAuto.setsize do
                    game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("changeSpeedSizeRemote"):InvokeServer("changeSize", isAuto.sizeamount)
                    wait(0.1)
                end
            end)
        end
    end)

    Tab1:CreateButton("Set Size", function()
        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("changeSpeedSizeRemote"):InvokeServer("changeSize", isAuto.sizeamount)
    end)

    Tab1:CreateToggle("Enable Auto Gifts", function(state)
        isAuto.gifts = state
        if state then
            spawn(function()
                while isAuto.gifts do
                    for i = 1, 8 do
                        local remote = game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("freeGiftClaimRemote")
                        remote:InvokeServer("claimGift", i)
                    end
                    wait(0.5)
                end
            end)
        end
    end)

    Tab1:CreateToggle("Auto Spin Wheel", function(state)
        isAuto.spinWheel = state
        if state then
            spawn(function()
                local replicatedStorage = game:GetService("ReplicatedStorage")
                local rEvents = replicatedStorage:WaitForChild("rEvents")
                local wheelRemote = rEvents:WaitForChild("openFortuneWheelRemote")
                local wheelChance = replicatedStorage:WaitForChild("fortuneWheelChances"):WaitForChild("Fortune Wheel")

                while isAuto.spinWheel do
                    wheelRemote:InvokeServer("openFortuneWheel", wheelChance)
                    wait(0.5)
                end
            end)
        end
    end)

    Tab1:CreateButton("Claim All Codes", function()
        local codes = {
        "junglegym500",
        "epicmuscle20",
        "ultimate250",
        "mightygems2500",
        "megalift50",
        "speedy50",
        "spacegems50",
        "EpicReward500",
        "MillionWarriors",
        "FrostGems10",
        "Musclestorm50",
        "SpaceGems50",
        "MegaLift50",
        "Speedy50",
        "SkyAgility50",
        "GalaxyCrystal50",
        "SuperMuscle100",
        "SuperPunch100",
        "Launch250"
    }

        local codeRemote = game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("codeRemote")
        for _, code in ipairs(codes) do
            codeRemote:InvokeServer(code)
        end
    end)

Tab1:CreateSection("Trading")
Tab1:CreateToggle("Enable Trading", function(state)
    local action = state and "enableTrading" or "disableTrading"
    ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("tradingEvent"):FireServer(action)
end)
Tab1:CreateBox("Trade Target Username", function(input)
    usernameTrade = input
end)
Tab1:CreateButton("Send Trade Request", function()
    if usernameTrade and usernameTrade ~= "" then
        local targetPlayer = Players:FindFirstChild(usernameTrade)
        if targetPlayer then
            ReplicatedStorage.rEvents.tradingEvent:FireServer("sendTradeRequest", targetPlayer)
            DesyncedLibrary:createNotification("Trade sent to: " .. usernameTrade)
        else
            DesyncedLibrary:createNotification("Player not found: " .. usernameTrade)
        end
    end
end)

Tab2:CreateSection("Basic Farm")
Tab2:CreateDropdown("Choose Exercise", {"Weight", "Pushups", "Handstands", "Situps"}, function(selected)
    isAuto.basicexercise = selected
end)

Tab2:CreateToggle("Auto Train", function(state)
    if state then
        local exercise = isAuto.basicexercise

        if exercise == "Weight" then
            isAuto.autoWeight = true
            spawn(function()
                while isAuto.autoWeight do
                    task.wait()
                    for _, tool in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if tool:IsA("Tool") and tool.Name == "Weight" then
                            local humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
                            if humanoid then
                                humanoid:EquipTool(tool)
                            end
                        end
                    end
                    game.Players.LocalPlayer.muscleEvent:FireServer("rep")
                end
            end)

        elseif exercise == "Pushups" then
            isAuto.autoPushups = true
            spawn(function()
                while isAuto.autoPushups do
                    task.wait()
                    for _, tool in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if tool:IsA("Tool") and tool.Name == "Pushups" then
                            local humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
                            if humanoid then
                                humanoid:EquipTool(tool)
                            end
                        end
                    end
                    game.Players.LocalPlayer.muscleEvent:FireServer("rep")
                end
            end)

        elseif exercise == "Handstands" then
            isAuto.autoHandstands = true
            spawn(function()
                while isAuto.autoHandstands do
                    task.wait()
                    for _, tool in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if tool:IsA("Tool") and tool.Name == "Handstands" then
                            local humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
                            if humanoid then
                                humanoid:EquipTool(tool)
                            end
                        end
                    end
                    game.Players.LocalPlayer.muscleEvent:FireServer("rep")
                end
            end)

        elseif exercise == "Situps" then
            isAuto.autoSitups = true
            spawn(function()
                while isAuto.autoSitups do
                    task.wait()
                    for _, tool in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if tool:IsA("Tool") and tool.Name == "Situps" then
                            local humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
                            if humanoid then
                                humanoid:EquipTool(tool)
                            end
                        end
                    end
                    game.Players.LocalPlayer.muscleEvent:FireServer("rep")
                end
            end)
        end
    else
        isAuto.autoWeight = false
        isAuto.autoPushups = false
        isAuto.autoHandstands = false
        isAuto.autoSitups = false

        task.wait(0.5)
        local humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid:UnequipTools()
        end
    end
end)

Tab2:CreateSection("Safe Basic Farm")
Tab2:CreateDropdown("Choose Exercise", {"Weight","Pushups","Handstands","Situps"}, function(cbe)
    isAuto.basicexercise = cbe
end)

Tab2:CreateToggle("Auto Train", function(state)
    if state then
        local exercise = isAuto.basicexercise

        if exercise == "Weight" then
            isAuto.safeAutoWeight = true
            teleportToBaseplate()
            spawn(function()
                while isAuto.safeAutoWeight do
                    task.wait()
                    for _, tool in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if tool:IsA("Tool") and tool.Name == "Weight" then
                            local humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
                            if humanoid then
                                humanoid:EquipTool(tool)
                            end
                        end
                    end
                    game.Players.LocalPlayer.muscleEvent:FireServer("rep")
                end
            end)

        elseif exercise == "Pushups" then
            isAuto.safeAutoPushups = true
            teleportToBaseplate()
            spawn(function()
                while isAuto.safeAutoPushups do
                    task.wait()
                    for _, tool in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if tool:IsA("Tool") and tool.Name == "Pushups" then
                            local humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
                            if humanoid then
                                humanoid:EquipTool(tool)
                            end
                        end
                    end
                    game.Players.LocalPlayer.muscleEvent:FireServer("rep")
                end
            end)

        elseif exercise == "Handstands" then
            isAuto.safeAutoHandstands = true
            teleportToBaseplate()
            spawn(function()
                while isAuto.safeAutoHandstands do
                    task.wait()
                    for _, tool in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if tool:IsA("Tool") and tool.Name == "Handstands" then
                            local humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
                            if humanoid then
                                humanoid:EquipTool(tool)
                            end
                        end
                    end
                    game.Players.LocalPlayer.muscleEvent:FireServer("rep")
                end
            end)

        elseif exercise == "Situps" then
            isAuto.safeAutoSitups = true
            teleportToBaseplate()
            spawn(function()
                while isAuto.safeAutoSitups do
                    task.wait()
                    for _, tool in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if tool:IsA("Tool") and tool.Name == "Situps" then
                            local humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
                            if humanoid then
                                humanoid:EquipTool(tool)
                            end
                        end
                    end
                    game.Players.LocalPlayer.muscleEvent:FireServer("rep")
                end
            end)
        end
    else

        isAuto.safeAutoWeight = false
        isAuto.safeAutoPushups = false
        isAuto.safeAutoHandstands = false
        isAuto.safeAutoSitups = false

        teleportBack()
        task.wait(0.5)
        local humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid:UnequipTools()
        end
    end
end)

Tab2:CreateSection("Beach Gym Farm")
Tab2:CreateDropdown("Choose Lift", {"Squat Rack","Bench Press","Pullups","Deadlift","Boulder Throw"}, function(cgl)
    isAuto.beachgymlift = cgl
end)

Tab2:CreateToggle("Auto Train", function(state)
    local plr = game.Players.LocalPlayer
    local leaderstats = plr:WaitForChild("leaderstats")
    local humanoidRootPart = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
    local vim = game:GetService("VirtualInputManager")

    if state then
        local lift = isAuto.beachgymlift

        if lift == "Squat Rack" then
            isAuto.autoBeachSquatRack = true
            spawn(function()
                while isAuto.autoBeachSquatRack do
                    task.wait()
                    if leaderstats.Strength.Value < 1000 then
                        isAuto.autoBeachSquatRack = false
                        DesyncedLibrary:createNotification("Not enough strength!")
                        break
                    end
                    if plr.machineInUse.Value == nil then
                        if humanoidRootPart then
                            humanoidRootPart.CFrame = CFrame.new(232.627625, 3.67689133, 96.3039856, -0.963445187, -7.78685845e-08, -0.267905563, -7.92865222e-08, 1, -5.52570167e-09, 0.267905563, 1.5917589e-08, -0.963445187)
                            vim:SendKeyEvent(true, "E", false, game)
                        end
                    end
                    plr.muscleEvent:FireServer("rep", game.Workspace.machinesFolder["Squat Rack"].interactSeat)
                end
            end)

        elseif lift == "Bench Press" then
            isAuto.autoBeachBenchPress = true
            spawn(function()
                while isAuto.autoBeachBenchPress do
                    task.wait()
                    if leaderstats.Strength.Value < 150 then
                        isAuto.autoBeachBenchPress = false
                        DesyncedLibrary:createNotification("Not enough strength!")
                        break
                    end
                    if plr.machineInUse.Value == nil then
                        if humanoidRootPart then
                            humanoidRootPart.CFrame = CFrame.new(-241.827469, 7.91391563, 346.321808, 0.811665356, -1.43794319e-08, -0.584122717, -3.94010407e-08, 1, -7.93666999e-08, 0.584122717, 8.74342447e-08, 0.811665356)
                            vim:SendKeyEvent(true, "E", false, game)
                        end
                    end
                    plr.muscleEvent:FireServer("rep", game.Workspace.machinesFolder["Bench Press"].interactSeat)
                end
            end)

        elseif lift == "Pullups" then
            isAuto.autoBeachPullups = true
            spawn(function()
                while isAuto.autoBeachPullups do
                    task.wait()
                    if leaderstats.Strength.Value < 1000 then
                        isAuto.autoBeachPullups = false
                        DesyncedLibrary:createNotification("Not enough strength!")
                        break
                    end
                    if plr.machineInUse.Value == nil then
                        if humanoidRootPart then
                            humanoidRootPart.CFrame = CFrame.new(-185.157745, 5.81071186, 104.747154, 0.227061391, -8.2363325e-09, 0.97388047, 5.58502826e-08, 1, -4.56432803e-09, -0.97388047, 5.54278827e-08, 0.227061391)
                            vim:SendKeyEvent(true, "E", false, game)
                        end
                    end
                    plr.muscleEvent:FireServer("rep", game.Workspace.machinesFolder["Legends Pullup"].interactSeat)
                end
            end)

        elseif lift == "Deadlift" then
            isAuto.autoBeachDeadlift = true
            spawn(function()
                while isAuto.autoBeachDeadlift do
                    task.wait()
                    if leaderstats.Strength.Value < 1500 then
                        isAuto.autoBeachDeadlift = false
                        DesyncedLibrary:createNotification("Not enough strength!")
                        break
                    end
                    if plr.machineInUse.Value == nil then
                        if humanoidRootPart then
                            humanoidRootPart.CFrame = CFrame.new(136.606216, 3.67689133, 97.661499, -0.974106729, -1.89495477e-08, 0.226088539, -1.78365624e-08, 1, 6.96555214e-09, -0.226088539, 2.75254886e-09, -0.974106729)
                            vim:SendKeyEvent(true, "E", false, game)
                        end
                    end
                    plr.muscleEvent:FireServer("rep", game.Workspace.machinesFolder.Deadlift.interactSeat)
                end
            end)

        elseif lift == "Boulder Throw" then
            isAuto.autoBeachBoulderThrow = true
            spawn(function()
                while isAuto.autoBeachBoulderThrow do
                    task.wait()
                    if leaderstats.Strength.Value < 3000 then
                        isAuto.autoBeachBoulderThrow = false
                        DesyncedLibrary:createNotification("Not enough strength!")
                        break
                    end
                    if plr.machineInUse.Value == nil then
                        if humanoidRootPart then
                            humanoidRootPart.CFrame = CFrame.new(-91.6730804, 3.67689133, -292.42868, -0.221022144, -2.21041621e-08, -0.975268781, 1.21414407e-08, 1, -2.54162646e-08, 0.975268781, -1.7458726e-08, -0.221022144)
                            vim:SendKeyEvent(true, "E", false, game)
                        end
                    end
                    plr.muscleEvent:FireServer("rep", game.Workspace.machinesFolder["Boulder Throw"].interactSeat)
                end
            end)
        end
    else

        isAuto.autoBeachSquatRack = false
        isAuto.autoBeachBenchPress = false
        isAuto.autoBeachPullups = false
        isAuto.autoBeachDeadlift = false
        isAuto.autoBeachBoulderThrow = false

        task.wait(0.5)
        local humanoid = plr.Character and plr.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

Tab2:CreateSection("Frost Gym Farm")

Tab2:CreateDropdown("Choose Lift", {"Squat Rack", "Bench Press", "Deadlift"}, function(cgl)
    isAuto.frostgymlift = cgl
end)

Tab2:CreateToggle("Auto Train", function(state)
    local player = game.Players.LocalPlayer
    local vim = game:GetService("VirtualInputManager")

    if state then
        if isAuto.frostgymlift == "Squat Rack" then
            isAuto.autoFrostSquatRack = true
            task.spawn(function()
                while isAuto.autoFrostSquatRack do
                    task.wait()
                    if not isAuto.autoFrostSquatRack then break end
                    if player.leaderstats.Strength.Value < 4000 then
                        isAuto.autoFrostSquatRack = false
                        DesyncedLibrary:createNotification("Not enough strength!")
                        break
                    end
                    if player.machineInUse.Value == nil then
                        local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            hrp.CFrame = CFrame.new(-2629.13818, 3.36860609, -609.827454, -0.995664716, -2.67296816e-08, -0.0930150598, -1.90042453e-08, 1, -8.39415222e-08, 0.0930150598, -8.18099295e-08, -0.995664716)
                        end
                        vim:SendKeyEvent(true, "E", false, game)
                    end
                    player.muscleEvent:FireServer("rep", workspace.machinesFolder["Squat Rack"].interactSeat)
                end
            end)

        elseif isAuto.frostgymlift == "Bench Press" then
            isAuto.autoFrostBenchPress = true
            task.spawn(function()
                while isAuto.autoFrostBenchPress do
                    task.wait()
                    if not isAuto.autoFrostBenchPress then break end
                    if player.leaderstats.Strength.Value < 7500 then
                        isAuto.autoFrostBenchPress = false
                        DesyncedLibrary:createNotification("Not enough strength!")
                        break
                    end
                    if player.machineInUse.Value == nil then
                        local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            hrp.CFrame = CFrame.new(-3020.7019, 32.5691414, -194.773117, 0.924556971, 2.05821564e-08, 0.381043822, -3.5507064e-08, 1, 3.21384199e-08, -0.381043822, -4.32435456e-08, 0.924556971)
                        end
                        vim:SendKeyEvent(true, "E", false, game)
                    end
                    player.muscleEvent:FireServer("rep", workspace.machinesFolder["Bench Press"].interactSeat)
                end
            end)

        elseif isAuto.frostgymlift == "Deadlift" then
            isAuto.autoFrostDeadlift = true
            task.spawn(function()
                while isAuto.autoFrostDeadlift do
                    task.wait()
                    if not isAuto.autoFrostDeadlift then break end
                    if player.leaderstats.Strength.Value < 5000 then
                        isAuto.autoFrostDeadlift = false
                        DesyncedLibrary:createNotification("Not enough strength!")
                        break
                    end
                    if player.machineInUse.Value == nil then
                        local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            hrp.CFrame = CFrame.new(-2916.11572, 3.67689204, -212.97438, -0.241641939, -6.10995343e-08, 0.970365465, 6.65890596e-08, 1, 7.9547597e-08, -0.970365465, 8.38377616e-08, -0.241641939)
                        end
                        vim:SendKeyEvent(true, "E", false, game)
                    end
                    player.muscleEvent:FireServer("rep", workspace.machinesFolder.Deadlift.interactSeat)
                end
            end)
        end
    else
        isAuto.autoFrostSquatRack = false
        isAuto.autoFrostBenchPress = false
        isAuto.autoFrostDeadlift = false
        task.wait(0.5)
        local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

Tab2:CreateSection("Mythical Gym Farm")

Tab2:CreateDropdown("Choose Lift", {"Pullups","Bench Press","Boulder Throw"}, function(selected)
    isAuto.mythicalgymlift = selected
end)

Tab2:CreateToggle("Auto Train", function(state)
    local player = game.Players.LocalPlayer
    local vim = game:GetService("VirtualInputManager")

    if state then
        if isAuto.mythicalgymlift == "Pullups" then
            isAuto.autoMythicalPullups = true
            task.spawn(function()
                while isAuto.autoMythicalPullups do
                    task.wait()
                    if not isAuto.autoMythicalPullups then break end
                    if player.leaderstats.Strength.Value < 4000 then
                        isAuto.autoMythicalPullups = false
                        DesyncedLibrary:createNotification("Not enough strength!")
                        break
                    end
                    if player.machineInUse.Value == nil then
                        local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            hrp.CFrame = CFrame.new(2315.82104, 5.81071281, 847.153076, 0.993555248, 6.99809632e-08, 0.113349125, -7.05298859e-08, 1, 8.32554692e-10, -0.113349125, -8.82168916e-09, 0.993555248)
                        end
                        vim:SendKeyEvent(true, "E", false, game)
                    end
                    player.muscleEvent:FireServer("rep", workspace.machinesFolder["Legends Pullup"].interactSeat)
                end
            end)

        elseif isAuto.mythicalgymlift == "Bench Press" then
            isAuto.autoMythicalBenchPress = true
            task.spawn(function()
                while isAuto.autoMythicalBenchPress do
                    task.wait()
                    if not isAuto.autoMythicalBenchPress then break end
                    if player.leaderstats.Strength.Value < 15000 then
                        isAuto.autoMythicalBenchPress = false
                        DesyncedLibrary:createNotification("Not enough strength!")
                        break
                    end
                    if player.machineInUse.Value == nil then
                        local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            hrp.CFrame = CFrame.new(2363.95483, 42.2141037, 1243.50562, -0.944882751, 2.18911698e-08, 0.32740894, 4.06544087e-09, 1, -5.51292381e-08, -0.32740894, -5.07596027e-08, -0.944882751)
                        end
                        vim:SendKeyEvent(true, "E", false, game)
                    end
                    player.muscleEvent:FireServer("rep", workspace.machinesFolder["Bench Press"].interactSeat)
                end
            end)

        elseif isAuto.mythicalgymlift == "Boulder Throw" then
            isAuto.autoMythicalBoulderThrow = true
            task.spawn(function()
                while isAuto.autoMythicalBoulderThrow do
                    task.wait()
                    if not isAuto.autoMythicalBoulderThrow then break end
                    if player.leaderstats.Strength.Value < 10000 then
                        isAuto.autoMythicalBoulderThrow = false
                        DesyncedLibrary:createNotification("Not enough strength!")
                        break
                    end
                    if player.machineInUse.Value == nil then
                        local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            hrp.CFrame = CFrame.new(2486.01733, 3.67689276, 1237.89331, 0.883595645, -2.06135038e-08, -0.468250751, -3.3286871e-09, 1, -5.03036404e-08, 0.468250751, 4.60067362e-08, 0.883595645)
                        end
                        vim:SendKeyEvent(true, "E", false, game)
                    end
                    player.muscleEvent:FireServer("rep", workspace.machinesFolder.Deadlift.interactSeat)
                end
            end)
        end
    else
        isAuto.autoMythicalPullups = false
        isAuto.autoMythicalBenchPress = false
        isAuto.autoMythicalBoulderThrow = false
        task.wait(0.5)
        local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

Tab2:CreateSection("Eternal Gym Farm")

Tab2:CreateDropdown("Choose Lift", {"Bench Press"}, function(selected)
    isAuto.eternalgymlift = selected
end)

Tab2:CreateToggle("Auto Train", function(state)
    local player = game.Players.LocalPlayer
    local vim = game:GetService("VirtualInputManager")

    if state then
        if isAuto.eternalgymlift == "Bench Press" then
            isAuto.autoEternalBenchPress = true
            task.spawn(function()
                while isAuto.autoEternalBenchPress do
                    task.wait()
                    if player.leaderstats.Strength.Value < 15000 then
                        isAuto.autoEternalBenchPress = false
                        DesyncedLibrary:createNotification("Not enough strength!")
                        break
                    end

                    if player.machineInUse.Value == nil then
                        local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            hrp.CFrame = CFrame.new(-7172.77002, 48.3923645, -1105.06018, -0.972435296, -4.87620122e-09, 0.233172983, -2.76572942e-09, 1, 9.37805122e-09, -0.233172983, 8.47465476e-09, -0.972435296)
                        end
                        vim:SendKeyEvent(true, "E", false, game)
                    end

                    player.muscleEvent:FireServer("rep", workspace.machinesFolder["Bench Press"].interactSeat)
                end
            end)
        end
    else
        isAuto.autoEternalBenchPress = false
        task.wait(0.5)
        local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

Tab2:CreateSection("Legend Gym Farm")

Tab2:CreateDropdown("Choose Lift", {"Pullups", "Squat Rack", "Bench Press", "Deadlift", "Boulder Throw"}, function(cgl)
    isAuto.legendgymlift = cgl
end)

Tab2:CreateToggle("Auto Train", function(state)
    local player = game.Players.LocalPlayer
    local hrp = player.Character:WaitForChild("HumanoidRootPart")
    local vim = game:GetService("VirtualInputManager")
    local lift = isAuto.legendgymlift

    if state then
        if lift == "Pullups" then
            isAuto.autoLegendPullups = true
            task.spawn(function()
                while isAuto.autoLegendPullups do
                    task.wait()
                    if player.machineInUse.Value == nil then
                        hrp.CFrame = CFrame.new(4305.08203, 989.963623, -4118.44873, -0.953815758, -7.58e-08, -0.30039227, -8.99e-08, 1, 3.31e-08, 0.30039227, 5.85e-08, -0.953815758)
                        vim:SendKeyEvent(true, "E", false, game)
                    end
                    player.muscleEvent:FireServer("rep", workspace.machinesFolder["Legends Pullup"].interactSeat)
                end
            end)

        elseif lift == "Squat Rack" then
            isAuto.autoLegendSquatRack = true
            task.spawn(function()
                while isAuto.autoLegendSquatRack do
                    task.wait()
                    if player.machineInUse.Value == nil then
                        hrp.CFrame = CFrame.new(4443.04443, 987.521484, -4061.12988, 0.83309716, 0, 0.553126693, 0, 1, 0, -0.553126693, 0, 0.83309716)
                        vim:SendKeyEvent(true, "E", false, game)
                    end
                    player.muscleEvent:FireServer("rep", workspace.machinesFolder["Squat Rack"].interactSeat)
                end
            end)

        elseif lift == "Bench Press" then
            isAuto.autoLegendBenchPress = true
            task.spawn(function()
                while isAuto.autoLegendBenchPress do
                    task.wait()
                    if player.machineInUse.Value == nil then
                        hrp.CFrame = CFrame.new(4109.81152, 1024.02734, -3800.75122, 0.446250677, -7.45e-08, -0.894908011, 0, 1, -8.42e-08, 0.894908011, 3.93e-08, 0.446250677)
                        vim:SendKeyEvent(true, "E", false, game)
                    end
                    player.muscleEvent:FireServer("rep", workspace.machinesFolder["Bench Press"].interactSeat)
                end
            end)

        elseif lift == "Deadlift" then
            isAuto.autoLegendDeadlift = true
            task.spawn(function()
                while isAuto.autoLegendDeadlift do
                    task.wait()
                    if player.machineInUse.Value == nil then
                        hrp.CFrame = CFrame.new(4538.42627, 987.829834, -4008.82007, -0.830109239, 2.21e-08, 0.557600796, 8.02e-08, 1, 7.97e-08, -0.557600796, 1.11e-07, -0.830109239)
                        vim:SendKeyEvent(true, "E", false, game)
                    end
                    player.muscleEvent:FireServer("rep", workspace.machinesFolder["Deadlift"].interactSeat)
                end
            end)

        elseif lift == "Boulder Throw" then
            isAuto.autoLegendBoulderThrow = true
            task.spawn(function()
                while isAuto.autoLegendBoulderThrow do
                    task.wait()
                    if player.machineInUse.Value == nil then
                        hrp.CFrame = CFrame.new(4189.96143, 987.829773, -3903.0166, 0.422592968, 0, 0.906319559, 0, 1, 0, -0.906319559, 0, 0.422592968)
                        vim:SendKeyEvent(true, "E", false, game)
                    end
                    player.muscleEvent:FireServer("rep", workspace.machinesFolder["Boulder Throw"].interactSeat)
                end
            end)
        end

    else

        isAuto.autoLegendPullups = false
        isAuto.autoLegendSquatRack = false
        isAuto.autoLegendBenchPress = false
        isAuto.autoLegendDeadlift = false
        isAuto.autoLegendBoulderThrow = false

        task.wait(0.5)
        player.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

Tab2:CreateSection("Muscle King Gym Farm")
Tab2:CreateDropdown("Choose Lift", {"Squat Rack", "Bench Press", "Deadlift", "Boulder Throw"}, function(cgl)
    isAuto.musclekinggymlift = cgl
end)

Tab2:CreateToggle("Auto Train", function(state)
    local player = game.Players.LocalPlayer
    local hrp = player.Character:WaitForChild("HumanoidRootPart")
    local vim = game:GetService("VirtualInputManager")
    local lift = isAuto.musclekinggymlift

    if state then
        if lift == "Squat Rack" then
            isAuto.autoMuscleKingSquatRack = true
            task.spawn(function()
                while isAuto.autoMuscleKingSquatRack do
                    task.wait()
                    if player.machineInUse.Value == nil then
                        hrp.CFrame = CFrame.new(-8757.37012, 13.2186356, -6051.24365)
                        vim:SendKeyEvent(true, "E", false, game)
                    end
                    player.muscleEvent:FireServer("rep", workspace.machinesFolder["Squat Rack"].interactSeat)
                end
            end)

        elseif lift == "Bench Press" then
            isAuto.autoMuscleKingBenchPress = true
            task.spawn(function()
                while isAuto.autoMuscleKingBenchPress do
                    task.wait()
                    if player.machineInUse.Value == nil then
                        hrp.CFrame = CFrame.new(-8592.99805, 49.1056519, -6042.80322)
                        vim:SendKeyEvent(true, "E", false, game)
                    end
                    player.muscleEvent:FireServer("rep", workspace.machinesFolder["Bench Press"].interactSeat)
                end
            end)

        elseif lift == "Deadlift" then
            isAuto.autoMuscleKingDeadlift = true
            task.spawn(function()
                while isAuto.autoMuscleKingDeadlift do
                    task.wait()
                    if player.machineInUse.Value == nil then
                        hrp.CFrame = CFrame.new(-8768.4375, 13.5269203, -5681.62256)
                        vim:SendKeyEvent(true, "E", false, game)
                    end
                    player.muscleEvent:FireServer("rep", workspace.machinesFolder["Deadlift"].interactSeat)
                end
            end)

        elseif lift == "Boulder Throw" then
            isAuto.autoMuscleKingBoulder = true
            task.spawn(function()
                while isAuto.autoMuscleKingBoulder do
                    task.wait()
                    if player.machineInUse.Value == nil then
                        hrp.CFrame = CFrame.new(-8946.12402, 20.8987751, -5701.57861)
                        vim:SendKeyEvent(true, "E", false, game)
                    end
                    player.muscleEvent:FireServer("rep", workspace.machinesFolder["Boulder Throw"].interactSeat)
                end
            end)
        end

    else

        isAuto.autoMuscleKingSquatRack = false
        isAuto.autoMuscleKingBenchPress = false
        isAuto.autoMuscleKingDeadlift = false
        isAuto.autoMuscleKingBoulder = false

        task.wait(0.5)
        player.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

Tab2:CreateSection("Jungle Gym Farm")

Tab2:CreateDropdown("Choose Lift", {"Bench Press", "Deadlift", "Squat Rack", "Boulder Throw"}, function(cgl)
    isAuto.junglegymlift = cgl
end)

Tab2:CreateToggle("Auto Train", function(state)
    local player = game.Players.LocalPlayer
    local leaderstats = player:WaitForChild("leaderstats")
    local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    local vim = game:GetService("VirtualInputManager")
    local lift = isAuto.junglegymlift

    if state then
        if lift == "Bench Press" then
            isAuto.autoJungleBenchPress = true
            task.spawn(function()
                while isAuto.autoJungleBenchPress do
                    task.wait()
                    if leaderstats.Strength.Value < 100000 then
                        isAuto.autoJungleBenchPress = false
                        DesyncedLibrary:createNotification("Not enough strength!")
                        break
                    end
                    if player.machineInUse.Value == nil then
                        if hrp then
                            hrp.CFrame = CFrame.new(-8178, 66, 1929)
                            vim:SendKeyEvent(true, "E", false, game)
                        end
                    end
                    player.muscleEvent:FireServer("rep", workspace.machinesFolder["Jungle Bench"].interactSeat)
                end
            end)

        elseif lift == "Deadlift" then
            isAuto.autoJungleDeadlift = true
            task.spawn(function()
                while isAuto.autoJungleDeadlift do
                    task.wait()
                    if leaderstats.Strength.Value < 100000 then
                        isAuto.autoJungleDeadlift = false
                        DesyncedLibrary:createNotification("Not enough strength!")
                        break
                    end
                    if player.machineInUse.Value == nil then
                        if hrp then
                            hrp.CFrame = CFrame.new(-8658, 9, 2085)
                            vim:SendKeyEvent(true, "E", false, game)
                        end
                    end
                    player.muscleEvent:FireServer("rep", workspace.machinesFolder["Jungle Bar Lift"].interactSeat)
                end
            end)

        elseif lift == "Squat Rack" then
            isAuto.autoJungleSquatRack = true
            task.spawn(function()
                while isAuto.autoJungleSquatRack do
                    task.wait()
                    if leaderstats.Strength.Value < 125000 then
                        isAuto.autoJungleSquatRack = false
                        DesyncedLibrary:createNotification("Not enough strength!")
                        break
                    end
                    if player.machineInUse.Value == nil then
                        if hrp then
                            hrp.CFrame = CFrame.new(-8391, 9, 2911)
                            vim:SendKeyEvent(true, "E", false, game)
                        end
                    end
                    player.muscleEvent:FireServer("rep", workspace.machinesFolder["Jungle Squat"].interactSeat)
                end
            end)

        elseif lift == "Boulder Throw" then
            isAuto.autoJungleBoulderThrow = true
            task.spawn(function()
                while isAuto.autoJungleBoulderThrow do
                    task.wait()
                    if leaderstats.Strength.Value < 75000 then
                        isAuto.autoJungleBoulderThrow = false
                        DesyncedLibrary:createNotification("Not enough strength!")
                        break
                    end
                    if player.machineInUse.Value == nil then
                        if hrp then
                            hrp.CFrame = CFrame.new(-8612, 9, 2685)
                            vim:SendKeyEvent(true, "E", false, game)
                        end
                    end
                    player.muscleEvent:FireServer("rep", workspace.machinesFolder["Jungle Boulder"].interactSeat)
                end
            end)
        end

    else

        isAuto.autoJungleBenchPress = false
        isAuto.autoJungleDeadlift = false
        isAuto.autoJungleSquatRack = false
        isAuto.autoJungleBoulderThrow = false

        task.wait(0.5)
        local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

Tab3:CreateSection("Durability Rock Farm")

local durabilityPositions = {
    ["0 Durability"] = CFrame.new(7.60643005, 4.02632904, 2104.54004, -0.23040159, -8.53662385e-08, -0.973095655, -4.68743764e-08, 1, -7.66279342e-08, 0.973095655, 2.79580536e-08, -0.23040159),
    ["10 Durability"] = CFrame.new(-157.680908, 3.72453046, 434.871185, 0.923298299, -1.81774684e-09, -0.384083599, 3.45247031e-09, 1, 3.56670582e-09, 0.384083599, -4.61917082e-09, 0.923298299),
    ["100 Durability"] = CFrame.new(162.233673, 3.66615629, -164.686783, -0.921312928, -1.80826774e-07, -0.38882193, -9.13036544e-08, 1, -2.48719346e-07, 0.38882193, -1.93647494e-07, -0.921312928),
    ["5K Durability"] = CFrame.new(329.831482, 3.66450214, -618.48407, -0.806075394, -8.67358096e-08, 0.591812849, -1.05715522e-07, 1, 2.57029176e-09, -0.591812849, -6.04919563e-08, -0.806075394),
    ["150K Durability"] = CFrame.new(-2566.78076, 3.97019577, -277.503235, -0.923934579, -4.11600105e-08, -0.382550538, -3.38838042e-08, 1, -2.57576183e-08, 0.382550538, -1.08360858e-08, -0.923934579),
    ["400K Durability"] = CFrame.new(2155.61743, 3.79830337, 1227.06482, -0.551303148, -9.16796949e-09, -0.834304988, -5.61318245e-08, 1, 2.61027839e-08, 0.834304988, 6.12216127e-08, -0.551303148),
    ["750K Durability"] = CFrame.new(-7285.6499, 3.66624784, -1228.27417, 0.857643783, -1.58175091e-08, -0.514244199, -1.22581563e-08, 1, -5.12025977e-08, 0.514244199, 5.02172774e-08, 0.857643783),
    ["1M Durability"] = CFrame.new(4160.87109, 987.829102, -4136.64502, -0.893115997, 1.25481356e-05, 0.44982639, 5.02490684e-06, 1, -1.79187136e-05, -0.44982639, -1.37431543e-05, -0.893115997),
    ["5M Durability"] = CFrame.new(-8957.54395, 5.53625107, -6126.90186, -0.803919137, 6.6065212e-08, 0.594738603, -8.93136143e-09, 1, -1.23155459e-07, -0.594738603, -1.04318865e-07, -0.803919137),
    ["10M Durability"] = CFrame.new(-7635.83447, 0.416887641, 3006.15771, 0.996477842, -4.34402949e-08, -0.083856754, 3.73304054e-08, 1, -7.44290034e-08, 0.083856754, 7.10364461e-08, 0.996477842)
}

Tab3:CreateDropdown("Choose Durability", {
    "0 Durability",
    "10 Durability",
    "100 Durability",
    "5K Durability",
    "150K Durability",
    "400K Durability",
    "750K Durability",
    "1M Durability",
    "5M Durability",
    "10M Durability"
}, function(choice)
    isAuto.selectedDurability = choice
end)

Tab3:CreateToggle("Auto Hit Rocks", function(state)
    isAuto.autoDurabilityFarm = state
    if state and isAuto.selectedDurability then
        spawn(function()
            while isAuto.autoDurabilityFarm do
                wait()
                local humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
                local humanoidRootPart = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if humanoid and humanoidRootPart then
                    for _, tool in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if tool:IsA("Tool") and tool.Name == "Punch" then
                            humanoid:EquipTool(tool)
                        end
                    end
                    for _, tool in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                        if tool:IsA("Tool") and tool.Name == "Punch" then
                            tool:Activate()
                        end
                    end
                    local targetCFrame = durabilityPositions[isAuto.selectedDurability]
                    if targetCFrame then
                        humanoidRootPart.CFrame = targetCFrame
                    end
                end
            end
            if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
            end
        end)
    else
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
        end
    end
end)

local function createPetHatchSection(tab, sectionName, petList, selectionVarName, toggleVarName)
    tab:CreateSection(sectionName)

    _G[selectionVarName] = petList[1]
    _G[toggleVarName] = false

    tab:CreateDropdown("Select Pet", petList, function(input)
        _G[selectionVarName] = input
    end)

    tab:CreateToggle("Auto Hatch", function(state)
        _G[toggleVarName] = state
        if state then
            spawn(function()
                while _G[toggleVarName] do
                    local pet = _G[selectionVarName]
                    if pet then
                        local args = {
                            game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(pet)
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
                    end
                    wait()
                end
            end)
        end
    end)
end

createPetHatchSection(Tab4, "Hatch Basic Pets", {
    "Blue Birdie", "Orange Hedgehog", "Red Kitty", "Blue Bunny"
}, "selectedbasicpettohatch_Tab4", "hatchBasicPets_Tab4")

createPetHatchSection(Tab4, "Hatch Advanced Pets", {
    "Dark Vampy", "Yellow Butterfly"
}, "selectedadvancedpettohatch_Tab4", "hatchAdvancedPets_Tab4")

createPetHatchSection(Tab4, "Hatch Rare Pets", {
    "Purple Falcon", "Red Dragon", "White Pegasus", "Purple Dragon", "Orange Pegasus",
    "Frostwave Legends Pinguin", "Phantom Genesis Dragon", "Eternal Strike Leviathan"
}, "selectedrarepettohatch_Tab4", "hatchRarePets_Tab4")

createPetHatchSection(Tab4, "Hatch Epic Pets", {
    "Blue Firecaster", "Golden Pheonix", "Red Firecaster", "Blue Pheonix", "Dark Legends Manticore"
}, "selectedepicpettohatch_Tab4", "hatchEpicPets_Tab4")

createPetHatchSection(Tab4, "Hatch Unique Pets", {
    "Aether Spirit Bunny", "Cybernetic Showdown Dragon", "Infernal Dragon", "Darkstar Hunter", "Muscle Sensei", "Neon Guardian"
}, "selecteduniquepettohatch_Tab4", "hatchUnqiuePets_Tab4")

local function createPetEvolveSection(tab, sectionName, petList, selectionVarName, toggleVarName)
    tab:CreateSection(sectionName)

    _G[selectionVarName] = petList[1]
    _G[toggleVarName] = false

    tab:CreateDropdown("Select Pet to Evolve", petList, function(input)
        _G[selectionVarName] = input
    end)

    tab:CreateToggle("Auto Evolve", function(state)
        _G[toggleVarName] = state
        if state then
            spawn(function()
                while _G[toggleVarName] do
                    local pet = _G[selectionVarName]
                    if pet then
                        local args = {
                            "evolvePet",
                            pet
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("petEvolveEvent"):FireServer(unpack(args))
                    end
                    wait()
                end
            end)
        end
    end)
end

createPetEvolveSection(Tab5, "Evolve Basic Pets", {
    "Blue Birdie", "Orange Hedgehog", "Red Kitty", "Blue Bunny"
}, "selectedbasicpettoevolve_Tab5", "evolveBasicPets_Tab5")

createPetEvolveSection(Tab5, "Evolve Advanced Pets", {
    "Dark Vampy", "Yellow Butterfly"
}, "selectedadvancedpettoevolve_Tab5", "evolveAdvancedPets_Tab5")

createPetEvolveSection(Tab5, "Evolve Rare Pets", {
    "Purple Falcon", "Red Dragon", "White Pegasus", "Purple Dragon", "Orange Pegasus",
    "Frostwave Legends Pinguin", "Phantom Genesis Dragon", "Eternal Strike Leviathan"
}, "selectedrarepettoevolve_Tab5", "evolveRarePets_Tab5")

createPetEvolveSection(Tab5, "Evolve Epic Pets", {
    "Blue Firecaster", "Golden Pheonix", "Red Firecaster", "Blue Pheonix", "Dark Legends Manticore"
}, "selectedepicpettoevolve_Tab5", "evolveEpicPets_Tab5")

createPetEvolveSection(Tab5, "Evolve Unique Pets", {
    "Aether Spirit Bunny", "Cybernetic Showdown Dragon", "Infernal Dragon", "Darkstar Hunter", "Muscle Sensei", "Neon Guardian"
}, "selecteduniquepettoevolve_Tab5", "evolveUniquePets_Tab5")

if Tab6 then

    local function createCrystalSection(tab, sectionName, crystalList, selectionVarName, toggleVarName)
        tab:CreateSection(sectionName)

        _G[selectionVarName] = crystalList[1]
        _G[toggleVarName] = false

        tab:CreateDropdown("Select Crystal", crystalList, function(input)
            _G[selectionVarName] = input
        end)

        tab:CreateToggle("Auto Open", function(state)
            _G[toggleVarName] = state
            if state then
                spawn(function()
                    while _G[toggleVarName] do
                        local crystal = _G[selectionVarName]
                        if crystal then
                            local args = {
                                [1] = "openCrystal",
                                [2] = crystal
                            }
                            game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("openCrystalRemote"):InvokeServer(unpack(args))
                        end
                        wait()
                    end
                end)
            end
        end)
    end

    local tab6Crystals = {
        "Blue Crystal", "Green Crystal", "Mythical Crystal", "Frost Crystal", "Inferno Crystal",
        "Legends Crystal", "Muscle Elite Crystal", "Galaxy Oracle Crystal", "Jungle Crystal"
    }

    createCrystalSection(Tab6, "Crystals", tab6Crystals, "selectedCrystal_Tab6", "autoOpenCrystal_Tab6")
end

if Tab7 then
    local function createAuraSection(tab, sectionName, auraList)
        tab:CreateSection("Hatch " .. sectionName .. " Aura's")

        for _, auraName in ipairs(auraList) do
            local toggleStateName = "_G.toggleAura_" .. auraName:gsub("%s+", "")
            _G[toggleStateName] = false

            tab:CreateToggle(auraName, function(state)
                _G[toggleStateName] = state
                if state then
                    spawn(function()
                        while _G[toggleStateName] do
                            wait()
                            local args = {
                                game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild(auraName)
                            }
                            game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args))
                        end
                    end)
                end
            end)
        end
    end

    createAuraSection(Tab7, "Basic", {
        "Yellow Aura", "Purple Aura", "Green Aura", "Blue Aura", "Red Aura"
    })

    createAuraSection(Tab7, "Advanced", {
        "Electro", "Purple Nova"
    })

    createAuraSection(Tab7, "Rare", {
        "Astral Electro", "Dark Electro", "Supernova", "Power Lightning", "Ultra Inferno", "Ultra Mirage"
    })

    createAuraSection(Tab7, "Epic", {
        "Enchanted Mirage", "Unstable Mirage", "Lightning", "Azure Tundra", "Grand Supernova Aura"
    })

    createAuraSection(Tab7, "Unique", {
        "Inferno", "Dark Storm", "Dark Lightning", "Muscle King", "Eternal Megastrike Aura", "Entropic Blast Aura"
    })
end

Tab8:CreateLabel("You will lose rebirths by using these upgrades!")
    Tab8:CreateSection("Game Upgrades")
    Tab8:CreateButton("+5% Rep Speed",function()
        local args = {
            [1] = "upgradeUltimate",
            [2] = "+5% Rep Speed"
        }

        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("ultimatesRemote"):InvokeServer(unpack(args))
    end)
    Tab8:CreateButton("+1 Pet Slot",function()
        local args = {
            [1] = "upgradeUltimate",
            [2] = "+1 Pet Slot"
        }

        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("ultimatesRemote"):InvokeServer(unpack(args))
    end)
    Tab8:CreateButton("+10 Item Capacity",function()
        local args = {
            [1] = "upgradeUltimate",
            [2] = "+10 Item Capacity"
        }

        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("ultimatesRemote"):InvokeServer(unpack(args))
    end)
    Tab8:CreateButton("+1 Daily Spin",function()
        local args = {
            [1] = "upgradeUltimate",
            [2] = "+1 Daily Spin"
        }

        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("ultimatesRemote"):InvokeServer(unpack(args))
    end)
    Tab8:CreateButton("x2 Chest Rewards",function()
        local args = {
            [1] = "upgradeUltimate",
            [2] = "x2 Chest Rewards"
        }

        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("ultimatesRemote"):InvokeServer(unpack(args))
    end)
    Tab8:CreateButton("x2 Quest Rewards",function()
        local args = {
            [1] = "upgradeUltimate",
            [2] = "x2 Quest Rewards"
        }

        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("ultimatesRemote"):InvokeServer(unpack(args))
    end)

    Tab8:CreateSection("Enhancements")
    Tab8:CreateButton("Muscle Mind",function()
        local args = {
            [1] = "upgradeUltimate",
            [2] = "Muscle Mind"
        }

        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("ultimatesRemote"):InvokeServer(unpack(args))
    end)
    Tab8:CreateButton("Jungle Swift",function()
        local args = {
            [1] = "upgradeUltimate",
            [2] = "Jungle Swift"
        }

        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("ultimatesRemote"):InvokeServer(unpack(args))
    end)
    Tab8:CreateButton("Infernal Health",function()
        local args = {
            [1] = "upgradeUltimate",
            [2] = "Infernal Health"
        }

        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("ultimatesRemote"):InvokeServer(unpack(args))
    end)
    Tab8:CreateButton("Galaxy Gains",function()
        local args = {
            [1] = "upgradeUltimate",
            [2] = "Galaxy Gains"
        }

        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("ultimatesRemote"):InvokeServer(unpack(args))
    end)
    Tab8:CreateButton("Demon Damage",function()
        local args = {
            [1] = "upgradeUltimate",
            [2] = "Demon Damage"
        }

        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("ultimatesRemote"):InvokeServer(unpack(args))
    end)
    Tab8:CreateButton("Golden Rebirth",function()
        local args = {
            [1] = "upgradeUltimate",
            [2] = "Golden Rebirth"
        }

        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("ultimatesRemote"):InvokeServer(unpack(args))
    end)

Tab9:CreateSection("Main Teleports")
local mainLocations = {
    ["Beach Gym"] = CFrame.new(-57.1439056, 7.38249874, 311.925446, 0.998239815, 1.62942975e-08, -0.0593064278, -1.64620033e-08, 1, -2.33921171e-09, 0.0593064278, 3.31139693e-09, 0.998239815),
    ["Tiny Gym"] = CFrame.new(-36.9063606, 7.53582478, 1879.46631, -0.997119308, 5.31786242e-08, 0.0758490562, 5.21852961e-08, 1, -1.50780437e-08, -0.0758490562, -1.10764029e-08, -0.997119308),
    ["Frost Gym"] = CFrame.new(-2623.02222, 7.38249826, -409.073334, 3.98158673e-10, 5.45164192e-10, 1, 1.87618454e-09, 1, -5.45164192e-10, -1, 1.87618454e-09, 3.98158673e-10),
    ["Mythical Gym"] = CFrame.new(2250.77808, 7.38249826, 1073.22668, -1.64267142e-11, 1.70486025e-08, -1, 2.15084892e-08, 1, 1.70486025e-08, 1, -2.15084892e-08, -1.64270802e-11),
    ["Eternal Gym"] = CFrame.new(-6758.96387, 7.38251305, -1284.9187, -7.71708114e-11, 4.81217057e-08, 1, -7.21120452e-09, 1, -4.81217057e-08, -1, -7.21120452e-09, -7.71704645e-11),
    ["Legends Gym"] = CFrame.new(4603.28174, 991.560547, -3897.86572, -0.173624292, -8.37344416e-08, 0.984811962, 1.40068535e-08, 1, 8.7495259e-08, -0.984811962, 2.89854185e-08, -0.173624292),
    ["Muscle King"] = CFrame.new(-8625.93164, 17.2325287, -5730.47314, 0.765763402, 1.55031827e-08, 0.643122375, 1.08738378e-08, 1, -3.70535567e-08, -0.643122375, 3.53674672e-08, 0.765763402),
    ["Jungle Gym"] = CFrame.new(-8691, 9, 2390)
}
local mainOrder = {
    "Beach Gym", "Tiny Gym", "Frost Gym", "Mythical Gym",
    "Eternal Gym", "Legends Gym", "Muscle King", "Jungle Gym"
}
Tab9:CreateDropdown("Select Main Location", mainOrder, function(loc)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = mainLocations[loc]
end)

Tab9:CreateSection("Other Teleports")
local otherLocations = {
    ["Boxing Ring"] = CFrame.new(-1839.30945, 103.632477, -5878.37451, 0.99926281, -1.95332195e-08, 0.0383901037, 1.7886963e-08, 1, 4.32257785e-08, -0.0383901037, -4.25072315e-08, 0.99926281),
    ["Desert Ring"] = CFrame.new(941.311462, 103.632477, -6997.45508, 0.986855686, -7.73859128e-08, 0.161603943, 8.39755572e-08, 1, -3.39462183e-08, -0.161603943, 4.70707988e-08, 0.986855686),
    ["Magma Ring"] = CFrame.new(4442.30273, 103.632492, -8401.64453, 0.999876678, 7.90023691e-09, 0.0157060623, -7.82622678e-09, 1, -4.77366058e-09, -0.0157060623, 4.65015271e-09, 0.999876678)
}
local otherOrder = { "Boxing Ring", "Desert Ring", "Magma Ring" }
Tab9:CreateDropdown("Select Other Location", otherOrder, function(loc)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = otherLocations[loc]
end)

    Tab9:CreateSection("Server Teleports")
    local serverOptions = {
        ["Lowest Player Count"] = LowestPlayer,
        ["Server Hop"] = Serverhop,
        ["Rejoin"] = Rejoin
    }
    local serverOrder = { "Lowest Player Count", "Server Hop", "Rejoin" }
    Tab9:CreateDropdown("Server Options", serverOrder, function(choice)
        serverOptions[choice]()
    end)

Tab90:CreateSection("Rebirth Farming")

Tab90:CreateBox("Rebirth Cooldown", function(input)
    isAuto.rebirthCooldown = tonumber(input) or 0.2
end)

Tab90:CreateToggle("Auto Rebirth", function(state)
    isAuto.rebirth = state
    if state then
        spawn(function()
            while isAuto.rebirth do
                pcall(function()
                    ReplicatedStorage.rEvents.rebirthRemote:InvokeServer("rebirthRequest")
                end)
                task.wait(isAuto.rebirthCooldown)
            end
        end)
    end
end)

Tab90:CreateSection("Targeted Rebirth Farming")

Tab90:CreateBox("Rebirth Target Amount", function(input)
    isAuto.rebirthTargetAmount = tonumber(input) or 0
    DesyncedLibrary:createNotification("Rebirth target set to " .. isAuto.rebirthTargetAmount)
end)

Tab90:CreateBox("Target Rebirth Cooldown", function(input)
    isAuto.rebirthTargetCooldown = tonumber(input) or 0.2
end)

Tab90:CreateToggle("Targeted Auto Rebirth", function(state)
    isAuto.rebirthTarget = state
    if state then
        spawn(function()
            while isAuto.rebirthTarget do
                local success = pcall(function()
                    local leaderstats = player:FindFirstChild("leaderstats")
                    local rebirths = leaderstats and leaderstats:FindFirstChild("Rebirths")
                    if not rebirths then return end

                    local before = rebirths.Value
                    ReplicatedStorage.rEvents.rebirthRemote:InvokeServer("rebirthRequest")
                    task.wait(isAuto.rebirthTargetCooldown)
                    local after = rebirths.Value

                    if after >= isAuto.rebirthTargetAmount then
                        DesyncedLibrary:createNotification("Reached rebirth target!")
                        isAuto.rebirthTarget = false
                    end
                end)

                if not success then
                    isAuto.rebirthTarget = false
                end
            end
        end)
    else
        isAuto.rebirthTarget = false
    end
end)

Tab10:CreateSection("General Settings")
Tab10:CreateToggle("Anti-Idle Protection", function(state)
    if state then
        antiKickConnection = game:GetService("Players").LocalPlayer.Idled:Connect(function()
            local vu = game:GetService("VirtualUser")
            vu:CaptureController()
            vu:ClickButton2(Vector2.new())
        end)
    elseif antiKickConnection then
        antiKickConnection:Disconnect()
        antiKickConnection = nil
    end
end)
Tab10:CreateToggle("Freeze Character", function(state)
    local hrp = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
    hrp.Anchored = state
end)
Tab10:CreateToggle("Enable Bull Mode", function(state)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()

    for _, part in ipairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CustomPhysicalProperties = state
                and PhysicalProperties.new(30, 0.3, 0.5)
                or nil
        end
    end
end)
Tab10:CreateSection("Player Settings")
Tab10:CreateBox("Set Walk Speed", function(input)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(input)
end)
Tab10:CreateBox("Set Jump Power", function(input)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = tonumber(input)
end)
Tab10:CreateBox("Set Hip Height", function(input)
    game.Players.LocalPlayer.Character.Humanoid.HipHeight = tonumber(input)
end)
Tab10:CreateBox("Set Gravity", function(input)
    workspace.Gravity = tonumber(input)
end)

    Tab12:CreateSection("Player Stats")
    Tab12.statsLabel1 = Tab12:CreateLabel("Strength: ")
    Tab12.statsLabel2 = Tab12:CreateLabel("Rebirths: ")
    Tab12.statsLabel3 = Tab12:CreateLabel("Kills: ")
    Tab12.statsLabel4 = Tab12:CreateLabel("Brawls: ")

    Tab12:CreateSection("Other Stats")
    Tab12.playerLabel1 = Tab12:CreateLabel("Durability: ")
    Tab12.playerLabel2 = Tab12:CreateLabel("Agility: ")
    Tab12.playerLabel3 = Tab12:CreateLabel("Buffness: ")
    Tab12.playerLabel4 = Tab12:CreateLabel("Height: ")
    Tab12.playerLabel5 = Tab12:CreateLabel("Good Karma: ")
    Tab12.playerLabel6 = Tab12:CreateLabel("Evil Karma: ")

    local function updateStats()
    local player = game.Players.LocalPlayer
    local leaderstats = player:FindFirstChild("leaderstats")

    repeat wait() until player:FindFirstChild("PlayerGui") and player.PlayerGui:FindFirstChild("gameGui")

    local playerMenu = player.PlayerGui.gameGui:FindFirstChild("statsMenu")
    if not playerMenu then return end

    local statsList = playerMenu:FindFirstChild("statsList")
    if not statsList then return end

    local durabilityLabel = statsList:FindFirstChild("durabilityFrame"):FindFirstChild("amountLabel")
    local agilityLabel = statsList:FindFirstChild("agilityFrame"):FindFirstChild("amountLabel")
    local buffnessLabel = statsList:FindFirstChild("buffnessFrame"):FindFirstChild("amountLabel")
    local heightLabel = statsList:FindFirstChild("heightFrame"):FindFirstChild("amountLabel")
    local goodKarmaLabel = playerMenu:FindFirstChild("goodKarmaFrame"):FindFirstChild("amountLabel")
    local evilKarmaLabel = playerMenu:FindFirstChild("evilKarmaFrame"):FindFirstChild("amountLabel")

    local function convertFormattedNumber(text)
        local num, suffix = text:match("([%d%.]+)([KMBT]?)")
        if not num then return "0" end
        num = tonumber(num) or 0
        local multipliers = { K = 1e3, M = 1e6, B = 1e9, T = 1e12 }
        return tostring(math.floor(num * (multipliers[suffix] or 1)))
    end

    local function refreshAll()
        if leaderstats then
            if leaderstats:FindFirstChild("Strength") then
                Tab12.statsLabel1.SetText("Strength: " .. leaderstats.Strength.Value)
            end
            if leaderstats:FindFirstChild("Rebirths") then
                Tab12.statsLabel2.SetText("Rebirths: " .. leaderstats.Rebirths.Value)
            end
            if leaderstats:FindFirstChild("Kills") then
                Tab12.statsLabel3.SetText("Kills: " .. leaderstats.Kills.Value)
            end
            if leaderstats:FindFirstChild("Brawls") then
                Tab12.statsLabel4.SetText("Brawls: " .. leaderstats.Brawls.Value)
            end
        end

        if durabilityLabel then
            Tab12.playerLabel1.SetText("Durability: " .. convertFormattedNumber(durabilityLabel.Text))
        end
        if agilityLabel then
            Tab12.playerLabel2.SetText("Agility: " .. convertFormattedNumber(agilityLabel.Text))
        end
        if buffnessLabel then
            Tab12.playerLabel3.SetText("Buffness: " .. convertFormattedNumber(buffnessLabel.Text))
        end
        if heightLabel then
            Tab12.playerLabel4.SetText("Height: " .. convertFormattedNumber(heightLabel.Text))
        end
        if goodKarmaLabel then
            Tab12.playerLabel5.SetText("Good Karma: " .. convertFormattedNumber(goodKarmaLabel.Text))
        end
        if evilKarmaLabel then
            Tab12.playerLabel6.SetText("Evil Karma: " .. convertFormattedNumber(evilKarmaLabel.Text))
        end
    end

    if leaderstats then
        for _, stat in ipairs(leaderstats:GetChildren()) do
            if stat:IsA("IntValue") or stat:IsA("NumberValue") then
                stat.Changed:Connect(refreshAll)
            end
        end
    end

    local guiLabels = {
        durabilityLabel,
        agilityLabel,
        buffnessLabel,
        heightLabel,
        goodKarmaLabel,
        evilKarmaLabel,
    }

    for _, label in ipairs(guiLabels) do
        if label then
            label:GetPropertyChangedSignal("Text"):Connect(refreshAll)
        end
    end

    refreshAll()
end

updateStats()

  end
end)
GetKeyButton.MouseButton1Click:Connect(function()
 setclipboard("https://discord.gg/cmJd67XbCT") 
end)
 
