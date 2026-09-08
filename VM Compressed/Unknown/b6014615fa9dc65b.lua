local base = "https://raw.githubusercontent.com/Breadido/Codecoat/main/"
local uh = {
    [606849621] = "games/rewrite.luau",
    [17190407811] = "games/rewrite.luau",
    [17516596118] = "games/hypershot.lua"
}
local file = uh[game.PlaceId]
local ok, huh = pcall(function()
    return loadstring(game:HttpGet(base..file))()
end)
if ok then
    print("[Codecoat] Loaded:", file)
else
    warn("[Codecoat] Failed:", huh)
end
