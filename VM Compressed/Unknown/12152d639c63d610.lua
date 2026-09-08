local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Window = Library:NewWindow("Seed | Spawner")

local Tab = Window:NewSection("Infinite%")

Tab:CreateButton("Get void tree seed", function()
local args = {
    [1] = "Void Tree",
    [2] = 0
}

game:GetService("ReplicatedStorage").Events.Buy_Seed:FireServer(unpack(args))
end)
Tab:CreateButton("get jungle tree seed", function()
local args = {
    [1] = "Jungle Tree",
    [2] = 0
}

game:GetService("ReplicatedStorage").Events.Buy_Seed:FireServer(unpack(args))
end)
Tab:CreateButton("Get fern seed", function()
local args = {
    [1] = "Fern",
    [2] = 0
}

game:GetService("ReplicatedStorage").Events.Buy_Seed:FireServer(unpack(args))
end)
Tab:CreateButton("get Bamboo seed", function()
print("hello")
end)
Tab:CreateButton("get Cyca palm seed", function()
local args = {
    [1] = "Cyca palm",
    [2] = 0
}

game:GetService("ReplicatedStorage").Events.Buy_Seed:FireServer(unpack(args))
end)
Tab:CreateButton("get Small Acacia seed", function()
local args = {
    [1] = "small acacia",
    [2] = 0
}

game:GetService("ReplicatedStorage").Events.Buy_Seed:FireServer(unpack(args))
end)
Tab:CreateButton("Rain Tree", function()
local args = {
    [1] = "Rain Tree",
    [2] = 0
}

game:GetService("ReplicatedStorage").Events.Buy_Seed:FireServer(unpack(args))
end)
Tab:CreateButton("Kapok", function()
local args = {
    [1] = "Kapok",
    [2] = 0
}

game:GetService("ReplicatedStorage").Events.Buy_Seed:FireServer(unpack(args))
end)
Tab:CreateButton("Acacia", function()
local args = {
    [1] = "Acacia",
    [2] = 0
}

game:GetService("ReplicatedStorage").Events.Buy_Seed:FireServer(unpack(args))
end)
Tab:CreateButton("HUGE Kapok", function()
local args = {
    [1] = "HUGE Kapok",
    [2] = 0
}

game:GetService("ReplicatedStorage").Events.Buy_Seed:FireServer(unpack(args))
end)
Tab:CreateButton("Venus FlyTrap", function()
local args = {
    [1] = "Venus FlyTrap",
    [2] = 0
}

game:GetService("ReplicatedStorage").Events.Buy_Seed:FireServer(unpack(args))
end)
Tab:CreateButton("Mushrooms", function()
local args = {
    [1] = "Mushrooms",
    [2] = 0
}

game:GetService("ReplicatedStorage").Events.Buy_Seed:FireServer(unpack(args))
end)
Tab:CreateButton("Toxic acacia", function()
local args = {
    [1] = "Toxic acacia",
    [2] = 0
}

game:GetService("ReplicatedStorage").Events.Buy_Seed:FireServer(unpack(args))
end)