local maclib = loadstring(game:HttpGet("https://github.com/biggaboy212/Maclib/releases/latest/download/maclib.txt"))()

local plr = game.Players.LocalPlayer
local viewport = workspace.CurrentCamera.ViewportSize

local plrplot = workspace:WaitForChild("Plots"):WaitForChild(plr.Name)
local blocks = plrplot:WaitForChild("Blocks")

local eventfolder = game:GetService("ReplicatedStorage"):WaitForChild("Functions")

getgenv().autotap = false
getgenv().automerge = false
getgenv().autoupgrade = false
getgenv().selectedupgrade = {}
getgenv().delay = 0.6

local window = maclib:Window({
	Title = "Merge Simulator",
	Subtitle = "open sourced script",
	Size = UDim2.fromOffset(viewport.X * 0.72, viewport.Y * 0.9), -- 800, 600
	DragStyle = 1,
	DisabledWindowControls = {},
	ShowUserInfo = true,
	Keybind = Enum.KeyCode.RightControl,
	AcrylicBlur = true,
})

window:Notify({
    Title = "merge simulator",
    Description = "recommended to use script on a private server !!!",
    Lifetime = 4
})

local tabgroup = window:TabGroup()

local tab = tabgroup:Tab({
	Name = "Main",
	Image = "rbxassetid://125500743878117"
})

local sections = {
	automaticstuff = tab:Section({Side = "Left"}),
}

sections.automaticstuff:Toggle({
	Name = "Auto Merge",
	Default = false,
	Callback = function(value)
		getgenv().automerge = value
		
		if not value then return end
		local lastsortime = 0
		
		task.spawn(function()
			while automerge do
				local currentTime = os.clock()
				local blockstable = {}
				local merged = false

				if currentTime - lastsortime >= 3 then
					for _, block in blocks:GetChildren() do
						table.insert(blockstable, block)
					end
					
					table.sort(blockstable, function(a, b)
						return a:GetAttribute("level") < b:GetAttribute("level")
					end)
				end
				
				for i = 1, #blockstable - 1 do
					local block1 = blockstable[i]
					local block2 = blockstable[i + 1]
					
					if block1 and block2 then
						if block1:GetAttribute("level") == block2:GetAttribute("level") then
							block1.CFrame = block2.CFrame
							merged = true
							break
						end
					end
				end
				
				task.wait(merged and 0.25 or delay)
			end
		end)
	end,
}, "automerge")

sections.automaticstuff:Input({
    Name = "Delay of AutoMerge",
    Placeholder = "seconds",
    AcceptedCharacters = function(input)
        return input:gsub("[^0-9]", "")
    end,
    Callback = function(input)
       getgenv().delay = tonumber(input)
    end,
}, "delay")

sections.automaticstuff:Toggle({
	Name = "Auto Tap",
	Default = false,
	Callback = function(v)
		getgenv().autotap = v
		while autotap do
			for _, block in plrplot:WaitForChild("Blocks"):GetChildren() do
				eventfolder:WaitForChild("Tap"):FireServer(block) 		
				task.wait(0.1)	
			end
			task.wait(0.3)	
		end	
	end,
}, "autotap")

sections.automaticstuff:Toggle({
	Name = "Auto Upgrade",
	Default = false,
	Callback = function(v)
		getgenv().autoupgrade = v
		while autoupgrade do
			for upgrade, _ in selectedupgrade do
				eventfolder:WaitForChild("BuyUpgrade"):FireServer(upgrade)		
				task.wait(0.1)	
			end
			task.wait(0.3)	
		end	
	end,
}, "autoupg")

sections.automaticstuff:Dropdown({
	Name = "Select Upgrade",
	Search = true,
	Multi = true,
	Required = false,
	Options = {"SpawnTier", "MaxBlocks", "Cooldown"},
	Default = {nil},
	Callback = function(supgrade)
		selectedupgrade = supgrade
	end,
}, "selectupg")

