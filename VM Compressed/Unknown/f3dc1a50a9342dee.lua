local MarketplaceService = game:GetService("MarketplaceService")

local games = {
    [8592863835] = {src="https://raw.githubusercontent.com/SheshHub/SheshHub-New/main/Games/MM2.lua"},
} 

local check = games[game.PlaceId] 

if check then
    loadstring(game:HttpGet(check.src, true))()
else
    local Players = game:GetService("Players")
    Players.LocalPlayer:Kick(string.format("%s is unsupported.", MarketplaceService:GetProductInfo(game.PlaceId).Name))
end
