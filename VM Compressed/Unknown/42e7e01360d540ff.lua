local BASE_URL = "https://cortax.cc/files/%s.lua"

local PLACE_SCRIPTS = {
    [7971857341]      = "7971857341",
    [3101667897]      = "3101667897",
    [3232996272]      = "3101667897",
    [3276265788]      = "3101667897",
    [1240123653]      = "1240123653",
    [1632210982]      = "1240123653",
    [92589365151083]  = "92589365151083",
    [127822680964493] = "127822680964493",
    [82031770257269]  = "82031770257269",
    [78458398895753]  = "78458398895753",
    [133368452064522] = "133368452064522"
}

getgenv().Version = "2.3.1-hotfix"
getgenv().Date = "April 20th, 2026"

local scriptName = PLACE_SCRIPTS[game.PlaceId]
if scriptName then
    local ok, err = pcall(function()
        getgenv().CortaxNotify:Send("Cortax.cc", "Game supported!", 5)
        task.wait(2)
        loadstring(game:HttpGet(string.format(BASE_URL, scriptName)))()
    end)
    if not ok then
        getgenv().CortaxNotify:Send("Cortax.cc", "Error loading Cortax. Contact Staff!", 5)
        task.wait(1)
        getgenv().CortaxNotify:Send("Cortax.cc", "Detailed Error: " .. tostring(err), 5)
    end
else
    getgenv().CortaxNotify:Send("Cortax.cc", "Game not supported!", 5)
end