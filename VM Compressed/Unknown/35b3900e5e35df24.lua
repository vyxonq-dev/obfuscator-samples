-- FIXZ HUB | DIG TO EARTH CORE 🌏
-- Using Fluent UI Library

print("🌏 Loading Fixz Hub for Dig To Earth Core...")

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")

local plr = Players.LocalPlayer

-- Anti-AFK
plr.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

-- Load Fluent UI
print("Loading Fluent UI...")
local success, Fluent = pcall(function()
    return loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
end)

if not success then
    warn("Failed to load Fluent UI, trying alternate link...")
    Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Fluent.lua"))()
end

local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

print("Creating window...")

-- Variables
_G.Enabled = false
_G.Borabill = false
_G.lol = false
_G.casaca = false
_G.olamundo = false
_G.Pp = false
_G.oo = false
_G.Golden2 = false
_G.Diamond = false
_G.Void = false

-- Create Window
local Window = Fluent:CreateWindow({
    Title = "🌏 Fixz Hub | Dig To Earth Core",
    SubTitle = "Auto Farm & Rewards",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.RightShift
})

-- Create Tabs
local Tabs = {
    Main = Window:AddTab({ Title = "🏠 Main", Icon = "home" }),
    Farm = Window:AddTab({ Title = "⛏️ Farm", Icon = "pickaxe" }),
    Rewards = Window:AddTab({ Title = "🎁 Rewards", Icon = "gift" }),
    Pets = Window:AddTab({ Title = "🐾 Pets", Icon = "dog" }),
    Machines = Window:AddTab({ Title = "⚙️ Machines", Icon = "cpu" }),
    Settings = Window:AddTab({ Title = "🔧 Settings", Icon = "settings" })
}

-- MAIN TAB
Tabs.Main:AddParagraph({
    Title = "🌏 Welcome to Fixz Hub!",
    Content = "Dig To Earth Core - Auto farm, infinite resources, and pet automation!"
})

Tabs.Main:AddButton({
    Title = "🎮 Join Discord",
    Description = "Get support and updates",
    Callback = function()
        setclipboard("https://discord.gg/CDyrbSY8Gx")
        Fluent:Notify({
            Title = "Discord Copied!",
            Content = "Discord invite copied to clipboard!",
            Duration = 3
        })
    end
})

-- FARM TAB
Tabs.Farm:AddParagraph({
    Title = "⛏️ Auto Farm Features",
    Content = "Automatically dig and collect resources"
})

local InfMoneyToggle = Tabs.Farm:AddToggle("InfMoney", {
    Title = "💰 Infinite Money",
    Description = "Auto dig for infinite money",
    Default = false
})

InfMoneyToggle:OnChanged(function(state)
    _G.Enabled = state
    if state then
        Fluent:Notify({
            Title = "Infinite Money ON!",
            Content = "Auto digging enabled",
            Duration = 3
        })
    end
end)

task.spawn(function()
    while task.wait() do
        if _G.Enabled then
            pcall(function()
                ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("DigEvent"):FireServer("hello")
            end)
        end
    end
end)

local InfDiamondsToggle = Tabs.Farm:AddToggle("InfDiamonds", {
    Title = "💎 Infinite Diamonds",
    Description = "Auto collect diamonds",
    Default = false
})

InfDiamondsToggle:OnChanged(function(state)
    _G.Borabill = state
    if state then
        Fluent:Notify({
            Title = "Infinite Diamonds ON!",
            Content = "Auto collecting diamonds",
            Duration = 3
        })
    end
end)

task.spawn(function()
    while task.wait() do
        if _G.Borabill then
            pcall(function()
                ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("AddRewardEvent"):FireServer("Reward5")
            end)
        end
    end
end)

local InfGemsToggle = Tabs.Farm:AddToggle("InfGems", {
    Title = "💠 Infinite Gems",
    Description = "Auto collect gems",
    Default = false
})

InfGemsToggle:OnChanged(function(state)
    _G.olamundo = state
    if state then
        Fluent:Notify({
            Title = "Infinite Gems ON!",
            Content = "Auto collecting gems",
            Duration = 3
        })
    end
end)

task.spawn(function()
    while task.wait() do
        if _G.olamundo then
            pcall(function()
                ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("TreasureEvent"):FireServer("Telescope")
            end)
        end
    end
end)

local MultipleX10Toggle = Tabs.Farm:AddToggle("MultipleX10", {
    Title = "✖️ Multiple x10 (Money Multiplier)",
    Description = "Auto get x10 money multiplier",
    Default = false
})

MultipleX10Toggle:OnChanged(function(state)
    _G.lol = state
    if state then
        Fluent:Notify({
            Title = "x10 Multiplier ON!",
            Content = "Auto getting money multiplier",
            Duration = 3
        })
    end
end)

task.spawn(function()
    while task.wait() do
        if _G.lol then
            pcall(function()
                ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("SpinPrizeEvent"):FireServer(8)
            end)
        end
    end
end)

local InfWinsToggle = Tabs.Farm:AddToggle("InfWins", {
    Title = "🏆 Infinite Wins",
    Description = "Auto collect wins",
    Default = false
})

InfWinsToggle:OnChanged(function(state)
    _G.casaca = state
    if state then
        Fluent:Notify({
            Title = "Infinite Wins ON!",
            Content = "Auto collecting wins",
            Duration = 3
        })
    end
end)

task.spawn(function()
    while task.wait() do
        if _G.casaca then
            pcall(function()
                local remote = ReplicatedStorage:FindFirstChild("Remotes"):FindFirstChild("TreasureEvent")
                if remote then
                    remote:FireServer("Cup11")
                end
            end)
        end
    end
end)

-- REWARDS TAB
Tabs.Rewards:AddParagraph({
    Title = "🎁 Prize Rewards",
    Content = "Get instant rewards from spin prizes"
})

Tabs.Rewards:AddButton({
    Title = "🐾 Get Pet",
    Description = "Claim a free pet from spin",
    Callback = function()
        pcall(function()
            ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("SpinPrizeEvent"):FireServer(4)
            Fluent:Notify({
                Title = "Pet Claimed!",
                Content = "Pet obtained from spin",
                Duration = 2
            })
        end)
    end
})

Tabs.Rewards:AddButton({
    Title = "🎰 Get Spins (1x)",
    Description = "Get spin rewards",
    Callback = function()
        pcall(function()
            ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("SpinPrizeEvent"):FireServer(3)
            Fluent:Notify({
                Title = "Spins Claimed!",
                Content = "Spin rewards obtained",
                Duration = 2
            })
        end)
    end
})

Tabs.Rewards:AddButton({
    Title = "🎰 Get Spins (3x)",
    Description = "Get 3 spin rewards",
    Callback = function()
        pcall(function()
            ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("SpinPrizeEvent"):FireServer(7)
            Fluent:Notify({
                Title = "3x Spins Claimed!",
                Content = "3 spin rewards obtained",
                Duration = 2
            })
        end)
    end
})

Tabs.Rewards:AddButton({
    Title = "✖️ Multiple x10 (Once)",
    Description = "Get x10 money multiplier once",
    Callback = function()
        pcall(function()
            ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("SpinPrizeEvent"):FireServer(8)
            Fluent:Notify({
                Title = "Multiplier Claimed!",
                Content = "x10 money multiplier obtained",
                Duration = 2
            })
        end)
    end
})

Tabs.Rewards:AddButton({
    Title = "💎 Get Diamonds",
    Description = "Claim free diamonds",
    Callback = function()
        pcall(function()
            ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("SpinPrizeEvent"):FireServer(5)
            Fluent:Notify({
                Title = "Diamonds Claimed!",
                Content = "Diamonds obtained",
                Duration = 2
            })
        end)
    end
})

local AutoSpinToggle = Tabs.Rewards:AddToggle("AutoSpin", {
    Title = "🎰 Auto Get Spins",
    Description = "Automatically get spin rewards",
    Default = false
})

AutoSpinToggle:OnChanged(function(state)
    _G.oo = state
    if state then
        Fluent:Notify({
            Title = "Auto Spin ON!",
            Content = "Auto getting spins",
            Duration = 3
        })
    end
end)

task.spawn(function()
    while task.wait() do
        if _G.oo then
            pcall(function()
                ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("SpinPrizeEvent"):FireServer(7)
            end)
        end
    end
end)

-- PETS TAB
Tabs.Pets:AddParagraph({
    Title = "🐾 Pet Automation",
    Content = "Auto collect and craft pets"
})

local AutoBestPetToggle = Tabs.Pets:AddToggle("AutoBestPet", {
    Title = "🐧 Auto Get Best Pet (Blue Penguin)",
    Description = "Automatically get Blue Penguin pets",
    Default = false
})

AutoBestPetToggle:OnChanged(function(state)
    _G.Pp = state
    if state then
        Fluent:Notify({
            Title = "Auto Pet ON!",
            Content = "Auto getting Blue Penguin",
            Duration = 3
        })
    end
end)

task.spawn(function()
    while task.wait() do
        if _G.Pp then
            pcall(function()
                ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("PetCageEvent"):FireServer("Blue Penguin")
            end)
        end
    end
end)

Tabs.Pets:AddButton({
    Title = "🐧 Get Blue Penguin (Once)",
    Description = "Get one Blue Penguin pet",
    Callback = function()
        pcall(function()
            ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("PetCageEvent"):FireServer("Blue Penguin")
            Fluent:Notify({
                Title = "Pet Obtained!",
                Content = "Blue Penguin obtained",
                Duration = 2
            })
        end)
    end
})

-- MACHINES TAB
Tabs.Machines:AddParagraph({
    Title = "⚙️ Pet Crafting Machines",
    Content = "Auto craft golden, diamond, and void pets"
})

local AutoGoldenToggle = Tabs.Machines:AddToggle("AutoGolden", {
    Title = "✨ Auto Golden Machine",
    Description = "Auto craft golden Blue Penguin (x100)",
    Default = false
})

AutoGoldenToggle:OnChanged(function(state)
    _G.Golden2 = state
    if state then
        Fluent:Notify({
            Title = "Golden Machine ON!",
            Content = "Auto crafting golden pets",
            Duration = 3
        })
    end
end)

task.spawn(function()
    while task.wait() do
        if _G.Golden2 then
            pcall(function()
                ReplicatedStorage:WaitForChild("PetRemotes"):WaitForChild("GoldPetCraftEvent"):FireServer("Blue Penguin", 100)
            end)
        end
    end
end)

local AutoDiamondToggle = Tabs.Machines:AddToggle("AutoDiamond", {
    Title = "💎 Auto Diamond Machine",
    Description = "Auto craft diamond Blue Penguin (x100)",
    Default = false
})

AutoDiamondToggle:OnChanged(function(state)
    _G.Diamond = state
    if state then
        Fluent:Notify({
            Title = "Diamond Machine ON!",
            Content = "Auto crafting diamond pets",
            Duration = 3
        })
    end
end)

task.spawn(function()
    while task.wait() do
        if _G.Diamond then
            pcall(function()
                ReplicatedStorage:WaitForChild("PetRemotes"):WaitForChild("DiamondPetCraftEvent"):FireServer("Blue Penguin", 100)
            end)
        end
    end
end)

local AutoVoidToggle = Tabs.Machines:AddToggle("AutoVoid", {
    Title = "🌌 Auto Void Machine",
    Description = "Auto craft void Blue Penguin (x100)",
    Default = false
})

AutoVoidToggle:OnChanged(function(state)
    _G.Void = state
    if state then
        Fluent:Notify({
            Title = "Void Machine ON!",
            Content = "Auto crafting void pets",
            Duration = 3
        })
    end
end)

task.spawn(function()
    while task.wait() do
        if _G.Void then
            pcall(function()
                ReplicatedStorage:WaitForChild("PetRemotes"):WaitForChild("VoidPetCraftEvent"):FireServer("Blue Penguin", 100)
            end)
        end
    end
end)

Tabs.Machines:AddButton({
    Title = "✨ Craft Golden Pet (Once)",
    Description = "Craft one golden Blue Penguin",
    Callback = function()
        pcall(function()
            ReplicatedStorage:WaitForChild("PetRemotes"):WaitForChild("GoldPetCraftEvent"):FireServer("Blue Penguin", 100)
            Fluent:Notify({
                Title = "Crafted!",
                Content = "Golden pet crafted",
                Duration = 2
            })
        end)
    end
})

Tabs.Machines:AddButton({
    Title = "💎 Craft Diamond Pet (Once)",
    Description = "Craft one diamond Blue Penguin",
    Callback = function()
        pcall(function()
            ReplicatedStorage:WaitForChild("PetRemotes"):WaitForChild("DiamondPetCraftEvent"):FireServer("Blue Penguin", 100)
            Fluent:Notify({
                Title = "Crafted!",
                Content = "Diamond pet crafted",
                Duration = 2
            })
        end)
    end
})

Tabs.Machines:AddButton({
    Title = "🌌 Craft Void Pet (Once)",
    Description = "Craft one void Blue Penguin",
    Callback = function()
        pcall(function()
            ReplicatedStorage:WaitForChild("PetRemotes"):WaitForChild("VoidPetCraftEvent"):FireServer("Blue Penguin", 100)
            Fluent:Notify({
                Title = "Crafted!",
                Content = "Void pet crafted",
                Duration = 2
            })
        end)
    end
})

-- SETTINGS TAB
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})

InterfaceManager:SetFolder("FixzHub")
SaveManager:SetFolder("FixzHub/DigToEarthCore")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

Window:SelectTab(1)

Fluent:Notify({
    Title = "🌏 Fixz Hub Loaded!",
    Content = "Dig To Earth Core ready - Happy digging!",
    Duration = 5
})

SaveManager:LoadAutoloadConfig()

print("✅ Fixz Hub fully loaded!")
print("🌏 All features enabled - Start digging!")