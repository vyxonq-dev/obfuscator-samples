local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Window = Library:NewWindow("Script")

local Tab = Window:NewSection("Credits: TGMANKASKE")

Tab:CreateButton("Inf. Money", function()
print("More per execute")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local giveRewardRemote = ReplicatedStorage:WaitForChild("CratesUtilities"):WaitForChild("Remotes"):WaitForChild("GiveReward")

local rewardValue = "1000000000000000" 

giveRewardRemote:FireServer(rewardValue)

end)

Tab:CreateButton("Give Slap", function()

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

local ACTIVATION_DISTANCE = 10
local targetPosition = Vector3.new(17, 4, -22)

-- Função para ativar o primeiro prompt próximo na posição alvo
local function teleportActivateReturn()
	-- Salva posição original
	local originalCFrame = rootPart.CFrame

	-- Teleporta para a posição alvo (leve leve acima para evitar colisão)
	rootPart.CFrame = CFrame.new(targetPosition + Vector3.new(0, 2, 0))
	wait(0.2)

	-- Procura e ativa o primeiro ProximityPrompt dentro do alcance
	for _, prompt in ipairs(workspace:GetDescendants()) do
		if prompt:IsA("ProximityPrompt") and prompt.Enabled then
			if (prompt.Parent.Position - rootPart.Position).Magnitude <= ACTIVATION_DISTANCE then
				fireproximityprompt(prompt)
				print("Prompt ativado:", prompt.Name)
				break -- ativa apenas um prompt
			end
		end
	end

	wait(0.5) 

	rootPart.CFrame = originalCFrame
	print("Retornou para a posição original.")
end

teleportActivateReturn()

end)

Tab:CreateButton("Kill All", function()

local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local localCharacter = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local slapEvent = localCharacter:WaitForChild("SlapGlove"):WaitForChild("Event")

local distantPosition = Vector3.new(-1e9, -1e9, -1e9)

for _, player in ipairs(Players:GetPlayers()) do
	if player ~= localPlayer and player.Character then
		local args = {
			"slash",
			player.Character,
			distantPosition
		}
		slapEvent:FireServer(unpack(args))
	end
end

end)

Tab:CreateButton("Slap All", function()

local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local localCharacter = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local slapEvent = localCharacter:WaitForChild("SlapGlove"):WaitForChild("Event")

local function getRandomVector()
	return Vector3.new(
		math.random(-100, 100) / 100,  -- X
		math.random(-100, 100) / 100,  -- Y
		math.random(-100, 100) / 100   -- Z
	)
end

for _, player in ipairs(Players:GetPlayers()) do
	if player ~= localPlayer and player.Character then
		local args = {
			"slash",
			player.Character,
			getRandomVector()
		}
		slapEvent:FireServer(unpack(args))
	end
end

end)



   local Tab = Window:NewSection("Links")

Tab:CreateButton("Discord GP", function()

  setclipboard('https://discord.gg/esYJzYnsfC')

end)
                     
Tab:CreateButton("Youtube CH", function()

  setclipboard('https://www.youtube.com/@TGMANKASKE')

end)        
