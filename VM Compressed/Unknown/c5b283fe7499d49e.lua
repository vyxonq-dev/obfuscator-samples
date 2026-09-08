-- Rayfield UI: Inf Ammo, OldTrees Cleaner, Smart Aimbot (2000 Stud Max) & Flight Altitude Slider for "Protect the house from monsters"
-- Executor: Delta (1.0.729.838)

-- Verwijder direct de folder "OldTrees" bij het laden van het script
pcall(function()
    local oldTrees = workspace:FindFirstChild("OldTrees")
    if oldTrees then
        oldTrees:Destroy()
    end
end)

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Protect the house from monsters",
    LoadingTitle = "Loading Script Hub...",
    LoadingSubtitle = "by Luaroblox_helper",
    ConfigurationSaving = {
        Enabled = false,
        FolderName = nil,
        FileName = "ProtectTheHouseHub"
    },
    KeySystem = false,
})

local Tab = Window:CreateTab("Main", "home")

-- 1. Inf Ammo Toggle
local infAmmoEnabled = false
Tab:CreateToggle({
    Name = "Inf Ammo",
    CurrentValue = false,
    Flag = "InfAmmoToggle",
    Callback = function(Value)
        infAmmoEnabled = Value
        if infAmmoEnabled then
            task.spawn(function()
                while infAmmoEnabled do
                    task.wait(0.5)
                    pcall(function()
                        for _, v in pairs(getgc(true)) do
                            if typeof(v) == "table" then
                                if rawget(v, "Mag") and rawget(v, "MaxAmmo") then
                                    v.Mag = math.huge
                                    v.MaxAmmo = math.huge
                                    v.Ammo = math.huge
                                end
                                if rawget(v, "Reloading") then
                                    v.Reloading = false
                                end
                            end
                        end
                    end)
                end
            end)
        end
    end,
})

-- Variabele voor de aimbot range (standaard op 200 studs gezet)
local aimbotRange = 200

-- 2. Range Slider (Max tot 2000 studs)
Tab:CreateSlider({
    Name = "Aimbot Max Range",
    Range = {10, 2000},
    Increment = 10,
    Suffix = " Studs",
    CurrentValue = 200,
    Flag = "AimbotRangeSlider",
    Callback = function(Value)
        aimbotRange = Value
    end,
})

-- 3. Smart Aimbot Toggle (Strictly Closest First + Wallcheck + Max 2000 Studs)
local aimbotEnabled = false
Tab:CreateToggle({
    Name = "Smart Zombie Aimbot",
    CurrentValue = false,
    Flag = "AimbotToggle",
    Callback = function(Value)
        aimbotEnabled = Value
        if aimbotEnabled then
            task.spawn(function()
                local camera = workspace.CurrentCamera
                local players = game:GetService("Players")
                local player = players.LocalPlayer
                
                while aimbotEnabled do
                    task.wait()
                    pcall(function()
                        local character = player.Character
                        local hrp = character and character:FindFirstChild("HumanoidRootPart")
                        local monstersFolder = workspace:FindFirstChild("Monsters")
                        
                        if hrp and monstersFolder then
                            local bestTarget = nil
                            local shortestDistance = math.huge
                            
                            for _, monster in ipairs(monstersFolder:GetChildren()) do
                                if monster.Name == "Zombie" then
                                    local hum = monster:FindFirstChildOfClass("Humanoid")
                                    local root = monster:FindFirstChild("HumanoidRootPart") or monster:FindFirstChild("Torso")
                                    
                                    if hum and hum.Health > 0 and root then
                                        local distance = (root.Position - hrp.Position).Magnitude
                                        
                                        if distance <= aimbotRange and distance < shortestDistance then
                                            local raycastParams = RaycastParams.new()
                                            raycastParams.FilterType = Enum.RaycastFilterType.Exclude
                                            raycastParams.FilterDescendantsInstances = {character, monster}
                                            raycastParams.IgnoreWater = true
                                            
                                            local direction = root.Position - camera.CFrame.Position
                                            local raycastResult = workspace:Raycast(camera.CFrame.Position, direction, raycastParams)
                                            
                                            if not raycastResult then
                                                shortestDistance = distance
                                                bestTarget = root
                                            end
                                        end
                                    end
                                end
                            end
                            
                            if bestTarget then
                                camera.CFrame = CFrame.new(camera.CFrame.Position, bestTarget.Position + Vector3.new(0, 1, 0))
                            end
                        end
                    end)
                end
            end)
        end
    end,
})

-- Variabele voor vlieghoogte (standaard op 0, max 300)
local flightHeight = 0

-- 4. Flight Altitude Slider (0 tot 300 studs)
Tab:CreateSlider({
    Name = "Flight Height",
    Range = {0, 300},
    Increment = 5,
    Suffix = " Studs",
    CurrentValue = 0,
    Flag = "FlightHeightSlider",
    Callback = function(Value)
        flightHeight = Value
    end,
})

-- 5. Flight Loop (Houdt de speler op de ingestelde hoogte in de lucht wanneer > 0)
task.spawn(function()
    local players = game:GetService("Players")
    local player = players.LocalPlayer
    
    while true do
        task.wait()
        pcall(function()
            if flightHeight > 0 then
                local character = player.Character
                local hrp = character and character:FindFirstChild("HumanoidRootPart")
                local humanoid = character and character:FindFirstChildOfClass("Humanoid")
                
                if hrp and humanoid then
                    -- Zet de Y-positie vast op de begane grond + de vlieghoogte
                    local currentPos = hrp.Position
                    -- We zoeken de vloerhoogte op of gebruiken de huidige X en Z met vaste Y op basis van start/grond
                    -- Om te zorgen dat je niet oneindighoog blijft stijgen als je de slider omhoog zet:
                    -- We vergrendelen de Y-as op een vaste hoogte of fixeren de physics met BodyVelocity / AssemblyLinearVelocity
                    hrp.AssemblyLinearVelocity = Vector3.new(hrp.AssemblyLinearVelocity.X, 0, hrp.AssemblyLinearVelocity.Z)
                    
                    -- Raycast naar beneden om de grond te vinden, of gebruik een vaste basisgrond als referentie
                    local raycastParams = RaycastParams.new()
                    raycastParams.FilterType = Enum.RaycastFilterType.Exclude
                    raycastParams.FilterDescendantsInstances = {character}
                    
                    local rayResult = workspace:Raycast(currentPos, Vector3.new(0, -500, 0), raycastParams)
                    local groundY = rayResult and rayResult.Position.Y or currentPos.Y
                    
                    hrp.CFrame = CFrame.new(currentPos.X, groundY + flightHeight, currentPos.Z) * (hrp.CFrame - hrp.CFrame.Position)
                end
            end
        end)
    end
end)

Rayfield:LoadConfiguration()
