local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Window = Library:NewWindow("Script")
 
local Tab = Window:NewSection("Credits: TGMANKASKE")

Tab:CreateButton("Inf. Money", function()

local args = {
	"Thx Brother",
	-9e9
}
game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("Buy"):FireServer(unpack(args))

end)

Tab:CreateButton("Give Best Miner", function()

local args = {
	"Crystal Miner",
	0
}
game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("Buy"):FireServer(unpack(args))

end)

Tab:CreateButton("Get All Upgrades", function()

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local buyRemote = ReplicatedStorage:WaitForChild("RemoteEvents"):WaitForChild("Buy")

local itemNames = {
    "Cool Worker",
    "Aurorify",
    "Chargify",
    "Cosmify",
    "Flamify",
    "Freezify",
    "Glowify",
    "Goldify",
    "Royalify"
}

for _, itemName in ipairs(itemNames) do
    local args = { itemName, 0 }
    buyRemote:FireServer(unpack(args))
    print("Purchased:", itemName)
    wait(0.3)
end
end)


   local Tab = Window:NewSection("Links")

Tab:CreateButton("Discord GP", function()

  setclipboard('https://discord.gg/esYJzYnsfC')

end)
                     
Tab:CreateButton("Youtube CH", function()

  setclipboard('https://www.youtube.com/@TGMANKASKE')

end)              

