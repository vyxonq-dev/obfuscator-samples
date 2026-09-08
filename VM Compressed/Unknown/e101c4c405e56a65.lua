local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Window = Library:NewWindow("Xd | Hub v1")

local Tab = Window:NewSection("Main")

Tab:CreateButton("Auto lock base", function()
while true do
game:GetService("ReplicatedStorage").Remotes.Server.LockGate:FireServer()
wait(0)
end
end)
Tab:CreateButton("slap all(hold the slap)", function()
while true do
local Players = game:GetService("Players")
local targetPosition = Vector3.new(9.831446647644043, 8.448242851955001e-07, -1.8282928466796875)
local localCharacter = Players.LocalPlayer.Character
local slapEvent = localCharacter:FindFirstChild("Basic Slap")

for _, player in ipairs(Players:GetPlayers()) do
    if player.Character and player ~= Players.LocalPlayer then
        local args = {
            [1] = player.Character,
            [2] = targetPosition
        }
        slapEvent.Event:FireServer(unpack(args))
    end
end
wait(0)
end
end)