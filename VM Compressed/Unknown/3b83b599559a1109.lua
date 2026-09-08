-- SLAP DUELS HUB
-- WalkSpeed + JumpPower + Fly (Infinite Yield style, fixed controls)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer

-- Load Rayfield
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-------------------------------------------------
-- SAVED VALUES
-------------------------------------------------
local SavedWalkSpeed = 16
local SavedJumpPower = 50
local FlySpeed = 60

-------------------------------------------------
-- WINDOW
-------------------------------------------------
local Window = Rayfield:CreateWindow({
    Name = "SLAP DUELS HUB",
    LoadingTitle = "SLAP DUELS HUB",
    LoadingSubtitle = "SLAP DUELS",
    ConfigurationSaving = { Enabled = false },
    KeySystem = false
})

local Tab = Window:CreateTab("Main", 4483362458)

-------------------------------------------------
-- CHARACTER HELPERS
-------------------------------------------------
local humConn
local reapplyToken = 0

local function getChar()
    local char = player.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    local root = char:FindFirstChild("HumanoidRootPart")
    return char, hum, root
end

local function applyMovement(char)
    local hum = char:WaitForChild("Humanoid", 5)
    if not hum then return end

    hum.UseJumpPower = true
    hum.WalkSpeed = SavedWalkSpeed
    hum.JumpPower = SavedJumpPower

    if humConn then humConn:Disconnect() humConn = nil end
    humConn = hum:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
        if hum.WalkSpeed ~= SavedWalkSpeed then
            hum.WalkSpeed = SavedWalkSpeed
        end
    end)

    local myToken = reapplyToken
    task.delay(0.2, function()
        if reapplyToken == myToken and hum.Parent then
            hum.WalkSpeed = SavedWalkSpeed
            hum.JumpPower = SavedJumpPower
        end
    end)
end

player.CharacterAdded:Connect(function(char)
    reapplyToken += 1
    task.wait(0.05)
    applyMovement(char)
end)

if player.Character then
    applyMovement(player.Character)
end

-------------------------------------------------
-- WALKSPEED
-------------------------------------------------
Tab:CreateSlider({
    Name = "WalkSpeed",
    Range = {16, 150},
    Increment = 1,
    CurrentValue = SavedWalkSpeed,
    Callback = function(v)
        SavedWalkSpeed = v
        local _, hum = getChar()
        if hum then hum.WalkSpeed = v end
    end
})

-------------------------------------------------
-- JUMP POWER
-------------------------------------------------
Tab:CreateSlider({
    Name = "JumpPower",
    Range = {50, 250},
    Increment = 5,
    CurrentValue = SavedJumpPower,
    Callback = function(v)
        SavedJumpPower = v
        local _, hum = getChar()
        if hum then
            hum.UseJumpPower = true
            hum.JumpPower = v
        end
    end
})

-------------------------------------------------
-- FLY (INFINITE YIELD STYLE, CORRECTED)
-------------------------------------------------
local flying = false
local flyConn
local bv, bg

local function flyOff()
    flying = false
    if flyConn then flyConn:Disconnect() flyConn = nil end
    if bv then bv:Destroy() bv = nil end
    if bg then bg:Destroy() bg = nil end

    local _, hum = getChar()
    if hum then
        hum.PlatformStand = false
        hum:ChangeState(Enum.HumanoidStateType.Running)
    end
end

local function flyOn()
    local char, hum, root = getChar()
    if not char or not hum or not root then return end

    flying = true
    hum.PlatformStand = true

    bg = Instance.new("BodyGyro")
    bg.P = 9e4
    bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
    bg.CFrame = root.CFrame
    bg.Parent = root

    bv = Instance.new("BodyVelocity")
    bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
    bv.Parent = root

    flyConn = RunService.RenderStepped:Connect(function()
        if not flying then return end
        if not root.Parent then flyOff() return end

        local cam = workspace.CurrentCamera
        local moveDir = hum.MoveDirection

        local localDir = cam.CFrame:VectorToObjectSpace(moveDir)
        local move =
            (cam.CFrame.RightVector * localDir.X) -
            (cam.CFrame.LookVector  * localDir.Z)

        local vertical = 0
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then vertical += 1 end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl)
        or UserInputService:IsKeyDown(Enum.KeyCode.C) then vertical -= 1 end

        bv.Velocity = (move * FlySpeed) + Vector3.new(0, vertical * FlySpeed, 0)
        bg.CFrame = cam.CFrame
    end)
end

Tab:CreateButton({
    Name = "Fly",
    Callback = function()
        if flying then
            flyOff()
        else
            flyOn()
        end
    end
})

-------------------------------------------------
-- FOOTER (ONLY ADDITION)
-------------------------------------------------
Tab:CreateParagraph({
    Title = "",
    Content = "Made with ❤️ by Meowzrz\nMore coming soon!\nv1"
})

-------------------------------------------------
-- READY
-------------------------------------------------
Rayfield:Notify({
    Title = "SLAP DUELS HUB",
    Content = "Loaded",
    Duration = 3
})
