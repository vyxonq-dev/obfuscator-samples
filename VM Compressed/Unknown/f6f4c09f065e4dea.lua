local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Gem Simulator", HidePremium = false, SaveConfig = true, ConfigFolder = "MyConfig"})

-- Tabs
local DiamondsTab = Window:MakeTab({Name = "Diamonds", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local CashTab = Window:MakeTab({Name = "Cash", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local SpinsTab = Window:MakeTab({Name = "Spins", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local PotionsTab = Window:MakeTab({Name = "Potions", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local PetsTab = Window:MakeTab({Name = "Pets", Icon = "rbxassetid://4483345998", PremiumOnly = false})

-- Functions
local function addDiamonds(amount)
    local args = {[1] = 10013, [2] = amount, [3] = true}
    game:GetService("ReplicatedStorage"):WaitForChild("Ecent"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
end

local function addCash(amount)
    local args = {[1] = 10007, [2] = amount, [3] = false}
    game:GetService("ReplicatedStorage"):WaitForChild("Ecent"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
end

local function addSpins(amount)
    local args = {[1] = 10023, [2] = amount}
    game:GetService("ReplicatedStorage"):WaitForChild("Ecent"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
end

local function usePotion(potionId, amount)
    for i = 1, amount do
        local args = {[1] = 10046, [2] = potionId}
        game:GetService("ReplicatedStorage"):WaitForChild("Ecent"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
    end
end

local function givePet(objId, propId, amount)
    for i = 1, amount do
        local args = {
            [1] = 10008,
            [2] = "pet",
            [3] = {
                [1] = {
                    ["objId"] = objId,
                    ["propId"] = propId
                }
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Ecent"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
    end
end

-- UI Elements
DiamondsTab:AddTextbox({
    Name = "Diamonds Amount",
    Default = "",
    TextDisappear = true,
    Callback = function(value)
        addDiamonds(tonumber(value))
    end
})

CashTab:AddTextbox({
    Name = "Cash Amount",
    Default = "",
    TextDisappear = true,
    Callback = function(value)
        addCash(tonumber(value))
    end
})

SpinsTab:AddTextbox({
    Name = "Spins Amount",
    Default = "",
    TextDisappear = true,
    Callback = function(value)
        addSpins(tonumber(value))
    end
})

PotionsTab:AddTextbox({
    Name = "Auto Rebirth Potions Amount",
    Default = "",
    TextDisappear = true,
    Callback = function(value)
        usePotion("1689013022", tonumber(value))
    end
})

PotionsTab:AddTextbox({
    Name = "2x Diamonds Potions Amount",
    Default = "",
    TextDisappear = true,
    Callback = function(value)
        usePotion("1674122231", tonumber(value))
    end
})

PotionsTab:AddTextbox({
    Name = "2x Luck Potions Amount",
    Default = "",
    TextDisappear = true,
    Callback = function(value)
        usePotion("1674122118", tonumber(value))
    end
})

PotionsTab:AddTextbox({
    Name = "x5 Acceleration Potions Amount",
    Default = "",
    TextDisappear = true,
    Callback = function(value)
        usePotion("1674122304", tonumber(value))
    end
})

PotionsTab:AddTextbox({
    Name = "2x Money Potions Amount",
    Default = "",
    TextDisappear = true,
    Callback = function(value)
        usePotion("1674121973", tonumber(value))
    end
})

PotionsTab:AddTextbox({
    Name = "Magnet Potions Amount",
    Default = "",
    TextDisappear = true,
    Callback = function(value)
        usePotion("1674122402", tonumber(value))
    end
})

PetsTab:AddTextbox({
    Name = "Unicorn Pet(please rejoin after giving pets to work)",
    Default = "1",
    TextDisappear = true,
    Callback = function(value)
        givePet(46, "a1028", tonumber(value))
    end
})

-- Infinite Yield
local InfiniteYieldTab = Window:MakeTab({Name = "Infinite Yield", Icon = "rbxassetid://4483345998", PremiumOnly = false})
InfiniteYieldTab:AddButton({
    Name = "Load Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end
})

OrionLib:Init()
