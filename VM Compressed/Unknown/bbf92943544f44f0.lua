local r = game:GetService("ReplicatedStorage")
local w = game:GetService("Workspace")
local u = game:GetService("UserInputService")
local p = game:GetService("Players")
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
local win = g:TabsWindow({ Title = "Lumberjack Simulator", Size = UDim2.fromOffset(600, 420), Position = UDim2.fromOffset(100, 100) })

local t1 = win:CreateTab({ Name = "Main" })
local t2 = win:CreateTab({ Name = "Eggs" })
local t3 = win:CreateTab({ Name = "Movement" })

local autoclick, autorebirth, autowin, autogift, autoequipaxe, autobuyegg, autochangeclick = false, false, false, false, false, false, false
local selectedWorld = "1"
local selectedEgg = ""
local eggs = {}

local function updateEggs()
	eggs = {}
	for _, egg in pairs(w.Eggs:GetChildren()) do
		local cost = egg:FindFirstChild("PriceHUD") and egg.PriceHUD:FindFirstChild("EggCost") and egg.PriceHUD.EggCost:FindFirstChild("Amount")
		local price = cost and cost.Text or "???"
		table.insert(eggs, egg.Name .. " (" .. price .. ")")
	end
end

updateEggs()

t1:Combo({
	Label = "World",
	Selected = "1",
	Items = { "1", "2", "3", "4", "5" },
	Callback = function(_, v) selectedWorld = v end
})

t1:Checkbox({
	Label = "Auto Click",
	Value = false,
	Callback = function(_, v) autoclick = v end
})

t1:Checkbox({
	Label = "Auto Claim Rewards",
	Value = false,
	Callback = function(_, v) autogift = v end
})

t1:Checkbox({
	Label = "Auto Rebirth",
	Value = false,
	Callback = function(_, v) autorebirth = v end
})

t1:Checkbox({
	Label = "Auto Equip Best Axe",
	Value = false,
	Callback = function(_, v) autoequipaxe = v end
})

t1:Checkbox({
	Label = "Auto Change Click",
	Value = false,
	Callback = function(_, v) autochangeclick = v end
})

t2:Combo({
	Label = "Egg",
	Selected = "",
	Items = eggs,
	Callback = function(_, v)
		selectedEgg = v:match("^(.-) %(")
	end
})

t2:Checkbox({
	Label = "Auto Buy Egg",
	Value = false,
	Callback = function(_, v) autobuyegg = v end
})

t2:Button({
	Text = "Buy Selected Egg",
	Callback = function()
		if selectedEgg then
			local egg = w.Eggs:FindFirstChild(selectedEgg)
			if egg then
				hrp.CFrame = egg.Model.MeshPart.CFrame + Vector3.new(0, 2, 0)
				r.GameClient.Events.RemoteFunction.BuyEgg:InvokeServer(selectedEgg, "Buy1")
			end
		end
	end
})

local infjump, noclip = false, false

t3:SliderFloat({
	Label = "WalkSpeed",
	Minimum = 16,
	Maximum = 200,
	Value = 16,
	Callback = function(_, v) if hum then hum.WalkSpeed = v end end
})

t3:SliderFloat({
	Label = "JumpPower",
	Minimum = 50,
	Maximum = 200,
	Value = 50,
	Callback = function(_, v) if hum then hum.JumpPower = v end end
})

t3:Checkbox({
	Label = "Infinite Jump",
	Value = false,
	Callback = function(_, v) infjump = v end
})

t3:Checkbox({
	Label = "Noclip",
	Value = false,
	Callback = function(_, v) noclip = v end
})

u.JumpRequest:Connect(function()
	if infjump and hum then
		hum:ChangeState(Enum.HumanoidStateType.Jumping)
	end
end)

rs.Stepped:Connect(function()
	if noclip and lp.Character then
		for _, part in pairs(lp.Character:GetDescendants()) do
			if part:IsA("BasePart") then
				part.CanCollide = false
			end
		end
	end
end)

task.spawn(function()
	while true do
		pcall(function()
			updateEggs()

			if autoclick then
				r.ClickEvent:FireServer("Click")
			end

			if autogift then
				for i = 1, 12 do
					r.GameClient.Events.RemoteEvent.ClaimGift:FireServer("Reward" .. i)
				end
			end

			if autorebirth then
				r.GameClient.Events.RemoteEvent.RebirthEvent:FireServer()
			end

			if autoequipaxe then
				for i = 1, 20 do
					r.GameClient.Events.RemoteEvent.EquipSwordEvent:FireServer(tostring(i), true)
				end
			end

			if autobuyegg and selectedEgg then
				local egg = w.Eggs:FindFirstChild(selectedEgg)
				if egg then
					hrp.CFrame = egg.Model.MeshPart.CFrame + Vector3.new(0, 2, 0)
					r.GameClient.Events.RemoteFunction.BuyEgg:InvokeServer(selectedEgg, "Buy1")
				end
			end

			if autochangeclick then
				local best = nil
				for i = 1, 20 do
					local item = r.Items.Pencil:FindFirstChild(tostring(i))
					if item then
						best = i
					end
				end
				if best then
					r.GameClient.Events.RemoteEvent.ClickChangeEvent:FireServer(r.Items.Pencil[tostring(best)])
				end
			end
		end)
		task.wait(0.4)
	end
end)