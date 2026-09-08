local games = {
    [121864768012064] = "https://api.luarmor.net/files/v4/loaders/5fa04da167bca2a54d732a446fc168c5.lua", 
    [76558904092080]  = "https://api.luarmor.net/files/v4/loaders/df7f1ca84a4dcd17d4043c7f2330888a.lua", 
    [129009554587176] = "https://api.luarmor.net/files/v4/loaders/df7f1ca84a4dcd17d4043c7f2330888a.lua",
    [131884594917121] = "https://api.luarmor.net/files/v4/loaders/df7f1ca84a4dcd17d4043c7f2330888a.lua",
}

local currentID = game.PlaceId
local scriptURL = games[currentID]

-- Debugging 
print("Current Game ID:", currentID) 

if scriptURL then
    loadstring(game:HttpGet(scriptURL))() 
else
    game.Players.LocalPlayer:Kick("Yo! This game ain't on the list.\nCheck the Discord for whitelisted games, homie.")
end