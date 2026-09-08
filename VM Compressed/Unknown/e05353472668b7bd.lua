--[[ Legend Hub | 99 Nights - FULL (Fluent) 
     Integrado com sua UI (Amethyst), sem key, compatível Delta
     Cole tudo e execute
--]]

-- ====== Anti AFK ======
pcall(function()
    local Players = game:GetService("Players")
    local vu = game:GetService("VirtualUser")
    Players.LocalPlayer.Idled:Connect(function()
        vu:CaptureController()
        vu:ClickButton2(Vector2.new())
    end)
end)

-- ====== Load Fluent & Addons (safe) ======
local okF, Fluent = pcall(function()
    return loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
end)
local okS, SaveManager = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
end)
local okI, InterfaceManager = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
end)
if not okF or not Fluent then
    pcall(function() game:GetService("StarterGui"):SetCore("SendNotification", {Title="Legend Hub", Text="Falha ao carregar Fluent.", Duration=4}) end)
    return
end

-- ====== Window & Tabs ======
local Window = Fluent:CreateWindow({
    Title = "Legend Hub | 99 Nights",
    SubTitle = "By DarkHub",
    TabWidth = 120,
    Size = UDim2.fromOffset(520, 380),
    Acrylic = true,
    Theme = "Amethyst"
})

local Tabs = {
    Combat   = Window:AddTab({ Title = "Combat", Icon = "swords" }),
    Movement = Window:AddTab({ Title = "Movement", Icon = "zap" }),
    Visual   = Window:AddTab({ Title = "Visual", Icon = "eye" }),
    ESP      = Window:AddTab({ Title = "ESP", Icon = "radar" }),
    Bring    = Window:AddTab({ Title = "Bring", Icon = "package" }),
    Kids     = Window:AddTab({ Title = "Kids", Icon = "baby" }),
    Teleport = Window:AddTab({ Title = "Teleport", Icon = "map-pin" }),
    Misc = Window:AddTab({ Title = "Misc", Icon = "list-plus" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

-- SaveManager / InterfaceManager hookup
if okS and SaveManager then
    SaveManager:SetLibrary(Fluent)
    SaveManager:IgnoreThemeSettings()
    SaveManager:SetIgnoreIndexes({})
    SaveManager:SetFolder("DarkHub-Fluent/99Nights")
    SaveManager:BuildConfigSection(Tabs.Settings)
end
if okI and InterfaceManager then
    InterfaceManager:SetLibrary(Fluent)
    InterfaceManager:SetFolder("DarkHub-Fluent")
    InterfaceManager:BuildInterfaceSection(Tabs.Settings)
end

Window:SelectTab(1)
Fluent:Notify({ Title = "Legend Hub", Content = "UI carregada com sucesso!", Duration = 3 })

-- ====== Services & Locals ======
local Services = {
    Players = game:GetService("Players"),
    RunService = game:GetService("RunService"),
    UserInputService = game:GetService("UserInputService"),
    Lighting = game:GetService("Lighting"),
    TweenService = game:GetService("TweenService"),
    ReplicatedStorage = game:GetService("ReplicatedStorage"),
    Workspace = game:GetService("Workspace")
}

local LP = Services.Players.LocalPlayer
local Char = LP.Character or LP.CharacterAdded:Wait()
local HRP = Char:FindFirstChild("HumanoidRootPart")
local Hum = Char:FindFirstChildOfClass("Humanoid")

-- ====== State / Config / Storage ======
local States = {
    KillAura=false, GodMode=false, SuperSpeed=false, NoClip=false,
    Fly=false, InfiniteJump=false, NoFog=false, FullBright=false,
    AntiLag=false, ESPPlayers=false, ESPEnemies=false,
    AutoFood=false, ShowFPS=true, ESPChilds=false,
    BringFuel=false, BringFood=false, BringWeapons=false,
    BringArmor=false, BringScrap=false, BringPelts=false,
    BringBlueprints=false, BringHealing=false, BringBags=false
}

local Config = {
    Speed=16, FlySpeed=50, KillAuraRange=20,
    BringDistance=500, ItemMultiplier=1, AutoFarmRadius=25, AutoHitDelay=0.12, FarmTreeRange=15
}

local Storage = {
    ESPObjects={}, FlyBG=nil, FlyBV=nil, FlyGUI=nil, Connections={},
    FPSGui=nil, FrameCount=0, FPS=60, ChildrenCache={}, BroughtItems={}
}

local MobList = {
    "Bunny","Kiwi","Arctic Fox","Wolf","Alpha Wolf","Bear","Polar Bear",
    "Scorpion","Cultist","Crossbow Cultist","Juggernaut Cultist","Cultist King",
    "The Deer","The Owl","The Ram","Frog King","Lava Mammoth","Aliens",
    "Frogs","Hellephant","Meteor Crab","Mammoth"
}

local Items = {
    fuel = {"Log","Coal","Fuel Canister","Oil Barrel","Biofuel"},
    food = {"Carrot","Corn","Berry","Apple","Cooked Morsel","Cooked Steak","Pumpkin"},
    weapons = {"Spear","Morningstar","Katana","Laser Sword","Trident"},
    armor = {"Leather Body","Iron Body","Poison Armor","Riot Shield","Alien Armor"},
    scrap = {"Bolt","Sheet Metal","Broken Microwave","Tyre"},
    pelts = {"Bunny Foot","Wolf Pelt","Alpha Wolf Pelt","Polar Bear Pelt"},
    blueprints = {"Crafting Blueprint","Furniture Blueprint"},
    healing = {"Bandage","Medkit"},
    bags = {"Good Sack","Strong Flashlight"}
}

local ChildNames = {"Dino Kid","Kraken Kid","Squid Kid","Koala Kid"}

-- ====== Notify wrapper ======
local function Notify(title, content, dur)
    dur = dur or 3
    pcall(function() Fluent:Notify({ Title = title, Content = content, Duration = dur }) end)
    pcall(function() game:GetService("StarterGui"):SetCore("SendNotification",{Title=title,Text=content,Duration=dur}) end)
end

-- ====== SafeLoop helper ======
local function SafeLoop(flagName, delay, fn)
    task.spawn(function()
        while getgenv()[flagName] do
            local ok, err = pcall(fn)
            if not ok then task.wait(0.2) end
            task.wait(delay)
        end
    end)
end

-- ====== FPS GUI ======
local function CreateFPS()
    if Storage.FPSGui then return end
    local sg = Instance.new("ScreenGui"); sg.Name = "LH_FPSGui"; sg.ResetOnSpawn = false
    local frame = Instance.new("Frame", sg)
    frame.Size = UDim2.new(0,140,0,40); frame.Position = UDim2.new(0,10,0,10)
    frame.BackgroundColor3 = Color3.fromRGB(12,12,16); frame.BorderSizePixel = 0
    local uc = Instance.new("UICorner", frame); uc.CornerRadius = UDim.new(0,8)
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1,-10,1,-10); label.Position = UDim2.new(0,5,0,5)
    label.BackgroundTransparency = 1; label.Font = Enum.Font.GothamBold; label.TextSize = 16
    label.TextColor3 = Color3.fromRGB(220,220,230); label.Text = "FPS: --"
    sg.Parent = LP:WaitForChild("PlayerGui")
    Storage.FPSGui = { GUI = sg, Label = label }
    Storage.FrameCount = 0
    local last = tick()
    if Storage.Connections.FPS then pcall(function() Storage.Connections.FPS:Disconnect() end) end
    Storage.Connections.FPS = Services.RunService.RenderStepped:Connect(function()
        if not States.ShowFPS or not Storage.FPSGui then return end
        Storage.FrameCount = Storage.FrameCount + 1
        local now = tick()
        if now - last >= 0.5 then
            Storage.FPS = math.floor(Storage.FrameCount / (now - last))
            Storage.FrameCount = 0; last = now
            pcall(function()
                Storage.FPSGui.Label.Text = Storage.FPS .. " FPS"
            end)
        end
    end)
end

local function DestroyFPS()
    pcall(function() if Storage.Connections.FPS then Storage.Connections.FPS:Disconnect(); Storage.Connections.FPS=nil end end)
    pcall(function() if Storage.FPSGui and Storage.FPSGui.GUI then Storage.FPSGui.GUI:Destroy(); Storage.FPSGui=nil end end)
end

-- ====== ESP system ======
local function CreateESP(obj, color, name)
    if not obj or Storage.ESPObjects[obj] then return end
    pcall(function()
        local adornee = obj.Parent or obj
        local h = Instance.new("Highlight"); h.Adornee = adornee; h.FillColor = color; h.OutlineColor = color
        h.FillTransparency = 0.6; h.OutlineTransparency = 0; h.Parent = adornee
        local b = Instance.new("BillboardGui"); b.Adornee = obj; b.Size = UDim2.new(0,120,0,36); b.StudsOffset = Vector3.new(0,2.2,0)
        b.AlwaysOnTop = true; b.ResetOnSpawn = false
        local t = Instance.new("TextLabel", b); t.Size = UDim2.new(1,0,1,0); t.BackgroundTransparency = 1; t.Font = Enum.Font.GothamBold; t.TextSize = 14
        t.Text = name or tostring(adornee.Name); t.TextColor3 = Color3.new(1,1,1); t.Parent = b
        b.Parent = LP:WaitForChild("PlayerGui")
        Storage.ESPObjects[obj] = { Highlight = h, Billboard = b }
    end)
end

local function RemoveESP(obj)
    if Storage.ESPObjects[obj] then
        local e = Storage.ESPObjects[obj]
        pcall(function() if e.Highlight then e.Highlight:Destroy() end if e.Billboard then e.Billboard:Destroy() end end)
        Storage.ESPObjects[obj] = nil
    end
end

local function ClearESP()
    for o,e in pairs(Storage.ESPObjects) do pcall(function() if e.Highlight then e.Highlight:Destroy() end if e.Billboard then e.Billboard:Destroy() end end) end
    Storage.ESPObjects = {}
end

local function UpdatePlayerESP()
    if not States.ESPPlayers then
        for _,p in pairs(Services.Players:GetPlayers()) do if p ~= LP and p.Character then local h = p.Character:FindFirstChild("HumanoidRootPart"); if h then RemoveESP(h) end end end
        return
    end
    for _,p in pairs(Services.Players:GetPlayers()) do
        if p ~= LP and p.Character then local h = p.Character:FindFirstChild("HumanoidRootPart"); if h then CreateESP(h, Color3.fromRGB(0,200,120), p.Name) end end
    end
end

local function UpdateEnemyESP()
    if not States.ESPEnemies then
        for o,_ in pairs(Storage.ESPObjects) do if o and o.Parent and table.find(MobList, o.Parent.Name) then RemoveESP(o) end end
        return
    end
    for _,n in pairs(Services.Workspace:GetDescendants()) do
        if n:IsA("Model") and table.find(MobList, n.Name) then local h = n:FindFirstChild("HumanoidRootPart"); if h then CreateESP(h, Color3.fromRGB(255,70,70), n.Name) end end
    end
end

local function UpdateChildESP()
    if not States.ESPChilds then
        for o,_ in pairs(Storage.ESPObjects) do
            if o and o.Parent then
                for _,name in ipairs(ChildNames) do
                    if o.Parent.Name:find(name) then RemoveESP(o); break end
                end
            end
        end
        return
    end
    local children = {}
    pcall(function() children = (FindAllChildren and FindAllChildren() or {}) end)
    for _,c in pairs(children) do if c.Part and c.Part.Parent then CreateESP(c.Part, Color3.fromRGB(255,200,0), c.DisplayName) end end
end

-- ====== Movement / Combat core ======
local function AutoHitTick()
    if not LP.Character then return end
    local tool = LP.Character:FindFirstChildWhichIsA("Tool") or LP.Backpack:FindFirstChildWhichIsA("Tool")
    if tool then
        pcall(function() tool.Parent = LP.Character; if tool.Activate then pcall(function() tool:Activate() end) end end)
    end
end

local function StartAutoHit()
    getgenv().LH_AutoHit = true; SafeLoop("LH_AutoHit", Config.AutoHitDelay, AutoHitTick)
end
local function StopAutoHit() getgenv().LH_AutoHit = false end

local function AutoFarmTick()
    if not LP.Character or not LP.Character:FindFirstChild("HumanoidRootPart") then return end
    local hrp = LP.Character.HumanoidRootPart
    local closest, dist = nil, Config.AutoFarmRadius
    for _,v in ipairs(Services.Workspace:GetDescendants()) do
        if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
            local d = (v.HumanoidRootPart.Position - hrp.Position).Magnitude
            if d < dist then closest, dist = v, d end
        end
    end
    if closest and closest:FindFirstChild("HumanoidRootPart") then
        pcall(function()
            LP.Character.HumanoidRootPart.CFrame = closest.HumanoidRootPart.CFrame * CFrame.new(0,0,-2)
            local tool = LP.Character:FindFirstChildWhichIsA("Tool") or LP.Backpack:FindFirstChildWhichIsA("Tool")
            if tool then tool.Parent = LP.Character; if tool.Activate then pcall(function() tool:Activate() end) end end
        end)
    end
end

local function StartAutoFarm() getgenv().LH_AutoFarm = true; SafeLoop("LH_AutoFarm", 0.12, AutoFarmTick) end
local function StopAutoFarm() getgenv().LH_AutoFarm = false end

-- KillAura
local function KillAuraLoop()
    task.spawn(function()
        while States.KillAura do
            for _,npc in pairs(Services.Workspace:GetDescendants()) do
                if npc:IsA("Model") and table.find(MobList, npc.Name) then
                    local nh = npc:FindFirstChildOfClass("Humanoid"); local nr = npc:FindFirstChild("HumanoidRootPart")
                    if nh and nr and nh.Health > 0 and HRP and (nr.Position - HRP.Position).Magnitude <= Config.KillAuraRange then
                        pcall(function()
                            nr.Size = Vector3.new(Config.KillAuraRange, Config.KillAuraRange, Config.KillAuraRange)
                            nr.Transparency = 1; nr.CanCollide = false
                            if Char then local tool = Char:FindFirstChildOfClass("Tool"); if tool and tool.Activate then pcall(function() tool:Activate() end) end end
                        end)
                    end
                end
            end
            task.wait(0.12)
        end
    end)
end

local function GodModeToggle(enable)
    States.GodMode = enable
    if enable then
        if Storage.Connections.GodMode then Storage.Connections.GodMode:Disconnect() end
        Storage.Connections.GodMode = Services.RunService.Heartbeat:Connect(function() if Hum then Hum.Health = math.huge; Hum.MaxHealth = math.huge end end)
    else
        if Storage.Connections.GodMode then Storage.Connections.GodMode:Disconnect(); Storage.Connections.GodMode=nil end
        if Hum then pcall(function() Hum.MaxHealth = 100; Hum.Health = 100 end) end
    end
end

local function NoClipToggle(enable)
    States.NoClip = enable
    if enable then
        if Storage.Connections.NoClip then Storage.Connections.NoClip:Disconnect() end
        Storage.Connections.NoClip = Services.RunService.Stepped:Connect(function() if Char and States.NoClip then for _,p in pairs(Char:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide = false end end end end)
    else
        if Storage.Connections.NoClip then Storage.Connections.NoClip:Disconnect(); Storage.Connections.NoClip=nil end
    end
end

local function SuperSpeedToggle(enable)
    States.SuperSpeed = enable
    if enable then
        if Storage.Connections.Speed then Storage.Connections.Speed:Disconnect() end
        Storage.Connections.Speed = Services.RunService.Heartbeat:Connect(function() if Hum and States.SuperSpeed then Hum.WalkSpeed = Config.Speed end end)
    else
        if Storage.Connections.Speed then Storage.Connections.Speed:Disconnect(); Storage.Connections.Speed = nil end
        if Hum then pcall(function() Hum.WalkSpeed = 16 end) end
    end
end

-- ====== Fly system ======
local function CreateFlyGUI()
    if Storage.FlyGUI then return Storage.FlyGUI end
    local sg = Instance.new("ScreenGui"); sg.Name = "LH_FlyGUI"; sg.ResetOnSpawn = false
    local rf = Instance.new("Frame", sg); rf.Size = UDim2.new(0,70,0,160); rf.Position = UDim2.new(1,-85,0.7,-80)
    rf.BackgroundColor3 = Color3.fromRGB(15,15,20); rf.BackgroundTransparency = 0.2
    local lf = Instance.new("Frame", sg); lf.Size = UDim2.new(0,160,0,160); lf.Position = UDim2.new(1,-260,0.7,-80)
    lf.BackgroundColor3 = Color3.fromRGB(15,15,20); lf.BackgroundTransparency = 0.2
    local function CB(pa, n, po, sz)
        local b = Instance.new("TextButton", pa); b.Size = sz; b.Position = po; b.BackgroundColor3 = Color3.fromRGB(30,30,40)
        b.BackgroundTransparency = 0.3; b.Text = n; b.TextColor3 = Color3.fromRGB(200,200,220); b.Font = Enum.Font.GothamBold; b.TextSize = 20; b.BorderSizePixel=0
        local bc = Instance.new("UICorner", b); bc.CornerRadius = UDim.new(0,10) return b
    end
    local ub = CB(rf,"▲",UDim2.new(0,5,0,5),UDim2.new(0,60,0,70))
    local db = CB(rf,"▼",UDim2.new(0,5,0,85),UDim2.new(0,60,0,70))
    local fb = CB(lf,"↑",UDim2.new(0,55,0,5),UDim2.new(0,50,0,45))
    local bb = CB(lf,"↓",UDim2.new(0,55,1,-50),UDim2.new(0,50,0,45))
    local lb = CB(lf,"←",UDim2.new(0,5,0,55),UDim2.new(0,45,0,50))
    local rb = CB(lf,"→",UDim2.new(1,-50,0,55),UDim2.new(0,45,0,50))
    sg.Parent = LP:WaitForChild("PlayerGui")
    Storage.FlyGUI = { SG = sg, up=ub, down=db, forward=fb, backward=bb, left=lb, right=rb }
    return Storage.FlyGUI
end

local function StartFly()
    if not HRP then return end
    if Storage.FlyBG then return end
    Storage.FlyBG = Instance.new("BodyGyro"); Storage.FlyBG.P = 9e4; Storage.FlyBG.maxTorque = Vector3.new(9e4,9e4,9e4); Storage.FlyBG.CFrame = HRP.CFrame; Storage.FlyBG.Parent = HRP
    Storage.FlyBV = Instance.new("BodyVelocity"); Storage.FlyBV.Velocity = Vector3.new(0,0,0); Storage.FlyBV.maxForce = Vector3.new(9e4,9e4,9e4); Storage.FlyBV.Parent = HRP
    local btns = CreateFlyGUI(); local fs={up=false,down=false,left=false,right=false,forward=false,backward=false}
    local function CB(b,k)
        b.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then fs[k]=true; b.BackgroundColor3=Color3.fromRGB(80,80,120); b.BackgroundTransparency=0 end end)
        b.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then fs[k]=false; b.BackgroundColor3=Color3.fromRGB(30,30,40); b.BackgroundTransparency=0.3 end end)
    end
    CB(btns.up,"up"); CB(btns.down,"down"); CB(btns.left,"left"); CB(btns.right,"right"); CB(btns.forward,"forward"); CB(btns.backward,"backward")
    States.Fly = true
    task.spawn(function()
        while States.Fly and HRP do
            pcall(function()
                Storage.FlyBG.CFrame = Services.Workspace.CurrentCamera.CFrame
                local v = Vector3.new(0,0,0); local c = Services.Workspace.CurrentCamera
                if Services.UserInputService:IsKeyDown(Enum.KeyCode.W) or fs.forward then v = v + (c.CFrame.LookVector * Config.FlySpeed) end
                if Services.UserInputService:IsKeyDown(Enum.KeyCode.S) or fs.backward then v = v - (c.CFrame.LookVector * Config.FlySpeed) end
                if Services.UserInputService:IsKeyDown(Enum.KeyCode.A) or fs.left then v = v - (c.CFrame.RightVector * Config.FlySpeed) end
                if Services.UserInputService:IsKeyDown(Enum.KeyCode.D) or fs.right then v = v + (c.CFrame.RightVector * Config.FlySpeed) end
                if Services.UserInputService:IsKeyDown(Enum.KeyCode.Space) or fs.up then v = v + Vector3.new(0, Config.FlySpeed, 0) end
                if Services.UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or fs.down then v = v - Vector3.new(0, Config.FlySpeed, 0) end
                Storage.FlyBV.Velocity = v
            end)
            task.wait()
        end
        if Storage.FlyBG then Storage.FlyBG:Destroy(); Storage.FlyBG=nil end
        if Storage.FlyBV then Storage.FlyBV:Destroy(); Storage.FlyBV=nil end
        if Storage.FlyGUI and Storage.FlyGUI.SG then pcall(function() Storage.FlyGUI.SG:Destroy() end) end
        Storage.FlyGUI=nil
    end)
end

local function StopFly() States.Fly=false end

-- ====== Infinite Jump ======
local function InfiniteJumpToggle(enable)
    States.InfiniteJump = enable
    if enable then
        if Storage.Connections.IJ then Storage.Connections.IJ:Disconnect() end
        Storage.Connections.IJ = Services.UserInputService.JumpRequest:Connect(function()
            if States.InfiniteJump and Hum then Hum:ChangeState(Enum.HumanoidStateType.Jumping) end
        end)
    else
        if Storage.Connections.IJ then Storage.Connections.IJ:Disconnect(); Storage.Connections.IJ=nil end
    end
end

-- ====== Lighting ======
local function ApplyNoFog()
    Services.Lighting.FogEnd = States.NoFog and 100000 or 500
    Services.Lighting.FogStart = 0
end

local function ApplyFullBright()
    if States.FullBright then
        Services.Lighting.Brightness = 2; Services.Lighting.ClockTime = 14; Services.Lighting.GlobalShadows = false
        Services.Lighting.OutdoorAmbient = Color3.fromRGB(128,128,128)
    else
        Services.Lighting.Brightness = 1; Services.Lighting.GlobalShadows = true
        Services.Lighting.OutdoorAmbient = Color3.fromRGB(70,70,70)
    end
end

local function ApplyAntiLag()
    if States.AntiLag then
        pcall(function()
            settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
            Services.Lighting.GlobalShadows = false
            Services.Lighting.FogEnd = 100
            for _, obj in pairs(Services.Workspace:GetDescendants()) do
                if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Sparkles") then obj.Enabled = false end
                if obj:IsA("Decal") or obj:IsA("Texture") then obj.Transparency = 1 end
            end
        end)
    else
        pcall(function()
            settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
            Services.Lighting.GlobalShadows = true
            Services.Lighting.FogEnd = 500
            for _, obj in pairs(Services.Workspace:GetDescendants()) do
                if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Sparkles") then obj.Enabled = true end
                if obj:IsA("Decal") or obj:IsA("Texture") then obj.Transparency = 0 end
            end
        end)
    end
end

-- ====== AutoFood ======
local function AutoFoodLoop()
    task.spawn(function()
        while States.AutoFood do
            if Hum and Hum.Health < (Hum.MaxHealth * 0.5) then
                for _,i in pairs(LP.Backpack:GetChildren()) do
                    if table.find(Items.food, i.Name) or table.find(Items.healing, i.Name) then
                        pcall(function()
                            Hum:EquipTool(i); task.wait(0.1)
                            if i and (i:FindFirstChild("Activate") or i.Activate) then if i.Activate then i:Activate() end end
                        end)
                        task.wait(1); break
                    end
                end
            end
            task.wait(1)
        end
    end)
end

-- ====== Children finder / tween ======
function FindAllChildren()
    local found = {}
    local ws = Services.Workspace
    Storage.ChildCounter = 0
    if ws:FindFirstChild("NPCs") then
        for _,npc in pairs(ws.NPCs:GetChildren()) do
            if npc:IsA("Model") then
                for _, childName in ipairs(ChildNames) do
                    if npc.Name:find(childName) then
                        local hrp = npc:FindFirstChild("HumanoidRootPart") or npc:FindFirstChild("Torso")
                        if hrp and HRP then
                            Storage.ChildCounter = Storage.ChildCounter + 1
                            local dist = (hrp.Position - HRP.Position).Magnitude
                            table.insert(found, { Model = npc, Part = hrp, Distance = math.floor(dist), Position = hrp.Position, Name = "CHILD #"..Storage.ChildCounter, DisplayName = childName.." ["..math.floor(dist).."m]" })
                        end
                        break
                    end
                end
            end
        end
    end
    if #found == 0 then
        for _, obj in pairs(ws:GetDescendants()) do
            if obj:IsA("Model") then
                for _, childName in ipairs(ChildNames) do
                    if obj.Name:find(childName) then
                        local hrp = obj:FindFirstChild("HumanoidRootPart") or obj:FindFirstChild("Torso")
                        if hrp and HRP then
                            local dist = (hrp.Position - HRP.Position).Magnitude
                            if dist <= 5000 then
                                Storage.ChildCounter = Storage.ChildCounter + 1
                                table.insert(found, { Model = obj, Part = hrp, Distance = math.floor(dist), Position = hrp.Position, Name = "CHILD #"..Storage.ChildCounter, DisplayName = childName.." ["..math.floor(dist).."m]" })
                            end
                        end
                        break
                    end
                end
            end
        end
    end
    table.sort(found, function(a,b) return a.Distance < b.Distance end)
    Storage.ChildrenCache = found
    return found
end

local function TweenToChild(childData)
    if not childData or not childData.Part or not HRP then return end
    task.spawn(function()
        pcall(function()
            local targetPos = childData.Part.Position
            local distance = (HRP.Position - targetPos).Magnitude
            local tweenTime = math.max(0.5, distance / 300)
            local tweenInfo = TweenInfo.new(tweenTime, Enum.EasingStyle.Linear)
            local goal = { CFrame = CFrame.new(targetPos + Vector3.new(0,5,0)) }
            local tween = Services.TweenService:Create(HRP, tweenInfo, goal)
            Notify("Going to Child", childData.DisplayName, 2)
            tween:Play(); tween.Completed:Wait()
            Notify("Arrived!", childData.DisplayName, 2)
        end)
    end)
end

-- ====== Bring Items ======
local function BringItemsToPlayer(itemList, categoryName)
    task.spawn(function()
        if not HRP then return end
        local playerPos = HRP.Position
        local count = 0
        
        for _, itemName in pairs(itemList) do
            for _, item in pairs(Services.Workspace:GetDescendants()) do
                if item.Name == itemName and item:IsA("BasePart") then
                    pcall(function()
                        local distance = (item.Position - playerPos).Magnitude
                        if distance <= Config.BringDistance then
                            local itemID = tostring(item:GetDebugId())
                            if not Storage.BroughtItems[itemID] then
                                Storage.BroughtItems[itemID] = true
                                
                                -- APENAS 1 ITEM - SEM MULTIPLICAÇÃO
                                local clonedItem = item:Clone()
                                local safePos = playerPos + Vector3.new(
                                    math.random(-5, 5),
                                    math.random(3, 8),
                                    math.random(-5, 5)
                                )
                                clonedItem.Anchored = false
                                clonedItem.CanCollide = true
                                clonedItem.CFrame = CFrame.new(safePos)
                                clonedItem.Parent = Services.Workspace
                                count = count + 1
                                task.wait(0.05)
                                
                                task.delay(10, function()
                                    Storage.BroughtItems[itemID] = nil
                                end)
                            end
                        end
                    end)
                elseif item:IsA("Model") and item.Name == itemName then
                    pcall(function()
                        local part = item.PrimaryPart or item:FindFirstChildOfClass("BasePart")
                        if part then
                            local distance = (part.Position - playerPos).Magnitude
                            if distance <= Config.BringDistance then
                                local itemID = tostring(item:GetDebugId())
                                if not Storage.BroughtItems[itemID] then
                                    Storage.BroughtItems[itemID] = true
                                    
                                    -- APENAS 1 ITEM - SEM MULTIPLICAÇÃO
                                    local clonedModel = item:Clone()
                                    local safePos = playerPos + Vector3.new(
                                        math.random(-5, 5),
                                        math.random(3, 8),
                                        math.random(-5, 5)
                                    )
                                    if clonedModel.PrimaryPart then
                                        clonedModel:SetPrimaryPartCFrame(CFrame.new(safePos))
                                    else
                                        local mainPart = clonedModel:FindFirstChildOfClass("BasePart")
                                        if mainPart then
                                            mainPart.CFrame = CFrame.new(safePos)
                                        end
                                    end
                                    clonedModel.Parent = Services.Workspace
                                    count = count + 1
                                    task.wait(0.05)
                                    
                                    task.delay(10, function()
                                        Storage.BroughtItems[itemID] = nil
                                    end)
                                end
                            end
                        end
                    end)
                end
            end
        end
        
        if count > 0 then
            Rayfield:Notify({
                Title = categoryName,
                Content = count .. " items brought",
                Duration = 2
            })
        end
    end)
end

task.spawn(function()
    while true do
        task.wait(3)
        if States.BringFuel then BringItemsToPlayer(Items.fuel, "⛽ Fuel") end
        if States.BringFood then BringItemsToPlayer(Items.food, "🍖 Food") end
        if States.BringWeapons then BringItemsToPlayer(Items.weapons, "⚔️ Weapons") end
        if States.BringArmor then BringItemsToPlayer(Items.armor, "🛡️ Armor") end
        if States.BringScrap then BringItemsToPlayer(Items.scrap, "🔩 Scrap") end
        if States.BringPelts then BringItemsToPlayer(Items.pelts, "🦴 Pelts") end
        if States.BringBlueprints then BringItemsToPlayer(Items.blueprints, "📜 Blueprints") end
        if States.BringHealing then BringItemsToPlayer(Items.healing, "💊 Healing") end
        if States.BringBags then BringItemsToPlayer(Items.bags, "🎒 Bags") end
    end
end)

-- ====== Teleport helper (simple) ======
local function FindLocation(partName)
    for _, obj in pairs(Services.Workspace:GetDescendants()) do
        if obj.Name == partName then
            if obj:IsA("Model") then local p = obj.PrimaryPart or obj:FindFirstChildOfClass("BasePart"); if p then return p.Position end
            elseif obj:IsA("BasePart") then return obj.Position end
        end
    end
    return nil
end
local function TeleportToLocation(locationData)
    local pos = FindLocation(locationData.part)
    if pos and HRP then pcall(function() HRP.CFrame = CFrame.new(pos + Vector3.new(0,5,0)); Notify("Teleported", locationData.name, 2) end) else Notify("Not Found", locationData.name, 2) end
end

-- ====== Classes ======
local function GetClass(className)
    pcall(function()
        local setClass = Services.ReplicatedStorage:FindFirstChild("SetClass")
        if setClass and setClass.FireServer then setClass:FireServer(className); Notify("Class Changed", className, 2) else Notify("Error", "SetClass not found", 2) end
    end)
end

-- ====== Player Stats ======
local function GetPlayerStats()
    local friends = 0
    for _,p in pairs(Services.Players:GetPlayers()) do if p~=LP and LP:IsFriendsWith(p.UserId) then friends = friends + 1 end end
    local accountAge = LP.AccountAge or 0
    local createdDate = os.date("%d/%m/%Y", os.time() - (accountAge * 86400))
    local gName = "Unknown"
    pcall(function() gName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name end)
    return { Name=LP.Name, DisplayName=LP.DisplayName, Game=gName, Players=#Services.Players:GetPlayers(), Friends=friends, AccountAge=accountAge.." days", Created=createdDate }
end

-- ====== Character added reapply ======
Services.Players.LocalPlayer.CharacterAdded:Connect(function(c)
    Char = c; HRP = c:WaitForChild("HumanoidRootPart"); Hum = c:WaitForChild("Humanoid")
    task.wait(1)
    if States.SuperSpeed then SuperSpeedToggle(true) end
    if States.NoClip then NoClipToggle(true) end
    if States.InfiniteJump then InfiniteJumpToggle(true) end
    if States.GodMode then GodModeToggle(true) end
    if States.Fly then StartFly() end
end)

-- ====== Floating Button (same style you used) ======
local floatingName = "DarkHubFloatingButton"
local function createFloatingButton()
    local playerGui = LP:FindFirstChild("PlayerGui") or LP:WaitForChild("PlayerGui")
    local existing = playerGui:FindFirstChild(floatingName)
    if existing then existing:Destroy() end
    local screenGui = Instance.new("ScreenGui"); screenGui.Name = floatingName; screenGui.ResetOnSpawn=false; screenGui.Parent = playerGui
    local imageButton = Instance.new("ImageButton"); imageButton.Name="FloatingButton"; imageButton.Size=UDim2.new(0,50,0,50); imageButton.Position=UDim2.new(1,-110,0,10)
    imageButton.BackgroundTransparency=1; imageButton.Image="rbxassetid://127146707195866"; imageButton.Parent=screenGui
    local uiStroke = Instance.new("UIStroke", imageButton); uiStroke.Thickness=4; uiStroke.Color=Color3.fromRGB(0,90,255)
    Instance.new("UICorner", imageButton)
    local WindowHidden=false
    imageButton.MouseButton1Click:Connect(function() pcall(function() Window:Minimize(); WindowHidden = not WindowHidden end) end)
    -- drag
    local dragging=false; local startPos; local startImagePos
    imageButton.InputBegan:Connect(function(input)
        if input.UserInputType==Enum.UserInputType.MouseButton1 then
            dragging=true; startPos=input.Position; startImagePos=imageButton.Position
            input.Changed:Connect(function() if input.UserInputState==Enum.UserInputState.End then dragging=false end end)
        end
    end)
    imageButton.InputChanged:Connect(function(input)
        if input.UserInputType==Enum.UserInputType.MouseMovement and dragging then
            local delta = input.Position - startPos
            imageButton.Position = UDim2.new(startImagePos.X.Scale, startImagePos.X.Offset + delta.X, startImagePos.Y.Scale, startImagePos.Y.Offset + delta.Y)
        end
    end)
end
pcall(createFloatingButton)

-- ====== UI Bindings: add controls to tabs ======

-- COMBAT
Tabs.Combat:AddToggle("Auto_Hit", { Title = "Auto Hit", Default = false, Callback = function(v) getgenv().LH_AutoHit = v if v then StartAutoHit() else StopAutoHit() end end })
Tabs.Combat:AddToggle("Auto_Farm", { Title = "Auto Farm Enemies", Default = false, Callback = function(v) getgenv().LH_AutoFarm = v if v then StartAutoFarm() else StopAutoFarm() end end })
Tabs.Combat:AddToggle("KillAura_Toggle", { Title = "Kill Aura", Default = false, Callback = function(v) States.KillAura = v if v then KillAuraLoop() end end })
Tabs.Combat:AddSlider("Kill_Range", { Title = "Kill Range", Min = 5, Max = 50, Default = Config.KillAuraRange, Rounding = 1, Callback = function(val) Config.KillAuraRange = val end })
Tabs.Combat:AddToggle("GodMode", { Title = "God Mode", Default = false, Callback = function(v) GodModeToggle(v) end })
Tabs.Combat:AddButton({ Title = "Expand Hitboxes", Callback = function() for _,n in pairs(Services.Workspace:GetDescendants()) do if n:IsA("Model") and table.find(MobList, n.Name) then local h=n:FindFirstChild("HumanoidRootPart"); if h then h.Size=Vector3.new(50,50,50); h.Transparency=1; h.CanCollide=false end end end Notify("Hitbox","Expanded!",2) end })

-- MOVEMENT
Tabs.Movement:AddToggle("SuperSpeed", { Title = "Super Speed", Default = false, Callback = function(v) SuperSpeedToggle(v) end })
Tabs.Movement:AddSlider("Speed", { Title = "Speed", Min = 16, Max = 500, Default = Config.Speed, Rounding = 0, Callback = function(v) Config.Speed = v if States.SuperSpeed then SuperSpeedToggle(true) end end })
Tabs.Movement:AddToggle("NoClip", { Title = "NoClip", Default = false, Callback = function(v) NoClipToggle(v) end })
Tabs.Movement:AddToggle("Fly", { Title = "Fly", Default = false, Callback = function(v) if v then StartFly() else StopFly() end end })
Tabs.Movement:AddSlider("FlySpeed", { Title = "Fly Speed", Min = 10, Max = 500, Default = Config.FlySpeed, Rounding = 0, Callback = function(v) Config.FlySpeed = v end })
Tabs.Movement:AddToggle("InfiniteJump", { Title = "Infinite Jump", Default = false, Callback = function(v) InfiniteJumpToggle(v) end })

-- VISUAL
Tabs.Visual:AddToggle("RemoveFog", { Title = "Remove Fog", Default = false, Callback = function(v) States.NoFog = v; ApplyNoFog() end })
Tabs.Visual:AddToggle("FullBright", { Title = "Full Bright", Default = false, Callback = function(v) States.FullBright = v; ApplyFullBright() end })
Tabs.Visual:AddToggle("AntiLag", { Title = "Anti Lag", Default = false, Callback = function(v) States.AntiLag = v; ApplyAntiLag() end })

-- ESP
Tabs.ESP:AddToggle("ESPPlayers", { Title = "ESP Players", Default = false, Callback = function(v) States.ESPPlayers = v; UpdatePlayerESP() end })
Tabs.ESP:AddToggle("ESPEnemies", { Title = "ESP Enemies", Default = false, Callback = function(v) States.ESPEnemies = v; UpdateEnemyESP() end })
Tabs.ESP:AddToggle("ESPChilds", { Title = "ESP Children", Default = false, Callback = function(v) States.ESPChilds = v; UpdateChildESP() end })
Tabs.ESP:AddButton({ Title = "Update All ESP", Callback = function() UpdatePlayerESP(); UpdateEnemyESP(); UpdateChildESP(); Notify("ESP","Updated",2) end })
Tabs.ESP:AddButton({ Title = "Clear ESP", Callback = function() ClearESP(); Notify("ESP","Cleared",2) end })

-- BRING
Tabs.Bring:AddSlider("MaxDistance", { Title = "Max Distance", Min = 50, Max = 1000, Default = Config.BringDistance, Rounding = 0, Callback = function(v) Config.BringDistance = v end })
Tabs.Bring:AddToggle("BringFuel", { Title = "Bring Fuel", Default = false, Callback = function(v) States.BringFuel = v end })
Tabs.Bring:AddToggle("BringFood", { Title = "Bring Food", Default = false, Callback = function(v) States.BringFood = v end })
Tabs.Bring:AddToggle("BringWeapons", { Title = "Bring Weapons", Default = false, Callback = function(v) States.BringWeapons = v end })
Tabs.Bring:AddToggle("BringArmor", { Title = "Bring Armor", Default = false, Callback = function(v) States.BringArmor = v end })
Tabs.Bring:AddToggle("BringScrap", { Title = "Bring Scrap", Default = false, Callback = function(v) States.BringScrap = v end })
Tabs.Bring:AddToggle("BringPelts", { Title = "Bring Pelts", Default = false, Callback = function(v) States.BringPelts = v end })
Tabs.Bring:AddToggle("BringBlueprints", { Title = "Bring Blueprints", Default = false, Callback = function(v) States.BringBlueprints = v end })
Tabs.Bring:AddToggle("BringHealing", { Title = "Bring Healing", Default = false, Callback = function(v) States.BringHealing = v end })
Tabs.Bring:AddToggle("BringBags", { Title = "Bring Bags & Flashlights", Default = false, Callback = function(v) States.BringBags = v end })

-- KIDS
Tabs.Kids:AddParagraph({ Title = "Missing Children", Content = "• Dino Kid\n• Kraken Kid\n• Squid Kid\n• Koala Kid" })
Tabs.Kids:AddButton({ Title = "Scan All Children", Callback = function() Notify("Scanning","Searching workspace...",2); Storage.ChildrenCache = {}; Storage.ChildCounter = 0; local ch = FindAllChildren(); if #ch>0 then Notify("Found", tostring(#ch).." children!",3) else Notify("No Children","Try moving to another area",3) end end })
Tabs.Kids:AddButton({ Title = "Go to Nearest Child", Callback = function() if #Storage.ChildrenCache==0 then Notify("Error","Scan first!",2); return end TweenToChild(Storage.ChildrenCache[1]) end })
Tabs.Kids:AddButton({ Title = "Show Children Locations", Callback = function() if #Storage.ChildrenCache==0 then Notify("Error","Scan first!",2); return end local msg="Children:\n"; for i,c in ipairs(Storage.ChildrenCache) do if i<=6 then msg = msg..i..". "..c.DisplayName.."\n" end end Notify("Locations", msg, 5) end })
Tabs.Kids:AddButton({ Title = "Reset Scanner", Callback = function() Storage.ChildrenCache = {}; Storage.ChildCounter = 0; ClearESP(); Notify("Reset","Scanner cleared",2) end })

-- TELEPORTS (sample list; you can replace with game-specific Locations)
for _,t in ipairs({ {"Spawn",Vector3.new(0,5,0)}, {"Cabin",Vector3.new(20,5,50)}, {"Deep Forest",Vector3.new(200,10,200)}, {"Mountain",Vector3.new(350,50,150)} }) do
    Tabs.Teleport:AddButton({ Title = t[1], Callback = function() if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then LP.Character.HumanoidRootPart.CFrame = CFrame.new(t[2]) end end })
end

-- MIsc
Tabs.Misc:AddParagraph({ Title = "*Bring*", Content = "Don't worry about bugs, I'm fixing them!" })
Tabs.Misc:AddToggle("FPS_Counter", { Title = "FPS Counter", Default = true, Callback = function(v) States.ShowFPS = v if v then CreateFPS() else DestroyFPS() end end })
Tabs.Misc:AddButton({ Title = "Reload Character", Callback = function() pcall(function() LP.Character:BreakJoints() end) end })
Tabs.Misc:AddButton({ Title = "Clear ESP", Callback = function() ClearESP(); Notify("ESP", "Cleared!", 2) end })
Tabs.Misc:AddButton({ Title = "Reset Item Cache", Callback = function() Storage.BroughtItems = {}; Notify("Cache","Reset!",2) end })

-- ====== Info / Utilities: destroy & reload ======
Tabs.Misc:AddButton({ Title = "Destroy / Reset", Callback = function()
    -- turn off toggles/loops
    getgenv().LH_AutoHit = false; getgenv().LH_AutoFarm = false; getgenv().LH_AutoWood = false
    States = {}; for k in pairs(Storage.Connections) do pcall(function() if Storage.Connections[k] and Storage.Connections[k].Disconnect then Storage.Connections[k]:Disconnect() end end) end
    ClearESP(); DestroyFPS()
    pcall(function() local pg = LP:FindFirstChild("PlayerGui"); local ex = pg and pg:FindFirstChild(floatingName); if ex then ex:Destroy() end end)
    Notify("Legend Hub", "Reset completo", 3)
end })

Tabs.Misc:AddButton({ Title = "Close UI", Callback = function() Window:Close() end })

-- ====== Ensure flags exist & small startup ======
getgenv().LH_AutoHit = false; getgenv().LH_AutoFarm = false; getgenv().LH_AutoWood = false
task.delay(0.2, function() Notify("Legend Hub", "Carregado: Legend Hub | 99 Nights", 4) end)
