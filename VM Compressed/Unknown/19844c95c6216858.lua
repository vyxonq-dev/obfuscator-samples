repeat task.wait(0.1) until game:IsLoaded()

local Loader, Services, LuarmorAPI
do
    local urls = {
        "https://zekehub.com/scripts/UILib/BootstrapLoader.lua",
        "https://zekehub.com/scripts/Utility/Services.lua",
        "https://sdkapi-public.luarmor.net/library.lua"
    }
    local results = table.create(3)
    local done = 0

    for i, url in urls do
        task.spawn(function()
            results[i] = game:HttpGet(url)
            done += 1
        end)
    end

    repeat task.wait() until done == 3

    Loader = loadstring(results[1])()
    Services = loadstring(results[2])()
    LuarmorAPI = loadstring(results[3])()
end

LuarmorAPI.script_id = "2e193f6e070573cfaae4fb82e86448e9"

local MarketplaceService, Players = Services:Get("MarketplaceService", "Players")

local Utilities = {}
local Handlers = {}

do
    local TimeUnits = {
        { unit = "d", seconds = 86400 },
        { unit = "h", seconds = 3600 },
        { unit = "m", seconds = 60 },
        { unit = "s", seconds = 1 }
    }

    function Utilities.FormatDuration(seconds)
        if not seconds or seconds <= 0 or seconds == -1 then
            return "Lifetime"
        end

        local parts = {}
        local remaining = seconds

        for _, data in TimeUnits do
            local value = math.floor(remaining / data.seconds)
            if value > 0 then
                table.insert(parts, value .. data.unit)
                remaining = remaining % data.seconds
                if #parts >= 2 then break end
            end
        end

        return #parts > 0 and table.concat(parts, " ") or "0s"
    end

    function Utilities.GetGameInfo()
        local ok, info = pcall(MarketplaceService.GetProductInfo, MarketplaceService, game.PlaceId)
        return {
            Name = ok and info.Name or "Unknown Game",
            Creator = ok and info.Creator.Name or "Unknown"
        }
    end

    function Utilities.GetExecutor()
        return identifyexecutor and identifyexecutor() or "Unknown"
    end

    function Utilities.CopyDiscord()
        pcall(setclipboard, "discord.gg/zekehub")
    end
end

do
    Handlers.KEY_VALID = function(data)
        task.spawn(LuarmorAPI.purge_cache)

        local player = Players.LocalPlayer
        local timeLeft = Utilities.FormatDuration(data.auth_expire > 0 and (data.auth_expire - os.time()) or -1)

        local details = {
            "Welcome, " .. player.DisplayName,
            "Executions: " .. tostring(data.total_executions),
            "Expires: " .. timeLeft
        }

        if data.note and data.note ~= "" then
            table.insert(details, "Note: " .. data.note)
        end

        Loader:SetStatus("Loading ZekeHub...")
        Loader:SetDetails(table.concat(details, "\n"))
        Loader:SetProgress(40)

        LuarmorAPI.load_script()

        task.delay(25, function()
            if getgenv().BootStrap then
                getgenv().BootStrap:Finish()
            end
        end)

        return true
    end

    Handlers.KEY_HWID_LOCKED = function()
        Utilities.CopyDiscord()
        Loader:Fail("HWID Mismatch", "This key is linked to another device.\nReset it via the Dashboard or Discord bot.\nDiscord invite copied to clipboard.")
        return false
    end

    Handlers.KEY_EXPIRED = function()
        Utilities.CopyDiscord()
        Loader:Fail("Subscription Expired", "Your key has expired.\nRenew to keep using ZekeHub.\nDiscord invite copied to clipboard.")
        return false
    end

    Handlers.KEY_BANNED = function()
        Utilities.CopyDiscord()
        Loader:Fail("Access Revoked", "This key has been blacklisted.\nContact support if this is a mistake.\nDiscord invite copied to clipboard.")
        return false
    end

    Handlers.KEY_INCORRECT = function()
        Utilities.CopyDiscord()
        Loader:Fail("Invalid Key", "Key not found in database.\nDiscord invite copied to clipboard.")
        return false
    end
end

do
    local function Authenticate()
        if not script_key then
            Loader:Fail("Authentication Failed", "No key provided.\nCheck your key and try again.")
            return false
        end

        Loader:SetStatus("Authenticating...")
        Loader:SetProgress(20)

        local status = LuarmorAPI.check_key(script_key)

        local handler = Handlers[status.code]
        if handler then
            return handler(status.data)
        end

        Utilities.CopyDiscord()
        Loader:Fail("Authentication Error", "Code: " .. tostring(status.code) .. "\nDiscord invite copied to clipboard.")
        return false
    end

    local gameInfo = Utilities.GetGameInfo()
    local executor = Utilities.GetExecutor()

    Loader:SetStatus("Starting...")
    Loader:SetDetails("Game: " .. gameInfo.Name .. "\nExecutor: " .. executor)
    Loader:SetProgress(8)

    Authenticate()
end

--[[local Runner = loadstring(game:HttpGet("https://raw.githubusercontent.com/AccountBurner/Burner/refs/heads/main/game.lua"))() -- i didnt make this shit i found it on github and thought it was funny so i used it

Runner:Show({
    Title = "ZekeHub is down",
    Subtitle = "keys will be compensated for downtime period. So please wait for the next update.",
    Invite = "discord.gg/zekehub",
    InviteLabel = "copy discord",
    ScoreFile = "score.txt"
})]]