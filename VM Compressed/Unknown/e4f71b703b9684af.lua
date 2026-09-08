makefolder("WildHub")
makefolder("WildHub/assets")
makefolder("WildHub/Config")
writefile("WildHub/assets/WW-Logo.png", game:HttpGet("https://github.com/noob-scripts/some-scripts/blob/master/Wild%20Hub/assets/Wild-Wide-Logo.png?raw=true"))
writefile("WildHub/assets/Voldex-Logo.png", game:HttpGet("https://avatars.githubusercontent.com/u/73309439?s=200&v=4"))
writefile("WildHub/assets/custom-cursor.png", game:HttpGet("https://github.com/noob-scripts/some-scripts/blob/master/Wild%20Hub/assets/fake-mouse.png"))

-- loadstring(game:HttpGet("https://raw.githubusercontent.com/noob-scripts/some-scripts/refs/heads/master/Wild%20Hub/Special/SynapseX.lua"))()

local scripts = {
    [4924922222] = "https://github.com/noob-scripts/some-scripts/blob/master/Wild%20Hub/brookhaven.lua?raw=true",
    [3956818381] = "https://github.com/noob-scripts/some-scripts/blob/master/Wild%20Hub/NinjaLegends.lua?raw=true",
    [155382109] = "https://raw.githubusercontent.com/noob-scripts/some-scripts/refs/heads/master/Wild%20Hub/SAKTKIA51.lua",
    [3101667897] = "https://github.com/noob-scripts/some-scripts/blob/master/Wild%20Hub/LegendsOfSpeed.lua?raw=true",
    [70671905624144] = "https://raw.githubusercontent.com/noob-scripts/some-scripts/refs/heads/master/Wild%20Hub/StealABaddie.lua",
    [142823291] = "https://github.com/noob-scripts/some-scripts/blob/master/Wild%20Hub/MM2.lua?raw=true",
    [14518422161] = "https://github.com/noob-scripts/some-scripts/blob/master/Wild%20Hub/GunFight.lua?raw=true",
    [121864768012064] = "https://raw.githubusercontent.com/noob-scripts/some-scripts/refs/heads/master/Wild%20Hub/FishIt.lua",
    [16116270224] = "https://github.com/noob-scripts/BCX/blob/main/DW_Lobby.lua?raw=true",
    [16552821455] = "https://github.com/noob-scripts/BCX/blob/main/DW_Game.lua?raw=true"
}

local placeid = game.PlaceId
if scripts[placeid] then
    loadstring(game:HttpGet(scripts[placeid]))()
else
    loadstring(game:HttpGet("https://raw.githubusercontent.com/noob-scripts/some-scripts/refs/heads/master/Wild%20Hub/Universal/Anticheat-Bypasses.lua"))()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/noob-scripts/some-scripts/refs/heads/master/Wild%20Hub/Universal.lua"))()
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/noob-scripts/some-scripts/refs/heads/master/Wild%20Hub/Special/CREDITS.lua"))()
