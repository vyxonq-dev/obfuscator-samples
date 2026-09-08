-- Services
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

-- Load AutofarmX library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/vericodified/AutofarmX/refs/heads/main/Source.lua"))();
task.spawn(loadstring(game:HttpGet("https://raw.githubusercontent.com/vericodified/AutofarmX/refs/heads/main/Source2.lua")))

-- ================= AUTOFARMX WINDOW =================
local Window = Library.CreateLib("AutofarmX", "Ocean")
local Tab = Window:NewTab("Auto")
local Section = Tab:NewSection("Main")

-- Autofarm toggle
Section:NewToggle("Auto-Farm", "Wins for your noob self!", function(state)
    getgenv().TomatoAutoFarm = state
end)

-- Credit label
Section:NewLabel("Made by Verified")

-- Minimize button for AutofarmX
local mainFrame = Window.Main or Window.Frame or Window.UI  -- fallback guesses
if mainFrame then
    local minimizeBtn = Instance.new("TextButton", mainFrame)
    minimizeBtn.Size = UDim2.new(0, 30, 0, 30)
    minimizeBtn.Position = UDim2.new(1, -35, 0, 5)
    minimizeBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    minimizeBtn.Text = "–"
    minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    minimizeBtn.Font = Enum.Font.GothamBold
    minimizeBtn.TextSize = 18
    Instance.new("UICorner", minimizeBtn).CornerRadius = UDim.new(0, 6)

    local minimized = false
    local originalSize = mainFrame.Size
    local miniSize = UDim2.new(0, 50, 0, 50)

    -- Store children for visibility toggle
    local children = {}
    for _, c in ipairs(mainFrame:GetChildren()) do
        if c:IsA("Frame") or c:IsA("TextLabel") or c:IsA("TextButton") then
            table.insert(children, c)
        end
    end

    minimizeBtn.MouseButton1Click:Connect(function()
        minimized = not minimized
        if minimized then
            local tween = TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = miniSize})
            tween:Play()
            for _, c in ipairs(children) do
                if c ~= minimizeBtn then
                    c.Visible = false
                end
            end
        else
            local tween = TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = originalSize})
            tween:Play()
            for _, c in ipairs(children) do
                c.Visible = true
            end
        end
    end)
end

-- ================= JOINWATCHER WINDOW =================
pcall(function() CoreGui:FindFirstChild("Joinwatcher"):Destroy() end)

local enabled = false
local cooldown = false
local countdownLabel

-- Reset + kick function
local function resetAndKick()
    if not enabled or cooldown then return end
    cooldown = true
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then hum.Health = 0 end
    for i = 5, 1, -1 do
        if countdownLabel then
            countdownLabel.Text = "Kicking in: "..i.."s"
        end
        task.wait(1)
    end
    if enabled then
        LocalPlayer:Kick("Reset + Kick executed (Player Joined).")
    end
end

for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then resetAndKick() end
end
Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then resetAndKick() end
end)

-- GUI
local gui = Instance.new("ScreenGui", CoreGui)
gui.Name = "Joinwatcher"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 180)
frame.Position = UDim2.new(0.7, -150, 0.4, -90)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

-- Title
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Joinwatcher Hub"
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Countdown label
countdownLabel = Instance.new("TextLabel", frame)
countdownLabel.Size = UDim2.new(1, 0, 0, 30)
countdownLabel.Position = UDim2.new(0, 0, 0.35, 0)
countdownLabel.BackgroundTransparency = 1
countdownLabel.Text = "Waiting..."
countdownLabel.Font = Enum.Font.Gotham
countdownLabel.TextSize = 16
countdownLabel.TextColor3 = Color3.fromRGB(200, 200, 200)

-- Toggle button
local toggle = Instance.new("TextButton", frame)
toggle.Size = UDim2.new(0.7, 0, 0, 50)
toggle.Position = UDim2.new(0.15, 0, 0.65, 0)
toggle.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
toggle.Text = "OFF"
toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
toggle.Font = Enum.Font.GothamBold
toggle.TextSize = 18
toggle.BorderSizePixel = 0
Instance.new("UICorner", toggle).CornerRadius = UDim.new(0, 10)

toggle.MouseButton1Click:Connect(function()
    enabled = not enabled
    cooldown = false
    if enabled then
        toggle.Text = "ON"
        toggle.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
        countdownLabel.Text = "Waiting..."
    else
        toggle.Text = "OFF"
        toggle.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
        countdownLabel.Text = "Disabled"
    end
end)

-- Minimize button
local minimizeBtnJW = Instance.new("TextButton", frame)
minimizeBtnJW.Size = UDim2.new(0, 30, 0, 30)
minimizeBtnJW.Position = UDim2.new(1, -35, 0, 5)
minimizeBtnJW.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
minimizeBtnJW.Text = "–"
minimizeBtnJW.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeBtnJW.Font = Enum.Font.GothamBold
minimizeBtnJW.TextSize = 18
Instance.new("UICorner", minimizeBtnJW).CornerRadius = UDim.new(0, 6)

local minimizedJW = false
local originalSizeJW = frame.Size
local miniSizeJW = UDim2.new(0, 50, 0, 50)

-- Icon label for minimized state
local iconLabel = Instance.new("TextLabel", frame)
iconLabel.Size = UDim2.new(1,0,1,0)
iconLabel.Position = UDim2.new(0,0,0,0)
iconLabel.BackgroundTransparency = 1
iconLabel.Text = "JH"
iconLabel.Font = Enum.Font.GothamBold
iconLabel.TextSize = 18
iconLabel.TextColor3 = Color3.fromRGB(255,255,255)
iconLabel.Visible = false
iconLabel.TextScaled = true

-- Minimize logic
minimizeBtnJW.MouseButton1Click:Connect(function()
    minimizedJW = not minimizedJW
    if minimizedJW then
        local tween = TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = miniSizeJW})
        tween:Play()
        countdownLabel.Visible = false
        toggle.Visible = false
        title.Visible = false
        iconLabel.Visible = true
    else
        local tween = TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = originalSizeJW})
        tween:Play()
        countdownLabel.Visible = true
        toggle.Visible = true
        title.Visible = true
        iconLabel.Visible = false
    end
end)
