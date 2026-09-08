local id = game.PlaceId
local place = ""
local function loadScript(f)
	loadstring(game:HttpGet("https://raw.githubusercontent.com/qwertyui-cool/uhh-yes/main/"..f))()
end
local function check(i)
	if i == 6403373529 then place = "slap%20battles" return end
	if i == 9015014224 then place = "slap%20battles" return end
	if i == 11520107397 then place = "slap%20battles" return end
	error("unsupported game")
end
local function load(g)
	loadScript("games/"..g..".lua")
	print("loaded")
end
check(id)
load(place)
