-- [[ GLEB HUB V10 ]]
-- by Irfannnnn by gleba871 "Roblox"

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local pGui = player:WaitForChild("PlayerGui")

-- ТВОЙ ПОЛНЫЙ СПИСОК СКРИПТОВ
local Scripts = {
    {n = "👺 MORPH (gObl00x)", c = "https://raw.githubusercontent.com/dksks8282/GlebScripts/refs/heads/main/hub%20morph%20gObl00x"},
    {n = "👾 FE CUBE MONSTER V9", c = "https://rawscripts.net/raw/UP-Just-a-baseplate.-FE-CUBE-MONSTER-128347"},
    {n = "🚀 Mobile Fly V5", c = "https://rawscripts.net/raw/Universal-Script-Gleb-Hub-V5-Mobile-Fly-Joystick-Up-Down-110267"},
    {n = "🦘 Endless Jump", c = "https://rawscripts.net/raw/UP-Just-a-baseplate.-endless-jumping-Russia-110337"},
    {n = "🎵 Cool Music", c = "https://rawscripts.net/raw/UP-Just-a-baseplate.-Cool-music-110555"},
    {n = "📋 Copy Name", c = "https://rawscripts.net/raw/UP-Just-a-baseplate.-copy-player-name-ru-110574"},
    {n = "🚩 FE Flags", c = "https://rawscripts.net/raw/UP-Just-a-baseplate.-fe-flagi-ru-110986"},
    {n = "⚙️ ESC GUI", c = "https://rawscripts.net/raw/Universal-Script-ESC-GUI-ru-RU-112817"},
    {n = "⚔️ Sword Script", c = "https://rawscripts.net/raw/UP-Just-a-baseplate.-sword-script-127007"},
    {n = "🗡️ Sword V2", c = "https://rawscripts.net/raw/UP-Just-a-baseplate.-sword-v2-Large-hitboxes-127497"},
    {n = "🔫 Laser Gun", c = "https://rawscripts.net/raw/UP-Just-a-baseplate.-laser-gun-beta-127500"},
    {n = "💣 Bomb Script", c = "https://rawscripts.net/raw/UP-Just-a-baseplate.-Bomb-127636"},
    {n = "⏳ Time Stop", c = "https://rawscripts.net/raw/UP-Just-a-baseplate.-Stopping-time-and-bomb-128246"},
    {n = "🎮 Keyboard DELTA", c = "https://rawscripts.net/raw/Universal-Script-delta-keyboard-crack-reupload-20074"}
}

-- Удаление старого
if pGui:FindFirstChild("GlebHubV10") then pGui.GlebHubV10:Destroy() end
local sg = Instance.new("ScreenGui", pGui); sg.Name = "GlebHubV10"

-- ГЛАВНОЕ ОКНО
local frame = Instance.new("Frame", sg)
frame.Size = UDim2.new(0, 420, 0, 360)
frame.Position = UDim2.new(0.5, -210, 0.5, -180)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.Active = true; frame.Draggable = true; frame.Visible = false
Instance.new("UICorner", frame)

-- КНОПКА gObl00x (КРУГ)
local openBtn = Instance.new("TextButton", sg)
openBtn.Size = UDim2.new(0, 75, 0, 75); openBtn.Position = UDim2.new(0, 15, 0.5, -37)
openBtn.Text = "gObl00x"; openBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
openBtn.TextColor3 = Color3.new(1, 1, 1); openBtn.Draggable = true
openBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", openBtn).CornerRadius = UDim.new(1, 0)
openBtn.MouseButton1Click:Connect(function() frame.Visible = not frame.Visible end)

-- ЗАГОЛОВОК (ОГРОМНЫЙ)
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 70); title.Position = UDim2.new(0, 0, 0, 5)
title.Text = "GLEB HUB V10\nby Irfannnnn by gleba871 \"Roblox\""
title.TextScaled = true; title.TextColor3 = Color3.new(1,1,1); title.BackgroundTransparency = 1; title.Font = Enum.Font.GothamBold

-- СПИСОК СКРИПТОВ
local scroll = Instance.new("ScrollingFrame", frame)
scroll.Size = UDim2.new(0.9, 0, 0.75, 0); scroll.Position = UDim2.new(0.05, 0, 0.2, 0)
scroll.CanvasSize = UDim2.new(0, 0, 3, 0); scroll.BackgroundTransparency = 1; scroll.ScrollBarThickness = 2
local grid = Instance.new("UIGridLayout", scroll)
grid.CellSize = UDim2.new(0.48, 0, 0, 45)

for _, d in pairs(Scripts) do
    local b = Instance.new("TextButton", scroll)
    b.Text = d.n; b.BackgroundColor3 = Color3.fromRGB(40, 40, 50); b.TextColor3 = Color3.new(1,1,1)
    b.Font = Enum.Font.Gotham
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function() loadstring(game:HttpGet(d.c))() end)
end
