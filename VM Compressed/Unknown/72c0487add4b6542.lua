local games = {      
    [85896571713843] = "https://raw.githubusercontent.com/Aerlro/OTC/refs/heads/main/BGSI/main.lua",  
    [113489516847696] = "https://raw.githubusercontent.com/Aerlro/OTC/refs/heads/main/My%20Fishing%20Brainrots/main.lua", 
    [75992362647444] = "https://raw.githubusercontent.com/Aerlro/OTC/refs/heads/main/Tap%20Simulator/main.lua"
}  
  
local scriptURL = games[game.PlaceId]  
if scriptURL then  
    loadstring(game:HttpGet(scriptURL))()  
else   
    print("Game not supported on OTC Script!")  
end