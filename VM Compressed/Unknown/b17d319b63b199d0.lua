local Library = loadstring(game:HttpGet("https://github.com/N4RWH4L/Scripts/raw/main/Uwuware.lua", true))()

local Main = Library:CreateWindow("Elite Core winning!")

local ConstantsModule = require(game:GetService("ReplicatedStorage").Constants)
local Rarities = ConstantsModule.RarityString

local PetFrame = game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.Main.Pets
local PetContainer = PetFrame.PetsContainer.ScrollingFrame
local EquippedContainer = PetFrame.EquipFrame.Grid

local function indexOf(value, list)
    for i, v in pairs(list) do
        if v == value then
            return i
        end
    end
end

local function getSlotCount()
    local count = 0

    for _, v in pairs(EquippedContainer:GetChildren()) do
        if v.Name == "PetFrame" or v.Name == "EmptySlot" then
            count = count + 1
        end
    end

    return count
end

-- Ignore this
local function getBestPetCombo()
    local values = {}

    for _, pet in pairs(PetContainer:GetChildren()) do
        if pet.Name == "PetFrame" and pet:FindFirstChild("RarityLabel") then
            table.insert(values, indexOf(pet.RarityLabel.Text, Rarities))
        end
    end

    table.sort(values)

    local value = 0

    for i = #values - (getSlotCount() - 1), #values do
        if values[i] then
            value = value + values[i]
        end
    end

    return value
end

local function getCurrentPetCombo()
    local value = 0

    for _, v in pairs(EquippedContainer:GetChildren()) do
        if v.Name == "PetFrame" and v:FindFirstChild("RarityLabel") then
            value = value + indexOf(v.RarityLabel.Text, Rarities)
        end
    end

    return value
end

Main:AddToggle(
    {
        text = "Auto Collect Drops",
        flag = "CollectDrops"
    }
)
task.spawn(
    function()
        while task.wait(1) do
            if Library.flags.CollectDrops then
                for _, v in pairs(game:GetService("Players").LocalPlayer.PlayerScripts:GetChildren()) do
                    if v:IsA("LocalScript") and v.Name == "Drop" and v:FindFirstChild("ID") then
                        game:GetService("ReplicatedStorage").Remotes.Drop:FireServer(v.ID.Value)
                    end
                end
            end
        end
    end
)

Main:AddList(
    {
        text = "Egg Rarity",
        flag = "EggRarity",
        values = Rarities
    }
)

Main:AddToggle(
    {
        text = "Auto Hatch Egg",
        flag = "AutoHatchEgg"
    }
)
task.spawn(
    function()
        while task.wait(1) do
            if Library.flags.AutoHatchEgg then
                game:GetService("ReplicatedStorage").Remotes.BuyEgg:FireServer(
                    indexOf(Library.flags.EggRarity, Rarities)
                )
            end
        end
    end
)

Main:AddToggle(
    {
        text = "Auto Claim Quest",
        flag = "AutoClaimQuest"
    }
)
task.spawn(
    function()
        while task.wait(1) do
            if Library.flags.AutoClaimQuest then
                game:GetService("ReplicatedStorage").Remotes.ClaimQuestReward:FireServer()
            end
        end
    end
)

Main:AddToggle(
    {
        text = "Auto Equip Best Pets",
        flag = "EquipBestPets"
    }
)
task.spawn(
    function()
        while task.wait(1) do
            print("Current" .. getCurrentPetCombo())
            print("Best" .. getBestPetCombo())
            if Library.flags.EquipBestPets and getCurrentPetCombo() < getBestPetCombo() then
                game:GetService("ReplicatedStorage").Remotes.EquipBest:FireServer()
            end
        end
    end
)

do
    local Other = Main:AddFolder("Other")

    Other:AddBind(
        {
            text = "Toggle GUI",
            key = Enum.KeyCode.BackSlash,
            callback = function()
                Library:Close()
            end
        }
    )

    Other:AddButton(
        {
            text = "Destroy GUI",
            callback = function()
                for _, v in pairs(game:GetService("CoreGui"):GetChildren()) do
                    if v:FindFirstChild("Hello, how are you today?") then
                        v:Destroy()
                    end
                end
            end
        }
    )
end

do
    local Credits = Main:AddFolder("Credits")

    Credits:AddLabel(
        {
            text = "Made by Elite one#4878"
        }
    )

    Credits:AddLabel(
        {
            text = "Thanks for using elite core ;)"
        }
    )
end

Library:Init()