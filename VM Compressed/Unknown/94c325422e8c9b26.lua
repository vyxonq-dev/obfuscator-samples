local gameId = game.GameId

-- 0. Baseplate | https://www.roblox.com/games/5305031231/EMPTY-BASEPLATE
-- Only for testing UI functionality.

if gameId == 1857551830 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/sinsly/Modular/refs/heads/main/List/Baseplate.luau"))()


-- 1. Abyss | https://www.roblox.com/games/127794225497302/Abyss

elseif gameId == 8144728961 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/sinsly/Modular/refs/heads/main/List/Abyss.luau"))()
else


    print("Game is not supported")
end
