local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Speedy",
    Icon = 0,
    LoadingTitle = "Rayfield is neat",
    LoadingSubtitle = "by Sirius",
    Theme = "Default",
    ConfigurationSaving = {Enabled = true, FileName = "SpeedConfig"},
    KeySystem = false
})

local Tab = Window:CreateTab("Movement", 4483362458)
Tab:CreateSection("Controls")

local LocalPlayer = game:GetService("Players").LocalPlayer
local RunService = game:GetService("RunService")

local activeLoop = false

Tab:CreateDropdown({
    Name = "Mode",
    Options = {"CFrame"}, -- Velocity + Humanoid
    CurrentOption = "CFrame",
    Callback = function()
        if activeLoop then activeLoop:Disconnect() end
        if LocalPlayer.Character then
            local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if hrp and hum then
                activeLoop = RunService.Heartbeat:Connect(function()
                    local dir = hum.MoveDirection
                    if dir.Magnitude > 0 then
                        hrp.CFrame = hrp.CFrame + dir * (50 / 50)
                    end
                end)
            end
        end
    end
})

Tab:CreateSlider({
    Name = "Speed",
    Range = {0,200},
    Increment = 5,
    Suffix = "Speed",
    CurrentValue = 50,
    Callback = function(val)
        if activeLoop then activeLoop:Disconnect() end
        if LocalPlayer.Character then
            local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if hrp and hum then
                activeLoop = RunService.Heartbeat:Connect(function()
                    local dir = hum.MoveDirection
                    if dir.Magnitude > 0 then
                        hrp.CFrame = hrp.CFrame + dir * (val / 50)
                    end
                end)
            end
        end
    end
})

Tab:CreateToggle({
    Name = "Enable",
    CurrentValue = false,
    Callback = function(val)
        if activeLoop then activeLoop:Disconnect() end
        if val and LocalPlayer.Character then
            local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if hrp and hum then
                activeLoop = RunService.Heartbeat:Connect(function()
                    local dir = hum.MoveDirection
                    if dir.Magnitude > 0 then
                        hrp.CFrame = hrp.CFrame + dir * (50 / 50)
                    end
                end)
            end
        end
    end
})

Rayfield:LoadConfiguration()
