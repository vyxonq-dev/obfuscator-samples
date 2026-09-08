--[[
    ================================================================================
    [ SCRYO HUB V4.1 ] - THE ARCHITECT'S MASTERPIECE (RESTORED)
    ================================================================================
    - Feature: SEMUA Tab (Combat, Visuals, Classes, World, Extra)
    - Fix: Crosshair Balik Lagi (Gak bakal ilang)
    - Fix: Clean Dirt Button & Auto-Clean (Dua-duanya ada)
    - Fix: Smart Reload (Universal Scan + List)
    - Branding: oleh scryo & mommy (yesadmingod)
    ================================================================================
--]]

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- [[ MASTER CONFIGURATION TABLE ]] --
local ScryoConfig = {
    EspActive = false,
    AimbotLoaded = false,
    AutoClean = false,
    WalkSpeed = 16,
    CrosshairVisible = false,
    BoxColor = Color3.fromRGB(0, 255, 255)
}

-- [[ CORE ENVIRONMENT ]] --
local LP = game.Players.LocalPlayer
local RS = game:GetService("RunService")
local RP = game:GetService("ReplicatedStorage")
local Camera = workspace.CurrentCamera
local Lighting = game:GetService("Lighting")

-- [[ EMERGENCY CLEANUP ]] --
if _G.AimbotConnection then _G.AimbotConnection:Disconnect() end
if _G.FOVCircle then _G.FOVCircle:Remove() end
if _G.MasterHeartbeat then _G.MasterHeartbeat:Disconnect() end

--- 1. MASTER WINDOW ---
local Window = Rayfield:CreateWindow({
   Name = "SCRYO HUB | V4.5",
   LoadingTitle = "Restoring Every Single Feature...",
   LoadingSubtitle = "by yesadmingod (Mommy)",
   ConfigurationSaving = {Enabled = false},
   KeySystem = false
})

--- 2. CROSSHAIR SYSTEM (RESTORED) ---
local CrossGui = Instance.new("ScreenGui", LP.PlayerGui)
CrossGui.Name = "ScryoCrosshair"; CrossGui.ResetOnSpawn = false; CrossGui.IgnoreGuiInset = true
local Cross1 = Instance.new("Frame", CrossGui); local Cross2 = Instance.new("Frame", CrossGui)

local function UpdateCrosshair(state)
    ScryoConfig.CrosshairVisible = state
    Cross1.Visible = state; Cross2.Visible = state
    if state then
        Cross1.Size = UDim2.new(0, 2, 0, 16); Cross1.Position = UDim2.new(0.5, -1, 0.5, -8)
        Cross1.BackgroundColor3 = Color3.fromRGB(0, 255, 255); Cross1.BorderSizePixel = 0
        Cross2.Size = UDim2.new(0, 16, 0, 2); Cross2.Position = UDim2.new(0.5, -8, 0.5, -1)
        Cross2.BackgroundColor3 = Color3.fromRGB(0, 255, 255); Cross2.BorderSizePixel = 0
    end
end

--- 3. SMART RELOAD (ULTRA VERSION) ---
local function UniversalReload()
    pcall(function()
        local char = LP.Character
        if not char then return end
        
        -- Method 1: Scanning Tools
        for _, tool in pairs(char:GetChildren()) do
            if tool:IsA("Tool") then
                local r = tool:FindFirstChild("RemoteEvent", true)
                if r and r.Parent and r.Parent.Name == "prompt" then 
                    r:FireServer() 
                end
            end
        end
        
        -- Method 2: Specific Fast List
        local fastList = {"lee", "web", "cow", "spring", "flare"}
        for _, name in pairs(fastList) do
            local w = char:FindFirstChild(name)
            if w and w:FindFirstChild("Handle") then
                pcall(function() w.Handle.wood.promptload.prompt.RemoteEvent:FireServer() end)
            end
        end
    end)
end

--- 4. TABS INTERFACE ---
local MainTab = Window:CreateTab("Combat Ops", 4483362458)
local VisualTab = Window:CreateTab("Visual Engine", 4483362458)
local ClassTab = Window:CreateTab("Class Master", 4483362458)
local WorldTab = Window:CreateTab("Environment", 4483362458)
local ExtraTab = Window:CreateTab("Utility Extra", 4483362458)

-- [[ COMBAT ]] --
MainTab:CreateButton({
   Name = "Initialize Aimbot (Thin & Smooth)",
   Callback = function()
       if ScryoConfig.AimbotLoaded then return end
       ScryoConfig.AimbotLoaded = true
       local Circle = Drawing.new("Circle")
       Circle.Visible = true; Circle.Radius = 150; Circle.Thickness = 1
       Circle.Transparency = 1; Circle.Filled = false; Circle.Color = Color3.new(1, 1, 1)
       _G.FOVCircle = Circle
       _G.AimbotConnection = RS.RenderStepped:Connect(function()
           Circle.Position = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
           Circle.Color = Color3.fromHSV(tick() % 5 / 5, 0.8, 1)
           local Target = nil; local MinDist = Circle.Radius
           for _, v in pairs(workspace:GetChildren()) do
               if v:IsA("Model") and not game.Players:GetPlayerFromCharacter(v) then
                   pcall(function()
                       local h = v:FindFirstChild("Head")
                       local hum = v:FindFirstChildOfClass("Humanoid")
                       if h and hum and hum.Health > 0 then
                           local Pos, On = Camera:WorldToViewportPoint(h.Position)
                           if On then
                               local M = (Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2) - Vector2.new(Pos.X, Pos.Y)).Magnitude
                               if M < MinDist then MinDist = M; Target = h end
                           end
                       end
                   end)
               end
           end
           if Target then Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position, Target.Position), 0.12) end
       end)
   end,
})

-- [[ VISUALS ]] --
VisualTab:CreateToggle({
   Name = "NPC Tracker (Box ESP)",
   CurrentValue = false,
   Callback = function(v) ScryoConfig.EspActive = v end,
})

VisualTab:CreateToggle({
   Name = "Precision Crosshair",
   CurrentValue = false,
   Callback = function(v) UpdateCrosshair(v) end,
})

-- [[ CLASSES ]] --
local function FireClass(n)
    RP.RemoteEvents.Player.ChooseClass:FireServer(n, n)
end

local classes = {"Sharpshooter", "Engineer", "Automatic", "Medic", "Officer", "Artillery", "Rifleman"}
for _, c in pairs(classes) do
    ClassTab:CreateButton({Name = "Join as " .. c, Callback = function() FireClass(c:lower()) end})
end

-- [[ WORLD ]] --
WorldTab:CreateSlider({
   Name = "Speed Hack",
   Range = {16, 30},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(v) ScryoConfig.WalkSpeed = v end,
})

WorldTab:CreateToggle({
   Name = "Night Vision (Fullbright)",
   CurrentValue = false,
   Callback = function(v) 
       if v then Lighting.Brightness = 2; Lighting.ClockTime = 12 
       else Lighting.Brightness = 1; Lighting.ClockTime = 14 end
   end,
})

-- [[ EXTRA UTILITIES ]] --
ExtraTab:CreateToggle({
   Name = "Loop Auto-Clean Dirt",
   CurrentValue = false,
   Callback = function(v) 
       ScryoConfig.AutoClean = v 
       if v then
           task.spawn(function()
               while ScryoConfig.AutoClean do
                   pcall(function() RP.wipedirt:FireServer() end)
                   task.wait(1)
               end
           end)
       end
   end,
})

ExtraTab:CreateButton({
   Name = "instant Reload",
   Callback = function()
       if LP.PlayerGui:FindFirstChild("ScryoReloadHUD") then return end
       local G = Instance.new("ScreenGui", LP.PlayerGui); G.Name = "ScryoReloadHUD"; G.ResetOnSpawn = false
       local B = Instance.new("TextButton", G)
       B.Size = UDim2.new(0, 75, 0, 75); B.Position = UDim2.new(0.02, 0, 0.15, 0); B.Text = "RELOAD"
       B.BackgroundColor3 = Color3.fromRGB(15, 15, 15); B.TextColor3 = Color3.new(1, 1, 1)
       Instance.new("UICorner", B).CornerRadius = UDim.new(1, 0)
       local S = Instance.new("UIStroke", B); S.Thickness = 2
       task.spawn(function() while B.Parent do S.Color = Color3.fromHSV(tick() % 5 / 5, 0.8, 1); task.wait(0.1) end end)
       B.MouseButton1Click:Connect(function() UniversalReload(); B.Text = "OK!"; task.wait(0.3); B.Text = "RELOAD" end)
   end,
})

ExtraTab:CreateButton({
   Name = "Spawn Clean Button (Manual)",
   Callback = function()
       if LP.PlayerGui:FindFirstChild("ScryoCleanHUD") then return end
       local G = Instance.new("ScreenGui", LP.PlayerGui); G.Name = "ScryoCleanHUD"; G.ResetOnSpawn = false
       local B = Instance.new("TextButton", G)
       B.Size = UDim2.new(0, 75, 0, 75); B.Position = UDim2.new(0.02, 0, 0.3, 0); B.Text = "CLEAN"
       B.BackgroundColor3 = Color3.fromRGB(15, 15, 15); B.TextColor3 = Color3.new(1, 1, 1)
       Instance.new("UICorner", B).CornerRadius = UDim.new(1, 0)
       local S = Instance.new("UIStroke", B); S.Thickness = 2
       task.spawn(function() while B.Parent do S.Color = Color3.fromHSV(tick() % 5 / 5, 0.8, 1); task.wait(0.1) end end)
       B.MouseButton1Click:Connect(function() pcall(function() RP.wipedirt:FireServer() end); B.Text = "DONE"; task.wait(0.3); B.Text = "CLEAN" end)
   end,
})

--- 5. MASTER HEARTBEAT (ANTI-LAG) ---
task.spawn(function()
    while true do
        -- Walkspeed Sync
        pcall(function()
            if LP.Character and LP.Character:FindFirstChild("Humanoid") then
                LP.Character.Humanoid.WalkSpeed = ScryoConfig.WalkSpeed
            end
        end)
        
        -- ESP Heartbeat
        if ScryoConfig.EspActive then
            for _, o in pairs(workspace:GetChildren()) do
                if o:IsA("Model") and not game.Players:GetPlayerFromCharacter(o) then
                    if o:FindFirstChildOfClass("Humanoid") then
                        -- Create ESP Box
                        if not o:FindFirstChild("ESPBolt") then
                            local f = Instance.new("Folder", o); f.Name = "ESPBolt"
                            local b = Instance.new("BillboardGui", f); b.Adornee = o:FindFirstChild("HumanoidRootPart")
                            b.Size = UDim2.new(4,0,5.5,0); b.AlwaysOnTop = true
                            local fr = Instance.new("Frame", b); fr.Size = UDim2.new(1,0,1,0); fr.BackgroundTransparency = 1
                            local st = Instance.new("UIStroke", fr); st.Color = ScryoConfig.BoxColor; st.Thickness = 1
                            task.spawn(function()
                                while o.Parent and ScryoConfig.EspActive do task.wait(1) end
                                if f then f:Destroy() end
                            end)
                        end
                    end
                end
            end
        end
        task.wait(1)
    end
end)

Rayfield:Notify({Title = "V4.1 RESTORED", Content = "Semua fitur favorit Mommy sudah balik!", Duration = 5})
