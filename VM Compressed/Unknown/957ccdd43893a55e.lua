local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

local LP = Players.LocalPlayer
local Char = LP.Character or LP.CharacterAdded:Wait()
local Humanoid = Char:WaitForChild("Humanoid")
local HRP = Char:WaitForChild("HumanoidRootPart")
local ZombiesFolder = Workspace:WaitForChild("Zombies")

local function rebind()
    Char = LP.Character or LP.CharacterAdded:Wait()
    Humanoid = Char:WaitForChild("Humanoid")
    HRP = Char:WaitForChild("HumanoidRootPart")
end

LP.CharacterAdded:Connect(function()
    task.wait(1)
    rebind()
end)

local function getGun()
    return (Char:FindFirstChild("1911") or Char:FindFirstChildWhichIsA("Tool"))
end

local CK = loadstring(game:HttpGet("https://raw.githubusercontent.com/4lpaca-pin/CompKiller/refs/heads/main/src/source.luau"))()
local UI = CK.new({ Name = "Zombies Ahy©", Keybind = "RightAlt", Scale = CK.Scale.Full })

local State = {
    AutoKill = false,
    OneHit = true,
    ESP = false,
    God = false,
    Noclip = false,
    InfJump = false,
    WalkOnAir = false,
    InfZombies = false,
    FreezeZombies = false,
    TPZombiesFront = false,
    WalkSpeed = 16,
    JumpPower = 50,
    InfiniteAmmo = false,
    SpawnMoreZombies = false,
    Money = 0,
    Kills = 0,
    AimBot = false,
    ESPDrops = false
}

local function getZombies()
    local t = {}
    for _, z in pairs(ZombiesFolder:GetChildren()) do
        if z:IsA("Model") and z:FindFirstChildWhichIsA("Humanoid") then
            table.insert(t, z)
        end
    end
    return t
end

local function fire(zombie)
    local part = zombie:FindFirstChild("Head") or zombie:FindFirstChildWhichIsA("BasePart")
    local gun = getGun()
    local fireEvent = gun and gun:FindFirstChild("Event")
    if part and fireEvent then
        local dmg = State.OneHit and 9999 or 11
        local cf = CFrame.lookAt(part.Position, part.Position + part.CFrame.LookVector)
        fireEvent:FireServer(part, cf, dmg)
    end
end

local function highlight(model)
    for _, v in pairs(model:GetDescendants()) do
        if v:IsA("BasePart") and not v:FindFirstChild("ESPBox") then
            local box = Instance.new("BoxHandleAdornment")
            box.Name = "ESPBox"
            box.Size = v.Size
            box.Adornee = v
            box.AlwaysOnTop = true
            box.ZIndex = 10
            box.Transparency = 0.3
            box.Color3 = Color3.new(1, 0, 0)
            box.Parent = v
        end
    end
end

local function highlightDrop(part)
    if part:IsA("BasePart") and not part:FindFirstChild("ESPBox") then
        local box = Instance.new("BoxHandleAdornment")
        box.Name = "ESPBox"
        box.Size = part.Size
        box.Adornee = part
        box.AlwaysOnTop = true
        box.ZIndex = 10
        box.Transparency = 0.3
        box.Color3 = Color3.fromRGB(0, 255, 255)
        box.Parent = part
    end
    local distance = math.floor((HRP.Position - part.Position).Magnitude)
    if not part:FindFirstChild("Distance") then
        local b = Instance.new("BillboardGui", part)
        b.Name = "Distance"
        b.Size = UDim2.new(0, 100, 0, 40)
        b.AlwaysOnTop = true
        b.StudsOffset = Vector3.new(0, 2, 0)
        local t = Instance.new("TextLabel", b)
        t.Size = UDim2.new(1, 0, 1, 0)
        t.BackgroundTransparency = 1
        t.TextColor3 = Color3.new(1, 1, 1)
        t.TextStrokeTransparency = 0
        t.Text = distance .. " studs"
    else
        part.Distance.TextLabel.Text = distance .. " studs"
    end
end

local function teleportToAirdrop()
    local closest, dist = nil, math.huge
    for _, d in pairs(Workspace.AirdropSystem.Drops:GetChildren()) do
        if d:IsA("Model") and d:FindFirstChildWhichIsA("BasePart") then
            local part = d:FindFirstChildWhichIsA("BasePart")
            local d = (HRP.Position - part.Position).Magnitude
            if d < dist then
                closest, dist = part, d
            end
        end
    end
    if closest and HRP then
        HRP.CFrame = CFrame.new(closest.Position + Vector3.new(0, 3, 0))
    end
end

local function moveToFront(zombie)
    local root = zombie:FindFirstChild("HumanoidRootPart") or zombie:FindFirstChildWhichIsA("BasePart")
    if root and HRP and State.TPZombiesFront then
        root.Anchored = true
        root.CFrame = HRP.CFrame * CFrame.new(0, 0, -5)
    end
end

local function cloneZombies()
    local baseZombies = getZombies()
    for _, base in pairs(baseZombies) do
        if base:IsA("Model") and base.Parent == ZombiesFolder then
            for _ = 1, 3 do
                local newZ = base:Clone()
                newZ.Parent = ZombiesFolder
                local root = newZ:FindFirstChild("HumanoidRootPart") or newZ:FindFirstChildWhichIsA("BasePart")
                if root then
                    local offset = Vector3.new(math.random(-30,30), 0, math.random(-30,30))
                    root.CFrame = HRP.CFrame * CFrame.new(offset)
                    root.Anchored = false
                end
            end
        end
    end
end

local function aimBot()
    local closest, dist = nil, math.huge
    for _, z in pairs(getZombies()) do
        local head = z:FindFirstChild("Head")
        if head then
            local screenPos, onScreen = Workspace.CurrentCamera:WorldToViewportPoint(head.Position)
            local mousePos = UserInputService:GetMouseLocation()
            local d = (Vector2.new(screenPos.X, screenPos.Y) - Vector2.new(mousePos.X, mousePos.Y)).Magnitude
            if d < dist and onScreen then
                closest, dist = head, d
            end
        end
    end
    if closest then
        Workspace.CurrentCamera.CFrame = CFrame.lookAt(Workspace.CurrentCamera.CFrame.Position, closest.Position)
    end
end

RunService.RenderStepped:Connect(function()
    if Humanoid and HRP then
        if Humanoid.WalkSpeed ~= State.WalkSpeed then
            Humanoid.WalkSpeed = State.WalkSpeed
        end
        if Humanoid.JumpPower ~= State.JumpPower then
            Humanoid.JumpPower = State.JumpPower
        end
    end
    if State.Noclip then
        for _, p in pairs(Char:GetDescendants()) do
            if p:IsA("BasePart") then p.CanCollide = false end
        end
    end
    if State.ESP then
        for _, z in pairs(getZombies()) do
            highlight(z)
        end
    end
    if State.ESPDrops then
        for _, d in pairs(Workspace.AirdropSystem.Drops:GetChildren()) do
            if d:IsA("Model") and d:FindFirstChildWhichIsA("BasePart") then
                local part = d:FindFirstChildWhichIsA("BasePart")
                highlightDrop(part)
            end
        end
    end
    if State.AutoKill then
        for _, z in pairs(getZombies()) do
            fire(z)
        end
    end
    if State.InfZombies then
        for _, z in pairs(getZombies()) do
            local h = z:FindFirstChildWhichIsA("Humanoid")
            if h and h.Health <= 0 then h.Health = h.MaxHealth end
        end
    end
    if State.FreezeZombies then
        for _, z in pairs(getZombies()) do
            local root = z:FindFirstChild("HumanoidRootPart") or z:FindFirstChildWhichIsA("BasePart")
            if root then root.Anchored = true end
        end
    end
    if State.TPZombiesFront then
        for _, z in pairs(getZombies()) do
            moveToFront(z)
        end
    end
    if State.InfiniteAmmo then
        local gun = getGun()
        if gun then
            local hud = gun:FindFirstChild("GunHud")
            if hud and hud:FindFirstChild("Ammo") then
                hud.Ammo.Mag.Text = "∞"
            end
        end
    end
    if State.SpawnMoreZombies then
        cloneZombies()
    end
    if State.AimBot then
        aimBot()
    end
end)

UserInputService.JumpRequest:Connect(function()
    if State.InfJump and HRP then
        HRP.Velocity = Vector3.new(0, 70, 0)
    end
end)

RunService.Stepped:Connect(function()
    if State.WalkOnAir and HRP then
        HRP.Velocity = Vector3.new(0, 5, 0)
    end
end)

Humanoid:GetPropertyChangedSignal("Health"):Connect(function()
    if State.God and Humanoid.Health < Humanoid.MaxHealth then
        Humanoid.Health = Humanoid.MaxHealth
    end
end)

local Combat = UI:DrawTab({ Name = "Combat", Icon = "sword" })
local sec1 = Combat:DrawSection({ Name = "Main", Position = "left" })
local sec2 = Combat:DrawSection({ Name = "Control", Position = "right" })

sec1:AddToggle({ Name = "Auto Kill", Flag = "AutoKill", Default = false, Callback = function(v) State.AutoKill = v end })
sec1:AddToggle({ Name = "One Hit", Flag = "OneHit", Default = true, Callback = function(v) State.OneHit = v end })
sec1:AddToggle({ Name = "Infinite Zombies", Flag = "InfZombies", Default = false, Callback = function(v) State.InfZombies = v end })
sec1:AddToggle({ Name = "Infinite Ammo", Flag = "InfiniteAmmo", Default = false, Callback = function(v) State.InfiniteAmmo = v end })
sec1:AddToggle({ Name = "Spawn More Zombies", Flag = "SpawnMoreZombies", Default = false, Callback = function(v) State.SpawnMoreZombies = v end })

sec2:AddToggle({ Name = "Freeze Zombies", Flag = "FreezeZombies", Default = false, Callback = function(v) State.FreezeZombies = v end })
sec2:AddToggle({ Name = "TP Zombies Front", Flag = "TPZombiesFront", Default = false, Callback = function(v) State.TPZombiesFront = v end })
sec2:AddToggle({ Name = "Zombies ESP", Flag = "ESP", Default = false, Callback = function(v) State.ESP = v end })
sec2:AddToggle({ Name = "Aimbot (Head)", Flag = "AimBot", Default = false, Callback = function(v) State.AimBot = v end })
sec2:AddToggle({ Name = "ESP Drops with Distance", Flag = "ESPDrops", Default = false, Callback = function(v) State.ESPDrops = v end })
sec2:AddButton({ Name = "Teleport to Airdrop", Callback = teleportToAirdrop })

local Movement = UI:DrawTab({ Name = "Player", Icon = "user" })
local sec3 = Movement:DrawSection({ Name = "Movement", Position = "left" })
local sec4 = Movement:DrawSection({ Name = "Abilities", Position = "right" })

sec3:AddSlider({ Name = "WalkSpeed", Flag = "WalkSpeed", Min = 16, Max = 150, Default = 16, Callback = function(v) State.WalkSpeed = v end })
sec3:AddSlider({ Name = "JumpPower", Flag = "JumpPower", Min = 50, Max = 200, Default = 50, Callback = function(v) State.JumpPower = v end })

sec4:AddToggle({ Name = "Noclip", Flag = "Noclip", Default = false, Callback = function(v) State.Noclip = v end })
sec4:AddToggle({ Name = "Inf Jump", Flag = "InfJump", Default = false, Callback = function(v) State.InfJump = v end })
sec4:AddToggle({ Name = "Walk on Air", Flag = "WalkOnAir", Default = false, Callback = function(v) State.WalkOnAir = v end })
sec4:AddToggle({ Name = "God Mode", Flag = "God", Default = false, Callback = function(v) State.God = v end })

local MoneyTab = UI:DrawTab({ Name = "Money", Icon = "dollar-sign" })
local moneySec = MoneyTab:DrawSection({ Name = "Editor", Position = "left" })
moneySec:AddSlider({ Name = "Edit Money", Flag = "Money", Min = 0, Max = 999999999999999, Default = 0, Callback = function(v)
    local stat = LP:FindFirstChild("leaderstats") and LP.leaderstats:FindFirstChild("Money")
    if stat then stat.Value = v end
end })

local KillsTab = UI:DrawTab({ Name = "Kills", Icon = "kill-sign" })
local killsSec = KillsTab:DrawSection({ Name = "Editor", Position = "left" })
killsSec:AddSlider({ Name = "Edit Kills", Flag = "Kills", Min = 0, Max = 999999999999999, Default = 0, Callback = function(v)
    local stat = LP:FindFirstChild("leaderstats") and LP.leaderstats:FindFirstChild("Kills")
    if stat then stat.Value = v end
end })