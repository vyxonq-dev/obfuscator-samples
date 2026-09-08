-- SKYWARS LOADER - one link, detects the game, loads the right set.
--
-- Default mode is "solo": the full set, recorder and xp bar included, because
-- this game is a solo game and that is what one link should give you. Write the
-- word farm into RobloxComm/solo/mode.txt for the farming set on its own.
--
-- Yes, a Lua file can hold other Lua files. There are two honest ways and this
-- uses both, in order:
--
--   1  FETCH. The loader holds only URLs and pulls each part with HttpGet, then
--      loadstring()s the text it got back. One small link, the parts can be
--      updated without anybody re-copying a link. Costs one request per part
--      and dies if the host is down.
--   2  EMBED. The parts are pasted into this file as long strings and
--      loadstring()d straight out of memory. One enormous link, no requests, no
--      host to go down, but every edit means re-publishing the whole thing.
--
-- A third that is NOT a way: putting a Script instance inside a ModuleScript.
-- An executor runs text, not instances, so that buys nothing here.
--
-- Order of preference below is local file, then fetch, then embed, because the
-- local copy is the one being edited right now on this machine.

local BASE = "https://newgod.vip/skywars/"

-- Vape is a dependency, not an optional extra.
--
-- His words, 2026-08-21 20:2x: "i need it was incuding the vape also ... i dont
-- need toe xecute anoht vape agian, i just need to load the scirpt thne ok".
--
-- The farm does not open chests itself - standing in range and letting Vape take
-- the contents IS the looting step - so loading the set without Vape gives a
-- farm that walks to chests and comes away with nothing. The detection key is
-- measured, not guessed: with Vape running, shared.vape is a table. If it is
-- already there this does nothing, so pressing the link twice never stacks a
-- second copy.
local VAPE_URL = "https://rawscripts.net/raw/Vape-V4-For-Roblox_316"

-- PUBLIC: the version for other people. Everything of his is here, but the
-- recorder does not start itself, because the recorder is his debug tool and
-- writes a folder full of logs nobody else asked for.
local PUBLIC = true

local LOCAL_DIR = ""

-- Every game this loader knows. Detection is by universe first and place
-- second, because a game keeps its universe id when it adds a new place but a
-- place id is per map/mode.
local GAMES = {
	{
		name = "SkyWars",
		universe = 3258873704,
		places = { [8542275097] = "match", [8542259458] = "lobby", [8951451142] = "eggwars" },
		-- Only solo exists today. Duo and the rest get their own rows here and
		-- nothing else in this file has to change.
		modes = {
			-- farm: the farming set and nothing else. No recorder, no xp bar,
			-- no logs written for anybody.
			farm = {
				"SOLO_FARM.lua",
				"SOLO_PLAY.lua",
			},
			-- solo: everything, including the recorder and the xp bar. The default,
			-- because this game is solo and one link should hand over the whole thing.
			solo = {
				"SOLO_REC.lua",
				"XP_BAR.lua",
				"SOLO_FARM.lua",
				"SOLO_PLAY.lua",
			},
		},
		default = "solo",
	},
}

local EMBED = {}

local log = {}
local function note(t)
	log[#log + 1] = os.date("%H:%M:%S") .. "  " .. t
	print("[skywars loader] " .. t)
end

local function readLocal(name)
	local ok, txt = pcall(function()
		if isfile and isfile(LOCAL_DIR .. name) then return readfile(LOCAL_DIR .. name) end
		return nil
	end)
	return ok and txt or nil
end

local function fetch(name)
	local ok, txt = pcall(function() return game:HttpGet(BASE .. name) end)
	if ok and type(txt) == "string" and #txt > 40 and not txt:find("^<") then return txt end
	return nil
end

local function source(name)
	local txt = readLocal(name)
	if txt then return txt, "local file" end
	txt = fetch(name)
	if txt then return txt, "fetched" end
	if EMBED[name] then return EMBED[name], "embedded" end
	return nil, "not found"
end

local function runOne(name)
	local txt, how = source(name)
	if not txt then
		note(name .. " NOT LOADED - " .. how)
		return false
	end
	local chunk, cerr = loadstring(txt, "=" .. name)
	if not chunk then
		note(name .. " FAILED TO COMPILE (" .. how .. "): " .. tostring(cerr))
		return false
	end
	local ok, rerr = pcall(chunk)
	if ok then
		note(name .. " loaded from " .. how)
		return true
	end
	note(name .. " ERROR: " .. tostring(rerr))
	return false
end

local function detect()
	local uni = tonumber(game.GameId) or 0
	local place = tonumber(game.PlaceId) or 0
	for _, g in ipairs(GAMES) do
		if g.universe == uni then return g, g.places[place] or "unknown place" end
	end
	for _, g in ipairs(GAMES) do
		if g.places[place] then return g, g.places[place] end
	end
	return nil, nil
end

local function chooseMode(g)
	-- He picks the mode by writing one word into a file. Nothing here guesses at
	-- duo before duo exists.
	local want
	pcall(function()
		if isfile and isfile("RobloxComm/solo/mode.txt") then
			want = (readfile("RobloxComm/solo/mode.txt"):gsub("%s", "")):lower()
		end
	end)
	if want and g.modes[want] then return want end
	return g.default
end

local env = getgenv and getgenv() or _G
env.__SKYWARS_LOADER_GEN = (env.__SKYWARS_LOADER_GEN or 0) + 1

local g, where = detect()
if not g then
	note("this is not a game I know - universe " .. tostring(game.GameId)
		.. ", place " .. tostring(game.PlaceId) .. ". Nothing loaded.")
	return "skywars loader: unknown game, nothing loaded"
end

local mode = chooseMode(g)
note("detected " .. g.name .. " (" .. tostring(where) .. "), mode " .. mode)

local env2 = getgenv and getgenv() or _G
env2.__SKYWARS_PUBLIC = PUBLIC
note(PUBLIC and "public build: the recorder will load but stay stopped"
	or "private build: the recorder starts itself")

local function vapeUp()
	local ok = false
	pcall(function() ok = type(shared) == "table" and type(shared.vape) == "table" end)
	return ok
end

if vapeUp() then
	note("vape already running, not loading a second copy")
else
	local ok, err = pcall(function() loadstring(game:HttpGet(VAPE_URL))() end)
	if ok then
		task.wait(3)
		note(vapeUp() and "vape loaded" or "vape ran but shared.vape is still missing")
	else
		note("vape FAILED: " .. tostring(err))
	end
end

local good, bad = 0, 0
for _, name in ipairs(g.modes[mode]) do
	if runOne(name) then good = good + 1 else bad = bad + 1 end
end

-- A teleport destroys the Luau VM and the executor's autoexec does not run
-- again, so ask for this same loader on arrival. Same game, another server, and
-- everything below picks its saved state back up.
local RELOAD = 'loadstring(game:HttpGet("' .. BASE .. 'SKYWARS_LOADER.lua"))()'
local queued = false
pcall(function()
	if queue_on_teleport then queue_on_teleport(RELOAD) queued = true
	elseif queueonteleport then queueonteleport(RELOAD) queued = true
	elseif syn and syn.queue_on_teleport then syn.queue_on_teleport(RELOAD) queued = true end
end)
note(queued and "queued itself for after the next teleport"
	or "NO teleport queue api - it will stop at the next round change")

pcall(function()
	if not isfolder("RobloxComm") then makefolder("RobloxComm") end
	local text = table.concat(log, "\n") .. "\n"
	if isfile("RobloxComm/loader.log") then
		appendfile("RobloxComm/loader.log", text)
	else
		writefile("RobloxComm/loader.log", text)
	end
end)

return "skywars loader: " .. g.name .. " " .. mode .. ", " .. good .. " loaded, " .. bad .. " failed"
