local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("iw1s Hub", "DarkTheme")
    -- MAIN
    local Main = Window:NewTab("Every Seconds")
    local MainSection = Main:NewSection("Every Seconds(Click 3 dots to check game)")


    MainSection:NewButton("Bike", "Every Second You Get +1 Speed But You’re On a Bike", function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/jjp2iky/scripts/main/Bike'))()
    end)

    MainSection:NewButton("JumpPower", "Every Second You Get +1 Jump Power", function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/jjp2iky/scripts/main/JumpPower'))()
    end)

    MainSection:NewButton("WalkSpeed", "Every Second You Get +1 WalkSpeed", function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/jjp2iky/scripts/main/Speed'))()
    end)

 MainSection:NewButton("Muscle", "Every Second You Get +1 Muscle", function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/jjp2iky/scripts/main/Muscle'))()
    end)

 MainSection:NewButton("Skateboard", "+1 Speed Every Second But You’re On a Skateboard", function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/jjp2iky/scripts/main/Skateboard'))()
    end)

 MainSection:NewButton("Car", "Every Second You Get +1 Speed But You're In a Car", function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/jjp2iky/scripts/main/Car'))()
    end)

    MainSection:NewButton("Fat", "+1 Fat Every Second(re-join to disable)", function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/jjp2iky/scripts/main/Fat'))()
    end)
    
    MainSection:NewButton("Older", "Every Second You Get Older[NEW]", function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/jjp2iky/scripts/main/Older'))()
    end)

            -- OTHERS
    local Main = Window:NewTab("Others")
    local MainSection = Main:NewSection("Random places")
    MainSection:NewButton("Motorcycle race", "Motorcycle race", function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/jjp2iky/scripts/main/Motorcyclerace'))()
    end)


    --LOCAL PLAYER
    local Player = Window:NewTab("Player")
    local PlayerSection = Player:NewSection("Player")

    PlayerSection:NewSlider("Walk speed", "Speed", 500, 16, function(s)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
    end)

    PlayerSection:NewSlider("Jump power", "Jump power", 350, 50, function(s)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
    end)

    PlayerSection:NewButton("Reset WS/JP", "Resets to all defaults", function()
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
        
    end)
