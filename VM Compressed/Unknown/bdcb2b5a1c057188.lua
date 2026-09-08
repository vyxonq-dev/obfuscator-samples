local Players = game:GetService("Players")

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local RunService = game:GetService("RunService")

local UserInputService = game:GetService("UserInputService")

local Workspace = game:GetService("Workspace")

local LP = Players.LocalPlayer

local HRP, Humanoid

local function refreshCharacter()

    local char = LP.Character or LP.CharacterAdded:Wait()

    HRP = char:WaitForChild("HumanoidRootPart")

    Humanoid = char:WaitForChild("Humanoid")

end

refreshCharacter()

LP.CharacterAdded:Connect(refreshCharacter)

local function GetRemote(name)

    return ReplicatedStorage:FindFirstChild("Remote") and ReplicatedStorage.Remote:FindFirstChild(name)

end

local BulletRemote = GetRemote("GetDropRemote")

local ButtonPressRemote = GetRemote("ButtonPressRemote")

local AutoCollect = false

local AbuseBullets = false

local AutoDeposit = false

local OneHit = false

local AutoCollectMoney = false

local Noclip = false

local InfJump = false

local TeleportAll = false

local AutoOpenGate = false

local originalPosition = nil

local originalCFrame = nil

local function GetTycoon()

    for _, tycoon in pairs(Workspace.Tycoon.Tycoons:GetChildren()) do

        if tycoon:FindFirstChild("Owner") and tycoon.Owner.Value == LP then

            return tycoon

        end

    end

    return nil

end

local function GetAK47()

    return LP.Backpack:FindFirstChild("AK-47") or (LP.Character and LP.Character:FindFirstChild("AK-47"))

end

local function ModifyWeapon()

    local ak47 = GetAK47()

    if ak47 and ak47:FindFirstChild("Configuration") then

        ak47.Configuration.Damage.Value = OneHit and math.huge or 1000

        ak47.Configuration.ReloadTime.Value = 0

    end

end

local function GetValidTargets()

    local targets = {}

    if Workspace:FindFirstChild("Enemy") then

        for _, enemy in pairs(Workspace.Enemy:GetChildren()) do

            if enemy:FindFirstChild("Humanoid") and (enemy:FindFirstChild("Head") or enemy:FindFirstChild("HumanoidRootPart") or enemy:FindFirstChild("AR")) then

                table.insert(targets, enemy)

            end

        end

    end

    if Workspace:FindFirstChild("Boss") then

        for _, boss in pairs(Workspace.Boss:GetChildren()) do

            if boss:FindFirstChild("Humanoid") and (boss:FindFirstChild("Head") or boss:FindFirstChild("HumanoidRootPart")) then

                table.insert(targets, boss)

            end

        end

    end

    for _, player in pairs(Players:GetPlayers()) do

        if player.Character and player.Character:FindFirstChild("Humanoid") then

            table.insert(targets, player.Character)

        end

    end

    return targets

end

local weaponList = {}

local WeaponsFolder = ReplicatedStorage:FindFirstChild("Weapons")

if WeaponsFolder then

    for _, tool in pairs(WeaponsFolder:GetChildren()) do

        if tool.Name == "AK-47" then

            table.insert(weaponList, tool.Name)

        end

    end

end

local selectedWeapon = weaponList[1] or "AK-47"

local ReGui = loadstring(game:HttpGet("https://raw.githubusercontent.com/depthso/Dear-ReGui/main/ReGui.lua"))()

local UI = ReGui:TabsWindow({

    Title = "Ultimate Game Tools",

    Size = UDim2.fromOffset(300, 350),

    Position = UDim2.fromOffset(50, 50),

})

local TabMain = UI:CreateTab({ Name = "Main" })

local TabCombat = UI:CreateTab({ Name = "Combat" })

local TabMovement = UI:CreateTab({ Name = "Movement" })

local TabTools = UI:CreateTab({ Name = "Tools" })

local mainHeader = TabMain:CollapsingHeader({ Title = "Main Features" })

mainHeader:Checkbox({

    Label = "Auto Collect Bullets",

    Value = false,

    Callback = function(_, v)

        AutoCollect = v

        if v and BulletRemote then

            task.spawn(function()

                while AutoCollect do

                    pcall(function()

                        BulletRemote:FireServer(1)

                    end)

                    task.wait(1)

                end

            end)

        end

    end

})

mainHeader:Checkbox({

    Label = "Abuse Bullet Collect",

    Value = false,

    Callback = function(_, v)

        AbuseBullets = v

        if v and BulletRemote then

            task.spawn(function()

                while AbuseBullets do

                    for _ = 1, 10 do

                        pcall(function()

                            BulletRemote:FireServer(1)

                        end)

                        task.wait(0.1)

                    end

                    task.wait(0.5)

                end

            end)

        end

    end

})

mainHeader:Checkbox({

    Label = "Auto Deposit Bullets",

    Value = false,

    Callback = function(_, v)

        AutoDeposit = v

        if v and ButtonPressRemote then

            if HRP then

                originalPosition = HRP.Position

                originalCFrame = HRP.CFrame

            end

            local tycoon = GetTycoon()

            if tycoon then

                local depositZone = tycoon:FindFirstChild("Buttons_E") and tycoon.Buttons_E:FindFirstChild("Put") and tycoon.Buttons_E.Put:FindFirstChild("Zone")

                if depositZone and HRP then

                    HRP.CFrame = depositZone.CFrame * CFrame.new(0, 3, 0)

                end

            end

            task.spawn(function()

                while AutoDeposit do

                    pcall(function()

                        ButtonPressRemote:FireServer("Put")

                    end)

                    task.wait(2)

                end

                if originalPosition and HRP then

                    HRP.CFrame = originalCFrame

                end

            end)

        end

    end

})

mainHeader:Checkbox({

    Label = "Auto Collect Money",

    Value = false,

    Callback = function(_, v)

        AutoCollectMoney = v

        if v then

            task.spawn(function()

                while AutoCollectMoney do

                    if HRP then

                        for _, money in pairs(Workspace:GetChildren()) do

                            if (money.Name == "Money" or money.Name == "RewardMoney") and money:IsA("Part") then

                                HRP.CFrame = money.CFrame * CFrame.new(0, 3, 0)

                                task.wait(0.3)

                            end

                        end

                    end

                    task.wait(1)

                end

            end)

        end

    end

})

mainHeader:Checkbox({

    Label = "Auto Open Gate",

    Value = false,

    Callback = function(_, v)

        AutoOpenGate = v

        if v then

            task.spawn(function()

                while AutoOpenGate do

                    local tycoon = GetTycoon()

                    if tycoon then

                        local openBtn = tycoon:FindFirstChild("Essentials") and tycoon.Essentials:FindFirstChild("TycoonGate") and tycoon.Essentials.TycoonGate:FindFirstChild("OpenBtn")

                        if openBtn and openBtn:FindFirstChild("ClickDetector") then

                            fireclickdetector(openBtn.ClickDetector)

                        end

                    end

                    task.wait(2)

                end

            end)

        end

    end

})

local combatHeader = TabCombat:CollapsingHeader({ Title = "Combat Features" })

combatHeader:Checkbox({

    Label = "One Hit Kill for AK only",

    Value = false,

    Callback = function(_, v)

        OneHit = v

        ModifyWeapon()

    end

})

combatHeader:Checkbox({

    Label = "Teleport All",

    Value = false,

    Callback = function(_, v)

        TeleportAll = v

    end

})

local toolsHeader = TabTools:CollapsingHeader({ Title = "Tools" })

toolsHeader:Combo({

    Label = "Select Weapon",

    Selected = selectedWeapon,

    Items = weaponList,

    Callback = function(_, v) selectedWeapon = v end

})

toolsHeader:Button({

    Text = "Give Weapon",

    Callback = function()

        local tool = WeaponsFolder and WeaponsFolder:FindFirstChild(selectedWeapon)

        if tool then

            tool:Clone().Parent = LP.Backpack

        end

    end

})

local moveHeader = TabMovement:CollapsingHeader({ Title = "Movement Features" })

moveHeader:SliderFloat({

    Label = "WalkSpeed",

    Minimum = 16,

    Maximum = 200,

    Value = 16,

    Callback = function(_, v)

        if Humanoid then

            Humanoid.WalkSpeed = v

        end

    end

})

moveHeader:SliderFloat({

    Label = "JumpPower",

    Minimum = 50,

    Maximum = 300,

    Value = 50,

    Callback = function(_, v)

        if Humanoid then

            Humanoid.JumpPower = v

        end

    end

})

moveHeader:Checkbox({

    Label = "Infinite Jump",

    Value = false,

    Callback = function(_, v)

        InfJump = v

    end

})

moveHeader:Checkbox({

    Label = "Noclip",

    Value = false,

    Callback = function(_, v)

        Noclip = v

    end

})

RunService.Heartbeat:Connect(function()

    if TeleportAll and HRP then

        for _, target in pairs(GetValidTargets()) do

            local targetHRP = target:FindFirstChild("HumanoidRootPart") or target:FindFirstChild("AR") or target.PrimaryPart

            if targetHRP then

                targetHRP.CFrame = HRP.CFrame * CFrame.new(0, 0, -3)

            end

        end

        task.wait(1)

    end

end)

UserInputService.JumpRequest:Connect(function()

    if InfJump and Humanoid then

        Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)

    end

end)

RunService.Stepped:Connect(function()

    if Noclip and LP.Character then

        for _, part in pairs(LP.Character:GetDescendants()) do

            if part:IsA("BasePart") then

                part.CanCollide = false

            end

        end

    end

end)

LP.CharacterAdded:Connect(function(char)

    refreshCharacter()

    if OneHit then

        task.wait(1)

        ModifyWeapon()

    end

    if Noclip then

        RunService.Stepped:Connect(function()

            if LP.Character then

                for _, part in pairs(LP.Character:GetDescendants()) do

                    if part:IsA("BasePart") then

                        part.CanCollide = false

                    end

                end

            end

        end)

    end

end)

game.StarterGui:SetCore("SendNotification", {

    Title = "Ultimate Game Tools",

    Text = "Features Loaded!",

    Duration = 5

})