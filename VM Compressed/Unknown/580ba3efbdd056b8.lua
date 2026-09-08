local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()

local PhantomForcesWindow = Library:NewWindow("TGMANKASKE")

local WeLoveCat= PhantomForcesWindow:NewSection("Scripts by TG")

WeLoveCat:CreateButton("Auto win", function()
print("HI")

while true do
wait(0.001)
local args = {
    [1] = true
}

game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Fight"):FireServer(unpack(args))
end
end)

WeLoveCat:CreateButton("Fast auto click", function()
print("HI")

while true do
wait(0.0001)
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Click"):FireServer()
end
end)

WeLoveCat:CreateButton("Click for Rebirth", function()
print("HI")

game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Rebirth"):FireServer()
end)

WeLoveCat:CreateButton("Auto Rebirth", function()
print("HI")

while true do
wait(0.001)
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Rebirth"):FireServer()
end
end)

local WeLoveCat= PhantomForcesWindow:NewSection("Links")

WeLoveCat:CreateButton("Discord Group", function()
print("HI")

setclipboard("https://discord.gg/8A6k73JqCM")
toclipboard("https://discord.gg/8A6k73JqCM")

end)

WeLoveCat:CreateButton("YT Channel", function()
print("HI")

setclipboard("https://www.youtube.com/@TGMANKASKE")
toclipboard("https://www.youtube.com/@TGMANKASKE")

end)

WeLoveCat:CreateButton("Tiktok PF", function()
print("HI")

setclipboard("https://www.tiktok.com/@kman.rs")
toclipboard("https://www.tiktok.com/@kman.rs")

end)
