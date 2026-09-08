repeat task.wait() until game:IsLoaded()

local executorname = "Unknown"
if getexecutorname then
    executorname = getexecutorname()
elseif identifyexecutor then
    executorname = identifyexecutor()
end

local FAKE_EXECUTOR = {  }

for i,v in pairs(FAKE_EXECUTOR) do
    if executorname:lower():find(v) then
        game.Players.LocalPlayer:Kick("\n\n" .. executorname .. " is not supported")
        return
    end
end

local GameId = game.GameId

local GameList = {
    [994732206] = "Blox%20Fruits/Loader.lua",
    [6765805766] = "Block%20Spin/Loader.lua",
    [9186719164] = "Sailor%20Piece/Default.lua",
    [10200395747] = "Grow%20a%20Garden%202/Loader.lua"
}

loadstring(game:HttpGet(("https://raw.githubusercontent.com/xQuartyx/QuartyzScript/main/%s"):format(GameList[GameId])))()
