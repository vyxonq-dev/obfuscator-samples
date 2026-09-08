repeat task.wait() until game:IsLoaded()

local Supported_Games = {
    ["https://api.jnkie.com/api/v1/luascripts/public/fd4ffb80c5bd243f73a7e6962bbed5ac0ba2c44657892dc14e3abcda54c7e624/download"] = {9476339275,12529881925}, -- Double Down
    ["https://api.jnkie.com/api/v1/luascripts/public/f126b12c3ea427a9663d6eb469a2f6866c780d7bf9e4d032850c97e4551a2e68/download"] = {71706515477118}, -- +1 Jump Evolve Tower
    ["https://api.jnkie.com/api/v1/luascripts/public/8d41c17193abb3d20347abeb838ca6459ed0be71acb1bafb8378be6512270afd/download"] = {89469502395769}, -- Kick A Lucky Block
    ["https://api.jnkie.com/api/v1/luascripts/public/09af80ad2dfcde3984f8b7f74bd36ca0621b84b53fa9545928728015aa47aab6/download"] = {128784467030899}, -- Merge A Nuke!
}
for i,v in pairs(Supported_Games) do if table.find(v,game.PlaceId) then loadstring(game:HttpGet(i))() end end
