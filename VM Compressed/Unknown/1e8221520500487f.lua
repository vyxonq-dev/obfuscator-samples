
local Player = game.Players.LocalPlayer
local PlaceId = game.PlaceId


local Scripts = {
    [12991635726] = "https://raw.githubusercontent.com/Sakuras-Hub/Script-Hub/refs/heads/main/Sneaker-Resell-Simulator.lua",
    [16018721946] = "https://raw.githubusercontent.com/Sakuras-Hub/Script-Hub/refs/heads/main/Sneaker-Resell-Simulator-Shoe-Sniper.lua",
	[17321021033] = "https://raw.githubusercontent.com/Sakuras-Hub/Script-Hub/refs/heads/main/Sneaker-Resell-Simulator-Shoe-Sniper.lua",
	[14426736742] = "https://raw.githubusercontent.com/Sakuras-Hub/Script-Hub/refs/heads/main/Sneaker-Square.lua",
	[3956818381] = "https://raw.githubusercontent.com/Sakuras-Hub/Script-Hub/refs/heads/main/ninja-legends.lua",
	[137233438285284] = "https://raw.githubusercontent.com/Sakuras-Hub/Script-Hub/refs/heads/main/%5BUPD%5D-Chicken-Farm.lua",
}

if Scripts[PlaceId] then
    print("Script found for this game, loading...")
    loadstring(game:HttpGet(Scripts[PlaceId]))()
else
    print("No custom script for this game: " .. PlaceId)
end
