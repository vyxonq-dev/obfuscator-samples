local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- --- VARIABLEN & DATEN ---
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local Settings = {
    -- Combat (Aimbot)
    AimbotEnabled = false,
    SilentAim = false, -- Schüsse treffen eher ohne direktes Zielen
    Smoothness = 0.5,
    AimbotPart = "Head",
    AimbotFOV = 150,
    ShowFOV = true,
    FOVColor = Color3.fromRGB(255, 0, 0),
    FOVThickness = 1,
    
    -- Visuals (ESP)
    ESPEnabled = false,
    ESPBoxes = false,
    ESPNames = false,
    ESPTracer = false, -- Snaplines / Tracker
    ESPColor = Color3.fromRGB(255, 0, 0),
    TracerOrigin = "Bottom", -- "Mouse" oder "Bottom"
    
    -- Warnings
    BackWarning = false, -- "Enemy Behind You"
}

-- --- DRAWING SETUP ---
local FOVCircle = Drawing.new("Circle")
FOVCircle.Filled = false
FOVCircle.Transparency = 1
FOVCircle.Visible = false

local WarningText = Drawing.new("Text")
WarningText.Visible = false
WarningText.Center = true
WarningText.Size = 30
WarningText.Outline = true
WarningText.Font = 2
WarningText.Color = Color3.new(1, 0, 0)
WarningText.Text = "⚠️ ENEMY BEHIND YOU ⚠️"

-- --- UI WINDOW ---
local Window = Rayfield:CreateWindow({
   Name = "EROBIT AIMBOT",
   LoadingTitle = "eroBit Systems",
   LoadingSubtitle = "by eroBit",
   ConfigurationSaving = { Enabled = false }
})

local AimTab = Window:CreateTab("Combat (Aim)", 4483362458)
local VisTab = Window:CreateTab("Visuals (ESP)", 4483345998)

-- --- AIMBOT SEKTION ---
AimTab:CreateSection("Aimbot Settings")

AimTab:CreateToggle({
   Name = "Aimbot",
   CurrentValue = false,
   Callback = function(v) Settings.AimbotEnabled = v end
})

AimTab:CreateSlider({
   Name = "Smoothness / Strength",
   Range = {0, 1}, Increment = 0.1, CurrentValue = 0.5,
   Callback = function(v) Settings.Smoothness = v end
})

AimTab:CreateDropdown({
   Name = "Target Bone",
   Options = {"Head", "UpperTorso", "HumanoidRootPart"},
   CurrentOption = "Head",
   Callback = function(v) Settings.AimbotPart = v end
})

AimTab:CreateSection("FOV Customization")

AimTab:CreateToggle({
   Name = "Aimbot FOV ",
   CurrentValue = true,
   Callback = function(v) Settings.ShowFOV = v end
})

AimTab:CreateSlider({
   Name = "FOV Radius",
   Range = {50, 800}, Increment = 10, CurrentValue = 150,
   Callback = function(v) Settings.AimbotFOV = v end
})

AimTab:CreateColorPicker({
    Name = "FOV Color",
    Color = Color3.fromRGB(255, 0, 0),
    Callback = function(v) Settings.FOVColor = v end
})

-- --- VISUALS SEKTION ---
VisTab:CreateSection("ESP Options")

VisTab:CreateToggle({
   Name = " ESP ",
   CurrentValue = false,
   Callback = function(v) Settings.ESPEnabled = v end
})

VisTab:CreateToggle({
   Name = " Boxes ",
   CurrentValue = false,
   Callback = function(v) Settings.ESPBoxes = v end
})

VisTab:CreateToggle({
   Name = "Snaplines / Tracker",
   CurrentValue = false,
   Callback = function(v) Settings.ESPTracer = v end
})

VisTab:CreateToggle({
   Name = "Back-Warning (!)",
   CurrentValue = false,
   Callback = function(v) Settings.BackWarning = v end
})

VisTab:CreateColorPicker({
    Name = "Visual Color",
    Color = Color3.fromRGB(255, 0, 0),
    Callback = function(v) Settings.ESPColor = v end
})

-- --- CORE LOGIK ---

local function CreatePlayerVisuals(Player)
    local Box = Drawing.new("Square")
    local Line = Drawing.new("Line")
    
    RunService.RenderStepped:Connect(function()
        if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character:FindFirstChild("Humanoid") and Player.Character.Humanoid.Health > 0 then
            local Root = Player.Character.HumanoidRootPart
            local Pos, OnScreen = Camera:WorldToViewportPoint(Root.Position)
            
            -- Box ESP
            if OnScreen and Settings.ESPEnabled and Settings.ESPBoxes then
                local Size = (Camera:WorldToViewportPoint(Root.Position - Vector3.new(0, 3, 0)).Y - Camera:WorldToViewportPoint(Root.Position + Vector3.new(0, 2.6, 0)).Y)
                Box.Visible = true
                Box.Size = Vector2.new(Size * 0.7, Size)
                Box.Position = Vector2.new(Pos.X - Box.Size.X/2, Pos.Y - Box.Size.Y/2)
                Box.Color = Settings.ESPColor
            else
                Box.Visible = false
            end

            -- Tracker / Snaplines
            if OnScreen and Settings.ESPEnabled and Settings.ESPTracer then
                Line.Visible = true
                Line.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                Line.To = Vector2.new(Pos.X, Pos.Y)
                Line.Color = Settings.ESPColor
            else
                Line.Visible = false
            end
        else
            Box.Visible = false
            Line.Visible = false
        end
    end)
end

-- --- AIMBOT & WARNING UPDATES ---
RunService.RenderStepped:Connect(function()
    -- FOV Update
    FOVCircle.Visible = Settings.ShowFOV
    FOVCircle.Radius = Settings.AimbotFOV
    FOVCircle.Position = UserInputService:GetMouseLocation()
    FOVCircle.Color = Settings.FOVColor
    
    -- Aimbot Lock
    if Settings.AimbotEnabled and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
        local Target = nil
        local ShortestDist = Settings.AimbotFOV
        
        for _, v in pairs(Players:GetPlayers()) do
            if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild(Settings.AimbotPart) then
                local Pos, OnScreen = Camera:WorldToViewportPoint(v.Character[Settings.AimbotPart].Position)
                if OnScreen then
                    local Dist = (Vector2.new(Pos.X, Pos.Y) - UserInputService:GetMouseLocation()).Magnitude
                    if Dist < ShortestDist then
                        Target = v
                        ShortestDist = Dist
                    end
                end
            end
        end
        
        if Target then
            Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position, Target.Character[Settings.AimbotPart].Position), (1 - Settings.Smoothness))
        end
    end

    -- Warning Update
    local ShowWarning = false
    if Settings.BackWarning then
        for _, v in pairs(Players:GetPlayers()) do
            if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                local RelPos = Camera.CFrame:PointToObjectSpace(v.Character.HumanoidRootPart.Position)
                if RelPos.Z > 0 and (Camera.CFrame.Position - v.Character.HumanoidRootPart.Position).Magnitude < 50 then
                    ShowWarning = true
                end
            end
        end
    end
    WarningText.Visible = ShowWarning
    WarningText.Position = Vector2.new(Camera.ViewportSize.X / 2, 150)
end)

-- Initialisierung für Spieler
for _, p in pairs(Players:GetPlayers()) do if p ~= LocalPlayer then CreatePlayerVisuals(p) end end
Players.PlayerAdded:Connect(CreatePlayerVisuals)

Rayfield:Notify({Title = "AERO BIT", Content = "Fortnite Engine Loaded!", Duration = 4})
