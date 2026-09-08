--[[
 ______   ___  __  _   _ _   _ ____  
|  _ \ \ / / |/ / | | | | | | | __ ) 
| |_) \ V /| ' /  | |_| | | | |  _ \ 
|  _ < | | | . \  |  _  | |_| | |_) |
|_| \_\|_| |_|\_\ |_| |_|\___/|____/ 

by https://berkay.digital | https://discord.gg/ryk

Credits:
UI Library: Rayfield
Loader: Buang
]]
if not game:IsLoaded() then
	game.Loaded:Wait()
end
if not getgenv() then
	function getgenv()
		return _G
	end
end
local games = {
	[34287998] = 'https://ryk.bloxteam.com/gym_league.lua',
	[12115267] = 'https://ryk.bloxteam.com/tycoon_rng.lua',
	[4484070] = 'https://ryk.bloxteam.com/character_rng.lua',
	[15890651] = 'https://ryk.bloxteam.com/clover_ret.lua',
	[33660620] = 'https://ryk.bloxteam.com/ac_battles.lua',
	[17219742] = 'https://ryk.bloxteam.com/anime_vanguards.lua',
}
if games[game.CreatorId] then
	task.wait(1)
	print(getgenv().ryk_loaded)
	if getgenv().ryk_loaded == true then return end
	getgenv().ryk_loaded = true
	print("RYK HUB | Successfully loaded the game.")
	loadstring(game:HttpGet(games[game.CreatorId]))()
else
	getgenv().ryk_loaded = true
	warn('RYK HUB | Game not supported. Please join discord.gg/ryk for support.')
end