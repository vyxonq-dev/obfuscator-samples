-- FIXZ HUB | BRAINROT MINERS ⛏️
-- Using Fluent UI Library

print("⛏️ Loading Fixz Hub for Brainrot Miners...")

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local Workspace = game:GetService("Workspace")

local plr = Players.LocalPlayer

-- Anti-AFK
plr.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

-- Load Fluent UI
print("Loading Fluent UI...")
local success, Fluent = pcall(function()
    return loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
end)

if not success then
    warn("Failed to load Fluent UI, trying alternate link...")
    Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Fluent.lua"))()
end

local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

print("Creating window...")

-- Variables
getgenv().infMoney = false
getgenv().autoMine = false
getgenv().moneyAmount = 1000000000000
getgenv().moneySent = 0
local foundRemotes = {}
local foundFunctions = {}

-- Create Window
local Window = Fluent:CreateWindow({
    Title = "⛏️ Fixz Hub | Brainrot Miners",
    SubTitle = "Infinite Money & Auto Farm",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- Create Tabs
local Tabs = {
    Main = Window:AddTab({ Title = "🏠 Main", Icon = "home" }),
    Money = Window:AddTab({ Title = "💰 Money", Icon = "dollar-sign" }),
    Mining = Window:AddTab({ Title = "⛏️ Mining", Icon = "pickaxe" }),
    Scanner = Window:AddTab({ Title = "🔍 Scanner", Icon = "search" }),
    Misc = Window:AddTab({ Title = "⚙️ Misc", Icon = "wrench" }),
    Settings = Window:AddTab({ Title = "🔧 Settings", Icon = "settings" })
}

-- MAIN TAB
Tabs.Main:AddParagraph({
    Title = "⛏️ Welcome to Fixz Hub!",
    Content = "Brainrot Miners - Infinite money, auto mining, remote scanner, and more!"
})

local StatsLabel = Tabs.Main:AddParagraph({
    Title = "📊 Statistics",
    Content = "Money Sent: 0 times"
})

task.spawn(function()
    while task.wait(1) do
        StatsLabel:SetDesc(string.format("Money Sent: %d times", getgenv().moneySent))
    end
end)

Tabs.Main:AddButton({
    Title = "🎮 Join Discord",
    Description = "Get support and updates",
    Callback = function()
        setclipboard("https://discord.gg/nFYTEm39rc")
        Fluent:Notify({
            Title = "Discord Copied!",
            Content = "Discord invite copied to clipboard!",
            Duration = 3
        })
    end
})

-- MONEY TAB
Tabs.Money:AddParagraph({
    Title = "💰 Infinite Money Exploit",
    Content = "Use the offline event to get unlimited money!"
})

local MoneyInput = Tabs.Money:AddInput("MoneyAmount", {
    Title = "💰 Money Amount",
    Description = "Enter custom money amount",
    Default = "1000000000000",
    Placeholder = "e.g., 1000000000000",
    Numeric = true,
    Finished = false,
    Callback = function(value)
        local amount = tonumber(value)
        if amount then
            getgenv().moneyAmount = amount
            Fluent:Notify({
                Title = "Amount Set!",
                Content = string.format("Money amount: %d", amount),
                Duration = 2
            })
        end
    end
})

Tabs.Money:AddButton({
    Title = "💰 Get Money (Once)",
    Description = "Send custom money amount once",
    Callback = function()
        pcall(function()
            local OfflineEvent = ReplicatedStorage.Events.ClientEvents.OfflineEvent
            OfflineEvent:FireServer(getgenv().moneyAmount, false)
            getgenv().moneySent = getgenv().moneySent + 1
            Fluent:Notify({
                Title = "Money Sent!",
                Content = string.format("Sent %d money", getgenv().moneyAmount),
                Duration = 3
            })
        end)
    end,
})

Tabs.Money:AddButton({
    Title = "💎 Get Max Money (1 Trillion)",
    Description = "Send maximum money amount",
    Callback = function()
        pcall(function()
            local OfflineEvent = ReplicatedStorage.Events.ClientEvents.OfflineEvent
            OfflineEvent:FireServer(1000000000000, false)
            getgenv().moneySent = getgenv().moneySent + 1
            Fluent:Notify({
                Title = "Max Money Sent!",
                Content = "Sent 1 trillion money",
                Duration = 3
            })
        end)
    end,
})

Tabs.Money:AddButton({
    Title = "🚀 Send Money x10 Times",
    Description = "Send money 10 times rapidly",
    Callback = function()
        task.spawn(function()
            for i = 1, 10 do
                pcall(function()
                    local OfflineEvent = ReplicatedStorage.Events.ClientEvents.OfflineEvent
                    OfflineEvent:FireServer(getgenv().moneyAmount, false)
                    getgenv().moneySent = getgenv().moneySent + 1
                end)
                task.wait(0.1)
            end
            Fluent:Notify({
                Title = "Complete!",
                Content = "Sent money 10 times",
                Duration = 3
            })
        end)
    end,
})

local InfMoneyToggle = Tabs.Money:AddToggle("InfMoney", {
    Title = "💰 Infinite Money Loop",
    Description = "Auto send money every second",
    Default = false
})

InfMoneyToggle:OnChanged(function(state)
    getgenv().infMoney = state
    if state then
        Fluent:Notify({
            Title = "Infinite Money ON!",
            Content = "Auto sending money continuously",
            Duration = 3
        })
    else
        Fluent:Notify({
            Title = "Infinite Money OFF",
            Content = "Stopped auto money",
            Duration = 3
        })
    end
end)

task.spawn(function()
    while task.wait(1) do
        if getgenv().infMoney then
            pcall(function()
                local OfflineEvent = ReplicatedStorage.Events.ClientEvents.OfflineEvent
                OfflineEvent:FireServer(getgenv().moneyAmount, false)
                getgenv().moneySent = getgenv().moneySent + 1
            end)
        end
    end
end)

Tabs.Money:AddSection("Quick Presets")

Tabs.Money:AddButton({
    Title = "💵 1 Million",
    Description = "Set to 1,000,000",
    Callback = function()
        getgenv().moneyAmount = 1000000
        MoneyInput:SetValue("1000000")
        Fluent:Notify({
            Title = "Preset Applied!",
            Content = "Amount: 1 Million",
            Duration = 2
        })
    end,
})

Tabs.Money:AddButton({
    Title = "💰 100 Million",
    Description = "Set to 100,000,000",
    Callback = function()
        getgenv().moneyAmount = 100000000
        MoneyInput:SetValue("100000000")
        Fluent:Notify({
            Title = "Preset Applied!",
            Content = "Amount: 100 Million",
            Duration = 2
        })
    end,
})

Tabs.Money:AddButton({
    Title = "💎 1 Billion",
    Description = "Set to 1,000,000,000",
    Callback = function()
        getgenv().moneyAmount = 1000000000
        MoneyInput:SetValue("1000000000")
        Fluent:Notify({
            Title = "Preset Applied!",
            Content = "Amount: 1 Billion",
            Duration = 2
        })
    end,
})

Tabs.Money:AddButton({
    Title = "🚀 1 Trillion (Max)",
    Description = "Set to 1,000,000,000,000",
    Callback = function()
        getgenv().moneyAmount = 1000000000000
        MoneyInput:SetValue("1000000000000")
        Fluent:Notify({
            Title = "Preset Applied!",
            Content = "Amount: 1 Trillion",
            Duration = 2
        })
    end,
})

-- MINING TAB
Tabs.Mining:AddParagraph({
    Title = "⛏️ Auto Mining Features",
    Content = "Automatically mine and collect resources"
})

Tabs.Mining:AddButton({
    Title = "⛏️ Try Auto Mine",
    Description = "Test mining-related remotes",
    Callback = function()
        local mineRemotes = {
            "Mine", "MineOre", "Dig", "Harvest", 
            "Collect", "MineBlock", "StartMine", "DigBlock"
        }
        
        local found = false
        for _, remoteName in ipairs(mineRemotes) do
            pcall(function()
                for _, event in ipairs(ReplicatedStorage:GetDescendants()) do
                    if event:IsA("RemoteEvent") and event.Name:lower():find(remoteName:lower()) then
                        event:FireServer()
                        found = true
                        Fluent:Notify({
                            Title = "Found Mining Remote!",
                            Content = "Fired: " .. event.Name,
                            Duration = 3
                        })
                    end
                end
            end)
        end
        
        if not found then
            Fluent:Notify({
                Title = "No Mining Remotes",
                Content = "No mining remotes found. Use Scanner!",
                Duration = 3
            })
        end
    end,
})

Tabs.Mining:AddButton({
    Title = "🎁 Try Claim Rewards",
    Description = "Test reward-related remotes",
    Callback = function()
        local rewardRemotes = {
            "ClaimReward", "GetReward", "DailyReward", 
            "CollectReward", "Reward", "ClaimDaily"
        }
        
        for _, remoteName in ipairs(rewardRemotes) do
            pcall(function()
                for _, event in ipairs(ReplicatedStorage:GetDescendants()) do
                    if event:IsA("RemoteEvent") and event.Name:lower():find(remoteName:lower()) then
                        event:FireServer()
                        Fluent:Notify({
                            Title = "Found Reward Remote!",
                            Content = "Fired: " .. event.Name,
                            Duration = 3
                        })
                    end
                end
            end)
        end
    end,
})

Tabs.Mining:AddButton({
    Title = "🔼 Try Instant Upgrades",
    Description = "Test upgrade-related remotes",
    Callback = function()
        local upgradeRemotes = {
            "Upgrade", "PurchaseUpgrade", "BuyUpgrade", 
            "UpgradePickaxe", "UpgradeTool", "MaxUpgrade"
        }
        
        for _, remoteName in ipairs(upgradeRemotes) do
            pcall(function()
                for _, event in ipairs(ReplicatedStorage:GetDescendants()) do
                    if event:IsA("RemoteEvent") and event.Name:lower():find(remoteName:lower()) then
                        event:FireServer()
                        Fluent:Notify({
                            Title = "Found Upgrade Remote!",
                            Content = "Fired: " .. event.Name,
                            Duration = 3
                        })
                    end
                end
            end)
        end
    end,
})

Tabs.Mining:AddButton({
    Title = "🎰 Try Spin Wheel",
    Description = "Test spin/wheel remotes",
    Callback = function()
        local spinRemotes = {
            "Spin", "SpinWheel", "Prize", "Wheel", "Lucky"
        }
        
        for _, remoteName in ipairs(spinRemotes) do
            pcall(function()
                for _, event in ipairs(ReplicatedStorage:GetDescendants()) do
                    if event:IsA("RemoteEvent") and event.Name:lower():find(remoteName:lower()) then
                        event:FireServer()
                        Fluent:Notify({
                            Title = "Found Spin Remote!",
                            Content = "Fired: " .. event.Name,
                            Duration = 3
                        })
                    end
                end
            end)
        end
    end,
})

-- SCANNER TAB
Tabs.Scanner:AddParagraph({
    Title = "🔍 Remote Event Scanner",
    Content = "Scan and discover all exploitable remotes in the game"
})

local RemoteList = Tabs.Scanner:AddParagraph({
    Title = "📋 Found Remotes",
    Content = "Click 'Scan All Remotes' to discover remote events"
})

Tabs.Scanner:AddButton({
    Title = "🔍 Scan All Remote Events",
    Description = "Find all RemoteEvents in the game",
    Callback = function()
        foundRemotes = {}
        local remoteCount = 0
        
        for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
            if obj:IsA("RemoteEvent") then
                table.insert(foundRemotes, {
                    name = obj.Name,
                    path = obj:GetFullName()
                })
                remoteCount = remoteCount + 1
            end
        end
        
        local remoteText = string.format("Found %d RemoteEvents:\n", remoteCount)
        for i, remote in ipairs(foundRemotes) do
            if i <= 10 then
                remoteText = remoteText .. string.format("\n%d. %s", i, remote.name)
            end
        end
        
        if remoteCount > 10 then
            remoteText = remoteText .. string.format("\n... and %d more", remoteCount - 10)
        elseif remoteCount == 0 then
            remoteText = "No RemoteEvents found!"
        end
        
        RemoteList:SetDesc(remoteText)
        
        Fluent:Notify({
            Title = "Scan Complete!",
            Content = string.format("Found %d remote events", remoteCount),
            Duration = 3
        })
    end
})

Tabs.Scanner:AddButton({
    Title = "📋 Copy All Remotes",
    Description = "Copy list to clipboard",
    Callback = function()
        if #foundRemotes == 0 then
            Fluent:Notify({
                Title = "No Remotes",
                Content = "Please scan remotes first!",
                Duration = 3
            })
            return
        end
        
        local remoteText = "-- Brainrot Miners Remote Events --\n\n"
        for i, remote in ipairs(foundRemotes) do
            remoteText = remoteText .. string.format("%d. %s\nPath: %s\n\n", i, remote.name, remote.path)
        end
        
        setclipboard(remoteText)
        Fluent:Notify({
            Title = "Copied!",
            Content = "Remote list copied to clipboard",
            Duration = 3
        })
    end
})

Tabs.Scanner:AddButton({
    Title = "🧪 Test All Remotes (No Args)",
    Description = "Fire all remotes with no arguments",
    Callback = function()
        if #foundRemotes == 0 then
            Fluent:Notify({
                Title = "No Remotes",
                Content = "Please scan remotes first!",
                Duration = 3
            })
            return
        end
        
        Fluent:Notify({
            Title = "Testing Remotes...",
            Content = "This may take a while!",
            Duration = 5
        })
        
        task.spawn(function()
            for _, remote in ipairs(foundRemotes) do
                pcall(function()
                    for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
                        if obj:IsA("RemoteEvent") and obj.Name == remote.name then
                            obj:FireServer()
                            task.wait(0.1)
                        end
                    end
                end)
            end
            
            Fluent:Notify({
                Title = "Test Complete!",
                Content = "All remotes tested",
                Duration = 3
            })
        end)
    end
})

Tabs.Scanner:AddSection("Remote Functions")

Tabs.Scanner:AddButton({
    Title = "🔍 Scan Remote Functions",
    Description = "Find all RemoteFunctions in the game",
    Callback = function()
        foundFunctions = {}
        local functionCount = 0
        
        for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
            if obj:IsA("RemoteFunction") then
                table.insert(foundFunctions, {
                    name = obj.Name,
                    path = obj:GetFullName()
                })
                functionCount = functionCount + 1
            end
        end
        
        Fluent:Notify({
            Title = "Scan Complete!",
            Content = string.format("Found %d remote functions", functionCount),
            Duration = 3
        })
    end
})

-- MISC TAB
Tabs.Misc:AddParagraph({
    Title = "⚙️ Miscellaneous Features",
    Content = "Additional utilities and tools"
})

local WalkSpeedSlider = Tabs.Misc:AddSlider("WalkSpeed", {
    Title = "🏃 Walk Speed",
    Description = "Change your walk speed",
    Default = 16,
    Min = 16,
    Max = 100,
    Rounding = 1,
    Callback = function(value)
        if plr.Character and plr.Character:FindFirstChild("Humanoid") then
            plr.Character.Humanoid.WalkSpeed = value
        end
    end
})

local JumpPowerSlider = Tabs.Misc:AddSlider("JumpPower", {
    Title = "🦘 Jump Power",
    Description = "Change your jump power",
    Default = 50,
    Min = 50,
    Max = 200,
    Rounding = 1,
    Callback = function(value)
        if plr.Character and plr.Character:FindFirstChild("Humanoid") then
            plr.Character.Humanoid.JumpPower = value
        end
    end
})

Tabs.Misc:AddButton({
    Title = "🔄 Respawn Character",
    Description = "Respawn your character",
    Callback = function()
        if plr.Character then
            plr.Character:BreakJoints()
            Fluent:Notify({
                Title = "Respawning...",
                Content = "Your character will respawn shortly",
                Duration = 3
            })
        end
    end
})

Tabs.Misc:AddButton({
    Title = "🔄 Reset Money Counter",
    Description = "Reset the money sent counter",
    Callback = function()
        getgenv().moneySent = 0
        Fluent:Notify({
            Title = "Reset!",
            Content = "Money counter has been reset",
            Duration = 3
        })
    end
})

-- Update character stats on respawn
plr.CharacterAdded:Connect(function(char)
    task.wait(1)
    if Tabs.Misc then
        local hum = char:WaitForChild("Humanoid")
        if WalkSpeedSlider then
            hum.WalkSpeed = WalkSpeedSlider.Value or 16
        end
        if JumpPowerSlider then
            hum.JumpPower = JumpPowerSlider.Value or 50
        end
    end
end)

-- SETTINGS TAB
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})

InterfaceManager:SetFolder("FixzHub")
SaveManager:SetFolder("FixzHub/BrainrotMiners")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

Window:SelectTab(1)

Fluent:Notify({
    Title = "⛏️ Fixz Hub Loaded!",
    Content = "Brainrot Miners ready - Use Scanner to find more exploits!",
    Duration = 5
})

SaveManager:LoadAutoloadConfig()

print("✅ Fixz Hub fully loaded!")
print("⛏️ Confirmed exploit: OfflineEvent for infinite money")
print("🔍 Use Scanner tab to find more remote events!")