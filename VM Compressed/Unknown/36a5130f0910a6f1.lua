if game.Players.LocalPlayer.Character["Humanoid"].RigType == Enum.HumanoidRigType.R15 and game.PlaceId == 123974602339071 then
    game:GetService("TextChatService")["TextChannels"]["RBXGeneral"]:SendAsync("-r6")
    task.wait(.5)
end
local pillasec = 0.000001
local textty = true

local target = [[insaneclown7771]]

local Global = (getgenv and getgenv()) or shared
loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekHub/main/src/packages/FunctionPack.lua"))()
Global.GelatekHubConfig = {["Permanent Death"] = true,["Torso Fling"] = false,["Bullet Enabled"] = false,["Enable Collisions"] = false,["Keep Hats On Head"] = true,["Headless On Perma"] = false,["Anti Void"] = false,["Anti Void Offset"] = 75}

loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekHub/main/src/lib/Reanimate.lua"))()

task.wait(5)
game.Players.LocalPlayer.Character["Humanoid"].Health = 0

game.Players.LocalPlayer.Character["Humanoid"].EvaluateStateMachine = false
game.Players.LocalPlayer.Character["Humanoid"].RequiresNeck = false
game.Players.LocalPlayer.Character["Head"].Anchored = true
game.Players.LocalPlayer.Character["Torso"].Anchored = true
game.Players.LocalPlayer.Character["Left Arm"].Anchored = true
game.Players.LocalPlayer.Character["Right Arm"].Anchored = true
game.Players.LocalPlayer.Character["Left Leg"].Anchored = true
game.Players.LocalPlayer.Character["Right Leg"].Anchored = true
game.Players.LocalPlayer.Character["Head"].CanCollide = false
game.Players.LocalPlayer.Character["Torso"].CanCollide = false
game.Players.LocalPlayer.Character["Left Arm"].CanCollide = false
game.Players.LocalPlayer.Character["Right Arm"].CanCollide = false
game.Players.LocalPlayer.Character["Left Leg"].CanCollide = false
game.Players.LocalPlayer.Character["Right Leg"].CanCollide = false
game.Players.LocalPlayer.Character["Torso"]["Left Hip"]:Destroy()
game.Players.LocalPlayer.Character["Torso"]["Right Hip"]:Destroy()
game.Players.LocalPlayer.Character["Torso"]["Left Shoulder"]:Destroy()
game.Players.LocalPlayer.Character["Torso"]["Right Shoulder"]:Destroy()
game.Players.LocalPlayer.Character["Torso"]["Neck"]:Destroy()
task.wait(.1)
if textty then
game:GetService("TextChatService")["TextChannels"]["RBXGeneral"]:SendAsync("whatever i do is what everyone sees")
end
while task.wait(pillasec) do
    game.Players.LocalPlayer.Character["Head"].CFrame = game.Workspace[target]["Head"].CFrame
    game.Players.LocalPlayer.Character["Torso"].CFrame = game.Workspace[target]["Torso"].CFrame
    game.Players.LocalPlayer.Character["Left Arm"].CFrame = game.Workspace[target]["Left Arm"].CFrame
    game.Players.LocalPlayer.Character["Right Arm"].CFrame = game.Workspace[target]["Right Arm"].CFrame
    game.Players.LocalPlayer.Character["Left Leg"].CFrame = game.Workspace[target]["Left Leg"].CFrame
    game.Players.LocalPlayer.Character["Right Leg"].CFrame = game.Workspace[target]["Right Leg"].CFrame
end
