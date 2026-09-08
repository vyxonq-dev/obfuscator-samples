-- discord.gg/25ms


-- local Players = game:GetService("Players")
-- local GroupService = game:GetService("GroupService")
-- local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
-- local player = Players.LocalPlayer
-- local desiredPlaceId = 310798636
-- local hwid = RbxAnalyticsService:GetClientId()
-- local groupId = 34036244
-- local descriptionToCheck = "activeATN2"
-- local hwidtable = {
--     "1646FE0F-84D9-4896-BF9F-3D1A66049D9E",
--     "2B6AD34C-1BF0-46F3-98B3-6ED131F0CAAC",
--     "3534CCEA-0288-4BA9-BA5A-9CF95F195C8B",
--     "D8610F5E-3696-45DA-9951-4B72A2D81E10",
--     "d042d2dc-95a4-4093-b496-a64a66af489d",
--     "2E04B460-8791-477F-95D8-EA837E0FFFE9",
--     "C5CA6B95-E531-40B6-8FA2-DC6C25951845",
--     "55E662AB-A997-4225-B7A0-E7B5D3307A50",
--     "321355F1-54DF-42B3-A51D-45B3B584E0F5",
--     "988AD46C-3561-49A7-A414-1EF62E9394B5",
--     "22F1F24F-B908-453E-8DC8-388EFB9AECB6",
--     "6EC71F66-2662-4F21-A0FD-AD2931467FE2",
--     "bd8f3a7b-ebbc-4e29-b690-7dc879e8e069",
--     "D88308A3-6AB1-46E6-8E54-C797DA73BC0F",
--     "30B36658-FE2F-4555-BF78-24AD1B2CA48E",
--     "8E22C767-EA16-4078-AE9D-4C4C02FFFD33",
--     "EDAE7E1B-815F-423C-B664-5132973B647F",
--     "FD162B0B-D7F7-4F47-8DA2-8D819E5F2EE7",
--     "4F2EE654-5DD2-4786-B99D-91FCA3A14FD3",
--     "GAMELEAN-LEAN-xfy_z"
-- }
-- local function isHwidAllowed(hwid)
--     return table.find(hwidtable, hwid) ~= nil
-- end
-- if not isHwidAllowed(hwid) then
--     player:Kick("Unauthorized HWID detected.")
--     return
-- end
-- if game.PlaceId ~= desiredPlaceId then
--     player:Kick("You are not in the correct place.")
--     return
-- end
-- local success, groupInfo = pcall(GroupService.GetGroupInfoAsync, GroupService, groupId)
if true --[[success and groupInfo and groupInfo.Description:lower():find(descriptionToCheck:lower())]] then
    local library = loadstring(game:HttpGet("https://you.whimper.xyz/sources/badscripts/TN_UI.lua"))()
    local venyx = library.new("Dualverse - A Typical Neighborhood", 5013109572)
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")
    local LocalPlayer = Players.LocalPlayer
    local themes = {
        Background = Color3.fromRGB(61, 60, 124),
        Glow = Color3.fromRGB(60, 63, 221),
        Accent = Color3.fromRGB(55, 52, 90),
        LightContrast = Color3.fromRGB(64, 65, 128),
        DarkContrast = Color3.fromRGB(32, 33, 64),
        TextColor = Color3.fromRGB(255, 255, 255)
    }
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local anticheat = replicatedStorage:FindFirstChild("ATR")
    local anticheat2 = replicatedStorage:FindFirstChild("ATB")
    anticheat:Destroy()
    anticheat.Parent = nil
    anticheat2:Destroy()
    anticheat2.Parent = nil
    local function GetVehicleFromDescendant(Descendant)
        return Descendant:FindFirstAncestor(LocalPlayer.Name .. "\'s Car") or (Descendant:FindFirstAncestor("Body") and Descendant:FindFirstAncestor("Body").Parent) or (Descendant:FindFirstAncestor("Misc") and Descendant:FindFirstAncestor("Misc").Parent) or Descendant:FindFirstAncestorWhichIsA("Model")
    end
    local function TeleportVehicle(CoordinateFrame)
        local Parent = LocalPlayer.Character.Parent
        local Vehicle = GetVehicleFromDescendant(LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").SeatPart)
        LocalPlayer.Character.Parent = Vehicle
        local success, response = pcall(function()
            return Vehicle:SetPrimaryPartCFrame(CoordinateFrame)
        end)
        if not success then
            return Vehicle:MoveTo(CoordinateFrame.Position)
        end
    end
    local walkSpeed = 16
    local walkSpeedEnabled = false
    local mainPage = venyx:addPage("Main", 14456045412)
    local walkSpeedSection = mainPage:addSection("Universal")
    venyx:SelectPage(mainPage)
    walkSpeedSection:addButton("Set Spawn Point", function()
        local player = game:GetService("Players").LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")
        local initialPosition = character:WaitForChild("HumanoidRootPart").CFrame
        local notificationText = string.format("Initial Position: (%.2f, %.2f, %.2f)", initialPosition.Position.X, initialPosition.Position.Y, initialPosition.Position.Z)
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Success",
            Text = notificationText
        })
        local function onHealthChanged(newHealth)
            if newHealth == 0 then
                local respawnTime = game:GetService("Players").RespawnTime + 1
                wait(respawnTime)
                local newCharacter = player.Character or player.CharacterAdded:Wait()
                newCharacter:WaitForChild("HumanoidRootPart").CFrame = initialPosition
            end
        end
        humanoid.HealthChanged:Connect(onHealthChanged)
    end)
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local player = Players.LocalPlayer
    local walkSpeedEnabled = false
    local walkSpeed = 16
    local function updateWalkSpeed(humanoid)
        if walkSpeedEnabled and humanoid then
            humanoid.WalkSpeed = walkSpeed
        else
            humanoid.WalkSpeed = 16
        end
    end
    local function onCharacterAdded(character)
        local humanoid = character:WaitForChild("Humanoid")
        updateWalkSpeed(humanoid)
        humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
            if walkSpeedEnabled and humanoid.WalkSpeed ~= walkSpeed then
                humanoid.WalkSpeed = walkSpeed
            end
        end)
    end
    player.CharacterAdded:Connect(onCharacterAdded)
    if player.Character then
        onCharacterAdded(player.Character)
    end
    local walkSpeedToggle = walkSpeedSection:addToggle("Walk Speed Enabled", walkSpeedEnabled, function(value)
        walkSpeedEnabled = value
        if player.Character then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                updateWalkSpeed(humanoid)
            end
        end
    end)
    walkSpeedSection:addSlider("Walk Speed", walkSpeed, 16, 500, function(value)
        walkSpeed = value
        if walkSpeedEnabled and player.Character then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                updateWalkSpeed(humanoid)
            end
        end
    end)
    local isInfJumpEnabled = false
    local infJump = nil
    local infJumpDebounce = false
    local infJumpToggle = walkSpeedSection:addToggle("Infinite Jump Enabled", isInfJumpEnabled, function(value)
        isInfJumpEnabled = value
        if isInfJumpEnabled then
            infJump = UserInputService.JumpRequest:Connect(function()
                if not infJumpDebounce then
                    infJumpDebounce = true
                    LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
                    wait()
                    infJumpDebounce = false
                end
            end)
        else
            if infJump then
                infJump:Disconnect()
            end
        end
    end)
    local isFullbrightEnabled = false
    local brightLoop = nil
    local function brightFunc()
        if isFullbrightEnabled then
            game:GetService("Lighting").Brightness = 2
            game:GetService("Lighting").ClockTime = 14
            game:GetService("Lighting").FogEnd = 100000
            game:GetService("Lighting").GlobalShadows = false
            game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(128, 128, 128)
        else
            game:GetService("Lighting").Brightness = 1
            game:GetService("Lighting").ClockTime = 0
            game:GetService("Lighting").FogEnd = 999999
            game:GetService("Lighting").GlobalShadows = true
            game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(127, 127, 127)
        end
    end
    local fullbrightToggle = walkSpeedSection:addToggle("Fullbright Enabled", isFullbrightEnabled, function(value)
        isFullbrightEnabled = value
        if isFullbrightEnabled then
            brightLoop = RunService.RenderStepped:Connect(brightFunc)
        else
            if brightLoop then
                brightLoop:Disconnect()
            end
            brightFunc()
        end
    end)
    local floatEnabled = false
    local floatName = "FloatPad"
    local function getRoot(character)
        return character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
    end
    local function toggleFloating(value)
        floatEnabled = value
        if floatEnabled then
            local pchar = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            if pchar and not pchar:FindFirstChild(floatName) then
                task.spawn(function()
                    local Float = Instance.new('Part')
                    Float.Name = floatName
                    Float.Parent = pchar
                    Float.Transparency = 1
                    Float.Size = Vector3.new(2, 0.2, 1.5)
                    Float.Anchored = true
                    local FloatValue = - 3.1
                    Float.CFrame = getRoot(pchar).CFrame * CFrame.new(0, FloatValue, 0)
                    local function notify(title, message)
                        print(title .. ": " .. message)
                    end
                    notify('Float', 'Float Enabled (Q = down & E = up)')
                    local qUp, eUp, qDown, eDown, floatDied, FloatingFunc
                    qUp = UserInputService.InputEnded:Connect(function(input, processed)
                        if not processed and input.KeyCode == Enum.KeyCode.Q then
                            FloatValue = FloatValue + 0.5
                        end
                    end)
                    eUp = UserInputService.InputEnded:Connect(function(input, processed)
                        if not processed and input.KeyCode == Enum.KeyCode.E then
                            FloatValue = FloatValue - 0.5
                        end
                    end)
                    qDown = UserInputService.InputBegan:Connect(function(input, processed)
                        if not processed and input.KeyCode == Enum.KeyCode.Q then
                            FloatValue = FloatValue - 0.5
                        end
                    end)
                    eDown = UserInputService.InputBegan:Connect(function(input, processed)
                        if not processed and input.KeyCode == Enum.KeyCode.E then
                            FloatValue = FloatValue + 0.5
                        end
                    end)
                    floatDied = player.Character:FindFirstChildOfClass('Humanoid').Died:Connect(function()
                        FloatingFunc:Disconnect()
                        Float:Destroy()
                        qUp:Disconnect()
                        eUp:Disconnect()
                        qDown:Disconnect()
                        eDown:Disconnect()
                        floatDied:Disconnect()
                    end)
                    local function FloatPadLoop()
                        if pchar:FindFirstChild(floatName) and getRoot(pchar) then
                            Float.CFrame = getRoot(pchar).CFrame * CFrame.new(0, FloatValue, 0)
                        else
                            FloatingFunc:Disconnect()
                            Float:Destroy()
                            qUp:Disconnect()
                            eUp:Disconnect()
                            qDown:Disconnect()
                            eDown:Disconnect()
                            floatDied:Disconnect()
                        end
                    end
                    FloatingFunc = RunService.Heartbeat:Connect(FloatPadLoop)
                end)
            end
        else
            local pchar = LocalPlayer.Character
            if pchar and pchar:FindFirstChild(floatName) then
                pchar:FindFirstChild(floatName):Destroy()
            end
        end
    end
    walkSpeedSection:addToggle("Floating Enabled", floatEnabled, function(value)
        toggleFloating(value)
    end)
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local player = Players.LocalPlayer
    local Clip = true
    local Noclipping
    local function toggleNoclip(state)
        if state then
            Clip = false
            wait(0.1)
            local function NoclipLoop()
                if not Clip and player.Character then
                    for _, child in pairs(player.Character:GetChildren()) do
                        if child:IsA("BasePart") and child.CanCollide then
                            child.CanCollide = false
                        end
                    end
                end
            end
            Noclipping = RunService.Stepped:Connect(NoclipLoop)
        else
            if Noclipping then
                Noclipping:Disconnect()
            end
            Clip = true
            if player.Character then
                for _, child in pairs(player.Character:GetChildren()) do
                    if child:IsA("BasePart") and not child.CanCollide then
                        child.CanCollide = true
                    end
                end
            end
        end
    end
    walkSpeedSection:addToggle("Noclip Enabled", false, function(state)
        toggleNoclip(state)
    end)
    local Players = game:GetService("Players")
    local UserInputService = game:GetService("UserInputService")
    local RunService = game:GetService("RunService")
    local TFlyEnabled = false
    local flySpeed = 2
    local function startFly(speed)
        TFlyEnabled = true
        local e1, e2
        local Hum = Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        local mouse = UserInputService.MouseIconEnabled
        local Core = Instance.new('Part', workspace)
        Core.Size, Core.CanCollide = Vector3.new(0.05, 0.05, 0.05), false
        local Trs = Core
        local keys = {
            a = false,
            d = false,
            w = false,
            s = false
        }
        e1 = UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
            if not Trs or not Trs.Parent then
                e1:disconnect()
                e2:disconnect()
                return
            end
            if input.KeyCode == Enum.KeyCode.W then
                keys.w = true
            elseif input.KeyCode == Enum.KeyCode.S then
                keys.s = true
            elseif input.KeyCode == Enum.KeyCode.A then
                keys.a = true
            elseif input.KeyCode == Enum.KeyCode.D then
                keys.d = true
            end
        end)
        e2 = UserInputService.InputEnded:Connect(function(input, gameProcessedEvent)
            if input.KeyCode == Enum.KeyCode.W then
                keys.w = false
            elseif input.KeyCode == Enum.KeyCode.S then
                keys.s = false
            elseif input.KeyCode == Enum.KeyCode.A then
                keys.a = false
            elseif input.KeyCode == Enum.KeyCode.D then
                keys.d = false
            end
        end)
        local Weld = Instance.new('Weld', Core)
        Weld.Part0, Weld.Part1, Weld.C0 = Core, Hum.RootPart, CFrame.new(0, 0, 0)
        local pos, gyro = Instance.new('BodyPosition', Trs), Instance.new('BodyGyro', Trs)
        pos.maxForce, pos.position = Vector3.new(math.huge, math.huge, math.huge), Trs.Position
        gyro.maxTorque, gyro.cframe = Vector3.new(9e9, 9e9, 9e9), Trs.CFrame
        repeat
            wait()
            Hum.PlatformStand = true
            local new = gyro.cframe - gyro.cframe.p + pos.position
            if not keys.w and not keys.s and not keys.a and not keys.d then
                speed = speed or 2
            end
            if keys.w then
                new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                speed = speed + 0
            end
            if keys.s then
                new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                speed = speed + 0
            end
            if keys.d then
                new = new * CFrame.new(speed, 0, 0)
                speed = speed + 0
            end
            if keys.a then
                new = new * CFrame.new(- speed, 0, 0)
                speed = speed + 0
            end
            pos.position = new.p
            if keys.w then
                gyro.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(- math.rad(speed * 0), 0, 0)
            elseif keys.s then
                gyro.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(math.rad(speed * 0), 0, 0)
            else
                gyro.cframe = workspace.CurrentCamera.CoordinateFrame
            end
        until not TFlyEnabled
        if gyro then
            gyro:Destroy()
        end
        if pos then
            pos:Destroy()
        end
        Hum.PlatformStand = false
        speed = 10
    end
    local function stopFly()
        TFlyEnabled = false
        local Core = workspace:FindFirstChild("Core")
        if Core then
            for i, v in pairs(Core:GetChildren()) do
                v:Destroy()
            end
        end
    end
    local flySection = mainPage:addSection("Flying")
    local flyToggle = flySection:addToggle("Fly Enabled", false, function(value)
        if value then
            startFly(flySpeed)
        else
            stopFly()
        end
    end)
    flySection:addSlider("Fly Speed", flySpeed, 1, 100, function(value)
        flySpeed = value
        if TFlyEnabled then
            stopFly()
            startFly(flySpeed)
        end
    end)
    flySection:addKeybind("Toggle Fly", Enum.KeyCode.X, function()
        if TFlyEnabled then
            stopFly()
        else
            startFly(flySpeed)
        end
    end)
    local blatantSection = mainPage:addSection("Blatant")
    blatantSection:addButton("Kill All (hold out a gun)", function()
        local function teleportUnderPlayer(targetPlayer)
            local localPlayer = game:GetService("Players").LocalPlayer
            local character = localPlayer.Character
            local targetCharacter = targetPlayer.Character
            if character and targetCharacter then
                local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                local targetHumanoidRootPart = targetCharacter:FindFirstChild("HumanoidRootPart")
                if humanoidRootPart and targetHumanoidRootPart then
                    local targetPosition = targetHumanoidRootPart.Position - Vector3.new(0, 50, 0)
                    humanoidRootPart.CFrame = CFrame.new(targetPosition)
                end
            end
        end
        local function killaura()
            local LocalPlayer = game:GetService("Players").LocalPlayer
            local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local gun = character:FindFirstChildOfClass("Tool")
            local inflictRemote = gun:WaitForChild("Damage"):WaitForChild("InflictTarget")
            local isRunning = true
            local killauraCoroutine = coroutine.create(function()
                while isRunning do
                    local players = game:GetService("Players"):GetPlayers()
                    local localPlayerPosition = LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position
                    for _, player in pairs(players) do
                        if player ~= LocalPlayer then
                            local playerCharacter = player.Character
                            if playerCharacter then
                                local playerHumanoidRootPart = playerCharacter:FindFirstChild("HumanoidRootPart")
                                if playerHumanoidRootPart then
                                    if (playerHumanoidRootPart.Position - localPlayerPosition).Magnitude <= 150 then
                                        local inflict = {
                                            [1] = playerCharacter:WaitForChild("Humanoid"),
                                            [2] = 99,
                                            [3] = playerCharacter:WaitForChild("Head")
                                        }
                                        inflictRemote:FireServer(unpack(inflict))
                                    end
                                end
                            end
                        end
                    end
                    task.wait(0.25)
                end
            end)
            coroutine.resume(killauraCoroutine)
            return function()
                isRunning = false
            end
        end
        local function teleportToAllPlayersWithOffset()
            local players = game:GetService("Players")
            local localPlayer = players.LocalPlayer
            local stopKillaura = killaura()
            for _, player in pairs(players:GetPlayers()) do
                if player ~= localPlayer then
                    teleportUnderPlayer(player)
                    wait(0.2)
                end
            end
            stopKillaura()
        end
        teleportToAllPlayersWithOffset()
    end)
    local killauraConnection
    function startKillaura()
        if killauraConnection then
            return
        end
        killauraConnection = game:GetService("RunService").Heartbeat:Connect(function()
            if not killauraEnabled then
                return
            end
            local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local gun = character:FindFirstChildOfClass("Tool")
            if gun then
                local inflictRemote = gun:FindFirstChild("Damage"):FindFirstChild("InfIictTarget")
                if inflictRemote then
                    local players = Players:GetPlayers()
                    local localPlayerPosition = character:FindFirstChild("HumanoidRootPart")
                    if localPlayerPosition then
                        for _, player in pairs(players) do
                            if player ~= LocalPlayer then
                                local playerCharacter = player.Character
                                if playerCharacter then
                                    local playerHumanoidRootPart = playerCharacter:FindFirstChild("HumanoidRootPart")
                                    if playerHumanoidRootPart then
                                        if (playerHumanoidRootPart.Position - localPlayerPosition.Position).Magnitude <= 150 then
                                            local inflict = {
                                                [1] = playerCharacter:FindFirstChild("Humanoid"),
                                                [2] = 99,
                                                [3] = playerCharacter:FindFirstChild("Head")
                                            }
                                            inflictRemote:FireServer(table.unpack(inflict))
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
    function stopKillaura()
        if killauraConnection then
            killauraConnection:Disconnect()
            killauraConnection = nil
        end
    end
    blatantSection:addToggle("Killaura Gun and Melee", false, function(value)
        killauraEnabled = value
        if value then
            print("Killaura started")
            startKillaura()
        else
            print("Killaura stopped")
            stopKillaura()
        end
    end)
    local function killaura()
        local LocalPlayer = game:GetService("Players").LocalPlayer
        local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local gun = character:FindFirstChildOfClass("Tool")
        local inflictRemote = nil
        if gun and gun:FindFirstChild("Damage") and gun.Damage:FindFirstChild("InfIictTarget") then
            inflictRemote = gun.Damage.InfIictTarget
        end
        local isRunning = true
        local killauraCoroutine = coroutine.create(function()
            while isRunning do
                local npcs = game.Workspace.Pedestrians:GetChildren()
                local localPlayerPosition = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position
                for _, npc in pairs(npcs) do
                    if npc:IsA("Model") and npc:FindFirstChild("HumanoidRootPart") then
                        local npcHumanoidRootPart = npc:FindFirstChild("HumanoidRootPart")
                        if (npcHumanoidRootPart.Position - localPlayerPosition).Magnitude <= 150 then
                            inflictRemote:FireServer(npc:FindFirstChild("Humanoid"), 99, npc:FindFirstChild("Head"))
                        end
                    end
                end
                task.wait(0.25)
            end
        end)
        coroutine.resume(killauraCoroutine)
        return function()
            isRunning = false
        end
    end
    local killauraEnabled = false
    local killauraConnection
    function startKillaura2()
        if killauraConnection then
            return
        end
        killauraConnection = game:GetService("RunService").Heartbeat:Connect(function()
            if not killauraEnabled then
                return
            end
            local character = game:GetService("Players").LocalPlayer.Character or game:GetService("Players").LocalPlayer.CharacterAdded:Wait()
            local gun = character:FindFirstChildOfClass("Tool")
            local inflictRemote = nil
            if gun and gun:FindFirstChild("Damage") and gun.Damage:FindFirstChild("InfIictTarget") then
                inflictRemote = gun.Damage.InfIictTarget
            end
            if inflictRemote then
                local npcs = game.Workspace.Pedestrians:GetChildren()
                local localPlayerPosition = character:FindFirstChild("HumanoidRootPart").Position
                for _, npc in pairs(npcs) do
                    if npc:IsA("Model") and npc:FindFirstChild("HumanoidRootPart") then
                        local npcHumanoidRootPart = npc:FindFirstChild("HumanoidRootPart")
                        if (npcHumanoidRootPart.Position - localPlayerPosition).Magnitude <= 150 then
                            inflictRemote:FireServer(npc:FindFirstChild("Humanoid"), 99, npc:FindFirstChild("Head"))
                        end
                    end
                end
            end
        end)
    end
    function stopKillaura2()
        if killauraConnection then
            killauraConnection:Disconnect()
            killauraConnection = nil
        end
    end
    blatantSection:addToggle("Npc Killaura, Guns and Melee", false, function(value)
        killauraEnabled = value
        if value then
            startKillaura2()
        else
            stopKillaura2()
        end
    end)
    local infToggle
    local infLoopActive = false
    local guns = {
        "Assault Rifle",
        "Ranch Rifle",
        "Military Sniper",
        "Hunting Sniper",
        "Carbine",
        "Supressed-Carbine",
        "Military Rifle",
        "Heavy Pistol",
        "Heavy Revolver",
        "Revolver",
        "Duty Pistol",
        "Pistol",
        "Plinking Pistol",
        "Shotgun",
        "Sawn-off",
        "BIG MAC",
        "SMG",
        "Tactical SMG",
    }
    local function infiniteReload()
        while infLoopActive do
            for _, gunName in ipairs(guns) do
                local weapon = game:GetService("Players").LocalPlayer.Character:FindFirstChild(gunName)
                if weapon and weapon:FindFirstChild("Damage") and weapon.Damage:FindFirstChild("Ammo") then
                    local args = {
                        [1] = "Reload"
                    }
                    weapon.Damage.Ammo:FireServer(unpack(args))
                end
            end
            wait(0.5)
        end
    end
    infToggle = blatantSection:addToggle("Infinite Ammo", false, function(value)
        infLoopActive = value
        if infLoopActive then
            spawn(infiniteReload)
        end
    end)
    local MiscSection = mainPage:addSection("Misc")
    MiscSection:addButton("Bring all NPC's freezes cam for a bit", function()
        local players = game:GetService("Players")
        local character = players.LocalPlayer.Character
        local camera = game:GetService("Workspace").CurrentCamera
        if character and character:FindFirstChild("HumanoidRootPart") then
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            local initialCFrame = humanoidRootPart.CFrame
            local initialCameraCFrame = camera.CFrame
            camera.CFrame = initialCameraCFrame
            camera.CameraType = Enum.CameraType.Scriptable
            local workspace = game:GetService("Workspace")
            local pedestrians = workspace:FindFirstChild("Pedestrians")
            if pedestrians then
                for _, npc in pairs(pedestrians:GetChildren()) do
                    local targetLocation = npc:FindFirstChild("HumanoidRootPart")
                    if targetLocation then
                        for i = 1, 3 do
                            humanoidRootPart.CFrame = targetLocation.CFrame
                            wait(0.3)
                        end
                        targetLocation.CFrame = initialCFrame
                    end
                end
            end
            humanoidRootPart.CFrame = initialCFrame
            camera.CameraType = Enum.CameraType.Custom
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Dualverse";
                Text = "finished tping!!";
                Icon = "rbxassetid://6538162572";
                Duration = 5;
                Button1 = "ok naga";
                Button2 = "";
            })
        end
    end)
    MiscSection:addButton("Bring all Convicts", function()
        local players = game:GetService("Players")
        local character = players.LocalPlayer.Character
        local camera = game:GetService("Workspace").CurrentCamera
        if character and character:FindFirstChild("HumanoidRootPart") then
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            local initialCFrame = humanoidRootPart.CFrame
            local initialCameraCFrame = camera.CFrame
            camera.CFrame = initialCameraCFrame
            camera.CameraType = Enum.CameraType.Scriptable
            local workspace = game:GetService("Workspace")
            local pedestrians = workspace:FindFirstChild("Pedestrians")
            if pedestrians then
                for _, npc in pairs(pedestrians:GetChildren()) do
                    if npc.Name:sub(1, 7) == "Escaped" and npc:FindFirstChild("HumanoidRootPart") then
                        local targetLocation = npc:FindFirstChild("HumanoidRootPart")
                        for i = 1, 5 do
                            humanoidRootPart.CFrame = targetLocation.CFrame
                            wait(0.3)
                        end
                        targetLocation.CFrame = initialCFrame
                    end
                end
            end
            humanoidRootPart.CFrame = initialCFrame
            camera.CameraType = Enum.CameraType.Custom
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Dualverse";
                Text = "finished tping!!";
                Icon = "rbxassetid://6538162572";
                Duration = 5;
                Button1 = "ok naga";
                Button2 = "";
            })
        end
    end)
    MiscSection:addButton("Bring all BATON Cops", function()
        local players = game:GetService("Players")
        local character = players.LocalPlayer.Character
        local camera = game:GetService("Workspace").CurrentCamera
        if character and character:FindFirstChild("HumanoidRootPart") then
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            local initialCFrame = humanoidRootPart.CFrame
            local initialCameraCFrame = camera.CFrame
            camera.CFrame = initialCameraCFrame
            camera.CameraType = Enum.CameraType.Scriptable
            local workspace = game:GetService("Workspace")
            local pedestrians = workspace:FindFirstChild("Pedestrians")
            if pedestrians then
                for _, npc in pairs(pedestrians:GetChildren()) do
                    if npc.Name:sub(1, 5) == "Baton" and npc:FindFirstChild("HumanoidRootPart") then
                        local targetLocation = npc:FindFirstChild("HumanoidRootPart")
                        for i = 1, 2 do
                            humanoidRootPart.CFrame = targetLocation.CFrame
                            wait(0.3)
                        end
                        targetLocation.CFrame = initialCFrame
                    end
                end
            end
            humanoidRootPart.CFrame = initialCFrame
            camera.CameraType = Enum.CameraType.Custom
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Dualverse";
                Text = "finished tping!!";
                Icon = "rbxassetid://6538162572";
                Duration = 5;
                Button1 = "ok naga";
                Button2 = "";
            })
        end
    end)
    MiscSection:addButton("Bring all Gun Cops", function()
        local players = game:GetService("Players")
        local character = players.LocalPlayer.Character
        local camera = game:GetService("Workspace").CurrentCamera
        if character and character:FindFirstChild("HumanoidRootPart") then
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            local initialCFrame = humanoidRootPart.CFrame
            local initialCameraCFrame = camera.CFrame
            camera.CFrame = initialCameraCFrame
            camera.CameraType = Enum.CameraType.Scriptable
            local workspace = game:GetService("Workspace")
            local pedestrians = workspace:FindFirstChild("Pedestrians")
            if pedestrians then
                for _, npc in pairs(pedestrians:GetChildren()) do
                    if npc.Name:sub(1, 6) == "GunCop" and npc:FindFirstChild("HumanoidRootPart") then
                        local targetLocation = npc:FindFirstChild("HumanoidRootPart")
                        for i = 1, 5 do
                            humanoidRootPart.CFrame = targetLocation.CFrame
                            wait(0.3)
                        end
                        targetLocation.CFrame = initialCFrame
                    end
                end
            end
            humanoidRootPart.CFrame = initialCFrame
            camera.CameraType = Enum.CameraType.Custom
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Dualverse";
                Text = "finished tping!!";
                Icon = "rbxassetid://6538162572";
                Duration = 5;
                Button1 = "ok naga";
                Button2 = "";
            })
        end
    end)
    local players = game:GetService("Players")
    local player = players.LocalPlayer
    local camera = game:GetService("Workspace").CurrentCamera
    local npcModels = {}
    for _, npc in pairs(workspace.Pedestrians:GetDescendants()) do
        if npc:IsA("Model") then
            table.insert(npcModels, npc.Name)
        end
    end
    MiscSection:addDropdown("Bring Individual NPC", npcModels, function(selected)
        local character = player.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            local initialCFrame = humanoidRootPart.CFrame
            local initialCameraCFrame = camera.CFrame
            camera.CFrame = initialCameraCFrame
            camera.CameraType = Enum.CameraType.Scriptable
            local npcModel = workspace.Pedestrians:FindFirstChild(selected)
            while not npcModel:FindFirstChild("HumanoidRootPart") do
                wait(0.1)
            end
            local targetLocation = npcModel:FindFirstChild("HumanoidRootPart")
            for i = 1, 2 do
                humanoidRootPart.CFrame = targetLocation.CFrame
                wait(0.3)
            end
            targetLocation.CFrame = initialCFrame
            humanoidRootPart.CFrame = initialCFrame
            camera.CameraType = Enum.CameraType.Custom
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Dualverse";
                Text = "finished tping!!";
                Icon = "rbxassetid://6538162572";
                Duration = 3;
                Button1 = "ok naga";
                Button2 = "";
            })
        end
    end)
    local tpPage = venyx:addPage("Teleport", 2242016188)
    local WeaponTpSection = tpPage:addSection("Weapon Teleports")
    WeaponTpSection:addDropdown("Weapon", {
        "Chainsaw #1",
        "Chainsaw #2",
        "Chainsaw #3",
        "Machete #1",
        "Machete #2",
        "Axe",
        "Ninjato",
        "Old Sword",
        "Pitchfork",
        "Shovel",
        "Spear",
        "Sledgehammer"
    }, function(selected)
        if selected == "Chainsaw #1" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(- 673.6287841796875, 3.279999256134033, 293.1943664550781)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        elseif selected == "Chainsaw #2" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(- 3921.4306640625, 3.406182289123535, - 1170.92919921875)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        elseif selected == "Chainsaw #3" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(- 722.6532592773438, - 37.63332748413086, 2900.397705078125)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        elseif selected == "Machete #1" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(94.6766586303711, 3.263387680053711, 147.31033325195312)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        elseif selected == "Machete #2" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(57.9014778137207, 3.199653387069702, 156.78038024902344)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        elseif selected == "Axe" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(499.4814147949219, 3.1354355812072754, - 207.16383361816406)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        elseif selected == "Ninjato" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(133.38821411132812, 4.98005485534668, 122.4924545288086)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        elseif selected == "Old Sword" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(- 242.6944580078125, 3.2633893489837646, - 157.63323974609375)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        elseif selected == "Pitchfork" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(- 732.2294921875, 5.60001802444458, 2912.18115234375)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        elseif selected == "Shovel" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(593.1997680664062, 3.1354355812072754, - 165.5045928955078)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        elseif selected == "Spear" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(- 2585.28564453125, - 2.0144944190979004, 1460.6739501953125)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        elseif selected == "Sledgehammer" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(611.8125610351562, 3.280001163482666, - 565.938720703125)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        end
    end)
    local tpSection = tpPage:addSection("Main Teleports")
    tpSection:addDropdown("Dustin Teleports", {
        "The Store",
        "Eat Em All",
        "Toyz",
        "Recording Studio",
        "Bodyshop",
        "Boxing Gym",
        "Construction Site",
        "Crane",
        "Docks Job",
        "Hospital",
        "Pufferfish Motel",
        "Red House",
        "Hotel Roof"
    }, function(selected)
        if selected == "The Store" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(- 326.2171325683594, 3.2800166606903076, - 556.7406616210938)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        elseif selected == "Eat Em All" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(- 249.04891967773438, 3.2800092697143555, - 556.0326538085938)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        elseif selected == "Toyz" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(- 172.48052978515625, 3.280007839202881, - 555.3275756835938)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        elseif selected == "Recording Studio" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(- 96.94331359863281, 3.2800092697143555, - 555.4160766601562)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        elseif selected == "Bodyshop" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(- 536.293212890625, 3.2899935245513916, - 703.5289916992188)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        elseif selected == "Boxing Gym" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(385.33319091796875, 5.880001544952393, - 80.63394165039062)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        elseif selected == "Construction Site" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(611.8125610351562, 3.280001163482666, - 565.938720703125)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        elseif selected == "Crane" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(- 610.871337890625, 151.0799560546875, - 1509.3726806640625)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        elseif selected == "Docks Job" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(- 730.0697631835938, 7.080041885375977, - 1222.8009033203125)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        elseif selected == "Hospital" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(526.8282470703125, 4.479992866516113, 144.18789672851562)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        elseif selected == "Pufferfish Motel" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(- 588.970947265625, 33.02997970581055, - 152.6521453857422)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        elseif selected == "Red House" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(146.7298583984375, 5.280056476593018, 84.06057739257812)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        elseif selected == "Hotel Roof" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(- 594.5407104492188, 48.27994155883789, 297.108154296875)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        end
    end)
    tpSection:addDropdown("Austin Teleports", {
        "The Store",
        "Pizza Place",
        "PD Roof",
        "Bullet Holes",
        "Left Aid Pharmacy",
        "Restaurant",
        "Homeless Camp",
        "Baseball Stadium"
    }, function(selected)
        if selected == "The Store" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(- 3725.79736328125, 3.38016414642334, - 1182.1962890625)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        elseif selected == "Pizza Place" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(- 3583.751708984375, 3.300027370452881, - 1192.3524169921875)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        elseif selected == "PD Roof" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(- 3940.854248046875, 55.999977111816406, - 883.9624633789062)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        elseif selected == "Bullet Holes" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(- 3728.67041015625, 3.5049326419830322, - 773.8888549804688)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        elseif selected == "Left Aid Pharmacy" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(- 4404.75439453125, 5.618797779083252, - 1159.8126220703125)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        elseif selected == "Restaurant" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(- 4087.493408203125, 4.649982929229736, - 1234.03759765625)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        elseif selected == "Homeless Camp" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(- 4014.24267578125, 3.4813804626464844, - 820.9750366210938)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        elseif selected == "Baseball Stadium" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(- 3530.680419921875, 3.5588791370391846, - 700.1588134765625)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        end
    end)
    tpSection:addDropdown("Forest Teleports", {
        "Boxitt's Guns'n Ammo",
        "Bodyshop",
        "Mansion",
        "Fugitive House",
        "Noobania Temple",
        "Sector A",
        "Homeless House",
        "Hill Shed",
        "Free Bux House",
        "Bar",
        "Mine #1",
        "Mine #2",
        "Mine #3"
    }, function(selected)
        if selected == "Boxitt's Guns'n Ammo" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(- 762.378173828125, 7.706392288208008, 2181.363037109375)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        elseif selected == "Bodyshop" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(1267.27099609375, 166.21397399902344, - 792.442626953125)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        elseif selected == "Mansion" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(- 1205.16162109375, 5.3000078201293945, 2745.355224609375)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        elseif selected == "Fugitive House" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(- 1970.8673095703125, 36.28169631958008, 2572.85400390625)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        elseif selected == "Noobania Temple" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(- 2967.51513671875, 3.9999942779541016, 1082.948974609375)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        elseif selected == "Sector A" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(1410.2589111328125, 138.14981079101562, - 328.629150390625)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        elseif selected == "Homeless House" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(- 3578.448486328125, 34.41593933105469, 2230.908935546875)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        elseif selected == "Hill Shed" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(1889.6214599609375, 242.65000915527344, 2232.802734375)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        elseif selected == "Free Bux House" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(- 796.165283203125, 5.3000078201293945, 2820.342529296875)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        elseif selected == "Bar" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(- 2366.107666015625, 14.133329391479492, 1069.1507568359375)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        elseif selected == "Mine #1" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(1360.6121826171875, 8.999853134155273, 1737.7802734375)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        elseif selected == "Mine #2" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(- 1654.0386962890625, 6.10952615737915, 2901.813232421875)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        elseif selected == "Mine #3" then
            local a = game:GetService("ReplicatedStorage")
            local b = a:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                local c = b:FindFirstChild("Handle")
                if c then
                    c.Position = Vector3.new(1720.0313720703125, 204.27130126953125, 1521.5830078125)
                else
                    warn("Handle not found inside the EXP Bolt Action Sniper tool.")
                end
            else
                warn("EXP Bolt Action Sniper tool not found in ReplicatedStorage.")
            end;
            local d = game:GetService("Players")
            local e = game:GetService("ReplicatedStorage")
            local f = d.LocalPlayer;
            local g = f.Character or f.CharacterAdded:Wait()
            local h = g:WaitForChild("Humanoid")
            local function i(j)
                local k = e:WaitForChild(j)
                local l = k:Clone()
                l.Parent = f.Backpack
            end;
            i("EXP Bolt Action Sniper")
            local b = f.Backpack:FindFirstChild("EXP Bolt Action Sniper")
            if b then
                b.Name = "Tool"
            else
                warn("EXP Bolt Action Sniper not found in backpack.")
            end;
            local m = game:GetService("Players").LocalPlayer.Character.Humanoid;
            m:EquipTool(b)
            wait(0.1)
            local h = game:GetService("Players").LocalPlayer.Character.Humanoid;
            h:UnequipTools()
            wait(0.1)
            local n = game:GetService("Players").LocalPlayer.Backpack.Tool;
            if n then
                n:Destroy()
            end
        end
    end)
    local autoPage = venyx:addPage("Autofarm", 10698947721)
    local auto1Section = autoPage:addSection("Docks Autofarm, go in priv server")
    local aimPage = venyx:addPage("Aiming", 18484264435)
    local silentSection = aimPage:addSection("Silent Aim")
    local fov = 0
    local fovColor = Color3.fromRGB(255, 255, 255)
    local FOVring = nil
    local targetPart = "Head"
    silentSection:addSlider("Fov", 0, 0, 360, function(value)
        fov = value
        if FOVring then
            FOVring.Radius = fov
        end
    end)
    silentSection:addColorPicker("Fov Color", fovColor, function(color)
        fovColor = color
        if FOVring then
            FOVring.Color = fovColor
        end
    end)
    silentSection:addDropdown("Target Part", {
        "Head",
        "Torso",
        "Left Arm",
        "Right Arm",
        "Left Leg",
        "Right Leg"
    }, function(selected)
        targetPart = selected
    end)
    silentSection:addToggle("Silent Aim", nil, function(state)
        local RunService = game:GetService("RunService")
        local UserInputService = game:GetService("UserInputService")
        local Players = game:GetService("Players")
        local Camera = game.Workspace.CurrentCamera
        local LocalPlayer = Players.LocalPlayer
        if state then
            if not FOVring then
                FOVring = Drawing.new("Circle")
            end
            FOVring.Visible = true
            FOVring.Thickness = 2
            FOVring.Color = fovColor
            FOVring.Filled = false
            FOVring.Radius = fov
            FOVring.Position = Vector2.new(0, 0)
        else
            if FOVring then
                FOVring.Visible = false
            end
        end
        local function updateDrawings()
            if FOVring then
                local mouseLocation = UserInputService:GetMouseLocation()
                FOVring.Position = mouseLocation
                FOVring.Color = fovColor
                FOVring.Radius = fov
            end
        end
        local function onKeyDown(input)
            if input.KeyCode == Enum.KeyCode.Delete then
                RunService:UnbindFromRenderStep("FOVUpdate")
                if FOVring then
                    FOVring:Remove()
                    FOVring = nil
                end
            end
        end
        UserInputService.InputBegan:Connect(onKeyDown)
        local function lookAt(target)
            local lookVector = (target - Camera.CFrame.Position).unit
            local newCFrame = CFrame.new(Camera.CFrame.Position, Camera.CFrame.Position + lookVector)
            Camera.CFrame = newCFrame
        end
        local function IsPlayerVisible(Player)
            local PlayerCharacter = Player.Character
            local LocalPlayerCharacter = LocalPlayer.Character
            if not (PlayerCharacter and LocalPlayerCharacter) then
                return false
            end
            local PlayerRoot = PlayerCharacter:FindFirstChild("HumanoidRootPart")
            if not PlayerRoot then
                return false
            end
            local CameraPosition = Camera.CFrame.Position
            local Direction = (PlayerRoot.Position - CameraPosition).Unit
            local Distance = (PlayerRoot.Position - CameraPosition).Magnitude
            local RaycastResult = workspace:Raycast(CameraPosition, Direction * Distance, RaycastParams.new())
            if not RaycastResult then
                return true
            end
            local HitPart = RaycastResult.Instance
            return HitPart.CanCollide == false or HitPart.Transparency > 0 or HitPart:IsA("Accessory")
        end
        local function getClosestPlayerInFOV()
            local nearest = nil
            local last = math.huge
            local mouseLocation = UserInputService:GetMouseLocation()
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild(targetPart) then
                    local part = player.Character[targetPart]
                    local ePos, isVisible = Camera:WorldToViewportPoint(part.Position)
                    local distance = (Vector2.new(ePos.x, ePos.y) - mouseLocation).Magnitude
                    if isVisible and distance < fov and (part.Position - LocalPlayer.Character[targetPart].Position).Magnitude < 300 and IsPlayerVisible(player) then
                        if distance < last then
                            last = distance
                            nearest = player
                        end
                    end
                end
            end
            return nearest
        end
        local function fireGun(player)
            local LocalPlayer = game:GetService("Players").LocalPlayer
            local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local gun = character:FindFirstChildOfClass("Tool")
            local inflictRemote = gun:FindFirstChild("Damage"):FindFirstChild("InfIictTarget")
            if inflictRemote and player.Character then
                local humanoid = player.Character:FindFirstChild("Humanoid")
                local head = player.Character:FindFirstChild("Head")
                if humanoid and head then
                    inflictRemote:FireServer(humanoid, 99, head)
                end
            end
        end
        local lastAmmo = nil
        local function checkAmmoChanged()
            local character = LocalPlayer.Character
            if character then
                local gun = character:FindFirstChildOfClass("Tool")
                if gun then
                    local handle = gun:FindFirstChild("Handle")
                    if handle then
                        local ammoLeft = handle:FindFirstChild("AmmoLeft")
                        if ammoLeft then
                            local currentAmmo = ammoLeft.Value
                            if lastAmmo ~= nil and currentAmmo < lastAmmo then
                                local closestPlayer = getClosestPlayerInFOV()
                                if closestPlayer then
                                    fireGun(closestPlayer)
                                end
                            end
                            lastAmmo = currentAmmo
                        end
                    end
                end
            end
        end
        if state then
            RunService:BindToRenderStep("FOVUpdate", Enum.RenderPriority.Camera.Value, updateDrawings)
            RunService:BindToRenderStep("AmmoCheck", Enum.RenderPriority.Character.Value, checkAmmoChanged)
        else
            RunService:UnbindFromRenderStep("FOVUpdate")
            RunService:UnbindFromRenderStep("AmmoCheck")
        end
    end)
    silentSection:addToggle("Silent Aim Visibility", false, function(state)
        if FOVring then
            FOVring.Visible = state
        end
    end)
    local vehiclePage = venyx:addPage("Vehicle", 8356815386)
    local usageSection = vehiclePage:addSection("Usage")
    local velocityEnabled = true;
    usageSection:addToggle("Keybinds Active", velocityEnabled, function(v)
        velocityEnabled = v
    end)
    local flySection = vehiclePage:addSection("Semi Vehicle Godmode")
    flySection:addButton("God Car, press everytime you get in a new car", function()
        local Players = game:GetService("Players")
        local localPlayer = Players.LocalPlayer
        if localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") and localPlayer.Character.Humanoid.SeatPart then
            local vehicle = localPlayer.Character.Humanoid.SeatPart.Parent
            for _, child in pairs(vehicle:GetChildren()) do
                if child.Name == "Body" then
                    local hitbox = child:FindFirstChild("Hitbox")
                    if hitbox then
                        local touchInterest = hitbox:FindFirstChild("TouchInterest")
                        if touchInterest then
                            touchInterest:Destroy()
                        end
                    end
                end
            end
            local components = {
                "Bumper",
                "Door",
                "Engine",
                "Fender",
                "Front",
                "Hood",
                "RBumper",
                "Roof",
                "Trunk",
            }
            for _, component in pairs(components) do
                local componentParts = vehicle:GetChildren()
                for _, componentPart in pairs(componentParts) do
                    if componentPart.Name:find(component) then
                        local hitbox = componentPart:FindFirstChild("Hitbox")
                        if hitbox then
                            local touchInterest = hitbox:FindFirstChild("TouchInterest")
                            if touchInterest then
                                touchInterest:Destroy()
                            end
                        end
                    end
                end
            end
        end
    end)
    local flySection = vehiclePage:addSection("Vehicle Flight")
    local Players = game:GetService("Players")
    local UserInputService = game:GetService("UserInputService")
    local RunService = game:GetService("RunService")
    local LocalPlayer = Players.LocalPlayer
    local TFlyEnabled2 = false
    local flySpeed = 50
    local function getRoot2(character)
        return character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Torso")
    end
    local function startFly2(speed)
        TFlyEnabled2 = true
        local e1, e2
        local Hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        local mouse = LocalPlayer:GetMouse()
        local Vehicle = Hum and Hum.SeatPart and Hum.SeatPart.Parent
        local Core = Instance.new('Part', workspace)
        Core.Size, Core.CanCollide = Vector3.new(0.05, 0.05, 0.05), false
        local Trs = Core
        local keys = {
            a = false,
            d = false,
            w = false,
            s = false
        }
        e1 = UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
            if not Trs or not Trs.Parent then
                e1:disconnect()
                e2:disconnect()
                return
            end
            if input.KeyCode == Enum.KeyCode.W then
                keys.w = true
            elseif input.KeyCode == Enum.KeyCode.S then
                keys.s = true
            elseif input.KeyCode == Enum.KeyCode.A then
                keys.a = true
            elseif input.KeyCode == Enum.KeyCode.D then
                keys.d = true
            end
        end)
        e2 = UserInputService.InputEnded:Connect(function(input, gameProcessedEvent)
            if input.KeyCode == Enum.KeyCode.W then
                keys.w = false
            elseif input.KeyCode == Enum.KeyCode.S then
                keys.s = false
            elseif input.KeyCode == Enum.KeyCode.A then
                keys.a = false
            elseif input.KeyCode == Enum.KeyCode.D then
                keys.d = false
            end
        end)
        local Weld = Instance.new('Weld', Core)
        if Vehicle then
            Weld.Part0, Weld.Part1, Weld.C0 = Core, Vehicle.PrimaryPart, CFrame.new(0, 0, 0)
        else
            Weld.Part0, Weld.Part1, Weld.C0 = Core, Hum.RootPart, CFrame.new(0, 0, 0)
        end
        local pos, gyro = Instance.new('BodyPosition', Trs), Instance.new('BodyGyro', Trs)
        pos.maxForce, pos.position = Vector3.new(math.huge, math.huge, math.huge), Trs.Position
        gyro.maxTorque, gyro.cframe = Vector3.new(9e9, 9e9, 9e9), Trs.CFrame
        repeat
            wait()
            local new = gyro.cframe - gyro.cframe.p + pos.position
            if keys.w then
                new = new + workspace.CurrentCamera.CFrame.LookVector * speed
            end
            if keys.s then
                new = new - workspace.CurrentCamera.CFrame.LookVector * speed
            end
            if keys.d then
                new = new * CFrame.new(speed, 0, 0)
            end
            if keys.a then
                new = new * CFrame.new(- speed, 0, 0)
            end
            pos.position = new.p
            gyro.cframe = workspace.CurrentCamera.CFrame
        until not TFlyEnabled2
        if gyro then
            gyro:Destroy()
        end
        if pos then
            pos:Destroy()
        end
        if Hum then
            Hum.PlatformStand = false
        end
    end
    local function stopFly2()
        TFlyEnabled2 = false
        local T = getRoot(LocalPlayer.Character)
        if T then
            if T:FindFirstChildOfClass("BodyGyro") then
                T:FindFirstChildOfClass("BodyGyro"):Destroy()
            end
            if T:FindFirstChildOfClass("BodyVelocity") then
                T:FindFirstChildOfClass("BodyVelocity"):Destroy()
            end
        end
    end
    local flyToggle = flySection:addToggle("Fly Enabled", false, function(value)
        if value then
            startFly2(flySpeed)
        else
            stopFly2()
        end
    end)
    flySection:addSlider("Fly Speed", flySpeed, 1, 100, function(value)
        flySpeed = value
        if TFlyEnabled2 then
            stopFly2()
            startFly(flySpeed)
        end
    end)
    flySection:addKeybind("Toggle Fly", Enum.KeyCode.V, function()
        if TFlyEnabled2 then
            stopFly2()
        else
            startFly2(flySpeed)
        end
    end)
    local speedSection = vehiclePage:addSection("Acceleration")
    local velocityMult = 0.025;
    speedSection:addSlider("Multiplier (Thousandths)", 25, 0, 50, function(v)
        velocityMult = v / 1000;
    end)
    local velocityEnabledKeyCode = Enum.KeyCode.W;
    speedSection:addKeybind("Velocity Enabled", velocityEnabledKeyCode, function()
        if not velocityEnabled then
            return
        end
        while UserInputService:IsKeyDown(velocityEnabledKeyCode) do
            task.wait(0)
            local Character = LocalPlayer.Character
            if Character and typeof(Character) == "Instance" then
                local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
                if Humanoid and typeof(Humanoid) == "Instance" then
                    local SeatPart = Humanoid.SeatPart
                    if SeatPart and typeof(SeatPart) == "Instance" and SeatPart:IsA("VehicleSeat") then
                        SeatPart.AssemblyLinearVelocity = SeatPart.AssemblyLinearVelocity * Vector3.new(1 + velocityMult, 1, 1 + velocityMult)
                    end
                end
            end
            if not velocityEnabled then
                break
            end
        end
    end, function(v)
        velocityEnabledKeyCode = v.KeyCode
    end)
    local decelerateSelection = vehiclePage:addSection("Deceleration")
    local qbEnabledKeyCode = Enum.KeyCode.S
    local velocityMult2 = 150e-3
    decelerateSelection:addSlider("Brake Force (Thousandths)", velocityMult2 * 1e3, 0, 300, function(v)
        velocityMult2 = v / 1000;
    end)
    decelerateSelection:addKeybind("Quick Brake Enabled", qbEnabledKeyCode, function()
        if not velocityEnabled then
            return
        end
        while UserInputService:IsKeyDown(qbEnabledKeyCode) do
            task.wait(0)
            local Character = LocalPlayer.Character
            if Character and typeof(Character) == "Instance" then
                local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
                if Humanoid and typeof(Humanoid) == "Instance" then
                    local SeatPart = Humanoid.SeatPart
                    if SeatPart and typeof(SeatPart) == "Instance" and SeatPart:IsA("VehicleSeat") then
                        SeatPart.AssemblyLinearVelocity = SeatPart.AssemblyLinearVelocity * Vector3.new(1 - velocityMult2, 1, 1 - velocityMult2)
                    end
                end
            end
            if not velocityEnabled then
                break
            end
        end
    end, function(v)
        qbEnabledKeyCode = v.KeyCode
    end)
    decelerateSelection:addKeybind("Stop the Vehicle", Enum.KeyCode.P, function(v)
        if not velocityEnabled then
            return
        end
        local Character = LocalPlayer.Character
        if Character and typeof(Character) == "Instance" then
            local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
            if Humanoid and typeof(Humanoid) == "Instance" then
                local SeatPart = Humanoid.SeatPart
                if SeatPart and typeof(SeatPart) == "Instance" and SeatPart:IsA("VehicleSeat") then
                    SeatPart.AssemblyLinearVelocity = SeatPart.AssemblyLinearVelocity * Vector3.new(0, 0, 0)
                    SeatPart.AssemblyAngularVelocity = SeatPart.AssemblyAngularVelocity * Vector3.new(0, 0, 0)
                end
            end
        end
    end)
    local ssPage = venyx:addPage("Sidescripts", 17063628102)
    local ssSection = ssPage:addSection("Sidescripts")
    ssSection:addButton("Infinite Yield", function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/DarkNetworks/Infinite-Yield/main/latest.lua'))()
    end)
    ssSection:addButton("Aimbot", function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/scripterszoomies/aTypicalNeighborhood/main/aimbot'))()
    end)
    ssSection:addButton("Chat Bypass Script", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SkireScripts/Ouxie/main/Projects/simplebypass.lua"))()
    end)
    local infoPage = venyx:addPage("Information", 8356778308)
    infoPage:addSection("made by scripters.zoomies and altdziad on discord")
    local discordSection = infoPage:addSection("Dualverse Hub")
    discordSection:addButton(syn and "Dualverse Hub Invite" or "Join Dualverse Hub", function()
        if syn then -- they put that here </3
            syn.request({
                Url = "http://127.0.0.1:6463/rpc?v=1",
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json",
                    ["Origin"] = "https://discord.com"
                },
                Body = game:GetService("HttpService"):JSONEncode({
                    cmd = "INVITE_BROWSER",
                    args = {
                        code = "25ms"
                    },
                    nonce = game:GetService("HttpService"):GenerateGUID(false)
                }),
            })
            return
        end
        setclipboard("https://discord.gg/25ms")
    end)
    discordSection:addKeybind("Toggle UI", Enum.KeyCode.F1, function()
        venyx:toggle()
    end)
    -- local targetGroupId = 3423037
    -- local function getPlayerGroups(player)
    --     local groups = {}
    --     for _, group in pairs(player:GetRoleInGroups()) do
    --         if group.Rank > 0 then
    --             table.insert(groups, {
    --                 Group = group,
    --                 GroupId = group.Id
    --             })
    --         end
    --     end
    --     return groups
    -- end
    -- local function kickLocalPlayerIfHighPermissionPlayerJoins()
    --     local currentPlayers = game.Players:GetPlayers()
    --     local playerGroupMap = {}
    --     for _, player in pairs(currentPlayers) do
    --         playerGroupMap[player] = getPlayerGroups(player)
    --     end
    --     game.Players.PlayerAdded:Connect(function(newPlayer)
    --         local newPlayerGroups = getPlayerGroups(newPlayer)
    --         for _, player in pairs(currentPlayers) do
    --             local playerGroups = playerGroupMap[player]
    --             for _, group in pairs(newPlayerGroups) do
    --                 if group.GroupId == targetGroupId then
    --                     game.Players.LocalPlayer:Kick("A nigger joined:" .. newPlayer)
    --                     return
    --                 end
    --             end
    --         end
    --         table.insert(currentPlayers, newPlayer)
    --         playerGroupMap[newPlayer] = newPlayerGroups
    --     end)
    --     game.Players.PlayerRemoving:Connect(function(removedPlayer)
    --         table.remove(currentPlayers, table.find(currentPlayers, removedPlayer))
    --         playerGroupMap[removedPlayer] = nil
    --     end)
    -- end
    -- kickLocalPlayerIfHighPermissionPlayerJoins()-- lol ~25ms
else
    -- player:Kick("your crack expired, nice try")
end