-- WLF Hub | All-in-One Script
-- Rainbow Theme | Minimize & Close | Rounded Corners

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- ══════════════════════════════════════════
--              GUI SETUP
-- ══════════════════════════════════════════

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "WLFHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PlayerGui

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 380, 0, 340)
MainFrame.Position = UDim2.new(0.5, -190, 0.5, -170)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 16)
MainCorner.Parent = MainFrame

-- Rainbow Stroke Border
local RainbowStroke = Instance.new("UIStroke")
RainbowStroke.Thickness = 2.5
RainbowStroke.Color = Color3.fromRGB(255, 0, 0)
RainbowStroke.Parent = MainFrame

-- ══════════════════════════════════════════
--              TITLE BAR
-- ══════════════════════════════════════════

local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 46)
TitleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local TitleBarCorner = Instance.new("UICorner")
TitleBarCorner.CornerRadius = UDim.new(0, 16)
TitleBarCorner.Parent = TitleBar

-- Fix bottom corners of title bar
local TitleBarFix = Instance.new("Frame")
TitleBarFix.Size = UDim2.new(1, 0, 0.5, 0)
TitleBarFix.Position = UDim2.new(0, 0, 0.5, 0)
TitleBarFix.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
TitleBarFix.BorderSizePixel = 0
TitleBarFix.Parent = TitleBar

-- Title Label
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Size = UDim2.new(1, -100, 1, 0)
TitleLabel.Position = UDim2.new(0, 16, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "WLF Hub"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 18
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TitleBar

-- Rainbow Title Text
local rainbowHue = 0
RunService.Heartbeat:Connect(function(dt)
    rainbowHue = (rainbowHue + dt * 0.4) % 1
    local color = Color3.fromHSV(rainbowHue, 1, 1)
    TitleLabel.TextColor3 = color
    RainbowStroke.Color = color
end)

-- ══════════════════════════════════════════
--          CLOSE & MINIMIZE BUTTONS
-- ══════════════════════════════════════════

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Name = "CloseBtn"
CloseBtn.Size = UDim2.new(0, 28, 0, 28)
CloseBtn.Position = UDim2.new(1, -38, 0.5, -14)
CloseBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 13
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.BorderSizePixel = 0
CloseBtn.Parent = TitleBar

local CloseBtnCorner = Instance.new("UICorner")
CloseBtnCorner.CornerRadius = UDim.new(0, 8)
CloseBtnCorner.Parent = CloseBtn

CloseBtn.MouseEnter:Connect(function()
    TweenService:Create(CloseBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(255, 80, 80)}):Play()
end)
CloseBtn.MouseLeave:Connect(function()
    TweenService:Create(CloseBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(220, 50, 50)}):Play()
end)
CloseBtn.MouseButton1Click:Connect(function()
    TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0)
    }):Play()
    task.wait(0.35)
    ScreenGui:Destroy()
end)

-- Minimize Button
local MinBtn = Instance.new("TextButton")
MinBtn.Name = "MinBtn"
MinBtn.Size = UDim2.new(0, 28, 0, 28)
MinBtn.Position = UDim2.new(1, -72, 0.5, -14)
MinBtn.BackgroundColor3 = Color3.fromRGB(200, 150, 30)
MinBtn.Text = "—"
MinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinBtn.TextSize = 13
MinBtn.Font = Enum.Font.GothamBold
MinBtn.BorderSizePixel = 0
MinBtn.Parent = TitleBar

local MinBtnCorner = Instance.new("UICorner")
MinBtnCorner.CornerRadius = UDim.new(0, 8)
MinBtnCorner.Parent = MinBtn

local isMinimized = false
MinBtn.MouseEnter:Connect(function()
    TweenService:Create(MinBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(255, 190, 50)}):Play()
end)
MinBtn.MouseLeave:Connect(function()
    TweenService:Create(MinBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(200, 150, 30)}):Play()
end)
MinBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 380, 0, 46)
        }):Play()
        MinBtn.Text = "_"
    else
        TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 380, 0, 340)
        }):Play()
        MinBtn.Text = "-"
    end
end)

-- ══════════════════════════════════════════
--           SCROLL / CONTENT AREA
-- ══════════════════════════════════════════

local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Name = "ScrollFrame"
ScrollFrame.Size = UDim2.new(1, -20, 1, -62)
ScrollFrame.Position = UDim2.new(0, 10, 0, 52)
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.BorderSizePixel = 0
ScrollFrame.ScrollBarThickness = 4
ScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(120, 100, 255)
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScrollFrame.Parent = MainFrame

local ListLayout = Instance.new("UIListLayout")
ListLayout.Padding = UDim.new(0, 10)
ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
ListLayout.Parent = ScrollFrame

local ListPadding = Instance.new("UIPadding")
ListPadding.PaddingTop = UDim.new(0, 6)
ListPadding.PaddingLeft = UDim.new(0, 4)
ListPadding.PaddingRight = UDim.new(0, 4)
ListPadding.Parent = ScrollFrame

-- ══════════════════════════════════════════
--           BUTTON FACTORY
-- ══════════════════════════════════════════

local buttonHues = {0, 0.08, 0.16, 0.55, 0.75}

local function createScriptButton(order, label, description, callback)
    local hue = buttonHues[order] or (order * 0.18 % 1)
    local baseColor = Color3.fromHSV(hue, 0.75, 0.9)
    local darkColor = Color3.fromHSV(hue, 0.85, 0.55)

    local BtnFrame = Instance.new("Frame")
    BtnFrame.Name = "BtnFrame_" .. label
    BtnFrame.Size = UDim2.new(1, 0, 0, 60)
    BtnFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
    BtnFrame.BorderSizePixel = 0
    BtnFrame.LayoutOrder = order
    BtnFrame.Parent = ScrollFrame

    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 12)
    BtnCorner.Parent = BtnFrame

    local BtnStroke = Instance.new("UIStroke")
    BtnStroke.Color = baseColor
    BtnStroke.Thickness = 1.5
    BtnStroke.Transparency = 0.4
    BtnStroke.Parent = BtnFrame

    -- Colored accent left bar
    local AccentBar = Instance.new("Frame")
    AccentBar.Size = UDim2.new(0, 4, 0.7, 0)
    AccentBar.Position = UDim2.new(0, 8, 0.15, 0)
    AccentBar.BackgroundColor3 = baseColor
    AccentBar.BorderSizePixel = 0
    AccentBar.Parent = BtnFrame

    local AccentCorner = Instance.new("UICorner")
    AccentCorner.CornerRadius = UDim.new(1, 0)
    AccentCorner.Parent = AccentBar

    -- Script Name Label
    local NameLabel = Instance.new("TextLabel")
    NameLabel.Size = UDim2.new(1, -110, 0, 26)
    NameLabel.Position = UDim2.new(0, 22, 0, 8)
    NameLabel.BackgroundTransparency = 1
    NameLabel.Text = label
    NameLabel.TextColor3 = Color3.fromRGB(240, 240, 255)
    NameLabel.TextSize = 15
    NameLabel.Font = Enum.Font.GothamBold
    NameLabel.TextXAlignment = Enum.TextXAlignment.Left
    NameLabel.Parent = BtnFrame

    -- Description Label
    local DescLabel = Instance.new("TextLabel")
    DescLabel.Size = UDim2.new(1, -110, 0, 18)
    DescLabel.Position = UDim2.new(0, 22, 0, 32)
    DescLabel.BackgroundTransparency = 1
    DescLabel.Text = description
    DescLabel.TextColor3 = Color3.fromRGB(140, 140, 160)
    DescLabel.TextSize = 11
    DescLabel.Font = Enum.Font.Gotham
    DescLabel.TextXAlignment = Enum.TextXAlignment.Left
    DescLabel.Parent = BtnFrame

    -- Execute Button
    local ExecBtn = Instance.new("TextButton")
    ExecBtn.Size = UDim2.new(0, 80, 0, 34)
    ExecBtn.Position = UDim2.new(1, -90, 0.5, -17)
    ExecBtn.BackgroundColor3 = baseColor
    ExecBtn.Text = "Execute"
    ExecBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    ExecBtn.TextSize = 13
    ExecBtn.Font = Enum.Font.GothamBold
    ExecBtn.BorderSizePixel = 0
    ExecBtn.Parent = BtnFrame

    local ExecCorner = Instance.new("UICorner")
    ExecCorner.CornerRadius = UDim.new(0, 9)
    ExecCorner.Parent = ExecBtn

    -- Hover / Click Effects
    ExecBtn.MouseEnter:Connect(function()
        TweenService:Create(ExecBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromHSV(hue, 0.6, 1)}):Play()
        TweenService:Create(BtnStroke, TweenInfo.new(0.15), {Transparency = 0}):Play()
    end)
    ExecBtn.MouseLeave:Connect(function()
        TweenService:Create(ExecBtn, TweenInfo.new(0.15), {BackgroundColor3 = baseColor}):Play()
        TweenService:Create(BtnStroke, TweenInfo.new(0.15), {Transparency = 0.4}):Play()
        ExecBtn.Text = "Execute"
    end)
    ExecBtn.MouseButton1Click:Connect(function()
        ExecBtn.Text = "Loading..."
        TweenService:Create(ExecBtn, TweenInfo.new(0.1), {BackgroundColor3 = darkColor}):Play()
        task.spawn(function()
            local ok, err = pcall(callback)
            if ok then
                ExecBtn.Text = "✓ Done!"
                TweenService:Create(ExecBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 200, 100)}):Play()
            else
                ExecBtn.Text = "✗ Error"
                TweenService:Create(ExecBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(200, 50, 50)}):Play()
                warn("[WLF Hub] Error in '" .. label .. "': " .. tostring(err))
            end
            task.wait(2)
            ExecBtn.Text = "Execute"
            TweenService:Create(ExecBtn, TweenInfo.new(0.2), {BackgroundColor3 = baseColor}):Play()
        end)
    end)

    return BtnFrame
end

-- ══════════════════════════════════════════
--           REGISTER SCRIPTS
-- ══════════════════════════════════════════

createScriptButton(1, "L1bGUI", "A gui By da legend L1B", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/klompdwastaken-beep/wolfhub/refs/heads/main/Lib.lua', true))()
end)

createScriptButton(2, "F3X", "F3X Building Tools (Needs Hats)", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/klompdwastaken-beep/wolfhub/refs/heads/main/f3x.lua', true))()
end)

createScriptButton(3, "WLF R6", "L1B R6 Dances", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/klompdwastaken-beep/wolfhub/refs/heads/main/wlf.lua', true))()
end)

createScriptButton(4, "IY", "Infinite Yield Admin", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

createScriptButton(5, "Chara", "Chara With knife", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/chara.luau"))()
end)

-- ══════════════════════════════════════════
--           OPEN ANIMATION
-- ══════════════════════════════════════════

MainFrame.Size = UDim2.new(0, 0, 0, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
TweenService:Create(MainFrame, TweenInfo.new(0.45, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 380, 0, 340),
    Position = UDim2.new(0.5, -190, 0.5, -170)
}):Play()

print("✅ WLF Hub loaded successfully!")
