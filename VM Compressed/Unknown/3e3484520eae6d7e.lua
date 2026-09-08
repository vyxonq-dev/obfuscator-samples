local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("PeeOwS Hub - v 6.3", "BloodTheme")

-- SERVİSLER
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- AYARLAR
local AimEnabled, AimKey, ESPEnabled = false, Enum.KeyCode.B, false
local CustomFOV, FOVLockEnabled, AimFovSize = 90, false, 100
local SpinEnabled, HatEnabled = false, false
local SkyboxID = "rbxassetid://4969862274"
local RGBColor = Color3.fromRGB(255, 0, 0)
local CurrentTarget = nil 

-- --- RGB DÖNGÜSÜ ---
task.spawn(function()
    while task.wait() do
        for i = 0, 1, 0.005 do
            RGBColor = Color3.fromHSV(i, 1, 1)
            task.wait(0.01)
        end
    end
end)

-- --- AIMBOT FOV YUVARLAĞI ---
local FOV_Circle = Drawing.new("Circle")
FOV_Circle.Thickness = 2
FOV_Circle.Color = Color3.fromRGB(255, 255, 255)
FOV_Circle.Radius = AimFovSize
FOV_Circle.Visible = false
FOV_Circle.Filled = false

-- MENU KISAYOL (INSERT)
UIS.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Insert then Library:ToggleUI() end
end)

-- --- SEKMELER ---
local Main = Window:NewTab("player")
local PlayerSec = Main:NewSection("hız-zıplama")

-- HIZ (DOKUNULMADI)
PlayerSec:NewSlider("hız", "Walkspeed", 300, 16, function(s) 
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then 
        LocalPlayer.Character.Humanoid.WalkSpeed = s 
    end 
end)

-- ZIPLAMA GÜCÜ (YENİ EKLENDİ)
PlayerSec:NewSlider("zıplama", "JumpPower", 500, 50, function(s)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.UseJumpPower = true
        LocalPlayer.Character.Humanoid.JumpPower = s
    end
end)

-- MEVLANA (DOKUNULMADI)
PlayerSec:NewToggle("mevlana", "spinbot", function(s) 
    SpinEnabled = s 
    task.spawn(function() 
        while SpinEnabled do 
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then 
                LocalPlayer.Character.HumanoidRootPart.CFrame *= CFrame.Angles(0, math.rad(60), 0) 
            end 
            task.wait() 
        end 
    end) 
end)

local AimbotTab = Window:NewTab("aimbot")
local AimSection = AimbotTab:NewSection("lock (aim)")
AimSection:NewToggle("aimbot", "B Tuşu", function(state) AimEnabled = state end)
AimSection:NewToggle("fov radius", "Yuvarlağı Göster", function(state) FOV_Circle.Visible = state end)
AimSection:NewSlider("fov radius büyüklüğü", "fov radius", 500, 30, function(s) AimFovSize = s FOV_Circle.Radius = s end)

local ESPTab = Window:NewTab("wallhack")
ESPTab:NewSection("Visuals"):NewToggle("ESP", "esepe boks", function(state) 
    ESPEnabled = state 
    if not state then
        for _, v in pairs(Players:GetPlayers()) do
            if v.Character and v.Character:FindFirstChild("ESPHighlight") then v.Character.ESPHighlight:Destroy() end
        end
    end
end)

local Visuals = Window:NewTab("misc")
Visuals:NewSection("Bypass"):NewSlider("Field Of View", "Açı", 120, 70, function(s) CustomFOV = s if FOVLockEnabled then Camera.FieldOfView = s end end)
Visuals:NewSection("Kilitle"):NewToggle("fov kilitle (bypasser)", "Aktif", function(state) FOVLockEnabled = state if state then Camera.FieldOfView = CustomFOV else Camera.FieldOfView = 70 end end)

local SkySection = Visuals:NewSection("Skybox")
SkySection:NewToggle("Custom Skybox", "ID: 4969862274", function(state)
    if state then
        for _, v in pairs(Lighting:GetChildren()) do if v:IsA("Sky") then v:Destroy() end end
        local newSky = Instance.new("Sky")
        newSky.Name = "CustomSky"
        newSky.SkyboxBk = SkyboxID; newSky.SkyboxDn = SkyboxID; newSky.SkyboxFt = SkyboxID; newSky.SkyboxLf = SkyboxID; newSky.SkyboxRt = SkyboxID; newSky.SkyboxUp = SkyboxID
        newSky.Parent = Lighting
    else
        for _, v in pairs(Lighting:GetChildren()) do if v:IsA("Sky") and v.Name == "CustomSky" then v:Destroy() end end
    end
end)

local FeaturesTab = Window:NewTab("ozellikler")
FeaturesTab:NewSection("Aksesuarlar"):NewToggle("RGB part", "Kafanıza RGB part ekler", function(state)
    HatEnabled = state
    if not state and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("MyRGBHat") then
        LocalPlayer.Character.MyRGBHat:Destroy()
    end
end)

-- --- ŞAPKA TAKİP MOTORU ---
RunService.Heartbeat:Connect(function()
    if HatEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head") then
        local head = LocalPlayer.Character.Head
        local hat = LocalPlayer.Character:FindFirstChild("MyRGBHat")
        if not hat then
            hat = Instance.new("Part")
            hat.Name = "MyRGBHat"; hat.Size = Vector3.new(1.1, 0.4, 1.1); hat.CanCollide = false; hat.Massless = true; hat.Material = Enum.Material.Neon
            local weld = Instance.new("Weld", hat); weld.Part0 = head; weld.Part1 = hat; weld.C0 = CFrame.new(0, 0.7, 0)
            hat.Parent = LocalPlayer.Character
        end
        hat.Color = RGBColor
    end
end)

-- --- ESP MOTORU ---
local function ApplyESP(player)
    local Box, NameTag, Tracer, HealthBar, HealthBarOutline = Drawing.new("Square"), Drawing.new("Text"), Drawing.new("Line"), Drawing.new("Line"), Drawing.new("Square")
    local function Clean() Box.Visible = false; NameTag.Visible = false; Tracer.Visible = false; HealthBar.Visible = false; HealthBarOutline.Visible = false; if player.Character and player.Character:FindFirstChild("ESPHighlight") then player.Character.ESPHighlight:Destroy() end end
    RunService.RenderStepped:Connect(function()
        if ESPEnabled and player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character.Humanoid.Health > 0 then
            local hrp = player.Character.HumanoidRootPart
            local hum = player.Character.Humanoid
            local hrpPos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
            if onScreen then
                local boxHeight = math.abs(Camera:WorldToViewportPoint(hrp.Position + Vector3.new(0, 3, 0)).Y - Camera:WorldToViewportPoint(hrp.Position + Vector3.new(0, -3.5, 0)).Y)
                local boxWidth = boxHeight / 1.5
                Box.Visible = true; Box.Size = Vector2.new(boxWidth, boxHeight); Box.Position = Vector2.new(hrpPos.X - boxWidth/2, hrpPos.Y - boxHeight/2); Box.Color = RGBColor; Box.Thickness = 1.5
                NameTag.Visible = true; NameTag.Text = player.Name; NameTag.Size = 13; NameTag.Center = true; NameTag.Outline = true; NameTag.Color = RGBColor; NameTag.Position = Vector2.new(hrpPos.X, hrpPos.Y - boxHeight/2 - 25)
                Tracer.Visible = true; Tracer.From = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y); Tracer.To = Vector2.new(hrpPos.X, hrpPos.Y + boxHeight/2); Tracer.Color = RGBColor
                local percentage = math.clamp(hum.Health / hum.MaxHealth, 0, 1)
                local barPosX = hrpPos.X - (boxWidth / 2) - 6
                local barPosY = hrpPos.Y - (boxHeight / 2)
                HealthBarOutline.Visible = true; HealthBarOutline.Size = Vector2.new(4, boxHeight); HealthBarOutline.Position = Vector2.new(barPosX - 1, barPosY); HealthBarOutline.Color = Color3.new(0,0,0); HealthBarOutline.Filled = true
                HealthBar.Visible = true; HealthBar.From = Vector2.new(barPosX + 1, barPosY + boxHeight); HealthBar.To = Vector2.new(barPosX + 1, (barPosY + boxHeight) - (boxHeight * percentage)); HealthBar.Thickness = 2
                HealthBar.Color = percentage > 0.75 and Color3.fromRGB(0, 255, 0) or (percentage > 0.35 and Color3.fromRGB(255, 255, 0) or Color3.fromRGB(255, 0, 0))
                local hl = player.Character:FindFirstChild("ESPHighlight") or Instance.new("Highlight", player.Character); hl.Name = "ESPHighlight"; hl.FillColor = RGBColor; hl.FillTransparency = 0.6
            else Clean() end
        else Clean() end
    end)
end
for _, p in pairs(Players:GetPlayers()) do ApplyESP(p) end
Players.PlayerAdded:Connect(ApplyESP)

-- --- AIMBOT DÖNGÜSÜ ---
RunService.RenderStepped:Connect(function()
    if FOVLockEnabled then Camera.FieldOfView = CustomFOV end
    local mouseLoc = UIS:GetMouseLocation()
    FOV_Circle.Position = Vector2.new(mouseLoc.X, mouseLoc.Y)
    if AimEnabled and UIS:IsKeyDown(AimKey) then
        if CurrentTarget and CurrentTarget.Parent and CurrentTarget.Parent:FindFirstChild("Humanoid") and CurrentTarget.Parent.Humanoid.Health > 0 then
            local _, onScreen = Camera:WorldToViewportPoint(CurrentTarget.Position)
            if onScreen then Camera.CFrame = CFrame.new(Camera.CFrame.Position, CurrentTarget.Position) return end
        end
        local closestPlr, shortestDist = nil, math.huge
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") and p.Character.Humanoid.Health > 0 then
                local head = p.Character.Head
                local pos, onScreen = Camera:WorldToViewportPoint(head.Position)
                if onScreen and (Vector2.new(pos.X, pos.Y) - mouseLoc).Magnitude < AimFovSize then
                    local magDist = (LocalPlayer.Character.HumanoidRootPart.Position - head.Position).Magnitude
                    if magDist < shortestDist then shortestDist = magDist; closestPlr = head end
                end
            end
        end
        CurrentTarget = closestPlr
        if CurrentTarget then Camera.CFrame = CFrame.new(Camera.CFrame.Position, CurrentTarget.Position) end
    else CurrentTarget = nil end
end)