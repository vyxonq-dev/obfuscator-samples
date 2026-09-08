local jp_vocab = loadstring(game:HttpGet('https://raw.githubusercontent.com/CF-Trail/random/refs/heads/main/jp_vocabulary.lua'))()
local notifs = loadstring(game:HttpGet('https://raw.githubusercontent.com/CF-Trail/random/main/FE2Notifs.lua'))()
local webhook = getgenv().webhook ~= '' and getgenv().webhook or false
local httprequest = (syn and syn.request) or http and http.request or http_request or (fluxus and fluxus.request) or request
local cloneref = cloneref or function(o)
    return o
end

local HttpService = cloneref(game:GetService('HttpService'))

local function genWord()
    local availableWords = jp_vocab

    if #availableWords == 0 then
        cloneref(game:GetService('Players')):Kick('0 words found somewhy. dm @szze')
        return
    end

    local index = math.random(1, #availableWords)
    return availableWords[index]
end

local function sendWebhook(wordIndex)
    if not webhook then
        return
    end
    httprequest({
        Url = webhook,
        Body = HttpService:JSONEncode({
            ["content"] = "**🔔 It's time for a new word!**\n**💬 Word:**" .. wordIndex.word .. " [" .. wordIndex.romaji .. " / " .. wordIndex.pronunciation .. "]\n**📒 Meaning:** " .. wordIndex.meaning .. "\n\n💙 Happy Learning<3 -szze"
        }),
        Method = "POST",
        Headers = {
            ["content-type"] = "application/json"
        }
    })
end

local function fetchWord(isForced)
    if not isForced then
        task.wait(math.random(300, 720))
    end
    local wordIndex = genWord()
    notifs.alert("🔔 It's time for a new word!",Color3.new(0.8, 0.498039, 1))
    task.wait(1)
    notifs.alert("💬 Word: " .. tostring(wordIndex.word) .. " [" .. tostring(wordIndex.romaji) .. " / " .. tostring(wordIndex.pronunciation ).. "]",Color3.new(1,1,1),30)
    task.wait(10)
    notifs.alert('📒 Meaning: ' .. tostring(wordIndex.meaning),Color3.new(0.5, 1, 0.5),30)
    pcall(sendWebhook, wordIndex)
end

fetchWord(true)

while task.wait() do
    fetchWord(false)
end
