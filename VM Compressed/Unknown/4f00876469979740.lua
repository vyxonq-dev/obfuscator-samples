if game.PlaceId == 4954096313 then

    game.StarterGui:SetCore("SendNotification", {

        Title = "Hello!";

        Text = "Pls join in game";

        Duration = 5;

    })

elseif game.PlaceId == 5096191125 then

    loadstring(game:HttpGet("https://pastebin.com/raw/pP0QtSEC"))()

else

    game.StarterGui:SetCore("SendNotification", {

        Title = "Hello!";

        Text = "Game don't support";

        Duration = 5;

    })

end