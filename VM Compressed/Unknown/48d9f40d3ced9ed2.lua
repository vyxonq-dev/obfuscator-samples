local games = {
    [10563114921] = "https://raw.githubusercontent.com/GrexXMeng/Mengs/refs/heads/main/StealAnEgg.lua",
    [9363735110] = "https://raw.githubusercontent.com/GrexXMeng/Mengs/refs/heads/main/TsunamiBrainrot.lua",
    [6051475510] = "https://raw.githubusercontent.com/GrexXMeng/Mengs/refs/heads/main/Fisch.lua",
    [9186719164] = "https://raw.githubusercontent.com/GrexXMeng/Mengs/refs/heads/main/SailorPiece.lua",
    [6739698191] = "https://raw.githubusercontent.com/GrexXMeng/Mengs/refs/heads/main/ViolenceDistrict.lua",
    [10200395747] = "https://raw.githubusercontent.com/GrexXMeng/Mengs/refs/heads/main/GAG2.lua",
    [121864768012064] = "https://raw.githubusercontent.com/GrexXMeng/Mengs/refs/heads/main/FishIt.lua",
    [79378095465365] = "https://raw.githubusercontent.com/GrexXMeng/Mengs/refs/heads/main/FishIt.lua",
    [16732694052] = "https://raw.githubusercontent.com/GrexXMeng/Mengs/refs/heads/main/Fisch.lua",
    [131716211654599] = "https://raw.githubusercontent.com/GrexXMeng/Mengs/refs/heads/main/Fisch.lua",
    [86362492050446] = "https://raw.githubusercontent.com/GrexXMeng/Mengs/refs/heads/main/TsunamiBrainrot.lua",
    [83369512629707] = "https://raw.githubusercontent.com/GrexXMeng/Mengs/refs/heads/main/SawahIndo.lua",
    [77747658251236] = "https://raw.githubusercontent.com/GrexXMeng/Mengs/refs/heads/main/SailorPiece.lua",
    [93978595733734] = "https://raw.githubusercontent.com/GrexXMeng/Mengs/refs/heads/main/ViolenceDistrict.lua",
    [97598239454123] = "https://raw.githubusercontent.com/GrexXMeng/Mengs/refs/heads/main/GAG2.lua",
    [107778070777162] = "https://raw.githubusercontent.com/GrexXMeng/Mengs/refs/heads/main/StealAnEgg.lua",
}

local currentPlaceID = game.PlaceId
local currentUniverseID = game.GameId
local scriptURL = games[currentUniverseID] or games[currentPlaceID]

if scriptURL then
    print("Meng Hub: Loading script for ID " .. (games[currentUniverseID] and "Universe" or "Place"))
    loadstring(game:HttpGet(scriptURL))()
else
    local msg = "\nMap not supported yet!\nPlaceId: " .. tostring(currentPlaceID) .. "\nUniverseId: " .. tostring(currentUniverseID)
    game.Players.LocalPlayer:Kick(msg)
    print(msg)
end
