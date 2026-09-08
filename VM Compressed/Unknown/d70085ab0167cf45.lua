-- Feel free to use this loader source 🐾 <3
local lib = loadstring(game:HttpGet('https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/Library.lua'))()
loadstring(game:HttpGet('https://raw.githubusercontent.com/kylosilly/astolfoware/refs/heads/main/scripts/ChatTag.lua'))()

local scripts = 'https://raw.githubusercontent.com/kylosilly/astolfoware/main/scripts/'

local lplr = game:GetService("Players").LocalPlayer
local market = game:GetService("MarketplaceService")
local info = market:GetProductInfo(game.PlaceId)
local place_id = game.PlaceId

if identifyexecutor() then
    local executor = identifyexecutor()
    if executor == "Solara" or executor == "Xeno" or executor == "Nezur" or executor == "JJSploit" then
        lplr:Kick("Unsupported executor: " .. executor .. " Please use atlantis or a diffirent executor copied invite to your clipboard")
        setclipboard("https://discord.gg/KRkqCJjFG4")
    end
end

if place_id == 263761432 then
    loadstring(game:HttpGet(scripts.."Horrific%20Housing.lua"))()
    lib:Notify('Supported game loading: ' .. info.Name)
elseif place_id == 8267733039 then
    loadstring(game:HttpGet(scripts.."SpecterLobby.lua"))()
    lib:Notify('Supported game loading: ' .. info.Name)
elseif info.Name == "SPECTER Classic [AI]" then
    loadstring(game:HttpGet(scripts.."Specter.lua"))()
    lib:Notify('Supported game loading: ' .. info.Name)
elseif place_id == 14056802186 then
    loadstring(game:HttpGet(scripts.."SpecterTrading.lua"))()
    lib:Notify('Supported game loading: ' .. info.Name)
elseif place_id == 85896571713843 then
    loadstring(game:HttpGet(scripts.."bgsi.lua"))()
    lib:Notify('Supported game loading: ' .. info.Name)
elseif place_id == 81319028163805 then
    loadstring(game:HttpGet(scripts.."mining%20world.lua"))()
    lib:Notify('Supported game loading: ' .. info.Name)
elseif place_id == 87700573492940 then
    loadstring(game:HttpGet(scripts.."untitled%20drill%20game.lua"))()
    lib:Notify('Supported game loading: ' .. info.Name)
elseif place_id == 126884695634066 then
    loadstring(game:HttpGet(scripts.."grow%20a%20garden.lua"))()
    lib:Notify('Supported game loading: ' .. info.Name)
else
    lib:Notify('Game not supported: ' .. info.Name .. ' if you wanna support this game join the discord copied to your clipboard')
    setclipboard("https://discord.gg/U5yjDvsxHR")
end
