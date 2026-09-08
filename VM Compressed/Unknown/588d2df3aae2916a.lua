local plr = game.Players.LocalPlayer
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local uicorn = Instance.new("UICorner")
local opclbtn = Instance.new("ImageButton")
local uicorn2 = Instance.new("UICorner")
local Slip = Instance.new("TextLabel")

local rs = game.ReplicatedStorage
local ps = rs.Remotes.FromClient.Push
local ss = rs.Remotes.FromClient.SwordSwing

local Push = Instance.new("TextButton")
local Push2 = Instance.new("TextButton")

local Swing = Instance.new("TextButton")
local Swing2 = Instance.new("TextButton")
local IY = Instance.new("TextButton")

local scrgui = Instance.new("ScrollingFrame")
scrgui.CanvasSize = UDim2.new(0, 0, 4, 0)

--Properties:

ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "SSGui"

opclbtn.Parent = ScreenGui
opclbtn.Position = UDim2.new(0.50, 0, 0.10, 0)
opclbtn.Size = UDim2.new(0, 50, 0, 50)
opclbtn.Active = true
opclbtn.Draggable = true
opclbtn.Image = "rbxassetid://108417470927317"
uicorn2.Parent = opclbtn
opclbtn.MouseButton1Click:connect(function()
    Frame.Visible = not Frame.Visible   
end)
	
Frame.Parent = ScreenGui
Frame.BackgroundTransparency = 0.3
Frame.BackgroundColor3 = Color3.fromRGB(92, 94, 84)
Frame.Position = UDim2.new(0.15, 0, 0.14, 0)
Frame.Size = UDim2.new(0, 386, 0, 300)
Frame.Active = true
Frame.Draggable = true
uicorn.Parent = Frame

scrgui.Parent = Frame
scrgui.BackgroundTransparency = 0.3
scrgui.BackgroundColor3 = Color3.fromRGB(92, 94, 84)
scrgui.Position = UDim2.new(0.05, 0, 0.14, 0)
scrgui.Size = UDim2.new(0, 350, 0, 250)
scrgui.Active = true

Slip.Name = "sl"
Slip.Parent = Frame
Slip.BackgroundTransparency = 0.1
Slip.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Slip.Position = UDim2.new(0.3, 0, 0.001, 0)
Slip.Size = UDim2.new(0, 150, 0, 40)
Slip.Font = Enum.Font.Gotham
Slip.Text = "Slippery Stairs GUI"
Slip.ZIndex = 2
Slip.TextColor3 = Color3.fromRGB(0, 0, 0)
Slip.TextScaled = true
Slip.TextSize = 18.000
Slip.TextWrapped = true

Push.Parent = scrgui
Push.BackgroundTransparency = 0.2
Push.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Push.Position = UDim2.new(0.05, 0, 0.01, 0)
Push.Size = UDim2.new(0, 150, 0, 50)
Push.Visible = true
Push.Text = "Push spam"
Push.TextColor3 = Color3.fromRGB(0, 0, 0)
Push.TextScaled = true
Push.TextSize = 14.000
Push.TextWrapped = true

Push2.Parent = scrgui
Push2.BackgroundTransparency = 0.2
Push2.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
Push2.Position = UDim2.new(0.05, 0, 0.01, 0)
Push2.Size = UDim2.new(0, 150, 0, 50)
Push2.Visible = false
Push2.Text = "Push spam"
Push2.TextColor3 = Color3.fromRGB(0, 0, 0)
Push2.TextScaled = true
Push2.TextSize = 14.000
Push2.TextWrapped = true
local p = false

Push.MouseButton1Click:connect(function()
    p = true
    Push.Visible = false
    Push2.Visible = true
    while p == true do
        wait(0.01)
        ps:FireServer()
    end
end)

Push2.MouseButton1Click:connect(function()
    p = false
    Push.Visible = true
    Push2.Visible = false
end)

Swing.Parent = scrgui
Swing.BackgroundTransparency = 0.2
Swing.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Swing.Position = UDim2.new(0.05, 0, 0.06, 0)
Swing.Size = UDim2.new(0, 150, 0, 50)
Swing.Visible = true
Swing.Text = "Sword swing spam"
Swing.TextColor3 = Color3.fromRGB(0, 0, 0)
Swing.TextScaled = true
Swing.TextSize = 14.000
Swing.TextWrapped = true

Swing2.Parent = scrgui
Swing2.BackgroundTransparency = 0.2
Swing2.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
Swing2.Position = UDim2.new(0.05, 0, 0.06, 0)
Swing2.Size = UDim2.new(0, 150, 0, 50)
Swing2.Visible = false
Swing2.Text = "Sword swing spam"
Swing2.TextColor3 = Color3.fromRGB(0, 0, 0)
Swing2.TextScaled = true
Swing2.TextSize = 14.000
Swing2.TextWrapped = true
local s = false

Swing.MouseButton1Click:connect(function()
    s = true
    Swing.Visible = false
    Swing2.Visible = true
    while s == true do
        wait(0.01)
        ss:FireServer()
    end
end)

Swing2.MouseButton1Click:connect(function()
    s = false
    Swing.Visible = true
    Swing2.Visible = false
end)

IY.Parent = scrgui
IY.BackgroundTransparency = 0.2
IY.BackgroundColor3 = Color3.fromRGB(228, 152, 255)
IY.Position = UDim2.new(0.05, 0, 0.11, 0)
IY.Size = UDim2.new(0, 150, 0, 50)
IY.Visible = true
IY.Text = "Infinite Yield"
IY.TextColor3 = Color3.fromRGB(0, 0, 0)
IY.TextScaled = true
IY.TextSize = 14.000
IY.TextWrapped = true

IY.MouseButton1Click:connect(function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)
