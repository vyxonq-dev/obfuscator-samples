local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Window = Library:NewWindow("Script")
local Tab = Window:NewSection("Credits: TGMANKASKE")

-- Variáveis individuais para cada toggle
local infMoneyEnabled = false
local buyAllEnabled = false

Tab:CreateToggle("Inf. Money", function(enabled)
	infMoneyEnabled = enabled

	task.spawn(function()
		while infMoneyEnabled do
			task.wait(2.6)

			local ReplicatedStorage = game:GetService("ReplicatedStorage")
			local Players = game:GetService("Players")
			local player = Players.LocalPlayer
			local character = player.Character or player.CharacterAdded:Wait()
			local root = character:WaitForChild("HumanoidRootPart")

			-- Envia evento de lançamento
			ReplicatedStorage.Remotes.LaunchEvents.Launch:FireServer()
			task.wait(0.5)

			-- Teleporta para posição alta
			root.CFrame = CFrame.new(Vector3.new(1e9, 1e9, 1e9))
			task.wait(2)

			-- Envia retorno
			ReplicatedStorage.Remotes.LaunchEvents.Return:FireServer()
		end
	end)
end)

Tab:CreateToggle("Buy All", function(enabled)
	buyAllEnabled = enabled

	task.spawn(function()
		while buyAllEnabled do
			local ReplicatedStorage = game:GetService("ReplicatedStorage")
			local ShopEvent = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("ShopEvents"):WaitForChild("BuyBlock")

			local itemsToBuy = {
				"block_1",
				"wing_1",
				"fuel_1",
				"propeller_1",
				"seat_1",
				"fuel_2",
				"wing_2",
				"fuel_3",
				"propeller_2",
				"balloon",
				"boost_1",
				"missile_1",
				"shield"
			}

			for _, itemName in ipairs(itemsToBuy) do
				if not buyAllEnabled then break end
				pcall(function()
					ShopEvent:FireServer(itemName)
					print("Comprado:", itemName)
				end)
				task.wait(0.1)
			end

			task.wait(0.4)
		end
	end)
end)


local Tab = Window:NewSection("Links")
 
Tab:CreateButton("Discord Group", function()
print("HI")
 
setclipboard("https://discord.gg/8A6k73JqCM")
toclipboard("https://discord.gg/8A6k73JqCM")
 
end)
 
Tab:CreateButton("Youtube", function()
print("HI")
 
setclipboard("https://www.youtube.com/@TGMANKASKE")
toclipboard("https://www.youtube.com/@TGMANKASKE")
 
end)
