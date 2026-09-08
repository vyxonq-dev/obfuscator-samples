local replicatedstorage = game:GetService("ReplicatedStorage")

local library = loadstring(game:HttpGet('https://raw.githubusercontent.com/ovoch228/depthsoimgui/refs/heads/main/library'))()

local bytenet = require(replicatedstorage:WaitForChild("Teawork"):WaitForChild("Shared"):WaitForChild("Services"):WaitForChild("ByteNetworking"))

local api = {}

function api:Loadout(towers: table)
	if game.PlaceId ~= 98936097545088 then return end

	for i = 1, #towers do
		bytenet.Inventory.EquipTower.invoke({["TowerID"] = towers[i], ["Slot"] = i})
		task.wait(0.5)
	end
end

function api:Map(map: string, modifiers: table)
	if game.PlaceId ~= 98936097545088 then return end
	
	bytenet.MatchmakingNew.CreateSingleplayer.invoke({["Gamemode"] = "Standard", ["MapID"] = map, ["Modifiers"] = modifiers})
end

if game.PlaceId ~= 124069847780670 then return api end

local towers = bytenet.Towers
local mapinfo = replicatedstorage.RoundInfo

local roundresultui = game:GetService("Players").LocalPlayer.PlayerGui.GameUI.RoundResult

local ostime = os.time
local taskwait = task.wait
local env = getgenv()

env.StratName = "Strat"

env.timer = 0 -- seconds
env.lasttime = ostime()
env.waveinfo = 1
env.isroundover = false

env.totalplacedtowers = 0
env.firsttower = 1

env.destroyui = false

local window = library:CreateWindow({
    Title = "Shitty X",
    Size = UDim2.new(0, 350, 0, 370),
    Position = UDim2.new(0.5, 0, 0, 70),
    NoResize = false
})

window:Center()

local logtab = window:CreateTab({
    Name = "Macro Player",
    Visible = true
})

local filename = logtab:Label({
    Text = "StratName: " .. env.StratName
})

local logstab = window:CreateTab({
    Name = "Logs",
    Visible = true
})

local loglabel = logtab:Label({
    Label = "Last Log: Voting"
})

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

function updatelog(text: string)
	setthreadidentity(7)
	logs:AppendText(DateTime.now():FormatLocalTime("HH:mm:ss", "en-us") .. ":", text)
	loglabel:SetText("Last Log: " .. text)
end

window:ShowTab(logtab)
updatelog("Voting")

function waitTime(time, wave)
	while waveinfo < wave and not isroundover do
		taskwait(0.05)
	end
	   
    	while timer < time and not isroundover do
        	taskwait(0.05)
    	end
    	
    	return not isroundover
end

function api:Loop(func)
	if game.PlaceId ~= 124069847780670 then return end 
	
	while taskwait(0.03) do				
		func()
	end
end

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

function api:Difficulty(diff: string)
	updatelog(`Voted difficulty {diff}`)
	bytenet.DifficultyVote.Vote.send(diff)
	
	while #mapinfo:GetAttribute("Difficulty") == 0 do taskwait(0.05) end 
	
	env.lasttime = ostime()
	env.timer = 0
	env.waveinfo = 1
	
	taskwait(0.1)
end

function api:Ready(time: number, wave: number)
	if waitTime(time, wave) then updatelog("Sent ready vote") bytenet.ReadyVote.Vote.send(true) end
end

function api:Skip(time: number, wave: number)
	if waitTime(time, wave) then updatelog(`Skipping Wave {wave}`) replicatedstorage:WaitForChild("ByteNetReliable"):FireServer(buffer.fromstring("\148\001")) end
end

function api:AutoSkip(enable: number, time: number, wave: number)
	if waitTime(time, wave) then updatelog(`AutoSkip set to {tostring(enable)}`) bytenet.SkipWave.ToggleAutoSkip.send(enable) end
end

function api:Place(tower: string, position: Vector3, time: number, wave: number)
	if waitTime(time, wave) then	
		env.totalplacedtowers = env.totalplacedtowers + 1
		
		updatelog(`Placed Tower {tower}`)
		towers.PlaceTower.invoke({["Position"] = position, ["Rotation"] = 0, ["TowerID"] = tower})
	end
end

function api:Upgrade(tower: number, time: number, wave: number)
	if waitTime(time, wave) then
		updatelog(`Upgraded Tower {tower}`)
		
		local realindex = firsttower + (tower - 1)
		towers.UpgradeTower.invoke(realindex)
	end
end

function api:SetTarget(tower: number, target: string, time: number, wave: number)
	if waitTime(time, wave) then
		updatelog(`Changed Tower {tower} Target to {target} `)
	
		local realindex = firsttower + (tower - 1)
		towers.SetTargetMode.send({["UID"] = (realindex), ["TargetMode"] = target})
	end
end

function api:Sell(tower: number, time: number, wave: number)
	if waitTime(time, wave) then
		updatelog(`Sold Tower {tower}`) 
		
		local realindex = firsttower + (tower - 1)
		towers.SellTower.invoke(realindex)
	end
end

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




