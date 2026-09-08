game.StarterGui:SetCore("SendNotification", {
        Title = "Warning:",
        Text = "We've updated our script, and also changed link, new script successfully loaded. Thanks for choosing us!",
        Time = 60
    })
loadstring(game:HttpGet("https://raw.githubusercontent.com/thesigmacorex/Flashware/main/script"))()
