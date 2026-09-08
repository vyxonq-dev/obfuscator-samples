--[[
███╗   ██╗ ██╗██╗  ██╗    ██╗  ██╗██╗   ██╗██████╗ 
████╗  ██║███║╚██╗██╔╝    ██║  ██║██║   ██║██╔══██╗
██╔██╗ ██║╚██║ ╚███╔╝     ███████║██║   ██║██████╔╝
██║╚██╗██║ ██║ ██╔██╗     ██╔══██║██║   ██║██╔══██╗
██║ ╚████║ ██║██╔╝ ██╗    ██║  ██║╚██████╔╝██████╔╝
╚═╝  ╚═══╝ ╚═╝╚═╝  ╚═╝    ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ 
]]

repeat wait() until game:IsLoaded()

local id = game.PlaceId
local button = "https://raw.githubusercontent.com/N1X-HUB/Script/refs/heads/main/files/other/button.luau"

local arquivos = {
    [127742093697776] = "PlantsVsBrainrots",
    [96342491571673] = "StealABrainrot",
    [109983668079237] = "StealABrainrot",
}

if arquivos[id] then
    print("loading: "..arquivos[id])
    loadstring(game:HttpGet(button))()
    wait()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/N1X-HUB/Script/refs/heads/main/files/v2/"..arquivos[id]..".luau"))()
else
    --local lb = loadstring(game:HttpGet("https://pastebin.com/raw/Q1RaSFEN"))() -- thx tiothemonster3 (scriptblox)
    --lb:CreateNotification("Game Not Supported "..id, "Jogo nao supportado, entre no dsc.gg/n1x-hub para ver a lista.")
    print("loading: universal")
    loadstring(game:HttpGet(button))()
    wait()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/N1X-HUB/Script/refs/heads/main/files/v2/all.luau"))()
end
