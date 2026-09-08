-- Fixz Hub | Fisch 🎣
-- Made By Fixz 64

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Services
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local Backpack = LocalPlayer:WaitForChild("Backpack")
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- State
local State = {
    AutoFarm = false,
    AutoHeavenRod = false
}

-- Update character on respawn
LocalPlayer.CharacterAdded:Connect(function(char)
    Character = char
    HumanoidRootPart = char:WaitForChild("HumanoidRootPart")
end)

-- ===== Rayfield UI with Key System =====
local Window = Rayfield:CreateWindow({
    Name = "Fixz Hub | Fisch 🎣",
    LoadingTitle = "Fixz Hub",
    LoadingSubtitle = "Made By Fixz 64",
    ConfigurationSaving = {
        Enabled = false
    },
    Discord = {
        Enabled = true,
        Invite = "CDyrbSY8Gx",
        RememberJoins = true
    },
    KeySystem = true,
    KeySettings = {
        Title = "Fixz Hub Key System",
        Subtitle = "Enter Key",
        Note = "Join Discord to get key: https://discord.gg/CDyrbSY8Gx",
        FileName = "FixzHubKey",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"Fixz2025"}
    }
})

-- Main Tab
local TabMain = Window:CreateTab("Main", 4483362458)

-- ===== Auto Farm Fish =====
TabMain:CreateSection("Auto Farm")

TabMain:CreateToggle({
    Name = "Auto Farm Fish",
    CurrentValue = false,
    Flag = "AutoFarm",
    Callback = function(Value)
        State.AutoFarm = Value
    end,
})

-- Auto Farm Fish Function
task.spawn(function()
    while task.wait() do
        if State.AutoFarm then
            pcall(function()
                local RodName = ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.rod.Value
                
                -- Equip rod
                if Backpack:FindFirstChild(RodName) then
                    LocalPlayer.Character.Humanoid:EquipTool(Backpack:FindFirstChild(RodName))
                end
                
                -- Check if rod is equipped
                if LocalPlayer.Character:FindFirstChild(RodName) and LocalPlayer.Character[RodName]:FindFirstChild("bobber") then
                    -- Auto Shake
                    repeat
                        pcall(function()
                            PlayerGui:FindFirstChild("shakeui").safezone:FindFirstChild("button").Size = UDim2.new(1001, 0, 1001, 0)
                            VirtualUser:Button1Down(Vector2.new(1, 1))
                            VirtualUser:Button1Up(Vector2.new(1, 1))
                        end)
                        RunService.Heartbeat:Wait()
                    until not LocalPlayer.Character:FindFirstChild(RodName) or LocalPlayer.Character[RodName].values.bite.Value or not State.AutoFarm
                    
                    -- Auto Reel
                    repeat
                        ReplicatedStorage.events.reelfinished:FireServer(1000000000000000000000000, true)
                        task.wait(0.5)
                    until not LocalPlayer.Character:FindFirstChild(RodName) or not LocalPlayer.Character[RodName].values.bite.Value or not State.AutoFarm
                else
                    -- Cast rod
                    if LocalPlayer.Character:FindFirstChild(RodName) then
                        LocalPlayer.Character[RodName].events.cast:FireServer(1000000000000000000000000)
                        task.wait(2)
                    end
                end
            end)
        end
    end
end)

-- ===== Auto Sell =====
TabMain:CreateSection("Utilities")

TabMain:CreateButton({
    Name = "Auto Sell All Fish",
    Callback = function()
        pcall(function()
            Workspace.world.npcs["Marc Merchant"].merchant.sellall:InvokeServer()
            Rayfield:Notify({
                Title = "Success",
                Content = "All fish sold!",
                Duration = 3,
                Image = 4483362458
            })
        end)
    end,
})

-- ===== Best Fishing Spot =====
TabMain:CreateSection("Teleports")

TabMain:CreateButton({
    Name = "Best Fishing Spot",
    Callback = function()
        HumanoidRootPart.CFrame = CFrame.new(1447.8507080078125, 133.49998474121094, -7649.64501953125)
        
        -- Create platform
        local platform = Instance.new("Part")
        platform.Size = Vector3.new(10, 1, 10)
        platform.Position = Vector3.new(1447.8507080078125, 131.49998474121094, -7649.64501953125)
        platform.Anchored = true
        platform.BrickColor = BrickColor.new("Bright blue")
        platform.Material = Enum.Material.Neon
        platform.Parent = Workspace
        
        Rayfield:Notify({
            Title = "Teleported",
            Content = "Teleported to best fishing spot!",
            Duration = 3,
            Image = 4483362458
        })
    end,
})

-- ===== Auto Heaven Rod =====
TabMain:CreateSection("Auto Heaven Rod Quest")

TabMain:CreateButton({
    Name = "Start Auto Heaven Rod",
    Callback = function()
        State.AutoHeavenRod = true
        Rayfield:Notify({
            Title = "Started",
            Content = "Auto Heaven Rod quest started!",
            Duration = 3,
            Image = 4483362458
        })
        
        task.spawn(function()
            local SharedRed, SharedBlue, SharedGreen, SharedYellow = false, false, false, false
            local IsBuying3 = false
            
            while State.AutoHeavenRod do
                task.wait(1)
                pcall(function()
                    -- Check if player already has Heaven's Rod
                    if Backpack:FindFirstChild("Heaven's Rod") or Character:FindFirstChild("Heaven's Rod") then
                        Rayfield:Notify({
                            Title = "Complete!",
                            Content = "You already have Heaven's Rod!",
                            Duration = 5,
                            Image = 4483362458
                        })
                        State.AutoHeavenRod = false
                        return
                    end
                    
                    -- Go to Northern Summit
                    if not Workspace.map["Northern Summit"]:FindFirstChild("NorthFinalPuzzle") then
                        HumanoidRootPart.CFrame = CFrame.new(19990.3789, 1136.4281, 5536.5249)
                        task.wait(2)
                    else
                        -- Place Blue Crystal
                        if Backpack:FindFirstChild("Blue Energy Crystal") and not SharedBlue then
                            HumanoidRootPart.CFrame = CFrame.new(19967.16015625, 1137.2425537109375, 5362.26904296875)
                            task.wait(1)
                            ReplicatedStorage.packages.Net["RE/NorthFinalPuzzleService/Place"]:FireServer("Blue")
                            task.wait(2)
                            SharedBlue = true
                        end
                        
                        -- Place Green Crystal
                        if Backpack:FindFirstChild("Green Energy Crystal") and not SharedGreen then
                            HumanoidRootPart.CFrame = CFrame.new(19967.16015625, 1137.2425537109375, 5362.26904296875)
                            task.wait(1)
                            ReplicatedStorage.packages.Net["RE/NorthFinalPuzzleService/Place"]:FireServer("Green")
                            task.wait(2)
                            SharedGreen = true
                        end
                        
                        -- Place Red Crystal
                        if Backpack:FindFirstChild("Red Energy Crystal") and not SharedRed then
                            HumanoidRootPart.CFrame = CFrame.new(19967.16015625, 1137.2425537109375, 5362.26904296875)
                            task.wait(1)
                            ReplicatedStorage.packages.Net["RE/NorthFinalPuzzleService/Place"]:FireServer("Red")
                            task.wait(2)
                            SharedRed = true
                        end
                        
                        -- Place Yellow Crystal
                        if Backpack:FindFirstChild("Yellow Energy Crystal") and not SharedYellow then
                            HumanoidRootPart.CFrame = CFrame.new(19967.16015625, 1137.2425537109375, 5362.26904296875)
                            task.wait(1)
                            ReplicatedStorage.packages.Net["RE/NorthFinalPuzzleService/Place"]:FireServer("Yellow")
                            task.wait(2)
                            SharedYellow = true
                        end
                        
                        -- Buy Heaven's Rod if all crystals placed
                        if SharedRed and SharedBlue and SharedGreen and SharedYellow then
                            ReplicatedStorage.events.purchase:FireServer("Heaven's Rod", "Rod", nil, 1)
                            task.wait(2)
                            Rayfield:Notify({
                                Title = "Success!",
                                Content = "Heaven's Rod obtained!",
                                Duration = 5,
                                Image = 4483362458
                            })
                            State.AutoHeavenRod = false
                            return
                        end
                        
                        -- Get Blue Crystal
                        if not Backpack:FindFirstChild("Blue Energy Crystal") and not SharedBlue then
                            HumanoidRootPart.CFrame = CFrame.new(20124.8711, 212.725845, 5449.35498)
                            task.wait(2)
                            ReplicatedStorage.packages.Net["RF/ItemSpawnCollect"]:InvokeServer("Blue Energy Crystal")
                        end
                        
                        -- Get Yellow Crystal
                        if not Backpack:FindFirstChild("Yellow Energy Crystal") and not SharedYellow then
                            HumanoidRootPart.CFrame = CFrame.new(19499.6953125, 335.21728515625, 5549.265625)
                            task.wait(2)
                            ReplicatedStorage.packages.Net["RF/ItemSpawnCollect"]:InvokeServer("Yellow Energy Crystal")
                        end
                        
                        -- Get Red Crystal (purchase)
                        if not Backpack:FindFirstChild("Red Energy Crystal") and not SharedRed then
                            if not IsBuying3 then
                                ReplicatedStorage.packages.Net["RF/NorthExp/PurchaseShard"]:InvokeServer()
                                IsBuying3 = true
                                task.wait(10)
                            end
                        end
                    end
                end)
            end
        end)
    end,
})

TabMain:CreateButton({
    Name = "Stop Auto Heaven Rod",
    Callback = function()
        State.AutoHeavenRod = false
        Rayfield:Notify({
            Title = "Stopped",
            Content = "Auto Heaven Rod stopped!",
            Duration = 3,
            Image = 4483362458
        })
    end,
})

-- Anti-AFK
task.spawn(function()
    LocalPlayer.Idled:Connect(function()
        VirtualUser:Button2Down(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
        task.wait(1)
        VirtualUser:Button2Up(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
    end)
end)

Rayfield:LoadConfiguration()

print("Fixz Hub | Fisch loaded successfully!")