local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local LP = Players.LocalPlayer
local Char = LP.Character or LP.CharacterAdded:Wait()
local Humanoid = Char:WaitForChild("Humanoid")
local UserID = tostring(LP.UserId)

local CK = loadstring(game:HttpGet("https://raw.githubusercontent.com/4lpaca-pin/CompKiller/refs/heads/main/src/source.luau"))()
local UI = CK.new({ Name = "Toilet Simulator 💩", Keybind = "RightControl", Scale = CK.Scale.Mini })

local autoSpin, autoBypass, autoMillion, autoWalk, autoSpeed, autoSpawn, infJump, noclip = false, false, false, false, false, false, false, false
local speedVal, jumpVal = 16, 50

LP.CharacterAdded:Connect(function()
	task.wait(1)
	Char = LP.Character
	Humanoid = Char:WaitForChild("Humanoid")
end)

local TabMain = UI:DrawTab({ Name = "Main", Icon = "dollar-sign" })
local SectionMain = TabMain:DrawSection({ Name = "Spin + Money", Position = "left" })
local SectionMove = TabMain:DrawSection({ Name = "Movement", Position = "right" })

SectionMain:AddToggle({ Name = "Auto Spin", Default = false, Callback = function(v) autoSpin = v end })
SectionMain:AddToggle({ Name = "Bypass Spin Freely", Default = false, Callback = function(v) autoBypass = v end })
SectionMain:AddToggle({ Name = "Force Million Money", Default = false, Callback = function(v) autoMillion = v end })

SectionMove:AddSlider({ Name = "WalkSpeed", Min = 16, Max = 150, Default = 16, Callback = function(v) speedVal = v if Humanoid then Humanoid.WalkSpeed = v end end })
SectionMove:AddSlider({ Name = "JumpPower", Min = 50, Max = 300, Default = 50, Callback = function(v) jumpVal = v if Humanoid then Humanoid.JumpPower = v end end })
SectionMove:AddToggle({ Name = "Infinite Jump", Default = false, Callback = function(v) infJump = v end })
SectionMove:AddToggle({ Name = "Noclip", Default = false, Callback = function(v) noclip = v end })
SectionMove:AddButton({ Name = "Anti AFK", Callback = function()
	task.spawn(function()
		while true do
			task.wait(60)
			game:GetService("VirtualInputManager"):SendKeyEvent(true, "W", false, game)
			game:GetService("VirtualInputManager"):SendKeyEvent(false, "W", false, game)
		end
	end)
end })

UIS.JumpRequest:Connect(function()
	if infJump and Humanoid then
		Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	end
end)

RunService.Stepped:Connect(function()
	if noclip and Char then
		for _, v in pairs(Char:GetDescendants()) do
			if v:IsA("BasePart") and v.CanCollide then
				v.CanCollide = false
			end
		end
	end
end)

local TabCustomer = UI:DrawTab({ Name = "Customer", Icon = "user" })
local SectionCust = TabCustomer:DrawSection({ Name = "Automation", Position = "left" })

SectionCust:AddToggle({ Name = "Auto WalkFinish", Default = false, Callback = function(v) autoWalk = v end })
SectionCust:AddToggle({ Name = "Auto SpeedUp", Default = false, Callback = function(v) autoSpeed = v end })
SectionCust:AddToggle({ Name = "Auto Spawn Customer", Default = false, Callback = function(v) autoSpawn = v end })

task.spawn(function()
	while true do
		task.wait(0.2)
		if not LP or not LP.Character then continue end
		if autoBypass then
			local spinVal = LP:FindFirstChild("DailySpin")
			if spinVal and spinVal:FindFirstChild("CanSpinCount") then
				spinVal.CanSpinCount.Value = 999999
			end
		end
		if autoSpin then
			local a1 = { "Spin", false }
			local a2 = {
				["id"] = 3,
				["image"] = "rbxassetid://17326832131",
				["name"] = "+150 Money",
				["chance"] = 0.1
			}
			local daily = RS:FindFirstChild("DailySpinReplicatedStorage")
			if daily and daily:FindFirstChild("Events") then
				local dEvents = daily.Events
				if dEvents:FindFirstChild("DailySpinRE") then
					dEvents.DailySpinRE:FireServer(unpack(a1))
					dEvents.DailySpinRE:FireServer("AddSpinCount")
				end
				if dEvents:FindFirstChild("HandleRewardRE") then
					dEvents.HandleRewardRE:FireServer(a2)
				end
			end
		end
		if autoMillion then
			local a2 = {
				["id"] = 3,
				["image"] = "rbxassetid://17326832131",
				["name"] = "+999999999 Money",
				["chance"] = 1
			}
			local reward = RS:FindFirstChild("DailySpinReplicatedStorage") and RS.DailySpinReplicatedStorage:FindFirstChild("Events") and RS.DailySpinReplicatedStorage.Events:FindFirstChild("HandleRewardRE")
			if reward then
				reward:FireServer(a2)
			end
		end
	end
end)

task.spawn(function()
	while true do
		task.wait(0.25)
		if autoSpawn then
			local spawnRemote = RS:FindFirstChild("Events") and RS.Events:FindFirstChild("NPC") and RS.Events.NPC:FindFirstChild("CustomerSpawnRE")
			if spawnRemote then
				spawnRemote:FireServer()
			end
		end
		if autoWalk or autoSpeed then
			local res = workspace:FindFirstChild("Resources")
			local folder = res and res:FindFirstChild(UserID)
			local custFolder = folder and folder:FindFirstChild("Customer")
			if custFolder then
				for _, c in pairs(custFolder:GetChildren()) do
					if c:IsA("Model") and c:FindFirstChild("Humanoid") then
						if autoSpeed then
							c.Humanoid.WalkSpeed = 30
						end
						if autoWalk and c:GetAttribute("NpcStatus") ~= "Idle" then
							local re = folder:FindFirstChild("CustomerRE")
							if re then
								re:FireServer("WalkFinish", c)
							end
						end
					end
				end
			end
		end
	end
end)