--[[

██╗     ██╗   ██╗██╗  ██╗██╗   ██╗███████╗     ██████╗ ██████╗ ███╗   ███╗███╗   ███╗██╗   ██╗███╗   ██╗██╗████████╗██╗   ██╗
██║     ██║   ██║╚██╗██╔╝██║   ██║██╔════╝    ██╔════╝██╔═══██╗████╗ ████║████╗ ████║██║   ██║████╗  ██║██║╚══██╔══╝╚██╗ ██╔╝
██║     ██║   ██║ ╚███╔╝ ██║   ██║███████╗    ██║     ██║   ██║██╔████╔██║██╔████╔██║██║   ██║██╔██╗ ██║██║   ██║    ╚████╔╝ 
██║     ██║   ██║ ██╔██╗ ██║   ██║╚════██║    ██║     ██║   ██║██║╚██╔╝██║██║╚██╔╝██║██║   ██║██║╚██╗██║██║   ██║     ╚██╔╝  
███████╗╚██████╔╝██╔╝ ██╗╚██████╔╝███████║    ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║ ╚═╝ ██║╚██████╔╝██║ ╚████║██║   ██║      ██║   
╚══════╝ ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚══════╝     ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝   ╚═╝      ╚═╝   
Developed by Louissxe - https://louissxe.store - https://www.tiktok.com/@louissxe.store - https://discord.gg/BGV6x4f7Zk
]]--

repeat
	task.wait()
until game:IsLoaded()
local LuxvsHub = {}
LuxvsHub.Universal = "https://raw.githubusercontent.com/louissxe/Lua/main/keyless/Universal.lua"
LuxvsHub.Games = {
	[89469502395769] = {
		name = "Kick a lucky block",
		url = "https://raw.githubusercontent.com/louissxe/Lua/main/keyless/kickalucky.lua"
	},
	[92416421522960] = {
		name = "Slime RNG",
		url = "https://raw.githubusercontent.com/louissxe/Lua/main/keyless/slimerng.lua"
	},
	[70845479499574] = {
		name = "Bite by night",
		url = "https://raw.githubusercontent.com/louissxe/Lua/main/keyless/bitebynight.lua"
	},
	[130274245431977] = {
		name = "Climb and Plunge",
		url = "https://raw.githubusercontent.com/louissxe/Lua/main/keyless/ClimbAndPlunge.lua"
	}
}
function LuxvsHub.Notify(title, text, duration)
	pcall(function()
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = title,
			Text = text,
			Duration = duration or 5
		})
	end)
end
function LuxvsHub.Load(url)
	local success, result = pcall(function()
		return loadstring(game:HttpGet(url))()
	end)
	if success then
		LuxvsHub.Notify("LuxvsHub", "Successfully loaded script!", 5)
	else
		LuxvsHub.Notify("LuxvsHub Error", tostring(result), 8)
	end
	return result
end
local gameData = LuxvsHub.Games[game.PlaceId]
local scriptURL = gameData and gameData.url or LuxvsHub.Universal
local gameName = gameData and gameData.name or "Universal"
LuxvsHub.Notify("LuxvsHub", "Loading " .. gameName .. "...", 5)
LuxvsHub.Load(scriptURL)
