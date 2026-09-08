local SupportedGames = {
    [98929893] = "https://raw.githubusercontent.com/sspecutils/utils/refs/heads/main/DBRage",
    [10168931576] = "https://raw.githubusercontent.com/sspecutils/utils/refs/heads/main/Roll%20To%20Defend",
    [10131390815] = "https://raw.githubusercontent.com/sspecutils/utils/refs/heads/main/Throw%20a%20Coin",
    [8473646150] = "https://raw.githubusercontent.com/sspecutils/utils/refs/heads/main/powersimX",
    [10143320552] = "https://raw.githubusercontent.com/sspecutils/utils/refs/heads/main/Dropper%20RNG",
}

local ScriptURL = SupportedGames[game.GameId]

if not ScriptURL then
    game.Players.LocalPlayer:Kick("Game Not Supported\n\nhttps://discord.gg/xdVqfc7raz")
    return
end

loadstring(game:HttpGet(ScriptURL))()
