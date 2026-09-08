if game.PlaceId == 2414851778 then
loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/bbdb0a51ab124453df69ce462a022eb7e2e2c579d1ecfbaf1990b2ba859f19d0/download"))() -- dungeon quest
elseif game.PlaceId == 74747090658891 or game.PlaceId == 14890802310 then
loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/1c08b2f387a61af3eeb96db41115547dda26abcabbdc01f494500cde03dd50a4/download"))() -- bizarre lineage
elseif game.PlaceId == 6735572261 then
loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/7b11cbb9d5313269871a027e22d00606d708ccb51dafb62cace0c6965293627e/download"))() -- pilgrammed
elseif game.PlaceId == 292439477 then
loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/fd0154f00cc84bba7d04487ab03c20969325456843fe1078f9a47ff5068e78cb/download"))() -- phantom forces
elseif game.PlaceId == 142823291 then
loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/4683678b7839d697ed920bad80bf67afc193cff337fa7f82a0e3f57ff16c31bf/download"))() -- mm2
elseif game.PlaceId ~= 2414851778 and game.ReplicatedStorage:FindFirstChild("dataRemoteEvent") then
loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/bbdb0a51ab124453df69ce462a022eb7e2e2c579d1ecfbaf1990b2ba859f19d0/download"))() -- dungeon quest
end
