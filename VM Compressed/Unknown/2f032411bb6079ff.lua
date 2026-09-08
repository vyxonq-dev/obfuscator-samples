-- Services
local players = game:GetService("Players")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local localPlayer = players.LocalPlayer

local plrs = {}

-- Settings
local shouldKillbot = false
local killbotTargetModes = {"Random"}
local killbotTargetMode = "Random"
local killbotTarget = nil
local killbotModes = {"Orbit"}
local killbotMode = "Orbit"
local killbotOrbitSpeed = 5
local killbotOrbitDistance = 5
local checkSafezoneKillbot = false
local shouldLootKillbot = false
local checkGunKillbot = false
local autoShootKillbot = false

targetPlayer = nil

-- ImGui Setup
local ImGui = loadstring(game:HttpGet('https://github.com/depthso/Roblox-ImGUI/raw/main/ImGui.lua'))()

local Window = ImGui:CreateWindow({
    Title = "Bruno Rob Farm",
    Size = UDim2.new(0, 650, 0, 470),
    Position = UDim2.new(0.5, 0, 0, 70)
})
Window:Center()

local RageTab = Window:CreateTab({Name = "Combat", Visible = true})
-- local PlayerTab = Window:CreateTab({Name = "Players", Visible = false})
local LocalTab = Window:CreateTab({Name = "Local", Visible = false})
local TargetsTab = Window:CreateTab({Name = "Targets", Visible = false})
local SettingsTab = Window:CreateTab({Name = "Settings", Visible = false})

SettingsTab:Keybind({
	Label = "Toggle UI",
	Value = Enum.KeyCode.Insert,
	Callback = function()
		  Window:SetVisible(not Window.Visible)
	end,
})

local Rage = RageTab:CollapsingHeader({Title = "Killbot"})
Rage:Label({Text = "Main"})

local KillBot = Rage:RadioButton({
    Label = "Killbot",
    Value = false,
    Callback = function(_, Value)
        killbotTarget = nil
        if Value == false then
            userInputService.MouseBehavior = Enum.MouseBehavior.Default
        end
        shouldKillbot = Value
    end,
})

Rage:Keybind({
	Label = "Killbot Bind",
	Value = Enum.KeyCode.J,
	Callback = function()
		  KillBot:Toggle()
	end,
})

Rage:Keybind({
	Label = "Switch Target",
	Value = Enum.KeyCode.T,
	Callback = function()
		  killbotTarget = nil
	end,
})

Rage:Combo({
    Selected = "Random",
    Label = "Targeting Mode",
    Items = killbotTargetModes,
    Callback = function(_, Value)
        killbotTarget = nil
        killbotTargetMode = Value
    end,
})

Rage:Combo({
    Selected = "Orbit",
    Label = "Strafe Mode",
    Items = killbotModes,
    Callback = function(_, Value)
        killbotMode = Value
    end,
})

Rage:Label({Text = "Sliders"})
Rage:Slider({
	Label = "Orbit Speed",
	Format = "%.d/%s", 
	Value = killbotOrbitSpeed,
	MinValue = 1,
	MaxValue = 20,
	Callback = function(_, Value)
		killbotOrbitSpeed = Value
	end,
})

Rage:Slider({
	Label = "Orbit Distance",
	Format = "%.d/%s", 
	Value = killbotOrbitDistance,
	MinValue = 1,
	MaxValue = 30,
	Callback = function(_, Value)
		killbotOrbitDistance = Value
	end,
})

Rage:Label({Text = "Toggles"})
Rage:RadioButton({
    Label = "Check Gun Target",
    Value = true,
    Callback = function(_, Value)
        checkGunKillbot = Value
    end,
})
Rage:RadioButton({
    Label = "Check Safezone Target",
    Value = true,
    Callback = function(_, Value)
        checkSafezoneKillbot = Value
    end,
})
Rage:RadioButton({
    Label = "Auto Loot Target",
    Value = true,
    Callback = function(_, Value)
        shouldLootKillbot = Value
    end,
})
Rage:RadioButton({
    Label = "Auto Shoot Target",
    Value = false,
    Callback = function(_, Value)
        autoShootKillbot = Value
    end,
})


TargetsTab:Label({
    Text = '<font size="13"><b>Gun Mods</b></font>',
    RichText = true,
    TextWrapped = true
})
local shouldInfAmmo, shouldAutoReload = false

-- local dropdown

-- local function UpdateDropdown(dd)
--     local playerItems = {}
--     for _, player in ipairs(players:GetPlayers()) do
--         if player ~= LocalPlayer then
--             table.insert(playerItems, player.Name)
--         end
--     end
--     dd.Items = playerItems
-- end

-- dropdown = PlayerTab:Combo({
--     Placeholder = "Select Target",
--     Label = "Select Target",
--     Items = {},
--     Callback = function(self, selectedPlayer)
--         targetPlayer = players:FindFirstChild(selectedPlayer) or nil
--     end
-- })

-- UpdateDropdown(dropdown)

local function bring(plr)
    if not plr or not plr.Character then return end
    if not localPlayer.Character:FindFirstChild("Fist") then
        localPlayer.Backpack.Fist.Parent = localPlayer.Character
    end
    if not localPlayer.Character:FindFirstChild("Fist") then
        return
    end
    local InputRemote = localPlayer.Character:FindFirstChild("Fist").Server.Input
    local targetCharacter = plr.Character
    local targetHumanoidRootPart = targetCharacter:FindFirstChild("HumanoidRootPart")
    local localHumanoidRootPart = localPlayer.Character:FindFirstChild("HumanoidRootPart")
    
    if targetHumanoidRootPart and localHumanoidRootPart then
        while not targetHumanoidRootPart.Anchored do
            localHumanoidRootPart.CFrame = targetHumanoidRootPart.CFrame
            workspace.Camera.CFrame = CFrame.new(workspace.Camera.CFrame.Position, targetHumanoidRootPart.Position)
            InputRemote:FireServer(Enum.KeyCode.G, targetCharacter)
            task.wait()
        end
    end
end

-- local function fling(plr)
--     if not plr or not plr.Character then return end

--     local targetCharacter = plr.Character
--     local targetHumanoidRootPart = targetCharacter:FindFirstChild("HumanoidRootPart")
--     local localCharacter = localPlayer.Character
--     local localHumanoidRootPart = localCharacter and localCharacter:FindFirstChild("HumanoidRootPart")

--     if targetHumanoidRootPart and localHumanoidRootPart then
--         local thrust = Instance.new("BodyThrust")
--         thrust.Force = Vector3.new(10000, 10000, 10000)
--         thrust.Name = "YeetForce"
--         thrust.Parent = targetHumanoidRootPart

--         local originalCFrame = localHumanoidRootPart.CFrame
--         for i = 1, 500 do
--             localHumanoidRootPart.CFrame = targetHumanoidRootPart.CFrame * CFrame.new(0, 0, math.random(-0.2, 0.2))
--             thrust.Location = targetHumanoidRootPart.Position
--             task.wait()
--             if not targetCharacter:FindFirstChild("HumanoidRootPart") then
--                 break
--             end
--         end
--         thrust:Destroy()
--         localHumanoidRootPart.Velocity = Vector3.zero
--         localHumanoidRootPart.CFrame = originalCFrame
--     end
-- end


-- local PlayerOpt = PlayerTab:Row()

-- PlayerOpt:Button({
--     Text = "Bring",
--     Callback = function(self)
--         if targetPlayer then
--             bring(targetPlayer)
--         end
--     end
-- })
-- PlayerOpt:Button({
--     Text = "Sit In Car",
--     Callback = function(self)
--         if targetPlayer then
--             if workspace:FindFirstChild(targetPlayer.Name.."'s Car") then
--                 workspace:FindFirstChild(targetPlayer.Name.."'s Car").Body:FindFirstChildOfClass("Seat"):Sit(localPlayer.Character.Humanoid)
--             end
--         end
--     end
-- })

local function UpdatePlayerTable(PlayerTable)
    PlayerTable:ClearRows()
    
    for _, plrData in ipairs(plrs) do
        local Row = PlayerTable:CreateRow()

        Row:CreateColumn():Label({
            Text = plrData.Player.Name
        })

        Row:CreateColumn():RadioButton({
            Label = "Whitelisted",
            Value = plrData.Whitelisted,
            Callback = function(self, Value)
                plrData.Whitelisted = Value
                killbotTarget = nil
            end,
        })
    end
end
-- AutoLoot Toggle
local tpLootEnabled = false
local function handleTpLoot()
    local function firePrompt(proximityPrompt)
        assert(proximityPrompt:IsA("ProximityPrompt"), "Argument #1 expects a ProximityPrompt object")
        
        local holdDuration = proximityPrompt.HoldDuration
        proximityPrompt.HoldDuration = 0

        proximityPrompt:InputHoldBegin()
        task.wait() -- Briefly wait to ensure the prompt fires
        proximityPrompt:InputHoldEnd()

        proximityPrompt.HoldDuration = holdDuration
    end

    local function handlePrompt(player)
        if not player.Character or not player.Character:FindFirstChild("UpperTorso") then
            return
        end

        local character = player.Character
        local localHumanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not localHumanoidRootPart then
            warn("LocalPlayer's HumanoidRootPart not found")
            return
        end

        for _, v in ipairs(character.UpperTorso:GetDescendants()) do
            if v:IsA("ProximityPrompt") and v:FindFirstChild("Looting") then
                while v.Enabled and tpLootEnabled do
                    if not v.Parent or not v.Parent:IsA("BasePart") then
                        warn("ProximityPrompt or its parent is no longer valid")
                        break
                    end

                    if not players:FindFirstChild(player.Name) then
                        warn("Player is no longer in the game")
                        break
                    end

                    localHumanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if not localHumanoidRootPart then
                        warn("LocalPlayer's HumanoidRootPart is no longer valid")
                        break
                    end

                    localHumanoidRootPart.CFrame = v.Parent.CFrame
                    firePrompt(v)

                    task.wait(0.03)
                end
            end
        end
    end

    for _, player in ipairs(players:GetPlayers()) do
        if player ~= localPlayer then
            handlePrompt(player)
        end
    end
    task.wait()
end

-- NoClip Toggle
local noClipEnabled = false
local massivePart
local function handleNoClip()
    if noClipEnabled then
        massivePart = Instance.new("Part")
        massivePart.Size = Vector3.new(15000, 50, 15000)
        massivePart.Anchored = true
        massivePart.CanCollide = true
        massivePart.Transparency = 1
        massivePart.Name = "PART_345345345345345345"
        massivePart.Parent = workspace

        local function disableCollisions()
            for _, obj in ipairs(workspace:GetDescendants()) do
                if obj and localPlayer.Character and obj:IsA("BasePart") and not obj:IsDescendantOf(localPlayer.Character) and obj.Name ~= massivePart.Name then
                    obj.CanCollide = false
                end
            end
            workspace.DescendantAdded:Connect(function(object)
                if object and localPlayer.Character and object:IsA("BasePart") and not object:IsDescendantOf(localPlayer.Character) and object.Name ~= massivePart.Name then
                    object.CanCollide = false
                end
            end)
        end

        disableCollisions()

        runService.RenderStepped:Connect(function()
            if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local rootPart = localPlayer.Character:FindFirstChild("HumanoidRootPart")
                local rayOrigin = rootPart.Position
                local rayDirection = Vector3.new(0, -1000, 0)

                local raycastParams = RaycastParams.new()
                raycastParams.FilterDescendantsInstances = {localPlayer.Character, massivePart}
                raycastParams.FilterType = Enum.RaycastFilterType.Blacklist

                local raycastResult = workspace:Raycast(rayOrigin, rayDirection, raycastParams)

                if raycastResult then
                    massivePart.CFrame = CFrame.new(raycastResult.Position - Vector3.new(0, 25, 0))
                else
                    massivePart.CFrame = CFrame.new(rootPart.Position - Vector3.new(0, 28, 0))
                end
            end
        end)

    else
        if massivePart then massivePart:Destroy() end
        print("NoClip disabled")
    end
end

-- AutoSell Toggle
local autoSellEnabled = false
local function handleAutoSell()
    if autoSellEnabled then
        local targetCFrame = CFrame.new(74.9465561, 3.76263285, 21.5493889, 0.999562681, -2.27870736e-08, 0.0295714401, 2.0598911e-08, 1, 7.43004378e-08, -0.0295714401, -7.36588035e-08, 0.999562681)

        local function getProximityPrompt()
            local success, prompt = pcall(function()
                return workspace.NPCs.gunbuyer.UpperTorso.Attachment.ProximityPrompt
            end)
            return success and prompt or nil
        end

        local function fireProximityPrompt(prompt)
            assert(prompt and prompt:IsA("ProximityPrompt"), "Invalid ProximityPrompt")
            local HoldDuration = prompt.HoldDuration
            prompt.HoldDuration = 0

            prompt:InputHoldBegin()
            task.wait()
            prompt:InputHoldEnd()

            prompt.HoldDuration = HoldDuration
        end

        local function monitorTools()
            localPlayer.Character.DescendantAdded:Connect(function(tool)
                if tool:IsA("Tool") then
                    while localPlayer.Character:FindFirstChild(tool.Name) and autoSellEnabled do
                        localPlayer.Character.HumanoidRootPart.CFrame = targetCFrame
                        local proximityPrompt = getProximityPrompt()
                        if proximityPrompt then
                            fireProximityPrompt(proximityPrompt)
                        end
                        task.wait()
                    end
                end
            end)
        end
        monitorTools()
    end
end

LocalTab:RadioButton({
    Label = "Enable AutoSell",
    Value = false,
    Callback = function(_, Value)
        autoSellEnabled = Value
        handleAutoSell()
    end,
})

LocalTab:Button({
    Text = "Enable Noclip",
    Callback = function(_, Value)
        noClipEnabled = true
        handleNoClip()
    end,
})

LocalTab:Separator({Text = "Looting"})

LocalTab:RadioButton({
    Label = "Enable TP AutoLoot",
    Value = false,
    Callback = function(_, Value)
        tpLootEnabled = Value
    end,
})

-- LocalTab:RadioButton({
--     Label = "Enable AutoLoot",
--     Value = false,
--     Callback = function(_, Value)
        
--     end,
-- })

-- LocalTab:Button({
--     Label = "Enable Insta Loot",
--     Value = false,
--     Callback = function(_, Value)
        
--     end,
-- })

TargetsTab:Label({
    Text = '<font size="18"><b>Players</b></font>',
    RichText = true,
    TextWrapped = true
})
TargetsTab:Separator()

local PlayerTable = TargetsTab:Table({
    RowBackground = true,
    Border = true,
    RowsFill = false,
    Size = UDim2.fromScale(1, 0)
})

players.PlayerAdded:Connect(function(plr)
    -- UpdateDropdown(dropdown)
    if plr ~= localPlayer then
        table.insert(plrs, { Player = plr, Whitelisted = false })
        UpdatePlayerTable(PlayerTable)
    end
end)

players.PlayerRemoving:Connect(function(plr)
    -- UpdateDropdown(dropdown)
    for i, plrData in ipairs(plrs) do
        if plrData.Player == plr then
            table.remove(plrs, i)
            break
        end
    end
    UpdatePlayerTable(PlayerTable)
end)

for _, plr in ipairs(players:GetPlayers()) do
    if plr ~= localPlayer then
        table.insert(plrs, { Player = plr, Whitelisted = false })
    end
end
UpdatePlayerTable(PlayerTable)

local Safezones = workspace:FindFirstChild("Safezones")

local function IsPlayerInSafezone(player)
    if not player.Character then return false end
    local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return false end
    if not Safezones then return false end

    for _, safezone in ipairs(Safezones:GetChildren()) do
        if safezone:IsA("BasePart") then
            local safezoneCF = safezone.CFrame
            local safezoneSize = safezone.Size
            local relativePos = safezoneCF:PointToObjectSpace(rootPart.Position)
            
            if math.abs(relativePos.X) <= safezoneSize.X / 2 and
               math.abs(relativePos.Y) <= safezoneSize.Y / 2 and
               math.abs(relativePos.Z) <= safezoneSize.Z / 2 then
                return true
            end
        end
    end

    return false
end


local function hasGun(player)
    if not player then return false end

    for _, tool in ipairs(player.Backpack:GetChildren()) do
        if tool:IsA("Tool") and tool.Name ~= "Fist" and tool.Name ~= "Phone" then
            return true
        end
    end

    for _, tool in ipairs(player.Character:GetChildren()) do
        if tool:IsA("Tool") and tool.Name ~= "Fist" and tool.Name ~= "Phone" then
            return true
        end
    end

    return false
end

local function getCharacter(player)
    local character = player.Character
    if not character then return false end

    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoidRootPart or not humanoid then return false end
    local checkGun = checkGunKillbot and not hasGun(player)
    local checkSafezone = checkSafezoneKillbot and IsPlayerInSafezone(player)
    
    if checkGun or checkSafezone then return false end
    return true
end


-- Looting Functions
local function firePrompt(proximityPrompt)
    assert(proximityPrompt:IsA("ProximityPrompt"), "Argument #1 expects a ProximityPrompt object")
    
    local holdDuration = proximityPrompt.HoldDuration
    proximityPrompt.HoldDuration = 0

    proximityPrompt:InputHoldBegin()
    task.wait()
    proximityPrompt:InputHoldEnd()

    proximityPrompt.HoldDuration = holdDuration
end

local function lootTarget(target)
    if not players:FindFirstChild(target.Name) or not target.Character or not target.Character:FindFirstChild("UpperTorso") then return end
    for _, v in ipairs(target.Character.UpperTorso:GetDescendants()) do
        if v:FindFirstChild("Looting") then
            while v.Enabled do
                if not localPlayer.Character or not localPlayer.Character:FindFirstChild("HumanoidRootPart") or not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then
                    break
                end
                localPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = v.Parent.CFrame
                firePrompt(v)
                task.wait(0.03)
            end
        end
    end
end

local function isWhitelisted(targetPlayer)
    for _, plrData in ipairs(plrs) do
        if plrData.Player == targetPlayer then
            return plrData.Whitelisted
        end
    end
    return false
end


local function getRandomTarget(targetList)
    local targets = {}
    for _, v in pairs(targetList) do
        if v ~= localPlayer and getCharacter(v) and not isWhitelisted(v) then
            table.insert(targets, v)
        end
    end
    return #targets > 0 and targets[math.random(1, #targets)] or nil
end

local angle = 0
local function circleAroundTarget(target, deltaTime)
    if not target or not getCharacter(target) then return end
    local targetHrp = target.Character.HumanoidRootPart

    angle = angle + killbotOrbitSpeed * deltaTime
    local x = targetHrp.Position.X + math.cos(angle) * killbotOrbitDistance
    local z = targetHrp.Position.Z + math.sin(angle) * killbotOrbitDistance
    local y = targetHrp.Position.Y

    localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(x, y, z), targetHrp.Position)
end

local delay = 0

local oldX = localPlayer.Character.HumanoidRootPart.Position.X
local oldY = localPlayer.Character.HumanoidRootPart.Position.Y
local oldZ = localPlayer.Character.HumanoidRootPart.Position.Z

local function randomTp(target, deltaTime)
    if not target or not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then
        return
    end
    
    local targetHrp = target.Character.HumanoidRootPart
    
    delay += 1 * deltaTime
    if delay >= killbotRandomizedDelay then
        local randomOffsetX = math.random(-killbotRandomizedDistance, killbotRandomizedDistance)
        local randomOffsetY = math.random(-killbotRandomizedDistance, killbotRandomizedDistance)
        local randomOffsetZ = math.random(-killbotRandomizedDistance, killbotRandomizedDistance)

        oldX = targetHrp.Position.X + randomOffsetX
        oldY = targetHrp.Position.Y + randomOffsetY
        oldZ = targetHrp.Position.Z + randomOffsetZ
        delay = 0
    end
    
    localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(oldX, oldY, oldZ), targetHrp.Position)
end

local function aimAtTarget(target)
    if target and getCharacter(target) then
        local head = target.Character:FindFirstChild("Head")
        if head then
            workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, head.Position)
        end
    end
end

local function attackTarget(target)
    if target and getCharacter(target) then
        mouse1press()
        task.wait()
        mouse1release()
    end
end

runService.RenderStepped:Connect(function(deltaTime)
    if tpLootEnabled then handleTpLoot() end
    if not killbotTarget or not getCharacter(killbotTarget) then
		killbotTarget = getRandomTarget(players:GetPlayers())
    end
    if not shouldKillbot or not killbotTarget then return end
    userInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
    if killbotTarget then
        local humanoid = killbotTarget.Character and killbotTarget.Character:FindFirstChildOfClass("Humanoid")
        if humanoid and humanoid:GetState() == Enum.HumanoidStateType.Dead then
            if shouldLootKillbot then
                lootTarget(killbotTarget)
            end
            killbotTarget = nil
        else
            aimAtTarget(killbotTarget)
            if killbotMode == "Orbit" then
                circleAroundTarget(killbotTarget, deltaTime)
            elseif killbotMode == "Randomized" then
                randomTp(killbotTarget, deltaTime)
            end
            if autoShootKillbot then attackTarget(killbotTarget) end
        end
    end
end)