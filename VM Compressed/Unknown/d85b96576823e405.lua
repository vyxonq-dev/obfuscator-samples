-- Master Loader
local scripts = {
    [18687417158] = "https://raw.githubusercontent.com/nitaybl/Thisrepoisdefinetleynotgonnabeleaked/pulsesаkenv2.lua",
    [13559635034] = "https://raw.githubusercontent.com/nitaybl/PulSec/refs/heads/main/combatinitiatiоn.lua"
}
local id = game.PlaceId
local url = scripts[id]
loadstring(game:HttpGet(url))()
