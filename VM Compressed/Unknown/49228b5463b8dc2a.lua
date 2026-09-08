-- loadstring(game:HttpGet("https://raw.githubusercontent.com/Vuffi2007/YBA-Teleport-to-Items-GUI/main/YBA-Teleport-to-Items-GUI.lua"))()

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Bottomtext = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")
local TitleUnderline = Instance.new("TextLabel")
local UICorner_2 = Instance.new("UICorner")
local toggleSelling = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local tpToItems = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local UICorner_5 = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local UICorner_6 = Instance.new("UICorner")

-- Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BackgroundTransparency = 0.300
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.01, 0, 0.16, 0)
Frame.Size = UDim2.new(0, 245, 0, 209)

Bottomtext.Name = "Bottom text"
Bottomtext.Parent = Frame
Bottomtext.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Bottomtext.BorderColor3 = Color3.fromRGB(0, 0, 0)
Bottomtext.BorderSizePixel = 0
Bottomtext.Position = UDim2.new(0.0851010829, 0, 0.86340785, 0)
Bottomtext.Size = UDim2.new(0, 200, 0, 21)
Bottomtext.Font = Enum.Font.SourceSansSemibold
Bottomtext.Text = "Made by Vuffi on Discord"
Bottomtext.TextColor3 = Color3.fromRGB(101, 24, 107)
Bottomtext.TextSize = 14.000

UICorner.CornerRadius = UDim.new(0.200000003, 0)
UICorner.Parent = Bottomtext

TitleUnderline.Name = "TitleUnderline"
TitleUnderline.Parent = Frame
TitleUnderline.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TitleUnderline.BorderColor3 = Color3.fromRGB(0, 0, 0)
TitleUnderline.BorderSizePixel = 0
TitleUnderline.Position = UDim2.new(0.0245901011, 0, 0.0435312092, 0)
TitleUnderline.Size = UDim2.new(0, 232, 0, 48)
TitleUnderline.Font = Enum.Font.SourceSansBold
TitleUnderline.Text = "YBA GUI"
TitleUnderline.TextColor3 = Color3.fromRGB(101, 24, 107)
TitleUnderline.TextScaled = true
TitleUnderline.TextSize = 14.000
TitleUnderline.TextWrapped = true

UICorner_2.CornerRadius = UDim.new(0.150000006, 0)
UICorner_2.Parent = TitleUnderline

toggleSelling.Name = "toggleSelling"
toggleSelling.Parent = Frame
toggleSelling.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
toggleSelling.BorderColor3 = Color3.fromRGB(0, 0, 0)
toggleSelling.BorderSizePixel = 0
toggleSelling.Position = UDim2.new(0.115576386, 0, 0.601647317, 0)
toggleSelling.Size = UDim2.new(0, 185, 0, 40)
toggleSelling.Font = Enum.Font.SourceSansSemibold
toggleSelling.Text = "Toggle selling: off"
toggleSelling.TextColor3 = Color3.fromRGB(101, 24, 107)
toggleSelling.TextScaled = true
toggleSelling.TextSize = 14.000
toggleSelling.TextWrapped = true

UICorner_3.CornerRadius = UDim.new(0.150000006, 0)
UICorner_3.Parent = toggleSelling

tpToItems.Name = "tpToItems"
tpToItems.Parent = Frame
tpToItems.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
tpToItems.BorderColor3 = Color3.fromRGB(0, 0, 0)
tpToItems.BorderSizePixel = 0
tpToItems.Position = UDim2.new(0.115576386, 0, 0.336887568, 0)
tpToItems.Size = UDim2.new(0, 185, 0, 40)
tpToItems.Font = Enum.Font.SourceSansSemibold
tpToItems.Text = "TP to items: off"
tpToItems.TextColor3 = Color3.fromRGB(101, 24, 107)
tpToItems.TextScaled = true
tpToItems.TextSize = 14.000
tpToItems.TextWrapped = true

UICorner_4.CornerRadius = UDim.new(0.150000006, 0)
UICorner_4.Parent = tpToItems

UICorner_5.CornerRadius = UDim.new(0.0299999993, 0)
UICorner_5.Parent = Frame

Title.Name = "Title"
Title.Parent = Frame
Title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0.0245901011, 0, 0.0435312428, 0)
Title.Size = UDim2.new(0, 232, 0, 44)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "YBA GUI"
Title.TextColor3 = Color3.fromRGB(101, 24, 107)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true

UICorner_6.CornerRadius = UDim.new(0.150000006, 0)
UICorner_6.Parent = Title

-- Scripts:

local function QLMOT_fake_script() -- ScreenGui.LocalScript 
	local script = Instance.new('LocalScript', ScreenGui)

	local function travelTo(place) -- Does the math and teleports you in chunks to bypass tp anticheat
		local plr = game.Players.LocalPlayer.Character.HumanoidRootPart
		local vector = place.Position - plr.Position
	
		local length = vector.Magnitude
	
		local num_tp = math.ceil(length / 50)
	
		plr.CFrame = plr.CFrame + vector / num_tp
	end

	local tpOn = false
	local sell = false
	
	function mainTP() -- Finds the item
		while tpOn do
			maxItems() -- Checks if I have max items before starting
			for _, v in pairs(game.Workspace.Item_Spawns.Items:GetChildren()) do
				local item = v:FindFirstChild("MeshPart")
				if item and item:FindFirstChild("PointLight") then -- Checks if there actually is an item in this location
					local proxPrompt = v.ProximityPrompt
					while item:IsDescendantOf(game.Workspace) and tpOn do
						local plr = game.Players.LocalPlayer.Character.HumanoidRootPart
						travelTo(item)
						if (item.Position - plr.Position).Magnitude < 5 then
							maxItems()
							fireproximityprompt(proxPrompt, 4)
						end
						task.wait(0.05)
					end
					maxItems()
				end
			end
			task.wait(1)
		end
	end
	
	function maxItems()
	
		items = {
			["Mysterious Arrow"] = 0,
			["Rokakaka"] = 0,
			["Gold Coin"] = 0,
			["Diamond"] = 0,
			["Pure Rokakaka"] = 0,
			["Quinton's Glove"] = 0,
			["Steel Ball"] = 0,
			["Rib Cage of The Saint's Corpse"] = 0,
			["Zepellin's Headband"] = 0,
            ["Zeppeli's Hat"] = 0,
			["Caesar's Headband"] = 0,
			["Clackers"] = 0,
			["Stone Mask"] = 0,
			["Ancient Scroll"] = 0,
			["Dio's Diary"] = 0,
			["Pure Rokakaka"] = 0,
			["Lucky Stone Mask"] = 0,
			["Gold Umbrella"] = 0
		}
	
		local maxLimits = {  -- Add to the list if I missed an item
			["Mysterious Arrow"] = 25,
			["Rokakaka"] = 25,
			["Gold Coin"] = 45,
			["Diamond"] = 25,
			["Pure Rokakaka"] = 10,
			["Quinton's Glove"] = 10,
			["Steel Ball"] = 10,
			["Rib Cage of The Saint's Corpse"] = 10,
			["Zepellin's Headband"] = 10,
            ["Zeppeli's Hat"] = 10,
			["Caesar's Headband"] = 10,
			["Clackers"] = 10,
			["Stone Mask"] = 10,
			["Ancient Scroll"] = 10,
			["Dio's Diary"] = 10,
			["Pure Rokakaka"] = 999,
			["Lucky Stone Mask"] = 999,
			["Lucky Arrow"] = 999,
			["Gold Umbrella"] = 999,
			["Left Arm of The Saint's Corpse"] = 999,
			["Heart of The Saint's Corpse"] = 999,
			["Pelvis of The Saint's Corpse"] = 999
		}
	
		for _, item in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if items[item.Name] then
				items[item.Name] = items[item.Name] + 1
				if (items[item.Name] >= (maxLimits[item.Name] or 25)) and sell then
					sellItem(item)
				end
			end
		end
	end
	
	function sellItem(item)
		local plrName = game.Players.LocalPlayer.Name
		local itemName = game.Players.LocalPlayer.Backpack:FindFirstChild(item.Name)
		itemName.Parent = game.Workspace.Living:FindFirstChild(plrName)
	
		local args = {
			[1] = "EndDialogue",
			[2] = {
				["NPC"] = "Merchant",
				["Option"] = "Option2",
				["Dialogue"] = "Dialogue5"
			}
		}
	
		game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(args))
	end
	
	local sellingButton = script.Parent.Frame.toggleSelling
	sellingButton.MouseButton1Click:Connect(function()
		sell = not sell
		if sell then
			sellingButton.Text = "Toggle selling: on"
		else
			sellingButton.Text = "Toggle selling: off"
		end
		maxItems()
	end)
	
	local tpButton = script.Parent.Frame.tpToItems
	tpButton.MouseButton1Click:Connect(function()
		tpOn = not tpOn
		if tpOn then
			tpButton.Text = "Tp to items: on"
			coroutine.wrap(mainTP)()
		else
			tpButton.Text = "Tp to items: off"
		end
		print("TP to items is now " .. tostring(tpOn))
	end)
end
coroutine.wrap(QLMOT_fake_script)()