--[[
    ╔══════════════════════════════════════════════════════════╗
    ║          BUILD A BOAT FOR TREASURE - SCRIPT              ║
    ║                                                          ║
    ║  Author  : Angelothe3rd2003                              ║
    ║  Discord : https://discord.gg/d9bDH5dj                   ║
    ║                                                          ║
    ║  Features:                                               ║
    ║   • Auto Build  (copy & paste bases)                     ║
    ║   • Auto Farm   (teleport through stages)                ║
    ║   • Waypoint Auto Pilot (flies plane through all stages) ║
    ║   • Straight Auto Pilot (level flight, walkable roof)    ║
    ║   • Car Fly     (manual camera-directed vehicle flight)  ║
    ╚══════════════════════════════════════════════════════════╝
]]

-- ============================================================
-- SERVICES
-- ============================================================

local VIM              = game:GetService("VirtualInputManager")
local Players          = game:GetService("Players")
local TweenService     = game:GetService("TweenService")
local Workspace        = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService       = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

-- ============================================================
-- LOCAL PLAYER REFERENCES
-- ============================================================

local player    = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid  = character:WaitForChild("Humanoid")
local HRP       = character:WaitForChild("HumanoidRootPart")

-- ============================================================
-- RAYFIELD UI
-- ============================================================

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name                  = "BABFT | by Angelothe3rd2003",
    Icon                  = 0,
    LoadingTitle          = "BABFT Script",
    LoadingSubtitle       = "by Angelothe3rd2003",
    Theme                 = "Default",
    ToggleUIKeybind       = "G",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings  = false,
    ConfigurationSaving   = {
        Enabled    = true,
        FolderName = "BABFT",
        FileName   = "BABFT_Config"
    },
})

-- ============================================================
-- PATHS & SHARED STATE
-- ============================================================

local blockData    = player:WaitForChild("Data")
local blocksFolder = Workspace:WaitForChild("Blocks")

-- Auto Build
local clipboard      = nil
local selectedBase   = nil
local pastePercent   = 0
local usedList       = {}
local ignoreAnchored = true

-- Auto Farm
local autofarm    = false
local stageIndex  = 1
local tweening    = false

-- ============================================================
-- WAYPOINT AUTO PILOT CONFIG
-- ============================================================

local autoPilotEnabled    = false
local autoPilotConnection = nil
local apBV                = nil   -- BodyVelocity
local apBG                = nil   -- BodyGyro

local AP_SPEED           = 120   -- studs/s cruise speed
local AP_ALTITUDE        = 80    -- target Y altitude above water
local AP_WAYPOINT_RADIUS = 60    -- advance waypoint when within this distance (flat)
local AP_ARRIVAL_RADIUS  = 100   -- stop autopilot when within this distance of chest
local AP_ALT_STRENGTH    = 4     -- vertical correction multiplier

-- ============================================================
-- STRAIGHT AUTO PILOT CONFIG
-- ============================================================

local straightAPEnabled    = false
local straightAPConnection = nil
local straightAPBV         = nil
local straightAPBG         = nil
local straightAPPart       = nil   -- remembered vehicle part (seat-independent)

local STRAIGHT_AP_SPEED = 70   -- studs/s

-- ============================================================
-- UTILITY FUNCTIONS
-- ============================================================

local function notify(title, content, duration, image)
    Rayfield:Notify({
        Title    = title,
        Content  = content,
        Duration = duration or 5,
        Image    = image or "info",
    })
end

local function getBlockID(name)
    local found = blockData:FindFirstChild(name)
    return found and found.Value or 9   -- 9 = WoodBlock fallback
end

local function getRealName(displayName)
    for _, v in pairs(Players:GetChildren()) do
        if v.DisplayName == displayName then return v.Name end
    end
    return nil
end

local function getPlayerList()
    local list = {}
    for _, v in pairs(Players:GetChildren()) do
        table.insert(list, v.DisplayName)
    end
    return list
end

local function getPlayerZone(targetPlayer)
    local teamColor = targetPlayer.TeamColor
    for _, v in pairs(Workspace:GetChildren()) do
        if v:FindFirstChild("TeamColor") and v.TeamColor.Value == teamColor then
            return v
        end
    end
    warn("[BABFT] Base not found for:", targetPlayer.Name)
    return nil
end

local function getPlayerBase()
    for _, child in pairs(blocksFolder:GetChildren()) do
        if child.Name == player.Name then return child end
    end
end

local function getCar()
    return humanoid.SeatPart and humanoid.SeatPart.Parent or nil
end

-- ============================================================
-- TOOL HELPERS  (equip-on-demand pattern)
-- ============================================================

local function getTool(name)
    if character:FindFirstChild(name) then
        return character[name]
    end
    humanoid:EquipTool(player.Backpack[name])
    task.wait()
    return character[name]
end

local function setTransparency(want, block)
    if not block then return end
    if block.PPart.Transparency == want then return end
    local tool  = getTool("PropertiesTool")
    local calls = want / 0.25
    task.spawn(function()
        for _ = 1, calls do
            tool.SetPropertieRF:InvokeServer("Transparency", { block })
        end
    end)
end

local function setAnchored(block)
    if not block then return end
    local tool = getTool("PropertiesTool")
    task.spawn(function()
        tool.SetPropertieRF:InvokeServer("Anchored", { block })
    end)
end

local function rescaleBlock(block, newPos, newSize)
    if not block then warn("[BABFT] rescaleBlock: block is nil") return end
    local tool = getTool("ScalingTool")
    task.spawn(function()
        tool.RF:InvokeServer(block, newSize, newPos)
    end)
end

local function paintBlock(block, color)
    if not block then warn("[BABFT] paintBlock: block is nil") return end
    if not block:FindFirstChild("PPart") then return end
    if block.PPart.Color == color then return end
    local tool = getTool("PaintingTool")
    task.spawn(function()
        tool.RF:InvokeServer({{ block, color }})
    end)
end

local function placeBlock(name, pos, relativeTo, anchored)
    local tool = getTool("BuildingTool")
    relativeTo = relativeTo or getPlayerZone(player)
    task.spawn(function()
        tool.RF:InvokeServer(
            name,
            getBlockID(name),
            relativeTo,
            relativeTo and relativeTo.CFrame:ToObjectSpace(pos) or CFrame.new(),
            ignoreAnchored and true or anchored,
            pos,
            false
        )
    end)
end

-- ============================================================
-- AUTO BUILD HELPERS
-- ============================================================

local function getJoint(model)
    for _, v in pairs(model.PPart:GetChildren()) do
        if (v:IsA("Snap") or v:IsA("Weld")) and v.Part1 and v.Part1.Parent ~= model then
            return v.Part1
        end
    end
    return getPlayerZone(player)
end

local function getNewBlockPos(hisBase, block, myBase)
    if not block or not block:FindFirstChild("PPart") then
        warn("[BABFT] getNewBlockPos: missing PPart on", block and block.Name or "nil")
        return CFrame.new()
    end
    if not hisBase or not myBase then return block.PPart.CFrame end
    return myBase.CFrame * hisBase.CFrame:ToObjectSpace(block.PPart.CFrame)
end

local function copyBuild(blocks)
    local t       = {}
    local myBase  = getPlayerZone(player)
    local hisBase = getPlayerZone(Players:FindFirstChild(blocks.Name))

    for _, block in ipairs(blocks:GetChildren()) do
        if block:FindFirstChild("PPart") then
            local id   = getBlockID(block.Name)
            local used = usedList[block.Name] or 0

            if id == 0 or used >= id then
                print("[BABFT] Not enough:", block.Name)
                continue
            end

            usedList[block.Name] = used + 1

            local relative = getJoint(block)
            if relative == hisBase then relative = myBase end

            table.insert(t, {
                Name         = block.Name,
                Pos          = getNewBlockPos(hisBase, block, myBase),
                Relative     = myBase,
                Transparency = block.PPart.Transparency,
                Anchored     = block.PPart.Anchored,
                Size         = block.PPart.Size,
                Color        = block.PPart.Color,
            })
        end
    end
    return t
end

local function getMissingBlocks(expected, created)
    local missing = {}
    for i, v in ipairs(expected) do
        local found = false
        for _, b in ipairs(created) do
            if b and b:FindFirstChild("PPart") and b.Name == v.Name then
                found = true
                break
            end
        end
        if not found then
            table.insert(missing, { Index = i, Name = v.Name, Pos = v.Pos })
        end
    end
    return missing
end

local function getClosestBlock(expected, list)
    local best, bestDist = nil, math.huge
    for _, b in ipairs(list) do
        if b and b:FindFirstChild("PPart") and b.Name == expected.Name then
            local d = (b.PPart.Position - expected.Pos.Position).Magnitude
            if d < bestDist then bestDist = d; best = b end
        end
    end
    return best
end

local function pasteBuild(t, folder)
    pastePercent = 0
    local placed = 0
    local tCount = #t
    local lastAdded = tick()

    local conn = folder.ChildAdded:Connect(function()
        placed    += 1
        lastAdded  = tick()
    end)

    print("[BABFT] Placing", tCount, "blocks…")
    for i, v in ipairs(t) do
        placeBlock(v.Name, v.Pos, v.Relative, v.Anchored)
        pastePercent = math.floor((i / tCount) * 50)
        if i % 20 == 0 then task.wait(0.05) end
    end

    -- Wait until server stops adding children (5 s idle)
    repeat task.wait(0.1) until tick() - lastAdded > 5

    print("[BABFT] Placed:", placed, "/ Expected:", tCount)
    if tCount - placed > 0 then
        local missing = getMissingBlocks(t, folder:GetChildren())
        print("[BABFT] Missing", #missing, "blocks:")
        for _, b in ipairs(missing) do
            print("  Index:", b.Index, "| Name:", b.Name, "| Pos:", b.Pos.Position)
        end
    end

    print("[BABFT] Painting & rescaling…")
    local baseList = folder:GetChildren()
    for i, v in ipairs(t) do
        local b = getClosestBlock(v, baseList)
        if b then
            rescaleBlock(b, v.Pos, v.Size)
            paintBlock(b, v.Color)
            setTransparency(v.Transparency, b)
        end
        pastePercent = 50 + math.floor((i / tCount) * 50)
        if i % 20 == 0 then task.wait(0.05) end
    end

    conn:Disconnect()
    pastePercent = 0
    print("[BABFT] Paste complete.")
end

-- ============================================================
-- WAYPOINT AUTO PILOT
-- ============================================================

local function buildWaypoints()
    local boatStages   = Workspace:FindFirstChild("BoatStages")
    local normalStages = boatStages and boatStages:FindFirstChild("NormalStages")
    if not normalStages then return nil end

    local wps = {}

    for i = 1, 10 do
        local stage = normalStages:FindFirstChild("CaveStage" .. i)
        local dp    = stage and stage:FindFirstChild("DarknessPart")
        if dp then
            table.insert(wps, Vector3.new(dp.Position.X, AP_ALTITUDE, dp.Position.Z))
        end
    end

    local endStage = normalStages:FindFirstChild("TheEnd")
    local chest    = endStage and endStage:FindFirstChild("GoldenChest")
    if chest then
        table.insert(wps, chest:GetPivot().Position + Vector3.new(0, 10, -10))
    end

    return #wps > 0 and wps or nil
end

local function attachWaypointPhysics(part)
    -- Clean up stale instances
    local old = { part:FindFirstChild("AP_BV"), part:FindFirstChild("AP_BG") }
    for _, o in ipairs(old) do if o then o:Destroy() end end

    apBV          = Instance.new("BodyVelocity")
    apBV.Name     = "AP_BV"
    apBV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
    apBV.Velocity = Vector3.zero
    apBV.Parent   = part

    apBG            = Instance.new("BodyGyro")
    apBG.Name       = "AP_BG"
    apBG.MaxTorque  = Vector3.new(9e9, 9e9, 9e9)
    apBG.P          = 3000
    apBG.D          = 300
    apBG.CFrame     = part.CFrame
    apBG.Parent     = part
end

local function stopAutoPilot()
    autoPilotEnabled = false
    if autoPilotConnection then autoPilotConnection:Disconnect(); autoPilotConnection = nil end
    if apBV and apBV.Parent then apBV:Destroy() end; apBV = nil
    if apBG and apBG.Parent then apBG:Destroy() end; apBG = nil
    notify("Waypoint Auto Pilot", "Stopped — jump out and claim the chest!", 6, "plane")
end

local function startAutoPilot()
    local car = getCar()
    if not car then
        notify("Waypoint Auto Pilot", "Sit in a vehicle first!", 5, "alert-triangle")
        autoPilotEnabled = false
        return
    end

    local part = car.PrimaryPart or car:FindFirstChildWhichIsA("BasePart")
    if not part then
        notify("Waypoint Auto Pilot", "Vehicle has no PrimaryPart.", 5, "alert-triangle")
        autoPilotEnabled = false
        return
    end

    local wps = buildWaypoints()
    if not wps then
        notify("Waypoint Auto Pilot", "Stages not found. Launch your boat first!", 8, "alert-triangle")
        autoPilotEnabled = false
        return
    end

    attachWaypointPhysics(part)
    autoPilotEnabled = true
    local wpIndex    = 1

    notify("Waypoint Auto Pilot", "Engaged — flying through " .. #wps .. " waypoints.", 5, "plane")

    autoPilotConnection = RunService.RenderStepped:Connect(function()
        if not autoPilotEnabled then stopAutoPilot(); return end

        -- Refresh car (handles edge cases where seat changes)
        car  = humanoid.SeatPart and humanoid.SeatPart.Parent or nil
        if not car then stopAutoPilot(); return end

        part = car.PrimaryPart or car:FindFirstChildWhichIsA("BasePart")
        if not part or not part.Parent then stopAutoPilot(); return end

        if not apBV or not apBV.Parent then attachWaypointPhysics(part) end

        local pos       = part.Position
        local target    = wps[wpIndex]
        local targetPos = Vector3.new(target.X, AP_ALTITUDE, target.Z)

        local flatDist = Vector3.new(targetPos.X - pos.X, 0, targetPos.Z - pos.Z).Magnitude
        local isLast   = wpIndex == #wps
        local radius   = isLast and AP_ARRIVAL_RADIUS or AP_WAYPOINT_RADIUS

        if flatDist < radius then
            if isLast then stopAutoPilot(); return end
            wpIndex   += 1
            target     = wps[wpIndex]
            targetPos  = Vector3.new(target.X, AP_ALTITUDE, target.Z)
        end

        local dir      = (targetPos - pos)
        local dirNorm  = dir.Magnitude > 0 and dir.Unit or Vector3.new(0, 0, -1)
        local altErr   = AP_ALTITUDE - pos.Y
        local altCorr  = Vector3.new(0, math.clamp(altErr * AP_ALT_STRENGTH, -AP_SPEED * 0.5, AP_SPEED * 0.5), 0)

        apBV.Velocity = dirNorm * AP_SPEED + altCorr

        local flat = Vector3.new(dirNorm.X, 0, dirNorm.Z)
        if flat.Magnitude > 0.01 then
            local pitch   = math.clamp(altErr * 0.01, -0.3, 0.3)
            local lookDir = Vector3.new(flat.X, pitch, flat.Z).Unit
            apBG.CFrame   = CFrame.new(pos, pos + lookDir)
        end
    end)
end

-- ============================================================
-- STRAIGHT AUTO PILOT
-- ============================================================

local function stopStraightAutoPilot()
    straightAPEnabled = false
    if straightAPConnection then straightAPConnection:Disconnect(); straightAPConnection = nil end
    if straightAPBV and straightAPBV.Parent then straightAPBV:Destroy() end; straightAPBV = nil
    if straightAPBG and straightAPBG.Parent then straightAPBG:Destroy() end; straightAPBG = nil
    straightAPPart = nil
    notify("Straight Auto Pilot", "Stopped — plane has halted.", 4, "plane")
end

local function startStraightAutoPilot()
    if autoPilotEnabled then
        notify("Straight Auto Pilot", "Stop the Waypoint Auto Pilot first!", 5, "alert-triangle")
        straightAPEnabled = false
        return
    end

    local seat = humanoid.SeatPart
    if not seat then
        notify("Straight Auto Pilot", "Sit in a vehicle first!", 5, "alert-triangle")
        straightAPEnabled = false
        return
    end

    local vehicle      = seat.Parent
    local part         = (vehicle and vehicle.PrimaryPart) or seat

    -- Remove stale movers
    local oldBV = part:FindFirstChild("StraightAP_BV")
    local oldBG = part:FindFirstChild("StraightAP_BG")
    if oldBV then oldBV:Destroy() end
    if oldBG then oldBG:Destroy() end

    -- Snapshot orientation — this is the locked heading forever
    local locked = part.CFrame

    straightAPBG           = Instance.new("BodyGyro")
    straightAPBG.Name      = "StraightAP_BG"
    straightAPBG.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
    straightAPBG.P         = 3000   -- high stiffness: resists players walking on top
    straightAPBG.D         = 250    -- damping: no oscillation
    straightAPBG.CFrame    = locked
    straightAPBG.Parent    = part

    straightAPBV           = Instance.new("BodyVelocity")
    straightAPBV.Name      = "StraightAP_BV"
    straightAPBV.MaxForce  = Vector3.new(9e9, 9e9, 9e9)
    straightAPBV.Velocity  = locked.LookVector * STRAIGHT_AP_SPEED
    straightAPBV.Parent    = part

    straightAPPart    = part
    straightAPEnabled = true

    notify("Straight Auto Pilot", "Engaged at " .. STRAIGHT_AP_SPEED .. " studs/s — you can leave your seat!", 5, "plane")

    -- Heartbeat is cheaper than RenderStepped for pure physics enforcement
    straightAPConnection = RunService.Heartbeat:Connect(function()
        if not straightAPEnabled then return end
        if not straightAPPart or not straightAPPart.Parent then
            stopStraightAutoPilot(); return
        end

        -- Silently re-create movers if server destroyed them
        if not straightAPBV or not straightAPBV.Parent then
            straightAPBV           = Instance.new("BodyVelocity")
            straightAPBV.Name      = "StraightAP_BV"
            straightAPBV.MaxForce  = Vector3.new(9e9, 9e9, 9e9)
            straightAPBV.Velocity  = locked.LookVector * STRAIGHT_AP_SPEED
            straightAPBV.Parent    = straightAPPart
        end

        if not straightAPBG or not straightAPBG.Parent then
            straightAPBG           = Instance.new("BodyGyro")
            straightAPBG.Name      = "StraightAP_BG"
            straightAPBG.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
            straightAPBG.P         = 3000
            straightAPBG.D         = 250
            straightAPBG.CFrame    = locked
            straightAPBG.Parent    = straightAPPart
        end

        -- Re-enforce every tick so collisions can't bleed speed off
        straightAPBV.Velocity = locked.LookVector * STRAIGHT_AP_SPEED
    end)
end

-- ============================================================
-- TAB: MAIN (Credits & Discord)
-- ============================================================

local mainTab = Window:CreateTab("Main", "home")

mainTab:CreateSection("Credits")

mainTab:CreateParagraph({
    Title   = "Script by Angelothe3rd2003",
    Content = "This script was created and maintained by Angelothe3rd2003.\nAll features were built from scratch for Build A Boat For Treasure.",
})

mainTab:CreateSection("Community")

mainTab:CreateParagraph({
    Title   = "Discord Server",
    Content = "Join the Discord for updates, support, and more scripts:\nhttps://discord.gg/d9bDH5dj",
})

mainTab:CreateButton({
    Name     = "Copy Discord Link",
    Callback = function()
        -- Uses the clipboard API available in most executors
        if setclipboard then
            setclipboard("https://discord.gg/d9bDH5dj")
            notify("Discord", "Link copied to clipboard!", 4, "copy")
        else
            notify("Discord", "https://discord.gg/d9bDH5dj", 8, "info")
        end
    end,
})

-- ============================================================
-- TAB: BUILDING
-- ============================================================

local buildTab = Window:CreateTab("Building", "hammer")

local playerDropdown = buildTab:CreateDropdown({
    Name            = "Choose Player Base To Copy",
    Options         = getPlayerList(),
    CurrentOption   = {"None Selected"},
    MultipleOptions = false,
    Callback        = function(options)
        local realName = getRealName(options[1])
        if not realName then return end
        for _, folder in pairs(blocksFolder:GetChildren()) do
            if folder.Name == realName then
                selectedBase = folder
                break
            end
        end
    end,
})

Players.PlayerAdded:Connect(function()
    playerDropdown:Refresh(getPlayerList())
end)
Players.PlayerRemoving:Connect(function()
    playerDropdown:Refresh(getPlayerList())
end)

buildTab:CreateButton({
    Name     = "Copy Base",
    Callback = function()
        if not selectedBase then
            notify("Copy Base", "Select a valid player first.", 5, "alert-triangle")
            return
        end
        clipboard = copyBuild(selectedBase)
        notify("Copy Base", "Base copied successfully!", 4, "check")
    end,
})

buildTab:CreateButton({
    Name     = "Paste Base",
    Callback = function()
        if not clipboard then
            notify("Paste Base", "Nothing copied yet — copy a base first.", 5, "alert-triangle")
            return
        end
        pasteBuild(clipboard, getPlayerBase())
    end,
})

local pasteStatus = buildTab:CreateParagraph({
    Title   = "Paste Progress",
    Content = "Idle"
})

task.spawn(function()
    while task.wait(0.2) do
        local display = pastePercent > 0 and (pastePercent .. "%") or "Idle"
        pasteStatus:Set({ Title = "Paste Progress", Content = display })
    end
end)

buildTab:CreateSection("Settings")

buildTab:CreateToggle({
    Name         = "Ignore Anchored State",
    CurrentValue = true,
    Callback     = function(val)
        ignoreAnchored = val
    end,
})

-- ============================================================
-- TAB: AUTO FARM
-- ============================================================

local farmTab = Window:CreateTab("Auto Farm", "sprout")

farmTab:CreateParagraph({
    Title   = "How Auto Farm Works",
    Content = "Teleports your character through each CaveStage in order, then waits at the Golden Chest until the round resets.",
})

farmTab:CreateToggle({
    Name         = "Enable Auto Farm",
    CurrentValue = false,
    Callback     = function(val)
        autofarm = val
    end,
})

-- ============================================================
-- TAB: PLANE SETTINGS (Waypoint Auto Pilot)
-- ============================================================

local planeTab = Window:CreateTab("Plane Settings", "plane")

planeTab:CreateSection("Waypoint Auto Pilot")

planeTab:CreateParagraph({
    Title   = "Usage",
    Content = "1) Sit in your plane.\n2) Make sure the boat is launched and stages are visible.\n3) Toggle on — the plane flies itself through every stage gate to the chest.",
})

planeTab:CreateToggle({
    Name         = "Enable Waypoint Auto Pilot",
    CurrentValue = false,
    Callback     = function(val)
        if val then startAutoPilot() else stopAutoPilot() end
    end,
})

planeTab:CreateButton({
    Name     = "Emergency Stop",
    Callback = stopAutoPilot,
})

planeTab:CreateSection("Tuning")

planeTab:CreateSlider({
    Name         = "Cruise Speed",
    Range        = {30, 300},
    Increment    = 10,
    CurrentValue = AP_SPEED,
    Suffix       = " studs/s",
    Callback     = function(val) AP_SPEED = val end,
})

planeTab:CreateSlider({
    Name         = "Cruise Altitude",
    Range        = {30, 200},
    Increment    = 5,
    CurrentValue = AP_ALTITUDE,
    Suffix       = " studs",
    Callback     = function(val) AP_ALTITUDE = val end,
})

planeTab:CreateSlider({
    Name         = "Waypoint Arrival Radius",
    Range        = {20, 150},
    Increment    = 5,
    CurrentValue = AP_WAYPOINT_RADIUS,
    Suffix       = " studs",
    Callback     = function(val) AP_WAYPOINT_RADIUS = val end,
})

-- ============================================================
-- TAB: FUN
-- ============================================================

local funTab = Window:CreateTab("Fun", "zap")

-- ── Straight Auto Pilot ───────────────────────────────────────

funTab:CreateSection("Straight Auto Pilot (Walkable)")

funTab:CreateParagraph({
    Title   = "Usage",
    Content = "Sit in your plane, set your speed, then toggle on. The plane locks its heading and keeps flying straight — you can stand on the roof while it moves.",
})

funTab:CreateSlider({
    Name         = "Flight Speed",
    Range        = {20, 200},
    Increment    = 5,
    CurrentValue = STRAIGHT_AP_SPEED,
    Suffix       = " studs/s",
    Callback     = function(val)
        STRAIGHT_AP_SPEED = val
        -- Apply live if already flying
        if straightAPEnabled and straightAPBV and straightAPBV.Parent then
            straightAPBV.Velocity = straightAPBV.Velocity.Unit * STRAIGHT_AP_SPEED
        end
    end,
})

funTab:CreateToggle({
    Name         = "Enable Straight Auto Pilot",
    CurrentValue = false,
    Callback     = function(val)
        if val then startStraightAutoPilot() else stopStraightAutoPilot() end
    end,
})

funTab:CreateButton({
    Name     = "Emergency Stop",
    Callback = stopStraightAutoPilot,
})

-- ── Car Fly ───────────────────────────────────────────────────

funTab:CreateSection("Car Fly")

funTab:CreateButton({
    Name     = "Open Car Fly GUI",
    Callback = function()
        if autoPilotEnabled or straightAPEnabled then
            notify("Car Fly", "Stop all Auto Pilots before using Car Fly.", 4, "alert-triangle")
            return
        end

        local flying      = false
        local flySpeed    = 50
        local flyConn
        local bv

        local gui              = Instance.new("ScreenGui")
        gui.Name               = "CarFlyGUI"
        gui.ResetOnSpawn       = false
        gui.Parent             = player:WaitForChild("PlayerGui")

        local frame            = Instance.new("Frame")
        frame.Size             = UDim2.new(0, 230, 0, 130)
        frame.Position         = UDim2.new(0.05, 0, 0.4, 0)
        frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        frame.BorderSizePixel  = 0
        frame.Parent           = gui

        local corner       = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 8)
        corner.Parent      = frame

        local function makeButton(text, x, y, w, h, color)
            local btn                  = Instance.new("TextButton")
            btn.Size                   = UDim2.new(0, w, 0, h)
            btn.Position               = UDim2.new(0, x, 0, y)
            btn.Text                   = text
            btn.BackgroundColor3       = color or Color3.fromRGB(60, 60, 60)
            btn.TextColor3             = Color3.new(1, 1, 1)
            btn.Font                   = Enum.Font.GothamBold
            btn.TextSize               = 13
            btn.BorderSizePixel        = 0
            btn.Parent                 = frame
            local c                    = Instance.new("UICorner")
            c.CornerRadius             = UDim.new(0, 6)
            c.Parent                   = btn
            return btn
        end

        local toggleBtn  = makeButton("▶ Fly: OFF", 10, 10, 110, 32, Color3.fromRGB(50, 120, 50))
        local plusBtn    = makeButton("+",          185, 10, 35, 32)
        local minusBtn   = makeButton("-",          185, 50, 35, 32)
        local destroyBtn = makeButton("✕ Close",    10, 88, 110, 32, Color3.fromRGB(160, 40, 40))

        local speedLabel               = Instance.new("TextLabel")
        speedLabel.Size                = UDim2.new(0, 60, 0, 32)
        speedLabel.Position            = UDim2.new(0, 120, 0, 10)
        speedLabel.Text                = "Spd: " .. flySpeed
        speedLabel.BackgroundTransparency = 1
        speedLabel.TextColor3          = Color3.new(1, 1, 1)
        speedLabel.Font                = Enum.Font.Gotham
        speedLabel.TextSize            = 12
        speedLabel.Parent              = frame

        local ctrl = { f = 0, b = 0, l = 0, r = 0 }

        local ib = UserInputService.InputBegan:Connect(function(inp, proc)
            if proc then return end
            if inp.KeyCode == Enum.KeyCode.W then ctrl.f =  1 end
            if inp.KeyCode == Enum.KeyCode.S then ctrl.b = -1 end
            if inp.KeyCode == Enum.KeyCode.A then ctrl.l = -1 end
            if inp.KeyCode == Enum.KeyCode.D then ctrl.r =  1 end
        end)
        local ie = UserInputService.InputEnded:Connect(function(inp)
            if inp.KeyCode == Enum.KeyCode.W then ctrl.f = 0 end
            if inp.KeyCode == Enum.KeyCode.S then ctrl.b = 0 end
            if inp.KeyCode == Enum.KeyCode.A then ctrl.l = 0 end
            if inp.KeyCode == Enum.KeyCode.D then ctrl.r = 0 end
        end)

        local function cleanup()
            flying = false
            if bv then bv:Destroy(); bv = nil end
            if flyConn then flyConn:Disconnect(); flyConn = nil end
            ib:Disconnect(); ie:Disconnect()
        end

        toggleBtn.MouseButton1Click:Connect(function()
            flying = not flying
            toggleBtn.Text             = flying and "⏹ Fly: ON" or "▶ Fly: OFF"
            toggleBtn.BackgroundColor3 = flying and Color3.fromRGB(160, 50, 50) or Color3.fromRGB(50, 120, 50)

            local car = getCar()
            if not car then return end
            local part = car.PrimaryPart or car:FindFirstChildWhichIsA("BasePart")
            if not part then return end

            if flying then
                if not bv or not bv.Parent then
                    bv          = Instance.new("BodyVelocity")
                    bv.Name     = "FlyBV"
                    bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                    bv.Parent   = part
                end
                if not flyConn then
                    flyConn = RunService.RenderStepped:Connect(function()
                        if not flying or not bv or not bv.Parent then return end
                        local cam     = Workspace.CurrentCamera
                        local moveDir = (cam.CFrame.LookVector * (ctrl.f + ctrl.b))
                            + ((cam.CFrame * CFrame.new(ctrl.l + ctrl.r, 0, 0)).Position - cam.CFrame.Position)
                        bv.Velocity = moveDir.Magnitude > 0 and moveDir.Unit * flySpeed or Vector3.zero
                        part.CFrame = CFrame.new(part.Position, part.Position + cam.CFrame.LookVector)
                    end)
                end
            else
                if bv then bv:Destroy(); bv = nil end
                if flyConn then flyConn:Disconnect(); flyConn = nil end
            end
        end)

        plusBtn.MouseButton1Click:Connect(function()
            flySpeed = math.min(flySpeed + 10, 500)
            speedLabel.Text = "Spd: " .. flySpeed
        end)

        minusBtn.MouseButton1Click:Connect(function()
            flySpeed = math.max(flySpeed - 10, 10)
            speedLabel.Text = "Spd: " .. flySpeed
        end)

        destroyBtn.MouseButton1Click:Connect(function()
            cleanup()
            gui:Destroy()
        end)
    end,
})

-- ============================================================
-- AUTO FARM LOOP
-- ============================================================

task.spawn(function()
    while true do
        task.wait()
        if not autofarm or not HRP then continue end

        if stageIndex == 11 then
            -- At the end — teleport to chest and wait for round reset
            local endStage = Workspace:FindFirstChild("BoatStages")
                and Workspace.BoatStages:FindFirstChild("NormalStages")
                and Workspace.BoatStages.NormalStages:FindFirstChild("TheEnd")
            local chest = endStage and endStage:FindFirstChild("GoldenChest")
            if not chest then continue end

            HRP:PivotTo(chest:GetPivot() + Vector3.new(0, 0, -10))

            local timer = 0
            repeat
                task.wait(1)
                timer += 1
                if timer % 20 == 0 then
                    HRP:PivotTo(chest:GetPivot() + Vector3.new(0, 0, -10))
                end
            until (HRP.Position - chest:GetPivot().Position).Magnitude > 500

            stageIndex = 1
        else
            -- Navigate through the current cave stage
            local normalStages = Workspace:FindFirstChild("BoatStages")
                and Workspace.BoatStages:FindFirstChild("NormalStages")
            if not normalStages then continue end

            local stage    = normalStages:FindFirstChild("CaveStage" .. stageIndex)
            local darkPart = stage and stage:FindFirstChild("DarknessPart")
            if not darkPart then continue end

            character:PivotTo(darkPart.CFrame - Vector3.new(0, 0, 15))

            local tween = TweenService:Create(
                HRP,
                TweenInfo.new(2, Enum.EasingStyle.Linear),
                { CFrame = darkPart.CFrame + Vector3.new(0, 0, 20) }
            )
            tweening = true
            tween:Play()
            tween.Completed:Wait()
            tweening = false

            stageIndex += 1
        end
    end
end)

-- ============================================================
-- HEARTBEAT  (keep HRP still while tweening)
-- ============================================================

RunService.Heartbeat:Connect(function()
    if tweening and HRP then
        HRP.AssemblyLinearVelocity = Vector3.zero
    end
end)

-- ============================================================
-- CHARACTER RESPAWN
-- ============================================================

player.CharacterAdded:Connect(function(newChar)
    character = newChar
    HRP       = newChar:WaitForChild("HumanoidRootPart")
    humanoid  = newChar:WaitForChild("Humanoid")

    -- Both autopilots reference the old vehicle which is now gone
    if autoPilotEnabled   then stopAutoPilot()         end
    if straightAPEnabled  then stopStraightAutoPilot()  end
end)

-- ============================================================
-- ANTI-AFK
-- ============================================================

task.spawn(function()
    while task.wait(100) do
        VIM:SendKeyEvent(true,  Enum.KeyCode.Tilde, false, nil)
        task.wait(0.1)
        VIM:SendKeyEvent(false, Enum.KeyCode.Tilde, false, nil)
    end
end)

-- ============================================================
-- LOAD SAVED CONFIGURATION
-- ============================================================

Rayfield:LoadConfiguration()
