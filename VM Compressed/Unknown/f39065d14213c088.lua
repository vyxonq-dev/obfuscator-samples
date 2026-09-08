-- hi skids <3
if not game:IsLoaded() then
    game.Loaded:Wait()
end

local marketplace_service = game:GetService("MarketplaceService")
local replicated_storage = game:GetService("ReplicatedStorage")
local local_player = game:GetService("Players").LocalPlayer
local run_service = game:GetService("RunService")
local workspace = game:GetService("Workspace")
local stats = game:GetService("Stats")

local info = marketplace_service:GetProductInfo(game.PlaceId)

local blink_unreliable_remote = replicated_storage:FindFirstChild("BLINK_UNRELIABLE_REMOTE")

if not blink_unreliable_remote then
    return local_player:Kick("Game not supported!")
end

local can_get_free_seeds = false

local seed_controller = replicated_storage:FindFirstChild("GameEvents"):FindFirstChild("SeedShopController")

if seed_controller then
    can_get_free_seeds = true
end

local can_get_free_gears = false

local gear_controller = replicated_storage:FindFirstChild("GameEvents"):FindFirstChild("GearShopController")

if gear_controller then
    can_get_free_gears = true
end

local can_dupe_eggs = false

local egg_service = replicated_storage:FindFirstChild("GameEvents"):FindFirstChild("PetEggService")

if egg_service then
    can_dupe_eggs = true
end

local farms = workspace:FindFirstChild("Farm")
local plot = nil

for _, v in farms:GetDescendants() do
    if v.Name == "Owner" and v.Value == local_player.Name then
        plot = v.Parent.Parent
        break
    end
end

local fruit_names = {}

if can_get_free_seeds then
    local fruits = replicated_storage:FindFirstChild("Fruit_Spawn")
    if not fruits then
        return local_player:Kick("Found remote to get free seeds but couldnt find fruits report this to @kylosilly on discord!")
    end
    for _, v in fruits:GetChildren() do
        if not v.Name:find("TODO") then
            table.insert(fruit_names, v.Name)
        end
    end
end

local gear_names = {}

if can_get_free_gears then
    local gears = replicated_storage:FindFirstChild("Gears")
    if not gears then
        return local_player:Kick("Found remote to get free gears but couldnt find gears report this to @kylosilly on discord!")
    end
    for _, v in gears:GetChildren() do
        table.insert(gear_names, v.Name)
    end
end

local plant_physical = plot:FindFirstChild("Plants_Physical")

if not plant_physical then
    return local_player:Kick("Plants folder in plot not found!")
end

function closest_plant()
    local plant = nil
    local dist = 9e99
    for _, v in plant_physical:GetDescendants() do
        if v:IsA("ProximityPrompt") and v.Parent and not v.Parent.Parent.Name:find("Egg") then
            local distance = (v.Parent.Parent:GetPivot().Position - local_player.Character:GetPivot().Position).Magnitude
            if distance < dist then
                dist = distance
                plant = v.Parent.Parent
            end
        end
    end
    return plant
end

function closest_egg()
    local egg = nil
    local dist = 9e99
    for _, v in plant_physical:GetChildren() do
        if v:IsA("Model") and v:GetAttribute("TimeToHatch") == 0 then
            local distance = (v:GetPivot().Position - local_player.Character:GetPivot().Position).Magnitude
            if distance < dist then
                dist = distance
                egg = v
            end
        end
    end
    return egg
end

local selected_seed = ""
local selected_gear = ""

local dupe_egg_amount = 100
local dupe_amount = 250

local repo = 'https://raw.githubusercontent.com/KINGHUB01/Gui/main/'

local library = loadstring(game:HttpGet(repo .. 'Gui%20Lib%20%5BLibrary%5D'))()
local theme_manager = loadstring(game:HttpGet(repo .. 'Gui%20Lib%20%5BThemeManager%5D'))()
local save_manager = loadstring(game:HttpGet(repo .. 'Gui%20Lib%20%5BSaveManager%5D'))()

local window = library:CreateWindow({
    Title = "Holy Skidded Games | Made By @kylosilly On Discord",
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.4
})

local tabs = {
    main = window:AddTab("Main"),
    ["ui settings"] = window:AddTab("UI Settings")
}

local dupe_group = tabs.main:AddLeftGroupbox("Dupe Settings")
local shop_group = tabs.main:AddLeftGroupbox("Shop Settings")
local plant_group = tabs.main:AddRightGroupbox("Seed Settings")
local gear_group = tabs.main:AddRightGroupbox("Gear Settings")
local egg_group = tabs.main:AddRightGroupbox("Egg Settings")
local menu_group = tabs["ui settings"]:AddLeftGroupbox("Menu Settings")

dupe_group:AddDivider()

dupe_group:AddSlider('dupe_amount', {
    Text = 'Dupe Amount:',
    Default = dupe_amount,
    Min = 1,
    Max = 1000,
    Rounding = 0,
    Compact = false,

    Callback = function(Value)
        dupe_amount = Value
        if Value >= 251 and not ok then
            ok = true
            library:Notify("Anything above 250 can lag")
        end
    end
})

dupe_group:AddButton({
    Text = 'Dupe Closest Plants',
    Func = function()
        local plant = closest_plant()
        if plant then
            for i = 1, dupe_amount do
                blink_unreliable_remote:FireServer(buffer.fromstring("\000\001\000\001"), { plant })
            end
        else
            library:Notify("No plant found")
        end
    end,
    DoubleClick = false,
    Tooltip = 'Dupes closests plant on your plot with selected dupe amount'
})

shop_group:AddDivider()

shop_group:AddButton({
    Text = 'Sell All',
    Func = function()
        replicated_storage:WaitForChild("GameEvents"):WaitForChild("Sell_Inventory"):FireServer()
        library:Notify("Sold inventory")
    end,
    DoubleClick = false,
    Tooltip = 'Sells inventory'
})

plant_group:AddDivider()

if can_get_free_seeds then
    plant_group:AddLabel("Some seeds can be bought but not placed!", true)
    plant_group:AddDivider()
    plant_group:AddDropdown('selected_seed', {
        Values = fruit_names,
        Default = selected_seed,
        Multi = false,
        Text = 'Select Seed:',
        Tooltip = 'Select seed to buy',
        Callback = function(Value)
            selected_seed = Value
        end
    })

    plant_group:AddButton({
        Text = 'Buy Selected Seed',
        Func = function()
            if selected_seed == "" then
                library:Notify("Select a seed to buy before using this buddy")
                return
            end
            seed_controller:FireServer(selected_seed)
        end,
        DoubleClick = false,
        Tooltip = 'Buys selected seed'
    })
else
    plant_group:AddLabel("Free buy seed remote not found so you cant use this feature!", true)
end

gear_group:AddDivider()

if can_get_free_gears then
    gear_group:AddDropdown('selected_gear', {
        Values = gear_names,
        Default = selected_gear,
        Multi = false,
        Text = 'Select Gear:',
        Tooltip = 'Select gear to buy',
        Callback = function(Value)
            selected_gear = Value
        end
    })

    gear_group:AddButton({
        Text = 'Buy Selected Gear',
        Func = function()
            if selected_gear == "" then
                library:Notify("Select a gear to buy before using this buddy")
                return
            end
            gear_controller:FireServer(selected_gear)
        end,
        DoubleClick = false,
        Tooltip = 'Buys selected gear'
    })
else
    gear_group:AddLabel("Free buy gear remote not found so you cant use this feature!", true)
end

egg_group:AddDivider()

if can_dupe_eggs then
    egg_group:AddLabel("Hatches same egg multiple times must be hatchable", true)
    egg_group:AddDivider()
    egg_group:AddSlider('dupe_amount', {
        Text = 'Dupe Egg Amount:',
        Default = dupe_egg_amount,
        Min = 1,
        Max = 1000,
        Rounding = 0,
        Compact = false,

        Callback = function(Value)
            dupe_egg_amount = Value
            if Value >= 101 and not ok2 then
                ok2 = true
                library:Notify("Anything above 100 can lag ALOT")
            end
        end
    })

    egg_group:AddButton({
        Text = 'Dupe Closest Eggs',
        Func = function()
            local egg = closest_egg()
            if egg then
                local_player.Character:MoveTo(egg:GetPivot().Position)
                task.wait(1)
                fireproximityprompt(egg:FindFirstChildOfClass("Model"):FindFirstChildOfClass("ProximityPrompt"))
                task.wait(1)
                for i = 1, dupe_egg_amount do
                    egg_service:FireServer("HatchPet", egg)
                end
            else
                library:Notify("No egg found")
            end
        end,
        DoubleClick = false,
        Tooltip = 'Dupes closest egg on your plot with selected dupe amount'
    })
else
    egg_group:AddLabel("Cant dupe egg hatches in this game!", true)
end

local FrameTimer = tick()
local FrameCounter = 0;
local FPS = 60;

local watermark_connection = run_service.RenderStepped:Connect(function()
    FrameCounter += 1
    if (tick() - FrameTimer) >= 1 then
        FPS = FrameCounter;
        FrameTimer = tick();
        FrameCounter = 0;
    end

    library:SetWatermark(('%s fps | %s ms | game: '..info.Name..''):format(
        math.floor(FPS),
        math.floor(stats.Network.ServerStatsItem['Data Ping']:GetValue())
    ))
end)

menu_group:AddButton('Unload', function()
    watermark_connection:Disconnect()
    library:Unload()
end)

menu_group:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' })
library.ToggleKeybind = Options.MenuKeybind
theme_manager:SetLibrary(library)
save_manager:SetLibrary(library)
save_manager:IgnoreThemeSettings()
save_manager:SetIgnoreIndexes({ 'MenuKeybind' })
theme_manager:SetFolder('Sybau Skid')
save_manager:SetFolder('Sybau Skid/gaggy moddedssssssssss')
save_manager:BuildConfigSection(tabs['ui settings'])
theme_manager:ApplyToTab(tabs['ui settings'])
save_manager:LoadAutoloadConfig()
