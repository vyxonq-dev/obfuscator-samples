if not game:IsLoaded() then
    game.Loaded:Wait()
end

local marketplace_service = game:GetService("MarketplaceService")
local replicated_storage = game:GetService("ReplicatedStorage")
local virtual_user = game:GetService("VirtualUser")
local run_service = game:GetService("RunService")
local workspace = game:GetService("Workspace")
local players = game:GetService("Players")
local stats = game:GetService("Stats")

local info = marketplace_service:GetProductInfo(game.PlaceId)
local get_gc = getconnections or get_signal_cons
local local_player = players.LocalPlayer

local collectables = workspace:FindFirstChild("Gameplay"):FindFirstChild("CurrencyPickup"):FindFirstChild("CurrencyHolder")

if not collectables then
    local_player:Kick("Collectables folder not found!")
end

local egg_module = require(replicated_storage:FindFirstChild("Modules"):FindFirstChild("PetsInfo"):FindFirstChild("PetShopInfo"))

if not egg_module then
    local_player:Kick("Egg module not found!")
end

local auto_pet_aura = false
local auto_combine = false
local auto_sabers = false
local auto_boosts = false
local auto_auras = false
local auto_click = false
local auto_crown = false
local auto_hatch = false
local auto_class = false
local auto_best = false
local auto_dnas = false
local auto_sell = false
local auto_hit = false

local selected_boss = "Normal"
local selected_egg = ""

local egg_names = {}

for _, v in next, egg_module do
    for i, v2 in next, v do
        if i == "EggName" then
            table.insert(egg_names, v2)
        end
    end
end

local repo = 'https://raw.githubusercontent.com/KINGHUB01/Gui/main/'

local library = loadstring(game:HttpGet(repo .. 'Gui%20Lib%20%5BLibrary%5D'))()
local theme_manager = loadstring(game:HttpGet(repo .. 'Gui%20Lib%20%5BThemeManager%5D'))()
local save_manager = loadstring(game:HttpGet(repo .. 'Gui%20Lib%20%5BSaveManager%5D'))()

local window = library:CreateWindow({
    Title = "Made By @kylosilly",
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.35
})

local tabs = {
    main = window:AddTab("Main"),
    ["ui settings"] = window:AddTab("UI Settings")
}

local auto_group = tabs.main:AddLeftGroupbox("Auto Settings")
local shop_group = tabs.main:AddRightGroupbox("Shop Settings")
local farm_group = tabs.main:AddLeftGroupbox("Farm Settings")
local misc_group = tabs.main:AddRightGroupbox("Misc Settings")
local menu_group = tabs["ui settings"]:AddLeftGroupbox("Menu")

auto_group:AddDivider()

auto_group:AddToggle('auto_best', {
    Text = 'Auto Equip Best Pets',
    Default = auto_best,
    Tooltip = 'Equips best pets',

    Callback = function(Value)
        auto_best = Value
        if Value then
            repeat
                replicated_storage:WaitForChild("Events"):WaitForChild("UIAction"):FireServer("EquipBestPets")
                task.wait(5)
            until not auto_best
        end
    end
})

auto_group:AddToggle('auto_combine', {
    Text = 'Auto Combine Pets',
    Default = auto_combine,
    Tooltip = 'Combines pets',

    Callback = function(Value)
        auto_combine = Value
        if Value then
            repeat
                replicated_storage:WaitForChild("Events"):WaitForChild("UIAction"):FireServer("CombineAllPets")
                task.wait(5)
            until not auto_combine
        end
    end
})

auto_group:AddToggle('auto_crown', {
    Text = 'Collect Crowns',
    Default = auto_crown,
    Tooltip = 'Collects crowns for you',

    Callback = function(Value)
        auto_crown = Value
        if Value then
            repeat
                if #collectables:GetChildren() > 0 then
                    local crowns = {}
                    for _, v in next, collectables:GetChildren() do
                        if v:IsA("MeshPart") then
                            table.insert(crowns, v)
                        end
                    end
                    replicated_storage:WaitForChild("Events"):WaitForChild("CollectCurrencyPickup"):FireServer(crowns)
                end
                task.wait(.2)
            until not auto_crown
        end
    end
})

auto_group:AddToggle('auto_click', {
    Text = 'Auto Click',
    Default = auto_click,
    Tooltip = 'Farms strength for you',

    Callback = function(Value)
        auto_click = Value
        if Value then
            repeat
                if not local_player.Character:FindFirstChildOfClass("Tool") then
                    local_player.Character:FindFirstChild("Humanoid"):EquipTool(local_player.Backpack:FindFirstChildOfClass("Tool"))
                end
                replicated_storage:WaitForChild("Events"):WaitForChild("SwingSaber"):FireServer()
                task.wait(.2)
            until not auto_click
        end
    end
})

auto_group:AddToggle('auto_sell', {
    Text = 'Auto Sell',
    Default = auto_sell,
    Tooltip = 'Sells from anywhere',

    Callback = function(Value)
        auto_sell = Value
        if Value then
            repeat
                replicated_storage:WaitForChild("Events"):WaitForChild("SellStrength"):FireServer()
                task.wait(.2)
            until not auto_sell
        end
    end
})

shop_group:AddDivider()

shop_group:AddToggle('auto_boosts', {
    Text = 'Auto Buy Boss Hits',
    Default = auto_boosts,
    Tooltip = 'Buys available boss hits',

    Callback = function(Value)
        auto_boosts = Value
        if Value then
            repeat
                replicated_storage:WaitForChild("Events"):WaitForChild("UIAction"):FireServer("BuyAllBossBoosts")
                task.wait(.5)
            until not auto_boosts
        end
    end
})

shop_group:AddToggle('auto_pet_aura', {
    Text = 'Auto Buy Pet Aura',
    Default = auto_pet_aura,
    Tooltip = 'Buys available pet auras',

    Callback = function(Value)
        auto_pet_aura = Value
        if Value then
            repeat
                replicated_storage:WaitForChild("Events"):WaitForChild("UIAction"):FireServer("BuyAllPetAuras")
                task.wait(.5)
            until not auto_pet_aura
        end
    end
})

shop_group:AddToggle('auto_class', {
    Text = 'Auto Buy Classes',
    Default = auto_class,
    Tooltip = 'Buys available classes',

    Callback = function(Value)
        auto_class = Value
        if Value then
            repeat
                if local_player.PlayerGui.MainGui.OtherFrames.Shop.Frames.Classes.InfoFrame.Frame.BuyButton.Button.Buy.Price.TextLabel.TextColor3 == Color3.fromRGB(255, 255, 255) then
                    replicated_storage:WaitForChild("Events"):WaitForChild("UIAction"):FireServer("BuyClass", local_player.PlayerGui.MainGui.OtherFrames.Shop.Frames.Classes.InfoFrame.Frame.ItemName.TextLabel.Text)
                end
                task.wait(.5)
            until not auto_class
        end
    end
})

shop_group:AddToggle('auto_sabers', {
    Text = 'Auto Buy Sabers',
    Default = auto_sabers,
    Tooltip = 'Buys available sabers',

    Callback = function(Value)
        auto_sabers = Value
        if Value then
            repeat
                replicated_storage:WaitForChild("Events"):WaitForChild("UIAction"):FireServer("BuyAllWeapons")
                task.wait(.5)
            until not auto_sabers
        end
    end
})

shop_group:AddToggle('auto_auras', {
    Text = 'Auto Buy Auras',
    Default = auto_auras,
    Tooltip = 'Buys available auras',

    Callback = function(Value)
        auto_auras = Value
        if Value then
            repeat
                replicated_storage:WaitForChild("Events"):WaitForChild("UIAction"):FireServer("BuyAllAuras")
                task.wait(.5)
            until not auto_auras
        end
    end
})

shop_group:AddToggle('auto_dnas', {
    Text = 'Auto Buy DNAs',
    Default = auto_dnas,
    Tooltip = 'Buys available dnas',

    Callback = function(Value)
        auto_dnas = Value
        if Value then
            repeat
                replicated_storage:WaitForChild("Events"):WaitForChild("UIAction"):FireServer("BuyAllDNAs")
                task.wait(.5)
            until not auto_dnas
        end
    end
})

shop_group:AddDivider()

shop_group:AddDropdown('egg_dropdown', {
    Values = egg_names,
    Default = selected_egg,
    Multi = false,

    Text = 'Select Egg To Auto Hatch:',
    Tooltip = 'Auto hatches selected egg',

    Callback = function(Value)
        selected_egg = Value
    end
})

shop_group:AddToggle('auto_hatch', {
    Text = 'Auto Hatch',
    Default = auto_hatch,
    Tooltip = 'Auto hatches selected egg',

    Callback = function(Value)
        auto_hatch = Value
        if Value then
            repeat
                if selected_egg == "" then
                    library:Notify("Please select an egg")
                    auto_hatch = false
                    return
                end
                replicated_storage:WaitForChild("Events"):WaitForChild("UIAction"):FireServer("BuyEgg", selected_egg)
                task.wait(1)
            until not auto_hatch
        end
    end
})

farm_group:AddDivider()

farm_group:AddDropdown('selected_boss', {
    Values = { "Normal", "Earth", "Water", "Fire" }, -- yes ik i forgot one but too lazy to add sowwwywwy
    Default = selected_boss,
    Multi = false,

    Text = 'Select Boss To Fight',

    Callback = function(Value)
        selected_boss = Value
    end
})

farm_group:AddToggle('auto_hit', {
    Text = 'Farm Selected Enemy',
    Default = auto_hit,
    Tooltip = 'Farms selected enemy',

    Callback = function(Value)
        auto_hit = Value
        if Value then
            local cooldown = false
            repeat
                if not local_player.Character:FindFirstChildOfClass("Tool") then
                    local_player.Character:FindFirstChild("Humanoid"):EquipTool(local_player.Backpack:FindFirstChildOfClass("Tool"))
                end
                if selected_boss == "Normal" then
                    if #workspace:FindFirstChild("Gameplay"):FindFirstChild("Boss"):FindFirstChild("BossHolder"):GetChildren() > 0 then
                        local_player.Character:MoveTo(workspace.Gameplay.Boss.BossHolder:FindFirstChildOfClass("Model").PrimaryPart:GetPivot().Position)
                    end
                elseif selected_boss == "Earth" then
                    if workspace:FindFirstChild("Gameplay"):FindFirstChild("Map"):FindFirstChild("ElementZones"):FindFirstChild("Earth"):FindFirstChild("Model"):FindFirstChild("Earth"):FindFirstChildOfClass("Model") then
                        local_player.Character:MoveTo(workspace.Gameplay.Map.ElementZones.Earth.Model.Earth:FindFirstChildOfClass("Model").PrimaryPart:GetPivot().Position)
                    end
                elseif selected_boss == "Water" then
                    if workspace:FindFirstChild("Gameplay"):FindFirstChild("Map"):FindFirstChild("ElementZones"):FindFirstChild("Water"):FindFirstChild("Water"):FindFirstChildOfClass("Model") then
                        local_player.Character:MoveTo(workspace.Gameplay.Map.ElementZones.Water.Water:FindFirstChildOfClass("Model").PrimaryPart:GetPivot().Position)
                    end
                elseif selected_boss == "Fire" then
                    if workspace:FindFirstChild("Gameplay"):FindFirstChild("Map"):FindFirstChild("ElementZones"):FindFirstChild("Fire"):FindFirstChild("Fire"):FindFirstChildOfClass("Model") then
                        local_player.Character:MoveTo(workspace.Gameplay.Map.ElementZones.Fire.Fire:FindFirstChildOfClass("Model").PrimaryPart:GetPivot().Position)
                    end
                end
                if not cooldown then
                    local_player.Character:FindFirstChildOfClass("Tool"):FindFirstChild("RemoteClick"):FireServer()
                    cooldown = true
                    task.wait(.2)
                    cooldown = false
                end
                task.wait()
            until not auto_hit
        end
    end
})

misc_group:AddDivider()

misc_group:AddButton({
    Text = 'Claim Daily Reward',
    Func = function()
        replicated_storage:WaitForChild("Events"):WaitForChild("UIAction"):FireServer("ClaimDailyReward")
    end,
    DoubleClick = false,
    Tooltip = 'Claims daily reward'
})

misc_group:AddDivider()

misc_group:AddButton({
    Text = 'Anti Afk',
    Func = function()
        if get_gc then
            for _, v in next, get_gc(local_player.Idled) do
                if v["Disable"] then
                    v["Disable"](v)
                elseif v["Disconnect"] then
                    v["Disconnect"](v)
                end
            end
        else
            virtual_user:CaptureController()
            virtual_user:ClickButton2(Vector2.new())
        end
        library:Notify("Anti Afk Enabled!")
    end,
    DoubleClick = false,
    Tooltip = 'Prevents you from being kicked for being 20 mins afk'
})

local frame_timer = tick()
local frame_counter = 0;
local fps = 60;

local watermark_connection = run_service.RenderStepped:Connect(function()
    frame_counter += 1;

    if (tick() - frame_timer) >= 1 then
        fps = frame_counter;
        frame_timer = tick();
        frame_counter = 0;
    end;

    library:SetWatermark(('%s fps | %s ms | game: '..info.Name..''):format(
        math.floor(fps),
        math.floor(stats.Network.ServerStatsItem['Data Ping']:GetValue())
    ));
end);

menu_group:AddButton('Unload', function()
    auto_pet_aura = false
    auto_combine = false
    auto_sabers = false
    auto_boosts = false
    auto_auras = false
    auto_click = false
    auto_crown = false
    auto_hatch = false
    auto_class = false
    auto_dnas = false
    auto_best = false
    auto_sell = false
    auto_hit = false
    watermark_connection:Disconnect()
    library:Unload()
end)

menu_group:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' })
library.ToggleKeybind = Options.MenuKeybind
theme_manager:SetLibrary(library)
save_manager:SetLibrary(library)
save_manager:IgnoreThemeSettings()
save_manager:SetIgnoreIndexes({ 'MenuKeybind' })
theme_manager:SetFolder('Astolfo Ware')
save_manager:SetFolder('Astolfo Ware/Saber Simulator Rewrite')
save_manager:BuildConfigSection(tabs['ui settings'])
theme_manager:ApplyToTab(tabs['ui settings'])
save_manager:LoadAutoloadConfig()
