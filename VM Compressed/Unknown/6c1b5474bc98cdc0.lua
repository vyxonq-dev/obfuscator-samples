-- // This script was made in an challenge
-- // Winner is @dircs
local env = (type(getgenv) == "function" and getgenv()) or _G

if env.AR_LOADED and not env.AR_DEBUG then
    warn("The script is already running!")
    return
end
env.AR_LOADED = true

repeat task.wait() until game:IsLoaded()

local Players = game:GetService("Players")
local user = Players.LocalPlayer

local lib = {
    notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/AbstractPoo/Main/main/Notifications.lua", true))(),
    cooldown = false,
    username = 'unknown',
    bw = 'unknown'
}

local confusables = {
    ["ⓐ"] = "a", ["＠"] = "a", ["@"] = "a",
    ["0"] = "o", ["Ｏ"] = "o",
    ["1"] = "i", ["¡"] = "i", ["|"] = "i",
    ["3"] = "e", ["€"] = "e",
    ["5"] = "s",
    ["7"] = "t",
    ["$"] = "s",
    ["+"] = "t"
}

local function transliterateSymbols(s)
    for k, v in pairs(confusables) do
        s = s:gsub(k, v)
    end
    return s
end

local function removeZeroWidth(s)
    s = s:gsub("[%c%z\239\187\191\226\128\139\226\128\191]", "")
    return s
end

local function normalizeText(text)
    if not text then return "" end
    text = tostring(text)
    text = text:lower()
    text = removeZeroWidth(text)
    text = transliterateSymbols(text)
    text = text:gsub("%s+", "")
    text = text:gsub("[%p%c]", "")
    text = text:gsub("0", "o")
    text = text:gsub("4", "a")
    text = text:gsub("@", "a")
    text = text:gsub("1", "i")
    text = text:gsub("!", "i")
    text = text:gsub("3", "e")
    text = text:gsub("5", "s")
    text = text:gsub("7", "t")
    text = text:gsub("(.)%1+", "%1")
    return text
end

local words = {
    ['gay'] = 'Bullying',
    ['trans'] = 'Bullying',
    ['lgbt'] = 'Bullying',
    ['lesbian'] = 'Bullying',
    ['suicide'] = 'Bullying',
    ['cum'] = 'Swearing',
    ['f@g0t'] = 'Bullying',
    ['cock'] = 'Swearing',
    ['penis'] = 'Swearing',
    ['furry'] = 'Bullying',
    ['furries'] = 'Bullying',
    ['dick'] = 'Swearing',
    ['nigger'] = 'Bullying',
    ['bible'] = 'Bullying',
    ['nigga'] = 'Bullying',
    ['cheat'] = 'Scamming',
    ['report'] = 'Bullying',
    ['niga'] = 'Bullying',
    ['bitch'] = 'Bullying',
    ['sex'] = 'Swearing',
    ['ez'] = 'Bullying',
    ['cringe'] = 'Bullying',
    ['trash'] = 'Bullying',
    ['allah'] = 'Bullying',
    ['dumb'] = 'Bullying',
    ['idiot'] = 'Bullying',
    ['kid'] = 'Bullying',
    ['clown'] = 'Bullying',
    ['bozo'] = 'Bullying',
    ['faggot'] = 'Bullying',
    ['autist'] = 'Bullying',
    ['autism'] = 'Bullying',
    ['getalife'] = 'Bullying',
    ['nolife'] = 'Bullying',
    ['adopted'] = 'Bullying',
    ['skillissue'] = 'Bullying',
    ['muslim'] = 'Bullying',
    ['gender'] = 'Bullying',
    ['parent'] = 'Bullying',
    ['islam'] = 'Bullying',
    ['christian'] = 'Bullying',
    ['noob'] = 'Bullying',
    ['retard'] = 'Bullying',
    ['burn'] = 'Bullying',
    ['stupid'] = 'Bullying',
    ['wthf'] = 'Swearing',
    ['pride'] = 'Bullying',
    ['mother'] = 'Bullying',
    ['father'] = 'Bullying',
    ['homo'] = 'Bullying',
    ['hate'] = 'Bullying',
    ['exploit'] = 'Exploiting',
    ['hack'] = 'Exploiting',
    ['download'] = 'Scamming',
    ['youtube'] = 'Offsite Links'
}

local abuseDescriptions = {
    Bullying = {
        "This player is using offensive, harassing, or discriminatory language against others.",
        "Reported for repeated bullying and toxic behavior that targets other players.",
        "The user is engaging in harmful speech that violates Roblox’s Community Standards.",
        "Player involved in verbal harassment and creating an unsafe environment for users.",
        "This player has been observed targeting others with insults and demeaning remarks."
    },
    Swearing = {
        "This player is using inappropriate or vulgar language not suitable for Roblox.",
        "Reported for repeatedly swearing and violating chat rules for appropriate language.",
        "Player has been caught using offensive words that are prohibited on Roblox.",
        "The individual is engaging in excessive profanity within chat channels.",
        "This user is using language that breaks Roblox’s safe chat or community guidelines."
    },
    Scamming = {
        "This player is attempting to scam other users through chat or deceptive actions.",
        "Reported for scamming behavior, trying to deceive or trick other players.",
        "The user is engaging in fraudulent activity that violates Roblox rules.",
        "Scam attempt detected: user is promoting fake trades or deceptive links.",
        "This individual is trying to trick other players into giving items or personal info."
    },
    ["Offsite Links"] = {
        "User is promoting offsite links or external websites, which is not permitted.",
        "Reported for attempting to redirect players to unsafe external websites.",
        "This player is sharing URLs outside Roblox that may expose users to risk.",
        "Violation detected: user advertising or sending non-Roblox links to players.",
        "The player is engaging in unsafe behavior by encouraging off-platform communication."
    },
    Exploiting = {
        "This player is suspected of exploiting or using unauthorized tools to gain advantage.",
        "Reported for attempted exploitation or using scripts to alter gameplay unfairly.",
        "The user demonstrated behavior consistent with exploiting or manipulating game systems.",
        "Exploitation detected: abnormal actions indicative of cheat tools or unauthorized clients.",
        "This individual is suspected of breaking game integrity through exploitative means."
    },
    Harassment = {
        "User is engaging in persistent harassment toward another player or group.",
        "Reported for targeted harassment and persistent negative conduct in chat.",
        "This player is creating a hostile or unsafe environment through repeated attacks.",
        "Harassment observed: the user repeatedly sends threatening or abusive messages.",
        "The individual’s behavior amounts to harassment and violates community standards."
    },
    ["Hate Speech"] = {
        "This user is engaging in hate speech or discriminatory language against protected groups.",
        "Reported for using slurs or hateful content targeting a protected characteristic.",
        "Hate speech detected: messages promoting hatred or discrimination are present.",
        "The player used language that promotes hostility toward a protected class/group.",
        "This user violates Roblox policy by engaging in discriminatory or hate-filled speech."
    }
}

local function getAbuseDescription(category)
    local list = abuseDescriptions[category]
    if list and #list > 0 then
        return list[math.random(1, #list)]
    else
        return "This player is breaking Roblox rules and Terms of Service. Please review and take action, to make roblox more secure for more players."
    end
end

function lib.notify()
    if lib.notification and lib.notification.message then
        lib.notification:message{
            Title = "AutoReport",
            Description = "Reported " .. lib.username .. ' for saying "' .. lib.bw .. '"',
            Icon = 6023426926
        }
    else
        warn("AutoReport: notification unavailable")
    end
end

function lib.report(userId, name, category)
    if not userId then return end
    if lib.cooldown then return end
    lib.username = name or tostring(userId)
    lib.bw = category or "Violation"
    local success, err = pcall(function()
        local reportedPlayer = Players:GetPlayerByUserId(userId)
        local description = getAbuseDescription(category)
        Players:ReportAbuse(reportedPlayer, category, description)
    end)
    if not success then
        warn("Couldn't report due to: " .. tostring(err) .. " | AutoReport")
    else
        lib.notify()
    end
    lib.cooldown = true
    task.delay(5, function()
        lib.username = 'unknown'
        lib.bw = 'unknown'
        lib.cooldown = false
    end)
end

Players.PlayerChatted:Connect(function(chatType, plr, msg)
    if not msg then return end
    if chatType == Enum.PlayerChatType.Whisper or plr == user then return end
    local normMsg = normalizeText(msg)
    for key, category in pairs(words) do
        local normKey = normalizeText(key)
        if normKey ~= "" and normMsg:find(normKey, 1, true) then
            lib.bw = key
            lib.report(plr.UserId, plr.Name, category)
            break
        end
    end
end)

lib.notification:message{
    Title = "AutoReport",
    Description = "loaded",
    Icon = 6023426926
}
