local SupportedGames = {
    [126884695634066] = {
        Name = "Grow a Garden",
        Url = "https://raw.githubusercontent.com/fatigue-a/skeleton-hub/refs/heads/main/games/GrowAGarden.lua"
    },
    [0] = {
        Name = "PlaceHolder",
        Url = "https://raw.githubusercontent.com/fatigue-a/skeleton-hub/refs/heads/main/games/placeholder.lua"
    }
}

local gameData = SupportedGames[game.PlaceId]

if gameData then
    print("[Skeleton Hub] Loading for:", gameData.Name)
    loadstring(game:HttpGet(gameData.Url))()
else
    warn("[Skeleton Hub] This game is not supported.")
end
