local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Pocket hub selector", "DarkTheme")
local Tab = Window:NewTab("Choose what version of pocket hub you want")
local Section = Tab:NewSection("Pocket hub lite V2")
Section:NewButton("Execute pocket hub V2", "This one is the only one that will take updates", function()
loadstring(game:HttpGet("https://pastebin.com/raw/dy37P20Z"))()
end)
Section:NewButton("Pocket hub lite v1(there ill be no updates to this pocket hub)", "Use pocket hub V2 insted", function()
   loadstring(game:HttpGet("https://pastebin.com/raw/dFDi2uKx"))()
end)