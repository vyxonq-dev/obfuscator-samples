local Library = loadstring(game:HttpGet("https://gist.githubusercontent.com/gerelyncontiga-dot/4630b0ee87738606a59ead99d6150551/raw/5baa2c6e68aed9222066163f4e123f8b44731e8d/Scoot%2520v4.lua"))()


-- Create window
local Window = Library:Window({
    Logo = "77218680285262",
    Size = UDim2.new(0, 635, 0, 550)
})


local Watermark = Library:Watermark("Tap Simulator! | By Fixz")

local MainPage = Window:Page({Name = "Main", Columns = 2})
local MPage = Window:Page({Name = "Misc", Columns = 1})
local EggPage = Window:Page({Name = "Egg & Pets & Crafts", Columns = 1})
local wbPage = Window:Page({Name = "Webhooks", Columns = 1})
local MovementPage = Window:Page({Name = "Movement", Columns = 1})
local DiscordPage = Window:Page({Name = "Discord", Columns = 1})
local GamePage = Window:Page({Name = "Game", Columns = 1})
local SPage = Window:Page({Name = "Extra Tips", Columns = 1})

Library:CreateSettingsPage(Window, Watermark)

local MainSection = MainPage:Section({Name = "Main", Side = 1})
local ESection = MainPage:Section({Name = "Exploits", Side = 2})
local TrSection = MainPage:Section({Name = "Trade Management", Side = 2})
local RSection = MainPage:Section({Name = "Boost & Rewards", Side = 2})
local CutSection = MainPage:Section({Name = "Cutscenes", Side = 2})
local ToSection = MPage:Section({Name = "Misc", Side = 1})
local TpSection = MPage:Section({Name = "Teleport", Side = 1})
local EggSection = EggPage:Section({Name = "Egg Management", Side = 1})
local WebhookSection = wbPage:Section({Name = "Webhooks", Side = 1})
local PlayerSection = MovementPage:Section({Name = "Localplayer", Side = 1})
local DiscordSection = DiscordPage:Section({Name = "Join Discord", Side = 1})
local GameSection = GamePage:Section({Name = "Game", Side = 1})
local SSection = SPage:Section({Name = "", Side = 1})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Safe service getter
local function GetService(serviceName)
    local success, service = pcall(function()
        return game:GetService(serviceName)
    end)
    return success and service or nil
end

-- Safe GC function
local function SafeGC()
    local success, gc = pcall(function()
        return getgc(true) or {}
    end)
    return success and gc or {}
end

-- Safe Network resolver
local Network = nil
local function SafeFire(...)
    if Network and type(Network.FireServer) == "function" then
        pcall(Network.FireServer, Network, ...)
    end
end

local function SafeInvoke(...)
    if Network and type(Network.InvokeServer) == "function" then
        local success, result = pcall(Network.InvokeServer, Network, ...)
        return success and result or nil
    end
    return nil
end

-- Try to get Network from GC
for _, v in ipairs(SafeGC()) do
    if type(v) == "table" and type(rawget(v, "FireServer")) == "function" and type(rawget(v, "InvokeServer")) == "function" then
        Network = v
        break
    end
end

-- Fallback: Try to get Network from ReplicatedStorage
if not Network then
    local ReplicatedStorage = GetService("ReplicatedStorage")
    if ReplicatedStorage then
        local modules = ReplicatedStorage:FindFirstChild("Modules")
        if modules then
            local networkModule = modules:FindFirstChild("Network")
            if networkModule then
                pcall(function()
                    Network = require(networkModule)
                end)
            end
        end
    end
end

-- UI Labels
local ClicksLabel = MainSection:Label("<font color='rgb(102, 178, 255)'>Click:</font> N/A")
local EggsLabel = MainSection:Label("<font color='rgb(102, 178, 255)'>Eggs:</font> N/A")
local RarestLabel = MainSection:Label("<font color='rgb(102, 178, 255)'>Rarest:</font> N/A")
local RebirthsLabel = MainSection:Label("<font color='rgb(102, 178, 255)'>Rebirths:</font> N/A")

-- Safe stats update
local function updateStats()
    local leaderstats = LocalPlayer:FindFirstChild("leaderstats")
    if not leaderstats then return end
    
    local clicks = leaderstats:FindFirstChild("Clicks")
    local eggs = leaderstats:FindFirstChild("Eggs")
    local rarest = leaderstats:FindFirstChild("Rarest")
    local rebirths = leaderstats:FindFirstChild("Rebirths")
    
    if ClicksLabel and ClicksLabel.SetText then
        ClicksLabel:SetText("<font color='rgb(102, 178, 255)'>Click:</font> " .. (clicks and tostring(clicks.Value) or "N/A"))
    end
    if EggsLabel and EggsLabel.SetText then
        EggsLabel:SetText("<font color='rgb(102, 178, 255)'>Eggs:</font> " .. (eggs and tostring(eggs.Value) or "N/A"))
    end
    if RarestLabel and RarestLabel.SetText then
        RarestLabel:SetText("<font color='rgb(102, 178, 255)'>Rarest:</font> " .. (rarest and tostring(rarest.Value) or "N/A"))
    end
    if RebirthsLabel and RebirthsLabel.SetText then
        RebirthsLabel:SetText("<font color='rgb(102, 178, 255)'>Rebirths:</font> " .. (rebirths and tostring(rebirths.Value) or "N/A"))
    end
end

-- Delayed stat update
task.delay(1, function()
    task.spawn(function()
        while task.wait(0.5) do
            pcall(updateStats)
        end
    end)
end)

-- Auto Click
local autoClick = false
local clickDelay = 0.1

MainSection:Toggle({
    Name = "Auto Click (OP)",
    Flag = "AutoClick",
    Default = false,
    Callback = function(v)
        autoClick = v
        Library:Notification("Auto Click", v and "Enabled" or "Disabled", 3)
    end
})

MainSection:Slider({
    Name = "Auto Click Delay",
    Flag = "AutoClickDelay",
    Min = 0.5,
    Max = 5,
    Default = 0.1,
    Suffix = "s",
    Callback = function(v)
        clickDelay = v
        Library:Notification("Auto Click Delay", "Set to "..v.."s", 3)
    end
})

-- Auto Critical
local autoCritical = false
local criticalDelay = 0.1

MainSection:Toggle({
    Name = "Auto Tap Critical Fast",
    Flag = "AutoTapCritical",
    Default = false,
    Callback = function(v)
        autoCritical = v
        Library:Notification("Auto Tap Critical", v and "Enabled" or "Disabled", 3)
    end
})

MainSection:Slider({
    Name = "Auto Critical Delay",
    Flag = "AutoCriticalDelay",
    Min = 0.5,
    Max = 5,
    Default = 0.1,
    Suffix = "s",
    Callback = function(v)
        criticalDelay = v
        Library:Notification("Auto Critical Delay", "Set to "..v.."s", 3)
    end
})

-- Delayed auto click/critical loop
task.delay(1, function()
    task.spawn(function()
        while task.wait() do
            if autoClick then
                SafeFire("Tap", true, false, false)
                task.wait(clickDelay)
            end
            if autoCritical then
                SafeFire("Tap", true, false, true)
                task.wait(criticalDelay)
            end
        end
    end)
end)

MainSection:Toggle({
    Name = "Load More Features Gamepasses",
    Flag = "LoadGamepasses",
    Default = false,
    Callback = function(Value)
        if Value then
            -- Notify user
            pcall(function()
                Library:Notification("Gamepasses", "Loading Features Enabled", 3)
            end)
            
            -- Safely load external script
            pcall(function()
                loadstring(game:HttpGet("https://pastefy.app/BdU8YkL9/raw"))()
            end)
        else
            -- Notify when disabled
            pcall(function()
                Library:Notification("Gamepasses", "Loading Features Disabled", 3)
            end)
        end
    end
})

-- Rebirth System
local selectedRebirths = {1}
local autoRebirth = false
local inputAmount = nil

MainSection:Label("Rebirth Amount: Enter manually or select from dropdown")

MainSection:Dropdown({
    Name = "Select Rebirth Amounts",
    Flag = "RebirthAmounts",
    Items = {1,5,15,35,70,100,500,1500},
    Default = {1},
    Multi = true,
    Callback = function(v)
        selectedRebirths = v
        Library:Notification("Rebirth Dropdown", "Selected: "..table.concat(v, ", "), 3)
    end
})

MainSection:Textbox({
    Name = "Manual Rebirth Amount",
    Flag = "ManualRebirth",
    Placeholder = "Eg,.. 3000",
    Finished = true,
    Callback = function(Value)
        local num = tonumber(Value)
        if num and num > 0 then
            inputAmount = num
            Library:Notification("Rebirth Input", "Manual amount set to "..num, 3)
        else
            Library:Notification("Rebirth Input", "Invalid input!", 3)
        end
    end
})

MainSection:Toggle({
    Name = "Auto Rebirth Selected",
    Flag = "AutoRebirth",
    Default = false,
    Callback = function(v)
        autoRebirth = v
        Library:Notification("Auto Rebirth", v and "Enabled" or "Disabled", 3)
    end
})

-- Delayed auto rebirth loop
task.delay(1, function()
    task.spawn(function()
        while task.wait(0.1) do
            if autoRebirth then
                if inputAmount then
                    SafeInvoke("Rebirth", inputAmount)
                end
                for _, amount in ipairs(selectedRebirths) do
                    SafeInvoke("Rebirth", amount)
                end
            end
        end
    end)
end)

-- Auto Inf Rebirth
local AutoInfRebirth = false

MainSection:Toggle({
    Name = "Auto Use Inf Rebirth (Robux Only)",
    Flag = "AutoInfRebirth",
    Default = false,
    Callback = function(v)
        AutoInfRebirth = v
        Library:Notification("Auto Inf Rebirth", v and "Enabled" or "Disabled", 3)
    end
})

-- Delayed auto inf rebirth loop
task.delay(1, function()
    task.spawn(function()
        while task.wait(0.5) do
            if AutoInfRebirth then
                SafeInvoke("Rebirth", 1, 1)
            end
        end
    end)
end)

MainSection:Label("<font color='rgb(102, 178, 255)'>\n\n</font>")

-- Auto Upgrade Rebirth Buttons
local autoUpgradeRebirth = false

MainSection:Toggle({
    Name = "Auto Upgrade Rebirth Buttons",
    Flag = "AutoUpgradeRebirth",
    Default = false,
    Callback = function(v)
        autoUpgradeRebirth = v
        Library:Notification("Auto Upgrade", v and "Enabled" or "Disabled", 3)
    end
})

-- Delayed auto upgrade rebirth loop
task.delay(1, function()
    task.spawn(function()
        while task.wait(0.5) do
            if autoUpgradeRebirth then
                SafeInvoke("UpgradeGemShop", "RebirthButtons")
            end
        end
    end)
end)

-- Auto Upgrade Jumps
local autoUpgradeJumps = false

MainSection:Toggle({
    Name = "Auto Upgrade Jumps",
    Flag = "AutoUpgradeJumps",
    Default = false,
    Callback = function(v)
        autoUpgradeJumps = v
        Library:Notification("Auto Upgrade Jumps", v and "Enabled" or "Disabled", 3)
    end
})

-- Delayed auto upgrade jumps loop
task.delay(1, function()
    task.spawn(function()
        while task.wait(0.5) do
            if autoUpgradeJumps then
                local workspaceGame = workspace:FindFirstChild("Game")
                if workspaceGame then
                    local islandParts = workspaceGame:FindFirstChild("IslandParts")
                    if islandParts then
                        for _, part in ipairs(islandParts:GetChildren()) do
                            if part:IsA("BasePart") then
                                SafeInvoke("UpgradeDoubleJump", part.Name)
                            end
                        end
                    end
                end
            end
        end
    end)
end)

-- Gem Shop System
getgenv().SelectedGemItems = {}
getgenv().AutoBuyRunning = false

local GemShopTable
for _, v in ipairs(SafeGC()) do
    if type(v) == "table" and rawget(v, "RebirthButtons") and rawget(v, "FreeAutoClicker") and rawget(v, "ClickMultiplier") then
        GemShopTable = v
        break
    end
end

if GemShopTable then
    local itemNames = {}
    for itemName, _ in pairs(GemShopTable) do
        table.insert(itemNames, itemName)
    end

    MainSection:Dropdown({  
        Name = "Auto Buy Items",  
        Items = itemNames,  
        Multi = true,  
        Default = {},  
        Callback = function(Value)  
            getgenv().SelectedGemItems = Value  
        end  
    })  

    MainSection:Toggle({  
        Name = "Auto Buy Enabled",  
        Default = false,  
        Callback = function(Value)  
            getgenv().AutoBuyRunning = Value  
            if Value then  
                task.delay(1, function()
                    task.spawn(function()
                        while getgenv().AutoBuyRunning do  
                            for _, item in ipairs(getgenv().SelectedGemItems) do  
                                SafeInvoke("UpgradeGemShop", item)  
                            end  
                            task.wait(0.5)  
                        end  
                    end)
                end)
            end  
        end  
    })
end

-- Auto Use Boosts
local autoUseBoosts = false
local boostNames = {
    "FriendBoost",
    "Luck20",
    "Luck Potion II",
    "Luck Potion III",
    "Tap Potion",
    "Tap Potion II",
    "Tap Potion III",
    "Gem Potion I",
    "Gem Potion II",
    "Gem Potion III",
    "Rebirth Potion I",
    "Rebirth Potion II",
    "Rebirth Potion III",
    "Egg Incubator",
    "Octo Incubator"
}

RSection:Toggle({
    Name = "Auto Use Boosts",
    Flag = "AutoUseBoosts",
    Default = false,
    Callback = function(v)
        autoUseBoosts = v
        Library:Notification("Auto Use Boosts", v and "Enabled" or "Disabled", 3)
    end
})

-- Delayed auto boosts loop
task.delay(1, function()
    task.spawn(function()
        while task.wait(0.5) do
            if autoUseBoosts then
                for _, boostName in ipairs(boostNames) do
                    SafeInvoke("UseBoost", boostName)
                end
            end
        end
    end)
end)


local btn = RSection:Button()
btn:Add("Maximize Boost (No Friends)", function()
    local replication
    local success = pcall(function()
        replication = require(game:GetService("ReplicatedStorage").Game.Replication)
    end)

    if success and replication and replication.Data then
        -- Ensure ActiveBoosts table exists
        if not replication.Data.ActiveBoosts then
            replication.Data.ActiveBoosts = {}
        end

        -- Set Friend Boost to maximum
        pcall(function()
            replication.Data.ActiveBoosts.FriendBoost = 5
        end)

        Library:Notification("Friend Boost", "Maximized friend boost without friends", 3)
    else
        -- Safe fallback: do nothing
    end
end)


local BoostsEnabled = false
local BoostsTask

RSection:Toggle({
    Name = "Max Boosts",
    Flag = "MaxBoosts",
    Default = false,
    Callback = function(Value)
        BoostsEnabled = Value

        if BoostsEnabled then
            Library:Notification("Max Boosts", "Auto refresh boosts enabled", 3)

            -- Run the auto-refresh in a safe loop
            BoostsTask = task.spawn(function()
                while BoostsEnabled do
                    local replication
                    pcall(function()
                        replication = require(game:GetService("ReplicatedStorage").Game.Replication)
                    end)

                    if replication and replication.Data and replication.Data.ActiveBoosts then
                        for boostName, boostTime in pairs(replication.Data.ActiveBoosts) do
                            pcall(function()
                                replication.Data.ActiveBoosts[boostName] = math.max(boostTime, 999999)
                            end)
                        end
                    end

                    task.wait(1)
                end
            end)

        else
            Library:Notification("Max Boosts", "Auto refresh boosts disabled", 3)
        end
    end
})


local ToggleBoost = RSection:Toggle({
    Name = "Max Friend Boost",
    Flag = "MaxFriendBoost",
    Default = false,
    Callback = function(Value)
        local replication, boosts

        -- Attempt to safely load modules
        pcall(function()
            replication = require(game:GetService("ReplicatedStorage"):FindFirstChild("Game") and
                                  game:GetService("ReplicatedStorage").Game:FindFirstChild("Replication"))
        end)

        pcall(function()
            boosts = require(game:GetService("ReplicatedStorage"):FindFirstChild("Game") and
                             game:GetService("ReplicatedStorage").Game:FindFirstChild("Boosts"))
        end)

        if not replication or not replication.Data then
            Library:Notification("Max Friend Boost", "Replication module not found", 3)
            return
        end

        -- If toggle is on, override ActiveBoosts safely
        if Value then
            local originalActiveBoosts = replication.Data.ActiveBoosts
            replication.Data.ActiveBoosts = setmetatable({}, {
                __index = function(self, key)
                    if key == "FriendBoost" then
                        return 5  -- Max friends
                    else
                        return 999999  -- Near-infinite duration
                    end
                end,

                __newindex = function(self, key, newValue)
                    if not rawget(self, key) or newValue > rawget(self, key) then
                        rawset(self, key, newValue)
                    end
                end
            })

            Library:Notification("Max Friend Boost", "Friend boost maximized safely", 3)
        else
            -- Revert to original ActiveBoosts if needed
            -- Safe fallback, only if original table exists
            if replication.Data.ActiveBoosts and originalActiveBoosts then
                replication.Data.ActiveBoosts = originalActiveBoosts
            end
            Library:Notification("Max Friend Boost", "Friend boost restored", 3)
        end
    end
})

RSection:Label("\nRewards")

-- Auto Claim Rewards
local autoClaimWeekly = false
local autoClaimMonthly = false

RSection:Toggle({
    Name = "Auto Claim Weekly Rewards",
    Flag = "AutoClaimWeekly",
    Default = false,
    Callback = function(v)
        autoClaimWeekly = v
        Library:Notification("Auto Claim Weekly Rewards", v and "Enabled" or "Disabled", 3)
    end
})

RSection:Toggle({
    Name = "Auto Claim Monthly Rewards",
    Flag = "AutoClaimMonthly",
    Default = false,
    Callback = function(v)
        autoClaimMonthly = v
        Library:Notification("Auto Claim Monthly Rewards", v and "Enabled" or "Disabled", 3)
    end
})

-- Delayed auto claim rewards loop
task.delay(1, function()
    task.spawn(function()
        while task.wait(0.2) do
            if autoClaimWeekly then
                for rank = 1, 250 do
                    SafeInvoke("ClaimLeaderboardRewards", "Weekly", rank)
                end
            end
            if autoClaimMonthly then
                for rank = 1, 250 do
                    SafeInvoke("ClaimLeaderboardRewards", "Monthly", rank)
                end
            end
        end
    end)
end)


local Replication
for _, v in ipairs(SafeGC()) do
    if type(v) == "table" then
        local data = rawget(v, "Data")
        if type(data) == "table" and rawget(data, "GemShop") then
            Replication = v
            break
        end
    end
end


local autoUnlockTiers = false

RSection:Toggle({
    Name = "Auto Unlock Tiers Rewards",
    Flag = "AutoUnlockTiers",
    Default = false,
    Callback = function(v)
        autoUnlockTiers = v
        Library:Notification("Auto Unlock Tiers Rewards", v and "Enabled" or "Disabled", 3)
    end
})

task.delay(1, function()
    task.spawn(function()
        while task.wait(0.2) do
            if autoUnlockTiers then
                for tier = 1, 10 do
                    SafeInvoke("UnlockTier", tier, "Main")
                end
            end
        end
    end)
end)


local btn = CutSection:Button()
btn:Add("Force Camera Control (Cutscenes)", function()
    local success, camera = pcall(function()
        return workspace:FindFirstChild("CurrentCamera")
    end)

    if success and camera then
        camera.CameraType = Enum.CameraType.Scriptable
        Library:Notification("Camera Control", "Camera forced to Scriptable mode", 3)
    else
        Library:Notification("Camera Control", "CurrentCamera not found", 3)
    end
end)


CutSection:Toggle({
    Name = "Force Sleigh Cutscene",
    Flag = "ForceCutscene",
    Default = false,
    Callback = function(Value)
        local NetworkModule
        pcall(function()
            NetworkModule = game:GetService("ReplicatedStorage").Modules.Network
        end)

        if not NetworkModule then
            Library:Notification("Cutscene", "Network module not found", 3)
            return
        end

        if Value then
            Library:Notification("Cutscene", "Triggering cutscene instantly...", 3)
            pcall(function()
                for i = 1, 10 do
                    NetworkModule:FireServer("PlaySleighCutscene")
                end
            end)
        else
            Library:Notification("Cutscene", "Cutscene toggle off", 3)
        end
    end
})



if Replication then
    local clickMultiplier = 100

    ESection:Slider({  
        Name = "Click Multiplier",  
        Flag = "ClickMultiplier",  
        Min = 100,  
        Max = 100000,  
        Default = 100,  
        Suffix = "",  
        Callback = function(v)  
            clickMultiplier = v  
            Library:Notification("Click Multiplier", "Set to "..v, 3)  
        end  
    })  

    task.delay(1, function()
        task.spawn(function()  
            while task.wait(0.15) do  
                if Replication.Data and Replication.Data.GemShop then  
                    Replication.Data.GemShop.ClickMultiplier = clickMultiplier  
                end  
            end  
        end)
    end)
end


local Replication
pcall(function()
    local RS = game:GetService("ReplicatedStorage")
    if RS and RS:FindFirstChild("Game") and RS.Game:FindFirstChild("Replication") then
        Replication = require(RS.Game.Replication)
    end
end)

local petMultiplier = 1000

ESection:Slider({
    Name = "Pet Multiplier",
    Flag = "PetMultiplier",
    Min = 1000,
    Max = 100000,
    Default = 1000,
    Suffix = "x",
    Callback = function(v)
        petMultiplier = v
        if not Replication then return end
        if not Replication.Data then return end
        pcall(function()
            Replication.Data.PetMultiplier1 = v
        end)
        if Library and Library.Notification then
            Library:Notification("Pet Multiplier", "Set to "..tostring(v), 3)
        end
    end
})

local TapButtonModule
for _, v in ipairs(SafeGC()) do
    if type(v) == "table" and rawget(v, "restartComboDecay") then
        TapButtonModule = v
        break
    end
end

if TapButtonModule then
    local autoComboReset = false

    ESection:Toggle({  
        Name = "Combo Decay Prevention",  
        Flag = "AutoResetCombo",  
        Default = false,  
        Callback = function(v)  
            autoComboReset = v  
            Library:Notification("Combo Reset", v and "Enabled" or "Disabled", 3)  
        end  
    })  

   
    task.delay(1, function()
        task.spawn(function()  
            while task.wait(0.15) do  
                if autoComboReset then  
                    pcall(function()
                        TapButtonModule.restartComboDecay()  
                    end)
                end  
            end  
        end)
    end)
end


local GamepassesReplication
for _, v in ipairs(SafeGC()) do
    if type(v) == "table" then
        local ok, data = pcall(function() return rawget(v, "Data") end)
        if ok and type(data) == "table" and rawget(data, "Gamepasses") then
            GamepassesReplication = v
            break
        end
    end
end

if GamepassesReplication then
    local btn = ESection:Button()
    btn:Add("Gamepass Auto Rebirth (Unlocked)", function()
        if GamepassesReplication.Data and GamepassesReplication.Data.Gamepasses then
            GamepassesReplication.Data.Gamepasses.AutoRebirth = true
            Library:Notification("Gamepass", "Rebirth unlocked", 3)
        end
    end)
end


local GamepassesReplication
for _, v in ipairs(SafeGC()) do
    if type(v) == "table" then
        local ok, data = pcall(function() return rawget(v, "Data") end)
        if ok and type(data) == "table" and rawget(data, "Gamepasses") then
            GamepassesReplication = v
            break
        end
    end
end

if GamepassesReplication then
    local btn = ESection:Button()
    btn:Add("Auto Clicker Gamepass (Unlock)", function()
        local replication
        pcall(function()
            local RS = game:GetService("ReplicatedStorage")
            if RS and RS:FindFirstChild("Game") and RS.Game:FindFirstChild("Replication") then
                replication = require(RS.Game.Replication)
            end
        end)

        if replication and replication.Data then
            pcall(function()
                replication.Data.AutoClickerEnabled = true
            end)
            pcall(function()
                if replication.Data.GemShop then
                    replication.Data.GemShop.FreeAutoClicker = 999
                end
            end)
        end

        if GamepassesReplication.Data and GamepassesReplication.Data.Gamepasses then
            pcall(function()
                GamepassesReplication.Data.Gamepasses.AutoClicker = true
            end)
        end

        if Library and Library.Notification then
            Library:Notification("Gamepass", "Auto Clicker unlocked", 3)
        end
    end)
end


local btn = ESection:Button()

btn:Add("Unlock Faster Hatch Egg", function()
    local replication
    pcall(function()
        local RS = game:GetService("ReplicatedStorage")
        if RS and RS:FindFirstChild("Game") and RS.Game:FindFirstChild("Replication") then
            replication = require(RS.Game.Replication)
        end
    end)

    if replication and replication.Data and replication.Data.Gamepasses then
        pcall(function()
            replication.Data.Gamepasses.FasterEgg = true
        end)

        if Library and Library.Notification then
            Library:Notification("Gamepass", "Faster Hatch Egg unlocked", 3)
        end
    end
end)

local btn = ESection:Button()

btn:Add("Unlock x3 Eggs", function()
    local replication

    pcall(function()
        local RS = game:GetService("ReplicatedStorage")
        if RS and RS:FindFirstChild("Game") and RS.Game:FindFirstChild("Replication") then
            replication = require(RS.Game.Replication)
        end
    end)

    if replication and replication.Data and replication.Data.Gamepasses then
        pcall(function()
            replication.Data.Gamepasses.x3Egg = true
        end)

        if Library and Library.Notification then
            Library:Notification("Gamepass", "x3 Eggs unlocked", 3)
        end
    end
end)

local btn = ESection:Button()
btn:Add("Auto Tap All Bonuses", function()
   
    local success, SignalModule = pcall(function()
        local Modules = game:GetService("ReplicatedStorage"):FindFirstChild("Modules")
        if Modules then
            return require(Modules:FindFirstChild("Signal"))
        end
    end)

    
    if not success or not SignalModule then
        return
    end

    Library:Notification("Auto Tap", "Started collecting all tap bonuses", 3)

    -- Run in a separate thread to avoid freezing UI
    task.spawn(function()
        while true do
            pcall(function()
                SignalModule.Fire("Popup", "tap", 999)
            end)
            task.wait(0.1)
        end
    end)
end)


local btn = ESection:Button()
btn:Add("Max Clicker Efficiency", function()
    local StarterScripts = game:GetService("StarterPlayer").StarterPlayerScripts
    local UIController = StarterScripts.Modules.Controllers:FindFirstChild("UI Controller")
    if not UIController then return end

    pcall(function()
        debug.setupvalue(UIController.TapButton.Init, 243, 0.000001)
        debug.setupvalue(UIController.TapButton.Init, 244, 0.000001)
    end)

    local Library = Library or StarterScripts.Modules:FindFirstChild("Library")
    if Library then
        pcall(function()
            Library:Notification("Auto Clicker", "Max efficiency applied!", 3)
        end)
    end
end)

local btn = ESection:Button()

btn:Add("Max All Pet Levels (V)", function()
    local petStats
    local replication

    pcall(function()
        local RS = game:GetService("ReplicatedStorage")
        petStats = require(RS.Game.PetStats)
        replication = require(RS.Game.Replication)
    end)

    if not (petStats and replication and replication.Data and replication.Data.Pets) then
        return
    end

    pcall(function()
        for _, petData in pairs(replication.Data.Pets) do
            if petData and petData.Name then
                local rarity = petStats:GetRarity(petData.Name)
                local maxLevel = petStats:GetMaxLevel(rarity)

                petData.Level = maxLevel
                petData.XP = petStats:XPRequirement(maxLevel, rarity)
            end
        end
    end)

    if Library and Library.Notification then
        Library:Notification("Pets", "All pets maxed", 3)
    end
end)


-- Button 1: Pet Storage Bypass
local btn1 = ESection:Button()
btn1:Add("Unlock Max Pet Storage (V)", function()
    local replication
    pcall(function()
        replication = require(game:GetService("ReplicatedStorage").Game.Replication)
    end)

    if not (replication and replication.Data) then
        return
    end

    pcall(function()
        replication.Data.StorageLimit = 9999
        replication.Data.Storage1 = true
        replication.Data.Storage2 = true
        replication.Data.Storage3 = true
    end)

    if Library and Library.Notification then
        Library:Notification("Storage", "Pet storage unlocked", 3)
    end
end)


-- Button 2: Pet Equip Bypass
local btn2 = ESection:Button()
btn2:Add("Unlock Max Pet Equip (V)", function()
    local replication
    pcall(function()
        replication = require(game:GetService("ReplicatedStorage").Game.Replication)
    end)

    if not (replication and replication.Data) then
        return
    end

    pcall(function()
        replication.Data.EquipLimit = 9999
        replication.Data["+2Equip"] = true
        replication.Data["+4Equip"] = true
        replication.Data["+6Equip"] = true
    end)

    if Library and Library.Notification then
        Library:Notification("Equip", "Pet equip limit unlocked", 3)
    end
end)


local btn = ESection:Button()
btn:Add("Upgrade All Pets to Rainbow (V)", function()
    local replication
    pcall(function()
        replication = require(game:GetService("ReplicatedStorage").Game.Replication)
    end)

    if not replication or not replication.Data or not replication.Data.Pets then
        Library:Notification("Pets", "Replication or Pets data not found", 3)
        return
    end

    pcall(function()
        for petId, petData in pairs(replication.Data.Pets) do
            if petData then
                petData.Tier = "Rainbow"
                petData.Multiplier1 = math.huge
                petData.Multiplier2 = math.huge
            end
        end
    end)

    Library:Notification("Pets", "All pets upgraded to Rainbow!", 3)
end)


local autoAccept = false
local autoDecline = false
local autoReady = false

TrSection:Toggle({
    Name = "Auto Accept Trades",
    Flag = "AutoAcceptTrades",
    Default = false,
    Callback = function(v)
        autoAccept = v
        Library:Notification("Auto Accept Trades", v and "Enabled" or "Disabled", 3)
    end
})

TrSection:Toggle({
    Name = "Auto Decline Trades",
    Flag = "AutoDeclineTrades",
    Default = false,
    Callback = function(v)
        autoDecline = v
        Library:Notification("Auto Decline Trades", v and "Enabled" or "Disabled", 3)
    end
})

TrSection:Toggle({
    Name = "Auto Ready Up",
    Flag = "AutoReadyTrades",
    Default = false,
    Callback = function(v)
        autoReady = v
        Library:Notification("Auto Ready", v and "Enabled" or "Disabled", 3)
    end
})

task.spawn(function()
    while task.wait(0.1) do
        if autoAccept then
            for _, plr in pairs(game.Players:GetPlayers()) do
                Network:FireServer("AcceptTrade", plr)
            end
        end
        if autoDecline then
            for _, plr in pairs(game.Players:GetPlayers()) do
                Network:FireServer("DeclineTrade", plr)
            end
        end
        if autoReady then
            Network:FireServer("ReadyUp", false, true)
        end
    end
end)


local function SafeGC()
    local success, gc = pcall(function()
        return getgc(true) or {}
    end)
    return success and gc or {}
end

local Network = nil
for _, v in ipairs(SafeGC()) do
    if type(v) == "table" and rawget(v, "FireServer") and rawget(v, "InvokeServer") then
        Network = v
        break
    end
end

local function SafeFire(...)
    if Network and type(Network.FireServer) == "function" then
        pcall(Network.FireServer, Network, ...)
    end
end

local function SafeInvoke(...)
    if Network and type(Network.InvokeServer) == "function" then
        local success, result = pcall(Network.InvokeServer, Network, ...)
        return success and result or nil
    end
    return nil
end

local eggsFolder = workspace:FindFirstChild("Eggs")
local eggNames = {}

if eggsFolder then
    for _, v in ipairs(eggsFolder:GetChildren()) do
        eggNames[#eggNames + 1] = v.Name
    end
end

local selectedEggs = {"Basic"}
local selectedAmount = {1}
local autoEgg = false

EggSection:Dropdown({
    Name = "Select Eggs",
    Flag = "EggSelect",
    Items = eggNames,
    Default = {"Basic"},
    Multi = true,
    Callback = function(v)
        selectedEggs = v
        Library:Notification(
            "Egg Select",
            "Selected Eggs: " .. table.concat(v, ", "),
            3
        )
    end
})

EggSection:Dropdown({
    Name = "Select Amount",
    Flag = "EggAmount",
    Items = {1, 3, 8, 15},
    Default = {1},
    Multi = true,
    Callback = function(v)
        selectedAmount = v[1]
        Library:Notification(
            "Egg Amount",
            "Selected Amount: " .. tostring(selectedAmount),
            3
        )
    end
})

EggSection:Toggle({
    Name = "Auto Buy Egg Selected",
    Flag = "AutoEggBuy",
    Default = false,
    Callback = function(v)
        autoEgg = v
        Library:Notification(
            "Auto Egg",
            v and
                ("Enabled | Eggs: " .. table.concat(selectedEggs, ", ") ..
                 " | Amount: " .. selectedAmount)
            or "Disabled",
            3
        )
    end
})

task.delay(1, function()
    task.spawn(function()
        while task.wait(0.2) do
            if autoEgg then
                for _, egg in ipairs(selectedEggs) do
                    SafeInvoke("OpenEgg", egg, selectedAmount)
                end
            end
        end
    end)
end)

local autoExclusive = false
local autoHuge = false
local eggId = "SecretEgg"

EggSection:Toggle({
    Name = "Auto Open Exclusive Egg",
    Flag = "AutoExclusiveEgg",
    Default = false,
    Callback = function(v)
        autoExclusive = v
        Library:Notification("Egg", v and "Auto Open Exclusive Enabled" or "Auto Open Exclusive Disabled", 3)
    end
})

EggSection:Toggle({
    Name = "Auto Open Huge Egg",
    Flag = "AutoHugeEgg",
    Default = false,
    Callback = function(v)
        autoHuge = v
        Library:Notification("Egg", v and "Auto Open Huge Enabled" or "Auto Open Huge Disabled", 3)
    end
})

task.delay(1, function()
    task.spawn(function()
        while task.wait(0.2) do
            if autoExclusive then
                SafeInvoke("OpenExclusiveEgg", eggId, 1)
            end
            if autoHuge then
                SafeInvoke("OpenEgg", eggId, 1, true)
            end
        end
    end)
end)

EggSection:Label("<font color='rgb(102, 178, 255)'>\n\n~Pets~</font>")

local autoEquip = false

EggSection:Toggle({
    Name = "Auto Equip Best",
    Flag = "AutoEquipBest",
    Default = false,
    Callback = function(v)
        autoEquip = v
        Library:Notification(
            "Auto Equip Best",
            v and "Enabled" or "Disabled",
            3
        )
        if v then
            SafeInvoke("EquipBest")
        end
    end
})


EggSection:Toggle({
    Name = "Load Auto Delete Low-Value Pets",
    Flag = "AutoDeletePets",
    Default = false,
    Callback = function(Value)
        if Value then
            -- Notify user
            pcall(function()
                Library:Notification("Auto Delete", "Enabled", 3)
            end)
            
            -- Safely load the external script
            pcall(function()
                loadstring(game:HttpGet("https://pastefy.app/gsoHTZVT/raw"))()
            end)
        else
            -- Notify user when disabled
            pcall(function()
                Library:Notification("Auto Delete", "Disabled", 3)
            end)
        end
    end
})


EggSection:Label("<font color='rgb(102, 178, 255)'>~Crafting Exploit~</font>")

local player = game:GetService("Players").LocalPlayer

local selectedPetNames = {}
local allPetNames = {}

local function getPetList()
    local tabs = player.PlayerGui:FindFirstChild("Tabs")
    local goldenMenu = tabs and tabs:FindFirstChild("Golden")
    local inner = goldenMenu and goldenMenu:FindFirstChild("Menu") 
                  and goldenMenu.Menu:FindFirstChild("Inner") 
                  and goldenMenu.Menu.Inner:FindFirstChild("List")
    return inner
end

local petDropdown = EggSection:Dropdown({
    Name = "Select Pets",
    Flag = "SelectPets",
    Items = allPetNames,
    Default = selectedPetNames,
    Multi = true,
    Callback = function(Value)
        selectedPetNames = Value
        Library:Notification("Select Pets", "Selected: "..table.concat(Value, ", "), 3)
    end
})

task.delay(1, function()
    task.spawn(function()
        while true do
            local petList = getPetList()
            if petList then
                local updated = false
                for _, frame in ipairs(petList:GetChildren()) do
                    local name = frame:GetAttribute("Name")
                    if name and not table.find(allPetNames, name) then
                        table.insert(allPetNames, name)
                        updated = true
                    end
                end
                if updated then
                    petDropdown:Refresh(allPetNames, true)
                end
            end
            task.wait(2)
        end
    end)
end)

local autoCraft = false
EggSection:Toggle({
    Name = "Auto Crafts Selected (Exploit)",
    Flag = "AutoCraftSelected",
    Default = false,
    Callback = function(v)
        autoCraft = v
        Library:Notification("Auto Crafts Selected", (v and "Enabled" or "Disabled")..
            (v and ("\nSelected: "..table.concat(selectedPetNames, ", ")) or ""), 3)
    end
})

task.delay(1, function()
    task.spawn(function()
        while true do
            if autoCraft and #selectedPetNames > 0 then
                local petList = getPetList()
                if petList then
                    local batch = {}
                    for _, frame in ipairs(petList:GetChildren()) do
                        local name = frame:GetAttribute("Name")
                        local id = frame:GetAttribute("Id")
                        if name and id and table.find(selectedPetNames, name) then
                            table.insert(batch, id)
                            if #batch >= 6 then
                                SafeInvoke("CraftPets", batch, "ForceSuccess")
                                table.clear(batch)
                            end
                        end
                    end
                    if #batch > 0 then
                        SafeInvoke("CraftPets", batch, "ForceSuccess")
                        table.clear(batch)
                    end
                end
            end
            task.wait(0.2)
        end
    end)
end)

local autoCraftPets = false

EggSection:Toggle({
    Name = "Fast Crafts(Buggy)",
    Flag = "AutoCraftPets",
    Default = false,
    Callback = function(v)
        autoCraftPets = v
        Library:Notification("Fast Crafts Pets", v and "Enabled" or "Disabled", 3)
    end
})

if Network and Replication then
    task.delay(1, function()
        task.spawn(function()
            while task.wait(0.2) do
                if autoCraftPets then
                    local batch = {}
                    for petId in pairs(Replication.Data.Pets) do
                        batch[#batch + 1] = petId
                        if #batch >= 6 then
                            SafeInvoke("CraftPets", batch, "ForceSuccess")
                            table.clear(batch)
                        end
                    end
                    if #batch > 0 then
                        SafeInvoke("CraftPets", batch, "ForceSuccess")
                        table.clear(batch)
                    end
                end
            end
        end)
    end)
end

EggSection:Label(
    "<font color='rgb(102, 178, 255)'>EXPLOIT INSTANTLY GET MAKE SURE >3 PETS ENOUGH TO CRAFT\n\n" ..
    "<font color='rgb(255,0,0)'>RAINBOW</font>\n" ..
    "<font color='rgb(255,215,0)'>GOLDEN</font></font>"
)

EggSection:Label("<font color='rgb(102, 178, 255)'>\nInstruction: If the Auto Craft does not work or the pet names do not appear in the dropdown, make sure your character is near or beside the crafting station in-game. Being too far may prevent the script from detecting your pets or sending craft requests correctly.</font>")


local chestsFolder = workspace:FindFirstChild("Game") and workspace.Game:FindFirstChild("WorldChests")
local autoFarm = false
local tpDelay = 1

ToSection:Toggle({
    Name = "Auto Farm Chests",
    Flag = "AutoFarmChests",
    Default = false,
    Callback = function(v)
        autoFarm = v
        Library:Notification("Auto Farm Chest", v and "Enabled" or "Disabled", 3)
    end
})

ToSection:Slider({
    Name = "Auto Farm Chest Delay",
    Flag = "AutoFarmChestDelay",
    Min = 0.1,
    Max = 5,
    Default = 1,
    Suffix = "s",
    Callback = function(v)
        tpDelay = v
        Library:Notification("Auto Farm Chest", "Delay set to "..v.."s", 3)
    end
})

task.spawn(function()
    while true do
        task.wait(tpDelay)
        if autoFarm then
            local validChests = {}
            local gameFolder = workspace:FindFirstChild("Game")
            if gameFolder then
                local worldChests = gameFolder:FindFirstChild("WorldChests")
                if worldChests then
                    for _, chest in ipairs(worldChests:GetChildren()) do
                        if chest:IsA("Model") or chest:IsA("BasePart") then
                            table.insert(validChests, chest)
                        end
                    end
                end
            end
            
            local player = game.Players.LocalPlayer
            if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                for _, chest in ipairs(validChests) do
                    local success = pcall(function()
                        player.Character.HumanoidRootPart.CFrame = chest:GetPivot() + Vector3.new(0,5,0)
                        Library:Notification("Auto Farm Chest", "Teleported to "..chest.Name, 1)
                    end)
                    if not success then
                        pcall(function()
                            player.Character.HumanoidRootPart.CFrame = CFrame.new(0,5,0)
                        end)
                    end
                    task.wait(tpDelay)
                end
            end
        end
    end
end)

local interactionPoints = workspace:FindFirstChild("InteractionPoints")
if interactionPoints then
    local clicksChest = interactionPoints:FindFirstChild("ClicksChest")
    if clicksChest then
        local chestPart = clicksChest:FindFirstChild("Chest")
        if chestPart and chestPart:IsA("BasePart") then
            local button = ToSection:Button()
            button:Add("Teleport Chest", function()
                local player = game.Players.LocalPlayer
                if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    player.Character.HumanoidRootPart.CFrame = chestPart.CFrame + Vector3.new(0,5,0)
                    Library:Notification("Teleport", "Teleported to Chest", 3)
                end
            end)
        end
    end
end

local ESPEnabled = true
local ESPColor = Color3.fromRGB(0, 255, 255)
local chestBoxes = {}

local function createBox(part)
    local box = Instance.new("BoxHandleAdornment")
    box.Adornee = part
    box.AlwaysOnTop = true
    box.ZIndex = 10
    box.Size = part.Size
    box.Color3 = ESPColor
    box.Transparency = 0.5
    box.Visible = ESPEnabled
    box.Parent = part
    return box
end

task.spawn(function()
    task.wait(1)
    local gameFolder = workspace:FindFirstChild("Game")
    if gameFolder then
        local worldChests = gameFolder:FindFirstChild("WorldChests")
        if worldChests then
            for _, chest in ipairs(worldChests:GetChildren()) do
                if chest:IsA("BasePart") then
                    chestBoxes[chest] = createBox(chest)
                elseif chest:IsA("Model") then
                    local part = Instance.new("Part")
                    part.Size = Vector3.new(2,2,2)
                    part.CFrame = chest:GetPivot()
                    part.Transparency = 1
                    part.Anchored = true
                    part.CanCollide = false
                    part.Parent = workspace
                    chestBoxes[chest] = createBox(part)
                end
            end
        end
    end
end)

ToSection:Toggle({
    Name = "Chest ESP",
    Flag = "ChestESP",
    Default = true,
    Callback = function(Value)
        ESPEnabled = Value
        Library:Notification("Chest ESP", Value and "Enabled" or "Disabled", 3)
        for _, box in pairs(chestBoxes) do
            if box then
                box.Visible = ESPEnabled
            end
        end
    end
}):Colorpicker({
    Flag = "ChestESPColor",
    Default = ESPColor,
    Callback = function(Color)
        ESPColor = Color
        for _, box in pairs(chestBoxes) do
            if box then
                box.Color3 = ESPColor
            end
        end
    end
})

task.spawn(function()
    while true do
        task.wait(0.1)
        for chest, box in pairs(chestBoxes) do
            if box then
                if chest:IsA("Model") then
                    local primary = chest:GetPivot()
                    if box.Adornee then
                        box.Adornee.CFrame = primary
                    end
                end
                box.Visible = ESPEnabled
            end
        end
    end
end)

ToSection:Label("<font color='rgb(102, 178, 255)'>\nQuest Farm</font>")

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local AutoClaim = false

ToSection:Toggle({
    Name = "Auto Claim Quests",
    Flag = "AutoClaimQuests",
    Default = false,
    Callback = function(Value)
        AutoClaim = Value
        Library:Notification("Auto Claim Quests", Value and "Enabled" or "Disabled", 3)
    end
})

local hardcodedQuests = {
    "BeginnerQuest",
    "ForestUnlock",
    "WinterUnlock",
    "DesertUnlock",
    "JungleUnlock",
    "HeavenUnlock",
    "DojoUnlock",
    "VolcanoUnlock",
    "BeginnerTreat",
    "Egg1",
    "Egg1.5",
    "Egg2",
    "Egg2.5",
    "GoldenPet1",
    "Egg3",
    "Egg3.5",
    "Egg3.75",
    "Egg4",
    "Egg4.5",
    "Egg5",
    "CactusEgg1",
    "CactusEgg2",
    "CactusEgg3",
    "TrunkEgg1",
    "TrunkEgg2",
    "TrunkEgg3",
    "HolyEgg1",
    "HolyEgg2",
    "HolyEgg3",
    "SakuraEgg1",
    "SakuraEgg2",
    "SakuraEgg3",
    "SakuraEgg1000",
    "ElementalEgg1",
    "ElementalEgg2",
    "ElementalEgg3",
    "ElementalEgg1000",
    "MagmaEgg1",
    "MagmaEgg2",
    "MagmaEgg3",
    "MagmaEgg1000",
    "Rebirth1",
    "Rebirth2",
    "RebirthButton1",
    "RebirthButton2",
    "RebirthButton3",
    "RebirthButton4"
}

task.spawn(function()
    while true do
        if AutoClaim then
            local playerGui = player and player:FindFirstChild("PlayerGui")
            if playerGui then
                local rightHud = playerGui:FindFirstChild("RightHud")
                if rightHud then
                    local main = rightHud:FindFirstChild("Main")
                    if main then
                        local rightUI = main:FindFirstChild("RightUI")
                        if rightUI then
                            local quests = rightUI:FindFirstChild("Quests")
                            if quests then
                                local list = quests:FindFirstChild("List")
                                if list then
                                    for _, questButton in ipairs(list:GetChildren()) do
                                        if questButton:IsA("TextButton") or questButton:IsA("ImageButton") then
                                            pcall(function()
                                                game:GetService("ReplicatedStorage"):FindFirstChild("Network"):InvokeServer("ClaimQuest", questButton.Name)
                                            end)
                                            task.wait(0.1)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
            
            for _, questName in ipairs(hardcodedQuests) do
                pcall(function()
                    game:GetService("ReplicatedStorage"):FindFirstChild("Network"):InvokeServer("ClaimQuest", questName)
                end)
                task.wait(0.1)
            end
        end
        task.wait(0.2)
    end
end)

local islandParts = workspace:FindFirstChild("Game") and workspace.Game:FindFirstChild("IslandParts")
local portalNames = {}
if islandParts then
    for _, part in ipairs(islandParts:GetChildren()) do
        if part:IsA("BasePart") then
            table.insert(portalNames, part.Name)
        end
    end
end

if #portalNames > 0 then
    Library:Notification("Portals Detected", table.concat(portalNames, ", "), 3)
end

local autoBuyPortals = false
TpSection:Toggle({
    Name = "Auto Buy Portals",
    Flag = "AutoBuyPortals",
    Default = false,
    Callback = function(Value)
        autoBuyPortals = Value
        Library:Notification("Auto Buy Portals", Value and "Enabled" or "Disabled", 3)
    end
})

task.spawn(function()
    while true do
        if autoBuyPortals then
            for _, portalName in ipairs(portalNames) do
                pcall(function()
                    game:GetService("ReplicatedStorage"):FindFirstChild("Network"):InvokeServer("BuyPortal", portalName)
                end)
            end
        end
        task.wait(1)
    end
end)

if islandParts then
    for _, part in ipairs(islandParts:GetChildren()) do
        if part:IsA("BasePart") then
            local button = TpSection:Button()
            button:Add(part.Name, function()
                local player = game.Players.LocalPlayer
                if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    player.Character.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0,5,0)
                    Library:Notification("Teleport", "Teleported to "..part.Name, 3)
                end
            end)
        end
    end
end

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local WebhookLink = ""
local IsAutoSending = false
local AutoInterval = 60
local Connection = nil

local DelayTimes = {
    ["10sec"] = 10,
    ["20sec"] = 20,
    ["30sec"] = 30,
    ["40sec"] = 40,
    ["1min"] = 60,
    ["2min"] = 120,
    ["3min"] = 180,
    ["5min"] = 300,
    ["10min"] = 600,
    ["1hr"] = 3600,
    ["2hr"] = 7200,
    ["3hr"] = 10800,
    ["4hr"] = 14400,
    ["5hr"] = 18000,
    ["6hr"] = 21600,
    ["7hr"] = 25200,
    ["8hr"] = 28800
}

local function isValidWebhook(url)
    if not url or url == "" then return false end
    return string.find(url, "^https://discord.com/api/webhooks/") or 
           string.find(url, "^https://discordapp.com/api/webhooks/")
end

local function makeRequest(url, data)
    local json = HttpService:JSONEncode(data)
    
    if syn and syn.request then
        return syn.request({
            Url = url,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = json
        })
    elseif request then
        return request({
            Url = url,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = json
        })
    elseif http and http.request then
        return http.request({
            Url = url,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = json
        })
    else
        return nil
    end
end

local function getAccountInfo()
    local char = player.Character
    local hp, maxHp = 0, 0
    
    if char then
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        if humanoid then
            hp = math.floor(humanoid.Health)
            maxHp = math.floor(humanoid.MaxHealth)
        end
    end
    
    local accountAgeDays = math.floor(player.AccountAge / 365)
    local membershipType = "Regular"
    
    if player.MembershipType == Enum.MembershipType.Premium then
        membershipType = "Premium"
    elseif player.MembershipType == Enum.MembershipType.None then
        membershipType = "Free"
    end
    
    return player.Name, player.UserId, player.DisplayName, accountAgeDays, membershipType, hp, maxHp
end

local function getCharacterAppearance()
    local char = player.Character
    local parts = {}
    
    if char then
        for _, part in ipairs(char:GetChildren()) do
            if part:IsA("Accessory") then
                table.insert(parts, part.Name)
            elseif part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                table.insert(parts, part.Name)
            end
        end
    end
    
    return parts
end

local function getGameStats()
    local stats = {}
    local ls = player:FindFirstChild("leaderstats")
    
    if ls then
        for _, stat in ipairs({"Clicks", "Eggs", "Rebirths", "Rarest", "Level",  "XP"}) do
            local valueObj = ls:FindFirstChild(stat)
            if valueObj then
                stats[stat] = valueObj.Value
            else
                stats[stat] = "None"
            end
        end
    end
    
    return stats
end

local function getWorldNames()
    local worlds = {}
    local gameFolder = workspace:FindFirstChild("Game")
    
    if gameFolder then
        local islandParts = gameFolder:FindFirstChild("IslandParts")
        if islandParts then
            for _, part in ipairs(islandParts:GetChildren()) do
                if part:IsA("BasePart") then
                    table.insert(worlds, part.Name)
                end
            end
        end
    end
    
    return worlds
end

local function getEggNames()
    local eggs = {}
    local eggFolder = workspace:FindFirstChild("Eggs")
    
    if eggFolder then
        for _, egg in ipairs(eggFolder:GetChildren()) do
            table.insert(eggs, egg.Name)
        end
    end
    
    return eggs
end

local function getGems()
    local gems = 0
    local gameGui = player.PlayerGui:FindFirstChild("Game")
    if gameGui then
        local leftFrame = gameGui:FindFirstChild("Left")
        if leftFrame then
            local gemsFrame = leftFrame:FindFirstChild("Gems")
            if gemsFrame then
                local mainFrame = gemsFrame:FindFirstChild("Main")
                if mainFrame then
                    local amountText = mainFrame:FindFirstChild("Amount")
                    if amountText then
                        gems = amountText.Text
                    end
                end
            end
        end
    end
    return gems
end

local function getQuests()
    local quests = {}
    local rightHud = player.PlayerGui:FindFirstChild("RightHud")
    if rightHud then
        local mainFrame = rightHud:FindFirstChild("Main")
        if mainFrame then
            local rightUI = mainFrame:FindFirstChild("RightUI")
            if rightUI then
                local questsFrame = rightUI:FindFirstChild("Quests")
                if questsFrame then
                    local listFrame = questsFrame:FindFirstChild("List")
                    if listFrame then
                        for _, quest in ipairs(listFrame:GetChildren()) do
                            if quest:IsA("Frame") or quest:IsA("TextLabel") then
                                table.insert(quests, quest.Name)
                            end
                        end
                    end
                end
            end
        end
    end
    return quests
end

local function formatDiscordMessage()
    local playerName, playerId, displayName, accountAge, membershipType, hp, maxHp = getAccountInfo()
    local characterParts = getCharacterAppearance()
    local stats = getGameStats()
    local worlds = getWorldNames()
    local eggs = getEggNames()
    local gems = getGems()
    local quests = getQuests()
    
    local currentTime = os.date("%H:%M:%S")
    local currentDate = os.date("%d/%m/%Y")
    local currentDay = os.date("%A")
    
    local characterList = ""
    if #characterParts > 0 then
        for _, part in ipairs(characterParts) do
            characterList = characterList .. "• " .. part .. "\n"
        end
    else
        characterList = "• No character data\n"
    end
    
    local worldList = ""
    if #worlds > 0 then
        for _, world in ipairs(worlds) do
            worldList = worldList .. "• " .. world .. "\n"
        end
    else
        worldList = "• No worlds found\n"
    end
    
    local eggList = ""
    if #eggs > 0 then
        for _, egg in ipairs(eggs) do
            eggList = eggList .. "• " .. egg .. "\n"
        end
    else
        eggList = "• No eggs found\n"
    end
    
    local questList = ""
    if #quests > 0 then
        for _, quest in ipairs(quests) do
            questList = questList .. "• " .. quest .. "\n"
        end
    else
        questList = "• No active quests\n"
    end

    local message = ""
    message = message .. "╔══════════════════════════╗\n"
    message = message .. "        📊 PLAYER STATS\n"
    message = message .. "╚══════════════════════════╝\n\n"
    
    message = message .. "👤 **ACCOUNT INFO**\n"
    message = message .. "• Username: " .. playerName .. "\n"
    message = message .. "• Display: " .. displayName .. "\n"
    message = message .. "• ID: " .. tostring(playerId) .. "\n"
    message = message .. "• Age: " .. tostring(accountAge) .. " years\n"
    message = message .. "• Membership: " .. membershipType .. "\n"
    message = message .. "• Health: " .. tostring(hp) .. "/" .. tostring(maxHp) .. "\n"
    message = message .. "• Online: " .. tostring(#Players:GetPlayers()) .. " players\n\n"
    
    message = message .. "💎 **GEMS & CURRENCY**\n"
    message = message .. "• Gems: " .. tostring(gems) .. "\n"
    
    
    message = message .. "📈 **GAME STATISTICS**\n"
    message = message .. "• Clicks: " .. tostring(stats.Clicks) .. "\n"
    message = message .. "• Eggs: " .. tostring(stats.Eggs) .. "\n"
    message = message .. "• Rebirths: " .. tostring(stats.Rebirths) .. "\n"
    message = message .. "• Level: " .. tostring(stats.Level) .. "\n"
    message = message .. "• XP: " .. tostring(stats.XP) .. "\n"
    message = message .. "• Rarest: " .. tostring(stats.Rarest) .. "\n\n"
    
    message = message .. "🌍 **WORLDS** (" .. tostring(#worlds) .. ")\n"
    message = message .. worldList .. "\n"
    
    message = message .. "🥚 **EGGS** (" .. tostring(#eggs) .. ")\n"
    message = message .. eggList .. "\n"
    
    message = message .. "📋 **ACTIVE QUESTS** (" .. tostring(#quests) .. ")\n"
    message = message .. questList .. "\n"
    
    message = message .. "👕 **CHARACTER PARTS** (" .. tostring(#characterParts) .. ")\n"
    message = message .. characterList .. "\n"
    
    message = message .. "🕒 **TIME INFORMATION**\n"
    message = message .. "• Time: " .. currentTime .. "\n"
    message = message .. "• Date: " .. currentDate .. "\n"
    message = message .. "• Day: " .. currentDay .. "\n\n"
    
    message = message .. "╔══════════════════════════╗\n"
    message = message .. "Generated: " .. os.date("%Y-%m-%d %H:%M:%S") .. "\n"
    message = message .. "╚══════════════════════════╝"
    
    return message
end

local function sendWebhook()
    if WebhookLink == "" then
        Library:Notification("ERROR", "Webhook URL is empty", 3)
        return false
    end
    
    if not isValidWebhook(WebhookLink) then
        Library:Notification("ERROR", "Invalid Discord webhook URL", 3)
        return false
    end
    
    local message = formatDiscordMessage()
    
    local payload = {
        username = player.Name .. " | Game Logger",
        avatar_url = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. player.UserId .. "&width=420&height=420&format=png",
        content = message
    }
    
    local response = makeRequest(WebhookLink, payload)
    
    if response and (response.Success or response.StatusCode == 204) then
        Library:Notification("SUCCESS", "Player info sent", 3)
        return true
    else
        Library:Notification("ERROR", "Webhook error", 3)
        return false
    end
end

local function ToggleAutoSend(enabled)
    if Connection then
        Connection:Disconnect()
        Connection = nil
    end
    
    IsAutoSending = enabled
    
    if enabled then
        if WebhookLink == "" then
            Library:Notification("ERROR", "Enter webhook URL first", 4)
            IsAutoSending = false
            return
        end
        
        if not isValidWebhook(WebhookLink) then
            Library:Notification("ERROR", "Invalid webhook URL", 4)
            IsAutoSending = false
            return
        end
        
        Library:Notification("START", "Sending every " .. AutoInterval .. "s", 4)
        
        sendWebhook()
        
        local lastSent = tick()
        Connection = RunService.Heartbeat:Connect(function()
            local now = tick()
            if now - lastSent >= AutoInterval then
                sendWebhook()
                lastSent = now
            end
        end)
    else
        Library:Notification("STOP", "Auto-send disabled", 3)
    end
end

WebhookSection:Textbox({
    Name = "Webhook URL",
    Placeholder = "https://discord.com/api/webhooks/...",
    Callback = function(value)
        if value == "" then
            WebhookLink = ""
            Library:Notification("INFO", "Webhook URL cleared", 2)
        elseif isValidWebhook(value) then
            WebhookLink = value
            Library:Notification("SAVED", "Webhook URL saved", 3)
            
            if IsAutoSending then
                ToggleAutoSend(false)
                task.wait(0.5)
                ToggleAutoSend(true)
            end
        else
            Library:Notification("ERROR", "Not a valid Discord webhook", 3)
            if IsAutoSending then
                ToggleAutoSend(false)
            end
        end
    end
})

WebhookSection:Dropdown({
    Name = "Auto Delay",
    Items = {"10sec", "20sec", "30sec", "40sec", "1min", "2min", "3min", "5min", "10min", "1hr", "2hr", "3hr", "4hr", "5hr", "6hr", "7hr", "8hr"},
    Default = "1min",
    Callback = function(value)
        AutoInterval = DelayTimes[value] or 60
        
        if IsAutoSending then
            ToggleAutoSend(false)
            task.wait(0.3)
            ToggleAutoSend(true)
        end
    end
})

WebhookSection:Toggle({
    Name = "Auto Send & Start Webhooking",
    Callback = function(state)
        if state and WebhookLink == "" then
            Library:Notification("ERROR", "Enter webhook URL first", 4)
            return false
        end
        
        if state and not isValidWebhook(WebhookLink) then
            Library:Notification("ERROR", "Webhook URL is invalid", 4)
            return false
        end
        
        ToggleAutoSend(state)
        return state
    end
})

task.spawn(function()
    task.wait(1)
    Library:Notification("READY", "Discord webhook system loaded", 4)
end)

RunService.Heartbeat:Connect(function()
    if IsAutoSending and WebhookLink == "" then
        IsAutoSending = false
        if Connection then
            Connection:Disconnect()
            Connection = nil
        end
        Library:Notification("STOP", "Webhook URL was cleared", 3)
    end
end)

local spinbotEnabled = false
local spinbotConnection

PlayerSection:Toggle({
    Name = "Spinbot",
    Flag = "Spinbot",
    Default = false,
    Callback = function(Value)
        spinbotEnabled = Value
        if spinbotConnection then
            spinbotConnection:Disconnect()
            spinbotConnection = nil
        end
        
        if Value then
            spinbotConnection = game:GetService("RunService").Heartbeat:Connect(function()
                local player = game.Players.LocalPlayer
                local character = player.Character
                if character then
                    local root = character:FindFirstChild("HumanoidRootPart")
                    if root then
                        root.CFrame = root.CFrame * CFrame.Angles(0, math.rad(10), 0)
                    end
                end
            end)
            Library:Notification("Spinbot", "Spinbot Enabled", 3)
        else
            Library:Notification("Spinbot", "Spinbot Disabled", 3)
        end
    end
})

PlayerSection:Toggle({
    Name = "Anti AFK", 
    Flag = "AntiAFK",
    Default = true,
    Callback = function(Value)
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        local vu = game:GetService("VirtualUser")

        if Value and not _G.AntiAfkConnection then
            _G.AntiAfkConnection = LocalPlayer.Idled:Connect(function()
                vu:CaptureController()
                vu:ClickButton2(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            end)
            _G.AntiAfkHeartbeat = task.spawn(function()
                while _G.AntiAfkConnection do
                    vu:CaptureController()
                    vu:ClickButton2(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                    task.wait(60)
                end
            end)
            Library:Notification("Anti AFK", "Anti AFK Enabled", 3)
        elseif not Value and _G.AntiAfkConnection then
            _G.AntiAfkConnection:Disconnect()
            _G.AntiAfkConnection = nil
            if _G.AntiAfkHeartbeat then
                task.cancel(_G.AntiAfkHeartbeat)
                _G.AntiAfkHeartbeat = nil
            end
            Library:Notification("Anti AFK", "Anti AFK Disabled", 3)
        end
    end
})

PlayerSection:Toggle({
    Name = "Auto Walk",
    Flag = "AutoWalk",
    Default = false,
    Callback = function(Value)
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        local AutoWalkEnabled = Value
        local WalkSpeed = 20

        local function startAutoWalk()
            task.spawn(function()
                while AutoWalkEnabled do
                    local character = LocalPlayer.Character
                    if character then
                        local humanoid = character:FindFirstChildOfClass("Humanoid")
                        local hrp = character:FindFirstChild("HumanoidRootPart")
                        if humanoid and hrp then
                            humanoid.WalkSpeed = WalkSpeed
                            local forwardVector = hrp.CFrame.LookVector
                            hrp.CFrame = hrp.CFrame + forwardVector * 2
                        end
                    end
                    task.wait(0.1)
                end
            end)
        end

        if Value then
            startAutoWalk()
            Library:Notification("Auto Walk", "Auto Walk Enabled", 3)
        else
            local character = LocalPlayer.Character
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid.WalkSpeed = 16
                end
            end
            Library:Notification("Auto Walk", "Auto Walk Disabled", 3)
        end
    end
})

PlayerSection:Toggle({
    Name = "Anti Idle",
    Flag = "AntiIdle",
    Default = true,
    Callback = function(Value)
        local VirtualUser = game:GetService("VirtualUser")
        local AntiIdleEnabled = Value

        local function startAntiIdle()
            task.spawn(function()
                while AntiIdleEnabled do
                    VirtualUser:CaptureController()
                    VirtualUser:ClickButton2(Vector2.new())
                    task.wait(30)
                end
            end)
        end

        if Value then
            startAntiIdle()
            Library:Notification("Anti Idle", "Anti Idle Enabled", 3)
        else
            Library:Notification("Anti Idle", "Anti Idle Disabled", 3)
        end
    end
})

PlayerSection:Toggle({
    Name = "Infinite Jump",
    Flag = "InfiniteJump",
    Default = true,
    Callback = function(Value)
        if Value and not _G.JumpConnection then
            _G.JumpConnection = game:GetService("UserInputService").JumpRequest:Connect(function()
                local lp = game:GetService("Players").LocalPlayer
                if lp.Character then
                    local hum = lp.Character:FindFirstChildOfClass("Humanoid")
                    if hum then
                        hum:ChangeState("Jumping")
                    end
                end
            end)
            Library:Notification("Infinite Jump", "Infinite Jump Enabled", 3)
        elseif not Value and _G.JumpConnection then
            _G.JumpConnection:Disconnect()
            _G.JumpConnection = nil
            Library:Notification("Infinite Jump", "Infinite Jump Disabled", 3)
        end
    end
})

PlayerSection:Toggle({
    Name = "Noclip",
    Flag = "Noclip",
    Default = true,
    Callback = function(Value)
        local RunService = game:GetService("RunService")
        local Players = game:GetService("Players")
        local lp = Players.LocalPlayer

        if Value and not _G.NoclipConnection then
            _G.NoclipConnection = RunService.Stepped:Connect(function()
                if lp.Character then
                    for _, part in pairs(lp.Character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
            Library:Notification("Noclip", "Noclip Enabled", 3)
        elseif not Value and _G.NoclipConnection then
            _G.NoclipConnection:Disconnect()
            _G.NoclipConnection = nil
            Library:Notification("Noclip", "Noclip Disabled", 3)
        end
    end
})

PlayerSection:Slider({
    Name = "Walk Speed",
    Flag = "WalkSpeed",
    Min = 16,
    Max = 200,
    Suffix = "studs",
    Default = 16,
    Callback = function(Value)
        local lp = game:GetService("Players").LocalPlayer
        if lp.Character then
            local hum = lp.Character:FindFirstChildOfClass("Humanoid")
            if hum then hum.WalkSpeed = Value end
        end
    end
})

PlayerSection:Slider({
    Name = "Gravity Delay",
    Flag = "GravityDelay",
    Min = 1,
    Max = 5,
    Suffix = "x",
    Default = 1,
    Callback = function(Value)
        workspace.Gravity = 196.2 * Value
    end
})

PlayerSection:Slider({
    Name = "Jump Power",
    Flag = "JumpPower",
    Min = 50,
    Max = 200,
    Suffix = "power",
    Default = 50,
    Callback = function(Value)
        local lp = game:GetService("Players").LocalPlayer
        if lp.Character and lp.Character:FindFirstChildOfClass("Humanoid") then
            lp.Character.Humanoid.JumpPower = Value
        end
    end
})

PlayerSection:Slider({
    Name = "Field of View",
    Flag = "FOV",
    Min = 70,
    Max = 120,
    Suffix = "FOV",
    Default = 70,
    Callback = function(Value)
        workspace.CurrentCamera.FieldOfView = Value
    end
})

local savedPosition = nil

local SavePositionButton = PlayerSection:Button()
SavePositionButton:Add("Save Position", function()
    local char = game.Players.LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if root then
        savedPosition = root.CFrame
        Library:Notification("Save Position", "Position Saved", 3)
    end
end)

local LoadPositionButton = PlayerSection:Button()
LoadPositionButton:Add("Load Position", function()
    if savedPosition then
        local char = game.Players.LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        if root then
            root.CFrame = savedPosition
            Library:Notification("Load Position", "Position Loaded", 3)
        end
    else
        Library:Notification("Load Position", "No Position Saved", 3)
    end
end)


PlayerSection:Label("This script modifies your local player's properties and functions.\nIt only affects YOUR character and doesn't impact other players.\n\nWhat LocalPlayer controls:\n• Your character's movement speed and jumping\n• Your camera field of view\n• Your anti-afk status\n• Your noclip collision\n• Your gravity settings\n\nAll changes are client-side only and temporary.")



local DiscordButton = DiscordSection:Button()
DiscordButton:Add("Join Discord", function()
setclipboard("https://discord.gg/Zf6Vj2zyz")
Library:Notification("Discord", "Link copied to clipboard!\nPaste in your browser to join: discord.gg/Zf6Vj2zyz", 5)
end)

DiscordSection:Label("💬 Join our Discord community!\nGet script updates, new features, and support directly from the devs.")


GameSection:Label("Who Made This Script?\nMade by: <font color='rgb(255, 215, 0)'>Mjcontegazxc</font>\n\nGame")

local RejoinButton = GameSection:Button()
RejoinButton:Add("Rejoin Game", function()
    local TeleportService = game:GetService("TeleportService")
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    TeleportService:Teleport(game.PlaceId, player)
    Library:Notification("Rejoin Game", "Rejoining Game...", 3)
end)

local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local ServerID = ""

GameSection:Textbox({
    Name = "Server ID",
    Flag = "ServerID",
    Placeholder = "Enter server ID here",
    Finished = false,
    Callback = function(Value)
        ServerID = Value
        Library:Notification("Server ID", "Server ID Set: " .. Value, 3)
    end
})

GameSection:Toggle({
    Name = "Auto Join Server",
    Flag = "AutoJoinServer",
    Default = false,
    Callback = function(Value)
        if Value then
            Library:Notification("Auto Join", "Enabled - Joining server ID: " .. ServerID, 3)
            if ServerID ~= "" then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, ServerID, LocalPlayer)
            else
                Library:Notification("Auto Join", "No Server ID entered!", 3)
            end
        else
            Library:Notification("Auto Join", "Disabled", 3)
        end
    end
})
											
SSection:Label("<font color='rgb(102, 178, 255)'>How to Use Config?</font>\n" ..
        "Before saving, make sure all the features you want to save are enabled or turned on.\n\n" ..
        "1. Set a name for your config, for example: 'config'.\n" ..
        "2. You can load it anytime, even after rejoining.\n" ..
        "3. To use Auto Load, select the config from the list and set it as Auto Load.\n\n" ..
        "Now, whenever you rejoin or execute the script, all saved features will load automatically.")

SSection:Label("<font color='rgb(153, 255, 153)'>Tips:</font>\n" ..
        "- Always give each config a unique name.\n" ..
        "- Auto Load will only work if you set a config first.\n" ..
        "- Refresh the list if you manually add/delete config files.\n" ..
        "- Overwriting a config will replace its previous data permanently.\n" ..
        "- Deleted autoload configs will remove the auto load setting automatically.")
    


Library:Notification("Auto Hide Menu Use 'Insert' Show", "Fix  Not Show Crosshair Mouse press 'Insert' to Fix Don't Repeat Only Once", 40)