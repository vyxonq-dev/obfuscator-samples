-- why you tryna skid 😭

local Games = {
    [8795154789] = "https://api.luarmor.net/files/v4/loaders/236a11d1dbc745e83c8bcabaad8e0691.lua", -- Flick
    [8856451375] = "https://api.luarmor.net/files/v4/loaders/2d9b73b84a025f1d4ea7ba7fe06a4687.lua", -- Fluxo PVP
    [6035872082] = "https://api.luarmor.net/files/v4/loaders/836b5663e68a5431125520ac530bd150.lua", -- Rivals
    [7529591378] = "https://api.luarmor.net/files/v4/loaders/520372631b964c13d92eedd3a98b215a.lua", -- Practical Basketball
}

local Players     = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local KeyFile    = "VaelithScriptKey"

local url = Games[game.GameId]
if not url then
    LocalPlayer:Kick("VaelithHub | This game is not supported.")
    return
end

local key = getfenv().script_key
if (not key or key == "") and isfile and isfile(KeyFile) then
    local ok, saved = pcall(readfile, KeyFile)
    if ok and saved and saved ~= "" then
        key = saved
    end
end

if not key or key == "" then
    LocalPlayer:Kick("VaelithHub | Key not found, make sure to include the script_key part in the first line.")
    return
end

getfenv().script_key = key
if getgenv then getgenv().script_key = key end
pcall(writefile, KeyFile, key)

do
    local queue = queue_on_teleport
        or (syn and syn.queue_on_teleport)
        or (fluxus and fluxus.queue_on_teleport)
        or queueonteleport

    if type(queue) == "function" then
        local payload = ([[
            getgenv().script_key = %q
            task.spawn(function()
                local ok, src = pcall(function()
                    return game:HttpGet("https://raw.githubusercontent.com/sxpreme557-lgtm/VaelithHub/refs/heads/main/Main.lua")
                end)
                if ok and src then
                    local fn = loadstring(src)
                    if fn then fn() end
                end
            end)
        ]]):format(key)

        local queued = false
        local function enqueue()
            if queued then return end
            queued = true
            pcall(queue, payload)
        end

        pcall(function()
            LocalPlayer.OnTeleport:Connect(function(state)
                if state == Enum.TeleportState.Started
                    or state == Enum.TeleportState.InProgress then
                    enqueue()
                end
            end)
        end)
        enqueue()
    end
end

loadstring(game:HttpGet(url))()
