local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("SIRENWARE", "DarkTheme")

local MainTab = Window:NewTab("RIVALS scripts")
local MainSection = MainTab:NewSection("sirenware")

MainSection:NewButton("Z3US (KEYLESS)", "na", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/blackowl1231/Z3US/refs/heads/main/main.lua"))()
end)

MainSection:NewButton("RISE (KEYLESS)", "na", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ShadowBey01/SHWX-Team-Rise-Scripts/refs/heads/main/Games/Rise%20(Rivals).lua", true))() 
end)

MainSection:NewButton("Zeferus (NOT SURE)", "ButtonInfo", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/necode102/-loader-100/refs/heads/main/loader.lua"))()
end)

MainSection:NewButton("SOLUNA (Requires Key but OP)", "ButtonInfo", function()
    loadstring(game:HttpGet("https://soluna-script.vercel.app/main.lua",true))()
end)

MainSection:NewButton("OP SILENT AIM (Keyless)", "ButtonInfo", function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/VisioneducationOfLuaCoding/Ambrion/refs/heads/main/RivalsVersion3'),true))()
end)

MainSection:NewButton("KiciaHook (Requires Key)", "ButtonInfo", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/RIVALS-Kiciahook-OP-Silent-Aim-Kill-All-Unlock-All-Undetected-Best-39936"))()
end)