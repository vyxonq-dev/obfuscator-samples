local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()

_G.Debug = false

if not _G.Debug then
    _G.Window = OrionLib:MakeWindow({Name = "Beat your meat", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})
else
    _G.Window = OrionLib:MakeWindow({Name = "DebugMode", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})
end

local Tab = _G.Window:MakeTab({
    Name = "Tab 1",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local function AntiRange(Gun)
    local a = require(game:GetService("ReplicatedStorage").Modules.Tools.Gun.Settings[Gun])
    a.NPCProjectileSpeed = 1
end

local function GunMod(GunName)
    local Obj = require(game:GetService("ReplicatedStorage").Modules.Tools.Gun.Settings[GunName])
    Obj.AmmoPerMag = 1000
    Obj.Automatic = true
    Obj.ReloadTime = 0
    Obj.Spread = 0
    Obj.FireRate = 0.1
    Obj.Range = 250
    Obj.Knockback = 0
    Obj.ProjectileSpeed = 500
    Obj.MaxPierce = 999
end

_G.MilitantFarm = false
_G.DarkAges = false
_G.AutoWDM = false

local function CannonDamage(NPC)
    local args = {
        [1] = game.Players.LocalPlayer.Backpack:WaitForChild("Hand Cannon"),
        [2] = NPC
    }
    game:GetService("ReplicatedStorage").Remotes.GunHit:FireServer(unpack(args))
end

local function SimulateAttack()
    local args = {
        [1] = game:GetService("Players").LocalPlayer.Character.Sword,
        [2] = 1
    }
    game:GetService("ReplicatedStorage").Remotes.MeleeAttacked:FireServer(unpack(args))
end

_G.AutoParry = false
_G.AutoSFOTH = false

Tab:AddToggle({
    Name = "AutoParry (face target, hold sword)",
    Callback = function(v)
        _G.AutoParry = v
    end
})

spawn(function()
    while wait() do
        if _G.AutoParry then
            SimulateAttack()
        end
    end
end)

Tab:AddLabel("All auto functions require hand cannon to work.")

Tab:AddToggle({
    Name = "Auto Militant",
    Default = false,
    Callback = function(v)
        _G.MilitantFarm = v
    end
})

Tab:AddToggle({
    Name = "Auto SFOTH",
    Default = false,
    Callback = function(v)
        _G.AutoSFOTH = v
    end
})

spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.AutoSFOTH then
            for i, v in pairs(game.Workspace:GetChildren()) do
                if v.Name:match("Fighter") or table.find({"Sword Master", "Shedletsky"}, v.Name) then
                    CannonDamage(v:WaitForChild("HumanoidRootPart").Position)
                    wait(0.5)
                end
            end
        end
    end)
end)

spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.MilitantFarm then
            for i, v in pairs(game.Workspace:GetChildren()) do
                if table.find({"Meleer Militant", "Gunner Militant", "Grenader Militant", "Medic Militant", "Combatant Militant", "Brute Militant", "Viper", "Juggernaut"}, v.Name) then
                    CannonDamage(v:WaitForChild("HumanoidRootPart").Position)
                    wait(0.5)
                end
            end
        end
    end)
end)

Tab:AddToggle({
    Name = "Auto Dark Ages",
    Default = false,
    Callback = function(v)
        _G.DarkAges = v
    end
})

Tab:AddToggle({
    Name = "Auto Desert",
    Default = false,
    Callback = function(v)
        _G.Desert = v
    end
})

Tab:AddToggle({
    Name = "Auto Park",
    Default = false,
    Callback = function(v)
        _G.Park = v
    end
})

Tab:AddToggle({
    Name = "Auto WDM",
    Default = false,
    Callback = function(v)
        _G.AutoWDM = v
    end
})

spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.AutoWDM then
            local npcFolder = game:GetService("ReplicatedStorage").Miscs.NPCs
            for _, npc in pairs(npcFolder:GetChildren()) do
                if npc.Name:lower():match("destructive") and npc.Name ~= "Slugcat" and not npc.Name:match("Civilian") then
                    local workspaceNPC = game.Workspace:FindFirstChild(npc.Name)
                    if workspaceNPC and workspaceNPC:FindFirstChild("HumanoidRootPart") then
                        CannonDamage(workspaceNPC.HumanoidRootPart.Position)
                        wait(0.5)
                    end
                end
            end
        end
    end)
end)

Tab:AddButton({
    Name = "WIP Button",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "This Button does nothing yet",
            Text = "Error?"
        })
    end
})

local EnemyTargets = {}

Tab:AddDropdown({
    Name = "Enemy Targets",
    Default = "Enemy",
    Options = {"Robloxian", "Angry Robloxian", "Tiny Robloxian", "Gunner Robloxian", "Giant Robloxian", "Rich Robloxian", "Tiny Angry Robloxian", "Raging Robloxian", "Rox The Destroyer", "Crazy Robloxian", "Mummy", "Tiny Mummy", "Fast Mummy", "Strong Mummy", "Sandstone", "Carium", "Camel", "Goblin", "Orc", "Buster Goblin", "Skeleton", "Red Fungus", "Blue Fungus", "Yellow Fungus", "Green Fungus", "Gavin The Wizard", "Adalwolf", "Meleer Militant", "Gunner Militant", "Grenader Militant", "Medic Militant", "Combatant Militant", "Brute Militant", "Viper", "Juggernaut"},
    Callback = function(v)
        table.insert(EnemyTargets, v)
    end
})

_G.KillTargets = false

Tab:AddToggle({
    Name = "AutoKill Targets",
    Default = false,
    Callback = function(v)
        _G.KillTargets = v
    end
})

Tab:AddButton({
    Name = "Clear EnemyTargets",
    Callback = function()
        EnemyTargets = {}
    end
})

spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.KillTargets then
            for i, v in pairs(game.Workspace:GetChildren()) do
                if table.find(EnemyTargets, v.Name) then
                    CannonDamage(v.Torso.Position)
                    wait(0.5)
                end
            end
        end
    end)
end)

spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.Desert then
            for i, v in pairs(game.Workspace:GetChildren()) do
                if table.find({"Mummy", "Fast Mummy", "Strong Mummy", "Sandstone", "Camel", "Carium"}, v.Name) then
                    CannonDamage(v.Torso.Position)
                    wait(0.5)
                end
            end
        end
    end)
end)

spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.Park then
            for i, v in pairs(game.Workspace:GetChildren()) do
                if v.Name:match("Robloxian") or v.Name:match("Rox") then
                    CannonDamage(v.Torso.Position)
                    wait(0.5)
                end
            end
        end
    end)
end)

spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.DarkAges then
            for i, v in pairs(game.Workspace:GetChildren()) do
                if table.find({"Goblin", "Orc", "Buster Goblin", "Skeleton", "Adalwolf", "Gavin The Wizard", "Red Fungus", "Blue Fungus", "Green Fungus", "Yellow Fungus"}, v.Name) then
                    CannonDamage(v.Torso.Position)
                    wait(0.5)
                end
            end
        end
    end)
end)

local Tab2 = _G.Window:MakeTab({
    Name = "Gun Mods",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local path1 = game.ReplicatedStorage.Modules.Tools.Gun.Settings

local OriginalGunSettings = {}

for _, v in pairs(path1:GetChildren()) do
    if v:IsA("ModuleScript") and not table.find({"Minigun", "Suppressor Minigun", "Golden Minigun", "Weedwhacker"}, v.Name) then
        local settings = require(v)
        OriginalGunSettings[v.Name] = {
            ProjectilesPerShot = settings.ProjectilesPerShot or 1,
            ProjectileSpeed = settings.ProjectileSpeed or 100
        }
    end
end

function inf(gun)
    local a = require(path1[gun])
    a.AmmoPerMag = 9999
    a.FireRate = 0.1
    a.Automatic = true
    a.Spread = 1
    a.MaxPierce = 999
end

function BulletBuff(gun)
    local a = require(path1[gun])
    a.ProjectilesPerShot = 30
    a.ProjectileSpeed = 999
end

function RevertBulletBuff(gun)
    local a = require(path1[gun])
    if OriginalGunSettings[gun] then
        a.ProjectilesPerShot = OriginalGunSettings[gun].ProjectilesPerShot
        a.ProjectileSpeed = OriginalGunSettings[gun].ProjectileSpeed
    end
end

function InstaReload(gun)
    local a = require(path1[gun])
    a.ReloadTime = 0
end

local function B2()
    Tab2:AddButton({
        Name = "All Guns inf Ammo + full auto, no spread",
        Callback = function()
            for i, v in pairs(path1:GetChildren()) do
                if v:IsA("ModuleScript") and not table.find({"Minigun", "Suppressor Minigun", "Golden Minigun", "Weedwhacker"}, v.Name) then
                    inf(v.Name)
                end
            end
        end
    })
end

local BulletBuffEnabled = false

Tab2:AddToggle({
    Name = "All guns 30 bullets per shot",
    Default = false,
    Callback = function(Value)
        BulletBuffEnabled = Value
        for i, v in pairs(path1:GetChildren()) do
            if v:IsA("ModuleScript") and not table.find({"Minigun", "Suppressor Minigun", "Golden Minigun", "Weedwhacker"}, v.Name) then
                if Value then
                    BulletBuff(v.Name)
                else
                    RevertBulletBuff(v.Name)
                end
            end
        end
    end
})

local function B3()
    Tab2:AddButton({
        Name = "All Guns InstaReload",
        Callback = function()
            for i, v in pairs(path1:GetChildren()) do
                if v:IsA("ModuleScript") and not table.find({"Minigun", "Suppressor Minigun", "Golden Minigun", "Weedwhacker"}, v.Name) then
                    InstaReload(v.Name)
                end
            end
        end
    })
end

B2()
B3()

Tab2:AddButton({
    Name = "Minigun Buff",
    Callback = function()
        local minigunModules = {
            "Minigun",
            "Suppressor Minigun",
            "Golden Minigun",
            "Weedwhacker"
        }
        for _, gun in ipairs(minigunModules) do
            local a = require(game:GetService("ReplicatedStorage").Modules.Tools.Gun.Settings[gun])
            a.WindUp = 0
            a.AmmoPerMag = 9999
            a.ReloadTime = 0
            a.HeadshotDamageMultiplier = 5
            a.MaxPierce = 50
            a.ProjectilesPerShot = 50
            a.Spread = 1
            a.ProjectileSpeed = 9999
        end
        game.StarterGui:SetCore("SendNotification", {
            Title = "Minigun Buff",
            Text = "Minigun, Suppressor Minigun, Golden Minigun, and Weedwhacker buffed!"
        })
    end
})

Tab2:AddLabel("NPC mods (wip)")

Tab2:AddButton({
    Name = "Disable most enemy guns",
    Callback = function()
        for i, v in pairs(game.ReplicatedStorage.Modules.Tools.Gun.Settings:GetChildren()) do
            if table.find({"EnemyShotgun", "EnemySniperRifle", "EnemyMinigun", "EnemyHuntingRifle"}, v.Name) then
                local a = require(v)
                a.AmmoPerMag = 1
                a.ProjectilesPerShot = 0
                a.ReloadTime = 999
            end
        end
    end
})

local SafeZone = _G.Window:MakeTab({
    Name = "Safezones",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local floatHeight = 1
local holdPosition = false

local safeZones = {
    Park = CFrame.new(14.0842438, 133.564026, 3.3986516),
    Desert = CFrame.new(-3978.21851, 13.8664827, 543.097168),
    ["Dark Ages"] = CFrame.new(-6.92320204, 87.0278168, 5537.1416),
    ["Militant Outpost"] = CFrame.new(-6.01704359, 136.325378, -6152.89893),
    SFOTH = CFrame.new(7998.43896, 98.4540787, 7999.72461)
}

local function freezeplr(position)
    humanoidRootPart.CFrame = position * CFrame.new(0, floatHeight, 0)
    holdPosition = true
    game.RunService.Heartbeat:Connect(function()
        if holdPosition then
            wait()
            humanoidRootPart.CFrame = position * CFrame.new(0, floatHeight, 0)
        end
    end)
end

local function unfreezeplr()
    holdPosition = false
end

local function safezone(zone, enabled)
    if enabled then
        freezeplr(safeZones[zone])
    else
        unfreezeplr()
    end
end

local function newtoggle(zone)
    SafeZone:AddToggle({
        Name = zone,
        Default = false,
        Callback = function(enabled)
            safezone(zone, enabled)
        end
    })
end

SafeZone:AddButton({
    Name = "Cancel Hold",
    Callback = function()
        unfreezeplr()
    end
})

for zone, _ in pairs(safeZones) do
    newtoggle(zone)
end

local sp = _G.Window:MakeTab({
    Name = "AutoSpawn",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local enemies = {}

function SpawnEnemy(EnemyName)
    local args = {
        [1] = EnemyName
    }
    game:GetService("ReplicatedStorage").Remotes.SpawnNPC:InvokeServer(unpack(args))
end

sp:AddTextbox({
    Name = "Enter enemy to autospawn",
    Default = nil,
    Callback = function(v)
        table.insert(enemies, v)
    end
})

local AutoSpawning = false

sp:AddToggle({
    Name = "Spawn Enemies (USES SP)",
    Default = false,
    Callback = function(v)
        AutoSpawning = v
    end
})

spawn(function()
    game.RunService.Heartbeat:Connect(function()
        if AutoSpawning then
            for i, v in ipairs(enemies) do
                SpawnEnemy(v)
            end
        end
    end)
end)

sp:AddButton({
    Name = "Clear Enemies",
    Callback = function()
        table.clear(enemies)
    end
})

local Special = _G.Window:MakeTab({
    Name = "Special",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Special:AddButton({
    Name = "Teleport to wave defense (careful not to be banned)",
    Callback = function()
        game:GetService('TeleportService'):Teleport(15962264362)
    end
})
