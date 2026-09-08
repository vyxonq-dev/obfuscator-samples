-- Fixz Hub | Build A Zoo 🦁
-- Made By Fixz 64

repeat task.wait() until game:IsLoaded()

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local player = Players.LocalPlayer

-- Settings
local State = {
    AutoCollectCoin = false,
    AutoBuyEgg = false,
    AutoHatch = false,
    AutoSpin = false,
    AutoFish = false,
    AutoBuyConveyor = false,
    AutoEquipConveyor = false,
    AutoBait = false,
    AutoFood = false,
    AutoPotion = false,
    AutoDinoQuest = false,
    AutoCollectDino = false
}

local Settings = {
    SelectedEggs = {},
    SelectedPotions = {},
    SelectedBait = nil,
    SelectedFood = nil,
    SelectedQuest = nil,
    BuyConveyorIndex = 1,
    EquipConveyorIndex = 1,
    SpinCount = 1
}

local eggTypes = {
    "BasicEgg","RareEgg","SuperRareEgg","EpicEgg","LegendEgg","HyperEgg",
    "BowserEgg","VoidEgg","CornEgg","BoneDragonEgg","DemonEgg","PrismaticEgg","UltraEgg"
}

local PotionList = {"Potion_Coin","Potion_Luck","Potion_Hatch","Potion_3in1"}
local BaitList = {"FishingBait1", "FishingBait2", "FishingBait3"}
local FoodList = {
    "Strawberry","Blueberry","Watermelon","Apple","Orange",
    "Corn","Banana","Grape","Pear","PineApple","Dargon Fruit",
    "Gold Mango","Bloodstone Cycad","Colossal Pinecone","Volt Ginkgo",
    "Deepsea Pearl Fruit","Durian"
}
local QuestList = {"All"}
for i = 1, 20 do table.insert(QuestList, "Task_"..i) end

local CodeList = {
    "CFJXEH4M8K5","DelayGift","60KCCU919","50KCCU0912","SeasonOne",
    "ZooFish829","FIXERROR819","MagicFruit","WeekendEvent89","BugFixes",
    "U2CA518SC5","X2CA821BA3","55PA21N8y2"
}

-- ===== Rayfield UI with Key System =====
local Window = Rayfield:CreateWindow({
    Name = "Fixz Hub | Build A Zoo 🦁",
    LoadingTitle = "Fixz Hub",
    LoadingSubtitle = "Made By Fixz 64",
    ConfigurationSaving = {
        Enabled = false
    },
    Discord = {
        Enabled = true,
        Invite = "CDyrbSY8Gx",
        RememberJoins = true
    },
    KeySystem = true,
    KeySettings = {
        Title = "Fixz Hub Key System",
        Subtitle = "Enter Key",
        Note = "Join Discord to get key: https://discord.gg/CDyrbSY8Gx",
        FileName = "FixzHubKey",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"Fixz2025"}
    }
})

-- Tabs
local TabMain = Window:CreateTab("Main", 4483362458)
local TabEgg = Window:CreateTab("Eggs", 4483362458)
local TabShop = Window:CreateTab("Shop", 4483362458)
local TabEvent = Window:CreateTab("Event", 4483362458)
local TabCodes = Window:CreateTab("Codes", 4483362458)

-- ===== MAIN TAB =====
TabMain:CreateSection("Coin Collection")

TabMain:CreateToggle({
    Name = "Auto Collect Coins",
    CurrentValue = false,
    Flag = "AutoCollect",
    Callback = function(Value)
        State.AutoCollectCoin = Value
    end,
})

task.spawn(function()
    while task.wait(0.05) do
        if State.AutoCollectCoin then
            pcall(function()
                local petsFolder = Workspace:WaitForChild("Pets")
                local args = {"Claim"}
                for _, pet in pairs(petsFolder:GetChildren()) do
                    if pet:FindFirstChild("RootPart") and pet.RootPart:FindFirstChild("RE") then
                        pet.RootPart.RE:FireServer(unpack(args))
                    end
                end
            end)
        end
    end
end)

TabMain:CreateSection("Fishing")

TabMain:CreateToggle({
    Name = "Auto Reel Fish",
    CurrentValue = false,
    Flag = "AutoFish",
    Callback = function(Value)
        State.AutoFish = Value
    end,
})

task.spawn(function()
    while task.wait(0.5) do
        if State.AutoFish then
            pcall(function()
                local args = {"POUT",{SUC=1}}
                ReplicatedStorage.Remote.FishingRE:FireServer(unpack(args))
            end)
        end
    end
end)

TabMain:CreateSection("Lottery")

TabMain:CreateDropdown({
    Name = "Spin Count",
    Options = {"1", "3", "10"},
    CurrentOption = "1",
    Flag = "SpinCount",
    Callback = function(Value)
        Settings.SpinCount = tonumber(Value)
    end,
})

TabMain:CreateToggle({
    Name = "Auto Spin Lottery",
    CurrentValue = false,
    Flag = "AutoSpin",
    Callback = function(Value)
        State.AutoSpin = Value
    end,
})

task.spawn(function()
    while task.wait(1) do
        if State.AutoSpin then
            pcall(function()
                local args = {{event="lottery", count=Settings.SpinCount}}
                ReplicatedStorage.Remote.LotteryRE:FireServer(unpack(args))
            end)
        end
    end
end)

TabMain:CreateSection("Quick Actions")

TabMain:CreateButton({
    Name = "Sell All Pets",
    Callback = function()
        local args = {"SellAll","All","All"}
        ReplicatedStorage.Remote.PetRE:FireServer(unpack(args))
        Rayfield:Notify({
            Title = "Success",
            Content = "Sold all pets!",
            Duration = 3,
            Image = 4483362458
        })
    end,
})

TabMain:CreateButton({
    Name = "Pickup All Pets",
    Callback = function()
        pcall(function()
            local petsFolder = Workspace:FindFirstChild("Pets")
            if petsFolder then
                local remote = ReplicatedStorage:WaitForChild("Remote"):WaitForChild("CharacterRE")
                for _, pet in ipairs(petsFolder:GetChildren()) do
                    local uid = pet.Name
                    remote:FireServer("Del", uid)
                end
            end
        end)
        Rayfield:Notify({
            Title = "Success",
            Content = "Picked up all pets!",
            Duration = 3,
            Image = 4483362458
        })
    end,
})

-- ===== EGG TAB =====
TabEgg:CreateSection("Buy Eggs")

TabEgg:CreateDropdown({
    Name = "Select Eggs to Buy",
    Options = eggTypes,
    CurrentOption = {},
    MultipleOptions = true,
    Flag = "SelectedEggs",
    Callback = function(Value)
        Settings.SelectedEggs = {}
        if type(Value) == "table" then
            for _, egg in ipairs(Value) do
                Settings.SelectedEggs[egg] = true
            end
        end
    end,
})

TabEgg:CreateToggle({
    Name = "Auto Buy Eggs",
    CurrentValue = false,
    Flag = "AutoBuyEgg",
    Callback = function(Value)
        State.AutoBuyEgg = Value
    end,
})

local function getEggType(eggModel)
    local root = eggModel:FindFirstChild("RootPart")
    return (root and root:GetAttribute("Type")) or eggModel:GetAttribute("Type")
end

task.spawn(function()
    while task.wait(0.15) do
        if State.AutoBuyEgg then
            pcall(function()
                local art = Workspace:FindFirstChild("Art")
                if not art then return end
                
                local characterRE = ReplicatedStorage:WaitForChild("Remote"):WaitForChild("CharacterRE")
                
                for _, island in ipairs(art:GetChildren()) do
                    if island.Name:match("^Island_%d+$") then
                        local env = island:FindFirstChild("ENV")
                        if env then
                            local conveyor = env:FindFirstChild("Conveyor")
                            if conveyor then
                                for _, conveyorX in ipairs(conveyor:GetChildren()) do
                                    local belt = conveyorX:FindFirstChild("Belt")
                                    if belt then
                                        for _, eggModel in ipairs(belt:GetChildren()) do
                                            local eggType = getEggType(eggModel)
                                            if eggType and Settings.SelectedEggs[eggType] then
                                                local root = eggModel:FindFirstChild("RootPart")
                                                local uid = (root and root:GetAttribute("UID")) or tostring(eggModel.Name)
                                                characterRE:FireServer("BuyEgg", uid)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

TabEgg:CreateSection("Hatch Eggs")

TabEgg:CreateToggle({
    Name = "Auto Hatch Eggs",
    CurrentValue = false,
    Flag = "AutoHatch",
    Callback = function(Value)
        State.AutoHatch = Value
    end,
})

task.spawn(function()
    while task.wait(0.5) do
        if State.AutoHatch then
            pcall(function()
                local art = Workspace:FindFirstChild("Art")
                if not art then return end
                
                for _, island in ipairs(art:GetChildren()) do
                    if island.Name:match("^Island_%d+$") then
                        local env = island:FindFirstChild("ENV")
                        if env then
                            local conveyor = env:FindFirstChild("Conveyor")
                            if conveyor then
                                for _, conveyorX in ipairs(conveyor:GetChildren()) do
                                    local belt = conveyorX:FindFirstChild("Belt")
                                    if belt then
                                        for _, eggModel in ipairs(belt:GetChildren()) do
                                            local root = eggModel:FindFirstChild("RootPart")
                                            if root then
                                                local rf = root:FindFirstChild("RF")
                                                if rf and rf:IsA("RemoteFunction") then
                                                    rf:InvokeServer("Hatch")
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

-- ===== SHOP TAB =====
TabShop:CreateSection("Conveyor")

TabShop:CreateDropdown({
    Name = "Buy Conveyor (1-9)",
    Options = {"1","2","3","4","5","6","7","8","9"},
    CurrentOption = "1",
    Flag = "BuyConveyor",
    Callback = function(Value)
        Settings.BuyConveyorIndex = tonumber(Value)
    end,
})

TabShop:CreateToggle({
    Name = "Auto Buy Conveyor",
    CurrentValue = false,
    Flag = "AutoBuyConveyor",
    Callback = function(Value)
        State.AutoBuyConveyor = Value
    end,
})

task.spawn(function()
    while task.wait(2) do
        if State.AutoBuyConveyor then
            pcall(function()
                local args = {"Upgrade", Settings.BuyConveyorIndex}
                ReplicatedStorage.Remote.ConveyorRE:FireServer(unpack(args))
            end)
        end
    end
end)

TabShop:CreateDropdown({
    Name = "Equip Conveyor (1-9)",
    Options = {"1","2","3","4","5","6","7","8","9"},
    CurrentOption = "1",
    Flag = "EquipConveyor",
    Callback = function(Value)
        Settings.EquipConveyorIndex = tonumber(Value)
    end,
})

TabShop:CreateToggle({
    Name = "Auto Equip Conveyor",
    CurrentValue = false,
    Flag = "AutoEquipConveyor",
    Callback = function(Value)
        State.AutoEquipConveyor = Value
    end,
})

task.spawn(function()
    while task.wait(1.5) do
        if State.AutoEquipConveyor then
            pcall(function()
                local args = {"Switch", Settings.EquipConveyorIndex}
                ReplicatedStorage.Remote.ConveyorRE:FireServer(unpack(args))
            end)
        end
    end
end)

TabShop:CreateSection("Bait")

TabShop:CreateDropdown({
    Name = "Select Bait",
    Options = BaitList,
    CurrentOption = BaitList[1],
    Flag = "SelectedBait",
    Callback = function(Value)
        Settings.SelectedBait = Value
    end,
})

TabShop:CreateToggle({
    Name = "Auto Buy Bait",
    CurrentValue = false,
    Flag = "AutoBait",
    Callback = function(Value)
        State.AutoBait = Value
    end,
})

task.spawn(function()
    while task.wait(0.5) do
        if State.AutoBait and Settings.SelectedBait then
            pcall(function()
                local args = {"buy", Settings.SelectedBait}
                ReplicatedStorage.Remote.FishingRE:FireServer(unpack(args))
            end)
        end
    end
end)

TabShop:CreateSection("Food")

TabShop:CreateDropdown({
    Name = "Select Food",
    Options = FoodList,
    CurrentOption = FoodList[1],
    Flag = "SelectedFood",
    Callback = function(Value)
        Settings.SelectedFood = Value
    end,
})

TabShop:CreateToggle({
    Name = "Auto Buy Food",
    CurrentValue = false,
    Flag = "AutoFood",
    Callback = function(Value)
        State.AutoFood = Value
    end,
})

task.spawn(function()
    while task.wait(0.5) do
        if State.AutoFood and Settings.SelectedFood then
            pcall(function()
                local args = {Settings.SelectedFood}
                ReplicatedStorage.Remote.FoodStoreRE:FireServer(unpack(args))
            end)
        end
    end
end)

TabShop:CreateSection("Potions")

TabShop:CreateDropdown({
    Name = "Select Potions",
    Options = PotionList,
    CurrentOption = {},
    MultipleOptions = true,
    Flag = "SelectedPotions",
    Callback = function(Value)
        Settings.SelectedPotions = Value or {}
    end,
})

TabShop:CreateToggle({
    Name = "Auto Use Potions",
    CurrentValue = false,
    Flag = "AutoPotion",
    Callback = function(Value)
        State.AutoPotion = Value
    end,
})

task.spawn(function()
    while task.wait(5) do
        if State.AutoPotion then
            pcall(function()
                for _, potion in pairs(Settings.SelectedPotions) do
                    local args = {"UsePotion", potion}
                    ReplicatedStorage.Remote.ShopRE:FireServer(unpack(args))
                    task.wait(1)
                end
            end)
        end
    end
end)

-- ===== EVENT TAB =====
TabEvent:CreateSection("Dino Event")

TabEvent:CreateDropdown({
    Name = "Select Quest",
    Options = QuestList,
    CurrentOption = "All",
    Flag = "SelectedQuest",
    Callback = function(Value)
        Settings.SelectedQuest = Value
    end,
})

TabEvent:CreateToggle({
    Name = "Auto Claim Dino Quest",
    CurrentValue = false,
    Flag = "AutoDinoQuest",
    Callback = function(Value)
        State.AutoDinoQuest = Value
    end,
})

task.spawn(function()
    while task.wait(3) do
        if State.AutoDinoQuest and Settings.SelectedQuest then
            pcall(function()
                if Settings.SelectedQuest == "All" then
                    for i = 1, 20 do
                        local args = {{event="claimreward", id="Task_"..i}}
                        ReplicatedStorage.Remote.DinoEventRE:FireServer(unpack(args))
                    end
                else
                    local args = {{event="claimreward", id=Settings.SelectedQuest}}
                    ReplicatedStorage.Remote.DinoEventRE:FireServer(unpack(args))
                end
            end)
        end
    end
end)

TabEvent:CreateToggle({
    Name = "Auto Collect Dino",
    CurrentValue = false,
    Flag = "AutoCollectDino",
    Callback = function(Value)
        State.AutoCollectDino = Value
    end,
})

task.spawn(function()
    while task.wait(1) do
        if State.AutoCollectDino then
            pcall(function()
                local remote = ReplicatedStorage:WaitForChild("Remote"):WaitForChild("DinoEventRE")
                local args = {{event = "onlinepack"}}
                remote:FireServer(unpack(args))
            end)
        end
    end
end)

-- ===== CODES TAB =====
TabCodes:CreateSection("Redeem Codes")

TabCodes:CreateButton({
    Name = "Redeem All Codes",
    Callback = function()
        for _, code in ipairs(CodeList) do
            pcall(function()
                local args = {{event = "usecode", code = code}}
                ReplicatedStorage.Remote.RedemptionCodeRE:FireServer(unpack(args))
            end)
            task.wait(0.5)
        end
        Rayfield:Notify({
            Title = "Success",
            Content = "All codes redeemed!",
            Duration = 3,
            Image = 4483362458
        })
    end,
})

Rayfield:LoadConfiguration()

print("Fixz Hub | Build A Zoo loaded successfully!")