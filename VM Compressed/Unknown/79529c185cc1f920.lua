if _G.NamelessHubLoaded then return end
_G.NamelessHubLoaded = true

--//--------------------------------------------------------------------------------------------------
--// 1. UI Library Loader
--//--------------------------------------------------------------------------------------------------
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()
local Sense

--//--------------------------------------------------------------------------------------------------
--// 2. Services & Core Variables
--//--------------------------------------------------------------------------------------------------
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local VirtualUser = game:GetService("VirtualUser")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

--//================================================================================================--
--// [KEY SYSTEM IMPLEMENTATION]
--//================================================================================================--
local SCRIPT_KEY = "1bd8627c574161f8ae3d1668e80a99151ffbf96c32c8f52139977559c6b97bd8" -- hey you found it :)
local userInputKey = ""

local isHubLoaded = false

local function LoadMainHub()
    if isHubLoaded then return end
    isHubLoaded = true

    Sense = loadstring(game:HttpGet('https://sirius.menu/sense'))()

    --//--------------------------------------------------------------------------------------------------
    --// 3. Main GUI Creation
    --//--------------------------------------------------------------------------------------------------
    local Window = OrionLib:MakeWindow({
        Name = "Nameless Hub v1",
        HidePremium = false,
        SaveConfig = true,
        ConfigFolder = "NamelessHub",
        IntroText = "Welcome, " .. LocalPlayer.Name
    })

    --//--------------------------------------------------------------------------------------------------
    --// 4. Tab Creation
    --//--------------------------------------------------------------------------------------------------
    local localPlayerTab = Window:MakeTab({ Name = "Local Player", Icon = "rbxassetid://4483362458", PremiumOnly = false })
    local combatTab = Window:MakeTab({ Name = "Combat", Icon = "rbxassetid://4483362458", PremiumOnly = false })
    local teleportTab = Window:MakeTab({ Name = "Teleport", Icon = "rbxassetid://4483362458", PremiumOnly = false })
    local espTab = Window:MakeTab({ Name = "ESP", Icon = "rbxassetid://4483362458", PremiumOnly = false })
    local utilityTab = Window:MakeTab({ Name = "Utility", Icon = "rbxassetid://4483362458", PremiumOnly = false })

    --//--------------------------------------------------------------------------------------------------
    --// 5. Populating Features into Tabs
    --//--------------------------------------------------------------------------------------------------

    --=============================[ LOCAL PLAYER TAB ]=============================--
    local activeConnections = {}
    local activeObjects = {}

    localPlayerTab:AddLabel("Movement Settings")
    localPlayerTab:AddSlider({
        Name = "Walk Speed", Min = 16, Max = 200, Default = 16, Suffix = "studs/s",
        Callback = function(value) if LocalPlayer.Character and LocalPlayer.Character.Humanoid then LocalPlayer.Character.Humanoid.WalkSpeed = value end end
    })
    localPlayerTab:AddSlider({
        Name = "Jump Height", Min = 7.2, Max = 200, Default = 7.2, Suffix = "height",
        Callback = function(value) if LocalPlayer.Character and LocalPlayer.Character.Humanoid then LocalPlayer.Character.Humanoid.JumpHeight = value end end
    })
    localPlayerTab:AddToggle({
        Name = "Infinite Jump", Default = false,
        Callback = function(state)
            if activeConnections["InfiniteJump"] then activeConnections["InfiniteJump"]:Disconnect(); activeConnections["InfiniteJump"] = nil end
            if state then
                activeConnections["InfiniteJump"] = UserInputService.JumpRequest:Connect(function() if LocalPlayer.Character and LocalPlayer.Character.Humanoid then LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end end)
            end
        end
    })
    localPlayerTab:AddLabel("Fly Settings")
    local flySpeed = 50
    local isFlying = false
    localPlayerTab:AddToggle({
        Name = "Fly", Default = false,
        Callback = function(state)
            isFlying = state
            local Humanoid, RootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid"), LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if not (Humanoid and RootPart) then return end
            if isFlying then
                activeObjects.BodyGyro = Instance.new("BodyGyro", RootPart); activeObjects.BodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge); activeObjects.BodyGyro.CFrame = RootPart.CFrame
                activeObjects.BodyVelocity = Instance.new("BodyVelocity", RootPart); activeObjects.BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge); activeObjects.BodyVelocity.Velocity = Vector3.new(0, 0, 0)
                activeConnections.FlyLoop = RunService.Heartbeat:Connect(function()
                    if not activeObjects.BodyGyro or not activeObjects.BodyVelocity then return end
                    local direction = Vector3.new()
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then direction = direction + Camera.CFrame.LookVector end; if UserInputService:IsKeyDown(Enum.KeyCode.S) then direction = direction - Camera.CFrame.LookVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then direction = direction + Camera.CFrame.RightVector end; if UserInputService:IsKeyDown(Enum.KeyCode.A) then direction = direction - Camera.CFrame.RightVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.E) then direction = direction + Vector3.new(0, 1, 0) end; if UserInputService:IsKeyDown(Enum.KeyCode.Q) then direction = direction - Vector3.new(0, -1, 0) end
                    activeObjects.BodyGyro.CFrame = Camera.CFrame
                    activeObjects.BodyVelocity.Velocity = (direction.Magnitude > 0) and (direction.Unit * flySpeed) or Vector3.new(0, 0, 0)
                end)
            else
                if activeObjects.BodyGyro then activeObjects.BodyGyro:Destroy() end; if activeObjects.BodyVelocity then activeObjects.BodyVelocity:Destroy() end
                if activeConnections.FlyLoop then activeConnections.FlyLoop:Disconnect() end
                activeObjects.BodyGyro, activeObjects.BodyVelocity, activeConnections.FlyLoop = nil, nil, nil
            end
        end
    })
    local flySpeedLabel = localPlayerTab:AddLabel("Current Fly Speed: " .. flySpeed)
    localPlayerTab:AddButton({ Name = "Decrease Speed (-10)", Callback = function() flySpeed = math.max(10, flySpeed - 10); flySpeedLabel:Set("Current Fly Speed: " .. flySpeed) end })
    localPlayerTab:AddButton({ Name = "Increase Speed (+10)", Callback = function() flySpeed = math.min(1000, flySpeed + 10); flySpeedLabel:Set("Current Fly Speed: " .. flySpeed) end })

    localPlayerTab:AddLabel("Misc Settings")
    local spinSpeed = 5
    localPlayerTab:AddSlider({
        Name = "Spin Speed", Min = 1, Max = 50, Default = 5,
        Callback = function(value) spinSpeed = value end
    })
    localPlayerTab:AddToggle({
        Name = "Spin", Default = false,
        Callback = function(state)
            if state then
                activeConnections["SpinLoop"] = RunService.Heartbeat:Connect(function()
                    local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(spinSpeed), 0) end
                end)
            else
                if activeConnections["SpinLoop"] then activeConnections["SpinLoop"]:Disconnect(); activeConnections["SpinLoop"] = nil end
            end
        end
    })

    localPlayerTab:AddLabel("Script Settings")
    localPlayerTab:AddButton({
        Name = "Self Destruct Script",
        Callback = function()
            if isSenseLoaded then
                Sense.Unload()
                isSenseLoaded = false
            end
            
            for key, connection in pairs(activeConnections) do if connection then connection:Disconnect() end end
            for key, object in pairs(activeObjects) do if object and typeof(object) == "Instance" then object:Destroy() end end
            
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                local humanoid = LocalPlayer.Character.Humanoid
                humanoid.WalkSpeed = 16
                humanoid.JumpHeight = 7.2
                humanoid:ChangeState(Enum.HumanoidStateType.Running)
            end
            
            activeConnections, activeObjects = {}, {}
            OrionLib:Destroy()
        end
    })

    --==============================[ COMBAT TAB ]===============================--
    local isAimbotEnabled = false
    local isAiming = false
    local fovRadius = 100
    local aimbotTargetPart = "Head"
    local fovCircleGui = nil
    local wallCheckEnabled = false
    local teamCheckEnabled = true
    local aimbotSmoothing = 5
    local aimbotMaxMove = 100

    local function createFovCircle()
        local gui = Instance.new("ScreenGui")
        gui.Name = "FOVCircleGUI"; gui.ResetOnSpawn = false; gui.IgnoreGuiInset = true
        local circle = Instance.new("Frame")
        circle.Name = "Circle"; circle.AnchorPoint = Vector2.new(0.5, 0.5); circle.Size = UDim2.fromOffset(fovRadius * 2, fovRadius * 2); circle.BackgroundTransparency = 1; circle.Parent = gui
        local stroke = Instance.new("UIStroke")
        stroke.Thickness = 1; stroke.Color = Color3.fromRGB(255, 255, 255); stroke.Parent = circle
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(1, 0); corner.Parent = circle
        gui.Enabled = false; gui.Parent = game.CoreGui or LocalPlayer.PlayerGui
        return gui
    end
    fovCircleGui = createFovCircle()
    table.insert(activeObjects, fovCircleGui)

    combatTab:AddLabel("Aimbot Settings")
    combatTab:AddToggle({
        Name = "Enable Aimbot", Default = false,
        Callback = function(state)
            isAimbotEnabled = state
            if not state and fovCircleGui.Enabled then fovCircleGui.Enabled = false end
            if state then
                if not activeConnections["AimbotInputBegan"] then
                    activeConnections["AimbotInputBegan"] = UserInputService.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton2 then isAiming = true end end)
                end
                if not activeConnections["AimbotInputEnded"] then
                    activeConnections["AimbotInputEnded"] = UserInputService.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton2 then isAiming = false end end)
                end
            else
                if activeConnections["AimbotInputBegan"] then activeConnections["AimbotInputBegan"]:Disconnect(); activeConnections["AimbotInputBegan"] = nil end
                if activeConnections["AimbotInputEnded"] then activeConnections["AimbotInputEnded"]:Disconnect(); activeConnections["AimbotInputEnded"] = nil end
                isAiming = false
            end
        end
    })
    combatTab:AddDropdown({
        Name = "Aimbot Target", Options = {"Head", "UpperTorso", "HumanoidRootPart"}, Default = "Head",
        Callback = function(partName) aimbotTargetPart = partName end
    })
    combatTab:AddSlider({
        Name = "Aimbot Smoothing", Min = 1, Max = 50, Default = 5,
        Callback = function(value) aimbotSmoothing = value end
    })
    combatTab:AddSlider({
        Name = "Aimbot Aggression", Min = 10, Max = 300, Default = 100,
        Info = "Lower values reduce mouse flicking but might feel slower.",
        Callback = function(value) aimbotMaxMove = value end
    })
    combatTab:AddToggle({ Name = "Wall Check", Default = false, Callback = function(state) wallCheckEnabled = state end })
    combatTab:AddToggle({ Name = "Team Check", Default = true, Callback = function(state) teamCheckEnabled = state end })
    
    combatTab:AddLabel("FOV Circle Settings")
    combatTab:AddToggle({ Name = "Show FOV Circle", Default = false, Callback = function(state) if fovCircleGui then fovCircleGui.Enabled = state end end })
    combatTab:AddSlider({
        Name = "FOV Radius", Min = 10, Max = 500, Default = 100,
        Callback = function(value) fovRadius = value; if fovCircleGui then fovCircleGui.Circle.Size = UDim2.fromOffset(value * 2, value * 2) end end
    })
    combatTab:AddColorpicker({
        Name = "FOV Color", Default = Color3.fromRGB(255, 255, 255),
        Callback = function(color) if fovCircleGui and fovCircleGui.Circle and fovCircleGui.Circle:FindFirstChild("UIStroke") then fovCircleGui.Circle.UIStroke.Color = color end end
    })

    activeConnections["AimbotLoop"] = RunService.RenderStepped:Connect(function()
        if not isAimbotEnabled then return end
        local mousePos = UserInputService:GetMouseLocation()
        if fovCircleGui.Enabled then fovCircleGui.Circle.Position = UDim2.fromOffset(mousePos.X, mousePos.Y) end
        if not isAiming then return end

        local closestTarget, smallestDist = nil, fovRadius
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
                if teamCheckEnabled and player.Team and LocalPlayer.Team and player.Team == LocalPlayer.Team then continue end
                local targetPart = player.Character:FindFirstChild(aimbotTargetPart)
                if targetPart then
                    local isVisible = false
                    if not wallCheckEnabled then
                        isVisible = true
                    else
                        local rayOrigin = Camera.CFrame.Position
                        local rayParams = RaycastParams.new()
                        rayParams.FilterType = Enum.RaycastFilterType.Blacklist
                        rayParams.FilterDescendantsInstances = {LocalPlayer.Character}
                        local result = workspace:Raycast(rayOrigin, (targetPart.Position - rayOrigin).Unit * 1000, rayParams)
                        if not result or (result and result.Instance:IsDescendantOf(player.Character)) then isVisible = true end
                    end
                    if isVisible then
                        local screenPos, onScreen = Camera:WorldToViewportPoint(targetPart.Position)
                        if onScreen then
                            local distance = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
                            if distance < smallestDist then smallestDist = distance; closestTarget = targetPart end
                        end
                    end
                end
            end
        end
        if closestTarget then
            local targetScreenPos, onScreen = Camera:WorldToViewportPoint(closestTarget.Position)
            if not onScreen then return end
            local moveVector = Vector2.new(targetScreenPos.X - mousePos.X, targetScreenPos.Y - mousePos.Y)
            if moveVector.Magnitude > aimbotMaxMove then moveVector = moveVector.Unit * aimbotMaxMove end
            pcall(function() mousemoverel(moveVector.X / aimbotSmoothing, moveVector.Y / aimbotSmoothing) end)
        end
    end)

    --==============================[ TELEPORT TAB ]===============================--
    teleportTab:AddLabel("Player Teleport")
    local selectedFormattedName, playerDropdown, playerMap
    local function getPlayerNamesAndMap()
        local displayNames, newPlayerMap = {}, {}
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                local formattedName = string.format("%s (%s)", player.DisplayName, player.Name)
                table.insert(displayNames, formattedName); newPlayerMap[formattedName] = player.Name
            end
        end
        if #displayNames == 0 then table.insert(displayNames, "No players found"); newPlayerMap["No players found"] = nil else table.sort(displayNames) end
        return displayNames, newPlayerMap
    end
    local function createPlayerDropdown()
        local displayNames, newPlayerMap = getPlayerNamesAndMap()
        playerMap = newPlayerMap; selectedFormattedName = displayNames[1]
        playerDropdown = teleportTab:AddDropdown({ Name = "Select Player", Options = displayNames, Default = displayNames[1], Callback = function(name) selectedFormattedName = name end })
    end
    createPlayerDropdown()
    teleportTab:AddButton({
        Name = "Teleport to Selected Player",
        Callback = function()
            local realUsername = playerMap[selectedFormattedName]
            if not realUsername then OrionLib:MakeNotification({ Name = "Teleport", Content = "No valid player selected.", Time = 4 }); return end
            local target = Players:FindFirstChild(realUsername)
            local localRoot = LocalPlayer.Character and LocalPlayer.Character.HumanoidRootPart
            local targetRoot = target and target.Character and target.Character.HumanoidRootPart
            if localRoot and targetRoot then localRoot.CFrame = targetRoot.CFrame else OrionLib:MakeNotification({ Name = "Teleport", Content = "Could not find target character.", Time = 4 }) end
        end
    })
    teleportTab:AddButton({
        Name = "Teleport to Random Player",
        Callback = function()
            local otherPlayers = {}
            for _, player in ipairs(Players:GetPlayers()) do if player ~= LocalPlayer then table.insert(otherPlayers, player) end end
            if #otherPlayers > 0 then
                local randomPlayer = otherPlayers[math.random(1, #otherPlayers)]
                local localRoot = LocalPlayer.Character and LocalPlayer.Character.HumanoidRootPart
                local targetRoot = randomPlayer.Character and randomPlayer.Character.HumanoidRootPart
                if localRoot and targetRoot then localRoot.CFrame = targetRoot.CFrame else OrionLib:MakeNotification({ Name = "Teleport", Content = "Could not find character of " .. randomPlayer.Name, Time = 4 }) end
            else OrionLib:MakeNotification({ Name = "Teleport", Content = "No other players in server.", Time = 4 }) end
        end
    })
    local targetUsername = ""
    teleportTab:AddTextbox({ Name = "Username", Text = "Enter full or partial name...", Callback = function(v) targetUsername = v end })
    local function findPartialPlayer(name)
        local lowerName = name:lower()
        for _, player in ipairs(Players:GetPlayers()) do if player.Name:lower():find(lowerName, 1, true) then return player end end
        return nil
    end
    teleportTab:AddButton({
        Name = "Teleport to Username",
        Callback = function()
            if targetUsername == "" then OrionLib:MakeNotification({ Name = "Teleport", Content = "Username field is empty.", Time = 4 }); return end
            local targetPlayer = findPartialPlayer(targetUsername)
            if targetPlayer then
                local localRoot = LocalPlayer.Character and LocalPlayer.Character.HumanoidRootPart
                local targetRoot = targetPlayer.Character and targetPlayer.Character.HumanoidRootPart
                if localRoot and targetRoot then localRoot.CFrame = targetRoot.CFrame else OrionLib:MakeNotification({ Name = "Teleport", Content = "Could not find character of " .. targetPlayer.Name, Time = 4 }) end
            else OrionLib:MakeNotification({ Name = "Teleport", Content = "Player '" .. targetUsername .. "' not found.", Time = 4 }) end
        end
    })
    teleportTab:AddLabel("Coordinate Teleport")
    local x_coord, y_coord, z_coord = 0, 0, 0
    teleportTab:AddTextbox({ Name = "X", Text = "0", Callback = function(v) x_coord = tonumber(v) or 0 end })
    teleportTab:AddTextbox({ Name = "Y", Text = "0", Callback = function(v) y_coord = tonumber(v) or 0 end })
    teleportTab:AddTextbox({ Name = "Z", Text = "0", Callback = function(v) z_coord = tonumber(v) or 0 end })
    teleportTab:AddButton({
        Name = "Teleport to Coordinates",
        Callback = function() local hrp = LocalPlayer.Character and LocalPlayer.Character.HumanoidRootPart; if hrp then hrp.CFrame = CFrame.new(x_coord, y_coord, z_coord) else OrionLib:MakeNotification({ Name = "Teleport", Content = "Could not find character.", Time = 4 }) end end
    })
    teleportTab:AddLabel("Keybind Teleport")
    teleportTab:AddToggle({
        Name = "Teleport to Cursor [T]", Default = false,
        Callback = function(state)
            if state then
                activeConnections["KeybindTp"] = UserInputService.InputBegan:Connect(function(input, gpe)
                    if gpe or input.KeyCode ~= Enum.KeyCode.T then return end
                    local hrp = LocalPlayer.Character and LocalPlayer.Character.HumanoidRootPart
                    if not hrp then return end
                    local mouseLocation = UserInputService:GetMouseLocation()
                    local ray = Camera:ViewportPointToRay(mouseLocation.X, mouseLocation.Y)
                    local params = RaycastParams.new(); params.FilterType = Enum.RaycastFilterType.Blacklist; params.FilterDescendantsInstances = {LocalPlayer.Character}
                    local result = workspace:Raycast(ray.Origin, ray.Direction * 1000, params)
                    if result then hrp.CFrame = CFrame.new(result.Position) else hrp.CFrame = CFrame.new(ray.Origin + ray.Direction * 1000) end
                end)
            else if activeConnections["KeybindTp"] then activeConnections["KeybindTp"]:Disconnect(); activeConnections["KeybindTp"] = nil end end
        end
    })

    --==============================[ UTILITY TAB ]===============================--
    utilityTab:AddLabel("General Utilities")
    utilityTab:AddToggle({
        Name = "Show Coordinates", Default = false,
        Callback = function(state)
            if state then
                local coordGui = Instance.new("ScreenGui"); coordGui.Name = "CoordGui"; coordGui.Parent = game.CoreGui or LocalPlayer.PlayerGui; coordGui.ResetOnSpawn = false; activeObjects["CoordGui"] = coordGui
                local textLabel = Instance.new("TextLabel"); textLabel.Parent = coordGui; textLabel.Size = UDim2.new(0, 260, 0, 25); textLabel.Position = UDim2.new(1, -270, 1, -35); textLabel.BackgroundColor3 = Color3.fromRGB(15, 15, 15); textLabel.BackgroundTransparency = 0.3; textLabel.TextColor3 = Color3.new(1, 1, 1); textLabel.Font = Enum.Font.SourceSans; textLabel.TextSize = 14; textLabel.TextXAlignment = Enum.TextXAlignment.Left; textLabel.Text = "  Coordinates"
                local corner = Instance.new("UICorner"); corner.CornerRadius = UDim.new(0, 5); corner.Parent = textLabel
                activeConnections["CoordLoop"] = RunService.RenderStepped:Connect(function() local pos = LocalPlayer.Character and LocalPlayer.Character.HumanoidRootPart and LocalPlayer.Character.HumanoidRootPart.Position; if pos then textLabel.Text = string.format("  X: %.1f | Y: %.1f | Z: %.1f", pos.X, pos.Y, pos.Z) end end)
            else if activeConnections["CoordLoop"] then activeConnections["CoordLoop"]:Disconnect(); activeConnections["CoordLoop"] = nil end; if activeObjects["CoordGui"] then activeObjects["CoordGui"]:Destroy(); activeObjects["CoordGui"] = nil end end
        end
    })
    utilityTab:AddToggle({
        Name = "Show FPS", Default = false,
        Callback = function(state)
            if state then
                local fpsGui = Instance.new("ScreenGui"); fpsGui.Name = "FpsGui"; fpsGui.Parent = game.CoreGui or LocalPlayer.PlayerGui; fpsGui.ResetOnSpawn = false; activeObjects["FpsGui"] = fpsGui
                local textLabel = Instance.new("TextLabel"); textLabel.Parent = fpsGui; textLabel.Size = UDim2.new(0, 100, 0, 25); textLabel.Position = UDim2.new(0, 10, 0, 10); textLabel.BackgroundColor3 = Color3.fromRGB(15, 15, 15); textLabel.BackgroundTransparency = 0.3; textLabel.TextColor3 = Color3.new(1, 1, 1); textLabel.Font = Enum.Font.SourceSans; textLabel.TextSize = 14; textLabel.Text = " FPS: "
                local corner = Instance.new("UICorner"); corner.CornerRadius = UDim.new(0, 5); corner.Parent = textLabel
                activeConnections["FpsLoop"] = RunService.RenderStepped:Connect(function(dt) textLabel.Text = string.format(" FPS: %.0f", 1/dt) end)
            else
                if activeConnections["FpsLoop"] then activeConnections["FpsLoop"]:Disconnect(); activeConnections["FpsLoop"] = nil end
                if activeObjects["FpsGui"] then activeObjects["FpsGui"]:Destroy(); activeObjects["FpsGui"] = nil end
            end
        end
    })
    utilityTab:AddToggle({
        Name = "Show Server Region", Default = false,
        Callback = function(state)
            if state then
                local regionGui = Instance.new("ScreenGui"); regionGui.Name = "RegionGui"; regionGui.Parent = game.CoreGui or LocalPlayer.PlayerGui; regionGui.ResetOnSpawn = false; activeObjects["RegionGui"] = regionGui
                local textLabel = Instance.new("TextLabel"); textLabel.Parent = regionGui; textLabel.Size = UDim2.new(0, 150, 0, 25); textLabel.Position = UDim2.new(0, 10, 0, 40); textLabel.BackgroundColor3 = Color3.fromRGB(15, 15, 15); textLabel.BackgroundTransparency = 0.3; textLabel.TextColor3 = Color3.new(1, 1, 1); textLabel.Font = Enum.Font.SourceSans; textLabel.TextSize = 14; textLabel.Text = " Region: Fetching..."
                local corner = Instance.new("UICorner"); corner.CornerRadius = UDim.new(0, 5); corner.Parent = textLabel
                local success, joinData = pcall(function() return LocalPlayer:GetJoinData() end)
                local region = "N/A"
                if success and joinData and joinData["roblox-assetgamepersistenttest:server_location"] then region = joinData["roblox-assetgamepersistenttest:server_location"] end
                textLabel.Text = string.format(" Region: %s", region)
            else
                if activeObjects["RegionGui"] then activeObjects["RegionGui"]:Destroy(); activeObjects["RegionGui"] = nil end
            end
        end
    })
    utilityTab:AddButton({ Name = "Execute Infinite Yield", Callback = function() loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))() end })
    utilityTab:AddButton({
        Name = "Server Hop",
        Callback = function()
            local servers, s, r = {}, pcall(function() return HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100")) end)
            if s and r.data then
                for _, server in ipairs(r.data) do if type(server) == "table" and server.id ~= game.JobId and server.playing < server.maxPlayers then table.insert(servers, server.id) end end
                if #servers > 0 then
                    OrionLib:MakeNotification({ Name = "Server Hop", Content = "Server found! Teleporting...", Time = 5 })
                    TeleportService:Teleport(game.PlaceId, LocalPlayer, nil, servers[math.random(1, #servers)])
                else OrionLib:MakeNotification({ Name = "Server Hop", Content = "No other servers found.", Time = 5 }) end
            else OrionLib:MakeNotification({ Name = "Server Hop", Content = "Failed to fetch server list.", Time = 5 }) end
        end
    })
    utilityTab:AddToggle({
        Name = "Anti-AFK", Default = false,
        Callback = function(state)
            if state then
                activeConnections["AntiAFKLoop"] = coroutine.create(function()
                    while activeConnections["AntiAFKLoop"] do
                        wait(120)
                        if activeConnections["AntiAFKLoop"] then
                            if LocalPlayer.Character and LocalPlayer.Character.Humanoid then VirtualUser:CaptureController(); VirtualUser:Button1Down(Vector2.new(0,0)); wait(0.1); VirtualUser:Button1Up(Vector2.new(0,0)) end
                            OrionLib:MakeNotification({ Name = "Anti-AFK", Content = "Idle check bypassed.", Time = 3})
                        end
                    end
                end)
                coroutine.resume(activeConnections["AntiAFKLoop"])
            else if activeConnections["AntiAFKLoop"] then activeConnections["AntiAFKLoop"] = nil end end
        end
    })

    --==============================[ ESP TAB ]===============================--
    local isSenseLoaded = false

    local function RefreshESP()
        if not isSenseLoaded then return end
        Sense.Unload()
        Sense.Load()
    end

    espTab:AddLabel("Master ESP Controls")

    espTab:AddToggle({
        Name = "[Enemy] Enabled",
        Default = false,
        Callback = function(state)
            Sense.teamSettings.enemy.enabled = state
            if state then
                if not isSenseLoaded then
                    Sense.Load()
                    isSenseLoaded = true
                end
            else
                if isSenseLoaded then
                    Sense.Unload()
                    isSenseLoaded = false
                end
            end
        end
    })

    espTab:AddLabel("Enemy ESP Settings")
    espTab:AddToggle({ Name = "[Enemy] Box", Default = true, Callback = function(state) Sense.teamSettings.enemy.box = state; RefreshESP() end })
    espTab:AddToggle({ Name = "[Enemy] Name", Default = true, Callback = function(state) Sense.teamSettings.enemy.name = state; RefreshESP() end })
    espTab:AddToggle({ Name = "[Enemy] Distance", Default = true, Callback = function(state) Sense.teamSettings.enemy.distance = state; RefreshESP() end })
    espTab:AddToggle({ Name = "[Enemy] Health Bar", Default = true, Callback = function(state) Sense.teamSettings.enemy.healthBar = state; RefreshESP() end })
    espTab:AddToggle({ Name = "[Enemy] Tracer", Default = false, Callback = function(state) Sense.teamSettings.enemy.tracer = state; RefreshESP() end })
    espTab:AddToggle({ Name = "[Enemy] Chams", Default = false, Callback = function(state) Sense.teamSettings.enemy.chams = state; RefreshESP() end })
    espTab:AddToggle({ Name = "[Enemy] Offscreen Arrow", Default = false, Callback = function(state) Sense.teamSettings.enemy.offScreenArrow = state; RefreshESP() end })
    espTab:AddColorpicker({ Name = "[Enemy] Box Color", Default = Color3.fromRGB(255, 20, 20), Callback = function(color) Sense.teamSettings.enemy.boxColor[1] = color; RefreshESP() end })

    espTab:AddLabel("Friendly ESP Settings")
    espTab:AddToggle({ Name = "[Friendly] Enabled", Default = false, Callback = function(state) Sense.teamSettings.friendly.enabled = state; RefreshESP() end })
    espTab:AddToggle({ Name = "[Friendly] Box", Default = false, Callback = function(state) Sense.teamSettings.friendly.box = state; RefreshESP() end })
    espTab:AddToggle({ Name = "[Friendly] Name", Default = false, Callback = function(state) Sense.teamSettings.friendly.name = state; RefreshESP() end })
    espTab:AddColorpicker({ Name = "[Friendly] Box Color", Default = Color3.fromRGB(20, 255, 20), Callback = function(color) Sense.teamSettings.friendly.boxColor[1] = color; RefreshESP() end })

    -- Sense.Load()
    -- isSenseLoaded = true
end

--//--------------------------------------------------------------------------------------------------
--// 6. Initialize Key System UI
--//--------------------------------------------------------------------------------------------------
local KeyWindow = OrionLib:MakeWindow({
    Name = "Nameless Hub - Authentication",
    HidePremium = true,
    SaveConfig = false,
    ConfigFolder = "NamelessHub_Key",
    IntroText = "Nameless Hub"
})

local KeyTab = KeyWindow:MakeTab({
    Name = "Key System",
    Icon = "rbxassetid://4483345998"
})

KeyTab:AddLabel("Please enter the key to load the script.")
KeyTab:AddTextbox({
    Name = "Script Key",
    Default = "",
    TextDisappear = true,
    Callback = function(value)
        userInputKey = value
    end
})

local enterButton
enterButton = KeyTab:AddButton({
    Name = "Enter Key",
    Callback = function()
        if userInputKey == SCRIPT_KEY then
            OrionLib:MakeNotification({
                Name = "Success!",
                Content = "Correct key. Loading Nameless Hub...",
                Image = "rbxassetid://4483345998",
                Time = 3
            })
            
            LoadMainHub()
            
            enterButton:Set("Name", "✔️ Key Accepted")
            enterButton:Set("Callback", function()
                OrionLib:MakeNotification({
                    Name = "Info",
                    Content = "Nameless Hub is already loaded.",
                    Image = "rbxassetid://4483345998",
                    Time = 3
                })
            end)
        else
            OrionLib:MakeNotification({
                Name = "Access Denied",
                Content = "The key you entered is incorrect.",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
    end
})

OrionLib:MakeNotification({
    Name = "Welcome!", Content = "Please enter the key to continue.",
    Image = "rbxassetid://4483345998", Time = 5
})
