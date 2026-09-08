local Library = loadstring(game:HttpGet("https://pastebin.com/raw/vff1bQ9F"))()

local Window = Library.CreateLib("Murder VS Exploiters V3 (Bake Da Hub V3)", "DarkTheme")

local Tab = Window:NewTab("All Roles")

local Section = Tab:NewSection("This is for All Roles.")

Section:NewLabel("Humanoid")

Section:NewButton("[Useful] Anti AFK", "Do not worry, you won't see that message again.", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/EkRTvJC4"))()
end)

Section:NewButton("[Useful] Infinite Jump", "Jump infinitely", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/2aW8brnC"))()
end)

Section:NewLabel("Humanoid GUIs")

Section:NewButton("[OP] Noclip GUI", "Noclip Toggle UI", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/6T4skKuj"))() 
end)

Section:NewButton("[OP] Swim GUI", "Noclip Toggle UI", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/9CK0qSgn"))() 
end)

Section:NewButton("[OP] Fly GUI V3", "Fly Toggle UI, V3", function()
loadstring(game:HttpGet("https://pastebin.com/raw/bHa6HDFc"))() 
end)

Section:NewLabel("ESP")

Section:NewButton("Stacked Scripts of ESP", "read the name", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/V8hD7SHB"))()
end)

Section:NewButton("OwlHub (tracers)", "Makes you see where they at 😛😛😎", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))();
end)

Section:NewButton("Highlight ESP", "read the name", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/CgMSR663"))()
end)

local Tab = Window:NewTab("Chefs/Moms")

local Section = Tab:NewSection("This is for the Chefs/Moms.")

Section:NewButton("[OP] Low Gravity", "now we fall shortly", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Infinite-Jump-alternative-1236"))()
end)

Section:NewButton("Speed 32", "Makes your speed to 32", function()
loadstring(game:HttpGet("https://pastebin.com/raw/Fgcns0St"))()
end)

Section:NewSlider("Walkspeed", "Changes how fast you walk", 250, 16, function(s) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
    end)

local Tab = Window:NewTab("Babies")

local Section = Tab:NewSection("This is for the babies.")

Section:NewDropdown("tpwalk (don't spam or you will be fast)", "yoo finally instead of inf yield", {"0.1", "0.2", "0.3"}, function(currentOption)
    function isNumber(str)
  if tonumber(str) ~= nil or str == 'inf' then
    return true
  end
end
local tspeed = (currentOption)
local hb = game:GetService("RunService").Heartbeat
local tpwalking = true
local player = game:GetService("Players")
local lplr = player.LocalPlayer
local chr = lplr.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
while tpwalking and hb:Wait() and chr and hum and hum.Parent do
  if hum.MoveDirection.Magnitude > 0 then
    if tspeed and isNumber(tspeed) then
      chr:TranslateBy(hum.MoveDirection * tonumber(tspeed))
    else
      chr:TranslateBy(hum.MoveDirection)
    end
  end
end
end)

Section:NewDropdown("tpwalk 2 (don't spam or you will be fast)", "yoo finally instead of inf yield", {"0.4", "0.5", "youll be very fast if you click this"}, function(currentOption)
    function isNumber(str)
  if tonumber(str) ~= nil or str == 'inf' then
    return true
  end
end
local tspeed = (currentOption)
local hb = game:GetService("RunService").Heartbeat
local tpwalking = true
local player = game:GetService("Players")
local lplr = player.LocalPlayer
local chr = lplr.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
while tpwalking and hb:Wait() and chr and hum and hum.Parent do
  if hum.MoveDirection.Magnitude > 0 then
    if tspeed and isNumber(tspeed) then
      chr:TranslateBy(hum.MoveDirection * tonumber(tspeed))
    else
      chr:TranslateBy(hum.MoveDirection)
    end
  end
end
end)

Section:NewButton("[OP] Hipheight 20", "this is OP VERY MUCHHHH", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/s7Cx3aCU"))()
end)

Section:NewButton("[Useful] Get back on ground", "maybe op.. ¯\_(ツ)_/¯", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/Q5tr0AuT"))()
end)

Section:NewButton("Float GUI", "wow arceuz xe!!!", function()
    loadstring(game:HttpGet('https://pastebin.com/raw/K9aw4neF'))()
end)

local Tab = Window:NewTab("Other Hubs")

local Section = Tab:NewSection("This is for Other Hubs.")

Section:NewButton("[OP] JN HH Gaming's Bake da baby script", "this is OP VERY MUCHHHH", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/ChvsKDa2"))()
end)

Section:NewButton("[OP] Tiger Hub V2", "this is OP VERY MUCHHHH", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/balintTheDevX/TigerX-V2/main/Back"))()
end)

Section:NewButton("[OP] Loop (hub)", "this is OP VERY MUCHHHH", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/legendary2130/Loop-gui-Version-1.0.0/main/source"))()
end)

local Tab = Window:NewTab("Tools")

local Section = Tab:NewSection("Any tools/tool hubs are here.")

Section:NewButton("[OP] JN HH Gaming's Tool Giver Hub", "this is OP VERY MUCHHHH", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/g7qQWgpj"))()
end)

local Tab = Window:NewTab("Codes")

local Section = Tab:NewSection("Lobby Map")

Section:NewButton("Copy code eyelash", "hello", function()
    setclipboard("eyelash")
end)

Section:NewButton("Copy code burgerz", "hello", function()
    setclipboard("burgerz")
end)

Section:NewButton("Copy code tiktokfans", "hello", function()
    setclipboard("tiktokfans")
end)

Section:NewButton("Copy code tokyo", "hello", function()
    setclipboard("tokyo")
end)

Section:NewLabel("Backrooms Map")

Section:NewButton("Copy code HELPME", "hello", function()
    setclipboard("HELPME")
end)

Section:NewButton("Copy code BEHINDYOU", "hello", function()
    setclipboard("BEHINDYOU")
end)

Section:NewButton("Copy code THISISNOTACODE", "hello", function()
    setclipboard("THISISNOTACODE")
end)

local Tab = Window:NewTab("Versions")

local Section = Tab:NewSection("Any version is here.")

Section:NewButton("Bake Da Hub V1", "version", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/HbuG85Bf"))()
end)

Section:NewButton("Bake Da Hub V2", "version", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/53StKwxF"))()
end)

local Tab = Window:NewTab("Socials")

local Section = Tab:NewSection("Our socials are here.")

Section:NewButton("Copy discord", "hello", function()
    setclipboard("https://discord.gg/emfcUCqfKa")
end)

Section:NewButton("Copy YouTube", "hello", function()
    setclipboard("https://youtube.com/@grilyt?si=kORHTjdNE4Lw-2aw")
end)

local Tab = Window:NewTab("Changelogs")

local Section = Tab:NewSection("V1: Release!")

Section:NewLabel("V2: Added OP Features and Other Hubs!")

Section:NewLabel("V3: Added 5 new tabs!")

game.StarterGui:SetCore("SendNotification",  {
 Title = "#savebakedahub";
 Text = "sayer80 and iann changed the name so we have changed it to Murder VS Exploiters because of the name.";
 Icon = "";
 Duration = 3;
})

game.StarterGui:SetCore("SendNotification",  {
 Title = "Hey!";
 Text = "If you wanna submit a script, DM itstimmy1382 on discord.";
 Icon = "";
 Duration = 10;
})