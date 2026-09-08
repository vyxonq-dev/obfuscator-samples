local placeId = game.PlaceId
print("Jumantara Hub: Current Place ID is " .. tostring(placeId))

local games = {
    [101953168527257] = "https://raw.githubusercontent.com/JumaNexus/Hub/refs/heads/main/sp.lua",
    [73510530738011] = "https://raw.githubusercontent.com/JumaNexus/Hub/refs/heads/main/dte.lua",
    [96645548064314] = "https://raw.githubusercontent.com/JumaNexus/Catch-And-Tame/refs/heads/main/main.lua",
    [109008444518106] = "https://raw.githubusercontent.com/JumaNexus/Hub/refs/heads/main/bap.lua",
    [127794225497302] = "https://raw.githubusercontent.com/JumaNexus/Hub/refs/heads/main/abyss.lua",
    [130594398886540] = "https://raw.githubusercontent.com/JumaNexus/Hub/refs/heads/main/gh.lua",
    [115893378298440] = "https://raw.githubusercontent.com/JumaNexus/Hub/refs/heads/main/tf.lua",
    [77747658251236] = "https://raw.githubusercontent.com/JumaNexus/Hub/refs/heads/main/sap.lua",
    [75159314259063] = "https://raw.githubusercontent.com/JumaNexus/Hub/refs/heads/main/sap.lua",
    [138368689293913] = "https://raw.githubusercontent.com/JumaNexus/Hub/refs/heads/main/sap.lua",
    [80943018226476] = "https://raw.githubusercontent.com/JumaNexus/Hub/refs/heads/main/cb.lua",
    [132187971287938] = "https://raw.githubusercontent.com/JumaNexus/Hub/refs/heads/main/pp.lua",
    [81535567274521] = "https://raw.githubusercontent.com/JumaNexus/Hub/refs/heads/main/bg.lua",
    [124473577469410] = "https://raw.githubusercontent.com/JumaNexus/Hub/refs/heads/main/balb.lua",
    [89469502395769] = "https://raw.githubusercontent.com/JumaNexus/Hub/refs/heads/main/kick.lua",
    [120323018058265] = "https://raw.githubusercontent.com/JumaNexus/Hub/refs/heads/main/dumpling.lua",
    [97598239454123] = "https://raw.githubusercontent.com/JumaNexus/Hub/refs/heads/main/gag2.lua",
    [84575720768520] = "https://raw.githubusercontent.com/JumaNexus/Hub/refs/heads/main/lbr.lua",

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
