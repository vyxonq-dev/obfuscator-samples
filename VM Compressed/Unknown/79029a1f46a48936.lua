local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Auto event egg by jjp", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})
local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "main"
})

local autoCraftAll = false
local autoClickEnabled1 = false
local pickupEnabled = false

Tab:AddToggle({
	Name = "Rebirth",
	Default = false,
	Callback = function(Value)
		autoClickEnabled = Value
		if autoClickEnabled then
			spawn(function()
				while autoClickEnabled do
					game.ReplicatedStorage.Remotes.Rebirth.Rebirth:InvokeServer("")
					wait(0.2)
				end
			end)
		end
	end    
})

Tab:AddToggle({
	Name = "Free event egg",
	Default = false,
	Callback = function(Value)
		autoClickEnabled = Value
		if autoClickEnabled then
			spawn(function()
				while autoClickEnabled do
					game.ReplicatedStorage.Remotes.Event.OpenEgg:FireServer("")
					wait(0.2)
					game.ReplicatedStorage.Remotes.Eggs.CancelCooldown:FireServer("")
				end
			end)
		end
	end    
})

local autoCraftEnable = false

Tab:AddToggle({
	Name = "Auto craft",
	Default = false,
	Callback = function(Value)
		autoCraftEnable = Value
		if autoCraftEnable then
			spawn(function()
				while autoCraftEnable do
					game.ReplicatedStorage.Remotes.Pets.CraftAll:FireServer("")
					wait(0.05) -- задержка между вызовами
				end
			end)
		end
	end    
})
