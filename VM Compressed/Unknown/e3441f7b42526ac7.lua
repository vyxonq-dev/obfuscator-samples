local placeId = game.GameId

local scripts = {
    [3317771874] = "loadstring(game:HttpGet('https://api.luarmor.net/files/v3/loaders/1407235825fa14ab7357f743b1f3b4f1.lua'))()", -- PS99
    [6401952734] = "loadstring(game:HttpGet('https://api.luarmor.net/files/v3/loaders/cd2895d16f1bda4970eb2429e4f79266.lua'))()", -- PETSGO
    [8316902627] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/HitAMassy/AnonymousHub/refs/heads/main/PlantsVsBrainrots.lua'))()", -- Plants vs Brainrots
    [5750914919] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/HitAMassy/AnonymousHub/refs/heads/main/Fisch.lua'))()", -- Fisch
    [4793836769] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/HitAMassy/AnonymousHub/refs/heads/main/MidnightChasers.lua'))()", -- Midnight Chasers
    [9277195104] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/HitAMassy/AnonymousHub/refs/heads/main/BlindShot'))()", -- Blind Shot
}

if scripts[placeId] then
    local func, err = loadstring(scripts[placeId])
    if func then
        func()
    else
        warn("Error loading script, Please screenshot your console and send to a developer: " .. placeId .. ": " .. tostring(err))
    end
else
    warn("Game not supported: " .. placeId)
end
