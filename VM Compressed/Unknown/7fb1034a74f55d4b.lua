getgenv().Settings = {
    MeleeStamina = 25, -- range: %1-100, reduces stamina usage from melees (fists, shanks)
    Hitbox = {
        Size = Vector3.new(6, 6, 6), -- 7 cube max size for hit reg
        Opacity = 0.3
    },
    Whitelist = {
        GroupIds = {},
        UserIds = {}
    },
    Refreshed = tick(), Loaded = Settings and Settings.Loaded or nil -- dont modify
}

loadstring(game:HttpGet('https://raw.githubusercontent.com/bytism/scripts/refs/heads/main/pevek_hbe.lua'))()