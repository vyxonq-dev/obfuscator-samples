local r = game:GetService("ReplicatedStorage")
local w = game:GetService("Workspace")
local p = game:GetService("Players")
local u = game:GetService("UserInputService")
local rs = game:GetService("RunService")
local vim = game:GetService("VirtualInputManager")
local lp = p.LocalPlayer
local hrp, hum

local function c()
	local ch = lp.Character or lp.CharacterAdded:Wait()
	hrp = ch:WaitForChild("HumanoidRootPart")
	hum = ch:WaitForChild("Humanoid")
end

c()
lp.CharacterAdded:Connect(c)

local g = loadstring(game:HttpGet("https://raw.githubusercontent.com/depthso/Dear-ReGui/main/ReGui.lua"))()
local win = g:TabsWindow({ Title = "Scooter Training", Size = UDim2.fromOffset(600, 420), Position = UDim2.fromOffset(100, 100) })

local t1 = win:CreateTab({ Name = "Main" })
local t2 = win:CreateTab({ Name = "Eggs" })
local t3 = win:CreateTab({ Name = "Movement" })
local t4 = win:CreateTab({ Name = "Settings" })

local autoTP, autoTrain, autoBestPet, autoHatch, antiAfk = false, false, false, false, false
local autoTrainByCombo, autoQuest, autoRebirth = false, false, false
local selectedEgg, selectedTreadmill = "", ""
local eggs, treadmills = {}, {}

local function updateEggs()
	eggs = {}
	for _, wFolder in ipairs(w.GameItems.Worlds:GetChildren()) do
		local eFolder = wFolder:FindFirstChild("Eggs")
		if eFolder then
			for _, egg in ipairs(eFolder:GetChildren()) do
				table.insert(eggs, egg.Name)
			end
		end
	end
end

local function updateTreadmills()
	treadmills = {}
	for _, world in ipairs(w.GameItems.Worlds:GetChildren()) do
		local tFolder = world:FindFirstChild("Treadmills")
		if tFolder then
			for _, treadmill in ipairs(tFolder:GetChildren()) do
				table.insert(treadmills, treadmill.Name)
			end
		end
	end
end

updateEggs()
updateTreadmills()

t1:Checkbox({
	Label = "Auto TP to Win Parts",
	Value = false,
	Callback = function(_, v) autoTP = v end
})

t1:Checkbox({
	Label = "Auto Training (1-5)",
	Value = false,
	Callback = function(_, v) autoTrain = v end
})

t1:Combo({
	Label = "Auto Train (Detected)",
	Selected = "",
	Items = treadmills,
	Callback = function(_, v) selectedTreadmill = v end
})

t1:Checkbox({
	Label = "Enable Auto Train Fast (From You Select)",
	Value = false,
	Callback = function(_, v) autoTrainByCombo = v end
})

t1:Checkbox({
	Label = "Auto Equip Best Pets",
	Value = false,
	Callback = function(_, v) autoBestPet = v end
})

t1:Checkbox({
	Label = "Auto Open Quest",
	Value = false,
	Callback = function(_, v) autoQuest = v end
})

t1:Checkbox({
	Label = "Auto Rebirth",
	Value = false,
	Callback = function(_, v) autoRebirth = v end
})

t2:Combo({
	Label = "Select Egg",
	Selected = "",
	Items = eggs,
	Callback = function(_, v) selectedEgg = v end
})

t2:Checkbox({
	Label = "Auto Hatch Selected Egg",
	Value = false,
	Callback = function(_, v) autoHatch = v end
})

t2:Button({
	Text = "Hatch Selected Egg (Manual)",
	Callback = function()
		if selectedEgg and selectedEgg ~= "" then
			r.Library.Knit.Services.EggService.RE.HatchEgg:FireServer(selectedEgg, "Single")
		end
	end
})

local infJump, walkSpeed, jumpPower = false, 16, 50

t3:SliderFloat({
	Label = "Walk Speed",
	Minimum = 16,
	Maximum = 200,
	Value = 16,
	Callback = function(_, v)
		walkSpeed = v
		if hum then hum.WalkSpeed = v end
	end
})

t3:SliderFloat({
	Label = "Jump Power",
	Minimum = 50,
	Maximum = 200,
	Value = 50,
	Callback = function(_, v)
		jumpPower = v
		if hum then hum.JumpPower = v end
	end
})

t3:Checkbox({
	Label = "Infinite Jump",
	Value = false,
	Callback = function(_, v) infJump = v end
})

t4:Checkbox({
	Label = "Anti-AFK",
	Value = false,
	Callback = function(_, v) antiAfk = v end
})

u.JumpRequest:Connect(function()
	if infJump and hum then
		hum:ChangeState(Enum.HumanoidStateType.Jumping)
	end
end)

rs.Stepped:Connect(function()
	if lp.Character and hum then
		hum.WalkSpeed = walkSpeed
		hum.JumpPower = jumpPower
	end
end)

task.spawn(function()
	while true do
		pcall(function()
			updateEggs()
			updateTreadmills()
			if autoTP and hrp then
				r.Library.Knit.Services.RaceService.RE.Start:FireServer()
				local parts = w:FindFirstChild("Win Parts")
				if parts then
					for _, part in ipairs(parts:GetChildren()) do
						if tonumber(part.Name) then
							hrp.CFrame = part.CFrame + Vector3.new(0, 3, 0)
							task.wait(0.15)
						end
					end
				end
			end
			if autoTrain then
				for i = 1, 5 do
					r.Library.Knit.Services.TrainingService.RE.Train:FireServer(tostring(i))
				end
			end
			if autoTrainByCombo and selectedTreadmill and selectedTreadmill ~= "" then
				r.Library.Knit.Services.TrainingService.RE.Train:FireServer(selectedTreadmill)
			end
			if autoBestPet then
				r.Library.Knit.Services.PetsService.RE.EquipBest:FireServer()
			end
			if autoQuest then
				r.Library.Knit.Services.MiscService.RE.QuestPet:FireServer()
			end
			if autoRebirth then
				r.Library.Knit.Services.RebirthService.RE.Rebirth:FireServer()
			end
			if autoHatch and selectedEgg and selectedEgg ~= "" then
				r.Library.Knit.Services.EggService.RE.HatchEgg:FireServer(selectedEgg, "Single")
			end
		end)
		task.wait(0.4)
	end
end)

task.spawn(function()
	while true do
		if antiAfk then
			vim:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
		end
		task.wait(60)
	end
end)