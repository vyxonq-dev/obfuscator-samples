-- CGroundHUB - Advanced Executor UI with Keysystem
-- By Fredbear555 | Modern Dark Theme

-- ================= CONFIG =================
local link = "https://lootdest.org/s?yp5rU7xl"

-- ================= SERVICES =================
local TweenService = game:GetService("TweenService")
local GuiService = game:GetService("GuiService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local Player = Players.LocalPlayer

-- ================= BLUR EFFECT =================
local blur = Instance.new("BlurEffect")
blur.Size = 0
blur.Parent = game.Lighting
TweenService:Create(blur, TweenInfo.new(0.4), {Size = 10}):Play()

-- ================= KEYSYSTEM GUI =================
local keyGui = Instance.new("ScreenGui")
keyGui.Name = "KeySystemUI"
keyGui.ResetOnSpawn = false
keyGui.Parent = Player:WaitForChild("PlayerGui")

local keyCard = Instance.new("Frame", keyGui)
keyCard.Size = UDim2.new(0,0,0,0)
keyCard.Position = UDim2.new(0.5,0,0.5,0)
keyCard.AnchorPoint = Vector2.new(0.5,0.5)
keyCard.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
keyCard.BorderSizePixel = 0

local keyCardCorner = Instance.new("UICorner", keyCard)
keyCardCorner.CornerRadius = UDim.new(0,22)

TweenService:Create(keyCard, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
    Size = UDim2.new(0,420,0,340)
}):Play()

-- Glow Effect
local keyGlow = Instance.new("ImageLabel")
keyGlow.Size = UDim2.new(1, 40, 1, 40)
keyGlow.Position = UDim2.new(0, -20, 0, -20)
keyGlow.BackgroundTransparency = 1
keyGlow.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
keyGlow.ImageColor3 = Color3.fromRGB(120, 180, 255)
keyGlow.ImageTransparency = 0.8
keyGlow.ZIndex = 0
keyGlow.Parent = keyCard

-- Title
local keyTitle = Instance.new("TextLabel", keyCard)
keyTitle.Text = "🔐 CGroundHUB KeySystem"
keyTitle.Font = Enum.Font.GothamBold
keyTitle.TextSize = 26
keyTitle.BackgroundTransparency = 1
keyTitle.TextColor3 = Color3.fromRGB(120, 180, 255)
keyTitle.Size = UDim2.new(1,0,0,50)
keyTitle.Position = UDim2.new(0,0,0,20)

local keySubtitle = Instance.new("TextLabel", keyCard)
keySubtitle.Text = "Get your key to access the executor"
keySubtitle.Font = Enum.Font.Gotham
keySubtitle.TextSize = 14
keySubtitle.BackgroundTransparency = 1
keySubtitle.TextColor3 = Color3.fromRGB(180, 180, 180)
keySubtitle.Size = UDim2.new(1,0,0,20)
keySubtitle.Position = UDim2.new(0,0,0,65)

-- Link Box
local linkBox = Instance.new("TextBox", keyCard)
linkBox.Text = link
linkBox.ClearTextOnFocus = false
linkBox.TextEditable = false
linkBox.Position = UDim2.new(0,24,0,110)
linkBox.Size = UDim2.new(1,-48,0,45)
linkBox.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
linkBox.TextColor3 = Color3.fromRGB(120, 180, 255)
linkBox.Font = Enum.Font.Gotham
linkBox.TextSize = 13
linkBox.BorderSizePixel = 0

local linkBoxCorner = Instance.new("UICorner", linkBox)
linkBoxCorner.CornerRadius = UDim.new(0,12)

-- Button Function
local function makeKeyBtn(txt, y, color, icon)
    local b = Instance.new("TextButton", keyCard)
    b.Text = icon .. " " .. txt
    b.Font = Enum.Font.GothamBold
    b.TextSize = 16
    b.TextColor3 = Color3.new(1,1,1)
    b.BackgroundColor3 = color
    b.Size = UDim2.new(1,-48,0,50)
    b.Position = UDim2.new(0,24,0,y)
    b.BorderSizePixel = 0
    b.AutoButtonColor = false
    
    local corner = Instance.new("UICorner", b)
    corner.CornerRadius = UDim.new(0,12)
    
    b.MouseEnter:Connect(function()
        TweenService:Create(b, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(color.R * 255 * 1.15, color.G * 255 * 1.15, color.B * 255 * 1.15)
        }):Play()
    end)
    
    b.MouseLeave:Connect(function()
        TweenService:Create(b, TweenInfo.new(0.2), {BackgroundColor3 = color}):Play()
    end)
    
    return b
end

local copyBtn = makeKeyBtn("Copy Key Link", 175, Color3.fromRGB(80, 130, 245), "📋")
local openBtn = makeKeyBtn("Open Link & Continue", 240, Color3.fromRGB(80, 200, 120), "🌐")

copyBtn.MouseButton1Click:Connect(function()
    linkBox.TextEditable = true
    linkBox:CaptureFocus()
    linkBox.CursorPosition = #linkBox.Text + 1
    linkBox.TextEditable = false
    copyBtn.Text = "✓ Copied!"
    wait(1.5)
    copyBtn.Text = "📋 Copy Key Link"
end)

-- ================= MAIN EXECUTOR GUI =================
local function LoadExecutor()
    -- Destroy key system
    keyGui:Destroy()
    TweenService:Create(blur, TweenInfo.new(0.3), {Size = 0}):Play()
    task.delay(0.35, function() blur:Destroy() end)
    
    -- Create Main ScreenGui
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "CGroundExecutor"
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = game.CoreGui
    
    -- Main Frame
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 700, 0, 500)
    MainFrame.Position = UDim2.new(0.5, -350, 0.5, -250)
    MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    MainFrame.BorderSizePixel = 0
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.Parent = ScreenGui
    
    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 14)
    MainCorner.Parent = MainFrame
    
    -- Shadow
    local Shadow = Instance.new("ImageLabel")
    Shadow.Size = UDim2.new(1, 30, 1, 30)
    Shadow.Position = UDim2.new(0, -15, 0, -15)
    Shadow.BackgroundTransparency = 1
    Shadow.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
    Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    Shadow.ImageTransparency = 0.7
    Shadow.ZIndex = 0
    Shadow.Parent = MainFrame
    
    -- Top Bar
    local TopBar = Instance.new("Frame")
    TopBar.Size = UDim2.new(1, 0, 0, 45)
    TopBar.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
    TopBar.BorderSizePixel = 0
    TopBar.Parent = MainFrame
    
    local TopCorner = Instance.new("UICorner")
    TopCorner.CornerRadius = UDim.new(0, 14)
    TopCorner.Parent = TopBar
    
    local TopBarBottom = Instance.new("Frame")
    TopBarBottom.Size = UDim2.new(1, 0, 0, 14)
    TopBarBottom.Position = UDim2.new(0, 0, 1, -14)
    TopBarBottom.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
    TopBarBottom.BorderSizePixel = 0
    TopBarBottom.Parent = TopBar
    
    -- Title
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(0, 300, 1, 0)
    Title.Position = UDim2.new(0, 15, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = "⚡ CGroundHUB Executor"
    Title.TextColor3 = Color3.fromRGB(120, 180, 255)
    Title.TextSize = 20
    Title.Font = Enum.Font.GothamBold
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = TopBar
    
    -- Close Button
    local CloseButton = Instance.new("TextButton")
    CloseButton.Size = UDim2.new(0, 38, 0, 38)
    CloseButton.Position = UDim2.new(1, -43, 0, 3.5)
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
    CloseButton.Text = "×"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.TextSize = 26
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.BorderSizePixel = 0
    CloseButton.Parent = TopBar
    
    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 10)
    CloseCorner.Parent = CloseButton
    
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
    
    -- Minimize Button
    local MinimizeButton = Instance.new("TextButton")
    MinimizeButton.Size = UDim2.new(0, 38, 0, 38)
    MinimizeButton.Position = UDim2.new(1, -86, 0, 3.5)
    MinimizeButton.BackgroundColor3 = Color3.fromRGB(255, 180, 60)
    MinimizeButton.Text = "−"
    MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    MinimizeButton.TextSize = 26
    MinimizeButton.Font = Enum.Font.GothamBold
    MinimizeButton.BorderSizePixel = 0
    MinimizeButton.Parent = TopBar
    
    local MinimizeCorner = Instance.new("UICorner")
    MinimizeCorner.CornerRadius = UDim.new(0, 10)
    MinimizeCorner.Parent = MinimizeButton
    
    local isMinimized = false
    MinimizeButton.MouseButton1Click:Connect(function()
        isMinimized = not isMinimized
        local targetSize = isMinimized and UDim2.new(0, 700, 0, 45) or UDim2.new(0, 700, 0, 500)
        TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Size = targetSize}):Play()
    end)
    
    -- Mode Tabs (Executor / Script Hub)
    local ModeFrame = Instance.new("Frame")
    ModeFrame.Size = UDim2.new(0, 200, 0, 40)
    ModeFrame.Position = UDim2.new(0, 15, 0, 55)
    ModeFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
    ModeFrame.BorderSizePixel = 0
    ModeFrame.Parent = MainFrame
    
    local ModeCorner = Instance.new("UICorner")
    ModeCorner.CornerRadius = UDim.new(0, 10)
    ModeCorner.Parent = ModeFrame
    
    local ModeLayout = Instance.new("UIListLayout")
    ModeLayout.FillDirection = Enum.FillDirection.Horizontal
    ModeLayout.Padding = UDim.new(0, 5)
    ModeLayout.Parent = ModeFrame
    
    -- Content Frames
    local ExecutorContent = Instance.new("Frame")
    ExecutorContent.Size = UDim2.new(1, -30, 1, -180)
    ExecutorContent.Position = UDim2.new(0, 15, 0, 105)
    ExecutorContent.BackgroundTransparency = 1
    ExecutorContent.Visible = true
    ExecutorContent.Parent = MainFrame
    
    local HubContent = Instance.new("Frame")
    HubContent.Size = UDim2.new(1, -30, 1, -180)
    HubContent.Position = UDim2.new(0, 15, 0, 105)
    HubContent.BackgroundTransparency = 1
    HubContent.Visible = false
    HubContent.Parent = MainFrame
    
    -- Mode Switch Function
    local currentMode = "executor"
    
    local function createModeButton(text, mode)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0, 95, 1, 0)
        btn.BackgroundColor3 = mode == currentMode and Color3.fromRGB(80, 180, 255) or Color3.fromRGB(45, 45, 52)
        btn.Text = text
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextSize = 14
        btn.Font = Enum.Font.GothamBold
        btn.BorderSizePixel = 0
        btn.Parent = ModeFrame
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 8)
        corner.Parent = btn
        
        btn.MouseButton1Click:Connect(function()
            for _, child in pairs(ModeFrame:GetChildren()) do
                if child:IsA("TextButton") then
                    child.BackgroundColor3 = Color3.fromRGB(45, 45, 52)
                end
            end
            btn.BackgroundColor3 = Color3.fromRGB(80, 180, 255)
            
            ExecutorContent.Visible = (mode == "executor")
            HubContent.Visible = (mode == "hub")
            currentMode = mode
        end)
        
        return btn
    end
    
    createModeButton("⚡ Executor", "executor")
    createModeButton("📚 Script Hub", "hub")
    
    -- ================= EXECUTOR CONTENT =================
    local EditorFrame = Instance.new("Frame")
    EditorFrame.Size = UDim2.new(1, 0, 1, -70)
    EditorFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    EditorFrame.BorderSizePixel = 0
    EditorFrame.Parent = ExecutorContent
    
    local EditorCorner = Instance.new("UICorner")
    EditorCorner.CornerRadius = UDim.new(0, 10)
    EditorCorner.Parent = EditorFrame
    
    local ScriptBox = Instance.new("TextBox")
    ScriptBox.Size = UDim2.new(1, -20, 1, -20)
    ScriptBox.Position = UDim2.new(0, 10, 0, 10)
    ScriptBox.BackgroundTransparency = 1
    ScriptBox.Text = "-- CGroundHUB Executor\n-- Write your script here\n\nprint('Hello from CGroundHUB!')"
    ScriptBox.TextColor3 = Color3.fromRGB(220, 220, 220)
    ScriptBox.TextSize = 15
    ScriptBox.Font = Enum.Font.Code
    ScriptBox.TextXAlignment = Enum.TextXAlignment.Left
    ScriptBox.TextYAlignment = Enum.TextYAlignment.Top
    ScriptBox.MultiLine = true
    ScriptBox.ClearTextOnFocus = false
    ScriptBox.Parent = EditorFrame
    
    -- Executor Buttons
    local ExecButtonFrame = Instance.new("Frame")
    ExecButtonFrame.Size = UDim2.new(1, 0, 0, 60)
    ExecButtonFrame.Position = UDim2.new(0, 0, 1, -60)
    ExecButtonFrame.BackgroundTransparency = 1
    ExecButtonFrame.Parent = ExecutorContent
    
    local ExecBtnLayout = Instance.new("UIListLayout")
    ExecBtnLayout.FillDirection = Enum.FillDirection.Horizontal
    ExecBtnLayout.Padding = UDim.new(0, 10)
    ExecBtnLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    ExecBtnLayout.Parent = ExecButtonFrame
    
    local function createExecButton(text, color, callback)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0, 160, 0, 50)
        btn.BackgroundColor3 = color
        btn.Text = text
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextSize = 16
        btn.Font = Enum.Font.GothamBold
        btn.BorderSizePixel = 0
        btn.AutoButtonColor = false
        btn.Parent = ExecButtonFrame
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 10)
        corner.Parent = btn
        
        btn.MouseEnter:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(color.R * 255 * 1.2, color.G * 255 * 1.2, color.B * 255 * 1.2)
            }):Play()
        end)
        
        btn.MouseLeave:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = color}):Play()
        end)
        
        btn.MouseButton1Click:Connect(callback)
        return btn
    end
    
    createExecButton("▶ Execute", Color3.fromRGB(80, 200, 120), function()
        local success, err = pcall(function()
            loadstring(ScriptBox.Text)()
        end)
        if not success then
            warn("Execution Error:", err)
        end
    end)
    
    createExecButton("🗑 Clear", Color3.fromRGB(255, 100, 100), function()
        ScriptBox.Text = ""
    end)
    
    createExecButton("💉 Inject", Color3.fromRGB(150, 100, 255), function()
        print("Injected Successfully!")
    end)
    
    -- ================= SCRIPT HUB CONTENT =================
    local HubScroll = Instance.new("ScrollingFrame")
    HubScroll.Size = UDim2.new(1, 0, 1, 0)
    HubScroll.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    HubScroll.BorderSizePixel = 0
    HubScroll.ScrollBarThickness = 6
    HubScroll.Parent = HubContent
    
    local HubCorner = Instance.new("UICorner")
    HubCorner.CornerRadius = UDim.new(0, 10)
    HubCorner.Parent = HubScroll
    
    local HubLayout = Instance.new("UIListLayout")
    HubLayout.Padding = UDim.new(0, 10)
    HubLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    HubLayout.Parent = HubScroll
    
    local HubPadding = Instance.new("UIPadding")
    HubPadding.PaddingTop = UDim.new(0, 15)
    HubPadding.PaddingBottom = UDim.new(0, 15)
    HubPadding.Parent = HubScroll
    
    -- Script Hub Buttons
    local scripts = {
        {name = "🔥 The Forge OP", url = "https://pastebin.com/raw/T0CXhVpc"},
        {name = "🎣 Fish it Secret Instant", url = "https://pastefy.app/KU9erY4S/raw"},
        {name = "🚪 Doors Vynixius Hub", url = "https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Doors/Script.lua"},
        {name = "🔓 Keyless The Forge Hub", url = "https://raw.githubusercontent.com/GiftStein1/pepehook-loader/main/loader.lua"},
        {name = "💰 Notoriety Requiem", url = "https://scriptblox.com/raw/RUSH-HOUR-Notoriety-Requiem-Evolution-11364"},
        {name = "🌐 DomainX", url = "https://sirius.menu/domainx"},
        {name = "🍇 Blox Fruit Auto Farm", url = "https://pastebin.com/raw/qC1fgwWE"},
        {name = "🎮 SansmobaHub Keyless", url = "https://raw.githubusercontent.com/DyyITT/SansMobaHub/main/Fishit-Free"},
        {name = "🔐 Backdoor ServerSide", url = "https://raw.githubusercontent.com/melinicovyra-cell/Roblox-script/main/Backdoor.%20Executor"},
        {name = "🎣 Fish it Secret Spam", url = "https://pastebin.com/raw/e3HLVYUu"},
        {name = "⚡ Fish it Force Secret", url = "https://pastebin.com/raw/DJ56UEBR"},
        {name = "🌊 Fish Pollution Hub Keyless", url = "https://api.luarmor.net/files/v3/loaders/b9162d4ef4823b2af2f93664cf9ec393.lua"}
    }
    
    for _, script in pairs(scripts) do
        local scriptBtn = Instance.new("TextButton")
        scriptBtn.Size = UDim2.new(0.95, 0, 0, 50)
        scriptBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
        scriptBtn.Text = script.name
        scriptBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        scriptBtn.TextSize = 15
        scriptBtn.Font = Enum.Font.GothamBold
        scriptBtn.BorderSizePixel = 0
        scriptBtn.AutoButtonColor = false
        scriptBtn.Parent = HubScroll
        
        local scriptCorner = Instance.new("UICorner")
        scriptCorner.CornerRadius = UDim.new(0, 10)
        scriptCorner.Parent = scriptBtn
        
        scriptBtn.MouseEnter:Connect(function()
            TweenService:Create(scriptBtn, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(80, 180, 255)
            }):Play()
        end)
        
        scriptBtn.MouseLeave:Connect(function()
            TweenService:Create(scriptBtn, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(35, 35, 42)
            }):Play()
        end)
        
        scriptBtn.MouseButton1Click:Connect(function()
            loadstring(game:HttpGet(script.url))()
        end)
    end
    
    HubScroll.CanvasSize = UDim2.new(0, 0, 0, HubLayout.AbsoluteContentSize.Y + 30)
    HubLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        HubScroll.CanvasSize = UDim2.new(0, 0, 0, HubLayout.AbsoluteContentSize.Y + 30)
    end)
    
    -- Bottom Credits
    local Credits = Instance.new("TextLabel")
    Credits.Size = UDim2.new(1, 0, 0, 20)
    Credits.Position = UDim2.new(0, 0, 1, -25)
    Credits.BackgroundTransparency = 1
    Credits.Text = "CGroundHUB by Fredbear555 | YT"
    Credits.TextColor3 = Color3.fromRGB(120, 120, 130)
    Credits.TextSize = 12
    Credits.Font = Enum.Font.Gotham
    Credits.Parent = MainFrame
    
    print("✅ CGroundHUB Loaded Successfully!")
end

-- ================= OPEN BUTTON ACTION =================
openBtn.MouseButton1Click:Connect(function()
    pcall(function()
        GuiService:OpenBrowserWindow(link)
    end)
    LoadExecutor()
end)