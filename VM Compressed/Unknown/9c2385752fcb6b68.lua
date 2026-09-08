local games = {      
    [85896571713843] = "https://raw.githubusercontent.com/Aerlro/OTC/refs/heads/main/BGSI/main.lua",  
    [113489516847696] = "https://raw.githubusercontent.com/Aerlro/OTC/refs/heads/main/My%20Fishing%20Brainrots/main.lua", 
    [75992362647444] = "https://raw.githubusercontent.com/Aerlro/OTC/refs/heads/main/Tap%20Simulator/main.lua",
    [134763881293027] = "https://raw.githubusercontent.com/Aerlro/OTC/refs/heads/main/Steal%20from%20Brainrots/main.lua",
    [119987266683883] = "https://raw.githubusercontent.com/Aerlro/OTC/refs/heads/main/Survive%20Lava%20for%20Brainrots/main.lua",
    [139299356663913] = "https://raw.githubusercontent.com/Aerlro/OTC/refs/heads/main/Jump%20for%20Brainrots/main.lua",
    [71827913900569] = "https://raw.githubusercontent.com/Aerlro/OTC/refs/heads/main/Grow%20Beanstalk%20for%20Brainrots/main.lua",
    [130594398886540] = "https://raw.githubusercontent.com/Aerlro/OTC/refs/heads/main/Garden%20Horizons/main.lua",
    [114640202062357] = "https://raw.githubusercontent.com/Aerlro/OTC/refs/heads/main/Swing%20Obby%20for%20Brainrots/main.lua",
    [92416421522960] = "https://raw.githubusercontent.com/Aerlro/OTC/refs/heads/main/Slime%20RNG/main.lua",
    [123698673940079] = "https://raw.githubusercontent.com/Aerlro/OTC/refs/heads/main/Steal%20a%20Lucky%20Egg/main.lua"
}
  
local scriptURL = games[game.PlaceId]  
if scriptURL then  
    loadstring(game:HttpGet(scriptURL))()  
else   
    print("Game not supported on OTC Script!")  
end
