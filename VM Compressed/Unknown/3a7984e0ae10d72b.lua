--------------------------------------------------
-- Babaa UI | اختيار الواجهة
--------------------------------------------------

local Player = game.Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "BabaaSelectUI"
gui.Parent = Player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false

-- الإطار الرئيسي
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 320, 0, 180)
frame.Position = UDim2.new(0.5, -160, 0.5, -90)
frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

-- العنوان
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,40)
title.BackgroundTransparency = 1
title.Text = "اختر واجهتك 👑"
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = Color3.fromRGB(255,215,0)

-- زر الواجهة القديمة
local oldBtn = Instance.new("TextButton", frame)
oldBtn.Size = UDim2.new(0.8,0,0,45)
oldBtn.Position = UDim2.new(0.1,0,0.35,0)
oldBtn.Text = "🔵 الواجهة القديمة"
oldBtn.Font = Enum.Font.GothamSemibold
oldBtn.TextSize = 16
oldBtn.TextColor3 = Color3.fromRGB(255,255,255)
oldBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
oldBtn.BorderSizePixel = 0
Instance.new("UICorner", oldBtn).CornerRadius = UDim.new(0, 10)

-- زر الواجهة الجديدة
local newBtn = Instance.new("TextButton", frame)
newBtn.Size = UDim2.new(0.8,0,0,45)
newBtn.Position = UDim2.new(0.1,0,0.65,0)
newBtn.Text = "🟢 الواجهة الجديدة"
newBtn.Font = Enum.Font.GothamSemibold
newBtn.TextSize = 16
newBtn.TextColor3 = Color3.fromRGB(255,255,255)
newBtn.BackgroundColor3 = Color3.fromRGB(0,120,60)
newBtn.BorderSizePixel = 0
Instance.new("UICorner", newBtn).CornerRadius = UDim.new(0, 10)

--------------------------------------------------
-- الوظائف
--------------------------------------------------

oldBtn.MouseButton1Click:Connect(function()
	gui:Destroy()
	loadstring(game:HttpGet("https://pastebin.com/raw/Wjtcevjq"))()
end)

newBtn.MouseButton1Click:Connect(function()
	gui:Destroy()
	loadstring(game:HttpGet("https://pastebin.com/raw/vEahrg9F"))()
end)

--------------------------------------------------
print("Babaa UI Selector Loaded ✅")