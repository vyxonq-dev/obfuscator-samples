if not game:IsLoaded() then
    game.Loaded:Wait()
    task.wait(1)
end
local LogsGameExecute = "https://raw.githubusercontent.com/IsThisMe01/Project-Madara/refs/heads/main/logsGameName.lua" -- this DOESNT log any hwid, user name or anything. this just logs your excute and game name that you ran my script  on. if you want proof then i am willing to give.
local ListURl = "https://raw.githubusercontent.com/IsThisMe01/Project-Madara/refs/heads/main/Game_List.lua"
local logs = loadstring(game:HttpGet(LogsGameExecute))()
local games = loadstring(game:HttpGet(ListURl))()

local success, errorMsg = pcall(function()
    for placeId, scriptUrl in pairs(games) do
        if game.PlaceId == placeId then
            loadstring(game:HttpGet(scriptUrl))()
        end
    end
end)

if not success then
    warn(errorMsg)
end
