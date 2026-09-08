-- ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Glitcher gui"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- الإطار الرئيسي
local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 260, 0, 160)
Frame.Position = UDim2.new(0.5, -130, 0.5, -80)
Frame.BackgroundColor3 = Color3.fromRGB(255,0,0)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true

-- Glow
local UIStroke = Instance.new("UIStroke")
UIStroke.Parent = Frame
UIStroke.Color = Color3.fromRGB(255,120,120)
UIStroke.Thickness = 4

local UICorner = Instance.new("UICorner")
UICorner.Parent = Frame
UICorner.CornerRadius = UDim.new(0,12)

-- العنوان
local Title = Instance.new("TextLabel")
Title.Parent = Frame
Title.Size = UDim2.new(1,0,0,30)
Title.BackgroundTransparency = 1
Title.Text = "Glitcher gui"
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 22

-- دالة إنشاء زر
local function createButton(text, posX)
    local Button = Instance.new("TextButton")
    Button.Parent = Frame
    Button.Size = UDim2.new(0,70,0,55)
    Button.Position = UDim2.new(0,posX,0,75)
    Button.BackgroundColor3 = Color3.fromRGB(180,0,0)
    Button.TextColor3 = Color3.fromRGB(255,255,255)
    Button.Font = Enum.Font.SourceSansBold
    Button.TextSize = 22
    Button.Text = text

    local Stroke = Instance.new("UIStroke")
    Stroke.Parent = Button
    Stroke.Color = Color3.fromRGB(255,150,150)
    Stroke.Thickness = 2

    local Corner = Instance.new("UICorner")
    Corner.Parent = Button
    Corner.CornerRadius = UDim.new(0,10)

    return Button
end

-- الأزرار
local Button1 = createButton("1", 15)
local Button2 = createButton("2", 95)
local Button3 = createButton("3", 175)

-- زر 1
Button1.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Nebula-Star-Glitcher-46143"))()
end)

-- زر 2
Button2.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Spectrum-Glitcher-47547"))()
end)

-- زر 3
Button3.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Spectrum%20Glitcher"))()
end)