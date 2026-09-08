local RS = game:GetService("ReplicatedStorage")
local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local HRP = LP.Character and LP.Character:WaitForChild("HumanoidRootPart") or LP.CharacterAdded:Wait():WaitForChild("HumanoidRootPart")

local CK = loadstring(game:HttpGet("https://raw.githubusercontent.com/4lpaca-pin/CompKiller/refs/heads/main/src/source.luau"))()
local UI = CK.new({ Name = "Escape a Maze", Keybind = "RightControl", Scale = CK.Scale.Mini })

local farmTab = UI:DrawTab({ Name = "Farm Main", Icon = "flame" })
local rewardTab = UI:DrawTab({ Name = "Rewards", Icon = "gift" })
local tpTab = UI:DrawTab({ Name = "Teleport", Icon = "globe" })
local playerTab = UI:DrawTab({ Name = "Player", Icon = "user" })
local miscTab = UI:DrawTab({ Name = "Utility", Icon = "settings" })

local farmSection = farmTab:DrawSection({ Name = "Auto", Position = "left" })
local rewardSection = rewardTab:DrawSection({ Name = "Auto Rewards", Position = "left" })
local tpSection = tpTab:DrawSection({ Name = "World Teleport", Position = "left" })
local playerSection = playerTab:DrawSection({ Name = "Movement", Position = "left" })
local miscSection = miscTab:DrawSection({ Name = "Helpers", Position = "left" })

local autoClick = false
local autoRebirth = false
local autoSpin = false
local autoClaimRewards = false
local autoBestPets = false
local autoBestBooks = false
local autoTrade = false
local autoDeclineTrade = false

farmSection:AddToggle({ Name = "Auto Click", Flag = "AutoClick", Default = false, Callback = function(v) autoClick = v end })
farmSection:AddToggle({ Name = "Auto Rebirth", Flag = "AutoRebirth", Default = false, Callback = function(v) autoRebirth = v end })
farmSection:AddToggle({ Name = "Auto Spin", Flag = "AutoSpin", Default = false, Callback = function(v) autoSpin = v end })

rewardSection:AddToggle({ Name = "Auto Claim Rewards", Flag = "AutoClaim", Default = false, Callback = function(v) autoClaimRewards = v end })

-- World Teleport Buttons
for i = 1, 6 do
	local worldName = "World" .. i
	tpSection:AddButton({
		Name = "Teleport to " .. worldName,
		Callback = function()
			local pad = workspace:FindFirstChild("BuildFolder") and workspace.BuildFolder:FindFirstChild("FinishPads")
			if pad and pad:FindFirstChild(worldName) and HRP then
				HRP.CFrame = pad[worldName].CFrame + Vector3.new(0, 3, 0)
			end
		end
	})
end

playerSection:AddSlider({
	Name = "WalkSpeed", Flag = "WalkSpeed", Min = 16, Max = 200, Default = 16,
	Callback = function(v) if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.WalkSpeed = v end end
})

playerSection:AddSlider({
	Name = "JumpPower", Flag = "JumpPower", Min = 50, Max = 200, Default = 50,
	Callback = function(v) if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.JumpPower = v end end
})

_G.InfJump = false
playerSection:AddToggle({
	Name = "Infinite Jump", Flag = "InfJump", Default = false,
	Callback = function(v) _G.InfJump = v end
})

local noclip = false
playerSection:AddToggle({
	Name = "Noclip", Flag = "Noclip", Default = false,
	Callback = function(v) noclip = v end
})

miscSection:AddToggle({ Name = "Auto Equip Best Pets", Flag = "AutoBestPets", Default = false, Callback = function(v) autoBestPets = v end })
miscSection:AddToggle({ Name = "Auto Equip Best Books", Flag = "AutoBestBooks", Default = false, Callback = function(v) autoBestBooks = v end })
miscSection:AddToggle({ Name = "Auto Accept Trade", Flag = "AutoTrade", Default = false, Callback = function(v) autoTrade = v end })
miscSection:AddToggle({ Name = "Auto Decline Trade", Flag = "AutoDecline", Default = false, Callback = function(v) autoDeclineTrade = v end })

UIS.JumpRequest:Connect(function()
	if _G.InfJump and LP.Character and LP.Character:FindFirstChild("Humanoid") then
		LP.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	end
end)

game:GetService("RunService").Stepped:Connect(function()
	if noclip and LP.Character and HRP and LP.Character:FindFirstChildOfClass("Humanoid") then
		for _, part in pairs(LP.Character:GetDescendants()) do
			if part:IsA("BasePart") and part.CanCollide then
				part.CanCollide = false
			end
		end
	end
end)

task.spawn(function()
	while true do
		task.wait(0.05)
		if autoClick then
			RS.Remotes.Items.Click:FireServer(1)
		end
		if autoRebirth then
			RS.Remotes.Rebirth.Rebirth:InvokeServer()
		end
		if autoSpin then
			RS.Remotes.Gifts.RequestSpinReward:InvokeServer()
		end
		if autoClaimRewards then
			for i = 1, 12 do
				local r = "Reward" .. i
				if RS.Remotes.Gifts.GiveReward then
					RS.Remotes.Gifts.GiveReward:FireServer(r)
				end
			end
		end
		if autoBestPets then
			RS.Remotes.Pets.EquipBestPets:FireServer()
		end
		if autoBestBooks then
			RS.Remotes.Items.EquipBestItems:FireServer()
		end
		if autoTrade then
			RS.Remotes.Trade.AcceptTrade:FireServer()
		end
		if autoDeclineTrade then
			for _, p in ipairs(Players:GetPlayers()) do
				if p ~= LP then
					RS.Remotes.Trade.DeclineTrade:FireServer(p)
				end
			end
		end
	end
end)