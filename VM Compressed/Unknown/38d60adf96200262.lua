-- Delta‑Safe Obfuscated Key System

local _A = "babft"
local _B = "https://raw.githubusercontent.com/102KIRA/Best-Babft-script/refs/heads/main/Actually%20Best%20babft%20script"
local _C = "https://link-hub.net/1455175/ww8xfl7gpn8I"

local function _D()
    return loadstring(game:HttpGet(_B))()
end

local p = game.Players.LocalPlayer
local G = Instance.new("ScreenGui")
G.Name = ("Build A Boat Key System")
G.Parent = p:WaitForChild("PlayerGui")
G.ResetOnSpawn = false

local F = Instance.new("Frame", G)
F.Size = UDim2.new(0,330,0,230)
F.Position = UDim2.new(.5,-165,.5,-115)
F.BackgroundColor3 = Color3.fromRGB(70,70,70)
F.Active = true
F.Draggable = true
Instance.new("UICorner", F).CornerRadius = UDim.new(0,12)

local S = Instance.new("UIStroke", F)
S.Thickness = 2
S.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

task.spawn(function()
    while F.Parent do
        S.Color = Color3.fromRGB(
            math.random(0,255),
            math.random(0,255),
            math.random(0,255)
        )
        task.wait(0.15)
    end
end)

local T = Instance.new("TextLabel", F)
T.Size = UDim2.new(1,0,0,40)
T.BackgroundColor3 = Color3.fromRGB(50,50,50)
T.Text = "Build A Boat Key System"
T.TextScaled = true
T.TextColor3 = Color3.fromRGB(255,255,255)
Instance.new("UICorner", T).CornerRadius = UDim.new(0,12)

local K = Instance.new("TextBox", F)
K.Size = UDim2.new(1,-20,0,40)
K.Position = UDim2.new(0,10,0,55)
K.BackgroundColor3 = Color3.fromRGB(100,100,100)
K.PlaceholderText = "Enter Key..."
K.TextColor3 = Color3.fromRGB(255,255,255)
K.Text = ""
Instance.new("UICorner", K).CornerRadius = UDim.new(0,10)

local B1 = Instance.new("TextButton", F)
B1.Size = UDim2.new(1,-20,0,40)
B1.Position = UDim2.new(0,10,0,105)
B1.BackgroundColor3 = Color3.fromRGB(90,90,90)
B1.Text = "Check Key"
B1.TextColor3 = Color3.fromRGB(255,255,255)
Instance.new("UICorner", B1).CornerRadius = UDim.new(0,10)

local B2 = Instance.new("TextButton", F)
B2.Size = UDim2.new(1,-20,0,40)
B2.Position = UDim2.new(0,10,0,155)
B2.BackgroundColor3 = Color3.fromRGB(90,90,90)
B2.Text = "Get Key"
B2.TextColor3 = Color3.fromRGB(255,255,255)
Instance.new("UICorner", B2).CornerRadius = UDim.new(0,10)

local ST = Instance.new("TextLabel", F)
ST.Size = UDim2.new(1,0,0,30)
ST.Position = UDim2.new(0,0,0,200)
ST.BackgroundTransparency = 1
ST.TextColor3 = Color3.fromRGB(255,255,255)
ST.TextScaled = true
ST.Text = ""

B1.MouseButton1Click:Connect(function()
    if K.Text == _A then
        ST.Text = "Key Accepted!"
        ST.TextColor3 = Color3.fromRGB(0,255,0)

        local X = G
        task.delay(.05,function()
            X:Destroy()
        end)

        task.spawn(_D)
    else
        ST.Text = "Invalid Key!"
        ST.TextColor3 = Color3.fromRGB(255,0,0)
    end
end)

B2.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(_C)
        ST.Text = "Key Copied!"
        ST.TextColor3 = Color3.fromRGB(0,170,255)
    else
        ST.Text = "Clipboard unsupported"
    end
end)