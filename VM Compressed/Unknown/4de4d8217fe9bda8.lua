-- LEROYS UNIVERSAL SCRIPT (Rayfield Blue Neon) — Mouse-centered stable aimbot + full UI
-- by endi (updated by ChatGPT)
-- Paste entire file into executor

-- Load Rayfield safely
local okRay, Rayfield = pcall(function() return loadstring(game:HttpGet('https://sirius.menu/rayfield'))() end)
if not okRay or not Rayfield then
    warn("Rayfield failed to load. Script requires Rayfield UI.")
    return
end

-- Create Window
local Window = Rayfield:CreateWindow({
    Name = "LEROYS UNIVERSAL SCRIPT (Blue Neon)",
    LoadingTitle = "Leroy's Universal Menu",
    LoadingSubtitle = "by endi",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "LeroysUniversal",
        FileName = "Settings"
    },
    Discord = { Enabled = false },
    KeySystem = false,
    Theme = "Blue Neon"
})

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ContextActionService = game:GetService("ContextActionService")
local Workspace = workspace
local LocalPlayer = Players.LocalPlayer

local function getCamera() return Workspace.CurrentCamera end

-- Notification helper
local function notify(title, content, dur)
    pcall(function()
        Rayfield:Notify({Title = title, Content = content, Duration = dur or 4, Image = nil})
    end)
end

-- ================= State / Settings =================
local Aimbot = {
    enabled = false,
    wallCheck = true,
    prediction = true,
    predictionAmount = 0.12,
    fovPixels = 200,
    smoothing = 0.28,
    smoothAimEnabled = true,
    ignoreTeam = false,
    reacquireEnabled = true,
    reacquireTimeout = 0.7,
    lockedTarget = nil,
    _lostSince = nil,
    isMobile = UserInputService.TouchEnabled and not UserInputService.MouseEnabled,
    lockKey = { type = "Mouse", name = "MouseButton2" }, -- default right-click
    holdToLock = true,
    toggleState = false,
    fovDebounce = 0.06, -- lower = more responsive, higher = stickier
    _lastTargetCheck = 0
}

-- Convert input -> key ID
local function inputToKeyId(input)
    if not input then return nil end
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        return { type = "Mouse", name = "MouseButton1" }
    elseif input.UserInputType == Enum.UserInputType.MouseButton2 then
        return { type = "Mouse", name = "MouseButton2" }
    elseif input.UserInputType == Enum.UserInputType.MouseButton3 then
        return { type = "Mouse", name = "MouseButton3" }
    elseif input.KeyCode and input.KeyCode ~= Enum.KeyCode.Unknown then
        return { type = "Key", name = tostring(input.KeyCode):gsub("Enum.KeyCode.", "") }
    else
        return nil
    end
end

local function keyIdToString(k) if not k then return "None" end return k.name end

-- ============== Target helpers (safe) ==============
local function isPlayerAlive(pl)
    if not pl or not pl.Character then return false end
    local hum = pl.Character:FindFirstChildOfClass("Humanoid")
    return hum and hum.Health and hum.Health > 0
end

local function hasLineOfSight(origin, targetPos, targetCharacter)
    if not origin or not targetPos then return false end
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Blacklist
    params.FilterDescendantsInstances = {}
    if LocalPlayer and LocalPlayer.Character then table.insert(params.FilterDescendantsInstances, LocalPlayer.Character) end
    params.IgnoreWater = true
    local ok, result = pcall(function() return Workspace:Raycast(origin, (targetPos - origin), params) end)
    if not ok then return true end
    if not result then return true end
    if targetCharacter and result.Instance and result.Instance:IsDescendantOf(targetCharacter) then return true end
    return false
end

local function getPredictedPosition(rootPart, origin, t)
    if not rootPart then return nil end
    local pos = rootPart.Position
    local vel = rootPart.Velocity or Vector3.new()
    local tt = t or Aimbot.predictionAmount
    return pos + vel * tt
end

-- Mouse-centered target selection (safe, no goto)
local function getClosestTargetToScreenPoint(screenX, screenY, maxDist, ignoreTeam)
    local cam = getCamera()
    if not cam then return nil end
    local best = nil
    local bestDist = maxDist or math.huge

    for _, pl in pairs(Players:GetPlayers()) do
        if pl == LocalPlayer then
            -- skip
        else
            if not isPlayerAlive(pl) then
                -- skip
            else
                if (not ignoreTeam) and pl.Team and LocalPlayer.Team and pl.Team == LocalPlayer.Team then
                    -- skip teammates
                else
                    local char = pl.Character
                    if char then
                        local head = char:FindFirstChild("Head")
                        if head then
                            local ok, screenPoint, onScreen = pcall(function() return cam:WorldToViewportPoint(head.Position) end)
                            if ok and onScreen then
                                local dx = screenPoint.X - screenX
                                local dy = screenPoint.Y - screenY
                                local dist = math.sqrt(dx*dx + dy*dy)
                                if dist < bestDist then
                                    bestDist = dist
                                    best = { player = pl, head = head, dist = dist }
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    return best
end

-- Smooth camera aim
local function smoothLookAt(cam, goalPos, smoothing)
    smoothing = smoothing or Aimbot.smoothing
    if not cam or not goalPos then return end
    if Aimbot.smoothAimEnabled then
        local origin = cam.CFrame.Position
        local goalCFrame = CFrame.new(origin, goalPos)
        cam.CFrame = cam.CFrame:Lerp(goalCFrame, math.clamp(smoothing, 0, 1))
    else
        cam.CFrame = CFrame.new(cam.CFrame.Position, goalPos)
    end
end

local function handleLostTarget()
    if not Aimbot.reacquireEnabled then
        Aimbot.lockedTarget = nil
        Aimbot._lostSince = nil
        return
    end
    if not Aimbot._lostSince then
        Aimbot._lostSince = tick()
        return
    end
    if tick() - (Aimbot._lostSince or 0) >= (Aimbot.reacquireTimeout or 0.7) then
        Aimbot.lockedTarget = nil
        Aimbot._lostSince = nil
    end
end

-- ============== IMPROVED AIMBOT CORE (mouse-centered, stable) ==============
local renderConn
local function aimbotRenderStep()
    local cam = getCamera()
    if not cam then return end

    -- Decide whether user is actively locking
    local activeLock = false
    if Aimbot.isMobile then
        -- mobile uses mobile buttons to set lockedTarget; treat as active when lockedTarget exists
        activeLock = true
    else
        if Aimbot.holdToLock then
            if Aimbot.lockKey and Aimbot.lockKey.type == "Mouse" then
                if Aimbot.lockKey.name == "MouseButton2" then
                    activeLock = UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
                elseif Aimbot.lockKey.name == "MouseButton1" then
                    activeLock = UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
                elseif Aimbot.lockKey.name == "MouseButton3" then
                    activeLock = UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton3)
                end
            elseif Aimbot.lockKey and Aimbot.lockKey.type == "Key" then
                local ok, kc = pcall(function() return Enum.KeyCode[Aimbot.lockKey.name] end)
                if ok and kc then activeLock = UserInputService:IsKeyDown(kc) end
            end
        else
            activeLock = Aimbot.toggleState
        end
    end

    if not activeLock and not Aimbot.isMobile then
        -- not active: clear state
        Aimbot.lockedTarget = nil
        Aimbot._lostSince = nil
        return
    end

    -- use mouse position for aiming
    local mousePos = UserInputService:GetMouseLocation()
    local mx, my = mousePos.X, mousePos.Y

    -- find the best candidate near the mouse within FOV
    local candidate = getClosestTargetToScreenPoint(mx, my, Aimbot.fovPixels, Aimbot.ignoreTeam)

    -- Decide "target" — prefer candidate, else fall back to current locked target
    local target = (candidate and candidate.player) or Aimbot.lockedTarget

    if target and isPlayerAlive(target) and target.Character then
        local root = target.Character:FindFirstChild("HumanoidRootPart") or target.Character:FindFirstChild("Head")
        if root then
            local aimPos = root.Position
            if Aimbot.prediction then
                aimPos = getPredictedPosition(root, cam.CFrame.Position, Aimbot.predictionAmount) or aimPos
            end

            -- Wall check: if blocked, start reacquire timer; if not blocked, aim
            if (not Aimbot.wallCheck) or hasLineOfSight(cam.CFrame.Position, aimPos, target.Character) then
                -- Good target; aim smoothly
                Aimbot.lockedTarget = target
                Aimbot._lostSince = nil
                smoothLookAt(cam, aimPos, Aimbot.smoothing)
            else
                -- blocked by wall
                if Aimbot.reacquireEnabled then
                    if not Aimbot._lostSince then Aimbot._lostSince = tick() end
                    if tick() - Aimbot._lostSince >= Aimbot.reacquireTimeout then
                        Aimbot.lockedTarget = nil
                        Aimbot._lostSince = nil
                    end
                else
                    Aimbot.lockedTarget = nil
                end
            end
        else
            Aimbot.lockedTarget = nil
        end
    else
        -- no valid target
        handleLostTarget()
    end
end

local function startAimbotLoop()
    if renderConn then return end
    renderConn = RunService.RenderStepped:Connect(aimbotRenderStep)
end

local function stopAimbotLoop()
    if renderConn then
        renderConn:Disconnect()
        renderConn = nil
    end
end

local function toggleAimbotEnable(val)
    Aimbot.enabled = val
    if val then
        startAimbotLoop()
        notify("Aimbot", "Enabled", 2)
    else
        stopAimbotLoop()
        Aimbot.lockedTarget = nil
        Aimbot._lostSince = nil
        notify("Aimbot", "Disabled", 2)
    end
end

-- ============== Key capture ==============
local capturingKey = false
local function startKeyBindCapture(buttonGui)
    if capturingKey then notify("Bind", "Already capturing", 2); return end
    capturingKey = true
    notify("Bind", "Press any key or mouse button to set lock key", 6)

    local conn
    conn = UserInputService.InputBegan:Connect(function(input, gp)
        if gp then return end
        local id = inputToKeyId(input)
        if id then
            Aimbot.lockKey = id
            notify("Bind", "Lock key set to: "..keyIdToString(id), 3)
            capturingKey = false
            if conn then conn:Disconnect(); conn = nil end
            pcall(function()
                if buttonGui and type(buttonGui.SetText) == "function" then
                    buttonGui:SetText("Lock Key: "..keyIdToString(id))
                end
            end)
        end
    end)

    task.spawn(function()
        local start = tick()
        while capturingKey and tick() - start < 10 do task.wait(0.1) end
        if capturingKey then
            capturingKey = false
            notify("Bind", "Key binding timed out", 2)
            if conn then conn:Disconnect(); conn = nil end
        end
    end)
end

-- ============== Mobile GUI ==============
local mobileGui
local function createMobileGuiIfNeeded()
    if mobileGui then return end
    if not LocalPlayer or not LocalPlayer:FindFirstChild("PlayerGui") then return end

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "LeroyAimbotMobileGui"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = LocalPlayer.PlayerGui

    local frame = Instance.new("Frame", screenGui)
    frame.Size = UDim2.new(0, 220, 0, 70)
    frame.Position = UDim2.new(0.5, -110, 0.85, 0)
    frame.AnchorPoint = Vector2.new(0.5, 0.5)
    frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
    frame.BackgroundTransparency = 0.15

    local lockBtn = Instance.new("TextButton", frame)
    lockBtn.Size = UDim2.new(0, 100, 0, 50)
    lockBtn.Position = UDim2.new(0, 6, 0, 10)
    lockBtn.Text = "Lock"

    local unlockBtn = Instance.new("TextButton", frame)
    unlockBtn.Size = UDim2.new(0, 100, 0, 50)
    unlockBtn.Position = UDim2.new(0, 114, 0, 10)
    unlockBtn.Text = "Unlock"

    lockBtn.MouseButton1Click:Connect(function()
        local cam = getCamera()
        if not cam then notify("Aimbot", "Camera not ready", 2); return end
        local cx, cy = cam.ViewportSize.X/2, cam.ViewportSize.Y/2
        local best = getClosestTargetToScreenPoint(cx, cy, 300, Aimbot.ignoreTeam)
        if best and best.player then
            Aimbot.lockedTarget = best.player
            startAimbotLoop()
            notify("Aimbot", "Locked to "..best.player.Name, 3)
        else
            notify("Aimbot", "No target found near center", 2.5)
        end
    end)

    unlockBtn.MouseButton1Click:Connect(function()
        Aimbot.lockedTarget = nil
        notify("Aimbot", "Unlocked", 2)
    end)

    mobileGui = screenGui
end

-- ============== Visuals: simple ESP ==============
local function toggleSimpleESP(enable)
    if enable then
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") then
                local head = p.Character.Head
                if not head:FindFirstChild("LeroyESP") then
                    local bg = Instance.new("BillboardGui")
                    bg.Name = "LeroyESP"
                    bg.AlwaysOnTop = true
                    bg.StudsOffset = Vector3.new(0, 2.5, 0)
                    bg.Size = UDim2.new(0, 120, 0, 30)
                    bg.Adornee = head
                    local lbl = Instance.new("TextLabel", bg)
                    lbl.Size = UDim2.new(1,0,1,0)
                    lbl.BackgroundTransparency = 1
                    lbl.Text = p.Name
                    lbl.TextScaled = true
                    lbl.TextColor3 = Color3.fromRGB(255,50,50)
                    bg.Parent = head
                end
            end
        end
    else
        for _, p in pairs(Players:GetPlayers()) do
            if p.Character and p.Character:FindFirstChild("Head") then
                local h = p.Character.Head:FindFirstChild("LeroyESP")
                if h then h:Destroy() end
            end
        end
    end
    _G.LeroyESPEnabled = enable
end

-- ============== Movement helpers ==============
local function setWalkSpeed(v)
    pcall(function()
        local char = LocalPlayer.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then hum.WalkSpeed = v end
        end
    end)
end

local function setJumpPower(v)
    pcall(function()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then hum.JumpPower = v end
    end)
end

local _noclipConn
local function toggleNoclip()
    if _G.LeroyNoclipRunning then
        _G.LeroyNoclipRunning = false
        if _noclipConn then _noclipConn:Disconnect(); _noclipConn = nil end
        notify("Noclip", "Disabled", 2)
    else
        _G.LeroyNoclipRunning = true
        _noclipConn = RunService.RenderStepped:Connect(function()
            local pl = LocalPlayer
            if pl and pl.Character then
                for _, part in pairs(pl.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        pcall(function() part.CanCollide = false end)
                    end
                end
            end
        end)
        notify("Noclip", "Enabled (press X to toggle)", 2)
    end
end

-- ============== Build full Rayfield UI ==============
-- Aimbot Tab
local AimbotTab = Window:CreateTab("Aimbot", nil)
AimbotTab:CreateSection("Aim settings")

AimbotTab:CreateToggle({
    Name = "Enable Aimbot",
    CurrentValue = false,
    Flag = "AimbotEnabledFlag",
    Callback = function(v) toggleAimbotEnable(v) end
})

AimbotTab:CreateToggle({
    Name = "WallCheck (don't aim through walls)",
    CurrentValue = Aimbot.wallCheck,
    Callback = function(v) Aimbot.wallCheck = v end
})

AimbotTab:CreateToggle({
    Name = "Use Prediction/Lead",
    CurrentValue = Aimbot.prediction,
    Callback = function(v) Aimbot.prediction = v end
})

AimbotTab:CreateSlider({
    Name = "Prediction Amount",
    Range = {0, 1},
    Increment = 0.01,
    CurrentValue = Aimbot.predictionAmount,
    Callback = function(v) Aimbot.predictionAmount = v end
})

AimbotTab:CreateSlider({
    Name = "Aimbot FOV (px)",
    Range = {30, 900},
    Increment = 5,
    CurrentValue = Aimbot.fovPixels,
    Callback = function(v) Aimbot.fovPixels = v end
})

AimbotTab:CreateToggle({
    Name = "Ignore Team",
    CurrentValue = Aimbot.ignoreTeam,
    Callback = function(v) Aimbot.ignoreTeam = v end
})

AimbotTab:CreateToggle({
    Name = "Smooth Aim",
    CurrentValue = Aimbot.smoothAimEnabled,
    Callback = function(v) Aimbot.smoothAimEnabled = v end
})

AimbotTab:CreateSlider({
    Name = "Smoothing Amount",
    Range = {0, 1},
    Increment = 0.01,
    CurrentValue = Aimbot.smoothing,
    Callback = function(v) Aimbot.smoothing = v end
})

AimbotTab:CreateToggle({
    Name = "Hold to Lock (if off: Toggle)",
    CurrentValue = Aimbot.holdToLock,
    Callback = function(v)
        Aimbot.holdToLock = v
        notify("Aimbot", (v and "Hold mode enabled" or "Toggle mode enabled"), 2)
    end
})

AimbotTab:CreateButton({
    Name = "Set Lock Key (Click then press key)",
    Callback = function(btn)
        startKeyBindCapture(btn)
    end
})

AimbotTab:CreateButton({
    Name = "Clear Lock",
    Callback = function()
        Aimbot.lockedTarget = nil
        Aimbot._lostSince = nil
        Aimbot.toggleState = false
        stopAimbotLoop()
        notify("Aimbot", "Lock cleared", 2)
    end
})

AimbotTab:CreateButton({
    Name = "Show Mobile Lock GUI",
    Callback = function()
        if not Aimbot.isMobile then notify("Mobile", "Device not detected as mobile", 2); return end
        createMobileGuiIfNeeded()
        notify("Mobile", "Mobile lock GUI created", 2)
    end
})

-- Visuals Tab
local VisualsTab = Window:CreateTab("Visuals", nil)
VisualsTab:CreateSection("ESP / Visual helpers")
VisualsTab:CreateToggle({
    Name = "Simple ESP",
    CurrentValue = _G.LeroyESPEnabled or false,
    Callback = function(v) toggleSimpleESP(v) end
})
VisualsTab:CreateButton({
    Name = "Clear All ESP",
    Callback = function() toggleSimpleESP(false); notify("ESP", "Cleared", 2) end
})

-- Movement Tab
local MovementTab = Window:CreateTab("Movement", nil)
MovementTab:CreateSection("Movement tweaks")
MovementTab:CreateSlider({
    Name = "WalkSpeed",
    Range = {16, 200},
    Increment = 1,
    CurrentValue = 16,
    Callback = function(v) setWalkSpeed(v) end
})
MovementTab:CreateSlider({
    Name = "JumpPower",
    Range = {50, 300},
    Increment = 1,
    CurrentValue = 50,
    Callback = function(v) setJumpPower(v) end
})
MovementTab:CreateButton({
    Name = "Noclip toggle (X)",
    Callback = function() toggleNoclip() end
})
MovementTab:CreateToggle({
    Name = "Desync Mode",
    CurrentValue = false,
    Callback = function(enabled)
        if enabled then
            _G.leroyDesync = true
            local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local hrp = char:WaitForChild("HumanoidRootPart")
            task.spawn(function()
                while _G.leroyDesync do
                    pcall(function() hrp.CFrame = hrp.CFrame * CFrame.new(math.random(-0.5,0.5),0,math.random(-0.5,0.5)) end)
                    task.wait(0.1)
                end
            end)
        else
            _G.leroyDesync = false
        end
    end
})

-- Misc Tab
local MiscTab = Window:CreateTab("Misc", nil)
MiscTab:CreateSection("Utilities")
MiscTab:CreateButton({
    Name = "Infinite Yield",
    Callback = function()
        pcall(function() loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))() end)
        notify("Extras", "Infinite Yield loaded", 2)
    end
})
MiscTab:CreateButton({
    Name = "Notify Test",
    Callback = function() notify("Test", "Notifications working!", 2) end
})

-- Extras Tab
local ExtrasTab = Window:CreateTab("Extras", nil)
ExtrasTab:CreateSection("Risky / Extra")
ExtrasTab:CreateButton({
    Name = "Hitbox Expander (Caution)",
    Callback = function()
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = p.Character.HumanoidRootPart
                pcall(function()
                    hrp.Size = Vector3.new(8,8,8)
                    hrp.Transparency = 0.5
                    if hrp:FindFirstChild("LeroyHitboxMarker") then hrp.LeroyHitboxMarker:Destroy() end
                    local mark = Instance.new("SelectionBox", hrp)
                    mark.Name = "LeroyHitboxMarker"
                end)
            end
        end
        notify("Hitbox", "Attempted to expand hitboxes (may not work in all games)", 3)
    end
})
ExtrasTab:CreateButton({
    Name = "Unload Aimbot Loop",
    Callback = function()
        stopAimbotLoop()
        Aimbot.lockedTarget = nil
        notify("Aimbot", "Aimbot loop stopped", 2)
    end
})

-- ============== Input handling ==============
-- Remove UI on K & handle lock key presses
UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end

    -- Remove UI on K
    if input.KeyCode == Enum.KeyCode.K then
        pcall(function() Window:Destroy() end)
        notify("UI", "Interface removed.", 2)
        return
    end

    -- Capture lock key trigger
    local id = inputToKeyId(input)
    if not id then return end
    if Aimbot.lockKey and id.type == Aimbot.lockKey.type and id.name == Aimbot.lockKey.name then
        if not Aimbot.holdToLock then
            Aimbot.toggleState = not Aimbot.toggleState
            if Aimbot.toggleState then
                notify("Aimbot", "Toggled: LOCK ON", 2)
                startAimbotLoop()
            else
                notify("Aimbot", "Toggled: LOCK OFF", 2)
                Aimbot.lockedTarget = nil
                stopAimbotLoop()
            end
        else
            startAimbotLoop()
        end
    end
end)

UserInputService.InputEnded:Connect(function(input, gp)
    if gp then return end
    local id = inputToKeyId(input)
    if not id then return end
    if Aimbot.lockKey and id.type == Aimbot.lockKey.type and id.name == Aimbot.lockKey.name then
        if Aimbot.holdToLock then
            Aimbot.lockedTarget = nil
            Aimbot._lostSince = nil
            stopAimbotLoop()
        end
    end
end)

-- Noclip bind X
ContextActionService:BindAction("LeroyNoclipToggle", function(_, state)
    if state == Enum.UserInputState.Begin then toggleNoclip() end
end, false, Enum.KeyCode.X)

-- Mobile GUI if device
if Aimbot.isMobile then createMobileGuiIfNeeded() end

-- Final notify and hint
notify("Leroy's Universal", "Loaded. Press K to remove interface/UI. Default lock: Right Click. Smooth Aim + smoothing slider available.", 6)

-- Start loop if saved enabled
if Aimbot.enabled then startAimbotLoop() end

-- End of script
