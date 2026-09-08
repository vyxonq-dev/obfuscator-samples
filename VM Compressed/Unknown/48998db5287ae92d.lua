local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "jjp GUI", HidePremium = false, SaveConfig = true, ConfigFolder = "JjpOrionGUIscriptConfigurations"})
local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://18777407511",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "Main"
})

Tab:AddButton({
	Name = "Use all codes",
	Callback = function()
		local codesFolder = game.ReplicatedStorage.Codes
		local function activateCodes()
			for _, codeConfiguration in pairs(codesFolder:GetChildren()) do
				local codeStringValue = codeConfiguration:FindFirstChild("Code")
				if codeStringValue and codeStringValue:IsA("StringValue") then
					local codeValue = codeStringValue.Value
					game.ReplicatedStorage.GameClient.Events.RemoteEvent.CodeEventSR:FireServer(codeValue)
				end
			end
		end

		activateCodes()
	end    
})

Tab:AddButton({
	Name = "Enable auto clicker",
	Callback = function()
		local player = game.Players.LocalPlayer
		local intValue = player:WaitForChild("Auto_Clicker")
		intValue.Value = true
	end    
})

local autoFarmToggle = false
local autoFarmLoop

Tab:AddToggle({
	Name = "Auto farm | ENABLE AUTO RUN",
	Default = false,
	Callback = function(Value)
		autoFarmToggle = Value
		if autoFarmToggle then
			autoFarmLoop = task.spawn(function()
				while autoFarmToggle do
					local cframe1 = CFrame.new(-7.47373199, -25.8053551, -499.202637, -0.00672151987, -0.168189272, 0.985731781, 1.0683217e-08, 0.985754073, 0.168193072, -0.99997741, 0.00113052363, -0.00662576361)
					local cframe2 = CFrame.new(3.1174345, -26.1466217, -494.143158, -0.0241738725, -0.176087514, 0.984077632, 9.19814092e-09, 0.984365284, 0.176138982, -0.999707758, 0.00425797049, -0.0237959195)
					local cframe3 = CFrame.new(1.64244461, 0.913009644, 984497.375, 1, 0, 0, 0, 1, 0, 0, 0, 1)
					local cframe4 = CFrame.new(1.64244461, 0.913009644, 1000000, 1, 0, 0, 0, 1, 0, 0, 0, 1)

					local player = game.Players.LocalPlayer
					local function teleport(cframe)
						if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
							player.Character.HumanoidRootPart.CFrame = cframe
						end
					end

					teleport(cframe1)
					task.wait(0.1)
					teleport(cframe2)
					task.wait(0.1)
					teleport(cframe3)
					task.wait(0.1)
					teleport(cframe4)
					
					task.wait(0.2)
				end
			end)
		else
			if autoFarmLoop then
				task.cancel(autoFarmLoop)
			end
		end
	end    
})
