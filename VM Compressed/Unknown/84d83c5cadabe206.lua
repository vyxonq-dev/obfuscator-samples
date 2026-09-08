if game.PlaceId == 116495829188952 then --dead rails lobby
    game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Skillware", Text = "You Must Join A Game To Execute Skillware!"})
elseif game.PlaceId == 70876832253163 then --dead rails game
    loadstring(game:HttpGet("https://raw.githubusercontent.com/isaberjan420/Roblox/refs/heads/main/Dead%20Rails/Skillware.lua"))()
end
