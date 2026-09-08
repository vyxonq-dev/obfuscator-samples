local genv = (getgenv and getgenv()) or _G

genv.ZyrixSkipDefaultHub = true -- skip the default demo hub
genv.SCRIPT_KEY = nil -- clear any saved key so the key UI always shows

local Zyrix = loadstring(game:HttpGet("https://raw.githubusercontent.com/VYZ3N-scripts/Zyrix/main/Zyrix.lua"))() -- source i made

Zyrix.Appearance.Title = "put wtv here" -- title shown on the key UI
Zyrix.Appearance.Subtitle = "where to get key" -- subtitle shown on the key UI
Zyrix.Appearance.Icon = "rbxassetid://120000763572538" -- icon shown on the key UI (locked by the library)

local Window = Zyrix:CreateWindow({ -- creates a window
	Name = "My Script Hub",
	ToggleUIKeybind = "RightControl",
	KeySystem = true, -- set to false to disable the key system
	KeySettings = {
		Title = "My Script Hub", -- name of the script
		Subtitle = "Enter your key to continue", -- where to get key
		Key = "KEY", -- put the key here (string for one key, table for multiple: {"KEY1", "KEY2"})
		SaveKey = true, -- remembers the key so users dont re-enter it
		GetKey = "https://your-key-link.com", -- link to get key
		Discord = "https://discord.gg/yourserver", -- your dc server
		NoGetKey = false, -- set to true to hide the Get Key button
	},
})

local Main = Window:CreateTab("Main") -- create a tab

Main:CreateSection("Core") -- create a section inside the tab

Main:CreateToggle({ -- creates a toggle
	Name = "Enable Aimbot",
	CurrentValue = false, -- default state (true = on, false = off)
	Callback = function(state) -- runs when toggled
		print("Aimbot:", state)
	end
})

Main:CreateSlider({ -- creates a slider
	Name = "FOV",
	Range = {50, 400}, -- min and max values
	CurrentValue = 120, -- default value
	Suffix = "Â°", -- text shown after the value
	Callback = function(value) -- runs when slider is moved
		print("FOV:", value)
	end
})

Main:CreateDropdown({ -- creates a dropdown
	Name = "Target Part",
	Options = {"Head", "Torso", "HumanoidRootPart", "Closest"}, -- selectable options
	CurrentOption = {"Head"}, -- default selected option
	Callback = function(option) -- runs when an option is selected
		print("Target Part:", option[1])
	end
})

Main:CreateKeybind({ -- creates a keybind
	Name = "Aimbot Key",
	CurrentKeybind = "E", -- default key
	Callback = function(key) -- runs when keybind is changed
		print("Key set to:", key.Name)
	end
})

Main:CreateButton({ -- creates a button
	Name = "Reset Settings",
	Callback = function() -- runs when clicked
		Zyrix:Notify("Settings", "Everything has been reset!", 3, "success")
	end
})

local Visuals = Window:CreateTab("Visuals")

Visuals:CreateSection("ESP")

Visuals:CreateToggle({
	Name = "Player ESP",
	CurrentValue = false,
	Callback = function(state)
		print("ESP:", state)
	end
})

Visuals:CreateSlider({
	Name = "ESP Distance",
	Range = {100, 2000},
	CurrentValue = 800,
	Suffix = " studs",
	Callback = function(value)
		print("ESP Distance:", value)
	end
})

Visuals:CreateDropdown({
	Name = "ESP Style",
	Options = {"Box", "Corner", "Skeleton", "Highlight"},
	CurrentOption = {"Corner"},
	Callback = function(opt)
		print("ESP Style:", opt[1])
	end
})

local Movement = Window:CreateTab("Movement")

Movement:CreateSection("Character")

Movement:CreateToggle({
	Name = "Speed Boost",
	CurrentValue = false,
	Callback = function(state)
		local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
		if hum then
			hum.WalkSpeed = state and 50 or 16
		end
	end
})

Movement:CreateSlider({
	Name = "WalkSpeed",
	Range = {16, 120},
	CurrentValue = 16,
	Callback = function(value)
		local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
		if hum then
			hum.WalkSpeed = value
		end
	end
})

Movement:CreateToggle({
	Name = "Infinite Jump",
	CurrentValue = false,
	Side = "Right", -- places this element on the right side of the tab
	Callback = function(state)
		print("Infinite Jump:", state)
	end
})

local Misc = Window:CreateTab("Misc")

Misc:CreateSection("Utility")

Misc:CreateButton({
	Name = "Rejoin Server",
	Callback = function()
		game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
	end
})

Misc:CreateInput({ -- creates a text input box
	Name = "Custom Text",
	PlaceholderText = "Type something...", -- placeholder text when empty
	Callback = function(text) -- runs when user types and presses enter
		print("You typed:", text)
	end
})

Misc:CreateLabel("Made with Zyrix") -- creates a text label

Zyrix:Launch() -- launches the interface (required, nothing shows up without this)