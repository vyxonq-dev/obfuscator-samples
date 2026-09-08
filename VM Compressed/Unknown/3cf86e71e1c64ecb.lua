
local Players             = game:GetService("Players")
local RunService          = game:GetService("RunService")
local UserInputService    = game:GetService("UserInputService")
local TeleportService     = game:GetService("TeleportService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local Workspace           = game:GetService("Workspace")

local player = Players.LocalPlayer
local camera = Workspace.CurrentCamera


local LOG_IGNORE = {
    "Remote event invocation discarded",
    "attempt to index nil with 'Character'",
    "SendLikelySpeakingUsers",
    "Failed to load animation",
    "Unable to cast",
    "CoreGui",
    "argument #1 expects a string",
}
game:GetService("LogService").MessageOut:Connect(function(msg, msgType)
    if msgType == Enum.MessageType.MessageWarning or msgType == Enum.MessageType.MessageError then
        for _, pat in ipairs(LOG_IGNORE) do
            if msg:find(pat) then return end
        end
    end
   
end)


local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name             = "Admin Panel 2026",
    LoadingTitle     = "Admin Panel",
    LoadingSubtitle  = "Loading...",
    ConfigurationSaving = {
        Enabled    = true,
        FolderName = "AdminPanel2026",
        FileName   = "Config"
    }
})

local TabMain   = Window:CreateTab("Main",   4483362458)
local TabCombat = Window:CreateTab("Combat", 4483362458)
local TabVisual = Window:CreateTab("Visual", 4483362458)
local TabMisc   = Window:CreateTab("Misc",   4483362458)


local STATE = {
    fly              = false,
    noclip           = false,
    infJump          = false,
    godmode          = false,
    killAura         = false,
    esp              = false,
    autoClicker      = false,
    antiFling        = false,
    invisible        = false,
    invisConn        = nil,
    walkFling        = false,
    killAuraRadius   = 15,
    walkSpeed        = 16,
    jumpPower        = 50,
    flySpeed         = 60,
    fakeLagIntensity = 0,
}


local function getChar()  return player.Character end
local function getRoot()  local c = getChar(); return c and c:FindFirstChild("HumanoidRootPart") end
local function getHuman() local c = getChar(); return c and c:FindFirstChildOfClass("Humanoid") end

local function notify(title, content)
    Rayfield:Notify({ Title = title, Content = content, Duration = 3 })
end


local flyBody, flyGyro

local function enableFly()
    local root = getRoot()
    if not root then return end
    if flyBody then flyBody:Destroy() end
    if flyGyro  then flyGyro:Destroy() end

    flyBody = Instance.new("BodyVelocity")
    flyBody.Velocity = Vector3.zero
    flyBody.MaxForce = Vector3.new(1e5, 1e5, 1e5)
    flyBody.Parent   = root

    flyGyro = Instance.new("BodyGyro")
    flyGyro.MaxTorque = Vector3.new(1e5, 1e5, 1e5)
    flyGyro.P         = 1e4
    flyGyro.CFrame    = root.CFrame
    flyGyro.Parent    = root
end

local function disableFly()
    if flyBody then flyBody:Destroy(); flyBody = nil end
    if flyGyro  then flyGyro:Destroy(); flyGyro  = nil end
    local hum = getHuman()
    if hum then hum:ChangeState(Enum.HumanoidStateType.Falling) end
end

RunService.RenderStepped:Connect(function()
    if not STATE.fly or not flyBody or not flyGyro then return end
    local root = getRoot()
    if not root then return end

    local cf  = camera.CFrame
    local vel = Vector3.zero

    if UserInputService:IsKeyDown(Enum.KeyCode.W)           then vel += cf.LookVector        end
    if UserInputService:IsKeyDown(Enum.KeyCode.S)           then vel -= cf.LookVector        end
    if UserInputService:IsKeyDown(Enum.KeyCode.A)           then vel -= cf.RightVector       end
    if UserInputService:IsKeyDown(Enum.KeyCode.D)           then vel += cf.RightVector       end
    if UserInputService:IsKeyDown(Enum.KeyCode.Space)       then vel += Vector3.new(0, 1, 0) end
    if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then vel -= Vector3.new(0, 1, 0) end

    flyBody.Velocity = vel.Magnitude > 0 and vel.Unit * STATE.flySpeed or Vector3.zero
    flyGyro.CFrame   = cf
end)


RunService.Stepped:Connect(function()
    if not STATE.noclip then return end
    local char = getChar()
    if not char then return end
    for _, part in ipairs(char:GetDescendants()) do
        if part:IsA("BasePart") then part.CanCollide = false end
    end
end)


task.spawn(function()
    while true do
        task.wait(0.1)
        if STATE.antiFling then
            local root  = getRoot()
            local hum   = getHuman()
            if root and hum then
                local moveDir   = hum.MoveDirection
                local walkSpeed = hum.WalkSpeed
                local currentY  = root.AssemblyLinearVelocity.Y
                root.AssemblyLinearVelocity  = Vector3.new(
                    moveDir.X * walkSpeed,
                    currentY,
                    moveDir.Z * walkSpeed
                )
                root.AssemblyAngularVelocity = Vector3.zero
            end
        end
    end
end)


UserInputService.JumpRequest:Connect(function()
    if not STATE.infJump then return end
    local hum = getHuman()
    if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
end)


local godmodeConn

local function applyGodmode()
    if godmodeConn then godmodeConn:Disconnect(); godmodeConn = nil end
    local hum = getHuman()
    if not hum then return end
    hum.MaxHealth = math.huge
    hum.Health    = math.huge
    godmodeConn = hum.HealthChanged:Connect(function()
        if STATE.godmode then hum.Health = math.huge end
    end)
end

local function removeGodmode()
    if godmodeConn then godmodeConn:Disconnect(); godmodeConn = nil end
    local hum = getHuman()
    if hum then hum.MaxHealth = 100; hum.Health = 100 end
end


RunService.Heartbeat:Connect(function()
    if not STATE.killAura then return end
    local root = getRoot()
    if not root then return end
    for _, p in ipairs(Players:GetPlayers()) do
        if p == player then continue end
        local char  = p.Character
        local hum   = char and char:FindFirstChildOfClass("Humanoid")
        local pRoot = char and char:FindFirstChild("HumanoidRootPart")
        if hum and pRoot and hum.Health > 0 then
            if (root.Position - pRoot.Position).Magnitude <= STATE.killAuraRadius then
                hum.Health = 0
            end
        end
    end
end)


local walkFlingCoroutine
local movel = 0.1

local function startWalkFling()
    if walkFlingCoroutine then
        coroutine.close(walkFlingCoroutine)
        walkFlingCoroutine = nil
    end
    walkFlingCoroutine = coroutine.create(function()
        while STATE.walkFling do
            local root = getRoot()
            if root then
                local vel = root.AssemblyLinearVelocity
                root.AssemblyLinearVelocity = vel * 10000 + Vector3.new(0, 10000, 0)
                RunService.RenderStepped:Wait()
                root.AssemblyLinearVelocity = vel
                RunService.Stepped:Wait()
                root.AssemblyLinearVelocity = vel + Vector3.new(0, movel, 0)
                movel = -movel
            end
            RunService.Heartbeat:Wait()
        end
    end)
    coroutine.resume(walkFlingCoroutine)
end

local function stopWalkFling()
    STATE.walkFling = false
    if walkFlingCoroutine then
        coroutine.close(walkFlingCoroutine)
        walkFlingCoroutine = nil
    end
    movel = 0.1
end


local function flingSelf()
    local root = getRoot()
    if not root then return end
    local hum = getHuman()
    if hum then hum.PlatformStand = true end
    root.AssemblyLinearVelocity = Vector3.new(
        math.random(-800, 800),
        math.random(1200, 2000),
        math.random(-800, 800)
    )
    root.AssemblyAngularVelocity = Vector3.new(
        math.random(-300, 300),
        math.random(-300, 300),
        math.random(-300, 300)
    )
    task.wait(0.3)
    if hum then hum.PlatformStand = false end
end


local autoClickConn

local function startAutoClicker()
    if autoClickConn then return end
    autoClickConn = RunService.Heartbeat:Connect(function()
        if not STATE.autoClicker then
            autoClickConn:Disconnect()
            autoClickConn = nil
            return
        end
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true,  game, 1)
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
    end)
end


task.spawn(function()
    while true do
        task.wait(0.5)
        if STATE.fakeLagIntensity > 0 then
            local freeze = STATE.fakeLagIntensity * 0.08
            local t = tick()
            while tick() - t < freeze do end
        end
    end
end)


local espDrawings = {}

local function removeESP(p)
    if espDrawings[p] then
        for _, d in ipairs(espDrawings[p]) do d:Remove() end
        espDrawings[p] = nil
    end
end

local function addESP(p)
    if p == player or espDrawings[p] then return end
    local d = {}

    local box = Drawing.new("Square")
    box.Thickness = 2; box.Filled = false
    box.Transparency = 1; box.Color = Color3.fromRGB(255, 50, 50)
    box.Visible = false; table.insert(d, box)

    local nameTag = Drawing.new("Text")
    nameTag.Size = 13; nameTag.Center = true
    nameTag.Outline = true; nameTag.Color = Color3.new(1, 1, 1)
    nameTag.Font = Drawing.Fonts.UI
    nameTag.Visible = false; table.insert(d, nameTag)

    local distTag = Drawing.new("Text")
    distTag.Size = 11; distTag.Center = true
    distTag.Outline = true; distTag.Color = Color3.fromRGB(180, 180, 180)
    distTag.Font = Drawing.Fonts.UI
    distTag.Visible = false; table.insert(d, distTag)

    local hpBar = Drawing.new("Line")
    hpBar.Thickness = 3; hpBar.Transparency = 1
    hpBar.Visible = false; table.insert(d, hpBar)

    espDrawings[p] = d
end

local function updateESP()
    for p, d in pairs(espDrawings) do
        for _, dr in ipairs(d) do dr.Visible = false end
        if not STATE.esp then continue end

        local char = p.Character
        if not char then continue end
        local root = char:FindFirstChild("HumanoidRootPart")
        local head = char:FindFirstChild("Head")
        local hum  = char:FindFirstChildOfClass("Humanoid")
        if not root or not head or not hum or hum.Health <= 0 then continue end

        local rPos, onScreen = camera:WorldToViewportPoint(root.Position)
        if not onScreen then continue end

        local hPos = camera:WorldToViewportPoint(head.Position + Vector3.new(0, 0.7, 0))
        local fPos = camera:WorldToViewportPoint(root.Position - Vector3.new(0, 3, 0))
        local h    = math.abs(hPos.Y - fPos.Y)
        local w    = h * 0.55

        local myRoot = getRoot()
        local dist3D = myRoot and (root.Position - myRoot.Position).Magnitude or 0
        local t      = math.clamp(dist3D / 150, 0, 1)

        d[1].Size     = Vector2.new(w, h)
        d[1].Position = Vector2.new(rPos.X - w/2, hPos.Y)
        d[1].Color    = Color3.fromRGB(math.floor(255*t), math.floor(255*(1-t)), 0)
        d[1].Visible  = true

        d[2].Text     = p.Name
        d[2].Position = Vector2.new(rPos.X, hPos.Y - 16)
        d[2].Visible  = true

        d[3].Text     = math.floor(dist3D) .. " studs"
        d[3].Position = Vector2.new(rPos.X, fPos.Y + 2)
        d[3].Visible  = true

        local hpPct  = math.clamp(hum.Health / math.max(hum.MaxHealth, 1), 0, 1)
        d[4].From    = Vector2.new(d[1].Position.X - 6, fPos.Y)
        d[4].To      = Vector2.new(d[1].Position.X - 6, fPos.Y - h * hpPct)
        d[4].Color   = Color3.fromRGB(math.floor(255*(1-hpPct)), math.floor(255*hpPct), 0)
        d[4].Visible = true
    end
end

for _, p in ipairs(Players:GetPlayers()) do addESP(p) end
Players.PlayerAdded:Connect(function(p)
    addESP(p)
    p.CharacterAdded:Connect(function() task.wait(0.5); addESP(p) end)
end)
Players.PlayerRemoving:Connect(removeESP)
RunService.RenderStepped:Connect(updateESP)


player.CharacterAdded:Connect(function(char)
    task.wait(0.5)
    local hum = char:WaitForChild("Humanoid", 5)
    if not hum then return end
    hum.WalkSpeed = STATE.walkSpeed
    hum.JumpPower = STATE.jumpPower
    if STATE.godmode then task.defer(applyGodmode) end
    if STATE.fly     then task.wait(0.2); enableFly() end
    if STATE.invisible then
        -- Déconnecte l ancien invisConn
        if STATE.invisConn then STATE.invisConn:Disconnect(); STATE.invisConn = nil end
        task.wait(0.3)
        local root2 = char:FindFirstChild("HumanoidRootPart")
        local hum2  = char:FindFirstChildOfClass("Humanoid")
        for _, d in ipairs(char:GetDescendants()) do
            if (d:IsA("BasePart") or d:IsA("MeshPart")) and d.Name ~= "HumanoidRootPart" then
                d.Transparency = 1
            elseif d:IsA("Accessory") and d:FindFirstChild("Handle") then
                d.Handle.Transparency = 1
            end
        end
        if root2 then
            STATE.invisConn = RunService.Heartbeat:Connect(function()
                pcall(function()
                    root2:SetNetworkOwner(nil)
                    root2.Velocity    = Vector3.new()
                    root2.RotVelocity = Vector3.new()
                end)
            end)
        end
    end
end)


TabMain:CreateToggle({
    Name = "Fly  [W/A/S/D + Space/Ctrl]",
    CurrentValue = false,
    Callback = function(v)
        STATE.fly = v
        if v then enableFly() else disableFly() end
    end
})

TabMain:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Callback = function(v) STATE.noclip = v end
})

TabMain:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Callback = function(v) STATE.infJump = v end
})

TabMain:CreateSlider({
    Name = "Walk Speed",
    Range = {16, 500},
    Increment = 1,
    CurrentValue = 16,
    Callback = function(v)
        STATE.walkSpeed = v
        local hum = getHuman()
        if hum then hum.WalkSpeed = v end
    end
})

TabMain:CreateSlider({
    Name = "Jump Power",
    Range = {50, 500},
    Increment = 1,
    CurrentValue = 50,
    Callback = function(v)
        STATE.jumpPower = v
        local hum = getHuman()
        if hum then hum.JumpPower = v end
    end
})

TabMain:CreateSlider({
    Name = "Fly Speed",
    Range = {10, 300},
    Increment = 5,
    CurrentValue = 60,
    Callback = function(v) STATE.flySpeed = v end
})

TabMain:CreateToggle({
    Name = "WalkFling",
    CurrentValue = false,
    Callback = function(v)
        STATE.walkFling = v
        if v then
            STATE.noclip = true  -- force noclip comme dans loriginal
            startWalkFling()
        else
            stopWalkFling()
        end
    end
})

TabMain:CreateButton({
    Name = "Random Fling Burst 🎲",
    Callback = function()
        task.spawn(function()
            for i = 1, 5 do
                local root = getRoot()
                if not root then break end
                root.AssemblyLinearVelocity = Vector3.new(
                    math.random(-600, 600),
                    math.random(400, 900),
                    math.random(-600, 600)
                )
                root.AssemblyAngularVelocity = Vector3.new(
                    math.random(-50, 50),
                    math.random(-50, 50),
                    math.random(-50, 50)
                )
                task.wait(5)
            end
        end)
        notify("Random Fling Burst 🎲", "5 flings aléatoires, 1 toutes les 5s !")
    end
})


TabCombat:CreateToggle({
    Name = "Kill Aura",
    CurrentValue = false,
    Callback = function(v) STATE.killAura = v end
})

TabCombat:CreateSlider({
    Name = "Kill Aura Radius",
    Range = {5, 100},
    Increment = 1,
    CurrentValue = 15,
    Callback = function(v) STATE.killAuraRadius = v end
})

TabCombat:CreateToggle({
    Name = "Godmode",
    CurrentValue = false,
    Callback = function(v)
        STATE.godmode = v
        if v then applyGodmode() else removeGodmode() end
    end
})

TabCombat:CreateButton({
    Name = "Fling Self 🚀",
    Callback = function()
        task.spawn(flingSelf)
        notify("Fling Self", "Launched! 🚀")
    end
})

TabCombat:CreateToggle({
    Name = "Anti-Fling (Protege contre les flings)",
    CurrentValue = false,
    Callback = function(v)
        STATE.antiFling = v
        if not v then
            local root = getRoot()
            if root then
                root.AssemblyAngularVelocity = Vector3.zero
            end
        end
    end
})

TabCombat:CreateButton({
    Name = "Kill Script 💀",
    Callback = function()
        -- Désactive tous les états
        STATE.fly = false; disableFly()
        STATE.noclip = false
        STATE.infJump = false
        STATE.killAura = false
        STATE.antiFling = false
        STATE.invisible = false
        STATE.esp = false
        STATE.godmode = false; removeGodmode()
        STATE.autoClicker = false
        STATE.fakeLag = 0

        -- Remet le perso normal
        local hum = getHuman()
        if hum then
            hum.WalkSpeed = 16
            hum.JumpPower = 50
        end
        -- Remet la transparence
        local char = getChar()
        if char then
            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.LocalTransparencyModifier = 0
                end
            end
        end

        -- Supprime les effets Lighting
        pcall(function() game:GetService("Lighting"):FindFirstChild("FakeBanBlur"):Destroy() end)

        -- Détruit le GUI Rayfield
        task.wait(0.2)
        pcall(function()
            local g = gethui and gethui() or game:GetService("CoreGui")
            for _, v in ipairs(g:GetChildren()) do
                if v.Name == "Rayfield" or v.Name == "FakeBan" then v:Destroy() end
            end
            for _, v in ipairs(player.PlayerGui:GetChildren()) do
                if v.Name == "Rayfield" or v.Name == "FakeBan" then v:Destroy() end
            end
        end)
    end
})

TabCombat:CreateToggle({
    Name = "Invisible (Seat FE)",
    CurrentValue = false,
    Callback = function(v)
        STATE.invisible = v
        local char = getChar()
        local root = getRoot()
        local hum  = getHuman()
        if not char or not root or not hum then return end

        if v then
            -- Côté serveur : tout invisible (Transparency = 1)
            for _, d in ipairs(char:GetDescendants()) do
                if (d:IsA("BasePart") or d:IsA("MeshPart") or d:IsA("UnionOperation")) and d.Name ~= "HumanoidRootPart" then
                    d.Transparency = 1
                elseif d:IsA("Decal") or d:IsA("Texture") then
                    d.Transparency = 1
                end
            end

            -- Méthode Seat : weld un siège invisible sur le Torso
            local savedCF = root.CFrame
            local seatPos = Vector3.new(-25.95, 400, 3537.55)
            pcall(function() char:MoveTo(seatPos) end)
            task.wait(0.05)

            local seat = Instance.new("Seat")
            seat.Name         = "invischair"
            seat.Anchored     = false
            seat.CanCollide   = false
            seat.Transparency = 1
            seat.Position     = seatPos
            seat.Parent       = workspace

            local torso = char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
            if torso then
                local weld = Instance.new("Weld")
                weld.Part0  = seat
                weld.Part1  = torso
                weld.Parent = seat
                task.wait()
                pcall(function() seat.CFrame = savedCF end)
            else
                seat:Destroy()
            end

            -- Heartbeat : force la transparence LOCALE à 0.5 (toi tu te vois)
            -- Les autres voient toujours Transparency = 1 (côté serveur)
            STATE.invisConn = RunService.Heartbeat:Connect(function()
                if not char or not char.Parent then return end
                for _, d in ipairs(char:GetDescendants()) do
                    if (d:IsA("BasePart") or d:IsA("MeshPart") or d:IsA("UnionOperation")) and d.Name ~= "HumanoidRootPart" then
                        d.LocalTransparencyModifier = -0.5  -- 1 + (-0.5) = 0.5 visible pour toi
                    end
                end
            end)

            notify("Invisible ✅ (Seat)", "Tu es invisible ! Toi tu te vois à 50%.")
        else
            -- Reset transparence
            for _, d in ipairs(char:GetDescendants()) do
                if (d:IsA("BasePart") or d:IsA("MeshPart") or d:IsA("UnionOperation")) and d.Name ~= "HumanoidRootPart" then
                    d.Transparency = 0
                    d.LocalTransparencyModifier = 0
                elseif d:IsA("Decal") or d:IsA("Texture") then
                    d.Transparency = 0
                end
            end
            -- Nettoyage siège
            task.spawn(function()
                local inv = workspace:FindFirstChild("invischair")
                if inv then pcall(function() inv:Destroy() end) end
            end)
            if STATE.invisConn then
                STATE.invisConn:Disconnect()
                STATE.invisConn = nil
            end
            notify("Invisible ❌", "Désactivé")
        end
    end
})


TabVisual:CreateToggle({
    Name = "ESP (Names + Boxes + HP)",
    CurrentValue = false,
    Callback = function(v) STATE.esp = v end
})



-- Teleport to Player (fix table vs string selon version Rayfield)
local tpDropdown = TabMisc:CreateDropdown({
    Name          = "Teleport to Player",
    Options       = {},
    CurrentOption = "",
    Callback      = function(option)
        local name = type(option) == "table" and option[1] or option
        if not name or name == "" then return end

        local target = Players:FindFirstChild(name)
        if not target then notify("Teleport ❌", "Player not found: " .. name); return end

        local tRoot  = target.Character and target.Character:FindFirstChild("HumanoidRootPart")
        local myRoot = getRoot()

        if not tRoot  then notify("Teleport ❌", name .. " has no character!"); return end
        if not myRoot then notify("Teleport ❌", "Your character is not loaded!"); return end

        myRoot.CFrame = tRoot.CFrame + Vector3.new(0, 5, 0)
        notify("Teleport ✅", "Teleported to " .. name)
    end
})

local function updatePlayerDropdown()
    local list = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= player then table.insert(list, p.Name) end
    end
    pcall(function() tpDropdown:Refresh(list, true) end)
end

updatePlayerDropdown()
Players.PlayerAdded:Connect(updatePlayerDropdown)
Players.PlayerRemoving:Connect(updatePlayerDropdown)

TabMisc:CreateToggle({
    Name = "Auto Clicker",
    CurrentValue = false,
    Callback = function(v)
        STATE.autoClicker = v
        if v then startAutoClicker() end
    end
})

TabMisc:CreateSlider({
    Name = "Fake Lag Intensity (0 = off, 10 = max)",
    Range = {0, 10},
    Increment = 1,
    CurrentValue = 0,
    Callback = function(v) STATE.fakeLagIntensity = v end
})

TabMisc:CreateButton({
    Name = "Rejoin",
    Callback = function()
        TeleportService:Teleport(game.PlaceId, player)
    end
})

TabMisc:CreateButton({
    Name = "Reset Character",
    Callback = function()
        local hum = getHuman()
        if hum then hum.Health = 0 end
    end
})

TabMisc:CreateButton({
    Name = "Copy Player ID",
    Callback = function()
        pcall(function() setclipboard(tostring(player.UserId)) end)
        notify("Copied! 📋", "Your ID: " .. player.UserId)
    end
})

TabMisc:CreateLabel("Player: " .. player.Name)
TabMisc:CreateLabel("User ID: " .. player.UserId)
TabMisc:CreateLabel("Place ID: " .. game.PlaceId)

TabMisc:CreateButton({
    Name = "Fake Ban Screen 🔨",
    Callback = function()
        task.spawn(function()
        local TweenService = game:GetService("TweenService")
        local Lighting     = game:GetService("Lighting")
        local playerGui    = player:WaitForChild("PlayerGui")

        pcall(function() playerGui:FindFirstChild("FakeBan"):Destroy() end)
        pcall(function() Lighting:FindFirstChild("FakeBanBlur"):Destroy() end)


        local blur = Instance.new("BlurEffect")
        blur.Name = "FakeBanBlur"
        blur.Size = 0
        blur.Parent = Lighting
        TweenService:Create(blur, TweenInfo.new(0.5), {Size = 24}):Play()


        local gui = Instance.new("ScreenGui")
        gui.Name = "FakeBan"
        gui.ResetOnSpawn = false
        gui.IgnoreGuiInset = true
        gui.DisplayOrder = 999999999
        gui.Parent = playerGui


        local overlay = Instance.new("Frame")
        overlay.Size = UDim2.new(1, 0, 1, 0)
        overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        overlay.BackgroundTransparency = 1
        overlay.BorderSizePixel = 0
        overlay.Parent = gui

   
        local img = Instance.new("ImageLabel")
        img.Size = UDim2.new(0, 320, 0, 220)
        img.Position = UDim2.new(0.5, -160, 0.5, -110)
        img.BackgroundTransparency = 1
        img.Image = "rbxassetid://135313756014096"
        img.ScaleType = Enum.ScaleType.Fit
        img.ImageTransparency = 1
        img.ZIndex = 2
        img.Parent = gui


        local hum = getHuman()
        local savedWalk = hum and hum.WalkSpeed or 16
        local savedJump = hum and hum.JumpPower or 50
        if hum then hum.WalkSpeed = 0; hum.JumpPower = 0 end
        local inputConn = game:GetService("UserInputService").InputBegan:Connect(function(input, gpe)
            if not gpe then return end
        end)
        local camConn = RunService.RenderStepped:Connect(function() end)

        -- Cache Rayfield
        pcall(function()
            local g = gethui and gethui() or game:GetService("CoreGui")
            for _, v in ipairs(g:GetChildren()) do if v.Name == "Rayfield" then v.Enabled = false end end
            for _, v in ipairs(game:GetService("CoreGui"):GetChildren()) do if v.Name == "Rayfield" then v.Enabled = false end end
            for _, v in ipairs(player.PlayerGui:GetChildren()) do if v.Name == "Rayfield" then v.Enabled = false end end
        end)


        TweenService:Create(overlay, TweenInfo.new(0.5, Enum.EasingStyle.Quart), {BackgroundTransparency = 0.5}):Play()
        task.wait(0.2)
        TweenService:Create(img, TweenInfo.new(0.5, Enum.EasingStyle.Quart), {ImageTransparency = 0}):Play()


        local leaveBtn = Instance.new("TextButton")
        leaveBtn.Size = UDim2.new(1, -20, 0, 44)
        leaveBtn.Position = UDim2.new(0, 10, 1, -55)
        leaveBtn.BackgroundTransparency = 1
        leaveBtn.Text = ""
        leaveBtn.ZIndex = 10
        leaveBtn.Parent = img


        leaveBtn.MouseButton1Click:Connect(function()
            if hum then hum.WalkSpeed = savedWalk; hum.JumpPower = savedJump end
            camConn:Disconnect()
            inputConn:Disconnect()
            pcall(function()
                local g = gethui and gethui() or game:GetService("CoreGui")
                for _, v in ipairs(g:GetChildren()) do if v.Name == "Rayfield" then v.Enabled = true end end
                for _, v in ipairs(game:GetService("CoreGui"):GetChildren()) do if v.Name == "Rayfield" then v.Enabled = true end end
                for _, v in ipairs(player.PlayerGui:GetChildren()) do if v.Name == "Rayfield" then v.Enabled = true end end
            end)
            TweenService:Create(img, TweenInfo.new(0.3), {ImageTransparency = 1}):Play()
            TweenService:Create(overlay, TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()
            TweenService:Create(blur, TweenInfo.new(0.4), {Size = 0}):Play()
            task.wait(0.45)
            gui:Destroy()
            blur:Destroy()
        end)
        end)
    end
})
print("✅ Admin Panel 2026 v4 loaded!")