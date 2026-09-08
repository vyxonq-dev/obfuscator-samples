local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("coolcat hub", "DarkTheme")

--MAIN
local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Main")


MainSection:NewButton("Noclip", "Lets you walk on walls", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/geUZHr7B"))()
--press z to toggle it
end)

MainSection:NewToggle("Anti-Afk","Makes you not afk", function(state)
    if state then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/KazeOnTop/Rice-Anti-Afk/main/Wind", true))()

MainSection:NewButton("Infinite Yield", "Its like u have admins/FE admin commands", function()
    loadstring(game:HttpGet(('https://pastebin.com/raw/MjBzRjmT'),true))()
end)


-- LOCAL PLAYER
local Player = Window:NewTab("LocalPlayer")
local PlayerSection = Player:NewSection("Player")

PlayerSection:NewSlider("Speed", "Select ur speed", 40, 0, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

Section:NewSlider("Jump", "Select ur jump power", 60, 0, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)



--Other
local Other = Window:NewTab("Other")
local OtherSection = Other:NewSection("Other")

OtherSection:NewSlider("Chat Spoofer", "Speak like others", 60, 0, function(s)
    loadstring(game:HttpGet(('https://pastebin.com/raw/djBfk8Li'),true))() 
end)

therSection:NewSlider("Chat Spoofer", "Speak like others", 60, 0, function(s)
    loadstring(game:HttpGet(('https://pastebin.com/raw/djBfk8Li'),true))() 
end)