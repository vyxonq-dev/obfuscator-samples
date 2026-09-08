local games = {
[121864768012064] = "https://raw.githubusercontent.com/vinxonez/ViKai-HUB/refs/heads/main/fishit",
[537413528] = "https://raw.githubusercontent.com/vinxonez/ViKai-HUB/refs/heads/main/babft",
[138365924124161] = "https://raw.githubusercontent.com/x2wkaiznxkaga/backroomdrift/refs/heads/main/autofarm.lua",
[1240123653] = "https://raw.githubusercontent.com/vinxonez/ViKai-HUB/refs/heads/main/zombieattack",
[85789382282446] = "https://raw.githubusercontent.com/vinxonez/ViKai-HUB/refs/heads/main/planerace",
[135880624242201] = "https://raw.githubusercontent.com/vinxonez/ViKai-HUB/refs/heads/main/cuttrees",
[127742093697776] = "https://raw.githubusercontent.com/vinxonez/ViKai-HUB/refs/heads/main/pvb",
[2248408710] = "https://raw.githubusercontent.com/x2wkaiznxkaga/Destruction-Simulator/refs/heads/main/ViKai%20HUB",
[78320694285708] = "https://raw.githubusercontent.com/vinxonez/ViKai-HUB/refs/heads/main/animaltraining",
[3101667897] = "https://raw.githubusercontent.com/x2wkaiznxkaga/legendsofspeed/refs/heads/main/ViKaiHUB.lua",

}

local currentID = game.PlaceId
local scriptURL = games[currentID]

if scriptURL then
loadstring(game:HttpGet(scriptURL))()
else
game.Players.LocalPlayer:Kick("You're monckiest black niggerest in the world, read the discord dumbass!!")
end

