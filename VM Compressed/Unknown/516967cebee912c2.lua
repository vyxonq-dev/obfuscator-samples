local replicatedStorage = game:GetService("ReplicatedStorage")

local Madzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jfdedit3/Mada-ui/refs/heads/main/Madzhubui"))()
local Window = Madzlib:MakeWindow({
    Title = "Mada Hub 3.9 jims rng",
    SubTitle = "by Mada",
    SaveFolder = "UniversalScriptConfig"
})
Window:AddMinimizeButton({
    Button = {
        Image = "rbxassetid://77855434347030",
        BackgroundTransparency = 0
    },
    Corner = {
        CornerRadius = UDim.new(0, 8)
    }
})

-- Aura Tab
local AuraTab = Window:MakeTab({"Auras", "sparkles"})
AuraTab:AddSection({"Aura Manager"})

local function getAllAuraNames()
    local aurasFolder = replicatedStorage:WaitForChild("Auras")
    local auraNamesList = {}
    for _, aura in pairs(aurasFolder:GetChildren()) do
        table.insert(auraNamesList, aura.Name)
    end
    return auraNamesList
end

local function equipAura(auraName)
    local args = {[1] = replicatedStorage:WaitForChild("Auras"):WaitForChild(auraName)}
    replicatedStorage:WaitForChild("Remotes"):WaitForChild("AuraEquip"):FireServer(unpack(args))
end

local auraList = getAllAuraNames()
AuraTab:AddDropdown({
    Name = "Select Aura",
    Options = auraList,
    Callback = function(selected)
        if selected and selected ~= "" then
            equipAura(selected)
        end
    end
})

-- Coins Tab
local CoinsTab = Window:MakeTab({"Coins", "dollar-sign"})
CoinsTab:AddSection({"Coin Manager"})

local function addCoins(amount)
    replicatedStorage:WaitForChild("Remotes"):WaitForChild("AddCash"):FireServer(amount)
end

CoinsTab:AddTextBox({
    Name = "Add Coins",
    Description = "Enter the amount of coins to add",
    PlaceholderText = "Amount",
    Callback = function(val)
        local num = tonumber(val)
        if num then
            addCoins(num)
        end
    end
})