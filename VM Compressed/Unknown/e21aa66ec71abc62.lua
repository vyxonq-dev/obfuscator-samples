--==================================================================================================-- 
-- FRAMEWORK ARCHITECTURE: LUAROBLOX HELPER ARSENAL MULTI-HAX V20 (5-STUD TORNADO ENGINE)          -- 
-- TARGETED PLATFORM: MOBILE EXECUTORS (DELTA, CODEX, ARCEUS X, EVON, HYDROGEN)                   -- 
-- CONTEXT: EXTREME CLOSE-PROXIMITY ORBIT CORE, TEAM-ISOLATED TARGETING, NOCLIP & CFRAME MAP       -- 
--==================================================================================================-- 

if _G.LuarobloxExecutedV20 then 
    print("[SYSTEM] Framework V20 already active. Terminating duplicate threads.") 
    return 
else 
    _G.LuarobloxExecutedV20 = true 
end 

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))() 

_G.ArsenalConfig = { 
    Aimbot = { Enabled = false, TargetPart = "Head", WallCheck = true, TeamCheck = true }, 
    Combat = { ButtonTpEnabled = false, OffsetBehind = 3.2, HeightAdjustment = 0.5, VelocityKill = true, OrbitEnabled = false, OrbitRadius = 5, OrbitHeight = 5, AutoRespawn = false }, 
    Visuals = { EspEnabled = false, RefreshRate = 0.25, FillColor = Color3.fromRGB(255, 0, 60), OutlineColor = Color3.fromRGB(255, 255, 255), Transparency = 0.4 }, 
    Movement = { WalkSpeed = 16, JumpHeight = 50, FlyEnabled = false, FlyHeight = 25, Noclip = false, AntiVoid = false },
    AutoPickup = { Enabled = false }
} 

local Workspace, Players, RunService, UserInputService, TweenService, CoreGui = game:GetService("Workspace"), game:GetService("Players"), game:GetService("RunService"), game:GetService("UserInputService"), game:GetService("TweenService"), game:GetService("CoreGui") 
local LocalPlayer = Players.LocalPlayer 
local Camera = Workspace.CurrentCamera 
local TeleportCooldown, OrbitAngle, DeathLocation = false, 0, nil
local TPButton = nil

local Window = Rayfield:CreateWindow({ 
   Name = "Arsenal Mobile V20 | Luaroblox Helper", 
   LoadingTitle = "Assembling 5-Stud Tornado Matrix...", 
   LoadingSubtitle = "Extreme Face-Proximity Target Deletion Engine", 
   ConfigurationSaving = { Enabled = false } 
}) 

local CombatTab = Window:CreateTab("Combat Matrix", 4483362458) 
local VisualsTab = Window:CreateTab("Visuals Matrix", 4483362458) 
local MovementTab = Window:CreateTab("Movement Matrix", 4483362458) 
local PickupTab = Window:CreateTab("Pickup Matrix", 4483362458) 

-- [ ANTI-VOID SYSTEM ]
local AntiVoidPart = Instance.new("Part", Workspace)
AntiVoidPart.Name = "AntiVoid"
AntiVoidPart.Size = Vector3.new(10000, 1, 10000)
AntiVoidPart.Position = Vector3.new(0, -100, 0)
AntiVoidPart.Anchored = true
AntiVoidPart.Transparency = 1
AntiVoidPart.CanCollide = true
AntiVoidPart.Touched:Connect(function(hit)
    if _G.ArsenalConfig.Movement.AntiVoid and hit.Parent == LocalPlayer.Character then
        local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp then hrp.CFrame = CFrame.new(0, 50, 0) end
    end
end)

-- [ WALLCHECK LOGIC ]
local function isVisible(part)
    local ray = Ray.new(Camera.CFrame.Position, part.Position - Camera.CFrame.Position)
    local hit = Workspace:FindPartOnRayWithIgnoreList(ray, {LocalPlayer.Character, Camera})
    return hit and hit:IsDescendantOf(part.Parent)
end

-- AUTO-RESPAWN & TEAM LOGIC
LocalPlayer.CharacterRemoving:Connect(function(char) if _G.ArsenalConfig.Combat.AutoRespawn then local hrp = char:FindFirstChild("HumanoidRootPart") if hrp then DeathLocation = hrp.CFrame end end end)
LocalPlayer.CharacterAdded:Connect(function(char) if _G.ArsenalConfig.Combat.AutoRespawn and DeathLocation then task.wait(0.8) local hrp = char:WaitForChild("HumanoidRootPart", 5) if hrp then hrp.CFrame = DeathLocation end end end)
local function isEnemy(player) if not _G.ArsenalConfig.Aimbot.TeamCheck then return true end if player.Team == nil or LocalPlayer.Team == nil then return true end return player.Team ~= LocalPlayer.Team end 

-- MOVEMENT ENGINE (FORCE UPDATER)
RunService.Heartbeat:Connect(function() 
    local char = LocalPlayer.Character local hum = char and char:FindFirstChildOfClass("Humanoid")
    if hum then
        if hum.WalkSpeed ~= _G.ArsenalConfig.Movement.WalkSpeed and not _G.ArsenalConfig.Movement.FlyEnabled then hum.WalkSpeed = _G.ArsenalConfig.Movement.WalkSpeed end
        if hum.UseJumpPower and hum.JumpPower ~= _G.ArsenalConfig.Movement.JumpHeight then hum.JumpPower = _G.ArsenalConfig.Movement.JumpHeight 
        elseif not hum.UseJumpPower and hum.JumpHeight ~= _G.ArsenalConfig.Movement.JumpHeight then hum.JumpHeight = _G.ArsenalConfig.Movement.JumpHeight end
    end
end)

-- TARGETING & ORBIT CORE
local function getClosestPlayer()
    local target, dist = nil, math.huge
    for _,p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and isEnemy(p) then
            local d = (p.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            if d < dist then target = p; dist = d end
        end
    end
    return target
end

RunService.RenderStepped:Connect(function() 
    local target = getClosestPlayer()
    if _G.ArsenalConfig.Aimbot.Enabled and target and target.Character:FindFirstChild(_G.ArsenalConfig.Aimbot.TargetPart) then 
        local part = target.Character[_G.ArsenalConfig.Aimbot.TargetPart]
        if _G.ArsenalConfig.Aimbot.WallCheck then
            if isVisible(part) then Camera.CFrame = CFrame.new(Camera.CFrame.Position, part.Position) end
        else
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, part.Position)
        end
    end
    if _G.ArsenalConfig.Combat.OrbitEnabled and target and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then 
        OrbitAngle = OrbitAngle + 0.15 
        local pos = target.Character.HumanoidRootPart.Position + Vector3.new(math.cos(OrbitAngle)*_G.ArsenalConfig.Combat.OrbitRadius, _G.ArsenalConfig.Combat.OrbitHeight, math.sin(OrbitAngle)*_G.ArsenalConfig.Combat.OrbitRadius)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.lookAt(pos, target.Character.HumanoidRootPart.Position)
    end
    -- ESP LOGIC (FIXED)
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            local highlight = p.Character:FindFirstChild("ESP_Highlight")
            if not highlight then 
                highlight = Instance.new("Highlight", p.Character) 
                highlight.Name = "ESP_Highlight" 
            end
            highlight.Enabled = (_G.ArsenalConfig.Visuals.EspEnabled and isEnemy(p))
            highlight.FillColor = _G.ArsenalConfig.Visuals.FillColor
            highlight.OutlineColor = _G.ArsenalConfig.Visuals.OutlineColor
        end
    end
end)

-- FLY & NOCLIP
RunService.PreSimulation:Connect(function() 
    local char = LocalPlayer.Character local root = char and char:FindFirstChild("HumanoidRootPart")
    if _G.ArsenalConfig.Movement.FlyEnabled and root then
        root.AssemblyLinearVelocity = Vector3.zero local move = char.Humanoid.MoveDirection
        root.CFrame = root.CFrame + (move * (_G.ArsenalConfig.Movement.WalkSpeed / 20))
    end
end)

RunService.Stepped:Connect(function() 
    if (_G.ArsenalConfig.Movement.Noclip or _G.ArsenalConfig.Movement.FlyEnabled) and LocalPlayer.Character then 
        for _,p in pairs(LocalPlayer.Character:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide = false end end 
    end 
end)

-- KNIFE TP & BUTTON
local KnifeTPGui = Instance.new("ScreenGui", (gethui and gethui()) or CoreGui)
TPButton = Instance.new("TextButton", KnifeTPGui)
TPButton.Size, TPButton.Position, TPButton.Text, TPButton.Visible = UDim2.new(0,115,0,55), UDim2.new(0.8,0,0.35,0), "KNIFE TP", false
TPButton.BackgroundColor3 = Color3.fromRGB(255,0,60)
TPButton.Activated:Connect(function()
    local target = getClosestPlayer()
    if target then LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,_G.ArsenalConfig.Combat.OffsetBehind) end
end)

-- UI BINDINGS
CombatTab:CreateToggle({ Name = "Enable Aimbot", Callback = function(v) _G.ArsenalConfig.Aimbot.Enabled = v end }) 
CombatTab:CreateToggle({ Name = "Wall Check", CurrentValue = true, Callback = function(v) _G.ArsenalConfig.Aimbot.WallCheck = v end })
CombatTab:CreateToggle({ Name = "Enable Orbit", Callback = function(v) _G.ArsenalConfig.Combat.OrbitEnabled = v end }) 
CombatTab:CreateToggle({ Name = "Auto-Respawn", Callback = function(v) _G.ArsenalConfig.Combat.AutoRespawn = v end })
CombatTab:CreateToggle({ Name = "Show Knife TP Button", Callback = function(v) TPButton.Visible = v end })
VisualsTab:CreateToggle({ Name = "Enable ESP", Callback = function(v) _G.ArsenalConfig.Visuals.EspEnabled = v end })
MovementTab:CreateInput({ Name = "Jump Height", PlaceholderText = "50", Callback = function(t) _G.ArsenalConfig.Movement.JumpHeight = tonumber(t) or 50 end }) 
MovementTab:CreateInput({ Name = "Walk Speed", PlaceholderText = "16", Callback = function(t) _G.ArsenalConfig.Movement.WalkSpeed = tonumber(t) or 16 end }) 
MovementTab:CreateToggle({ Name = "Enable Fly", Callback = function(v) _G.ArsenalConfig.Movement.FlyEnabled = v end }) 
MovementTab:CreateToggle({ Name = "Noclip", Callback = function(v) _G.ArsenalConfig.Movement.Noclip = v end })
MovementTab:CreateToggle({ Name = "Enable Anti-Void", Callback = function(v) _G.ArsenalConfig.Movement.AntiVoid = v end })
PickupTab:CreateToggle({ Name = "Auto-Pickup Loot", Callback = function(v) _G.ArsenalConfig.AutoPickup.Enabled = v end })

task.spawn(function() while task.wait(0.2) do if _G.ArsenalConfig.AutoPickup.Enabled and LocalPlayer.Character then for _,v in pairs(Workspace:GetChildren()) do if (v.Name == "DeadHP" or v.Name == "DeadAmmo") and (v.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 50 then LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame end end end end end)
