local Library = loadstring(game:HttpGet("https://pastebin.com/raw/vff1bQ9F"))()

local Window = Library.CreateLib("Bake Da Hub V2", "DarkTheme")

local Tab = Window:NewTab("All Roles")

local Section = Tab:NewSection("This is for All Roles.")

Section:NewLabel("Humanoid")

Section:NewButton("[Useful] Anti AFK", "Do not worry, you won't see that message again.", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/EkRTvJC4"))()
end)

Section:NewButton("Infinite Jump", "Jump infinitely", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/2aW8brnC"))()
end)

Section:NewLabel("Humanoid GUIs")

Section:NewButton("[OP] Noclip GUI", "Noclip Toggle UI", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/6T4skKuj"))() 
end)

Section:NewButton("[OP] Fly GUI V3", "Fly Toggle UI, V3", function()
loadstring(game:HttpGet("https://pastebin.com/raw/bHa6HDFc"))() 
end)

Section:NewLabel("ESP")

Section:NewButton("Infinite Yield (esp)", "read the name", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/Kd0QvwWL"))()
end)

Section:NewLabel("Use Infinite Yield Delta Mobile if you're using Delta.")

Section:NewButton("Highlight ESP", "read the name", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/CgMSR663"))()
end)

local Tab = Window:NewTab("Chefs")

local Section = Tab:NewSection("This is for the Chefs.")

Section:NewButton("Speed 32", "Makes your speed to 32", function()
loadstring(game:HttpGet("https://pastebin.com/raw/Fgcns0St"))()
end)

Section:NewSlider("Walkspeed", "Changes how fast you walk", 250, 16, function(s) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
    end)

local Tab = Window:NewTab("Babies")

local Section = Tab:NewSection("This is for the Babies.")

Section:NewButton("[OP] Hipheight 20", "this is OP VERY MUCHHHH", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/s7Cx3aCU"))()
end)

Section:NewButton("[Useful] Get back on ground", "maybe op.. ¯\_(ツ)_/¯", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/Q5tr0AuT"))()
end)

Section:NewButton("Float GUI", "wow arceuz xe!!!", function()
    loadstring(game:HttpGet('https://pastebin.com/raw/K9aw4neF'))()
end)

Section:NewButton("Infinite Yield (tpwalk 1-5)", "read the name", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

Section:NewLabel("Use Infinite Yield Delta Mobile if you're using Delta.")

local Tab = Window:NewTab("Other Hubs")

local Section = Tab:NewSection("This is for Other Hubs.")

Section:NewButton("[OP] JN HH Gaming's Bake da baby script", "this is OP VERY MUCHHHH", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/ydc2Xa6W"))()
end)

game.StarterGui:SetCore("SendNotification",  {
 Title = "Loaded!";
 Text = "Thanks for using our script! We hope you enjoy!";
 Icon = "";
 Duration = 3;
})

game.StarterGui:SetCore("SendNotification",  {
 Title = "Credits";
 Text = "Credits to itstimmy1382 for doing all this (grilyt in youtube)";
 Icon = "";
 Duration = 10;
})

game.StarterGui:SetCore("SendNotification",  {
 Title = "Hey!";
 Text = "If you wanna submit a script, DM itstimmy1382 on discord.";
 Icon = "";
 Duration = 10;
})