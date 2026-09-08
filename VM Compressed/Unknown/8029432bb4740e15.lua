
-- Load Wizard UI
local Library = loadstring(
    Game:HttpGet('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard')
)()

local MainWindow = Library:NewWindow('Become A Planet')
local PlayerFolder = MainWindow:NewSection('Options')

local CreditsnWindow = Library:NewWindow('Credits')
local CreditsnFolder = CreditsnWindow:NewSection('Scripters')
local OCreditsnFolder = CreditsnWindow:NewSection('Other')

CreditsnFolder:CreateButton('UILib', function()
	print('UILib')
end)

CreditsnFolder:CreateButton('SyrexhubOfficialDev', function()
	print('SyrexhubOfficialDev')
end)

OCreditsnFolder:CreateButton('UI By ...', function()
	print('UI By ...')
end)

-- Claim Gift Toggle
local autoGift = false
PlayerFolder:CreateToggle('Claim Gift (+10k Size)', function(state)
	autoGift = state
	if autoGift then
		task.spawn(function()
			while autoGift do
				-- Fire LogGift
				local args1 = {
					[1] = {
						['TimerMilestones'] = {1,2,3,4,5,6,7,8,9,10,
							11,12,13,14,15,16,17,18,19,20,
							21,22,23,24,25,26,27,28,29,30,31,0},
						['Type'] = 'Leaving',
						['ReceivedTime'] = tick() * 1000,
						['TimerFinished'] = true,
						['ID'] = 'db8a0918-eded-4ae2-917f-0bba92e657b8',
						['Maid'] = {['_Tasks'] = {},['_TaskCount'] = 7},
						['NewRemainingTime'] = 30,
					},
				}
				game:GetService('ReplicatedStorage')
					.Honeypot.Internal.RemoteStorage['LogGift - RemoteEvent']
					:FireServer(unpack(args1))

				-- Fire ClaimGift
				local args2 = {'db8a0918-eded-4ae2-917f-0bba92e657b8'}
				game:GetService('ReplicatedStorage')
					.Honeypot.Internal.RemoteStorage['ClaimGift - RemoteEvent']
					:FireServer(unpack(args2))

				task.wait(0.1)
			end
		end)
	end
end)

-- ClaimBoost Toggle
local claimBoost = false
PlayerFolder:CreateToggle('Rainbow Boost', function(state)
	claimBoost = state
	if claimBoost then
		task.spawn(function()
			while claimBoost do
				local remote = game:GetService('ReplicatedStorage')
					.Honeypot.Internal.RemoteStorage:FindFirstChild('ClaimBoost - RemoteEvent')
				if remote then
					remote:FireServer('Rainbow', 300)
				end
				task.wait(1)
			end
		end)
	end
end)

-- Black Hole Gamepass
PlayerFolder:CreateButton('Unlock Black Hole Gamepass', function()
	local remote = game:GetService('ReplicatedStorage')
		.Honeypot.Internal.RemoteStorage:FindFirstChild('BlackHoleGamepass - RemoteEvent')
	if remote then
		remote:FireServer()
	end
end)

-- Magnet Gamepass
PlayerFolder:CreateButton('Unlock Magnet Gamepass', function()
	local remote = game:GetService('ReplicatedStorage')
		.Honeypot.Internal.RemoteStorage:FindFirstChild('MagnetGamepass - RemoteEvent')
	if remote then
		remote:FireServer()
	end
end)

-- RequestTeleport Button
PlayerFolder:CreateButton('Teleport', function()
	local remote = game:GetService('ReplicatedStorage')
		.Honeypot.Internal.RemoteStorage:FindFirstChild('RequestTeleport - RemoteEvent')
	if remote then
		remote:FireServer()
	end
end)

-- LogGift Button
PlayerFolder:CreateButton('LogGift Once', function()
	local remote = game:GetService('ReplicatedStorage')
		.Honeypot.Internal.RemoteStorage:FindFirstChild('LogGift - RemoteEvent')
	if remote then
		remote:FireServer({
			["TimerFinished"] = true,
			["Type"] = "Leaving",
			["Maid"] = {["_TaskCount"] = 7,["_Tasks"] = {}},
			["TimerMilestones"] = {1,2,3,4,5,6,7,8,9,10,
				11,12,13,14,15,16,17,18,19,20,
				21,22,23,24,25,26,27,28,29,31,0},
			["ID"] = "5bd061a8-7315-4fb3-bb94-f856300e36d7",
			["Frame"] = ".GiftFrame",
			["ReceivedTime"] = 1757286847314,
			["NewRemainingTime"] = 0.01
		})
	end
end)