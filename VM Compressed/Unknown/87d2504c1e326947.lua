-- FIXZ HUB | DUMP [ALPHA] 🗑️
-- Using Fluent UI Library

print("🗑️ Loading Fixz Hub for DUMP...")

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")

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
getgenv().infEggs = false
getgenv().autoSell = false
getgenv().autoCollect = false
getgenv().eggsDuped = 0
local foundRemotes = {}

-- Create Window
local Window = Fluent:CreateWindow({
    Title = "🗑️ Fixz Hub | DUMP [ALPHA]",
    SubTitle = "Infinite Eggs & Auto Farm",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- Create Tabs
local Tabs = {
    Main = Window:AddTab({ Title = "🏠 Main", Icon = "home" }),
    Eggs = Window:AddTab({ Title = "🥚 Eggs", Icon = "egg" }),
    Farm = Window:AddTab({ Title = "🗑️ Farm", Icon = "trash-2" }),
    Scanner = Window:AddTab({ Title = "🔍 Remote Scanner", Icon = "search" }),
    Misc = Window:AddTab({ Title = "⚙️ Misc", Icon = "wrench" }),
    Settings = Window:AddTab({ Title = "🔧 Settings", Icon = "settings" })
}

-- MAIN TAB
Tabs.Main:AddParagraph({
    Title = "🗑️ Welcome to Fixz Hub!",
    Content = "DUMP [ALPHA] - Infinite eggs, auto farm, and remote scanner!"
})

local StatsLabel = Tabs.Main:AddParagraph({
    Title = "📊 Statistics",
    Content = "Eggs Duped: 0"
})

task.spawn(function()
    while task.wait(1) do
        StatsLabel:SetDesc(string.format("Eggs Duped: %d", getgenv().eggsDuped))
    end
end)

Tabs.Main:AddButton({
    Title = "🎮 Join Discord",
    Description = "Get support and updates",
    Callback = function()
        setclipboard("https://discord.gg/CDyrbSY8Gx")
        Fluent:Notify({
            Title = "Discord Copied!",
            Content = "Discord invite copied to clipboard!",
            Duration = 3
        })
    end
})

-- EGGS TAB
Tabs.Eggs:AddParagraph({
    Title = "🥚 Infinite Eggs Exploit",
    Content = "Dupe eggs infinitely using remote events!"
})

local InfEggsToggle = Tabs.Eggs:AddToggle("InfEggs", {
    Title = "🥚 Infinite Eggs (LavaGolem)",
    Description = "Spam purchase LavaGolemEgg for infinite eggs",
    Default = false
})

InfEggsToggle:OnChanged(function(state)
    getgenv().infEggs = state
    
    if state then
        Fluent:Notify({
            Title = "Infinite Eggs ON!",
            Content = "Duping LavaGolemEgg continuously",
            Duration = 3
        })
        
        task.spawn(function()
            while getgenv().infEggs do
                pcall(function()
                    ReplicatedStorage.Network.RemoteEvents.PurchaseEgg:FireServer('LavaGolemEgg')
                    getgenv().eggsDuped = getgenv().eggsDuped + 1
                end)
                task.wait()
            end
        end)
    else
        Fluent:Notify({
            Title = "Infinite Eggs OFF",
            Content = "Stopped duping eggs",
            Duration = 3
        })
    end
end)

Tabs.Eggs:AddButton({
    Title = "🥚 Purchase LavaGolem Egg (Single)",
    Description = "Purchase one LavaGolemEgg",
    Callback = function()
        pcall(function()
            ReplicatedStorage.Network.RemoteEvents.PurchaseEgg:FireServer('LavaGolemEgg')
            getgenv().eggsDuped = getgenv().eggsDuped + 1
            Fluent:Notify({
                Title = "Egg Purchased!",
                Content = "LavaGolemEgg obtained",
                Duration = 2
            })
        end)
    end
})

local EggInput = Tabs.Eggs:AddInput("CustomEgg", {
    Title = "Custom Egg Name",
    Description = "Enter custom egg name to purchase",
    Default = "LavaGolemEgg",
    Placeholder = "e.g., BasicEgg",
    Numeric = false,
    Finished = false,
    Callback = function(value)
        -- Value is stored for use in custom egg button
    end
})

Tabs.Eggs:AddButton({
    Title = "🥚 Purchase Custom Egg",
    Description = "Purchase the egg name you entered above",
    Callback = function()
        local eggName = EggInput.Value or "LavaGolemEgg"
        pcall(function()
            ReplicatedStorage.Network.RemoteEvents.PurchaseEgg:FireServer(eggName)
            Fluent:Notify({
                Title = "Egg Purchased!",
                Content = eggName .. " obtained",
                Duration = 2
            })
        end)
    end
})

-- FARM TAB
Tabs.Farm:AddParagraph({
    Title = "🗑️ Auto Farm Features",
    Content = "Automatically dig, collect, and sell items"
})

Tabs.Farm:AddButton({
    Title = "💰 Try Auto Sell Items",
    Description = "Attempt to fire sell remote",
    Callback = function()
        local sellRemotes = {
            "SellItems",
            "Sell",
            "SellAll",
            "SellTrash",
            "DepositItems",
            "TurnInItems"
        }
        
        for _, remoteName in ipairs(sellRemotes) do
            pcall(function()
                local remote = ReplicatedStorage.Network.RemoteEvents:FindFirstChild(remoteName)
                if remote then
                    remote:FireServer()
                    Fluent:Notify({
                        Title = "Found Sell Remote!",
                        Content = "Fired: " .. remoteName,
                        Duration = 3
                    })
                end
            end)
        end
    end
})

Tabs.Farm:AddButton({
    Title = "⛏️ Try Auto Dig",
    Description = "Attempt to fire dig remote",
    Callback = function()
        local digRemotes = {
            "Dig",
            "StartDig",
            "CollectItem",
            "GatherItem",
            "PickupItem"
        }
        
        for _, remoteName in ipairs(digRemotes) do
            pcall(function()
                local remote = ReplicatedStorage.Network.RemoteEvents:FindFirstChild(remoteName)
                if remote then
                    remote:FireServer()
                    Fluent:Notify({
                        Title = "Found Dig Remote!",
                        Content = "Fired: " .. remoteName,
                        Duration = 3
                    })
                end
            end)
        end
    end
})

Tabs.Farm:AddButton({
    Title = "🔼 Try Upgrade Shovel",
    Description = "Attempt to upgrade shovel for free",
    Callback = function()
        local upgradeRemotes = {
            "UpgradeTool",
            "UpgradeShovel",
            "Upgrade",
            "PurchaseUpgrade",
            "BuyUpgrade"
        }
        
        for _, remoteName in ipairs(upgradeRemotes) do
            pcall(function()
                local remote = ReplicatedStorage.Network.RemoteEvents:FindFirstChild(remoteName)
                if remote then
                    remote:FireServer()
                    Fluent:Notify({
                        Title = "Found Upgrade Remote!",
                        Content = "Fired: " .. remoteName,
                        Duration = 3
                    })
                end
            end)
        end
    end
})

Tabs.Farm:AddButton({
    Title = "💎 Try Get Free Cash",
    Description = "Attempt to fire money remotes",
    Callback = function()
        local moneyRemotes = {
            "AddMoney",
            "GiveCash",
            "AddCash",
            "ClaimReward",
            "DailyReward",
            "FreeReward"
        }
        
        for _, remoteName in ipairs(moneyRemotes) do
            pcall(function()
                local remote = ReplicatedStorage.Network.RemoteEvents:FindFirstChild(remoteName)
                if remote then
                    remote:FireServer(999999)
                    Fluent:Notify({
                        Title = "Found Money Remote!",
                        Content = "Fired: " .. remoteName,
                        Duration = 3
                    })
                end
            end)
        end
    end
})

-- SCANNER TAB
Tabs.Scanner:AddParagraph({
    Title = "🔍 Remote Event Scanner",
    Content = "Scan and test all remote events in the game"
})

local RemoteList = Tabs.Scanner:AddParagraph({
    Title = "📋 Found Remotes",
    Content = "Click 'Scan Remotes' to find all remote events"
})

Tabs.Scanner:AddButton({
    Title = "🔍 Scan All Remote Events",
    Description = "Find all remote events in ReplicatedStorage",
    Callback = function()
        foundRemotes = {}
        local remoteCount = 0
        
        for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
            if obj:IsA("RemoteEvent") then
                table.insert(foundRemotes, obj:GetFullName())
                remoteCount = remoteCount + 1
            end
        end
        
        local remoteText = "Found " .. remoteCount .. " RemoteEvents:\n"
        for i, remote in ipairs(foundRemotes) do
            if i <= 10 then -- Show first 10
                remoteText = remoteText .. "\n" .. i .. ". " .. remote
            end
        end
        
        if remoteCount > 10 then
            remoteText = remoteText .. "\n... and " .. (remoteCount - 10) .. " more"
        end
        
        RemoteList:SetDesc(remoteText)
        
        Fluent:Notify({
            Title = "Scan Complete!",
            Content = "Found " .. remoteCount .. " remote events",
            Duration = 3
        })
    end
})

Tabs.Scanner:AddButton({
    Title = "📋 Copy All Remotes to Clipboard",
    Description = "Copy list of all remote events",
    Callback = function()
        if #foundRemotes == 0 then
            Fluent:Notify({
                Title = "No Remotes",
                Content = "Please scan remotes first!",
                Duration = 3
            })
            return
        end
        
        local remoteText = "-- DUMP [ALPHA] Remote Events --\n\n"
        for i, remote in ipairs(foundRemotes) do
            remoteText = remoteText .. remote .. "\n"
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
    Title = "🧪 Test All Remotes (NO ARGS)",
    Description = "Fire all remotes with no arguments (may cause kicks!)",
    Callback = function()
        Fluent:Notify({
            Title = "Testing Remotes...",
            Content = "This may take a while and could kick you!",
            Duration = 5
        })
        
        task.spawn(function()
            for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
                if obj:IsA("RemoteEvent") then
                    pcall(function()
                        obj:FireServer()
                        task.wait(0.1)
                    end)
                end
            end
            
            Fluent:Notify({
                Title = "Test Complete!",
                Content = "All remotes tested",
                Duration = 3
            })
        end)
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
    Title = "🔄 Reset Egg Counter",
    Description = "Reset the eggs duped counter",
    Callback = function()
        getgenv().eggsDuped = 0
        Fluent:Notify({
            Title = "Reset!",
            Content = "Egg counter has been reset",
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
SaveManager:SetFolder("FixzHub/DUMP")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

Window:SelectTab(1)

Fluent:Notify({
    Title = "🗑️ Fixz Hub Loaded!",
    Content = "DUMP [ALPHA] ready - Infinite eggs enabled!",
    Duration = 5
})

SaveManager:LoadAutoloadConfig()

print("✅ Fixz Hub fully loaded!")
print("🔍 Use the Remote Scanner tab to find more OP remotes!")