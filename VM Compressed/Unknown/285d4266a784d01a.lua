local Games = loadstring(game:HttpGet("https://raw.githubusercontent.com/sosopjs/Listgame/refs/heads/main/games"))()

local URL = Games[game.PlaceId]

if URL then
  loadstring(game:HttpGet(URL))()
end
