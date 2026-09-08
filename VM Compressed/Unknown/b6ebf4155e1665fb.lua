--!nocheck
-- wsp

while not game:IsLoaded() do task.wait() end
local GameId = game.GameId

local Scripts = {
    [GameId == 9271746647] = {Name = "JAB hub", Script = [[_G.ScriptKey = "";loadstring(game:HttpGet("https://auth.syscure.vip/obf/e63d3241f799994e0ad1a0d1bd4e8084.lua"))()]]},
    [table.find({6726637224, 9709623874, 7686378055}, GameId) ~= nil] = {Name = "Lithium", Script = [[loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/e77a032a8e142db493c086baffc47f02.lua"))()]]}
}
local Data = Scripts[true]
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "veser.vip",
    Text = Data and string.format("loading \"%s\"!", Data.Name) or "game not supported!",
    Duration = 10
})
loadstring(Data and Data.Script or "")()