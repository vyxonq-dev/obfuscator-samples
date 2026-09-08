local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()

local OriginalValues = {
    PsychicRange = nil,
    Stored = false
}

local Settings = {
    Hitbox = {Enabled = false, Size = 15},
    Fly = {Enabled = false, Speed = 50},
    Noclip = {Enabled = false},
    EnergyOrb = {AutoCollect = false},
    ESP = {Enabled = false, ShowName = true, ShowHealth = true},
    InfRange = {Enabled = false}
}

local Flags = {}
local Connections = {}
local CachedOrbs = {}
local LastOrbScan = 0
local flyBody = nil
local flyGyro = nil
local TeleportTool = nil
local infRangeDebounce = false
local lastKeyPress = {}

local function GetCharacter()
    return LocalPlayer.Character
end

local function GetHRP()
    local char = GetCharacter()
    return char and char:FindFirstChild("HumanoidRootPart")
end

local function GetHumanoid()
    local char = GetCharacter()
    return char and char:FindFirstChildOfClass("Humanoid")
end

local function IsAlive()
    local hum = GetHumanoid()
    return hum and hum.Health > 0
end

local function SaveOriginalValues()
    if OriginalValues.Stored then return end
    
    task.spawn(function()
        local success, data = pcall(function()
            return LocalPlayer:WaitForChild("Data", 10)
        end)
        
        if success and data then
            local attributes = data:FindFirstChild("Attributes")
            if attributes then
                local rangeValue = attributes:FindFirstChild("PsychicRange")
                
                if rangeValue then
                    OriginalValues.PsychicRange = rangeValue.Value
                end
            end
            
            OriginalValues.Stored = true
        end
    end)
end

SaveOriginalValues()

LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    SaveOriginalValues()
end)

local FlyModule = {}

function FlyModule:Start()
    local character = GetCharacter()
    if not character then return end
    
    local hrp = GetHRP()
    local humanoid = GetHumanoid()
    if not hrp or not humanoid then return end
    
    self:Stop()
    
    flyBody = Instance.new("BodyVelocity")
    flyBody.Name = "FlyVelocity"
    flyBody.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    flyBody.Velocity = Vector3.new(0, 0, 0)
    flyBody.Parent = hrp
    
    flyGyro = Instance.new("BodyGyro")
    flyGyro.Name = "FlyGyro"
    flyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    flyGyro.P = 9e4
    flyGyro.CFrame = hrp.CFrame
    flyGyro.Parent = hrp
    
    humanoid.PlatformStand = true
    
    Connections.Fly = RunService.RenderStepped:Connect(function()
        if not Settings.Fly.Enabled or not flyBody or not flyBody.Parent then 
            self:Stop()
            return 
        end
        
        local currentHrp = GetHRP()
        if not currentHrp then return end
        
        local direction = Vector3.new(0, 0, 0)
        local speed = Settings.Fly.Speed
        
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            direction = direction + Camera.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            direction = direction - Camera.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            direction = direction - Camera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            direction = direction + Camera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            direction = direction + Vector3.new(0, 1, 0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
            direction = direction - Vector3.new(0, 1, 0)
        end
        
        if direction.Magnitude > 0 then
            flyBody.Velocity = direction.Unit * speed
        else
            flyBody.Velocity = Vector3.new(0, 0, 0)
        end
        
        flyGyro.CFrame = CFrame.new(currentHrp.Position, currentHrp.Position + Camera.CFrame.LookVector)
    end)
end

function FlyModule:Stop()
    if Connections.Fly then
        Connections.Fly:Disconnect()
        Connections.Fly = nil
    end
    
    if flyBody then
        flyBody:Destroy()
        flyBody = nil
    end
    
    if flyGyro then
        flyGyro:Destroy()
        flyGyro = nil
    end
    
    local character = GetCharacter()
    if character then
        local humanoid = GetHumanoid()
        if humanoid then
            humanoid.PlatformStand = false
        end
        
        local hrp = GetHRP()
        if hrp then
            for _, child in ipairs(hrp:GetChildren()) do
                if child.Name == "FlyVelocity" or child.Name == "FlyGyro" then
                    child:Destroy()
                end
            end
        end
    end
end

local NoclipModule = {}

function NoclipModule:Start()
    if Connections.Noclip then return end
    
    Connections.Noclip = RunService.Stepped:Connect(function()
        if not Settings.Noclip.Enabled then return end
        
        local character = GetCharacter()
        if not character then return end
        
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide then
                part.CanCollide = false
            end
        end
    end)
end

function NoclipModule:Stop()
    if Connections.Noclip then
        Connections.Noclip:Disconnect()
        Connections.Noclip = nil
    end
    
    local character = GetCharacter()
    if character then
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
    end
end

local InfRangeModule = {}

function InfRangeModule:Start()
    if Connections.InfRange then
        Connections.InfRange:Disconnect()
    end
    
    task.spawn(function()
        local success, rangeStat = pcall(function()
            local data = LocalPlayer:WaitForChild("Data", 10)
            local attributes = data:WaitForChild("Attributes", 10)
            return attributes:WaitForChild("PsychicRange", 10)
        end)
        
        if success and rangeStat then
            if not OriginalValues.PsychicRange then
                OriginalValues.PsychicRange = rangeStat.Value
            end
            
            rangeStat.Value = 9999
            
            Connections.InfRange = Mouse.Button1Down:Connect(function()
                if not Settings.InfRange.Enabled then return end
                if infRangeDebounce then return end
                
                local target = Mouse.Target
                if not target then return end
                if not (target:IsDescendantOf(Workspace.Objects) or target:IsDescendantOf(Workspace.BrokenObjects)) then return end
                
                local hrp = GetHRP()
                if not hrp then return end
                
                infRangeDebounce = true
                
                task.spawn(function()
                    local originalCFrame = hrp.CFrame
                    local originalCamType = Camera.CameraType
                    local originalSubject = Camera.CameraSubject
                    
                    pcall(function()
                        Camera.CameraType = Enum.CameraType.Scriptable
                        
                        hrp.CFrame = CFrame.new(target.Position + Vector3.new(0, 5, 0))
                        hrp.AssemblyLinearVelocity = Vector3.zero
                        hrp.AssemblyAngularVelocity = Vector3.zero
                        
                        task.wait(0.1)
                        
                        if _G.RemoteEvent then
                            _G.RemoteEvent:FireServer("SelectObject", target)
                        end
                        
                        task.wait(0.15)
                        
                        hrp.CFrame = originalCFrame
                        hrp.AssemblyLinearVelocity = Vector3.zero
                        hrp.AssemblyAngularVelocity = Vector3.zero
                        
                        task.wait(0.05)
                        
                        Camera.CameraType = originalCamType
                        Camera.CameraSubject = originalSubject
                    end)
                    
                    task.wait(0.5)
                    infRangeDebounce = false
                end)
            end)
        end
    end)
end

function InfRangeModule:Stop()
    if Connections.InfRange then
        Connections.InfRange:Disconnect()
        Connections.InfRange = nil
    end
    
    task.spawn(function()
        local success, rangeStat = pcall(function()
            local data = LocalPlayer:WaitForChild("Data", 5)
            local attributes = data:WaitForChild("Attributes", 5)
            return attributes:WaitForChild("PsychicRange", 5)
        end)
        
        if success and rangeStat and OriginalValues.PsychicRange then
            rangeStat.Value = OriginalValues.PsychicRange
        end
    end)
    
    pcall(function()
        Camera.CameraType = Enum.CameraType.Custom
        local humanoid = GetHumanoid()
        if humanoid then
            Camera.CameraSubject = humanoid
        end
    end)
    
    infRangeDebounce = false
end

local TeleportModule = {}

function TeleportModule:CreateTool()
    if TeleportTool and TeleportTool.Parent then
        TeleportTool:Destroy()
    end
    
    local tool = Instance.new("Tool")
    tool.Name = "Teleport Tool"
    tool.RequiresHandle = false
    tool.CanBeDropped = false
    
    tool.Activated:Connect(function()
        local hrp = GetHRP()
        if not hrp then return end
        
        local target = Mouse.Hit
        if target then
            hrp.CFrame = CFrame.new(target.Position + Vector3.new(0, 3, 0))
        end
    end)
    
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    if backpack then
        tool.Parent = backpack
        TeleportTool = tool
        return true
    end
    
    return false
end

function TeleportModule:RemoveTool()
    if TeleportTool and TeleportTool.Parent then
        TeleportTool:Destroy()
        TeleportTool = nil
    end
end

local HitboxModule = {}

function HitboxModule:Expand(player)
    if player == LocalPlayer then return end
    if not Settings.Hitbox.Enabled then return end
    
    local character = player.Character
    if not character then return end
    
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid or humanoid.Health <= 0 then return end
    
    local hrp = character:FindFirstChild("HumanoidRootPart")
    local head = character:FindFirstChild("Head")
    local size = Settings.Hitbox.Size
    
    if hrp then
        pcall(function()
            hrp.Size = Vector3.new(size, size, size)
            hrp.Transparency = 0.7
            hrp.CanCollide = false
            hrp.Material = Enum.Material.ForceField
            hrp.BrickColor = BrickColor.new("Really red")
        end)
    end
    
    if head then
        pcall(function()
            head.Size = Vector3.new(size, size, size)
            head.Transparency = 0.7
            head.CanCollide = false
            head.Material = Enum.Material.ForceField
            head.BrickColor = BrickColor.new("Really red")
        end)
    end
end

function HitboxModule:Reset(player)
    if not player then return end
    
    local character = player.Character
    if not character then return end
    
    local hrp = character:FindFirstChild("HumanoidRootPart")
    local head = character:FindFirstChild("Head")
    
    if hrp then
        pcall(function()
            hrp.Size = Vector3.new(2, 2, 1)
            hrp.Transparency = 1
            hrp.CanCollide = false
            hrp.Material = Enum.Material.Plastic
        end)
    end
    
    if head then
        pcall(function()
            head.Size = Vector3.new(2, 1, 1)
            head.Transparency = 0
            head.CanCollide = false
            head.Material = Enum.Material.Plastic
        end)
    end
end

function HitboxModule:Start()
    if Connections.Hitbox then return end
    
    Connections.Hitbox = RunService.Heartbeat:Connect(function()
        if not Settings.Hitbox.Enabled then return end
        
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                self:Expand(player)
            end
        end
    end)
end

function HitboxModule:Stop()
    if Connections.Hitbox then
        Connections.Hitbox:Disconnect()
        Connections.Hitbox = nil
    end
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            self:Reset(player)
        end
    end
end

local EnergyOrbModule = {}

function EnergyOrbModule:ScanOrbs()
    local currentTime = tick()
    
    if currentTime - LastOrbScan < 1 then
        return CachedOrbs
    end
    
    LastOrbScan = currentTime
    CachedOrbs = {}
    
    for _, child in ipairs(Workspace:GetChildren()) do
        if child.Name == "EnergyOrb" then
            table.insert(CachedOrbs, child)
        elseif child:IsA("Folder") or child:IsA("Model") then
            for _, subChild in ipairs(child:GetChildren()) do
                if subChild.Name == "EnergyOrb" then
                    table.insert(CachedOrbs, subChild)
                end
            end
        end
    end
    
    return CachedOrbs
end

function EnergyOrbModule:TeleportOrbs()
    local hrp = GetHRP()
    if not hrp then return 0 end
    
    local orbs = self:ScanOrbs()
    local count = 0
    local targetPosition = hrp.CFrame
    
    for i = 1, #orbs do
        local orb = orbs[i]
        
        if orb and orb.Parent then
            pcall(function()
                if orb:IsA("BasePart") then
                    orb.CFrame = targetPosition
                    count = count + 1
                elseif orb:IsA("Model") then
                    local primary = orb.PrimaryPart
                    if primary then
                        orb:SetPrimaryPartCFrame(targetPosition)
                        count = count + 1
                    else
                        local part = orb:FindFirstChildWhichIsA("BasePart")
                        if part then
                            part.CFrame = targetPosition
                            count = count + 1
                        end
                    end
                end
            end)
        end
    end
    
    return count
end

function EnergyOrbModule:StartAutoCollect()
    if Connections.AutoCollect then return end
    
    Connections.AutoCollect = task.spawn(function()
        while Settings.EnergyOrb.AutoCollect do
            if IsAlive() then
                self:TeleportOrbs()
            end
            task.wait(2)
        end
    end)
end

function EnergyOrbModule:StopAutoCollect()
    Settings.EnergyOrb.AutoCollect = false
    Connections.AutoCollect = nil
    CachedOrbs = {}
end

local ESPModule = {}

function ESPModule:CreateESP(player)
    if player == LocalPlayer then return end
    
    local character = player.Character
    if not character then return end
    
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local head = character:FindFirstChild("Head")
    if not humanoid or not head then return end
    
    self:RemoveESP(player)
    
    local highlight = Instance.new("Highlight")
    highlight.Name = "XattixESP"
    highlight.FillColor = Color3.fromRGB(255, 0, 0)
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0
    highlight.Parent = character
    
    if Settings.ESP.ShowName or Settings.ESP.ShowHealth then
        local billboard = Instance.new("BillboardGui")
        billboard.Name = "XattixESPGui"
        billboard.Size = UDim2.new(0, 100, 0, 50)
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.AlwaysOnTop = true
        billboard.Parent = head
        
        local container = Instance.new("Frame")
        container.Size = UDim2.new(1, 0, 1, 0)
        container.BackgroundTransparency = 1
        container.Parent = billboard
        
        local layout = Instance.new("UIListLayout")
        layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        layout.VerticalAlignment = Enum.VerticalAlignment.Center
        layout.Parent = container
        
        if Settings.ESP.ShowName then
            local nameLabel = Instance.new("TextLabel")
            nameLabel.Name = "NameLabel"
            nameLabel.Size = UDim2.new(1, 0, 0, 20)
            nameLabel.BackgroundTransparency = 1
            nameLabel.Text = player.Name
            nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            nameLabel.TextStrokeTransparency = 0
            nameLabel.TextSize = 14
            nameLabel.Font = Enum.Font.GothamBold
            nameLabel.Parent = container
        end
        
        if Settings.ESP.ShowHealth then
            local healthLabel = Instance.new("TextLabel")
            healthLabel.Name = "HealthLabel"
            healthLabel.Size = UDim2.new(1, 0, 0, 16)
            healthLabel.BackgroundTransparency = 1
            healthLabel.Text = math.floor(humanoid.Health) .. " HP"
            healthLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
            healthLabel.TextStrokeTransparency = 0
            healthLabel.TextSize = 12
            healthLabel.Font = Enum.Font.Gotham
            healthLabel.Parent = container
            
            local healthConnection
            healthConnection = humanoid.HealthChanged:Connect(function(health)
                if not healthLabel or not healthLabel.Parent then
                    if healthConnection then
                        healthConnection:Disconnect()
                    end
                    return
                end
                
                healthLabel.Text = math.floor(health) .. " HP"
                
                local percent = health / humanoid.MaxHealth
                if percent > 0.5 then
                    healthLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
                elseif percent > 0.25 then
                    healthLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
                else
                    healthLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
                end
            end)
        end
    end
end

function ESPModule:RemoveESP(player)
    if player == LocalPlayer then return end
    
    local character = player.Character
    if not character then return end
    
    local highlight = character:FindFirstChild("XattixESP")
    if highlight then
        highlight:Destroy()
    end
    
    local head = character:FindFirstChild("Head")
    if head then
        local billboard = head:FindFirstChild("XattixESPGui")
        if billboard then
            billboard:Destroy()
        end
    end
end

function ESPModule:Start()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            self:CreateESP(player)
        end
    end
    
    Connections.ESPCharacter = {}
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local conn = player.CharacterAdded:Connect(function()
                task.wait(1)
                if Settings.ESP.Enabled then
                    self:CreateESP(player)
                end
            end)
            table.insert(Connections.ESPCharacter, conn)
        end
    end
    
    Connections.ESPPlayerAdded = Players.PlayerAdded:Connect(function(player)
        local conn = player.CharacterAdded:Connect(function()
            task.wait(1)
            if Settings.ESP.Enabled then
                self:CreateESP(player)
            end
        end)
        table.insert(Connections.ESPCharacter, conn)
        
        if player.Character then
            task.wait(1)
            if Settings.ESP.Enabled then
                self:CreateESP(player)
            end
        end
    end)
    
    Connections.ESPPlayerRemoving = Players.PlayerRemoving:Connect(function(player)
        self:RemoveESP(player)
    end)
end

function ESPModule:Stop()
    if Connections.ESPPlayerAdded then
        Connections.ESPPlayerAdded:Disconnect()
        Connections.ESPPlayerAdded = nil
    end
    
    if Connections.ESPPlayerRemoving then
        Connections.ESPPlayerRemoving:Disconnect()
        Connections.ESPPlayerRemoving = nil
    end
    
    if Connections.ESPCharacter then
        for _, conn in ipairs(Connections.ESPCharacter) do
            pcall(function() conn:Disconnect() end)
        end
        Connections.ESPCharacter = nil
    end
    
    for _, player in ipairs(Players:GetPlayers()) do
        self:RemoveESP(player)
    end
end

function ESPModule:Refresh()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            self:RemoveESP(player)
            if Settings.ESP.Enabled then
                self:CreateESP(player)
            end
        end
    end
end

local Window = Rayfield:CreateWindow({
    Name = "Xattix Hub - Psychic Playground",
    LoadingTitle = "Xattix Hub - Psychic Playground",
    LoadingSubtitle = "Loading...",
    ConfigurationSaving = {Enabled = false},
    Discord = {Enabled = false},
    KeySystem = false
})

local MainTab = Window:CreateTab("Main", 4483362458)

MainTab:CreateSection("Movement")

Flags.FlyToggle = MainTab:CreateToggle({
    Name = "Fly",
    CurrentValue = false,
    Flag = "FlyToggle",
    Callback = function(Value)
        Settings.Fly.Enabled = Value
        if Value then 
            FlyModule:Start()
        else 
            FlyModule:Stop()
        end
        Rayfield:Notify({
            Title = "Fly", 
            Content = Value and "Enabled" or "Disabled", 
            Duration = 2, 
            Image = 4483362458
        })
    end
})

MainTab:CreateSlider({
    Name = "Fly Speed",
    Range = {10, 200},
    Increment = 5,
    Suffix = "",
    CurrentValue = 50,
    Flag = "FlySpeed",
    Callback = function(Value) Settings.Fly.Speed = Value end
})

Flags.NoclipToggle = MainTab:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Flag = "NoclipToggle",
    Callback = function(Value)
        Settings.Noclip.Enabled = Value
        if Value then 
            NoclipModule:Start()
        else 
            NoclipModule:Stop()
        end
        Rayfield:Notify({
            Title = "Noclip", 
            Content = Value and "Enabled" or "Disabled", 
            Duration = 2, 
            Image = 4483362458
        })
    end
})

MainTab:CreateSection("Objects")

Flags.InfRangeToggle = MainTab:CreateToggle({
    Name = "Infinite Range",
    CurrentValue = false,
    Flag = "InfRangeToggle",
    Callback = function(Value)
        Settings.InfRange.Enabled = Value
        if Value then 
            InfRangeModule:Start()
        else 
            InfRangeModule:Stop()
        end
        Rayfield:Notify({
            Title = "Infinite Range", 
            Content = Value and "Enabled" or "Disabled", 
            Duration = 2, 
            Image = 4483362458
        })
    end
})

MainTab:CreateSection("Player")

MainTab:CreateButton({
    Name = "Give Teleport Tool",
    Callback = function()
        local success = TeleportModule:CreateTool()
        Rayfield:Notify({
            Title = "Teleport Tool", 
            Content = success and "Added to backpack" or "Failed", 
            Duration = 2, 
            Image = 4483362458
        })
    end
})

MainTab:CreateSection("Energy Orbs")

Flags.AutoCollect = MainTab:CreateToggle({
    Name = "Auto Collect Orbs",
    CurrentValue = false,
    Flag = "AutoCollect",
    Callback = function(Value)
        Settings.EnergyOrb.AutoCollect = Value
        if Value then 
            EnergyOrbModule:StartAutoCollect()
        else 
            EnergyOrbModule:StopAutoCollect()
        end
        Rayfield:Notify({
            Title = "Auto Collect", 
            Content = Value and "Enabled" or "Disabled", 
            Duration = 2, 
            Image = 4483362458
        })
    end
})

MainTab:CreateButton({
    Name = "Collect All Orbs",
    Callback = function()
        local count = EnergyOrbModule:TeleportOrbs()
        Rayfield:Notify({
            Title = "Orbs Collected", 
            Content = count .. " orbs", 
            Duration = 2, 
            Image = 4483362458
        })
    end
})

local ESPTab = Window:CreateTab("ESP", 4483362458)

ESPTab:CreateSection("Player ESP")

Flags.ESPToggle = ESPTab:CreateToggle({
    Name = "Enable ESP",
    CurrentValue = false,
    Flag = "ESPToggle",
    Callback = function(Value)
        Settings.ESP.Enabled = Value
        if Value then 
            ESPModule:Start()
        else 
            ESPModule:Stop()
        end
        Rayfield:Notify({
            Title = "ESP", 
            Content = Value and "Enabled" or "Disabled", 
            Duration = 2, 
            Image = 4483362458
        })
    end
})

ESPTab:CreateToggle({
    Name = "Show Names",
    CurrentValue = true,
    Flag = "ESPNames",
    Callback = function(Value)
        Settings.ESP.ShowName = Value
        ESPModule:Refresh()
    end
})

ESPTab:CreateToggle({
    Name = "Show Health",
    CurrentValue = true,
    Flag = "ESPHealth",
    Callback = function(Value)
        Settings.ESP.ShowHealth = Value
        ESPModule:Refresh()
    end
})

local HitboxTab = Window:CreateTab("Hitbox", 4483362458)

HitboxTab:CreateSection("Hitbox Expander")

Flags.HitboxToggle = HitboxTab:CreateToggle({
    Name = "Enable Hitbox",
    CurrentValue = false,
    Flag = "HitboxToggle",
    Callback = function(Value)
        Settings.Hitbox.Enabled = Value
        if Value then 
            HitboxModule:Start()
        else 
            HitboxModule:Stop()
        end
        Rayfield:Notify({
            Title = "Hitbox", 
            Content = Value and "Enabled" or "Disabled", 
            Duration = 2, 
            Image = 4483362458
        })
    end
})

HitboxTab:CreateSlider({
    Name = "Hitbox Size",
    Range = {5, 30},
    Increment = 1,
    Suffix = "",
    CurrentValue = 15,
    Flag = "HitboxSize",
    Callback = function(Value) Settings.Hitbox.Size = Value end
})

local SettingsTab = Window:CreateTab("Settings", 4483345998)

SettingsTab:CreateSection("Controls")

SettingsTab:CreateButton({
    Name = "Disable All",
    Callback = function()
        Settings.Hitbox.Enabled = false
        Settings.Fly.Enabled = false
        Settings.Noclip.Enabled = false
        Settings.EnergyOrb.AutoCollect = false
        Settings.ESP.Enabled = false
        Settings.InfRange.Enabled = false
        
        HitboxModule:Stop()
        FlyModule:Stop()
        NoclipModule:Stop()
        EnergyOrbModule:StopAutoCollect()
        ESPModule:Stop()
        InfRangeModule:Stop()
        TeleportModule:RemoveTool()
        
        if Flags.FlyToggle then Flags.FlyToggle:Set(false) end
        if Flags.NoclipToggle then Flags.NoclipToggle:Set(false) end
        if Flags.InfRangeToggle then Flags.InfRangeToggle:Set(false) end
        if Flags.AutoCollect then Flags.AutoCollect:Set(false) end
        if Flags.ESPToggle then Flags.ESPToggle:Set(false) end
        if Flags.HitboxToggle then Flags.HitboxToggle:Set(false) end
        
        Rayfield:Notify({
            Title = "Settings", 
            Content = "All features disabled", 
            Duration = 2, 
            Image = 4483345998
        })
    end
})

SettingsTab:CreateButton({
    Name = "Destroy GUI",
    Callback = function()
        Settings.Hitbox.Enabled = false
        Settings.Fly.Enabled = false
        Settings.Noclip.Enabled = false
        Settings.EnergyOrb.AutoCollect = false
        Settings.ESP.Enabled = false
        Settings.InfRange.Enabled = false
        
        HitboxModule:Stop()
        FlyModule:Stop()
        NoclipModule:Stop()
        EnergyOrbModule:StopAutoCollect()
        ESPModule:Stop()
        InfRangeModule:Stop()
        TeleportModule:RemoveTool()
        
        for key, conn in pairs(Connections) do
            if typeof(conn) == "RBXScriptConnection" then
                pcall(function() conn:Disconnect() end)
            elseif typeof(conn) == "table" then
                for _, c in ipairs(conn) do
                    pcall(function() c:Disconnect() end)
                end
            end
        end
        
        Rayfield:Destroy()
    end
})

SettingsTab:CreateSection("Info")

SettingsTab:CreateParagraph({
    Title = "Keybinds",
    Content = "F = Fly\nN = Noclip\nG = Collect Orbs\nR = Infinite Range"
})

Players.PlayerRemoving:Connect(function(player)
    HitboxModule:Reset(player)
    ESPModule:RemoveESP(player)
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    local keyCode = input.KeyCode
    local now = tick()
    
    if lastKeyPress[keyCode] and now - lastKeyPress[keyCode] < 0.5 then
        return
    end
    
    lastKeyPress[keyCode] = now
    
    if keyCode == Enum.KeyCode.F then
        Settings.Fly.Enabled = not Settings.Fly.Enabled
        if Settings.Fly.Enabled then 
            FlyModule:Start()
        else 
            FlyModule:Stop()
        end
        if Flags.FlyToggle then 
            Flags.FlyToggle:Set(Settings.Fly.Enabled)
        end
        
    elseif keyCode == Enum.KeyCode.N then
        Settings.Noclip.Enabled = not Settings.Noclip.Enabled
        if Flags.NoclipToggle then 
            Flags.NoclipToggle:Set(Settings.Noclip.Enabled)
        end
        
    elseif keyCode == Enum.KeyCode.G then
        local count = EnergyOrbModule:TeleportOrbs()
        Rayfield:Notify({
            Title = "Orbs", 
            Content = count .. " orbs collected", 
            Duration = 2, 
            Image = 4483362458
        })
        
    elseif keyCode == Enum.KeyCode.R then
        Settings.InfRange.Enabled = not Settings.InfRange.Enabled
        if Flags.InfRangeToggle then 
            Flags.InfRangeToggle:Set(Settings.InfRange.Enabled)
        end
    end
end)

if setclipboard then
    setclipboard("https://discord.com/invite/Usd4SWCdWe")
end

Rayfield:Notify({
    Title = "Xattix Hub - Psychic Playground", 
    Content = "Loaded successfully! Dont forget to join our community server!", 
    Duration = 5, 
    Image = 4483362458
})