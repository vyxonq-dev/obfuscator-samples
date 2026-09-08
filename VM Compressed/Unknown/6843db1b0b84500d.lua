
local gameScripts = {
    [136835976646463] = "https://raw.githubusercontent.com/DachshundHub/Dachshund-s/refs/heads/main/dachshund-hub.lua", -- Game 1
    [12355337193] = "https://raw.githubusercontent.com/DachshundHub/Dachshund-s/refs/heads/main/you.lua",           -- Game 2
    [79137923166591] = "https://raw.githubusercontent.com/DachshundHub/Dachshund-s/refs/heads/main/SLAP.lua",       -- Game 3
}

local currentGame = game.PlaceId
local scriptUrl = gameScripts[currentGame]

if scriptUrl then
    loadstring(game:HttpGet(scriptUrl))()
else
    warn("No script configured for this game (ID: " .. currentGame .. ")")
end


