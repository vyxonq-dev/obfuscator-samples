local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")

local Window = Rayfield:CreateWindow({
    Name = "⚡ SparkHub ⚡",
    LoadingTitle = "Loading SparkHub...",
    LoadingSubtitle = "Made by Sparks0911",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "SparkHub",
        FileName = "config"
    },
    Discord = {Enabled = false},
    KeySystem = false,
    ToggleUIKeybind = Enum.KeyCode.K,
})

local walkSpeed = 16
local jumpPower = 50
local infiniteJump = false
local freezeEnabled = false
local autoHealEnabled = false
local flyEnabled = false
local noclipEnabled = false
local aimbotEnabled = false
local fullbrightEnabled = false
local ESPEnabled = false

local bodyVelocity, bodyGyro

local originalLighting = {
    Ambient = Lighting.Ambient,
    Brightness = Lighting.Brightness,
    ClockTime = Lighting.ClockTime,
    FogEnd = Lighting.FogEnd,
    OutdoorAmbient = Lighting.OutdoorAmbient,
}

local PlayerTab = Window:CreateTab("Player")

PlayerTab:CreateSlider({
    Name = "WalkSpeed",
    Range = {16, 300},
    Increment = 1,
    CurrentValue = walkSpeed,
    Flag = "WalkSpeed",
    Callback = function(value)
        walkSpeed = value
        local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = walkSpeed
        end
    end,
})

PlayerTab:CreateSlider({
    Name = "JumpPower",
    Range = {50, 300},
    Increment = 1,
    CurrentValue = jumpPower,
    Flag = "JumpPower",
    Callback = function(value)
        jumpPower = value
        local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.JumpPower = jumpPower
        end
    end,
})

PlayerTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "InfiniteJump",
    Callback = function(value)
        infiniteJump = value
    end,
})

UserInputService.JumpRequest:Connect(function()
    if infiniteJump then
        local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

PlayerTab:CreateToggle({
    Name = "Freeze",
    CurrentValue = false,
    Flag = "Freeze",
    Callback = function(value)
        freezeEnabled = value
    end,
})

PlayerTab:CreateToggle({
    Name = "Auto Heal",
    CurrentValue = false,
    Flag = "AutoHeal",
    Callback = function(value)
        autoHealEnabled = value
    end,
})

PlayerTab:CreateToggle({
    Name = "Fly",
    CurrentValue = false,
    Flag = "Fly",
    Callback = function(value)
        flyEnabled = value
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end

        if flyEnabled then
            bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.MaxForce = Vector3.new(1e5, 1e5, 1e5)
            bodyVelocity.Velocity = Vector3.new(0, 0, 0)
            bodyVelocity.Parent = hrp

            bodyGyro = Instance.new("BodyGyro")
            bodyGyro.MaxTorque = Vector3.new(1e5, 1e5, 1e5)
            bodyGyro.CFrame = hrp.CFrame
            bodyGyro.Parent = hrp
        else
            if bodyVelocity then bodyVelocity:Destroy() bodyVelocity = nil end
            if bodyGyro then bodyGyro:Destroy() bodyGyro = nil end
        end
    end,
})

PlayerTab:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Flag = "Noclip",
    Callback = function(value)
        noclipEnabled = value
    end,
})

-- ======= VISUALS TAB =======
local VisualsTab = Window:CreateTab("Visuals")

VisualsTab:CreateToggle({
    Name = "Fullbright",
    CurrentValue = false,
    Flag = "Fullbright",
    Callback = function(value)
        fullbrightEnabled = value
        if value then
            Lighting.Ambient = Color3.new(1, 1, 1)
            Lighting.Brightness = 3
            Lighting.ClockTime = 14
            Lighting.FogEnd = 100000
            Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
        else
            Lighting.Ambient = originalLighting.Ambient
            Lighting.Brightness = originalLighting.Brightness
            Lighting.ClockTime = originalLighting.ClockTime
            Lighting.FogEnd = originalLighting.FogEnd
            Lighting.OutdoorAmbient = originalLighting.OutdoorAmbient
        end
    end,
})

-- ESP Setup
local ESPFolder = Instance.new("Folder", Workspace)
ESPFolder.Name = "SparkHubESP"

local function AddESP(player)
    if player == LocalPlayer then return end
    local char = player.Character
    if char and not ESPFolder:FindFirstChild(player.Name) then
        local highlight = Instance.new("Highlight")
        highlight.Name = player.Name
        highlight.Adornee = char
        highlight.FillColor = Color3.fromRGB(255, 0, 0)
        highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
        highlight.Parent = ESPFolder
    end
end

local function RemoveESP(player)
    local highlight = ESPFolder:FindFirstChild(player.Name)
    if highlight then highlight:Destroy() end
end

VisualsTab:CreateToggle({
    Name = "Red Outline ESP",
    CurrentValue = false,
    Flag = "ESP",
    Callback = function(value)
        ESPEnabled = value
        if not value then
            ESPFolder:ClearAllChildren()
        else
            for _, player in ipairs(Players:GetPlayers()) do
                AddESP(player)
            end
        end
    end,
})

local function onCharacterAdded(character)
    if ESPEnabled then
        task.wait(1)
        for _, player in ipairs(Players:GetPlayers()) do
            AddESP(player)
        end
    end
end

LocalPlayer.CharacterAdded:Connect(onCharacterAdded)

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        if ESPEnabled then
            task.wait(1)
            AddESP(player)
        end
    end)
end)

Players.PlayerRemoving:Connect(RemoveESP)

local CombatTab = Window:CreateTab("Combat")

CombatTab:CreateToggle({
    Name = "Aimbot (Toggle)",
    CurrentValue = false,
    Flag = "Aimbot",
    Callback = function(value)
        aimbotEnabled = value
    end,
})

local camera = Workspace.CurrentCamera

local function GetClosestEnemy()
    local closestPlayer = nil
    local shortestDist = math.huge
    local mousePos = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
            local headPos, onScreen = camera:WorldToViewportPoint(player.Character.Head.Position)
            if onScreen then
                local screenPos = Vector2.new(headPos.X, headPos.Y)
                local dist = (screenPos - mousePos).Magnitude
                if dist < shortestDist then
                    shortestDist = dist
                    closestPlayer = player
                end
            end
        end
    end
    return closestPlayer
end

RunService.RenderStepped:Connect(function()
    if aimbotEnabled then
        local target = GetClosestEnemy()
        if target and target.Character and target.Character:FindFirstChild("Head") then
            camera.CFrame = CFrame.new(camera.CFrame.Position, target.Character.Head.Position)
        end
    end
end)

RunService.Heartbeat:Connect(function()
    local character = LocalPlayer.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    local hrp = character and character:FindFirstChild("HumanoidRootPart")

    if humanoid then
        humanoid.WalkSpeed = walkSpeed
        humanoid.JumpPower = jumpPower
    end

    if autoHealEnabled and humanoid and humanoid.Health < humanoid.MaxHealth then
        humanoid.Health = humanoid.MaxHealth
    end

    if flyEnabled and bodyVelocity and bodyGyro and hrp then
        local cam = Workspace.CurrentCamera
        local moveDir = Vector3.new(0, 0, 0)
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir += cam.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir -= cam.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir -= cam.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir += cam.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveDir += Vector3.new(0, 1, 0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then moveDir -= Vector3.new(0, 1, 0) end

        if moveDir.Magnitude > 0 then
            bodyVelocity.Velocity = moveDir.Unit * 100
        else
            bodyVelocity.Velocity = Vector3.new(0, 0, 0)
        end
        bodyGyro.CFrame = cam.CFrame
    end

    if noclipEnabled and character then
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    else
        if character then
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                end
            end
        end
    end

    if freezeEnabled and character then
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") and not part.Anchored then
                part.Anchored = true
            end
        end
    elseif character then
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") and part.Anchored then
                part.Anchored = false
            end
        end
    end
end)

local EmergencyTab = Window:CreateTab("🚨 Emergency 🚨")

EmergencyTab:CreateButton({
    Name = "Self Destruct (Remove SparkHub)",
    Callback = function()
        local char = LocalPlayer.Character
        if char then
            for _, v in pairs(char:GetChildren()) do
                if v:IsA("BasePart") or v:IsA("MeshPart") or v:IsA("Accessory") then
                    v:Destroy()
                end
            end
        end
        ESPFolder:Destroy()
        Rayfield:Destroy()
    end,
})

return Window
