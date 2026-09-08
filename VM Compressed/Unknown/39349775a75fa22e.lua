-- Shitty X API - with explanatory notes only (no code changes)
-- This script handles macro actions for Retro Tower Defense (in-game PlaceId 124069847780670)
-- Lobby-only functions (Loadout/Map) are skipped in-game
-- In-game functions assume the match has started and ByteNet remotes are available

local replicatedstorage = game:GetService("ReplicatedStorage")

-- Loads the custom UI library used for the Shitty X window/tabs/console/logs
-- This is the same library your main UI script uses
local library = loadstring(game:HttpGet('https://raw.githubusercontent.com/ovoch228/depthsoimgui/refs/heads/main/library'))()

-- ByteNet networking module - core for all remote calls (place/upgrade/vote/etc.)
-- This is required from the game's Teawork/Shared/Services
local bytenet = require(replicatedstorage:WaitForChild("Teawork"):WaitForChild("Shared"):WaitForChild("Services"):WaitForChild("ByteNetworking"))

-- Main API table returned to macros
local api = {}

-- :Loadout - equips towers in the lobby only
-- What it does: Calls EquipTower.invoke for each tower in the list, slot 1..n
-- What it DOESN'T do: Doesn't work in-game (skips if not lobby PlaceId), doesn't validate tower names, doesn't handle failures/errors
-- Delay: 0.5s between equips to avoid rate-limiting
function api:Loadout(towers: table)
	if game.PlaceId ~= 98936097545088 then return end

	for i = 1, #towers do
		bytenet.Inventory.EquipTower.invoke({["TowerID"] = towers[i], ["Slot"] = i})
		task.wait(0.5)
	end
end

-- :Map - creates a singleplayer match in the lobby only
-- What it does: Fires CreateSingleplayer.invoke with Standard gamemode + given map/modifiers
-- What it DOESN'T do: Doesn't work in-game, doesn't check if map/modifiers are valid, no error handling
function api:Map(map: string, modifiers: table)
	if game.PlaceId ~= 98936097545088 then return end
	
	bytenet.MatchmakingNew.CreateSingleplayer.invoke({["Gamemode"] = "Standard", ["MapID"] = map, ["Modifiers"] = modifiers})
end

-- Only continue loading in-game features if we're in the actual game place
-- What it DOESN'T do: Doesn't load UI or in-game logic in lobby → keeps script lightweight there
if game.PlaceId ~= 124069847780670 then return api end

-- In-game only references (safe because we checked PlaceId above)
local towers = bytenet.Towers
local mapinfo = replicatedstorage.RoundInfo

local roundresultui = game:GetService("Players").LocalPlayer.PlayerGui.GameUI.RoundResult

-- Shortcuts for frequently used functions
local ostime = os.time
local taskwait = task.wait
local env = getgenv()

-- Default strat name (used in UI label)
env.StratName = "Strat"

-- Timing & state tracking (updated in :Start)
env.timer = 0 -- seconds
env.lasttime = ostime()
env.waveinfo = 1
env.isroundover = false

env.totalplacedtowers = 0
env.firsttower = 1

-- Flag used by your main UI script to know when to destroy the window (not used here)
env.destroyui = false

-- Creates the Shitty X UI window (same as your main script)
-- Size/position hardcoded, no resize allowed
local window = library:CreateWindow({
    Title = "Shitty X",
    Size = UDim2.new(0, 350, 0, 370),
    Position = UDim2.new(0.5, 0, 0, 70),
    NoResize = false
})

window:Center()

-- "Macro Player" tab (but actually used as main/log tab here)
local logtab = window:CreateTab({
    Name = "Macro Player",
    Visible = true
})

-- Label showing current StratName
local filename = logtab:Label({
    Text = "StratName: " .. env.StratName
})

-- Separate Logs tab
local logstab = window:CreateTab({
    Name = "Logs",
    Visible = true
})

-- Last log message label
local loglabel = logtab:Label({
    Label = "Last Log: Voting"
})

-- Separator + console for full log history
local row = logstab:Row()

logstab:Separator({
	Text = "Logs:"
})

local logs = logstab:Console({
	Text = "",
	ReadOnly = true,
	LineNumbers = false,
	Border = false,
	Fill = true,
	Enabled = true,
	AutoScroll = true,
	RichText = true,
	MaxLines = 200
})

-- Logging function - appends timestamped message + updates top label
-- Uses setthreadidentity(7) - likely to bypass some Roblox thread restrictions
function updatelog(text: string)
	setthreadidentity(7)
	logs:AppendText(DateTime.now():FormatLocalTime("HH:mm:ss", "en-us") .. ":", text)
	loglabel:SetText("Last Log: " .. text)
end

-- Show Macro Player tab by default
window:ShowTab(logtab)
updatelog("Voting")

function waitTime(time, wave)
    local startTick = tick()
    local MAX_WAIT = 60

    -- Wait for wave
    while env.waveinfo < wave and not env.isroundover do
        if tick() - startTick > MAX_WAIT then return false end
        task.wait(0.03)
    end

    -- If round already over → bail immediately
    if env.isroundover then return false end

    -- Wait for time (check round end every step)
    while env.timer < time do
        if env.isroundover or tick() - startTick > MAX_WAIT then
            return false
        end
        task.wait(0.03)
    end

    -- Final safety check right before returning
    return not env.isroundover
end

-- :Loop - runs the macro callback forever every ~0.03s
-- What it DOESN'T do: Doesn't throttle based on time/wave — calls func() constantly → can spam remotes if not careful
function api:Loop(func)
	if game.PlaceId ~= 124069847780670 then return end 
	
	while taskwait(0.03) do				
		func()
	end
end

-- :Start - initializes in-game tracking and 3x timescale
-- What it does: Sets timescale to 3×, starts timer at 0, connects wave/round signals
-- Timer multiplier is 3× (not 2× like some other versions)
-- What it DOESN'T do: Doesn't handle timescale failures, no error logging
function api:Start()
	bytenet.Timescale.SetTimescale.send(2)

	env.waveinfo = mapinfo:GetAttribute("Wave") or 1
	env.timer = 0
	
	mapinfo:GetAttributeChangedSignal("Wave"):Connect(function()
		env.waveinfo = mapinfo:GetAttribute("Wave")
	end)

	roundresultui:GetPropertyChangedSignal("Visible"):Connect(function()
		isroundover = roundresultui.Visible
	end)
	
	updatelog("Game Started")
		
	task.spawn(function()
		lasttime = ostime()
		while env.lasttime do
			env.timer = (ostime() - env.lasttime) * 2
			--print(string.format("Timer: %.1f | Wave: %d", timer, waveinfo))
			
			taskwait(0.25)
		end
	end)
end

-- :Difficulty - votes difficulty and resets timer/wave to 0/1 after vote
-- Waits until difficulty attribute updates
-- What it DOESN'T do: Doesn't verify if vote succeeded, assumes difficulty string is valid
function api:Difficulty(diff: string)
	updatelog(`Voted difficulty {diff}`)
	bytenet.DifficultyVote.Vote.send(diff)
	
	while #mapinfo:GetAttribute("Difficulty") == 0 do taskwait(0.05) end 
	
	env.lasttime = ostime()
	env.timer = 0
	env.waveinfo = 1
	
	taskwait(0.1)
end

-- :Ready - sends ready vote when time/wave reached
function api:Ready(time: number, wave: number)
	if waitTime(time, wave) then updatelog("Sent ready vote") bytenet.ReadyVote.Vote.send(true) end
end

-- :Skip - fires wave skip remote
function api:Skip(time: number, wave: number)
	if waitTime(time, wave) then updatelog(`Skipping Wave {wave}`) replicatedstorage:WaitForChild("ByteNetReliable"):FireServer(buffer.fromstring("\148\001")) end
end

-- :AutoSkip - toggles auto-skip
-- enable should be boolean/true/false, but typed as number (likely typo in original)
function api:AutoSkip(enable: number, time: number, wave: number)
	if waitTime(time, wave) then updatelog(`AutoSkip set to {tostring(enable)}`) bytenet.SkipWave.ToggleAutoSkip.send(enable) end
end

-- :Place - places a tower at exact time/wave
-- Updates totalplacedtowers counter
function api:Place(tower: string, position: Vector3, time: number, wave: number)
	if waitTime(time, wave) then	
		env.totalplacedtowers = env.totalplacedtowers + 1
		
		updatelog(`Placed Tower {tower}`)
		towers.PlaceTower.invoke({["Position"] = position, ["Rotation"] = 0, ["TowerID"] = tower})
	end
end

-- :Upgrade - upgrades tower by relative index (1 = first placed, etc.)
-- Uses firsttower offset (usually 1 unless restarted)
function api:Upgrade(tower: number, time: number, wave: number)
	if waitTime(time, wave) then
		updatelog(`Upgraded Tower {tower}`)
		
		local realindex = firsttower + (tower - 1)
		towers.UpgradeTower.invoke(realindex)
	end
end

-- :SetTarget - changes targeting mode (First/Last/Strongest/etc.)
function api:SetTarget(tower: number, target: string, time: number, wave: number)
	if waitTime(time, wave) then
		updatelog(`Changed Tower {tower} Target to {target} `)
	
		local realindex = firsttower + (tower - 1)
		towers.SetTargetMode.send({["UID"] = (realindex), ["TargetMode"] = target})
	end
end

-- :Sell - sells tower by relative index
function api:Sell(tower: number, time: number, wave: number)
	if waitTime(time, wave) then
		updatelog(`Sold Tower {tower}`) 
		
		local realindex = firsttower + (tower - 1)
		towers.SellTower.invoke(realindex)
	end
end

-- :PlayAgain - waits for round end, resets state, votes restart
-- What it DOESN'T do: Doesn't wait for vote confirmation, no timeout
function api:PlayAgain()
	while not isroundover do taskwait(0.1) end
	
	env.firsttower = env.totalplacedtowers + 1
	
	env.lasttime = ostime()
	env.timer = 0
	env.waveinfo = 1
	
	taskwait(1)
	
	bytenet.RoundResult.VoteForRestart.send(true)
	updatelog("Voted for restart")
	--print('vote restart success:')
end

return api
