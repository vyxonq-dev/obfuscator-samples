-- Load Rayfield UI
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- Rainbow color function
local function rainbowify(text)
	local colors = {
		"#FF0000", "#FF7A00", "#FFFF00",
		"#00FF00", "#0000FF", "#8F00FF"
	}
	local output = ""
	for i = 1, #text do
		local c = text:sub(i, i)
		local color = colors[(i - 1) % #colors + 1]
		output = output .. string.format('<font color="%s">%s</font>', color, c)
	end
	return output
end

-- Store user input
local currentInput = nil

-- Create Rayfield window
local Window = Rayfield:CreateWindow({
	Name = "Trd Rainbow Name Pack",
	LoadingTitle = "Trd Rainbow",
	LoadingSubtitle = "Name Pack Script",
	ConfigurationSaving = {
		Enabled = false
	},
	Discord = {
		Enabled = false
	},
	KeySystem = false
})

-- 🔧 Create a visible tab (this is required!)
local MainTab = Window:CreateTab("Rainbow Tool", 4483362458)

-- 🌈 Input field inside tab
MainTab:CreateInput({
	Name = "Enter Character Name",
	PlaceholderText = "e.g. Labubu",
	RemoveTextAfterFocusLost = false,
	Callback = function(input)
		currentInput = input
	end
})

-- ✅ Confirm button inside tab
MainTab:CreateButton({
	Name = "Confirm & Send Rainbow Name",
	Callback = function()
		if currentInput and currentInput ~= "" then
			local rainbowText = rainbowify(currentInput)
			local args = {
				[1] = "Character",
				[2] = rainbowText
			}
			game:GetService("ReplicatedStorage").Events.Buy:FireServer(unpack(args))

			Rayfield:Notify({
				Title = "Success!",
				Content = "Rainbow name sent for: " .. currentInput,
				Duration = 5
			})
		else
			Rayfield:Notify({
				Title = "Error",
				Content = "Please enter a character name first.",
				Duration = 4
			})
		end
	end
})
