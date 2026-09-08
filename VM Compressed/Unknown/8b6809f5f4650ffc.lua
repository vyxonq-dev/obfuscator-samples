getgenv().AimiaConfig = {
    AutoTask = true,
    ESP      = true,
    Mode     = "Fast",    -- how fast Auto Task finishes a task  ("Fast" / "Normal")
                          --   Fast   : near-instant
                          --   Normal : 2-3s per task, like a real player
    ShowUI   = false,     -- show the in-game menu to toggle things live  (true / false)
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/AimikaNarak/database/refs/heads/main/DepthSpelunking.Lua"))()