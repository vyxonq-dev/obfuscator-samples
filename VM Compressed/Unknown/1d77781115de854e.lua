-- optional deletes to keep downloading latest stuffs
delfile("newvape/main.lua")
delfolder('newvape/libraries')
delfolder('newvape/games')
delfolder('newvape/assets')
-- loadstring
loadstring(game:HttpGet("https://raw.githubusercontent.com/Night5449791/VapeV4ForRoblox/main/NewMainScript.lua", true))()