-- Script Dig to ECore by ENL:)

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Dig to the Core", "Ocean")

--Main

local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Give")

MainSection:NewButton("Give 500 Diamonds/Gems", "yes 500 ", function()
local args = {
	5
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SpinPrizeEvent"):FireServer(unpack(args))
end)

MainSection:NewButton("Give Cash", "Depends how strong your pickaxe is", function()
   local args = {
	"hello"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("DigEvent"):FireServer(unpack(args))
end)

MainSection:NewButton("Give triple Dominus pet", "50x multiplier", function()
   local args = {
	4
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SpinPrizeEvent"):FireServer(unpack(args))
end)

MainSection:NewButton("give 10x Money", "multiply your money buy 10x", function()
local args = {
	8
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SpinPrizeEvent"):FireServer(unpack(args))
end)

MainSection:NewButton("give 10 spins", "give u 10 spins fr", function()
local args = {
	10
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SpinPrizeEvent"):FireServer(unpack(args))
end)

local MainSection = Main:NewSection("Others")

MainSection:NewButton("Collect all treasure", "collects all treasure in the map", function()
   local player = game.Players.LocalPlayer
local hrp = player.Character and player.Character:WaitForChild("HumanoidRootPart")
local treasureModel = workspace:FindFirstChild("Treasure")

if treasureModel then
    for _, obj in pairs(treasureModel:GetDescendants()) do
        if obj:IsA("BasePart") then
            hrp.CFrame = CFrame.new(obj.Position + Vector3.new(0, 3, 0))
            wait(0.1)
            local prompt = obj:FindFirstChildOfClass("ProximityPrompt")
            if prompt then pcall(function() fireproximityprompt(prompt) end) end
            local click = obj:FindFirstChildOfClass("ClickDetector")
            if click then pcall(function() click:MouseClick() end) end
            print("Collected: " .. obj.Name)
        end
    end
    print("All treasures collected!")
else
    print("Treasure model not found!")
end
end)


-- Teleport

local Main = Window:NewTab("Teleport")
local MainSection = Main:NewSection("Teleport")

local MainSection = Main:NewSection("Worlds")

MainSection:NewButton("World 1", "tp to world 1", function()
   local player = game.Players.LocalPlayer
local hrp = player.Character and player.Character:WaitForChild("HumanoidRootPart")
local spawn = workspace.World1.Spawns.SpawnLocation
if spawn then
    hrp.CFrame = CFrame.new(spawn.Position + Vector3.new(0, 5, 0))
    print("teleported!")
else
    print("SpawnLocation not found!")
end
end)


MainSection:NewButton("World 2", "tp to world 2", function()
   local player = game.Players.LocalPlayer
local hrp = player.Character and player.Character:WaitForChild("HumanoidRootPart")
local spawn = workspace.World2.Spawns.SpawnLocation
if spawn then
    hrp.CFrame = CFrame.new(spawn.Position + Vector3.new(0, 5, 0))
    print("teleported!")
else
    print("SpawnLocation not found!")
end
end)


MainSection:NewButton("World 3", "tp to world 3", function()
   local player = game.Players.LocalPlayer
local hrp = player.Character and player.Character:WaitForChild("HumanoidRootPart")
local spawn = workspace.World3.Spawns.SpawnLocation
if spawn then
    hrp.CFrame = CFrame.new(spawn.Position + Vector3.new(0, 5, 0))
    print("teleported!")
else
    print("SpawnLocation not found!")
end
end)


MainSection:NewButton("World 4", "tp to world 4", function()
   local player = game.Players.LocalPlayer
local hrp = player.Character and player.Character:WaitForChild("HumanoidRootPart")
local spawn = workspace.World4.Spawns.SpawnLocation
if spawn then
    hrp.CFrame = CFrame.new(spawn.Position + Vector3.new(0, 5, 0))
    print("teleported!")
else
    print("SpawnLocation not found!")
end
end)

MainSection:NewButton("World 5", "tp to world 5", function()
   local player = game.Players.LocalPlayer
local hrp = player.Character and player.Character:WaitForChild("HumanoidRootPart")
local spawn = workspace.World5.Spawns.SpawnLocation
if spawn then
    hrp.CFrame = CFrame.new(spawn.Position + Vector3.new(0, 5, 0))
    print("teleported!")
else
    print("SpawnLocation not found!")
end
end)


MainSection:NewButton("World 6", "tp to world 6", function()
   local player = game.Players.LocalPlayer
local hrp = player.Character and player.Character:WaitForChild("HumanoidRootPart")
local spawn = workspace.World6.Spawns.SpawnLocation
if spawn then
    hrp.CFrame = CFrame.new(spawn.Position + Vector3.new(0, 5, 0))
    print("teleported!")
else
    print("SpawnLocation not found!")
end
end)


MainSection:NewButton("World 7", "tp to world 7", function()
   local player = game.Players.LocalPlayer
local hrp = player.Character and player.Character:WaitForChild("HumanoidRootPart")
local spawn = workspace.World7.Spawns.SpawnLocation
if spawn then
    hrp.CFrame = CFrame.new(spawn.Position + Vector3.new(0, 5, 0))
    print("teleported!")
else
    print("SpawnLocation not found!")
end
end)

MainSection:NewButton("World 8", "tp to world 8", function()
   local player = game.Players.LocalPlayer
local hrp = player.Character and player.Character:WaitForChild("HumanoidRootPart")
local spawn = workspace.World8.Spawns.SpawnLocation
if spawn then
    hrp.CFrame = CFrame.new(spawn.Position + Vector3.new(0, 5, 0))
    print("teleported!")
else
    print("SpawnLocation not found!")
end
end)


MainSection:NewButton("World 9", "tp to world 9", function()
   local player = game.Players.LocalPlayer
local hrp = player.Character and player.Character:WaitForChild("HumanoidRootPart")
local spawn = workspace.World9.Spawns.SpawnLocation
if spawn then
    hrp.CFrame = CFrame.new(spawn.Position + Vector3.new(0, 5, 0))
    print("teleported!")
else
    print("SpawnLocation not found!")
end
end)


MainSection:NewButton("World 10", "tp to world 10", function()
   local player = game.Players.LocalPlayer
local hrp = player.Character and player.Character:WaitForChild("HumanoidRootPart")
local spawn = workspace.World10.Spawns.SpawnLocation
if spawn then
    hrp.CFrame = CFrame.new(spawn.Position + Vector3.new(0, 5, 0))
    print("teleported!")
else
    print("SpawnLocation not found!")
end
end)

MainSection:NewButton("World 11", "tp to world 11", function()
   local player = game.Players.LocalPlayer
local hrp = player.Character and player.Character:WaitForChild("HumanoidRootPart")
local spawn = workspace.World11.Spawns.SpawnLocation
if spawn then
    hrp.CFrame = CFrame.new(spawn.Position + Vector3.new(0, 5, 0))
    print("teleported!")
else
    print("SpawnLocation not found!")
end
end)


MainSection:NewButton("World 12", "tp to world 12", function()
   local player = game.Players.LocalPlayer
local hrp = player.Character and player.Character:WaitForChild("HumanoidRootPart")
local spawn = workspace.World12.Spawns.SpawnLocation
if spawn then
    hrp.CFrame = CFrame.new(spawn.Position + Vector3.new(0, 5, 0))
    print("teleported!")
else
    print("SpawnLocation not found!")
end
end)


MainSection:NewButton("World 13", "tp to world 13", function()
   local player = game.Players.LocalPlayer
local hrp = player.Character and player.Character:WaitForChild("HumanoidRootPart")
local spawn = workspace.World13.Spawns.SpawnLocation
if spawn then
    hrp.CFrame = CFrame.new(spawn.Position + Vector3.new(0, 5, 0))
    print("teleported!")
else
    print("SpawnLocation not found!")
end
end)

MainSection:NewButton("World 14", "tp to world 14", function()
   local player = game.Players.LocalPlayer
local hrp = player.Character and player.Character:WaitForChild("HumanoidRootPart")
local spawn = workspace.World14.Spawns.SpawnLocation
if spawn then
    hrp.CFrame = CFrame.new(spawn.Position + Vector3.new(0, 5, 0))
    print("teleported!")
else
    print("SpawnLocation not found!")
end
end)


MainSection:NewButton("World 15", "tp to world 15", function()
   local player = game.Players.LocalPlayer
local hrp = player.Character and player.Character:WaitForChild("HumanoidRootPart")
local spawn = workspace.World15.Spawns.SpawnLocation
if spawn then
    hrp.CFrame = CFrame.new(spawn.Position + Vector3.new(0, 5, 0))
    print("teleported!")
else
    print("SpawnLocation not found!")
end
end)

--LOCAL PLAYER
local Player = Window:NewTab("Player")
local PlayerSection = Player:NewSection("Player")

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
local MainSection = Main:NewSection("Credits")

local MainSection = Main:NewSection("Ruben(ENL)")
local MainSection = Main:NewSection("https://discord.gg/D2rmsRszSU")