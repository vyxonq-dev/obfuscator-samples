-- opensource timeout script by ezpapa3

repeat task.wait() until game:IsLoaded()
local Players = game:GetService("Players")
local player = Players.LocalPlayer
repeat task.wait() until player

if player.PlayerGui:FindFirstChild("UpdatePrompt") then
    player.PlayerGui.UpdatePrompt:Destroy()
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "UpdatePrompt"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")
screenGui.DisplayOrder = 1000

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 200)
frame.Position = UDim2.new(0.5, -200, 0.5, -100)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
frame.BorderSizePixel = 0
frame.ClipsDescendants = true
frame.Parent = screenGui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 15)
uiCorner.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -20, 0, 60)
title.Position = UDim2.new(0, 10, 0, 10)
title.Text = "SCRIPT OUTDATED"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.Font = Enum.Font.SourceSansBold
title.BackgroundTransparency = 1
title.Parent = frame

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, -20, 0, 40)
subtitle.Position = UDim2.new(0, 10, 0, 80)
subtitle.Text = "Want to run the latest version of the script?"
subtitle.TextColor3 = Color3.fromRGB(200, 200, 255)
subtitle.TextScaled = true
subtitle.Font = Enum.Font.SourceSans
subtitle.BackgroundTransparency = 1
subtitle.Parent = frame

local yesButton = Instance.new("TextButton")
yesButton.Size = UDim2.new(0, 200, 0, 50)
yesButton.Position = UDim2.new(0.5, -100, 1, -70)
yesButton.Text = "YES"
yesButton.TextColor3 = Color3.fromRGB(0, 0, 0)
yesButton.TextScaled = true
yesButton.Font = Enum.Font.SourceSansBold
yesButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
yesButton.BorderSizePixel = 0
yesButton.Parent = frame

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 15)
buttonCorner.Parent = yesButton

local discordLabel = Instance.new("TextLabel")
discordLabel.Size = UDim2.new(1, -20, 0, 20)
discordLabel.Position = UDim2.new(0, 10, 1, -30)
discordLabel.Text = "Join the Discord for updates <3"
discordLabel.TextColor3 = Color3.fromRGB(114, 137, 218)
discordLabel.TextScaled = false
discordLabel.TextSize = 18
discordLabel.Font = Enum.Font.SourceSans
discordLabel.BackgroundTransparency = 1
discordLabel.Parent = frame

yesButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/poophub-ui/premiumfree/main/poophubstealafish.lua.txt"))()
    screenGui:Destroy()
end)
