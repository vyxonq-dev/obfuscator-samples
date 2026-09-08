local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local Settings = {
    Noclip = {
        Enabled = false
    },
    AntiRagdoll = {
        Enabled = false
    },
    Hitbox = {
        Enabled = false,
        Size = 15
    },
    StaffDetector = {
        Enabled = true,
        Mode = "NotifyThenKick",
        KickDelay = 3
    },
    ESP = {
        Enabled = false,
        ShowName = true,
        ShowHealth = true,
        ShowBox = true,
        FillColor = Color3.fromRGB(255, 0, 0),
        OutlineColor = Color3.fromRGB(255, 255, 255),
        FillTransparency = 0.7,
        Tracers = {
            Enabled = false,
            Color = Color3.fromRGB(255, 0, 0),
            Thickness = 1,
            Origin = "Bottom"
        },
        Distance = {
            Enabled = false,
            Color = Color3.fromRGB(255, 255, 0)
        },
        Chams = {
            Enabled = false,
            FillColor = Color3.fromRGB(255, 0, 255),
            OutlineColor = Color3.fromRGB(255, 255, 255),
            FillTransparency = 0.5,
            OutlineTransparency = 0
        }
    }
}

local Connections = {}
local PlayerData = {}

local function GetCharacter(player)
    return player and player.Character
end

local function GetHRP(player)
    local char = GetCharacter(player)
    return char and char:FindFirstChild("HumanoidRootPart")
end

local function GetHumanoid(player)
    local char = GetCharacter(player)
    return char and char:FindFirstChildOfClass("Humanoid")
end

local function GetHead(player)
    local char = GetCharacter(player)
    return char and char:FindFirstChild("Head")
end

local function IsAlive(player)
    local hum = GetHumanoid(player)
    return hum and hum.Health > 0
end

local function WorldToScreen(position)
    local screenPos, onScreen = Camera:WorldToScreenPoint(position)
    return Vector2.new(screenPos.X, screenPos.Y), onScreen, screenPos.Z
end

local NoclipModule = {}

function NoclipModule:Start()
    if Connections.Noclip then return end
    
    Connections.Noclip = RunService.Stepped:Connect(function()
        if not Settings.Noclip.Enabled then return end
        
        local character = GetCharacter(LocalPlayer)
        if not character then return end
        
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
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
    
    local character = GetCharacter(LocalPlayer)
    if character then
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                if part.Name == "HumanoidRootPart" or 
                   part.Name == "Head" or 
                   part.Name == "Torso" or 
                   part.Name == "UpperTorso" or 
                   part.Name == "LowerTorso" then
                    part.CanCollide = true
                end
            end
        end
    end
end

local AntiRagdollModule = {}

function AntiRagdollModule:DisableRagdollStates(humanoid)
    if not humanoid then return end
    
    pcall(function()
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
    end)
end

function AntiRagdollModule:EnableRagdollStates(humanoid)
    if not humanoid then return end
    
    pcall(function()
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
    end)
end

function AntiRagdollModule:RemoveRagdollConstraints()
    local character = GetCharacter(LocalPlayer)
    if not character then return end
    
    for _, obj in ipairs(character:GetDescendants()) do
        if obj:IsA("BallSocketConstraint") or 
           obj:IsA("HingeConstraint") or 
           obj.Name:lower():find("ragdoll") or
           obj.Name:lower():find("socket") then
            pcall(function()
                obj.Enabled = false
            end)
        end
        
        if obj:IsA("Motor6D") then
            pcall(function()
                obj.Enabled = true
            end)
        end
    end
end

function AntiRagdollModule:Start()
    if Connections.AntiRagdoll then return end
    if Connections.AntiRagdollState then return end
    
    local humanoid = GetHumanoid(LocalPlayer)
    if humanoid then
        self:DisableRagdollStates(humanoid)
    end
    
    Connections.AntiRagdoll = RunService.Heartbeat:Connect(function()
        if not Settings.AntiRagdoll.Enabled then return end
        
        local humanoid = GetHumanoid(LocalPlayer)
        local hrp = GetHRP(LocalPlayer)
        
        if humanoid and hrp then
            local state = humanoid:GetState()
            
            if state == Enum.HumanoidStateType.Ragdoll or 
               state == Enum.HumanoidStateType.FallingDown or 
               state == Enum.HumanoidStateType.Physics then
                
                pcall(function()
                    humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                end)
                
                pcall(function()
                    hrp.Velocity = Vector3.new(0, 0, 0)
                    hrp.RotVelocity = Vector3.new(0, 0, 0)
                    hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                    hrp.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                end)
                
                self:RemoveRagdollConstraints()
            end
            
            self:DisableRagdollStates(humanoid)
        end
    end)
    
    Connections.AntiRagdollState = nil
    local humanoid = GetHumanoid(LocalPlayer)
    if humanoid then
        Connections.AntiRagdollState = humanoid.StateChanged:Connect(function(oldState, newState)
            if not Settings.AntiRagdoll.Enabled then return end
            
            if newState == Enum.HumanoidStateType.Ragdoll or 
               newState == Enum.HumanoidStateType.FallingDown or 
               newState == Enum.HumanoidStateType.Physics then
                
                local hrp = GetHRP(LocalPlayer)
                
                for i = 1, 5 do
                    pcall(function()
                        humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                    end)
                    
                    if hrp then
                        pcall(function()
                            hrp.Velocity = Vector3.new(0, 0, 0)
                            hrp.RotVelocity = Vector3.new(0, 0, 0)
                            hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                            hrp.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                        end)
                    end
                    
                    task.wait()
                end
                
                self:RemoveRagdollConstraints()
            end
        end)
    end
    
    Connections.AntiRagdollCharacter = LocalPlayer.CharacterAdded:Connect(function(char)
        task.wait(0.5)
        
        if not Settings.AntiRagdoll.Enabled then return end
        
        local humanoid = char:WaitForChild("Humanoid", 10)
        if humanoid then
            self:DisableRagdollStates(humanoid)
            
            if Connections.AntiRagdollState then
                Connections.AntiRagdollState:Disconnect()
            end
            
            Connections.AntiRagdollState = humanoid.StateChanged:Connect(function(oldState, newState)
                if not Settings.AntiRagdoll.Enabled then return end
                
                if newState == Enum.HumanoidStateType.Ragdoll or 
                   newState == Enum.HumanoidStateType.FallingDown or 
                   newState == Enum.HumanoidStateType.Physics then
                    
                    local hrp = char:FindFirstChild("HumanoidRootPart")
                    
                    for i = 1, 5 do
                        pcall(function()
                            humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                        end)
                        
                        if hrp then
                            pcall(function()
                                hrp.Velocity = Vector3.new(0, 0, 0)
                                hrp.RotVelocity = Vector3.new(0, 0, 0)
                                hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                                hrp.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                            end)
                        end
                        
                        task.wait()
                    end
                    
                    self:RemoveRagdollConstraints()
                end
            end)
        end
    end)
end

function AntiRagdollModule:Stop()
    if Connections.AntiRagdoll then
        Connections.AntiRagdoll:Disconnect()
        Connections.AntiRagdoll = nil
    end
    
    if Connections.AntiRagdollState then
        Connections.AntiRagdollState:Disconnect()
        Connections.AntiRagdollState = nil
    end
    
    if Connections.AntiRagdollCharacter then
        Connections.AntiRagdollCharacter:Disconnect()
        Connections.AntiRagdollCharacter = nil
    end
    
    local humanoid = GetHumanoid(LocalPlayer)
    if humanoid then
        self:EnableRagdollStates(humanoid)
    end
end

local HitboxModule = {}

function HitboxModule:Expand(player)
    if player == LocalPlayer then return end
    if not Settings.Hitbox.Enabled then return end
    if not IsAlive(player) then return end
    
    local hrp = GetHRP(player)
    local head = GetHead(player)
    local size = Settings.Hitbox.Size
    
    if hrp then
        pcall(function()
            hrp.Size = Vector3.new(size, size, size)
            hrp.Transparency = 0.7
            hrp.CanCollide = false
        end)
    end
    
    if head then
        pcall(function()
            head.Size = Vector3.new(size, size, size)
            head.Transparency = 0.7
            head.CanCollide = false
        end)
    end
end

function HitboxModule:Reset(player)
    if not player then return end
    
    local character = GetCharacter(player)
    if not character then return end
    
    local hrp = character:FindFirstChild("HumanoidRootPart")
    local head = character:FindFirstChild("Head")
    
    if hrp then
        pcall(function()
            hrp.Size = Vector3.new(2, 2, 1)
            hrp.Transparency = 1
        end)
    end
    
    if head then
        pcall(function()
            head.Size = Vector3.new(1, 1, 1)
            head.Transparency = 0
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

local ESPModule = {}

function ESPModule:GetPlayerData(player)
    if not PlayerData[player] then
        PlayerData[player] = {
            Tracer = nil,
            Distance = nil
        }
    end
    return PlayerData[player]
end

function ESPModule:CreateTracer(player)
    if player == LocalPlayer then return end
    
    local data = self:GetPlayerData(player)
    
    if data.Tracer then
        pcall(function() data.Tracer:Remove() end)
        data.Tracer = nil
    end
    
    local success, tracer = pcall(function()
        local tr = Drawing.new("Line")
        tr.Visible = false
        tr.Color = Settings.ESP.Tracers.Color
        tr.Thickness = Settings.ESP.Tracers.Thickness
        tr.Transparency = 1
        return tr
    end)
    
    if success and tracer then
        data.Tracer = tracer
    end
end

function ESPModule:CreateDistance(player)
    if player == LocalPlayer then return end
    
    local data = self:GetPlayerData(player)
    
    if data.Distance then
        pcall(function() data.Distance:Remove() end)
        data.Distance = nil
    end
    
    local success, text = pcall(function()
        local tx = Drawing.new("Text")
        tx.Visible = false
        tx.Color = Settings.ESP.Distance.Color
        tx.Size = 14
        tx.Center = true
        tx.Outline = true
        tx.OutlineColor = Color3.new(0, 0, 0)
        return tx
    end)
    
    if success and text then
        data.Distance = text
    end
end

function ESPModule:ClearESP(player)
    local character = GetCharacter(player)
    if character then
        for _, child in ipairs(character:GetDescendants()) do
            if child.Name:find("Xattix") then
                pcall(function() child:Destroy() end)
            end
        end
    end
    
    local data = PlayerData[player]
    if data then
        if data.Tracer then
            pcall(function() data.Tracer:Remove() end)
            data.Tracer = nil
        end
        if data.Distance then
            pcall(function() data.Distance:Remove() end)
            data.Distance = nil
        end
    end
end

function ESPModule:CreateHighlight(player)
    if player == LocalPlayer then return end
    if not Settings.ESP.Enabled then return end
    
    local character = GetCharacter(player)
    if not character then return end
    
    local head = character:FindFirstChild("Head")
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not head or not humanoid then return end
    
    self:ClearESP(player)
    
    if Settings.ESP.ShowBox then
        local highlight = Instance.new("Highlight")
        highlight.Name = "XattixESP"
        highlight.FillColor = Settings.ESP.FillColor
        highlight.OutlineColor = Settings.ESP.OutlineColor
        highlight.FillTransparency = Settings.ESP.FillTransparency
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlight.Parent = character
    end
    
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "XattixESPGui"
    billboard.Size = UDim2.new(0, 150, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 2.5, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = head
    
    local container = Instance.new("Frame")
    container.Size = UDim2.new(1, 0, 1, 0)
    container.BackgroundTransparency = 1
    container.Parent = billboard
    
    local layout = Instance.new("UIListLayout")
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    layout.Parent = container
    
    if Settings.ESP.ShowName then
        local nameLabel = Instance.new("TextLabel")
        nameLabel.Name = "NameLabel"
        nameLabel.Size = UDim2.new(1, 0, 0, 16)
        nameLabel.BackgroundTransparency = 1
        nameLabel.Text = player.Name
        nameLabel.TextColor3 = Settings.ESP.OutlineColor
        nameLabel.TextStrokeTransparency = 0
        nameLabel.TextSize = 14
        nameLabel.Font = Enum.Font.GothamBold
        nameLabel.Parent = container
    end
    
    if Settings.ESP.ShowHealth then
        local healthLabel = Instance.new("TextLabel")
        healthLabel.Name = "HealthLabel"
        healthLabel.Size = UDim2.new(1, 0, 0, 14)
        healthLabel.BackgroundTransparency = 1
        healthLabel.Text = "HP: " .. math.floor(humanoid.Health)
        healthLabel.TextColor3 = Color3.new(0, 1, 0)
        healthLabel.TextStrokeTransparency = 0
        healthLabel.TextSize = 12
        healthLabel.Font = Enum.Font.Gotham
        healthLabel.Parent = container
        
        humanoid.HealthChanged:Connect(function(hp)
            if healthLabel and healthLabel.Parent then
                healthLabel.Text = "HP: " .. math.floor(hp)
            end
        end)
    end
end

function ESPModule:CreateChams(player)
    if player == LocalPlayer then return end
    
    local character = GetCharacter(player)
    if not character then return end
    
    local existing = character:FindFirstChild("XattixChams")
    if existing then existing:Destroy() end
    
    if Settings.ESP.Chams.Enabled then
        local highlight = Instance.new("Highlight")
        highlight.Name = "XattixChams"
        highlight.FillColor = Settings.ESP.Chams.FillColor
        highlight.OutlineColor = Settings.ESP.Chams.OutlineColor
        highlight.FillTransparency = Settings.ESP.Chams.FillTransparency
        highlight.OutlineTransparency = Settings.ESP.Chams.OutlineTransparency
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlight.Parent = character
    end
end

function ESPModule:UpdateDrawings()
    local myHRP = GetHRP(LocalPlayer)
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local data = PlayerData[player]
            if data then
                local hrp = GetHRP(player)
                local isAlive = IsAlive(player)
                
                if hrp and isAlive then
                    local screenPos, onScreen, depth = WorldToScreen(hrp.Position)
                    
                    if data.Tracer then
                        pcall(function()
                            if Settings.ESP.Tracers.Enabled and onScreen and depth > 0 then
                                local originY
                                if Settings.ESP.Tracers.Origin == "Bottom" then
                                    originY = Camera.ViewportSize.Y
                                elseif Settings.ESP.Tracers.Origin == "Top" then
                                    originY = 0
                                else
                                    originY = Camera.ViewportSize.Y / 2
                                end
                                
                                data.Tracer.From = Vector2.new(Camera.ViewportSize.X / 2, originY)
                                data.Tracer.To = screenPos
                                data.Tracer.Color = Settings.ESP.Tracers.Color
                                data.Tracer.Thickness = Settings.ESP.Tracers.Thickness
                                data.Tracer.Visible = true
                            else
                                data.Tracer.Visible = false
                            end
                        end)
                    end
                    
                    if data.Distance then
                        pcall(function()
                            if Settings.ESP.Distance.Enabled and onScreen and depth > 0 and myHRP then
                                local dist = math.floor((myHRP.Position - hrp.Position).Magnitude)
                                data.Distance.Position = Vector2.new(screenPos.X, screenPos.Y + 30)
                                data.Distance.Text = dist .. "m"
                                data.Distance.Color = Settings.ESP.Distance.Color
                                data.Distance.Visible = true
                            else
                                data.Distance.Visible = false
                            end
                        end)
                    end
                else
                    if data.Tracer then
                        pcall(function() data.Tracer.Visible = false end)
                    end
                    if data.Distance then
                        pcall(function() data.Distance.Visible = false end)
                    end
                end
            end
        end
    end
end

function ESPModule:SetupPlayer(player)
    if player == LocalPlayer then return end
    
    self:CreateTracer(player)
    self:CreateDistance(player)
    
    if Settings.ESP.Enabled then
        self:CreateHighlight(player)
    end
    
    if Settings.ESP.Chams.Enabled then
        self:CreateChams(player)
    end
    
    player.CharacterAdded:Connect(function()
        task.wait(0.5)
        
        self:CreateTracer(player)
        self:CreateDistance(player)
        
        if Settings.ESP.Enabled then
            self:CreateHighlight(player)
        end
        
        if Settings.ESP.Chams.Enabled then
            self:CreateChams(player)
        end
    end)
end

function ESPModule:RefreshAll()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            self:ClearESP(player)
            if Settings.ESP.Enabled then
                self:CreateHighlight(player)
            end
        end
    end
end

function ESPModule:RefreshChams()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            self:CreateChams(player)
        end
    end
end

function ESPModule:Start()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            self:SetupPlayer(player)
        end
    end
    
    Connections.ESPPlayerAdded = Players.PlayerAdded:Connect(function(player)
        task.wait(1)
        self:SetupPlayer(player)
    end)
    
    Connections.ESPUpdate = RunService.Heartbeat:Connect(function()
        if Settings.ESP.Tracers.Enabled or Settings.ESP.Distance.Enabled then
            self:UpdateDrawings()
        end
    end)
end

function ESPModule:Stop()
    if Connections.ESPPlayerAdded then
        Connections.ESPPlayerAdded:Disconnect()
        Connections.ESPPlayerAdded = nil
    end
    
    if Connections.ESPUpdate then
        Connections.ESPUpdate:Disconnect()
        Connections.ESPUpdate = nil
    end
    
    for _, player in ipairs(Players:GetPlayers()) do
        self:ClearESP(player)
    end
end

local StaffDetector = {
    StaffGroupId = 12532032,
    MinStaffRank = 4,
    StaffRanks = {
        [4] = true,
        [5] = true,
        [255] = true
    },
    RankNames = {
        [1] = "Crawler",
        [2] = "Paint Drinker",
        [3] = "Wayfaring Stranger",
        [4] = "Composer",
        [5] = "Sword Master",
        [255] = "Master Ninja"
    },
    DetectedStaff = {}
}

function StaffDetector:GetRankName(rank)
    if self.RankNames[rank] then
        return self.RankNames[rank]
    end
    
    if rank >= 255 then
        return "Master Ninja"
    elseif rank >= 5 then
        return "Sword Master"
    elseif rank >= 4 then
        return "Composer"
    else
        return "Unknown"
    end
end

function StaffDetector:IsStaff(player)
    if player == LocalPlayer then return false, nil end
    
    if self.DetectedStaff[player.UserId] then
        return true, "Previously detected"
    end
    
    local success, rank = pcall(function()
        return player:GetRankInGroup(self.StaffGroupId)
    end)
    
    if success and rank then
        if self.StaffRanks[rank] or rank >= self.MinStaffRank then
            return true, self:GetRankName(rank)
        end
    end
    
    local success2, isRobloxAdmin = pcall(function()
        return player:IsInGroup(1200769)
    end)
    
    if success2 and isRobloxAdmin then
        return true, "Roblox Staff"
    end
    
    return false, nil
end

function StaffDetector:DisableAllFeatures()
    Settings.Hitbox.Enabled = false
    Settings.ESP.Enabled = false
    Settings.ESP.Chams.Enabled = false
    Settings.ESP.Tracers.Enabled = false
    Settings.ESP.Distance.Enabled = false
    Settings.Noclip.Enabled = false
    
    HitboxModule:Stop()
    ESPModule:Stop()
    NoclipModule:Stop()
end

function StaffDetector:OnStaffDetected(player, rankName)
    self.DetectedStaff[player.UserId] = true
    
    Rayfield:Notify({
        Title = "⚠️ STAFF JOINED!",
        Content = player.Name .. " (" .. rankName .. ")",
        Duration = 8,
        Image = 4483362458
    })
    
    task.wait(0.3)
    
    local mode = Settings.StaffDetector.Mode
    
    if mode == "NotifyOnly" then
        Rayfield:Notify({
            Title = "⚠️ Be Careful!",
            Content = rankName .. " is in the server",
            Duration = 10,
            Image = 4483362458
        })
    elseif mode == "ImmediateKick" then
        self:DisableAllFeatures()
        Rayfield:Notify({
            Title = "Leaving Server",
            Content = "Staff detected - Leaving",
            Duration = 2,
            Image = 4483362458
        })
        task.wait(0.5)
        LocalPlayer:Kick("Staff detected: " .. player.Name .. " (" .. rankName .. ")")
    elseif mode == "NotifyThenKick" then
        self:DisableAllFeatures()
        local delay = Settings.StaffDetector.KickDelay
        Rayfield:Notify({
            Title = "Auto-Kick in " .. delay .. "s",
            Content = "Features disabled. Leaving soon",
            Duration = delay,
            Image = 4483362458
        })
        task.wait(delay)
        LocalPlayer:Kick("Staff detected: " .. player.Name .. " (" .. rankName .. ")")
    end
end

function StaffDetector:CheckPlayer(player)
    if not Settings.StaffDetector.Enabled then return end
    if player == LocalPlayer then return end
    
    local isStaff, rankName = self:IsStaff(player)
    if isStaff then
        self:OnStaffDetected(player, rankName)
    end
end

function StaffDetector:Start()
    for _, player in ipairs(Players:GetPlayers()) do
        self:CheckPlayer(player)
    end
    
    Connections.StaffAdded = Players.PlayerAdded:Connect(function(player)
        task.wait(0.5)
        self:CheckPlayer(player)
    end)
    
    Connections.StaffRemoving = Players.PlayerRemoving:Connect(function(player)
        self.DetectedStaff[player.UserId] = nil
    end)
end

function StaffDetector:Stop()
    if Connections.StaffAdded then
        Connections.StaffAdded:Disconnect()
        Connections.StaffAdded = nil
    end
    
    if Connections.StaffRemoving then
        Connections.StaffRemoving:Disconnect()
        Connections.StaffRemoving = nil
    end
end

local Window = Rayfield:CreateWindow({
    Name = "Xattix Hub - Choose Your Power",
    LoadingTitle = "Xattix Hub",
    LoadingSubtitle = "Loading...",
    ConfigurationSaving = {
        Enabled = false,
        FolderName = nil,
        FileName = "XattixHub"
    },
    Discord = {
        Enabled = false,
        Invite = "",
        RememberJoins = true
    },
    KeySystem = false
})

local MainTab = Window:CreateTab("Main", 4483362458)

MainTab:CreateSection("Movement")

MainTab:CreateToggle({
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

MainTab:CreateToggle({
    Name = "Anti-Ragdoll",
    CurrentValue = false,
    Flag = "AntiRagdollToggle",
    Callback = function(Value)
        Settings.AntiRagdoll.Enabled = Value
        
        if Value then
            AntiRagdollModule:Start()
        else
            AntiRagdollModule:Stop()
        end
        
        Rayfield:Notify({
            Title = "Anti-Ragdoll",
            Content = Value and "Enabled" or "Disabled",
            Duration = 2,
            Image = 4483362458
        })
    end
})

MainTab:CreateSection("Staff Detector")

MainTab:CreateToggle({
    Name = "Staff Detector",
    CurrentValue = true,
    Flag = "StaffDetectorToggle",
    Callback = function(Value)
        Settings.StaffDetector.Enabled = Value
        
        if Value then
            StaffDetector:Start()
            for _, player in ipairs(Players:GetPlayers()) do
                StaffDetector:CheckPlayer(player)
            end
            Rayfield:Notify({
                Title = "Staff Detector",
                Content = "Enabled - Searching for staff",
                Duration = 4,
                Image = 4483362458
            })
        else
            StaffDetector:Stop()
            Rayfield:Notify({
                Title = "Staff Detector",
                Content = "Disabled - You should keep this enabled!",
                Duration = 3,
                Image = 4483362458
            })
        end
    end
})

MainTab:CreateDropdown({
    Name = "Detection Mode",
    Options = {"NotifyOnly", "NotifyThenKick", "ImmediateKick"},
    CurrentOption = {"NotifyThenKick"},
    MultipleOptions = false,
    Flag = "DetectionMode",
    Callback = function(Option)
        Settings.StaffDetector.Mode = Option[1] or Option
        Rayfield:Notify({
            Title = "Mode Changed",
            Content = "Set to " .. (Option[1] or Option),
            Duration = 2,
            Image = 4483362458
        })
    end
})

MainTab:CreateSlider({
    Name = "Kick Delay",
    Range = {1, 10},
    Increment = 1,
    Suffix = "s",
    CurrentValue = 3,
    Flag = "KickDelay",
    Callback = function(Value)
        Settings.StaffDetector.KickDelay = Value
    end
})

local ESPTab = Window:CreateTab("ESP", 4483362458)

ESPTab:CreateSection("Player ESP")

ESPTab:CreateToggle({
    Name = "Enable ESP",
    CurrentValue = false,
    Flag = "ESPToggle",
    Callback = function(Value)
        Settings.ESP.Enabled = Value
        
        if Value then
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer then
                    ESPModule:CreateHighlight(player)
                end
            end
        else
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer then
                    ESPModule:ClearESP(player)
                end
            end
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
        ESPModule:RefreshAll()
    end
})

ESPTab:CreateToggle({
    Name = "Show Health",
    CurrentValue = true,
    Flag = "ESPHealth",
    Callback = function(Value)
        Settings.ESP.ShowHealth = Value
        ESPModule:RefreshAll()
    end
})

ESPTab:CreateToggle({
    Name = "Show Box",
    CurrentValue = true,
    Flag = "ESPBox",
    Callback = function(Value)
        Settings.ESP.ShowBox = Value
        ESPModule:RefreshAll()
    end
})

ESPTab:CreateSection("Tracers")

ESPTab:CreateToggle({
    Name = "Enable Tracers",
    CurrentValue = false,
    Flag = "TracersToggle",
    Callback = function(Value)
        Settings.ESP.Tracers.Enabled = Value
        
        if not Value then
            for _, player in ipairs(Players:GetPlayers()) do
                local data = PlayerData[player]
                if data and data.Tracer then
                    pcall(function() data.Tracer.Visible = false end)
                end
            end
        end
    end
})

ESPTab:CreateSlider({
    Name = "Tracer Thickness",
    Range = {1, 5},
    Increment = 1,
    Suffix = "",
    CurrentValue = 1,
    Flag = "TracerThickness",
    Callback = function(Value)
        Settings.ESP.Tracers.Thickness = Value
    end
})

ESPTab:CreateDropdown({
    Name = "Tracer Origin",
    Options = {"Bottom", "Top", "Center"},
    CurrentOption = {"Bottom"},
    MultipleOptions = false,
    Flag = "TracerOrigin",
    Callback = function(Option)
        Settings.ESP.Tracers.Origin = Option[1] or Option
    end
})

ESPTab:CreateSection("Distance")

ESPTab:CreateToggle({
    Name = "Enable Distance",
    CurrentValue = false,
    Flag = "DistanceToggle",
    Callback = function(Value)
        Settings.ESP.Distance.Enabled = Value
        
        if not Value then
            for _, player in ipairs(Players:GetPlayers()) do
                local data = PlayerData[player]
                if data and data.Distance then
                    pcall(function() data.Distance.Visible = false end)
                end
            end
        end
    end
})

ESPTab:CreateSection("Chams")

ESPTab:CreateToggle({
    Name = "Enable Chams",
    CurrentValue = false,
    Flag = "ChamsToggle",
    Callback = function(Value)
        Settings.ESP.Chams.Enabled = Value
        
        if Value then
            ESPModule:RefreshChams()
        else
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer then
                    local char = GetCharacter(player)
                    if char then
                        local chams = char:FindFirstChild("XattixChams")
                        if chams then chams:Destroy() end
                    end
                end
            end
        end
    end
})

ESPTab:CreateSlider({
    Name = "Chams Transparency",
    Range = {0, 100},
    Increment = 5,
    Suffix = "%",
    CurrentValue = 50,
    Flag = "ChamsTransparency",
    Callback = function(Value)
        Settings.ESP.Chams.FillTransparency = Value / 100
        ESPModule:RefreshChams()
    end
})

ESPTab:CreateButton({
    Name = "Force Refresh ESP",
    Callback = function()
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                ESPModule:SetupPlayer(player)
            end
        end
        Rayfield:Notify({
            Title = "ESP Refreshed",
            Content = "All ESP reloaded",
            Duration = 2,
            Image = 4483362458
        })
    end
})

local HitboxTab = Window:CreateTab("Hitbox", 4483362458)

HitboxTab:CreateSection("Hitbox Expander")

HitboxTab:CreateToggle({
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
    Callback = function(Value)
        Settings.Hitbox.Size = Value
    end
})

HitboxTab:CreateButton({
    Name = "Refresh Hitboxes",
    Callback = function()
        if Settings.Hitbox.Enabled then
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer then
                    HitboxModule:Reset(player)
                end
            end
            task.wait(0.1)
            Rayfield:Notify({
                Title = "Hitboxes Refreshed",
                Content = "All hitboxes reset",
                Duration = 2,
                Image = 4483362458
            })
        end
    end
})

local SettingsTab = Window:CreateTab("Settings", 4483345998)

SettingsTab:CreateSection("Controls")

SettingsTab:CreateButton({
    Name = "Disable All",
    Callback = function()
        Settings.Hitbox.Enabled = false
        Settings.Noclip.Enabled = false
        Settings.AntiRagdoll.Enabled = false
        Settings.ESP.Enabled = false
        Settings.ESP.Tracers.Enabled = false
        Settings.ESP.Distance.Enabled = false
        Settings.ESP.Chams.Enabled = false
        
        HitboxModule:Stop()
        NoclipModule:Stop()
        AntiRagdollModule:Stop()
        ESPModule:Stop()
        
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
        Settings.Noclip.Enabled = false
        Settings.AntiRagdoll.Enabled = false
        Settings.ESP.Enabled = false
        Settings.StaffDetector.Enabled = false
        
        HitboxModule:Stop()
        NoclipModule:Stop()
        AntiRagdollModule:Stop()
        ESPModule:Stop()
        StaffDetector:Stop()
        
        for key, conn in pairs(Connections) do
            if typeof(conn) == "RBXScriptConnection" then
                pcall(function() conn:Disconnect() end)
            end
        end
        
        for player, data in pairs(PlayerData) do
            if data.Tracer then
                pcall(function() data.Tracer:Remove() end)
            end
            if data.Distance then
                pcall(function() data.Distance:Remove() end)
            end
        end
        
        Rayfield:Destroy()
    end
})

LocalPlayer.CharacterAdded:Connect(function()
    task.wait(0.5)
    
    if Settings.Noclip.Enabled then
        NoclipModule:Start()
    end
    
    if Settings.AntiRagdoll.Enabled then
        AntiRagdollModule:Start()
    end
end)

Players.PlayerRemoving:Connect(function(player)
    HitboxModule:Reset(player)
    ESPModule:ClearESP(player)
    PlayerData[player] = nil
end)

ESPModule:Start()
StaffDetector:Start()

Rayfield:Notify({
    Title = "Xattix Hub",
    Content = "Dont forget to join our discord community server! https://discord.gg/Usd4SWCdWe",
    Duration = 5,
    Image = 4483362458
})