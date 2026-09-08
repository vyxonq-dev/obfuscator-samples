Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = ReplicatedStorage:WaitForChild("Packages"):WaitForChild("_Index")
:WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit")

local BaitService = Knit.Services:WaitForChild("BaitService")
local PurchaseBait = BaitService.RF:WaitForChild("PurchaseBait")

local SuppliesService = Knit.Services:WaitForChild("SuppliesService")
local PurchaseItem = SuppliesService.RF:WaitForChild("PurchaseItem")

local MoneyService = Knit.Services:WaitForChild("MoneyCollectionService")
local CollectMoney = MoneyService.RF:WaitForChild("CollectMoney")

local ConsumableService = Knit.Services:WaitForChild("ConsumableService")
local UseItem = ConsumableService.RE:WaitForChild("UseItem")

local player = game.Players.LocalPlayer

local baits = {
    {guiName = "Worm", remoteName = "Worm"},
    {guiName = "Shrimp", remoteName = "Shrimp"},
    {guiName = "Eel", remoteName = "Eel"},
    {guiName = "Kiwi", remoteName = "Kiwi"},
    {guiName = "Banana", remoteName = "Banana"},
    {guiName = "Coffee Beans", remoteName = "CoffeeBeans"},
    {guiName = "Crab", remoteName = "Crab"},
    {guiName = "Squid", remoteName = "Squid"},
    {guiName = "Grape", remoteName = "Grape"},
    {guiName = "Orange", remoteName = "Orange"},
    {guiName = "Tophat", remoteName = "Tophat"},
    {guiName = "Watermelon", remoteName = "Watermelon"},
    {guiName = "Dragonfruit", remoteName = "Dragonfruit"},
    {guiName = "Golden Banana", remoteName = "GoldenBanana"}
}

local items = {
    {guiName = "Rusty Weight Charm", remoteName = "RustyWeightCharm"},
    {guiName = "Rusty Mutation Charm", remoteName = "RustyMutationCharm"},
    {guiName = "Mutation Charm", remoteName = "MutationCharm"},
    {guiName = "Weight Charm", remoteName = "WeightCharm"},
    {guiName = "Mutation Stabilizer", remoteName = "MutationStabilizer"},
    {guiName = "Evolution Crystal", remoteName = "EvolveCrystal"},
    {guiName = "Overfeed Charm", remoteName = "OverfeedCharm"},
    {guiName = "Keeper's Seal", remoteName = "KeepersSeal"}
}

local autoBuyBaits = {}
local autoBuyItems = {}
local fastFishingEnabled = false
local autoCollectMoney = false
local collectInterval = 1
local autoUseItems = {}

local Window = Rayfield:CreateWindow({
    Name = "nightcity's hub",
    LoadingTitle = "FISH A BRAINROT ",
    LoadingSubtitle = "by nightcityyy",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "FabScript",
        FileName = "Config"
    }
})

local ShopTab = Window:CreateTab("Shop", "shopping-cart")
local BaitsSection = ShopTab:CreateSection("Auto Buy Baits")
local BaitsDropdown = ShopTab:CreateDropdown({
    Name = "Select Baits",
    Options = {},
    MultipleOptions = true,
    CurrentOption = {},
    Callback = function(selected)
        autoBuyBaits = {}
        for _, bait in ipairs(baits) do
            autoBuyBaits[bait.remoteName] = table.find(selected, bait.guiName) ~= nil
        end
    end
})
for _, bait in ipairs(baits) do
    table.insert(BaitsDropdown.Options, bait.guiName)
end
BaitsDropdown:Refresh(BaitsDropdown.Options, true)

local ItemsSection = ShopTab:CreateSection("Auto Buy Items")
local ItemsDropdown = ShopTab:CreateDropdown({
    Name = "Select Items",
    Options = {},
    MultipleOptions = true,
    CurrentOption = {},
    Callback = function(selected)
        autoBuyItems = {}
        for _, item in ipairs(items) do
            autoBuyItems[item.remoteName] = table.find(selected, item.guiName) ~= nil
        end
    end
})
for _, item in ipairs(items) do
    table.insert(ItemsDropdown.Options, item.guiName)
end
ItemsDropdown:Refresh(ItemsDropdown.Options, true)

local FishingTab = Window:CreateTab("Fishing", "fish")
local FishingSection = FishingTab:CreateSection("Fishing")
FishingTab:CreateToggle({
    Name = "Fast Fishing",
    CurrentValue = false,
    Callback = function(value)
        fastFishingEnabled = value
    end
})

local AutoUseSection = FishingTab:CreateSection("Auto Use Items")
local AutoUseDropdown = FishingTab:CreateDropdown({
    Name = "Select Items to use (2 max)",
    Options = {"Rusty Weight Charm", "Rusty Mutation Charm", "Mutation Charm", "Weight Charm"},
    MultipleOptions = true,
    CurrentOption = {},
    Callback = function(selected)
        autoUseItems = {}
        for _, item in ipairs(items) do
            if table.find(selected, item.guiName) then
                autoUseItems[item.remoteName] = true
            end
        end
        if #selected > 2 then
            table.remove(selected, 3)
            AutoUseDropdown:Set(selected)
        end
    end
})

local MiscTab = Window:CreateTab("Misc", "settings")
local MiscSection = MiscTab:CreateSection("Miscellaneous")
MiscTab:CreateSlider({
    Name = "WalkSpeed",
    Range = {16, 100},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Flag = "WalkSpeedSlider",
    Callback = function(value)
        if player and player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = value
        end
    end
})

local CollectTab = Window:CreateTab("Collect", "currency")
local CollectSection = CollectTab:CreateSection("Collect Money")
CollectTab:CreateToggle({
    Name = "Auto Collect Money",
    CurrentValue = false,
    Callback = function(value)
        autoCollectMoney = value
    end
})
CollectTab:CreateSlider({
    Name = "Collect Interval (sec)",
    Range = {1, 60},
    Increment = 1,
    Suffix = "sec",
    CurrentValue = 1,
    Flag = "CollectIntervalSlider",
    Callback = function(value)
        collectInterval = value
    end
})

local StealTab = Window:CreateTab("Stealing", "dollar-sign")
local StealSection = StealTab:CreateSection("Stealing Options")
StealTab:CreateToggle({
    Name = "Steal from anywhere",
    CurrentValue = false,
    Callback = function(value)
        local function applySteal(prompt)
            if prompt:IsA("ProximityPrompt") and prompt.ActionText == "Steal" then
                prompt.MaxActivationDistance = value and 500
                prompt.RequiresLineOfSight = not value
            end
        end

        for _, prompt in ipairs(game:GetDescendants()) do
            applySteal(prompt)
        end

        game:GetService("RunService").DescendantAdded:Connect(function(desc)
            applySteal(desc)
        end)
    end
})

task.spawn(function()
    while task.wait(0.1) do
        for _, bait in ipairs(baits) do
            if autoBuyBaits[bait.remoteName] then
                task.spawn(function()
                    pcall(function()
                        PurchaseBait:InvokeServer(bait.remoteName)
                    end)
                end)
            end
        end
        for _, item in ipairs(items) do
            if autoBuyItems[item.remoteName] then
                task.spawn(function()
                    pcall(function()
                        PurchaseItem:InvokeServer(item.remoteName)
                    end)
                end)
            end
        end
    end
end)

task.spawn(function()
    while task.wait(1) do
        for remoteName, enabled in pairs(autoUseItems) do
            if enabled then
                local args = {remoteName}
                pcall(function()
                    UseItem:FireServer(unpack(args))
                end)
            end
        end
    end
end)

task.spawn(function()
    local timer = 0
    while true do
        task.wait(0.1)
        if autoCollectMoney then
            timer = timer + 0.1
            if timer >= collectInterval then
                for i = 1, 11 do
                    pcall(function()
                        CollectMoney:InvokeServer("PlaceableArea_"..i)
                    end)
                end
                timer = 0
            end
        else
            timer = 0
        end
    end
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if fastFishingEnabled then
        local gui = player:FindFirstChild("PlayerGui")
        if gui then
            local fishingGui = gui:FindFirstChild("Fishing")
            if fishingGui then
                local container = fishingGui:FindFirstChild("Container")
                if container then
                    local reelFrame = container:FindFirstChild("ReelFrame")
                    if reelFrame then
                        local reelBar = reelFrame:FindFirstChild("ReelBar")
                        local target = reelFrame:FindFirstChild("Target")
                        if reelBar and target then
                            reelBar.Position = target.Position
                            reelBar.AnchorPoint = target.AnchorPoint
                        end
                    end
                end
            end
        end
    end
end)
