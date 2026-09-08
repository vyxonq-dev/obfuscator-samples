-- Services declaration
local playersService = game:GetService("Players")
local lightingService = game:GetService("Lighting")
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local replicatedStorage = game:GetService("ReplicatedStorage")
local materialService = game:GetService("MaterialService")
local workspaceService = game:GetService("Workspace")
local statsService = game:GetService("Stats")
local debrisService = game:GetService("Debris")
local textChatService = game:GetService("TextChatService")
print(":) loaded - ralph")

-- Client references
local clientPlayer = playersService.LocalPlayer
local PlayerGui = clientPlayer:WaitForChild("PlayerGui", 10)

-- Load WindUI library
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

-- Create main window
local Window = WindUI:CreateWindow({
    Title = "V1PRWARE",
    Icon = "sparkles",
    Author = "V1PR for maintenance, Glovsaken for original script.",
    Folder = "GlovSakenScript",
    Size = UDim2.fromOffset(350, 300),
    Transparent = false,
    Theme = "Dark",
    Resizable = false,
    SideBarWidth = 150,
    HideSearchBar = true,
    ScrollBarEnabled = false,
})

-- Window toggle key
Window:SetToggleKey(Enum.KeyCode.L)

-- Window text font
WindUI:SetFont("rbxasset://fonts/families/AccanthisADFStd.json")

-- Mobile open button configuration
Window:EditOpenButton({
    Title = "V1PRWARE",
    Icon = "sparkles",
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 0,
    Color = ColorSequence.new(
        Color3.fromHex("000000"), 
        Color3.fromHex("000000")
    ),
    OnlyMobile = true,
    Enabled = true,
    Draggable = true,
})

----------------------------------------------------------------
-- Setting Tab
----------------------------------------------------------------
local SettingTab = Window:Tab({
    Title = "Setting",
    Icon = "settings",
})

----------------------------------------------------------------
-- Interface Section
----------------------------------------------------------------
local InterfaceSection = SettingTab:Section({
    Title = "Interface",
    Opened = true,
})

-- Spoof Usernames - Variables
local settingSpoofUsernamesActive = false
local settingSpoofName = "V1PRWARE"
local settingOriginalTexts = {}        -- Stores original username text
local settingSpoofConnections = {}     -- Stores all active connections

-- Apply spoof to a single username label
local function settingSpoofUsernameLabel(label)
    if not (label:IsA("TextLabel") or label:IsA("TextButton")) then return end
    if label.Name ~= "Username" then return end

    if not settingOriginalTexts[label] then
        settingOriginalTexts[label] = label.Text
    end

    if settingSpoofUsernamesActive then
        label.Text = settingSpoofName
    end
end

-- Restore all original usernames
local function settingRestoreAllUsernames()
    for label, original in pairs(settingOriginalTexts) do
        if label and label.Parent then
            label.Text = original
        end
    end
    settingOriginalTexts = {}
end

-- Scan both MainUI and TemporaryUI for existing username labels
local function settingScanPlayerUI()
    local playerGui = playersService.LocalPlayer:FindFirstChild("PlayerGui")
    if not playerGui then return end

    local targets = {}
    local mainUI = playerGui:FindFirstChild("MainUI")
    local tempUI = playerGui:FindFirstChild("TemporaryUI")

    if mainUI then table.insert(targets, mainUI) end
    if tempUI then table.insert(targets, tempUI) end

    task.defer(function()
        for _, ui in ipairs(targets) do
            for _, obj in ipairs(ui:GetDescendants()) do
                if (obj:IsA("TextLabel") or obj:IsA("TextButton")) and obj.Name == "Username" then
                    settingSpoofUsernameLabel(obj)
                end
            end
        end
    end)
end

-- Start username spoofing system (connections + initial scan)
local function settingStartSpoofing()
    for _, conn in ipairs(settingSpoofConnections) do
        if conn.Connected then conn:Disconnect() end
    end
    settingSpoofConnections = {}

    local playerGui = playersService.LocalPlayer:FindFirstChild("PlayerGui")
    if not playerGui then return end

    settingScanPlayerUI()

    local function watchUI(ui)
        if not ui then return end
        local conn = ui.DescendantAdded:Connect(function(obj)
            if settingSpoofUsernamesActive and (obj:IsA("TextLabel") or obj:IsA("TextButton")) and obj.Name == "Username" then
                task.defer(settingSpoofUsernameLabel, obj)
            end
        end)
        table.insert(settingSpoofConnections, conn)
    end

    watchUI(playerGui:FindFirstChild("MainUI"))
    watchUI(playerGui:FindFirstChild("TemporaryUI"))

    local uiAppearConn = playerGui.ChildAdded:Connect(function(child)
        if child.Name == "MainUI" or child.Name == "TemporaryUI" then
            if settingSpoofUsernamesActive then
                task.delay(0.1, settingScanPlayerUI)
                watchUI(child)
            end
        end
    end)
    table.insert(settingSpoofConnections, uiAppearConn)
end

-- Stop spoofing and restore original names
local function settingStopSpoofing()
    for _, conn in ipairs(settingSpoofConnections) do
        if conn.Connected then conn:Disconnect() end
    end
    settingSpoofConnections = {}
    settingRestoreAllUsernames()
end

InterfaceSection:Toggle({
    Title = "Spoof Usernames",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        settingSpoofUsernamesActive = state
        if state then
            settingStartSpoofing()
        else
            settingStopSpoofing()
        end
    end
})

-- Keep chat always visible
local settingShowLogsChatEnabled = false
local settingShowLogsChatConnection = nil

local function settingKeepChatVisible()
    if not settingShowLogsChatEnabled then return end
    local chatWindow = textChatService:FindFirstChild("ChatWindowConfiguration")
    local chatInput = textChatService:FindFirstChild("ChatInputBarConfiguration")
    if chatWindow and not chatWindow.Enabled then chatWindow.Enabled = true end
    if chatInput and not chatInput.Enabled then chatInput.Enabled = true end
end

InterfaceSection:Toggle({
    Title = "Show Chat Logs",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        settingShowLogsChatEnabled = state
        if settingShowLogsChatConnection then
            settingShowLogsChatConnection:Disconnect()
            settingShowLogsChatConnection = nil
        end
        if state then
            settingKeepChatVisible()
            settingShowLogsChatConnection = runService.Heartbeat:Connect(settingKeepChatVisible)
            local chatWindow = textChatService:FindFirstChild("ChatWindowConfiguration")
            local chatInput = textChatService:FindFirstChild("ChatInputBarConfiguration")
            if chatWindow then chatWindow:GetPropertyChangedSignal("Enabled"):Connect(settingKeepChatVisible) end
            if chatInput then chatInput:GetPropertyChangedSignal("Enabled"):Connect(settingKeepChatVisible) end
        end
    end
})

-- Round timer position controller
local settingTimerPosition = "Middle"

local function settingApplyTimerPosition()
    local roundTimer = playersService.LocalPlayer.PlayerGui:FindFirstChild("RoundTimer")
    local main = roundTimer and roundTimer:FindFirstChild("Main")
    if main then
        local xPos = settingTimerPosition == "Middle" and 0.5 or 0.9
        main.Position = UDim2.new(xPos, 0, main.Position.Y.Scale, main.Position.Y.Offset)
    end
end

settingApplyTimerPosition()

InterfaceSection:Dropdown({
    Title = "Set Timer Position",
    Values = {"Middle", "Right"},
    Value = "Middle",
    Callback = function(value)
        settingTimerPosition = value
        settingApplyTimerPosition()
    end
})

-- Respawn handler for interface settings
playersService.LocalPlayer.CharacterAdded:Connect(function()
    task.delay(1, function()
        if settingSpoofUsernamesActive then
            settingStartSpoofing()
        end
        settingApplyTimerPosition()
    end)
end)

----------------------------------------------------------------
-- Global Tab
----------------------------------------------------------------
local GlobalTab = Window:Tab({
    Title = "Global",
    Icon = "globe",
    Locked = false,
})

----------------------------------------------------------------
-- Stamina Section
----------------------------------------------------------------
local StaminaSection = GlobalTab:Section({
    Title = "Stamina",
    Opened = true,
})

-- Infinite Stamina - Variables
local clientInfiniteStamina = false
local clientOriginalMinStamina = nil

-- Get reference to the Sprinting module
local function clientGetStaminaModule()
    local success, module = pcall(function()
        return require(replicatedStorage.Systems.Character.Game.Sprinting)
    end)
    return success and module or nil
end

-- Save the original MinStamina value
local function clientSaveOriginal()
    local stamina = clientGetStaminaModule()
    if not stamina then return end
    clientOriginalMinStamina = stamina.MinStamina or 0
end

-- Apply infinite stamina by setting MinStamina to -1000
local function clientApplyInfinite()
    local stamina = clientGetStaminaModule()
    if not stamina then return end
    stamina.MinStamina = -10000
end

-- Restore original MinStamina value
local function clientRestoreOriginal()
    if clientOriginalMinStamina == nil then return end
    local stamina = clientGetStaminaModule()
    if not stamina then return end
    stamina.MinStamina = clientOriginalMinStamina
end

StaminaSection:Toggle({
    Title = "Infinite Stamina",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        clientInfiniteStamina = state
        if state then
            clientSaveOriginal()
            clientApplyInfinite()
        else
            clientRestoreOriginal()
        end
    end
})

-- Reapply infinite stamina after character respawn
playersService.LocalPlayer.CharacterAdded:Connect(function()
    task.delay(1, function()
        if clientInfiniteStamina then
            clientSaveOriginal()
            clientApplyInfinite()
        end
    end)
end)

-- Initial character check on script load
if playersService.LocalPlayer.Character then
    task.delay(1, function()
        if clientInfiniteStamina then
            clientSaveOriginal()
            clientApplyInfinite()
        end
    end)
end

----------------------------------------------------------------
-- Status Section
----------------------------------------------------------------
local StatusSection = GlobalTab:Section({
    Title = "Status",
    Opened = true,
})

-- Status groups to block (only selected ones)
local avoidStatusGroups = {
    Slowness = {
        active = false,
        paths = { "Modules.StatusEffects.Slowness" }
    },
    Hallucination = {
        active = false,
        paths = { "Modules.StatusEffects.KillerExclusive.Hallucination" }
    },
    Visual = {
        active = false,
        paths = {
            "Modules.StatusEffects.Blindness",
            "Modules.StatusEffects.KillerExclusive.Glitched",
            "Modules.StatusEffects.SurvivorExclusive.Subspaced"
        }
    }
}

-- Cache for original module scripts
local avoidOriginalModules = {}

-- Get a descendant using dot-separated path
local function avoidGetDescendantFromPath(parent, path)
    local current = parent
    for segment in string.gmatch(path, "[^%.]+") do
        current = current:FindFirstChild(segment)
        if not current then return nil end
    end
    return current
end

-- Save original module and its source code
local function avoidSaveOriginal(path)
    if avoidOriginalModules[path] then return end
    local module = avoidGetDescendantFromPath(replicatedStorage, path)
    if module and module:IsA("ModuleScript") then
        local clone = module:Clone()
        avoidOriginalModules[path] = {
            clone = clone,
            source = module.Source
        }
    end
end

-- Restore destroyed module with original source
local function avoidRestoreModule(path)
    local data = avoidOriginalModules[path]
    if not data then return end
    local current = avoidGetDescendantFromPath(replicatedStorage, path)
    if current then current:Destroy() end
    local parentPath = path:match("^(.-%.?[^%.]+)$")
    local parent = avoidGetDescendantFromPath(replicatedStorage, parentPath)
    if parent then
        local restored = data.clone
        restored.Source = data.source
        restored.Parent = parent
    end
end

-- Destroy module to block status effect
local function avoidDestroyModule(path)
    avoidSaveOriginal(path)
    local module = avoidGetDescendantFromPath(replicatedStorage, path)
    if module then module:Destroy() end
end

-- Toggle a status group on/off
local function avoidToggleGroup(groupName)
    local group = avoidStatusGroups[groupName]
    if not group then return end
    group.active = not group.active
    for _, path in ipairs(group.paths) do
        if group.active then
            avoidDestroyModule(path)
        else
            avoidRestoreModule(path)
        end
    end
    -- Start background loop if any group is active
    local anyActive = false
    for _, g in pairs(avoidStatusGroups) do
        if g.active then anyActive = true; break end
    end
    if anyActive then
        avoidStartStatusLoop()
    else
        if avoidStatusLoop then
            task.cancel(avoidStatusLoop)
            avoidStatusLoop = nil
        end
    end
end

-- Background loop: re-destroy modules every 0.8 seconds
local avoidStatusLoop = nil
local function avoidStartStatusLoop()
    if avoidStatusLoop then return end
    avoidStatusLoop = task.spawn(function()
        while true do
            local anyActive = false
            for _, group in pairs(avoidStatusGroups) do
                if group.active then
                    anyActive = true
                    for _, path in ipairs(group.paths) do
                        local module = avoidGetDescendantFromPath(replicatedStorage, path)
                        if module then module:Destroy() end
                    end
                end
            end
            if not anyActive then break end
            task.wait(0.8)
        end
        avoidStatusLoop = nil
    end)
end

-- Create toggle buttons for each status group
StatusSection:Button({
    Title = "Avoid Slowness",
    Callback = function() avoidToggleGroup("Slowness") end
})

StatusSection:Button({
    Title = "Avoid Hallucination",
    Callback = function() avoidToggleGroup("Hallucination") end
})

StatusSection:Button({
    Title = "Avoid Visual Effects",
    Callback = function() avoidToggleGroup("Visual") end
})

-- Reset all status blocks on respawn
playersService.LocalPlayer.CharacterAdded:Connect(function()
    avoidOriginalModules = {}
    for _, group in pairs(avoidStatusGroups) do
        group.active = false
    end
    if avoidStatusLoop then
        task.cancel(avoidStatusLoop)
        avoidStatusLoop = nil
    end
end)

----------------------------------------------------------------
-- Network Section
----------------------------------------------------------------
local NetworkSection = GlobalTab:Section({
    Title = "Network",
    Opened = true,
})

-- Ghosting & Lag Mode - Variables
local inviGhostingActive = false
local inviLagModeActive = false
local inviBlockNetworkUpdates = false
local inviLagLoopRunning = false

-- Activate full ghosting (block all position updates)
local function inviActivateGhosting()
    inviBlockNetworkUpdates = true
end

-- Deactivate ghosting (allow updates again)
local function inviDeactivateGhosting()
    inviBlockNetworkUpdates = inviLagModeActive
end

-- Start alternating lag mode (2s ghost, 2s sync)
local function inviActivateLagMode()
    if inviLagLoopRunning then return end
    inviLagLoopRunning = true
    task.spawn(function()
        while inviLagModeActive do
            inviBlockNetworkUpdates = true
            task.wait(2)
            if not inviLagModeActive then break end
            inviBlockNetworkUpdates = false
            task.wait(2)
        end
        inviLagLoopRunning = false
    end)
end

-- Stop lag mode
local function inviDeactivateLagMode()
    inviLagLoopRunning = false
    inviBlockNetworkUpdates = inviGhostingActive
end

-- Reset network states on respawn
playersService.LocalPlayer.CharacterAdded:Connect(function()
    inviGhostingActive = false
    inviLagModeActive = false
    inviBlockNetworkUpdates = false
    inviLagLoopRunning = false
end)

-- Hook UnreliableRemoteEvent to block "UpdCF" packets
local function inviSetupNetworkHook()
    local modules = replicatedStorage:FindFirstChild("Modules")
    if not modules then return end
    local network = modules:FindFirstChild("Network")
    if not network then return end
    local unreliableRemote = network:FindFirstChild("UnreliableRemoteEvent")
    if not unreliableRemote then return end

    local oldFireServer
    oldFireServer = hookmetamethod(game, "__namecall", function(self, ...)
        local method = getnamecallmethod()
        if method == "FireServer" and self == unreliableRemote then
            local args = {...}
            if #args > 0 and args[1] == "UpdCF" and inviBlockNetworkUpdates then
                return -- Block position update packet
            end
        end
        return oldFireServer(self, ...)
    end)
end

-- Initialize network hook at startup
task.spawn(inviSetupNetworkHook)

NetworkSection:Toggle({
    Title = "Ghosting Mode",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        inviGhostingActive = state
        if state then
            inviActivateGhosting()
        else
            inviDeactivateGhosting()
        end
    end
})

NetworkSection:Toggle({
    Title = "Lag Mode",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        inviLagModeActive = state
        if state then
            inviActivateLagMode()
        else
            inviDeactivateLagMode()
        end
    end
})

----------------------------------------------------------------
-- Hitbox Section
----------------------------------------------------------------
local HitboxSection = GlobalTab:Section({
    Title = "Hitbox",
    Opened = true,
})

-- Hitbox Expander - Variables
local hitboxActive = false
local hitboxStrength = 50
local hitboxLoop = nil
local hitboxRemote = replicatedStorage:WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent")
local activeExtensions = {} -- Track active ability extensions

-- Valid ability names that trigger hitbox expansion
local hitboxValidAbilities = {
    ["Slash"] = true,
    ["Swing"] = true,
    ["Dagger"] = true,
    ["Charge"] = true,
    ["Punch"] = true,
    ["PlasmaBeam"] = true,
    ["Shoot"] = true,
    ["Behead"] = true,
    ["GashingWound"] = true,
    ["CorruptNature"] = true,
    ["WalkspeedOverride"] = true,
    ["Stab"] = true,
    ["Nova"] = true,
    ["MassInfection"] = true,
    ["Entanglement"] = true
}

-- Extract ability name from buffer format
local function hitboxParseAbilityName(rawName)
    if typeof(rawName) == "buffer" then
        -- Convert buffer to string and extract the ability name
        local bufferStr = buffer.tostring(rawName)
        -- Remove control characters and extract the actual ability name
        -- The format is typically: [control chars][ability name]
        local abilityName = bufferStr:match("[%a]+") -- Match alphabetic characters
        return abilityName or bufferStr:gsub("[^%w]", "") -- Fallback: remove non-alphanumeric
    else
        -- Handle regular string format
        return tostring(rawName):gsub("\"", "")
    end
end

-- Apply velocity boost forward during ability use
local function hitboxExtend(distance)
    local char = playersService.LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    local originalVel = hrp.AssemblyLinearVelocity
    local lookVector = hrp.CFrame.LookVector

    hrp.AssemblyLinearVelocity = originalVel + lookVector * distance
    runService.RenderStepped:Wait()

    if char and char.Parent and hrp and hrp.Parent then
        hrp.AssemblyLinearVelocity = originalVel
    end
end

-- Start listening for UseActorAbility events
local function hitboxStart()
    if hitboxLoop then return end
    
    hitboxLoop = hitboxRemote.OnClientEvent:Connect(function(action, data)
        if not hitboxActive then return end
        if action ~= "UseActorAbility" then return end
        if typeof(data) ~= "table" or not data[1] then return end

        -- Parse ability name from buffer or string
        local abilityName = hitboxParseAbilityName(data[1])
        if not abilityName then return end

        -- Check if ability is valid and not already active
        if not hitboxValidAbilities[abilityName] then return end
        if activeExtensions[abilityName] then return end -- Prevent stacking

        -- Mark ability as active
        activeExtensions[abilityName] = true
        local startTime = tick()
        local conn
        
        conn = runService.Heartbeat:Connect(function()
            -- Check timeout
            if tick() - startTime >= 1 then
                conn:Disconnect()
                activeExtensions[abilityName] = nil
                return
            end
            
            -- Only extend if still active and character exists
            if hitboxActive then
                hitboxExtend(hitboxStrength)
            else
                conn:Disconnect()
                activeExtensions[abilityName] = nil
            end
        end)
    end)
end

-- Stop hitbox listener and cleanup
local function hitboxStop()
    if hitboxLoop then
        hitboxLoop:Disconnect()
        hitboxLoop = nil
    end
    
    -- Clear all active extensions
    for ability, _ in pairs(activeExtensions) do
        activeExtensions[ability] = nil
    end
end

HitboxSection:Toggle({
    Title = "Hitbox Expander",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        hitboxActive = state
        if state then
            hitboxStart()
        else
            hitboxStop()
        end
    end
})

HitboxSection:Slider({
    Title = "Hitbox Strength",
    Step = 1,
    Value = { Min = 5, Max = 100, Default = 50 },
    Callback = function(value)
        hitboxStrength = value
    end
})

-- Reconnect hitbox on respawn
playersService.LocalPlayer.CharacterAdded:Connect(function()
    -- Clear active extensions on respawn
    for ability, _ in pairs(activeExtensions) do
        activeExtensions[ability] = nil
    end
    
    task.delay(1, function()
        if hitboxActive then
            hitboxStop()
            hitboxStart()
        end
    end)
end)

-- Cleanup on character removal
playersService.LocalPlayer.CharacterRemoving:Connect(function()
    for ability, _ in pairs(activeExtensions) do
        activeExtensions[ability] = nil
    end
end)

-- Reconnect hitbox on respawn
playersService.LocalPlayer.CharacterAdded:Connect(function()
    -- Clear active extensions on respawn
    for ability, _ in pairs(activeExtensions) do
        activeExtensions[ability] = nil
    end
    
    task.delay(1, function()
        if hitboxActive then
            hitboxStop()
            hitboxStart()
        end
    end)
end)

-- Cleanup on character removal
playersService.LocalPlayer.CharacterRemoving:Connect(function()
    for ability, _ in pairs(activeExtensions) do
        activeExtensions[ability] = nil
    end
end)

----------------------------------------------------------------
-- Generator Tab
----------------------------------------------------------------
local GeneratorTab = Window:Tab({
    Title = "Generator",
    Icon = "circuit-board",
    Locked = false,
})

----------------------------------------------------------------
-- Auto Section
----------------------------------------------------------------
local AutoSection = GeneratorTab:Section({
    Title = "Auto",
    Opened = true,
})

-- Flow Solver Variables
local genFlowSolverEnabled = false
local genFlowNodeDelay = 0.04
local genFlowLineDelay = 0.60

-- Refresh PuzzleUI reference
local function genRefreshPuzzleUI()
    genPuzzleUI = playersService.LocalPlayer.PlayerGui:FindFirstChild("PuzzleUI")
end

-- Direction helper for flow connections
local function genGetDirection(currRow, currCol, otherRow, otherCol)
    if otherRow < currRow then return "up" end
    if otherRow > currRow then return "down" end
    if otherCol < currCol then return "left" end
    if otherCol > currCol then return "right" end
end

-- Calculate connections for a node
local function genGetConnections(prev, curr, nextNode)
    local connections = {}
    if prev and curr then
        local dir = genGetDirection(curr.row, curr.col, prev.row, prev.col)
        if dir == "up" then dir = "down"
        elseif dir == "down" then dir = "up"
        elseif dir == "left" then dir = "right"
        elseif dir == "right" then dir = "left" end
        if dir then connections[dir] = true end
    end
    if nextNode and curr then
        local dir = genGetDirection(curr.row, curr.col, nextNode.row, nextNode.col)
        if dir then connections[dir] = true end
    end
    return connections
end

-- Check if two nodes are adjacent
local function genIsNeighbour(r1, c1, r2, c2)
    if r2 == r1 - 1 and c2 == c1 then return "up" end
    if r2 == r1 + 1 and c2 == c1 then return "down" end
    if r2 == r1 and c2 == c1 - 1 then return "left" end
    if r2 == r1 and c2 == c1 + 1 then return "right" end
    return false
end

-- Create unique key for node coordinates
local function genCoordKey(node) return node.row .. "-" .. node.col end

-- Order path starting from an endpoint
local function genOrderPath(path, endpoints)
    if not path or #path == 0 then return path end

    local startNode
    for _, ep in endpoints or {} do
        for _, n in path do
            if n.row == ep.row and n.col == ep.col then
                startNode = { row = ep.row, col = ep.col }
                break
            end
        end
        if startNode then break end
    end

    if not startNode then
        local inPath = {}
        for _, n in path do inPath[genCoordKey(n)] = n end
        for _, n in path do
            local neighbors = 0
            for _, dr, dc in { {-1,0}, {1,0}, {0,-1}, {0,1} } do
                local key = (n.row + dr) .. "-" .. (n.col + dc)
                if inPath[key] then neighbors += 1 end
            end
            if neighbors == 1 then
                startNode = { row = n.row, col = n.col }
                break
            end
        end
    end

    if not startNode then startNode = { row = path[1].row, col = path[1].col } end

    local remaining = {}
    for _, n in path do remaining[genCoordKey(n)] = { row = n.row, col = n.col } end

    local ordered = {}
    local current = startNode
    table.insert(ordered, { row = current.row, col = current.col })
    remaining[genCoordKey(current)] = nil

    while next(remaining) do
        local found = false
        for key, node in pairs(remaining) do
            if genIsNeighbour(current.row, current.col, node.row, node.col) then
                table.insert(ordered, { row = node.row, col = node.col })
                remaining[key] = nil
                current = node
                found = true
                break
            end
        end
        if not found then break end
    end
    return ordered
end

-- Draw the complete solution node by node
local function genDrawSolution(puzzle)
    if not puzzle or not puzzle.Solution then return end

    local indices = {}
    for i = 1, #puzzle.Solution do table.insert(indices, i) end
    for i = #indices, 2, -1 do
        local j = math.random(1, i)
        indices[i], indices[j] = indices[j], indices[i]
    end

    for _, colorIndex in indices do
        local path = puzzle.Solution[colorIndex]
        local endpoints = puzzle.targetPairs[colorIndex]
        local ordered = genOrderPath(path, endpoints)

        puzzle.paths[colorIndex] = {}
        for i, node in ipairs(ordered) do
            table.insert(puzzle.paths[colorIndex], { row = node.row, col = node.col })
            local prev = ordered[i-1]
            local nextNode = ordered[i+1]
            local conn = genGetConnections(prev, node, nextNode)
            puzzle.gridConnections = puzzle.gridConnections or {}
            puzzle.gridConnections[genCoordKey(node)] = conn
            puzzle:updateGui()
            task.wait(genFlowNodeDelay)
        end

        task.wait(genFlowLineDelay)
        puzzle:checkForWin()
    end
end

-- Hook FlowGame module to auto-solve when puzzle opens
local genFlowModule = replicatedStorage:FindFirstChild("Modules")
    and replicatedStorage.Modules:FindFirstChild("Misc")
    and replicatedStorage.Modules.Misc:FindFirstChild("FlowGameManager")
    and replicatedStorage.Modules.Misc.FlowGameManager:FindFirstChild("FlowGame")

if genFlowModule then
    local FlowGame = require(genFlowModule)
    local oldNew = FlowGame.new
    FlowGame.new = function(...)
        local puzzle = oldNew(...)
        if genFlowSolverEnabled then
            task.spawn(function()
                task.wait(0.3)
                genDrawSolution(puzzle)
            end)
        end
        return puzzle
    end
end

-- UI CONTROLS
AutoSection:Toggle({
    Title = "Auto Generator",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        genFlowSolverEnabled = state
    end
})

AutoSection:Slider({
    Title = "Node Draw Speed",
    Step = 0.02,
    Value = { Min = 0.01, Max = 0.50, Default = 0.04 },
    Callback = function(value)
        genFlowNodeDelay = value
    end
})

AutoSection:Slider({
    Title = "Delay Between Lines",
    Step = 0.10,
    Value = { Min = 0.00, Max = 1.00, Default = 0.40 },
    Callback = function(value)
        genFlowLineDelay = value
    end
})

-- Monitor PuzzleUI appearance
playersService.LocalPlayer.PlayerGui.ChildAdded:Connect(function(child)
    if child.Name == "PuzzleUI" then
        genRefreshPuzzleUI()
    end
end)

playersService.LocalPlayer.PlayerGui.ChildRemoved:Connect(function()
    genPuzzleUI = nil
end)

genRefreshPuzzleUI()

----------------------------------------------------------------
-- Visual Tab
----------------------------------------------------------------
local VisualTab = Window:Tab({
    Title = "Visual",
    Icon = "eye"
})

----------------------------------------------------------------
-- Esp Section
----------------------------------------------------------------
local EspSection = VisualTab:Section({
    Title = "Esp",
    Opened = true,
})

-- ESP States
local espKillersEnabled = false
local espSurvivorsEnabled = false
local espGeneratorsEnabled = false
local espItemsEnabled = false
local espBuildingsEnabled = false  -- NEW: Building ESP state
local espShadowsEnabled = false  -- NEW: John Doe Shadow ESP state

-- Folder references
local killersFolder = nil
local survivorsFolder = nil
local currentMapFolder = nil

-- Connections storage
local playerConnections = {}
local mapConnections = {}
local healthConnections = {}
local progressConnections = {}
local shadowConnections = {}  -- NEW: Shadow ESP connections
local trackedShadows = {}  -- NEW: Track shadow parts

-- Get current Map folder safely
-- Note: Generators/items are in workspace.Map.Ingame.Map
local function getCurrentMapFolder()
    local map = workspaceService:FindFirstChild("Map")
    if not map then return nil end
    local ingame = map:FindFirstChild("Ingame")
    if not ingame then return nil end
    return ingame:FindFirstChild("Map")
end

-- Get workspace.Map.Ingame directly for buildings
-- Buildings are placed in workspace.Map.Ingame, not in workspace.Map.Ingame.Map
local function getIngameFolder()
    local map = workspaceService:FindFirstChild("Map")
    if not map then return nil end
    return map:FindFirstChild("Ingame")
end

-- Add ESP to any object (player or map object)
-- NOTE: This function follows the exact pattern from existing ESP implementation
-- Parameters:
--   obj: The target object to add ESP to
--   espName: Unique identifier for the ESP (e.g., "Visual_ESP_Killer")
--   color: RGB color for the highlight and text
--   isPlayer: Boolean indicating if this is a player character (affects label positioning and health display)
local function addESP(obj, espName, color, isPlayer)
    if not obj or obj:FindFirstChild(espName) then return end
    
    -- Enhanced root part detection for buildings and other objects
    local root = obj:FindFirstChild("HumanoidRootPart") 
        or obj.PrimaryPart 
        or obj:FindFirstChildWhichIsA("BasePart")
        or obj:FindFirstChildOfClass("BasePart")
        or obj:FindFirstChild("Base")
        or obj:FindFirstChild("Main")
    
    -- Fallback: search descendants for any BasePart
    if not root then
        for _, descendant in ipairs(obj:GetDescendants()) do
            if descendant:IsA("BasePart") then
                root = descendant
                break
            end
        end
    end
    
    if not root then 
        warn("[ESP] No valid root part found for:", obj.Name, "Class:", obj.ClassName)
        return 
    end

    pcall(function()
        -- Highlight with filled color (transparency 0.8 for subtle visibility)
        local highlight = Instance.new("Highlight")
        highlight.Name = espName
        highlight.FillColor = color
        highlight.FillTransparency = 0.8
        highlight.OutlineColor = color
        highlight.OutlineTransparency = 0
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlight.Adornee = obj
        highlight.Parent = obj

        -- Billboard label for displaying text information
        local billboard = Instance.new("BillboardGui")
        billboard.Name = espName .. "_Label"
        billboard.Adornee = root
        billboard.Size = UDim2.new(0, 100, 0, 20)
        -- Adjust StudsOffset for better visibility (higher for non-players)
        billboard.StudsOffset = Vector3.new(0, isPlayer and 3.5 or 3.8, 0)
        billboard.AlwaysOnTop = true
        billboard.MaxDistance = 1000
        billboard.Parent = obj

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.TextColor3 = color
        label.TextStrokeTransparency = 0.5
        label.TextStrokeColor3 = Color3.new(0, 0, 0)
        label.TextSize = 15
        label.FontFace = Font.new("rbxasset://fonts/families/AccanthisADFStd.json")
        label.Parent = billboard

        -- Player health tracking
        if isPlayer then
            local humanoid = obj:FindFirstChildOfClass("Humanoid")
            if humanoid then
                label.Text = obj.Name .. " (100%)"
                local conn = humanoid.HealthChanged:Connect(function()
                    if label.Parent then
                        label.Text = obj.Name .. " (" .. math.floor((humanoid.Health / humanoid.MaxHealth) * 100) .. "%)"
                    end
                end)
                healthConnections[obj] = conn
            else
                label.Text = obj.Name
            end
        else
            -- Generator progress tracking or item name display
            local progress = obj:FindFirstChild("Progress")
            if progress and progress:IsA("NumberValue") then
                label.Text = math.floor(progress.Value) .. "%"
                local conn = progress.Changed:Connect(function()
                    if label.Parent then
                        label.Text = math.floor(progress.Value) .. "%"
                    end
                end)
                progressConnections[obj] = conn
            else
                label.Text = obj.Name
            end
        end
    end)
end

-- Remove ESP from object
local function removeESP(obj, espName)
    if not obj then return end
    pcall(function()
        if obj:FindFirstChild(espName) then obj[espName]:Destroy() end
        if obj:FindFirstChild(espName .. "_Label") then obj[espName .. "_Label"]:Destroy() end
        if healthConnections[obj] then
            healthConnections[obj]:Disconnect()
            healthConnections[obj] = nil
        end
        if progressConnections[obj] then
            progressConnections[obj]:Disconnect()
            progressConnections[obj] = nil
        end
    end)
end

-- Apply ESP to all killers currently in folder
local function applyKillersESP()
    if not killersFolder then return end
    for _, killer in ipairs(killersFolder:GetChildren()) do
        if killer:IsA("Model") then
            addESP(killer, "Visual_ESP_Killer", Color3.fromRGB(255, 0, 0), true)
        end
    end
end

-- Apply ESP to all survivors currently in folder
local function applySurvivorsESP()
    if not survivorsFolder then return end
    for _, survivor in ipairs(survivorsFolder:GetChildren()) do
        if survivor:IsA("Model") then
            addESP(survivor, "Visual_ESP_Survivor", Color3.fromRGB(255, 255, 0), true)
        end
    end
end

-- Apply ESP to all generators in current map (Orange color)
local function applyGeneratorsESP()
    local map = getCurrentMapFolder()
    if not map then return end
    for _, obj in ipairs(map:GetChildren()) do
        if obj.Name == "Generator" then
            addESP(obj, "Visual_ESP_Generator", Color3.fromRGB(255, 165, 0), false)
        end
    end
end

-- Apply ESP to all items in current map (White color)
local function applyItemsESP()
    local map = getCurrentMapFolder()
    if not map then return end
    for _, obj in ipairs(map:GetChildren()) do
        if obj.Name == "BloxyCola" or obj.Name == "Medkit" then
            addESP(obj, "Visual_ESP_Item", Color3.fromRGB(255, 255, 255), false)
        end
    end
end

-- NEW: Apply ESP to all buildings in workspace.Map.Ingame (Red-Orange color for visibility)
-- Buildings include: BuildermanSentry and SubspaceTripmine
-- NOTE: Buildings are in workspace.Map.Ingame, while generators/items are in workspace.Map.Ingame.Map
local function applyBuildingsESP()
    local ingame = getIngameFolder()
    if not ingame then 
        print("[Building ESP] No workspace.Map.Ingame folder found")
        return 
    end
    
    local buildingCount = 0
    for _, obj in ipairs(ingame:GetChildren()) do
        if obj.Name == "BuildermanSentry" or obj.Name == "SubspaceTripmine" then
            print("[Building ESP] Found building:", obj.Name, "Class:", obj.ClassName)
            buildingCount = buildingCount + 1
            -- Using red-orange color (255, 50, 0) to differentiate from generators
            addESP(obj, "Visual_ESP_Building", Color3.fromRGB(255, 50, 0), false)
        end
    end
    
    if buildingCount == 0 then
        print("[Building ESP] No buildings found in workspace.Map.Ingame")
    else
        print("[Building ESP] Applied ESP to", buildingCount, "buildings")
    end
end

-- NEW: John Doe Shadow ESP Functions
-- Add ESP to a shadow part
local function addShadowESP(shadowPart)
    if not shadowPart or shadowPart:FindFirstChild("Shadow_ESP") then return end
    if not shadowPart:IsA("BasePart") then return end
    
    pcall(function()
        -- Red highlight for shadow parts
        local highlight = Instance.new("Highlight")
        highlight.Name = "Shadow_ESP"
        highlight.FillColor = Color3.fromRGB(255, 0, 0)
        highlight.FillTransparency = 0.5
        highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
        highlight.OutlineTransparency = 0
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlight.Adornee = shadowPart
        highlight.Parent = shadowPart
        
        trackedShadows[shadowPart] = true
        print("[Shadow ESP] Added ESP to shadow part:", shadowPart:GetFullName())
    end)
end

-- Remove ESP from a shadow part
local function removeShadowESP(shadowPart)
    if not shadowPart then return end
    pcall(function()
        if shadowPart:FindFirstChild("Shadow_ESP") then
            shadowPart.Shadow_ESP:Destroy()
        end
        trackedShadows[shadowPart] = nil
    end)
end

-- Scan for all player shadow folders and apply ESP
local function applyShadowESP()
    local ingame = getIngameFolder()
    if not ingame then 
        print("[Shadow ESP] No workspace.Map.Ingame folder found")
        return 
    end
    
    print("[Shadow ESP] Scanning workspace.Map.Ingame for shadow folders...")
    print("[Shadow ESP] Total children in Ingame:", #ingame:GetChildren())
    
    local shadowCount = 0
    local foldersChecked = 0
    
    -- Look for folders matching pattern: [PlayerName]Shadows
    for _, folder in ipairs(ingame:GetChildren()) do
        foldersChecked = foldersChecked + 1
        print("[Shadow ESP] Checking:", folder.Name, "Type:", folder.ClassName)
        
        if folder.Name:match("Shadows$") then
            print("[Shadow ESP] ✓ Found shadow folder:", folder.Name)
            
            if folder:IsA("Folder") or folder:IsA("Model") then
                print("[Shadow ESP] Searching for Shadow parts in:", folder.Name)
                
                -- Look for Shadow parts inside
                for _, child in ipairs(folder:GetDescendants()) do
                    print("[Shadow ESP]   Descendant:", child.Name, "Class:", child.ClassName)
                    if child.Name == "Shadow" and child:IsA("BasePart") then
                        print("[Shadow ESP]   ✓✓ Found Shadow part!")
                        addShadowESP(child)
                        shadowCount = shadowCount + 1
                    end
                end
            else
                print("[Shadow ESP] ✗ Not a Folder or Model, skipping")
            end
        end
    end
    
    print("[Shadow ESP] Folders checked:", foldersChecked)
    if shadowCount == 0 then
        print("[Shadow ESP] No shadow parts found")
    else
        print("[Shadow ESP] Applied ESP to", shadowCount, "shadow parts")
    end
end

-- Remove all shadow ESP
local function removeAllShadowESP()
    for shadowPart, _ in pairs(trackedShadows) do
        removeShadowESP(shadowPart)
    end
    trackedShadows = {}
end

-- Monitor for new shadow folders and parts
local function setupShadowWatcher()
    -- Disconnect existing connections
    for _, conn in pairs(shadowConnections) do
        if conn.Connected then conn:Disconnect() end
    end
    shadowConnections = {}
    
    local ingame = getIngameFolder()
    if not ingame then return end
    
    print("[Shadow ESP] Setting up watchers on workspace.Map.Ingame")
    
    -- Watch for new folders being added to Ingame
    local folderAddedConn = ingame.ChildAdded:Connect(function(child)
        if not espShadowsEnabled then return end
        
        print("[Shadow ESP] New child added to Ingame:", child.Name, "Type:", child.ClassName)
        
        -- Check if it's a shadow folder (accept both Folder and Model)
        if child.Name:match("Shadows$") and (child:IsA("Folder") or child:IsA("Model")) then
            print("[Shadow ESP] New shadow folder detected:", child.Name)
            task.wait(0.2)
            
            -- Apply ESP to existing shadows in the folder
            for _, descendant in ipairs(child:GetDescendants()) do
                if descendant.Name == "Shadow" and descendant:IsA("BasePart") then
                    print("[Shadow ESP] Found Shadow part in new folder")
                    addShadowESP(descendant)
                end
            end
            
            -- Watch for new shadows being added to this folder
            local shadowAddedConn = child.DescendantAdded:Connect(function(descendant)
                if espShadowsEnabled and descendant.Name == "Shadow" and descendant:IsA("BasePart") then
                    print("[Shadow ESP] New Shadow part added to folder")
                    task.wait(0.1)
                    addShadowESP(descendant)
                end
            end)
            table.insert(shadowConnections, shadowAddedConn)
        end
    end)
    table.insert(shadowConnections, folderAddedConn)
    
    -- Watch for folders being removed
    local folderRemovedConn = ingame.ChildRemoved:Connect(function(child)
        if child.Name:match("Shadows$") then
            print("[Shadow ESP] Shadow folder removed:", child.Name)
            -- Clean up ESP from shadows in this folder
            for _, descendant in ipairs(child:GetDescendants()) do
                if descendant.Name == "Shadow" then
                    removeShadowESP(descendant)
                end
            end
        end
    end)
    table.insert(shadowConnections, folderRemovedConn)
    
    -- Watch existing shadow folders for new shadows
    for _, folder in ipairs(ingame:GetChildren()) do
        if folder.Name:match("Shadows$") and (folder:IsA("Folder") or folder:IsA("Model")) then
            print("[Shadow ESP] Setting up watcher on existing folder:", folder.Name)
            local shadowAddedConn = folder.DescendantAdded:Connect(function(descendant)
                if espShadowsEnabled and descendant.Name == "Shadow" and descendant:IsA("BasePart") then
                    print("[Shadow ESP] New Shadow part added")
                    task.wait(0.1)
                    addShadowESP(descendant)
                end
            end)
            table.insert(shadowConnections, shadowAddedConn)
        end
    end
    
    print("[Shadow ESP] Watcher setup complete. Active connections:", #shadowConnections)
end

-- Clear all map-based ESP (called when map is destroyed)
local function clearMapESP()
    local oldMap = currentMapFolder
    if oldMap then
        for _, obj in ipairs(oldMap:GetChildren()) do
            if obj.Name == "Generator" then
                removeESP(obj, "Visual_ESP_Generator")
            elseif obj.Name == "BloxyCola" or obj.Name == "Medkit" then
                removeESP(obj, "Visual_ESP_Item")
            end
        end
    end
    
    -- Also clear buildings from Ingame folder
    local ingame = getIngameFolder()
    if ingame then
        for _, obj in ipairs(ingame:GetChildren()) do
            if obj.Name == "BuildermanSentry" or obj.Name == "SubspaceTripmine" then
                removeESP(obj, "Visual_ESP_Building")  -- NEW: Clear building ESP
            end
        end
    end
end

-- Setup player folder connections (Killers & Survivors)
local function setupPlayerConnections()
    for _, conn in pairs(playerConnections) do
        if conn.Connected then conn:Disconnect() end
    end
    playerConnections = {}

    if killersFolder then
        table.insert(playerConnections, killersFolder.ChildAdded:Connect(function(child)
            task.wait(0.2)
            if espKillersEnabled then
                addESP(child, "Visual_ESP_Killer", Color3.fromRGB(255, 0, 0), true)
            end
        end))
        table.insert(playerConnections, killersFolder.ChildRemoved:Connect(function(child)
            removeESP(child, "Visual_ESP_Killer")
        end))
    end

    if survivorsFolder then
        table.insert(playerConnections, survivorsFolder.ChildAdded:Connect(function(child)
            task.wait(0.2)
            if espSurvivorsEnabled then
                addESP(child, "Visual_ESP_Survivor", Color3.fromRGB(255, 255, 0), true)
            end
        end))
        table.insert(playerConnections, survivorsFolder.ChildRemoved:Connect(function(child)
            removeESP(child, "Visual_ESP_Survivor")
        end))
    end
end

-- Setup map folder watcher
-- NOTE: Extended to include building ESP tracking in workspace.Map.Ingame
local function setupMapWatcher()
    for _, conn in pairs(mapConnections) do
        if conn.Connected then conn:Disconnect() end
    end
    mapConnections = {}

    local ingame = workspaceService:FindFirstChild("Map") and workspaceService.Map:FindFirstChild("Ingame")
    if not ingame then return end

    -- Watch for buildings being added/removed in Ingame folder
    local buildingAddedConn = ingame.ChildAdded:Connect(function(obj)
        task.wait(0.2)
        if espBuildingsEnabled and (obj.Name == "BuildermanSentry" or obj.Name == "SubspaceTripmine") then
            addESP(obj, "Visual_ESP_Building", Color3.fromRGB(255, 50, 0), false)
        end
    end)
    
    local buildingRemovedConn = ingame.ChildRemoved:Connect(function(obj)
        if obj.Name == "BuildermanSentry" or obj.Name == "SubspaceTripmine" then
            removeESP(obj, "Visual_ESP_Building")
        end
    end)
    
    table.insert(mapConnections, buildingAddedConn)
    table.insert(mapConnections, buildingRemovedConn)

    -- Watch for generators/items in Map subfolder
    local mapAddedConn = ingame.ChildAdded:Connect(function(child)
        if child.Name == "Map" then
            task.wait(1)
            currentMapFolder = child

            -- Monitor new objects being added to the map
            child.ChildAdded:Connect(function(obj)
                task.wait(0.2)
                if espGeneratorsEnabled and obj.Name == "Generator" then
                    addESP(obj, "Visual_ESP_Generator", Color3.fromRGB(255, 165, 0), false)
                elseif espItemsEnabled and (obj.Name == "BloxyCola" or obj.Name == "Medkit") then
                    addESP(obj, "Visual_ESP_Item", Color3.fromRGB(255, 255, 255), false)
                end
            end)

            -- Monitor objects being removed from the map
            child.ChildRemoved:Connect(function(obj)
                if obj.Name == "Generator" then
                    removeESP(obj, "Visual_ESP_Generator")
                elseif obj.Name == "BloxyCola" or obj.Name == "Medkit" then
                    removeESP(obj, "Visual_ESP_Item")
                end
            end)

            -- Apply ESP to existing objects in the new map
            if espGeneratorsEnabled then applyGeneratorsESP() end
            if espItemsEnabled then applyItemsESP() end
        end
    end)

    local mapRemovedConn = ingame.ChildRemoved:Connect(function(child)
        if child.Name == "Map" then
            clearMapESP()
            currentMapFolder = nil
        end
    end)

    table.insert(mapConnections, mapAddedConn)
    table.insert(mapConnections, mapRemovedConn)

    -- Check for existing map on script load
    local existingMap = getCurrentMapFolder()
    if existingMap then
        currentMapFolder = existingMap
        task.spawn(function()
            task.wait(2)
            if espGeneratorsEnabled then applyGeneratorsESP() end
            if espItemsEnabled then applyItemsESP() end
        end)
    end
    
    -- Apply building ESP to existing buildings on script load
    if espBuildingsEnabled then 
        task.spawn(function()
            task.wait(2)
            applyBuildingsESP()
        end)
    end
end

-- Initial setup
task.spawn(function()
    task.wait(3)
    local players = workspaceService:FindFirstChild("Players")
    if players then
        killersFolder = players:FindFirstChild("Killers")
        survivorsFolder = players:FindFirstChild("Survivors")
        setupPlayerConnections()
        if espKillersEnabled then applyKillersESP() end
        if espSurvivorsEnabled then applySurvivorsESP() end
    end
    setupMapWatcher()
    
    -- Setup shadow ESP watcher
    if espShadowsEnabled then
        setupShadowWatcher()
    end
end)

-- UI Controls
EspSection:Toggle({
    Title = "Esp Killers",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        espKillersEnabled = state
        if state then applyKillersESP() else
            if killersFolder then
                for _, k in ipairs(killersFolder:GetChildren()) do
                    removeESP(k, "Visual_ESP_Killer")
                end
            end
        end
    end
})

EspSection:Toggle({
    Title = "Esp Survivors",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        espSurvivorsEnabled = state
        if state then applySurvivorsESP() else
            if survivorsFolder then
                for _, s in ipairs(survivorsFolder:GetChildren()) do
                    removeESP(s, "Visual_ESP_Survivor")
                end
            end
        end
    end
})

EspSection:Toggle({
    Title = "Esp Generators",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        espGeneratorsEnabled = state
        if state then applyGeneratorsESP() else
            local map = getCurrentMapFolder()
            if map then
                for _, gen in ipairs(map:GetChildren()) do
                    if gen.Name == "Generator" then
                        removeESP(gen, "Visual_ESP_Generator")
                    end
                end
            end
        end
    end
})

EspSection:Toggle({
    Title = "Esp Items",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        espItemsEnabled = state
        if state then applyItemsESP() else
            local map = getCurrentMapFolder()
            if map then
                for _, item in ipairs(map:GetChildren()) do
                    if item.Name == "BloxyCola" or item.Name == "Medkit" then
                        removeESP(item, "Visual_ESP_Item")
                    end
                end
            end
        end
    end
})

-- NEW: Building ESP Toggle
-- This toggle controls ESP for BuildermanSentry and SubspaceTripmine
-- Uses red-orange color (255, 50, 0) to differentiate from other ESP types
-- Buildings are located in workspace.Map.Ingame
EspSection:Toggle({
    Title = "Esp Buildings",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        espBuildingsEnabled = state
        if state then 
            print("[Building ESP] Enabled - Searching for buildings...")
            applyBuildingsESP() 
        else
            print("[Building ESP] Disabled - Removing ESP...")
            local ingame = getIngameFolder()
            if ingame then
                for _, building in ipairs(ingame:GetChildren()) do
                    if building.Name == "BuildermanSentry" or building.Name == "SubspaceTripmine" then
                        removeESP(building, "Visual_ESP_Building")
                    end
                end
            end
        end
    end
})

-- NEW: John Doe Shadow ESP Toggle
-- This toggle controls ESP for John Doe shadow traps
-- Uses red color (255, 0, 0) to indicate danger
-- Shadows are located in workspace.Map.Ingame in folders ending with "Shadows"
EspSection:Toggle({
    Title = "Esp John Doe Shadows",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        espShadowsEnabled = state
        if state then 
            print("[Shadow ESP] Enabled - Searching for shadows...")
            setupShadowWatcher()
            applyShadowESP()
        else
            print("[Shadow ESP] Disabled - Removing ESP...")
            removeAllShadowESP()
            -- Disconnect watchers
            for _, conn in pairs(shadowConnections) do
                if conn.Connected then conn:Disconnect() end
            end
            shadowConnections = {}
        end
    end
})

-- Debug button to list all objects in Ingame folder
EspSection:Button({
    Title = "Debug: List Ingame Objects",
    Callback = function()
        local ingame = getIngameFolder()
        if not ingame then
            print("[Debug] No workspace.Map.Ingame folder found!")
            return
        end
        print("[Debug] === Ingame Folder Contents ===")
        local total = 0
        local buildings = 0
        local shadowFolders = 0
        local shadowParts = 0
        
        for _, obj in ipairs(ingame:GetChildren()) do
            total = total + 1
            print("[Debug]", obj.Name, "-", obj.ClassName)
            
            if obj.Name == "BuildermanSentry" or obj.Name == "SubspaceTripmine" then
                buildings = buildings + 1
                print("[Debug]   ^ BUILDING FOUND!")
                -- Check structure
                if obj:IsA("Model") then
                    print("[Debug]   PrimaryPart:", obj.PrimaryPart)
                    for _, child in ipairs(obj:GetChildren()) do
                        if child:IsA("BasePart") then
                            print("[Debug]     - BasePart:", child.Name)
                        end
                    end
                end
            elseif obj.Name:match("Shadows$") then
                shadowFolders = shadowFolders + 1
                print("[Debug]   ^ SHADOW FOLDER FOUND!")
                -- Count shadows in this folder
                for _, descendant in ipairs(obj:GetDescendants()) do
                    if descendant.Name == "Shadow" and descendant:IsA("BasePart") then
                        shadowParts = shadowParts + 1
                        print("[Debug]     - Shadow part:", descendant:GetFullName())
                    end
                end
            end
        end
        print("[Debug] Total objects in Ingame:", total)
        print("[Debug] Buildings found:", buildings)
        print("[Debug] Shadow folders found:", shadowFolders)
        print("[Debug] Shadow parts found:", shadowParts)
    end
})

----------------------------------------------------------------
-- Character Tab
----------------------------------------------------------------
local CharacterTab = Window:Tab({
    Title = "Character",
    Icon = "user",
    Locked = false,
})

----------------------------------------------------------------
-- Killers Section
----------------------------------------------------------------
local KillersSection = CharacterTab:Section({
    Title = "Killers",
    Opened = false,
})

KillersSection:Button({
    Title = "Slasher",
    Locked = true,
    Callback = function()
        loadstring(game:HttpGet(""))()
    end
})

----------------------------------------------------------------
-- Survivors Section
----------------------------------------------------------------
local SurvivorsSection = CharacterTab:Section({
    Title = "Survivors",
    Locked = true,
    Opened = true,
})

SurvivorsSection:Button({
    Title = "Veeronica",
    Locked = true,
    Callback = function()
       loadstring(game:HttpGet(""))()
    end
})

----------------------------------------------------------------
-- Sentinels Section
----------------------------------------------------------------
local SentinelsSection = CharacterTab:Section({
    Title = "Sentinels",
    Opened = true,
})

SentinelsSection:Button({
    Title = "Guest1337",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/56NdxvpM"))()
    end
})

SentinelsSection:Button({
    Title = "Shedletsky, (Just use hitbox expander bro.)",
    Locked = true,
    Callback = function()
        loadstring(game:HttpGet(""))()
    end
})

SentinelsSection:Button({
    Title = "Chance",
    Locked = true,
    Callback = function()
        loadstring(game:HttpGet(""))()
    end
})

SentinelsSection:Button({
    Title = "TwoTime",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/4v3iUxhN"))() 
    end
})

----------------------------------------------------------------
-- Supports Section
----------------------------------------------------------------
local SupportsSection = CharacterTab:Section({
    Title = "Supports",
    Locked = true,
    Opened = false,
})

SupportsSection:Button({
    Title = "Dusekkar",
    Locked = true,
    Callback = function()
        loadstring(game:HttpGet(""))()
    end
})

SupportsSection:Button({
    Title = "Elliot",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/cD2nYPxE"))()
    end
})

----------------------------------------------------------------
-- Interface Tab
----------------------------------------------------------------
local InterfaceTab = Window:Tab({
    Title = "Interface",
    Icon = "scan",
    Locked = false,
})

----------------------------------------------------------------
-- UI Functions Section
----------------------------------------------------------------
local UIFunctionsSection = InterfaceTab:Section({ 
    Title = "UI Functions",
    Opened = true,
})

-- Close UI
InterfaceTab:Button({
    Title = "Close UI",
    Locked = false,
    Callback = function()
        Window:Destroy()
    end
})
