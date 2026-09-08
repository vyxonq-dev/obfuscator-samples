local placeId = game.PlaceId
print("Jxckyz Hub: Current Place ID is " .. tostring(placeId))
local games = {
    [18870629243] = "https://raw.githubusercontent.com/rxinoussouls/Jxckyz/refs/heads/main/LP",
    [103311003648859] = "https://raw.githubusercontent.com/rxinoussouls/Jxckyz/refs/heads/main/LBG",
}
if games[placeId] then
    print("Jxckyz Hub: Game detected! Loading script...")
    local success, result = pcall(function()
        return loadstring(game:HttpGet(games[placeId]))()
    end)
    if success then
        print("Jxckyz Hub: Script executed successfully.")
    else
        warn("Jxckyz Hub: Failed to execute script: " .. tostring(result))
    end
else
    warn("Jxckyz Hub: Game ID (" .. tostring(placeId) .. ") is not supported.")
end
