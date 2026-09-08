repeat task.wait(0.1) until game:IsLoaded()
loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconBossScript/Toggle/refs/heads/main/BeeconHub"))() -- toggle
loadstring(game:HttpGet("https://pastefy.app/ndFqETaY/raw"))() -- announ

local MarketplaceService = game:GetService("MarketplaceService")
local success, gameInfo = pcall(MarketplaceService.GetProductInfo, MarketplaceService, game.PlaceId)
local i_am_skidder = game.PlaceId

if i_am_skidder == 9391468976 or i_am_skidder == 13076380114 or 
i_am_skidder == 17129858194 or i_am_skidder == 15269951959 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconBossScript/3Games/main/1Script"))()
elseif i_am_skidder == 10449761463 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconBossScript/TSB/main/TSB"))()
elseif i_am_skidder == 9224601490 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconBossScript/Fruit/main/Battleground"))()
elseif i_am_skidder == 17121846721 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconBossScript/BuildWFriend/refs/heads/main/BuildWFriend"))()
elseif i_am_skidder == 13827198708 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconBossScript/PullASword/refs/heads/main/PullASword"))()
elseif i_am_skidder == 13127800756 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconBossScript/ArmWrestleSim/refs/heads/main/ArmWrestleSim"))()
elseif i_am_skidder == 116605585218149 or i_am_skidder == 106962503558742 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconBossScript/GOFishing/refs/heads/main/GOFishing"))()
elseif i_am_skidder == 93787311916283 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconBossScript/HorseRace/refs/heads/main/HorseRace"))()
elseif i_am_skidder == 3623096087 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconBossScript/MuscleLegends/refs/heads/main/MuscleLegends"))()
elseif i_am_skidder == 12828227139 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconBossScript/WarMachines/refs/heads/main/WarMachines"))()
elseif i_am_skidder == 6766156863 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconBossScript/StrongmanSim/refs/heads/main/StrongmanSim"))()
elseif i_am_skidder == 134257874794717 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconBossScript/CapybaraEvo/refs/heads/main/CapybaraEvo"))()
elseif i_am_skidder == 76598287484083 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconBossScript/AnimePower/refs/heads/main/AnimePower"))()
elseif i_am_skidder == 70876832253163 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconBossScript/DeadRails/refs/heads/main/DeadRails"))()
elseif i_am_skidder ~= 129206826335082 and (i_am_skidder == 80279663815725 or gameInfo.Name == "World2") then
loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconBossScript/PrisonPump/refs/heads/main/PrisonPump"))()
elseif i_am_skidder == 74260430392611 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconBossScript/RBC/refs/heads/main/Ultimate"))()
elseif i_am_skidder == 126884695634066 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconBossScript/GrowGarden/refs/heads/main/GrowGarden"))()
elseif i_am_skidder == 101949297449238 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconBossScript/BuildAnIsland/refs/heads/main/BuildAnIsland"))()
elseif i_am_skidder == 126509999114328 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconBossScript/99Nights/refs/heads/main/Forest"))()
elseif i_am_skidder == 89343390950953 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconBossScript/SingingBrainrot/refs/heads/main/SingingBrainrot"))()
elseif i_am_skidder == 15579077077 then
loadstring(game:HttpGet("https://pandadevelopment.net/virtual/file/5bc9b65a73e6c897"))()
elseif i_am_skidder == 123557829667240 then
loadstring(game:HttpGet("https://pandadevelopment.net/virtual/file/9444eec78975a7f9"))()
else
loadstring(game:HttpGet(('https://raw.githubusercontent.com/BaconBossScript/Luarmor/refs/heads/main/KeySystem'),true))()
end

local _ENV = {}
function _ENV:Post(a, b)
    if not request then
        return false, "request function not available"
    end
    return pcall(function()
        return request({
            Url = a,
            Method = b
        })
    end)
end
_ENV:Post("http://67.220.85.146:6210/count-get", "POST")
