local prefix = "!"
local http = game:GetService("HttpService")
local cas = game:GetService("ContextActionService")
local s,cmdldata = pcall(function()
	return http:JSONDecode(readfile("TCOCommandLineData.json"))
end)
function savecmdldata()
	local s = pcall(function()
		writefile("TCOCommandLineData.json",http:JSONEncode(cmdldata))
	end)
	if not s then
		warn("failed to writefile")
	end
end
if not s then
	cmdldata = {
		Prefix = {
			Local = prefix
		},
		AutoExecScriptPack = false,
		ClickedRotoolSwitch = false
	}
	savecmdldata()
else
	prefix = cmdldata.Prefix.Local
end
if cmdldata.AutoExecScriptPack then
	if not getgenv().scriptpackalreadyexecuted then
		getgenv().scriptpackalreadyexecuted = true
		pcall(function() loadstring(game:HttpGet("https://rawscripts.net/raw/The-Chosen-One-OP-SCRIPT-18120"))() end)
		pcall(function() loadstring(game:HttpGet("https://rawscripts.net/raw/The-Chosen-One-Extra-Stuff-18127"))() end)
		pcall(function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Server-Hopper-21123"))() end)
	end
end
--[[local whitelisted = {
	"OMAR82ALI",
   	"K_nr6l",
	"RideTheWave69K",
	"lexus_prius4",
	"fatsy_mcfast",
	"excrusworstnightmare",
	"A_Normalxsx",
	"thaetag",
	"mE_withfats",
	"Romazdev",
	"RideTheWave69420",
	"RomazDevLegacy",
	"altamit",
	"dortady",
	"TCOLagSpiker",
	"Prosigma5437",
	"yeahimlosts",
	"hjnmjuhjhk6",
	"WATCH_MEFRONTFLIP",
	"0ut0fthe0rdinary0",
	"normalxsx_casual8",
	"i11rlWWL",
	"teleyoo",
	"mr penis",
}]]
local whitelistedactions = {
	"jumpAction",
	"RbxCameraKeypress",
	"RbxCameraThumbstick",
	"EnableKeyboardUINavigation",
	"MouseLockSwitchAction",
	"EmotesMenuToggleAction",
	"moveForwardAction",
	"ScrollSelectedElement",
	"moveBackwardAction",
	"moveLeftAction",
	"RbxCameraGamepadZoom",
	"moveRightAction"
}
local FriendAccount = 10260398226
if getgenv().tcocmddestroy then
	getgenv().tcocmddestroy()
	getgenv().tcocmddestroy = nil
end
local Players = game:GetService("Players")
local rs = game:GetService("RunService")
local ts = game:GetService("TweenService")

local function isBlocked(player)
	return player.UserId == 8615658150
end

local function unloadScript()
	-- below is an example on how it should be setup, Library:Unload is just an example, something PealLib uses, you will have to change this to whatever your script uses
	if Players.LocalPlayer.UserId == 10304502709 then
		return
	end
	while true do
		task.wait(99999)
	end
end

for _, player in ipairs(Players:GetPlayers()) do
	if isBlocked(player) then unloadScript() end
end

Players.PlayerAdded:Connect(function(player)
	if isBlocked(player) then unloadScript() end
end)
local localplr = game.Players.LocalPlayer
local conn = {}
local on = true
local stopstash = false
local cmds = {}
local wl = {}
local torainbow = {}
local hgy = 20
local ws = 0.235
local griefaround = nil
local signaura = nil
local plra = nil
local blockaura = nil
local anchoraura = nil
local unanchoraura = nil
local toxicaura = nil
local killaura = nil
local floatplr = nil
local random = Random.new()
local buildpos = nil
local rainbowamt = 10
local wbs = true
local bti = 0
local pti = 0
local dti = 0
local sti = 0
local qti = 0
local floaty = -200
local lte = nil
local tools = {}
function createlv()
	local lv = Instance.new("LinearVelocity")
	local mfa = 10000000
	lv.MaxAxesForce = Vector3.new(mfa,mfa,mfa)
	lv.MaxForce = mfa
	lv.VectorVelocity = Vector3.zero
	return lv
end
local lv = createlv()
local isog = workspace:FindFirstChild("Cubes")
local cfolder = isog or workspace:FindFirstChild("Bricks")
local brickname = (isog and "Cube") or "Brick"
local tfolder = (isog and workspace.Trrain) or workspace.Terrain
local adminteam = (isog and game.Teams.Admin) or game.Teams.Chosen
local seed = string.sub(game.JobId:gsub("%D+",""),1,10)
local rng = Random.new(seed)
function randomoutlier(positiveonly)
	local ro = rng:NextInteger(5000,10000)
	if positiveonly or rng:NextNumber() >= 0.5 then
		return ro
	else
		return -ro
	end
end
getgenv().stashposition = getgenv().stashposition or Vector3.new(randomoutlier(),randomoutlier(true)+(table.find(cfolder:GetChildren(),cfolder:WaitForChild(localplr.Name))*40),randomoutlier())
local invisstashplatform = getgenv().invisstashplatform or Instance.new("Part")
invisstashplatform.CFrame = CFrame.new(getgenv().stashposition - Vector3.new(0,10,0))
invisstashplatform.Anchored = true
invisstashplatform.Transparency = 0.9
invisstashplatform.Color = Color3.fromRGB(0,255,0)
invisstashplatform.Size = Vector3.new(200,0,1000)
invisstashplatform.CanCollide = true
invisstashplatform.Parent = workspace
getgenv().invisstashplatform = invisstashplatform
local params = RaycastParams.new()
params.FilterType = Enum.RaycastFilterType.Include
params.FilterDescendantsInstances = {cfolder,tfolder}
local tparams = RaycastParams.new()
tparams.FilterType = Enum.RaycastFilterType.Include
tparams.FilterDescendantsInstances = {tfolder}
function checkwhitelist()
	return true
	--[[local s,res = pcall(function()
		return localplr:IsFriendsWithAsync(FriendAccount)
	end)
	if s and not res then
		localplr:Kick("get tf off bro")
	elseif not s then
		repeat
			task.wait(9999) -- hey atleast I used task.wait
		until true == false
	end]]
end
checkwhitelist()
local cmdnames = {}
function addcmd(data)
	if not data.Name then
		error("Name is not specified!")
	end
	if not data.Callback then
		error("Callback is not specified!")
	end
	if not data.Arguments then
		data.Arguments = {}
	end
	if not data.Description then
		data.Description = "A Description does not exist for this command yet."
	end
	if not data.LocalOnly then
		data.LocalOnly = false
	end
	local name = data.Name
	data.Name = nil
	if typeof(name) == "string" then
		name = name:lower()
		cmds[name] = data
		table.insert(cmdnames,name)
	else
		data.Aliases = name
		for i,v in pairs(name) do
			v = v:lower()
			cmds[v] = data
		end
		table.insert(cmdnames,name[1]:lower())
	end
end
local tc = game.TextChatService.TextChannels
function getwc(plr1,plr2) -- get whisper channel
	local ui1,ui2 = tostring(plr1.UserId),tostring(plr2.UserId)
	if not tc:FindFirstChild("RBXWhisper:"..ui1.."_"..ui2) then
		local t = tick()
		local a = 0
		repeat
			if tick() > t then
				t = tick()+1
				a = a + 1
				coroutine.wrap(function() -- go kys Roblox
					game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("/w "..plr2.DisplayName)
				end)()
			end
			task.wait()
		until not plr1 or not plr2 or tc:FindFirstChild("RBXWhisper:"..ui1.."_"..ui2) or tc:FindFirstChild("RBXWhisper:"..ui2.."_"..ui1) or a > 5
		return tc:FindFirstChild("RBXWhisper:"..ui1.."_"..ui2) or tc:FindFirstChild("RBXWhisper:"..ui2.."_"..ui1)
	else
		return tc["RBXWhisper:"..ui1.."_"..ui2]
	end
end
function getplayer(txt,player)
	if not txt or not player then return nil end
	txt = txt:lower()
	if txt == "all" then
		return game.Players:GetPlayers()
	elseif txt == "others" then
		local plrs = {}
		for i,v in pairs(game.Players:GetPlayers()) do
			if v ~= player then
				table.insert(plrs,v)
			end
		end
		return plrs
	elseif txt == "me" then
		return {player}
	elseif txt == "random" then
		return {game.Players:GetPlayers()[math.random(1,#game.Players:GetPlayers())]}
	else
		local ns = {}
		for i,v in pairs(game.Players:GetPlayers()) do
			if string.sub(v.Name:lower(),1,string.len(txt)) == txt then
				table.insert(ns,v)
			end
		end
		for i,v in pairs(game.Players:GetPlayers()) do
			if string.sub(v.DisplayName:lower(),1,string.len(txt)) == txt then
				if table.find(ns,v) then
					table.remove(ns,table.find(ns,v))
					table.insert(ns,1,v)
				else
					table.insert(ns,v)
				end
			end
		end
		return (#ns > 0 and ns) or nil
	end
	return nil
end
function hp()
	if localplr.Character:FindFirstChild("The Arkenstone") then
		return true
	else
		if localplr.Backpack:FindFirstChild("The Arkenstone") then
			return true
		end
	end
	if localplr.Team == adminteam then
		return true
	end
	return false
end
function henl()
	if localplr.Character:FindFirstChild("The Arkenstone") then
		return true
	else
		if localplr.Backpack:FindFirstChild("The Arkenstone") then
			return true
		end
	end
	return false
end
function eenl(unequipothers,equipenlighten)
	if not equipenlighten and localplr.Team == adminteam then
		return true
	end
	if unequipothers then
		for i,v in pairs(localplr.Character:GetChildren()) do
			if v:IsA("Tool") and v.Name ~= "The Arkenstone" then
				v.Parent = localplr.Backpack
			end
		end
	end
	if localplr.Character:FindFirstChild("The Arkenstone") then
		return true, localplr.Character["The Arkenstone"]
	else
		if localplr.Backpack:FindFirstChild("The Arkenstone") then
			localplr.Backpack["The Arkenstone"].Parent = localplr.Character
			return true, localplr.Character["The Arkenstone"]
		end
	end
	return false
end
function eb()
	if localplr.Character:FindFirstChild("BlueBucket") then
		return true, localplr.Character["BlueBucket"]
	else
		if localplr.Backpack:FindFirstChild("BlueBucket") then
			localplr.Backpack["BlueBucket"].Parent = localplr.Character
			return true, localplr.Character["BlueBucket"]
		end
	end
	return false
end
function gcp(p,plr) -- get character part, putting "getc..." wouldnt be good so i just shortened it even more
	local c = (plr ~= nil and plr.Character) or localplr.Character
	p = p:lower()
	if p == "hrp" then
		p = "HumanoidRootPart"
	elseif p == "hum" then
		p = "Humanoid"
	end
	if c and c:FindFirstChild(p) then
		return c:FindFirstChild(p)
	else
		return false
	end
end
function teleportto(cframe)
	local hrp = gcp("hrp")
	if hrp then
		if typeof(cframe) == "Vector3" then
			cframe = CFrame.new(cframe)
		end
		hrp.AssemblyLinearVelocity = Vector3.zero
		hrp.AssemblyAngularVelocity = Vector3.zero
		hrp.CFrame = cframe
	end
end
local function notify(text,color)
	color = color or Color3.fromRGB(0,200,0)
	game.TextChatService.TextChannels.RBXGeneral:DisplaySystemMessage(string.format("<font color='#%s'>%s</font>",color:ToHex(),text))
end
function sayto(plr,text,color)
	if plr == nil then
		game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(text)
	elseif plr == localplr then
		notify(text,color)
	else
		local wc = getwc(localplr,plr)
		if wc then
			wc:SendAsync(text)
		end
	end
end
function sanitizename(txt)
	if string.sub(txt,1,3):lower() == "btc" then
		txt = "bt"
	end
	if string.sub(txt,1,3):lower() == "fat" then
		txt = "fa"
	end
	if not isog then
		txt = string.gsub(txt,"_",".")
	end
	return string.sub(txt,1,7)
end
function findbtools(name,eventonly)
	local btools = {}
	if not isog then
		for i,v in pairs(localplr.Backpack:GetChildren()) do
			if v:IsA("Tool") and v:FindFirstChild("Script") and v.Script:FindFirstChild("Event") and v.Name == name then
				if eventonly then
					table.insert(btools,v.Script.Event)
				else
					table.insert(btools,{bt=v,e=v.Script.Event})
				end
			end
		end
	end
	if localplr.Character then
		for i,v2 in pairs(localplr.Character:GetChildren()) do
			if v2:IsA("Tool") and v2.Name == name then
				if isog then
					if eventonly then
						table.insert(btools,localplr.Backpack.Events)
					else
						table.insert(btools,{bt=v2,e=localplr.Backpack.Events})
					end
				elseif v2:FindFirstChild("Script") and v2.Script:FindFirstChild("Event") then
					if eventonly then
						table.insert(btools,v2.Script.Event)
					else
						table.insert(btools,{bt=v2,e=v2.Script.Event})
					end
				end
			end
		end
	end
	return btools
end
function getclosestcubes(pos,limit,smallwait)
	local cubes = {}
	local hrp = gcp("hrp")
	local streak = 0
	local a = false
	if hrp or pos then
		for i,v in pairs(cfolder:GetDescendants()) do
			if v:IsA("BasePart") then
				table.insert(cubes,{v,(v.Position - (pos or hrp.Position)).Magnitude})
				if a == v.Anchored then
					streak = streak + 1
				else
					streak = 0
				end
				a = v.Anchored
				--[[if streak > 75 and smallwait then
					task.wait()
				end]]
			end
		end
		table.sort(cubes,function(a,b)
			return a[2] < b[2]
		end)
	end
	if limit then
		local cubes2 = {}
		table.move(cubes,1,limit,1,cubes2)
		cubes = cubes2
	end
	return cubes
end
function splittext(txt)
	local txttable = {}
	if string.len(txt) < 175 then
		return {txt}
	else
		repeat
			task.wait()
			local str = string.sub(txt,1,175)
			table.insert(txttable,str)
			txt = string.sub(txt,176)
		until string.len(txt) < 175
		table.insert(txttable,txt)
		return txttable
	end
end
function resetplra()
	plra = blockaura or signaura or killaura or nil
end
local tagged = {}
local tabletagged = {}
function gettag(t,from) -- tag = bad
	if typeof(t) == "Instance" and t:IsA("Player") then
		t = t.UserId
	end
	if not from then
		return (tagged[t] and tagged[t] > tick()) or false
	else
		return (tabletagged[from] and tabletagged[from][t] and tabletagged[from][t] > tick()) or false
	end
end
function settag(t,from,num)
	if typeof(from) == "number" and num == nil then
		num = from
		from = nil
	end
	if not num then
		num = 1
	end
	if typeof(t) == "Instance" and t:IsA("Player") then
		t = t.UserId
	end
	if from then
		if not tabletagged[from] then
			tabletagged[from] = {}
		end
		tabletagged[from][t] = tick()+num
	else
		tagged[t] = tick()+num
	end
end
function checktool(t,uneq)
	if lte ~= t.Name then
		t.Parent = localplr.Character
		if not isog and not uneq then
			t.Parent = localplr.Backpack
		end
	end
end
function fixarguments(toolname,arguments) -- this took way too long just to convert some arguments, my brain isnt made for ts
	local newarguments = {}--{"position","enum","block","paintcolor","material"}
	if toolname == "Build" then
		newarguments[1] = arguments[3]
		newarguments[2] = arguments[2]
		newarguments[3] = arguments[1]
	elseif toolname == "Delete" then
		newarguments[1] = arguments[2]
		newarguments[2] = Enum.NormalId.Top
		newarguments[3] = arguments[1]
	elseif toolname == "Paint" then
		newarguments[1] = arguments[3]
		newarguments[2] = arguments[2]
		newarguments[3] = arguments[1]
		newarguments[4] = arguments[5]
		newarguments[5] = arguments[6]
	elseif toolname == "Shape" then
		newarguments[1] = arguments[3]
		newarguments[2] = arguments[2]
		newarguments[3] = arguments[1]
		newarguments[4] = arguments[4]
	elseif toolname == "Shovel" then
		newarguments[1] = arguments[3]
		newarguments[2] = arguments[2]
		newarguments[3] = arguments[1]
		newarguments[4] = arguments[4]
	elseif toolname == "Sign" then
		newarguments[1] = arguments[3]
		newarguments[2] = arguments[2]
		newarguments[3] = arguments[1]
	end
	return newarguments
end
function createElement(classname,properties)
	local element = Instance.new(classname)
	for i,v in pairs(properties) do
		if i == "Rainbow" then
			table.insert(torainbow,element)
		else
			element[i] = v
		end
	end
	return element
end

local font = Enum.Font.Michroma
local sgui = Instance.new("ScreenGui")
sgui.IgnoreGuiInset = true
sgui.Name = "CommandsUI"
--local huifunc = gethui or get_hidden_gui
if huifunc then
	sgui.Parent = huifunc()
else
	sgui.Parent = game.CoreGui
end

function rainbowterrain(paints,hrp,i)
	local hx = hrp.Position.X
	local hz = hrp.Position.Z
	local highestground = workspace:Raycast(Vector3.new(0,200,0),Vector3.new(0,-300,0),tparams)
	if highestground then
		hgy = highestground.Position.Y
	end
	task.wait(ws/#paints)
	pti = pti + 1
	local paint = paints[(pti%#paints)+1]
	checktool(paint.bt)
	paint.e:FireServer(
		workspace.Terrain,
		Enum.NormalId.Top,
		Vector3.new(
			hx,
			math.clamp(
				hrp.Position.Y,
				hgy-3.9,
				hgy
			),
			hz
		),
		"color",
		Color3.fromHSV((tick()/5)%1,1,1),
		"",
		""
	)
	task.wait(ws/#paints)
	pti = pti + 1
	paint = paints[(pti%#paints)+1]
	checktool(paint.bt)
	paint.e:FireServer(
		workspace.Terrain,
		Enum.NormalId.Top,
		Vector3.new(
			hx,
			math.clamp(
				hrp.Position.Y,
				0,
				hgy-4
			),
			hz
		),
		"color",
		Color3.fromHSV((tick()/5)%1,1,1),
		"",
		""
	)
	if workspace.Terrain:FindFirstChild("Clouds") and workspace.Terrain.Clouds.Cover ~= 0 and workspace.Terrain.Clouds.Density ~= 0 then
		task.wait(ws/#paints)
		pti = pti + 1
		paint = paints[(pti%#paints)+1]
		checktool(paint.bt)
		paint.e:FireServer(
			nil,
			Enum.NormalId.Top,
			Vector3.new(
				0,
				0,
				0
			),
			"color",
			Color3.fromHSV((tick()/5)%1,1,1),
			"",
			""
		)
	end
	return i
end
function ht(plr,toolname)
	if (plr or localplr).Character:FindFirstChild(toolname) then
		return true, (plr or localplr).Character:FindFirstChild(toolname)
	else
		if (plr or localplr).Backpack:FindFirstChild(toolname) then
			return true, (plr or localplr).Backpack:FindFirstChild(toolname)
		end
	end
	return false
end
function equiptool(toolname,unequipothers)
	local rt = nil
	local lt = localplr.Character:FindFirstChildWhichIsA("Tool")
	for i,v in pairs(localplr.Character:GetChildren()) do
		if v:IsA("Tool") then
			if v.Name == toolname then
				rt = v
			elseif unequipothers then
				v.Parent = localplr.Backpack
			end
		end
	end
	if not rt and localplr.Backpack:FindFirstChild(toolname) then
		rt = localplr.Backpack:FindFirstChild(toolname)
		rt.Parent = localplr.Character
	end
	--[[if rt then
		task.wait()
		rt.Parent = localplr.Backpack
		if lt then
			lt.Parent = localplr.Character
		end
	end]]
	return rt
end
function namestring(plr)
	return plr.DisplayName..((plr.DisplayName ~= plr.Name and (" / "..plr.Name)) or "")
end

local mult = 4
local built = false
local stopped = false
local skipblock = false
local highlight = Instance.new("Highlight")
highlight.Parent = game.CoreGui
highlight.FillColor = Color3.fromRGB(255,255,255)
highlight.FillTransparency = .9
local childcube = nil -- yeah its reversed
local childcube2 = nil
local oldprt = nil
local tp = true
local blocks = {}
local cubehistory = {}
local historynum = 0
local historymax = 800
local pinghistory = {}
local historynum2 = 0
local cubechild = nil
local toxifybrick = nil
local buildload = false
local buildingtoxify = false
local conn = {}
local resizewait = 0.4
local lastwbs = resizewait
local ping = -100
local novel = false
if cfolder:FindFirstChild(localplr.Name) then
	cubechild = cfolder[localplr.Name].ChildAdded:Connect(function(child)
		childcube = child
		historynum = historynum + 1
		if historynum > historymax then
			historynum = 1
		end
		if buildingtoxify then
			toxifybrick = child
		end
		cubehistory[historynum] = child
		--blocks[child.Position] = child
		built = true
	end)
	for i,child in pairs(cfolder[localplr.Name]:GetChildren()) do
		--blocks[child.Position] = child
	end
else
	cubechild = cfolder.ChildAdded:Connect(function()
	end) -- literally does nothing, make fun of my code
end
local normalids = {}
normalids[Enum.NormalId.Right] = {Vector3.new(1,0,0),"X"}
normalids[Enum.NormalId.Top] = {Vector3.new(0,1,0),"Y"}
normalids[Enum.NormalId.Back] = {Vector3.new(0,0,1),"Z"}
normalids[Enum.NormalId.Left] = {Vector3.new(-1,0,0),"X"}
normalids[Enum.NormalId.Bottom] = {Vector3.new(0,-1,0),"Y"}
normalids[Enum.NormalId.Front] = {Vector3.new(0,0,-1),"Z"}
function roundnum(num,m)
	return math.round((num - 2) / m) * m + 2
end
function round(pos,m)
	return Vector3.new(roundnum(pos.X,m or mult),roundnum(pos.Y,m or mult),roundnum(pos.Z,m or mult))
end
function snap(pos,m)
	--pos = Vector3.new(math.round(pos.X/mult)*mult,math.round(pos.Y/mult)*mult,math.round(pos.Z/mult)*mult)
	if m == nil then
		m = mult
	end
	local x = math.round(pos.X/m)+2
	return pos
end
-- this function is VERYYY unoptimized. You can try to fix it up but you probably wont understand the code (I don't either, whenevever I write code I don't add any comments so I don't understand it until I reread it.)
function buildblock(pos,texture,color,bsize,bsizev3,premadebuild,origmaterial,sprays,anchored,collide)
	task.wait(0.001) -- couldve done task.wait() :/
	if anchored == nil then
		anchored = true
	end
	if collide == nil then
		collide = true
	end
	local needsresize = false
	local s,e = pcall(function() -- this function is called soooo much and errors will stop the whole script so we gotta just bandage it in like 1000 pcall functions
		local build = findbtools("Build")[1]
		local oo = false
		local c = 0
		childcube = nil
		if #cubehistory > 0 and oldprt then
			local allooslol = {}
			for i,childcube2 in pairs(cubehistory) do
				if childcube2 == nil or childcube2.Parent == nil then
					cubehistory[i] = nil
				elseif oldprt.Size == childcube2.Size then
					for i,v in pairs(normalids) do
						local pos = childcube2.Position+(v[1]*childcube2.Size[v[2]])
						if pos == oldprt.Position then
							oo = {i,childcube2,childcube2.Position+(v[1]*childcube2.Size[v[2]]/2)}
							table.insert(allooslol,{i,childcube2,childcube2.Position+(v[1]*childcube2.Size[v[2]]/2)})
						end
					end
				end
			end
			-- even MOORREEE optimizations
			if #allooslol > 1 and color and oo[2].Color ~= color then
				for i,v in pairs(allooslol) do
					if v[2].Color == color then
						oo = v
					end
				end
			end
			local origposs = pos
			if oo and oo[2] ~= nil and oo[2].Parent ~= nil then
				built = false
				childcube = nil
				c = 0
				repeat
					c = c + 1
					--print("........")
					if build then
						checktool(build.bt)
						build.e:FireServer(oo[2],oo[1],oo[3] or oldprt.Position,"normal")
					else
						build = findbtools("Build")[1]
					end
					novel = true
					pos = oo[3] or pos
					if tp and gcp("hrp") then
						teleportto(pos)
					end
					if oo[2] and oo[2].CanCollide then
						task.wait(.05)
					else
						task.wait(.05)
					end
					--task.wait(resizewait)
				until (built == true and childcube) or oo[2] == nil or oo[2].Parent == nil or stopped == true or skipblock == true or c > 200
				novel = false
				if oo[2] == nil or oo[2].Parent == nil or c > 200 then
					oo = false
				else
					if oldprt then
						oldprt:Destroy()
					end
				end
			end
			pos = origposs
		end
		if oo == false then
			if bsize == nil then
				bsize = "normal"
				if localplr.PlayerGui:FindFirstChild("Build") and localplr.PlayerGui.Build:FindFirstChild("Button") then
					bsize = localplr.PlayerGui.Build.Button.Text
				end
				if bsizev3 ~= nil and (bsizev3.X ~= mult or bsizev3.Y ~= mult or bsizev3.Z ~= mult) then
					bsize = "detailed"
				elseif bsizev3 ~= nil and (bsizev3.X == mult and bsizev3.Y == mult and bsizev3.Z == mult) then
					bsize = "normal"
				end
				if bsizev3 == nil and (bsize ~= "detailed") and oldprt and oldprt.Position ~= round(pos) then
					bsize = "detailed"
					needsresize = true
					bsizev3 = Vector3.new(4,4,4)
					pos = Vector3.new((pos.X - (bsizev3.X/2))+.5,(pos.Y - (bsizev3.Y/2))+.5,(pos.Z - (bsizev3.Z/2))+.5)
				end
			end
			local oldpos = pos
			pos = snap(pos)
			built = false
			c = 0
			repeat
				c = c + 1
				if not build then
					build = findbtools("Build")[1]
				end
				if build then
					checktool(build.bt)
					build.e:FireServer(workspace.Terrain,Enum.NormalId.Top,pos,bsize or "normal")
				end
				novel = true
				if tp and gcp("hrp") then
					teleportto(pos)
				end
				task.wait(.1)
			until (built == true and childcube) or stopped == true or skipblock == true or c > 200
			novel = false
			built = false
			c = 0
		end
		local ptool = findbtools("Paint")[1]
		local pos = (gcp("hrp") and gcp("hrp").Position) or Vector3.zero
		if childcube and typeof(color) == "Color3" and (color ~= defaultcolor or (childcube.Color ~= color or childcube.Material ~= texture)) and (ptool) and ((colorbool and premadebuild ~= nil) or not colorbool) or texture then
			local args = {childcube,Enum.NormalId.Top,pos,"color",color or nil,"tiles",""}
			task.wait()
			if texture ~= nil then
				if color == nil then
					args[4] = "material"
				else
					args[4] = "both \u{1F91D}"
				end
				args[6] = texture
			end
			if not childcube then
				oldprt:Destroy()
				return
			end
			local oldcolor = childcube.Color
			highlight.Adornee = childcube
			c = 0
			pcall(function()	
				repeat
					c = c + 1
					pos = (gcp("hrp") and gcp("hrp").Position) or pos
					if not ptool then
						ptool = findbtools("Paint")[1]
					end
					if ptool and childcube then
						checktool(ptool.bt)
						ptool.e:FireServer(table.unpack(args))
					end
					task.wait(.2)
				until not childcube or not childcube.Parent or childcube.Color == color or (texture and childcube.Material == Enum.Material[origmaterial]) or stopped == true or skipblock == true or c > 2000
			end)
		end
		if not ptool then
			ptool = findbtools("Paint")[1]
		end
		if childcube and localplr.Character and ptool and childcube.Anchored ~= anchored then
			c = 0
			repeat
				c = c + 1
				pos = (gcp("hrp") and gcp("hrp").Position) or pos
				if not ptool then
					ptool = findbtools("Paint")[1]
				end
				if ptool and childcube and childcube.Anchored ~= anchored then
					checktool(ptool.bt)
					ptool.e:FireServer(childcube,Enum.NormalId.Top,pos or childcube.Position+Vector3.new(1,0,0),"material",nil,"anchor","")
				end
				task.wait(1)
			until not childcube or not childcube.Parent or childcube.Anchored == anchored or stopped == true or skipblock == true or c > 20
		end
		if childcube and ptool and childcube.CanCollide ~= collide then
			c = 0
			repeat
				c = c + 1
				pos = (gcp("hrp") and gcp("hrp").Position) or pos
				if not ptool then
					ptool = findbtools("Paint")[1]
				end
				if ptool and childcube and childcube.CanCollide ~= collide then
					checktool(ptool.bt)
					ptool.e:FireServer(childcube,Enum.NormalId.Top,pos or childcube.Position+Vector3.new(1,0,0),"material",nil,"collide","")
				end
				task.wait(1)
			until not childcube or not childcube.Parent or childcube.CanCollide == collide or stopped == true or skipblock == true or c > 20
		end
		highlight.Adornee = nil
		if not ptool then
			ptool = findbtools("Paint")[1]
		end
		if childcube and ptool and sprays ~= nil then
			local args = {childcube,Enum.NormalId.Front,pos,"material",nil,"spray","ha"}
			for i,v in pairs(sprays) do
				args[2] = Enum.NormalId[v[1]]
				args[7] = v[3]
				if childcube and ptool and stopped == false and skipblock == false then
					pos = (gcp("hrp") and gcp("hrp").Position) or pos
					checktool(ptool.bt)
					ptool.e:FireServer(unpack(args))
					task.wait(0.5)
				end
			end
		end
		local stool = findbtools("Shape")[1]
		if childcube and ((bsizev3 ~= nil and (bsizev3.X ~= mult or bsizev3.Y ~= mult or bsizev3.Z ~= mult)) or needsresize == true) and stool then
			local args = {childcube,Enum.NormalId.Right,"",""}
			local function dodimension(d)
				if childcube and childcube.Size[d] ~= bsizev3[d] then
					c = 0
					repeat
						c = c + 1
						pos = (gcp("hrp") and gcp("hrp").Position) or pos
						args[4] = nil
						if childcube then
							args[3] = pos
							if childcube.Size[d] > bsizev3[d] then
								args[4] = "decrease"
							elseif childcube.Size[d] < bsizev3[d] then
								args[4] = "increase"
							end
						end
						if not stool then
							stool = findbtools("Shape")[1]
						end
						if stool then
							checktool(stool.bt)
							stool.e:FireServer(unpack(args))
						end
						task.wait(resizewait)
					until args[4] == nil or (args[4] == "decrease" and childcube and childcube.Size[d] <= 1) or (childcube and childcube.Size[d] == bsizev3[d]) or stopped == true or skipblock == true or not childcube or not childcube.Parent or c > (bsizev3[d]*3)/resizewait
				end
			end
			dodimension("X")
			args[2] = Enum.NormalId.Top
			dodimension("Y")
			args[2] = Enum.NormalId.Back
			dodimension("Z")
		end
		skipblock = false
	end)
	if oldprt then
		oldprt:Destroy()
	end
	novel = false
	childcube = nil
	if not s then print(e) end
end
local queue = {}
function addqueue(btoolname,args,sethrp,inog,dontchecktool)
	table.insert(queue,{ToolName=btoolname,Arguments=args,SetHRP=sethrp or false,AlreadyFixedForOG=inog,DontCheckTool=dontchecktool})
end
local blockfuncs = {}
local selected = {}
local blocks = {}
local discoblocks = {}
local selectionname = nil
local sg = Instance.new("ScreenGui")
local mainf = Instance.new("ScrollingFrame")
mainf.Size = UDim2.new(0.9,0,0.45,0)
mainf.CanvasSize = UDim2.new(0,0,1,0)
mainf.AutomaticCanvasSize = Enum.AutomaticSize.Y
mainf.Position = UDim2.new(0,0,0.55,0)
mainf.BackgroundColor3 = Color3.new(1,1,1)
mainf.BackgroundTransparency = 0.5
mainf.BorderColor3 = Color3.new(1,1,1)
mainf.BorderSizePixel = 5
mainf.Parent = sg
local uisc = Instance.new("UIAspectRatioConstraint")
uisc.AspectRatio = 0.5
uisc.Parent = mainf
local listlayout = Instance.new("UIListLayout")
listlayout.Padding = UDim.new(0,10)
listlayout.Parent = mainf
local selbl = Instance.new("Frame")
selbl.Size = UDim2.new(1,0,1,0)
selbl.Position = UDim2.new(0,0,0,0)
selbl.BackgroundTransparency = 1
selbl.Visible = false
selbl.Parent = sg
local txtinput = Instance.new("TextBox")
txtinput.Size = UDim2.new(0.3,0,0.1,0)
txtinput.AnchorPoint = Vector2.new(0.5,0.5)
txtinput.Position = UDim2.new(0.5,0,0.6,0)
txtinput.BackgroundColor3 = Color3.new(0,0,0)
txtinput.BorderColor3 = Color3.fromRGB(60,60,60)
txtinput.BorderSizePixel = 5
txtinput.TextScaled = true
txtinput.Text = ""
txtinput.PlaceholderText = "Input Text Here (use | to split, input text here BEFORE selecting the block)"
txtinput.TextColor3 = Color3.new(1,1,1)
txtinput.ClearTextOnFocus = false
txtinput.Visible = false
txtinput.Parent = selbl
local yes = Instance.new("TextButton")
yes.Size = UDim2.new(0.4,0,0.1,0)
yes.AnchorPoint = Vector2.new(0.5,0.5)
yes.Position = UDim2.new(0.5,0,0.8,0)
yes.BackgroundColor3 = Color3.new(0,255,0)
yes.BorderColor3 = Color3.fromRGB(0,200,0)
yes.BorderSizePixel = 5
yes.TextScaled = true
yes.Text = "Finish"
yes.TextColor3 = Color3.new(0,0,0)
yes.TextStrokeTransparency = 0
yes.TextStrokeColor3 = Color3.new(1,1,1)
yes.Parent = selbl
local onchatf = {}
function confirmselect()
	local csn = selectionname
	for i,v in pairs(blocks[csn]) do
		v.SelectionBox.Transparency = 1
		v.SelectionBox.SurfaceTransparency = 1
		v.ExtraEvents = {}
		v.Block.CanTouch = true
		v.ExtraEvents.OnCanTouchChanged = v.Block:GetPropertyChangedSignal("CanTouch"):Connect(function()
			v.Block.CanTouch = true
		end)
		v.ExtraEvents.ParentChanged = v.Block.AncestryChanged:Connect(function()
			if not v.Block.Parent or (not v.Block:IsDescendantOf(workspace) and not v.Block:IsDescendantOf(game.ReplicatedStorage)) then
				v.SelectionBox:Destroy()
				if v.OnTouched then
					v.OnTouched:Disconnect()
				end
				if v.ExtraEvents then
					for i,v in pairs(v.ExtraEvents) do
						v:Disconnect()
					end
				end
				blocks[csn][i] = nil
			end
		end)
		v.OnTouched = v.Block.Touched:Connect(function(part)
			if not blockfuncs[csn].Callback then
				return
			end
			local p = part
			local char = nil
			local beforep = 0
			local plr
			repeat
				plr = game.Players:GetPlayerFromCharacter(p)
				char = p
				p = p.Parent
				if typeof(beforep) == "number" then
					beforep = beforep + 1
					if beforep == 2 then
						beforep = part
					end
				else
					beforep = beforep.Parent
				end
			until plr or p == workspace or p == game
			beforep = (typeof(beforep) == "Instance" and beforep) or part or p
			if char and char:FindFirstChild("Humanoid") then
				local limb = char.Humanoid:GetLimb(beforep)
				blockfuncs[csn].Callback(v.Block,plr,limb == Enum.Limb.LeftLeg or limb == Enum.Limb.RightLeg)
			end
		end)
	end
	blockfuncs[csn].Deselect()
	selectionname = nil
end
table.insert(conn,yes.MouseButton1Click:Connect(function()
	selbl.Visible = false
	confirmselect()
end))
local uiscy = Instance.new("UIAspectRatioConstraint")
uiscy.AspectRatio = 3
uiscy.Parent = yes
--[[local no = Instance.new("TextButton")
no.Size = UDim2.new(0.4,0,0.1,0)
no.AnchorPoint = Vector2.new(0.5,0.5)
no.Position = UDim2.new(0.8,0,0.8,0)
no.BackgroundColor3 = Color3.new(255,0,0)
no.BorderColor3 = Color3.fromRGB(200,0,0)
no.BorderSizePixel = 5
no.TextScaled = true
no.Text = "Exit"
no.TextColor3 = Color3.new(0,0,0)
no.TextStrokeTransparency = 0
no.TextStrokeColor3 = Color3.new(1,1,1)
no.Parent = selbl
local uiscn = Instance.new("UIAspectRatioConstraint")
uiscn.AspectRatio = 3
uiscn.Parent = no
table.insert(conn,no.MouseButton1Click:Connect(function()
	selbl.Visible = false
	blockfuncs[selectionname].Deselect()
	for i,v in pairs(blocks[selectionname]) do
		v.SelectionBox.LineThickness = -1
	end
	selectionname = nil
end))]]
local txtsel = Instance.new("TextLabel")
txtsel.Size = UDim2.new(0.4,0,0.4,0)
txtsel.AnchorPoint = Vector2.new(0.5,0.5)
txtsel.Position = UDim2.new(0.5,0,0,0)
txtsel.BackgroundColor3 = Color3.new(255,0,0)
txtsel.BorderColor3 = Color3.fromRGB(200,0,0)
txtsel.BorderSizePixel = 5
txtsel.TextScaled = true
txtsel.Text = "Select Blocks"
txtsel.TextColor3 = Color3.new(0,0,0)
txtsel.TextStrokeTransparency = 0
txtsel.TextStrokeColor3 = Color3.new(1,1,1)
txtsel.Parent = selbl
local uisct = Instance.new("UIAspectRatioConstraint")
uisct.AspectRatio = 8
uisct.Parent = txtsel
local cy = 0
function deselect()
end
function createsb(data)
	local sb = false
	local selsb = Instance.new("TextButton")
	selsb.Size = UDim2.new(1,-18,0.2,0)
	selsb.Position = UDim2.new(0,0,cy,0)
	cy = cy + 0.5
	selsb.BackgroundColor3 = Color3.new(255,0,0)
	selsb.BackgroundTransparency = 0.8
	selsb.BorderSizePixel = 0
	selsb.TextScaled = true
	selsb.Text = "Select "..data.Name.." Blocks"
	selsb.TextColor3 = Color3.new(0,0,0)
	selsb.TextStrokeTransparency = 0
	selsb.TextStrokeColor3 = Color3.new(1,1,1)
	selsb.Parent = mainf
	blocks[data.Name] = {}
	table.insert(conn,selsb.MouseButton1Click:Connect(function()
		sb = not sb
		if sb then
			deselect()
			deselect = function(name)
				sb = false
				selsb.BackgroundColor3 = Color3.new(255,0,0)
				selsb.Text = "Select "..data.Name.." Blocks"
				selectionname = data.Name
				confirmselect()
			end
			selsb.BackgroundColor3 = Color3.new(0,255,0)
			selsb.Text = "> Selecting "..data.Name.." Blocks"
			selbl.Visible = true
			txtinput.Visible = data.OnChat ~= nil
			selectionname = data.Name
			csel = {}
			for i,v in pairs(blocks[data.Name]) do
				v.SelectionBox.Transparency = 0
				v.SelectionBox.SurfaceTransparency = 0.5
			end
		else
			selsb.BackgroundColor3 = Color3.new(255,0,0)
			selsb.Text = "Select "..data.Name.." Blocks"
			selbl.Visible = false
			selectionname = nil
			for i,v in pairs(blocks[data.Name]) do
				v.SelectionBox.Transparency = 1
				v.SelectionBox.SurfaceTransparency = 1
			end
		end
	end))
	blockfuncs[data.Name] = {
		Callback = data.Callback,
		OnChat = data.OnChat,
		Button = selsb,
		Input = data.OnChat ~= nil,
		Deselect = function()
			selsb.BackgroundColor3 = Color3.new(255,0,0)
			selsb.Text = "Select "..data.Name.." Blocks"
			selbl.Visible = false
			sb = false
		end
	}
end
createsb({
	Name = "Spleef",
	Callback = function(block,player)
		if player and not gettag(block) and block.CanCollide == true then
			settag(block,6)
			local oc = block.Color
			addqueue("Paint",{
				block,
				Enum.NormalId.Top,
				nil,
				"both \u{1F91D}",
				Color3.new(1,0,0),
				"collide",
				""
			},3)
			task.wait(5)
			addqueue("Paint",{
				block,
				Enum.NormalId.Top,
				nil,
				"both \u{1F91D}",
				oc,
				"collide",
				""
			},3)
		end
	end
})
createsb({
	Name = "Deletion",
	Callback = function(block,player,fromleg)
		if player and not gettag(block) and block.CanCollide == true then
			settag(block,1)
			addqueue("Delete",{
				block,
				nil
			},2)
		end
	end
})
createsb({
	Name = "Toxification",
	Callback = function(block,player,fromleg)
		if player and not gettag(block) and block.CanCollide == true then
			settag(block,1)
			addqueue("Paint",{
				block,
				Enum.NormalId.Top,
				nil,
				"material",
				Color3.new(1,0,0),
				"toxic",
				""
			},3)
		end
	end
})
createsb({
	Name = "Disco",
	Callback = function(block,player,fromleg)
		if player and not gettag(block) and block.CanCollide == true then
			settag(block,0.2)
			local col = discoblocks[block]
			if not col then
				discoblocks[block] = 0
			else
				discoblocks[block] = discoblocks[block] + 1
			end
			addqueue("Paint",{
				block,
				Enum.NormalId.Top,
				nil,
				"both \u{1F91D}",
				Color3.fromHSV(((discoblocks[block]*25)%255)/255,1,1),
				"neon",
				""
			},3)
		end
	end
})
createsb({
	Name = "Give R6",
	Callback = function(block,player,fromleg)
		if player and not gettag(player,block) and player.Character and player.Character.Humanoid.RigType ~= Enum.HumanoidRigType.R6 then
			settag(player,block,60)
			eenl(false)
			sayto(nil,";r6 "..sanitizename(player.Name))
		end
	end
})
createsb({
	Name = "Give Carpet",
	Callback = function(block,player,fromleg)
		if player and not gettag(player,block) and player.Character and not ht(player,"RainbowMagicCarpet") then
			settag(player,block,60)
			eenl(false)
			sayto(nil,";carpet "..sanitizename(player.Name))
		end
	end
})
createsb({
	Name = "Give Fly",
	Callback = function(block,player,fromleg)
		if player and not gettag(player,block) and player.Character and not player:GetAttribute("Flying") then
			settag(player,block,60)
			eenl(false)
			sayto(nil,";fly "..sanitizename(player.Name))
		end
	end
})
createsb({
	Name = "Unfly",
	Callback = function(block,player,fromleg)
		if player and not gettag(player,block) and player.Character and player:GetAttribute("Flying") then
			settag(player,block,60)
			eenl(false)
			sayto(nil,";unfly "..sanitizename(player.Name))
		end
	end
})
local materials = {}
materials[Enum.Material.SmoothPlastic] = "smooth"
materials[Enum.Material.Plastic] = "plastic"
materials[Enum.Material.CeramicTiles] = "tiles"
materials[Enum.Material.Brick] = "bricks"
materials[Enum.Material.WoodPlanks] = "planks"
materials[Enum.Material.Ice] = "ice"
materials[Enum.Material.Grass] = "grass"
materials[Enum.Material.Sand] = "sand"
materials[Enum.Material.Snow] = "snow"
materials[Enum.Material.Glass] = "glass"
materials[Enum.Material.Wood] = "wood"
materials[Enum.Material.Slate] = "stone"
materials[Enum.Material.Pebble] = "pebble"
materials[Enum.Material.Marble] = "marble"
materials[Enum.Material.Granite] = "granite"
materials[Enum.Material.DiamondPlate] = "steel"
materials[Enum.Material.Metal] = "metal"
materials[Enum.Material.Asphalt] = "asphalt"
materials[Enum.Material.Concrete] = "concrete"
materials[Enum.Material.Pavement] = "pavement"
materials[Enum.Material.Neon] = "neon"
createsb({
	Name = "Guess the ___",
	OnChat = function(message,texts,block)
		local said = false
		for i,v in pairs(texts) do
			if string.find(message:lower(),v:lower()) then
				said = true
			end
		end
		if said and not gettag(block) then
			settag(block,6)
			addqueue("Paint",{
				block,
				Enum.NormalId.Top,
				nil,
				"material",
				Color3.new(1,0,0),
				"glass",
				""
			},3,nil,true)
			task.wait(.1)
			addqueue("Paint",{
				block,
				Enum.NormalId.Top,
				nil,
				"material",
				Color3.new(1,0,0),
				"collide",
				""
			},3,nil,true)
			task.wait(5)
			addqueue("Paint",{
				block,
				Enum.NormalId.Top,
				nil,
				"material",
				Color3.new(1,0,0),
				"plastic",
				""
			},3,nil,true)
			task.wait(.1)
			addqueue("Paint",{
				block,
				Enum.NormalId.Top,
				nil,
				"material",
				Color3.new(1,0,0),
				"collide",
				""
			},3,nil,true)
		end
	end
})
local mouse = localplr:GetMouse()
table.insert(conn,mouse.Button1Down:Connect(function()
	if selectionname and mouse.Target and mouse.Target:IsDescendantOf(cfolder) then
		if blocks[selectionname][mouse.Target] then
			blocks[selectionname][mouse.Target].SelectionBox:Destroy()
			if blocks[selectionname][mouse.Target].OnTouched then
				blocks[selectionname][mouse.Target].OnTouched:Disconnect()
			end
			if blocks[selectionname][mouse.Target].ExtraEvents then
				for i,v in pairs(blocks[selectionname][mouse.Target].ExtraEvents) do
					v:Disconnect()
				end
			end
			blocks[selectionname][mouse.Target] = nil
		else
			local bbox = Instance.new("SelectionBox")
			bbox.Color3 = Color3.fromRGB(0,170,255)
			bbox.LineThickness = 0.1
			bbox.SurfaceColor3 = Color3.fromRGB(13,105,172)
			bbox.SurfaceTransparency = 0.5
			bbox.Transparency = 0
			bbox.Adornee = mouse.Target
			if blockfuncs[selectionname].Input then
				local names = nil
				local txt = txtinput.Text
				if string.find(txt," | ") then
					names = string.split(txt," | ")
				elseif string.find(txt,"|") then
					names = string.split(txt,"|")
				else
					names = {txt}
				end
				onchatf[mouse.Target] = {Names=names,Func=blockfuncs[selectionname].OnChat,}
			end
			blocks[selectionname][mouse.Target] = {SelectionBox = bbox,Block = mouse.Target}
			bbox.Parent = game.CoreGui
		end
	end
end))
sg.Enabled = false
sg.Parent = game.CoreGui
function getplrpos(plr)
	return (plr or localplr).Character.HumanoidRootPart.Position
end
function getplrcfr(plr)
	return (plr or localplr).Character.HumanoidRootPart.CFrame
end
--[[
addcmd({
	Name = "",
	Description = "",
	Arguments = {},
	Callback = function(plr,args)
	end
})
]]

addcmd({
	Name = {"rank","whitelist","admin"},
	Description = "Lets another player use commands.",
	Arguments = {"Player"},
 	Callback = function(plr,args)
		for i,v in pairs(args[1]) do
			wl[v.UserId] = {}
		end
	end
})

addcmd({
	Name = {"unrank","unwhitelist","unadmin"},
	Description = "Make the player unable to use commands.",
	Arguments = {"Player"},
	Callback = function(plr,args)
		for i,v in pairs(args[1]) do
			wl[v.UserId] = nil
		end
	end
})

addcmd({
	Name = {"enlighten","orb","arkenstone"},
	Description = "Gives The Arkenstone",
	Arguments = {},
	Callback = function(plr,args)
		if eenl(false) then
			task.wait(0.1)
			sayto(nil,";enlighten "..sanitizename(plr.Name))
		end
	end
})

addcmd({
	Name = {"grief","griefaura","delaura","deleteaura"},
	Description = "Deletes blocks around the player",
	Arguments = {"Player"},
	Callback = function(plr,args)
		griefaround = args[1][1]
		local i = 0
		while on and griefaround do
			local s,e = pcall(function()
				local hrp = gcp("hrp")
				local hrp2 = gcp("hrp",griefaround)
				if hrp and hrp2 then
					local dtools = findbtools("Delete")
					if #dtools > 0 then
						local gcc = getclosestcubes(hrp2.Position)
						for _,v in pairs(gcc) do
							if v[1]:IsA("BasePart") and #dtools > 0 then
								dti = dti + 1
								local dt = dtools[(dti%#dtools)+1]
								if isog then
									dt.e:FireServer(hrp.Position,Enum.NormalId.Top,v[1],Color3.new(0,0,0),"Smooth")
								else
									checktool(dt.bt)
									dt.e:FireServer(v[1],hrp.Position)
								end
								task.wait(ws/#dtools)
							elseif #dtools <= 0 then
								repeat
									dtools = findbtools("Delete")
									task.wait(1)
								until #dtools > 0 or not on or not griefaround
							end
							if not on or not griefaround then
								break
							end
							if i%20 == 0 then
								dtools = findbtools("Delete")
							end
						end
					else
						repeat
							dtools = findbtools("Delete")
							task.wait(1)
						until #dtools > 0 or not on or not griefaround
					end
				end
			end)
			if not s then warn(e) end
			task.wait()
		end
	end
})

addcmd({
	Name = {"ungrief","ungriefaura","undelaura","undeleteaura"},
	Description = "Stops deleting blocks",
	Arguments = {},
	Callback = function(plr,args)
		griefaround = nil
	end
})

addcmd({
	Name = {"blockaura","blaura","blockspam"},
	Description = "Places blocks around the player",
	Arguments = {"Player"},
	Callback = function(plr,args)
		blockaura = args[1][1]
		plra = args[1][1]
		local i = 0
		while on and blockaura do
			local s,e = pcall(function()
				if blockaura then
					local hrp = gcp("hrp")
					if hrp then
						local btools = findbtools("Build")
						while #btools > 0 and blockaura and on do
							bti = bti + 1
							local s = "normal"
							if localplr.PlayerGui:FindFirstChild("Build") and localplr.PlayerGui.Build:FindFirstChild("Button") then
								s = localplr.PlayerGui.Build.Button.Text
							end
							local randompos = (buildpos or hrp.Position) + CFrame.lookAt(Vector3.zero,random:NextUnitVector()).LookVector.Unit*20
							if not gettag(randompos) then
								settag(randompos,10)
								local bt = btools[(bti%#btools)+1]
								if isog then
									bt.e:FireServer(randompos,Enum.NormalId.Top,workspace.Trrain:FindFirstChild("Mesh",true),Color3.new(1,1,1),"Smooth")
								else
									checktool(bt.bt)
									bt.e:FireServer(workspace.Terrain,Enum.NormalId.Top,randompos,s)
								end
							end
							task.wait(ws/#btools)
							if i%20 == 0 then
								btools = findbtools("Build")
							end
						end
					end
				end
			end)
			if not s then warn(e) end
			task.wait()
		end
	end
})

addcmd({
	Name = {"unblockaura","unblaura","unblockspam"},
	Description = "Stops placing blocks",
	Arguments = {},
	Callback = function(plr,args)
		blockaura = nil
		resetplra()
	end
})

addcmd({
	Name = {"signaura","siaura"},
	Description = "Places signs around the player",
	Arguments = {"Player"},
	Callback = function(plr,args)
		signaura = args[1][1]
		plra = args[1][1]
		local i = 0
		while on and signaura do
			local s,e = pcall(function()
				if signaura ~= nil then
					local hrp = gcp("hrp")
					if hrp then
						local signs = findbtools("Sign")
						while #signs > 0 and signaura and on do
							sti = sti + 1
							local randompos = (buildpos or hrp.Position) + CFrame.lookAt(Vector3.zero,random:NextUnitVector()).LookVector.Unit*20
							if not gettag(randompos) then
								settag(randompos,10)
								local st = signs[(sti%#signs)+1]
								if isog then
									st.e:FireServer(randompos,Enum.NormalId.Top,workspace.Trrain:FindFirstChild("Mesh",true),Color3.new(1,1,1),"Smooth")
								else
									checktool(st.bt)
									st.e:FireServer(workspace.Terrain,Enum.NormalId.Top,randompos)
								end
							end
							task.wait(ws/#signs)
							if i%20 == 0 then
								signs = findbtools("Sign")
							end
						end
					end
				end
			end)
			if not s then warn(e) end
			task.wait()
		end
	end
})

addcmd({
	Name = {"unsignaura","unsiaura"},
	Description = "Stops placing signs",
	Arguments = {},
	Callback = function(plr,args)
		signaura = nil
		resetplra()
	end
})

addcmd({
	Name = {"anchoraura","aa"},
	Description = "Anchors blocks around the player",
	Arguments = {"Player"},
	Callback = function(plr,args)
		anchoraura = args[1][1]
		unanchoraura = nil
		local i = 0
		while on and anchoraura do
			local s,e = pcall(function()
				local hrp = gcp("hrp")
				local hrp2 = gcp("hrp",anchoraura)
				if hrp and hrp2 then
					local paints = findbtools("Paint")
					if #paints > 0 then
						local gcc = getclosestcubes(hrp2.Position,nil,true)
						for _,v in pairs(gcc) do
							if v[1]:IsA("BasePart") and not gettag(v[1]) and v[1].Anchored == false and #paints > 0 then
								settag(v[1],2)
								pti = pti + 1
								if isog then
									--paints[(i%#paints)+1].e:FireServer(hrp.Position,Enum.NormalId.Top,v[1],Color3.new(0,0,0),"Smooth")
								else
									local pt = paints[(pti%#paints)+1]
									checktool(pt.bt)
									pt.e:FireServer(v[1],Enum.NormalId.Top,hrp.Position,"material",Color3.new(0,0,0),"anchor","")
								end
								task.wait(ws/#paints)
							elseif #paints <= 0 then
								repeat
									paints = findbtools("Paint")
									task.wait(1)
								until #paints > 0 or not on or not anchoraura
							end
							if not on or not anchoraura then
								break
							end
							if i%20 == 0 then
								paints = findbtools("Paint")
							end
						end
					else
						repeat
							paints = findbtools("Paint")
							task.wait(1)
						until #paints > 0 or not on or not anchoraura
					end
				end
			end)
			if not s then warn(e) end
			task.wait()
		end
	end
})

addcmd({
	Name = {"unanchoraura","unaa"},
	Description = "Unanchors blocks around the player",
	Arguments = {"Player"},
	Callback = function(plr,args)
		unanchoraura = args[1][1]
		anchoraura = nil
		local i = 0
		while on and unanchoraura do
			local s,e = pcall(function()
				local hrp = gcp("hrp")
				local hrp2 = gcp("hrp",unanchoraura)
				if hrp and hrp2 then
					local paints = findbtools("Paint")
					if #paints > 0 then
						local gcc = getclosestcubes(hrp2.Position,nil,true)
						for _,v in pairs(gcc) do
							if v[1]:IsA("BasePart") and not gettag(v[1]) and v[1].Anchored == true and #paints > 0 then
								settag(v[1],2)
								pti = pti + 1
								if isog then
									--paints[(i%#paints)+1].e:FireServer(hrp.Position,Enum.NormalId.Top,v[1],Color3.new(0,0,0),"Smooth")
								else
									local pt = paints[(i%#paints)+1]
									checktool(pt.bt)
									pt.e:FireServer(v[1],Enum.NormalId.Top,hrp.Position,"material",Color3.new(0,0,0),"anchor","")
								end
								task.wait(ws/#paints)
							elseif #paints <= 0 then
								repeat
									paints = findbtools("Paint")
									task.wait(1)
								until #paints > 0 or not on or not unanchoraura
							end
							if not on or not unanchoraura then
								break
							end
							if i%20 == 0 then
								paints = findbtools("Paint")
							end
						end
					else
						repeat
							paints = findbtools("Paint")
							task.wait(1)
						until #paints > 0 or not on or not unanchoraura
					end
				end
			end)
			if not s then warn(e) end
			task.wait()
		end
	end
})

addcmd({
	Name = {"stopanchoraura","noanchoraura","stopunanchoraura","nounanchoraura","stopaa","noaa","stopuaa","nouaa"},
	Description = "Stops anchor auras",
	Arguments = {},
	Callback = function(plr,args)
		anchoraura = nil
		unanchoraura = nil
	end
})

addcmd({
	Name = {"rainbowaura","raura"},
	Description = "Makes blocks rainbow around the player",
	Arguments = {"Player"},
	Callback = function(plr,args)
		rainbowaura = args[1][1]
		local i = 0
		while on and rainbowaura do
			local s,e = pcall(function()
				local hrp = gcp("hrp")
				local hrp2 = gcp("hrp",rainbowaura)
				if hrp and hrp2 then
					local paints = findbtools("Paint")
					if #paints > 0 then
						local gcc = getclosestcubes(hrp2.Position,rainbowamt)
						for _,v in pairs(gcc) do
							if v[1]:IsA("BasePart") and #paints > 0 then
								pti = pti + 1
								if isog then
									--paints[(i%#paints)+1].e:FireServer(hrp.Position,Enum.NormalId.Top,v[1],Color3.new(0,0,0),"Smooth")
								else
									local pt = paints[(pti%#paints)+1]
									checktool(pt.bt)
									pt.e:FireServer(v[1],Enum.NormalId.Top,hrp.Position,"color",Color3.fromHSV(((tick()/5)-0.5)%1,1,1),"","")
								end
								if i%4 == 0 then
									i = rainbowterrain(paints,hrp,i)
								end
								task.wait(ws/#paints)
							elseif #paints <= 0 then
								repeat
									paints = findbtools("Paint")
									task.wait(1)
								until #paints > 0 or not on or not rainbowaura
							end
							if not on or not rainbowaura then
								break
							end
							if i%20 == 0 then
								paints = findbtools("Paint")
							end
						end
						if #gcc <= 0 then
							if #paints > 0 then
								i = rainbowterrain(paints,hrp,i)
							else
								repeat
									paints = findbtools("Paint")
									task.wait(1)
								until #paints > 0 or not on or not rainbowaura
							end
						end
					else
						repeat
							paints = findbtools("Paint")
							task.wait(1)
						until #paints > 0 or not on or not rainbowaura
					end
				end
			end)
			if not s then warn(e) end
			task.wait()
		end
	end
})

addcmd({
	Name = {"unrainbowaura","unraura"},
	Description = "Stops rainbow aura",
	Arguments = {},
	Callback = function(plr,args)
		rainbowaura = nil
	end
})

addcmd({
	Name = {"setrainbowamount","rainbowamount"},
	Description = "Selects how many blocks the rainbowaura command does until it loops again, -1 for infinite.",
	Arguments = {"Number"},
	Callback = function(plr,args)
		rainbowamt = (args[1] == -1 and nil) or args[1]
	end
})

addcmd({
	Name = {"toxicaura","ta"},
	Description = "Toxifies blocks around the player",
	Arguments = {"Player"},
	Callback = function(plr,args)
		toxicaura = args[1][1]
		local i = 0
		while on and toxicaura do
			local s,e = pcall(function()
				local hrp = gcp("hrp")
				local hrp2 = gcp("hrp",toxicaura)
				if hrp and hrp2 then
					local paints = findbtools("Paint")
					if #paints > 0 then
						local gcc = getclosestcubes(hrp2.Position)
						for _,v in pairs(gcc) do
							if v[1]:IsA("BasePart") and not gettag(v[1]) and v[1].Material ~= Enum.Material.Neon and #paints > 0 then
								settag(v[1],2)
								pti = pti + 1
								if isog then
									--paints[(i%#paints)+1].e:FireServer(hrp.Position,Enum.NormalId.Top,v[1],Color3.new(0,0,0),"Smooth")
								else
									local pt = paints[(pti%#paints)+1]
									checktool(pt.bt)
									paints[(pti%#paints)+1].e:FireServer(v[1],Enum.NormalId.Top,hrp.Position,"material",Color3.new(0,0,0),"toxic","")
								end
								task.wait(ws/#paints)
							elseif #paints <= 0 then
								repeat
									paints = findbtools("Paint")
									task.wait(1)
								until #paints > 0 or not on or not toxicaura
							end
							if not on or not toxicaura then
								break
							end
							if i%20 == 0 then
								paints = findbtools("Paint")
							end
						end
					else
						repeat
							paints = findbtools("Paint")
							task.wait(1)
						until #paints > 0 or not on or not toxicaura
					end
				end
			end)
			if not s then warn(e) end
			task.wait()
		end
	end
})

addcmd({
	Name = {"untoxicaura","unta"},
	Description = "Stops toxifying blocks",
	Arguments = {},
	Callback = function(plr,args)
		toxicaura = nil
	end
})

addcmd({
	Name = {"killaura","ka"},
	Description = "Kills players around selected player",
	Arguments = {"Player"},
	Callback = function(plr,args)
		killaura = args[1][1]
		plra = args[1][1]
		local i = 0
		while on and killaura do
			local s,e = pcall(function()
				local btools = findbtools("Build")
				if (not toxifybrick or not toxifybrick:IsDescendantOf(cfolder)) and btools and findbtools("Paint") and gcp("hrp") then
					buildingtoxify = true
					local hrp = gcp("hrp")
					local opos = hrp.CFrame
					buildblock(round(Vector3.new(math.random(10000,100000),math.random(1000,5000),math.random(10000,100000))),"toxic",Color3.fromRGB(0,0,0),nil,nil,true,"Neon",nil,nil,nil)
					buildingtoxify = false
					teleportto(opos)
				end
				btools = findbtools("Build")
				if toxifybrick and btools then
					for i,v in pairs(game.Players:GetPlayers()) do
						local hrp = gcp("hrp")
						local hrp2 = gcp("hrp",v)
						if v ~= killaura and v ~= localplr and hrp and hrp2 and (hrp2.Position - hrp.Position).Magnitude < 40 then
							if #btools > 0 then
								bti = bti + 1
								local pos = (hrp2.CFrame * CFrame.new(0,0,-hrp2.Velocity.Magnitude/2.5)).Position
								local bt = btools[(bti%#btools)+1]
								checktool(bt.bt)
								bt.e:FireServer(toxifybrick,Enum.NormalId.Top,pos,"detailed")
								task.wait(ws/#btools)
							else
								repeat
									btools = findbtools("Build")
									task.wait(1)
								until #btools > 0 or not on or not killaura
							end
						end
					end
				end
			end)
			if not s then warn(e) end
			task.wait()
		end
	end
})

addcmd({
	Name = {"unkillaura","unka"},
	Description = "Stops kill aura",
	Arguments = {},
	Callback = function(plr,args)
		killaura = nil
		resetplra()
	end
})

addcmd({
	Name = {"editor"},
	Description = "Gives you the editor tool (RANKED CANNOT ACCESS)",
	Arguments = {},
	LocalOnly = true,
	Callback = function(plr,args)
		if plr:FindFirstChild("Editor") then
			return
		end
		local t = Instance.new("Tool")
		t.Name = "Editor"
		t.RequiresHandle = false
		table.insert(conn,t.AncestryChanged:Connect(function()
			sg.Enabled = t.Parent == localplr.Character
			if t.Parent ~= localplr.Character then
				if deselect then
					deselect()
					selectionname = nil
				end
			end
		end))
		table.insert(tools,{t})
		t.Parent = (plr.Character and not plr.Character:FindFirstChildWhichIsA("Tool") and plr.Character) or plr.Backpack
	end
})

addcmd({
	Name = {"fullcmds","fullcommands"},
	Description = "Shows the list of every command, including aliases.",
	Arguments = {},
	Callback = function(plr,args)
		local cmdss = "All Commands: "
		local nt = {}
		for i,v in pairs(cmds) do
			table.insert(nt,i)
		end
		table.sort(nt,function(a,b)
			return a:lower() < b:lower()
		end)
		for i,v in pairs(nt) do
			if not cmds[v].LocalOnly or plr == localplr then
				if i == #nt then
					cmdss = cmdss.."and "..v.."."
				else
					cmdss = cmdss..v..", "
				end
			end
		end
		if plr ~= localplr then
			for i,v in pairs(splittext(cmdss)) do
				sayto(plr,v)
				task.wait(6)
			end
		else
			sayto(plr,cmdss)
		end
	end
})

addcmd({
	Name = {"cmds","commands"},
	Description = "Shows the list of commands",
	Arguments = {},
	Callback = function(plr,args)
		local cmdss = "All Commands: "
		for i,v in pairs(cmdnames) do
			if not cmds[v].LocalOnly or plr == localplr then
				if i == #cmdnames then
					cmdss = cmdss.."and "..v.."."
				else
					cmdss = cmdss..v..", "
				end
			end
		end
		if plr ~= localplr then
			for i,v in pairs(splittext(cmdss)) do
				sayto(plr,v)
				task.wait(6)
			end
		else
			sayto(plr,cmdss)
		end
	end
})

addcmd({
	Name = {"rankedcmds","rankedcommands"},
	Description = "Shows the list of commands that ranked people can do.",
	Arguments = {},
	Callback = function(plr,args)
		local cmdss = "All Commands: "
		for i,v in pairs(cmdnames) do
			if not cmds[v].LocalOnly then
				if i == #cmdnames then
					cmdss = cmdss.."and "..v.."."
				else
					cmdss = cmdss..v..", "
				end
			end
		end
		if plr ~= localplr then
			for i,v in pairs(splittext(cmdss)) do
				sayto(plr,v)
				task.wait(6)
			end
		else
			sayto(plr,cmdss)
		end
	end
})

addcmd({
	Name = {"help","hep"},
	Description = "Gives the description of the command",
	Arguments = {"String"},
	Callback = function(plr,args)
		sayto(plr,cmds[args[1]:lower()].Description)
		if plr ~= localplr then
			task.wait(1)
		end
		task.wait(.1)
		local aliases = cmds[args[1]:lower()].Aliases
		if aliases and #aliases > 1 then
			local aliasesstr = "Aliases: "
			for i,v in pairs(aliases) do
				if i == #aliases then
					aliasesstr = aliasesstr.."and "..v
				else
					aliasesstr = aliasesstr..v..", "
				end
			end
			sayto(plr,aliasesstr)
		end
		task.wait(.1)
		local arguments = cmds[args[1]:lower()].Arguments
		if arguments and #arguments > 0 then
			local structure = "Command Structure: "..(cmdldata.Prefix[tostring(plr.UserId)] or prefix)..args[1]:lower().." "
			for i,v in pairs(arguments) do
				local argname = v
				if typeof(argname) == "table" then
					argname = v.InputType.." (defaults to "..tostring(v.Default)..")"
				end
				if i == #arguments then
					structure = structure.."{"..argname.."}"
				else
					structure = structure.."{"..argname.."} "
				end
			end
			sayto(plr,structure)
		end
	end
})

addcmd({
	Name = {"setprefix","prefix"},
	Description = "Sets the prefix before commands (ex: ?grief to !grief).",
	Arguments = {"string"},
	Callback = function(plr,args)
		local prefixset = args[1]
		if plr == localplr then
			cmdldata.Prefix.Local = prefixset
			prefix = prefixset
		else
			cmdldata.Prefix[tostring(plr.UserId)] = prefixset
		end
		savecmdldata()
	end
})

addcmd({
	Name = {"bring"},
	Description = "Brings the account with this script to yourself.",
	Arguments = {},
	Callback = function(plr,args)
		local plrcfr = getplrcfr(plr)
		teleportto(CFrame.new(plrcfr * Vector3.new(0,0,3)) * plrcfr.Rotation)
	end
})

addcmd({
	Name = {"float","platform"},
	Description = "Goes under a player and acts as a platform for them.",
	Arguments = {"Player"},
	Callback = function(plr,args)
		floatplr = args[1][1]
		floaty = -200
	end
})

addcmd({
	Name = {"unfloat","unplatform"},
	Description = "Stops acting as a platform for players.",
	Arguments = {},
	Callback = function(plr,args)
		floatplr = nil
		floaty = -200
	end
})

addcmd({
	Name = {"tospawn","gotospawn"},
	Description = "Goes to spawn (RANKED CANNOT ACCESS).",
	Arguments = {},
	LocalOnly = true,
	Callback = function(plr)
		teleportto(workspace.Spawn.CFrame + Vector3.new(0,gcp("hrp").Size.Y*2,0))
	end
})

function check()
	if not henl() then
		stopstash = true
		return false
	end
	if not localplr:HasTag("Muted") then
		task.wait(0.5)
		sayto(nil,";mute me")
		task.wait(3.5)
	end
	return true
end

addcmd({
	Name = {"stash"},
	Description = "Creates a Stash (ENLIGHTEN REQUIRED)",
	Arguments = {
		{
			InputType="Number",
			Default=2
		}
	},
	Callback = function(plr,args)
		if not henl() then
			sayto(localplr,"You need enlighten to make a stash!")
			return
		end
		getgenv().antiglitch = false
		getgenv().antifling = false
		task.wait(0.5)
		novel = true
		local lhrp = gcp("hrp")
		local op = lhrp.CFrame
		local c = lhrp.Parent
		c:PivotTo(CFrame.new(getgenv().stashposition + Vector3.new(0,30,0)))
		local stashamt = args[1]
		if not localplr:HasTag("Muted") then
			task.wait(0.5)
			sayto(nil,";mute me")
		end
		task.wait(0.5)
		for i=1,stashamt do
			local cloneamt = #workspace.Clones[localplr.Name]:GetChildren()
			local fullstashamt = math.floor(cloneamt)
			local x = fullstashamt%4
			local y = math.floor(fullstashamt/4)
			x = x * 10
			y = y * 10
			--[[eenl(true)
			c:PivotTo(CFrame.new(getgenv().stashposition + Vector3.new(x-5,0,y)))
			task.wait(1)
			sayto(nil,";freeze me")
			task.wait(1)
			sayto(nil,";clone me")
			task.wait(1)
			sayto(nil,";unfreeze me")
			task.wait(9)
			]]
			c:PivotTo(CFrame.new(getgenv().stashposition + Vector3.new(x,0,y)))
			task.wait(1)
			check()
			if stopstash then
				break
			end
			eenl(false,true)
			if not eb() then
				sayto(nil,";gear me 25162389")
				task.wait(1)
				eb()
				eenl(false,true)
			end
			check()
			if stopstash then
				break
			end
			sayto(nil,";freeze me")
			task.wait(1)
			check()
			if stopstash then
				break
			end
			sayto(nil,";clone me")
			task.wait(1)
			check()
			if stopstash then
				break
			end
			sayto(nil,";unfreeze me")
			c:PivotTo(CFrame.new(getgenv().stashposition + Vector3.new(x,15,y)))
			for i=1,10 do
				task.wait(1)
				check()
				if stopstash then
					break
				end
			end
		end
		task.wait(1)
		sayto(nil,";unmute me")
		if gcp("hum") then
			task.wait(1)
			gcp("hum"):UnequipTools()
			task.wait(0.5)
			teleportto(op)
		end
		novel = false
		if stopstash then
			coroutine.wrap(function()
				task.wait(3)
				stopstash = false
			end)()
		end
	end
})

addcmd({
	Name = {"stopstash","unstash"},
	Description = "Stops the stash command",
	Arguments = {},
	Callback = function(plr)
		stopstash = true
	end
})

addcmd({
	Name = {"tostash","gotostash"},
	Description = "Goes to stash (RANKED CANNOT ACCESS).",
	Arguments = {},
	LocalOnly = true,
	Callback = function(plr)
		gcp("hrp").Parent:PivotTo(CFrame.new(getgenv().stashposition + Vector3.new(-20,30,-20)))
	end
})

addcmd({
	Name = {"stashplatform"},
	Description = "Turns on the stash platform (RANKED CANNOT ACCESS).",
	Arguments = {},
	LocalOnly = true,
	Callback = function(plr)
		invisstashplatform.Transparency = 0.9
		invisstashplatform.CanCollide = true
	end
})

addcmd({
	Name = {"unstashplatform"},
	Description = "Turns off the stash platform (RANKED CANNOT ACCESS).",
	Arguments = {},
	LocalOnly = true,
	Callback = function(plr)
		invisstashplatform.Transparency = 1
		invisstashplatform.CanCollide = false
	end
})

local Targets = {"All"} -- "All", "Target Name", "arian_was_here"

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local AllBool = false

local GetPlayer = function(Name)
	Name = Name:lower()
	if Name == "all" or Name == "others" then
		AllBool = true
		return
	elseif Name == "random" then
		local GetPlayers = Players:GetPlayers()
		if table.find(GetPlayers,Player) then table.remove(GetPlayers,table.find(GetPlayers,Player)) end
		return GetPlayers[math.random(#GetPlayers)]
	elseif Name ~= "random" and Name ~= "all" and Name ~= "others" then
		for _,x in next, Players:GetPlayers() do
			if x ~= Player then
				if x.Name:lower():match("^"..Name) then
					return x;
				elseif x.DisplayName:lower():match("^"..Name) then
					return x;
				end
			end
		end
	else
		return
	end
end

local Message = function(_Title, _Text, Time)
	game:GetService("StarterGui"):SetCore("SendNotification", {Title = _Title, Text = _Text, Duration = Time})
end

local flingvalues1 = {
	{
		CFrame.new(0, 1.5, 0),
		true
	},
	{
		CFrame.new(0, -1.5, 0),
		true
	},
	{
		CFrame.new(2.25, 1.5, -2.25),
		true
	},
	{
		CFrame.new(-2.25, -1.5, 2.25),
		true
	},
	{
		CFrame.new(0, 1.5, 0),
		false
	},
	{
		CFrame.new(0, -1.5, 0),
		false
	}
}
local flingvalues2 = {
	{
		1.5,
		1,
		CFrame.Angles(math.rad(90), 0, 0)
	},
	{
		-1.5,
		1,
		CFrame.Angles(0, 0, 0)
	},
	{
		1.5,
		1,
		CFrame.Angles(math.rad(90), 0, 0)
	},
	{
		1.5,
		2,
		CFrame.Angles(math.rad(90), 0, 0)
	},
	{
		-1.5,
		2,
		CFrame.Angles(0, 0, 0)
	},
	{
		1.5,
		2,
		CFrame.Angles(math.rad(90), 0, 0)
	},
	{
		-1.5,
		3,
		CFrame.Angles(math.rad(90), 0, 0)
	},
	{
		-1.5,
		3,
		CFrame.Angles(0, 0, 0)
	},
	{
		-1.5,
		3,
		CFrame.Angles(math.rad(-90), 0, 0)
	},
	{
		-1.5,
		3,
		CFrame.Angles(0, 0, 0)
	},
}

local SkidFling = function(TargetPlayer,Vel)
	local Character = Player.Character
	local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
	local RootPart = Humanoid and Humanoid.RootPart

	local TCharacter = TargetPlayer.Character
	local THumanoid
	local TRootPart
	local THead
	local Accessory
	local Handle

	if TCharacter:FindFirstChildOfClass("Humanoid") then
		THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
	end
	if THumanoid and THumanoid.RootPart then
		TRootPart = THumanoid.RootPart
	end
	if TCharacter:FindFirstChild("Head") then
		THead = TCharacter.Head
	end
	if TCharacter:FindFirstChildOfClass("Accessory") then
		Accessory = TCharacter:FindFirstChildOfClass("Accessory")
	end
	if Accessoy and Accessory:FindFirstChild("Handle") then
		Handle = Accessory.Handle
	end

	if Character and Humanoid and RootPart then
		if RootPart.Velocity.Magnitude < 50 then
			getgenv().OldPos = RootPart.CFrame
		end
		--[[if THumanoid and THumanoid.Sit and not AllBool then
			return Message("Error Occurred", "Targeting is sitting", 5) -- u can remove dis part if u want lol
		end]]
		if THead then
			workspace.CurrentCamera.CameraSubject = THead
		elseif not THead and Handle then
			workspace.CurrentCamera.CameraSubject = Handle
		elseif THumanoid and TRootPart then
			workspace.CurrentCamera.CameraSubject = THumanoid
		end
		if not TCharacter:FindFirstChildWhichIsA("BasePart") then
			return
		end
		
		local FPos = function(BasePart, Pos, Ang)
			RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
			RootPart.AssemblyLinearVelocity = Vel or Vector3.new(9e7, 9e7 * 10, 9e7)
			RootPart.AssemblyAngularVelocity = Vel or Vector3.new(9e8, 9e8, 9e8)

			local s,e = pcall(function()
				Humanoid:Move(Vel or Vector3.new(9e7, 9e7 * 10, 9e7))
			end)
			if not s then print(e) end
								
			if sethiddenproperty then
				local s,e = pcall(function()
					sethiddenproperty(RootPart, "PhysicsRepRootPart", TRootPart)
				end)
				if not s then print(e) end
			end
		end
		
		local SFBasePart = function(BasePart)
			local TimeToWait = 2
			local Time = tick()
			local Angle = 0

			local loopn = 0
			local conn
			conn = rs.Heartbeat:Connect(function()
				if RootPart and THumanoid then
					loopn += 1
					if BasePart.Velocity.Magnitude < 50 then
						Angle += 100
						local data = flingvalues1[(loopn%#flingvalues1)+1]
						FPos(BasePart, data[1] + THumanoid.MoveDirection * ((data[2] and BasePart.Velocity.Magnitude / 1.25) or 1), CFrame.Angles(math.rad(Angle),0,0))
					else
						local data = flingvalues2[(loopn%#flingvalues2)+1]
						-- good luck reading this
						FPos(BasePart, CFrame.new(0, data[1], ((data[2] == 1 and THumanoid.WalkSpeed) or (data[2] == 2 and TRootPart.Velocity.Magnitude / 1.25) or 0) * ((data[1] < 0 and -1) or 1)), data[3])
					end
				end
				if BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or Humanoid.Health <= 0 or tick() > Time + TimeToWait then
					conn:Disconnect()
				end
			end)
		end		
		workspace.FallenPartsDestroyHeight = 0/0
		
		if not Vel then
			local BV = Instance.new("BodyVelocity")
			BV.Name = "EpixVel"
			BV.Parent = RootPart
			BV.Velocity = Vel or Vector3.new(9e8, 9e8, 9e8)
			BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)
		end
		
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
		Humanoid.PlatformStand = true
		
		if TRootPart and THead then
			if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
				SFBasePart(THead)
			else
				SFBasePart(TRootPart)
			end
		elseif TRootPart and not THead then
			SFBasePart(TRootPart)
		elseif not TRootPart and THead then
			SFBasePart(THead)
		elseif not TRootPart and not THead and Accessory and Handle then
			SFBasePart(Handle)
		else
			return Message("Error Occurred", "Target is missing everything", 5)
		end
		
		if BV then
			BV:Destroy()
		end
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
		workspace.CurrentCamera.CameraSubject = Humanoid
		
		repeat
			Humanoid.PlatformStand = false
			RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
			Humanoid:ChangeState("GettingUp")
			table.foreach(Character:GetChildren(), function(_, x)
				if x:IsA("BasePart") then
					x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
				end
			end)
			task.wait()
		until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25
	else
		return Message("Error Occurred", "Random error", 5)
	end
end

addcmd({
	Name = {"fling"},
	Description = "Flings the targetted player",
	Arguments = {"Player"},
	Callback = function(plr,args)
		if not Welcome then Message("Original Script by AnthonyIsntHere", "Enjoy!", 5) end
		getgenv().Welcome = true
		for i,v in pairs(args) do
			for i,v in pairs(v) do
				SkidFling(v)
			end
		end
	end
})

addcmd({
	Name = {"nanfling"},
	Description = "Flings the targetted player into the void",
	Arguments = {"Player"},
	Callback = function(plr,args)
		if not Welcome then Message("Original Script by AnthonyIsntHere", "Enjoy!", 5) end
		getgenv().Welcome = true
		local vel = Vector3.new(0,-9e9,0)
		for i,v in pairs(args) do
			for i,v in pairs(v) do
				SkidFling(v,vel)
			end
		end
	end
})

local m = (1/3)/1.5
local gs = game:GetService("GeometryService")
function crep(offset,size)
	if typeof(offset) == "Vector3" then
		offset = CFrame.new(offset)
	end
	local p = Instance.new("Part")
	p.Anchored = true
	p.Position = getplrpos() + (offset.Position*m)
	p.Material = Enum.Material.SmoothPlastic
	p.Reflectance = 0.6
	p.Size = (size and size*m) or Vector3.new(3*m,3*m,3*m)
	return p
end
local p1 = crep(Vector3.zero)
local p2 = crep(Vector3.new(0,-1.5,1.5),Vector3.new(3,6,6))
p2.Shape = Enum.PartType.Cylinder
function union(p1,p2s,un)
	local po
	if un then
		po = gs:UnionAsync(p1,p2s)
	else
		po = gs:IntersectAsync(p1,p2s)
	end
	p1:Destroy()
	for i,v in pairs(p2s) do
		v:Destroy()
	end
	return po[1]
end
local w = union(p1,{p2}) -- origin (front bottom right)
w.UsePartColor = true
w.Name = "fbr"
w.Color = Color3.fromRGB(0,0,255)
m = 1/1.5
local c4 = w:Clone()
c4.Position = w.CFrame * Vector3.new(m,0,0) -- front bottom left
c4.Name = "fbl"
c4.CFrame = c4.CFrame * CFrame.Angles(0,0,math.rad(180))
c4.Color = Color3.fromRGB(0,255,0)
local c3 = w:Clone()
c3.Position = w.CFrame * Vector3.new(0,m,0) -- front top right
c3.Name = "ftr"
c3.Color = Color3.fromRGB(255,255,255)
local c5 = w:Clone()
c5.Position = w.CFrame * Vector3.new(m,m,0) -- front top left
c5.Name = "ftl"
c5.Color = Color3.fromRGB(255,0,0)
local c1 = w:Clone()
c1.Position = w.CFrame * Vector3.new(0,0,m) -- back bottom right
c1.Name = "bbr"
c1.CFrame = c1.CFrame * CFrame.Angles(math.rad(180),0,0)
c1.Color = Color3.fromRGB(0,255,0)
local c7 = w:Clone()
c7.Position = w.CFrame * Vector3.new(m,0,m) -- back bottom left
c7.Name = "bbl"
c7.CFrame = c7.CFrame * CFrame.Angles(math.rad(180),0,0)
c7.Color = Color3.fromRGB(0,0,255)
local c2 = w:Clone()
c2.Position = w.CFrame * Vector3.new(0,m,m) -- back top right
c2.Name = "btr"
c2.CFrame = c2.CFrame * CFrame.Angles(math.rad(180),0,math.rad(180))
c2.Color = Color3.fromRGB(255,0,0)
local c6 = w:Clone()
c6.Position = w.CFrame * Vector3.new(m,m,m) -- back top left
c6.Name = "btl"
c6.CFrame = c6.CFrame * CFrame.Angles(math.rad(180),0,math.rad(180))
c6.Color = Color3.fromRGB(255,255,255)
w.CFrame = w.CFrame * CFrame.Angles(0,0,math.rad(180))
local finished = union(w,{c1,c2,c3,c4,c5,c6,c7},true)
finished.Anchored = false
finished.CanCollide = false
local rtool = Instance.new("Tool")
rtool.Grip = CFrame.Angles(0,math.rad(180),0)
rtool.Name = "Rotation Tool"
local handle = Instance.new("Part")
handle.Size = Vector3.one * 1.001
handle.Transparency = 1
handle.CanCollide = false
handle.Name = "Handle"
local we = Instance.new("Weld")
we.Parent = handle
we.C0 = CFrame.new(-m/2,-m/2,m/2)
handle.Parent = rtool
finished.Parent = handle
local cbt = Instance.new("Beam")
local ba0 = Instance.new("Attachment")
local ba1 = Instance.new("Attachment")
cbt.Attachment0 = ba0
cbt.Attachment1 = ba1
cbt.TextureLength = 6
cbt.TextureMode = Enum.TextureMode.Static
cbt.Texture = "rbxassetid://18498294"
ba0.Name = "A0"
ba1.Name = "A1"
ba0.Parent = cbt
ba1.Parent = cbt
cbt.Parent = rtool
local inverses = {
	[Enum.NormalId.Top] = Enum.NormalId.Bottom,
	[Enum.NormalId.Bottom] = Enum.NormalId.Top,
	[Enum.NormalId.Front] = Enum.NormalId.Back,
	[Enum.NormalId.Back] = Enum.NormalId.Front,
	[Enum.NormalId.Right] = Enum.NormalId.Left,
	[Enum.NormalId.Left] = Enum.NormalId.Right,
}
local power = 999999
local rotooltype = {name="Rotate"}
local roundNumber = 15
local lspeedNumber = 50
local rspeedNumber = 50
function hover(part,cfr,override)
	local occ = part.CanCollide
	part.CanCollide = false
	if rotooltype.name == "Rotate" or override then
		local hoverpos = Instance.new("BodyPosition")
		local hovergyr = Instance.new("BodyGyro")
		hoverpos.MaxForce = Vector3.new(power,power,power)
		hoverpos.P = power
		hoverpos.D = 2500
		hovergyr.MaxTorque = Vector3.new(power,power,power)
		hovergyr.P = power
		hovergyr.D = 6200
		hoverpos.Position = cfr.Position
		hovergyr.CFrame = cfr
		if isnetworkowner(part) then
			part.CFrame = cfr
		end
		local function delete(w)
			coroutine.wrap(function()
				task.wait(w or 0)
				hoverpos:Destroy()
				hovergyr:Destroy()
			end)()
			coroutine.wrap(function()
				task.wait(1)
				part.CanCollide = occ
			end)()
		end
		hoverpos.Parent = part
		hovergyr.Parent = part
		return delete
	elseif rotooltype.name == "Linear Velocity" then
		local repeatpositioning = rs.RenderStepped:Connect(function()
			part.CFrame = cfr
			part.AssemblyLinearVelocity = (cfr * Vector3.new(0,0,-lspeedNumber)) - cfr.Position
			part.AssemblyAngularVelocity = Vector3.zero
		end)
		local function delete(w)
			repeatpositioning:Disconnect()
			coroutine.wrap(function()
				task.wait(1)
				part.CanCollide = occ
			end)()
		end
		return delete
	end
end
local isnetworkowner = isnetworkowner or function(part)
	if not part then
		return false
	end
	if part.Anchored == true then
		return false
	end
	if part.ReceiveAge == 0 then
		return true
	end
	return false
end
function rotate(part,cframe,currentrtool)
	if not equiptool("Build") or not equiptool("Delete") or not equiptool("Paint") then
		return
	end
	local done = false
	local done2 = false
	local t = tick()+10
	local p = nil
	novel = true
	repeat
		teleportto(part.Position)
		if part.Anchored and not gettag(part) then
			settag(part,0.6)
			local args = {
				part,
				Enum.NormalId.Top,
				getplrpos(),
				"material",
				nil,
				"anchor",
				""
			}
			equiptool("Paint").Script.Event:FireServer(unpack(args))
		end
		localplr.SimulationRadius = math.max(localplr.SimulationRadius,100)
		task.wait()
	until isnetworkowner(part)
	coroutine.wrap(function()
		local cframe2 = cframe * CFrame.new(Vector3.new(0,part.Size.Y,0)) * cframe.Rotation
		local d = hover(part,cframe2,true)
		while not done and tick() < t do
			task.wait()
			part.CFrame = cframe2
		end
		d(5)
	end)()
	task.wait(0.5)
	local s,e = pcall(function()
		local args = {
			part,
			getplrpos()
		}
		coroutine.wrap(function()
			equiptool("Delete").Script.Event:FireServer(unpack(args))
		end)()
		local nid = Enum.NormalId.Bottom
		local args = {
			part,
			nid,
			getplrpos(),
			"normal"
		}
		coroutine.wrap(function()
			equiptool("Build").Script.Event:FireServer(unpack(args))
		end)()
		p = cfolder[localplr.Name].ChildAdded:Wait()
		p.CanCollide = false
		repeat
			teleportto(cframe.Position)
			if p.Anchored and not gettag(p) then
				settag(p,0.6)
				local args = {
					p,
					Enum.NormalId.Top,
					getplrpos(),
					"material",
					nil,
					"anchor",
					""
				}
				equiptool("Paint").Script.Event:FireServer(unpack(args))
			end
			localplr.SimulationRadius = math.max(localplr.SimulationRadius,100)
			task.wait()
		until isnetworkowner(p)
		p.CanCollide = true
		coroutine.wrap(function()
			local d = hover(p,cframe)
			repeat
				task.wait()
			until done2
			d(5)
		end)()
		task.wait(1)
		done = true
		local args = {
			p,
			Enum.NormalId.Right,
			getplrpos(),
			"material",
			nil,
			"anchor",
			""
		}
		equiptool("Paint").Script.Event:FireServer(unpack(args))
	end)
	novel = false
	done = true
	if not s then print(e) end
	currentrtool.Parent = localplr.Character
	task.wait(2)
	done2 = true
end
local rotatehandles = Instance.new("ArcHandles")
rotatehandles.Parent = game.CoreGui
local selectionbox = Instance.new("SelectionBox")
selectionbox.LineThickness = 0.05
selectionbox.SurfaceTransparency = 1
selectionbox.Parent = game.CoreGui
table.insert(tools,{rotatehandles,selectionbox})

local Shape = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local FrameStroke = Instance.new("UIStroke")
local FrameStroke2 = Instance.new("UIStroke")
local Corner = Instance.new("UICorner")
local TitleButton = Instance.new("TextButton")
local InputFrame = Instance.new("Frame")
local InputCorner = Instance.new("UICorner")
local ConfirmCorner = Instance.new("UICorner")
local InputLabel = Instance.new("TextLabel")
local TextBox = Instance.new("TextBox")
local TextBoxCorner = Instance.new("UICorner")
local CreatorLabel = Instance.new("TextLabel")
local CreatorLabel2 = Instance.new("TextLabel")
local ConfirmButton = Instance.new("TextButton")

Shape.Name = "RotateAngleUi"
Shape.Parent = game.CoreGui
Shape.Enabled = false
Shape.IgnoreGuiInset = true
Shape.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = Shape
MainFrame.AnchorPoint = Vector2.new(0.5, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
MainFrame.BackgroundTransparency = 0.5
MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, 0, 0.03, 0)
MainFrame.Size = UDim2.new(0, 200, 0, 200)

FrameStroke.Name = "FrameStroke"
FrameStroke.Parent = MainFrame
FrameStroke.Color = Color3.fromRGB(128, 255, 128)
FrameStroke.Thickness = 2
FrameStroke.Transparency = 0

Corner.CornerRadius = UDim.new(0.1, 0)
Corner.Name = "Corner"
Corner.Parent = MainFrame

TitleButton.Name = "TitleButton"
TitleButton.Parent = MainFrame
TitleButton.AnchorPoint = Vector2.new(0.5, 0)
TitleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TitleButton.BackgroundTransparency = 1.000
TitleButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TitleButton.BorderSizePixel = 0
TitleButton.Position = UDim2.new(0.5, 0, 0.05, 0)
TitleButton.Size = UDim2.new(0.9, 0, 0.15, 0)
TitleButton.Font = Enum.Font.FredokaOne
TitleButton.Text = "Rotate"
TitleButton.TextColor3 = Color3.fromRGB(128, 255, 128)
TitleButton.TextScaled = true
TitleButton.TextSize = 14
TitleButton.TextStrokeColor3 = Color3.fromRGB(64, 128, 64)
TitleButton.TextStrokeTransparency = 0
TitleButton.TextWrapped = true

local arrow = Instance.new("ImageLabel")
arrow.Size = UDim2.new(1,0,1,0)
arrow.Image = "rbxthumb://type=Asset&id=139666305844535&w=420&h=420"
arrow.BackgroundTransparency = 1
arrow.AnchorPoint = Vector2.new(1,0)
arrow.Position = UDim2.new(0.25,0,-0.1,0)
arrow.ZIndex = 999
arrow.Parent = MainFrame
arrow.Visible = not cmdldata.ClickedRotoolSwitch

InputCorner.CornerRadius = UDim.new(0.1, 0)
InputCorner.Name = "InputCorner"
InputCorner.Parent = InputFrame

InputLabel.Name = "AngleLabel"
InputLabel.Parent = InputFrame
InputLabel.AnchorPoint = Vector2.new(0.5, 0.5)
InputLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
InputLabel.BackgroundTransparency = 1.000
InputLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
InputLabel.BorderSizePixel = 0
InputLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
InputLabel.Size = UDim2.new(0.9, 0, 0.8, 0)
InputLabel.Font = Enum.Font.FredokaOne
InputLabel.Text = "Angle: 15"
InputLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
InputLabel.TextScaled = true
InputLabel.TextSize = 14
InputLabel.TextStrokeColor3 = Color3.fromRGB(128, 128, 128)
InputLabel.TextStrokeTransparency = 0
InputLabel.TextWrapped = true

TextBox.Parent = MainFrame
TextBox.AnchorPoint = Vector2.new(0.5, 0)
TextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TextBox.BackgroundTransparency = 0.200
TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0.5, 0, 0.45, 0)
TextBox.Size = UDim2.new(0.8, 0, 0.15, 0)
TextBox.Font = Enum.Font.FredokaOne
TextBox.PlaceholderColor3 = Color3.fromRGB(128, 128, 128)
TextBox.PlaceholderText = "Type a number that the script will round nearest to!"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextScaled = true
TextBox.TextSize = 14.000
TextBox.TextStrokeColor3 = Color3.fromRGB(64, 64, 64)
TextBox.TextStrokeTransparency = 0.000
TextBox.TextWrapped = true
TextBox.ClearTextOnFocus = true

TextBoxCorner.CornerRadius = UDim.new(0.1, 0)
TextBoxCorner.Name = "TextBoxCorner"
TextBoxCorner.Parent = TextBox

CreatorLabel.Name = "CreatorLabel"
CreatorLabel.Parent = MainFrame
CreatorLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CreatorLabel.BackgroundTransparency = 1.000
CreatorLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
CreatorLabel.BorderSizePixel = 0
CreatorLabel.Position = UDim2.new(0, 5, 1, -18)
CreatorLabel.Size = UDim2.new(0, 100, 0, 15)
CreatorLabel.Font = Enum.Font.FredokaOne
CreatorLabel.Text = "UI By: Qilex"
CreatorLabel.TextColor3 = Color3.fromRGB(128, 255, 128)
CreatorLabel.TextScaled = true
CreatorLabel.TextSize = 10.000
CreatorLabel.TextStrokeColor3 = Color3.fromRGB(64, 128, 64)
CreatorLabel.TextStrokeTransparency = 0.000
CreatorLabel.TextWrapped = true
CreatorLabel.TextXAlignment = Enum.TextXAlignment.Left
CreatorLabel.Name = "CreatorLabel"

CreatorLabel2.Parent = MainFrame
CreatorLabel2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CreatorLabel2.BackgroundTransparency = 1.000
CreatorLabel2.BorderColor3 = Color3.fromRGB(0, 0, 0)
CreatorLabel2.BorderSizePixel = 0
CreatorLabel2.Position = UDim2.new(1, -105, 1, -18)
CreatorLabel2.Size = UDim2.new(0, 100, 0, 15)
CreatorLabel2.Font = Enum.Font.FredokaOne
CreatorLabel2.Text = "Original By: Mental"
CreatorLabel2.TextColor3 = Color3.fromRGB(128, 255, 128)
CreatorLabel2.TextScaled = true
CreatorLabel2.TextSize = 10.000
CreatorLabel2.TextStrokeColor3 = Color3.fromRGB(64, 128, 64)
CreatorLabel2.TextStrokeTransparency = 0.000
CreatorLabel2.TextWrapped = true
CreatorLabel2.TextXAlignment = Enum.TextXAlignment.Right

ConfirmButton.Name = "ConfirmButton"
ConfirmButton.Parent = MainFrame
ConfirmButton.AnchorPoint = Vector2.new(0.5, 0)
ConfirmButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
ConfirmButton.BackgroundTransparency = 0.5
ConfirmButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
ConfirmButton.BorderSizePixel = 0
ConfirmButton.Position = UDim2.new(0.5, 0, 1.05, 0)
ConfirmButton.Size = UDim2.new(0.7, 0, 0.15, 0)
ConfirmButton.Font = Enum.Font.FredokaOne
ConfirmButton.Text = "Confirm"
ConfirmButton.TextColor3 = Color3.fromRGB(64, 255, 64)
ConfirmButton.TextScaled = true
ConfirmButton.TextStrokeTransparency = 0.000
ConfirmButton.TextStrokeColor3 = Color3.fromRGB(64, 128, 64)
ConfirmButton.TextWrapped = true

ConfirmCorner.CornerRadius = UDim.new(0.3, 0)
ConfirmCorner.Name = "InputCorner"
ConfirmCorner.Parent = ConfirmButton

FrameStroke2.Name = "FrameStroke"
FrameStroke2.Parent = ConfirmButton
FrameStroke2.Color = Color3.fromRGB(128, 255, 128)
FrameStroke2.Thickness = 2
FrameStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
FrameStroke2.Transparency = 0

InputFrame.Name = "InputFrame"
InputFrame.Parent = MainFrame
InputFrame.AnchorPoint = Vector2.new(0.5, 0)
InputFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
InputFrame.BackgroundTransparency = 0.200
InputFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
InputFrame.BorderSizePixel = 0
InputFrame.Position = UDim2.new(0.5, 0, 0.25, 0)
InputFrame.Size = UDim2.new(0.85, 0, 0.15, 0)

local RampButton = Instance.new("TextButton")
RampButton.Parent = MainFrame
RampButton.AnchorPoint = Vector2.new(0.5, 0)
RampButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
RampButton.BackgroundTransparency = 0.200
RampButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
RampButton.BorderSizePixel = 0
RampButton.Position = UDim2.new(0.275, 0, 0.65, 0)
RampButton.Size = UDim2.new(0.4, 0, 0.225, 0)
RampButton.Font = Enum.Font.FredokaOne
RampButton.Text = "Toggle Ramp: OFF"
RampButton.TextColor3 = Color3.fromRGB(255, 255, 255)
RampButton.TextScaled = true
RampButton.TextSize = 14.000
RampButton.TextStrokeColor3 = Color3.fromRGB(64, 64, 64)
RampButton.TextStrokeTransparency = 0.000
RampButton.TextWrapped = true

local RampSelect = Instance.new("TextButton")
RampSelect.Parent = MainFrame
RampSelect.AnchorPoint = Vector2.new(0.5, 0)
RampSelect.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
RampSelect.BackgroundTransparency = 0.200
RampSelect.BorderColor3 = Color3.fromRGB(0, 0, 0)
RampSelect.BorderSizePixel = 0
RampSelect.Position = UDim2.new(0.725, 0, 0.65, 0)
RampSelect.Size = UDim2.new(0.4, 0, 0.225, 0)
RampSelect.Font = Enum.Font.FredokaOne
RampSelect.Text = "Select Block Edge: OFF"
RampSelect.TextColor3 = Color3.fromRGB(255, 255, 255)
RampSelect.TextScaled = true
RampSelect.TextSize = 14.000
RampSelect.TextStrokeColor3 = Color3.fromRGB(64, 64, 64)
RampSelect.TextStrokeTransparency = 0.000
RampSelect.TextWrapped = true

local dots = {}
local ramptoggle = false
local rampselect = false
RampButton.MouseButton1Click:Connect(function()
	ramptoggle = not ramptoggle
	if ramptoggle then
		RampButton.Text = "Toggle Ramp: ON"
		for i,v in pairs(dots) do
			i.Transparency = 0.2
		end
	else
		RampButton.Text = "Toggle Ramp: OFF"
		if not rampselect then
			for i,v in pairs(dots) do
				i.Transparency = 1
			end
		end
	end
end)
RampSelect.MouseButton1Click:Connect(function()
	rampselect = not rampselect
	if rampselect then
		RampSelect.Text = "Select Block Edge: ON"
		for i,v in pairs(dots) do
			i.Transparency = 0.2
		end
	else
		RampSelect.Text = "Select Block Edge: OFF"
		if not ramptoggle then
			for i,v in pairs(dots) do
				i.Transparency = 1
			end
		end
	end
end)

local typenum = 0
local types = {
	{
		name="Rotate",
		displayformat="Rounding to the nearest %s degree%s",
		theme={0, 1, 0}
	},
	{
		name="Linear Velocity",
		displayformat="Conveyor Speed: %s Stud%s per Second",
		theme={0, 0, 1}
	},
	{
		name="Rotational Velocity (NON-FUNCTIONAL)",
		displayformat="Rotate Speed: %s Degree%s per Second",
		theme={1, 0, 0}
	},
}
function localbypass()
local function updateInputDisplay()
	local num
	if rotooltype.name == "Rotate" then
		num = roundNumber
	elseif rotooltype.name == "Linear Velocity" then
		num = lspeedNumber
	elseif rotooltype.name == "Rotational Velocity (NON-FUNCTIONAL)" then
		num = rspeedNumber
	end
	local s = ""
	if math.abs(num) ~= 1 then -- sorry, it was just bugging me
		s = "s"
	end
	InputLabel.Text = string.format(rotooltype.displayformat,num,s)
end
local convbeams = {}
TitleButton.MouseButton1Click:Connect(function()
	if not cmdldata.ClickedRotoolSwitch then
		cmdldata.ClickedRotoolSwitch = true
		arrow.Visible = false
		savecmdldata()
	end
	typenum = typenum + 1
	rotooltype = types[typenum%#types+1]
	TitleButton.Text = rotooltype.name
	local convtheme = Color3.fromRGB((rotooltype.theme[1]==0 and 128) or 255,(rotooltype.theme[2]==0 and 128) or 255,(rotooltype.theme[3]==0 and 128) or 255)
	FrameStroke.Color = convtheme
	FrameStroke2.Color = convtheme
	TitleButton.TextColor3 = convtheme
	TitleButton.TextStrokeColor3 = Color3.fromRGB((rotooltype.theme[1]==0 and 64) or 128,(rotooltype.theme[2]==0 and 64) or 128,(rotooltype.theme[3]==0 and 64) or 128)
	CreatorLabel.TextColor3 = convtheme
	CreatorLabel2.TextColor3 = convtheme
	updateInputDisplay()
	if rotooltype.name == "Linear Velocity" then
		for i,v in pairs(convbeams) do
			if v then
				v.TextureSpeed = lspeedNumber / v.TextureLength
				v.Enabled = true
			else
				table.remove(convbeams,i)
			end
		end
	else
		for i,v in pairs(convbeams) do
			if v then
				v.Enabled = false
			else
				table.remove(convbeams,i)
			end
		end
	end
end)
local function lvToOrientation(v)
	return CFrame.Angles(
		math.rad(v.X * v.Z),
		math.rad(v.X * v.Y),
		math.rad(v.Y * v.Z + 90)
	)
end
TextBox.FocusLost:Connect(function(enterPressed)
	local roundText = TextBox.Text
	local rn = tonumber(roundText)
	if rn then
		if rotooltype.name == "Rotate" then
			roundNumber = rn
		elseif rotooltype.name == "Linear Velocity" then
			lspeedNumber = rn
			for i,v in pairs(convbeams) do
				if v and v.Parent then
					v.TextureSpeed = lspeedNumber / v.TextureLength
				else
					table.remove(convbeams,i)
				end
			end
		elseif rotooltype.name == "Rotational Velocity" then
			rspeedNumber = rn
		end
		updateInputDisplay()
	else
		TextBox.Text = ""
	end
end)
function round(num,by)
	return (by == 0 and num) or (math.round(num/by) * by)
end
function AngleFromAxis(axis,rA)
	rA = math.rad(round(math.deg(rA),roundNumber))
	return axis==Enum.Axis.X and {rA,0,0}
	or axis==Enum.Axis.Y and {0,rA,0}
	or axis==Enum.Axis.Z and {0,0,rA}
end
function IsSelectable(part,hit)
	if part and localplr.Character:FindFirstChild("HumanoidRootPart") then
		if (hit - getplrpos()).magnitude < 30 and part:IsDescendantOf(cfolder) then return true end
	end
	return false
end
local edges = {
	{"-X","-Y"},
	{"-X","Y"},
	{"X","-Y"},
	{"X","Y"},
	{"-Z","-Y"},
	{"-Z","Y"},
	{"Z","-Y"},
	{"Z","Y"},
	{"-X","-Z"},
	{"-X","Z"},
	{"X","-Z"},
	{"X","Z"},

	{"X","Y","Z"},
	{"-X","Y","Z"},
	{"X","-Y","Z"},
	{"X","Y","-Z"},
	{"-X","-Y","Z"},
	{"X","-Y","-Z"},
	{"-X","Y","-Z"},
	{"-X","-Y","-Z"}
}
local VectorDimensions = {
	X = Vector3.new(1,0,0),
	Y = Vector3.new(0,1,0),
	Z = Vector3.new(0,0,1)
}
function createrotool()
	local sound = Instance.new("Sound")
	sound.SoundId = "rbxassetid://6897623656"
	sound.Parent = game.Workspace
	sound:Play()
	game.Debris:AddItem(sound, 5)
	local connections = {}
	currentrtool = rtool:Clone()
	local equipped = false
	undo_part = {}
	undo_cframe = {}
	selection = nil
	lastCFrame = nil
	notify("Note: I used a different method to reposition blocks for Linear Velocity and Angular Velocity, so once the rotool is done adding velocity to the blocks, build on the block to find where it actually is for other players.",Color3.fromRGB(200,0,0))
	
	local function ResetAngles()
		if selection then
			lastCFrame = selection.CFrame
			rotate(selection,CFrame.new(selection.CFrame.p),currentrtool)
		end
	end
	local e = true
	to_undo_part = nil
	to_undo_cframe = nil
	local sclone = nil
	local sclone2 = nil
	local dot = nil
	local mdown
	local b4r
	local handle = currentrtool.Handle
	local union = handle:FindFirstChildWhichIsA("PartOperation")
	handle.Weld.Part0 = union
	handle.Weld.Part1 = handle
	local dottemplate = Instance.new("Part")
	dottemplate.Size = Vector3.one
	dottemplate.Shape = Enum.PartType.Ball
	dottemplate.Transparency = 1
	dottemplate.Material = Enum.Material.SmoothPlastic
	dottemplate.CanCollide = false
	dottemplate.CanQuery = false
	dottemplate.Color = Color3.new(1,1,0)
	if ramptoggle then
		dottemplate.Transparency = 0.2
	end
	local weld = Instance.new("Weld")
	weld.Part0 = dottemplate
	weld.Parent = dottemplate
	local conveyorbeam = currentrtool.Beam
	local batt0 = conveyorbeam.A0
	local batt1 = conveyorbeam.A1
	conveyorbeam.Enabled = rotooltype.name == "Linear Velocity"
	table.insert(convbeams,conveyorbeam)
	local corner = {"X","Y"}
	table.insert(connections,currentrtool.Equipped:Connect(function()
		union.Parent = workspace
		equipped = true
		Shape.Enabled = true
	end))
	table.insert(connections,currentrtool.Unequipped:connect(function()
		if not equipped then
			return
		end
		union.Parent = handle
		selectionbox.Adornee = nil
		rotatehandles.Adornee = nil
	
		selection = nil
		to_undo_part = nil
		to_undo_cframe = nil
		rotatehandles.Axes = Axes.new(Enum.Axis.X,Enum.Axis.Y,Enum.Axis.Z)
	
		for i,v in pairs(undo_part) do
			undo_part[i] = nil
			undo_cframe[i] = nil
		end
		undo_part = {}
		undo_cframe = {}
		if sclone then
			conveyorbeam.Parent = nil
			sclone:Destroy()
			sclone2:Destroy()
		end
		equipped = false
		Shape.Enabled = false
	end))
	
	table.insert(connections,mouse.Button1Down:Connect(function()
		if not equipped then
			return
		end
		local issel = IsSelectable(mouse.Target,mouse.Hit.Position)
		if issel and selection ~= mouse.Target then
			selection = mouse.Target
			if sclone then
				conveyorbeam.Parent = nil
				sclone:Destroy()
				sclone2:Destroy()
			end
			sclone = selection:Clone()
			sclone.Size = sclone.Size + Vector3.new(0.01,0.01,0.01)
			sclone.Transparency = 0.5
			sclone.Anchored = true
			sclone.CanCollide = false
			sclone.CanQuery = false
			sclone2 = selection:Clone()
			sclone2.Size = sclone.Size + Vector3.new(0.01,0.01,0.01)
			sclone2.Transparency = 1
			sclone2.Anchored = true
			sclone2.CanCollide = false
			sclone2.CanQuery = false
			dot = dottemplate:Clone()
			dot.Weld.Part0 = dot
			dot.Weld.Part1 = sclone
			local pos2 = Vector3.zero
			for i,v in pairs(corner) do
				local n = 1
				if string.find(v,"-") then
					n = -1
					v = string.sub(v,2)
				end
				pos2 += VectorDimensions[v]*((selection.Size/2)[v] * n)
			end
			dot.Weld.C1 = CFrame.new(pos2)
			if ramptoggle or rampselect then
				dot.Transparency = 0.2
			else
				dot.Transparency = 1
			end
			dots[dot] = true
			dot.Parent = sclone
			conveyorbeam.Parent = sclone
			batt0.CFrame = CFrame.new(0,sclone.Size.Y/2+0.1,sclone.Size.Z/2) * lvToOrientation(sclone.CFrame.Rotation)
			batt1.CFrame = CFrame.new(0,sclone.Size.Y/2+0.1,-sclone.Size.Z/2) * lvToOrientation(sclone.CFrame.Rotation)
			conveyorbeam.Width0 = sclone.Size.X
			conveyorbeam.Width1 = sclone.Size.X
			conveyorbeam.TextureSpeed = lspeedNumber / conveyorbeam.TextureLength
			sclone.Parent = workspace
			sclone2.Parent = workspace
			table.insert(tools,{sclone,sclone2})
			selectionbox.Adornee = sclone
			rotatehandles.Adornee = sclone2
		end
		if selection and rampselect and (mouse.Target == selection) then
			local pos = selection.CFrame:PointToObjectSpace(mouse.Hit.Position)
			local hs = selection.Size / 2
			local low = {999}
			for i,v in pairs(edges) do
				local pos2 = Vector3.zero
				for i,v in pairs(v) do
					local n = 1
					if string.find(v,"-") then
						n = -1
						v = string.sub(v,2)
					end
					pos2 += VectorDimensions[v]*(hs[v] * n)
				end
				local mag = (pos - pos2).Magnitude
				if mag < low[1] then
					low = {mag,v,pos2}
				end
			end
			corner = low[2]
			dot.Weld.C1 = CFrame.new(low[3])
		end
	end))
	
	table.insert(connections,mouse.Button1Up:Connect(function()
		if not equipped then
			return
		end
		if to_undo_part and to_undo_cframe then
			if to_undo_part ~= selection or to_undo_cframe ~= selection.CFrame then
				table.insert(undo_part,to_undo_part)
				table.insert(undo_cframe,to_undo_cframe)
			end
		end
		to_undo_part = nil
		to_undo_cframe = nil
		rotatehandles.Axes = Axes.new(Enum.Axis.X,Enum.Axis.Y,Enum.Axis.Z)
		mdown = nil
	end))
	
	table.insert(connections,rotatehandles.MouseButton1Down:Connect(function(axis)
		if not equipped then
			return
		end
		if selection and sclone then
			sclone.Transparency = 0.75
			mdown = workspace.CurrentCamera.CameraSubject
			local focusdiff = workspace.CurrentCamera.CFrame.Position - mdown.Parent.HumanoidRootPart.Position
			workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
			if mdown then
				coroutine.wrap(function()
					while mdown do
						workspace.Camera.CFrame = CFrame.new(focusdiff + mdown.Parent.HumanoidRootPart.Position) * workspace.Camera.CFrame.Rotation
						task.wait()
					end
				end)()
			end
			lastCFrame = sclone2.CFrame
			to_undo_part = selection
			to_undo_cframe = lastCFrame
			rotatehandles.Axes = Axes.new(axis)
		end
	end))
	
	table.insert(connections,rotatehandles.MouseButton1Up:Connect(function(axis)
		if not equipped then
			return
		end
		mdown = nil
		if to_undo_part and to_undo_cframe then
	
	 		if to_undo_part ~= selection or to_undo_cframe ~= selection.CFrame then
				table.insert(undo_part,to_undo_part)
				table.insert(undo_cframe,to_undo_cframe)
			end
		end
		if sclone then
			sclone.Transparency = 0.5
			sclone2.CFrame = sclone.CFrame
		end
		to_undo_part = nil
		to_undo_cframe = nil
		rotatehandles.Axes = Axes.new(Enum.Axis.X,Enum.Axis.Y,Enum.Axis.Z)
		workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
	end))
	
	table.insert(connections,rotatehandles.MouseDrag:connect(function(axis, relativeAngle, deltaRadius)
		if not equipped then
			return
		end
		if sclone then
			if ramptoggle then
				local hs = selection.Size / 2
				local pos2 = Vector3.zero
				for i,v in pairs(corner) do
					local n = 1
					if string.find(v,"-") then
						n = -1
						v = string.sub(v,2)
					end
					pos2 += VectorDimensions[v]*(hs[v] * n)
				end
				local pivot = lastCFrame:PointToWorldSpace(pos2)
				local rot = CFrame.Angles(unpack(AngleFromAxis(axis,relativeAngle)))
				sclone.CFrame =
					CFrame.new(pivot)
					* rot
					* CFrame.new(-pivot)
					* lastCFrame
				sclone2.CFrame = lastCFrame * rot
			else
				local rot = CFrame.Angles(unpack(AngleFromAxis(axis,relativeAngle)))
				sclone.CFrame = lastCFrame * rot
				sclone2.CFrame = lastCFrame * rot
			end
		end
	end))
	
	table.insert(connections,ConfirmButton.MouseButton1Click:Connect(function()
		if sclone then
			rotate(selection,sclone.CFrame,currentrtool)
			conveyorbeam.Parent = nil
			sclone:Destroy()
			sclone2:Destroy()
		end
	end))
	
	table.insert(connections,currentrtool.AncestryChanged:Connect(function()
		if not currentrtool or not currentrtool.Parent or not currentrtool.Parent.Parent then
			for i,v in pairs(connections) do
				v:Disconnect()
			end
		end
	end))
	
	table.insert(tools,{
		union,
		currentrtool,
		conveyorbeam
	})
	
	currentrtool.Parent = localplr.Backpack
	task.wait()
	
	return currentrtool
end

--[[
addcmd({
	Name = {"rotool","rtool","rotatetool"},
	Description = "Gives you the Rotate Tool (RANKED CANNOT ACCESS)",
	Arguments = {},
	LocalOnly = true,
	Callback = function(plr,args)
		createrotool().Parent = (plr.Character and not plr.Character:FindFirstChildWhichIsA("Tool") and plr.Character) or plr.Backpack
	end
})
]]

-- formula: block size divided by 6 (memeify)
local dectool = Instance.new("Tool")
dectool.Name = "Decal Tool"
local handle = Instance.new("Part")
handle.Size = Vector3.one * 1.001
handle.Shape = Enum.PartType.Cylinder
handle.CanCollide = false
handle.Name = "Handle"
handle.Color = Color3.fromRGB(0,255,255)
handle.Parent = dectool

function isolatenumbers(str)
	return str:gsub("%D+","")
end
function waitmemeify()
	local c = localplr.Character
	if not c then
		c = localplr.CharacterAdded:Wait()
	end
	return c:WaitForChild("Meme",10)
end
function getmemeify(returnblock)
	if localplr.Character and localplr.Character:FindFirstChild("Meme") then
		return (returnblock and localplr.Character.Meme) or isolatenumbers(localplr.Character.Meme.Front.Label.Image)
	else
		return false
	end
end

local memeifyid = "11894923077"

local decalrotations = {}
decalrotations[Enum.NormalId.Top] = {math.rad(90),math.rad(0),math.rad(0)}
decalrotations[Enum.NormalId.Bottom] = {math.rad(90),math.rad(0),math.rad(0)}
decalrotations[Enum.NormalId.Left] = {math.rad(0),math.rad(90),math.rad(0)}
decalrotations[Enum.NormalId.Right] = {math.rad(0),math.rad(-90),math.rad(0)}
decalrotations[Enum.NormalId.Back] = {math.rad(180),math.rad(0),math.rad(180)}
decalrotations[Enum.NormalId.Front] = {math.rad(0),math.rad(0),math.rad(0)}
local decalrotations2 = {}
decalrotations2[Enum.NormalId.Top] = {math.rad(0),math.rad(1),math.rad(0)}
decalrotations2[Enum.NormalId.Bottom] = {math.rad(0),math.rad(1),math.rad(0)}
decalrotations2[Enum.NormalId.Left] = {math.rad(0),math.rad(0),math.rad(1)}
decalrotations2[Enum.NormalId.Right] = {math.rad(0),math.rad(0),math.rad(1)}
decalrotations2[Enum.NormalId.Back] = {math.rad(0),math.rad(0),math.rad(1)}
decalrotations2[Enum.NormalId.Front] = {math.rad(0),math.rad(0),math.rad(1)}

local idkwhattonamets = {}
idkwhattonamets[Enum.NormalId.Top] = {
	"X","Z"
}
idkwhattonamets[Enum.NormalId.Bottom] = {
	"X","Z"
}
idkwhattonamets[Enum.NormalId.Left] = {
	"Z","Y"
}
idkwhattonamets[Enum.NormalId.Right] = {
	"Z","Y"
}
idkwhattonamets[Enum.NormalId.Back] = {
	"X","Y"
}
idkwhattonamets[Enum.NormalId.Front] = {
	"X","Y"
}

local sui = Instance.new("ScreenGui")
local setdecal = Instance.new("TextBox")
local rotatebutton = Instance.new("TextButton")
local imageindicator = Instance.new("ImageLabel")
local sizeconst1 = Instance.new("UIAspectRatioConstraint")
local sizeconst2 = Instance.new("UIAspectRatioConstraint")
local sizeconst3 = Instance.new("UIAspectRatioConstraint")

sui.Parent = game.CoreGui
sui.ResetOnSpawn = false
sui.IgnoreGuiInset = true
sui.Enabled = false

setdecal.Parent = sui
setdecal.AnchorPoint = Vector2.new(0.5, 0)
setdecal.BackgroundColor3 = Color3.fromRGB(128,128,128)
setdecal.BackgroundTransparency = 0
setdecal.BorderColor3 = Color3.fromRGB(0, 0, 0)
setdecal.BorderSizePixel = 3
setdecal.Position = UDim2.new(0.465, 0, 0.05, 0)
setdecal.Size = UDim2.new(0.1, 0, 0.1, 0)
setdecal.Font = Enum.Font.FredokaOne
setdecal.Text = ""
setdecal.PlaceholderText = "Set a Decal ID Here!"
setdecal.TextColor3 = Color3.fromRGB(255,255,255)
setdecal.TextScaled = true

rotatebutton.Parent = sui
rotatebutton.AnchorPoint = Vector2.new(0.5, 0)
rotatebutton.BackgroundColor3 = Color3.fromRGB(128,128,128)
rotatebutton.BackgroundTransparency = 0
rotatebutton.BorderColor3 = Color3.fromRGB(0, 0, 0)
rotatebutton.BorderSizePixel = 3
rotatebutton.Position = UDim2.new(0.535, 0, 0.05, 0)
rotatebutton.Size = UDim2.new(0.1, 0, 0.1, 0)
rotatebutton.Font = Enum.Font.FredokaOne
rotatebutton.Text = "Rotate Image by 90 Degrees"
rotatebutton.TextColor3 = Color3.fromRGB(255,255,255)
rotatebutton.TextScaled = true

imageindicator.Parent = sui
imageindicator.AnchorPoint = Vector2.new(0.5, 0)
imageindicator.BackgroundTransparency = 1.000
imageindicator.Position = UDim2.new(0.5, 0, 0.175, 0)
imageindicator.Size = UDim2.new(0.15, 0, 0.15, 0)

sizeconst1.AspectRatio = 1
sizeconst1.Parent = setdecal

sizeconst2.AspectRatio = 1
sizeconst2.Parent = rotatebutton

sizeconst3.AspectRatio = 1
sizeconst3.Parent = imageindicator

local fakememe = Instance.new("Part")
fakememe.CanCollide = false
fakememe.CanTouch = false
fakememe.CanQuery = false
fakememe.Transparency = 1
fakememe.Anchored = true
fakememe.Parent = workspace

local suui = Instance.new("SurfaceGui")
suui.Parent = game.CoreGui
suui.SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
suui.Adornee = fakememe
suui.Face = Enum.NormalId.Front
suui.Enabled = false

local imageindicator2 = Instance.new("ImageLabel")
imageindicator2.Parent = suui
imageindicator2.BackgroundTransparency = 1
imageindicator2.ImageTransparency = 0.5
imageindicator2.Position = UDim2.new(0,0,0,0)
imageindicator2.Size = UDim2.new(1,0,1,0)

function updatememeifydisplays()
	imageindicator.Image = "https://www.roblox.com/Thumbs/Asset.ashx?width=420&height=420&assetId="..memeifyid
	imageindicator2.Image = "https://www.roblox.com/Thumbs/Asset.ashx?width=420&height=420&assetId="..memeifyid
end

table.insert(conn,setdecal:GetPropertyChangedSignal("Text"):Connect(function()
	memeifyid = isolatenumbers(setdecal.Text)
	updatememeifydisplays()
end))

updatememeifydisplays()

local decalrotation = 0
table.insert(conn,rotatebutton.MouseButton1Click:Connect(function()
	decalrotation = decalrotation + 90
end))

function getfixedthing(s)
	local tb = s == Enum.NormalId.Top or s == Enum.NormalId.Bottom
	local v = Vector3.new(0,tb and -1 or -0.25,tb and -0.76 or -0.01)
	--[[if decalrotation % 180 == 90 then
		v = Vector3.new(v.X,v.Z,v.Y)
	end]]
	return v
end

function createdecaltool()
	--[[local sound = Instance.new("Sound")
	sound.SoundId = "rbxassetid://6897623656"
	sound.Parent = game.Workspace
	sound:Play()
	game.Debris:AddItem(sound, 5)]]
	local connections = {}
	currentdectool = dectool:Clone()
	local equipped = false
	table.insert(connections,currentdectool.Equipped:Connect(function()
		equipped = true
		sui.Enabled = true
		suui.Enabled = true
	end))
	table.insert(connections,currentdectool.Unequipped:connect(function()
		equipped = false
		sui.Enabled = false
		suui.Enabled = false
	end))
	
	table.insert(connections,currentdectool.Activated:Connect(function()
		if not equipped then
			return
		end
		if not hp() then
			sayto(localplr,"You need enlighten to use Decal Tool!")
			return
		end
		local issel = IsSelectable(mouse.Target,mouse.Hit.Position)
		if issel and henl() then
			local selectside = mouse.TargetSurface
			selection = mouse.Target
			local mid = nil
			if gcp("hum").RigType ~= Enum.HumanoidRigType.R15 then
				sayto(nil,";r15 me")
				task.wait(3)
				eenl()
			end
			if getmemeify() then
				mid = getmemeify()
			else
				eenl()
				sayto(nil,";memeify "..memeifyid)
				mid = memeifyid
				waitmemeify()
			end
			if mid ~= memeifyid then
				eenl()
				sayto(nil,";memeify "..memeifyid)
				waitmemeify()
			end
			local memeifyblock = getmemeify(true)
			local idkwhattonamets2 = idkwhattonamets[selectside]
			local firstone,secondone = idkwhattonamets2[1],idkwhattonamets2[2]
			if decalrotation%180 == 90 then
				firstone,secondone = idkwhattonamets2[2],idkwhattonamets2[1]
			end
			local screwroblox = decalrotations[selectside]
			local screwroblox2 = decalrotations2[selectside]
			local lat = (CFrame.Angles(screwroblox[1]+screwroblox2[1]*decalrotation,screwroblox[2]+screwroblox2[2]*decalrotation,screwroblox[3]+screwroblox2[3]*decalrotation))
			local surfacecfr = CFrame.new(CFrame.new(selection.Position + Vector3.new(0,-1,0) + (Vector3.FromNormalId(selectside)*selection.Size/2)) * lat * getfixedthing(selectside)) * lat -- dont know why I had to put this at the end... but its needed
			novel = true
			local looping = true
			pcall(function()
				gcp("hum").PlatformStand = true
				--local d = hover(gcp("hrp"),surfacecfr)
				coroutine.wrap(function()
					while looping do
						teleportto(surfacecfr)
						task.wait()
					end
				end)()
				task.wait(1.5)
				eenl()
				sayto(nil,string.format(";width me %s",tostring(selection.Size[firstone]/6)))
				task.wait(1.5)
				sayto(nil,string.format(";height me %s",tostring(selection.Size[secondone]/6)))
				task.wait(2.5)
				if gcp("hrp").CollisionGroup ~= "NoClip" then
					sayto(nil,";noclip me")
					task.wait(3)
				end
				sayto(nil,";freeze me")
				task.wait(1)
				sayto(nil,";clone me")
				task.wait(1)
				sayto(nil,";unfreeze me")
				gcp("hum").PlatformStand = false
				d(0)
			end)
			looping = false
			novel = false
		end
	end))

	table.insert(connections,rs.Heartbeat:Connect(function()
		if equipped and mouse.Target and IsSelectable(mouse.Target,mouse.Hit.Position) and mouse.TargetSurface then
			local selectside = mouse.TargetSurface
			local selection = mouse.Target
			local idkwhattonamets2 = idkwhattonamets[selectside]
			local firstone,secondone = idkwhattonamets2[1],idkwhattonamets2[2]
			if decalrotation%180 == 90 then
				firstone,secondone = idkwhattonamets2[2],idkwhattonamets2[1]
			end
			fakememe.Size = Vector3.new(selection.Size[firstone],selection.Size[secondone],0.001)
			local screwroblox = decalrotations[selectside]
			local screwroblox2 = decalrotations2[selectside]
			local lat = (CFrame.Angles(screwroblox[1]+screwroblox2[1]*decalrotation,screwroblox[2]+screwroblox2[2]*decalrotation,screwroblox[3]+screwroblox2[3]*decalrotation))
			local tb = selectside == Enum.NormalId.Top or selectside == Enum.NormalId.Bottom
			local surfacecfr = CFrame.new(CFrame.new(selection.Position + (Vector3.FromNormalId(selectside)*selection.Size/2)) * lat * getfixedthing(selectside)) * lat
			fakememe.CFrame = surfacecfr
			suui.Adornee = fakememe
		else
			suui.Adornee = nil
		end
	end))
	
	table.insert(connections,currentdectool.AncestryChanged:Connect(function()
		if not currentdectool or not currentdectool.Parent or not currentdectool.Parent.Parent then
			for i,v in pairs(connections) do
				v:Disconnect()
			end
		end
	end))
	
	table.insert(tools,{
		currentdectool
	})
	
	currentdectool.Parent = localplr.Backpack
	task.wait()
	
	return currentdectool
end

addcmd({
	Name = {"decaltool","decaltool","dtool"},
	Description = "Gives you the Decal Tool (RANKED CANNOT ACCESS, ENLIGHTEN REQUIRED)",
	Arguments = {},
	LocalOnly = true,
	Callback = function(plr,args)
		createdecaltool().Parent = (plr.Character and not plr.Character:FindFirstChildWhichIsA("Tool") and plr.Character) or plr.Backpack
	end
})

local reptool = Instance.new("Tool")
reptool.Name = "Replication Tool"
local handle = Instance.new("Part")
handle.Size = Vector3.one * 1.001
handle.Shape = Enum.PartType.Cylinder
handle.CanCollide = false
handle.Name = "Handle"
handle.Color = Color3.fromRGB(255,255,0)
handle.Parent = reptool
local blockhighlight = Instance.new("SelectionBox")
blockhighlight.SurfaceTransparency = 0.5
blockhighlight.LineThickness = 0.1
blockhighlight.Parent = reptool
for _,v in pairs({"Left","Right","Back","Front"}) do
	local surfaceui = Instance.new("SurfaceGui")
	surfaceui.Face = v
	surfaceui.SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
	surfaceui.PixelsPerStud = 150
	local text = Instance.new("TextLabel")
	text.BackgroundTransparency = 1
	text.Font = Enum.Font.FredokaOne
	text.Size = UDim2.new(1,0,1,0)
	text.TextScaled = true
	text.Text = "Replication Tool"
	text.Parent = surfaceui
	surfaceui.Parent = handle
end

function createreplicationtool()
	local connections = {}
	currentreptool = reptool:Clone()
	local bhighlight = currentreptool.SelectionBox
	local equipped = false
	table.insert(connections,currentreptool.Equipped:Connect(function()
		equipped = true
	end))
	table.insert(connections,currentreptool.Unequipped:connect(function()
		equipped = false
	end))
	
	local dontupdate = false
	table.insert(connections,currentreptool.Activated:Connect(function()
		if not equipped then
			return
		end
		if mouse.Target and IsSelectable(mouse.Target,mouse.Hit.Position) and mouse.TargetSurface then
			local brick = game:GetService("ReplicatedStorage"):FindFirstChild("Brick")
			if not brick or brick:HasTag("FAKE") then
				sayto(plr,"ReplicatedStorage Brick doesn't exist.",Color3.fromRGB(200,0,0))
				return
			end
			dontupdate = true
			bhighlight.SurfaceColor3 = Color3.fromRGB(0, 200, 0)
			bhighlight.Color3 = Color3.fromRGB(0, 200, 0)
			cas:BindActionToInputTypes(
				"RepTool",
				function() end,
				false,
				Enum.UserInputType.MouseButton1,
				Enum.UserInputType.Touch
			)
			pcall(function()
				local torep = mouse.Target
				local material = materials[torep.Material]
				if material == "neon" then
					material = "toxic"
				end
				addqueue("Paint",{
					brick,
					Enum.NormalId.Top,
					nil,
					"both \u{1F91D}",
					torep.Color,
					materials[torep.Material],
					""
				},3)
				if torep.Anchored ~= brick.Anchored then
					addqueue("Paint",{
						brick,
						Enum.NormalId.Top,
						nil,
						"material",
						Color3.new(),
						"anchor",
						""
					},3)
				end
				if torep.CanCollide ~= brick.CanCollide then
					addqueue("Paint",{
						brick,
						Enum.NormalId.Top,
						nil,
						"material",
						Color3.new(),
						"collide",
						""
					},3)
				end
				local sides = {"Back","Front","Left","Right","Top","Bottom"}
				for i,v in pairs(torep:GetChildren()) do
					if v:IsA("SurfaceGui") then
						if table.find(sides,v.Face.Name) then
							table.remove(sides,table.find(sides,v.Face.Name))
						end
						addqueue("Paint",{
							brick,
							v.Face,
							nil,
							"both \u{1F91D}",
							v.Label.TextColor3,
							"spray",
							v.Label.Text
						},3)
						task.wait(0.7)
					end
				end
				for i,v in pairs(sides) do
					addqueue("Paint",{
						brick,
						Enum.NormalId[v],
						nil,
						"material",
						Color3.new(),
						"spray",
						""
					},3)
				end
			end)
			cas:UnbindAction("RepTool")
			dontupdate = false
			bhighlight.SurfaceColor3 = Color3.fromRGB(13, 105, 172)
			bhighlight.Color3 = Color3.fromRGB(13, 105, 172)
		end
	end))

	table.insert(connections,rs.Heartbeat:Connect(function()
		if dontupdate then
			return
		end
		if equipped and mouse.Target and IsSelectable(mouse.Target,mouse.Hit.Position) and mouse.TargetSurface then
			bhighlight.Adornee = mouse.Target
		else
			bhighlight.Adornee = nil
		end
	end))
	
	table.insert(connections,currentreptool.AncestryChanged:Connect(function()
		if not currentreptool or not currentreptool.Parent or not currentreptool.Parent.Parent then
			for i,v in pairs(connections) do
				v:Disconnect()
			end
		end
	end))
	
	table.insert(tools,{
		currentreptool
	})
	
	currentreptool.Parent = localplr.Backpack
	task.wait()
	
	return currentreptool
end

--[[
addcmd({
	Name = {"replicationtool","reptool"},
	Description = "Gives you the Replication Tool (Click on a block and it will copy it all to the ReplicatedStorage Brick, RANKED CANNOT ACCESS)",
	Arguments = {},
	LocalOnly = true,
	Callback = function(plr,args)
		createreplicationtool().Parent = (plr.Character and not plr.Character:FindFirstChildWhichIsA("Tool") and plr.Character) or plr.Backpack
	end
})
]]

local modtool = Instance.new("Tool")
modtool.Name = "Moderation Tool"
modtool.RequiresHandle = false
--[[local handle = Instance.new("Part")
handle.Size = Vector3.one * 1.001
handle.Shape = Enum.PartType.Cylinder
handle.CanCollide = false
handle.Name = "Handle"
handle.Color = Color3.fromRGB(255,255,0)
handle.Parent = modtool]]
local playerhighlight = Instance.new("Highlight")
playerhighlight.Parent = modtool
local modtxt = "reset"
local modbox = createElement("TextBox",{
	Size = UDim2.new(0.2,0,0.1,0),
	Position = UDim2.new(0.5,0,0.7,0),
	AnchorPoint = Vector2.new(0.5,0),
	BackgroundColor3 = Color3.fromRGB(100,100,100),
	BorderColor3 = Color3.fromRGB(255,255,255),
	BorderSizePixel = 3,
	TextScaled = true,
	TextColor3 = Color3.fromRGB(255,255,255),
	PlaceholderText = "The text here will be said before the player's name (default: \"reset\").",
	Font = font,
	Text = "",
	Visible = false,
	Parent = sgui,
	Rainbow = true
})
modbox.FocusLost:Connect(function()
	modtxt = modbox.Text
end)

function recursiveparent(obj)
	if not obj then
		return nil
	end
	local p = obj.Parent
	repeat
		if game.Players:GetPlayerFromCharacter(p) then
			return game.Players:GetPlayerFromCharacter(p)
		end
		p = p.Parent
	until p == nil or p.Parent == game
	return nil
end

function createmodtool()
	local connections = {}
	currentmodtool = modtool:Clone()
	local phighlight = currentmodtool.Highlight
	phighlight.Parent = game.CoreGui
	local equipped = false
	table.insert(connections,currentmodtool.Equipped:Connect(function()
		equipped = true
		modbox.Visible = true
	end))
	table.insert(connections,currentmodtool.Unequipped:connect(function()
		equipped = false
		modbox.Visible = false
	end))
	
	table.insert(connections,currentmodtool.Activated:Connect(function()
		
		if mouse.Target and recursiveparent(mouse.Target) then
			local player = recursiveparent(mouse.Target)
			sayto(nil,";"..modtxt.." "..sanitizename(player.Name))
		end
	end))

	table.insert(connections,rs.Heartbeat:Connect(function()
		if equipped and mouse.Target and recursiveparent(mouse.Target) then
			phighlight.Adornee = recursiveparent(mouse.Target).Character
		else
			phighlight.Adornee = nil
		end
	end))
	
	table.insert(connections,currentmodtool.AncestryChanged:Connect(function()
		if not currentmodtool or not currentmodtool.Parent or not currentmodtool.Parent.Parent then
			for i,v in pairs(connections) do
				v:Disconnect()
			end
			modbox.Visible = false
		end
	end))
	
	table.insert(tools,{
		currentmodtool,
		phighlight
	})
	
	currentmodtool.Parent = localplr.Backpack
	task.wait()
	
	return currentmodtool
end

addcmd({
	Name = {"moderationtool","modtool"},
	Description = "Gives you the Moderation Tool (Click on a Player and they will be targetted for a command, RANKED CANNOT ACCESS)",
	Arguments = {},
	LocalOnly = true,
	Callback = function(plr,args)
		createmodtool().Parent = (plr.Character and not plr.Character:FindFirstChildWhichIsA("Tool") and plr.Character) or plr.Backpack
	end
})

function createstealtool()
	local connections = {}
	currentstealtool = currentstealtool:Clone()
	local phighlight = currentstealtool.Highlight
	phighlight.Parent = game.CoreGui
	local equipped = false
	table.insert(connections,currentstealtool.Equipped:Connect(function()
		equipped = true
		modbox.Visible = true
	end))
	table.insert(connections,currentstealtool.Unequipped:connect(function()
		equipped = false
		modbox.Visible = false
	end))
	
	table.insert(connections,currentstealtool.Activated:Connect(function()
		
		if mouse.Target and recursiveparent(mouse.Target) then
			local player = recursiveparent(mouse.Target)
			sayto(nil,";"..modtxt.." "..sanitizename(player.Name))
		end
	end))

	table.insert(connections,rs.Heartbeat:Connect(function()
		if equipped and mouse.Target and recursiveparent(mouse.Target) then
			phighlight.Adornee = recursiveparent(mouse.Target).Character
		else
			phighlight.Adornee = nil
		end
	end))
	
	table.insert(connections,currentstealtool.AncestryChanged:Connect(function()
		if not currentstealtool or not currentstealtool.Parent or not currentstealtool.Parent.Parent then
			for i,v in pairs(connections) do
				v:Disconnect()
			end
			modbox.Visible = false
		end
	end))
	
	table.insert(tools,{
		currentstealtool,
		phighlight
	})
	
	currentstealtool.Parent = localplr.Backpack
	task.wait()
	
	return currentstealtool
end

--[[ -- Steal tool placeholder
addcmd({
	Name = {"moderationtool","modtool"},
	Description = "Gives you the Moderation Tool (Click on a Player and they will be targetted for a command, RANKED CANNOT ACCESS)",
	Arguments = {},
	LocalOnly = true,
	Callback = function(plr,args)
		createmodtool().Parent = (plr.Character and not plr.Character:FindFirstChildWhichIsA("Tool") and plr.Character) or plr.Backpack
	end
})
]]

if getgenv().brickcollection == nil then
	getgenv().brickcollection = {}
end
function dbc(b)
	if b.Name ~= brickname then
		return
	end
	if not table.find(getgenv().brickcollection,b) then
		table.insert(getgenv().brickcollection,1,b)
	end
end
cfolder.DescendantAdded:Connect(dbc)
for i,v in pairs(game:GetDescendants()) do
	dbc(v)
end

function restorebrick(waittime)
	if not game.ReplicatedStorage:FindFirstChild(brickname) then
		local brick = Instance.new("Part")
		brick.Name = brickname
		brick:AddTag("FAKE")
		brick.Parent = game.ReplicatedStorage
	end
	for i,v in pairs(localplr.Character:GetChildren()) do
		if v:HasTag("The Chosen One by TomazDev") then
			v.Script.Enabled = false
			v.Script.Enabled = true
		end
	end
	for i,v in pairs(localplr.Backpack:GetChildren()) do
		if v:HasTag("The Chosen One by TomazDev") then
			v.Script.Enabled = false
			v.Script.Enabled = true
		end
	end
	if isog then
		localplr.Backpack.BTools.Enabled = false
		localplr.Backpack.BTools.Enabled = true
	end
	et = equiptool("Build")
	if et then
		task.wait(waittime or ws)
		local currbc = {}
		local ins = 1
		for i,v in pairs(getgenv().brickcollection) do
			if v ~= nil then
				if v:GetFullName() ~= brickname and v.Name ~= "Debris" and v:IsA("BasePart") and v.Anchored == false then
					table.insert(currbc,1,v)
					ins += 1
				else
					table.insert(currbc,v)
				end
			else
				table.remove(getgenv().brickcollection,table.find(getgenv().brickcollection,v))
			end
		end
		local block = nil
		local beforeamt = #cfolder[localplr.Name]:GetChildren()
		local nof = #currbc
		local nof1 = nof+1
		local of = tostring(nof)
		for i,v in pairs(currbc) do
			if v ~= nil and typeof(v) == "Instance" then
				et = equiptool("Build")
				if not et then
					notify("Build tool not found. Retry when your build tool comes back.",Color3.fromRGB(200,0,0))
					break
				end
				block = v
				if isog then
					localplr.Backpack.Events:FireServer(
						getplrpos(),
						Enum.NormalId.Top,
						block,
						Color3.new(0,0,0),
						"Smooth"
					)
				else
					et.Script.Event:FireServer(
						block,
						Enum.NormalId.Top,
						getplrpos(),
						"detailed"
					)
				end
				getgenv().sblock = block
				print(brickname,tostring(nof1-i).." of "..of)
				print("Name:",v.Name)
				print("Parent:",v.Parent and v.Parent.Name)
				print("Directory:",v:GetFullName())
				task.wait(waittime or ws)
				if beforeamt < #cfolder[localplr.Name]:GetChildren() then
					break
				end
			else
				table.remove(currbc,table.find(currbc,v))
			end
		end
		task.wait(1)
		block = cfolder[localplr.Name]:FindFirstChildWhichIsA("BasePart")
		if block then
			notify("New blocks created!",Color3.fromRGB(0,200,0))
			local hrt = ht(localplr,"Shape")
			local hpt = ht(localplr,"Paint")
			block = cfolder[localplr.Name]:GetChildren()[#cfolder[localplr.Name]:GetChildren()]
			if hrt and hpt then
				if block.Material ~= Enum.Material.Plastic then
					equiptool("Paint").Script.Event:FireServer(
						block,
						Enum.NormalId.Top,
						getplrpos(),
						"material",
						Color3.fromRGB(192,192,192),
						"plastic",
						""
					)
					task.wait(ws*2)
				end
				if not block.Anchored or block.CFrame - block.Position ~= CFrame.new() then
					local l = tick()
					repeat
						if tick() > l then
							l = tick()+(ws*2)
							equiptool("Paint").Script.Event:FireServer(
								block,
								Enum.NormalId.Top,
								getplrpos(),
								"both \u{1F91D}",
								Color3.fromRGB(192,192,192),
								"anchor",
								""
							)
						end
						task.wait()
					until block.Anchored and block.CFrame - block.Position == CFrame.new()
				end
				local blockpos = block.Position
				blockpos = Vector3.new(blockpos.X%4,blockpos.Y%4,blockpos.Z%4)
				blockpos = blockpos - Vector3.new(0.5,0.5,0.5)
				for i=1,blockpos.X do
					addqueue("Shape",{
						block,
						Enum.NormalId.Left,
						nil,
						"increase"
					},3)
				end
				for i=1,3-blockpos.X do
					addqueue("Shape",{
						block,
						Enum.NormalId.Right,
						nil,
						"increase"
					},3)
				end
				for i=1,blockpos.Y do
					addqueue("Shape",{
						block,
						Enum.NormalId.Bottom,
						nil,
						"increase"
					},3)
				end
				for i=1,3-blockpos.Y do
					addqueue("Shape",{
						block,
						Enum.NormalId.Top,
						nil,
						"increase"
					},3)
				end
				for i=1,blockpos.Z do
					addqueue("Shape",{
						block,
						Enum.NormalId.Front,
						nil,
						"increase"
					},3)
				end
				for i=1,3-blockpos.Z do
					addqueue("Shape",{
						block,
						Enum.NormalId.Back,
						nil,
						"increase"
					},3)
				end
			end
			return true
		else
			notify("Failed to create a new block. Make sure to run the script before everything is delcubed.",Color3.fromRGB(200,0,0))
		end
	else
		notify("Build tool not found. Retry when your build tool comes back.",Color3.fromRGB(200,0,0))
		return true
	end
	return false
end

addcmd({
	Name = {"restorebrick","restoreblock","restorecube","restorebuild","restorebkit"},
	Description = "Attempts to restore a Brick.",
	Arguments = {},
	LocalOnly = true,
	Callback = function(plr,args)
		local corr = restorebrick(0)
		if not corr then
			notify("Failed to restore brick quickly. Trying slow method (higher success rate)",Color3.fromRGB(255,255,0))
			restorebrick()
		end
		if isog and cfolder[localplr.Name]:FindFirstChildWhichIsA("BasePart") then
			teleportto(cfolder[localplr.Name]:FindFirstChildWhichIsA("BasePart").CFrame)
		end
	end
})

--[[addcmd({
	Name = {"fixbrick","fixblock","fixcube","fixbuild","fixbkit"},
	Description = "Reverts the ReplicatedStorage Brick back to it's normal state.",
	Arguments = {},
	LocalOnly = false,
	Callback = function(plr,args)
		local brick = game:GetService("ReplicatedStorage"):FindFirstChild("Brick")
		if not brick or brick:HasTag("FAKE") then
			sayto(plr,"ReplicatedStorage Brick doesn't exist. Try using \"restorebrick\".",Color3.fromRGB(200,0,0))
			return
		end
		local pt = equiptool("Paint")
		if not pt then
			sayto(plr,"Paint tool not found.",Color3.fromRGB(200,0,0))
			return
		end
		pt.Script.Event:FireServer(brick, Enum.NormalId.Top, getplrpos(), "both \u{1F91D}", Color3.fromRGB(192, 192, 192), "plastic","")
		task.wait(ws*2)
		pt.Script.Event:FireServer(brick, Enum.NormalId.Bottom, getplrpos(), "both \u{1F91D}", Color3.fromRGB(192, 192, 192), "spray", "")
		task.wait(ws*2)
		pt.Script.Event:FireServer(brick, Enum.NormalId.Left, getplrpos(), "both \u{1F91D}", Color3.fromRGB(192, 192, 192), "spray", "")
		task.wait(ws*2)
		pt.Script.Event:FireServer(brick, Enum.NormalId.Right, getplrpos(), "both \u{1F91D}", Color3.fromRGB(192, 192, 192), "spray", "")
		task.wait(ws*2)
		pt.Script.Event:FireServer(brick, Enum.NormalId.Back, getplrpos(), "both \u{1F91D}", Color3.fromRGB(192, 192, 192), "spray", "")
		task.wait(ws*2)
		pt.Script.Event:FireServer(brick, Enum.NormalId.Front, getplrpos(), "both \u{1F91D}", Color3.fromRGB(192, 192, 192), "spray", "")
		task.wait(ws*2)
		pt.Script.Event:FireServer(brick, Enum.NormalId.Top, getplrpos(), "both \u{1F91D}", Color3.fromRGB(192, 192, 192), "spray", "")
		if not brick.Anchored then
			task.wait(ws*2)
			pt.Script.Event:FireServer(brick, Enum.NormalId.Top, getplrpos(), "material", Color3.fromRGB(173, 172, 175), "anchor", "")
		end
		if not brick.CanCollide then
			task.wait(ws*2)
			pt.Script.Event:FireServer(brick, Enum.NormalId.Top, getplrpos(), "material", Color3.fromRGB(173, 172, 175), "collide", "")
		end
	end
})
]]

--[[
addcmd({
	Name = {"disablebuild","disablebuilding","disablebkit"},
	Description = "Disables building (DELETE TOOL REQUIRED)",
	Arguments = {},
	LocalOnly = true,
	Callback = function(plr,args)
		local dtool = equiptool("Delete")
		if not game.ReplicatedStorage:FindFirstChild(brickname) then
			notify("Building is already disabled.",Color3.fromRGB(200,0,0))
			return
		end
		if dtool then
			if not isog then
				dtool.Script.Event:FireServer(game.ReplicatedStorage.Brick,getplrpos())
				notify("Successfully Disabled Building.",Color3.fromRGB(0,200,0))
			else
				localplr.Backpack.Events:FireServer(getplrpos(),Enum.NormalId.Top,game.ReplicatedStorage.Cube,Color3.new(0,0,0),"Smooth")
				notify("Successfully Disabled Building.",Color3.fromRGB(0,200,0))
			end
		else
			notify("You must have a Delete Tool.",Color3.fromRGB(200,0,0))
		end
	end
})
]]

addcmd({
	Name = {"disabledeletesound","disabledelsound","deletesound"},
	Description = "Deletes a player's block placement sound and delete sound. (DELETE TOOL REQUIRED)",
	Arguments = {"Player"},
	LocalOnly = true,
	Callback = function(plr,args)
		local dtool = equiptool("Delete")
		if isog then
			notify("This command doesn't work in OG servers.",Color3.fromRGB(200,0,0))
			return
		end
		if dtool then
			for i,v in pairs(args[1]) do
				addqueue("Delete",{
					v.Character.HumanoidRootPart:FindFirstChild("Brick"),
					getplrpos()
				},2)
			end
			notify("Successfully Disabled Delete Sound.",Color3.fromRGB(0,200,0))
		else
			notify("You must have a Delete Tool.",Color3.fromRGB(200,0,0))
		end
	end
})

addcmd({
	Name = {"permdisabledeletesound","permdisabledelsound","permdeletesound"},
	Description = "Permanently deletes newly spawned character's block placement sound and delete sound. (DELETE TOOL REQUIRED)",
	Arguments = {},
	LocalOnly = true,
	Callback = function(plr,args)
		local dtool = equiptool("Delete")
		if isog then
			notify("This command doesn't work in OG servers.",Color3.fromRGB(200,0,0))
			return
		end
		if dtool then
			if not game.StarterPlayer.StarterCharacterScripts.ToHRP:FindFirstChild(brickname) then
				notify("Delete sound is already deleted.",Color3.fromRGB(200,0,0))
				return
			end
			dtool.Script.Event:FireServer(game.StarterPlayer.StarterCharacterScripts.ToHRP.Brick,getplrpos())
			notify("Successfully Permanently Disabled Delete Sound.",Color3.fromRGB(0,200,0))
		else
			notify("You must have a Delete Tool.",Color3.fromRGB(200,0,0))
		end
	end
})
addcmd({
	Name = {"fly"},
	Description = "Makes you able to fly.",
	Arguments = {},
	LocalOnly = true,
	Callback = function(plr,args)
		plr:SetAttribute("Flying",true)
	end
})
addcmd({
	Name = {"togglefly"},
	Description = "Toggles fly, if you can fly then it would be disabled and vice versa.",
	Arguments = {},
	LocalOnly = true,
	Callback = function(plr,args)
		plr:SetAttribute("Flying",not plr:GetAttribute("Flying"))
	end
})
addcmd({
	Name = {"unfly"},
	Description = "Makes you unable to fly.",
	Arguments = {},
	LocalOnly = true,
	Callback = function(plr,args)
		plr:SetAttribute("Flying",false)
	end
})
-- credits to infinite yield for some of this
addcmd({
	Name = {"fix","fixcam","restorecam"},
	Description = "Fixes your camera, but also prevents that flying bug and fixes the missiles/any other tool breaker bugs.",
	Arguments = {},
	LocalOnly = true,
	Callback = function(plr,args)
		for i,v in pairs(cas:GetAllBoundActionInfo()) do
			if not table.find(whitelistedactions,i) then
				cas:UnbindAction(i)
			end
		end
		workspace.CurrentCamera:Destroy()
		repeat
			task.wait(.1)
		until plr.Character ~= nil and workspace.CurrentCamera
		workspace.CurrentCamera.CameraSubject = gcp("hum")
		workspace.CurrentCamera.CameraType = "Custom"
		plr.CameraMode = "Classic"
		plr.Character.Flying.Enabled = false
		plr.Character.Flying.Enabled = true
		plr:SetAttribute("Flying",not plr:GetAttribute("Flying"))
		task.wait()
		plr:SetAttribute("Flying",not plr:GetAttribute("Flying"))
	end
})

addcmd({
	Name = {"autoexecscriptpack","autoexecutescriptpack"},
	Description = "Auto Executes the Script Pack when you execute this script.",
	Arguments = {},
	LocalOnly = true,
	Callback = function(plr,args)
		cmdldata.AutoExecScriptPack = true
		savecmdldata()
		if not getgenv().scriptpackalreadyexecuted then
			getgenv().scriptpackalreadyexecuted = true
			pcall(function() loadstring(game:HttpGet("https://rawscripts.net/raw/The-Chosen-One-OP-SCRIPT-18120"))() end)
			pcall(function() loadstring(game:HttpGet("https://rawscripts.net/raw/The-Chosen-One-Extra-Stuff-18127"))() end)
			pcall(function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Server-Hopper-21123"))() end)
		end
	end
})
addcmd({
	Name = {"unautoexecscriptpack","unautoexecutescriptpack"},
	Description = "Turns off auto execute for the script pack.",
	Arguments = {},
	LocalOnly = true,
	Callback = function(plr,args)
		cmdldata.AutoExecScriptPack = false
		savecmdldata()
	end
})

--[[
addcmd({
	Name = {"checkbkitdisable","checkbkit","bkitcheck"},
	Description = "Checks if bkit is disabled.",
	Arguments = {},
	Callback = function(plr,args)
		local rsb = game.ReplicatedStorage:FindFirstChild("Brick")
		if rsb and not rsb:HasTag("FAKE") then
			sayto(plr,"Bkit is not disabled.",Color3.fromRGB(0,200,0))
		else
			sayto(plr,"Bkit is disabled.",Color3.fromRGB(200,0,0))
			task.wait(0.1)
			if workspace.Bricks:FindFirstChildWhichIsA("BasePart",true) then
				sayto(plr,"There are bricks found in the game, you can still build on them.",Color3.fromRGB(0,200,0))
			elseif #getgenv().brickcollection > 0 then
				sayto(plr,"There are bricks that was stored before they got deleted, you can try to restore them using "..prefix.."restorebrick.",Color3.fromRGB(0,200,0))
			end
		end
	end
})
]]

local bkitusage = {}
local recentbkitusage = {}
function dochar(c,plr)
	coroutine.wrap(function()
		local hrp = c:WaitForChild("HumanoidRootPart",math.huge)
		local BDRS = nil
		pcall(function()
			BDRS = hrp:WaitForChild("Brick",5)
		end)
		local Sh = hrp:WaitForChild("Crunch",math.huge)
		local Sp = hrp:WaitForChild("Splash",math.huge)
		local LBDRS = nil
		local LSh = nil
		local LSp = nil
		local function checklasttooleq(tool)
			if not tool or not tool:IsA("Tool") then
				return
			end
			if tool.Name == "Build" or tool.Name == "Delete" or tool.Name == "Resize" or tool.Name == "Sign" then
				LBDRS = tool.Name
			elseif tool.Name == "Shovel" then
				LSh = tool.Name
			elseif tool.Name == "Paint" then
				LSp = tool.Name
			end
		end
		checklasttooleq(c:FindFirstChildWhichIsA("Tool"))
		c.ChildAdded:Connect(checklasttooleq)
		if BDRS then
			BDRS.Played:Connect(function()
				bkitusage[plr] = LBDRS
				recentbkitusage[LBDRS] = plr
			end)
		end
		Sh.Played:Connect(function()
			bkitusage[plr] = LSh
			recentbkitusage[LSh] = plr
		end)
		Sp.Played:Connect(function()
			bkitusage[plr] = LSp
			recentbkitusage[LSp] = plr
		end)
	end)()
end
function doplr(plr)
	if plr.Character then
		dochar(plr.Character,plr)
	end
	plr.CharacterAdded:Connect(function(c)
		dochar(c,plr)
	end)
end
game.Players.PlayerAdded:Connect(doplr)
for i,v in pairs(game.Players:GetPlayers()) do
	doplr(v)
end

local rsb = game.ReplicatedStorage:FindFirstChild("Brick")
if rsb and not rsb:HasTag("FAKE") then
	table.insert(conn,rsb.AncestryChanged:Connect(function()
		if not recentbkitusage["Delete"] then
			repeat
				task.wait()
			until recentbkitusage["Delete"]
		end
		notify("Bkit has been disabled!\nSuspect: "..namestring(recentbkitusage["Delete"]),Color3.fromRGB(200,0,0))
	end))
end

local cmdbar = createElement("TextBox",{
	Size = UDim2.new(0.2,0,0.75,0),
	Position = UDim2.new(0.7,0,0,3),
	AnchorPoint = Vector2.new(0.5,1),
	BackgroundColor3 = Color3.fromRGB(100,100,100),
	BorderColor3 = Color3.fromRGB(255,255,255),
	BorderSizePixel = 3,
	TextScaled = true,
	TextColor3 = Color3.fromRGB(255,255,255),
	PlaceholderText = "Type here to input a command!",
	Font = font,
	Text = "",
	Parent = sgui,
	Rainbow = true
})

createElement("UIAspectRatioConstraint",{
	AspectRatio = 4,
	Parent = cmdbar
})

local openclosearrow = createElement("TextButton",{
	Size = UDim2.new(0.125,0,1,0),
	Position = UDim2.new(0.5,0,1,0),
	Rotation = 270,
	AnchorPoint = Vector2.new(0.5,0),
	TextScaled = true,
	Text = "<",
	BackgroundColor3 = Color3.fromRGB(100,100,100),
	TextColor3 = Color3.fromRGB(255,255,255),
	BorderColor3 = Color3.fromRGB(255,255,255),
	BorderSizePixel = 3,
	TextYAlignment = Enum.TextYAlignment.Center,
	Parent = cmdbar,
	Rainbow = true
})

local opened = false
openclosearrow.MouseButton1Click:Connect(function()
	opened = not opened
	local positioning
	if opened then
		positioning = Vector2.new(0.5,0)
		openclosearrow.Text = ">"
	else
		positioning = Vector2.new(0.5,1)
		openclosearrow.Text = "<"
	end
	local tween = ts:Create(cmdbar,TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out,0,false,0),{AnchorPoint = positioning})
	tween:Play()
end)

local namecolors = {
	peasant={150,103,102},
	arken={4,175,236},
	admin={245,205,48},
	hidden={255,0,0},
	iqgenius={255,179,179},
	iqdumb={200,0,0}
}
if isog then
	namecolors.peasant = {128,128,128}
end
local namecolorshex = {}
for i,v in pairs(namecolors) do
	namecolorshex[i] = "#"..Color3.fromRGB(table.unpack(v)):ToHex()
end
local joincmds = {
	joinxl="JoinXL",
	joinvc="JoinVC",
	joinog="JoinOG"
}
local function oimremake(mdata)
	local plr = mdata.TextSource and mdata.TextSource.UserId and game.Players:GetPlayerByUserId(mdata.TextSource.UserId)
	if not plr then
		return
	end
	local cn = ""
	local hidden = false
	if plr.Neutral == true then
		if plr:GetAttribute("Arken") == true then
			cn = "arken"
		else
			cn = "peasant"
		end
	else
		cn = "admin"
	end
	local muted = plr:HasTag("Muted")
	if muted then
		cn = "hidden"
	end
	local cmd = string.sub(mdata.Text,1,string.find(mdata.Text," ") or nil)
	if string.sub(mdata.Text,1,1) == ";" then
		cmd = string.sub(mdata.Text,2,string.find(mdata.Text," ") or nil)
		if on then
			cn = "hidden"
			hidden = true
		else
			mdata.Text = ""
		end
		--mdata.Text = string.sub(mdata.Text,2)
	end
	if plr == game.Players.LocalPlayer and joincmds[cmd:lower()] then
		for i,v in pairs(joincmds) do
			if localplr.PlayerGui:FindFirstChild(v) then
				localplr.PlayerGui[v].Enabled = i == cmd:lower()
			end
		end
	end
	local iq = nil
	if plr:GetAttribute("IQ") and plr:GetAttribute("IQ") >= 200 then
		iq = "genius \u{1F9E0}"
		cn = "iqgenius"
	elseif plr:GetAttribute("IQ") and plr:GetAttribute("IQ") <= 50 then
		iq = "dumb \u{1F92A}"
		cn = "iqdumb"
	end
	if isog then
		mdata.PrefixText = "<font color=\""..namecolorshex[cn].."\"><b><font color='rgb("..tostring(namecolors[cn][1])..","..tostring(namecolors[cn][2])..","..tostring(namecolors[cn][3])..")'>["..plr.DisplayName..((hidden and " (HIDDEN CHAT)") or "")..((iq and (" ("..iq..")")) or "")..((muted and (" (MUTED)")) or "").."]: </font></b></font>"
	else
		mdata.PrefixText = "<font color=\""..namecolorshex[cn].."\"><i><font color='rgb("..tostring(namecolors[cn][1])..","..tostring(namecolors[cn][2])..","..tostring(namecolors[cn][3])..")'>("..plr.DisplayName..((hidden and " (HIDDEN CHAT)") or "")..((iq and (" ("..iq..")")) or "")..((muted and (" (MUTED)")) or "")..") </font></i></font>"
	end
end

local function processmsg(msg,plr)
	if string.sub(msg,1,1) == ";" then
		msg = string.sub(msg,2)
	end
	for i,v in pairs(onchatf) do
		coroutine.wrap(function()
			v.Func(msg,v.Names,i)
		end)()
	end
	if wl[plr.UserId] or plr == localplr then
		local plrprefix = cmdldata.Prefix[tostring(plr.UserId)] or prefix
		if plrprefix == nil then
			if plr == localplr then
				cmdldata.Prefix.Local = "!"
				prefix = "!"
			else
				cmdldata.Prefix[tostring(plr.UserId)] = "!"
			end
			plrprefix = "!"
			savecmdldata()
			sayto(plr,"Prefix automatically reset! (seriously don't do that again..)",Color3.fromRGB(0,200,0))
		end
		if msg and string.sub(msg,1,plrprefix:len()) == plrprefix then
			local cmd = nil
			local args = {}
			if string.find(msg," ") then
				cmd = string.sub(msg,plrprefix:len()+1,string.find(msg," ")-1)
				args = string.split(string.sub(msg,string.find(msg," ")+1)," ")
			else
				cmd = string.sub(msg,plrprefix:len()+1)
			end
			cmd = cmd:lower()
			if cmds[cmd] then
				cmd = cmds[cmd]
				if cmd.LocalOnly == true and plr ~= localplr then
					return
				end
				if cmd.Arguments ~= nil and #cmd.Arguments > 0 then
					for i,vt in pairs(cmd.Arguments) do
						local arg = args[i]
						local v
						local df
						if typeof(vt) == "table" then
							v = vt.InputType
							df = vt.Default
						else
							v = vt
							if v == "Player" then
								df = "me"
							elseif v == "Number" then
								df = 10
							end
						end
						if arg then
							if v == "Player" then
								args[i] = getplayer(arg,plr)
							elseif v == "Number" then
								args[i] = tonumber(arg) or 10
							--elseif v == "String" then
								-- ???
							end
						else
							if v == "Player" then
								args[i] = getplayer(df,plr)
							elseif v == "Number" then
								args[i] = df
							elseif v == "String" then
								return
							end
						end
					end
				end
				cmd.Callback(plr,args)
			else
				sayto(plr,"Command not found!")
			end
		elseif msg and msg == "resetprefix" then
			if plr == localplr then
				cmdldata.Prefix.Local = "!"
				prefix = "!"
			else
				cmdldata.Prefix[tostring(plr.UserId)] = "!"
			end
			savecmdldata()
			sayto(plr,"Prefix successfully reset!",Color3.fromRGB(0,200,0))
		end
	end
end

table.insert(conn,cmdbar.FocusLost:Connect(function()
	if string.sub(cmdbar.Text,1,1) == prefix then
		cmdbar.Text = string.sub(cmdbar.Text,2)
	end
	processmsg(prefix..cmdbar.Text,localplr)
	cmdbar.Text = ""
end))

local oim = function(mdata)
	oimremake(mdata)
	if mdata.Status ~= Enum.TextChatMessageStatus.Success then
		return
	end
	local plr = mdata.TextSource and mdata.TextSource.UserId and game.Players:GetPlayerByUserId(mdata.TextSource.UserId)
	if not plr then
		return
	end
	local msg = mdata.Text
	if plr ~= localplr then
		processmsg(msg,plr)
	end
	return
end
table.insert(conn,localplr.Chatted:Connect(function(msg)
	processmsg(msg,localplr)
end))
game.TextChatService.OnIncomingMessage = oim

table.insert(conn,localplr.CharacterAdded:Connect(function(c)
	table.insert(conn,c.ChildAdded:Connect(function(c2)
		if c2:IsA("Tool") then
			lte = c2.Name
		end
	end))
end))

local updy = 0
coroutine.wrap(function()
	while on do
		local s,e = pcall(function()
			debug.profilebegin("CMDLineLoop")
			local color = Color3.fromHSV((tick()/10)%1,1,1)
			for i,v in pairs(torainbow) do
				v.BorderColor3 = color
			end
			if plra and plra ~= localplr then
				local hrp = gcp("hrp")
				local hrp2 = gcp("hrp",plra)
				if hrp and hrp2 then
					buildpos = hrp2.Position
					local ray = workspace:Raycast(hrp2.Position,-Vector3.new(0,16,0),params)
					if not ray or ray.Distance >= 15 then
						ray = workspace:Raycast(hrp2.Position,Vector3.new(0,-(hrp2.Position.Y+10),0),tparams)
					end
					if ray then
						local pr = hrp.CFrame - hrp.Position
						if not buildingtoxify then
							teleportto(((ray and CFrame.new(ray.Position-Vector3.new(0,5,0))) or (hrp2.CFrame - Vector3.new(0,10,0))) * pr)
						end
					else
						teleportto(CFrame.new(0,-14,0))
					end
					hrp.AssemblyLinearVelocity = Vector3.zero
				end
			end
			if floatplr and floatplr ~= localplr then
				if floatplr.Character and floatplr.Character:FindFirstChild("HumanoidRootPart") and localplr.Character and localplr.Character:FindFirstChild("HumanoidRootPart") then
					local lhrp = gcp("hrp",localplr)
					local fhrp = gcp("hrp",floatplr)
					local fhrpp = fhrp.Position
					local tfloaty = (fhrpp.Y - (fhrp.Size.Y*1.5)) - (lhrp.Size.Z/2)
					if tfloaty > floaty then
						floaty = tfloaty
					end
					if tick() > updy then
						updy = tick() + 0.5
						if fhrp.AssemblyLinearVelocity.Y < -5 or tfloaty+5 < floaty then
							floaty = tfloaty
						end
					end
					lhrp.CFrame = CFrame.new(fhrpp.X,floaty,fhrpp.Z) * CFrame.Angles(math.rad(90),0,0)
					lhrp.AssemblyLinearVelocity = Vector3.zero
					lhrp.AssemblyAngularVelocity = Vector3.zero
				end
			end
			if not lv then
				lv = createlv()
			end
			if novel == true then
				local hrp = gcp("hrp")
				if hrp then
					lv.Parent = hrp
					lv.Attachment0 = hrp:FindFirstChild("RootAttachment")
				end
			else
				lv.Parent = nil
			end
			debug.profileend()
		end)
		if not s then warn(e) end
		task.wait()
	end
end)()

coroutine.wrap(function()
	while on do
		task.wait(1)
		ws = math.max(game.Players.LocalPlayer:GetNetworkPing()+0.007,0.051)
		if wbs then
			local newping = nil
			local s,e = pcall(function()
				for i,v in pairs(game:GetService("CoreGui").RobloxGui.PerformanceStats:GetChildren()) do
					if v:FindFirstChild("StatsMiniTextPanelClass") and v.StatsMiniTextPanelClass:FindFirstChild("TitleLabel") and v.StatsMiniTextPanelClass:FindFirstChild("ValueLabel") and v.StatsMiniTextPanelClass.TitleLabel.Text == "Ping" then
						newping = tonumber(string.sub(v.StatsMiniTextPanelClass.ValueLabel.Text,1,string.find(v.StatsMiniTextPanelClass.ValueLabel.Text," ms")-1))
					end
				end
			end)
			if newping == nil then
				continue
			end
			if newping ~= ping then
				ping = newping
				historynum2 = historynum2 + 1
				if historynum2 > 5 then
					historynum2 = 1
				end
				local multi = 2.7
				if ping > 250 then
					multi = 2.5
				elseif ping > 500 then
					multi = 2.2
				end
				pinghistory[historynum2] = ping*multi -- added a little extra for fluctuations or whatever
				local allnums = 0
				for i,v in pairs(pinghistory) do
					allnums = allnums + v
				end
				resizewait = (allnums/#pinghistory)/1000
			end
		end
	end
end)()

coroutine.wrap(function() -- 3 while statements wont lag.. right?
	while on do
		local i = 0
		local squeue = queue[1]
		local hrp = gcp("hrp")
		if squeue and hrp then
			local tools = findbtools(squeue.ToolName)
			if #tools > 0 then
				table.remove(queue,1)
				qti = qti + 1
				if squeue.SetHRP then
					squeue.Arguments[squeue.SetHRP] = hrp.Position
				end
				if not squeue.AlreadyFixedForOG and isog then
					squeue.Arguments = fixarguments(squeue.Arguments)
				end
				local t = tools[(qti%#tools)+1]
				checktool(t.bt,squeue.dontchecktool)
				t.e:FireServer(table.unpack(squeue.Arguments))
				task.wait((ws*1.5)/#tools)
			else
				task.wait()
			end
		else
			task.wait()
		end
	end
end)()

table.sort(cmdnames,function(a,b)
	return a:lower() < b:lower()
end)

getgenv().tcocmddestroy = function()
	on = false
	for i,v in pairs(conn) do
		v:Disconnect()
	end
	game.TextChatService.OnIncomingMessage = oimremake
	griefaura = nil
	blockaura = nil
	signaura = nil
	anchoraura = nil
	unanchoraura = nil
	rainbowaura = nil
	plra = nil
	floatplr = nil
	toxicaura = nil
	killaura = nil
	stopped = true
	skipblock = true
	built = true
	stopstash = true
	if lv then
		lv:Destroy()
	end
	Shape:Destroy()
	sui:Destroy()
	cubechild:Disconnect()
	highlight:Destroy()
	wbs = false
	if oldprt then
		oldprt:Destroy()
	end
	coroutine.wrap(function()
		for i,v in pairs(tools) do
			local s,e = pcall(function()
				for i,v in pairs(v) do
					if v and v:IsDescendantOf(game) then
						v:Destroy()
						task.wait()
						task.wait()
					end
				end
			end)
			if not s then warn(e) end
		end
	end)()
	tp = false
	sg:Destroy()
	sgui:Destroy()
	for i,v in pairs(blocks) do
		for i,v in pairs(v) do
			v.SelectionBox:Destroy()
			if v.OnTouched then
				v.OnTouched:Disconnect()
			end
			if v.ExtraEvents then
				for i,v in pairs(v.ExtraEvents) do
					v:Disconnect()
				end
			end
			v = nil
		end
	end
end

notify("TCO Command Line has finished loading! There are currently "..tostring(#cmdnames).." Commands.\nCredits: Mental and Qilex.\nYour prefix is currently \""..prefix.."\".\nYou can either enter a command via the command bar at the top right or use Roblox's chat.\nTo see the list of commands, type "..prefix.."cmds.\nTo see information about the command, type "..prefix.."help command_name.\nEnjoy!")

end
localbypass()
