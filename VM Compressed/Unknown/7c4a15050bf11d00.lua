--[[
    Prison Life - Hybrid Script v6 (COMPLETE)
    Features: Silent Aim + AutoShoot + ESP + Mobile
    Tudo funcionando perfeitamente!
]]

repeat task.wait() until game:IsLoaded()
task.wait(2)

print("=== PRISON LIFE HYBRID v6 - AUTOSHOOT ===")

-- Carregamento da Rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Serviços
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Debris = game:GetService("Debris")
local Camera = Workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local Teams = game:GetService("Teams")

-- Teams
local guardsTeam = Teams:FindFirstChild("Guards")
local inmatesTeam = Teams:FindFirstChild("Inmates")
local criminalsTeam = Teams:FindFirstChild("Criminals")

-- Configurações
local cfg = {
    enabled = true,
    teamcheck = true,
    wallcheck = true,
    deathcheck = true,
    ffcheck = true,
    vehiclecheck = true,
    criminalsnoinnmates = true,
    inmatesnocriminals = true,
    shieldbreaker = true,
    hitchance = 100,
    fov = 150,
    showfov = true,
    aimpart = "Head",
    randomparts = false,
    partslist = {"Head", "Torso", "Left Arm", "Right Arm"},
    missspread = 5,
    autoshoot = true,
    autoshootdelay = 0.12,
    autoshootstartdelay = 0.2,
    prioritizeclosest = true,
    targetstickiness = true,
    targetstickinessduration = 0.6,
    esp = true,
    espteamcheck = true,
}

-- Variáveis
local currentGun = nil
local rng = Random.new()
local lastShotTime = 0
local lastShotResult = false
local shotCooldown = 0.15
local currentTarget = nil
local targetSwitchTime = 0
local ESPObjects = {}
local origCastRay = nil
local hooked = false
local lastAutoShoot = 0
local targetAcquiredTime = 0
local lastAutoTarget = nil
local cachedBulletsLabel = nil

-- FOV Circle
local FOVCircle
local drawingSupported = pcall(function()
    local test = Drawing.new("Circle")
    test:Remove()
end)

if drawingSupported then
    FOVCircle = Drawing.new("Circle")
    FOVCircle.Color = Color3.fromRGB(255, 255, 255)
    FOVCircle.Radius = cfg.fov
    FOVCircle.Transparency = 0.8
    FOVCircle.Filled = false
    FOVCircle.NumSides = 64
    FOVCircle.Thickness = 2
    FOVCircle.Visible = false
    print("✅ FOV Circle criado!")
end

-- Wall Check Params
local wallParams = RaycastParams.new()
wallParams.FilterType = Enum.RaycastFilterType.Exclude
wallParams.IgnoreWater = true

-- Funções Utilitárias
local partMap = {
    ["Torso"] = {"Torso", "UpperTorso", "LowerTorso"},
    ["Left Arm"] = {"Left Arm", "LeftUpperArm", "LeftLowerArm"},
    ["Right Arm"] = {"Right Arm", "RightUpperArm", "RightLowerArm"},
    ["Left Leg"] = {"Left Leg", "LeftUpperLeg", "LeftLowerLeg"},
    ["Right Leg"] = {"Right Leg", "RightUpperLeg", "RightLowerLeg"}
}

local function getPart(char, name)
    if not char then return nil end
    local p = char:FindFirstChild(name)
    if p then return p end
    
    local maps = partMap[name]
    if maps then
        for _, n in ipairs(maps) do
            local part = char:FindFirstChild(n)
            if part then return part end
        end
    end
    return char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Head")
end

local function getTargetPart(char)
    if not char then return nil end
    
    -- Shield Breaker
    if cfg.shieldbreaker then
        local shield = char:FindFirstChild("RiotShieldPart")
        if shield and shield:IsA("BasePart") then
            local hp = shield:GetAttribute("Health")
            if hp and hp > 0 then
                return shield
            end
        end
    end
    
    -- Random Parts
    local partName
    if cfg.randomparts then
        local list = cfg.partslist
        partName = (list and #list > 0) and list[rng:NextInteger(1, #list)] or "Head"
    else
        partName = cfg.aimpart
    end
    return getPart(char, partName)
end

local function isDead(player)
    if not player or not player.Character then return true end
    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
    return not humanoid or humanoid.Health <= 0
end

local function hasForceField(player)
    if not player or not player.Character then return false end
    return player.Character:FindFirstChildOfClass("ForceField") ~= nil
end

local function isInVehicle(player)
    if not player or not player.Character then return false end
    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return false end
    return humanoid.SeatPart ~= nil
end

local function wallBetween(startPos, endPos, targetChar)
    local myChar = LocalPlayer.Character
    if not myChar then return true end
    
    local filter = {myChar}
    if targetChar then table.insert(filter, targetChar) end
    wallParams.FilterDescendantsInstances = filter
    
    local direction = endPos - startPos
    local result = Workspace:Raycast(startPos, direction, wallParams)
    
    if not result then return false end
    
    local hitPart = result.Instance
    return not (hitPart and hitPart:IsDescendantOf(targetChar))
end

local function quickCheck(player)
    if not player or player == LocalPlayer or not player.Character then return false end
    if not getTargetPart(player.Character) then return false end
    if cfg.deathcheck and isDead(player) then return false end
    if cfg.ffcheck and hasForceField(player) then return false end
    if cfg.vehiclecheck and isInVehicle(player) then return false end
    if cfg.teamcheck and player.Team == LocalPlayer.Team then return false end
    
    if cfg.criminalsnoinnmates then
        if LocalPlayer.Team == criminalsTeam and player.Team == inmatesTeam then return false end
    end
    if cfg.inmatesnocriminals then
        if LocalPlayer.Team == inmatesTeam and player.Team == criminalsTeam then return false end
    end
    
    return true
end

local function fullCheck(player)
    if not quickCheck(player) then return false end
    
    if cfg.wallcheck then
        local myChar = LocalPlayer.Character
        local myHead = myChar and myChar:FindFirstChild("Head")
        local targetPart = getTargetPart(player.Character)
        if myHead and targetPart then
            if wallBetween(myHead.Position, targetPart.Position, player.Character) then
                return false
            end
        end
    end
    return true
end

local function rollHit()
    local now = os.clock()
    if now - lastShotTime > shotCooldown then
        lastShotTime = now
        local chance = cfg.hitchance
        if chance >= 100 then
            lastShotResult = true
        elseif chance <= 0 then
            lastShotResult = false
        else
            lastShotResult = rng:NextInteger(1, 100) <= chance
        end
    end
    return lastShotResult
end

local function getMissPos(targetPos)
    local spread = cfg.missspread
    local angle = rng:NextNumber() * math.pi * 2
    local d = rng:NextNumber() * spread
    local yOffset = (rng:NextNumber() - 0.5) * spread
    return targetPos + Vector3.new(math.cos(angle) * d, yOffset, math.sin(angle) * d)
end

local function getClosest(fovRadius)
    fovRadius = fovRadius or cfg.fov
    local camera = Camera
    if not camera then return nil, nil end
    
    local lastInput = UserInputService:GetLastInputType()
    local locked = (lastInput == Enum.UserInputType.Touch) or (UserInputService.MouseBehavior == Enum.MouseBehavior.LockCenter)
    
    local aimPos
    if locked then
        local viewportSize = camera.ViewportSize
        aimPos = Vector2.new(viewportSize.X / 2, viewportSize.Y / 2)
    else
        aimPos = UserInputService:GetMouseLocation()
    end
    
    local now = os.clock()
    
    -- Target Stickiness
    if cfg.targetstickiness and currentTarget and (now - targetSwitchTime) < cfg.targetstickinessduration then
        if fullCheck(currentTarget) then
            local part = getTargetPart(currentTarget.Character)
            if part then
                local screenPos, onScreen = camera:WorldToViewportPoint(part.Position)
                if onScreen and screenPos.Z > 0 then
                    local dist = (Vector2.new(screenPos.X, screenPos.Y) - aimPos).Magnitude
                    if dist < fovRadius then
                        return currentTarget, part.Position
                    end
                end
            end
        end
    end
    
    local candidates = {}
    
    for _, player in ipairs(Players:GetPlayers()) do
        if quickCheck(player) then
            local part = getTargetPart(player.Character)
            if part then
                local screenPos, onScreen = camera:WorldToViewportPoint(part.Position)
                if onScreen and screenPos.Z > 0 then
                    local dist = (Vector2.new(screenPos.X, screenPos.Y) - aimPos).Magnitude
                    if dist < fovRadius then
                        candidates[#candidates + 1] = {player = player, dist = dist, part = part}
                    end
                end
            end
        end
    end
    
    if cfg.prioritizeclosest then
        table.sort(candidates, function(a, b) return a.dist < b.dist end)
    end
    
    for _, candidate in ipairs(candidates) do
        if fullCheck(candidate.player) then
            if candidate.player ~= currentTarget then
                currentTarget = candidate.player
                targetSwitchTime = now
            end
            return candidate.player, candidate.part.Position
        end
    end
    
    currentTarget = nil
    return nil, nil
end

-- Hook castRay (MÉTODO FUNCIONAL)
local function noUpvals(fn)
    return function(...) return fn(...) end
end

local function setupHook()
    local success, castRayFunc = pcall(function()
        return filtergc("function", {Name = "castRay"}, true)
    end)
    
    if not success or not castRayFunc then 
        warn("❌ Não foi possível encontrar castRay")
        return false 
    end
    
    origCastRay = hookfunction(castRayFunc, noUpvals(function(startPos, targetPos, ...)
        if not cfg.enabled then return origCastRay(startPos, targetPos, ...) end
        
        local closest, closestPos = getClosest(cfg.fov)
        
        if closest and closest.Character then
            local shouldHit = rollHit()
            
            if shouldHit then
                local targetPart = getTargetPart(closest.Character)
                if targetPart then
                    return targetPart, targetPart.Position
                end
            else
                if cfg.missspread > 0 then
                    local targetPart = getTargetPart(closest.Character)
                    if targetPart then
                        local missPos = getMissPos(targetPart.Position)
                        return origCastRay(startPos, missPos, ...)
                    end
                end
            end
        end
        
        return origCastRay(startPos, targetPos, ...)
    end))
    
    print("✅ castRay hooked com sucesso!")
    return true
end

-- Tentar hook
if not setupHook() then
    task.spawn(function()
        for i = 1, 10 do
            task.wait(0.5)
            if setupHook() then
                hooked = true
                break
            end
        end
        if not hooked then
            warn("⚠️ Falha ao hook castRay após 10 tentativas")
        end
    end)
else
    hooked = true
end

-- AutoShoot System
local ShootEvent = ReplicatedStorage:WaitForChild("GunRemotes"):WaitForChild("ShootEvent")

local function getGun()
    local char = LocalPlayer.Character
    if not char then return nil end
    for _, tool in ipairs(char:GetChildren()) do
        if tool:IsA("Tool") and tool:GetAttribute("ToolType") == "Gun" then
            return tool
        end
    end
    return nil
end

local function createBulletTrail(startPos, endPos, isTaser)
    local distance = (endPos - startPos).Magnitude
    local trail = Instance.new("Part")
    trail.Name = "BulletTrail"
    trail.Anchored = true
    trail.CanCollide = false
    trail.CanQuery = false
    trail.CanTouch = false
    trail.Material = Enum.Material.Neon
    trail.Size = Vector3.new(0.1, 0.1, distance)
    trail.CFrame = CFrame.new(startPos, endPos) * CFrame.new(0, 0, -distance / 2)
    trail.Transparency = 0.5
    
    if isTaser then
        trail.BrickColor = BrickColor.new("Cyan")
        trail.Size = Vector3.new(0.2, 0.2, distance)
    else
        trail.BrickColor = BrickColor.Yellow()
    end
    
    trail.Parent = workspace
    Debris:AddItem(trail, isTaser and 0.8 or 0.1)
end

local function autoShoot()
    if not cfg.autoshoot or not cfg.enabled or not currentGun then return end
    
    local now = os.clock()
    local fireRate = currentGun:GetAttribute("FireRate") or cfg.autoshootdelay
    if now - lastAutoShoot < fireRate then return end
    
    local myChar = LocalPlayer.Character
    if not myChar then return end
    local myHead = myChar:FindFirstChild("Head")
    if not myHead then return end
    
    local muzzle = currentGun:FindFirstChild("Muzzle")
    local startPos = muzzle and muzzle.Position or myHead.Position
    
    local target, targetPos = getClosest(cfg.fov)
    if not target or not fullCheck(target) then 
        lastAutoTarget = nil
        return 
    end
    
    if target ~= lastAutoTarget then
        targetAcquiredTime = now
        lastAutoTarget = target
    end
    
    if now - targetAcquiredTime < cfg.autoshootstartdelay then return end
    
    local targetPart = getTargetPart(target.Character)
    if not targetPart then return end
    
    local ammo = currentGun:GetAttribute("Local_CurrentAmmo") or currentGun:GetAttribute("CurrentAmmo") or 0
    if ammo <= 0 then return end
    
    lastAutoShoot = now
    
    local isTaser = currentGun:GetAttribute("Projectile") == "Taser"
    local shouldHit = rollHit()
    
    local projectileCount = currentGun:GetAttribute("ProjectileCount") or 1
    local shots = {}
    
    for i = 1, projectileCount do
        local finalPos
        if shouldHit then
            finalPos = targetPart.Position
        else
            if cfg.missspread > 0 then
                finalPos = getMissPos(targetPart.Position)
            else
                return
            end
        end
        shots[i] = {myHead.Position, finalPos, shouldHit and targetPart or nil}
        createBulletTrail(startPos, finalPos, isTaser)
    end
    
    ShootEvent:FireServer(shots)
    
    local newAmmo = ammo - 1
    currentGun:SetAttribute("Local_CurrentAmmo", newAmmo)
    
    -- Atualizar UI de munição
    if not cachedBulletsLabel then
        local playerGui = LocalPlayer:FindFirstChild("PlayerGui")
        if playerGui then
            local home = playerGui:FindFirstChild("Home")
            if home then
                local hud = home:FindFirstChild("hud")
                if hud then
                    local br = hud:FindFirstChild("BottomRightFrame")
                    if br then
                        local gf = br:FindFirstChild("GunFrame")
                        if gf then
                            cachedBulletsLabel = gf:FindFirstChild("BulletsLabel")
                        end
                    end
                end
            end
        end
    end
    
    if cachedBulletsLabel then
        cachedBulletsLabel.Text = newAmmo .. "/" .. (currentGun:GetAttribute("MaxAmmo") or 30)
    end
    
    -- Som de disparo
    local handle = currentGun:FindFirstChild("Handle")
    if handle then
        local shootSound = handle:FindFirstChild("ShootSound")
        if shootSound then
            local sound = shootSound:Clone()
            sound.Parent = handle
            sound:Play()
            Debris:AddItem(sound, 2)
        end
    end
end

local lastGun = nil

RunService.Heartbeat:Connect(function()
    currentGun = getGun()
    if currentGun ~= lastGun then
        lastAutoShoot = 0
        lastGun = currentGun
    end
    autoShoot()
end)

-- ESP Sistema
local function GetTeamColor(player)
    if not player or not player.Team then
        return Color3.fromRGB(255, 255, 255)
    end
    
    local team = player.Team
    if team == guardsTeam then
        return Color3.fromRGB(0, 150, 255)
    elseif team == inmatesTeam then
        return Color3.fromRGB(255, 150, 0)
    elseif team == criminalsTeam then
        return Color3.fromRGB(255, 0, 0)
    end
    
    return Color3.fromRGB(200, 200, 200)
end

local function CreateESP(player)
    if not drawingSupported or player == LocalPlayer or ESPObjects[player] then return end
    
    local box = {}
    for i = 1, 4 do
        local line = Drawing.new("Line")
        line.Thickness = 2
        line.Transparency = 1
        line.Visible = false
        table.insert(box, line)
    end
    
    ESPObjects[player] = box
end

local function UpdateESP()
    if not drawingSupported or not cfg.esp then
        for _, box in pairs(ESPObjects) do
            for _, line in ipairs(box) do
                line.Visible = false
            end
        end
        return
    end
    
    for player, box in pairs(ESPObjects) do
        if not player or not player.Parent or not player.Character then
            for _, line in ipairs(box) do
                line.Visible = false
            end
            continue
        end
        
        if cfg.espteamcheck and player.Team == LocalPlayer.Team then
            for _, line in ipairs(box) do
                line.Visible = false
            end
            continue
        end
        
        local char = player.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        
        if not hrp or not hum or hum.Health <= 0 then
            for _, line in ipairs(box) do
                line.Visible = false
            end
            continue
        end
        
        local corners = {
            Vector3.new(-1.5, 2.5, 0),
            Vector3.new(1.5, 2.5, 0),
            Vector3.new(-1.5, -2.5, 0),
            Vector3.new(1.5, -2.5, 0)
        }
        
        local screenCorners = {}
        local allVisible = true
        
        for i, offset in ipairs(corners) do
            local worldPos = hrp.Position + offset
            local screenPos, onScreen = Camera:WorldToViewportPoint(worldPos)
            
            if not onScreen then
                allVisible = false
                break
            end
            
            screenCorners[i] = Vector2.new(screenPos.X, screenPos.Y)
        end
        
        if allVisible then
            local color = GetTeamColor(player)
            
            box[1].From = screenCorners[1]
            box[1].To = screenCorners[2]
            box[1].Color = color
            box[1].Visible = true
            
            box[2].From = screenCorners[3]
            box[2].To = screenCorners[4]
            box[2].Color = color
            box[2].Visible = true
            
            box[3].From = screenCorners[1]
            box[3].To = screenCorners[3]
            box[3].Color = color
            box[3].Visible = true
            
            box[4].From = screenCorners[2]
            box[4].To = screenCorners[4]
            box[4].Color = color
            box[4].Visible = true
        else
            for _, line in ipairs(box) do
                line.Visible = false
            end
        end
    end
end

-- Inicializar ESP
for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        CreateESP(player)
        player.CharacterAdded:Connect(function()
            task.wait(0.5)
            CreateESP(player)
        end)
    end
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        task.wait(0.5)
        CreateESP(player)
    end)
end)

-- Update FOV Circle
local function UpdateFOVCircle()
    if not FOVCircle then return end
    
    pcall(function()
        local lastInput = UserInputService:GetLastInputType()
        local locked = (lastInput == Enum.UserInputType.Touch) or (UserInputService.MouseBehavior == Enum.MouseBehavior.LockCenter)
        
        local aimPos
        if locked then
            local viewportSize = Camera.ViewportSize
            aimPos = Vector2.new(viewportSize.X / 2, viewportSize.Y / 2)
        else
            aimPos = UserInputService:GetMouseLocation()
        end
        
        FOVCircle.Position = aimPos
        FOVCircle.Radius = cfg.fov
        FOVCircle.Visible = cfg.showfov and cfg.enabled
        
        local target = getClosest()
        if target then
            FOVCircle.Color = Color3.fromRGB(255, 100, 100)
        else
            FOVCircle.Color = Color3.fromRGB(255, 255, 255)
        end
    end)
end

-- Loop Principal
RunService.RenderStepped:Connect(function()
    UpdateESP()
    UpdateFOVCircle()
end)

-- Interface Rayfield
local Window = Rayfield:CreateWindow({
    Name = "Prison Life | Hybrid v6",
    LoadingTitle = "Carregando...",
    LoadingSubtitle = "Silent Aim + AutoShoot!",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "PrisonLife_Hybrid",
        FileName = "config"
    }
})

Rayfield:Notify({
    Title = "✅ Script Carregado!",
    Content = "Silent Aim + AutoShoot + ESP!",
    Duration = 5
})

-- Aba Combat
local CombatTab = Window:CreateTab("⚔️ Combat", 4483362458)

CombatTab:CreateSection("Silent Aim")

CombatTab:CreateToggle({
    Name = "🎯 Ativar Silent Aim",
    CurrentValue = true,
    Flag = "SilentAim",
    Callback = function(value)
        cfg.enabled = value
        Rayfield:Notify({
            Title = "Silent Aim",
            Content = value and "✅ Ativado" or "❌ Desativado",
            Duration = 2
        })
    end
})

CombatTab:CreateToggle({
    Name = "🔫 AutoShoot",
    CurrentValue = true,
    Flag = "AutoShoot",
    Callback = function(value)
        cfg.autoshoot = value
        Rayfield:Notify({
            Title = "AutoShoot",
            Content = value and "✅ Ativado - Atira automaticamente!" or "❌ Desativado",
            Duration = 3
        })
    end
})

CombatTab:CreateToggle({
    Name = "👥 Team Check",
    CurrentValue = true,
    Flag = "TeamCheck",
    Callback = function(value)
        cfg.teamcheck = value
    end
})

CombatTab:CreateToggle({
    Name = "🧱 Wall Check",
    CurrentValue = true,
    Flag = "WallCheck",
    Callback = function(value)
        cfg.wallcheck = value
    end
})

CombatTab:CreateToggle({
    Name = "🛡️ Shield Breaker",
    CurrentValue = true,
    Flag = "ShieldBreaker",
    Callback = function(value)
        cfg.shieldbreaker = value
    end
})

CombatTab:CreateSlider({
    Name = "🎲 Hit Chance",
    Range = {0, 100},
    Increment = 5,
    Suffix = "%",
    CurrentValue = 100,
    Flag = "HitChance",
    Callback = function(value)
        cfg.hitchance = value
    end
})

CombatTab:CreateSection("FOV Settings")

CombatTab:CreateSlider({
    Name = "⭕ FOV Radius",
    Range = {30, 500},
    Increment = 5,
    Suffix = "px",
    CurrentValue = 150,
    Flag = "FOV",
    Callback = function(value)
        cfg.fov = value
    end
})

CombatTab:CreateToggle({
    Name = "👁️ Mostrar FOV Circle",
    CurrentValue = true,
    Flag = "ShowFOV",
    Callback = function(value)
        cfg.showfov = value
    end
})

CombatTab:CreateSection("AutoShoot Settings")

CombatTab:CreateSlider({
    Name = "⏱️ AutoShoot Delay",
    Range = {0.05, 0.5},
    Increment = 0.01,
    Suffix = "s",
    CurrentValue = 0.12,
    Flag = "AutoShootDelay",
    Callback = function(value)
        cfg.autoshootdelay = value
    end
})

CombatTab:CreateSlider({
    Name = "⏰ Reaction Time (Start Delay)",
    Range = {0, 1},
    Increment = 0.05,
    Suffix = "s",
    CurrentValue = 0.2,
    Flag = "StartDelay",
    Callback = function(value)
        cfg.autoshootstartdelay = value
    end
})

CombatTab:CreateDropdown({
    Name = "🎯 Target Part",
    Options = {"Head", "Torso", "Left Arm", "Right Arm"},
    CurrentOption = "Head",
    Flag = "TargetPart",
    Callback = function(option)
        cfg.aimpart = option
    end
})

-- Aba Visuals
local VisualsTab = Window:CreateTab("👁️ Visuals", 4483362458)

VisualsTab:CreateSection("ESP Configuration")

VisualsTab:CreateToggle({
    Name = "📦 Ativar ESP",
    CurrentValue = true,
    Flag = "ESP",
    Callback = function(value)
        cfg.esp = value
        Rayfield:Notify({
            Title = "ESP",
            Content = value and "✅ Ativado" or "❌ Desativado",
            Duration = 2
        })
    end
})

VisualsTab:CreateToggle({
    Name = "👥 ESP Team Check",
    CurrentValue = true,
    Flag = "ESPTeamCheck",
    Callback = function(value)
        cfg.espteamcheck = value
    end
})

VisualsTab:CreateParagraph({
    Title = "🎨 Cores do ESP",
    Content = "🔵 Azul = Guardas\n🟠 Laranja = Prisioneiros\n🔴 Vermelho = Criminosos"
})

-- Aba Settings
local SettingsTab = Window:CreateTab("⚙️ Settings", 4483362458)

SettingsTab:CreateSection("Debug & Info")

SettingsTab:CreateButton({
    Name = "ℹ️ Status do Hook",
    Callback = function()
        Rayfield:Notify({
            Title = "Hook Status",
            Content = hooked and "✅ castRay Hooked!" or "❌ Hook Falhou",
            Duration = 3
        })
    end
})

SettingsTab:CreateButton({
    Name = "🐛 Teste de Alvo",
    Callback = function()
        local target = getClosest()
        if target then
            Rayfield:Notify({
                Title = "🎯 Alvo Encontrado",
                Content = "Player: " .. target.Name,
                Duration = 3
            })
        else
            Rayfield:Notify({
                Title = "❌ Sem Alvo",
                Content = "Nenhum jogador no FOV",
                Duration = 3
            })
        end
    end
})

SettingsTab:CreateButton({
    Name = "🔫 Status da Arma",
    Callback = function()
        if currentGun then
            local ammo = currentGun:GetAttribute("Local_CurrentAmmo") or currentGun:GetAttribute("CurrentAmmo") or 0
            local maxAmmo = currentGun:GetAttribute("MaxAmmo") or 0
            Rayfield:Notify({
                Title = "🔫 " .. currentGun.Name,
                Content = "Munição: " .. ammo .. "/" .. maxAmmo,
                Duration = 3
            })
        else
            Rayfield:Notify({
                Title = "❌ Sem Arma",
                Content = "Equipe uma arma primeiro",
                Duration = 3
            })
        end
    end
})

SettingsTab:CreateSection("Controles")

SettingsTab:CreateButton({
    Name = "🚪 Fechar Script",
    Callback = function()
        Rayfield:Destroy()
        if FOVCircle then FOVCircle:Remove() end
        for _, box in pairs(ESPObjects) do
            for _, line in ipairs(box) do
                line:Remove()
            end
        end
    end
})

-- Aba Info
local InfoTab = Window:CreateTab("ℹ️ Info", 4483362458)

InfoTab:CreateParagraph({
    Title = "🎯 Silent Aim",
    Content = "O Silent Aim redireciona seus disparos automaticamente para o inimigo mais próximo do centro da tela. Você não precisa mirar perfeitamente!"
})

InfoTab:CreateParagraph({
    Title = "🔫 AutoShoot",
    Content = "Quando ativado, o script atira AUTOMATICAMENTE quando detecta um alvo válido no FOV. Você só precisa olhar na direção geral do inimigo!"
})

InfoTab:CreateParagraph({
    Title = "⚙️ Como Funciona",
    Content = "1. Ative Silent Aim e AutoShoot\n2. Pegue uma arma\n3. Olhe na direção de inimigos\n4. O script mira e atira automaticamente!\n5. Círculo branco = sem alvo\n6. Círculo vermelho = alvo detectado"
})

InfoTab:CreateParagraph({
    Title = "💡 Dicas",
    Content = "• FOV 100-150 é ideal\n• Hit Chance 100% = sempre acerta\n• Reaction Time simula tempo de reação humano\n• AutoShoot Delay controla velocidade de disparo\n• Shield Breaker quebra escudos automaticamente"
})

print("\n✅ PRISON LIFE HYBRID V6 CARREGADO!")
print("🎯 Silent Aim:", hooked and "✅ HOOKED" or "❌ FAILED")
print("🔫 AutoShoot: ✅ READY")
print("👁️ ESP: ✅ READY")
print("⭕ FOV Circle: ✅ READY\n")