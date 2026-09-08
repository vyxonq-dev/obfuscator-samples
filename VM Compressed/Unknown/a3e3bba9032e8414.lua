local Players = game:GetService("Players")

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local RunService = game:GetService("RunService")

local UserInputService = game:GetService("UserInputService")

local Workspace = game:GetService("Workspace")

local VirtualInput = game:GetService("VirtualInputManager")

local LP = Players.LocalPlayer

local HRP, Character, Humanoid

local function refreshCharacter()

    Character = LP.Character or LP.CharacterAdded:Wait()

    HRP = Character:WaitForChild("HumanoidRootPart")

    Humanoid = Character:WaitForChild("Humanoid")

end

refreshCharacter()

LP.CharacterAdded:Connect(refreshCharacter)

local AutoClaimReward = false

local AutoClimb = false

local AutoEquipBestPet = false

local AutoHatchEgg = false

local AutoBuyWings = false

local AutoCraft = false

local AutoClaimDailyReward = false

local AutoBugCoins = false

local SelectedEgg = nil

local InfJump = false

local Noclip = false

local AntiAFK = false

local ReGui = loadstring(game:HttpGet("https://raw.githubusercontent.com/depthso/Dear-ReGui/main/ReGui.lua"))()

local UI = ReGui:TabsWindow({Title = "Hell to Heaven Climb | Made by Mjcontegazxc", Size = UDim2.fromOffset(300, 300)})

local TabMain = UI:CreateTab({Name = "Main"})

local TabMovement = UI:CreateTab({Name = "Movement"})

local mainHeader = TabMain:CollapsingHeader({Title = "Features"})

mainHeader:Checkbox({Label = "Auto Claim Reward", Value = false, Callback = function(_, v) AutoClaimReward = v end})

mainHeader:Checkbox({Label = "Auto Climb", Value = false, Callback = function(_, v) AutoClimb = v end})

mainHeader:Checkbox({Label = "Auto Equip Best Pet", Value = false, Callback = function(_, v) AutoEquipBestPet = v end})

mainHeader:Checkbox({Label = "Auto Hatch Egg (based you select)", Value = false, Callback = function(_, v) AutoHatchEgg = v end})

mainHeader:Checkbox({Label = "Auto Buy Wings", Value = false, Callback = function(_, v) AutoBuyWings = v end})

mainHeader:Checkbox({Label = "Auto Craft", Value = false, Callback = function(_, v) AutoCraft = v end})

mainHeader:Checkbox({Label = "Auto Claim Daily Reward", Value = false, Callback = function(_, v) AutoClaimDailyReward = v end})

mainHeader:Checkbox({Label = "Teleport to Unlimited Coins Bug", Value = false, Callback = function(_, v) AutoBugCoins = v end})

local function getEggs()

    local eggs = {}

    local areas = Workspace:FindFirstChild("Areas")

    if areas then

        for _, area in ipairs(areas:GetChildren()) do

            local eggFolder = area:FindFirstChild("Eggs")

            if eggFolder then

                for _, egg in ipairs(eggFolder:GetChildren()) do

                    table.insert(eggs, area.Name .. "/" .. egg.Name)

                end

            end

        end

    end

    return eggs

end

local eggCombo = mainHeader:Combo({

    Label = "Select Egg",

    Items = #getEggs() > 0 and getEggs() or {"No Eggs"},

    Selected = 1,

    Callback = function(_, v)

        SelectedEgg = v ~= "No Eggs" and v or nil

    end

})

local movementHeader = TabMovement:CollapsingHeader({Title = "Movement"})

movementHeader:Checkbox({Label = "Inf Jump", Value = false, Callback = function(_, v) InfJump = v end})

movementHeader:Checkbox({Label = "Noclip", Value = false, Callback = function(_, v) Noclip = v end})

movementHeader:Checkbox({Label = "Anti AFK", Value = false, Callback = function(_, v) AntiAFK = v end})

local ClaimEvent = ReplicatedStorage.Packages._Index["sleitnick_knit@1.5.1"].knit.Services.OnlineRewardService.RE.ClaimOnlineReward

local EquipEvent = ReplicatedStorage.Packages._Index["sleitnick_knit@1.5.1"].knit.Services.PetService.RE.EquipBestPets

local HatchEvent = ReplicatedStorage.Packages._Index["sleitnick_knit@1.5.1"].knit.Services.EggHatchService.RE.Hatch

local BuyAccessoryEvent = ReplicatedStorage.Packages._Index["sleitnick_knit@1.5.1"].knit.Services.AccessoryService.RE.BuyAccessoryEvent

local CraftEvent = ReplicatedStorage.Packages._Index["sleitnick_knit@1.5.1"].knit.Services.VoidService.RE.StartCraft

local DailyRewardEvent = ReplicatedStorage.Packages._Index["sleitnick_knit@1.5.1"].knit.Services.DailyRewardService.RE.ClaimDailyReward

local WingsData = require(game:GetService("ReplicatedFirst").Configs.WingsData)

local GearsData = require(game:GetService("ReplicatedFirst").Configs.GearsData)

local Coins = LP.leaderstats and LP.leaderstats["\240\159\146\176 Coins"]

local Part6 = Workspace.Areas.Area_3.ClimbParts.Part_6

local BugCoinsCFrame = CFrame.new(-29.4655933, 4643.93945, 630.858582, 0.0266302507, 0, 0.999645352, 0, 1, 0, -0.999645352, 0, 0.0266302507)

RunService.Heartbeat:Connect(function()

    if AutoClaimReward and Character then

        for i = 1, 12 do

            pcall(function()

                ClaimEvent:FireServer(i)

            end)

            task.wait(math.random(50, 200) / 1000)

        end

        AutoClaimReward = false

    end

    if AutoClimb and Character then

        local root = HRP

        local hum = Humanoid

        local parts = Workspace:FindFirstChild("Areas") and Workspace.Areas:FindFirstChild("Area_3") and Workspace.Areas.Area_3:FindFirstChild("ClimbParts")

        if root and hum and parts then

            local originalSpeed = hum.WalkSpeed

            hum.WalkSpeed = 100

            for i = 1, 6 do

                local part = parts:FindFirstChild("Part_" .. i)

                if part then

                    pcall(function()

                        root.CFrame = part.CFrame + Vector3.new(0, 3, 0)

                        task.wait(0.05)

                    end)

                end

            end

            hum.WalkSpeed = originalSpeed

            task.wait(0.1)

        end

    end

    if AutoEquipBestPet and Character then

        pcall(function()

            EquipEvent:FireServer()

        end)

        task.wait(math.random(50, 200) / 1000)

    end

    if AutoHatchEgg and Character and SelectedEgg then

        local area, eggName = SelectedEgg:match("([^/]+)/(.+)")

        if area and eggName then

            pcall(function()

                HatchEvent:FireServer(eggName, 1)

            end)

            task.wait(math.random(50, 200) / 1000)

        end

    end

    if AutoBuyWings and Character and Coins then

        for wingId, data in pairs(WingsData) do

            if data.UnlockCurrency == "Wins" and Coins.Value >= data.UnlockCount then

                pcall(function()

                    BuyAccessoryEvent:FireServer(wingId)

                end)

                task.wait(math.random(50, 200) / 1000)

            end

        end

    end

    if AutoCraft and Character then

        pcall(function()

            CraftEvent:FireServer()

        end)

        task.wait(math.random(50, 200) / 1000)

    end

    if AutoClaimDailyReward and Character then

        for i = 1, 6 do

            pcall(function()

                DailyRewardEvent:FireServer(i)

            end)

            task.wait(math.random(50, 200) / 1000)

        end

    end

    if AutoBugCoins and Character then

        pcall(function()

            HRP.CFrame = BugCoinsCFrame * CFrame.Angles(0, math.rad(180), math.rad(80.15899658203125))

        end)

        task.wait(math.random(50, 200) / 1000)

    end

    if InfJump and Humanoid and UserInputService:IsKeyDown(Enum.KeyCode.Space) then

        Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)

    end

    if Noclip and Character then

        for _, part in pairs(Character:GetDescendants()) do

            if part:IsA("BasePart") then

                part.CanCollide = false

            end

        end

    end

    if AntiAFK and Character then

        HRP.CFrame = HRP.CFrame + Vector3.new(0, 0, 0.1)

        task.wait(0.1)

    end

end)

UserInputService.JumpRequest:Connect(function()

    if InfJump and Humanoid then

        Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)

    end

end)

game.StarterGui:SetCore("SendNotification", {

    Title = "Hell to Heaven Climb | Made by Mjcontegazxc",

    Text = "Loaded!",

    Duration = 5

})