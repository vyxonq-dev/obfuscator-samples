local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local TARGET = Vector3.new(-1973.4267578125, 140.89794921875, 4882.22265625)
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local connection = nil

local Window = Rayfield:CreateWindow({Name = "TP", LoadingTitle = "TP", Theme = "DarkBlue", Icon = "map-pin", ConfigurationSaving = {Enabled = false}})
local Tab = Window:CreateTab("Loop", "map-pin")
Tab:CreateSection("Teleport")

local Toggle = Tab:CreateToggle({
    Name = "Auto Win",
    CurrentValue = false,
    Callback = function(state)
        if state and not connection then
            connection = RunService.Heartbeat:Connect(function()
                local char = Players.LocalPlayer.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    hrp.CFrame = CFrame.new(TARGET)
                end
            end)
        elseif not state and connection then
            connection:Disconnect()
            connection = nil
        end
    end
})
