local Games = loadstring(game:HttpGet("https://raw.githubusercontent.com/Forsakenedxd/test/refs/heads/main/Games.lua"))()

for PlaceID, Execute in pairs(Games) do
    if PlaceID == game.PlaceId then
        loadstring(game:HttpGet(Execute))()
    end
end
-- Thank to speedhub x to this code bc idk how i should do this
-- THAT'S NOT MY LOADER!
