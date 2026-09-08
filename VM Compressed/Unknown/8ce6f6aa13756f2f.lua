local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Defusal",
    LoadingTitle = "Карыч Studio",
    LoadingSubtitle = "by Kirilkani123",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil,
       FileName = "Big Hub"
    }
})

local Tab = Window:CreateTab("Legit", 4483362458)

local speedHackEnabled = false
local speedHackConnection = nil
local currentSpeed = 16

local SpeedSlider = Tab:CreateSlider({
    Name = "WalkSpeed",
    Range = {16, 100},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Flag = "SpeedSlider",
    Callback = function(Value)
        local player = game:GetService("Players").LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")
        currentSpeed = Value
        
        if speedHackConnection then
            speedHackConnection:Disconnect()
            speedHackConnection = nil
        end
        
        speedHackEnabled = true
        speedHackConnection = game:GetService("RunService").Stepped:Connect(function()
            if humanoid and humanoid.Parent then
                humanoid.WalkSpeed = currentSpeed
            end
        end)
    end,
})

local thirdPersonEnabled = false
local defaultZoom = 12.5
local thirdPersonConnection = nil

local ThirdPersonButton = Tab:CreateButton({
    Name = "ThirdPerson (Stable)",
    Callback = function()
        thirdPersonEnabled = not thirdPersonEnabled
        local player = game:GetService("Players").LocalPlayer
        
        if thirdPersonEnabled then
            if thirdPersonConnection then
                thirdPersonConnection:Disconnect()
            end
            
            thirdPersonConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if player then
                    player.CameraMode = Enum.CameraMode.Classic
                    player.CameraMaxZoomDistance = defaultZoom
                    player.CameraMinZoomDistance = defaultZoom
                end
            end)
        else
            if thirdPersonConnection then
                thirdPersonConnection:Disconnect()
                thirdPersonConnection = nil
            end
            player.CameraMode = Enum.CameraMode.LockFirstPerson
            player.CameraMaxZoomDistance = 0.5
            player.CameraMinZoomDistance = 0.5
        end
    end,
})

local CameraZoomSlider = Tab:CreateSlider({
    Name = "Camera Distance (Stable)",
    Range = {5, 25},
    Increment = 0.5,
    Suffix = "Studs",
    CurrentValue = 12.5,
    Flag = "CameraZoomSlider",
    Callback = function(Value)
        local player = game:GetService("Players").LocalPlayer
        defaultZoom = Value
        
        if thirdPersonEnabled then
            player.CameraMaxZoomDistance = Value
            player.CameraMinZoomDistance = Value
        end
    end,
})

local transparencyEnabled = false
local transparencyValue = 0.7
local transparencyConnection = nil

local TransparencyButton = Tab:CreateButton({
    Name = "Local Transparency (Stable)",
    Callback = function()
        transparencyEnabled = not transparencyEnabled
        local player = game:GetService("Players").LocalPlayer
        
        local function setTransparency(model, value)
            for _, part in pairs(model:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Transparency = value
                elseif part:IsA("Decal") or part:IsA("Texture") then
                    part.Transparency = value
                elseif part:IsA("ParticleEmitter") then
                    part.Transparency = NumberSequence.new(value)
                end
            end
            
            for _, cloth in pairs(model:GetChildren()) do
                if cloth:IsA("Shirt") or cloth:IsA("Pants") or 
                   cloth:IsA("ShirtGraphic") or cloth:IsA("Accessory") or
                   cloth:IsA("Hat") then
                    for _, part in pairs(cloth:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.Transparency = value
                        elseif part:IsA("Decal") or part:IsA("Texture") then
                            part.Transparency = value
                        end
                    end
                end
            end
        end
        
        if transparencyEnabled then
            if transparencyConnection then
                transparencyConnection:Disconnect()
            end
            
            transparencyConnection = game:GetService("RunService").Heartbeat:Connect(function()
                local character = player.Character
                if character then
                    setTransparency(character, transparencyValue)
                end
            end)
        else
            if transparencyConnection then
                transparencyConnection:Disconnect()
                transparencyConnection = nil
            end
            local character = player.Character
            if character then
                setTransparency(character, 0)
            end
        end
    end,
})

local TransparencySlider = Tab:CreateSlider({
    Name = "Transparency (Stable)",
    Range = {0, 1},
    Increment = 0.1,
    Suffix = "Alpha",
    CurrentValue = 0.7,
    Flag = "TransparencySlider",
    Callback = function(Value)
        transparencyValue = Value
    end,
})

local spinEnabled = false
local spinConnection = nil
local spinSpeed = 10

local SpinButton = Tab:CreateButton({
    Name = "Spin (Stable)",
    Callback = function()
        spinEnabled = not spinEnabled
        local player = game:GetService("Players").LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")
        
        humanoid.AutoRotate = not spinEnabled
        
        if spinEnabled then
            local spinForce = Instance.new("BodyAngularVelocity")
            spinForce.Name = "SpinForce"
            spinForce.AngularVelocity = Vector3.new(0, spinSpeed, 0)
            spinForce.MaxTorque = Vector3.new(0, math.huge, 0)
            spinForce.Parent = character.HumanoidRootPart
            
            if spinConnection then spinConnection:Disconnect() end
            
            spinConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if character and character:FindFirstChild("HumanoidRootPart") then
                    local spinForce = character.HumanoidRootPart:FindFirstChild("SpinForce")
                    if spinForce then
                        spinForce.AngularVelocity = Vector3.new(0, spinSpeed, 0)
                    end
                end
            end)
            
            character.Humanoid.Died:Connect(function()
                if spinEnabled then
                    spinEnabled = false
                    if spinConnection then
                        spinConnection:Disconnect()
                        spinConnection = nil
                    end
                end
            end)
        else
            if spinConnection then
                spinConnection:Disconnect()
                spinConnection = nil
            end
            
            local spinForce = character.HumanoidRootPart:FindFirstChild("SpinForce")
            if spinForce then spinForce:Destroy() end
            
            humanoid.AutoRotate = true
        end
    end,
})

local SpinSpeedSlider = Tab:CreateSlider({
    Name = "Spin Speed",
    Range = {1, 50},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 10,
    Flag = "SpinSpeedSlider",
    Callback = function(Value)
        spinSpeed = Value
    end,
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local espEnabled = false
local espHighlights = {}
local connection

local function createHighlight(player)
    if player == LocalPlayer then return end

    local highlight = Instance.new("Highlight")
    highlight.FillColor = Color3.fromRGB(255, 0, 0)
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0
    highlight.Parent = player.Character

    return highlight
end

local function updateESP()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            if not espHighlights[player.Name] then
                espHighlights[player.Name] = createHighlight(player)
            end
        end
    end
end

local Button = Tab:CreateButton({
    Name = "Toggle ESP",
    Callback = function()
        espEnabled = not espEnabled
        if espEnabled then
            updateESP()
            connection = RunService.RenderStepped:Connect(updateESP)
        else
            if connection then
                connection:Disconnect()
                connection = nil
            end
            for name, highlight in pairs(espHighlights) do
                if highlight then highlight:Destroy() end
            end
            espHighlights = {}
        end
    end,
})

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        if espEnabled then
            espHighlights[player.Name] = createHighlight(player)
        end
    end)
end)

Players.PlayerRemoving:Connect(function(player)
    if espHighlights[player.Name] then
        espHighlights[player.Name]:Destroy()
        espHighlights[player.Name] = nil
    end
end)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local RunService = game:GetService("RunService")

local aimbotEnabled = false

local function getClosestTarget()
    local closestPlayer = nil
    local closestDistance = math.huge

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
            local targetPosition = player.Character.Head.Position
            local screenPosition, onScreen = workspace.CurrentCamera:WorldToScreenPoint(targetPosition)

            if onScreen then
                local distance = (Mouse.X - screenPosition.X)^2 + (Mouse.Y - screenPosition.Y)^2
                if distance < closestDistance then
                    closestDistance = distance
                    closestPlayer = player
                end
            end
        end
    end

    return closestPlayer
end

local function aimAtTarget(target)
    if target and target.Character and target.Character:FindFirstChild("Head") then
        local targetPosition = target.Character.Head.Position
        local camera = workspace.CurrentCamera
        local direction = (targetPosition - camera.CFrame.Position).unit
        camera.CFrame = CFrame.new(camera.CFrame.Position, camera.CFrame.Position + direction)
    end
end

RunService.RenderStepped:Connect(function()
    if aimbotEnabled then
        local target = getClosestTarget()
        aimAtTarget(target)
    end
end)

Mouse.Button2Down:Connect(function()
    aimbotEnabled = true
end)

Mouse.Button2Up:Connect(function()
    aimbotEnabled = false
end)

local Button = Tab:CreateButton({
    Name = "Toggle Aimbot",
    Callback = function()
        aimbotEnabled = not aimbotEnabled
    end,
})
