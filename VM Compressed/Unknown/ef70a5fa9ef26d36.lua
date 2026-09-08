local Games = {
    [7468338447] = "https://raw.githubusercontent.com/qturkieh-pixel/Killer-hub/refs/heads/main/dtec%20updated.lua",
    [8316902627] = "https://raw.githubusercontent.com/qturkieh-pixel/Killer-hub/refs/heads/main/plants%20vs%20brainrots.lua",
    [3808081382] = "https://raw.githubusercontent.com/qturkieh-pixel/Killer-hub/refs/heads/main/tsb.lua",
    [6161049307] = "https://raw.githubusercontent.com/qturkieh-pixel/Killer-hub/refs/heads/main/pixel%20blade.lua",
    [4908792642] = "https://raw.githubusercontent.com/qturkieh-pixel/Killer-hub/refs/heads/main/obby%20but%20your%20on%20a%20bike.lua",
    [4793836769] = "https://raw.githubusercontent.com/qturkieh-pixel/Killer-hub/refs/heads/main/midnight%20chasers.lua",
    [1335695570] = "https://raw.githubusercontent.com/qturkieh-pixel/Killer-hub/refs/heads/main/ninja%20legends.lua",
    [8330910875] = "https://raw.githubusercontent.com/qturkieh-pixel/Killer-hub/refs/heads/main/beat%20up%20gubby.lua",
}

local ScriptUrl = Games[game.GameId]
if not ScriptUrl then
    warn("Game not supported.")
    return
end
loadstring(game:HttpGet(ScriptUrl))()
