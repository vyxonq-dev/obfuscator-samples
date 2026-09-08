--[[
    ScriptZone Hub Ultimate Final with Startup Notifications, Sound, Info & Settings
]]

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

-- ==============================
-- Startup Notifications & Sound
-- ==============================
local function PlayStartupSound()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://9118827317" -- Windows startup benzeri ses
    sound.Volume = 1
    sound.Parent = CoreGui
    sound:Play()
    sound.Ended:Connect(function() sound:Destroy() end)
end

local function CreateNotification(text, delayTime)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = CoreGui

    local Frame = Instance.new("Frame", ScreenGui)
    Frame.Size = UDim2.new(0, 260, 0, 45)
    Frame.Position = UDim2.new(1, -280, 0, -60)
    Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Frame.BackgroundTransparency = 0.1
    Frame.BorderSizePixel = 0

    local UICorner = Instance.new("UICorner", Frame)
    UICorner.CornerRadius = UDim.new(0, 8)

    local UIStroke = Instance.new("UIStroke", Frame)
    UIStroke.Color = Color3.fromRGB(0, 255, 200)
    UIStroke.Thickness = 1.4

    local Label = Instance.new("TextLabel", Frame)
    Label.Size = UDim2.new(1, -10, 1, 0)
    Label.Position = UDim2.new(0, 5, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.TextScaled = true
    Label.Font = Enum.Font.GothamBold

    -- Slide In Animation
    Frame:TweenPosition(UDim2.new(1, -280, 0, 20), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, 0.5, true)
    
    task.wait(delayTime)

    -- Fade Out
    for i = 0, 1, 0.05 do
        Frame.BackgroundTransparency = i
        Label.TextTransparency = i
        UIStroke.Transparency = i
        task.wait(0.03)
    end

    ScreenGui:Destroy()
end

-- Play startup sound
PlayStartupSound()

-- Show notifications in order
task.wait(0.2)
CreateNotification("✅ Script Loaded!", 2.5)
task.wait(0.5)
CreateNotification("🎨 Script GUI Made By Alxdy", 2.5)

-- ==============================
-- ScriptZone Hub GUI Başlıyor
-- ==============================

-- Create ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "ScriptZoneHub"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Global
pcall(function() if syn and syn.protect_gui then syn.protect_gui(gui) end end)
gui.Parent = CoreGui

local colors = {
    background = Color3.fromRGB(18, 18, 22),
    panel = Color3.fromRGB(24, 24, 30),
    border = Color3.fromRGB(150, 60, 255),
    accent = Color3.fromRGB(255, 60, 60),
    text = Color3.fromRGB(235, 235, 240),
}

-- Toggle button
local toggleBtn = Instance.new("TextButton")
toggleBtn.Name = "OpenClose"
toggleBtn.Size = UDim2.new(0,140,0,36)
toggleBtn.Position = UDim2.new(0.5,-70,0,2)
toggleBtn.BackgroundColor3 = colors.panel
toggleBtn.TextColor3 = colors.text
toggleBtn.Text = "ScriptZone"
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextSize = 14
toggleBtn.ZIndex = 10
toggleBtn.AutoButtonColor = false
toggleBtn.Parent = gui
do local c=Instance.new("UICorner") c.CornerRadius=UDim.new(0,8) c.Parent=toggleBtn
local s=Instance.new("UIStroke") s.Thickness=2 s.Color=colors.border s.Parent=toggleBtn end

-- Main frame
local frame = Instance.new("Frame")
frame.Name = "MainFrame"
frame.Size = UDim2.new(0,460,0,400)
frame.Position = UDim2.new(0.5,-230,0.5,-200)
frame.BackgroundColor3 = colors.background
frame.Visible = false
frame.Active = true
frame.ClipsDescendants = true
frame.ZIndex = 1
frame.Parent = gui
do local c=Instance.new("UICorner") c.CornerRadius=UDim.new(0,10) c.Parent=frame
local s=Instance.new("UIStroke") s.Thickness=2 s.Color=colors.border s.Parent=frame end

-- Dragging
local dragging=false
local dragStart,startPos
frame.InputBegan:Connect(function(input)
    if input.UserInputType==Enum.UserInputType.MouseButton1 then
        dragging=true
        dragStart=input.Position
        startPos=frame.Position
        input.Changed:Connect(function() if input.UserInputState==Enum.UserInputState.End then dragging=false end end)
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType==Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        frame.Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+delta.X,startPos.Y.Scale,startPos.Y.Offset+delta.Y)
    end
end)

-- Tabs & Pages
local tabBar=Instance.new("Frame", frame)
tabBar.Size=UDim2.new(1,-20,0,36)
tabBar.Position=UDim2.new(0,10,0,10)
tabBar.BackgroundTransparency=1
local tabLayout=Instance.new("UIListLayout", tabBar)
tabLayout.FillDirection=Enum.FillDirection.Horizontal
tabLayout.Padding=UDim.new(0,8)

local tabs = {"Main","Info","Settings"}
local pages = {}

local function makeTab(name)
    local tab=Instance.new("TextButton")
    tab.Name=name.."Tab"
    tab.Size=UDim2.new(0,100,0,32)
    tab.BackgroundColor3=colors.panel
    tab.TextColor3=colors.text
    tab.Text=name
    tab.Font=Enum.Font.Gotham
    tab.TextSize=14
    tab.AutoButtonColor=false
    local c=Instance.new("UICorner") c.CornerRadius=UDim.new(0,8) c.Parent=tab
    local s=Instance.new("UIStroke") s.Thickness=1.5 s.Color=colors.border s.Parent=tab
    return tab
end

local function makePage(name)
    local page=Instance.new("Frame")
    page.Name=name.."Page"
    page.Size=UDim2.new(1,-20,1,-60)
    page.Position=UDim2.new(0,10,0,50)
    page.BackgroundColor3=colors.panel
    page.Visible=false
    local c=Instance.new("UICorner") c.CornerRadius=UDim.new(0,10) c.Parent=page
    local s=Instance.new("UIStroke") s.Thickness=1.5 s.Color=colors.border s.Parent=page
    return page
end

for _,name in ipairs(tabs) do
    local tab = makeTab(name)
    tab.Parent = tabBar
    local page = makePage(name)
    page.Parent = frame
    pages[name] = page
    tab.MouseButton1Click:Connect(function()
        for k,v in pairs(pages) do v.Visible=(k==name) end
    end)
end
pages["Main"].Visible = true

local function addTitle(page,text)
    local label=Instance.new("TextLabel")
    label.Size=UDim2.new(1,-20,0,24)
    label.Position=UDim2.new(0,10,0,10)
    label.Text=text
    label.TextColor3=colors.text
    label.Font=Enum.Font.GothamBold
    label.TextSize=14
    label.BackgroundTransparency=1
    label.Parent=page
end

-- Başlıklar
addTitle(pages["Main"],"Main Page")
addTitle(pages["Info"],"Info Page")
addTitle(pages["Settings"],"Settings Page")

-- ==============================
-- MAIN PAGE SCRIPTS
-- ==============================
do
    local mainPage=pages["Main"]
    local y = 50

    local function createExec(label,callback)
        local lbl=Instance.new("TextLabel")
        lbl.Size=UDim2.new(0,200,0,24)
        lbl.Position=UDim2.new(0,10,0,y)
        lbl.Text=label
        lbl.TextColor3=colors.text
        lbl.Font=Enum.Font.Gotham
        lbl.TextSize=14
        lbl.BackgroundTransparency=1
        lbl.TextXAlignment=Enum.TextXAlignment.Left
        lbl.Parent=mainPage

        local btn=Instance.new("TextButton")
        btn.Size=UDim2.new(0,120,0,28)
        btn.Position=UDim2.new(1,-130,0,y)
        btn.Text="Execute"
        btn.TextColor3=Color3.fromRGB(60,255,60)
        btn.Font=Enum.Font.GothamBold
        btn.TextSize=14
        btn.BackgroundColor3=colors.panel
        btn.AutoButtonColor=false
        btn.Parent=mainPage
        local c=Instance.new("UICorner") c.CornerRadius=UDim.new(0,6) c.Parent=btn
        local s=Instance.new("UIStroke") s.Color=Color3.fromRGB(60,255,60) s.Parent=btn

        btn.MouseButton1Click:Connect(callback)
        y = y + 40
    end

    createExec("Ajdar FlyHub",function()
        loadstring(game:HttpGet("https://gist.githubusercontent.com/berat9792/97200b55e38e1a51c630b6f927dd4d86/raw/2a1dc29288ddd669f14fc499300926b8f92eae60/gistfile1.txt"))()
    end)

    createExec("Ajdar TptoolHub",function()
        loadstring(game:HttpGet("https://gist.githubusercontent.com/berat9792/f988246a8466798f90ff8abd1b28a0fa/raw/eb7060939fef223081cfe3e5a2fc9d667e8dbdfe/gistfile1.txt"))()
    end)

    createExec("Ajdar FpsBooster",function()
        loadstring(game:HttpGet("https://gist.githubusercontent.com/berat9792/d747a107e46734c542359f6bd8f35979/raw/116b81e8d24b489604c8de5521858492ade25794/gistfile1.txt"))()
    end)

    createExec("Ajdar SpeedHub",function()
        loadstring(game:HttpGet("https://gist.githubusercontent.com/berat9792/07c70b27c5ce8c1a7517236be26fe887/raw/6d601e2a2803158d1d33fca4600fee233a1ed65f/gistfile1.txt"))()
    end)

    createExec("Mobile Aimbot",function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Hans-Mobile-Aimbot-64537"))()
    end)

    createExec("PC Aimbot",function()
        loadstring(game:HttpGet("https://gist.githubusercontent.com/berat9792/f361d11aee2a4070aa0414f8328010a3/raw/2ccf21972108fc58484a70f6e58b3108f6a94a5a/gistfile1.txt"))()
    end)

    createExec("Ajdar HitboxHubV2",function()
        loadstring(game:HttpGet("https://gist.githubusercontent.com/berat9792/41f8adc599699b9f2f21dd87503e2391/raw/b5d4c2c3cce27ee72bdead9cb83a6824513e30d6/gistfile1.txt"))()
    end)
end

-- ==============================
-- INFO PAGE CONTENT
-- ==============================
do
    local infoPage = pages["Info"]
    infoPage:ClearAllChildren()
    addTitle(infoPage,"Info Page")

    local infoText = Instance.new("TextLabel")
    infoText.Size = UDim2.new(1,-20,0,40)
    infoText.Position = UDim2.new(0,10,0,10)
    infoText.Text = "Hello, this HUB was created by ScriptZone. Enjoy your game!"
    infoText.TextColor3 = colors.text
    infoText.Font = Enum.Font.Gotham
    infoText.TextSize = 14
    infoText.TextWrapped = true
    infoText.BackgroundTransparency = 1
    infoText.TextXAlignment = Enum.TextXAlignment.Left
    infoText.Parent = infoPage

    local linkLabel = Instance.new("TextLabel")
    linkLabel.Size = UDim2.new(0,200,0,24)
    linkLabel.Position = UDim2.new(0,10,0,60)
    linkLabel.Text="Discord Server:"
    linkLabel.TextColor3=colors.text
    linkLabel.Font=Enum.Font.GothamBold
    linkLabel.TextSize=14
    linkLabel.BackgroundTransparency=1
    linkLabel.TextXAlignment=Enum.TextXAlignment.Left
    linkLabel.Parent=infoPage

    local linkBox = Instance.new("TextLabel")
    linkBox.Size = UDim2.new(0,260,0,28)
    linkBox.Position = UDim2.new(0,10,0,90)
    linkBox.Text="https://discord.gg/yVfEMNHRp"
    linkBox.TextColor3=Color3.fromRGB(120,200,255)
    linkBox.Font=Enum.Font.Gotham
    linkBox.TextSize=14
    linkBox.BackgroundColor3=colors.panel
    linkBox.TextXAlignment=Enum.TextXAlignment.Left
    linkBox.Parent=infoPage
    local c2=Instance.new("UICorner") c2.CornerRadius=UDim.new(0,6) c2.Parent=linkBox
    local s2=Instance.new("UIStroke") s2.Color=Color3.fromRGB(120,200,255) s2.Thickness=1.5 s2.Parent=linkBox

    local copyBtn=Instance.new("TextButton")
    copyBtn.Size=UDim2.new(0,70,0,28)
    copyBtn.Position=UDim2.new(0,280,0,90)
    copyBtn.Text="Copy"
    copyBtn.TextColor3=Color3.fromRGB(255,255,255)
    copyBtn.Font=Enum.Font.GothamBold
    copyBtn.TextSize=14
    copyBtn.BackgroundColor3=Color3.fromRGB(60,60,60)
    copyBtn.Parent=infoPage
    local c3=Instance.new("UICorner") c3.CornerRadius=UDim.new(0,6) c3.Parent=copyBtn
    local s3=Instance.new("UIStroke") s3.Color=Color3.fromRGB(180,180,180) s3.Thickness=1.5 s3.Parent=copyBtn
    copyBtn.MouseButton1Click:Connect(function() setclipboard(linkBox.Text) copyBtn.Text="Copied!" task.wait(1) copyBtn.Text="Copy" end)

    -- Optional Extra Buttons
    local function createExec(label,y,callback)
        local lbl=Instance.new("TextLabel")
        lbl.Size=UDim2.new(0,200,0,24)
        lbl.Position=UDim2.new(0,10,0,y)
        lbl.Text=label
        lbl.TextColor3=colors.text
        lbl.Font=Enum.Font.Gotham
        lbl.TextSize=14
        lbl.BackgroundTransparency=1
        lbl.TextXAlignment=Enum.TextXAlignment.Left
        lbl.Parent=infoPage

        local btn=Instance.new("TextButton")
        btn.Size=UDim2.new(0,120,0,28)
        btn.Position=UDim2.new(1,-130,0,y)
        btn.Text="Execute"
        btn.TextColor3=Color3.fromRGB(60,255,60)
        btn.Font=Enum.Font.GothamBold
        btn.TextSize=14
        btn.BackgroundColor3=colors.panel
        btn.Parent=infoPage
        local c=Instance.new("UICorner") c.CornerRadius=UDim.new(0,6) c.Parent=btn
        local s=Instance.new("UIStroke") s.Color=Color3.fromRGB(60,255,60) s.Parent=btn
        btn.MouseButton1Click:Connect(callback)
    end

    createExec("Infinite Yield",140,function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end)

    createExec("Chat Logs",180,function()
        loadstring(game:HttpGet("https://gist.githubusercontent.com/berat9792/f60c86d808b91d8bbe6476174fa38ec4/raw/e448538374441e42624bf4f01e50aa8cab988f27/gistfile1.txt"))()
    end)
end

-- ==============================
-- SETTINGS PAGE CONTENT
-- ==============================
do
    local settingsPage=pages["Settings"]
    settingsPage:ClearAllChildren()
    addTitle(settingsPage,"Settings Page")

    local themeLabel=Instance.new("TextLabel")
    themeLabel.Size=UDim2.new(1,-20,0,24)
    themeLabel.Position=UDim2.new(0,10,0,50)
    themeLabel.Text="Theme Colors"
    themeLabel.TextColor3=colors.text
    themeLabel.Font=Enum.Font.GothamBold
    themeLabel.TextSize=14
    themeLabel.BackgroundTransparency=1
    themeLabel.TextXAlignment=Enum.TextXAlignment.Left
    themeLabel.Parent=settingsPage
end

-- ==============================
-- GUI OPEN/CLOSE ANIMATION
-- ==============================
local visible=false
local animTime=0.4

function animateOpen()
    frame.Visible=true
    frame.Size=UDim2.new(0,0,0,0)
    frame.Position=UDim2.new(0.5,0,0.5,0)
    TweenService:Create(frame,TweenInfo.new(animTime,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
        {Size=UDim2.new(0,460,0,400),Position=UDim2.new(0.5,-230,0.5,-200)}):Play()
end

function animateClose()
    local tween=TweenService:Create(frame,TweenInfo.new(animTime,Enum.EasingStyle.Quint,Enum.EasingDirection.In),
        {Size=UDim2.new(0,0,0,0),Position=UDim2.new(0.5,0,0.5,0)})
    tween:Play()
    tween.Completed:Connect(function() frame.Visible=false end)
end

toggleBtn.MouseButton1Click:Connect(function()
    visible = not visible
    if visible then animateOpen() else animateClose() end
end)

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.F1 then
        visible = not visible
        if visible then animateOpen() else animateClose() end
    end
end)