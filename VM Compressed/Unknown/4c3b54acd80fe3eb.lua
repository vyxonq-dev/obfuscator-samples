local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/synolope/meepcracked/main/ui-engine.lua"))()

local function loopwrap(func,int)
	local connect = nil
	return function(b)
		if connect then
			connect:Disconnect()
			connect = nil
		end
		if b then
			local i = 0
			connect = game.RunService.Heartbeat:Connect(function()
				i = i + 1
				if tonumber(int) then
					if i%int == 0 then
						func()
					end
				else
					func()
				end
			end)
		end
	end
end

local function getclosestplr()
	local LP = game.Players.LocalPlayer
	local c = LP.Character

	local closedist = nil
	local closeplr = nil
	if c then
		local root = c:FindFirstChild("HumanoidRootPart")
		if root then
			for _,plr in pairs(game.Players:GetPlayers()) do
			    if plr ~= LP then 
				local pc = plr.Character
				if pc then
					local proot = pc:FindFirstChild("HumanoidRootPart")
					if proot then
						local dist = (root.Position - proot.Position).Magnitude
						if not closedist or dist < closedist then
							closedist = dist
							closeplr = plr
						end
					end
				end
				end
			end
		end
	end
	return closeplr
end

local function checkdir()
    if not isfolder("meepcracked") then
        makefolder("meepcracked")
    end
end

local guiname = "MeepCracked"

if identifyexecutor then
    guiname = guiname .. " - " .. identifyexecutor()
    
end

local clr = Color3.fromRGB(142, 21, 212)

checkdir()

if isfile("meepcracked\\clr.txt") then
    local R,G,B = unpack(readfile("meepcracked\\clr.txt"):split(";"))
    R,G,B = tonumber(R),tonumber(G),tonumber(B)
    clr = Color3.new(R,G,B)
end

local WindowOptions = {
    main_color = clr,
    min_size = Vector2.new(300, 400),
    toggle_key = Enum.KeyCode.RightShift,
    can_resize = true,
}
local Window = library:AddWindow(guiname, WindowOptions)
local ItemsWindow = library:AddWindow("Items", WindowOptions)
local MeepWindow = library:AddWindow("Meep", WindowOptions)
local ServerDWindow = library:AddWindow("Server Destroying", WindowOptions)
local AvatarWindow = library:AddWindow("Avatar", WindowOptions)

local Welcome = Window:AddTab("Welcome")
Welcome:AddLabel("Thank you for using MeepCracked.")
Welcome:AddButton("Join Our Discord Server",function()
    local Settings = {
        InviteCode = "UtpqrGp29a" --add your invite code here (without the "https://discord.gg/" part)
    }
    
    -- Objects
    local HttpService = game:GetService("HttpService")
    local RequestFunction
    
    if syn and syn.request then
        RequestFunction = syn.request
    elseif request then
        RequestFunction = request
    elseif http and http.request then
        RequestFunction = http.request
    elseif http_request then
        RequestFunction = http_request
    end
    
    local DiscordApiUrl = "http://127.0.0.1:%s/rpc?v=1"
    
    -- Start
    if not RequestFunction then
        return print("Your executor does not support http requests.")
    end
    
    for i = 6453, 6464 do
        local DiscordInviteRequest = function()
            local Request = RequestFunction({
                Url = string.format(DiscordApiUrl, tostring(i)),
                Method = "POST",
                Body = HttpService:JSONEncode({
                    nonce = HttpService:GenerateGUID(false),
                    args = {
                        invite = {code = Settings.InviteCode},
                        code = Settings.InviteCode
                    },
                    cmd = "INVITE_BROWSER"
                }),
                Headers = {
                    ["Origin"] = "https://discord.com",
                    ["Content-Type"] = "application/json"
                }
            })
        end
        spawn(DiscordInviteRequest)
    end
end)
local Throwing = ItemsWindow:AddTab("Throwing")
local Action = ItemsWindow:AddTab("Action")
local Toys = ItemsWindow:AddTab("Toys")
local Plant = ItemsWindow:AddTab("Plant")
local Local = Window:AddTab("Local")
Local:AddLabel("( This is only for you. No one else can see these changes. )")

local items = {
	["Spitball"] = 1178,
	["Snowball (Cum)"] = 932,
	["Egg"] = 602,
	["Golden Egg"] = 1122
}

local selecteditem = nil

local Dropdown = Throwing:AddDropdown("Throwing Item", function(itemname)
	selecteditem = items[itemname]
end)

for i,v in pairs(items) do
	Dropdown:Add(i)
end

local function hit(player)
	if selecteditem and player.Character and player.Character:FindFirstChild("Head") then
		local targetpos = player.Character.Head.Position
		local Global = require(game:GetService("ReplicatedStorage").Global)
		game:GetService("ReplicatedStorage").ConnectionEvent:FireServer(226, game:GetService("HttpService"):JSONEncode({selecteditem,Global.ConcatenateVector3(targetpos),Global.ConcatenateVector3(targetpos),Global.ConcatenateVector3(targetpos),0}))
	end
end

local function throwall()
	for _,player in pairs(game.Players:GetPlayers()) do
		hit(player)
	end
end

Throwing:AddButton("Throw At Clostest Player",function()
	hit(getclosestplr())
end)
Throwing:AddButton("Throw At All Players",throwall)
Throwing:AddSwitch("Loop Throw At All Players",loopwrap(throwall,10))
Throwing:AddSwitch("Loop Throw At You",loopwrap(function()
	hit(game.Players.LocalPlayer)
end,10))

local fgs = Local:AddSwitch("Free Gamepasses",function(b)
	checkdir()
	writefile("meepcracked\\freegamepasses.txt",tostring(b))
	game.Players.LocalPlayer:SetAttribute("PLUS",b)
	game.Players.LocalPlayer:SetAttribute("BoomBox",b)
end)

if isfile("meepcracked\\freegamepasses.txt") and readfile("meepcracked\\freegamepasses.txt") == "true" then
	fgs:Set(true)
end

Local:AddSwitch("Anti Snowball Screen",loopwrap(function()
	local t = require(game.Players.LocalPlayer.PlayerGui:WaitForChild("ThrowingItemGui"):WaitForChild("ThrowingItemGUI"))
	t.SetHitByContainerEnabled(false)
end))

local actionitems = {}

local selectedaitem = nil

for i,v in pairs(require(game.ReplicatedStorage.AssetList)) do
	if v and v.ActionItemParentAssetId then
		actionitems[v.Title] = i
	end
end

local Dropdown = Action:AddDropdown("Action Item", function(itemname)
	selectedaitem = actionitems[itemname]
end)

for i,v in pairs(actionitems) do
	Dropdown:Add(i)
end

Action:AddButton("Equip Item",function()
	if selectedaitem then
		game.Players.LocalPlayer.VirtualWorldFunctions.RequestActionItem:Invoke(selectedaitem)
	end
end)

Action:AddButton("Hand Item To All (Buggy)",function()
	if selectedaitem then
		for _,player in pairs(game.Players:GetPlayers()) do
			game.Players.LocalPlayer.VirtualWorldFunctions.RequestActionItem:Invoke(selectedaitem)
			for i = 1,10,1 do
				game:GetService("ReplicatedStorage").Connection:InvokeServer(301, player.UserId, selectedaitem)
				wait()
			end
		end
	end
end)

Action:AddSwitch("Spam Equip",loopwrap(function()
	if selectedaitem then
		game.Players.LocalPlayer.VirtualWorldFunctions.RequestActionItem:Invoke(selectedaitem)
	end
end))

local toyitems = {}

local selectedtitem = nil

for i,v in pairs(require(game.ReplicatedStorage.AssetList)) do
	if v and v.ToyParentAssetId and v.AssetType == 12 then
		toyitems[v.Title] = i
	end
end

local Dropdown = Toys:AddDropdown("Toy Item", function(itemname)
	selectedtitem = toyitems[itemname]
end)

for i,v in pairs(toyitems) do
	Dropdown:Add(i)
end

Toys:AddButton("Equip Toy",function()
	if selectedtitem then
		print(selectedtitem)
		require(game.ReplicatedStorage.ClientClasses.Toys).RequestToy(selectedtitem)
	end
end)

Local:AddTextBox("Set World Background Music ID",function(id)
    if tonumber(id) then
        checkdir()
        writefile("meepcracked\\bgmusic.txt",id)
        require(game:GetService("ReplicatedStorage").ClientClasses.VirtualWorld).SetBackgroundMusic(id,.5,true)
    end
end)

checkdir()

if isfile("meepcracked\\bgmusic.txt") then
    require(game:GetService("ReplicatedStorage"):WaitForChild("ClientClasses"):WaitForChild("VirtualWorld")).SetBackgroundMusic(readfile("meepcracked\\bgmusic.txt"),.5,true)
end

local MMain = MeepWindow:AddTab("Main")
local MName = MeepWindow:AddTab("Name")
local hori = MName:AddHorizontalAlignment()
local NBox = MName:AddConsole({["source"]="Logs",["readonly"]=false})
hori:AddButton("Nazi",function()
	NBox:Set([[⬜⬜⬜⬜⬜⬜⬜
⬜⬛⬛⬛⬜⬛⬜
⬜⬜⬜⬛⬜⬛⬜
⬜⬛⬛⬛⬛⬛⬜
⬜⬛⬜⬛⬜⬜⬜
⬜⬛⬜⬛⬛⬛⬜
⬜⬜⬜⬜⬜⬜⬜]])
end)

hori:AddButton("Penis",function()
	NBox:Set([[⬛⬛
                  ⬛⬛⬛⬛⬛⬛⬛D
⬛⬛]])
end)

hori:AddButton("Dildo",function()
	NBox:Set([[⬛
⬛⬛
⬛⬛
⬛⬛
⬛⬛
⬛⬛
⬛⬛
⬛⬛
⬛⬛
⬛⬛
⬛⬛
⬛⬛
⬛⬛
⬛⬛
⬛⬛
⬛⬛⬛
⬛⬛⬛⬛⬛⬛
⬛⬛⬛⬛⬛⬛
⬛⬛⬛⬛⬛⬛]])
end)

hori:AddButton("Fuck",function()
	NBox:Set(game:HttpGet("https://raw.githubusercontent.com/synolope/meepcracked/main/art/f.txt"))
end)

MMain:AddButton("Toggle Meep",function()
	game:GetService("ReplicatedStorage").Connection:InvokeServer(79)
end)

MName:AddButton("Set Meep Name (150 Coins)",function()
	local text = NBox:Get()

	game:GetService("ReplicatedStorage").Connection:InvokeServer(65, text)
	game:GetService("ReplicatedStorage").Connection:InvokeServer(83)
end)

local Settings = Window:AddTab("Settings")
Settings:AddLabel("UI Color")
local dclrp = Settings:AddColorPicker(function(clrp)
    checkdir()
    writefile("meepcracked\\clr.txt",table.concat({clrp.R,clrp.G,clrp.B},";"))
    WindowOptions.main_color = clrp
end)
dclrp:Set(clr)
WindowOptions.main_color = clr
Settings:AddButton("Reset UI Color",function()
    local clrp = Color3.fromRGB(142, 21, 212)
    checkdir()
    writefile("meepcracked\\clr.txt",table.concat({clrp.R,clrp.G,clrp.B},";"))
    dclrp:Set(clrp)
    WindowOptions.main_color = clrp
end)

local plantitems = {}

local selectedpitem = nil

for i,v in pairs(require(game.ReplicatedStorage.AssetList)) do
	if v.SpecialObjectType == 5 or v.SpecialObjectType == 2 or v.SpecialObjectType == 6 then
		plantitems[v.Title] = v.AssetId
	end
end

local Dropdown = Plant:AddDropdown("Plant Item", function(itemname)
	selectedpitem = plantitems[itemname]
end)

for i,v in pairs(plantitems) do
	Dropdown:Add(i)
end

Plant:AddButton("Plant Item",function()
	if selectedpitem then
		local LP = game.Players.LocalPlayer
		local c = LP.Character
		if c then
			local root = c:FindFirstChild("HumanoidRootPart")
			if root then
				game:GetService("ReplicatedStorage").Connection:InvokeServer(344, selectedpitem, LP.Data.VirtualWorld.Value, root.Position)
			end
		end
	end
end)

Plant:AddSwitch("Spam Plant Item",loopwrap(function()
	if selectedpitem then
		local LP = game.Players.LocalPlayer
		local c = LP.Character
		if c then
			local root = c:FindFirstChild("HumanoidRootPart")
			if root then
				game:GetService("ReplicatedStorage").Connection:InvokeServer(344, selectedpitem, LP.Data.VirtualWorld.Value, root.Position)
			end
		end
	end
end,20))

local Annoyance = ServerDWindow:AddTab("Annoyance")

Annoyance:AddSwitch("Spam Fireworks",loopwrap(function()
    
game:GetService("ReplicatedStorage").Connection:InvokeServer(202, 1310)
	game:GetService("ReplicatedStorage").Connection:InvokeServer(201, 1310, {})
	game:GetService("ReplicatedStorage").ConnectionEvent:FireServer(210)
end,80))

Annoyance:AddSwitch("Spam Balloons",loopwrap(function()
    game:GetService("ReplicatedStorage").Connection:InvokeServer(202)
	game:GetService("ReplicatedStorage").Connection:InvokeServer(201, 1312, {})
	game:GetService("ReplicatedStorage").Connection:InvokeServer(202)
end,20))

Local:AddButton("Fix Item Spam",function()
	repeat
		local m = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Model")
		if m then m:Destroy() end
	until  game.Players.LocalPlayer.Character:FindFirstChildOfClass("Model") == nil
	game:GetService("ReplicatedStorage").Connection:InvokeServer(202)
end)

Annoyance:AddSwitch("Spam Teleport Notification",loopwrap(function()
	for _, player in pairs(game.Players:GetPlayers()) do
		game:GetService("ReplicatedStorage").Connection:InvokeServer(154,player.UserId,{})
	end
end,5))

Annoyance:AddButton("Load Fling Script (Buggy & Breaks)",function()
	local LP = game:GetService("Players").LocalPlayer

local function align(part0,part1)
	local attachment0 = Instance.new("Attachment",part1)
	local attachment1 = Instance.new("Attachment",part0)
	
	local alignpos = Instance.new("AlignPosition",part0)
	alignpos.MaxForce = math.huge
	alignpos.Responsiveness = 200
	alignpos.Attachment0 = attachment0
	alignpos.Attachment1 = attachment1
end

local function fling(part0)
	local vel = Instance.new("BodyAngularVelocity",part0)
	vel.AngularVelocity = Vector3.new(1,1,1)*999
	vel.MaxTorque = Vector3.new(1,1,1)*9999
end

local function loadcharacter(character)
	local scf = character.HumanoidRootPart.CFrame
	character.HumanoidRootPart.CFrame = scf*CFrame.new(0,100,0)
	character.HumanoidRootPart.Anchored = true

	wait(1)

	local fakec = Instance.new("Model",workspace)
	
	local froot = Instance.new("Part",fakec)
	froot.Name = "HumanoidRootPart"
	froot.Size = Vector3.new(1,5,1)
	froot.CFrame = scf
	froot.Transparency = 0.5
	
	Instance.new("Humanoid",fakec)
	
	LP.Character = fakec
	workspace.CurrentCamera.CameraSubject = fakec.Humanoid
	
	align(froot,character.HumanoidRootPart)
	
	character.Humanoid:Destroy()

	for _,p in pairs(character:GetDescendants()) do
		if p:IsA("BasePart") then
			p.CanCollide = false
			p.Massless = true
		elseif p:IsA("BodyGyro") or p:IsA("BodyAngularVelocity") or p:IsA("BodyVelocity") then
			p:Destroy()
		end
	end
	
	game.RunService.Heartbeat:Connect(function()
		for _,p in pairs(character:GetDescendants()) do
		if p:IsA("BasePart") then
			p.CanCollide = false
			p.Massless = true
			p.Anchored = false
		elseif p:IsA("Weld")then
			p.Enabled = false
		end
	end
	end)

	
	wait()
	
	wait(1)
	fling(character.HumanoidRootPart)
end

game:GetService("ReplicatedStorage").Connection:InvokeServer(332)

wait(1)

loadcharacter(LP.Character)
end)

local Cloner = AvatarWindow:AddTab("Cloner")

local sdo = false

local function begincselect()
	if not sdo then
		sdo = true
		local mouse = game.Players.LocalPlayer:GetMouse()

		local selection = Instance.new("SelectionBox")
		selection.Color3 = WindowOptions.main_color

		local st = nil
		local schar = nil
		local r = false

		local selecting = game:GetService("RunService").RenderStepped:Connect(function()
			local target = mouse.Target
			if target ~= st then
				if target and target:FindFirstAncestorOfClass("Model") and target:FindFirstAncestorOfClass("Model"):FindFirstChildOfClass("Humanoid") and target:FindFirstAncestorOfClass("Model"):FindFirstChildOfClass("Humanoid"):FindFirstChildOfClass("HumanoidDescription") and target:FindFirstAncestorOfClass("Model"):FindFirstChild("HumanoidRootPart") then
					local char = target:FindFirstAncestorOfClass("Model")
					selection.Parent = char.HumanoidRootPart
					selection.Adornee = char.HumanoidRootPart
				else
					selection.Parent = nil
					selection.Adornee = nil
				end
				st = target
			end
		end)

		local m
		m = mouse.Button1Down:Connect(function()
			selecting:Disconnect()
			selection:Destroy()
			local target = st
			if target and target:FindFirstAncestorOfClass("Model") and target:FindFirstAncestorOfClass("Model"):FindFirstChildOfClass("Humanoid") and target:FindFirstAncestorOfClass("Model"):FindFirstChildOfClass("Humanoid"):FindFirstChildOfClass("HumanoidDescription") and target:FindFirstAncestorOfClass("Model"):FindFirstChild("HumanoidRootPart") then
				local char = target:FindFirstAncestorOfClass("Model")
				schar = char
				r = true
			else
				schar = nil
				r = true
			end
			m:Disconnect()
		end)

		repeat wait() until r
		sdo = false
		return schar
	end
end

local schar = nil

local cn

Cloner:AddButton("Select Character",function()
	local char = begincselect()
	schar = char
	if char then
		cn.Text = char.Name
	end
end)

cn = Cloner:AddLabel("Character Name")

local function colorToTable(clr) return {tostring(clr.R*255),tostring(clr.G*255),tostring(clr.B*255)} end


local function ExtractData(humdes)
	local ava = {}

	for _,v in pairs({"WidthScale", "HeadScale","HeightScale","DepthScale","BodyTypeScale","ProportionScale"}) do
		ava[v] = humdes[v]
	end

	for _,v in pairs({"Face","Head","LeftArm","RightArm","LeftLeg","RightLeg","Torso"}) do
		ava[v] = humdes[v]
	end

	for _,v in pairs({"HeadColor","LeftArmColor","RightArmColor","LeftLegColor","RightLegColor","TorsoColor"}) do
		ava[v] = colorToTable(humdes[v])
	end

	for _,v in pairs({"GraphicTShirt","Shirt","Pants"}) do
		ava[v] = humdes[v]
	end

	for _,v in pairs({"ClimbAnimation","FallAnimation","IdleAnimation","JumpAnimation","RunAnimation","SwimAnimation","WalkAnimation"}) do
		ava[v] = humdes[v]
	end


	for _,v in pairs({"Hat","Hair","Back","Face","Front","Neck","Shoulders","Waist"}) do
		ava[v .. "Accessory"] = humdes[v .. "Accessory"]
	end
	ava.Emotes = humdes:GetEmotes()

	local layered = humdes:GetAccessories(false)

	for i,v in pairs(layered) do
		if v.AccessoryType and typeof(v.AccessoryType) == "EnumItem" then
			v.AccessoryType = v.AccessoryType.Name
		end
	end

	ava.AccessoryBlob = layered

	return ava
end

local hori = Cloner:AddHorizontalAlignment()
hori:AddButton("Load Avatar",function()
	if schar and schar.Parent and schar:FindFirstChildOfClass("Humanoid") and schar:FindFirstChildOfClass("Humanoid"):FindFirstChildOfClass("HumanoidDescription") then
		local data = ExtractData(schar:FindFirstChildOfClass("Humanoid"):FindFirstChildOfClass("HumanoidDescription"))
		game:GetService("ReplicatedStorage").ConnectionEvent:FireServer(315,data,true)
	end
end)

hori:AddButton("Save Avatar",function()
	if schar and schar.Parent and schar:FindFirstChildOfClass("Humanoid") and schar:FindFirstChildOfClass("Humanoid"):FindFirstChildOfClass("HumanoidDescription") then
		local data = ExtractData(schar:FindFirstChildOfClass("Humanoid"):FindFirstChildOfClass("HumanoidDescription"))
		game:GetService("ReplicatedStorage").Connection:InvokeServer(65,"CLONE")
		game:GetService("ReplicatedStorage").Connection:InvokeServer(319,data)
	end
end)

local Presets = AvatarWindow:AddTab("Presets")

local apre = {
	{
		Title = "Glitched Avatar",
		Data = (function()
			local jacketnum = 28

			local payload = {}
			payload.AccessoryBlob = {}

			for i,v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGet("https://catalog.roblox.com/v1/search/items?category=Clothing&limit=" .. tostring(jacketnum) .. "&subcategory=JacketAccessories")).data) do
			    table.insert(payload.AccessoryBlob,{
			        AssetId = v.id,
			        AccessoryType = "Jacket",
			        Order = math.huge,
			        Puffiness = math.huge
			    })
			end

			return payload
		end)()
	}
}

for _,preset in pairs(apre) do
	Presets:AddLabel(preset.Title)
	local hori = Presets:AddHorizontalAlignment()
	hori:AddButton("Load Avatar",function()
		game:GetService("ReplicatedStorage").ConnectionEvent:FireServer(315,Presets.Data,true)
	end)
end

Welcome:Show()
Throwing:Show()
MMain:Show()
Annoyance:Show()
Cloner:Show()
library:FormatWindows()