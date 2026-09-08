--[[
    ╔═══════════════════════════════════════╗
    ║      Fixz Hub | Blade Ball           ║
    ║    With Working Auto Parry System    ║
    ╚═══════════════════════════════════════╝
]]

repeat task.wait() until game:IsLoaded()

local VALID_KEY = "Fixz2025"
local DISCORD_LINK = "https://discord.gg/G4AuBncANE"

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local Stats = game:GetService("Stats")

-- Player Setup
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local ServerStatsItem = Stats.Network.ServerStatsItem

-- Auto Parry Variables
local Remotes = {}
local Parry_Key = nil
local Connections_Manager = {}
local Parries = 0
local Parried = false
local Closest_Entity = nil
local Selected_Parry_Type = "Straight"
local VelHist = {}
local LastWarp = tick()
local LastCurve = tick()
local LR = 0
local Tornado_Time = tick()
local Spamming = false
local Xurr = (0.7 + (8 - 1) * (0.35 / 99))

-- Find Remote Keys
task.spawn(function()
    for _, Value in pairs(getgc()) do
        if ((type(Value) == "function") and islclosure(Value)) then
            if debug.getupvalues(Value) then
                local Protos = debug.getprotos(Value)
                local Upvalues = debug.getupvalues(Value)
                local Constants = debug.getconstants(Value)
                if ((#Protos == 4) and (#Upvalues == 24) and (#Constants == 104)) then
                    Remotes[debug.getupvalue(Value, 16)] = debug.getconstant(Value, 62)
                    Parry_Key = debug.getupvalue(Value, 17)
                    Remotes[debug.getupvalue(Value, 18)] = debug.getconstant(Value, 64)
                    Remotes[debug.getupvalue(Value, 19)] = debug.getconstant(Value, 65)
                    break
                end
            end
        end
    end
end)

-- StarX Functions
local StarX = {}

StarX.FetchBall = function()
    local folder = Workspace:FindFirstChild(Workspace.Alive:FindFirstChild(tostring(LocalPlayer)) and "Balls" or "TrainingBalls")
    if not folder then return end
    
    for _, ball in ipairs(folder:GetChildren()) do
        if ball:GetAttribute("realBall") then
            ball.CanCollide = false
            return ball
        end
    end
end

StarX.FetchBalls = function()
    local folder = Workspace:FindFirstChild(Workspace.Alive:FindFirstChild(tostring(LocalPlayer)) and "Balls" or "TrainingBalls")
    if not folder then return {} end
    
    local balls = {}
    for _, ball in ipairs(folder:GetChildren()) do
        if ball:GetAttribute("realBall") then
            ball.CanCollide = false
            balls[#balls + 1] = ball
        end
    end
    return balls
end

StarX.Get_Closest = function()
    local Max_Distance = math.huge
    for _, Entity in pairs(Workspace.Alive:GetChildren()) do
        if (tostring(Entity) ~= tostring(LocalPlayer)) then
            local Distance = LocalPlayer:DistanceFromCharacter(Entity.PrimaryPart.Position)
            if (Distance < Max_Distance) then
                Max_Distance = Distance
                Closest_Entity = Entity
            end
        end
    end
    return Closest_Entity
end

StarX.Lerp = function(a, b, t)
    return a + (b - a) * t
end

StarX.Parry_Data = function()
    local cam = Workspace.CurrentCamera
    local char = LocalPlayer.Character
    if not cam then return {0, CFrame.new(), {}, {0, 0}} end
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return {0, CFrame.new(), {}, {0, 0}} end
    
    local ccf = cam.CFrame
    local cpos = cam.CFrame.Position
    local look = cam.CFrame.LookVector
    local right = cam.CFrame.RightVector
    local up = cam.CFrame.UpVector
    local vs = cam.ViewportSize
    
    local mouse = UserInputService:GetMouseLocation()
    local Vector2_Mouse_Location = {mouse.X, mouse.Y}
    
    local events = {}
    for _, v in ipairs(Workspace.Alive:GetChildren()) do
        local pp = v.PrimaryPart
        if pp then events[tostring(v)] = cam:WorldToScreenPoint(pp.Position) end
    end
    
    local dirCF
    if Selected_Parry_Type == "Straight" then
        local closest, dist, mv = nil, math.huge, Vector2.new(mouse.X, mouse.Y)
        for _, v in ipairs(Workspace.Alive:GetChildren()) do
            if v ~= char and v.PrimaryPart then
                local pos, onScreen = cam:WorldToScreenPoint(v.PrimaryPart.Position)
                if onScreen then
                    local d = (mv - Vector2.new(pos.X, pos.Y)).Magnitude
                    if d < dist then dist, closest = d, v end
                end
            end
        end
        local target = closest or StarX.Get_Closest()
        dirCF = CFrame.new(hrp.Position, (target and target.PrimaryPart and target.PrimaryPart.Position) or (hrp.Position + look * 100))
    else
        local dirs = {
            Custom = ccf,
            Random = CFrame.new(cpos, Vector3.new(math.random(-3e3, 3e3), math.random(-3e3, 3e3), math.random(-3e3, 3e3))),
            Backwards = CFrame.new(cpos, cpos - look * 1e3),
            Up = CFrame.new(cpos, cpos + up * 1e3),
            Right = CFrame.new(cpos, cpos + right * 1e3),
            Left = CFrame.new(cpos, cpos - right * 1e3)
        }
        dirCF = dirs[Selected_Parry_Type] or ccf
    end
    
    return {0, dirCF, events, Vector2_Mouse_Location}
end

StarX.Parry = function()
    local data = StarX.Parry_Data()
    for r, a in pairs(Remotes) do
        r:FireServer(a, Parry_Key, data[1], data[2], data[3], data[4])
    end
    if Parries > 7 then return false end
    Parries = Parries + 1
    task.delay(0.6, function() if Parries > 0 then Parries = Parries - 1 end end)
end

StarX.Curved = function()
    local b = StarX.FetchBall()
    if not b or not b:FindFirstChild("zoomies") then return false end
    
    local z, v = b.zoomies, b.zoomies.VectorVelocity
    local s, d = v.Magnitude, v.Unit
    local r = LocalPlayer.Character and LocalPlayer.Character.PrimaryPart
    if not r then return false end
    
    local p, bp = r.Position, b.Position
    local dir, dist = (p - bp).Unit, (p - bp).Magnitude
    local dot = dir:Dot(d)
    local ping = ServerStatsItem["Data Ping"]:GetValue()
    
    if ping > 150 then 
        ping = ping * 1.1
    elseif ping > 200 then 
        ping = ping * 1.25
    end
    
    table.insert(VelHist, v)
    if #VelHist > 4 then table.remove(VelHist, 1) end
    
    local rt = dist / s - ping / 985
    local dT = 15 - math.min(dist / 1000, 15) + math.min(s / 100, 40)
    
    if s > 160 and rt > ping / 9.85 then
        local adjust = s < 300 and 15 or s < 600 and 16 or s < 1000 and 17 or s < 1500 and 19 or 20
        dT = math.max(dT - adjust, adjust)
    end
    
    if dist < dT then return false end
    
    local curve_time = s < 300 and rt / 1.2 or s < 450 and rt / 1.21 or s < 600 and rt / 1.335 or rt / 1.5
    if (tick() - LastCurve) < curve_time then return true end
    
    local dth = 0.485 - ping / 985
    local diff = dir:Dot((d - v.Unit).Unit)
    if (dot - diff) < dth then return true end
    
    local rad = math.deg(math.asin(math.clamp(dot, -1, 1)))
    LR = StarX.Lerp(LR, rad, 0.8)
    
    local warp_time = s < 300 and rt / 1.185 or rt / 1.5
    local warp_thres = s < 300 and 0.0205 or 0.018
    if LR < warp_thres then LastWarp = tick() end
    if (tick() - LastWarp) < warp_time then return true end
    
    return dot < dth
end

-- Main Script Function
local function LoadMainScript()
    -- Load Wind UI
    local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

    -- Variables
    local AutoParryEnabled = false
    local AutoSpamEnabled = false
    local SpeedEnabled = false
    local SpeedValue = 20

    -- Create Window
    local Window = WindUI:CreateWindow({
        Title = "Fixz Hub | Blade Ball",
        Icon = "rbxassetid://10723434711",
        Author = "Fixz",
        Folder = "FixzHub/BladeBall",
        Size = UDim2.fromOffset(450, 400),
        Transparent = true,
        Theme = "Dark",
        SideBarWidth = 150,
    })

    -- Tabs
    local Main = Window:Tab({Title = "Combat", Icon = "swords"})
    local Settings = Window:Tab({Title = "Settings", Icon = "settings"})
    local Misc = Window:Tab({Title = "Misc", Icon = "info"})

    -- Main Section
    Main:Section({Title = "Auto Parry System", Icon = "shield"})

    Main:Toggle({
        Title = "Auto Parry",
        Description = "Automatically parry incoming balls",
        Default = false,
        Callback = function(v)
            AutoParryEnabled = v
            if v then
                Connections_Manager["Auto_Parry"] = RunService.PreSimulation:Connect(function()
                    local char = LocalPlayer.Character
                    if not char then return end
                    StarX.Get_Closest()
                    local hrp = char:FindFirstChild("HumanoidRootPart")
                    if not hrp then return end
                    
                    local balls = StarX.FetchBalls()
                    local oneBall = StarX.FetchBall()
                    local oneTarget = oneBall and oneBall:GetAttribute("target")
                    local statsPing = ServerStatsItem["Data Ping"]:GetValue() / 10
                    statsPing = statsPing > 200 and statsPing * 1.25 or statsPing > 150 and statsPing * 1.1 or statsPing
                    
                    for _, ball in pairs(balls) do
                        local zoom = ball and ball:FindFirstChild("zoomies")
                        if not zoom then continue end
                        ball:GetAttributeChangedSignal("target"):Once(function() Parried = false end)
                        if Parried then return end
                        
                        local target = ball:GetAttribute("target")
                        local pos, vel = ball.Position, zoom.VectorVelocity
                        local dist, spd = (hrp.Position - pos).Magnitude, vel.Magnitude
                        
                        if oneTarget == tostring(LocalPlayer) and StarX.Curved() then return end
                        if Spamming then return end
                        
                        local future = pos + vel * (statsPing / 1000)
                        if oneTarget == tostring(LocalPlayer) and (hrp.Position - future).Unit:Dot(vel.Unit) < 0 then return end
                        
                        local divisor = (2.4 + math.min(math.max(spd - 9.5, 0), 820) * 0.002) * Xurr
                        local acc = statsPing + math.max(spd / divisor, 9.5)
                        
                        if target == tostring(LocalPlayer) and dist <= acc then
                            StarX.Parry()
                            Parried = true
                        end
                        
                        local t = tick()
                        repeat RunService.PreSimulation:Wait() until tick() - t >= 1 or not Parried
                        Parried = false
                    end
                end)
                WindUI:Notify({Title = "Auto Parry", Content = "Enabled!", Duration = 3})
            else
                if Connections_Manager["Auto_Parry"] then
                    Connections_Manager["Auto_Parry"]:Disconnect()
                    Connections_Manager["Auto_Parry"] = nil
                end
                WindUI:Notify({Title = "Auto Parry", Content = "Disabled!", Duration = 3})
            end
        end
    })

    Main:Toggle({
        Title = "Auto Spam Parry",
        Description = "Spam parries when near opponents",
        Default = false,
        Callback = function(v)
            AutoSpamEnabled = v
            if v then
                Connections_Manager["Auto_Spam"] = RunService.PreSimulation:Connect(function(deltaTime)
                    local Ball = StarX.FetchBall()
                    if not Ball or not Ball:FindFirstChild("zoomies") then 
                        Spamming = false 
                        return 
                    end
                    
                    local Root = Character and Character:FindFirstChild("HumanoidRootPart")
                    if not Root then 
                        Spamming = false 
                        return 
                    end
                    
                    if not Closest_Entity or not Closest_Entity.PrimaryPart then 
                        Spamming = false 
                        return 
                    end
                    
                    local Ping = ServerStatsItem["Data Ping"]:GetValue()
                    Ping = Ping > 200 and Ping * 1.35 or (Ping > 150 and Ping * 1.1 or Ping)
                    
                    local FPS = 1 / deltaTime
                    local AdjustRate = math.max((math.max(Ping, 150) / 150) * (60 / FPS), 0.7)
                    local BallVel = Ball.AssemblyLinearVelocity.Magnitude
                    local SpamDist = math.max((AdjustRate * 10) + math.min(BallVel / 6, 95), 17)
                    
                    local RootPos = Root.Position
                    local BallPos = Ball.Position
                    local TargetPos = Closest_Entity.PrimaryPart.Position
                    
                    local DistToBall = (RootPos - BallPos).Magnitude
                    local DistToTarget = (RootPos - TargetPos).Magnitude
                    
                    if DistToBall > SpamDist * 0.77 or DistToTarget > SpamDist then
                        Spamming = false
                        return
                    end
                    
                    Spamming = Parries > 1
                    if Spamming then StarX.Parry() end
                end)
                WindUI:Notify({Title = "Auto Spam", Content = "Enabled!", Duration = 3})
            else
                if Connections_Manager["Auto_Spam"] then
                    Connections_Manager["Auto_Spam"]:Disconnect()
                    Connections_Manager["Auto_Spam"] = nil
                    Spamming = false
                end
                WindUI:Notify({Title = "Auto Spam", Content = "Disabled!", Duration = 3})
            end
        end
    })

    -- Settings Section
    Settings:Section({Title = "Parry Settings", Icon = "sliders"})

    Settings:Dropdown({
        Title = "Parry Direction",
        Description = "Choose parry direction",
        Values = {"Straight", "Custom", "Random", "Backwards", "Up", "Right", "Left"},
        Default = "Straight",
        Callback = function(v)
            Selected_Parry_Type = v
        end
    })

    Settings:Section({Title = "Movement", Icon = "move"})

    Settings:Toggle({
        Title = "Speed Hack",
        Description = "Increase walk speed",
        Default = false,
        Callback = function(v)
            SpeedEnabled = v
        end
    })

    Settings:Slider({
        Title = "Walk Speed",
        Description = "Set walk speed value",
        Value = {Min = 16, Max = 100, Default = 20},
        Step = 1,
        Callback = function(v)
            SpeedValue = v
        end
    })

    -- Misc Section
    Misc:Section({Title = "Info", Icon = "info"})

    Misc:Button({
        Title = "Copy Discord Link",
        Description = "Join our Discord server",
        Callback = function()
            setclipboard(DISCORD_LINK)
            WindUI:Notify({Title = "Discord", Content = "Link copied!", Duration = 3})
        end
    })

    -- Speed Hack Loop
    task.spawn(function()
        RunService.Heartbeat:Connect(function()
            if SpeedEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid.WalkSpeed = SpeedValue
            end
        end)
    end)

    WindUI:Notify({Title = "Fixz Hub", Content = "Loaded successfully!", Duration = 5})
end

-- Key System
local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Obsidian = loadstring(game:HttpGet(repo .. "Library.lua"))()

local Window = Obsidian:CreateWindow({
    Title = "Fixz Hub | Blade Ball",
    Footer = "Key System",
    ToggleKeybind = Enum.KeyCode.RightControl,
    Icon = "rbxassetid://140278037137417",
    Size = UDim2.fromOffset(400, 300),
    Center = true,
    AutoShow = true
})

local Tabs = { KeyTab = Window:AddKeyTab("Key", "key") }

Tabs.KeyTab:AddLabel({ Text = "Fixz Hub Key System", Size = 20 })
Tabs.KeyTab:AddLabel({ Text = "Get key from discord.gg/G4AuBncANE", Size = 17 })

Tabs.KeyTab:AddButton({
    Text = "Copy Discord Link",
    Func = function()
        setclipboard(DISCORD_LINK)
        Obsidian:Notify("Discord link copied!", 10)
    end
})

Tabs.KeyTab:AddKeyBox(VALID_KEY, function(Success)
    if Success then
        Obsidian:Unload()
        LoadMainScript()
    else
        Obsidian:Notify("Wrong key! Get it from Discord.", 5)
    end
end)