
local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Window = Library:NewWindow("Free Sworld")
 
local Tab = Window:NewSection("Credits: TGMANKASKE")
 
Tab:CreateButton("Mystic Reaper", function()
print("NIGGER")

local args = {
	"Mystic Reaper"
}
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("AddWeaponToBase"):FireServer(unpack(args))

end)

Tab:CreateButton("Bloodvine Axe", function()
print("HI")

local args = {
	"Bloodvine Axe"
}
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("AddWeaponToBase"):FireServer(unpack(args))

end)

Tab:CreateButton("Ice Blade", function()
print("HI")

local args = {
	"Ice Blade"
}
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("AddWeaponToBase"):FireServer(unpack(args))

end)


   local Tab = Window:NewSection("Links")

Tab:CreateButton("Discord GP", function()

  setclipboard('https://discord.gg/esYJzYnsfC')

end)
                     
Tab:CreateButton("Youtube CH", function()

  setclipboard('https://www.youtube.com/@TGMANKASKE')

end)              
