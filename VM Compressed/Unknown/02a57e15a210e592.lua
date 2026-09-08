local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Merge a Nuke",
    LoadingTitle = "Voxle Hub",
    LoadingSubtitle = "by Keybrew",
    ConfigurationSaving = {
        Enabled = false,
        FolderName = "VoxleHubConfigs",
        FileName = "VoxleHub"
    },
    KeySystem = false,
    Theme = "Default",
    ToggleUIKeybind = Enum.KeyCode.RightAlt
})




local Players = game:GetService("Players")

local Main = Window:CreateTab("Main", 4483362458)
local UniversalTab = Window:CreateTab("Universal", 4483362458)
local CreditsTab = Window:CreateTab("Credits", 4483362458)
local LocalPlayer = game:GetService("Players").LocalPlayer
local PlayerId = tonumber(LocalPlayer.UserId)
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")


local function GetPlayerBase()
    local BasesFolder = game.Workspace:FindFirstChild("Bases")
    if BasesFolder then
        for _, folder in ipairs(BasesFolder:GetChildren()) do
            local attributeValue = folder:GetAttribute("OwnerUserId")
            if attributeValue and tonumber(attributeValue) == PlayerId then
                return folder
            end
        end
    end
    return nil
end

local function TeleportTo(object)
    if not object or not LocalPlayer.Character then return end
    local root = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    local position = nil
    if object:IsA("Model") then
        position = object:GetPivot().Position
    elseif object:IsA("BasePart") then
        position = object.Position
    end
    if root and position then
        root.CFrame = CFrame.new(position + Vector3.new(0, 2, 0))
    end
end

Main:CreateToggle({
    Name = "Auto Merge",
    CurrentValue = false,
    Flag = "Toggle1", 
    Callback = function(Value)
        _G.AutoMerge = Value
        while _G.AutoMerge do
            local myBase = GetPlayerBase()
            if myBase and myBase:FindFirstChild("Nukes") then
                local nukeCounts = {}
                for _, nuke in ipairs(myBase.Nukes:GetChildren()) do
                    if nuke.Name == "Nuke" and nuke:FindFirstChild("OverheadNuke") and nuke.OverheadNuke:FindFirstChild("TextLabel") then
                        local nukeType = nuke.OverheadNuke.TextLabel.Text
                        if nukeType and nukeType ~= "" then
                            if not nukeCounts[nukeType] then
                                nukeCounts[nukeType] = {}
                            end
                            table.insert(nukeCounts[nukeType], nuke)
                        end
                    end
                end
                for _, matches in pairs(nukeCounts) do
                    if #matches >= 2 then
                        local PickUpEvent = game:GetService("ReplicatedStorage").NukeRemotes.PickUp
                        local MergeEvent = game:GetService("ReplicatedStorage").NukeRemotes.MergeRequest
                        local firstNuke = matches[1]
                        local secondNuke = matches[2]
                        PickUpEvent:FireServer(firstNuke)
                        task.wait()
                        MergeEvent:FireServer(secondNuke)
                        break
                    end
                end
            end
            task.wait()
        end
    end
})

Main:CreateToggle({
    Name = "Auto Pick Up All",
    CurrentValue = false,
    Flag = "Toggle2",
    Callback = function(Value)
        _G.AutoPickUp = Value
        while _G.AutoPickUp do
            local myBase = GetPlayerBase()
            if myBase and myBase:FindFirstChild("Nukes") then
                local nukeCounts = {}
                for _, nuke in ipairs(myBase.Nukes:GetChildren()) do
                    if nuke.Name == "Nuke" and nuke:FindFirstChild("OverheadNuke") and nuke.OverheadNuke:FindFirstChild("TextLabel") then
                        local nukeType = nuke.OverheadNuke.TextLabel.Text
                        if nukeType and nukeType ~= "" then
                            if not nukeCounts[nukeType] then
                                nukeCounts[nukeType] = {}
                            end
                            table.insert(nukeCounts[nukeType], nuke)
                        end
                    end
                end
                
                for _, nuke in ipairs(myBase.Nukes:GetChildren()) do
                    if not _G.AutoPickUp then break end
                    if nuke.Name == "Nuke" and nuke:FindFirstChild("OverheadNuke") and nuke.OverheadNuke:FindFirstChild("TextLabel") then
                        local nukeType = nuke.OverheadNuke.TextLabel.Text
                        local matchCount = nukeCounts[nukeType] and #nukeCounts[nukeType] or 0
                        
                        local PickUpEvent = game:GetService("ReplicatedStorage").NukeRemotes.PickUp
                        local rootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        local originalCFrame = rootPart and rootPart.CFrame
                        
                        TeleportTo(nuke)
                        task.wait()
                        PickUpEvent:FireServer(nuke)
                        task.wait()
                        
                        if matchCount < 2 then
                            local DropEvent = game:GetService("ReplicatedStorage").NukeRemotes.Drop
                            if rootPart then
                                DropEvent:FireServer(rootPart.CFrame)
                            else
                                DropEvent:FireServer(CFrame.new(290.03, 17.20, 249.74))
                            end
                            task.wait()
                        end
                        
                        if rootPart and originalCFrame then
                            rootPart.CFrame = originalCFrame
                        end
                    end
                end
            end
            task.wait()
        end
    end
})

    Main:CreateToggle({
   Name = "Auto Lock Base",
   CurrentValue = false,
   Flag = "Toggle3", 
   Callback = function(Value)
    lock = Value
    while lock do task.wait()
        local Event = game:GetService("ReplicatedStorage").NukeRemotes.RequestLockBase
            Event:FireServer()
        end
   end,
})

Main:CreateDropdown({
    Name = "Select Upgrades",
    Options = {"MAX", "TIER", "LOCKBASE"},
    CurrentOption = {},
    MultipleOptions = true,
    Flag = "Dropdown1",
    Callback = function(Options)
        SelectedUpgrades = Options
    end,
})

Main:CreateToggle({
    Name = "Auto Upgrade",
    CurrentValue = false,
    Flag = "Toggle4", 
    Callback = function(Value)
        _G.AutoUpgrade = Value
        while _G.AutoUpgrade do
            local Event = game:GetService("ReplicatedStorage").NukeRemotes.PurchaseUpgrade
            for _, upgradeType in ipairs(SelectedUpgrades) do
                if not _G.AutoUpgrade then break end
                Event:FireServer(upgradeType)
            end
            task.wait()
        end
    end,
})


shared.InfJumpEnabled = false
shared.FlyEnabled = false
shared.EspEnabled = false
shared.NoclipEnabled = false
shared.FlySpeed = 50

shared.WalkSpeedEnabled = false
shared.JumpPowerEnabled = false
shared.TargetWalkSpeed = 16
shared.TargetJumpPower = 50

shared.FlyConnection = nil
shared.NoclipConnection = nil
shared.EspConnections = {}
shared.EspFolder = Workspace:FindFirstChild("VoxleESP") or Instance.new("Folder", Workspace)
shared.EspFolder.Name = "VoxleESP"

UniversalTab:CreateSection("Movement Modifications")

UniversalTab:CreateSlider({
    Name = "WalkSpeed",
    Range = {16, 250},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Flag = "WalkSpeedSlider",
    Callback = function(Value)
        shared.TargetWalkSpeed = Value
        if shared.WalkSpeedEnabled then
            local Char = LocalPlayer.Character
            local Hum = Char and Char:FindFirstChildOfClass("Humanoid")
            if Hum then Hum.WalkSpeed = Value end
        end
    end,
})

UniversalTab:CreateToggle({
    Name = "Enable WalkSpeed",
    CurrentValue = false,
    Flag = "WalkSpeedToggle",
    Callback = function(Value)
        shared.WalkSpeedEnabled = Value
        if not Value then
            local Char = LocalPlayer.Character
            local Hum = Char and Char:FindFirstChildOfClass("Humanoid")
            if Hum then Hum.WalkSpeed = 16 end
        end
    end,
})

UniversalTab:CreateSlider({
    Name = "JumpPower",
    Range = {50, 500},
    Increment = 1,
    Suffix = "Power",
    CurrentValue = 50,
    Flag = "JumpPowerSlider",
    Callback = function(Value)
        shared.TargetJumpPower = Value
        if shared.JumpPowerEnabled then
            local Char = LocalPlayer.Character
            local Hum = Char and Char:FindFirstChildOfClass("Humanoid")
            if Hum then
                Hum.UseJumpPower = true
                Hum.JumpPower = Value
            end
        end
    end,
})

UniversalTab:CreateToggle({
    Name = "Enable JumpPower",
    CurrentValue = false,
    Flag = "JumpPowerToggle",
    Callback = function(Value)
        shared.JumpPowerEnabled = Value
        if not Value then
            local Char = LocalPlayer.Character
            local Hum = Char and Char:FindFirstChildOfClass("Humanoid")
            if Hum then 
                Hum.JumpPower = 50 
            end
        end
    end,
})

    RunService.RenderStepped:Connect(function()
    local Char = LocalPlayer.Character
    local Hum = Char and Char:FindFirstChildOfClass("Humanoid")
    if not Hum then return end
    
    if shared.WalkSpeedEnabled then
        if Hum.WalkSpeed ~= shared.TargetWalkSpeed then
            Hum.WalkSpeed = shared.TargetWalkSpeed
        end
    end
    
    if shared.JumpPowerEnabled then
        if not Hum.UseJumpPower then
            Hum.UseJumpPower = true
        end
        if Hum.JumpPower ~= shared.TargetJumpPower then
            Hum.JumpPower = shared.TargetJumpPower
        end
    end
end)

UniversalTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "InfJumpToggle",
    Callback = function(Value)
        shared.InfJumpEnabled = Value
    end,
})

UserInputService.JumpRequest:Connect(function()
    if shared.InfJumpEnabled then
        local Char = LocalPlayer.Character
        local Hum = Char and Char:FindFirstChildOfClass("Humanoid")
        if Hum then Hum:ChangeState(Enum.HumanoidStateType.Jumping) end
    end
end)

UniversalTab:CreateSection("Advanced Movement")

UniversalTab:CreateSlider({
    Name = "Fly Speed",
    Range = {10, 300},
    Increment = 5,
    Suffix = "Studs",
    CurrentValue = 50,
    Flag = "FlySpeedSlider",
    Callback = function(Value)
        shared.FlySpeed = Value
    end,
})

shared.HandleFlight = function()
    local Camera = Workspace.CurrentCamera
    local Character = LocalPlayer.Character
    local Root = Character and Character:FindFirstChild("HumanoidRootPart")
    local Hum = Character and Character:FindFirstChildOfClass("Humanoid")

    if not Root or not Hum then return end

    local BVel = Root:FindFirstChild("VoxleFlyForce") or Instance.new("BodyVelocity")
    BVel.Name = "VoxleFlyForce"
    BVel.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    BVel.Parent = Root

    local LGyro = Root:FindFirstChild("VoxleFlyGyro") or Instance.new("BodyGyro")
    LGyro.Name = "VoxleFlyGyro"
    LGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    LGyro.CFrame = Root.CFrame
    LGyro.Parent = Root

    Hum.PlatformStand = true

    shared.FlyConnection = RunService.RenderStepped:Connect(function()
        if not shared.FlyEnabled or not Character or not Root.Parent then 
            BVel:Destroy()
            LGyro:Destroy()
            if Hum then Hum.PlatformStand = false end
            if shared.FlyConnection then shared.FlyConnection:Disconnect() end
            return 
        end

        local Dir = Vector3.new(0,0,0)
        local CamCFrame = Camera.CFrame
        
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then Dir = Dir + CamCFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then Dir = Dir - CamCFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then Dir = Dir - CamCFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then Dir = Dir + CamCFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then Dir = Dir + Vector3.new(0, 1, 0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then Dir = Dir - Vector3.new(0, 1, 0) end

        BVel.Velocity = Dir.Magnitude > 0 and Dir.Unit * shared.FlySpeed or Vector3.new(0,0,0)
        LGyro.CFrame = CamCFrame
    end)
end

UniversalTab:CreateToggle({
    Name = "Fly",
    CurrentValue = false,
    Flag = "FlyToggle",
    Callback = function(Value)
        shared.FlyEnabled = Value
        if shared.FlyEnabled then
            shared.HandleFlight()
        else
            if shared.FlyConnection then shared.FlyConnection:Disconnect() end
            local Char = LocalPlayer.Character
            local Root = Char and Char:FindFirstChild("HumanoidRootPart")
            local Hum = Char and Char:FindFirstChildOfClass("Humanoid")
            if Root then
                if Root:FindFirstChild("VoxleFlyForce") then Root.VoxleFlyForce:Destroy() end
                if Root:FindFirstChild("VoxleFlyGyro") then Root.VoxleFlyGyro:Destroy() end
            end
            if Hum then Hum.PlatformStand = false end
        end
    end,
})

UniversalTab:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Flag = "NoclipToggle",
    Callback = function(Value)
        shared.NoclipEnabled = Value
        if shared.NoclipEnabled then
            shared.NoclipConnection = RunService.Stepped:Connect(function()
                if not shared.NoclipEnabled then 
                    if shared.NoclipConnection then shared.NoclipConnection:Disconnect() end
                    return 
                end
                if LocalPlayer.Character then
                    for _, Part in ipairs(LocalPlayer.Character:GetDescendants()) do
                        if Part:IsA("BasePart") and Part.CanCollide then
                            Part.CanCollide = false
                        end
                    end
                end
            end)
        else
            if shared.NoclipConnection then shared.NoclipConnection:Disconnect() end
        end
    end,
})

UniversalTab:CreateSection("Visuals")

local function CleanUpPlayerESP(Player)
    if shared.EspConnections[Player] then
        for _, Connection in ipairs(shared.EspConnections[Player]) do
            Connection:Disconnect()
        end
        shared.EspConnections[Player] = nil
    end
    if shared.EspFolder then
        local Container = shared.EspFolder:FindFirstChild(Player.Name)
        if Container then Container:Destroy() end
    end
end

local function ConstructFullESP(Player)
    if Player == LocalPlayer then return end
    CleanUpPlayerESP(Player)

    shared.EspConnections[Player] = {}
    if not shared.EspFolder then return end

    local Container = Instance.new("Folder")
    Container.Name = Player.Name
    Container.Parent = shared.EspFolder

    local function CreateNameTag(Char)
        if not Char then return end
        local Root = Char:WaitForChild("HumanoidRootPart", 5)
        if not Root then return end

        local BbGui = Instance.new("BillboardGui")
        BbGui.Name = "EspNameTag"
        BbGui.AlwaysOnTop = true
        BbGui.Size = UDim2.new(0, 200, 0, 50)
        BbGui.StudsOffset = Vector3.new(0, 3, 0)
        BbGui.Adornee = Root
        BbGui.Parent = Container

        local TextLabel = Instance.new("TextLabel")
        TextLabel.Size = UDim2.new(1, 0, 1, 0)
        TextLabel.BackgroundTransparency = 1
        TextLabel.Text = Player.Name
        TextLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        TextLabel.TextSize = 14
        TextLabel.Font = Enum.Font.SourceSansBold
        TextLabel.TextStrokeTransparency = 0
        TextLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        TextLabel.Parent = BbGui
    end

    if Player.Character then CreateNameTag(Player.Character) end
    
    local CharAdded = Player.CharacterAdded:Connect(function(Char)
        task.wait(0.5)
        CreateNameTag(Char)
    end)
    table.insert(shared.EspConnections[Player], CharAdded)
end

UniversalTab:CreateToggle({
    Name = "Player ESP",
    CurrentValue = false,
    Flag = "EspToggle",
    Callback = function(Value)
        shared.EspEnabled = Value
        if shared.EspEnabled then
            for _, Player in ipairs(Players:GetPlayers()) do
                ConstructFullESP(Player)
            end
            shared.PlayerAddedConn = Players.PlayerAdded:Connect(ConstructFullESP)
            shared.PlayerRemovingConn = Players.PlayerRemoving:Connect(CleanUpPlayerESP)
        else
            if shared.PlayerAddedConn then shared.PlayerAddedConn:Disconnect() end
            if shared.PlayerRemovingConn then shared.PlayerRemovingConn:Disconnect() end
            for _, Player in ipairs(Players:GetPlayers()) do
                CleanUpPlayerESP(Player)
            end
        end
    end,
})
LocalPlayer.CharacterAdded:Connect(function(Character)
    local Humanoid = Character:WaitForChild("Humanoid")
    task.wait(0.5) 
    
    if Rayfield.Flags["WalkSpeedSlider"] then
        Humanoid.WalkSpeed = Rayfield.Flags["WalkSpeedSlider"].CurrentValue
    end
    if Rayfield.Flags["JumpPowerSlider"] then
        Humanoid.UseJumpPower = true
        Humanoid.JumpPower = Rayfield.Flags["JumpPowerSlider"].CurrentValue
    end
    if shared.FlyEnabled then
        shared.HandleFlight()
    end
end)


CreditsTab:CreateSection("Community")

CreditsTab:CreateButton({
    Name = "Copy Discord",
    Callback = function() 
        setclipboard("https://discord.gg/gcHGgT3nfp")
        Rayfield:Notify({
            Title = "Success",
            Content = "Discord link copied to your clipboard!",
            Duration = 3,
            Image = 4483362458,
        })
    end
})
