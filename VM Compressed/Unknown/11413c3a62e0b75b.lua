local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Window = Library:NewWindow("Script")
 
local Tab = Window:NewSection("Credits: TGMANKASKE")

Tab:CreateToggle("Inf Money", function(no)
_G.Getsd = no
while _G.Getsd== true do
    wait() 

local args = {
	{
		["\003"] = {
			{
				"Reward4"
			}
		}
	},
	{}
}
game:GetService("ReplicatedStorage"):WaitForChild("RedEvent"):FireServer(unpack(args))


end
end)

Tab:CreateButton("Get BMW1200", function()

local args = {
	{
		["\a"] = {
			{
				"You have successfully purchased this vehicle!",
				10,
				true
			}
		},
		["\004"] = {
			{
				"Comprar",
				"BMW 1200",
				0
			}
		}
	},
	{}
}
game:GetService("ReplicatedStorage"):WaitForChild("RedEvent"):FireServer(unpack(args))

end)

Tab:CreateButton("Get S1000R", function()


local args = {
	{
		["\a"] = {
			{
				"You have successfully purchased this vehicle!",
				10,
				true
			}
		},
		["\004"] = {
			{
				"Comprar",
				"S1000R",
				0
			}
		}
	},
	{}
}
game:GetService("ReplicatedStorage"):WaitForChild("RedEvent"):FireServer(unpack(args))

end)


   local Tab = Window:NewSection("Links")

Tab:CreateButton("Discord GP", function()

  setclipboard('https://discord.gg/esYJzYnsfC')

end)
                     
Tab:CreateButton("Youtube CH", function()

  setclipboard('https://www.youtube.com/@TGMANKASKE')

end)          
