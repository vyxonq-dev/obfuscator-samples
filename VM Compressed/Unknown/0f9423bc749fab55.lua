local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Toilet Attack", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})
local Tab = Window:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "Made By baconthewondering837"
})
local Section = Tab:AddSection({
	Name = "Subscribe Or Follow On Scriptblox For More Scripts!"
})
local Section = Tab:AddSection({
	Name = "Probably Will Make more Orion Librarys Scripts Because They Are So Cool"
})
local Tab = Window:MakeTab({
	Name = "Common",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "Common Units(Nobody Gives A Damn About These"
})
Tab:AddButton({
	Name = "Cameraman",
	Callback = function()
      		game:GetService("ReplicatedStorage").Functions.SpawnTower:InvokeServer("Cameraman", CFrame.new(game.Players.LocalPlayer.Character.Head.Position)) 
  	end    
})
Tab:AddButton({
	Name = "Camera woman",
	Callback = function()
      		game:GetService("ReplicatedStorage").Functions.SpawnTower:InvokeServer("CameraWoman", CFrame.new(game.Players.LocalPlayer.Character.Head.Position)) 
  	end    
})
local Tab = Window:MakeTab({
	Name = "Uncommon",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "Uncommon Unit(There's Only One Lol)"
})
Tab:AddButton({
	Name = "Speakerman",
	Callback = function()
      		game:GetService("ReplicatedStorage").Functions.SpawnTower:InvokeServer("Speakerman", CFrame.new(game.Players.LocalPlayer.Character.Head.Position)) 
  	end    
})

local Tab = Window:MakeTab({
	Name = "Rares",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "Rare Units(Why Are There Only 2 Rares)"
})
Tab:AddButton({
	Name = "Big Cameraman",
	Callback = function()
      	game:GetService("ReplicatedStorage").Functions.SpawnTower:InvokeServer("Big Cameraman", CFrame.new(game.Players.LocalPlayer.Character.Head.Position)) 	
  	end    
})
Tab:AddButton({
	Name = "Scientist TV Man",
	Callback = function()
      		game:GetService("ReplicatedStorage").Functions.SpawnTower:InvokeServer("Sci Tv Man", CFrame.new(game.Players.LocalPlayer.Character.Head.Position)) 
  	end    
})
local Tab = Window:MakeTab({
	Name = "Epic",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "Not Cool Epics"
})
Tab:AddButton({
	Name = "Big Speakerman",
	Callback = function()
      		game:GetService("ReplicatedStorage").Functions.SpawnTower:InvokeServer("Big Speakerman", CFrame.new(game.Players.LocalPlayer.Character.Head.Position)) 
  	end    
})
Tab:AddButton({
	Name = "TV Man",
	Callback = function()
      		game:GetService("ReplicatedStorage").Functions.SpawnTower:InvokeServer("Tv Man", CFrame.new(game.Players.LocalPlayer.Character.Head.Position)) 
  	end    
})
local Tab = Window:MakeTab({
	Name = "Legendary",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "Legendary Units"
})
Tab:AddButton({
	Name = "Plunger Man",
	Callback = function()
      		game:GetService("ReplicatedStorage").Functions.SpawnTower:InvokeServer("Plunger Man", CFrame.new(game.Players.LocalPlayer.Character.Head.Position)) 
  	end    
})
Tab:AddButton({
	Name = "Dark Speakerman",
	Callback = function()
      		game:GetService("ReplicatedStorage").Functions.SpawnTower:InvokeServer("Dark Speakerman", CFrame.new(game.Players.LocalPlayer.Character.Head.Position)) 
  	end    
})
Tab:AddButton({
	Name = "Big TV Man",
	Callback = function()
      		game:GetService("ReplicatedStorage").Functions.SpawnTower:InvokeServer("Big Tv Man", CFrame.new(game.Players.LocalPlayer.Character.Head.Position)) 
  	end    
})
local Tab = Window:MakeTab({
	Name = "Mythic",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "Mythic Titans?"
})
Tab:AddButton({
	Name = "Titan Speakerman",
	Callback = function()
      		game:GetService("ReplicatedStorage").Functions.SpawnTower:InvokeServer("Titan Speakerman", CFrame.new(game.Players.LocalPlayer.Character.Head.Position)) 
  	end    
})
Tab:AddButton({
	Name = "Titan TV Man",
	Callback = function()
      		game:GetService("ReplicatedStorage").Functions.SpawnTower:InvokeServer("Titan Tv Man", CFrame.new(game.Players.LocalPlayer.Character.Head.Position)) 
  	end    
})
Tab:AddButton({
	Name = "Titan Cameraman",
	Callback = function()
      		game:GetService("ReplicatedStorage").Functions.SpawnTower:InvokeServer("Titan Cameraman", CFrame.new(game.Players.LocalPlayer.Character.Head.Position)) 
  	end    
})
local Tab = Window:MakeTab({
	Name = "Supreme",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "Supreme Units"
})
Tab:AddButton({
	Name = "Upgraded Titan Speakerman",
	Callback = function()
      		game:GetService("ReplicatedStorage").Functions.SpawnTower:InvokeServer("Upgraded Titan Speakerman", CFrame.new(game.Players.LocalPlayer.Character.Head.Position)) 
  	end    
})
Tab:AddButton({
	Name = "Upgraded Titan Cameraman",
	Callback = function()
      		game:GetService("ReplicatedStorage").Functions.SpawnTower:InvokeServer("Upgraded Titan Cameraman", CFrame.new(game.Players.LocalPlayer.Character.Head.Position)) 
  	end    
})
