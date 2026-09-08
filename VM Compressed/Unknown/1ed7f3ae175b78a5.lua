local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("OP SCRIPT (Shopping Drift at Driftmart)", "DarkTheme")
local Tab = Window:NewTab("Main")

local REQUIRED_PLACE_ID = 124794839740796
local REPLICATED_STORAGE = game:GetService("ReplicatedStorage")
local CURRENT_PLACE_ID = game.PlaceId
local TeleportService = game:GetService("TeleportService")
local GIVEAFK_EVENT = REPLICATED_STORAGE:FindFirstChild("giveAfk")

local PLAYERAFK_EVENT = REPLICATED_STORAGE:FindFirstChild("remoteEvents") and REPLICATED_STORAGE.remoteEvents:FindFirstChild("playerAFK")

local CAR_SPAWN_EVENT = REPLICATED_STORAGE:FindFirstChild("CarSpawnEvent")
local CAR_OPTIONS = {
    "CCTG",
    "CamaroWB",
    "CyberTruck",
    "DragSC",
    "DriftCart",
    "GTR34",
    "GTR36",
    "GroundForce",
    "KeiTruck",
    "LTME",
    "LawnMower",
    "Limo",
    "Miata",
    "Mk4",
    "Panda68",
    "Peely",
    "RaceSC",
    "ReavesDT",
    "S13",
    "SchoolBus",
    "SemiTruck",
    "Sunny",
    "TowTruck",
    "Ute",
    "Vorsche911"
}

local selectedCar = CAR_OPTIONS[1]

if CURRENT_PLACE_ID ~= REQUIRED_PLACE_ID then
    local TeleportSection = Tab:NewSection("Teleport Afk Zone (REQUIRED INF MONEY FIRST STEP)")
    local CarSpawnSection = Tab:NewSection("Car Spawner (No Money Required)")

    TeleportSection:NewButton("Afk Zone Teleporter", "Click to fire the 'playerAFK' event to reach the AFK game.", function()
        if PLAYERAFK_EVENT and PLAYERAFK_EVENT:IsA("RemoteEvent") then
            PLAYERAFK_EVENT:FireServer()
        else
            pcall(function()
                TeleportService:Teleport(REQUIRED_PLACE_ID)
            end)
        end
    end)

    CarSpawnSection:NewDropdown("Select Car", "Choose the car to spawn.", CAR_OPTIONS, function(currentOption)
        selectedCar = currentOption
    end)

    CarSpawnSection:NewButton("Spawn Selected Car", "Spawns the car currently selected in the dropdown.", function()
        if CAR_SPAWN_EVENT and CAR_SPAWN_EVENT:IsA("RemoteEvent") then
            CAR_SPAWN_EVENT:FireServer(selectedCar)
        end
    end)
else
    local PointsSection = Tab:NewSection("Infinite Points (SECOND STEP)")

    PointsSection:NewButton("Farm Points (More Clicks = More Money)", "Start Farm", function()
        if not GIVEAFK_EVENT or not GIVEAFK_EVENT:IsA("RemoteEvent") then
            return
        end
        
        spawn(function()
            while true do
                GIVEAFK_EVENT:FireServer()
                task.wait(0.00000000000000001) 
            end
        end)
    end)
end
