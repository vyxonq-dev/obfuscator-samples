-- =================================
-- Tower Toolbox (Rayfield Edition)
-- Fixed: FOV Slider & Infinite Jump
-- Created By: BabyMaxford
-- =================================

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

-- State Variables
local AIMBOT_ENABLED = false
local ESP_ENABLED = false
local RMB_HELD = false
_G.AimPart = "Head"
local SPEED_HACK_ENABLED = false
local SPEED_VALUE = 50
local SPEED_CONNECTION = nil
local INFINITE_JUMP_ENABLED = false
local JUMP_CONNECTION = nil
local FOV_RADIUS = 150
local SHOW_FOV = false
local SMOOTHING = 1
local RENDER_CONNECTION = nil

-- Create FOV Circle
local FOVCircle = Drawing.new("Circle")
FOVCircle.Visible = false
FOVCircle.Radius = FOV_RADIUS
FOVCircle.Color = Color3.fromRGB(0, 255, 255)
FOVCircle.Thickness = 2
FOVCircle.Transparency = 0.8
FOVCircle.NumSides = 64

-- Main Window
local Window = Rayfield:CreateWindow({
   Name = "Tower Toolbox",
   LoadingTitle = "Tower Toolbox Loading...",
   LoadingSubtitle = "by BabyMaxford",
   ConfigurationSaving = { 
      Enabled = true, 
      FolderName = "TowerToolboxConfig", 
      FileName = "MainConfig" 
   },
   Discord = { Enabled = false },
   KeySystem = false
})

-- Tabs
local CombatTab = Window:CreateTab("Combat", 4483362458)
local MovementTab = Window:CreateTab("Movement", 4483362458)
local SettingsTab = Window:CreateTab("Settings", 4483362458)

-- [COMBAT TAB]
CombatTab:CreateToggle({
    Name = "Aimbot Enabled",
    CurrentValue = false,
    Callback = function(val)
        AIMBOT_ENABLED = val
    end
})

CombatTab:CreateToggle({
    Name = "Show FOV Circle",
    CurrentValue = false,
    Callback = function(val)
        SHOW_FOV = val
    end
})

CombatTab:CreateToggle({
    Name = "ESP / Highlights",
    CurrentValue = false,
    Callback = function(val)
        ESP_ENABLED = val
        if not val then destroyAllESP() end
    end
})

CombatTab:CreateDropdown({
    Name = "Target Part",
    Options = {"Head", "HumanoidRootPart"},
    CurrentOption = {"Head"},
    Callback = function(Option)
        _G.AimPart = type(Option) == "table" and Option[1] or Option
    end
})

CombatTab:CreateSlider({
    Name = "FOV Radius",
    Range = {50, 500},
    Increment = 1,
    CurrentValue = 150,
    Callback = function(val)
        FOV_RADIUS = val
    end
})

CombatTab:CreateSlider({
    Name = "Smoothing",
    Range = {0.01, 1},
    Increment = 0.01,
    CurrentValue = 1.0,
    Callback = function(val)
        SMOOTHING = val
    end
})

-- [MOVEMENT TAB]
MovementTab:CreateToggle({
    Name = "Speed Hack",
    CurrentValue = false,
    Callback = function(val)
        SPEED_HACK_ENABLED = val
        if val then
            if not SPEED_CONNECTION then
                SPEED_CONNECTION = RunService.Heartbeat:Connect(function()
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                        LocalPlayer.Character.Humanoid.WalkSpeed = SPEED_VALUE
                    end
                end)
            end
        else
            if SPEED_CONNECTION then SPEED_CONNECTION:Disconnect() SPEED_CONNECTION = nil end
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid.WalkSpeed = 16
            end
        end
    end
})

MovementTab:CreateInput({
    Name = "Speed Value",
    PlaceholderText = "50",
    Callback = function(val)
        SPEED_VALUE = tonumber(val) or 50
    end
})

MovementTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Callback = function(val)
        INFINITE_JUMP_ENABLED = val
        if val then
            if not JUMP_CONNECTION then
                JUMP_CONNECTION = UserInputService.JumpRequest:Connect(function()
                    if INFINITE_JUMP_ENABLED and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                        LocalPlayer.Character.Humanoid:ChangeState("Jumping")
                    end
                end)
            end
        else
            if JUMP_CONNECTION then JUMP_CONNECTION:Disconnect() JUMP_CONNECTION = nil end
        end
    end
})

-- [SETTINGS TAB]
SettingsTab:CreateButton({
    Name = "Destroy Script",
    Callback = function()
        if RENDER_CONNECTION then RENDER_CONNECTION:Disconnect() end
        if SPEED_CONNECTION then SPEED_CONNECTION:Disconnect() end
        if JUMP_CONNECTION then JUMP_CONNECTION:Disconnect() end
        destroyAllESP()
        FOVCircle:Destroy()
        Rayfield:Destroy()
    end
})

SettingsTab:CreateLabel("Created By: BabyMaxford")

-- Logic Functions
function destroyAllESP()
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("Highlight") then obj:Destroy() end
    end
end

function highlight(model, color)
    if not model or model:FindFirstChildOfClass("Highlight") then return end
    local h = Instance.new("Highlight")
    h.FillTransparency = 1
    h.OutlineColor = color
    h.Parent = model
end

function closestTarget()
    local best, bestDist = nil, math.huge
    local center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    local zombies = Workspace:FindFirstChild("ActiveZombies")
    if zombies then
        for _, z in ipairs(zombies:GetChildren()) do
            local part = z:FindFirstChild(_G.AimPart) or z:FindFirstChildWhichIsA("BasePart")
            if part then
                local pos, vis = Camera:WorldToViewportPoint(part.Position)
                if vis then
                    local d = (Vector2.new(pos.X, pos.Y) - center).Magnitude
                    if d <= FOV_RADIUS and d < bestDist then
                        bestDist = d
                        best = part
                    end
                end
            end
        end
    end
    return best
end

-- Input Handling
UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then RMB_HELD = true end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then RMB_HELD = false end
end)

-- Main Loop
RENDER_CONNECTION = RunService.RenderStepped:Connect(function()
    -- FOV Update Logic
    FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    FOVCircle.Radius = FOV_RADIUS -- This fixes the slider issue
    FOVCircle.Visible = SHOW_FOV
    
    if ESP_ENABLED then
        local zombies = Workspace:FindFirstChild("ActiveZombies")
        if zombies then
            for _, z in ipairs(zombies:GetChildren()) do
                highlight(z, Color3.fromRGB(255, 60, 60))
            end
        end
    end

    if AIMBOT_ENABLED and RMB_HELD then
        local target = closestTarget()
        if target then
            Camera.CFrame = Camera.CFrame:Lerp(CFrame.lookAt(Camera.CFrame.Position, target.Position), SMOOTHING)
        end
    end
end)

Rayfield:Notify({
    Title = "Tower Toolbox Loaded",
    Content = "FOV Slider and Infinite Jump fixed!",
    Duration = 5,
    Image = 4483362458
})