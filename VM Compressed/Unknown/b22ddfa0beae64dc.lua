local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/ZeianRussell/Kavo-UI-Library/main/Movable.source.lua"))()
local Window = Library.CreateLib("SuperHub (Made by bacone6000)", "GrapeTheme")

local Tab = Window:NewTab("Modded shop")
local Section = Tab:NewSection("Easter shop")

Section:NewButton("Easter shop ON", "cannot get candy blossom", function()
game:GetService("Players").LocalPlayer.PlayerGui.Easter_Shop.Enabled = true
    print("Clicked")
end)

Section:NewButton("Easter shop OFF", "cannot get candy blossom", function()
game:GetService("Players").LocalPlayer.PlayerGui.Easter_Shop.Enabled = false
    print("Clicked")
end)

local Section = Tab:NewSection("Night Shop")

Section:NewButton("Night Shop ON", "ButtonInfo", function()
game:GetService("Players").LocalPlayer.PlayerGui.NightEventShop_UI.Enabled = true
    print("Clicked")
end)

Section:NewButton("Night Shop OFF", "ButtonInfo", function()
game:GetService("Players").LocalPlayer.PlayerGui.NightEventShop_UI.Enabled = false
    print("Clicked")
end)

local Section = Tab:NewSection("Labubu Shop")

Section:NewButton("Labubu Shop ON", "cannot get labubus", function()
game:GetService("Players").LocalPlayer.PlayerGui._Labubu_Shop.Enabled = true
    print("Clicked")
end)

Section:NewButton("Labubu Shop OFF", "cannot get labubus", function()
game:GetService("Players").LocalPlayer.PlayerGui._Labubu_Shop.Enabled = false
    print("Clicked")
end)


