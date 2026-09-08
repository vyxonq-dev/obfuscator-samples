local p = game:GetService("Players")

local lp = p.LocalPlayer

local ws = game:GetService("Workspace")

local rep = game:GetService("ReplicatedStorage")

local rs = game:GetService("RunService")

local g = loadstring(game:HttpGet("https://raw.githubusercontent.com/depthso/Dear-ReGui/main/ReGui.lua"))()

local w = g:TabsWindow({

    Title = "Main Hub",

    Size = UDim2.fromOffset(350, 250),

    Position = UDim2.fromScale(0.05, 0.05),

    AnchorPoint = Vector2.new(0, 0)

})

local t = w:CreateTab({ Name = "Main" })

local tp = w:CreateTab({ Name = "Teleport" })

local race = w:CreateTab({ Name = "Race" })

local a1, a2, a3, a4, a5, a6, a7, a8, a9 = false, false, false, false, false, false, false, false, false

local autoRace9 = false

local autoTradeSpam = false

local selectedEgg = "1"

local selectedRace = "1"

local selectedTradePlayer = nil

local autoFinishAllRaces = false

local raceList = {"1","2","3","4","5","6","7","8","9"}

t:Checkbox({ Label = "Auto Click", Value = false, Callback = function(_, v) a1 = v end })

t:Checkbox({ Label = "Auto Click During Race", Value = false, Callback = function(_, v) a2 = v end })

t:Checkbox({ Label = "Auto Ascend", Value = false, Callback = function(_, v) a3 = v end })

t:Checkbox({ Label = "Auto Equip Best Pet", Value = false, Callback = function(_, v) a4 = v end })

t:Checkbox({ Label = "Auto TP All Food Pickups", Value = false, Callback = function(_, v) a5 = v end })

t:Checkbox({ Label = "Auto Collect Rewards 1-12", Value = false, Callback = function(_, v) a6 = v end })

t:Checkbox({ Label = "Auto Hatch Egg", Value = false, Callback = function(_, v) a7 = v end })

t:Combo({

    Label = "Select Egg ID",

    Selected = "1",

    Items = {"1","2","3","4","5","6","7"},

    Callback = function(_, v) selectedEgg = v end

})

tp:Checkbox({ Label = "Auto Farm Race 9 Only", Value = false, Callback = function(_, v) autoRace9 = v end })

tp:Combo({

    Label = "Select Player to Trade Spam",

    Selected = "",

    Items = table.pack(unpack(table.move(p:GetPlayers(), 1, #p:GetPlayers(), 1, {}))),

    Callback = function(_, v)

        for _, player in ipairs(p:GetPlayers()) do

            if player.Name == v then

                selectedTradePlayer = player

            end

        end

    end

})

tp:Checkbox({ Label = "Auto Trade Spam Selected", Value = false, Callback = function(_, v) autoTradeSpam = v end })

race:Checkbox({ Label = "Auto Finish Race", Value = false, Callback = function(_, v) a8 = v end })

race:Checkbox({ Label = "Auto Race Start + Finish", Value = false, Callback = function(_, v) a9 = v end })

race:Checkbox({ Label = "Auto Finish All Races", Value = false, Callback = function(_, v) autoFinishAllRaces = v end })

race:Combo({

    Label = "Select Race ID",

    Selected = "1",

    Items = raceList,

    Callback = function(_, v) selectedRace = v end

})

rs.Heartbeat:Connect(function()

    if a1 then rep.Events.DamageIncreaseOnClickEvent:FireServer() end

    if a2 then rep.Events.RaceEvents.ClickedDuringRace:FireServer() end

    if a3 then rep.Events.AscendEvent:FireServer(true) end

end)

task.spawn(function()

    while true do

        if a4 then rep.Events.EquipBest:FireServer() end

        task.wait(120)

    end

end)

task.spawn(function()

    while true do

        if a5 and lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then

            for _, z in pairs(ws.Worlds:GetChildren()) do

                local f = z:FindFirstChild("FoodPickups")

                if f then

                    for _, v in pairs(f:GetChildren()) do

                        if v:IsA("BasePart") then

                            lp.Character.HumanoidRootPart.CFrame = v.CFrame + Vector3.new(0, 3, 0)

                            task.wait(0.2)

                        end

                    end

                end

            end

        end

        task.wait(5)

    end

end)

task.spawn(function()

    while true do

        if a6 then

            for i = 1, 12 do

                rep.Events.PlaytimeRewardUpdateEvent:FireServer(tostring(i))

                task.wait(0.2)

            end

        end

        task.wait(10)

    end

end)

task.spawn(function()

    while true do

        if a7 then

            rep.Events.PlayerPressedKeyOnEgg:FireServer(selectedEgg, true)

        end

        task.wait(1)

    end

end)

task.spawn(function()

    while true do

        if a8 and lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then

            local race = ws:FindFirstChild("RaceModels"):FindFirstChild(selectedRace)

            if race and race:FindFirstChild("FinishLines") then

                local finish = race.FinishLines:FindFirstChildWhichIsA("BasePart")

                if finish then

                    lp.Character.HumanoidRootPart.CFrame = finish.CFrame + Vector3.new(0, 5, 0)

                end

            end

        end

        task.wait(2)

    end

end)

task.spawn(function()

    while true do

        if a9 and lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then

            local race = ws:FindFirstChild("RaceModels"):FindFirstChild(selectedRace)

            if race then

                local start = race:FindFirstChild("StartPart")

                local finishFolder = race:FindFirstChild("FinishLines")

                local finish = finishFolder and finishFolder:FindFirstChildWhichIsA("BasePart")

                local timeGui = start and start:FindFirstChild("Attachment") and start.Attachment:FindFirstChild("BillboardGui") and start.Attachment.BillboardGui:FindFirstChild("Frame") and start.Attachment.BillboardGui.Frame:FindFirstChild("TimeLeft")

                if start and finish and timeGui and timeGui:IsA("TextLabel") then

                    local text = timeGui.Text

                    local sec = text:match("Starting in (%d+)s")

                    if sec and tonumber(sec) <= 5 then

                        lp.Character.HumanoidRootPart.CFrame = start.CFrame + Vector3.new(0, 5, 0)

                        task.wait(3)

                        lp.Character.HumanoidRootPart.CFrame = finish.CFrame + Vector3.new(0, 5, 0)

                    end

                end

            end

        end

        task.wait(0.5)

    end

end)

task.spawn(function()

    while true do

        if autoRace9 and lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then

            local race9 = ws:FindFirstChild("RaceModels"):FindFirstChild("9")

            if race9 then

                local start = race9:FindFirstChild("StartLines")

                local finish = race9:FindFirstChild("FinishLines")

                if start and finish then

                    lp.Character.HumanoidRootPart.CFrame = start.CFrame + Vector3.new(0, 5, 0)

                    task.wait(1)

                    lp.Character.HumanoidRootPart.CFrame = finish.CFrame + Vector3.new(0, 5, 0)

                end

            end

        end

        task.wait(2)

    end

end)

task.spawn(function()

    while true do

        if autoFinishAllRaces and lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then

            for _, raceId in ipairs(raceList) do

                local race = ws:FindFirstChild("RaceModels"):FindFirstChild(raceId)

                if race and race:FindFirstChild("FinishLines") then

                    local finish = race.FinishLines:FindFirstChildWhichIsA("BasePart")

                    if finish then

                        lp.Character.HumanoidRootPart.CFrame = finish.CFrame + Vector3.new(0, 5, 0)

                        task.wait(1)

                    end

                end

            end

        end

        task.wait(5)

    end

end)

task.spawn(function()

    while true do

        if autoTradeSpam and selectedTradePlayer then

            rep.Events.SendTradeInvite:FireServer(selectedTradePlayer)

        end

        task.wait(1)

    end

end)