if game.PlaceId == 155615604 then
	-- remember: loadstring needs the script source, not just a URL string
	loadstring(
		game:HttpGet(
			'https://raw.githubusercontent.com/localscripts/Fanta/refs/heads/main/prisonlife.lua'
		)
	)()
else
	loadstring(game:HttpGet('https://raw.githubusercontent.com/localscripts/Fanta/refs/heads/main/loader.lua'))()
end
