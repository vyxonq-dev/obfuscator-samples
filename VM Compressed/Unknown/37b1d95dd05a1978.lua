-- FIXZ HUB | CREATE A FACTORY 🏭
-- Using Fluent UI Library

print("🏭 Loading Fixz Hub for Create a Factory...")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")

local player = Players.LocalPlayer

-- Anti-AFK
player.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

-- Variables
getgenv().infMoney = false
getgenv().moneyAmount = 10000000000 -- 10 billion
getgenv().moneySent = 0

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

-- Create Window
local Window = Fluent:CreateWindow({
    Title = "🏭 Fixz Hub | Create a Factory",
    SubTitle = "Infinite Money Exploit",
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
    Settings = Window:AddTab({ Title = "⚙️ Settings", Icon = "settings" })
}

-- MAIN TAB
Tabs.Main:AddParagraph({
    Title = "🏭 Welcome to Fixz Hub!",
    Content = "Create a Factory - Get unlimited money with conveyor exploit!"
})

local StatsLabel = Tabs.Main:AddParagraph({
    Title = "📊 Statistics",
    Content = string.format("Money Sent: %d times", getgenv().moneySent)
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
        setclipboard("https://discord.gg/w7mpnRStv3")
        Fluent:Notify({
            Title = "Discord Copied!",
            Content = "Discord invite copied to clipboard!",
            Duration = 3
        })
    end
})

Tabs.Main:AddSection("Quick Start")

Tabs.Main:AddParagraph({
    Title = "How to Use",
    Content = "1. Make sure you have a base with a Seller\n2. Go to Money tab\n3. Enable Infinite Money\n4. Watch your money grow!"
})

-- MONEY TAB
Tabs.Money:AddParagraph({
    Title = "💰 Infinite Money Exploit",
    Content = "Exploit the conveyor system to get unlimited money!"
})

Tabs.Money:AddSection("Money Configuration")

local MoneyInput = Tabs.Money:AddInput("MoneyAmount", {
    Title = "💰 Money Amount",
    Description = "Amount per cycle (default: 10 billion)",
    Default = tostring(getgenv().moneyAmount),
    Placeholder = "e.g., 10000000000",
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

Tabs.Money:AddSection("Infinite Money")

local InfMoneyToggle = Tabs.Money:AddToggle("InfMoney", {
    Title = "💰 Infinite Money",
    Description = "Auto send money via conveyor exploit",
    Default = false
})

InfMoneyToggle:OnChanged(function(state)
    getgenv().infMoney = state
    
    if state then
        Fluent:Notify({
            Title = "Infinite Money ON!",
            Content = "Sending money continuously",
            Duration = 3
        })
        
        task.spawn(function()
            while getgenv().infMoney do
                pcall(function()
                    local base = player.Base and player.Base.Value
                    if base then
                        local seller = base.PlacedPieces and base.PlacedPieces:FindFirstChild("Seller")
                        
                        ReplicatedStorage.RemoveEvents.SetupConveyorTouches:FireServer(getgenv().moneyAmount, 1)
                        ReplicatedStorage.RemoveEvents.SetupConveyorTouches:FireServer(getgenv().moneyAmount, 1)
                        
                        if seller then
                            ReplicatedStorage.RemoveEvents.SetupConveyorTouches:FireServer(seller, getgenv().moneyAmount, 1)
                        end
                        
                        getgenv().moneySent = getgenv().moneySent + 1
                    end
                end)
                task.wait(0.1)
            end
        end)
    else
        Fluent:Notify({
            Title = "Infinite Money OFF",
            Content = "Stopped sending money",
            Duration = 3
        })
    end
end)

Tabs.Money:AddSection("Manual Actions")

Tabs.Money:AddButton({
    Title = "💰 Send Money (Once)",
    Description = "Send money one time",
    Callback = function()
        pcall(function()
            local base = player.Base and player.Base.Value
            if base then
                local seller = base.PlacedPieces and base.PlacedPieces:FindFirstChild("Seller")
                
                ReplicatedStorage.RemoveEvents.SetupConveyorTouches:FireServer(getgenv().moneyAmount, 1)
                ReplicatedStorage.RemoveEvents.SetupConveyorTouches:FireServer(getgenv().moneyAmount, 1)
                
                if seller then
                    ReplicatedStorage.RemoveEvents.SetupConveyorTouches:FireServer(seller, getgenv().moneyAmount, 1)
                end
                
                getgenv().moneySent = getgenv().moneySent + 1
                
                Fluent:Notify({
                    Title = "Money Sent!",
                    Content = string.format("Sent %d money", getgenv().moneyAmount),
                    Duration = 3
                })
            else
                Fluent:Notify({
                    Title = "No Base Found",
                    Content = "Make sure you have a base!",
                    Duration = 3
                })
            end
        end)
    end
})

Tabs.Money:AddButton({
    Title = "💎 Send Money x10",
    Description = "Send money 10 times rapidly",
    Callback = function()
        task.spawn(function()
            for i = 1, 10 do
                pcall(function()
                    local base = player.Base and player.Base.Value
                    if base then
                        local seller = base.PlacedPieces and base.PlacedPieces:FindFirstChild("Seller")
                        
                        ReplicatedStorage.RemoveEvents.SetupConveyorTouches:FireServer(getgenv().moneyAmount, 1)
                        ReplicatedStorage.RemoveEvents.SetupConveyorTouches:FireServer(getgenv().moneyAmount, 1)
                        
                        if seller then
                            ReplicatedStorage.RemoveEvents.SetupConveyorTouches:FireServer(seller, getgenv().moneyAmount, 1)
                        end
                        
                        getgenv().moneySent = getgenv().moneySent + 1
                    end
                end)
                task.wait(0.1)
            end
            Fluent:Notify({
                Title = "Complete!",
                Content = "Sent money 10 times",
                Duration = 3
            })
        end)
    end
})

Tabs.Money:AddButton({
    Title = "🔄 Reset Money Counter",
    Description = "Reset the money sent counter",
    Callback = function()
        getgenv().moneySent = 0
        Fluent:Notify({
            Title = "Reset!",
            Content = "Money counter has been reset",
            Duration = 2
        })
    end
})

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
    end
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
    end
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
    end
})

Tabs.Money:AddButton({
    Title = "🚀 10 Billion (Max)",
    Description = "Set to 10,000,000,000",
    Callback = function()
        getgenv().moneyAmount = 10000000000
        MoneyInput:SetValue("10000000000")
        Fluent:Notify({
            Title = "Preset Applied!",
            Content = "Amount: 10 Billion",
            Duration = 2
        })
    end
})

Tabs.Money:AddSection("Information")

Tabs.Money:AddParagraph({
    Title = "ℹ️ How it Works",
    Content = "This exploit uses the SetupConveyorTouches remote to send money directly. Make sure you have:\n• A Base\n• A Seller piece placed\n• The game loaded properly"
})

Tabs.Money:AddButton({
    Title = "🔍 Check Base Status",
    Description = "Check if base and seller exist",
    Callback = function()
        local base = player.Base and player.Base.Value
        if base then
            local seller = base.PlacedPieces and base.PlacedPieces:FindFirstChild("Seller")
            if seller then
                Fluent:Notify({
                    Title = "Base Status: ✅",
                    Content = "Base and Seller found!",
                    Duration = 5
                })
            else
                Fluent:Notify({
                    Title = "Base Status: ⚠️",
                    Content = "Base found but no Seller! Place a Seller piece.",
                    Duration = 5
                })
            end
        else
            Fluent:Notify({
                Title = "Base Status: ❌",
                Content = "No base found! Create a base first.",
                Duration = 5
            })
        end
    end
})

-- SETTINGS TAB
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})

InterfaceManager:SetFolder("FixzHub")
SaveManager:SetFolder("FixzHub/CreateFactory")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

Window:SelectTab(1)

Fluent:Notify({
    Title = "🏭 Fixz Hub Loaded!",
    Content = "Create a Factory ready - Get infinite money!",
    Duration = 5
})

SaveManager:LoadAutoloadConfig()

print("✅ Fixz Hub fully loaded!")
print("🏭 Conveyor exploit ready!")
print("💰 Use Money tab to get infinite money!")