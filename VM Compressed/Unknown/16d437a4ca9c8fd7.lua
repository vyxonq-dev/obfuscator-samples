local replicatedStorage = game:GetService("ReplicatedStorage")

local maclib = loadstring(game:HttpGet("https://github.com/biggaboy212/Maclib/releases/latest/download/maclib.txt"))()

local plr = game.Players.LocalPlayer
local plrModule = require(replicatedStorage.Client.Player)

local remotes = replicatedStorage.Remotes
local ragdolls = #workspace.Ragdolls:GetChildren()
local zones = #workspace.Zones:GetChildren()
local powers = {}

getgenv().autofarm = true
getgenv().value = 100
getgenv().delay = 0.1
getgenv().upgrades = {}
getgenv().autoupgrade = false
getgenv().multiupgrade = 1

local window = maclib:Window({
	Title = "Break a Friend",
	Subtitle = "open sourced script",
	Size = UDim2.fromOffset(800, 600),
	DragStyle = 1,
	DisabledWindowControls = {},
	ShowUserInfo = true,
	Keybind = Enum.KeyCode.RightControl,
	AcrylicBlur = true,
})


window:Notify({
    Title = "Break a Friend",
    Description = "recommended to use autofarm on a private server !!!",
    Lifetime = 4
})

for i, v in plr.PlayerGui.Main.Center.Powers.Holder:GetChildren() do
	if v:IsA("ImageButton") then
		table.insert(powers, v.Name)
	end
end

local tabgroup = window:TabGroup()

local tab = tabgroup:Tab({
	Name = "Main",
	Image = "rbxassetid://125500743878117"
})

local sections = {
	autofarm = tab:Section({Side = "Left"}),
	autobuy = tab:Section({Side = "Right"})
}

sections.autofarm:Toggle({
	Name = "Autofarm",
	Default = false,
	Callback = function(v)
		getgenv().autofarm = v
		while autofarm and task.wait(getgenv().delay) do
			remotes:WaitForChild("FinishedRagdoll"):FireServer(getgenv().value)	
		end	
	end,
}, "AutofarmToggle")

sections.autofarm:Slider({
	Name = "Delay",
	Default = 0.1,
	Minimum = 0.1,
	Maximum = 60,
	DisplayMethod = "Value",
	Callback = function(value)
		getgenv().delay = value
	end,
}, "delay")

sections.autofarm:Input({
    Name = "Target Amount",
    Placeholder = "enter amount",
    AcceptedCharacters = function(input)
        return input:gsub("[^0-9]", "")
    end,
    Callback = function(input)
        getgenv().value = input
    end,
}, "numberAutofarm")

sections.autobuy:Toggle({
	Name = "Autobuy Ragdolls",
	Default = false,
	Callback = function(v)
		getgenv().autoragdolls = v
		while autoragdolls and task.wait(4) do
			local maxowned = math.max(unpack(plrModule.Data.Ragdolls))			
			for i = maxowned + 1, ragdolls do
				remotes:WaitForChild("BuyRagdoll"):InvokeServer(i)
				task.wait(0.3)
			end
		end	
	end,
}, "AutoRagdollsToggle")


sections.autobuy:Dropdown({
	Name = "Select Upgrades",
	Search = true,
	Multi = true,
	Required = false,
	Options = {"Leg", "Arm", "Torso", "Head", "Strength"},
	Default = {nil},
	Callback = function(upgrade)
		upgrades = upgrade
	end,
}, "selectupgrades")

sections.autobuy:Input({
    Name = "Multi Upgrade",
    Placeholder = "number",
    AcceptedCharacters = function(input)
        return input:gsub("[^0-9]", "")
    end,
    Callback = function(input)
        getgenv().multiupgrade = input
    end,
}, "numberAutofarm")


sections.autobuy:Toggle({
	Name = "Auto Upgrade",
	Default = false,
	Callback = function(value)
		getgenv().autoupgrade = value
		while autoupgrade do
			for upgrade, bool in upgrades do
				remotes:WaitForChild("UpgradeLevel"):InvokeServer(upgrade, getgenv().multiupgrade)
			end
			task.wait(2)
		end
	end,
}, "autoupgrade")

sections.autobuy:Toggle({
	Name = "Autobuy Zones",
	Default = false,
	Callback = function(v)
		getgenv().autozone = v
		while autozone and task.wait(1) do
			for i = 1, zones do
				remotes:WaitForChild("PurchaseZone"):InvokeServer(i)
				task.wait(3)
			end
		end	
	end,
}, "autozone")

sections.autobuy:Toggle({
	Name = "Autobuy Powers",
	Default = false,
	Callback = function(v)
		getgenv().autopowers = v
		while autopowers do
			for i, v in powers do
				remotes:WaitForChild("PurchasePower"):FireServer(v)	
			end
			task.wait(3)
		end	
	end,
}, "autopowers")

sections.autobuy:Toggle({ -- idk why
	Name = "Auto Rebirth",
	Default = false,
	Callback = function(v)
		getgenv().autorebirth = v
		while autorebirth and task.wait(3) do
			remotes:WaitForChild("AttemptRebirth"):InvokeServer()
		end	
	end,
}, "autorebirth")
