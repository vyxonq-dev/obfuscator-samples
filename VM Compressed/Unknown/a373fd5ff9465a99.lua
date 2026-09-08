-- EPIC TUBERS93 GUI V1.2 by Tubers93 - FIXED
local gui = Instance.new("ScreenGui")
gui.Name = "Tubers93FEUniversal"
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false
-- Theme Management
local theme = {
    color = Color3.fromRGB(0, 120, 0), -- Default theme: Hacker Green
    lightningColor = Color3.fromRGB(0, 255, 0)
}
-- Function to lighten a color
local function lightenColor(color, amount)
    local r, g, b = color.R, color.G, color.B
    r = math.min(r + amount, 255)
    g = math.min(g + amount, 255)
    b = math.min(b + amount, 255)
    return Color3.fromRGB(r, g, b)
end
-- Main Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 280, 0, 360)
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = theme.color
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = gui
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)
-- Lightning FX Layer on Frame
local lightningFX = Instance.new("Frame")
lightningFX.Size = UDim2.new(1, 0, 1, 0)
lightningFX.Position = UDim2.new(0, 0, 0, 0)
lightningFX.BackgroundTransparency = 1
lightningFX.ZIndex = 2 -- Fixed ZIndex
lightningFX.Parent = frame
-- Lightning Animation Loop
spawn(function()
    while wait(math.random(0.1, 0.3)) do
        local bolt = Instance.new("Frame")
        bolt.Size = UDim2.new(0, math.random(40, 80), 0, 2)
        bolt.Position = UDim2.new(math.random(), 0, math.random(), 0)
        bolt.BackgroundColor3 = theme.lightningColor -- FIX: Uses theme's lightning color
        bolt.BorderSizePixel = 0
        bolt.Rotation = math.random(-60, 60)
        bolt.ZIndex = 3 -- Fixed ZIndex
        bolt.Parent = lightningFX
        for i = 1, 10 do
            bolt.BackgroundTransparency = i * 0.1
            wait(0.01)
        end
        bolt:Destroy()
    end
end)
-- RGB Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "EPIC TUBERS93 GUI V1.2"
title.Font = Enum.Font.SourceSansBold
title.TextSize = 20
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 0, 0)
title.Parent = frame
spawn(function()
    while wait(0.05) do
        for i = 0, 255, 5 do
            title.TextColor3 = Color3.fromRGB(i, 255 - i, math.abs(128 - i))
        end
    end
end)
-- Owner Credits (REMOVED IN THIS VERSION)
-- Tralala Sound
local tralalaSound = Instance.new("Sound", frame)
tralalaSound.SoundId = "rbxassetid://105044304109159"
tralalaSound.Volume = 1
-- Tralala Mode Button
local tralala = Instance.new("TextButton")
tralala.Size = UDim2.new(0, 130, 0, 40)
tralala.Position = UDim2.new(0, 10, 0, 40)
tralala.Text = "Tralala Mode"
tralala.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
tralala.TextColor3 = Color3.fromRGB(255, 255, 255)
tralala.Font = Enum.Font.SourceSansBold
tralala.TextSize = 18
tralala.Parent = frame
Instance.new("UICorner", tralala).CornerRadius = UDim.new(0, 12)
local spinning = false
tralala.MouseButton1Click:Connect(function()
    if spinning then return end
    spinning = true
    if not tralalaSound.IsPlaying then
        tralalaSound:Play()
    end
    local start = tick()
    while tick() - start < 2 do
        frame.Rotation = (tick() - start) * 720
        wait()
    end
    frame.Rotation = 0
    spinning = false
end)
-- Tralala Encore Button
local encore = Instance.new("TextButton")
encore.Size = UDim2.new(0, 130, 0, 40)
encore.Position = UDim2.new(0, 150, 0, 40)
encore.Text = "Tralala Encore"
encore.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
encore.TextColor3 = Color3.fromRGB(255, 255, 255)
encore.Font = Enum.Font.SourceSansBold
encore.TextSize = 18
encore.Parent = frame
Instance.new("UICorner", encore).CornerRadius = UDim.new(0, 12)
spawn(function()
    while wait(0.05) do
        for i = 0, 255, 5 do
            encore.BackgroundColor3 = Color3.fromRGB(i, 255 - i, math.abs(128 - i))
        end
    end
end)
local soundEncore = Instance.new("Sound", frame)
soundEncore.SoundId = "rbxassetid://118399267245064"
soundEncore.Volume = 1
local disco = Instance.new("Frame")
disco.Size = UDim2.new(2, 0, 2, 0)
disco.Position = UDim2.new(-0.5, 0, -0.5, 0)
disco.BackgroundTransparency = 0.5
disco.ZIndex = 100
disco.Visible = false
disco.Parent = gui
encore.MouseButton1Click:Connect(function()
    if not soundEncore.IsPlaying then
        soundEncore.TimePosition = 0
        soundEncore:Play()
        disco.Visible = true
        spawn(function()
            local start = tick()
            while tick() - start < 10 do
                disco.BackgroundColor3 = Color3.fromRGB(math.random(0,255), math.random(0,255), math.random(0,255))
                wait(0.05)
            end
            disco.Visible = false
        end)
        local start = tick()
        while tick() - start < 10 do
            frame.Rotation = (tick() - start) * 1440
            wait()
        end
        frame.Rotation = 0
        soundEncore:Stop()
    end
end)
-- Scrollable Script Panel
local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -20, 1, -180)
scroll.Position = UDim2.new(0, 10, 0, 90)
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.ScrollBarThickness = 8
scroll.BackgroundTransparency = 1
scroll.BorderSizePixel = 0
scroll.Parent = frame
local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 5)
layout.Parent = scroll
-- 🎨 Themes Button
local themesBtn = Instance.new("TextButton")
themesBtn.Size = UDim2.new(0, 260, 0, 40)
themesBtn.Position = UDim2.new(0, 10, 1, -50)
themesBtn.Text = "🎨 Themes"
themesBtn.Font = Enum.Font.SourceSansBold
themesBtn.TextSize = 18
themesBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
themesBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
themesBtn.ZIndex = 2
themesBtn.Parent = frame
Instance.new("UICorner", themesBtn).CornerRadius = UDim.new(0, 12)
-- 🎨 Themes Page
local themePage = Instance.new("Frame")
themePage.Size = UDim2.new(0, 280, 0, 360)
themePage.Position = UDim2.new(0.5, 0, 0.5, 0)
themePage.AnchorPoint = Vector2.new(0.5, 0.5)
themePage.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
themePage.Visible = false
themePage.ZIndex = 100
themePage.Parent = gui
Instance.new("UICorner", themePage).CornerRadius = UDim.new(0, 12)
-- 🔙 Back Button
local backBtn = Instance.new("TextButton")
backBtn.Size = UDim2.new(0, 40, 0, 40)
backBtn.Position = UDim2.new(0, 10, 0, 10)
backBtn.Text = "←"
backBtn.Font = Enum.Font.SourceSansBold
backBtn.TextSize = 24
backBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
backBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
backBtn.ZIndex = 101
backBtn.Parent = themePage
Instance.new("UICorner", backBtn).CornerRadius = UDim.new(0, 12)
backBtn.MouseButton1Click:Connect(function()
    themePage.Visible = false
end)
-- 📦 Scrollable Theme Container
local themeScroll = Instance.new("ScrollingFrame")
themeScroll.Size = UDim2.new(1, -20, 1, -60)
themeScroll.Position = UDim2.new(0, 10, 0, 60)
themeScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
themeScroll.ScrollBarThickness = 6
themeScroll.BackgroundTransparency = 1
themeScroll.BorderSizePixel = 0
themeScroll.ZIndex = 100
themeScroll.Parent = themePage
local themeLayout = Instance.new("UIListLayout")
themeLayout.Padding = UDim.new(0, 10)
themeLayout.Parent = themeScroll
themeLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    themeScroll.CanvasSize = UDim2.new(0, 0, 0, themeLayout.AbsoluteContentSize.Y)
end)
-- 🎨 Theme Buttons
local themes = {
    {name = "🟢Hacker Green🟢", color = Color3.fromRGB(0, 120, 0), lightningColor = Color3.fromRGB(0, 255, 0)},
    {name = "🔵Sky Blue🔵", color = Color3.fromRGB(0, 180, 255), lightningColor = Color3.fromRGB(0, 255, 255)},
    {name = "💕Lollipop Pink💕", color = Color3.fromRGB(255, 105, 180), lightningColor = Color3.fromRGB(255, 150, 200)}
}
for _, themeData in ipairs(themes) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -20, 0, 40)
    btn.Text = themeData.name
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 18
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.BackgroundColor3 = themeData.color
    btn.ZIndex = 101
    btn.Parent = themeScroll
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 12)
    btn.MouseButton1Click:Connect(function()
        theme.color = themeData.color
        theme.lightningColor = themeData.lightningColor
        frame.BackgroundColor3 = theme.color
        for _, scriptBtn in ipairs(scroll:GetChildren()) do
            if scriptBtn:IsA("TextButton") and scriptBtn.Name ~= "ultimateBtn" and scriptBtn.Name ~= "clickTPBtn" then
                scriptBtn.BackgroundColor3 = lightenColor(theme.color, 40)
            end
        end
        themePage.Visible = false
    end)
end
-- 🎨 Open Theme Page
themesBtn.MouseButton1Click:Connect(function()
    themePage.Visible = true
end)
-- TRALALA ULTIMATE 🌈 Button
local ultimateBtn = Instance.new("TextButton")
ultimateBtn.Size = UDim2.new(1, 0, 0, 40)
ultimateBtn.Name = "ultimateBtn"
ultimateBtn.Text = "TRALALA ULTIMATE 🌈"
ultimateBtn.TextColor3 = Color3.fromRGB(255, 0, 0)
ultimateBtn.Font = Enum.Font.SourceSansBold
ultimateBtn.TextSize = 18
ultimateBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
ultimateBtn.Position = UDim2.new(0, 10, 0, 0)
ultimateBtn.Size = UDim2.new(0, 260, 0, 40)
ultimateBtn.Parent = scroll
Instance.new("UICorner", ultimateBtn).CornerRadius = UDim.new(0, 12)
-- Fast RGB animation for button
spawn(function()
    while wait(0.02) do
        ultimateBtn.BackgroundColor3 = Color3.fromRGB(math.random(0,255), math.random(0,255), math.random(0,255))
    end
end)
-- Ultimate Sound
local ultimateSound = Instance.new("Sound", frame)
ultimateSound.SoundId = "rbxassetid://108962824917336"
ultimateSound.Volume = 1
-- Ultimate Disco Screen
local ultimateDisco = Instance.new("Frame")
ultimateDisco.Size = UDim2.new(2, 0, 2, 0)
ultimateDisco.Position = UDim2.new(-0.5, 0, -0.5, 0)
ultimateDisco.BackgroundTransparency = 0.2
ultimateDisco.ZIndex = 100
ultimateDisco.Visible = false
ultimateDisco.Parent = gui
-- TRALALA ULTIMATE 🌈 Function
local isUltimateActive = false
ultimateBtn.MouseButton1Click:Connect(function()
    if isUltimateActive then return end
    isUltimateActive = true
    ultimateSound.TimePosition = 0
    ultimateSound:Play()
    ultimateDisco.Visible = true
    -- RGB Disco Flash
    spawn(function()
        local start = tick()
        while tick() - start < 11 do
            ultimateDisco.BackgroundColor3 = Color3.fromRGB(math.random(0,255), math.random(0,255), math.random(0,255))
            wait(0.005)
        end
        ultimateDisco.Visible = false
    end)
    -- GUI Rainbow Spin
    spawn(function()
        local start = tick()
        while tick() - start < 11 do
            frame.BackgroundColor3 = Color3.fromRGB(math.random(0,255), math.random(0,255), math.random(0,255))
            frame.Rotation = (tick() - start) * 3240
            wait()
        end
        frame.BackgroundColor3 = theme.color
        frame.Rotation = 0
        ultimateSound:Stop()
        isUltimateActive = false
    end)
end)
-- Fix Scroll Canvas Resize
layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    scroll.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y)
end)
-- Script Buttons
local scripts = {
    {name = "Infinite Yield", url = "https://rawscripts.net/raw/Universal-Script-Infinite-Yield-43437"},
    {name = "Nameless Admin", url = "https://rawscripts.net/raw/Universal-Script-Nameless-admin-REWORKED-43502"},
    {name = "Backdoor.exe", url = "https://raw.githubusercontent.com/iK4oS/backdoor.exe/v8/src/ui.lua"},
    {name = "XVC Hub", url = "https://rawscripts.net/raw/Universal-Script-XVC-Hub-159-Games-keyless-52467"},
    {name = "Roblox Egor Script", url = "https://rawscripts.net/raw/Universal-Script-Roblox-Egor-Script-49040"},
    {name = "0 Gravity Trip FE", url = "https://rawscripts.net/raw/Universal-Script-0-Gravity-Trip-FE-35632"},
    {name = "Tiger X", url = "https://rawscripts.net/raw/Brookhaven-RP-Tiger-X-39488"},
}
for _, data in ipairs(scripts) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 40)
    button.Text = data.name
    button.BackgroundColor3 = lightenColor(theme.color, 40)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.SourceSansBold
    button.TextSize = 18
    button.Parent = scroll
    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 12)
    button.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet(data.url))()
    end)
end
-- Click TP Tool
local clickTPBtn = Instance.new("TextButton")
clickTPBtn.Size = UDim2.new(1, 0, 0, 40)
clickTPBtn.Name = "clickTPBtn"
clickTPBtn.Text = "Click TP Tool"
clickTPBtn.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
clickTPBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
clickTPBtn.Font = Enum.Font.SourceSansBold
clickTPBtn.TextSize = 18
clickTPBtn.Parent = scroll
Instance.new("UICorner", clickTPBtn).CornerRadius = UDim.new(0, 12)
local clickTPTool
clickTPBtn.MouseButton1Click:Connect(function()
    if not clickTPTool then
        clickTPTool = Instance.new("Tool")
        clickTPTool.Name = "ClickTP"
        clickTPTool.RequiresHandle = false
        clickTPTool.CanBeDropped = false
        local mouse = game.Players.LocalPlayer:GetMouse()
        clickTPTool.Activated:Connect(function()
            local char = game.Players.LocalPlayer.Character
            if char and mouse.Target then
                local pos = mouse.Hit.Position
                char:MoveTo(pos + Vector3.new(0, 5, 0))
            end
        end)
    end
    clickTPTool.Parent = game.Players.LocalPlayer.Backpack
end)
