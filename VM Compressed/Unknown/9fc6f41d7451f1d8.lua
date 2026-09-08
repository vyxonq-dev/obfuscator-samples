-- Shitty X Unified Macro (UI + Recorder + Player) - Fixed with Combo instead of Dropdown

-- Services
local RS = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LP = Players.LocalPlayer

-- UI Library
local library = loadstring(game:HttpGet('https://raw.githubusercontent.com/ovoch228/depthsoimgui/refs/heads/main/library'))()

-- ByteNet / Services
local teamwork = RS:WaitForChild("Teawork")
local client = teamwork:WaitForChild("Client")
local shared = teamwork:WaitForChild("Shared")

local bytenet = require(shared.Services.ByteNetworking)
local modifiersmodule = require(client.Services.Game.ModifierController)
local datamodule = require(client.Services.DataSync)

local towers = bytenet.Towers
local mapinfo = RS:WaitForChild("RoundInfo")
local roundresultui = LP.PlayerGui:WaitForChild("GameUI"):WaitForChild("RoundResult")

-- Global State
local env = getgenv()
env.StratName = env.StratName or "Strat"
env.timer = 0
env.wave = mapinfo:GetAttribute("Wave") or 1
env.map = mapinfo:GetAttribute("Map")
env.modifiers = modifiersmodule.GetModifiers()
env.totalplaced = 0
env.firsttower = 1
env.isroundover = false
env.recording = false
env.selectedMacro = nil

-- Timer
task.spawn(function()
	local last = os.time()
	while true do
		env.timer = (os.time() - last) * 2
		task.wait(0.25)
	end
end)

mapinfo:GetAttributeChangedSignal("Wave"):Connect(function()
	env.wave = mapinfo:GetAttribute("Wave")
end)

roundresultui:GetPropertyChangedSignal("Visible"):Connect(function()
	env.isroundover = roundresultui.Visible
end)

-- Logger
local function now()
	return DateTime.now():FormatLocalTime("HH:mm:ss", "en-us")
end

-- UI
local window = library:CreateWindow({
	Title = "Shitty X",
	Size = UDim2.new(0, 350, 0, 370),
	Position = UDim2.new(0.5, 0, 0, 70),
	NoResize = false
})
window:Center()

local playtab = window:CreateTab({ Name = "Macro Player", Visible = true })
local rectab = window:CreateTab({ Name = "Recorder", Visible = true })
local logstab = window:CreateTab({ Name = "Logs", Visible = true })

local nameLabel = rectab:Label({ Text = "StratName: " .. env.StratName })
rectab:InputText({
	Label = "",
	PlaceHolder = "Macro Name",
	Callback = function(t)
		env.StratName = t.Value
		nameLabel:SetText("StratName: " .. env.StratName)
	end
})

-- Logs
local loglabel = logstab:Label({ Label = "Last Log: Idle" })
logstab:Separator({ Text = "Logs:" })
local logs = logstab:Console({
	Text = "",
	ReadOnly = true,
	Fill = true,
	AutoScroll = true,
	MaxLines = 200
})

local function updatelog(txt)
	logs:AppendText(now() .. ": " .. txt .. "\n")
	loglabel:SetText("Last Log: " .. txt)
end

-- Helpers
local function getMacros()
	local files = {}
	for _, f in ipairs(listfiles("")) do
		if f:sub(-4) == ".txt" then
			table.insert(files, f)
		end
	end
	return files
end

-- Macro selection (using Combo instead of Dropdown)
local macroCombo

local function createMacroCombo()
	local files = getMacros()
	
	-- Clean up old combo if exists
	if macroCombo and macroCombo.Remove then
		macroCombo:Remove()
	elseif macroCombo and macroCombo.Destroy then
		macroCombo:Destroy()
	end
	
	macroCombo = playtab:Combo({
		Label = "Select Macro",
		Placeholder = "Choose macro... (" .. #files .. " found)",
		Items = files,
		Callback = function(self, value)
			env.selectedMacro = value
			updatelog("Macro selected: " .. (value or "none"))
		end
	})
end

createMacroCombo()  -- Create initially

playtab:Button({
	Text = "Refresh Macros",
	Callback = function()
		createMacroCombo()
		updatelog("Macro list refreshed (" .. #getMacros() .. " items)")
	end
})

playtab:Button({
	Text = "Play Selected Macro",
	Callback = function()
		if not env.selectedMacro then
			updatelog("No macro selected")
			return
		end
		
		updatelog("Attempting to play: " .. env.selectedMacro)
		
		local success, err = pcall(function()
			loadstring(readfile(env.selectedMacro))()
		end)
		
		if success then
			updatelog("Macro started successfully")
		else
			updatelog("Error running macro: " .. tostring(err))
		end
	end
})

-- API (unchanged)
local api = {}

local function waitTime(t, w)
	while env.wave < w and not env.isroundover do task.wait(0.05) end
	while env.timer < t and not env.isroundover do task.wait(0.05) end
	return not env.isroundover
end

function api:Start()
	bytenet.Timescale.SetTimescale.send(2)
end

function api:Ready(t, w)
	if waitTime(t, w) then
		bytenet.ReadyVote.Vote.send(true)
	end
end

function api:Skip(t, w)
	if waitTime(t, w) then
		RS.ByteNetReliable:FireServer(buffer.fromstring("\148\001"))
	end
end

function api:AutoSkip(v, t, w)
	if waitTime(t, w) then
		bytenet.SkipWave.ToggleAutoSkip.send(v)
	end
end

function api:Place(id, pos, t, w)
	if waitTime(t, w) then
		env.totalplaced = env.totalplaced + 1
		towers.PlaceTower.invoke({ TowerID = id, Position = pos, Rotation = 0 })
	end
end

function api:Upgrade(i, t, w)
	if waitTime(t, w) then
		towers.UpgradeTower.invoke(env.firsttower + (i - 1))
	end
end

function api:SetTarget(i, mode, t, w)
	if waitTime(t, w) then
		towers.SetTargetMode.send({
			UID = env.firsttower + (i - 1),
			TargetMode = mode
		})
	end
end

function api:Sell(i, t, w)
	if waitTime(t, w) then
		towers.SellTower.invoke(env.firsttower + (i - 1))
	end
end

function api:PlayAgain()
	while not env.isroundover do task.wait(0.25) end
	env.firsttower = env.totalplaced + 1
	env.totalplaced = 0
	env.timer = 0
	env.wave = 1
	task.wait(1)
	bytenet.RoundResult.VoteForRestart.send(true)
end

-- Recorder Controls
rectab:Button({
	Text = "Start Recording",
	Callback = function()
		local towersEquipped = datamodule:Get().EquippedTowers
		local mods = modifiersmodule.GetModifiers()

		local t = {}
		for _, v in ipairs(towersEquipped) do
			table.insert(t, "'" .. v .. "'")
		end

		local m = {}
		for _, v in ipairs(mods) do
			table.insert(m, "'" .. v .. "'")
		end

		writefile(env.StratName .. ".txt",
			"local api = loadstring(game:HttpGet('https://raw.githubusercontent.com/loudman4205-cloud/Retro-tower-defense/refs/heads/main/Api%202x%20speed'))()\n\n" ..
			"api:Loadout({" .. table.concat(t, ", ") .. "})\n" ..
			"api:Map('" .. env.map .. "', {" .. table.concat(m, ", ") .. "})\n\n" ..
			"api:Start()\n\napi:Loop(function()\n"
		)

		env.recording = true
		updatelog("Recording started: " .. env.StratName .. ".txt")
	end
})

rectab:Button({
	Text = "Stop Recording",
	Callback = function()
		if env.recording then
			appendfile(env.StratName .. ".txt", "end)\n")
			env.recording = false
			updatelog("Recording stopped")
			createMacroCombo()  -- refresh combo after new file created
		end
	end
})

-- Hooks (unchanged)
local hooks = {}

local function record(line)
	if env.recording then
		appendfile(env.StratName .. ".txt", "\t" .. line .. "\n")
	end
end

hooks.place = hookfunction(towers.PlaceTower.invoke, function(d)
	if checkcaller() then return hooks.place(d) end
	record("api:Place('" .. d.TowerID .. "', Vector3.new(" .. d.Position.X .. "," .. d.Position.Y .. "," .. d.Position.Z .. "), " .. math.floor(env.timer) .. ", " .. env.wave .. ")")
	return hooks.place(d)
end)

hooks.upgrade = hookfunction(towers.UpgradeTower.invoke, function(i)
	if checkcaller() then return hooks.upgrade(i) end
	record("api:Upgrade(" .. i .. ", " .. math.floor(env.timer) .. ", " .. env.wave .. ")")
	return hooks.upgrade(i)
end)

hooks.sell = hookfunction(towers.SellTower.invoke, function(i)
	if checkcaller() then return hooks.sell(i) end
	record("api:Sell(" .. i .. ", " .. math.floor(env.timer) .. ", " .. env.wave .. ")")
	return hooks.sell(i)
end)

hooks.target = hookfunction(towers.SetTargetMode.send, function(d)
	if checkcaller() then return hooks.target(d) end
	record("api:SetTarget(" .. d.UID .. ", '" .. d.TargetMode .. "', " .. math.floor(env.timer) .. ", " .. env.wave .. ")")
	return hooks.target(d)
end)

hooks.ready = hookfunction(bytenet.ReadyVote.Vote.send, function(v)
	if checkcaller() then return hooks.ready(v) end
	record("api:Ready(" .. math.floor(env.timer) .. ", " .. env.wave .. ")")
	return hooks.ready(v)
end)

hooks.autoskip = hookfunction(bytenet.SkipWave.ToggleAutoSkip.send, function(v)
	if checkcaller() then return hooks.autoskip(v) end
	record("api:AutoSkip(" .. tostring(v) .. ", " .. math.floor(env.timer) .. ", " .. env.wave .. ")")
	return hooks.autoskip(v)
end)

updatelog("Macro UI loaded (with Combo fix)")
window:ShowTab(playtab)
