local Games = {
    ["2633076999"] = "DemonPiece",
    ["380704901"] = "Roghoul",
    ["4777817887"] = "BladeBall",
    ["648454481"] = "GrandPieceOnline",
    ["5638211721"] = "AnimeRoyale",
    ["5578556129"] = "AnimeVanguards",
    ["1359573625"] = "Deepwoken",
    ["1016936714"] = "YBA",
}

local function LoadGame(GameId)
    local GameName = Games[tostring(GameId)]
    if GameName then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TrapstarKS/Signal/refs/heads/main/Games/"..GameName..".lua"))()
    else
        warn("Game not supported")
    end
end

LoadGame(game.GameId)
