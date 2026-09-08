-- ZenoMozHub Loader
local SupportedGames = {
    12355337193, ---add more if you want also by zeno moz hub
}

local function isSupported(id)
    for _, v in ipairs(SupportedGames) do
        if v == id then
            return true
        end
    end
    return false
end

if isSupported(game.PlaceId) then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ZenoMozHubOfficial/Scripts/refs/heads/main/ToolBox"))()
else
    warn("Game not supported.")
end
