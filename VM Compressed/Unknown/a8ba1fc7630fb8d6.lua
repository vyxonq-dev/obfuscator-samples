local replicatedstorage = game:GetService("ReplicatedStorage")

local maclib = loadstring(game:HttpGet("https://github.com/biggaboy212/Maclib/releases/latest/download/maclib.txt"))()

local boxesModule = require(game:GetService("ReplicatedStorage").Behaviors.EggBehavior)

local plr = game.Players.LocalPlayer
local money = plr.leaderstats.Coins
local viewport = workspace.CurrentCamera.ViewportSize

local tycoon = workspace.Maps[plr.Name .. "Tycoon"]

local npcs = tycoon.ActiveVends
local boxes = tycoon.ConveyorEggs
local boxplace = tycoon.UpgradeInstances.BoxPlace
local planted = tycoon.Planted

local config_text
local status_label
local window = maclib:Window({
	Title = "Your bank!",
	Subtitle = "open sourced script",
	Size = UDim2.fromOffset(viewport.X * 0.72, viewport.Y * 0.9), -- 800, 600
	DragStyle = 1,
	DisabledWindowControls = {},
	ShowUserInfo = true,
	Keybind = Enum.KeyCode.RightControl,
	AcrylicBlur = true,
})

local hook
local placeEvent = replicatedstorage:WaitForChild("PlaceEvent")

getgenv().stacking = false
getgenv().stack = false
getgenv().stackamount = 1
getgenv().status = "Waiting"
getgenv().autofarm = false
getgenv().autofarm_settings = {
	collectmoney = true,
	boxes = false,
	delay = 1,
	value = 25,
	attempts = 5
}

-- Functions
local function updateConfigText()
	config_text:UpdateBody(
		string.format(
		    	"Collect Money: %s\nBoxes: %s\nDelay: %ds\nMinimum Price to Buy Boxes Value: %d\nAttempts: %d",
		    	autofarm_settings.collectmoney and "Enabled" or "Disabled",
		    	autofarm_settings.boxes and "Enabled" or "Disabled",
		    	autofarm_settings.delay,
		    	autofarm_settings.value,
		    	autofarm_settings.attempts
		)
	)
end

local function updatestatus(text)
	status_label:UpdateName(text)
end

local function getbestbox()
	local bestgen, bestbox = 1, nil
	for i, v in boxes:GetChildren() do
		local price = v:GetAttribute("Price")
		if price and money.Value >= price then
			if price > autofarm_settings.value and bestgen < price then
				bestgen = price
				bestbox = v
			end
		end			
	end	
	return bestbox
end

local function getBoxes()
	local boughtboxes, boxes = 0, {}
	for i, box in plr.Backpack:GetChildren() do
		if box:GetAttribute("Type") == "Egg" then
			boughtboxes = boughtboxes + 1
			table.insert(boxes, box)
		end
	end
	return boughtboxes, boxes
end

local function boxes()
	if not autofarm_settings.boxes then return end
	local ready = false
	local boughtboxes, _ = getBoxes()
	local placestoupdate = #boxplace:GetChildren() - #planted:GetChildren()
	
	if #planted:GetChildren() >= 1 then
		updatestatus("Waiting to unbox boxes...")
		while not ready do
			ready = true
			for _, box in planted:GetChildren() do
				if box.GrowTime.Value ~= "Ready to collect!" then
					ready = false
					break
				end
			end	
			task.wait(1)
		end
		updatestatus("Unboxing...")
		for i, box in planted:GetChildren() do
			if box.GrowTime.Value == "Ready to collect!" then
				plr.Character.HumanoidRootPart.CFrame = box.Base.CFrame * CFrame.new(0, 7, 0)
				task.wait(0.2)
				fireproximityprompt(box.Base.ProximityPrompt)
			end
		end
	end	
	task.wait(autofarm_settings.delay)
	if not autofarm_settings.boxes then updatestatus("Off...") return end
	
	updatestatus("Buying boxes...")
	while boughtboxes < placestoupdate do
		for i = 1, autofarm_settings.attempts do
			local bestbox = getbestbox()
			if bestbox then
				plr.Character.HumanoidRootPart.CFrame = bestbox.Base.CFrame
				fireproximityprompt(bestbox.Base.PurchasePrompt)
				boughtboxes = boughtboxes + 1
			elseif not bestbox then
				print(i)
				task.wait(1)
			end
		end
		local bestbox = getbestbox()
		if bestbox then
			fireproximityprompt(bestbox.Base.PurchasePrompt)
			boughtboxes = boughtboxes + 1
		elseif not bestbox then
			break
		end
		task.wait(0.05)
	end	
	task.wait(autofarm_settings.delay)
	if not autofarm_settings.boxes then updatestatus("Off...") return end

	updatestatus("Planting boxes...")
	local _, currentboxes = getBoxes()
	for _, place in boxplace:GetChildren() do
		for i, currentbox in currentboxes do
			if currentbox and currentbox.Parent then 
				plr.Character.HumanoidRootPart.CFrame = place.CFrame
				plr.Character.Humanoid:EquipTool(currentbox)
				task.wait(0.05)
				replicatedstorage.PlaceEvent:FireServer(nil, place)
				task.wait(0.5)
			end
		end
	end
	return true
end

local function collectMoney()
	if not autofarm_settings.collectmoney then return end
	updatestatus("Collecting cash...")
	for _, npc in npcs:GetChildren() do
		plr.Character.HumanoidRootPart.CFrame = npc.VFX.CFrame * CFrame.new(0, 5, 0)
		task.wait(0.1)
		fireproximityprompt(npc.Base.ProximityPrompt)
	end
	return true
end

-- Main

window:Notify({
    Title = "your bank!",
    Description = "recommended to use script on a private server !!!",
    Lifetime = 4
})

local tabgroup = window:TabGroup()

local tab = tabgroup:Tab({
	Name = "Main",
	Image = "rbxassetid://125500743878117"
})

local sections = {
	autofarm = tab:Section({Side = "Left"}),
	configinfo = tab:Section({Side = "Right"}),
	automaticstuff = tab:Section({Side = "Right"})
}

status_label = sections.autofarm:Label({
  Text = "Status: " .. getgenv().status
}, nil)

sections.autofarm:Toggle({
	Name = "Enable Autofarm",
	Default = false,
	Callback = function(v)
		getgenv().autofarm = v
		while autofarm do
			collectMoney()
			boxes()
			task.wait(autofarm_settings.delay)
		end	
	end,
}, "autofarm")

sections.autofarm:Toggle({
	Name = "Collect Money",
	Default = true,
	Callback = function(value)
		autofarm_settings.collectmoney = value
		updateConfigText()
	end,
}, "collectmoney")

sections.autofarm:Toggle({
	Name = "Boxes",
	Default = false,
	Callback = function(value)
		autofarm_settings.boxes = value
		updateConfigText()
	end,
}, "boxestoggle")

sections.autofarm:Input({
    Name = "Delay",
    Placeholder = "seconds",
    AcceptedCharacters = function(input)
        return input:gsub("[^0-9]", "")
    end,
    Callback = function(input)
       autofarm_settings.delay = tonumber(input)
       updateConfigText()
    end,
}, "delay")

sections.autofarm:Input({
    Name = "Minimum Price to Buy Boxes",
    Placeholder = "amount",
    AcceptedCharacters = function(input)
        return input:gsub("[^0-9]", "")
    end,
    Callback = function(input)
       autofarm_settings.value = tonumber(input)
       updateConfigText()
    end,
}, "minvalue")

sections.autofarm:Input({
    Name = "Attempts to buy",
    Placeholder = "attempts",
    AcceptedCharacters = function(input)
        return input:gsub("[^0-9]", "")
    end,
    Callback = function(input)
       autofarm_settings.attempts = tonumber(input)
       updateConfigText()
    end,
}, "delay")

config_text = sections.configinfo:Paragraph({
  Header = "Config",
  Body = string.format(
    "Collect Money: %s\nBoxes: %s\nDelay: %ds\nMinimum Price to Buy Boxes Value: %d\nAttempts: %d",
    autofarm_settings.collectmoney and "Enabled" or "Disabled",
    autofarm_settings.boxes and "Enabled" or "Disabled",
    autofarm_settings.delay,
    autofarm_settings.value,
    autofarm_settings.attempts
  )
}, nil)

sections.automaticstuff:Toggle({
	Name = "Stack Npcs",
	Default = false,
	Callback = function(value)
		getgenv().stack = value
	end,
}, "stacktoggle")

sections.automaticstuff:Input({
    Name = "Stack Amount",
    Placeholder = "ur amount",
    AcceptedCharacters = function(input)
        return input:gsub("[^0-9]", "")
    end,
    Callback = function(input)
       getgenv().stackamount = input
    end,
}, "stackamount")

hook = hookmetamethod(game, "__namecall", function(self, ...)
	local method = getnamecallmethod()
	local args = {...}
	
	if stack and not checkcaller() and method == "FireServer" and self == placeEvent then
		if not stacking then
			stacking = true
			
			hook(self, unpack(args))
			
			for i = 1, stackamount - 1 do
				task.wait(2)
				hook(self, unpack(args))
			end
			
			stacking = false
		end
	end
	
	return hook(self, ...)
end)
