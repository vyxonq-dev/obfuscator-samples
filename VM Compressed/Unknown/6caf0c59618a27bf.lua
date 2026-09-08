local Abbreviation_upvr = require(game.ReplicatedStorage.Vendor.Abbreviation)
local os_time_result1_upvw = os.time()
local os_time_result1_upvr = os.time({
	year = 2025;
	month = 4;
	day = 19;
	hour = 14;
	min = 0;
	sec = 0;
})
local var6 = os_time_result1_upvr - os_time_result1_upvw
local AWREHub = Instance.new("ImageButton")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local TextLabel = Instance.new("TextLabel")
local Icon = Instance.new("ImageLabel")
local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
local Alert = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TextLabel_2 = Instance.new("TextLabel")
local UIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint")
local UIScale = Instance.new("UIScale")
local UIStroke = Instance.new("UIStroke")
AWREHub.Name = "AWD Hub"
AWREHub.Parent = game.Players.LocalPlayer.PlayerGui.GameUI.Left.Buttons
AWREHub.AnchorPoint = Vector2.new(0.5, 0.5)
AWREHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AWREHub.BackgroundTransparency = 1.000
AWREHub.BorderColor3 = Color3.fromRGB(27, 42, 53)
AWREHub.BorderSizePixel = 0
AWREHub.LayoutOrder = 100
AWREHub.Position = UDim2.new(0.0449640267, 0, 0.0449640229, 0)
AWREHub.Size = UDim2.new(1.04999995, 0, 1.04999995, 0)
AWREHub.Image = "rbxassetid://13151177699"
AWREHub.ScaleType = Enum.ScaleType.Fit
AWREHub:AddTag("ButtonAnimation")
UIAspectRatioConstraint.Parent = AWREHub
TextLabel.Parent = AWREHub
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(27, 42, 53)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(-3.26712666e-08, 0, 0.734258235, 0)
TextLabel.Size = UDim2.new(1.00000012, 0, 0.319972456, 0)
TextLabel.ZIndex = 2
TextLabel.Font = Enum.Font.FredokaOne
TextLabel.Text = "AWD Hub"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true
Icon.Name = "Icon"
Icon.Parent = AWREHub
Icon.AnchorPoint = Vector2.new(0.5, 0.5)
Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Icon.BackgroundTransparency = 1.000
Icon.BorderColor3 = Color3.fromRGB(27, 42, 53)
Icon.BorderSizePixel = 0
Icon.Position = UDim2.new(0.49999997, 0, 0.51238668, 0)
Icon.Size = UDim2.new(0.850000024, 0, 0.725226641, 0)
Icon.Image = "rbxassetid://112642412867757"
Icon.ScaleType = Enum.ScaleType.Fit
UIAspectRatioConstraint_2.Parent = Icon
Alert.Name = "Alert"
Alert.Parent = AWREHub
Alert.AnchorPoint = Vector2.new(0.5, 0.5)
Alert.BackgroundColor3 = Color3.fromRGB(163, 254, 16)
Alert.BorderColor3 = Color3.fromRGB(27, 42, 53)
Alert.LayoutOrder = -1
Alert.Position = UDim2.new(0.802999973, 0, 0.189999998, 0)
Alert.Size = UDim2.new(0.645314276, 0, 0.29653284, 0)
Alert.Visible = false
Alert.ZIndex = 9
UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = Alert
TextLabel_2.Parent = Alert
TextLabel_2.AnchorPoint = Vector2.new(0.5, 0.5)
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
TextLabel_2.Position = UDim2.new(0.50999999, 0, 0.550000012, 0)
TextLabel_2.Size = UDim2.new(0.899999976, 0, 0.850000024, 0)
TextLabel_2.ZIndex = 10
TextLabel_2.Font = Enum.Font.FredokaOne
TextLabel_2.Text = "!"
TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 14.000
TextLabel_2.TextStrokeTransparency = 0.000
TextLabel_2.TextWrapped = true
UIAspectRatioConstraint_3.Parent = Alert
UIScale.Parent = AWREHub
UIStroke.Parent = AWREHub.TextLabel
UIStroke.Thickness = 2

local Fluent = loadstring(game:HttpGet("https://pastebin.com/raw/1ii8pT1W"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

AWREHub.MouseButton1Click:Connect(function()
	game.CoreGui.ScreenGui.Enabled = true
	for i,v in pairs(game.CoreGui.ScreenGui:GetChildren()) do
		if v.Visible == false then
			v.Visible = true
		else
			v.Visible = false
		end
	end
end)

local EggData = require(game.ReplicatedStorage.Enums.EggTypes)
local Knit = require(game.ReplicatedStorage.Packages.Knit)

-- local HalloweenBreakables = game.Workspace.GameObjects.Breakables
-- local BreakableHit = game:GetService("ReplicatedStorage").Packages.Knit.Services.BreakableService.RF.HitBreakable

local Splitter, PetSplitter, Amount, A_1, A_2, A_25, Eventos, SelEnchant, EquipProcess, ClaimPet, WorldTeleport, AutoCurrentEventRouletteMultiplier  -- Other

local EquipProcess = true

local SelectedAutoTower

local HatchEventEggs, SelectedEgg, EggsGet, OpenEgg, EventFortuneSelected -- Eggs

local NotificationColor, NotificationMessage, NotificationSound -- Notifications

local SelectedNPCs, PrisonSelectedNPCs, ALTPrisonSelectedNPCs -- NPCs Selected

local AutoSantaWorkshopFortuneMultiplier, AutoIcyFortuneMultiplier, AutoCurrentEventPrimaryRoulette, AutoSnowOpsMultiplier, AutoCurrentEventSecondaryRouletteMultiplier, SprayTap -- Fortunes

local PlayBreakableSound = game:GetService("SoundService")["Kubo sounds"].Bop
local GameUI = game:GetService("Players").LocalPlayer.PlayerGui.GameUI
local DragonFruitTier, CookieTier, BananaTier, PineappleTier, PearTier, DonutTier, RaspberryTier, StarfruitTier -- Fruits

local Knit = require(game.ReplicatedStorage.Packages.Knit)

local Window = Fluent:CreateWindow({
	Title = "Arm Wrestle Datamines - Updates:",
	SubTitle = Abbreviation_upvr.FormatLongTime(var6),
	TabWidth = 160,
	Size = UDim2.fromOffset(500, 300 + (50 * 1)),
	Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
	Theme = "White",
	MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
	UpdateLog = Window:AddTab({ Title = "Update Log of AWD!", Icon = "rbxassetid://16109345599" }),
	Eggs = Window:AddTab({ Title = "Eggs!", Icon = "rbxassetid://13729795161" }),
	--PastEvent = Window:AddTab({ Title = "Unknown Event", Icon = "rbxassetid://134705989880579" }),
	AutoMachines = Window:AddTab({ Title = "Auto Machines", Icon = "rbxassetid://14407239632" }),
	FreeGamepasses = Window:AddTab({ Title = "Free Gamepasses", Icon = "rbxassetid://14853319104" }),
	CurrentEvent = Window:AddTab({ Title = "Superheroes Event", Icon = "rbxassetid://128857499740243" }),
	ChristmasEventLeftovers = Window:AddTab({ Title = "Event Crates Leftovers", Icon = "rbxassetid://134705989880579" }),
	ComboFunctions = Window:AddTab({ Title = "Combo Functions! (BETA)"}),
	AD = Window:AddTab({ Title = "Less functions?"}),
	AutoAura = Window:AddTab({ Title = "Auto Aura", Icon = "rbxassetid://85193980699658"}),
	--AutoTowers = Window:AddTab({ Title = "Auto Towers"}),
	--AutoSpinners = Window:AddTab({ Title = "Auto Spinners"}),
	--AutoMechants = Window:AddTab({ Title = "Auto Merchants"}),
	--AutoBosses = Window:AddTab({ Title = "Auto Bosses"}),
	-- OGStyle = Window:AddTab({ Title = "AWS Mod (OG UI)", Icon = "rbxassetid://95511377037227" })
}

local Options = Fluent.Options

-- Notification Exploit

do
	Tabs.UpdateLog:AddParagraph({
		Title = "AWD Hub Tiny Update!",
		Content = "What new added:\n- New Paragraph Auto Aura.\nWhat soon:\nRework Auto NPC"
	})
	Tabs.UpdateLog:AddParagraph({
		Title = "Navigations",
		Content = "Teleport to worlds: Page \"Free Gamepasses\"\nAuto Clicker to Bosses: Page \"Free Gamepasses\"\nLDS Hub: Page \"Less functions?\""
	})
end

-- Auto Towers

do
	Tabs.AutoAura:AddParagraph({
		Title = "Auto Aura",
		Content = "Roll aura x3 faster!"
	})

	local AutoAuraTest = Tabs.AutoAura:AddToggle("AutoAuraEnabled", {Title = "Auto Roll Aura!", Default = false })

	AutoAuraTest:OnChanged(function(boolean)
		if Options.AutoAuraEnabled.Value == true then
			while wait() do
				if Options.AutoAuraEnabled.Value == true then
                    local EventDouble = game:GetService("ReplicatedStorage").Packages.Knit.Services.AuraService.RF.Roll
                    EventDouble:InvokeServer()
					if boolean == false then break end
				end
			end
		end
	end)

end

-- Combo Functions

do
	Tabs.ComboFunctions:AddParagraph({
		Title = "Superhero Event",
		Content = "Auto NPC + Auto Spin Bulk Smash Fortune, Auto Trials & Chest!"
	})
	Tabs.ComboFunctions:AddParagraph({
		Title = "Use next cheese: Auto NPC Drealord + Auto Spin Bulk\n Smash Fortune!",
		Content = "If you select best auto-npc, you can spin this fortune infinite times and even get additional SuperCoins!"
	})

	local AltAutoPrisonEventNPCSelect = Tabs.ComboFunctions:AddDropdown("Dropdown", {
		Title = "Auto NPC Select",
		Values = {"EvilLair-Dreadlord","EvilLair-Skullbane","EvilLair-Spectron","EvilLair-Vortex","SuperheroCity-Inferno","SuperheroCity-Jolt","SuperheroCity-Phantom","SuperheroCity-Radiance", "VillainCave-FacelessRecruit", "VillainCave-Boombeard"},
		Multi = false,
		Default = 1,
	})

	AltAutoPrisonEventNPCSelect:OnChanged(function(ALTNPCs)
		ALTPrisonSelectedNPCs = ALTNPCs
	end)
	
	local AutoFortuneSpinnerEventSelect = Tabs.ComboFunctions:AddDropdown("Dropdown", {
		Title = "Auto Event Fortune\n Spinner Select",
		Values = {"Bulk Smash Fortune","Crimson Fortune"},
		Multi = false,
		Default = 1,
	})

	AutoFortuneSpinnerEventSelect:OnChanged(function(ttt)
		EventFortuneSelected = ttt
	end)

	local Spray = Tabs.ComboFunctions:AddDropdown("Dropdown", {
		Title = "How Many Times Auto\n Spin Selected Fortune Spinner?",
		Values = {"x1", "x3", "x10"},
		Multi = false,
		Default = 1,
	})

	Spray:OnChanged(function(asofalt)
		SprayTap = asofalt
	end)

	local AutoNPCandAutoSpin = Tabs.ComboFunctions:AddToggle("AutoNPCandSpinEnabled", {Title = "Auto NPC & Spin Fortune!", Default = false })

	AutoNPCandAutoSpin:OnChanged(function(boolean)
		if Options.AutoNPCandSpinEnabled.Value == true then
			while wait() do
				if Options.AutoNPCandSpinEnabled.Value == true then
					local A_12 = tostring(EventFortuneSelected)
					if SprayTap == "x1" then
						A_25 = nil
					elseif SprayTap == "x3" then
						A_25 = "x10"
					elseif SprayTap == "x10" then
						A_25 = "x25"
					end
					Eventos = game:GetService("ReplicatedStorage").Packages.Knit.Services.SpinnerService.RF.Spin
					Eventos:InvokeServer(A_12, A_25)
					for i,v in pairs(workspace.GameObjects.RngNPCs[tostring(ALTPrisonSelectedNPCs)].Npc:GetDescendants()) do
						if v:IsA("Part") and v.Name == "Proximity" then
							if Options.AutoNPCandSpinEnabled.Value == true then
								v.CFrame = workspace[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame
								if boolean == false then
									v:InputHoldEnd() 
									break 
								end
							end
						elseif v.Name == "ProximityPrompt" then
							if Options.AutoNPCandSpinEnabled.Value == true then
								v.HoldDuration = 0
								v:InputHoldBegin()
								v:InputHoldEnd()
								if boolean == false then 
									v:InputHoldEnd() 
									break 
								end
							end
						end
					end
					if boolean == false then break end		
				end
				if boolean == false then break end
			end
		end
	end)
	
	local AutoTrialsAndChest = Tabs.ComboFunctions:AddToggle("AutoTrialsAndChestEnabled", {Title = "Auto Event Trials & Chest!", Default = false })

	AutoTrialsAndChest:OnChanged(function(boolean)
		if Options.AutoTrialsAndChestEnabled.Value == true then
			while wait() do
				if Options.AutoTrialsAndChestEnabled.Value == true then
					local A_2 = "Villain"
					local Events = game:GetService("ReplicatedStorage").Packages.Knit.Services.ChampionshipService.RF.RequestJoin
					Events:InvokeServer(A_2)
					local A_1 = "VillainChest"
					local Event = game:GetService("ReplicatedStorage").Packages.Knit.Services.ChestService.RF.Open
					Event:InvokeServer(A_1)
					if boolean == false then break end
				end
			end
		end
	end)
end

-- AD

do
	Tabs.AD:AddParagraph({
		Title = "Need more functions? Go in LDS Hub!",
		Content = "In LDS Hub have more functions than here, example: Auto Merchant, Tokens, etc..."
	})

	Tabs.AD:AddButton({
		Title = "Open LDS Hub!",
		Description = "Hub, which have functions, and supports games, like Arm Wrestle Simulator",
		Callback = function()
			loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/49f02b0d8c1f60207c84ae76e12abc1e.lua"))()
		end
	})
end

-- Christmas Leftovers

do
	Tabs.ChristmasEventLeftovers:AddParagraph({
		Title = "Christmas Leftovers",
		Content = "Roll Christmas Safe, Contraband Crate?"
	})

	local RollChyristSafe = Tabs.ChristmasEventLeftovers:AddToggle("AutoChristmasSafeEnabled", {Title = "Auto Roll Christmas Safe!", Default = false })

	RollChyristSafe:OnChanged(function(boolean)
		if Options.AutoChristmasSafeEnabled.Value == true then
			while wait() do
				if Options.AutoChristmasSafeEnabled.Value == true then
					local A_1 = "Christmas"
					local Event = game:GetService("ReplicatedStorage").Packages.Knit.Services.ItemCrateService.RF.Spin                    
					Event:InvokeServer(A_1)
					if boolean == false then break end		
				end
				if boolean == false then break end
			end
		end
	end)

	local RollCountrabandCrate = Tabs.ChristmasEventLeftovers:AddToggle("AutoCountrabandCrateEnabled", {Title = "Auto Roll Countraband Crate!", Default = false })

	RollCountrabandCrate:OnChanged(function(boolean)
		if Options.AutoCountrabandCrateEnabled.Value == true then
			while wait() do
				if Options.AutoCountrabandCrateEnabled.Value == true then
					local A_1 = "Contraband Crate"
					local Event = game:GetService("ReplicatedStorage").Packages.Knit.Services.ItemCrateService.RF.Spin                    
					Event:InvokeServer(A_1)
					if boolean == false then break end		
				end
				if boolean == false then break end
			end
		end
	end)
end

-- Page Eggs

do

	Tabs.Eggs:AddParagraph({
		Title = "Hatch Eggs",
		Content = "Hatch Eggs (Part Original Eggs)"
	})

	local EggsDropdown = Tabs.Eggs:AddInput("Input", {
		Title = "Put here name of Egg!",
		Default = "Earth",
		Placeholder = "Placeholder",
		Numeric = false, -- Only allows numbers
		Finished = false, -- Only calls callback when you press enter
		Callback = function()
		end
	})

	EggsDropdown:OnChanged(function(SelEgg)
		SelectedEgg = SelEgg
	end)

	Tabs.Eggs:AddButton({
		Title = "Open Selected Egg!",
		Description = "Hatches Selected Egg...",
		Callback = function()
			--[[ OUTDATED
			Fluent:Notify({
				Title = "AWD V0.0.1",
				Content = "Hey!",
				SubContent = "Check inventory, because animation of egg not playing...", -- Optional
				Duration = 5 -- Set to nil to make the notification not disappear
			})
			--]]

			Knit.GetController("NotificationController"):Notify({
				Message = "Please check your pet inventory!";
				Color = "Yellow";
				Sound = "Success";
			})
			Knit.GetController("NotificationController"):Notify({
				Message = "Because animation of opening egg is not playing!";
				Color = "Yellow";
				Sound = "Success";
			})

			local A_1 = SelectedEgg
			local A_4 = false

			game:GetService("ReplicatedStorage").Packages.Knit.Services.EggService.RF.purchaseEgg:InvokeServer(A_1,A_4)
		end
	})

	Tabs.Eggs:AddParagraph({
		Title = "Select, how many u want drop pets from Event Egg in one hatch.",
		Content = tostring("Hatch " .. game.Players.LocalPlayer.PlayerGui.GameUI.Menus.Event.EggDisplay.Title.Text .. " with new Hatch exploit!")
	})

	local SelectHatchEventEggs = Tabs.Eggs:AddInput("Input", {
		Title = "Drops pets from Hatch",
		Default = "6",
		Placeholder = "9",
		Numeric = true, -- Only allows numbers
		Finished = false, -- Only calls callback when you press enter
		Callback = function(Value)
		end
	})

	SelectHatchEventEggs:OnChanged(function(HatchEvent)
		HatchEventEggs = HatchEvent
	end)

	Tabs.Eggs:AddButton({
		Title = "Open New Event Egg!",
		Description = "Drops pets from New event egg",
		Callback = function()
			A_1 = tonumber(HatchEventEggs)

			game.ReplicatedStorage.Packages.Knit.Services.EventService.RF.ClaimEgg:InvokeServer(A_1)
		end
	})

	Tabs.Eggs:AddButton({
		Title = "Open Old Event Egg!",
		Description = "Drops pets from old event egg",
		Callback = function()
			A_1 = tonumber(HatchEventEggs)
			A_2 = true

			game.ReplicatedStorage.Packages.Knit.Services.EventService.RF.ClaimEgg:InvokeServer(A_1, A_2)
		end
	})
end

-- AUTO MACHINES

do
	Tabs.AutoMachines:AddParagraph({
		Title = "Lasy to walk into 2 world to get pets from Goliath?\nOr lasy upgrade 11.2k Tasty Cookie to Perfect Cookie?",
		Content = "\nThen this paragraph helps your problems!"
	})

	Tabs.AutoMachines:AddParagraph({
		Title = "Upgrade Snacks!",
		Content = "Reduce your time to upgrade snacks! Tip: spam to swither,\nto upgrade fruit faster, when function is on!"
	})

	local AutoUpgradeDragonFruit = Tabs.AutoMachines:AddToggle("AutoUpgradeDragonFruitEnabled", {Title = "Auto Upgrade Dragon Fruit!", Default = false })

	local DragonFruitTierSelect = Tabs.AutoMachines:AddDropdown("Dropdown", {
		Title = "Select Tier of Dragon Fruit!",
		Values = {"1", "2"},
		Multi = false,
		Default = 1,
	})

	DragonFruitTierSelect:OnChanged(function(boolean)
		DragonFruitTier = boolean
	end)

	AutoUpgradeDragonFruit:OnChanged(function(boolean)
		if Options.AutoUpgradeDragonFruitEnabled.Value == true then
			while wait() do
				if Options.AutoUpgradeDragonFruitEnabled.Value == true then
					local A_1 = {
						["Item"] = "Dragon Fruit",
						["Tier"] = tonumber(DragonFruitTier)
					}
					local Event = game:GetService("ReplicatedStorage").Packages.Knit.Services.ItemCraftingService.RF.UpgradeSnack
					Event:InvokeServer(A_1, A_2)
					if boolean == false then break end		
				end
				if boolean == false then break end
			end
		end
	end)

	local AutoUpgradeCookie = Tabs.AutoMachines:AddToggle("AutoUpgradeCookieEnabled", {Title = "Auto Upgrade Cookie!", Default = false })

	local UpgradeCookieTier = Tabs.AutoMachines:AddDropdown("Dropdown", {
		Title = "Select Tier of Cookie!",
		Values = {"1", "2"},
		Multi = false,
		Default = 1,
	})

	UpgradeCookieTier:OnChanged(function(boolean)
		CookieTier = boolean
	end)

	AutoUpgradeCookie:OnChanged(function(boolean)
		if Options.AutoUpgradeCookieEnabled.Value == true then
			while wait() do
				if Options.AutoUpgradeCookieEnabled.Value == true then
					local A_1 = {
						["Item"] = "Cookie",
						["Tier"] = tonumber(CookieTier)
					}
					local Event = game:GetService("ReplicatedStorage").Packages.Knit.Services.ItemCraftingService.RF.UpgradeSnack
					Event:InvokeServer(A_1, A_2)
					if boolean == false then break end		
				end
				if boolean == false then break end
			end
		end
	end)

	local AutoUpgradeBanana = Tabs.AutoMachines:AddToggle("AutoUpgradeBananaEnabled", {Title = "Auto Upgrade Banana!", Default = false })

	local BananaTierSelect = Tabs.AutoMachines:AddDropdown("Dropdown", {
		Title = "Select Tier of Banana!",
		Values = {"1"},
		Multi = false,
		Default = 1,
	})

	BananaTierSelect:OnChanged(function(boolean)
		BananaTier = boolean
	end)

	AutoUpgradeBanana:OnChanged(function(boolean)
		if Options.AutoUpgradeBananaEnabled.Value == true then
			while wait() do
				if Options.AutoUpgradeBananaEnabled.Value == true then
					local A_1 = {
						["Item"] = "Banana",
						["Tier"] = tonumber(BananaTier)
					}
					local Event = game:GetService("ReplicatedStorage").Packages.Knit.Services.ItemCraftingService.RF.UpgradeSnack
					Event:InvokeServer(A_1, A_2)
					if boolean == false then break end		
				end
				if boolean == false then break end
			end
		end
	end)

	local AutoUpgradeRaspberry = Tabs.AutoMachines:AddToggle("AutoUpgradeRaspberryEnabled", {Title = "Auto Upgrade Raspberry!", Default = false })

	local RaspberryTierSelect = Tabs.AutoMachines:AddDropdown("Dropdown", {
		Title = "Select Tier of Raspberry!",
		Values = {"1"},
		Multi = false,
		Default = 1,
	})

	RaspberryTierSelect:OnChanged(function(boolean)
		RaspberryTier = boolean
	end)

	AutoUpgradeRaspberry:OnChanged(function(boolean)
		if Options.AutoUpgradeRaspberryEnabled.Value == true then
			while wait() do
				if Options.AutoUpgradeRaspberryEnabled.Value == true then
					local A_1 = {
						["Item"] = "Raspberry",
						["Tier"] = tonumber(RaspberryTier)
					}
					local Event = game:GetService("ReplicatedStorage").Packages.Knit.Services.ItemCraftingService.RF.UpgradeSnack
					Event:InvokeServer(A_1, A_2)
					if boolean == false then break end		
				end
				if boolean == false then break end
			end
		end
	end)

	local AutoUpgradeStarfruit = Tabs.AutoMachines:AddToggle("AutoUpgradeStarfruitEnabled", {Title = "Auto Upgrade Starfruit!", Default = false })

	local StarfruitTierSelect = Tabs.AutoMachines:AddDropdown("Dropdown", {
		Title = "Select Tier of Starfruit!",
		Values = {"1", "2"},
		Multi = false,
		Default = 1,
	})

	StarfruitTierSelect:OnChanged(function(boolean)
		StarfruitTier = boolean
	end)

	AutoUpgradeStarfruit:OnChanged(function(boolean)
		if Options.AutoUpgradeStarfruitEnabled.Value == true then
			while wait() do
				if Options.AutoUpgradeStarfruitEnabled.Value == true then
					local A_1 = {
						["Item"] = "Starfruit",
						["Tier"] = tonumber(StarfruitTier)
					}
					local Event = game:GetService("ReplicatedStorage").Packages.Knit.Services.ItemCraftingService.RF.UpgradeSnack
					Event:InvokeServer(A_1, A_2)
					if boolean == false then break end		
				end
				if boolean == false then break end
			end
		end
	end)

	local AutoUpgradePear = Tabs.AutoMachines:AddToggle("AutoUpgradePearEnabled", {Title = "Auto Upgrade Golden Pear!", Default = false })

	local PearTierSelect = Tabs.AutoMachines:AddDropdown("Dropdown", {
		Title = "Select Tier of Pear!",
		Values = {"1"},
		Multi = false,
		Default = 1,
	})

	PearTierSelect:OnChanged(function(boolean)
		PearTier = boolean
	end)

	AutoUpgradePear:OnChanged(function(boolean)
		if Options.AutoUpgradePearEnabled.Value == true then
			while wait() do
				if Options.AutoUpgradePearEnabled.Value == true then
					local A_1 = {
						["Item"] = "Golden Pear",
						["Tier"] = tonumber(PearTier)
					}
					local Event = game:GetService("ReplicatedStorage").Packages.Knit.Services.ItemCraftingService.RF.UpgradeSnack
					Event:InvokeServer(A_1, A_2)
					if boolean == false then break end		
				end
				if boolean == false then break end
			end
		end
	end)

	local AutoUpgradeDonut = Tabs.AutoMachines:AddToggle("AutoUpgradeDonutEnabled", {Title = "Auto Upgrade Donut!", Default = false })

	local DonutTierSelect = Tabs.AutoMachines:AddDropdown("Dropdown", {
		Title = "Select Tier of Donut!",
		Values = {"1", "2"},
		Multi = false,
		Default = 1,
	})

	DonutTierSelect:OnChanged(function(boolean)
		DonutTier = boolean
	end)

	AutoUpgradeDonut:OnChanged(function(boolean)
		if Options.AutoUpgradeDonutEnabled.Value == true then
			while wait() do
				if Options.AutoUpgradeDonutEnabled.Value == true then
					local A_1 = {
						["Item"] = "Donut",
						["Tier"] = tonumber(DonutTier)
					}
					local Event = game:GetService("ReplicatedStorage").Packages.Knit.Services.ItemCraftingService.RF.UpgradeSnack
					Event:InvokeServer(A_1, A_2)
					if boolean == false then break end		
				end
				if boolean == false then break end
			end
		end
	end)

	Tabs.AutoMachines:AddParagraph({
		Title = "Goliath Pets!",
		Content = "Don't walk to 2 world, to claim pets from goliath! Just use Auto claim pets, to reduce your time!"
	})

	Tabs.AutoMachines:AddButton({
		Title = "Open Goliath Machine",
		Description = "To put pets here!",
		Callback = function()
			if game.Players.LocalPlayer.PlayerGui.GameUI.Menus.Goliath.Visible == false then
				game.Players.LocalPlayer.PlayerGui.GameUI.Menus.Goliath.Visible = true
			else
				game.Players.LocalPlayer.PlayerGui.GameUI.Menus.Goliath.Visible = false
			end
		end
	})

	local AutoClaimGoliath = Tabs.AutoMachines:AddToggle("AutoClaimPetsFromGoliath", {Title = "Auto Claim Pets When Done", Default = false })

	AutoClaimGoliath:OnChanged(function(boolean)
		if Options.AutoClaimPetsFromGoliath.Value == true then
			while wait() do
				if Options.AutoClaimPetsFromGoliath.Value == true then
					for count=1,3,1 do
						if game.Players.LocalPlayer.PlayerGui.GameUI.Menus.Goliath.Holder.SlotPage.Container["Slot" .. count].Pending.Claim.Timer.Text == "Claim" then
							A_1 = nil
							A_2 = tostring("Slot" .. count)
							local Event = game:GetService("ReplicatedStorage").Packages.Knit.Services.PetGoliathService.RE.onClaim
							Event:FireServer(A_1, A_2)
						end
					end	
				end
				if boolean == false then break end
			end
		end
	end)
end

-- EQUIP PETS BY ENCHANTMENT
--[[
do
	Tabs.EquipWithEnchant:AddParagraph({
		Title = "Lasy to create team by enchantment?",
		Content = "Then use this paragraph and equip pets by enchantment!"
	})

	local SelectedEnchant = Tabs.EquipWithEnchant:AddDropdown("Dropdown", {
		Title = "Select Enchant!",
		Values = {"WinnerWinner", "Lucky", "BestFriend", "Rifted", "KeyFinder"},
		Multi = false,
		Default = 1,
	})

	SelectedEnchant:OnChanged(function(boolean)
		SelEnchant = boolean
	end)

	Tabs.EquipWithEnchant:AddButton({
		Title = "Equip ALL Pets by Enchant!",
		Description = "Hatches Selected Egg...",
		Callback = function()
			Knit.GetController("NotificationController"):Notify({
				Message = "Equipping pets by enchant has Started!";
				Color = "Green";
				Sound = "Success";
			})
			Knit.GetController("NotificationController"):Notify({
				Message = "Not equip pets, while pets equipping in progress!";
				Color = "Yellow";
				Sound = "Success";
			})
			
			for i,v in pairs(game.Players.LocalPlayer.PlayerGui.GameUI.Menus.Inventory.Display.Pets.ScrollingFrame.Pets:GetChildren()) do
				for EnchantTier=0, 3, 1 do
					print(EnchantTier)
					if v.Toggle:GetAttribute("EnchantmentType") == tostring(SelEnchant) and v.Toggle:GetAttribute("EnchantmentTier") == tonumber(EnchantTier) then
						A_1 = v.Name
						game:GetService("ReplicatedStorage").Packages.Knit.Services.PetService.RF.equip:InvokeServer(A_1)
					end
					if EquipProcess == false then break end
				end
				if EquipProcess == false then break end
			end
			
			Knit.GetController("NotificationController"):Notify({
				Message = "Equipping pets by enchant has ended!";
				Color = "Green";
				Sound = "Success";
			})
		end
	})
	
	Tabs.EquipWithEnchant:AddButton({
		Title = "Stop equipping process!",
		Description = "Stop equipping process!",
		Callback = function()
			EquipProcess = false
			wait(0.1)
			EquipProcess = true
			Knit.GetController("NotificationController"):Notify({
				Message = "Equipping pets by enchant has stopped!";
				Color = "Red";
				Sound = "Success";
			})
		end
	})
end--]]

do
	Tabs.FreeGamepasses:AddParagraph({
		Title = "Contains only Auto Clicker & Teleport",
		Content = "Get those gamepasses using AWD Hub!"
	})

	local SelectTPWorld = Tabs.FreeGamepasses:AddDropdown("Dropdown", {
		Title = "Select Teleport World",
		Values = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "HeroCity", "VillainCave", "Garden"},
		Multi = false,
		Default = 1,
	})

	SelectTPWorld:OnChanged(function(NPCs)
		WorldTeleport = NPCs
	end)

	Tabs.FreeGamepasses:AddButton({
		Title = "Teleport to Selected World (Method 1)",
		Description = "Method 1: Teleports player to world\nwith scripts",
		Callback = function()
			A_1 = game:GetService("Workspace").Zones[tostring(WorldTeleport)].Interactables.Teleports.Locations.Spawn
			local Event = game:GetService("ReplicatedStorage").Packages.Knit.Services.ZoneService.RE.teleport
			Event:FireServer(A_1)
		end
	})

	Tabs.FreeGamepasses:AddButton({
		Title = "Teleport to Selected World (Method 2)",
		Description = "Method 2: Teleports player to world\ndon't scripts",
		Callback = function()
			A_1 = game:GetService("Workspace").Zones[tostring(WorldTeleport)].Interactables.Teleports.Locations.Spawn.CFrame
			workspace[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame = A_1
		end
	})

	local AutoClicker = Tabs.FreeGamepasses:AddToggle("AutoClickerEnabled", {Title = "OP Auto Clicker to Bosses!", Default = false })

	AutoClicker:OnChanged(function(boolean)
		if Options.AutoClickerEnabled.Value == true then
			while wait() do
				if Options.AutoClickerEnabled.Value == true then
					game:GetService("ReplicatedStorage").Packages.Knit.Services.ArmWrestleService.RE.onClickRequest:FireServer()
				end
				if boolean == false then
					break 
				end
			end
		end
	end)
end

-- Current Event
do
	Tabs.CurrentEvent:AddParagraph({
		Title = "Superheroes Event",
		Content = "World 1: Auto NPC, Cave and Obby?"
	})

	local AutoPrisonEventNPCSelect = Tabs.CurrentEvent:AddDropdown("Dropdown", {
		Title = "Auto NPC Select",
		Values = {"EvilLair-Dreadlord","EvilLair-Skullbane","EvilLair-Spectron","EvilLair-Vortex","SuperheroCity-Inferno","SuperheroCity-Jolt","SuperheroCity-Phantom","SuperheroCity-Radiance"},
		Multi = false,
		Default = 1,
	})

	AutoPrisonEventNPCSelect:OnChanged(function(NPCs)
		PrisonSelectedNPCs = NPCs
	end)

	local AutoCurrentEventNPCToggle = Tabs.CurrentEvent:AddToggle("AutoCurrentEventNPCEnabled", {Title = "Auto NPC Defeat (OP FAST)!", Default = false })
--[[
	AutoCurrentEventNPCToggle:OnChanged(function(boolean)
		if Options.AutoCurrentEventNPCEnabled.Value == true then
			while wait() do
				if Options.AutoCurrentEventNPCEnabled.Value == true then
					wait(600)
					game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
				end
				if boolean == false then
					break 
				end
			end
		end
	end)
--]]
	AutoCurrentEventNPCToggle:OnChanged(function(boolean)
		if Options.AutoCurrentEventNPCEnabled.Value == true then
			while wait() do
				if Options.AutoCurrentEventNPCEnabled.Value == true then
					for i,v in pairs(workspace.GameObjects.RngNPCs[tostring(PrisonSelectedNPCs)].Npc:GetDescendants()) do
						if v:IsA("Part") and v.Name == "Proximity" then
							if Options.AutoCurrentEventNPCEnabled.Value == true then
								v.CFrame = workspace[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame
								if boolean == false then
									v:InputHoldEnd() 
									break 
								end
							end
						elseif v.Name == "ProximityPrompt" then
							if Options.AutoCurrentEventNPCEnabled.Value == true then
								v.HoldDuration = 0
								v:InputHoldBegin()
								v:InputHoldEnd()
								if boolean == false then 
									v:InputHoldEnd() 
									break 
								end
							end
						end
					end
				end
			end
		end
	end)

	local AutoPlaytimePass = Tabs.CurrentEvent:AddToggle("AutoPlaytimePassEnabled", {Title = "Auto Playtime Pass + Reset", Default = false })

	AutoPlaytimePass:OnChanged(function(boolean)
		if Options.AutoPlaytimePassEnabled.Value == true then
			while wait() do
				if Options.AutoPlaytimePassEnabled.Value == true then
					for count=1,12,1 do
						local A_1 = "Free"
						local A_2 = count
						local Event = game:GetService("ReplicatedStorage").Packages.Knit.Services.EventPassService.RF.ClaimReward
						Event:InvokeServer(A_1, A_2)
						if boolean == false then break end
					end
					local Event = game:GetService("ReplicatedStorage").Packages.Knit.Services.EventPassService.RF.Reset
					Event:InvokeServer()
				end
			end
		end
	end)
--[[
    local AutoPrisonCaveMulti = Tabs.CurrentEvent:AddDropdown("Dropdown", {
		Title = "Auto Prison Cave Use ALL Keys?",
		Values = {"YES","NO"},
		Multi = false,
		Default = 1,
	})
--]]
	local AutoCurrentEventCavePrimary = Tabs.CurrentEvent:AddToggle("AutoCurrentEventPrimaryCaveEnabled", {Title = "Auto Enters Villain Hideout!", Default = false })

	AutoCurrentEventCavePrimary:OnChanged(function(boolean)
		if Options.AutoCurrentEventPrimaryCaveEnabled.Value == true then
			while wait() do
				if Options.AutoCurrentEventPrimaryCaveEnabled.Value == true then
					local A_1 = "VillainHideout"
					local A_2 = true
					local Event = game:GetService("ReplicatedStorage").Packages.Knit.Services.TowerService.RF.EnterTower
					Event:InvokeServer(A_1, A_2)
					if boolean == false then break end
				end
			end
		end
	end)

	Tabs.CurrentEvent:AddButton({
		Title = "Show Superhero Currency",
		Description = "Check, how you good farming Superhero strength in world 17!",
		Callback = function()
			if game.Players.LocalPlayer.PlayerGui.GameUI.Currencies.HeroCurrency.Visible == false then
				game.Players.LocalPlayer.PlayerGui.GameUI.Currencies.HeroCurrency.Visible = true
				game.Players.LocalPlayer.PlayerGui.GameUI.Currencies.Currency.Visible = false
			elseif game.Players.LocalPlayer.PlayerGui.GameUI.Currencies.HeroCurrency.Visible == true then
				game.Players.LocalPlayer.PlayerGui.GameUI.Currencies.HeroCurrency.Visible = false
				game.Players.LocalPlayer.PlayerGui.GameUI.Currencies.Currency.Visible = true
			end
		end
	})

	local AutoObby = Tabs.CurrentEvent:AddToggle("AutoObbyEnabled", {Title = "Auto Obby!", Default = false })

	AutoObby:OnChanged(function(boolean)
		if Options.AutoObbyEnabled.Value == true then
			while wait() do
				if Options.AutoObbyEnabled.Value == true then
					if workspace.GameObjects.Minigames.SpeedrunMinigames.HeroSpeedrun.Visual.BillboardGui.Timer.Text == "Touch to play!" then
						local A_1 = "HeroSpeedrun"
						local Event = game:GetService("ReplicatedStorage").Packages.Knit.Services.SpeedrunMinigameService.RF.EnterSpeedrun
						Event:InvokeServer(A_1)
						wait(3)
						workspace[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame = workspace.GameObjects.Minigames.SpeedrunMinigames.HeroSpeedrun.Ending.CFrame
						wait(3)
						if boolean == false then break end
					end
				end
			end
		end
	end)


	--[[

	local AutoCurrentEventCaveSecondary = Tabs.CurrentEvent:AddToggle("AutoCurrentEventSecondaryCaveEnabled", {Title = "Auto Enters Police Shakedown Tower!", Default = false })

	AutoCurrentEventCaveSecondary:OnChanged(function(boolean)
		if Options.AutoCurrentEventSecondaryCaveEnabled.Value == true then
			while wait() do
				if Options.AutoCurrentEventSecondaryCaveEnabled.Value == true then
					local A_1 = "PoliceShakedown"
					local A_2 = true
					local Event = game:GetService("ReplicatedStorage").Packages.Knit.Services.TowerService.RF.EnterTower
					Event:InvokeServer(A_1, A_2)
					if boolean == false then break end
				end
			end
		end
	end)
	
	--]]


--[[
	local AutoGiftSantaWorkshop = Tabs.ChristmasEvent:AddToggle("AutoGiftSantaWorkshopEnabled", {Title = "Auto Claims Gift in Workshop Tree", Default = false })

	AutoGiftSantaWorkshop:OnChanged(function(boolean)
		if Options.AutoGiftSantaWorkshopEnabled.Value == true then
			while wait() do
				if Options.AutoGiftSantaWorkshopEnabled.Value == true then
					if workspace.Zones.SantasWorkshop.Interactables.FreeGift.Primary.BillboardGui.Frame.Info.TextLabel.Text == "Gift Ready!" then
						local A_1 = "WorkshopTree"
						local Event = game:GetService("ReplicatedStorage").Packages.Knit.Services.FreeGiftService.RF.Claim
						Event:InvokeServer(A_1)
						if boolean == false then break end
						game:AddTag()
					end
				end
			end
		end
	end)


	local AutoGiftSantaPresent = Tabs.ChristmasEvent:AddToggle("AutoGiftSantaPresentEnabled", {Title = "Auto Claims Gift in Frostlands", Default = false })

	AutoGiftSantaPresent:OnChanged(function(boolean)
		if Options.AutoGiftSantaPresentEnabled.Value == true then
			while wait() do
				if Options.AutoGiftSantaPresentEnabled.Value == true then
					if workspace.Zones.Frostlands.Interactables.FreeGift.Primary.BillboardGui.Frame.Info.TextLabel.Text == "Gift Ready!" then
						local A_1 = "SantaSleigh"
						local Event = game:GetService("ReplicatedStorage").Packages.Knit.Services.FreeGiftService.RF.Claim
						Event:InvokeServer(A_1)
						if boolean == false then break end
					end
				end
			end
		end
	end)
	
--]]
	Tabs.CurrentEvent:AddParagraph({
		Title = "Part 2-3 of 1 World of Superhero Event",
		Content = "Use Auto Craft Superhero Chest and Fortune!"
	})

	local AutoCurrentEventSecondaryRouletteFortuneMulti = Tabs.CurrentEvent:AddDropdown("Dropdown", {
		Title = "How Many Times Auto\n Spin Bulk Smash Fortune Spinner?",
		Values = {"x1", "x3", "x10"},
		Multi = false,
		Default = 1,
	})

	AutoCurrentEventSecondaryRouletteFortuneMulti:OnChanged(function(asof)
		AutoCurrentEventSecondaryRouletteMultiplier = asof
	end)

	local AutoCurrentEventSecondaryRoulette = Tabs.CurrentEvent:AddToggle("AutoCurrentEventSecondaryRouletteEnabled", {Title = "Auto Spin Bulk Smash Fortune Spinner!", Default = false })

	AutoCurrentEventSecondaryRoulette:OnChanged(function(boolean)
		if Options.AutoCurrentEventSecondaryRouletteEnabled.Value == true then
			while wait() do
				if Options.AutoCurrentEventSecondaryRouletteEnabled.Value == true then
					local A_1 = "Bulk Smash Fortune"
					if AutoCurrentEventSecondaryRouletteMultiplier == "x1" then
						A_2 = nil
					elseif AutoCurrentEventSecondaryRouletteMultiplier == "x3" then
						A_2 = "x10"
					elseif AutoCurrentEventSecondaryRouletteMultiplier == "x10" then
						A_2 = "x25"
					end
					local Event = game:GetService("ReplicatedStorage").Packages.Knit.Services.SpinnerService.RF.Spin
					Event:InvokeServer(A_1, A_2)
					if boolean == false then break end		
				end
				if boolean == false then break end
			end
		end
	end)
end

Tabs.CurrentEvent:AddParagraph({
	Title = "Villain Cave in Superhero Event",
	Content = "Use Auto Villain Trials & Chest!"
})

local AutoCurrentEventRouletteFortuneMulti = Tabs.CurrentEvent:AddDropdown("Dropdown", {
	Title = "How Many Times Auto\n Spin Crimson Fortune Spinner?",
	Values = {"x1", "x3", "x10"},
	Multi = false,
	Default = 1,
})

AutoCurrentEventRouletteFortuneMulti:OnChanged(function(asofe)
	AutoCurrentEventRouletteMultiplier = asofe
end)

local AutoCurrentEventThirdRoulette = Tabs.CurrentEvent:AddToggle("AutoCurrentEventThirdRouletteEnabled", {Title = "Auto Spin Crimson Fortune Spinner!", Default = false })

AutoCurrentEventThirdRoulette:OnChanged(function(boolean)
	if Options.AutoCurrentEventThirdRouletteEnabled.Value == true then
		while wait() do
			if Options.AutoCurrentEventThirdRouletteEnabled.Value == true then
				local A_1 = "Crimson Fortune"
				if AutoCurrentEventRouletteMultiplier == "x1" then
					A_2 = nil
				elseif AutoCurrentEventRouletteMultiplier == "x3" then
					A_2 = "x10"
				elseif AutoCurrentEventRouletteMultiplier == "x10" then
					A_2 = "x25"
				end
				local Event = game:GetService("ReplicatedStorage").Packages.Knit.Services.SpinnerService.RF.Spin
				Event:InvokeServer(A_1, A_2)
				if boolean == false then break end		
			end
			if boolean == false then break end
		end
	end
end)

local AutoEventTrials = Tabs.CurrentEvent:AddToggle("AutoEventTrialEnabled", {Title = "Auto Villain Trials + BUG, when you leave Trial!", Default = false })

AutoEventTrials:OnChanged(function(boolean)
	if Options.AutoEventTrialEnabled.Value == true then
		while wait() do
			if Options.AutoEventTrialEnabled.Value == true then
				local A_1 = "Villain"
				local Event = game:GetService("ReplicatedStorage").Packages.Knit.Services.ChampionshipService.RF.RequestJoin
				Event:InvokeServer(A_1)
				if boolean == false then break end		
			end
			if boolean == false then break end
		end
	end
end)

local AutoEventChest = Tabs.CurrentEvent:AddToggle("AutoEventChestEnabled", {Title = "Auto Villain Chest!", Default = false })

AutoEventChest:OnChanged(function(boolean)
	if Options.AutoEventChestEnabled.Value == true then
		while wait() do
			if Options.AutoEventChestEnabled.Value == true then
				local A_1 = "VillainChest"
				local Event = game:GetService("ReplicatedStorage").Packages.Knit.Services.ChestService.RF.Open
				Event:InvokeServer(A_1)
				if boolean == false then break end
			end
		end
	end
end)
















-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/AWD")

--InterfaceManager:BuildInterfaceSection(Tabs.Settings)
--SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

--[[Fluent:Notify({
	Title = "Fluent",
	Content = "The script has been loaded.",
	Duration = 8
})
--]]
-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()




--[[ library of functions!

local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Toggle", Default = false })

Toggle:OnChanged(function()
	print("Toggle changed:", Options.MyToggle.Value)
end)

Options.MyToggle:SetValue(false)



local Dropdown = Tabs.Main:AddDropdown("Dropdown", {
	Title = "Dropdown",
	Values = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen"},
	Multi = false,
	Default = 1,
})

Dropdown:SetValue("four")

Dropdown:OnChanged(function(Value)
	print("Dropdown changed:", Value)
end)



local MultiDropdown = Tabs.Main:AddDropdown("MultiDropdown", {
	Title = "Dropdown",
	Description = "You can select multiple values.",
	Values = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen"},
	Multi = true,
	Default = {"seven", "twelve"},
})

MultiDropdown:SetValue({
	three = true,
	five = true,
	seven = false
})

MultiDropdown:OnChanged(function(Value)
	local Values = {}
	for Value, State in next, Value do
		table.insert(Values, Value)
	end
	print("Mutlidropdown changed:", table.concat(Values, ", "))
end)



local Colorpicker = Tabs.Main:AddColorpicker("Colorpicker", {
	Title = "Colorpicker",
	Default = Color3.fromRGB(96, 205, 255)
})

Colorpicker:OnChanged(function()
	print("Colorpicker changed:", Colorpicker.Value)
end)

Colorpicker:SetValueRGB(Color3.fromRGB(0, 255, 140))



local TColorpicker = Tabs.Main:AddColorpicker("TransparencyColorpicker", {
	Title = "Colorpicker",
	Description = "but you can change the transparency.",
	Transparency = 0,
	Default = Color3.fromRGB(96, 205, 255)
})

TColorpicker:OnChanged(function()
	print(
		"TColorpicker changed:", TColorpicker.Value,
		"Transparency:", TColorpicker.Transparency
	)
end)



local Keybind = Tabs.Main:AddKeybind("Keybind", {
	Title = "KeyBind",
	Mode = "Toggle", -- Always, Toggle, Hold
	Default = "LeftControl", -- String as the name of the keybind (MB1, MB2 for mouse buttons)

	-- Occurs when the keybind is clicked, Value is `true`/`false`
	Callback = function(Value)
		print("Keybind clicked!", Value)
	end,

	-- Occurs when the keybind itself is changed, `New` is a KeyCode Enum OR a UserInputType Enum
	ChangedCallback = function(New)
		print("Keybind changed!", New)
	end
})

-- OnClick is only fired when you press the keybind and the mode is Toggle
-- Otherwise, you will have to use Keybind:GetState()
Keybind:OnClick(function()
	print("Keybind clicked:", Keybind:GetState())
end)

Keybind:OnChanged(function()
	print("Keybind changed:", Keybind.Value)
end)

task.spawn(function()
	while true do
		wait(1)

		-- example for checking if a keybind is being pressed
		local state = Keybind:GetState()
		if state then
			print("Keybind is being held down")
		end

		if Fluent.Unloaded then break end
	end
end)

Keybind:SetValue("MB2", "Toggle") -- Sets keybind to MB2, mode to Hold


local Input = Tabs.Main:AddInput("Input", {
	Title = "Input",
	Default = "Default",
	Placeholder = "Placeholder",
	Numeric = false, -- Only allows numbers
	Finished = false, -- Only calls callback when you press enter
	Callback = function(Value)
		print("Input changed:", Value)
	end
})

Input:OnChanged(function()
	print("Input updated:", Input.Value)
end)
--]]

Knit.GetController("NotificationController"):Notify({
	Message = "Welcome to AWD Hub! Superhero Event Update Part 3!";
	Color = "Yellow";
	Sound = "Success";
})

while wait() do
	if not game.CoreGui:FindFirstChild("ScreenGui") or not game.CoreGui:WaitForChild("ScreenGui"):FindFirstChild("Frame") then
		AWREHub:Destroy()
		break
	end
end