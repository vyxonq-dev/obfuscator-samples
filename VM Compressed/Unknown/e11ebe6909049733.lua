repeat
    task.wait()
until game:IsLoaded()

local creator = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Creator.CreatorTargetId

local games = {
    [3739465] = 'DungeonHeroes',
    [34644452] = 'AriseCrossover',
    [35789249] = 'GrowAGarden',
    [34063840] = "AnimeRising"
}

if games[creator] == 'DungeonHeroes' then
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/2146985311add4441096ab2fa045c43b.lua"))()
elseif games[creator] == 'AriseCrossover' then
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/9a06c295106b79bf51a671f942cc207d.lua"))()
elseif games[creator] == 'GrowAGarden' then
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/34a51369fb7ff2ccec7ad7595ed5df59.lua"))()
elseif games[creator] == 'AnimeRising' then
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/c3bbacf3e55680fd480f78095ed00d00.lua"))()
else
    warn("Game is unsupported. Supported games: Dungeon Heroes, Arise Crossover, Grow A Garden")
    return
end
