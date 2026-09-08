-- KRT Hub | Showel SpleefV2

-- by KRT Hub • t.me/KRT_client

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer

-- Создаем основное окно

local Window = Rayfield:CreateWindow({

    Name = "KRTHub | Showel SpleefV2",

    LoadingTitle = "KRTKey System",

    LoadingSubtitle = "by KRT",

    ConfigurationSaving = {

        Enabled = true,

        FolderName = "KRTKeySystem",

        FileName = "Configuration"

    },

    Discord = {

        Enabled = false,

        Invite = "noinvitelink",

        RememberJoins = true

    },

    KeySystem = true,

    KeySettings = {

        Title = "KRTKey Sistem",

        Subtitle = "Введите ключ",

        Note = "Получить ключ можно в t.me/KRTHub_keyBot",

        FileName = "KRTKey",

        SaveKey = true,

        GrabKeyFromSite = false,

        Key = {"KRT_1K83S", "Donate_2951L"}

    }

})

-- Функция для проверки и сохранения ключа

local function activateKey(key)

    local validKeys = {

        ["KRT_1K83S"] = 2 * 1000, -- 2 часов в секундах

        ["Donate_2951L"] = -1 -- Бессрочный доступ

    }

    

    if validKeys[key] then

        -- Сохраняем в KRTkeyLogic KRTHub

        local success, err = pcall(function()

            local KRTHub = getgenv().KRTHub

            if not KRTHub then

                error("KRTHub environment not found")

            end

            

            -- Создаем папку для ключей, если её нет

            if not isfolder("KRTHub/KRTkeyLogic") then

                makefolder("KRTHub/KRTkeyLogic")

            end

            

            -- Сохраняем информацию о ключе

            local keyData = {

                PlayerName = LocalPlayer.Name,

                Key = key,

                Expiration = validKeys[key] == -1 and "permanent" or (os.time() + validKeys[key])

            }

            

            writefile("KRTHub/KRTkeyLogic/KRTKey_" .. LocalPlayer.Name .. ".txt", 

                "Player: " .. keyData.PlayerName .. 

                "\nKey: " .. keyData.Key .. 

                "\nExpiration: " .. tostring(keyData.Expiration))

        end)

        

        if success then

            Rayfield:Notify({

                Title = "Успех!",

                Content = "Ключ активирован!",

                Duration = 6.5,

                Image = 4483362458,

                Actions = {

                    Ignore = {

                        Name = "Ок",

                        Callback = function()

                            -- После активации запускаем основной скрипт

                            loadstring(game:HttpGet("https://pastefy.app/ygMrtUMR/raw"))()

                        end

                    }

                }

            })

        else

            Rayfield:Notify({

                Title = "Ошибка",

                Content = "Не удалось сохранить ключ: " .. tostring(err),

                Duration = 6.5,

                Image = 4483362458

            })

        end

    else

        Rayfield:Notify({

            Title = "Неверный ключ",

            Content = "Введенный ключ недействителен",

            Duration = 6.5,

            Image = 4483362458

        })

    end

end

-- Создаем вкладку для активации ключа

local KeyTab = Window:CreateTab("Активация ключа", 4483362458)

local KeySection = KeyTab:CreateSection("Активация ключа")

local Input = KeyTab:CreateInput({

    Name = "Введите ключ",

    PlaceholderText = "Key",

    RemoveTextAfterFocusLost = false,

    Callback = function(Text)

        -- Обработка ввода ключа

    end,

})

local Button = KeyTab:CreateButton({

    Name = "Активировать ключ",

    Callback = function()

        activateKey(Input.Value)

    end,

})

-- Создание окна

local Window = Rayfield:CreateWindow({

    Name = "KRT Hub | Showel SpleefV2",

    LoadingTitle = "Загрузка...",

    LoadingSubtitle = "by KRT Hub",

    ConfigurationSaving = {

        Enabled = true,

        FolderName = "KRT Hub",

        FileName = "Showel SpleefV2"

    }

})

local MainTab = Window:CreateTab("Player", 7992557358)

-- Изменение скорости

local WalkSpeedSlider = MainTab:CreateSlider({

    Name = "Скорость передвижения",

    Range = {16, 200},

    Increment = 1,

    Suffix = "studs/s",

    CurrentValue = 16,

    Flag = "WalkSpeed",

    Callback = function(Value)

        pcall(function()

            local character = game.Players.LocalPlayer.Character

            if character and character:FindFirstChild("Humanoid") then

                character.Humanoid.WalkSpeed = Value

            end

        end)

    end,

})

-- Изменение силы прыжка

local JumpPowerSlider = MainTab:CreateSlider({

    Name = "Сила прыжка",

    Range = {50, 200},

    Increment = 1,

    Suffix = "studs/s",

    CurrentValue = 50,

    Flag = "JumpPower",

    Callback = function(Value)

        pcall(function()

            local character = game.Players.LocalPlayer.Character

            if character and character:FindFirstChild("Humanoid") then

                character.Humanoid.JumpPower = Value

            end

        end)

    end,

})

-- Ноклип

local NoclipToggle = MainTab:CreateToggle({

    Name = "Ноклип",

    CurrentValue = false,

    Flag = "Noclip",

    Callback = function(Value)

        getgenv().Noclip = Value

        if Value then

            spawn(function()

                local character = game.Players.LocalPlayer.Character

                if character then

                    for _, part in pairs(character:GetDescendants()) do

                        if part:IsA("BasePart") then

                            part.CanCollide = false

                        end

                    end

                end

                

                while getgenv().Noclip and task.wait(0.1) do

                    pcall(function()

                        local character = game.Players.LocalPlayer.Character

                        if character then

                            for _, part in pairs(character:GetDescendants()) do

                                if part:IsA("BasePart") then

                                    part.CanCollide = false

                                end

                            end

                        end

                    end)

                end

            end)

        end

    end,

})

local AutoFarmButton = MainTab:CreateButton({

    Name = "Auto Farm Win",

    Callback = function()

        loadstring(game:HttpGet("https://pastefy.app/gDOuNpsd/raw"))()

    end,

})

local AutoFarmMONEYButton = MainTab:CreateButton({

    Name = "Auto Farm Money",

    Callback = function()

        loadstring(game:HttpGet("https://pastefy.app/ZnHoS96x/raw"))()

    end,

})

local DelLAVAButton = MainTab:CreateButton({

    Name = "Delete Lava",

    Callback = function()

        loadstring(game:HttpGet("https://pastefy.app/fdgDE2Gd/raw"))()

    end,

})

-- Создаем вкладку для телепортации с правильной иконкой (ID: 6031229363)

local TeleportTab = Window:CreateTab("Teleport", 18155317326)

-- Кнопка 1

local Button1 = TeleportTab:CreateButton({

    Name = "Teleport Lobby",

    Callback = function()

        local player = game.Players.LocalPlayer

        local character = player.Character or player.CharacterAdded:Wait()

        -- Простая телепортация на позицию

        if character:FindFirstChild("HumanoidRootPart") then

            character.HumanoidRootPart.CFrame = CFrame.new(263.913818, 157.699997, -192.323624)

        end

    end

})

-- Кнопка 2

local Button2 = TeleportTab:CreateButton({

    Name = "Teleport Play",

    Callback = function()

        -- Простой скрипт телепортации

        local player = game.Players.LocalPlayer

        local character = player.Character

        if character and character:FindFirstChild("HumanoidRootPart") then

            character.HumanoidRootPart.CFrame = CFrame.new(249.254944, 16.1986084, -285.696289)

            print("Телепортация выполнена!")

        end

    end

})

print("KRT Hub | Showel Spleef V2 успешно загружен!")