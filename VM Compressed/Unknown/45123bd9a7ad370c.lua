local games = {
    [4777817887] = "https://raw.githubusercontent.com/public-account-7/skidhub/refs/heads/main/bladeball.lua", --//blade ball
    [4914269443] = "https://nexveil.vercel.app/files/v1/loaders/574712d228248ed480b407eebc7eeee5", --//unamed shooter
    [6035872082] = "https://nexveil.vercel.app/files/v1/loaders/63ef38ad0542323e270e3eb2c5cbe1a3", --//rivals
    [2023680558] = "https://raw.githubusercontent.com/public-account-7/skidhub/refs/heads/main/animalsimulator.lua", --//animal simulator
    [5012222382] = "https://raw.githubusercontent.com/public-account-7/skidhub/refs/heads/main/gunfight-arena.lua", --//gunfight arena
    universal = "https://raw.githubusercontent.com/public-account-7/skidhub/refs/heads/main/universal" --//universal
}

loadstring(game:HttpGet(games[game.GameId] or games.universal))()
