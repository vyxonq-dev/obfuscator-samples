local v1 = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local v2 = v1:CreateWindow({
    Name = 'Bad cat',
    Icon = 0,
    LoadingTitle = 'manipulating the Values',
    LoadingSubtitle = 'Follow me on TikTok Mr_3242',
    Theme = 'Dark',
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = {
        Enabled = false,
    },
})

local _Main = v2:CreateTab('Main', 4483362458)

v1:Notify({
    Title = 'Loaded',
    Content = 'The Cheat Has Loaded',
    Duration = 3,
    Image = 4483362458,
})

_Main:CreateButton({
    Name = "Set objects' HP to 0",
    Callback = function()
        local v4, v5, v6 = pairs(game.workspace.Replicated:GetDescendants())

        while true do
            local v7
            v6, v7 = v4(v5, v6)

            if v6 == nil then
                break
            end
            if v7.Name == 'Strength' then
                v7.Value = 0
            end
        end
    end,
})

_Main:CreateInput({
    Name = 'Input Amount of points u want the objects to Give u',
    CurrentValue = '',
    PlaceholderText = 'Input Placeholder',
    RemoveTextAfterFocusLost = false,
    Flag = 'Input1',
    Callback = function(p8)
        local v9, v10, v11 = pairs(game.workspace.Replicated:GetDescendants())

        while true do
            local v12
            v11, v12 = v9(v10, v11)

            if v11 == nil then
                break
            end
            if v12.Name == 'Points' then
                v12.Value = p8
            end
        end
    end,
})

_Main:CreateDivider()

_Main:CreateSlider({
    Name = 'WalkSpeed',
    Range = {0, 250},
    Increment = 1,
    Suffix = 'Speed',
    CurrentValue = 32,
    Flag = 'Slider1',
    Callback = function(p13)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = p13
    end,
})

v2:CreateTab('Teleport', 4483362458):CreateButton({
    Name = 'Teleport to level1/spawn',
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(674, 5, 577)
    end,
})

v2:CreateTab('Other', 4483362458):CreateButton({
    Name = 'Delete Vip Area Walls',
    Callback = function()
        local v14, v15, v16 = pairs(game.workspace.VIPBarriers:GetDescendants())

        while true do
            local v17
            v16, v17 = v14(v15, v16)

            if v16 == nil then
                break
            end

            v17:Destroy()
        end
    end,
})