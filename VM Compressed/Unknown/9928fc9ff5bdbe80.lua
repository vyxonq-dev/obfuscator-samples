if not game:IsLoaded() then
    game.Loaded:Wait()
end

local MAINMENU_PLACEID = 72368345999613
local MAIN_GAMEID = 6490954291
local DISCORD_INVITE = "https://discord.gg/RX4bGTY9"

local MAIN_SCRIPT = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/NeziaReal/GhoulreSkibidi/refs/heads/main/GhoulRe.lua"
))

local MAIN_MENU_SCRIPT = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/NeziaReal/GhoulreSkibidi/refs/heads/main/GameTeleport.lua"
))

local function Notify(title, text, duration)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = duration or 4
    })
end

if game.PlaceId == MAINMENU_PLACEID then
    MAIN_MENU_SCRIPT()

elseif game.GameId == MAIN_GAMEID then
    MAIN_SCRIPT()

else

    pcall(function()
        setclipboard(DISCORD_INVITE)
    end)

    Notify(
        "Unsupported Game",
        "Nameless does not support this game.\nDiscord invite copied to clipboard.",
        5
    )
end

