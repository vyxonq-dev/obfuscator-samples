local ProjectId = "692b3b3aca748f6fb3bbb573"
local Scripts = {
    [184199275] = "https://cdn.snc.dev/692b3b3aca748f6fb3bbb573/l0e5on9m1k",
    [8558141897] = "https://cdn.snc.dev/692b3b3aca748f6fb3bbb573/co0nvgo7wh7",
    [4931927012] = "https://cdn.snc.dev/692b3b3aca748f6fb3bbb573/gjmihl4pm4d",
}

local Script = Scripts[game.GameId]
if Script then
    loadstring(game:HttpGet(Script))()
else
    -- For the user to decide
end
