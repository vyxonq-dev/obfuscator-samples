local globalapi = {}
local scriptconfig = {
    Prefix = "/",
    PlayerPrefix = "!",
    MainAccount = "1u4ub",
    AltAccounts = {
        ["1uauv"] = true;
    },
}
local mainAPI = loadstring(game:HttpGet("https://raw.githubusercontent.com/ProphecySkondo/finalstand/refs/heads/main/apis/main.lua"))()
local cloneref = rawget(_G, "cloneref") or function(v) return v end
local Players = cloneref(game:GetService("Players"))
local TeleportService = cloneref(game:GetService("TeleportService"))
local RunService = cloneref(game:GetService("RunService"))
local TweenService = cloneref(game:GetService("TweenService"))
local plr = Players.LocalPlayer
local wfile, rfile, mfolder = writefile, readfile, makefolder
assert(plr, "LocalPlayer not found")

local function IsMain()
    return plr.Name == scriptconfig.MainAccount
end

local function IsAlt()
    return scriptconfig.AltAccounts[plr.Name] == true
end

local function QuickReset(player)
    if not player then return end
    if player.Character then
        local humanoid = player.Character:FindFirstChildWhichIsA("Humanoid")
        if humanoid and humanoid.Parent then
            pcall(function() humanoid.Health = 0 end)
        end
        pcall(function() if player.Character then player.Character:BreakJoints() end end)
    end
end

local function Rejoin(seconds)
    if not TeleportService then return end
    task.delay(seconds or 0.2, function()
        pcall(function() TeleportService:Teleport(game.PlaceId, plr) end)
    end)
end

local function NamePlateAccount(player, text)
    if not player then return end
    if not player.Character then player.CharacterAdded:Wait() end
    local character = player.Character
    if not character then return end
    local head = character:FindFirstChild("Head")
    if not head then return end
    local old = head:FindFirstChild("CustomNameplate")
    if old then old:Destroy() end
    local billboard = cloneref(Instance.new("BillboardGui"))
    billboard.Name = "CustomNameplate"
    billboard.Size = UDim2.new(0, 200, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 2.5, 0)
    billboard.AlwaysOnTop = true
    billboard.Adornee = head
    billboard.Parent = head
    local label = cloneref(Instance.new("TextLabel"))
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = tostring(text or "")
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextStrokeTransparency = 0.2
    label.Font = Enum.Font.SourceSansBold
    label.TextScaled = true
    label.Parent = billboard
end

scriptconfig.CommandHandlers = scriptconfig.CommandHandlers or {}
scriptconfig.ActiveProcesses = scriptconfig.ActiveProcesses or {}

local function stopActiveProcess(key)
    local entry = scriptconfig.ActiveProcesses[key]
    if not entry then return end
    pcall(function()
        if entry.tween then entry.tween:Cancel() end
    end)
    pcall(function()
        if entry.heartbeatConn then entry.heartbeatConn:Disconnect() end
    end)
    pcall(function()
        if entry.conn then entry.conn:Disconnect() end
    end)
    pcall(function()
        if entry.charAddedConn then entry.charAddedConn:Disconnect() end
    end)
    pcall(function()
        if entry.playerAddedConn then entry.playerAddedConn:Disconnect() end
    end)
    pcall(function()
        if entry.hrpart and entry._prevAnchored ~= nil and entry.hrpart.Parent then entry.hrpart.Anchored = entry._prevAnchored end
    end)
    scriptconfig.ActiveProcesses[key] = nil
end

local function findPlayerByArg(arg)
    if not arg or arg == "" then return Players:FindFirstChild(scriptconfig.MainAccount) end
    local lower = tostring(arg):lower()
    if lower == "main" then return Players:FindFirstChild(scriptconfig.MainAccount) end
    for _, p in pairs(Players:GetPlayers()) do if p.Name:lower() == lower then return p end end
    for _, p in pairs(Players:GetPlayers()) do if p.Name:lower():sub(1, #lower) == lower then return p end end
    for _, p in pairs(Players:GetPlayers()) do if p.DisplayName and p.DisplayName:lower() == lower then return p end end
    return nil
end

local function isPlayerInVoidOrFarAway(player)
    if not player or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
        return true
    end
    
    local position = player.Character.HumanoidRootPart.Position
    local yPos = position.Y
    
    if yPos < -500 then
        return true
    end
    
    if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
        local distance = (plr.Character.HumanoidRootPart.Position - position).Magnitude
        if distance > 300 then
            return true
        end
    end
    
    return false
end

local function startTweenToPlayer(key, durationArg, targetPlayer)
    if not targetPlayer then return end
    if not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
    if not plr.Character or not plr.Character:FindFirstChild("HumanoidRootPart") then return end
    stopActiveProcess(key)
    local hrp = plr.Character.HumanoidRootPart
    local targetHrp = targetPlayer.Character.HumanoidRootPart
    local dist = (hrp.Position - targetHrp.Position).Magnitude
    local duration = tonumber(durationArg)
    if not duration then duration = math.clamp(dist/20, 0.5, 10) end
    duration = math.clamp(duration, 0.05, 300)
    local offset = CFrame.new(0, 0, -2)
    local goalCFrame = targetHrp.CFrame * offset
    local tweeninfo = TweenInfo.new(duration, Enum.EasingStyle.Linear)
    local ok, tween = pcall(function() return TweenService:Create(hrp, tweeninfo, {CFrame = goalCFrame}) end)
    if not ok or not tween then return end
    local entry = { tween = tween, hrpart = hrp, _prevAnchored = hrp.Anchored }
    scriptconfig.ActiveProcesses[key] = entry
    local conn
    conn = tween.Completed:Connect(function()
        if conn then pcall(function() conn:Disconnect() end) end
        if not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("HumanoidRootPart") or not plr.Character or not plr.Character:FindFirstChild("HumanoidRootPart") then
            stopActiveProcess(key)
            return
        end
        entry.heartbeatConn = RunService.Heartbeat:Connect(function()
            if not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("HumanoidRootPart") or not plr.Character or not plr.Character:FindFirstChild("HumanoidRootPart") then
                stopActiveProcess(key)
                return
            end
            local tHRP = targetPlayer.Character.HumanoidRootPart
            local desired = tHRP.CFrame * offset
            pcall(function() plr.Character.HumanoidRootPart.CFrame = desired end)
        end)
    end)
    entry.conn = conn
    pcall(function() tween:Play() end)
end

local function startAttachToPlayer(key, speedArg, targetPlayer)
    if not targetPlayer then return end
    if not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
    if not plr.Character or not plr.Character:FindFirstChild("HumanoidRootPart") then return end
    stopActiveProcess(key)
    local hrp = plr.Character.HumanoidRootPart
    local targetHrp = targetPlayer.Character.HumanoidRootPart
    local dist = (hrp.Position - targetHrp.Position).Magnitude
    if dist > 300 then return end
    local speedNum = tonumber(speedArg)
    local duration
    if speedNum then duration = math.clamp(speedNum, 0.05, 300) else duration = math.clamp(dist/20, 0.5, 12) end
    local approachOffset = CFrame.new(0, 0, 2)
    local attachOffset = CFrame.new(0, 0, -2)
    local goalCFrame = targetHrp.CFrame * approachOffset
    local tweeninfo = TweenInfo.new(duration, Enum.EasingStyle.Linear)
    local ok, tween = pcall(function() return TweenService:Create(hrp, tweeninfo, {CFrame = goalCFrame}) end)
    if not ok or not tween then return end
    local entry = { tween = tween, hrpart = hrp, _prevAnchored = hrp.Anchored }
    scriptconfig.ActiveProcesses[key] = entry
    pcall(function() hrp.Anchored = false end)
    local conn
    conn = tween.Completed:Connect(function()
        if conn then pcall(function() conn:Disconnect() end) end
        if not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("HumanoidRootPart") then stopActiveProcess(key) return end
        entry.heartbeatConn = RunService.Heartbeat:Connect(function()
            if not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("HumanoidRootPart") or not plr.Character or not plr.Character:FindFirstChild("HumanoidRootPart") then
                stopActiveProcess(key)
                return
            end
            local tHRP = targetPlayer.Character.HumanoidRootPart
            local desired = tHRP.CFrame * attachOffset
            pcall(function() plr.Character.HumanoidRootPart.CFrame = desired end)
        end)
    end)
    entry.conn = conn
    pcall(function() tween:Play() end)
end

scriptconfig.CommandHandlers["reset"] = function(args, sourcePlayer)
    mainAPI:SpeedReset(.600)
end

scriptconfig.CommandHandlers["rejoin"] = function(args, sourcePlayer)
    Rejoin(0.2)
end

scriptconfig.CommandHandlers["teleport"] = function(args, sourcePlayer)
    local targetArg = args and args[1]
    local target = findPlayerByArg(targetArg) or Players:FindFirstChild(scriptconfig.MainAccount)
    if not target then return end
    if not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then return end
    if not plr.Character or not plr.Character:FindFirstChild("HumanoidRootPart") then return end
    pcall(function()
        local targetCFrame = target.Character.HumanoidRootPart.CFrame
        local hrp = plr.Character.HumanoidRootPart
        hrp.CFrame = targetCFrame + Vector3.new(2,0,0)
    end)
end

scriptconfig.CommandHandlers["tweento"] = function(args, sourcePlayer)
    local speedArg = args and args[1]
    startTweenToPlayer("tweento", speedArg, Players:FindFirstChild(scriptconfig.MainAccount))
end

scriptconfig.CommandHandlers["tween"] = function(args, sourcePlayer)
    local speedArg = args and args[1]
    local playerArg = args and args[2]
    local target = findPlayerByArg(playerArg) or Players:FindFirstChild(scriptconfig.MainAccount)
    startTweenToPlayer("tween", speedArg, target)
end

scriptconfig.CommandHandlers["attach"] = function(args, sourcePlayer)
    local playerArg = args and args[1]
    local speedArg = args and args[2]
    local target = findPlayerByArg(playerArg) or Players:FindFirstChild(scriptconfig.MainAccount)
    if not target then return end
    startAttachToPlayer("attach", speedArg, target)
end

scriptconfig.CommandHandlers["unattach"] = function(args, sourcePlayer)
    stopActiveProcess("attach")
end

scriptconfig.CommandHandlers["touchy"] = function(args, sourcePlayer)
    mainAPI:StartTouchFling(args)
end

scriptconfig.CommandHandlers["stoptouchy"] = function(args, sourcePlayer)
    mainAPI:StopTouchFling()
end

scriptconfig.CommandHandlers["fling"] = function(args, sourcePlayer)
    local username = args and args[1]
    if username and Players:FindFirstChild(username) then
        local tttarget = Players:FindFirstChild(username)
        mainAPI:Fling(tttarget)
    else
        warn("[FLING]: Invalid or missing username.")
    end
end

scriptconfig.CommandHandlers["flingall"] = function(args, sourcePlayer)
    local caller = (sourcePlayer and typeof(sourcePlayer) == "Instance" and sourcePlayer) or plr
    for _, target in pairs(Players:GetPlayers()) do
        if target ~= caller then
            pcall(function()
                if target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                    mainAPI:Fling(target)
                end
            end)
        end
    end
    pcall(function() print("flingall executed by", caller.Name) end)
end

scriptconfig.CommandHandlers["loopfling"] = function(args, sourcePlayer)
    local username = args and args[1]
    if username and Players:FindFirstChild(username) then
        local target = Players:FindFirstChild(username)
        stopActiveProcess("loopfling")
        
        local entry = {}
        entry.heartbeatConn = RunService.Heartbeat:Connect(function()
            if not target or not target.Parent then
                stopActiveProcess("loopfling")
                return
            end
            
            if isPlayerInVoidOrFarAway(target) then
                stopActiveProcess("loopfling")
                print("[LOOPFLING] Target is in void or far away, stopping loop")
                return
            end
            
            pcall(function()
                if target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                    mainAPI:Fling(target)
                end
            end)
        end)
        
        scriptconfig.ActiveProcesses["loopfling"] = entry
        print("[LOOPFLING] Started loop flinging:", username)
    else
        warn("[LOOPFLING]: Invalid or missing username.")
    end
end

scriptconfig.CommandHandlers["stoploopfling"] = function(args, sourcePlayer)
    stopActiveProcess("loopfling")
    print("[LOOPFLING] Stopped loop flinging")
end

scriptconfig.CommandHandlers["loopflingall"] = function(args, sourcePlayer)
    local caller = (sourcePlayer and typeof(sourcePlayer) == "Instance" and sourcePlayer) or plr
    local mainPlayer = Players:FindFirstChild(scriptconfig.MainAccount)
    stopActiveProcess("loopflingall")
    
    local entry = {
        currentIndex = 1,
        lastFlingTime = 0,
        flingDelay = 2.0,
        flingCount = 0,
        maxFlingCount = 5
    }
    
    entry.heartbeatConn = RunService.Heartbeat:Connect(function()
        local currentTime = tick()
        
        if currentTime - entry.lastFlingTime < entry.flingDelay then
            return
        end
        
        local allPlayers = Players:GetPlayers()
        local validTargets = {}
        
        for _, target in pairs(allPlayers) do
            if target ~= caller and target ~= mainPlayer and target.Parent and not isPlayerInVoidOrFarAway(target) then
                table.insert(validTargets, target)
            end
        end
        
        if #validTargets == 0 then
            stopActiveProcess("loopflingall")
            print("[LOOPFLINGALL] No valid targets found, stopping")
            return
        end
        
        if entry.currentIndex > #validTargets then
            entry.currentIndex = 1
        end
        
        local currentTarget = validTargets[entry.currentIndex]
        if currentTarget and currentTarget.Character and currentTarget.Character:FindFirstChild("HumanoidRootPart") then
            pcall(function()
                mainAPI:Fling(currentTarget)
                entry.flingCount = entry.flingCount + 1
                print("[LOOPFLINGALL] Flinging:", currentTarget.Name, "(fling", entry.flingCount, "of", entry.maxFlingCount, ")")
            end)
        end
        
        if entry.flingCount >= entry.maxFlingCount then
            entry.flingCount = 0
            entry.currentIndex = entry.currentIndex + 1
            print("[LOOPFLINGALL] Moving to next target")
        end
        
        entry.lastFlingTime = currentTime
    end)
    
    scriptconfig.ActiveProcesses["loopflingall"] = entry
    print("[LOOPFLINGALL] Started loop flinging all players")
end

scriptconfig.CommandHandlers["stoploopflingall"] = function(args, sourcePlayer)
    stopActiveProcess("loopflingall")
    print("[LOOPFLINGALL] Stopped loop flinging all players")
end

scriptconfig.PlayerHandlers = scriptconfig.PlayerHandlers or {}
scriptconfig.PlayerHandlers["sayhi"] = function(args, src)
    print("sayhi from", plr.Name)
end

local function ParseCommand(raw, prefix)
    if type(raw) ~= "string" then return nil end
    local pre = prefix or scriptconfig.Prefix or "/"
    if raw:sub(1, #pre) ~= pre then return nil end
    local body = raw:sub(#pre + 1)
    local parts = {}
    for part in body:gmatch("%S+") do table.insert(parts, part) end
    local cmd = parts[1] and parts[1]:lower()
    table.remove(parts, 1)
    return cmd, parts
end

local function ExecuteCommand(cmd, args, handlers, sourcePlayer)
    if not cmd then return end
    local handler = handlers and handlers[cmd]
    if handler then
        print("[COMMAND DEBUG] Executing:", cmd, "Args:", table.concat(args or {}, ", "))
        local ok, err = pcall(handler, args or {}, sourcePlayer)
        if not ok then warn(("Command handler '%s' error: %s"):format(cmd, tostring(err))) end
    else
        print("[COMMAND DEBUG] No handler found for:", cmd)
    end
end

local mainChattedConn
local connectionCheckHeartbeat
local lastMainPlayerCheck = 0

local function GetMainPlayer()
    return Players:FindFirstChild(scriptconfig.MainAccount)
end

local function DisconnectMainConnection()
    if mainChattedConn then
        pcall(function() mainChattedConn:Disconnect() end)
        mainChattedConn = nil
    end
    print("[CONNECTION] Disconnected from main player")
end

local function ConnectToMainPlayer()
    DisconnectMainConnection()
    
    local mainPlayer = GetMainPlayer()
    if not mainPlayer then 
        print("[CONNECTION] Main player not found:", scriptconfig.MainAccount)
        return false
    end
    
    print("[CONNECTION] Connecting to main player:", mainPlayer.Name)
    
    local success, connection = pcall(function()
        return mainPlayer.Chatted:Connect(function(msg)
            print("[CHAT DEBUG] Received message from", mainPlayer.Name, ":", msg)
            local cmd, args = ParseCommand(msg, scriptconfig.Prefix)
            if cmd then
                print("[CHAT DEBUG] Valid command detected:", cmd)
                task.spawn(function() 
                    ExecuteCommand(cmd, args, scriptconfig.CommandHandlers, mainPlayer) 
                end)
            else
                print("[CHAT DEBUG] Not a valid command")
            end
        end)
    end)
    
    if success and connection then
        mainChattedConn = connection
        print("[CONNECTION] Successfully connected to main player chat")
        return true
    else
        print("[CONNECTION] Failed to connect to main player:", connection)
        return false
    end
end

local function StartConnectionMonitoring()
    if connectionCheckHeartbeat then
        pcall(function() connectionCheckHeartbeat:Disconnect() end)
    end
    
    connectionCheckHeartbeat = RunService.Heartbeat:Connect(function()
        local currentTime = tick()
        
        if currentTime - lastMainPlayerCheck >= 5 then
            lastMainPlayerCheck = currentTime
            
            local mainPlayer = GetMainPlayer()
            
            if mainPlayer and not mainChattedConn then
                print("[MONITOR] Main player found but not connected, attempting connection...")
                ConnectToMainPlayer()
            
            elseif not mainPlayer and mainChattedConn then
                print("[MONITOR] Main player left, disconnecting...")
                DisconnectMainConnection()
            
            elseif mainPlayer and mainChattedConn then
                local success = pcall(function()
                    return mainPlayer.Name
                end)
                
                if not success then
                    print("[MONITOR] Main player connection appears stale, reconnecting...")
                    ConnectToMainPlayer()
                end
            end
        end
    end)
end

if IsAlt() then
    NamePlateAccount(plr, "ALT")
    
    ConnectToMainPlayer()
    
    StartConnectionMonitoring()
    
    local playerAddedConn = Players.PlayerAdded:Connect(function(p) 
        if p.Name == scriptconfig.MainAccount then 
            print("[EVENT] Main player joined:", p.Name)
            task.wait(0.5)
            ConnectToMainPlayer()
        end 
    end)
    
    local playerRemovingConn = Players.PlayerRemoving:Connect(function(p) 
        if p.Name == scriptconfig.MainAccount then 
            print("[EVENT] Main player leaving:", p.Name)
            DisconnectMainConnection()
        end 
    end)
    
    game:GetService("Players").PlayerRemoving:Connect(function(p)
        if p == plr then
            if playerAddedConn then playerAddedConn:Disconnect() end
            if playerRemovingConn then playerRemovingConn:Disconnect() end
            if connectionCheckHeartbeat then connectionCheckHeartbeat:Disconnect() end
            DisconnectMainConnection()
        end
    end)
end

if IsMain() then
    plr.Chatted:Connect(function(msg)
        local cmd, args = ParseCommand(msg, scriptconfig.PlayerPrefix)
        if cmd then ExecuteCommand(cmd, args, scriptconfig.PlayerHandlers, plr) end
    end)
end

local function tsbAPI_AddCommand_internal(name, fn)
    if type(name) ~= "string" or type(fn) ~= "function" then return end
    local lower = name:lower()
    if scriptconfig.CommandHandlers[lower] then stopActiveProcess(lower) end
    scriptconfig.CommandHandlers[lower] = fn
end

local function tsbAPI_RemoveCommand_internal(name)
    if type(name) ~= "string" then return end
    local lower = name:lower()
    stopActiveProcess(lower)
    scriptconfig.CommandHandlers[lower] = nil
end

local tsbAPI = {}
function tsbAPI.AddCommand(name, fn) tsbAPI_AddCommand_internal(name, fn) end
function tsbAPI.RemoveCommand(name) tsbAPI_RemoveCommand_internal(name) end

if IsMain() then
    print("Script running as MAIN:", plr.Name)
elseif IsAlt() then
    print("Script running as ALT:", plr.Name)
else
    print("Script running as neutral client:", plr.Name)
end

local cmds = {}
for k in pairs(scriptconfig.CommandHandlers) do table.insert(cmds, k) end
local pcmds = {}
for k in pairs(scriptconfig.PlayerHandlers) do table.insert(pcmds, k) end
print("Commands:", table.concat(cmds, ", "))
print("PlayerCommands:", table.concat(pcmds, ", "))
