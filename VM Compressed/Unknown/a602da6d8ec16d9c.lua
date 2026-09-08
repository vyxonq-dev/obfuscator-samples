if game.PlaceId == 142823291 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/zysws/scripts/main/mm2.luau"))()
    warn("[Info] Running supported script")
elseif game.PlaceId == 16732694052 or 131716211654599 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/zysws/scripts/main/fisch.luau"))()
    warn("[Info] Running supported script")
else
    loadstring(game:HttpGet("https://raw.githubusercontent.com/zysws/scripts/main/universal-aimbot.luau"))()
    warn("[Info] Running non-supported script")
end
