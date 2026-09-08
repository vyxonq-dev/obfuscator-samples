local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local UIListLayout = Instance.new("UIListLayout")
ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "RESHAB_Menu"
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MainFrame.Position = UDim2.new(0.5, -100, 0.5, -100)
MainFrame.Size = UDim2.new(0, 300, 0, 260)
MainFrame.Active = true
MainFrame.Draggable = true
Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Font = Enum.Font.GothamBold
Title.Text = "RESHAB Menu😎v2"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18
UIListLayout.Parent = MainFrame
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 10)
local function CreateButton(text, callback)
    local Button = Instance.new("TextButton")
    Button.Parent = MainFrame
    Button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    Button.Size = UDim2.new(0.9, 0, 0, 40)
    Button.Font = Enum.Font.Gotham
    Button.Text = text
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextSize = 15
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 6)
    UICorner.Parent = Button
    Button.MouseButton1Click:Connect(callback)
end
CreateButton("Infinite Yield", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)
CreateButton("BreakaLuckyBlock(Trolling)", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/osakaTP2/OsakaTP2/main/BreakaLuckyBlockV2"))()
end)
CreateButton("BreakaLuckyBlock (Farm by Tora IsMe)", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/BreakaLuckyBlock"))()
end)
CreateButton("Close menu", function()
    ScreenGui:Destroy()
end)
