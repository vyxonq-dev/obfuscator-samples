_G.DebugScript = true
local ScriptLoadHSz = nil
local PlaceId_ACS = {14433762945,14551143850} --Anime Champions Simulator
local PlaceId_AA = {8304191830,8349889591,10098525303,14229762361,14229839966,14918509670} --Anime Adventures
local PlaceId_ADS = {6938803436,7274690025,7338881230,6990133340,6990129309,6990131029} --Anime Dimensions simulator
local PlaceId_ALS = {12900046592,18583778121,14368918515,12886143095,14368918515} --Anime Last Stand
local PlaceId_ADF = {12135640403,15502802192,15502802094} --Anime Dungeon Fighters 
local PlaceId_SB3 = {14819493140,14819490378,15695929915,11523257493,16468939104,16582687738,17856910664,16928265611,17206024999,18147617256} --Swordburst 3
local PlaceId_GE = {14115013144,15910166475,16367837244} --Grimoires Era
local PlaceId_CTD = {12317373094,14457745436} --Champions TD
local PlaceId_AF = {16474126979,16632969817,16722699358,16731548538,17186294741,17186401535,17186452177,17242022433,17256748686,17263479249,17290293441} --Anime Fantasy
local PlaceId_ACD = {17399149936,17399170300} --Anime-Crossover-Defense
local PlaceId_AD = {18943393200,17764698696,17017769292,17018663967,17633071278,17078425946,17456575820,17490500437,17513685680,17620826119} --Anime-Defenders
local PlaceId_ARB = {72761785039317,17046374415,18681560853,18784000534,114706988516358,132521906070053,18846300003,108408425375836,17895369021
,17895401292,17896914622,112065128804050,96158374524375,71323911886796,124019964861837,135343551212174} --Anime-Reborn

if table.find(PlaceId_AF,game.PlaceId) then
	ScriptLoadHSz = "HSz_AF"
else
	ScriptLoadHSz = "HSz_AF"
end

if table.find(PlaceId_AD,game.PlaceId) then
	ScriptLoadHSz = "HSz_AD"
elseif table.find(PlaceId_ARB,game.PlaceId) then
	ScriptLoadHSz = "HSz_ARB"
elseif table.find(PlaceId_ALS,game.PlaceId) then
	ScriptLoadHSz = "HSz_ALS"
elseif table.find(PlaceId_AA,game.PlaceId) then
    ScriptLoadHSz = "HSz_AA"
elseif table.find(PlaceId_ACS,game.PlaceId) then
    ScriptLoadHSz = "HSz_ACS"
elseif table.find(PlaceId_ADS,game.PlaceId) then
	ScriptLoadHSz = "HSz_ADS"
elseif table.find(PlaceId_ADF,game.PlaceId) then
	ScriptLoadHSz = "HSz_ADF"
elseif table.find(PlaceId_SB3,game.PlaceId) then
	ScriptLoadHSz = "HSz_SB3"
elseif table.find(PlaceId_GE,game.PlaceId) then
	ScriptLoadHSz = "HSz_GE"
elseif table.find(PlaceId_CTD,game.PlaceId) then
	ScriptLoadHSz = "HSz_CTD"
elseif table.find(PlaceId_ACD,game.PlaceId) then
	ScriptLoadHSz = "HSz_ACD"
end

local hsz,err = pcall(function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/siradaniy/Script_HSz/main/" .. ScriptLoadHSz .. ".lua"))()
end)

if hsz == false then
    print("Error : " .. err)
end
