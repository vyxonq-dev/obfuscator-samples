local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "climb race simulator by JJP", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})
local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "Free 5x pets(press unequip all to update)",
	Callback = function()
      		game.ReplicatedStorage.Boughtx5Pets:FireServer("")
  	end    
})

local autoClickEnabled = false

Tab:AddToggle({
	Name = "Auto click",
	Default = false,
	Callback = function(Value)
		autoClickEnabled = Value
		if autoClickEnabled then
			spawn(function()
				while autoClickEnabled do
					game.ReplicatedStorage.ClickGainEnergyTrain_Event:InvokeServer("")
					wait(0.05) 
				end
			end)
		end
	end    
})

local autoRebirthEnabled = false

Tab:AddToggle({
	Name = "auto Rebirth(no strength needed)",
	Default = false,
	Callback = function(Value)
		autoRebirthEnabled = Value
		if autoRebirthEnabled then
			spawn(function()
				while autoRebirthEnabled do
					game.ReplicatedStorage.Rebirth_Event:FireServer("")
					wait(0.05) 
				end
			end)
		end
	end    
})

local Tab2 = Window:MakeTab({
	Name = "Free misc",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})


Tab2:AddButton({
	Name = "Give spins",
	Callback = function()
    game.ReplicatedStorage.GiveSpinUse_Event:FireServer("9999999999")
  	end    
})

Tab2:AddButton({
	Name = "Give op donate pet",
	Callback = function()
      		game.ReplicatedStorage.GivePet_Event:FireServer("UltraDominusPet")
  	end    
})

Tab2:AddButton({
	Name = "Equip so much op donate pet",
	Callback = function()
for i = 1, 100 do
    local ohString1 = "UltraDominusPet"
    local ohString2 = "Equip"

    game:GetService("ReplicatedStorage").EquipPet_Event:FireServer(ohString1, ohString2)
end
  	end    
})

Tab2:AddButton({
	Name = "Give strength stat",
	Callback = function()
      		game.ReplicatedStorage.GiveStrenght_Event:FireServer("999999999999999")
  	end    
})

Tab2:AddButton({
	Name = "Give trophies stat",
	Callback = function()
      		game.ReplicatedStorage.GiveTrohpy_Event:FireServer("999999999999999")
  	end    
})



Tab2:AddButton({
	Name = "Give win potions",
	Callback = function()
      		for i = 1, 999 do
    game.ReplicatedStorage.GiveBoost_Event:FireServer("DoubleWins")
end
  	end    
})

Tab2:AddButton({
	Name = "Give luck potions",
	Callback = function()
      		for i = 1, 999 do
    game.ReplicatedStorage.GiveBoost_Event:FireServer("LuckyBoost")
end
  	end    
})

Tab2:AddButton({
	Name = "Give strength potions",
	Callback = function()
for i = 1, 999 do
    game.ReplicatedStorage.GiveBoost_Event:FireServer("DoubleStrength")
end
  	end    
})

local Tab10 = Window:MakeTab({
	Name = "Player",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab10:AddSlider({
	Name = "Player Walkspeed",
	Min = 16,
	Max = 400,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Walkspeed",
	Callback = function(Value)
		local player = game.Players.LocalPlayer
		if player and player.Character and player.Character:FindFirstChild("Humanoid") then
			player.Character.Humanoid.WalkSpeed = Value
		else
			print("Игрок или Humanoid не найден!")
		end
	end    
})

Tab10:AddSlider({
	Name = "Player Jumppower",
	Min = 8,
	Max = 500,
	Default = 8,
	Color = Color3.fromRGB(255,0,0),
	Increment = 1,
	ValueName = "Jumppower",
	Callback = function(Value)
		local player = game.Players.LocalPlayer
		if player and player.Character and player.Character:FindFirstChild("Humanoid") then
			player.Character.Humanoid.JumpHeight = Value
		else
			print("Игрок или Humanoid не найден!")
		end
	end    
})

Tab10:AddSlider({
	Name = "Player Gravity",
	Min = 0,
	Max = 200,
	Default = 196.2, 
	Color = Color3.fromRGB(255,0,0),
	Increment = 1,
	ValueName = "Gravity",
	Callback = function(Value)
		workspace.Gravity = Value
	end    
})

local Tab12 = Window:MakeTab({
	Name = "Universal",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab12:AddButton({
	Name = "Infinite Yield Reborn",
	Callback = function()
      		loadstring(game:HttpGet('https://raw.githubusercontent.com/fuckusfm/infiniteyield-reborn/master/source'))()
  	end    
})

OrionLib:Init()
