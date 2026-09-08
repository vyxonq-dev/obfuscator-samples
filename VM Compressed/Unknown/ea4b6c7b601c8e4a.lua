-- gg executor – RED + Speed Busters (Boost button, no notifications)

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer
local pgui = player:WaitForChild("PlayerGui")

local main = Instance.new("ScreenGui")
main.Name = "gg_executor_GUI"
main.ResetOnSpawn = false
main.IgnoreGuiInset = true
main.Parent = pgui

-- ==================== SOUNDS ====================
local clickSound = Instance.new("Sound", main)
clickSound.SoundId = "rbxassetid://17208361335"
clickSound.Volume = 0.7

local execSound = Instance.new("Sound", main)
execSound.SoundId = "rbxassetid://17208335138"
execSound.Volume = 0.8

local function playClick() clickSound:Play() end
local function playExec() execSound:Play() end

-- ==================== NOTIFICATION (оставлена только для Executor) ====================
local function sendNotification(title, message, duration)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = message,
            Duration = duration or 5
        })
    end)
end

-- ==================== BACKDOOR SCANNER ====================
local function scanForBackdoors()
    local backdoors = {}
    for _, obj in pairs(ReplicatedStorage:GetDescendants()) do
        if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
            table.insert(backdoors, obj)
        end
    end
    return backdoors
end

-- ==================== TOP BAR (RED) ====================
local topbar = Instance.new("ImageLabel")
topbar.Size = UDim2.new(0,300,0,48)
topbar.Position = UDim2.new(0.5,0,0,10)
topbar.AnchorPoint = Vector2.new(0.5,0)
topbar.BackgroundTransparency = 1
topbar.Image = "rbxassetid://6278672195"
topbar.ImageColor3 = Color3.fromRGB(220,20,20)
topbar.ImageTransparency = 0.1
topbar.Parent = main
Instance.new("UICorner",topbar).CornerRadius = UDim.new(1,0)

local container = Instance.new("Frame",topbar)
container.Size = UDim2.new(1,0,1,0)
container.BackgroundTransparency = 1

local layout = Instance.new("UIListLayout",container)
layout.FillDirection = Enum.FillDirection.Horizontal
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.VerticalAlignment = Enum.VerticalAlignment.Center
layout.Padding = UDim.new(0,25)

-- Button effects
local function addEffect(btn)
    local normal = btn.Size
    local hover = normal + UDim2.new(0,6,0,6)
    local click = normal + UDim2.new(0,10,0,10)
    btn.MouseEnter:Connect(function() TweenService:Create(btn,TweenInfo.new(0.2),{Size=hover}):Play() end)
    btn.MouseLeave:Connect(function() TweenService:Create(btn,TweenInfo.new(0.2),{Size=normal}):Play() end)
    btn.Activated:Connect(function()
        TweenService:Create(btn,TweenInfo.new(0.1),{Size=click}):Play()
        task.wait(0.1)
        TweenService:Create(btn,TweenInfo.new(0.2),{Size=normal}):Play()
    end)
end

local function makeBtn(id,col)
    local b = Instance.new("ImageButton")
    b.Size = UDim2.new(0,40,0,40)
    b.BackgroundTransparency = 1
    b.Image = "rbxassetid://"..id
    b.ImageColor3 = col
    b.Parent = container
    Instance.new("UICorner",b).CornerRadius = UDim.new(1,0)
    b.Activated:Connect(playClick)
    addEffect(b)
    return b
end

local execBtn = makeBtn("114765891666260", Color3.fromRGB(255,30,30))
local iyBtn = Instance.new("TextButton",container)
iyBtn.Size = UDim2.new(0,50,0,40)
iyBtn.BackgroundTransparency = 1
iyBtn.Text = "IY"
iyBtn.TextColor3 = Color3.fromRGB(255,0,0)
iyBtn.Font = Enum.Font.GothamBold
iyBtn.TextSize = 22
Instance.new("UICorner",iyBtn).CornerRadius = UDim.new(1,0)
iyBtn.Activated:Connect(function()
    playClick()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)
addEffect(iyBtn)

local speedBtn = makeBtn("92161351496486", Color3.fromRGB(255,100,100))

-- ==================== PANEL TOGGLE ====================
local currentPanel = nil
local function togglePanel(btn, panel)
    if currentPanel == panel then
        local pos = btn.AbsolutePosition
        local tween = TweenService:Create(panel,TweenInfo.new(0.5,Enum.EasingStyle.Quint),{
            Size = UDim2.new(0,40,0,40),
            Position = UDim2.fromOffset(pos.X+20,pos.Y+54)
        })
        tween:Play()
        tween.Completed:Wait()
        panel.Visible = false
        currentPanel = nil
    else
        if currentPanel then currentPanel.Visible = false end
        currentPanel = panel
        local pos = btn.AbsolutePosition
        panel.Position = UDim2.fromOffset(pos.X+20,pos.Y+54)
        panel.Size = UDim2.new(0,40,0,40)
        panel.Visible = true
        TweenService:Create(panel,TweenInfo.new(0.6,Enum.EasingStyle.Quint),{
            Size = UDim2.new(0,222,0,270),
            Position = UDim2.new(0.5,-111,0,70)
        }):Play()
    end
end

-- ==================== EXECUTOR PANEL ====================
local execPanel = Instance.new("ImageLabel")
execPanel.Size = UDim2.new(0,222,0,270)
execPanel.BackgroundTransparency = 1
execPanel.Image = "rbxassetid://6278672195"
execPanel.ImageColor3 = Color3.fromRGB(180,0,0)
execPanel.ImageTransparency = 0.1
execPanel.Visible = false
execPanel.ClipsDescendants = true
execPanel.Parent = main
Instance.new("UICorner",execPanel).CornerRadius = UDim.new(0,9)

local titleBar = Instance.new("Frame", execPanel)
titleBar.Size = UDim2.new(1,0,0,35)
titleBar.BackgroundColor3 = Color3.fromRGB(200,0,0)
titleBar.BackgroundTransparency = 0.2
Instance.new("UICorner", titleBar).CornerRadius = UDim.new(0,9)

local titleText = Instance.new("TextLabel", titleBar)
titleText.Size = UDim2.new(1,0,1,0)
titleText.BackgroundTransparency = 1
titleText.Text = "gg executor"
titleText.TextColor3 = Color3.new(1,1,1)
titleText.Font = Enum.Font.GothamBold
titleText.TextSize = 20

local scriptBox = Instance.new("TextBox",execPanel)
scriptBox.Size = UDim2.new(1,-20,1,-115)
scriptBox.Position = UDim2.new(0,10,0,45)
scriptBox.BackgroundColor3 = Color3.new(0,0,0)
scriptBox.BackgroundTransparency = 0.2
scriptBox.TextColor3 = Color3.new(1,1,1)
scriptBox.PlaceholderText = "Enter script here..."
scriptBox.MultiLine = true
scriptBox.TextWrapped = true
scriptBox.Font = Enum.Font.Code
scriptBox.TextSize = 14
Instance.new("UICorner",scriptBox).CornerRadius = UDim.new(0,9)

local executeBtn = Instance.new("TextButton",execPanel)
executeBtn.Size = UDim2.new(0.3,-8,0,35)
executeBtn.Position = UDim2.new(0,12,1,-50)
executeBtn.BackgroundColor3 = Color3.fromRGB(200,0,0)
executeBtn.BackgroundTransparency = 0.2
executeBtn.Text = "Execute"
executeBtn.TextColor3 = Color3.new(1,1,1)
executeBtn.Font = Enum.Font.GothamBold
executeBtn.TextSize = 16
Instance.new("UICorner",executeBtn).CornerRadius = UDim.new(0,9)
executeBtn.Activated:Connect(function()
    playExec()
    if scriptBox.Text ~= "" then
        local success, err = pcall(function() loadstring(scriptBox.Text)() end)
        if success then sendNotification("gg executor", "Executed", 4)
        else sendNotification("gg executor", "Error: "..tostring(err), 5) end
    end
end)

local ssExecuteBtn = Instance.new("TextButton",execPanel)
ssExecuteBtn.Size = UDim2.new(0.3,-8,0,35)
ssExecuteBtn.Position = UDim2.new(0.35,0,1,-50)
ssExecuteBtn.BackgroundColor3 = Color3.fromRGB(255,50,50)
ssExecuteBtn.BackgroundTransparency = 0.2
ssExecuteBtn.Text = "SS Execute"
ssExecuteBtn.TextColor3 = Color3.new(1,1,1)
ssExecuteBtn.Font = Enum.Font.GothamBold
ssExecuteBtn.TextSize = 12
Instance.new("UICorner",ssExecuteBtn).CornerRadius = UDim.new(0,9)
ssExecuteBtn.Activated:Connect(function()
    playExec()
    local code = scriptBox.Text
    if code == "" then return end

    local lsSuccess, lsErr = pcall(function() loadstring(code)() end)
    if lsSuccess then sendNotification("gg executor", "loadstring ok", 4) end

    local backdoors = scanForBackdoors()
    if #backdoors > 0 then
        for _, bd in ipairs(backdoors) do
            pcall(function()
                if bd:IsA("RemoteEvent") then bd:FireServer(code)
                elseif bd:IsA("RemoteFunction") then bd:InvokeServer(code) end
            end)
        end
        sendNotification("gg executor", "SS sent to "..#backdoors.." backdoors", 4)
    else
        sendNotification("gg executor", "No backdoors", 5)
    end
end)

local clearBtn = Instance.new("TextButton",execPanel)
clearBtn.Size = UDim2.new(0.3,-8,0,35)
clearBtn.Position = UDim2.new(0.7,0,1,-50)
clearBtn.BackgroundColor3 = Color3.fromRGB(150,0,0)
clearBtn.BackgroundTransparency = 0.2
clearBtn.Text = "Clear"
clearBtn.TextColor3 = Color3.new(1,1,1)
clearBtn.Font = Enum.Font.GothamBold
clearBtn.TextSize = 16
Instance.new("UICorner",clearBtn).CornerRadius = UDim.new(0,9)
clearBtn.Activated:Connect(function()
    playClick()
    scriptBox.Text = ""
end)

execBtn.Activated:Connect(function() togglePanel(execBtn, execPanel) end)

-- ==================== SPEED BUSTERS PANEL ====================
local speedPanel = Instance.new("ImageLabel")
speedPanel.Size = UDim2.new(0,222,0,270)
speedPanel.BackgroundTransparency = 1
speedPanel.Image = "rbxassetid://6278672195"
speedPanel.ImageColor3 = Color3.fromRGB(180,0,0)
speedPanel.ImageTransparency = 0.1
speedPanel.Visible = false
speedPanel.ClipsDescendants = true
speedPanel.Parent = main
Instance.new("UICorner",speedPanel).CornerRadius = UDim.new(0,9)

local speedTitle = Instance.new("Frame", speedPanel)
speedTitle.Size = UDim2.new(1,0,0,35)
speedTitle.BackgroundColor3 = Color3.fromRGB(200,0,0)
speedTitle.BackgroundTransparency = 0.2
Instance.new("UICorner", speedTitle).CornerRadius = UDim.new(0,9)

local speedTitleText = Instance.new("TextLabel", speedTitle)
speedTitleText.Size = UDim2.new(1,0,1,0)
speedTitleText.BackgroundTransparency = 1
speedTitleText.Text = "Speed Busters"
speedTitleText.TextColor3 = Color3.new(1,1,1)
speedTitleText.Font = Enum.Font.GothamBold
speedTitleText.TextSize = 20

-- WalkSpeed
local wsLabel = Instance.new("TextLabel", speedPanel)
wsLabel.Size = UDim2.new(1,-20,0,30)
wsLabel.Position = UDim2.new(0,10,0,45)
wsLabel.BackgroundTransparency = 1
wsLabel.Text = "WalkSpeed: 16"
wsLabel.TextColor3 = Color3.new(1,1,1)
wsLabel.Font = Enum.Font.Gotham
wsLabel.TextSize = 16
wsLabel.TextXAlignment = Enum.TextXAlignment.Left

local wsBox = Instance.new("TextBox", speedPanel)
wsBox.Size = UDim2.new(1,-40,0,35)
wsBox.Position = UDim2.new(0,20,0,75)
wsBox.BackgroundColor3 = Color3.new(0,0,0)
wsBox.BackgroundTransparency = 0.3
wsBox.Text = "16"
wsBox.TextColor3 = Color3.new(1,1,1)
wsBox.Font = Enum.Font.Code
wsBox.TextSize = 18
Instance.new("UICorner",wsBox).CornerRadius = UDim.new(0,8)

-- JumpPower
local jpLabel = Instance.new("TextLabel", speedPanel)
jpLabel.Size = UDim2.new(1,-20,0,30)
jpLabel.Position = UDim2.new(0,10,0,120)
jpLabel.BackgroundTransparency = 1
jpLabel.Text = "JumpPower: 50"
jpLabel.TextColor3 = Color3.new(1,1,1)
jpLabel.Font = Enum.Font.Gotham
jpLabel.TextSize = 16
jpLabel.TextXAlignment = Enum.TextXAlignment.Left

local jpBox = Instance.new("TextBox", speedPanel)
jpBox.Size = UDim2.new(1,-40,0,35)
jpBox.Position = UDim2.new(0,20,0,150)
jpBox.BackgroundColor3 = Color3.new(0,0,0)
jpBox.BackgroundTransparency = 0.3
jpBox.Text = "50"
jpBox.TextColor3 = Color3.new(1,1,1)
jpBox.Font = Enum.Font.Code
jpBox.TextSize = 18
Instance.new("UICorner",jpBox).CornerRadius = UDim.new(0,8)

-- Функция применения (молча)
local function applySpeed()
    local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
    if humanoid then
        local ws = tonumber(wsBox.Text) or 16
        local jp = tonumber(jpBox.Text) or 50
        humanoid.WalkSpeed = ws
        humanoid.JumpPower = jp
        wsLabel.Text = "WalkSpeed: " .. ws
        jpLabel.Text = "JumpPower: " .. jp
    end
end

-- Авто-применение при Enter (без уведомлений)
wsBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        applySpeed()
    end
end)

jpBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        applySpeed()
    end
end)

-- Кнопка Boost (без уведомления)
local boostBtn = Instance.new("TextButton", speedPanel)
boostBtn.Size = UDim2.new(0.9,0,0,40)
boostBtn.Position = UDim2.new(0.05,0,1,-50)
boostBtn.BackgroundColor3 = Color3.fromRGB(255,30,30)
boostBtn.BackgroundTransparency = 0.2
boostBtn.Text = "Boost"
boostBtn.TextColor3 = Color3.new(1,1,1)
boostBtn.Font = Enum.Font.GothamBold
boostBtn.TextSize = 24
Instance.new("UICorner",boostBtn).CornerRadius = UDim.new(0,9)
boostBtn.Activated:Connect(function()
    playExec()
    applySpeed()
end)

speedBtn.Activated:Connect(function() togglePanel(speedBtn, speedPanel) end)

print("gg executor – Full version with silent Speed Busters Boost! Ready!")
