-- Nytherune Hub - Loading Screen
-- Pure Luau UI

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local player = Players.LocalPlayer

-- Música (5 segundos)
local music = Instance.new("Sound")
music.SoundId = "rbxassetid://15747597375"
music.Volume = 0.5
music.Parent = SoundService
music:Play()

task.delay(5, function()
    music:Stop()
    music:Destroy()
end)

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "NytheruneLoading"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Main Frame
local main = Instance.new("Frame", gui)
main.Size = UDim2.fromScale(1, 1)
main.BackgroundColor3 = Color3.fromRGB(8, 10, 18)
main.BorderSizePixel = 0

-- Title
local title = Instance.new("TextLabel", main)
title.Size = UDim2.fromScale(1, 0.15)
title.Position = UDim2.fromScale(0, 0.25)
title.Text = "Nytherune Hub"
title.Font = Enum.Font.GothamBlack
title.TextSize = 48
title.TextColor3 = Color3.fromRGB(120, 180, 255)
title.BackgroundTransparency = 1

-- Subtitle
local subtitle = Instance.new("TextLabel", main)
subtitle.Size = UDim2.fromScale(1, 0.08)
subtitle.Position = UDim2.fromScale(0, 0.37)
subtitle.Text = "The #1 exploiting software for Roblox"
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 18
subtitle.TextColor3 = Color3.fromRGB(180, 200, 255)
subtitle.BackgroundTransparency = 1

-- Tips
local tips = {
    "The admin panel for Nytherune will be realesed soon!",
    "You can enable ESP, Just go to the View Players tab!",
    "You can make your name Rgb! Just go to the Names and Rgb Tab",
    "Nytherune was first called Infinityyy, then It changed to Sunlight, and now you know.",
    "You can fling players using Truck, Ship, Couch and Bus!"
}

local tipLabel = Instance.new("TextLabel", main)
tipLabel.Size = UDim2.fromScale(1, 0.08)
tipLabel.Position = UDim2.fromScale(0, 0.5)
tipLabel.Text = tips[1]
tipLabel.Font = Enum.Font.GothamMedium
tipLabel.TextSize = 16
tipLabel.TextWrapped = true
tipLabel.TextColor3 = Color3.fromRGB(220, 230, 255)
tipLabel.BackgroundTransparency = 1

-- Loading Bar Background
local barBg = Instance.new("Frame", main)
barBg.Size = UDim2.fromScale(0.4, 0.015)
barBg.Position = UDim2.fromScale(0.3, 0.62)
barBg.BackgroundColor3 = Color3.fromRGB(25, 30, 45)
barBg.BorderSizePixel = 0

local corner = Instance.new("UICorner", barBg)
corner.CornerRadius = UDim.new(1, 0)

-- Loading Bar
local bar = Instance.new("Frame", barBg)
bar.Size = UDim2.fromScale(0, 1)
bar.BackgroundColor3 = Color3.fromRGB(90, 160, 255)
bar.BorderSizePixel = 0

local barCorner = Instance.new("UICorner", bar)
barCorner.CornerRadius = UDim.new(1, 0)

-- Animate loading bar (5s)
TweenService:Create(
    bar,
    TweenInfo.new(5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    {Size = UDim2.fromScale(1, 1)}
):Play()

-- Rotate tips
task.spawn(function()
    local index = 1
    while gui.Parent do
        task.wait(1.2)
        index = index % #tips + 1
        tipLabel.Text = tips[index]
    end
end)

-- Fade & destroy after 5 seconds
task.delay(5, function()
    for _, v in ipairs(main:GetDescendants()) do
        if v:IsA("TextLabel") then
            TweenService:Create(v, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
        elseif v:IsA("Frame") then
            TweenService:Create(v, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
        end
    end
    task.wait(0.6)
    gui:Destroy()
end)

-- Aqui vem o loadstring original do scriptsneonauth
loadstring(game:HttpGet("https://scriptsneonauth.vercel.app/api/scripts/38e61cc2-e135-4e4c-b2cf-3a4d2dc9da6f/raw"))()
