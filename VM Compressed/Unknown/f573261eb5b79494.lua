-- For unloading prev instance
if getgenv().OrbFarmLoaded and getgenv().OrbFarmUnload then
    pcall(getgenv().OrbFarmUnload)
end

getgenv().OrbFarmLoaded = true

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "NLSPS | Geonix",
    LoadingTitle = "No-Limit Strongest Punch Simulator",
    LoadingSubtitle = "Auto Progression"
})

local MainTab = Window:CreateTab("Main", 4483362458)

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Player = Players.LocalPlayer
local RemoteEvent = ReplicatedStorage:WaitForChild("RemoteEvent")

local Running = false
local AutoUpgrade = false
local AutoNextWorld = false
local TargetWorld = 1

getgenv().OrbFarmUnload = function()
    Running = false
    AutoUpgrade = false

    pcall(function()
        Rayfield:Destroy()
    end)

    for _, v in ipairs(game:GetService("CoreGui"):GetChildren()) do
        if string.find(v.Name:lower(), "rayfield") then
            v:Destroy()
        end
    end

    getgenv().OrbFarmLoaded = nil
    getgenv().OrbFarmUnload = nil
end

local function GetCurrentWorld()
    return Player.leaderstats.WORLD.Value
end

local function GetHRP()
    local Character = Player.Character or Player.CharacterAdded:Wait()
    return Character:WaitForChild("HumanoidRootPart")
end

local function Warp(Direction)
    RemoteEvent:FireServer({
        "WarpPlrToOtherMap",
        Direction
    })
end

local function WaitForWorldChange(OldWorld, Timeout)
    local Start = tick()

    repeat
        task.wait()
    until GetCurrentWorld() ~= OldWorld
        or tick() - Start > Timeout

    return GetCurrentWorld() ~= OldWorld
end

--[[ 
-- unfinished

	local function TryGoToWorld(World)
    while Running and GetCurrentWorld() < World do
        Warp("Next")
        task.wait(0.1)
    end

    while Running and GetCurrentWorld() > World do
        Warp("Previous")
        task.wait(0.1)
    end

    return true
end

local function TryUnlockNextWorld()
    local Current = GetCurrentWorld()
    local NextWorld = Current + 1

    firesignal(RemoteEvent.OnClientEvent, {
        "UpdateMapCurrentlyIn",
        NextWorld
    })

    task.wait(0.1)

    RemoteEvent:FireServer({
        "WarpPlrToOtherMap",
        "Next"
    })

    task.wait(0.5)

    return GetCurrentWorld() ~= Current
end
--]]
local function CollectOrbsInWorld(World)
    local Boosts = workspace:WaitForChild("Map")
        :WaitForChild("Stages")
        :WaitForChild("Boosts")

    local StageFolder = Boosts:FindFirstChild(tostring(World))

    if not StageFolder then
        return
    end

    local HRP = GetHRP()

    for _, Model in ipairs(StageFolder:GetChildren()) do
        if not Running then
            return
        end

        for _, Orb in ipairs(Model:GetDescendants()) do
            if not Running then
                return
            end

            if Orb:IsA("BasePart") then
                HRP.CFrame = Orb.CFrame
                task.wait(0.15)
            end
        end
    end
end

local Worlds = {}

for i = 1, 30 do
    table.insert(Worlds, tostring(i))
end

MainTab:CreateDropdown({
    Name = "Target World",
    Options = Worlds,
    CurrentOption = {"1"},
    MultipleOptions = false,
    Flag = "TargetWorld",
    Callback = function(Option)
        TargetWorld = tonumber(Option[1])
    end
})
--[[
MainTab:CreateToggle({
    Name = "Auto Next World",
    CurrentValue = false,
    Flag = "AutoNextWorld",
    Callback = function(Value)
        AutoNextWorld = Value
    end
})
]] -- also unfinished
MainTab:CreateToggle({
    Name = "Orb Farm",
    CurrentValue = false,
    Flag = "OrbFarm",
    Callback = function(Value)
        Running = Value

        if Value then
            task.spawn(function()

                local LastWorldAttempt = 0

                while Running do

                    local AccessibleWorld = GetCurrentWorld()

                    if AutoNextWorld then

                        if tick() - LastWorldAttempt > 3 then
                            LastWorldAttempt = tick()

                            pcall(function()
                                if TryUnlockNextWorld() then

                                    local NewWorld = GetCurrentWorld()

                                    Rayfield:Notify({
                                        Title = "World Unlocked",
                                        Content = "Reached World "..NewWorld,
                                        Duration = 3
                                    })

                                    AccessibleWorld = NewWorld
                                end
                            end)
                        end

                        AccessibleWorld = GetCurrentWorld()

                    else

                        if AccessibleWorld ~= TargetWorld then
                            local Success = TryGoToWorld(TargetWorld)

                            if Success then
                                AccessibleWorld = TargetWorld
                            else
                                AccessibleWorld = GetCurrentWorld()
                            end
                        end
                    end

                    CollectOrbsInWorld(AccessibleWorld)

                    task.wait(0.05)
                end
            end)
        end
    end
})

MainTab:CreateToggle({
    Name = "Auto Upgrade Pet",
    CurrentValue = false,
    Flag = "AutoUpgradePet",
    Callback = function(Value)
        AutoUpgrade = Value

        if Value then
            task.spawn(function()
                while AutoUpgrade do
                    pcall(function()
                        RemoteEvent:FireServer({
                            "UpgradeCurrentPet"
                        })
                    end)

                    task.wait(0.1)
                end
            end)
        end
    end
})

MainTab:CreateButton({
    Name = "Unload Script",
    Callback = function()
        getgenv().OrbFarmUnload()
    end
})

Rayfield:Notify({
    Title = "Loaded",
    Content = "Select a target world and start farming.",
    Duration = 5
})
