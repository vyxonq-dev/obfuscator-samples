-- FIXZ HUB | CLAW MACHINE ARCADE 🎮
-- Using Fluent UI Library

print("🎮 Loading Fixz Hub for Claw Machine Arcade...")

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
getgenv().infTokens = false
getgenv().autoClaimMega = false
getgenv().autoClaimDaily = false
getgenv().tokensClaimed = 0

-- Create Window
local Window = Fluent:CreateWindow({
    Title = "🎮 Fixz Hub | Claw Machine Arcade",
    SubTitle = "Infinite Tokens & Auto Farm",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- Create Tabs
local Tabs = {
    Main = Window:AddTab({ Title = "🏠 Main", Icon = "home" }),
    Tokens = Window:AddTab({ Title = "🪙 Tokens", Icon = "coins" }),
    Auto = Window:AddTab({ Title = "⚡ Auto Farm", Icon = "zap" }),
    Misc = Window:AddTab({ Title = "⚙️ Misc", Icon = "wrench" }),
    Settings = Window:AddTab({ Title = "🔧 Settings", Icon = "settings" })
}

-- MAIN TAB
Tabs.Main:AddParagraph({
    Title = "🎮 Welcome to Fixz Hub!",
    Content = "Claw Machine Arcade - Get unlimited tokens and auto farm prizes!"
})

local StatsLabel = Tabs.Main:AddParagraph({
    Title = "📊 Statistics",
    Content = "Tokens Claimed: 0"
})

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

-- Update stats loop
task.spawn(function()
    while task.wait(1) do
        StatsLabel:SetDesc(string.format("Tokens Claimed: %d", getgenv().tokensClaimed))
    end
end)

-- TOKENS TAB
Tabs.Tokens:AddParagraph({
    Title = "🪙 Infinite Tokens",
    Content = "Get unlimited tokens to play all claw machines!"
})

local InfTokensToggle = Tabs.Tokens:AddToggle("InfTokens", {
    Title = "🪙 Infinite Tokens",
    Description = "Spam claim mega rewards for infinite tokens",
    Default = false
})

InfTokensToggle:OnChanged(function(state)
    getgenv().infTokens = state
    
    if state then
        Fluent:Notify({
            Title = "Infinite Tokens ON!",
            Content = "Claiming mega rewards continuously",
            Duration = 3
        })
        
        task.spawn(function()
            while getgenv().infTokens do
                pcall(function()
                    ReplicatedStorage.Rewards.Claim:FireServer("Mega")
                    getgenv().tokensClaimed = getgenv().tokensClaimed + 1
                end)
                task.wait()
            end
        end)
    else
        Fluent:Notify({
            Title = "Infinite Tokens OFF",
            Content = "Stopped claiming tokens",
            Duration = 3
        })
    end
end)

Tabs.Tokens:AddButton({
    Title = "💎 Claim Mega Reward",
    Description = "Claim mega reward once",
    Callback = function()
        pcall(function()
            ReplicatedStorage.Rewards.Claim:FireServer("Mega")
            getgenv().tokensClaimed = getgenv().tokensClaimed + 1
            Fluent:Notify({
                Title = "Claimed!",
                Content = "Mega reward claimed successfully",
                Duration = 2
            })
        end)
    end
})

Tabs.Tokens:AddButton({
    Title = "🎁 Claim Daily Reward",
    Description = "Claim daily reward once",
    Callback = function()
        pcall(function()
            ReplicatedStorage.Rewards.Claim:FireServer("Daily")
            Fluent:Notify({
                Title = "Claimed!",
                Content = "Daily reward claimed",
                Duration = 2
            })
        end)
    end
})

Tabs.Tokens:AddButton({
    Title = "⭐ Claim Premium Reward",
    Description = "Claim premium reward once",
    Callback = function()
        pcall(function()
            ReplicatedStorage.Rewards.Claim:FireServer("Premium")
            Fluent:Notify({
                Title = "Claimed!",
                Content = "Premium reward claimed",
                Duration = 2
            })
        end)
    end
})

-- AUTO FARM TAB
Tabs.Auto:AddParagraph({
    Title = "⚡ Auto Farm Features",
    Content = "Automatically claim rewards and farm tokens"
})

local AutoMegaToggle = Tabs.Auto:AddToggle("AutoMega", {
    Title = "💎 Auto Claim Mega",
    Description = "Automatically claim mega rewards every second",
    Default = false
})

AutoMegaToggle:OnChanged(function(state)
    getgenv().autoClaimMega = state
    
    if state then
        Fluent:Notify({
            Title = "Auto Mega ON!",
            Content = "Auto claiming mega rewards",
            Duration = 3
        })
        
        task.spawn(function()
            while getgenv().autoClaimMega do
                pcall(function()
                    ReplicatedStorage.Rewards.Claim:FireServer("Mega")
                    getgenv().tokensClaimed = getgenv().tokensClaimed + 1
                end)
                task.wait(1)
            end
        end)
    else
        Fluent:Notify({
            Title = "Auto Mega OFF",
            Content = "Stopped auto claiming",
            Duration = 3
        })
    end
end)

local AutoDailyToggle = Tabs.Auto:AddToggle("AutoDaily", {
    Title = "🎁 Auto Claim Daily",
    Description = "Automatically claim daily rewards",
    Default = false
})

AutoDailyToggle:OnChanged(function(state)
    getgenv().autoClaimDaily = state
    
    if state then
        task.spawn(function()
            while getgenv().autoClaimDaily do
                pcall(function()
                    ReplicatedStorage.Rewards.Claim:FireServer("Daily")
                end)
                task.wait(60) -- Try every minute
            end
        end)
    end
end)

Tabs.Auto:AddButton({
    Title = "🔄 Claim All Rewards",
    Description = "Claim Mega, Daily, and Premium at once",
    Callback = function()
        local rewards = {"Mega", "Daily", "Premium"}
        for _, reward in ipairs(rewards) do
            pcall(function()
                ReplicatedStorage.Rewards.Claim:FireServer(reward)
            end)
            task.wait(0.1)
        end
        Fluent:Notify({
            Title = "All Claimed!",
            Content = "Attempted to claim all rewards",
            Duration = 3
        })
    end
})

-- MISC TAB
Tabs.Misc:AddParagraph({
    Title = "⚙️ Miscellaneous",
    Content = "Additional features and utilities"
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
    Title = "📊 Show Game Stats",
    Description = "Display your game statistics",
    Callback = function()
        Fluent:Notify({
            Title = "Game Stats",
            Content = string.format("Tokens Claimed: %d", getgenv().tokensClaimed),
            Duration = 5
        })
    end
})

Tabs.Misc:AddButton({
    Title = "🔄 Reset Token Counter",
    Description = "Reset the tokens claimed counter",
    Callback = function()
        getgenv().tokensClaimed = 0
        Fluent:Notify({
            Title = "Reset!",
            Content = "Token counter has been reset",
            Duration = 3
        })
    end
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
SaveManager:SetFolder("FixzHub/ClawMachine")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

Window:SelectTab(1)

Fluent:Notify({
    Title = "🎮 Fixz Hub Loaded!",
    Content = "Claw Machine Arcade ready - Get unlimited tokens!",
    Duration = 5
})

SaveManager:LoadAutoloadConfig()

print("✅ Fixz Hub fully loaded!")