local TOOL_WAIT = {
	["Wood Pick"]        = {H=58, O=61},
	["Ice Pick"]         = {H=49, O=51},
	["Stone Pick"]       = {H=40, O=42},
	["Turquoise Pick"]   = {H=30, O=32},
	["Amethyst Pick"]    = {H=25, O=26},
	["Iron Pick"]        = {H=21, O=22},
	["Gold Pick"]        = {H=19, O=20},
	["Crystal Pick"]     = {H=16, O=17},
	["Rhodonite Pick"]   = {H=15, O=16},
	["Meteorite Pick"]   = {H=14, O=14},
	["Green Quartz Pick"]= {H=12, O=12},
	["Sapphire Pick"]    = {H=11, O=11},
	["Tanzanite Pick"]   = {H=10, O=11},
	["Apatite Pick"]     = {H=10, O=10},
	["Shell Pick"]       = {H=9,  O=9},
	["Ruby Pick"]        = {H=9,  O=9},
	["Topaz Pick"]       = {H=8,  O=9},
	["Titanium Pick"]    = {H=8,  O=8},
	["Jade Pick"]        = {H=8,  O=8},
	["Obsidian Pick"]    = {H=8,  O=8},
	["Fire Opal Pick"]   = {H=7,  O=8},
	["Hiddenite Pick"]   = {H=7,  O=7},
	["Olivine Pick"]     = {H=7,  O=7},
	["Serpentine Pick"]  = {H=7,  O=7},
	["Sodalite Pick"]    = {H=7,  O=7},
	["Spinel Pick"]      = {H=7,  O=7},

	["Rock"]                  = {H=90, O=95},
	["Star Club"]             = {H=16, O=17},
	["Jade Dragon Tool"]      = {H=8, O=8},
	["Legendary Hook"]        = {H=13, O=13},
	["Lightning Tool"]        = {H=11, O=11},
	["Valentines Tool"]       = {H=16, O=17},
	["Gingerbread Cookie Tool"]={H=11, O=11},
	["Christmas Tree Tool"]   = {H=10, O=10},
}

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")

local LP = Players.LocalPlayer
local saveFile = "GValuesTLL_" .. LP.UserId .. ".json"

local function safeNotify(title, msg)
	print("["..(title or "Save/Load").."] "..msg)
end

local function saveGValues()
	if not writefile then return end
	local t = {}
	for k,v in pairs(_G) do
		if typeof(v) == "string" or typeof(v) == "number" or typeof(v) == "boolean" then
			t[k] = v
		end
	end
	writefile(saveFile, HttpService:JSONEncode(t))
end

local function loadGValues()
	if not isfile or not readfile or not isfile(saveFile) then return end
	local data = HttpService:JSONDecode(readfile(saveFile))
	for k,v in pairs(data) do
		_G[k] = v
	end
end

_G.tool = _G.tool
_G.pickupEnabled = _G.pickupEnabled or false
_G.webhookEnabled = _G.webhookEnabled or false
_G.discordWebhook = _G.discordWebhook or ""
_G.sellho = _G.sellho or false

_G.execCount = (_G.execCount or 0) + 1
_G.bh = _G.bh or 0
_G.bo = _G.bo or 0
_G.sh = _G.sh or 0
_G.so = _G.so or 0

if not game:IsLoaded() then game.Loaded:Wait() end

local function getStat(name)
	local p = LP:FindFirstChild("PlayerData")
	local s = p and p:FindFirstChild("PRINCIPAL")
	return s and s:FindFirstChild(name) and s[name].Value
end

local function getOres(name)
	local p = LP:FindFirstChild("PlayerData")
	local m = p and p:FindFirstChild("Materials")
	return m and m:FindFirstChild(name) and m[name].Value
end

local function getDevice()
	if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
		return "Mobile"
	elseif UserInputService.KeyboardEnabled then
		return "PC"
	end
	return "Unknown"
end

local function getThumbnail()
	local req = syn and syn.request or http_request or request
	if not req then return nil end
	local response = req({
		Url = ("https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=%d&size=150x150&format=Png"):format(LP.UserId),
		Method = "GET"
	})
	if not response or not response.Body then return nil end
	local data = HttpService:JSONDecode(response.Body)
	if data and data.data and data.data[1] and data.data[1].imageUrl then
		return data.data[1].imageUrl
	end
	return nil
end

local function sendWebhook(fields)
	if not (_G.webhookEnabled and _G.discordWebhook ~= "") then return end

	local payload = {
		username = "Farm Log",
		content = nil,
		embeds = {{
			title = "Overall Stats",
			color = 6629386,
			thumbnail = { url = getThumbnail() },
			fields = fields,
			footer = { text = "Execution #" .. _G.execCount },
			timestamp = DateTime.now():ToIsoDate()
		}}
	}

	local req = syn and syn.request or http_request or request
	if req then
		pcall(function()
			req({
				Url = _G.discordWebhook,
				Method = "POST",
				Headers = {["Content-Type"] = "application/json"},
				Body = HttpService:JSONEncode(payload)
			})
		end)
	end
end

local Events = ReplicatedStorage:WaitForChild("Events")
Events.StartGame:FireServer()
task.wait(3)

local MineEvent = Events.Mine
local SetTool = Events.SetTool
local PickupEvent = Events.Pickup

local function getChar()
	return LP.Character or LP.CharacterAdded:Wait()
end

local function getHRP()
	return getChar():WaitForChild("HumanoidRootPart")
end

task.spawn(function()
	while task.wait(0.25) do
		MineEvent:FireServer()
	end
end)

SetTool:FireServer(_G.tool)

task.spawn(function()
	while task.wait(2) do
		SetTool:FireServer(_G.tool)
	end
end)

loadGValues()

task.spawn(function()
	task.wait(5)
	saveGValues()
	while task.wait(10) do
		saveGValues()
	end
end)

local PICKUP_DELAY = 0.01
local PICKUP_DISTANCE = 15
local AllowedItems = {Coin=true,Experience=true,Hiddenite=true,Olivine=true}

local function getItemPosition(item)
	if item:IsA("BasePart") then return item.Position end
	if item:IsA("Model") then
		local p = item.PrimaryPart or item:FindFirstChildWhichIsA("BasePart", true)
		return p and p.Position
	end
end

task.spawn(function()
	while task.wait(PICKUP_DELAY) do
		if not _G.pickupEnabled then continue end
		local hrp = getHRP()
		local folder = workspace:FindFirstChild("Items")
		if not folder then continue end
		for _,item in ipairs(folder:GetChildren()) do
			if AllowedItems[item.Name] then
				local pos = getItemPosition(item)
				if pos and (hrp.Position - pos).Magnitude <= PICKUP_DISTANCE then
					pcall(function()
						PickupEvent:FireServer(item)
					end)
				end
			end
		end
	end
end)

local HPositions = {
	Vector3.new(465,-69,-631),
	Vector3.new(465,-68,-603),
	Vector3.new(382,-63,-597),
}

local OPositions = {
	Vector3.new(1157,-319,-597),
	Vector3.new(1136,-314,-616),
	Vector3.new(1113,-314,-605),
}

local waitData = TOOL_WAIT[_G.tool] or {H=8,O=8}

task.spawn(function()
	local hrp = getHRP()

	for _,p in ipairs(HPositions) do
		hrp.CFrame = CFrame.new(p)
		task.wait(waitData.H)
	end

	for _,p in ipairs(OPositions) do
		hrp.CFrame = CFrame.new(p)
		task.wait(waitData.O)
	end

	_G.bh = getOres("Hiddenite")
	_G.bo = getOres("Olivine")

	sendWebhook({
		{name="👤 User", value=LP.DisplayName.." ("..LP.Name..")", inline=false},
		{name="🆔 User ID", value=LP.UserId, inline=true},
		{name="📱 Device", value=getDevice(), inline=true},
		{name="📆 Account Age", value=LP.AccountAge.." days", inline=true},
		{name="🕒 Time", value=os.date("%Y-%m-%d %H:%M:%S"), inline=false},
		{name="⚒️ Tool", value=tostring(_G.tool), inline=true},
		{name="⏱️ Wait (H/O)", value=waitData.H.." / "..waitData.O.."s", inline=true},
		{name="💰 Coins", value=getStat("Coin") or "N/A", inline=true},
		{name="⭐ Stars", value=getStat("Star") or "N/A", inline=true},
		{name="🌟 Level", value=tostring(getStat("Experience") or "N/A"), inline=true},
		{name="✨ Experience", value=tostring(getStat("XP") or "N/A"), inline=true},
		{name="🟦 Hiddenite Total", value=tostring(_G.bh), inline=true},
		{name="🟩 Olivine Total", value=tostring(_G.bo), inline=true},
	})

	if _G.sellho then
		Events.Market:FireServer("Hiddenite",4)
		Events.Market:FireServer("Olivine",4)
	end

	task.wait(2.5)

	if #Players:GetPlayers() <= 1 then
		LP:Kick("Rejoining...")
		task.wait()
		TeleportService:Teleport(game.PlaceId, LP)
	else
		TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LP)
	end
end)

if queue_on_teleport then
	queue_on_teleport([[
		loadstring(game:HttpGet("https://raw.githubusercontent.com/N0ne-ExIStenc3/boblus-scriptz/refs/heads/main/tllf3"))()
	]])
end
