local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()

local PhantomForcesWindow = Library:NewWindow("Be A Brainrot💾")

local KillingCheats = PhantomForcesWindow:NewSection("Auto Farm📟")

KillingCheats:CreateButton("Teleport Best Base📂", function()
local player = game.Players.LocalPlayer.Character
local target = workspace.BaseZones.base15
if player and target then
player:PivotTo(target:GetPivot())
end
end)

KillingCheats:CreateButton("Auto Get Brainrot🕊️", function()
local player2 = game.Players.LocalPlayer.Character
local target2 = workspace.Plots["1"]
if player2 and target2 then
player2:PivotTo(target2:GetPivot())
end
end)

local credits = PhantomForcesWindow:NewSection("Credits🧑‍💻")

credits:CreateButton("Credits: WhiteScripter👑", function()
print("HI")
end)