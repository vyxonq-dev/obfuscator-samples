local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LP = Players.LocalPlayer

local Character = LP.Character or LP.CharacterAdded:Wait()
local HRP = Character:WaitForChild("HumanoidRootPart")
local function UpdateChar()
	Character = LP.Character or LP.CharacterAdded:Wait()
	HRP = Character:WaitForChild("HumanoidRootPart")
end
LP.CharacterAdded:Connect(UpdateChar)
UpdateChar()

local CK = loadstring(game:HttpGet("https://raw.githubusercontent.com/4lpaca-pin/CompKiller/refs/heads/main/src/source.luau"))()
local UI = CK.new({ Name = "🏆 Auto Farm", Keybind = "RightControl", Scale = CK.Scale.Mini })

local Tab = UI:DrawTab({ Name = "Farming", Icon = "award" })
local Section = Tab:DrawSection({ Name = "Win & Rebirth", Position = "left" })

local selectedLevel = 1
local autoFarm = false
local autoRebirth = false
local autoIQ = false
local autoFastWin = false
local antiAfk = false
local autoRemoveNegIQ = false
local removedIQDoors = {}

Section:AddSlider({
	Name = "Select Level",
	Flag = "LevelSlider",
	Min = 1,
	Max = 20,
	Default = 1,
	Callback = function(v)
		selectedLevel = v
	end
})

Section:AddToggle({
	Name = "Auto Farm Win",
	Flag = "AutoFarmWin",
	Default = false,
	Callback = function(v)
		autoFarm = v
	end
})

Section:AddToggle({
	Name = "Auto Rebirth",
	Flag = "AutoRebirth",
	Default = false,
	Callback = function(v)
		autoRebirth = v
	end
})

Section:AddToggle({
	Name = "Auto Get IQ (Green)",
	Flag = "AutoIQ",
	Default = false,
	Callback = function(v)
		autoIQ = v
	end
})

Section:AddToggle({
	Name = "Auto Farm Win Fast",
	Flag = "AutoFarmFast",
	Default = false,
	Callback = function(v)
		autoFastWin = v
	end
})

Section:AddToggle({
	Name = "Anti-AFK",
	Flag = "AntiAfk",
	Default = false,
	Callback = function(v)
		antiAfk = v
	end
})

Section:AddToggle({
	Name = "Auto Remove IQ (Negative)",
	Flag = "AutoRemoveIQ",
	Default = false,
	Callback = function(v)
		autoRemoveNegIQ = v
		if v then
			for i = 1, 20 do
				local lvl = workspace.MainMapa:FindFirstChild("Level " .. i)
				if lvl then
					for _, obj in pairs(lvl:GetChildren()) do
						if obj:IsA("BasePart") and obj.BrickColor == BrickColor.new("Really red") then
							local num = obj:GetAttribute("Number")
							if num and tonumber(num) < 0 then
								removedIQDoors[obj] = obj.Parent
								obj.Parent = nil
							end
						end
					end
				end
			end
		else
			for obj, parent in pairs(removedIQDoors) do
				if obj and not obj.Parent then
					obj.Parent = parent
				end
			end
			table.clear(removedIQDoors)
		end
	end
})

local moveTab = UI:DrawTab({ Name = "Movement", Icon = "zap" })
local moveSection = moveTab:DrawSection({ Name = "Player Movement", Position = "left" })

moveSection:AddSlider({
	Name = "WalkSpeed",
	Flag = "WalkSpeed",
	Min = 16,
	Max = 150,
	Default = 16,
	Callback = function(v)
		if LP.Character and LP.Character:FindFirstChild("Humanoid") then
			LP.Character.Humanoid.WalkSpeed = v
		end
	end
})

moveSection:AddSlider({
	Name = "JumpPower",
	Flag = "JumpPower",
	Min = 50,
	Max = 200,
	Default = 50,
	Callback = function(v)
		if LP.Character and LP.Character:FindFirstChild("Humanoid") then
			LP.Character.Humanoid.JumpPower = v
		end
	end
})

_G.InfJump = false
moveSection:AddToggle({
	Name = "Infinite Jump",
	Flag = "InfJump",
	Default = false,
	Callback = function(v)
		_G.InfJump = v
	end
})

UserInputService.JumpRequest:Connect(function()
	if _G.InfJump and LP.Character and LP.Character:FindFirstChild("Humanoid") then
		LP.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	end
end)

task.spawn(function()
	while true do
		task.wait(1)
		if antiAfk then
			game:GetService("VirtualUser"):Button2Down(Vector2.new())
			task.wait(0.2)
			game:GetService("VirtualUser"):Button2Up(Vector2.new())
		end
	end
end)

RunService.Heartbeat:Connect(function()
	if not Character or not HRP or not HRP.Parent then return end
	local levelName = "Level " .. tostring(selectedLevel)
	local levelModel = workspace:FindFirstChild("MainMapa") and workspace.MainMapa:FindFirstChild(levelName)

	if autoFarm and levelModel and levelModel:FindFirstChild("Win") then
		local winPart = levelModel.Win
		local oldPos = HRP.CFrame
		HRP.CFrame = winPart.CFrame + Vector3.new(0, 2, 0)
		task.wait(0.3)
		HRP.CFrame = oldPos
	end

	if autoFastWin and levelModel and levelModel:FindFirstChild("Win") then
		local winPart = levelModel.Win
		local oldPos = HRP.CFrame
		HRP.CFrame = winPart.CFrame + Vector3.new(0, 2, 0)
		task.wait(0.05)
		HRP.CFrame = oldPos
		task.wait(0.05)
	end

	if autoIQ then
		for i = 1, 20 do
			local lvl = workspace.MainMapa:FindFirstChild("Level " .. i)
			if lvl then
				for _, obj in pairs(lvl:GetChildren()) do
					if obj:IsA("BasePart") and obj.BrickColor == BrickColor.new("Lime green") and obj:FindFirstChild("TouchInterest") then
						local num = obj:GetAttribute("Number")
						if num and tonumber(num) > 0 then
							HRP.CFrame = obj.CFrame + Vector3.new(0, 2, 0)
							task.wait(0.15)
						end
					end
				end
			end
		end
	end

	if autoRebirth then
		local rebirthRemote = ReplicatedStorage:FindFirstChild("Rebirth")
		if rebirthRemote then
			rebirthRemote:FireServer()
		end
	end
end)