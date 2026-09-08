-- [[ سكربت من صنع مهند ]] --
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Players = game:GetService("Players")
local SoundService = game:GetService("SoundService")
local VirtualUser = game:GetService("VirtualUser")
local Lighting = game:GetService("Lighting")

-- [1. شاشة الترحيب]
local function ShowWelcomeScreen()
    local WelcomeGui = Instance.new("ScreenGui", game.CoreGui)
    local TextLabel = Instance.new("TextLabel")
    TextLabel.Parent = WelcomeGui
    TextLabel.Size = UDim2.new(1, 0, 1, 0)
    TextLabel.BackgroundTransparency = 1 
    TextLabel.Text = "" 
    TextLabel.TextColor3 = Color3.fromRGB(255, 105, 180) 
    TextLabel.TextSize = 45
    TextLabel.Font = Enum.Font.GothamBold
    TextLabel.TextStrokeTransparency = 0.5
    local fullText = "نووووووووورتي عزيزتي فاطمة 💐"
    task.spawn(function()
        for i = 1, #fullText do
            TextLabel.Text = string.sub(fullText, 1, i)
            task.wait(0.08)
        end
        task.wait(2) 
        WelcomeGui:Destroy()
    end)
end
ShowWelcomeScreen()

-- [2. الواجهة الأساسية]
local Window = Fluent:CreateWindow({
    Title = "من صنع مهند", 
    SubTitle = "",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false, 
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- [3. وظيفة الإشعارات]
local function RobloxNotify(title, msg)
    local NotifyFrame = Instance.new("Frame", game.CoreGui:FindFirstChild("MainCircle") or Instance.new("ScreenGui", game.CoreGui))
    NotifyFrame.Size = UDim2.new(0, 280, 0, 70)
    NotifyFrame.Position = UDim2.new(0.5, -140, 1, 10)
    NotifyFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Instance.new("UICorner", NotifyFrame)
    Instance.new("UIStroke", NotifyFrame).Color = Color3.fromRGB(255, 0, 0)
    local Txt = Instance.new("TextLabel", NotifyFrame)
    Txt.Size = UDim2.new(1, 0, 1, 0)
    Txt.Text = title.."\n"..msg
    Txt.TextColor3 = Color3.fromRGB(255, 255, 255)
    Txt.BackgroundTransparency = 1
    Txt.Font = Enum.Font.GothamBold
    Txt.TextSize = 14
    NotifyFrame:TweenPosition(UDim2.new(0.5, -140, 0.85, 0), "Out", "Back", 0.5)
    task.wait(3)
    NotifyFrame:TweenPosition(UDim2.new(0.5, -140, 1, 100), "In", "Quad", 0.5)
    task.delay(0.6, function() NotifyFrame:Destroy() end)
end

-- [4. الدوائر العائمة]
local MainCircleGui = Instance.new("ScreenGui", game.CoreGui)
MainCircleGui.Name = "MainCircle"
local FloatingButton = Instance.new("TextButton", MainCircleGui)
FloatingButton.Size = UDim2.new(0, 75, 0, 75)
FloatingButton.Position = UDim2.new(0.05, 0, 0.4, 0)
FloatingButton.Text = "PRIVATE"
FloatingButton.BackgroundColor3 = Color3.fromRGB(150, 0, 255)
Instance.new("UICorner", FloatingButton).CornerRadius = UDim.new(1, 0)
FloatingButton.Draggable = true
FloatingButton.MouseButton1Click:Connect(function() Window:Minimize() end)

local SamalaGui = Instance.new("ScreenGui", game.CoreGui)
SamalaGui.Enabled = false 
local MainFrame = Instance.new("Frame", SamalaGui)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MainFrame.Size = UDim2.new(0, 280, 0, 450)
MainFrame.Position = UDim2.new(0.7, 0, 0.2, 0)
MainFrame.Active = true
MainFrame.Draggable = true
Instance.new("UICorner", MainFrame)
Instance.new("UIStroke", MainFrame).Color = Color3.fromRGB(255, 0, 0)
local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Text = "قائمة الصمله"
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.Font = Enum.Font.GothamBold
Title.BackgroundTransparency = 1
local VictimInput = Instance.new("TextBox", MainFrame)
VictimInput.Position = UDim2.new(0.1, 0, 0.15, 0)
VictimInput.Size = UDim2.new(0.8, 0, 0, 45)
VictimInput.PlaceholderText = "اسم الضحية..."
VictimInput.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
VictimInput.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", VictimInput)
local ActLabel = Instance.new("TextLabel", MainFrame)
ActLabel.Position = UDim2.new(0.1, 0, 0.3, 0)
ActLabel.Size = UDim2.new(0.8, 0, 0, 60)
ActLabel.BackgroundColor3 = Color3.fromRGB(45, 0, 0)
ActLabel.Text = "توقيت التفعيل\n00:00:00"
ActLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", ActLabel)
local UptimeLabel = Instance.new("TextLabel", MainFrame)
UptimeLabel.Position = UDim2.new(0.1, 0, 0.5, 0)
UptimeLabel.Size = UDim2.new(0.8, 0, 0, 60)
UptimeLabel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
UptimeLabel.Text = "مدة تشغيلك\n00:00:00"
UptimeLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
Instance.new("UICorner", UptimeLabel)

local SamalaToggleButton = Instance.new("TextButton", MainCircleGui)
SamalaToggleButton.Size = UDim2.new(0, 75, 0, 75)
SamalaToggleButton.Position = UDim2.new(0.05, 0, 0.55, 0)
SamalaToggleButton.Text = "الصمله"
SamalaToggleButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
SamalaToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SamalaToggleButton.Visible = false 
Instance.new("UICorner", SamalaToggleButton).CornerRadius = UDim.new(1, 0)
SamalaToggleButton.Draggable = true
SamalaToggleButton.MouseButton1Click:Connect(function() SamalaGui.Enabled = not SamalaGui.Enabled end)

-- [5. منطق العدادات]
local target = ""
local isTargetPresent = false
local startT = tick()
local actT = 0
local function fmt(s)
    return string.format("%02d:%02d:%02d", math.floor(s/3600), math.floor((s%3600)/60), s%60)
end
VictimInput:GetPropertyChangedSignal("Text"):Connect(function()
    local input = VictimInput.Text:lower()
    if #input >= 2 then
        for _, p in pairs(Players:GetPlayers()) do
            if p.Name:lower():sub(1, #input) == input then
                target = p.Name
                isTargetPresent = true
                actT = 0
                VictimInput.Text = p.Name
            end
        end
    end
end)
task.spawn(function()
    while task.wait(1) do
        UptimeLabel.Text = "مدة تشغيلك\n"..fmt(math.floor(tick()-startT))
        if target ~= "" and isTargetPresent then
            actT = actT + 1
            ActLabel.Text = "توقيت التفعيل\n"..fmt(actT)
        end
    end
end)
Players.PlayerRemoving:Connect(function(player)
    if target ~= "" and player.Name == target then
        isTargetPresent = false
        local sids = {"rbxassetid://9061030424", "rbxassetid://138090596"}
        for _, id in pairs(sids) do
            local s = Instance.new("Sound", SoundService)
            s.SoundId = id s.Volume = 10 s:Play()
            task.delay(5, function() s:Destroy() end)
        end
    end
end)

-- [6. المفتاح والتبويبات]
local Tabs = { KeySystem = Window:AddTab({ Title = "نظام المفتاح", Icon = "key" }) }
local function UnlockAndClean()
    Tabs.Main = Window:AddTab({ Title = "سكربتات تفيدك", Icon = "box" })
    Tabs.SamalaTab = Window:AddTab({ Title = "الصمله", Icon = "flame" })
    Tabs.Safety = Window:AddTab({ Title = "اضمن سلامتك", Icon = "shield" })
    
    Tabs.Main:AddButton({
        Title = "Infinity Yield",
        Callback = function() loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))() end
    })
    Tabs.Main:AddButton({
        Title = "Nokia Hub",
        Callback = function() loadstring(game:HttpGet('https://raw.githubusercontent.com/Ndora1/Ndora1/main/Nokia%20Hub.lua'))() end
    })
    Tabs.Main:AddButton({
        Title = "تفعيل الجودة العالية (RTX)",
        Callback = function()
            local Bloom = Instance.new("BloomEffect", Lighting)
            Bloom.Intensity = 1
            Lighting.Brightness = 2
        end
    })
    Tabs.Safety:AddToggle("AntiLag", {Title = "مضاد التعليق (Anti-Lag)", Default = false})
    Tabs.SamalaTab:AddButton({
        Title = "من صنع مهند",
        Callback = function() 
            SamalaGui.Enabled = true 
            SamalaToggleButton.Visible = true 
        end
    })
    RobloxNotify("نورتي", "نووووووووورتي عزيزتي فاطمة 💐")
    for i, v in pairs(Window.Tabs) do if v.Title == "نظام المفتاح" then v:Destroy() end end
    Window:SelectTab(1)
end
Players.LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)
Tabs.KeySystem:AddInput("KeyInput", {
    Title = "المفتاح",
    Callback = function(V) if V == "FATIMA" then UnlockAndClean() end end
})
Window:SelectTab(1)
