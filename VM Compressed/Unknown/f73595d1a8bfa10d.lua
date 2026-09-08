local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = game.Players.LocalPlayer

-- Key System for Auto-Save
local keySystemNote = "https://discord.gg/QYP4VWz8"
local key = "your_key_here"
local autoSave = true

-- Rayfield UI Setup
local success, Rayfield = pcall(function()
    return loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
end)

if not success then
    warn("Failed to load Rayfield UI Library!")
    return
else
    print("Rayfield Library loaded successfully!")
end

-- Create the main window
local Window = Rayfield:CreateWindow({
    Name = "Yuki Hub",
    LoadingTitle = "Made by Yuki",
    LoadingSubtitle = "Quality Ahead",
    Theme = "Default",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "YukiHubConfigs",
        FileName = "Big Hub"
    },
    Discord = {
        Enabled = true,
        Invite = "SGaZpCpG4f",
        RememberJoins = true
    },
    KeySystem = true,
    KeySettings = {
        Title = "Anime Card Master | Key",
        Subtitle = "Enter the key below to continue",
        Note = "Join our Discord server for the key: 3aMXUmgqZQ",
        FileName = "Key",
        SaveKey = false,
        GrabKeyFromSite = false,
        Key = {"gamsra"}
    }
})

-- Main Tab
local MainTab = Window:CreateTab("Main", nil)
local MainSection = MainTab:CreateSection("Main Functions")

-- Infinite Boss Damage + Evo Gems Toggle
local isRunningInfiniteBoss = false
MainTab:CreateToggle({
    Name = "Infinite Boss Damage + Evo Gems",
    CurrentValue = false,
    Flag = "InfiniteBossToggle",
    Callback = function(Value)
        isRunningInfiniteBoss = Value
        if Value then
            task.spawn(function()
                while isRunningInfiniteBoss do
                    local args = {
                        [1] = "GetReward",
                        [2] = "RaidReward"
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
                    task.wait(0)  -- Zero delay
                end
            end)
        end
    end
})

-- Main Tab Notes
MainTab:CreateParagraph({
    Title = "Infinite Boss Damage + Evo Gems Note:",
    Content = "This feature gives you infinite boss damage and evo gems. Only when the raid is here. It also depends on your team and your network."
})

-- Instant Rank Toggle
local isRunningInstantRank = false
MainTab:CreateToggle({
    Name = "Instant Rank",
    CurrentValue = false,
    Flag = "InstantRankToggle",
    Callback = function(Value)
        isRunningInstantRank = Value
        if Value then
            task.spawn(function()
                while isRunningInstantRank do
                    game:GetService("ReplicatedStorage").Remote.RemoteFunction:InvokeServer("CardRank")
                    task.wait(0)
                end
            end)
        end
    end
})

MainTab:CreateParagraph({Title = "Instant Rank Note:", Content = "You can use this to get higher level in pass instantly. Only if you are strong enough to beat it!"})

-- Instant Floor Toggle
local isRunningInstantFloor = false
MainTab:CreateToggle({
    Name = "Instant Floor",
    CurrentValue = false,
    Flag = "InstantFloorToggle",
    Callback = function(Value)
        isRunningInstantFloor = Value
        if Value then
            task.spawn(function()
                while isRunningInstantFloor do
                    game:GetService("ReplicatedStorage").Remote.RemoteEvent:FireServer("ChallengeFloor")
                    task.wait(0)
                end
            end)
        end
    end
})

MainTab:CreateParagraph({Title = "Instant Floor Note:", Content = "This instantly high up your floor level only if your team are strong enough!"})

-- Fast Use 999 Luck (Fast Spin Only)
local isRunningFastSpin = false
MainTab:CreateToggle({
    Name = "Fast Use 999 Luck",
    CurrentValue = false,
    Flag = "FastSpinToggle",
    Callback = function(Value)
        isRunningFastSpin = Value
        if Value then
            task.spawn(function()
                while isRunningFastSpin do
                    game:GetService("ReplicatedStorage").Remote.RemoteEvent:FireServer("DrawCard")
                    task.wait(0)
                end
            end)
        end
    end
})

MainTab:CreateParagraph({Title = "Fast Use 999 Luck Note:", Content = "This Uses Your 999 Luck Very Fast."})

-- Dupe Cards Section (Main Tab)
local CardID = 0
local Amount = 1

MainTab:CreateInput({
    Name = "Card ID",
    PlaceholderText = "Enter Card ID",
    Callback = function(Value)
        CardID = tonumber(Value)
    end
})

MainTab:CreateInput({
    Name = "Amount",
    PlaceholderText = "Enter Amount",
    Callback = function(Value)
        Amount = tonumber(Value)
    end
})

MainTab:CreateButton({
    Name = "Dupe Cards",
    Callback = function()
        if CardID > 0 then
            local args = {
                [1] = "SellCard",
                [2] = CardID,
                [3] = -Amount
            }
            game:GetService("ReplicatedStorage").Remote.RemoteEvent:FireServer(unpack(args))
        else
            warn("Invalid Card ID entered!")
        end
    end
})

-- Dupe All Cards Button (Updated)
MainTab:CreateButton({
    Name = "Dupe All Cards",
    Callback = function()
        if Amount > 0 then
            for cardID = 1001, 4680 do
                local args = {
                    [1] = "SellCard",
                    [2] = cardID,
                    [3] = -Amount
                }
                game:GetService("ReplicatedStorage").Remote.RemoteEvent:FireServer(unpack(args))
            end
        else
            warn("Invalid Amount entered!")
        end
    end
})

MainTab:CreateParagraph({Title = "Dupe Cards Note:", Content = "Look For the Tag/# In Pack on The card you want to dupe And put the Tag/# Into The Card ID And Put The Number Of Amount you want."})

-- Glitch Pass Tab
local GlitchPassTab = Window:CreateTab("Glitch Pass", nil)
local GlitchPassSection = GlitchPassTab:CreateSection("Glitch Features")

-- Infinite Recruit Card
local isRunningInfRecruitCard = false
GlitchPassTab:CreateToggle({
    Name = "Infinite Recruit Card",
    CurrentValue = false,
    Flag = "InfRecruitToggle",
    Callback = function(Value)
        isRunningInfRecruitCard = Value
        if Value then
            task.spawn(function()
                while isRunningInfRecruitCard do
                    game:GetService("ReplicatedStorage").Remote.RemoteEvent:FireServer("GetReward", "PassReward", 10, false)
                    task.wait(0)
                end
            end)
        end
    end
})
GlitchPassTab:CreateParagraph({Title = "Infinite Recruit Card Note:", Content = "This Gives You Infinite Recruit Card. Requires level 65 in free pass."})

-- Glitch Pass Button
GlitchPassTab:CreateButton({
    Name = "Glitch Pass",
    Callback = function()
        for i = 1, 469 do
            game:GetService("ReplicatedStorage").Remote.RemoteEvent:FireServer("GetReward", "PassReward", i, false)
        end
    end
})
GlitchPassTab:CreateParagraph({Title = "Glitch Pass Note:", Content = "Use This Before Using The Others then rejoin! Requires level 55 in free pass."})

-- Infinite All Pass Toggle
local isRunningInfAllPass = false
GlitchPassTab:CreateToggle({
    Name = "Infinite All Pass",
    CurrentValue = false,
    Flag = "InfAllPassToggle",
    Callback = function(Value)
        isRunningInfAllPass = Value
        if Value then
            task.spawn(function()
                while isRunningInfAllPass do
                    for i = 1, 50 do
                        game:GetService("ReplicatedStorage").Remote.RemoteEvent:FireServer("GetReward", "PassReward", i, false)
                    end
                    task.wait(0)
                end
            end)
        end
    end
})
GlitchPassTab:CreateParagraph({Title = "Infinite All Pass Note:", Content = "This Gives you infinite everything in the pass. Requires 55 Level."})

-- Inf 9999 Luck Toggle
local isRunningInfLuck = false
GlitchPassTab:CreateToggle({
    Name = "Inf 9999 Luck",
    CurrentValue = false,
    Flag = "InfLuckToggle",
    Callback = function(Value)
        isRunningInfLuck = Value
        if Value then
            task.spawn(function()
                while isRunningInfLuck do
                    game:GetService("ReplicatedStorage").Remote.RemoteEvent:FireServer("GetReward", "PassReward", 5, false)
                    task.wait(0)
                end
            end)
        end
    end
})
GlitchPassTab:CreateParagraph({Title = "Inf 9999 Luck Note:", Content = "This grants you infinite 999 luck. Requires 55 Level In Free Pass."})

-- Potions Tab
local PotionTab = Window:CreateTab("Potions", nil)
PotionTab:CreateSection("Potion Shop")

local potionIDs = {
    [1001] = "Luck Potion I",
    [1002] = "Luck Potion II",
    [1003] = "Luck Potion III",
    [1004] = "Quality Potion I",
    [1005] = "Quality Potion II",
    [1006] = "Quality Potion III",
    [1007] = "Luck Potion Super",
    [1008] = "Quality Potion Super"
}

local PotionAmount = 1
PotionTab:CreateInput({
    Name = "Potion Amount",
    PlaceholderText = "Enter Amount",
    Callback = function(Value)
        PotionAmount = tonumber(Value)
    end
})

for id, potionName in pairs(potionIDs) do
    PotionTab:CreateButton({
        Name = "Buy " .. potionName,
        Callback = function()
            game:GetService("ReplicatedStorage").Remote.RemoteEvent:FireServer("BuyItem", id, PotionAmount, "PotionShopData")
        end
    })
end

-- Auto Use Potions Toggle (Restored)
local isAutoUsingPotions = false
PotionTab:CreateToggle({
    Name = "Auto Use Potions",
    CurrentValue = false,
    Flag = "AutoUsePotionsToggle",
    Callback = function(Value)
        isAutoUsingPotions = Value
        if Value then
            task.spawn(function()
                while isAutoUsingPotions do
                    for id, _ in pairs(potionIDs) do
                        game:GetService("ReplicatedStorage").Remote.RemoteEvent:FireServer("UseItem", id, 1)
                    end
                    task.wait(0)
                end
            end)
        end
    end
})

-- Challenge Tab (New)
local ChallengeTab = Window:CreateTab("Challenge", nil)
ChallengeTab:CreateSection("Challenge Features")

-- Auto Force Accept Challenge Toggle
local isRunningAutoAcceptChallenge = false
ChallengeTab:CreateToggle({
    Name = "Auto Force Accept Challenge",
    CurrentValue = false,
    Flag = "AutoForceAcceptChallenge",
    Callback = function(Value)
        isRunningAutoAcceptChallenge = Value
        if Value then
            task.spawn(function()
                while isRunningAutoAcceptChallenge do
                    local args = {
                        [1] = "AgreeRequest"  -- Accept the challenge
                    }

                    local challengeEvent = ReplicatedStorage:WaitForChild("Remote"):WaitForChild("PlayerReplicated")

                    if challengeEvent then
                        challengeEvent:FireServer(unpack(args))
                        print("Challenge Accepted!")
                    else
                        print("Error: PlayerReplicated event not found!")
                    end

                    task.wait(0)
                end
            end)
        end
    end
})

ChallengeTab:CreateParagraph({Title = "Auto Force Accept Challenge Note:", Content = "You need to challenge a person first then turn on this script. This will also give you inf luck potions lol"})

-- Trading Tab
local TradingTab = Window:CreateTab("Trading", nil)
local TradingSection = TradingTab:CreateSection("Trade Features")

local playerName = ""

-- Input for player name
TradingTab:CreateInput({
    Name = "Enter Player Name",
    PlaceholderText = "Enter the player's username",
    Callback = function(Value)
        playerName = Value
    end
})

-- Force Accept Button
TradingTab:CreateButton({
    Name = "Force Accept",
    Callback = function()
        if playerName and playerName ~= "" then
            local args = {
                [1] = "TradeEvent",
                [2] = "start",
                [3] = game:GetService("Players"):WaitForChild(playerName)
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
        else
            warn("Invalid player name!")
        end
    end
})

TradingTab:CreateParagraph({Title = "Force Trade Note:", Content = "Must have traded atleast once before using this."})

-- Credits Tab
local CreditTab = Window:CreateTab("Credits", nil)
CreditTab:CreateSection("Credits")

CreditTab:CreateButton({
    Name = "GUI made by Yuki_Chan69",
    Callback = function()
        print("Credits: GUI made by Yuki_Chan69")
    end
})

CreditTab:CreateButton({
    Name = "Script made by wzlfsdev",
    Callback = function()
        print("Credits: Script made by wzlfsdev")
    end
})

-- Final message on Credits Tab
CreditTab:CreateParagraph({
    Title = "Thank You",
    Content = "Thanks for using the script! For updates, join the Discord server: https://discord.gg/3aMXUmgqZQ"
})