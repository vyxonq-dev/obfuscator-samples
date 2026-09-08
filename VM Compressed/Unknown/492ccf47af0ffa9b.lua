if game.PlaceId ~= 124069847780670 then return end

local replicatedstorage = game:GetService("ReplicatedStorage")

local library = loadstring(game:HttpGet('https://raw.githubusercontent.com/ovoch228/depthsoimgui/refs/heads/main/library'))()

local teamwork = replicatedstorage.Teawork
local client = teamwork.Client
local sharedd = teamwork.Shared

local bytenet = require(sharedd.Services.ByteNetworking)
local modifiersmodule = require(client.Services.Game.ModifierController)
local datamodule = require(client.Services.DataSync)

local towers = bytenet.Towers
local mapinfo = replicatedstorage.RoundInfo

local ostime = os.time
local concat = table.concat
local taskwait = task.wait

local equippedtowers = datamodule:Get().EquippedTowers

getgenv().StratName = "Strat"

getgenv().timer = 0 -- seconds
getgenv().wave = mapinfo:GetAttribute("Wave")

getgenv().map = mapinfo:GetAttribute("Map")
getgenv().modifiers = modifiersmodule.GetModifiers()

getgenv().plrtowers = {}

getgenv().destroyui = false

getgenv().temp = {modifiers = {}, towers = {}}
getgenv().hooks = {}

for i = 1, #modifiers do
	temp.modifiers[i] = `'{modifiers[i]}'`
end

for i, v in equippedtowers do
	table.insert(temp.towers, `'{v}'`)
end

local window = library:CreateWindow({
    Title = "Shitty X",
    Size = UDim2.new(0, 350, 0, 370),
    Position = UDim2.new(0.5, 0, 0, 70),
    NoResize = false
})

window:Center()

modifiers = `\{{concat(temp.modifiers, ", ")}\}`
plrtowers = `\{{concat(temp.towers, ", ")}\}`

temp = nil

local filetab = window:CreateTab({
    Name = "Recorder",
    Visible = true
})

local filename = filetab:Label({
    Text = "StratName: " .. getgenv().StratName
})

local textbox = filetab:InputText({
    Label = "",
    PlaceHolder = "Enter Name: ",
    Callback = function(text)
        getgenv().StratName = text.Value
        filename:SetText("StratName: " .. text.Value)
    end
})

local writebutton = filetab:Button({
  	Text = "Write File",
    	Callback = function()
   		writefile(getgenv().StratName .. '.txt',
    			"local api = loadstring(game:HttpGet('https://raw.githubusercontent.com/ovoch228/shitty-x/refs/heads/main/rtd/api'))()\n\n" .. 
    			`api:Loadout({plrtowers})\n` ..
    			`api:Map('{map}', {modifiers})\n\n` ..
    			"api:Start()\n\n" ..
    			"api:Loop(function()\n"
    		)
        	
        	getgenv().destroyui = true
 	end
})

while not destroyui do
    taskwait(0.1)
end

writebutton:Destroy()
textbox:Destroy()

taskwait(1)

local recordertab = filetab
local logstab = window:CreateTab({
    Name = "Logs",
    Visible = true
})

local loglabel = recordertab:Label({
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

window:ShowTab(recordertab)
updatelog("Voting")

while #mapinfo:GetAttribute("Difficulty") == 0 do
  	taskwait(0.05)
end 

local lasttime = ostime()
task.spawn(function()
	while true do
		timer = (ostime() - lasttime) * 2
		taskwait(0.25)
	end	
end)


updatelog("Game Started")
appendfile(getgenv().StratName..".txt", `\t api:Difficulty('{mapinfo:GetAttribute("Difficulty")}')\n`)

mapinfo:GetAttributeChangedSignal("Wave"):Connect(function()
	wave = mapinfo:GetAttribute("Wave")
end)

-- Main Record Macros
bytenet.RoundResult.Show.listen(function() -- end screen
	updatelog("Macro Recorded!")
	
	appendfile(getgenv().StratName..".txt", `\t api:PlayAgain() \n end)`)
end)

hooks["ready"] = hookfunction(bytenet.ReadyVote.Vote.send, function(value)
	if checkcaller() then return hooks["ready"](value) end

	updatelog("Sent ready vote")
	appendfile(getgenv().StratName..".txt", `\t api:Ready({timer}, {wave})\n`)	
	return hooks["ready"](value)
end)

hooks["skip"] = hookfunction(bytenet.SkipWave.Vote.send, function(value)
	if checkcaller() then return hooks["skip"](value) end

	updatelog("Skipped Wave " .. wave)
	appendfile(getgenv().StratName..".txt", `\t api:Skip({timer}, {wave})\n`)
	return hooks["skip"](value)
end)

hooks["autoskip"] = hookfunction(bytenet.SkipWave.ToggleAutoSkip.send, function(value)
	if checkcaller() then return hooks["autoskip"](value) end

	updatelog("AutoSkip set to: " .. tostring(value))
	appendfile(getgenv().StratName..".txt", `\t api:AutoSkip({value}, {timer}, {wave})\n`)
	return hooks["autoskip"](value)
end)

hooks["place"] = hookfunction(towers.PlaceTower.invoke, function(towerdata)	
	if checkcaller() then return hooks["place"](towerdata) end

	updatelog(`Placed Tower {towerdata.TowerID}`)
	appendfile(getgenv().StratName..".txt", `\t api:Place('{towerdata.TowerID}', Vector3.new({towerdata.Position}), {timer}, {wave})\n`)
	return hooks["place"](towerdata)
end)

hooks["upgrade"] = hookfunction(towers.UpgradeTower.invoke, function(index)
	if checkcaller() then return hooks["upgrade"](index) end

	updatelog("Upgraded Tower " .. index)
	appendfile(getgenv().StratName..".txt", `\t api:Upgrade({index}, {timer}, {wave})\n`)
	return hooks["upgrade"](index)
end)

hooks["target"] = hookfunction(towers.SetTargetMode.send, function(towerdata)
	if checkcaller() then return hooks["target"](towerdata) end

	updatelog(`Changed Tower {towerdata.UID} Target to {towerdata.TargetMode} `)
	appendfile(getgenv().StratName..".txt", `\t api:SetTarget({towerdata.UID}, '{towerdata.TargetMode}', {timer}, {wave}) \n`)
	return hooks["target"](towerdata)
end)

hooks["sell"] = hookfunction(towers.SellTower.invoke, function(index)
	if checkcaller() then return hooks["sell"](index) end

	updatelog("Sold Tower " .. index)
	appendfile(getgenv().StratName..".txt", `\t api:Sell({index}, {timer}, {wave}) \n`)
	return hooks["sell"](index)
end)



