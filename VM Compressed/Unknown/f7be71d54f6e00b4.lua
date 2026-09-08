local scripts = {
    ["127742093697776"] = "https://api.luarmor.net/files/v3/loaders/7d34fe2f272483401d33b9c4ab996709.lua", -- Plants Vs Brainrots
    ["75366259315586"] = "https://api.luarmor.net/files/v3/loaders/e4ee452360a3a43d223e57f61f558aa4.lua", -- build ur base
    ["136801880565837"] = "https://api.luarmor.net/files/v3/loaders/16e3828258df677b71fd8ae5ef76b6c8.lua", -- flick
}

local game_place_id = tostring(game.PlaceId)

for id, script_link in pairs(scripts) do
    if id == game_place_id then
        loadstring(game:HttpGet(script_link))() -- start up the script
        break
    end
end
