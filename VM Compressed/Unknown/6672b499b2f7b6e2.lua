local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Screen GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NoxGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 400, 0, 340)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -170)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 60)
MainFrame.BorderSizePixel = 0
MainFrame.BackgroundTransparency = 0.2
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui
MainFrame.Visible = false -- Start invisible

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(0, 255, 255)
UIStroke.Thickness = 3
UIStroke.Parent = MainFrame

-- Welcome Text
local WelcomeLabel = Instance.new("TextLabel")
WelcomeLabel.Size = UDim2.new(1, 0, 0, 40)
WelcomeLabel.Position = UDim2.new(0, 0, 0, 0)
WelcomeLabel.BackgroundTransparency = 1
WelcomeLabel.Text = "Welcome, " .. LocalPlayer.Name
WelcomeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
WelcomeLabel.Font = Enum.Font.SourceSansBold
WelcomeLabel.TextSize = 20
WelcomeLabel.Parent = MainFrame

-- Button Creator Function
local function createButton(text, callback, posX, posY)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0, 180, 0, 40)
    Button.Position = UDim2.new(0, posX, 0, posY)
    Button.BackgroundColor3 = Color3.fromRGB(15, 15, 100)
    Button.TextColor3 = Color3.fromRGB(0, 255, 255)
    Button.Text = text
    Button.Font = Enum.Font.SourceSansBold
    Button.TextSize = 18
    Button.Parent = MainFrame

    local ButtonUICorner = Instance.new("UICorner")
    ButtonUICorner.CornerRadius = UDim.new(0, 10)
    ButtonUICorner.Parent = Button

    Button.MouseButton1Click:Connect(function()
        pcall(callback)
    end)

    -- Button Hover Animation
    local originalColor = Button.BackgroundColor3
    local hoverColor = Color3.fromRGB(30, 30, 150)

    Button.MouseEnter:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.3), {BackgroundColor3 = hoverColor}):Play()
    end)

    Button.MouseLeave:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.3), {BackgroundColor3 = originalColor}):Play()
    end)
end

-- Button Layout
local buttonData = {
    {"Fe scp 096 (R6)", "https://pastefy.app/M25RnnGm/raw"},
    {"Grab Knife (Client)", "https://raw.githubusercontent.com/retpirato/Roblox-Scripts/refs/heads/master/Grab%20Knife%20V4.lua"},
    {"Infinite Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
    {"Self Destruct", nil},

    {"Hat Hub", "https://raw.githubusercontent.com/inkdupe/hat-scripts/refs/heads/main/updatedhathub.lua"},
    {"Cat Bypasser", "https://raw.githubusercontent.com/shadow62x/catbypass/main/upfix"},
    {"Genocider", "https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Sadist%20Genocider"},
    {"Skibidi Hub", "https://raw.githubusercontent.com/aemos2/Skibidihub/refs/heads/main/SkibidiHUB.txt"},
}

for i, data in ipairs(buttonData) do
    local name, url = data[1], data[2]
    local row = (i - 1) % 4
    local col = math.floor((i - 1) / 4)
    local x = 10 + (col * 200)
    local y = 50 + (row * 50)

    if name == "Self Destruct" then
        createButton(name, function()
            ScreenGui:Destroy()
        end, x, y)
    else
        createButton(name, function()
            loadstring(game:HttpGet(url))()
        end, x, y)
    end
end

-- Toggle Button
local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 100, 0, 30)
ToggleButton.Position = UDim2.new(0, 10, 1, -40)
ToggleButton.BackgroundColor3 = Color3.fromRGB(15, 15, 100)
ToggleButton.TextColor3 = Color3.fromRGB(0, 255, 255)
ToggleButton.Text = "Toggle GUI"
ToggleButton.Font = Enum.Font.SourceSansBold
ToggleButton.TextSize = 14
ToggleButton.Parent = ScreenGui

local ToggleUICorner = Instance.new("UICorner")
ToggleUICorner.CornerRadius = UDim.new(0, 10)
ToggleUICorner.Parent = ToggleButton

-- Fade/Slide Toggle Logic
local isVisible = false
ToggleButton.MouseButton1Click:Connect(function()
    if isVisible then
        -- Fade out
        TweenService:Create(MainFrame, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
        task.wait(0.5)
        MainFrame.Visible = false
    else
        -- Appear + Animation
        MainFrame.Visible = true
        MainFrame.Position = UDim2.new(0.5, -200, 0.5, -200) -- Start a little higher
        MainFrame.BackgroundTransparency = 1

        local posTween = TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -200, 0.5, -170)})
        local transparencyTween = TweenService:Create(MainFrame, TweenInfo.new(0.5), {BackgroundTransparency = 0.2})

        posTween:Play()
        transparencyTween:Play()
    end
    isVisible = not isVisible
end)

-- Auto show GUI on load
ToggleButton:FireEvent() -- optional if you want it to appear automatically
