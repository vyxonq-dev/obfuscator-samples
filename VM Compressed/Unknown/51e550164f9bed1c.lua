if not game:IsLoaded() then
    game.Loaded:Wait()
end

wait(math.random())

local games = {
    [33820338] = 'https://api.luarmor.net/files/v3/loaders/884122ebe7f689f7a9677fcf49a273e0.lua', -- AR FREE
    [9122948] = 'https://api.luarmor.net/files/v3/loaders/884122ebe7f689f7a9677fcf49a273e0.lua', -- AWTD FREE
    [10611639] = 'https://api.luarmor.net/files/v3/loaders/884122ebe7f689f7a9677fcf49a273e0.lua', -- AA Free
    [15022320] = 'https://api.luarmor.net/files/v3/loaders/de14a2cfc434b795c0c5c904bfc8be43.lua', -- TTD FREE
    [17219742] = 'https://api.luarmor.net/files/v3/loaders/884122ebe7f689f7a9677fcf49a273e0.lua', -- AV FREE
    [15009415] = 'https://api.luarmor.net/files/v3/loaders/884122ebe7f689f7a9677fcf49a273e0.lua', -- ARX FREE
    [34063840] = 'https://api.luarmor.net/files/v3/loaders/884122ebe7f689f7a9677fcf49a273e0.lua', -- AnimeRising FREE
    [35812225] = 'https://api.luarmor.net/files/v3/loaders/a31ba914b0a1382dc36f9dadaa0f14ee.lua', -- Anime Shadow 2
    [5292947] = 'https://api.luarmor.net/files/v3/loaders/a31ba914b0a1382dc36f9dadaa0f14ee.lua', -- ASTDX
	[10749844] = 'https://api.luarmor.net/files/v3/loaders/a31ba914b0a1382dc36f9dadaa0f14ee.lua', -- AG
	[35139043] = 'https://api.luarmor.net/files/v3/loaders/a31ba914b0a1382dc36f9dadaa0f14ee.lua', -- AC
	[34873522] = 'https://api.luarmor.net/files/v3/loaders/bc724ac6146f02e897dfb1900db49bee.lua', -- AE
	[12229756] = 'https://api.luarmor.net/files/v3/loaders/bc724ac6146f02e897dfb1900db49bee.lua', -- ALS
	[35821155] = 'https://api.luarmor.net/files/v3/loaders/bc724ac6146f02e897dfb1900db49bee.lua', -- AW
	[33861560] = 'https://api.luarmor.net/files/v3/loaders/bc724ac6146f02e897dfb1900db49bee.lua', -- UTD
	[8204913] = 'https://api.luarmor.net/files/v3/loaders/bc724ac6146f02e897dfb1900db49bee.lua', -- UTD
}

if games[game.CreatorId] then
	task.wait(math.random())
	if game.CreatorId == 33820338 then
		print('in')
		repeat 
			loadstring(game:HttpGet(games[game.CreatorId]))()
			wait(10)
		until getgenv().GoombaHub ~= nil;
	else
		loadstring(game:HttpGet(games[game.CreatorId]))()
	end
end
