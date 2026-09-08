if game.PlaceId == 1215581239 then
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

    local Window = Library.CreateLib("Doomspire Brickbattle", "Synapse")

    local welcomeTab = Window:NewTab("Welcome")
    
    local LPTab = Window:NewTab("LocalPlayer")

    local TeleportTab = Window:NewTab("Teleports")

    -- Vars --
    local lplr = game:GetService("Players").LocalPlayer
    local Camera = game.Workspace.Camera
    local CurrentCamera = game.Workspace.CurrentCamera

    -- Welcome Stuff --
    local wcsec = welcomeTab:NewSection("Howdy")
    wcsec:NewLabel("Update 1.1 - Changed UI Theme")
    
    -- LP Sections --
    local lpsec = LPTab:NewSection("Player")

    -- Telport Sections -- 
    local TPSec = TeleportTab:NewSection("Teleport lol")

    lpsec:NewSlider("Walkspeed", "You go fast", 150, 16, function(wsvalue)
        lplr.Character.Humanoid.WalkSpeed = wsvalue
    end)
    
    lpsec:NewSlider("JumpPower", "You jump high", 150, 50, function(jpvalue)
        lplr.Character.Humanoid.JumpPower = jpvalue
    end)

    lpsec:NewSlider("Gravity", "U on da moon", 196, 5, function(gvalue)
        game.Workspace.Gravity = gvalue
    end)

    TPSec:NewButton("Blue Team", "Teleports to Blue Tower", function()
        lplr.Character.HumanoidRootPart.CFrame = CFrame.new(-0.00300598, 26, 131)
    end)

    TPSec:NewButton("Yellow Team", "Teleports to Yello Tower", function()
        lplr.Character.HumanoidRootPart.CFrame = CFrame.new(130.996, 26, -0.000212)
    end)
    
    TPSec:NewButton("Red Team", "Teleports to Red Tower", function()
        lplr.Character.HumanoidRootPart.CFrame = CFrame.new(-131.003, 26, -0.00012)
    end)

    TPSec:NewButton("Green Team", "Teleports to Green Tower", function()
        lplr.Character.HumanoidRootPart.CFrame = CFrame.new(-0.00388336, 26, -131)
    end)
else
    game:GetService("Players").LocalPlayer:Kick("\n\nBro...\n\n This isn't Doomspire Brickbattle.\n\n This script won't work here lmfao.\n")
end
