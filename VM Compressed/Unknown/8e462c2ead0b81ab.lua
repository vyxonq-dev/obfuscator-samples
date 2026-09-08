local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Window = Library:NewWindow("Script")
 
local Tab = Window:NewSection("Credits: TGMANKASKE")
 
Tab:CreateButton("Get Best Power", function()
print("Give credits to KMAN || KontrollAll || TGMANKASKE")

local args = {
	"Gust",
	game:GetService("Players").LocalPlayer.Character
}
game:GetService("ReplicatedStorage"):WaitForChild("Event"):WaitForChild("EquipEffect"):FireServer(unpack(args))

end)

Tab:CreateButton("Get Rebirth", function()
print("Give credits to KMAN || KontrollAll || TGMANKASKE")

local args = {
	0
}
game:GetService("ReplicatedStorage"):WaitForChild("Event"):WaitForChild("HealthAdd"):FireServer(unpack(args))

end)

Tab:CreateButton("Enchant Weapon", function()
print("Give credits to KMAN || KontrollAll || TGMANKASKE")

local args = {
	1,
	999
}
game:GetService("ReplicatedStorage"):WaitForChild("Event"):WaitForChild("Enchanted"):FireServer(unpack(args))

end)


Tab:CreateToggle("Inf. Strenght", function(no)
_G.GetWins = no
while _G.GetWins== true do
    wait() 
print("Give credits to KMAN || KontrollAll || TGMANKASKE")


local args = {
	999999999999999999999999
}
game:GetService("ReplicatedStorage"):WaitForChild("Event"):WaitForChild("Train"):FireServer(unpack(args))

end
end)


Tab:CreateToggle("Inf. Money", function(no)
_G.GetWins = no
while _G.GetWins== true do
    wait() 
print("Give credits to KMAN || KontrollAll || TGMANKASKE")

local args = {
	999999999999999999999999
}
game:GetService("ReplicatedStorage"):WaitForChild("Event"):WaitForChild("WinGain"):FireServer(unpack(args))
end
end)


local Tab = Window:NewSection("Links")
 
Tab:CreateButton("Discord Group", function()
print("HI")
 
setclipboard("https://discord.gg/8A6k73JqCM")
toclipboard("https://discord.gg/8A6k73JqCM")
 
end)
 
Tab:CreateButton("Youtube", function()
print("HI")
 
setclipboard("https://www.youtube.com/@TGMANKASKE")
toclipboard("https://www.youtube.com/@TGMANKASKE")
 
end)
