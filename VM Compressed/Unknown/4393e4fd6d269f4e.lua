local player = game.Players.LocalPlayer

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("ZxcHub", "RJTheme8")

local Tab = Window:NewTab("AutoParry")


local Section = Tab:NewSection("AutoParry")

Section:NewDropdown("AutoParry Mods (Double Click)", "V3,V2,V1", {"AutoBlock V1", "AutoBlock V"}, function(currentOption)
    if currentOption == "AutoBlock V1" then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/AutoBlock"))()
	elseif currentOption == "AutoBlock V2" then
	loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/b964c4456aeff691784ffaaa181ab423.lua"))()

	end
end)
Section:NewButton("AutoParry V2", "Auto Parry V2 Red Cricles", function ()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/autoparrybest"))()
end)
local Tab = Window:NewTab("Scripts/Hubs")

local Section = Tab:NewSection("No key Script")

	Section:NewButton("ParseOP", "ParseOP Script, no key", function ()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Omgshit/Scripts/main/MainLoader.lua"))()
	end)

    Section:NewButton("Nexus", "Nexus Script, no key", function ()
loadstring(game:HttpGet("https://raw.githubusercontent.com/s-o-a-b/nexus/main/loadstring"))()
	end)

    Section:NewButton("Bedol Hub Old", "Bedol Script recomend, no key", function ()
loadstring(game:HttpGet("https://raw.githubusercontent.com/3345-c-a-t-s-u-s/SourceLua/main/Blade_Ball.lua"))()
    end)

	    Section:NewButton("Bedol Hub 2.0", "Bedol Script op, no key", function ()
loadstring(game:HttpGet("https://raw.githubusercontent.com/3345-c-a-t-s-u-s/-beta-/main/AutoParry.lua"))()
    end)

    Section:NewButton("Inferno Hub", "Inferno Script , no key ", function ()
loadstring(game:HttpGet("https://github.com/SadlekAski/Scripts/raw/main/Blade%20Ball/Equip%20any%20ability.lua"))()
    end)

    Section:NewButton("V3 AutoParry", "Vector Script (op AutoP) , no key ", function ()
loadstring(game:HttpGet("https://paste.gg/p/anonymous/42c468c6f0d94d6a86fc90caf7f0e897/files/9d3a059ff4064dc0b9efe621c774d175/raw"))()
    end)

local Section = Tab:NewSection("Key Script")

	    Section:NewButton("Wii Hub", "Vector Script  , key ", function ()
script_key="xzCLzurEXOwFoshyfJKTPEXhFhAVPBII";
loadstring(game:HttpGet("https://raw.githubusercontent.com/vFishyTurtle/wiihub/main/free%20loader"))()
    end)

    Section:NewButton("Astra Hub", "Astro Script , key ", function ()
loadstring(game:HttpGet('https://raw.githubusercontent.com/OfficialHi/AstroHub/main/Loader/Main.lua'))()
    end)

    Section:NewButton("Не работает.", "Хз, не врубай его.", function ()
loadstring(game:HttpGet("loadstring(game:HttpGet(('https://raw.githubusercontent.com/romkich09/keySystem/main/mainKey'),true))()"))()
	end)

    Section:NewButton("Era hub", "Era Script, key", function ()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Eblan19/875578/main/dolbaeb9867"))()
	end)

    Section:NewButton("NeReid Hub", "NeReid Script key (op autop)", function ()
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/b964c4456aeff691784ffaaa181ab423.lua"))()
	end)

    Section:NewButton("AlienWare Script", "AlienWare Script, key", function ()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/romkich09/keySystem/main/mainKey'),true))()
	end)

local Section = Tab:NewSection("Other Scripts")

	Section:NewButton("Dark Dex", "Explorer for any game",  function ()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua", true))()
	end)

	Section:NewButton("Infinity Yeild", "Cmd for any game",  function ()
loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
	end)

	Section:NewButton("FE Scripts", "FE Scripts",  function ()
loadstring(game:HttpGet('https://raw.githubusercontent.com/Dvrknvss/UniversalFEScriptHub/main/Script'))()
	end)

local Tab = Window:NewTab("Misc")

local Section = Tab:NewSection("Options")

    Section:NewButton("Universal Fly", "Universal Fly Maybe not work ", function ()
loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
    end)

	Section:NewSlider("SpeedHack", "Speed hack for any game", 500, 0, function (s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
	end)

		Section:NewSlider("JumpPower", "Jump hack for any game", 500, 0, function (s)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
	end)

	Section:NewSlider("Gravity", "Gravity Hack for any game", 500, 0, function (s)
    game.workspace.Gravity = s
	end)

	Section:NewButton("Teleport", "Teleporter for any game",  function ()
loadstring(game:HttpGet("https://pastebin.com/raw/AbDM2er1"))()
	end)

Section:NewToggle("Infinity Jump", "Infinity Jump For any game", function(state)
    if state then
    loadstring(game:GetHttp("https://pastebin.com/raw/GVcPMnQX"))()
    else
    loadstring(game:GetHttp("https://github.com/RobloxLuaScript/InfJump-Roblox/blob/main/bob.txt"))()
    end
end)
