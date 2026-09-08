--[[
  Gourdy~Holloway HUB 🎃 v3.2 | Silent Assassins Edition [BETA & WIP]
  Game: https://www.roblox.com/games/103854444055060/Silent-Assassins
  Build: 2026-07-08 | Size: ~28,000 chars
  
  UPDATES V3.2:
    - 50% Progressive Key Authentication System ("TESTER" Bypass for Shortxraze2021)
    - Complete runtime isolation (Tabs/Toggles stay completely unloaded until 100% status)
    - Dynamic chronological generator (Loads everything Tab-by-Tab and Toggle-by-Toggle)
    - Initialized automatic {WIP} Beta alerting frameworks
]]

if game.PlaceId ~= 103854444055060 then
    warn("[Nebula] Wrong game. Expected Silent Assassins.")
    return
end

--// Services
local Players = game:GetService("Players")
local RS = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")
local LP = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--// Load WindUI (Official Release Branch)
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

--// Main Window Setup
local Window = WindUI:CreateWindow({
    Title = "Gourdy~Holloway 🎃 Hub",
    Icon = "moon",
    Author = "Cosmic Edition",
    Folder = "NebulaHubV3",
    Size = UDim2.fromOffset(680, 540),
    Transparent = true,
    Theme = "Dark",
    Background = "rbxassetid://16702976832", -- Cosmic Galaxy Backdrop
    SideBarWidth = 210,
    User = {Enabled = true, Anonymous = false}
})

--//===========================================================================
--// INITIAL NOTIFICATIONS & DETECTION SYSTEMS
--//===========================================================================

-- Global Beta Build Notify (Triggers immediately on script boot)
WindUI:Notify({
    Title = "Beta Build Notice ⚠️",
    Content = "This script is currently an active Work In Progress {WIP}. Expect frequent updates and debugging cycles!",
    Duration = 7
})

-- Creator Live-Join Tracking
local function detectCreator(player)
    if player.Name == "Shortxraze2021" then
        WindUI:Notify({
            Title = "Creator Spotted! 👑",
            Content = "The legendary script author, Shortxraze2021, has entered the battlefield!",
            Duration = 15
        })
    end
end

for _, p in ipairs(Players:GetPlayers()) do detectCreator(p) end
Players.PlayerAdded:Connect(detectCreator)

--//===========================================================================
--// CORE INITIALIZATION TAB (Staged Environment)
--////===========================================================================
local Main = Window:Tab({Title="Main", Icon="rocket", Locked=false})
Main:Section({Title="Gourdy~Holloway Core Loader", TextXAlignment="Left", TextSize=18})
local statusPara = Main:Paragraph({Title="Status: Awaiting initialization...", Desc="Press Load to begin cosmic sync"})

local loaded = false
local verified = false
local enteredKey = ""

Main:Button({
    Title="Load Hub",
    Desc="Initialize all modules (0→100%)",
    Callback=function()
        if loaded then WindUI:Notify({Title="Nebula", Content="Already active.", Duration=2}) return end
        
        -- Staged Load Stage 1: 0% to 50%
        for i = 1, 50 do
            local filled = math.floor(i / 5)
            local bar = string.rep("█", filled) .. string.rep("░", 20 - filled)
            statusPara:SetTitle("Coding Nebula... [" .. bar .. "] " .. i .. "%")
            statusPara:SetDesc("Compiling runtime isolation hooks...")
            task.wait(0.02)
        end
        
        -- Gatekeeper Verification Stage (50%)
        if LP.Name == "Shortxraze2021" then
            statusPara:SetTitle("Coding Pumpkins🎃... [Bypassed for Creator 👑]")
            task.wait(0.6)
            verified = true
        else
            statusPara:SetTitle("Key Required 🔑 [50%]")
            statusPara:SetDesc("Please input the 'TESTER' access key below to unlock features.")
            
            local keyInput
            local verifyBtn
            
            keyInput = Main:Input({
                Title = "Enter Access Key",
                Placeholder = "Type tester validation key...",
                Callback = function(val)
                    enteredKey = val
                end
            })
            
            verifyBtn = Main:Button({
                Title = "Submit Authorization Key",
                Callback = function()
                    if enteredKey == "TESTER" then
                        verified = true
                        keyInput:Destroy()
                        verifyBtn:Destroy()
                    else
                        WindUI:Notify({Title = "Access Denied", Content = "Incorrect key payload! Unloading core assets...", Duration = 3})
                        task.wait(1.5)
                        Window:Destroy()
                    end
                end
            })
            
            -- Keep background thread locked until key validation flags true
            repeat task.wait(0.1) until verified
        end
        
        -- Staged Load Stage 2: 51% to 100%
        for i = 51, 100 do
            local filled = math.floor(i / 5)
            local bar = string.rep("█", filled) .. string.rep("░", 20 - filled)
            statusPara:SetTitle("Coding Nebula... [" .. bar .. "] " .. i .. "%")
            statusPara:SetDesc("Preparing structural interface injection mapping...")
            task.wait(0.02)
        end
        
        statusPara:SetTitle("Status: 100% - ONLINE")
        statusPara:SetDesc("Environment authenticated. Constructing layout modules...")
        loaded = true
        
        --//===========================================================================
--// DYNAMIC SEQUENTIAL INTERFACE RECONSTRUCTION (Tab-by-Tab, Toggle-by-Toggle)
--//===========================================================================
        task.spawn(function()
            task.wait(0.4)
            
            -- ------------------------------------------------------------------------
            -- Tab 1: Combat
            -- ------------------------------------------------------------------------
            local Combat = Window:Tab({Title="Combat", Icon="swords"})
            task.wait(0.15)
            Combat:Section({Title="Melee Mechanics"})
            task.wait(0.05)
            
            Combat:Toggle({Title="Fast Slash", Desc="Sets cooldown to 0.05", Default=false, Callback=function(s)
                getgenv().FastSlash=s
                while getgenv().FastSlash do
                    local c=LP.Character; local t=c and c:FindFirstChildOfClass("Tool")
                    if t then pcall(function() t:SetAttribute("attackCooldown",0.05) end) end
                    task.wait(0.15)
                end
            end})
            task.wait(0.06)
            
            Combat:Toggle({Title="Aimlock Player", Desc="Locks camera to nearest", Default=false, Callback=function(s)
                getgenv().Aimlock=s
                while getgenv().Aimlock do
                    local n,d=nil,math.huge
                    for _,p in ipairs(Players:GetPlayers()) do
                        if p~=LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                            local m=(p.Character.HumanoidRootPart.Position-LP.Character.HumanoidRootPart.Position).Magnitude
                            if m<d then n,d=p,m end
                        end
                    end
                    if n then workspace.CurrentCamera.CFrame=CFrame.lookAt(workspace.CurrentCamera.CFrame.Position, n.Character.Head.Position) end
                    RS.RenderStepped:Wait()
                end
            end})
            task.wait(0.06)
            
            Combat:Toggle({Title="Kill Aura", Desc="Auto hits nearby targets", Default=false, Callback=function(s)
                getgenv().KA=s
                while getgenv().KA do
                    for _,p in ipairs(Players:GetPlayers()) do
                        if p~=LP and p.Character then
                            local d=(p.Character.HumanoidRootPart.Position-LP.Character.HumanoidRootPart.Position).Magnitude
                            if d<15 then
                                local Event=ReplicatedStorage.Events.GameRemoteFunction
                                pcall(function() Event:InvokeServer("AttemptWeaponHit",{damage=100,attackCooldown=0.05,tool=LP.Character:FindFirstChildOfClass("Tool")},{{enemyModel=p.Character}}) end)
                            end
                        end
                    end
                    task.wait(0.2)
                end
            end})
            task.wait(0.06)
            
            Combat:Button({Title="Auto Kill All [100 Stud Front TP]", Desc="TP + spam Cobalt remote vectors", Callback=function()
                getgenv().AutoKill = not getgenv().AutoKill
                if not getgenv().AutoKill then return end
                task.spawn(function()
                    local Event = ReplicatedStorage.Events.GameRemoteFunction
                    while getgenv().AutoKill do
                        local char=LP.Character; if not char then task.wait() continue end
                        local hrp=char.HumanoidRootPart; local tool=char:FindFirstChildOfClass("Tool") or char:FindFirstChild("Thunder")
                        for _,plr in ipairs(Players:GetPlayers()) do
                            if plr~=LP and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character.Humanoid.Health>0 then
                                local tar=plr.Character.HumanoidRootPart
                                local dist=(tar.Position-hrp.Position).Magnitude
                                local front=hrp.CFrame.LookVector:Dot((tar.Position-hrp.Position).Unit) > 0.25
                                if dist<=100 and front then
                                    hrp.CFrame = tar.CFrame * CFrame.new(0,0,-3.5)
                                    hrp.CFrame = CFrame.lookAt(hrp.Position, tar.Position+Vector3.new(0,1.5,0))
                                    task.wait(0.05)
                                    for i=1,8 do
                                        if not getgenv().AutoKill then break end
                                        pcall(function()
                                            Event:InvokeServer("AttemptWeaponHit",
                                            {
                                                attackCycleData={lungeMult=2.25,attackTime=0.98333333333333,slowMult=0.2,hitboxOffsetAdd=Vector3.new(0,0,-1.5),hitboxSizeAdd=Vector3.new(0,0,3),knockbackMult=2.25,slowTime=1.5},
                                                knockback=112.5,shouldLock=true,shouldLunge=true,hitboxOffset=Vector3.new(0,0,-3),isCritical=false,shouldSlow=true,attackCooldown=0.05,damage=100,lungeKnockback=123.75,cycleIndex=4,slowMult=0.2,hitboxSize=Vector3.new(9,14,11),
                                                weaponDefinition={attackCycle={["1"]={knockbackMul=1,slowMult=0.2,attackTime=0.65,lungeMul=1,slowTime=1.5},["2"]={lungeMult=1,slowMult=0.2,attackTime=0.65,knockbackMult=1,slowTime=1.5},["3"]={lungeMult=0.75,slowMult=0.2,attackTime=0.71666666666667,knockbackMult=1.5,slowTime=1.5},["4"]={lungeMult=2.25,attackTime=0.98333333333333,slowMult=0.2,hitboxOffsetAdd=Vector3.new(0,0,-1.5),hitboxSizeAdd=Vector3.new(0,0,3),knockbackMult=2.25,slowTime=1.5}},attackOrder={"1","2","3","4"}},
                                                tool=tool,slowTime=1.5
                                            },
                                            {{knockback=112.5,isClosestEnemy=true,origin=hrp.Position,enemyModel=plr.Character,distance=dist,direction=(tar.Position-hrp.Position).Unit}})
                                        end)
                                        task.wait(0.045)
                                    end
                                end
                            end
                        end
                        task.wait(0.12)
                    end
                end)
            end})
            task.wait(0.06)
            
            Combat:Toggle({Title="No Recoil", Default=false, Callback=function(s) 
                getgenv().NR=s 
                task.spawn(function()
                    while getgenv().NR do
                        pcall(function()
                            local cam = workspace.CurrentCamera
                            if cam then cam.RotVelocity = Vector3.new(0,0,0) end
                            local char = LP.Character
                            local tool = char and char:FindFirstChildOfClass("Tool")
                            if tool and tool:FindFirstChild("Recoil") then tool.Recoil:Destroy() end
                        end)
                        task.wait()
                    end
                end)
            end})
            task.wait(0.06)
            
            Combat:Toggle({Title="Infinite Stamina", Default=false, Callback=function(s) getgenv().IS=s while getgenv().IS do pcall(function() LP.Character:SetAttribute("Stamina",100) end) task.wait() end end})
            task.wait(0.06)
            
            Combat:Toggle({Title="Critical Always", Default=false, Callback=function(s) 
                getgenv().Crit=s 
                local MT = getrawmetatable(game)
                local OldIndex = MT.__index
                setreadonly(MT, false)
                MT.__index = newcclosure(function(self, key)
                    if getgenv().Crit and tostring(self) == "AttemptWeaponHit" and key == "isCritical" then return true end
                    return OldIndex(self, key)
                end)
                setreadonly(MT, true)
            end})
            task.wait(0.06)
            
            Combat:Toggle({Title="Damage Boost x3", Default=false, Callback=function(s) 
                getgenv().DB=s 
                local OldNH
                OldNH = hookmetamethod(game, "__namecall", function(self, ...)
                    local args = {...}
                    local method = getnamecallmethod()
                    if getgenv().DB and method == "InvokeServer" and tostring(self) == "GameRemoteFunction" and args[1] == "AttemptWeaponHit" then
                        if args[2] and args[2].damage then args[2].damage = args[2].damage * 3 end
                    end
                    return OldNH(self, unpack(args))
                end)
            end})
            task.wait(0.06)
            
            Combat:Toggle({Title="Auto Parry", Default=false, Callback=function(s) 
                getgenv().AP=s 
                task.spawn(function()
                    while getgenv().AP do
                        pcall(function()
                            for _, p in ipairs(Players:GetPlayers()) do
                                if p ~= LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                                    local tool = p.Character:FindFirstChildOfClass("Tool")
                                    if tool and tool:GetAttribute("IsAttacking") == true then
                                        local dist = (p.Character.HumanoidRootPart.Position - LP.Character.HumanoidRootPart.Position).Magnitude
                                        if dist < 18 then
                                            ReplicatedStorage.Events.GameRemoteFunction:InvokeServer("ParryAttempt", {Incoming=true})
                                            task.wait(0.3)
                                        end
                                    end
                                end
                            end
                        end)
                        task.wait(0.02)
                    end
                end)
            end})
            task.wait(0.06)
            
            Combat:Toggle({Title="Silent Aim", Default=false, Callback=function(s) 
                getgenv().SA=s 
                local OldHit
                OldHit = hookmetamethod(game, "__index", function(self, key)
                    if getgenv().SA and self == LP:GetMouse() and (key == "Hit" or key == "Target") then
                        local target, closeDist = nil, math.huge
                        for _, p in ipairs(Players:GetPlayers()) do
                            if p ~= LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Character.Humanoid.Health > 0 then
                                local pPos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(p.Character.HumanoidRootPart.Position)
                                if onScreen then
                                    local mLoc = UIS:GetMouseLocation()
                                    local dist = (Vector2.new(pPos.X, pPos.Y) - mLoc).Magnitude
                                    if dist < closeDist and dist < 250 then
                                        target = p.Character.HumanoidRootPart
                                        closeDist = dist
                                    end
                                end
                            end
                        end
                        if target then return (key == "Hit" and target.CFrame or target) end
                    end
                    return OldHit(self, key)
                end)
            end})
            
            -- ------------------------------------------------------------------------
            -- Tab 2: Visuals
            -- ------------------------------------------------------------------------
            task.wait(0.2)
            local Visuals = Window:Tab({Title="Visuals", Icon="eye"})
            task.wait(0.15)
            
            Visuals:Toggle({Title="ESP Players", Default=false, Callback=function(s)
                getgenv().ESP=s
                while getgenv().ESP do
                    for _,p in ipairs(Players:GetPlayers()) do
                        if p~=LP and p.Character and p.Character:FindFirstChild("Head") and not p.Character.Head:FindFirstChild("NebESP") then
                            local b=Instance.new("BillboardGui",p.Character.Head); b.Name="NebESP"; b.Size=UDim2.new(0,120,0,35); b.AlwaysOnTop=true
                            local t=Instance.new("TextLabel",b); t.Size=UDim2.new(1,0,1,0); t.BackgroundTransparency=1; t.Text=p.Name.." ["..math.floor((p.Character.HumanoidRootPart.Position-LP.Character.HumanoidRootPart.Position).Magnitude).."m]"; t.TextColor3=Color3.fromRGB(190,80,255); t.TextStrokeTransparency=0.3; t.Font=Enum.Font.GothamBold
                        end
                    end
                    task.wait(0.8)
                end
                for _,p in ipairs(Players:GetPlayers()) do if p.Character and p.Character:FindFirstChild("Head") then local e=p.Character.Head:FindFirstChild("NebESP") if e then e:Destroy() end end end
            end})
            task.wait(0.06)
            
            Visuals:Toggle({Title="ESP Chests", Default=false, Callback=function(s) 
                getgenv().EC=s 
                while getgenv().EC do
                    for _, v in ipairs(workspace:GetDescendants()) do
                        if v:IsA("Model") and (v.Name:lower():match("chest") or v.Name:lower():match("gacha")) and not v:FindFirstChild("ChestESP") then
                            local b = Instance.new("BillboardGui", v)
                            b.Name = "ChestESP"; b.Size = UDim2.new(0, 100, 0, 30); b.AlwaysOnTop = true
                            local t = Instance.new("TextLabel", b)
                            t.Size = UDim2.new(1, 0, 1, 0); t.BackgroundTransparency = 1; t.Text = "[ Chest ]"; t.TextColor3 = Color3.fromRGB(255, 215, 0); t.Font = Enum.Font.GothamBold
                        end
                    end
                    task.wait(2)
                end
                for _, v in ipairs(workspace:GetDescendants()) do if v.Name == "ChestESP" then v:Destroy() end end
            end})
            task.wait(0.06)
            
            Visuals:Toggle({Title="Fullbright", Default=false, Callback=function(s) if s then game.Lighting.Brightness=3 else game.Lighting.Brightness=1 end end})
            task.wait(0.06)
            Visuals:Toggle({Title="No Fog", Default=false, Callback=function(s) game.Lighting.FogEnd = s and 100000 or 1000 end})
            task.wait(0.06)
            
            Visuals:Toggle({Title="Tracers", Default=false, Callback=function(s) 
                getgenv().TR=s 
                task.spawn(function()
                    local lines = {}
                    while getgenv().TR do
                        for _, p in ipairs(Players:GetPlayers()) do
                            if p ~= LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                                local hrp = p.Character.HumanoidRootPart
                                local pos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(hrp.Position)
                                if onScreen then
                                    if not lines[p.Name] then
                                        local l = Drawing.new("Line")
                                        l.Thickness = 1.5
                                        l.Color = Color3.fromRGB(190, 80, 255)
                                        lines[p.Name] = l
                                    end
                                    lines[p.Name].From = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y)
                                    lines[p.Name].To = Vector2.new(pos.X, pos.Y)
                                    lines[p.Name].Visible = true
                                else
                                    if lines[p.Name] then lines[p.Name].Visible = false end
                                end
                            else
                                if lines[p.Name] then lines[p.Name].Visible = false end
                            end
                        end
                        RS.RenderStepped:Wait()
                    end
                    for _, l in pairs(lines) do l:Remove() end
                end)
            end})
            task.wait(0.06)
            
            Visuals:Toggle({Title="Chams", Default=false, Callback=function(s) 
                getgenv().CH=s 
                while getgenv().CH do
                    for _, p in ipairs(Players:GetPlayers()) do
                        if p ~= LP and p.Character and not p.Character:FindFirstChild("NebChams") then
                            local h = Instance.new("Highlight", p.Character)
                            h.Name = "NebChams"
                            h.FillColor = Color3.fromRGB(140, 0, 255)
                            h.OutlineColor = Color3.fromRGB(255, 255, 255)
                            h.FillTransparency = 0.4
                        end
                    end
                    task.wait(1)
                end
                for _, p in ipairs(Players:GetPlayers()) do
                    if p.Character and p.Character:FindFirstChild("NebChams") then p.Character.NebChams:Destroy() end
                end
            end})
            task.wait(0.06)
            
            Visuals:Toggle({Title="NameTags", Default=false, Callback=function(s) 
                getgenv().NT=s 
                while getgenv().NT do
                    for _, p in ipairs(Players:GetPlayers()) do
                        if p ~= LP and p.Character and p.Character:FindFirstChild("Head") and not p.Character.Head:FindFirstChild("NebNT") then
                            local b = Instance.new("BillboardGui", p.Character.Head); b.Name = "NebNT"; b.Size = UDim2.new(0, 150, 0, 30); b.AlwaysOnTop = true; b.StudsOffset = Vector3.new(0, 2, 0)
                            local t = Instance.new("TextLabel", b); t.Size = UDim2.new(1, 0, 1, 0); t.BackgroundTransparency = 1; t.Text = p.DisplayName .. " (@" .. p.Name .. ")"; t.TextColor3 = Color3.fromRGB(255, 255, 255); t.Font = Enum.Font.GothamBold; t.TextSize = 12
                        end
                    end
                    task.wait(1)
                end
                for _, p in ipairs(Players:GetPlayers()) do if p.Character and p.Character:FindFirstChild("Head") and p.Character.Head:FindFirstChild("NebNT") then p.Character.Head.NebNT:Destroy() end end
            end})
            task.wait(0.06)
            
            Visuals:Toggle({Title="Health Bars", Default=false, Callback=function(s) 
                getgenv().HB=s 
                while getgenv().HB do
                    for _, p in ipairs(Players:GetPlayers()) do
                        if p ~= LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and not p.Character.HumanoidRootPart:FindFirstChild("NebHB") then
                            local b = Instance.new("BillboardGui", p.Character.HumanoidRootPart); b.Name = "NebHB"; b.Size = UDim2.new(0, 50, 0, 6); b.AlwaysOnTop = true; b.StudsOffset = Vector3.new(-3, 0, 0)
                            local bg = Instance.new("Frame", b); bg.Size = UDim2.new(1, 0, 1, 0); bg.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
                            local fg = Instance.new("Frame", bg); fg.Name = "Bar"; fg.Size = UDim2.new(1, 0, 1, 0); fg.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
                        end
                        if p.Character and p.Character:FindFirstChild("Humanoid") and p.Character.HumanoidRootPart:FindFirstChild("NebHB") then
                            local bar = p.Character.HumanoidRootPart.NebHB.Frame.Bar
                            bar.Size = UDim2.new(p.Character.Humanoid.Health / p.Character.Humanoid.MaxHealth, 0, 1, 0)
                        end
                    end
                    task.wait(0.1)
                end
                for _, p in ipairs(Players:GetPlayers()) do if p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Character.HumanoidRootPart:FindFirstChild("NebHB") then p.Character.HumanoidRootPart.NebHB:Destroy() end end
            end})

            -- ------------------------------------------------------------------------
            -- Tab 3: Movement
            -- ------------------------------------------------------------------------
            task.wait(0.2)
            local Move = Window:Tab({Title="Movement", Icon="wind"})
            task.wait(0.15)
            
            Move:Slider({Title="WalkSpeed", Value={Min=16,Max=200,Default=16}, Callback=function(v) if LP.Character then LP.Character.Humanoid.WalkSpeed=v end end})
            task.wait(0.06)
            Move:Slider({Title="JumpPower", Value={Min=50,Max=300,Default=50}, Callback=function(v) if LP.Character then LP.Character.Humanoid.JumpPower=v end end})
            task.wait(0.06)
            Move:Toggle({Title="Infinite Jump", Default=false, Callback=function(s) getgenv().IJ=s; UIS.JumpRequest:Connect(function() if getgenv().IJ then LP.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end end) end})
            task.wait(0.06)
            Move:Toggle({Title="Noclip", Default=false, Callback=function(s) getgenv().NC=s; RS.Stepped:Connect(function() if getgenv().NC and LP.Character then for _,v in ipairs(LP.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide=false end end end end) end})
            task.wait(0.06)
            Move:Toggle({Title="Fly (Hold E)", Default=false, Callback=function(s) getgenv().Fly=s; while getgenv().Fly do if UIS:IsKeyDown(Enum.KeyCode.E) then LP.Character.HumanoidRootPart.Velocity=Vector3.new(0,50,0) else LP.Character.HumanoidRootPart.Velocity=Vector3.new() end task.wait() end end})
            task.wait(0.06)
            
            Move:Toggle({Title="Bunny Hop", Default=false, Callback=function(s) 
                getgenv().BH=s 
                while getgenv().BH do
                    local char = LP.Character
                    if char and char:FindFirstChild("Humanoid") and char.Humanoid.MoveDirection.Magnitude > 0 then
                        if char.Humanoid.FloorMaterial ~= Enum.Material.Air then char.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end
                    end
                    task.wait(0.02)
                end
            end})
            task.wait(0.06)
            
            Move:Toggle({Title="Speed Bypass", Default=false, Callback=function(s) 
                getgenv().SB=s 
                RS.PostSimulation:Connect(function()
                    if getgenv().SB and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
                        local hrp = LP.Character.HumanoidRootPart
                        if LP.Character.Humanoid.MoveDirection.Magnitude > 0 then hrp.CFrame = hrp.CFrame + LP.Character.Humanoid.MoveDirection * 0.35 end
                    end
                end)
            end})
            task.wait(0.06)
            
            Move:Toggle({Title="Air Walk", Default=false, Callback=function(s) 
                getgenv().AW=s 
                local plat = Instance.new("Part")
                plat.Size = Vector3.new(6, 1, 6); plat.Transparency = 1; plat.Anchored = true
                while getgenv().AW do
                    if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
                        plat.Parent = workspace
                        plat.CFrame = LP.Character.HumanoidRootPart.CFrame * CFrame.new(0, -3.5, 0)
                    end
                    task.wait()
                end
                plat:Destroy()
            end})
            task.wait(0.06)
            
            Move:Toggle({Title="Float", Default=false, Callback=function(s) 
                getgenv().FL=s 
                while getgenv().FL do
                    if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
                        local bv = LP.Character.HumanoidRootPart:FindFirstChild("NebFloat") or Instance.new("BodyVelocity", LP.Character.HumanoidRootPart)
                        bv.Name = "NebFloat"; bv.Velocity = Vector3.new(0, 0, 0); bv.MaxForce = Vector3.new(0, 9e9, 0)
                    end
                    task.wait()
                end
                if LP.Character and LP.Character.HumanoidRootPart:FindFirstChild("NebFloat") then LP.Character.HumanoidRootPart.NebFloat:Destroy() end
            end})
            task.wait(0.06)
            
            Move:Toggle({Title="Click TP (Ctrl+Click)", Default=false, Callback=function(s) 
                getgenv().CTP=s 
                UIS.InputBegan:Connect(function(io, gpe)
                    if getgenv().CTP and not gpe and io.UserInputType == Enum.UserInputType.MouseButton1 and UIS:IsKeyDown(Enum.KeyCode.LeftControl) then
                        local pos = LP:GetMouse().Hit.Position
                        if LP.Character then LP.Character:MoveTo(pos + Vector3.new(0, 3, 0)) end
                    end
                end)
            end})

            -- ------------------------------------------------------------------------
            -- Tab 4: Misc
            -- ------------------------------------------------------------------------
            task.wait(0.2)
            local Misc = Window:Tab({Title="Misc", Icon="package"})
            task.wait(0.15)
            Misc:Section({Title="Gacha Chest Openers"})
            task.wait(0.05)
            
            Misc:Button({Title="Open Basic Chest", Desc="Cost: 50Y", Callback=function()
                local Event = ReplicatedStorage.Events.GameRemoteFunction
                Event:InvokeServer("AttemptRollGachaChest","Basic")
                WindUI:Notify({Title="Chest",Content="Basic rolled (50Y)",Duration=2})
            end})
            task.wait(0.06)
            
            Misc:Button({Title="Open Divine Chest", Desc="Cost: 250Y", Callback=function()
                local Event = ReplicatedStorage.Events.GameRemoteFunction
                Event:InvokeServer("AttemptRollGachaChest","Divine")
                WindUI:Notify({Title="Chest",Content="Divine rolled (250Y)",Duration=2})
            end})
            task.wait(0.06)
            
            Misc:Section({Title="Utility Systems"})
            task.wait(0.05)
            
            Misc:Toggle({Title="Reduce Detection", Desc="Semi-transparent character skin parsing", Default=false, Callback=function(s) if LP.Character then for _,v in ipairs(LP.Character:GetDescendants()) do if v:IsA("BasePart") then v.Transparency = s and 0.4 or 0 end end end end})
            task.wait(0.06)
            Misc:Toggle({Title="Anti AFK", Default=true, Callback=function(s) getgenv().AFK=s; while getgenv().AFK do game:GetService("VirtualUser"):Button2Down(Vector2.new()) task.wait(300) end end})
            task.wait(0.06)
            Misc:Button({Title="TP to Random Player", Callback=function() local t={}; for _,p in ipairs(Players:GetPlayers()) do if p~=LP then table.insert(t,p) end end local r=t[math.random(#t)]; if r then LP.Character.HumanoidRootPart.CFrame=r.Character.HumanoidRootPart.CFrame*CFrame.new(0,3,0) end end})
            task.wait(0.06)
            Misc:Button({Title="Rejoin Server", Callback=function() game:GetService("TeleportService"):Teleport(game.PlaceId) end})
            task.wait(0.06)
            
            Misc:Button({Title="Server Hop", Callback=function()
                local servers=game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100")).data
                local s=servers[math.random(#servers)]; game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,s.id)
            end})

            -- ------------------------------------------------------------------------
            -- Tab 5: Teleport
            -- ------------------------------------------------------------------------
            task.wait(0.2)
            local TP = Window:Tab({Title="Teleport", Icon="map-pin"})
            task.wait(0.15)
            local locations = {Spawn=CFrame.new(0,10,0), Shop=CFrame.new(100,10,50), Arena=CFrame.new(-200,10,300), SafeZone=CFrame.new(500,50,-500)}
            for name,cf in pairs(locations) do 
                TP:Button({Title="TP to "..name, Callback=function() LP.Character.HumanoidRootPart.CFrame=cf end}) 
                task.wait(0.05)
            end

            -- ------------------------------------------------------------------------
            -- Tab 6: Farm ({BROKEN + WIP} Warning Integration)
            -- ------------------------------------------------------------------------
            task.wait(0.2)
            local Farm = Window:Tab({Title="Farm", Icon="coins"})
            task.wait(0.15)
            
            -- Warning Top Headers
            Farm:Section({Title = "{BROKEN + WIP}", TextXAlignment = "Left", TextSize = 18})
            task.wait(0.05)
            Farm:Paragraph({
                Title = "Farming Engine Offline / Instable", 
                Desc = "Notice: Silent Assassins security structure patches flag telemetry loops. This module is undergoing structural rewrites."
            })
            task.wait(0.05)
            
            Farm:Toggle({Title="Auto Farm Yen", Default=false, Callback=function(s) 
                getgenv().AF=s 
                task.spawn(function()
                    while getgenv().AF do
                        pcall(function()
                            for _, v in ipairs(workspace:GetChildren()) do
                                if v:IsA("BasePart") and (v.Name:match("Yen") or v.Name:match("Coin")) then
                                    LP.Character.HumanoidRootPart.CFrame = v.CFrame
                                    task.wait(0.2)
                                end
                            end
                        end)
                        task.wait(0.5)
                    end
                end)
            end})
            task.wait(0.06)
            
            Farm:Toggle({Title="Auto Collect Drops", Default=false, Callback=function(s) 
                getgenv().AC=s 
                task.spawn(function()
                    while getgenv().AC do
                        pcall(function()
                            for _, v in ipairs(workspace:GetChildren()) do
                                if v:IsA("Tool") or v.Name:match("Drop") or v:FindFirstChild("ProximityPrompt") then
                                    LP.Character.HumanoidRootPart.CFrame = v.CFrame * CFrame.new(0,2,0)
                                    if v:FindFirstChild("ProximityPrompt") then fireproximityprompt(v.ProximityPrompt) end
                                    task.wait(0.2)
                                end
                            end
                        end)
                        task.wait(0.5)
                    end
                end)
            end})
            task.wait(0.06)
            
            Farm:Toggle({Title="Auto Sell", Default=false, Callback=function(s) 
                getgenv().AS=s 
                task.spawn(function()
                    while getgenv().AS do
                        pcall(function()
                            local sellPart = workspace:FindFirstChild("SellPart") or workspace:FindFirstChild("SellZone") or workspace:FindFirstChild("Merchant")
                            if sellPart and LP.Character then
                                local oldCF = LP.Character.HumanoidRootPart.CFrame
                                LP.Character.HumanoidRootPart.CFrame = sellPart.CFrame
                                task.wait(0.4)
                                ReplicatedStorage.Events.GameRemoteFunction:InvokeServer("SellAllItems")
                                task.wait(0.2)
                                LP.Character.HumanoidRootPart.CFrame = oldCF
                            end
                        end)
                        task.wait(5)
                    end
                end)
            end})

            -- ------------------------------------------------------------------------
            -- Tab 7 & 8: Settings & Credits Configurations
            -- ------------------------------------------------------------------------
            task.wait(0.2)
            local Settings = Window:Tab({Title="Settings", Icon="settings"})
            task.wait(0.1)
            Settings:Button({Title="Unload UI Engine", Callback=function() Window:Destroy() end})
            task.wait(0.05)
            Settings:Button({Title="Copy Discord Invitations", Callback=function() setclipboard("discord.gg/nebula") end})
            
            task.wait(0.15)
            local Credits = Window:Tab({Title="Credits", Icon="info"})
            task.wait(0.1)
            Credits:Paragraph({Title="Nebula Hub v3.2", Desc="Built utilizing WindUI Engine v1.6+ | Automated Cobalt Remotes | Developer: Shortxraze2021"})
            
            WindUI:Notify({Title="Build Generation Complete", Content="All dynamic tab elements are now functional!", Duration=4})
        end)
    end
})

WindUI:Notify({Title="Nebula Core Standby", Content="Press Load Hub inside the interface to authenticate.", Duration=5})