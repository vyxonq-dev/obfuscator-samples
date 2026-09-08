local RunService = game:GetService("RunService")
local Players    = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local Workspace  = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer

-- Game references
local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local CollectEvent = Remotes:WaitForChild("CollectEvent")
local PlaceEvent   = Remotes:WaitForChild("PlaceEvent")
local DropEvent    = Remotes:WaitForChild("DropEvent")
local PlayPlaceAnimation = ReplicatedStorage:WaitForChild("PlayPlaceAnimation")
local Dinosaurs = Workspace:WaitForChild("Dinosaurs")
local Collectables = Workspace:WaitForChild("Collectables")

local Config = ReplicatedStorage:WaitForChild("Config")
local Upgrades = require(Config:WaitForChild("Upgrades"))
local ClientData = require(ReplicatedStorage:WaitForChild("Modules"):WaitForChild("ClientData"))

-- Load Fluent UI Library
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- STATE shim: use live-reload's STATE if present, otherwise fall back to a
-- lightweight local implementation so the script also runs when pasted directly.
local STATE = STATE or (function()
    local connections = {}
    local cleanups = {}
    local alive = true
    local bound
    local s = {}

    function s.alive()
        return alive
    end

    function s.connect(signal, fn)
        local c = signal:Connect(fn)
        table.insert(connections, c)
        return c
    end

    function s.onCleanup(fn)
        table.insert(cleanups, fn)
        if not bound then
            bound = true
            pcall(function()
                game:BindToClose(function()
                    for _, f in ipairs(cleanups) do pcall(f) end
                    alive = false
                end)
            end)
        end
    end

    return s
end)()

-- State settings
local settings = {
    Highlight = true,
    AutoFarm  = false,
    PickupLimit = 4,
    WalkSpeed = 16,
    JumpPower = 50,
    Fly = false,
    FlySpeed = 50,
    Noclip = false,
}

local currentPart  = nil
local currentBox   = nil
local currentOrigT = nil
local farmThread   = nil

local function clearSlot()
    if currentPart then
        currentPart.Transparency = currentOrigT
        currentOrigT = nil
        currentPart  = nil
    end
    if currentBox then
        currentBox:Destroy()
        currentBox = nil
    end
end

local function applySlot(part)
    if currentPart == part then return end
    clearSlot()
    currentOrigT        = part.Transparency
    currentPart         = part
    part.Transparency   = 0
    local box = Instance.new("SelectionBox")
    box.Adornee             = part
    box.Color3              = Color3.fromRGB(0, 255, 120)
    box.SurfaceColor3       = Color3.fromRGB(0, 255, 120)
    box.SurfaceTransparency = 0.7
    box.LineThickness       = 0.03
    box.Parent              = Workspace
    currentBox              = box
end

local lastDino, lastPart

local function getRoot()
    local char = LocalPlayer.Character
    return char and char:FindFirstChild("HumanoidRootPart")
end

local function getHumanoid()
    local char = LocalPlayer.Character
    return char and char:FindFirstChildOfClass("Humanoid")
end

local function getAllHeldBones()
    local out = {}
    local char = LocalPlayer.Character
    local bp = LocalPlayer.Backpack
    if char then
        local tool = char:FindFirstChildOfClass("Tool")
        if tool and tool:GetAttribute("Part") ~= nil then
            table.insert(out, tool)
        end
    end
    if bp then
        for _, v in ipairs(bp:GetChildren()) do
            if v:IsA("Tool") and v:GetAttribute("Part") ~= nil then
                table.insert(out, v)
            end
        end
    end
    return out
end

local function getEquippedBoneTool()
    local char = LocalPlayer.Character
    if not char then return nil end
    local tool = char:FindFirstChildOfClass("Tool")
    if not tool then return nil end
    if tool:GetAttribute("Part") == nil then return nil end
    return tool
end

local function carryCapacity()
    local ok, data = pcall(function()
        return ClientData.Get()
    end)
    if not ok or not data or not data.Upgrades then
        return 4
    end
    local lvl = data.Upgrades.Carry or 0
    local cfg = Upgrades.Carry[lvl]
    return (cfg and cfg.Value) or 2
end

local function findSlot(dinoName, partName)
    local dino = Dinosaurs:FindFirstChild(dinoName)
    if not dino then return nil end
    for _, desc in ipairs(dino:GetDescendants()) do
        if desc:IsA("BasePart")
            and tostring(desc.Name) == tostring(partName)
            and not desc:GetAttribute("Placed")
        then
            return desc
        end
    end
    return nil
end

local function nearestCollectable()
    local root = getRoot()
    local best, bestDist
    for _, v in ipairs(Collectables:GetChildren()) do
        if v:IsA("BasePart") and v.Parent then
            local d = root and (root.Position - v.Position).Magnitude or 9e9
            if not best or d < bestDist then
                best, bestDist = v, d
            end
        end
    end
    return best, bestDist
end

local function goto(pos)
    local root = getRoot()
    if not root then return false end
    root.CFrame = CFrame.new(pos + Vector3.new(0, 2, 0))
    task.wait(0.05)
    return true
end

local function attemptCollect(target)
    pcall(function()
        CollectEvent:FireServer(target)
        PlayPlaceAnimation:Fire()
    end)
end

local function attemptPlace(slot)
    pcall(function()
        PlaceEvent:FireServer(slot)
        PlayPlaceAnimation:Fire()
    end)
end

local function attemptDrop(tool)
    pcall(function()
        DropEvent:FireServer(tool)
    end)
end

local function collectPhase()
    local limit = settings.PickupLimit
    local root = getRoot()
    if not root then return false end

    for _ = 1, limit do
        if not settings.AutoFarm then return false end
        local held = #getAllHeldBones()
        if held >= limit then break end

        local target = nearestCollectable()
        if not target then break end
        goto(target.Position)
        attemptCollect(target)
        task.wait(0.18)
    end
    return true
end

local function placePhase()
    local tries = 0
    while settings.AutoFarm and tries < 40 do
        tries = tries + 1
        local tool = getEquippedBoneTool()
        if not tool then break end

        local dinoName = tool:GetAttribute("Dinosaur")
        local partName = tostring(tool:GetAttribute("Part"))
        local slot = findSlot(dinoName, partName)
        if not slot then
            attemptDrop(tool)
            task.wait(0.15)
            continue
        end

        if settings.Highlight then applySlot(slot) end
        goto(slot.Position)
        attemptPlace(slot)
        task.wait(0.25)

        if slot:GetAttribute("Placed") == nil and getEquippedBoneTool() == tool then
            attemptDrop(tool)
            task.wait(0.15)
        end
    end
    clearSlot()
end

local function farmLoop()
    while STATE.alive() and settings.AutoFarm do
        local ok = pcall(function()
            collectPhase()
            placePhase()
        end)
        if not ok then
            task.wait(0.5)
        end
    end
    clearSlot()
end

local function stopFarm()
    if farmThread then
        task.cancel(farmThread)
        farmThread = nil
    end
end

local function startFarm()
    stopFarm()
    farmThread = task.spawn(farmLoop)
end

settings.PickupLimit = carryCapacity()

-- ============================================================
-- FLUENT WINDOW & TABS SETUP
-- ============================================================
local Window = Fluent:CreateWindow({
    Title = "Dino Bone Hub",
    SubTitle = "Fast Farm & Tools",
    TabWidth = 150,
    Size = UDim2.fromOffset(540, 380),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.RightShift
})

local Tabs = {
    Main = Window:AddTab({ Title = "Farm", Icon = "bone" }),
    Player = Window:AddTab({ Title = "Local Player", Icon = "user" })
}

local Options = Fluent.Options

-- Farm Tab Controls
local HighlightToggle = Tabs.Main:AddToggle("HighlightToggle", {
    Title = "Slot Highlight",
    Description = "Highlights placement slot for held bone",
    Default = true
})

HighlightToggle:OnChanged(function()
    settings.Highlight = Options.HighlightToggle.Value
    if not settings.Highlight then clearSlot() end
end)

local FarmToggle = Tabs.Main:AddToggle("FarmToggle", {
    Title = "Auto Farm (Fast)",
    Description = "Batch collects bones & places in skeletons",
    Default = false
})

FarmToggle:OnChanged(function()
    settings.AutoFarm = Options.FarmToggle.Value
    if settings.AutoFarm then
        startFarm()
    else
        stopFarm()
        clearSlot()
    end
end)

local LimitSlider = Tabs.Main:AddSlider("LimitSlider", {
    Title = "Pickup Limit",
    Description = "Auto-detected from Carry upgrade level",
    Default = math.clamp(carryCapacity(), 1, 50),
    Min = 1,
    Max = 50,
    Rounding = 0,
    Callback = function(Value)
        settings.PickupLimit = math.floor(Value)
    end
})

-- Auto-detect pickup limit (carry capacity) and sync the slider
local lastDetected = -1
task.spawn(function()
    while STATE.alive() do
        task.wait(2)
        local ok, cap = pcall(carryCapacity)
        if ok and cap ~= lastDetected then
            lastDetected = cap
            settings.PickupLimit = cap
            pcall(function()
                Options.LimitSlider:Set(cap)
            end)
        end
    end
end)

-- Player Tab Controls
local FlyToggle = Tabs.Player:AddToggle("FlyToggle", {
    Title = "Fly",
    Description = "WASD + Space/LeftShift to fly",
    Default = false
})

FlyToggle:OnChanged(function()
    settings.Fly = Options.FlyToggle.Value
end)

local FlySpeedSlider = Tabs.Player:AddSlider("FlySpeedSlider", {
    Title = "Fly Speed",
    Description = "Flight movement speed",
    Default = 50,
    Min = 5,
    Max = 300,
    Rounding = 0,
    Callback = function(Value)
        settings.FlySpeed = math.floor(Value)
    end
})

local NoclipToggle = Tabs.Player:AddToggle("NoclipToggle", {
    Title = "Noclip",
    Description = "Walk through walls",
    Default = false
})

NoclipToggle:OnChanged(function()
    settings.Noclip = Options.NoclipToggle.Value
end)

local SpeedSlider = Tabs.Player:AddSlider("SpeedSlider", {
    Title = "WalkSpeed",
    Description = "Player movement speed",
    Default = 16,
    Min = 16,
    Max = 200,
    Rounding = 0,
    Callback = function(Value)
        settings.WalkSpeed = math.floor(Value)
        local hum = getHumanoid()
        if hum then hum.WalkSpeed = settings.WalkSpeed end
    end
})

local JumpSlider = Tabs.Player:AddSlider("JumpSlider", {
    Title = "JumpPower",
    Description = "Player jump height",
    Default = 50,
    Min = 50,
    Max = 300,
    Rounding = 0,
    Callback = function(Value)
        settings.JumpPower = math.floor(Value)
        local hum = getHumanoid()
        if hum then hum.UseJumpPower = true hum.JumpPower = settings.JumpPower end
    end
})

Window:SelectTab(1)

-- ============================================================
-- SYSTEM CONNECTIONS
-- ============================================================

-- RenderStepped for Fly, Noclip, WalkSpeed, JumpPower
STATE.connect(RunService.RenderStepped, function(delta)
    local hum = getHumanoid()
    local root = getRoot()

    if hum then
        if hum.WalkSpeed ~= settings.WalkSpeed then
            hum.WalkSpeed = settings.WalkSpeed
        end
        if settings.JumpPower > 50 then
            hum.UseJumpPower = true
            hum.JumpPower = settings.JumpPower
        end
    end

    -- Fly logic
    if settings.Fly and root then
        root.Velocity = Vector3.zero
        local cam = Workspace.CurrentCamera
        local moveDir = Vector3.zero

        if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + cam.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - cam.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - cam.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + cam.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveDir = moveDir + Vector3.new(0, 1, 0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then moveDir = moveDir - Vector3.new(0, 1, 0) end

        if moveDir.Magnitude > 0 then
            moveDir = moveDir.Unit
            root.CFrame = root.CFrame + moveDir * settings.FlySpeed * delta
        end
    end
end)

-- Stepped for Noclip
STATE.connect(RunService.Stepped, function()
    if settings.Noclip and LocalPlayer.Character then
        for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide then
                part.CanCollide = false
            end
        end
    end
end)

-- Heartbeat Highlight Update
STATE.connect(RunService.Heartbeat, function()
    if not settings.Highlight then return end
    local tool = getEquippedBoneTool()
    if not tool then
        if lastDino ~= nil then
            clearSlot()
            lastDino = nil
            lastPart = nil
        end
        return
    end
    local dinoName = tool:GetAttribute("Dinosaur")
    local partName = tostring(tool:GetAttribute("Part"))
    if dinoName == lastDino and partName == lastPart then return end
    lastDino = dinoName
    lastPart = partName
    clearSlot()
    local slot = findSlot(dinoName, partName)
    if slot then applySlot(slot) end
end)

STATE.onCleanup(function()
    stopFarm()
    clearSlot()
    pcall(function() Fluent:Destroy() end)
end)