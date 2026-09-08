--[[====================================================================
  GEF THE FINAL BITE - ULTIMATE EDITION (LUNA UI ONLY)
  All features combined: Base Building, ESP, Hitbox, Text Builder, Chain Builder
=====================================================================]]

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

--====================================================================--
--========================== GET REMOTE ==============================--
--====================================================================--
local remote, hrp, handle
local function updateRemote()
    local char = player.Character or player.CharacterAdded:Wait()
    hrp = char:WaitForChild("HumanoidRootPart")
    local hammer = char:WaitForChild("Hammer")
    remote = hammer:WaitForChild("BuildPlank")
    handle = hammer:WaitForChild("Handle")
end
updateRemote()
player.CharacterAdded:Connect(updateRemote)

--====================================================================--
--========================== LOAD LUNA UI ============================--
--====================================================================--
local Luna
local loadOk, err = pcall(function()
    Luna = loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/Nebula-Softworks/Luna-Interface-Suite/refs/heads/main/source.lua"
    ))()
end)

if not loadOk then
    StarterGui:SetCore("SendNotification",{
        Title = "LUNA LOAD ERROR",
        Text = "Could not download Luna UI. Error: " .. tostring(err),
        Duration = 12
    })
    error("Failed to load Luna UI: "..tostring(err))
end

--====================================================================--
--========================== LUNA WINDOW =============================--
--====================================================================--
local Window = Luna:CreateWindow({
    Name = "GEF THE FINAL BITE - ULTIMATE",
    Subtitle = "All-in-One Edition",
    LogoID = "4483362458",
    LoadingEnabled = true,
    LoadingTitle = "GEF ULTIMATE",
    LoadingSubtitle = "Loading all features...",
    KeySystem = false
})

Luna:Notification({
    Title = "ULTIMATE LOADED!",
    Content = "Base, ESP, Text, Chain & More!",
    Icon = "check",
    Duration = 8
})

local Tabs = {
    Main = Window:CreateTab({Name = "Main", Icon = "home", ImageSource = "Material"}),
    Builds = Window:CreateTab({Name = "Builds", Icon = "build", ImageSource = "Material"}),
    Special = Window:CreateTab({Name = "Special", Icon = "star", ImageSource = "Material"}),
    Chain = Window:CreateTab({Name = "Chain", Icon = "link", ImageSource = "Material"})
}

--====================================================================--
--========================== SETTINGS ================================--
--====================================================================--
local Settings = {
    MATCH_TEXT = "gef",
    SUPER_SIZE = Vector3.new(20,20,20),
    SUPER_TRANSPARENCY = 0.7,
    sphereRadius = 14,
    segments = 23,
    heightOffset = 5,
    tinyHitboxEnabled = false,
    espEnabled = true,
    domeRadius = 50,
    domeSegments = 80,
    domeTurbo = true,
    letterScale = 2,
    chainLinkLength = 100,
    chainFiring = false,
    chainCurrentEnd = nil
}

--====================================================================--
--========================== HELPERS =================================--
--====================================================================--
local function isGEF(name) 
    return string.find(string.lower(name), Settings.MATCH_TEXT, 1, true) 
end

local function getGEFModels()
    local models = {}
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("Model") and isGEF(obj.Name) then
            table.insert(models, obj)
        end
    end
    return models
end

local function fireBuild(p1, p2)
    local dist = (p1 - p2).Magnitude
    if dist <= 11 then
        remote:FireServer(p1, p2, nil, nil, Vector3.new(0,1,0))
    else
        local dir = (p2 - p1).Unit
        local steps = math.ceil(dist / 11)
        local stepLength = dist / steps
        for i = 0, steps - 1 do
            local segStart = p1 + dir * (i * stepLength)
            local segEnd = p1 + dir * ((i + 1) * stepLength)
            remote:FireServer(segStart, segEnd, nil, nil, Vector3.new(0,1,0))
        end
    end
end

--====================================================================--
--========================== ESP SYSTEM ==============================--
--====================================================================--
local espStore = {}

local function makeESP(m)
    if espStore[m] or not isGEF(m.Name) then return end
    local part = m.PrimaryPart or m:FindFirstChildWhichIsA("BasePart")
    if not part then return end
    
    local bb = Instance.new("BillboardGui", playerGui)
    bb.Size = UDim2.new(0, 120, 0, 24)
    bb.Adornee = part
    bb.AlwaysOnTop = true
    bb.StudsOffset = Vector3.new(0, 3, 0)
    
    local txt = Instance.new("TextLabel", bb)
    txt.Size = UDim2.new(1, 0, 1, 0)
    txt.BackgroundTransparency = 1
    txt.Text = m.Name
    txt.TextColor3 = Color3.new(1, 0.4, 0)
    txt.Font = Enum.Font.SourceSansBold
    txt.TextSize = 18
    
    local hl = Instance.new("Highlight", m)
    hl.FillColor = Color3.fromRGB(255, 0, 0)
    hl.FillTransparency = 0.7
    hl.OutlineColor = Color3.fromRGB(255, 0, 0)
    hl.OutlineTransparency = 0.7
    
    espStore[m] = {bb = bb, hl = hl}
end

local function removeESP(m)
    local d = espStore[m]
    if d then
        if d.bb then d.bb:Destroy() end
        if d.hl then d.hl:Destroy() end
        espStore[m] = nil
    end
end

local function refreshESP()
    for m in pairs(espStore) do removeESP(m) end
    if not Settings.espEnabled then return end
    for _, m in getGEFModels() do makeESP(m) end
end

for _, m in getGEFModels() do task.spawn(makeESP, m) end
Workspace.DescendantAdded:Connect(function(o) 
    if o:IsA("Model") then task.wait() makeESP(o) end 
end)

--====================================================================--
--========================== TRAP FUNCTIONS ==========================--
--====================================================================--
local function buildSphere(c)
    for i = 0, math.pi, math.pi / Settings.segments do
        for j = 0, math.pi * 2, math.pi / Settings.segments do
            local x = Settings.sphereRadius * math.sin(i) * math.cos(j)
            local y = Settings.sphereRadius * math.cos(i)
            local z = Settings.sphereRadius * math.sin(i) * math.sin(j)
            local o = c + Vector3.new(0, Settings.heightOffset, 0)
            local p1 = o + Vector3.new(x, y, z)
            local p2 = o + Vector3.new(x * 1.1, y * 1.1, z * 1.1)
            remote:FireServer(p1, p2, nil, nil, Vector3.new(0,1,0))
        end
    end
end

local function getTargets(playersOnly)
    local t = {}
    if playersOnly then
        for _, p in Players:GetPlayers() do
            if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                table.insert(t, p.Character.HumanoidRootPart.Position)
            end
        end
    else
        for _, m in getGEFModels() do
            local root = m:FindFirstChild("HumanoidRootPart") or m.PrimaryPart
            if root then table.insert(t, root.Position) end
        end
    end
    return t
end

--====================================================================--
--========================== MEGA BASE BUILDER =======================--
--====================================================================--
local function OneClickMegaBase()
    if not hrp then return end
    local origin = hrp.Position + Vector3.new(0, -3, 0)
    local forward = hrp.CFrame.LookVector
    local right = hrp.CFrame.RightVector
    local size = 60
    local height = 16
    
    local corners = {
        origin + right * (-size/2),
        origin + right * (size/2),
        origin + right * (size/2) + forward * size,
        origin + right * (-size/2) + forward * size
    }
    
    -- Build walls with door
    local function wall(a, b, h, door)
        for y = 0.5, h, 0.5 do
            if door and y <= 8 then
                local mid = (a + b) / 2
                local dir = (b - a).Unit
                local half = 2.5
                local l = mid - dir * half
                local r = mid + dir * half
                fireBuild(a + Vector3.new(0, y, 0), l + Vector3.new(0, y, 0))
                fireBuild(r + Vector3.new(0, y, 0), b + Vector3.new(0, y, 0))
            else
                fireBuild(a + Vector3.new(0, y, 0), b + Vector3.new(0, y, 0))
            end
        end
    end
    
    wall(corners[1], corners[2], height, true)
    wall(corners[2], corners[3], height, false)
    wall(corners[3], corners[4], height, false)
    wall(corners[4], corners[1], height, false)
    
    Luna:Notification({
        Title = "ULTRA BASE BUILT!",
        Content = "Mega fortress complete!",
        Duration = 6
    })
end

--====================================================================--
--========================== TEXT BUILDER ============================--
--====================================================================--
local ABC = {
    A = function(s) return {{Vector3.new(-3*s,0,0), Vector3.new(3*s,9*s,0)}, {Vector3.new(3*s,0,0), Vector3.new(-3*s,9*s,0)}, {Vector3.new(-1.5*s,4.5*s,0), Vector3.new(1.5*s,4.5*s,0)}} end,
    B = function(s) return {{Vector3.new(-3*s,0,0), Vector3.new(-3*s,9*s,0)}, {Vector3.new(-3*s,9*s,0), Vector3.new(0,9*s,0)}, {Vector3.new(0,9*s,0), Vector3.new(0,6*s,0)}, {Vector3.new(0,6*s,0), Vector3.new(-2*s,6*s,0)}, {Vector3.new(-2*s,6*s,0), Vector3.new(-2*s,3*s,0)}, {Vector3.new(-2*s,3*s,0), Vector3.new(0,3*s,0)}, {Vector3.new(0,3*s,0), Vector3.new(0,0,0)}, {Vector3.new(0,0,0), Vector3.new(-3*s,0,0)}} end,
    C = function(s) return {{Vector3.new(0,0,0), Vector3.new(0,9*s,0)}, {Vector3.new(0,9*s,0), Vector3.new(2*s,9*s,0)}, {Vector3.new(2*s,9*s,0), Vector3.new(2*s,7*s,0)}, {Vector3.new(2*s,7*s,0), Vector3.new(0,7*s,0)}} end,
    D = function(s) return {{Vector3.new(-3*s,0,0), Vector3.new(-3*s,9*s,0)}, {Vector3.new(-3*s,9*s,0), Vector3.new(0,9*s,0)}, {Vector3.new(0,9*s,0), Vector3.new(2*s,7*s,0)}, {Vector3.new(2*s,7*s,0), Vector3.new(2*s,2*s,0)}, {Vector3.new(2*s,2*s,0), Vector3.new(0,0,0)}, {Vector3.new(0,0,0), Vector3.new(-3*s,0,0)}} end,
    E = function(s) return {{Vector3.new(0,0,0), Vector3.new(0,9*s,0)}, {Vector3.new(0,9*s,0), Vector3.new(3*s,9*s,0)}, {Vector3.new(0,4.5*s,0), Vector3.new(2.5*s,4.5*s,0)}, {Vector3.new(0,0,0), Vector3.new(3*s,0,0)}} end,
    F = function(s) return {{Vector3.new(0,0,0), Vector3.new(0,9*s,0)}, {Vector3.new(0,9*s,0), Vector3.new(3*s,9*s,0)}, {Vector3.new(0,4.5*s,0), Vector3.new(2.5*s,4.5*s,0)}} end,
    G = function(s) return {{Vector3.new(2*s,0,0), Vector3.new(0,0,0)}, {Vector3.new(0,0,0), Vector3.new(0,9*s,0)}, {Vector3.new(0,9*s,0), Vector3.new(3*s,9*s,0)}, {Vector3.new(3*s,9*s,0), Vector3.new(3*s,3*s,0)}, {Vector3.new(3*s,3*s,0), Vector3.new(1.5*s,3*s,0)}} end,
    H = function(s) return {{Vector3.new(-2*s,0,0), Vector3.new(-2*s,9*s,0)}, {Vector3.new(2*s,0,0), Vector3.new(2*s,9*s,0)}, {Vector3.new(-2*s,4.5*s,0), Vector3.new(2*s,4.5*s,0)}} end,
    I = function(s) return {{Vector3.new(-1*s,0,0), Vector3.new(1*s,0,0)}, {Vector3.new(0,0,0), Vector3.new(0,9*s,0)}, {Vector3.new(-1*s,9*s,0), Vector3.new(1*s,9*s,0)}} end,
    J = function(s) return {{Vector3.new(-1*s,9*s,0), Vector3.new(1*s,9*s,0)}, {Vector3.new(0,9*s,0), Vector3.new(0,0,0)}, {Vector3.new(0,0,0), Vector3.new(-2*s,0,0)}, {Vector3.new(-2*s,0,0), Vector3.new(-2*s,2*s,0)}} end,
    K = function(s) return {{Vector3.new(-3*s,0,0), Vector3.new(-3*s,9*s,0)}, {Vector3.new(-3*s,4.5*s,0), Vector3.new(0,9*s,0)}, {Vector3.new(-3*s,4.5*s,0), Vector3.new(0,0,0)}} end,
    L = function(s) return {{Vector3.new(-3*s,9*s,0), Vector3.new(-3*s,0,0)}, {Vector3.new(-3*s,0,0), Vector3.new(0,0,0)}} end,
    M = function(s) return {{Vector3.new(-3*s,0,0), Vector3.new(-3*s,9*s,0)}, {Vector3.new(-3*s,9*s,0), Vector3.new(0,5*s,0)}, {Vector3.new(0,5*s,0), Vector3.new(3*s,9*s,0)}, {Vector3.new(3*s,9*s,0), Vector3.new(3*s,0,0)}} end,
    N = function(s) return {{Vector3.new(-3*s,0,0), Vector3.new(-3*s,9*s,0)}, {Vector3.new(-3*s,9*s,0), Vector3.new(3*s,0,0)}, {Vector3.new(3*s,0,0), Vector3.new(3*s,9*s,0)}} end,
    O = function(s) return {{Vector3.new(-2*s,0,0), Vector3.new(-2*s,9*s,0)}, {Vector3.new(-2*s,9*s,0), Vector3.new(2*s,9*s,0)}, {Vector3.new(2*s,9*s,0), Vector3.new(2*s,0,0)}, {Vector3.new(2*s,0,0), Vector3.new(-2*s,0,0)}} end,
    P = function(s) return {{Vector3.new(-3*s,0,0), Vector3.new(-3*s,9*s,0)}, {Vector3.new(-3*s,9*s,0), Vector3.new(0,9*s,0)}, {Vector3.new(0,9*s,0), Vector3.new(0,5*s,0)}, {Vector3.new(0,5*s,0), Vector3.new(-2*s,5*s,0)}, {Vector3.new(-2*s,5*s,0), Vector3.new(-2*s,0,0)}} end,
    Q = function(s) return {{Vector3.new(-2*s,0,0), Vector3.new(-2*s,9*s,0)}, {Vector3.new(-2*s,9*s,0), Vector3.new(2*s,9*s,0)}, {Vector3.new(2*s,9*s,0), Vector3.new(2*s,0,0)}, {Vector3.new(2*s,0,0), Vector3.new(-2*s,0,0)}, {Vector3.new(0,0,0), Vector3.new(2*s,-2*s,0)}} end,
    R = function(s) return {{Vector3.new(-3*s,0,0), Vector3.new(-3*s,9*s,0)}, {Vector3.new(-3*s,9*s,0), Vector3.new(0,9*s,0)}, {Vector3.new(0,9*s,0), Vector3.new(0,5*s,0)}, {Vector3.new(0,5*s,0), Vector3.new(-2*s,5*s,0)}, {Vector3.new(-2*s,5*s,0), Vector3.new(-2*s,0,0)}, {Vector3.new(-2*s,5*s,0), Vector3.new(0,0,0)}} end,
    S = function(s) return {{Vector3.new(2*s,9*s,0), Vector3.new(0,9*s,0)}, {Vector3.new(0,9*s,0), Vector3.new(0,5*s,0)}, {Vector3.new(0,5*s,0), Vector3.new(2*s,5*s,0)}, {Vector3.new(2*s,5*s,0), Vector3.new(2*s,0,0)}, {Vector3.new(2*s,0,0), Vector3.new(0,0,0)}} end,
    T = function(s) return {{Vector3.new(-3*s,9*s,0), Vector3.new(3*s,9*s,0)}, {Vector3.new(0,9*s,0), Vector3.new(0,0,0)}} end,
    U = function(s) return {{Vector3.new(-2*s,9*s,0), Vector3.new(-2*s,0,0)}, {Vector3.new(-2*s,0,0), Vector3.new(2*s,0,0)}, {Vector3.new(2*s,0,0), Vector3.new(2*s,9*s,0)}} end,
    V = function(s) return {{Vector3.new(-3*s,9*s,0), Vector3.new(0,0,0)}, {Vector3.new(3*s,9*s,0), Vector3.new(0,0,0)}} end,
    W = function(s) return {{Vector3.new(-3*s,9*s,0), Vector3.new(-1*s,0,0)}, {Vector3.new(-1*s,0,0), Vector3.new(0,4*s,0)}, {Vector3.new(0,4*s,0), Vector3.new(1*s,0,0)}, {Vector3.new(1*s,0,0), Vector3.new(3*s,9*s,0)}} end,
    X = function(s) return {{Vector3.new(-3*s,0,0), Vector3.new(3*s,9*s,0)}, {Vector3.new(3*s,0,0), Vector3.new(-3*s,9*s,0)}} end,
    Y = function(s) return {{Vector3.new(-3*s,9*s,0), Vector3.new(0,4*s,0)}, {Vector3.new(3*s,9*s,0), Vector3.new(0,4*s,0)}, {Vector3.new(0,4*s,0), Vector3.new(0,0,0)}} end,
    Z = function(s) return {{Vector3.new(-3*s,9*s,0), Vector3.new(3*s,9*s,0)}, {Vector3.new(3*s,9*s,0), Vector3.new(-3*s,0,0)}, {Vector3.new(-3*s,0,0), Vector3.new(3*s,0,0)}} end
}

local function buildLetter(p, letter, is3D, depth)
    local s = Settings.letterScale
    local func = ABC[letter:upper()]
    if not func then return end
    for _, line in ipairs(func(s)) do
        fireBuild(p + line[1], p + line[2])
        if is3D then
            local back_a = line[1] + Vector3.new(0,0,depth)
            local back_b = line[2] + Vector3.new(0,0,depth)
            fireBuild(p + back_a, p + back_b)
            fireBuild(p + line[1], p + back_a)
            fireBuild(p + line[2], p + back_b)
        end
    end
end

local function buildText(text, is3D)
    text = text:upper():gsub("%s+", "")
    if #text == 0 then return end
    local spacing = 8 * Settings.letterScale
    local pos = hrp.Position + hrp.CFrame.LookVector * 25
    local startPos = pos - hrp.CFrame.RightVector * ((#text - 1) * spacing / 2)
    for i = 1, #text do
        buildLetter(startPos + hrp.CFrame.RightVector * ((i-1) * spacing), text:sub(i,i), is3D, 5 * Settings.letterScale)
    end
    Luna:Notification({Title = "TEXT BUILT!", Content = text, Duration = 5})
end

--====================================================================--
--========================== HITBOX FUNCTIONS ========================--
--====================================================================--
local function enlargeHurtbox(m)
    local parts = {}
    for _, d in m:GetDescendants() do
        if d.Name == "Hurtbox" and d:IsA("BasePart") then 
            table.insert(parts, d) 
        end
    end
    if #parts == 0 then
        local b = m:FindFirstChild("HumanoidRootPart") or m.PrimaryPart
        if b then table.insert(parts, b) end
    end
    for _, p in parts do
        p.CanCollide = true
        p.Massless = true
        p.Size = Settings.SUPER_SIZE
        p.Transparency = Settings.SUPER_TRANSPARENCY
    end
end

local function extendHitboxes()
    for _, m in getGEFModels() do enlargeHurtbox(m) end
end

local function createTinyHitbox(m)
    if not isGEF(m.Name) then return end
    local hb = m:FindFirstChild("TinyHitBox") or Instance.new("Part", m)
    hb.Name = "TinyHitBox"
    hb.Anchored = true
    hb.CanCollide = false
    hb.Transparency = 1
    hb.Size = Vector3.new(.1, .1, .1)
    local root = m.PrimaryPart or m:FindFirstChildWhichIsA("BasePart")
    if root then hb.CFrame = root.CFrame end
end

local function updateTinyHitboxes()
    for _, m in getGEFModels() do
        if Settings.tinyHitboxEnabled then 
            createTinyHitbox(m)
        else 
            local h = m:FindFirstChild("TinyHitBox") 
            if h then h:Destroy() end 
        end
    end
end

Workspace.DescendantAdded:Connect(function(o)
    if o:IsA("Model") and isGEF(o.Name) and Settings.tinyHitboxEnabled then
        task.wait()
        createTinyHitbox(o)
    end
end)
local chainSound
local function setupChainSound()
    if chainSound then chainSound:Destroy() end
    chainSound = Instance.new("Sound")
    chainSound.SoundId = "rbxassetid://2153944457"
    chainSound.Volume = 0.45
    chainSound.Parent = handle or workspace
end
setupChainSound()

RunService.RenderStepped:Connect(function()
    if not Settings.chainFiring or not Settings.chainCurrentEnd or not remote then return end
    local mouse = player:GetMouse()
    local targetPos = mouse.Hit.Position
    local distance = (targetPos - Settings.chainCurrentEnd).Magnitude
    if distance < 1.5 then return end
    
    local dir = (targetPos - Settings.chainCurrentEnd).Unit
    local stepSize = math.min(Settings.chainLinkLength, distance)
    local nextEnd = Settings.chainCurrentEnd + dir * stepSize
    
    fireBuild(Settings.chainCurrentEnd, nextEnd)
    Settings.chainCurrentEnd = nextEnd
    
    if chainSound and chainSound.Parent then
        chainSound:Play()
    end
end)

--====================================================================--
--========================== MAIN TAB ================================--
--====================================================================--
Tabs.Main:CreateSection("Base & Combat")

Tabs.Main:CreateButton({
    Name = "ULTRA MEGA BASE",
    Description = "Build instant fortress",
    Callback = OneClickMegaBase
})

Tabs.Main:CreateButton({
    Name = "Trap All GEFs",
    Description = "Sphere trap every GEF",
    Callback = function()
        for _, pos in getTargets(false) do buildSphere(pos) end
        Luna:Notification({Title = "TRAPPED!", Content = "All GEFs caged!", Duration = 5})
    end
})

Tabs.Main:CreateButton({
    Name = "Trap Players",
    Description = "Sphere trap players",
    Callback = function()
        for _, pos in getTargets(true) do buildSphere(pos) end
        Luna:Notification({Title = "TRAPPED!", Content = "Players caged!", Duration = 5})
    end
})

Tabs.Main:CreateButton({
    Name = "Trap All GEF Spawns",
    Description = "Lock all spawn points",
    Callback = function()
        local function find(name) 
            local t = {} 
            for _, c in Workspace:GetDescendants() do 
                if c:IsA("Folder") and c.Name == name then 
                    table.insert(t, c) 
                end 
            end 
            return t 
        end
        local f = {}
        for _, v in ipairs(find("GEFSpawnPoints")) do table.insert(f, v) end
        for _, v in ipairs(find("PlayerGEFSpawner")) do table.insert(f, v) end
        for _, folder in ipairs(f) do 
            for _, p in ipairs(folder:GetChildren()) do 
                if p:IsA("BasePart") then 
                    buildSphere(p.Position) 
                end 
            end 
        end
        Luna:Notification({Title = "SPAWNS LOCKED!", Content = "No more GEFs!", Duration = 6})
    end
})

Tabs.Main:CreateButton({
    Name = "Extend Hitboxes",
    Description = "20x20 hitboxes",
    Callback = function()
        extendHitboxes()
        Luna:Notification({Title = "HITBOXES EXTENDED!", Content = "20x20 size!", Duration = 5})
    end
})

Tabs.Main:CreateToggle({
    Name = "Tiny Hitbox",
    CurrentValue = false,
    Description = "0.1x0.1 hitboxes",
    Callback = function(v)
        Settings.tinyHitboxEnabled = v
        updateTinyHitboxes()
        Luna:Notification({Title = "Tiny Hitbox", Content = v and "ON" or "OFF", Duration = 3})
    end
})

Tabs.Main:CreateToggle({
    Name = "GEF ESP",
    CurrentValue = true,
    Description = "Show GEF locations",
    Callback = function(v)
        Settings.espEnabled = v
        refreshESP()
    end
})

Tabs.Main:CreateSection("Player Powers")

Tabs.Main:CreateButton({
    Name = "God Mode",
    Callback = function()
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.Health = 999999
            player.Character.Humanoid.MaxHealth = 999999
            Luna:Notification({Title = "GOD MODE!", Content = "Invincible!", Duration = 5})
        end
    end
})

Tabs.Main:CreateButton({
    Name = "Super Jump",
    Callback = function()
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.JumpPower = 150
            Luna:Notification({Title = "SUPER JUMP!", Content = "Sky high!", Duration = 5})
        end
    end
})

Tabs.Main:CreateButton({
    Name = "Invisibility",
    Callback = function()
        if player.Character then
            for _, p in player.Character:GetDescendants() do
                if p:IsA("BasePart") then
                    p.Transparency = 1
                end
            end
            Luna:Notification({Title = "INVISIBLE!", Content = "Ghost mode!", Duration = 5})
        end
    end
})

Tabs.Main:CreateButton({
    Name = "NoClip",
    Callback = function()
        if player.Character then
            for _, p in player.Character:GetDescendants() do
                if p:IsA("BasePart") then
                    p.CanCollide = false
                end
            end
            Luna:Notification({Title = "NOCLIP ON!", Content = "Walk through walls!", Duration = 5})
        end
    end
})

Tabs.Main:CreateButton({
    Name = "Freeze All GEFs",
    Description = "Stop GEF movement",
    Callback = function()
        for _, m in getGEFModels() do
            local hum = m:FindFirstChild("Humanoid")
            if hum then
                hum.WalkSpeed = 0
            end
        end
        Luna:Notification({Title = "FROZEN!", Content = "GEFs can't move!", Duration = 5})
    end
})

Tabs.Main:CreateButton({
    Name = "Spam Traps",
    Description = "Auto-trap loop",
    Callback = function()
        task.spawn(function()
            while task.wait(0.1) do
                for _, p in getTargets(false) do
                    buildSphere(p)
                end
            end
        end)
        Luna:Notification({Title = "SPAM TRAPS!", Content = "Auto-trapping active!", Duration = 5})
    end
})

Tabs.Main:CreateButton({
    Name = "Teleport to GEF",
    Description = "TP to nearest GEF",
    Callback = function()
        for _, m in getGEFModels() do
            if m.PrimaryPart then
                hrp.CFrame = m.PrimaryPart.CFrame + Vector3.new(0, 5, 0)
                break
            end
        end
        Luna:Notification({Title = "TELEPORTED!", Content = "At GEF location!", Duration = 4})
    end
})

Tabs.Main:CreateButton({
    Name = "Destroy All Tools",
    Description = "Clear backpack",
    Callback = function()
        for _, t in player.Backpack:GetChildren() do
            if t:IsA("Tool") then
                t:Destroy()
            end
        end
        Luna:Notification({Title = "DESTROYED!", Content = "All tools removed!", Duration = 5})
    end
})

Tabs.Main:CreateButton({
    Name = "Rainbow Character",
    Description = "Color cycle mode",
    Callback = function()
        task.spawn(function()
            while task.wait(0.1) do
                if player.Character then
                    for _, p in player.Character:GetDescendants() do
                        if p:IsA("BasePart") then
                            p.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                        end
                    end
                end
            end
        end)
        Luna:Notification({Title = "RAINBOW!", Content = "Colorful mode active!", Duration = 5})
    end
})

Tabs.Main:CreateButton({
    Name = "Fly to Base",
    Description = "TP 50 studs up",
    Callback = function()
        if hrp then
            hrp.CFrame = CFrame.new(hrp.Position + Vector3.new(0, 50, 0))
            Luna:Notification({Title = "FLY!", Content = "Above base!", Duration = 4})
        end
    end
})

Tabs.Main:CreateButton({
    Name = "Clear All Planks",
    Description = "Delete all wood",
    Callback = function()
        for _, p in Workspace:GetDescendants() do
            if p.Name == "Plank" or (p:IsA("Part") and p.Material == Enum.Material.Wood) then
                p:Destroy()
            end
        end
        Luna:Notification({Title = "CLEARED!", Content = "All planks removed!", Duration = 5})
    end
})

Tabs.Main:CreateSection("Money")

Tabs.Main:CreateButton({
    Name = "Infinite Yield ($9,999,999)",
    Description = "Max cash",
    Callback = function()
        local cash = player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Cash")
        if cash then
            cash.Value = 9999999
            Luna:Notification({Title = "INFINITE YIELD!", Content = "$9,999,999 added!", Duration = 6})
        else
            Luna:Notification({Title = "ERROR!", Content = "Cash not found!", Duration = 5})
        end
    end
})

--====================================================================--
--========================== BUILDS TAB ==============================--
--====================================================================--
Tabs.Builds:CreateSection("Quick Structures")

Tabs.Builds:CreateButton({
    Name = "Big Centered Dome",
    Description = "50 stud dome",
    Callback = function()
        local c = hrp.Position + Vector3.new(0, 20, 0)
        buildBigCenteredDome(c)
        Luna:Notification({Title = "DOME BUILT!", Content = "Protective shield!", Duration = 5})
    end
})

Tabs.Builds:CreateButton({
    Name = "Skyscraper",
    Description = "200 stud tower",
    Callback = buildSkyscraper
})

Tabs.Builds:CreateButton({
    Name = "Giant Dome",
    Description = "100 stud dome",
    Callback = buildGiantDome
})

Tabs.Builds:CreateButton({
    Name = "Arena",
    Description = "Circular coliseum",
    Callback = buildArena
})

Tabs.Builds:CreateButton({
    Name = "Maze",
    Description = "Random labyrinth",
    Callback = buildMaze
})

Tabs.Builds:CreateButton({
    Name = "Fortress",
    Description = "Walled castle",
    Callback = buildFortress
})

Tabs.Builds:CreateButton({
    Name = "Long Bridge",
    Description = "200 stud bridge",
    Callback = buildLongBridge
})

Tabs.Builds:CreateButton({
    Name = "Trap Pit",
    Description = "Deep hole trap",
    Callback = buildTrapPit
})

Tabs.Builds:CreateSection("Advanced Structures")

Tabs.Builds:CreateButton({
    Name = "Giant Pyramid",
    Description = "Ancient structure",
    Callback = buildPyramid
})

Tabs.Builds:CreateButton({
    Name = "Spiral Tower",
    Description = "Twisting spire",
    Callback = buildSpiralTower
})

Tabs.Builds:CreateButton({
    Name = "Floating Ring",
    Description = "Hovering circle",
    Callback = buildFloatingRing
})

Tabs.Builds:CreateButton({
    Name = "Castle Gate",
    Description = "Grand entrance",
    Callback = buildCastleGate
})

Tabs.Builds:CreateButton({
    Name = "Helix Tower",
    Description = "DNA spiral",
    Callback = buildHelixTower
})

Tabs.Builds:CreateButton({
    Name = "Orbital Rings",
    Description = "3 floating rings",
    Callback = buildOrbitalRings
})

Tabs.Builds:CreateButton({
    Name = "Volcano",
    Description = "Lava mountain",
    Callback = buildVolcano
})
Tabs.Special:CreateSection("Text Builder")

Tabs.Special:CreateInput({
    Name = "Enter Text (A-Z)",
    PlaceholderText = "Type here...",
    RemoveTextAfterFocusLost = false,
    Callback = function(text)
        -- Store for build button
        _G.LastTextInput = text
    end
})

Tabs.Special:CreateButton({
    Name = "BUILD TEXT",
    Description = "Build giant letters",
    Callback = function()
        if _G.LastTextInput then
            buildText(_G.LastTextInput)
        end
    end
})

--====================================================================--
--========================== CHAIN TAB ===============================--
--====================================================================--
Tabs.Chain:CreateSection("Chain Builder Controls")

Tabs.Chain:CreateToggle({
    Name = "Enable Chain Mode (Hold R)",
    CurrentValue = false,
    Description = "Hold R + move mouse",
    Callback = function(v)
        if v then
            Luna:Notification({
                Title = "CHAIN MODE ACTIVE!",
                Content = "Hold R + move mouse to build chain!",
                Duration = 5
            })
        else
            Luna:Notification({
                Title = "CHAIN MODE OFF",
                Content = "Chain builder disabled",
                Duration = 3
            })
        end
    end
})

Tabs.Chain:CreateSlider({
    Name = "Chain Link Length",
    Range = {5, 150},
    Increment = 5,
    CurrentValue = 100,
    Callback = function(v)
        Settings.chainLinkLength = v
    end
})

Tabs.Chain:CreateSection("Chain Settings")

Tabs.Chain:CreateButton({
    Name = "Test Chain",
    Description = "Build test chain forward",
    Callback = function()
        if hrp then
            local start = hrp.Position + hrp.CFrame.LookVector * 5
            local endPos = start + hrp.CFrame.LookVector * 50
            fireBuild(start, endPos)
            Luna:Notification({Title = "TEST CHAIN!", Content = "Check forward!", Duration = 4})
        end
    end
})

Tabs.Chain:CreateSection("Hotkeys Info")

Tabs.Chain:CreateParagraph({
    Title = "Keyboard Controls",
    Content = "R (Hold) = Chain Builder\nK (Hold) = Fast Floor\nL (Hold) = Fast Wall\nJ = Skyscraper\nP = Giant Dome\nH = Helix Tower\nB = Long Bridge"
})

UserInputService.InputBegan:Connect(function(input, gp)
    if gp or input.KeyCode ~= Enum.KeyCode.R then return end
    Settings.chainFiring = true
    if handle then
        Settings.chainCurrentEnd = handle.Position + handle.CFrame.LookVector * 4
    end
    if chainSound then
        chainSound:Play()
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.R then
        Settings.chainFiring = false
        Settings.chainCurrentEnd = nil
        if chainSound then
            chainSound:Stop()
        end
    end
end)

--====================================================================--
--========================== STARTUP =================================--
--====================================================================--
Luna:Notification({
    Title = "🎮 GEF ULTIMATE READY!",
    Content = "All features loaded successfully!",
    Icon = "check",
    Duration = 10
})