repeat task.wait() until game:IsLoaded()

if _G.syb then
    game.Players.LocalPlayer:Kick("Dont Exec Twice")
    while task.wait() do end
else
    _G.syb = true
end

-- testing branch, not on main script

if game.gameId == 7882829745 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/diepedyt/bui/refs/heads/main/BananaHubLoader.lua"))()
    --loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/2f2cfcd821dc35ec9d51a13dd77e122e.lua"))()
end
