local base = "https://raw.githubusercontent.com/Breadido/Codecoat/main/"
local uh = {
    [606849621] = "games/rewrite.luau",
    [17190407811] = "games/rewrite.luau",
    [17516596118] = "games/hypershot.lua",
    [77843161404023] = "games/runarestaurant.luau",
}
local file = uh[game.PlaceId]
local ok, huh = pcall(function()
    return loadstring(game:HttpGet(base..file))()
end)
if ok then
    print("[Codecoat] Loaded:", file)
else
    game:GetService("Players").LocalPlayer:Kick(huh)
end
