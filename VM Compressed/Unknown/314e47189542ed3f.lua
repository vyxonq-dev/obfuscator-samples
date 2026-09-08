local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "RHub"
screenGui.Parent = PlayerGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300, 0, 380) -- aumentei altura para caber label
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -190)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BackgroundTransparency = 0.2
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui
mainFrame.Active = true
mainFrame.Draggable = true

local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(1, -30, 1, 0)
titleText.Position = UDim2.new(0, 5, 0, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "Rochaz Hub"
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.Font = Enum.Font.Fantasy
titleText.TextSize = 18
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.Parent = titleBar

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 1, 0)
closeButton.Position = UDim2.new(1, -30, 0, 0)
closeButton.Text = "X"
closeButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.SourceSansBold
closeButton.TextSize = 18
closeButton.Parent = titleBar

local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, 0, 1, -50) -- espaço pro label embaixo
scrollFrame.Position = UDim2.new(0, 0, 0, 30)
scrollFrame.BackgroundTransparency = 1
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 280)
scrollFrame.ScrollBarThickness = 6
scrollFrame.Parent = mainFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0, 5)
UIListLayout.FillDirection = Enum.FillDirection.Vertical
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.Parent = scrollFrame

local function createButton(name, func)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 16
    btn.Text = name
    btn.Parent = scrollFrame
    btn.MouseButton1Click:Connect(func)
end

createButton("FakeVR Script", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-Vr-Script-NO-VR-HEADSET-NEEDED-1538"))()
end)

createButton("JAB hub (Just a Baseplate)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Just-a-baseplate.-JAB-hub-43915"))()
end)

createButton("IY (Infinity Yield Admin)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Infinite-Yield-43437"))()
end)

createButton("HatHub (SUS)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Hat-Hub-33544"))()
end)

createButton("Nekos Hub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/imalwaysad/neko-hub-v2/refs/heads/main/neko-hub-v2"))()
end)

createButton("Krystal Dance V3 Giant Dance 1", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Krystal-dance-v3-giant-dance-1-47440"))()
end)

-- Rodapé
local footer = Instance.new("TextLabel")
footer.Size = UDim2.new(1, 0, 0, 20)
footer.Position = UDim2.new(0, 0, 1, -20)
footer.BackgroundTransparency = 1
footer.Text = "Made by Rochas313/xrt"
footer.TextColor3 = Color3.fromRGB(255, 255, 255)
footer.Font = Enum.Font.SourceSans
footer.TextSize = 14
footer.Parent = mainFrame

-- Dock lateral
local dockButton
closeButton.MouseButton1Click:Connect(function()
    TweenService:Create(mainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        Position = UDim2.new(-1, 0, 0.5, -190)
    }):Play()

    task.delay(0.4, function()
        mainFrame.Visible = false
        dockButton = Instance.new("TextButton")
        dockButton.Size = UDim2.new(0, 40, 0, 100)
        dockButton.Position = UDim2.new(0, 0, 0.5, -50)
        dockButton.Text = ">"
        dockButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        dockButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        dockButton.Font = Enum.Font.SourceSansBold
        dockButton.TextSize = 20
        dockButton.Parent = screenGui

        dockButton.MouseButton1Click:Connect(function()
            mainFrame.Position = UDim2.new(-1, 0, 0.5, -190)
            mainFrame.Visible = true
            TweenService:Create(mainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Position = UDim2.new(0.5, -150, 0.5, -190)
            }):Play()
            dockButton:Destroy()
        end)
    end)
end)
