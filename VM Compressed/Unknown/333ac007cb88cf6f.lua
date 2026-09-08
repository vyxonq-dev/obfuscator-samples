local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- НАСТРОЙКИ СИСТЕМЫ
local RAW_URL = "https://raw.githubusercontent.com/vlad87776/New-rep/refs/heads/main/keys.txt"
local ConfigName = "VladHub_Config.json"
local TimeConfig = "Time_save.json"
local CurrentVersion = "0.1" -- Твоя текущая версия

-- Функция проверки ключа
local function CheckKey(InputText)
    local success, allKeys = pcall(function() return game:HttpGet(RAW_URL) end)
    return success and allKeys and string.find(allKeys, InputText) and InputText ~= ""
end

-- Создание окна
local Window = Rayfield:CreateWindow({
   Name = "🚀 VLAD HUB | Universal",
   LoadingTitle = "Загрузка Универсального Модуля...",
   LoadingSubtitle = "Версия " .. CurrentVersion,
   ConfigurationSaving = { Enabled = false }
})

local KeyTab = Window:CreateTab("🔑 Авторизация", 4483362458)

-- ГЛАВНАЯ ФУНКЦИЯ
function startMainScript(TargetWindow)
    task.delay(0.2, function() if KeyTab then KeyTab:Destroy() end end)

    -- 👤 ВКЛАДКА ИНФО (Твоя визитка)
    local InfoTab = TargetWindow:CreateTab("📜 Инфо", 4483362458)
    InfoTab:CreateSection("О скрипте")
    InfoTab:CreateLabel("Статус: Universal (Любая игра)")
    InfoTab:CreateLabel("Версия: " .. CurrentVersion)
    InfoTab:CreateLabel("Разработчик: vlad87776")
    
    InfoTab:CreateSection("Что нового (v" .. CurrentVersion .. ")")
    InfoTab:CreateLabel("• Создана система авторизации")
    InfoTab:CreateLabel("• Добавлено сохранение времени (Time_save)")
    InfoTab:CreateLabel("• Добавлены Speed и InfJump")
    InfoTab:CreateLabel("• Оптимизация Callback Error")

    local TimerLabel = InfoTab:CreateLabel("⏳ Таймер сессии: 03:00:00")
    
    -- Таймер с сохранением
    task.spawn(function()
        local timeLeft = 10800
        if isfile(TimeConfig) then
            local saved = tonumber(readfile(TimeConfig))
            if saved and saved > 0 then timeLeft = saved end
        end
        while timeLeft > 0 do
            timeLeft = timeLeft - 1
            local hours, mins, secs = math.floor(timeLeft / 3600), math.floor((timeLeft % 3600) / 60), timeLeft % 60
            TimerLabel:Set(string.format("⏳ Таймер сессии: %02d:%02d:%02d", hours, mins, secs))
            if timeLeft % 5 == 0 then writefile(TimeConfig, tostring(timeLeft)) end
            task.wait(1)
        end
        TimerLabel:Set("❌ Время истекло!")
    end)

    -- 🔥 ВКЛАДКА ЧИТЫ
    local MainTab = TargetWindow:CreateTab("🔥 Читы", 4483362458)
    MainTab:CreateSection("Основные функции")

    MainTab:CreateSlider({
       Name = "Скорость бега", Range = {16, 500}, Increment = 1, CurrentValue = 16,
       Callback = function(v) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v end,
    })

    MainTab:CreateToggle({
       Name = "Бесконечный прыжок",
       CurrentValue = false,
       Callback = function(v)
           _G.InfJump = v
           if not _G.InfJumpConn then
               _G.InfJumpConn = game:GetService("UserInputService").JumpRequest:Connect(function()
                   if _G.InfJump then
                       game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
                   end
               end)
           end
       end,
    })

    -- ⚙️ ВКЛАДКА НАСТРОЙКИ
    local SettingsTab = TargetWindow:CreateTab("⚙️ Настройки", 4483362458)
    SettingsTab:CreateButton({
       Name = "🗑️ Сбросить все данные (Ключ + Время)",
       Callback = function()
           if isfile(ConfigName) then delfile(ConfigName) end
           if isfile(TimeConfig) then delfile(TimeConfig) end
           Rayfield:Notify({Title = "Сброс", Content = "Данные удалены. Перезайдите."})
       end,
    })

    SettingsTab:CreateButton({
       Name = "❌ Выгрузить скрипт",
       Callback = function() Rayfield:Destroy() end,
    })
end

-- ЛОГИКА АВТО-ВХОДА
local savedKey = ""
pcall(function() if isfile(ConfigName) then savedKey = readfile(ConfigName) end end)

if savedKey ~= "" and CheckKey(savedKey) then
    startMainScript(Window)
else
    KeyTab:CreateInput({
       Name = "Введи ключ",
       PlaceholderText = "Ключ...",
       Callback = function(Text)
           task.spawn(function()
               if CheckKey(Text) then
                   writefile(ConfigName, Text)
                   startMainScript(Window)
               else
                   Rayfield:Notify({Title = "Ошибка", Content = "Неверный ключ!"})
               end
           end)
       end,
    })
    
    KeyTab:CreateButton({
       Name = "🌍 Получить ключ на сайте",
       Callback = function() if setclipboard then setclipboard("https://vlad87776.github.io/New-rep/") end end,
    })
end