



local HttpService = game:GetService("HttpService")
local placeId = game.PlaceId 
local url = "https://apis.roblox.com/universes/v1/places/" .. placeId .. "/universe"
local data 
local success, response = pcall(function()
	return request({
		Url = url
	})
end)
task.spawn(function()
	local TimeScript = os.time()
	repeat
		task.wait()
		if getgenv().RoyxLoaded then
			print("Royx Loaded")
			return
		end
		if os.time() - TimeScript > 90 then
			game.Players.LocalPlayer:Kick("Wating Too long")
		end
	until dsadasvcxv
end)
if success then
	data = HttpService:JSONDecode(response.Body)
	if data and data.universeId then
		print("Universe ID:", data.universeId)
	else
		game.Players.LocalPlayer:Kick("Universe ID not found.")
	end
	if data.universeId == 3747388906 then 
		return 
	end
else
	game.Players.LocalPlayer:Kick("Failed to fetch Universe ID:" ..  response)
end

local Script_Tbl = {
	[7074860883] = "https://raw.githubusercontent.com/nomed-rin/Royx_Free/refs/heads/main/Arise%20Crossover",
	[4931927012] = "https://raw.githubusercontent.com/nomed-rin/Royx_Free/refs/heads/main/Basketball%20Legends",
	[5682590751] = "https://raw.githubusercontent.com/nomed-rin/Royx_Free/refs/heads/main/Lootify.lua",
	[6884266247] = "https://raw.githubusercontent.com/nomed-rin/Royx_Free/refs/heads/main/Anime-Rangers-X",
}

local RefPlaceId = {
	[7074860883] = 87039211657390,
	[4931927012] = placeId,
	[5682590751] = placeId,
	[6884266247] = 72829404259339,
}

game.CoreGui.DescendantAdded:connect(function(Ins)
	if Ins.Name == "LeaveButton" then
		repeat
			task.wait(1)
			game:GetService("TeleportService"):Teleport(RefPlaceId[data.universeId], game:GetService("Players").LocalPlayer)
		until FuckYouHaHa
	end
end)

local Script_Url = Script_Tbl[data.universeId]
if Script_Url then 
	loadstring(game:HttpGet(Script_Url))()
end
