if not game:IsLoaded() then
	game.Loaded:Wait()
end
task.wait(math.random())

if getgenv().HinaHub_Executed then return end
getgenv().HinaHub_Executed = true

local Hub = "Hina Hub"
local Discord_Invite = "NZHwScVxv3"
local Key_Link = "https://ads.luarmor.net/get_key?for=Hina_Hub-PQmcKkkVQYbm"
local KeyPrem_Link = "https://ads.luarmor.net/get_key?for=Hina_Hub_Prem-EEFpeRyDyEpY"
local Workink_Link = "https://ads.luarmor.net/get_key?for=Hina_Hub_Workink-wSCIaDYsUZma"

local UI_LOADER = "https://raw.githubusercontent.com/Threeeps/acc/refs/heads/main/HinaKeySystem"

local Scripts = {
	[9190691] = { name = "Anime Squadron", script_id = "bb2a6ebcb7d8c9e3952ff164e52a335d" },
	[34208109] = { name = "Anime Card Collection", script_id = "9efd7aeb253b0c53236b2a1f600e7124" },
	[361078446] = { name = "Anime Fighting Simulator", script_id = "a8ab07c9581584c7d03ec6b1f46cc219" },
	[11085403] = { name = "Anime Card Battle X", script_id = "1e1af645f3b86af24fc58e3375b70f81" },
	[34903714] = { name = "Anime Card Clash", script_id = "faec2e5ab410523753d5ba96ef3362ed" },
	[35119227] = { name = "Anime Ghost", script_id = "3d92f8b30257fddaba283735a48c1eb4" },
	[35338731] = { name = "Card Chronicles", script_id = "ec2f68590172d3d2be755f9abbbc8898" },
	[33910482] = { name = "Anime Astral Simulator", script_id = "34603c50d8590f2a7274dd453ceb7659" },
	[35929511] = { name = "Anime Expedition", script_id = "be08aef12663749994f856523cf89f07" },
	[111457579] = { name = "Anime Origins", script_id = "b4087358bc2a66fc4e080c70494654cc" },
}

local current = Scripts[game.CreatorId]
if not current then
	pcall(function()
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = Hub, Text = "This game is not supported!", Duration = 5
		})
	end)
	return
end

getgenv().HinaHub = {
	hub = Hub,
	discord = Discord_Invite,
	keyLink = Key_Link,
	premLink = KeyPrem_Link,
	workinkLink = Workink_Link,
	name = current.name,
	script_id = current.script_id,
}

loadstring(game:HttpGet(UI_LOADER))()
