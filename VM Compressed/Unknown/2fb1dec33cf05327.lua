--[[
    ╔═══════════════════════════════════════╗
    ║      Fixz Hub | Go Fish 🐟           ║
    ║         Compact Version               ║
    ╚═══════════════════════════════════════╝
]]

repeat task.wait() until game:IsLoaded()

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualInputManager = game:GetService("VirtualInputManager")
local LocalPlayer = Players.LocalPlayer

-- Load Wind UI
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

-- Variables
local autoCast = false
local autoCatch = false
local autoTarget = false
local autoSell = false
local autoZone = false
local castMode = "bypass"
local sellAmount = 50
local freezeChar = false
local selectedZone = CFrame.new(942.536377, 127.545708, 254.444763)

-- Zones
local zones = {
    ["Default Isle"] = CFrame.new(942.536377, 127.545708, 254.444763),
    ["Volcano Isle"] = CFrame.new(829.335938, 128.694641, 926.749512),
    ["Snowy Biome"] = CFrame.new(2192.81934, 132.483459, 262.021057),
    ["Deep Waters"] = CFrame.new(-22.3140888, 129.08902, -1377.86743),
    ["Ancient Ocean"] = CFrame.new(797.303894, 125.975601, -2088.22656),
    ["Toxic Zone"] = CFrame.new(3417.6167, 126.026093, -1539.51465),
    ["Mansion Island"] = CFrame.new(4058.69507, 125.416229, 428.03006)
}

-- Functions
local function Lives()
    return LocalPlayer.Character and 
           LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and 
           LocalPlayer.Character:FindFirstChild("Humanoid") and 
           LocalPlayer.Character.Humanoid.Health >= 1
end

local function EquipRod()
    if Lives() then
        local rodName = LocalPlayer.inventory.rodsEquippedName.Value
        if not LocalPlayer.Character:FindFirstChild(rodName) then
            if LocalPlayer.Backpack:FindFirstChild(rodName) then
                LocalPlayer.Backpack:FindFirstChild(rodName).Parent = LocalPlayer.Character
            end
        end
    end
end

local function SafeZone(pos)
    if workspace:FindFirstChild('fixzhub-safezone') then
        workspace:FindFirstChild('fixzhub-safezone').CFrame = pos
    else
        local part = Instance.new('Part', workspace)
        part.Name = 'fixzhub-safezone'
        part.CFrame = pos
        part.Size = Vector3.new(10, 2, 10)
        part.Transparency = 0.8
        part.Anchored = true
    end
end

local isSelling = false
local function SellAll()
    if not isSelling and Lives() then
        local fishCount = 0
        for _, fish in pairs(LocalPlayer.inventory.fishes:GetChildren()) do
            fishCount = fishCount + 1
        end
        
        if fishCount >= sellAmount then
            isSelling = true
            local originalPos = LocalPlayer.Character.HumanoidRootPart.CFrame
            
            -- Teleport to shop
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(815.194214, 125.560997, -250.464111)
            task.wait(2)
            
            -- Sell all fish
            for _, fish in pairs(LocalPlayer.inventory.fishes:GetChildren()) do
                local args = {[1] = fish.Name, [2] = fish:GetAttribute('itemId')}
                ReplicatedStorage.events.fishing.itemSell:InvokeServer(unpack(args))
            end
            
            task.wait(2)
            LocalPlayer.Character.HumanoidRootPart.CFrame = originalPos
            isSelling = false
        end
    end
end

-- Create Window
local Window = WindUI:CreateWindow({
    Title = "Fixz Hub | Go Fishing 🐟",
    Icon = "rbxassetid://10723434711",
    Author = "Made By fixz64 on Discord!⭐",
    Folder = "FixzHub/GoFish",
    Size = UDim2.fromOffset(480, 360),
    Transparent = false,
    Theme = "Dark",
    SideBarWidth = 170,
})

-- Tabs
local Farm = Window:Tab({ Title = "Auto Farm", Icon = "fish" })
local Zone = Window:Tab({ Title = "Zones", Icon = "map" })
local Shop = Window:Tab({ Title = "Shop", Icon = "shopping-cart" })
local Misc = Window:Tab({ Title = "Misc", Icon = "settings" })

-- Farm Tab
Farm:Section({ Title = "Auto Fishing" })

Farm:Toggle({
    Title = "Auto Cast",
    Default = false,
    Callback = function(v)
        autoCast = v
        task.spawn(function()
            while autoCast and task.wait(1) do
                if Lives() and not LocalPlayer.fishing.general.activeFishing.Value then
                    EquipRod()
                    local oldValue = LocalPlayer.gui.autofishing.Value
                    LocalPlayer.gui.autofishing.Value = true
                    VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, nil, 0)
                    repeat task.wait() until LocalPlayer.fishing.general.activeFishing.Value
                    VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, nil, 0)
                    LocalPlayer.gui.autofishing.Value = oldValue
                end
            end
        end)
        WindUI:Notify(v and "Auto Cast Enabled!" or "Auto Cast Disabled!", 3)
    end
})

Farm:Toggle({
    Title = "Auto Catch",
    Default = false,
    Callback = function(v)
        autoCatch = v
        task.spawn(function()
            while autoCatch and task.wait() do
                if LocalPlayer.fishing.general.activeFighting.Value then
                    ReplicatedStorage.events.fishing.fightClick:FireServer()
                end
            end
        end)
        WindUI:Notify(v and "Auto Catch Enabled!" or "Auto Catch Disabled!", 3)
    end
})

Farm:Toggle({
    Title = "Auto Target",
    Default = false,
    Callback = function(v)
        autoTarget = v
        task.spawn(function()
            while autoTarget and task.wait() do
                local targetFrame = LocalPlayer.PlayerGui.fishing.targetFrame
                for _, target in ipairs(targetFrame:GetChildren()) do
                    if target:IsA("GuiObject") and target.Name == 'target' and target:FindFirstChild('ImageButton') then
                        game:GetService('GuiService').SelectedObject = target.ImageButton
                        task.wait()
                        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                        task.wait()
                        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                    end
                    task.wait(0.08)
                end
            end
        end)
        WindUI:Notify(v and "Auto Target Enabled!" or "Auto Target Disabled!", 3)
    end
})

Farm:Section({ Title = "Auto Sell" })

Farm:Toggle({
    Title = "Auto Sell Fish",
    Default = false,
    Callback = function(v)
        autoSell = v
        task.spawn(function()
            while autoSell and task.wait(5) do
                SellAll()
            end
        end)
        WindUI:Notify(v and "Auto Sell Enabled!" or "Auto Sell Disabled!", 3)
    end
})

Farm:Slider({
    Title = "Sell When Have Fish",
    Value = { Min = 10, Max = 200, Default = 50 },
    Callback = function(v)
        sellAmount = v
    end
})

-- Zone Tab
Zone:Section({ Title = "Fishing Zones" })

Zone:Dropdown({
    Title = "Select Zone",
    Values = {"Default Isle", "Volcano Isle", "Snowy Biome", "Deep Waters", "Ancient Ocean", "Toxic Zone", "Mansion Island"},
    Default = "Default Isle",
    Callback = function(v)
        selectedZone = zones[v]
    end
})

Zone:Toggle({
    Title = "Auto Teleport to Zone",
    Default = false,
    Callback = function(v)
        autoZone = v
        task.spawn(function()
            while autoZone and task.wait(2) do
                if Lives() and not isSelling then
                    SafeZone(selectedZone)
                    LocalPlayer.Character.HumanoidRootPart.CFrame = selectedZone + Vector3.new(0, 3, 0)
                    if freezeChar then
                        LocalPlayer.Character.HumanoidRootPart.Anchored = true
                    end
                end
            end
        end)
        WindUI:Notify(v and "Auto Zone Enabled!" or "Auto Zone Disabled!", 3)
    end
})

Zone:Toggle({
    Title = "Freeze Character",
    Default = false,
    Callback = function(v)
        freezeChar = v
        if Lives() then
            LocalPlayer.Character.HumanoidRootPart.Anchored = v
        end
    end
})

Zone:Button({
    Title = "Teleport Now",
    Callback = function()
        if Lives() then
            LocalPlayer.Character.HumanoidRootPart.CFrame = selectedZone + Vector3.new(0, 3, 0)
            WindUI:Notify("Teleported to zone!", 3)
        end
    end
})

-- Shop Tab
Shop:Section({ Title = "Buy Items" })

local rods = {"Steel Rod", "Gold Rod", "Diamond Rod", "Amethyst Rod", "Angel Rod", "Rainbow Rod"}
local baits = {"Apple", "Carrot", "Grapes", "Worm", "Fish Bait", "Gold", "Diamond", "Rainbow"}
local selectedRod = "Steel Rod"
local selectedBait = "Apple"

Shop:Dropdown({
    Title = "Select Rod",
    Values = rods,
    Default = "Steel Rod",
    Callback = function(v)
        selectedRod = v
    end
})

Shop:Button({
    Title = "Buy Rod",
    Callback = function()
        local args = {[1] = selectedRod, [2] = "rods", [3] = "fishingSettings", [4] = "oneTime"}
        ReplicatedStorage.events.fishing.canShopPurchase:InvokeServer(unpack(args))
        WindUI:Notify("Bought " .. selectedRod .. "!", 3)
    end
})

Shop:Dropdown({
    Title = "Select Bait",
    Values = baits,
    Default = "Apple",
    Callback = function(v)
        selectedBait = v
    end
})

Shop:Button({
    Title = "Buy Bait (10x)",
    Callback = function()
        for i = 1, 10 do
            local args = {[1] = selectedBait, [2] = "baits", [3] = "fishingSettings", [4] = "manyTime"}
            ReplicatedStorage.events.fishing.canShopPurchase:InvokeServer(unpack(args))
        end
        WindUI:Notify("Bought 10x " .. selectedBait .. "!", 3)
    end
})

Shop:Button({
    Title = "Redeem All Codes",
    Callback = function()
        local codes = 0
        for _, code in pairs(LocalPlayer.rewards.codes:GetChildren()) do
            if not code.Value then
                ReplicatedStorage.events.gui.canRedeemCode:InvokeServer(code.Name)
                codes = codes + 1
            end
        end
        WindUI:Notify("Redeemed " .. codes .. " codes!", 3)
    end
})

-- Misc Tab
Misc:Section({ Title = "Information" })

Misc:Button({
    Title = "Copy Discord Link",
    Callback = function()
        setclipboard("https://discord.gg/G4AuBncANE")
        WindUI:Notify("Discord link copied!", 3)
    end
})

Misc:Paragraph({
    Title = "Fixz Hub | Go Fish 🐟",
    Content = "Version: 1.0.0\n\nFeatures:\n• Auto Cast & Catch\n• Auto Target\n• Auto Sell\n• Zone Teleporter\n• Auto Buy Items\n• Code Redeemer\n\nDiscord: discord.gg/G4AuBncANE"
})

-- Initial Notification
task.wait(1)
WindUI:Notify("Fixz Hub | Go Fish loaded! 🐟", 5)
print("✅ Fixz Hub | Go Fish loaded successfully!")