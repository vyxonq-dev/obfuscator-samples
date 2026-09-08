local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/annaxiong1/IreXion-UI-Library/refs/heads/main/IreXion%20UI%20Library"))()
local Killswitch = loadstring(game:HttpGet("https://guydehub.github.io/killswitchvalue.lua"))()

if Killswitch.value == true then
    Library:Notify("KILLSWITCH ACTIVE!", function() end)
    game.Players.LocalPlayer:Kick("This script has been disabled due to a killswitch. Reason: " .. Killswitch.reason)
end

local Gui = Library:AddGui({
	Title = {"GuydeHub", " Version 2"},
	ThemeColor = Color3.fromRGB(0, 255, 0),
	ToggleKey = Enum.KeyCode.G,
})

local DW = Gui:AddTab("Dandy's World")
local UTDG = Gui:AddTab("Untitled Drill Game")
local CONFIG = Gui:AddTab("Config")

local UTDGSCRIPTS = UTDG:AddCategory("Scripts")
local KEYLESS = DW:AddCategory("Keyless")
local KEY = DW:AddCategory("Uses Key")
local SETTINGS = CONFIG:AddCategory("UI Config")

local Hex = KEYLESS:AddButton("Hex Hub", function()
	loadstring(game:HttpGet("https://pastebin.com/raw/H3u62n7D"))()
end)
local Iriska = KEYLESS:AddButton("Iriska Hub", function()
	loadstring(game:HttpGet("https://pastebin.com/raw/N4Y01FkS"))();
end)
local Spooks = KEYLESS:AddButton("Spooks Hub", function()
	loadstring(game:HttpGet("https://rawscripts.net/raw/Dandy's-World-ALPHA-Spooks-Hub-25392"))()
end)
local Lumin = KEY:AddButton("Lumin Hub", function()
	loadstring(game:HttpGet("http://lumin-hub.lol/Dandys.lua"))()
end)
local SFB = KEYLESS:AddButton("Smile's Fun Box", function()
	loadstring(game:HttpGet("https://pastebin.com/raw/2qG9Sqjq"))()
end)
local 

local Farm = UTDGSCRIPTS:AddButton("Farm", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Bac0nHck/Scripts/refs/heads/main/untitleddrillgame.lua"))()
end)


local Bind = SETTINGS:AddBind("GUI Toggle", Gui.ToggleKey, function()
	print("Toggled GUI")
end)
local Close = SETTINGS:AddButton("Close GUI", function()
    Library:Notify("Are you sure want to close the GUI?", function(bool)
        if bool then
            game.Players.LocalPlayer:Kick("There's no good way to close the GUI, so I just kicked you cause I'm lazy.")
        end
        if not bool then
            Library:Notify("Canceled.", function() end)
        end
    end)
end)

Library:Notify("Thank you for using GuydeHub V2.", function() end)
