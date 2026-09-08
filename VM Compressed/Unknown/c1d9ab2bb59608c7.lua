loadstring(game:HttpGet(('https://pastebin.com/raw/vE8WMLit'),true))() --fusion
_G.fusion = game:GetObjects('rbxassetid://119101539')[1]
_G.fusion.Parent = game.Players.LocalPlayer.Backpack
_G.fusion.Equipped:Connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50
game.Players.LocalPlayer.Character.Humanoid.JumpPower = 75
local Sound = Instance.new("Sound") 
local Id = "4822429705"
Sound.Parent = game.Workspace
Sound.SoundId = "rbxassetid://"..Id
Sound.Playing = true
Sound.Looped = false
Sound.Volume = 5
end)
_G.fusion.Unequipped:Connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
end) --potion
_G.potion = game:GetObjects('rbxassetid://154727251')[1]
_G.potion.Parent = game.Players.LocalPlayer.Backpack
_G.potion.Equipped:Connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 75
local Sound = Instance.new("Sound") 
local Id = "12722532"
Sound.Parent = game.Workspace
Sound.SoundId = "rbxassetid://"..Id
Sound.Playing = true
Sound.Looped = false
Sound.Volume = 5
end)
_G.potion.Unequipped:Connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 75
end) --jetpack
_G.jetpack = game:GetObjects('rbxassetid://31314966')[1]
_G.jetpack.Parent = game.Players.LocalPlayer.Backpack
_G.jetpack.Equipped:Connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 75
game.workspace.Gravity = 0.1
tool.RequiresHandle = false
local Sound = Instance.new("Sound") 
local Id = "30624262"
Sound.Parent = game.Workspace
Sound.SoundId = "rbxassetid://"..Id
Sound.Playing = true
Sound.Looped = false
Sound.Volume = 5
end)
_G.jetpack.Unequipped:Connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
game.workspace.Gravity = 200
end) --jetpack
_G.jetpack = game:GetObjects('rbxassetid://2190016098')[1]
_G.jetpack.Parent = game.Players.LocalPlayer.Backpack
_G.jetpack.Equipped:Connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 75
game.workspace.Gravity = 0.1
tool.RequiresHandle = false
local Sound = Instance.new("Sound") 
local Id = "30624262"
Sound.Parent = game.Workspace
Sound.SoundId = "rbxassetid://"..Id
Sound.Playing = true
Sound.Looped = false
Sound.Volume = 5
end)
_G.jetpack.Unequipped:Connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
game.workspace.Gravity = 200
end) --boots
_G.boots = game:GetObjects('rbxassetid://563288952')[1]
_G.boots.Parent = game.Players.LocalPlayer.Backpack
_G.boots.Equipped:Connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50
game.workspace.Gravity = 100
local Sound = Instance.new("Sound") 
local Id = "99173388"
Sound.Parent = game.Workspace
Sound.SoundId = "rbxassetid://"..Id
Sound.Playing = true
Sound.Looped = false
Sound.Volume = 1000
end)
_G.boots.Unequipped:Connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
game.workspace.Gravity = 200
end) --gravity coil
_G.gravitycoil = game:GetObjects('rbxassetid://186868758')[1]
_G.gravitycoil.Parent = game.Players.LocalPlayer.Backpack
_G.gravitycoil.Equipped:Connect(function()
game.workspace.Gravity = 50
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 75
local Sound = Instance.new("Sound") 
local Id = "16619553"
Sound.Parent = game.Workspace
Sound.SoundId = "rbxassetid://"..Id
Sound.Playing = true
Sound.Looped = false
Sound.Volume = 2
end)
_G.gravitycoil.Unequipped:Connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
game.workspace.Gravity = 196.2
end)--gravity coil
_G.gravitycoil = game:GetObjects('rbxassetid://150366274')[1]
_G.gravitycoil.Parent = game.Players.LocalPlayer.Backpack
_G.gravitycoil.Equipped:Connect(function()
game.workspace.Gravity = 50
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50
local Sound = Instance.new("Sound") 
local Id = "16619553"
Sound.Parent = game.Workspace
Sound.SoundId = "rbxassetid://"..Id
Sound.Playing = true
Sound.Looped = false
Sound.Volume = 2
end)
_G.gravitycoil.Unequipped:Connect(function()
game.workspace.Gravity = 196.2
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
end) --grimgold
_G.grimgold = game:GetObjects('rbxassetid://69499437')[1]
_G.grimgold.Parent = game.Players.LocalPlayer.Backpack
_G.grimgold.Equipped:Connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 75
local Sound = Instance.new("Sound") 
local Id = "12222225"
Sound.Parent = game.Workspace
Sound.SoundId = "rbxassetid://"..Id
Sound.Playing = true
Sound.Looped = false
Sound.Volume = 5
end)
_G.grimgold.Unequipped:Connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
end)
--grimgold
_G.grimgold = game:GetObjects('rbxassetid://99119240')[1]
_G.grimgold.Parent = game.Players.LocalPlayer.Backpack
_G.grimgold.Equipped:Connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 75
local Sound = Instance.new("Sound") 
local Id = "12222225"
Sound.Parent = game.Workspace
Sound.SoundId = "rbxassetid://"..Id
Sound.Playing = true
Sound.Looped = false
Sound.Volume = 5
end)
_G.grimgold.Unequipped:Connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
end) --grimgold
_G.grimgold = game:GetObjects('rbxassetid://159229806')[1]
_G.grimgold.Parent = game.Players.LocalPlayer.Backpack
_G.grimgold.Equipped:Connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 75
local Sound = Instance.new("Sound") 
local Id = "12222225"
Sound.Parent = game.Workspace
Sound.SoundId = "rbxassetid://"..Id
Sound.Playing = true
Sound.Looped = false
Sound.Volume = 5
end) 
_G.grimgold.Unequipped:Connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
end)--grimgold
_G.grimgold = game:GetObjects('rbxassetid://108158379')[1]
_G.grimgold.Parent = game.Players.LocalPlayer.Backpack
_G.grimgold.Equipped:Connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 75
local Sound = Instance.new("Sound") 
local Id = "12222225"
Sound.Parent = game.Workspace
Sound.SoundId = "rbxassetid://"..Id
Sound.Playing = true
Sound.Looped = false
Sound.Volume = 5
end) 
_G.grimgold.Unequipped:Connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
end)--grimgold
_G.grimgold = game:GetObjects('rbxassetid://233520257')[1]
_G.grimgold.Parent = game.Players.LocalPlayer.Backpack
_G.grimgold.Equipped:Connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 75
local Sound = Instance.new("Sound") 
local Id = "12222225"
Sound.Parent = game.Workspace
Sound.SoundId = "rbxassetid://"..Id
Sound.Playing = true
Sound.Looped = false
Sound.Volume = 5
end) 
_G.grimgold.Unequipped:Connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
end)--grimgold
_G.grimgold = game:GetObjects('rbxassetid://73829193')[1]
_G.grimgold.Parent = game.Players.LocalPlayer.Backpack
_G.grimgold.Equipped:Connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 75
local Sound = Instance.new("Sound") 
local Id = "12222225"
Sound.Parent = game.Workspace
Sound.SoundId = "rbxassetid://"..Id
Sound.Playing = true
Sound.Looped = false
Sound.Volume = 5
end)
_G.grimgold.Unequipped:Connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
end)--grimgold
_G.grimgold = game:GetObjects('rbxassetid://80661504')[1]
_G.grimgold.Parent = game.Players.LocalPlayer.Backpack
_G.grimgold.Equipped:Connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 75
local Sound = Instance.new("Sound") 
local Id = "12222225"
Sound.Parent = game.Workspace
Sound.SoundId = "rbxassetid://"..Id
Sound.Playing = true--grimgold
_G.grimgold = game:GetObjects('rbxassetid://2544549379')[1]
_G.grimgold.Parent = game.Players.LocalPlayer.Backpack
_G.grimgold.Equipped:Connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 75
local Sound = Instance.new("Sound") 
local Id = "12222225"
Sound.Parent = game.Workspace
Sound.SoundId = "rbxassetid://"..Id
Sound.Playing = true
Sound.Looped = false
Sound.Volume = 5
end)
Sound.Looped = false
Sound.Volume = 5
end)
_G.grimgold.Unequipped:Connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
end)--grimgold
_G.grimgold = game:GetObjects('rbxassetid://139577901')[1]
_G.grimgold.Parent = game.Players.LocalPlayer.Backpack
_G.grimgold.Equipped:Connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 75
local Sound = Instance.new("Sound") 
local Id = "12222225"
Sound.Parent = game.Workspace
Sound.SoundId = "rbxassetid://"..Id
Sound.Playing = true
Sound.Looped = false
Sound.Volume = 5
end)
_G.grimgold.Unequipped:Connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
end)--grimgold
_G.grimgold = game:GetObjects('rbxassetid://93136802')[1]
_G.grimgold.Parent = game.Players.LocalPlayer.Backpack
_G.grimgold.Equipped:Connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 75
local Sound = Instance.new("Sound") 
local Id = "12222225"
Sound.Parent = game.Workspace
Sound.SoundId = "rbxassetid://"..Id
Sound.Playing = true
Sound.Looped = false
Sound.Volume = 5
end)
_G.grimgold.Unequipped:Connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
end) 