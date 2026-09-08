local maclib = loadstring(game:HttpGet("https://github.com/biggaboy212/Maclib/releases/latest/download/maclib.txt"))()

local plrshop
local plr = game.Players.LocalPlayer
local viewport = workspace.CurrentCamera.ViewportSize

local event = game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("EventManagerClient"):WaitForChild("ServerEvent")

getgenv().autorestock = false
getgenv().autoclaimrewards = false
getgenv().autokill = false
getgenv().delay = 1
getgenv().selectedshop = workspace.Gameplay.Shops["Product Shop"].Prompt.NPC_Prompt

local window = maclib:Window({
	Title = "Build a Store!",
	Subtitle = "open sourced script",
	Size = UDim2.fromOffset(viewport.X * 0.72, viewport.Y * 0.9), -- 800, 600
	DragStyle = 1,
	DisabledWindowControls = {},
	ShowUserInfo = true,
	Keybind = Enum.KeyCode.RightControl,
	AcrylicBlur = true,
})

for i, v in workspace.Gameplay.Plots:GetChildren() do
	if v:GetAttribute("Owner") == plr.UserId then
		plrshop = v
	end
end

local tabgroup = window:TabGroup()

local tab = tabgroup:Tab({
	Name = "Main",
	Image = "rbxassetid://125500743878117"
})

local sections = {
	automaticstuff = tab:Section({Side = "Left"}),
}

sections.automaticstuff:Toggle({
	Name = "Auto Claim Customer Rewards",
	Default = false,
	Callback = function(v)
		getgenv().autoclaimrewards = v
		while autoclaimrewards do
			event:FireServer("ClaimAllUnlockedDailyTaskReward")
			task.wait(1) 
		end	
	end,
}, "autoclaimcustomerrewards")

sections.automaticstuff:Toggle({
	Name = "Auto Kill Thiefs",
	Default = false,
	Callback = function(v)
		getgenv().autokill = v
		
		if autokill then
			if plr.Backpack:FindFirstChild("Bat") then
				plr.Character.Humanoid:EquipTool(plr.Backpack.Bat)
			end
		end
		
		while autokill do
			for _, npc in workspace.Gameplay.Bin:GetChildren() do
				if npc.Name == "Thief" then
					event:FireServer("UseMeleeWeapon", plr.Character:WaitForChild("Bat"), {npc})
					print(npc:GetFullName())
				end
			end
			task.wait(0.3)
		end
	end,
}, "autokill")

sections.automaticstuff:Toggle({
	Name = "Auto Upgrade",
	Default = false,
	Callback = function(v)
		getgenv().autorestock = v
		while autorestock do
			event:FireServer("Upgrade")
			task.wait(3)
		end	
	end,
}, "autoupgrade")

sections.automaticstuff:Toggle({
	Name = "Auto Restock",
	Default = false,
	Callback = function(v)
		getgenv().autorestock = v
		while autorestock do
			for _, button in plrshop.Products:GetChildren() do
				fireproximityprompt(button.Gameplay.PromptPart.InteractPrompt)
				task.wait(0.05)
			end
			task.wait(getgenv().delay) 
		end	
	end,
}, "autorestock")

sections.automaticstuff:Input({
    Name = "Delay of Restock",
    Placeholder = "seconds",
    AcceptedCharacters = function(input)
        return input:gsub("[^0-9]", "")
    end,
    Callback = function(input)
       getgenv().delay = tonumber(input)
    end,
}, "delay")

sections.automaticstuff:Button({
	Name = "Open Shop Frame",
	Callback = function()
		fireproximityprompt(selectedshop)
	end,
})

sections.automaticstuff:Dropdown({
	Name = "Select Shop",
	Search = true,
	Multi = false,
	Required = false,
	Options = {"Product Shop", "Event Shop", "Decoration Shop"},
	Default = {"Product Shop"},
	Callback = function(shop)
		selectedshop = workspace.Gameplay.Shops[shop].Prompt.NPC_Prompt
	end,
}, "select")


