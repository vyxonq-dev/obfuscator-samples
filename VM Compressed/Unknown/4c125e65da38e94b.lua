local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
-- im so awesome i made another gui yall
-- by kitrthecat on discord
local Window = Rayfield:CreateWindow({
	Name = "SFTB Spawn Monsters Gui",
	Icon = 0,
	LoadingTitle = "SFTB Spawn Monstsers",
	Theme = "Default",

	DisableRayfieldPrompts = false,
	DisableBuildWarnings = false,
})

local Tab1 = Window:CreateTab("Spawn Normal Monsters", "Wrench")
local Tab2 = Window:CreateTab("Spawn Admin Monsters", "Wrench")

local Button = Tab1:CreateButton({
	Name = "BobetteMonster",
	Callback = function()
	local arg3 = "BobbeteMonster"
local SpawnBobette = game.ReplicatedStorage:FindFirstChild("SpawnBobette")
game.ReplicatedStorage.SpawnBobbete:FireServer(arg3)
	end,
})

local Button2 = Tab1:CreateButton({
	Name = "AstroMonster",
	Callback = function()
	local arg3 = "AstroMonster"
local SpawnBobette = game.ReplicatedStorage:FindFirstChild("SpawnBobette")
game.ReplicatedStorage.SpawnBobbete:FireServer(arg3)
	end,
})

local Button3 = Tab1:CreateButton({
	Name = "PebbleMonster",
	Callback = function()
	local arg3 = "PebbleMonster"
local SpawnBobette = game.ReplicatedStorage:FindFirstChild("SpawnBobette")
game.ReplicatedStorage.SpawnBobbete:FireServer(arg3)
	end,
})

local Button4 = Tab1:CreateButton({
	Name = "ShellyMonster",
	Callback = function()
	local arg3 = "ShellyMonster"
local SpawnBobette = game.ReplicatedStorage:FindFirstChild("SpawnBobette")
game.ReplicatedStorage.SpawnBobbete:FireServer(arg3)
	end,
})


local Button5 = Tab1:CreateButton({
	Name = "SproutMonster",
	Callback = function()
	local arg3 = "SproutMonster"
local SpawnBobette = game.ReplicatedStorage:FindFirstChild("SpawnBobette")
game.ReplicatedStorage.SpawnBobbete:FireServer(arg3)
	end,
})

local Button6 = Tab1:CreateButton({
	Name = "VeeMonster",
	Callback = function()
	local arg3 = "VeeMonster"
local SpawnBobette = game.ReplicatedStorage:FindFirstChild("SpawnBobette")
game.ReplicatedStorage.SpawnBobbete:FireServer(arg3)
	end,
})

local Button7 = Tab1:CreateButton({
	Name = "DandyMonster",
	Callback = function()
	local arg3 = "DandyMonster"
local SpawnBobette = game.ReplicatedStorage:FindFirstChild("SpawnBobette")
game.ReplicatedStorage.SpawnBobbete:FireServer(arg3)
	end,
})

local Button8 = Tab2:CreateButton({
	Name = "The Rakoof",
	Callback = function()
	local arg3 = "The_RakeNoob"
local SpawnBobette = game.ReplicatedStorage:FindFirstChild("SpawnBobette")
game.ReplicatedStorage.SpawnBobbete:FireServer(arg3)
	end,
})
