getgenv().SecureMode = true 
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))() 
local Window = Rayfield:CreateWindow({ 
    Name = "🔥 VTX Universal OP", 
    LoadingTitle = "Loading...", 
    LoadingSubtitle = "by VTX Clan", 
    ConfigurationSaving = { Enabled = false, FileName = "VTX HUB" }, 
    KeySystem = true, 
    KeySettings = { 
        Title = "Key | VTX Hub", 
        Subtitle = "Key System", 
        Note = "Key In Discord Server Discord Invite: Dfzmy6gac8 ", 
        FileName = "VgTTu7qK", 
        SaveKey = false, 
        GrabKeyFromSite = true, 
        Key = {"VgTTu7qK"} 
    } 
})

-- Variables
local flying = false
local noclip = false
local espEnabled = false
local flySpeed = 50
local selectedPlayer = nil
local spinning = false
local antiAfkEnabled = false
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local runService = game:GetService("RunService")
local camera = workspace.CurrentCamera

-- Aimbot Variables (UPGRADED)
local aimbotEnabled = false
local teamCheck = false
local aimPart = "HumanoidRootPart"
local fovRadius = 150
local showFov = false
local wallCheck = true -- Checks if player is behind a wall
local prediction = 0.165 -- Predicts movement velocity

-- FOV Circle Drawing
local fovCircle = Drawing.new("Circle")
fovCircle.Thickness = 2
fovCircle.NumSides = 60
fovCircle.Radius = fovRadius
fovCircle.Filled = false
fovCircle.Transparency = 1
fovCircle.Color = Color3.fromRGB(255, 255, 255)
fovCircle.Visible = false

-- Function to check if target is behind cover
local function isVisible(targetPart)
    local ray = Ray.new(camera.CFrame.Position, (targetPart.Position - camera.CFrame.Position).Unit * 500)
    local hit = workspace:FindPartOnRayWithIgnoreList(ray, {player.Character, camera})
    return hit and hit:IsDescendantOf(targetPart.Parent)
end

-- Function to get closest player to mouse
local function getClosestPlayer()
    local target = nil
    local shortestDistance = fovRadius
    for _, v in pairs(game.Players:GetPlayers()) do
        if v ~= player and v.Character and v.Character:FindFirstChild(aimPart) then
            if teamCheck and v.Team == player.Team then continue end
            if wallCheck and not isVisible(v.Character[aimPart]) then continue end

            local pos, onScreen = camera:WorldToViewportPoint(v.Character[aimPart].Position)
            if onScreen then
                local distance = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).Magnitude
                if distance < shortestDistance then
                    target = v
                    shortestDistance = distance
                end
            end
        end
    end
    return target
end

-- Aimbot Loop (UPGRADED WITH PREDICTION)
runService.RenderStepped:Connect(function()
    fovCircle.Position = Vector2.new(mouse.X, mouse.Y + 36)
    fovCircle.Visible = showFov
    fovCircle.Radius = fovRadius
    
    if aimbotEnabled then
        local target = getClosestPlayer()
        if target and target.Character and target.Character:FindFirstChild(aimPart) then
            local targetPos = target.Character[aimPart].Position
            
            -- OP Feature: Velocity Prediction
            if target.Character:FindFirstChild("HumanoidRootPart") then
                targetPos = targetPos + (target.Character.HumanoidRootPart.Velocity * prediction)
            end
            
            camera.CFrame = CFrame.new(camera.CFrame.Position, targetPos)
        end
    end
end)

-- Function to get player names
local function getPlayers()
    local tbl = {}
    for _, v in pairs(game.Players:GetPlayers()) do
        if v.Name ~= player.Name then table.insert(tbl, v.Name) end
    end
    return tbl
end

-- ===== HOME TAB =====
local MainTab = Window:CreateTab("🏠 Home", nil)
MainTab:CreateButton({
    Name = "Join Discord Server",
    Callback = function()
        setclipboard("https://discord.gg/Dfzmy6gac8")
        Rayfield:Notify({Title = "VTX Hub", Content = "Discord link copied!", Duration = 5})
    end,
})

MainTab:CreateButton({
    Name = "Infinite Jump Toggle",
    Callback = function()
        _G.infinjump = not _G.infinjump
        if _G.infinJumpStarted == nil then
            _G.infinJumpStarted = true
            mouse.KeyDown:connect(function(k)
                if _G.infinjump and k:byte() == 32 then
                    local hum = player.Character:FindFirstChildOfClass('Humanoid')
                    if hum then hum:ChangeState('Jumping') wait() hum:ChangeState('Seated') end
                end
            end)
        end
    end,
})

MainTab:CreateSlider({
    Name = "WalkSpeed",
    Range = {16, 350},
    Increment = 1,
    CurrentValue = 16,
    Callback = function(v)
        if player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = v
        end
    end,
})

-- ===== TELEPORT TAB =====
local TPTab = Window:CreateTab("📍 Teleport", nil)
local PlayerDropdown = TPTab:CreateDropdown({
    Name = "Select Player",
    Options = getPlayers(),
    CurrentOption = {""},
    MultipleOptions = false,
    Callback = function(Option)
        selectedPlayer = Option[1]
    end,
})

TPTab:CreateButton({ Name = "Refresh Player List", Callback = function() PlayerDropdown:Refresh(getPlayers()) end })

TPTab:CreateButton({
    Name = "Teleport to Player",
    Callback = function()
        if selectedPlayer and game.Players:FindFirstChild(selectedPlayer) then
            local target = game.Players[selectedPlayer].Character
            if target and target:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("HumanoidRootPart") then
                player.Character.HumanoidRootPart.CFrame = target.HumanoidRootPart.CFrame
            end
        else
            Rayfield:Notify({Title = "Error", Content = "Select a player first!", Duration = 3})
        end
    end,
})

-- ===== FLY TAB =====
local FlyTab = Window:CreateTab("✈️ Flight", nil)
FlyTab:CreateToggle({
    Name = "Fly Enabled",
    CurrentValue = false,
    Callback = function(Value)
        flying = Value
        local hrp = player.Character:WaitForChild("HumanoidRootPart")
        if flying then
            local bv = Instance.new("BodyVelocity", hrp)
            bv.Name = "VTXFlyVel"
            bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
            local bg = Instance.new("BodyGyro", hrp)
            bg.Name = "VTXFlyGyro"
            bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
            task.spawn(function()
                while flying do
                    bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * flySpeed
                    bg.CFrame = workspace.CurrentCamera.CFrame
                    task.wait()
                end
                bv:Destroy()
                bg:Destroy()
            end)
        end
    end,
})

FlyTab:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Callback = function(v)
        noclip = v
        task.spawn(function()
            while noclip do
                if player.Character then
                    for _, part in pairs(player.Character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
                runService.Stepped:Wait()
            end
        end)
    end,
})

FlyTab:CreateSlider({
    Name = "Fly Speed",
    Range = {10, 500},
    Increment = 1,
    CurrentValue = 50,
    Callback = function(v)
        flySpeed = v
    end
})

-- ===== COMBAT & FUN TAB =====
local FunTab = Window:CreateTab("🌀 Combat & Fun", nil)
FunTab:CreateSection("Aimbot Settings")

FunTab:CreateToggle({
    Name = "Aimbot (Snap)",
    CurrentValue = false,
    Callback = function(v) aimbotEnabled = v end,
})

FunTab:CreateToggle({
    Name = "Wall Check",
    CurrentValue = true,
    Callback = function(v) wallCheck = v end,
})

FunTab:CreateToggle({
    Name = "Team Check",
    CurrentValue = false,
    Callback = function(v) teamCheck = v end,
})

FunTab:CreateToggle({
    Name = "Show FOV Circle",
    CurrentValue = false,
    Callback = function(v) showFov = v end,
})

FunTab:CreateSlider({
    Name = "FOV Radius",
    Range = {10, 800},
    Increment = 1,
    CurrentValue = 150,
    Callback = function(v) fovRadius = v end
})

FunTab:CreateDropdown({
    Name = "Aim Part",
    Options = {"Head", "HumanoidRootPart", "Torso"},
    CurrentOption = {"HumanoidRootPart"},
    MultipleOptions = false,
    Callback = function(Option)
        aimPart = Option[1]
    end,
})

FunTab:CreateSection("Fun Extras")

FunTab:CreateButton({
    Name = "Invincibility (God Mode)",
    Callback = function()
        local cam = workspace.CurrentCamera
        local char = player.Character
        char.Archivable = true
        local newchar = char:Clone()
        newchar.Parent = workspace
        player.Character = newchar
        cam.CameraSubject = newchar.Humanoid
        char:Destroy()
        Rayfield:Notify({Title = "God Mode", Content = "You are now invincible!", Duration = 5})
    end,
})

FunTab:CreateToggle({
    Name = "Spin Bot",
    CurrentValue = false,
    Callback = function(v)
        spinning = v
        task.spawn(function()
            while spinning do
                if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    player.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(50), 0)
                end
                task.wait()
            end
        end)
    end,
})

FunTab:CreateButton({
    Name = "Invisible (Local)",
    Callback = function()
        local char = player.Character
        if char then
            for _, v in pairs(char:GetDescendants()) do
                if v:IsA("BasePart") or v:IsA("Decal") then
                    v.Transparency = 1
                end
            end
            Rayfield:Notify({Title = "Invisible", Content = "You are now invisible locally!", Duration = 3})
        end
    end,
})

-- ===== VISUALS TAB =====
local VisualsTab = Window:CreateTab("👁️ Visuals", nil)
VisualsTab:CreateToggle({
    Name = "ESP / Wallhacks",
    CurrentValue = false,
    Callback = function(v)
        espEnabled = v
        task.spawn(function()
            while espEnabled do
                for _, p in pairs(game.Players:GetPlayers()) do
                    if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                        if not p.Character:FindFirstChild("VTX_ESP") then
                            local highlight = Instance.new("Highlight")
                            highlight.Name = "VTX_ESP"
                            highlight.Parent = p.Character
                            highlight.FillTransparency = 0.5
                            highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
                        end
                    end
                end
                task.wait(1)
            end
            for _, p in pairs(game.Players:GetPlayers()) do
                if p.Character and p.Character:FindFirstChild("VTX_ESP") then
                    p.Character.VTX_ESP:Destroy()
                end
            end
        end)
    end,
})

-- ===== LOGS TAB =====
local LogTab = Window:CreateTab("📜 Logs", nil)
local LogLabel = LogTab:CreateLabel("Waiting for messages...")
game.Players.PlayerChatted:Connect(function(type, sender, message)
    LogLabel:Set("Last Chat: [" .. sender.Name .. "]: " .. message)
end)

-- ===== MISC TAB =====
local MiscTab = Window:CreateTab("🛠️ Misc", nil)
MiscTab:CreateToggle({
    Name = "Anti-AFK",
    CurrentValue = false,
    Callback = function(v)
        antiAfkEnabled = v
    end,
})

player.Idled:Connect(function()
    if antiAfkEnabled then
        local virtualUser = game:GetService("VirtualUser")
        virtualUser:CaptureController()
        virtualUser:ClickButton2(Vector2.new())
    end
end)

MiscTab:CreateButton({
    Name = "Execute Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end,
})
