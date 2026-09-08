local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "[👑] Steal a Clash Royale",
   Icon = 0,
   LoadingTitle = "loading",
   LoadingSubtitle = "by mykpat",
   ShowText = "Rayfield",
   Theme = "AmberGlow",
   ToggleUIKeybind = "K",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil,
      FileName = "Big Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },
   KeySystem = false,
})

-- Сначала копируем ссылку
setclipboard("https://www.youtube.com/@mykpat78")

-- Затем показываем уведомление
Rayfield:Notify({
   Title = "Youtube",
   Content = "mykpat78",
   Duration = 6.5,
   Image = 1275974017,
})

-- Переменные для хранения состояния
local InstantStealEnabled = false
local SelectedBase = "Base1"
local NoclipEnabled = false
local SpeedBoostEnabled = false
local SpeedBoostAmount = 75 -- Фиксированная скорость 75
local InfJumpEnabled = false
local InfJumpConnection = nil

local Tab = Window:CreateTab("Main", 4483362458)

-- Функция для автоматического поиска базы игрока
local function findPlayerBase()
    local players = game:GetService("Players")
    local localPlayer = players.LocalPlayer
    
    -- Ищем Configuration в самом игроке (не в Workspace)
    local configuration = localPlayer:FindFirstChild("Configuration")
    if configuration then
        -- Ищем Base внутри Configuration
        local base = configuration:FindFirstChild("Base")
        if base then
            -- Получаем значение Value из Base (это ObjectValue)
            if base:IsA("ObjectValue") then
                local baseValue = base.Value
                if baseValue then
                    return baseValue.Name -- Возвращаем имя базы (например "Base7")
                end
            end
        end
    end
    
    return nil
end

-- Функция для поиска CollectZone в базе
local function findCollectZone(baseModel)
    if baseModel then
        local collectZone = baseModel:FindFirstChild("CollectZone")
        if collectZone then
            return collectZone
        end
        
        for _, child in pairs(baseModel:GetDescendants()) do
            if child.Name == "CollectZone" then
                return child
            end
        end
    end
    return nil
end

-- Функция для телепортации к CollectZone выбранной базы
local function TeleportToCollectZone()
    if not InstantStealEnabled then
        return
    end
    
    local workspace = game:GetService("Workspace")
    local basesFolder = workspace:FindFirstChild("Bases")
    
    if basesFolder then
        local targetBase = basesFolder:FindFirstChild(SelectedBase)
        if targetBase then
            local collectZone = findCollectZone(targetBase)
            if collectZone then
                local character = game.Players.LocalPlayer.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    -- Телепортируем персонажа к CollectZone, но выше него чтобы не упасть под карту
                    local newCFrame = collectZone.CFrame + Vector3.new(0, 5, 0)
                    character.HumanoidRootPart.CFrame = newCFrame
                end
            end
        end
    end
end

-- Noclip функция
local function NoclipLoop()
    local character = game.Players.LocalPlayer.Character
    if character and NoclipEnabled then
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end

-- Speed Boost функция
local function ApplySpeedBoost()
    local character = game.Players.LocalPlayer.Character
    if character and character:FindFirstChild("Humanoid") then
        if SpeedBoostEnabled then
            character.Humanoid.WalkSpeed = SpeedBoostAmount
        else
            character.Humanoid.WalkSpeed = 16 -- Стандартная скорость
        end
    end
end

-- Функция для включения/выключения бесконечного прыжка
local function setInfJumpState(enabled)
    InfJumpEnabled = enabled
    
    if enabled then
        -- Включаем бесконечный прыжок
        local Player = game.Players.LocalPlayer
        local Character = Player.Character or Player.CharacterAdded:Wait()
        
        local function enableInfJump()
            local UIS = game:GetService("UserInputService")
            
            if InfJumpConnection then
                InfJumpConnection:Disconnect()
            end
            
            InfJumpConnection = UIS.JumpRequest:Connect(function()
                if Character and Character:FindFirstChild("Humanoid") then
                    Character.Humanoid:ChangeState("Jumping")
                end
            end)
        end
        
        if not Character then
            Player.CharacterAdded:Connect(function(newChar)
                Character = newChar
                enableInfJump()
            end)
        else
            enableInfJump()
        end
    else
        -- Выключаем бесконечный прыжок
        if InfJumpConnection then
            InfJumpConnection:Disconnect()
            InfJumpConnection = nil
        end
    end
end

-- Запуск Noclip цикла
spawn(function()
    while true do
        NoclipLoop()
        wait(0.1)
    end
end)

-- Toggle для Instant Steal
local InstantStealToggle = Tab:CreateToggle({
   Name = "Instant Steal",
   CurrentValue = InstantStealEnabled,
   Flag = "InstantStealToggle",
   Callback = function(Value)
      InstantStealEnabled = Value
   end,
})

-- Функция для автоматического обновления и выбора базы
local function UpdateAndSelectPlayerBase()
    local playerBase = findPlayerBase()
    if playerBase then
        SelectedBase = playerBase
        Rayfield:Notify({
            Title = "Base Found",
            Content = "nice " .. playerBase,
            Duration = 3,
            Image = 0,
        })
    else
        Rayfield:Notify({
            Title = "Base Not Found",
            Content = "error",
            Duration = 3,
            Image = 0,
        })
    end
end

-- Keybind для телепортации к CollectZone выбранной базы
local TeleportKeybind = Tab:CreateKeybind({
   Name = "Instant Steal Keybind",
   CurrentKeybind = "None",
   HoldToInteract = false,
   Flag = "TeleportKeybind",
   Callback = function(Keybind)
      if InstantStealEnabled then
          TeleportToCollectZone()
      end
   end,
})

-- Автоматическое применение скорости при возрождении персонажа
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    wait(1) -- Ждем пока персонаж полностью загрузится
    ApplySpeedBoost()
end)

-- Автоматически находим базу игрока при запуске
spawn(function()
    wait(2)
    UpdateAndSelectPlayerBase()
end)

-- Также обновляем базу при смене персонажа (на всякий случай)
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    wait(2)
    UpdateAndSelectPlayerBase()
end)

local Label = Tab:CreateLabel("by mykpat!", 9260491536, Color3.fromRGB(176, 121, 69), false) -- Title, Icon, Color, IgnoreTheme

local PlayerTab = Window:CreateTab("Player", 4483362458)

-- Toggle для Noclip
local NoclipToggle = PlayerTab:CreateToggle({
   Name = "Noclip",
   CurrentValue = NoclipEnabled,
   Flag = "NoclipToggle",
   Callback = function(Value)
      NoclipEnabled = Value
   end,
})

-- Keybind для Noclip
local NoclipKeybind = PlayerTab:CreateKeybind({
   Name = "Noclip Keybind",
   CurrentKeybind = "None",
   HoldToInteract = false,
   Flag = "NoclipKeybind",
   Callback = function(Keybind)
      NoclipEnabled = not NoclipEnabled
      NoclipToggle:Set(NoclipEnabled)
   end,
})

-- Toggle для Speed Boost
local SpeedBoostToggle = PlayerTab:CreateToggle({
   Name = "Speed Boost",
   CurrentValue = SpeedBoostEnabled,
   Flag = "SpeedBoostToggle",
   Callback = function(Value)
      SpeedBoostEnabled = Value
      ApplySpeedBoost()
   end,
})

-- Keybind для Speed Boost
local SpeedBoostKeybind = PlayerTab:CreateKeybind({
   Name = "Speed Boost Keybind",
   CurrentKeybind = "None",
   HoldToInteract = false,
   Flag = "SpeedBoostKeybind",
   Callback = function(Keybind)
      SpeedBoostEnabled = not SpeedBoostEnabled
      SpeedBoostToggle:Set(SpeedBoostEnabled)
      ApplySpeedBoost()
   end,
})

-- Тогл для включения/выключения бесконечного прыжка
local InfJumpToggle = PlayerTab:CreateToggle({
   Name = "Inf Jump",
   CurrentValue = InfJumpEnabled,
   Flag = "InfJumpToggle",
   Callback = function(Value)
      setInfJumpState(Value)
   end,
})

-- Кейбинд для переключения бесконечного прыжка
local InfJumpKeybind = PlayerTab:CreateKeybind({
   Name = "Inf Jump Keybind",
   CurrentKeybind = "None",
   HoldToInteract = false,
   Flag = "InfJumpKeybind",
   Callback = function(Keybind)
      local newState = not InfJumpEnabled
      setInfJumpState(newState)
      InfJumpToggle:Set(newState)
   end,
})