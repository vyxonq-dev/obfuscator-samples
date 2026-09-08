local r = game:GetService("ReplicatedStorage")

local w = game:GetService("Workspace")

local p = game:GetService("Players")

local u = game:GetService("UserInputService")

local rs = game:GetService("RunService")

local lp = p.LocalPlayer

local vim = game:GetService("VirtualInputManager")

local hrp, hum

local function c()

	local ch = lp.Character or lp.CharacterAdded:Wait()

	hrp = ch:WaitForChild("HumanoidRootPart")

	hum = ch:WaitForChild("Humanoid")

end

c()

lp.CharacterAdded:Connect(c)

local g = loadstring(game:HttpGet("https://raw.githubusercontent.com/depthso/Dear-ReGui/main/ReGui.lua"))()

local win = g:TabsWindow({ Title = "Grow Your Rubik's Cube!", Size = UDim2.fromOffset(600, 420), Position = UDim2.fromOffset(100, 100) })

local t1 = win:CreateTab({ Name = "Main" })

local t2 = win:CreateTab({ Name = "Movement" })

local autoTpCubes, autoTouchCubes, ultraFastCollect, cubeDuplicate, infJump, safeCollect, tpAllPlayers = false, false, false, false, false, false, false

local walkSpeed, jumpPower = 16, 50

local selectedPlayer = ""

local playerList = {}

local function updatePlayers()

	playerList = {}

	for _, plr in pairs(p:GetPlayers()) do

		if plr ~= lp then

			table.insert(playerList, plr.Name)

		end

	end

end

updatePlayers()

p.PlayerAdded:Connect(updatePlayers)

p.PlayerRemoving:Connect(updatePlayers)

t1:Checkbox({

	Label = "Auto TP All Cubes",

	Value = false,

	Callback = function(_, v) autoTpCubes = v end

})

t1:Checkbox({

	Label = "Auto Touch Cubes (No TP)",

	Value = false,

	Callback = function(_, v) autoTouchCubes = v end

})

t1:Checkbox({

	Label = "Ultra-Fast TP + Collect",

	Value = false,

	Callback = function(_, v) ultraFastCollect = v end

})

t1:Checkbox({

	Label = "Duplicate Cubes (Local)",

	Value = false,

	Callback = function(_, v) cubeDuplicate = v end

})

t1:Checkbox({

	Label = "Safe Collect Mode (No TP)",

	Value = false,

	Callback = function(_, v) safeCollect = v end

})

t1:Checkbox({

	Label = "TP All Players To Me",

	Value = false,

	Callback = function(_, v) tpAllPlayers = v end

})

t1:Combo({

	Label = "Select Player To TP Here",

	Selected = "",

	Items = playerList,

	Callback = function(_, v) selectedPlayer = v end

})

t1:Button({

	Text = "TP Selected Player to Me",

	Callback = function()

		local target = p:FindFirstChild(selectedPlayer)

		if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") and hrp then

			target.Character.HumanoidRootPart.CFrame = hrp.CFrame + Vector3.new(3, 0, 0)

		end

	end

})

t2:SliderFloat({

	Label = "Walk Speed",

	Minimum = 16,

	Maximum = 200,

	Value = 16,

	Callback = function(_, v)

		walkSpeed = v

		if hum then hum.WalkSpeed = v end

	end

})

t2:SliderFloat({

	Label = "Jump Power",

	Minimum = 50,

	Maximum = 200,

	Value = 50,

	Callback = function(_, v)

		jumpPower = v

		if hum then hum.JumpPower = v end

	end

})

t2:Checkbox({

	Label = "Infinite Jump",

	Value = false,

	Callback = function(_, v) infJump = v end

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

			local cubes = w:FindFirstChild("CubeParticles")

			if cubes then

				for _, cube in ipairs(cubes:GetChildren()) do

					if cube:IsA("BasePart") then

						if safeCollect and hrp then

							firetouchinterest(hrp, cube, 0)

							firetouchinterest(hrp, cube, 1)

							task.wait(0.025)

						elseif ultraFastCollect and hrp then

							hrp.CFrame = cube.CFrame + Vector3.new(0, 3, 0)

							firetouchinterest(hrp, cube, 0)

							firetouchinterest(hrp, cube, 1)

							task.wait()

						elseif autoTpCubes and hrp then

							hrp.CFrame = cube.CFrame + Vector3.new(0, 3, 0)

							task.wait(0.05)

						elseif autoTouchCubes and hrp then

							firetouchinterest(hrp, cube, 0)

							firetouchinterest(hrp, cube, 1)

						end

						if cubeDuplicate and hrp then

							local clone = cube:Clone()

							clone.Parent = w

							clone.CFrame = hrp.CFrame + Vector3.new(0, 3, 0)

							firetouchinterest(hrp, clone, 0)

							firetouchinterest(hrp, clone, 1)

							task.wait(0.02)

						end

					end

				end

			end

		end)

		task.wait(0.2)

	end

end)

task.spawn(function()

	while true do

		if tpAllPlayers and hrp then

			for _, plr in pairs(p:GetPlayers()) do

				if plr ~= lp and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then

					plr.Character.HumanoidRootPart.CFrame = hrp.CFrame + Vector3.new(math.random(-5,5), 1, math.random(-5,5))

				end

			end

		end

		task.wait(1)

	end

end)