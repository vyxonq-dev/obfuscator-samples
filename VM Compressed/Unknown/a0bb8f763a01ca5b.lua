local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Window = Library:NewWindow("Script")
 
local Tab = Window:NewSection("Credits: TGMANKASKE")

Tab:CreateToggle("Inf everything", function(no)
_G.Getsd = no
while _G.Getsd== true do
    wait() 

local args = {
	"MadeVideoManually"
}
game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent_3"):FireServer(unpack(args))

local args = {
	"MadeVideoManually"
}
game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent_3"):FireServer(unpack(args))


end
end)

Tab:CreateToggle("Auto Rebirth", function(no)
_G.Getsdd = no
while _G.Getsdd== true do
    wait() 

local args = {
	"BuyRebirth",
	2
}
game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent_3"):FireServer(unpack(args))



end
end)                 

Tab:CreateToggle("Auto Upgrade All", function(no)
_G.Getsds = no
while _G.Getsds== true do
    wait() 

local args = {
	"Upgrade",
	"Wifi"
}
game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent_4"):FireServer(unpack(args))

local args = {
	"Upgrade",
	"ManualRev"
}
game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent_1"):FireServer(unpack(args))

local args = {
	"Upgrade",
	"FriendRev"
}
game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent_2"):FireServer(unpack(args))

end
end)


   local Tab = Window:NewSection("Links")

Tab:CreateButton("Discord GP", function()

  setclipboard('https://discord.gg/esYJzYnsfC')

end)
                     
Tab:CreateButton("Youtube CH", function()

  setclipboard('https://www.youtube.com/@TGMANKASKE')

end)              
