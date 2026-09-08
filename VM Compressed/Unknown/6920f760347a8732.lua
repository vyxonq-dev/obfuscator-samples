-- services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local remote = ReplicatedStorage.Packages.Packets.PacketModule.RemoteEvent

-- ui
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
	Name = "[UPD] +1 Speed Escape for Brainrots!",
	LoadingTitle = "Brainrots Hub",
	LoadingSubtitle = "Automation",
	ConfigurationSaving = { Enabled = false }
})

local Main = Window:CreateTab("Main", 4483362458)

-- settings
local plot = 1
local maxPlatform = 100
local autoBuy = false
local autoUpgrade = false
local showLogs = false
local upgradeDelay = 0.12

-- utility

local function getCharacter()
	local char = player.Character
	if not char or not char.Parent then
		char = player.CharacterAdded:Wait()
	end
	return char
end

local function getFolder()
	local map = workspace:FindFirstChild("Map")
	if not map then return nil end
	
	local plots = map:FindFirstChild("Plots")
	if not plots then return nil end
	
	local currentPlot = plots:FindFirstChild("Plot"..plot)
	if not currentPlot then return nil end
	
	local platforms = currentPlot:FindFirstChild("Platforms")
	if not platforms then return nil end
	
	return platforms:FindFirstChild("Platforms")
end

-- money formatter
local function toNumber(text)
	text = text:gsub("%$", "")

	local mult = 1
	if text:find("K") then mult = 1e3 end
	if text:find("M") then mult = 1e6 end
	if text:find("B") then mult = 1e9 end
	if text:find("T") then mult = 1e12 end

	text = text:gsub("[KMBT]", "")
	return tonumber(text) and tonumber(text) * mult or math.huge
end

-- upgrade fire
local function upgradePlatform(index)
	local packet = "\022" ..
		string.char(4 + index) ..
		string.char(index)

	remote:FireServer(buffer.fromstring(packet))
end

-- plot controls

Main:CreateSection("Select Your Plot (1st plot is far left numbered going right) 1  →  5")

Main:CreateSlider({
	Name = "Plot",
	Range = {1,5},
	Increment = 1,
	CurrentValue = 1,
	Callback = function(v)
		plot = v
	end
})

Main:CreateSlider({
	Name = "Max Platform Number",
	Range = {1,100},
	Increment = 1,
	CurrentValue = 100,
	Callback = function(v)
		maxPlatform = v
	end
})

-- auto collect

Main:CreateSection("Auto Collect Money")

Main:CreateToggle({
	Name = "Auto Collect Money",
	CurrentValue = false,
	Callback = function(v)
		autoBuy = v

		if autoBuy then
			task.spawn(function()
				while autoBuy do
					local folder = getFolder()
					if not folder then
						task.wait(0.5)
						continue
					end

					local character = getCharacter()
					local root = character:FindFirstChild("HumanoidRootPart")
					if not root then
						task.wait(0.2)
						continue
					end

					for i = 1, maxPlatform do
						if not autoBuy then break end

						local platform = folder:FindFirstChild("Platform"..i)
						if platform then
							local btn = platform:FindFirstChild("Button", true)
							if btn then
								if btn:IsA("Model") then
									character:PivotTo(btn:GetPivot())
								elseif btn:IsA("BasePart") then
									character:PivotTo(btn.CFrame)
								end
								task.wait(0.12)
							end
						end
					end

					task.wait(0.4)
				end
			end)
		end
	end
})

-- auto upgrade

Main:CreateSection("Auto Upgrade")

Main:CreateToggle({
	Name = "Auto Cheapest Upgrade",
	CurrentValue = false,
	Callback = function(v)
		autoUpgrade = v

		if autoUpgrade then
			task.spawn(function()
				while autoUpgrade do
					local folder = getFolder()
					if not folder then
						task.wait(0.5)
						continue
					end

					local cheapestIndex
					local cheapestCost = math.huge
					local displayCost = ""

					for i = 1, maxPlatform do
						local platform = folder:FindFirstChild("Platform"..i)
						if platform then
							local costLabel = platform
								:FindFirstChild("UpgradeButton")
								and platform.UpgradeButton
									:FindFirstChild("UpgradeButtonSurface")
								and platform.UpgradeButton.UpgradeButtonSurface
									:FindFirstChild("ImageButton")
								and platform.UpgradeButton.UpgradeButtonSurface.ImageButton
									:FindFirstChild("UpgradeCost")

							local locked = platform
								:FindFirstChild("UpgradeButton")
								and platform.UpgradeButton
									:FindFirstChild("UpgradeButtonSurface")
								and platform.UpgradeButton.UpgradeButtonSurface
									:FindFirstChild("ImageButton")
								and platform.UpgradeButton.UpgradeButtonSurface.ImageButton
									:FindFirstChild("NotAfford")

							if costLabel and (not locked or not locked.Visible) then
								local cost = toNumber(costLabel.Text)

								if cost < cheapestCost then
									cheapestCost = cost
									cheapestIndex = i
									displayCost = costLabel.Text
								end
							end
						end
					end

					if cheapestIndex then
						if showLogs then
							print("Upgrading Platform", cheapestIndex, "| Cost:", displayCost)
						end

						upgradePlatform(cheapestIndex)
						task.wait(upgradeDelay)
					else
						task.wait(0.5)
					end
				end
			end)
		end
	end
})

Main:CreateSlider({
	Name = "Upgrade Delay",
	Range = {0.05, 0.5},
	Increment = 0.05,
	CurrentValue = 0.12,
	Callback = function(v)
		upgradeDelay = v
	end
})

Main:CreateToggle({
	Name = "Show Upgrade Logs",
	CurrentValue = false,
	Callback = function(v)
		showLogs = v
	end
})
