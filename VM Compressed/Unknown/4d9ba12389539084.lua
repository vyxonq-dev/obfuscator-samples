repeat  task.wait() until game:IsLoaded()
if _G.Executed then return true end _G.Executed = true
local GameLoad = nil
local PlaceId,GameId = game.PlaceId,game.GameId
if GameId ==  7074860883 then
    GameLoad = "AriseC"
end
local var,err = pcall(function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/SKOIXLL/SKYLOLAND/refs/heads/main/" .. GameLoad .. ".lua"))()
end)

if var == false  then
    print("Error : " .. err)
end
