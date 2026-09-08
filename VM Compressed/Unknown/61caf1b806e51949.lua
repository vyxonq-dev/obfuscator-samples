local gameScripts = {
    [3101667897] = "https://pastebin.com/raw/aQB7Ywn8", -- Legends of speed
 [9558874729] = "https://raw.githubusercontent.com/mohamedyoo/owlhub/main/super%20human%20training%20simulator", -- shts
[8903913082] = "https://pastebin.com/raw/4QWnK8vu", -- spm2
[12014935450] = "https://raw.githubusercontent.com/mohamedyoo/Sim-Hub/main/Superhuman%20Simulator%20%5BNEW%5D", -- Superhuman Simulator [NEW]

[14783149858] = "https://raw.githubusercontent.com/mohamedyoo/Sim-Hub/main/Super%20Power%20Masters%20X", -- spmx
[15604767488] = "https://raw.githubusercontent.com/mohamedyoo/Sim-Hub/main/Ultimate%20Super%20Power%20Training", -- USPT

}

local placeId = game.PlaceId
local scriptUrl = gameScripts[placeId]

if scriptUrl then
    loadstring(game:HttpGet(scriptUrl, true))()
else
    loadstring(game:HttpGet("https://raw.githubusercontent.com/mohamedyoo/owlhub/main/universal%20list"))()
end
