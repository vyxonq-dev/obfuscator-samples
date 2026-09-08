if not game:IsLoaded() then
    game.Loaded:Wait()
end

local lib = loadstring(game:HttpGet('https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/Library.lua'))()

local PlaceId = game.PlaceId
local lplr = game:GetService("Players").LocalPlayer
local market = game:GetService("MarketplaceService")
local info = market:GetProductInfo(PlaceId)
local games = {
    [136801880565837] = 'https://raw.githubusercontent.com/GGXD99/XcxHub/refs/heads/main/script/Flick/Flick.lua', -- Flick Game
    [76668493349114] = 'https://raw.githubusercontent.com/GGXD99/XcxHub/refs/heads/main/script/SniperorDie/main.lua', -- SNIPE-OR-DIE
    [2474168535] = 'https://raw.githubusercontent.com/GGXD99/XcxHub/refs/heads/main/script/Westbound/script.lua', -- Westbound
    [84988808589910] = 'https://raw.githubusercontent.com/GGXD99/XcxHub/refs/heads/main/script/Rogue-Piece/SCRIPT.lua', -- Rogue Piece
    [8735521924] = 'https://raw.githubusercontent.com/GGXD99/XcxHub/refs/heads/main/script/CENTAURA/Ui.lua', -- CENTAURA
    [2753915549] = 'https://raw.githubusercontent.com/GGXD99/XcxHub/refs/heads/main/script/Blox-Fruit/AutoFarmChar.lua', -- BLox Fruit Chest Fram
}

if games[PlaceId] then 
    lib:Notify('Supported game loading: ' .. info.Name)
    loadstring(game:HttpGet(games[PlaceId]))()
else
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Kaguya11/KaguHubRework/main/KaguHub.lua"))()
    setclipboard("https://discord.gg/AkWWsyw2eG")
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Kagu Hub",
        Text = "Game not supported: " .. info.Name,
        Duration = 5
    })
end
