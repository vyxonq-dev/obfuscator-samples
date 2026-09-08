local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local Window = Rayfield:CreateWindow({
    Name = "Slap Duels",
    LoadingTitle = "Slap Duels",
    LoadingSubtitle = "Made by nilly",
    ConfigurationSaving = { Enabled = false }
})
local Tab = Window:CreateTab("Main", 4483362458)

task.spawn(function()
    local packages = ReplicatedStorage:FindFirstChild("Packages")
    local knit = packages and packages:FindFirstChild("Knit")
    local services = knit and knit:FindFirstChild("Services")
    local antiCheat = services and services:FindFirstChild("AntiCheatService")
    if antiCheat then
        antiCheat:Destroy()
        Rayfield:Notify({
            Title = "Success",
            Content = "AntiCheat disabled",
            Duration = 3
        })
    end
end)

Tab:CreateSection("Hitbox Extender")

local hitboxEnabled = false
local hitboxSize = 10
local hitboxTransparency = 0.5
local visualCache = {}

local function createVisual(hrp)
    if visualCache[hrp] then return end
    local box = Instance.new("SelectionBox")
    box.Name = "HitboxVisual"
    box.Adornee = hrp
    box.Color3 = Color3.fromRGB(255, 0, 0)
    box.Transparency = hitboxTransparency
    box.SurfaceTransparency = hitboxTransparency - 0.1
    box.LineThickness = 0.07
    box.Parent = hrp
    visualCache[hrp] = box
end

local function removeVisual(hrp)
    local box = visualCache[hrp]
    if box then
        box:Destroy()
        visualCache[hrp] = nil
    end
end

local function applyHitbox(char, plr)
    if char == player.Character then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hrp or not hum or hum.Health <= 0 then return end
    hrp.Size = Vector3.new(hitboxSize, hitboxSize, hitboxSize)
    hrp.CanCollide = false
    hrp.Transparency = 1
    createVisual(hrp)
end

local function removeHitbox(char)
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    hrp.Size = Vector3.new(2, 2, 1)
    hrp.CanCollide = true
    hrp.Transparency = 0
    removeVisual(hrp)
end

RunService.Heartbeat:Connect(function()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= player and plr.Character then
            if hitboxEnabled then
                applyHitbox(plr.Character, plr)
            else
                removeHitbox(plr.Character)
            end
        end
    end
end)

Tab:CreateSlider({
    Name = "Hitbox Size",
    Range = {5, 20},
    Increment = 1,
    Suffix = "Studs",
    CurrentValue = 10,
    Callback = function(v)
        hitboxSize = v
    end
})

Tab:CreateSlider({
    Name = "Transparency",
    Range = {0, 1},
    Increment = 0.05,
    CurrentValue = 0.5,
    Callback = function(v)
        hitboxTransparency = v
        for _, box in pairs(visualCache) do
            if box.Parent then
                box.Transparency = v
                box.SurfaceTransparency = v - 0.1
            end
        end
    end
})

Tab:CreateToggle({
    Name = "Hitbox Extender",
    CurrentValue = false,
    Callback = function(state)
        hitboxEnabled = state
    end
})


Tab:CreateSection("Teleport")

local function getParts()
    return workspace:FindFirstChild("StartPart", true),
           workspace:FindFirstChild("EndPart", true)
end

local function blinkToPart(part)
    if not part then return end
    local old = hrp.CFrame
    hrp.CFrame = part.CFrame + Vector3.new(0, 3, 0)
    task.wait(0.35)
    if part:FindFirstChildOfClass("TouchInterest", true) then
        firetouchinterest(hrp, part, 0)
        firetouchinterest(hrp, part, 1)
    end
    hrp.CFrame = old
end

Tab:CreateButton({
    Name = "Teleport to Goal",
    Callback = function()
        local s, e = getParts()
        if not s or not e then
            Rayfield:Notify({
                Title = "Please enter a game first",
                Content = "This will not activate in lobby",
                Duration = 3
            })
            return
        end
        if (s.Position - hrp.Position).Magnitude <
           (e.Position - hrp.Position).Magnitude then
            blinkToPart(e)
        else
            blinkToPart(s)
        end
    end
})

local teleportStuds = 10
local lastUse = 0
local COOLDOWN = 0.10

Tab:CreateSlider({
    Name = "Distance",
    Range = {1, 100},
    Increment = 1,
    Suffix = "Studs",
    CurrentValue = teleportStuds,
    Callback = function(v)
        teleportStuds = v
    end
})

local function dashForward(studs)
    humanoid.WalkSpeed = 0
    hrp.AssemblyLinearVelocity = Vector3.zero
    hrp.AssemblyAngularVelocity = Vector3.zero
    local look = hrp.CFrame.LookVector
    local pos = hrp.Position + (look * studs) + Vector3.new(0, 2, 0)
    hrp.CFrame = CFrame.new(pos, pos + look)
    RunService.Heartbeat:Wait()
    humanoid.WalkSpeed = 16
end

Tab:CreateKeybind({
    Name = "Dash Keybind",
    CurrentKeybind = "R",
    HoldToInteract = false,
    Callback = function()
        if tick() - lastUse < COOLDOWN then return end
        lastUse = tick()
        if typeof(_G.thru) == "function" then
            pcall(function()
                _G.thru(teleportStuds)
            end)
        else
            dashForward(teleportStuds)
        end
    end
})