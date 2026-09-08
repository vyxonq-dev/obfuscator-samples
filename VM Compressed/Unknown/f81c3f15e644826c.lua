local Games = loadstring(game:HttpGet("https://raw.githubusercontent.com/Rain-Hub1/Ro-Hub/refs/heads/main/List.lua"))()

for PlaceID, Execute in pairs(Games) do
    if PlaceID == game.PlaceId then
        loadstring(game:HttpGet(Execute))()
    end
end
