local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
	Name = "BALL3RHUB",
	LoadingTitle = "BALL3RHUB",
	LoadingSubtitle = "by BALL3R",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "ConfigFolder",
		FileName = "BALL3RHUBSettings"
	},
	Discord = {
		Enabled = false
	},
	KeySystem = false
})

Rayfield:Notify({
	Title = "Welcome :)",
	Content = "Welcome to BALL3RHUB",
	Duration = 5,
	Image = "rbxassetid://4483345998"
})

-- Utility function to create buttons with load time notification
local function CreateButton(tab, name, url)
	tab:CreateButton({
		Name = name,
		Callback = function()
			local startTime = tick()
			loadstring(game:HttpGet(url))()
			local loadTime = tick() - startTime
			Rayfield:Notify({
				Title = "Script Loaded!",
				Content = "Loaded in " .. string.format("%.2f", loadTime) .. " seconds.",
				Duration = 5,
				Image = "rbxassetid://4483345998"
			})
		end
	})
end

-- MURDER MYSTERY 2
local Tab1 = Window:CreateTab("MURDERMYSTERY2", 4483345998)
Tab1:CreateSection("MurderMystery2 scripts")

CreateButton(Tab1, "HIGHLIGHTHUB_key hlvipcomingsoon(its a upper case i)", "https://raw.githubusercontent.com/ThatSick/HighlightMM2/main/Main")
CreateButton(Tab1, "VynixuMM2", "https://raw.githubusercontent.com/Neon-Fox/roblox-scripts/main/VynixuMM2")
CreateButton(Tab1, "Xenny-Ware doesnt really work well", "https://raw.githubusercontent.com/xennyy/Xenny-Ware/main/loader.lua")
CreateButton(Tab1, "ECLIPSE", "https://raw.githubusercontent.com/Lookatit7626/Project-R/main/ECLIPSEHUB.lua")
CreateButton(Tab1, "FIXED ball3rmm2", "https://raw.githubusercontent.com/B4L13R/BALL3R/refs/heads/main/script")
CreateButton(Tab1, "TORALSme", "https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/0mm2")

-- DEAD RAIL
local Tab2 = Window:CreateTab("DEAD RAIL", 4483345998)
Tab2:CreateSection("DR scripts")

CreateButton(Tab2, "DR no key but lots of features", "https://api.luarmor.net/files/v3/loaders/e1cfd93b113a79773d93251b61af1e2f.lua")
CreateButton(Tab2, "Dead rails auto farm", "https://raw.githubusercontent.com/kiciahook/kiciahook/refs/heads/main/loader.lua")
CreateButton(Tab2, "solaria DR (has key)", "https://getsomber.com/loader.lua")
CreateButton(Tab2, "NULL FIRE/FIRE hub for Dr mobile", "https://raw.githubusercontent.com/InfernusScripts/Null-Fire/main/Loader")
CreateButton(Tab2, "Strelizia hub DR", "https://raw.githubusercontent.com/0vma/Strelizia/refs/heads/main/Standalone/DeadRails.lua")
CreateButton(Tab2, "RBLXHUB DR", "https://raw.githubusercontent.com/diego987roher/RBLXHUB/refs/heads/main/DeadRailsScript")
CreateButton(Tab2, "TbaoHub Dead Rails", "https://raw.githubusercontent.com/tbao143/thaibao/refs/heads/main/TbaoHubDeadRails")

-- MAKE YOUR OWN
local Tab3 = Window:CreateTab("MAKE YOUR OWN", 4483345998)
Tab3:CreateSection("Make your own scripts")

CreateButton(Tab3, "SIMPLE SPY AND DEX EXPLORER", "https://raw.githubusercontent.com/B4L13R/BALL3RHUB/refs/heads/main/BALL3RHUB%20script")
CreateButton(Tab3, "G0BBY helper which makes scripts for you. recomended", "https://pastebin.com/raw/3AtBrTAd")

local Tab2 = Window:CreateTab("GROW A GARDEN", 4483345998)
Tab2:CreateSection("GG scripts")

CreateButton(Tab2, "BLACKHUB pet mutation(note that freezing is normal when first executed,  give it one or two mins)", "https://raw.githubusercontent.com/Skibidiking123/Fisch1/refs/heads/main/FischMain")

CreateButton(Tab2, "The best free grow a garden script KEYSYSTEM", "https://api.luarmor.net/files/v3/loaders/b44706178039e9b88c4d768d4d8b012f.lua")

CreateButton(Tab2, "Lumin hub KEYSYSTEM(heaps of features)",
 "https://lumin-hub.lol/loader.lua")

CreateButton(Tab2, "Neox hub KEYSYSTEM", "https://raw.githubusercontent.com/hassanxzayn-lua/NEOXHUBMAIN/refs/heads/main/loader")

Rayfield:LoadConfiguration()
