local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local PlaceName = game:GetService("AssetService"):GetGamePlacesAsync(game.GameId):GetCurrentPage()[1].Name
local LocalPlayer = Players.LocalPlayer
local HttpService = game:GetService("HttpService")


getfenv().getgenv().PlaceName = PlaceName

local Window
local Esp
local Teleport
local ESPCache = {}

local Fairys = loadstring(game:HttpGet("https://raw.githubusercontent.com/0x251/Scripts/refs/heads/main/runeslayerFairy.lua"))()

local PlayerESP = {
    Enabled = false,
    Color = Color3.new(1, 1, 1),
    Font = Enum.Font.SourceSansBold,
    TextSize = 18,
    ShowDistance = true,
    ShowHealth = true,
    ShowCoins = true,
    ShowLevel = true
}

local OreESP = {
    Enabled = false,
    Color = Color3.new(1, 0, 0),
    FillTransparency = 0.5,
    OutlineTransparency = 0,
    MaxDistance = 100,
    DepthMode = "AlwaysOnTop"
}

local CharmsESP = {
    Enabled = false,
    Color = Color3.new(1, 0, 0),
    FillTransparency = 0.5,
    OutlineTransparency = 0,
    DepthMode = "AlwaysOnTop"
}


local AntiAFK = {
    Enabled = true,
    Interval = 0

}


local ClientSpoofName = false
local NoFallDamage = false

local function CreateMainWindow()
    Rayfield:Notify({
        Title = "UNIX Loaded",
        Content = "U N I X - 1.0v has loaded successfully",
        Duration = 6.5,
        Image = "eye"
    })

    Window = Rayfield:CreateWindow({
        Name = "U N I X - " .. PlaceName .. " - https://discord.gg/2sZV8k3B97",
        LoadingTitle = "U N I X - " .. PlaceName .. " - https://discord.gg/2sZV8k3B97",
        LoadingSubtitle = "by 0x256",
        Theme = {
            TextColor = Color3.fromRGB(255, 255, 255),
        
            Background = Color3.fromRGB(10, 10, 10),
            Topbar = Color3.fromRGB(15, 15, 15),
            Shadow = Color3.fromRGB(5, 5, 5),
        
            NotificationBackground = Color3.fromRGB(10, 10, 10),
            NotificationActionsBackground = Color3.fromRGB(200, 200, 200),
        
            TabBackground = Color3.fromRGB(20, 20, 20),
            TabStroke = Color3.fromRGB(25, 25, 25),
            TabBackgroundSelected = Color3.fromRGB(50, 50, 50),
            TabTextColor = Color3.fromRGB(255, 255, 255),
            SelectedTabTextColor = Color3.fromRGB(200, 200, 200),
        
            ElementBackground = Color3.fromRGB(15, 15, 15),
            ElementBackgroundHover = Color3.fromRGB(20, 20, 20),
            SecondaryElementBackground = Color3.fromRGB(10, 10, 10),
            ElementStroke = Color3.fromRGB(30, 30, 30),
            SecondaryElementStroke = Color3.fromRGB(25, 25, 25),
                    
            SliderBackground = Color3.fromRGB(40, 40, 40),
            SliderProgress = Color3.fromRGB(0, 150, 255),
            SliderStroke = Color3.fromRGB(0, 170, 255),
        
            ToggleBackground = Color3.fromRGB(20, 20, 20),
            ToggleEnabled = Color3.fromRGB(0, 150, 255),
            ToggleDisabled = Color3.fromRGB(80, 80, 80),
            ToggleEnabledStroke = Color3.fromRGB(0, 170, 255),
            ToggleDisabledStroke = Color3.fromRGB(100, 100, 100),
            ToggleEnabledOuterStroke = Color3.fromRGB(80, 80, 80),
            ToggleDisabledOuterStroke = Color3.fromRGB(50, 50, 50),
        
            DropdownSelected = Color3.fromRGB(30, 30, 30),
            DropdownUnselected = Color3.fromRGB(20, 20, 20),
        
            InputBackground = Color3.fromRGB(20, 20, 20),
            InputStroke = Color3.fromRGB(50, 50, 50),
            PlaceholderColor = Color3.fromRGB(150, 150, 150)
        },
        DisableRayfieldPrompts = true,
        DisableBuildWarnings = true,
        ConfigurationSaving = {
            Enabled = true,
            FileName = "UNIX-" .. PlaceName
        },

        Discord = {
            Enabled = true,
            Invite = "2sZV8k3B97",
            RememberJoins = true
        },
    })
    Main = Window:CreateTab("Main", "home")
    Teleport = Window:CreateTab("Teleports", "arrow-right")
    Esp = Window:CreateTab("ESP", "eye")
    Mobs = Window:CreateTab("Mobs", "axe")
    Misc = Window:CreateTab("Misc", "arrow-up-right")
end


local function SetupMainTab()
    Main:CreateSection("Main") 

    Main:CreateKeybind({
        Name = "Spawn Pet Instantly",
        CurrentKeybind = "P",
        HoldToInteract = false,
        Flag = "SpawnPetKey",
        Callback = function(key)
            enabled = not enabled
            if enabled then
                Network = require(game.ReplicatedStorage.Modules.Network)
                local plr = game:GetService("Players").LocalPlayer
                t = Network.connect("MasterEvent", "FireServer", plr.Character, {
                    ["Config"] = "WhistleCall"
                })

            end
        end
    })

    Main:CreateToggle({
        Name = "Instant Heal",
        CurrentValue = false,
        Flag = "InstantHealEnabled",
        Callback = function(enabled)
            InstantHeal = not InstantHeal


            if InstantHeal then
                Rayfield:Notify({
                    Title = "Instant Heal",
                    Content = "Will start healing you every 17 seconds, to bypass the anti-cheat.",
                    Duration = 6.5,
                    Image = "eye"
                })
            end

            while InstantHeal do
                Network = require(game.ReplicatedStorage.Modules.Network)
                local plr = game:GetService("Players").LocalPlayer

                local Data = {
                    ["player"] = game:GetService("Players").LocalPlayer,
                    ["Object"] = workspace:WaitForChild("Map"):WaitForChild("ElfVillage"):WaitForChild("Bed"),
                    ["Action"] = "Sleep"
                }
                t = Network.connect("Interact", "FireServer", plr.Character, Data)
                task.wait(17)
            end

        end
    })
    
end



local function SetupTeleportTab()


    Teleport:CreateSection("Teleports")


    local function fetchValidTargets()
        local validNames = {}
        for _, user in ipairs(Players:GetPlayers()) do
            if user ~= LocalPlayer then
                table.insert(validNames, user.Name)
            end
        end
        return validNames
    end

    local selectedPlayer = nil
    local movementLoop = nil
    local walkLoop = nil
    local originalPhysics = nil
    local travelRate = 16.5
    local baseSpeed = 8.5
    local walkSpeed = 16

    Teleport:CreateSlider({
        Name = "Teleport Speed",
        Range = {5, 60},
        Increment = 0.5,
        Suffix = " studs/s",
        CurrentValue = 16.5,
        Flag = "TeleportSpeed",
        Callback = function(newValue)
            travelRate = newValue
            baseSpeed = newValue / 2
        end
    })


    Misc:CreateSection("Character")

    Misc:CreateSlider({
        Name = "Walk Speed",
        Range = {16, 300},
        Increment = 1,
        Suffix = " studs/s",
        CurrentValue = 16,
        Flag = "WalkSpeed",
        Callback = function(newValue)
            walkSpeed = newValue
            if walkLoop then
                walkLoop:Disconnect()
                walkLoop = nil
            end
            
            if newValue > 16 then
                local attachment0 = Instance.new("Attachment")
                attachment0.Position = Vector3.new(-0.5, 0, 0)
                
                local attachment1 = Instance.new("Attachment")
                attachment1.Position = Vector3.new(0.5, 0, 0)
                
                local trail = Instance.new("Trail")
                trail.Lifetime = 0.5
                trail.Transparency = NumberSequence.new(0.7)
                trail.Color = ColorSequence.new(Color3.new(1, 1, 1))
                trail.MinLength = 0.1
                trail.FaceCamera = true
                trail.Attachment0 = attachment0
                trail.Attachment1 = attachment1
                
                walkLoop = RunService.Heartbeat:Connect(function(delta)
                    if LocalPlayer.Character then
                        local root = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                        
                        if root and humanoid then
                            if not attachment0.Parent then
                                attachment0.Parent = root
                                attachment1.Parent = root
                                trail.Parent = root
                            end
                            
                            local moveDirection = humanoid.MoveDirection
                            if moveDirection.Magnitude > 0 then
                                local velocity = moveDirection.Unit * walkSpeed
                                local gravity = Vector3.new(0, -workspace.Gravity * delta, 0)
                                root.Velocity = Vector3.new(velocity.X, root.Velocity.Y + gravity.Y, velocity.Z)
                                root.CFrame = CFrame.lookAt(root.Position, root.Position + moveDirection)
                                
                                if walkSpeed > 100 then
                                    trail.Enabled = true
                                else
                                    trail.Enabled = false
                                end
                            else
                                trail.Enabled = false
                            end
                        end
                    end
                end)
            end
        end
    })


    local UserInputService = game:GetService("UserInputService")
    
    local player = Players.LocalPlayer
    local moveDirection = {
        forward = Vector3.new(),
        backward = Vector3.new(),
        left = Vector3.new(),
        right = Vector3.new(),
        up = Vector3.new(),
        down = Vector3.new(),
    }
    
    local enabled = false
    local speed = 70
    local humanoidRoot
    local coordinate
    local humanoid
    local lastValidPosition
    

    local function getUnitDirection()
        local sum = Vector3.new()
        for _, v3 in pairs(moveDirection) do
            sum = sum + v3
        end
        return sum.Magnitude > 0 and sum.Unit or sum
    end
    
    local function resetCoordinate()
        if not humanoidRoot then return end
        local cameraCFrame = Workspace.CurrentCamera.CFrame
        coordinate = CFrame.fromMatrix(humanoidRoot.Position, cameraCFrame.XVector, cameraCFrame.YVector, cameraCFrame.ZVector)
        lastValidPosition = coordinate.Position
    end
    

    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.KeyCode == Enum.KeyCode.W then
            moveDirection.forward = Vector3.new(0, 0, -1)
        elseif input.KeyCode == Enum.KeyCode.S then
            moveDirection.backward = Vector3.new(0, 0, 1)
        elseif input.KeyCode == Enum.KeyCode.A then
            moveDirection.left = Vector3.new(-1, 0, 0)
        elseif input.KeyCode == Enum.KeyCode.D then
            moveDirection.right = Vector3.new(1, 0, 0)
        elseif input.KeyCode == Enum.KeyCode.Q then
            moveDirection.up = Vector3.new(0, -1, 0)
        elseif input.KeyCode == Enum.KeyCode.E then
            moveDirection.down = Vector3.new(0, 1, 0)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        local code = input.KeyCode
        if code == Enum.KeyCode.W then
            moveDirection.forward = Vector3.new()
        elseif code == Enum.KeyCode.S then
            moveDirection.backward = Vector3.new()
        elseif code == Enum.KeyCode.A then
            moveDirection.left = Vector3.new()
        elseif code == Enum.KeyCode.D then
            moveDirection.right = Vector3.new()
        elseif code == Enum.KeyCode.Q then
            moveDirection.up = Vector3.new()
        elseif code == Enum.KeyCode.E then
            moveDirection.down = Vector3.new()
        end
    end)
    

    RunService.Heartbeat:Connect(function(deltaTime)
        if enabled and humanoidRoot and coordinate then
            local cameraCFrame = Workspace.CurrentCamera.CFrame
            local direction = getUnitDirection()
            
            if direction.Magnitude > 0 then
                local offset = direction * speed * deltaTime
                coordinate = CFrame.fromMatrix(coordinate.Position, cameraCFrame.XVector, cameraCFrame.YVector, cameraCFrame.ZVector) * CFrame.new(offset.X, offset.Y, offset.Z)
                lastValidPosition = coordinate.Position
            end
            
            humanoidRoot.AssemblyLinearVelocity = Vector3.new()
            humanoidRoot.CFrame = coordinate
        end
    end)
    

    player.CharacterAdded:Connect(function(character)
        humanoidRoot = character:WaitForChild("HumanoidRootPart")
        humanoid = character:WaitForChild("Humanoid")
        resetCoordinate()
    end)
    
    if player.Character then
        humanoidRoot = player.Character:FindFirstChild("HumanoidRootPart")
        humanoid = player.Character:FindFirstChild("Humanoid")
        resetCoordinate()
    end
    

    Misc:CreateKeybind({
        Name = "Fly Bypass",
        CurrentKeybind = "T",
        HoldToInteract = false,
        Flag = "FlyBypassKey",
        Callback = function(key)
            enabled = not enabled
            if enabled then
                resetCoordinate()
                if humanoid then
                    humanoid.PlatformStand = true
                    humanoid.AutoRotate = false
                end
            else
                if humanoid then
                    humanoid.PlatformStand = false
                    humanoid.AutoRotate = true
                    if humanoidRoot and lastValidPosition then
                        humanoidRoot.CFrame = CFrame.new(lastValidPosition)
                        humanoidRoot.AssemblyLinearVelocity = Vector3.new()
                    end
                end
            end
        end
    })

    Misc:CreateToggle({
        Name = "No Fall Damage",
        CurrentValue = false,
        Flag = "NoFallDamageEnabled",
        Callback = function(enabled)
            NoFallDamage = enabled

            if enabled then
                local value = Instance.new("StringValue")
                value.Parent = workspace.Alive[LocalPlayer.Name]
                value.Name = "NoFall"
            else
                workspace.Alive[LocalPlayer.Name].NoFall:Destroy()
            end
        end
    })

    local hitboxConnection = nil

    Misc:CreateToggle({
        Name = "Show Hitbox's",
        CurrentValue = false,
        Flag = "ShowHitboxEnabled",
        Callback = function(enabled)

            showhitbox = not showhitbox

            if showhitbox then

                hitboxConnection = workspace.Effects.ChildAdded:Connect(function(v)
                    if v.Name == "HitBox" then
                        v.Transparency = 0.25
                    end
                end)
            else
                if hitboxConnection then
                    hitboxConnection:Disconnect()
                    hitboxConnection = nil
                end
            end

        end
    })


    
    
    Misc:CreateSection("Protection")
    
    local VirtualUser = game:GetService("VirtualUser")
    local VirtualInputManager = game:GetService("VirtualInputManager")

    local AntiAFKConnection
    local LP

    AntiAFK = Misc:CreateToggle({
        Name = "Anti AFK",
        CurrentValue = false,
        Flag = "AntiAFKEnabled",
        Callback = function(value)
            if value then
                if AntiAFKConnection then
                    AntiAFKConnection:Disconnect()
                end
                AntiAFKConnection = LocalPlayer.Idled:Connect(function()
                    VirtualUser:CaptureController()
                    VirtualUser:ClickButton2(Vector2.zero)
                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.RightMeta, false, game)
                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.RightMeta, false, game)
                    LP = tick()
                end)
            else
                if AntiAFKConnection then
                    AntiAFKConnection:Disconnect()
                    AntiAFKConnection = nil
                end
            end
        end
    })

    Misc:CreateToggle({
        Name = "Spoof Name (Client Side)",
        CurrentValue = false,
        Flag = "SpoofNameEnabled",
        Callback = function(enabled)
            ClientSpoofName = enabled
            local playerNameLabel = game:GetService("Players").LocalPlayer.PlayerGui.GUI.MainFrame.Level.PlayerName
            local playerNameDisplayName = game:GetService("Players").LocalPlayer.DisplayName

            local Alive_Name = workspace.Alive[playerNameDisplayName].BoolValues.PlayerName

            if ClientSpoofName then
                if not getgenv().originalPlayerName then
                    getgenv().originalPlayerName = playerNameLabel.Text
                end
    
                local rainbowConnection
                rainbowConnection = RunService.RenderStepped:Connect(function()
                    if not playerNameLabel or not playerNameLabel.Parent then
                        if rainbowConnection then
                            rainbowConnection:Disconnect()
                        end
                        return
                    end
                    
                    local hue = (tick() % 5) / 5
                    local color = Color3.fromHSV(hue, 1, 1)
                    playerNameLabel.Text = "U N I X"
                    playerNameLabel.TextColor3 = color
                    
                    if Alive_Name then
                        Alive_Name.Value = "U N I X"
                       
                    end
                end)
                
                if not _G.StoredRainbowConnection then
                    _G.StoredRainbowConnection = rainbowConnection
                else
                    _G.StoredRainbowConnection:Disconnect()
                    _G.StoredRainbowConnection = rainbowConnection
                end
            else
                if _G.StoredRainbowConnection then
                    _G.StoredRainbowConnection:Disconnect()
                    _G.StoredRainbowConnection = nil
                end
                
                local playerName = game:GetService("Players").LocalPlayer.DisplayName or game:GetService("Players").LocalPlayer.Name
                playerNameLabel.Text = playerName
                playerNameLabel.TextColor3 = Color3.new(1, 1, 1)

                Alive_Name.Value = playerName
            end
        end
    })


    Misc:CreateSection("Stats")

    local Stats = game:GetService("Stats")
    local Labels = {
        Ping = Misc:CreateLabel("Ping: 0 ms", "wifi"),
        FPS = Misc:CreateLabel("FPS: 0/s", "monitor"),
        Memory = Misc:CreateLabel("Memory: 0 MB", "database")
    }

    task.spawn(function()
        while task.wait(0.25) do
            local performance = {
                Ping = math.floor(Stats.PerformanceStats.Ping:GetValue() * 100) / 100,
                FPS = math.floor(1 / Stats.FrameTime * 10) / 10,
                Memory = math.floor(Stats:GetTotalMemoryUsageMb() * 10) / 10
            }

            Labels.Ping:Set(string.format("Ping: %.2f ms", performance.Ping))
            Labels.FPS:Set(string.format("FPS: %.1f/s", performance.FPS))
            Labels.Memory:Set(string.format("Memory: %.1f MB", performance.Memory))
        end
    end)


    

    local PlayerSelector = Teleport:CreateDropdown({
        Name = "Select Player",
        Options = fetchValidTargets(),
        CurrentOption = {"Select a Player"},
        MultipleOptions = false,
        Flag = "PlayerTeleportList",
        Callback = function(choice)
            if choice[1] == selectedPlayer then
                if movementLoop then
                    movementLoop:Disconnect()
                    movementLoop = nil
                end
                if originalPhysics and LocalPlayer.Character then
                    LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CanCollide = originalPhysics
                end
                selectedPlayer = nil
                PlayerSelector:Set({})
                return
            end

            selectedPlayer = choice[1]
            local destinationUser = Players:FindFirstChild(selectedPlayer)
            
            if destinationUser and destinationUser.Character then
                local playerTorso = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if playerTorso then
                    originalPhysics = playerTorso.CanCollide
                    playerTorso.CanCollide = false
                end

                movementLoop = RunService.Heartbeat:Connect(function()
                    local playerTorso = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    local targetTorso = destinationUser.Character:FindFirstChild("HumanoidRootPart")
                    local body = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                    
                    if not playerTorso or not targetTorso or not body then
                        if movementLoop then
                            movementLoop:Disconnect()
                            movementLoop = nil
                        end
                        selectedPlayer = nil
                        PlayerSelector:Set({})
                        return
                    end

                    for _, component in ipairs(LocalPlayer.Character:GetDescendants()) do
                        if component:IsA("BasePart") then
                            component.CanCollide = false
                            component.CanTouch = false
                        end
                    end

                    local trajectory = (targetTorso.Position - playerTorso.Position).Unit
                    local gap = (targetTorso.Position - playerTorso.Position).Magnitude
                    
                    local heightMod = math.sin(tick()*5)*0.12 + 0.25
                    local positionJitter = Vector3.new(math.random(-0.3,0.3), 0, math.random(-0.3,0.3))
                    
                    body.PlatformStand = true
                    playerTorso.Velocity = trajectory * travelRate + Vector3.new(0, heightMod, 0)
                    
                    local smoothPosition = CFrame.lookAt(
                        playerTorso.Position + (trajectory * (travelRate * 0.15)) + positionJitter,
                        targetTorso.Position + positionJitter
                    ) * CFrame.Angles(
                        math.rad(math.random(-2,2)), 
                        math.rad(math.random(-15,15)), 
                        math.rad(math.random(-2,2))
                    )

                    playerTorso.CFrame = smoothPosition:Lerp(playerTorso.CFrame, 0.7)

                    if gap < 18 then
                        playerTorso.CFrame = targetTorso.CFrame + Vector3.new(
                            math.random(-1.2,1.2), 
                            2.75 + math.random()*0.3, 
                            math.random(-1.2,1.2)
                        )
                        task.wait(math.random() * 0.15 + 0.05)
                        playerTorso.Velocity = Vector3.new(0, -9.5, 0)
                        task.wait(math.random() * 0.15 + 0.05)
                        playerTorso.CFrame = targetTorso.CFrame + Vector3.new(0, 0.85, 0)
                        
                        if movementLoop then
                            movementLoop:Disconnect()
                            movementLoop = nil
                        end
                        if originalPhysics then
                            playerTorso.CanCollide = originalPhysics
                        end
                        body.PlatformStand = false
                        selectedPlayer = nil
                        PlayerSelector:Set({})
                    end
                end)
            end
        end
    })

    local BoardSelector = Teleport:CreateDropdown({
        Name = "Select Board",
        Options = (function()
            local boards = {}
            for _, child in ipairs(workspace.Boards:GetChildren()) do
                table.insert(boards, child.Name)
            end
            return boards
        end)(),
        CurrentOption = {"Select a Board"},
        MultipleOptions = false,
        Flag = "BoardTeleportList",
        Callback = function(choice)
            if choice[1] == selectedBoard then
                if movementLoop then
                    movementLoop:Disconnect()
                    movementLoop = nil
                end
                if originalPhysics and LocalPlayer.Character then
                    LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CanCollide = originalPhysics
                end
                selectedBoard = nil
                BoardSelector:Set({})
                return
            end

            selectedBoard = choice[1]
            local targetBoard = workspace.Boards:FindFirstChild(selectedBoard)
            
            if targetBoard then
                local playerTorso = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if playerTorso then
                    originalPhysics = playerTorso.CanCollide
                    playerTorso.CanCollide = false
                end

                movementLoop = RunService.Heartbeat:Connect(function()
                    local playerTorso = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    local body = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                    local boardPosition = targetBoard.PrimaryPart.Position
                    
                    if not playerTorso or not body or not targetBoard.Parent then
                        if movementLoop then
                            movementLoop:Disconnect()
                            movementLoop = nil
                        end
                        selectedBoard = nil
                        BoardSelector:Set({})
                        return
                    end

                    for _, component in ipairs(LocalPlayer.Character:GetDescendants()) do
                        if component:IsA("BasePart") then
                            component.CanCollide = false
                            component.CanTouch = false
                        end
                    end

                    local trajectory = (boardPosition - playerTorso.Position).Unit
                    local gap = (boardPosition - playerTorso.Position).Magnitude
                    
                    local heightMod = math.sin(tick()*5)*0.12 + 0.25
                    local positionJitter = Vector3.new(math.random(-0.3,0.3), 0, math.random(-0.3,0.3))
                    
                    body.PlatformStand = true
                    playerTorso.Velocity = trajectory * travelRate + Vector3.new(0, heightMod, 0)
                    
                    local smoothPosition = CFrame.lookAt(
                        playerTorso.Position + (trajectory * (travelRate * 0.15)) + positionJitter,
                        boardPosition + positionJitter
                    ) * CFrame.Angles(
                        math.rad(math.random(-2,2)), 
                        math.rad(math.random(-15,15)), 
                        math.rad(math.random(-2,2))
                    )

                    playerTorso.CFrame = smoothPosition:Lerp(playerTorso.CFrame, 0.7)

                    if gap < 18 then
                        playerTorso.CFrame = CFrame.new(boardPosition) + Vector3.new(
                            math.random(-1.2,1.2), 
                            2.75 + math.random()*0.3, 
                            math.random(-1.2,1.2)
                        )
                        task.wait(math.random() * 0.15 + 0.05)
                        playerTorso.Velocity = Vector3.new(0, -9.5, 0)
                        task.wait(math.random() * 0.15 + 0.05)
                        playerTorso.CFrame = CFrame.new(boardPosition) + Vector3.new(0, 0.85, 0)
                        
                        if movementLoop then
                            movementLoop:Disconnect()
                            movementLoop = nil
                        end
                        if originalPhysics then
                            playerTorso.CanCollide = originalPhysics
                        end
                        body.PlatformStand = false
                        selectedBoard = nil
                        BoardSelector:Set({})
                    end
                end)
            end
        end
    })

    local function updatePlayerOptions()
        task.wait(math.random(0.3, 0.7))
        PlayerSelector:Refresh(fetchValidTargets())
        if selectedPlayer and not Players:FindFirstChild(selectedPlayer) then
            PlayerSelector:Set({})
            selectedPlayer = nil
        end
    end

    Players.PlayerAdded:Connect(updatePlayerOptions)
    Players.PlayerRemoving:Connect(updatePlayerOptions)
end
local function SetupMobsTab()
    Mobs:CreateSection("Mobs")

    local initialHitboxSize = 10
    local hitboxConnection
    local mobFilter = function(mob)
        return mob:IsA("Model") and not game.Players:GetPlayerFromCharacter(mob)
    end

    local autoFarmEnabled = false
    local farmConnection
    local currentMob
    local targetMobs = {}
    local travelSpeed = 60
    local nameLookup = {}
    local cleanedNames = {}
    local currentMobTime = 0
    local lastMobFoundTime = 0

    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local MobsFolder = ReplicatedStorage:WaitForChild("Storage"):WaitForChild("Mobs")

    
    local mobDropdown = Mobs:CreateDropdown({
        Name = "Select Mobs",
        Options = {"No mobs available"},
        CurrentOption = {},
        MultipleOptions = true,
        Flag = "MobTargetList",
        Callback = function(Options)
            targetMobs = Options
            currentMob = nil
            if autoFarmEnabled and farmConnection then
                farmConnection:Disconnect()
                farmConnection = RunService.Heartbeat:Connect(autoFarmLoop)
                
                if #targetMobs == 0 and LocalPlayer.Character then
                    local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                    local rootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if humanoid and rootPart then
                        humanoid.PlatformStand = false
                        rootPart.Velocity = Vector3.new(0, 0, 0)
                        for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.CanCollide = true
                                part.CanTouch = true
                            end
                        end
                    end
                end
            end
        end
    })
    
    local function refreshMobList()
        local mobNames = {}
        local existing = {}
        local currentNames = {}
    
        for _, mob in ipairs(MobsFolder:GetChildren()) do
            if mobFilter(mob) and mob.Name:find("%S") then
                local cleanName = mob.Name:gsub("%..*", "")
                currentNames[cleanName] = true
                if not existing[cleanName] then
                    table.insert(mobNames, cleanName)
                    existing[cleanName] = true
                end
                nameLookup[cleanName] = nameLookup[cleanName] or {}
                if not table.find(nameLookup[cleanName], mob.Name) then
                    table.insert(nameLookup[cleanName], mob.Name)
                end
                cleanedNames[mob.Name] = cleanName
            end
        end
    
        for cleanName in pairs(nameLookup) do
            if not currentNames[cleanName] and not table.find(mobNames, cleanName) then
                table.insert(mobNames, cleanName)
            end
        end
    
        mobDropdown:Refresh(#mobNames > 0 and mobNames or {"No mobs available"})
    end
    
    local function getMobCollisionPart(mob)
        local torso = mob:FindFirstChild("Torso")
        return torso and torso:FindFirstChild("CollisionPart")
    end
    
    local function updateMobHitbox(mob)
        local collisionPart = getMobCollisionPart(mob)
        if collisionPart then
            collisionPart.Size = Vector3.new(initialHitboxSize, initialHitboxSize, initialHitboxSize)
            collisionPart.CanCollide = false
        end
    end
    



    local function processExistingMobs()
        for _, mob in ipairs(workspace.Alive:GetChildren()) do
            if mobFilter(mob) then
                updateMobHitbox(mob)
            end
        end
    end



    local mobFilter = function(mob)
        return mob:IsA("Model") 
            and not game.Players:GetPlayerFromCharacter(mob)
            and mob:FindFirstChild("Torso")
            and mob.Torso:FindFirstChild("CollisionPart")
    end


    Mobs:CreateSlider({
        Name = "Auto Farm Speed",
        Range = {10, 200},
        Increment = 10,
        CurrentValue = travelSpeed,
        Flag = "FarmSpeed",
        Callback = function(value)
            travelSpeed = value
        end
    })




    local function smoothMoveTo(position)
        local character = LocalPlayer.Character
        local rootPart = character and character:FindFirstChild("HumanoidRootPart")
        if not rootPart then return end

        local camera = workspace.CurrentCamera
        local direction = (position - rootPart.Position)
        local distance = direction.Magnitude
        direction = direction.Unit
        local right = camera.CFrame.RightVector
        local forward = camera.CFrame.LookVector
        local moveVector = (forward * direction.Z) + (right * direction.X)
        local baseSpeed = travelSpeed * 0.15
        local speedMod = math.min(1, distance / 10)
        local smoothOffset = moveVector * (baseSpeed * speedMod)
        local hover = Vector3.new(0, math.sin(tick() * 5) * 0.2, 0)
        local jitter = Vector3.new(
            math.random(-0.05, 0.05),
            math.random(-0.05, 0.05),
            math.random(-0.05, 0.05)
        )
        local newCFrame = CFrame.new(rootPart.Position + smoothOffset + hover + jitter)
        rootPart.CFrame = rootPart.CFrame:Lerp(newCFrame, 0.3)
        rootPart.Orientation += Vector3.new(
            math.random(-0.5, 0.5),
            math.random(-1, 1),
            math.random(-0.5, 0.5)
        )
    end

    local function maintainNaturalState()
        local character = LocalPlayer.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        local rootPart = character and character:FindFirstChild("HumanoidRootPart")
        
        if humanoid and rootPart then
            humanoid.PlatformStand = true
            humanoid.AutoRotate = false
            
            local floatOffset = Vector3.new(
                math.sin(tick() * 2) * 0.3,
                math.cos(tick() * 2.5) * 0.4,
                math.cos(tick() * 2) * 0.3
            )
            rootPart.Position += floatOffset
        end
    end

    local function autoFarmLoop()
        local character = LocalPlayer.Character
        local rootPart = character and character:FindFirstChild("HumanoidRootPart")
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        local now = tick()
        
        if not rootPart or not humanoid then return end

    
        if #targetMobs == 0 then
            for _, component in ipairs(character:GetDescendants()) do
                if component:IsA("BasePart") then
                    component.CanCollide = true
                    component.CanTouch = true
                end
            end
            humanoid.PlatformStand = false
            rootPart.Velocity = Vector3.new(0,0,0)
            return
        end

        for _, component in ipairs(character:GetDescendants()) do
            if component:IsA("BasePart") then
                component.CanCollide = false
                component.CanTouch = false
            end
        end

        if currentMob and (not currentMob:FindFirstChild("Humanoid") or currentMob.Humanoid.Health <= 0 or (rootPart.Position - currentMob:GetPivot().Position).Magnitude > 150 or (now - currentMobTime) > 3) then
            currentMob = nil
        end
        humanoid.PlatformStand = true
        humanoid.AutoRotate = false
        rootPart.AssemblyLinearVelocity = Vector3.new()
        rootPart.AssemblyAngularVelocity = Vector3.new()
        local closestDistance = math.huge
        local closestMob = nil
        
        for _, mob in ipairs(workspace.Alive:GetChildren()) do
            if mobFilter(mob) and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                local cleanName = mob.Name:gsub("%..*", "")
                if table.find(targetMobs, cleanName) then
                    local mobRoot = mob:FindFirstChild("HumanoidRootPart") or mob:GetPivot()
                    local distance = (rootPart.Position - mobRoot.Position).Magnitude
                 
                    if mob:FindFirstChild("Pet") ~= nil then
                        currentMob = nil
                    end

                    if mob:FindFirstChild("Species") ~= cleanName then
                        currentMob = nil
                    end
                    
                    if distance < closestDistance then
                        closestDistance = distance
                        closestMob = mob
                    end
                end
            end
        end
    
        currentMob = closestMob
    
        if currentMob then
            local mobRoot = currentMob:FindFirstChild("HumanoidRootPart") or currentMob:GetPivot()
            local targetPosition = mobRoot.Position + Vector3.new(0, 3, 0)
            local direction = (targetPosition - rootPart.Position)
            local distance = direction.Magnitude
        
            local lookCFrame = CFrame.lookAt(rootPart.Position, targetPosition)
            local baseOrientation = lookCFrame - lookCFrame.Position
            local orbitRadius = 2.5
            local orbitSpeed = 0.5 
            local dodgeHeight = math.sin(tick() * 5) * 1.5
        
            if distance < 15 then
       
                local angle = tick() * orbitSpeed % (math.pi * 2)
                local orbitOffset = Vector3.new(
                    math.cos(angle) * orbitRadius,
                    3 + dodgeHeight,
                    math.sin(angle) * orbitRadius
                )
        
                local combatPosition = targetPosition + orbitOffset
                local combatCFrame = CFrame.new(combatPosition) * baseOrientation
                
                if math.sin(tick() * 3) > 0.7 then
                    combatCFrame = combatCFrame * CFrame.new(0, 0, -2)
                    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
        
                rootPart.CFrame = rootPart.CFrame:Lerp(combatCFrame, 0.3)
                
                rootPart.Orientation = Vector3.new(
                    math.clamp(rootPart.Orientation.X, -10, 10),
                    rootPart.Orientation.Y,
                    math.clamp(rootPart.Orientation.Z, -10, 10)
                )

            else
                local approachSpeed = travelSpeed * 0.25
                local moveStep = direction.Unit * (approachSpeed * 0.1)
                rootPart.CFrame = rootPart.CFrame:Lerp(CFrame.new(rootPart.Position + moveStep) * baseOrientation, 0.3)
            end
            
        else 
            for _, component in ipairs(character:GetDescendants()) do
                if component:IsA("BasePart") then
                    component.CanCollide = true
                    component.CanTouch = true
                end
            end
            humanoid.PlatformStand = false
            humanoid.AutoRotate = true
            rootPart.AssemblyLinearVelocity = Vector3.new()
        end
                
        task.wait(math.random() * 0.1)
        rootPart.AssemblyLinearVelocity = Vector3.new()
        
    end

    Mobs:CreateToggle({
        Name = "Auto Farm",
        CurrentValue = false,
        Flag = "AutoFarmEnabled",
        Callback = function(enabled)
            autoFarmEnabled = enabled
            if enabled then
                lastMobFoundTime = tick()
                farmConnection = RunService.Heartbeat:Connect(function()
                    pcall(autoFarmLoop) 
                end)
            else
                if farmConnection then
                    farmConnection:Disconnect()
                    farmConnection = nil
                end
                local character = LocalPlayer.Character
                if character then
                    local humanoid = character:FindFirstChildOfClass("Humanoid")
                    local rootPart = character:FindFirstChild("HumanoidRootPart")
                    if humanoid and rootPart then
                        humanoid.PlatformStand = false
                        humanoid.AutoRotate = true
                        rootPart.AssemblyLinearVelocity = Vector3.new()
                        humanoid:ChangeState(Enum.HumanoidStateType.Running)
                    end
                end
                currentMob = nil
            end
        end
    })

    local autoClickerEnabled = false
    local autoClickerConnection
    Mobs:CreateKeybind({
        Name = "Auto Attack",
        CurrentKeybind = "Zero",
        HoldToInteract = false,
        Flag = "AutoClickerKeybind",
        Callback = function()
            autoClickerEnabled = not autoClickerEnabled
            if autoClickerEnabled then
                autoClickerConnection = RunService.Heartbeat:Connect(function()
                    game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, true, nil, false)
                end)
            else
                if autoClickerConnection then
                    autoClickerConnection:Disconnect()
                    autoClickerConnection = nil
                end
            end
        end
    })

    refreshMobList()
    
end

local function SetupESPTab()
    
    local function CreatePlayerESPControls()
        Esp:CreateSection("Player ESP Settings")
        Esp:CreateToggle({
            Name = "Enable Player ESP",
            CurrentValue = false,
            Flag = "PlayerESPEnabled",
            Callback = function(Value)
                PlayerESP.Enabled = Value
                for _, espData in pairs(ESPCache) do
                    if espData.billboard then
                        espData.billboard.Enabled = Value
                    end
                end
            end
        })

        Esp:CreateColorPicker({
            Name = "Text Color",
            Color = PlayerESP.Color,
            Flag = "PlayerESPColor",
            Callback = function(Value)
                PlayerESP.Color = Value
            end
        })

        Esp:CreateSlider({
            Name = "Text Size",
            Range = {10, 24},
            Increment = 1,
            Suffix = "px",
            CurrentValue = 18,
            Flag = "PlayerESPSize",
            Callback = function(Value)
                PlayerESP.TextSize = Value
            end
        })
    end

    local function CreateDisplayOptions()
        Esp:CreateSection("Display Options")
        Esp:CreateToggle({
            Name = "Show Distance",
            CurrentValue = true,
            Flag = "PlayerESPDistance",
            Callback = function(Value)
                PlayerESP.ShowDistance = Value
            end
        })

        Esp:CreateToggle({
            Name = "Show Health",
            CurrentValue = true,
            Flag = "PlayerESPHealth",
            Callback = function(Value)
                PlayerESP.ShowHealth = Value
            end
        })
    end
    local function CreateCharmsControls()
        Esp:CreateSection("Charms Settings")
        Esp:CreateToggle({
            Name = "Charms ESP",
            CurrentValue = false,
            Flag = "CharmsESPEnabled",
            Callback = function(Value)
                CharmsESP.Enabled = Value
                for _, espData in pairs(ESPCache) do
                    if espData.highlight then
                        espData.highlight.Enabled = Value
                        espData.highlight.DepthMode = CharmsESP.DepthMode
                    end
                end
            end
        })

        Esp:CreateColorPicker({
            Name = "Charms Color",
            Color = CharmsESP.Color,
            Flag = "CharmsESPColor",
            Callback = function(Value)
                CharmsESP.Color = Value
                for _, espData in pairs(ESPCache) do
                    if espData.highlight then
                        espData.highlight.FillColor = Value
                        espData.highlight.OutlineColor = Value
                    end
                end
            end
        })

        Esp:CreateDropdown({
            Name = "Outline Mode",
            Options = {"Solid", "Neon", "Classic"},
            CurrentValue = "Solid",
            Flag = "CharmsOutlineMode",
            Callback = function(Value)
                for _, espData in pairs(ESPCache) do
                    if espData.highlight then
                        if Value == "Neon" then
                            espData.highlight.OutlineTransparency = 0
                            espData.highlight.FillTransparency = 0.2
                        elseif Value == "Classic" then
                            espData.highlight.OutlineTransparency = 0.5
                        end
                    end
                end
            end
        })

        Esp:CreateSlider({
            Name = "Fill Transparency",
            Range = {0, 1},
            Increment = 0.1,
            CurrentValue = 0.5,
            Flag = "CharmsFill",
            Callback = function(Value)
                CharmsESP.FillTransparency = Value
                for _, espData in pairs(ESPCache) do
                    if espData.highlight then
                        espData.highlight.FillTransparency = Value
                    end
                end
            end
        })

        Esp:CreateSlider({
            Name = "Outline Transparency",
            Range = {0, 1},
            Increment = 0.1,
            CurrentValue = 0,
            Flag = "CharmsOutline",
            Callback = function(Value)
                CharmsESP.OutlineTransparency = Value
                for _, espData in pairs(ESPCache) do
                    if espData.highlight then
                        espData.highlight.OutlineTransparency = Value
                    end
                end
            end
        })

        Esp:CreateSection("Advanced Charms")
        Esp:CreateToggle({
            Name = "Pulse Effect",
            CurrentValue = false,
            Flag = "CharmsPulse",
            Callback = function(Value)
                CharmsESP.PulseEnabled = Value
            end
        })

        Esp:CreateSlider({
            Name = "Pulse Speed",
            Range = {1, 10},
            Increment = 1,
            CurrentValue = 5,
            Flag = "CharmsPulseSpeed",
            Callback = function(Value)
                CharmsESP.PulseSpeed = Value
            end
        })

        Esp:CreateToggle({
            Name = "Dynamic Glow",
            CurrentValue = false,
            Flag = "CharmsGlow",
            Callback = function(Value)
                CharmsESP.GlowEnabled = Value
                for _, espData in pairs(ESPCache) do
                    if espData.highlight then
                        espData.highlight.FillTransparency = Value and 0.8 or CharmsESP.FillTransparency
                    end
                end
            end
        })
        Esp:CreateSection("Mob ESP")
        
        local MobESP = {
            Color = Color3.new(1, 0, 0),
            FillTransparency = 0.5,
            OutlineTransparency = 0.5,
            TrackedMobs = {}
        }

        local function UpdateMobText(mob, humanoid, textLabel)
            local health = humanoid and humanoid.Health or 0
            local player = game.Players.LocalPlayer
            local playerRoot = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            local mobRoot = mob:FindFirstChild("HumanoidRootPart")
            
            local distance = (playerRoot and mobRoot) and (playerRoot.Position - mobRoot.Position).Magnitude or 0
            local sizeMultiplier = math.clamp(1.3 - (distance / 100), 0.4, 1.3)
            
            local healthColor = health > 50 and Color3.new(0, 1, 0) or health > 20 and Color3.new(1, 1, 0) or Color3.new(1, 0, 0)
            
            textLabel.Text = string.format("%s \nHP: %d%%\n  Ds: %dm", 
                mob.Name:match("^[^.]+"):upper(),
                math.floor((health/humanoid.MaxHealth)*100),
                math.floor(distance)
            )
            
            textLabel.TextColor3 = healthColor
            textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
            textLabel.TextStrokeTransparency = 0.2
            textLabel.TextXAlignment = Enum.TextXAlignment.Center
            textLabel.TextYAlignment = Enum.TextYAlignment.Center
            textLabel.Font = Enum.Font.SciFi
            textLabel.TextSize = 24 * sizeMultiplier
            textLabel.TextScaled = false
            textLabel.BackgroundTransparency = 1
            textLabel.Size = UDim2.new(1.5 * sizeMultiplier, 0, 1.5 * sizeMultiplier, 0)
        end

        local function ApplyMobESP(mob)
            if not mob:IsA("Model") then return end
            
            local humanoidRootPart = mob:FindFirstChild("HumanoidRootPart")
            local humanoid = mob:FindFirstChildOfClass("Humanoid")
            
            if not humanoidRootPart or not humanoid then return end

            local highlight = Instance.new("Highlight")
            highlight.Adornee = mob
            highlight.FillColor = MobESP.Color
            highlight.OutlineColor = MobESP.Color
            highlight.FillTransparency = MobESP.FillTransparency
            highlight.OutlineTransparency = MobESP.OutlineTransparency
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Parent = humanoidRootPart

            local billboard = Instance.new("BillboardGui")
            billboard.Adornee = humanoidRootPart
            billboard.Size = UDim2.new(6, 0, 3, 0)
            billboard.StudsOffset = Vector3.new(0, 3, 0)
            billboard.AlwaysOnTop = true
            billboard.Parent = humanoidRootPart
            
            local textLabel = Instance.new("TextLabel")
            textLabel.Size = UDim2.new(1, 0, 1, 0)
            textLabel.BackgroundTransparency = 1
            textLabel.Text = mob.Name:gsub("%..*", "")
            textLabel.TextColor3 = MobESP.Color
            textLabel.Font = Enum.Font.SourceSansBold
            textLabel.TextSize = 18
            textLabel.Parent = billboard
            
            local connection
            connection = game:GetService("RunService").Heartbeat:Connect(function()
                if MobESP.TrackedMobs[mob] and mob:FindFirstChild("HumanoidRootPart") then
                    if humanoid then
                        UpdateMobText(mob, humanoid, textLabel)
                    end
                else
                    connection:Disconnect()
                end
            end)
            MobESP.TrackedMobs[mob] = {highlight = highlight, billboard = billboard, connection = connection}
        end

        local function RemoveMobESP(mob)
            local espData = MobESP.TrackedMobs[mob]
            if espData then
                if espData.highlight then
                    espData.highlight:Destroy()
                end
                if espData.billboard then
                    espData.billboard:Destroy()
                end
                if espData.connection then
                    espData.connection:Disconnect()
                end
                MobESP.TrackedMobs[mob] = nil
            end
        end

        Esp:CreateToggle({
            Name = "Mob ESP",
            CurrentValue = false,
            Flag = "MobESPEnabled",
            Callback = function(Value)
                local function ProcessMobs()
                    for _, mob in ipairs(workspace.Alive:GetChildren()) do
                        if Value then
                            if not game.Players:GetPlayerFromCharacter(mob) then
                                ApplyMobESP(mob)
                            end
                        else
                            RemoveMobESP(mob)
                        end
                    end
                end
                
                ProcessMobs()
                
                if Value then
                    MobESP.ChildAddedConn = workspace.Alive.ChildAdded:Connect(function(mob)
                        repeat task.wait() until mob:FindFirstChild("HumanoidRootPart")
                        if not game.Players:GetPlayerFromCharacter(mob) then
                            ApplyMobESP(mob)
                        end
                    end)
                elseif MobESP.ChildAddedConn then
                    MobESP.ChildAddedConn:Disconnect()
                end
            end
        })

        Esp:CreateColorPicker({
            Name = "Mob Color",
            Color = Color3.new(1, 0, 0),
            Flag = "MobESPColor",
            Callback = function(Value)
                MobESP.Color = Value
                for mob, espData in pairs(MobESP.TrackedMobs) do
                    espData.highlight.FillColor = Value
                    espData.highlight.OutlineColor = Value
                    espData.billboard.TextLabel.TextColor3 = Value
                end
            end
        })

        Esp:CreateSlider({
            Name = "Mob Transparency",
            Range = {0, 1},
            Increment = 0.1,
            CurrentValue = 0.5,
            Flag = "MobESPTransparency",
            Callback = function(Value)
                MobESP.FillTransparency = Value
                MobESP.OutlineTransparency = Value
                for mob, espData in pairs(MobESP.TrackedMobs) do
                    espData.highlight.FillTransparency = Value
                    espData.highlight.OutlineTransparency = Value
                end
            end
        })
        local function ApplyOreESP(ore)
            if not OreESP.TrackedOres then
                OreESP.TrackedOres = {}
            end
            if OreESP.TrackedOres[ore] then return end
            
            local part = ore:FindFirstChildWhichIsA("BasePart")
            if not part then return end
    
            local billboard = Instance.new("BillboardGui")
            billboard.Adornee = part
            billboard.Size = UDim2.new(0, 200, 0, 50)
            billboard.StudsOffset = Vector3.new(0, 3, 0)
            billboard.AlwaysOnTop = true
            billboard.Parent = game:GetService("CoreGui")
    
            local nameLabel = Instance.new("TextLabel")
            nameLabel.Size = UDim2.new(1, 0, 0, 25)
            nameLabel.BackgroundTransparency = 1
            nameLabel.TextColor3 = OreESP.Color
            nameLabel.TextSize = 14
            nameLabel.Font = Enum.Font.SciFi
            nameLabel.Text = ore.Name
            nameLabel.TextStrokeTransparency = 0.5
            nameLabel.Parent = billboard
    
            local distanceLabel = Instance.new("TextLabel")
            distanceLabel.Size = UDim2.new(1, 0, 0, 25)
            distanceLabel.Position = UDim2.new(0, 0, 0, 25)
            distanceLabel.BackgroundTransparency = 1
            distanceLabel.TextColor3 = Color3.new(1, 1, 1)
            distanceLabel.TextSize = 12
            distanceLabel.Font = Enum.Font.SciFi
            distanceLabel.TextStrokeTransparency = 0.5
            distanceLabel.Parent = billboard
    
            local connection
            connection = game:GetService("RunService").RenderStepped:Connect(function()
                local localRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if localRoot and part then
                    local distance = (localRoot.Position - part.Position).Magnitude
                    distanceLabel.Text = string.format("%.1fm", distance)
                    billboard.Enabled = distance <= OreESP.MaxDistance
                end
            end)
    
            OreESP.TrackedOres[ore] = {
                billboard = billboard,
                connection = connection
            }
        end
    
        Esp:CreateSection("Ore Esp / Harvestable")
        Esp:CreateToggle({
            Name = "Ore ESP / Harvestable",
            CurrentValue = false,
            Flag = "OreESPEnabled",
            Callback = function(Value)
                oreesp = not oreesp
                if oreesp then
                    if not OreESP.ChildAddedConn then
                        OreESP.ChildAddedConn = workspace.Harvestable.ChildAdded:Connect(function(ore)
                            if ore:IsA("Model") then
                                ApplyOreESP(ore)
                            end
                        end)
                    end
                    for _, ore in ipairs(workspace.Harvestable:GetChildren()) do
                        if ore:IsA("Model") then
                            ApplyOreESP(ore)
                        end
                    end
                else
                    if OreESP.ChildAddedConn then
                        OreESP.ChildAddedConn:Disconnect()
                        OreESP.ChildAddedConn = nil
                    end
                    for ore, espData in pairs(OreESP.TrackedOres) do
                        if espData.connection then
                            espData.connection:Disconnect()
                        end
                        if espData.billboard then
                            espData.billboard:Destroy()
                        end
                    end
                    OreESP.TrackedOres = {}
                end
            end
        })

        Esp:CreateSlider({
            Name = "Max Distance",
            Range = {0, 1000},
            Increment = 10,
            CurrentValue = 100,
            Flag = "OreESPDistance",
            Callback = function(Value)
                OreESP.MaxDistance = Value
                for ore, espData in pairs(OreESP.TrackedOres) do
                    if espData.connection then
                        espData.connection:Disconnect()
                    end
                    espData.connection = game:GetService("RunService").RenderStepped:Connect(function()
                        local localRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        local part = ore:FindFirstChildWhichIsA("BasePart")
                        if localRoot and part then
                            local distance = (localRoot.Position - part.Position).Magnitude
                            espData.billboard.Enabled = distance <= Value
                        end
                    end)
                end
            end
        })

        Esp:CreateColorPicker({
            Name = "Ore Color / Harvestable",
            Color = Color3.new(1, 0, 0),
            Flag = "OreESPColor",
            Callback = function(Value)
                OreESP.Color = Value
                for ore, espData in pairs(OreESP.TrackedOres) do
                    espData.billboard.TextLabel.TextColor3 = Value
                end
            end
        })
    end

    CreatePlayerESPControls()
    CreateDisplayOptions()
    CreateCharmsControls()
    SetupMobsTab()
end

local function InitializeESP()
    
    local isPlayer = function(mob)
        return mob:IsA("Model") 
            and game.Players:GetPlayerFromCharacter(mob)
    end

    local function CreateESPComponents(player)
        if player == LocalPlayer then return end
        
        local success, character = pcall(function()
            return player.Character or player.CharacterAdded:Wait()
        end)
        if not success or not character then return end

        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if not humanoidRootPart or not humanoid then return end

        local head = character:FindFirstChild("Head")
        if not head then return end

        local function createInstance(className, properties)
            local instance = Instance.new(className)
            for property, value in pairs(properties) do
                instance[property] = value
            end
            return instance
        end

        local billboard = createInstance("BillboardGui", {
            Adornee = head,
            Size = UDim2.new(0, 250, 0, 100),
            StudsOffset = Vector3.new(0, 4, 0),
            AlwaysOnTop = true,
            ResetOnSpawn = false,
            Enabled = PlayerESP.Enabled,
            Parent = game:GetService("CoreGui")
        })

        local nameLabel = createInstance("TextLabel", {
            Size = UDim2.new(1, 0, 0, 25),
            Position = UDim2.new(0, 0, 0, 0),
            BackgroundTransparency = 1,
            TextColor3 = PlayerESP.Color,
            TextSize = PlayerESP.TextSize + 2,
            Font = Enum.Font.SciFi,
            Text = player.Name.." (L )",
            TextStrokeTransparency = 0.5,
            TextStrokeColor3 = Color3.new(0,0,0),
            Parent = billboard
        })

        local distanceLabel = createInstance("TextLabel", {
            Size = UDim2.new(1, 0, 0, 25),
            Position = UDim2.new(0, 0, 0, 25),
            BackgroundTransparency = 1,
            TextColor3 = PlayerESP.Color,
            TextSize = PlayerESP.TextSize,
            Font = Enum.Font.SciFi,
            Text = "",
            TextStrokeTransparency = 0.5,
            TextStrokeColor3 = Color3.new(0,0,0),
            Parent = billboard
        })

        local healthLabel = createInstance("TextLabel", {
            Size = UDim2.new(1, 0, 0, 25),
            Position = UDim2.new(0, 0, 0, 50),
            BackgroundTransparency = 1,
            TextColor3 = PlayerESP.Color,
            TextSize = PlayerESP.TextSize,
            Font = Enum.Font.SciFi,
            Text = "",
            TextStrokeTransparency = 0.5,
            TextStrokeColor3 = Color3.new(0,0,0),
            Parent = billboard
        })

        local coinsLabel = createInstance("TextLabel", {
            Size = UDim2.new(1, 0, 0, 25),
            Position = UDim2.new(0, 0, 0, 75),
            BackgroundTransparency = 1,
            TextColor3 = PlayerESP.Color,
            TextSize = PlayerESP.TextSize,
            Font = Enum.Font.SciFi,
            Text = "",
            TextStrokeTransparency = 0.5,
            TextStrokeColor3 = Color3.new(0,0,0),
            Parent = billboard
        })

        local highlight = createInstance("Highlight", {
            Adornee = character,
            FillColor = CharmsESP.Color,
            OutlineColor = CharmsESP.Color,
            FillTransparency = CharmsESP.FillTransparency,
            OutlineTransparency = CharmsESP.OutlineTransparency,
            DepthMode = CharmsESP.DepthMode,
            Enabled = CharmsESP.Enabled,
            Parent = character
        })

        return {
            billboard = billboard,
            nameLabel = nameLabel,
            distanceLabel = distanceLabel,
            healthLabel = healthLabel,
            coinsLabel = coinsLabel,
            highlight = highlight,
            humanoid = humanoid,
            rootPart = humanoidRootPart
        }
    end

    local function UpdateESP(espData, player)
        return RunService.RenderStepped:Connect(function()
            if not PlayerESP.Enabled and not CharmsESP.Enabled then return end
            
            local isValid = espData.rootPart and espData.humanoid and espData.humanoid.Health > 0
            local billboardVisible = isValid and PlayerESP.Enabled
            local highlightVisible = isValid and CharmsESP.Enabled

            if espData.billboard then
                espData.billboard.Enabled = billboardVisible
            end
            if espData.highlight then
                espData.highlight.Enabled = highlightVisible
                if CharmsESP.PulseEnabled then
                    local pulse = math.sin(tick() * CharmsESP.PulseSpeed) * 0.5 + 0.5
                    espData.highlight.FillColor = Color3.fromRGB(
                        CharmsESP.Color.R * 255 * pulse,
                        CharmsESP.Color.G * 255 * pulse,
                        CharmsESP.Color.B * 255 * pulse
                    )
                    espData.highlight.OutlineColor = espData.highlight.FillColor
                end
            end
            if billboardVisible and LocalPlayer.Character then
                local rootPos = espData.rootPart.Position
                local localRoot = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if not localRoot then return end
                
                local distance = (localRoot.Position - rootPos).Magnitude
                local sizeMultiplier = math.clamp(1.3 - (distance / 100), 0.4, 1.3)
                espData.billboard.Size = UDim2.new(0, 250 * sizeMultiplier, 0, 100 * sizeMultiplier)
                
                espData.nameLabel.TextColor3 = PlayerESP.Color
                espData.distanceLabel.Visible = PlayerESP.ShowDistance
                espData.healthLabel.Visible = PlayerESP.ShowHealth
                espData.coinsLabel.Visible = PlayerESP.ShowCoins

                if PlayerESP.ShowDistance then
                    local distanceText = math.floor(distance)
                    local distanceColor = Color3.new(1, 1, 1)
                    if distance < 20 then
                        distanceColor = Color3.new(1, 0, 0)
                    elseif distance < 50 then
                        distanceColor = Color3.new(1, 1, 0)
                    else
                        distanceColor = Color3.new(0, 1, 0)
                    end
                    espData.distanceLabel.Text = string.format("Distance: %dm", distanceText)
                    espData.distanceLabel.TextColor3 = distanceColor
                end
                if PlayerESP.ShowHealth and espData.humanoid then
                    local health = math.floor(espData.humanoid.Health)
                    local healthBar = "■■■■■■■■■■"
                    local filled = math.floor((health/100) * 10)
                    healthBar = healthBar:sub(1, filled) .. ("□□□□□□□□□□"):sub(filled + 1)
                    
                    local r = math.clamp(1 - (health/100), 0, 1)
                    local g = math.clamp(health/100, 0, 1)
                    local healthColor = Color3.fromRGB(r * 255, g * 255, 0)
                    
                    espData.healthLabel.Text = string.format("HP: %s %d%%", healthBar, health)
                    espData.healthLabel.TextColor3 = healthColor
                end
                if PlayerESP.ShowCoins then
                    local mob = espData.rootPart.Parent
                    if isPlayer(mob) then
                        local success, coins = pcall(function()
                            return workspace.Alive[mob.Name].BoolValues.Coins.Value
                        end)
                        if success then
                            espData.coinsLabel.Text = string.format("🟡 %s", coins)
                        end
                    end
                end
                local mob = espData.rootPart.Parent
                if isPlayer(mob) then
                    local success, level = pcall(function()
                        return workspace.Alive[mob.Name].BoolValues.Level.Value
                    end)
                    if success then
                        espData.nameLabel.Text = string.format("%s (L %d)", player.Name, level)
                    end
                end
            end
        end)
    end

    local function CleanupPlayer(player)
        if not ESPCache[player] then return end
        
        if ESPCache[player].connection then
            ESPCache[player].connection:Disconnect()
        end
        if ESPCache[player].billboard then
            ESPCache[player].billboard:Destroy()
        end
        if ESPCache[player].highlight then
            ESPCache[player].highlight:Destroy()
        end
        
        ESPCache[player] = nil
    end

    local function ManagePlayerESP(player)
        if player == LocalPlayer or ESPCache[player] then return end
        
        local function HandleCharacterAdded(character)
            CleanupPlayer(player)
            
            local espData = CreateESPComponents(player)
            if not espData then return end
            
            espData.connection = UpdateESP(espData, player)
            ESPCache[player] = espData

            local function HandleCharacterRemoval()
                CleanupPlayer(player)
            end

            if espData.humanoid then
                espData.humanoid.Died:Connect(HandleCharacterRemoval)
            end
            player.CharacterRemoving:Connect(HandleCharacterRemoval)
        end

        if player.Character then
            HandleCharacterAdded(player.Character)
        end
        player.CharacterAdded:Connect(HandleCharacterAdded)
    end

    local function PlayerCheckLoop()
        for _, player in ipairs(Players:GetPlayers()) do
            if not ESPCache[player] and player ~= LocalPlayer then
                task.spawn(ManagePlayerESP, player)
            end
        end
    end

    Players.PlayerAdded:Connect(ManagePlayerESP)
    Players.PlayerRemoving:Connect(CleanupPlayer)

    while true do
        PlayerCheckLoop()
        task.wait(2)
    end
end

CreateMainWindow()
SetupESPTab()
SetupMainTab()
SetupTeleportTab()
InitializeESP()
