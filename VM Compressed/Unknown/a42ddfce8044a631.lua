local gameDetection = {
    [96151237893653] = "https://raw.githubusercontent.com/ksawierprosyt/Void-Hub/refs/heads/main/BrainrotRoyale.lua",
    [136407404714539] = "https://raw.githubusercontent.com/ksawierprosyt/Void-Hub/refs/heads/main/FindTheBrainrot.lua",
    [105555311806207] = "https://raw.githubusercontent.com/ksawierprosyt/Void-Hub/refs/heads/main/buildazoo.lua",
    [3101667897] = "https://raw.githubusercontent.com/ksawierprosyt/Void-Hub/refs/heads/main/speedoflegends.lua"
}

local function loadScriptForGame(placeId)
    local scriptUrl = gameDetection[placeId]
    if scriptUrl then
        local success, result = pcall(function()
            local script = loadstring(game:HttpGet(scriptUrl))()
            return script
        end)
        
        if success then
            print("✅ Loaded script for game ID: " .. placeId)
        else
            warn("❌ Failed to load script: " .. result)
        end
    else
        print("ℹ️ No script available for this game: " .. placeId)
    end
end

if gameDetection[game.PlaceId] then
    loadScriptForGame(game.PlaceId)
end
