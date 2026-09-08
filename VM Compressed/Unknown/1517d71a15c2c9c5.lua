local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("SIRENWARE", "DarkTheme")

local MainTab = Window:NewTab("Main")

local MainSection = MainTab:NewSection("Bedwars Scripts")

MainSection:NewButton("GOLDEN", "Voidware", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VWRewrite/main/NewMainScript.lua", true))()
end)

MainSection:NewButton("THUNDER", "VOIDWARE", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VWRewrite/main/NewMainScript.lua", true))()
end)

MainSection:NewButton("Packet Edition", "voidware", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VWPacket/main/NewMainScript.lua", true))()
end)

MainSection:NewButton("Old Edition", "voidware", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/vapevoidware/main/NewMainScript.lua", true))()
end)

MainSection:NewLabel("more scripts coming soon")