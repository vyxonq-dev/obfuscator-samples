local placeId = game.PlaceId
print("Jumantara Hub: Current Place ID is " .. tostring(placeId))

local games = {
    [101953168527257] = "https://raw.githubusercontent.com/JumaNexus/Spear-Fishing/refs/heads/main/main.lua",
    [73510530738011] = "https://raw.githubusercontent.com/JumaNexus/Hub/refs/heads/main/dte.lua",
    [96645548064314] = "https://raw.githubusercontent.com/JumaNexus/Catch-And-Tame/refs/heads/main/main.lua",
    [109008444518106] = "https://raw.githubusercontent.com/JumaNexus/Hub/refs/heads/main/bap.lua",
}

if games[placeId] then
    print("Jumantara Hub: Game detected! Loading script...")

    local success, result = pcall(function()
        return loadstring(game:HttpGet(games[placeId]))()
    end)

    if success then
        print("Jumantara Hub: Script executed successfully.")
    else
        warn("Jumantara Hub: Failed to execute script: " .. tostring(result))
    end
else
    warn("Jumantara Hub: Game ID (" .. tostring(placeId) .. ") is not supported.")
end
