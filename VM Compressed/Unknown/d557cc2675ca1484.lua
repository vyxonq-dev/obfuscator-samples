local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Players = game:GetService("Players")

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

local SpeedBoost = ReplicatedStorage:WaitForChild("SpeedBoost")

local lastSpeedGain = 0

local isWalking = false

local speedBoostActive = false

local speedBoostValue = 1

local Window = Rayfield:CreateWindow({

    Name = "1+ Speed 99 Nights Escape",

    LoadingTitle = "These games are copy n paste bruh🥀",

    LoadingSubtitle = "by WarningBot_Dead",

    ConfigurationSaving = {

        Enabled = true,

        FolderName = "Speed99NightsEscape",

        FileName = "Config"

    },

    Discord = {

        Enabled = false

    },

    KeySystem = false,

    Theme = "Amethyst"

})

local MainTab = Window:CreateTab("Main")

local InfoTab = Window:CreateTab("Info")

local SpeedBoostToggle = MainTab:CreateToggle({

    Name = "SpeedBoost",

    CurrentValue = false,

    Flag = "SpeedBoostToggle",

    Callback = function(Value)

        speedBoostActive = Value

        if Value then

            Rayfield:Notify({

                Title = "SpeedBoost",

                Content = "SpeedBoost activated with value: " .. speedBoostValue,

                Duration = 3

            })

        else

            Rayfield:Notify({

                Title = "SpeedBoost",

                Content = "SpeedBoost deactivated.",

                Duration = 3

            })

        end

    end

})

local SpeedBoostSlider = MainTab:CreateSlider({

    Name = "SpeedBoost Value",

    Range = {1, 999000000},

    Increment = 1,

    Suffix = "Speed",

    CurrentValue = 1,

    Flag = "SpeedBoostValue",

    Callback = function(Value)

        speedBoostValue = Value

        if speedBoostActive then

            Rayfield:Notify({

                Title = "SpeedBoost Updated",

                Content = "SpeedBoost value set to: " .. Value,

                Duration = 3

            })

        end

    end

})

local InfoLabel = InfoTab:CreateLabel("Also works for games: 1+ Speed Brainrot Escape and 1+ Speed Freddy Escape. Cuz they're all copy and pastes. By the same creator. Does NOT work on other 1+ Speed Escape games. Script by WarningBot_Dead.")

local function handleSpeedGain()

    local character = LocalPlayer.Character

    local isMoving = false

    if character then

        local humanoid = character:FindFirstChild("Humanoid")

        if humanoid then

            isMoving = humanoid.MoveDirection.Magnitude > 0.1

        end

    end

    if speedBoostActive and isMoving then

        if not isWalking then

            isWalking = true

        end

        local currentTime = tick()

        if currentTime - lastSpeedGain >= 1 then

            SpeedBoost:FireServer("WalkingSpeedGain", speedBoostValue)

            lastSpeedGain = currentTime

        end

    elseif isWalking then

        isWalking = false

    end

end

RunService.Heartbeat:Connect(handleSpeedGain)

LocalPlayer.CharacterAdded:Connect(function()

    isWalking = false

    lastSpeedGain = 0

end)

Rayfield:Notify({

    Title = "Script Loaded",

    Content = "1+ Speed 99 Nights Escape is ready!",

    Duration = 5

})