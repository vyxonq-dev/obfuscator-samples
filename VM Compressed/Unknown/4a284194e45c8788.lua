local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

local TargetKey = "prettybutfakefree"

local function CleanKey(str)
    if not str then return "" end
    str = string.gsub(str, '"', "")
    str = string.gsub(str, "'", "")
    str = string.gsub(str, "%s+", "")
    return str
end

local function GetSafeParent()
    if gethui then
        local ok, res = pcall(gethui)
        if ok and res then return res end
    end
    if syn and syn.protect_gui then return CoreGui end
    return CoreGui
end

if getgenv and getgenv().DMAKeyGuiClean then
    pcall(getgenv().DMAKeyGuiClean)
end

-- Global State
_G.KeyAuthenticated = false
_G.SkillSpawm = false
_G.CoolDownDisable = true
_G.SelectedSkillName = "All (Spam Everything)"
_G.SkillKeyType = "M"
_G.SkillDelay = 0.01
_G.AutoAttack = false

_G.KillAura = false
_G.AuraDistance = 60
_G.MagnetMobs = false
_G.FreezeMobs = false
_G.TargetBossesOnly = false
_G.AutoFarmLoop = false
_G.AutoFarmHeight = 12

_G.AutoReplay = false
_G.AutoStart = false
_G.AutoOpenChests = false
_G.AutoCollectLoot = false

_G.ESP_Enabled = false
_G.ESP_Boxes = false
_G.ESP_Tracers = false
_G.ESP_Names = false
_G.ESP_Health = false
_G.ESP_Chests = false

_G.SpeedBoost = false
_G.SpeedValue = 32
_G.InfiniteJump = false
_G.Noclip = false
_G.Fullbright = false
_G.FlyMode = false
_G.FlySpeed = 50
_G.FOVValue = 70
_G.ChangeFOV = false

local function LaunchMainCheatSuite()
    _G.KeyAuthenticated = true

    local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
    local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
    local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

    local Window = Fluent:CreateWindow({
        Title = "dma.wtf",
        SubTitle = "by @prettybutfake",
        TabWidth = 130,
        Size = UDim2.fromOffset(640, 520),
        Acrylic = true,
        Theme = "Dark",
        MinimizeKey = Enum.KeyCode.Insert
    })

    local Tabs = {
        Combat = Window:AddTab({ Title = "Combat & Skills", Icon = "sword" }),
        Automation = Window:AddTab({ Title = "Aura & Farm", Icon = "zap" }),
        Dungeon = Window:AddTab({ Title = "Auto Dungeon", Icon = "play-circle" }),
        Visuals = Window:AddTab({ Title = "ESP & Visuals", Icon = "eye" }),
        Movement = Window:AddTab({ Title = "Movement & Cam", Icon = "move" }),
        Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
    }

    local function GetInventorySkills()
        local skills = {"All (Spam Everything)"}
        local backpack = LocalPlayer and LocalPlayer:FindFirstChild("Backpack")
        if backpack then
            for _, item in ipairs(backpack:GetChildren()) do
                table.insert(skills, item.Name)
            end
        end
        if LocalPlayer and LocalPlayer.Character then
            for _, item in ipairs(LocalPlayer.Character:GetChildren()) do
                if item:IsA("Tool") then
                    table.insert(skills, item.Name)
                end
            end
        end
        return skills
    end

    -- COMBAT TAB
    Tabs.Combat:AddSection("Skill Spammer & Rapid Attack")

    local SkillDropdown = Tabs.Combat:AddDropdown("SkillDropdown", {
        Title = "Select Skill to Spam",
        Values = GetInventorySkills(),
        Multi = false,
        Default = 1,
    })

    SkillDropdown:OnChanged(function(Value)
        _G.SelectedSkillName = Value
    end)

    local KeyDropdown = Tabs.Combat:AddDropdown("KeyDropdown", {
        Title = "Trigger Key / Mode",
        Values = {"M (Q Mode)", "E (Enum.KeyCode.E)", "E (As Letter)", "2 (Slot 2)"},
        Multi = false,
        Default = 1,
    })

    KeyDropdown:OnChanged(function(Value)
        if Value:find("Enum.KeyCode.E") then
            _G.SkillKeyType = Enum.KeyCode.E
        elseif Value:find("As Letter") then
            _G.SkillKeyType = "E"
        elseif Value:find("Slot 2") then
            _G.SkillKeyType = 2
        else
            _G.SkillKeyType = "M"
        end
    end)

    Tabs.Combat:AddSlider("SkillSpeedSlider", {
        Title = "Spam Delay (Speed)",
        Description = "Lower value = Faster skill execution",
        Default = 1,
        Min = 0,
        Max = 50,
        Rounding = 1,
        Callback = function(Value)
            _G.SkillDelay = Value / 100
        end
    })

    Tabs.Combat:AddButton({
        Title = "Refresh Skill Inventory",
        Callback = function()
            local updatedSkills = GetInventorySkills()
            SkillDropdown:SetValues(updatedSkills)
            Fluent:Notify({Title = "Inventory Refreshed", Content = "Found " .. tostring(#updatedSkills - 1) .. " skills/tools!", Duration = 3})
        end
    })

    Tabs.Combat:AddToggle("SkillSpawmToggle", {
        Title = "Auto Skill Spam", 
        Default = false 
    }):OnChanged(function(v) 
        _G.SkillSpawm = v 
    end)

    Tabs.Combat:AddToggle("AutoAttackToggle", {
        Title = "Auto Swing / Basic Attack",
        Default = false
    }):OnChanged(function(v)
        _G.AutoAttack = v
    end)

    Tabs.Combat:AddToggle("CoolDownToggle", {
        Title = "No Cooldown Exploit (ignoreCooldown)", 
        Default = true 
    }):OnChanged(function(v) 
        _G.CoolDownDisable = v 
    end)

    -- AUTOMATION TAB
    Tabs.Automation:AddSection("Kill Aura, Magnet & Auto Farm")

    Tabs.Automation:AddToggle("KillAuraToggle", {
        Title = "Enable Kill Aura",
        Default = false
    }):OnChanged(function(v)
        _G.KillAura = v
    end)

    Tabs.Automation:AddSlider("AuraDistanceSlider", {
        Title = "Kill Aura Range",
        Default = 60,
        Min = 10,
        Max = 300,
        Rounding = 0,
        Callback = function(v)
            _G.AuraDistance = v
        end
    })

    Tabs.Automation:AddToggle("MagnetToggle", {
        Title = "Mob Magnet (Pull Mobs)",
        Default = false
    }):OnChanged(function(v)
        _G.MagnetMobs = v
    end)

    Tabs.Automation:AddToggle("FreezeMobsToggle", {
        Title = "Freeze / Anchor Mobs",
        Default = false
    }):OnChanged(function(v)
        _G.FreezeMobs = v
    end)

    Tabs.Automation:AddToggle("TargetBossOnlyToggle", {
        Title = "Target Bosses Only",
        Default = false
    }):OnChanged(function(v)
        _G.TargetBossesOnly = v
    end)

    Tabs.Automation:AddSection("Safe Auto Farm Loop")

    Tabs.Automation:AddToggle("AutoFarmLoopToggle", {
        Title = "Auto Farm Loop (Hover Above Mobs)",
        Default = false
    }):OnChanged(function(v)
        _G.AutoFarmLoop = v
    end)

    Tabs.Automation:AddSlider("FarmHeightSlider", {
        Title = "Hover Height Above Mobs",
        Default = 12,
        Min = 5,
        Max = 30,
        Rounding = 0,
        Callback = function(v)
            _G.AutoFarmHeight = v
        end
    })

    -- DUNGEON TAB
    Tabs.Dungeon:AddSection("Dungeon Speedrun & Loot Automation")

    Tabs.Dungeon:AddToggle("AutoReplayToggle", {
        Title = "Auto Replay Dungeon (Instant Retry)",
        Default = false
    }):OnChanged(function(v)
        _G.AutoReplay = v
    end)

    Tabs.Dungeon:AddToggle("AutoStartToggle", {
        Title = "Auto Start Dungeon / Ready Up",
        Default = false
    }):OnChanged(function(v)
        _G.AutoStart = v
    end)

    Tabs.Dungeon:AddToggle("AutoOpenChestsToggle", {
        Title = "Auto Open End Chests",
        Default = false
    }):OnChanged(function(v)
        _G.AutoOpenChests = v
    end)

    Tabs.Dungeon:AddToggle("AutoCollectLootToggle", {
        Title = "Auto Pick Up Drops & Gold",
        Default = false
    }):OnChanged(function(v)
        _G.AutoCollectLoot = v
    end)

    Tabs.Dungeon:AddButton({
        Title = "Teleport to End Chest Room",
        Callback = function()
            local chest = Workspace:FindFirstChild("rewardChest") or Workspace:FindFirstChild("Chest") or Workspace:FindFirstChild("rewards")
            if chest and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local pos = chest:IsA("Model") and (chest.PrimaryPart and chest.PrimaryPart.Position or chest:GetModelCFrame().Position) or chest.Position
                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos + Vector3.new(0, 5, 0))
                Fluent:Notify({Title = "Teleported", Content = "Teleported to Chest Room!", Duration = 3})
            else
                Fluent:Notify({Title = "Error", Content = "Reward Chest not found yet!", Duration = 3})
            end
        end
    })

    -- VISUALS TAB
    Tabs.Visuals:AddSection("Mob, Boss & Chest ESP")

    Tabs.Visuals:AddToggle("ESPMasterToggle", {
        Title = "Enable Master ESP",
        Default = false
    }):OnChanged(function(v)
        _G.ESP_Enabled = v
    end)

    Tabs.Visuals:AddToggle("ESPBoxesToggle", {
        Title = "2D Bounding Boxes",
        Default = false
    }):OnChanged(function(v)
        _G.ESP_Boxes = v
    end)

    Tabs.Visuals:AddToggle("ESPNamesToggle", {
        Title = "Mob / Boss Names",
        Default = false
    }):OnChanged(function(v)
        _G.ESP_Names = v
    end)

    Tabs.Visuals:AddToggle("ESPHealthToggle", {
        Title = "Health Bars",
        Default = false
    }):OnChanged(function(v)
        _G.ESP_Health = v
    end)

    Tabs.Visuals:AddToggle("ESPTracersToggle", {
        Title = "Snapline Tracers",
        Default = false
    }):OnChanged(function(v)
        _G.ESP_Tracers = v
    end)

    Tabs.Visuals:AddToggle("ESPChestsToggle", {
        Title = "Chest ESP",
        Default = false
    }):OnChanged(function(v)
        _G.ESP_Chests = v
    end)

    -- MOVEMENT TAB
    Tabs.Movement:AddSection("Player Physics & Camera")

    Tabs.Movement:AddToggle("SpeedToggle", {
        Title = "WalkSpeed Boost",
        Default = false
    }):OnChanged(function(v)
        _G.SpeedBoost = v
    end)

    Tabs.Movement:AddSlider("SpeedSlider", {
        Title = "WalkSpeed Value",
        Default = 32,
        Min = 16,
        Max = 250,
        Rounding = 0,
        Callback = function(v)
            _G.SpeedValue = v
        end
    })

    Tabs.Movement:AddToggle("FlyToggle", {
        Title = "CFrame Fly Mode",
        Default = false
    }):OnChanged(function(v)
        _G.FlyMode = v
    end)

    Tabs.Movement:AddSlider("FlySpeedSlider", {
        Title = "Fly Speed",
        Default = 50,
        Min = 10,
        Max = 200,
        Rounding = 0,
        Callback = function(v)
            _G.FlySpeed = v
        end
    })

    Tabs.Movement:AddToggle("InfJumpToggle", {
        Title = "Infinite Jump",
        Default = false
    }):OnChanged(function(v)
        _G.InfiniteJump = v
    end)

    Tabs.Movement:AddToggle("NoclipToggle", {
        Title = "Noclip Mode",
        Default = false
    }):OnChanged(function(v)
        _G.Noclip = v
    end)

    Tabs.Movement:AddToggle("FullbrightToggle", {
        Title = "Fullbright Lighting",
        Default = false
    }):OnChanged(function(v)
        _G.Fullbright = v
    end)

    Tabs.Movement:AddToggle("FOVToggle", {
        Title = "Custom FOV",
        Default = false
    }):OnChanged(function(v)
        _G.ChangeFOV = v
        if not v and Camera then Camera.FieldOfView = 70 end
    end)

    Tabs.Movement:AddSlider("FOVSlider", {
        Title = "FOV Value",
        Default = 70,
        Min = 40,
        Max = 120,
        Rounding = 0,
        Callback = function(v)
            _G.FOVValue = v
            if _G.ChangeFOV and Camera then Camera.FieldOfView = v end
        end
    })

    SaveManager:SetLibrary(Fluent)
    InterfaceManager:SetLibrary(Fluent)
    InterfaceManager:SetFolder("dma_wtf")
    SaveManager:SetFolder("dma_wtf/DungeonQuest")
    InterfaceManager:BuildInterfaceSection(Tabs.Settings)
    SaveManager:BuildConfigSection(Tabs.Settings)

    Window:SelectTab(1)
    
    -- Load Notification
    Fluent:Notify({
        Title = "dma.wtf Authenticated",
        Content = "Welcome prettybutfake! All modules loaded cleanly.",
        SubContent = "Press Insert to toggle UI",
        Duration = 6
    })
end

-- KEY AUTHENTICATION GATEWAY
local KeyGui = Instance.new("ScreenGui")
KeyGui.Name = "DMA_KeyGateway_" .. tostring(math.random(10000, 99999))
KeyGui.ResetOnSpawn = false
KeyGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
KeyGui.Parent = GetSafeParent()

getgenv().DMAKeyGuiClean = function()
    pcall(function() KeyGui:Destroy() end)
end

local KeyModal = Instance.new("Frame")
KeyModal.Size = UDim2.fromOffset(420, 240)
KeyModal.Position = UDim2.new(0.5, -210, 0.5, -120)
KeyModal.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
KeyModal.BorderSizePixel = 0
KeyModal.Active = true
KeyModal.Parent = KeyGui

local ModalCorner = Instance.new("UICorner")
ModalCorner.CornerRadius = UDim.new(0, 12)
ModalCorner.Parent = KeyModal

local ModalStroke = Instance.new("UIStroke")
ModalStroke.Color = Color3.fromRGB(90, 105, 255)
ModalStroke.Transparency = 0.3
ModalStroke.Thickness = 1.5
ModalStroke.Parent = KeyModal

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -30, 0, 30)
Title.Position = UDim2.new(0, 20, 0, 18)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.Text = "dma.wtf"
Title.TextColor3 = Color3.fromRGB(90, 105, 255)
Title.TextSize = 20
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = KeyModal

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(1, -30, 0, 18)
Subtitle.Position = UDim2.new(0, 20, 0, 48)
Subtitle.BackgroundTransparency = 1
Subtitle.Font = Enum.Font.Gotham
Subtitle.Text = "by @prettybutfake"
Subtitle.TextColor3 = Color3.fromRGB(150, 155, 175)
Subtitle.TextSize = 12
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.Parent = KeyModal

local InputFrame = Instance.new("Frame")
InputFrame.Size = UDim2.new(1, -40, 0, 44)
InputFrame.Position = UDim2.new(0, 20, 0, 85)
InputFrame.BackgroundColor3 = Color3.fromRGB(26, 26, 32)
InputFrame.Parent = KeyModal

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 8)
InputCorner.Parent = InputFrame

local InputStroke = Instance.new("UIStroke")
InputStroke.Color = Color3.fromRGB(50, 50, 65)
InputStroke.Thickness = 1
InputStroke.Parent = InputFrame

local KeyTextBox = Instance.new("TextBox")
KeyTextBox.Size = UDim2.new(1, -24, 1, 0)
KeyTextBox.Position = UDim2.new(0, 12, 0, 0)
KeyTextBox.BackgroundTransparency = 1
KeyTextBox.Font = Enum.Font.Gotham
KeyTextBox.Text = ""
KeyTextBox.PlaceholderText = "Enter key..."
KeyTextBox.PlaceholderColor3 = Color3.fromRGB(100, 105, 125)
KeyTextBox.TextColor3 = Color3.fromRGB(245, 247, 255)
KeyTextBox.TextSize = 14
KeyTextBox.TextXAlignment = Enum.TextXAlignment.Left
KeyTextBox.ClearTextOnFocus = false
KeyTextBox.Parent = InputFrame

local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Size = UDim2.new(1, -40, 0, 44)
SubmitBtn.Position = UDim2.new(0, 20, 0, 150)
SubmitBtn.BackgroundColor3 = Color3.fromRGB(90, 105, 255)
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.Text = "UNLOCK DMA.WTF"
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.TextSize = 13
SubmitBtn.Parent = KeyModal

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 8)
BtnCorner.Parent = SubmitBtn

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, -40, 0, 18)
StatusLabel.Position = UDim2.new(0, 20, 0, 202)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.Text = ""
StatusLabel.TextColor3 = Color3.fromRGB(255, 75, 75)
StatusLabel.TextSize = 11
StatusLabel.TextXAlignment = Enum.TextXAlignment.Center
StatusLabel.Parent = KeyModal

-- Draggable Logic
local Dragging, DragStart, StartPos
KeyModal.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        Dragging = true
        DragStart = input.Position
        StartPos = KeyModal.Position
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if Dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - DragStart
        KeyModal.Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + delta.X, StartPos.Y.Scale, StartPos.Y.Offset + delta.Y)
    end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then Dragging = false end
end)

local function TryAuthenticate()
    local userVal = CleanKey(KeyTextBox.Text)
    if userVal == TargetKey then
        StatusLabel.TextColor3 = Color3.fromRGB(75, 255, 120)
        StatusLabel.Text = "Access Granted! Launching dma.wtf..."
        task.wait(0.5)
        KeyGui:Destroy()
        LaunchMainCheatSuite()
    else
        StatusLabel.TextColor3 = Color3.fromRGB(255, 75, 75)
        StatusLabel.Text = "Invalid Key! Please try again."
        TweenService:Create(InputStroke, TweenInfo.new(0.2), { Color = Color3.fromRGB(255, 75, 75) }):Play()
        task.wait(1.5)
        TweenService:Create(InputStroke, TweenInfo.new(0.2), { Color = Color3.fromRGB(50, 50, 65) }):Play()
    end
end

SubmitBtn.MouseButton1Click:Connect(TryAuthenticate)
KeyTextBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then TryAuthenticate() end
end)

-- BACKGROUND ENGINES
-- Skill Spammer & Basic Attack Engine
task.spawn(function()
    while true do
        task.wait(math.max(0, _G.SkillDelay))
        if _G.KeyAuthenticated then
            if _G.SkillSpawm then
                local backpack = LocalPlayer and LocalPlayer:FindFirstChild("Backpack")
                local character = LocalPlayer and LocalPlayer.Character
                local items = {}

                if backpack then
                    for _, item in ipairs(backpack:GetChildren()) do table.insert(items, item) end
                end
                if character then
                    for _, item in ipairs(character:GetChildren()) do
                        if item:IsA("Tool") then table.insert(items, item) end
                    end
                end

                for _, item in ipairs(items) do
                    if _G.SelectedSkillName == "All (Spam Everything)" or item.Name == _G.SelectedSkillName then
                        local args = {
                            [1] = {
                                {
                                    ["\t"] = item,
                                    ignoreCooldown = _G.CoolDownDisable,
                                    sentAt = tick()
                                },
                                _G.SkillKeyType
                            },
                            n = 1,
                        }
                        pcall(function()
                            local dataRemote = ReplicatedStorage:FindFirstChild("dataRemoteEvent")
                            if dataRemote then
                                dataRemote:FireServer(unpack(args, 1, args.n or #args))
                            end
                        end)
                    end
                end
            end

            if _G.AutoAttack and LocalPlayer.Character then
                local tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
                if tool then
                    pcall(function()
                        tool:Activate()
                    end)
                end
            end
        end
    end
end)

-- Kill Aura, Magnet, Freeze & Auto Farm Engine
RunService.RenderStepped:Connect(function()
    if _G.KeyAuthenticated and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local myHRP = LocalPlayer.Character.HumanoidRootPart
        local dungeonFolder = Workspace:FindFirstChild("dungeon") or Workspace:FindFirstChild("Monsters") or Workspace
        local closestMob = nil
        local closestDist = math.huge

        for _, model in ipairs(dungeonFolder:GetDescendants()) do
            if model:IsA("Model") and model ~= LocalPlayer.Character and model:FindFirstChild("HumanoidRootPart") and model:FindFirstChildOfClass("Humanoid") then
                local targetHRP = model.HumanoidRootPart
                local targetHum = model:FindFirstChildOfClass("Humanoid")

                if targetHum.Health > 0 then
                    local isBoss = string.find(string.lower(model.Name), "boss") ~= nil
                    if not _G.TargetBossesOnly or isBoss then
                        local dist = (targetHRP.Position - myHRP.Position).Magnitude

                        if dist < closestDist then
                            closestDist = dist
                            closestMob = model
                        end

                        if dist <= _G.AuraDistance then
                            if _G.MagnetMobs then
                                targetHRP.CFrame = myHRP.CFrame + (myHRP.CFrame.LookVector * 4)
                            end
                            if _G.FreezeMobs then
                                targetHRP.Anchored = true
                            end
                            if _G.KillAura then
                                local dataRemote = ReplicatedStorage:FindFirstChild("dataRemoteEvent")
                                local tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
                                if dataRemote and tool then
                                    dataRemote:FireServer({{["\t"] = tool, ignoreCooldown = true, sentAt = tick()}, "M"})
                                end
                            end
                        end
                    end
                end
            end
        end

        -- Auto Farm Hover Loop
        if _G.AutoFarmLoop and closestMob and closestMob:FindFirstChild("HumanoidRootPart") then
            local mobPos = closestMob.HumanoidRootPart.Position
            myHRP.CFrame = CFrame.new(mobPos + Vector3.new(0, _G.AutoFarmHeight, 0), mobPos)
        end
    end
end)

-- Dungeon Automation Engine
task.spawn(function()
    while true do
        task.wait(0.5)
        if _G.KeyAuthenticated then
            if _G.AutoReplay or _G.AutoStart then
                pcall(function()
                    local replayRemote = ReplicatedStorage:FindFirstChild("replayDungeon") or ReplicatedStorage:FindFirstChild("voteReplay")
                    if replayRemote then replayRemote:FireServer() end
                    
                    local startRemote = ReplicatedStorage:FindFirstChild("startDungeon") or ReplicatedStorage:FindFirstChild("readyUp")
                    if startRemote then startRemote:FireServer() end
                end)
            end
            if _G.AutoOpenChests then
                pcall(function()
                    for _, obj in ipairs(Workspace:GetDescendants()) do
                        if string.find(string.lower(obj.Name), "chest") or string.find(string.lower(obj.Name), "reward") then
                            if obj:IsA("ProximityPrompt") and fireproximityprompt then
                                fireproximityprompt(obj)
                            elseif obj:IsA("ClickDetector") and fireclickdetector then
                                fireclickdetector(obj)
                            end
                        end
                    end
                end)
            end
            if _G.AutoCollectLoot then
                pcall(function()
                    for _, drop in ipairs(Workspace:GetDescendants()) do
                        if drop:IsA("BasePart") and (string.find(string.lower(drop.Name), "gold") or string.find(string.lower(drop.Name), "mana") or string.find(string.lower(drop.Name), "drop")) then
                            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                drop.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
                            end
                        end
                    end
                end)
            end
        end
    end
end)

-- Visuals ESP Engine
local ESPCache = {}
local ChestESPCache = {}

RunService.RenderStepped:Connect(function()
    if not _G.KeyAuthenticated or not _G.ESP_Enabled then
        for _, d in pairs(ESPCache) do for _, o in pairs(d) do o.Visible = false end end
        for _, o in pairs(ChestESPCache) do o.Visible = false end
        return
    end

    local dungeonFolder = Workspace:FindFirstChild("dungeon") or Workspace:FindFirstChild("Monsters") or Workspace
    local activeModels = {}

    for _, model in ipairs(dungeonFolder:GetDescendants()) do
        if model:IsA("Model") and model ~= LocalPlayer.Character and model:FindFirstChild("HumanoidRootPart") and model:FindFirstChildOfClass("Humanoid") then
            local hum = model:FindFirstChildOfClass("Humanoid")
            if hum.Health > 0 then
                activeModels[model] = true
                if not ESPCache[model] then
                    ESPCache[model] = {
                        BoxOutline = Drawing.new("Square"),
                        Box = Drawing.new("Square"),
                        Name = Drawing.new("Text"),
                        HealthText = Drawing.new("Text"),
                        Tracer = Drawing.new("Line")
                    }
                    local d = ESPCache[model]
                    d.BoxOutline.Thickness = 2.5 d.BoxOutline.Color = Color3.new(0, 0, 0)
                    d.Box.Thickness = 1
                    d.Name.Size = 13 d.Name.Center = true d.Name.Outline = true
                    d.HealthText.Size = 11 d.HealthText.Center = true d.HealthText.Outline = true
                    d.Tracer.Thickness = 1
                end

                local d = ESPCache[model]
                local hrp = model.HumanoidRootPart
                local head = model:FindFirstChild("Head") or hrp
                local topScreen, topOn = Camera:WorldToViewportPoint(head.Position + Vector3.new(0, 1.5, 0))
                local botScreen, botOn = Camera:WorldToViewportPoint(hrp.Position - Vector3.new(0, 2.5, 0))

                if topOn and botOn then
                    local height = math.abs(topScreen.Y - botScreen.Y)
                    local width = height * 0.55
                    local topLeft = Vector2.new(topScreen.X - (width / 2), topScreen.Y)

                    d.BoxOutline.Position = topLeft d.BoxOutline.Size = Vector2.new(width, height) d.BoxOutline.Visible = _G.ESP_Boxes
                    d.Box.Position = topLeft d.Box.Size = Vector2.new(width, height)
                    d.Box.Color = string.find(string.lower(model.Name), "boss") and Color3.fromRGB(255, 65, 65) or Color3.fromRGB(90, 105, 255)
                    d.Box.Visible = _G.ESP_Boxes

                    d.Name.Position = Vector2.new(topScreen.X, topScreen.Y - 16)
                    d.Name.Text = model.Name
                    d.Name.Color = Color3.fromRGB(255, 255, 255)
                    d.Name.Visible = _G.ESP_Names

                    d.HealthText.Position = Vector2.new(topScreen.X, botScreen.Y + 3)
                    d.HealthText.Text = string.format("%d HP", math.floor(hum.Health))
                    d.HealthText.Color = Color3.fromRGB(112, 196, 150)
                    d.HealthText.Visible = _G.ESP_Health

                    d.Tracer.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                    d.Tracer.To = Vector2.new(topScreen.X, botScreen.Y)
                    d.Tracer.Color = Color3.fromRGB(90, 105, 255)
                    d.Tracer.Visible = _G.ESP_Tracers
                else
                    for _, o in pairs(d) do o.Visible = false end
                end
            end
        end
    end

    for model, d in pairs(ESPCache) do
        if not activeModels[model] then
            for _, o in pairs(d) do pcall(function() o.Visible = false o:Remove() end) end
            ESPCache[model] = nil
        end
    end

    -- Chest ESP Render
    if _G.ESP_Chests then
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if string.find(string.lower(obj.Name), "chest") or string.find(string.lower(obj.Name), "reward") then
                local part = obj:IsA("BasePart") and obj or (obj:IsA("Model") and obj.PrimaryPart)
                if part then
                    local screenPos, onScreen = Camera:WorldToViewportPoint(part.Position)
                    if not ChestESPCache[obj] then
                        local txt = Drawing.new("Text")
                        txt.Size = 13 txt.Center = true txt.Outline = true txt.Color = Color3.fromRGB(255, 215, 0)
                        ChestESPCache[obj] = txt
                    end
                    local txt = ChestESPCache[obj]
                    if onScreen then
                        txt.Position = Vector2.new(screenPos.X, screenPos.Y)
                        txt.Text = "[CHEST] " .. obj.Name
                        txt.Visible = true
                    else
                        txt.Visible = false
                    end
                end
            end
        end
    else
        for _, txt in pairs(ChestESPCache) do txt.Visible = false end
    end
end)

-- Movement & Physics Stepped Loop
RunService.Stepped:Connect(function()
    if _G.KeyAuthenticated then
        if _G.SpeedBoost and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = _G.SpeedValue
        end
        if _G.Noclip and LocalPlayer.Character then
            for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
        end
        if _G.Fullbright then
            Lighting.Ambient = Color3.fromRGB(255, 255, 255)
            Lighting.Brightness = 2
        end
        if _G.ChangeFOV and Camera then
            Camera.FieldOfView = _G.FOVValue
        end
    end
end)

-- Fly Engine
RunService.RenderStepped:Connect(function()
    if _G.KeyAuthenticated and _G.FlyMode and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local hrp = LocalPlayer.Character.HumanoidRootPart
        local moveDir = Vector3.zero
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir += Camera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir -= Camera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir -= Camera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir += Camera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveDir += Vector3.new(0, 1, 0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then moveDir -= Vector3.new(0, 1, 0) end

        if moveDir.Magnitude > 0 then
            hrp.CFrame += moveDir.Unit * (_G.FlySpeed * 0.03)
        end
    end
end)

UserInputService.JumpRequest:Connect(function()
    if _G.KeyAuthenticated and _G.InfiniteJump and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

print("[+] dma.wtf Dungeon Quest Suite loaded!")
