--[[

Sky Hub

By Sky/jazminethecooles2001

games it supports Da Hood, Arsenal, Tower of Hell, KAT!, Fencing,
Work At A Pizza Place, VR Hands, Adopt Me, Jailbreak, Prison Life,
Build A Boat For Treasure, Gorilla Tag Professional, Murder Mystery 2, Blox Fruits, Counter Blox, Mic Up, Neighbors, Natural Disaster Survival, Ro-Ghoul, Blade Ball, Pet Simulator X,
Pet Simulator 99, Legends of Speed, BrookHaven RP, Bedwars, CHAOS, Ninja Legends, Bayside High School, BIG PaintBall!, BIG PaintBall 2!, Muscle Legends, Road to Grambys, Bloxburg, Cursed Sea, Doors,
Hide and Seek Extreme, Life in Paradise, Adopt and Raise a Baby, Zombie Attack, Super Simon Says, Life Sentence, Rainbow Friends, Infectious Smile, Colony Survival, Red Light, Green Light, 3008, 
Guess the drawing!, VR Hangout, VR Hands Legacy, RIVALS, Lifting Simulator and Universal.
50+ games (Including some obbys)

Rebuilt On IllusionHub

Last Updated 7/30/2025 (by yatasive)

fixed scroll list limit (hiding sum tabs on universal mode) and added RIVALS and Lifting Simulator, removed rejgames.
Library by Lua_u (modified by jazminethecooles2001)

executor ui in fencing and universal made by espresso0069

Road to Gramby scripts by Lua_u

Rainbow Sunlock by therealxora https://discord.gg/iosexploiters

IF YOU WANT ME TO ADD A GAME OR REPORT A BUG JOIN MY DISCORD SERVER OR DM ME

https://discord.gg/5vwJhFHERw

]]--
if game:GetService("CoreGui"):FindFirstChild("incognito") then
    oldstring = loadstring
    getfenv().loadstring = function(code)
        local source = code
        source = source:gsub("(%a+)%s*([%+%-%*/])=%s*", "%1 = %1 %2 ")
        return oldstring(source)
    end
end
if not getgenv then
    getfenv().getgenv = function(layer)
        return getfenv(layer)
    end
end
local nosaves = false
local saved_settings
local settings = {
	ui_bind = "Enum.KeyCode.RightControl";
	opaque = 0.4;
}
queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
HttpService = game:GetService("HttpService")
everyClipboard = setclipboard or toclipboard or set_clipboard or setrbxclipboard or (Clipboard and Clipboard.set)
if not everyClipboard then
	-- creds to vxsty
getgenv().setclipboard = function(data)
    local vim = game:GetService('VirtualInputManager');
    local old = game:GetService("UserInputService"):GetFocusedTextBox()
    local copy = tostring(data)
    local gui = Instance.new("ScreenGui", getgenv().gethui())
    local a = Instance.new('TextBox', gui)
    a.PlaceholderText = ''
    a.Text = copy
    a.ClearTextOnFocus = false
    a.Size = UDim2.new(.1, 0, .15, 0)
    a.Position = UDim2.new(10, 0, 10, 0)
    a:CaptureFocus()
    a = Enum.KeyCode
    local Keys = {
     a.RightControl, a.A
    }
    local Keys2 = {
     a.RightControl, a.C, a.V
    }
    for i, v in ipairs(Keys) do
     vim:SendKeyEvent(true, v, false, game)
     task.wait()
    end
    for i, v in ipairs(Keys) do
     vim:SendKeyEvent(false, v, false, game)
     task.wait()
    end
    for i, v in ipairs(Keys2) do
     vim:SendKeyEvent(true, v, false, game)
     task.wait()
    end
    for i, v in ipairs(Keys2) do
     vim:SendKeyEvent(false, v, false, game)
     task.wait()
    end
    gui:Destroy()
    if old then old:CaptureFocus() end
end
-- creds to vxsty
getgenv().setrbxclipboard = function(data)
    local vim = game:GetService('VirtualInputManager');
    local old = game:GetService("UserInputService"):GetFocusedTextBox()
    local copy = tostring(data)
    local gui = Instance.new("ScreenGui", getgenv().gethui())
    local a = Instance.new('TextBox', gui)
    a.PlaceholderText = ''
    a.Text = copy
    a.ClearTextOnFocus = false
    a.Size = UDim2.new(.1, 0, .15, 0)
    a.Position = UDim2.new(10, 0, 10, 0)
    a:CaptureFocus()
    a = Enum.KeyCode
    local Keys = {
     a.RightControl, a.A
    }
    local Keys2 = {
     a.RightControl, a.C, a.V
    }
    for i, v in ipairs(Keys) do
     vim:SendKeyEvent(true, v, false, game)
     task.wait()
    end
    for i, v in ipairs(Keys) do
     vim:SendKeyEvent(false, v, false, game)
     task.wait()
    end
    for i, v in ipairs(Keys2) do
     vim:SendKeyEvent(true, v, false, game)
     task.wait()
    end
    for i, v in ipairs(Keys2) do
     vim:SendKeyEvent(false, v, false, game)
     task.wait()
    end
    gui:Destroy()
    if old then old:CaptureFocus() end
end
-- creds to vxsty
getgenv().toclipboard = function(data)
    local vim = game:GetService('VirtualInputManager');
    local old = game:GetService("UserInputService"):GetFocusedTextBox()
    local copy = tostring(data)
    local gui = Instance.new("ScreenGui", getgenv().gethui())
    local a = Instance.new('TextBox', gui)
    a.PlaceholderText = ''
    a.Text = copy
    a.ClearTextOnFocus = false
    a.Size = UDim2.new(.1, 0, .15, 0)
    a.Position = UDim2.new(10, 0, 10, 0)
    a:CaptureFocus()
    a = Enum.KeyCode
    local Keys = {
     a.RightControl, a.A
    }
    local Keys2 = {
     a.RightControl, a.C, a.V
    }
    for i, v in ipairs(Keys) do
     vim:SendKeyEvent(true, v, false, game)
     task.wait()
    end
    for i, v in ipairs(Keys) do
     vim:SendKeyEvent(false, v, false, game)
     task.wait()
    end
    for i, v in ipairs(Keys2) do
     vim:SendKeyEvent(true, v, false, game)
     task.wait()
    end
    for i, v in ipairs(Keys2) do
     vim:SendKeyEvent(false, v, false, game)
     task.wait()
    end
    gui:Destroy()
    if old then old:CaptureFocus() end
end
end
if not cloneref then
	getgenv().cloneref = function(a)
		local s, _ = pcall(function() return a:Clone() end) return s and _ or a
	end
end
HttpService = cloneref(game:GetService("HttpService")) or game:GetService("HttpService")
defaults = HttpService:JSONEncode(settings)
local OptTheme = "Midnight"
local string2 = "https://discord.com/invite/jVf7eSrED9"
_G.infydtype = 1
_G.guidragtype = "https://raw.githubusercontent.com/yofriendfromschool1/aw-temp-fix/main/skui.lua"
UserInputService = game:GetService("UserInputService")
VREnabled = game:GetService("VRService").VREnabled
local IsOnMobile = table.find({
	Enum.Platform.IOS,
	Enum.Platform.Android
}, UserInputService:GetPlatform())
local iswave = false
if detourfunction then
	if not IsOnMobile then
		iswave = true
	end
end
if IsOnMobile then
	_G.infydtype = "https://raw.githubusercontent.com/yofriendfromschool1/mobile-delta-inf-yield/main/deltainfyield.txt"
elseif iswave then
	_G.infydtype = "https://raw.githubusercontent.com/yofriendfromschool1/wave_fixedscripts/main/iy.lua"
else
	_G.infydtype = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"
end

_G.lmao24 = "loo"
if game:GetService("SoundService").RespectFilteringEnabled == true then
	_G.lmao24 = "Enabled"
else
	_G.lmao24 = "Disabled"
end
function save()
	if not isfolder("Sky Hub") and not nosaves then
		makefolder("Sky Hub")
		nosaves = true
		task.wait()
		local update = {
			["ui_bind"] = settings["ui_bind"],
			["opaque"] = settings["opaque"]
		}
		task.wait()
		writefile([[Sky Hub/Sky Hub Settings.json]], HttpService:JSONEncode(update))
	end
end
function updatesaves()
	local update = {
		ui_bind = ui_bind;
		opaque = opaque;
	}
	writefile("Sky Hub/Sky Hub Settings.json", HttpService:JSONEncode(update))
end
task.wait()
function loadsettings()
	task.wait(1)
	if isfolder("Sky Hub") and isfile([[Sky Hub/Sky Hub Settings.json]]) then
		local success, response = pcall(function()
			local settings = HttpService:JSONDecode(readfile([[Sky Hub/Sky Hub Settings.json]]))
			if settings.ui_bind ~= nil or settings.ui_bind ~= "null" then
				if settings.ui_bind == "Enum.KeyCode.RightControl" then
					getgenv().SkyhubKeybind = Enum.KeyCode.RightControl
				elseif settings.ui_bind == "Enum.KeyCode.LeftControl" then
					getgenv().SkyhubKeybind = Enum.KeyCode.LeftControl
				elseif settings.ui_bind == "Enum.KeyCode.LeftAlt" then
					getgenv().SkyhubKeybind = Enum.KeyCode.LeftAlt
				elseif settings.ui_bind == "Enum.KeyCode.RightAlt" then
					getgenv().SkyhubKeybind = Enum.KeyCode.RightAlt
				elseif settings.ui_bind == "Enum.KeyCode.Insert" then
					getgenv().SkyhubKeybind = Enum.KeyCode.Insert
				elseif settings.ui_bind == "Enum.KeyCode.End" then
					getgenv().SkyhubKeybind = Enum.KeyCode.End
				elseif settings.ui_bind == "Enum.KeyCode.Delete" then
					getgenv().SkyhubKeybind = Enum.KeyCode.Delete
				elseif settings.ui_bind == "Enum.KeyCode.LeftShift" then
					getgenv().SkyhubKeybind = Enum.KeyCode.LeftShift
				elseif settings.ui_bind == "Enum.KeyCode.RightShift" then
					getgenv().SkyhubKeybind = Enum.KeyCode.RightShift
				elseif settings.ui_bind == "Enum.KeyCode.F1" then
					getgenv().SkyhubKeybind = Enum.KeyCode.F1
				elseif settings.ui_bind == "Enum.KeyCode.Q" then
					getgenv().SkyhubKeybind = Enum.KeyCode.Q
				elseif settings.ui_bind == "Enum.KeyCode.E" then
					getgenv().SkyhubKeybind = Enum.KeyCode.E
				elseif settings.ui_bind == "Enum.KeyCode.R" then
					getgenv().SkyhubKeybind = Enum.KeyCode.R
				elseif settings.ui_bind == "Enum.KeyCode.T" then
					getgenv().SkyhubKeybind = Enum.KeyCode.T
				elseif settings.ui_bind == "Enum.KeyCode.Y" then
					getgenv().SkyhubKeybind = Enum.KeyCode.Y
				elseif settings.ui_bind == "Enum.KeyCode.U" then
					getgenv().SkyhubKeybind = Enum.KeyCode.U
				elseif settings.ui_bind == "Enum.KeyCode.P" then
					getgenv().SkyhubKeybind = Enum.KeyCode.P
				elseif settings.ui_bind == "Enum.KeyCode.Z" then
					getgenv().SkyhubKeybind = Enum.KeyCode.Z
				elseif settings.ui_bind == "Enum.KeyCode.X" then
					getgenv().SkyhubKeybind = Enum.KeyCode.X
				elseif settings.ui_bind == "Enum.KeyCode.M" then
					getgenv().SkyhubKeybind = Enum.KeyCode.M
				elseif settings.ui_bind == "Enum.KeyCode.V" then
					getgenv().SkyhubKeybind = Enum.KeyCode.V
				elseif settings.ui_bind == "Enum.KeyCode.N" then
					getgenv().SkyhubKeybind = Enum.KeyCode.N
				elseif settings.ui_bind == "Enum.KeyCode.Period" then
					getgenv().SkyhubKeybind = Enum.KeyCode.Period
				end
			else
				getgenv().SkyhubKeybind = Enum.KeyCode.RightControl 
			end
			if settings.opaque ~= nil or settings.opaque ~= "null" then
				getgenv().BlurIntes = settings.opaque 
			else 
				getgenv().BlurIntes = 0.4 
			end
		end)
		if not success then
			Library.Notify("Warning", "Something went wrong while loading saves", 5)
			task.wait()
			save()
		end
	end
end
task.wait()
save()
-- Da Hood
if game.PlaceId == 2788229376 or game.PlaceId == 7213786345 or game.PlaceId == 16033173781 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/dahood.lua'))()
-- Arsenal
elseif game.PlaceId == 286090429 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/arsenal.lua'))()
-- Tower Of Hell
elseif game.PlaceId == 1962086868 or game.PlaceId == 3582763398 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/towerofhell.lua'))()
-- KAT!
elseif game.PlaceId == 621129760 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/kat.lua'))()
-- Fencing
elseif game.PlaceId == 12109643 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/fencing.lua'))()
-- Work at a Pizza Place
elseif game.PlaceId == 192800 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/workatapizzaplace.lua'))()
-- VR Hands
elseif game.PlaceId == 4832438542 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/vrhands.lua'))()
-- Adopt me
elseif game.PlaceId == 920587237 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/adoptme.lua'))()
-- JailBreak
elseif game.PlaceId == 606849621 or game.PlaceId == 17190407811 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/jailbreak.lua'))()
-- Prison Life
elseif game.PlaceId == 155615604 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/prisonlife.lua'))()
-- Build A Boat or BABFT
elseif game.PlaceId == 537413528 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/buildaboatfortreasure.lua'))()
-- Gorilla Tag Professional
elseif game.PlaceId == 8690998110 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/gorillatagprofessional.lua'))()
-- Murder Mystery 2 or MM2
elseif game.PlaceId == 142823291 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/murdermystery2.lua'))()
-- Blox Fruits
elseif game.PlaceId == 2753915549 or game.PlaceId == 4442272183 or game.PlaceId == 7449423635 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/bloxfruits.lua'))()
-- Counter Blox
elseif game.PlaceId == 301549746 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/counterblox.lua'))()
-- Mic Up
elseif game.PlaceId == 6884319169 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/micup.lua'))()
-- Neighbors
elseif game.PlaceId == 12699642568 or game.PlaceId == 14236925335 or game.PlaceId == 13108856598 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/neighbors.lua'))()
-- Natural Disaster Survival
elseif game.PlaceId == 189707 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/naturaldisastersurvival.lua'))()
-- Ro-Ghoul
elseif game.PlaceId == 914010731 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/ro-ghoul.lua'))()
-- Blade Ball
elseif game.PlaceId == 13772394625 or game.PlaceId == 14732610803 or game.PlaceId == 14915220621 or game.PlaceId == 15144787112 or game.PlaceId == 15264892126 or game.PlaceId == 15509350986 or game.PlaceId == 16281300371 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/bladeball.lua'))()
-- Pet Simulator X
elseif game.PlaceId == 6284583030 or game.PlaceId == 10321372166 then 
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/petsimulatorx.lua'))()
-- Pet Simulator 99
elseif game.PlaceId == 8737899170 or game.PlaceId == 16498369169 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/petsimulator99.lua'))()
-- Legends of Speed
elseif game.PlaceId == 3101667897 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/legendsofspeed.lua'))()
-- Brookhaven RP
elseif game.PlaceId == 4924922222 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/brookhavenrp.lua'))()
-- Bedwars
elseif game.PlaceId == 6872265039 or game.PlaceId == 6872274481 or game.PlaceId == 8444591321 or game.PlaceId == 8560631822 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/bedwars.lua'))()
-- CHAOS
elseif game.PlaceId == 6441847031 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/chaos.lua'))()
-- Ninja Legends
elseif game.PlaceId == 3956818381 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/ninjalegends.lua'))()
-- Bayside High School
elseif game.PlaceId == 12640491155 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/baysidehighschool.lua'))()
-- BIG PaintBall!
elseif game.PlaceId == 3527629287 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/bigpaintball.lua'))()
-- BIG PaintBall! 2
elseif game.PlaceId == 9865958871 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/bigpaintball2.lua'))()
-- Muscle Legends
elseif game.PlaceId == 3623096087 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/musclelegends.lua'))()
-- Road to Grambys from Luau
elseif game.PlaceId == 5796917097 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/roadtogrambys.lua'))()
-- Bloxburg
elseif game.PlaceId == 185655149 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/bloxburg.lua'))()
-- Doors
elseif game.PlaceId == 6516141723 or game.PlaceId == 6839171747 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/doors.lua'))()
-- Hide and Seek Extreme
elseif game.PlaceId == 205224386 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/hideandseekextreme.lua'))()
-- Life in Paradise 
elseif game.PlaceId == 1662219031 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/lifeinparadise.lua'))()
-- Adopt and Raise a Baby 
elseif game.PlaceId == 383793228 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/adoptandraiseacutebaby.lua'))()
-- Zombie Attack
elseif game.PlaceId == 1240123653 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/zombieattack.lua'))()
-- Super Simon Says
elseif game.PlaceId == 61846006 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/supersimonsays.lua'))()
-- Life Sentence
elseif game.PlaceId == 13083893317 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/lifesentence.lua'))()
-- Rainbow Friends
elseif game.PlaceId == 7991339063 or game.PlaceId == 13622985049 or game.PlaceId == 13622981808 or game.PlaceId == 8588743386 or game.PlaceId == 8888615802 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/rainbowfriends.lua'))()
-- Infectious Smile
elseif game.PlaceId == 5985232436 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/infectioussmile.lua'))()
-- Colony Survival
elseif game.PlaceId == 14888386963 or game.PlaceId == 14972061219 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/colonysurvival.lua'))()
-- Red Light, Green Light
elseif game.PlaceId == 7540891731 or game.PlaceId == 7577073048 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/redlightgreenlight.lua'))()
-- 3008
elseif game.PlaceId == 2768379856 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/3008.lua'))()
-- Guess the drawing!
elseif game.PlaceId == 3281073759 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/guessthedrawing.lua'))()
-- VR Hangout
elseif game.PlaceId == 8769714622 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/vrhangout.lua'))()
-- VR Hands Legacy
elseif game.PlaceId == 16912831373 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/vrhandslegacy.lua'))()
elseif game.PlaceId == 17625359962 or game.PlaceId == 18126510175 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/rivals.lua'))()
-- RIVALS
elseif game.PlaceId == 3652625463 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/games/liftingsimulator.lua'))()
-- Lifting Simulator
else
-- Universal
	local Library = loadstring(game:HttpGet(_G.guidragtype))()
	loadsettings()
	if IsOnMobile or VREnabled then
		Library.Notify("Warning", 'your OS is not supported with some scripts since of keyboard functions, do you want to execute a keyboard script?', 35, function(val)
			if val == true then
				
			else
				loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt"))()
			end
		end, {
			"Yes Please!",
			"Nah"
		})
	end
	if iswave then
		Library.Notify("Warning", 'Your Executor "Wave" Is dog shit and file functions are shit so would you like a fix for them so more support for more scripts or disable them? or ingore this and keep somewhat functions (takes abt 40 secs to go away)', 35, function(val)
			if val == true then
				loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/wave_fixedscripts/main/Disable%20file%20and%20folder%20functions%20Wave.lua"))()
			else
				loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/wave_fixedscripts/main/FileFixes.lua"))()
			end
		end, {
			"Enable Fix for file functions",
			"Disable File/Folder functions"
		})
	end
	if queueteleport then
		Library.Notify("Warning", "Would you like to bring this script with you on teleport/ to the next game?", 15, function(val)
			if val == true then
				
			else
				queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/SkyHub.txt'))()")
			end
		end, {
			"Yes",
			"No thanks."
		})
	end
	if writefile and readfile and makefolder then
		
	else
		Library.Notify("Warning", "Your Executor does not support saving files, Settings will not save.", 15)
	end
	if not IsOnMobile then
		Library.Notify("Current Keybind: " .. tostring(getgenv().SkyhubKeybind),"Your current keybind to toggle the gui is: " ..tostring(getgenv().SkyhubKeybind), 5)
	end
	for i,v in pairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
		if v:IsA("RemoteEvent") and (v.Name == "DestroySegway" or v.Name == "DeleteCar" or v.Name == "HandlessSegway" or v.Name == "Building Tools" or v.Name == "SetNetworkOwnership" or v.Name == "ChangeParent" or v.Name == "despawn" or v.Name == "AC6_FE_Sounds") then
			Library.Notify("OMG VULN/AC6 sound FOUND","Vuln name: '" .. v.Name .. "' if you want you can join the discord server and share it in #share-vuln-ac6-games by pasting the text, and provides an explaination",30)
			everyClipboard("https://www.roblox.com/games/"..game.PlaceId, v.Name)
		end
	end
	for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
		if v:IsA("RemoteEvent") and (v.Name == "DestroySegway" or v.Name == "DeleteCar" or v.Name == "HandlessSegway" or v.Name == "Building Tools" or v.Name == "SetNetworkOwnership" or v.Name == "ChangeParent" or v.Name == "despawn" or v.Name == "AC6_FE_Sounds") then
			Library.Notify("OMG VULN/AC6 sound FOUND","Vuln name: '" .. v.Name .. "' if you want you can join the discord server and share it in #share-vuln-ac6-games by pasting the text, and provides an explaination",30)
			everyClipboard("https://www.roblox.com/games/"..game.PlaceId, v.Name)
		end
	end
	local Window = Library.CreateLib("Sky Hub", OptTheme)
	local Discord = Window:NewTab("Discords",16795709379)
	local DiscordSection = Discord:NewSection("Discords")
	DiscordSection:NewButton("Discord Invite", "copys discord link", function()
		if httprequest and not IsOnMobile then
			httprequest({
				Url = 'http://127.0.0.1:6463/rpc?v=1',
				Method = 'POST',
				Headers = {
					['Content-Type'] = 'application/json',
					Origin = 'https://discord.com'
				},
				Body = HttpService:JSONEncode({
					cmd = 'INVITE_BROWSER',
					nonce = HttpService:GenerateGUID(false),
					args = {
						code = 'xPDF3DkKhk'
					}
				})
			})
			Library.Notify("if nothing happened", "Make sure u have discord app open", 5)
		elseif everyClipboard then
			everyClipboard("https://discord.gg/xPDF3DkKhk")
			Library.Notify("Copied to Clipboard", "", 5)
		else
			Library.Notify("DOG SHIT EXECUTOR", "https://discord.gg/xPDF3DkKhk", 5)
		end
	end)
	DiscordSection:NewButton("Discord Invite OLD", "Copys Discord invite link", function()
		everyClipboard(string2)
	end)
	local Debugs = Window:NewTab("Debuggers", 10507357657)
	local DebugsSection = Debugs:NewSection("Debuggers")
	DebugsSection:NewButton("Debuggers", "Some other GUI packed into one or sum", function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/debugnation/main/decompilers%20and%20debugging/Debuggers.txt"))()
	end)
	

	local Admins = Window:NewTab("Admins", 10016551771)
	local AdminsSection = Admins:NewSection("Admins")
	AdminsSection:NewButton("Infinite Yield FE", "Admin", function()
		loadstring(game:HttpGet(_G.infydtype))()
	end)
	AdminsSection:NewButton("Infinite Store", "Archived", function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Infinite-Store/Infinite-Store/main/main.lua"))()
	end)
	AdminsSection:NewButton("Nameless Admin", "Admin", function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/NamelessAdmin-NO-BYFRON-GUI/main/Source'))()
	end)
	AdminsSection:NewButton("fates admin", "Admin", function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/fatesc/fates-admin/main/main.lua"))();
	end)
	AdminsSection:NewButton("Cmd", "Admin", function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/lxte/cmd/main/main.lua"))()
	end)
	AdminsSection:NewButton("Cmd (TEST)", "Admin tests", function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/lxte/cmd/main/testing-main.lua"))()
	end)
	AdminsSection:NewButton("Shattervast Admin", "Admin", function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/%5BFE%5D%20Shattervast.lua'))()
	end)
	AdminsSection:NewButton("Proton Free Admin", "Admin", function()
		_G.UI_Id = "default" --set this to "default" for the default ui
		loadstring(game:HttpGet('https://raw.githubusercontent.com/DigitalityScripts/roblox-scripts/main/Proton%20Free'))()
	end)
	AdminsSection:NewButton("Proton 2 free Admin", "Admin", function()
			 -- DEFAULT CMD BAR PREFIX IS ;
			 -- DEFAULT CHAT PREFIX IS /
		_G.UI_Id = "default" --set this to "default" for the default ui
		loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/5e6e6cc1bb32fd926764d064e2c60a3b.lua"))()
	end)
	AdminsSection:NewButton("Reviz Admin V2", "Admin", function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/Reviz%20AdminV2"))()
	end)

	local Player = Window:NewTab("Player", 2795572800)
	local PlayerSection = Player:NewSection("Player")
	PlayerSection:NewSlider("WalkSpeed", "Changes how fast you walk", 500, 1, function(v)
		game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = v
	end)
	PlayerSection:NewSlider("Jumppower", "Changes how high you jump", 500, 1, function(v)
		game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = v
	end)
	PlayerSection:NewSlider("Gravity", "Changes gravity", 500, 1, function(v)
		game:GetService("Workspace").Gravity = v
	end)
	PlayerSection:NewSlider("FOV", "Changes Field Of View", 120, 1, function(v)
		game:GetService("Workspace"):WaitForChild("Camera").FieldOfView = v
	end)
	PlayerSection:NewButton("Unlock Third Person", "unlocks on most games", function()
		game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = 99999
		game:GetService("Players").LocalPlayer.CameraMode = Enum.CameraMode.Classic
	end)
	PlayerSection:NewSlider("Max Camera Zoom", "Changes zoom distance of camera", 99999, 1, function(v)
		game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = v
	end)
	PlayerSection:NewButton("Anti Lag/Low GFX", "makes you less laggy and helps boost fps/performance", function()
		local Terrain = game:GetService("Workspace"):FindFirstChildOfClass('Terrain')
		Lighting = game:GetService("Lighting")
		Terrain.WaterWaveSize = 0
		Terrain.WaterWaveSpeed = 0
		Terrain.WaterReflectance = 0
		Terrain.WaterTransparency = 0
		Lighting.GlobalShadows = false
		Lighting.FogEnd = 9e9
		for i,v in pairs(game:GetDescendants()) do
			if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
				v.Material = "Plastic"
				v.Reflectance = 0
			elseif v:IsA("Decal") then
				v.Transparency = 1
			elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
				v.Lifetime = NumberRange.new(0)
			elseif v:IsA("Explosion") then
				v.BlastPressure = 1
				v.BlastRadius = 1
			end
		end
		for i,v in pairs(Lighting:GetDescendants()) do
			if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
				v.Enabled = false
			end
		end
		game:GetService("Workspace").DescendantAdded:Connect(function(child)
			task.spawn(function()
				if child:IsA('ForceField') then
					game:GetService("RunService").Heartbeat:Wait()
					child:Destroy()
				elseif child:IsA('Sparkles') then
					game:GetService("RunService").Heartbeat:Wait()
					child:Destroy()
				elseif child:IsA('Smoke') or child:IsA('Fire') then
					game:GetService("RunService").Heartbeat:Wait()
					child:Destroy()
				end
			end)
		end)
	end)
	PlayerSection:NewToggle("Anti-AFK", "so you cant disconnect after 20 minutes of idling", function(state)
		if state then
			ANTIAFK = game:GetService("Players").LocalPlayer.Idled:connect(function()
				game:FindService("VirtualUser"):Button2Down(Vector2.new(0,0),game:GetService("Workspace").CurrentCamera.CFrame)
				task.wait(1)
				game:FindService("VirtualUser"):Button2Up(Vector2.new(0,0),game:GetService("Workspace").CurrentCamera.CFrame)
			end)
			Library.Notify("WARNING","Successfully Enabled Anti-AFK!",5)
		else
			if ANTIAFK then
				ANTIAFK:Disconnect()
				wait();
				Library.Notify("WARNING","Successfully Disabled Anti-AFK!",5)
			end
		end
	end)
	PlayerSection:NewToggle("Loop Full Bright", "makes game bright so if its dark u can actually see", function(state)
		local aLighting = game:GetService("Lighting")
		local oldbrit = aLighting.Brightness
		local oldclocktime = aLighting.ClockTime
		local oldfogend = aLighting.FogEnd
		local oldglobshads = aLighting.GlobalShadows
		local oldoutdooramb = aLighting.OutdoorAmbient
		local Lighting = cloneref(game:GetService("Lighting"))
		if not state then
			brightLoop:Disconnect()
			Lighting.Brightness = oldbrit
			Lighting.ClockTime = oldclocktime
			Lighting.FogEnd = oldfogend
			Lighting.GlobalShadows = oldglobshads
			Lighting.OutdoorAmbient = oldoutdooramb
		end
		local function brightFunc()
			Lighting.Brightness = 2
			Lighting.ClockTime = 14
			Lighting.FogEnd = 100000
			Lighting.GlobalShadows = false
			Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
		end
	
		brightLoop = game:GetService("RunService").RenderStepped:Connect(brightFunc)
	end)
	if IsOnMobile or VREnabled then
		PlayerSection:NewButton("enable Shiftlock", "unlocks on most games", function()
			Library.Notify("Shift Lock Enabled", "Gui should pop up on your right", 5)
			loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/mobileshiftlock.txt"))()
		end)
	else
		PlayerSection:NewToggle("enable/disable shiftlock", "unlocks on most games", function(value)
			game:GetService("Players").LocalPlayer.DevEnableMouseLock = value
			if value then
				Library.Notify("Shift Lock Enabled", "Just press shift or enable it in roblox settings", 5)
			else
				Library.Notify("Shift Lock Disabled", "", 5)
			end
		end)
	end

	local ACBypass = Window:NewTab("AC Bypass")
	local ACBypassSection = ACBypass:NewSection("AC Bypass")
	ACBypassSection:NewButton("Anti Kick", "Stops local scripts from kicking you", function()
		local mt = getrawmetatable(game)

		setreadonly(mt, false)

		local oldmt = mt.__namecall

		mt.__namecall = newcclosure(function(Self, ...)


		local method = getnamecallmethod()

		if method == 'Kick' then
		
			print("Tried To kick")
			wait(9e9)
			return nil

		end

		return oldmt(Self, ...)

		end)

		setreadonly(mt, true)
	end)
	ACBypassSection:NewButton("Bypass Mosts anti cheat", "Stops anticheat from kicking you", function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/AntiCheat/main/Bypass"))()
	end)
	ACBypassSection:NewButton("FE SERVERSIDE ANTIKICK", "IF YOU DO GET KICKED JUST WAIT OR CLICK OFF OF IT", function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/serverside%20antikick.txt"))()
	end)
	ACBypassSection:NewButton("Bypass Mosts anti cheat 2", "Stops anticheat from kicking you", function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/powerfulac.txt"))()
	end)
	ACBypassSection:NewButton("Bypass Mosts Adonis/newindex", "Stops anticheat from kicking you", function()
		local getinfo = getinfo or debug.getinfo
		local DEBUG = false
		local Hooked = {}

		local Detected, Kill

		setthreadidentity(2)

		for i, v in getgc(true) do
			if typeof(v) == "table" then
				local DetectFunc = rawget(v, "Detected")
				local KillFunc = rawget(v, "Kill")
			
				if typeof(DetectFunc) == "function" and not Detected then
					Detected = DetectFunc
					
					local Old; Old = hookfunction(Detected, function(Action, Info, NoCrash)
						if Action ~= "_" then
							if DEBUG then
								warn('Adonis AntiCheat flagged\nMethod: {Action}\nInfo: {Info}')
							end
						end
						
						return true
					end)

					table.insert(Hooked, Detected)
				end

				if rawget(v, "Variables") and rawget(v, "Process") and typeof(KillFunc) == "function" and not Kill then
					Kill = KillFunc
					local Old; Old = hookfunction(Kill, function(Info)
						if DEBUG then
							warn('Adonis AntiCheat tried to kill (fallback): {Info}')
						end
					end)

					table.insert(Hooked, Kill)
				end
			end
		end

		local Old; Old = hookfunction(getrenv().debug.info, newcclosure(function(...)
			local LevelOrFunc, Info = ...

			if Detected and LevelOrFunc == Detected then
				if DEBUG then
					warn('zins | adonis bypassed')
				end

				return coroutine.yield(coroutine.running())
			end
			
			return Old(...)
		end))
		-- setthreadidentity(9)
		setthreadidentity(7)

	end)
	ACBypassSection:NewButton("Stop Lagback", "Stops lagback on some games", function()
		local players = game:GetService('Players')
		local lplr = players.LocalPlayer
		local lastCF, stop, heartbeatConnection
		local function start()
			heartbeatConnection = game:GetService('RunService').Heartbeat:Connect(function()
				if stop then
					return 
				end 
				lastCF = lplr.Character:FindFirstChildOfClass('Humanoid').RootPart.CFrame
			end)
			lplr.Character:FindFirstChildOfClass('Humanoid').RootPart:GetPropertyChangedSignal('CFrame'):Connect(function()
				stop = true
				lplr.Character:FindFirstChildOfClass('Humanoid').RootPart.CFrame = lastCF
				game:GetService('RunService').Heartbeat:Wait()
				stop = false
			end)    
			lplr.Character:FindFirstChildOfClass('Humanoid').Died:Connect(function()
				heartbeatConnection:Disconnect()
			end)
		end

		lplr.CharacterAdded:Connect(function(character)
			repeat 
				game:GetService('RunService').Heartbeat:Wait() 
			until character:FindFirstChildOfClass('Humanoid')
			repeat 
				game:GetService('RunService').Heartbeat:Wait() 
			until character:FindFirstChildOfClass('Humanoid').RootPart
			start()
		end)

		lplr.CharacterRemoving:Connect(function()
			heartbeatConnection:Disconnect()
		end)

		start()

	end)

	local Settingss = Window:NewTab("Settings", 11385220704)
	local SettingssSection = Settingss:NewSection("Settings")
	SettingssSection:NewDropdown("UI Toggle Bind", "Changes Toggle Bind for Sky Hub Default is Right Control ONLY ON PC", {
		"Right Control",
		"Left Control",
		"Left Alt",
		"Right Alt",
		"Insert",
		"End",
		"Del/Delete",
		"Left Shift",
		"Right Shift",
		"F1",
		"Q",
		"E",
		"R",
		"T",
		"Y",
		"U",
		"P",
		"Z",
		"X",
		"M",
		"V",
		"N",
		"."
	}, function(currentoption)
		if currentoption == "Right Control" then
			getgenv().SkyhubKeybind = "Enum.KeyCode.RightControl"
			ui_bind = getgenv().SkyhubKeybind
			task.wait()
			if writefile then
				updatesaves()
				task.wait()
				loadsettings()
			else
				Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
			end
			if not IsOnMobile then
				Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind),"Your new keybind to toggle the gui is: " ..tostring(getgenv().SkyhubKeybind), 5)
			end
		elseif currentoption == "Left Control" then
			getgenv().SkyhubKeybind = "Enum.KeyCode.LeftControl"
			ui_bind = getgenv().SkyhubKeybind
			task.wait()
			if writefile then
				updatesaves()
				task.wait()
				loadsettings()
			else
				Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
			end
			if not IsOnMobile then
				Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind),"Your new keybind to toggle the gui is: " ..tostring(getgenv().SkyhubKeybind), 5)
			end
		elseif currentoption == "Left Alt" then
			getgenv().SkyhubKeybind = "Enum.KeyCode.LeftAlt"
			ui_bind = getgenv().SkyhubKeybind
			task.wait()
			if writefile then
				updatesaves()
				task.wait()
				loadsettings()
			else
				Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
			end
			if not IsOnMobile then
				Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind),"Your new keybind to toggle the gui is: " ..tostring(getgenv().SkyhubKeybind), 5)
			end
		elseif currentoption == "Right Alt" then
			getgenv().SkyhubKeybind = "Enum.KeyCode.RightAlt"
			ui_bind = getgenv().SkyhubKeybind
			task.wait()
			if writefile then
				updatesaves()
				task.wait()
				loadsettings()
			else
				Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
			end
			if not IsOnMobile then
				Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind),"Your new keybind to toggle the gui is: " ..tostring(getgenv().SkyhubKeybind), 5)
			end
		elseif currentoption == "Insert" then
			getgenv().SkyhubKeybind = "Enum.KeyCode.Insert"
			ui_bind = getgenv().SkyhubKeybind
			task.wait()
			if writefile then
				updatesaves()
				task.wait()
				loadsettings()
			else
				Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
			end
			if not IsOnMobile then
				Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind),"Your new keybind to toggle the gui is: " ..tostring(getgenv().SkyhubKeybind), 5)
			end
		elseif currentoption == "End" then
			getgenv().SkyhubKeybind = "Enum.KeyCode.End"
			ui_bind = getgenv().SkyhubKeybind
			task.wait()
			if writefile then
				updatesaves()
				task.wait()
				loadsettings()
			else
				Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
			end
			if not IsOnMobile then
				Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind),"Your new keybind to toggle the gui is: " ..tostring(getgenv().SkyhubKeybind), 5)
			end
		elseif currentoption == "Del/Delete" then
			getgenv().SkyhubKeybind = "Enum.KeyCode.Delete"
			ui_bind = getgenv().SkyhubKeybind
			task.wait()
			if writefile then
				updatesaves()
				task.wait()
				loadsettings()
			else
				Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
			end
			if not IsOnMobile then
				Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind),"Your new keybind to toggle the gui is: " ..tostring(getgenv().SkyhubKeybind), 5)
			end
		elseif currentoption == "Left Shift" then
			getgenv().SkyhubKeybind = "Enum.KeyCode.LeftShift"
			ui_bind = getgenv().SkyhubKeybind
			task.wait()
			if writefile then
				updatesaves()
				task.wait()
				loadsettings()
			else
				Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
			end
			if not IsOnMobile then
				Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind),"Your new keybind to toggle the gui is: " ..tostring(getgenv().SkyhubKeybind), 5)
			end
		elseif currentoption == "Right Shift" then
			getgenv().SkyhubKeybind = "Enum.KeyCode.RightShift"
			ui_bind = getgenv().SkyhubKeybind
			task.wait()
			if writefile then
				updatesaves()
				task.wait()
				loadsettings()
			else
				Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
			end
			if not IsOnMobile then
				Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind),"Your new keybind to toggle the gui is: " ..tostring(getgenv().SkyhubKeybind), 5)
			end
		elseif currentoption == "F1" then
			getgenv().SkyhubKeybind = "Enum.KeyCode.F1"
			ui_bind = getgenv().SkyhubKeybind
			task.wait()
			if writefile then
				updatesaves()
				task.wait()
				loadsettings()
			else
				Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
			end
			if not IsOnMobile then
				Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind),"Your new keybind to toggle the gui is: " ..tostring(getgenv().SkyhubKeybind), 5)
			end
		elseif currentoption == "Q" then
			getgenv().SkyhubKeybind = "Enum.KeyCode.Q"
			ui_bind = getgenv().SkyhubKeybind
			task.wait()
			if writefile then
				updatesaves()
				task.wait()
				loadsettings()
			else
				Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
			end
			if not IsOnMobile then
				Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind),"Your new keybind to toggle the gui is: " ..tostring(getgenv().SkyhubKeybind), 5)
			end
		elseif currentoption == "E" then
			getgenv().SkyhubKeybind = "Enum.KeyCode.E"
			ui_bind = getgenv().SkyhubKeybind
			task.wait()
			if writefile then
				updatesaves()
				task.wait()
				loadsettings()
			else
				Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
			end
			if not IsOnMobile then
				Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind),"Your new keybind to toggle the gui is: " ..tostring(getgenv().SkyhubKeybind), 5)
			end
		elseif currentoption == "R" then
			getgenv().SkyhubKeybind = "Enum.KeyCode.R"
			ui_bind = getgenv().SkyhubKeybind
			task.wait()
			if writefile then
				updatesaves()
				task.wait()
				loadsettings()
			else
				Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
			end
			if not IsOnMobile then
				Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind),"Your new keybind to toggle the gui is: " ..tostring(getgenv().SkyhubKeybind), 5)
			end
		elseif currentoption == "T" then
			getgenv().SkyhubKeybind = "Enum.KeyCode.T"
			ui_bind = getgenv().SkyhubKeybind
			task.wait()
			if writefile then
				updatesaves()
				task.wait()
				loadsettings()
			else
				Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
			end
			if not IsOnMobile then
				Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind),"Your new keybind to toggle the gui is: " ..tostring(getgenv().SkyhubKeybind), 5)
			end
		elseif currentoption == "Y" then
			getgenv().SkyhubKeybind = "Enum.KeyCode.Y"
			ui_bind = getgenv().SkyhubKeybind
			task.wait()
			if writefile then
				updatesaves()
				task.wait()
				loadsettings()
			else
				Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
			end
			if not IsOnMobile then
				Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind),"Your new keybind to toggle the gui is: " ..tostring(getgenv().SkyhubKeybind), 5)
			end
		elseif currentoption == "U" then
			getgenv().SkyhubKeybind = "Enum.KeyCode.U"
			ui_bind = getgenv().SkyhubKeybind
			task.wait()
			if writefile then
				updatesaves()
				task.wait()
				loadsettings()
			else
				Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
			end
			if not IsOnMobile then
				Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind),"Your new keybind to toggle the gui is: " ..tostring(getgenv().SkyhubKeybind), 5)
			end
		elseif currentoption == "P" then
			getgenv().SkyhubKeybind = "Enum.KeyCode.P"
			ui_bind = getgenv().SkyhubKeybind
			task.wait()
			if writefile then
				updatesaves()
				task.wait()
				loadsettings()
			else
				Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
			end
			if not IsOnMobile then
				Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind),"Your new keybind to toggle the gui is: " ..tostring(getgenv().SkyhubKeybind), 5)
			end
		elseif currentoption == "Z" then
			getgenv().SkyhubKeybind = "Enum.KeyCode.Z"
			ui_bind = getgenv().SkyhubKeybind
			task.wait()
			if writefile then
				updatesaves()
				task.wait()
				loadsettings()
			else
				Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
			end
			if not IsOnMobile then
				Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind),"Your new keybind to toggle the gui is: " ..tostring(getgenv().SkyhubKeybind), 5)
			end
		elseif currentoption == "X" then
			getgenv().SkyhubKeybind = "Enum.KeyCode.X"
			ui_bind = getgenv().SkyhubKeybind
			task.wait()
			if writefile then
				updatesaves()
				task.wait()
				loadsettings()
			else
				Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
			end
			if not IsOnMobile then
				Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind),"Your new keybind to toggle the gui is: " ..tostring(getgenv().SkyhubKeybind), 5)
			end
		elseif currentoption == "M" then
			getgenv().SkyhubKeybind = "Enum.KeyCode.M"
			ui_bind = getgenv().SkyhubKeybind
			task.wait()
			if writefile then
				updatesaves()
				task.wait()
				loadsettings()
			else
				Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
			end
			if not IsOnMobile then
				Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind),"Your new keybind to toggle the gui is: " ..tostring(getgenv().SkyhubKeybind), 5)
			end
		elseif currentoption == "V" then
			getgenv().SkyhubKeybind = "Enum.KeyCode.V"
			ui_bind = getgenv().SkyhubKeybind
			task.wait()
			if writefile then
				updatesaves()
				task.wait()
				loadsettings()
			else
				Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
			end
			if not IsOnMobile then
				Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind),"Your new keybind to toggle the gui is: " ..tostring(getgenv().SkyhubKeybind), 5)
			end
		elseif currentoption == "N" then
			getgenv().SkyhubKeybind = "Enum.KeyCode.N"
			ui_bind = getgenv().SkyhubKeybind
			task.wait()
			if writefile then
				updatesaves()
				task.wait()
				loadsettings()
			else
				Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
			end
			if not IsOnMobile then
				Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind),"Your new keybind to toggle the gui is: " ..tostring(getgenv().SkyhubKeybind), 5)
			end
		elseif currentoption == "." then
			getgenv().SkyhubKeybind = "Enum.KeyCode.Period"
			ui_bind = getgenv().SkyhubKeybind
			task.wait()
			if writefile then
				updatesaves()
				task.wait()
				loadsettings()
			else
				Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
			end
			if not IsOnMobile then
				Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind),"Your new keybind to toggle the gui is: " ..tostring(getgenv().SkyhubKeybind), 5)
			end
		end
	end)
	SettingssSection:NewSlider("Blur/Opaque Intensitiy", "Changes blurryness", 1, 0, function(v)
		getgenv().BlurIntes = v
		opaque = getgenv().BlurIntes
		task.wait()
		if writefile then
			updatesaves()
			task.wait()
			loadsettings()
		else
			Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
		end
	end)
	SettingssSection:NewButton("Save Game", "Saves game MUST HAVE saveinstance()", function()
		local SSSSSS = ""
		if identifyexecutor then
			SSSSSS = select(1, identifyexecutor())
		end
		if SSSSSS == "Krampus" then
			saveplace({
				FileName = "SkyHubSavedGame",
				CopyToClipboard = true
			})
			return
		end
		if saveplace then
			saveplace({
				FileName = "SkyHubSavedGame"
			})
		end
		if saveinstance then
			saveinstance()
		else
			Library.Notify("Your executor doesnt have a saveinstance() function try Save Game 2", "", 10)
		end
	end)
	SettingssSection:NewButton("Save Game 2", "Saves game dont need saveinstance()", function()
		getgenv().saveinstance = nil
		loadstring(game:HttpGet("https://github.com/MuhXd/Roblox-mobile-script/blob/main/Arecus-X-Neo/Saveinstance.lua?raw=true"))();
	end)
	local Games = Window:NewTab("Games", 12689980465)
	local GamesSection = Games:NewSection("Games")
	
	local gamedata = loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/tpgames.lua"))()

	for _, v in ipairs(gamedata) do
		GamesSection:NewButton(v.name, "Teleports you to game", function()
			queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/SkyHub.txt'))()")
			game:GetService("TeleportService"):Teleport(v.placeId, game:GetService("Players").LocalPlayer)
		end)
	end


	local Hubs = Window:NewTab("Hubs", 7360649366)
	local HubsSection = Hubs:NewSection("Hubs")
	if IsOnMobile or VREnabled then
		HubsSection:NewButton("Mobile Keyboard Script", "For mobile users", function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt"))()
		end)
	end
	HubsSection:NewButton("FE Trolling GUI", "FE Scripts and more.", function()--
		loadstring(game:HttpGet(('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/FE%20Trolling%20GUI.luau'), true))()
	end)
	HubsSection:NewButton("Sirius", "cool asl", function()--
		loadstring(game:HttpGet(('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/Sirius/Sirius.txt'), true))()
	end)
	HubsSection:NewButton("Orca", "cool asff", function()--
		loadstring(game:HttpGet(('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/Orca/latest.lua'), true))()
	end)
	HubsSection:NewButton("Hoho Hub", "Hoho", function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HohoV2/main/ScriptLoad.lua"))()
	end)
	HubsSection:NewButton("VG Hub", "60+ Games", function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub'))()
	end)
	HubsSection:NewButton("EZ Hub", "130+ Games", function()
		loadstring(game:HttpGet(('https://raw.githubusercontent.com/debug420/Ez-Industries-Launcher-Data/master/Launcher.lua'), true))()
	end)
	HubsSection:NewButton("Owl Hub", "46+ Games", function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))();
	end)
	HubsSection:NewButton("CocoHub", "CocoHub", function()
		loadstring(game:HttpGet(('https://raw.githubusercontent.com/MarsQQ/CocoHub/master/CocoZHub'), true))()
	end)
	HubsSection:NewButton("MonkeHub", "MonkeHub", function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/KuriWasTaken/MonkeHub/main/Loader.lua"))()
	end)
	HubsSection:NewButton("Garfield Hub", "Garfield Hub", function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/2dgeneralspam1/scripts-and-stuff/master/scripts/garfield%20hub", true))()
	end)
	HubsSection:NewButton("Unfair Hub", "Unfair Hub", function()
		loadstring(game:HttpGet(('https://raw.githubusercontent.com/rblxscriptsnet/unfair/main/rblxhub.lua'), true))()
	end)
	HubsSection:NewButton("Eclipse Hub", "Eclipse Hub", function()
		local a, b, c, d, e = loadstring, request or http_request or (http and http.request) or (syn and syn.request), assert, tostring, "https://api.eclipsehub.xyz/auth"
		c(a and b, "Executor not Supported")
		a(b({
			Url = e .. "\?\107e\121\61" .. d(mainKey),
			Headers = {
				["User-Agent"] = "Eclipse"
			}
		}).Body)()
	end)
	HubsSection:NewButton("Trap Hub", "Trap Hub", function()
		local repo = "https://raw.githubusercontent.com/TrapstarKSSKSKSKKS/Main/main/"
		local Id = game.PlaceId
		local GameId = game.GameId
		local Games = {
			["AA"] = {
				FileName = getgenv().BetaScript and "AnimeAdventures-Rewrite" or "Anime%20Adventures",
				PlaceId = {
					3183403065
				},
				GameName = "Anime Adventures",
			},
			["RoGhoul"] = {
				FileName = "RoGhoul",
				PlaceId = {
					380704901
				},
				GameName = "RoGhoul",
			},
			["Blade Ball"] = {
				FileName = "BladeBall",
				PlaceId = {
					4777817887
				},
				GameName = "Blade Ball",
			},
			["ASX"] = {
				FileName = "AnimeSouls",
				PlaceId = {
					5300677688
				},
				GameName = "Anime Souls Simulator X",
			},
			["ALS"] = {
				FileName = "AnimeLast",
				PlaceId = {
					4509896324
				},
				GameName = "Anime Last",
			},
		}
		local function LoadScript(name)
			local data = Games[name]
			getgenv().GameName = data.GameName
			loadstring(game:HttpGet(repo .. data.FileName .. ".lua"))()
		end
		for name, data in next, Games do
			for _, v in next, data.PlaceId do
				if Id == v or GameId == v then
					LoadScript(name)
				end
			end
		end
	end)
	HubsSection:NewButton("Ice Hub", "Ice Hub", function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMae17/NewIceHub/main/Brookhaven"))()
	end)
	HubsSection:NewButton("Chaos Hub", "Chaos Hub", function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/xChaoticVoid/Chaos-Hub-v1/main/ChaosHub.lua"))()
	end)
	HubsSection:NewButton("Astral Hub", "Astral Hub", function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/AstralHub/main/Loader.lua"))()
	end)
	HubsSection:NewButton("Hydro Hub", "Hydro Hub", function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/FRX397/Hydrohub/main/Hydro_hub", true))()
	end)
	HubsSection:NewButton("Lemonade Hub", "Lemonade Hub", function()
		local RHS2GameId = 2098516465
		local TreasureHuntSimGameId = 1345139196
		local BigPaintBallGameId = 3527629287
		if game.PlaceId == RHS2GameId then
			loadstring(game:HttpGet("https://raw.githubusercontent.com/xMintix/Lemonade-Hub/main/RHS2String.lua"))()
		elseif game.PlaceId == TreasureHuntSimGameId then
			loadstring(game:HttpGet("https://raw.githubusercontent.com/xMintix/Lemonade-Hub/main/Treasure%20Hunt%20Sim/TreasureHuntString.lua"))()
		elseif game.PlaceId == BigPaintBallGameId then
			loadstring(game:HttpGet("https://raw.githubusercontent.com/xMintix/Lemonade-Hub/main/BigPaintballString.lua"))()
		else
			loadstring(game:HttpGet("https://raw.githubusercontent.com/xMintix/Lemonade-Hub/main/Universal.lua"))()
		end
	end)
	HubsSection:NewButton("Frozen Hub", "Frozen Hub", function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/FrozenScripts/frozenhubb/main/frozen777", true))()
	end)
	HubsSection:NewButton("PsyHub", "PsyHub", function()
		loadstring(game:GetObjects("rbxassetid://3014051754")[1].Source)()
	end)
	HubsSection:NewButton("Apple Hub", "needs key but should be easy barely 1 link", function()--
		--Made By Kosovo#3784 Dm for support or info
		loadstring(game:HttpGet(("https://paste.fo/raw/d6ded5a2033a"), true))()
	end)
	local Search = Window:NewTab("Search", 10507357657)
	local SearchSection = Search:NewSection("Search")
	SearchSection:NewButton("Search", "Searches online for scripts using scriptblox.com", function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/ScriptSearcher"))()
	end)
	SearchSection:NewButton("Search 2", "Searches online for scripts using scriptblox.com", function()
		if game:GetService("CoreGui"):FindFirstChild("BloxBook") then
			game:GetService("CoreGui"):FindFirstChild("BloxBook"):Destroy()
		end
		UserInputService = game:GetService("UserInputService")
		BloxBook = Instance.new("ScreenGui")
		MainFrame = Instance.new("Frame")
		UICorner = Instance.new("UICorner")
		TopBarFrame = Instance.new("Frame")
		UICorner_2 = Instance.new("UICorner")
		SearchBox = Instance.new("TextBox")
		UICorner_3 = Instance.new("UICorner")
		ScriptListFrame = Instance.new("ScrollingFrame")
		UIPadding = Instance.new("UIPadding")
		Scripts = Instance.new("Folder")
		UIGridLayout = Instance.new("UIGridLayout")
		ScriptFrame = Instance.new("Frame")
		ScriptTitle = Instance.new("TextLabel")
		ScriptAuthor = Instance.new("TextLabel")
		ScriptGame = Instance.new("TextLabel")
		VerifiedScriptFrame = Instance.new("Frame")
		ScriptTitle_2 = Instance.new("TextLabel")
		VerifiedIcon = Instance.new("ImageLabel")
		ScriptAuthor_2 = Instance.new("TextLabel")
		ScriptGame_2 = Instance.new("TextLabel")
		Info = Instance.new("Frame")
		PreviewImage = Instance.new("ImageLabel")
		UICorner_14 = Instance.new("UICorner")
		Author = Instance.new("Frame")
		InfoBoxAuthor = Instance.new("TextLabel")
		ProfilePicture = Instance.new("ImageLabel")
		UICorner_15 = Instance.new("UICorner")
		Title_2 = Instance.new("Frame")
		InfoBoxTitle = Instance.new("TextLabel")
		Game = Instance.new("TextLabel")
		Description = Instance.new("TextLabel")
		Comments = Instance.new("Frame")
		Inner = Instance.new("Frame")
		UICorner_21 = Instance.new("UICorner")
		Line = Instance.new("Frame")
		CommentsText = Instance.new("TextLabel")
		Comments_2 = Instance.new("ScrollingFrame")
		Comment = Instance.new("Frame")
		Content = Instance.new("TextLabel")
		Author_2 = Instance.new("TextLabel")
		ProfilePicture_2 = Instance.new("ImageLabel")
		UICorner_22 = Instance.new("UICorner")
		UIListLayout_3 = Instance.new("UIListLayout")
		CloseFrame = Instance.new("ImageButton")
		PreviewImage_2 = Instance.new("ImageLabel")
		PreviewImageUICorner_2 = Instance.new("UICorner")
		TopBar = Instance.new("Frame")
		TopBarUICorner = Instance.new("UICorner")
		SecondProfile = Instance.new("ImageLabel")
		SecondProfileUICorner_2 = Instance.new("UICorner")
		KeySystem = Instance.new("TextLabel")
		KeySystemUICorner = Instance.new("UICorner")
		KeySystem_2 = Instance.new("TextLabel")
		KeySystemUICorner_2 = Instance.new("UICorner")
		OpenButton = Instance.new("ImageButton")
		OpenButtonUICorner = Instance.new("UICorner")
		CloseButton = Instance.new("ImageButton")
		ViewsLabel = Instance.new("TextLabel")
		ViewsLabelUICorner = Instance.new("UICorner")
		ViewsLabel_2 = Instance.new("TextLabel")
		ViewsLabelUICorner_2 = Instance.new("UICorner")
		ViewEye = Instance.new("ImageLabel")
		ViewEye_2 = Instance.new("ImageLabel")
		ViewEyeUICorner = Instance.new("UICorner")
		ViewEyeUICorner_2 = Instance.new("UICorner")
		Share = Instance.new("ImageButton")
		ShareUICorner = Instance.new("UICorner")
		Share_2 = Instance.new("ImageButton")
		ShareUICorner_2 = Instance.new("UICorner")
		Description_2 = Instance.new("TextLabel")
		InfoBox = Instance.new("ScrollingFrame")
		InfoBoxUICorner = Instance.new("UICorner")
		OpenInfo = Instance.new("TextButton")
		OpenInfo_2 = Instance.new("TextButton")
		CloseInfoBox = Instance.new("TextButton")
		InfoBox.Visible = false
		BloxBook.Name = "BloxBook"
		BloxBook.Parent = game:GetService("CoreGui")
		BloxBook.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		game:GetService("CoreGui").BloxBook.Enabled = true
		OpenButton.Name = "OpenButton"
		OpenButton.Parent = BloxBook
		OpenButton.AnchorPoint = Vector2.new(0.5, 0.5)
		OpenButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		OpenButton.Position = UDim2.new(0.5, 0, 0, 0)
		OpenButton.Size = UDim2.new(0, 45, 0, 45)
		OpenButton.Image = "rbxassetid://17117775928"
		OpenButton.AutoButtonColor = false
		OpenButtonUICorner.CornerRadius = UDim.new(0, 15)
		OpenButtonUICorner.Parent = OpenButton
		OpenButton.Visible = false
		MainFrame.Name = "MainFrame"
		MainFrame.Parent = BloxBook
		MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
		MainFrame.Size = UDim2.new(0, 400, 0, 450)
		MainFrame.ZIndex = 2
		UICorner.CornerRadius = UDim.new(0, 3)
		UICorner.Parent = MainFrame
		TopBar.Name = "TopBar"
		TopBar.Parent = MainFrame
		TopBar.AnchorPoint = Vector2.new(0.5, 0.5)
		TopBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		TopBar.Position = UDim2.new(0.5, 0, 0.04, 0)
		TopBar.Size = UDim2.new(0, 400, 0, 40)
		TopBarUICorner.CornerRadius = UDim.new(0, 3)
		TopBarUICorner.Parent = TopBar
		CloseInfoBox.Name = "CloseInfoBox"
		CloseInfoBox.Parent = MainFrame
		CloseInfoBox.BackgroundTransparency = 1
		CloseInfoBox.Position = UDim2.new(0, 2, 0, 1)
		CloseInfoBox.Size = UDim2.new(0, 40, 0, 40)
		CloseInfoBox.Font = Enum.Font.Gotham
		CloseInfoBox.Text = "<--"
		CloseInfoBox.TextColor3 = Color3.fromRGB(255, 255, 255)
		CloseInfoBox.TextSize = 30
		CloseInfoBox.Visible = false
		InfoBox.Name = "InfoBox"
		InfoBox.Parent = MainFrame
		InfoBox.Active = true
		InfoBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		InfoBox.BorderSizePixel = 0
		InfoBox.Position = UDim2.new(0, 0, 0.08, 0)
		InfoBox.Size = UDim2.new(0, 400, 0, 414)
		InfoBox.ZIndex = 3
		InfoBox.CanvasSize = UDim2.new(0, 0, 0, 0)
		InfoBox.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
		InfoBoxUICorner.CornerRadius = UDim.new(0, 3)
		InfoBoxUICorner.Parent = InfoBox
		SearchBox.Name = "SearchBox"
		SearchBox.Parent = MainFrame
		SearchBox.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
		SearchBox.Position = UDim2.new(0, 5, 0, 5)
		SearchBox.Size = UDim2.new(0, 250, 0, 20)
		SearchBox.ClearTextOnFocus = false
		SearchBox.Font = Enum.Font.Gotham
		SearchBox.PlaceholderText = "Tags"
		SearchBox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
		SearchBox.Text = ""
		SearchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
		SearchBox.TextScaled = true
		SearchBox.TextSize = 14.000
		SearchBox.TextWrapped = true
		spawn(function()
			while wait() do
				SearchBox.PlaceholderText = "Script name"
				wait(2)
				SearchBox.PlaceholderText = "Author name"
				wait(2)
				SearchBox.PlaceholderText = "Tags"
				wait(2)
				SearchBox.PlaceholderText = "Press 'F' to search"
				wait(2)
				SearchBox.PlaceholderText = "Press 'C' to clear TextBox"
				wait(2)
				SearchBox.PlaceholderText = "You can enter here links"
				wait(2)
			end
		end)
		UICorner_3.CornerRadius = UDim.new(0, 10)
		UICorner_3.Parent = SearchBox
		CloseButton.Name = "CloseButton"
		CloseButton.Parent = MainFrame
		CloseButton.AnchorPoint = Vector2.new(0.5, 0.5)
		CloseButton.BackgroundTransparency = 1
		CloseButton.Position = UDim2.new(0, 380, 0, 15)
		CloseButton.Size = UDim2.new(0, 40, 0, 40)
		CloseButton.Image = "rbxassetid://17094492732"
		ScriptListFrame.Name = "ScriptListFrame"
		ScriptListFrame.Parent = MainFrame
		ScriptListFrame.Active = true
		ScriptListFrame.BackgroundTransparency = 1
		ScriptListFrame.BorderSizePixel = 0
		ScriptListFrame.Position = UDim2.new(0, 0, 0.08, 0)
		ScriptListFrame.Size = UDim2.new(0, 415, 0, 414)
		ScriptListFrame.ZIndex = 2
		ScriptListFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
		UIPadding.Parent = ScriptListFrame
		UIPadding.PaddingBottom = UDim.new(0, 0)
		UIPadding.PaddingLeft = UDim.new(0, 0)
		UIPadding.PaddingRight = UDim.new(0, 0)
		UIPadding.PaddingTop = UDim.new(0, 0)
		Scripts.Name = "Scripts"
		Scripts.Parent = ScriptListFrame
		UIGridLayout.Parent = Scripts
		UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIGridLayout.CellPadding = UDim2.new(0, 1, 0, 1)
		UIGridLayout.CellSize = UDim2.new(0, 400, 0, 700)
		ScriptFrame.Name = "ScriptFrame"
		ScriptFrame.Parent = Scripts
		ScriptFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		ScriptFrame.Size = UDim2.new(0, 370, 0, 700)
		ScriptFrame.BorderSizePixel = 0
		ScriptTitle.Name = "ScriptTitle"
		ScriptTitle.Parent = ScriptFrame
		ScriptTitle.BackgroundTransparency = 1
		ScriptTitle.Position = UDim2.new(0, 0, 0, 305)
		ScriptTitle.Size = UDim2.new(0, 200, 0, 25)
		ScriptTitle.Font = Enum.Font.Gotham
		ScriptTitle.Text = "Script Title"
		ScriptTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
		ScriptTitle.TextScaled = true
		ScriptTitle.TextSize = 14.000
		ScriptTitle.TextWrapped = true
		ScriptTitle.TextXAlignment = Enum.TextXAlignment.Left
		ScriptAuthor.Name = "ScriptAuthor"
		ScriptAuthor.Parent = ScriptFrame
		ScriptAuthor.BackgroundTransparency = 1
		ScriptAuthor.Position = UDim2.new(0, 42, 0, 340)
		ScriptAuthor.Size = UDim2.new(0, 200, 0, 25)
		ScriptAuthor.Font = Enum.Font.Gotham
		ScriptAuthor.Text = "ScriptAuthor"
		ScriptAuthor.TextColor3 = Color3.fromRGB(255, 255, 255)
		ScriptAuthor.TextSize = 14.000
		ScriptAuthor.TextWrapped = true
		ScriptAuthor.TextXAlignment = Enum.TextXAlignment.Left
		ScriptGame.Name = "ScriptGame"
		ScriptGame.Parent = ScriptFrame
		ScriptGame.BackgroundTransparency = 1
		ScriptGame.Position = UDim2.new(0, 0, 0, 375)
		ScriptGame.Size = UDim2.new(0, 280, 0, 25)
		ScriptGame.Font = Enum.Font.Gotham
		ScriptGame.Text = "Game"
		ScriptGame.TextColor3 = Color3.fromRGB(255, 255, 255)
		ScriptGame.TextSize = 14.000
		ScriptGame.TextWrapped = true
		ScriptGame.TextXAlignment = Enum.TextXAlignment.Left
		VerifiedScriptFrame.Name = "VerifiedScriptFrame"
		VerifiedScriptFrame.Parent = Scripts
		VerifiedScriptFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		VerifiedScriptFrame.Size = UDim2.new(0, 300, 0, 150)
		VerifiedScriptFrame.BorderSizePixel = 0
		ScriptTitle_2.Name = "ScriptTitle"
		ScriptTitle_2.Parent = VerifiedScriptFrame
		ScriptTitle_2.BackgroundTransparency = 1
		ScriptTitle_2.Position = ScriptTitle.Position
		ScriptTitle_2.Size = ScriptTitle.Size
		ScriptTitle_2.Font = Enum.Font.Gotham
		ScriptTitle_2.Text = "Script Title"
		ScriptTitle_2.TextColor3 = Color3.fromRGB(255, 255, 255)
		ScriptTitle_2.TextScaled = true
		ScriptTitle_2.TextSize = 14.000
		ScriptTitle_2.TextWrapped = true
		ScriptTitle_2.TextXAlignment = Enum.TextXAlignment.Left
		ScriptAuthor_2.Name = "ScriptAuthor"
		ScriptAuthor_2.Parent = VerifiedScriptFrame
		ScriptAuthor_2.BackgroundTransparency = 1
		ScriptAuthor_2.Position = ScriptAuthor.Position
		ScriptAuthor_2.Size = ScriptAuthor.Size
		ScriptAuthor_2.Font = Enum.Font.Gotham
		ScriptAuthor_2.Text = "ScriptAuthor"
		ScriptAuthor_2.TextColor3 = Color3.fromRGB(255, 255, 255)
		ScriptAuthor_2.TextSize = 14.000
		ScriptAuthor_2.TextWrapped = true
		ScriptAuthor_2.TextXAlignment = Enum.TextXAlignment.Left
		ScriptGame_2.Name = "ScriptGame"
		ScriptGame_2.Parent = VerifiedScriptFrame
		ScriptGame_2.BackgroundTransparency = 1
		ScriptGame_2.Position = ScriptGame.Position
		ScriptGame_2.Size = ScriptGame.Size
		ScriptGame_2.Font = Enum.Font.Gotham
		ScriptGame_2.Text = "Game"
		ScriptGame_2.TextColor3 = Color3.fromRGB(255, 255, 255)
		ScriptGame_2.TextSize = 14.000
		ScriptGame_2.TextWrapped = true
		ScriptGame_2.TextXAlignment = Enum.TextXAlignment.Left
		Info.Name = "Info"
		Info.Parent = InfoBox
		Info.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Info.BackgroundTransparency = 1
		Info.Size = UDim2.new(0, 995, 0, 207)
		PreviewImage.Name = "PreviewImage"
		PreviewImage.Parent = ScriptFrame
		PreviewImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		PreviewImage.BackgroundTransparency = 1
		PreviewImage.Position = UDim2.new(0, 50, 0, 5)
		PreviewImage.Size = UDim2.new(0, 300, 0, 300)
		PreviewImage.Image = "rbxassetid://17093295752"
		UICorner_14.CornerRadius = UDim.new(0, 24)
		UICorner_14.Parent = PreviewImage
		PreviewImage_2.Name = "PreviewImage"
		PreviewImage_2.Parent = VerifiedScriptFrame
		PreviewImage_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		PreviewImage_2.BackgroundTransparency = 1
		PreviewImage_2.Position = UDim2.new(0, 50, 0, 5)
		PreviewImage_2.Size = UDim2.new(0, 300, 0, 300)
		PreviewImage_2.Image = "rbxassetid://17093295752"
		PreviewImageUICorner_2.CornerRadius = UDim.new(0, 24)
		PreviewImageUICorner_2.Parent = PreviewImage_2
		ProfilePicture.Name = "ProfilePicture"
		ProfilePicture.Parent = ScriptFrame
		ProfilePicture.BackgroundTransparency = 1
		ProfilePicture.Position = UDim2.new(0, 1, 0, 330)
		ProfilePicture.Size = UDim2.new(0, 40, 0, 40)
		ProfilePicture.Image = "rbxassetid://17093333262"
		UICorner_15.CornerRadius = UDim.new(1, 0)
		UICorner_15.Parent = ProfilePicture
		SecondProfile.Name = "SecondProfile"
		SecondProfile.Parent = VerifiedScriptFrame
		SecondProfile.BackgroundTransparency = 1
		SecondProfile.Position = UDim2.new(0, 1, 0, 330)
		SecondProfile.Size = UDim2.new(0, 40, 0, 40)
		SecondProfile.Image = "rbxassetid://17093333262"
		SecondProfileUICorner_2.CornerRadius = UDim.new(1, 0)
		SecondProfileUICorner_2.Parent = SecondProfile
		KeySystem.Name = "KeySystem"
		KeySystem.Parent = ScriptFrame
		KeySystem.BackgroundColor3 = Color3.fromRGB(242, 191, 33)
		KeySystem.Position = UDim2.new(0, 250, 0, 270)
		KeySystem.Size = UDim2.new(0, 55, 0, 25)
		KeySystem.Font = Enum.Font.Gotham
		KeySystem.Text = "Key System"
		KeySystem.TextColor3 = Color3.fromRGB(0, 0, 0)
		KeySystemUICorner.CornerRadius = UDim.new(0, 10)
		KeySystemUICorner.Parent = KeySystem
		ViewsLabel.Name = "ViewsLabel"
		ViewsLabel.Parent = ScriptFrame
		ViewsLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ViewsLabel.Position = UDim2.new(0, 55, 0, 270)
		ViewsLabel.Size = UDim2.new(0, 60, 0, 25)
		ViewsLabel.Font = Enum.Font.Gotham
		ViewsLabel.Text = "V"
		ViewsLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
		ViewsLabel.TextScaled = true
		ViewsLabelUICorner.CornerRadius = UDim.new(0, 10)
		ViewsLabelUICorner.Parent = ViewsLabel
		ViewsLabel_2.Name = "ViewsLabel"
		ViewsLabel_2.Parent = VerifiedScriptFrame
		ViewsLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ViewsLabel_2.Position = UDim2.new(0, 55, 0, 270)
		ViewsLabel_2.Size = UDim2.new(0, 60, 0, 25)
		ViewsLabel_2.Font = Enum.Font.Gotham
		ViewsLabel_2.Text = "V"
		ViewsLabel_2.TextColor3 = Color3.fromRGB(0, 0, 0)
		ViewsLabel_2.TextScaled = true
		ViewsLabelUICorner_2.CornerRadius = UDim.new(0, 10)
		ViewsLabelUICorner_2.Parent = ViewsLabel_2
		ViewEye.Name = "ViewEye"
		ViewEye.Parent = ScriptFrame
		ViewEye.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ViewEye.Position = UDim2.new(0, 120, 0, 272)
		ViewEye.Size = UDim2.new(0, 25, 0, 20)
		ViewEye.Image = "rbxassetid://17094518883"
		ViewEyeUICorner.CornerRadius = UDim.new(0, 10)
		ViewEyeUICorner.Parent = ViewEye
		ViewEye_2.Name = "ViewEye"
		ViewEye_2.Parent = VerifiedScriptFrame
		ViewEye_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ViewEye_2.Position = UDim2.new(0, 120, 0, 272)
		ViewEye_2.Size = UDim2.new(0, 25, 0, 20)
		ViewEye_2.Image = "rbxassetid://17094518883"
		ViewEyeUICorner_2.CornerRadius = UDim.new(0, 10)
		ViewEyeUICorner_2.Parent = ViewEye_2
		KeySystem_2.Name = "KeySystem"
		KeySystem_2.Parent = VerifiedScriptFrame
		KeySystem_2.BackgroundColor3 = Color3.fromRGB(242, 191, 33)
		KeySystem_2.Position = UDim2.new(0, 250, 0, 270)
		KeySystem_2.Size = UDim2.new(0, 55, 0, 25)
		KeySystem_2.Font = Enum.Font.Gotham
		KeySystem_2.Text = "Key System"
		KeySystem_2.TextColor3 = Color3.fromRGB(0, 0, 0)
		KeySystemUICorner_2.CornerRadius = UDim.new(0, 10)
		KeySystemUICorner_2.Parent = KeySystem_2
		VerifiedIcon.Name = "VerifiedIcon"
		VerifiedIcon.Parent = PreviewImage_2
		VerifiedIcon.BackgroundTransparency = 1
		VerifiedIcon.Position = UDim2.new(0, 250, 0, 250)
		VerifiedIcon.Size = UDim2.new(0, 55, 0, 40)
		VerifiedIcon.Image = "rbxassetid://15621211889"
		Share.Name = "Share"
		Share.Parent = ScriptFrame
		Share.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Share.Position = UDim2.new(0, 310, 0, 8)
		Share.Size = UDim2.new(0, 30, 0, 30)
		Share.Image = "rbxassetid://17094508690"
		Share.AutoButtonColor = false
		ShareUICorner.CornerRadius = UDim.new(0, 10)
		ShareUICorner.Parent = Share
		Description.Name = "Description"
		Description.Parent = ScriptFrame
		Description.BackgroundTransparency = 1
		Description.Position = UDim2.new(0, 0, 0, 400)
		Description.Size = UDim2.new(0, 400, 0, 280)
		Description.Font = Enum.Font.Gotham
		Description.Text = "Desc"
		Description.TextColor3 = Color3.fromRGB(255, 255, 255)
		Description.TextSize = 20.000
		Description.TextWrapped = true
		Description.TextScaled = true
		Description.TextXAlignment = Enum.TextXAlignment.Left
		Description.TextYAlignment = Enum.TextYAlignment.Top
		Description.MaxVisibleGraphemes = 1500
		Description_2.Name = "Description"
		Description_2.Parent = VerifiedScriptFrame
		Description_2.BackgroundTransparency = 1
		Description_2.Position = UDim2.new(0, 0, 0, 400)
		Description_2.Size = UDim2.new(0, 400, 0, 280)
		Description_2.Font = Enum.Font.Gotham
		Description_2.Text = "Desc"
		Description_2.TextColor3 = Color3.fromRGB(255, 255, 255)
		Description_2.TextSize = 20.000
		Description_2.TextWrapped = true
		Description_2.TextScaled = true
		Description_2.TextXAlignment = Enum.TextXAlignment.Left
		Description_2.TextYAlignment = Enum.TextYAlignment.Top
		Description_2.MaxVisibleGraphemes = 1500
		OpenInfo.Name = "OpenInfo"
		OpenInfo.Parent = ScriptFrame
		OpenInfo.BackgroundTransparency = 1
		OpenInfo.Position = UDim2.new(0, 280, 0, 670)
		OpenInfo.Size = UDim2.new(0, 100, 0, 25)
		OpenInfo.Font = Enum.Font.Gotham
		OpenInfo.Text = "Comments -->"
		OpenInfo.TextColor3 = Color3.fromRGB(255, 255, 255)
		OpenInfo.AutoButtonColor = false
		OpenInfo.TextSize = 20
		OpenInfo_2.Name = "OpenInfo"
		OpenInfo_2.Parent = VerifiedScriptFrame
		OpenInfo_2.BackgroundTransparency = 1
		OpenInfo_2.Position = UDim2.new(0, 280, 0, 670)
		OpenInfo_2.Size = UDim2.new(0, 100, 0, 25)
		OpenInfo_2.Font = Enum.Font.Gotham
		OpenInfo_2.Text = "Comments -->"
		OpenInfo_2.TextColor3 = Color3.fromRGB(255, 255, 255)
		OpenInfo_2.AutoButtonColor = false
		OpenInfo_2.TextSize = 20
		Share_2.Name = "Share"
		Share_2.Parent = VerifiedScriptFrame
		Share_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Share_2.Position = UDim2.new(0, 310, 0, 8)
		Share_2.Size = UDim2.new(0, 30, 0, 30)
		Share_2.Image = "rbxassetid://17094508690"
		Share_2.AutoButtonColor = false
		ShareUICorner_2.CornerRadius = UDim.new(0, 10)
		ShareUICorner_2.Parent = Share_2
		Comments.Name = "Comments"
		Comments.Parent = InfoBox
		Comments.BackgroundTransparency = 1
		Comments.Size = UDim2.new(0, 400, 0, 414)
		Inner.Name = "Inner"
		Inner.Parent = Comments
		Inner.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Inner.Position = UDim2.new(0, 0, 0, 10)
		Inner.BackgroundTransparency = 1
		Inner.Size = UDim2.new(0, 400, 0, 414)
		UICorner_21.CornerRadius = UDim.new(0, 12)
		UICorner_21.Parent = Inner
		CommentsText.Name = "CommentsText"
		CommentsText.Parent = Inner
		CommentsText.BackgroundTransparency = 1
		CommentsText.Size = UDim2.new(0, 400, 0, 25)
		CommentsText.Font = Enum.Font.GothamBold
		CommentsText.Text = "Comments"
		CommentsText.TextColor3 = Color3.fromRGB(255, 255, 255)
		CommentsText.TextSize = 14.000
		Comments_2.Name = "Comments"
		Comments_2.Parent = Inner
		Comments_2.Active = true
		Comments_2.BackgroundTransparency = 1
		Comments_2.BorderSizePixel = 0
		Comments_2.Position = UDim2.new(0, 0, 0, 10)
		Comments_2.Size = UDim2.new(0, 415, 0, 400)
		Comments_2.CanvasSize = UDim2.new(0, 0, 0, 0)
		Comment.Name = "Comment"
		Comment.Parent = Comments_2
		Comment.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Comment.BackgroundTransparency = 1
		Comment.Size = UDim2.new(0, 400, 0, 50)
		Content.Name = "Content"
		Content.Parent = Comment
		Content.BackgroundTransparency = 1
		Content.Position = UDim2.new(0, 50, 0, 30)
		Content.Size = UDim2.new(0, 300, 0, 20)
		Content.Font = Enum.Font.Gotham
		Content.Text = "Comment"
		Content.TextColor3 = Color3.fromRGB(255, 255, 255)
		Content.TextSize = 14
		Content.TextWrapped = true
		Content.TextXAlignment = Enum.TextXAlignment.Left
		Content.TextYAlignment = Enum.TextYAlignment.Top
		Content.TextScaled = true
		Author_2.Name = "Author"
		Author_2.Parent = Comment
		Author_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Author_2.BackgroundTransparency = 1.000
		Author_2.BorderSizePixel = 0
		Author_2.Position = UDim2.new(0, 50, 0, 5)
		Author_2.Size = UDim2.new(0, 200, 0, 25)
		Author_2.Font = Enum.Font.GothamBold
		Author_2.Text = "Author"
		Author_2.TextColor3 = Color3.fromRGB(255, 255, 255)
		Author_2.TextSize = 20.000
		Author_2.TextWrapped = true
		Author_2.TextXAlignment = Enum.TextXAlignment.Left
		ProfilePicture_2.Name = "ProfilePicture"
		ProfilePicture_2.Parent = Comment
		ProfilePicture_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ProfilePicture_2.BackgroundTransparency = 1.000
		ProfilePicture_2.Position = UDim2.new(0, 5, 0, 5)
		ProfilePicture_2.Size = UDim2.new(0, 40, 0, 40)
		ProfilePicture_2.Image = "rbxassetid://17093333262"
		UICorner_22.CornerRadius = UDim.new(1, 0)
		UICorner_22.Parent = ProfilePicture_2
		UIListLayout_3.Parent = Comments_2
		UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_3.Padding = UDim.new(0, 5)
		KeySystem_2.Visible = false
		KeySystem.Visible = false
		getfakeasset = getcustomasset or getsynasset
		HttpService = game:GetService("HttpService")
		page = 1
		gquery = ""
		function tableConcat(t1, t2)
			for i, v in pairs(t2) do
				table.insert(t1, v)
			end
			return t1
		end
		BloxBook.MainFrame.ScriptListFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
		BloxBook.MainFrame.InfoBox.AutomaticSize = Enum.AutomaticSize.Y
		BloxBook.MainFrame.ScriptListFrame.ScrollBarImageTransparency = 1
		BloxBook.MainFrame.ScriptListFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
		BloxBook.MainFrame.InfoBox.AutomaticCanvasSize = Enum.AutomaticSize.Y
		BloxBook.MainFrame.InfoBox.Comments.Inner.Comments.AutomaticCanvasSize = Enum.AutomaticSize.Y
		BloxBook.MainFrame.InfoBox.Comments.Inner.Comments.ScrollBarImageColor3 = Color3.new(0, 0, 0)
		BloxBook.MainFrame.InfoBox.Comments.Inner.Comments.ScrollBarImageTransparency = 1
		BloxBook.MainFrame.InfoBox.ScrollBarImageColor3 = Color3.new(0, 0, 0)
		VerifiedScript = BloxBook.MainFrame.ScriptListFrame.Scripts.VerifiedScriptFrame:Clone()
		Script = BloxBook.MainFrame.ScriptListFrame.Scripts.ScriptFrame:Clone()
		BloxBook.MainFrame.ScriptListFrame.Scripts.ScriptFrame:Destroy()
		BloxBook.MainFrame.ScriptListFrame.Scripts.VerifiedScriptFrame:Destroy()
		Comment = BloxBook.MainFrame.InfoBox.Comments.Inner.Comments.Comment:Clone()
		BloxBook.MainFrame.InfoBox.Comments.Inner.Comments.Comment:Destroy()
		function _if(a, b, c)
			if a then
				return b
			else
				return c
			end
		end
		function fastmodeExec(func)
			if getgenv().fastmode == true then
				task.spawn(func)
			else
				func()
			end
		end
		function fetchScripts(query, page)
			page = page or 1
			query = HttpService:UrlEncode(query)
			url = _if(query == "", "https://www.scriptblox.com/api/script/fetch?page=" .. tostring(page), "https://scriptblox.com/api/script/search?q=" .. query .. "&max=100&mode=free&page=" .. tostring(page))
			req = HttpService:JSONDecode(game:HttpGetAsync(url)).result
			return req.scripts
		end
		function fetchComments(scriptId, page)
			page = page or 1
			url = "https://scriptblox.com/api/comment/" .. scriptId .. "?page=" .. tostring(page) .. "&max=100"
			req = HttpService:JSONDecode(game:HttpGetAsync(url)).result
			return req.comments
		end
		function fixScript(scriptObj)
			req = HttpService:JSONDecode(game:HttpGetAsync("https://www.scriptblox.com/api/script/" .. scriptObj.slug)).script
			scriptObj["script"] = _if(scriptObj["script"], scriptObj["script"], req.script)
			scriptObj["features"] = _if(scriptObj["features"], scriptObj["features"], req.features)
			scriptObj["owner"] = _if(scriptObj["owner"], scriptObj["owner"], req.owner)
			return scriptObj
		end
		function updateInfoBox(scriptObj)
			scriptObj = fixScript(scriptObj)
			commentsUIListLayout = BloxBook.MainFrame.InfoBox.Comments.Inner.Comments.UIListLayout:Clone()
			BloxBook.MainFrame.InfoBox.Comments.Inner.Comments:ClearAllChildren()
			commentsUIListLayout.Parent = BloxBook.MainFrame.InfoBox.Comments.Inner.Comments
			task.spawn(function()
				for _, v in pairs(fetchComments(scriptObj["_id"])) do
					newComment = Comment:Clone()
					newComment.Parent = BloxBook.MainFrame.InfoBox.Comments.Inner.Comments
					newComment.Content.Text = v.text
					newComment.Author.Text = v.commentBy.username
				end
			end)
		end
		function refreshScripts(scriptTbl)
			if #scriptTbl <= 0 then
				MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			else
				MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			end
			UIGridLayoutCopy = Scripts.UIGridLayout:Clone()
			Scripts:ClearAllChildren()
			UIGridLayoutCopy.Parent = Scripts
			addScripts(scriptTbl)
		end
		function addScripts(scriptTbl)
			for i, v in pairs(scriptTbl) do
				fastmodeExec(function()
					local newScript
					v = fixScript(v)
					if v.verified == true then
						newScript = VerifiedScript:Clone()
						newScript.ScriptTitle.Text = v.title
						newScript.ScriptAuthor.Text = "@" .. v.owner.username
						newScript.ScriptGame.Text = v.game.name
						newScript.ViewsLabel.Text = v.views
						newScript.Description.Text = v.features
						newScript.Parent = Scripts
					else
						newScript = Script:Clone()
						newScript.ScriptTitle.Text = v.title
						newScript.ScriptAuthor.Text = "@" .. v.owner.username
						newScript.ScriptGame.Text = v.game.name
						newScript.ViewsLabel.Text = v.views
						newScript.Description.Text = v.features
						newScript.Parent = Scripts
					end
					if v.game.name == "Universal Script 📌" then
						newScript.PreviewImage.Image = "rbxassetid://17117106457"
					else
						newScript.PreviewImage.Image = "https://assetgame.roblox.com/Game/Tools/ThumbnailAsset.ashx?aid=" .. v.game.gameId .. "&fmt=png&wd=420&ht=420"
					end
					if v.key == true then
						newScript.KeySystem.Visible = true
					end
					CloseInfoBox.MouseButton1Click:Connect(function()
						ScriptListFrame.Visible = true
						InfoBox.Visible = false
						SearchBox.Visible = true
						CloseInfoBox.Visible = false
					end)
					newScript.OpenInfo.MouseButton1Click:Connect(function()
						updateInfoBox(v)
						ScriptListFrame.Visible = false
						InfoBox.Visible = true
						SearchBox.Visible = false
						CloseInfoBox.Visible = true
					end)
					newScript.Share.MouseButton1Click:Connect(function()
						everyClipboard(v.slug)
					end)
				end)
			end
			pagefetchrunning = false
		end
		CloseButton.MouseButton1Click:Connect(function()
			MainFrame.Visible = false
			OpenButton.Visible = true
		end)
		OpenButton.MouseButton1Click:Connect(function()
			MainFrame.Visible = true
			OpenButton.Visible = false
		end)
		SearchBox.FocusLost:Connect(function(enterPressed)
			if enterPressed then
				gquery = SearchBox.Text
				page = 1
				local scriptsTbl = fetchScripts(SearchBox.Text, 1)
				refreshScripts(scriptsTbl)
			end
		end)
		UserInputService.InputBegan:Connect(function(input)
			if input.KeyCode == Enum.KeyCode.F then
				SearchBox:CaptureFocus()
			end
		end)
		UserInputService.InputBegan:Connect(function(input)
			if input.KeyCode == Enum.KeyCode.C then
				SearchBox.Text = ""
			end
		end)
		gui = MainFrame
		local dragging
		local dragInput
		local dragStart
		local startPos
		local function update(input)
			local delta = input.Position - dragStart
			gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end
		gui.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = true
				dragStart = input.Position
				startPos = gui.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragging = false
					end
				end)
			end
		end)
		gui.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				dragInput = input
			end
		end)
		UserInputService.InputChanged:Connect(function(input)
			if input == dragInput and dragging then
				update(input)
			end
		end)
		refreshScripts(fetchScripts(gquery, 1))
		ScriptListFrame:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
			if (ScriptListFrame.CanvasPosition.Y + ScriptListFrame.AbsoluteSize.Y) >= ScriptListFrame.AbsoluteCanvasSize.Y - 200 and not pagefetchrunning then
				page = page + 1
				pagefetchrunning = true
				addScripts(fetchScripts(gquery, page))
			end
		end)
	end)
	local Obbys = Window:NewTab("Obbys")
	local ObbysSection = Obbys:NewSection("Obbys")
	ObbysSection:NewButton("Method 1", "auto farm/tp to end if supported game", function()
		if game.PlaceId == 5972698540 then -- easy obby
			game:GetService("StarterGui"):SetCore("SendNotification",  {
				Title = "Working";
				Text = "its working just please wait";
				Icon = "";
				Duration = 5;
				Callback = NotificationBindable;
			})
			wait(15)
			game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Stages.Stage130.Checkpoint.Checkpoint.CFrame
			wait(2)
			game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Stages.END["The End Obby..!!"].Checkpoint.CFrame
		elseif game.PlaceId == 13413789725 then -- emo obby
			getgenv().collectOrbsToggle = true
			spawn(function()
				local checkpoints = game:GetService("Workspace").Checkpoints:GetChildren()
				table.sort(checkpoints, function(a, b)
					return tonumber(a.Name) < tonumber(b.Name)
				end)
				while wait() do
					if not getgenv().collectOrbsToggle then
						break
					end
					for i, checkpoint in ipairs(checkpoints) do
						game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = checkpoint.CFrame
						wait(0.05) -- Adjust the wait time as needed
					end
					game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(160, 285, 371)
					wait(10.8)
					fireproximityprompt(game:GetService("Workspace").endlobby.Rebirth.Prompt)
					wait(2)
				end
			end)
		elseif game.PlaceId == 11364184405 then -- 725 obby
			while true do
				wait()
				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Checkpoints.Floor8["725"].Detector.CFrame
				wait(2)
				game:GetService("ReplicatedStorage"):WaitForChild("Honeypot"):WaitForChild("Internal"):WaitForChild("RemoteStorage"):WaitForChild("Rebirth - RemoteEvent"):FireServer()
			end
		elseif game.PlaceId == 10760024537 then -- ultimate easy obby
			game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Checkpoints["50"].DetectorPart.CFrame
		elseif game.PlaceId == 3587619225 then -- mega easy obby 825 stages
			local checkpoints = game:GetService("Workspace").Checkpoints:GetChildren()
			table.sort(checkpoints, function(a, b)
				return tonumber(a.Name) < tonumber(b.Name)
			end)
			for i, checkpoint in ipairs(checkpoints) do
				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = checkpoint.CFrame + Vector3.new(0, 5, 0)
				wait(0.5) -- Adjust the wait time as needed
			end
		elseif game.PlaceId == 8472851459 then -- really easy obby
			local checkpoints = game:GetService("Workspace").Checkpoints:GetChildren()
			table.sort(checkpoints, function(a, b)
				return tonumber(a.Name) < tonumber(b.Name)
			end)
			for i, checkpoint in ipairs(checkpoints) do
				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = checkpoint.CFrame + Vector3.new(0, 5, 0)
				wait(0.5) -- Adjust the wait time as needed
			end
		elseif game.PlaceId == 12961669859 then -- Easy Fun Obby
			game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-301, 236, 78)
		elseif game.PlaceId == 15736515144 then -- Barrys prison run classic V1
			game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3781, 1072, -502)
		elseif game.PlaceId == 8712817601 then -- barrys prison V2
			game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(10, 677, -915)
			wait(1.25)
			game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = true
			wait(5)
			game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-331, 873, -2726)
		elseif game.PlaceId == 14184086618 then -- obby but bike
			loadstring(game:HttpGet("https://github.com/KhSaeed90/Roblox/raw/workspace/14184086618"))()
		elseif game.PlaceId == 13326256431 then -- obby but no jump
			game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Checkpoints["48"].CFrame
		elseif game.PlaceId == 1946695497 then -- escape butcher obby
			local checkpoints = game:GetService("Workspace").Stages:GetChildren()
			table.sort(checkpoints, function(a, b)
				return tonumber(a.Name) < tonumber(b.Name)
			end)
			for i, checkpoint in ipairs(checkpoints) do
				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = checkpoint.CFrame + Vector3.new(0, 5, 0)
				wait(0.5) -- Adjust the wait time as needed
			end
		elseif game.PlaceId == 12357508217 then
			game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Checkpoints["60"].Detector.CFrame
		else -- universal
			game:GetService("StarterGui"):SetCore("SendNotification",  {
				Title = "Game Not Supported";
				Text = "game not supported so it may be trash or not work at all";
				Icon = "";
				Duration = 5;
				Callback = NotificationBindable;
			})
			if game:GetService("Workspace"):FindFirstChild('Checkpoints') then
				local checkpoints = game:GetService("Workspace").Checkpoints:GetChildren()
				table.sort(checkpoints, function(a, b)
					return tonumber(a.Name) < tonumber(b.Name)
				end)
				for i, checkpoint in ipairs(checkpoints) do
					game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = checkpoint.CFrame
					wait(6) -- Adjust the wait time as needed
				end
			elseif game:GetService("Workspace"):FindFirstChild('Stages') then
				local checkpoints = game:GetService("Workspace").Stages:GetChildren()
				table.sort(checkpoints, function(a, b)
					return tonumber(a.Name) < tonumber(b.Name)
				end)
				for i, checkpoint in ipairs(checkpoints) do
					game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = checkpoint.CFrame
					wait(6) -- Adjust the wait time as needed
				end
			else
				game:GetService("StarterGui"):SetCore("SendNotification",  {
					Title = "Could not find path";
					Text = "Could not find path including all the stages/checkpoints try the other method";
					Icon = "";
					Duration = 5;
					Callback = NotificationBindable;
				})
			end
		end
	end)
	ObbysSection:NewButton("Method 2", "fire all touchinterests", function()
		game:GetService("StarterGui"):SetCore("SendNotification",  {
			Title = "if this doesnt work for you try method 3";
			Text = "executing in 5 seconds";
			Icon = "";
			Duration = 5;
			Callback = NotificationBindable;
		})
		wait(5)
		function getRoot(char)
			local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
			return rootPart
		end
		local root = getRoot(game:GetService("Players").LocalPlayer.Character) or game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("BasePart")
		local function touch(x)
			x = x:FindFirstAncestorWhichIsA("Part")
			if x then
				if firetouchinterest then
					task.spawn(function()
						firetouchinterest(x, root, 1)
						wait()
						firetouchinterest(x, root, 0)
					end)
				end
				x.CFrame = root.CFrame
			end
		end
		for _, descendant in ipairs(game:GetService("Workspace"):GetDescendants()) do
			if descendant:IsA("TouchTransmitter") then
				touch(descendant)
			end
		end
	end)
	ObbysSection:NewButton("Method 3", "fire all touchinterests pt2", function()
		game:GetService("StarterGui"):SetCore("SendNotification",  {
			Title = "if this doesnt work for you join the discord and open a ticket";
			Text = "executing in 5 seconds";
			Icon = "";
			Duration = 5;
			Callback = NotificationBindable;
		})
		wait(5)
		local ftiamount = 0
		for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
			if v:IsA("TouchTransmitter") then
				ftiamount = ftiamount + 1
				firetouchinterest(game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart"), v.Parent, 0) --0 is touch
				wait()
				firetouchinterest(game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart"), v.Parent, 1) -- 1 is untouch
			end
		end
	end)
	local Main = Window:NewTab("Main")
	local MainSection = Main:NewSection("Main")
	MainSection:NewButton("FE Trolling GUI", "Troll", function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/FE%20Trolling%20GUI.luau"))()
	end)
	MainSection:NewButton("Btools", "Btools", function()
		game:GetService("StarterGui"):SetCoreGuiEnabled(2, true)
		a = Instance.new("HopperBin", game:GetService("Players").LocalPlayer.Backpack)
		a.BinType = 2
		b = Instance.new("HopperBin", game:GetService("Players").LocalPlayer.Backpack)
		b.BinType = 3
		c = Instance.new("HopperBin", game:GetService("Players").LocalPlayer.Backpack)
		c.BinType = 4
	end)
	MainSection:NewButton("Btools 2", "Btools 2", function()
		local LocalPlayer = game:GetService("Players").LocalPlayer
		local mouse = LocalPlayer:GetMouse()
		local movetool = Instance.new("Tool", LocalPlayer.Backpack)
		local deletetool = Instance.new("Tool", LocalPlayer.Backpack)
		local undotool = Instance.new("Tool", LocalPlayer.Backpack)
		local identifytool = Instance.new("Tool", LocalPlayer.Backpack)
		local movedetect = false
		local movingpart = nil
		local movetransparency = 0
		if editedparts == nil then
			editedparts = {}
			parentfix = {}
			positionfix = {}
		end
		deletetool.Name = "Delete"
		undotool.Name = "Undo"
		identifytool.Name = "Identify"
		movetool.Name = "Move"
		undotool.CanBeDropped = false
		deletetool.CanBeDropped = false
		identifytool.CanBeDropped = false
		movetool.CanBeDropped = false
		undotool.RequiresHandle = false
		deletetool.RequiresHandle = false
		identifytool.RequiresHandle = false
		movetool.RequiresHandle = false
		deletetool.Activated:Connect(function()
			warn("Delete Tool", mouse.Target.Name)
			table.insert(editedparts, mouse.Target)
			table.insert(parentfix, mouse.Target.Parent)
			table.insert(positionfix, mouse.Target.CFrame)
			mouse.Target.Parent = nil
		end)
		undotool.Activated:Connect(function()
			warn("Undo Tool", editedparts[#editedparts].Name)
			editedparts[#editedparts].Parent = parentfix[#parentfix]
			editedparts[#editedparts].CFrame = positionfix[#positionfix]
			table.remove(positionfix, #positionfix)
			table.remove(editedparts, #editedparts)
			table.remove(parentfix, #parentfix)
		end)
		identifytool.Activated:Connect(function()
			warn("Identify Tool", "Instance: " .. mouse.Target.ClassName .. "\nName: " .. mouse.Target.Name)
		end)
		movetool.Activated:Connect(function()
			warn("Move Tool", mouse.Target.Name)
			movingpart = mouse.Target
			movedetect = true
			movingpart.CanCollide = false
			movetransparency = movingpart.Transparency
			movingpart.Transparency = 0.5
			mouse.TargetFilter = movingpart
			table.insert(editedparts, movingpart)
			table.insert(parentfix, movingpart.Parent)
			table.insert(positionfix, movingpart.CFrame)
			movingpart.Transparency = movingpart.Transparency / 2
			repeat
				mouse.Move:Wait()
				movingpart.CFrame = CFrame.new(mouse.Hit.p)
			until movedetect == false
		end)
		movetool.Deactivated:Connect(function()
			warn("Move Tool", mouse.Target.Name)
			movingpart.CanCollide = true
			movedetect = false
			mouse.TargetFilter = nil
			movingpart.Transparency = movetransparenc
		end)
	end)
	MainSection:NewButton("GabX", "GabX", function()
		loadstring(game:HttpGet(('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/GabX'), true))()
	end)
	MainSection:NewButton("UnNamed ESP", "UnNamed ESP", function()
		pcall(function()
			loadstring(game:HttpGet('https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua'))()
		end)
	end)
	MainSection:NewButton("Mobile Aimbot", "only use if your actually on mobile", function()
		local Players = game:GetService("Players")
		local UserInputService = game:GetService("UserInputService")
		local RunService = game:GetService("RunService")
		local localPlayer = Players.LocalPlayer
		local camera = game:GetService("Workspace").CurrentCamera
		local lockOnActive = false
		local teamCheckActive = false
		local currentTouch = nil
		local fovRadius = 125
		local screenGui = Instance.new("ScreenGui")
		screenGui.Parent = game:GetService("CoreGui")
		local toggleButton = Instance.new("TextButton")
		toggleButton.Parent = screenGui
		toggleButton.Size = UDim2.new(0, 150, 0, 50)
		toggleButton.Position = UDim2.new(0, 100, 0, 100)
		toggleButton.Text = "Toggle Lock-On"
		toggleButton.Draggable = true
		local toggleTeamButton = Instance.new("TextButton")
		toggleTeamButton.Parent = screenGui
		toggleTeamButton.Size = UDim2.new(0, 150, 0, 50)
		toggleTeamButton.Position = UDim2.new(0, 100, 0, 160)
		toggleTeamButton.Text = "Toggle Team Check"
		toggleTeamButton.Draggable = true
		local fovCircleGui = Instance.new("ImageLabel")
		fovCircleGui.Parent = screenGui
		fovCircleGui.AnchorPoint = Vector2.new(0.5, 0.5)
		fovCircleGui.Size = UDim2.new(0, fovRadius * 2, 0, fovRadius * 2)
		fovCircleGui.Image = "rbxassetid://432312433"
		fovCircleGui.ImageTransparency = 0.5
		fovCircleGui.ImageColor3 = Color3.new(1, 1, 1)
		fovCircleGui.BackgroundTransparency = 1
		fovCircleGui.Visible = false
		fovCircleGui.ZIndex = 0 -- Ensure it's behind other GUI elements

-- Function to check if a player is within the FOV and not obstructed by walls
		local function isPlayerVisible(targetPlayer)
			if not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("Head") then
				return false
			end
			if teamCheckActive and targetPlayer.Team == localPlayer.Team then
				return false -- Player is on the same team
			end
			local targetHeadPosition = targetPlayer.Character.Head.Position
			local vectorToTarget = (targetHeadPosition - camera.CFrame.Position).unit
			local ray = Ray.new(camera.CFrame.Position, vectorToTarget * fovRadius)
			local part, position = game:GetService("Workspace"):FindPartOnRay(ray, localPlayer.Character, false, true)
			if part and part:IsDescendantOf(targetPlayer.Character) then
				local dotProduct = camera.CFrame.LookVector:Dot(vectorToTarget)
				local angle = math.deg(math.acos(dotProduct))
				return angle <= (fovRadius / 2) -- Player is within FOV
			end
			return false -- Player is obstructed by walls
		end

-- Toggle button functionality
		toggleButton.MouseButton1Click:Connect(function()
			lockOnActive = not lockOnActive
			toggleButton.Text = lockOnActive and "Lock-On Active" or "Toggle Lock-On"
			fovCircleGui.Visible = lockOnActive
		end)
		toggleTeamButton.MouseButton1Click:Connect(function()
			teamCheckActive = not teamCheckActive
			toggleTeamButton.Text = teamCheckActive and "Team Check Active" or "Toggle Team Check"
		end)

-- Function to handle touch input
		local function onTouchStarted(touch)
			currentTouch = touch.Position
			fovCircleGui.Position = UDim2.new(0, touch.Position.X - fovRadius, 0, touch.Position.Y - fovRadius)
			fovCircleGui.Visible = true
		end

-- Function to handle touch ended
		local function onTouchEnded(touch)
			if currentTouch and currentTouch == touch.Position then
				currentTouch = nil
				fovCircleGui.Visible = false
			end
		end

-- Connect the touch event handlers
		UserInputService.TouchStarted:Connect(onTouchStarted)
		UserInputService.TouchEnded:Connect(onTouchEnded)
		RunService.RenderStepped:Connect(function()
			if lockOnActive then
				for _, player in ipairs(Players:GetPlayers()) do
					if player ~= localPlayer and isPlayerVisible(player) then
						local head = player.Character.Head
						local direction = (head.Position - camera.CFrame.Position).unit
						camera.CFrame = CFrame.new(camera.CFrame.Position, camera.CFrame.Position + direction * 10)
						break
					end
				end
			end
		end)
	end)
	MainSection:NewButton("Portal Gun", "COOL ASF", function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/portal%20gun.txt'))()
	end)
	local executors2345 = Window:NewTab("Executors", 10507357657)-- made by espresso0069
	local executors2345Section = executors2345:NewSection("Executors")-- made by espresso0069
	executors2345Section:NewButton("Synapse X", "uses synapse x functions", function()-- made by espresso0069
		loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/Synapse_UI.txt'))()-- made by espresso0069
	end)-- made by espresso0069
-- made by espresso0069 ^^^^^
	local PlaceInfo = Window:NewTab("Place Info", 10507357657)
	local PlaceInfoSection = PlaceInfo:NewSection("Place Info")
	PlaceInfoSection:NewButton(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name, game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Description, function()
		everyClipboard(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Description)
	end)
	PlaceInfoSection:NewButton("RespectFilteringEnabled is " .. _G.lmao24, function()
		
	end)
	PlaceInfoSection:NewButton("Filtering is Enabled lmao Forced ", "Filtering is Enabled lmao Forced", function()
		
	end)
end
