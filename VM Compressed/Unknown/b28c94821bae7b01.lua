-- Made by: ruban#2077

-- Join his discord server: https://discord.gg/eG9m3vqz

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Clicky keyboard obby  ", "Ocean")


--MAIN
local Main = Window:NewTab("teleport")
local MainSection = Main:NewSection("Teleport")


MainSection:NewButton("end of obby", "You tp to the end of the obby", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-64.82041931152344, 565.4505615234375, 267.2362976074219)
end)

MainSection:NewButton("Group gear area", "inside the restristed group area only", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-58.65995788574219, 6.48317289352417, 71.34922790527344)
end)

MainSection:NewButton("start of obby", "you tp to the start of the obby", function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-108.47891998291016, 14.756181716918945, -43.631103515625)
end)

local MainSection = Main:NewSection("Troll parts")

MainSection:NewButton("troll part 1", "...", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-216.3108367919922, 85.75741577148438, -77.09741973876953)
end)
 
MainSection:NewButton("troll part 2", "...", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(49.593727111816406, 114.75228118896484, 85.64227294921875)
end)

MainSection:NewButton("troll part 3", "...", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-19.230478286743164, 307.2898254394531, 115.52384185791016)
end)

--LOCAL PLAYER
local Player = Window:NewTab("Player")
local PlayerSection = Player:NewSection("Player")

PlayerSection:NewSlider("speed power", "go to go fast", 500, 16, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

PlayerSection:NewSlider("jump power", "jumper", 350, 50, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

PlayerSection:NewToggle("slow", "ugh my my back hurts", function(state)
    if state then
        game.Players.localPlayer.Character.Humanoid.WalkSpeed = 9
        game.Players.localPlayer.Character.Humanoid.JumpPower = 35
    else
        game.Players.localPlayer.Character.Humanoid.WalkSpeed = 16
        game.Players.localPlayer.Character.Humanoid.JumpPower = 50
    end
end)

PlayerSection:NewButton("Infinite yeild", "op admin command", function()
   loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
end)

--Credits
local Main = Window:NewTab("Credits")
local MainSection = Main:NewSection("Ruben(ENL)")
local MainSection = Main:NewSection("https://discord.gg/D2rmsRszSU")