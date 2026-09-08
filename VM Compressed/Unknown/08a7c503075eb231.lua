local lp= game.Players.LocalPlayer
local placeid = game.PlaceId

local GetName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)

if placeid == 15437737400 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Venograde/Vino/main/mamamia.txt"))() --Chaos(Remastered)
elseif placeid == 15582998794 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Venograde/Vino/main/bro.txt"))() --Slovo Pacana(Favork Studio)
elseif placeid == 6441847031 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Venograde/Vino/main/koko.txt"))() -- Chaos(Katana)
elseif string.find(GetName.Name,"Project") or string.find(GetName.Name,"Duels") then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Venograde/Vino/main/smashs.txt"))() --Project Smash
elseif placeid == 13985151437 then
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Venograde/Vino/main/stock.txt'))() -- stock
else
    print('not support or bug')
end 

