local scripts = {
    [107657120404606] = "highestevercartride.lua",
    [107902165166130] = "skiingandslide.lua",
    [87724814660885]  = "climbtosteal.lua",
    [16361480410]     = "crs.lua",
    [88658729052139]  = "surfingandslide.lua",
    [89401390681361]  = "coasterandplunge.lua",
    [111575909069166] = "coasterandplunge.lua",
}

local base_url = "https://git.aksiw.dev/scripts/"
local place_id = game.PlaceId

if scripts[place_id] then
    loadstring(game:HttpGet(base_url .. scripts[place_id]))()
else
    loadstring(game:HttpGet("https://raw.githubusercontent.com/DuxiiT/Aether/refs/heads/main/loader.lua"))()
end
