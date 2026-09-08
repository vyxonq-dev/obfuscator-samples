local games = {
    [79137923166591] = function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d2e7de99473cc506cb5241c51ea404d1.lua"))()
    end,
    [12355337193] = function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/7dc1a1c38aeb40780e8db855cc0943a9.lua"))()
    end,
    [13771457545] = function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/7dc1a1c38aeb40780e8db855cc0943a9.lua"))()
    end,
}

local loader = games[game.PlaceId]
if loader then
    loader()
end
