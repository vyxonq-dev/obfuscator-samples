-- https://discord.gg/gskAmJjFjU
getgenv().WeLoveWatt = {
    ["AutoParry"] = {
        ["Enabled"] = true,
        ["Range"] = 10,
        ["HoldBlock"] = 0.35,
        ["AnimHighlight"] = 0.15,
        ["Cooldown"] = 0.1,
        ["AttackDelay"] = 0.205,
    },
    ["Animations"] = {
        ["IDs"] = {},
    },
    ["Misc"] = {
        ["HideUsername"] = true,
    }
}

pcall(function()
    local raw = game:HttpGet("https://pastebin.com/raw/F4MW4TDG", true)
    if raw and raw ~= "" then
        local ids = {}
        for id in raw:gmatch("([%d]+)") do
            table.insert(ids, id)
        end
        getgenv().WeLoveWatt.Animations.IDs = ids
    end
end)

getgenv().SCRIPT_KEY = "e33eb9e1-5196-4096-a0e5-bda6bcd7111d";

pcall(function()
    loadstring(
        game:HttpGet(
            "https://api.jnkie.com/api/v1/luascripts/public/b31eb98558b8cc005373775f80d80fa52457fdfde109ed1df70d1028ea5948db/download",
            true
        )
    )()
end)