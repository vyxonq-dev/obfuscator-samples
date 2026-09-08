local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Mutant Testing Reborn Hub V4", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({
	Name = "Spawning",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Spawn Exclusive Mutants"
})


Tab:AddButton({
	Name = "Spawn Mutant Monstrosity (8k sp)",
	Callback = function()
      		print("button pressed")
	  local args = {
	"SpawnUnit",
	{
		Team = "Zombies",
		Torso = game:GetService("Players").LocalPlayer.Character:WaitForChild("Torso"),
		Armor = "None",
		Unit = "Mutant Monstrosity"
	}
}
game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("SpawnMenu"):WaitForChild("GuiFunction"):InvokeServer(unpack(args))

  	end    
})


Tab:AddButton({
	Name = "Spawn Raig Nest",
	Callback = function()
      		print("button pressed")
	  local args = {
	"SpawnUnit",
	{
		Team = "Raig",
		Torso = game:GetService("Players").LocalPlayer.Character:WaitForChild("Torso"),
		Armor = "None",
		Unit = "Diabolical Hivemind"
	}
}
game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("SpawnMenu"):WaitForChild("GuiFunction"):InvokeServer(unpack(args))

  	end    
})

Tab:AddButton({
	Name = "Spawn Trooper",
	Callback = function()
      		print("button pressed")
		local args = {
	"SpawnUnit",
	{
		Team = "Humans",
		Torso = game:GetService("Players").LocalPlayer.Character:WaitForChild("Torso"),
		Armor = "None",
		Unit = "Trooper"
	}
}
game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("SpawnMenu"):WaitForChild("GuiFunction"):InvokeServer(unpack(args))

  	end    
})


 local Section = Tab:AddSection({
	Name = "Spawn Human DLC Units"
})


Tab:AddButton({
	Name = "Spawn Husky",
	Callback = function()
      		print("button pressed")
		local args = {
	"SpawnUnit",
	{
		Team = "Humans",
		Torso = game:GetService("Players").LocalPlayer.Character:WaitForChild("Torso"),
		Armor = "None",
		Unit = "Husky"
	}
}
game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("SpawnMenu"):WaitForChild("GuiFunction"):InvokeServer(unpack(args))

  	end    
})


Tab:AddButton({
	Name = "Spawn Cadet",
	Callback = function()
      		print("button pressed")
		local args = {
	"SpawnUnit",
	{
		Team = "Humans",
		Torso = game:GetService("Players").LocalPlayer.Character:WaitForChild("Torso"),
		Armor = "None",
		Unit = "Cadet"
	}
}
game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("SpawnMenu"):WaitForChild("GuiFunction"):InvokeServer(unpack(args))

  	end    
})


Tab:AddButton({
	Name = "Spawn Government Agent",
	Callback = function()
      		print("button pressed")
		local args = {
	"SpawnUnit",
	{
		Team = "Humans",
		Torso = game:GetService("Players").LocalPlayer.Character:WaitForChild("Torso"),
		Armor = "None",
		Unit = "Government Agent"
	}
}
game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("SpawnMenu"):WaitForChild("GuiFunction"):InvokeServer(unpack(args))

  	end    
})


Tab:AddButton({
	Name = "Spawn Insane Fighter",
	Callback = function()
      		print("button pressed")
		local args = {
	"SpawnUnit",
	{
		Team = "Humans",
		Torso = game:GetService("Players").LocalPlayer.Character:WaitForChild("Torso"),
		Armor = "None",
		Unit = "Insane Fighter"
	}
}
game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("SpawnMenu"):WaitForChild("GuiFunction"):InvokeServer(unpack(args))

  	end    
})


Tab:AddButton({
	Name = "Spawn Vengeful",
	Callback = function()
      		print("button pressed")
		local args = {
	"SpawnUnit",
	{
		Team = "Humans",
		Torso = game:GetService("Players").LocalPlayer.Character:WaitForChild("Torso"),
		Armor = "None",
		Unit = "Vengeful"
	}
}
game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("SpawnMenu"):WaitForChild("GuiFunction"):InvokeServer(unpack(args))

  	end    
})


Tab:AddButton({
	Name = "Spawn Commanding Officer",
	Callback = function()
      		print("button pressed")
		local args = {
	"SpawnUnit",
	{
		Team = "Humans",
		Torso = game:GetService("Players").LocalPlayer.Character:WaitForChild("Torso"),
		Armor = "None",
		Unit = "Commanding Officer"
	}
}
game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("SpawnMenu"):WaitForChild("GuiFunction"):InvokeServer(unpack(args))

  	end    
})


Tab:AddButton({
	Name = "Spawn Protestor",
	Callback = function()
      		print("button pressed")
		local args = {
	"SpawnUnit",
	{
		Team = "Humans",
		Torso = game:GetService("Players").LocalPlayer.Character:WaitForChild("Torso"),
		Armor = "None",
		Unit = "Protestor"
	}
}
game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("SpawnMenu"):WaitForChild("GuiFunction"):InvokeServer(unpack(args))

  	end    
})


Tab:AddButton({
	Name = "Spawn Gangster",
	Callback = function()
      		print("button pressed")
		local args = {
	"SpawnUnit",
	{
		Team = "Humans",
		Torso = game:GetService("Players").LocalPlayer.Character:WaitForChild("Torso"),
		Armor = "None",
		Unit = "Gangster"
	}
}
game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("SpawnMenu"):WaitForChild("GuiFunction"):InvokeServer(unpack(args))

  	end    
})


Tab:AddButton({
	Name = "Spawn Builder",
	Callback = function()
      		print("button pressed")
		local args = {
	"SpawnUnit",
	{
		Team = "Humans",
		Torso = game:GetService("Players").LocalPlayer.Character:WaitForChild("Torso"),
		Armor = "None",
		Unit = "Builder"
	}
}
game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("SpawnMenu"):WaitForChild("GuiFunction"):InvokeServer(unpack(args))

  	end    
})


Tab:AddButton({
	Name = "Spawn Recruit",
	Callback = function()
      		print("button pressed")
		local args = {
	"SpawnUnit",
	{
		Team = "Humans",
		Torso = game:GetService("Players").LocalPlayer.Character:WaitForChild("Torso"),
		Armor = "None",
		Unit = "Recruit"
	}
}
game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("SpawnMenu"):WaitForChild("GuiFunction"):InvokeServer(unpack(args))

  	end    
})

local Tab = Window:MakeTab({
	Name = "Spawn More Mutants",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Raig DLC"
})


Tab:AddButton({
	Name = "Spawn Hivehead",
	Callback = function()
      		print("button pressed")
		local args = {
	"SpawnUnit",
	{
		Team = "Raig",
		Torso = game:GetService("Players").LocalPlayer.Character:WaitForChild("Torso"),
		Armor = "None",
		Unit = "Hivehead"
	}
}
game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("SpawnMenu"):WaitForChild("GuiFunction"):InvokeServer(unpack(args))

  	end    
})


Tab:AddButton({
	Name = "Spawn Angry Assister",
	Callback = function()
      		print("button pressed")
		local args = {
	"SpawnUnit",
	{
		Team = "Raig",
		Torso = game:GetService("Players").LocalPlayer.Character:WaitForChild("Torso"),
		Armor = "None",
		Unit = "Angry Assister"
	}
}
game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("SpawnMenu"):WaitForChild("GuiFunction"):InvokeServer(unpack(args))

  	end    
})


Tab:AddButton({
	Name = "Spawn Savage Chaser",
	Callback = function()
      		print("button pressed")
		local args = {
	"SpawnUnit",
	{
		Team = "Raig",
		Torso = game:GetService("Players").LocalPlayer.Character:WaitForChild("Torso"),
		Armor = "None",
		Unit = "Savage Chaser"
	}
}
game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("SpawnMenu"):WaitForChild("GuiFunction"):InvokeServer(unpack(args))

  	end    
})


Tab:AddButton({
	Name = "Spawn Raiging Creep",
	Callback = function()
      		print("button pressed")
		local args = {
	"SpawnUnit",
	{
		Team = "Raig",
		Torso = game:GetService("Players").LocalPlayer.Character:WaitForChild("Torso"),
		Armor = "None",
		Unit = "Raiging Creep"
	}
}
game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("SpawnMenu"):WaitForChild("GuiFunction"):InvokeServer(unpack(args))

  	end    
})


Tab:AddButton({
	Name = "Spawn Infectionous Being",
	Callback = function()
      		print("button pressed")
		local args = {
	"SpawnUnit",
	{
		Team = "Raig",
		Torso = game:GetService("Players").LocalPlayer.Character:WaitForChild("Torso"),
		Armor = "None",
		Unit = "Infectionous Being"
	}
}
game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("SpawnMenu"):WaitForChild("GuiFunction"):InvokeServer(unpack(args))

  	end    
})


Tab:AddButton({
	Name = "Spawn Horrifying Brute",
	Callback = function()
      		print("button pressed")
		local args = {
	"SpawnUnit",
	{
		Team = "Raig",
		Torso = game:GetService("Players").LocalPlayer.Character:WaitForChild("Torso"),
		Armor = "None",
		Unit = "Horrifying Brute"
	}
}
game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("SpawnMenu"):WaitForChild("GuiFunction"):InvokeServer(unpack(args))

  	end    
})


Tab:AddButton({
	Name = "Spawn Deformed Sufferer",
	Callback = function()
      		print("button pressed")
		local args = {
	"SpawnUnit",
	{
		Team = "Raig",
		Torso = game:GetService("Players").LocalPlayer.Character:WaitForChild("Torso"),
		Armor = "None",
		Unit = "Deformed Sufferer"
	}
}
game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("SpawnMenu"):WaitForChild("GuiFunction"):InvokeServer(unpack(args))

  	end    
})


Tab:AddButton({
	Name = "Spawn Beastly Bomber",
	Callback = function()
      		print("button pressed")
		local args = {
	"SpawnUnit",
	{
		Team = "Raig",
		Torso = game:GetService("Players").LocalPlayer.Character:WaitForChild("Torso"),
		Armor = "None",
		Unit = "Beastly Bomber"
	}
}
game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("SpawnMenu"):WaitForChild("GuiFunction"):InvokeServer(unpack(args))

  	end    
})


