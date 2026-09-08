local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()
Notification:Notify(
    {Title = "XERA OPTIMIZER:->", Description = "This Script Is Getting Optimized, this script was OBFUSCATED and the size of the script is 1 MB so this might take 10 seconds"},
    {OutlineColor = Color3.fromRGB(153, 255, 255), Time = 10, Type = "default"}
)
wait(10)
game.StarterGui:SetCore("SendNotification", {
    Title = "Xera Script Optimized",
    Text = "The Script Is Huge. The size is 1 MB so wait 5 more seconds until we finalize the script for you",
    Duration = 5,
})

wait(5)

loadstring(game:HttpGet("https://raw.githubusercontent.com/luascriptsROBLOX/BladeBallXera/refs/heads/main/obfuscated.lua.txt"))()
