if game.GameId == 135406051460913 or game.PlaceId == 135406051460913 or game.GameId == 8355209732 or game.PlaceId == 8355209732 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AndreyTheDev/sigma/main/sigma.runhidefight/main.lua"))()
else
    print("[SIGMA]: Wrong place | GameId: " .. game.GameId .. " | PlaceId: " .. game.PlaceId)
end

--setclipboard(game.GameId)
