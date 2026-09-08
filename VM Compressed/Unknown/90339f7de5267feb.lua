local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")

local lp = Players.LocalPlayer
local hrp, humanoid
local infJump, noClip = false, false
local walkspeed, jumppower = 16, 50
local autoTPNext = false
local autoClaimRewards = false

local function refreshChar()
	local char = lp.Character or lp.CharacterAdded:Wait()
	hrp = char:WaitForChild("HumanoidRootPart")
	humanoid = char:WaitForChild("Humanoid")
	humanoid.WalkSpeed = walkspeed
	humanoid.JumpPower = jumppower
end

refreshChar()
lp.CharacterAdded:Connect(refreshChar)

local ReGui = loadstring(game:HttpGet("https://raw.githubusercontent.com/depthso/Dear-ReGui/main/ReGui.lua"))()
local ui = ReGui:TabsWindow({
    Title = "Obby or Die",
    Size = UDim2.fromOffset(540, 360),
    Position = UDim2.fromOffset(100, 100),
})

local main = ui:CreateTab({ Name = "Main" })

local move = main:CollapsingHeader({ Title = "🏃 Movement" })
move:SliderInt({
	Label = "WalkSpeed",
	Min = 16, Max = 200,
	Value = 16,
	Callback = function(_, v)
		walkspeed = v
		if humanoid then humanoid.WalkSpeed = v end
	end
})
move:SliderInt({
	Label = "JumpPower",
	Min = 50, Max = 300,
	Value = 50,
	Callback = function(_, v)
		jumppower = v
		if humanoid then humanoid.JumpPower = v end
	end
})
move:Checkbox({
	Label = "🪂 Infinite Jump",
	Value = false,
	Callback = function(_, v) infJump = v end
})
move:Checkbox({
	Label = "🚫 NoClip",
	Value = false,
	Callback = function(_, v) noClip = v end
})

local gameplay = main:CollapsingHeader({ Title = "🎯 Checkpoints & Rewards" })

gameplay:Checkbox({
	Label = "🌀 Auto TP to Next Checkpoint",
	Value = false,
	Callback = function(_, v) autoTPNext = v end
})

gameplay:Checkbox({
	Label = "🎁 Auto Claim Daily Rewards (1-7)",
	Value = false,
	Callback = function(_, v) autoClaimRewards = v end
})

UIS.JumpRequest:Connect(function()
	if infJump and humanoid then
		humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	end
end)

RunService.Stepped:Connect(function()
	if noClip and lp.Character then
		for _, p in pairs(lp.Character:GetDescendants()) do
			if p:IsA("BasePart") then p.CanCollide = false end
		end
	end
end)

task.spawn(function()
	while task.wait(1) do
		if autoTPNext and hrp and lp:FindFirstChild("CurrentStage") then
			local current = tonumber(lp.CurrentStage.Value)
			local nextCheckpoint = Workspace:FindFirstChild("Map") and Workspace.Map.Checkpoints:FindFirstChild(tostring(current + 1))
			if nextCheckpoint then
				hrp.CFrame = nextCheckpoint.CFrame + Vector3.new(0, 3, 0)
			end
		end
	end
end)

task.spawn(function()
	while task.wait(5) do
		if autoClaimRewards then
			for i = 1, 7 do
				pcall(function()
					ReplicatedStorage.Remotes.ClaimDailyReward:FireServer(i)
				end)
				task.wait(1)
			end
		end
	end
end)