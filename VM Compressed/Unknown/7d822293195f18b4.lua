local success, Rayfield = pcall(function()
    return loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
end)

if not success or not Rayfield then
    warn("Rayfield failed to load")
    return
end

---------------------------------------------------
-- WINDOW
---------------------------------------------------
local Window = Rayfield:CreateWindow({
    Name = "QuantumX Hub",
    LoadingTitle = "Loading scripts...",
    LoadingSubtitle = "Follow me on TikTok Mr_3242",
    ConfigurationSaving = { Enabled = false }
})

---------------------------------------------------
-- CONFIG
---------------------------------------------------
local PRIMARY_INDEX = "https://pastebin.com/raw/Vh6abGBP"
local PROFILE_URL = "https://pastebin.com/u/Mr_3242"

---------------------------------------------------
-- NOTIFY
---------------------------------------------------
local function Notify(t, c)
    pcall(function()
        Rayfield:Notify({
            Title = tostring(t),
            Content = tostring(c),
            Duration = 3,
            Image = 4483362458
        })
    end)
end

---------------------------------------------------
-- BLACKLIST
---------------------------------------------------
local blacklist = {
    "tools","faq","login","sign up","public pastes", "contact", "Quiz bot script (the question about how to custom quiz here’s the answer this isn’t the script)","Fake loading progress", "⚠️this is not a script ⚠️ Daycare 💥 virus combinations", "QuantumX Script list", 
    "syntax languages","archive","news","pro","dmca",
    "QuantumX Hub V2.0!","This isn’t a script its a Ui Library i made","How to use loadstring",
    "rayfield made by sirius"
}

local function isBlocked(name)
    name = tostring(name or ""):lower()

    for i = 1, #blacklist do
        local bad = tostring(blacklist[i] or ""):lower()
        if bad ~= "" and name:find(bad, 1, true) then
            return true
        end
    end

    return false
end

---------------------------------------------------
-- CATEGORY SETUP
---------------------------------------------------
local categoryOrder = {
    "Admin",
    "Hub",
    "Exploits",
    "Tools",
    "Games",
    "Misc"
}

local categories = {}
local tabs = {}

for _, name in ipairs(categoryOrder) do
    categories[name] = {}
end

---------------------------------------------------
-- HTTP
---------------------------------------------------
local function httpGet(url, retries)
    retries = retries or 2

    for i = 1, retries do
        local ok, res = pcall(function()
            return game:HttpGet(url)
        end)

        if ok and type(res) == "string" and #res > 20 then
            return res
        end

        task.wait(0.15 * i)
    end

    return nil
end

---------------------------------------------------
-- CLEAN TEXT
---------------------------------------------------
local function clean(text)
    return (text or "")
        :gsub("&amp;", "&")
        :gsub("<.->", "")
        :gsub("%s+", " ")
        :match("^%s*(.-)%s*$")
end

---------------------------------------------------
-- CATEGORY DETECTION
---------------------------------------------------
local function getCategory(name)
    local n = name:lower()

    if n:find("admin") then
        return "Admin"
    elseif n:find("hub") then
        return "Hub"
    elseif n:find("fly") or n:find("esp") or n:find("teleport") then
        return "Exploits"
    elseif n:find("tool") or n:find("gui") then
        return "Tools"
    elseif n:find("game") or n:find("obby") or n:find("simulator") then
        return "Games"
    end

    return "Misc"
end

---------------------------------------------------
-- STORAGE
---------------------------------------------------
local seen = {}

local function addScript(name, url)
    if isBlocked(name) then return end
    if seen[url] then return end

    seen[url] = true

    local cat = getCategory(name)
    table.insert(categories[cat], {
        name = name,
        url = url
    })
end

---------------------------------------------------
-- PARSERS
---------------------------------------------------
local function parsePrimary(data)
    for line in data:gmatch("[^\r\n]+") do
        local name, url = line:match("^(.-)%s*=%s*(https://pastebin%.com/raw/%w+)")
        if name and url then
            addScript(clean(name), url)
        end
    end
end

local function parseProfile(html)
    for id, name in html:gmatch('href="/(%w+)"[^>]*>([^<]+)</a>') do
        local url = "https://pastebin.com/raw/" .. id
        addScript(clean(name), url)
    end
end

---------------------------------------------------
-- RUN SCRIPT
---------------------------------------------------
local function runScript(url)
    local content = httpGet(url, 3)

    if not content or content:lower():find("<html") then
        Notify("Error", "Failed to load script")
        return
    end

    pcall(function()
        Rayfield:Destroy()
    end)

    task.wait(0.1)

    local ok, err = pcall(function()
        loadstring(content)()
    end)

    if not ok then
        Notify("Execution Error", err or "Unknown error")
    end
end

---------------------------------------------------
-- BUILD UI
---------------------------------------------------
local function buildUI()
    for _, catName in ipairs(categoryOrder) do
        local list = categories[catName]

        if #list > 0 then
            local tab = Window:CreateTab(catName, 4483362458)
            tabs[catName] = tab

            for _, script in ipairs(list) do
                tab:CreateButton({
                    Name = script.name,
                    Callback = function()
                        runScript(script.url)
                    end
                })
            end
        end
    end
end

---------------------------------------------------
-- LOAD EVERYTHING
---------------------------------------------------
task.spawn(function()
    local primary = httpGet(PRIMARY_INDEX, 2)
    if primary then parsePrimary(primary) end

    local profile = httpGet(PROFILE_URL, 2)
    if profile then parseProfile(profile) end

    buildUI()

    ---------------------------------------------------
    -- STATIC TABS
   ---------------------------------------------------
    local CreditsTab = Window:CreateTab("Credits", 4483362458)

    CreditsTab:CreateParagraph({
        Title = "Credits",
        Content = "QuantumX Hub created by Mr_3242\nThanks for using the hub!"
    })

    local function copy(txt)
        if typeof(setclipboard) == "function" then
            pcall(function()
                setclipboard(txt)
            end)
        end
    end

    CreditsTab:CreateButton({
        Name = "Copy TikTok",
        Callback = function() copy("https://www.tiktok.com/@Mr_3242") end
    })

    CreditsTab:CreateButton({
        Name = "Copy YouTube",
        Callback = function() copy("https://www.youtube.com/@Mr_3242.") end
    })

    CreditsTab:CreateButton({
        Name = "Copy Twitch",
        Callback = function() copy("https://m.twitch.tv/quantumx_42/home") end
    })

---------------------------------------------------
-- UNLOAD
---------------------------------------------------
    local UnloadTab = Window:CreateTab("Unload", 4483362458)
    UnloadTab:CreateButton({
        Name = "Unload Script",
        Callback = function()
            pcall(function()
                Rayfield:Destroy()
            end)
        end
    })
end)