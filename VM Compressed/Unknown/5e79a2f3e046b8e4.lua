local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/turtle"))()

local OwO = library:Window("OP SCRIPT")

OwO:Button("Inf strength", function()
while true do
local args = {
    [1] = 100000000000000000000000000000
}

game:GetService("ReplicatedStorage").Event.Train:FireServer(unpack(args))
wait(0)
end
end)
OwO:Button("Inf wins", function()
local args = {
    [1] = 9999999999999999999999999999
}

game:GetService("ReplicatedStorage").Event.WinGain:FireServer(unpack(args))
end)
OwO:Button("get best aura(OP)", function()
local args = {
    [1] = "Gust",
    [2] = 0
}

game:GetService("ReplicatedStorage").Event.BuyPower:FireServer(unpack(args))
end)
OwO:Button("auto rebirth", function()
while true do
local args = {
    [1] = 0
}

game:GetService("ReplicatedStorage").Event.HealthAdd:FireServer(unpack(args))
wait(0)
end
end)
OwO:Button("get best pet", function()
local args = {
    [1] = "Abyss",
    [2] = "Phoenix",
    [3] = 140000
}

game:GetService("ReplicatedStorage").PEV.Hatch:FireServer(unpack(args))
end)
OwO:Button("made by @gigiscripts", function()
   print("pressed button")
end)