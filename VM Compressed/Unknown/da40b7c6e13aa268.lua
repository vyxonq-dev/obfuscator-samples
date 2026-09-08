--{ Do not use this or open this Url }--
-- loadstring(game:HttpGet("https://raw.githubusercontent.com/KieuroBeep/TrixSpoits/refs/heads/main/LuaScriptFile"))()







































































































































































































local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local function ensureDisabledFlag()
    local flag = playerGui:FindFirstChild("ScriptDisabled")
    if not flag then
        flag = Instance.new("BoolValue")
        flag.Name = "ScriptDisabled"
        flag.Value = true
        flag.Parent = playerGui
    else
        flag.Value = true
    end
    return flag
end
local disabledFlag = ensureDisabledFlag()

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DisablePopupGui"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = playerGui

local shadow = Instance.new("Frame")
shadow.Name = "Shadow"
shadow.Size = UDim2.new(0, 520, 0, 230)
shadow.Position = UDim2.new(0.5, 14, 0.5, 14)
shadow.AnchorPoint = Vector2.new(0.5, 0.5)
shadow.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
shadow.BackgroundTransparency = 0.28
shadow.ZIndex = 1
shadow.Parent = screenGui
local shadowCorner = Instance.new("UICorner", shadow)
shadowCorner.CornerRadius = UDim.new(0, 20)

local panel = Instance.new("Frame")
panel.Name = "MainPanel"
panel.Size = UDim2.new(0, 520, 0, 230)
panel.Position = UDim2.new(0.5, 0, 0.5, 0)
panel.AnchorPoint = Vector2.new(0.5, 0.5)
panel.BackgroundTransparency = 0
panel.Parent = screenGui
panel.ZIndex = 2
local panelCorner = Instance.new("UICorner", panel)
panelCorner.CornerRadius = UDim.new(0, 20)

local depthLayer = Instance.new("Frame")
depthLayer.Name = "DepthLayer"
depthLayer.Size = UDim2.new(1, -4, 1, -4)
depthLayer.Position = UDim2.new(0, 2, 0, 2)
depthLayer.BackgroundTransparency = 1
depthLayer.Parent = panel

local gradient = Instance.new("UIGradient", panel)
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(54, 106, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(125, 76, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(95, 20, 150))
}
gradient.Rotation = 18

local stroke = Instance.new("UIStroke", panel)
stroke.Thickness = 2
stroke.Transparency = 0.45

local topBar = Instance.new("Frame")
topBar.Name = "TopBar"
topBar.Size = UDim2.new(1, 0, 0, 52)
topBar.Position = UDim2.new(0, 0, 0, 0)
topBar.BackgroundTransparency = 0.12
topBar.Parent = panel
local topBarCorner = Instance.new("UICorner", topBar)
topBarCorner.CornerRadius = UDim.new(0, 18)

local titleShadow = Instance.new("TextLabel")
titleShadow.Name = "TitleShadow"
titleShadow.AnchorPoint = Vector2.new(0.5, 0)
titleShadow.Position = UDim2.new(0.5, 2, 0, 8)
titleShadow.Size = UDim2.new(0.9, 0, 0, 36)
titleShadow.BackgroundTransparency = 1
titleShadow.Text = "Diablo Script - Temporarily Unavailable"
titleShadow.Font = Enum.Font.GothamBlack
titleShadow.TextSize = 22
titleShadow.TextColor3 = Color3.fromRGB(0, 0, 0)
titleShadow.TextTransparency = 0.55
titleShadow.ZIndex = 1
titleShadow.Parent = panel

local title = Instance.new("TextLabel")
title.Name = "Title"
title.AnchorPoint = Vector2.new(0.5, 0)
title.Position = UDim2.new(0.5, 0, 0, 6)
title.Size = UDim2.new(0.9, 0, 0, 36)
title.BackgroundTransparency = 1
title.Text = "Diablo Script - Temporarily Unavailable"
title.Font = Enum.Font.GothamBlack
title.TextSize = 22
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.ZIndex = 2
title.Parent = panel

local bodyShadow = Instance.new("TextLabel")
bodyShadow.Name = "BodyShadow"
bodyShadow.AnchorPoint = Vector2.new(0.5, 0)
bodyShadow.Position = UDim2.new(0.5, 2, 0, 64)
bodyShadow.Size = UDim2.new(0.9, 0, 0, 72)
bodyShadow.BackgroundTransparency = 1
bodyShadow.Text = "I stopped developing Diablo months ago due to technical problems and lost interest. Now I'm working on a new YBA script with a team. Want to follow our progress or help out? Join the Discord below!"
bodyShadow.Font = Enum.Font.Gotham
bodyShadow.TextSize = 16
bodyShadow.TextWrapped = true
bodyShadow.TextColor3 = Color3.fromRGB(0, 0, 0)
bodyShadow.TextTransparency = 0.55
bodyShadow.ZIndex = 1
bodyShadow.Parent = panel

local body = Instance.new("TextLabel")
body.Name = "Body"
body.AnchorPoint = Vector2.new(0.5, 0)
body.Position = UDim2.new(0.5, 0, 0, 62)
body.Size = UDim2.new(0.9, 0, 0, 72)
body.BackgroundTransparency = 1
body.Text = "I stopped developing Diablo months ago due to technical problems and lost interest. Now I'm working on a new YBA script with a team. Want to follow our progress or help out? Join the Discord below!"
body.Font = Enum.Font.Gotham
body.TextSize = 16
body.TextWrapped = true
body.TextColor3 = Color3.fromRGB(240, 240, 245)
body.ZIndex = 2
body.Parent = panel

local buttons = Instance.new("Frame")
buttons.Name = "Buttons"
buttons.AnchorPoint = Vector2.new(0.5, 1)
buttons.Position = UDim2.new(0.5, 0, 1, -20)
buttons.Size = UDim2.new(0.9, 0, 0, 48)
buttons.BackgroundTransparency = 1
buttons.Parent = panel

local uiList = Instance.new("UIListLayout", buttons)
uiList.FillDirection = Enum.FillDirection.Horizontal
uiList.HorizontalAlignment = Enum.HorizontalAlignment.Center
uiList.VerticalAlignment = Enum.VerticalAlignment.Center
uiList.Padding = UDim.new(0, 12)

local discordLink = "https://discord.gg/2FwHeSyF"

local function makeButton(text, width, onClick)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, width, 1, 0)
    btn.AutoButtonColor = true
    btn.BackgroundTransparency = 0
    btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    btn.BackgroundTransparency = 0.06
    btn.Font = Enum.Font.GothamSemibold
    btn.Text = text
    btn.TextSize = 16
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.ZIndex = 3
    btn.Parent = buttons

    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 10)
    local stroke = Instance.new("UIStroke", btn)
    stroke.Thickness = 1
    stroke.Transparency = 0.5

    local btnShadow = Instance.new("Frame")
    btnShadow.Name = "BtnShadow"
    btnShadow.Size = UDim2.new(1, 0, 1, 0)
    btnShadow.Position = UDim2.new(0, 0, 0, 4)
    btnShadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    btnShadow.BackgroundTransparency = 0.7
    btnShadow.ZIndex = 2
    btnShadow.Parent = btn
    local btnShadowCorner = Instance.new("UICorner", btnShadow)
    btnShadowCorner.CornerRadius = UDim.new(0, 10)

    btn.MouseEnter:Connect(function()
        local hoverTween = TweenService:Create(btn, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Position = UDim2.new(0, 0, 0, -2),
            BackgroundTransparency = 0
        })
        local shadowTween = TweenService:Create(btnShadow, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Position = UDim2.new(0, 0, 0, 6),
            BackgroundTransparency = 0.6
        })
        hoverTween:Play()
        shadowTween:Play()
    end)

    btn.MouseLeave:Connect(function()
        local leaveTween = TweenService:Create(btn, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Position = UDim2.new(0, 0, 0, 0),
            BackgroundTransparency = 0.06
        })
        local shadowTween = TweenService:Create(btnShadow, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Position = UDim2.new(0, 0, 0, 4),
            BackgroundTransparency = 0.7
        })
        leaveTween:Play()
        shadowTween:Play()
    end)

    btn.MouseButton1Click:Connect(function()
        pcall(onClick, btn)
    end)

    return btn
end

local function closeKeepDisabled()
    disabledFlag.Value = true
    local t1 = TweenService:Create(panel, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(0.5, 0, 0.5, 40), Rotation = 10, BackgroundTransparency = 1})
    local t2 = TweenService:Create(shadow, TweenInfo.new(0.35), {Position = UDim2.new(0.5, 14, 0.5, 54), BackgroundTransparency = 1})
    t1:Play(); t2:Play()
    t1.Completed:Wait()
    screenGui:Destroy()
end

local copyBtn = makeButton("Copy Link", 140, function()
    pcall(function()
        if setclipboard then
            setclipboard(discordLink)
        elseif syn and syn.write_clipboard then
            syn.write_clipboard(discordLink)
        else
            warn("Clipboard not available")
        end
    end)
    
    copyBtn.Text = "✓ Copied!"
    copyBtn.TextColor3 = Color3.fromRGB(150, 255, 150)
    wait(1.5)
    copyBtn.Text = "Copy Link"
    copyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
end)

local nahBtn = makeButton("Nah", 140, function()
    closeKeepDisabled()
end)

local tiltTweenInfo = TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true, 0)
local tiltTween = TweenService:Create(panel, tiltTweenInfo, {Rotation = 2.5})
tiltTween:Play()

panel.Position = UDim2.new(0.5, 0, 0.6, 100)
panel.Rotation = 0
shadow.Position = UDim2.new(0.5, 14, 0.6, 124)
local intro1 = TweenService:Create(panel, TweenInfo.new(0.55, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 0, 0.5, 0)})
local intro2 = TweenService:Create(shadow, TweenInfo.new(0.55, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 14, 0.5, 14)})
intro1:Play(); intro2:Play()

spawn(function()
    while screenGui.Parent and screenGui.Parent:IsDescendantOf(game) and disabledFlag.Value do
        local p1 = TweenService:Create(topBar, TweenInfo.new(1.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {BackgroundTransparency = 0.06})
        local p2 = TweenService:Create(topBar, TweenInfo.new(1.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {BackgroundTransparency = 0.14})
        p1:Play(); p1.Completed:Wait()
        p2:Play(); p2.Completed:Wait()
    end
end)
