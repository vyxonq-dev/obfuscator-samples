------------------------------------------
----- =======[ Load WindUI ]
-------------------------------------------

local Version = "1.6.53"
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/download/" ..
Version .. "/main.lua"))()

-------------------------------------------
----- =======[ MERGED GLOBAL FUNCTION ]
-------------------------------------------

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local VirtualUser = game:GetService("VirtualUser")

-- Net Remotes
local net = ReplicatedStorage:WaitForChild("Packages")
    :WaitForChild("_Index")
    :WaitForChild("sleitnick_net@0.2.0")
    :WaitForChild("net")
local rodRemote = net:WaitForChild("RF/ChargeFishingRod")
local miniGameRemote = net:WaitForChild("RF/RequestFishingMinigameStarted")
local finishRemote = net:WaitForChild("RE/FishingCompleted")

-- Constants & Player
local Constants = require(ReplicatedStorage:WaitForChild("Shared", 20):WaitForChild("Constants"))
local Player = Players.LocalPlayer
local XPBar = Player:WaitForChild("PlayerGui"):WaitForChild("XP")
local PlaceId = game.PlaceId

local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local Humanoid = Character:WaitForChild("Humanoid")

-- Anti-Idle System
LocalPlayer.Idled:Connect(function()
    local VirtualUser = game:GetService("VirtualUser")
    VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)

for i, v in next, getconnections(game:GetService("Players").LocalPlayer.Idled) do
    if v.Connection then
        v.Connection:Disconnect()
    end
end

for i, v in next, getconnections(game:GetService("Players").LocalPlayer.Idled) do
    v:Disable()
end

-- Enable XP Bar
task.spawn(function()
    if XPBar then
        XPBar.Enabled = true
    end
end)

-- Auto Reconnect System
local function AutoReconnect()
    while task.wait(5) do
        if not Players.LocalPlayer or not Players.LocalPlayer:IsDescendantOf(game) then
            TeleportService:Teleport(PlaceId)
        end
    end
end

Players.LocalPlayer.OnTeleport:Connect(function(state)
    if state == Enum.TeleportState.Failed then
        TeleportService:Teleport(PlaceId)
    end
end)

task.spawn(AutoReconnect)

-- Animation Setup
local character = Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

-- Folder References
local Shared = ReplicatedStorage:WaitForChild("Shared", 5)
local Modules = ReplicatedStorage:WaitForChild("Modules", 5)

-- Custom Require Function
local function customRequire(module)
    if not module then return nil end
    local success, result = pcall(require, module)
    if success then
        return result
    else
        local clone = module:Clone()
        clone.Parent = nil
        local cloneSuccess, cloneResult = pcall(require, clone)
        if cloneSuccess then
            return cloneResult
        else
            warn("Failed to load module: " .. module:GetFullName())
            return nil
        end
    end
end

-- Load Global Utilities
if Shared then
    if not _G.ItemUtility then
        local success, utility = pcall(require, Shared:WaitForChild("ItemUtility", 5))
        if success and utility then
            _G.ItemUtility = utility
        else
            warn("ItemUtility module not found or failed to load.")
        end
    end
    
    if not _G.ItemStringUtility and Modules then
        local success, stringUtility = pcall(require, Modules:WaitForChild("ItemStringUtility", 5))
        if success and stringUtility then
            _G.ItemStringUtility = stringUtility
        else
            warn("ItemStringUtility module not found or failed to load.")
        end
    end
    
    -- Load Trade Modules
    if not _G.Replion then 
        pcall(function() 
            _G.Replion = require(ReplicatedStorage.Packages.Replion) 
        end) 
    end
    
    if not _G.Promise then 
        pcall(function() 
            _G.Promise = require(ReplicatedStorage.Packages.Promise) 
        end) 
    end
    
    if not _G.PromptController then 
        pcall(function() 
            _G.PromptController = require(ReplicatedStorage.Controllers.PromptController) 
        end) 
    end
end

-- Advanced Module Loading System
local ModulesTable = {}
local success, errorMessage = pcall(function()
    local Controllers = ReplicatedStorage:WaitForChild("Controllers", 20)
    local NetFolder = ReplicatedStorage:WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild(
        "sleitnick_net@0.2.0"):WaitForChild("net", 20)
    
    if not (Controllers and NetFolder and Shared) then 
        error("Core game folders not found.") 
    end

    -- Load using customRequire
    ModulesTable.Replion = customRequire(ReplicatedStorage.Packages.Replion)
    ModulesTable.ItemUtility = customRequire(Shared.ItemUtility)
    ModulesTable.FishingController = customRequire(Controllers.FishingController)
    
    -- Net Events
    ModulesTable.EquipToolEvent = NetFolder["RE/EquipToolFromHotbar"]
    ModulesTable.ChargeRodFunc = NetFolder["RF/ChargeFishingRod"]
    ModulesTable.StartMinigameFunc = NetFolder["RF/RequestFishingMinigameStarted"]
    ModulesTable.CompleteFishingEvent = NetFolder["RE/FishingCompleted"]
    ModulesTable.FishCaught = NetFolder["RE/FishCaught"]
end)

if not success then
    warn("FATAL ERROR DURING MODULE LOADING: " .. tostring(errorMessage))
    return
end

_G.FishingModules = ModulesTable

print("âœ… Global Function Merged Successfully!")
print("ðŸ“¦ Modules Loaded:", ModulesTable)

-- ============================================================================
-- CONFIGURATION
-- ============================================================================
local Config = {
    AutoFishingNewMethod = false,
    FishingDelay = 0.3,
}

local RuntimeState = {
    IsFishingNewMethod = false,
    LastFishTime = tick(),
}

-- ============================================================================
-- REMOTES SYSTEM
-- ============================================================================
_G.GetRemote = function(name)
    return net:FindFirstChild(name)
end

_G.Remotes = {
    EquipTool = _G.GetRemote("RE/EquipToolFromHotbar"),
    ChargeRod = _G.GetRemote("RF/ChargeFishingRod"),
    StartMini = _G.GetRemote("RF/RequestFishingMinigameStarted"),
    FinishFish = _G.GetRemote("RE/FishingCompleted"),
    FishCaught = _G.GetRemote("RE/FishCaught"),
}

-- ============================================================================
-- AUTO FISHING - NEW METHOD (FIXED VERSION)
-- ============================================================================
_G.AutoFishingNewMethod = function()
    if RuntimeState.IsFishingNewMethod then
        warn("[AutoFishingNewMethod] Already running")
        return
    end
    
    task.spawn(function()
        RuntimeState.IsFishingNewMethod = true
        print("[AutoFishingNewMethod] Started - EXTREME SPEED MODE")
        
        -- Equip rod once at start
        local equipSuccess = false
        for attempt = 1, 3 do
            local ok = pcall(function()
                if _G.Remotes.EquipTool then
                    _G.Remotes.EquipTool:FireServer(1)
                end
            end)
            
            if ok then
                equipSuccess = true
                print("[AutoFishingNewMethod] Rod equipped successfully")
                break
            end
            
            task.wait(0.1)
        end
        
        if not equipSuccess then
            warn("[AutoFishingNewMethod] Failed to equip rod, stopping...")
            Config.AutoFishingNewMethod = false
            RuntimeState.IsFishingNewMethod = false
            WindUI:Notify({
                Title = "New Method",
                Content = "Failed to equip rod. Please try again.",
                Duration = 5,
                Icon = "ban"
            })
            return
        end
        
        task.wait(0.5)
        
        local consecutiveErrors = 0
        local maxConsecutiveErrors = 15
        local lastSuccessTime = tick()
        local cycleCount = 0
        
        while Config.AutoFishingNewMethod and RuntimeState.IsFishingNewMethod do
            local cycleSuccess = false
            
            local success, err = pcall(function()
                -- Validate character
                if not LocalPlayer.Character or not HumanoidRootPart then
                    repeat task.wait(0.01) until LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    Character = LocalPlayer.Character
                    HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
                    Humanoid = Character:WaitForChild("Humanoid")
                end
                
                -- Step 1: Charge Rod
                if _G.Remotes.ChargeRod then
                    local chargeSuccess, chargeResult = pcall(function()
                        return _G.Remotes.ChargeRod:InvokeServer(100)
                    end)
                    
                    if not chargeSuccess or not chargeResult then
                        task.wait(0.05)
                        return
                    end
                    task.wait(0.05)
                end
                
                -- Step 2: Start Minigame
                if _G.Remotes.StartMini then
                    local startSuccess = pcall(function()
                        _G.Remotes.StartMini:InvokeServer(-1.233184814453125, 0.9945034885633273)
                    end)
                    
                    if not startSuccess then
                        task.wait(0.05)
                        return
                    end
                end
                
                -- Step 3: Wait
                local actualDelay = math.max((Config.FishingDelay or 0.3) * 0.2, 0.05)
                task.wait(actualDelay)
                
                -- Step 4: Finish
                if _G.Remotes.FinishFish then
                    local finishOk = pcall(function()
                        _G.Remotes.FinishFish:FireServer()
                    end)
                    
                    if finishOk then
                        cycleSuccess = true
                        consecutiveErrors = 0
                        RuntimeState.LastFishTime = tick()
                        lastSuccessTime = tick()
                        cycleCount = cycleCount + 1
                    end
                end
                
                task.wait(0.01)
            end)
            
            if not success then
                consecutiveErrors = consecutiveErrors + 1
                
                if consecutiveErrors >= maxConsecutiveErrors then
                    warn("[AutoFishingNewMethod] Too many errors, performing recovery...")
                    
                    task.wait(3)
                    
                    -- Re-equip rod
                    pcall(function()
                        if _G.Remotes.EquipTool then
                            _G.Remotes.EquipTool:FireServer(1)
                        end
                    end)
                    
                    task.wait(1)
                    consecutiveErrors = 0
                    lastSuccessTime = tick()
                    
                    WindUI:Notify({
                        Title = "Auto Recovery",
                        Content = "Fishing system recovered",
                        Duration = 3,
                        Icon = "info"
                    })
                else
                    task.wait(0.2)
                end
            end
            
            -- Auto-restart if no activity for 3 minutes
            if tick() - lastSuccessTime > 180 then
                warn("[AutoFishingNewMethod] No activity for 3 minutes, auto-restarting...")
                
                RuntimeState.IsFishingNewMethod = false
                task.wait(2)
                if Config.AutoFishingNewMethod then
                    _G.AutoFishingNewMethod()
                end
                break
            end
        end
        
        RuntimeState.IsFishingNewMethod = false
        print("[AutoFishingNewMethod] Stopped after "..cycleCount.." cycles")
    end)
end

-- ============================================================================
-- DATABASE SYSTEM
-- ============================================================================
_G.tierToRarity = {
    [1] = "COMMON",
    [2] = "UNCOMMON",
    [3] = "RARE",
    [4] = "EPIC",
    [5] = "LEGENDARY",
    [6] = "MYTHIC",
    [7] = "SECRET"
}

_G.LoadDatabase = function()
    local paths = {
        "/storage/emulated/0/Delta/Workspace/FULL_ITEM_DATA.json",
        "FULL_ITEM_DATA.json"
    }
    
    for _, p in ipairs(paths) do
        local ok, content = pcall(function() return readfile(p) end)
        if ok and content then
            local decodeOk, data = pcall(function() return HttpService:JSONDecode(content) end)
            if decodeOk and data then
                print("[DB] Loaded JSON from path:", p)
                return data
            end
        end
    end
    
    warn("[DB] FULL_ITEM_DATA.json not found")
    return nil
end

_G.database = _G.LoadDatabase()
_G.ItemDatabase = {}

if _G.database and _G.database.Data then
    for cat, list in pairs(_G.database.Data) do
        if type(list) == "table" then
            for key, item in pairs(list) do
                if type(item) == "table" then
                    local tierNum = tonumber(item.Tier) or 0
                    item.Rarity = (item.Rarity and string.upper(tostring(item.Rarity))) or (_G.tierToRarity[tierNum] or "UNKNOWN")
                    if item.Id then
                        local idn = tonumber(item.Id)
                        if idn then item.Id = idn end
                    end
                end
            end
        end
    end
    
    for cat, list in pairs(_G.database.Data) do
        if type(list) == "table" then
            for _, item in pairs(list) do
                if item and item.Id then
                    local id = tonumber(item.Id) or item.Id
                    local tierNum = tonumber(item.Tier) or 0
                    _G.ItemDatabase[id] = {
                        Name = item.Name or tostring(id),
                        Type = item.Type or cat,
                        Tier = tierNum,
                        SellPrice = item.SellPrice or 0,
                        Weight = item.Weight or "-",
                        Rarity = (item.Rarity and string.upper(tostring(item.Rarity))) or (_G.tierToRarity[tierNum] or "UNKNOWN"),
                        Raw = item
                    }
                end
            end
        end
    end
    
    print("[DATABASE] Item database loaded successfully")
else
    warn("[DATABASE] Failed to load item database")
end

_G.GetItemInfo = function(itemId)
    local info = _G.ItemDatabase[itemId]
    if not info then
        return {
            Name = "Unknown Item",
            Type = "Unknown",
            Tier = 0,
            SellPrice = 0,
            Weight = "-",
            Rarity = "UNKNOWN"
        }
    end
    info.Rarity = string.upper(tostring(info.Rarity or "UNKNOWN"))
    return info
end

-- ============================================================================
-- AUTO QUEST SYSTEM
-- ============================================================================
_G.TaskMapping = {
    ["Catch a SECRET Crystal Crab"] = "CRYSTAL CRAB",
    ["Catch 100 Epic Fish"] = "CRYSTAL CRAB",
    ["Catch 10,000 Fish"] = "CRYSTAL CRAB",
    ["Catch 300 Rare/Epic fish"] = "RARE/EPIC FISH",
    ["Earn 1M Coins"] = "FARMING COIN",
    ["Catch 1 SECRET fish at Sisyphus"] = "SECRET SYPUSH",
    ["Catch 3 Mythic fishes at Sisyphus"] = "SECRET SYPUSH",
    ["Create 3 Transcended Stones"] = "CREATE STONE",
    ["Catch 1 SECRET fish at Sacred Temple"] = "SECRET TEMPLE",
    ["Catch 1 SECRET fish at Ancient Jungle"] = "SECRET JUNGLE"
}

_G.teleportPositions = {
    ["CRYSTAL CRAB"] = CFrame.new(40.0956, 1.7772, 2757.2583),
    ["RARE/EPIC FISH"] = CFrame.new(-3596.9094, -281.1832, -1645.1220),
    ["SECRET SYPUSH"] = CFrame.new(-3658.5747, -138.4813, -951.7969),
    ["SECRET TEMPLE"] = CFrame.new(1451.4100, -22.1250, -635.6500),
    ["SECRET JUNGLE"] = CFrame.new(1479.6647, 11.1430, -297.9549),
    ["FARMING COIN"] = CFrame.new(-553.3464, 17.1376, 114.2622)
}

_G.QuestState = {
    Active = false,
    CurrentQuest = nil,
    SelectedTask = nil,
    CurrentLocation = nil,
    Teleported = false,
    Fishing = false,
    LastProgress = 0,
    LastTaskIndex = nil
}

_G.getQuestTracker = function(questName)
    local menu = Workspace:FindFirstChild("!!! MENU RINGS")
    if not menu then return nil end
    
    for _, inst in ipairs(menu:GetChildren()) do
        if inst.Name:find("Tracker") and inst.Name:lower():find(questName:lower()) then
            return inst
        end
    end
    
    return nil
end

_G.getQuestProgress = function(questName)
    local tracker = _G.getQuestTracker(questName)
    if not tracker then return 0 end
    
    local label = tracker:FindFirstChild("Board") 
        and tracker.Board:FindFirstChild("Gui") 
        and tracker.Board.Gui:FindFirstChild("Content") 
        and tracker.Board.Gui.Content:FindFirstChild("Progress") 
        and tracker.Board.Gui.Content.Progress:FindFirstChild("ProgressLabel")
    
    if label and label:IsA("TextLabel") then
        local percent = string.match(label.Text, "([%d%.]+)%%")
        return tonumber(percent) or 0
    end
    
    return 0
end

-- FIXED: Get ALL tasks with full names and details
_G.getAllTasks = function(questName)
    local tracker = _G.getQuestTracker(questName)
    if not tracker then return {} end
    
    local content = tracker:FindFirstChild("Board") 
        and tracker.Board:FindFirstChild("Gui") 
        and tracker.Board.Gui:FindFirstChild("Content")
    
    if not content then return {} end
    
    local tasks = {}
    for _, obj in ipairs(content:GetChildren()) do
        if obj:IsA("TextLabel") and obj.Name:match("Label") and not obj.Name:find("Progress") then
            local txt = obj.Text
            
            -- Parse the task text to get task name and percentage
            local taskName = txt
            local percent = 0
            local done = false
            
            -- Extract percentage if exists
            local percentMatch = string.match(txt, "([%d%.]+)%%")
            if percentMatch then
                percent = tonumber(percentMatch) or 0
                -- Remove percentage from task name
                taskName = string.gsub(txt, "%s*%d+%.?%d*%%%s*", "")
            end
            
            -- Check if completed
            if txt:find("âœ“") or txt:find("âœ”") or percent >= 100 then
                done = true
            end
            
            -- Clean up task name
            taskName = string.gsub(taskName, "^%s*(.-)%s*$", "%1") -- trim whitespace
            
            table.insert(tasks, {
                name = taskName,
                fullText = txt,
                percent = percent,
                completed = done
            })
        end
    end
    
    return tasks
end

_G.getActiveTasks = function(questName)
    local all = _G.getAllTasks(questName)
    local active = {}
    
    for _, t in ipairs(all) do
        if not t.completed then
            table.insert(active, t)
        end
    end
    
    return active
end

_G.teleportTo = function(locName)
    local cf = _G.teleportPositions[locName]
    if cf and HumanoidRootPart then
        pcall(function()
            HumanoidRootPart.CFrame = cf
        end)
        return true
    end
    return false
end

_G.findLocationByTaskName = function(taskName)
    for key, loc in pairs(_G.TaskMapping) do
        if string.find(taskName, key, 1, true) then
            return loc
        end
    end
    return nil
end

-- Quest Monitor Loop
task.spawn(function()
    while task.wait(1) do
        if not _G.QuestState.Active then continue end
        
        local questProgress = _G.getQuestProgress(_G.QuestState.CurrentQuest)
        local activeTasks = _G.getActiveTasks(_G.QuestState.CurrentQuest)
        local allTasks = _G.getAllTasks(_G.QuestState.CurrentQuest)
        
        -- Check if all tasks completed
        local allTasksCompleted = true
        for _, task in ipairs(allTasks) do
            if not task.completed and task.percent < 100 then
                allTasksCompleted = false
                break
            end
        end
        
        if allTasksCompleted and questProgress >= 100 then
            _G.SendQuestNotification(_G.QuestState.CurrentQuest, nil, 100, "QUEST_COMPLETED")
            Config.AutoFishingNewMethod = false
            _G.QuestState.Active = false
            
            WindUI:Notify({
                Title = "âœ… Quest Complete",
                Content = _G.QuestState.CurrentQuest .. " finished!",
                Duration = 5,
                Icon = "circle-check"
            })
            continue
        end
        
        -- Progress update notification
        if math.floor(questProgress / 10) > math.floor(_G.QuestState.LastProgress / 10) then
            _G.SendQuestNotification(_G.QuestState.CurrentQuest, _G.QuestState.SelectedTask, questProgress, "PROGRESS_UPDATE")
        end
        _G.QuestState.LastProgress = questProgress
        
        if questProgress >= 100 then
            _G.SendQuestNotification(_G.QuestState.CurrentQuest, nil, 100, "QUEST_COMPLETED")
            Config.AutoFishingNewMethod = false
            _G.QuestState.Active = false
            continue
        end
        
        if #activeTasks == 0 then
            _G.SendQuestNotification(_G.QuestState.CurrentQuest, nil, 100, "QUEST_COMPLETED")
            Config.AutoFishingNewMethod = false
            _G.QuestState.Active = false
            continue
        end
        
        -- Select current task
        local currentTask = nil
        local currentTaskIndex = nil
        
        for i, t in ipairs(activeTasks) do
            if _G.QuestState.SelectedTask and t.name == _G.QuestState.SelectedTask then
                currentTask = t
                currentTaskIndex = i
                break
            end
        end
        
        if not currentTask then
            if _G.QuestState.LastTaskIndex and _G.QuestState.LastTaskIndex <= #activeTasks then
                currentTaskIndex = _G.QuestState.LastTaskIndex
                currentTask = activeTasks[currentTaskIndex]
            else
                currentTaskIndex = 1
                currentTask = activeTasks[1]
            end
            
            if currentTask then
                _G.QuestState.SelectedTask = currentTask.name
                _G.QuestState.LastTaskIndex = currentTaskIndex
                _G.SendQuestNotification(_G.QuestState.CurrentQuest, currentTask.name, currentTask.percent, "TASK_SELECTED")
            end
        end
        
        if not currentTask then
            _G.QuestState.SelectedTask = nil
            _G.QuestState.LastTaskIndex = nil
            _G.QuestState.CurrentLocation = nil
            _G.QuestState.Teleported = false
            _G.QuestState.Fishing = false
            Config.AutoFishingNewMethod = false
            continue
        end
        
        -- Check if task completed
        if currentTask.percent >= 100 and not _G.QuestState.Fishing then
            _G.SendQuestNotification(_G.QuestState.CurrentQuest, currentTask.name, 100, "TASK_COMPLETED")
            
            if currentTaskIndex < #activeTasks then
                _G.QuestState.LastTaskIndex = currentTaskIndex + 1
            else
                _G.QuestState.LastTaskIndex = 1
            end
            
            _G.QuestState.SelectedTask = nil
            _G.QuestState.CurrentLocation = nil
            _G.QuestState.Teleported = false
            _G.QuestState.Fishing = false
            continue
        end
        
        -- Find location for task
        if not _G.QuestState.CurrentLocation then
            _G.QuestState.CurrentLocation = _G.findLocationByTaskName(currentTask.name)
            if not _G.QuestState.CurrentLocation then
                _G.QuestState.SelectedTask = nil
                continue
            end
        end
        
        -- Teleport to location
        if not _G.QuestState.Teleported then
            if _G.teleportTo(_G.QuestState.CurrentLocation) then
                _G.SendQuestNotification(_G.QuestState.CurrentQuest, currentTask.name, questProgress, "TELEPORT")
                _G.QuestState.Teleported = true
                task.wait(2)
            end
            continue
        end
        
        -- Start fishing
        if not _G.QuestState.Fishing then
            Config.AutoFishingNewMethod = true
            _G.AutoFishingNewMethod()
            _G.QuestState.Fishing = true
            _G.SendQuestNotification(_G.QuestState.CurrentQuest, currentTask.name, questProgress, "FARMING")
        end
    end
end)

-- ============================================================================
-- FISH CAUGHT HOOK
-- ============================================================================
_G.SetupFishHook = function()
    if _G.Remotes.FishCaught then
        _G.Remotes.FishCaught.OnClientEvent:Connect(function(fishData)
            if not fishData then return end
            
            local fishId = fishData.Id
            local weight = fishData.Weight
            local rarity = fishData.Rarity
            
            if not fishId then return end
            
            local itemInfo = _G.GetItemInfo(fishId)
            local actualRarity = rarity or itemInfo.Rarity
            
            -- Send Telegram notification if enabled and rarity matches
            if _G.ShouldSendByRarity(actualRarity) then
                local inventoryCount = _G.RefreshInventoryCount()
                local message = _G.BuildTelegramMessage(itemInfo, fishId, actualRarity, weight, inventoryCount)
                
                spawn(function()
                    local success, result = _G.SendTelegram(message)
                    if success then
                        print("[Telegram] Fish notification sent for:", itemInfo.Name, "(" .. actualRarity .. ")")
                    else
                        warn("[Telegram] Failed to send notification:", result)
                    end
                end)
            end
            
            -- Update last fish time
            RuntimeState.LastFishTime = tick()
        end)
    else
        warn("[FishHook] FishCaught remote not found")
    end
end

-------------------------------------------
----- =======[ X5 SPEED BALANCED METHOD ]
-------------------------------------------

local Modules = {}
local fishingTrove = {}
local autoFishThread = nil
local isWaitingForCorrectTier = false
local fishCaughtBindable = Instance.new("BindableEvent")
local hasEquippedRod = false

-- Konfigurasi default
local featureState = {
    AutoFish = false,
    Instant_ChargeDelay = 0.02,
    Instant_SpamCount = 5,
    Instant_WorkerCount = 4,
    Instant_StartDelay = 1.20,
    Instant_CatchTimeout = 0.01,
    Instant_CycleDelay = 0.01,
    Instant_ResetCount = 10,
    Instant_ResetPause = 0.01
}

-- System Save/Load Configuration
local configFileName = "x5_speed_config.json"

local function saveConfiguration()
    local configData = {
        Instant_ChargeDelay = featureState.Instant_ChargeDelay,
        Instant_SpamCount = featureState.Instant_SpamCount,
        Instant_WorkerCount = featureState.Instant_WorkerCount,
        Instant_StartDelay = featureState.Instant_StartDelay,
        Instant_CatchTimeout = featureState.Instant_CatchTimeout,
        Instant_CycleDelay = featureState.Instant_CycleDelay,
        Instant_ResetCount = featureState.Instant_ResetCount,
        Instant_ResetPause = featureState.Instant_ResetPause
    }
    
    local success, jsonData = pcall(game.HttpService.JSONEncode, game.HttpService, configData)
    if success and jsonData then
        writefile(configFileName, jsonData)
        if WindUI then
            WindUI:Notify({
                Title = "Configuration Saved",
                Content = "All X5 Speed settings have been saved!",
                Duration = 3,
                Icon = "save"
            })
        end
    end
end

local function loadConfiguration()
    if isfile(configFileName) then
        local success, jsonData = pcall(readfile, configFileName)
        if success and jsonData then
            local success2, configData = pcall(game.HttpService.JSONDecode, game.HttpService, jsonData)
            if success2 and configData then
                for key, value in pairs(configData) do
                    if featureState[key] ~= nil then
                        featureState[key] = value
                    end
                end
                
                if WindUI then
                    WindUI:Notify({
                        Title = "Configuration Loaded",
                        Content = "X5 Speed settings loaded successfully!",
                        Duration = 3,
                        Icon = "download"
                    })
                end
                return true
            end
        end
    end
    return false
end

Modules.Replion = ModulesTable.Replion
Modules.ItemUtility = ModulesTable.ItemUtility
Modules.FishingController = ModulesTable.FishingController
Modules.EquipToolEvent = ModulesTable.EquipToolEvent
Modules.ChargeRodFunc = ModulesTable.ChargeRodFunc
Modules.StartMinigameFunc = ModulesTable.StartMinigameFunc
Modules.CompleteFishingEvent = ModulesTable.CompleteFishingEvent

local function equipFishingRod()
    if not hasEquippedRod and Modules.EquipToolEvent then
        pcall(Modules.EquipToolEvent.FireServer, Modules.EquipToolEvent, 1)
        hasEquippedRod = true
    end
end

-- ============================================
-- IMPROVED: OPTIMIZED FISH DETECTION
-- ============================================
local lastFishName = ""
local lastFishTime = 0

task.spawn(function()
    local playerGui = LocalPlayer:FindFirstChild("PlayerGui")
    local notificationGui, display, container
    
    while task.wait(0.15) do
        if playerGui then
            -- Cache GUI references untuk performa
            if not notificationGui or not notificationGui.Parent then
                notificationGui = playerGui:FindFirstChild("Small Notification")
            end
            
            if notificationGui and notificationGui.Enabled then
                if not display or not display.Parent then
                    display = notificationGui:FindFirstChild("Display", true)
                end
                
                if display then
                    if not container or not container.Parent then
                        container = display:FindFirstChild("Container", true)
                    end
                    
                    if container then
                        local itemNameLabel = container:FindFirstChild("ItemName")
                        if itemNameLabel and itemNameLabel.Text ~= "" then
                            local currentTime = tick()
                            if itemNameLabel.Text ~= lastFishName and (currentTime - lastFishTime) > 0.08 then
                                lastFishName = itemNameLabel.Text
                                lastFishTime = currentTime
                                fishCaughtBindable:Fire()
                            end
                        end
                    end
                end
            else
                lastFishName = ""
                display = nil
                container = nil
            end
        end
    end
end)

-- ============================================
-- IMPROVED: SAFE CLEANUP
-- ============================================
local function stopAutoFishProcesses()
    featureState.AutoFish = false
    hasEquippedRod = false
    
    -- Cancel threads first (faster)
    for i = #fishingTrove, 1, -1 do
        local item = fishingTrove[i]
        if typeof(item) == "thread" then
            pcall(task.cancel, item)
        elseif typeof(item) == "RBXScriptConnection" then
            pcall(function() item:Disconnect() end)
        end
        fishingTrove[i] = nil
    end
    
    pcall(function()
        if Modules.FishingController and Modules.FishingController.RequestClientStopFishing then
            Modules.FishingController:RequestClientStopFishing(true)
        end
    end)
end

-- ============================================
-- IMPROVED: SMART LOCK WITH AUTO-RELEASE
-- ============================================
local counterLock = false
local lockTime = 0
local MAX_LOCK_TIME = 0.3

local function acquireLock()
    local attempts = 0
    while counterLock and attempts < 150 do
        -- Auto-release stale lock
        if tick() - lockTime > MAX_LOCK_TIME then
            counterLock = false
            warn("Lock auto-released (stale)")
            break
        end
        attempts = attempts + 1
        task.wait()
    end
    
    if attempts >= 150 then
        return false
    end
    
    counterLock = true
    lockTime = tick()
    return true
end

local function releaseLock()
    counterLock = false
    lockTime = 0
end

-- ============================================
-- IMPROVED: BALANCED WORKER METHOD
-- ============================================
local function startAutoFishMethod_Instant()
    if not (Modules.ChargeRodFunc and Modules.StartMinigameFunc and Modules.CompleteFishingEvent and Modules.FishingController) then
        return
    end

    featureState.AutoFish = true

    local chargeCount = 0
    local isCurrentlyResetting = false

    local function worker()
        local workerFailCount = 0
        
        while featureState.AutoFish and LocalPlayer do
            local currentResetTarget = featureState.Instant_ResetCount

            if isCurrentlyResetting or chargeCount >= currentResetTarget then
                break
            end

            local success, err = pcall(function()
                -- Acquire lock with timeout
                if not acquireLock() then
                    return
                end

                if chargeCount >= currentResetTarget then
                    releaseLock()
                    return
                end

                chargeCount = chargeCount + 1
                releaseLock()

                -- Phase 1: Charge & Start (dengan rate limit awareness)
                local serverTime = workspace:GetServerTimeNow()
                Modules.ChargeRodFunc:InvokeServer(nil, nil, nil, serverTime)
                task.wait(featureState.Instant_ChargeDelay)
                
                Modules.StartMinigameFunc:InvokeServer(-139, 1, serverTime)
                task.wait(featureState.Instant_StartDelay)

                if not featureState.AutoFish or isCurrentlyResetting then return end

                -- Phase 2: Controlled Spam (prevent rate limit)
                local spamInterval = math.max(0.04, 0.2 / featureState.Instant_SpamCount)
                
                for i = 1, featureState.Instant_SpamCount do
                    if not featureState.AutoFish or isCurrentlyResetting then break end
                    Modules.CompleteFishingEvent:FireServer()
                    if i < featureState.Instant_SpamCount then
                        task.wait(spamInterval)
                    end
                end

                if not featureState.AutoFish or isCurrentlyResetting then return end

                -- Phase 3: Fish Detection with Timeout
                local gotFishSignal = false
                local connection = nil
                local timeoutActive = true
                
                local timeoutThread = task.delay(featureState.Instant_CatchTimeout, function()
                    timeoutActive = false
                    if connection then
                        pcall(function() connection:Disconnect() end)
                    end
                end)

                connection = fishCaughtBindable.Event:Connect(function()
                    if gotFishSignal then return end
                    gotFishSignal = true
                    timeoutActive = false
                    pcall(task.cancel, timeoutThread)
                    if connection then
                        pcall(function() connection:Disconnect() end)
                    end
                end)

                local waitCount = 0
                while not gotFishSignal and timeoutActive and waitCount < 50 do
                    if not featureState.AutoFish or isCurrentlyResetting then break end
                    waitCount = waitCount + 1
                    task.wait()
                end

                if connection then
                    pcall(function() connection:Disconnect() end)
                end

                -- Phase 4: Cleanup
                if Modules.FishingController and Modules.FishingController.RequestClientStopFishing then
                    pcall(Modules.FishingController.RequestClientStopFishing, Modules.FishingController, true)
                end

                workerFailCount = 0
            end)

            if not success then
                workerFailCount = workerFailCount + 1
                warn("Worker error: ", err)
                
                if workerFailCount >= 3 then
                    warn("Worker stopped (too many fails)")
                    break
                end
                task.wait(0.5)
            end

            if not featureState.AutoFish then break end
            
            -- Rate limit protection: longer delay antar cycle
            task.wait(math.max(featureState.Instant_CycleDelay, 0.05))
        end
    end

    autoFishThread = task.spawn(function()
        while featureState.AutoFish do
            local currentResetTarget = featureState.Instant_ResetCount
            local currentPauseTime = featureState.Instant_ResetPause

            chargeCount = 0
            isCurrentlyResetting = false
            counterLock = false
            lockTime = 0

            local batchTrove = {}
            local batchStartTime = tick()

            -- Spawn workers dengan stagger untuk rate limit
            for i = 1, featureState.Instant_WorkerCount do
                if not featureState.AutoFish then break end
                local workerThread = task.spawn(worker)
                table.insert(batchTrove, workerThread)
                table.insert(fishingTrove, workerThread)
                
                -- Rate limit protection: stagger worker start
                if i < featureState.Instant_WorkerCount then
                    task.wait(0.08)
                end
            end

            -- Monitor dengan timeout dan stuck detection
            local lastChargeCount = 0
            local stuckCheckTime = tick()
            
            while featureState.AutoFish and chargeCount < currentResetTarget do
                local currentTime = tick()
                
                -- Stuck detection
                if currentTime - stuckCheckTime > 1 then
                    if chargeCount == lastChargeCount and counterLock then
                        warn("Batch stuck detected, releasing lock")
                        counterLock = false
                        lockTime = 0
                    end
                    lastChargeCount = chargeCount
                    stuckCheckTime = currentTime
                end
                
                -- Batch timeout (3x expected time)
                if currentTime - batchStartTime > (currentResetTarget * 3) then
                    warn("Batch timeout")
                    break
                end
                
                task.wait()
            end

            isCurrentlyResetting = true

            if featureState.AutoFish then
                for _, thread in ipairs(batchTrove) do
                    pcall(task.cancel, thread)
                end
                
                -- Rate limit protection: pause between batches
                task.wait(math.max(currentPauseTime, 0.2))
            end
        end
        stopAutoFishProcesses()
    end)

    table.insert(fishingTrove, autoFishThread)
end

local function startOrStopAutoFish(shouldStart)
    if shouldStart then
        stopAutoFishProcesses()
        task.wait(0.1)
        featureState.AutoFish = true
        equipFishingRod()
        task.wait(0.05)
        startAutoFishMethod_Instant()
    else
        stopAutoFishProcesses()
    end
end

-- Animation Disabler
local stopAnimConnections = {}
local function setGameAnimationsEnabled(state)
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end

    for _, conn in pairs(stopAnimConnections) do
        pcall(function() conn:Disconnect() end)
    end
    stopAnimConnections = {}

    if state then
        local animator = humanoid:FindFirstChildOfClass("Animator")
        if animator then
            for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
                pcall(function() track:Stop(0) end)
            end

            local conn = animator.AnimationPlayed:Connect(function(track)
                task.defer(function()
                    pcall(function() track:Stop(0) end)
                end)
            end)
            table.insert(stopAnimConnections, conn)
        end

        if WindUI then
            WindUI:Notify({
                Title = "Animation Disabled",
                Content = "All animations from the game have been disabled.",
                Duration = 4,
                Icon = "pause-circle"
            })
        end
    else
        if WindUI then
            WindUI:Notify({
                Title = "Animation Enabled",
                Content = "Animations from the game are reactivated.",
                Duration = 4,
                Icon = "play-circle"
            })
        end
    end
end

task.spawn(function()
    wait(1)
    loadConfiguration()
end)

print("âœ… X5 Speed Balanced Method - Anti Rate Limit!")

-------------------------------------------
----- =======[ NOTIFY FUNCTION ]
-------------------------------------------

local function NotifySuccess(title, message, duration)
    WindUI:Notify({
        Title = title,
        Content = message,
        Duration = duration,
        Icon = "circle-check"
    })
end

local function NotifyError(title, message, duration)
    WindUI:Notify({
        Title = title,
        Content = message,
        Duration = duration,
        Icon = "ban"
    })
end

local function NotifyInfo(title, message, duration)
    WindUI:Notify({
        Title = title,
        Content = message,
        Duration = duration,
        Icon = "info"
    })
end

local function NotifyWarning(title, message, duration)
    WindUI:Notify({
        Title = title,
        Content = message,
        Duration = duration,
        Icon = "triangle-alert"
    })
end

-------------------------------------------
----- =======[ LOAD WINDOW ]
-------------------------------------------


WindUI:AddTheme({
    Name = "Royal Void",
    Accent = WindUI:Gradient({
        ["0"]   = { Color = Color3.fromHex("#FF3366"), Transparency = 0 },  -- Merah Cerah
        ["50"]  = { Color = Color3.fromHex("#1E90FF"), Transparency = 0 },  -- biru Cerah
        ["100"] = { Color = Color3.fromHex("#9B30FF"), Transparency = 0 },  -- Ungu Terang
    }, {
        Rotation = 45,
    }),

    Dialog = Color3.fromHex("#0A0011"),         -- Latar hitam ke ungu gelap
    Outline = Color3.fromHex("#1E90FF"),        -- Pinggir biru Cerah
    Text = Color3.fromHex("#FFE6FF"),           -- Putih ke ungu muda
    Placeholder = Color3.fromHex("#B34A7F"),    -- Ungu-merah pudar
    Background = Color3.fromHex("#050008"),     -- Hitam pekat dengan nuansa ungu
    Button = Color3.fromHex("#FF00AA"),         -- Merah ke ungu neon
    Icon = Color3.fromHex("#0066CC")            -- Aksen biru
})
WindUI.TransparencyValue = 0.2

local Window = WindUI:CreateWindow({
    Title = "Legend Hub X fish it",
    Icon = "crown",
    Author = "By DarkHub",
    Folder = "Legend",
    Size = UDim2.fromOffset(400, 200),
    Transparent = true,
    Theme = "Royal Void",
    KeySystem = false,
    ScrollBarEnabled = true,
    HideSearchBar = true,
    NewElements = true,
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function() end,
    }
})

Window:EditOpenButton({
    Title = "LegendHub",
    Icon = "star",
    CornerRadius = UDim.new(0,30),
    StrokeThickness = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromHex("#FF3366")), -- Merah
        ColorSequenceKeypoint.new(0.5, Color3.fromHex("#1E90FF")), -- biru
        ColorSequenceKeypoint.new(1, Color3.fromHex("#9B30FF")) -- Ungu
    }),
    Draggable = true,
})

local ConfigManager = Window.ConfigManager
local myConfig = ConfigManager:CreateConfig("LegendConfig")

WindUI:SetNotificationLower(true)

WindUI:Notify({
    Title = "LegendHub",
    Content = "All Features Loaded!",
    Duration = 5,
    Image = "square-check-big"
})
-------------------------------------------
----- =======[ ALL TAB ]
-------------------------------------------

local AllMenu = Window:Section({
    Title = "All Menu Here",
    Icon = "tally-3",
    Opened = true,
})

local AutoFish = AllMenu:Tab({
    Title = "Auto Fishing",
    Icon = "fish"
})

local X5SpeedTab = AllMenu:Tab({
    Title = "Ultra Fishing",
    Icon = "zap"
})

local QuestTab = AllMenu:Tab({
    Title = "Auto Quest",
    Icon = "target"
})

local AutoFav = AllMenu:Tab({
    Title = "Auto Favorite",
    Icon = "star"
})

local AutoFarmTab = AllMenu:Tab({
    Title = "Auto Farm",
    Icon = "leaf"
})

local AutoFarmArt = AllMenu:Tab({
    Title = "Auto Farm Artifact",
    Icon = "flask-round"
})

local Trade = AllMenu:Tab({
    Title = "Trade",
    Icon = "handshake"
})

_G.DStones = AllMenu:Tab({
    Title = "Double Enchant",
    Icon = "gem"
})

local Player = AllMenu:Tab({
    Title = "Player",
    Icon = "users-round"
})

local Utils = AllMenu:Tab({
    Title = "Utility",
    Icon = "earth"
})

local SettingsTab = AllMenu:Tab({
    Title = "Settings",
    Icon = "cog"
})

-------------------------------------------
----- =======[ AUTO FISH TAB ]
-------------------------------------------

_G.REFishingStopped = ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net["RE/FishingStopped"]
_G.RFCancelFishingInputs = ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net["RF/CancelFishingInputs"]
_G.REUpdateChargeState = ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net["RE/UpdateChargeState"]


_G.StopFishing = function()
    _G.RFCancelFishingInputs:InvokeServer()
    firesignal(_G.REFishingStopped.OnClientEvent)
end

local FuncAutoFish = {
    REReplicateTextEffect = ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net["RE/ReplicateTextEffect"],
    autofish5x = false,
    perfectCast5x = true,
    fishingActive = false,
    delayInitialized = false,
    lastCatchTime5x = 0,
    CatchLast = tick(),
}



_G.REFishCaught = ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net["RE/FishCaught"]
_G.REPlayFishingEffect = ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net["RE/PlayFishingEffect"]
_G.equipRemote = ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net["RE/EquipToolFromHotbar"]
_G.REObtainedNewFishNotification = ReplicatedStorage
    .Packages._Index["sleitnick_net@0.2.0"]
    .net["RE/ObtainedNewFishNotification"]


_G.isSpamming = false
_G.rSpamming = false
_G.spamThread = nil
_G.rspamThread = nil
_G.lastRecastTime = 0
_G.DELAY_ANTISTUCK = 10
_G.isRecasting5x = false
_G.STUCK_TIMEOUT = 10
_G.AntiStuckEnabled = false
_G.lastFishTime = tick()
_G.FINISH_DELAY = 1
_G.obtainedFishUUIDs = {}
_G.obtainedLimit = 30
_G.sellActive = false
_G.AutoFishHighQuality = false
_G.hasEquippedRod = false
_G.RecoveryRunning = false
_G.RecoveryTimeout = 30

_G.RemotePackage = ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net
_G.RemoteFish = _G.RemotePackage["RE/ObtainedNewFishNotification"]
_G.RemoteSell = _G.RemotePackage["RF/SellAllItems"]

_G.RemoteFish.OnClientEvent:Connect(function(_, _, data)
    if _G.sellActive and data and data.InventoryItem and data.InventoryItem.UUID then
        table.insert(_G.obtainedFishUUIDs, data.InventoryItem.UUID)
    end
end)

local function sellItems()
    if #_G.obtainedFishUUIDs > 0 then
        _G.RemoteSell:InvokeServer()
        print("[Auto Sell] Selling all fishes (" .. tostring(#_G.obtainedFishUUIDs) .. ")")
    end
    _G.obtainedFishUUIDs = {}
end

task.spawn(function()
    while task.wait(0.5) do
        if _G.sellActive and #_G.obtainedFishUUIDs >= tonumber(_G.obtainedLimit) then
            sellItems()
            task.wait(0.5)
        end
    end
end)

function _G.RecastSpam()
    if _G.rSpamming then return end
    _G.rSpamming = true
    _G.rspamThread = task.spawn(function()
        while _G.rSpamming do
            local ok, err = pcall(StartCast5X)
            if not ok then
                warn("StartCast5X error:", err)
                break
            end
        end
    end)
end

function _G.StopRecastSpam()
    _G.rSpamming = false
end
    

function _G.startSpam()
    if _G.isSpamming then return end
    _G.isSpamming = true
    _G.spamThread = task.spawn(function()
    while _G.isSpamming do
        task.wait(tonumber(_G.FINISH_DELAY))
        finishRemote:FireServer()
        end
    end)
end
    
function _G.stopSpam()
   _G.isSpamming = false
end

_G.REPlayFishingEffect.OnClientEvent:Connect(function(player, head, data)
    if player == Players.LocalPlayer and FuncAutoFish.autofish5x then
        _G.StopRecastSpam()
    end
end)


_G.REObtainedNewFishNotification.OnClientEvent:Connect(function(...)
    _G.lastFishTime = tick()
end)

task.spawn(function()
	while task.wait(1) do
		if _G.AntiStuckEnabled then
			if tick() - _G.lastFishTime > tonumber(_G.STUCK_TIMEOUT) then
				StopAutoFish5X()
				task.wait(0.5)
				StartAutoFish5X()
				_G.lastFishTime = tick()
			end
		end
	end
end)

FuncAutoFish.REReplicateTextEffect.OnClientEvent:Connect(function(data)
    if FuncAutoFish.autofish5x 
    and data and data.TextData 
    and data.TextData.EffectType == "Exclaim" then
    	local myHead = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("Head")
    	if myHead and data.Container == myHead then
    		_G.startSpam()
    	end
    end
end)

_G.REFishCaught.OnClientEvent:Connect(function(fishName, info)
    if FuncAutoFish.autofish5x then
        _G.stopSpam()
        _G.StopFishing()
        _G.RecastSpam()
    end
end)

function StartCast5X()
    local getPowerFunction = Constants.GetPower
    local perfectThreshold = 0.99
    local chargeStartTime = workspace:GetServerTimeNow()
    rodRemote:InvokeServer(chargeStartTime)
    local calculationLoopStart = tick()
    local timeoutDuration = 1
    local lastPower = 0
    while (tick() - calculationLoopStart < timeoutDuration) do
        local currentPower = getPowerFunction(Constants, chargeStartTime)
        if currentPower < lastPower and lastPower >= perfectThreshold then
            break
        end

        lastPower = currentPower
        task.wait(0)
    end
    miniGameRemote:InvokeServer(-1.25, 1.0, workspace:GetServerTimeNow())
end

function StopCast()
    _G.StopFishing()
end


function StartAutoFish5X()
    if _G.RecoveryRunning then return end
    StopAutoFish5X()
    task.wait(0.5)

    FuncAutoFish.autofish5x = true
    FuncAutoFish.CatchLast5x = tick()

    if not _G.hasEquippedRod then
        _G.equipRemote:FireServer(1)
        _G.hasEquippedRod = true
        task.wait(0.3)
    end

    StartCast5X()

    -- Simpan thread biar bisa dimatiin nanti
    _G.autoFishThread = task.spawn(function()
        while FuncAutoFish.autofish5x do
            local gotFish = false
            local connection

            connection = _G.REFishCaught.OnClientEvent:Connect(function()
                gotFish = true
                _G.lastFishTime = tick()
            end)

            local timeout = tick()
            while tick() - timeout < 10 do
                if not FuncAutoFish.autofish5x then break end
                if gotFish then break end
                task.wait(0.25)
            end

            if connection and connection.Connected then
                connection:Disconnect()
            end
            if not FuncAutoFish.autofish5x then break end

            _G.StopFishing()
            task.wait(gotFish and 0.5 or 1)
            if FuncAutoFish.autofish5x then
                StartCast5X()
            end
        end
    end)
end

function StopAutoFish5X()
    -- ðŸ”´ Matikan flag utama
    FuncAutoFish.autofish5x = false
    FuncAutoFish.delayInitialized = false

    -- ðŸ”´ Hentikan proses memancing
    _G.StopFishing()

    -- ðŸ”´ Matikan semua status/spam
    _G.isSpamming = false
    _G.rSpamming = false
    _G.isRecasting5x = false

    -- ðŸ”´ Hentikan semua thread aktif (auto fish, spam, dll)
    if _G.autoFishThread then
        task.cancel(_G.autoFishThread)
        _G.autoFishThread = nil
    end
    if _G.spamThread then
        task.cancel(_G.spamThread)
        _G.spamThread = nil
    end
    if _G.rspamThread then
        task.cancel(_G.rspamThread)
        _G.rspamThread = nil
    end

    -- ðŸ”´ Matikan recovery loop kalau ada
    if _G.recoveryThread then
        task.cancel(_G.recoveryThread)
        _G.recoveryThread = nil
    end
    _G.RecoveryRunning = false

    -- ðŸ”´ Reset animasi rod
    pcall(function()
        RodIdle:Stop()
        RodShake:Stop()
    end)

    -- ðŸ”´ Debug optional (bisa dihapus)
    warn("[AutoFish] Semua proses dihentikan total.")
end

--[[

INI AUTO FISH LEGIT 

]]


_G.RunService = game:GetService("RunService")
_G.ReplicatedStorage = game:GetService("ReplicatedStorage")
_G.FishingControllerPath = _G.ReplicatedStorage.Controllers.FishingController
_G.FishingController = require(_G.FishingControllerPath)

_G.AutoFishingControllerPath = _G.ReplicatedStorage.Controllers.AutoFishingController
_G.AutoFishingController = require(_G.AutoFishingControllerPath)
_G.Replion = require(_G.ReplicatedStorage.Packages.Replion)

_G.AutoFishState = {
    IsActive = false,
    MinigameActive = false
}

_G.SPEED_LEGIT = 0.05

function _G.performClick()
    _G.FishingController:RequestFishingMinigameClick()
    task.wait(tonumber(_G.SPEED_LEGIT))
end

_G.originalAutoFishingStateChanged = _G.AutoFishingController.AutoFishingStateChanged
function _G.forceActiveVisual(arg1)
    _G.originalAutoFishingStateChanged(true)
end

_G.AutoFishingController.AutoFishingStateChanged = _G.forceActiveVisual

function _G.ensureServerAutoFishingOn()
    local replionData = _G.Replion.Client:WaitReplion("Data")
    local currentAutoFishingState = replionData:GetExpect("AutoFishing")

    if not currentAutoFishingState then
        local remoteFunctionName = "UpdateAutoFishingState"
        local Net = require(_G.ReplicatedStorage.Packages.Net)
        local UpdateAutoFishingRemote = Net:RemoteFunction(remoteFunctionName)

        local success, result = pcall(function()
            return UpdateAutoFishingRemote:InvokeServer(true)
        end)

        if success then
        else
        end
    else
    end
end

-- ===================================================================
-- BAGIAN 2: AUTO CLICK MINIGAME
-- ===================================================================

_G.originalRodStarted = _G.FishingController.FishingRodStarted
_G.originalFishingStopped = _G.FishingController.FishingStopped
_G.clickThread = nil

-- Hook FishingRodStarted (Minigame Aktif)
_G.FishingController.FishingRodStarted = function(self, arg1, arg2)
    _G.originalRodStarted(self, arg1, arg2)

    if _G.AutoFishState.IsActive and not _G.AutoFishState.MinigameActive then
        _G.AutoFishState.MinigameActive = true

        if _G.clickThread then
            task.cancel(_G.clickThread)
        end

        _G.clickThread = task.spawn(function()
            while _G.AutoFishState.IsActive and _G.AutoFishState.MinigameActive do
                _G.performClick()
            end
        end)
    end
end

_G.FishingController.FishingStopped = function(self, arg1)
    _G.originalFishingStopped(self, arg1)

    if _G.AutoFishState.MinigameActive then
        _G.AutoFishState.MinigameActive = false
        task.wait(1)
        _G.ensureServerAutoFishingOn()
    end
end

function _G.ToggleAutoClick(shouldActivate)
    _G.AutoFishState.IsActive = shouldActivate

    if shouldActivate then
        _G.ensureServerAutoFishingOn()
    else
        if _G.clickThread then
            task.cancel(_G.clickThread)
            _G.clickThread = nil
        end
        _G.AutoFishState.MinigameActive = false
    end
end

_G.FishSec = AutoFish:Section({
    Title = "Auto Fishing",
    TextSize = 22,
    TextXAlignment = "Center",
    Opened = true
})

_G.FishSec:Slider({
    Title = "Delay Finish",
    Desc = [[
Delay Settings
]],
    Step = 0.01,
    Value = {
        Min = 0.01,
        Max = 5,
        Default = _G.FINISH_DELAY,
    },
    Callback = function(value)
        _G.FINISH_DELAY = value
    end
})

_G.AutoFishes = _G.FishSec:Toggle({
    Title = "Auto Fish Instant",
    Callback = function(value)
        if value then
            StartAutoFish5X()
        else
            StopAutoFish5X()
        end
    end
})

_G.FishSec:Space()

_G.RecastCD = _G.FishSec:Slider({
    Title = "Delay Otomatis",
    Step = 0.01,
    Value = {
        Min = 0.01,
        Max = 5,
        Default = _G.SPEED_LEGIT,
    },
    Callback = function(value)
        _G.SPEED_LEGIT = value
    end
})

_G.FishSec:Toggle({
    Title = "Auto Fish Otomatis",
    Value = false,
    Callback = function(state)
        _G.equipRemote:FireServer(1)
        _G.ToggleAutoClick(state)

        local playerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
        local fishingGui = playerGui:WaitForChild("Fishing"):WaitForChild("Main")
        local chargeGui = playerGui:WaitForChild("Charge"):WaitForChild("Main")

        if state then
            fishingGui.Visible = false
            chargeGui.Visible = false
        else
            fishingGui.Visible = true
            chargeGui.Visible = true
        end
    end
})

_G.FishSec:Space()

_G.FishSec = AutoFish:Section({
    Title = "AUTO FISHING",
    TextSize = 22,
    TextXAlignment = "Center",
    Opened = true
})

_G.FishSec:Toggle({
    Title = "AUTO FISHING - NEW METHOD",
    Desc = "Extreme speed fishing mode (FIXED)",
    Value = Config.AutoFishingNewMethod,
    Callback = function(Value)
        Config.AutoFishingNewMethod = Value
        if Value then
            _G.AutoFishingNewMethod()
            NotifySuccess("New Method", "Extreme speed mode activated!")
        else
            NotifyWarning("New Method", "Fishing stopped")
        end
    end
})

myConfig:Register("AutoFishingNewMethod", autoFishToggle)

_G.FishSec:Space()

-- FIXED SLIDER: Format yang benar sesuai WindUI
_G.FishSec:Slider({
    Title = "Fishing Delay",
    Desc = "Adjust fishing speed (lower = faster)",
    Step = 0.1,
    Value = {
        Min = 0.1,
        Max = 5,
        Default = Config.FishingDelay,
    },
    Callback = function(value)
        Config.FishingDelay = value
    end
})

_G.FishSec:Space()

_G.FishSec:Slider({
    Title = "Sell Threshold",
    Step = 1,
    Value = {
        Min = 1,
        Max = 6000,
        Default = 30,
    },
    Callback = function(value)
        _G.obtainedLimit = value
    end
})

_G.FishSec:Slider({
    Title = "Anti Stuck Delay",
    Step = 1,
    Value = {
        Min = 1,
        Max = 6000,
        Default = _G.STUCK_TIMEOUT,
    },
    Callback = function(value)
        _G.STUCK_TIMEOUT = value
    end
})

_G.FishSec:Toggle({
    Title = "Auto Sell",
    Value = false,
    Callback = function(state)
        _G.sellActive = state
        if state then
            NotifySuccess("Auto Sell", "Limit: " .. _G.obtainedLimit)
        else
            NotifySuccess("Auto Sell", "Disabled")
        end
    end
})

_G.FishSec:Toggle({
	Title = "Anti Stuck",
	Value = false,
	Callback = function(state)
		_G.AntiStuckEnabled = state
	end
})


_G.FishSec:Space()


_G.FishSec:Button({
    Title = "Stop Fishing",
    Locked = false,
    Justify = "Center",
    Icon = "",
    Callback = function()
        _G.StopFishing()
        RodIdle:Stop()
        RodIdle:Stop()
        _G.stopSpam()
        _G.StopRecastSpam()
    end
})

_G.FishSec:Space()


_G.REReplicateCutscene = ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net["RE/ReplicateCutscene"]
_G.BlockCutsceneEnabled = false


_G.FishSec:Toggle({
    Title = "Block Cutscene",
    Value = false,
    Callback = function(state)
        _G.BlockCutsceneEnabled = state
        print("Block Cutscene: " .. tostring(state))
    end
})

_G.REReplicateCutscene.OnClientEvent:Connect(function(rarity, player, position, fishName, data)
    if _G.BlockCutsceneEnabled then
        print("[LegendHub] Cutscene diblokir:", fishName, "(Rarity:", rarity .. ")")
        return nil -- blokir event agar tidak muncul cutscene
    end
end)

_G.FishSec:Input({
    Title = "Max Inventory Size",
    Value = tostring(Constants.MaxInventorySize or 0),
    Placeholder = "Input Number...",
    Callback = function(input)
        local newSize = tonumber(input)
        if not newSize then
            NotifyWarning("Inventory Size", "Must be numbers!")
            return
        end
        Constants.MaxInventorySize = newSize
    end
})

local REEquipItem = ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net["RE/EquipItem"]
local RFSellItem = ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net["RF/SellItem"]

function ToggleAutoSellMythic(state)
    autoSellMythic = state
    if autoSellMythic then
        NotifySuccess("AutoSellMythic", "Status: ON")
    else
        NotifyWarning("AutoSellMythic", "Status: OFF")
    end
end

local oldFireServer
oldFireServer = hookmetamethod(game, "__namecall", function(self, ...)
    local args = { ... }
    local method = getnamecallmethod()

    if autoSellMythic
        and method == "FireServer"
        and self == REEquipItem
        and typeof(args[1]) == "string"
        and args[2] == "Fishes" then
        local uuid = args[1]

        task.delay(1, function()
            pcall(function()
                local result = RFSellItem:InvokeServer(uuid)
                if result then
                    NotifySuccess("AutoSellMythic", "Items Sold!!")
                else
                    NotifyError("AutoSellMythic", "Failed to sell item!!")
                end
            end)
        end)
    end

    return oldFireServer(self, ...)
end)

_G.FishSec:Toggle({
    Title = "Auto Sell Mythic",
    Desc = "Automatically sells clicked fish",
    Default = false,
    Callback = function(state)
        ToggleAutoSellMythic(state)
    end
})


function sellAllFishes()
    local charFolder = workspace:FindFirstChild("Characters")
    local char = charFolder and charFolder:FindFirstChild(LocalPlayer.Name)
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then
        NotifyError("Character Not Found", "HRP tidak ditemukan.")
        return
    end

    local originalPos = hrp.CFrame
    local sellRemote = net:WaitForChild("RF/SellAllItems")

    task.spawn(function()
        NotifyInfo("Selling...", "I'm going to sell all the fish, please wait...", 3)

        task.wait(1)
        local success, err = pcall(function()
            sellRemote:InvokeServer()
        end)

        if success then
            NotifySuccess("Sold!", "All the fish were sold successfully.", 3)
        else
            NotifyError("Sell Failed", tostring(err, 3))
        end
    end)
end

_G.FishSec:Space()

_G.FishSec:Button({
    Title = "Sell All Fishes",
    Locked = false,
    Justify = "Center",
    Icon = "",
    Callback = function()
        sellAllFishes()
    end
})

_G.FishSec:Space()

_G.FishSec:Button({
    Title = "Auto Enchant Rod",
    Justify = "Center",
    Icon = "",
    Callback = function()
        local ENCHANT_POSITION = Vector3.new(3231, -1303, 1402)
        local char = workspace:WaitForChild("Characters"):FindFirstChild(LocalPlayer.Name)
        local hrp = char and char:FindFirstChild("HumanoidRootPart")

        if not hrp then
            NotifyError("Auto Enchant Rod", "Failed to get character HRP.")
            return
        end

        NotifyInfo("Preparing Enchant...", "Please manually place Enchant Stone into slot 5 before we begin...", 5)

        task.wait(3)

        local Player = game:GetService("Players").LocalPlayer
        local slot5 = Player.PlayerGui.Backpack.Display:GetChildren()[10]

        local itemName = slot5 and slot5:FindFirstChild("Inner") and slot5.Inner:FindFirstChild("Tags") and
        slot5.Inner.Tags:FindFirstChild("ItemName")

        if not itemName or not itemName.Text:lower():find("enchant") then
            NotifyError("Auto Enchant Rod", "Slot 5 does not contain an Enchant Stone.")
            return
        end

        NotifyInfo("Enchanting...", "It is in the process of Enchanting, please wait until the Enchantment is complete",
            7)

        local originalPosition = hrp.Position
        task.wait(1)
        hrp.CFrame = CFrame.new(ENCHANT_POSITION + Vector3.new(0, 5, 0))
        task.wait(1.2)

        local equipRod = net:WaitForChild("RE/EquipToolFromHotbar")
        local activateEnchant = net:WaitForChild("RE/ActivateEnchantingAltar")

        pcall(function()
            equipRod:FireServer(5)
            task.wait(0.5)
            activateEnchant:FireServer()
            task.wait(7)
            NotifySuccess("Enchant", "Successfully Enchanted!", 3)
        end)

        task.wait(0.9)
        hrp.CFrame = CFrame.new(originalPosition + Vector3.new(0, 3, 0))
    end
})

_G.FishSec:Space()

-------------------------------------------
----- =======[ AUTO FAV TAB ]
-------------------------------------------


local GlobalFav = {
    REObtainedNewFishNotification = ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net
    ["RE/ObtainedNewFishNotification"],
    REFavoriteItem = ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net["RE/FavoriteItem"],

    FishIdToName = {},
    FishNameToId = {},
    FishNames = {},
    Variants = {},
    SelectedFishIds = {},
    SelectedVariants = {},
    AutoFavoriteEnabled = false
}

for _, item in pairs(ReplicatedStorage.Items:GetChildren()) do
    local ok, data = pcall(require, item)
    if ok and data.Data and data.Data.Type == "Fish" then
        local id = data.Data.Id
        local name = data.Data.Name
        GlobalFav.FishIdToName[id] = name
        GlobalFav.FishNameToId[name] = id
        table.insert(GlobalFav.FishNames, name)
    end
end

-- Load Variants
for _, variantModule in pairs(ReplicatedStorage.Variants:GetChildren()) do
    local ok, variantData = pcall(require, variantModule)
    if ok and variantData.Data.Name then
        local name = variantData.Data.Name
        GlobalFav.Variants[name] = name
    end
end

AutoFav:Section({
    Title = "Auto Favorite Menu",
    TextSize = 22,
    TextXAlignment = "Center",
})

AutoFav:Toggle({
    Title = "Enable Auto Favorite",
    Value = false,
    Callback = function(state)
        GlobalFav.AutoFavoriteEnabled = state
        if state then
            NotifySuccess("Auto Favorite", "Auto Favorite feature enabled")
        else
            NotifyWarning("Auto Favorite", "Auto Favorite feature disabled")
        end
    end
})

local AllFishNames = GlobalFav.FishNames

_G.FishList = AutoFav:Dropdown({
    Title = "Auto Favorite Fishes",
    Values = AllFishNames,
    Multi = true,
    AllowNone = true,
    SearchBarEnabled = true,
    Callback = function(selectedNames)
        GlobalFav.SelectedFishIds = {}

        for _, name in ipairs(selectedNames) do
            local id = GlobalFav.FishNameToId[name]
            if id then
                GlobalFav.SelectedFishIds[id] = true
            end
        end

        NotifyInfo("Auto Favorite", "Favoriting active for fish: " .. HttpService:JSONEncode(selectedNames))
    end
})


AutoFav:Dropdown({
    Title = "Auto Favorite Variants",
    Values = GlobalFav.Variants,
    Multi = true,
    AllowNone = true,
    SearchBarEnabled = true,
    Callback = function(selectedVariants)
        GlobalFav.SelectedVariants = {}
        for _, vName in ipairs(selectedVariants) do
            for vId, name in pairs(GlobalFav.Variants) do
                if name == vName then
                    GlobalFav.SelectedVariants[vId] = true
                end
            end
        end
        NotifyInfo("Auto Favorite", "Favoriting active for variants: " .. HttpService:JSONEncode(selectedVariants))
    end
})


GlobalFav.REObtainedNewFishNotification.OnClientEvent:Connect(function(itemId, _, data)
    if not GlobalFav.AutoFavoriteEnabled then return end

    local uuid = data.InventoryItem and data.InventoryItem.UUID
    local fishName = GlobalFav.FishIdToName[itemId] or "Unknown"
    local variantId = data.InventoryItem.Metadata and data.InventoryItem.Metadata.VariantId

    if not uuid then return end

    local isFishSelected = GlobalFav.SelectedFishIds[itemId]
    local isVariantSelected = variantId and GlobalFav.SelectedVariants[variantId]

    local shouldFavorite = false

    if isFishSelected and (not next(GlobalFav.SelectedVariants)) then
        shouldFavorite = true
    elseif (not next(GlobalFav.SelectedFishIds)) and isVariantSelected then
        shouldFavorite = true
    elseif isFishSelected and isVariantSelected then
        shouldFavorite = true
    end

    if shouldFavorite then
        GlobalFav.REFavoriteItem:FireServer(uuid)
        local msg = "Favorited " .. fishName
        if isVariantSelected then
            msg = msg .. " (" .. (GlobalFav.Variants[variantId] or variantId) .. " Variant)"
        end
        NotifySuccess("Auto Favorite", msg .. "!")
    end
end)


-------------------------------------------
----- =======[ AUTO FARM TAB ]
-------------------------------------------


local floatPlatform = nil

local function floatingPlat(enabled)
    if enabled then
        local charFolder = workspace:WaitForChild("Characters", 5)
        local char = charFolder:FindFirstChild(LocalPlayer.Name)
        if not char then return end

        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end

        floatPlatform = Instance.new("Part")
        floatPlatform.Anchored = true
        floatPlatform.Size = Vector3.new(10, 1, 10)
        floatPlatform.Transparency = 1
        floatPlatform.CanCollide = true
        floatPlatform.Name = "FloatPlatform"
        floatPlatform.Parent = workspace

        task.spawn(function()
            while floatPlatform and floatPlatform.Parent do
                pcall(function()
                    floatPlatform.Position = hrp.Position - Vector3.new(0, 3.5, 0)
                end)
                task.wait(0.1)
            end
        end)

        NotifySuccess("Float Enabled", "This feature has been successfully activated!")
    else
        if floatPlatform then
            floatPlatform:Destroy()
            floatPlatform = nil
        end
        NotifyWarning("Float Disabled", "Feature disabled")
    end
end



local workspace = game:GetService("Workspace")

local BlockEnabled = false

local function createLocalBlock(size, position, color)
    local part = Instance.new("Part")
    part.Size = size or Vector3.new(5, 1, 5)
    part.Position = position or
    (LocalPlayer.Character and LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, -3, 0)) or
    Vector3.new(0, 5, 0)
    part.Anchored = true
    part.CanCollide = true
    part.Color = color or Color3.fromRGB(0, 0, 255)
    part.Material = Enum.Material.ForceField
    part.Name = "LocalBlock"
    part.Parent = workspace
    return part
end


local function createBlockUnderPlayer()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local hrp = LocalPlayer.Character.HumanoidRootPart
        if workspace:FindFirstChild("LocalBlock") then
            workspace.LocalBlock:Destroy()
        end
        createLocalBlock(Vector3.new(6, 1, 6), hrp.Position - Vector3.new(0, 3, 0), Color3.fromRGB(0, 0, 255))
    end
end


local function ToggleBlockOnce(state)
    BlockEnabled = state
    if state then
        createBlockUnderPlayer()
    else
        if workspace:FindFirstChild("LocalBlock") then
            workspace.LocalBlock:Destroy()
        end
    end
end

local function getPartRecursive(o)
    if o:IsA("BasePart") then return o end
    for _, c in ipairs(o:GetChildren()) do
        local p = getPartRecursive(c)
        if p then return p end
    end
    return nil
end

local eventMap = {
    ["Shark Hunt"]         = { name = "Shark Hunt", part = "Color" },
    ["Ghost Shark Hunt"]   = { name = "Ghost Shark Hunt", part = "Part" },
    ["Worm Hunt"]          = { name = "Model", part = "Part" },
    ["Black Hole"]         = { name = "BlackHole", part = nil },
    ["Meteor Rain"]        = { name = "MeteorRain", part = nil },
    ["Ghost Worm"]         = { name = "Model", part = "Part" },
    ["Shocked"]            = { name = "Shocked", part = nil },
    ["Megalodon Hunt"]     = { name = "Megalodon Hunt", part = "Color" },
}

local eventNames = {}
for _, data in pairs(eventMap) do
    if data.name ~= "Model" then
        table.insert(eventNames, data.name)
    end
end
table.insert(eventNames, "Worm Hunt") 
table.insert(eventNames, "Ghost Worm")

local autoTPEvent = false
local savedCFrame = nil
local alreadyTeleported = false
local teleportTime = nil
local selectedEvent = nil

local function teleportTo(position)
    local char = workspace:FindFirstChild("Characters"):FindFirstChild(LocalPlayer.Name)
    if char and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame = CFrame.new(position + Vector3.new(0, 20, 0))
    end
end

local function saveOriginalPosition()
    local char = workspace:FindFirstChild("Characters"):FindFirstChild(LocalPlayer.Name)
    if char and char:FindFirstChild("HumanoidRootPart") then
        savedCFrame = char.HumanoidRootPart.CFrame
    end
end

local function returnToOriginalPosition()
    if savedCFrame then
        local char = workspace:FindFirstChild("Characters"):FindFirstChild(LocalPlayer.Name)
        if char and char:FindFirstChild("HumanoidRootPart") then
            char.HumanoidRootPart.CFrame = savedCFrame
        end
    end
end

local function findEventModel(eventName)
    local menuRings = workspace:FindFirstChild("!!! MENU RINGS")
    if not menuRings then return nil end
    
    local props = menuRings:FindFirstChild("Props")
    if not props then return nil end

    local targetEventData = nil
    

    for uiName, data in pairs(eventMap) do
        if uiName == eventName then
            targetEventData = data
            break
        end
    end

    if not targetEventData then return nil end
    
    local eventModel = props:FindFirstChild(targetEventData.name) 

    if eventModel and eventModel:IsA("Model") then
        local targetPart = nil
        
        -- Megalodon
        if eventName == "Megalodon Hunt" then
            targetPart = eventModel:FindFirstChild("Color")
        -- Ghost Shark Hunt
        elseif eventName == "Ghost Shark Hunt" then
            targetPart = eventModel:FindFirstChild("Part")
        -- Worm Hunt / Ghost Worm
        elseif eventName == "Worm Hunt" or eventName == "Ghost Worm" then
            targetPart = eventModel:FindFirstChild("Part")
        -- Event Lainnya (Black Hole, Meteor Rain, Shark Hunt)
        elseif targetEventData.part then
            targetPart = eventModel:FindFirstChild(targetEventData.part)
        end
        
        -- Fallback ke PrimaryPart atau Recursive Part
        if targetPart and targetPart:IsA("BasePart") then
            return targetPart
        elseif eventModel.PrimaryPart and eventModel.PrimaryPart:IsA("BasePart") then
            return eventModel.PrimaryPart
        else 
            return getPartRecursive(eventModel) -- Coba temukan BasePart apa pun di dalamnya
        end
    end
    
    return nil
end

-- loop utama
local function monitorAutoTP()
    while true do
        if autoTPEvent and selectedEvent then
            local eventModel = findEventModel(selectedEvent)

            if eventModel and not alreadyTeleported then
                saveOriginalPosition()

                local targetPos
                if eventModel:IsA("BasePart") then
                    targetPos = eventModel.Position
                elseif eventModel:IsA("Model") then
                    targetPos = eventModel:GetPivot().Position
                end

                if targetPos then
                    teleportTo(targetPos)
                    if typeof(ToggleBlockOnce) == "function" then
                        ToggleBlockOnce(true)
                    end
                    alreadyTeleported = true
                    teleportTime = tick()
                    NotifySuccess("Event Farm", "Teleported to: " .. selectedEvent)
                end
            elseif alreadyTeleported then
                -- timeout 15 menit
                if teleportTime and (tick() - teleportTime >= 900) then
                    returnToOriginalPosition()
                    if typeof(ToggleBlockOnce) == "function" then
                        ToggleBlockOnce(false)
                    end
                    alreadyTeleported = false
                    teleportTime = nil
                    NotifyInfo("Event Timeout", "Returned after 15 minutes.")
                    -- event hilang
                elseif not eventModel then
                    returnToOriginalPosition()
                    if typeof(ToggleBlockOnce) == "function" then
                        ToggleBlockOnce(false)
                    end
                    alreadyTeleported = false
                    teleportTime = nil
                    NotifyInfo("Event Ended", "Returned to start position.")
                end
            end
        else
            -- autoTP mati
            if alreadyTeleported then
                returnToOriginalPosition()
                if typeof(ToggleBlockOnce) == "function" then
                    ToggleBlockOnce(false)
                end
                alreadyTeleported = false
                teleportTime = nil
            end
        end
        task.wait(1)
    end
end

task.spawn(monitorAutoTP)

local isAutoFarmRunning = false

local islandCodes = {
    ["01"] = "Crater Islands",
    ["02"] = "Tropical Grove",
    ["03"] = "Vulcano",
    ["04"] = "Coral Reefs",
    ["05"] = "Winter",
    ["06"] = "Machine",
    ["07"] = "Treasure Room",
    ["08"] = "Sisyphus Statue",
    ["09"] = "Fisherman Island",
    ["10"] = "Esoteric Depths",
    ["11"] = "Kohana",
    ["12"] = "Underground Cellar",
    ["13"] = "Ancient Jungle",
    ["14"] = "Secret Farm Ancient",
    ["15"] = "The Temple (Unlock First)",
    ["16"] = "Hallowen Bay",
    ["17"] = "Crystal Cavern"
}

local farmLocations = {
    ["Crater Islands"] = {
        CFrame.new(1066.1864, 57.2025681, 5045.5542, -0.682534158, 1.00865822e-08, 0.730853677, -5.8900711e-09, 1,
            -1.93017531e-08, -0.730853677, -1.74788859e-08, -0.682534158),
        CFrame.new(1057.28992, 33.0884132, 5133.79883, 0.833871782, 5.44149223e-08, 0.551958203, -6.58184218e-09, 1,
            -8.86416984e-08, -0.551958203, 7.02829084e-08, 0.833871782),
        CFrame.new(988.954712, 42.8254471, 5088.71289, -0.849417388, -9.89310394e-08, 0.527721584, -5.96115086e-08, 1,
            9.15179328e-08, -0.527721584, 4.62786431e-08, -0.849417388),
        CFrame.new(1006.70685, 17.2302666, 5092.14844, -0.989664078, 5.6538525e-09, -0.143405005, 9.14879283e-09, 1,
            -2.3711717e-08, 0.143405005, -2.47786183e-08, -0.989664078),
        CFrame.new(1025.02356, 2.77259707, 5011.47021, -0.974474192, -6.87871804e-08, 0.224499553, -4.47472104e-08, 1,
            1.12170284e-07, -0.224499553, 9.92613209e-08, -0.974474192),
        CFrame.new(1071.14551, 3.528404, 5038.00293, -0.532300115, 3.38677708e-08, 0.84655571, 6.69992914e-08, 1,
            2.12149165e-09, -0.84655571, 5.7847906e-08, -0.532300115),
        CFrame.new(1022.55457, 16.6277809, 5066.28223, 0.721996129, 0, -0.691897094, 0, 1, 0, 0.691897094, 0, 0.721996129),
    },
    ["Tropical Grove"] = {
        CFrame.new(-2165.05469, 2.77070165, 3639.87451, -0.589090407, -3.61497356e-08, -0.808067143, -3.20645626e-08, 1,
            -2.13606164e-08, 0.808067143, 1.3326984e-08, -0.589090407)
    },
    ["Vulcano"] = {
        CFrame.new(-701.447937, 48.1446075, 93.1546631, -0.0770962164, 1.34335654e-08, -0.997023642, 9.84464776e-09, 1,
            1.27124169e-08, 0.997023642, -8.83526763e-09, -0.0770962164),
        CFrame.new(-654.994934, 57.2567711, 75.098526, -0.540957272, 2.58946509e-09, -0.841050088, -7.58775585e-08, 1,
            5.18827363e-08, 0.841050088, 9.1883166e-08, -0.540957272),
    },
    ["Coral Reefs"] = {
        CFrame.new(-3118.39624, 2.42531538, 2135.26392, 0.92336154, -1.0069185e-07, -0.383931547, 8.0607947e-08, 1,
            -6.84016968e-08, 0.383931547, 3.22115596e-08, 0.92336154),
    },
    ["Winter"] = {
        CFrame.new(2036.15308, 6.54998732, 3381.88916, 0.943401575, 4.71338666e-08, -0.331652641, -3.28136842e-08, 1,
            4.87781051e-08, 0.331652641, -3.51345975e-08, 0.943401575),
    },
    ["Machine"] = {
        CFrame.new(-1459.3772, 14.7103214, 1831.5188, 0.777951121, 2.52131862e-08, -0.628324807, -5.24126378e-08, 1,
            -2.47663063e-08, 0.628324807, 5.21991339e-08, 0.777951121)
    },
    ["Treasure Room"] = {
        CFrame.new(-3625.0708, -279.074219, -1594.57605, 0.918176472, -3.97606392e-09, -0.396171629, -1.12946204e-08, 1,
            -3.62128851e-08, 0.396171629, 3.77244298e-08, 0.918176472),
        CFrame.new(-3600.72632, -276.06427, -1640.79663, -0.696130812, -6.0491181e-09, 0.717914939, -1.09490363e-08, 1,
            -2.19084972e-09, -0.717914939, -9.38559541e-09, -0.696130812),
        CFrame.new(-3548.52222, -269.309845, -1659.26685, 0.0472991578, -4.08685423e-08, 0.998880744, -7.68598838e-08, 1,
            4.45538149e-08, -0.998880744, -7.88812216e-08, 0.0472991578),
        CFrame.new(-3581.84155, -279.09021, -1696.15637, -0.999634147, -0.000535600528, -0.0270430837, -0.000448358158,
            0.999994695, -0.00323198596, 0.0270446707, -0.00321867829, -0.99962908),
        CFrame.new(-3601.34302, -282.790955, -1629.37036, -0.526346684, 0.00143659476, 0.850268841, -0.000266355521,
            0.999998271, -0.00185445137, -0.850269973, -0.00120255165, -0.526345372)
    },
    ["Sisyphus Statue"] = {
        CFrame.new(-3777.43433, -135.074417, -975.198975, -0.284491211, -1.02338751e-08, -0.958678663, 6.38407585e-08, 1,
            -2.96199456e-08, 0.958678663, -6.96293867e-08, -0.284491211),
        CFrame.new(-3697.77124, -135.074417, -886.946411, 0.979794085, -9.24526766e-09, 0.200008959, 1.35701708e-08, 1,
            -2.02526174e-08, -0.200008959, 2.25575487e-08, 0.979794085),
        CFrame.new(-3764.021, -135.074417, -903.742493, 0.785813689, -3.05788426e-08, -0.618463278, -4.87374336e-08, 1,
            -1.11368585e-07, 0.618463278, 1.17657272e-07, 0.785813689)
    },
    ["Fisherman Island"] = {
        CFrame.new(-75.2439423, 3.24433279, 3103.45093, -0.996514142, -3.14880424e-08, -0.0834242329, -3.84156422e-08, 1,
            8.14354024e-08, 0.0834242329, 8.43563228e-08, -0.996514142),
        CFrame.new(-162.285294, 3.26205397, 2954.47412, -0.74356699, -1.93168272e-08, -0.668661416, 1.03873425e-08, 1,
            -4.04397653e-08, 0.668661416, -3.70152904e-08, -0.74356699),
        CFrame.new(-69.8645096, 3.2620542, 2866.48096, 0.342575252, 8.79649331e-09, 0.939490378, 4.78986739e-10, 1,
            -9.53770485e-09, -0.939490378, 3.71738529e-09, 0.342575252),
        CFrame.new(247.130951, 2.47001815, 3001.72412, -0.724809051, -8.27166033e-08, -0.688949764, -8.16509669e-08, 1,
            -3.41610367e-08, 0.688949764, 3.14931867e-08, -0.724809051)
    },
    ["Esoteric Depths"] = {
        CFrame.new(3253.26099, -1293.7677, 1435.24756, 0.21652025, -3.88184027e-08, -0.976278126, 1.20091812e-08, 1,
            -3.70982107e-08, 0.976278126, -3.69178754e-09, 0.21652025),
        CFrame.new(3299.66333, -1302.85474, 1370.98621, -0.440755099, -5.91509552e-09, 0.897627413, -2.5926683e-09, 1,
            5.31664224e-09, -0.897627413, 1.60869356e-11, -0.440755099),
        CFrame.new(3250.94531, -1302.85547, 1324.77942, -0.998184919, 5.84032058e-08, 0.0602233484, 5.50187451e-08, 1,
            -5.78567096e-08, -0.0602233484, -5.44382814e-08, -0.998184919),
        CFrame.new(3219.16309, -1294.03394, 1364.41492, 0.676777482, -4.18104094e-08, -0.736187637, 8.28715798e-08, 1,
            1.93907237e-08, 0.736187637, -7.41322381e-08, 0.676777482)
    },
    ["Kohana"] = {
        CFrame.new(-921.516602, 24.5000591, 373.572754, -0.315036476, -3.65496575e-08, -0.949079573, -2.09816324e-08, 1,
            -3.15460156e-08, 0.949079573, 9.97509186e-09, -0.315036476),
        CFrame.new(-821.466125, 18.0640106, 442.570953, 0.502961993, 3.55151641e-08, 0.864308536, -2.61714685e-08, 1,
            -2.58610324e-08, -0.864308536, -9.61310764e-09, 0.502961993),
        CFrame.new(-656.069275, 17.2500572, 450.77124, 0.899714053, -3.28262595e-09, -0.436479777, -5.17725418e-09, 1,
            -1.81925373e-08, 0.436479777, 1.86278477e-08, 0.899714053),
        CFrame.new(-584.202759, 17.2500572, 459.276672, 0.0987685546, 5.48308599e-09, 0.995110452, -6.92575881e-08, 1,
            1.36405531e-09, -0.995110452, -6.90536694e-08, 0.0987685546),
    },
    ["Underground Cellar"] = {
        CFrame.new(2159.65723, -91.198143, -730.99707, -0.392579645, -1.64555736e-09, 0.919718027, 4.08579943e-08, 1,
            1.92293435e-08, -0.919718027, 4.51268818e-08, -0.392579645),
        CFrame.new(2114.22144, -91.1976471, -732.656738, -0.543168366, -3.4070105e-08, -0.839623809, 2.10003783e-08, 1,
            -5.41633582e-08, 0.839623809, -4.70522394e-08, -0.543168366),
        CFrame.new(2134.35767, -91.1985855, -698.182983, 0.989448071, -1.28799131e-08, -0.144888103, 2.66212989e-08, 1,
            9.29025887e-08, 0.144888103, -9.57793915e-08, 0.989448071),
    },
    ["Ancient Jungle"] = {
        CFrame.new(1515.67676, 25.5616989, -306.595856, 0.763029754, -8.87780942e-08, 0.646363378, 5.24343307e-08, 1,
            7.5451581e-08, -0.646363378, -2.36801707e-08, 0.763029754),
        CFrame.new(1489.29553, 6.23855162, -342.620209, -0.831362545, 6.32348289e-08, -0.555730462, 7.59748353e-09, 1,
            1.02421176e-07, 0.555730462, 8.09269736e-08, -0.831362545),
        CFrame.new(1467.59143, 7.2090292, -324.716827, -0.086521171, 2.06461745e-08, -0.996250033, -4.92800183e-08, 1,
            2.50037022e-08, 0.996250033, 5.12585707e-08, -0.086521171),
    },
    ["Secret Farm Ancient"] = {
        CFrame.new(2110.91431, -58.1463356, -732.848816, 0.0894816518, -9.7328666e-08, -0.995988488, 5.18647809e-08, 1,
            -9.30610398e-08, 0.995988488, -4.3329468e-08, 0.0894816518)
    },
    ["The Temple (Unlock First)"] = {
        CFrame.new(1479.11865, -22.1250019, -662.669373, 0.161120579, -2.03902815e-08, -0.986934721, -3.03227985e-08, 1,
            -2.56105164e-08, 0.986934721, 3.40530022e-08, 0.161120579),
        CFrame.new(1465.41211, -22.1250019, -670.940002, -0.21706377, -2.10148947e-08, 0.976157427, 3.29077707e-08, 1,
            2.88457365e-08, -0.976157427, 3.83845311e-08, -0.21706377),
        CFrame.new(1470.30334, -12.2246475, -587.052612, -0.101084575, -9.68974163e-08, 0.994877815, -1.47451953e-08, 1,
            9.5898109e-08, -0.994877815, -4.97584818e-09, -0.101084575),
        CFrame.new(1451.19983, -22.1250019, -621.852478, -0.986927867, 8.68970318e-09, -0.161162451, 9.61592317e-09, 1,
            -4.96716179e-09, 0.161162451, -6.4519563e-09, -0.986927867),
        CFrame.new(1499.44788, -22.1250019, -628.441711, -0.985374331, 7.20484294e-08, -0.170403719, 8.45688035e-08, 1,
            -6.62162876e-08, 0.170403719, -7.9658669e-08, -0.985374331)
    },
    ["Hallowen Bay"] = {
        CFrame.new(2105.58081, 81.0309219, 3298.1272, -0.224424303, 1.09558606e-07, -0.974491537, 4.02455669e-08, 1,
            1.03157923e-07, 0.974491537, -1.60678173e-08, -0.224424303),
        CFrame.new(2145.21313, 80.654747, 3337.37964, 0.95964092, 2.26037873e-08, 0.281228244, 8.77089373e-11, 1,
            -8.06745319e-08, -0.281228244, 7.74432465e-08, 0.95964092),
        CFrame.new(2107.62061, 79.7328796, 3328.46313, 0.713486373, 4.63640433e-08, -0.70066911, -2.2098936e-08, 1,
            4.36679102e-08, 0.70066911, -1.56724163e-08, 0.713486373)
    },
    ["Crystal Cavern"] = {
        CFrame.new(-2027.59424, -440.000519, 7429.38135, 0.897615969, -6.41856559e-08, -0.440778375, 4.09538856e-08, 1,
            -6.22190086e-08, 0.440778375, 3.77971858e-08, 0.897615969),
        CFrame.new(-2056.25635, -448.5, 7387.78271, -0.100679129, -2.6062402e-08, -0.994918942, 1.10323406e-07, 1,
            -3.73594915e-08, 0.994918942, -1.13524166e-07, -0.100679129),
        CFrame.new(-2031.5105, -448.5, 7341.23096, -0.840611517, -1.96273504e-08, -0.541638494, 4.06465723e-08, 1,
            -9.93196139e-08, 0.541638494, -1.05504959e-07, -0.840611517),
        CFrame.new(-1956.82727, -440.000488, 7387.51904, -0.024976898, 3.86704571e-08, 0.999688029, -7.61459944e-08, 1,
            -4.05850109e-08, -0.999688029, -7.71359296e-08, -0.024976898)
    }

}

local function startAutoFarmLoop()
    NotifySuccess("Auto Farm Enabled", "Fishing started on island: " .. selectedIsland)

    while isAutoFarmRunning do
        local islandSpots = farmLocations[selectedIsland]
        if type(islandSpots) == "table" and #islandSpots > 0 then
            location = islandSpots[math.random(1, #islandSpots)]
        else
            location = islandSpots
        end

        if not location then
            NotifyError("Invalid Island", "Selected island name not found.")
            return
        end

        local char = workspace:FindFirstChild("Characters"):FindFirstChild(LocalPlayer.Name)
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if not hrp then
            NotifyError("Teleport Failed", "HumanoidRootPart not found.")
            return
        end

        hrp.CFrame = location
        task.wait(1.5)

        StartAutoFish5X()

        while isAutoFarmRunning do
            if not isAutoFarmRunning then
                StopAutoFish5X()
                NotifyWarning("Auto Farm Stopped", "Auto Farm manually disabled. Auto Fish stopped.")
                break
            end
            task.wait(0.5)
        end
    end
end

local nameList = {}
local islandNamesToCode = {}

for code, name in pairs(islandCodes) do
    table.insert(nameList, name)
    islandNamesToCode[name] = code
end

table.sort(nameList)

AutoFarmTab:Section({
    Title = "Auto Farming Menu",
    TextSize = 22,
    TextXAlignment = "Center",
})

local CodeIsland = AutoFarmTab:Dropdown({
    Title = "Farm Island",
    Values = nameList,
    Value = nameList[9],
    SearchBarEnabled = true,
    Callback = function(selectedName)
        local code = islandNamesToCode[selectedName]
        local islandName = islandCodes[code]
        if islandName and farmLocations[islandName] then
            selectedIsland = islandName
            NotifySuccess("Island Selected", "Farming location set to " .. islandName)
        else
            NotifyError("Invalid Selection", "The island name is not recognized.")
        end
    end
})

myConfig:Register("IslCode", CodeIsland)

local AutoFarm = AutoFarmTab:Toggle({
    Title = "Start Auto Farm",
    Callback = function(state)
        isAutoFarmRunning = state
        if state then
            startAutoFarmLoop()
        else
            StopAutoFish()
        end
    end
})

myConfig:Register("AutoFarmStart", AutoFarm)


local eventNamesForDropdown = {}
for name in pairs(eventMap) do
    table.insert(eventNamesForDropdown, name)
end

AutoFarmTab:Dropdown({
    Title = "Auto Teleport Event",
    Values = eventNamesForDropdown,
    SearchBarEnabled = true,
    Callback = function(selected)
        selectedEvent = selected
        autoTPEvent = true
        NotifyInfo("Event Selected", "Now monitoring event: " .. selectedEvent)
    end
})


-------------------------------------------
----- =======[ ARTIFACT TAB ]
-------------------------------------------

AutoFarmArt:Section({
    Title = "Farming Artifact Menu",
    TextSize = 22,
    TextXAlignment = "Center",
})

local REPlaceLeverItem = ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net["RE/PlaceLeverItem"]

_G.UnlockTemple = function()
    task.spawn(function()
        local Artifacts = {
            "Hourglass Diamond Artifact",
            "Crescent Artifact",
            "Arrow Artifact",
            "Diamond Artifact"
        }

        for _, artifact in ipairs(Artifacts) do
            REPlaceLeverItem:FireServer(artifact)
            NotifyInfo("Temple Unlock", "Placing: " .. artifact)
            task.wait(2.1)
        end

        NotifySuccess("Temple Unlock", "All Artifacts placed successfully!")
    end)
end


_G.ArtifactSpots = {
    ["Spot 1"] = CFrame.new(1404.16931, 6.38866091, 118.118126, -0.964853525, 8.69606822e-08, 0.262788326, 9.85441346e-08,
        1, 3.08992689e-08, -0.262788326, 5.5709517e-08, -0.964853525),
    ["Spot 2"] = CFrame.new(883.969788, 6.62499952, -338.560059, -0.325799465, 2.72482961e-08, 0.945438921,
        3.40634649e-08, 1, -1.70824759e-08, -0.945438921, 2.6639464e-08, -0.325799465),
    ["Spot 3"] = CFrame.new(1834.76819, 6.62499952, -296.731476, 0.413336992, -7.92166972e-08, -0.910578132,
        3.06007166e-08, 1, -7.31055181e-08, 0.910578132, 2.35287234e-09, 0.413336992),
    ["Spot 4"] = CFrame.new(1483.25586, 6.62499952, -848.38031, -0.986296117, 2.72397838e-08, 0.164984599, 3.60663037e-08,
        1, 5.05033348e-08, -0.164984599, 5.57616318e-08, -0.986296117)
}

local REFishCaught = ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net["RE/FishCaught"]

local saveFile = "ArtifactProgress.json"

if isfile(saveFile) then
    local success, data = pcall(function()
        return game:GetService("HttpService"):JSONDecode(readfile(saveFile))
    end)
    if success and type(data) == "table" then
        _G.ArtifactCollected = data.ArtifactCollected or 0
        _G.CurrentSpot = data.CurrentSpot or 1
    else
        _G.ArtifactCollected = 0
        _G.CurrentSpot = 1
    end
else
    _G.ArtifactCollected = 0
    _G.CurrentSpot = 1
end

_G.ArtifactFarmEnabled = false

local function saveProgress()
    local data = {
        ArtifactCollected = _G.ArtifactCollected,
        CurrentSpot = _G.CurrentSpot
    }
    writefile(saveFile, game:GetService("HttpService"):JSONEncode(data))
end

_G.StartArtifactFarm = function()
    if _G.ArtifactFarmEnabled then return end
    _G.ArtifactFarmEnabled = true

    updateParagraph("Auto Farm Artifact", ("Resuming from Spot %d..."):format(_G.CurrentSpot))

    local Player = game.Players.LocalPlayer
    task.wait(1)
    Player.Character:PivotTo(_G.ArtifactSpots["Spot " .. tostring(_G.CurrentSpot)])
    task.wait(1)

    StartAutoFish5X()
    _G.AutoFishStarted = true

    _G.ArtifactConnection = REFishCaught.OnClientEvent:Connect(function(fishName, data)
        if string.find(fishName, "Artifact") then
            _G.ArtifactCollected += 1
            saveProgress()

            updateParagraph(
                "Auto Farm Artifact",
                ("Artifact Found : %s\nTotal: %d/4"):format(fishName, _G.ArtifactCollected)
            )

            if _G.ArtifactCollected < 4 then
                _G.CurrentSpot += 1
                saveProgress()
                local spotName = "Spot " .. tostring(_G.CurrentSpot)
                if _G.ArtifactSpots[spotName] then
                    task.wait(2)
                    Player.Character:PivotTo(_G.ArtifactSpots[spotName])
                    updateParagraph("Auto Farm Artifact",
                        ("Artifact Found : %s\nTotal : %d/4\n\nTeleporting to %s..."):format(
                            fishName,
                            _G.ArtifactCollected,
                            spotName
                        )
                    )
                    task.wait(1)
                end
            else
                updateParagraph("Auto Farm Artifact", "All Artifacts collected! Unlocking Temple...")
                StopAutoFish5X()
                task.wait(1.5)
                if typeof(_G.UnlockTemple) == "function" then
                    _G.UnlockTemple()
                end
                _G.StopArtifactFarm()
                delfile(saveFile)
            end
        end
    end)
end

_G.StopArtifactFarm = function()
    StopAutoFish()
    _G.ArtifactFarmEnabled = false
    _G.AutoFishStarted = false
    if _G.ArtifactConnection then
        _G.ArtifactConnection:Disconnect()
        _G.ArtifactConnection = nil
    end
    saveProgress()
    updateParagraph("Auto Farm Artifact", "Auto Farm Artifact stopped. Progress saved.")
end

function updateParagraph(title, desc)
    if _G.ArtifactParagraph then
        _G.ArtifactParagraph:SetDesc(desc)
    end
end

_G.ArtifactParagraph = AutoFarmArt:Paragraph({
    Title = "Auto Farm Artifact",
    Desc = "Waiting for activation...",
    Color = "Green",
})

AutoFarmArt:Space()

AutoFarmArt:Toggle({
    Title = "Auto Farm Artifact",
    Desc = "Automatically collects 4 Artifacts and unlocks The Temple.",
    Default = false,
    Callback = function(state)
        if state then
            _G.StartArtifactFarm()
        else
            _G.StopArtifactFarm()
        end
    end
})

local spotNames = {}
for name in pairs(_G.ArtifactSpots) do
    table.insert(spotNames, name)
end

AutoFarmArt:Dropdown({
    Title = "Teleport to Lever Temple",
    Values = spotNames,
    Value = spotNames[1],
    Callback = function(selected)
        local spotCFrame = _G.ArtifactSpots[selected]
        if spotCFrame then
            local player = game.Players.LocalPlayer
            local char = player.Character or player.CharacterAdded:Wait()
            local hrp = char:FindFirstChild("HumanoidRootPart")

            if hrp then
                hrp.CFrame = spotCFrame
                NotifySuccess("Lever Temple", "Teleported to " .. selected)
            else
                warn("HumanoidRootPart not found!")
            end
        else
            warn("Invalid teleport spot: " .. tostring(selected))
        end
    end
})

AutoFarmArt:Button({
    Title = "Unlock The Temple",
    Desc = "Still need Artifacts!",
    Justify = "Center",
    Icon = "",
    Callback = function()
        _G.UnlockTemple()
    end
})

-------------------------------------------
----- =======[ MASS TRADE TAB ]
-------------------------------------------

-- [Trade State]
local tradeState = { 
    selectedPlayerName = nil, 
    selectedPlayerId = nil, 
    autoTradeV1 = false,
    saveTempMode = false,
    TempTradeList = {}, 
    onTrade = false 
}

-- Asumsi Modul game inti sudah tersedia
local ItemUtility = _G.ItemUtility or require(ReplicatedStorage.Shared.ItemUtility) 
local ItemStringUtility = _G.ItemStringUtility or require(ReplicatedStorage.Modules.ItemStringUtility)
local InitiateTrade = net:WaitForChild("RF/InitiateTrade") 
local RFAwaitTradeResponse = net:WaitForChild("RF/AwaitTradeResponse") 

-- Fungsi utilitas untuk mendapatkan daftar pemain
local function getPlayerList()
    local list = {}; 
    for _, p in ipairs(Players:GetPlayers()) do 
        if p ~= LocalPlayer then 
            table.insert(list, p.Name) 
        end 
    end; 
    table.sort(list); 
    return list
end

-- =======================================================
-- LOGIKA HOOKING
-- =======================================================

local mt = getrawmetatable(game)
local oldNamecall = mt.__namecall
setreadonly(mt, false)
_G.REEquipItem = game:GetService("ReplicatedStorage").Packages._Index["sleitnick_net@0.2.0"].net["RE/EquipItem"]

mt.__namecall = newcclosure(function(self, ...)
    local args = {...}
    local method = getnamecallmethod()

    -- Logika Save/Send Trade
    if method == "FireServer" and self == _G.REEquipItem then
        local uuid, categoryName = args[1], args[2]

        if tradeState.saveTempMode then
            if uuid and categoryName then
                table.insert(tradeState.TempTradeList, {
                    UUID = uuid,
                    Category = categoryName
                })
                NotifySuccess("Save Mode", "Added item: " .. uuid .. " (" .. categoryName .. ")")
            else
                NotifyError("Save Mode", "Invalid data received.")
            end
            return nil
        end

        if tradeState.onTrade then
            if uuid and tradeState.selectedPlayerId then
                InitiateTrade:InvokeServer(tradeState.selectedPlayerId, uuid)
                NotifySuccess("Trade Sent", "Trade sent to " .. tradeState.selectedPlayerName or tradeState.selectedPlayerId)
            else
                NotifyError("Trade Error", "Invalid target or item.")
            end
            return nil
        end
    end

	if _G.autoSellMythic 
		and method == "FireServer"
		and self == _G.REEquipItem 
		and typeof(args[1]) == "string"
		and args[2] == "Fishes" then

		local uuid = args[1]

		task.delay(1, function()
			pcall(function()
				local result = RFSellItem:InvokeServer(uuid)
				if result then
					NotifySuccess("AutoSellMythic", "Items Sold!!")
				else
					NotifyError("AutoSellMythic", "Failed to sell item!!")
				end
			end)
		end)
	end
    
    return oldNamecall(self, ...)
end)
setreadonly(mt, true)

-- Implementasi Auto Accept Trade
pcall(function()
    local PromptController = _G.PromptController or ReplicatedStorage:WaitForChild("Controllers").PromptController 
    local Promise = _G.Promise or require(ReplicatedStorage.Packages.Promise) 
    
    if PromptController and PromptController.FirePrompt then
        local oldFirePrompt = PromptController.FirePrompt
        PromptController.FirePrompt = function(self, promptText, ...)
            -- Cek apakah Auto Accept aktif dan prompt adalah Trade
            if _G.AutoAcceptTradeEnabled and type(promptText) == "string" and promptText:find("Accept") and promptText:find("from:") then
                -- Mengembalikan Promise yang otomatis me-resolve (menerima) setelah jeda.
                return Promise.new(function(resolve)
                    task.wait(2) -- Tunggu 2 detik
                    resolve(true)
                end)
            end
            return oldFirePrompt(self, promptText, ...)
        end
    end
end)

-- =======================================================
-- DEFINISI UI
-- =======================================================

Trade:Section({Title = "Trade Configuration"})

local playerDropdown = Trade:Dropdown({
    Title = "Select Trade Target",
    Values = getPlayerList(),
    Value = getPlayerList()[1] or nil,
    SearchBarEnabled = true,
    Callback = function(selected)
        tradeState.selectedPlayerName = selected
        local player = Players:FindFirstChild(selected)
        if player then
            tradeState.selectedPlayerId = player.UserId
            NotifySuccess("Target Selected", "Target set to: " .. player.Name, 3)
        else
            tradeState.selectedPlayerId = nil
            NotifyError("Target Error", "Player not found!", 3)
        end
    end
})

Trade:Section({Title = "Auto Accept Trade"})

Trade:Toggle({
    Title = "Enable Auto Accept Trade",
    Desc = "Automatically accepts incoming trade requests.",
    Value = false,
    Callback = function(value)
        _G.AutoAcceptTradeEnabled = value
        if value then
            NotifySuccess("Auto Accept", "Auto accept trade enabled.", 3)
        else
            NotifyWarning("Auto Accept", "Auto accept trade disabled.", 3)
        end
    end
})

Trade:Section({Title = "Mass Trade V1"})

-- Toggle Mode Save Items
local saveModeToggle = Trade:Toggle({
    Title = "Mode Save Items",
    Desc = "Click inventory item to add for Mass Trade",
    Value = false,
    Callback = function(state)
        tradeState.saveTempMode = state
        if state then
            tradeState.TempTradeList = {}
            NotifySuccess("Save Mode", "Enabled - Click items to save")
        else
            NotifyInfo("Save Mode", "Disabled - "..#tradeState.TempTradeList.." items saved")
        end
    end
})

-- Toggle Trade (Original Send)
local originalTradeToggle = Trade:Toggle({
    Title = "Trade (Original Send)",
    Desc = "Click inventory items to Send Trade",
    Value = false,
    Callback = function(state)
        tradeState.onTrade = state
        if state then
            NotifySuccess("Trade", "Trade Mode Enabled. Click an item to send trade.")
        else
            NotifyWarning("Trade", "Trade Mode Disabled.")
        end
    end
})

-- Fungsi Trade All
local function TradeAll()       
    if not tradeState.selectedPlayerId then    
        NotifyError("Mass Trade", "Set trade target first!")       
        return         
    end          
    if #tradeState.TempTradeList == 0 then       
        NotifyWarning("Mass Trade", "No items saved!")          
        return         
    end          
    
    NotifyInfo("Mass Trade", "Starting trade of "..#tradeState.TempTradeList.." items...")      
    
    task.spawn(function()          
        for i, item in ipairs(tradeState.TempTradeList) do          
            if not tradeState.autoTradeV1 then
                NotifyWarning("Mass Trade", "Trade stopped!")         
                break          
            end          
        
            local uuid = item.UUID          
            local category = item.Category          
        
            NotifyInfo("Mass Trade", "Trade item "..i.." of "..#tradeState.TempTradeList)          
            InitiateTrade:InvokeServer(tradeState.selectedPlayerId, uuid, category)          
        
            -- Trade response logic
            task.wait(6.5) -- Delay antar trade         
        end          
    
        NotifySuccess("Mass Trade", "Finished trading!")        
        tradeState.autoTradeV1 = false          
        tradeState.TempTradeList = {}          
    end)          
end

-- Toggle Auto Trade
local autoTradeToggle = Trade:Toggle({
    Title = "Start Mass Trade",
    Desc = "Trade all saved items automatically.",
    Value = false,
    Callback = function(state)
        tradeState.autoTradeV1 = state
        if state then
            if #tradeState.TempTradeList == 0 then
                NotifyError("Mass Trade", "No items saved to trade!")
                tradeState.autoTradeV1 = false
                return
            end
            TradeAll()
            NotifySuccess("Mass Trade", "Auto Trade Enabled")
        else
            NotifyWarning("Mass Trade", "Auto Trade Disabled")
        end
    end
})

-------------------------------------------
----- =======[ DOUBLE ENCHANT STONES ]
-------------------------------------------

_G.DStones:Paragraph({
    Title = "Guide",
    Color = "Green",
    Desc = [[
TUTORIAL FOR DOUBLE ENCHANT

1. "Enabled Double Enchant" first
2. Hold your "SECRET" fish, then click "Get Enchant Stone"
3. Click "Double Enchant Rod" to do Double Enchant, and don't forget to place the stone in slot 5

Good Luck!
]]
})

_G.ReplicatedStorage = game:GetService("ReplicatedStorage")

_G.DStones:Space()

_G.DStones:Button({
    Title = "Enable Double Enchant",
    Locked = false,
    Justify = "Center",
    Icon = "",
    Callback = function()
        _G.ActivateDoubleEnchant = _G.ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net
        ["RE/ActivateSecondEnchantingAltar"]
        if _G.ActivateDoubleEnchant then
            _G.ActivateDoubleEnchant:FireServer()
            NotifySuccess("Double Enchant", "Double Enchant Enabled for Rods")
        else
            warn("Cant find Double Enchant functions")
        end
    end
})

_G.DStones:Space()

_G.DStones:Button({
    Title = "Get Enchant Stones",
    Locked = false,
    Justify = "Center",
    Icon = "",
    Callback = function()
        _G.CreateTranscendedStone = _G.ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net
        ["RF/CreateTranscendedStone"]
        if _G.CreateTranscendedStone then
            local result = _G.CreateTranscendedStone:InvokeServer()
            NotifySuccess("Double Enchant", "Got Enchant Stone!")
        else
            warn("[] Tidak dapat menemukan RemoteFunction CreateTranscendedStone.")
        end
    end
})

_G.DStones:Space()

_G.DStones:Button({
    Title = "Double Enchant Rod",
    Desc = "Hold the stone in slot 5",
    Justify = "Center",
    Icon = "",
    Callback = function()
        _G.ActiveStone = ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net
        ["RE/ActivateSecondEnchantingAltar"]
        if _G.ActiveStone then
            local result = _G.ActiveStone:FireServer()
            NotifySuccess("Double Enchant", "Enchanting....")
        else
            warn("Error something")
        end
    end
})


-------------------------------------------
----- =======[ PLAYER TAB ]
-------------------------------------------
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

_G._HiddenNameParts = {}

function _G.StartHideName()
    task.spawn(function()
        local function hideName(character)
            for _, v in pairs(character:GetDescendants()) do
                if v:IsA("BillboardGui") then
                    if v.Enabled then
                        _G._HiddenNameParts[v] = true
                        v.Enabled = false
                    end
                elseif v:IsA("Humanoid") then
                    _G._HiddenNameParts[v] = v.DisplayDistanceType
                    v.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
                end
            end
        end

        
        if LocalPlayer.Character then
            hideName(LocalPlayer.Character)
        end

        
        LocalPlayer.CharacterAdded:Connect(function(char)
            char:WaitForChild("Humanoid")
            task.wait(1)
            hideName(char)
        end)
    end)
end

function _G.StopHideName()
    for obj, state in pairs(_G._HiddenNameParts) do
        if obj and obj.Parent then
            if obj:IsA("BillboardGui") then
                obj.Enabled = true
            elseif obj:IsA("Humanoid") then
                obj.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.Viewer
            end
        end
    end
    _G._HiddenNameParts = {}
end

Player:Space()

Player:Toggle({
    Title = "Hide Name",
    Desc = "Hide name above character",
    Default = false,
    Callback = function(state)
        if state then
            _G.StartHideName()
        else
            _G.StopHideName()
        end
    end
})

local currentDropdown = nil

local function getPlayerList()
    local list = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            table.insert(list, p.DisplayName)
        end
    end
    return list
end


local function teleportToPlayerExact(target)
    local characters = workspace:FindFirstChild("Characters")
    if not characters then return end

    local targetChar = characters:FindFirstChild(target)
    local myChar = characters:FindFirstChild(LocalPlayer.Name)

    if targetChar and myChar then
        local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
        local myHRP = myChar:FindFirstChild("HumanoidRootPart")
        if targetHRP and myHRP then
            myHRP.CFrame = targetHRP.CFrame + Vector3.new(2, 0, 0)
        end
    end
end

local function refreshDropdown()
    if currentDropdown then
        currentDropdown:Refresh(getPlayerList())
    end
end

currentDropdown = Player:Dropdown({
    Title = "Teleport to Player",
    Desc = "Select player to teleport",
    Values = getPlayerList(),
    SearchBarEnabled = true,
    Callback = function(selectedDisplayName)
        for _, p in pairs(Players:GetPlayers()) do
            if p.DisplayName == selectedDisplayName then
                teleportToPlayerExact(p.Name)
                NotifySuccess("Teleport Successfully", "Successfully Teleported to " .. p.DisplayName .. "!", 3)
                break
            end
        end
    end
})

Players.PlayerAdded:Connect(function()
    task.delay(0.1, refreshDropdown)
end)

Players.PlayerRemoving:Connect(function()
    task.delay(0.1, refreshDropdown)
end)

refreshDropdown()


local defaultMinZoom = LocalPlayer.CameraMinZoomDistance
local defaultMaxZoom = LocalPlayer.CameraMaxZoomDistance

Player:Toggle({
    Title = "Unlimited Zoom",
    Desc = "Unlimited Camera Zoom for take a Picture",
    Value = false,
    Callback = function(state)
        if state then
            LocalPlayer.CameraMinZoomDistance = 0.5
            LocalPlayer.CameraMaxZoomDistance = 9999
        else
            LocalPlayer.CameraMinZoomDistance = defaultMinZoom
            LocalPlayer.CameraMaxZoomDistance = defaultMaxZoom
        end
    end
})


local function accessAllBoats()
    local vehicles = workspace:FindFirstChild("Vehicles")
    if not vehicles then
        NotifyError("Not Found", "Vehicles container not found.")
        return
    end

    local count = 0

    for _, boat in ipairs(vehicles:GetChildren()) do
        if boat:IsA("Model") and boat:GetAttribute("OwnerId") then
            local currentOwner = boat:GetAttribute("OwnerId")
            if currentOwner ~= LocalPlayer.UserId then
                boat:SetAttribute("OwnerId", LocalPlayer.UserId)
                count += 1
            end
        end
    end

    NotifySuccess("Access Granted", "You now own " .. count .. " boat(s).", 3)
end

Player:Space()

Player:Button({
    Title = "Access All Boats",
    Justify = "Center",
    Icon = "",
    Callback = accessAllBoats
})

Player:Space()

Player:Toggle({
    Title = "Infinity Jump",
    Callback = function(val)
        ijump = val
    end,
})

game:GetService("UserInputService").JumpRequest:Connect(function()
    if ijump and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)

local EnableFloat = Player:Toggle({
    Title = "Enable Float",
    Value = false,
    Callback = function(enabled)
        floatingPlat(enabled)
    end,
})

myConfig:Register("ActiveFloat", EnableFloat)

local universalNoclip = false
local originalCollisionState = {}

local NoClip = Player:Toggle({
    Title = "Universal No Clip",
    Value = false,
    Callback = function(val)
        universalNoclip = val

        if val then
            NotifySuccess("Universal Noclip Active", "You & your vehicle can penetrate all objects.", 3)
        else
            for part, state in pairs(originalCollisionState) do
                if part and part:IsA("BasePart") then
                    part.CanCollide = state
                end
            end
            originalCollisionState = {}
            NotifyWarning("Universal Noclip Disabled", "All collisions are returned to their original state.", 3)
        end
    end,
})

game:GetService("RunService").Stepped:Connect(function()
    if not universalNoclip then return end

    local char = LocalPlayer.Character
    if char then
        for _, part in ipairs(char:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide == true then
                originalCollisionState[part] = true
                part.CanCollide = false
            end
        end
    end

    for _, model in ipairs(workspace:GetChildren()) do
        if model:IsA("Model") and model:FindFirstChildWhichIsA("VehicleSeat", true) then
            for _, part in ipairs(model:GetDescendants()) do
                if part:IsA("BasePart") and part.CanCollide == true then
                    originalCollisionState[part] = true
                    part.CanCollide = false
                end
            end
        end
    end
end)

myConfig:Register("NoClip", NoClip)

local AntiDrown_Enabled = false
local rawmt = getrawmetatable(game)
setreadonly(rawmt, false)
local oldNamecall = rawmt.__namecall

rawmt.__namecall = newcclosure(function(self, ...)
    local args = { ... }
    local method = getnamecallmethod()

    if tostring(self) == "URE/UpdateOxygen" and method == "FireServer" and AntiDrown_Enabled then
        return nil
    end

    return oldNamecall(self, ...)
end)

local DrownBN = true

local ADrown = Player:Toggle({
    Title = "Anti Drown (Oxygen Bypass)",
    Callback = function(state)
        AntiDrown_Enabled = state
        if DrownBN then
            DrownBN = false
            return
        end
        if state then
            NotifySuccess("Anti Drown Active", "Oxygen loss has been blocked.", 3)
        else
            NotifyWarning("Anti Drown Disabled", "You're vulnerable to drowning again.", 3)
        end
    end,
})

myConfig:Register("AntiDrown", ADrown)

local Speed = Player:Slider({
    Title = "WalkSpeed",
    Value = {
        Min = 16,
        Max = 200,
        Default = 20
    },
    Step = 1,
    Callback = function(val)
        local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = val end
    end,
})

myConfig:Register("PlayerSpeed", Speed)

local Jp = Player:Slider({
    Title = "Jump Power",
    Value = {
        Min = 50,
        Max = 500,
        Default = 35
    },
    Step = 10,
    Callback = function(val)
        local char = LocalPlayer.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then
                hum.UseJumpPower = true
                hum.JumpPower = val
            end
        end
    end,
})

myConfig:Register("JumpPower", Jp)

-------------------------------------------
----- =======[ UTILITY TAB ]
-------------------------------------------


_G.RFRedeemCode = ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net["RF/RedeemCode"]

_G.RedeemCodes = {
    "BLAMETALON",
    "FISHMAS2025",
    "GOLDENSHARK",
    "THANKYOU",
}

_G.RedeemAllCodes = function()
    for _, code in ipairs(_G.RedeemCodes) do
        local success, result = pcall(function()
            return _G.RFRedeemCode:InvokeServer(code)
        end)
        task.wait(1)
    end
end

Utils:Button({
    Title = "Redeem All Codes",
    Locked = false,
    Justify = "Center",
    Icon = "",
    Callback = function()
        _G.RedeemAllCodes()
    end
})

Utils:Space()

local RFPurchaseMarketItem = ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net["RF/PurchaseMarketItem"]

local merchantItems = {
    ["Item 1"] = 5,
    ["Item 2"] = 4,
    ["Item 3"] = 3,
}

local function getKeys(tbl)
    local keys = {}
    for k, _ in pairs(tbl) do
        table.insert(keys, k)
    end
    return keys
end

Utils:Dropdown({
    Title = "Traveling Merchant",
    Desc = "Select an item to purchase from Traveling Merchant",
    Values = getKeys(merchantItems),
    Callback = function(selected)
        local itemID = merchantItems[selected]
        if itemID then
            local success, err = pcall(function()
                RFPurchaseMarketItem:InvokeServer(itemID)
            end)
            if success then
                NotifyInfo("Purchase Success", "Successfully bought: " .. selected)
            else
                NotifyInfo("Purchase Failed", "Error: " .. tostring(err))
            end
        end
    end
})

local weatherActive = {}
local weatherData = {
    ["Storm"] = { duration = 900 },
    ["Cloudy"] = { duration = 900 },
    ["Snow"] = { duration = 900 },
    ["Wind"] = { duration = 900 },
    ["Radiant"] = { duration = 900 }
}

local function randomDelay(min, max)
    return math.random(min * 100, max * 100) / 100
end

local function autoBuyWeather(weatherType)
    local purchaseRemote = ReplicatedStorage:WaitForChild("Packages")
        :WaitForChild("_Index")
        :WaitForChild("sleitnick_net@0.2.0")
        :WaitForChild("net")
        :WaitForChild("RF/PurchaseWeatherEvent")

    task.spawn(function()
        while weatherActive[weatherType] do
            pcall(function()
                purchaseRemote:InvokeServer(weatherType)
                NotifySuccess("Weather Purchased", "Successfully activated " .. weatherType)

                task.wait(weatherData[weatherType].duration)

                local randomWait = randomDelay(1, 5)
                NotifyInfo("Waiting...", "Delay before next purchase: " .. tostring(randomWait) .. "s")
                task.wait(randomWait)
            end)
        end
    end)
end

local WeatherDropdown = Utils:Dropdown({
    Title = "Auto Buy Weather",
    Values = { "Storm", "Cloudy", "Snow", "Wind", "Radiant" },
    Value = {},
    Multi = true,
    AllowNone = true,
    Callback = function(selected)
        for weatherType, active in pairs(weatherActive) do
            if active and not table.find(selected, weatherType) then
                weatherActive[weatherType] = false
                NotifyWarning("Auto Weather", "Auto buying " .. weatherType .. " has been stopped.")
            end
        end
        for _, weatherType in pairs(selected) do
            if not weatherActive[weatherType] then
                weatherActive[weatherType] = true
                NotifyInfo("Auto Weather", "Auto buying " .. weatherType .. " has started!")
                autoBuyWeather(weatherType)
            end
        end
    end
})

myConfig:Register("WeatherDropdown", WeatherDropdown)


local RodItemsPath = game:GetService("ReplicatedStorage"):WaitForChild("Items")

local BaitsPath = ReplicatedStorage:WaitForChild("Baits")

local function deepCopyTable(tbl)
    local copy = {}
    for k, v in pairs(tbl) do
        copy[k] = typeof(v) == "table" and deepCopyTable(v) or v
    end
    return copy
end

local islandCoords = {
    ["01"] = { name = "Weather Machine", position = Vector3.new(-1471, -3, 1929) },
    ["02"] = { name = "Esoteric Depths", position = Vector3.new(3157, -1303, 1439) },
    ["03"] = { name = "Tropical Grove", position = Vector3.new(-2038, 3, 3650) },
    ["04"] = { name = "Stingray Shores", position = Vector3.new(-32, 4, 2773) },
    ["05"] = { name = "Kohana Volcano", position = Vector3.new(-519, 24, 189) },
    ["06"] = { name = "Coral Reefs", position = Vector3.new(-3095, 1, 2177) },
    ["07"] = { name = "Crater Island", position = Vector3.new(968, 1, 4854) },
    ["08"] = { name = "Kohana", position = Vector3.new(-658, 3, 719) },
    ["09"] = { name = "Winter Fest", position = Vector3.new(1611, 4, 3280) },
    ["10"] = { name = "Isoteric Island", position = Vector3.new(1987, 4, 1400) },
    ["11"] = { name = "Treasure Hall", position = Vector3.new(-3600, -267, -1558) },
    ["12"] = { name = "Lost Shore", position = Vector3.new(-3663, 38, -989) },
    ["13"] = { name = "Sishypus Statue", position = Vector3.new(-3792, -135, -986) },
    ["14"] = { name = "Ancient Jungle", position = Vector3.new(1478, 131, -613) },
    ["15"] = { name = "The Temple", position = Vector3.new(1477, -22, -631) },
    ["16"] = { name = "Underground Cellar", position = Vector3.new(2133, -91, -674) },
    ["17"] = { name = "Hallowen Bay", position = Vector3.new(1875, 23, 3086) },
    ["18"] = { name = "Crystal Cavern", position = Vector3.new(-1886, -448, 7394) }
}

local islandNames = {}
for _, data in pairs(islandCoords) do
    table.insert(islandNames, data.name)
end

Utils:Dropdown({
    Title = "Island Selector",
    Desc = "Select island to teleport",
    Values = islandNames,
    Value = islandNames[1],
    SearchBarEnabled = true,
    Callback = function(selectedName)
        for code, data in pairs(islandCoords) do
            if data.name == selectedName then
                local success, err = pcall(function()
                    local charFolder = workspace:WaitForChild("Characters", 5)
                    local char = charFolder:FindFirstChild(LocalPlayer.Name)
                    if not char then error("Character not found") end
                    local hrp = char:FindFirstChild("HumanoidRootPart") or char:WaitForChild("HumanoidRootPart", 3)
                    if not hrp then error("HumanoidRootPart not found") end
                    hrp.CFrame = CFrame.new(data.position + Vector3.new(0, 5, 0))
                end)

                if success then
                    NotifySuccess("Teleported!", "You are now at " .. selectedName)
                else
                    NotifyError("Teleport Failed", tostring(err))
                end
                break
            end
        end
    end
})

local TweenService = game:GetService("TweenService")

local HRP = LocalPlayer.Character:WaitForChild("HumanoidRootPart")
local Camera = workspace.CurrentCamera

local Items = ReplicatedStorage:WaitForChild("Items")
local Baits = ReplicatedStorage:WaitForChild("Baits")
local net = ReplicatedStorage:WaitForChild("Packages")
    :WaitForChild("_Index")
    :WaitForChild("sleitnick_net@0.2.0")
    :WaitForChild("net")


local npcCFrame = CFrame.new(
    66.866745, 4.62500143, 2858.98535,
    -0.981261611, 5.77215005e-08, -0.192680314,
    6.94250204e-08, 1, -5.39889484e-08,
    0.192680314, -6.63541186e-08, -0.981261611
)


local function FadeScreen(duration)
    local gui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
    gui.IgnoreGuiInset = true
    gui.ResetOnSpawn = false

    local frame = Instance.new("Frame", gui)
    frame.BackgroundColor3 = Color3.new(0, 0, 0)
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundTransparency = 0.1

    local tweenIn = TweenService:Create(frame, TweenInfo.new(0.2), { BackgroundTransparency = 0.1 })
    tweenIn:Play()
    tweenIn.Completed:Wait()

    wait(duration)

    local tweenOut = TweenService:Create(frame, TweenInfo.new(0.3), { BackgroundTransparency = 0.1 })
    tweenOut:Play()
    tweenOut.Completed:Wait()
    gui:Destroy()
end

local function SafePurchase(callback)
    local originalCFrame = HRP.CFrame
    HRP.CFrame = npcCFrame
    FadeScreen(0.2)
    pcall(callback)
    wait(0.1)
    HRP.CFrame = originalCFrame
end

local rodOptions = {}
local rodData = {}

for _, rod in ipairs(Items:GetChildren()) do
    if rod:IsA("ModuleScript") and rod.Name:find("!!!") then
        local success, module = pcall(require, rod)
        if success and module and module.Data then
            local id = module.Data.Id
            local name = module.Data.Name or rod.Name
            local price = module.Price or module.Data.Price

            if price then
                table.insert(rodOptions, name .. " | Price: " .. tostring(price))
                rodData[name] = id
            end
        end
    end
end

Utils:Dropdown({
    Title = "Rod Shop",
    Desc = "Select Rod to Buy",
    Values = rodOptions,
    Value = nil,
    SearchBarEnabled = true,
    Callback = function(option)
        local selectedName = option:split(" |")[1]
        local id = rodData[selectedName]

        SafePurchase(function()
            net:WaitForChild("RF/PurchaseFishingRod"):InvokeServer(id)
            NotifySuccess("Rod Purchased", selectedName .. " has been successfully purchased!")
        end)
    end,
})


local baitOptions = {}
local baitData = {}

for _, bait in ipairs(Baits:GetChildren()) do
    if bait:IsA("ModuleScript") then
        local success, module = pcall(require, bait)
        if success and module and module.Data then
            local id = module.Data.Id
            local name = module.Data.Name or bait.Name
            local price = module.Price or module.Data.Price

            if price then
                table.insert(baitOptions, name .. " | Price: " .. tostring(price))
                baitData[name] = id
            end
        end
    end
end

Utils:Dropdown({
    Title = "Baits Shop",
    Desc = "Select Baits to Buy",
    Values = baitOptions,
    Value = nil,
    SearchBarEnabled = true,
    Callback = function(option)
        local selectedName = option:split(" |")[1]
        local id = baitData[selectedName]

        SafePurchase(function()
            net:WaitForChild("RF/PurchaseBait"):InvokeServer(id)
            NotifySuccess("Bait Purchased", selectedName .. " has been successfully purchased!")
        end)
    end,
})

local npcFolder = game:GetService("ReplicatedStorage"):WaitForChild("NPC")

local npcList = {}
for _, npc in pairs(npcFolder:GetChildren()) do
    if npc:IsA("Model") then
        local hrp = npc:FindFirstChild("HumanoidRootPart") or npc.PrimaryPart
        if hrp then
            table.insert(npcList, npc.Name)
        end
    end
end


Utils:Dropdown({
    Title = "NPC",
    Desc = "Select NPC to Teleport",
    Values = npcList,
    Value = nil,
    SearchBarEnabled = true,
    Callback = function(selectedName)
        local npc = npcFolder:FindFirstChild(selectedName)
        if npc and npc:IsA("Model") then
            local hrp = npc:FindFirstChild("HumanoidRootPart") or npc.PrimaryPart
            if hrp then
                local charFolder = workspace:FindFirstChild("Characters", 5)
                local char = charFolder and charFolder:FindFirstChild(LocalPlayer.Name)
                if not char then return end
                local myHRP = char:FindFirstChild("HumanoidRootPart")
                if myHRP then
                    myHRP.CFrame = hrp.CFrame + Vector3.new(0, 3, 0)
                    NotifySuccess("Teleported!", "You are now near: " .. selectedName)
                end
            end
        end
    end
})

-------------------------------------------
----- =======[ SETTINGS TAB ]
-------------------------------------------


_G.AntiAFKEnabled = true
_G.AFKConnection = nil

SettingsTab:Toggle({
    Title = "Anti-AFK",
    Value = true,
    Callback = function(Value)
        _G.AntiAFKEnabled = Value
        if AntiAFKEnabled then
            if AFKConnection then
                AFKConnection:Disconnect()
            end


            local VirtualUser = game:GetService("VirtualUser")

            _G.AFKConnection = LocalPlayer.Idled:Connect(function()
                pcall(function()
                    VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                    task.wait(1)
                    VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                end)
            end)

            if NotifySuccess then
                NotifySuccess("Anti-AFK Activated", "You will now avoid being kicked.")
            end
        else
            if _G.AFKConnection then
                _G.AFKConnection:Disconnect()
                _G.AFKConnection = nil
            end

            if NotifySuccess then
                NotifySuccess("Anti-AFK Deactivated", "You can now go idle again.")
            end
        end
    end,
})

SettingsTab:Space()

SettingsTab:Button({
    Title = "Boost FPS (Ultra Low Graphics)",
    Callback = function()
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("BasePart") then
                v.Material = Enum.Material.SmoothPlastic
                v.Reflectance = 0
                v.CastShadow = false
                v.Transparency = v.Transparency > 0.5 and 1 or v.Transparency
            elseif v:IsA("Decal") or v:IsA("Texture") then
                v.Transparency = 1
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Explosion") then
                v.Enabled = false
            elseif v:IsA("Beam") or v:IsA("SpotLight") or v:IsA("PointLight") or v:IsA("SurfaceLight") then
                v.Enabled = false
            elseif v:IsA("ShirtGraphic") or v:IsA("Shirt") or v:IsA("Pants") then
                v:Destroy()
            end
        end

        local Lighting = game:GetService("Lighting")
        for _, effect in pairs(Lighting:GetChildren()) do
            if effect:IsA("PostEffect") then
                effect.Enabled = false
            end
        end
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 9e9
        Lighting.Brightness = 1
        Lighting.EnvironmentDiffuseScale = 0
        Lighting.EnvironmentSpecularScale = 0
        Lighting.ClockTime = 12
        Lighting.Ambient = Color3.new(1, 1, 1)
        Lighting.OutdoorAmbient = Color3.new(1, 1, 1)

        local Terrain = workspace:FindFirstChildOfClass("Terrain")
        if Terrain then
            Terrain.WaterWaveSize = 0
            Terrain.WaterWaveSpeed = 0
            Terrain.WaterReflectance = 0
            Terrain.WaterTransparency = 1
            Terrain.Decoration = false
        end

        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        settings().Rendering.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Level01
        settings().Rendering.TextureQuality = Enum.TextureQuality.Low

        game:GetService("UserSettings").GameSettings.SavedQualityLevel = Enum.SavedQualitySetting.QualityLevel1
        game:GetService("UserSettings").GameSettings.Fullscreen = true

        for _, s in pairs(workspace:GetDescendants()) do
            if s:IsA("Sound") and s.Playing and s.Volume > 0.5 then
                s.Volume = 0.1
            end
        end

        if collectgarbage then
            collectgarbage("collect")
        end

        local fullWhite = Instance.new("ScreenGui")
        fullWhite.Name = "FullWhiteScreen"
        fullWhite.ResetOnSpawn = false
        fullWhite.IgnoreGuiInset = true
        fullWhite.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        fullWhite.Parent = game:GetService("CoreGui")

        local whiteFrame = Instance.new("Frame")
        whiteFrame.Size = UDim2.new(1, 0, 1, 0)
        whiteFrame.BackgroundColor3 = Color3.new(1, 1, 1)
        whiteFrame.BorderSizePixel = 0
        whiteFrame.Parent = fullWhite

        NotifySuccess("Boost FPS", "Boost FPS mode applied successfully with Full White Screen!")
    end
})

SettingsTab:Space()

local TeleportService = game:GetService("TeleportService")

local function Rejoin()
    local player = Players.LocalPlayer
    if player then
        TeleportService:Teleport(game.PlaceId, player)
    end
end

local function ServerHop()
    local placeId = game.PlaceId
    local servers = {}
    local cursor = ""
    local found = false

    repeat
        local url = "https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?sortOrder=Asc&limit=100"
        if cursor ~= "" then
            url = url .. "&cursor=" .. cursor
        end

        local success, result = pcall(function()
            return HttpService:JSONDecode(game:HttpGet(url))
        end)

        if success and result and result.data then
            for _, server in pairs(result.data) do
                if server.playing < server.maxPlayers and server.id ~= game.JobId then
                    table.insert(servers, server.id)
                end
            end
            cursor = result.nextPageCursor or ""
        else
            break
        end
    until not cursor or #servers > 0

    if #servers > 0 then
        local targetServer = servers[math.random(1, #servers)]
        TeleportService:TeleportToPlaceInstance(placeId, targetServer, LocalPlayer)
    else
        NotifyError("Server Hop Failed", "No servers available or all are full!")
    end
end

_G.Keybind = SettingsTab:Keybind({
    Title = "Keybind",
    Desc = "Keybind to open UI",
    Value = "G",
    Callback = function(v)
        Window:SetToggleKey(Enum.KeyCode[v])
    end
})

myConfig:Register("Keybind", _G.Keybind)

SettingsTab:Space()

SettingsTab:Button({
    Title = "Rejoin Server",
    Justify = "Center",
    Icon = "",
    Callback = function()
        Rejoin()
    end,
})

SettingsTab:Space()

SettingsTab:Button({
    Title = "Server Hop (New Server)",
    Justify = "Center",
    Icon = "",
    Callback = function()
        ServerHop()
    end,
})

SettingsTab:Space()

SettingsTab:Section({
    Title = "Configuration",
    TextSize = 22,
    TextXAlignment = "Center",
    Opened = true
})

SettingsTab:Button({
    Title = "Save",
    Justify = "Center",
    Icon = "",
    Callback = function()
        myConfig:Save()
        NotifySuccess("Config Saved", "Config has been saved!")
    end
})

SettingsTab:Space()

SettingsTab:Button({
    Title = "Load",
    Justify = "Center",
    Icon = "",
    Callback = function()
        myConfig:Load()
        NotifySuccess("Config Loaded", "Config has beed loaded!")
    end
})

function _G.SembunyikanNotifikasiIkan()
    task.spawn(function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local notifPath = ReplicatedStorage:FindFirstChild("Packages")
        if not notifPath then
            warn("âš ï¸ Struktur Packages tidak ditemukan.")
            return
        end

        local NetFolder = notifPath:FindFirstChild("_Index")
        if not NetFolder then
            warn("âš ï¸ Folder _Index tidak ditemukan di Packages.")
            return
        end

        local sleitnickNet = NetFolder:FindFirstChild("sleitnick_net@0.2.0")
        if not sleitnickNet then
            warn("âš ï¸ sleitnick_net@0.2.0 tidak ditemukan.")
            return
        end

        local net = sleitnickNet:FindFirstChild("net")
        if not net then
            warn("âš ï¸ Folder net tidak ditemukan.")
            return
        end

        local REObtainedNewFishNotification = net:FindFirstChild("RE/ObtainedNewFishNotification")
        if not REObtainedNewFishNotification then
            warn("âš ï¸ RemoteEvent notifikasi ikan tidak ditemukan.")
            return
        end

        -- ?? Nonaktifkan semua koneksi notifikasi
        for _, connection in pairs(getconnections(REObtainedNewFishNotification.OnClientEvent)) do
            connection:Disable()
        end

        print("âœ… Notifikasi ikan berhasil disembunyikan.")
    end)
end

function _G.TampilkanNotifikasiIkan()
    task.spawn(function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local REObtainedNewFishNotification = ReplicatedStorage
            .Packages._Index["sleitnick_net@0.2.0"].net["RE/ObtainedNewFishNotification"]

        if REObtainedNewFishNotification then
            for _, connection in pairs(getconnections(REObtainedNewFishNotification.OnClientEvent)) do
                connection:Enable()
            end
            print("âœ… Notifikasi ikan diaktifkan kembali.")
        else
            warn("âš ï¸ Tidak dapat menemukan event notifikasi ikan.")
        end
    end)
end

-- ðŸ§© Tambahkan ke tab UI
SettingsTab:Space()

SettingsTab:Toggle({
    Title = "Hide Notif Fish",
    Desc = "Turn off new fish pop-up",
    Default = false,
    Callback = function(state)
        if state then
            _G.SembunyikanNotifikasiIkan()
        else
            _G.TampilkanNotifikasiIkan()
        end
    end
})

-------------------------------------------
----- =======[ X5 SPEED TAB ]
-------------------------------------------

X5SpeedTab:Section({
    Title = "Ultra Speed Config",
    TextSize = 22,
    TextXAlignment = "Center",
    Opened = true
})

-- Charge Delay
local chargeDelayInput = X5SpeedTab:Input({
    Title = "Charge Delay",
    Desc = "Delay after charging rod (Default: 0.02)",
    Value = tostring(featureState.Instant_ChargeDelay),
    Placeholder = "Input number...",
    Callback = function(input)
        local value = tonumber(input)
        if not value then
            if WindUI then
                WindUI:Notify({
                    Title = "Invalid Input",
                    Content = "Charge Delay must be a number!",
                    Duration = 3,
                    Icon = "x-circle"
                })
            end
            return
        end
        featureState.Instant_ChargeDelay = value
    end
})

-- Spam Count
local spamCountInput = X5SpeedTab:Input({
    Title = "Spam Count",
    Desc = "Number of spam attempts (Default: 5)",
    Value = tostring(featureState.Instant_SpamCount),
    Placeholder = "Input number...",
    Callback = function(input)
        local value = tonumber(input)
        if not value or value < 1 then
            if WindUI then
                WindUI:Notify({
                    Title = "Invalid Input",
                    Content = "Spam Count must be a positive number!",
                    Duration = 3,
                    Icon = "x-circle"
                })
            end
            return
        end
        featureState.Instant_SpamCount = math.floor(value)
    end
})

-- Worker Count
local workerCountInput = X5SpeedTab:Input({
    Title = "Worker Count",
    Desc = "Number of workers (Default: 4)",
    Value = tostring(featureState.Instant_WorkerCount),
    Placeholder = "Input number...",
    Callback = function(input)
        local value = tonumber(input)
        if not value or value < 1 then
            if WindUI then
                WindUI:Notify({
                    Title = "Invalid Input",
                    Content = "Worker Count must be a positive number!",
                    Duration = 3,
                    Icon = "x-circle"
                })
            end
            return
        end
        featureState.Instant_WorkerCount = math.floor(value)
    end
})

-- Start Delay
local startDelayInput = X5SpeedTab:Input({
    Title = "Start Delay",
    Desc = "Delay before starting (Default: 1.20)",
    Value = tostring(featureState.Instant_StartDelay),
    Placeholder = "Input number...",
    Callback = function(input)
        local value = tonumber(input)
        if not value then
            if WindUI then
                WindUI:Notify({
                    Title = "Invalid Input",
                    Content = "Start Delay must be a number!",
                    Duration = 3,
                    Icon = "x-circle"
                })
            end
            return
        end
        featureState.Instant_StartDelay = value
    end
})

-- Catch Timeout
local catchTimeoutInput = X5SpeedTab:Input({
    Title = "Catch Timeout",
    Desc = "Timeout for catching fish (Default: 0.01)",
    Value = tostring(featureState.Instant_CatchTimeout),
    Placeholder = "Input number...",
    Callback = function(input)
        local value = tonumber(input)
        if not value then
            if WindUI then
                WindUI:Notify({
                    Title = "Invalid Input",
                    Content = "Catch Timeout must be a number!",
                    Duration = 3,
                    Icon = "x-circle"
                })
            end
            return
        end
        featureState.Instant_CatchTimeout = value
    end
})

-- Cycle Delay
local cycleDelayInput = X5SpeedTab:Input({
    Title = "Cycle Delay",
    Desc = "Delay between cycles (Default: 0.01)",
    Value = tostring(featureState.Instant_CycleDelay),
    Placeholder = "Input number...",
    Callback = function(input)
        local value = tonumber(input)
        if not value then
            if WindUI then
                WindUI:Notify({
                    Title = "Invalid Input",
                    Content = "Cycle Delay must be a number!",
                    Duration = 3,
                    Icon = "x-circle"
                })
            end
            return
        end
        featureState.Instant_CycleDelay = value
    end
})

-- Reset Count
local resetCountInput = X5SpeedTab:Input({
    Title = "Reset Count",
    Desc = "Number of attempts before reset (Default: 10)",
    Value = tostring(featureState.Instant_ResetCount),
    Placeholder = "Input number...",
    Callback = function(input)
        local value = tonumber(input)
        if not value or value < 1 then
            if WindUI then
                WindUI:Notify({
                    Title = "Invalid Input",
                    Content = "Reset Count must be a positive number!",
                    Duration = 3,
                    Icon = "x-circle"
                })
            end
            return
        end
        featureState.Instant_ResetCount = math.floor(value)
    end
})

-- Reset Pause
local resetPauseInput = X5SpeedTab:Input({
    Title = "Reset Pause",
    Desc = "Pause duration after reset (Default: 0.01)",
    Value = tostring(featureState.Instant_ResetPause),
    Placeholder = "Input number...",
    Callback = function(input)
        local value = tonumber(input)
        if not value then
            if WindUI then
                WindUI:Notify({
                    Title = "Invalid Input",
                    Content = "Reset Pause must be a number!",
                    Duration = 3,
                    Icon = "x-circle"
                })
            end
            return
        end
        featureState.Instant_ResetPause = value
    end
})

X5SpeedTab:Section({
    Title = "Save Load Config",
    TextSize = 22,
    TextXAlignment = "Center",
    Opened = true
})

-- Save Configuration Button
X5SpeedTab:Button({
    Title = "ðŸ’¾ Save Configuration",
    Desc = "Save all current settings to file",
    Callback = function()
        saveConfiguration()
    end
})

-- Load Configuration Button
X5SpeedTab:Button({
    Title = "ðŸ“¥ Load Configuration",
    Desc = "Load settings from saved file",
    Callback = function()
        if loadConfiguration() then
            -- Update semua input fields dengan nilai yang diload
            chargeDelayInput:Set(tostring(featureState.Instant_ChargeDelay))
            spamCountInput:Set(tostring(featureState.Instant_SpamCount))
            workerCountInput:Set(tostring(featureState.Instant_WorkerCount))
            startDelayInput:Set(tostring(featureState.Instant_StartDelay))
            catchTimeoutInput:Set(tostring(featureState.Instant_CatchTimeout))
            cycleDelayInput:Set(tostring(featureState.Instant_CycleDelay))
            resetCountInput:Set(tostring(featureState.Instant_ResetCount))
            resetPauseInput:Set(tostring(featureState.Instant_ResetPause))
        else
            if WindUI then
                WindUI:Notify({
                    Title = "Load Failed",
                    Content = "No saved configuration found!",
                    Duration = 3,
                    Icon = "x-circle"
                })
            end
        end
    end
})

X5SpeedTab:Section({
    Title = "Activity Feature",
    TextSize = 22,
    TextXAlignment = "Center",
    Opened = true
})

local autoFishToggle = X5SpeedTab:Toggle({
    Title = "AutoFish Ultra Speed",
    Desc = "Still unstable and lots of bugs.",
    Value = false,
    Callback = startOrStopAutoFish
})

X5SpeedTab:Space()

local gameAnimToggle = X5SpeedTab:Toggle({
    Title = "No Animation",
    Desc = "Stop all animations from the game.",
    Value = false,
    Callback = setGameAnimationsEnabled
})

print("âœ… X5 Speed Tab Loaded!")

-------------------------------------------
----- =======[ AUTO QUEST TAB ]
-------------------------------------------

QuestTab:Section({
    Title = "Quest Control",
    TextSize = 22,
    TextXAlignment = "Center",
    Opened = true
})

local Selected = {}
local Quests = {
    {Name = "Aura", Display = "Aura Boat"},
    {Name = "Deep Sea", Display = "Ghostfinn Rod"},
    {Name = "Element", Display = "Element Rod"}
}

for _, quest in ipairs(Quests) do
    QuestTab:Section({
        Title = "QUEST: " .. quest.Display,
        TextSize = 20,
        TextXAlignment = "Center",
        Opened = true
    })
    
    local function build_dropdown_options()
        local opts = {"Auto"}
        local tasks = _G.getActiveTasks(quest.Name)
        for _, t in ipairs(tasks) do
            -- Use the clean task name
            table.insert(opts, t.name)
        end
        return opts
    end
    
    local dropdown = QuestTab:Dropdown({
        Title = "Select Task",
        Desc = "Choose specific task or Auto",
        Values = build_dropdown_options(),
        Value = "Auto",
        SearchBarEnabled = true,
        Callback = function(selected)
            Selected[quest.Name] = selected
            NotifyInfo("Task Selected", selected .. " for " .. quest.Display)
        end
    })
    
    myConfig:Register("QuestTask_" .. quest.Name, dropdown)
    
    task.spawn(function()
        while task.wait(10) do
            pcall(function()
                if dropdown and dropdown.Refresh then
                    local newOpts = build_dropdown_options()
                    dropdown:Refresh(newOpts)
                end
            end)
        end
    end)
    
    QuestTab:Space()
    
    local questToggle = QuestTab:Toggle({
        Title = "Auto " .. quest.Display,
        Desc = "Start automatic quest completion",
        Value = false,
        Callback = function(val)
            if val then
                if quest.Name == "Element" and _G.getQuestProgress("Deep Sea") < 100 then
                    NotifyWarning("Warning", "Complete Ghostfinn Rod quest first!")
                    return
                end
                
                local sel = Selected[quest.Name] or "Auto"
                if sel == "Auto" then sel = nil end
                
                _G.QuestState.Active = true
                _G.QuestState.CurrentQuest = quest.Name
                _G.QuestState.SelectedTask = sel
                _G.QuestState.CurrentLocation = nil
                _G.QuestState.Teleported = false
                _G.QuestState.Fishing = false
                _G.QuestState.LastProgress = _G.getQuestProgress(quest.Name)
                _G.QuestState.LastTaskIndex = nil
                
                _G.SendQuestNotification(quest.Display, sel or "Auto", _G.QuestState.LastProgress, "START")
                
                NotifySuccess("ðŸŽ¯ Quest Started", quest.Display .. " is now active!")
            else
                _G.QuestState.Active = false
                Config.AutoFishingNewMethod = false
                NotifyInfo("Quest Stopped", quest.Display .. " deactivated")
            end
        end
    })
    
    myConfig:Register("QuestToggle_" .. quest.Name, questToggle)
    
    QuestTab:Space()
    
    -- FIXED: Check Progress Button with full task details
    QuestTab:Button({
        Title = "Check Progress",
        Desc = "View current quest progress",
        Justify = "Center",
        Icon = "bar-chart",
        Callback = function()
            local all = _G.getAllTasks(quest.Name)
            if #all == 0 then
                NotifyError("No Tasks Found", "Quest not available or not started")
                return
            end
            
            local progress = _G.getQuestProgress(quest.Name)
            local msg = "ðŸ“Š " .. quest.Display .. "\n\n"
            
            -- Show all tasks with full names
            for i, t in ipairs(all) do
                local icon = t.completed and "âœ…" or "â³"
                local status = t.completed and " (DONE)" or ""
                -- Show full task name with percentage
                msg = msg .. string.format("%s %s: %.1f%%%s", icon, t.name, t.percent, status)
                if i < #all then msg = msg .. "\n\n" end
            end
            
            msg = msg .. string.format("\n\nðŸ“ˆ TOTAL PROGRESS: %.1f%%", progress)
            
            WindUI:Notify({
                Title = "ðŸ“‹ " .. quest.Display,
                Content = msg,
                Duration = 8,
                Icon = "info"
            })
        end
    })
    
    QuestTab:Space()
end

-------------------------------------------
----- =======[ HOOK TAB ]
-------------------------------------------

HookTab:Section({
    Title = "Telegram Settings",
    TextSize = 22,
    TextXAlignment = "Center",
    Opened = true
})

local telegramToggle = HookTab:Toggle({
    Title = "Enable Telegram Hook",
    Desc = "Send fish notifications to Telegram",
    Value = _G.TelegramConfig.Enabled,
    Callback = function(v)
        _G.TelegramConfig.Enabled = v
        if v then
            NotifySuccess("Telegram", "Notifications enabled!")
        else
            NotifyWarning("Telegram", "Notifications disabled")
        end
    end
})

myConfig:Register("TelegramEnabled", telegramToggle)

HookTab:Space()

local questNotifToggle = HookTab:Toggle({
    Title = "Enable Quest Notifications",
    Desc = "Send quest progress to Telegram",
    Value = _G.TelegramConfig.QuestNotifications,
    Callback = function(v)
        _G.TelegramConfig.QuestNotifications = v
        NotifyInfo("Quest Notifications", v and "Enabled âœ…" or "Disabled âŒ")
    end
})

myConfig:Register("QuestNotifications", questNotifToggle)

HookTab:Space()

local chatIDInput = HookTab:Input({
    Title = "Telegram Chat ID",
    Desc = "Enter your Telegram Chat ID",
    Placeholder = "e.g., -1001234567890",
    Value = "",
    Callback = function(Text)
        _G.TelegramConfig.ChatID = Text
        NotifySuccess("ðŸ’¾ Chat ID Saved", "Telegram configured successfully!")
    end
})

myConfig:Register("TelegramChatID", chatIDInput)

HookTab:Space()

HookTab:Paragraph({
    Title = "â„¹ï¸ Token Info",
    Desc = "Bot token is pre-configured. Just enter your Chat ID above to start receiving notifications.\n\nTo get your Chat ID:\n1. Message @userinfobot on Telegram\n2. Copy your ID\n3. Paste it above"
})

HookTab:Space()

HookTab:Section({
    Title = "Select Rarities (Max 3)",
    TextSize = 20,
    TextXAlignment = "Center",
    Opened = true
})

local rarities = {"SECRET", "MYTHIC", "LEGENDARY", "EPIC", "RARE", "UNCOMMON", "COMMON"}

for _, r in ipairs(rarities) do
    local rarityToggle = HookTab:Toggle({
        Title = r,
        Desc = "Notify when catching " .. r .. " fish",
        Value = _G.TelegramConfig.SelectedRarities[r] or false,
        Callback = function(val)
            if val then
                if _G.CountSelected() >= _G.TelegramConfig.MaxSelection then
                    NotifyWarning("âš ï¸ Max Selection", "Maximum 3 rarities allowed!")
                    _G.TelegramConfig.SelectedRarities[r] = false
                    return
                else
                    _G.TelegramConfig.SelectedRarities[r] = true
                    NotifySuccess("Rarity Added", r .. " notifications enabled")
                end
            else
                _G.TelegramConfig.SelectedRarities[r] = false
                NotifyInfo("Rarity Removed", r .. " notifications disabled")
            end
        end
    })
    
    myConfig:Register("Rarity_" .. r, rarityToggle)
end

HookTab:Space()

HookTab:Section({
    Title = "Test Notifications",
    TextSize = 20,
    TextXAlignment = "Center",
    Opened = true
})

HookTab:Button({
    Title = "Test Random SECRET",
    Desc = "Send test SECRET fish notification",
    Justify = "Center",
    Icon = "send",
    Callback = function()
        if _G.TelegramConfig.ChatID == "" then
            NotifyError("âŒ Error", "Enter Chat ID first!")
            return
        end
        
        local secretItems = {}
        for id, info in pairs(_G.ItemDatabase) do
            local tier = tonumber(info.Tier) or 0
            if tier == 7 or string.upper(tostring(info.Rarity)) == "SECRET" then
                table.insert(secretItems, {Id = id, Info = info})
            end
        end
        
        if #secretItems == 0 then
            NotifyError("âŒ No Data", "No SECRET items in database")
            return
        end
        
        local chosen = secretItems[math.random(1, #secretItems)]
        local weight = math.random(2, 6) + math.random()
        local invCount = _G.RefreshInventoryCount()
        
        local msg = _G.BuildTelegramMessage(chosen.Info, chosen.Id, "SECRET", weight, invCount)
        _G.SendTelegram(msg)
        
        NotifySuccess("âœ… Test Sent", "SECRET fish notification sent!")
    end
})

HookTab:Space()

HookTab:Button({
    Title = "Test Random LEGENDARY",
    Desc = "Send test LEGENDARY fish notification",
    Justify = "Center",
    Icon = "send",
    Callback = function()
        if _G.TelegramConfig.ChatID == "" then
            NotifyError("âŒ Error", "Enter Chat ID first!")
            return
        end
        
        local legendaryItems = {}
        for id, info in pairs(_G.ItemDatabase) do
            local tier = tonumber(info.Tier) or 0
            if tier == 5 or string.upper(tostring(info.Rarity)) == "LEGENDARY" then
                table.insert(legendaryItems, {Id = id, Info = info})
            end
        end
        
        if #legendaryItems == 0 then
            NotifyError("âŒ No Data", "No LEGENDARY items")
            return
        end
        
        local chosen = legendaryItems[math.random(1, #legendaryItems)]
        local weight = math.random(1, 5) + math.random()
        local invCount = _G.RefreshInventoryCount()
        
        local msg = _G.BuildTelegramMessage(chosen.Info, chosen.Id, "LEGENDARY", weight, invCount)
        _G.SendTelegram(msg)
        
        NotifySuccess("âœ… Test Sent", "LEGENDARY fish notification sent!")
    end
})

HookTab:Space()

HookTab:Button({
    Title = "Test Random MYTHIC",
    Desc = "Send test MYTHIC fish notification",
    Justify = "Center",
    Icon = "send",
    Callback = function()
        if _G.TelegramConfig.ChatID == "" then
            NotifyError("âŒ Error", "Enter Chat ID first!")
            return
        end
        
        local mythicItems = {}
        for id, info in pairs(_G.ItemDatabase) do
            local tier = tonumber(info.Tier) or 0
            local rarity = string.upper(tostring(info.Rarity))
            if tier == 6 or rarity == "MYTHIC" or rarity == "MYTICH" then
                table.insert(mythicItems, {Id = id, Info = info})
            end
        end
        
        if #mythicItems == 0 then
            NotifyError("âŒ No Data", "No MYTHIC items")
            return
        end
        
        local chosen = mythicItems[math.random(1, #mythicItems)]
        local weight = math.random(2, 5) + math.random()
        local invCount = _G.RefreshInventoryCount()
        
        local msg = _G.BuildTelegramMessage(chosen.Info, chosen.Id, "MYTHIC", weight, invCount)
        _G.SendTelegram(msg)
        
        NotifySuccess("âœ… Test Sent", "MYTHIC fish notification sent!")
    end
})

HookTab:Space()

HookTab:Section({
    Title = "Developer Info",
    TextSize = 20,
    TextXAlignment = "Center",
    Opened = true
})
