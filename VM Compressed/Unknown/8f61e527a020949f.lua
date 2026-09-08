local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local VirtualUser = game:GetService("VirtualUser")

local LP = Players.LocalPlayer

local PLACE_MAIN = 93249115521759
local PLACE_DESERT = 76471028557198

local function queueScript()
    local url = "https://raw.githubusercontent.com/N0ne-ExIStenc3/boblus-scriptz/refs/heads/main/sbtd-win"
    if syn and syn.queue_on_teleport then
        syn.queue_on_teleport('loadstring(game:HttpGet("'..url..'"))()')
    elseif queue_on_teleport then
        queue_on_teleport('loadstring(game:HttpGet("'..url..'"))()')
    end
end
queueScript()

LP.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

local function touchFinish()
    local obby = workspace:FindFirstChild("Obby")
    if not obby then return end
    local finish = obby:FindFirstChild("Finish")
    if not finish then return end
    local char = LP.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    firetouchinterest(hrp, finish, 0)
    task.wait()
    firetouchinterest(hrp, finish, 1)
end

local function teleport(id)
    if game.PlaceId ~= id then
        TeleportService:Teleport(id, LP)
    end
end

local function getSlaps()
    local ls = LP:FindFirstChild("leaderstats")
    if not ls then return 0 end
    local slaps = ls:FindFirstChild("Slaps")
    if not slaps then return 0 end
    return slaps.Value
end

local function waitForSlaps(n)
    while getSlaps() < n do
        RunService.Heartbeat:Wait()
    end
end

local POTATO_CF = CFrame.new(26.44, 157.94, 39.46)
local BULL_CF = CFrame.new(32.81, 158.00, 35.59)

local function farmDesert()
    local Functions = ReplicatedStorage:WaitForChild("Functions")

    local function getFries()
        local t = {}
        for _, v in ipairs(workspace.Towers:GetChildren()) do
            if v.Name == "Fries" then
                table.insert(t, v)
            end
        end
        return t
    end

    while #getFries() < 3 do
        local p = Functions.SpawnTower:InvokeServer("Potato", POTATO_CF)
        if p then
            waitForSlaps(1700)
            Functions.SpawnTower:InvokeServer("Fries", POTATO_CF, p)
        end
        task.wait(0.1)
    end

    local fries = getFries()

    waitForSlaps(15500)

    local function spawnBrickfort()
        local bull = Functions.SpawnTower:InvokeServer("Bull", BULL_CF)
        if bull then
            Functions.SpawnTower:InvokeServer("Brickfort", BULL_CF, bull)
        end
    end

    spawnBrickfort()

    for _, v in ipairs(fries) do
        pcall(function()
            Functions.SellTower:InvokeServer(v)
        end)
    end

    while task.wait(0.4) do
        if getSlaps() >= 15500 then
            spawnBrickfort()
        end
    end
end

local function equipPnB()
    local pg = LP:WaitForChild("PlayerGui", 5)
    if not pg then return end

    local shopGui = pg:WaitForChild("ShopGui", 5)
    if not shopGui then return end

    local inv = shopGui:WaitForChild("Inventory", 5)
    if not inv then return end

    if not inv:FindFirstChild("Bull") then
        ReplicatedStorage:WaitForChild("InteractItem"):InvokeServer("Bull")
    end

    if not inv:FindFirstChild("Potato") then
        ReplicatedStorage:WaitForChild("InteractItem"):InvokeServer("Potato")
    end
end

task.spawn(function()
    while task.wait(2) do
        local id = game.PlaceId

        if id == PLACE_DESERT then
            local pg = LP.PlayerGui
            if pg then
                local gg = pg:FindFirstChild("GameGui")
                if gg then
                    local exit = gg:FindFirstChild("Exit")
                    if exit and exit.Visible then
                        teleport(PLACE_MAIN)
                    end
                end
            end

        elseif id == PLACE_MAIN then
            touchFinish()
            equipPnB()
            task.wait(3)
            teleport(PLACE_DESERT)

            task.delay(120, function()
                if game.PlaceId == PLACE_MAIN then
                    teleport(PLACE_DESERT)
                end
            end)
        end
    end
end)

if game.PlaceId == PLACE_DESERT then
    farmDesert()
end
