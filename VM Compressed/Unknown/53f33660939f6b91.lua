if not game:IsLoaded() then
    game.Loaded:Wait()
end

local games = {
    [8355209732] = 'https://api.getnebula.lol/auth/v1/games/rhf.lua',
    [7326934954] = 'https://api.getnebula.lol/auth/v1/games/forest.lua',
    [4914269443] = 'https://api.getnebula.lol/auth/v1/games/uns.lua',
    [8795154789] = 'https://api.getnebula.lol/auth/v1/games/flick.lua',
    [9277195104] = 'https://api.getnebula.lol/auth/v1/games/bls.lua',
    [9363735110] = 'https://api.getnebula.lol/auth/v1/games/brt.lua'
}

if games[game.GameId] then
    loadstring(game:HttpGet(games[game.GameId]))()
else
    error("Unsupported Game", 0)
end
