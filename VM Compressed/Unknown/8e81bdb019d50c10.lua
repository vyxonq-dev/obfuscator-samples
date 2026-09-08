------------------------------------------------
-- chatgpt made this idk if the script works
------------------------------------------------

local StarterGui = game:GetService("StarterGui")

StarterGui:SetCore("SendNotification", {
    Title = "read idk",
    Text = 'Executor must have "ReplicateSignal" for SCRIPTS to work.',
    Duration = 8
})

------------------------------------------------
-- SAFE LOAD FUNCTION
------------------------------------------------

local function safeLoad(url)
	local success, result = pcall(function()
		local data = game:HttpGet(url)
		return loadstring(data)
	end)

	if success and result then
		local runSuccess, err = pcall(result)
		if not runSuccess then
			warn("Script runtime error:", url, err)
		end
	else
		warn("Failed to load:", url)
	end
end

------------------------------------------------
-- LOAD RAYFIELD
------------------------------------------------

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

if not Rayfield then
	warn("Rayfield failed")
	return
end

------------------------------------------------
-- WINDOW
------------------------------------------------

local Window = Rayfield:CreateWindow({
	Name = "Krystal Dance scripts",
	LoadingTitle = "Krystal Dance hub",
	LoadingSubtitle = "Rayfield UI",
	ConfigurationSaving = { Enabled = false },
	KeySystem = false
})

------------------------------------------------
-- 📱 MOBILE UI FIX (FIXED)
------------------------------------------------

task.wait(1)

local gui = game.CoreGui:FindFirstChild("Rayfield")
local camera = workspace.CurrentCamera

if gui and camera then
	local scale = gui:FindFirstChildOfClass("UIScale")

	if not scale then
		scale = Instance.new("UIScale")
		scale.Parent = gui
	end

	local screen = camera.ViewportSize

	if screen.X < 500 then
		scale.Scale = 0.6
	elseif screen.X < 800 then
		scale.Scale = 0.7
	else
		scale.Scale = 0.85
	end

	local main = gui:FindFirstChildWhichIsA("Frame", true)
	if main then
		main.Size = UDim2.new(0.9, 0, 0.85, 0)
		main.Position = UDim2.new(0.05, 0, 0.075, 0)
	end
end

------------------------------------------------
-- SAFE TAB CREATION
------------------------------------------------

local function createTab(name)
	local tab
	local success = pcall(function()
		tab = Window:CreateTab(name, 4483362458)
	end)

	task.wait(0.2)

	if success then
		return tab
	else
		warn("Tab failed:", name)
		return nil
	end
end

local KrystalTab   = createTab("Krystal Dance")
local ReanimateTab = createTab("Reanimate")
local ScriptsTab   = createTab("Scripts")
local TrollTab     = createTab("Troll")
local FPSTab       = createTab("FPS Tools")
local SettingsTab  = createTab("Settings")

------------------------------------------------
-- SAFE BUTTON FUNCTION
------------------------------------------------

local function safeButton(tab, name, url)
	if not tab then return end

	tab:CreateButton({
		Name = name,
		Callback = function()
			safeLoad(url)
		end
	})
end

------------------------------------------------
-- KRYSTAL TAB
------------------------------------------------

safeButton(KrystalTab, "Krystal Dance V4",
"https://github.com/AstraOutlight/my-scripts/raw/refs/heads/main/kdv3obfuscated.lua")

safeButton(KrystalTab, "Old Krystal Dance V3 (fixed)",
"https://rawscripts.net/raw/Universal-Script-FIXED-Krystal-Dance-V3-48682")

safeButton(KrystalTab, "Krystal Tool Dance V3 (broken)",
"https://rawscripts.net/raw/Just-a-baseplate.-Krystal-Tool-Dance-V3-By-Theo-45046")

safeButton(KrystalTab, "Krystal Dance V2 (old but works with currentangle)",
"https://pastebin.com/raw/pkvHdyHS")

safeButton(KrystalTab, "Theos Dancezz (tool dance)",
"https://pastebin.com/raw/X02qRc8B")

safeButton(KrystalTab, "Genesis FE Krystal Dance",
"https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Krystal%20Dance")

------------------------------------------------
-- REANIMATE TAB
------------------------------------------------

safeButton(ReanimateTab, "STEVE's Uhhh Reanimate",
"https://raw.githubusercontent.com/STEVE-916-create/Uhhhhhh/main/source/reanim.lua")

safeButton(ReanimateTab, "CurrentAngle V2 Reanimate",
"https://rawscripts.net/raw/Universal-Script-CurrentAngle-V2-Full-axis-reanimate-43351")

safeButton(ReanimateTab, "Oxide Reanimate (broken)",
"https://rawscripts.net/raw/Universal-Script-Oxide-Reanimate-Free-Version-NEW-72922")

------------------------------------------------
-- SCRIPTS TAB
------------------------------------------------

safeButton(ScriptsTab, "Oxide Giant Dance (broken)",
"https://rawscripts.net/raw/Universal-Script-Krystal-dance-v3-giant-dance-1-47440")

safeButton(ScriptsTab, "delta Keyboard mobile",
"https://raw.githubusercontent.com/Xxtan31/Ata/main/deltakeyboardcrack.txt")

safeButton(ScriptsTab, "Inf yield",
"https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")

safeButton(ScriptsTab, "Nameless admin v250",
"https://rawscripts.net/raw/Universal-Script-Nameless-admin-v250-script-87765")

------------------------------------------------
-- TROLL TAB
------------------------------------------------

safeButton(TrollTab, "FE Ragdoll",
"https://rawscripts.net/raw/Universal-Script-testingtrashcode-46515")

safeButton(TrollTab, "Zee Hub",
"https://rawscripts.net/raw/Universal-Script-Zee-Hub-v5-38317")

safeButton(TrollTab, "Random Script",
"https://rawscripts.net/raw/Universal-Script-Wally-West-Roblox-51462")

------------------------------------------------
-- FPS TAB
------------------------------------------------

if FPSTab then
	FPSTab:CreateInput({
		Name = "Set FPS",
		PlaceholderText = "Example: 20",
		Callback = function(Text)
			local fps = tonumber(Text)
			if fps and setfpscap then
				pcall(function()
					setfpscap(fps)
				end)
			end
		end
	})

	FPSTab:CreateButton({
		Name = "Unlock FPS",
		Callback = function()
			if setfpscap then
				pcall(function()
					setfpscap(0)
				end)
			end
		end
	})
end

------------------------------------------------
-- SETTINGS
------------------------------------------------

if SettingsTab then
	SettingsTab:CreateButton({
		Name = "Destroy GUI",
		Callback = function()
			if Rayfield then
				pcall(function()
					Rayfield:Destroy()
				end)
			end
		end
	})
end