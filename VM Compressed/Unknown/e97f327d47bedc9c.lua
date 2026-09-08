local Games = loadstring(game:HttpGet("https://raw.githubusercontent.com/AmeloxRUS/GameList/refs/heads/main/list"))()

local URL = Games[game.PlaceId]

if URL then
  loadstring(game:HttpGet(URL))()
end
