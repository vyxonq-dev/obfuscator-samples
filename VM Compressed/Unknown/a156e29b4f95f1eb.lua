local Players = game:GetService("Players")

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local RunService = game:GetService("RunService")

local UserInputService = game:GetService("UserInputService")

local Workspace = game:GetService("Workspace")

local LP = Players.LocalPlayer

local HRP, Character, Humanoid

local function refreshCharacter()

    Character = LP.Character or LP.CharacterAdded:Wait()

    HRP = Character:WaitForChild("HumanoidRootPart")

    Humanoid = Character:WaitForChild("Humanoid")

end

refreshCharacter()

LP.CharacterAdded:Connect(refreshCharacter)

local MakeOnce = false

local AutoTrain = false

local AutoStartBattle = false

local AutoImproveHealth = false

local AutoImproveProduction = false

local InfJump = false

local AutoHatchEgg = false

local GlobalBoostsOverride = false

local PetBoostMultiplier = false

local SkillBoostEditor = false

local ReGui = loadstring(game:HttpGet("https://raw.githubusercontent.com/depthso/Dear-ReGui/main/ReGui.lua"))()

local UI = ReGui:TabsWindow({Title = "Battle Ages Script l Made by Mjcontegazxc", Size = UDim2.fromOffset(300, 300)})

local TabMain = UI:CreateTab({Name = "Main"})

local mainHeader = TabMain:CollapsingHeader({Title = "Features"})

mainHeader:Checkbox({Label = "Make Once", Value = false, Callback = function(_, v) MakeOnce = v end})

mainHeader:Checkbox({Label = "Auto Train", Value = false, Callback = function(_, v) AutoTrain = v end})

mainHeader:Checkbox({Label = "Auto Start Battle", Value = false, Callback = function(_, v) AutoStartBattle = v end})

mainHeader:Checkbox({Label = "Auto Improve Health", Value = false, Callback = function(_, v) AutoImproveHealth = v end})

mainHeader:Checkbox({Label = "Auto Improve Production", Value = false, Callback = function(_, v) AutoImproveProduction = v end})

mainHeader:Checkbox({Label = "Inf Jump", Value = false, Callback = function(_, v) InfJump = v end})

mainHeader:Checkbox({Label = "Auto Hatch Egg", Value = false, Callback = function(_, v) AutoHatchEgg = v end})

mainHeader:Checkbox({Label = "Global Boosts Override", Value = false, Callback = function(_, v) GlobalBoostsOverride = v end})

mainHeader:Checkbox({Label = "Pet Boost Multiplier", Value = false, Callback = function(_, v) PetBoostMultiplier = v end})

mainHeader:Checkbox({Label = "Skill Boost Editor", Value = false, Callback = function(_, v) SkillBoostEditor = v end})

local BattleEvent = ReplicatedStorage.Signals:WaitForChild("Battle")

local TrainEvent = ReplicatedStorage.Signals:WaitForChild("TrainPlayer")

local ImproveBaseEvent = ReplicatedStorage.Signals:WaitForChild("ImproveBase")

local TutorialsEvent = ReplicatedStorage.Signals:WaitForChild("Tutorials")

local originalFunc = require(game:GetService("ReplicatedStorage").Modules.GetTotalBoosts)

local v_u_2 = require(game.ReplicatedStorage.Settings.Formulas)

local v_u_1 = game.ReplicatedStorage.Skills

task.spawn(function()

    while true do

        if MakeOnce and not task.wait(0.1) then

            pcall(function()

                BattleEvent:FireServer(true, 1)

            end)

            MakeOnce = false

        end

        task.wait(0.1)

    end

end)

task.spawn(function()

    while true do

        if AutoTrain then

            pcall(function()

                TrainEvent:FireServer(1)

            end)

        end

        task.wait(0.1)

    end

end)

task.spawn(function()

    while true do

        if AutoStartBattle then

            pcall(function()

                BattleEvent:FireServer(true, 1)

            end)

        end

        task.wait(0.1)

    end

end)

task.spawn(function()

    while true do

        if AutoImproveHealth then

            pcall(function()

                ImproveBaseEvent:FireServer("Health")

            end)

        end

        task.wait(0.1)

    end

end)

task.spawn(function()

    while true do

        if AutoImproveProduction then

            pcall(function()

                ImproveBaseEvent:FireServer("Production")

            end)

        end

        task.wait(0.1)

    end

end)

RunService.Heartbeat:Connect(function()

    if InfJump and Humanoid and UserInputService:IsKeyDown(Enum.KeyCode.Space) then

        if Humanoid:GetState() == Enum.HumanoidStateType.Freefall then

            Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)

            task.wait(0.05)

        elseif Humanoid:GetState() == Enum.HumanoidStateType.Running or Humanoid:GetState() == Enum.HumanoidStateType.RunningNoPhysics then

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

    while true do

        if AutoHatchEgg then

            pcall(function()

                TutorialsEvent:FireServer("Hatch")

            end)

        end

        task.wait(0.1)

    end

end)

task.spawn(function()

    while true do

        if GlobalBoostsOverride then

            local hackedBoosts = function(playerData)

                local boosts = originalFunc(playerData)

                boosts["All Unit Damage"] = boosts["All Unit Damage"] * 10

                boosts["Coins Gained"] = 5

                return boosts

            end

            debug.setupvalue(originalFunc, 1, hackedBoosts)

        end

        task.wait(0.1)

    end

end)

task.spawn(function()

    while true do

        if PetBoostMultiplier then

            local petBoostsOriginal = v_u_2.PetBoosts

            v_u_2.PetBoosts = function(petId, level)

                local original = petBoostsOriginal(petId, level)

                for k,v in pairs(original) do

                    original[k] = v * 2

                end

                return original

            end

        end

        task.wait(0.1)

    end

end)

task.spawn(function()

    while true do

        if SkillBoostEditor then

            for _,skillData in pairs(v_u_1:GetChildren()) do

                if skillData:GetAttribute("Boost") == "All Unit Damage" then

                    skillData:SetAttribute("BaseValue", 2.0)

                end

            end

        end

        task.wait(0.1)

    end

end)

game.StarterGui:SetCore("SendNotification", {

    Title = "Battle Ages Script l Made by Mjcontegazxc",

    Text = "Loaded!",

    Duration = 5

})