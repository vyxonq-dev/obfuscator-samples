-- EPIC TUBERS93 GUI V1 by Tubers93
local gui = Instance.new("ScreenGui")
gui.Name = "Tubers93FEUniversal"
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false

-- Main Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 280, 0, 360)
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = gui

local round = Instance.new("UICorner")
round.CornerRadius = UDim.new(0, 12)
round.Parent = frame

-- RGB Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "EPIC TUBERS93 GUI V1"
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

-- Tralalero Sound
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://105044304109159"
sound.Volume = 1
sound.Parent = frame

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

local tralalaRound = Instance.new("UICorner")
tralalaRound.CornerRadius = UDim.new(0, 12)
tralalaRound.Parent = tralala

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

local encoreRound = Instance.new("UICorner")
encoreRound.CornerRadius = UDim.new(0, 12)
encoreRound.Parent = encore

spawn(function()
    while true do
        for i = 0, 255, 5 do
            encore.BackgroundColor3 = Color3.fromRGB(i, 255 - i, math.abs(128 - i))
            wait(0.05)
        end
    end
end)

local soundEncore = Instance.new("Sound")
soundEncore.SoundId = "rbxassetid://118399267245064"
soundEncore.Volume = 1
soundEncore.Parent = frame

local disco = Instance.new("Frame")
disco.Size = UDim2.new(1, 0, 1, 0)
disco.Position = UDim2.new(0, 0, 0, 0)
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
            disco.BackgroundColor3 = Color3.fromRGB(
                math.random(0,255),
                math.random(0,255),
                math.random(0,255)
            )
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

-- Script Buttons
local scripts = {
    {name = "Infinite Yield", url = "https://rawscripts.net/raw/Universal-Script-Infinite-Yield-43437"},
    {name = "Nameless Admin", url = "https://rawscripts.net/raw/Universal-Script-Nameless-admin-REWORKED-43502"},
    {name = "Backdoor.exe", url = "https://raw.githubusercontent.com/iK4oS/backdoor.exe/v8/src/ui.lua"},
    {name = "XVC Hub", url = "https://rawscripts.net/raw/Universal-Script-XVC-Hub-159-Games-keyless-52467"},
    {name = "Roblox Egor Script", url = "https://rawscripts.net/raw/Universal-Script-Roblox-Egor-Script-49040"},
    {name = "0 Gravity Trip FE", url = "https://rawscripts.net/raw/Universal-Script-0-Gravity-Trip-FE-35632"},
    {name = "Tiger X", url = "https://rawscripts.net/raw/Brookhaven-RP-Tiger-X-39488"},
    {name = "XP Backdoor Scanner", url = "https://rawscripts.net/raw/Universal-Script-XP-Backdoor-Scanner-51591"},
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

    local buttonRound = Instance.new("UICorner")
    buttonRound.CornerRadius = UDim.new(0, 12)
    buttonRound.Parent = button

    button.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet(data.url))()
    end)
end

layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    scroll.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y)
end)