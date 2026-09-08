local placeId = game.PlaceId

-- Grouped AstralHub IDs
local astralHubOutdoorsIds = {
    [6839171747] = true,
    [6516141723] = true,
}

if placeId == 79546208627805 or placeId == 126509999114328 then
    print("Loading AstralHub99NightsInAForest script...")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/PlayzlxD0tmatter/AstralHub99NightsInAForest/refs/heads/main/AstralHub99NightsInAForest"))()
elseif astralHubOutdoorsIds[placeId] then
    print("Loading AstralHub Doors Outdoors script...")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/PlayzlxD0tmatter/AstralHubDoorsScript/refs/heads/main/AstralHubDoorsOutdoorsScript"))()
elseif placeId == 137925884276740 then
    print("Loading Build a plane script...")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/PlayzlxD0tmatter/Build-a-Plane-Astral-Hub/refs/heads/main/AstralHubBuildAPlane"))()
elseif placeId == 109983668079237 or placeId == 96342491571673 then
    print("Loading AstralHub Steal A Brainrot script...")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/PlayzlxD0tmatter/AstralHubStealABrainrot/main/AstralHubStealABrainrot"))()
elseif placeId == 121864768012064 or placeId == 121864768012064 then
    print("Loading AstralHub fish it script...")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/PlayzlxD0tmatter/FishitAstralHub/refs/heads/main/FishItAstralHub"))()
else
    print("No script available for this game:", placeId)

 
    print("Loading HuntyZombie Astral Hub script...")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/PlayzlxD0tmatter/HuntyZombie/refs/heads/main/HuntyZombieAstralHubScript"))()
end
