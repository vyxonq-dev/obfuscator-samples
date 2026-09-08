--// DRAGON CHAT MODERN LOADER //--
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

-- Eski varsa temizle
if CoreGui:FindFirstChild("DragonLoader") then CoreGui.DragonLoader:Destroy() end

--// UI OLUŞTURMA //--
local loaderGui = Instance.new("ScreenGui", CoreGui)
loaderGui.Name = "DragonLoader"

local main = Instance.new("Frame", loaderGui)
main.Size = UDim2.new(0, 300, 0, 150)
main.Position = UDim2.new(0.5, -150, 0.5, -75)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
main.BorderSizePixel = 0
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 10)

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 50)
title.Text = "🐉 DRAGON CHAT V1"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.BackgroundTransparency = 1

local status = Instance.new("TextLabel", main)
status.Size = UDim2.new(1, 0, 0, 30)
status.Position = UDim2.new(0, 0, 0.5, 0)
status.Text = "Checking Version..."
status.TextColor3 = Color3.fromRGB(180, 180, 180)
status.Font = Enum.Font.Gotham
status.TextSize = 14
status.BackgroundTransparency = 1

local barBg = Instance.new("Frame", main)
barBg.Size = UDim2.new(0.8, 0, 0, 6)
barBg.Position = UDim2.new(0.1, 0, 0.8, 0)
barBg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
barBg.BorderSizePixel = 0
Instance.new("UICorner", barBg)

local barFill = Instance.new("Frame", barBg)
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Ejderha Kırmızısı
barFill.BorderSizePixel = 0
Instance.new("UICorner", barFill)

--// LOADING LOGIC //--
local function update(txt, percent)
    status.Text = txt
    TweenService:Create(barFill, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {Size = UDim2.new(percent, 0, 1, 0)}):Play()
end

-- Simülasyon Adımları
task.wait(0.5)
update("Connecting to Servers...", 0.3)
task.wait(0.8)
update("Loading UI Elements...", 0.6)
task.wait(0.5)
update("Finalizing...", 1)
task.wait(0.5)

-- Ana Scripti Başlat
loaderGui:Destroy()
loadstring(game:HttpGet("https://pastebin.com/raw/dypme8db"))()