local placeId = game.PlaceId
print("Prism Hub: Current Place ID is " .. tostring(placeId))

local games = {
    [77747658251236] = "https://raw.githubusercontent.com/Venoxexec/Prism-Hub/refs/heads/main/SP",
    [11379739543] = "https://raw.githubusercontent.com/Venoxexec/Prism-Hub/refs/heads/main/TBD",
    [88728410943211] = "https://raw.githubusercontent.com/Venoxexec/Prism-Hub/refs/heads/main/SI"
}

if games[placeId] then
    print("Prism Hub: Game detected! Loading script...")

    local success, result = pcall(function()
        return loadstring(game:HttpGet(games[placeId]))()
    end)

    if success then
        print("Prism Hub: Script executed successfully.")
    else
        warn("Prism Hub: Failed to execute script: " .. tostring(result))
    end
else
    warn("Prism Hub: Game ID (" .. tostring(placeId) .. ") is not supported.")
end
