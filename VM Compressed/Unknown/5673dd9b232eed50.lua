local Library = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- ПЕРЕМЕННЫЕ
local _autoFarmActive = false
local _autoSellActive = false
local farmMode = "base15"
local itemsToSell = {} 
local discoveredItems = {}
local storedBossParts = {}
local safeMutations = {
    ["Void"] = false,
    ["Gold"] = false,
    ["Diamond"] = false,
    ["Candy"] = false
}

local player = game.Players.LocalPlayer
local Rep = game:GetService("ReplicatedStorage")
local bossFolder = workspace:FindFirstChild("BossTouchDetectors")
local targetPath = workspace:WaitForChild("Plots"):WaitForChild("3"):WaitForChild("3"):WaitForChild("PlotSurface"):WaitForChild("Part")

-- ПУТИ К REMOTE
local KnitServices = Rep.Packages._Index["sleitnick_knit@1.7.0"].knit.Services
local OpenLuckyBlockRF = KnitServices.RunningService.RF.OpenLuckyBlock
local SellRF = KnitServices.InventoryService.RF.SellBrainrot

-- ФУНКЦИЯ ОЧИСТКИ ДЕТЕКТОРОВ
local function setBossDetectors(state)
    if not bossFolder then return end
    if state then
        for _, obj in ipairs(bossFolder:GetChildren()) do
            table.insert(storedBossParts, obj)
            obj.Parent = nil
        end
    else
        for _, obj in ipairs(storedBossParts) do
            if obj then pcall(function() obj.Parent = bossFolder end) end
        end
        table.clear(storedBossParts)
    end
end

-- СОЗДАНИЕ ОКНА
local Window = Library:CreateWindow({
    Title = "lunexHUB",
    SubTitle = "v2.2 Stable",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false, 
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.RightShift
})

-- ВКЛАДКА AUTO FARM
local FarmTab = Window:AddTab({ Title = "Auto Farm", Icon = "zap" })
local FarmSection = FarmTab:AddSection("Main Farm")

FarmSection:AddDropdown("BaseDropdown", {
    Title = "Select Target Base",
    Values = { "base15", "base16", "base17", "base18" },
    Default = "base15",
    Callback = function(Value)
        farmMode = Value
    end
})

FarmSection:AddToggle("AutoFarmToggle", {
    Title = "Start Auto Farm",
    Description = "Fast opening + Boss Detector Removal",
    Default = false,
    Callback = function(Value)
        _autoFarmActive = Value
        setBossDetectors(Value)
    end
})

-- ОБНОВЛЕННОЕ ОПИСАНИЕ НА АНГЛИЙСКОМ
FarmTab:AddParagraph({
    Title = "Base Info",
    Content = "Base 15: Old Base\nBases 16-18: New Bases\n\n*Anti-Boss system is active during farming."
})

-- ВКЛАДКА AUTO SELL
local SellTab = Window:AddTab({ Title = "Auto Sell", Icon = "shopping-cart" })
local MutSection = SellTab:AddSection("Mutation Protection")

for mut, _ in pairs(safeMutations) do
    MutSection:AddToggle("Safe" .. mut, {
        Title = "Safe " .. mut,
        Default = false,
        Callback = function(Value) safeMutations[mut] = Value end
    })
end

local SellSettings = SellTab:AddSection("Sell Settings")
SellSettings:AddToggle("AutoSellToggle", {
    Title = "Enable Auto Sell",
    Default = false,
    Callback = function(Value) _autoSellActive = Value end
})

local ItemsSection = SellTab:AddSection("Select Items to Sell")

-- ЛОГИКА ОЧИСТКИ ИМЕН
local function cleanItemName(fullName)
    local n = fullName:lower()
    return n:gsub("candy_", ""):gsub("gold_", ""):gsub("diamond_", ""):gsub("void_", ""):gsub("normal_", "")
end

local function isMutationSafe(item)
    local mutAttr = tostring(item:GetAttribute("BrainrotMutation") or item:GetAttribute("Mutation") or ""):lower()
    for mName, active in pairs(safeMutations) do
        if active and (mutAttr:find(mName:lower()) or item.Name:lower():find(mName:lower())) then 
            return true 
        end
    end
    return false
end

-- ЦИКЛ БЫСТРОГО СБОРА
task.spawn(function()
    while true do
        task.wait(0.05)
        if _autoFarmActive then
            task.spawn(function()
                pcall(function()
                    OpenLuckyBlockRF:InvokeServer(farmMode)
                end)
            end)

            pcall(function()
                if player.Character and targetPath then
                    player.Character:PivotTo(targetPath.CFrame + Vector3.new(0, 12, 0))
                end
            end)
        end
    end
end)

-- ЦИКЛ ПРОДАЖИ
task.spawn(function()
    while true do
        task.wait(0.5)
        if _autoSellActive then
            local bp = player:FindFirstChild("Backpack")
            if bp then
                for _, item in pairs(bp:GetChildren()) do
                    local cl = cleanItemName(item.Name)
                    if itemsToSell[cl] and not isMutationSafe(item) then
                        local eid = item:GetAttribute("EntityId")
                        if eid then pcall(function() SellRF:InvokeServer(eid) end) end
                    end
                end
            end
        end
    end
end)

-- СКАНЕР ПРЕДМЕТОВ
task.spawn(function()
    while true do
        local bp = player:FindFirstChild("Backpack")
        if bp then
            for _, item in pairs(bp:GetChildren()) do
                local cl = cleanItemName(item.Name)
                if not item.Name:lower():find("lucky") and not discoveredItems[cl] and cl ~= "" then
                    discoveredItems[cl] = true
                    itemsToSell[cl] = false

                    ItemsSection:AddToggle("Sell" .. cl, {
                        Title = "Sell: " .. cl,
                        Default = false,
                        Callback = function(Value) itemsToSell[cl] = Value end
                    })
                end
            end
        end
        task.wait(3)
    end
end)

Library:Notify({
    Title = "lunexHUB",
    Content = "English descriptions loaded.",
    Duration = 5
})