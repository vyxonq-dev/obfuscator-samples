local gameId = game.GameId

if gameId == 3150475059 then

    game:GetService("Players").LocalPlayer.Character:Kick("Free Trial does not support FF2. Please read supported games.")

elseif gameId == 4777817887 then

    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/33e520d1296dff82ff9920aa46f20de1.lua"))()
    print("WiiHub BladeBall loaded successfully")

else
    print("Unsupported")
end
