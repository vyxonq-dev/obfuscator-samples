-- local script_mode = "PVP" -- PVP, FARM
local scripts = {
    [6765805766] = { -- Block Spin
        PVP  = "https://api.luarmor.net/files/v3/loaders/f35c34bae1acf8c1422df5214310b8eb.lua",
        FARM = "https://api.luarmor.net/files/v3/loaders/32b520fd3ef340a3c6f701b6edf48e55.lua",
    },
    [994732206] = { -- Blox Fruits
        PVP = "https://api.luarmor.net/files/v3/loaders/341aeb3eaa42e6423a4cdbf2b148e77f.lua",
    }
}

local cfg = scripts[game.GameId]
if not cfg then
    game:GetService("Players").LocalPlayer:Kick("Game not supported")
    return
end

loadstring(game:HttpGet(cfg[(script_mode or "PVP"):upper()] or cfg.PVP))()
