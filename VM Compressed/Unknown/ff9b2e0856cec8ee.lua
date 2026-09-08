local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/Library.lua"))()

local games = "https://raw.githubusercontent.com/kylosilly/Astolfo-Ware-V2/main/Games"

local local_player = cloneref(game:GetService("Players").LocalPlayer)
local market = cloneref(game:GetService("MarketplaceService"))
local info = market:GetProductInfo(game.PlaceId)

function check_supported()
    local success, result = pcall(function()
        return game:HttpGet(games.."/"..game.PlaceId..".lua")
    end)
    if not success or result == "404: Not Found" then
        library:Notify("Unsupported Game: "..info.Name.." If You Want It Supported Join The Discord Copied To Your Clipboard")
        setclipboard("https://discord.gg/SUTpER4dNc")
    end
end

if getthreadcontext() > 7 then
    print("Executor Supported")
else
    local_player:Kick(identifyexecutor().." Is Not Supported You Are Not Banned This Is Just A Kick Message Because Your Executor Is Not Supported")
end

if game.GameId == 7546582051 and not game.PlaceId == 94845773826960 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/kylosilly/Astolfo-Ware-V2/refs/heads/main/Games/dungeon%20heroes.lua"))()
    library:Notify("Supported Game Loading: "..info.Name)
    return
end

check_supported()

loadstring(game:HttpGet(games.."/"..game.PlaceId..".lua"))()
library:Notify("Supported Game Loading: "..info.Name)
