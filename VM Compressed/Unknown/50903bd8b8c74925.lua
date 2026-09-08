local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()

local w = library:CreateWindow("TUS") -- Creates the window

local b = w:CreateFolder("Bring") -- Creates the folder(U will put here your buttons,etc)

b:Label("Powerups",{
    TextSize = 25; -- Self Explaining
    TextColor = Color3.fromRGB(255,255,255); -- Self Explaining
    BgColor = Color3.fromRGB(69,69,69); -- Self Explaining
    
}) 

b:Button("Damage",function()
    local player = game.Players.LocalPlayer.Name
    for i,v in pairs(game:GetService("Workspace").Powerups.DamageBoost:GetChildren()) do
    if v:IsA("Part") and v.Name == "TouchPart" then
    v.CFrame = game:GetService("Workspace").Tanks[player .. " Tank"].Body.CFrame
    wait()
    end
    end
end)
b:Button("Reload",function()
    local player = game.Players.LocalPlayer.Name
    for i,v in pairs(game:GetService("Workspace").Powerups.ReloadBoost:GetChildren()) do
    if v:IsA("Part") and v.Name == "TouchPart" then
    v.CFrame = game:GetService("Workspace").Tanks[player .. " Tank"].Body.CFrame
    wait()
    end
    end
end)
b:Button("Speed",function()
    local player = game.Players.LocalPlayer.Name
    for i,v in pairs(game:GetService("Workspace").Powerups.SpeedBoost:GetChildren()) do
    if v:IsA("Part") and v.Name == "TouchPart" then
    v.CFrame = game:GetService("Workspace").Tanks[player .. " Tank"].Body.CFrame
    wait()
    end
    end
end)

--[[b:Toggle("Bring Coins/Gems",function(bool) --don't know how to make this work, it or keep enabled for 1 second then don't work(need to disable and enable again) or just do nothin
    _G.Tog = bool
    if _G.Tog then
        local player = game.Players.LocalPlayer.Name
        for i,v in pairs(game:GetService("Workspace").ClientCoinsGems:GetChildren()) do
        if v.Name == 'Gem' or v.Name == 'Coin' then
        v.CanCollide = false
        v.CFrame = game:GetService("Workspace").Tanks[player .. " Tank"].Body.CFrame
        wait()
        end
        end
    else
_G.Tog = false
end
end) --]]


b:Dropdown("Tanks",{"B.I.GShotgun", "TripleShotgun", "DaddyShot", "TripleShot", "DoubleShot", "DualMachine", "DualShotgun", "DualSpray", "MachineGun", "OctoTank", "PentaShot", "QuadMachine", "QuadTank", "RearGuard", "SeptaShot", "DoubleDaddy", "TwinGuard", "SprayShot", "StarShot", "TriShot", "TripleDaddy", "TripleMachine", "Shotgun"},true,function(mob) --true/false, replaces the current title "Dropdown" with the option that t
    tank = (mob)
end)
b:Button("Get Tank",function()
    local player = game.Players.LocalPlayer.Name
    game:GetService("ReplicatedStorage").SwitchToPlayer:FireServer()
    wait(.5)
    game.workspace[player].HumanoidRootPart.CFrame = game:GetService("Workspace").TanksDisplay[tank].Padlock.CFrame
    wait(.2)
    fireproximityprompt(game:GetService("Workspace").TanksDisplay[tank].EquipProximityPrompt)
end)

b:DestroyGui()
