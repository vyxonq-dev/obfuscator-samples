local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Build an Obby Autofarm Money",
   Icon = 0,
   LoadingTitle = "loading",
   LoadingSubtitle = "by mykpat",
   ShowText = "Rayfield",
   Theme = "AmberGlow",
   ToggleUIKeybind = "K",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "Big Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },
   KeySystem = false
})

local Tab = Window:CreateTab("Main", 4483362458)

-- Создаем глобальные переменные
getgenv().farm = false
getgenv().selectedObby = "None"

local Dropdown = Tab:CreateDropdown({
   Name = "Obby for Autofarm",
   Options = {"None","Blue Obby","Lime Green Obby","Orange Obby","Pink Obby","Red Obby","Teal Obby","White Obby","Yellow Obby"},
   CurrentOption = {"None"},
   MultipleOptions = false,
   Flag = "Dropdown1",
   Callback = function(Option)
      getgenv().selectedObby = Option[1]
   end,
})

local Toggle = Tab:CreateToggle({
   Name = "Autofarm",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
      getgenv().farm = Value
      
      if Value then
         -- Запускаем автофарм
         startAutofarm()
      end
   end,
})

-- Функция автофарма
function startAutofarm()
    spawn(function()
        while getgenv().farm do
            task.wait()
            
            -- Проверяем выбран ли обби
            if getgenv().selectedObby == "None" then
                getgenv().farm = false
                Toggle:Set(false)
                break
            end

            local Players = game:GetService("Players")
            local Workspace = game:GetService("Workspace")

            -- Получаем локального игрока
            local player = Players.LocalPlayer
            if not player then
                return
            end

            -- Ждем загрузку персонажа
            if not player.Character then
                player.CharacterAdded:Wait()
            end
            local character = player.Character
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

            local finishPart = nil

            -- Поиск money парта в выбранном обби
            local targetPath = Workspace.Terrain.Obbyplot[getgenv().selectedObby]
            if targetPath and targetPath:FindFirstChild("finish_normal") then
                local finishNormal = targetPath.finish_normal
                local moneyPart = finishNormal:FindFirstChild("money")
                
                if moneyPart and moneyPart:IsA("Part") then
                    finishPart = moneyPart
                end
            end

            -- Если не нашли в основном пути, ищем во всем воркспейсе
            if not finishPart then
                finishPart = Workspace:FindFirstChild("money", true)
            end

            -- Телепортируем money part к игроку
            if finishPart and finishPart:IsA("Part") then
                -- Сохраняем оригинальные свойства
                local originalAnchored = finishPart.Anchored
                
                -- Отключаем якорь и удаляем физические силы
                finishPart.Anchored = false
                
                for _, child in pairs(finishPart:GetChildren()) do
                    if child:IsA("BodyVelocity") or child:IsA("BodyGyro") or child:IsA("BodyForce") then
                        child:Destroy()
                    end
                end
                
                -- Телепортируем к игроку
                finishPart.Position = humanoidRootPart.Position
                
                -- Ждем немного перед следующей итерацией
                task.wait(0.1)
                
                -- Восстанавливаем оригинальное состояние (опционально)
                finishPart.Anchored = originalAnchored
            end
        end
    end)
end
 
local Label = Tab:CreateLabel("by mykpat", 111602444094745, Color3.fromRGB(176, 121, 69), false) -- Title, Icon, Color, IgnoreTheme

-- Сначала копируем ссылку
setclipboard("https://www.youtube.com/@mykpat78")

-- Затем показываем уведомление
Rayfield:Notify({
   Title = "Youtube",
   Content = "mykpat78",
   Duration = 6.5,
   Image = 1275974017,
})