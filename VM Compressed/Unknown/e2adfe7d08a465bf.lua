if getgenv().OX1 then
    return
end

getgenv().OX1 = true
getgenv().SCRIPT_KEY = "KEYLESS"

if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("LoadingScreen") then
    repeat 
        wait(0.5)
    until not game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("LoadingScreen")
end

if tostring(game:GetService("Players").LocalPlayer.Team) == 'Neutral' then
    repeat
        wait(0.5)
    until not game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Main (minimal)") and tostring(game:GetService("Players").LocalPlayer.Team) == 'Neutral'
end

if workspace:GetAttribute('MAP'):find('Dungeons') then
    loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/1ffc681541fb29284e8bb1fe9819c9fcbd9550f63d6ed4133cbf718bbe9fef36/download"))()
else
    loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/1a767c2043c5faa3c80ab469820fcf649cb790f0067dec3adc688903b0792ad6/download"))() 
end