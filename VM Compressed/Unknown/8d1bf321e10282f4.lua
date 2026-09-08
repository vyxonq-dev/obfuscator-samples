local BaseURL = "https://deproxware.cc/"

local Loadstrings = {
    [119987266683883] = BaseURL .. "Brainrotshit.lua",
}

for place, url in Loadstrings do
    if place == game.PlaceId then
        loadstring(game:HttpGet(url))()
    else
        loadstring(game:HttpGet(BaseURL .. "UniversalAimbot.lua"))()
    end
end