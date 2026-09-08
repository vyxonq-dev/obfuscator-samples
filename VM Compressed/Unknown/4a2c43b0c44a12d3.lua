if game.PlaceId == 114234929420007 then
    loadstring(game:HttpGet("https://vss.pandadevelopment.net/virtual/file/f6d0fcaf4ac94b19"))()
else
    getgenv().skipload = true
    getgenv().AUTOLOAD = nil -- only if the key is valid / Example : nil -> "Flick"
    loadstring(game:HttpGet("https://vss.pandadevelopment.net/virtual/file/38e0e4e7c1a347e0"))()
end
-- Discord: discord.gg/kqKdsN9hDP
-- don't work on xeno/solara
 
--[[
	Game list for the autoload
	- getgenv().AUTOLOAD = "Counter Blox"
	- getgenv().AUTOLOAD = "BloxStrike"
	- getgenv().AUTOLOAD = "Prison Life"
	- getgenv().AUTOLOAD = "Case Opening Simulator"
	- getgenv().AUTOLOAD = "Frontlines"
	- getgenv().AUTOLOAD = "Sniper Duels"
	- getgenv().AUTOLOAD = "Flick"
]]
