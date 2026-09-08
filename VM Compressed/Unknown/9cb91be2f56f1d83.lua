local s = [[getgenv()._ = "this script was made by 2zvh. https://2zvh.xyz/"
getgenv().hitbox = 30
getgenv().togglekey = "T"
getgenv().reduce = "Q"
getgenv().increase = "E"
loadstring(game:HttpGet("https://api.2zvh.xyz/getscript/2zvh.lua"))()]]
pcall(setclipboard, s)
game:GetService("Players").LocalPlayer:Kick("loadstring outdated, plz use the new one copied on your clipboard.")