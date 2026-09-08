-- Creator: Finder_Guy
-- Creatures of Sonaria | Huge Semi-Visible Hitbox (200 studs) + Camera Focus on Head

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local player = game.Players.LocalPlayer
local runService = game:GetService("RunService")
local Camera = workspace.CurrentCamera

local extendHitboxEnabled = false

local Window = Rayfield:CreateWindow({
    Name = "Creatures of Sonaria | by Finder_Guy",
    LoadingTitle = "Loading Script by Finder_Guy...",
    ConfigurationSaving = {Enabled = false},
    KeySystem = false
})

local MainTab = Window:CreateTab("Main")

MainTab:CreateToggle({
    Name = "Extend Hitbox",
    CurrentValue = false,
    Callback = function(value)
        extendHitboxEnabled = value
    end
})

-- Extend hitbox function (200 studs cube, semi-transparent visible)
local function extendHitbox()
    local char = player.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local hrp = char.HumanoidRootPart
        hrp.Size = Vector3.new(200, 200, 200)
        hrp.Transparency = 0.7
        hrp.CanCollide = false
    end
end

-- Reset hitbox to default
local function resetHitbox()
    local char = player.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local hrp = char.HumanoidRootPart
        hrp.Size = Vector3.new(2, 2, 1)
        hrp.Transparency = 0
        hrp.CanCollide = true
    end
end

-- Update camera to focus on Head to avoid being inside huge hitbox
local function updateCameraFocus()
    local char = player.Character
    if char then
        local head = char:FindFirstChild("Head")
        if head then
            Camera.CameraSubject = head
            Camera.CameraType = Enum.CameraType.Custom
        end
    end
end

-- When character spawns, focus camera on head
player.CharacterAdded:Connect(function(char)
    char:WaitForChild("Head")
    updateCameraFocus()
end)

-- Continuously update camera focus and hitbox size each frame
runService.Heartbeat:Connect(function()
    updateCameraFocus()
    if extendHitboxEnabled then
        extendHitbox()
    else
        resetHitbox()
    end
end)
