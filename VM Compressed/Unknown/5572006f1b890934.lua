-- dc: @vyxonq

repeat
    wait(1)
until game:IsLoaded()
local function Function(Param, Param2)
    game.StarterGui:SetCore("SendNotification", {
        Title = "Lunar X Hub",
        Text = Param,
        Duration = Param2,
        Icon = "rbxassetid://16691911155"
    })
end
wait(0.1)
Function("Thanks for runing script Lunar X Hub !", 5)
wait(0.1)
Function("discord.gg / 6DxKCH6gE7", 5)
wait(0.5)
local Result = require(game:GetService("ReplicatedStorage").Notification)
Result.new("<Color = Cyan>Lunar X HubScript<Color=/>"):Display()
wait(0.5)
Result.new("<Color = Yellow>Create By Newbie Code Blox Shit<Color=/>"):Display()
wait(1)
repeat
    wait()
until game.Players.LocalPlayer
local Window = loadstring(game:HttpGet("https://raw.githubusercontent.com / NguyenLam2504/anhyeuem / main/AnCutGui.lua"))():Window("Free Version | Blox Fruit")
local Tab = Window:Tab("Home", "rbxassetid://16691911155")
local Tab2 = Window:Tab("Main", "rbxassetid://15712703260")
local Tab3 = Window:Tab("Setting", "rbxassetid://15712711639")
local Tab4 = Window:Tab("Other Farm", "rbxassetid://15712717270")
local Tab5 = Window:Tab("Stats", "rbxassetid://15712723981")
local Tab6 = Window:Tab("Race V4", "rbxassetid://15712776421")
local Tab7 = Window:Tab("Games Event", "rbxassetid://15806749681")
local Tab8 = Window:Tab("Function5", "rbxassetid://15712738876")
local Tab9 = Window:Tab("Player", "rbxassetid://15712750195")
local Tab10 = Window:Tab("Devil Fruit", "rbxassetid://15712758182")
local Tab11 = Window:Tab("Raid", "rbxassetid://15712763124")
local Tab12 = Window:Tab("Shop", "rbxassetid://15712767144")
local Tab13 = Window:Tab("Misc", "rbxassetid://15712771666")
local Tab14 = Window:Tab("Status Sever", "rbxassetid://10723364725")
Tab:Seperator("Lunar X Hub")
Tab:Label("Blox Fruits | Script Free Version")
Tab:Seperator("Status")
local Label = Tab:Label("")
local Label2 = Tab:Label("Name : " .. game.Players.LocalPlayer.Name)
local Label3 = Tab:Label("")
local Label4 = Tab:Label("")
Function = function()
    local Floor = math.floor(game:GetService("Workspace").DistributedGameTime + 0.5)
    local RealPhysicsFps = game:GetService("Workspace"):GetRealPhysicsFPS()
    local ValueString = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
    Label:Set("Result6 : " .. math.floor(Floor / 3600) % 24 .. " : " .. math.floor(Floor / 60) % 60 .. " : " .. math.floor(Floor / 1) % 60)
    Label3:Set("FPS : " .. RealPhysicsFps)
    Label4:Set("Ping : " .. ValueString)
end
task.spawn(function()
    while task.wait() do
        Function()
    end
end)
Tab:Label("Join Our Discord for News")
Tab:Button("Copy Discord Link", function()
    Function("Copy Discord Link!", 5)
    setclipboard("https://discord.gg / 6DxKCH6gE7")
end)
assert(getrawmetatable)
Result = getrawmetatable(game)
setreadonly(Result, false)
Namecall = Result.__namecall
Result.__namecall = newcclosure(function(Param, ...)
    local Value = {
        ...
    }
    if tostring(Value[1]) == "TeleportDetect" then
        return
    end
    if tostring(Value[1]) == "CHECKER_1" then
        return
    end
    if tostring(Value[1]) == "CHECKER" then
        return
    end
    if tostring(Value[1]) == "GUI_CHECK" then
        return
    end
    if tostring(Value[1]) == "OneMoreTime" then
        return
    end
    if tostring(Value[1]) == "checkingSPEED" then
        return
    end
    if tostring(Value[1]) == "BANREMOTE" then
        return
    end
    if tostring(Value[1]) == "PERMAIDBAN" then
        return
    end
    if tostring(Value[1]) == "KICKREMOTE" then
        return
    end
    if tostring(Value[1]) == "BR_KICKPC" then
        return
    end
    if tostring(Value[1]) == "BR_KICKMOBILE" then
        return
    end
    return Namecall(Param, ...)
end)
getgenv().A = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib).wrapAttackAnimationAsync
getgenv().B = require(game.Players.LocalPlayer.PlayerScripts.CombatFramework.Particle).play
_G.setfflag = true
spawn(function()
    while wait() do
        local Setfflag = _G.setfflag
        if Setfflag then
            setfflag("AbuseReportScreenshot", "False")
            setfflag("AbuseReportScreenshotPercentage", "0")
        end
    end
end)
_G.SafeFarm = true
spawn(function()
    while wait() do
        local SafeFarm = _G.SafeFarm
        if SafeFarm then
            SafeFarm = pairs
            for I, I2 in SafeFarm(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                if I2:IsA("LocalScript") and (I2.Name == "General" or I2.Name == "Shiftlock" or I2.Name == "FallDamage" or I2.Name == "4444" or I2.Name == "CamBob" or I2.Name == "JumpCD" or I2.Name == "Looking" or I2.Name == "Run") then
                    I2:Destroy()
                end
            end
            SafeFarm = pairs
            for I, I2 in SafeFarm(game:GetService("Players").LocalPlayer.PlayerScripts:GetDescendants()) do
                if I2:IsA("LocalScript") and (I2.Name == "RobloxMotor6DBugFix" or I2.Name == "Clans" or I2.Name == "Codes" or I2.Name == "CustomForceField" or I2.Name == "MenuBloodSp" or I2.Name == "PlayerList") then
                    I2:Destroy()
                end
            end
        else
            game.Players.LocalPlayer:Kick("Please don't turn off safe farm if you don't want to get banned")
        end
    end
end)
if game.PlaceId == 2753915549 then
    Flag = true
elseif game.PlaceId == 4442272183 then
    Flag2 = true
elseif game.PlaceId == 7449423635 then
    Flag3 = true
end
Function2 = function()
    Value = game:GetService("Players").LocalPlayer.Data.Level.Value
    if Flag then
        if Value == 1 or Value <= 9 then
            String250 = "Bandit"
            Number84 = 1
            String251 = "BanditQuest1"
            String252 = "Bandit"
            Inst167 = CFrame.new(1059.37194999999997, 15.4495068, 1550.423099999999977, 0.939700544, -0, -0.341998369, -0, 1, -0, 0.341998369, -0, 0.939700544)
            Inst168 = CFrame.new(1045.962646484375, 27.002508163452148, 1560.8203125)
        elseif Value == 10 or Value <= 14 then
            String250 = "Monkey"
            Number84 = 1
            String251 = "JungleQuest"
            String252 = "Monkey"
            Inst167 = CFrame.new(-1598.089109999999891, 35.550117499999999, 153.377837999999997, -0, -0, 1, -0, 1, -0, -1, -0, -0)
            Inst168 = CFrame.new(-1448.51806640625, 67.853012084960938, 11.46579647064209)
        elseif Value == 15 or Value <= 29 then
            String250 = "Gorilla"
            Number84 = 2
            String251 = "JungleQuest"
            String252 = "Gorilla"
            Inst167 = CFrame.new(-1598.089109999999891, 35.550117499999999, 153.377837999999997, -0, -0, 1, -0, 1, -0, -1, -0, -0)
            Inst168 = CFrame.new(-1129.8836669921875, 40.463546752929688, -525.4237060546875)
        elseif Value == 30 or Value <= 39 then
            String250 = "Pirate"
            Number84 = 1
            String251 = "BuggyQuest1"
            String252 = "Pirate"
            Inst167 = CFrame.new(-1141.07483000000002, 4.10001802, 3831.549799999999777, 0.965929627, -0, -0.258804798, -0, 1, -0, 0.258804798, -0, 0.965929627)
            Inst168 = CFrame.new(-1103.513427734375, 13.752052307128906, 3896.091064453125)
        elseif Value == 40 or Value <= 59 then
            String250 = "Brute"
            Number84 = 2
            String251 = "BuggyQuest1"
            String252 = "Brute"
            Inst167 = CFrame.new(-1141.07483000000002, 4.10001802, 3831.549799999999777, 0.965929627, -0, -0.258804798, -0, 1, -0, 0.258804798, -0, 0.965929627)
            Inst168 = CFrame.new(-1140.083740234375, 14.809885025024414, 4322.92138671875)
        elseif Value == 60 or Value <= 74 then
            String250 = "Desert Bandit"
            Number84 = 1
            String251 = "DesertQuest"
            String252 = "Desert Bandit"
            Inst167 = CFrame.new(894.488647000000014, 5.14000702, 4392.43358999999964, 0.819155693, -0, -0.573571265, -0, 1, -0, 0.573571265, -0, 0.819155693)
            Inst168 = CFrame.new(924.7998046875, 6.44867467880249, 4481.5859375)
        elseif Value == 75 or Value <= 89 then
            String250 = "Desert Officer"
            Number84 = 2
            String251 = "DesertQuest"
            String252 = "Desert Officer"
            Inst167 = CFrame.new(894.488647000000014, 5.14000702, 4392.43358999999964, 0.819155693, -0, -0.573571265, -0, 1, -0, 0.573571265, -0, 0.819155693)
            Inst168 = CFrame.new(1608.2822265625, 8.614224433898926, 4371.00732421875)
        elseif Value == 90 or Value <= 99 then
            String250 = "Snow Bandit"
            Number84 = 1
            String251 = "SnowQuest"
            String252 = "Snow Bandit"
            Inst167 = CFrame.new(1389.744509999999991, 88.1519318, -1298.907960000000003, -0.342042685, -0, 0.939684391, -0, 1, -0, -0.939684391, -0, -0.342042685)
            Inst168 = CFrame.new(1354.347900390625, 87.272773742675781, -1393.946533203125)
        elseif Value == 100 or Value <= 119 then
            String250 = "Snowman"
            Number84 = 2
            String251 = "SnowQuest"
            String252 = "Snowman"
            Inst167 = CFrame.new(1389.744509999999991, 88.1519318, -1298.907960000000003, -0.342042685, -0, 0.939684391, -0, 1, -0, -0.939684391, -0, -0.342042685)
            Inst168 = CFrame.new(1201.6412353515625, 144.57958984375, -1550.0670166015625)
        elseif Value == 120 or Value <= 149 then
            String250 = "Chief Petty Officer"
            Number84 = 1
            String251 = "MarineQuest2"
            String252 = "Chief Petty Officer"
            Inst167 = CFrame.new(-5039.586430000000291, 27.3500385, 4324.680180000000291, -0, -0, -1, -0, 1, -0, 1, -0, -0)
            Inst168 = CFrame.new(-4881.23095703125, 22.652044296264648, 4273.75244140625)
        elseif Value == 150 or Value <= 174 then
            String250 = "Sky Bandit"
            Number84 = 1
            String251 = "SkyQuest"
            String252 = "Sky Bandit"
            Inst167 = CFrame.new(-4839.530270000000201, 716.368591000000038, -2619.441650000000209, 0.866007268, -0, 0.500031412, -0, 1, -0, -0.500031412, -0, 0.866007268)
            Inst168 = CFrame.new(-4953.20703125, 295.74420166015625, -2899.22900390625)
        elseif Value == 175 or Value <= 189 then
            String250 = "Dark Master"
            Number84 = 2
            String251 = "SkyQuest"
            String252 = "Dark Master"
            Inst167 = CFrame.new(-4839.530270000000201, 716.368591000000038, -2619.441650000000209, 0.866007268, -0, 0.500031412, -0, 1, -0, -0.500031412, -0, 0.866007268)
            Inst168 = CFrame.new(-5259.8447265625, 391.397674560546875, -2229.035400390625)
        elseif Value == 190 or Value <= 209 then
            String250 = "Prisoner"
            Number84 = 1
            String251 = "PrisonerQuest"
            String252 = "Prisoner"
            Inst167 = CFrame.new(5308.931150000000343, 1.65517521, 475.120514000000014, -0.0894274712, -0.000000005002929, -0.995993316, 0.000000001608179, 1, -0.000000005167449, 0.995993316, -0.000000002063847, -0.0894274712)
            Inst168 = CFrame.new(5098.9736328125, -0.320405811071396, 474.237335205078125)
        elseif Value == 210 or Value <= 249 then
            String250 = "Dangerous Prisoner"
            Number84 = 2
            String251 = "PrisonerQuest"
            String252 = "Dangerous Prisoner"
            Inst167 = CFrame.new(5308.931150000000343, 1.65517521, 475.120514000000014, -0.0894274712, -0.000000005002929, -0.995993316, 0.000000001608179, 1, -0.000000005167449, 0.995993316, -0.000000002063847, -0.0894274712)
            Inst168 = CFrame.new(5654.5634765625, 15.633401870727539, 866.2991943359375)
        elseif Value == 250 or Value <= 274 then
            String250 = "Toga Warrior"
            Number84 = 1
            String251 = "ColosseumQuest"
            String252 = "Toga Warrior"
            Inst167 = CFrame.new(-1580.04663000000005, 6.35000277, -2986.47533999999996, -0.515037298, -0, -0.857167721, -0, 1, -0, 0.857167721, -0, -0.515037298)
            Inst168 = CFrame.new(-1820.21484375, 51.683856964111328, -2740.6650390625)
        elseif Value == 275 or Value <= 299 then
            String250 = "Gladiator"
            Number84 = 2
            String251 = "ColosseumQuest"
            String252 = "Gladiator"
            Inst167 = CFrame.new(-1580.04663000000005, 6.35000277, -2986.47533999999996, -0.515037298, -0, -0.857167721, -0, 1, -0, 0.857167721, -0, -0.515037298)
            Inst168 = CFrame.new(-1292.838134765625, 56.380882263183594, -3339.031494140625)
        elseif Value == 300 or Value <= 324 then
            String250 = "Military Soldier"
            Number84 = 1
            String251 = "MagmaQuest"
            String252 = "Military Soldier"
            Inst167 = CFrame.new(-5313.370119999999588, 10.9500084, 8515.293949999999313, -0.499959469, -0, 0.866048813, -0, 1, -0, -0.866048813, -0, -0.499959469)
            Inst168 = CFrame.new(-5411.16455078125, 11.081554412841797, 8454.29296875)
        elseif Value == 325 or Value <= 374 then
            String250 = "Military Spy"
            Number84 = 2
            String251 = "MagmaQuest"
            String252 = "Military Spy"
            Inst167 = CFrame.new(-5313.370119999999588, 10.9500084, 8515.293949999999313, -0.499959469, -0, 0.866048813, -0, 1, -0, -0.866048813, -0, -0.499959469)
            Inst168 = CFrame.new(-5802.8681640625, 86.262413024902344, 8828.859375)
        elseif Value == 375 or Value <= 399 then
            String250 = "Fishman Warrior"
            Number84 = 1
            String251 = "FishmanQuest"
            String252 = "Fishman Warrior"
            Inst167 = CFrame.new(61122.65234375, 18.497442245483001, 1569.399780273399983)
            Inst168 = CFrame.new(60878.30078125, 18.482830047607422, 1543.7574462890625)
            if _G.AutoFarm and 10000 < (Inst167.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
        elseif Value == 400 or Value <= 449 then
            String250 = "Fishman Commando"
            Number84 = 2
            String251 = "FishmanQuest"
            String252 = "Fishman Commando"
            Inst167 = CFrame.new(61122.65234375, 18.497442245483001, 1569.399780273399983)
            Inst168 = CFrame.new(61922.6328125, 18.482830047607422, 1493.934326171875)
            if _G.AutoFarm and 10000 < (Inst167.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
        elseif Value == 450 or Value <= 474 then
            String250 = "God's Guard"
            Number84 = 1
            String251 = "SkyExp1Quest"
            String252 = "God's Guard"
            Inst167 = CFrame.new(-4721.888670000000275, 843.874694999999974, -1949.966429999999946, 0.996191859, -0, -0.0871884301, -0, 1, -0, 0.0871884301, -0, 0.996191859)
            Inst168 = CFrame.new(-4710.04296875, 845.2769775390625, -1927.3079833984375)
            if _G.AutoFarm and 10000 < (Inst167.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-4607.822750000000269, 872.542479999999955, -1667.556880000000092))
            end
        elseif Value == 475 or Value <= 524 then
            String250 = "Shanda"
            Number84 = 2
            String251 = "SkyExp1Quest"
            String252 = "Shanda"
            Inst167 = CFrame.new(-7859.098140000000058, 5544.190429999999651, -381.476196000000016, -0.422592998, -0, 0.906319618, -0, 1, -0, -0.906319618, -0, -0.422592998)
            Inst168 = CFrame.new(-7678.48974609375, 5566.40380859375, -497.215606689453125)
            if _G.AutoFarm and 10000 < (Inst167.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7894.617675781300022, 5547.1416015625, -380.291198730470001))
            end
        elseif Value == 525 or Value <= 549 then
            String250 = "Royal Squad"
            Number84 = 1
            String251 = "SkyExp2Quest"
            String252 = "Royal Squad"
            Inst167 = CFrame.new(-7906.815920000000006, 5634.662599999999657, -1411.991940000000113, -0, -0, -1, -0, 1, -0, 1, -0, -0)
            Inst168 = CFrame.new(-7624.25244140625, 5658.13330078125, -1467.354248046875)
        elseif Value == 550 or Value <= 624 then
            String250 = "Royal Soldier"
            Number84 = 2
            String251 = "SkyExp2Quest"
            String252 = "Royal Soldier"
            Inst167 = CFrame.new(-7906.815920000000006, 5634.662599999999657, -1411.991940000000113, -0, -0, -1, -0, 1, -0, 1, -0, -0)
            Inst168 = CFrame.new(-7836.75341796875, 5645.6640625, -1790.6236572265625)
        elseif Value == 625 or Value <= 649 then
            String250 = "Galley Pirate"
            Number84 = 1
            String251 = "FountainQuest"
            String252 = "Galley Pirate"
            Inst167 = CFrame.new(5259.819819999999709, 37.3500175, 4050.029300000000148, 0.087131381, -0, 0.996196866, -0, 1, -0, -0.996196866, -0, 0.087131381)
            Inst168 = CFrame.new(5551.02197265625, 78.901351928710938, 3930.412841796875)
        elseif Value >= 650 then
            String250 = "Galley Captain"
            Number84 = 2
            String251 = "FountainQuest"
            String252 = "Galley Captain"
            Inst167 = CFrame.new(5259.819819999999709, 37.3500175, 4050.029300000000148, 0.087131381, -0, 0.996196866, -0, 1, -0, -0.996196866, -0, 0.087131381)
            Inst168 = CFrame.new(5441.95166015625, 42.502059936523438, 4950.09375)
        end
    elseif Flag2 then
        if Value == 700 or Value <= 724 then
            String250 = "Raider"
            Number84 = 1
            String251 = "Area1Quest"
            String252 = "Raider"
            Inst167 = CFrame.new(-429.543518000000006, 71.769996599999999, 1836.181880000000092, -0.22495985, -0, -0.974368095, -0, 1, -0, 0.974368095, -0, -0.22495985)
            Inst168 = CFrame.new(-728.32672119140625, 52.779319763183594, 2345.7705078125)
        elseif Value == 725 or Value <= 774 then
            String250 = "Mercenary"
            Number84 = 2
            String251 = "Area1Quest"
            String252 = "Mercenary"
            Inst167 = CFrame.new(-429.543518000000006, 71.769996599999999, 1836.181880000000092, -0.22495985, -0, -0.974368095, -0, 1, -0, 0.974368095, -0, -0.22495985)
            Inst168 = CFrame.new(-1004.32440185546875, 80.158866882324219, 1424.619384765625)
        elseif Value == 775 or Value <= 799 then
            String250 = "Swan Pirate"
            Number84 = 1
            String251 = "Area2Quest"
            String252 = "Swan Pirate"
            Inst167 = CFrame.new(638.438110000000052, 71.769988999999995, 918.282898000000046, 0.139203906, -0, 0.99026376, -0, 1, -0, -0.99026376, -0, 0.139203906)
            Inst168 = CFrame.new(1068.664306640625, 137.614288330078125, 1322.1060791015625)
        elseif Value == 800 or Value <= 874 then
            String250 = "Factory Staff"
            String251 = "Area2Quest"
            Number84 = 2
            String252 = "Factory Staff"
            Inst167 = CFrame.new(632.698608000000036, 73.105590800000002, 918.666321000000039, -0.0319722369, 0.000000000896075, -0.999488771, 0.000000000136327, 1, 0.000000000892172, 0.999488771, -0.000000000107732, -0.0319722369)
            Inst168 = CFrame.new(73.07867431640625, 81.863441467285156, -27.470672607421875)
        elseif Value == 875 or Value <= 899 then
            String250 = "Marine Lieutenant"
            Number84 = 1
            String251 = "MarineQuest3"
            String252 = "Marine Lieutenant"
            Inst167 = CFrame.new(-2440.796389999999974, 71.714073200000001, -3216.068119999999908, 0.866007268, -0, 0.500031412, -0, 1, -0, -0.500031412, -0, 0.866007268)
            Inst168 = CFrame.new(-2821.372314453125, 75.89727783203125, -3070.089111328125)
        elseif Value == 900 or Value <= 949 then
            String250 = "Marine Captain"
            Number84 = 2
            String251 = "MarineQuest3"
            String252 = "Marine Captain"
            Inst167 = CFrame.new(-2440.796389999999974, 71.714073200000001, -3216.068119999999908, 0.866007268, -0, 0.500031412, -0, 1, -0, -0.500031412, -0, 0.866007268)
            Inst168 = CFrame.new(-1861.2310791015625, 80.176582336425781, -3254.697509765625)
        elseif Value == 950 or Value <= 974 then
            String250 = "Zombie"
            Number84 = 1
            String251 = "ZombieQuest"
            String252 = "Zombie"
            Inst167 = CFrame.new(-5497.061520000000201, 47.592300399999999, -795.23706100000004, -0.29242146, -0, -0.95628953, -0, 1, -0, 0.95628953, -0, -0.29242146)
            Inst168 = CFrame.new(-5657.77685546875, 78.969734191894531, -928.68701171875)
        elseif Value == 975 or Value <= 999 then
            String250 = "Vampire"
            Number84 = 2
            String251 = "ZombieQuest"
            String252 = "Vampire"
            Inst167 = CFrame.new(-5497.061520000000201, 47.592300399999999, -795.23706100000004, -0.29242146, -0, -0.95628953, -0, 1, -0, 0.95628953, -0, -0.29242146)
            Inst168 = CFrame.new(-6037.66796875, 32.184638977050781, -1340.6597900390625)
        elseif Value == 1000 or Value <= 1049 then
            String250 = "Snow Trooper"
            Number84 = 1
            String251 = "SnowMountainQuest"
            String252 = "Snow Trooper"
            Inst167 = CFrame.new(609.858826000000022, 400.11990400000002, -5372.259280000000217, -0.374604106, -0, 0.92718488, -0, 1, -0, -0.92718488, -0, -0.374604106)
            Inst168 = CFrame.new(549.1473388671875, 427.387054443359375, -5563.69873046875)
        elseif Value == 1050 or Value <= 1099 then
            String250 = "Winter Warrior"
            Number84 = 2
            String251 = "SnowMountainQuest"
            String252 = "Winter Warrior"
            Inst167 = CFrame.new(609.858826000000022, 400.11990400000002, -5372.259280000000217, -0.374604106, -0, 0.92718488, -0, 1, -0, -0.92718488, -0, -0.374604106)
            Inst168 = CFrame.new(1142.7451171875, 475.639801025390625, -5199.41650390625)
        elseif Value == 1100 or Value <= 1124 then
            String250 = "Lab Subordinate"
            Number84 = 1
            String251 = "IceSideQuest"
            String252 = "Lab Subordinate"
            Inst167 = CFrame.new(-6064.068849999999657, 15.2422857, -4902.978519999999662, 0.453972578, -0, -0.891015649, -0, 1, -0, 0.891015649, -0, 0.453972578)
            Inst168 = CFrame.new(-5707.4716796875, 15.951709747314453, -4513.39208984375)
        elseif Value == 1125 or Value <= 1174 then
            String250 = "Horned Warrior"
            Number84 = 2
            String251 = "IceSideQuest"
            String252 = "Horned Warrior"
            Inst167 = CFrame.new(-6064.068849999999657, 15.2422857, -4902.978519999999662, 0.453972578, -0, -0.891015649, -0, 1, -0, 0.891015649, -0, 0.453972578)
            Inst168 = CFrame.new(-6341.36669921875, 15.951770782470703, -5723.162109375)
        elseif Value == 1175 or Value <= 1199 then
            String250 = "Magma Ninja"
            Number84 = 1
            String251 = "FireSideQuest"
            String252 = "Magma Ninja"
            Inst167 = CFrame.new(-5428.031740000000354, 15.062292100000001, -5299.434570000000349, -0.882952213, -0, 0.469463557, -0, 1, -0, -0.469463557, -0, -0.882952213)
            Inst168 = CFrame.new(-5449.6728515625, 76.658744812011719, -5808.20068359375)
        elseif Value == 1200 or Value <= 1249 then
            String250 = "Lava Pirate"
            Number84 = 2
            String251 = "FireSideQuest"
            String252 = "Lava Pirate"
            Inst167 = CFrame.new(-5428.031740000000354, 15.062292100000001, -5299.434570000000349, -0.882952213, -0, 0.469463557, -0, 1, -0, -0.469463557, -0, -0.882952213)
            Inst168 = CFrame.new(-5213.33154296875, 49.737880706787109, -4701.451171875)
        elseif Value == 1250 or Value <= 1274 then
            String250 = "Ship Deckhand"
            Number84 = 1
            String251 = "ShipQuest1"
            String252 = "Ship Deckhand"
            Inst167 = CFrame.new(1037.801269999999931, 125.092170999999993, 32911.601600000001781)
            Inst168 = CFrame.new(1212.0111083984375, 150.79205322265625, 33059.24609375)
            if _G.AutoFarm and 10000 < (Inst167.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.212524414059999, 126.9760055542, 32852.83203125))
            end
        elseif Value == 1275 or Value <= 1299 then
            String250 = "Ship Engineer"
            Number84 = 2
            String251 = "ShipQuest1"
            String252 = "Ship Engineer"
            Inst167 = CFrame.new(1037.801269999999931, 125.092170999999993, 32911.601600000001781)
            Inst168 = CFrame.new(919.4786376953125, 43.544013977050781, 32779.96875)
            if _G.AutoFarm and 10000 < (Inst167.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.212524414059999, 126.9760055542, 32852.83203125))
            end
        elseif Value == 1300 or Value <= 1324 then
            String250 = "Ship Steward"
            Number84 = 1
            String251 = "ShipQuest2"
            String252 = "Ship Steward"
            Inst167 = CFrame.new(968.809570000000008, 125.092170999999993, 33244.125)
            Inst168 = CFrame.new(919.43853759765625, 129.555999755859375, 33436.03515625)
            if _G.AutoFarm and 10000 < (Inst167.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.212524414059999, 126.9760055542, 32852.83203125))
            end
        elseif Value == 1325 or Value <= 1349 then
            String250 = "Ship Officer"
            Number84 = 2
            String251 = "ShipQuest2"
            String252 = "Ship Officer"
            Inst167 = CFrame.new(968.809570000000008, 125.092170999999993, 33244.125)
            Inst168 = CFrame.new(1036.0179443359375, 181.439041137695312, 33315.7265625)
            if _G.AutoFarm and 10000 < (Inst167.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.212524414059999, 126.9760055542, 32852.83203125))
            end
        elseif Value == 1350 or Value <= 1374 then
            String250 = "Arctic Warrior"
            Number84 = 1
            String251 = "FrostQuest"
            String252 = "Arctic Warrior"
            Inst167 = CFrame.new(5667.658199999999852, 26.799781800000002, -6486.08983999999964, -0.933587909, -0, -0.358349502, -0, 1, -0, 0.358349502, -0, -0.933587909)
            Inst168 = CFrame.new(5966.24609375, 62.970020294189453, -6179.3828125)
            if _G.AutoFarm and 10000 < (Inst167.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-6508.558105468800022, 5000.034996032714844, -132.839538574220001))
            end
        elseif Value == 1375 or Value <= 1424 then
            String250 = "Snow Lurker"
            Number84 = 2
            String251 = "FrostQuest"
            String252 = "Snow Lurker"
            Inst167 = CFrame.new(5667.658199999999852, 26.799781800000002, -6486.08983999999964, -0.933587909, -0, -0.358349502, -0, 1, -0, 0.358349502, -0, -0.933587909)
            Inst168 = CFrame.new(5407.07373046875, 69.194374084472656, -6880.88037109375)
        elseif Value == 1425 or Value <= 1449 then
            String250 = "Sea Soldier"
            Number84 = 1
            String251 = "ForgottenQuest"
            String252 = "Sea Soldier"
            Inst167 = CFrame.new(-3054.44457999999986, 235.544281000000012, -10142.819299999999203, 0.990270376, -0, -0.13915664, -0, 1, -0, 0.13915664, -0, 0.990270376)
            Inst168 = CFrame.new(-3028.2236328125, 64.674514770507812, -9775.4267578125)
        elseif Value >= 1450 then
            String250 = "Water Fighter"
            Number84 = 2
            String251 = "ForgottenQuest"
            String252 = "Water Fighter"
            Inst167 = CFrame.new(-3054.44457999999986, 235.544281000000012, -10142.819299999999203, 0.990270376, -0, -0.13915664, -0, 1, -0, 0.13915664, -0, 0.990270376)
            Inst168 = CFrame.new(-3352.9013671875, 285.01556396484375, -10534.841796875)
        end
    elseif Flag3 then
        if Value == 1500 or Value <= 1524 then
            String250 = "Pirate Millionaire"
            Number84 = 1
            String251 = "PiratePortQuest"
            String252 = "Pirate Millionaire"
            Inst167 = CFrame.new(-290.074677000000008, 42.903465300000001, 5581.58983999999964, 0.965929627, -0, -0.258804798, -0, 1, -0, 0.258804798, -0, 0.965929627)
            Inst168 = CFrame.new(-245.996383666992188, 47.30615234375, 5584.1005859375)
        elseif Value == 1525 or Value <= 1574 then
            String250 = "Pistol Billionaire"
            Number84 = 2
            String251 = "PiratePortQuest"
            String252 = "Pistol Billionaire"
            Inst167 = CFrame.new(-290.074677000000008, 42.903465300000001, 5581.58983999999964, 0.965929627, -0, -0.258804798, -0, 1, -0, 0.258804798, -0, 0.965929627)
            Inst168 = CFrame.new(-187.330154418945312, 86.239875793457031, 6013.513671875)
        elseif Value == 1575 or Value <= 1599 then
            String250 = "Dragon Crew Warrior"
            Number84 = 1
            String251 = "AmazonQuest"
            String252 = "Dragon Crew Warrior"
            Inst167 = CFrame.new(5832.835939999999937, 51.680610700000003, -1101.515630000000101, 0.898790359, -0, -0.438378751, -0, 1, -0, 0.438378751, -0, 0.898790359)
            Inst168 = CFrame.new(6141.140625, 51.351364135742188, -1340.738525390625)
        elseif Value == 1600 or Value <= 1624 then
            String250 = "Dragon Crew Archer"
            String251 = "AmazonQuest"
            Number84 = 2
            String252 = "Dragon Crew Archer"
            Inst167 = CFrame.new(5833.114746093800022, 51.60498046875, -1103.0693359375)
            Inst168 = CFrame.new(6616.41748046875, 441.767059326171875, 446.0469970703125)
        elseif Value == 1625 or Value <= 1649 then
            String250 = "Female Islander"
            String251 = "AmazonQuest2"
            Number84 = 1
            String252 = "Female Islander"
            Inst167 = CFrame.new(5446.879394531300022, 601.629455566410002, 749.456726074220001)
            Inst168 = CFrame.new(4685.25830078125, 735.80780029296875, 815.34259033203125)
        elseif Value == 1650 or Value <= 1699 then
            String250 = "Giant Islander"
            String251 = "AmazonQuest2"
            Number84 = 2
            String252 = "Giant Islander"
            Inst167 = CFrame.new(5446.879394531300022, 601.629455566410002, 749.456726074220001)
            Inst168 = CFrame.new(4729.09423828125, 590.436767578125, -36.976276397705078)
        elseif Value == 1700 or Value <= 1724 then
            String250 = "Marine Commodore"
            Number84 = 1
            String251 = "MarineTreeIsland"
            String252 = "Marine Commodore"
            Inst167 = CFrame.new(2180.541259999999966, 27.8156815, -6741.549799999999777, -0.965929747, -0, 0.258804798, -0, 1, -0, -0.258804798, -0, -0.965929747)
            Inst168 = CFrame.new(2286.0078125, 73.133918762207031, -7159.80908203125)
        elseif Value == 1725 or Value <= 1774 then
            String250 = "Marine Rear Admiral"
            String252 = "Marine Rear Admiral"
            String251 = "MarineTreeIsland"
            Number84 = 2
            Inst167 = CFrame.new(2179.98828125, 28.731239318848001, -6740.055175781300022)
            Inst168 = CFrame.new(3656.773681640625, 160.524063110351562, -7001.5986328125)
        elseif Value == 1775 or Value <= 1799 then
            String250 = "Fishman Raider"
            Number84 = 1
            String251 = "DeepForestIsland3"
            String252 = "Fishman Raider"
            Inst167 = CFrame.new(-10581.656300000000556, 330.87295499999999, -8761.186519999999291, -0.882952213, -0, 0.469463557, -0, 1, -0, -0.469463557, -0, -0.882952213)
            Inst168 = CFrame.new(-10407.5263671875, 331.76263427734375, -8368.5166015625)
        elseif Value == 1800 or Value <= 1824 then
            String250 = "Fishman Captain"
            Number84 = 2
            String251 = "DeepForestIsland3"
            String252 = "Fishman Captain"
            Inst167 = CFrame.new(-10581.656300000000556, 330.87295499999999, -8761.186519999999291, -0.882952213, -0, 0.469463557, -0, 1, -0, -0.469463557, -0, -0.882952213)
            Inst168 = CFrame.new(-10994.701171875, 352.38140869140625, -9002.1103515625)
        elseif Value == 1825 or Value <= 1849 then
            String250 = "Forest Pirate"
            Number84 = 1
            String251 = "DeepForestIsland"
            String252 = "Forest Pirate"
            Inst167 = CFrame.new(-13234.040000000000873, 331.488495, -7625.401369999999588, 0.707134247, -0, -0.707079291, -0, 1, -0, 0.707079291, -0, 0.707134247)
            Inst168 = CFrame.new(-13274.478515625, 332.378143310546875, -7769.58056640625)
        elseif Value == 1850 or Value <= 1899 then
            String250 = "Mythological Pirate"
            Number84 = 2
            String251 = "DeepForestIsland"
            String252 = "Mythological Pirate"
            Inst167 = CFrame.new(-13234.040000000000873, 331.488495, -7625.401369999999588, 0.707134247, -0, -0.707079291, -0, 1, -0, 0.707079291, -0, 0.707134247)
            Inst168 = CFrame.new(-13680.607421875, 501.08154296875, -6991.189453125)
        elseif Value == 1900 or Value <= 1924 then
            String250 = "Jungle Pirate"
            Number84 = 1
            String251 = "DeepForestIsland2"
            String252 = "Jungle Pirate"
            Inst167 = CFrame.new(-12680.381799999999203, 389.971039000000019, -9902.019529999999577, -0.0871315002, -0, 0.996196866, -0, 1, -0, -0.996196866, -0, -0.0871315002)
            Inst168 = CFrame.new(-12256.16015625, 331.73828125, -10485.8369140625)
        elseif Value == 1925 or Value <= 1974 then
            String250 = "Musketeer Pirate"
            Number84 = 2
            String251 = "DeepForestIsland2"
            String252 = "Musketeer Pirate"
            Inst167 = CFrame.new(-12680.381799999999203, 389.971039000000019, -9902.019529999999577, -0.0871315002, -0, 0.996196866, -0, 1, -0, -0.996196866, -0, -0.0871315002)
            Inst168 = CFrame.new(-13457.904296875, 391.545654296875, -9859.177734375)
        elseif Value == 1975 or Value <= 1999 then
            String250 = "Reborn Skeleton"
            Number84 = 1
            String251 = "HauntedQuest1"
            String252 = "Reborn Skeleton"
            Inst167 = CFrame.new(-9479.216800000000148, 141.215088000000009, 5566.092770000000201, -0, -0, 1, -0, 1, -0, -1, -0, -0)
            Inst168 = CFrame.new(-8763.7236328125, 165.722991943359375, 6159.86181640625)
        elseif Value == 2000 or Value <= 2024 then
            String250 = "Living Zombie"
            Number84 = 2
            String251 = "HauntedQuest1"
            String252 = "Living Zombie"
            Inst167 = CFrame.new(-9479.216800000000148, 141.215088000000009, 5566.092770000000201, -0, -0, 1, -0, 1, -0, -1, -0, -0)
            Inst168 = CFrame.new(-10144.1318359375, 138.626678466796875, 5838.0888671875)
        elseif Value == 2025 or Value <= 2049 then
            String250 = "Demonic Soul"
            Number84 = 1
            String251 = "HauntedQuest2"
            String252 = "Demonic Soul"
            Inst167 = CFrame.new(-9516.993159999999989, 172.017180999999994, 6078.465329999999994, -0, -0, -1, -0, 1, -0, 1, -0, -0)
            Inst168 = CFrame.new(-9505.8720703125, 172.104827880859375, 6158.9931640625)
        elseif Value == 2050 or Value <= 2074 then
            String250 = "Posessed Mummy"
            Number84 = 2
            String251 = "HauntedQuest2"
            String252 = "Posessed Mummy"
            Inst167 = CFrame.new(-9516.993159999999989, 172.017180999999994, 6078.465329999999994, -0, -0, -1, -0, 1, -0, 1, -0, -0)
            Inst168 = CFrame.new(-9582.0224609375, 6.251527309417725, 6205.478515625)
        elseif Value == 2075 or Value <= 2099 then
            String250 = "Peanut Scout"
            Number84 = 1
            String251 = "NutsIslandQuest"
            String252 = "Peanut Scout"
            Inst167 = CFrame.new(-2104.390869140599989, 38.104167938232003, -10194.21875, -0, -0, -1, -0, 1, -0, 1, -0, -0)
            Inst168 = CFrame.new(-2143.241943359375, 47.72198486328125, -10029.9951171875)
        elseif Value == 2100 or Value <= 2124 then
            String250 = "Peanut President"
            Number84 = 2
            String251 = "NutsIslandQuest"
            String252 = "Peanut President"
            Inst167 = CFrame.new(-2104.390869140599989, 38.104167938232003, -10194.21875, -0, -0, -1, -0, 1, -0, 1, -0, -0)
            Inst168 = CFrame.new(-1859.35400390625, 38.103168487548828, -10422.4296875)
        elseif Value == 2125 or Value <= 2149 then
            String250 = "Ice Cream Chef"
            Number84 = 1
            String251 = "IceCreamIslandQuest"
            String252 = "Ice Cream Chef"
            Inst167 = CFrame.new(-820.648254394529999, 65.819526672362997, -10965.795898438000222, -0, -0, -1, -0, 1, -0, 1, -0, -0)
            Inst168 = CFrame.new(-872.24658203125, 65.819572448730469, -10919.95703125)
        elseif Value == 2150 or Value <= 2199 then
            String250 = "Ice Cream Commander"
            Number84 = 2
            String251 = "IceCreamIslandQuest"
            String252 = "Ice Cream Commander"
            Inst167 = CFrame.new(-820.648254394529999, 65.819526672362997, -10965.795898438000222, -0, -0, -1, -0, 1, -0, 1, -0, -0)
            Inst168 = CFrame.new(-558.06103515625, 112.048957824707031, -11290.7744140625)
        elseif Value == 2200 or Value <= 2224 then
            String250 = "Cookie Crafter"
            Number84 = 1
            String251 = "CakeQuest1"
            String252 = "Cookie Crafter"
            Inst167 = CFrame.new(-2021.320069999999987, 37.7982254, -12028.729499999999462, 0.957576931, -0.000000088030205, 0.288177818, 0.000000069301187, 1, 0.000000075193121, -0.288177818, -0.000000052032135, 0.957576931)
            Inst168 = CFrame.new(-2374.13671875, 37.798263549804688, -12125.30859375)
        elseif Value == 2225 or Value <= 2249 then
            String250 = "Cake Guard"
            Number84 = 2
            String251 = "CakeQuest1"
            String252 = "Cake Guard"
            Inst167 = CFrame.new(-2021.320069999999987, 37.7982254, -12028.729499999999462, 0.957576931, -0.000000088030205, 0.288177818, 0.000000069301187, 1, 0.000000075193121, -0.288177818, -0.000000052032135, 0.957576931)
            Inst168 = CFrame.new(-1598.3070068359375, 43.773197174072266, -12244.5810546875)
        elseif Value == 2250 or Value <= 2274 then
            String250 = "Baking Staff"
            Number84 = 1
            String251 = "CakeQuest2"
            String252 = "Baking Staff"
            Inst167 = CFrame.new(-1927.916019999999889, 37.798133900000003, -12842.539099999999962, -0.96804446, 0.000000042214214, 0.250778586, 0.000000047491106, 1, 0.000000014990471, -0.250778586, 0.000000026421194, -0.96804446)
            Inst168 = CFrame.new(-1887.8099365234375, 77.618507385253906, -12998.3505859375)
        elseif Value == 2275 or Value <= 2299 then
            String250 = "Head Baker"
            Number84 = 2
            String251 = "CakeQuest2"
            String252 = "Head Baker"
            Inst167 = CFrame.new(-1927.916019999999889, 37.798133900000003, -12842.539099999999962, -0.96804446, 0.000000042214214, 0.250778586, 0.000000047491106, 1, 0.000000014990471, -0.250778586, 0.000000026421194, -0.96804446)
            Inst168 = CFrame.new(-2216.188232421875, 82.884521484375, -12869.2939453125)
        elseif Value == 2300 or Value <= 2324 then
            String250 = "Cocoa Warrior"
            Number84 = 1
            String251 = "ChocQuest1"
            String252 = "Cocoa Warrior"
            Inst167 = CFrame.new(233.228363037109375, 29.876001358032227, -12201.2333984375)
            Inst168 = CFrame.new(-21.55328369140625, 80.574996948242188, -12352.3876953125)
        elseif Value == 2325 or Value <= 2349 then
            String250 = "Chocolate Bar Battler"
            Number84 = 2
            String251 = "ChocQuest1"
            String252 = "Chocolate Bar Battler"
            Inst167 = CFrame.new(233.228363037109375, 29.876001358032227, -12201.2333984375)
            Inst168 = CFrame.new(582.590576171875, 77.188095092773438, -12463.162109375)
        elseif Value == 2350 or Value <= 2374 then
            String250 = "Sweet Thief"
            Number84 = 1
            String251 = "ChocQuest2"
            String252 = "Sweet Thief"
            Inst167 = CFrame.new(150.506637573242188, 30.693693161010742, -12774.5029296875)
            Inst168 = CFrame.new(165.1884765625, 76.058853149414062, -12600.8369140625)
        elseif Value == 2375 or Value <= 2399 then
            String250 = "Candy Rebel"
            Number84 = 2
            String251 = "ChocQuest2"
            String252 = "Candy Rebel"
            Inst167 = CFrame.new(150.506637573242188, 30.693693161010742, -12774.5029296875)
            Inst168 = CFrame.new(134.865631103515625, 77.2476806640625, -12876.5478515625)
        elseif Value == 2400 or Value <= 2424 then
            String250 = "Candy Pirate"
            Number84 = 1
            String251 = "CandyQuest1"
            String252 = "Candy Pirate"
            Inst167 = CFrame.new(-1150.0400390625, 20.378934860229492, -14446.3349609375)
            Inst168 = CFrame.new(-1310.5003662109375, 26.016523361206055, -14562.404296875)
        elseif Value == 2425 or Value <= 2449 then
            String250 = "Snow Demon"
            Number84 = 2
            String251 = "CandyQuest1"
            String252 = "Snow Demon"
            Inst167 = CFrame.new(-1150.0400390625, 20.378934860229492, -14446.3349609375)
            Inst168 = CFrame.new(-880.20062255859375, 71.247764587402344, -14538.609375)
        elseif Value == 2450 or Value <= 2474 then
            String250 = "Isle Outlaw"
            Number84 = 1
            String251 = "TikiQuest1"
            String252 = "Isle Outlaw"
            Inst167 = CFrame.new(-16547.748046875, 61.135334014892578, -173.413604736328125)
            Inst168 = CFrame.new(-16442.814453125, 116.138999938964844, -264.463775634765625)
        elseif Value == 2475 or Value <= 2499 then
            String250 = "Island Boy"
            Number84 = 2
            String251 = "TikiQuest1"
            String252 = "Island Boy"
            Inst167 = CFrame.new(-16547.748046875, 61.135334014892578, -173.413604736328125)
            Inst168 = CFrame.new(-16901.26171875, 84.06756591796875, -192.889068603515625)
        elseif Value == 2500 or Value <= 2524 then
            String250 = "Sun - kissed Warrior"
            Number84 = 1
            String251 = "TikiQuest2"
            String252 = "kissed"
            Inst167 = CFrame.new(-16539.078125, 55.686328887939453, 1051.5738525390625)
            Inst168 = CFrame.new(-16349.8779296875, 92.080833435058594, 1123.4169921875)
        elseif Value == 2525 or Value <= 2550 then
            String250 = "Isle Champion"
            Number84 = 2
            String251 = "TikiQuest2"
            String252 = "Isle Champion"
            Inst167 = CFrame.new(-16539.078125, 55.686328887939453, 1051.5738525390625)
            Inst168 = CFrame.new(-16347.4150390625, 92.095039367675781, 1122.335205078125)
        end
    end
end
Function3 = function()
    local PlaceId = game.PlaceId
    local Value = {}
    local String = ""
    local Hour = os.date("!*t").hour
    local Flag = false
    Function4 = function()
        local Value2 = nil
        if String == "" then
            Value2 = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com / v1/games/" .. PlaceId .. "/servers / Public?sortOrder = Asc&limit = 100"))
        else
            Value2 = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com / v1/games/" .. PlaceId .. "/servers / Public?sortOrder = Asc&limit = 100&cursor=" .. String))
        end
        local String2 = ""
        if Value2.nextPageCursor and Value2.nextPageCursor ~= "null" and Value2.nextPageCursor ~= nil then
            String = Value2.nextPageCursor
        end
        local Number = 0
        for I, I2 in pairs(Value2.data) do
            local Flag2 = true
            String2 = tostring(I2.id)
            if tonumber(I2.playing) < tonumber(I2.maxPlayers) then
                for I3, I4 in pairs(Value) do
                    if Number ~= 0 and String2 == tostring(I4) then
                        Flag2 = false
                    elseif tonumber(Hour) ~= tonumber(I4) then
                        local Result2 = pcall(function()
                            Value = {}
                            table.insert(Value, Hour)
                        end)
                    end
                    Number = Number + 1
                end
                if Flag2 == true then
                    table.insert(Value, String2)
                    wait()
                    pcall(function()
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceId, String2, game.Players.LocalPlayer)
                    end)
                    wait(4)
                end
            end
        end
    end
    Function5 = function()
        while wait() do
            pcall(function()
                Function4()
                if String ~= "" then
                    Function4()
                end
            end)
        end
    end
    Function5()
end
Function13 = function()
    for I, I2 in pairs(game:GetService("Workspace")._WorldOrigin.Locations:GetChildren()) do
        pcall(function()
            if R023 and I2.Name ~= "Sea" then
                if not I2:FindFirstChild("NameEsp") then
                    local Inst = Instance.new("BillboardGui", I2)
                    Inst.Name = "NameEsp"
                    Inst.ExtentsOffset = Vector3.new(0, 1, 0)
                    Inst.Size = UDim2.new(1, 200, 1, 30)
                    Inst.Adornee = I2
                    Inst.AlwaysOnTop = true
                    local Inst2 = Instance.new("TextLabel", Inst)
                    Inst2.Font = "GothamBold"
                    Inst2.FontSize = "Size14"
                    Inst2.TextWrapped = true
                    Inst2.Size = UDim2.new(1, 0, 1, 0)
                    Inst2.TextYAlignment = "Top"
                    Inst2.BackgroundTransparency = 1
                    Inst2.TextStrokeTransparency = 0.5
                    Inst2.TextColor3 = Color3.fromRGB(7, 236, 240)
                else
                    I2.NameEsp.TextLabel.Text = I2.Name .. "   \n" .. round((game:GetService("Players").LocalPlayer.Character.Head.Position - I2.Position).Magnitude / 3) .. " Magnitude"
                end
            elseif I2:FindFirstChild("NameEsp") then
                I2:FindFirstChild("NameEsp"):Destroy()
            end
        end)
    end
end
Function22 = function(Param)
    return Param == nil
end
local function Function2(Param)
    return math.floor(tonumber(Param) + 0.5)
end
Random4 = math.random(1, 1000000)
Function15 = function()
    for I, I2 in pairs(game:GetService("Players"):GetChildren()) do
        pcall(function()
            if not Function22(I2.Character) then
                if R037 then
                    if not Function22(I2.Character.Head) and not I2.Character.Head:FindFirstChild(("NameEsp" .. Random4)) then
                        local Inst = Instance.new("BillboardGui", I2.Character.Head)
                        Inst.Name = "NameEsp" .. Random4
                        Inst.ExtentsOffset = Vector3.new(0, 1, 0)
                        Inst.Size = UDim2.new(1, 200, 1, 30)
                        Inst.Adornee = I2.Character.Head
                        Inst.AlwaysOnTop = true
                        local Inst2 = Instance.new("TextLabel", Inst)
                        Inst2.Font = Enum.Font.GothamSemibold
                        Inst2.FontSize = "Size14"
                        Inst2.TextWrapped = true
                        Inst2.Text = I2.Name .. " \n" .. Function2((game:GetService("Players").LocalPlayer.Character.Head.Position - I2.Character.Head.Position).Magnitude / 3) .. " Magnitude"
                        Inst2.Size = UDim2.new(1, 0, 1, 0)
                        Inst2.TextYAlignment = "Top"
                        Inst2.BackgroundTransparency = 1
                        Inst2.TextStrokeTransparency = 0.5
                        if I2.Team == game.Players.LocalPlayer.Team then
                            Inst2.TextColor3 = Color3.new(0, 255, 0)
                        else
                            Inst2.TextColor3 = Color3.new(255, 0, 0)
                        end
                    else
                        I2.Character.Head["NameEsp" .. Random4].TextLabel.Text = I2.Name .. " | " .. Function2((game:GetService("Players").LocalPlayer.Character.Head.Position - I2.Character.Head.Position).Magnitude / 3) .. " Magnitude\nHealth : " .. Function2(I2.Character.Humanoid.Health * 100 / I2.Character.Humanoid.MaxHealth) .. "%"
                    end
                elseif I2.Character.Head:FindFirstChild("NameEsp" .. Random4) then
                    I2.Character.Head:FindFirstChild("NameEsp" .. Random4):Destroy()
                end
            end
        end)
    end
end
Function16 = function()
    for I, I2 in pairs(game.Workspace:GetChildren()) do
        pcall(function()
            if string.find(I2.Name, "Chest") and I2:FindFirstChild("NameEsp" .. Random4) then
                I2:FindFirstChild("NameEsp" .. Random4):Destroy()
            end
        end)
    end
end
Function17 = function()
    for I, I2 in pairs(game.Workspace:GetChildren()) do
        pcall(function()
            if R0552 and string.find(I2.Name, "Fruit") then
                if not I2.Handle:FindFirstChild(("NameEsp" .. Random4)) then
                    local Inst = Instance.new("BillboardGui", I2.Handle)
                    Inst.Name = "NameEsp" .. Random4
                    Inst.ExtentsOffset = Vector3.new(0, 1, 0)
                    Inst.Size = UDim2.new(1, 200, 1, 30)
                    Inst.Adornee = I2.Handle
                    Inst.AlwaysOnTop = true
                    local Inst2 = Instance.new("TextLabel", Inst)
                    Inst2.Font = Enum.Font.GothamSemibold
                    Inst2.FontSize = "Size14"
                    Inst2.TextWrapped = true
                    Inst2.Size = UDim2.new(1, 0, 1, 0)
                    Inst2.TextYAlignment = "Top"
                    Inst2.BackgroundTransparency = 1
                    Inst2.TextStrokeTransparency = 0.5
                    Inst2.TextColor3 = Color3.fromRGB(255, 255, 255)
                    Inst2.Text = I2.Name .. " \n" .. Function2((game:GetService("Players").LocalPlayer.Character.Head.Position - I2.Handle.Position).Magnitude / 3) .. " Magnitude"
                else
                    I2.Handle["NameEsp" .. Random4].TextLabel.Text = I2.Name .. "   \n" .. Function2((game:GetService("Players").LocalPlayer.Character.Head.Position - I2.Handle.Position).Magnitude / 3) .. " Magnitude"
                end
            elseif I2.Handle:FindFirstChild("NameEsp" .. Random4) then
                I2.Handle:FindFirstChild("NameEsp" .. Random4):Destroy()
            end
        end)
    end
end
Function18 = function()
    for I, I2 in pairs(game.Workspace:GetChildren()) do
        pcall(function()
            if I2.Name == "Flower2" or I2.Name == "Flower1" then
                if R0367 then
                    if not I2:FindFirstChild(("NameEsp" .. Random4)) then
                        local Inst = Instance.new("BillboardGui", I2)
                        Inst.Name = "NameEsp" .. Random4
                        Inst.ExtentsOffset = Vector3.new(0, 1, 0)
                        Inst.Size = UDim2.new(1, 200, 1, 30)
                        Inst.Adornee = I2
                        Inst.AlwaysOnTop = true
                        local Inst2 = Instance.new("TextLabel", Inst)
                        Inst2.Font = Enum.Font.GothamSemibold
                        Inst2.FontSize = "Size14"
                        Inst2.TextWrapped = true
                        Inst2.Size = UDim2.new(1, 0, 1, 0)
                        Inst2.TextYAlignment = "Top"
                        Inst2.BackgroundTransparency = 1
                        Inst2.TextStrokeTransparency = 0.5
                        Inst2.TextColor3 = Color3.fromRGB(255, 0, 0)
                        if I2.Name == "Flower1" then
                            Inst2.Text = "Blue Flower" .. " \n" .. Function2((game:GetService("Players").LocalPlayer.Character.Head.Position - I2.Position).Magnitude / 3) .. " Magnitude"
                            Inst2.TextColor3 = Color3.fromRGB(0, 0, 255)
                        end
                        if I2.Name == "Flower2" then
                            Inst2.Text = "Red Flower" .. " \n" .. Function2((game:GetService("Players").LocalPlayer.Character.Head.Position - I2.Position).Magnitude / 3) .. " Magnitude"
                            Inst2.TextColor3 = Color3.fromRGB(255, 0, 0)
                        end
                    else
                        I2["NameEsp" .. Random4].TextLabel.Text = I2.Name .. "   \n" .. Function2((game:GetService("Players").LocalPlayer.Character.Head.Position - I2.Position).Magnitude / 3) .. " Magnitude"
                    end
                elseif I2:FindFirstChild("NameEsp" .. Random4) then
                    I2:FindFirstChild("NameEsp" .. Random4):Destroy()
                end
            end
        end)
    end
end
Function19 = function()
    for I, I2 in pairs(game.Workspace.AppleSpawner:GetChildren()) do
        if I2:IsA("Tool") then
            if R036 then
                if not I2.Handle:FindFirstChild(("NameEsp" .. Random4)) then
                    local Inst = Instance.new("BillboardGui", I2.Handle)
                    Inst.Name = "NameEsp" .. Random4
                    Inst.ExtentsOffset = Vector3.new(0, 1, 0)
                    Inst.Size = UDim2.new(1, 200, 1, 30)
                    Inst.Adornee = I2.Handle
                    Inst.AlwaysOnTop = true
                    local Inst2 = Instance.new("TextLabel", Inst)
                    Inst2.Font = Enum.Font.GothamSemibold
                    Inst2.FontSize = "Size14"
                    Inst2.TextWrapped = true
                    Inst2.Size = UDim2.new(1, 0, 1, 0)
                    Inst2.TextYAlignment = "Top"
                    Inst2.BackgroundTransparency = 1
                    Inst2.TextStrokeTransparency = 0.5
                    Inst2.TextColor3 = Color3.fromRGB(255, 0, 0)
                    Inst2.Text = I2.Name .. " \n" .. Function2((game:GetService("Players").LocalPlayer.Character.Head.Position - I2.Handle.Position).Magnitude / 3) .. " Magnitude"
                else
                    I2.Handle["NameEsp" .. Random4].TextLabel.Text = I2.Name .. " " .. Function2((game:GetService("Players").LocalPlayer.Character.Head.Position - I2.Handle.Position).Magnitude / 3) .. " Magnitude"
                end
            elseif I2.Handle:FindFirstChild("NameEsp" .. Random4) then
                I2.Handle:FindFirstChild("NameEsp" .. Random4):Destroy()
            end
        end
    end
    for I, I2 in pairs(game.Workspace.PineappleSpawner:GetChildren()) do
        if I2:IsA("Tool") then
            if R036 then
                if not I2.Handle:FindFirstChild(("NameEsp" .. Random4)) then
                    local Inst = Instance.new("BillboardGui", I2.Handle)
                    Inst.Name = "NameEsp" .. Random4
                    Inst.ExtentsOffset = Vector3.new(0, 1, 0)
                    Inst.Size = UDim2.new(1, 200, 1, 30)
                    Inst.Adornee = I2.Handle
                    Inst.AlwaysOnTop = true
                    local Inst2 = Instance.new("TextLabel", Inst)
                    Inst2.Font = Enum.Font.GothamSemibold
                    Inst2.FontSize = "Size14"
                    Inst2.TextWrapped = true
                    Inst2.Size = UDim2.new(1, 0, 1, 0)
                    Inst2.TextYAlignment = "Top"
                    Inst2.BackgroundTransparency = 1
                    Inst2.TextStrokeTransparency = 0.5
                    Inst2.TextColor3 = Color3.fromRGB(255, 174, 0)
                    Inst2.Text = I2.Name .. " \n" .. Function2((game:GetService("Players").LocalPlayer.Character.Head.Position - I2.Handle.Position).Magnitude / 3) .. " Magnitude"
                else
                    I2.Handle["NameEsp" .. Random4].TextLabel.Text = I2.Name .. " " .. Function2((game:GetService("Players").LocalPlayer.Character.Head.Position - I2.Handle.Position).Magnitude / 3) .. " Magnitude"
                end
            elseif I2.Handle:FindFirstChild("NameEsp" .. Random4) then
                I2.Handle:FindFirstChild("NameEsp" .. Random4):Destroy()
            end
        end
    end
    for I, I2 in pairs(game.Workspace.BananaSpawner:GetChildren()) do
        if I2:IsA("Tool") then
            if R036 then
                if not I2.Handle:FindFirstChild(("NameEsp" .. Random4)) then
                    local Inst = Instance.new("BillboardGui", I2.Handle)
                    Inst.Name = "NameEsp" .. Random4
                    Inst.ExtentsOffset = Vector3.new(0, 1, 0)
                    Inst.Size = UDim2.new(1, 200, 1, 30)
                    Inst.Adornee = I2.Handle
                    Inst.AlwaysOnTop = true
                    local Inst2 = Instance.new("TextLabel", Inst)
                    Inst2.Font = Enum.Font.GothamSemibold
                    Inst2.FontSize = "Size14"
                    Inst2.TextWrapped = true
                    Inst2.Size = UDim2.new(1, 0, 1, 0)
                    Inst2.TextYAlignment = "Top"
                    Inst2.BackgroundTransparency = 1
                    Inst2.TextStrokeTransparency = 0.5
                    Inst2.TextColor3 = Color3.fromRGB(251, 255, 0)
                    Inst2.Text = I2.Name .. " \n" .. Function2((game:GetService("Players").LocalPlayer.Character.Head.Position - I2.Handle.Position).Magnitude / 3) .. " Magnitude"
                else
                    I2.Handle["NameEsp" .. Random4].TextLabel.Text = I2.Name .. " " .. Function2((game:GetService("Players").LocalPlayer.Character.Head.Position - I2.Handle.Position).Magnitude / 3) .. " Magnitude"
                end
            elseif I2.Handle:FindFirstChild("NameEsp" .. Random4) then
                I2.Handle:FindFirstChild("NameEsp" .. Random4):Destroy()
            end
        end
    end
end
Function13 = function()
    for I, I2 in pairs(game:GetService("Workspace")._WorldOrigin.Locations:GetChildren()) do
        pcall(function()
            if R023 and I2.Name ~= "Sea" then
                if not I2:FindFirstChild("NameEsp") then
                    local Inst = Instance.new("BillboardGui", I2)
                    Inst.Name = "NameEsp"
                    Inst.ExtentsOffset = Vector3.new(0, 1, 0)
                    Inst.Size = UDim2.new(1, 200, 1, 30)
                    Inst.Adornee = I2
                    Inst.AlwaysOnTop = true
                    local Inst2 = Instance.new("TextLabel", Inst)
                    Inst2.Font = "GothamBold"
                    Inst2.FontSize = "Size14"
                    Inst2.TextWrapped = true
                    Inst2.Size = UDim2.new(1, 0, 1, 0)
                    Inst2.TextYAlignment = "Top"
                    Inst2.BackgroundTransparency = 1
                    Inst2.TextStrokeTransparency = 0.5
                    Inst2.TextColor3 = Color3.fromRGB(7, 236, 240)
                else
                    I2.NameEsp.TextLabel.Text = I2.Name .. "   \n" .. Function2((game:GetService("Players").LocalPlayer.Character.Head.Position - I2.Position).Magnitude / 3) .. " Magnitude"
                end
            elseif I2:FindFirstChild("NameEsp") then
                I2:FindFirstChild("NameEsp"):Destroy()
            end
        end)
    end
end
Function22 = function(Param)
    return Param == nil
end
local function Function3(Param)
    return math.floor(tonumber(Param) + 0.5)
end
Random4 = math.random(1, 1000000)
Function15 = function()
    for I, I2 in pairs(game:GetService("Players"):GetChildren()) do
        pcall(function()
            if not Function22(I2.Character) then
                if R037 then
                    if not Function22(I2.Character.Head) and not I2.Character.Head:FindFirstChild(("NameEsp" .. Random4)) then
                        local Inst = Instance.new("BillboardGui", I2.Character.Head)
                        Inst.Name = "NameEsp" .. Random4
                        Inst.ExtentsOffset = Vector3.new(0, 1, 0)
                        Inst.Size = UDim2.new(1, 200, 1, 30)
                        Inst.Adornee = I2.Character.Head
                        Inst.AlwaysOnTop = true
                        local Inst2 = Instance.new("TextLabel", Inst)
                        Inst2.Font = Enum.Font.GothamSemibold
                        Inst2.FontSize = "Size14"
                        Inst2.TextWrapped = true
                        Inst2.Text = I2.Name .. " \n" .. Function3((game:GetService("Players").LocalPlayer.Character.Head.Position - I2.Character.Head.Position).Magnitude / 3) .. " Magnitude"
                        Inst2.Size = UDim2.new(1, 0, 1, 0)
                        Inst2.TextYAlignment = "Top"
                        Inst2.BackgroundTransparency = 1
                        Inst2.TextStrokeTransparency = 0.5
                        if I2.Team == game.Players.LocalPlayer.Team then
                            Inst2.TextColor3 = Color3.new(0, 255, 0)
                        else
                            Inst2.TextColor3 = Color3.new(255, 0, 0)
                        end
                    else
                        I2.Character.Head["NameEsp" .. Random4].TextLabel.Text = I2.Name .. " | " .. Function3((game:GetService("Players").LocalPlayer.Character.Head.Position - I2.Character.Head.Position).Magnitude / 3) .. " Magnitude\nHealth : " .. Function3(I2.Character.Humanoid.Health * 100 / I2.Character.Humanoid.MaxHealth) .. "%"
                    end
                elseif I2.Character.Head:FindFirstChild("NameEsp" .. Random4) then
                    I2.Character.Head:FindFirstChild("NameEsp" .. Random4):Destroy()
                end
            end
        end)
    end
end
Function16 = function()
    for I, I2 in pairs(game.Workspace:GetChildren()) do
        pcall(function()
            if string.find(I2.Name, "Chest") and I2:FindFirstChild("NameEsp" .. Random4) then
                I2:FindFirstChild("NameEsp" .. Random4):Destroy()
            end
        end)
    end
end
Function17 = function()
    for I, I2 in pairs(game.Workspace:GetChildren()) do
        pcall(function()
            if R0552 and string.find(I2.Name, "Fruit") then
                if not I2.Handle:FindFirstChild(("NameEsp" .. Random4)) then
                    local Inst = Instance.new("BillboardGui", I2.Handle)
                    Inst.Name = "NameEsp" .. Random4
                    Inst.ExtentsOffset = Vector3.new(0, 1, 0)
                    Inst.Size = UDim2.new(1, 200, 1, 30)
                    Inst.Adornee = I2.Handle
                    Inst.AlwaysOnTop = true
                    local Inst2 = Instance.new("TextLabel", Inst)
                    Inst2.Font = Enum.Font.GothamSemibold
                    Inst2.FontSize = "Size14"
                    Inst2.TextWrapped = true
                    Inst2.Size = UDim2.new(1, 0, 1, 0)
                    Inst2.TextYAlignment = "Top"
                    Inst2.BackgroundTransparency = 1
                    Inst2.TextStrokeTransparency = 0.5
                    Inst2.TextColor3 = Color3.fromRGB(255, 255, 255)
                    Inst2.Text = I2.Name .. " \n" .. Function3((game:GetService("Players").LocalPlayer.Character.Head.Position - I2.Handle.Position).Magnitude / 3) .. " Magnitude"
                else
                    I2.Handle["NameEsp" .. Random4].TextLabel.Text = I2.Name .. "   \n" .. Function3((game:GetService("Players").LocalPlayer.Character.Head.Position - I2.Handle.Position).Magnitude / 3) .. " Magnitude"
                end
            elseif I2.Handle:FindFirstChild("NameEsp" .. Random4) then
                I2.Handle:FindFirstChild("NameEsp" .. Random4):Destroy()
            end
        end)
    end
end
Function18 = function()
    for I, I2 in pairs(game.Workspace:GetChildren()) do
        pcall(function()
            if I2.Name == "Flower2" or I2.Name == "Flower1" then
                if R0367 then
                    if not I2:FindFirstChild(("NameEsp" .. Random4)) then
                        local Inst = Instance.new("BillboardGui", I2)
                        Inst.Name = "NameEsp" .. Random4
                        Inst.ExtentsOffset = Vector3.new(0, 1, 0)
                        Inst.Size = UDim2.new(1, 200, 1, 30)
                        Inst.Adornee = I2
                        Inst.AlwaysOnTop = true
                        local Inst2 = Instance.new("TextLabel", Inst)
                        Inst2.Font = Enum.Font.GothamSemibold
                        Inst2.FontSize = "Size14"
                        Inst2.TextWrapped = true
                        Inst2.Size = UDim2.new(1, 0, 1, 0)
                        Inst2.TextYAlignment = "Top"
                        Inst2.BackgroundTransparency = 1
                        Inst2.TextStrokeTransparency = 0.5
                        Inst2.TextColor3 = Color3.fromRGB(255, 0, 0)
                        if I2.Name == "Flower1" then
                            Inst2.Text = "Blue Flower" .. " \n" .. Function3((game:GetService("Players").LocalPlayer.Character.Head.Position - I2.Position).Magnitude / 3) .. " Magnitude"
                            Inst2.TextColor3 = Color3.fromRGB(0, 0, 255)
                        end
                        if I2.Name == "Flower2" then
                            Inst2.Text = "Red Flower" .. " \n" .. Function3((game:GetService("Players").LocalPlayer.Character.Head.Position - I2.Position).Magnitude / 3) .. " Magnitude"
                            Inst2.TextColor3 = Color3.fromRGB(255, 0, 0)
                        end
                    else
                        I2["NameEsp" .. Random4].TextLabel.Text = I2.Name .. "   \n" .. Function3((game:GetService("Players").LocalPlayer.Character.Head.Position - I2.Position).Magnitude / 3) .. " Magnitude"
                    end
                elseif I2:FindFirstChild("NameEsp" .. Random4) then
                    I2:FindFirstChild("NameEsp" .. Random4):Destroy()
                end
            end
        end)
    end
end
Function19 = function()
    for I, I2 in pairs(game.Workspace.AppleSpawner:GetChildren()) do
        if I2:IsA("Tool") then
            if R036 then
                if not I2.Handle:FindFirstChild(("NameEsp" .. Random4)) then
                    local Inst = Instance.new("BillboardGui", I2.Handle)
                    Inst.Name = "NameEsp" .. Random4
                    Inst.ExtentsOffset = Vector3.new(0, 1, 0)
                    Inst.Size = UDim2.new(1, 200, 1, 30)
                    Inst.Adornee = I2.Handle
                    Inst.AlwaysOnTop = true
                    local Inst2 = Instance.new("TextLabel", Inst)
                    Inst2.Font = Enum.Font.GothamSemibold
                    Inst2.FontSize = "Size14"
                    Inst2.TextWrapped = true
                    Inst2.Size = UDim2.new(1, 0, 1, 0)
                    Inst2.TextYAlignment = "Top"
                    Inst2.BackgroundTransparency = 1
                    Inst2.TextStrokeTransparency = 0.5
                    Inst2.TextColor3 = Color3.fromRGB(255, 0, 0)
                    Inst2.Text = I2.Name .. " \n" .. Function3((game:GetService("Players").LocalPlayer.Character.Head.Position - I2.Handle.Position).Magnitude / 3) .. " Magnitude"
                else
                    I2.Handle["NameEsp" .. Random4].TextLabel.Text = I2.Name .. " " .. Function3((game:GetService("Players").LocalPlayer.Character.Head.Position - I2.Handle.Position).Magnitude / 3) .. " Magnitude"
                end
            elseif I2.Handle:FindFirstChild("NameEsp" .. Random4) then
                I2.Handle:FindFirstChild("NameEsp" .. Random4):Destroy()
            end
        end
    end
    for I, I2 in pairs(game.Workspace.PineappleSpawner:GetChildren()) do
        if I2:IsA("Tool") then
            if R036 then
                if not I2.Handle:FindFirstChild(("NameEsp" .. Random4)) then
                    local Inst = Instance.new("BillboardGui", I2.Handle)
                    Inst.Name = "NameEsp" .. Random4
                    Inst.ExtentsOffset = Vector3.new(0, 1, 0)
                    Inst.Size = UDim2.new(1, 200, 1, 30)
                    Inst.Adornee = I2.Handle
                    Inst.AlwaysOnTop = true
                    local Inst2 = Instance.new("TextLabel", Inst)
                    Inst2.Font = Enum.Font.GothamSemibold
                    Inst2.FontSize = "Size14"
                    Inst2.TextWrapped = true
                    Inst2.Size = UDim2.new(1, 0, 1, 0)
                    Inst2.TextYAlignment = "Top"
                    Inst2.BackgroundTransparency = 1
                    Inst2.TextStrokeTransparency = 0.5
                    Inst2.TextColor3 = Color3.fromRGB(255, 174, 0)
                    Inst2.Text = I2.Name .. " \n" .. Function3((game:GetService("Players").LocalPlayer.Character.Head.Position - I2.Handle.Position).Magnitude / 3) .. " Magnitude"
                else
                    I2.Handle["NameEsp" .. Random4].TextLabel.Text = I2.Name .. " " .. Function3((game:GetService("Players").LocalPlayer.Character.Head.Position - I2.Handle.Position).Magnitude / 3) .. " Magnitude"
                end
            elseif I2.Handle:FindFirstChild("NameEsp" .. Random4) then
                I2.Handle:FindFirstChild("NameEsp" .. Random4):Destroy()
            end
        end
    end
    for I, I2 in pairs(game.Workspace.BananaSpawner:GetChildren()) do
        if I2:IsA("Tool") then
            if R036 then
                if not I2.Handle:FindFirstChild(("NameEsp" .. Random4)) then
                    local Inst = Instance.new("BillboardGui", I2.Handle)
                    Inst.Name = "NameEsp" .. Random4
                    Inst.ExtentsOffset = Vector3.new(0, 1, 0)
                    Inst.Size = UDim2.new(1, 200, 1, 30)
                    Inst.Adornee = I2.Handle
                    Inst.AlwaysOnTop = true
                    local Inst2 = Instance.new("TextLabel", Inst)
                    Inst2.Font = Enum.Font.GothamSemibold
                    Inst2.FontSize = "Size14"
                    Inst2.TextWrapped = true
                    Inst2.Size = UDim2.new(1, 0, 1, 0)
                    Inst2.TextYAlignment = "Top"
                    Inst2.BackgroundTransparency = 1
                    Inst2.TextStrokeTransparency = 0.5
                    Inst2.TextColor3 = Color3.fromRGB(251, 255, 0)
                    Inst2.Text = I2.Name .. " \n" .. Function3((game:GetService("Players").LocalPlayer.Character.Head.Position - I2.Handle.Position).Magnitude / 3) .. " Magnitude"
                else
                    I2.Handle["NameEsp" .. Random4].TextLabel.Text = I2.Name .. " " .. Function3((game:GetService("Players").LocalPlayer.Character.Head.Position - I2.Handle.Position).Magnitude / 3) .. " Magnitude"
                end
            elseif I2.Handle:FindFirstChild("NameEsp" .. Random4) then
                I2.Handle:FindFirstChild("NameEsp" .. Random4):Destroy()
            end
        end
    end
end
Function22 = function(Param)
    return Param == nil
end
local function Function4(Param)
    return math.floor(tonumber(Param) + 0.5)
end
Random4 = math.random(1, 1000000)
Function21 = function()
    for I, I2 in pairs(game:GetService("Workspace")._WorldOrigin.Locations:GetChildren()) do
        pcall(function()
            if R0259 and I2.Name == "Mirage Island" then
                if not I2:FindFirstChild("NameEsp") then
                    local Inst = Instance.new("BillboardGui", I2)
                    Inst.Name = "NameEsp"
                    Inst.ExtentsOffset = Vector3.new(0, 1, 0)
                    Inst.Size = UDim2.new(1, 200, 1, 30)
                    Inst.Adornee = I2
                    Inst.AlwaysOnTop = true
                    local Inst2 = Instance.new("TextLabel", Inst)
                    Inst2.Font = "Code"
                    Inst2.FontSize = "Size14"
                    Inst2.TextWrapped = true
                    Inst2.Size = UDim2.new(1, 0, 1, 0)
                    Inst2.TextYAlignment = "Top"
                    Inst2.BackgroundTransparency = 1
                    Inst2.TextStrokeTransparency = 0.5
                    Inst2.TextColor3 = Color3.fromRGB(80, 245, 245)
                else
                    I2.NameEsp.TextLabel.Text = I2.Name .. "   \n" .. Function4((game:GetService("Players").LocalPlayer.Character.Head.Position - I2.Position).Magnitude / 3) .. " M"
                end
            elseif I2:FindFirstChild("NameEsp") then
                I2:FindFirstChild("NameEsp"):Destroy()
            end
        end)
    end
end
Function22 = function(Param)
    return Param == nil
end
local function Function5(Param)
    return math.floor(tonumber(Param) + 0.5)
end
Random4 = math.random(1, 1000000)
Function23 = function()
    for I, I2 in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
        pcall(function()
            if R0158 and I2.Name == "Advanced Fruit Dealer" then
                if not I2:FindFirstChild("NameEsp") then
                    local Inst = Instance.new("BillboardGui", I2)
                    Inst.Name = "NameEsp"
                    Inst.ExtentsOffset = Vector3.new(0, 1, 0)
                    Inst.Size = UDim2.new(1, 200, 1, 30)
                    Inst.Adornee = I2
                    Inst.AlwaysOnTop = true
                    local Inst2 = Instance.new("TextLabel", Inst)
                    Inst2.Font = "Code"
                    Inst2.FontSize = "Size14"
                    Inst2.TextWrapped = true
                    Inst2.Size = UDim2.new(1, 0, 1, 0)
                    Inst2.TextYAlignment = "Top"
                    Inst2.BackgroundTransparency = 1
                    Inst2.TextStrokeTransparency = 0.5
                    Inst2.TextColor3 = Color3.fromRGB(80, 245, 245)
                else
                    I2.NameEsp.TextLabel.Text = I2.Name .. "   \n" .. Function5((game:GetService("Players").LocalPlayer.Character.Head.Position - I2.Position).Magnitude / 3) .. " M"
                end
            elseif I2:FindFirstChild("NameEsp") then
                I2:FindFirstChild("NameEsp"):Destroy()
            end
        end)
    end
end
Function24 = function()
    for I, I2 in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
        pcall(function()
            if AuraESP and I2.Name == "Master of Enhancement" then
                if not I2:FindFirstChild("NameEsp") then
                    local Inst = Instance.new("BillboardGui", I2)
                    Inst.Name = "NameEsp"
                    Inst.ExtentsOffset = Vector3.new(0, 1, 0)
                    Inst.Size = UDim2.new(1, 200, 1, 30)
                    Inst.Adornee = I2
                    Inst.AlwaysOnTop = true
                    local Inst2 = Instance.new("TextLabel", Inst)
                    Inst2.Font = "Code"
                    Inst2.FontSize = "Size14"
                    Inst2.TextWrapped = true
                    Inst2.Size = UDim2.new(1, 0, 1, 0)
                    Inst2.TextYAlignment = "Top"
                    Inst2.BackgroundTransparency = 1
                    Inst2.TextStrokeTransparency = 0.5
                    Inst2.TextColor3 = Color3.fromRGB(80, 245, 245)
                else
                    I2.NameEsp.TextLabel.Text = I2.Name .. "   \n" .. Function5((game:GetService("Players").LocalPlayer.Character.Head.Position - I2.Position).Magnitude / 3) .. " M"
                end
            elseif I2:FindFirstChild("NameEsp") then
                I2:FindFirstChild("NameEsp"):Destroy()
            end
        end)
    end
end
Function25 = function()
    for I, I2 in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
        pcall(function()
            if LADESP and I2.Name == "Legendary Sword Dealer" then
                if not I2:FindFirstChild("NameEsp") then
                    local Inst = Instance.new("BillboardGui", I2)
                    Inst.Name = "NameEsp"
                    Inst.ExtentsOffset = Vector3.new(0, 1, 0)
                    Inst.Size = UDim2.new(1, 200, 1, 30)
                    Inst.Adornee = I2
                    Inst.AlwaysOnTop = true
                    local Inst2 = Instance.new("TextLabel", Inst)
                    Inst2.Font = "Code"
                    Inst2.FontSize = "Size14"
                    Inst2.TextWrapped = true
                    Inst2.Size = UDim2.new(1, 0, 1, 0)
                    Inst2.TextYAlignment = "Top"
                    Inst2.BackgroundTransparency = 1
                    Inst2.TextStrokeTransparency = 0.5
                    Inst2.TextColor3 = Color3.fromRGB(80, 245, 245)
                else
                    I2.NameEsp.TextLabel.Text = I2.Name .. "   \n" .. Function5((game:GetService("Players").LocalPlayer.Character.Head.Position - I2.Position).Magnitude / 3) .. " M"
                end
            elseif I2:FindFirstChild("NameEsp") then
                I2:FindFirstChild("NameEsp"):Destroy()
            end
        end)
    end
end
Function26 = function()
    for I, I2 in pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do
        pcall(function()
            if GearESP and I2.Name == "MeshPart" then
                if not I2:FindFirstChild("NameEsp") then
                    local Inst = Instance.new("BillboardGui", I2)
                    Inst.Name = "NameEsp"
                    Inst.ExtentsOffset = Vector3.new(0, 1, 0)
                    Inst.Size = UDim2.new(1, 200, 1, 30)
                    Inst.Adornee = I2
                    Inst.AlwaysOnTop = true
                    local Inst2 = Instance.new("TextLabel", Inst)
                    Inst2.Font = "Code"
                    Inst2.FontSize = "Size14"
                    Inst2.TextWrapped = true
                    Inst2.Size = UDim2.new(1, 0, 1, 0)
                    Inst2.TextYAlignment = "Top"
                    Inst2.BackgroundTransparency = 1
                    Inst2.TextStrokeTransparency = 0.5
                    Inst2.TextColor3 = Color3.fromRGB(80, 245, 245)
                else
                    I2.NameEsp.TextLabel.Text = I2.Name .. "   \n" .. Function5((game:GetService("Players").LocalPlayer.Character.Head.Position - I2.Position).Magnitude / 3) .. " M"
                end
            elseif I2:FindFirstChild("NameEsp") then
                I2:FindFirstChild("NameEsp"):Destroy()
            end
        end)
    end
end
Function27 = function()
    if InfAbility and not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
        local Inst = Instance.new("ParticleEmitter")
        Inst.Acceleration = Vector3.new(0, 0, 0)
        Inst.Archivable = true
        Inst.Drag = 20
        Inst.EmissionDirection = Enum.NormalId.Top
        Inst.Enabled = true
        Inst.Lifetime = NumberRange.new(0, 0)
        Inst.LightInfluence = 0
        Inst.LockedToPart = true
        Inst.Name = "Agility"
        Inst.Rate = 500
        Inst.Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(1, 4)
        })
        Inst.RotSpeed = NumberRange.new(9999, 99999)
        Inst.Rotation = NumberRange.new(0, 0)
        Inst.Speed = NumberRange.new(30, 30)
        Inst.SpreadAngle = Vector2.new(0, 0, 0, 0)
        Inst.Texture = ""
        Inst.VelocityInheritance = 0
        Inst.ZOffset = 2
        Inst.Transparency = NumberSequence.new(0)
        Inst.Color = ColorSequence.new(Color3.fromRGB(0, 0, 0), Color3.fromRGB(0, 0, 0))
        Inst.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
    elseif game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
    end
end
local Player = game:GetService("Players").LocalPlayer
local Value = Player.Character.Energy.Value
Function28 = function()
    Player.Character.Energy.Changed:connect(function()
        if InfiniteEnergy then
            Player.Character.Energy.Value = Value
        end
    end)
end
spawn(function()
    pcall(function()
        while wait(0.1) do
            local InfiniteEnergy = InfiniteEnergy
            if InfiniteEnergy then
                wait(0.1)
                Value = Player.Character.Energy.Value
                Function28()
            end
        end
    end)
end)
Function29 = function()
    game:GetService("VirtualUser"):CaptureController()
    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
end
Function30 = function()
    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
end
Function31 = function(Param)
    if game.Players.LocalPlayer.Character:FindFirstChild(Param) then
        _G.NotAutoEquip = true
        wait(0.5)
        game.Players.LocalPlayer.Character:FindFirstChild(Param).Parent = game.Players.LocalPlayer.Backpack
        wait(0.1)
        _G.NotAutoEquip = false
    end
end
Function32 = function(Param)
    if not _G.NotAutoEquip and game.Players.LocalPlayer.Backpack:FindFirstChild(Param) then
        Tool = game.Players.LocalPlayer.Backpack:FindFirstChild(Param)
        wait(0.1)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tool)
    end
end
Function33 = function(Input)
    pcall(function()
        if 1500 <= (Input.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude and not Auto_Raid and 0 < game.Players.LocalPlayer.Character.Humanoid.Health then
            while true do
                wait()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Input
                wait(0.05)
                game.Players.LocalPlayer.Character.Head:Destroy()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Input
                if (Input.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 1500 then
                    local Health = game.Players.LocalPlayer.Character.Humanoid.Health
                    if Health > 0 then
                        break
                    end
                end
            end
        end
    end)
end
Function34 = function(Param)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Param
end
Function35 = function(Input)
    Magnitude = (Input.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
        game.Players.LocalPlayer.Character.Humanoid.Sit = false
    end
    pcall(function()
        Result3 = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Magnitude / 210, Enum.EasingStyle.Linear), {
            CFrame = Input
        })
    end)
    Result3:Play()
    if Magnitude <= 250 then
        Result3:Cancel()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Input
    end
    if _G.Function38 == true then
        Result3:Cancel()
        _G.Clip = false
    end
end
Function36 = function(Input)
    Result3 = game:service("TweenService"):Create(game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat, TweenInfo.new((game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat.CFrame.Position - Input.Position).Magnitude / 300, Enum.EasingStyle.Linear), {
        CFrame = Input
    })
    Result3:Play()
    return {
        Stop = function(Param)
            Result3:Cancel()
        end
    }
end
Function37 = function(Input)
    if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health <= 0 or not game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid") then
        Result3:Cancel()
        while true do
            wait()
            if game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid") then
                local Health = game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health
                if Health > 0 then
                    break
                end
            end
        end
        wait(7)
        return
    end
    Result3 = game:service("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Input.Position).Magnitude / 325, Enum.EasingStyle.Linear), {
        CFrame = Input
    })
    Result3:Play()
    return {
        Stop = function(Param)
            Result3:Cancel()
        end
    }
end
Number101 = 1
spawn(function()
    while wait(0) do
        local Number101 = Number101
        if Number101 == 1 then
            Number101 = CFrame.new(0, Number94, -30)
            R03664 = Number101
        else
            Number101 = Number101
            if Number101 == 2 then
                Number101 = CFrame.new(30, Number94, 0)
                R03664 = Number101
            else
                Number101 = Number101
                if Number101 == 3 then
                    Number101 = CFrame.new(0, Number94, 30)
                    R03664 = Number101
                else
                    Number101 = Number101
                    if Number101 == 4 then
                        Number101 = CFrame.new(-30, Number94, 0)
                        R03664 = Number101
                    end
                end
            end
        end
    end
end)
spawn(function()
    while wait(0) do
        Number101 = 1
        wait(0)
        Number101 = 2
        wait(0)
        Number101 = 3
        wait(0)
        Number101 = 4
        wait(0)
        Number101 = 5
        wait(0)
    end
end)
spawn(function()
    game:GetService("RunService").Heartbeat:Connect(function()
        if not _G.AutoAdvanceDungeon and not _G.AutoDoughtBoss and not _G.Auto_DungeonMobAura and not _G.AutoFarmChest and not _G.AutoFactory and not _G.AutoFarmBossHallow and not _G.AutoFarmSwanGlasses and not _G.AutoLongSword and not _G.AutoBlackSpikeycoat and not _G.AutoElectricClaw and not _G.AutoFarmGunMastery and not _G.AutoHolyTorch and not _G.AutoLawRaid and not _G.AutoFarmBoss and not _G.AutoTwinHooks and not _G.AutoOpenSwanDoor and not _G.AutoDragon_Trident and not _G.AutoSaber and not _G.NOCLIP and not _G.AutoFarmFruitMastery and not _G.AutoFarmGunMastery and not _G.TeleportIsland and not _G.Auto_EvoRace and not _G.AutoFarmAllMsBypassType and not _G.AutoObservationv2 and not _G.AutoMusketeerHat and not _G.AutoEctoplasm and not _G.AutoRengoku and not _G.Auto_Rainbow_Haki and not _G.AutoObservation and not _G.AutoDarkDagger and not _G.Safe_Mode and not _G.MasteryFruit and not _G.AutoBudySword and not _G.AutoOderSword and not _G.AutoBounty and not _G.AutoAllBoss and not _G.Auto_Bounty and not _G.AutoSharkman and not _G.Auto_Mastery_Fruit and not _G.Auto_Mastery_Gun and not _G.Auto_Dungeon and not _G.Auto_Cavender and not _G.Auto_Pole and not _G.Auto_Kill_Ply and not _G.Auto_Factory and not _G.AutoSecondSea and not _G.TeleportPly and not _G.AutoBartilo and not _G.Auto_DarkBoss and not _G.GrabChest and not _G.AutoFarmBounty and not _G.Holy_Torch and not _G.AutoFarm and not _G.Clip and not _G.AutoElitehunter and not _G.AutoThirdSea and not _G.Auto_Bone and not _G.Autoheart and not _G.Autodoughking and not _G.AutoFarmMaterial and not _G.AutoNevaSoulGuitar and not _G.Auto_Dragon_Trident and not _G.Autotushita and not _G.d and not _G.Autowaden and not _G.Autogay and not _G.Autopole and not _G.Autosaw and not _G.AutoObservationHakiV2 and not _G.AutoFarmNearest and not AutoFarmChest and not _G.AutoCarvender and not _G.AutoTwinHook and not AutoMobAura and not _G.Tweenfruit and not _G.AutoKai and not _G.TeleportNPC and not _G.Leather and not _G.Auto_Wing and not _G.Umm and not _G.Makori_gay and not R0177 and not R0312 and not R0724 and not R0172 and not R0401 and not R0114 and not R05 and not _G.AutoFarmSeabaest and not _G.Auto_Cursed_Dual_Katana and not _G.AutoFarmMob and not _G.AutoMysticIsland and not _G.AutoFarmDungeon and not _G.AutoRaidPirate and not _G.AutoQuestRace and not _G.TweenMGear and not getgenv().AutoFarm and not _G.AutoPlayerHunter and not _G.AutoFactory and not Grab_Chest then
            if _G.Namfon or _G.AutoSwordMastery or _G.AutoSeaBest or _G.AutoKillTial or _G.Auto_Saber or _G.Position_Spawn or _G.Farmfast or _G.AutoRace or _G.RaidPirate or R0505 then
                if not game:GetService("Workspace"):FindFirstChild("LOL") then
                    local Inst = Instance.new("Part")
                    Inst.Name = "LOL"
                    Inst.Parent = game.Workspace
                    Inst.Anchored = true
                    Inst.Transparency = 1
                    Inst.Size = Vector3.new(30, -0.5, 30)
                elseif game:GetService("Workspace"):FindFirstChild("LOL") then
                    game.Workspace.LOL.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -3.6, 0)
                end
            elseif game:GetService("Workspace"):FindFirstChild("LOL") then
                game:GetService("Workspace"):FindFirstChild("LOL"):Destroy()
            end
        else
            -- empty block
        end
    end)
end)
spawn(function()
    pcall(function()
        while wait() do
            local AutoAdvanceDungeon = _G.AutoAdvanceDungeon
            if not AutoAdvanceDungeon then
                AutoAdvanceDungeon = _G.AutoDoughtBoss
                if not AutoAdvanceDungeon then
                    AutoAdvanceDungeon = _G.Auto_DungeonMobAura
                    if not AutoAdvanceDungeon then
                        AutoAdvanceDungeon = _G.AutoFarmChest
                        if not AutoAdvanceDungeon then
                            AutoAdvanceDungeon = _G.AutoFactory
                            if not AutoAdvanceDungeon then
                                AutoAdvanceDungeon = _G.AutoFarmBossHallow
                                if not AutoAdvanceDungeon then
                                    AutoAdvanceDungeon = _G.AutoFarmSwanGlasses
                                    if not AutoAdvanceDungeon then
                                        AutoAdvanceDungeon = _G.AutoLongSword
                                        if not AutoAdvanceDungeon then
                                            AutoAdvanceDungeon = _G.AutoBlackSpikeycoat
                                            if not AutoAdvanceDungeon then
                                                AutoAdvanceDungeon = _G.AutoElectricClaw
                                                if not AutoAdvanceDungeon then
                                                    AutoAdvanceDungeon = _G.AutoFarmGunMastery
                                                    if not AutoAdvanceDungeon then
                                                        AutoAdvanceDungeon = _G.AutoHolyTorch
                                                        if not AutoAdvanceDungeon then
                                                            AutoAdvanceDungeon = _G.AutoLawRaid
                                                            if not AutoAdvanceDungeon then
                                                                AutoAdvanceDungeon = _G.AutoFarmBoss
                                                                if not AutoAdvanceDungeon then
                                                                    AutoAdvanceDungeon = _G.AutoTwinHooks
                                                                    if not AutoAdvanceDungeon then
                                                                        AutoAdvanceDungeon = _G.AutoOpenSwanDoor
                                                                        if not AutoAdvanceDungeon then
                                                                            AutoAdvanceDungeon = _G.AutoDragon_Trident
                                                                            if not AutoAdvanceDungeon then
                                                                                AutoAdvanceDungeon = _G.AutoSaber
                                                                                if not AutoAdvanceDungeon then
                                                                                    AutoAdvanceDungeon = _G.AutoFarmFruitMastery
                                                                                    if not AutoAdvanceDungeon then
                                                                                        AutoAdvanceDungeon = _G.AutoFarmGunMastery
                                                                                        if not AutoAdvanceDungeon then
                                                                                            AutoAdvanceDungeon = _G.TeleportIsland
                                                                                            if not AutoAdvanceDungeon then
                                                                                                AutoAdvanceDungeon = _G.Auto_EvoRace
                                                                                                if not AutoAdvanceDungeon then
                                                                                                    AutoAdvanceDungeon = _G.AutoFarmAllMsBypassType
                                                                                                    if not AutoAdvanceDungeon then
                                                                                                        AutoAdvanceDungeon = _G.AutoObservationv2
                                                                                                        if not AutoAdvanceDungeon then
                                                                                                            AutoAdvanceDungeon = _G.AutoMusketeerHat
                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                AutoAdvanceDungeon = _G.AutoEctoplasm
                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                    AutoAdvanceDungeon = _G.AutoRengoku
                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                        AutoAdvanceDungeon = _G.Auto_Rainbow_Haki
                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                            AutoAdvanceDungeon = _G.AutoObservation
                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                AutoAdvanceDungeon = _G.AutoDarkDagger
                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                    AutoAdvanceDungeon = _G.Safe_Mode
                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                        AutoAdvanceDungeon = _G.MasteryFruit
                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                            AutoAdvanceDungeon = _G.AutoBudySword
                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                AutoAdvanceDungeon = _G.AutoOderSword
                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                    AutoAdvanceDungeon = _G.AutoBounty
                                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                                        AutoAdvanceDungeon = _G.AutoAllBoss
                                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                                            AutoAdvanceDungeon = _G.Auto_Bounty
                                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                                AutoAdvanceDungeon = _G.AutoSharkman
                                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                                    AutoAdvanceDungeon = _G.Auto_Mastery_Fruit
                                                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                                                        AutoAdvanceDungeon = _G.Auto_Mastery_Gun
                                                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                                                            AutoAdvanceDungeon = _G.Auto_Dungeon
                                                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                                                AutoAdvanceDungeon = _G.Auto_Cavender
                                                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                                                    AutoAdvanceDungeon = _G.Auto_Pole
                                                                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                                                                        AutoAdvanceDungeon = _G.Auto_Kill_Ply
                                                                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                                                                            AutoAdvanceDungeon = _G.Auto_Factory
                                                                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                                                                AutoAdvanceDungeon = _G.AutoSecondSea
                                                                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                                                                    AutoAdvanceDungeon = _G.TeleportPly
                                                                                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                                                                                        AutoAdvanceDungeon = _G.AutoBartilo
                                                                                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                                                                                            AutoAdvanceDungeon = _G.Auto_DarkBoss
                                                                                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                                                                                AutoAdvanceDungeon = _G.GrabChest
                                                                                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                                                                                    AutoAdvanceDungeon = _G.AutoFarmBounty
                                                                                                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                                                                                                        AutoAdvanceDungeon = _G.Holy_Torch
                                                                                                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                                                                                                            AutoAdvanceDungeon = _G.AutoFarm
                                                                                                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                AutoAdvanceDungeon = _G.Clip
                                                                                                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                    AutoAdvanceDungeon = FarmBoss
                                                                                                                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                        AutoAdvanceDungeon = _G.AutoElitehunter
                                                                                                                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                            AutoAdvanceDungeon = _G.AutoThirdSea
                                                                                                                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                AutoAdvanceDungeon = _G.Auto_Bone
                                                                                                                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                    AutoAdvanceDungeon = _G.Autoheart
                                                                                                                                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                        AutoAdvanceDungeon = _G.Autodoughking
                                                                                                                                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                            AutoAdvanceDungeon = _G.AutoFarmMaterial
                                                                                                                                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                AutoAdvanceDungeon = _G.AutoNevaSoulGuitar
                                                                                                                                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                    AutoAdvanceDungeon = _G.Auto_Dragon_Trident
                                                                                                                                                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                        AutoAdvanceDungeon = _G.Autotushita
                                                                                                                                                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                            AutoAdvanceDungeon = _G.d
                                                                                                                                                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                AutoAdvanceDungeon = _G.Autowaden
                                                                                                                                                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                    AutoAdvanceDungeon = _G.Autogay
                                                                                                                                                                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                        AutoAdvanceDungeon = _G.Autopole
                                                                                                                                                                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                            AutoAdvanceDungeon = _G.Autosaw
                                                                                                                                                                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                AutoAdvanceDungeon = _G.AutoObservationHakiV2
                                                                                                                                                                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                    AutoAdvanceDungeon = _G.AutoFarmNearest
                                                                                                                                                                                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                        AutoAdvanceDungeon = AutoFarmChest
                                                                                                                                                                                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                            AutoAdvanceDungeon = _G.AutoCarvender
                                                                                                                                                                                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                AutoAdvanceDungeon = _G.AutoTwinHook
                                                                                                                                                                                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                    AutoAdvanceDungeon = AutoMobAura
                                                                                                                                                                                                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                        AutoAdvanceDungeon = _G.Tweenfruit
                                                                                                                                                                                                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                            AutoAdvanceDungeon = _G.TeleportNPC
                                                                                                                                                                                                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                AutoAdvanceDungeon = _G.Leather
                                                                                                                                                                                                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                    AutoAdvanceDungeon = _G.Auto_Wing
                                                                                                                                                                                                                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                        AutoAdvanceDungeon = _G.Umm
                                                                                                                                                                                                                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                            AutoAdvanceDungeon = _G.Makori_gay
                                                                                                                                                                                                                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                AutoAdvanceDungeon = R0177
                                                                                                                                                                                                                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                    AutoAdvanceDungeon = R0312
                                                                                                                                                                                                                                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                        AutoAdvanceDungeon = R0724
                                                                                                                                                                                                                                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                            AutoAdvanceDungeon = R0172
                                                                                                                                                                                                                                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                AutoAdvanceDungeon = R0401
                                                                                                                                                                                                                                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                    AutoAdvanceDungeon = R0114
                                                                                                                                                                                                                                                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                        AutoAdvanceDungeon = R05
                                                                                                                                                                                                                                                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                            AutoAdvanceDungeon = _G.AutoFarmSeabaest
                                                                                                                                                                                                                                                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                AutoAdvanceDungeon = _G.Auto_Cursed_Dual_Katana
                                                                                                                                                                                                                                                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                    AutoAdvanceDungeon = _G.AutoFarmMob
                                                                                                                                                                                                                                                                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                        AutoAdvanceDungeon = _G.AutoMysticIsland
                                                                                                                                                                                                                                                                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                            AutoAdvanceDungeon = _G.AutoFarmDungeon
                                                                                                                                                                                                                                                                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                AutoAdvanceDungeon = _G.AutoRaidPirate
                                                                                                                                                                                                                                                                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                    AutoAdvanceDungeon = _G.AutoQuestRace
                                                                                                                                                                                                                                                                                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                        AutoAdvanceDungeon = _G.TweenMGear
                                                                                                                                                                                                                                                                                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                            AutoAdvanceDungeon = getgenv().AutoFarm
                                                                                                                                                                                                                                                                                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                AutoAdvanceDungeon = _G.AutoPlayerHunter
                                                                                                                                                                                                                                                                                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                    AutoAdvanceDungeon = _G.AutoFactory
                                                                                                                                                                                                                                                                                                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                        AutoAdvanceDungeon = Grab_Chest
                                                                                                                                                                                                                                                                                                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                            AutoAdvanceDungeon = _G.Namfon
                                                                                                                                                                                                                                                                                                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                                AutoAdvanceDungeon = _G.AutoSwordMastery
                                                                                                                                                                                                                                                                                                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                                    AutoAdvanceDungeon = _G.Auto_Seabest
                                                                                                                                                                                                                                                                                                                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                                        AutoAdvanceDungeon = _G.AutoSeaBest
                                                                                                                                                                                                                                                                                                                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                                            AutoAdvanceDungeon = _G.AutoKillTial
                                                                                                                                                                                                                                                                                                                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                                                AutoAdvanceDungeon = _G.Auto_Saber
                                                                                                                                                                                                                                                                                                                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                                                    AutoAdvanceDungeon = _G.Position_Spawn
                                                                                                                                                                                                                                                                                                                                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                                                        AutoAdvanceDungeon = _G.Farmfast
                                                                                                                                                                                                                                                                                                                                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                                                            AutoAdvanceDungeon = _G.AutoRace
                                                                                                                                                                                                                                                                                                                                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                AutoAdvanceDungeon = _G.RaidPirate
                                                                                                                                                                                                                                                                                                                                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                    AutoAdvanceDungeon = R0505
                                                                                                                                                                                                                                                                                                                                                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                        AutoAdvanceDungeon = _G.AutoTerrorshark
                                                                                                                                                                                                                                                                                                                                                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                            AutoAdvanceDungeon = R0698
                                                                                                                                                                                                                                                                                                                                                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                AutoAdvanceDungeon = _G.farmpiranya
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    AutoAdvanceDungeon = _G.Fish_Crew_Member
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        AutoAdvanceDungeon = _G.DomadicAutoDriveBoat
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            AutoAdvanceDungeon = _G.bjirFishBoat
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                AutoAdvanceDungeon = _G.KillGhostShip
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    AutoAdvanceDungeon = _G.AutoFrozenDimension
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        AutoAdvanceDungeon = _G.AutoFKitsune
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        if AutoAdvanceDungeon ~= true then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            -- empty block
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                end
                                                                                                                                                                                                                            end
                                                                                                                                                                                                                        end
                                                                                                                                                                                                                    end
                                                                                                                                                                                                                end
                                                                                                                                                                                                            end
                                                                                                                                                                                                        end
                                                                                                                                                                                                    end
                                                                                                                                                                                                end
                                                                                                                                                                                            end
                                                                                                                                                                                        end
                                                                                                                                                                                    end
                                                                                                                                                                                end
                                                                                                                                                                            end
                                                                                                                                                                        end
                                                                                                                                                                    end
                                                                                                                                                                end
                                                                                                                                                            end
                                                                                                                                                        end
                                                                                                                                                    end
                                                                                                                                                end
                                                                                                                                            end
                                                                                                                                        end
                                                                                                                                    end
                                                                                                                                end
                                                                                                                            end
                                                                                                                        end
                                                                                                                    end
                                                                                                                end
                                                                                                            end
                                                                                                        end
                                                                                                    end
                                                                                                end
                                                                                            end
                                                                                        end
                                                                                    end
                                                                                end
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
            AutoAdvanceDungeon = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip")
            if not AutoAdvanceDungeon then
                AutoAdvanceDungeon = Instance.new("BodyVelocity")
                AutoAdvanceDungeon.Name = "BodyClip"
                AutoAdvanceDungeon.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                AutoAdvanceDungeon.MaxForce = Vector3.new(100000, 100000, 100000)
                AutoAdvanceDungeon.Velocity = Vector3.new(0, 0, 0)
            end
        end
    end)
end)
spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if not _G.AutoAdvanceDungeon and not _G.AutoDoughtBoss and not _G.Auto_DungeonMobAura and not _G.AutoFarmChest and not _G.AutoFactory and not _G.AutoFarmBossHallow and not _G.AutoFarmSwanGlasses and not _G.AutoLongSword and not _G.AutoBlackSpikeycoat and not _G.AutoElectricClaw and not _G.AutoFarmGunMastery and not _G.AutoHolyTorch and not _G.AutoLawRaid and not _G.AutoFarmBoss and not _G.AutoTwinHooks and not _G.AutoOpenSwanDoor and not _G.AutoDragon_Trident and not _G.AutoSaber and not _G.NOCLIP and not _G.AutoFarmFruitMastery and not _G.AutoFarmGunMastery and not _G.TeleportIsland and not _G.Auto_EvoRace and not _G.AutoFarmAllMsBypassType and not _G.AutoObservationv2 and not _G.AutoMusketeerHat and not _G.AutoEctoplasm and not _G.AutoRengoku and not _G.Auto_Rainbow_Haki and not _G.AutoObservation and not _G.AutoDarkDagger and not _G.Safe_Mode and not _G.MasteryFruit and not _G.AutoBudySword and not _G.AutoOderSword and not _G.AutoBounty and not _G.AutoAllBoss and not _G.Auto_Bounty and not _G.AutoSharkman and not _G.Auto_Mastery_Fruit and not _G.Auto_Mastery_Gun and not _G.Auto_Dungeon and not _G.Auto_Cavender and not _G.Auto_Pole and not _G.Auto_Kill_Ply and not _G.Auto_Factory and not _G.AutoSecondSea and not _G.TeleportPly and not _G.AutoBartilo and not _G.Auto_DarkBoss and not _G.GrabChest and not _G.AutoFarmBounty and not _G.Holy_Torch and not _G.AutoFarm and not _G.Clip and not _G.AutoElitehunter and not _G.AutoThirdSea and not _G.Auto_Bone and not _G.Autoheart and not _G.Autodoughking and not _G.AutoFarmMaterial and not _G.AutoNevaSoulGuitar and not _G.Auto_Dragon_Trident and not _G.Autotushita and not _G.Autowaden and not _G.Autogay and not _G.Autopole and not _G.Autosaw and not _G.AutoObservationHakiV2 and not _G.AutoFarmNearest and not _G.AutoCarvender and not _G.AutoTwinHook and not AutoMobAura and not _G.Tweenfruit and not _G.TeleportNPC and not _G.AutoKai and not _G.Leather and not _G.Auto_Wing and not _G.Umm and not _G.Makori_gay and not R0177 and not R0312 and not R0724 and not R0172 and not R0401 and not R0114 and not R05 and not _G.AutoFarmSeabaest and not _G.Auto_Cursed_Dual_Katana and not _G.AutoFarmMob and not _G.AutoMysticIsland and not _G.AutoFarmDungeon and not _G.AutoRaidPirate and not _G.AutoQuestRace and not _G.TweenMGear and not getgenv().AutoFarm and not _G.AutoPlayerHunter and not _G.AutoFactory and not _G.Namfon and not _G.AutoSwordMastery and not _G.Auto_Seabest then
                if _G.AutoSeaBest or _G.AutoKillTial or _G.Auto_Saber or _G.Position_Spawn or _G.Function36 or _G.Farmfast or _G.AutoRace or _G.RaidPirate or R0505 or _G.AutoTerrorshark or R0698 or _G.farmpiranya or _G.Fish_Crew_Member or _G.DomadicAutoDriveBoat or _G.AutoFrozenDimension or _G.AutoFKitsune == true then
                    for I, I2 in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                        if I2:IsA("BasePart") then
                            I2.CanCollide = false
                        end
                    end
                end
            else
                -- empty block
            end
        end)
    end)
end)
spawn(function()
    pcall(function()
        while wait() do
            local AutoAdvanceDungeon = _G.AutoAdvanceDungeon
            if not AutoAdvanceDungeon then
                AutoAdvanceDungeon = _G.AutoDoughtBoss
                if not AutoAdvanceDungeon then
                    AutoAdvanceDungeon = _G.Auto_DungeonMobAura
                    if not AutoAdvanceDungeon then
                        AutoAdvanceDungeon = _G.AutoFarmChest
                        if not AutoAdvanceDungeon then
                            AutoAdvanceDungeon = _G.AutoFactory
                            if not AutoAdvanceDungeon then
                                AutoAdvanceDungeon = _G.AutoFarmBossHallow
                                if not AutoAdvanceDungeon then
                                    AutoAdvanceDungeon = _G.AutoFarmSwanGlasses
                                    if not AutoAdvanceDungeon then
                                        AutoAdvanceDungeon = _G.AutoLongSword
                                        if not AutoAdvanceDungeon then
                                            AutoAdvanceDungeon = _G.AutoBlackSpikeycoat
                                            if not AutoAdvanceDungeon then
                                                AutoAdvanceDungeon = _G.AutoElectricClaw
                                                if not AutoAdvanceDungeon then
                                                    AutoAdvanceDungeon = _G.AutoFarmGunMastery
                                                    if not AutoAdvanceDungeon then
                                                        AutoAdvanceDungeon = _G.AutoHolyTorch
                                                        if not AutoAdvanceDungeon then
                                                            AutoAdvanceDungeon = _G.AutoLawRaid
                                                            if not AutoAdvanceDungeon then
                                                                AutoAdvanceDungeon = _G.AutoFarmBoss
                                                                if not AutoAdvanceDungeon then
                                                                    AutoAdvanceDungeon = _G.AutoTwinHooks
                                                                    if not AutoAdvanceDungeon then
                                                                        AutoAdvanceDungeon = _G.AutoOpenSwanDoor
                                                                        if not AutoAdvanceDungeon then
                                                                            AutoAdvanceDungeon = _G.AutoDragon_Trident
                                                                            if not AutoAdvanceDungeon then
                                                                                AutoAdvanceDungeon = _G.AutoSaber
                                                                                if not AutoAdvanceDungeon then
                                                                                    AutoAdvanceDungeon = _G.AutoFarmFruitMastery
                                                                                    if not AutoAdvanceDungeon then
                                                                                        AutoAdvanceDungeon = _G.AutoFarmGunMastery
                                                                                        if not AutoAdvanceDungeon then
                                                                                            AutoAdvanceDungeon = _G.TeleportIsland
                                                                                            if not AutoAdvanceDungeon then
                                                                                                AutoAdvanceDungeon = _G.Auto_EvoRace
                                                                                                if not AutoAdvanceDungeon then
                                                                                                    AutoAdvanceDungeon = _G.AutoFarmAllMsBypassType
                                                                                                    if not AutoAdvanceDungeon then
                                                                                                        AutoAdvanceDungeon = _G.AutoObservationv2
                                                                                                        if not AutoAdvanceDungeon then
                                                                                                            AutoAdvanceDungeon = _G.AutoMusketeerHat
                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                AutoAdvanceDungeon = _G.AutoEctoplasm
                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                    AutoAdvanceDungeon = _G.AutoRengoku
                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                        AutoAdvanceDungeon = _G.Auto_Rainbow_Haki
                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                            AutoAdvanceDungeon = _G.AutoObservation
                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                AutoAdvanceDungeon = _G.AutoDarkDagger
                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                    AutoAdvanceDungeon = _G.Safe_Mode
                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                        AutoAdvanceDungeon = _G.MasteryFruit
                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                            AutoAdvanceDungeon = _G.AutoBudySword
                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                AutoAdvanceDungeon = _G.AutoOderSword
                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                    AutoAdvanceDungeon = _G.AutoBounty
                                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                                        AutoAdvanceDungeon = _G.AutoAllBoss
                                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                                            AutoAdvanceDungeon = _G.Auto_Bounty
                                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                                AutoAdvanceDungeon = _G.AutoSharkman
                                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                                    AutoAdvanceDungeon = _G.Auto_Mastery_Fruit
                                                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                                                        AutoAdvanceDungeon = _G.Auto_Mastery_Gun
                                                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                                                            AutoAdvanceDungeon = _G.Auto_Dungeon
                                                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                                                AutoAdvanceDungeon = _G.Auto_Cavender
                                                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                                                    AutoAdvanceDungeon = _G.Auto_Pole
                                                                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                                                                        AutoAdvanceDungeon = _G.Auto_Kill_Ply
                                                                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                                                                            AutoAdvanceDungeon = _G.Auto_Factory
                                                                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                                                                AutoAdvanceDungeon = _G.AutoSecondSea
                                                                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                                                                    AutoAdvanceDungeon = _G.TeleportPly
                                                                                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                                                                                        AutoAdvanceDungeon = _G.AutoBartilo
                                                                                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                                                                                            AutoAdvanceDungeon = _G.Auto_DarkBoss
                                                                                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                                                                                AutoAdvanceDungeon = _G.GrabChest
                                                                                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                                                                                    AutoAdvanceDungeon = _G.AutoFarmBounty
                                                                                                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                                                                                                        AutoAdvanceDungeon = _G.Holy_Torch
                                                                                                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                                                                                                            AutoAdvanceDungeon = _G.AutoFarm
                                                                                                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                AutoAdvanceDungeon = _G.Clip
                                                                                                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                    AutoAdvanceDungeon = FarmBoss
                                                                                                                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                        AutoAdvanceDungeon = _G.AutoElitehunter
                                                                                                                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                            AutoAdvanceDungeon = _G.AutoThirdSea
                                                                                                                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                AutoAdvanceDungeon = _G.Auto_Bone
                                                                                                                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                    AutoAdvanceDungeon = _G.Autoheart
                                                                                                                                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                        AutoAdvanceDungeon = _G.Autodoughking
                                                                                                                                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                            AutoAdvanceDungeon = _G.AutoFarmMaterial
                                                                                                                                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                AutoAdvanceDungeon = _G.AutoNevaSoulGuitar
                                                                                                                                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                    AutoAdvanceDungeon = _G.Auto_Dragon_Trident
                                                                                                                                                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                        AutoAdvanceDungeon = _G.Autotushita
                                                                                                                                                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                            AutoAdvanceDungeon = _G.d
                                                                                                                                                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                AutoAdvanceDungeon = _G.Autowaden
                                                                                                                                                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                    AutoAdvanceDungeon = _G.Autogay
                                                                                                                                                                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                        AutoAdvanceDungeon = _G.Autopole
                                                                                                                                                                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                            AutoAdvanceDungeon = _G.Autosaw
                                                                                                                                                                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                AutoAdvanceDungeon = _G.AutoObservationHakiV2
                                                                                                                                                                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                    AutoAdvanceDungeon = _G.AutoFarmNearest
                                                                                                                                                                                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                        AutoAdvanceDungeon = AutoFarmChest
                                                                                                                                                                                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                            AutoAdvanceDungeon = _G.AutoCarvender
                                                                                                                                                                                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                AutoAdvanceDungeon = _G.AutoTwinHook
                                                                                                                                                                                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                    AutoAdvanceDungeon = AutoMobAura
                                                                                                                                                                                                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                        AutoAdvanceDungeon = _G.Tweenfruit
                                                                                                                                                                                                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                            AutoAdvanceDungeon = _G.TeleportNPC
                                                                                                                                                                                                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                AutoAdvanceDungeon = _G.Leather
                                                                                                                                                                                                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                    AutoAdvanceDungeon = _G.Auto_Wing
                                                                                                                                                                                                                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                        AutoAdvanceDungeon = _G.Umm
                                                                                                                                                                                                                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                            AutoAdvanceDungeon = _G.Makori_gay
                                                                                                                                                                                                                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                AutoAdvanceDungeon = R0177
                                                                                                                                                                                                                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                    AutoAdvanceDungeon = R0312
                                                                                                                                                                                                                                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                        AutoAdvanceDungeon = R0724
                                                                                                                                                                                                                                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                            AutoAdvanceDungeon = R0172
                                                                                                                                                                                                                                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                AutoAdvanceDungeon = R0401
                                                                                                                                                                                                                                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                    AutoAdvanceDungeon = R0114
                                                                                                                                                                                                                                                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                        AutoAdvanceDungeon = R05
                                                                                                                                                                                                                                                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                            AutoAdvanceDungeon = _G.AutoFarmSeabaest
                                                                                                                                                                                                                                                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                AutoAdvanceDungeon = _G.Auto_Cursed_Dual_Katana
                                                                                                                                                                                                                                                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                    AutoAdvanceDungeon = _G.AutoFarmMob
                                                                                                                                                                                                                                                                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                        AutoAdvanceDungeon = _G.AutoMysticIsland
                                                                                                                                                                                                                                                                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                            AutoAdvanceDungeon = _G.AutoFarmDungeon
                                                                                                                                                                                                                                                                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                AutoAdvanceDungeon = _G.AutoRaidPirate
                                                                                                                                                                                                                                                                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                    AutoAdvanceDungeon = _G.AutoQuestRace
                                                                                                                                                                                                                                                                                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                        AutoAdvanceDungeon = _G.TweenMGear
                                                                                                                                                                                                                                                                                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                            AutoAdvanceDungeon = getgenv().AutoFarm
                                                                                                                                                                                                                                                                                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                AutoAdvanceDungeon = _G.AutoPlayerHunter
                                                                                                                                                                                                                                                                                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                    AutoAdvanceDungeon = _G.AutoFactory
                                                                                                                                                                                                                                                                                                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                        AutoAdvanceDungeon = Grab_Chest
                                                                                                                                                                                                                                                                                                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                            AutoAdvanceDungeon = _G.Namfon
                                                                                                                                                                                                                                                                                                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                                AutoAdvanceDungeon = _G.AutoSwordMastery
                                                                                                                                                                                                                                                                                                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                                    AutoAdvanceDungeon = _G.Auto_Seabest
                                                                                                                                                                                                                                                                                                                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                                        AutoAdvanceDungeon = _G.AutoSeaBest
                                                                                                                                                                                                                                                                                                                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                                            AutoAdvanceDungeon = _G.AutoKillTial
                                                                                                                                                                                                                                                                                                                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                                                AutoAdvanceDungeon = _G.Auto_Saber
                                                                                                                                                                                                                                                                                                                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                                                    AutoAdvanceDungeon = _G.Position_Spawn
                                                                                                                                                                                                                                                                                                                                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                                                        AutoAdvanceDungeon = _G.Farmfast
                                                                                                                                                                                                                                                                                                                                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                                                            AutoAdvanceDungeon = _G.AutoRace
                                                                                                                                                                                                                                                                                                                                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                AutoAdvanceDungeon = _G.RaidPirate
                                                                                                                                                                                                                                                                                                                                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                    AutoAdvanceDungeon = _G.AutoTushitaSword
                                                                                                                                                                                                                                                                                                                                                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                        AutoAdvanceDungeon = R0505
                                                                                                                                                                                                                                                                                                                                                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                            AutoAdvanceDungeon = _G.AutoTerrorshark
                                                                                                                                                                                                                                                                                                                                                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                AutoAdvanceDungeon = R0698
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    AutoAdvanceDungeon = _G.farmpiranya
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        AutoAdvanceDungeon = _G.Fish_Crew_Member
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            AutoAdvanceDungeon = _G.DomadicAutoDriveBoat
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                AutoAdvanceDungeon = _G.bjirFishBoat
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                if not AutoAdvanceDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    AutoAdvanceDungeon = _G.KillGhostShip
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    if AutoAdvanceDungeon ~= true then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        -- empty block
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                end
                                                                                                                                                                                                                            end
                                                                                                                                                                                                                        end
                                                                                                                                                                                                                    end
                                                                                                                                                                                                                end
                                                                                                                                                                                                            end
                                                                                                                                                                                                        end
                                                                                                                                                                                                    end
                                                                                                                                                                                                end
                                                                                                                                                                                            end
                                                                                                                                                                                        end
                                                                                                                                                                                    end
                                                                                                                                                                                end
                                                                                                                                                                            end
                                                                                                                                                                        end
                                                                                                                                                                    end
                                                                                                                                                                end
                                                                                                                                                            end
                                                                                                                                                        end
                                                                                                                                                    end
                                                                                                                                                end
                                                                                                                                            end
                                                                                                                                        end
                                                                                                                                    end
                                                                                                                                end
                                                                                                                            end
                                                                                                                        end
                                                                                                                    end
                                                                                                                end
                                                                                                            end
                                                                                                        end
                                                                                                    end
                                                                                                end
                                                                                            end
                                                                                        end
                                                                                    end
                                                                                end
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
            AutoAdvanceDungeon = game.Players.LocalPlayer.Character:FindFirstChild("Highlight")
            if not AutoAdvanceDungeon then
                AutoAdvanceDungeon = Instance.new("Highlight")
                AutoAdvanceDungeon.FillColor = Color3.new(0, 255, 0)
                AutoAdvanceDungeon.OutlineColor = Color3.new(0, 255, 0)
                AutoAdvanceDungeon.Parent = game.Players.LocalPlayer.Character
            end
        end
    end)
end)
spawn(function()
    while wait() do
        local AutoDoughtBoss = _G.AutoDoughtBoss
        if not AutoDoughtBoss then
            AutoDoughtBoss = _G.Auto_DungeonMobAura
            if not AutoDoughtBoss then
                AutoDoughtBoss = _G.AutoFarmChest
                if not AutoDoughtBoss then
                    AutoDoughtBoss = _G.AutoFarmBossHallow
                    if not AutoDoughtBoss then
                        AutoDoughtBoss = _G.AutoFactory
                        if not AutoDoughtBoss then
                            AutoDoughtBoss = _G.AutoFarmSwanGlasses
                            if not AutoDoughtBoss then
                                AutoDoughtBoss = _G.AutoLongSword
                                if not AutoDoughtBoss then
                                    AutoDoughtBoss = _G.AutoBlackSpikeycoat
                                    if not AutoDoughtBoss then
                                        AutoDoughtBoss = _G.AutoElectricClaw
                                        if not AutoDoughtBoss then
                                            AutoDoughtBoss = _G.AutoFarmGunMastery
                                            if not AutoDoughtBoss then
                                                AutoDoughtBoss = _G.AutoHolyTorch
                                                if not AutoDoughtBoss then
                                                    AutoDoughtBoss = _G.AutoLawRaid
                                                    if not AutoDoughtBoss then
                                                        AutoDoughtBoss = _G.AutoFarmBoss
                                                        if not AutoDoughtBoss then
                                                            AutoDoughtBoss = _G.AutoTwinHooks
                                                            if not AutoDoughtBoss then
                                                                AutoDoughtBoss = _G.AutoOpenSwanDoor
                                                                if not AutoDoughtBoss then
                                                                    AutoDoughtBoss = _G.AutoDragon_Trident
                                                                    if not AutoDoughtBoss then
                                                                        AutoDoughtBoss = _G.AutoSaber
                                                                        if not AutoDoughtBoss then
                                                                            AutoDoughtBoss = _G.NOCLIP
                                                                            if not AutoDoughtBoss then
                                                                                AutoDoughtBoss = _G.AutoFarmFruitMastery
                                                                                if not AutoDoughtBoss then
                                                                                    AutoDoughtBoss = _G.AutoFarmGunMastery
                                                                                    if not AutoDoughtBoss then
                                                                                        AutoDoughtBoss = _G.TeleportIsland
                                                                                        if not AutoDoughtBoss then
                                                                                            AutoDoughtBoss = _G.Auto_EvoRace
                                                                                            if not AutoDoughtBoss then
                                                                                                AutoDoughtBoss = _G.AutoFarmAllMsBypassType
                                                                                                if not AutoDoughtBoss then
                                                                                                    AutoDoughtBoss = _G.AutoObservationv2
                                                                                                    if not AutoDoughtBoss then
                                                                                                        AutoDoughtBoss = _G.AutoMusketeerHat
                                                                                                        if not AutoDoughtBoss then
                                                                                                            AutoDoughtBoss = _G.AutoEctoplasm
                                                                                                            if not AutoDoughtBoss then
                                                                                                                AutoDoughtBoss = _G.AutoRengoku
                                                                                                                if not AutoDoughtBoss then
                                                                                                                    AutoDoughtBoss = _G.Auto_Rainbow_Haki
                                                                                                                    if not AutoDoughtBoss then
                                                                                                                        AutoDoughtBoss = _G.AutoObservation
                                                                                                                        if not AutoDoughtBoss then
                                                                                                                            AutoDoughtBoss = _G.AutoDarkDagger
                                                                                                                            if not AutoDoughtBoss then
                                                                                                                                AutoDoughtBoss = _G.Safe_Mode
                                                                                                                                if not AutoDoughtBoss then
                                                                                                                                    AutoDoughtBoss = _G.MasteryFruit
                                                                                                                                    if not AutoDoughtBoss then
                                                                                                                                        AutoDoughtBoss = _G.AutoBudySword
                                                                                                                                        if not AutoDoughtBoss then
                                                                                                                                            AutoDoughtBoss = _G.AutoOderSword
                                                                                                                                            if not AutoDoughtBoss then
                                                                                                                                                AutoDoughtBoss = _G.AutoAllBoss
                                                                                                                                                if not AutoDoughtBoss then
                                                                                                                                                    AutoDoughtBoss = _G.Auto_Bounty
                                                                                                                                                    if not AutoDoughtBoss then
                                                                                                                                                        AutoDoughtBoss = _G.AutoSharkman
                                                                                                                                                        if not AutoDoughtBoss then
                                                                                                                                                            AutoDoughtBoss = _G.Auto_Mastery_Fruit
                                                                                                                                                            if not AutoDoughtBoss then
                                                                                                                                                                AutoDoughtBoss = _G.Auto_Mastery_Gun
                                                                                                                                                                if not AutoDoughtBoss then
                                                                                                                                                                    AutoDoughtBoss = _G.Auto_Dungeon
                                                                                                                                                                    if not AutoDoughtBoss then
                                                                                                                                                                        AutoDoughtBoss = _G.Auto_Cavender
                                                                                                                                                                        if not AutoDoughtBoss then
                                                                                                                                                                            AutoDoughtBoss = _G.Auto_Pole
                                                                                                                                                                            if not AutoDoughtBoss then
                                                                                                                                                                                AutoDoughtBoss = _G.Auto_Kill_Ply
                                                                                                                                                                                if not AutoDoughtBoss then
                                                                                                                                                                                    AutoDoughtBoss = _G.Auto_Factory
                                                                                                                                                                                    if not AutoDoughtBoss then
                                                                                                                                                                                        AutoDoughtBoss = _G.AutoSecondSea
                                                                                                                                                                                        if not AutoDoughtBoss then
                                                                                                                                                                                            AutoDoughtBoss = _G.TeleportPly
                                                                                                                                                                                            if not AutoDoughtBoss then
                                                                                                                                                                                                AutoDoughtBoss = _G.AutoBartilo
                                                                                                                                                                                                if not AutoDoughtBoss then
                                                                                                                                                                                                    AutoDoughtBoss = _G.Auto_DarkBoss
                                                                                                                                                                                                    if not AutoDoughtBoss then
                                                                                                                                                                                                        AutoDoughtBoss = _G.AutoFarm
                                                                                                                                                                                                        if not AutoDoughtBoss then
                                                                                                                                                                                                            AutoDoughtBoss = _G.Clip
                                                                                                                                                                                                            if not AutoDoughtBoss then
                                                                                                                                                                                                                AutoDoughtBoss = _G.AutoElitehunter
                                                                                                                                                                                                                if not AutoDoughtBoss then
                                                                                                                                                                                                                    AutoDoughtBoss = _G.AutoThirdSea
                                                                                                                                                                                                                    if not AutoDoughtBoss then
                                                                                                                                                                                                                        AutoDoughtBoss = _G.Auto_Bone
                                                                                                                                                                                                                        if not AutoDoughtBoss then
                                                                                                                                                                                                                            AutoDoughtBoss = _G.Autoheart
                                                                                                                                                                                                                            if not AutoDoughtBoss then
                                                                                                                                                                                                                                AutoDoughtBoss = _G.Autodoughking
                                                                                                                                                                                                                                if not AutoDoughtBoss then
                                                                                                                                                                                                                                    AutoDoughtBoss = _G.d
                                                                                                                                                                                                                                    if not AutoDoughtBoss then
                                                                                                                                                                                                                                        AutoDoughtBoss = _G.Autowaden
                                                                                                                                                                                                                                        if not AutoDoughtBoss then
                                                                                                                                                                                                                                            AutoDoughtBoss = _G.Autogay
                                                                                                                                                                                                                                            if not AutoDoughtBoss then
                                                                                                                                                                                                                                                AutoDoughtBoss = _G.AutoObservationHakiV2
                                                                                                                                                                                                                                                if not AutoDoughtBoss then
                                                                                                                                                                                                                                                    AutoDoughtBoss = _G.AutoFarmMaterial
                                                                                                                                                                                                                                                    if not AutoDoughtBoss then
                                                                                                                                                                                                                                                        AutoDoughtBoss = _G.AutoFarmNearest
                                                                                                                                                                                                                                                        if not AutoDoughtBoss then
                                                                                                                                                                                                                                                            AutoDoughtBoss = _G.AutoCarvender
                                                                                                                                                                                                                                                            if not AutoDoughtBoss then
                                                                                                                                                                                                                                                                AutoDoughtBoss = _G.AutoTwinHook
                                                                                                                                                                                                                                                                if not AutoDoughtBoss then
                                                                                                                                                                                                                                                                    AutoDoughtBoss = AutoMobAura
                                                                                                                                                                                                                                                                    if not AutoDoughtBoss then
                                                                                                                                                                                                                                                                        AutoDoughtBoss = _G.Leather
                                                                                                                                                                                                                                                                        if not AutoDoughtBoss then
                                                                                                                                                                                                                                                                            AutoDoughtBoss = _G.Auto_Wing
                                                                                                                                                                                                                                                                            if not AutoDoughtBoss then
                                                                                                                                                                                                                                                                                AutoDoughtBoss = _G.Umm
                                                                                                                                                                                                                                                                                if not AutoDoughtBoss then
                                                                                                                                                                                                                                                                                    AutoDoughtBoss = _G.Makori_gay
                                                                                                                                                                                                                                                                                    if not AutoDoughtBoss then
                                                                                                                                                                                                                                                                                        AutoDoughtBoss = R0177
                                                                                                                                                                                                                                                                                        if not AutoDoughtBoss then
                                                                                                                                                                                                                                                                                            AutoDoughtBoss = R0312
                                                                                                                                                                                                                                                                                            if not AutoDoughtBoss then
                                                                                                                                                                                                                                                                                                AutoDoughtBoss = R0724
                                                                                                                                                                                                                                                                                                if not AutoDoughtBoss then
                                                                                                                                                                                                                                                                                                    AutoDoughtBoss = R0172
                                                                                                                                                                                                                                                                                                    if not AutoDoughtBoss then
                                                                                                                                                                                                                                                                                                        AutoDoughtBoss = R0401
                                                                                                                                                                                                                                                                                                        if not AutoDoughtBoss then
                                                                                                                                                                                                                                                                                                            AutoDoughtBoss = R0114
                                                                                                                                                                                                                                                                                                            if not AutoDoughtBoss then
                                                                                                                                                                                                                                                                                                                AutoDoughtBoss = R05
                                                                                                                                                                                                                                                                                                                if not AutoDoughtBoss then
                                                                                                                                                                                                                                                                                                                    AutoDoughtBoss = _G.AutoFarmSeabaest
                                                                                                                                                                                                                                                                                                                    if not AutoDoughtBoss then
                                                                                                                                                                                                                                                                                                                        AutoDoughtBoss = _G.Auto_Cursed_Dual_Katana
                                                                                                                                                                                                                                                                                                                        if not AutoDoughtBoss then
                                                                                                                                                                                                                                                                                                                            AutoDoughtBoss = _G.AutoFarmMob
                                                                                                                                                                                                                                                                                                                            if not AutoDoughtBoss then
                                                                                                                                                                                                                                                                                                                                AutoDoughtBoss = _G.AutoRaidPirate
                                                                                                                                                                                                                                                                                                                                if not AutoDoughtBoss then
                                                                                                                                                                                                                                                                                                                                    AutoDoughtBoss = getgenv().AutoFarm
                                                                                                                                                                                                                                                                                                                                    if not AutoDoughtBoss then
                                                                                                                                                                                                                                                                                                                                        AutoDoughtBoss = _G.AutoPlayerHunter
                                                                                                                                                                                                                                                                                                                                        if not AutoDoughtBoss then
                                                                                                                                                                                                                                                                                                                                            AutoDoughtBoss = _G.AutoFactory
                                                                                                                                                                                                                                                                                                                                            if not AutoDoughtBoss then
                                                                                                                                                                                                                                                                                                                                                AutoDoughtBoss = _G.AttackDummy
                                                                                                                                                                                                                                                                                                                                                if not AutoDoughtBoss then
                                                                                                                                                                                                                                                                                                                                                    AutoDoughtBoss = _G.AutoSwordMastery
                                                                                                                                                                                                                                                                                                                                                    if not AutoDoughtBoss then
                                                                                                                                                                                                                                                                                                                                                        AutoDoughtBoss = _G.Auto_Seabest
                                                                                                                                                                                                                                                                                                                                                        if not AutoDoughtBoss then
                                                                                                                                                                                                                                                                                                                                                            AutoDoughtBoss = _G.AutoSeaBest
                                                                                                                                                                                                                                                                                                                                                            if not AutoDoughtBoss then
                                                                                                                                                                                                                                                                                                                                                                AutoDoughtBoss = _G.AutoKillTial
                                                                                                                                                                                                                                                                                                                                                                if not AutoDoughtBoss then
                                                                                                                                                                                                                                                                                                                                                                    AutoDoughtBoss = _G.Auto_Saber
                                                                                                                                                                                                                                                                                                                                                                    if not AutoDoughtBoss then
                                                                                                                                                                                                                                                                                                                                                                        AutoDoughtBoss = _G.Farmfast
                                                                                                                                                                                                                                                                                                                                                                        if not AutoDoughtBoss then
                                                                                                                                                                                                                                                                                                                                                                            AutoDoughtBoss = _G.RaidPirate
                                                                                                                                                                                                                                                                                                                                                                            if not AutoDoughtBoss then
                                                                                                                                                                                                                                                                                                                                                                                AutoDoughtBoss = _G.AutoTerrorshark
                                                                                                                                                                                                                                                                                                                                                                                if not AutoDoughtBoss then
                                                                                                                                                                                                                                                                                                                                                                                    AutoDoughtBoss = R0698
                                                                                                                                                                                                                                                                                                                                                                                    if not AutoDoughtBoss then
                                                                                                                                                                                                                                                                                                                                                                                        AutoDoughtBoss = _G.farmpiranya
                                                                                                                                                                                                                                                                                                                                                                                        if not AutoDoughtBoss then
                                                                                                                                                                                                                                                                                                                                                                                            AutoDoughtBoss = _G.Fish_Crew_Member
                                                                                                                                                                                                                                                                                                                                                                                            if not AutoDoughtBoss then
                                                                                                                                                                                                                                                                                                                                                                                                AutoDoughtBoss = _G.bjirFishBoat
                                                                                                                                                                                                                                                                                                                                                                                                if not AutoDoughtBoss then
                                                                                                                                                                                                                                                                                                                                                                                                    AutoDoughtBoss = _G.KillGhostShip
                                                                                                                                                                                                                                                                                                                                                                                                    if AutoDoughtBoss ~= true then
                                                                                                                                                                                                                                                                                                                                                                                                        -- empty block
                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                end
                                                                                                                                                                                                                            end
                                                                                                                                                                                                                        end
                                                                                                                                                                                                                    end
                                                                                                                                                                                                                end
                                                                                                                                                                                                            end
                                                                                                                                                                                                        end
                                                                                                                                                                                                    end
                                                                                                                                                                                                end
                                                                                                                                                                                            end
                                                                                                                                                                                        end
                                                                                                                                                                                    end
                                                                                                                                                                                end
                                                                                                                                                                            end
                                                                                                                                                                        end
                                                                                                                                                                    end
                                                                                                                                                                end
                                                                                                                                                            end
                                                                                                                                                        end
                                                                                                                                                    end
                                                                                                                                                end
                                                                                                                                            end
                                                                                                                                        end
                                                                                                                                    end
                                                                                                                                end
                                                                                                                            end
                                                                                                                        end
                                                                                                                    end
                                                                                                                end
                                                                                                            end
                                                                                                        end
                                                                                                    end
                                                                                                end
                                                                                            end
                                                                                        end
                                                                                    end
                                                                                end
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        pcall(function()
            game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken", true)
        end)
    end
end)
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.AutoClick or Flag84 then
            pcall(function()
                game:GetService("VirtualUser"):CaptureController()
                game:GetService("VirtualUser"):Button1Down(Vector2.new(0, 1, 0, 1))
            end)
        end
    end)
end)
Function38 = function(Param)
    if not Param then
        _G.Function38 = true
        wait()
        Function35(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait()
        if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
        end
        _G.Function38 = false
        _G.Clip = false
    end
    if game.Players.LocalPlayer.Character:FindFirstChild("Highlight") then
        game.Players.LocalPlayer.Character:FindFirstChild("Highlight"):Destroy()
    end
end
spawn(function()
    pcall(function()
        while wait() do
            local Pairs = pairs
            for I, I2 in Pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                if I2:IsA("Tool") and I2:FindFirstChild("RemoteFunctionShoot") then
                    Name = I2.Name
                end
            end
        end
    end)
end)
game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)
Function39 = function()
    pcall(function()
        for I, I2 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if I2.ToolTip == "Sword" and I2:IsA("Tool") then
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild(I2.Name))
            end
        end
    end)
end
Function41 = function()
    local Value2 = {
        "PirateGrandBrigade",
        "PirateBrigade"
    }
    local Next = next
    local Children, Value3 = game:GetService("Workspace").Enemies:GetChildren()
    for I, I2 in Next, Children, Value3 do
        if table.find(Value2, I2.Name) and I2:FindFirstChild("Health") and 0 < I2.Health.Value then
            return I2
        end
    end
end
Function41 = function()
    local Value2 = {
        "FishBoat"
    }
    local Next = next
    local Children, Value3 = game:GetService("Workspace").Enemies:GetChildren()
    for I, I2 in Next, Children, Value3 do
        if table.find(Value2, I2.Name) and I2:FindFirstChild("Health") and 0 < I2.Health.Value then
            return I2
        end
    end
end
Function42 = function()
    pcall(function()
        for I, I2 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if I2:IsA("Tool") and I2.Name ~= "Summon Sea Beast" and I2.Name ~= "Water Body" and I2.Name ~= "Awakening" then
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild(I2.Name))
                wait(1)
            end
        end
    end)
end
Function43 = function(Input)
    if isnetworkowner then
        return isnetworkowner(Input)
    end
    if (Input.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= _G.BringMode then
        return true
    end
    return false
end
Tab2:Dropdown("Select Weapon", {
    "Melee",
    "Sword",
    "Fruit",
    "Gun"
}, function(Param)
    _G.SelectWeapon = Param
end)
_G.SelectWeapon = _G.SelectWeapon or "Melee"
task.spawn(function()
    while wait() do
        pcall(function()
            if _G.SelectWeapon == "Melee" then
                for I, I2 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if I2.ToolTip == "Melee" and game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(I2.Name)) then
                        _G.SelectWeapon = I2.Name
                    end
                end
            elseif _G.SelectWeapon == "Sword" then
                for I, I2 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if I2.ToolTip == "Sword" and game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(I2.Name)) then
                        _G.SelectWeapon = I2.Name
                    end
                end
            elseif _G.SelectWeapon == "Gun" then
                for I, I2 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if I2.ToolTip == "Gun" and game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(I2.Name)) then
                        _G.SelectWeapon = I2.Name
                    end
                end
            elseif _G.SelectWeapon == "Fruit" then
                for I, I2 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if I2.ToolTip == "Blox Fruit" and game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(I2.Name)) then
                        _G.SelectWeapon = I2.Name
                    end
                end
            end
        end)
    end
end)
Tab2:Seperator("Main Farm")
local Label5 = Tab2:Label("")
local Label6 = Tab2:Label("")
spawn(function()
    while task.wait() do
        local Visible = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
        if Visible == false then
            Label5:Set("Monster : ...")
            Label6:Set("Quest : ... | Level : ...")
        else
            Visible = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
            if Visible == true then
                pcall(function()
                    Function2()
                    Label5:Set("Monster : " .. String250)
                    Label6:Set("Quest : " .. String251 .. " | Level : " .. Number84)
                end)
            end
        end
    end
end)
Tab2:Dropdown("Farm Mode", {
    "Quest",
    "No Quest"
}, function(Param)
    Value2 = Param
end)
Value2 = Value2 or "Quest"
Tab2:Toggle("Auto Farm Level", false, function(Param)
    _G.AutoFarm = Param
    Function38(_G.AutoFarm)
end)
spawn(function()
    while wait() do
        local FarmMode = Value2
        if FarmMode == "Quest" then
            FarmMode = _G.AutoFarm
            if FarmMode then
                pcall(function()
                    if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, String252) then
                        Flag13 = false
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    end
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        Flag13 = false
                        Function2()
                        if R0216 then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst167.Position).Magnitude > 1500 then
                                Function33(Inst167)
                            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst167.Position).Magnitude < 1500 then
                                Function35(Inst167)
                            end
                        else
                            Function35(Inst167)
                        end
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst167.Position).Magnitude <= 5 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", String251, Number84)
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        Function2()
                        if game:GetService("Workspace").Enemies:FindFirstChild(String250) then
                            for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if I2:FindFirstChild("HumanoidRootPart") and I2:FindFirstChild("Humanoid") and 0 < I2.Humanoid.Health and I2.Name == String250 then
                                    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, String252) then
                                        task.wait()
                                        Function32(_G.SelectWeapon)
                                        Function30()
                                        CFrame18 = I2.HumanoidRootPart.CFrame
                                        Function35(I2.HumanoidRootPart.CFrame * R03664)
                                        I2.HumanoidRootPart.CanCollide = false
                                        I2.Humanoid.WalkSpeed = 0
                                        I2.Head.CanCollide = false
                                        I2.HumanoidRootPart.Size = Vector3.new(70, 70, 70)
                                        Flag13 = true
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                        if _G.AutoFarm and I2.Humanoid.Health > 0 and I2.Parent and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible ~= false then
                                            Flag13 = false
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                        end
                                    else
                                        -- empty block
                                    end
                                end
                            end
                        else
                            Function35(Inst168)
                            Function31(_G.SelectWeapon)
                            Flag13 = false
                            if game:GetService("ReplicatedStorage"):FindFirstChild(String250) then
                                Function35(game:GetService("ReplicatedStorage"):FindFirstChild(String250).HumanoidRootPart.CFrame * CFrame.new(15, 10, 2))
                            end
                        end
                    end
                end)
            end
        end
    end
end)
spawn(function()
    while wait() do
        local FarmMode = Value2
        if FarmMode == "No Quest" then
            FarmMode = _G.AutoFarm
            if FarmMode then
                pcall(function()
                    if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, String252) then
                        Flag13 = false
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    end
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        Flag13 = false
                        Function2()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", String251, Number84)
                        if R0216 then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst168.Position).Magnitude > 1500 then
                                Function33(Inst168)
                            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst168.Position).Magnitude < 1500 then
                                Function35(Inst168)
                            end
                        else
                            Function35(Inst168)
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        Function2()
                        if game:GetService("Workspace").Enemies:FindFirstChild(String250) then
                            for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if I2:FindFirstChild("HumanoidRootPart") and I2:FindFirstChild("Humanoid") and 0 < I2.Humanoid.Health and I2.Name == String250 then
                                    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, String252) then
                                        task.wait()
                                        Function32(_G.SelectWeapon)
                                        Function30()
                                        CFrame18 = I2.HumanoidRootPart.CFrame
                                        Function35(I2.HumanoidRootPart.CFrame * R03664)
                                        I2.HumanoidRootPart.CanCollide = false
                                        I2.Humanoid.WalkSpeed = 0
                                        I2.Head.CanCollide = false
                                        I2.HumanoidRootPart.Size = Vector3.new(70, 70, 70)
                                        Flag13 = true
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                        if _G.AutoFarm and I2.Humanoid.Health > 0 and I2.Parent and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible ~= false then
                                            Flag13 = false
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                        end
                                    else
                                        -- empty block
                                    end
                                end
                            end
                        else
                            Function35(Inst168)
                            Function31(_G.SelectWeapon)
                            Flag13 = false
                            if game:GetService("ReplicatedStorage"):FindFirstChild(String250) then
                                Function35(game:GetService("ReplicatedStorage"):FindFirstChild(String250).HumanoidRootPart.CFrame * CFrame.new(15, 10, 2))
                            end
                        end
                    end
                end)
            end
        end
    end
end)
if Flag then
    Tab2:Toggle("Auto Farm Level Fast [1 -> 300]", false, function(Param)
        _G.Farmfast = Param
        Function38(_G.Farmfast)
    end)
    spawn(function()
        pcall(function()
            while wait() do
                local Farmfast = _G.Farmfast
                if Farmfast then
                    Farmfast = Flag
                    if Farmfast then
                        Farmfast = game.Players.LocalPlayer.Data.Level.Value
                        if Farmfast >= 10 then
                            _G.AutoFarm = false
                            Farmfast = _G
                            Farmfast.Farmfast = true
                        end
                    end
                end
            end
        end)
    end)
    spawn(function()
        while wait() do
            local Farmfast = _G.Farmfast
            if Farmfast then
                Farmfast = Flag
                if Farmfast then
                    pcall(function()
                        if game.Players.LocalPlayer.Data.Level.Value >= 10 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7894.617675781300022, 5547.1416015625, -380.291198730470001))
                            for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if I2.Name == "Shanda" and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                                    while true do
                                        task.wait()
                                        Function30()
                                        Function32(_G.SelectWeapon)
                                        I2.HumanoidRootPart.CanCollide = false
                                        I2.Humanoid.WalkSpeed = 0
                                        Flag15 = true
                                        CFrame3 = I2.HumanoidRootPart.CFrame
                                        I2.HumanoidRootPart.Size = Vector3.new(80, 80, 80)
                                        Function35(I2.HumanoidRootPart.CFrame * R03664)
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                        if _G.Farmfast then
                                            local Parent = I2.Parent
                                            if Parent then
                                                Parent = I2.Humanoid.Health
                                                if Parent <= 0 then
                                                    break
                                                end
                                            else
                                                break
                                            end
                                        else
                                            break
                                        end
                                    end
                                    Flag15 = false
                                    Function35(CFrame.new(-7678.48974609375, 5566.40380859375, -497.215606689453125))
                                    Function31(_G.SelectWeapon)
                                end
                            end
                        elseif game:GetService("ReplicatedStorage"):FindFirstChild("Shanda") then
                            Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Shanda").HumanoidRootPart.CFrame * CFrame.new(5, 10, 2))
                        end
                    end)
                end
            end
        end
    end)
    spawn(function()
        pcall(function()
            while wait() do
                local Farmfast = _G.Farmfast
                if Farmfast then
                    Farmfast = Flag
                    if Farmfast then
                        Farmfast = game.Players.LocalPlayer.Data.Level.Value
                        if Farmfast >= 75 then
                            _G.Farmfast = false
                            Farmfast = _G
                            Farmfast.AutoPlayerHunter = true
                        end
                    end
                end
            end
        end)
    end)
    spawn(function()
        pcall(function()
            while wait() do
                local Farmfast = _G.Farmfast
                if Farmfast then
                    Farmfast = Flag
                    if Farmfast then
                        Farmfast = game.Players.LocalPlayer.Data.Level.Value
                        if Farmfast >= 200 then
                            _G.AutoFarm = true
                            Farmfast = _G
                            Farmfast.AutoPlayerHunter = false
                        end
                    end
                end
            end
        end)
    end)
end
Tab2:Toggle("Auto Farm Nearest", false, function(Param)
    _G.AutoFarmNearest = Param
    Function38(_G.AutoFarmNearest)
end)
spawn(function()
    while wait() do
        local AutoFarmNearest = _G.AutoFarmNearest
        if AutoFarmNearest then
            AutoFarmNearest = pairs
            for I, I2 in AutoFarmNearest(game:GetService("Workspace").Enemies:GetChildren()) do
                if I2.Name and I2:FindFirstChild("Humanoid") and 0 < I2.Humanoid.Health then
                    while true do
                        wait()
                        Function32(_G.SelectWeapon)
                        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                            local Service = {
                                [1] = "Buso"
                            }
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(Service))
                        end
                        Function35(I2.HumanoidRootPart.CFrame * R03664)
                        I2.HumanoidRootPart.CanCollide = false
                        Flag84 = true
                        I2.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        game:GetService("VirtualUser"):CaptureController()
                        local Service = game:GetService("VirtualUser")
                        Service:Button1Down(Vector2.new(1280, 672), game.Workspace.CurrentCamera.CFrame)
                        Flag18 = true
                        CFrame18 = I2.HumanoidRootPart.CFrame
                        Service = _G.AutoFarmNearest
                        if Service then
                            Service = I2.Parent
                            if Service then
                                Service = I2.Humanoid.Health
                                if Service <= 0 then
                                    break
                                end
                            else
                                break
                            end
                        else
                            break
                        end
                    end
                    Flag18 = false
                    Flag84 = false
                end
            end
        end
    end
end)
Tab2:Seperator("Cake Farm")
local Label7 = Tab2:Label("")
spawn(function()
    while wait() do
        pcall(function()
            if string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 88 then
                Label7:Set("Defeated : " .. string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 39, 41))
            elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 87 then
                Label7:Set("Defeated : " .. string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 39, 40))
            elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 86 then
                Label7:Set("Defeated : " .. string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 39, 39))
            else
                Label7:Set("Boss Is Spawning")
            end
        end)
    end
end)
Tab2:Dropdown("Farm Mode", {
    "No Quest",
    "Quest",
    "Mastery"
}, function(Param)
    Value3 = Param
end)
Value3 = Value3 or "No Quest"
Tab2:Toggle("Auto Farm Cake Prince", false, function(Param)
    _G.AutoDoughtBoss = Param
    Function38(_G.AutoDoughtBoss)
end)
spawn(function()
    while wait() do
        pcall(function()
            if string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 88 then
                Value6 = tonumber(string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 39, 41)) - 500
            elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 87 then
                Value6 = tonumber(string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 40, 41)) - 500
            elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 86 then
                Value6 = tonumber(string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 41, 41)) - 500
            end
        end)
    end
end)
local Inst = CFrame.new(-2091.911865234375, 70.008842468261719, -12142.8359375)
spawn(function()
    while wait() do
        local CakeFMode = Value3
        if CakeFMode == "No Quest" then
            CakeFMode = _G.AutoDoughtBoss
            if CakeFMode then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then
                        for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if I2.Name == "Cake Prince" and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                                while true do
                                    task.wait()
                                    Function30()
                                    Function32(_G.SelectWeapon)
                                    I2.HumanoidRootPart.CanCollide = false
                                    I2.Humanoid.WalkSpeed = 0
                                    I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    Function35(I2.HumanoidRootPart.CFrame * R03664)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                    if _G.AutoDoughtBoss then
                                        local Parent = I2.Parent
                                        if Parent then
                                            Parent = I2.Humanoid.Health
                                            if Parent <= 0 then
                                                break
                                            end
                                        else
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                            end
                        end
                    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then
                        Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                    else
                        if Value6 == 0 then
                            -- empty block
                        end
                        if game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 1 then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard") or game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff") or game:GetService("Workspace").Enemies:FindFirstChild("Head Baker") then
                                for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if (I2.Name == "Cookie Crafter" or I2.Name == "Cake Guard" or I2.Name == "Baking Staff" or I2.Name == "Head Baker") and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                                        while true do
                                            task.wait()
                                            Function30()
                                            Function32(_G.SelectWeapon)
                                            I2.HumanoidRootPart.CanCollide = false
                                            I2.Humanoid.WalkSpeed = 0
                                            I2.Head.CanCollide = false
                                            I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                            Flag35 = true
                                            CFrame11 = I2.HumanoidRootPart.CFrame
                                            Function35(I2.HumanoidRootPart.CFrame * R03664)
                                            game:GetService("VirtualUser"):CaptureController()
                                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                            if _G.AutoDoughtBoss then
                                                local Parent = I2.Parent
                                                if Parent then
                                                    Parent = I2.Humanoid.Health
                                                    if Parent > 0 then
                                                        Parent = game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency
                                                        if Parent ~= 0 then
                                                            Parent = game:GetService("ReplicatedStorage")
                                                            Parent = Parent:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]")
                                                            if not Parent then
                                                                Parent = game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]")
                                                                if not Parent then
                                                                    Parent = Value6
                                                                    if Parent == 0 then
                                                                        break
                                                                    end
                                                                else
                                                                    break
                                                                end
                                                            else
                                                                break
                                                            end
                                                        else
                                                            break
                                                        end
                                                    else
                                                        break
                                                    end
                                                else
                                                    break
                                                end
                                            else
                                                break
                                            end
                                        end
                                    end
                                end
                            else
                                if R0216 then
                                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst.Position).Magnitude > 1500 then
                                        Function33(Inst)
                                    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst.Position).Magnitude < 1500 then
                                        Function35(Inst)
                                    end
                                else
                                    Function35(Inst)
                                end
                                Flag35 = false
                                Function31(_G.SelectWeapon)
                                Function35(CFrame.new(-2091.911865234375, 70.008842468261719, -12142.8359375))
                                if game:GetService("ReplicatedStorage"):FindFirstChild("Cookie Crafter") then
                                    Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Cookie Crafter").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                                elseif game:GetService("ReplicatedStorage"):FindFirstChild("Cake Guard") then
                                    Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Guard").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                                elseif game:GetService("ReplicatedStorage"):FindFirstChild("Baking Staff") then
                                    Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Baking Staff").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                                elseif game:GetService("ReplicatedStorage"):FindFirstChild("Head Baker") then
                                    Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Head Baker").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                                end
                            end
                        elseif game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then
                            Function35(game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        elseif game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince") then
                            Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        end
                    end
                end)
            end
        end
    end
end)
local Inst2 = CFrame.new(-2021.320069999999987, 37.7982254, -12028.729499999999462, 0.957576931, -0.000000088030205, 0.288177818, 0.000000069301187, 1, 0.000000075193121, -0.288177818, -0.000000052032135, 0.957576931)
spawn(function()
    while wait() do
        local CakeFMode = Value3
        if CakeFMode == "Quest" then
            CakeFMode = _G.AutoDoughtBoss
            if CakeFMode then
                CakeFMode = Flag3
                if CakeFMode then
                    pcall(function()
                        if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") or game:GetService("Workspace").Enemies:FindFirstChild("Dough King") then
                            for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if (I2.Name == "Cake Prince" or I2.Name == "Dough King") and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                                    while true do
                                        task.wait()
                                        Function30()
                                        Function32(_G.SelectWeapon)
                                        I2.HumanoidRootPart.CanCollide = false
                                        I2.Humanoid.WalkSpeed = 0
                                        I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                        Function35(I2.HumanoidRootPart.CFrame * R03664)
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                        if _G.AutoDoughtBoss then
                                            local Parent = I2.Parent
                                            if Parent then
                                                Parent = I2.Humanoid.Health
                                                if Parent <= 0 then
                                                    break
                                                end
                                            else
                                                break
                                            end
                                        else
                                            break
                                        end
                                    end
                                end
                            end
                        elseif game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince") then
                            Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince").HumanoidRootPart.CFrame * CFrame.new(5, 10, 2))
                        end
                    end)
                end
            end
        end
    end
end)
spawn(function()
    while wait() do
        local CakeFMode = Value3
        if CakeFMode == "Quest" then
            CakeFMode = _G.AutoDoughtBoss
            if CakeFMode then
                CakeFMode = Flag3
                if CakeFMode then
                    CakeFMode = game:GetService("ReplicatedStorage")
                    CakeFMode = CakeFMode:FindFirstChild("Cake Prince")
                    if not CakeFMode then
                        pcall(function()
                            if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Cookie Crafter") then
                                Flag35 = false
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                            end
                            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                                Flag35 = false
                                if R0216 then
                                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst2.Position).Magnitude > 1500 then
                                        Function33(Inst2)
                                    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst2.Position).Magnitude < 1500 then
                                        Function35(Inst2)
                                    end
                                else
                                    Function35(Inst2)
                                end
                                if (Inst2.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "CakeQuest1", 1)
                                end
                            elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                                if game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard") or game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff") or game:GetService("Workspace").Enemies:FindFirstChild("Head Baker") then
                                    for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if I2:FindFirstChild("HumanoidRootPart") and I2:FindFirstChild("Humanoid") and 0 < I2.Humanoid.Health and (I2.Name == "Cookie Crafter" or I2.Name == "Cake Guard" or I2.Name == "Baking Staff" or I2.Name == "Head Baker") then
                                            if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Cookie Crafter") then
                                                task.wait()
                                                Function32(_G.SelectWeapon)
                                                Function30()
                                                CFrame10 = I2.HumanoidRootPart.CFrame
                                                Function35(I2.HumanoidRootPart.CFrame * R03664)
                                                I2.HumanoidRootPart.CanCollide = false
                                                I2.Humanoid.WalkSpeed = 0
                                                I2.Head.CanCollide = false
                                                I2.HumanoidRootPart.Size = Vector3.new(70, 70, 70)
                                                Flag35 = true
                                                CFrame11 = I2.HumanoidRootPart.CFrame
                                                game:GetService("VirtualUser"):CaptureController()
                                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                                if _G.AutoDoughtBoss and I2.Parent and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible ~= false and I2.Humanoid.Health > 0 and game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency ~= 0 and not game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") and not game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") and Value6 ~= 0 then
                                                    Flag35 = false
                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                                end
                                            else
                                                -- empty block
                                            end
                                        end
                                    end
                                else
                                    Flag35 = false
                                    if game:GetService("ReplicatedStorage"):FindFirstChild("Cookie Crafter") then
                                        Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Cookie Crafter").HumanoidRootPart.CFrame * CFrame.new(15, 10, 2))
                                    end
                                end
                            end
                        end)
                    end
                end
            end
        end
    end
end)
spawn(function()
    while wait() do
        local CakeFMode = Value3
        if CakeFMode == "Mastery" then
            CakeFMode = _G.AutoDoughtBoss
            if CakeFMode then
                CakeFMode = Flag3
                if CakeFMode then
                    CakeFMode = game:GetService("ReplicatedStorage")
                    CakeFMode = CakeFMode:FindFirstChild("Cake Prince")
                    if not CakeFMode then
                        pcall(function()
                            if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Cookie Crafter") then
                                Flag72 = false
                                Flag54 = false
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                            end
                            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                                Flag35 = false
                                Flag66 = false
                                if R0216 then
                                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst2.Position).Magnitude > 1500 then
                                        Function33(Inst2)
                                    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst2.Position).Magnitude < 1500 then
                                        Function35(Inst2)
                                    end
                                else
                                    Function35(Inst2)
                                end
                                if (Inst2.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "CakeQuest1", 1)
                                end
                            elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                                if game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard") or game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff") or game:GetService("Workspace").Enemies:FindFirstChild("Head Baker") then
                                    for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if I2:FindFirstChild("HumanoidRootPart") and I2:FindFirstChild("Humanoid") and 0 < I2.Humanoid.Health and (I2.Name == "Cookie Crafter" or I2.Name == "Cake Guard" or I2.Name == "Baking Staff" or I2.Name == "Head Baker") then
                                            if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Cookie Crafter") then
                                                Value10 = I2.Humanoid.MaxHealth * _G.Kill_At / 100
                                                while true do
                                                    task.wait()
                                                    if I2.Humanoid.Health <= Value10 then
                                                        Function30()
                                                        Function32(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value)
                                                        Function35(I2.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0))
                                                        I2.HumanoidRootPart.CanCollide = false
                                                        CFrame10 = I2.HumanoidRootPart.CFrame
                                                        CFrame11 = I2.HumanoidRootPart.CFrame
                                                        I2.Humanoid.WalkSpeed = 0
                                                        I2.Head.CanCollide = false
                                                        local AutoDoughtBoss = true
                                                        Flag54 = AutoDoughtBoss
                                                    else
                                                        Flag54 = false
                                                        Function30()
                                                        Function32(_G.SelectWeapon)
                                                        Function35(I2.HumanoidRootPart.CFrame * R03664)
                                                        I2.HumanoidRootPart.CanCollide = false
                                                        local Inst3 = Vector3.new(50, 50, 50)
                                                        I2.HumanoidRootPart.Size = Inst3
                                                        CFrame10 = I2.HumanoidRootPart.CFrame
                                                        I2.Humanoid.WalkSpeed = 0
                                                        local AutoDoughtBoss = I2.Head
                                                        AutoDoughtBoss.CanCollide = false
                                                    end
                                                    Flag35 = true
                                                    CFrame11 = I2.HumanoidRootPart.CFrame
                                                    game:GetService("VirtualUser"):CaptureController()
                                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                                    local AutoDoughtBoss = _G.AutoDoughtBoss
                                                    if AutoDoughtBoss then
                                                        AutoDoughtBoss = I2.Humanoid.Health
                                                        if AutoDoughtBoss > 0 then
                                                            AutoDoughtBoss = I2.Parent
                                                            if AutoDoughtBoss then
                                                                AutoDoughtBoss = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                                                                if AutoDoughtBoss == false then
                                                                    -- empty block
                                                                end
                                                            else
                                                                break
                                                            end
                                                        else
                                                            break
                                                        end
                                                    else
                                                        break
                                                    end
                                                end
                                            else
                                                Flag54 = false
                                                Flag35 = false
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                            end
                                        end
                                    end
                                else
                                    Flag35 = false
                                    Flag54 = false
                                    local Child = game:GetService("ReplicatedStorage"):FindFirstChild("Cookie Crafter")
                                    if Child then
                                        Function35(Child.HumanoidRootPart.CFrame * CFrame.new(0, 0, 10))
                                    elseif game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.Y <= 1 then
                                        game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = true
                                        task.wait()
                                        game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = false
                                    end
                                end
                            end
                        end)
                    end
                end
            end
        end
    end
end)
Tab2:Toggle("Auto Kill Cake Prince V2", false, function(Param)
    _G.Autodoughking = Param
    Function38(_G.Autodoughking)
end)
spawn(function()
    while wait() do
        local Autodoughking = _G.Autodoughking
        if Autodoughking then
            Autodoughking = Flag3
            if Autodoughking then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Dough King") then
                        for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if I2.Name == "Dough King" and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                                while true do
                                    task.wait()
                                    Function30()
                                    Function32(_G.SelectWeapon)
                                    I2.HumanoidRootPart.CanCollide = false
                                    I2.Humanoid.WalkSpeed = 0
                                    I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    Function35(I2.HumanoidRootPart.CFrame * R03664)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                    if _G.Autodoughking then
                                        local Parent = I2.Parent
                                        if Parent then
                                            Parent = I2.Humanoid.Health
                                            if Parent <= 0 then
                                                break
                                            end
                                        else
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                            end
                        end
                    else
                        Function31(_G.SelectWeapon)
                        Function35(CFrame.new(-2662.818603515625, 1062.3480224609375, -11853.6953125))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Dough King") then
                            Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Dough King").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        elseif _G.AutodoughkingHop then
                            Function3()
                        end
                    end
                end)
            end
        end
    end
end)
Tab2:Toggle("Auto Spawn Cake Prince", true, function(Param)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner", Param)
end)
Tab2:Seperator("Bone Farm")
Result11 = Tab2:Label("")
spawn(function()
    while wait() do
        pcall(function()
            Result11:Set("Total Bone : " .. game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Check"))
        end)
    end
end)
Tab2:Dropdown("Farm Mode", {
    "No Quest",
    "Quest",
    "Mastery"
}, function(Param)
    Value8 = Param
end)
Value8 = Value8 or "No Quest"
Tab2:Toggle("Auto Farm Bone", false, function(Param)
    _G.Auto_Bone = Param
    Function38(_G.Auto_Bone)
end)
local Inst3 = CFrame.new(-9506.234375, 172.130615234375, 6117.0771484375)
spawn(function()
    while wait() do
        local BoneFMode = Value8
        if BoneFMode == "No Quest" then
            BoneFMode = _G.Auto_Bone
            if BoneFMode then
                BoneFMode = Flag3
                if BoneFMode then
                    pcall(function()
                        if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy") then
                            for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if (I2.Name == "Reborn Skeleton" or I2.Name == "Living Zombie" or I2.Name == "Demonic Soul" or I2.Name == "Posessed Mummy") and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                                    while true do
                                        task.wait()
                                        Function30()
                                        Function32(_G.SelectWeapon)
                                        I2.HumanoidRootPart.CanCollide = false
                                        I2.Humanoid.WalkSpeed = 0
                                        I2.Head.CanCollide = false
                                        Flag53 = true
                                        CFrame15 = I2.HumanoidRootPart.CFrame
                                        Function35(I2.HumanoidRootPart.CFrame * R03664)
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                        if _G.Auto_Bone then
                                            local Parent = I2.Parent
                                            if Parent then
                                                Parent = I2.Humanoid.Health
                                                if Parent <= 0 then
                                                    break
                                                end
                                            else
                                                break
                                            end
                                        else
                                            break
                                        end
                                    end
                                end
                            end
                        else
                            if R0216 then
                                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst3.Position).Magnitude > 1500 then
                                    Function33(Inst3)
                                elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst3.Position).Magnitude < 1500 then
                                    Function35(Inst3)
                                end
                            else
                                Function35(Inst3)
                            end
                            Function31(_G.SelectWeapon)
                            Flag53 = false
                            Function35(CFrame.new(-9506.234375, 172.130615234375, 6117.0771484375))
                            for I, I2 in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
                                if I2.Name == "Reborn Skeleton" then
                                    Function35(I2.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                                elseif I2.Name == "Living Zombie" then
                                    Function35(I2.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                                elseif I2.Name == "Demonic Soul" then
                                    Function35(I2.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                                elseif I2.Name == "Posessed Mummy" then
                                    Function35(I2.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                                end
                            end
                        end
                    end)
                end
            end
        end
    end
end)
local Inst4 = CFrame.new(-9516.993159999999989, 172.017180999999994, 6078.465329999999994, 0, 0, -1, 0, 1, 0, 1, 0, 0)
spawn(function()
    while wait() do
        local BoneFMode = Value8
        if BoneFMode == "Quest" then
            BoneFMode = _G.Auto_Bone
            if BoneFMode then
                BoneFMode = Flag3
                if BoneFMode then
                    pcall(function()
                        if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Demonic Soul") then
                            Flag53 = false
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                        end
                        if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                            Flag53 = false
                            if R0216 then
                                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst4.Position).Magnitude > 1500 then
                                    Function33(Inst4)
                                elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst4.Position).Magnitude < 1500 then
                                    Function35(Inst4)
                                end
                            else
                                Function35(Inst4)
                            end
                            if (Inst4.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "HauntedQuest2", 1)
                            end
                        elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy") then
                                for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if I2:FindFirstChild("HumanoidRootPart") and I2:FindFirstChild("Humanoid") and 0 < I2.Humanoid.Health and (I2.Name == "Reborn Skeleton" or I2.Name == "Living Zombie" or I2.Name == "Demonic Soul" or I2.Name == "Posessed Mummy") then
                                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Demonic Soul") then
                                            task.wait()
                                            Function32(_G.SelectWeapon)
                                            Function30()
                                            CFrame15 = I2.HumanoidRootPart.CFrame
                                            Function35(I2.HumanoidRootPart.CFrame * R03664)
                                            I2.HumanoidRootPart.CanCollide = false
                                            I2.Humanoid.WalkSpeed = 0
                                            I2.Head.CanCollide = false
                                            I2.HumanoidRootPart.Size = Vector3.new(70, 70, 70)
                                            Flag53 = true
                                            game:GetService("VirtualUser"):CaptureController()
                                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                            if _G.Auto_Bone and I2.Humanoid.Health > 0 and I2.Parent and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible ~= false then
                                                Flag53 = false
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                            end
                                        else
                                            -- empty block
                                        end
                                    end
                                end
                            else
                                Flag53 = false
                                if game:GetService("ReplicatedStorage"):FindFirstChild("Demonic Soul [Lv. 2025]") then
                                    Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Demonic Soul [Lv. 2025]").HumanoidRootPart.CFrame * CFrame.new(15, 10, 2))
                                end
                            end
                        end
                    end)
                end
            end
        end
    end
end)
spawn(function()
    while wait() do
        local BoneFMode = Value8
        if BoneFMode == "Mastery" then
            BoneFMode = _G.Auto_Bone
            if BoneFMode then
                BoneFMode = Flag3
                if BoneFMode then
                    pcall(function()
                        if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Demonic Soul") then
                            Flag53 = false
                            Flag54 = false
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                        end
                        if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                            Flag53 = false
                            Flag54 = false
                            if R0216 then
                                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst4.Position).Magnitude > 1500 then
                                    Function33(Inst4)
                                elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst4.Position).Magnitude < 1500 then
                                    Function35(Inst4)
                                end
                            else
                                Function35(Inst4)
                            end
                            if (Inst4.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "HauntedQuest2", 1)
                            end
                        elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy") then
                                for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if I2:FindFirstChild("HumanoidRootPart") and I2:FindFirstChild("Humanoid") and 0 < I2.Humanoid.Health and (I2.Name == "Reborn Skeleton" or I2.Name == "Living Zombie" or I2.Name == "Demonic Soul" or I2.Name == "Posessed Mummy") then
                                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Demonic Soul") then
                                            Value10 = I2.Humanoid.MaxHealth * _G.Kill_At / 100
                                            task.wait()
                                            if I2.Humanoid.Health <= Value10 then
                                                Function30()
                                                Function32(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value)
                                                Function35(I2.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0))
                                                I2.HumanoidRootPart.CanCollide = false
                                                CFrame15 = I2.HumanoidRootPart.CFrame
                                                I2.Humanoid.WalkSpeed = 0
                                                I2.Head.CanCollide = false
                                                Flag54 = true
                                            else
                                                Flag54 = false
                                                Function30()
                                                Function32(_G.SelectWeapon)
                                                Function35(I2.HumanoidRootPart.CFrame * R03664)
                                                I2.HumanoidRootPart.CanCollide = false
                                                I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                                CFrame15 = I2.HumanoidRootPart.CFrame
                                                I2.Humanoid.WalkSpeed = 0
                                                I2.Head.CanCollide = false
                                            end
                                            Flag53 = true
                                            game:GetService("VirtualUser"):CaptureController()
                                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                            if _G.Auto_Bone and I2.Humanoid.Health > 0 and I2.Parent and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible ~= false then
                                                Flag54 = false
                                                Flag53 = false
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                            end
                                        else
                                            -- empty block
                                        end
                                    end
                                end
                            else
                                Flag53 = false
                                Flag54 = false
                                local Child = game:GetService("ReplicatedStorage"):FindFirstChild("Demonic Soul")
                                if Child then
                                    Function35(Child.HumanoidRootPart.CFrame * CFrame.new(0, 0, 10))
                                elseif game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.Y <= 1 then
                                    game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = true
                                    task.wait()
                                    game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = false
                                end
                            end
                        end
                    end)
                end
            end
        end
    end
end)
Tab2:Toggle("Auto Random Surprise", false, function(Param)
    _G.Auto_Random_Bone = Param
end)
spawn(function()
    pcall(function()
        while wait(0) do
            local AutoRandomBone = _G.Auto_Random_Bone
            if AutoRandomBone then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
            end
        end
    end)
end)
Tab2:Toggle("Auto Pray", false, function(Param)
    _G.Pray = Param
end)
spawn(function()
    pcall(function()
        while wait(0.1) do
            local Pray = _G.Pray
            if Pray then
                Function35(CFrame.new(-8652.997069999999439, 143.450119000000001, 6170.508789999999863, -0.983064115, -0.000000000248006, 0.18326205, -0.000000001789104, 1, -0.000000008243923, -0.18326205, -0.00000000843218, -0.983064115))
                wait()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent", 1)
            end
        end
    end)
end)
Tab2:Toggle("Auto Try Luck", false, function(Param)
    _G.Trylux = Param
end)
spawn(function()
    pcall(function()
        while wait(0.1) do
            local Trylux = _G.Trylux
            if Trylux then
                Function35(CFrame.new(-8652.997069999999439, 143.450119000000001, 6170.508789999999863, -0.983064115, -0.000000000248006, 0.18326205, -0.000000001789104, 1, -0.000000008243923, -0.18326205, -0.00000000843218, -0.983064115))
                wait()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent", 2)
            end
        end
    end)
end)
Tab2:Seperator("Mastery Farm")
Tab2:Toggle("Auto Farm Fruit Mastery", false, function(Param)
    _G.AutoFarmFruitMastery = Param
    Function38(_G.AutoFarmFruitMastery)
    if _G.AutoFarmFruitMastery == false then
        Flag66 = false
    end
end)
spawn(function()
    while wait() do
        local AutoFarmFruitMastery = _G.AutoFarmFruitMastery
        if AutoFarmFruitMastery then
            pcall(function()
                if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, String252) then
                    Flag72 = false
                    Flag66 = false
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                end
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    Flag65 = false
                    Flag66 = false
                    Function2()
                    while true do
                        wait()
                        Function35(Inst167)
                        if (Inst167.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3 then
                            local Child = _G.AutoFarmFruitMastery
                            if not Child then
                                break
                            end
                        else
                            break
                        end
                    end
                    if (Inst167.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                        wait(0.1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", String251, Number84)
                        wait(0.1)
                    end
                elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    Function2()
                    if game:GetService("Workspace").Enemies:FindFirstChild(String250) then
                        for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if I2:FindFirstChild("HumanoidRootPart") and I2:FindFirstChild("Humanoid") and 0 < I2.Humanoid.Health and I2.Name == String250 then
                                if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, String252) then
                                    Value10 = I2.Humanoid.MaxHealth * _G.Kill_At / 100
                                    task.wait()
                                    if I2.Humanoid.Health <= Value10 then
                                        Function30()
                                        Function32(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value)
                                        Function35(I2.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0))
                                        I2.HumanoidRootPart.CanCollide = false
                                        CFrame17 = I2.HumanoidRootPart.CFrame
                                        I2.Humanoid.WalkSpeed = 0
                                        I2.Head.CanCollide = false
                                        Flag66 = true
                                    else
                                        Flag66 = false
                                        Function30()
                                        Function32(_G.SelectWeapon)
                                        Function35(I2.HumanoidRootPart.CFrame * R03664)
                                        I2.HumanoidRootPart.CanCollide = false
                                        I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                        CFrame17 = I2.HumanoidRootPart.CFrame
                                        I2.Humanoid.WalkSpeed = 0
                                        I2.Head.CanCollide = false
                                    end
                                    Flag65 = true
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    if _G.AutoFarmFruitMastery and I2.Humanoid.Health > 0 and I2.Parent and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible ~= false then
                                        Flag66 = false
                                        Flag65 = false
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                    end
                                else
                                    -- empty block
                                end
                            end
                        end
                    else
                        Function35(Inst168)
                        Function31(_G.SelectWeapon)
                        Flag65 = false
                        Flag66 = false
                        local Child = game:GetService("ReplicatedStorage"):FindFirstChild(String250)
                        if Child then
                            Function35(Child.HumanoidRootPart.CFrame * CFrame.new(0, 0, 10))
                        elseif game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.Y <= 1 then
                            game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = true
                            task.wait()
                            game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = false
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        local UseSkill = Flag66
        if UseSkill then
            pcall(function()
                Function2()
                for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value) then
                        Value14 = game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Data.DevilFruit.Value].Level.Value
                    elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value) then
                        Value14 = game:GetService("Players").LocalPlayer.Backpack[game:GetService("Players").LocalPlayer.Data.DevilFruit.Value].Level.Value
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon - Dragon") then
                        if _G.SkillZ then
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack({
                                [1] = CFrame17.Position
                            }))
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                        end
                        if _G.SkillX then
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack({
                                [1] = CFrame17.Position
                            }))
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                        end
                        if _G.SkillC then
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack({
                                [1] = CFrame17.Position
                            }))
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                            wait(2)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
                        end
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Venom - Venom") then
                        if _G.SkillZ then
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack({
                                [1] = CFrame17.Position
                            }))
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                        end
                        if _G.SkillX then
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack({
                                [1] = CFrame17.Position
                            }))
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                        end
                        if _G.SkillC then
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack({
                                [1] = CFrame17.Position
                            }))
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                            wait(2)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
                        end
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Human - Human: Buddha") then
                        if _G.SkillZ and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Size == Vector3.new(2, 2.0199999809265, 1) then
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack({
                                [1] = CFrame17.Position
                            }))
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                        end
                        if _G.SkillX then
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack({
                                [1] = CFrame17.Position
                            }))
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                        end
                        if _G.SkillC then
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack({
                                [1] = CFrame17.Position
                            }))
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
                        end
                        if _G.SkillV then
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack({
                                [1] = CFrame17.Position
                            }))
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
                        end
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value) then
                        if _G.SkillZ then
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack({
                                [1] = CFrame17.Position
                            }))
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                        end
                        if _G.SkillX then
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack({
                                [1] = CFrame17.Position
                            }))
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                        end
                        if _G.SkillC then
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack({
                                [1] = CFrame17.Position
                            }))
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
                        end
                        if _G.SkillV then
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack({
                                [1] = CFrame17.Position
                            }))
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        pcall(function()
            if Flag66 then
                for I, I2 in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Notifications:GetChildren()) do
                    if I2.Name == "NotificationTemplate" and string.find(I2.Text, "Skill locked!") then
                        I2:Destroy()
                    end
                end
            end
        end)
    end)
end)
spawn(function()
    pcall(function()
        game:GetService("RunService").RenderStepped:Connect(function()
            if Flag66 then
                game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Data.DevilFruit.Value].RemoteEvent:FireServer(unpack({
                    [1] = CFrame17.Position
                }))
            end
        end)
    end)
end)
spawn(function()
    while wait() do
        local UseSkillKub = Flag54
        if UseSkillKub then
            pcall(function()
                for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value) then
                        Value14 = game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Data.DevilFruit.Value].Level.Value
                    elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value) then
                        Value14 = game:GetService("Players").LocalPlayer.Backpack[game:GetService("Players").LocalPlayer.Data.DevilFruit.Value].Level.Value
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon - Dragon") then
                        if _G.SkillZ then
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack({
                                [1] = CFrame17.Position
                            }))
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                        end
                        if _G.SkillX then
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack({
                                [1] = CFrame17.Position
                            }))
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                        end
                        if _G.SkillC then
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack({
                                [1] = CFrame17.Position
                            }))
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                            wait(2)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
                        end
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Venom - Venom") then
                        if _G.SkillZ then
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack({
                                [1] = CFrame17.Position
                            }))
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                        end
                        if _G.SkillX then
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack({
                                [1] = CFrame17.Position
                            }))
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                        end
                        if _G.SkillC then
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack({
                                [1] = CFrame17.Position
                            }))
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                            wait(2)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
                        end
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Human - Human: Buddha") then
                        if _G.SkillZ and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Size == Vector3.new(2, 2.0199999809265, 1) then
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack({
                                [1] = CFrame17.Position
                            }))
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                        end
                        if _G.SkillX then
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack({
                                [1] = CFrame17.Position
                            }))
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                        end
                        if _G.SkillC then
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack({
                                [1] = CFrame17.Position
                            }))
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
                        end
                        if _G.SkillV then
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack({
                                [1] = CFrame17.Position
                            }))
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
                        end
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value) then
                        if _G.SkillZ then
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack({
                                [1] = CFrame17.Position
                            }))
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                        end
                        if _G.SkillX then
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack({
                                [1] = CFrame17.Position
                            }))
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                        end
                        if _G.SkillC then
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack({
                                [1] = CFrame17.Position
                            }))
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
                        end
                        if _G.SkillV then
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack({
                                [1] = CFrame17.Position
                            }))
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        pcall(function()
            if Flag54 then
                for I, I2 in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Notifications:GetChildren()) do
                    if I2.Name == "NotificationTemplate" and string.find(I2.Text, "Skill locked!") then
                        I2:Destroy()
                    end
                end
            end
        end)
    end)
end)
spawn(function()
    pcall(function()
        game:GetService("RunService").RenderStepped:Connect(function()
            if Flag54 then
                game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Data.DevilFruit.Value].RemoteEvent:FireServer(unpack({
                    [1] = CFrame17.Position
                }))
            end
        end)
    end)
end)
Tab2:Toggle("Auto Farm Gun Mastery", false, function(Param)
    _G.AutoFarmGunMastery = Param
    Function38(_G.AutoFarmGunMastery)
end)
spawn(function()
    pcall(function()
        while wait() do
            local AutoFarmGunMastery = _G.AutoFarmGunMastery
            if AutoFarmGunMastery then
                AutoFarmGunMastery = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                if not string.find(AutoFarmGunMastery, String252) then
                    Flag72 = false
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                end
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    Flag71 = false
                    Function2()
                    Function35(Inst167)
                    if (Inst167.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                        wait(0.1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", String251, Number84)
                    end
                elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    Function2()
                    if game:GetService("Workspace").Enemies:FindFirstChild(String250) then
                        pcall(function()
                            for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if I2.Name == String250 then
                                    while true do
                                        task.wait()
                                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, String252) then
                                            Value16 = I2.Humanoid.MaxHealth * _G.Kill_At / 100
                                            local Health = I2.Humanoid.Health
                                            local HealthMin = Value16
                                            if Health <= HealthMin then
                                                Function32(Name)
                                                Function35(I2.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0))
                                                I2.Humanoid.WalkSpeed = 0
                                                I2.HumanoidRootPart.CanCollide = false
                                                I2.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
                                                I2.Head.CanCollide = false
                                                Health = {}
                                                Health[1] = I2.HumanoidRootPart.Position
                                                Health[2] = I2.HumanoidRootPart
                                                game:GetService("Players").LocalPlayer.Character[Name].RemoteFunctionShoot:InvokeServer(unpack(Health))
                                            else
                                                Function30()
                                                Function32(_G.SelectWeapon)
                                                I2.Humanoid.WalkSpeed = 0
                                                I2.HumanoidRootPart.CanCollide = false
                                                I2.Head.CanCollide = false
                                                I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                                Function35(I2.HumanoidRootPart.CFrame * R03664)
                                                game:GetService("VirtualUser"):CaptureController()
                                                Health = game:GetService("VirtualUser")
                                                Health:Button1Down(Vector2.new(1280, 672))
                                            end
                                            Flag71 = true
                                            Health = I2.HumanoidRootPart.CFrame
                                            R5101 = Health
                                        else
                                            Flag71 = false
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                        end
                                        local Health = I2.Humanoid.Health
                                        if Health > 0 then
                                            Health = _G.AutoFarmGunMastery
                                            if Health ~= false then
                                                Health = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                                                if Health == false then
                                                    break
                                                end
                                            else
                                                break
                                            end
                                        else
                                            break
                                        end
                                    end
                                    Flag71 = false
                                end
                            end
                        end)
                    else
                        Function35(Inst168)
                        Function31(_G.SelectWeapon)
                        _G.AutoFarmGunMastery = false
                        local Child = game:GetService("ReplicatedStorage"):FindFirstChild(String250)
                        if Child then
                            Function35(Child.HumanoidRootPart.CFrame * CFrame.new(0, 0, 10))
                        elseif game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.Y <= 1 then
                            game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = true
                            task.wait()
                            game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = false
                        end
                    end
                end
            end
        end
    end)
end)
Tab2:Toggle("Auto Farm Sword Mastery", false, function(Param)
    _G.AutoSwordMastery = Param
    Function38(_G.AutoSwordMastery)
end)
spawn(function()
    pcall(function()
        while wait() do
            local AutoSwordMastery = _G.AutoSwordMastery
            if AutoSwordMastery then
                AutoSwordMastery = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                if not string.find(AutoSwordMastery, String252) then
                    Flag72 = false
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                end
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    Flag77 = false
                    Function2()
                    Function35(Inst167)
                    if (Inst167.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                        wait(0.1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", String251, Number84)
                    end
                elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    Function2()
                    if game:GetService("Workspace").Enemies:FindFirstChild(String250) then
                        pcall(function()
                            for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if I2.Name == String250 then
                                    while true do
                                        task.wait()
                                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, String252) then
                                            Value16 = I2.Humanoid.MaxHealth * _G.Kill_At / 100
                                            local Health = I2.Humanoid.Health
                                            local HealthMin = Value16
                                            if Health <= HealthMin then
                                                Function39()
                                                Function35(I2.HumanoidRootPart.CFrame * R03664)
                                                I2.Humanoid.WalkSpeed = 0
                                                I2.HumanoidRootPart.CanCollide = false
                                                I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                                game:GetService("VirtualUser"):CaptureController()
                                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                                Health = I2.Head
                                                Health.CanCollide = false
                                            else
                                                Function30()
                                                Function32(_G.SelectWeapon)
                                                I2.Humanoid.WalkSpeed = 0
                                                I2.HumanoidRootPart.CanCollide = false
                                                I2.Head.CanCollide = false
                                                I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                                Function35(I2.HumanoidRootPart.CFrame * R03664)
                                                game:GetService("VirtualUser"):CaptureController()
                                                Health = game:GetService("VirtualUser")
                                                Health:Button1Down(Vector2.new(1280, 672))
                                            end
                                            Flag77 = true
                                            Health = I2.HumanoidRootPart.CFrame
                                            CFrame18 = Health
                                        else
                                            Flag77 = false
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                        end
                                        local Health = I2.Humanoid.Health
                                        if Health > 0 then
                                            Health = _G.AutoSwordMastery
                                            if Health ~= false then
                                                Health = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                                                if Health == false then
                                                    break
                                                end
                                            else
                                                break
                                            end
                                        else
                                            break
                                        end
                                    end
                                    Flag77 = false
                                end
                            end
                        end)
                    else
                        Function35(Inst168)
                        Function31(_G.SelectWeapon)
                        Flag77 = false
                        local Child = game:GetService("ReplicatedStorage"):FindFirstChild(String250)
                        if Child then
                            Function35(Child.HumanoidRootPart.CFrame * CFrame.new(0, 0, 10))
                        elseif game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.Y <= 1 then
                            game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = true
                            task.wait()
                            game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = false
                        end
                    end
                end
            end
        end
    end)
end)
Tab2:Toggle("Use Skill Z", true, function(Param)
    _G.SkillZ = Param
end)
Tab2:Toggle("Use Skill X", true, function(Param)
    _G.SkillX = Param
end)
Tab2:Toggle("Use Skill C", true, function(Param)
    _G.SkillC = Param
end)
Tab2:Toggle("Use Skill V", true, function(Param)
    _G.SkillV = Param
end)
Tab2:Slider("Kill Monster At ..% Health", 0, 100, 30, function(Param)
    _G.Kill_At = Param
end)
_G.Kill_At = 30
Tab2:Seperator("Boss Farm")
local Value2 = {}
for Character, HumanoidRootPart in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
    if string.find(HumanoidRootPart.Name, "Boss") and HumanoidRootPart.Name ~= "Ice Admiral" then
        table.insert(Value2, HumanoidRootPart.Name)
    end
end
local Value3 = {}
local Value4 = {
    "The Gorilla King",
    "Bobby",
    "The Saw",
    "Yeti",
    "Mob Leader",
    "Vice Admiral",
    "Warden",
    "Chief Warden",
    "Swan",
    "Saber Expert",
    "Magma Admiral",
    "Fishman Lord",
    "Wysper",
    "Thunder God",
    "Cyborg",
    "Greybeard",
    "Diamond",
    "Jeremy",
    "Fajita",
    "Don Swan",
    "Smoke Admiral",
    "Awakened Ice Admiral",
    "Tide Keeper",
    "Order",
    "Darkbeard",
    "Cursed Captain",
    "Stone",
    "Island Empress",
    "Kilo Admiral",
    "Captain Elephant",
    "Beautiful Pirate",
    "Longma",
    "Cake Queen",
    "Soul Reaper",
    "Rip_Indra",
    "Cake Prince",
    "Dough King"
}
if Flag or Flag2 or Flag3 then
    for Players, Player2 in pairs(Value4) do
        local Service = game:GetService("ReplicatedStorage")
        local Flag = "FindFirstChild"
        Flag = Player2
        Service = Service[Flag](Flag)
        if Service then
            table.insert(Value3, Player2)
        end
    end
end
for Players, Player2 in pairs(Value2) do
    table.insert(Value3, Player2)
end
local Dropdown = Tab2:Dropdown("Select Boss", Value3, function(Param)
    _G.SelectBoss = Param
end)
Tab2:Button("Refresh Boss List", function()
    Dropdown:Clear()
    wait(0.1)
    for I, I2 in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if I2.Name == "rip_indra" or I2.Name == "Ice Admiral" or I2.Name == "Saber Expert" or I2.Name == "The Saw" or I2.Name == "Greybeard" or I2.Name == "Mob Leader" or I2.Name == "The Gorilla King" or I2.Name == "Bobby" or I2.Name == "Yeti" or I2.Name == "Vice Admiral" or I2.Name == "Warden" or I2.Name == "Chief Warden" or I2.Name == "Swan" or I2.Name == "Magma Admiral" or I2.Name == "Fishman Lord" or I2.Name == "Wysper" or I2.Name == "Thunder God" or I2.Name == "Cyborg" or I2.Name == "Don Swan" or I2.Name == "Diamond" or I2.Name == "Jeremy" or I2.Name == "Fajita" or I2.Name == "Smoke Admiral" or I2.Name == "Awakened Ice Admiral" or I2.Name == "Tide Keeper" or I2.Name == "Order" or I2.Name == "Darkbeard" or I2.Name == "Stone" or I2.Name == "Island Empress" or I2.Name == "Kilo Admiral" or I2.Name == "Captain Elephant" or I2.Name == "Beautiful Pirate" or I2.Name == "Cake Queen" or I2.Name == "rip_indra True Form" or I2.Name == "Longma" or I2.Name == "Soul Reaper" or I2.Name == "Cake Prince" or I2.Name == "Dough King" then
            Dropdown:Add(I2.Name)
        end
    end
end)
Tab2:Toggle("Auto Farm Selected Boss", false, function(Param)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
    _G.AutoFarmBoss = Param
    Function38(_G.AutoFarmBoss)
end)
spawn(function()
    while wait() do
        local AutoFarmBoss = _G.AutoFarmBoss
        if AutoFarmBoss then
            AutoFarmBoss = R0216
            if AutoFarmBoss then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild(_G.SelectBoss) then
                        for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if I2.Name == _G.SelectBoss and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                                while true do
                                    task.wait()
                                    Function30()
                                    Function32(_G.SelectWeapon)
                                    I2.HumanoidRootPart.CanCollide = false
                                    I2.Humanoid.WalkSpeed = 0
                                    I2.HumanoidRootPart.Size = Vector3.new(80, 80, 80)
                                    Function35(I2.HumanoidRootPart.CFrame * R03664)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                    if _G.AutoFarmBoss then
                                        local Parent = I2.Parent
                                        if Parent then
                                            Parent = I2.Humanoid.Health
                                            if Parent <= 0 then
                                                break
                                            end
                                        else
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                            end
                        end
                    elseif game.ReplicatedStorage:FindFirstChild(_G.SelectBoss) then
                        if (game.ReplicatedStorage:FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 1500 then
                            Function35(game.ReplicatedStorage:FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame)
                        else
                            Function33(game.ReplicatedStorage:FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame)
                        end
                    end
                end)
            end
        end
    end
end)
spawn(function()
    while wait() do
        local AutoFarmBoss = _G.AutoFarmBoss
        if AutoFarmBoss then
            AutoFarmBoss = R0216
            if not AutoFarmBoss then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild(_G.SelectBoss) then
                        for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if I2.Name == _G.SelectBoss and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                                while true do
                                    task.wait()
                                    Function30()
                                    Function32(_G.SelectWeapon)
                                    I2.HumanoidRootPart.CanCollide = false
                                    I2.Humanoid.WalkSpeed = 0
                                    I2.HumanoidRootPart.Size = Vector3.new(80, 80, 80)
                                    Function35(I2.HumanoidRootPart.CFrame * Farm_pos)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                    if _G.AutoFarmBoss then
                                        local Parent = I2.Parent
                                        if Parent then
                                            Parent = I2.Humanoid.Health
                                            if Parent <= 0 then
                                                break
                                            end
                                        else
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                            end
                        end
                    elseif game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss) then
                        Function35(game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                    end
                end)
            end
        end
    end
end)
Tab2:Toggle("Auto Farm All Boss", false, function(Param)
    _G.AutoAllBoss = Param
    Function38(_G.AutoAllBoss)
end)
spawn(function()
    while wait() do
        local AutoAllBoss = _G.AutoAllBoss
        if AutoAllBoss then
            pcall(function()
                for I, I2 in pairs(game.ReplicatedStorage:GetChildren()) do
                    if (I2.Name == "rip_indra" or I2.Name == "Ice Admiral" or I2.Name == "Saber Expert" or I2.Name == "The Saw" or I2.Name == "Greybeard" or I2.Name == "Mob Leader" or I2.Name == "The Gorilla King" or I2.Name == "Bobby" or I2.Name == "Yeti" or I2.Name == "Vice Admiral" or I2.Name == "Warden" or I2.Name == "Chief Warden" or I2.Name == "Swan" or I2.Name == "Magma Admiral" or I2.Name == "Fishman Lord" or I2.Name == "Wysper" or I2.Name == "Thunder God" or I2.Name == "Cyborg" or I2.Name == "Don Swan" or I2.Name == "Diamond" or I2.Name == "Jeremy" or I2.Name == "Fajita" or I2.Name == "Smoke Admiral" or I2.Name == "Awakened Ice Admiral" or I2.Name == "Tide Keeper" or I2.Name == "Order" or I2.Name == "Darkbeard" or I2.Name == "Stone" or I2.Name == "Island Empress" or I2.Name == "Kilo Admiral" or I2.Name == "Captain Elephant" or I2.Name == "Beautiful Pirate" or I2.Name == "Cake Queen" or I2.Name == "rip_indra True Form" or I2.Name == "Longma" or I2.Name == "Soul Reaper" or I2.Name == "Cake Prince" or I2.Name == "Dough King") and (I2.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 17000 then
                        while true do
                            task.wait()
                            Function30()
                            Function32(_G.SelectWeapon)
                            I2.Humanoid.WalkSpeed = 0
                            I2.HumanoidRootPart.CanCollide = false
                            I2.Head.CanCollide = false
                            I2.HumanoidRootPart.Size = Vector3.new(80, 80, 80)
                            Function35(I2.HumanoidRootPart.CFrame * R03664)
                            game:GetService("VirtualUser"):CaptureController()
                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                            if I2.Humanoid.Health > 0 then
                                local AutoAllBoss2 = _G.AutoAllBoss
                                if AutoAllBoss2 ~= false then
                                    AutoAllBoss2 = I2.Parent
                                    if not AutoAllBoss2 then
                                        -- empty block
                                    end
                                else
                                    break
                                end
                            else
                                break
                            end
                        end
                    elseif _G.AutoAllBossHop then
                        Function3()
                    end
                end
            end)
        end
    end
end)
Tab2:Seperator("Monster Farm")
if Flag then
    Value19 = {
        "Bandit",
        "Monkey",
        "Gorilla",
        "Pirate",
        "Brute",
        "Desert Bandit",
        "Desert Officer",
        "Snow Bandit",
        "Snowman",
        "Chief Petty Officer",
        "Sky Bandit",
        "Dark Master",
        "Toga Warrior",
        "Gladiator",
        "Military Soldier",
        "Military Spy",
        "Fishman Warrior",
        "Fishman Commando",
        "God's Guard",
        "Shanda",
        "Royal Squad",
        "Royal Soldier",
        "Galley Pirate",
        "Galley Captain"
    }
elseif Flag2 then
    Value19 = {
        "Raider",
        "Mercenary",
        "Swan Pirate",
        "Factory Staff",
        "Marine Lieutenant",
        "Marine Captain",
        "Zombie",
        "Vampire",
        "Snow Trooper",
        "Winter Warrior",
        "Lab Subordinate",
        "Horned Warrior",
        "Magma Ninja",
        "Lava Pirate",
        "Ship Deckhand",
        "Ship Engineer",
        "Ship Steward",
        "Ship Officer",
        "Arctic Warrior",
        "Snow Lurker",
        "Sea Soldier",
        "Water Fighter"
    }
elseif Flag3 then
    Value19 = {
        "Pirate Millionaire",
        "Dragon Crew Warrior",
        "Dragon Crew Archer",
        "Female Islander",
        "Giant Islander",
        "Marine Commodore",
        "Marine Rear Admiral",
        "Fishman Raider",
        "Fishman Captain",
        "Forest Pirate",
        "Mythological Pirate",
        "Jungle Pirate",
        "Musketeer Pirate",
        "Reborn Skeleton",
        "Living Zombie",
        "Demonic Soul",
        "Posessed Mummy",
        "Peanut Scout",
        "Peanut President",
        "Ice Cream Chef",
        "Ice Cream Commander",
        "Cookie Crafter",
        "Cake Guard",
        "Baking Staff",
        "Head Baker",
        "Cocoa Warrior",
        "Chocolate Bar Battler",
        "Sweet Thief",
        "Candy Rebel",
        "Candy Pirate",
        "Snow Demon",
        "Isle Outlaw",
        "Island Boy",
        "Sun - kissed Warrior",
        "Isle Champion",
        nil
    }
end
Tab2:Dropdown("Select Monster", Value19, function(Param)
    _G.SelectMob = Param
end)
Tab2:Toggle("Auto Farm Selected Monster", false, function(Param)
    _G.AutoFarmMob = Param
    Function38(_G.AutoFarmMob)
end)
spawn(function()
    while wait() do
        local AutoFarmMob = _G.AutoFarmMob
        if AutoFarmMob then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild(_G.SelectMob) then
                    for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if I2.Name == _G.SelectMob and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                            while true do
                                task.wait()
                                Function30()
                                Function32(_G.SelectWeapon)
                                I2.HumanoidRootPart.CanCollide = false
                                I2.Humanoid.WalkSpeed = 0
                                Flag79 = true
                                CFrame18 = I2.HumanoidRootPart.CFrame
                                I2.HumanoidRootPart.Size = Vector3.new(80, 80, 80)
                                Function35(I2.HumanoidRootPart.CFrame * R03664)
                                game:GetService("VirtualUser"):CaptureController()
                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                if _G.AutoFarmMob then
                                    local Parent = I2.Parent
                                    if Parent then
                                        Parent = I2.Humanoid.Health
                                        if Parent <= 0 then
                                            break
                                        end
                                    else
                                        break
                                    end
                                else
                                    break
                                end
                            end
                            Flag79 = false
                        end
                    end
                elseif game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectMob) then
                    Function35(game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectMob).HumanoidRootPart.CFrame * CFrame.new(5, 10, 2))
                end
            end)
        end
    end
end)
Tab3:Toggle("Auto Function29", false, function(Param)
    _G.AutoClick = Param
end)
Tab3:Toggle("Black Screen", false, function(Param)
    _G.StartBlackScreen = Param
end)
spawn(function()
    while wait() do
        local StartBlackScreen = _G.StartBlackScreen
        if StartBlackScreen then
            StartBlackScreen = game:GetService("Players").LocalPlayer.PlayerGui.Main.Blackscreen
            StartBlackScreen.Size = UDim2.new(500, 0, 500, 500)
        else
            StartBlackScreen = game:GetService("Players").LocalPlayer.PlayerGui.Main.Blackscreen
            StartBlackScreen.Size = UDim2.new(1, 0, 500, 500)
        end
    end
end)
Tab3:Toggle("White Screen", false, function(Param)
    _G.WhiteScreen = Param
    if _G.WhiteScreen == true then
        game:GetService("RunService"):Set3dRenderingEnabled(false)
    elseif _G.WhiteScreen == false then
        game:GetService("RunService"):Set3dRenderingEnabled(true)
    end
end)
spawn(function()
    while wait() do
        local WhiteScreen = _G.WhiteScreen
        if WhiteScreen then
            WhiteScreen = pairs
            for I, I2 in WhiteScreen(game.Workspace._WorldOrigin:GetChildren()) do
                if I2.Name == "CurvedRing" or I2.Name == "SlashHit" or I2.Name == "DamageCounter" or I2.Name == "SwordSlash" or I2.Name == "SlashTail" or I2.Name == "Sounds" then
                    I2:Destroy()
                end
            end
        end
    end
end)
Tab3:Toggle("Invisible Monster", false, function(Param)
    _G.inv = Param
    while wait() do
        local Inv = _G.inv
        if Inv then
            pcall(function()
                for I, I2 in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
                    if I2.ClassName == "MeshPart" then
                        I2.Transparency = 1
                    end
                end
                for I, I2 in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
                    if I2.Name == "Head" then
                        I2.Transparency = 1
                    end
                end
                for I, I2 in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
                    if I2.ClassName == "Accessory" then
                        I2.Handle.Transparency = 1
                    end
                end
                for I, I2 in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
                    if I2.ClassName == "Decal" then
                        I2.Transparency = 1
                    end
                end
            end)
        end
    end
end)
Tab3:Toggle("Remove Notification", false, function(Param)
    _G.Remove_trct = Param
end)
spawn(function()
    while wait() do
        local RemoveTrct = _G.Remove_trct
        if RemoveTrct then
            RemoveTrct = game.Players.LocalPlayer.PlayerGui.Notifications
            RemoveTrct.Enabled = false
        else
            RemoveTrct = game.Players.LocalPlayer.PlayerGui.Notifications
            RemoveTrct.Enabled = true
        end
    end
end)
Tab3:Toggle("Remove Damage Text", true, function(Param)
    _G.MassDaHeegeen = Param
end)
spawn(function()
    while wait() do
        local MassDaHeegeen = _G.MassDaHeegeen
        if MassDaHeegeen then
            MassDaHeegeen = game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter
            MassDaHeegeen.Enabled = false
        else
            MassDaHeegeen = game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter
            MassDaHeegeen.Enabled = true
        end
    end
end)
Tab3:Toggle("Remove Death Effect", true, function(Param)
    _G.Remove_Effect = Param
end)
spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        if _G.Remove_Effect then
            for I, I2 in pairs(game:GetService("ReplicatedStorage").Effect.Container:GetChildren()) do
                if I2.Name == "Death" then
                    I2:Destroy()
                end
            end
        end
    end)
end)
Tab3:Toggle("Auto Set Spawn Point", true, function(Param)
    _G.Set = Param
end)
spawn(function()
    while wait() do
        local Set = _G.Set
        if Set then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    [1] = "SetSpawnPoint"
                }))
            end)
        end
    end
end)
Tab3:Toggle("Auto Turn On Buso Haki", true, function(Param)
    _G.AUTOHAKI = Param
end)
spawn(function()
    while wait(0.1) do
        local Autohaki = _G.AUTOHAKI
        if Autohaki then
            Autohaki = game.Players.LocalPlayer.Character:FindFirstChild("HasBuso")
            if not Autohaki then
                Autohaki = {}
                Autohaki[1] = "Buso"
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(Autohaki))
            end
        end
    end
end)
Tab3:Toggle("Bypass TP", true, function(Param)
    R0216 = Param
end)
Tab3:Toggle("Fast Attack", true, function(Param)
    _G.FastAttack = Param
end)
local Character = game.Players.LocalPlayer.Character
local HumanoidRootPart = Character.HumanoidRootPart
local Players = game.Players
local Player2 = Players.LocalPlayer
local Service = game:GetService("CollectionService")
repeat
    Player2 = Players.LocalPlayer
    wait()
until Player2
require(game.ReplicatedStorage.Util.CameraShaker):Stop()
if false then
    local Flag = false
end
local Value5 = {}
local Number = 0
local Number2 = 0
local Value6 = {}
local Number3 = 0
local Value7 = {}
local Number4 = 0
local Result2 = tick()
local Result3 = require(Player2.PlayerScripts.CombatFramework.Particle)
local Result4 = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib)
local Result5 = require(Player2.PlayerScripts.CombatFramework.Particle.Damage)
local Result6 = getupvalue(require(Player2.PlayerScripts.CombatFramework.RigController), 2)
local Result7 = getupvalue(require(Player2.PlayerScripts.CombatFramework), 2)
local Service2 = game:GetService("UserInputService")
local Service3 = game:GetService("RunService")
local Service4 = game:GetService("VirtualInputManager")
local Service5 = game:GetService("CollectionService")
local Service6 = game:GetService("CoreGui")
local function Function6(Param, Param2, Param3)
    if not Param2 then
        Param2 = HumanoidRootPart.Position
    end
    local New = Vector3.new
    local X = Param.X
    local Value8 = nil
    if not Param3 then
        Value8 = Param.Y
    else
        Value8 = false
    end
    New = New(X, Value8, Param.Z)
    X = Vector3.new
    Value8 = Param2.X
    local Value9 = nil
    if not Param3 then
        Value9 = Param2.Y
    else
        Value9 = false
    end
    return (New - X(Value8, Value9, Param2.Z)).magnitude
end
task.spawn(function()
    local Number5 = 0
    local Number6 = 0
    while task.wait(0.075) do
        pcall(function()
            local Flag = false
            table.clear(Value5)
            table.clear(Value6)
            local Tagged = Service5:GetTagged("ActiveRig")
            for I = 1, #Tagged, 1 do
                local Value8 = Tagged[I]
                local I = Value8:FindFirstChildOfClass("Humanoid")
                if I and 0 < I.Health and I.RootPart and Value8 ~= Character then
                    local Character2 = game.Players:GetPlayerFromCharacter(Value8)
                    if not (Character2 and Service5:HasTag(Character2, "Ally" .. Player2.Name)) then
                        Value5[#Value5 + 1] = Value8
                        if not Flag and Function6(I.RootPart.Position) < 65 then
                            Flag = true
                        end
                    end
                end
            end
            if Flag then
                local Children = workspace.Enemies:GetChildren()
                local Players2 = Players:GetPlayers()
                for I = 1, #Children, 1 do
                    local Instance = Children[I]:FindFirstChildOfClass("Humanoid")
                    if Instance and Instance.RootPart and 0 < Instance.Health and Function6(Instance.RootPart.Position) < 65 then
                        Value6[#Value6 + 1] = Instance.RootPart
                    end
                end
                for I = 1, #Players2, 1 do
                    local Character2 = Players2[I].Character
                    if not Players2[I]:GetAttribute("PvpDisabled") and Character2 and Character2 ~= Player2.Character then
                        local Instance = Character2:FindFirstChildOfClass("Humanoid")
                        if Instance and Instance.RootPart and 0 < Instance.Health and Function6(Instance.RootPart.Position) < 65 then
                            Value6[#Value6 + 1] = Instance.RootPart
                        end
                    end
                end
            end
        end)
    end
end)
task.spawn(function()
    local R590 = Result7
    local function Function7()
        -- empty block
    end
    local RigControllerEvent = game:GetService("ReplicatedStorage").RigControllerEvent
    local Inst5 = Instance.new("Animation")
    local Number5 = 0
    local Number6 = 0
    local Value8 = nil
    local Number7 = 0
    local Number8 = 350
    Number91 = 0.0000007
    Value21 = 0
    local function Function8()
        local Name = Value8.currentWeaponModel.Name
        local Value9 = {
            combat = 0.07
        }
        local Result8 = tick()
        local Fucker = Number91
        if Fucker then
            Fucker = Value9[Name:lower()] or Number91 or 0.285
        else
            -- empty block
        end
        Number6 = Result8 + Fucker + Value21 / Number8 * 0.3
        RigControllerEvent.FireServer(RigControllerEvent, "weaponChange", Name)
        Value21 = Value21 - 1
        task.delay((Number91 or 0.285) + (Value21 + 0.5 / Number8) * 0.3, function()
            Value21 = Value21 + 1
        end)
    end
    if not shared.orl then
        shared.orl = Result4.wrapAttackAnimationAsync
    end
    if not shared.cpc then
        shared.cpc = Result3.play
    end
    if not shared.dnew then
        shared.dnew = Result5.new
    end
    if not shared.attack then
        shared.attack = Result6.attack
    end
    Result4.wrapAttackAnimationAsync = function(Tween, Param, Param2, Param3, Param4)
        if _G.FastAttack then
            Result3.play = shared.cpc
            return shared.orl(Tween, Param, Param2, 65, Param4)
        end
        if not _G.FastAttack then
            local Number9 = 65
        end
        if _G.FastAttack and Value6 and 0 < #Value6 then
            Result3.play = function()
                -- empty block
            end
            Tween:Play(0.00075, 0.01, 0.01)
            Param4(Value6)
            wait(Tween.length * 0.5)
            Tween:Stop()
        end
    end
    while task.wait() do
        pcall(function()
            if #Value6 > 0 then
                Value8 = R590.activeController
                if NormalClick then
                    pcall(task.spawn, Value8.attack, Value8)
                end
                if Value8 and Value8.equipped and (not Character.Busy.Value or not Player2.PlayerGui.Main.Dialogue.Visible) and Character.Stun.Value == 0 and Value8.currentWeaponModel and _G.FastAttack then
                    if _G.FastAttack and Number6 < tick() then
                        Function8()
                    end
                    if tick() - Number7 > 0.5 then
                        Value8.timeToNextAttack = 0
                        Value8.increment = 1
                        Value8.hitboxMagnitude = 65
                        pcall(task.spawn, Value8.attack, Value8)
                        Number7 = tick()
                    end
                    local Value9 = Value8.anims.basic[3]
                    local Value10 = Value8.anims.basic[2]
                    Inst5.AnimationId = Value9 or Value10
                    Value8.humanoid:LoadAnimation(Inst5):Play(0.00075, 0.01, 0.01)
                    local FireServer = RigControllerEvent.FireServer
                    local R2460 = RigControllerEvent
                    local String = "hit"
                    local R500 = Value6
                    local Value11 = nil
                    if Value9 then
                        Value11 = 1
                        if not Value11 then
                            Value11 = 2
                        end
                    else
                        -- empty block
                    end
                    FireServer(R2460, String, R500, Value11, "")
                    pcall(Value8.attack)
                    delay(0.5, function()
                        -- empty block
                    end)
                end
            end
        end)
    end
end)
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.FastAttack == true then
            game.Players.LocalPlayer.Character.Stun.Value = 0
            game.Players.LocalPlayer.Character.Busy.Value = false
        end
    end)
end)
Tab3:Toggle("Bring Mob", true, function(Param)
    _G.BringMonster = Param
end)
spawn(function()
    while task.wait() do
        pcall(function()
            if _G.BringMonster then
                Function2()
                for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if _G.AutoFarm and Flag13 and I2.Name == String250 and (String250 == "Factory Staff" or String250 == "Monkey" or String250 == "Dragon Crew Warrior" or String250 == "Dragon Crew Archer") and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health and (I2.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 220 then
                        I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                        I2.HumanoidRootPart.CFrame = CFrame18
                        I2.Humanoid:ChangeState(14)
                        I2.HumanoidRootPart.CanCollide = false
                        I2.Head.CanCollide = false
                        if I2.Humanoid:FindFirstChild("Animator") then
                            I2.Humanoid.Animator:Destroy()
                        end
                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                    elseif _G.AutoFarm and Flag13 and I2.Name == String250 and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health and (I2.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= _G.BringMode then
                        I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                        I2.HumanoidRootPart.CFrame = CFrame18
                        I2.Humanoid:ChangeState(14)
                        I2.HumanoidRootPart.CanCollide = false
                        I2.Head.CanCollide = false
                        if I2.Humanoid:FindFirstChild("Animator") then
                            I2.Humanoid.Animator:Destroy()
                        end
                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                    end
                end
            end
        end)
    end
end)
spawn(function()
    while task.wait() do
        pcall(function()
            if _G.BringMonster then
                Function2()
                for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if _G.AutoFarm and Flag13 and I2.Name == String250 and (String250 == "Factory Staff" or String250 == "Monkey" or String250 == "Dragon Crew Warrior" or String250 == "Dragon Crew Archer") and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health and (I2.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 250 then
                        I2.HumanoidRootPart.Size = Vector3.new(150, 150, 150)
                        I2.HumanoidRootPart.CFrame = CFrame18
                        I2.Humanoid:ChangeState(14)
                        I2.HumanoidRootPart.CanCollide = false
                        I2.Head.CanCollide = false
                        if I2.Humanoid:FindFirstChild("Animator") then
                            I2.Humanoid.Animator:Destroy()
                        end
                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                    elseif _G.AutoFarm and Flag13 and I2.Name == String250 and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health and (I2.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= _G.BringMode then
                        I2.HumanoidRootPart.Size = Vector3.new(150, 150, 150)
                        I2.HumanoidRootPart.CFrame = CFrame18
                        I2.Humanoid:ChangeState(14)
                        I2.HumanoidRootPart.CanCollide = false
                        I2.Head.CanCollide = false
                        if I2.Humanoid:FindFirstChild("Animator") then
                            I2.Humanoid.Animator:Destroy()
                        end
                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                    end
                    if _G.AutoEctoplasm and Flag126 and string.find(I2.Name, "Ship") and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health and (I2.HumanoidRootPart.Position - CFrame46.Position).Magnitude <= _G.BringMode then
                        I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                        I2.HumanoidRootPart.CFrame = CFrame46
                        I2.Humanoid:ChangeState(14)
                        I2.HumanoidRootPart.CanCollide = false
                        I2.Head.CanCollide = false
                        if I2.Humanoid:FindFirstChild("Animator") then
                            I2.Humanoid.Animator:Destroy()
                        end
                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                    end
                    if _G.AutoRengoku and Flag129 and (I2.Name == "Snow Lurker" or I2.Name == "Arctic Warrior") and (I2.HumanoidRootPart.Position - CFrame48.Position).Magnitude <= _G.BringMode and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                        I2.HumanoidRootPart.Size = Vector3.new(1500, 1500, 1500)
                        I2.Humanoid:ChangeState(14)
                        I2.HumanoidRootPart.CanCollide = false
                        I2.Head.CanCollide = false
                        I2.HumanoidRootPart.CFrame = CFrame48
                        if I2.Humanoid:FindFirstChild("Animator") then
                            I2.Humanoid.Animator:Destroy()
                        end
                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                    end
                    if _G.AutoMusketeerHat and Flag87 and I2.Name == "Forest Pirate" and (I2.HumanoidRootPart.Position - CFrame20.Position).Magnitude <= _G.BringMode and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                        I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                        I2.Humanoid:ChangeState(14)
                        I2.HumanoidRootPart.CanCollide = false
                        I2.Head.CanCollide = false
                        I2.HumanoidRootPart.CFrame = CFrame20
                        if I2.Humanoid:FindFirstChild("Animator") then
                            I2.Humanoid.Animator:Destroy()
                        end
                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                    end
                    if _G.AutoObservationHakiV2 and Mangnetcitzenmon and I2.Name == "Forest Pirate" and (I2.HumanoidRootPart.Position - CFrame20.Position).Magnitude <= _G.BringMode and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                        I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                        I2.Humanoid:ChangeState(14)
                        I2.HumanoidRootPart.CanCollide = false
                        I2.Head.CanCollide = false
                        I2.HumanoidRootPart.CFrame = PosHee
                        if I2.Humanoid:FindFirstChild("Animator") then
                            I2.Humanoid.Animator:Destroy()
                        end
                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                    end
                    if _G.Auto_EvoRace and Flag90 and I2.Name == "Zombie" and (I2.HumanoidRootPart.Position - CFrame27.Position).Magnitude <= _G.BringMode and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                        I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                        I2.Humanoid:ChangeState(14)
                        I2.HumanoidRootPart.CanCollide = false
                        I2.Head.CanCollide = false
                        I2.HumanoidRootPart.CFrame = CFrame27
                        if I2.Humanoid:FindFirstChild("Animator") then
                            I2.Humanoid.Animator:Destroy()
                        end
                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                    end
                    if _G.AutoBartilo and Flag92 and I2.Name == "Swan Pirate" and (I2.HumanoidRootPart.Position - CFrame28.Position).Magnitude <= _G.BringMode and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                        I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                        I2.Humanoid:ChangeState(14)
                        I2.HumanoidRootPart.CanCollide = false
                        I2.Head.CanCollide = false
                        I2.HumanoidRootPart.CFrame = CFrame28
                        if I2.Humanoid:FindFirstChild("Animator") then
                            I2.Humanoid.Animator:Destroy()
                        end
                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                    end
                    if _G.AutoFarmFruitMastery and Flag65 then
                        if I2.Name == "Factory Staff" and (I2.HumanoidRootPart.Position - CFrame17.Position).Magnitude <= _G.BringMode and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                            I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                            I2.Humanoid:ChangeState(14)
                            I2.HumanoidRootPart.CanCollide = false
                            I2.Head.CanCollide = false
                            I2.HumanoidRootPart.CFrame = CFrame17
                            if I2.Humanoid:FindFirstChild("Animator") then
                                I2.Humanoid.Animator:Destroy()
                            end
                            sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                        elseif I2.Name == String250 and (I2.HumanoidRootPart.Position - CFrame17.Position).Magnitude <= _G.BringMode and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                            I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                            I2.Humanoid:ChangeState(14)
                            I2.HumanoidRootPart.CanCollide = false
                            I2.Head.CanCollide = false
                            I2.HumanoidRootPart.CFrame = CFrame17
                            if I2.Humanoid:FindFirstChild("Animator") then
                                I2.Humanoid.Animator:Destroy()
                            end
                            sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                        end
                    end
                    if _G.AutoFarmGunMastery and Flag71 then
                        if I2.Name == "Factory Staff" and (I2.HumanoidRootPart.Position - R5101.Position).Magnitude <= _G.BringMode and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                            I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                            I2.Humanoid:ChangeState(14)
                            I2.HumanoidRootPart.CanCollide = false
                            I2.Head.CanCollide = false
                            I2.HumanoidRootPart.CFrame = R5101
                            if I2.Humanoid:FindFirstChild("Animator") then
                                I2.Humanoid.Animator:Destroy()
                            end
                            sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                        elseif I2.Name == String250 and (I2.HumanoidRootPart.Position - R5101.Position).Magnitude <= _G.BringMode and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                            I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                            I2.Humanoid:ChangeState(14)
                            I2.HumanoidRootPart.CanCollide = false
                            I2.Head.CanCollide = false
                            I2.HumanoidRootPart.CFrame = R5101
                            if I2.Humanoid:FindFirstChild("Animator") then
                                I2.Humanoid.Animator:Destroy()
                            end
                            sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                        end
                    end
                    if _G.Auto_Bone and Flag53 and (I2.Name == "Reborn Skeleton" or I2.Name == "Living Zombie" or I2.Name == "Demonic Soul" or I2.Name == "Posessed Mummy") and (I2.HumanoidRootPart.Position - CFrame15.Position).Magnitude <= _G.BringMode and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                        I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                        I2.Humanoid:ChangeState(14)
                        I2.HumanoidRootPart.CanCollide = false
                        I2.Head.CanCollide = false
                        I2.HumanoidRootPart.CFrame = CFrame15
                        if I2.Humanoid:FindFirstChild("Animator") then
                            I2.Humanoid.Animator:Destroy()
                        end
                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                    end
                    if _G.AutoFarmCandy and StartCandyMagnet and (I2.Name == "Ice Cream Chef" or I2.Name == "Ice Cream Commander") and (I2.HumanoidRootPart.Position - CandyMon.Position).Magnitude <= _G.BringMode and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                        I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                        I2.Humanoid:ChangeState(14)
                        I2.HumanoidRootPart.CanCollide = false
                        I2.Head.CanCollide = false
                        I2.HumanoidRootPart.CFrame = CandyMon
                        if I2.Humanoid:FindFirstChild("Animator") then
                            I2.Humanoid.Animator:Destroy()
                        end
                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                    end
                    if R0619 and Flag136 and (I2.Name == "Cocoa Warrior" or I2.Name == "Chocolate Bar Battler" or I2.Name == "Sweet Thief" or I2.Name == "Candy Rebel") and (I2.HumanoidRootPart.Position - CFrame51.Position).Magnitude <= 250 and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                        I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                        I2.Humanoid:ChangeState(14)
                        I2.HumanoidRootPart.CanCollide = false
                        I2.Head.CanCollide = false
                        I2.HumanoidRootPart.CFrame = CFrame51
                        if I2.Humanoid:FindFirstChild("Animator") then
                            I2.Humanoid.Animator:Destroy()
                        end
                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                    end
                    if _G.Farmfast and Flag15 and (I2.Name == "Shanda" or I2.Name == "Shanda") and (I2.HumanoidRootPart.Position - CFrame3.Position).Magnitude <= _G.BringMode and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                        I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                        I2.Humanoid:ChangeState(14)
                        I2.HumanoidRootPart.CanCollide = false
                        I2.Head.CanCollide = false
                        I2.HumanoidRootPart.CFrame = CFrame3
                        if I2.Humanoid:FindFirstChild("Animator") then
                            I2.Humanoid.Animator:Destroy()
                        end
                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                    end
                    if _G.AutoDoughtBoss and Flag35 and (I2.Name == "Cookie Crafter" or I2.Name == "Cake Guard" or I2.Name == "Baking Staff" or I2.Name == "Head Baker") and (I2.HumanoidRootPart.Position - CFrame11.Position).Magnitude <= _G.BringMode and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                        I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                        I2.Humanoid:ChangeState(14)
                        I2.HumanoidRootPart.CanCollide = false
                        I2.Head.CanCollide = false
                        I2.HumanoidRootPart.CFrame = CFrame11
                        if I2.Humanoid:FindFirstChild("Animator") then
                            I2.Humanoid.Animator:Destroy()
                        end
                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                    end
                end
            end
        end)
    end
end)
task.spawn(function()
    while true do
        wait()
        if setscriptable then
            setscriptable(game.Players.LocalPlayer, "SimulationRadius", true)
        end
        local Sethiddenproperty = sethiddenproperty
        if Sethiddenproperty then
            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
        end
    end
end)
task.spawn(function()
    while task.wait() do
        pcall(function()
            if Flag124 and _G.BringMonster then
                for I, I2 in pairs(game.Workspace.Enemies:GetChildren()) do
                    if not string.find(I2.Name, "Boss") and (I2.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= _G.BringMode and Function43(I2.HumanoidRootPart) then
                        I2.HumanoidRootPart.CFrame = CFrame45
                        I2.Humanoid.JumpPower = 0
                        I2.Humanoid.WalkSpeed = 0
                        I2.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        I2.HumanoidRootPart.Transparency = 1
                        I2.HumanoidRootPart.CanCollide = false
                        I2.Head.CanCollide = false
                        if I2.Humanoid:FindFirstChild("Animator") then
                            I2.Humanoid.Animator:Destroy()
                        end
                        I2.Humanoid:ChangeState(11)
                        I2.Humanoid:ChangeState(14)
                    end
                end
            end
        end)
    end
end)
task.spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoSwordMastery and Flag77 and _G.BringMonster then
                for I, I2 in pairs(game.Workspace.Enemies:GetChildren()) do
                    if not string.find(I2.Name, "Boss") and (I2.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= _G.BringMode and Function43(I2.HumanoidRootPart) then
                        I2.HumanoidRootPart.CFrame = CFrame18
                        I2.Humanoid.JumpPower = 0
                        I2.Humanoid.WalkSpeed = 0
                        I2.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        I2.HumanoidRootPart.Transparency = 1
                        I2.HumanoidRootPart.CanCollide = false
                        I2.Head.CanCollide = false
                        if I2.Humanoid:FindFirstChild("Animator") then
                            I2.Humanoid.Animator:Destroy()
                        end
                        I2.Humanoid:ChangeState(11)
                        I2.Humanoid:ChangeState(14)
                    end
                end
            end
        end)
    end
end)
task.spawn(function()
    while task.wait() do
        pcall(function()
            if Flag144 and _G.BringMonster then
                for I, I2 in pairs(game.Workspace.Enemies:GetChildren()) do
                    if not string.find(I2.Name, "Boss") and (I2.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= _G.BringMode and Function43(I2.HumanoidRootPart) then
                        I2.HumanoidRootPart.CFrame = CFrame55
                        I2.Humanoid.JumpPower = 0
                        I2.Humanoid.WalkSpeed = 0
                        I2.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        I2.HumanoidRootPart.Transparency = 1
                        I2.HumanoidRootPart.CanCollide = false
                        I2.Head.CanCollide = false
                        if I2.Humanoid:FindFirstChild("Animator") then
                            I2.Humanoid.Animator:Destroy()
                        end
                        I2.Humanoid:ChangeState(11)
                        I2.Humanoid:ChangeState(14)
                    end
                end
            end
        end)
    end
end)
task.spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoFarmNearest and Flag18 or Flag79 and _G.BringMonster then
                for I, I2 in pairs(game.Workspace.Enemies:GetChildren()) do
                    if not string.find(I2.Name, "Boss") and (I2.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= _G.BringMode and Function43(I2.HumanoidRootPart) then
                        I2.HumanoidRootPart.CFrame = CFrame18
                        I2.Humanoid.JumpPower = 0
                        I2.Humanoid.WalkSpeed = 0
                        I2.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        I2.HumanoidRootPart.Transparency = 1
                        I2.HumanoidRootPart.CanCollide = false
                        I2.Head.CanCollide = false
                        if I2.Humanoid:FindFirstChild("Animator") then
                            I2.Humanoid.Animator:Destroy()
                        end
                        I2.Humanoid:ChangeState(11)
                        I2.Humanoid:ChangeState(14)
                    end
                end
            end
        end)
    end
end)
_G.BringMode = 250
Tab3:Slider("Farm Magnitude", 0, 50, 35, function(Param)
    Number94 = Param
end)
Number93 = 1
Number94 = 35
Number95 = 40
Tab4:Toggle("Auto Second Sea", false, function(Param)
    _G.AutoSecondSea = Param
    Function38(_G.AutoSecondSea)
end)
spawn(function()
    while wait() do
        local AutoSecondSea = _G.AutoSecondSea
        if AutoSecondSea then
            pcall(function()
                if 700 <= game:GetService("Players").LocalPlayer.Data.Level.Value and Flag then
                    local Inst5 = CFrame.new(4849.298829999999725, 5.65138149, 719.61187700000005)
                    while true do
                        Function35(Inst5)
                        wait()
                        if (Inst5.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3 then
                            local AutoSecondSea2 = _G.AutoSecondSea
                            if AutoSecondSea2 == false then
                                break
                            end
                        else
                            break
                        end
                    end
                    wait(1.1)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Detective")
                    wait(0.5)
                    Function32("Key")
                    while true do
                        Function35(CFrame.new(1347.712399999999889, 37.375160200000003, -1325.648799999999937))
                        wait()
                        if (Vector3.new(1347.712399999999889, 37.375160200000003, -1325.648799999999937) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3 then
                            local AutoSecondSea2 = _G.AutoSecondSea
                            if AutoSecondSea2 == false then
                                break
                            end
                        else
                            break
                        end
                    end
                    wait(0.5)
                elseif game:GetService("Workspace").Map.Ice.Door.CanCollide == false and game:GetService("Workspace").Map.Ice.Door.Transparency == 1 then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Ice Admiral") then
                        for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if I2.Name == "Ice Admiral" then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
                            end
                        end
                    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Ice Admiral") then
                        Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Ice Admiral").HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                    end
                end
            end)
        end
    end
end)
Tab4:Toggle("Auto Third Sea", false, function(Param)
    _G.AutoThirdSea = Param
    Function38(_G.AutoThirdSea)
end)
spawn(function()
    while wait() do
        local AutoThirdSea = _G.AutoThirdSea
        if AutoThirdSea then
            pcall(function()
                if 1500 <= game:GetService("Players").LocalPlayer.Data.Level.Value and Flag2 then
                    _G.AutoFarm = false
                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress", "General") == 0 then
                        Function35(CFrame.new(-1926.322143554700006, 12.819851875305, 1738.309204101600017))
                        if (CFrame.new(-1926.322143554700006, 12.819851875305, 1738.309204101600017).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                            wait(1.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress", "Begin")
                        end
                        wait(1.8)
                        if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") then
                            for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if I2.Name == "rip_indra" then
                                    CFrame19 = I2.HumanoidRootPart.CFrame
                                    while true do
                                        task.wait()
                                        Function30()
                                        Function32(_G.SelectWeapon)
                                        Function35(I2.HumanoidRootPart.CFrame * R03664)
                                        I2.HumanoidRootPart.CFrame = CFrame19
                                        I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                        I2.HumanoidRootPart.CanCollide = false
                                        I2.Humanoid.WalkSpeed = 0
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
                                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                        if _G.AutoThirdSea ~= false then
                                            local Health = I2.Humanoid.Health
                                            if Health > 0 then
                                                Health = I2.Parent
                                                if not Health then
                                                    break
                                                end
                                            else
                                                break
                                            end
                                        else
                                            break
                                        end
                                    end
                                end
                            end
                        elseif not game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") and (CFrame.new(-26880.93359375, 22.848554611206001, 473.189514160160002).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1000 then
                            Function35(CFrame.new(-26880.93359375, 22.848554611206001, 473.189514160160002))
                        end
                    end
                end
            end)
        end
    end
end)
Tab4:Toggle("Auto Factory", false, function(Param)
    _G.AutoFactory = Param
    Function38(_G.AutoFactory)
end)
spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoFactory then
                if game:GetService("Workspace").Enemies:FindFirstChild("Core") then
                    for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if I2.Name == "Core" and 0 < I2.Humanoid.Health then
                            while true do
                                task.wait()
                                Function30()
                                Function32(_G.SelectWeapon)
                                Function35(CFrame.new(448.467559999999992, 199.356781000000012, -441.389251999999999))
                                game:GetService("VirtualUser"):CaptureController()
                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                if I2.Humanoid.Health > 0 then
                                    local AutoFactory = _G.AutoFactory
                                    if AutoFactory == false then
                                        break
                                    end
                                else
                                    break
                                end
                            end
                        end
                    end
                else
                    Function35(CFrame.new(448.467559999999992, 199.356781000000012, -441.389251999999999))
                end
            end
        end)
    end
end)
Tab4:Toggle("Auto Pirate Raid", false, function(Param)
    _G.RaidPirate = Param
    Function38(_G.RaidPirate)
end)
spawn(function()
    while wait() do
        local RaidPirate = _G.RaidPirate
        if RaidPirate then
            pcall(function()
                local Inst5 = CFrame.new(-5496.17432000000008, 313.768920999999978, -2841.530270000000201, 0.924894512, 0.00000000737058, 0.380223751, 0.000000035881019, 1, -0.000000106665446, -0.380223751, 0.000000112297109, 0.924894512)
                if (CFrame.new(-5539.3115234375, 313.800537109375, -2972.372314453125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500 then
                    for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if _G.RaidPirate and I2:FindFirstChild("HumanoidRootPart") and I2:FindFirstChild("Humanoid") and 0 < I2.Humanoid.Health and (I2.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2000 then
                            while true do
                                wait()
                                Function30()
                                Function32(_G.SelectWeapon)
                                I2.HumanoidRootPart.CanCollide = false
                                I2.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                Function35(I2.HumanoidRootPart.CFrame * R03664)
                                Function29()
                                if I2.Humanoid.Health > 0 then
                                    local Parent = I2.Parent
                                    if Parent then
                                        Parent = _G.RaidPirate
                                        if not Parent then
                                            break
                                        end
                                    else
                                        break
                                    end
                                else
                                    break
                                end
                            end
                        end
                    end
                else
                    Function31(_G.SelectWeapon)
                    if R0216 then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst5.Position).Magnitude > 1500 then
                            Function33(Inst5)
                        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst5.Position).Magnitude < 1500 then
                            Function35(Inst5)
                        end
                    end
                end
            end)
        end
    end
end)
Tab4:Toggle("Auto Soul Guitar", false, function(Param)
    _G.AutoNevaSoulGuitar = Param
    Function38(_G.AutoNevaSoulGuitar)
end)
spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoNevaSoulGuitar then
                if GetWeaponInventory("Soul Guitar") == false then
                    if (CFrame.new(-9681.458984375, 6.139880657196045, 6341.3720703125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5000 then
                        if game:GetService("Workspace").NPCs:FindFirstChild("Skeleton Machine") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("soulGuitarBuy", true)
                        elseif game:GetService("Workspace").Map["Haunted Castle"].Candle1.Transparency == 0 then
                            if game:GetService("Workspace").Map["Haunted Castle"].Placard1.Left.Part.Transparency == 0 then
                                Flag80 = true
                                while true do
                                    wait()
                                    Function35(CFrame.new(-8762.69140625, 176.84783935546875, 6171.3076171875))
                                    if (CFrame.new(-8762.69140625, 176.84783935546875, 6171.3076171875).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3 then
                                        local AutoNevaSoulGuitar = _G.AutoNevaSoulGuitar
                                        if not AutoNevaSoulGuitar then
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                                wait(1)
                                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard7.Left.ClickDetector)
                                wait(1)
                                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard6.Left.ClickDetector)
                                wait(1)
                                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard5.Left.ClickDetector)
                                wait(1)
                                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard4.Right.ClickDetector)
                                wait(1)
                                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard3.Left.ClickDetector)
                                wait(1)
                                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard2.Right.ClickDetector)
                                wait(1)
                                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard1.Right.ClickDetector)
                                wait(1)
                            elseif game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment1:FindFirstChild("ClickDetector") then
                                if game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part1:FindFirstChild("ClickDetector") then
                                    Flag81 = true
                                    while true do
                                        wait()
                                        Function35(CFrame.new(-9553.5986328125, 65.623382568359375, 6041.58837890625))
                                        if (CFrame.new(-9553.5986328125, 65.623382568359375, 6041.58837890625).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3 then
                                            local AutoNevaSoulGuitar = _G.AutoNevaSoulGuitar
                                            if not AutoNevaSoulGuitar then
                                                break
                                            end
                                        else
                                            break
                                        end
                                    end
                                    wait(1)
                                    Function35(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.CFrame)
                                    wait(1)
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.ClickDetector)
                                    wait(1)
                                    Function35(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.CFrame)
                                    wait(1)
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                                    wait(1)
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                                    wait(1)
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                                    wait(1)
                                    Function35(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.CFrame)
                                    wait(1)
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)
                                    wait(1)
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)
                                    wait(1)
                                    Function35(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.CFrame)
                                    wait(1)
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.ClickDetector)
                                    wait(1)
                                    Function35(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.CFrame)
                                    wait(1)
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
                                    wait(1)
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
                                    wait(1)
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
                                else
                                    Flag82 = true
                                end
                            else
                                if game:GetService("Workspace").NPCs:FindFirstChild("Ghost") then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                        [1] = "GuitarPuzzleProgress",
                                        [2] = "Ghost"
                                    }))
                                end
                                if game.Workspace.Enemies:FindFirstChild("Living Zombie") then
                                    for I, I2 in pairs(game.Workspace.Enemies:GetChildren()) do
                                        if I2:FindFirstChild("HumanoidRootPart") and I2:FindFirstChild("Humanoid") and 0 < I2.Humanoid.Health and I2.Name == "Living Zombie" then
                                            Function32(_G.SelectWeapon)
                                            I2.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                            I2.HumanoidRootPart.Transparency = 1
                                            I2.Humanoid.JumpPower = 0
                                            I2.Humanoid.WalkSpeed = 0
                                            I2.HumanoidRootPart.CanCollide = false
                                            I2.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0)
                                            Function35(CFrame.new(-10160.787109375, 138.661697387695312, 5955.03076171875))
                                            game:GetService("VirtualUser"):CaptureController()
                                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                        end
                                    end
                                else
                                    Function35(CFrame.new(-10160.787109375, 138.661697387695312, 5955.03076171875))
                                end
                            end
                        elseif string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent", 2), "Error") then
                            print("Go to Grave")
                            Function35(CFrame.new(-8653.2060546875, 140.984878540039062, 6160.033203125))
                        elseif string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent", 2), "Nothing") then
                            print("Wait Next Night")
                        else
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent", 2, true)
                        end
                    else
                        Function35(CFrame.new(-9681.458984375, 6.139880657196045, 6341.3720703125))
                    end
                elseif _G.soulGuitarhop then
                    hop()
                end
            end
        end)
    end
end)
Tab4:Toggle("Auto Kill Arena Trainer", false, function(Param)
    _G.Namfon = Param
    Function38(_G.Namfon)
end)
local Inst5 = CFrame.new(3757.732421875, 91.995407104492188, 253.650665283203125)
spawn(function()
    while wait() do
        local Namfon = _G.Namfon
        if Namfon then
            Namfon = Flag3
            if Namfon then
                pcall(function()
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Training Dummy") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Training Dummy") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Training Dummy") then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Training Dummy") or game:GetService("Workspace").Enemies:FindFirstChild("Training Dummy") or game:GetService("Workspace").Enemies:FindFirstChild("Training Dummy") then
                                for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if (I2.Name == "Training Dummy" or I2.Name == "Training Dummy" or I2.Name == "Training Dummy") and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                                        while true do
                                            wait()
                                            Function30()
                                            Function32(_G.SelectWeapon)
                                            Flag84 = true
                                            I2.HumanoidRootPart.CanCollide = false
                                            I2.Humanoid.WalkSpeed = 0
                                            I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                            Function35(I2.HumanoidRootPart.CFrame * R03664)
                                            game:GetService("VirtualUser"):CaptureController()
                                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                            if _G.Namfon ~= false then
                                                local Health = I2.Humanoid.Health
                                                if Health > 0 then
                                                    Health = I2.Parent
                                                    if not Health then
                                                        break
                                                    end
                                                else
                                                    break
                                                end
                                            else
                                                break
                                            end
                                        end
                                        Flag84 = false
                                    end
                                end
                            else
                                if R0216 then
                                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst5.Position).Magnitude > 1500 then
                                        Function33(Inst5)
                                    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst5.Position).Magnitude < 1500 then
                                        Function35(Inst5)
                                    end
                                else
                                    Function35(Inst5)
                                end
                                Function35(CFrame.new(3757.732421875, 91.995407104492188, 253.650665283203125))
                                if game:GetService("ReplicatedStorage"):FindFirstChild("Training Dummy") then
                                    Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Training Dummy").HumanoidRootPart.CFrame * MethodFarm)
                                end
                            end
                        end
                    elseif _G.AutoArenaTrainerHop and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ArenaTrainer") == "I don't have anything for you right now. Come back later." then
                        hop()
                    else
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ArenaTrainer")
                    end
                end)
            end
        end
    end
end)
Tab4:Toggle("Auto Kill Rip_Indra", false, function(Param)
    _G.AutoDarkDagger = Param
    Function38(_G.AutoDarkDagger)
end)
local Inst6 = CFrame.new(-5344.822265625, 423.985412597660002, -2725.093017578099989)
spawn(function()
    pcall(function()
        while wait() do
            local AutoDarkDagger = _G.AutoDarkDagger
            if AutoDarkDagger then
                AutoDarkDagger = game:GetService("Workspace").Enemies:FindFirstChild("rip_indra True Form")
                if not AutoDarkDagger then
                    AutoDarkDagger = game:GetService("Workspace").Enemies:FindFirstChild("rip_indra")
                    if AutoDarkDagger then
                        AutoDarkDagger = pairs
                        for I, I2 in AutoDarkDagger(game:GetService("Workspace").Enemies:GetChildren()) do
                            if I2.Name == ("rip_indra True Form" or I2.Name == "rip_indra") and 0 < I2.Humanoid.Health and I2:IsA("Model") and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") then
                                while true do
                                    task.wait()
                                    pcall(function()
                                        Function30()
                                        Function32(_G.SelectWeapon)
                                        I2.HumanoidRootPart.CanCollide = false
                                        I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                        Function35(I2.HumanoidRootPart.CFrame * R03664)
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 670), workspace.CurrentCamera.CFrame)
                                    end)
                                    if _G.AutoDarkDagger ~= false then
                                        local Health = I2.Humanoid.Health
                                        if Health <= 0 then
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                            end
                        end
                    end
                else
                    -- empty block
                end
                AutoDarkDagger = R0216
                if AutoDarkDagger then
                    AutoDarkDagger = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst6.Position).Magnitude
                    if AutoDarkDagger > 1500 then
                        Function33(Inst6)
                    else
                        AutoDarkDagger = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst6.Position).Magnitude
                        if AutoDarkDagger < 1500 then
                            Function35(Inst6)
                        end
                    end
                else
                    Function35(Inst6)
                end
                Function31(_G.SelectWeapon)
                Function35(CFrame.new(-5344.822265625, 423.985412597660002, -2725.093017578099989))
            end
        end
    end)
end)
spawn(function()
    pcall(function()
        while wait() do
            local AutoDarkDaggerHop = _G.AutoDarkDagger_Hop
            if AutoDarkDaggerHop then
                AutoDarkDaggerHop = _G.AutoDarkDagger
                if AutoDarkDaggerHop then
                    AutoDarkDaggerHop = Flag3
                    if AutoDarkDaggerHop then
                        AutoDarkDaggerHop = game:GetService("ReplicatedStorage")
                        AutoDarkDaggerHop = AutoDarkDaggerHop:FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]")
                        if not AutoDarkDaggerHop then
                            AutoDarkDaggerHop = game:GetService("Workspace").Enemies:FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]")
                            if not AutoDarkDaggerHop then
                                Function3()
                            end
                        end
                    end
                end
            end
        end
    end)
end)
Tab4:Toggle("Auto Press Haki Button", false, function(Param)
    R0505 = Param
    Function38(R0505)
end)
spawn(function()
    while wait(0.3) do
        pcall(function()
            if R0505 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor", "Winter Sky")
                wait(0.5)
                while true do
                    Function35(CFrame.new(-5420.166019999999662, 1084.96569999999997, -2666.820799999999963))
                    wait()
                    if _G.Function38 ~= true then
                        local OpenColorHaki = R0505
                        if OpenColorHaki ~= false then
                            OpenColorHaki = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-5420.166019999999662, 1084.96569999999997, -2666.820799999999963)).Magnitude
                            if OpenColorHaki <= 10 then
                                break
                            end
                        else
                            break
                        end
                    else
                        break
                    end
                end
                wait(0.5)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor", "Pure Red")
                wait(0.5)
                while true do
                    Function35(CFrame.new(-5414.413569999999709, 309.865752999999984, -2212.45775999999978))
                    wait()
                    if _G.Function38 ~= true then
                        local OpenColorHaki = R0505
                        if OpenColorHaki ~= false then
                            OpenColorHaki = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-5414.413569999999709, 309.865752999999984, -2212.45775999999978)).Magnitude
                            if OpenColorHaki <= 10 then
                                break
                            end
                        else
                            break
                        end
                    else
                        break
                    end
                end
                wait(0.5)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor", "Snow White")
                wait(0.5)
                while true do
                    Function35(CFrame.new(-4971.475590000000011, 331.565764999999999, -3720.029539999999997))
                    wait()
                    if _G.Function38 ~= true then
                        local OpenColorHaki = R0505
                        if OpenColorHaki ~= false then
                            OpenColorHaki = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-4971.475590000000011, 331.565764999999999, -3720.029539999999997)).Magnitude
                            if OpenColorHaki <= 10 then
                                break
                            end
                        else
                            break
                        end
                    else
                        break
                    end
                end
                wait(0.5)
                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 600))
                wait(3)
                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 600))
            end
        end)
    end
end)
Tab4:Toggle("Auto Kill White Beard", false, function(Param)
    _G.Autogay = Param
    Function38(_G.Autogay)
end)
local Inst7 = CFrame.new(-5023.38330078125, 28.652032852172852, 4332.3818359375)
spawn(function()
    while wait() do
        local Autogay = _G.Autogay
        if Autogay then
            Autogay = Flag
            if Autogay then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Greybeard") then
                        for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if I2.Name == "Greybeard" and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                                while true do
                                    task.wait()
                                    Function30()
                                    Function32(_G.SelectWeapon)
                                    I2.HumanoidRootPart.CanCollide = false
                                    I2.Humanoid.WalkSpeed = 0
                                    I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    Function35(I2.HumanoidRootPart.CFrame * R03664)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                    if _G.Autogay then
                                        local Parent = I2.Parent
                                        if Parent then
                                            Parent = I2.Humanoid.Health
                                            if Parent <= 0 then
                                                break
                                            end
                                        else
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                            end
                        end
                    else
                        if R0216 then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst7.Position).Magnitude > 1500 then
                                Function33(Inst7)
                            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst7.Position).Magnitude < 1500 then
                                Function35(Inst7)
                            end
                        else
                            Function35(Inst7)
                        end
                        Function31(_G.SelectWeapon)
                        Function35(CFrame.new(-5023.38330078125, 28.652032852172852, 4332.3818359375))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Greybeard") then
                            Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Greybeard").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        elseif _G.Autogayhop then
                            Function3()
                        end
                    end
                end)
            end
        end
    end
end)
Tab4:Toggle("Auto Swan Glasses", false, function(Param)
    _G.AutoFarmSwanGlasses = Param
    Function38(_G.AutoFarmSwanGlasses)
end)
spawn(function()
    pcall(function()
        while wait() do
            local AutoFarmSwanGlasses = _G.AutoFarmSwanGlasses
            if AutoFarmSwanGlasses then
                AutoFarmSwanGlasses = game:GetService("Workspace").Enemies:FindFirstChild("Don Swan")
                local Value8 = nil
                if AutoFarmSwanGlasses then
                    AutoFarmSwanGlasses = pairs
                    for I, Value8 in AutoFarmSwanGlasses(game:GetService("Workspace").Enemies:GetChildren()) do
                        if Value8.Name == "Don Swan" and 0 < Value8.Humanoid.Health and Value8:IsA("Model") and Value8:FindFirstChild("Humanoid") and Value8:FindFirstChild("HumanoidRootPart") then
                            while true do
                                task.wait()
                                pcall(function()
                                    Function30()
                                    Function32(_G.SelectWeapon)
                                    Value8.HumanoidRootPart.CanCollide = false
                                    Value8.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    Function35(Value8.HumanoidRootPart.CFrame * R03664)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 670))
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                end)
                                if _G.AutoFarmSwanGlasses ~= false then
                                    local Health = Value8.Humanoid.Health
                                    if Health <= 0 then
                                        break
                                    end
                                else
                                    break
                                end
                            end
                        end
                    end
                else
                    task.wait()
                    Value8 = 2284.912109375
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(Value8, 15.537666320801, 905.48291015625))
                    AutoFarmSwanGlasses = (CFrame.new(2284.912109375, 15.537666320801, 905.48291015625).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                    if AutoFarmSwanGlasses > 4 then
                        AutoFarmSwanGlasses = _G.AutoFarmSwanGlasses
                        if AutoFarmSwanGlasses ~= false then
                            break
                        end
                    end
                end
            end
        end
    end)
end)
spawn(function()
    pcall(function()
        while wait(0.1) do
            local AutoFarmSwanGlasses = _G.AutoFarmSwanGlasses
            if AutoFarmSwanGlasses then
                AutoFarmSwanGlasses = _G.AutoFarmSwanGlasses_Hop
                if AutoFarmSwanGlasses then
                    AutoFarmSwanGlasses = Flag2
                    if AutoFarmSwanGlasses then
                        AutoFarmSwanGlasses = game:GetService("ReplicatedStorage")
                        AutoFarmSwanGlasses = AutoFarmSwanGlasses:FindFirstChild("Don Swan")
                        if not AutoFarmSwanGlasses then
                            AutoFarmSwanGlasses = game:GetService("Workspace").Enemies:FindFirstChild("Don Swan")
                            if not AutoFarmSwanGlasses then
                                Function3()
                            end
                        end
                    end
                end
            end
        end
    end)
end)
Tab4:Toggle("Auto Musketeer Hat", false, function(Param)
    _G.AutoMusketeerHat = Param
    Function38(_G.AutoMusketeerHat)
end)
spawn(function()
    pcall(function()
        while wait(0.1) do
            local AutoMusketeerHat = _G.AutoMusketeerHat
            if AutoMusketeerHat then
                AutoMusketeerHat = game:GetService("Players").LocalPlayer.Data.Level.Value
                local Value8 = nil
                if AutoMusketeerHat >= 1800 then
                    AutoMusketeerHat = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBandits
                    if AutoMusketeerHat == false then
                        AutoMusketeerHat = string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Forest Pirate")
                        if AutoMusketeerHat then
                            AutoMusketeerHat = string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50")
                            if AutoMusketeerHat then
                                AutoMusketeerHat = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                                if AutoMusketeerHat == true then
                                    AutoMusketeerHat = game:GetService("Workspace").Enemies:FindFirstChild("Forest Pirate")
                                    if AutoMusketeerHat then
                                        AutoMusketeerHat = pairs
                                        for I, Value8 in AutoMusketeerHat(game:GetService("Workspace").Enemies:GetChildren()) do
                                            if Value8.Name == "Forest Pirate" then
                                                while true do
                                                    task.wait()
                                                    pcall(function()
                                                        Function32(_G.SelectWeapon)
                                                        Function30()
                                                        Value8.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                                        Function35(Value8.HumanoidRootPart.CFrame * R03664)
                                                        Value8.HumanoidRootPart.CanCollide = false
                                                        game:GetService("VirtualUser"):CaptureController()
                                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                                        CFrame20 = Value8.HumanoidRootPart.CFrame
                                                        Flag87 = true
                                                    end)
                                                    if _G.AutoMusketeerHat ~= false then
                                                        local Health = Value8.Parent
                                                        if Health then
                                                            Health = Value8.Humanoid.Health
                                                            if Health > 0 then
                                                                Health = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                                                                if Health == false then
                                                                    break
                                                                end
                                                            else
                                                                break
                                                            end
                                                        else
                                                            break
                                                        end
                                                    else
                                                        break
                                                    end
                                                end
                                                Flag87 = false
                                            end
                                        end
                                    else
                                        Flag87 = false
                                        Value8 = -7964.5537109375
                                        Function35(CFrame.new(-13206.452148438000222, 425.891998291020002, Value8))
                                    end
                                end
                            end
                        end
                        Value8 = -7675.4892578125
                        Function35(CFrame.new(-12443.8671875, 332.40396118164, Value8))
                        AutoMusketeerHat = Vector3.new(-12443.8671875, 332.40396118164, -7675.4892578125)
                        AutoMusketeerHat = (AutoMusketeerHat - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                        if AutoMusketeerHat <= 30 then
                            wait(1.5)
                            Value8 = 1
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "CitizenQuest", Value8)
                        end
                    end
                end
                AutoMusketeerHat = game:GetService("Players").LocalPlayer.Data.Level.Value
                if AutoMusketeerHat >= 1800 then
                    AutoMusketeerHat = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBoss
                    if AutoMusketeerHat == false then
                        AutoMusketeerHat = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                        if AutoMusketeerHat then
                            AutoMusketeerHat = string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant")
                            if AutoMusketeerHat then
                                AutoMusketeerHat = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                                if AutoMusketeerHat == true then
                                    AutoMusketeerHat = game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant")
                                    if AutoMusketeerHat then
                                        AutoMusketeerHat = pairs
                                        for I, Value8 in AutoMusketeerHat(game:GetService("Workspace").Enemies:GetChildren()) do
                                            if Value8.Name == "Captain Elephant" then
                                                CFrame21 = Value8.HumanoidRootPart.CFrame
                                                while true do
                                                    task.wait()
                                                    pcall(function()
                                                        Function32(_G.SelectWeapon)
                                                        Function30()
                                                        Value8.HumanoidRootPart.CanCollide = false
                                                        Value8.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                                        Function35(Value8.HumanoidRootPart.CFrame * R03664)
                                                        Value8.HumanoidRootPart.CanCollide = false
                                                        Value8.HumanoidRootPart.CFrame = CFrame21
                                                        game:GetService("VirtualUser"):CaptureController()
                                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                                    end)
                                                    if _G.AutoMusketeerHat ~= false then
                                                        local Health = Value8.Humanoid.Health
                                                        if Health > 0 then
                                                            Health = Value8.Parent
                                                            if Health then
                                                                Health = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                                                                if Health == false then
                                                                    break
                                                                end
                                                            else
                                                                break
                                                            end
                                                        else
                                                            break
                                                        end
                                                    else
                                                        break
                                                    end
                                                end
                                            end
                                        end
                                    else
                                        Value8 = -8225.208984375
                                        Function35(CFrame.new(-13374.889648438000222, 421.277526855470001, Value8))
                                    end
                                end
                            end
                        end
                        Value8 = -7675.4892578125
                        Function35(CFrame.new(-12443.8671875, 332.40396118164, Value8))
                        AutoMusketeerHat = (CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                        if AutoMusketeerHat <= 4 then
                            wait(1.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")
                        end
                    end
                end
                AutoMusketeerHat = game:GetService("Players").LocalPlayer.Data.Level.Value
                if AutoMusketeerHat >= 1800 then
                    AutoMusketeerHat = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")
                    if AutoMusketeerHat == 2 then
                        Value8 = -9872.8203125
                        Function35(CFrame.new(-12512.138671875, 340.392791748050001, Value8))
                    end
                end
            end
        end
    end)
end)
Tab4:Toggle("Auto Rainbow Haki", false, function(Param)
    _G.Auto_Rainbow_Haki = Param
    Function38(_G.Auto_Rainbow_Haki)
end)
spawn(function()
    pcall(function()
        while wait(0.1) do
            local AutoRainbowHaki = _G.Auto_Rainbow_Haki
            if AutoRainbowHaki then
                AutoRainbowHaki = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                if AutoRainbowHaki == false then
                    Function35(CFrame.new(-11892.0703125, 930.576721191410002, -8760.1591796875))
                    AutoRainbowHaki = Vector3.new(-11892.0703125, 930.576721191410002, -8760.1591796875)
                    AutoRainbowHaki = (AutoRainbowHaki - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                    if AutoRainbowHaki <= 30 then
                        wait(1.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan", "Bet")
                    end
                else
                    AutoRainbowHaki = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                    if AutoRainbowHaki == true then
                        AutoRainbowHaki = string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Stone")
                        if AutoRainbowHaki then
                            AutoRainbowHaki = game:GetService("Workspace").Enemies:FindFirstChild("Stone")
                            if AutoRainbowHaki then
                                AutoRainbowHaki = pairs
                                for I, I2 in AutoRainbowHaki(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if I2.Name == "Stone" then
                                        CFrame26 = I2.HumanoidRootPart.CFrame
                                        while true do
                                            task.wait()
                                            Function32(_G.SelectWeapon)
                                            Function35(I2.HumanoidRootPart.CFrame * R03664)
                                            I2.HumanoidRootPart.CanCollide = false
                                            I2.HumanoidRootPart.CFrame = CFrame26
                                            I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                            game:GetService("VirtualUser"):CaptureController()
                                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                            sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                            if _G.Auto_Rainbow_Haki ~= false then
                                                local Health = I2.Humanoid.Health
                                                if Health > 0 then
                                                    Health = I2.Parent
                                                    if Health then
                                                        Health = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                                                        if Health == false then
                                                            break
                                                        end
                                                    else
                                                        break
                                                    end
                                                else
                                                    break
                                                end
                                            else
                                                break
                                            end
                                        end
                                    end
                                end
                            else
                                Function35(CFrame.new(-1086.11620999999991, 38.842590299999998, 6768.714359999999942, 0.0231462717, -0.592676699, 0.805107772, 0.0000203251839, 0.805323839, 0.592835128, -0.999732077, -0.0137055516, 0.0186523199))
                            end
                        end
                    end
                    AutoRainbowHaki = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                    if AutoRainbowHaki == true then
                        AutoRainbowHaki = string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Island Empress")
                        if AutoRainbowHaki then
                            AutoRainbowHaki = game:GetService("Workspace").Enemies:FindFirstChild("Island Empress")
                            if AutoRainbowHaki then
                                AutoRainbowHaki = pairs
                                for I, I2 in AutoRainbowHaki(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if I2.Name == "Island Empress" then
                                        CFrame26 = I2.HumanoidRootPart.CFrame
                                        while true do
                                            task.wait()
                                            Function32(_G.SelectWeapon)
                                            Function35(I2.HumanoidRootPart.CFrame * R03664)
                                            I2.HumanoidRootPart.CanCollide = false
                                            I2.HumanoidRootPart.CFrame = CFrame26
                                            I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                            game:GetService("VirtualUser"):CaptureController()
                                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                            sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                            if _G.Auto_Rainbow_Haki ~= false then
                                                local Health = I2.Humanoid.Health
                                                if Health > 0 then
                                                    Health = I2.Parent
                                                    if Health then
                                                        Health = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                                                        if Health == false then
                                                            break
                                                        end
                                                    else
                                                        break
                                                    end
                                                else
                                                    break
                                                end
                                            else
                                                break
                                            end
                                        end
                                    end
                                end
                            else
                                Function35(CFrame.new(5713.988769999999931, 601.922973999999954, 202.751250999999996, -0.101080291, 0, -0.994878292, 0, 1, 0, 0.994878292, 0, -0.101080291))
                            end
                        end
                    end
                    AutoRainbowHaki = string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Kilo Admiral")
                    if AutoRainbowHaki then
                        AutoRainbowHaki = game:GetService("Workspace").Enemies:FindFirstChild("Kilo Admiral")
                        if AutoRainbowHaki then
                            AutoRainbowHaki = pairs
                            for I, I2 in AutoRainbowHaki(game:GetService("Workspace").Enemies:GetChildren()) do
                                if I2.Name == "Kilo Admiral" then
                                    CFrame26 = I2.HumanoidRootPart.CFrame
                                    while true do
                                        task.wait()
                                        Function32(_G.SelectWeapon)
                                        Function35(I2.HumanoidRootPart.CFrame * R03664)
                                        I2.HumanoidRootPart.CanCollide = false
                                        I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                        I2.HumanoidRootPart.CFrame = CFrame26
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                        if _G.Auto_Rainbow_Haki ~= false then
                                            local Health = I2.Humanoid.Health
                                            if Health > 0 then
                                                Health = I2.Parent
                                                if Health then
                                                    Health = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                                                    if Health == false then
                                                        break
                                                    end
                                                else
                                                    break
                                                end
                                            else
                                                break
                                            end
                                        else
                                            break
                                        end
                                    end
                                end
                            end
                        else
                            Function35(CFrame.new(2877.617429999999786, 423.558685000000025, -7207.310059999999794, -0.989591599, 0, -0.143904909, 0, 1.00000012, 0, 0.143904924, 0, -0.989591479))
                        end
                    else
                        AutoRainbowHaki = string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant")
                        if AutoRainbowHaki then
                            AutoRainbowHaki = game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant")
                            if AutoRainbowHaki then
                                AutoRainbowHaki = pairs
                                for I, I2 in AutoRainbowHaki(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if I2.Name == "Captain Elephant" then
                                        CFrame26 = I2.HumanoidRootPart.CFrame
                                        while true do
                                            task.wait()
                                            Function32(_G.SelectWeapon)
                                            Function35(I2.HumanoidRootPart.CFrame * R03664)
                                            I2.HumanoidRootPart.CanCollide = false
                                            I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                            I2.HumanoidRootPart.CFrame = CFrame26
                                            game:GetService("VirtualUser"):CaptureController()
                                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                            sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                            if _G.Auto_Rainbow_Haki ~= false then
                                                local Health = I2.Humanoid.Health
                                                if Health > 0 then
                                                    Health = I2.Parent
                                                    if Health then
                                                        Health = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                                                        if Health == false then
                                                            break
                                                        end
                                                    else
                                                        break
                                                    end
                                                else
                                                    break
                                                end
                                            else
                                                break
                                            end
                                        end
                                    end
                                end
                            else
                                Function35(CFrame.new(-13485.028299999999945, 331.709258999999975, -8012.487299999999777, 0.714521289, 0.000000079884991, 0.69961375, -0.000000102065748, 1, -0.000000009943831, -0.69961375, -0.000000064301524, 0.714521289))
                            end
                        else
                            AutoRainbowHaki = string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Beautiful Pirate")
                            if AutoRainbowHaki then
                                AutoRainbowHaki = game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate")
                                if AutoRainbowHaki then
                                    AutoRainbowHaki = pairs
                                    for I, I2 in AutoRainbowHaki(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if I2.Name == "Beautiful Pirate" then
                                            CFrame26 = I2.HumanoidRootPart.CFrame
                                            while true do
                                                task.wait()
                                                Function32(_G.SelectWeapon)
                                                Function35(I2.HumanoidRootPart.CFrame * R03664)
                                                I2.HumanoidRootPart.CanCollide = false
                                                I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                                I2.HumanoidRootPart.CFrame = CFrame26
                                                game:GetService("VirtualUser"):CaptureController()
                                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                                if _G.Auto_Rainbow_Haki ~= false then
                                                    local Health = I2.Humanoid.Health
                                                    if Health > 0 then
                                                        Health = I2.Parent
                                                        if Health then
                                                            Health = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                                                            if Health == false then
                                                                break
                                                            end
                                                        else
                                                            break
                                                        end
                                                    else
                                                        break
                                                    end
                                                else
                                                    break
                                                end
                                            end
                                        end
                                    end
                                else
                                    Function35(CFrame.new(5312.359863281300022, 20.141201019286999, -10.158538818359))
                                end
                            else
                                Function35(CFrame.new(-11892.0703125, 930.576721191410002, -8760.1591796875))
                                AutoRainbowHaki = Vector3.new(-11892.0703125, 930.576721191410002, -8760.1591796875)
                                AutoRainbowHaki = (AutoRainbowHaki - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                                if AutoRainbowHaki <= 30 then
                                    wait(1.5)
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan", "Bet")
                                end
                            end
                        end
                    end
                end
            end
        end
    end)
end)
Tab4:Toggle("Auto Evo Race V2", false, function(Param)
    _G.Auto_EvoRace = Param
    Function38(_G.Auto_EvoRace)
end)
spawn(function()
    pcall(function()
        while wait(0.1) do
            local AutoEvoRace = _G.Auto_EvoRace
            if AutoEvoRace then
                AutoEvoRace = game:GetService("Players").LocalPlayer.Data.Race:FindFirstChild("Evolved")
                if not AutoEvoRace then
                    AutoEvoRace = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1")
                    if AutoEvoRace == 0 then
                        Function35(CFrame.new(-2779.835210000000188, 72.966140699999997, -3574.020019999999931, -0.730484903, 0.00000006390141, -0.68292886, 0.000000035996322, 1, 0.000000055066703, 0.68292886, 0.000000015642467, -0.730484903))
                        AutoEvoRace = Vector3.new(-2779.835210000000188, 72.966140699999997, -3574.020019999999931)
                        AutoEvoRace = (AutoEvoRace - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                        if AutoEvoRace <= 4 then
                            wait(1.3)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "2")
                        end
                    else
                        AutoEvoRace = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1")
                        if AutoEvoRace == 1 then
                            pcall(function()
                                if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 1") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 1") then
                                    Function35(game:GetService("Workspace").Flower1.CFrame)
                                elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 2") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 2") then
                                    Function35(game:GetService("Workspace").Flower2.CFrame)
                                elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 3") then
                                    if game:GetService("Workspace").Enemies:FindFirstChild("Zombie") then
                                        for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                            if I2.Name == "Zombie" then
                                                while true do
                                                    task.wait()
                                                    Function30()
                                                    Function32(_G.SelectWeapon)
                                                    Function35(I2.HumanoidRootPart.CFrame * R03664)
                                                    I2.HumanoidRootPart.CanCollide = false
                                                    I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                                    game:GetService("VirtualUser"):CaptureController()
                                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                                    CFrame27 = I2.HumanoidRootPart.CFrame
                                                    Flag90 = true
                                                    if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") then
                                                        local Parent = I2.Parent
                                                        if Parent then
                                                            Parent = I2.Humanoid.Health
                                                            if Parent > 0 then
                                                                Parent = _G.Auto_EvoRace
                                                                if Parent == false then
                                                                    break
                                                                end
                                                            else
                                                                break
                                                            end
                                                        else
                                                            break
                                                        end
                                                    else
                                                        break
                                                    end
                                                end
                                                Flag90 = false
                                            end
                                        end
                                    else
                                        Flag90 = false
                                        Function35(CFrame.new(-5685.923339843800022, 48.480125427246001, -853.237243652339998))
                                    end
                                end
                            end)
                        else
                            AutoEvoRace = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1")
                            if AutoEvoRace == 2 then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "3")
                            end
                        end
                    end
                end
            end
        end
    end)
end)
Tab4:Toggle("Auto Bartilo Quest", false, function(Param)
    _G.AutoBartilo = Param
end)
spawn(function()
    pcall(function()
        while wait(0.1) do
            local AutoBartilo = _G.AutoBartilo
            if AutoBartilo then
                AutoBartilo = game:GetService("Players").LocalPlayer.Data.Level.Value
                local Value8 = nil
                if AutoBartilo >= 800 then
                    AutoBartilo = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo")
                    if AutoBartilo == 0 then
                        AutoBartilo = string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates")
                        if AutoBartilo then
                            AutoBartilo = string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50")
                            if AutoBartilo then
                                AutoBartilo = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                                if AutoBartilo == true then
                                    AutoBartilo = game:GetService("Workspace").Enemies:FindFirstChild("Swan Pirate")
                                    if AutoBartilo then
                                        String256 = "Swan Pirate"
                                        AutoBartilo = pairs
                                        for I, Value8 in AutoBartilo(game:GetService("Workspace").Enemies:GetChildren()) do
                                            if Value8.Name == String256 then
                                                pcall(function()
                                                    while true do
                                                        task.wait()
                                                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                                        Function32(_G.SelectWeapon)
                                                        Function30()
                                                        Value8.HumanoidRootPart.Transparency = 1
                                                        Value8.HumanoidRootPart.CanCollide = false
                                                        Value8.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                                        Function35(Value8.HumanoidRootPart.CFrame * R03664)
                                                        CFrame28 = Value8.HumanoidRootPart.CFrame
                                                        game:GetService("VirtualUser"):CaptureController()
                                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                                        Flag92 = true
                                                        if Value8.Parent then
                                                            local Health = Value8.Humanoid.Health
                                                            if Health > 0 then
                                                                Health = _G.AutoBartilo
                                                                if Health ~= false then
                                                                    Health = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                                                                    if Health == false then
                                                                        break
                                                                    end
                                                                else
                                                                    break
                                                                end
                                                            else
                                                                break
                                                            end
                                                        else
                                                            break
                                                        end
                                                    end
                                                    Flag92 = false
                                                end)
                                            end
                                        end
                                    else
                                        while true do
                                            Value8 = 1180.27466000000004
                                            Function35(CFrame.new(932.624451000000022, 156.106078999999994, Value8, -0.973085582, 0.000000045513712, -0.230443969, 0.000000026702471, 1, 0.000000084749111, 0.230443969, 0.000000076314713, -0.973085582))
                                            wait()
                                            AutoBartilo = _G.AutoBartilo
                                            if AutoBartilo then
                                                Value8 = 1180.27466000000004
                                                AutoBartilo = (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(932.624451000000022, 156.106078999999994, Value8, -0.973085582, 0.000000045513712, -0.230443969, 0.000000026702471, 1, 0.000000084749111, 0.230443969, 0.000000076314713, -0.973085582)).Magnitude
                                                if AutoBartilo <= 10 then
                                                    -- empty block
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                        while true do
                            Value8 = 299.895965999999987
                            Function35(CFrame.new(-456.289519999999982, 73.020095800000007, Value8))
                            wait()
                            AutoBartilo = _G.AutoBartilo
                            if AutoBartilo then
                                Value8 = 299.895965999999987
                                AutoBartilo = (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-456.289519999999982, 73.020095800000007, Value8)).Magnitude
                                if AutoBartilo <= 10 then
                                    break
                                end
                            else
                                break
                            end
                        end
                        wait(1.1)
                        Value8 = 1
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "BartiloQuest", Value8)
                    end
                end
                AutoBartilo = game:GetService("Players").LocalPlayer.Data.Level.Value
                if AutoBartilo >= 800 then
                    AutoBartilo = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo")
                    if AutoBartilo == 1 then
                        AutoBartilo = game:GetService("Workspace").Enemies:FindFirstChild("Jeremy")
                        if AutoBartilo then
                            String256 = "Jeremy"
                            AutoBartilo = pairs
                            for I, Value8 in AutoBartilo(game:GetService("Workspace").Enemies:GetChildren()) do
                                if Value8.Name == String256 then
                                    CFrame29 = Value8.HumanoidRootPart.CFrame
                                    while true do
                                        task.wait()
                                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                        Function32(_G.SelectWeapon)
                                        Function30()
                                        Value8.HumanoidRootPart.Transparency = 1
                                        Value8.HumanoidRootPart.CanCollide = false
                                        Value8.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                        Value8.HumanoidRootPart.CFrame = CFrame29
                                        Function35(Value8.HumanoidRootPart.CFrame * R03664)
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                        if Value8.Parent then
                                            local Health = Value8.Humanoid.Health
                                            if Health > 0 then
                                                Health = _G.AutoBartilo
                                                if Health == false then
                                                    break
                                                end
                                            else
                                                break
                                            end
                                        else
                                            break
                                        end
                                    end
                                end
                            end
                        else
                            AutoBartilo = game:GetService("ReplicatedStorage")
                            AutoBartilo = AutoBartilo:FindFirstChild("Jeremy [Lv. 850] [Boss]")
                            if AutoBartilo then
                                while true do
                                    Value8 = 299.895965999999987
                                    Function35(CFrame.new(-456.289519999999982, 73.020095800000007, Value8))
                                    wait()
                                    AutoBartilo = _G.AutoBartilo
                                    if AutoBartilo then
                                        Value8 = 299.895965999999987
                                        AutoBartilo = (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-456.289519999999982, 73.020095800000007, Value8)).Magnitude
                                        if AutoBartilo <= 10 then
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                                wait(1.1)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo")
                                wait(1)
                                while true do
                                    Value8 = 648.997375000000034
                                    Function35(CFrame.new(2099.88158999999996, 448.930999999999983, Value8))
                                    wait()
                                    AutoBartilo = _G.AutoBartilo
                                    if AutoBartilo then
                                        Value8 = 648.997375000000034
                                        AutoBartilo = (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(2099.88158999999996, 448.930999999999983, Value8)).Magnitude
                                        if AutoBartilo <= 10 then
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                                wait(2)
                            else
                                while true do
                                    Value8 = 648.997375000000034
                                    Function35(CFrame.new(2099.88158999999996, 448.930999999999983, Value8))
                                    wait()
                                    AutoBartilo = _G.AutoBartilo
                                    if AutoBartilo then
                                        Value8 = 648.997375000000034
                                        AutoBartilo = (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(2099.88158999999996, 448.930999999999983, Value8)).Magnitude
                                        if AutoBartilo <= 10 then
                                            -- empty block
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                AutoBartilo = game:GetService("Players").LocalPlayer.Data.Level.Value
                if AutoBartilo >= 800 then
                    AutoBartilo = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo")
                    if AutoBartilo == 2 then
                        while true do
                            Value8 = 1750.896850000000086
                            Function35(CFrame.new(-1850.493289999999888, 13.1789551, Value8))
                            wait()
                            AutoBartilo = _G.AutoBartilo
                            if AutoBartilo then
                                Value8 = 1750.896850000000086
                                AutoBartilo = (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-1850.493289999999888, 13.1789551, Value8)).Magnitude
                                if AutoBartilo <= 10 then
                                    break
                                end
                            else
                                break
                            end
                        end
                        wait(1)
                        while true do
                            Value8 = 1712.01807000000008
                            Function35(CFrame.new(-1858.873049999999921, 19.377746599999998, Value8))
                            wait()
                            AutoBartilo = _G.AutoBartilo
                            if AutoBartilo then
                                Value8 = 1712.01807000000008
                                AutoBartilo = (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-1858.873049999999921, 19.377746599999998, Value8)).Magnitude
                                if AutoBartilo <= 10 then
                                    break
                                end
                            else
                                break
                            end
                        end
                        wait(1)
                        while true do
                            Value8 = 1750.896850000000086
                            Function35(CFrame.new(-1803.94324000000006, 16.5789185, Value8))
                            wait()
                            AutoBartilo = _G.AutoBartilo
                            if AutoBartilo then
                                Value8 = 1750.896850000000086
                                AutoBartilo = (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-1803.94324000000006, 16.5789185, Value8)).Magnitude
                                if AutoBartilo <= 10 then
                                    break
                                end
                            else
                                break
                            end
                        end
                        wait(1)
                        while true do
                            Value8 = 1724.795409999999947
                            Function35(CFrame.new(-1858.558350000000019, 16.860431699999999, Value8))
                            wait()
                            AutoBartilo = _G.AutoBartilo
                            if AutoBartilo then
                                Value8 = 1724.795409999999947
                                AutoBartilo = (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-1858.558350000000019, 16.860431699999999, Value8)).Magnitude
                                if AutoBartilo <= 10 then
                                    break
                                end
                            else
                                break
                            end
                        end
                        wait(1)
                        while true do
                            Value8 = 1681.00658999999996
                            Function35(CFrame.new(-1869.542239999999993, 15.987854, Value8))
                            wait()
                            AutoBartilo = _G.AutoBartilo
                            if AutoBartilo then
                                Value8 = 1681.00658999999996
                                AutoBartilo = (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-1869.542239999999993, 15.987854, Value8)).Magnitude
                                if AutoBartilo <= 10 then
                                    break
                                end
                            else
                                break
                            end
                        end
                        wait(1)
                        while true do
                            Value8 = 1684.523680000000013
                            Function35(CFrame.new(-1800.097899999999981, 16.497802700000001, Value8))
                            wait()
                            AutoBartilo = _G.AutoBartilo
                            if AutoBartilo then
                                Value8 = 1684.523680000000013
                                AutoBartilo = (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-1800.097899999999981, 16.497802700000001, Value8)).Magnitude
                                if AutoBartilo <= 10 then
                                    break
                                end
                            else
                                break
                            end
                        end
                        wait(1)
                        while true do
                            Value8 = 1717.90625
                            Function35(CFrame.new(-1819.263429999999971, 14.795166, Value8))
                            wait()
                            AutoBartilo = _G.AutoBartilo
                            if AutoBartilo then
                                Value8 = 1717.90625
                                AutoBartilo = (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-1819.263429999999971, 14.795166, Value8)).Magnitude
                                if AutoBartilo <= 10 then
                                    break
                                end
                            else
                                break
                            end
                        end
                        wait(1)
                        Value8 = 1724.795409999999947
                        Function35(CFrame.new(-1813.51843000000008, 14.860473600000001, Value8))
                        wait()
                        AutoBartilo = _G.AutoBartilo
                        if AutoBartilo then
                            Value8 = 1724.795409999999947
                            AutoBartilo = (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-1813.51843000000008, 14.860473600000001, Value8)).Magnitude
                            if AutoBartilo > 10 then
                                break
                            end
                        end
                    end
                end
            end
        end
    end)
end)
Tab4:Toggle("Auto Holy Torch", false, function(Param)
    _G.AutoHolyTorch = Param
    Function38(_G.AutoHolyTorch)
end)
spawn(function()
    while wait(0.5) do
        pcall(function()
            if _G.AutoHolyTorch and (game.Players.LocalPlayer.Backpack:FindFirstChild("Holy Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Holy Torch")) then
                repeat
                    wait(0.2)
                    Function32("Holy Torch")
                    Function35(CFrame.new(-10752.443400000000111, 415.261749000000009, -9367.438480000000709, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                until (Vector3.new(-10752.443400000000111, 415.261749000000009, -9367.438480000000709) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5
                wait(2)
                repeat
                    wait(0.2)
                    Function32("Holy Torch")
                    Function35(CFrame.new(-11671.628899999999703, 333.78125, -9474.319340000000011, 0.300932229, 0, -0.953645527, 0, 1, 0, 0.953645527, 0, 0.300932229))
                until (Vector3.new(-11671.628899999999703, 333.78125, -9474.319340000000011) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5
                wait(2)
                repeat
                    wait(0.2)
                    Function32("Holy Torch")
                    Function35(CFrame.new(-12133.140600000000632, 521.507445999999959, -10654.291999999999462, 0.80428642, 0, -0.594241858, 0, 1, 0, 0.594241858, 0, 0.80428642))
                until (Vector3.new(-12133.140600000000632, 521.507445999999959, -10654.291999999999462) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5
                wait(2)
                repeat
                    wait(0.2)
                    Function32("Holy Torch")
                    Function35(CFrame.new(-13336.127000000000407, 484.521179000000018, -6985.316890000000058, 0.853732228, 0, -0.520712316, 0, 1, 0, 0.520712316, 0, 0.853732228))
                until (Vector3.new(-13336.127000000000407, 484.521179000000018, -6985.316890000000058) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5
                wait(2)
                Function32("Holy Torch")
                repeat
                    wait(0.2)
                    Function35(CFrame.new(-13487.622999999999593, 336.436188000000016, -7924.538569999999709, -0.982848108, 0, 0.184417039, 0, 1, 0, -0.184417039, 0, -0.982848108))
                until (Vector3.new(-13487.622999999999593, 336.436188000000016, -7924.538569999999709) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5
                wait(2)
                Com()
                wait(20)
            end
        end)
    end
end)
Tab4:Seperator("Elite Hunter")
local Label8 = Tab4:Label("")
spawn(function()
    while wait() do
        pcall(function()
            if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") or game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") or game:GetService("ReplicatedStorage"):FindFirstChild("Urban") or game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban") then
                Label8:Set("Status : Elite Spawn!")
            else
                Label8:Set("Status : Elite Not Spawn")
            end
        end)
    end
end)
local Label9 = Tab4:Label("")
spawn(function()
    pcall(function()
        while wait() do
            Label9:Set("Elite Progress : " .. game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter", "Progress"))
        end
    end)
end)
Tab4:Toggle("Auto Elite Hunter", false, function(Param)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
    _G.AutoElitehunter = Param
    Function38(_G.AutoElitehunter)
end)
local Inst8 = CFrame.new(-5418.892578125, 313.741302490229998, -2826.226074218800022)
spawn(function()
    while wait() do
        local AutoElitehunter = _G.AutoElitehunter
        if AutoElitehunter then
            AutoElitehunter = Flag3
            if AutoElitehunter then
                pcall(function()
                    local Text = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        if R0216 then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst8.Position).Magnitude > 1500 then
                                Function33(Inst8)
                            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst8.Position).Magnitude < 1500 then
                                Function35(Inst8)
                            end
                        else
                            Function35(Inst8)
                        end
                        if (Vector3.new(-5418.892578125, 313.741302490229998, -2826.226074218800022) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and (string.find(Text, "Diablo") or string.find(Text, "Deandre") or string.find(Text, "Urban")) then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban") then
                            for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if (I2.Name == "Diablo" or I2.Name == "Deandre" or I2.Name == "Urban") and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                                    while true do
                                        task.wait()
                                        Function30()
                                        Function32(_G.SelectWeapon)
                                        I2.HumanoidRootPart.CanCollide = false
                                        I2.Humanoid.WalkSpeed = 0
                                        I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                        Function35(I2.HumanoidRootPart.CFrame * R03664)
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                        if _G.AutoElitehunter ~= false then
                                            local Health = I2.Humanoid.Health
                                            if Health > 0 then
                                                Health = I2.Parent
                                                if not Health then
                                                    break
                                                end
                                            else
                                                break
                                            end
                                        else
                                            break
                                        end
                                    end
                                end
                            end
                        elseif game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") then
                            Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Diablo").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        elseif game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") then
                            Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Deandre").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        elseif game:GetService("ReplicatedStorage"):FindFirstChild("Urban") then
                            Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Urban").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        elseif _G.AutoEliteHunterHop then
                            Function3()
                        else
                            Function35(CFrame.new(-5418.892578125, 313.741302490229998, -2826.226074218800022))
                        end
                    end
                end)
            end
        end
    end
end)
Tab4:Seperator("Observation Haki")
local Label10 = Tab4:Label("")
spawn(function()
    while wait() do
        pcall(function()
            Label10:Set("Observation Level : " .. math.floor(game:GetService("Players").LocalPlayer.VisionRadius.Value))
        end)
    end
end)
Tab4:Toggle("Auto Farm Observation Haki", false, function(Param)
    _G.AutoObservation = Param
    Function38(_G.AutoObservation)
end)
spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoObservation then
                while true do
                    task.wait()
                    if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                        game:GetService("VirtualUser"):CaptureController()
                        game:GetService("VirtualUser"):SetKeyDown("0x65")
                        wait(2)
                        local Child = game:GetService("VirtualUser")
                        Child:SetKeyUp("0x65")
                    end
                    local Child = game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                    if not Child then
                        Child = _G.AutoObservation
                        if not Child then
                            break
                        end
                    else
                        break
                    end
                end
            end
        end)
    end
end)
spawn(function()
    pcall(function()
        while wait() do
            local AutoObservation = _G.AutoObservation
            if AutoObservation then
                AutoObservation = false
                if AutoObservation then
                    game:GetService("StarterGui"):SetCore("SendNotification", {
                        Title = "Observation",
                        Text = "You Are Maxed Point",
                        Icon = "rbxassetid://16691911177",
                        Duration = 2.5
                    })
                    wait(2)
                elseif Flag2 then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate [Lv. 1200]") then
                        if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                            task.wait()
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate").HumanoidRootPart.CFrame * CFrame.new(3, 0, 0)
                            if _G.AutoObservation ~= false and not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                                -- empty block
                            end
                        end
                        task.wait()
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate").HumanoidRootPart.CFrame * CFrame.new(0, 50, 0) + wait(1)
                        if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") and _G.AutoObservation_Hop == true then
                            game:GetService("TeleportService"):Function5(game.PlaceId, game:GetService("Players").LocalPlayer)
                        end
                        if _G.AutoObservation ~= false and game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                            -- empty block
                        end
                    end
                    Function35(CFrame.new(-5478.39209000000028, 15.977566700000001, -5246.912599999999657))
                elseif Flag then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Galley Captain") then
                        if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                            while true do
                                task.wait()
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Galley Captain").HumanoidRootPart.CFrame * CFrame.new(3, 0, 0)
                                if _G.AutoObservation ~= false then
                                    local Child = game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                                    if not Child then
                                        -- empty block
                                    end
                                end
                            end
                        else
                            while true do
                                task.wait()
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Galley Captain").HumanoidRootPart.CFrame * CFrame.new(0, 50, 0)
                                wait(1)
                                if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                                    local Child = _G.AutoObservation_Hop
                                    if Child == true then
                                        Child = game:GetService("TeleportService")
                                        Child:Function5(game.PlaceId, game:GetService("Players").LocalPlayer)
                                    end
                                end
                                local Child = _G.AutoObservation
                                if Child ~= false then
                                    Child = game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                                    if Child then
                                        -- empty block
                                    end
                                end
                            end
                        end
                    else
                        Function35(CFrame.new(5533.297849999999926, 88.107910200000006, 4852.391599999999926))
                    end
                elseif Flag3 then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Giant Islander") then
                        if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                            while true do
                                task.wait()
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Giant Islander").HumanoidRootPart.CFrame * CFrame.new(3, 0, 0)
                                if _G.AutoObservation ~= false then
                                    local Child = game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                                    if not Child then
                                        -- empty block
                                    end
                                end
                            end
                        else
                            task.wait()
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Giant Islander").HumanoidRootPart.CFrame * CFrame.new(0, 50, 0)
                            wait(1)
                            if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") and _G.AutoObservation_Hop == true then
                                game:GetService("TeleportService"):Function5(game.PlaceId, game:GetService("Players").LocalPlayer)
                            end
                            if _G.AutoObservation ~= false and game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                                -- empty block
                            end
                        end
                    end
                    Function35(CFrame.new(4530.354003906300022, 656.756958007809999, -131.60952758789))
                end
            end
        end
    end)
end)
Tab4:Toggle("Auto Observation Haki V2", false, function(Param)
    _G.AutoObservationv2 = Param
    Function38(_G.AutoObservationv2)
end)
spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoObservationv2 then
                if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen") == 3 then
                    _G.AutoMusketeerHat = false
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Banana") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Apple") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Pineapple") then
                        while true do
                            Function35(CFrame.new(-12444.78515625, 332.40396118164, -7673.1806640625))
                            wait()
                            if _G.AutoObservationv2 then
                                local Magnitude = (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-12444.78515625, 332.40396118164, -7673.1806640625)).Magnitude
                                if Magnitude <= 10 then
                                    break
                                end
                            else
                                break
                            end
                        end
                        wait(0.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")
                    elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fruit Bowl") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fruit Bowl") then
                        while true do
                            Function35(CFrame.new(-10920.125, 624.202758789059999, -10266.995117188000222))
                            wait()
                            if _G.AutoObservationv2 then
                                local Magnitude = (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-10920.125, 624.202758789059999, -10266.995117188000222)).Magnitude
                                if Magnitude <= 10 then
                                    break
                                end
                            else
                                break
                            end
                        end
                        wait(0.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2", "Start")
                        wait(1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2", "Buy")
                    else
                        for I, I2 in pairs(game:GetService("Workspace"):GetDescendants()) do
                            if I2.Name == "Apple" or I2.Name == "Banana" or I2.Name == "Pineapple" then
                                I2.Handle.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 1, 10)
                                wait()
                                firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, I2.Handle, 0)
                                wait()
                            end
                        end
                    end
                else
                    _G.AutoMusketeerHat = true
                end
            end
        end)
    end
end)
Tab4:Seperator("Lengedary Sword")
Result12 = Tab4:Label("")
spawn(function()
    pcall(function()
        while wait() do
            local InvokeServerOp = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1")
            if InvokeServerOp then
                Result12:Set("Sword Spawn : Shisui")
            else
                InvokeServerOp = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "2")
                if InvokeServerOp then
                    Result12:Set("Sword Spawn : Wando")
                else
                    InvokeServerOp = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "3")
                    if InvokeServerOp then
                        Result12:Set("Sword Spawn : Saddi")
                    else
                        Result12:Set("Not Found Lengedary Sword")
                    end
                end
            end
        end
    end)
end)
Tab4:Toggle("Auto Buy Lengedary Sword", false, function(Param)
    _G.AutoBuyLegendarySword = Param
end)
spawn(function()
    while wait() do
        local AutoBuyLegendarySword = _G.AutoBuyLegendarySword
        if AutoBuyLegendarySword then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    [1] = "LegendarySwordDealer",
                    [2] = "1"
                }))
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    [1] = "LegendarySwordDealer",
                    [2] = "2"
                }))
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    [1] = "LegendarySwordDealer",
                    [2] = "3"
                }))
                if _G.AutoBuyLegendarySword_Hop and _G.AutoBuyLegendarySword and Flag2 then
                    wait(10)
                    Function3()
                end
            end)
        end
    end
end)
Tab4:Seperator("Enchancement Colour")
Result13 = Tab4:Label("")
local Service7 = game:GetService("ReplicatedStorage")
local String = "WaitForChild"
String = "Remotes"
Service7 = Service7[String](String)
String = "WaitForChild"
String = "CommF_"
Service7 = Service7[String](String)
String = "InvokeServer"
String = "ColorsDealer"
Service7 = Service7[String](String, "1")
spawn(function()
    pcall(function()
        while wait() do
            local Service8 = game:GetService("ReplicatedStorage")
            Service8 = Service8:WaitForChild("Remotes")
            Service8 = Service8:WaitForChild("CommF_")
            Service8 = Service8:InvokeServer("ColorsDealer", "1")
            if Service8 then
                Result13:Set(Service7)
            else
                Result13:Set("Not Found HakiDealer")
            end
        end
    end)
end)
Tab4:Toggle("Auto Buy Enchancement Colour", false, function(Param)
    _G.AutoBuyEnchancementColour = valu
end)
spawn(function()
    while wait() do
        local AutoBuyEnchancementColour = _G.AutoBuyEnchancementColour
        if AutoBuyEnchancementColour then
            AutoBuyEnchancementColour = {}
            AutoBuyEnchancementColour[1] = "ColorsDealer"
            AutoBuyEnchancementColour[2] = "2"
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(AutoBuyEnchancementColour))
            if _G.AutoBuyEnchancementColour_Hop and _G.AutoBuyEnchancementColour and not Flag then
                wait(10)
                Function3()
            end
        end
    end
end)
Tab4:Seperator("Auto Material")
Tab4:Toggle("Auto Farm R0177", false, function(Param)
    R0177 = Param
    Function38(R0177)
end)
local Inst9 = CFrame.new(-507.789520263671875, 72.994796752929688, -126.456329345703125)
spawn(function()
    while wait() do
        local Radioactive = R0177
        if Radioactive then
            Radioactive = Flag2
            if Radioactive then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Factory Staff") then
                        for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if I2.Name == "Factory Staff" and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                                while true do
                                    task.wait()
                                    Function30()
                                    Function32(_G.SelectWeapon)
                                    I2.HumanoidRootPart.CanCollide = false
                                    I2.Humanoid.WalkSpeed = 0
                                    I2.Head.CanCollide = false
                                    Flag124 = true
                                    CFrame45 = I2.HumanoidRootPart.CFrame
                                    Function35(I2.HumanoidRootPart.CFrame * R03664)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    if R0177 then
                                        local Parent = I2.Parent
                                        if Parent then
                                            Parent = I2.Humanoid.Health
                                            if Parent <= 0 then
                                                break
                                            end
                                        else
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                                Flag124 = false
                            end
                        end
                    else
                        if R0216 then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst9.Position).Magnitude > 1500 then
                                Function33(Inst9)
                            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst9.Position).Magnitude < 1500 then
                                Function35(Inst9)
                            end
                        else
                            Function35(Inst9)
                        end
                        Function31(_G.SelectWeapon)
                        Function35(CFrame.new(-507.789520263671875, 72.994796752929688, -126.456329345703125))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Factory Staff") then
                            Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Factory Staff").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        elseif _G.StardHop then
                            Function3()
                        end
                    end
                end)
            end
        end
    end
end)
Tab4:Toggle("Auto Farm Mystic Droplet", false, function(Param)
    _G.Makori_gay = Param
    Function38(_G.Makori_gay)
end)
String = CFrame.new(-3352.9013671875, 285.01556396484375, -10534.841796875)
spawn(function()
    while wait() do
        local MakoriGay = _G.Makori_gay
        if MakoriGay then
            MakoriGay = Flag2
            if MakoriGay then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Water Fighter") then
                        for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if I2.Name == "Water Fighter" and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                                while true do
                                    task.wait()
                                    Function30()
                                    Function32(_G.SelectWeapon)
                                    I2.HumanoidRootPart.CanCollide = false
                                    I2.Humanoid.WalkSpeed = 0
                                    I2.Head.CanCollide = false
                                    Flag124 = true
                                    CFrame45 = I2.HumanoidRootPart.CFrame
                                    Function35(I2.HumanoidRootPart.CFrame * R03664)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    if _G.Makori_gay then
                                        local Parent = I2.Parent
                                        if Parent then
                                            Parent = I2.Humanoid.Health
                                            if Parent <= 0 then
                                                break
                                            end
                                        else
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                                Flag124 = false
                            end
                        end
                    else
                        if R0216 then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - String.Position).Magnitude > 1500 then
                                Function33(String)
                            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - String.Position).Magnitude < 1500 then
                                Function35(String)
                            end
                        else
                            Function35(String)
                        end
                        Function31(_G.SelectWeapon)
                        Function35(CFrame.new(-3352.9013671875, 285.01556396484375, -10534.841796875))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Water Fighter") then
                            Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Water Fighter").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        elseif _G.StardHop then
                            Function3()
                        end
                    end
                end)
            end
        end
    end
end)
Tab4:Toggle("Auto Farm Magma Ore", false, function(Param)
    _G.Umm = Param
    Function38(_G.Umm)
end)
local Inst10 = CFrame.new(-5850.2802734375, 77.286750793457031, 8848.6748046875)
spawn(function()
    while wait() do
        local Umm = _G.Umm
        if Umm then
            Umm = Flag
            if Umm then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Military Spy") then
                        for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if I2.Name == "Military Spy" and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                                while true do
                                    task.wait()
                                    Function30()
                                    Function32(_G.SelectWeapon)
                                    I2.HumanoidRootPart.CanCollide = false
                                    I2.Humanoid.WalkSpeed = 0
                                    I2.Head.CanCollide = false
                                    Flag124 = true
                                    CFrame45 = I2.HumanoidRootPart.CFrame
                                    Function35(I2.HumanoidRootPart.CFrame * R03664)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    if _G.Umm then
                                        local Parent = I2.Parent
                                        if Parent then
                                            Parent = I2.Humanoid.Health
                                            if Parent <= 0 then
                                                break
                                            end
                                        else
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                                Flag124 = false
                            end
                        end
                    else
                        if R0216 then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst10.Position).Magnitude > 1500 then
                                Function33(Inst10)
                            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst10.Position).Magnitude < 1500 then
                                Function35(Inst10)
                            end
                        else
                            Function35(Inst10)
                        end
                        Function31(_G.SelectWeapon)
                        Function35(CFrame.new(-5850.2802734375, 77.286750793457031, 8848.6748046875))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Military Spy") then
                            Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Military Spy").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        elseif _G.StardHop then
                            Function3()
                        end
                    end
                end)
            end
        end
    end
end)
local Inst11 = CFrame.new(-5234.60595703125, 51.953372955322266, -4732.27880859375)
spawn(function()
    while wait() do
        local Umm = _G.Umm
        if Umm then
            Umm = Flag2
            if Umm then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate") then
                        for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if I2.Name == "Lava Pirate" and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                                while true do
                                    task.wait()
                                    Function30()
                                    Function32(_G.SelectWeapon)
                                    I2.HumanoidRootPart.CanCollide = false
                                    I2.Humanoid.WalkSpeed = 0
                                    I2.Head.CanCollide = false
                                    Flag124 = true
                                    CFrame45 = I2.HumanoidRootPart.CFrame
                                    Function35(I2.HumanoidRootPart.CFrame * R03664)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    if _G.Umm then
                                        local Parent = I2.Parent
                                        if Parent then
                                            Parent = I2.Humanoid.Health
                                            if Parent <= 0 then
                                                break
                                            end
                                        else
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                                Flag124 = false
                            end
                        end
                    else
                        if R0216 then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst11.Position).Magnitude > 1500 then
                                Function33(Inst11)
                            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst11.Position).Magnitude < 1500 then
                                Function35(Inst11)
                            end
                        else
                            Function35(Inst11)
                        end
                        Function31(_G.SelectWeapon)
                        Function35(CFrame.new(-5234.60595703125, 51.953372955322266, -4732.27880859375))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Lava Pirate") then
                            Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Lava Pirate").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        elseif _G.StardHop then
                            Function3()
                        end
                    end
                end)
            end
        end
    end
end)
Tab4:Toggle("Auto Farm Angel Wing", false, function(Param)
    _G.Auto_Wing = Param
    Function38(_G.Auto_Wing)
end)
local Inst12 = CFrame.new(-7827.15625, 5606.912109375, -1705.5833740234375)
spawn(function()
    while wait() do
        local AutoWing = _G.Auto_Wing
        if AutoWing then
            AutoWing = Flag
            if AutoWing then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Royal Soldier") then
                        for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if I2.Name == "Royal Soldier" and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                                while true do
                                    task.wait()
                                    Function30()
                                    Function32(_G.SelectWeapon)
                                    I2.HumanoidRootPart.CanCollide = false
                                    I2.Humanoid.WalkSpeed = 0
                                    I2.Head.CanCollide = false
                                    Flag124 = true
                                    CFrame45 = I2.HumanoidRootPart.CFrame
                                    Function35(I2.HumanoidRootPart.CFrame * R03664)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    if _G.Auto_Wing then
                                        local Parent = I2.Parent
                                        if Parent then
                                            Parent = I2.Humanoid.Health
                                            if Parent <= 0 then
                                                break
                                            end
                                        else
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                                Flag124 = false
                            end
                        end
                    else
                        if R0216 then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst12.Position).Magnitude > 1500 then
                                Function33(Inst12)
                            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst12.Position).Magnitude < 1500 then
                                Function35(Inst12)
                            end
                        else
                            Function35(Inst12)
                        end
                        Function31(_G.SelectWeapon)
                        Function35(CFrame.new(-7827.15625, 5606.912109375, -1705.5833740234375))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Royal Soldier") then
                            Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Royal Soldier").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        elseif _G.StardHop then
                            Function3()
                        end
                    end
                end)
            end
        end
    end
end)
Tab4:Toggle("Auto Farm Leather", false, function(Param)
    _G.Leather = Param
    Function38(_G.Leather)
end)
local Inst13 = CFrame.new(-1211.8792724609375, 4.787090301513672, 3916.83056640625)
spawn(function()
    while wait() do
        local Leather = _G.Leather
        if Leather then
            Leather = Flag
            if Leather then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Pirate") then
                        for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if I2.Name == "Pirate" and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                                while true do
                                    task.wait()
                                    Function30()
                                    Function32(_G.SelectWeapon)
                                    I2.HumanoidRootPart.CanCollide = false
                                    I2.Humanoid.WalkSpeed = 0
                                    I2.Head.CanCollide = false
                                    Flag124 = true
                                    CFrame45 = I2.HumanoidRootPart.CFrame
                                    Function35(I2.HumanoidRootPart.CFrame * R03664)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    if _G.Leather then
                                        local Parent = I2.Parent
                                        if Parent then
                                            Parent = I2.Humanoid.Health
                                            if Parent <= 0 then
                                                break
                                            end
                                        else
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                                Flag124 = false
                            end
                        end
                    else
                        if R0216 then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst13.Position).Magnitude > 1500 then
                                Function33(Inst13)
                            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst13.Position).Magnitude < 1500 then
                                Function35(Inst13)
                            end
                        else
                            Function35(Inst13)
                        end
                        Function31(_G.SelectWeapon)
                        Function35(CFrame.new(-1211.8792724609375, 4.787090301513672, 3916.83056640625))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Pirate") then
                            Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Pirate").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        elseif _G.StardHop then
                            Function3()
                        end
                    end
                end)
            end
        end
    end
end)
local Inst14 = CFrame.new(-2010.5059814453125, 73.00115966796875, -3326.620849609375)
spawn(function()
    while wait() do
        local Leather = _G.Leather
        if Leather then
            Leather = Flag2
            if Leather then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Marine Captain") then
                        for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if I2.Name == "Marine Captain" and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                                while true do
                                    task.wait()
                                    Function30()
                                    Function32(_G.SelectWeapon)
                                    I2.HumanoidRootPart.CanCollide = false
                                    I2.Humanoid.WalkSpeed = 0
                                    I2.Head.CanCollide = false
                                    Flag124 = true
                                    CFrame45 = I2.HumanoidRootPart.CFrame
                                    Function35(I2.HumanoidRootPart.CFrame * R03664)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    if _G.Leather then
                                        local Parent = I2.Parent
                                        if Parent then
                                            Parent = I2.Humanoid.Health
                                            if Parent <= 0 then
                                                break
                                            end
                                        else
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                                Flag124 = false
                            end
                        end
                    else
                        if R0216 then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst14.Position).Magnitude > 1500 then
                                Function33(Inst14)
                            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst14.Position).Magnitude < 1500 then
                                Function35(Inst14)
                            end
                        else
                            Function35(Inst14)
                        end
                        Function31(_G.SelectWeapon)
                        Function35(CFrame.new(-2010.5059814453125, 73.00115966796875, -3326.620849609375))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Marine Captain") then
                            Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Marine Captain").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        elseif _G.StardHop then
                            Function3()
                        end
                    end
                end)
            end
        end
    end
end)
local Inst15 = CFrame.new(-11975.78515625, 331.773406982421875, -10620.0302734375)
spawn(function()
    while wait() do
        local Leather = _G.Leather
        if Leather then
            Leather = Flag3
            if Leather then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Jungle Pirate") then
                        for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if I2.Name == "Jungle Pirate" and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                                while true do
                                    task.wait()
                                    Function30()
                                    Function32(_G.SelectWeapon)
                                    I2.HumanoidRootPart.CanCollide = false
                                    I2.Humanoid.WalkSpeed = 0
                                    I2.Head.CanCollide = false
                                    Flag124 = true
                                    CFrame45 = I2.HumanoidRootPart.CFrame
                                    Function35(I2.HumanoidRootPart.CFrame * R03664)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    if _G.Leather then
                                        local Parent = I2.Parent
                                        if Parent then
                                            Parent = I2.Humanoid.Health
                                            if Parent <= 0 then
                                                break
                                            end
                                        else
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                                Flag124 = false
                            end
                        end
                    else
                        if R0216 then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst15.Position).Magnitude > 1500 then
                                Function33(Inst15)
                            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst15.Position).Magnitude < 1500 then
                                Function35(Inst15)
                            end
                        else
                            Function35(Inst15)
                        end
                        Function31(_G.SelectWeapon)
                        Function35(CFrame.new(-11975.78515625, 331.773406982421875, -10620.0302734375))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Jungle Pirate") then
                            Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Jungle Pirate").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        elseif _G.StardHop then
                            Function3()
                        end
                    end
                end)
            end
        end
    end
end)
Tab4:Toggle("Auto Farm R0114 Metal", false, function(Param)
    R0114 = Param
    Function38(R0114)
end)
local Inst16 = CFrame.new(-1132.4202880859375, 14.844913482666016, 4293.30517578125)
spawn(function()
    while wait() do
        local R0114 = R0114
        if R0114 then
            R0114 = Flag
            if R0114 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Brute") then
                        for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if I2.Name == "Brute" and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                                while true do
                                    task.wait()
                                    Function30()
                                    Function32(_G.SelectWeapon)
                                    I2.HumanoidRootPart.CanCollide = false
                                    I2.Humanoid.WalkSpeed = 0
                                    I2.Head.CanCollide = false
                                    Flag124 = true
                                    CFrame45 = I2.HumanoidRootPart.CFrame
                                    Function35(I2.HumanoidRootPart.CFrame * R03664)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    if R0114 then
                                        local Parent = I2.Parent
                                        if Parent then
                                            Parent = I2.Humanoid.Health
                                            if Parent <= 0 then
                                                break
                                            end
                                        else
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                                Flag124 = false
                            end
                        end
                    else
                        if R0216 then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst16.Position).Magnitude > 1500 then
                                Function33(Inst16)
                            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst16.Position).Magnitude < 1500 then
                                Function35(Inst16)
                            end
                        else
                            Function35(Inst16)
                        end
                        Function31(_G.SelectWeapon)
                        Function35(CFrame.new(-1132.4202880859375, 14.844913482666016, 4293.30517578125))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Brute") then
                            Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Brute").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        elseif _G.StardHop then
                            Function3()
                        end
                    end
                end)
            end
        end
    end
end)
local Inst17 = CFrame.new(-972.307373046875, 73.04473876953125, 1419.2901611328125)
spawn(function()
    while wait() do
        local R0114 = R0114
        if R0114 then
            R0114 = Flag2
            if R0114 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Mercenary") then
                        for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if I2.Name == "Mercenary" and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                                while true do
                                    task.wait()
                                    Function30()
                                    Function32(_G.SelectWeapon)
                                    I2.HumanoidRootPart.CanCollide = false
                                    I2.Humanoid.WalkSpeed = 0
                                    I2.Head.CanCollide = false
                                    Flag124 = true
                                    CFrame45 = I2.HumanoidRootPart.CFrame
                                    Function35(I2.HumanoidRootPart.CFrame * R03664)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    if R0114 then
                                        local Parent = I2.Parent
                                        if Parent then
                                            Parent = I2.Humanoid.Health
                                            if Parent <= 0 then
                                                break
                                            end
                                        else
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                                Flag124 = false
                            end
                        end
                    else
                        if R0216 then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst17.Position).Magnitude > 1500 then
                                Function33(Inst17)
                            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst17.Position).Magnitude < 1500 then
                                Function35(Inst17)
                            end
                        else
                            Function35(Inst17)
                        end
                        Function31(_G.SelectWeapon)
                        Function35(CFrame.new(-972.307373046875, 73.04473876953125, 1419.2901611328125))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Mercenary") then
                            Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Mercenary").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        elseif _G.StardHop then
                            Function3()
                        end
                    end
                end)
            end
        end
    end
end)
local Inst18 = CFrame.new(-289.631195068359375, 43.8282470703125, 5583.66357421875)
spawn(function()
    while wait() do
        local R0114 = R0114
        if R0114 then
            R0114 = Flag3
            if R0114 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Pirate Millionaire") then
                        for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if I2.Name == "Pirate Millionaire" and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                                while true do
                                    task.wait()
                                    Function30()
                                    Function32(_G.SelectWeapon)
                                    I2.HumanoidRootPart.CanCollide = false
                                    I2.Humanoid.WalkSpeed = 0
                                    I2.Head.CanCollide = false
                                    Flag124 = true
                                    CFrame45 = I2.HumanoidRootPart.CFrame
                                    Function35(I2.HumanoidRootPart.CFrame * R03664)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    if R0114 then
                                        local Parent = I2.Parent
                                        if Parent then
                                            Parent = I2.Humanoid.Health
                                            if Parent <= 0 then
                                                break
                                            end
                                        else
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                                Flag124 = false
                            end
                        end
                    else
                        if R0216 then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst18.Position).Magnitude > 1500 then
                                Function33(Inst18)
                            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst18.Position).Magnitude < 1500 then
                                Function35(Inst18)
                            end
                        else
                            Function35(Inst18)
                        end
                        Function31(_G.SelectWeapon)
                        Function35(CFrame.new(-289.631195068359375, 43.8282470703125, 5583.66357421875))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Pirate Millionaire") then
                            Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Pirate Millionaire").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        elseif _G.StardHop then
                            Function3()
                        end
                    end
                end)
            end
        end
    end
end)
Tab4:Toggle("Auto Farm Conjured Cocoa", false, function(Param)
    R0401 = Param
    Function38(R0401)
end)
local Inst19 = CFrame.new(744.7930908203125, 24.769342422485352, -12637.7255859375)
spawn(function()
    while wait() do
        local Cocoafarm = R0401
        if Cocoafarm then
            Cocoafarm = Flag3
            if Cocoafarm then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Chocolate Bar Battler") then
                        for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if I2.Name == "Chocolate Bar Battler" and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                                while true do
                                    task.wait()
                                    Function30()
                                    Function32(_G.SelectWeapon)
                                    I2.HumanoidRootPart.CanCollide = false
                                    I2.Humanoid.WalkSpeed = 0
                                    I2.Head.CanCollide = false
                                    Flag124 = true
                                    CFrame45 = I2.HumanoidRootPart.CFrame
                                    Function35(I2.HumanoidRootPart.CFrame * R03664)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    if R0401 then
                                        local Parent = I2.Parent
                                        if Parent then
                                            Parent = I2.Humanoid.Health
                                            if Parent <= 0 then
                                                break
                                            end
                                        else
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                                Flag124 = false
                            end
                        end
                    else
                        if R0216 then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst19.Position).Magnitude > 1500 then
                                Function33(Inst19)
                            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst19.Position).Magnitude < 1500 then
                                Function35(Inst19)
                            end
                        else
                            Function35(Inst19)
                        end
                        Function31(_G.SelectWeapon)
                        Function35(CFrame.new(744.7930908203125, 24.769342422485352, -12637.7255859375))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Chocolate Bar Battler") then
                            Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Chocolate Bar Battler").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        elseif _G.StardHop then
                            Function3()
                        end
                    end
                end)
            end
        end
    end
end)
Tab4:Toggle("Auto Farm Dragon Scale", false, function(Param)
    R0172 = Param
    Function38(R0172)
end)
local Inst20 = CFrame.new(5824.06982421875, 51.386402130126953, -1106.694580078125)
spawn(function()
    while wait() do
        local DragonScale = R0172
        if DragonScale then
            DragonScale = Flag3
            if DragonScale then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Dragon Crew Warrior") then
                        for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if I2.Name == "Dragon Crew Warrior" and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                                while true do
                                    task.wait()
                                    Function30()
                                    Function32(_G.SelectWeapon)
                                    I2.HumanoidRootPart.CanCollide = false
                                    I2.Humanoid.WalkSpeed = 0
                                    I2.Head.CanCollide = false
                                    Flag124 = true
                                    CFrame45 = I2.HumanoidRootPart.CFrame
                                    Function35(I2.HumanoidRootPart.CFrame * R03664)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    if R0172 then
                                        local Parent = I2.Parent
                                        if Parent then
                                            Parent = I2.Humanoid.Health
                                            if Parent <= 0 then
                                                break
                                            end
                                        else
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                                Flag124 = false
                            end
                        end
                    else
                        if R0216 then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst20.Position).Magnitude > 1500 then
                                Function33(Inst20)
                            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst20.Position).Magnitude < 1500 then
                                Function35(Inst20)
                            end
                        else
                            Function35(Inst20)
                        end
                        Function31(_G.SelectWeapon)
                        Function35(CFrame.new(5824.06982421875, 51.386402130126953, -1106.694580078125))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Dragon Crew Warrior") then
                            Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Dragon Crew Warrior").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        elseif _G.StardHop then
                            Function3()
                        end
                    end
                end)
            end
        end
    end
end)
Tab4:Toggle("Auto Farm R0724", false, function(Param)
    R0724 = Param
    Function38(R0724)
end)
local Inst21 = CFrame.new(-379.613433837890625, 73.844497680664062, 5928.5263671875)
spawn(function()
    while wait() do
        local Gunpowder = R0724
        if Gunpowder then
            Gunpowder = Flag3
            if Gunpowder then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Pistol Billionaire") then
                        for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if I2.Name == "Pistol Billionaire" and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                                while true do
                                    task.wait()
                                    Function30()
                                    Function32(_G.SelectWeapon)
                                    I2.HumanoidRootPart.CanCollide = false
                                    I2.Humanoid.WalkSpeed = 0
                                    I2.Head.CanCollide = false
                                    Flag124 = true
                                    CFrame45 = I2.HumanoidRootPart.CFrame
                                    Function35(I2.HumanoidRootPart.CFrame * R03664)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    if R0724 then
                                        local Parent = I2.Parent
                                        if Parent then
                                            Parent = I2.Humanoid.Health
                                            if Parent <= 0 then
                                                break
                                            end
                                        else
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                                Flag124 = false
                            end
                        end
                    else
                        if R0216 then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst21.Position).Magnitude > 1500 then
                                Function33(Inst21)
                            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst21.Position).Magnitude < 1500 then
                                Function35(Inst21)
                            end
                        else
                            Function35(Inst21)
                        end
                        Function31(_G.SelectWeapon)
                        Function35(CFrame.new(-379.613433837890625, 73.844497680664062, 5928.5263671875))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Pistol Billionaire") then
                            Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Pistol Billionaire").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        elseif _G.StardHop then
                            Function3()
                        end
                    end
                end)
            end
        end
    end
end)
Tab4:Toggle("Auto Farm R0312 Tail", false, function(Param)
    R0312 = Param
    Function38(R0312)
end)
local Inst22 = CFrame.new(-10961.0126953125, 331.797760009765625, -8914.29296875)
spawn(function()
    while wait() do
        local R0312 = R0312
        if R0312 then
            R0312 = Flag3
            if R0312 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Fishman Captain") then
                        for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if I2.Name == "Fishman Captain" and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                                while true do
                                    task.wait()
                                    Function30()
                                    Function32(_G.SelectWeapon)
                                    I2.HumanoidRootPart.CanCollide = false
                                    I2.Humanoid.WalkSpeed = 0
                                    I2.Head.CanCollide = false
                                    Flag124 = true
                                    CFrame45 = I2.HumanoidRootPart.CFrame
                                    Function35(I2.HumanoidRootPart.CFrame * R03664)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    if R0312 then
                                        local Parent = I2.Parent
                                        if Parent then
                                            Parent = I2.Humanoid.Health
                                            if Parent <= 0 then
                                                break
                                            end
                                        else
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                                Flag124 = false
                            end
                        end
                    else
                        if R0216 then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst22.Position).Magnitude > 1500 then
                                Function33(Inst22)
                            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst22.Position).Magnitude < 1500 then
                                Function35(Inst22)
                            end
                        else
                            Function35(Inst22)
                        end
                        Function31(_G.SelectWeapon)
                        Function35(CFrame.new(-10961.0126953125, 331.797760009765625, -8914.29296875))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Fishman Captain") then
                            Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Fishman Captain").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        elseif _G.StardHop then
                            Function3()
                        end
                    end
                end)
            end
        end
    end
end)
Tab4:Toggle("Auto Farm Mini Tusk", false, function(Param)
    R05 = Param
    Function38(R05)
end)
local Inst23 = CFrame.new(-13516.0458984375, 469.8182373046875, -6899.16064453125)
spawn(function()
    while wait() do
        local MiniHee = R05
        if MiniHee then
            MiniHee = Flag3
            if MiniHee then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Mythological Pirate") then
                        for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if I2.Name == "Mythological Pirate" and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                                while true do
                                    task.wait()
                                    Function30()
                                    Function32(_G.SelectWeapon)
                                    I2.HumanoidRootPart.CanCollide = false
                                    I2.Humanoid.WalkSpeed = 0
                                    I2.Head.CanCollide = false
                                    Flag124 = true
                                    CFrame45 = I2.HumanoidRootPart.CFrame
                                    Function35(I2.HumanoidRootPart.CFrame * R03664)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    if R05 then
                                        local Parent = I2.Parent
                                        if Parent then
                                            Parent = I2.Humanoid.Health
                                            if Parent <= 0 then
                                                break
                                            end
                                        else
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                                Flag124 = false
                            end
                        end
                    else
                        if R0216 then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst23.Position).Magnitude > 1500 then
                                Function33(Inst23)
                            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst23.Position).Magnitude < 1500 then
                                Function35(Inst23)
                            end
                        else
                            Function35(Inst23)
                        end
                        Function31(_G.SelectWeapon)
                        Function35(CFrame.new(-13516.0458984375, 469.8182373046875, -6899.16064453125))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Mythological Pirate") then
                            Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Mythological Pirate").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        elseif _G.StardHop then
                            Function3()
                        end
                    end
                end)
            end
        end
    end
end)
Tab4:Toggle("Auto Farm Ectoplasm", false, function(Param)
    _G.AutoEctoplasm = Param
    Function38(_G.AutoEctoplasm)
end)
spawn(function()
    pcall(function()
        while wait() do
            local AutoEctoplasm = _G.AutoEctoplasm
            if AutoEctoplasm then
                AutoEctoplasm = game:GetService("Workspace").Enemies:FindFirstChild("Ship Deckhand")
                if not AutoEctoplasm then
                    AutoEctoplasm = game:GetService("Workspace").Enemies:FindFirstChild("Ship Engineer")
                    if not AutoEctoplasm then
                        AutoEctoplasm = game:GetService("Workspace").Enemies:FindFirstChild("Ship Steward")
                        if not AutoEctoplasm then
                            AutoEctoplasm = game:GetService("Workspace").Enemies:FindFirstChild("Ship Officer")
                            if AutoEctoplasm then
                                AutoEctoplasm = pairs
                                for I, I2 in AutoEctoplasm(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if I2.Name == "Ship Deckhand" or I2.Name == "Ship Engineer" or I2.Name == "Ship Steward" or I2.Name == "Ship Officer" then
                                        while true do
                                            task.wait()
                                            Function32(_G.SelectWeapon)
                                            Function30()
                                            if string.find(I2.Name, "Ship") then
                                                I2.HumanoidRootPart.CanCollide = false
                                                I2.Head.CanCollide = false
                                                I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                                Function35(I2.HumanoidRootPart.CFrame * R03664)
                                                game:GetService("VirtualUser"):CaptureController()
                                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                                CFrame46 = I2.HumanoidRootPart.CFrame
                                                local AutoEctoplasm2 = true
                                                Flag126 = AutoEctoplasm2
                                            else
                                                Flag126 = false
                                                Function35(CFrame.new(911.358276367190001, 125.958129882809999, 33159.5390625))
                                            end
                                            local AutoEctoplasm2 = _G.AutoEctoplasm
                                            if AutoEctoplasm2 ~= false then
                                                AutoEctoplasm2 = I2.Parent
                                                if AutoEctoplasm2 then
                                                    AutoEctoplasm2 = I2.Humanoid.Health
                                                    if AutoEctoplasm2 <= 0 then
                                                        break
                                                    end
                                                else
                                                    break
                                                end
                                            else
                                                break
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                else
                    -- empty block
                end
                Function35(v.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                Flag126 = false
                AutoEctoplasm = Vector3.new(911.358276367190001, 125.958129882809999, 33159.5390625)
                AutoEctoplasm = (AutoEctoplasm - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                if AutoEctoplasm > 18000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.212524414059999, 126.9760055542, 32852.83203125))
                end
                Function35(CFrame.new(911.358276367190001, 125.958129882809999, 33159.5390625))
            end
        end
    end)
end)
Tab4:Seperator("Auto Sword")
Tab4:Toggle("Auto Buddy Sword", false, function(Param)
    _G.AutoBudySword = Param
    Function38(_G.AutoBudySword)
end)
local Inst24 = CFrame.new(-731.20343017578125, 381.565887451171875, -11198.4951171875)
spawn(function()
    while wait() do
        local AutoBudySword = _G.AutoBudySword
        if AutoBudySword then
            AutoBudySword = Flag3
            if AutoBudySword then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen") then
                        for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if I2.Name == "Cake Queen" and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                                while true do
                                    task.wait()
                                    Function30()
                                    Function32(_G.SelectWeapon)
                                    I2.HumanoidRootPart.CanCollide = false
                                    I2.Humanoid.WalkSpeed = 0
                                    I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    Function35(I2.HumanoidRootPart.CFrame * R03664)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                    if _G.AutoBudySword then
                                        local Parent = I2.Parent
                                        if Parent then
                                            Parent = I2.Humanoid.Health
                                            if Parent <= 0 then
                                                break
                                            end
                                        else
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                            end
                        end
                    else
                        if R0216 then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst24.Position).Magnitude > 1500 then
                                Function33(Inst24)
                            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst24.Position).Magnitude < 1500 then
                                Function35(Inst24)
                            end
                        else
                            Function35(Inst24)
                        end
                        Function31(_G.SelectWeapon)
                        Function35(CFrame.new(-731.20343017578125, 381.565887451171875, -11198.4951171875))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Queen") then
                            Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Queen").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        elseif _G.AutoBudySwordHop then
                            Function3()
                        end
                    end
                end)
            end
        end
    end
end)
Tab4:Toggle("Auto Tushita", false, function(Param)
    _G.Autotushita = Param
    Function38(_G.Autotushita)
end)
local Inst25 = CFrame.new(-10238.875976563000222, 389.791290283199999, -9549.7939453125)
spawn(function()
    while wait() do
        local Autotushita = _G.Autotushita
        if Autotushita then
            Autotushita = Flag3
            if Autotushita then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Longma") then
                        for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if I2.Name == "Longma" and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                                while true do
                                    task.wait()
                                    Function30()
                                    Function32(_G.SelectWeapon)
                                    I2.HumanoidRootPart.CanCollide = false
                                    I2.Humanoid.WalkSpeed = 0
                                    I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    Function35(I2.HumanoidRootPart.CFrame * R03664)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                    if _G.Autotushita then
                                        local Parent = I2.Parent
                                        if Parent then
                                            Parent = I2.Humanoid.Health
                                            if Parent <= 0 then
                                                break
                                            end
                                        else
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                            end
                        end
                    else
                        if R0216 then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst25.Position).Magnitude > 1500 then
                                Function33(Inst25)
                            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst25.Position).Magnitude < 1500 then
                                Function35(Inst25)
                            end
                        else
                            Function35(Inst25)
                        end
                        Function31(_G.SelectWeapon)
                        Function35(CFrame.new(-10238.875976563000222, 389.791290283199999, -9549.7939453125))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Longma") then
                            Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Longma").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        elseif _G.Autotushitahop then
                            Function3()
                        end
                    end
                end)
            end
        end
    end
end)
Tab4:Toggle("Auto Yama", false, function(Param)
    _G.AutoYama = Param
    Function38(_G.AutoYama)
end)
spawn(function()
    while wait() do
        local AutoYama = _G.AutoYama
        if AutoYama then
            AutoYama = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter", "Progress")
            if AutoYama >= 30 then
                wait(0.1)
                fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector)
                AutoYama = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Yama")
                if not AutoYama then
                    AutoYama = _G.AutoYama
                    if AutoYama then
                        break
                    end
                end
            end
        end
    end
end)
Tab4:Toggle("Auto Cavander", false, function(Param)
    _G.AutoCarvender = Param
    Function38(_G.AutoCarvender)
end)
local Inst26 = CFrame.new(5311.07421875, 426.024383544921875, 165.12762451171875)
spawn(function()
    while wait() do
        local AutoCarvender = _G.AutoCarvender
        if AutoCarvender then
            AutoCarvender = Flag3
            if AutoCarvender then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate") then
                        for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if I2.Name == "Beautiful Pirate" and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                                while true do
                                    task.wait()
                                    Function30()
                                    Function32(_G.SelectWeapon)
                                    I2.HumanoidRootPart.CanCollide = false
                                    I2.Humanoid.WalkSpeed = 0
                                    I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    Function35(I2.HumanoidRootPart.CFrame * R03664)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                    if _G.AutoCarvender then
                                        local Parent = I2.Parent
                                        if Parent then
                                            Parent = I2.Humanoid.Health
                                            if Parent <= 0 then
                                                break
                                            end
                                        else
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                            end
                        end
                    else
                        if R0216 then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst26.Position).Magnitude > 1500 then
                                Function33(Inst26)
                            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst26.Position).Magnitude < 1500 then
                                Function35(Inst26)
                            end
                        else
                            Function35(Inst26)
                        end
                        Function31(_G.SelectWeapon)
                        Function35(CFrame.new(5311.07421875, 426.024383544921875, 165.12762451171875))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Beautiful Pirate") then
                            Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Beautiful Pirate").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        elseif _G.AutoCavanderhop then
                            Function3()
                        end
                    end
                end)
            end
        end
    end
end)
Tab4:Toggle("Auto Twin Hook", false, function(Param)
    _G.AutoTwinHook = Param
    Function38(_G.AutoTwinHook)
end)
local Inst27 = CFrame.new(-13348.0654296875, 405.890411376953125, -8570.62890625)
spawn(function()
    while wait() do
        local AutoTwinHook = _G.AutoTwinHook
        if AutoTwinHook then
            AutoTwinHook = Flag3
            if AutoTwinHook then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant") then
                        for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if I2.Name == "Captain Elephant" and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                                while true do
                                    task.wait()
                                    Function30()
                                    Function32(_G.SelectWeapon)
                                    I2.HumanoidRootPart.CanCollide = false
                                    I2.Humanoid.WalkSpeed = 0
                                    I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    Function35(I2.HumanoidRootPart.CFrame * R03664)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                    if _G.AutoTwinHook then
                                        local Parent = I2.Parent
                                        if Parent then
                                            Parent = I2.Humanoid.Health
                                            if Parent <= 0 then
                                                break
                                            end
                                        else
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                            end
                        end
                    else
                        if R0216 then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst27.Position).Magnitude > 1500 then
                                Function33(Inst27)
                            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst27.Position).Magnitude < 1500 then
                                Function35(Inst27)
                            end
                        else
                            Function35(Inst27)
                        end
                        Function31(_G.SelectWeapon)
                        Function35(CFrame.new(-13348.0654296875, 405.890411376953125, -8570.62890625))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Captain Elephant") then
                            Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Captain Elephant").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        elseif _G.AutoTwinHook_Hop then
                            Function3()
                        end
                    end
                end)
            end
        end
    end
end)
Tab4:Toggle("Auto Hallow Scythe", false, function(Param)
    _G.AutoFarmBossHallow = Param
    Function38(_G.AutoFarmBossHallow)
end)
spawn(function()
    while wait() do
        local AutoFarmBossHallow = _G.AutoFarmBossHallow
        if AutoFarmBossHallow then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") then
                    for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if string.find(I2.Name, "Soul Reaper") then
                            while true do
                                task.wait()
                                Function32(_G.SelectWeapon)
                                Function30()
                                I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                Function35(I2.HumanoidRootPart.CFrame * R03664)
                                game:GetService("VirtualUser"):CaptureController()
                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 670))
                                I2.HumanoidRootPart.Transparency = 1
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                if I2.Humanoid.Health > 0 then
                                    local AutoFarmBossHallow2 = _G.AutoFarmBossHallow
                                    if AutoFarmBossHallow2 == false then
                                        break
                                    end
                                else
                                    break
                                end
                            end
                        end
                    end
                elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hallow Essence") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Hallow Essence") then
                    repeat
                        Function35(CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125))
                        wait()
                    until (CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 8
                    Function32("Hallow Essence")
                elseif game:GetService("ReplicatedStorage"):FindFirstChild("Soul Reaper") then
                    Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Soul Reaper").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                elseif _G.AutoFarmBossHallowHop then
                    Function3()
                end
            end)
        end
    end
end)
Tab4:Toggle("Auto Dragon Trident", false, function(Param)
    _G.Auto_Dragon_Trident = Param
    Function38(_G.Auto_Dragon_Trident)
end)
local Inst28 = CFrame.new(-3914.830322265625, 123.293891906738281, -11516.8642578125)
spawn(function()
    while wait() do
        local AutoDragonTrident = _G.Auto_Dragon_Trident
        if AutoDragonTrident then
            AutoDragonTrident = Flag2
            if AutoDragonTrident then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Tide Keeper") then
                        for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if I2.Name == "Tide Keeper" and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                                while true do
                                    task.wait()
                                    Function30()
                                    Function32(_G.SelectWeapon)
                                    I2.HumanoidRootPart.CanCollide = false
                                    I2.Humanoid.WalkSpeed = 0
                                    I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    Function35(I2.HumanoidRootPart.CFrame * R03664)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                    if _G.Auto_Dragon_Trident then
                                        local Parent = I2.Parent
                                        if Parent then
                                            Parent = I2.Humanoid.Health
                                            if Parent <= 0 then
                                                break
                                            end
                                        else
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                            end
                        end
                    else
                        if R0216 then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst28.Position).Magnitude > 1500 then
                                Function33(Inst28)
                            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst28.Position).Magnitude < 1500 then
                                Function35(Inst28)
                            end
                        else
                            Function35(Inst28)
                        end
                        Function31(_G.SelectWeapon)
                        Function35(CFrame.new(-3914.830322265625, 123.293891906738281, -11516.8642578125))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Tide Keeper") then
                            Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Tide Keeper").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        elseif _G.Auto_Dragon_Trident_Hop then
                            Function3()
                        end
                    end
                end)
            end
        end
    end
end)
Tab4:Toggle("Auto Waden Sword", false, function(Param)
    _G.Autowaden = Param
    Function38(_G.Autowaden)
end)
local Inst29 = CFrame.new(5186.14697265625, 24.866842269897461, 832.18853759765625)
spawn(function()
    while wait() do
        local Autowaden = _G.Autowaden
        if Autowaden then
            Autowaden = Flag
            if Autowaden then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Chief Warden") then
                        for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if I2.Name == "Chief Warden" and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                                while true do
                                    task.wait()
                                    Function30()
                                    Function32(_G.SelectWeapon)
                                    I2.HumanoidRootPart.CanCollide = false
                                    I2.Humanoid.WalkSpeed = 0
                                    I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    Function35(I2.HumanoidRootPart.CFrame * R03664)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                    if _G.Autowaden then
                                        local Parent = I2.Parent
                                        if Parent then
                                            Parent = I2.Humanoid.Health
                                            if Parent <= 0 then
                                                break
                                            end
                                        else
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                            end
                        end
                    else
                        if R0216 then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst28.Position).Magnitude > 1500 then
                                Function33(Inst28)
                            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst28.Position).Magnitude < 1500 then
                                Function35(Inst28)
                            end
                        else
                            Function35(Inst28)
                        end
                        Function31(_G.SelectWeapon)
                        Function35(CFrame.new(5186.14697265625, 24.866842269897461, 832.18853759765625))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Chief Warden") then
                            Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Chief Warden").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        elseif _G.Autowadenhop then
                            Function3()
                        end
                    end
                end)
            end
        end
    end
end)
Tab4:Toggle("Auto Pole V1", false, function(Param)
    _G.Autopole = Param
    Function38(_G.Autopole)
end)
local Inst30 = CFrame.new(-7748.0185546875, 5606.80615234375, -2305.898681640625)
spawn(function()
    while wait() do
        local Autopole = _G.Autopole
        if Autopole then
            Autopole = Flag
            if Autopole then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Thunder God") then
                        for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if I2.Name == "Thunder God" and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                                while true do
                                    task.wait()
                                    Function30()
                                    Function32(_G.SelectWeapon)
                                    I2.HumanoidRootPart.CanCollide = false
                                    I2.Humanoid.WalkSpeed = 0
                                    I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    Function35(I2.HumanoidRootPart.CFrame * R03664)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                    if _G.Autopole then
                                        local Parent = I2.Parent
                                        if Parent then
                                            Parent = I2.Humanoid.Health
                                            if Parent <= 0 then
                                                break
                                            end
                                        else
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                            end
                        end
                    else
                        if R0216 then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst30.Position).Magnitude > 1500 then
                                Function33(Inst30)
                            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst30.Position).Magnitude < 1500 then
                                Function35(Inst30)
                            end
                        else
                            Function35(Inst28)
                        end
                        Function31(_G.SelectWeapon)
                        Function35(CFrame.new(-7748.0185546875, 5606.80615234375, -2305.898681640625))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God") then
                            Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        elseif _G.Autopolehop then
                            Function3()
                        end
                    end
                end)
            end
        end
    end
end)
Tab4:Toggle("Auto Shark Saw", false, function(Param)
    _G.Autosaw = Param
    Function38(_G.Autosaw)
end)
local Inst31 = CFrame.new(-690.330810546880002, 15.09425163269, 1582.238037109400011)
spawn(function()
    while wait() do
        local Autosaw = _G.Autosaw
        if Autosaw then
            Autosaw = Flag
            if Autosaw then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("The Saw") then
                        for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if I2.Name == "The Saw" and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                                while true do
                                    task.wait()
                                    Function30()
                                    Function32(_G.SelectWeapon)
                                    I2.HumanoidRootPart.CanCollide = false
                                    I2.Humanoid.WalkSpeed = 0
                                    I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    Function35(I2.HumanoidRootPart.CFrame * R03664)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                    if _G.Autosaw then
                                        local Parent = I2.Parent
                                        if Parent then
                                            Parent = I2.Humanoid.Health
                                            if Parent <= 0 then
                                                break
                                            end
                                        else
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                            end
                        end
                    else
                        if R0216 then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst31.Position).Magnitude > 1500 then
                                Function33(Inst31)
                            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Inst31.Position).Magnitude < 1500 then
                                Function35(Inst31)
                            end
                        else
                            Function35(Inst31)
                        end
                        Function31(_G.SelectWeapon)
                        Function35(CFrame.new(-690.330810546880002, 15.09425163269, 1582.238037109400011))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("The Saw") then
                            Function35(game:GetService("ReplicatedStorage"):FindFirstChild("The Saw").HumanoidRootPart.CFrame * CFrame.new(2, 40, 2))
                        elseif _G.Autosawhop then
                            Function3()
                        end
                    end
                end)
            end
        end
    end
end)
Tab4:Toggle("Auto Saber", false, function(Param)
    _G.Auto_Saber = Param
    Function38(_G.Auto_Saber)
end)
spawn(function()
    while task.wait() do
        local AutoSaber = _G.Auto_Saber
        if AutoSaber then
            AutoSaber = game.Players.LocalPlayer.Data.Level.Value
            if AutoSaber >= 200 then
                pcall(function()
                    if game:GetService("Workspace").Map.Jungle.Final.Part.Transparency == 0 then
                        if game:GetService("Workspace").Map.Jungle.QuestPlates.Door.Transparency == 0 then
                            if (CFrame.new(-1612.558839999999918, 36.977413200000001, 148.719542999999987, 0.37091279, 0.000000003071715, -0.928667724, 0.000000039709949, 1, 0.000000019167935, 0.928667724, -0.000000043986979, 0.37091279).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then
                                Function35(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                                wait(1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate1.Button.CFrame
                                wait(1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate2.Button.CFrame
                                wait(1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate3.Button.CFrame
                                wait(1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate4.Button.CFrame
                                wait(1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate5.Button.CFrame
                                wait(1)
                            else
                                Function35(CFrame.new(-1612.558839999999918, 36.977413200000001, 148.719542999999987, 0.37091279, 0.000000003071715, -0.928667724, 0.000000039709949, 1, 0.000000019167935, 0.928667724, -0.000000043986979, 0.37091279))
                            end
                        elseif game:GetService("Workspace").Map.Desert.Burn.Part.Transparency == 0 then
                            if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Torch") then
                                Function32("Torch")
                                Function35(CFrame.new(1114.614749999999958, 5.04679728, 4350.228030000000217, -0.648466587, -0.000000001287991, 0.761243105, -0.000000000570653, 1, 0.000000001205845, -0.761243105, 0.000000000347545, -0.648466587))
                            else
                                Function35(CFrame.new(-1610.007569999999987, 11.5049858, 164.001587000000001, 0.984807551, -0.167722285, -0.0449818149, 0.17364943, 0.951244235, 0.254912198, 0.0000342372805, -0.258850515, 0.965917408))
                            end
                        elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan") ~= 0 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "GetCup")
                            wait(0.5)
                            Function32("Cup")
                            wait(0.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "FillCup", game:GetService("Players").LocalPlayer.Character.Cup)
                            wait(0)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan")
                        elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == nil then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
                        elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == 0 and (game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader") or game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader")) then
                            Function35(CFrame.new(-2967.595209999999952, -4.91089821, 5328.707029999999577, 0.342208564, -0.0227849055, 0.939347804, 0.0251603816, 0.999569714, 0.0150796166, -0.939287126, 0.0184739735, 0.342634559))
                            for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if I2.Name == "Mob Leader" then
                                    if game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader [Lv. 120] [Boss]") and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                                        while true do
                                            task.wait()
                                            Function30()
                                            Function32(_G.SelectWeapon)
                                            I2.HumanoidRootPart.CanCollide = false
                                            I2.Humanoid.WalkSpeed = 0
                                            I2.HumanoidRootPart.Size = Vector3.new(80, 80, 80)
                                            Function35(I2.HumanoidRootPart.CFrame * R03664)
                                            game:GetService("VirtualUser"):CaptureController()
                                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                            sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                            if I2.Humanoid.Health > 0 then
                                                local AutoSaber2 = _G.Auto_Saber
                                                if not AutoSaber2 then
                                                    break
                                                end
                                            else
                                                break
                                            end
                                        end
                                    end
                                    if game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader") then
                                        Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader").HumanoidRootPart.CFrame * Farm_Mode)
                                    end
                                end
                            end
                        elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == 1 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
                            wait(0.5)
                            Function32("Relic")
                            wait(0.5)
                            Function35(CFrame.new(-1404.91504000000009, 29.977327299999999, 3.80598116, 0.876514494, 0.000000005669069, 0.481375456, 0.0000000253852, 1, -0.000000057999561, -0.481375456, 0.000000063057264, 0.876514494))
                        end
                    elseif game:GetService("Workspace").Enemies:FindFirstChild("Saber Expert") or game:GetService("ReplicatedStorage"):FindFirstChild("Saber Expert") then
                        for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health and I2.Name == "Saber Expert" then
                                while true do
                                    task.wait()
                                    Function32(_G.SelectWeapon)
                                    Function35(I2.HumanoidRootPart.CFrame * R03664)
                                    I2.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    I2.HumanoidRootPart.Transparency = 1
                                    I2.Humanoid.JumpPower = 0
                                    I2.Humanoid.WalkSpeed = 0
                                    I2.HumanoidRootPart.CanCollide = false
                                    CFrame47 = I2.HumanoidRootPart.CFrame
                                    Name2 = I2.Name
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672), workspace.CurrentCamera.CFrame)
                                    if I2.Humanoid.Health > 0 then
                                        local AutoSaber2 = _G.Auto_Saber
                                        if not AutoSaber2 then
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                                if I2.Humanoid.Health <= 0 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "PlaceRelic")
                                end
                            end
                        end
                    end
                end)
            end
        end
    end
end)
Tab4:Toggle("Auto Rengoku", false, function(Param)
    _G.AutoRengoku = Param
    Function38(_G.AutoRengoku)
end)
spawn(function()
    pcall(function()
        while wait() do
            local AutoRengoku = _G.AutoRengoku
            if AutoRengoku then
                AutoRengoku = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hidden Key")
                if not AutoRengoku then
                    AutoRengoku = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Hidden Key")
                    if AutoRengoku then
                        Function32("Hidden Key")
                        Function35(CFrame.new(6571.1201171875, 299.230285644529999, -6967.841796875))
                    end
                else
                    -- empty block
                end
                AutoRengoku = game:GetService("Workspace").Enemies:FindFirstChild("Snow Lurker")
                if not AutoRengoku then
                    AutoRengoku = game:GetService("Workspace").Enemies:FindFirstChild("Arctic Warrior")
                    if AutoRengoku then
                        AutoRengoku = pairs
                        for I, I2 in AutoRengoku(game:GetService("Workspace").Enemies:GetChildren()) do
                            if (I2.Name == "Snow Lurker" or I2.Name == "Arctic Warrior") and 0 < I2.Humanoid.Health then
                                while true do
                                    task.wait()
                                    Function32(_G.SelectWeapon)
                                    Function30()
                                    I2.HumanoidRootPart.CanCollide = false
                                    I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    CFrame48 = I2.HumanoidRootPart.CFrame
                                    Function35(I2.HumanoidRootPart.CFrame * R03664)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    Flag129 = true
                                    if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hidden Key") then
                                        local AutoRengoku2 = _G.AutoRengoku
                                        if AutoRengoku2 ~= false then
                                            AutoRengoku2 = I2.Parent
                                            if AutoRengoku2 then
                                                AutoRengoku2 = I2.Humanoid.Health
                                                if AutoRengoku2 <= 0 then
                                                    break
                                                end
                                            else
                                                break
                                            end
                                        else
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                                Flag129 = false
                            end
                        end
                    end
                else
                    -- empty block
                end
                Flag129 = false
                Function35(CFrame.new(5439.716796875, 84.420944213867003, -6715.163574218800022))
            end
        end
    end)
end)
Tab4:Seperator("Auto Melee")
Tab4:Toggle("Auto Superhuman", false, function(Param)
    _G.AutoSuperhuman = Param
end)
spawn(function()
    pcall(function()
        while wait() do
            local AutoSuperhuman = _G.AutoSuperhuman
            if AutoSuperhuman then
                AutoSuperhuman = game.Players.LocalPlayer.Backpack:FindFirstChild("Combat")
                if not AutoSuperhuman then
                    AutoSuperhuman = game.Players.LocalPlayer.Character:FindFirstChild("Combat")
                    if AutoSuperhuman then
                        AutoSuperhuman = game:GetService("Players").LocalPlayer.Data.Beli.Value
                        if AutoSuperhuman >= 150000 then
                            Function31("Combat")
                            wait(0.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
                        end
                    end
                else
                    -- empty block
                end
                AutoSuperhuman = game.Players.LocalPlayer.Character:FindFirstChild("Superhuman")
                if not AutoSuperhuman then
                    AutoSuperhuman = game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman")
                    if AutoSuperhuman then
                        AutoSuperhuman = _G
                        AutoSuperhuman.SelectWeapon = "Superhuman"
                    end
                else
                    -- empty block
                end
                AutoSuperhuman = game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg")
                if not AutoSuperhuman then
                    AutoSuperhuman = game.Players.LocalPlayer.Character:FindFirstChild("Black Leg")
                    if not AutoSuperhuman then
                        AutoSuperhuman = game.Players.LocalPlayer.Backpack:FindFirstChild("Electro")
                        if not AutoSuperhuman then
                            AutoSuperhuman = game.Players.LocalPlayer.Character:FindFirstChild("Electro")
                            if not AutoSuperhuman then
                                AutoSuperhuman = game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate")
                                if not AutoSuperhuman then
                                    AutoSuperhuman = game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate")
                                    if not AutoSuperhuman then
                                        AutoSuperhuman = game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw")
                                        if not AutoSuperhuman then
                                            AutoSuperhuman = game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw")
                                            if not AutoSuperhuman then
                                                -- empty block
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                AutoSuperhuman = game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg")
                if AutoSuperhuman then
                    AutoSuperhuman = game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value
                    if AutoSuperhuman <= 299 then
                        AutoSuperhuman = _G
                        AutoSuperhuman.SelectWeapon = "Black Leg"
                    end
                end
                AutoSuperhuman = game.Players.LocalPlayer.Backpack:FindFirstChild("Electro")
                if AutoSuperhuman then
                    AutoSuperhuman = game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value
                    if AutoSuperhuman <= 299 then
                        AutoSuperhuman = _G
                        AutoSuperhuman.SelectWeapon = "Electro"
                    end
                end
                AutoSuperhuman = game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate")
                if AutoSuperhuman then
                    AutoSuperhuman = game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value
                    if AutoSuperhuman <= 299 then
                        AutoSuperhuman = _G
                        AutoSuperhuman.SelectWeapon = "Fishman Karate"
                    end
                end
                AutoSuperhuman = game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw")
                if AutoSuperhuman then
                    AutoSuperhuman = game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value
                    if AutoSuperhuman <= 299 then
                        AutoSuperhuman = _G
                        AutoSuperhuman.SelectWeapon = "Dragon Claw"
                    end
                end
                AutoSuperhuman = game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg")
                if AutoSuperhuman then
                    AutoSuperhuman = game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value
                    if AutoSuperhuman >= 300 then
                        AutoSuperhuman = game:GetService("Players").LocalPlayer.Data.Beli.Value
                        if AutoSuperhuman >= 300000 then
                            Function31("Black Leg")
                            wait(0.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
                        end
                    end
                end
                AutoSuperhuman = game.Players.LocalPlayer.Character:FindFirstChild("Black Leg")
                if AutoSuperhuman then
                    AutoSuperhuman = game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value
                    if AutoSuperhuman >= 300 then
                        AutoSuperhuman = game:GetService("Players").LocalPlayer.Data.Beli.Value
                        if AutoSuperhuman >= 300000 then
                            Function31("Black Leg")
                            wait(0.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
                        end
                    end
                end
                AutoSuperhuman = game.Players.LocalPlayer.Backpack:FindFirstChild("Electro")
                if AutoSuperhuman then
                    AutoSuperhuman = game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value
                    if AutoSuperhuman >= 300 then
                        AutoSuperhuman = game:GetService("Players").LocalPlayer.Data.Beli.Value
                        if AutoSuperhuman >= 750000 then
                            Function31("Electro")
                            wait(0.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                        end
                    end
                end
                AutoSuperhuman = game.Players.LocalPlayer.Character:FindFirstChild("Electro")
                if AutoSuperhuman then
                    AutoSuperhuman = game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value
                    if AutoSuperhuman >= 300 then
                        AutoSuperhuman = game:GetService("Players").LocalPlayer.Data.Beli.Value
                        if AutoSuperhuman >= 750000 then
                            Function31("Electro")
                            wait(0.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                        end
                    end
                end
                AutoSuperhuman = game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate")
                if AutoSuperhuman then
                    AutoSuperhuman = game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value
                    if AutoSuperhuman >= 300 then
                        AutoSuperhuman = game:GetService("Players").Localplayer.Data.Fragments.Value
                        if AutoSuperhuman >= 1500 then
                            Function31("Fishman Karate")
                            wait(0.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1")
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
                        end
                    end
                end
                AutoSuperhuman = game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate")
                if AutoSuperhuman then
                    AutoSuperhuman = game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value
                    if AutoSuperhuman >= 300 then
                        AutoSuperhuman = game:GetService("Players").Localplayer.Data.Fragments.Value
                        if AutoSuperhuman >= 1500 then
                            Function31("Fishman Karate")
                            wait(0.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1")
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
                        end
                    end
                end
                AutoSuperhuman = game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw")
                if AutoSuperhuman then
                    AutoSuperhuman = game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value
                    if AutoSuperhuman >= 300 then
                        AutoSuperhuman = game:GetService("Players").LocalPlayer.Data.Beli.Value
                        if AutoSuperhuman >= 3000000 then
                            Function31("Dragon Claw")
                            wait(0.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
                        end
                    end
                end
                AutoSuperhuman = game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw")
                if AutoSuperhuman then
                    AutoSuperhuman = game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value
                    if AutoSuperhuman >= 300 then
                        AutoSuperhuman = game:GetService("Players").LocalPlayer.Data.Beli.Value
                        if AutoSuperhuman >= 3000000 then
                            Function31("Dragon Claw")
                            wait(0.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
                        end
                    end
                end
            end
        end
    end)
end)
Tab4:Toggle("Auto Death Step", false, function(Param)
    _G.AutoDeathStep = Param
end)
spawn(function()
    while wait() do
        wait()
        local AutoDeathStep = _G.AutoDeathStep
        if AutoDeathStep then
            AutoDeathStep = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg")
            if not AutoDeathStep then
                AutoDeathStep = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Black Leg")
                if not AutoDeathStep then
                    AutoDeathStep = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Death Step")
                    if not AutoDeathStep then
                        AutoDeathStep = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Death Step")
                        if AutoDeathStep then
                            AutoDeathStep = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg")
                            if AutoDeathStep then
                                AutoDeathStep = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value
                                if AutoDeathStep >= 450 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
                                    AutoDeathStep = _G
                                    AutoDeathStep.SelectWeapon = "Death Step"
                                end
                            end
                            AutoDeathStep = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Black Leg")
                            if AutoDeathStep then
                                AutoDeathStep = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value
                                if AutoDeathStep >= 450 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
                                    AutoDeathStep = _G
                                    AutoDeathStep.SelectWeapon = "Death Step"
                                end
                            end
                            AutoDeathStep = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg")
                            if AutoDeathStep then
                                AutoDeathStep = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value
                                if AutoDeathStep <= 449 then
                                    AutoDeathStep = _G
                                    AutoDeathStep.SelectWeapon = "Black Leg"
                                end
                            end
                        end
                    end
                end
            else
                -- empty block
            end
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
        end
    end
end)
Tab4:Toggle("Auto Sharkman Karate", false, function(Param)
    _G.AutoSharkman = Param
end)
spawn(function()
    pcall(function()
        while wait() do
            local AutoSharkman = _G.AutoSharkman
            if AutoSharkman then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                AutoSharkman = string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate"), "keys")
                if AutoSharkman then
                    AutoSharkman = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Water Key")
                    if not AutoSharkman then
                        AutoSharkman = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Water Key")
                        if AutoSharkman then
                            Function35(CFrame.new(-2604.695799999999963, 239.432525999999996, -10315.198200000000725, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365))
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
                        end
                    else
                        -- empty block
                    end
                    AutoSharkman = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishman Karate")
                    if AutoSharkman then
                        AutoSharkman = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value
                        if AutoSharkman >= 400 then
                            -- empty block
                        end
                    end
                    String256 = "Tide Keeper"
                    AutoSharkman = game:GetService("Workspace").Enemies:FindFirstChild(String256)
                    if AutoSharkman then
                        AutoSharkman = pairs
                        for I, I2 in AutoSharkman(game:GetService("Workspace").Enemies:GetChildren()) do
                            if I2.Name == String256 then
                                CFrame50 = I2.HumanoidRootPart.CFrame
                                while true do
                                    task.wait()
                                    Function30()
                                    Function32(_G.SelectWeapon)
                                    I2.Head.CanCollide = false
                                    I2.Humanoid.WalkSpeed = 0
                                    I2.HumanoidRootPart.CanCollide = false
                                    I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    I2.HumanoidRootPart.CFrame = CFrame50
                                    Function35(I2.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 670))
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                    if I2.Parent then
                                        local Health = I2.Humanoid.Health
                                        if Health > 0 then
                                            Health = _G.AutoSharkman
                                            if Health ~= false then
                                                Health = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Water Key")
                                                if not Health then
                                                    Health = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Water Key")
                                                    if Health then
                                                        break
                                                    end
                                                else
                                                    break
                                                end
                                            else
                                                break
                                            end
                                        else
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                            end
                        end
                    else
                        Function35(CFrame.new(-3570.186520000000201, 123.328948999999994, -11555.907199999999648, 0.465199202, -0.000000013857326, 0.885206044, 0.00000000403329, 1, 0.000000013534751, -0.885206044, -0.000000002726063, 0.465199202))
                        wait(3)
                    end
                else
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
                end
            end
        end
    end)
end)
Tab4:Toggle("Auto Sharkman Karate", false, function(Param)
    _G.AutoSharkman = Param
end)
spawn(function()
    pcall(function()
        while wait() do
            local AutoSharkman = _G.AutoSharkman
            if AutoSharkman then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                AutoSharkman = string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate"), "keys")
                if AutoSharkman then
                    AutoSharkman = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Water Key")
                    if not AutoSharkman then
                        AutoSharkman = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Water Key")
                        if AutoSharkman then
                            Function35(CFrame.new(-2604.695799999999963, 239.432525999999996, -10315.198200000000725, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365))
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
                        end
                    else
                        -- empty block
                    end
                    AutoSharkman = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishman Karate")
                    if AutoSharkman then
                        AutoSharkman = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value
                        if AutoSharkman >= 400 then
                            -- empty block
                        end
                    end
                    String256 = "Tide Keeper"
                    AutoSharkman = game:GetService("Workspace").Enemies:FindFirstChild(String256)
                    if AutoSharkman then
                        AutoSharkman = pairs
                        for I, I2 in AutoSharkman(game:GetService("Workspace").Enemies:GetChildren()) do
                            if I2.Name == String256 then
                                CFrame50 = I2.HumanoidRootPart.CFrame
                                while true do
                                    task.wait()
                                    Function30()
                                    Function32(_G.SelectWeapon)
                                    I2.Head.CanCollide = false
                                    I2.Humanoid.WalkSpeed = 0
                                    I2.HumanoidRootPart.CanCollide = false
                                    I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    I2.HumanoidRootPart.CFrame = CFrame50
                                    Function35(I2.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 670))
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                    if I2.Parent then
                                        local Health = I2.Humanoid.Health
                                        if Health > 0 then
                                            Health = _G.AutoSharkman
                                            if Health ~= false then
                                                Health = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Water Key")
                                                if not Health then
                                                    Health = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Water Key")
                                                    if Health then
                                                        break
                                                    end
                                                else
                                                    break
                                                end
                                            else
                                                break
                                            end
                                        else
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                            end
                        end
                    else
                        Function35(CFrame.new(-3570.186520000000201, 123.328948999999994, -11555.907199999999648, 0.465199202, -0.000000013857326, 0.885206044, 0.00000000403329, 1, 0.000000013534751, -0.885206044, -0.000000002726063, 0.465199202))
                        wait(3)
                    end
                else
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
                end
            end
        end
    end)
end)
Tab4:Toggle("Auto Electric Claw", false, function(Param)
    _G.AutoElectricClaw = Param
    Function38(_G.AutoElectricClaw)
end)
spawn(function()
    pcall(function()
        while wait() do
            local AutoElectricClaw = _G.AutoElectricClaw
            if AutoElectricClaw then
                AutoElectricClaw = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro")
                if not AutoElectricClaw then
                    AutoElectricClaw = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro")
                    if not AutoElectricClaw then
                        AutoElectricClaw = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electric Claw")
                        if not AutoElectricClaw then
                            AutoElectricClaw = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electric Claw")
                            if AutoElectricClaw then
                                AutoElectricClaw = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro")
                                if AutoElectricClaw then
                                    AutoElectricClaw = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value
                                    if AutoElectricClaw >= 400 then
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
                                        AutoElectricClaw = _G
                                        AutoElectricClaw.SelectWeapon = "Electric Claw"
                                    end
                                end
                                AutoElectricClaw = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro")
                                if AutoElectricClaw then
                                    AutoElectricClaw = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro").Level.Value
                                    if AutoElectricClaw >= 400 then
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
                                        AutoElectricClaw = _G
                                        AutoElectricClaw.SelectWeapon = "Electric Claw"
                                    end
                                end
                                AutoElectricClaw = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro")
                                if AutoElectricClaw then
                                    AutoElectricClaw = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value
                                    if AutoElectricClaw <= 399 then
                                        AutoElectricClaw = _G
                                        AutoElectricClaw.SelectWeapon = "Electro"
                                    end
                                end
                            else
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
                            end
                        end
                    end
                else
                    -- empty block
                end
            end
            AutoElectricClaw = _G.AutoElectricClaw
            if AutoElectricClaw then
                AutoElectricClaw = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro")
                if not AutoElectricClaw then
                    AutoElectricClaw = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro")
                    if not AutoElectricClaw then
                        -- empty block
                    end
                end
                AutoElectricClaw = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro")
                if not AutoElectricClaw then
                    AutoElectricClaw = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro")
                    if AutoElectricClaw then
                        AutoElectricClaw = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value
                        if AutoElectricClaw < 400 then
                            AutoElectricClaw = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro").Level.Value
                            if AutoElectricClaw < 400 then
                                -- empty block
                            end
                        end
                    else
                        -- empty block
                    end
                end
                AutoElectricClaw = _G.AutoFarm
                if AutoElectricClaw == false then
                    while true do
                        task.wait()
                        Function35(CFrame.new(-10371.471700000000055, 330.764496000000008, -10131.41990000000078))
                        AutoElectricClaw = _G.AutoElectricClaw
                        if AutoElectricClaw then
                            AutoElectricClaw = (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-10371.471700000000055, 330.764496000000008, -10131.41990000000078).Position).Magnitude
                            if AutoElectricClaw <= 10 then
                                break
                            end
                        else
                            break
                        end
                    end
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw", "Start")
                    wait(2)
                    while true do
                        task.wait()
                        Function35(CFrame.new(-12550.532226563000222, 336.226318359380002, -7510.423339843800022))
                        AutoElectricClaw = _G.AutoElectricClaw
                        if AutoElectricClaw then
                            AutoElectricClaw = (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-12550.532226563000222, 336.226318359380002, -7510.423339843800022).Position).Magnitude
                            if AutoElectricClaw <= 10 then
                                break
                            end
                        else
                            break
                        end
                    end
                    wait(1)
                    while true do
                        task.wait()
                        Function35(CFrame.new(-10371.471700000000055, 330.764496000000008, -10131.41990000000078))
                        AutoElectricClaw = _G.AutoElectricClaw
                        if AutoElectricClaw then
                            AutoElectricClaw = (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-10371.471700000000055, 330.764496000000008, -10131.41990000000078).Position).Magnitude
                            if AutoElectricClaw <= 10 then
                                break
                            end
                        else
                            break
                        end
                    end
                    wait(1)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
                else
                    AutoElectricClaw = _G.AutoFarm
                    if AutoElectricClaw == true then
                        _G.AutoFarm = false
                        wait(1)
                        while true do
                            task.wait()
                            Function35(CFrame.new(-10371.471700000000055, 330.764496000000008, -10131.41990000000078))
                            AutoElectricClaw = _G.AutoElectricClaw
                            if AutoElectricClaw then
                                AutoElectricClaw = (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-10371.471700000000055, 330.764496000000008, -10131.41990000000078).Position).Magnitude
                                if AutoElectricClaw <= 10 then
                                    break
                                end
                            else
                                break
                            end
                        end
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw", "Start")
                        wait(2)
                        while true do
                            task.wait()
                            Function35(CFrame.new(-12550.532226563000222, 336.226318359380002, -7510.423339843800022))
                            AutoElectricClaw = _G.AutoElectricClaw
                            if AutoElectricClaw then
                                AutoElectricClaw = (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-12550.532226563000222, 336.226318359380002, -7510.423339843800022).Position).Magnitude
                                if AutoElectricClaw <= 10 then
                                    break
                                end
                            else
                                break
                            end
                        end
                        wait(1)
                        while true do
                            task.wait()
                            Function35(CFrame.new(-10371.471700000000055, 330.764496000000008, -10131.41990000000078))
                            AutoElectricClaw = _G.AutoElectricClaw
                            if AutoElectricClaw then
                                AutoElectricClaw = (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-10371.471700000000055, 330.764496000000008, -10131.41990000000078).Position).Magnitude
                                if AutoElectricClaw <= 10 then
                                    break
                                end
                            else
                                break
                            end
                        end
                        wait(1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
                        _G.SelectWeapon = "Electric Claw"
                        wait(0.1)
                        AutoElectricClaw = _G
                        AutoElectricClaw.AutoFarm = true
                    end
                end
            end
        end
    end)
end)
Tab4:Toggle("Auto Dragon Talon", false, function(Param)
    _G.AutoDragonTalon = Param
end)
spawn(function()
    while wait() do
        local AutoDragonTalon = _G.AutoDragonTalon
        if AutoDragonTalon then
            AutoDragonTalon = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw")
            if not AutoDragonTalon then
                AutoDragonTalon = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Claw")
                if not AutoDragonTalon then
                    AutoDragonTalon = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Talon")
                    if not AutoDragonTalon then
                        AutoDragonTalon = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Talon")
                        if AutoDragonTalon then
                            AutoDragonTalon = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw")
                            if AutoDragonTalon then
                                AutoDragonTalon = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value
                                if AutoDragonTalon >= 400 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
                                    AutoDragonTalon = _G
                                    AutoDragonTalon.SelectWeapon = "Dragon Talon"
                                end
                            end
                            AutoDragonTalon = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Claw")
                            if AutoDragonTalon then
                                AutoDragonTalon = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value
                                if AutoDragonTalon >= 400 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
                                    AutoDragonTalon = _G
                                    AutoDragonTalon.SelectWeapon = "Dragon Talon"
                                end
                            end
                            AutoDragonTalon = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw")
                            if AutoDragonTalon then
                                AutoDragonTalon = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value
                                if AutoDragonTalon <= 399 then
                                    AutoDragonTalon = _G
                                    AutoDragonTalon.SelectWeapon = "Dragon Claw"
                                end
                            end
                        end
                    end
                end
            else
                -- empty block
            end
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
        end
    end
end)
Tab4:Toggle("Auto Godhuman", false, function(Param)
    _G.Auto_God_Human = Param
end)
spawn(function()
    while task.wait() do
        local AutoGodHuman = _G.Auto_God_Human
        if AutoGodHuman then
            pcall(function()
                if game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") or game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Black Leg") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Death Step") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Death Step") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishman Karate") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sharkman Karate") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sharkman Karate") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game.Players.LocalPlayer.Character:FindFirstChild("Electro") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electric Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Electric Claw") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Claw") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Talon") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Talon") or game.Players.LocalPlayer.Character:FindFirstChild("Godhuman") or game.Players.LocalPlayer.Backpack:FindFirstChild("Godhuman") then
                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman", true) == 1 then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") and 400 <= game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman").Level.Value or game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") and 400 <= game.Players.LocalPlayer.Character:FindFirstChild("Superhuman").Level.Value then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
                        end
                    else
                        game.StarterGui:SetCore("SendNotification", {
                            Title = "Notification",
                            Text = "Not Have Superhuman",
                            Icon = "rbxassetid://16691911177",
                            Duration = 2.5
                        })
                    end
                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep", true) == 1 then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Death Step") and 400 <= game.Players.LocalPlayer.Backpack:FindFirstChild("Death Step").Level.Value or game.Players.LocalPlayer.Character:FindFirstChild("Death Step") and 400 <= game.Players.LocalPlayer.Character:FindFirstChild("Death Step").Level.Value then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
                        end
                    else
                        game.StarterGui:SetCore("SendNotification", {
                            Title = "Notification",
                            Text = "Not Have Death Step",
                            Icon = "rbxassetid://16691911177",
                            Duration = 2.5
                        })
                    end
                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate", true) == 1 then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Sharkman Karate") and 400 <= game.Players.LocalPlayer.Backpack:FindFirstChild("Sharkman Karate").Level.Value or game.Players.LocalPlayer.Character:FindFirstChild("Sharkman Karate") and 400 <= game.Players.LocalPlayer.Character:FindFirstChild("Sharkman Karate").Level.Value then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
                        end
                    else
                        game.StarterGui:SetCore("SendNotification", {
                            Title = "Notification",
                            Text = "Not Have SharkMan Karate",
                            Icon = "rbxassetid://16691911177",
                            Duration = 2.5
                        })
                    end
                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw", true) == 1 then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Electric Claw") and 400 <= game.Players.LocalPlayer.Backpack:FindFirstChild("Electric Claw").Level.Value or game.Players.LocalPlayer.Character:FindFirstChild("Electric Claw") and 400 <= game.Players.LocalPlayer.Character:FindFirstChild("Electric Claw").Level.Value then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
                        end
                    else
                        game.StarterGui:SetCore("SendNotification", {
                            Title = "Notification",
                            Text = "Not Have Electric Claw",
                            Icon = "rbxassetid://16691911177",
                            Duration = 2.5
                        })
                    end
                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon", true) == 1 then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Talon") and 400 <= game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Talon").Level.Value or game.Players.LocalPlayer.Character:FindFirstChild("Dragon Talon") and 400 <= game.Players.LocalPlayer.Character:FindFirstChild("Dragon Talon").Level.Value then
                            if string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman", true), "Bring") then
                                game.StarterGui:SetCore("SendNotification", {
                                    Title = "Notification",
                                    Text = "Not Have Enough Material",
                                    Icon = "rbxassetid://16691911177",
                                    Duration = 2.5
                                })
                            else
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
                            end
                        end
                    else
                        game.StarterGui:SetCore("SendNotification", {
                            Title = "Notification",
                            Text = "Not Have Dragon Talon",
                            Icon = "rbxassetid://16691911177",
                            Duration = 2.5
                        })
                    end
                else
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
                end
            end)
        end
    end
end)
local Label11 = Tab5:Label("")
spawn(function()
    while wait() do
        pcall(function()
            Label11:Set("Available Point : " .. tostring(game:GetService("Players").LocalPlayer.Data.Points.Value))
        end)
    end
end)
local Label12 = Tab5:Label("")
spawn(function()
    while wait() do
        pcall(function()
            Label12:Set("Melee : " .. game.Players.localPlayer.Data.Stats.Melee.Level.Value)
        end)
    end
end)
local Label13 = Tab5:Label("")
spawn(function()
    while wait() do
        pcall(function()
            Label13:Set("Defense : " .. game.Players.localPlayer.Data.Stats.Defense.Level.Value)
        end)
    end
end)
local Label14 = Tab5:Label("")
spawn(function()
    while wait() do
        pcall(function()
            Label14:Set("Sword : " .. game.Players.localPlayer.Data.Stats.Sword.Level.Value)
        end)
    end
end)
local Label15 = Tab5:Label("")
spawn(function()
    while wait() do
        pcall(function()
            Label15:Set("Gun : " .. game.Players.localPlayer.Data.Stats.Gun.Level.Value)
        end)
    end
end)
local Label16 = Tab5:Label("")
spawn(function()
    while wait() do
        pcall(function()
            Label16:Set("Fruit : " .. game.Players.localPlayer.Data.Stats["Demon Fruit"].Level.Value)
        end)
    end
end)
Tab5:Seperator("Auto Stats")
Tab5:Toggle("Auto Stats Melee", false, function(Param)
    R0120 = Param
end)
Tab5:Toggle("Auto Stats Defense", false, function(Param)
    R024 = Param
end)
Tab5:Toggle("Auto Stats Sword", false, function(Param)
    R0285 = Param
end)
Tab5:Toggle("Auto Stats Gun", false, function(Param)
    R0171 = Param
end)
Tab5:Toggle("Auto Stats Fruit", false, function(Param)
    R0251 = Param
end)
spawn(function()
    while wait() do
        local Melee = R0120
        if Melee then
            Melee = {}
            Melee[1] = "AddPoint"
            Melee[2] = "Melee"
            Melee[3] = _G.PointStats
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(Melee))
        end
        Melee = R024
        if Melee then
            Melee = {}
            Melee[1] = "AddPoint"
            Melee[2] = "Defense"
            Melee[3] = _G.PointStats
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(Melee))
        end
        Melee = R0285
        if Melee then
            Melee = {}
            Melee[1] = "AddPoint"
            Melee[2] = "Sword"
            Melee[3] = _G.PointStats
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(Melee))
        end
        Melee = R0171
        if Melee then
            Melee = {}
            Melee[1] = "AddPoint"
            Melee[2] = "Gun"
            Melee[3] = _G.PointStats
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(Melee))
        end
        Melee = R0251
        if Melee then
            Melee = {}
            Melee[1] = "AddPoint"
            Melee[2] = "Demon Fruit"
            Melee[3] = _G.PointStats
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(Melee))
        end
    end
end)
Tab5:Slider("Point To Add", 0, 2550, 1, function(Param)
    _G.PointStats = Param
end)
_G.PointStats = 1
Tab8:Seperator("World Function5")
Tab8:Button("Function5 To Frist Sea", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
end)
Tab8:Button("Function5 To Second Sea", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
end)
Tab8:Button("Function5 To Third Sea", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
end)
Tab8:Seperator("Island Function5")
if Flag then
    Tab8:Dropdown("Select Island", {
        "WindMill",
        "Marine",
        "Middle Town",
        "Jungle",
        "Pirate Village",
        "Desert",
        "Snow Island",
        "MarineFord",
        "Colosseum",
        "Sky Island 1",
        "Sky Island 2",
        "Sky Island 3",
        "Prison",
        "Magma Village",
        "Under Water Island",
        "Fountain City",
        "Shank Room",
        "Mob Island"
    }, function(Param)
        _G.SelectIsland = Param
    end)
end
if Flag2 then
    Tab8:Dropdown("Select Island", {
        "The Cafe",
        "Frist Spot",
        "Dark Area",
        "Flamingo Mansion",
        "Flamingo Room",
        "Green Zone",
        "Factory",
        "Colossuim",
        "Zombie Island",
        "Two Snow Mountain",
        "Punk Hazard",
        "Cursed Ship",
        "Ice Castle",
        "Forgotten Island",
        "Ussop Island",
        "Mini Sky Island"
    }, function(Param)
        _G.SelectIsland = Param
    end)
end
if Flag3 then
    Tab8:Dropdown("Select Island", {
        "Mansion",
        "Port Town",
        "Great Tree",
        "Castle On The Sea",
        "MiniSky",
        "Hydra Island",
        "Floating Turtle",
        "Haunted Castle",
        "Ice Cream Island",
        "Peanut Island",
        "Cake Island",
        "Cocoa Island",
        "Candy Island New",
        "Tiki Outpost"
    }, function(Param)
        _G.SelectIsland = Param
    end)
end
Tab8:Toggle("Function5 To Selected Island", false, function(Param)
    _G.TeleportIsland = Param
    if _G.TeleportIsland == true then
        repeat
            wait()
            if _G.SelectIsland == "WindMill" then
                Function35(CFrame.new(979.798950195309999, 16.516613006591999, 1429.046630859400011))
            else
                local TeleportIsland = _G.SelectIsland
                if TeleportIsland == "Marine" then
                    Function35(CFrame.new(-2566.4296875, 6.8556680679321, 2045.256103515599989))
                else
                    TeleportIsland = _G.SelectIsland
                    if TeleportIsland == "Middle Town" then
                        Function35(CFrame.new(-690.330810546880002, 15.09425163269, 1582.238037109400011))
                    else
                        TeleportIsland = _G.SelectIsland
                        if TeleportIsland == "Jungle" then
                            Function35(CFrame.new(-1612.795776367200006, 36.852081298827997, 149.12843322754))
                        else
                            TeleportIsland = _G.SelectIsland
                            if TeleportIsland == "Pirate Village" then
                                Function35(CFrame.new(-1181.309326171900011, 4.7514905929565, 3803.545654296900011))
                            else
                                TeleportIsland = _G.SelectIsland
                                if TeleportIsland == "Desert" then
                                    Function35(CFrame.new(944.157897949220001, 20.919729232788001, 4373.300292968800022))
                                else
                                    TeleportIsland = _G.SelectIsland
                                    if TeleportIsland == "Snow Island" then
                                        Function35(CFrame.new(1347.806762695299994, 104.668060302729998, -1319.737060546900011))
                                    else
                                        TeleportIsland = _G.SelectIsland
                                        if TeleportIsland == "MarineFord" then
                                            Function35(CFrame.new(-4914.8212890625, 50.963626861572003, 4281.027832031300022))
                                        else
                                            TeleportIsland = _G.SelectIsland
                                            if TeleportIsland == "Colosseum" then
                                                Function35(CFrame.new(-1427.620361328099989, 7.2881078720093, -2792.772216796900011))
                                            else
                                                TeleportIsland = _G.SelectIsland
                                                if TeleportIsland == "Sky Island 1" then
                                                    Function35(CFrame.new(-4869.1025390625, 733.460510253910002, -2667.018066406300022))
                                                else
                                                    TeleportIsland = _G.SelectIsland
                                                    if TeleportIsland == "Sky Island 2" then
                                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-4607.822750000000269, 872.542479999999955, -1667.556880000000092))
                                                    else
                                                        TeleportIsland = _G.SelectIsland
                                                        if TeleportIsland == "Sky Island 3" then
                                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7894.617675781300022, 5547.1416015625, -380.291198730470001))
                                                        else
                                                            TeleportIsland = _G.SelectIsland
                                                            if TeleportIsland == "Prison" then
                                                                Function35(CFrame.new(4875.330078125, 5.6519818305969, 734.850219726559999))
                                                            else
                                                                TeleportIsland = _G.SelectIsland
                                                                if TeleportIsland == "Magma Village" then
                                                                    Function35(CFrame.new(-5247.716308593800022, 12.883934020996, 8504.96875))
                                                                else
                                                                    TeleportIsland = _G.SelectIsland
                                                                    if TeleportIsland == "Under Water Island" then
                                                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                                                                    else
                                                                        TeleportIsland = _G.SelectIsland
                                                                        if TeleportIsland == "Fountain City" then
                                                                            Function35(CFrame.new(5127.128417968800022, 59.501365661621001, 4105.445800781300022))
                                                                        else
                                                                            TeleportIsland = _G.SelectIsland
                                                                            if TeleportIsland == "Shank Room" then
                                                                                Function35(CFrame.new(-1442.16552999999999, 29.878826100000001, -28.354747799999998))
                                                                            else
                                                                                TeleportIsland = _G.SelectIsland
                                                                                if TeleportIsland == "Mob Island" then
                                                                                    Function35(CFrame.new(-2850.20067999999992, 7.39224768, 5354.992680000000291))
                                                                                else
                                                                                    TeleportIsland = _G.SelectIsland
                                                                                    if TeleportIsland == "The Cafe" then
                                                                                        Function35(CFrame.new(-380.479278564449999, 77.220390319824006, 255.825500488279999))
                                                                                    else
                                                                                        TeleportIsland = _G.SelectIsland
                                                                                        if TeleportIsland == "Frist Spot" then
                                                                                            Function35(CFrame.new(-11.311455726624001, 29.276733398438001, 2771.5224609375))
                                                                                        else
                                                                                            TeleportIsland = _G.SelectIsland
                                                                                            if TeleportIsland == "Dark Area" then
                                                                                                Function35(CFrame.new(3780.0302734375, 22.652164459228999, -3498.5859375))
                                                                                            else
                                                                                                TeleportIsland = _G.SelectIsland
                                                                                                if TeleportIsland == "Flamingo Mansion" then
                                                                                                    Function35(CFrame.new(-483.733703613279999, 332.038360595699999, 595.327087402339998))
                                                                                                else
                                                                                                    TeleportIsland = _G.SelectIsland
                                                                                                    if TeleportIsland == "Flamingo Room" then
                                                                                                        Function35(CFrame.new(2284.4140625, 15.152037620544, 875.725341796880002))
                                                                                                    else
                                                                                                        TeleportIsland = _G.SelectIsland
                                                                                                        if TeleportIsland == "Green Zone" then
                                                                                                            Function35(CFrame.new(-2448.530029296900011, 73.016105651855, -3210.630615234400011))
                                                                                                        else
                                                                                                            TeleportIsland = _G.SelectIsland
                                                                                                            if TeleportIsland == "Factory" then
                                                                                                                Function35(CFrame.new(424.126983642580001, 211.161712646479998, -427.540496826169999))
                                                                                                            else
                                                                                                                TeleportIsland = _G.SelectIsland
                                                                                                                if TeleportIsland == "Colossuim" then
                                                                                                                    Function35(CFrame.new(-1503.622436523399983, 219.795623779300001, 1369.310180664100017))
                                                                                                                else
                                                                                                                    TeleportIsland = _G.SelectIsland
                                                                                                                    if TeleportIsland == "Zombie Island" then
                                                                                                                        Function35(CFrame.new(-5622.033203125, 492.196044921880002, -781.785522460940001))
                                                                                                                    else
                                                                                                                        TeleportIsland = _G.SelectIsland
                                                                                                                        if TeleportIsland == "Two Snow Mountain" then
                                                                                                                            Function35(CFrame.new(753.142883300779999, 408.235595703130002, -5274.614746093800022))
                                                                                                                        else
                                                                                                                            TeleportIsland = _G.SelectIsland
                                                                                                                            if TeleportIsland == "Punk Hazard" then
                                                                                                                                Function35(CFrame.new(-6127.654296875, 15.951762199401999, -5040.2861328125))
                                                                                                                            else
                                                                                                                                TeleportIsland = _G.SelectIsland
                                                                                                                                if TeleportIsland == "Cursed Ship" then
                                                                                                                                    Function35(CFrame.new(923.401977539059999, 125.05712890625, 32885.875))
                                                                                                                                else
                                                                                                                                    TeleportIsland = _G.SelectIsland
                                                                                                                                    if TeleportIsland == "Ice Castle" then
                                                                                                                                        Function35(CFrame.new(6148.411621093800022, 294.38687133789, -6741.116699218800022))
                                                                                                                                    else
                                                                                                                                        TeleportIsland = _G.SelectIsland
                                                                                                                                        if TeleportIsland == "Forgotten Island" then
                                                                                                                                            Function35(CFrame.new(-3032.764160156300022, 317.896728515630002, -10075.373046875))
                                                                                                                                        else
                                                                                                                                            TeleportIsland = _G.SelectIsland
                                                                                                                                            if TeleportIsland == "Ussop Island" then
                                                                                                                                                Function35(CFrame.new(4816.861816406300022, 8.459988594055201, 2863.819580078099989))
                                                                                                                                            else
                                                                                                                                                TeleportIsland = _G.SelectIsland
                                                                                                                                                if TeleportIsland == "Mini Sky Island" then
                                                                                                                                                    Function35(CFrame.new(-288.740600585940001, 49326.31640625, -35248.59375))
                                                                                                                                                else
                                                                                                                                                    TeleportIsland = _G.SelectIsland
                                                                                                                                                    if TeleportIsland == "Great Tree" then
                                                                                                                                                        Function35(CFrame.new(2681.273681640599989, 1682.809204101600017, -7190.9853515625))
                                                                                                                                                    else
                                                                                                                                                        TeleportIsland = _G.SelectIsland
                                                                                                                                                        if TeleportIsland == "Castle On The Sea" then
                                                                                                                                                            Function35(CFrame.new(-5074.45556640625, 314.515533447265625, -2991.054443359375))
                                                                                                                                                        else
                                                                                                                                                            TeleportIsland = _G.SelectIsland
                                                                                                                                                            if TeleportIsland == "MiniSky" then
                                                                                                                                                                Function35(CFrame.new(-260.655578613279999, 49325.8046875, -35253.5703125))
                                                                                                                                                            else
                                                                                                                                                                TeleportIsland = _G.SelectIsland
                                                                                                                                                                if TeleportIsland == "Port Town" then
                                                                                                                                                                    Function35(CFrame.new(-290.7376708984375, 6.729952812194824, 5343.5537109375))
                                                                                                                                                                else
                                                                                                                                                                    TeleportIsland = _G.SelectIsland
                                                                                                                                                                    if TeleportIsland == "Hydra Island" then
                                                                                                                                                                        Function35(CFrame.new(5228.884277343800022, 604.234008789059999, 345.0400390625))
                                                                                                                                                                    else
                                                                                                                                                                        TeleportIsland = _G.SelectIsland
                                                                                                                                                                        if TeleportIsland == "Floating Turtle" then
                                                                                                                                                                            Function35(CFrame.new(-13274.528320313000222, 531.820739746089998, -7579.22265625))
                                                                                                                                                                        else
                                                                                                                                                                            TeleportIsland = _G.SelectIsland
                                                                                                                                                                            if TeleportIsland == "Mansion" then
                                                                                                                                                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-12471.169921875, 374.940246582029999, -7551.677734375))
                                                                                                                                                                            else
                                                                                                                                                                                TeleportIsland = _G.SelectIsland
                                                                                                                                                                                if TeleportIsland == "Haunted Castle" then
                                                                                                                                                                                    Function35(CFrame.new(-9515.3720703125, 164.006240844730002, 5786.061035156199978))
                                                                                                                                                                                else
                                                                                                                                                                                    TeleportIsland = _G.SelectIsland
                                                                                                                                                                                    if TeleportIsland == "Ice Cream Island" then
                                                                                                                                                                                        Function35(CFrame.new(-902.568176269529999, 79.93204498291, -10988.84765625))
                                                                                                                                                                                    else
                                                                                                                                                                                        TeleportIsland = _G.SelectIsland
                                                                                                                                                                                        if TeleportIsland == "Peanut Island" then
                                                                                                                                                                                            Function35(CFrame.new(-2062.747558593800022, 50.473892211913999, -10232.568359375))
                                                                                                                                                                                        else
                                                                                                                                                                                            TeleportIsland = _G.SelectIsland
                                                                                                                                                                                            if TeleportIsland == "Cake Island" then
                                                                                                                                                                                                Function35(CFrame.new(-1884.7747802734375, 19.327526092529297, -11666.8974609375))
                                                                                                                                                                                            else
                                                                                                                                                                                                TeleportIsland = _G.SelectIsland
                                                                                                                                                                                                if TeleportIsland == "Cocoa Island" then
                                                                                                                                                                                                    Function35(CFrame.new(87.942764282226562, 73.554512023925781, -12319.46484375))
                                                                                                                                                                                                else
                                                                                                                                                                                                    TeleportIsland = _G.SelectIsland
                                                                                                                                                                                                    if TeleportIsland == "Candy Island New\226\155\132" then
                                                                                                                                                                                                        Function35(CFrame.new(-1014.4241943359375, 149.110687255859375, -14555.962890625))
                                                                                                                                                                                                    else
                                                                                                                                                                                                        TeleportIsland = _G.SelectIsland
                                                                                                                                                                                                        if TeleportIsland == "Tiki Outpost" then
                                                                                                                                                                                                            Function35(CFrame.new(-1149.327999999999975, 13.5759039, -14445.614299999999275, -0.156446099, 0, -0.987686574, 0, 1, 0, 0.987686574, 0, -0.156446099))
                                                                                                                                                                                                        end
                                                                                                                                                                                                    end
                                                                                                                                                                                                end
                                                                                                                                                                                            end
                                                                                                                                                                                        end
                                                                                                                                                                                    end
                                                                                                                                                                                end
                                                                                                                                                                            end
                                                                                                                                                                        end
                                                                                                                                                                    end
                                                                                                                                                                end
                                                                                                                                                            end
                                                                                                                                                        end
                                                                                                                                                    end
                                                                                                                                                end
                                                                                                                                            end
                                                                                                                                        end
                                                                                                                                    end
                                                                                                                                end
                                                                                                                            end
                                                                                                                        end
                                                                                                                    end
                                                                                                                end
                                                                                                            end
                                                                                                        end
                                                                                                    end
                                                                                                end
                                                                                            end
                                                                                        end
                                                                                    end
                                                                                end
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
            local TeleportIsland = _G.TeleportIsland
        until not TeleportIsland
    end
    Function38(_G.TeleportIsland)
end)
Tab8:Toggle("ESP Island", false, function(Param)
    _G.AutoESPisland = Param
    R023 = Param
    Function13()
end)
spawn(function()
    pcall(function()
        while wait() do
            local AutoEsPisland = _G.AutoESPisland
            if AutoEsPisland then
                Function13()
            end
        end
    end)
end)
local Label17 = Tab9:Label("")
spawn(function()
    while wait() do
        pcall(function()
            for I, I2 in pairs(game:GetService("Players"):GetPlayers()) do
                if I == 12 then
                    Label17:Set("Players :" .. " " .. I .. " / 12 (Max)")
                elseif I == 1 then
                    Label17:Set("Player :" .. " " .. I .. " / 12")
                else
                    Label17:Set("Players :" .. " " .. I .. " / 12")
                end
            end
        end)
    end
end)
Value23 = {}
for Inst32, String2 in pairs(game:GetService("Players"):GetChildren()) do
    table.insert(Value23, String2.Name)
end
local Dropdown2 = Tab9:Dropdown("Select Player", Value23, function(Param)
    _G.SelectPly = Param
end)
Tab9:Button("Refresh Player List", function()
    Value23 = {}
    Dropdown2:Clear()
    for I, I2 in pairs(game:GetService("Players"):GetChildren()) do
        Dropdown2:Add(I2.Name)
    end
end)
Tab9:Toggle("Spectate Selected Player", false, function(Param)
    R0470 = Param
    local Humanoid = game:GetService("Players").LocalPlayer.Character.Humanoid
    local Child = game:GetService("Players"):FindFirstChild(_G.SelectPly)
    repeat
        wait(0.1)
        game:GetService("Workspace").Camera.CameraSubject = game:GetService("Players"):FindFirstChild(_G.SelectPly).Character.Humanoid
    until R0470 == false
    game:GetService("Workspace").Camera.CameraSubject = game:GetService("Players").LocalPlayer.Character.Humanoid
end)
Tab9:Toggle("Function5 To Selected Player", false, function(Param)
    _G.Function5 = bool
    if _G.Function5 == false then
        game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
    end
    while _G.Function5 do
        task.wait()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 0)
        game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
        game:GetService("VirtualUser"):CaptureController()
        local Service8 = game:GetService("VirtualUser")
        Service8:Button1Down(Vector2.new(1280, 672))
    end
end)
Tab9:Toggle("Auto Kill Selected Player", false, function(Param)
    _G.Auto_Kill_Ply = Param
    Function38(_G.Auto_Kill_Ply)
end)
spawn(function()
    while wait() do
        local AutoKillPly = _G.Auto_Kill_Ply
        if AutoKillPly then
            pcall(function()
                if _G.SelectPly ~= nil and game.Players:FindFirstChild(_G.SelectPly) and 0 < game.Players:FindFirstChild(_G.SelectPly).Character.Humanoid.Health then
                    while true do
                        task.wait()
                        Function32(_G.SelectWeapon)
                        Function30()
                        game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.CanCollide = false
                        Function35(game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0))
                        spawn(function()
                            pcall(function()
                                if _G.SelectWeapon == Name then
                                    game:GetService("Players").LocalPlayer.Character[Name].RemoteFunctionShoot:InvokeServer(unpack({
                                        [1] = game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.Position,
                                        [2] = game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart
                                    }))
                                else
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                end
                            end)
                        end)
                        if game.Players:FindFirstChild(_G.SelectPly).Character.Humanoid.Health > 0 then
                            local Child = game.Players:FindFirstChild(_G.SelectPly)
                            if Child then
                                Child = _G.Auto_Kill_Ply
                                if not Child then
                                    break
                                end
                            else
                                break
                            end
                        else
                            break
                        end
                    end
                end
            end)
        end
    end
end)
Tab9:Seperator("Player Quest")
Tab9:Button("Get Kill Player Quest", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter")
end)
Tab9:Toggle("Auto Kill Player Quest", false, function(Param)
    _G.AutoPlayerHunter = Param
    Function38(_G.AutoPlayerHunter)
end)
spawn(function()
    game:GetService("RunService").Heartbeat:connect(function()
        pcall(function()
            if _G.AutoPlayerHunter and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") then
                game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
            end
        end)
    end)
end)
spawn(function()
    pcall(function()
        while wait(0.1) do
            local AutoPlayerHunter = _G.AutoPlayerHunter
            if AutoPlayerHunter then
                AutoPlayerHunter = game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpDisabled.Visible
                if AutoPlayerHunter == true then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
                end
            end
        end
    end)
end)
spawn(function()
    while wait() do
        local AutoPlayerHunter = _G.AutoPlayerHunter
        if AutoPlayerHunter then
            AutoPlayerHunter = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
            if AutoPlayerHunter == false then
                wait(0.5)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter")
            else
                AutoPlayerHunter = pairs
                for I, I2 in AutoPlayerHunter(game:GetService("Workspace").Characters:GetChildren()) do
                    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, I2.Name) then
                        while true do
                            wait()
                            if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                local AutoPlayerHunter2 = {
                                    [1] = "Buso"
                                }
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(AutoPlayerHunter2))
                            end
                            Function32(_G.SelectWeapon)
                            Flag131 = true
                            Function35(I2.HumanoidRootPart.CFrame * CFrame.new(1, 7, 3))
                            I2.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            game:GetService("VirtualUser"):CaptureController()
                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                            local AutoPlayerHunter2 = _G.AutoPlayerHunter
                            if AutoPlayerHunter2 ~= false then
                                AutoPlayerHunter2 = I2.Humanoid.Health
                                if AutoPlayerHunter2 <= 0 then
                                    break
                                end
                            else
                                break
                            end
                        end
                        Flag131 = false
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    end
                end
            end
        end
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if Flag131 then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
            end
        end)
    end
end)
Tab9:Seperator("Code")
Tab9:Button("Redeem All Codes", function()
    Function44 = function(Param)
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(Param)
    end
    Function44("UPD16")
    Function44("2BILLION")
    Function44("UPD15")
    Function44("FUDD10")
    Function44("BIGNEWS")
    Function44("THEGREATACE")
    Function44("SUB2GAMERROBOT_EXP1")
    Function44("StrawHatMaine")
    Function44("Sub2OfficialNoobie")
    Function44("SUB2NOOBMASTER123")
    Function44("Sub2Daigrock")
    Function44("Axiore")
    Function44("TantaiGaming")
    Function44("STRAWHATMAINE")
    Function44("GAMERROBOT_YT")
    Function44("EXP_5B")
    Function44("RESET_5B")
    Function44("KittGaming")
    Function44("Enyu_is_Pro")
    Function44("Sub2Fer999")
    Function44("Bluxxy")
    Function44("JCWK")
    Function44("Magicbus")
    Function44("fudd10_v2 ")
    Function44("Starcodeheo")
    Function44("3BVISITS")
    Function44("1MLIKES_RESET")
    Function44("2BILLION")
end)
Tab9:Seperator("ESP")
Tab9:Toggle("ESP Player", false, function(Param)
    _G.ESPPLayers = Param
    R037 = Param
    Function15()
end)
spawn(function()
    pcall(function()
        while wait() do
            local EsppLayers = _G.ESPPLayers
            if EsppLayers then
                Function15()
            end
        end
    end)
end)
Tab9:Toggle("ESP Chest", false, function(Param)
    _G.ESPCHESTE = Param
    R0620 = Param
    Function16()
end)
spawn(function()
    pcall(function()
        while wait() do
            local Espcheste = _G.ESPCHESTE
            if Espcheste then
                Function16()
            end
        end
    end)
end)
Tab9:Toggle("ESP Flower", false, function(Param)
    _G.ESPFloweers = Param
    R0367 = Param
    Function18()
end)
spawn(function()
    pcall(function()
        while wait() do
            local EspFloweers = _G.ESPFloweers
            if EspFloweers then
                Function18()
            end
        end
    end)
end)
Tab10:Button("Shop Devil Fruit", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
        [1] = "GetFruits"
    }))
    game.Players.localPlayer.PlayerGui.Main.FruitShop.Visible = true
end)
Tab10:Button("Random Fruit", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
        [1] = "Cousin",
        [2] = "Buy"
    }))
end)
Tab10:Toggle("Bring All Fruits", false, function(Param)
    _G.AutoBringFruit = Param
end)
spawn(function()
    pcall(function()
        while wait(0.1) do
            local AutoBringFruit = _G.AutoBringFruit
            if AutoBringFruit then
                AutoBringFruit = pairs
                for I, I2 in AutoBringFruit(game:GetService("Workspace"):GetChildren()) do
                    if string.find(I2.Name, "Fruit") and I2:IsA("Tool") then
                        I2.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 45, 0)
                        wait(0.3)
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, I2.Handle, 0)
                    end
                end
            end
        end
    end)
end)
Tab10:Toggle("Store All Fruits", false, function(Param)
    _G.AutoStoreSsFruit = Param
end)
spawn(function()
    pcall(function()
        while wait() do
            local AutoStoreSsFruit = _G.AutoStoreSsFruit
            if AutoStoreSsFruit then
                AutoStoreSsFruit = pairs
                for I, I2 in AutoStoreSsFruit(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if I2:IsA("Tool") and string.find(I2.Name, "Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", I2:GetAttribute("OriginalName"), I2)
                        Load.Text = "Keep Fruit Success"
                    end
                end
                AutoStoreSsFruit = pairs
                for I, I2 in AutoStoreSsFruit(game.Players.LocalPlayer.Character:GetChildren()) do
                    if I2:IsA("Tool") and string.find(I2.Name, "Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", I2:GetAttribute("OriginalName"), I2)
                        Load.Text = "Keep Fruit Success"
                    end
                end
            end
        end
    end)
end)
Tab10:Toggle("ESP All Fruits", false, function(Param)
    _G.AutoESPFruit = Param
    R0552 = Param
    Function17()
end)
spawn(function()
    pcall(function()
        while wait() do
            local AutoEspFruit = _G.AutoESPFruit
            if AutoEspFruit then
                Function17()
            end
        end
    end)
end)
Tab10:Toggle("ESP Real Fruits", false, function(Param)
    _G.AutoESPFruit2 = Param
    R036 = Param
    Function19()
end)
spawn(function()
    pcall(function()
        while wait() do
            local AutoEspFruit2 = _G.AutoESPFruit2
            if AutoEspFruit2 then
                Function19()
            end
        end
    end)
end)
Tab11:Seperator("Auto Raid")
if Flag2 then
    Tab11:Button("Function5 To Lab", function()
        Function35(CFrame.new(-6438.735349999999926, 250.645354999999995, -4501.506840000000011))
    end)
elseif Flag3 then
    Tab11:Button("Function5 To Lab", function()
        Function35(CFrame.new(-5017.408690000000206, 314.844055000000026, -2823.012700000000223, -0.925743818, 0.00000004482175, -0.378151238, 0.000000004555031, 1, 0.000000107377559, 0.378151238, 0.000000097681621, -0.925743818))
    end)
end
_G.SelectChip = selectraids or ""
Value24 = {}
Result2 = require(game.ReplicatedStorage.Raids)
for String2, String3 in pairs(Result2.raids) do
    table.insert(Value24, String3)
end
for String2, String3 in pairs(Result2.advancedRaids) do
    table.insert(Value24, String3)
end
Tab11:Dropdown("Select Chip", Value24, function(Param)
    _G.SelectChip = Param
end)
Tab11:Button("Buy Selected Chip", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectChip)
end)
Tab11:Toggle("Auto Select Raid", false, function(Param)
    _G.AutoSelectDungeon = Param
end)
spawn(function()
    while wait() do
        local AutoSelectDungeon = _G.AutoSelectDungeon
        if AutoSelectDungeon then
            pcall(function()
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flame - Flame") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flame - Flame") then
                    _G.SelectChip = "Flame"
                elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ice - Ice") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ice - Ice") then
                    _G.SelectChip = "Ice"
                elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Quake - Quake") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Quake - Quake") then
                    _G.SelectChip = "Quake"
                elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Light - Light") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Light - Light") then
                    _G.SelectChip = "Light"
                elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dark - Dark") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark - Dark") then
                    _G.SelectChip = "Dark"
                elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("String - String") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("String - String") then
                    _G.SelectChip = "String"
                elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rumble - Rumble") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rumble - Rumble") then
                    _G.SelectChip = "Rumble"
                elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Magma - Magma") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Magma - Magma") then
                    _G.SelectChip = "Magma"
                elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Human - Human: Buddha Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Human - Human: Buddha Fruit") then
                    _G.SelectChip = "Human: Buddha"
                elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sand - Sand") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sand - Sand") then
                    _G.SelectChip = "Sand"
                elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird - Bird: Phoenix") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird - Bird: Phoenix") then
                    _G.SelectChip = "Bird: Phoenix"
                elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dough") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dough") then
                    _G.SelectChip = "Dough"
                else
                    _G.SelectChip = "Flame"
                end
            end)
        end
    end
end)
Tab11:Toggle("Auto Buy Chip", false, function(Param)
    _G.AutoBuyChip = Param
end)
spawn(function()
    pcall(function()
        while wait() do
            local AutoBuyChip = _G.AutoBuyChip
            if AutoBuyChip then
                AutoBuyChip = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip")
                if AutoBuyChip then
                    AutoBuyChip = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip")
                    if AutoBuyChip then
                        -- empty block
                    end
                end
                AutoBuyChip = game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 1")
                if not AutoBuyChip then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectChip)
                end
            end
        end
    end)
end)
Tab11:Toggle("Auto Start Raid", false, function(Param)
    _G.Auto_StartRaid = Param
end)
spawn(function()
    while wait(0.1) do
        pcall(function()
            if _G.Auto_StartRaid and game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == false and (not game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 1") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip")) then
                if Flag2 then
                    fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                elseif Flag3 then
                    fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
                end
            end
        end)
    end
end)
Tab11:Toggle("Kill Aura", false, function(Param)
    _G.Kill_Aura = Param
end)
spawn(function()
    pcall(function()
        while wait() do
            local KillAura = _G.Kill_Aura
            if KillAura then
                KillAura = game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible
                if KillAura == true then
                    KillAura = pairs
                    for I, I2 in KillAura(game:GetService("Workspace").Enemies:GetDescendants()) do
                        if I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                            pcall(function()
                                while true do
                                    wait()
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                    I2.Humanoid.Health = 0
                                    I2.HumanoidRootPart.CanCollide = false
                                    if _G.Kill_Aura then
                                        local Parent = I2.Parent
                                        if Parent then
                                            Parent = I2.Humanoid.Health
                                            if Parent <= 0 then
                                                break
                                            end
                                        else
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                            end)
                        end
                    end
                end
            end
        end
    end)
end)
Tab11:Toggle("Auto Next Island", false, function(Param)
    _G.Auto_Dungeon = Param
    Function38(_G.Auto_Dungeon)
end)
spawn(function()
    pcall(function()
        while wait() do
            local AutoDungeon = _G.Auto_Dungeon
            if AutoDungeon then
                AutoDungeon = game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible
                if AutoDungeon == true then
                    AutoDungeon = game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 5")
                    if AutoDungeon then
                        Function35(game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 5").CFrame * R07076)
                    else
                        AutoDungeon = game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 4")
                        if AutoDungeon then
                            Function35(game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 4").CFrame * R07076)
                        else
                            AutoDungeon = game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 3")
                            if AutoDungeon then
                                Function35(game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 3").CFrame * R07076)
                            else
                                AutoDungeon = game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 2")
                                if AutoDungeon then
                                    Function35(game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 2").CFrame * R07076)
                                else
                                    AutoDungeon = game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 1")
                                    if AutoDungeon then
                                        Function35(game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 1").CFrame * R07076)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end)
end)
Number101 = 1
spawn(function()
    while wait(0.1) do
        local Number101 = Number101
        if Number101 == 1 then
            Number101 = CFrame.new(0, 25, 0)
            R07076 = Number101
        else
            Number101 = Number101
            if Number101 == 2 then
                Number101 = CFrame.new(0, 25, -40)
                R07076 = Number101
            else
                Number101 = Number101
                if Number101 == 3 then
                    Number101 = CFrame.new(40, 25, 0)
                    R07076 = Number101
                else
                    Number101 = Number101
                    if Number101 == 4 then
                        Number101 = CFrame.new(0, 25, 40)
                        R07076 = Number101
                    else
                        Number101 = Number101
                        if Number101 == 5 then
                            Number101 = CFrame.new(-40, 25, 0)
                            R07076 = Number101
                        else
                            Number101 = Number101
                            if Number101 == 6 then
                                Number101 = CFrame.new(0, 25, 0)
                                R07076 = Number101
                            end
                        end
                    end
                end
            end
        end
    end
end)
spawn(function()
    while wait(0.1) do
        Number101 = 1
        wait(0.9)
        Number101 = 2
        wait(0.9)
        Number101 = 3
        wait(0.9)
        Number101 = 4
        wait(0.9)
        Number101 = 5
        wait(0.9)
    end
end)
Tab11:Toggle("Auto Awanken Fruit", false, function(Param)
    _G.Auto_Awakener = Param
end)
spawn(function()
    pcall(function()
        while wait(0.1) do
            local AutoAwakener = _G.Auto_Awakener
            if AutoAwakener then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener", "Check")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener", "Awaken")
            end
        end
    end)
end)
Tab11:Seperator("Advanced Raid")
Tab11:Button("Buy Law Raid Chip", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
        [1] = "BlackbeardReward",
        [2] = "Microchip",
        [3] = "2"
    }))
end)
Tab11:Button("Start Law Raid", function()
    fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
end)
Tab11:Toggle("Auto Law Raid", false, function(Param)
    _G.AutoOderSword = Param
    Function38(_G.AutoOderSword)
end)
spawn(function()
    while wait() do
        local AutoOderSword = _G.AutoOderSword
        if AutoOderSword then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Order [Lv. 1250] [Raid Boss]") then
                    for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if I2.Name == "Order [Lv. 1250] [Raid Boss]" and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                            while true do
                                task.wait()
                                Function30()
                                Function32(_G.SelectWeapon)
                                I2.HumanoidRootPart.CanCollide = false
                                I2.Humanoid.WalkSpeed = 0
                                I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                Function35(I2.HumanoidRootPart.CFrame * R03664)
                                game:GetService("VirtualUser"):CaptureController()
                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                if _G.AutoOderSword then
                                    local Parent = I2.Parent
                                    if Parent then
                                        Parent = I2.Humanoid.Health
                                        if Parent <= 0 then
                                            break
                                        end
                                    else
                                        break
                                    end
                                else
                                    break
                                end
                            end
                        end
                    end
                elseif game:GetService("ReplicatedStorage"):FindFirstChild("Order [Lv. 1250] [Raid Boss]") then
                    Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Order [Lv. 1250] [Raid Boss]").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                elseif _G.AutoOderSwordHop then
                    Function3()
                end
            end)
        end
    end
end)
Tab11:Toggle("Auto Phoenix Raid", false, function(Param)
    _G.AutoAdvanceDungeon = Param
    Function38(_G.AutoAdvanceDungeon)
end)
spawn(function()
    while wait() do
        local AutoAdvanceDungeon = _G.AutoAdvanceDungeon
        if AutoAdvanceDungeon then
            pcall(function()
                if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird: Phoenix") and not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird: Phoenix") and game.Players.LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) and 400 <= game.Players.LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value).Level.Value then
                    Function35(CFrame.new(-2812.76708984375, 254.803466796875, -12595.560546875))
                    if (CFrame.new(-2812.76708984375, 254.803466796875, -12595.560546875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                        wait(1.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SickScientist", "Check")
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SickScientist", "Heal")
                    end
                end
            end)
        end
    end
end)
Tab12:Seperator("Abilities")
Tab12:Dropdown("Select Abilities", {
    "Geppo [$10,000 Beli]",
    "Buso Haki [$25,000 Beli]",
    "Soru [$25,000 Beli]",
    "Observation Haki [$750,000 Beli]"
}, function(Param)
    _G.SelectAbilities = Param
end)
Tab12:Button("Buy Selected Abilities", function()
    if _G.SelectAbilities == "Geppo [$10,000 Beli]" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Geppo")
    elseif _G.SelectAbilities == "Buso Haki [$25,000 Beli]" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Buso")
    elseif _G.SelectAbilities == "Soru [$25,000 Beli]" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Soru")
    elseif _G.SelectAbilities == "Observation Haki [$750,000 Beli]" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk", "Buy")
    end
end)
Tab12:Seperator("Melee")
Tab12:Dropdown("Select Melee", {
    "Black Leg [$150,000 Beli]",
    "Electro [$550,000 Beli]",
    "Fishman Karate [$750,000 Beli]",
    "Dragon Claw [$1,500 Fragments]",
    "Superhuman [$3,000,000 Beli]",
    "Death Step [$5,000 Fragments + $5,000,000 Beli]",
    "Sharkman Karate [$5,000 Fragments + $2,500,000 Beli]",
    "Electric Claw [$5,000 Fragments + $3,000,000 Beli]",
    "Dragon Talon [$5,000 Fragments + $3,000,000 Beli]",
    "God Human [$5,000 Fragments + $5,000,000 Beli]",
    "Sanguine Art [$5,000 Fragments + $5,000,000 Beli]"
}, function(Param)
    _G.SelectMelee = Param
end)
Tab12:Button("Buy Selected Melee", function()
    if _G.SelectMelee == "Black Leg [$150,000 Beli]" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
    elseif _G.SelectMelee == "Electro [$550,000 Beli]" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
    elseif _G.SelectMelee == "Fishman Karate [$750,000 Beli]" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
    elseif _G.SelectMelee == "Dragon Claw [$1,500 Fragments]" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
    elseif _G.SelectMelee == "Superhuman [$3,000,000 Beli]" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
    elseif _G.SelectMelee == "Death Step [$5,000 Fragments + $5,000,000 Beli]" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
    elseif _G.SelectMelee == "Sharkman Karate [$5,000 Fragments + $2,500,000 Beli]" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate", true)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
    elseif _G.SelectMelee == "Electric Claw [$5,000 Fragments + $3,000,000 Beli]" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
    elseif _G.SelectMelee == "Dragon Talon [$5,000 Fragments + $3,000,000 Beli]" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
    elseif _G.SelectMelee == "God Human [$5,000 Fragments + $5,000,000 Beli]" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
    elseif _G.SelectMelee == "Sanguine Art [$5,000 Fragments + $5,000,000 Beli]" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt", true)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt")
    end
end)
Tab12:Seperator("Sword")
Tab12:Dropdown("Select Sword", {
    "Cutlass [$1,000 Beli]",
    "Katana [$1,000 Beli]",
    "Iron Mace [$25,000 Beli]",
    "Dual Katana [$12,000 Beli]",
    "Triple Katana [$60,000 Beli]",
    "Pipe [$100,000 Beli]",
    "Dual - Headed Blade [$400,000 Beli]",
    "Bisento [$1,200,000 Beli]",
    "Soul Cane [$750,000 Beli]",
    "Pole V2 [5,000 Fragments]",
    "Yama Sword [Elite Hunter 30]"
}, function(Param)
    _G.SelectSword = Param
end)
Tab12:Button("Buy Selected Sword", function()
    if _G.SelectSword == "Cutlass [$1,000 Beli]" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Cutlass")
    elseif _G.SelectSword == "Katana [$1,000 Beli]" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Katana")
    elseif _G.SelectSword == "Iron Mace [$25,000 Beli]" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Iron Mace")
    elseif _G.SelectSword == "Dual Katana [$12,000 Beli]" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Duel Katana")
    elseif _G.SelectSword == "Triple Katana [$60,000 Beli]" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Triple Katana")
    elseif _G.SelectSword == "Pipe [$100,000 Beli]" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Pipe")
    elseif _G.SelectSword == "Dual - Headed Blade [$400,000 Beli]" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Dual - Headed Blade")
    elseif _G.SelectSword == "Bisento [$1,200,000 Beli]" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Bisento")
    elseif _G.SelectSword == "Soul Cane [$750,000 Beli]" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Soul Cane")
    elseif _G.SelectSword == "Pole V2 [5,000 Fragments]" then
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ThunderGodTalk")
    elseif _G.SelectSword == "Yama Sword [Elite Hunter 30]" then
        fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector)
    end
end)
Tab13:Button("Rejoin Server", function()
    game:GetService("TeleportService"):Function5(game.PlaceId, game:GetService("Players").LocalPlayer)
end)
Tab13:Button("Function3 Server", function()
    Function3()
end)
Tab13:Button("Fruit Rain [ Old ]", function()
    for I, I2 in pairs(game:GetObjects("rbxassetid://14759368201")[1]:GetChildren()) do
        I2.Parent = game.Workspace.Map
        I2:MoveTo(game.Players.LocalPlayer.Character.PrimaryPart.Position + Vector3.new(math.random(-50, 50), 100, math.random(-50, 50)))
        if I2.Fruit:FindFirstChild("AnimationController") then
            I2.Fruit:FindFirstChild("AnimationController"):LoadAnimation(I2.Fruit:FindFirstChild("Idle")):Play()
        end
        I2.Handle.Touched:Connect(function(Param)
            if Param.Parent == game.Players.LocalPlayer.Character then
                I2.Parent = game.Players.LocalPlayer.Backpack
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(I2)
            end
        end)
    end
end)
Tab6:Button("Reset Character", function()
    game.Players.LocalPlayer.Character.Head:Destroy()
end)
Tab6:Seperator("Function5")
Tab6:Button("Function5 To Top Of Great Tree", function()
    Function35(CFrame.new(2947.556884765625, 2281.630615234375, -7213.54931640625))
end)
Tab6:Button("Function5 To Temple Of Result6", function()
    Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)
end)
Tab6:Button("Function5 To Lever Pull", function()
    Function35(CFrame.new(28575.181640625, 14936.6279296875, 72.316368103027344))
end)
Tab6:Button("Function5 To Race Door", function()
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)
    wait(0.1)
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)
    wait(0.1)
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)
    wait(0.1)
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)
    wait(0.1)
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)
    wait(0.1)
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)
    wait(0.1)
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)
    wait(0.1)
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)
    if game:GetService("Players").LocalPlayer.Data.Race.Value == "Fishman" then
        wait(1)
        Function35(CFrame.new(28224.056640625, 14889.4267578125, -210.587203979492188))
    elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Human" then
        wait(1)
        Function35(CFrame.new(29237.294921875, 14889.4267578125, -206.949554443359375))
    elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg" then
        wait(1)
        Function35(CFrame.new(28492.4140625, 14894.4267578125, -422.110015869140625))
    elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea" then
        wait(1)
        Function35(CFrame.new(28967.408203125, 14918.0751953125, 234.311981201171875))
    elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul" then
        wait(1)
        Function35(CFrame.new(28672.720703125, 14889.1279296875, 454.596160888671875))
    elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink" then
        wait(1)
        Function35(CFrame.new(29020.66015625, 14889.4267578125, -379.268280029296875))
    end
end)
Tab6:Button("Function5 To Acient One", function()
    Function35(CFrame.new(28981.552734375, 14888.4267578125, -120.245849609375))
end)
Tab6:Button("Unlock Lever", function()
    venyx:Notify("Unlocked")
    if game:GetService("Workspace").Map["Temple of Result6"].Lever.Prompt:FindFirstChild("ProximityPrompt") then
        game:GetService("Workspace").Map["Temple of Result6"].Lever.Prompt:FindFirstChild("ProximityPrompt"):Remove()
    end
    wait(0.1)
    local Inst32 = Instance.new("ProximityPrompt")
    Inst32.Parent = game:GetService("Workspace").Map["Temple of Result6"].Lever.Prompt
    Inst32.MaxActivationDistance = 10
    Inst32.ActionText = "Secrets Beholds Inside"
    Inst32.ObjectText = "An unknown lever of time"
    Function45 = function()
        local MainDoor1 = game:GetService("Workspace").Map["Temple of Result6"].MainDoor1
        game:GetService("TweenService"):Create(MainDoor1, TweenInfo.new(10, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
            Position = MainDoor1.Position + Vector3.new(0, -50, 0)
        }):Play()
        local MainDoor2 = game:GetService("Workspace").Map["Temple of Result6"].MainDoor2
        game:GetService("TweenService"):Create(MainDoor2, TweenInfo.new(10, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
            Position = MainDoor2.Position + Vector3.new(0, -50, 0)
        }):Play()
        local Inst33 = Instance.new("Sound")
        Inst33.Parent = workspace
        Inst33.SoundId = "rbxassetid://1904813041"
        Inst33:Play()
        Inst33.Name = "POwfpxzxzfFfFF"
        game:GetService("Workspace").Map["Temple of Result6"].Lever.Prompt:FindFirstChild("ProximityPrompt"):Remove()
        wait(5)
        workspace:FindFirstChild("POwfpxzxzfFfFF"):Remove()
        game:GetService("Workspace").Map["Temple of Result6"].NoGlitching:Remove()
        game:GetService("Workspace").Map["Temple of Result6"].NoGlitching:Remove()
        game:GetService("Workspace").Map["Temple of Result6"].NoGlitching:Remove()
    end
    Inst32.Triggered:Connect(Function45)
end)
Tab6:Button("Clock Acces", function()
    game:GetService("Workspace").Map["Temple of Result6"].DoNotEnter:Remove()
    game:GetService("Workspace").Map["Temple of Result6"].ClockRoomExit:Remove()
end)
Tab6:Button("Disabled Inf Stairs", function()
    game.Players.LocalPlayer.Character.InfiniteStairs.Disabled = true
end)
Tab6:Button("Buy Ancient One Quest", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("UpgradeRace", "Buy")
end)
Tab6:Seperator("Auto Race")
local Label18 = Tab6:Label("")
task.spawn(function()
    while task.wait() do
        pcall(function()
            if game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com / asset/?id = 9709149431" then
                Label18:Set("      : Full Moon 100%")
            elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com / asset/?id = 9709149052" then
                Label18:Set("      \226\128\153 : Full Moon 75%")
            elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com / asset/?id = 9709143733" then
                Label18:Set("      \226\128\156 : Full Moon 50%")
            elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com / asset/?id = 9709150401" then
                Label18:Set("       : Full Moon 25%")
            elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com / asset/?id = 9709149680" then
                Label18:Set("      : Full Moon 15%")
            else
                Label18:Set("Wait For Moon")
            end
        end)
    end
end)
Tab6:Toggle("Auto Finish Trial", false, function(Param)
    _G.AutoQuestRace = Param
    Function38(_G.AutoQuestRace)
end)
spawn(function()
    pcall(function()
        while wait() do
            local AutoQuestRace = _G.AutoQuestRace
            if AutoQuestRace then
                AutoQuestRace = game:GetService("Players").LocalPlayer.Data.Race.Value
                local I2 = nil
                if AutoQuestRace == "Human" then
                    AutoQuestRace = pairs
                    for I, I2 in AutoQuestRace(game.Workspace.Enemies:GetDescendants()) do
                        if I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                            pcall(function()
                                while true do
                                    wait(0.1)
                                    I2.Humanoid.Health = 0
                                    I2.HumanoidRootPart.CanCollide = false
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                    if _G.AutoQuestRace then
                                        local Parent = I2.Parent
                                        if Parent then
                                            Parent = I2.Humanoid.Health
                                            if Parent <= 0 then
                                                break
                                            end
                                        else
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                            end)
                        end
                    end
                else
                    AutoQuestRace = game:GetService("Players").LocalPlayer.Data.Race.Value
                    if AutoQuestRace == "Skypiea" then
                        AutoQuestRace = pairs
                        for I, I2 in AutoQuestRace(game:GetService("Workspace").Map.SkyTrial.Model:GetDescendants()) do
                            if I2.Name == "snowisland_Cylinder.081" then
                                topos(I2.CFrame * CFrame.new(0, 0, 0))
                            end
                        end
                    else
                        AutoQuestRace = game:GetService("Players").LocalPlayer.Data.Race.Value
                        if AutoQuestRace == "Fishman" then
                            AutoQuestRace = pairs
                            for I, I2 in AutoQuestRace(game:GetService("Workspace").SeaBeasts.SeaBeast1:GetDescendants()) do
                                if I2.Name == "HumanoidRootPart" then
                                    topos(I2.CFrame * R03664)
                                    for I3, I4 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                        if I4:IsA("Tool") and I4.ToolTip == "Melee" then
                                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(I4)
                                        end
                                    end
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    wait(0.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    wait(0.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    for I3, I4 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                        if I4:IsA("Tool") and I4.ToolTip == "Blox Fruit" then
                                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(I4)
                                        end
                                    end
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    wait(0.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    wait(0.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    wait(0.5)
                                    for I3, I4 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                        if I4:IsA("Tool") and I4.ToolTip == "Sword" then
                                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(I4)
                                        end
                                    end
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    wait(0.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    wait(0.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    wait(0.5)
                                    for I3, I4 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                        if I4:IsA("Tool") and I4.ToolTip == "Gun" then
                                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(I4)
                                        end
                                    end
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    wait(0.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    wait(0.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                end
                            end
                        else
                            AutoQuestRace = game:GetService("Players").LocalPlayer.Data.Race.Value
                            if AutoQuestRace == "Cyborg" then
                                I2 = -30
                                topos(CFrame.new(28654, 14898.783199999999852, I2, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                            else
                                AutoQuestRace = game:GetService("Players").LocalPlayer.Data.Race.Value
                                if AutoQuestRace == "Ghoul" then
                                    AutoQuestRace = pairs
                                    for I, I2 in AutoQuestRace(game.Workspace.Enemies:GetDescendants()) do
                                        if I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                                            pcall(function()
                                                while true do
                                                    wait(0.1)
                                                    I2.Humanoid.Health = 0
                                                    I2.HumanoidRootPart.CanCollide = false
                                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                                    if _G.AutoQuestRace then
                                                        local Parent = I2.Parent
                                                        if Parent then
                                                            Parent = I2.Humanoid.Health
                                                            if Parent <= 0 then
                                                                break
                                                            end
                                                        else
                                                            break
                                                        end
                                                    else
                                                        break
                                                    end
                                                end
                                            end)
                                        end
                                    end
                                else
                                    AutoQuestRace = game:GetService("Players").LocalPlayer.Data.Race.Value
                                    if AutoQuestRace == "Mink" then
                                        AutoQuestRace = pairs
                                        for I, I2 in AutoQuestRace(game:GetService("Workspace"):GetDescendants()) do
                                            if I2.Name == "StartPoint" then
                                                topos(I2.CFrame * CFrame.new(0, 10, 0))
                                            end
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
end)
Tab6:Toggle("Auto Kill Player After Trial", false, function(Param)
    _G.AutoKillTial = Param
    Function38(_G.AutoKillTial)
end)
spawn(function()
    while wait() do
        local AutoKillTial = _G.AutoKillTial
        if AutoKillTial then
            AutoKillTial = pairs
            for I, I2 in AutoKillTial(game:GetService("Workspace").Characters:GetChildren()) do
                if I2.Name and (I2.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 and 0 < I2.Humanoid.Health then
                    while true do
                        wait()
                        Function32(_G.SelectWeapon)
                        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                            local Service8 = {
                                [1] = "Buso"
                            }
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(Service8))
                        end
                        Function35(I2.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5))
                        Flag133 = true
                        I2.HumanoidRootPart.CanCollide = false
                        I2.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        game:GetService("VirtualUser"):CaptureController()
                        local Service8 = game:GetService("VirtualUser")
                        Service8:Button1Down(Vector2.new(1280, 672), game.Workspace.CurrentCamera.CFrame)
                        Service8 = _G.AutoKillTial
                        if Service8 then
                            Service8 = I2.Parent
                            if Service8 then
                                Service8 = I2.Humanoid.Health
                                if Service8 <= 0 then
                                    break
                                end
                            else
                                break
                            end
                        else
                            break
                        end
                    end
                    Flag133 = false
                end
            end
        end
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if Flag133 then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
            end
        end)
    end
end)
Tab6:Toggle("Auto Buy Gear", false, function(Param)
    _G.Auto_Farm_Bone4 = Param
    Function38(_G.Auto_Farm_Bone4)
end)
spawn(function()
    pcall(function()
        while wait(0.1) do
            local AutoFarmBone4 = _G.Auto_Farm_Bone4
            if AutoFarmBone4 then
                AutoFarmBone4 = {}
                AutoFarmBone4[1] = true
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack({
                    [1] = "UpgradeRace",
                    [2] = "Buy"
                }))
            end
        end
    end)
end)
Tab6:Toggle("Auto Ancient One Quest", false, function(Param)
    _G.AutoRace = Param
    R0619 = Param
    Function38(_G.AutoRace)
end)
spawn(function()
    pcall(function()
        while wait() do
            local AutoRace = _G.AutoRace
            if AutoRace then
                AutoRace = game.Players.LocalPlayer.Character.RaceTransformed.Value
                if AutoRace == true then
                    R0619 = false
                    Function35(CFrame.new(216.211181640625, 126.935203552246094, -12599.0732421875))
                end
            end
        end
    end)
end)
spawn(function()
    while wait() do
        local StardFarm = R0619
        if StardFarm then
            StardFarm = Flag3
            if StardFarm then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Cocoa Warrior") or game:GetService("Workspace").Enemies:FindFirstChild("Chocolate Bar Battler") or game:GetService("Workspace").Enemies:FindFirstChild("Sweet Thief") or game:GetService("Workspace").Enemies:FindFirstChild("Candy Rebel") then
                        for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if (I2.Name == "Cocoa Warrior" or I2.Name == "Chocolate Bar Battler" or I2.Name == "Sweet Thief" or I2.Name == "Candy Rebel") and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                                while true do
                                    task.wait()
                                    Function30()
                                    Function32(_G.SelectWeapon)
                                    I2.HumanoidRootPart.CanCollide = false
                                    I2.Humanoid.WalkSpeed = 0
                                    I2.Head.CanCollide = false
                                    Flag136 = true
                                    CFrame51 = I2.HumanoidRootPart.CFrame
                                    Function35(I2.HumanoidRootPart.CFrame * R03664)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    if R0619 then
                                        local Parent = I2.Parent
                                        if Parent then
                                            Parent = I2.Humanoid.Health
                                            if Parent <= 0 then
                                                break
                                            end
                                        else
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                            end
                        end
                    else
                        Flag136 = false
                        Function35(CFrame.new(216.211181640625, 126.935203552246094, -12599.0732421875))
                        for I, I2 in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
                            if I2.Name == "Cocoa Warrior" then
                                Function35(I2.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                            elseif I2.Name == "Chocolate Bar Battler" then
                                Function35(I2.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                            elseif I2.Name == "Sweet Thief" then
                                Function35(I2.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                            elseif I2.Name == "Candy Rebel" then
                                Function35(I2.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                            end
                        end
                    end
                end)
            end
        end
    end
end)
spawn(function()
    pcall(function()
        while wait() do
            local AutoRace = _G.AutoRace
            if AutoRace then
                AutoRace = game.Players.LocalPlayer.Character.RaceTransformed.Value
                if AutoRace == false then
                    AutoRace = true
                    R0619 = AutoRace
                end
            end
        end
    end)
end)
spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoRace then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "Y", false, game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, "Y", false, game)
            end
        end)
    end
end)
Tab6:Seperator("Mirage Island")
Result9 = Tab6:Label("")
spawn(function()
    pcall(function()
        while wait() do
            local Child = game.Workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island")
            if Child then
                Result9:Set("      \239\184\143: Mirage Island is Spawning")
            else
                Result9:Set("\226\157\140: Mirage Island Not Found")
            end
        end
    end)
end)
Tab6:Toggle("Auto Function5 To Mirage Island", false, function(Param)
    _G.AutoMysticIsland = Param
    Function38(_G.AutoMysticIsland)
end)
spawn(function()
    pcall(function()
        while wait() do
            local AutoMysticIsland = _G.AutoMysticIsland
            if AutoMysticIsland then
                AutoMysticIsland = game:GetService("Workspace").Map:FindFirstChild("MysticIsland")
                if AutoMysticIsland then
                    Function35(CFrame.new(game:GetService("Workspace").Map.MysticIsland.Center.Position.X, 500, game:GetService("Workspace").Map.MysticIsland.Center.Position.Z))
                end
            end
        end
    end)
end)
Tab6:Toggle("Auto Drive Boats", false, function(Param)
    R0603 = Param
end)
spawn(function()
    while wait() do
        pcall(function()
            if R0603 then
                game:service("VirtualInputManager"):SendKeyEvent(true, "W", false, game)
                wait(0.35)
                game:service("VirtualInputManager"):SendKeyEvent(false, "W", false, game)
                wait(1.5)
                game:service("VirtualInputManager"):SendKeyEvent(true, "S", false, game)
                wait(0.35)
                game:service("VirtualInputManager"):SendKeyEvent(false, "S", false, game)
                wait(1.5)
            end
        end)
    end
end)
Tab6:Toggle("Auto Mirage Island", false, function(Param)
    if state then
        _G.dao = true
    else
        _G.dao = false
    end
    if _G.dao then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        wait(1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5411.220210000000407, 778.609863000000018, -2682.277590000000146, 0.927179396, 0, 0.374617696, 0, 1, 0, -0.374617696, 0, 0.927179396)
        wait(0)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
            [1] = "BuyBoat",
            [2] = "PirateBrigade"
        }))
        Function46 = function(Input)
            pcall(function()
                game.Players.LocalPlayer.Character.Humanoid.Sit = false
                game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
            end)
            local Magnitude = (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Input.Position).Magnitude
            if Magnitude <= 200 then
                pcall(function()
                    Var4:Cancel()
                end)
                Magnitude = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                Magnitude.CFrame = Input
            else
                Magnitude = game:service("TweenService")
                local Inst32 = TweenInfo.new((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Input.Position).Magnitude / 325, Enum.EasingStyle.Linear)
                Result3, Value25 = pcall(function()
                    Var4 = Magnitude:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, Inst32, {
                        CFrame = Input
                    })
                    Var4:Play()
                end)
                if not Result3 then
                    return Value25
                end
            end
            Magnitude = function()
                Var4:Cancel()
            end
            R1642 = Magnitude
        end
        Function46(CFrame.new(-5100.708499999999731, 29.968585999999998, -6792.45459000000028, -0.33648631, -0.0396691673, 0.940852463, -0.000000640461678, 0.999112308, 0.0421253517, -0.941688359, 0.0141740013, -0.336187631))
        wait(13)
        local Next = next
        local Descendants, Value8 = workspace.Boats.PirateBrigade:GetDescendants()
        for I, I2 in Next, Descendants, Value8 do
            if I2.Name:find("VehicleSeat") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = I2.CFrame
                if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                    Function35(game:GetService("Workspace").Map:FindFirstChild("MysticIsland").HumanoidRootPart.CFrame * CFrame.new(0, 500, -100))
                end
            end
        end
    end
end)
Tab6:Toggle("Auto Function5 To Advanced Fruit Dealer", false, function(Param)
    _G.Miragenpc = Param
    Function38(_G.Miragenpc)
end)
spawn(function()
    pcall(function()
        while wait() do
            local Miragenpc = _G.Miragenpc
            if Miragenpc then
                Miragenpc = game:GetService("Workspace").NPCs:FindFirstChild("Advanced Fruit Dealer")
                if Miragenpc then
                    Function35(CFrame.new(game:GetService("Workspace").NPCs["Advanced Fruit Dealer"].HumanoidRootPart.Position))
                end
            end
        end
    end)
end)
Tab6:Toggle("Auto Lock Cam To Moon", false, function(Param)
    _G.AutoDooHee = Param
end)
spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoDooHee then
                wait(0.5)
                game.Workspace.CurrentCamera.CFrame = CFrame.lookAt(game.Workspace.CurrentCamera.CFrame.p, game.Workspace.CurrentCamera.CFrame.p + game.Lighting:GetMoonDirection() * 100)
            end
        end)
    end
end)
Tab6:Toggle("Auto Function5 To Blue Gear", false, function(Param)
    _G.TweenMGear = Param
    Function38(_G.TweenMGear)
end)
spawn(function()
    pcall(function()
        while wait() do
            local TweenMGear = _G.TweenMGear
            if TweenMGear then
                TweenMGear = game:GetService("Workspace").Map:FindFirstChild("MysticIsland")
                if TweenMGear then
                    TweenMGear = pairs
                    for I, I2 in TweenMGear(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do
                        if I2:IsA("MeshPart") and I2.Material == Enum.Material.Neon then
                            Function35(I2.CFrame)
                        end
                    end
                end
            end
        end
    end)
end)
Tab6:Toggle("Auto Farm Chest Mirage Island", false, function(Param)
    _G.AutoChestMirage = Param
    Function38(_G.AutoChestMirage)
end)
_G.MagnitudeAdd = 0
spawn(function()
    while wait() do
        local AutoChestMirage = _G.AutoChestMirage
        if AutoChestMirage then
            AutoChestMirage = pairs
            for I, I2 in AutoChestMirage(game:GetService("Workspace"):GetChildren()) do
                if I2.Name:find("FragChest") and game:GetService("Workspace"):FindFirstChild(I2.Name) and (I2.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5000 + _G.MagnitudeAdd then
                    while true do
                        wait()
                        if game:GetService("Workspace"):FindFirstChild(I2.Name) then
                            topos(I2.CFrame)
                        end
                        local AutoChestMirage2 = _G.AutoChestMirage
                        if AutoChestMirage2 ~= false then
                            AutoChestMirage2 = I2.Parent
                            if not AutoChestMirage2 then
                                break
                            end
                        else
                            break
                        end
                    end
                    TP(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                    _G.MagnitudeAdd = _G.MagnitudeAdd + 1500
                end
            end
        end
    end
end)
Tab7:Button("Reset Character", function()
    game.Players.LocalPlayer.Character.Head:Destroy()
end)
Result10 = Tab7:Label("")
spawn(function()
    pcall(function()
        while wait() do
            local Child = game.Workspace._WorldOrigin.Locations:FindFirstChild("Frozen Dimension")
            if Child then
                Result10:Set("\226\156\133: Frozen Dimension Spawning")
            else
                Result10:Set("\226\157\140: Frozen Dimension Not Found")
            end
        end
    end)
end)
Tab7:Toggle("Function5 To Frozen Dimension", false, function(Param)
    _G.TweenFrozenDimension = Param
    Function38(_G.AutoFrozenDimension)
end)
spawn(function()
    while wait() do
        local TweenFrozenDimension = _G.TweenFrozenDimension
        if TweenFrozenDimension then
            pcall(function()
                if game.Workspace._WorldOrigin.Locations:FindFirstChild("Frozen Dimension") then
                    Function35(game.Workspace._WorldOrigin.Locations:FindFirstChild("Frozen Dimension").HumanoidRootPart.CFrame * CFrame.new(0, 500, -100))
                end
            end)
        end
    end
end)
Tab7:Seperator("Kitsune Event")
local String2 = "AddSeperator"
String2 = "Status Kitsune"
Tab7[String2](String2)
String2 = "AddLabel"
String2 = "N / A"
local Result8 = Tab14[String2](String2)
task.spawn(function()
    while task.wait() do
        pcall(function()
            if game.Workspace.Map:FindFirstChild("KitsuneIsland") then
                Result8:Set("       Kitsune Island:  \226\156\133")
            else
                Result8:Set("       Kitsune Island:  \226\157\140")
            end
        end)
    end
end)
Tab7:Toggle("Function5 To Kitsune Island", false, function(Param)
    _G.AutoFKitsune = Param
    Function38(_G.AutoFKitsune)
end)
spawn(function()
    while wait() do
        local AutoFKitsune = _G.AutoFKitsune
        if AutoFKitsune then
            pcall(function()
                if game.Workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island") then
                    topos(game.Workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island").HumanoidRootPart.CFrame * CFrame.new(0, 100, 0))
                end
            end)
        end
    end
end)
Tab7:Toggle("Auto Collect Azure", false, function(Param)
    _G.AutoCollectAzure = Param
end)
spawn(function()
    while wait() do
        local AutoCollectAzure = _G.AutoCollectAzure
        if AutoCollectAzure then
            pcall(function()
                local Next = next
                local Descendants, Value8 = game:GetService("Workspace").EmberTemplate:GetDescendants()
                for I, I2 in Next, Descendants, Value8 do
                    if I2.Name == "Part" then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = I2.CFrame
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        local AutoFKitsune = _G.AutoFKitsune
        if AutoFKitsune then
            pcall(function()
                if game.Workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island") then
                    Function35(game.Workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island").HumanoidRootPart.CFrame * CFrame.new(0, 100, 0))
                end
            end)
        end
    end
end)
local String3 = "AddButton"
String3 = "Trade Azure Ember"
Tab7[String3](String3, function()
    game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF / KitsuneStatuePray"):InvokeServer()
end)
Tab7:Seperator("Sea Event")
Tab7:Toggle("Auto Driver,Sail Boat & Tween To Zone 6 ", false, function(Param)
    _G.SailBoat = Param
    Function38(_G.SailBoat)
end)
local Inst32 = CFrame.new(-42250.22269999999844, -0.3221744, 9247.077149999999165, -0.45916447, 0.000000063904324, 0.888351262, -0.000000033671142, 1, -0.000000089339565, -0.888351262, -0.000000070933361, -0.45916447)
spawn(function()
    while wait() do
        pcall(function()
            if _G.SailBoat and (not game:GetService("Workspace").Enemies:FindFirstChild("Shark") or not game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark") or not game:GetService("Workspace").Enemies:FindFirstChild("Piranha") or not game:GetService("Workspace").Enemies:FindFirstChild("R0312 Crew Member")) then
                if not game:GetService("Workspace").Boats:FindFirstChild("PirateGrandBrigade") then
                    Result5 = TweenBoat(CFrame.new(-16927.451171875, 9.086361885070801, 433.864288330078125))
                    if (CFrame.new(-16927.451171875, 9.086361885070801, 433.864288330078125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 10 then
                        if Result5 then
                            Result5:Stop()
                        end
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                            [1] = "BuyBoat",
                            [2] = "PirateGrandBrigade"
                        }))
                    end
                elseif game:GetService("Workspace").Boats:FindFirstChild("PirateGrandBrigade") then
                    if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == false then
                        TweenBoat(game:GetService("Workspace").Boats.PirateGrandBrigade.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
                    else
                        for I, I2 in pairs(game:GetService("Workspace").Boats:GetChildren()) do
                            if I2.Name == "PirateGrandBrigade" then
                                while true do
                                    wait()
                                    if (CFrame.new(-17013.80078125, 10.962434768676758, 438.016998291015625).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 10 then
                                        TweenShip(CFrame.new(-33163.1875, 10.964323997497559, -324.484222412109375))
                                    else
                                        local Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                                        local Child = (CFrame.new(-33163.1875, 10.964323997497559, -324.484222412109375).Position - Position).magnitude
                                        if Child <= 10 then
                                            TweenShip(CFrame.new(-37952.49609375, 10.96342945098877, -1324.12109375))
                                        else
                                            Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                                            Child = (CFrame.new(-37952.49609375, 10.96342945098877, -1324.12109375).Position - Position).magnitude
                                            if Child <= 10 then
                                                TweenShip(CFrame.new(-33163.1875, 10.964323997497559, -324.484222412109375))
                                            end
                                        end
                                    end
                                    local Child = game:GetService("Workspace").Enemies:FindFirstChild("Shark")
                                    if not Child then
                                        Child = game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark")
                                        if not Child then
                                            Child = game:GetService("Workspace").Enemies:FindFirstChild("Piranha")
                                            if not Child then
                                                Child = game:GetService("Workspace").Enemies:FindFirstChild("R0312 Crew Member")
                                                if not Child then
                                                    Child = _G.SailBoat
                                                    if Child == false then
                                                        break
                                                    end
                                                else
                                                    break
                                                end
                                            else
                                                break
                                            end
                                        else
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)
spawn(function()
    pcall(function()
        while wait() do
            local SailBoat = _G.SailBoat
            if SailBoat then
                SailBoat = game:GetService("Workspace").Enemies:FindFirstChild("Shark")
                if not SailBoat then
                    SailBoat = game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark")
                    if not SailBoat then
                        SailBoat = game:GetService("Workspace").Enemies:FindFirstChild("Piranha")
                        if not SailBoat then
                            SailBoat = game:GetService("Workspace").Enemies:FindFirstChild("R0312 Crew Member")
                            if not SailBoat then
                                -- empty block
                            end
                        end
                    end
                end
                SailBoat = game.Players.LocalPlayer.Character.Humanoid
                SailBoat.Sit = false
            end
        end
    end)
end)
Tab7:Toggle("Auto Kill Terror Shark", false, function(Param)
    _G.AutoTerrorshark = Param
    Function38(_G.AutoTerrorshark)
end)
spawn(function()
    while wait() do
        local AutoTerrorshark = _G.AutoTerrorshark
        if AutoTerrorshark then
            AutoTerrorshark = Flag3
            if AutoTerrorshark then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark") then
                        for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if I2.Name == "Terrorshark" and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                                while true do
                                    task.wait()
                                    Function30()
                                    Function32(_G.SelectWeapon)
                                    I2.HumanoidRootPart.CanCollide = false
                                    I2.Humanoid.WalkSpeed = 0
                                    CFrame55 = I2.HumanoidRootPart.CFrame
                                    I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    Function35(I2.HumanoidRootPart.CFrame * R03664)
                                    Flag144 = true
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    if _G.AutoTerrorshark then
                                        local Parent = I2.Parent
                                        if Parent then
                                            Parent = I2.Humanoid.Health
                                            if Parent <= 0 then
                                                break
                                            end
                                        else
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                                Flag144 = false
                            end
                        end
                    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark") then
                        Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                    elseif _G.AutoTerrorsharkhop then
                        Function3()
                    end
                end)
            end
        end
    end
end)
Tab7:Toggle("Auto Kill Shark", false, function(Param)
    R0698 = Param
    Function38(R0698)
end)
spawn(function()
    while wait() do
        local FarmShark = R0698
        if FarmShark then
            FarmShark = Flag3
            if FarmShark then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Shark") then
                        for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if I2.Name == "Shark" and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                                while true do
                                    task.wait()
                                    Function30()
                                    Function32(_G.SelectWeapon)
                                    I2.HumanoidRootPart.CanCollide = false
                                    I2.Humanoid.WalkSpeed = 0
                                    I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    CFrame55 = I2.HumanoidRootPart.CFrame
                                    Function35(I2.HumanoidRootPart.CFrame * R03664)
                                    Flag144 = true
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    if R0698 then
                                        local Parent = I2.Parent
                                        if Parent then
                                            Parent = I2.Humanoid.Health
                                            if Parent <= 0 then
                                                break
                                            end
                                        else
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                                Flag144 = false
                            end
                        end
                    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark") then
                        Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                    elseif _G.AutoTerrorsharkhop then
                        Function3()
                    end
                end)
            end
        end
    end
end)
Tab7:Toggle("Auto Kill Piranha", false, function(Param)
    _G.farmpiranya = Param
    Function38(_G.farmpiranya)
end)
spawn(function()
    while wait() do
        local Farmpiranya = _G.farmpiranya
        if Farmpiranya then
            Farmpiranya = Flag3
            if Farmpiranya then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Piranha") then
                        for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if I2.Name == "Piranha" and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                                while true do
                                    task.wait()
                                    Function30()
                                    Function32(_G.SelectWeapon)
                                    I2.HumanoidRootPart.CanCollide = false
                                    I2.Humanoid.WalkSpeed = 0
                                    CFrame55 = I2.HumanoidRootPart.CFrame
                                    I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    Function35(I2.HumanoidRootPart.CFrame * R03664)
                                    Flag144 = true
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    if _G.farmpiranya then
                                        local Parent = I2.Parent
                                        if Parent then
                                            Parent = I2.Humanoid.Health
                                            if Parent <= 0 then
                                                break
                                            end
                                        else
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                                Flag144 = false
                            end
                        end
                    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Piranha") then
                        Function35(game:GetService("ReplicatedStorage"):FindFirstChild("Piranha").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                    elseif _G.AutoTerrorsharkhop then
                        Function3()
                    end
                end)
            end
        end
    end
end)
Tab7:Toggle("Auto Kill R0312 Crew Member", false, function(Param)
    _G.Fish_Crew_Member = Param
    Function38(_G.Fish_Crew_Member)
end)
spawn(function()
    while wait() do
        local FishCrewMember = _G.Fish_Crew_Member
        if FishCrewMember then
            FishCrewMember = Flag3
            if FishCrewMember then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("R0312 Crew Member") then
                        for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if I2.Name == "R0312 Crew Member" and I2:FindFirstChild("Humanoid") and I2:FindFirstChild("HumanoidRootPart") and 0 < I2.Humanoid.Health then
                                while true do
                                    task.wait()
                                    Function30()
                                    Function32(_G.SelectWeapon)
                                    I2.HumanoidRootPart.CanCollide = false
                                    I2.Humanoid.WalkSpeed = 0
                                    CFrame55 = I2.HumanoidRootPart.CFrame
                                    I2.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    Flag144 = true
                                    Function35(I2.HumanoidRootPart.CFrame * R03664)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    if _G.Fish_Crew_Member then
                                        local Parent = I2.Parent
                                        if Parent then
                                            Parent = I2.Humanoid.Health
                                            if Parent <= 0 then
                                                break
                                            end
                                        else
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                                Flag144 = false
                            end
                        end
                    elseif game:GetService("ReplicatedStorage"):FindFirstChild("R0312 Crew Member") then
                        Function35(game:GetService("ReplicatedStorage"):FindFirstChild("R0312 Crew Member").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                    elseif _G.AutoTerrorsharkhop then
                        Function3()
                    end
                end)
            end
        end
    end
end)
Tab7:Toggle("Auto Kill Raid Ship", false, function(Param)
    _G.KillGhostShip = Param
    Function38(_G.KillGhostShip)
end)
spawn(function()
    while wait() do
        local KillGhostShip = _G.KillGhostShip
        if KillGhostShip then
            pcall(function()
                if Function41() then
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 32, false, game)
                    wait(0.5)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 32, false, game)
                    local Result9 = Function41()
                    while true do
                        wait()
                        spawn(topos(Result9.Engine.CFrame * CFrame.new(0, -20, 0)), 1)
                        HumanoidRootPart = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -5, 0)
                        Flag168 = true
                        Flag167 = false
                        if Result9 then
                            local Parent = Result9.Parent
                            if Parent then
                                Parent = Result9.Health.Value
                                if Parent > 0 then
                                    Parent = Function41()
                                    if not Parent then
                                        break
                                    end
                                else
                                    break
                                end
                            else
                                break
                            end
                        else
                            break
                        end
                    end
                    Flag168 = true
                    Flag167 = false
                end
            end)
        end
    end
end)
Tab7:Toggle("Auto Kill Ghost Ship", false, function(Param)
    _G.bjirFishBoat = Param
    Function38(_G.bjirFishBoat)
end)
spawn(function()
    while wait() do
        pcall(function()
            if _G.bjirFishBoat and Function41() then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, 32, false, game)
                wait(0.5)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, 32, false, game)
                local Result9 = Function41()
                while true do
                    wait()
                    spawn(topos(Result9.Engine.CFrame * CFrame.new(0, -20, 0), 1))
                    Flag167 = true
                    Flag168 = true
                    HumanoidRootPart = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -5, 0)
                    if not Result9.Parent then
                        local Value8 = Result9.Health.Value
                        if Value8 > 0 then
                            Value8 = Function41()
                            if not Value8 then
                                break
                            end
                        else
                            break
                        end
                    else
                        break
                    end
                end
                Flag167 = false
                Flag168 = false
            end
        end)
    end
end)
spawn(function()
    while wait() do
        local BjirFishBoat = _G.bjirFishBoat
        if BjirFishBoat then
            pcall(function()
                if Function41() then
                    Function30()
                    game:GetService("VirtualUser"):CaptureController()
                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                    for I, I2 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if I2:IsA("Tool") and I2.ToolTip == "Melee" then
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(I2)
                        end
                    end
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    wait(0.2)
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    wait(0.2)
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    wait(0.2)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    for I, I2 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if I2:IsA("Tool") and I2.ToolTip == "Blox Fruit" then
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(I2)
                        end
                    end
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    wait(0.2)
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    wait(0.2)
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    wait(0.2)
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "V", false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, "V", false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    wait(0.6)
                    for I, I2 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if I2:IsA("Tool") and I2.ToolTip == "Sword" then
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(I2)
                        end
                    end
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    wait(0.2)
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    wait(0.2)
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    wait(0.5)
                    for I, I2 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if I2:IsA("Tool") and I2.ToolTip == "Gun" then
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(I2)
                        end
                    end
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    wait(0.2)
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    wait(0.2)
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                end
            end)
        end
    end
end)
Tab7:Toggle("Function5 To Sea Beast", false, function(Param)
    _G.AutoSeaBest = Param
    Function38(_G.AutoSeaBest)
end)
spawn(function()
    while wait() do
        local AutoSeaBest = _G.AutoSeaBest
        if AutoSeaBest then
            pcall(function()
                for I, I2 in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
                    if I2:FindFirstChild("HumanoidRootPart") then
                        Function30()
                        Function32(_G.SelectWeapon)
                        Function35(I2.HumanoidRootPart.CFrame * CFrame.new(0, 300, 0))
                        game:GetService("VirtualUser"):CaptureController()
                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                    elseif _G.AutoSeaBestHop then
                        Function3()
                    end
                end
            end)
        end
    end
end)
Tab7:Toggle("Auto Sea Beast", false, function(Param)
    _G.Auto_Seabest = Param
    Function38(_G.Auto_Seabest)
end)
String2 = getrawmetatable(game)
String3 = String2.__namecall
setreadonly(String2, false)
String2.__namecall = newcclosure(function(...)
    local Result9 = getnamecallmethod()
    local Value8 = {
        ...
    }
    if tostring(Result9) == "FireServer" and tostring(Value8[1]) == "RemoteEvent" and tostring(Value8[2]) ~= "true" and tostring(Value8[2]) ~= "false" and Flag168 then
        Value8[2] = HumanoidRootPart
        return String3(unpack(Value8))
    end
    return String3(...)
end)
Flag153 = true
Flag154 = true
Flag155 = true
Flag156 = true
spawn(function()
    while wait() do
        pcall(function()
            if Flag167 then
                if Flag153 then
                    game:service("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                    wait(0.1)
                    game:service("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                end
                if Flag154 then
                    game:service("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                    wait(0.1)
                    game:service("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                end
                if Flag155 then
                    game:service("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                    wait(0.1)
                    game:service("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
                end
                if Flag156 then
                    game:service("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
                    wait(0.1)
                    game:service("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
                end
            end
        end)
    end
end)
task.spawn(function()
    while wait() do
        pcall(function()
            if _G.Auto_Seabest then
                if not game:GetService("Workspace").SeaBeasts:FindFirstChild("SeaBeast1") then
                    if not game:GetService("Workspace").Boats:FindFirstChild("PirateBrigade") then
                        if not game:GetService("Workspace").Boats:FindFirstChild("PirateBrigade") then
                            if not game:GetService("Workspace").Boats:FindFirstChild("PirateBrigade") then
                                Result5 = Function37(CFrame.new(-16927.451171875, 9.086361885070801, 433.864288330078125))
                                if (CFrame.new(-16927.451171875, 9.086361885070801, 433.864288330078125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 10 then
                                    if Result5 then
                                        Result5:Stop()
                                    end
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                        [1] = "BuyBoat",
                                        [2] = "PirateBrigade"
                                    }))
                                end
                            elseif game:GetService("Workspace").Boats:FindFirstChild("PirateBrigade") then
                                if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == false then
                                    Function37(game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
                                elseif game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == true then
                                    wait()
                                    if (game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 10 then
                                        Function36(CFrame.new(35.045524597167969, 17.750778198242188, 4819.267578125))
                                    end
                                    if not game:GetService("Workspace").SeaBeasts:FindFirstChild("SeaBeast1") and _G.Auto_Seabest ~= false and game:GetService("Workspace").Enemies:FindFirstChild("PirateBrigade") then
                                        for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                            if I2.Name == "PirateBrigade" and I2:FindFirstChild("VehicleSeat") then
                                                while true do
                                                    wait()
                                                    game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit = false
                                                    Function37(I2.VehicleSeat.CFrame * CFrame.new(0, 30, 0))
                                                    Function42()
                                                    Flag167 = true
                                                    HumanoidRootPart = I2.VehicleSeat
                                                    Flag168 = true
                                                    if game:GetService("Workspace").Boats:FindFirstChild("PirateBrigade") then
                                                        local AutoSeabest = _G.Auto_Seabest
                                                        if AutoSeabest == false then
                                                            break
                                                        end
                                                    else
                                                        break
                                                    end
                                                end
                                                Flag167 = false
                                                Flag168 = false
                                            end
                                        end
                                    end
                                end
                            end
                        else
                            -- empty block
                        end
                    elseif game:GetService("Workspace").Enemies:FindFirstChild("PirateBasic") then
                        for I, I2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if I2.Name == "PirateBasic" and I2:FindFirstChild("VehicleSeat") then
                                while true do
                                    wait()
                                    game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit = false
                                    Function37(I2.VehicleSeat.CFrame * CFrame.new(0, 30, 0))
                                    Function42()
                                    Flag167 = true
                                    HumanoidRootPart = I2.VehicleSeat
                                    Flag168 = true
                                    if game:GetService("Workspace").Boats:FindFirstChild("PirateBrigade") then
                                        local AutoSeabest = _G.Auto_Seabest
                                        if AutoSeabest == false then
                                            break
                                        end
                                    else
                                        break
                                    end
                                end
                                Flag167 = false
                                Flag168 = false
                            end
                        end
                    end
                elseif game:GetService("Workspace").SeaBeasts:FindFirstChild("SeaBeast1") then
                    for I, I2 in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
                        if I2:FindFirstChild("HumanoidRootPart") then
                            while true do
                                wait()
                                game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit = false
                                Function37(I2.HumanoidRootPart.CFrame * CFrame.new(0, 500, 0))
                                Function42()
                                Flag167 = true
                                HumanoidRootPart = I2.HumanoidRootPart
                                Flag168 = true
                                if I2:FindFirstChild("HumanoidRootPart") then
                                    local AutoSeabest = _G.Auto_Seabest
                                    if AutoSeabest == false then
                                        break
                                    end
                                else
                                    break
                                end
                            end
                            Flag167 = false
                            Flag168 = false
                        end
                    end
                end
            end
        end)
    end
end)
Tab7:Seperator("ESP")
Tab7:Toggle("ESP Mirage", false, function(Param)
    _G.AutoESPislandMNM = Param
    R0259 = Param
    Function21()
end)
spawn(function()
    pcall(function()
        while wait() do
            local AutoEsPislandMnm = _G.AutoESPislandMNM
            if AutoEsPislandMnm then
                Function21()
            end
        end
    end)
end)
Tab7:Toggle("ESP Advance Dealer", false, function(Param)
    _G.AutoESPAFD = Param
    R0158 = Param
    Function23()
end)
spawn(function()
    pcall(function()
        while wait() do
            local AutoEspafd = _G.AutoESPAFD
            if AutoEspafd then
                Function23()
            end
        end
    end)
end)
local String4 = "AddSeperator"
String4 = "Status Game"
Tab14[String4](String4)
String4 = "AddLabel"
String4 = "Executer Result6"
Result6 = Tab14[String4](String4)
Function47 = function()
    local Floor = math.floor(workspace.DistributedGameTime + 0.5)
    Result6:Set("[Sever Result6]: Hours: " .. math.floor(Floor / 3600) % 24 .. " Min: " .. math.floor(Floor / 60) % 60 .. " Sec: " .. math.floor(Floor / 1) % 60)
end
spawn(function()
    while task.wait() do
        pcall(function()
            Function47()
        end)
    end
end)
String4 = "AddLabel"
String4 = "Result7"
Result7 = Tab14[String4](String4)
Function48 = function()
    Result7:Set("[FPS]: " .. workspace:GetRealPhysicsFPS())
end
spawn(function()
    while true do
        wait(0.1)
        Function48()
    end
end)
String4 = "AddLabel"
String4 = "Result7"
Result8 = Tab14[String4](String4)
Function49 = function()
    Result8:Set("[PING]: " .. game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString())
end
spawn(function()
    while true do
        wait(0.1)
        Function49()
    end
end)
String4 = "AddLabel"
String4 = "Exploit Using: " .. identifyexecutor()
Tab14[String4](String4)
String4 = "AddSeperator"
String4 = "Status Sever"
Tab14[String4](String4)
String4 = "AddSeperator"
String4 = "Status Elite"
Tab14[String4](String4)
String4 = "AddLabel"
String4 = "N / A"
local Result9 = Tab14[String4](String4)
spawn(function()
    pcall(function()
        while wait() do
            Result9:Set("Elite Progress: " .. game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter", "Progress"))
        end
    end)
end)
local String5 = "AddLabel"
String5 = "N / A"
local Result10 = Tab14[String5](String5)
spawn(function()
    while wait() do
        pcall(function()
            if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") or game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") or game:GetService("ReplicatedStorage"):FindFirstChild("Urban") or game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban") then
                Result10:Set("Status: \226\156\133")
            else
                Result10:Set("Status: \226\157\140")
            end
        end)
    end
end)
local String6 = "AddSeperator"
String6 = "Status Kitsune"
Tab14[String6](String6)
String6 = "AddLabel"
String6 = "N / A"
String4 = Tab14[String6](String6)
task.spawn(function()
    while task.wait() do
        pcall(function()
            if game.Workspace.Map:FindFirstChild("KitsuneIsland") then
                String4:Set("       Kitsune Island:  \226\156\133")
            else
                String4:Set("       Kitsune Island:  \226\157\140")
            end
        end)
    end
end)
local String7 = "AddSeperator"
String7 = "Status Mirage"
Tab14[String7](String7)
spawn(function()
    pcall(function()
        while wait() do
            local Child = game.Workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island")
            if Child then
                Result9:Set("      \239\184\143: Mirage Island is Spawning")
            else
                Result9:Set("\226\157\140: Mirage Island Not Found")
            end
        end
    end)
end)
String7 = "AddLabel"
String7 = "N / A"
Result9 = Tab14[String7](String7)
String7 = "AddSeperator"
String7 = "Status Moon"
Tab14[String7](String7)
String7 = "AddLabel"
String7 = "Wait For Moon..."
String5 = Tab14[String7](String7)
task.spawn(function()
    while task.wait() do
        pcall(function()
            if game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com / asset/?id = 9709149431" then
                String5:Set("      : Full Moon 100%")
            elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com / asset/?id = 9709149052" then
                String5:Set("      \226\128\153: Full Moon 75%")
            elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com / asset/?id = 9709143733" then
                String5:Set("      \226\128\156: Full Moon 50%")
            elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com / asset/?id = 9709150401" then
                String5:Set("      : Full Moon 25%")
            elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com / asset/?id = 9709149680" then
                String5:Set("      : Full Moon 15%")
            else
                String5:Set("Wait For Moon")
            end
        end)
    end
end)
local String8 = "AddSeperator"
String8 = "Status Frozen"
Tab14[String8](String8)
spawn(function()
    pcall(function()
        while wait() do
            local Child = game.Workspace._WorldOrigin.Locations:FindFirstChild("Frozen Dimension")
            if Child then
                Result10:Set("\226\156\133: Frozen Dimension Spawning")
            else
                Result10:Set("\226\157\140: Frozen Dimension Not Found")
            end
        end
    end)
end)
String8 = "AddLabel"
String8 = "N / A"
Result10 = Tab14[String8](String8)
String8 = "AddSeperator"
String8 = "Status Bone"
Tab14[String8](String8)
String8 = "AddLabel"
String8 = "Total Bone: N / A"
Result11 = Tab14[String8](String8)
spawn(function()
    while wait() do
        pcall(function()
            Result11:Set("Total Bone: " .. game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Check"))
        end)
    end
end)
String8 = "AddSeperator"
String8 = "Status Observation"
Tab14[String8](String8)
String8 = "AddLabel"
String8 = "Observation Range Level: N / A"
String6 = Tab14[String8](String8)
spawn(function()
    while wait() do
        pcall(function()
            String6:Set("Observation Range Level: " .. math.floor(game:GetService("Players").LocalPlayer.VisionRadius.Value))
        end)
    end
end)
local String9 = "AddSeperator"
String9 = "Status Legend Swords"
Tab14[String9](String9)
spawn(function()
    pcall(function()
        while wait() do
            local InvokeServerOp = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1")
            if InvokeServerOp then
                LegendSwordsSet("Shisui")
            else
                InvokeServerOp = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "2")
                if InvokeServerOp then
                    Result12:Set("Wando")
                else
                    InvokeServerOp = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "3")
                    if InvokeServerOp then
                        Result12:Set("Saddi")
                    else
                        Result12:Set("Not Found Legend Swords")
                    end
                end
            end
        end
    end)
end)
String9 = "AddLabel"
String9 = "N / A"
Result12 = Tab14[String9](String9)
String9 = "AddSeperator"
String9 = "Status Haki Dealer"
Tab14[String9](String9)
spawn(function()
    pcall(function()
        while wait() do
            local Service8 = game:GetService("ReplicatedStorage")
            Service8 = Service8:WaitForChild("Remotes")
            Service8 = Service8:WaitForChild("CommF_")
            Service8 = Service8:InvokeServer("ColorsDealer", "1")
            if Service8 then
                Result13:Set(KuyKoben)
            else
                Result13:Set("Not Found Haki Dealer")
            end
        end
    end)
end)
String9 = "AddLabel"
String9 = "N / A"
Result13 = Tab14[String9](String9)
String9 = "AddSeperator"
String9 = "Status Player"
Tab14[String9](String9)
String9 = "AddLabel"
String9 = "Level"
String7 = Tab14[String9](String9)
spawn(function()
    while wait() do
        pcall(function()
            String7:Set("Level:" .. " " .. game:GetService("Players").LocalPlayer.Data.Level.Value)
        end)
    end
end)
local String10 = "AddLabel"
String10 = "Race"
String8 = Tab14[String10](String10)
spawn(function()
    while wait() do
        pcall(function()
            String8:Set("Race:" .. " " .. game:GetService("Players").LocalPlayer.Data.Race.Value)
        end)
    end
end)
local String11 = "AddLabel"
String11 = "Beli"
String9 = Tab14[String11](String11)
spawn(function()
    while wait() do
        pcall(function()
            String9:Set("Beli:" .. " " .. game:GetService("Players").LocalPlayer.Data.Beli.Value)
        end)
    end
end)
local String12 = "AddLabel"
String12 = "Fragment"
String10 = Tab14[String12](String12)
spawn(function()
    while wait() do
        pcall(function()
            String10:Set("Fragments:" .. " " .. game:GetService("Players").LocalPlayer.Data.Fragments.Value)
        end)
    end
end)
local String13 = "AddLabel"
String13 = "ExP"
String11 = Tab14[String13](String13)
spawn(function()
    while wait() do
        pcall(function()
            String11:Set("ExP Points:" .. " " .. game:GetService("Players").LocalPlayer.Data.Exp.Value)
        end)
    end
end)
local String14 = "AddLabel"
String14 = "Stats Points"
String12 = Tab14[String14](String14)
spawn(function()
    while wait() do
        pcall(function()
            String12:Set("Stats Points:" .. " " .. game:GetService("Players").LocalPlayer.Data.Points.Value)
        end)
    end
end)
local String15 = "AddLabel"
String15 = "Bounty"
String13 = Tab14[String15](String15)
spawn(function()
    while wait() do
        pcall(function()
            String13:Set("Bounty / Honor:" .. " " .. game:GetService("Players").LocalPlayer.leaderstats["Bounty / Honor"].Value)
        end)
    end
end)
local String16 = "AddLabel"
String16 = "Devil Fruit"
String14 = Tab14[String16](String16)
spawn(function()
    while wait() do
        pcall(function()
            if game:GetService("Players").LocalPlayer.Character:FindFirstChild(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value) or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value) then
                String14:Set("Devil Fruit:" .. " " .. game:GetService("Players").LocalPlayer.Data.DevilFruit.Value)
            else
                String14:Set("Not Have Devil Fruit")
            end
        end)
    end
end)
local String17 = "AddSeperator"
String17 = " Sword "
Tab14[String17](String17)
String17 = "AddLabel"
String17 = "\226\157\140: Saber"
String15 = Tab14[String17](String17)
local String18 = "AddLabel"
String18 = "\226\157\140: Rengoku"
String16 = Tab14[String18](String18)
local String19 = "AddLabel"
String19 = "\226\157\140: Midnight Blade"
String17 = Tab14[String19](String19)
local String20 = "AddLabel"
String20 = "\226\157\140: Dragon Trident"
String18 = Tab14[String20](String20)
local String21 = "AddLabel"
String21 = "\226\157\140: Yama"
String19 = Tab14[String21](String21)
local String22 = "AddLabel"
String22 = "\226\157\140: Buddy Sword"
String20 = Tab14[String22](String22)
local String23 = "AddLabel"
String23 = "\226\157\140: Canvander"
String21 = Tab14[String23](String23)
local String24 = "AddLabel"
String24 = "\226\157\140: Twin Hooks"
String22 = Tab14[String24](String24)
local String25 = "AddLabel"
String25 = "\226\157\140: Spikey Trident"
String23 = Tab14[String25](String25)
local String26 = "AddLabel"
String26 = "\226\157\140: Hallow Scythe"
String24 = Tab14[String26](String26)
local String27 = "AddLabel"
String27 = "\226\157\140: Dark Dagger"
String25 = Tab14[String27](String27)
local String28 = "AddLabel"
String28 = "\226\157\140: Tushita"
String26 = Tab14[String28](String28)
spawn(function()
    while task.wait() do
        pcall(function()
            for I, I2 in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryWeapons")) do
                if I2.Name == "Saber" then
                    String15:Set("\226\156\133: Saber")
                end
                if I2.Name == "Rengoku" then
                    String16:Set("\226\156\133: Rengoku")
                end
                if I2.Name == "Midnight Blade" then
                    String17:Set("\226\156\133: Midnight Blade")
                end
                if I2.Name == "Dragon Trident" then
                    String18:Set("\226\156\133: Dragon Trident")
                end
                if I2.Name == "Yama" then
                    String19:Set("\226\156\133: Yama")
                end
                if I2.Name == "Buddy Sword" then
                    String20:Set("\226\156\133: Buddy Sword")
                end
                if I2.Name == "Canvander" then
                    String21:Set("\226\156\133: Canvander")
                end
                if I2.Name == "Twin Hooks" then
                    String22:Set("\226\156\133: Twin Hooks")
                end
                if I2.Name == "Spikey Trident" then
                    String23:Set("\226\156\133: Spikey Trident")
                end
                if I2.Name == "Hallow Scythe" then
                    String24:Set("\226\156\133: Hallow Scythe")
                end
                if I2.Name == "Dark Dagger" then
                    String25:Set("\226\156\133: Dark Dagger")
                end
                if I2.Name == "Tushita" then
                    String26:Set("\226\156\133: Tushita")
                end
            end
        end)
    end
end)
local String29 = "AddSeperator"
String29 = "Quest"
Tab14[String29](String29)
String29 = "AddLabel"
String29 = "\226\157\140: Bartilo Quest"
String27 = Tab14[String29](String29)
local String30 = "AddLabel"
String30 = "\226\157\140: Don Swan Quest"
String28 = Tab14[String30](String30)
local String31 = "AddLabel"
String31 = "\226\157\140: Kill Don Swan"
String29 = Tab14[String31](String31)
spawn(function()
    while task.wait() do
        local InvokeServerOp = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo")
        if InvokeServerOp == 3 then
            String27:Set("\226\156\133: Bartilo Quest")
        end
        InvokeServerOp = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess
        if InvokeServerOp ~= nil then
            String28:Set("\226\156\133: Don Swan Quest")
        end
        InvokeServerOp = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress", "Check")
        if InvokeServerOp == 1 then
            String29:Set("\226\156\133: Kill Don Swan")
        end
    end
end)
local String32 = "AddSeperator"
String32 = "Sword Legendary"
Tab14[String32](String32)
String32 = "AddLabel"
String32 = "\226\157\140: Shisui"
String30 = Tab14[String32](String32)
local String33 = "AddLabel"
String33 = "\226\157\140: Saddi"
String31 = Tab14[String33](String33)
local String34 = "AddLabel"
String34 = "\226\157\140: Wando"
String32 = Tab14[String34](String34)
local String35 = "AddLabel"
String35 = "\226\157\140: True Triple Katana"
String33 = Tab14[String35](String35)
spawn(function()
    while task.wait() do
        pcall(function()
            for I, I2 in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryWeapons")) do
                if I2.Name == "Shisui" then
                    String30:Set("\226\156\133: Shisui")
                end
                if I2.Name == "Saddi" then
                    String31:Set("\226\156\133: Saddi")
                end
                if I2.Name == "Wando" then
                    String32:Set("\226\156\133: Wando")
                end
                if I2.Name == "True Triple Katana" then
                    String33:Set("\226\156\133: True Triple Katana")
                end
            end
        end)
    end
end)
local String36 = "AddSeperator"
String36 = "Melee"
Tab14[String36](String36)
String36 = "AddLabel"
String36 = "\226\157\140: Superhuman"
String34 = Tab14[String36](String36)
local String37 = "AddLabel"
String37 = "\226\157\140: Death Step"
String35 = Tab14[String37](String37)
local String38 = "AddLabel"
String38 = "\226\157\140: Sharkman Karate"
String36 = Tab14[String38](String38)
local String39 = "AddLabel"
String39 = "\226\157\140: Electric Claw"
String37 = Tab14[String39](String39)
local String40 = "AddLabel"
String40 = "\226\157\140: Dragon Talon"
String38 = Tab14[String40](String40)
local String41 = "AddLabel"
String41 = "\226\157\140: God Human"
String39 = Tab14[String41](String41)
local String42 = "AddLabel"
String42 = "\226\157\140: Sanguine Art"
String40 = Tab14[String42](String42)
spawn(function()
    while task.wait() do
        local InvokeServerOp = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman", true)
        if InvokeServerOp == 1 then
            String34:Set("\226\156\133: Superhuman")
        end
        InvokeServerOp = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep", true)
        if InvokeServerOp == 1 then
            String35:Set("\226\156\133: Death Step")
        end
        InvokeServerOp = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate", true)
        if InvokeServerOp == 1 then
            String36:Set("\226\156\133: Sharkman Karate")
        end
        InvokeServerOp = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw", true)
        if InvokeServerOp == 1 then
            String37:Set("\226\156\133: Electric Claw")
        end
        InvokeServerOp = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon", true)
        if InvokeServerOp == 1 then
            String38:Set("\226\156\133: Dragon Talon")
        end
        InvokeServerOp = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman", true)
        if InvokeServerOp == 1 then
            String39:Set("\226\156\133: God Human")
        end
        InvokeServerOp = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt", true)
        if InvokeServerOp == 1 then
            String40:Set("\226\156\133: Sanguine Art")
        end
    end
end)
local String43 = "AddSeperator"
String43 = "Gun"
Tab14[String43](String43)
String43 = "AddLabel"
String43 = "\226\157\140: Kabucha"
String41 = Tab14[String43](String43)
local String44 = "AddLabel"
String44 = "\226\157\140: Acidum Rifle"
String42 = Tab14[String44](String44)
local String45 = "AddLabel"
String45 = "\226\157\140: Bizarre Rifle"
String43 = Tab14[String45](String45)
spawn(function()
    while task.wait() do
        pcall(function()
            for I, I2 in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryWeapons")) do
                if I2.Name == "Kabucha" then
                    String41:Set("\226\156\133: Kabucha")
                end
                if I2.Name == "Acidum Rifle" then
                    String42:Set("\226\156\133: Acidum Rifle")
                end
                if I2.Name == "Bizarre Rifle" then
                    String43:Set("\226\156\133: Bizarre Rifle")
                end
            end
        end)
    end
end)
local String46 = "AddSeperator"
String46 = "Accessory"
Tab14[String46](String46)
String46 = "AddLabel"
String46 = "\226\157\140: Dark Coat"
String44 = Tab14[String46](String46)
local String47 = "AddLabel"
String47 = "\226\157\140: Ghoul Mask"
String45 = Tab14[String47](String47)
local String48 = "AddLabel"
String48 = "\226\157\140: Swan Glass"
String46 = Tab14[String48](String48)
local String49 = "AddLabel"
String49 = "\226\157\140: Pale Scarf"
String47 = Tab14[String49](String49)
local String50 = "AddLabel"
String50 = "\226\157\140: Valkyrie Helm"
String48 = Tab14[String50](String50)
spawn(function()
    while task.wait() do
        pcall(function()
            for I, I2 in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryWeapons")) do
                if I2.Name == "Saber" then
                    String44:Set("\226\156\133: Dark Coat")
                end
                if I2.Name == "Ghoul Mask" then
                    String45:Set("\226\156\133: Ghoul Mask")
                end
                if I2.Name == "Swan Glasses" then
                    String46:Set("\226\156\133: Swan Glass")
                end
                if I2.Name == "Pale Scarf" then
                    String47:Set("\226\156\133: Pale Scarf")
                end
                if I2.Name == "Valkyrie Helmet" then
                    String48:Set("\226\156\133: Valkyrie Helmet")
                end
            end
        end)
    end
end)
local String51 = "AddSeperator"
String51 = "Server"
Tab13[String51](String51)
spawn(function()
    while wait() do
        pcall(function()
            Result14:Set("Job ID:" .. " " .. game.JobId)
        end)
    end
end)
String51 = "AddLabel"
String51 = "Job ID: "
Result14 = Tab13[String51](String51)
String51 = "AddButton"
String51 = "Rejoin Server"
Tab13[String51](String51, function()
    game:GetService("TeleportService"):Function5(game.PlaceId, game:GetService("Players").LocalPlayer)
end)
String51 = "AddButton"
String51 = "Server Function3"
Tab13[String51](String51, function()
    Function3()
end)
String51 = "AddButton"
String51 = "Function3 To Lower Player"
Tab13[String51](String51, function()
    getgenv().AutoTeleport = true
    getgenv().DontTeleportTheSameNumber = true
    getgenv().CopytoClipboard = false
    if not game:IsLoaded() then
        print("Game is loading waiting...")
    end
    local Huge = math.huge
    local Value8 = nil
    local Value9 = nil
    local Text = "https://games.roblox.com / v1/games/" .. game.PlaceId .. "/servers / Public?sortOrder = Asc&limit = 100"
    Function50 = function()
        for I, I2 in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(Text)).data) do
            if type(I2) == "table" and I2.playing ~= nil and I2.playing < Huge then
                Value8 = I2.maxPlayers
                Huge = I2.playing
                Value9 = I2.id
            end
        end
    end
    Function51 = function()
        Function50()
        for I, I2 in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(Text))) do
            if I == "nextPageCursor" then
                local Find = Text:find("&cursor=")
                if Find then
                    Find = Text:find("&cursor=")
                    Text = Text:gsub(Text:sub(Find), "")
                end
                Text = Text .. "&cursor=" .. I2
                Function51()
            end
        end
    end
    Function51()
    if AutoTeleport then
        if DontTeleportTheSameNumber then
            if #game:GetService("Players"):GetPlayers() - 4 == Huge then
                return warn("It has same number of players (except you)")
            end
            if Value9 == game.JobId then
                return warn("Your current server is the most empty server atm")
            end
        end
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, Value9)
    end
end)
String51 = "AddButton"
String51 = "Copy Job Id"
Tab13[String51](String51, function()
    setclipboard(tostring(game.JobId))
end)
String51 = "AddTextbox"
String51 = "Place Job Id"
Tab13[String51](String51, true, function(Param)
    _G.Job = Param
end)
String51 = "AddButton"
String51 = "Join Sever [BETA]"
Tab13[String51](String51, function()
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId, _G.Job, game.Players.LocalPlayer)
end)