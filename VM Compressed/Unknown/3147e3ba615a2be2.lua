local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local GrantItem = workspace
	:WaitForChild("The Diner")
	:WaitForChild("Employee Area")
	:WaitForChild("Kitchen")
	:WaitForChild("Appliances")
	:WaitForChild("Particle Accelerator")
	:WaitForChild("ParticleHandlerServer")
	:WaitForChild("GrantItem")

local ITEM_KEY = "xv~\144Am_q\166W\168\137"

local Window = Rayfield:CreateWindow({
	Name = "shit giver",
	Icon = 0,
	LoadingTitle = "item giver",
	LoadingSubtitle = "items",
	ShowText = "items",
	Theme = "Default",
	ToggleUIKeybind = "K",

	DisableRayfieldPrompts = false,
	DisableBuildWarnings = false,

	ConfigurationSaving = {
		Enabled = true,
		FolderName = "givepanel",
		FileName = "GiveItems"
	},

	Discord = {
		Enabled = false,
		Invite = "noinvitelink",
		RememberJoins = true
	},

	KeySystem = false
})

local ItemsTab = Window:CreateTab("Give Items")
local MiscTab = Window:CreateTab("Misc")

local function GiveItem(itemName)
	GrantItem:FireServer(itemName, ITEM_KEY)

	Rayfield:Notify({
		Title = "Item Given",
		Content = itemName,
		Duration = 2
	})
end

local function AddButton(itemName)
	ItemsTab:CreateButton({
		Name = itemName,
		Callback = function()
			GiveItem(itemName)
		end
	})
end

MiscTab:CreateButton({
	Name = "instant prompts",
	Callback = function()
		local Workspace = game:GetService("Workspace")

		local TARGETS = {
			["Tray"] = true,
			["Assemble"] = true,
		}

		local function matches(prompt)
			return TARGETS[prompt.Name]
				or TARGETS[prompt.ActionText]
				or TARGETS[prompt.ObjectText]
				or (prompt.Parent and TARGETS[prompt.Parent.Name])
		end

		local function updatePrompt(obj)
			if not obj:IsA("ProximityPrompt") then
				return
			end

			if not matches(obj) then
				return
			end

			obj.HoldDuration = 0.001
			print("Made prompt instant:", obj:GetFullName())
		end

		for _, obj in ipairs(Workspace:GetDescendants()) do
			updatePrompt(obj)
		end

		Workspace.DescendantAdded:Connect(updatePrompt)
	end
})

AddButton("2x Compressed Kitty")
AddButton("2x Compressed Slop")
AddButton("3x Compressed Kitty")
AddButton("3x Compressed Slop")
AddButton("4x Compressed Kitty")
AddButton("4x Compressed Slop")
AddButton("5x Compressed Kitty")
AddButton("5x Compressed Slop")
AddButton("6x Compressed Kitty")
AddButton("7x Compressed Kitty")
AddButton("8x Compressed Kitty")
AddButton("9x Compressed Kitty")
AddButton("Anti-Slop")
AddButton("Antimatter")
AddButton("BakedPotato")
AddButton("Baking Powder")
AddButton("Black Hole")
AddButton("Bloxy Cola")
AddButton("BluefinTuna")
AddButton("Bottom Quark")
AddButton("Bread")
AddButton("Brownie")
AddButton("Burger")
AddButton("Cake")
AddButton("Charm Quark")
AddButton("Chum")
AddButton("Cocoa Powder")
AddButton("Compressed Kitty")
AddButton("Compressed Slop")
AddButton("Cooked Tuna Slices")
AddButton("CookedFry")
AddButton("CookedSteak")
AddButton("Cookie")
AddButton("Cupcake")
AddButton("Cyanide")
AddButton("Dark Matter")
AddButton("Deuterium")
AddButton("Down Quark")
AddButton("Egg")
AddButton("Einstein-Bose Condensate")
AddButton("Electron")
AddButton("Elementary Matter")
AddButton("Elephants Foot")
AddButton("Empty Tray")
AddButton("Excited Neutronic Matter")
AddButton("Excited Protonic Matter")
AddButton("FinishedBrownies")
AddButton("FinishedCake")
AddButton("FinishedCookies")
AddButton("FinishedCupcakes")
AddButton("Flour")
AddButton("Fried Egg")
AddButton("Fried Icecream")
AddButton("Fusion Reactor")
AddButton("Higgs Boson")
AddButton("Homunculus")
AddButton("Hydrochloric Acid")
AddButton("Hydrogen Bomb")
AddButton("Hydrogen Group")
AddButton("Ice Cream")
AddButton("Ice Cream Tub")
AddButton("Isotope")
AddButton("Juice")
AddButton("Kitty")
AddButton("Largemouth Bass")
AddButton("Lava")
AddButton("Lettuce")
AddButton("Liquid Death")
AddButton("Living Sardine")
AddButton("Mashed Potatos")
AddButton("Metal")
AddButton("Microplastic Soup")
AddButton("Milkshake")
AddButton("Muon")
AddButton("Mustard")
AddButton("MysteryMeat")
AddButton("Neutron")
AddButton("Neutron Star")
AddButton("Plutonium")
AddButton("Potato")
AddButton("Proton")
AddButton("Ram")
AddButton("RamShake")
AddButton("Raw Bread")
AddButton("Raw Brownies")
AddButton("Raw Cake")
AddButton("Raw Cookies")
AddButton("Raw Cupcakes")
AddButton("RawMysteryMeat")
AddButton("RawSteak")
AddButton("RawTuna")
AddButton("Reinforced Frame")
AddButton("Rejuvenation Serum")
AddButton("Salad")
AddButton("Sardine")
AddButton("Schrodingers Sandwich")
AddButton("Shamrock Shake")
AddButton("Silica")
AddButton("Slop")
AddButton("Sodium Hydroxide")
AddButton("Soup")
AddButton("Soy Beans")
AddButton("Strange Quark")
AddButton("Sugar")
AddButton("Tau")
AddButton("Tempe")
AddButton("Tesseract")
AddButton("Tomato")
AddButton("Top Quark")
AddButton("Tritium")
AddButton("UncookedFry")
AddButton("Up Quark")
AddButton("Uranium")
AddButton("Vegetable Smoothie")
AddButton("Water")
