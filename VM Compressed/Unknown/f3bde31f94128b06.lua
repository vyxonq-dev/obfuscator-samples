pcall(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "♥️slom",
        Text = "Thanks for using my script!",
        Duration = 3
    })
end)

task.wait(3)

script_key = "trial"

loadstring(game:HttpGet("https://api.getpolsec.com/scripts/hosted/b6ffca2f9b98e8e3330fe785778a85706b7d56e152ac367f3be581e7424292f0.lua"))()
