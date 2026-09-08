-- EPIC TUBERS93 GUI V1.1 by Tubers93
local gui = Instance.new("ScreenGui")
gui.Name = "Tubers93FEUniversal"
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false

-- Main Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 280, 0, 360)
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = gui
-- Lightning FX Layer on Frame
local lightningFX = Instance.new("Frame")
lightningFX.Size = UDim2.new(1, 0, 1, 0)
lightningFX.Position = UDim2.new(0, 0, 0, 0)
lightningFX.BackgroundTransparency = 1
lightningFX.ZIndex = frame.ZIndex + 1
lightningFX.Parent = frame

-- Lightning Animation Loop
spawn(function()
    while true do
        local bolt = Instance.new("Frame")
        bolt.Size = UDim2.new(0, math.random(40, 80), 0, 2)
        bolt.Position = UDim2.new(math.random(), 0, math.random(), 0)
        bolt.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        bolt.BorderSizePixel = 0
        bolt.Rotation = math.random(-60, 60)
        bolt.ZIndex = lightningFX.ZIndex + 1
        bolt.Parent = lightningFX

        spawn(function()
            for i = 1, 10 do
                bolt.BackgroundTransparency = i * 0.1
                wait(0.01)
            end
            bolt:Destroy()
        end)

        wait(math.random(0.1, 0.3))
    end
end)
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

-- RGB Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "EPIC TUBERS93 GUI V1.1"
title.Font = Enum.Font.SourceSansBold
title.TextSize = 20
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 0, 0)
title.Parent = frame

spawn(function()
    while true do
        for i = 0, 255, 5 do
            title.TextColor3 = Color3.fromRGB(i, 255 - i, math.abs(128 - i))
            wait(0.05)
        end
    end
end)

-- Tralala Sound
local sound = Instance.new("Sound", frame)
sound.SoundId = "rbxassetid://105044304109159"
sound.Volume = 1

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
    sound:Play()
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
    while true do
        for i = 0, 255, 5 do
            encore.BackgroundColor3 = Color3.fromRGB(i, 255 - i, math.abs(128 - i))
            wait(0.05)
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

-- TRALALA ULTIMATE 🌈 Button
local ultimateBtn = Instance.new("TextButton")
ultimateBtn.Size = UDim2.new(1, 0, 0, 40)
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
    while true do
        ultimateBtn.BackgroundColor3 = Color3.fromRGB(math.random(0,255), math.random(0,255), math.random(0,255))
        wait(0.02)
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
ultimateBtn.MouseButton1Click:Connect(function()
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
        frame.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
        frame.Rotation = 0
        ultimateSound:Stop()
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
    button.BackgroundColor3 = Color3.fromRGB(0, 160, 0)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.SourceSansBold
    button.TextSize = 18
    button.Parent = scroll
    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 12)
    button.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet(data.url))()
    end)
end

-- Click TP Tool Button
local clickTPBtn = Instance.new("TextButton")
clickTPBtn.Size = UDim2.new(1, 0, 0, 40)
clickTPBtn.Text = "Click TP Tool"
clickTPBtn.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
clickTPBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
clickTPBtn.Font = Enum.Font.SourceSansBold
clickTPBtn.TextSize = 18
clickTPBtn.Parent = scroll
Instance.new("UICorner", clickTPBtn).CornerRadius = UDim.new(0, 12)

clickTPBtn.MouseButton1Click:Connect(function()
    local tool = Instance.new("Tool")
    tool.Name = "ClickTP"
    tool.RequiresHandle = false
    tool.CanBeDropped = false

    local mouse = game.Players.LocalPlayer:GetMouse()
    tool.Activated:Connect(function()
        local char = game.Players.LocalPlayer.Character
        if char then
            local pos = mouse.Hit.Position
            char:MoveTo(pos + Vector3.new(0, 5, 0))
        end
    end)

    tool.Parent = game.Players.LocalPlayer.Backpack
end)
