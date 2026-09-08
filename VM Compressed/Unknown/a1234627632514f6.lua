local module = {}
 
function module.DisableAC()
 
 game.Players.LocalPlayer:Kick("xonae patched this, come back later when its fixed.")
 
--███████╗████████╗ ██████╗ ██████╗ ███╗   ███╗██╗    ██╗██╗  ██╗ █████╗  ██████╗██╗  ██╗███████╗██████╗ 
--██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗████╗ ████║██║    ██║██║  ██║██╔══██╗██╔════╝██║ ██╔╝██╔════╝██╔══██╗
--███████╗   ██║   ██║   ██║██████╔╝██╔████╔██║██║ █╗ ██║███████║███████║██║     █████╔╝ █████╗  ██████╔╝
--╚════██║   ██║   ██║   ██║██╔══██╗██║╚██╔╝██║██║███╗██║██╔══██║██╔══██║██║     ██╔═██╗ ██╔══╝  ██╔══██╗
--███████║   ██║   ╚██████╔╝██║  ██║██║ ╚═╝ ██║╚███╔███╔╝██║  ██║██║  ██║╚██████╗██║  ██╗███████╗██║  ██║
--╚══════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝ ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
 
 
local player = game.Players.LocalPlayer
local storage = game.ReplicatedStorage
local dirtyRemotes = { "hmm", "Whizz", "Kick", "ApplyVel", "YouGotXP", "Flames", "ReplicateGear", "GetMapVote", "Vote", "DoVotekick", "TCtullysBigStinkyEvent2", "TCtullysBigStinkyEvent", "MoreFreeBadgesEnjoy", "COMMAND", "Fire", "BurnMe", "ForceTeam", "SCP", "Glitch", "ThrowBall"}
 
-- Deleting most bindable events.
-- this sure was a client sided fuckery
 
-- These events only ban, we don't need them.
for _, v in pairs(storage:GetChildren()) do
    if v:IsA("RemoteEvent") or v:IsA("BindableEvent") then
        v:Destroy()    
    end
end
 
-- We don't need them aswell. Some of them tho.
for _, v in pairs(storage.Modules:GetChildren()) do
    if v.Name == "ping" or v.Name == "Sound" or v.Name == "Teams" or v.Name == "Projectiles" or v.Name == "Xp" or v.Name == "ClientFunctions" or v.Name == "Spread" then
        continue
    end
    v:Destroy()
end
 
for _, v in pairs(storage.SCRIPT:GetChildren()) do
    v:Destroy()
end
 
for _, v in pairs(storage.Functions:GetChildren()) do
    if v.Name == "Ping" or v.Name == "ClientFunctions" then
        continue
    end
    v:Destroy()
end
 
 
for _, v in pairs(storage.Events:GetChildren()) do
    if v:IsA("RemoteFunction") or v:IsA("BindableEvent") then
        if v.Name == "GetPing" or v.Name == "GetInventory" or v.Name == "AssetStreaming" or v.Name == "Redeem" or v.Name == "ClientFunctions" then
            continue
        end
        v:Destroy()
    end
 
 
end
 
for _, v in pairs(dirtyRemotes) do
    storage.Events[v]:Destroy()
end
 
for _, v in pairs(storage:GetChildren()) do
    if v:IsA("ModuleScript") then
        if v.Name == "KillEffects" or v.Name == "Xp" or v.Name == "ClientFunctions" then
            continue    
        end
        v:Destroy()
    end
end
 
for _, v in pairs(storage:GetChildren()) do
    if v:IsA("Script") then
        v:Destroy()
    end
end
 
for _, v in pairs(storage:GetChildren()) do
    if v:IsA("RemoteFunction") then
        v:Destroy()
    end
end
 
 
 
-- Packages clean up
 
game.CorePackages.Packages:Destroy()
 
end
 
-- Execute BoltsHub (bypassed one)
function module.ExecuteBH()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/Storm99999/AR-UtilsV2/main/src/assets/ac_disabled_bh.lua"))()
end
 
return module
