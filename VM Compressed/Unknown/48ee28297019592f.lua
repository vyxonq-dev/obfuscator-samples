local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer

-- Создаем основное окно

local Window = Rayfield:CreateWindow({

    Name = "KRTHub [FRP]",

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

    PlaceholderText = "KRT_1K83S",

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

-- Создаем вкладку с информацией

local InfoTab = Window:CreateTab("Troll", 88500724940584)

local InfoSection = InfoTab:CreateSection("Troll Function:")

-- Кнопка 1

local Button1 = InfoTab:CreateButton({

    Name = "Dildak R15",

    Callback = function()

        loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))()

    end

})

-- Кнопка 2

local Button2 = InfoTab:CreateButton({

    Name = "F3X Tools",

    Callback = function()

        loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)()

    end

})

-- Кнопка 3

local Button3 = InfoTab:CreateButton({

    Name = "Crash Server  WARNING⚠",

    Callback = function()

        loadstring(game:HttpGet("https://pastefy.app/oy8pARbq/raw"))()

    end

})

-- Кнопка 4

local Button4 = InfoTab:CreateButton({

    Name = "Scary Crash  WARNING⚠",

    Callback = function()

        loadstring(game:HttpGet("https://pastefy.app/tlj26XMM/raw"))()

    end

})

-- Кнопка 5

local Button5 = InfoTab:CreateButton({

    Name = "Fling Player",

    Callback = function()

        loadstring(game:HttpGet("https://pastefy.app/UjWklQ1j/raw"))()

    end

})

-- Кнопка 6

local Button6 = InfoTab:CreateButton({

    Name = "+PlayerFeatures",

    Callback = function()

        loadstring(game:HttpGet("https://pastefy.app/DgpcPHvX/raw"))()

    end

})

InfoTab:CreateParagraph({

    Title = "[FRP] - Fuck Roblox Player", 

    Content = "©KRTHub Official"

})

local InfoTab = Window:CreateTab("Teleport", 99356249891062)

local InfoSection = InfoTab:CreateSection("Teleporter Zones:")

-- Кнопка 1

local Button1 = InfoTab:CreateButton({

    Name = "TP to Player",

    Callback = function()

        loadstring(game:HttpGet("https://pastefy.app/j3CwMT1H/raw"))()

    end

})

-- Кнопка 2

local Button2 = InfoTab:CreateButton({

    Name = "Random TP",

    Callback = function()

        loadstring(game:HttpGet("https://pastefy.app/9YRBchbd/raw"))()

    end

})

InfoTab:CreateParagraph({

    Title = "[FRP] - Fuck Roblox Player", 

    Content = "©KRTHub Official"

})

local InfoTab = Window:CreateTab("Admin Panells", 7577357898)

local InfoSection = InfoTab:CreateSection("Admin Panel's:")

-- Кнопка 1

local Button1 = InfoTab:CreateButton({

    Name = "KRT Panell [FRP]",

    Callback = function()

        loadstring(game:HttpGet("https://pastefy.app/tvaZu4GB/raw"))()

    end

})

local Button2 = InfoTab:CreateButton({

    Name = "Coolkid Crash Server",

    Callback = function()

        loadstring(game:HttpGet("https://pastefy.app/LHKqBWsO/raw"))()

    end

})

InfoTab:CreateParagraph({

    Title = "[FRP] - Fuck Roblox Player", 

    Content = "©KRTHub Official"

})

local InfoTab = Window:CreateTab("Animation's", 10528567042 )

local InfoSection = InfoTab:CreateSection("Script Animation:")

-- Кнопка 1

local Button1 = InfoTab:CreateButton({

    Name = "New Roblox Animation",

    Callback = function()

        loadstring(game:HttpGet("https://pastebin.com/raw/NXZp97wG"))

    end

})

local Button1 = InfoTab:CreateButton({

    Name = "Auto Piano",

    Callback = function()

        loadstring(game:HttpGet("https://pastefy.app/gsw5WUQP/raw"))()

    end

})

InfoTab:CreateParagraph({

    Title = "[FRP] - Fuck Roblox Player", 

    Content = "©KRTHub Official"

})

local InfoTab = Window:CreateTab("KRT Hub", 136308321985797 )

local InfoSection = InfoTab:CreateSection("KRT Hub OFFICIAL:")

local Button1 = InfoTab:CreateButton({

    Name = "Copy TG",

    Callback = function()

        loadstring(game:HttpGet("https://pastefy.app/le3JMGVe/raw"))()

    end

})

InfoTab:CreateParagraph({

    Title = "FRP - V.1.0.2", 

    Content = "There are even more scripts in my TG channel!"

})

-- Проверяем, есть ли уже активированный ключ

local function checkExistingKey()

    local success, result = pcall(function()

        if isfile("KRTHub/KRTkeyLogic/KRTKey_" .. LocalPlayer.Name .. ".txt") then

            local content = readfile("KRTHub/KRTkeyLogic/KRTKey_" .. LocalPlayer.Name .. ".txt")

            local lines = {}

            for line in content:gmatch("[^\r\n]+") do

                table.insert(lines, line)

            end

            

            local keyData = {}

            for _, line in ipairs(lines) do

                if line:find("Key:") then

                    keyData.Key = line:gsub("Key: ", "")

                elseif line:find("Expiration:") then

                    keyData.Expiration = line:gsub("Expiration: ", "")

                end

            end

            

            return keyData

        end

        return nil

    end)

    

    if success and result then

        return result

    end

    return nil

end

-- При запуске проверяем существующий ключ

local existingKey = checkExistingKey()

if existingKey then

    local expirationText = existingKey.Expiration == "permanent" and "навсегда" or "до " .. os.date("%c", tonumber(existingKey.Expiration))

    

    Rayfield:Notify({

        Title = "Ключ уже активирован",

        Content = "У вас уже активирован ключ " .. existingKey.Key .. " " .. expirationText,

        Duration = 6.5,

        Image = 4483362458

    })

end

-- Убедимся, что интерфейс отображается правильно

Rayfield:SetWatermarkVisibility(true)

Rayfield:SetWatermark('KRTHun [FRP]')

-- Принудительно обновляем интерфейс, чтобы избежать проблем с позиционированием

task.wait(1)

Rayfield:Destroy()

Window = Rayfield:CreateWindow({

    Name = "KRT Hub [FRP]",

    LoadingTitle = "KRTKey System",

    LoadingSubtitle = "by KRT",

    ConfigurationSaving = {

        Enabled = true,

        FolderName = "KRTKeySystem",

        FileName = "Configuration"

    }

})

-- Повторно создаем вкладки после обновления

-- [здесь должен быть код повторного создания вкладок как выше]