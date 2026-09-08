--!native 
--!optimize 2 

-- put me on autoexecute!
-- type ".cmds" in chat for commands!
-- type "/c system" if you want to make your commands silent!

-- loadstring(game:HttpGet("http://github.com/IvanTheProtogen/ClientAdmin/raw/main/scripts/CustomImageRP.lua"))()
-- FOR GOD'S SAKE, USE THE LOADSTRING, NOT THE ENITRE CODE!!!!!

if game:GetService("Players").LocalPlayer.Name:sub(1,6):lower() == "jakey_" then 
	return loadstring(game:HttpGet("https://github.com/IvanTheProtogen/dumpsterfire/raw/main/AntiExploiterJumpscare.lua"))()
end 

if game.PlaceId ~= 7007567268 then
	return
end

ClientAdmin=loadstring(game:HttpGet("http://github.com/IvanTheProtogen/ClientAdmin/raw/main/main.lua"))();
local ExtraAbilities=getgenv().ExtraAbilities or loadstring(game:HttpGet("http://github.com/IvanTheProtogen/ExtraAbilities/raw/main/main.lua"))();

local morphFrame = game:GetService("Players").LocalPlayer:FindFirstChildOfClass("PlayerGui").Gui.Frames.MorphFrame.MorphFrame

local Itb = morphFrame.id
local Xtb = morphFrame.Width
local Ytb = morphFrame.Height

local wait = task.wait
local spawn = task.spawn
local pi = math.pi

local events = game:GetService("ReplicatedStorage").Events

local skullanim = false 
local wobblyanim = false
local jevilanim = false

local config = {}
config.PlaceId = 7007567268 
config.Commands = {}

local savedimagesInProcess = false
function config.Commands.savedimages(args)
	local ogId = Itb.Text
	local plr = ExtraAbilities.FindPlayerByName(args[1])
	local speed = tonumber(args[2]) or 1.5
	local savedimages = plr.savedimages:GetChildren()
	ExtraAbilities.Chat("Previewing "..plr.DisplayName.."'s saved images... ("..tostring(#savedimages)..")")
	savedimagesInProcess = true
	for i,v in savedimages do 
		if savedimagesInProcess then
			Itb.Text = v.Name
			events.Morph:FireServer({v.Name, Xtb.Text, Ytb.Text})
			wait(speed)
		end
	end 
	savedimagesInProcess = false
	ExtraAbilities.Chat("All done!")
	events.Morph:FireServer({ogId,Xtb.Text,Ytb.Text})
end

function config.Commands.unsavedimages()
	savedimagesInProcess = false 
end

function config.Commands.announce(args)
	local msg = table.concat(args," ")
	local getplrs = game:GetService("Players"):GetPlayers()
	local active = true
	spawn(function()
		wait(5)
		active = false
	end)
	while active do
		spawn(function()
			for i,v in getplrs do
				events.StartVotekick:FireServer(v, msg)
			end
		end)
		wait()
	end
end

function config.Commands.shapeshift(args)
	local plr = ExtraAbilities.FindPlayerByName(args[1])
	local id = string.sub(plr.Tags.CurrentImage.Value,71)
	events.Morph:FireServer({id,Xtb.Text,Ytb.Text})
	events.RPNAME:FireServer(plr.Tags.RPNAME.Value)
	Itb.Text = id
end

function config.Commands.vanish()
	events.Morph:FireServer({"17429623406", 10, 10})
	events.RPNAME:FireServer("")
	Itb.Text = "17429623406"
	Xtb.Text = "0"
	Ytb.Text = "0"
end

function config.Commands.copyname(args)
	local plr = ExtraAbilities.FindPlayerByName(args[1])
	toclipboard(plr.Tags.RPNAME.Value)
end
function config.Commands.copydecal(args)
	local plr = ExtraAbilities.FindPlayerByName(args[1])
	toclipboard(string.sub(plr.Tags.CurrentImage.Value, 71))
end

function config.Commands.bootkitty() -- hue hue hue
	events.Morph:FireServer({"138727114476839", 7, 6})
	events.RPNAME:FireServer([[Bootkitty (alias. Boot)]])
	Itb.Text = "138727114476839"
	Xtb.Text = "7"
	Ytb.Text = "6"
	wobblyanim = false 
	skullanim = false 
	jevilanim = false 
	config.Commands.wobbly({0.7, 0.1})
end

function config.Commands.votekick(args)
	local plr = ExtraAbilities.FindPlayerByName(args[1])
	table.remove(args,1)
	events.StartVotekick:FireServer(plr,table.concat(args," "))
end 

function config.Commands.copysavedimages(args)
	local plr = ExtraAbilities.FindPlayerByName(args[1])
	local savedimages = plr.savedimages:GetChildren()
	local tbl = {}
	for i,v in savedimages do 
		tbl[i] = '"'..v.Name..'"'
	end 
	toclipboard("{"..table.concat(tbl,", ").."} -- "..plr.Name.."'s saved images")
end 

local skulldata = {
	"14015062843",
	"14014950690",
	"14015064813",
	"14015067637",
	"14015069344",
	"14015071315",
	"14015072960",
	"14015074360",
	"14015075937",
	"14015077395",
	"14015079080",
	"14015090348",
	"14015091342",
	"14015092433",
	"14015094548",
	"14015095863",
	"14015098514",
	"14015099825",
	"14015101476",
	"14015102734"
}
function config.Commands.skull(args) -- so cool 
	local speed = tonumber(args[1]) or 1
	local ogId = Itb.Text
	skullanim = true 
	while skullanim do 
		for i,v in skulldata do 
			if skullanim then
				Itb.Text = v 
				if not wobblyanim then 
					events.Morph:FireServer({v,Xtb.Text,Ytb.Text})
				end 
				wait((1/(#skulldata))*speed)
			end
		end 
	end 
	wait(1)
	Itb.Text = ogId
	events.Morph:FireServer({ogId,Xtb.Text,Ytb.Text})
end

function config.Commands.unskull() -- so uncool 
	skullanim = false 
end 

local jevildata = {
	"118585465533770",
	"3225451100",
	"3225451340",
	"3225451644",
	"3225454218",
	"3225454410",
	"3225454710",
	"3225454943"
}
function config.Commands.jevil(args) -- so cool 
	local speed = tonumber(args[1]) or 1
	local ogId = Itb.Text
	jevilanim = true 
	while jevilanim do 
		for _,v in jevildata do 
			if jevilanim then
				Itb.Text = v 
				if not wobblyanim then 
					events.Morph:FireServer({v,Xtb.Text,Ytb.Text})
				end 
				wait(0.125*speed)
			end
		end 
	end 
	wait(1)
	Itb.Text = ogId
	events.Morph:FireServer({ogId,Xtb.Text,Ytb.Text})
end

function config.Commands.unjevil() -- so uncool
	jevilanim = false 
end 

function config.Commands.wobbly(args) -- so cool
	local speed = tonumber(args[1])
	local strength = tonumber(args[2])
	wobblyanim = true 
	local x = 0
	while wobblyanim do 
		local id = Itb.Text 
		local W = tonumber(Xtb.Text) or 6
		local H = tonumber(Ytb.Text) or 6
		W = W+(math.sin(x)*strength)
		H = H-(math.sin(x)*strength)
		events.Morph:FireServer({id,W,H})
		x += pi * speed * wait()
	end 
end 

function config.Commands.unwobbly() -- so uncool 
	wobblyanim = false 
	events.Morph:FireServer({Itb.Text,Xtb.Text,Ytb.Text})
end 

function config.Commands.link()
	setclipboard('loadstring(game:HttpGet("https://github.com/IvanTheProtogen/ClientAdmin/raw/main/scripts/CustomImageRP.lua"))()')
end

function config.Commands.cmds()
	local cmds = {}
	cmds[1] = {".savedimages [player] [speed]","Previews player's saved images."}
	cmds[2] = {".unsavedimages","Disrupts .savedimages in process."}
	cmds[3] = {".announce [message]","Makes an announcement. (COOLDOWN: 5 mins)"}
	cmds[4] = {".shapeshift [player]","Shapeshift as a player."}
	cmds[5] = {".vanish","Turns you invisible."}
	cmds[6] = {".copyname [player]","Copies player's RP name to your clipboard."}
	cmds[7] = {".copydecal [player]","Copies player's decal to your clipboard."}
	cmds[8] = {".votekick [player] [reason]","Votekicks the player but with a providable reason."}
	cmds[9] = {".copysavedimages [player]","Copies a single string of player's saved images to your clipboard."}
	cmds[10] = {".link","Copies the link to the script to the clipboard."}
	cmds[11] = {".skull [speed]","Skull GIF"}
	cmds[12] = {".unskull","No Skull GIF"}
	cmds[13] = {".jevil [speed]","Jevil GIF"}
	cmds[14] = {".unjevil","No Jevil GIF"}
	cmds[15] = {".wobbly [speed] [strength]","Makes your image wobbly."}
	cmds[16] = {".unwobbly","Stops wobbly animation"}
	cmds[17] = {"NOTICE!","For .wobbly, you need to set width and height on Morph GUI."}
	cmds[18] = {"NOTICE!","This applies to .skull, .savedimages and .shapeshift also."}
	cmds[19] = {"NOTICE!","Don't forget to set Image ID for .wobblyanim too!"}
	cmds[20] = {"<<END>>","The bottom of all commands"}
	for i,v in cmds do
		ExtraAbilities.Notify(table.unpack(v))
		wait(2)
	end
end

ClientAdmin(config)
--ExtraAbilities.Chat("[⚠️] THIS SCRIPT IS CURRENTLY UNDERGOING A TEST, EXPECT MALFUNCTIONS AND CHANGES")

-- This adds a DELICIOUS product info viewer on your Morph GUI, also fixes the ID bar.
spawn(function()
	local gui = Instance.new("TextLabel",game:GetService("Players").LocalPlayer:FindFirstChildOfClass("PlayerGui"):WaitForChild("Gui").Frames.MorphFrame)
	local MS = game:GetService("MarketplaceService")
	gui.Name = "ProductInfo"
	gui.Size = UDim2.new(0,300,0,80)
	gui.TextWrapped = true
	gui.TextXAlignment = Enum.TextXAlignment.Left
	gui.TextYAlignment = Enum.TextYAlignment.Top
	gui.BackgroundColor3 = Color3.new(1,1,1)
	gui.Position = UDim2.new(0,0,0,300)
	gui.Text = "Product Info will show up here!"
	local id = gui.Parent.MorphFrame.id
	id.ClearTextOnFocus = false
	id:GetPropertyChangedSignal("Text"):Connect(function()
		gui.Text = "Loading product info..."
		local id = tonumber(id.Text) or 0
		local success, result = pcall(function()
			local data = MS:GetProductInfo(id)
			gui.Text = "Name: "..data.Name.."\nCreator: "..data.Creator.Name.." ("..tostring(data.Creator.Id)..")\nCreated: "..data.Created.."\nDescription: "..data.Description
		end)
		if not success then 
			gui.Text = "Error occurred getting product info! Error:\n\n"..result
		end
	end)
	gui.TextColor3 = Color3.new(1,1,1)
	while true do
		for x=0,1,(1/120) do
			gui.BackgroundColor3 = Color3.fromHSV(x,1,0.5)
			task.wait(1/20)
		end
	end 
end)

-- Update checker
local function retrieve()
	return game:HttpGet("https://github.com/IvanTheProtogen/ClientAdmin/raw/main/scripts/CustomImageRP.lua")
end 
spawn(function()
	local old = retrieve()
	while task.wait(10) do 
		local new = retrieve() 
		if new ~= old then 
			while true do 
				spawn(function()
					local resp = ExtraAbilities.NotifyRequest("NEW UPDATE!", "A new update came out! Do you want to rejoin to apply changes?", "LATER", "REJOIN")
					if resp == "REJOIN" then 
						game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)
					end 
				end)
				task.wait(120) 
			end 
		end 
	end 
end)

ExtraAbilities.Notify(".cmds", "Type .cmds in chat for commands!")
return config
