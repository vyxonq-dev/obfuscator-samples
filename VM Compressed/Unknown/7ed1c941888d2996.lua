-- Load Orion UI
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/jensonhirst/Orion/main/source"))()

local Window = OrionLib:MakeWindow({
    Name = "Pablo Hub",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "PabloHub"
})

local Tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local Tycoons = workspace:WaitForChild("Map"):WaitForChild("Tycoons")
local hrp
local closestTycoon

-- Variables
local noclipEnabled = false
local speedEnabled = false
local infiniteJumpEnabled = false

-- Find closest tycoon
local function findClosestTycoon()
    hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local nearest, shortest = nil, math.huge
    for _, tycoonFolder in ipairs(Tycoons:GetChildren()) do
        local tycoonModel = tycoonFolder:FindFirstChild("Tycoon")
        if tycoonModel and tycoonModel.PrimaryPart then
            local dist = (hrp.Position - tycoonModel.PrimaryPart.Position).Magnitude
            if dist < shortest then
                shortest, nearest = dist, tycoonModel
            end
        end
    end
    closestTycoon = nearest
end

findClosestTycoon()
player.CharacterAdded:Connect(function()
    task.wait(1)
    findClosestTycoon()
end)

-- Auto Steal with Discord UI
local function autoSteal()
    if not hrp or not closestTycoon then return end

    local ScreenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
    ScreenGui.IgnoreGuiInset = true

    local Frame = Instance.new("Frame", ScreenGui)
    Frame.Size = UDim2.new(1, 0, 1, 0)
    Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

    local Label = Instance.new("TextLabel", Frame)
    Label.Size = UDim2.new(1, 0, 0.2, 0)
    Label.Position = UDim2.new(0, 0, 0.25, 0)
    Label.Text = "STEALING..."
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.TextScaled = true
    Label.BackgroundTransparency = 1

    local DiscordLabel = Instance.new("TextLabel", Frame)
    DiscordLabel.Size = UDim2.new(1, 0, 0.1, 0)
    DiscordLabel.Position = UDim2.new(0, 0, 0.5, 0)
    DiscordLabel.Text = "Join Discord today: https://discord.gg/Kr9PBx83"
    DiscordLabel.TextColor3 = Color3.fromRGB(0, 255, 255)
    DiscordLabel.TextScaled = true
    DiscordLabel.BackgroundTransparency = 1

    local BarBack = Instance.new("Frame", Frame)
    BarBack.Size = UDim2.new(0.8, 0, 0.05, 0)
    BarBack.Position = UDim2.new(0.1, 0, 0.7, 0)
    BarBack.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    BarBack.BorderSizePixel = 0

    local BarFill = Instance.new("Frame", BarBack)
    BarFill.Size = UDim2.new(0, 0, 1, 0)
    BarFill.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    BarFill.BorderSizePixel = 0

    -- Teleport high
    hrp.CFrame = hrp.CFrame + Vector3.new(0, 500, 0)

    local duration = 4
    if closestTycoon and closestTycoon.PrimaryPart then
        local tween = TweenService:Create(hrp, TweenInfo.new(duration), {
            CFrame = closestTycoon.PrimaryPart.CFrame + Vector3.new(0, 5, 0)
        })
        tween:Play()

        local start = tick()
        while tick() - start < duration do
            local progress = (tick() - start) / duration
            BarFill.Size = UDim2.new(progress, 0, 1, 0)
            task.wait()
        end

        ScreenGui:Destroy()
    end
end

-- Speed Boost
local speedBoostOn = false
local function speedBoostLoop()
    while speedBoostOn do
        if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
            player.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 50
        end
        task.wait(1)
    end
    if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
        player.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 16
    end
end

-- Infinite Jump
UserInputService.JumpRequest:Connect(function()
    if infiniteJumpEnabled and player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
        player.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)

-- Noclip
game:GetService("RunService").Stepped:Connect(function()
    if noclipEnabled and player.Character then
        for _, part in ipairs(player.Character:GetChildren()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

-- Orion Buttons
Tab:AddButton({
    Name = "Auto Steal",
    Callback = function()
        autoSteal()
    end
})

Tab:AddToggle({
    Name = "Speed Boost",
    Default = false,
    Callback = function(val)
        speedBoostOn = val
        if val then
            task.spawn(speedBoostLoop)
        end
    end
})

Tab:AddToggle({
    Name = "Infinite Jump",
    Default = false,
    Callback = function(val)
        infiniteJumpEnabled = val
    end
})

Tab:AddToggle({
    Name = "Noclip",
    Default = false,
    Callback = function(val)
        noclipEnabled = val
    end
})

Tab:AddButton({
    Name = "Join Discord",
    Callback = function()
        setclipboard("https://discord.gg/Kr9PBx83")
        OrionLib:MakeNotification({
            Name = "Discord",
            Content = "Invite link copied to clipboard!",
            Time = 3
        })
    end
})

Tab:AddButton({
    Name = "Made by Pablo",
    Callback = function()
        OrionLib:MakeNotification({
            Name = "Pablo Hub",
            Content = "Made with ❤️ by Pablo",
            Time = 3
        })
    end
})

OrionLib:Init()