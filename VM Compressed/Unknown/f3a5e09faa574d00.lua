local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Remotes = game:GetService("ReplicatedStorage").Events
local Players = game:GetService("Players")
local newCFolder = Instance.new("Folder", game:GetService("CoreGui"))
local lplr = Players.LocalPlayer

local tasks = {
    ['DownloadData'] = function()
        for i = 1, 5 do
            Remotes.TaskBegin:FireServer(
                'DownloadData',
                i
            )
            task.wait()
            Remotes.TaskFinish:FireServer(
                'DownloadData',
                {
                    true,
                    true,
                    true,
                    true,
                    true,
                }
            )
        end
    end,
    ['CountingTask'] = function()
        Remotes.TaskBegin:FireServer('CountingTask', 1)
        task.wait()
        Remotes.TaskFinish:FireServer('CountingTask', {
            true
        })
    end,
    ['CardSwipeTask'] = function()
        Remotes.TaskBegin:FireServer('CardSwipeTask', 1)
        task.wait()
        Remotes.TaskFinish:FireServer('CardSwipeTask', {
            true
        })
    end,
    ['FillFuel'] = function()
        Remotes.TaskBegin:FireServer('FillFuel')
        task.wait()
        Remotes.TaskExit:FireServer()
        task.wait()
        for i = 1, 2 do
            Remotes.TaskBegin:FireServer('RefuelEngines', i)
            task.wait()
            Remotes.TaskFinish:FireServer('RefuelEngines', {
                ['BottomRefueled'] = true,
                ['TopRefueled'] = true
            })
        end
    end,
    ['Wiring'] = function()
        for i = 1, 5 do
            Remotes.TaskBegin:FireServer('Wiring', i)
            task.wait()
            Remotes.TaskFinish:FireServer('Wiring', {
                true,
                true,
                true,
                true,
                true
            })
        end
    end,
    ['ChartCourse'] = function()
        Remotes.TaskBegin:FireServer('ChartCourse')
        task.wait()
        Remotes.TaskFinish:FireServer('ChartCourse', true)
    end,
    ['CleanO2'] = function()
        Remotes.TaskBegin:FireServer('CleanO2')
        task.wait()
        Remotes.TaskFinish:FireServer('CleanO2', true)
    end,
    ['InspectSample'] = function()
        Remotes.TaskBegin:FireServer('InspectSample', 1)
        task.wait()
        Remotes.TaskFinish:FireServer('InspectSample', {true})
    end,
    ['ReactorStartTask'] = function()
        Remotes.TaskBegin:FireServer('ReactorStartTask', 1)
        task.wait()
        Remotes.TaskFinish:FireServer('ReactorStartTask', {true})
    end,
    ['UploadData'] = function()
        for i = 1, 2 do
            Remotes.TaskBegin:FireServer('UploadData', i)
            task.wait()
            Remotes.TaskFinish:FireServer('UploadData', {
                true,
                true
            })
        end
    end,
    ['ScanTask'] = function()
        Remotes.TaskBegin:FireServer('ScanTask')
        task.wait()
        Remotes.TaskFinish:FireServer('ScanTask', true)
    end,
    ['StabilizeSteering'] = function()
        Remotes.TaskBegin:FireServer('StabilizeSteering')
        task.wait()
        Remotes.TaskFinish:FireServer('StabilizeSteering', true)
    end,
    ['AsteroidTask'] = function()
        Remotes.TaskBegin:FireServer('AsteroidTask', 1)
        task.wait()
        Remotes.TaskFinish:FireServer('AsteroidTask', {true})
    end
}

local Window = Fluent:CreateWindow({
    Title = "wake up paralyzed @szze",
    SubTitle = "discord.gg/yrQbdfhuqd",
    TabWidth = 65,
    Size = UDim2.fromOffset(380, 240),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "snowflake" }),
    Crewmate = Window:AddTab({ Title = "Crewmate", Icon = "smile" }),
    Impostor = Window:AddTab({ Title = "Impostor", Icon = "frown" }),
}

Tabs.Main:AddButton({
    Title = "Call Emergency Meeting",
    Description = "Force an emergency meeting, even if you're dead [cooldown applies].",
    Callback = function()
        Remotes.EmergencyMeetingEvents.EmergencyMeetingRequest:FireServer()
    end
})

Tabs.Main:AddButton({
    Title = 'Report Dead Body [even if already reported!]',
    Description = 'You can use this to spam emergency meetings, or break the game if executed in Lobby (disable killing + meetings).',
    Callback = function()
        Remotes.RequestTask:FireServer('DeadBody', lplr.Name .. ',' .. 'White')
        Remotes.EmergencyMeetingEvents.EmergencyMeetingRequest:FireServer()
    end
})

Tabs.Crewmate:AddButton({
    Title = "End Game",
    Description = "Ends the game, making crewmates win.",
    Callback = function()
        for i, v in next, tasks do
            v()
            Remotes.TaskExit:FireServer()
        end
    end
})

local autocheckDebounce = false
local function autoCheckForDead()
    while task.wait(0.5) do
        if autocheckDebounce then
            task.wait(2)
            autocheckDebounce = false
            continue
        end
        if #workspace.DeadBodies:GetChildren() > 0 then
            autocheckDebounce = true
            local deadBody = workspace.DeadBodies:GetChildren()[1]
            local allChars = Remotes.GetCharacters:InvokeServer()
            if allChars[deadBody.Name] then
                Remotes.RequestTask:FireServer('DeadBody', deadBody.Name .. ',' .. allChars[deadBody.Name].LookData.Color)
            else
                Remotes.RequestTask:FireServer('DeadBody', deadBody.Name .. ',' .. 'White')
            end
            Fluent:Notify({
                Title = "Dead Body Reported",
                Content = "A dead body has been reported: " .. deadBody.Name,
                Duration = 3
            })
        end
    end
end

local playerParts = {}

local function plrHighlights()
    while task.wait() do
        local s = game:GetService("ReplicatedStorage").Events.GetCharacters:InvokeServer()
        local seen = {}

        for user, data in next, s do
            if data and user ~= lplr.Name and data.Alive and data.Position then
                seen[user] = true
                local pos = data.Position
                local part = playerParts[user]
                if not part then
                    part = Instance.new("Part")
                    part.Anchored = true
                    part.CanCollide = false
                    part.Size = Vector3.new(2,1,2)
                    part.Color = Color3.fromRGB(119, 255, 114)
                    part.Transparency = 0
                    part.Material = Enum.Material.Plastic
                    part.Parent = workspace

                    local clrShould = game:GetService("ReplicatedStorage").CharacterItems.Colors:FindFirstChild(data.LookData.Color)

                    local highlight = Instance.new("Highlight")
                    highlight.Adornee = part
                    highlight.OutlineColor = clrShould and clrShould.Value or Color3.fromRGB(103, 92, 255)
                    highlight.FillTransparency = 1
                    highlight.Parent = part

                    playerParts[user] = part
                end
                part.Position = pos
            end
        end

        for user, part in pairs(playerParts) do
            if not seen[user] then
                if part and part.Parent then
                    part:Destroy()
                end
                playerParts[user] = nil
            end
        end

        task.wait()
    end
end

local function refreshUsableColors()
    local clrs = {}
    for i, v in next, game:GetService("ReplicatedStorage").CharacterItems.Colors:GetChildren() do
        if v:IsA('Color3Value') then
            table.insert(clrs, v.Name)
        end
    end

    local usedColors = {}
    local s = game:GetService("ReplicatedStorage").Events.GetCharacters:InvokeServer()
    for _, v in next, s do
        if v.LookData and v.LookData.Color then
            usedColors[v.LookData.Color] = true
        end
    end

    local availableClrs = {}
    for _, colorName in ipairs(clrs) do
        if not usedColors[colorName] then
            table.insert(availableClrs, colorName)
        end
    end

    return availableClrs
end

local function colorWheel()
    while task.wait() do
        for i,v in next, refreshUsableColors() do
            Remotes.RequestColor:InvokeServer(v)
            task.wait(0.5)
        end
    end
end

Tabs.Crewmate:AddButton({
    Title = 'Report Dead Body',
    Description = 'Checks for dead bodies, reporting them if found.',
    Callback = function()
        if #workspace.DeadBodies:GetChildren() > 0 then
            local deadBody = workspace.DeadBodies:GetChildren()[1]
            local allChars = Remotes.GetCharacters:InvokeServer()
            if allChars[deadBody.Name] then
                Remotes.RequestTask:FireServer('DeadBody', deadBody.Name .. ',' .. allChars[deadBody.Name].LookData.Color)
            else
                Remotes.RequestTask:FireServer('DeadBody', deadBody.Name .. ',' .. 'White')
            end
        else
            Fluent:Notify({
                Title = "No Dead Bodies Found",
                Content = "There are no dead bodies to report.",
                Duration = 3
            })
        end
    end
})

local checkingForDead = nil
Tabs.Crewmate:AddToggle("DeadToggle", {
    Title = 'Auto Report Dead Bodies',
    Description = 'When someone dies, it automatically reports the dead body.',
    Default = false,
    Callback = function(state)
        if state then
            if not checkingForDead then
                checkingForDead = task.spawn(autoCheckForDead)
            end
        else
            if checkingForDead then
                task.cancel(checkingForDead)
                checkingForDead = nil
            end
        end
    end
})

Tabs.Impostor:AddButton({
    Title = 'Fake Medbay Scan',
    Description = 'Fake a medbay scan to trick crewmates.',
    Callback = function()
        Remotes.ScanStarted:FireServer()
    end
})

Tabs.Impostor:AddButton({
    Title = 'Self Kill',
    Description = 'Kills yourself, making some confusion (cooldown applies).',
    Callback = function()
        Remotes.AttackRequest:InvokeServer(lplr.Name)
    end
})

Tabs.Crewmate:AddToggle('RemoveDoors', {
    Title = 'See-Through Sabotaged Doors',
    Description = 'If Imposter closed doors, you can still see through them.',
    Default = false,
    Callback = function(state)
        if state then
            for i,v in next, workspace.Map.Doors:GetChildren() do
                v.Parent = newCFolder
            end 
        else
            for i,v in next, newCFolder:GetChildren() do
                v.Parent = workspace.Map.Doors
            end
        end
    end
})

local doingEsp = nil
Tabs.Main:AddToggle('Player ESP', {
    Title = 'Player ESP',
    Description = 'Highlights players in the game, showing their position and color.',
    Default = false,
    Callback = function(state)
        if state then
            doingEsp = task.spawn(plrHighlights)
        else
            for i,v in next, playerParts do
                if v and v.Parent then
                    v:Destroy()
                end
                playerParts[i] = nil
            end
            if doingEsp then
                task.cancel(doingEsp)
                doingEsp = nil
            end
        end
    end
})

local blinkingEnabled = false
local oldw

oldw = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    if method == "FireServer" and tostring(self) == 'CSPipeline' and blinkingEnabled then
        return nil
    end
    return oldw(self, ...)
end)

Tabs.Main:AddToggle('BlinkMovement', {
    Title = 'Blink',
    Description = 'Players do not see your movement. Enable ESP to where others are.',
    Default = false,
    Callback = function(state)
        blinkingEnabled = state
        Fluent:Notify({
            Title = "Blink Movement",
            Content = state and "You're now 'AFK' for other players." or "You're no longer 'AFK'.",
            Duration = 3
        })
    end
})

local colorWheelTask = nil
Tabs.Main:AddToggle('ColorWheel', {
    Title = 'Color Wheel',
    Description = 'Automatically switches your color every 0.5 seconds to something random.',
    Default = false,
    Callback = function(state)
        if state then
            if not colorWheelTask then
                colorWheelTask = task.spawn(colorWheel)
            end
        else
            if colorWheelTask then
                task.cancel(colorWheelTask)
                colorWheelTask = nil
            end
        end
    end
})

local imposterAlertEnabled = false
Tabs.Main:AddToggle('ImposterAlert', {
    Title = 'Imposter Alert',
    Description = 'Alerts only when someone died.',
    Default = false,
    Callback = function(state)
        imposterAlertEnabled = state
        if state then
            imposterAlertEnabled = true
        end
    end
})


workspace.DeadBodies.ChildAdded:Connect(function(deadBody)
    if not imposterAlertEnabled then
        return
    end
    task.defer(function()
        local bodyPos = deadBody.Main and deadBody.Main.Position or deadBody.Position
        local allChars = Remotes.GetCharacters:InvokeServer()
        local closest, closestDist, closestColor = nil, math.huge, nil

        for name, data in next, allChars do
            if data.Alive and data.Position and name ~= deadBody.Name then
                local dist = (data.Position - bodyPos).Magnitude
                if dist < closestDist then
                    closest = data.LookData and data.LookData.PlayerName or name
                    closestColor = data.LookData and data.LookData.Color or "Unknown"
                    closestDist = dist
                end
            end
        end

        if closest then
            Fluent:Notify({
                Title = "Imposter Alert",
                Content = "Name: " .. tostring(closest) .. " | Color: " .. tostring(closestColor),
                Duration = 5
            })
        end
    end)
end)

local CFrameDelay = false
local isInterruptEnabled = false
workspace.InteractiveItems.ScanTask.Scanner:GetChildren()[3]:GetPropertyChangedSignal('CFrame'):Connect(function()
    if not isInterruptEnabled then
        return
    end
    if CFrameDelay then
        return
    end
    CFrameDelay = true
    task.delay(0.5, function()
        CFrameDelay = false
    end)
    Remotes.ScanInterrupted:FireServer()
end)


local clrsr = {}
for i, v in next, game:GetService("ReplicatedStorage").CharacterItems.Colors:GetChildren() do
    if v:IsA('Color3Value') then
        table.insert(clrsr, v.Name)
    end
end

local ColorDropdown = Tabs.Main:AddDropdown('ColorDropdown', {
    Title = 'Change Color',
    Description = 'Changes your color in-game. Color won\'t change if taken by another player.',
    Values = clrsr
})

ColorDropdown:OnChanged(function(color)
    if color then
        Remotes.RequestColor:InvokeServer(color)
    end
end)

Tabs.Impostor:AddButton({
    Title = 'Blink Kill Random',
    Description = 'Kills a random player and instantly teleports you back [Cooldown applies].',
    Callback = function()
        local targets = {}
        local otherCharacters = Remotes.GetCharacters:InvokeServer()
        for i,v in next, otherCharacters do
            if v.Alive and v.LookData.PlayerName ~= lplr.Name then
                table.insert(targets, v.LookData.PlayerName)
            end
        end
        if #targets > 0 then
            local target = targets[math.random(1, #targets)]
            Fluent:Notify({
                Title = "Blink Kill",
                Content = "Killing " .. target .. "...",
                Duration = 1.5
            })
            local oldPosition = otherCharacters[lplr.Name].Position
            Remotes.VentEvents.ExitVentRequest:FireServer(otherCharacters[target].Position)
            task.wait(0.2)
            Remotes.AttackRequest:InvokeServer(target)
            task.wait(0.1)
            Remotes.VentEvents.ExitVentRequest:FireServer(oldPosition)
        end
    end
})

Tabs.Impostor:AddToggle('InterruptMedbay', {
    Title = 'Interrupt Medbay Scan',
    Description = 'Disables the medbay scanning animation for all people.',
    Default = false,
    Callback = function(state)
        isInterruptEnabled = state
    end
})
