-- Upd 9/21/22


local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/HexerMaster1929/HexHub/main/UI/NewUI.lua"))()

wait(1)

Lib:MakeNotification("Greenville Script","Autowash,Autofuel,SpeedMod Loading. Please wait!","rbxassetid://10507208348",5.6)

wait(0.3)

loadstring(game:HttpGet("https://raw.githubusercontent.com/HexerMaster1929/MyScripts/main/Greenville/GVAUTOREFUEL.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/HexerMaster1929/MyScripts/main/Greenville/GVAUTOWASH.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/HexerMaster1929/MyScripts/main/Greenville/GVSPEEDMOD.lua"))()

Lib:MakeNotification("Greenville Script","Autowash,Autofuel,SpeedMod Loaded, Enjoy!","rbxassetid://10507208390",5.6)


