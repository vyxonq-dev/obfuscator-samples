local Players = game:GetService("Players")

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Workspace = game:GetService("Workspace")

local UserInputService = game:GetService("UserInputService")

local LP = Players.LocalPlayer

local HRP = LP.Character and LP.Character:WaitForChild("HumanoidRootPart")

local Humanoid = LP.Character and LP.Character:WaitForChild("Humanoid")

LP.CharacterAdded:Connect(function(char)

    HRP = char:WaitForChild("HumanoidRootPart")

    Humanoid = char:WaitForChild("Humanoid")

end)

local AutoCollectEggs = false

local AutoEquipBestPet = false

local AutoClaimDailyRewards = false

local AutoDupeEggs = false

local AutoSell100 = false

local AutoSellAlways = false

local AntiAFK = false

local InfJump = false

local Noclip = false

local Walkspeed60 = false

local ReGui = loadstring(game:HttpGet("https://raw.githubusercontent.com/depthso/Dear-ReGui/main/ReGui.lua"))()

local UI = ReGui:TabsWindow({Title = "Egg Farm Tycoon | Made by Mjcontegazxc", Size = UDim2.fromOffset(300, 250)})

local TabMain = UI:CreateTab({Name = "Main"})

local TabMovement = UI:CreateTab({Name = "Movement"})

local mainHeader = TabMain:CollapsingHeader({Title = "Features"})

mainHeader:Checkbox({Label = "Auto Collect Eggs", Value = false, Callback = function(_, v) AutoCollectEggs = v end})

mainHeader:Checkbox({Label = "Auto Equip Best Pet", Value = false, Callback = function(_, v) AutoEquipBestPet = v end})

mainHeader:Checkbox({Label = "Auto Claim Daily Rewards", Value = false, Callback = function(_, v) AutoClaimDailyRewards = v end})

mainHeader:Checkbox({Label = "Dupe Eggs", Value = false, Callback = function(_, v) AutoDupeEggs = v end})

mainHeader:Checkbox({Label = "Auto Sell when 100 eggs", Value = false, Callback = function(_, v) AutoSell100 = v end})

mainHeader:Checkbox({Label = "Auto Sell Always", Value = false, Callback = function(_, v) AutoSellAlways = v end})

mainHeader:Checkbox({Label = "Anti AFK", Value = false, Callback = function(_, v) AntiAFK = v end})

local movementHeader = TabMovement:CollapsingHeader({Title = "Movement"})

movementHeader:Checkbox({Label = "Inf Jump", Value = false, Callback = function(_, v) InfJump = v end})

movementHeader:Checkbox({Label = "Noclip", Value = false, Callback = function(_, v) Noclip = v end})

movementHeader:Checkbox({Label = "Walkspeed 60", Value = false, Callback = function(_, v) Walkspeed60 = v end})

local CollectItemEvent = ReplicatedStorage.RF.CollectItem

local PetFunctionEvent = ReplicatedStorage.RF.PetFunction

local ExtraPTEvent = ReplicatedStorage.RF.ExtraPT

local OwnTycoon = nil

local function findOwnTycoon()

    for _, tycoon in pairs(Workspace.Tycoons:GetChildren()) do

        local debris = tycoon:FindFirstChild("ItemDebris")

        if debris then

            for _, obj in pairs(debris:GetChildren()) do

                if obj:IsA("Instance") and obj:FindFirstChild("OwnedBy") and tostring(obj.OwnedBy.Value) == LP.Name then

                    return tycoon

                end

            end

        end

    end

    return nil

end

OwnTycoon = findOwnTycoon()

task.spawn(function()

    while task.wait(0.2) do

        if AutoCollectEggs and HRP and OwnTycoon then

            local debris = OwnTycoon:FindFirstChild("ItemDebris")

            if debris then

                for _, egg in pairs(debris:GetChildren()) do

                    if egg:IsA("BasePart") then

                        HRP.CFrame = egg.CFrame + Vector3.new(0, 3, 0)

                        task.wait(0.12)

                        if not AutoCollectEggs then break end

                    end

                end

            end

        end

    end

end)

task.spawn(function()

    while task.wait(0.5) do

        if (AutoSell100 or AutoSellAlways) and HRP and OwnTycoon then

            local eggLabel = LP:FindFirstChild("PlayerGui")

                and LP.PlayerGui:FindFirstChild("FDN")

                and LP.PlayerGui.FDN:FindFirstChild("NewLeftSide")

                and LP.PlayerGui.FDN.NewLeftSide:FindFirstChild("EggFrame")

                and LP.PlayerGui.FDN.NewLeftSide.EggFrame:FindFirstChild("EggLabel")

            local sellPad = OwnTycoon:FindFirstChild("SellPad")

            if sellPad and eggLabel then

                local text = eggLabel.Text:match("%d+")

                if text and (tonumber(text) >= 100 or AutoSellAlways) then

                    for _, part in pairs(sellPad:GetDescendants()) do

                        if part.ClassName == "Part" then

                            local original = HRP.Position

                            HRP.CFrame = part.CFrame + Vector3.new(0, 3, 0)

                            task.wait(1)

                            HRP.CFrame = CFrame.new(original)

                            break

                        end

                    end

                end

            end

        end

    end

end)

task.spawn(function()

    while task.wait(0.1) do

        if AutoEquipBestPet then

            pcall(function()

                PetFunctionEvent:InvokeServer("EquipBest")

            end)

        end

    end

end)

task.spawn(function()

    while task.wait(0.1) do

        if AutoClaimDailyRewards then

            for i = 1, 7 do

                pcall(function()

                    ExtraPTEvent:InvokeServer("DailyReward", i)

                end)

            end

        end

    end

end)

task.spawn(function()

    while task.wait(0.1) do

        if AntiAFK and HRP then

            HRP.CFrame = HRP.CFrame + Vector3.new(0, 0, 0.1)

        end

    end

end)

task.spawn(function()

    while task.wait() do

        if InfJump and Humanoid and UserInputService:IsKeyDown(Enum.KeyCode.Space) then

            Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)

        end

    end

end)

UserInputService.JumpRequest:Connect(function()

    if InfJump and Humanoid then

        Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)

    end

end)

task.spawn(function()

    while task.wait(0.1) do

        if Noclip and LP.Character then

            for _, part in pairs(LP.Character:GetDescendants()) do

                if part:IsA("BasePart") then

                    part.CanCollide = false

                end

            end

        end

    end

end)

task.spawn(function()

    while task.wait() do

        if Humanoid then

            Humanoid.WalkSpeed = Walkspeed60 and 60 or 16

        end

    end

end)

game.StarterGui:SetCore("SendNotification", {

    Title = "Egg Farm Tycoon | Made by Mjcontegazxc",

    Text = "Loaded!",

    Duration = 5

})