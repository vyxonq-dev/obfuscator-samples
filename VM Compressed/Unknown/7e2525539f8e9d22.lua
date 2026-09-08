setclipboard("discord.gg/nTp7xv4PjB")
task.wait(0.5)
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
	Name = "Troll GUI",
	LoadingTitle = "Durian Hub",
	LoadingSubtitle = "Troll GUI",
    KeySystem = true, -- Set this to true to use our key system
    KeySettings = {
       Title = "Durian Hub",
       Subtitle = "Troll GUI",
       Note = "discord.gg/nTp7xv4PjB", -- Use this to tell the user how to get a key
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"Durian-Bruh"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local Tab = Window:CreateTab("Main", 4483362458)

local Toggles = {
	["사라지는 파트"] = false,
	["Gudock"] = false
}

local OGPositions = {}

local function bringPartsByName(name)
	local plr = game.Players.LocalPlayer
	local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
	if not hrp then return end

	for _, obj in pairs(workspace:GetDescendants()) do
		if obj:IsA("BasePart") and obj.Name == name then
			if not OGPositions[obj] then
				OGPositions[obj] = obj.CFrame
			end
			obj.Anchored = true
			obj.CanCollide = false
			obj.CFrame = hrp.CFrame
		end
	end
end

local function resetPartsByName(name)
	for part, cf in pairs(OGPositions) do
		if part and part.Name == name then
			part.CFrame = cf
		end
	end
end

task.spawn(function()
	while task.wait(0.5) do
		for name, state in pairs(Toggles) do
			if state then
				bringPartsByName(name)
			end
		end
	end
end)

Tab:CreateToggle({
	Name = "Remove platforms",
	CurrentValue = false,
	Callback = function(state)
		Toggles["사라지는 파트"] = state
		if not state then
			resetPartsByName("사라지는 파트")
		end
	end,
})

Tab:CreateToggle({
	Name = "Troll button",
	CurrentValue = false,
	Callback = function(state)
		Toggles["Gudock"] = state
		if not state then
			resetPartsByName("Gudock")
		end
	end,
})
