local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "Testware",
    LoadingTitle = "Testware by v.ertflex!",
    LoadingSubtitle = "made by idev.xyz / v.ertflex",
    ConfigurationSaving = { Enabled = true, FolderName = "testware_cfg" }
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera
local LP = Players.LocalPlayer

local aimEnabled = false
local showFov = false
local fovSize = 135
local fovThickness = 2
local smoothness = 0.14
local maxDist = 900
local wallCheck = true

local fovCircle = Drawing.new("Circle")
fovCircle.Visible = false
fovCircle.Radius = fovSize
fovCircle.Thickness = fovThickness
fovCircle.Color = Color3.fromRGB(255, 0, 0)
fovCircle.Filled = false
fovCircle.Transparency = 0.8

local function playerVisible(pos)
    if not wallCheck then return true end
    local ray = Ray.new(Camera.CFrame.p, (pos - Camera.CFrame.p).unit * 500)
    local hit = workspace:FindPartOnRayWithIgnoreList(ray, {LP.Character or {}, Camera})
    return not hit or hit.Transparency >= 0.8 or not hit.CanCollide
end

local function getClosest()
    if not LP.Character or not LP.Character:FindFirstChild("HumanoidRootPart") then return end
    local closest, bestDist = nil, math.huge
    local center = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
    
    for _, player in Players:GetPlayers() do
        if player == LP or player.Team == LP.Team then continue end
        if not player.Character or not player.Character:FindFirstChild("Head") or player.Character.Humanoid.Health <= 0 then continue end
        
        local head = player.Character.Head.Position
        local screen, onScreen = Camera:WorldToViewportPoint(head)
        if not onScreen then continue end
        
        local dist = (head - LP.Character.HumanoidRootPart.Position).Magnitude
        if dist > maxDist then continue end
        if not playerVisible(head) then continue end
        
        local screenDist = (Vector2.new(screen.X, screen.Y) - center).Magnitude
        if screenDist < fovSize and screenDist < bestDist then
            bestDist = screenDist
            closest = head
        end
    end
    return closest
end

RunService.RenderStepped:Connect(function()
    fovCircle.Position = Camera.ViewportSize / 2
    fovCircle.Radius = fovSize
    fovCircle.Thickness = fovThickness
    fovCircle.Visible = showFov
    
    if aimEnabled and UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
        local target = getClosest()
        if target then
            Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.p, target), smoothness)
        end
    end
end)

local AimTab = Window:CreateTab("Aim Assist", nil)
local PlayerTab = Window:CreateTab("Player", nil)

AimTab:CreateToggle({
    Name = "Aim Assist (Hold RMB)",
    CurrentValue = false,
    Callback = function(Value)
        aimEnabled = Value
    end,
})

AimTab:CreateToggle({
    Name = "Show FOV Circle",
    CurrentValue = false,
    Callback = function(Value)
        showFov = Value
    end,
})

AimTab:CreateSlider({
    Name = "FOV Radius",
    Range = {10, 800},
    Increment = 5,
    CurrentValue = 135,
    Callback = function(Value)
        fovSize = Value
    end,
})

AimTab:CreateSlider({
    Name = "FOV Thickness",
    Range = {1, 10},
    Increment = 1,
    CurrentValue = 2,
    Callback = function(Value)
        fovThickness = Value
    end,
})

AimTab:CreateColorPicker({
    Name = "FOV Circle Color",
    Color = Color3.fromRGB(255, 0, 0),
    Callback = function(Color)
        fovCircle.Color = Color
    end,
})

AimTab:CreateSlider({
    Name = "Smoothness",
    Range = {0, 1},
    Increment = 0.01,
    CurrentValue = 0.14,
    Callback = function(Value)
        smoothness = Value
    end,
})

AimTab:CreateSlider({
    Name = "Max Distance",
    Range = {100, 2000},
    Increment = 50,
    CurrentValue = 900,
    Callback = function(Value)
        maxDist = Value
    end,
})

AimTab:CreateToggle({
    Name = "Wall Check",
    CurrentValue = true,
    Callback = function(Value)
        wallCheck = Value
    end,
})

PlayerTab:CreateSlider({
    Name = "Walk Speed",
    Range = {0, 500},
    Increment = 10,
    CurrentValue = 16,
    Callback = function(Value)
        if LP.Character and LP.Character:FindFirstChild("Humanoid") then
            LP.Character.Humanoid.WalkSpeed = Value
        end
    end,
})

local jumpPower = 50
PlayerTab:CreateSlider({
    Name = "Jump Power",
    Range = {0, 500},
    Increment = 10,
    CurrentValue = 50,
    Callback = function(Value)
        jumpPower = Value
        if LP.Character and LP.Character:FindFirstChild("Humanoid") then
            LP.Character.Humanoid.JumpPower = Value
        end
    end,
})

local infiniteJump = false
local infJumpConnection
PlayerTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Callback = function(Value)
        infiniteJump = Value
        if Value then
            infJumpConnection = UIS.JumpRequest:Connect(function()
                if LP.Character and LP.Character:FindFirstChild("Humanoid") and LP.Character:FindFirstChild("HumanoidRootPart") then
                    LP.Character.HumanoidRootPart.Velocity = Vector3.new(0, 50, 0)
                end
            end)
        else
            if infJumpConnection then
                infJumpConnection:Disconnect()
                infJumpConnection = nil
            end
        end
    end,
})