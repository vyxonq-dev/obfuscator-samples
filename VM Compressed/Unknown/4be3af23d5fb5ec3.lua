if shared.Restart then
	shared.Restart = false
	delfile('AutumnV3')
end

if not isfolder('AutumnV3') then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/AutumnV3/AutumnForRoblox/refs/heads/main/Installer.lua'))()
end

local GuiLibrary = loadfile('AutumnV3/GuiLibrary.lua')()

GuiLibrary.Initialize();

local Combat = GuiLibrary.API.CreateWindow('Combat')
local Player = GuiLibrary.API.CreateWindow('Player')
local Movement = GuiLibrary.API.CreateWindow('Movement')
local Visuals = GuiLibrary.API.CreateWindow('Visuals')
local World = GuiLibrary.API.CreateWindow('World')
local Exploit = GuiLibrary.API.CreateWindow('Exploit')

Uninject = Exploit:CreateModule({
	['Name'] = 'Uninject',
	['Function'] = function(callback)
		if callback then
			GuiLibrary.API.Uninject();
			
			if Reinject.Enabled then
				loadfile('AutumnV3/Main.lua')()
			end
		end
	end,
})
Reinject = Uninject.CreateToggle({
	['Name'] = 'Reinject'
})

local Games = {
    ['Bedwars'] = {6872274481, 8444591321, 8560631822},
	['BedwarZ'] = {71480482338212},
}

--loadfile('AutumnV3/Games/Universal.lua')()
for gName, v in Games do
    for _, id in v do
        if game.PlaceId == id then
            if not isfile('AutumnV3/Games/'..gName..'.lua') then
                continue end;

            loadfile('AutumnV3/Games/'..gName..'.lua')()
        end
    end
end
