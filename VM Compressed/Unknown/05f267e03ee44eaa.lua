local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Games = 
{
    [537413528] = "BABFT.lua",
    [7655745946] = "DunkSimulator.lua",
    [17738127017] = "Brace.lua",
    [1828509885] = "EFS.lua",
    [16732694052] = "Fisch.lua",
    [10925589760] = "MergeSimulator.lua",
    [1537690962] = "BSS.lua",
    [7671049560] = "TheForge.lua"
}

local placeID = game.PlaceId

local associated = Games[placeID] or Games[game.GameId]

local MarketplaceService = game:GetService("MarketplaceService")
local gameName = MarketplaceService:GetProductInfo(game.PlaceId).Name

if not associated then
    Fluent:Notify(
    {
        Title = "GAME NOT SUPPORTED",
        Content = gameName .. " Is Not Supported By Tofi Hub",
        Duration = 15
    })

end

local function loadScript() : ()

    if associated then

        loadstring(game:HttpGet("https://raw.githubusercontent.com/Tofi-Hub/Tofi-Hub/refs/heads/main/"..associated))()
        Fluent:Notify(
        {
        Title = "Loading Script",
        Content = "Loading Script For " .. gameName,
        Duration = 10
        })

    else


        Fluent:Notify(
        {
        Title = "GAME NOT SUPPORTED",
        Content = gameName .. " Is Not Supported By Tofi Hub",
        Duration = 15
        })

    end
end

local reqFunc = request or http_request

local data = {["game_name"] = gameName , ["player_username"] = game.Players.LocalPlayer.Name , ["executed"] = true}

local response = reqFunc({
    Url = "https://tofi-hub-worker.dandushyt.workers.dev/getkey",
    Method = "POST",
    Headers = {["Content-Type"] = "application/json"},
    Body = game:GetService("HttpService"):JSONEncode(data),
})


loadScript()
