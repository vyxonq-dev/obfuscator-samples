


local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()

local PhantomForcesWindow = Library:NewWindow("Troll Slapping Tower")

local Free = PhantomForcesWindow:NewSection("Free Gamepass")

Free:CreateButton("Get Streak Slap", function()
local args = {
	"StreakSlap"
}
game:GetService("ReplicatedStorage"):WaitForChild("EquipSlapEvent"):FireServer(unpack(args))
end)
Free:CreateButton("Get Galaxy Slap", function()
local args = {
	"GalaxySlap"
}
game:GetService("ReplicatedStorage"):WaitForChild("EquipSlapEvent"):FireServer(unpack(args))
end)
Free:CreateButton("Get God's Hand Slap", function()
local args = {
	"God's Hand"
}
game:GetService("ReplicatedStorage"):WaitForChild("EquipSlapEvent"):FireServer(unpack(args))
end)
local Credit = PhantomForcesWindow:NewSection("Credit")
Credit:CreateButton("TIKTOK:idk32515", function()
print("follow user:idk32515")
end)