if game.PlaceId == 7606602544 then
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/bbccdf75425332848ae0bf6d3068f0c1.lua"))()
elseif game.PlaceId == 16732694052 or game.PlaceId == 72907489978215 then
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/cba17b913ee63c7bfdbb9301e2d87c8b.lua"))()
elseif game.PlaceId == 70876832253163 then
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/df969469b8fd0d18b763a0fba7c700a0.lua"))()
elseif game.PlaceId == 116495829188952 then
    queue_on_teleport('loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/df969469b8fd0d18b763a0fba7c700a0.lua"))()')
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/df969469b8fd0d18b763a0fba7c700a0.lua"))()
elseif game.PlaceId == 7606564092 then
    queue_on_teleport('loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/bbccdf75425332848ae0bf6d3068f0c1.lua"))()')
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/bbccdf75425332848ae0bf6d3068f0c1.lua"))()
elseif game.PlaceId == 85896571713843 then
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/f5d517c7a5fe691a69c4f0c33c3bc514.lua"))()
else
    warn("[Moon X] -> Game not supported.")
end
