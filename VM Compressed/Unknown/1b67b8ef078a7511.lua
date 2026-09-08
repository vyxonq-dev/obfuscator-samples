local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
    if humanoid.RigType == Enum.HumanoidRigType.R15 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ocfi/aqua-r15/refs/heads/main/source%20open"))();
    else
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ocfi/r6-aqua/refs/heads/main/source%20open"))();
end
