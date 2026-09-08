--[[
    Ultimate Script Hub v1.2.5 (Game Update Patch)
    Target: Prison Life
    Status: Stable / OP
    
    Release Notes v1.2.5:
    - CRITICAL FIX: Patched the script to account for a game update that moved all remote events from 'Workspace.Remote' to 'ReplicatedStorage'. This resolves the "Infinite yield" error and fixes dozens of features (Team Changing, Arresting, Tasing, Getting Items, etc.).
    - RESTORED: All features are fully functional on the latest version of Prison Life.
]]

--------------------------------------------------------------------
-- [1] LOADER & LIBRARY SETUP
--------------------------------------------------------------------
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Ultimate Hub v1.2.5",
    LoadingTitle = "Loading Ultimate Hub...",
    LoadingSubtitle = "v1.2.5 - Game Patch",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "UltHub_v125",
        FileName = "HubConfig"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink", 
        RememberJoins = true 
    },
    KeySystem = false, 
    Theme = {
        TextColor = Color3.fromRGB(255, 255, 255),
        Background = Color3.fromRGB(20, 20, 25),
        Topbar = Color3.fromRGB(0, 120, 215),
        AccentColor = Color3.fromRGB(0, 160, 255),
    }
})

--------------------------------------------------------------------
-- [2] SERVICES & VARIABLES
--------------------------------------------------------------------
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextChatService = game:GetService("TextChatService")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()

-- Globals
_G.ArrestRange = 25
_G.KillAuraRange = 25 
_G.AntiArrestRange = 25 
_G.KillAura = false
_G.KA_TargetInmates = true
_G.KA_TargetGuards = true
_G.KA_TargetCriminals = true
_G.AntiArrest = false 
_G.SilentAim = false
_G.ShowFOV = false
_G.FOVRadius = 100
_G.TeamCheck = false
_G.Wallbang = false
_G.AutoKeycard = false
_G.AntiTase = false
_G.AutoSprint = false
_G.CrimFarm = false
_G.AutoRespawn = false
_G.Noclip = false
_G.CarNoclip = false 
_G.Spider = false
_G.FastPunch = false
_G.ArrestAura = false
_G.LoopKillTarget = nil
_G.LoopKill = false
_G.LoopArrest = false
_G.CFrameSpeed = false
_G.CFrameSpeedVal = 1
_G.Jesus = false
_G.AntiVoid = false
_G.AirWalk = false
_G.RainbowGun = false
_G.RainbowArms = false 
_G.GhostGun = false
_G.DarkMatter = false
_G.SpamTase = false
_G.Flying = false
_G.FlySpeed = 20
_G.Crosshair = false
_G.HitboxExpander = false
_G.AntiPunch = false
_G.TouchFling = false
_G.AntiFling = false 
_G.InfJump = false
_G.SpinBot = false
_G.LowGravity = false
_G.StickyFollow = false
_G.TargetESP = false
_G.TargetChatSpam = false
_G.AutoGunMod = false 
_G.CustomGunColor = false
_G.GunColorC3 = Color3.fromRGB(255, 255, 255)
_G.CustomBulletColor = false
_G.BulletColorC3 = Color3.fromRGB(255, 0, 0)

-- Helper: Safe Call
local function SafeCall(func)
    local success, err = pcall(func)
    if not success then warn("[Hub Error]: " .. tostring(err)) end
end

-- Helper: Check if a part belongs to a player character
local function IsPlayerPart(part)
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Character and part:IsDescendantOf(player.Character) then
            return true
        end
    end
    return false
end

-- Helper: Send Chat Message
local function SendChatMessage(message)
    SafeCall(function()
        if TextChatService then
            local channel = TextChatService:FindFirstChild("TextChannels") and TextChatService.TextChannels:FindFirstChild("RBXGeneral")
            if channel then
                channel:SendAsync(message)
            else
                -- Fallback for older chat systems
                ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
            end
        end
    end)
end

-- Helper: Nuke Barriers
local function NukeMapBarriers()
    SafeCall(function()
        local destroyedCount = 0
        local barrierNames = {"door", "fence", "window", "bars", "gate", "glass"}
        for _, v in pairs(Workspace:GetDescendants()) do
            if v:IsA("BasePart") and not v.Locked then
                local nameLower = v.Name:lower()
                for _, barrierName in ipairs(barrierNames) do
                    if nameLower:find(barrierName) then
                        v:Destroy()
                        destroyedCount = destroyedCount + 1
                        break
                    end
                end
            end
        end
        Rayfield:Notify({
            Title = "Nuke Complete",
            Content = "Destroyed " .. tostring(destroyedCount) .. " barriers.",
            Duration = 3
        })
    end)
end

-- Helper: One Shot Punch Modifier
local function MakePunchesDeadly()
    SafeCall(function()
        local Module = ReplicatedStorage:FindFirstChild("Modules") and ReplicatedStorage.Modules:FindFirstChild("ItemState")
        if Module then
            local m = require(Module)
            if m["Fists"] then
                m["Fists"].Damage = math.huge
                m["Fists"].MaxDamage = math.huge
                m["Fists"].PunchCooldown = 0 
            end
        end
    end)
end

-- Helper: Force Neutral (Enables Friendly Fire)
local function ForceNeutral()
    SafeCall(function()
        if LocalPlayer.Team.Name ~= "Medium stone grey" then
            ReplicatedStorage.TeamEvent:FireServer("Medium stone grey")
        end
    end)
end

-- Visuals Assets
local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 2
FOVCircle.NumSides = 24
FOVCircle.Filled = false
FOVCircle.Transparency = 1
FOVCircle.Color = Color3.fromRGB(255, 0, 0)
FOVCircle.Visible = false

local CrosshairX = Drawing.new("Line")
local CrosshairY = Drawing.new("Line")
CrosshairX.Thickness = 1
CrosshairX.Color = Color3.new(0, 1, 0)
CrosshairX.Visible = false
CrosshairY.Thickness = 1
CrosshairY.Color = Color3.new(0, 1, 0)
CrosshairY.Visible = false

local TargetHighlight = Instance.new("Highlight")
TargetHighlight.FillColor = Color3.fromRGB(255, 0, 0)
TargetHighlight.OutlineColor = Color3.fromRGB(255, 255, 255)
TargetHighlight.FillTransparency = 0.5
TargetHighlight.OutlineTransparency = 0

--------------------------------------------------------------------
-- [3] TABS CONFIGURATION
--------------------------------------------------------------------
local HomeTab = Window:CreateTab("Home", 5025944565)
local CombatTab = Window:CreateTab("Combat", 4895977824)
local TargetTab = Window:CreateTab("Target / Snipe", 4895977824)
local PoliceTab = Window:CreateTab("Police", 6033424657)
local InmatesTab = Window:CreateTab("Inmates", 6033424657)
local CrimTab = Window:CreateTab("Criminals", 6033424657)
local PlayerTab = Window:CreateTab("Player", 4895977824)
local VisualsTab = Window:CreateTab("Visuals", 4483362458)
local TeleportTab = Window:CreateTab("Teleport", 4895977824)
local VehicleTab = Window:CreateTab("Vehicles", 4895977824)
local WorldTab = Window:CreateTab("World", 4895977824)
local GodTab = Window:CreateTab("God Mode", 4483362458)
local TrollTab = Window:CreateTab("Troll", 4483362458)
local UtilityTab = Window:CreateTab("Utility", 4483362458)
local ServersTab = Window:CreateTab("Servers", 4483362458)
local SystemTab = Window:CreateTab("System", 4483362458)

--------------------------------------------------------------------
-- [4] HOME TAB
--------------------------------------------------------------------
HomeTab:CreateSection("Information")
HomeTab:CreateParagraph({Title = "Welcome", Content = "Ultimate Script Hub v1.2.5 is loaded."})
HomeTab:CreateParagraph({Title = "Status", Content = "All Systems Stable | Game Update Patched"})
HomeTab:CreateSection("Credits")
HomeTab:CreateLabel("Script by Ultimate Hub Team")

--------------------------------------------------------------------
-- [5] UTILITY TAB
--------------------------------------------------------------------
UtilityTab:CreateSection("Inventory")

UtilityTab:CreateButton({
    Name = "Equip All Tools",
    Callback = function()
        SafeCall(function()
            for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
                if tool:IsA("Tool") then tool.Parent = LocalPlayer.Character end
            end
        end)
    end
})

UtilityTab:CreateButton({
    Name = "Drop All Tools",
    Callback = function()
        SafeCall(function()
            for _, tool in pairs(LocalPlayer.Character:GetChildren()) do
                if tool:IsA("Tool") then tool.Parent = workspace end
            end
            for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
                if tool:IsA("Tool") then tool.Parent = workspace end
            end
        end)
    end
})

UtilityTab:CreateSection("Mouse Tools")

local DeleteToolConnection = nil
UtilityTab:CreateToggle({
    Name = "Delete Tool (Ctrl + Click)",
    CurrentValue = false,
    Callback = function(s)
        if s then
            DeleteToolConnection = Mouse.Button1Down:Connect(function()
                SafeCall(function()
                    if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) and Mouse.Target then
                        Mouse.Target:Destroy()
                    end
                end)
            end)
        else
            if DeleteToolConnection then DeleteToolConnection:Disconnect() DeleteToolConnection = nil end
        end
    end,
})

local ClickTPConnection = nil
UtilityTab:CreateToggle({
    Name = "Click TP (Ctrl + Click)",
    CurrentValue = false,
    Callback = function(s)
        if s then
            ClickTPConnection = Mouse.Button1Down:Connect(function()
                SafeCall(function()
                    if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
                        local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            hrp.CFrame = CFrame.new(Mouse.Hit.p + Vector3.new(0, 3, 0))
                        end
                    end
                end)
            end)
        else
            if ClickTPConnection then ClickTPConnection:Disconnect() ClickTPConnection = nil end
        end
    end,
})

--------------------------------------------------------------------
-- [6] SERVERS TAB
--------------------------------------------------------------------
ServersTab:CreateSection("Server Control")

ServersTab:CreateButton({
    Name = "Rejoin Server",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
    end
})

ServersTab:CreateButton({
    Name = "Random Server Hop",
    Callback = function()
        SafeCall(function()
            local Servers = "https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"
            local function List(cursor)
                return game:GetService("HttpService"):JSONDecode(game:HttpGet(Servers .. ((cursor and "&cursor="..cursor) or "")))
            end
            local S, N;
            repeat
                local D = List(N)
                if #D.data > 0 then
                    S = D.data[math.random(1, #D.data)]
                end
                N = D.nextPageCursor
            until S or not N
            if S then
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, S.id, LocalPlayer)
            end
        end)
    end,
})

--------------------------------------------------------------------
-- [7] COMBAT TAB
--------------------------------------------------------------------
CombatTab:CreateSection("Defense")

CombatTab:CreateToggle({
    Name = "Anti-Arrest (Smart Repel)",
    Callback = function(s)
        _G.AntiArrest = s
        task.spawn(function()
            while _G.AntiArrest do
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    for _, v in pairs(Players:GetPlayers()) do
                        if v ~= LocalPlayer and v.Team and v.Team.Name == "Guards" and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
                            if v.Character:FindFirstChild("Handcuffs") then
                                local MyPos = LocalPlayer.Character.HumanoidRootPart.Position
                                local GuardPos = v.Character.HumanoidRootPart.Position
                                local Dist = (MyPos - GuardPos).Magnitude
                                
                                if Dist <= _G.AntiArrestRange then
                                    local Direction = (MyPos - GuardPos).Unit
                                    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(MyPos + (Direction * 5))
                                    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.lookAt(LocalPlayer.Character.HumanoidRootPart.Position, GuardPos)
                                end
                            end
                        end
                    end
                end
                RunService.Heartbeat:Wait()
            end
        end)
    end
})

CombatTab:CreateSlider({
    Name="Anti-Arrest Range", 
    Range={10, 50}, 
    Increment=1, 
    CurrentValue=25, 
    Callback=function(v) _G.AntiArrestRange = v end
})

CombatTab:CreateSection("Kill Aura")

CombatTab:CreateToggle({
    Name = "Kill Aura (Kill All Teams)",
    CurrentValue = false,
    Callback = function(s) 
        _G.KillAura = s
        if s then
            task.spawn(function()
                while _G.KillAura do
                    ForceNeutral()
                    MakePunchesDeadly()
                    local MeleeEvent = ReplicatedStorage:FindFirstChild("meleeEvent")
                    
                    if MeleeEvent then
                        for _, v in pairs(Players:GetPlayers()) do
                            if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
                                local MyRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                                local TargetRoot = v.Character:FindFirstChild("HumanoidRootPart")
                                
                                if MyRoot and TargetRoot then
                                    local dist = (MyRoot.Position - TargetRoot.Position).Magnitude
                                    if dist <= _G.KillAuraRange then
                                        local shouldHit = false
                                        local tName = v.Team and v.Team.Name or "Neutral"

                                        if tName == "Prisoners" and _G.KA_TargetInmates then shouldHit = true end
                                        if tName == "Guards" and _G.KA_TargetGuards then shouldHit = true end
                                        if tName == "Criminals" and _G.KA_TargetCriminals then shouldHit = true end
                                        if tName == "Medium stone grey" then shouldHit = true end -- Neutral team name
                                        
                                        if shouldHit then
                                            for i = 1, 5 do
                                                MeleeEvent:FireServer(v)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                    task.wait()
                end
            end)
        end
    end
})

CombatTab:CreateSlider({
    Name="Hit Range", 
    Range={1, 100}, 
    Increment=1, 
    CurrentValue=25, 
    Callback=function(v) _G.KillAuraRange = v end
})

CombatTab:CreateToggle({Name="Kill Inmates", CurrentValue=true, Callback=function(s) _G.KA_TargetInmates=s end})
CombatTab:CreateToggle({Name="Kill Guards", CurrentValue=true, Callback=function(s) _G.KA_TargetGuards=s end})
CombatTab:CreateToggle({Name="Kill Criminals", CurrentValue=true, Callback=function(s) _G.KA_TargetCriminals=s end})

CombatTab:CreateSection("Meta Features")

CombatTab:CreateToggle({
    Name = "SpinBot",
    Callback = function(s)
        _G.SpinBot = s
        task.spawn(function()
            while _G.SpinBot do
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(50), 0)
                end
                RunService.RenderStepped:Wait()
            end
        end)
    end
})

CombatTab:CreateToggle({
    Name = "Hitbox Expander (Big Heads)",
    Callback = function(s)
        _G.HitboxExpander = s
        task.spawn(function()
            while _G.HitboxExpander do
                for _, v in pairs(Players:GetPlayers()) do
                    if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Head") then
                        v.Character.Head.Size = Vector3.new(4,4,4)
                        v.Character.Head.Transparency = 0.5
                        v.Character.Head.CanCollide = false
                    end
                end
                task.wait(1)
            end
        end)
    end
})

CombatTab:CreateToggle({
    Name = "Anti-Punch (Kill Attacker)",
    Callback = function(s)
        _G.AntiPunch = s
        task.spawn(function()
            local lastHealth = 100
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                lastHealth = LocalPlayer.Character.Humanoid.Health
            end
            
            while _G.AntiPunch do
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                    local currentHealth = LocalPlayer.Character.Humanoid.Health
                    if currentHealth < lastHealth then
                        local closest = nil
                        local minDist = 15
                        for _, v in pairs(Players:GetPlayers()) do
                            if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                                local d = (LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
                                if d < minDist then
                                    minDist = d
                                    closest = v
                                end
                            end
                        end
                        if closest then
                            MakePunchesDeadly()
                            for i=1, 5 do 
                                SafeCall(function()
                                    ReplicatedStorage.meleeEvent:FireServer(closest) 
                                end)
                            end
                            Rayfield:Notify({Title="Anti-Punch", Content="Killed "..closest.Name, Duration=1})
                        end
                    end
                    lastHealth = currentHealth
                end
                task.wait(0.1)
            end
        end)
    end
})

CombatTab:CreateSection("Weapon Mods")

CombatTab:CreateToggle({
    Name = "Auto-Mod Guns (On Pickup)",
    Callback = function(s) 
        _G.AutoGunMod = s
        task.spawn(function()
            while _G.AutoGunMod do
                SafeCall(function()
                    local m = require(game.ReplicatedStorage.Modules.ItemState)
                    for i, v in pairs(m) do
                        if v.MaxAmmo then
                            v.MaxAmmo = math.huge
                            v.CurrentAmmo = math.huge
                            v.StoredAmmo = math.huge
                            v.FireRate = 0.04
                            v.Spread = 0
                            v.Range = math.huge
                            v.Bullets = 1
                            v.ReloadTime = 0.01
                            v.Auto = true
                            v.Reloading = false
                        end
                    end
                end)
                task.wait(1)
            end
        end)
    end
})

CombatTab:CreateButton({
    Name = "Un-Jam Guns (Fix Stuck Guns)",
    Callback = function()
        SafeCall(function()
            local m = require(game.ReplicatedStorage.Modules.ItemState)
            for i, v in pairs(m) do
                if v.Reloading ~= nil then v.Reloading = false end
                if v.CurrentAmmo == 0 and v.MaxAmmo then v.CurrentAmmo = v.MaxAmmo end
            end
            Rayfield:Notify({Title="Fixed", Content="Guns Un-Jammed.", Duration=1})
        end)
    end
})

CombatTab:CreateButton({
    Name = "Mod All Guns (Manual)",
    Callback = function() 
        SafeCall(function()
            local m = require(game.ReplicatedStorage.Modules.ItemState)
            for i, v in pairs(m) do
                if v.MaxAmmo then
                    v.MaxAmmo = math.huge
                    v.CurrentAmmo = math.huge
                    v.StoredAmmo = math.huge
                    v.FireRate = 0.04 
                    v.Spread = 0
                    v.Range = math.huge
                    v.Bullets = 1
                    v.ReloadTime = 0.01
                    v.Auto = true
                    v.Reloading = false
                end
            end
            Rayfield:Notify({Title="Success", Content="Guns Modded! Re-equip if holding one.", Duration=3})
        end)
    end
})

CombatTab:CreateToggle({
    Name = "No Recoil",
    Callback = function(s)
        _G.NoRecoil = s
        task.spawn(function()
            while _G.NoRecoil do
                SafeCall(function()
                    local m = require(game.ReplicatedStorage.Modules.ItemState)
                    for i, v in pairs(m) do 
                        if v.Recoil then v.Recoil = 0 end 
                    end
                end)
                task.wait(1)
            end
        end)
    end
})

CombatTab:CreateButton({
    Name = "Super Knife (One Shot)",
    Callback = function() 
        SafeCall(function()
            local m = require(game.ReplicatedStorage.Modules.ItemState)
            if m["Crude Knife"] then
                m["Crude Knife"].Damage = 2000
                m["Crude Knife"].MaxDamage = 2000
                Rayfield:Notify({Title="Success", Content="Knife is now One-Shot!", Duration=2})
            end
        end)
    end
})

CombatTab:CreateToggle({
    Name = "Machine Gun Punch",
    Callback = function(s) 
        _G.FastPunch = s
        task.spawn(function()
            while _G.FastPunch do
                SafeCall(function()
                    local m = require(game.ReplicatedStorage.Modules.ItemState)
                    if m["Fists"] then m["Fists"].PunchCooldown = 0 end
                end)
                task.wait(1)
            end
        end)
    end
})

CombatTab:CreateToggle({
    Name = "Spam Tase Aura",
    Callback = function(s)
        _G.SpamTase = s
        task.spawn(function()
            while _G.SpamTase do
                for _,v in pairs(Players:GetPlayers()) do
                    if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Head") then
                         ReplicatedStorage.tase:FireServer(v.Character.Head)
                    end
                end
                task.wait(0.1)
            end
        end)
    end
})

CombatTab:CreateSection("Silent Aim & Wallbang")

local function GetSilentTarget()
    local Target = nil
    local MinDist = _G.FOVRadius
    local MousePos = UserInputService:GetMouseLocation()

    for _, v in pairs(Players:GetPlayers()) do
        if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Head") then
            if _G.TeamCheck and v.Team == LocalPlayer.Team then continue end
            
            local Pos, OnScreen = Camera:WorldToViewportPoint(v.Character.Head.Position)
            if OnScreen then
                local Dist = (Vector2.new(Pos.X, Pos.Y) - MousePos).Magnitude
                if Dist < MinDist then
                    MinDist = Dist
                    Target = v
                end
            end
        end
    end
    return Target
end

RunService.RenderStepped:Connect(function()
    FOVCircle.Position = UserInputService:GetMouseLocation()
    FOVCircle.Radius = _G.FOVRadius
    FOVCircle.Visible = _G.ShowFOV
    
    if _G.SilentAim then
        local Target = GetSilentTarget()
        if Target and Target.Character then
            TargetHighlight.Parent = Target.Character
        else
            TargetHighlight.Parent = nil
        end
    else
        TargetHighlight.Parent = nil
    end
end)

Mouse.Button1Down:Connect(function()
    if (_G.SilentAim or _G.Wallbang) and LocalPlayer.Character:FindFirstChildOfClass("Tool") then
        local Target = GetSilentTarget()
        if Target and Target.Character and Target.Character:FindFirstChild("Head") then
            local Gun = LocalPlayer.Character:FindFirstChildOfClass("Tool")
            local Origin = Gun.Handle.CFrame.p
            local Destination = Target.Character.Head.Position
            
            local Args = {
                [1] = {
                    [1] = {
                        ['Hit'] = Target.Character.Head,
                        ['RayObject'] = Ray.new(Origin, (Destination - Origin).Unit * 1000),
                        ['Distance'] = (Destination - Origin).Magnitude,
                        ['Cframe'] = CFrame.new(Origin, Destination)
                    }
                },
                [2] = Gun
            }
            ReplicatedStorage.ShootEvent:FireServer(unpack(Args))
        end
    end
end)

CombatTab:CreateToggle({Name="Silent Aim", Callback=function(s) _G.SilentAim = s end})
CombatTab:CreateToggle({Name="Wallbang (Manual)", Callback=function(s) _G.Wallbang = s end})
CombatTab:CreateToggle({Name="Show FOV", Callback=function(s) _G.ShowFOV = s end})
CombatTab:CreateToggle({Name="Team Check", Callback=function(s) _G.TeamCheck = s end})
CombatTab:CreateSlider({Name="FOV Radius", Range={10, 800}, Increment=1, CurrentValue=100, Flag="FOVRadius", Callback=function(v) _G.FOVRadius = v end})

--------------------------------------------------------------------
-- [8] TARGET / STREAM SNIPE TAB
--------------------------------------------------------------------
local PlayerList = {}
local function RefreshPlayers()
    PlayerList = {}
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= LocalPlayer then table.insert(PlayerList, v.Name) end
    end
end
RefreshPlayers()

local TargetDropdown = TargetTab:CreateDropdown({
    Name = "Select Target / Streamer",
    Options = PlayerList,
    CurrentValue = "",
    Callback = function(v)
        _G.LoopKillTarget = v
    end
})

TargetTab:CreateButton({
    Name = "Refresh Player List",
    Callback = function()
        RefreshPlayers()
        TargetDropdown:Refresh(PlayerList)
    end
})

TargetTab:CreateSection("Stream Sniper Tools")

local SnipeLine = Drawing.new("Line")
SnipeLine.Thickness = 2
SnipeLine.Color = Color3.fromRGB(255, 0, 0)
SnipeLine.Transparency = 1

local stickyFollowConnection = nil
TargetTab:CreateToggle({
    Name = "Sticky Follow (Stalk Mode)",
    Callback = function(s)
        _G.StickyFollow = s
        if s then
            stickyFollowConnection = RunService.RenderStepped:Connect(function()
                if _G.StickyFollow and _G.LoopKillTarget and Players:FindFirstChild(_G.LoopKillTarget) then
                    local target = Players[_G.LoopKillTarget]
                    if target.Character and target.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 4)
                    end
                end
            end)
        else
            if stickyFollowConnection then
                stickyFollowConnection:Disconnect()
                stickyFollowConnection = nil
            end
        end
    end
})

TargetTab:CreateToggle({
    Name = "Target ESP (Sniper Vision)",
    Callback = function(s)
        _G.TargetESP = s
        task.spawn(function()
            local HL = Instance.new("Highlight")
            HL.Name = "SniperHighlight"
            HL.FillColor = Color3.fromRGB(255, 0, 0)
            HL.OutlineColor = Color3.fromRGB(255, 255, 255)
            HL.FillTransparency = 0.5
            
            while _G.TargetESP do
                if _G.LoopKillTarget and Players:FindFirstChild(_G.LoopKillTarget) then
                    local target = Players[_G.LoopKillTarget]
                    if target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                        HL.Parent = target.Character
                        local vec, screen = Camera:WorldToViewportPoint(target.Character.HumanoidRootPart.Position)
                        if screen then
                            SnipeLine.Visible = true
                            SnipeLine.From = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y)
                            SnipeLine.To = Vector2.new(vec.X, vec.Y)
                        else
                            SnipeLine.Visible = false
                        end
                    else
                        HL.Parent = nil
                        SnipeLine.Visible = false
                    end
                else
                    HL.Parent = nil
                    SnipeLine.Visible = false
                end
                RunService.RenderStepped:Wait()
            end
            HL:Destroy()
            SnipeLine.Visible = false
        end)
    end
})

TargetTab:CreateToggle({
    Name = "Chat Harass (Spam Name)",
    Callback = function(s)
        _G.TargetChatSpam = s
        task.spawn(function()
            while _G.TargetChatSpam do
                if _G.LoopKillTarget then
                    local msg = "@" .. _G.LoopKillTarget .. " I AM WATCHING YOU"
                    SendChatMessage(msg)
                end
                task.wait(2.5)
            end
        end)
    end
})

TargetTab:CreateSection("Target Actions")

TargetTab:CreateToggle({
    Name = "Loop Kill Target",
    Callback = function(s)
        _G.LoopKill = s
        task.spawn(function()
            while _G.LoopKill do
                if _G.LoopKillTarget and Players:FindFirstChild(_G.LoopKillTarget) then
                    local t = Players[_G.LoopKillTarget]
                    if t.Character and t.Character:FindFirstChild("Head") then
                         ReplicatedStorage.meleeEvent:FireServer(t)
                    end
                end
                task.wait(0.1)
            end
        end)
    end
})

TargetTab:CreateToggle({
    Name = "Loop Arrest Target",
    Callback = function(s)
        _G.LoopArrest = s
        task.spawn(function()
            while _G.LoopArrest do
                if _G.LoopKillTarget and Players:FindFirstChild(_G.LoopKillTarget) then
                    local t = Players[_G.LoopKillTarget]
                    if t.Character and t.Character:FindFirstChild("Head") and t.Character:FindFirstChild("HumanoidRootPart") then
                        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            local old = LocalPlayer.Character.HumanoidRootPart.CFrame
                            LocalPlayer.Character.HumanoidRootPart.CFrame = t.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,1)
                            task.wait(0.1)
                            ReplicatedStorage.arrest:InvokeServer(t.Character.Head)
                            LocalPlayer.Character.HumanoidRootPart.CFrame = old
                        end
                    end
                end
                task.wait(1.5)
            end
        end)
    end
})

TargetTab:CreateButton({
    Name = "Spectate Target",
    Callback = function()
        if _G.LoopKillTarget and Players:FindFirstChild(_G.LoopKillTarget) and Players[_G.LoopKillTarget].Character and Players[_G.LoopKillTarget].Character:FindFirstChildOfClass("Humanoid") then
            Camera.CameraSubject = Players[_G.LoopKillTarget].Character.Humanoid
        end
    end
})

TargetTab:CreateButton({
    Name = "Stop Spectating",
    Callback = function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            Camera.CameraSubject = LocalPlayer.Character.Humanoid
        end
    end
})

TargetTab:CreateButton({
    Name = "View Player",
    Callback = function()
        if _G.LoopKillTarget and Players[_G.LoopKillTarget] and Players[_G.LoopKillTarget].Character and Players[_G.LoopKillTarget].Character:FindFirstChildOfClass("Humanoid") then
            Camera.CameraSubject = Players[_G.LoopKillTarget].Character.Humanoid
        end
    end
})

TargetTab:CreateButton({
    Name = "Goto Player",
    Callback = function()
        if _G.LoopKillTarget and Players[_G.LoopKillTarget] and Players[_G.LoopKillTarget].Character and Players[_G.LoopKillTarget].Character:FindFirstChild("HumanoidRootPart") then
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character.HumanoidRootPart.CFrame = Players[_G.LoopKillTarget].Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
            end
        end
    end
})

TargetTab:CreateButton({
    Name = "Fling Target",
    Callback = function()
        if _G.LoopKillTarget and Players[_G.LoopKillTarget] and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local t = Players[_G.LoopKillTarget]
            if t.Character and t.Character:FindFirstChild("HumanoidRootPart") then
                local old = LocalPlayer.Character.HumanoidRootPart.CFrame
                local b = Instance.new("BodyAngularVelocity", LocalPlayer.Character.HumanoidRootPart)
                b.AngularVelocity = Vector3.new(0,9999,0)
                b.MaxTorque = Vector3.new(0,math.huge,0)
                for i = 1, 10 do
                    LocalPlayer.Character.HumanoidRootPart.CFrame = t.Character.HumanoidRootPart.CFrame
                    task.wait(0.1)
                end
                b:Destroy()
                LocalPlayer.Character.HumanoidRootPart.CFrame = old
            end
        end
    end
})

--------------------------------------------------------------------
-- [9] POLICE TAB
--------------------------------------------------------------------
PoliceTab:CreateSection("Team")
PoliceTab:CreateButton({Name="Join Guards", Callback=function() ReplicatedStorage.TeamEvent:FireServer("Bright blue") end})

PoliceTab:CreateButton({
    Name = "Force Join Guards (Bypass)",
    Callback = function()
        local i = 0
        repeat
            ReplicatedStorage.TeamEvent:FireServer("Bright blue")
            i = i + 1
            task.wait(0.1)
        until (LocalPlayer.Team and LocalPlayer.Team.Name == "Guards") or i > 50
    end
})

PoliceTab:CreateSection("Gear")
local ClickArrestTool = nil
PoliceTab:CreateToggle({
    Name = "Click Arrest (Tool)",
    Callback = function(s) 
        if s then
            ClickArrestTool = Instance.new("Tool", LocalPlayer.Backpack)
            ClickArrestTool.Name = "ClickArrest"
            ClickArrestTool.RequiresHandle = false
            ClickArrestTool.Activated:Connect(function()
                local Target = Mouse.Target
                if Target and Target.Parent and Target.Parent:FindFirstChild("Head") then
                    ReplicatedStorage.arrest:InvokeServer(Target.Parent.Head)
                end
            end)
        else
            if LocalPlayer.Backpack:FindFirstChild("ClickArrest") then 
                LocalPlayer.Backpack.ClickArrest:Destroy() 
            end
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("ClickArrest") then
                LocalPlayer.Character.ClickArrest:Destroy()
            end
        end
    end
})

PoliceTab:CreateButton({Name="Get Riot Shield", Callback=function() if workspace.Prison_ITEMS.giver:FindFirstChild("Riot Shield") then ReplicatedStorage.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Riot Shield"].ITEMPICKUP) end end})
PoliceTab:CreateButton({Name="Get Taser", Callback=function() local r=ReplicatedStorage.ItemHandler; if workspace.Prison_ITEMS.giver:FindFirstChild("Taser") then r:InvokeServer(workspace.Prison_ITEMS.giver["Taser"].ITEMPICKUP) end end})
PoliceTab:CreateButton({Name="Get M4A1", Callback=function() local r=ReplicatedStorage.ItemHandler; if workspace.Prison_ITEMS.giver:FindFirstChild("M4A1") then r:InvokeServer(workspace.Prison_ITEMS.giver["M4A1"].ITEMPICKUP) end end})
PoliceTab:CreateButton({Name="Get Remington 870", Callback=function() local r=ReplicatedStorage.ItemHandler; if workspace.Prison_ITEMS.giver:FindFirstChild("Remington 870") then r:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP) end end})
PoliceTab:CreateButton({Name="Get All Guns", Callback=function() local r=ReplicatedStorage.ItemHandler; local g=workspace.Prison_ITEMS.giver; for _,v in pairs({"M9","AK-47","M4A1","Remington 870"}) do if g:FindFirstChild(v) then r:InvokeServer(g[v].ITEMPICKUP) end end end})

PoliceTab:CreateSection("Arrest Aura")
PoliceTab:CreateToggle({
    Name = "Arrest Aura (Auto Arrest)",
    Callback = function(s)
        _G.ArrestAura = s
        task.spawn(function()
            while _G.ArrestAura do
                for _, v in pairs(Players:GetPlayers()) do
                    if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("HumanoidRootPart") and v.Team and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        if (LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude < _G.ArrestRange then
                            if v.Team.Name == "Criminals" or v.Team.Name == "Prisoners" then 
                                ReplicatedStorage.arrest:InvokeServer(v.Character.Head) 
                            end
                        end
                    end
                end
                task.wait(0.1)
            end
        end)
    end
})

PoliceTab:CreateSlider({
    Name="Arrest Range", 
    Range={10, 200}, 
    Increment=1, 
    CurrentValue=25, 
    Callback=function(v) _G.ArrestRange = v end
})

PoliceTab:CreateToggle({
    Name = "Arrest All (Teleport)",
    Callback = function(s)
        _G.ArrestAll = s
        task.spawn(function()
            while _G.ArrestAll do
                for _, v in pairs(Players:GetPlayers()) do
                    if not _G.ArrestAll then break end
                    if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("HumanoidRootPart") and v.Team and (v.Team.Name == "Criminals" or v.Team.Name == "Prisoners") then
                        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            local oldCFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
                            LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
                            task.wait(0.1)
                            ReplicatedStorage.arrest:InvokeServer(v.Character.Head)
                            task.wait(0.1)
                            LocalPlayer.Character.HumanoidRootPart.CFrame = oldCFrame
                        end
                    end
                end
                task.wait()
            end
        end)
    end
})

PoliceTab:CreateButton({
    Name = "Tase All (Guard Only)",
    Callback = function() 
        if LocalPlayer.Team and LocalPlayer.Team.Name == "Guards" then
            for _, v in pairs(Players:GetPlayers()) do
                if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Head") and v.Team and (v.Team.Name == "Prisoners" or v.Team.Name == "Criminals") then
                    ReplicatedStorage.tase:FireServer(v.Character.Head)
                end
            end
        else
            Rayfield:Notify({Title="Error", Content="You must be a Guard!", Duration=2})
        end
    end
})

--------------------------------------------------------------------
-- [10] INMATES TAB
--------------------------------------------------------------------
InmatesTab:CreateSection("Team")
InmatesTab:CreateButton({Name="Join Prisoners", Callback=function() ReplicatedStorage.TeamEvent:FireServer("Bright orange") end})
InmatesTab:CreateButton({Name="Join Neutral", Callback=function() ReplicatedStorage.TeamEvent:FireServer("Medium stone grey") end})

InmatesTab:CreateSection("Gear")
InmatesTab:CreateButton({Name="Get Knife", Callback=function() local r=ReplicatedStorage.ItemHandler; if r and workspace.Prison_ITEMS.single:FindFirstChild("Crude Knife") then r:InvokeServer(workspace.Prison_ITEMS.single["Crude Knife"].ITEMPICKUP) end end})
InmatesTab:CreateButton({Name="Get M9", Callback=function() local r=ReplicatedStorage.ItemHandler; if r and workspace.Prison_ITEMS.giver:FindFirstChild("M9") then r:InvokeServer(workspace.Prison_ITEMS.giver["M9"].ITEMPICKUP) end end})
InmatesTab:CreateButton({Name="Get All Guns", Callback=function() local r=ReplicatedStorage.ItemHandler; local g=workspace.Prison_ITEMS.giver; for _,v in pairs({"M9","AK-47","M4A1","Remington 870"}) do if g:FindFirstChild(v) and r then r:InvokeServer(g[v].ITEMPICKUP) end end end})

InmatesTab:CreateToggle({
    Name = "Auto Keycard (Get/Keep)",
    Callback = function(s) 
        _G.AutoKeycard = s
        task.spawn(function() 
            while _G.AutoKeycard do 
                if workspace:FindFirstChild("Key card") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then 
                    workspace["Key card"].CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame 
                end 
                task.wait(0.5) 
            end 
        end) 
    end
})

InmatesTab:CreateSection("Exploits")

InmatesTab:CreateButton({
    Name = "Nuke Map Barriers (Doors/Fences/Windows)",
    Callback = NukeMapBarriers
})

--------------------------------------------------------------------
-- [11] CRIMINALS TAB
--------------------------------------------------------------------
CrimTab:CreateSection("Team")
CrimTab:CreateButton({
    Name = "Join Criminals",
    Callback = function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local old = LocalPlayer.Character.HumanoidRootPart.CFrame
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-919, 95, 2138)
            task.wait(0.5)
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-943, 94, 2055)
            task.wait(0.5)
            LocalPlayer.Character.HumanoidRootPart.CFrame = old 
        end
    end
})

CrimTab:CreateButton({Name="Get All Guns", Callback=function() local r=ReplicatedStorage.ItemHandler; local g=workspace.Prison_ITEMS.giver; for _,v in pairs({"M9","AK-47","M4A1","Remington 870"}) do if g:FindFirstChild(v) and r then r:InvokeServer(g[v].ITEMPICKUP) end end end})

CrimTab:CreateToggle({
    Name = "Criminal Auto-Farm",
    Callback = function(s) 
        _G.CrimFarm = s
        task.spawn(function()
            while _G.CrimFarm do
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-919, 95, 2138)
                    task.wait(0.2)
                    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-943, 94, 2055)
                    task.wait(0.2)
                end
                task.wait(0.5)
            end
        end)
    end
})

CrimTab:CreateButton({
    Name = "Nuke Map Barriers (Doors/Fences/Windows)",
    Callback = NukeMapBarriers
})

--------------------------------------------------------------------
-- [12] PLAYER TAB
--------------------------------------------------------------------
PlayerTab:CreateSection("Abilities")

PlayerTab:CreateToggle({
    Name = "Auto Sprint (Speed 25)",
    Callback = function(s)
        _G.AutoSprint = s
        task.spawn(function()
            while _G.AutoSprint do
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                    if LocalPlayer.Character.Humanoid.WalkSpeed < 25 then
                        LocalPlayer.Character.Humanoid.WalkSpeed = 25
                    end
                end
                task.wait()
            end
        end)
    end
})

PlayerTab:CreateToggle({
    Name = "Anti-Tase (Move + Shoot)",
    Callback = function(s)
        _G.AntiTase = s
        task.spawn(function()
            while _G.AntiTase do
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                    if LocalPlayer.Character.Humanoid.PlatformStand or LocalPlayer.Character.Humanoid.Sit then
                        LocalPlayer.Character.Humanoid.PlatformStand = false
                        LocalPlayer.Character.Humanoid.Sit = false
                    end
                    if LocalPlayer.Character:FindFirstChild("ClientInputHandler") then
                        LocalPlayer.Character.ClientInputHandler.Disabled = false
                    end
                end
                task.wait()
            end
        end)
    end
})

PlayerTab:CreateButton({
    Name = "Sit",
    Callback = function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.Sit = true
        end
    end
})

PlayerTab:CreateToggle({
    Name = "Freeze Position",
    Callback = function(s)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.Anchored = s
        end
    end
})

PlayerTab:CreateToggle({
    Name = "Infinite Jump",
    Callback = function(s)
        _G.InfJump = s
        UserInputService.JumpRequest:Connect(function()
            if _G.InfJump and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                LocalPlayer.Character.Humanoid:ChangeState("Jumping")
            end
        end)
    end
})

PlayerTab:CreateSection("Movement")

PlayerTab:CreateToggle({
    Name = "Spider Mode (Climb Walls)",
    Callback = function(s) 
        _G.Spider = s
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            if s then 
                LocalPlayer.Character.Humanoid.MaxSlopeAngle = 89.9 
            else 
                LocalPlayer.Character.Humanoid.MaxSlopeAngle = 89
            end
        end
    end
})

PlayerTab:CreateToggle({
    Name = "CFrame Speed (Fast)",
    Callback = function(s)
        _G.CFrameSpeed = s
        task.spawn(function()
            while _G.CFrameSpeed do
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                     if LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
                        LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame + LocalPlayer.Character.Humanoid.MoveDirection * _G.CFrameSpeedVal
                     end
                end
                RunService.Heartbeat:Wait()
            end
        end)
    end
})
PlayerTab:CreateSlider({Name="Speed Factor", Range={0.1, 5}, Increment=0.1, CurrentValue=1, Callback=function(v) _G.CFrameSpeedVal = v end})

PlayerTab:CreateToggle({
    Name = "Jesus Mode (Water Walk)",
    Callback = function(s)
        _G.Jesus = s
        if s then
            local p = Instance.new("Part", workspace)
            p.Name = "JesusPart"
            p.Size = Vector3.new(10000, 1, 10000)
            p.Transparency = 0.5
            p.Anchored = true
            p.Position = Vector3.new(0, -1, 0)
            p.CanCollide = true
        else
            if workspace:FindFirstChild("JesusPart") then workspace.JesusPart:Destroy() end
        end
    end
})

PlayerTab:CreateToggle({
    Name = "Anti-Void",
    Callback = function(s)
        _G.AntiVoid = s
        task.spawn(function()
            while _G.AntiVoid do
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character.HumanoidRootPart.Position.Y < -20 then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(918, 99, 2325)
                end
                task.wait(0.5)
            end
        end)
    end
})

PlayerTab:CreateToggle({
    Name = "Air Walk (Freeze Height)",
    Callback = function(s)
        _G.AirWalk = s
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.Anchored = s
        end
    end
})

local antiFlingConnection = nil
PlayerTab:CreateToggle({
    Name = "Anti-Fling",
    Callback = function(s)
        _G.AntiFling = s
        if s then
            antiFlingConnection = RunService.Stepped:Connect(function()
                if _G.AntiFling and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    if LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity.Magnitude > 200 then
                        LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0,0,0)
                        LocalPlayer.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.new(0,0,0)
                    end
                end
            end)
        else
            if antiFlingConnection then
                antiFlingConnection:Disconnect()
                antiFlingConnection = nil
            end
        end
    end
})

PlayerTab:CreateButton({
    Name = "Invisible (Ghost Mode)",
    Callback = function()
        if LocalPlayer.Character then
            for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then v.Transparency = 1 end
                if v:IsA("Decal") then v:Destroy() end
            end
            if LocalPlayer.Character:FindFirstChild("Head") and LocalPlayer.Character.Head:FindFirstChild("face") then
                LocalPlayer.Character.Head.face:Destroy()
            end
        end
    end
})

PlayerTab:CreateButton({
    Name = "Dwarf Mode (Tiny)",
    Callback = function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.HipHeight = -1.5
        end
    end
})

PlayerTab:CreateButton({
    Name = "Giant Mode (Huge)",
    Callback = function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.HipHeight = 5
        end
    end
})

PlayerTab:CreateButton({
    Name = "Blink Forward (X Key)",
    Callback = function()
        Rayfield:Notify({Title="Blink", Content="Press 'X' to blink forward.", Duration=2})
    end
})
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.X then
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -15)
        end
    end
end)

PlayerTab:CreateSlider({
    Name="WalkSpeed", 
    Range={16,300}, 
    Increment=1, 
    CurrentValue=16, 
    Callback=function(v) 
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then LocalPlayer.Character.Humanoid.WalkSpeed=v end 
    end
})

PlayerTab:CreateSlider({
    Name="JumpPower", 
    Range={50,300}, 
    Increment=1, 
    CurrentValue=50, 
    Callback=function(v) 
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then LocalPlayer.Character.Humanoid.JumpPower=v end 
    end
})

PlayerTab:CreateToggle({
    Name = "Infinite Stamina",
    Callback = function(s) 
        _G.InfStam = s
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("ClientInputHandler") then
            if s then 
                LocalPlayer.Character.ClientInputHandler.Disabled = true 
            else 
                LocalPlayer.Character.ClientInputHandler.Disabled = false 
            end
        end
    end
})

PlayerTab:CreateToggle({
    Name = "Auto Respawn",
    Callback = function(s) 
        _G.AutoRespawn = s
        if s and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then 
            LocalPlayer.Character.Humanoid.Died:Connect(function() 
                if _G.AutoRespawn then 
                    task.wait(0.5) 
                    local p = LocalPlayer.Character.HumanoidRootPart.CFrame
                    ReplicatedStorage.loadchar:InvokeServer(LocalPlayer.Name)
                    task.wait(0.5)
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        LocalPlayer.Character.HumanoidRootPart.CFrame = p 
                    end
                end 
            end) 
        end 
    end
})

local spawnPlatformConnection = nil
PlayerTab:CreateToggle({
    Name = "Spawn Platform",
    Callback = function(s) 
        if s then 
            local p = Instance.new("Part", workspace)
            p.Name = "HubPlat"
            p.Size = Vector3.new(10,1,10)
            p.Anchored = true
            spawnPlatformConnection = RunService.RenderStepped:Connect(function() 
                if workspace:FindFirstChild("HubPlat") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then 
                    workspace.HubPlat.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0,-3.5,0) 
                end 
            end) 
        else 
            if spawnPlatformConnection then
                spawnPlatformConnection:Disconnect()
                spawnPlatformConnection = nil
            end
            if workspace:FindFirstChild("HubPlat") then workspace.HubPlat:Destroy() end 
        end 
    end
})

PlayerTab:CreateToggle({
    Name = "Fly (Standard)",
    Callback = function(s) 
        _G.Flying = s
        if s then
            task.spawn(function()
                if not (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")) then return end
                local BodyGyro = Instance.new("BodyGyro", LocalPlayer.Character.HumanoidRootPart)
                local BodyVelocity = Instance.new("BodyVelocity", LocalPlayer.Character.HumanoidRootPart)
                BodyGyro.P = 9e4
                BodyGyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
                BodyGyro.cframe = LocalPlayer.Character.HumanoidRootPart.CFrame
                BodyVelocity.velocity = Vector3.new(0, 0, 0)
                BodyVelocity.maxForce = Vector3.new(9e9, 9e9, 9e9)

                while _G.Flying and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character.Humanoid.Health > 0 do
                    LocalPlayer.Character.Humanoid.PlatformStand = true
                    BodyGyro.cframe = Camera.CFrame
                    
                    local speed = _G.FlySpeed
                    local vel = Vector3.new(0, 0, 0)
                    
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then vel = vel + Camera.CFrame.LookVector * speed end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then vel = vel - Camera.CFrame.LookVector * speed end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then vel = vel - Camera.CFrame.RightVector * speed end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then vel = vel + Camera.CFrame.RightVector * speed end
                    
                    BodyVelocity.velocity = vel
                    RunService.RenderStepped:Wait()
                end
                
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                    LocalPlayer.Character.Humanoid.PlatformStand = false
                end
                BodyGyro:Destroy()
                BodyVelocity:Destroy()
            end)
        end 
    end
})

PlayerTab:CreateSlider({
    Name="Fly Speed", 
    Range={10, 200}, 
    Increment=1, 
    CurrentValue=20, 
    Callback=function(v) _G.FlySpeed = v end
})

local noclipConnection = nil
PlayerTab:CreateToggle({
    Name = "Noclip",
    Callback = function(s) 
        _G.Noclip = s 
        if s then
            noclipConnection = RunService.Stepped:Connect(function()
                if _G.Noclip and LocalPlayer.Character then
                    for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
                        if v:IsA("BasePart") and v.CanCollide == true then
                            v.CanCollide = false
                        end
                    end
                end
            end)
        else
            if noclipConnection then
                noclipConnection:Disconnect()
                noclipConnection = nil
            end
        end
    end
})

--------------------------------------------------------------------
-- [13] VISUALS TAB
--------------------------------------------------------------------
local ESP_Enabled, Box_Enabled, Name_Enabled, Tracer_Enabled = false, false, false, false
local ESP_Folder = Instance.new("Folder", game.CoreGui)
ESP_Folder.Name = "HubESP"
local ESP_Lines = {}

local function ClearESP()
    ESP_Folder:ClearAllChildren()
    for _, l in pairs(ESP_Lines) do l:Remove() end
    ESP_Lines = {}
end

RunService.RenderStepped:Connect(function()
    if _G.Crosshair then
        local c = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
        CrosshairX.Visible = true; CrosshairY.Visible = true
        CrosshairX.From = c - Vector2.new(10, 0); CrosshairX.To = c + Vector2.new(10, 0)
        CrosshairY.From = c - Vector2.new(0, 10); CrosshairY.To = c + Vector2.new(0, 10)
    else
        CrosshairX.Visible = false; CrosshairY.Visible = false
    end

    if not ESP_Enabled then return end
    
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Character:FindFirstChild("Head") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = p.Character.HumanoidRootPart
            local vec, screen = Camera:WorldToViewportPoint(hrp.Position)
            
            local hl = ESP_Folder:FindFirstChild(p.Name.."_HL")
            if not hl then 
                hl = Instance.new("Highlight", ESP_Folder); hl.Name = p.Name.."_HL"; hl.FillTransparency = 0.5 
            end
            hl.Adornee = p.Character; hl.Enabled = Box_Enabled
            hl.FillColor = (p.Team == LocalPlayer.Team) and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)

            local bg = ESP_Folder:FindFirstChild(p.Name.."_BG")
            if not bg then 
                bg = Instance.new("BillboardGui", ESP_Folder); bg.Name = p.Name.."_BG"; bg.Size = UDim2.new(0, 200, 0, 50); bg.AlwaysOnTop = true; bg.StudsOffset = Vector3.new(0, 3, 0)
                local t = Instance.new("TextLabel", bg); t.Size = UDim2.new(1, 0, 1, 0); t.BackgroundTransparency = 1; t.TextColor3 = Color3.fromRGB(255, 255, 255); t.TextStrokeTransparency = 0; t.Font = Enum.Font.SourceSansBold; t.TextSize = 14 
            end
            bg.Adornee = p.Character.Head; bg.Enabled = Name_Enabled
            bg.TextLabel.Text = p.Name .. " [" .. math.floor((LocalPlayer.Character.HumanoidRootPart.Position - hrp.Position).Magnitude) .. "m]"

            if not ESP_Lines[p.Name] then 
                local l = Drawing.new("Line"); l.Thickness = 1.5; l.Color = Color3.fromRGB(255, 0, 0); ESP_Lines[p.Name] = l 
            end
            
            if Tracer_Enabled and screen then
                ESP_Lines[p.Name].Visible = true
                ESP_Lines[p.Name].From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                ESP_Lines[p.Name].To = Vector2.new(vec.X, vec.Y)
            else
                ESP_Lines[p.Name].Visible = false
            end
        else
            if ESP_Lines[p.Name] then ESP_Lines[p.Name].Visible = false end
        end
    end
end)

VisualsTab:CreateToggle({Name="Enable ESP Master", Callback=function(s) ESP_Enabled = s; if not s then ClearESP() end end})
VisualsTab:CreateToggle({Name="Box / Chams", Callback=function(s) Box_Enabled = s end})
VisualsTab:CreateToggle({Name="Names / Distance", Callback=function(s) Name_Enabled = s end})
VisualsTab:CreateToggle({Name="Tracers", Callback=function(s) Tracer_Enabled = s end})
VisualsTab:CreateToggle({Name="X-Ray (Wallhack)", Callback=function(s) 
    for _,v in pairs(workspace:GetDescendants()) do 
        if v:IsA("BasePart") and not IsPlayerPart(v) then 
            v.Transparency = s and 0.5 or 0 
        end 
    end 
end})
VisualsTab:CreateToggle({Name="Crosshair", Callback=function(s) _G.Crosshair = s end})

VisualsTab:CreateButton({
    Name = "Fix Visuals (Restore Colors)",
    Callback = function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") and not IsPlayerPart(v) then
                v.Material = Enum.Material.Plastic
                v.Transparency = 0
            end
        end
        Rayfield:Notify({Title="Visuals Fixed", Content="Restored map (Players Safe).", Duration=2})
    end
})

VisualsTab:CreateButton({
    Name = "Remove Uniform (Client)",
    Callback = function()
        if LocalPlayer.Character then
            for _, v in pairs(LocalPlayer.Character:GetChildren()) do
                if v:IsA("Shirt") or v:IsA("Pants") then
                    v:Destroy()
                end
            end
        end
    end
})

VisualsTab:CreateSection("Weapon Cosmetics")

VisualsTab:CreateToggle({
    Name = "Custom Gun Color",
    Callback = function(s) 
        _G.CustomGunColor = s
        task.spawn(function()
            while _G.CustomGunColor do
                local tool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
                if tool then
                    for _, v in pairs(tool:GetDescendants()) do
                        if v:IsA("BasePart") then
                            v.Material = Enum.Material.Neon
                            v.Color = _G.GunColorC3
                            v.Reflectance = 0
                            if v:IsA("MeshPart") then v.TextureID = "" end
                        end
                        if v:IsA("Decal") or v:IsA("Texture") then v:Destroy() end
                        if v:IsA("SpecialMesh") then v.TextureId = "" end
                    end
                end
                RunService.RenderStepped:Wait()
            end
        end)
    end
})
VisualsTab:CreateColorPicker({
    Name = "Gun Color Picker",
    Color = Color3.fromRGB(255, 255, 255),
    Callback = function(c) _G.GunColorC3 = c end
})

VisualsTab:CreateToggle({
    Name = "Custom Bullet Color",
    Callback = function(s) 
        _G.CustomBulletColor = s
        task.spawn(function()
            while _G.CustomBulletColor do
                for _,v in pairs(workspace:GetChildren()) do
                    if v.Name == "Bullet" or v.Name == "Lead" then
                        v.Color = _G.BulletColorC3
                        v.Material = Enum.Material.Neon
                    end
                end
                RunService.RenderStepped:Wait()
            end
        end)
    end
})
VisualsTab:CreateColorPicker({
    Name = "Bullet Color Picker",
    Color = Color3.fromRGB(255, 0, 0),
    Callback = function(c) _G.BulletColorC3 = c end
})


VisualsTab:CreateButton({
    Name = "Headless (Client Side)",
    Callback = function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head") then
            LocalPlayer.Character.Head.Transparency = 1
            if LocalPlayer.Character.Head:FindFirstChild("face") then LocalPlayer.Character.Head.face.Transparency = 1 end
        end
    end
})

VisualsTab:CreateButton({
    Name = "No Limbs (Client Side)",
    Callback = function()
        if LocalPlayer.Character then
            for _, v in pairs(LocalPlayer.Character:GetChildren()) do
                if v.Name:find("Arm") or v.Name:find("Leg") then
                    v.Transparency = 1
                end
            end
        end
    end
})

VisualsTab:CreateToggle({
    Name = "Rainbow Arms",
    Callback = function(s)
        _G.RainbowArms = s
        task.spawn(function()
            while _G.RainbowArms do
                local color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                if LocalPlayer.Character then
                    for _, v in pairs(LocalPlayer.Character:GetChildren()) do
                        if (v.Name:find("Arm") or v.Name:find("Hand")) and v:IsA("BasePart") then
                            v.Color = color
                        end
                    end
                end
                RunService.RenderStepped:Wait()
            end
        end)
    end
})

VisualsTab:CreateToggle({
    Name = "Rainbow Gun",
    Callback = function(s)
        _G.RainbowGun = s
        task.spawn(function()
            while _G.RainbowGun do
                if LocalPlayer.Character then
                    local tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
                    if tool then
                        for _, v in pairs(tool:GetDescendants()) do
                            if v:IsA("MeshPart") then v.TextureID = "" end
                            if v:IsA("Texture") or v:IsA("Decal") then v:Destroy() end
                            if v:IsA("BasePart") then 
                                v.Color = Color3.fromHSV(tick()%5/5, 1, 1) 
                            end
                        end
                    end
                end
                RunService.RenderStepped:Wait()
            end
        end)
    end
})

VisualsTab:CreateToggle({
    Name = "DarkMatter Mode (Gun Only)",
    Callback = function(s)
        _G.DarkMatter = s
        task.spawn(function()
            while _G.DarkMatter do
                local tool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
                if tool then
                    for _, v in pairs(tool:GetDescendants()) do
                        if v:IsA("BasePart") then
                            v.Material = Enum.Material.Neon
                            v.Color = Color3.fromRGB(90, 0, 255)
                        elseif v:IsA("Texture") or v:IsA("Decal") then
                            v:Destroy()
                        end
                        if v:IsA("MeshPart") then v.TextureID = "" end
                    end
                end
                task.wait(0.1)
            end
        end)
    end
})

VisualsTab:CreateToggle({
    Name = "Ghost Gun (Transparent)",
    Callback = function(s)
        _G.GhostGun = s
        task.spawn(function()
            while _G.GhostGun do
                local tool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
                if tool then
                    for _, v in pairs(tool:GetDescendants()) do
                        if v:IsA("BasePart") then
                            v.Transparency = 0.8
                        end
                    end
                end
                RunService.RenderStepped:Wait()
            end
        end)
    end
})

--------------------------------------------------------------------
-- [14] TELEPORT TAB
--------------------------------------------------------------------
TeleportTab:CreateSection("Special")
TeleportTab:CreateButton({
    Name = "Create Sky Base & TP",
    Callback = function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local p = Instance.new("Part", workspace)
            p.Name = "SkyBase"
            p.Size = Vector3.new(100, 1, 100)
            p.Anchored = true
            p.Position = Vector3.new(0, 1000, 0)
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 1005, 0)
        end
    end
})

TeleportTab:CreateButton({
    Name = "Safe Zone (High Sky)",
    Callback = function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local p = Instance.new("Part", workspace)
            p.Name = "SafeZone"
            p.Size = Vector3.new(50, 1, 50)
            p.Anchored = true
            p.Position = Vector3.new(0, 5000, 0)
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 5005, 0)
        end
    end
})

TeleportTab:CreateSection("Gun Locations")

local function TPToGun(GunName)
    SafeCall(function()
        if not (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")) then return end
        
        local Items = workspace:FindFirstChild("Prison_ITEMS")
        if not Items then return end
        local Giver = Items:FindFirstChild("giver")
        if not Giver then return end
        
        local GunParams = Giver:FindFirstChild(GunName)
        if not GunParams then
            for _, v in pairs(Giver:GetChildren()) do
                if v.Name:lower():find(GunName:lower()) then
                    GunParams = v
                    break
                end
            end
        end

        if GunParams and GunParams:FindFirstChild("ITEMPICKUP") then
            LocalPlayer.Character.HumanoidRootPart.CFrame = GunParams.ITEMPICKUP.CFrame * CFrame.new(0, 2, 0)
        else
            Rayfield:Notify({Title="Error", Content="Gun not found in map!", Duration=2})
        end
    end)
end

TeleportTab:CreateButton({Name = "Teleport to M9", Callback = function() TPToGun("M9") end})
TeleportTab:CreateButton({Name = "Teleport to Remington 870", Callback = function() TPToGun("Remington 870") end})
TeleportTab:CreateButton({Name = "Teleport to AK-47", Callback = function() TPToGun("AK-47") end})
TeleportTab:CreateButton({Name = "Teleport to M4A1", Callback = function() TPToGun("M4A1") end})

TeleportTab:CreateSection("Locations")
local function Teleport(pos)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = pos
    end
end

TeleportTab:CreateButton({Name="Yard", Callback=function() Teleport(CFrame.new(791,98,2498)) end})
TeleportTab:CreateButton({Name="Armory", Callback=function() Teleport(CFrame.new(836,100,2266)) end})
TeleportTab:CreateButton({Name="Prison Cells", Callback=function() Teleport(CFrame.new(916,99,2448)) end})
TeleportTab:CreateButton({Name="Kitchen", Callback=function() Teleport(CFrame.new(906,99,2304)) end})
TeleportTab:CreateButton({Name="Guard Room", Callback=function() Teleport(CFrame.new(802,99,2270)) end})
TeleportTab:CreateButton({Name="Sewers", Callback=function() Teleport(CFrame.new(916,78,2431)) end})
TeleportTab:CreateButton({Name="Front Gate", Callback=function() Teleport(CFrame.new(505,102,2246)) end})
TeleportTab:CreateButton({Name="Criminal Base", Callback=function() Teleport(CFrame.new(-943,96,2055)) end})
TeleportTab:CreateButton({Name="Police Spawn", Callback=function() Teleport(CFrame.new(836, 99, 2307)) end})
TeleportTab:CreateButton({Name="Cafeteria", Callback=function() Teleport(CFrame.new(918, 99, 2326)) end})
TeleportTab:CreateButton({Name="Main Bridge", Callback=function() Teleport(CFrame.new(-94, 44, 1789)) end})
TeleportTab:CreateButton({Name="City Store", Callback=function() Teleport(CFrame.new(-386, 54, 1762)) end})
TeleportTab:CreateButton({Name="Neutral Spawn", Callback=function() Teleport(CFrame.new(877, 27, 2377)) end})
TeleportTab:CreateButton({Name="Prison Roof", Callback=function() Teleport(CFrame.new(918, 125, 2380)) end})

TeleportTab:CreateSection("Players")
local TPList = {}
local TPDrop = TeleportTab:CreateDropdown({
    Name = "TP to Player", 
    Options = TPList, 
    CurrentValue = "", 
    Callback = function(v) 
        if Players[v] and Players[v].Character and Players[v].Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then 
            LocalPlayer.Character.HumanoidRootPart.CFrame = Players[v].Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3) 
        end 
    end
})

TeleportTab:CreateButton({
    Name = "Refresh Players", 
    Callback = function() 
        TPList = {}
        for _,v in pairs(Players:GetPlayers()) do 
            if v ~= LocalPlayer then table.insert(TPList, v.Name) end 
        end
        TPDrop:Refresh(TPList) 
    end
})

--------------------------------------------------------------------
-- [15] VEHICLE TAB
--------------------------------------------------------------------
local carNoclipConnection = nil
VehicleTab:CreateToggle({
    Name = "Car Noclip (Drive thru Walls)",
    Callback = function(s)
        _G.CarNoclip = s
        if s then
            carNoclipConnection = RunService.Stepped:Connect(function()
                if _G.CarNoclip and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and LocalPlayer.Character.Humanoid.SeatPart then
                    local car = LocalPlayer.Character.Humanoid.SeatPart.Parent
                    for _, v in pairs(car:GetDescendants()) do
                        if v:IsA("BasePart") then v.CanCollide = false end
                    end
                end
            end)
        else
            if carNoclipConnection then
                carNoclipConnection:Disconnect()
                carNoclipConnection = nil
            end
        end
    end
})

VehicleTab:CreateButton({
    Name = "Invisible Car (Ghost Ride)",
    Callback = function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and LocalPlayer.Character.Humanoid.SeatPart then
            local car = LocalPlayer.Character.Humanoid.SeatPart.Parent
            for _, v in pairs(car:GetDescendants()) do
                if v:IsA("BasePart") then v.Transparency = 1 end
                if v:IsA("Decal") then v:Destroy() end
            end
        end
    end
})

VehicleTab:CreateButton({
    Name="Bring Car", 
    Callback=function() 
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local c = workspace.CarContainer:FindFirstChild("Sedan") or workspace.CarContainer:FindFirstChild("Squad")
            if c and c:IsA("Model") and c.PrimaryPart then 
                c:SetPrimaryPartCFrame(LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0)) 
            end
        end
    end
})

VehicleTab:CreateButton({
    Name="Flip Car", 
    Callback=function() 
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and LocalPlayer.Character.Humanoid.SeatPart then 
            local c = LocalPlayer.Character.Humanoid.SeatPart.Parent
            if c and c:IsA("Model") and c.PrimaryPart then
                c:SetPrimaryPartCFrame(CFrame.new(c.PrimaryPart.Position + Vector3.new(0, 5, 0))) 
            end
        end 
    end
})

VehicleTab:CreateButton({
    Name="Destroy All Cars", 
    Callback=function() 
        for _,v in pairs(workspace.CarContainer:GetChildren()) do v:Destroy() end 
    end
})

VehicleTab:CreateSlider({
    Name="Car Speed", 
    Range={50,500}, 
    Increment=1, 
    CurrentValue=100, 
    Callback=function(v) 
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and LocalPlayer.Character.Humanoid.SeatPart then 
            LocalPlayer.Character.Humanoid.SeatPart.AssemblyLinearVelocity = LocalPlayer.Character.Humanoid.SeatPart.CFrame.LookVector * v 
        end 
    end
})

--------------------------------------------------------------------
-- [16] WORLD TAB
--------------------------------------------------------------------
WorldTab:CreateToggle({
    Name = "Low Gravity",
    Callback = function(s)
        if s then workspace.Gravity = 50 else workspace.Gravity = 196.2 end
    end
})

WorldTab:CreateButton({Name="Fullbright", Callback=function() Lighting.Brightness=2; Lighting.ClockTime=14; Lighting.GlobalShadows=false end})
WorldTab:CreateButton({Name="No Fog", Callback=function() Lighting.FogEnd=100000 end})
WorldTab:CreateButton({Name="Delete Map (Client)", Callback=function() for _,v in pairs(workspace:GetChildren()) do if v~=LocalPlayer.Character and not v:IsA("Camera") then v:Destroy() end end end})

WorldTab:CreateButton({
    Name = "Nuke Map Barriers (Doors/Fences/Windows)",
    Callback = NukeMapBarriers
})

--------------------------------------------------------------------
-- [17] GOD MODE TAB
--------------------------------------------------------------------
GodTab:CreateButton({
    Name="God Mode (Hitbox Glitch)", 
    Callback=function() 
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then 
            local c = LocalPlayer.Character
            c.Humanoid.Name = "1"
            local l = c["1"]:Clone()
            l.Parent = c
            l.Name = "Humanoid"
            task.wait(0.1)
            c["1"]:Destroy()
            Camera.CameraSubject = c.Humanoid 
        end 
    end
})

GodTab:CreateToggle({
    Name="Fling All", 
    Callback=function(s) 
        _G.Fling = s
        task.spawn(function()
            if not (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")) then return end
            
            local b = Instance.new("BodyAngularVelocity", LocalPlayer.Character.HumanoidRootPart)
            b.AngularVelocity = Vector3.new(0,9999,0)
            b.MaxTorque = Vector3.new(0,math.huge,0)
             
            while _G.Fling do 
                for _,p in pairs(Players:GetPlayers()) do 
                    if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then 
                        LocalPlayer.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame 
                    end 
                end 
                task.wait() 
            end 
            b:Destroy() 
        end)
    end
})

--------------------------------------------------------------------
-- [18] TROLL TAB
--------------------------------------------------------------------
local SpamMsg = "UltHub v1.2.3"
local Spamming = false

TrollTab:CreateInput({
    Name = "Spam Text",
    PlaceholderText = "Enter text here",
    RemoveTextAfterFocusLost = false,
    Callback = function(t) 
        SpamMsg = t 
    end
})

TrollTab:CreateToggle({
    Name="Chat Spam", 
    Callback=function(s) 
        Spamming = s
        task.spawn(function() 
            while Spamming do 
                SendChatMessage(SpamMsg)
                task.wait(2) 
            end 
        end) 
    end
})

TrollTab:CreateSection("Fling")
TrollTab:CreateToggle({
    Name = "Touch Fling (Spin)",
    Callback = function(s)
        _G.TouchFling = s
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            if s then
                local b = Instance.new("BodyAngularVelocity", LocalPlayer.Character.HumanoidRootPart)
                b.Name = "FlingForce"
                b.AngularVelocity = Vector3.new(0,9999,0)
                b.MaxTorque = Vector3.new(0,math.huge,0)
            else
                if LocalPlayer.Character.HumanoidRootPart:FindFirstChild("FlingForce") then
                    LocalPlayer.Character.HumanoidRootPart.FlingForce:Destroy()
                end
            end
        end
    end
})

TrollTab:CreateToggle({
    Name="Lag Switch (Anchor)", 
    Callback=function(s) 
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.Anchored = s 
        end
    end
})

TrollTab:CreateButton({
    Name="ForceField (Visual)", 
    Callback=function() 
        if LocalPlayer.Character then
            Instance.new("ForceField", LocalPlayer.Character) 
        end
    end
})

TrollTab:CreateButton({
    Name="Suicide", 
    Callback=function() 
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            LocalPlayer.Character.Humanoid.Health = 0 
        end
    end
})

--------------------------------------------------------------------
-- [19] SYSTEM TAB
--------------------------------------------------------------------

SystemTab:CreateButton({
    Name = "Force Reset Character",
    Callback = function()
        if LocalPlayer.Character then
            LocalPlayer.Character:BreakJoints()
        end
    end
})

SystemTab:CreateButton({
    Name = "Destroy UI",
    Callback = function()
        Rayfield:Destroy()
        FOVCircle:Remove()
        TargetHighlight:Destroy()
        CrosshairX:Remove()
        CrosshairY:Remove()
        ESP_Folder:Destroy()
        ClearESP()
    end
})