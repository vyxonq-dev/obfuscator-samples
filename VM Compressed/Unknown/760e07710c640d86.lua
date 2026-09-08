local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "NeverTestTheSigma's Experience Hub",
    SubTitle = "Optimized Farm & Dynamic Rebirths",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinSize = Vector2.new(470, 380)
})

local Tabs = {
    Main = Window:AddTab({ Title = "Farming & Shop", Icon = "shopping-cart" }),
    Rebirth = Window:AddTab({ Title = "Rebirths", Icon = "refresh" })
}

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local ShopNetwork = ReplicatedStorage.Modules.Systems.Shop.Services.ShopNetwork
local RebirthNetwork = ReplicatedStorage.Modules.Systems.Rebirth.Services.RebirthNetwork

-------------------------------------------------------------------------
-- ANTI-LAG (EVENT DRIVEN VFX DESTROYER)
-------------------------------------------------------------------------
local AntiLag = false
local antiLagConnection

local function nukeVFX(obj)
    if not AntiLag then return end
    pcall(function()
        if obj:IsA("ParticleEmitter") or obj:IsA("Beam") or obj:IsA("Trail") then
            obj:Destroy()
        elseif obj:IsA("BillboardGui") then
            task.spawn(function()
                task.wait()
                local t = obj:FindFirstChildWhichIsA("TextLabel", true)
                if t and string.find(t.Text, "%$") then
                    obj:Destroy()
                end
            end)
        end
    end)
end

Tabs.Main:AddToggle("AntiLagToggle", {
    Title = "Remove Money VFX (Boost FPS)", 
    Default = false
}):OnChanged(function(Value)
    AntiLag = Value
    if AntiLag then
        local tempVFX = workspace.Terrain:FindFirstChild("TempVFX")
        if tempVFX then tempVFX:ClearAllChildren() end

        for _, obj in ipairs(workspace:GetDescendants()) do
            nukeVFX(obj)
        end
        
        antiLagConnection = workspace.DescendantAdded:Connect(nukeVFX)
    else
        if antiLagConnection then antiLagConnection:Disconnect() end
    end
end)

-------------------------------------------------------------------------
-- CONTINUOUS AUTO COLLECT (DYNAMIC LOOP SWEEP)
-------------------------------------------------------------------------
local CollectDelay = 10

Tabs.Main:AddSlider("CollectDelaySlider", {
    Title = "Auto Collect Delay (Seconds)",
    Description = "Adjust how often it sweeps for drops. Higher = Less Lag.",
    Default = 10,
    Min = 1,
    Max = 60,
    Rounding = 1,
    Callback = function(Value)
        CollectDelay = Value
    end
})

local AutoCollect = false
Tabs.Main:AddToggle("AutoCollectToggle", {
    Title = "Universal Auto Collect", 
    Description = "Scans for drops based on the delay slider above.",
    Default = false
}):OnChanged(function(Value)
    AutoCollect = Value
    task.spawn(function()
        while AutoCollect do
            local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                for _, obj in ipairs(workspace:GetDescendants()) do
                    if obj.ClassName == "TouchTransmitter" then
                        local hitPart = obj.Parent
                        if hitPart and hitPart:IsA("BasePart") and not hitPart:IsDescendantOf(LocalPlayer.Character) then
                            firetouchinterest(hrp, hitPart, 0)
                            firetouchinterest(hrp, hitPart, 1)
                        end
                    end
                end
            end
            task.wait(CollectDelay) -- Waits for the exact time set on the slider
        end
    end)
end)

-------------------------------------------------------------------------
-- CHARACTER SHOP
-------------------------------------------------------------------------
local orderedCharacters = {
    "Noob",             -- $25
    "Business Bacon",   -- $75
    "Influencer",       -- $450
    "Tix Man",          -- $3.5K
    "Tix Investor",     -- $25K
    "Hacker",           -- $150K
    "Millionaire",      -- $2.5M
    "Crypto Bro",       -- $17.5M
    "DJ",               -- $250M
    "Mr. Frost",        -- $3.5B
    "Mr. Pyro",         -- $50B
    "Rapper",           -- $500B
    "Royal King",       -- $5T
    "Dark King",        -- $125T
    "Artist",           -- $150T
    "Billionaire",      -- $400T
    "President",        -- $2Qa
    "Chef",             -- $10Qa
    "Lemonade Stand",   -- $75Qa
    "Ninja",            -- $400Qa
    "Grandma",          -- $1.75Qi
    "Knight",           -- $10Qi
    "Samurai",          -- $75Qi
    "Zombie",           -- Robux (R$249)
    "Skeleton",         -- Robux (R$799)
    "Monkey"            -- Robux (R$2499)
}

local selectedCharacters = {}

local CharDropdown = Tabs.Main:AddDropdown("CharDropdown", {
    Title = "Select Characters to Buy",
    Values = orderedCharacters,
    Multi = true,
    Default = {},
})

CharDropdown:OnChanged(function(Value)
    selectedCharacters = {}
    for charName, isSelected in pairs(Value) do
        if isSelected then
            table.insert(selectedCharacters, charName)
        end
    end
end)

local BuyRepeat = false
Tabs.Main:AddToggle("BuyRepeatToggle", {Title = "Buy Selected on Repeat", Default = false}):OnChanged(function(Value)
    BuyRepeat = Value
    task.spawn(function()
        while BuyRepeat do
            for _, charName in ipairs(selectedCharacters) do
                task.spawn(function()
                    pcall(function() 
                        ShopNetwork._buyNPC:InvokeServer(charName, 1) 
                    end)
                end)
            end
            task.wait(0.5)
        end
    end)
end)

Tabs.Main:AddButton({
    Title = "Buy Selected Once",
    Callback = function()
        for _, charName in ipairs(selectedCharacters) do
            task.spawn(function()
                pcall(function() 
                    ShopNetwork._buyNPC:InvokeServer(charName, 1) 
                end)
            end)
        end
    end
})

-------------------------------------------------------------------------
-- DYNAMIC AUTO REBIRTH
-------------------------------------------------------------------------
local fetchedRebirths = {"1: +1 Rebirth Points", "2: +3 Rebirth Points", "3: +5 Rebirth Points"}
local selectedRebirthIndex = 1

local RebirthDropdown = Tabs.Rebirth:AddDropdown("RebirthDropdown", {
    Title = "Select Rebirth Button",
    Values = fetchedRebirths,
    Multi = false,
    Default = 1,
})

RebirthDropdown:OnChanged(function(Value)
    local idx = string.match(Value, "^(%d+):")
    if idx then
        selectedRebirthIndex = tonumber(idx)
    end
end)

Tabs.Rebirth:AddButton({
    Title = "Refresh Rebirth Options",
    Description = "Open the Rebirth menu in-game first, then click this.",
    Callback = function()
        local newOptions = {}
        pcall(function()
            local rebirthScroll = LocalPlayer.PlayerGui.Frames.RebirthFrame.Scroll.ScrollingFrame
            for i = 1, 31 do
                local opt = rebirthScroll:FindFirstChild("RebirthOption_" .. i)
                if opt and opt:FindFirstChild("RebirthsToGive") then
                    table.insert(newOptions, i .. ": " .. opt.RebirthsToGive.Text)
                end
            end
        end)
        if #newOptions > 0 then
            RebirthDropdown:SetValues(newOptions)
            Fluent:Notify({Title = "Success", Content = "Loaded " .. #newOptions .. " rebirth options!", Duration = 3})
        else
            Fluent:Notify({Title = "Error", Content = "Make sure your Rebirth menu is open first!", Duration = 3})
        end
    end
})

local function parseCash(textStr)
    local raw = string.gsub(textStr, "[%$,]", "")
    local num, suffix = string.match(raw, "([%d%.]+)%s*([A-Za-z]*)")
    num = tonumber(num) or 0
    suffix = string.lower(suffix or "")
    local multipliers = {k = 1e3, m = 1e6, b = 1e9, t = 1e12, q = 1e15, qa = 1e15, qi = 1e18, sx = 1e21}
    if multipliers[suffix] then return num * multipliers[suffix] end
    return num
end

local AutoRebirth = false
Tabs.Rebirth:AddToggle("AutoRebirthToggle", {Title = "Auto Rebirth", Default = false}):OnChanged(function(Value)
    AutoRebirth = Value
    task.spawn(function()
        while AutoRebirth do
            pcall(function()
                local cashLabel = LocalPlayer.PlayerGui.HUD.Cash.TextLabel
                local currentCash = parseCash(cashLabel.Text)
                
                local rebirthScroll = LocalPlayer.PlayerGui.Frames.RebirthFrame.Scroll.ScrollingFrame
                local rebirthOption = rebirthScroll:FindFirstChild("RebirthOption_" .. selectedRebirthIndex)
                
                if rebirthOption and rebirthOption:FindFirstChild("Cost") then
                    local costText = string.gsub(rebirthOption.Cost.Text, "Cost: ", "")
                    local reqCash = parseCash(costText)
                    if currentCash >= reqCash then
                        RebirthNetwork._doRebirth:InvokeServer(selectedRebirthIndex)
                    end
                else
                    RebirthNetwork._doRebirth:InvokeServer(selectedRebirthIndex)
                end
            end)
            task.wait(1)
        end
    end)
end)

Window:SelectTab(1)