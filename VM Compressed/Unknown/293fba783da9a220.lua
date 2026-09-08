local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Sprinting = game:GetService("ReplicatedStorage").Systems.Character.Game.Sprinting
local m = require(Sprinting)

local Window = Rayfield:CreateWindow({
    Name = "forsakened",
    LoadingTitle = "loading mr forsaken",
    LoadingSubtitle = "hello guys",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "forsaken",
    },
    KeySystem = false
})

local GeneratorTab = Window:CreateTab("auto generator")
local SpeedTab = Window:CreateTab("speed and stamina")

local maxDistance = 20
local loopEnabled = false

GeneratorTab:CreateLabel("its random but it gets there fast enough for me to not care", 4483362458, Color3.fromRGB(255, 255, 255), false)

GeneratorTab:CreateSlider({
    Name = "the distance or something",
    Range = {1, 500},
    Increment = 0.00001,
    Suffix = "studs",
    CurrentValue = maxDistance,
    Callback = function(Value)
        if Value then
            maxDistance = Value
        else
            maxDistance = 20 -- Default fallback in case Value is nil
        end
    end
})

GeneratorTab:CreateToggle({
    Name = "auto generator",
    CurrentValue = false,
    Flag = "AutoGenToggle",
    Callback = function(Value)
        loopEnabled = Value
    end
})

SpeedTab:CreateLabel("you'll have to re-set these and speed each respawn", 4483362458, Color3.fromRGB(255, 255, 255), false)

SpeedTab:CreateSlider({
    Name = "max",
    Range = {50, 200},
    Increment = 1,
    Suffix = "stamina",
    CurrentValue = m.MaxStamina,
    Callback = function(Value)
        m.MaxStamina = Value
    end
})

SpeedTab:CreateSlider({
    Name = "gain",
    Range = {1, 100},
    Increment = 1,
    Suffix = "gain per second",
    CurrentValue = m.StaminaGain,
    Callback = function(Value)
        m.StaminaGain = Value
    end
})

SpeedTab:CreateSlider({
    Name = "loss",
    Range = {1, 50},
    Increment = 1,
    Suffix = "loss per second",
    CurrentValue = m.StaminaLoss,
    Callback = function(Value)
        m.StaminaLoss = Value
    end
})

SpeedTab:CreateLabel("sprintspeed does not update until you start sprinting again", 4483362458, Color3.fromRGB(255, 255, 255), false)
SpeedTab:CreateSlider({
    Name = "speed",
    Range = {16, 50},
    Increment = 1,
    Suffix = "speed",
    CurrentValue = m.SprintSpeed,
    Callback = function(Value)
        m.SprintSpeed = Value
    end
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local HumanoidRootPart = nil

local function fireClickDetector(clickDetector)
    if clickDetector and clickDetector:IsA("ClickDetector") then
        fireclickdetector(clickDetector)
    end
end

local function processButtonsModel(buttonsModel)
    if not HumanoidRootPart then return end

    local validColors = {
        Color3.fromRGB(0, 150, 0),
        Color3.fromRGB(150, 0, 0)
    }

    local ignoredColor = Color3.fromRGB(160, 145, 80)
    local clickDetectors = {}

    for _, child in pairs(buttonsModel:GetDescendants()) do
        if child:IsA("MeshPart") then
            if child.Color == ignoredColor then
                continue
            end

            local isValidColor = false
            for _, validColor in pairs(validColors) do
                if child.Color == validColor then
                    isValidColor = true
                    break
                end
            end

            if isValidColor then
                local clickDetector = child:FindFirstChildWhichIsA("ClickDetector")
                if clickDetector then
                    local distance = (child.Position - HumanoidRootPart.Position).Magnitude
                    if distance <= maxDistance then
                        table.insert(clickDetectors, clickDetector)
                    end
                end
            end
        end
    end

    if #clickDetectors > 0 then
        local randomIndex = math.random(1, #clickDetectors)
        fireClickDetector(clickDetectors[randomIndex])
    end
end

local function updateCharacterReferences()
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    HumanoidRootPart = character:WaitForChild("HumanoidRootPart")
end

-- Ensure HumanoidRootPart is updated on respawn.
LocalPlayer.CharacterAdded:Connect(function()
    updateCharacterReferences()
end)

updateCharacterReferences()  -- Initial call for the first time

task.spawn(function()
    while task.wait() do
        if loopEnabled and HumanoidRootPart then
            for _, generator in pairs(workspace.Map.Ingame.Map:GetChildren()) do
                if generator:IsA("Model") and generator:FindFirstChild("Puzzle") and generator.Puzzle:FindFirstChild("Buttons") then
                    processButtonsModel(generator.Puzzle.Buttons)
                end
            end
        end
    end
end)
