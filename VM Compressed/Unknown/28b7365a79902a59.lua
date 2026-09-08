local LatestRoom = game.ReplicatedStorage.GameData.LatestRoom

LatestRoom.Changed:Once(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Particulate%20Mode%20Main"))()
end)

-- ======================
-- SETTINGS 
-- ======================
loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Tags.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Mixed%20Mode%20Settings/SeekOld.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Mixed%20Mode%20Settings/Atmosphere.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Mixed%20Mode%20Settings/Custom%20BulbZap.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Mixed%20Mode%20Settings/Change%20Eyes%20texture.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Mixed%20Mode%20Settings/Custom%20Door.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Mixed%20Mode%20Settings/Custom%20Sounds.lua"))()
-- ======================
-- SPRINT
-- ======================
loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Sprint.lua"))()

-- UPDATE LOGS
-- ======================
loadstring(game:HttpGet("https://raw.githubusercontent.com/Timofey2339/Depth-doors-model/refs/heads/main/Update%20log.lua"))()
