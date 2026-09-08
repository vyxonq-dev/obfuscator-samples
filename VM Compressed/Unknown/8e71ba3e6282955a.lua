if not game:IsLoaded() then
    print("Waiting for game to load...")
    game.Loaded:Wait()
    print("Loaded Game")
end

local repo = 'https://raw.githubusercontent.com/KINGHUB01/Gui/main/'

local library = loadstring(game:HttpGet(repo .. 'Gui%20Lib%20%5BLibrary%5D'))()
local theme_manager = loadstring(game:HttpGet(repo .. 'Gui%20Lib%20%5BThemeManager%5D'))()
local save_manager = loadstring(game:HttpGet(repo .. 'Gui%20Lib%20%5BSaveManager%5D'))()

local window = library:CreateWindow({
    Title = 'Astolfo Ware | Made By @kylosilly | discord.gg/SUTpER4dNc',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

local tabs = {
    main = window:AddTab('Main'),
    ['ui settings'] = window:AddTab('UI Settings')
}

local game_group = tabs.main:AddLeftGroupbox('Game Settings')
local player_group = tabs.main:AddRightGroupbox('Player Settings')
local menu_group = tabs['ui settings']:AddLeftGroupbox('Menu')

local queue_teleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
local replicated_storage = cloneref(game:GetService('ReplicatedStorage'))
local user_input_service = cloneref(game:GetService('UserInputService'))
local local_player = cloneref(game:GetService('Players').LocalPlayer)
local market = cloneref(game:GetService('MarketplaceService'))
local tween_service = cloneref(game:GetService('TweenService'))
local run_service = cloneref(game:GetService('RunService'))
local workspace = cloneref(game:GetService('Workspace'))
local stats = cloneref(game:GetService('Stats'))
local info = market:GetProductInfo(game.PlaceId)

local enemies = workspace:FindFirstChild("Mobs")

if not enemies then
    repeat task.wait() print("Waiting For Mobs") until workspace:FindFirstChild("Mobs")
    enemies = workspace.Mobs
end

local goto_closest = false
local auto_start = false
local auto_redo = false
local kill_aura = false
local inf_jump = false
local tp_walk = false

local kill_aura_delay = 0.25
local tp_walk_speed = 5
local stud_offset = 5

user_input_service.JumpRequest:Connect(function()
    if inf_jump then
        local_player.Character.Humanoid:ChangeState("Jumping")
    end
end)

local speed_connection = run_service.Heartbeat:Connect(function()
    if tp_walk and local_player.Character and local_player.Character:FindFirstChild("Humanoid") and local_player.Character:FindFirstChild("HumanoidRootPart") then
        if local_player.Character.Humanoid.MoveDirection.Magnitude > 0 then
            local_player.Character:TranslateBy(local_player.Character.Humanoid.MoveDirection * tp_walk_speed / 10)
        end
    end
end)

function closest_mob()
    local mob = nil
    local distance = math.huge

    for _, v in next, enemies:GetChildren() do
        if not v:GetAttribute("Owner") and v:GetAttribute("HP") > 0 then
            local dist = (v:GetPivot().Position - local_player.Character:GetPivot().Position).Magnitude
            if dist < distance then
                distance = dist
                mob = v
            end
        end
    end

    return mob
end

game_group:AddDivider()

game_group:AddToggle('kill_aura', {
    Text = 'Kill Aura',
    Default = kill_aura,
    Tooltip = 'Kills enemys around you',

    Callback = function(Value)
        kill_aura = Value
        if Value then
            repeat
                local mobs = {}
                for _, v in next, enemies:GetChildren() do
                    table.insert(mobs, v)
                end
                replicated_storage:WaitForChild("Systems"):WaitForChild("Combat"):WaitForChild("PlayerAttack"):FireServer(mobs)
                task.wait(kill_aura_delay)
            until not kill_aura
        end
    end
})

game_group:AddSlider('kill_aura_delay', {
    Text = 'Kill Aura Delay:',
    Default = kill_aura_delay,
    Min = 0.25,
    Max = 5,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        kill_aura_delay = Value
    end
})

game_group:AddDivider()

game_group:AddToggle('auto_start', {
    Text = 'Auto Start Dungeon',
    Default = auto_start,
    Tooltip = 'Automatically starts dungeon',

    Callback = function(Value)
        auto_start = Value
        if Value then
            repeat
            replicated_storage:WaitForChild("Systems"):WaitForChild("Dungeons"):WaitForChild("TriggerStartDungeon"):FireServer()
            task.wait(1)
            until not auto_start
        end
    end
})

game_group:AddToggle('auto_redo', {
    Text = 'Auto Redo Dungeon',
    Default = auto_redo,
    Tooltip = 'Automatically does dungeon again',

    Callback = function(Value)
        auto_redo = Value
        if Value then
            repeat
            replicated_storage:WaitForChild("Systems"):WaitForChild("Dungeons"):WaitForChild("SetExitChoice"):FireServer("GoAgain")
            task.wait(1)
            until not auto_redo
        end
    end
})

game_group:AddDivider()

game_group:AddToggle('goto_closest', {
    Text = 'Tp To Closest Mob',
    Default = goto_closest,
    Tooltip = 'Teleports you to the closest mob',

    Callback = function(Value)
        goto_closest = Value
        if Value then
            local current_mob = nil
            repeat
                local mob = closest_mob()
                if mob and mob ~= current_mob then
                    current_mob = mob
                    task.wait(.1)
                    local velocity_connection = run_service.Heartbeat:Connect(function()
                        if local_player.Character and local_player.Character:FindFirstChild("HumanoidRootPart") then
                            local_player.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
                            local_player.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
                        end
                    end)
                    local to = mob:GetPivot().Position
                    local distance = (to - local_player.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude
                    local tween = tween_service:Create(local_player.Character:FindFirstChild("HumanoidRootPart"), TweenInfo.new(distance / 200, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {CFrame = CFrame.new(to + Vector3.new(0, stud_offset, 0))})
                    tween:Play()
                    tween.Completed:Wait()
                    if velocity_connection then
                        velocity_connection:Disconnect()
                    end
                elseif current_mob and current_mob:GetAttribute("HP") > 0 then
                    local_player.Character:MoveTo(current_mob:GetPivot().Position + Vector3.new(0, stud_offset, 0))
                end
                task.wait()
            until not goto_closest
        end
    end
})

game_group:AddSlider('stud_offset_y', {
    Text = 'Stud Offset Y:',
    Default = stud_offset,
    Min = -50,
    Max = 50,
    Rounding = 0,
    Compact = false,

    Callback = function(Value)
        stud_offset = Value
    end
})

player_group:AddDivider()

player_group:AddToggle('tp_walk', {
    Text = 'Tp Walk',
    Default = tp_walk,
    Tooltip = 'Goes fast idk',

    Callback = function(Value)
        tp_walk = Value
    end
})

player_group:AddSlider('tp_walk_speed', {
    Text = 'Tp Walk Speed:',
    Default = tp_walk_speed,
    Min = 1,
    Max = 10,
    Rounding = 0,
    Compact = false,

    Callback = function(Value)
        tp_walk_speed = Value
    end
})

player_group:AddDivider()

player_group:AddToggle('inf_jump', {
    Text = 'Inf Jump',
    Default = inf_jump,
    Tooltip = 'Lets you jump forever',

    Callback = function(Value)
        inf_jump = Value
    end
})

local FrameTimer = tick()
local FrameCounter = 0;
local FPS = 60;

local watermark_connection = run_service.RenderStepped:Connect(function()
    FrameCounter += 1;

    if (tick() - FrameTimer) >= 1 then
        FPS = FrameCounter;
        FrameTimer = tick();
        FrameCounter = 0;
    end;

    library:SetWatermark(('Astolfo Ware | %s fps | %s ms | game: ' .. info.Name .. ''):format(
        math.floor(FPS),
        math.floor(stats.Network.ServerStatsItem['Data Ping']:GetValue())
    ));
end);

menu_group:AddButton('Unload', function()
    goto_closest = false
    auto_start = false
    auto_redo = false
    kill_aura = false
    inf_jump = false
    tp_walk = false
    watermark_connection:Disconnect()
    if velocity_connection then
        velocity_connection:Disconnect()
    end
    speed_connection:Disconnect()
    library:Unload()
end)

menu_group:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' })
library.ToggleKeybind = Options.MenuKeybind
theme_manager:SetLibrary(library)
save_manager:SetLibrary(library)
save_manager:IgnoreThemeSettings()
save_manager:SetIgnoreIndexes({ 'MenuKeybind' })
theme_manager:SetFolder('Astolfo Ware')
save_manager:SetFolder('Astolfo Ware/Dungeon Heroes')
save_manager:BuildConfigSection(tabs['ui settings'])
theme_manager:ApplyToTab(tabs['ui settings'])
save_manager:LoadAutoloadConfig()
