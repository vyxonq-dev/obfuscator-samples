-- Yim Free | Universal Spectate Hub
-- Sem Key | Sem Kill

local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/0YuQQ9WS"))()

local Window = OrionLib:MakeWindow({
	Name = "Yim Free",
	HidePremium = false,
	IntroText = "Bem-vindo ao Yim Free",
	SaveConfig = false
})

OrionLib:MakeNotification({
	Name = "Yim Free",
	Content = "Hub gratuito | Spectate, Follow e Goto",
	Time = 5
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local selectedPlayer = nil
local followToggle = false
local viewToggle = false

-- Atualiza lista de jogadores
local function getPlayerList()
	local list = {}
	for _, plr in ipairs(Players:GetPlayers()) do
		if plr ~= LocalPlayer then
			table.insert(list, plr.Name)
		end
	end
	return list
end

local Tab = Window:MakeTab({
	Name = "Players",
	Icon = "rbxassetid://414904019",
	PremiumOnly = false
})

local PlayerDropdown = Tab:AddDropdown({
	Name = "Selecionar Jogador",
	Options = getPlayerList(),
	Callback = function(value)
		selectedPlayer = value
	end
})

-- Atualiza dropdown automaticamente
Players.PlayerAdded:Connect(function()
	PlayerDropdown:Refresh(getPlayerList(), true)
end)

Players.PlayerRemoving:Connect(function()
	PlayerDropdown:Refresh(getPlayerList(), true)
end)

-- VIEW / SPECTATE
Tab:AddToggle({
	Name = "Spectate (View)",
	Default = false,
	Callback = function(state)
		viewToggle = state
		if viewToggle and selectedPlayer then
			local target = Players:FindFirstChild(selectedPlayer)
			if target and target.Character and target.Character:FindFirstChild("Humanoid") then
				Camera.CameraSubject = target.Character.Humanoid
			end
		else
			if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
				Camera.CameraSubject = LocalPlayer.Character.Humanoid
			end
		end
	end
})

-- FOLLOW
Tab:AddToggle({
	Name = "Follow Jogador",
	Default = false,
	Callback = function(state)
		followToggle = state
		task.spawn(function()
			while followToggle do
				if selectedPlayer then
					local target = Players:FindFirstChild(selectedPlayer)
					if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
						LocalPlayer.Character.HumanoidRootPart.CFrame =
							target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2)
					end
				end
				task.wait(0.1)
			end
		end)
	end
})

-- GOTO
Tab:AddButton({
	Name = "Goto Jogador",
	Callback = function()
		if selectedPlayer then
			local target = Players:FindFirstChild(selectedPlayer)
			if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
				LocalPlayer.Character.HumanoidRootPart.CFrame =
					target.Character.HumanoidRootPart.CFrame
			end
		end
	end
})