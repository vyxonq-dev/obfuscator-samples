--!nocheck
-- sel01 hub loader - by seltonmt
--
-- One line in the executor, every game after that is automatic:
--
--   loadstring(game:HttpGet("https://raw.githubusercontent.com/seltonmt012/sel01-rbx/main/loader.lua"))()
--
-- What it does, in order:
--
--   1. reads index.json from the repo (the registry of every game script)
--   2. matches the current place by PlaceId, and if that misses, by running the
--      entry's `detect` snippet - place ids change per map/lobby, capabilities
--      do not (Clean all the leaves teleports into a second place mid-run)
--   3. fetches lib/ui-template.lua ONCE, keeps the loaded module in _G.__SEL.ui
--      and also writefile()s it into the executor workspace, so a game script
--      that still does loadstring(readfile("ui-template.lua")) keeps working
--   4. runs the matching game script
--   5. re-arms itself with queue_on_teleport, so a lobby -> map teleport does
--      not drop the automation - but ONLY for the script that is already
--      running, unless auto-start is switched on. See AUTO-START below.
--
-- Everything it downloads is cached under the executor workspace in sel01/, and
-- a failed HttpGet falls back to that cache instead of leaving you with nothing.
--
-- Nothing matched? A small panel lists every game in the registry and lets you
-- force one, and _G.__SEL.load("lootevo") does the same from the console.

-- EXECUTOR GATE -----------------------------------------------------------
--
-- Solara and Xeno are missing too many of the functions the scripts rely on
-- (hookmetamethod, getconnections, queue_on_teleport among them), and a script
-- half-running there generates bug reports we cannot fix. Detect and stop
-- before anything else runs. identifyexecutor can be absent or throw on some
-- executors, so both are guarded; no answer means no block.
do
    local getName = identifyexecutor or getexecutorname
    if getName then
        local ok, name = pcall(getName)
        if ok and name then
            local execName = tostring(name):lower()
            if execName:find("solara") or execName:find("xeno") then
                game:GetService("Players").LocalPlayer:Kick(
                    "EXECUTOR NOT SUPPORTED [PLEASE DON'T GET MAD THIS IS SOLARA/XENO'S FAULT]")
                return
            end
        end
    end
end

local BASE = "https://raw.githubusercontent.com/seltonmt012/sel01-rbx/main/"
local CACHE = "sel01/"

-- AUTO-START --------------------------------------------------------------
--
-- The queue below is what made this loader come back in EVERY game, not just
-- the one it was started in, and it is worth writing down exactly why, because
-- it does not look like it from the code:
--
--   * the loader queues THE LOADER, never a game script. So whatever place the
--     client lands in next, the hub runs there and looks for a match.
--   * it re-arms on every one of its own runs, so the chain never ends.
--   * and the new Roblox app keeps ONE PROCESS across game joins - measured on
--     this machine: a single client log with 15 different placeids in it. The
--     executor's queue lives in that process, so leaving a game and joining a
--     completely unrelated one is, to the queue, the same event as a teleport.
--
-- Handy when hopping from game to game all day, confusing for everybody else:
-- you run one line once and a panel keeps appearing over games you never asked
-- about. So it is a switch now, and it is OFF unless the file says otherwise -
-- which is what a fresh install and everybody who never touches it gets.
--
-- OFF does not mean the queue is gone. A script that is already running still
-- follows its own game across a place change (leaves lobby -> map, speedevolve
-- world 1 -> world 2); what stops is starting a DIFFERENT game's script by
-- itself. The two are told apart by the alias the queue carries in _G.__SEL_TP.
--
-- NOTHING here needs the filesystem to work. The default is the hardcoded false
-- below and only an explicit 1/on/true moves it, so an executor with no file
-- API, a missing workspace folder or an isfile that throws all end up OFF -
-- which is the answer that cannot surprise anybody.
local AUTOLOAD_FILE = "selux-autoload.txt"

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")

if not game:IsLoaded() then game.Loaded:Wait() end

-- Re-executing does not restart the Lua VM, so a previous run's panels and loops
-- are still alive. Bump the generation and let the old ones notice.
local PREV = _G.__SEL
local GEN = ((PREV and PREV.gen) or 0) + 1

-- Set by the queued payload and by nothing else, so it is the one reliable
-- answer to "did a human start me, or did the queue?". A teleport builds a new
-- Lua VM, so it cannot be left over from the last place either.
--
-- It carries the ALIAS of the script that armed it, not just a boolean, and
-- that is on purpose: the alternative was a file in the workspace, which needs
-- makefolder/writefile/readfile to all exist and work. Plenty of mobile
-- executors have a partial or missing file API, and there the marker would be
-- unreadable - which would refuse the one case that has to keep working, a
-- script following its own game from a lobby into a map. The queued string is
-- something this loader writes itself, so it is available wherever the queue is.
-- ...and it is written in THREE places, because one of them is not reliable
-- everywhere. `_G` inside an executed script is not always the same table the
-- next execution sees - several executors sandbox each run and keep the shared
-- table behind getgenv() instead - and when the marker does not survive, the
-- loader reads "a human typed this" and starts a script in every game the client
-- joins. That is exactly what a user on Delta reported: "keeps loading in every
-- game". So the queued payload sets `_G.__SEL_TP`, `getgenv().__SEL_TP` and a
-- one-line file, and any of the three is enough.
--
-- The FILE is written by the queued payload itself, in the new place, and is
-- deleted here the moment it is read. That is what keeps it free of false
-- positives: a hand-typed loader line never writes it, so its presence means the
-- queue ran and nothing else. A stale copy left behind by a crash costs one
-- refusal and is gone afterwards.
--
-- Defined ABOVE the executor-global shims below on purpose, and reading the raw
-- globals rather than those locals: a local is invisible above its own
-- definition, so `isfile` in here is the executor's own function, guarded by the
-- pcall around it. Do not "tidy" this by moving the shims - moving the read
-- itself below them is the safe direction.
local QUEUE_FILE = "selux-queue.txt"

local function readQueueMarker()
    local mark = _G.__SEL_TP
    if type(mark) ~= "string" and getgenv then
        local ok, shared = pcall(getgenv)
        if ok and type(shared) == "table" then mark = shared.__SEL_TP end
    end
    if type(mark) == "string" then return mark end

    local ok, body = pcall(function()
        if not (isfile and readfile and isfile(QUEUE_FILE)) then return nil end
        return readfile(QUEUE_FILE)
    end)
    if ok and type(body) == "string" then
        return (string.gsub(body, "%s", ""))
    end
    return nil
end

local function clearQueueMarker()
    _G.__SEL_TP = nil
    if getgenv then
        pcall(function() getgenv().__SEL_TP = nil end)
    end
    -- delfile where it exists, an empty file everywhere else: what matters is
    -- that the NEXT run does not read this one again.
    pcall(function()
        if delfile then delfile(QUEUE_FILE) elseif writefile then writefile(QUEUE_FILE, "") end
    end)
end

-- Executor globals differ per executor; every optional one degrades to a no-op.
local writefile   = writefile or function() end
local readfile    = readfile
local isfile      = isfile or function() return false end
local isfolder    = isfolder or function() return true end
local makefolder  = makefolder or function() end
local queueTp     = queue_on_teleport or queueonteleport
    or (syn and syn.queue_on_teleport) or (fluxus and fluxus.queue_on_teleport)

-- Read once, cleared immediately: whatever the queue left behind must not be
-- read a second time by a later hand-started run.
local FROM = readQueueMarker()
if FROM == "" then FROM = nil end
local VIA_QUEUE = FROM ~= nil
clearQueueMarker()

local function notify(text, duration)
    print("[sel01] " .. text)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "sel01", Text = text, Duration = duration or 4,
        })
    end)
end

local function httpGet(url)
    -- HttpGet's second argument is the CACHE flag, and passing true was a bug:
    -- after a publish the next teleport re-ran the loader and it served the
    -- previous copy out of the client's own cache, so a freshly fixed script
    -- came back with the old behaviour and looked like the fix had not worked.
    local ok, body = pcall(function() return game:HttpGet(url, false) end)
    if ok and type(body) == "string" and #body > 0 then return body end
    -- Some executors only expose the request form.
    local req = (syn and syn.request) or (http and http.request) or http_request or request
    if req then
        local ok2, res = pcall(req, { Url = url, Method = "GET" })
        if ok2 and type(res) == "table" and res.StatusCode == 200 then return res.Body end
    end
    return nil
end

-- Downloads path from the repo and caches it. raw.githubusercontent serves a
-- cached copy for a few minutes, so the timestamp is what makes an edit show up
-- in game without waiting.
local function fetch(path)
    if not isfolder(CACHE) then makefolder(CACHE) end
    local cached = CACHE .. path:gsub("/", "_")
    local body = httpGet(BASE .. path .. "?t=" .. tostring(os.time()))
    if body then
        pcall(writefile, cached, body)
        return body, "net"
    end
    if isfile(cached) and readfile then
        local ok, disk = pcall(readfile, cached)
        if ok and disk and #disk > 0 then return disk, "cache" end
    end
    return nil
end

local function run(source, chunkName)
    local chunk, err = loadstring(source, "@" .. chunkName)
    if not chunk then return nil, err end
    return chunk
end

--------------------------------------------------------------------------------
-- auto-start switch
--------------------------------------------------------------------------------

-- Written by the panel (lib/ui-template.lua, the card behind the mark in the
-- rail). Missing file = off, which is the whole point: the repo ships nothing,
-- so nobody gets the chain without asking for it.
-- FAIL CLOSED, and every step of it is deliberate. Auto-start must be OFF when
-- anything at all is unusual - the file missing, the file empty, the file
-- holding something unexpected, an executor with no isfile/readfile, or either
-- of those throwing on a path it dislikes. Only the exact strings below turn it
-- on. The whole read sits inside a pcall for the last case: an executor that
-- errors out of isfile would otherwise take the loader down with it, and a
-- loader that crashes here is a loader that never reaches the switch at all.
local function readFlag(path)
    local ok, body = pcall(function()
        if not (isfile and readfile and isfile(path)) then return nil end
        local text = readfile(path)
        if type(text) ~= "string" then return nil end
        return (string.gsub(text, "%s", ""))
    end)
    if not ok then return nil end
    return body
end

local AUTOLOAD = false
do
    local saved = readFlag(AUTOLOAD_FILE)
    if type(saved) == "string" then
        saved = string.lower(saved)
        AUTOLOAD = saved == "1" or saved == "on" or saved == "true"
    end
end

-- The queue, and the flag that tells the next run where it came from. Two
-- statements in one queued string, and %q rather than plain quotes so an alias
-- with anything unusual in it cannot break out of the literal.
--
-- ARMED ONCE PER RUN, and the guard matters: queue_on_teleport APPENDS, so
-- arming twice makes the loader run twice on the other side and build two
-- panels. With auto-start on, the arm at the top wins and carries an empty
-- alias - harmless, because auto-start on does not consult it. With it off,
-- loadGame is the only caller and passes the real one.
local armed = false

local function arm(alias)
    if armed or not queueTp then return end
    armed = true
    -- "*" rather than "" for "the queue armed this, but no script was running
    -- yet" (auto-start on, armed before the registry is even fetched). An empty
    -- string is indistinguishable from a marker that failed to arrive, and it
    -- would make the run read as hand-started.
    local tag = type(alias) == "string" and alias ~= "" and alias or "*"
    -- Three markers, one payload. Each line is wrapped so a missing function
    -- (getgenv, writefile) cannot stop the loader from running on the other side -
    -- the point of the redundancy is that ANY of them getting through is enough,
    -- not that all of them do.
    local payload = string.format(
        '_G.__SEL_TP = %q; ' ..
        'pcall(function() getgenv().__SEL_TP = %q end); ' ..
        'pcall(function() writefile(%q, %q) end); ' ..
        'loadstring(game:HttpGet(%q))()',
        tag, tag, QUEUE_FILE, tag, BASE .. "loader.lua")
    pcall(queueTp, payload)
end

-- With auto-start ON this is armed before anything else can fail: a lobby with
-- no connection still teleports into the map, and the map is where the run
-- happens - dropping the re-arm because index.json was unreachable would lose
-- the whole session.
--
-- With auto-start OFF there is nothing to carry until a script actually runs,
-- so arming moves into loadGame. The lobby-with-no-connection case is the price
-- of not appearing in unrelated games, and it is the rarer of the two.
if AUTOLOAD then arm() end

--------------------------------------------------------------------------------
-- registry
--------------------------------------------------------------------------------

local indexBody, indexFrom = fetch("index.json")
if not indexBody then
    notify("index.json unreachable and no cache - nothing loaded", 8)
    return
end

local okIndex, INDEX = pcall(function() return HttpService:JSONDecode(indexBody) end)
if not okIndex or type(INDEX) ~= "table" or type(INDEX.games) ~= "table" then
    notify("index.json is not valid JSON", 8)
    return
end

--------------------------------------------------------------------------------
-- shared UI
--------------------------------------------------------------------------------

-- Loaded once per session and handed to every game script through _G.__SEL.ui,
-- so five scripts in one session do not fetch and build the same module five
-- times. The workspace copy exists for scripts run by hand through the bridge,
-- which have no hub around them.
local UI
local function ui()
    if UI then return UI end
    local path = INDEX.ui or "lib/ui-template.lua"
    local body = fetch(path)
    if not body then return nil end
    pcall(writefile, "ui-template.lua", body)
    local chunk = run(body, path)
    if not chunk then return nil end
    local ok, module = pcall(chunk)
    if ok and type(module) == "table" then UI = module end
    return UI
end

--------------------------------------------------------------------------------
-- matching
--------------------------------------------------------------------------------

local function matchesPlace(entry)
    if type(entry.places) ~= "table" then return false end
    for _, id in ipairs(entry.places) do
        if tonumber(id) == game.PlaceId then return true end
    end
    return false
end

-- `detect` is a Lua snippet in the registry that returns a boolean. It is what
-- catches a place id we have never seen: a map place, a private server copy or
-- a renamed sister place all still expose the same modules and remotes.
local function matchesDetect(entry)
    if type(entry.detect) ~= "string" or entry.detect == "" then return false end
    local chunk = run("return function() " .. entry.detect .. " end", "detect:" .. tostring(entry.alias))
    if not chunk then return false end
    local okOuter, fn = pcall(chunk)
    if not okOuter or type(fn) ~= "function" then return false end
    local ok, result = pcall(fn)
    return ok and result == true
end

local function pick()
    for _, entry in ipairs(INDEX.games) do
        if matchesPlace(entry) then return entry, "place" end
    end
    for _, entry in ipairs(INDEX.games) do
        if matchesDetect(entry) then return entry, "detect" end
    end
    return nil
end

local function byAlias(alias)
    alias = tostring(alias):lower()
    for _, entry in ipairs(INDEX.games) do
        if tostring(entry.alias):lower() == alias then return entry end
    end
    for _, entry in ipairs(INDEX.games) do
        if tostring(entry.name):lower():find(alias, 1, true) then return entry end
    end
    return nil
end

--------------------------------------------------------------------------------
-- the key system
--------------------------------------------------------------------------------
--
-- Entries carrying `"paid": true` are not fetched from the repo at all - their
-- source never goes there, because index.json names every file and a path that
-- is written down is not hidden. They come from the key API instead, and only
-- against a key that API issued itself.
--
-- ONE key for ALL paid games, not one per script: the alias is just a parameter
-- on the request. Nothing about the entry point changes - the same single
-- loadstring, the same loader, the same registry with free and paid side by
-- side.
--
-- Everything here degrades quietly. No key config in the registry, no `paid`
-- flags, or an unreachable API and the loader behaves exactly as it did before.

local KEY_FILE = "selux-key.txt"

local function keyConfig()
    local cfg = INDEX.key
    if type(cfg) ~= "table" then return nil end
    if type(cfg.api) ~= "string" or cfg.api == "" then return nil end
    return cfg
end

-- Stable per installation and present on every executor, unlike `gethwid`, which
-- several do not have at all. It is hashed on the server, never stored raw.
local function hwid()
    local ok, id = pcall(function()
        return game:GetService("RbxAnalyticsService"):GetClientId()
    end)
    if ok and type(id) == "string" and #id > 4 then return id end
    local ok2, id2 = pcall(function() return gethwid and gethwid() end)
    if ok2 and type(id2) == "string" and #id2 > 4 then return id2 end
    -- Last resort. It still binds the key to *something*, and a player whose
    -- executor exposes neither is better off with a working panel.
    return "fallback-" .. tostring(game.PlaceId)
end

-- The stored expiry is for the countdown ONLY. A client clock is not evidence -
-- the server holds the real deadline as the KV record's own lifetime, so a user
-- winding the PC back gets a refusal, not four more hours.
local function readKey()
    local raw = readFlag(KEY_FILE)
    if type(raw) ~= "string" or raw == "" then return nil end
    local key, exp = string.match(raw, "^([^;]+);?(%d*)$")
    if not key or key == "" then return nil end
    return key, tonumber(exp) or 0
end

local function saveKey(key, expires)
    pcall(writefile, KEY_FILE, tostring(key) .. ";" .. tostring(expires or 0))
end

local function encode(text)
    local ok, out = pcall(function() return HttpService:UrlEncode(tostring(text)) end)
    if ok then return out end
    return tostring(text)
end

-- Asks the server whether a key is good, and binds it to this machine the first
-- time it is used. Returns ok, expiry-or-reason.
local function redeem(key)
    local cfg = keyConfig()
    if not cfg then return false, "no key config in the registry" end
    local body = httpGet(cfg.api .. "/redeem?k=" .. encode(key) .. "&h=" .. encode(hwid()))
    if not body then return false, "key server unreachable" end
    local ok, data = pcall(function() return HttpService:JSONDecode(body) end)
    if not ok or type(data) ~= "table" then return false, "bad reply from key server" end
    if data.ok then return true, tonumber(data.expires) or 0 end
    return false, tostring(data.error or "invalid key")
end

local keyWindow

-- Shown instead of the game script. It is the same panel template every script
-- uses, so the hub has exactly one look.
local function keyPanel(entry, reason)
    local cfg = keyConfig()
    local U = ui()
    if not U or not cfg then
        notify("key required for " .. tostring(entry.alias) .. " - " .. tostring(reason), 12)
        return
    end
    if keyWindow then pcall(function() keyWindow:Destroy() end) end

    local win = U.Window({
        name = "SeluxKeyPanel",
        title = "SE", accentTitle = "LUX", subtitle = "key",
        badge = "🔑", width = 820, height = 582,
    })
    keyWindow = win

    local page = win:Page("KEY", U.icon.shield)
    local card = page:Card(string.upper(tostring(entry.name or entry.alias)), 0):Accent()
    card:Label("Dieses Skript ist geschützt. Hol dir einen Key über einen der "
        .. "beiden Links, füg ihn unten ein und drück EINLÖSEN. Ein Key gilt "
        .. tostring(cfg.hours or 4) .. " Stunden und schaltet ALLE geschützten Skripte frei.")

    local status = page:Card("STATUS", 0):Readout(4)
    local function say(line, extra)
        pcall(function() status:set({ line, extra or "", "", "" }) end)
    end
    say(reason and ("  " .. reason) or "  Kein gültiger Key gefunden.")

    local links = page:Card("SCHRITT 1 - KEY HOLEN", 1)
    for _, link in ipairs(type(cfg.links) == "table" and cfg.links or {}) do
        if type(link) == "table" and type(link.url) == "string" then
            links:Button(tostring(link.label or "LINK"), function()
                -- openUrl walks every opener an executor might have and only
                -- falls back to the clipboard - it says which one happened.
                local how = U.openUrl(link.url)
                say("  " .. tostring(link.label) .. " geöffnet (" .. tostring(how) .. ")",
                    how == "clipboard" and "  Link liegt in der Zwischenablage - im Browser einfügen." or "")
            end)
        end
    end

    local enter = page:Card("SCHRITT 2 - EINLÖSEN", 2)
    local box = enter:Input("SELUX-XXXXX-XXXXX-XXXXX")
    enter:Button("EINLÖSEN", function()
        local typed = box.get and box.get() or ""
        typed = string.gsub(tostring(typed), "%s", "")
        if typed == "" then say("  Bitte erst den Key einfügen.") return end
        say("  Prüfe...")
        local ok, info = redeem(typed)
        if not ok then say("  Abgelehnt: " .. tostring(info)) return end
        saveKey(typed, info)
        say("  Key angenommen. Skript wird geladen...")
        task.delay(0.4, function()
            pcall(function() win:Destroy() end)
            keyWindow = nil
            if _G.__SEL and _G.__SEL.loadGame then _G.__SEL.loadGame(entry, "key") end
        end)
    end, U.theme.good)
    enter:Button("Key vergessen", function()
        pcall(function() if delfile and isfile and isfile(KEY_FILE) then delfile(KEY_FILE) end end)
        pcall(writefile, KEY_FILE, "")
        say("  Gespeicherter Key gelöscht.")
    end, U.theme.bad)

    pcall(function() win:Home() end)
    win:Refresh()
end

--------------------------------------------------------------------------------
-- loading a game script
--------------------------------------------------------------------------------

local function loadGame(entry, why)
    if type(entry) == "string" then
        local found = byAlias(entry)
        if not found then
            notify("no game called '" .. entry .. "' in the registry", 6)
            return false
        end
        entry = found
    end
    if not entry then return false end

    local body, from
    if entry.paid then
        -- A paid script is never in the repo, so there is nothing to fall back
        -- to and nothing to cache: the key API is the only source. If the key is
        -- missing, expired or bound elsewhere the panel goes up instead and the
        -- game script is simply not loaded.
        local cfg = keyConfig()
        if not cfg then
            notify("'" .. tostring(entry.alias) .. "' is key-protected but the registry has no key config", 10)
            return false
        end
        local key = readKey()
        if not key then
            keyPanel(entry, "Kein Key gespeichert.")
            return false
        end
        local ok, info = redeem(key)
        if not ok then
            keyPanel(entry, tostring(info))
            return false
        end
        body = httpGet(cfg.api .. "/s?a=" .. encode(entry.alias)
            .. "&k=" .. encode(key) .. "&h=" .. encode(hwid()))
        from = "key"
        if not body or #body < 32 then
            keyPanel(entry, "Key server lieferte nichts.")
            return false
        end
    else
        body, from = fetch(entry.file)
    end
    if not body then
        notify("could not fetch " .. tostring(entry.file), 8)
        return false
    end

    ui()  -- the script expects _G.__SEL.ui to be there before it runs
    _G.__SEL.game = entry
    _G.__SEL.source = from

    -- Armed BEFORE the script runs, not after: a game script that yields for its
    -- own reasons would otherwise never get the alias into the queue, and the
    -- place it teleports itself into would refuse to carry it.
    --
    -- A script is running now, so where it teleports itself is worth following -
    -- with auto-start off this is the only place the queue is armed at all.
    arm(entry.alias)

    local chunk, err = run(body, entry.file)
    if not chunk then
        notify("syntax error in " .. entry.file .. ": " .. tostring(err), 10)
        warn("[sel01] " .. tostring(err))
        return false
    end

    notify((entry.name or entry.alias) .. "  (" .. (why or "manual") .. ", " .. from .. ")")
    local ok, runErr = pcall(chunk)
    if not ok then
        notify("crashed: " .. tostring(runErr), 10)
        warn("[sel01] " .. tostring(runErr))
        return false
    end
    return true
end

--------------------------------------------------------------------------------
-- fallback picker
--------------------------------------------------------------------------------

-- Only built when nothing matched. It is the same panel every game script uses,
-- so there is exactly one look in the whole hub.
local function textPicker()
    notify("no script for place " .. game.PlaceId .. " - pick one manually", 10)
    print("[sel01] _G.__SEL.load(\"alias\"):")
    for _, entry in ipairs(INDEX.games) do
        print(string.format("  %-14s %s", entry.alias or "?", entry.name or ""))
    end
end

local function buildPicker()
    local U = ui()
    if not U or type(U.Window) ~= "function" then return false end
    if _G.__SEL.pickerWindow then pcall(function() _G.__SEL.pickerWindow:Destroy() end) end

    local win = U.Window({
        title = "SEL", accentTitle = "01", subtitle = "seltonmt",
        badge = "☰", width = 760, height = 520,
    })
    local page = win:Page("HUB", U.icon and U.icon.list or nil)
    local info = page:Card("PLACE", 1)
    info:Label("place " .. tostring(game.PlaceId))
    info:Label("no script registered for this game")
    info:Button("Re-check", function()
        local entry, why = pick()
        if entry then win:Destroy() loadGame(entry, why) end
    end)

    local list = page:Card("SCRIPTS", 2)
    for _, entry in ipairs(INDEX.games) do
        local tone = entry.status == "wip" and U.theme.warn or nil
        list:Button(entry.name or entry.alias, function()
            win:Destroy()
            _G.__SEL.pickerWindow = nil
            loadGame(entry, "forced")
        end, tone)
    end
    win:SetStatus("place " .. tostring(game.PlaceId) .. "   " .. #INDEX.games .. " scripts")
    win:Refresh()
    _G.__SEL.pickerWindow = win
    return true
end

-- The panel is a convenience, not a dependency: if the template cannot be
-- fetched or built, the list still has to reach the console, otherwise an
-- unknown place looks exactly like a loader that silently did nothing.
local function picker()
    local ok, built = pcall(buildPicker)
    if not ok or not built then textPicker() end
    if not ok then warn("[sel01] picker: " .. tostring(built)) end
end

--------------------------------------------------------------------------------
-- public handle
--------------------------------------------------------------------------------

_G.__SEL = {
    gen = GEN,
    base = BASE,
    index = INDEX,
    hubVersion = INDEX.version,
    indexFrom = indexFrom,
    ui = nil,          -- filled by ui() on first use
    game = nil,
    fetch = fetch,
    load = function(alias) return loadGame(alias, "manual") end,
    -- The key panel calls this to retry the load once a key is accepted, and it
    -- has to go through the handle rather than the local: keyPanel is defined
    -- ABOVE loadGame, so the upvalue would still be nil when it runs. Same trap
    -- as every shared helper in games/ that was added below its first caller.
    loadGame = loadGame,
    key = {
        read = readKey,
        redeem = redeem,
        hwid = hwid,
        panel = keyPanel,
        forget = function() pcall(writefile, KEY_FILE, "") end,
    },
    list = function()
        local out = {}
        for _, entry in ipairs(INDEX.games) do
            out[#out + 1] = string.format("%-14s %s", entry.alias or "?", entry.name or "")
        end
        return table.concat(out, "\n")
    end,
    autoStart = AUTOLOAD,
    viaQueue = VIA_QUEUE,
    from = FROM,
    -- The console half of the switch in the panel; both write the same file, so
    -- either one is enough and neither has to know about the other.
    setAutoStart = function(on)
        on = on and true or false
        pcall(function() writefile(AUTOLOAD_FILE, on and "1" or "0") end)
        _G.__SEL.autoStart = on
        notify("Auto-Start in neuen Spielen: " .. (on and "AN" or "AUS"), 4)
        -- Carry whatever is loaded right now, so switching it on mid-session
        -- behaves like it had been on from the start rather than needing a
        -- second game join to take effect.
        if on then arm(_G.__SEL.game and _G.__SEL.game.alias) end
        return on
    end,
    reload = function()
        local src = httpGet(BASE .. "loader.lua?t=" .. tostring(os.time()))
        if src then local c = run(src, "loader.lua") if c then return c() end end
        notify("reload failed", 6)
    end,
    picker = picker,
}
setmetatable(_G.__SEL, { __index = function(t, k)
    if k == "ui" then return ui() end
    return nil
end })

--------------------------------------------------------------------------------

local entry, why = pick()

-- Four cases, and only the last one is new behaviour:
--
--   started by hand          -> run it. The user typed the line in THIS game.
--   auto-start on            -> run it, exactly as before.
--   queue + same script      -> run it. leaves lobby -> map, speedevolve world
--                               1 -> 2: the script is following its own game.
--   queue + different game   -> DO NOT run. This is the case that used to put a
--                               panel over a game nobody asked about.
local function mayStart()
    if not VIA_QUEUE then return true end
    if AUTOLOAD then return true end
    return entry ~= nil and FROM ~= nil and FROM ~= "" and tostring(entry.alias) == FROM
end

if not mayStart() then
    -- CONSOLE ONLY, no toast. The first version put a SendNotification up here,
    -- and it fires on every single game join for the rest of the process - which
    -- is the same nuisance the switch exists to remove, just smaller. Somebody
    -- who wants the script here runs the loader line, which always works; the
    -- print is for anyone wondering where the panel went.
    local what = entry and (entry.name or entry.alias) or "no script"
    print("[sel01] auto-start is off - " .. tostring(what) .. " not started.")
    print("[sel01] run the loader line to start it here, or turn auto-start on:")
    print("[sel01]   _G.__SEL.setAutoStart(true)   (or the switch behind the mark in the panel)")
elseif entry then
    loadGame(entry, why)
else
    picker()
end
