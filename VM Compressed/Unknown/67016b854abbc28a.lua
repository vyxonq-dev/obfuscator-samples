-- SECURITY CHECK: ONLY FOR MOTORRUSH!
if game.PlaceId ~= 14055498520 then 
    warn("WRONG GAME! This Script is only for MotorRush! (ID: 14055498520)")
    return 
end

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Velocity V26 | MotorRush! 💎",
   LoadingTitle = "AUTHENTICATING FOR MOTORRUSH...",
   LoadingSubtitle = "by Dero9",
   ConfigurationSaving = { Enabled = false }
})

-- SERVICES
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local uis = game:GetService("UserInputService")
local runService = game:GetService("RunService")

-- VARIABLES
_G.NoRagdoll = false
_G.InfJump = false
_G.ESP = false
_G.Tracers = false
_G.TargetCoords = ""
_G.WalkSpeed = 16
_G.JumpPower = 50
_G.AutoFlip = false
_G.Noclip = false

-- CUSTOM COLORS
_G.PlayerESPColor = Color3.fromRGB(255, 0, 0)
_G.BikeESPColor = Color3.fromRGB(255, 255, 0)
_G.TracerColor = Color3.fromRGB(255, 255, 255)

-- SILENT TELEPORT (BIKE SYNC)
local function silentTeleport(coords)
    local char = player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local targetCF = CFrame.new(coords[1], coords[2] + 3, coords[3])
    local hum = char:FindFirstChild("Humanoid")
    if hum and hum.SeatPart then
        local model = hum.SeatPart.Parent
        while model.Parent ~= workspace and model.Parent ~= nil do model = model.Parent end
        model:SetPrimaryPartCFrame(targetCF)
    else
        char:SetPrimaryPartCFrame(targetCF)
    end
end

-- ==========================================
-- TAB 1: SYSTEM & TP 📍
-- ==========================================
local InfoTab = Window:CreateTab("System & TP 📍", 4483362458)

InfoTab:CreateSection("MotorRush Status")
local BikeLabel = InfoTab:CreateLabel("Vehicle: Scanning...")
local PosLabel = InfoTab:CreateLabel("X: 0 Y: 0 Z: 0")

task.spawn(function()
    while true do
        if player.Character then
            local hum = player.Character:FindFirstChild("Humanoid")
            BikeLabel:Set(hum and hum.SeatPart and "Vehicle: " .. hum.SeatPart.Parent.Name or "Vehicle: None")
            local p = player.Character.HumanoidRootPart.Position
            PosLabel:Set(string.format("Pos: %.1f, %.1f, %.1f", p.X, p.Y, p.Z))
        end
        task.wait(0.5)
    end
end)

InfoTab:CreateSection("Teleport (P = Save | Ctrl+Click = TP)")
local TPInput = InfoTab:CreateInput({Name = "Coordinates", PlaceholderText = "P to copy current...", Callback = function(t) _G.TargetCoords = t end})
InfoTab:CreateButton({Name = "Teleport", Callback = function() 
    local c = {} for num in string.gmatch(_G.TargetCoords, "%-?%d+%.?%d*") do table.insert(c, tonumber(num)) end
    if #c >= 3 then silentTeleport(c) end
end})

InfoTab:CreateSection("Racing Events 🏁")
InfoTab:CreateButton({Name = "🏠 Spawn", Callback = function() silentTeleport({596.3, 5.9, -8.6}) end})
InfoTab:CreateButton({Name = "🌍 World Race", Callback = function() silentTeleport({710.9, 4.8, -113.5}) end})
InfoTab:CreateButton({Name = "💨 Drift Race", Callback = function() silentTeleport({657.2, 4.8, 143.7}) end})
InfoTab:CreateButton({Name = "🏎️ Mini Race", Callback = function() silentTeleport({4638.4, 4.9, 1251.2}) end})
InfoTab:CreateButton({Name = "🏁 Drag Race", Callback = function() silentTeleport({4261.5, 5.0, 1711.8}) end})

-- ==========================================
-- TAB 2: PRO RACING 🏆
-- ==========================================
local ProTab = Window:CreateTab("Pro Racing 🏆", 4483362458)
ProTab:CreateToggle({Name = "Auto-Flip (Anti-Flip)", CurrentValue = false, Callback = function(v) _G.AutoFlip = v end})
local NoclipToggle = ProTab:CreateToggle({Name = "Noclip (V Key)", CurrentValue = false, Callback = function(v) _G.Noclip = v end})

-- ==========================================
-- TAB 3: PHYSICS ⚡
-- ==========================================
local PhysTab = Window:CreateTab("Physics ⚡", 4483362458)
PhysTab:CreateSlider({Name = "WalkSpeed", Range = {16, 300}, Increment = 1, CurrentValue = 16, Callback = function(v) _G.WalkSpeed = v end})
PhysTab:CreateSlider({Name = "JumpPower", Range = {50, 600}, Increment = 5, CurrentValue = 50, Callback = function(v) _G.JumpPower = v end})
PhysTab:CreateToggle({Name = "Infinite Jump", CurrentValue = false, Callback = function(v) _G.InfJump = v end})
PhysTab:CreateToggle({Name = "No-Ragdoll", CurrentValue = false, Callback = function(v) _G.NoRagdoll = v end})

-- ==========================================
-- TAB 4: VISUALS 👁️
-- ==========================================
local VisTab = Window:CreateTab("Visuals 👁️", 4483362458)
VisTab:CreateSection("ESP Colors")
VisTab:CreateToggle({Name = "Enable Highlights", CurrentValue = false, Callback = function(v) _G.ESP = v end})
VisTab:CreateColorPicker({Name = "Player Color", Color = _G.PlayerESPColor, Callback = function(c) _G.PlayerESPColor = c end})
VisTab:CreateColorPicker({Name = "Bike Color", Color = _G.BikeESPColor, Callback = function(c) _G.BikeESPColor = c end})

VisTab:CreateSection("Tracer Lines")
VisTab:CreateToggle({Name = "Enable Tracers", CurrentValue = false, Callback = function(v) _G.Tracers = v end})
VisTab:CreateColorPicker({Name = "Tracer Color", Color = _G.TracerColor, Callback = function(c) _G.TracerColor = c end})

VisTab:CreateSection("Camera")
VisTab:CreateSlider({Name = "FOV", Range = {70, 120}, Increment = 1, CurrentValue = 70, Callback = function(v) workspace.CurrentCamera.FieldOfView = v end})

-- ==========================================
-- CORE ENGINE
-- ==========================================

-- NOCLIP HANDLER (V-KEY)
runService.Stepped:Connect(function()
    if player.Character and _G.Noclip then
        for _, part in pairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end
end)

-- TRACER LOGIC
local function createTracer(p)
    local line = Drawing.new("Line")
    runService.RenderStepped:Connect(function()
        if _G.Tracers and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local pos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(p.Character.HumanoidRootPart.Position)
            if onScreen then
                line.Visible = true
                line.From = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)
                line.To = Vector2.new(pos.X, pos.Y)
                line.Color = _G.TracerColor
                line.Thickness = 1.5
            else line.Visible = false end
        else line.Visible = false end
    end)
end
for _, p in pairs(game.Players:GetPlayers()) do if p ~= player then createTracer(p) end end
game.Players.PlayerAdded:Connect(createTracer)

-- PHYSICS & ESP LOOP
runService.Heartbeat:Connect(function()
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        local hum = player.Character.Humanoid
        hum.WalkSpeed = _G.WalkSpeed
        hum.JumpPower = _G.JumpPower
        
        if _G.NoRagdoll and hum:GetState() == Enum.HumanoidStateType.Ragdoll then
            hum:ChangeState(Enum.HumanoidStateType.GettingUp)
        end
        
        if _G.AutoFlip and hum.SeatPart then
            local seat = hum.SeatPart
            if math.abs(seat.Orientation.Z) > 70 or math.abs(seat.Orientation.X) > 70 then
                seat.CFrame = CFrame.new(seat.Position + Vector3.new(0, 3, 0)) * CFrame.Angles(0, math.rad(seat.Orientation.Y), 0)
            end
        end

        if _G.ESP then
            for _, p in pairs(game.Players:GetPlayers()) do
                if p ~= player and p.Character then
                    local h = p.Character:FindFirstChild("DeroESP") or Instance.new("Highlight", p.Character)
                    h.Name = "DeroESP"; h.FillColor = _G.PlayerESPColor
                    if p.Character.Humanoid.SeatPart then
                        local b = p.Character.Humanoid.SeatPart.Parent:FindFirstChild("DeroESP") or Instance.new("Highlight", p.Character.Humanoid.SeatPart.Parent)
                        b.Name = "DeroESP"; b.FillColor = _G.BikeESPColor
                    end
                end
            end
        end
    end
end)

-- INPUTS
uis.InputBegan:Connect(function(i, g)
    if g then return end
    if i.KeyCode == Enum.KeyCode.V then
        _G.Noclip = not _G.Noclip
        NoclipToggle:Set(_G.Noclip)
        Rayfield:Notify({Title = "Noclip", Content = _G.Noclip and "Enabled" or "Disabled", Duration = 1})
    elseif i.KeyCode == Enum.KeyCode.P and player.Character then
        local p = player.Character.HumanoidRootPart.Position
        _G.TargetCoords = string.format("%.1f, %.1f, %.1f", p.X, p.Y, p.Z)
        TPInput:Set(_G.TargetCoords)
    elseif i.KeyCode == Enum.KeyCode.Space and _G.InfJump then
        player.Character.Humanoid:ChangeState("Jumping")
    end
end)

mouse.Button1Down:Connect(function()
    if uis:IsKeyDown(Enum.KeyCode.LeftControl) then silentTeleport({mouse.Hit.X, mouse.Hit.Y, mouse.Hit.Z}) end
end)
