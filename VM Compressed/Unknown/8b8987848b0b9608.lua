--[[
nagi hub | Created by idkwhoiam
Discord: https://discord.gg/dmqmNQdqbr
Key: heaven
]]

-- // Key System UI Setup First
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local correctKey = "heaven"

local KeyWindow = Rayfield:CreateWindow({
	Name = "nagi hub | Key System",
	LoadingTitle = "nagi hub Loading...",
	LoadingSubtitle = "Key Required",
	ConfigurationSaving = {
		Enabled = false
	},
	Discord = {
		Enabled = true,
		Invite = "dmqmNQdqbr",
		RememberJoins = false
	},
	KeySystem = true,
	KeySettings = {
		Title = "nagi hub Key System",
		Subtitle = "Enter the key from Discord",
		Note = "Click 'Get Key' to copy invite link",
		FileName = "nagi_hub_slaps",
		SaveKey = true,
		GrabKeyFromSite = false,
		Key = correctKey
	}
})

-- // Script runs only after correct key
local Player = game.Players.LocalPlayer
local Character = function() return Player.Character or Player.CharacterAdded:Wait() end

local Window = Rayfield:CreateWindow({
	Name = "nagi hub | Slap Battles",
	LoadingTitle = "Loading",
	LoadingSubtitle = "Please wait...",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "nagi_hub",
		FileName = "SlapBattles"
	},
	Discord = {
		Enabled = true,
		Invite = "dmqmNQdqbr",
		RememberJoins = true
	}
})

local MainTab = Window:CreateTab("Main", nil)

-- // Auto Farm
_G.AutoFarm = false
MainTab:CreateToggle({
	Name = "Auto Farm (Closest Player)",
	CurrentValue = false,
	Callback = function(state)
		_G.AutoFarm = state
		while _G.AutoFarm do
			task.wait(0.4)
			local closest, distance = nil, math.huge
			for _, plr in pairs(game.Players:GetPlayers()) do
				if plr ~= Player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
					local dist = (Character().HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude
					if dist < distance then
						distance = dist
						closest = plr
					end
				end
			end
			if closest and closest.Character then
				Character().HumanoidRootPart.CFrame = closest.Character.HumanoidRootPart.CFrame + Vector3.new(0, 0, 2)
				local tool = Character():FindFirstChildOfClass("Tool")
				if tool then tool:Activate() end
			end
		end
	end
})

-- // Invisibility (Works Anytime)
MainTab:CreateButton({
	Name = "Invisibility (Works Everywhere)",
	Callback = function()
		local root = Character():WaitForChild("HumanoidRootPart")
		local saved = root.CFrame
		firetouchinterest(root, workspace.Lobby.invis.Part, 0)
		task.wait()
		firetouchinterest(root, workspace.Lobby.invis.Part, 1)
		task.wait(0.3)
		root.CFrame = saved
	end
})

-- // Bring All Players
MainTab:CreateButton({
	Name = "Bring All Players",
	Callback = function()
		for _,v in pairs(game.Players:GetPlayers()) do
			if v ~= Player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
				v.Character.HumanoidRootPart.CFrame = Character().HumanoidRootPart.CFrame + Vector3.new(2,0,0)
			end
		end
	end
})

-- // ESP
MainTab:CreateButton({
	Name = "Player ESP",
	Callback = function()
		for _,v in pairs(game.Players:GetPlayers()) do
			if v ~= Player and v.Character and v.Character:FindFirstChild("Head") then
				local gui = Instance.new("BillboardGui", v.Character.Head)
				gui.Size = UDim2.new(0, 100, 0, 40)
				gui.AlwaysOnTop = true
				local text = Instance.new("TextLabel", gui)
				text.Size = UDim2.new(1, 0, 1, 0)
				text.Text = v.Name
				text.TextColor3 = Color3.fromRGB(255, 255, 255)
				text.BackgroundTransparency = 1
			end
		end
	end
})

-- // Anti Void
_G.AntiVoid = false
MainTab:CreateToggle({
	Name = "Anti Void (TPs Up)",
	CurrentValue = false,
	Callback = function(state)
		_G.AntiVoid = state
		while _G.AntiVoid do
			task.wait(0.25)
			local y = Character().HumanoidRootPart.Position.Y
			if y < -15 then
				Character().HumanoidRootPart.CFrame = CFrame.new(0, 100, 0)
			end
		end
	end
})

-- // Noclip
_G.Noclip = false
MainTab:CreateToggle({
	Name = "Noclip",
	CurrentValue = false,
	Callback = function(state)
		_G.Noclip = state
		local RunService = game:GetService("RunService")
		RunService.Stepped:Connect(function()
			if _G.Noclip and Character() then
				for _, part in pairs(Character():GetDescendants()) do
					if part:IsA("BasePart") then
						part.CanCollide = false
					end
				end
			end
		end)
	end
})

-- // Glove Giver (All Gloves)
MainTab:CreateButton({
	Name = "Give All Gloves",
	Callback = function()
		for _,stand in pairs(game:GetService("Workspace").Lobby.GloveStands:GetChildren()) do
			for _,remote in pairs(game:GetService("ReplicatedStorage")._NETWORK:GetChildren()) do
				if remote:IsA("RemoteEvent") then
					pcall(function()
						remote:FireServer(stand.Name)
					end)
				end
			end
		end
	end
})
