local Rayfield = nil
local success, err = pcall(function()
    Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Libraries/Rayfield/main/source.lua'))()
end)

if not success or not Rayfield then
    success, err = pcall(function()
        Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
    end)
end

if not Rayfield then
    warn("[OWATAMSATE] Failed to load Rayfield UI library.")
    return
end

local Window = Rayfield:CreateWindow({
    Name = "OWATAMSATE - Non-Blocking Farm",
    LoadingTitle = "Loading...",
    LoadingSubtitle = "DominumNetwork",
    ConfigurationSaving = { Enabled = false },
    KeySystem = false
})

local Tab = Window:CreateTab("Auto Farm", 4483362458)

local autoFarm = false
local autoBeacon = true
local beaconRange = 1000
local tpDelay = 0.5
local visitedStages = {}
local highestStageNum = -1
local autoFarmToggleObj
local loopThread = nil
local noPartTicks = 0

local function logMsg(text)
    local msg = string.format("[%s] [OWATAMSATE Debug] %s", os.date("%X"), text)
    warn(msg)
    if rconsoleprint then
        pcall(rconsoleprint, msg .. "\n")
    end
end

local function getStageNumber(folderName)
    local num = tonumber(string.match(folderName, "%d+"))
    return num
end

local function findNearbyBeacon(hrp)
    local containers = { workspace:FindFirstChild("Stages"), workspace:FindFirstChild("Transition") }
    for _, container in ipairs(containers) do
        if container then
            for _, stageFolder in ipairs(container:GetChildren()) do
                local stageNum = getStageNumber(stageFolder.Name)
                
                if not stageNum or stageNum >= highestStageNum then
                    local beacon = stageFolder:FindFirstChild("Beacon")
                    if beacon then
                        local hitbox = beacon:FindFirstChild("Hitbox") or beacon:FindFirstChild("Part") or (beacon:IsA("BasePart") and beacon)
                        if hitbox and hitbox:IsA("BasePart") then
                            local dist = (hitbox.Position - hrp.Position).Magnitude
                            if dist <= beaconRange then
                                return hitbox, dist, stageFolder.Name
                            end
                        end
                    end
                end
            end
        end
    end
    return nil, nil, nil
end

local function getStageParts(hrp)
    local candidateParts = {}
    local containers = { workspace:FindFirstChild("Stages"), workspace:FindFirstChild("Transition") }

    for _, container in ipairs(containers) do
        if container then
            for _, folder in ipairs(container:GetChildren()) do
                local target = folder:FindFirstChild("End") or folder:FindFirstChild("Start")
                local part = nil
                if target and target:IsA("BasePart") then
                    part = target
                elseif folder:IsA("BasePart") then
                    part = folder
                end

                if part then
                    local stageId = folder.Name
                    local stageNum = getStageNumber(folder.Name)

                    local isVisited = visitedStages[stageId] or (stageNum and stageNum < highestStageNum)

                    if not isVisited and part:IsDescendantOf(workspace) and part.Size.Y > 0 then
                        local dist = (part.Position - hrp.Position).Magnitude
                        if dist > 3 then
                            table.insert(candidateParts, {
                                part = part, 
                                dist = dist, 
                                name = folder.Name, 
                                id = stageId,
                                num = stageNum or 999999
                            })
                        end
                    end
                end
            end
        end
    end

    table.sort(candidateParts, function(a, b)
        if a.num ~= b.num then
            return a.num < b.num
        end
        return a.dist < b.dist
    end)

    return candidateParts
end

local function safeTeleportToPart(hrp, targetPart)
    -- Asynchronous non-blocking streaming call so it never yields the loop thread
    task.spawn(function()
        pcall(function()
            workspace:RequestInstanceStreamingAsync(targetPart.Position)
        end)
    end)

    if hrp and targetPart and targetPart:IsDescendantOf(workspace) then
        hrp.CFrame = targetPart.CFrame + Vector3.new(0, 4, 0)
    end
end

local function runTeleportStep()
    local player = game.Players.LocalPlayer
    if not player then return end

    local character = player.Character
    if not character then return end

    local hrp = character:FindFirstChild("HumanoidRootPart")
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not hrp or not humanoid or humanoid.Health <= 0 then return end

    if autoBeacon then
        local beaconFound, dist, stageName = findNearbyBeacon(hrp)
        if beaconFound then
            logMsg(string.format("Beacon detected at Stage '%s' (Distance: %.1f studs). Turning off Auto Farm.", tostring(stageName), dist))
            safeTeleportToPart(hrp, beaconFound)
            autoFarm = false
            if autoFarmToggleObj then
                autoFarmToggleObj:Set(false)
            end
            table.clear(visitedStages)
            highestStageNum = -1
            Rayfield:Notify({
                Title = "Beacon Reached!",
                Content = "Auto Checkpoint has been disabled.",
                Duration = 2,
            })
            return
        end
    end

    local candidates = getStageParts(hrp)
    if #candidates > 0 then
        noPartTicks = 0
        local chosen = candidates[1]
        local target = chosen.part
        
        visitedStages[chosen.id] = true
        if chosen.num and chosen.num ~= 999999 then
            if chosen.num > highestStageNum then
                highestStageNum = chosen.num
            end
        end

        logMsg(string.format("Teleporting to Stage '%s' (Num: %d) | Dist: %.1f", chosen.name, chosen.num, chosen.dist))
        safeTeleportToPart(hrp, target)
    else
        noPartTicks = noPartTicks + 1
        local currentPos = hrp.Position
        logMsg(string.format("WAITING FOR STREAMING (Tick %d/5) | Highest: %d | Pos: (%.1f, %.1f, %.1f)", noPartTicks, highestStageNum, currentPos.X, currentPos.Y, currentPos.Z))
    end
end

local function startLoop()
    if loopThread and coroutine.status(loopThread) ~= "dead" then
        return
    end
    loopThread = task.spawn(function()
        while true do
            if autoFarm then
                local success, err = pcall(runTeleportStep)
                if not success then
                    logMsg("Unhandled exception inside teleport tick: " .. tostring(err))
                end
            end
            task.wait(tpDelay)
        end
    end)
end

startLoop()

autoFarmToggleObj = Tab:CreateToggle({
    Name = "Auto Teleport to Checkpoints",
    CurrentValue = false,
    Flag = "AutoFarmToggle",
    Callback = function(Value)
        autoFarm = Value
        if Value then
            noPartTicks = 0
            startLoop()
        end
    end,
})

Tab:CreateToggle({
    Name = "Auto Teleport to Beacon",
    CurrentValue = true,
    Flag = "AutoBeaconToggle",
    Callback = function(Value)
        autoBeacon = Value
    end,
})

Tab:CreateSlider({
    Name = "Beacon Detection Range",
    Range = {100, 2000},
    Increment = 50,
    Suffix = " studs",
    CurrentValue = 1000,
    Flag = "BeaconRangeSlider",
    Callback = function(Value)
        beaconRange = Value
    end,
})

Tab:CreateButton({
    Name = "Clear Checkpoint History",
    Callback = function()
        table.clear(visitedStages)
        highestStageNum = -1
        noPartTicks = 0
        logMsg("Checkpoint history manually reset.")
        Rayfield:Notify({
            Title = "History Cleared",
            Content = "Reset saved checkpoint history.",
            Duration = 2,
        })
    end,
})

Tab:CreateSlider({
    Name = "Teleport Delay (MS)",
    Range = {100, 1000},
    Increment = 50,
    Suffix = " ms",
    CurrentValue = 500,
    Flag = "TPDelaySlider",
    Callback = function(Value)
        tpDelay = Value / 1000
    end,
})
