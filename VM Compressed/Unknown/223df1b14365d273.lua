-------Credit: By DuyVn if u change or Reup Not write cre i will Report!-------

local Player = game.Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local PlayerGui = Player:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")


local BACKGROUND_ID = "5191098772"
local CORRECT_KEY = "DuyVnPcHub2026" 
local KEY_LINK = "https://linkvertise.com/2990563/rNDfud1Y3Shs?osharing=" 

if PlayerGui:FindFirstChild("DuyVn_ModernHub") then PlayerGui.DuyVn_ModernHub:Destroy() end

local sg = Instance.new("ScreenGui")
sg.Name = "DuyVn_ModernHub"
sg.ResetOnSpawn = false
sg.Parent = PlayerGui

local keyFrame = Instance.new("Frame")
keyFrame.Name = "KeyFrame"
keyFrame.Size = UDim2.new(0, 300, 0, 200)
keyFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
keyFrame.BackgroundTransparency = 0.1 
keyFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
keyFrame.BorderSizePixel = 0
keyFrame.Active = true 
keyFrame.Parent = sg

Instance.new("UICorner", keyFrame).CornerRadius = UDim.new(0, 10)
local keyStroke = Instance.new("UIStroke", keyFrame)
keyStroke.Color = Color3.fromRGB(0, 255, 200)
keyStroke.Thickness = 2

local keyTitle = Instance.new("TextLabel")
keyTitle.Size = UDim2.new(1, 0, 0, 40)
keyTitle.Text = "🔑 KEY SYSTEM | DuyVnPc Hub 🔑"
keyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
keyTitle.Font = Enum.Font.GothamBold
keyTitle.BackgroundTransparency = 1
keyTitle.Parent = keyFrame

local keyInput = Instance.new("TextBox")
keyInput.Size = UDim2.new(0.8, 0, 0, 35)
keyInput.Position = UDim2.new(0.1, 0, 0.3, 0)
keyInput.PlaceholderText = "Enter Key Here..."
keyInput.Text = ""
keyInput.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
keyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
keyInput.Parent = keyFrame
Instance.new("UICorner", keyInput)

local checkBtn = Instance.new("TextButton")
checkBtn.Size = UDim2.new(0.35, 0, 0, 35)
checkBtn.Position = UDim2.new(0.1, 0, 0.6, 0)
checkBtn.Text = "Check Key"
checkBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 200)
checkBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
checkBtn.Font = Enum.Font.GothamBold
checkBtn.Parent = keyFrame
Instance.new("UICorner", checkBtn)

local getBtn = Instance.new("TextButton")
getBtn.Size = UDim2.new(0.35, 0, 0, 35)
getBtn.Position = UDim2.new(0.55, 0, 0.6, 0)
getBtn.Text = "Get Key"
getBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
getBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
getBtn.Parent = keyFrame
Instance.new("UICorner", getBtn)

local main = Instance.new("Frame")
main.Name = "MainFrame"
main.Size = UDim2.new(0, 480, 0, 320)
main.Position = UDim2.new(0.5, -240, 0.5, -160)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
main.Visible = false 
main.BorderSizePixel = 0
main.ClipsDescendants = true
main.Active = true
main.Parent = sg

Instance.new("UICorner", main).CornerRadius = UDim.new(0, 10)
local mainStroke = Instance.new("UIStroke", main)
mainStroke.Color = Color3.fromRGB(45, 45, 45)
mainStroke.Thickness = 1.5

local bg = Instance.new("ImageLabel")
bg.Parent = main
bg.Size = UDim2.new(1, 0, 1, 0)
bg.Position = UDim2.new(0, 0, -1, 0)
bg.BackgroundTransparency = 1
bg.ZIndex = 0
bg.Image = "rbxassetid://" .. BACKGROUND_ID:gsub("%D", "")
bg.ImageColor3 = Color3.fromRGB(180, 180, 180)

local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 40)
topBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
topBar.BackgroundTransparency = 0.5
topBar.ZIndex = 2
topBar.Parent = main

local title = Instance.new("TextLabel")
title.Text = "☄ DuyVnPc Hub ☄"
title.Size = UDim2.new(0.5, 0, 1, 0)
title.Position = UDim2.new(0, 15, 0, 0)
title.TextColor3 = Color3.fromRGB(0, 255, 200)
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextXAlignment = Enum.TextXAlignment.Left
title.BackgroundTransparency = 1
title.ZIndex = 3
title.Parent = topBar

local buttonContainer = Instance.new("Frame")
buttonContainer.Size = UDim2.new(0, 120, 1, 0)
buttonContainer.Position = UDim2.new(1, -125, 0, 0)
buttonContainer.BackgroundTransparency = 1
buttonContainer.ZIndex = 4
buttonContainer.Parent = topBar

local layout = Instance.new("UIListLayout", buttonContainer)
layout.FillDirection = Enum.FillDirection.Horizontal
layout.HorizontalAlignment = Enum.HorizontalAlignment.Right
layout.VerticalAlignment = Enum.VerticalAlignment.Center
layout.Padding = UDim.new(0, 5)

local function createQuickBtn(text, color, fn)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0, 30, 0, 30)
    b.BackgroundColor3 = color
    b.Text = text
    b.TextColor3 = Color3.fromRGB(255,255,255)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 14
    b.Parent = buttonContainer
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
    b.MouseButton1Click:Connect(fn)
    return b
end

local normalSize = UDim2.new(0, 480, 0, 320)
local isMinimized = false

createQuickBtn("X", Color3.fromRGB(200, 50, 50), function()
    sg:Destroy()
end)

local minBtn = createQuickBtn("-", Color3.fromRGB(60, 60, 60), function()
    isMinimized = not isMinimized
    if isMinimized then
        TweenService:Create(main, TweenInfo.new(0.3), {Size = UDim2.new(0, 480, 0, 40)}):Play()
    else
        TweenService:Create(main, TweenInfo.new(0.3), {Size = normalSize}):Play()
    end
end)

local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 120, 1, -40)
sidebar.Position = UDim2.new(0, 0, 0, 40)
sidebar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
sidebar.BackgroundTransparency = 0.7
sidebar.ZIndex = 2
sidebar.Parent = main

local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -135, 1, -55)
scroll.Position = UDim2.new(0, 128, 0, 48)
scroll.BackgroundTransparency = 1
scroll.BorderSizePixel = 0
scroll.ScrollBarThickness = 2
scroll.ScrollBarImageColor3 = Color3.fromRGB(0, 255, 200)
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scroll.ZIndex = 3
scroll.Parent = main

local grid = Instance.new("UIListLayout", scroll)
grid.Padding = UDim.new(0, 8)

local function makeDraggable(frame)
    local dragging, dragInput, dragStart, startPos
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true; dragStart = input.Position; startPos = frame.Position
            input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

makeDraggable(main)
makeDraggable(keyFrame)

local function createScriptButton(name, icon, fn)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -5, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    btn.BackgroundTransparency = 0.4
    btn.Text = "  " .. icon .. "  " .. name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamMedium
    btn.TextSize = 13
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.ZIndex = 4
    btn.Parent = scroll
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    btn.MouseButton1Click:Connect(fn)
end

checkBtn.MouseButton1Click:Connect(function()
    if keyInput.Text == CORRECT_KEY then
        
        local fadeOut = TweenService:Create(keyFrame, TweenInfo.new(0.4), {
            Position = UDim2.new(0.5, -150, 0.55, -100), 
            BackgroundTransparency = 1
        })
        fadeOut:Play()
        
        task.wait(0.4)
        keyFrame.Visible = false
        main.Visible = true 
        
        
        local scrollDown = TweenService:Create(bg, TweenInfo.new(0.7, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Position = UDim2.new(0, 0, 0, 0)
        })
        scrollDown:Play()
    else
        keyInput.Text = ""
        keyInput.PlaceholderText = "WRONG KEY!"
        keyStroke.Color = Color3.fromRGB(255, 0, 0) 
        task.wait(1)
        keyStroke.Color = Color3.fromRGB(0, 255, 200)
        keyInput.PlaceholderText = "Enter Key Here..."
    end
end)

getBtn.MouseButton1Click:Connect(function()
    if setclipboard then 
        setclipboard(KEY_LINK) 
        getBtn.Text = "Copied!" 
        task.wait(2) 
        getBtn.Text = "Get Key" 
    end
end)

createScriptButton("Infinite Yield", "🌐", function() loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))() end)
createScriptButton("Hitbox", "🛡", function() loadstring(game:HttpGet("https://pastefy.app/OHPp2NXo/raw"))() end)
createScriptButton("Speed + Anti RagDoll", "✨", function() loadstring(game:HttpGet('https://pastefy.app/n8OIfdn5/raw'))() end)
createScriptButton("Alignment Keys Pc", "🔰", function() loadstring(game:HttpGet('https://pastefy.app/qKHOuEV6/raw'))() end) 
createScriptButton("Boombox Premium", "🎵", function() loadstring(game:HttpGet('https://pastefy.app/HfO4ujsr/raw'))() end)
createScriptButton("Find Id Music", "🎧", function() loadstring(game:HttpGet("https://pastefy.app/QMq7W9Jr/raw"))() end)
createScriptButton("Fps Inf cap", "🕹", function() loadstring(game:HttpGet("https://pastefy.app/YKeqbozQ/raw"))() end)
createScriptButton("Emotes Pc", "💃", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/7yd7/Hub/refs/heads/Branch/GUIS/Emotes.lua"))() end)
createScriptButton("Keystrokeys Pc", "🎮", function() loadstring(game:HttpGet("https://github.com/TheXploiterYT/scripts/raw/main/keystrokes",true))() end)
createScriptButton("DUELS] Murderers VS Sheriffs", "[❄️", function() loadstring(game:HttpGet("https://pastefy.app/lqcSFA4O/raw"))() end)
createScriptButton("EscapeStunami for Memes", "🗿", function() loadstring(game:HttpGet('https://pastefy.app/eakKbICM/raw'))() end)
createScriptButton("EscapeStunami for Brainrot", "💦", function() loadstring(game:HttpGet('https://pastefy.app/bk1tLIdI/raw'))() end)
createScriptButton("EscapeStunami for Lucky block", "🎁", function() loadstring(game:HttpGet('https://pastefy.app/Ls4c8AED/raw'))() end)
createScriptButton("Meme Seas Teleport", "🌊", function() loadstring(game:HttpGet('https://pastefy.app/wRFSYEMW/raw'))() end)
createScriptButton("Break your Friends", "🦴", function() loadstring(game:HttpGet('https://pastefy.app/vEn85QpL/raw'))() end)
createScriptButton("Blade sword", "⚔", function() loadstring(game:HttpGet('https://pastefy.app/w0FSBfoE/raw'))() end)
createScriptButton("Evade Farm", "🏃‍♂️🎄", function() loadstring(game:HttpGet('https://pastefy.app/jyOHSOPj/raw'))() end)
createScriptButton("Zombie Obby", "🧟‍♂️", function() loadstring(game:HttpGet('https://pastefy.app/FCj0ROEL/raw'))() end)
createScriptButton("My Singing Garden", "🎤", function() loadstring(game:HttpGet('https://pastefy.app/HGnMhiyk/raw'))() end)
createScriptButton("Hanto! (Nextbot Survival)", "👻", function() loadstring(game:HttpGet('https://pastefy.app/nlF8y7Bd/raw'))() end)
createScriptButton("UPD] Sword Fishing", "[🤺", function() loadstring(game:HttpGet('https://pastefy.app/v4UK7fEz/raw'))() end)

