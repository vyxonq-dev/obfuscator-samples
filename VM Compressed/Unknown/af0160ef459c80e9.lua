local localPlayer = game:GetService("Players").LocalPlayer 
local playerTycoon = nil
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local playerHRP = character:WaitForChild("HumanoidRootPart")
local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local settings = {
    buyTycoonButtonsCooldown = 0.05,
    autoBuyTycoonButtons = true,
    autoRebirth = false,
    autoRebirthCooldown = 5,
    autoIndustry = false,
    autoIndustryCooldown = 10,
    autoCollectGrowables = false, 
    collectGrowablesCooldown = 1,
}

local CollectGrowablesConfig = {
    Teleport = {
        HorizontalDistance = 10,
        VerticalDistance = 30
    },
    Movement = {
        Velocity = 110,
        Pulse = {
            Magnitude = 2000,
            Interval = 2,
            VerticalVariation = 10
        },
        RotationSpeed = 100
    },
    Timing = {
        CollectionDuration = 5,
        GiveUpTime = 10,
        OverallTimeout = 20,
        DelayBetweenGrowables = 0.1,
        RepeatDelay = 1
    },
    RepeatCollection = true,
    SendPositionUpdates = true,
    PositionUpdateFrequency = 0.05
}

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = gameName.." - Tycoon Script",
    Icon = 0,
    LoadingTitle = "Rayfield Interface Suite",
    LoadingSubtitle = "by Sirius",
    ShowText = gameName,
    Theme = "Default",
    ToggleUIKeybind = "K",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false
})

local GrowablesContainer
local isCollectingGrowables = false

local function getPlayerTycoon()
    if localPlayer and localPlayer:GetAttribute("TycoonID") ~= nil and workspace:FindFirstChild("Tycoons") then
        playerTycoon = workspace.Tycoons[localPlayer:GetAttribute("TycoonID")]
    end 
end

local function buyTycoonButtons() --prob ill rewrite this later
    if playerTycoon and playerTycoon:FindFirstChild("PurchaseableModels") then
        for _, model in pairs(playerTycoon.PurchaseableModels:GetChildren()) do
            if model:FindFirstChild("Button") and model.Button:FindFirstChild("Hitbox") and firetouchinterest then
                local button = model.Button
                local hitbox = button.Hitbox
                local top = button:FindFirstChild("Top")
                if top then
                    firetouchinterest(hitbox, playerHRP, 0)
                    firetouchinterest(hitbox, playerHRP, 1)
                end
            end 
        end 
    end 
end

local function rebirth()
    if localPlayer.leaderstats and localPlayer.leaderstats.Rebirths and localPlayer.leaderstats.Rebirths.Value == 8  then
        ReplicatedStorage.RemoteFunctions.Ascend:InvokeServer()
    else
        ReplicatedStorage.RemoteFunctions.Rebirth:InvokeServer()
    end
end

local function checkAndManageIndustry()
    local tycoonFrame = localPlayer.PlayerGui.MainUI.TycoonFrame.Bars
    local electricScale = tycoonFrame.Electric.Bar.Size.X.Scale
    local nuclearScale = tycoonFrame.Nuclear.Bar.Size.X.Scale
    local farmingScale = tycoonFrame.Farming.Bar.Size.X.Scale
    local maxScale = math.max(electricScale, nuclearScale, farmingScale)
    
    if maxScale >= 0.52 then
        local bestIndustry = ""
        if maxScale == electricScale then
            bestIndustry = "Electric"
        elseif maxScale == nuclearScale then
            bestIndustry = "Nuclear"
        else
            bestIndustry = "Farming"
        end
        ReplicatedStorage.RemoteFunctions.ApplyNewSetting:InvokeServer("UseManager", 1)
        ReplicatedStorage.RemoteEvents.SelectNewIndusty:FireServer(bestIndustry)
    else
        ReplicatedStorage.RemoteFunctions.ApplyNewSetting:InvokeServer("UseManager", 0)
    end
end

local function GetRandomPositionAroundTarget(targetPosition)
    local randomAngle = math.rad(math.random(0, 360))
    local randomX = math.cos(randomAngle) * CollectGrowablesConfig.Teleport.HorizontalDistance
    local randomZ = math.sin(randomAngle) * CollectGrowablesConfig.Teleport.HorizontalDistance
    return CFrame.new(
        targetPosition.X + randomX,
        targetPosition.Y + CollectGrowablesConfig.Teleport.VerticalDistance,
        targetPosition.Z + randomZ
    )
end
local function ApplyMovementPulse(characterHRP)
    local randomDirection = Vector3.new(
        math.random(-1, 1),
        math.random(-1, 1), 
        math.random(-1, 1)
    ).Unit
    characterHRP.Velocity = characterHRP.Velocity + (randomDirection * CollectGrowablesConfig.Movement.Pulse.Magnitude)
end
local function RotateCharacter(characterHRP)
    local randomRotation = math.rad(math.random(-CollectGrowablesConfig.Movement.RotationSpeed, CollectGrowablesConfig.Movement.RotationSpeed))
    characterHRP.CFrame = characterHRP.CFrame * CFrame.Angles(0, randomRotation, 0)
end
local function MoveTowardsTarget(characterHRP, targetPosition)
    local direction = (targetPosition - characterHRP.Position).Unit
    local velocity = direction * CollectGrowablesConfig.Movement.Velocity
    local verticalVariation = Vector3.new(0, math.random(-CollectGrowablesConfig.Movement.Pulse.VerticalVariation, CollectGrowablesConfig.Movement.Pulse.VerticalVariation), 0)
    characterHRP.Velocity = velocity + verticalVariation
end
local function IsGrowableValid(growable)
    return growable and growable:IsA("BasePart") and growable.Parent == GrowablesContainer
end
local function CollectSingleGrowable(growable)
    if not IsGrowableValid(growable) then
        return false
    end
    local originalPosition = playerHRP.CFrame
    local startTime = tick()
    local lastPulseTime = 0
    playerHRP.CFrame = GetRandomPositionAroundTarget(growable.Position)
    while tick() - startTime < CollectGrowablesConfig.Timing.CollectionDuration do
        if not IsGrowableValid(growable) then
            break
        end
        if tick() - startTime > CollectGrowablesConfig.Timing.GiveUpTime then
            break
        end
        MoveTowardsTarget(playerHRP, growable.Position)
        if tick() - lastPulseTime > CollectGrowablesConfig.Movement.Pulse.Interval then
            lastPulseTime = tick()
            ApplyMovementPulse(playerHRP)
        end
        RotateCharacter(playerHRP)
        task.wait()
    end
    playerHRP.CFrame = originalPosition
    playerHRP.Velocity = Vector3.zero
    return true
end
local function CollectAllGrowables()
    if not GrowablesContainer then
        GrowablesContainer = workspace:FindFirstChild("Growables")
        if not GrowablesContainer then
            warn("Growables container not found!")
            return 0
        end
    end
    local growables = GrowablesContainer:GetChildren()
    local overallStartTime = tick()
    local collectedCount = 0
    for index, growable in ipairs(growables) do
        if not isCollectingGrowables then break end
        if tick() - overallStartTime > CollectGrowablesConfig.Timing.OverallTimeout then
            break
        end
        if CollectSingleGrowable(growable) then
            collectedCount = collectedCount + 1
        end
        task.wait(CollectGrowablesConfig.Timing.DelayBetweenGrowables)
    end
    return collectedCount
end
local function RunCollectionCycle()
    local cycleCount = 0
    repeat
        if not isCollectingGrowables then break end
        cycleCount = cycleCount + 1
        local collected = CollectAllGrowables()
        if CollectGrowablesConfig.RepeatCollection and isCollectingGrowables then
            task.wait(CollectGrowablesConfig.Timing.RepeatDelay)
        end
    until not CollectGrowablesConfig.RepeatCollection or not isCollectingGrowables
end

local function SafeExecute()
    local success, errorMessage = pcall(RunCollectionCycle)
    if not success then
        warn("Error in collection script: " .. tostring(errorMessage))
    end
end

local function InitializeCollectGrowables()
    if not character:FindFirstChild("HumanoidRootPart") then
        character:WaitForChild("HumanoidRootPart")
    end
    GrowablesContainer = workspace:FindFirstChild("Growables")
    if not GrowablesContainer then
        return false
    end
    return true
end

local MainTab = Window:CreateTab("Main", 4483362458)

local AutomationSection = MainTab:CreateSection("Automation")

local AutoBuyToggle = MainTab:CreateToggle({
    Name = "Auto Buy Buttons",
    CurrentValue = settings.autoBuyTycoonButtons,
    Flag = "AutoBuyToggle",
    Callback = function(Value)
        settings.autoBuyTycoonButtons = Value
        if Value then
            getPlayerTycoon()
        end
    end,
})

local AutoRebirthToggle = MainTab:CreateToggle({
    Name = "Auto Rebirth",
    CurrentValue = settings.autoRebirth,
    Flag = "AutoRebirthToggle",
    Callback = function(Value)
        settings.autoRebirth = Value
    end,
})

local AutoIndustryToggle = MainTab:CreateToggle({
    Name = "Auto Manage Industry",
    CurrentValue = settings.autoIndustry,
    Flag = "AutoIndustryToggle",
    Callback = function(Value)
        settings.autoIndustry = Value
    end,
})

local CooldownsSection = MainTab:CreateSection("Cooldowns")

local BuyCooldownSlider = MainTab:CreateSlider({
    Name = "Buy Buttons Cooldown",
    Range = {0.01, 1},
    Increment = 0.01,
    Suffix = "seconds",
    CurrentValue = settings.buyTycoonButtonsCooldown,
    Flag = "BuyCooldownSlider",
    Callback = function(Value)
        settings.buyTycoonButtonsCooldown = Value
    end,
})

local RebirthCooldownSlider = MainTab:CreateSlider({
    Name = "Auto Rebirth Cooldown",
    Range = {1, 60},
    Increment = 1,
    Suffix = "seconds",
    CurrentValue = settings.autoRebirthCooldown,
    Flag = "RebirthCooldownSlider",
    Callback = function(Value)
        settings.autoRebirthCooldown = Value
    end,
})

local IndustryCooldownSlider = MainTab:CreateSlider({
    Name = "Auto Industry Cooldown",
    Range = {1, 60},
    Increment = 1,
    Suffix = "seconds",
    CurrentValue = settings.autoIndustryCooldown,
    Flag = "IndustryCooldownSlider",
    Callback = function(Value)
        settings.autoIndustryCooldown = Value
    end,
})

local ManualSection = MainTab:CreateSection("Manual Actions")

local BuyButtonsButton = MainTab:CreateButton({
    Name = "Buy All Buttons",
    Callback = function()
        getPlayerTycoon()
        buyTycoonButtons()
    end,
})

local RebirthButton = MainTab:CreateButton({
    Name = "Rebirth/Ascend",
    Callback = function()
        rebirth()
    end,
})

local IndustryButton = MainTab:CreateButton({
    Name = "Optimize Industry",
    Callback = function()
        checkAndManageIndustry()
    end,
})

local GrowablesSection = MainTab:CreateSection("Growables Automation")

local AutoCollectGrowablesToggle = MainTab:CreateToggle({
    Name = "Auto Collect Growables",
    CurrentValue = settings.autoCollectGrowables,
    Flag = "AutoCollectGrowablesToggle",
    Callback = function(Value)
        settings.autoCollectGrowables = Value
        isCollectingGrowables = Value
        if Value then
            if InitializeCollectGrowables() then
                task.spawn(function()
                    while isCollectingGrowables and settings.autoCollectGrowables do
                        SafeExecute()
                        task.wait(settings.collectGrowablesCooldown)
                    end
                end)
            else
                Rayfield:Notify({
                    Title = "Error",
                    Content = "Growables container not found!",
                    Duration = 5,
                    Image = 0
                })
                settings.autoCollectGrowables = false
                isCollectingGrowables = false
                AutoCollectGrowablesToggle:Set(false)
            end
        else
            isCollectingGrowables = false
        end
    end,
})

local CollectGrowablesCooldownSlider = MainTab:CreateSlider({
    Name = "Collect Growables Cooldown",
    Range = {0.1, 10},
    Increment = 0.1,
    Suffix = "seconds",
    CurrentValue = settings.collectGrowablesCooldown,
    Flag = "CollectGrowablesCooldownSlider",
    Callback = function(Value)
        settings.collectGrowablesCooldown = Value
    end,
})

task.spawn(function()
    while true do
        if settings.autoBuyTycoonButtons then
            getPlayerTycoon()
            buyTycoonButtons()
        end
        task.wait(settings.buyTycoonButtonsCooldown)
    end
end)

task.spawn(function()
    while true do
        if settings.autoRebirth then
            rebirth()
        end
        task.wait(settings.autoRebirthCooldown)
    end
end)

task.spawn(function()
    while true do
        if settings.autoIndustry then
            checkAndManageIndustry()
        end
        task.wait(settings.autoIndustryCooldown)
    end
end)

getPlayerTycoon()