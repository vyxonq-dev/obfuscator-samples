-- // RAYFIELD LOADER
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Arthur Hub V2",
    LoadingTitle = "Carregando...",
    LoadingSubtitle = "By Arthur",
})

-- // VARIABLES
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local HRP
local ReachEnabled = false
local currentReach = 10
local circle
local TPWalkEnabled = false
local TPWalkSpeed = 4
local teleportLoop = false
local teleporting = false

local BallNames = { "MPS","TRS","TCS","TPS","PRS" }

-- // UPDATE HRP
task.spawn(function()
    while true do
        task.wait(1)
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            HRP = player.Character.HumanoidRootPart
        end
    end
end)

-- // REACH CIRCLE
local function updateCircle()
    if not circle then
        circle = Instance.new("Part")
        circle.Shape = Enum.PartType.Ball
        circle.Anchored = true
        circle.CanCollide = false
        circle.Material = Enum.Material.ForceField
        circle.Transparency = 0.75
        circle.Color = Color3.fromRGB(0,255,255)
        circle.Parent = Workspace
    end
    circle.Size = Vector3.new(currentReach*2,currentReach*2,currentReach*2)
end

RunService.RenderStepped:Connect(function()
    if circle and HRP then
        circle.Position = HRP.Position
        circle.Transparency = ReachEnabled and 0.75 or 1
    end
end)

-- // GET BALLS
local function getBalls()
    local list = {}
    for _,v in pairs(Workspace:GetDescendants()) do
        for _,b in ipairs(BallNames) do
            if v.Name == b and v:IsA("BasePart") then
                table.insert(list, v)
            end
        end
    end
    return list
end

-- // REAL QUANTUM REACH TOUCH
local function doReach()
    if not ReachEnabled or not player.Character then return end
    local rightLeg = player.Character:FindFirstChild("Right Leg") or player.Character:FindFirstChild("RightLowerLeg")
    if not rightLeg then return end

    local balls = getBalls()
    for _,ball in ipairs(balls) do
        if (ball.Position - HRP.Position).Magnitude < currentReach then
            for _,d in ipairs(rightLeg:GetDescendants()) do
                if d.Name == "TouchInterest" then
                    firetouchinterest(ball, d.Parent, 0)
                    firetouchinterest(ball, d.Parent, 1)
                end
            end
        end
    end
end

RunService.RenderStepped:Connect(doReach)

-- // TPWALK
RunService.RenderStepped:Connect(function()
    if TPWalkEnabled and player.Character and HRP then
        local move = player.Character:FindFirstChild("Humanoid").MoveDirection
        if move.Magnitude > 0 then
            HRP.CFrame = HRP.CFrame + move * TPWalkSpeed
        end
    end
end)

-- // MAIN TAB
local Main = Window:CreateTab("Main")

Main:CreateToggle({
    Name = "Loop Teleporte",
    CurrentValue = false,
    Callback = function(v)
        teleportLoop = v
        if v then
            task.spawn(function()
                while teleportLoop do
                    local balls = getBalls()
                    if #balls > 0 and HRP then
                        HRP.CFrame = balls[1].CFrame + Vector3.new(0,3,0)
                    end
                    task.wait(0.15)
                end
            end)
        end
    end
})

Main:CreateButton({
    Name = "Teleportar para a bola",
    Callback = function()
        local balls = getBalls()
        local nearest,dist
        for _,ball in ipairs(balls) do
            local d = (ball.Position - HRP.Position).Magnitude
            if not dist or d < dist then
                dist = d
                nearest = ball
            end
        end
        if nearest then
            HRP.CFrame = nearest.CFrame + Vector3.new(0,3,0)
        end
    end
})

-- // REACH TAB
local Reach = Window:CreateTab("Reach")

Reach:CreateToggle({
    Name = "Ativar Reach",
    CurrentValue = false,
    Callback = function(v)
        ReachEnabled = v
        updateCircle()
    end
})

Reach:CreateSlider({
    Name = "Reach",
    Range = {1,150},
    Increment = 1,
    CurrentValue = 10,
    Callback = function(v)
        currentReach = v
        updateCircle()
    end
})

-- // TPWALK TAB
local TP = Window:CreateTab("Speed")

TP:CreateInput({
    Name = "Velocidade",
    PlaceholderText = "4",
    Callback = function(v)
        local n = tonumber(v)
        if n then TPWalkSpeed = n end
    end
})

TP:CreateToggle({
    Name = "Ativar Speed",
    CurrentValue = false,
    Callback = function(v)
        TPWalkEnabled = v
    end
})