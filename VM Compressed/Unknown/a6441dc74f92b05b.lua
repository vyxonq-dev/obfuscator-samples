-- Load Rayfield Library
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/Skualex2001/Rayfield/main/source.lua"))()

-- Create UI
local Window = Rayfield:CreateWindow({
    Name = "Weed Hub 🌿",
    LoadingTitle = "Welcome to Weed Hub",
    LoadingSubtitle = "by your script assistant",
    ConfigurationSaving = {
        Enabled = false,
        FolderName = nil,
        FileName = "WeedHubConfig"
    },
})

local Tab = Window:CreateTab("Main", 4483362458)

-- Universal Script Button
Tab:CreateButton({
    Name = "Universal Script",
    Callback = function()
        -- Speed + Jump + Kill All
        local Players = game:GetService("Players")
        local lp = Players.LocalPlayer
        local char = lp.Character or lp.CharacterAdded:Wait()
        local hum = char:WaitForChild("Humanoid")
        hum.WalkSpeed = 100
        hum.JumpPower = 120
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= lp and p.Character and p.Character:FindFirstChild("Humanoid") then
                p.Character.Humanoid.Health = 0
            end
        end
    end,
})

-- Fly Script Button
Tab:CreateButton({
    Name = "Fly",
    Callback = function()
        local lp = game:GetService("Players").LocalPlayer
        local char = lp.Character or lp.CharacterAdded:Wait()
        local hum = char:WaitForChild("Humanoid")
        local flying = false
        local speed = 50
        local bg = Instance.new("BodyGyro", char.PrimaryPart)
        local bp = Instance.new("BodyVelocity", char.PrimaryPart)
        bg.P = 9e4; bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
        bp.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        humidity = hum
        game:GetService("UserInputService").InputBegan:Connect(function(input)
            if input.KeyCode == Enum.KeyCode.F then flying = not flying
                bp.Velocity = char.PrimaryPart.CFrame.LookVector * speed
                bg.CFrame = char.PrimaryPart.CFrame
            end
        end)
        game:GetService("RunService").Heartbeat:Connect(function()
            if flying then
                bp.Velocity = char.PrimaryPart.CFrame.LookVector * speed
                bg.CFrame = char.PrimaryPart.CFrame
            else
                bp.Velocity = Vector3.new(0,0,0)
            end
        end)
    end,
})

-- ESP Script Button
Tab:CreateButton({
    Name = "ESP",
    Callback = function()
        for _, pl in pairs(game:GetService("Players"):GetPlayers()) do
            if pl ~= game.Players.LocalPlayer then
                local highlight = Instance.new("Highlight", pl.Character or pl.CharacterAdded:Wait())
                highlight.FillColor = Color3.fromRGB(0,255,0)
                highlight.OutlineTransparency = 1
            end
        end
    end,
})