    local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

    local Window = Rayfield:CreateWindow({
        Name = "Combat Initiation Hub",
        Icon = 0,
        LoadingTitle = "Combat Initiation Hub", 
        LoadingSubtitle = "by DexScripts",
        Theme = "Default",
        DisableRayfieldPrompts = false,
        DisableBuildWarnings = false,

        ConfigurationSaving = {
            Enabled = true,
            FolderName = nil,
            FileName = "Big Hub"
        },

        Discord = {
            Enabled = false,
            Invite = "noinvitelink", 
            RememberJoins = true
        },

        KeySystem = false,
        KeySettings = {
            Title = "key needed",
            Subtitle = "Key System",
            Note = "Check scriptblox for key there should be a lootlabs link",
            FileName = "Key",
            SaveKey = true,
            GrabKeyFromSite = false,
            Key = {"red9"}
        }
    })

    local EnemiesTab = Window:CreateTab("Enemies", 4483362458)

    local freezeEnabled = false
    local espEnabled = false

    local EnemiesSection = EnemiesTab:CreateSection("Enemies")

    EnemiesTab:CreateButton({
    Name = "Toggle Freeze Enemies",
    Callback = function()
        freezeEnabled = not freezeEnabled
        local enemiesFolder = workspace:FindFirstChild("Enemies")
        if not enemiesFolder then return end
        
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://7038734120"
        sound.Volume = 2.75
        sound.Parent = game.Workspace
        sound:Play()
        game:GetService("Debris"):AddItem(sound, 2)

        for _, enemy in ipairs(enemiesFolder:GetChildren()) do
            local hrp = enemy:FindFirstChild("HumanoidRootPart")
            if hrp then hrp.Anchored = freezeEnabled end
        end
    end
    })

    EnemiesTab:CreateButton({
    Name = "Grab All Enemies",
    Callback = function()
        local lp = game.Players.LocalPlayer
        local enemiesFolder = workspace:FindFirstChild("Enemies")
        if not enemiesFolder then return end
        
        getgenv().Farm = true
        local distance = 10
        
        while getgenv().Farm do
            local playerHRP = lp.Character:FindFirstChild("HumanoidRootPart")
            for _, npc in ipairs(enemiesFolder:GetChildren()) do
                local npcHRP = npc:FindFirstChild("HumanoidRootPart")
                local npcHumanoid = npc:FindFirstChild("Humanoid")
                if npcHRP and npcHumanoid and npcHumanoid.Health > 0 then
                    npcHRP.CFrame = playerHRP.CFrame + playerHRP.CFrame.LookVector * distance
                end
            end
            task.wait(0.1)
        end
    end
    })

    EnemiesTab:CreateButton({
    Name = "Toggle Enemy ESP",
    Callback = function()
        espEnabled = not espEnabled
        local enemiesFolder = workspace:FindFirstChild("Enemies")
        if not enemiesFolder then return end

        local function updateESP()
            while espEnabled do
                for _, enemy in ipairs(enemiesFolder:GetChildren()) do
                    if enemy:IsA("Model") then
                        local highlight = enemy:FindFirstChild("EspHighlight")
                        
                        if espEnabled then
                            if not highlight then
                                highlight = Instance.new("Highlight")
                                highlight.Name = "EspHighlight"
                                highlight.FillColor = Color3.fromRGB(255, 0, 0)
                                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                                highlight.FillTransparency = 0.5
                                highlight.Parent = enemy
                            end
                        else
                            if highlight then highlight:Destroy() end
                        end
                    end
                end
                task.wait(0.2)
            end

            for _, enemy in ipairs(enemiesFolder:GetChildren()) do
                local highlight = enemy:FindFirstChild("EspHighlight")
                if highlight then highlight:Destroy() end
            end
        end

        if espEnabled then
            task.spawn(updateESP)
        end
    end
    })

    local BossesSection = EnemiesTab:CreateSection("Bosses")

    EnemiesTab:CreateButton({
    Name = "Kill Jason Instantly",
    Callback = function()
        local Jason = workspace:FindFirstChild("Enemies") and workspace.Enemies:FindFirstChild("Jason")
        if not Jason then return end
        
        local humanoid = Jason:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.Health = 0
        end
    end
    })

    local UltrakillSection = EnemiesTab:CreateSection("ULTRAKILL")

    EnemiesTab:CreateButton({
    Name = "DESTROY",
    Callback = function()
        local enemiesFolder = workspace:FindFirstChild("Enemies")
        local mapsFolder = workspace:FindFirstChild("Maps")
        
        if enemiesFolder then enemiesFolder:Destroy() end
        if mapsFolder then mapsFolder:Destroy() end
        
        local platform = Instance.new("Part")
        platform.Size = Vector3.new(100, 4, 100)
        platform.Position = Vector3.new(0, 0, 0)
        platform.Anchored = true
        platform.Parent = workspace
        
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 10, 0)
        end
    end
    })

    local PlayerTab = Window:CreateTab("Player", 4483362458)

    PlayerTab:CreateButton({
    Name = "Infinite Dashes",
    Callback = function()
        game.Players.LocalPlayer.Character:SetAttribute("DashRegenTime", 0.01)
    end
    })

    PlayerTab:CreateButton({
    Name = "No Aggro (Teammate Mode)",
    Callback = function()
        game.Players.LocalPlayer.Character:SetAttribute("AggroMultiplier", 0)
    end
    })

    PlayerTab:CreateButton({
    Name = "Godly Aggro (Tank Mode)",
    Callback = function()
        game.Players.LocalPlayer.Character:SetAttribute("AggroMultiplier", math.huge)
    end
    })

    local MiscTab = Window:CreateTab("Misc", 4483362458)

    MiscTab:CreateButton({
    Name = "Load Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end
    })

    MiscTab:CreateButton({
    Name = "Load Dark Dex",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end
    })

    MiscTab:CreateButton({
    Name = "Load JasonSpy",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/8Pa2QRY8"))()
    end
    })

    local WeaponsTab = Window:CreateTab("Weapons", 4483362458)

    WeaponsTab:CreateButton({
    Name = "Slingshot Spam",
    Callback = function()
        local slingshot = game.Players.LocalPlayer.Backpack:FindFirstChild("Slingshot")
        if not slingshot then return end
        
        slingshot:SetAttribute("Firerate", 0.01)
        slingshot:SetAttribute("Capacity", math.huge)
        slingshot:SetAttribute("ChargeRate", 0)
        slingshot:SetAttribute("Spread", 1.35)
    end
    })

    WeaponsTab:CreateButton({
    Name = "Swords No Cooldown",
    Callback = function()
        local backpack = game.Players.LocalPlayer.Backpack
        if not backpack then return end

        local swordAttributes = { Swingrate = 0.01, LungeRate = 0.01 }
        local function updateWeapon(weaponName)
            local weapon = backpack:FindFirstChild(weaponName)
            if weapon then for attr, value in pairs(swordAttributes) do weapon:SetAttribute(attr, value) end end
        end

        updateWeapon("Sword")
        updateWeapon("Katana")
        updateWeapon("Firebrand")
    end
    })

    WeaponsTab:CreateButton({
    Name = "Paintball Gun No Cooldown",
    Callback = function()
        local backpack = game.Players.LocalPlayer.Backpack
        if not backpack then return end

        for _, item in ipairs(backpack:GetChildren()) do
            if item:IsA("Tool") and item.Name:lower():find("paintball") then
                item:SetAttribute("Firerate", 0.01)
                item:SetAttribute("Capacity", math.huge)
                item:SetAttribute("ReloadTime", 0)
            end
        end
    end
    })

    local FlowTab = Window:CreateTab("flow", 4483362458)

    FlowTab:CreateButton({
    Name = "flow.",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")
        humanoid.WalkSpeed = 30

        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://85299714943811"
        sound.Volume = 8.5
        sound.Parent = character
        sound:Play()

        local aura = Instance.new("ParticleEmitter")
        aura.Parent = character.HumanoidRootPart
        aura.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(147, 0, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(75, 0, 130))
        })
        aura.Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(1, 3)
        })
        aura.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(1, 1)
        })
        aura.Lifetime = NumberRange.new(0.5, 1)
        aura.Rate = 50
        aura.Speed = NumberRange.new(3, 5)
        aura.SpreadAngle = Vector2.new(0, 180)
        aura.Enabled = true
        aura.CanCollide = false

        local function updateWalkSpeed()
            if humanoid then
                humanoid.WalkSpeed = 43
            end
        end

        local noclip = false
        game:GetService("UserInputService").InputBegan:Connect(function(input)
            if input.KeyCode == Enum.KeyCode.P then
                noclip = true
            end
        end)

        game:GetService("UserInputService").InputEnded:Connect(function(input)
            if input.KeyCode == Enum.KeyCode.P then
                noclip = false
            end
        end)

        game:GetService("RunService").Stepped:Connect(function()
            if noclip then
                for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
                end
            else
                for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                    part.CanCollide = true
                end
                end
            end
        end)

        game:GetService("RunService").Heartbeat:Connect(updateWalkSpeed)
    end
    })

    FlowTab:CreateButton({
    Name = "Remove Flow",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character
        if not character then return end
        
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = 16
            
            for _, track in pairs(humanoid:GetPlayingAnimationTracks()) do
                if track.Animation and track.Animation.AnimationId:match("15961487228") then
                track:Stop()
                end
            end
        end
        
        for _, sound in pairs(character:GetChildren()) do
            if sound:IsA("Sound") and sound.SoundId:match("85299714943811") then
                sound:Stop()
                sound:Destroy()
            end
        end
        
        if character:FindFirstChild("HumanoidRootPart") then
            for _, effect in pairs(character.HumanoidRootPart:GetChildren()) do
                if effect:IsA("ParticleEmitter") then
                effect:Destroy()
                end
            end
        end
        
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                if part.Name == "HumanoidRootPart" then
                part.CanCollide = false
                else
                part.CanCollide = true
                end
            end
        end
    end
    })
