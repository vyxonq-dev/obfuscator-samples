local StarterGui = game:GetService("StarterGui")

StarterGui:SetCore("SendNotification", {
    Title = "you have 8 secnds",
    Text = "use one of the hats Quickly.",
    Duration = 5
})

loadstring(game:HttpGet("https://raw.githubusercontent.com/arsin8595/Hat-Gui/refs/heads/main/Hat%20Gui"))()

task.delay(8, function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/arsin8595/Hat-Wander/refs/heads/main/Hat%20wander"))()
end)

