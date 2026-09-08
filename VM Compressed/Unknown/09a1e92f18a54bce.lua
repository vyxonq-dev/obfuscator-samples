local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Window = Library:NewWindow("Script")
 
local Tab = Window:NewSection("Credits: TGMANKASKE")

Tab:CreateToggle("Auto Finish", function(no)
_G.Getsd = no
while _G.Getsd== true do
    wait(2) 

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

local targetPart = workspace:WaitForChild("Mainbuild"):WaitForChild("Levels")
	:WaitForChild("Finish"):WaitForChild("FinishBeams"):WaitForChild("FINISHTEXT")

if not targetPart:IsA("BasePart") then
	warn("FINISHTEXT no is valid.")
	return
end


rootPart.CFrame = targetPart.CFrame + Vector3.new(0, 1, 0)
print("Teleportado para FINISHTEXT.")

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RemoteFunctions"):WaitForChild("GetWinRewards"):InvokeServer()

end
end)


Tab:CreateButton("Open RBX Egg", function()

local args = {
	"Summon4"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RemoteFunctions"):WaitForChild("OpenEgg"):InvokeServer(unpack(args))

end)

