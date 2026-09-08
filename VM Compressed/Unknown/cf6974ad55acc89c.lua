
-- JunesRNGPrivateAutoFarm


wait(3)
print("loaded!")
queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/nbamwyd/Script/refs/heads/main/SkiddingDev/FIXEDJunesRNGAutoFarmYESSFINALLYDOG'))()")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
    LocalPlayer.CharacterAdded:Wait()
end

local Character = LocalPlayer.Character
local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")



local function Activator()
    if game.PlaceId == 17297111758 then
        print("Correct PlaceID, now activating script!")
        task.wait(0.7)

        local StartTimer = workspace.Map:FindFirstChild("StartTimer")
        local StopTimer = workspace.Map:FindFirstChild("Hitbox")

        if HumanoidRootPart and StartTimer and StopTimer then
            HumanoidRootPart.CFrame = StartTimer.CFrame
            task.wait(0.7)
            HumanoidRootPart.CFrame = StopTimer.CFrame
            print("Finished.. now the game manually teleporting back..")
        else
            warn("Error: Missing HumanoidRootPart, StartTimer, or StopTimer!")
        end
    end
end

if game.PlaceId == 16883974868 then
    print("Wrong PlaceID, now teleporting the player...")
    task.wait(1)
    
    local success, err = pcall(function()
        TeleportService:Teleport(17297111758, LocalPlayer)
    end)
    
    if not success then
        warn("Teleport failed:", err)
    end
else
    Activator()
end
