local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LP = Players.LocalPlayer

local AutoClaimDailyReward = false
local AutoClaimOnlineReward = false
local AutoEggHatch = false
local AutoEquipBestPet = false
local AutoTrain = false
local AutoRebirth = false
local AutoSkillAttack = false
local AutoAttack = false
local AutoTPPlayers = false
local selectedEgg = ""
local walkSpeed = 16

local KnitServices = ReplicatedStorage.Packages._Index["sleitnick_knit@1.5.1"].knit.Services

local function getHRP()
    local char = LP.Character or LP.CharacterAdded:Wait()
    return char:FindFirstChild("HumanoidRootPart")
end

local ReGui = loadstring(game:HttpGet("https://raw.githubusercontent.com/depthso/Dear-ReGui/main/ReGui.lua"))()
local UI = ReGui:TabsWindow({Title = "Push-Up Training Simulator | Made by Mjcontegazxc", Size = UDim2.fromOffset(300, 300)})

local TabMain = UI:CreateTab({Name = "Main"})
local TabEgg = UI:CreateTab({Name = "Egg"})
local Main = TabMain:CollapsingHeader({Title = "Features"})
local Egg = TabEgg:CollapsingHeader({Title = "Egg Features"})

Main:Checkbox({
    Label = "Auto Claim Daily Reward",
    Value = false,
    Callback = function(_, v)
        AutoClaimDailyReward = v
    end
})

Main:Checkbox({
    Label = "Auto Claim Online Reward",
    Value = false,
    Callback = function(_, v)
        AutoClaimOnlineReward = v
    end
})

Main:Checkbox({
    Label = "Auto Train",
    Value = false,
    Callback = function(_, v)
        AutoTrain = v
        if v then
            KnitServices.MainService.RE.ChangeActionMode:FireServer("Train")
        end
    end
})

Main:Checkbox({
    Label = "Auto Rebirth",
    Value = false,
    Callback = function(_, v)
        AutoRebirth = v
    end
})

Main:Checkbox({
    Label = "Auto Skill Attack",
    Value = false,
    Callback = function(_, v)
        AutoSkillAttack = v
    end
})

Main:Checkbox({
    Label = "Auto Attack",
    Value = false,
    Callback = function(_, v)
        AutoAttack = v
        if v then
            KnitServices.MainService.RE.ChangeActionMode:FireServer("Attack")
        end
    end
})

Main:Checkbox({
    Label = "TP All Players in Front",
    Value = false,
    Callback = function(_, v)
        AutoTPPlayers = v
    end
})

Main:SliderFloat({
    Label = "Walk Speed",
    Minimum = 16,
    Maximum = 100,
    Value = 16,
    Callback = function(_, v)
        walkSpeed = v
        local hum = LP.Character and LP.Character:FindFirstChild("Humanoid")
        if hum then hum.WalkSpeed = v end
    end
})

Main:Button({
    Text = "Claim All Codes",
    Callback = function()
        local codes = {"LIKE100K", "NEW", "RELEASE", "LIKE14K"}
        for _, code in pairs(codes) do
            KnitServices.CodesService.RF.RedeemItem:InvokeServer(code)
        end
    end
})

Egg:Combo({
    Label = "Select Egg to Hatch",
    Selected = "",
    Items = {"Egg_1_1", "Egg_1_2", "Egg_1_3", "Egg_1_4", "Egg_2_1", "Egg_2_2"},
    Callback = function(_, v)
        selectedEgg = v
    end
})

Egg:Checkbox({
    Label = "Auto Egg Hatch",
    Value = false,
    Callback = function(_, v)
        AutoEggHatch = v
    end
})

Egg:Checkbox({
    Label = "Auto Equip Best Pet",
    Value = false,
    Callback = function(_, v)
        AutoEquipBestPet = v
    end
})

task.spawn(function()
    while task.wait(0.01) do
        if AutoTrain then
            KnitServices.TrainService.RE.Train:FireServer()
        end
    end
end)

task.spawn(function()
    while task.wait(3) do
        if AutoRebirth then
            KnitServices.RebirthService.RF.Rebirth:InvokeServer()
        end
    end
end)

task.spawn(function()
    while task.wait(0.01) do
        if AutoSkillAttack then
            KnitServices.FightService.RE.SkillAttack:FireServer()
        end
        if AutoAttack then
            KnitServices.FightService.RE.Attack:FireServer()
        end
    end
end)

task.spawn(function()
    while task.wait(0.1) do
        if AutoTPPlayers then
            local hrp = getHRP()
            if hrp then
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= LP and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        player.Character.HumanoidRootPart.CFrame = hrp.CFrame + hrp.CFrame.LookVector * 5 + Vector3.new(0, 0, -2)
                    end
                end
            end
        end
        if AutoEggHatch and selectedEgg ~= "" then
            KnitServices.EggHatchService.RE.Hatch:FireServer(selectedEgg, 1)
        end
        if AutoEquipBestPet then
            KnitServices.PetService.RE.EquipBestPets:FireServer()
        end
        if AutoClaimDailyReward then
            for i = 1, 6 do
                KnitServices.DailyRewardService.RE.ClaimDailyReward:FireServer(i)
            end
        end
        if AutoClaimOnlineReward then
            for i = 1, 12 do
                KnitServices.OnlineRewardService.RE.ClaimOnlineReward:FireServer(i)
            end
        end
    end
end)

game.StarterGui:SetCore("SendNotification", {
    Title = "Push-Up Training Simulator | Made by Mjcontegazxc",
    Text = "Script Loaded!",
    Duration = 5
})