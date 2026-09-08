local games = {
    [121864768012064] = "https://raw.githubusercontent.com/MajestySkie/Chloe-X/refs/heads/main/Games/FishIt.lua",
}

local currentID = game.PlaceId
local scriptURL = games[currentID]

if scriptURL then
    loadstring(game:HttpGet(scriptURL))()
else
    game.Players.LocalPlayer:Kick("Yo! This game ain't on the list.\nCheck the Discord for whitelisted games, homie.")
end
