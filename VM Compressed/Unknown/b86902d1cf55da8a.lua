loadstring([[

-- SERVICES
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local InsertService = game:GetService("InsertService")

-- GUI
local Gui = Instance.new("ScreenGui")
Gui.Parent = Player:WaitForChild("PlayerGui")
Gui.ResetOnSpawn = false

-- MAIN FRAME
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 400, 0, 320)
Main.Position = UDim2.new(0.3, 0, 0.3, 0)
Main.BackgroundColor3 = Color3.fromRGB(20,20,20)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.Parent = Gui

local MainCorner = Instance.new("UICorner", Main)
MainCorner.CornerRadius = UDim.new(0, 16)

local Stroke = Instance.new("UIStroke", Main)
Stroke.Thickness = 2
Stroke.Color = Color3.fromRGB(255,255,255)

-- TITLE
local Logo = Instance.new("TextLabel", Main)
Logo.Size = UDim2.new(1,0,0,40)
Logo.BackgroundTransparency = 1
Logo.Text = "⚡ CLAN A3 /// ANTI‑AFK ⚡"
Logo.TextColor3 = Color3.fromRGB(255,215,0)
Logo.Font = Enum.Font.GothamBlack
Logo.TextSize = 24

-- TARGET INPUT FRAME
local TargetFrame = Instance.new("Frame", Main)
TargetFrame.Size = UDim2.new(1, -20, 0, 70)
TargetFrame.Position = UDim2.new(0,10,0,45)
TargetFrame.BackgroundColor3 = Color3.fromRGB(30,30,30)
Instance.new("UICorner", TargetFrame).CornerRadius = UDim.new(0,10)
Instance.new("UIStroke", TargetFrame).Thickness = 1

local TargetBox = Instance.new("TextBox", TargetFrame)
TargetBox.Size = UDim2.new(0,200,0,40)
TargetBox.Position = UDim2.new(0,10,0.5,-20)
TargetBox.PlaceholderText = "اكتب اسم اللاعب المستهدف"
TargetBox.Text = ""
TargetBox.TextColor3 = Color3.fromRGB(255,255,255)
TargetBox.BackgroundColor3 = Color3.fromRGB(50,50,50)
TargetBox.Font = Enum.Font.Gotham
TargetBox.TextSize = 18
Instance.new("UICorner", TargetBox)

local TargetImage = Instance.new("ImageLabel", TargetFrame)
TargetImage.Size = UDim2.new(0,50,0,50)
TargetImage.Position = UDim2.new(0,220,0.5,-25)
TargetImage.BackgroundTransparency = 1
TargetImage.Image = "" -- سيتم تحديثه تلقائي

local TargetNameLabel = Instance.new("TextLabel", TargetFrame)
TargetNameLabel.Size = UDim2.new(0,150,0,50)
TargetNameLabel.Position = UDim2.new(0,280,0.5,-25)
TargetNameLabel.BackgroundTransparency = 1
TargetNameLabel.TextColor3 = Color3.fromRGB(255,255,255)
TargetNameLabel.Font = Enum.Font.GothamBold
TargetNameLabel.TextSize = 16
TargetNameLabel.Text = ""

-- COUNTERS FRAME
local Counters = Instance.new("Frame", Main)
Counters.Size = UDim2.new(1, -20, 0, 40)
Counters.Position = UDim2.new(0,10,0,125)
Counters.BackgroundColor3 = Color3.fromRGB(25,25,25)
Counters.BorderSizePixel = 0
Instance.new("UICorner", Counters).CornerRadius = UDim.new(0,10)
Instance.new("UIStroke", Counters).Thickness = 1

local CounterText = Instance.new("TextLabel", Counters)
CounterText.Size = UDim2.new(1, 0, 1, 0)
CounterText.BackgroundTransparency = 1
CounterText.TextColor3 = Color3.fromRGB(255,255,255)
CounterText.Font = Enum.Font.GothamMedium
CounterText.TextSize = 16
CounterText.Text = "دخل: 0     |     خرج: 0"

local EnterCount = 0
local LeaveCount = 0

-- UPDATE TARGET INFO FUNCTION
local function UpdateTargetInfo(targetPlayer)
    if targetPlayer then
        TargetImage.Image = "rbxthumb://type=AvatarHeadShot&id="..targetPlayer.UserId.."&w=48&h=48"
        TargetNameLabel.Text = targetPlayer.DisplayName.." | "..targetPlayer.Name
    else
        TargetImage.Image = ""
        TargetNameLabel.Text = ""
    end
end

-- TRACK TARGET PLAYER
local TargetPlayer = nil
TargetBox.FocusLost:Connect(function()
    local name = TargetBox.Text
    TargetPlayer = Players:FindFirstChild(name)
    UpdateTargetInfo(TargetPlayer)
end)

Players.PlayerAdded:Connect(function(p)
    if TargetPlayer and p == TargetPlayer then
        EnterCount += 1
        CounterText.Text = "دخل: "..EnterCount.."     |     خرج: "..LeaveCount
    end
end)

Players.PlayerRemoving:Connect(function(p)
    if TargetPlayer and p == TargetPlayer then
        LeaveCount += 1
        CounterText.Text = "دخل: "..EnterCount.."     |     خرج: "..LeaveCount
    end
end)

-- TIMER FRAME
local TimerFrame = Instance.new("Frame", Main)
TimerFrame.Size = UDim2.new(1, -20, 0, 50)
TimerFrame.Position = UDim2.new(0, 10, 0, 180)
TimerFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
TimerFrame.BorderSizePixel = 0
Instance.new("UICorner", TimerFrame).CornerRadius = UDim.new(0, 10)
Instance.new("UIStroke", TimerFrame).Thickness = 1

local Timer = Instance.new("TextLabel", TimerFrame)
Timer.Size = UDim2.new(1,0,1,0)
Timer.BackgroundTransparency = 1
Timer.TextColor3 = Color3.fromRGB(255,255,255)
Timer.Font = Enum.Font.GothamBold
Timer.TextSize = 20
Timer.Text = "الوقت: 0ي | 0س | 0د | 0ث"

local startTime = tick()
spawn(function()
    while task.wait(1) do
        local t = tick() - startTime
        local days = math.floor(t / 86400)
        local hours = math.floor((t % 86400)/3600)
        local mins = math.floor((t % 3600)/60)
        local secs = math.floor(t % 60)
        Timer.Text = "الوقت: "..days.."ي | "..hours.."س | "..mins.."د | "..secs.."ث"
    end
end)

-- CLOSE BUTTON
local Close = Instance.new("TextButton", Main)
Close.Size = UDim2.new(0,40,0,40)
Close.Position = UDim2.new(1,-50,0,5)
Close.Text = "X"
Close.BackgroundColor3 = Color3.fromRGB(50,50,50)
Close.TextColor3 = Color3.fromRGB(255,255,255)
Close.Font = Enum.Font.GothamBlack
Close.TextSize = 18
Instance.new("UICorner", Close)

Close.MouseButton1Click:Connect(function()
    Gui:Destroy()
end)

-- 🔹 زر فتح/غلق السكربت بالـ ASSET ID 🔹
local ToggleButton = Instance.new("ImageButton", Player:WaitForChild("PlayerGui"))
ToggleButton.Size = UDim2.new(0,50,0,50)
ToggleButton.Position = UDim2.new(0,10,0,10)
ToggleButton.Image = "rbxassetid://136110674199110"
ToggleButton.BackgroundTransparency = 1

local Visible = true
ToggleButton.MouseButton1Click:Connect(function()
    Visible = not Visible
    Main.Visible = Visible
end)

-- OPEN PASTE BIN UI + SET ROLEPLAY NAME/COLOR
local function OpenPasteUI()
    loadstring(game:HttpGet("https://pastebin.com/raw/gqkegzgc"))()
    
    local argsName = {
        "RolePlayName",
        "A3 HUB BY KOLMBY and ABDO"
    }
    ReplicatedStorage:WaitForChild("RE"):WaitForChild("1RPNam1eTex1t"):FireServer(unpack(argsName))

    local argsColor = {
        "PickingRPNameColor",
        Color3.new(0.7556330561637878, 0, 0.00002125852188328281)
    }
    ReplicatedStorage:WaitForChild("RE"):WaitForChild("1RPNam1eColo1r"):FireServer(unpack(argsColor))
end

-- AUTO OPEN WHEN SCRIPT RUN
OpenPasteUI()

-- RAINBOW EFFECT
local rainbowColors = {
    Color3.fromRGB(255,255,0),
    Color3.fromRGB(255,0,0),
    Color3.fromRGB(0,120,255),
    Color3.fromRGB(255,105,180),
    Color3.fromRGB(180,0,255),
    Color3.fromRGB(0,0,0),
    Color3.fromRGB(255,255,255)
}
spawn(function()
    local i = 1
    while task.wait(2) do
        i = i + 1
        if i > #rainbowColors then i = 1 end
        Stroke.Color = rainbowColors[i]
        Logo.TextColor3 = rainbowColors[i]
        CounterText.TextColor3 = rainbowColors[i]
        Timer.TextColor3 = rainbowColors[i]
    end
end)

-- 🔥 ANTI‑AFK SYSTEM
spawn(function()
    while true do
        task.wait(19 * 60)
        local char = Player.Character or Player.CharacterAdded:Wait()
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.Jump = true
            task.wait(0.1)
            humanoid.Jump = false
        end
    end
end)

]])()