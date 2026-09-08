local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🎢Meow🎢",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "🎢Rollercoaster🎢",
   LoadingSubtitle = "by mond",
   ShowText = "Rayfield", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "V", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("Main Tab", nil) -- Title, Image
local MainSection = MainTab:CreateSection("Main")
Rayfield:Notify({
   Title = "Executed rollercoaster!",
   Content = "Build a rollercoaster best script",
   Duration = 5,
   Image = nil,
})

local Button = MainTab:CreateButton({
   Name = "Infinite Jump",
   Callback = function()
       --Toggles the infinite jump between on or off on every script run
_G.infinjump = not _G.infinjump

if _G.infinJumpStarted == nil then
	--Ensures this only runs once to save resources
	_G.infinJumpStarted = true
	
	--Notifies readiness
	game.StarterGui:SetCore("SendNotification", {Title="Youtube Hub"; Text="Infinite Jump Activated!"; Duration=5;})

	--The actual infinite jump
	local plr = game:GetService('Players').LocalPlayer
	local m = plr:GetMouse()
	m.KeyDown:connect(function(k)
		if _G.infinjump then
			if k:byte() == 32 then
			humanoid = game:GetService'Players'.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
			humanoid:ChangeState('Jumping')
			wait()
			humanoid:ChangeState('Seated')
			end
		end
	end)
end
   end,
})
local Button =MainTab:CreateButton({
   Name = "Click to tp",
   Callback = function()
        mouse = game.Players.LocalPlayer:GetMouse()
tool = Instance.new("Tool")
tool.RequiresHandle = false
tool.Name = "Click to TP"
tool.Activated:connect(function()
local pos = mouse.Hit+Vector3.new(0,2.5,0)
pos = CFrame.new(pos.X,pos.Y,pos.Z)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
end)
tool.Parent = game.Players.LocalPlayer.Backpack
   end,
})

local Slider = MainTab:CreateSlider({
   Name = "Walkspeed",
   Range = {0, 250},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Remotes / events
local ItemShop = ReplicatedStorage.Remotes.ItemShop -- RemoteFunction
local EnterCode = ReplicatedStorage.Remotes.EnterCode -- RemoteFunction
local OpenWindow = ReplicatedStorage.ClientEvents.OpenWindow -- BindableEvent

-- ===================== Track Shop Data =====================
local ShopItems = {
	["Straight Track"] = { price = 25 },
	["Turn Track"] = { price = 50 },
	["Bump Track"] = { price = 250 },
	["Climb Track"] = { price = 1500 },
	["Jump Track"] = { price = 3500 },
	["Fork Track"] = { price = 10000 },
	["Stop Track"] = { price = 55000 },
	["Long Climb Track"] = { price = 175000 },
	["Railed Turn Track"] = { price = 500000 },
	["Disappearing Track"] = { price = 1450000 },
	["Crossing Track"] = { price = 2000000 },
	["Long Straight Track"] = { price = 2250000 },
	["Speed Boost Track"] = { price = 6500000 },
	["Merge Left Track"] = { price = 10000000 },
	["Merge Right Track"] = { price = 10000000 },
	["Brake Track"] = { price = 12500000 },
	["Small Turn Track"] = { price = 15000000 },
	["Invisible Straight Track"] = { price = 17500000 },
	["Invisible Turn Track"] = { price = 22500000 },
	["Railed Climb Track"] = { price = 25000000 },
	["Flamethrower Track"] = { price = 33000000 },
	["Steep Track"] = { price = 67500000 },
	["Fireworks Track"] = { price = 80000000 },
	["Drop Track"] = { price = 100000000 },
	["Loop Track"] = { price = 250000000 },
}

-- ===================== Gear Shop Data =====================
local GearItems = {
	["Wrench"] = { price = 50000, order = 1 },
	["Gold Wrench"] = { price = 475000, order = 2 },
	["Careful Remover"] = { price = 3500000, order = 3 },
	["Port-A-Cart"] = { price = 7250000, order = 4 },
	["Diamond Wrench"] = { price = 15000000, order = 5 },
}

-- ===================== Codes =====================
local Codes = {
	release = { name = "release" },
	discordian = { name = "discordian" },
	robloxian = { name = "robloxian" },
	["1mvisits"] = { name = "1mvisits" },
}

-- ==========================================================
-- Auto Buy Tracks Tab
-- ==========================================================
local AutoBuyTab = Window:CreateTab("Auto Buy", "shopping-cart")

AutoBuyTab:CreateButton({
	Name = "Open Shop Window",
	Callback = function()
		local ReplicatedStorage = game:GetService("ReplicatedStorage")
		local OpenWindow = ReplicatedStorage.ClientEvents.OpenWindow
		OpenWindow:Fire("ItemShop")
		print("[SRBX] Fired OpenWindow('ItemShop') for Merchant John")
	end,
})

local AutoBuyToggles = {}

local function buyItem(itemName)
	local success, result = pcall(function()
		return ItemShop:InvokeServer("buy", "Tracks", itemName)
	end)
	if success then
		print("[SRBX] Bought:", itemName)
	else
		warn("[SRBX] Failed to buy:", itemName, result)
	end
end

task.spawn(function()
	while true do
		for name, enabled in pairs(AutoBuyToggles) do
			if enabled then
				buyItem(name)
				task.wait(0.2)
			end
		end
		task.wait(1)
	end
end)

local sortedItems = {}
for name, info in pairs(ShopItems) do
	table.insert(sortedItems, { name = name, price = info.price })
end
table.sort(sortedItems, function(a, b) return a.price < b.price end)

for _, item in ipairs(sortedItems) do
	AutoBuyTab:CreateToggle({
		Name = string.format("%s  %s", item.name, item.price),
		CurrentValue = false,
		Callback = function(v)
			AutoBuyToggles[item.name] = v
			print(string.format("[SRBX] AutoBuy %s: %s", v and "enabled" or "disabled", item.name))
		end,
	})
end

-- ==========================================================
-- Codes Tab
-- ==========================================================
local CodesTab = Window:CreateTab("Codes", "gift")

local function redeemCode(code)
	local success, result = pcall(function()
		return EnterCode:InvokeServer(code)
	end)
	if success then
		print("[SRBX] Redeemed:", code)
	else
		warn("[SRBX] Failed to redeem:", code, result)
	end
end

CodesTab:CreateButton({
	Name = "Redeem All Codes",
	Callback = function()
		for codeName, _ in pairs(Codes) do
			redeemCode(codeName)
			task.wait(0.2)
		end
		Rayfield:Notify({
			Title = "ScriptsRBX Codes",
			Content = "All available codes have been redeemed!",
			Duration = 5,
		})
	end,
})

-- ==========================================================
-- Gear Shop Tab
-- ==========================================================
local GearTab = Window:CreateTab("Gear Shop", "hammer")

GearTab:CreateButton({
	Name = "Open Gear Shop Window",
	Callback = function()
		local ReplicatedStorage = game:GetService("ReplicatedStorage")
		local OpenWindow = ReplicatedStorage.ClientEvents.OpenWindow
		OpenWindow:Fire("ItemShop")
		print("[SRBX] Fired OpenWindow('ItemShop') for Gary Gear Shop")
	end,
})

local AutoBuyGears = {}

local function buyGear(gearName)
	local success, result = pcall(function()
		return ItemShop:InvokeServer("buy", "Gears", gearName)
	end)
	if success then
		print("[SRBX] Bought Gear:", gearName)
	else
		warn("[SRBX] Failed to buy gear:", gearName, result)
	end
end

task.spawn(function()
	while true do
		for name, enabled in pairs(AutoBuyGears) do
			if enabled then
				buyGear(name)
				task.wait(0.2)
			end
		end
		task.wait(1)
	end
end)

local sortedGears = {}
for name, info in pairs(GearItems) do
	table.insert(sortedGears, { name = name, price = info.price })
end
table.sort(sortedGears, function(a, b) return a.price < b.price end)

for _, gear in ipairs(sortedGears) do
	GearTab:CreateToggle({
		Name = string.format("%s  %s", gear.name, gear.price),
		CurrentValue = false,
		Callback = function(v)
			AutoBuyGears[gear.name] = v
			print(string.format("[SRBX] AutoBuy %s: %s", v and "enabled" or "disabled", gear.name))
		end,
	})
end