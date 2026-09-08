local BaseURL = "https://raw.githubusercontent.com/deproxies/Main/refs/heads/main/"

local Loadstrings = {
    [119987266683883] = BaseURL .. "Brainrotshit.lua",
}

for place, url in Loadstrings do
    if place == game.PlaceId then
        loadstring(game:HttpGet(url))()
    else
        loadstring(game:HttpGet("https://raw.githubusercontent.com/deproxies/Main/refs/heads/main/UniversalAimbot.lua"))()
    end
end
