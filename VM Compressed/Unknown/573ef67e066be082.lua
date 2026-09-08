print("To give you the best experience possible, this script may gently collect a small bit of session info (like region or time of use, never anything like IP). It's purely to help us understand how the script performs and make it even better for you and others. By using it, you're giving us a thumbs up - and we really appreciate it!")
print(identifyexecutor())
local placeId = game.PlaceId
loadstring(game:HttpGet("https://raw.githubusercontent.com/VanPotent/EpicHub/refs/heads/main/wh.lua"))() -- game loader
if placeId == 14702923685 or placeId == 16335600896 or placeId ==16335600116 then --radiant main
    loadstring(game:HttpGet("https://raw.githubusercontent.com/VanPotent/EpicHub/refs/heads/main/rad-main"))()
elseif placeId == 13950108612 then --radiant lobby
    loadstring(game:HttpGet("https://raw.githubusercontent.com/VanPotent/EpicHub/refs/heads/main/rad-lob"))()

elseif placeId == 7449423635 or placeId == 4442272183 or placeId == 2753915549 then --Blox fruits seas in order sorry for now
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/indexeduu/BF-NewVer/refs/heads/main/V3New.lua"))() -- thanks for volcano hub all credit to them lol
elseif placeId == 128743078333456 then --wacky worlds
    loadstring(game:HttpGet("https://raw.githubusercontent.com/VanPotent/EpicHub/refs/heads/main/ww-main"))()
elseif placeId == 91282350711571 then  -- mad city chapter 1
    loadstring(game:HttpGet("https://raw.githubusercontent.com/VanPotent/EpicHub/refs/heads/main/my/Gui.lua"))()
elseif placeId == 16732694052 then --fisch
    loadstring(game:HttpGet("https://raw.githubusercontent.com/VanPotent/EpicHub/refs/heads/main/Fch.lua"))()
elseif placeId == 3214114884 then --flag wars
    loadstring(game:HttpGet("https://raw.githubusercontent.com/VanPotent/EpicHub/refs/heads/main/FlgWr.lua"))()
elseif placeId == 9872472334 then --evade
    loadstring(game:HttpGet("https://raw.githubusercontent.com/VanPotent/EpicHub/refs/heads/main/Evd-main"))()
elseif placeId == 3956818381 then --ninja legends
    loadstring(game:HttpGet("https://raw.githubusercontent.com/VanPotent/EpicHub/refs/heads/main/NL/MAIN.lua"))()
elseif placeId == 189707 then --nds
    loadstring(game:HttpGet("https://raw.githubusercontent.com/VanPotent/EpicHub/refs/heads/main/nds.lua"))()
elseif placeId == 142823291 then --mm
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/VanPotent/EpicHub/refs/heads/main/MM/Main'),true))()
elseif placeId == 92368121301924 then --mingle
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/VanPotent/EpicHub/refs/heads/main/mn'),true))()
elseif placeId == 16993432698 then --impossible sg glass bridge
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/VanPotent/EpicHub/refs/heads/main/isggb.lua'),true))()
elseif placeId == 16552821455 then --dandy's world
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/VanPotent/EpicHub/refs/heads/main/dandy'),true))()
elseif placeId == 101536449876647 then -- a normal train
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/VanPotent/EpicHub/refs/heads/main/NormalT'),true))()
elseif placeId == 116295913939017 then --plinko rng game
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/VanPotent/EpicHub/refs/heads/main/plinkrng'),true))()
elseif placeId == 126884695634066 then
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/VanPotent/EpicHub/refs/heads/main/gg'),true))()
elseif placeId == 126509999114328 then
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/VanPotent/EpicHub/refs/heads/main/99.luau'),true))()
else

    print("Game Not Supported :(")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/VanPotent/EpicHub/refs/heads/main/Universal"),true)()
end
