local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Game Tools",
    SubTitle = "Fluent " .. Fluent.Version,
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Main = Window:AddTab({Title = "Main", Icon = "activity"}),
    Crafting = Window:AddTab({Title = "Crafting", Icon = "hammer"}),
    Teleport = Window:AddTab({Title = "Teleport", Icon = "map-pin"}),
    Settings = Window:AddTab({Title = "Settings", Icon = "settings"})
}

local MainSection = Tabs.Main:AddSection("Main Features")

local TrainDropdown = Tabs.Main:AddDropdown("TrainSelect", {
    Title = "Training Type",
    Values = {"1", "2", "3", "4"},
    Default = 1,
})

local AutoTrainToggle = Tabs.Main:AddToggle("AutoTrain", {
    Title = "Auto Train",
    Default = false,
    Callback = function(Value)
        if Value then
            AutoTrainConnection = game:GetService('RunService').Heartbeat:Connect(function()
                game:GetService("ReplicatedStorage").Event.Train:FireServer(tonumber(Fluent.Options.TrainSelect.Value))
            end)
        else
            if AutoTrainConnection then AutoTrainConnection:Disconnect() end
        end
    end
})

Tabs.Main:AddToggle("InfiniteMoney", {
    Title = "Infinite Money",
    Default = false,
    Callback = function(Value)
        if Value then
            InfiniteMoneyLoop = true
            task.spawn(function()
                while InfiniteMoneyLoop do
                    game:GetService("ReplicatedStorage").Event.SellWeapon:FireServer(9e9, 1)
                    task.wait(0.2)
                end
            end)
        else
            InfiniteMoneyLoop = false
        end
    end
})

local EnchantSection = Tabs.Main:AddSection("Enchanting")

Tabs.Main:AddToggle("AutoEnchant", {
    Title = "Auto Enchant",
    Default = false,
    Callback = function(Value)
        if Value then
            AutoEnchantConnection = game:GetService("RunService").Heartbeat:Connect(function()
                game:GetService("ReplicatedStorage").Event.Enchanted:FireServer(math.huge, math.random())
            end)
        else
            if AutoEnchantConnection then AutoEnchantConnection:Disconnect() end
        end
    end
})

Tabs.Main:AddToggle("SuperEnchantAbuse", {
    Title = "Super Enchant Abuse",
    Default = false,
    Callback = function(Value)
        if Value then
            EnchantAbuseConnection = game:GetService("RunService").Heartbeat:Connect(function()
                for i = 1, 5 do
                    game:GetService("ReplicatedStorage").Event.Enchanted:FireServer(math.huge, math.random())
                end
            end)
        else
            if EnchantAbuseConnection then EnchantAbuseConnection:Disconnect() end
        end
    end
})

local CraftSection = Tabs.Crafting:AddSection("Crafting")

local displayPowers = {}
for _, power in pairs(workspace.DisplayPowers:GetChildren()) do
    table.insert(displayPowers, power.Name)
end

local CraftDropdown = Tabs.Crafting:AddDropdown("CraftSelect", {
    Title = "Item to Craft",
    Values = displayPowers,
    Default = 1,
})

local AutoCraftToggle = Tabs.Crafting:AddToggle("UltraAutoCraft", {
    Title = "Ultra Auto Craft",
    Default = false,
    Callback = function(Value)
        if Value then
            AutoCraftConnection = game:GetService('RunService').Heartbeat:Connect(function()
                for i = 1, 3 do
                    game:GetService("ReplicatedStorage").Event.CraftWeapon:FireServer(Fluent.Options.CraftSelect.Value, math.huge)
                end
            end)
        else
            if AutoCraftConnection then AutoCraftConnection:Disconnect() end
        end
    end
})

local WorldList = {}
for _, v in pairs(workspace.World:GetChildren()) do
    if v:IsA("Part") then
        table.insert(WorldList, v.Name)
    end
end

Tabs.Teleport:AddDropdown("WorldSelect", {
    Title = "Select World",
    Values = WorldList,
    Default = WorldList[1] and 1 or nil
})

Tabs.Teleport:AddButton({
    Title = "Teleport",
    Callback = function()
        local selected = Fluent.Options.WorldSelect.Value
        local part = workspace.World:FindFirstChild(selected)
        if part and game.Players.LocalPlayer.Character then
            local hrp = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.CFrame = part.CFrame + Vector3.new(0, 5, 0)
            end
        end
    end
})

local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

Window:SelectTab(4)

Fluent:Notify({
    Title = "Game Tools",
    Content = "Loaded successfully",
    Duration = 5
})