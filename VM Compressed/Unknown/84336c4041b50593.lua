--// Rayfield Shutdown Notice GUI

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
	Name = "Script Shutdown Notice",
	LoadingTitle = "Status",
	LoadingSubtitle = "Important Message",
	ConfigurationSaving = {
		Enabled = false
	}
})

local Tab = Window:CreateTab("Notice", 4483362458)

Tab:CreateParagraph({
	Title = "Script Disabled",
	Content = "This script has been shut down because my Discord account was banned.\n\nIf you would like to join the new Discord server please click the copy Discord link button below and paste the output into your preferred browser."
})

Tab:CreateButton({
	Name = "Copy Discord Link",
	Callback = function()
		setclipboard("https://discord.gg/BjmCUev7sb")
		Rayfield:Notify({
			Title = "Copied!",
			Content = "The Discord invite link has been copied to your clipboard.",
			Duration = 4
		})
	end
})

-- Optional close button
Tab:CreateButton({
	Name = "Close",
	Callback = function()
		Rayfield:Destroy()
	end
})
