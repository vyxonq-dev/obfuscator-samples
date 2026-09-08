local Games = loadstring(game:HttpGet("https://raw.githubusercontent.com/StupidityNoob/Game-List/refs/heads/main/gamelist.lua"))()

local URL = Games[game.PlaceId]

if URL then
  loadstring(game:HttpGet(URL))()
end
