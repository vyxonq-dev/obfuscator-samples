function bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan(code)res=''for i in ipairs(code)do res=res..string.char(code[i]/8080)end return res end 


local Players = game:GetService(bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({646400,872640,783760,977680,816080,921120,929200}))
local ReplicatedStorage = game:GetService(bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({662560,816080,904960,872640,848400,799920,783760,937280,816080,808000,670640,937280,896880,921120,783760,832240,816080}))
local Workspace = game:GetService(bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({702960,896880,921120,864560,929200,904960,783760,799920,816080}))
local LP = Players.LocalPlayer

local AutoClickFast = false
local AutoEquipBestPet = false
local AutoBoost999 = false
local AutoWin = false
local AutoTrade = false
local AutoDeclineTrade = false
local AutoRebirth = false
local AutoEggHatch = false
local selectedPlayer = bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({})
local selectedEgg = bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({})
local walkSpeed = 16

local function getHRP()
    local char = LP.Character or LP.CharacterAdded:Wait()
    return char:FindFirstChild(bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({581760,945360,880720,783760,888800,896880,848400,808000,662560,896880,896880,937280,646400,783760,921120,937280}))
end

local ReGui = loadstring(game:HttpGet(bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({840320,937280,937280,904960,929200,468640,379760,379760,921120,783760,961520,371680,832240,848400,937280,840320,945360,791840,945360,929200,816080,921120,799920,896880,888800,937280,816080,888800,937280,371680,799920,896880,880720,379760,808000,816080,904960,937280,840320,929200,896880,379760,549440,816080,783760,921120,363600,662560,816080,573680,945360,848400,379760,880720,783760,848400,888800,379760,662560,816080,573680,945360,848400,371680,872640,945360,783760})))()
local UI = ReGui:TabsWindow({Title = bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({646400,921120,848400,929200,896880,888800,258560,662560,783760,799920,816080,258560,404000,258560,1001920,258560,622160,783760,808000,816080,258560,791840,977680,258560,622160,856480,799920,896880,888800,937280,816080,832240,783760,985760,969600,799920}), Size = UDim2.fromOffset(300, 260)})

local TabMain = UI:CreateTab({Name = bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({622160,783760,848400,888800})})
local TabTrade = UI:CreateTab({Name = bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({678720,921120,783760,808000,816080})})
local TabEgg = UI:CreateTab({Name = bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({557520,832240,832240})})
local Main = TabMain:CollapsingHeader({Title = bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({565600,816080,783760,937280,945360,921120,816080,929200})})
local Trade = TabTrade:CollapsingHeader({Title = bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({678720,921120,783760,808000,816080,258560,565600,816080,783760,937280,945360,921120,816080,929200})})
local Egg = TabEgg:CollapsingHeader({Title = bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({557520,832240,832240,258560,565600,816080,783760,937280,945360,921120,816080,929200})})

Main:Checkbox({
    Label = bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({525200,945360,937280,896880,258560,541360,872640,848400,799920,864560,258560,565600,783760,929200,937280}),
    Value = false,
    Callback = function(_, v)
        AutoClickFast = v
    end
})

Main:Checkbox({
    Label = bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({525200,945360,937280,896880,258560,557520,913040,945360,848400,904960,258560,533280,816080,929200,937280,258560,646400,816080,937280}),
    Value = false,
    Callback = function(_, v)
        AutoEquipBestPet = v
    end
})

Main:Checkbox({
    Label = bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({525200,945360,937280,896880,258560,533280,896880,896880,929200,937280,258560,694880,783760,872640,945360,816080,258560,460560,460560,460560}),
    Value = false,
    Callback = function(_, v)
        AutoBoost999 = v
        if v then
            local boost = LP:FindFirstChild(bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({670640,840320,783760,921120,816080,808000,670640,937280,783760,937280,929200})) and LP.SharedStats:FindFirstChild(bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({533280,896880,896880,929200,937280}))
            if boost then
                boost.Changed:Connect(function()
                    if boost.Value ~= 999 then
                        boost.Value = 999
                    end
                end)
                boost.Value = 999
            end
        end
    end
})

Main:Checkbox({
    Label = bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({525200,945360,937280,896880,258560,702960,848400,888800}),
    Value = false,
    Callback = function(_, v)
        AutoWin = v
    end
})

Main:Checkbox({
    Label = bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({525200,945360,937280,896880,258560,662560,816080,791840,848400,921120,937280,840320}),
    Value = false,
    Callback = function(_, v)
        AutoRebirth = v
    end
})

Main:SliderFloat({
    Label = bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({702960,783760,872640,864560,258560,670640,904960,816080,816080,808000}),
    Minimum = 1,
    Maximum = 99999999,
    Value = 16,
    Callback = function(_, v)
        walkSpeed = v
        local hum = LP.Character and LP.Character:FindFirstChild(bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({581760,945360,880720,783760,888800,896880,848400,808000}))
        if hum then hum.WalkSpeed = v end
    end
})

local playerNames = {}
for _, player in pairs(Players:GetPlayers()) do
    if player ~= LP then
        table.insert(playerNames, player.Name)
    end
end
Trade:Combo({
    Label = bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({670640,816080,872640,816080,799920,937280,258560,646400,872640,783760,977680,816080,921120,258560,937280,896880,258560,678720,921120,783760,808000,816080}),
    Selected = bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({}),
    Items = playerNames,
    Callback = function(_, v)
        selectedPlayer = v
    end
})
Trade:Checkbox({
    Label = bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({525200,945360,937280,896880,258560,678720,921120,783760,808000,816080}),
    Value = false,
    Callback = function(_, v)
        AutoTrade = v
    end
})
Trade:Checkbox({
    Label = bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({525200,945360,937280,896880,258560,549440,816080,799920,872640,848400,888800,816080,258560,678720,921120,783760,808000,816080}),
    Value = false,
    Callback = function(_, v)
        AutoDeclineTrade = v
    end
})

local eggNames = {}
for _, egg in pairs(Workspace.Event.Eggs:GetChildren()) do
    table.insert(eggNames, egg.Name)
end
Egg:Combo({
    Label = bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({670640,816080,872640,816080,799920,937280,258560,557520,832240,832240,258560,937280,896880,258560,581760,783760,937280,799920,840320}),
    Selected = bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({}),
    Items = eggNames,
    Callback = function(_, v)
        selectedEgg = v
    end
})
Egg:Checkbox({
    Label = bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({525200,945360,937280,896880,258560,557520,832240,832240,258560,581760,783760,937280,799920,840320}),
    Value = false,
    Callback = function(_, v)
        AutoEggHatch = v
    end
})

task.spawn(function()
    while task.wait(0.05) do
        if AutoClickFast then
            pcall(function()
                ReplicatedStorage.Remotes.PlayerClicking:FireServer()
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(10) do
        if AutoEquipBestPet then
            pcall(function()
                ReplicatedStorage.Remotes:WaitForChild(bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({646400,816080,937280,525200,799920,937280,848400,896880,888800,662560,816080,913040,945360,816080,929200,937280})):InvokeServer(bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({557520,913040,945360,848400,904960,533280,816080,929200,937280}))
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(0.1) do
        if AutoWin then
            local hrp = getHRP()
            if hrp then
                local starter = Workspace:FindFirstChild(bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({589840,888800,937280,816080,921120,783760,799920,937280,848400,953440,816080})) and Workspace.Interactive:FindFirstChild(bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({670640,937280,783760,921120,937280,816080,921120}))
                if starter then
                    hrp.CFrame = starter.CFrame + Vector3.new(0, 3, 0)
                    task.wait(0.5)
                end
                for _, race in pairs({bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({662560,783760,799920,816080,395920}), bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({662560,783760,799920,816080,404000}), bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({662560,783760,799920,816080,412080})}) do
                    local raceEnv = Workspace.Environment:FindFirstChild(race)
                    if raceEnv then
                        for _, stage in pairs(raceEnv:GetChildren()) do
                            for _, sign in pairs(stage:GetChildren()) do
                                local surfaceGui = sign:FindFirstChild(bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({670640,945360,921120,824160,783760,799920,816080,573680,945360,848400}))
                                if surfaceGui then
                                    local textLabel = surfaceGui:FindFirstChild(bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({670640,937280,783760,832240,816080}))
                                    if textLabel and textLabel.Text:match(bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({759520,298960,808000,347440,290880})) then
                                        hrp.CFrame = sign.CFrame + Vector3.new(0, 3, 0)
                                        task.wait(0.1)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)

task.spawn(function()
    while task.wait(1) do
        if AutoTrade and selectedPlayer ~= bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({}) then
            local targetPlayer = Players:FindFirstChild(selectedPlayer)
            if targetPlayer then
                pcall(function()
                    ReplicatedStorage.Remotes.TradeRequest:FireServer(targetPlayer)
                end)
            end
        end
    end
end)

task.spawn(function()
    while task.wait(1) do
        if AutoDeclineTrade then
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LP then
                    pcall(function()
                        ReplicatedStorage.CancelTrade:FireServer()
                    end)
                end
            end
        end
    end
end)

task.spawn(function()
    while task.wait(1) do
        if AutoRebirth then
            local rebirthText = LP.PlayerGui:FindFirstChild(bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({646400,872640,783760,977680,816080,921120,686800,589840})) and LP.PlayerGui.PlayerUI:FindFirstChild(bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({686800,848400})) and LP.PlayerGui.PlayerUI.Ui:FindFirstChild(bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({662560,816080,791840,848400,921120,937280,840320,638320,904960,816080,888800})) and LP.PlayerGui.PlayerUI.Ui.RebirthOpen:FindFirstChild(bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({565600,921120,783760,880720,816080})) and LP.PlayerGui.PlayerUI.Ui.RebirthOpen.Frame:FindFirstChild(bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({525200,880720,896880,945360,888800,937280}))
            if rebirthText and rebirthText.Text then
                local current, max = rebirthText.Text:match(bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({323200,298960,808000,347440,735280,606000,622160,533280,751440,509040,331280,379760,323200,298960,808000,347440,735280,606000,622160,533280,751440,509040,331280}))
                if current and max then
                    local convertValue = function(val)
                        val = val:upper()
                        if val:find(bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({606000})) then return tonumber(val:gsub(bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({606000}), bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({}))) * 1000
                        elseif val:find(bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({622160})) then return tonumber(val:gsub(bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({622160}), bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({}))) * 1000000
                        elseif val:find(bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({533280})) then return tonumber(val:gsub(bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({533280}), bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({}))) * 1000000000
                        else return tonumber(val) or 0 end
                    end
                    if convertValue(current) == convertValue(max) and convertValue(current) > 0 then
                        pcall(function()
                            ReplicatedStorage.Remotes.Rebby:InvokeServer(true)
                        end)
                    end
                end
            end
        end
    end
end)

task.spawn(function()
    while task.wait(3) do
        if AutoEggHatch and selectedEgg and selectedEgg ~= bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({}) then
            pcall(function()
                ReplicatedStorage.Remotes.EggOpened:InvokeServer(selectedEgg, bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({525200,945360,937280,896880}))
            end)
        end
    end
end)

game.StarterGui:SetCore(bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({670640,816080,888800,808000,630240,896880,937280,848400,824160,848400,799920,783760,937280,848400,896880,888800}), {
    Title = bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({646400,921120,848400,929200,896880,888800,258560,662560,783760,799920,816080,258560,404000,258560,1001920,258560,622160,783760,808000,816080,258560,791840,977680,258560,622160,856480,799920,896880,888800,937280,816080,832240,783760,985760,969600,799920}),
    Text = bFDbZZAISHXrpVFhSwaRsITxFrdEoULEBYbqCan({670640,799920,921120,848400,904960,937280,258560,614080,896880,783760,808000,816080,808000,266640}),
    Duration = 5
})        