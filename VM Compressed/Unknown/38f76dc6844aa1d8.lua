local local_player = game:GetService("Players").LocalPlayer
local script_key = script_key

if (identifyexecutor() == "Solara") or (not (getthreadcontext())) or (getthreadcontext() < 7) then
    return local_player:Kick("Unsupported executor")
end

local game_loaders = {
    [8316902627] = "3f57e7d8d23e770e9de3f6624b50e1ec",
    [7709344486] = "7fa73f918f9352a3b3761e15bdd0beb3",
    [7094518649] = "1eb1b77d19b3a82b751354350cc2774a",
    [8353463684] = "6c0417378339dbc42de1d4c8b907deb4",
    [7326934954] = "afdc0c73cac49d98e8e76723145194fb",
    [1709917610] = "56fceedfaeca2e6df4bf15147060bb8c"
}

function load_script()
    local game_id_loader = game_loaders[game.GameId]

    if (not game_id_loader) then
        setclipboard("https://discord.gg/zrEef4CnTS")
        local_player:Kick(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name ..
            " is not supported! If you want it supported join the discord copied to your clipboard!")
        return
    end

    local success, err = pcall(function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/" .. game_id_loader .. ".lua"))()
    end)
end

load_script()

queue_on_teleport(function()
    load_script()
end)
