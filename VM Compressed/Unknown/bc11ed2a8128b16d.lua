local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
	Name = "Skibidi Toilet: City invasion",
	LoadingTitle = "Rayfield Interface Suite",
	LoadingSubtitle = "",
	ConfigurationSaving = {
		Enabled = false,
		FolderName = "Rayfield Interface Suite",
		FileName = "Big Hub"
	},
	KeySystem = false, -- Set this to true to use their key system
	KeySettings = {
		Title = "Sirius Hub",
		Subtitle = "Key System",
		Note = "Join the discord (discord.gg/sirius)",
		SaveKey = true,
		Key = "ABCDEF"
	}
})

Rayfield:Notify("Skibidi Toilet: City invasion   Script", "Content/Description Example", 4483362458) -- Notfication -- Title, Content, Image

local Tab = Window:CreateTab("Characters", 4483362458) -- Title, Image

local Section = Tab:CreateSection("Characters")

local Button = Tab:CreateButton({
	Name = "Cinemaman",
	Callback = function()
		local args = {
    [1] = "Titan Cinemaman",
    [2] = "G@16$#!:f#",
    [3] = "spawn"
}

game:GetService("ReplicatedStorage").Events.CharacterEvent:FireServer(unpack(args))
	end,
})

local Button = Tab:CreateButton({
	Name = "Titan TV Man",
	Callback = function()
		local args = {
    [1] = "Titan Tvman",
    [2] = "G@16$#!:f#",
    [3] = "spawn"
}

game:GetService("ReplicatedStorage").Events.CharacterEvent:FireServer(unpack(args))
	end,
})

local Button = Tab:CreateButton({
	Name = "Upgraded Titan Speaker Man",
	Callback = function()
		local args = {
    [1] = "Upgraded Titan Speakerman",
    [2] = "G@16$#!:f#",
    [3] = "spawn"
}

game:GetService("ReplicatedStorage").Events.CharacterEvent:FireServer(unpack(args))
	end,
})

local Button = Tab:CreateButton({
	Name = "Titan Cameraman",
	Callback = function()
		local args = {
    [1] = "Titan Cameraman",
    [2] = "G@16$#!:f#",
    [3] = "spawn"
}

game:GetService("ReplicatedStorage").Events.CharacterEvent:FireServer(unpack(args))
	end,
})

local Button = Tab:CreateButton({
	Name = "Titan Speakerman",
	Callback = function()
		local args = {
    [1] = "Titan Speakerman",
    [2] = "G@16$#!:f#",
    [3] = "spawn"
}

game:GetService("ReplicatedStorage").Events.CharacterEvent:FireServer(unpack(args))
	end,
})

local Button = Tab:CreateButton({
	Name = "Large Tvman",
	Callback = function()
		local args = {
    [1] = "Large Tvman",
    [2] = "G@16$#!:f#",
    [3] = "spawn"
}

game:GetService("ReplicatedStorage").Events.CharacterEvent:FireServer(unpack(args))
	end,
})

local Button = Tab:CreateButton({
	Name = "Speaker Strider",
	Callback = function()
		local args = {
    [1] = "Speaker Strider",
    [2] = "G@16$#!:f#",
    [3] = "spawn"
}

game:GetService("ReplicatedStorage").Events.CharacterEvent:FireServer(unpack(args))
	end,
})

local Button = Tab:CreateButton({
	Name = "Large Speakerman",
	Callback = function()
		local args = {
    [1] = "Large Speakerman",
    [2] = "G@16$#!:f#",
    [3] = "spawn"
}

game:GetService("ReplicatedStorage").Events.CharacterEvent:FireServer(unpack(args))
	end,
})

local Button = Tab:CreateButton({
	Name = "Camera Strider",
	Callback = function()
		local args = {
    [1] = "Camera Strider",
    [2] = "G@16$#!:f#",
    [3] = "spawn"
}

game:GetService("ReplicatedStorage").Events.CharacterEvent:FireServer(unpack(args))
	end,
})

local Button = Tab:CreateButton({
	Name = "Speakerman",
	Callback = function()
		local args = {
    [1] = "Speakerman",
    [2] = "G@16$#!:f#",
    [3] = "spawn"
}

game:GetService("ReplicatedStorage").Events.CharacterEvent:FireServer(unpack(args))
	end,
})

local Button = Tab:CreateButton({
	Name = "Tvman",
	Callback = function()
		local args = {
    [1] = "Tvman",
    [2] = "G@16$#!:f#",
    [3] = "spawn"
}

game:GetService("ReplicatedStorage").Events.CharacterEvent:FireServer(unpack(args))
	end,
})