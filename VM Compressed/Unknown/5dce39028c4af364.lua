local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local window = lib:NewWindow("SlashMobsSim")

local Cheats = window:NewSection("Cheats")

Cheats:CreateButton("Get 10000 Exp (WILL REJOIN YOU)", function()
for i=0,5000 do
game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Fight"):WaitForChild("[C-S]TakeExp"):FireServer()
    end

local gui = Instance.new("ScreenGui")
gui.Parent = game.Players.LocalPlayer.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(1, 0, 1, 0)
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.BorderSizePixel = 0
frame.Transparency = 0.75
frame.Parent = gui

local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 1, 0)
label.Font = Enum.Font.SourceSansBold
label.FontSize = Enum.FontSize.Size48
label.TextColor3 = Color3.new(1, 1, 1)
label.TextStrokeColor3 = Color3.new(0, 0, 0)
label.TextStrokeTransparency = 0
label.Transparency = 0.75
label.Text = "Rejoining And Adding 10K Exp"
label.Parent = frame

game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)

while wait(0.5) do

if label.Text == "Rejoining And Adding 10K Exp..." then
label.Text = "Rejoining And Adding 10K Exp"
else
label.Text = label.Text .. "."
end
end
end)

Cheats:CreateButton("Fix Exp Not Giving Levels", function()
game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("game"):WaitForChild("[C-S]PlayerTryLevelUp"):FireServer()
end)

Cheats:CreateButton("Immortality Healing (Perm)", function()
while wait() do
local args = {
    [1] = 1
}

game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Up"):WaitForChild("[C-S]TryRegen"):FireServer(unpack(args))
end
end)
