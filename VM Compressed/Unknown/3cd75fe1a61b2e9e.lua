game.TextChatService.TextChannels.RBXGeneral:DisplaySystemMessage("<font color='#FAF206'>[Actual Hub] </font>Script isn't loaded? try change <font color='#FAF206'>executor</font>.")

local gameid = {
        [3851622790] = "https://raw.githubusercontent.com/Iptxt/ActualHub/refs/heads/main/BreakIn1",  -- Break In 1 (Lobby)
        [4620170611] = "https://raw.githubusercontent.com/Iptxt/ActualHub/refs/heads/main/BreakIn1",  -- Break In 1 (In Game)
        [13864661000] = "https://raw.githubusercontent.com/Iptxt/ActualHub/refs/heads/main/BreakIn2", -- Break In 2 (Lobby)
        [13864667823] = "https://raw.githubusercontent.com/Iptxt/ActualHub/refs/heads/main/BreakIn2", -- Break In 2 (In Game)
        [126509999114328] = "https://raw.githubusercontent.com/Iptxt/ActualHub/refs/heads/main/99NightsInTheForest", -- 99 Nights in the forest (In Game)
        [118614517739521] = "https://raw.githubusercontent.com/Iptxt/ActualHub/refs/heads/main/Blindshot", -- Blindshot
}

local nconfig = {
    [10246683491] = true,
    [10247184396] = true
}


local placeid = game.PlaceId

if gameid[placeid] then
        loadstring(game:HttpGet(gameid[placeid]))();
elseif nconfig[placeid] then
        game.TextChatService.TextChannels.RBXGeneral:DisplaySystemMessage("<font color='#FAF206'>[Actual Hub] </font>Game is supported but need a config. Please go to <font color='#FAF206'>AX Hub Discord Server</font> to retrieve it. Check your clipboard for the discord link.")
else
        game.TextChatService.TextChannels.RBXGeneral:DisplaySystemMessage("<font color='#FAF206'>[Actual Hub] </font>Game Is Not Supported! Executing <font color='#FAF206'>Alternative</font> script..")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Iptxt/AXHub-Loader/refs/heads/main/Alternative"))()
end






-- \\ Discord Link // --
task.wait(2)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Iptxt/AXHub-Loader/refs/heads/main/DCLINK"))();
