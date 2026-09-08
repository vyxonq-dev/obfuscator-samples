-- THE TIMBER 2 GUI
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()
local Window = OrionLib:MakeWindow({
    Name = "Scripted Hub",
    HidePremium = false,
    SaveConfig = false,
    ConfigFolder = "OrionTest",
    Draggable = true
})
-- LOCALS
local workspace = game.Workspace
local players = game:GetService("Players")
local player = players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local playerPlot = workspace.Plots:FindFirstChild(player.Name)
local communication = game:GetService("ReplicatedStorage"):WaitForChild("Communication")
local toolFishing = "Fishing Rod"

-- Minigames
local claimPlaytimeReward = communication:WaitForChild("ClaimPlaytimeReward")
local minigames = communication:WaitForChild("Minigames")
local miniHoney = minigames:WaitForChild("Honey Harvester")
local miniBoat = minigames:WaitForChild("Boat Racing")
local miniBoulder = minigames:WaitForChild("Boulder Run")

-- Workspace references
local workBoulder = workspace.Minigames["Boulder Run"]
local workBoat = workspace.Minigames["Boat Racing"]
local trigger = workBoulder.Trigger
local finish = workBoulder.Finish
local core = workspace.Core

-- Timers
local honeyTimer = core["Honey HarvesterStart"].Main.BillboardGui.Timer.Text
local boatTimer = core["Boat RacingStart"].Main.BillboardGui.Timer.Text
local boulderTimer = core["Boulder RunStart"].Main.BillboardGui.Timer.Text

-- CFrame references
local diamondClaimCFrame = core.FreeDiamondsClaim.CFrame
local groupRewardClaimCFrame = core.GroupRewardsClaim.CFrame

-- Timer references
local diamondTimer = core.FreeDiamondsClaim.Attachment.BillboardGui.Timer
local groupTimer = core.GroupRewardsClaim.Attachment.BillboardGui.Timer

-- Checkpoints
local race1CP = workBoat.Race1.Checkpoints
local race2CP = workBoat.Race2.Checkpoints
local race3CP = workBoat.Race3.Checkpoints
local playerPlotName = ""

-- TOGGLES
local autoChop, autoSell, autoMineOres, autoFish, autoBigTree, autoBigOre, autoChopFriend = false, false, false, false, false, false, false
local autoStr, autoSpeed, autoHut, autoGolden, autoTree = false, false, false, false, false
local autoWAmount, autoWStr, autoWTrees, autoWSpeed = false, false, false, false
local autoHoney, autoBoulder, autoBoat = false, false, false
local autoClaimTime, autoClaimGroupRewards, autoClaimDiamonds, autoRebirth, autoInvite = false, false, false, false, false

local function addToggle(section, name, variable, callback)
    section:AddToggle({
        Name = name,
        Default = false,
        Callback = function(value)
            _G[variable] = value
            while _G[variable] do
                callback()
                wait(0.5)
            end
        end
    })
end

-- FUNCTION: MINIGAME
local function waitUntilReady(minigameName, timer, toggleVariable)
    while timer.Text ~= "Ready!" do
        if not _G[toggleVariable] then
            print(minigameName .. " minigame waiting cancelled.")
            return
        end
        print(minigameName .. " minigame not ready, waiting...")
        wait(3)
    end
    print(minigameName .. " minigame is ready!")
end

-- FUNCTION: FISHING
local function runAutoFishing()
    while autoFish do
        wait(0.1)
        communication:WaitForChild("FishCasted"):InvokeServer()
        communication:WaitForChild("CollectFishingRewards"):FireServer()
    end
end

-- FUNCTION: BOAT 
local function checkAndTeleportToCheckpoints(checkpoints)
    wait(5)
    for i = 1, #checkpoints:GetChildren() do
        local checkpoint = checkpoints:FindFirstChild(tostring(i))
        if checkpoint then
            print("Found checkpoint:", checkpoint.Name)
            local hasTouchInterest = false
            for _, child in ipairs(checkpoint:GetChildren()) do
                if child:FindFirstChildOfClass("TouchInterest") then
                    hasTouchInterest = true
                    break
                end
            end
            if hasTouchInterest then
                print("Teleporting to checkpoint:", checkpoint.Name)
                character:SetPrimaryPartCFrame(checkpoint.CFrame)
                if boatModel then
                    boatModel:SetPrimaryPartCFrame(checkpoint.CFrame)
                end
                wait(0.6)
            end
        else
            print("Checkpoint not found for:", i)
        end
    end
end


-- FUNCTION: COLLECT REWARD
local function collectReward(claimCFrame, timer, rewardName)
    local originalCFrame = character:GetPrimaryPartCFrame()
    waitUntilCollect(timer, rewardName)
    character:SetPrimaryPartCFrame(claimCFrame)
    print("Teleported to " .. rewardName .. " location.")
    wait(1)
    print("Collected " .. rewardName .. ".")
    character:SetPrimaryPartCFrame(originalCFrame)
    print("Teleported back to original location.")
end

-- FUNCTION: CHOP TREES
local function autoChopTrees(playerName)
    local playerPlot = game.Workspace.Plots:FindFirstChild(playerName)
    if playerPlot and playerPlot:FindFirstChild("Land") then
        for _, descendant in ipairs(playerPlot.Land:GetChildren()) do
            local name = tonumber(descendant.Name)
            if name and name >= 1000 and name <= 9999 then
                communication:WaitForChild("HitTree"):FireServer(name)
            end
        end
    else
        warn("Player's plot or Land not found!")
    end
end


-- TABS
local MainTab = Window:MakeTab({
    Name = "Auto Farm",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local UpgradeTab = Window:MakeTab({
    Name = "Upgrades",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local MinigameTab = Window:MakeTab({
    Name = "Minigames",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local MiscTab = Window:MakeTab({
    Name = "Miscellaneous",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- SECTIONS
local MainSection = MainTab:AddSection({
    Name = "Auto Farm"
})

local BigSection = MainTab:AddSection({
    Name = "Auto Farm Big Tree & Ore"
})

local HelpSection = MainTab:AddSection({
    Name = "Help a Friend Chop (Needs Permission)"
})

local PlayerUpgradeSection = UpgradeTab:AddSection({
    Name = "Player Upgrades"
})

local WorkerUpgradeSection = UpgradeTab:AddSection({
    Name = "Worker Upgrades"
})

local MinigameSection = MinigameTab:AddSection({
    Name = "Minigames"
})

local ClaimSection = MiscTab:AddSection({
    Name = "Auto Claim"
})

local RebirthSection = MiscTab:AddSection({
    Name = "Rebirth & Miscellaneous"
})


-- AUTO CHOP TREES
MainSection:AddToggle({
    Name = "Auto Chop Trees",
    Default = false,
    Callback = function(Value)
        autoChop = Value
        while autoChop do
            wait(0.08)
            if playerPlot and playerPlot:FindFirstChild("Land") then
                for _, descendant in ipairs(playerPlot.Land:GetDescendants()) do
                    if descendant:IsA("Model") and tonumber(descendant.Name) and tonumber(descendant.Name) >= 1000 and tonumber(descendant.Name) <= 9999 then
                        local success, error = pcall(function()
                            communication:WaitForChild("HitTree"):FireServer(tonumber(descendant.Name))
                        end)
                        if not success then
                            warn("Error hitting tree:", error)
                        end
                    end
                end
            else
                warn("Player's plot or Land not found!")
            end
        end
    end
})


-- AUTO MINE ORES
MainSection:AddToggle({
    Name = "Auto Mine Ores",
    Default = false,
    Callback = function(Value)
        autoMineOres = Value
        while autoMineOres do
            wait(0.01)
            local oresFolder = game.Workspace:FindFirstChild("Ores")
            local oreNames = {}
            if oresFolder then
                for _, ore in ipairs(oresFolder:GetChildren()) do
                    if ore:IsA("Model") and tonumber(ore.Name) and tonumber(ore.Name) >= 0 and tonumber(ore.Name) <= 50 then
                        table.insert(oreNames, tonumber(ore.Name))
                    end
                end
                communication:WaitForChild("HitOre"):FireServer(unpack(oreNames))
            else
                warn("Ores folder not found!")
            end
        end
    end
})


-- AUTO SELL
MainSection:AddToggle({
    Name = "Auto Sell",
    Default = false,
    Callback = function(Value)
        autoSell = Value
        while autoSell do
            wait(1)
            communication:WaitForChild("SellLogs"):FireServer()
        end
    end
})

-- AUTO FISHING
MainSection:AddToggle({
    Name = "Auto Fishing",
    Default = false,
    Callback = function(Value)
        autoFish = Value
        if autoFish then
            if player.Character then
                local cframe = CFrame.new(-13.2758808, 42.245575, 80.2814026)
                player.Character:SetPrimaryPartCFrame(cframe)
            end
            wait(0.5)
            local tool = player.Backpack:FindFirstChild(toolFishing)
            if tool then
                tool.Parent = game.Workspace[player.Name]
                wait()
            else
                warn(toolFishing .. " not found in backpack!")
            end
            runAutoFishing()
        end
    end
})



-- AUTO CHOP MEGA TREE
BigSection:AddToggle({
    Name = "Auto Chop Mega Tree",
    Default = false,
    Callback = function(Value)
        autoBigTree = Value
        while autoBigTree do
            wait(0.01)
            local megaTreesFolder = game.Workspace:FindFirstChild("MegaTrees")
            if megaTreesFolder then
                for _, megaTreeModel in ipairs(megaTreesFolder:GetChildren()) do
                    local args = {
                        [1] = tonumber(megaTreeModel.Name)
                    }
                    communication:WaitForChild("HitTree"):FireServer(unpack(args))
                end
            else
                warn("MegaTrees folder not found!")
            end
        end
    end
})


-- AUTO MINE BIG ORE
BigSection:AddToggle({
    Name = "Auto Mine Mega Ore 1 & 2",
    Default = false,
    Callback = function(Value)
        autoBigOre = Value
        while autoBigOre do
            wait(0.01)
            communication:WaitForChild("HitOre"):FireServer(26, 27)
        end
    end
})

-- HELP A FRIEND CHOP
HelpSection:AddTextbox({
	Name = "Player Name",
	Default = "",
	Callback = function(Value)
		playerPlotName = Value
	end	  
})

HelpSection:AddToggle({
    Name = "Auto Chop Trees",
    Default = false,
    Callback = function(Value)
        autoChopFriend = Value
        if autoChopFriend then
            autoChopTrees(playerPlotName)
        end
    end
})


-- UPGRADE SECTION

-- PLAYER UPGRADES
addToggle(PlayerUpgradeSection, "Auto Upgrade - Axe Strength", "autoStr", function()
    communication:WaitForChild("UpgradeStat"):FireServer("AxeStrength")
end)

addToggle(PlayerUpgradeSection, "Auto Upgrade - Speed", "autoSpeed", function()
    communication:WaitForChild("UpgradeStat"):FireServer("Speed")
end)

addToggle(PlayerUpgradeSection, "Auto Upgrade - Hut Capacity", "autoHut", function()
    communication:WaitForChild("UpgradeStat"):FireServer("HutCapacity")
end)

addToggle(PlayerUpgradeSection, "Auto Upgrade - Golden Chance", "autoGolden", function()
    communication:WaitForChild("UpgradeStat"):FireServer("GoldenChance")
end)

addToggle(PlayerUpgradeSection, "Auto Upgrade - Tree Grow Speed", "autoTree", function()
    communication:WaitForChild("UpgradeStat"):FireServer("TreeGrowSpeed")
end)

-- WORKER UPGRADES
addToggle(WorkerUpgradeSection, "Auto Upgrade - Worker Amount", "autoWAmount", function()
    communication:WaitForChild("UpgradeStat"):FireServer("WorkerAmount")
end)

addToggle(WorkerUpgradeSection, "Auto Upgrade - Worker Strength", "autoWStr", function()
    communication:WaitForChild("UpgradeStat"):FireServer("WorkerStrength")
end)

addToggle(WorkerUpgradeSection, "Auto Upgrade - Worker Max Trees", "autoWTrees", function()
    communication:WaitForChild("UpgradeStat"):FireServer("WorkerMaxTrees")
end)

addToggle(WorkerUpgradeSection, "Auto Upgrade - Worker Speed", "autoWSpeed", function()
    communication:WaitForChild("UpgradeStat"):FireServer("WorkerSpeed")
end)


-- MINIGAMES TAB

-- HONEY MINIGAME
MinigameSection:AddToggle({
    Name = "Auto Minigame - Honey Harvester",
    Default = false,
    Callback = function(Value)
        _G.autoHoney = Value
        if _G.autoHoney then
            waitUntilReady("Honey Harvester", core["Honey HarvesterStart"].Main.BillboardGui.Timer, "autoHoney")
            local args = { "Honey Harvester" }
            minigames:WaitForChild("Start"):FireServer(unpack(args))
            wait(0.2)
            while _G.autoHoney do
                local function collectSeed()
                    for i = 1, 8 do
                        local args = { i }
                        miniHoney:WaitForChild("CollectSeed"):FireServer(unpack(args))
                    end
                end

                local function collectHoney()
                    for i = 1, 8 do
                        local args = { i }
                        miniHoney:WaitForChild("CollectHoney"):FireServer(unpack(args))
                        wait(0.02)
                    end
                end

                local seedCoroutine = coroutine.create(collectSeed)
                local honeyCoroutine = coroutine.create(collectHoney)

                coroutine.resume(seedCoroutine)
                coroutine.resume(honeyCoroutine)
                wait(0.02)
            end
            wait(75)
            if _G.autoFish then
                runAutoFishing()
            end
        end
    end
})

-- BOULDER MINIGAME
MinigameSection:AddToggle({
    Name = "Auto Minigame - Boulder Run",
    Default = false,
    Callback = function(Value)
        _G.autoBoulder = Value
        if _G.autoBoulder then
            waitUntilReady("Boulder Run", core["Boulder RunStart"].Main.BillboardGui.Timer, "autoBoulder")
            local args = { "Boulder Run" }
            minigames:WaitForChild("Start"):FireServer(unpack(args))
            wait(6)
            if _G.autoBoulder then
                local checkPoint = trigger.CFrame
                local finishCFrame = finish.CFrame
                character:SetPrimaryPartCFrame(checkPoint)
                wait(1.6)
                character:SetPrimaryPartCFrame(finishCFrame)
                wait(5)
                if _G.autoFish then
                    runAutoFishing()
                end
            end
        end
    end
})

-- BOAT RACING MINIGAME
MinigameSection:AddToggle({
    Name = "Auto Minigame - Boat Racing",
    Default = false,
    Callback = function(Value)
        _G.autoBoat = Value
        if _G.autoBoat then
            waitUntilReady("Boat Racing", core["Boat RacingStart"].Main.BillboardGui.Timer, "autoBoat")
            local args = { "Boat Racing" }
            minigames:WaitForChild("Start"):FireServer(unpack(args))
            wait(7)
            local boatModel = workspace.Boats[player.Name].Main
            if _G.autoBoat then
                checkAndTeleportToCheckpoints(race1CP)
                checkAndTeleportToCheckpoints(race2CP)
                checkAndTeleportToCheckpoints(race3CP)
                if _G.autoFish then
                    runAutoFishing()
                end
            end
        end
    end
})


-- MISC TAB

-- AUTO CLAIM TIME REWARD
ClaimSection:AddToggle({
    Name = "Auto Claim - Time Rewards",
    Default = false,
    Callback = function(Value)
        autoClaimTime = Value
        while autoClaimTime do
            local function claimPlaytimeRewards()
    for i = 1, 12 do
        local args = {
            [1] = i
        }
        ClaimPlaytimeReward:FireServer(unpack(args))
        wait(2)
    end
end
claimPlaytimeRewards()
        end
    end
})

-- AUTO CLAIM FREE DIAMONDS
ClaimSection:AddToggle({
    Name = "Auto Claim - Free Diamonds",
    Default = false,
    Callback = function(Value)
        autoClaimDiamonds = Value
        if autoClaimDiamonds then
            while autoClaimDiamonds do
                collectReward(diamondClaimCFrame, diamondTimer, "Free Diamonds")
                wait(10)
            end
        end
    end
})

-- AUTO CLAIM GROUP REWARDS
ClaimSection:AddToggle({
    Name = "Auto Claim - Group Rewards",
    Default = false,
    Callback = function(Value)
        autoClaimGroupRewards = Value
        if autoClaimGroupRewards then
            while autoClaimGroupRewards do
                collectReward(groupRewardClaimCFrame, groupTimer, "Group Rewards")
                wait(10)
            end
        end
    end
})

-- AUTO REBIRTH
RebirthSection:AddToggle({
    Name = "Auto Rebirth",
    Default = false,
    Callback = function(Value)
        autoRebirth = Value
        local rebirthFunction = function()
            communication:WaitForChild("Rebirth"):FireServer()
        end
        while autoRebirth do 
            wait(1)
            rebirthFunction()
        end
    end
})

-- AUTO INVITE VILLAGER
RebirthSection:AddToggle({
    Name = "Auto Invite Villager",
    Default = false,
    Callback = function(Value)
        autoInvite = Value
        while autoInvite do 
            wait(3)
            communication:WaitForChild("InviteWanderingVillager"):FireServer()
        end
    end
})



OrionLib:Init()
