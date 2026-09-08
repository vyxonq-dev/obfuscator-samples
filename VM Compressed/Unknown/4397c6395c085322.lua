-- Carregar Rayfield (Sirius)
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local AutoFarm = false
local AutoBuyItens = false
local AutoBloodMoon = false
local AutoAurora = false

-- Criar Janela
local Window = Rayfield:CreateWindow({
    Name = "NovaZHub| Build a Plane",
    LoadingTitle = "Build a Plane Hub",
    LoadingSubtitle = "NovaZHub",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "BABFT_AutoFarm",
        FileName = "AutoFarmRayfield"
    },
    Discord = {
        Enabled = false
    },
    KeySystem = false
})

-- Aba Main
local MainTab = Window:CreateTab("Main", 4483362458)

MainTab:CreateToggle({
    Name = "Auto Farm 💀",
    CurrentValue = false,
    Flag = "AutoFarmToggle",
    Callback = function(Value)
        AutoFarm = Value
        if AutoFarm then
            Rayfield:Notify({Title = "Auto Farm Ativado", Content = "Farmando infinitamente...", Duration = 5})
            task.spawn(function()
                while AutoFarm do
                    local ReplicatedStorage = game:GetService("ReplicatedStorage")
                    local Players = game:GetService("Players")
                    local LaunchRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("LaunchEvents"):WaitForChild("Launch")
                    local ReturnRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("LaunchEvents"):WaitForChild("Return")

                    local player = Players.LocalPlayer
                    local character = player.Character or player.CharacterAdded:Wait()

                    LaunchRemote:FireServer()
                    task.wait(2)

                    if character:FindFirstChild("HumanoidRootPart") then
                        character.HumanoidRootPart.CFrame = CFrame.new(9000000000e9, 90000000000e9, 9000000000e9)
                    end

                    task.wait(2)
                    ReturnRemote:FireServer()
                    task.wait(3)
                end
            end)
        else
            Rayfield:Notify({Title = "Auto Farm Desativado", Content = "Farm parado!", Duration = 4})
        end
    end
})

-- Aba Itens
local ItensTab = Window:CreateTab("Itens", 4483362458)

ItensTab:CreateToggle({
    Name = "Auto Buy all itens 🧱",
    CurrentValue = false,
    Flag = "AutoBuyItensToggle",
    Callback = function(Value)
        AutoBuyItens = Value
        if AutoBuyItens then
            Rayfield:Notify({Title = "Auto Buy Ativado", Content = "Comprando itens repetidamente...", Duration = 5})
            task.spawn(function()
                while AutoBuyItens do
                    local items = {"block_1","wing_1","fuel_1","propeller_1","seat_1","fuel_2","wing_2","fuel_3","propeller_2","balloon","boost_1","missile_1","shield"}
                    for _, item in ipairs(items) do
                        pcall(function()
                            game:GetService("ReplicatedStorage").Remotes.ShopEvents.BuyBlock:FireServer(item)
                        end)
                        task.wait(0.1)
                    end
                    task.wait(1)
                end
            end)
        else
            Rayfield:Notify({Title = "Auto Buy Desativado", Content = "Parado de comprar itens.", Duration = 4})
        end
    end
})

-- Aba Events (antes Blood Moon)
local EventsTab = Window:CreateTab("Events", 4483362458)
local r = game:GetService("ReplicatedStorage").Remotes

-- Auto GET Inf Blood coin and spin
EventsTab:CreateToggle({
    Name = "Auto GET Inf Blood coin and spin",
    CurrentValue = false,
    Flag = "AutoBloodMoonToggle",
    Callback = function(Value)
        AutoBloodMoon = Value
        if AutoBloodMoon then
            Rayfield:Notify({Title = "Events Ativado", Content = "Auto GET Inf Blood coin and spin ligado.", Duration = 5})

            task.spawn(function()
                for i = 1, 303 do
                    task.spawn(function()
                        while AutoBloodMoon do
                            task.wait()
                            pcall(function()
                                r.EventEvents.SpawnEvilEye:InvokeServer()
                                r.EventEvents.KillEvilEye:InvokeServer()
                            end)
                        end
                    end)
                end
            end)

            task.spawn(function()
                for i = 1, 80 do
                    task.spawn(function()
                        while AutoBloodMoon do
                            task.wait()
                            pcall(function()
                                r.SpinEvents.PurchaseSpin:InvokeServer()
                                r.SpinEvents.PerformSpin:InvokeServer()
                            end)
                        end
                    end)
                end
            end)
        else
            Rayfield:Notify({Title = "Events Desativado", Content = "Auto GET Inf Blood coin and spin desligado.", Duration = 4})
        end
    end
})

-- Auto Infinite Aurora Gem
EventsTab:CreateToggle({
    Name = "Auto Infinite Aurora Gem 💎",
    CurrentValue = false,
    Flag = "AutoAuroraToggle",
    Callback = function(Value)
        AutoAurora = Value
        if AutoAurora then
            Rayfield:Notify({Title = "Aurora Gem Ativado", Content = "Coletando Aurora Gems infinitamente...", Duration = 5})
            task.spawn(function()
                while AutoAurora do
                    pcall(function()
                        local args = { Instance.new("Part", nil) }
                        game:GetService("ReplicatedStorage").Remotes.UIEvents.AuroraCollect:FireServer(unpack(args))
                    end)
                    task.wait(0.0001)
                end
            end)
        else
            Rayfield:Notify({Title = "Aurora Gem Desativado", Content = "Parou de coletar Aurora Gems.", Duration = 4})
        end
    end
})

-- Aba Misc
local MiscTab = Window:CreateTab("Misc", 4483362458)

-- Anti AFK
MiscTab:CreateToggle({
    Name = "Anti AFK",
    CurrentValue = false,
    Flag = "AntiAFKToggle",
    Callback = function(Value)
        if Value then
            getgenv().AntiAFKConnection = game:GetService("Players").LocalPlayer.Idled:Connect(function()
                game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                task.wait(1)
                game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            end)
        else
            if getgenv().AntiAFKConnection then
                getgenv().AntiAFKConnection:Disconnect()
                getgenv().AntiAFKConnection = nil
            end
        end
    end
})

-- Fullbright
MiscTab:CreateToggle({
    Name = "Fullbright",
    CurrentValue = false,
    Flag = "FullbrightToggle",
    Callback = function(Value)
        if Value then
            getgenv().Fullbright = true
            task.spawn(function()
                while getgenv().Fullbright do
                    game:GetService("Lighting").Brightness = 2
                    game:GetService("Lighting").ClockTime = 14
                    game:GetService("Lighting").FogEnd = 100000
                    game:GetService("Lighting").GlobalShadows = false
                    game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(128,128,128)
                    task.wait(0.5)
                end
            end)
        else
            getgenv().Fullbright = false
        end
    end
})

-- No Fog
MiscTab:CreateToggle({
    Name = "No Fog",
    CurrentValue = false,
    Flag = "NoFogToggle",
    Callback = function(Value)
        if Value then
            getgenv().NoFog = true
            task.spawn(function()
                while getgenv().NoFog do
                    game:GetService("Lighting").FogStart = 0
                    game:GetService("Lighting").FogEnd = 100000
                    task.wait(0.5)
                end
            end)
        else
            getgenv().NoFog = false
        end
    end
})

-- Anti Cheat (70~80%)
MiscTab:CreateToggle({
    Name = "Anti Cheat",
    CurrentValue = false,
    Flag = "AntiCheatToggle",
    Callback = function(Value)
        if Value then
            getgenv().AntiCheat = true
            Rayfield:Notify({Title = "Anti Cheat", Content = "Proteção ativada (70~80%).", Duration = 6})

            -- Bloqueia Kick
            local mt = getrawmetatable(game)
            setreadonly(mt, false)
            local old = mt.__namecall
            mt.__namecall = newcclosure(function(self, ...)
                local method = getnamecallmethod()
                if method == "Kick" or method == "kick" then
                    return nil
                end
                return old(self, ...)
            end)

            -- Bloqueia Remotes suspeitos
            local oldFireServer
            oldFireServer = hookfunction(Instance.new("RemoteEvent").FireServer, function(self, ...)
                local args = {...}
                if tostring(self):lower():find("anticheat") or tostring(self):lower():find("log") then
                    return nil
                end
                return oldFireServer(self, unpack(args))
            end)

            -- Delay random para loops
            getgenv().SafeWait = function(min, max)
                local t = math.random(min*100, max*100) / 100
                task.wait(t)
            end
        else
            getgenv().AntiCheat = false
            Rayfield:Notify({Title = "Anti Cheat", Content = "Proteção desligada.", Duration = 4})
        end
    end
})
