-- LocalScript in StarterPlayerScripts
local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")
local StarterGui = game:GetService("StarterGui")
local Debris = game:GetService("Debris")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local PathfindingService = game:GetService("PathfindingService")
local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager") 
local Workspace = game:GetService("Workspace")
local Teams = game:GetService("Teams")
local MarketplaceService = game:GetService("MarketplaceService")
local TeleportService = game:GetService("TeleportService")
local Stats = game:GetService("Stats")
local LocalizationService = game:GetService("LocalizationService") 

local player = Players.LocalPlayer
local character = nil
local humanoidRootPart = nil
local humanoid = nil
local camera = workspace.CurrentCamera

-- Script version
local VERSION = "2.08"

-- Control Variables
local recordingTarget = nil 
local recordedChats = {} 
local isRecording = false
local recordingMode = "all"

-- DevTool Variables
local isESP = false
local isNoclip = false
local isFlying = false
local flySpeed = 20
local flyConnection = nil
local noclipConnection = nil

-- Aimbot Variables
local isAimbot = false
local aimbotMode = "all" 
local aimbotTarget = nil 
local aimbotHighlight = nil
local aimbotBlacklist = {} 
local isWallCheck = false 

-- Spy Variables
local isTeamNoti = false
local isDamageNoti = false
local lastHealth = 100 
local isDangerCheck = false

-- Cheat Check Variables
local checkTarget = nil
local checkConnection = nil

-- Settings Variables
local isDtScrollable = true 

-- GUI Variables
local guiMainFrame = nil 
local joinTime = tick() 
local function getExecutorName()
    if identifyexecutor then
        return identifyexecutor()
    elseif getexecutorname then
        return getexecutorname()
    end
    return "Unknown"
end

local serversGui = nil 
local hubsGui = nil 
local crosshairGui = nil 
local devToolsGUI = nil

-- TP Presets
local tpPresets = {
    ["crim"] = Vector3.new(-981.8, 94.1, 1948.4),
    ["police"] = Vector3.new(817.0, 100.0, 2233.8),
    ["gate"] = Vector3.new(504.6, 102.0, 2245.5)
}

-- Script Hubs List
local scriptHubs = {
    {
        name = "Nexx Hub",
        script = [[loadstring(game:HttpGet("https://gist.githubusercontent.com/bleuboy29/ef2d8a4974e7e9443d040aafd2f1333c/raw/13b77fe75086561c6d44e8f35cb49e22445b8206/gistfile1.txt"))()]]
    },
    {
        name = "Nerixus Hub",
        script = [[loadstring(game:HttpGet("https://api.junkie-development.de/api/v1/luascripts/public/9d1b3044186f6bb699947b63ba810731daf7592a1b28dc7418224ac8a504dd21/download"))()]]
    },
    {
        name = "TMUSH",
        script = [[ loadstring(game:HttpGet("https://raw.githubusercontent.com/UndetectedTrust/Bread/refs/heads/main/lua.txt"))() ]]
    },
}

-- Danger Words List
local dangerWords = {
    "hack", "hacking", "exploit", "exploiting", 
    "cheat", "cheating", "script", "scripting", 
    "scripter", "skid", "lua", "luau", 
    "code", "coder", "ban", "admin"
}

-- Command List
local commandSections = {
    ["DEVTOOLS"] = {
        {cmd = "/aimbot [mode] [val]"},
        {cmd = "/wcab [on/off]"},
        {cmd = "/crosshair [on/off]"},
        {cmd = "/addblab [name]"}, 
        {cmd = "/rmblab [name]"}, 
        {cmd = "/esp [on/off]"},
        {cmd = "/fly [speed]"},
        {cmd = "/noclip [on/off]"},
        {cmd = "/devtools"},
        {cmd = "/reset"},
    },
    ["SPY / MOD"] = {
        {cmd = "/dwords [on/off]"}, 
        {cmd = "/check [name]"},
        {cmd = "/damagenoti [on/off]"},
        {cmd = "/teamnoti [on/off]"},
        {cmd = "/teamcheck [name]"},
        {cmd = "/recordchat [mode]"},
        {cmd = "/copyrc"},
        {cmd = "/stoprc"},
        {cmd = "/printrc"}
    },
    ["CONFIG"] = {
        {cmd = "/tp [x y z / preset]"},
        {cmd = "/sendcoords"}, 
        {cmd = "/resize [height]"},
        {cmd = "/dtscroll [on/off]"},
    },
    ["UTILITY"] = {
        {cmd = "/profile"},
        {cmd = "/servers"},
        {cmd = "/hubs"},
        {cmd = "/info [user]"},
    }
}

local sectionOrder = {"DEVTOOLS", "SPY / MOD", "CONFIG", "UTILITY"}

-- Helper: Get Character Parts Safely
local function getHRP()
    return character and character:FindFirstChild("HumanoidRootPart")
end

local function getHumanoid()
    return character and character:FindFirstChild("Humanoid")
end

-- UI Helper
local function notify(title, text, duration)
    pcall(function()
        StarterGui:SetCore("SendNotification", {Title = title, Text = text, Duration = duration or 5})
    end)
end

-- Universal Draggable Function
local function makeDraggable(frame)
    local dragging, dragInput, dragStart, startPos
    local function update(input)
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true; dragStart = input.Position; startPos = frame.Position
            input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
        end
    end)
    frame.InputChanged:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end end)
    UserInputService.InputChanged:Connect(function(input) if input == dragInput and dragging then update(input) end end)
end

-- Teleport System
local function teleportTo(position)
    local hrp = getHRP()
    if hrp then 
        hrp.CFrame = CFrame.new(position + Vector3.new(0, 3, 0)) 
    end
end

-- Chat Functions
local function sendChatMessage(message)
    if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        pcall(function()
            TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXGeneral"):SendAsync(message)
        end)
    else
        notify("Message", message, 5)
    end
end

-- SERVER HOP FUNCTION
local function serverHop()
    notify("Danger", "Danger detected! Hopping...", 5)
    task.wait(1) 
    
    local success, err = pcall(function()
        local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
        for _, s in ipairs(servers.data) do
            if s.playing < s.maxPlayers and s.id ~= game.JobId then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, s.id, player)
                return
            end
        end
    end)
    
    if not success then TeleportService:Teleport(game.PlaceId, player) end
end

-- DANGER WORD CHECK
local function checkDangerWord(msg)
    if not isDangerCheck then return false end
    
    local cleanMsg = msg:lower()
    for _, word in ipairs(dangerWords) do
        if string.find(cleanMsg, word) then return true end
    end
    return false
end

-- Crosshair Logic
local function toggleCrosshair(state)
    if state then
        if not crosshairGui then
            local screen = Instance.new("ScreenGui", player.PlayerGui)
            screen.Name = "CustomCrosshair"
            screen.DisplayOrder = 10000
            screen.IgnoreGuiInset = true 
            
            local dot = Instance.new("Frame", screen)
            dot.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            dot.Size = UDim2.new(0, 6, 0, 6)
            dot.AnchorPoint = Vector2.new(0.5, 0.5) 
            dot.Position = UDim2.new(0.5, 0, 0.5, 0)
            dot.BorderSizePixel = 0
            Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)
            crosshairGui = screen
        end
        crosshairGui.Enabled = true
    else
        if crosshairGui then crosshairGui.Enabled = false end
    end
end

-- DevTools: ESP Logic
local function toggleESP()
    isESP = not isESP
    notify("ESP", "Toggled: " .. tostring(isESP), 3)
    
    if isESP then
        task.spawn(function()
            while isESP do
                local hasTeams = #Teams:GetTeams() > 0
                for _, p in ipairs(Players:GetPlayers()) do
                    if p ~= player and p.Character then
                        local h = p.Character:FindFirstChild("DramaESP")
                        if not h then
                            h = Instance.new("Highlight")
                            h.Name = "DramaESP"
                            h.OutlineColor = Color3.new(1,1,1)
                            h.Parent = p.Character
                        end
                        if hasTeams then
                            if p.TeamColor then h.FillColor = p.TeamColor.Color else h.FillColor = Color3.new(1,0,0) end
                        else
                            local r = Random.new(p.UserId)
                            h.FillColor = Color3.fromHSV(r:NextNumber(), 1, 1)
                        end
                    end
                end
                task.wait(5)
            end
            for _, p in ipairs(Players:GetPlayers()) do
                if p.Character and p.Character:FindFirstChild("DramaESP") then p.Character.DramaESP:Destroy() end
            end
        end)
    end
end

-- DevTools: Fly Logic
local function enableFly()
    local hrp = getHRP()
    local hum = getHumanoid()
    if not hrp or not hum then return end
    
    hum.PlatformStand = true 
    hrp.Anchored = true
    
    if flyConnection then flyConnection:Disconnect() end
    flyConnection = RunService.RenderStepped:Connect(function(dt)
        if not isFlying then return end
        local currentHRP = getHRP()
        local currentHum = getHumanoid()
        if not currentHRP or not currentHum then return end
        
        local moveDir = currentHum.MoveDirection
        local camCFrame = camera.CFrame
        if moveDir.Magnitude > 0 then
            local objectSpaceVec = camCFrame:PointToObjectSpace(camCFrame.Position + moveDir)
            local newVel = Vector3.new(0,0,0)
            newVel = newVel - (camCFrame.LookVector * objectSpaceVec.Z) 
            newVel = newVel + (camCFrame.RightVector * objectSpaceVec.X) 
            currentHRP.CFrame = currentHRP.CFrame + (newVel * flySpeed * dt)
        end
        currentHRP.CFrame = CFrame.new(currentHRP.Position, currentHRP.Position + camCFrame.LookVector)
    end)
end

local function disableFly()
    if flyConnection then 
        flyConnection:Disconnect() 
        flyConnection = nil
    end
    local hum = getHumanoid()
    local hrp = getHRP()
    if hum then hum.PlatformStand = false end
    if hrp then hrp.Anchored = false end
end

local function toggleFly()
    isFlying = not isFlying
    if isFlying then
        notify("Fly", "Enabled. WASD, Q(Down), E(Up).", 3)
        enableFly()
    else
        notify("Fly", "Disabled.", 3)
        disableFly()
    end
end

-- DevTools: Noclip Logic
local function toggleNoclip()
    isNoclip = not isNoclip
    notify("Noclip", "Toggled: " .. tostring(isNoclip), 3)
    if isNoclip then
        if noclipConnection then noclipConnection:Disconnect() end
        noclipConnection = RunService.RenderStepped:Connect(function()
            if isNoclip and character then
                for _, part in ipairs(character:GetDescendants()) do
                    if part:IsA("BasePart") and part.CanCollide then part.CanCollide = false end
                end
            end
        end)
    else
        if noclipConnection then 
            noclipConnection:Disconnect() 
            noclipConnection = nil
        end
    end
end

-- DevTools: Aimbot Logic
local function enableAimbot()
    if isAimbot then return end
    isAimbot = true
    
    toggleCrosshair(true) 
    
    local notifyMsg = "Active. Mode: " .. aimbotMode
    if aimbotTarget then notifyMsg = notifyMsg .. " (" .. aimbotTarget .. ")" end
    notify("Aimbot", notifyMsg, 3)
    
    RunService:BindToRenderStep("AimbotStep", Enum.RenderPriority.Last.Value, function()
        if not isAimbot then return end
        
        local bestTarget = nil
        local bestDist = math.huge
        local myPos = camera.CFrame.Position
        local myTeam = player.Team
        
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= player and p.Character and p.Character:FindFirstChild("Head") then
                
                local isBlacklisted = false
                if aimbotBlacklist[p.DisplayName:lower()] then isBlacklisted = true end
                
                if not isBlacklisted then
                    local isValid = false
                    
                    if aimbotMode == "user" then
                        if p.DisplayName:lower():sub(1, #aimbotTarget) == aimbotTarget:lower() then isValid = true end
                    elseif aimbotMode == "team" then
                        if p.Team and p.Team.Name:lower():sub(1, #aimbotTarget) == aimbotTarget:lower() then isValid = true end
                    else
                        local isTeammate = (p.Team == myTeam) and (p.Team ~= nil)
                        if not isTeammate then isValid = true end
                    end
                    
                    if isValid and isWallCheck then
                        local origin = camera.CFrame.Position
                        local direction = (p.Character.Head.Position - origin)
                        local params = RaycastParams.new()
                        params.FilterDescendantsInstances = {character, p.Character} 
                        params.FilterType = Enum.RaycastFilterType.Exclude
                        local result = workspace:Raycast(origin, direction, params)
                        if result then isValid = false end 
                    end
                    
                    if isValid then
                        local dist = (p.Character.Head.Position - myPos).Magnitude
                        if dist < bestDist then
                            bestDist = dist
                            bestTarget = p
                        end
                    end
                end
            end
        end
        
        if bestTarget and bestTarget.Character and bestTarget.Character:FindFirstChild("Head") then
            local targetHead = bestTarget.Character.Head
            camera.CFrame = CFrame.new(camera.CFrame.Position, targetHead.Position)
            
            if not aimbotHighlight or aimbotHighlight.Parent ~= bestTarget.Character then
                if aimbotHighlight then aimbotHighlight:Destroy() end
                aimbotHighlight = Instance.new("SelectionBox")
                aimbotHighlight.Adornee = bestTarget.Character
                aimbotHighlight.Color3 = Color3.new(1,0,0)
                aimbotHighlight.LineThickness = 0.1
                aimbotHighlight.Parent = bestTarget.Character
            end
        else
            if aimbotHighlight then aimbotHighlight:Destroy(); aimbotHighlight = nil end
        end
    end)
end

local function disableAimbot()
    isAimbot = false
    aimbotMode = "all"
    aimbotTarget = nil
    
    toggleCrosshair(false)
    
    if aimbotHighlight then aimbotHighlight:Destroy(); aimbotHighlight = nil end
    RunService:UnbindFromRenderStep("AimbotStep")
    notify("Aimbot", "Disabled.", 3)
end

-- CHEAT CHECK LOGIC
local function stopChecking()
    if checkConnection then checkConnection:Disconnect(); checkConnection = nil end
    checkTarget = nil
    notify("Check", "Stopped checking.", 3)
end

local function startChecking(targetName)
    local target = nil
    for _, p in ipairs(Players:GetPlayers()) do
        if p.DisplayName:lower():sub(1, #targetName) == targetName:lower() or p.Name:lower():sub(1, #targetName) == targetName:lower() then
            target = p
            break
        end
    end

    if not target then notify("Error", "Player not found.", 3) return end
    if checkConnection then checkConnection:Disconnect() end
    checkTarget = target
    local lastCheckPos = nil
    local airTime = 0
    local lastAlert = 0
    
    notify("Check", "Monitoring " .. target.DisplayName, 5)
    
    checkConnection = RunService.Heartbeat:Connect(function(dt)
        if not checkTarget or not checkTarget.Character then return end
        local root = checkTarget.Character:FindFirstChild("HumanoidRootPart")
        if not root then lastCheckPos = nil; return end
        
        local currentPos = root.Position
        local now = tick()
        if now - lastAlert < 3 then lastCheckPos = currentPos; return end
        
        if root.RotVelocity.Magnitude > 100 then
            notify("DETECTED", target.DisplayName .. " is FLINGING!", 3)
            lastAlert = now
        end
        local isFalling = root.Velocity.Y < -5
        if root.Position.Y > 10 and not isFalling and math.abs(root.Velocity.Y) < 1 then
             airTime = airTime + dt
             if airTime > 4 then
                 notify("DETECTED", target.DisplayName .. " might be FLYING.", 3)
                 airTime = 0; lastAlert = now
             end
        else airTime = 0 end
        if lastCheckPos then
            local dist = (currentPos - lastCheckPos).Magnitude
            local horizSpeed = (Vector3.new(currentPos.X,0,currentPos.Z) - Vector3.new(lastCheckPos.X,0,lastCheckPos.Z)).Magnitude / dt
            if horizSpeed > 300 and dist > 40 then
                 notify("DETECTED", target.DisplayName .. " moved too fast (TP?).", 3)
                 lastAlert = now
            end
            local params = RaycastParams.new()
            params.FilterDescendantsInstances = {checkTarget.Character, character}
            params.FilterType = Enum.RaycastFilterType.Exclude
            local result = workspace:Raycast(lastCheckPos, currentPos - lastCheckPos, params)
            if result and result.Instance and result.Instance.CanCollide then
                 notify("DETECTED", target.DisplayName .. " NOCLIPPED!", 3)
                 lastAlert = now
            end
        end
        lastCheckPos = currentPos
    end)
end

-- Profile GUI
local function showProfile()
    local existing = player.PlayerGui:FindFirstChild("ProfileGUI")
    if existing then existing:Destroy() return end

    local screen = Instance.new("ScreenGui", player.PlayerGui)
    screen.Name = "ProfileGUI"; screen.DisplayOrder = 1000
    
    local frame = Instance.new("Frame", screen)
    frame.Size = UDim2.new(0, 300, 0, 160)
    frame.Position = UDim2.new(0.5, -150, 0.5, -80)
    frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    makeDraggable(frame); Instance.new("UICorner", frame)

    local closeBtn = Instance.new("TextButton", frame)
    closeBtn.Text = "X"; closeBtn.Size = UDim2.new(0, 25, 0, 25); closeBtn.Position = UDim2.new(1, -30, 0, 5)
    closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50); closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeBtn.Font = Enum.Font.GothamBold; Instance.new("UICorner", closeBtn)
    closeBtn.MouseButton1Click:Connect(function() screen:Destroy() end)

    local img = Instance.new("ImageLabel", frame)
    img.Size = UDim2.new(0, 100, 0, 100); img.Position = UDim2.new(0, 10, 0, 10)
    img.BackgroundTransparency = 1
    local content, isReady = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
    img.Image = content; Instance.new("UICorner", img).CornerRadius = UDim.new(1, 0)

    local infoLabel = Instance.new("TextLabel", frame)
    infoLabel.Size = UDim2.new(0, 160, 0, 140); infoLabel.Position = UDim2.new(0, 120, 0, 10)
    infoLabel.BackgroundTransparency = 1; infoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    infoLabel.TextXAlignment = Enum.TextXAlignment.Left; infoLabel.Font = Enum.Font.GothamBold
    infoLabel.TextSize = 14
    
    local joinDate = os.date("%x", os.time() - (player.AccountAge * 86400))
    
    task.spawn(function()
        while screen.Parent do
            local timeInServer = math.floor(tick() - joinTime)
            local mins = math.floor(timeInServer / 60)
            local secs = timeInServer % 60
            infoLabel.Text = string.format(
                "Display: %s\nUser: @%s\n\nJoin Date: %s\nTime in Server: %d:%02d",
                player.DisplayName, player.Name, joinDate, mins, secs
            )
            task.wait(1)
        end
    end)
    notify("Profile", "Card Opened.", 3)
end

local function fetchUserInfo(username)
    local target = nil
    for _, p in ipairs(Players:GetPlayers()) do
        if p.Name:lower() == username:lower() or p.DisplayName:lower() == username:lower() then
            target = p; break
        end
    end
    if target then
        print("--- USER INFO: " .. target.Name .. " ---")
        print("ID: " .. target.UserId)
        print("Account Age: " .. target.AccountAge .. " days")
        print("Team: " .. (target.Team and target.Team.Name or "None"))
        notify("Info", "Printed " .. target.Name .. " info to console (F9).", 3)
    else
        notify("Error", "User not found in server.", 3)
    end
end

-- DevTools: GUI
local function createDevTools()
    local existing = player.PlayerGui:FindFirstChild("DevToolsGUI")
    if existing then existing:Destroy() end 

    local screen = Instance.new("ScreenGui", player.PlayerGui)
    screen.Name = "DevToolsGUI"
    screen.ResetOnSpawn = false 
    screen.Enabled = false 
    screen.DisplayOrder = 1000 
    
    local frame = Instance.new("Frame", screen)
    frame.Position = UDim2.new(0.5, -140, 0.5, -150)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.ZIndex = 10 
    makeDraggable(frame) 
    Instance.new("UICorner", frame)

    if isDtScrollable then
        frame.Size = UDim2.new(0, 280, 0, 300) 
        frame.AutomaticSize = Enum.AutomaticSize.None
    else
        frame.Size = UDim2.new(0, 280, 0, 0)
        frame.AutomaticSize = Enum.AutomaticSize.Y 
    end

    local layout = Instance.new("UIListLayout", frame)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 5)
    
    local pad = Instance.new("UIPadding", frame)
    pad.PaddingTop = UDim.new(0, 10); pad.PaddingBottom = UDim.new(0, 10)
    pad.PaddingLeft = UDim.new(0, 10); pad.PaddingRight = UDim.new(0, 10)

    local header = Instance.new("Frame", frame)
    header.Size = UDim2.new(1, 0, 0, 30)
    header.BackgroundTransparency = 1
    header.LayoutOrder = 1

    local title = Instance.new("TextLabel", header)
    title.Text = "DevTools"; title.Size = UDim2.new(1, -30, 1, 0); title.Font = Enum.Font.GothamBold
    title.TextColor3 = Color3.fromRGB(255, 255, 255); title.BackgroundTransparency = 1
    title.TextXAlignment = Enum.TextXAlignment.Center; title.ZIndex = 20 

    local closeBtn = Instance.new("TextButton", header)
    closeBtn.Text = "X"; closeBtn.Size = UDim2.new(0, 25, 0, 25); closeBtn.Position = UDim2.new(1, -25, 0, 2)
    closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50); closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeBtn.Font = Enum.Font.GothamBold; closeBtn.ZIndex = 20
    Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 6)
    closeBtn.MouseButton1Click:Connect(function() screen.Enabled = false end)

    local scroll = Instance.new("ScrollingFrame", frame)
    scroll.Position = UDim2.new(0, 5, 0, 35)
    scroll.BackgroundTransparency = 1 
    scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    scroll.LayoutOrder = 2
    scroll.ZIndex = 20

    if isDtScrollable then
        scroll.Size = UDim2.new(1, -10, 1, -80) 
        scroll.ScrollingEnabled = true
        scroll.ScrollBarThickness = 6
    else
        scroll.Size = UDim2.new(1, -10, 0, 0)
        scroll.AutomaticSize = Enum.AutomaticSize.Y
        scroll.ScrollingEnabled = false
        scroll.ScrollBarThickness = 0
    end

    local content = Instance.new("TextLabel", scroll)
    content.Size = UDim2.new(1, 0, 0, 0) 
    content.AutomaticSize = Enum.AutomaticSize.Y
    content.BackgroundTransparency = 1; content.TextColor3 = Color3.fromRGB(200, 200, 200)
    content.TextYAlignment = Enum.TextYAlignment.Top; content.TextXAlignment = Enum.TextXAlignment.Left
    content.Text = "Loading..."; content.TextWrapped = true; content.RichText = true
    content.Font = Enum.Font.GothamBold; content.TextSize = 14; content.ZIndex = 30

    local consoleBtn = Instance.new("TextButton", frame)
    consoleBtn.Text = "OPEN CONSOLE (F9)"
    consoleBtn.Size = UDim2.new(1, -20, 0, 30)
    consoleBtn.Position = UDim2.new(0, 10, 1, -40)
    consoleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    consoleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    consoleBtn.Font = Enum.Font.GothamBold
    consoleBtn.TextSize = 12; consoleBtn.ZIndex = 20; consoleBtn.LayoutOrder = 3
    Instance.new("UICorner", consoleBtn).CornerRadius = UDim.new(0, 6)
    
    consoleBtn.MouseButton1Click:Connect(function()
        pcall(function()
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F9, false, game)
            task.wait()
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.F9, false, game)
        end)
    end)

    local gameName = "Unknown"
    task.spawn(function()
        pcall(function()
            local info = MarketplaceService:GetProductInfo(game.PlaceId)
            gameName = info.Name
        end)
    end)
    
    local region = "Unknown"
    pcall(function() region = LocalizationService:GetCountryRegionForPlayerAsync(player) end)

    local lastSlowUpdate = 0
    local cachedAssets = "Loading..."

    RunService.RenderStepped:Connect(function()
        if not screen.Enabled then return end
        
        local hrp = getHRP()
        local pos = hrp and hrp.Position or Vector3.new(0,0,0)
        local coords = string.format("X: %.1f, Y: %.1f, Z: %.1f", pos.X, pos.Y, pos.Z)
        local currentPlrs = #Players:GetPlayers()
        local maxPlrs = Players.MaxPlayers
        
        local fps = math.floor(workspace:GetRealPhysicsFPS())
        local fpsColor = "rgb(255,0,0)" 
        if fps >= 50 then fpsColor = "rgb(0,255,0)" elseif fps >= 30 then fpsColor = "rgb(255,255,0)" end
        
        local ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValueString():split(" ")[1])
        local pingColor = "rgb(255,0,0)"
        if ping < 100 then pingColor = "rgb(0,255,0)" elseif ping < 250 then pingColor = "rgb(255,255,0)" end
        
        if tick() - lastSlowUpdate > 2 then
            lastSlowUpdate = tick()
            local scripts, models = 0, 0
            local teamList = Teams:GetTeams()
            local teamText = ""
            if #teamList > 0 then
                for _, t in ipairs(teamList) do
                    local count = #t:GetPlayers()
                    teamText = teamText .. "• " .. t.Name .. ": " .. count .. "\n"
                end
            else teamText = "No Teams\n" end
            
            for _, v in ipairs(workspace:GetDescendants()) do
                if v:IsA("Model") then models = models + 1 end
                if v:IsA("LocalScript") or v:IsA("ModuleScript") then scripts = scripts + 1 end
            end
            
            cachedAssets = "Teams:\n" .. teamText .. "\n" .. string.format("Models: %d\nScripts: %d", models, scripts)
        end

        -- Get Executor Name
        local execName = getExecutorName()

        -- RichText Formatted String (Added Executor Line)
        local txt = string.format("Game: %s (ID: %d)\nServer ID: %s\n", gameName, game.PlaceId, game.JobId)
        txt = txt .. string.format("Executor: <font color='rgb(0,255,255)'>%s</font>\n\n", execName)
        txt = txt .. string.format("Players: %d / %d | Region: %s\n", currentPlrs, maxPlrs, region)
        txt = txt .. string.format("Pos: %s\n\n", coords)
        txt = txt .. string.format("FPS: <font color='%s'>%d</font> | Ping: <font color='%s'>%dms</font>\n\n", fpsColor, fps, pingColor, ping)
        txt = txt .. cachedAssets
        
        content.Text = txt
    end)
    
    devToolsGUI = screen
    return screen
end

local function openDevTools()
    if not devToolsGUI or not devToolsGUI.Parent then
        createDevTools() 
    end
    devToolsGUI.Enabled = true
    notify("DevTools", "Opened.", 3)
end

-- Server Browser GUI
local function openServerBrowser()
    if player.PlayerGui:FindFirstChild("ServerBrowser") then
        player.PlayerGui.ServerBrowser:Destroy()
    end

    local LocalPlayer = Players.LocalPlayer
    local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
    
    local gui = Instance.new("ScreenGui")
    gui.Name = "ServerBrowser"
    gui.ResetOnSpawn = false
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    if gethui then
        gui.Parent = gethui()
    else
        gui.Parent = player.PlayerGui
    end

    local main = Instance.new("Frame")
    main.Name = "MainFrame"
    if isMobile then
        main.Size = UDim2.new(0.95, 0, 0.85, 0)
        main.Position = UDim2.new(0.025, 0, 0.075, 0)
    else
        main.Size = UDim2.new(0, 700, 0, 550)
        main.Position = UDim2.new(0.5, -350, 0.5, -275)
    end
    main.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    main.BorderSizePixel = 0
    main.Parent = gui

    local mainCorner = Instance.new("UICorner")
    mainCorner.CornerRadius = UDim.new(0, 12)
    mainCorner.Parent = main

    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Size = UDim2.new(1, 0, 0, isMobile and 50 or 45)
    titleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    titleBar.BorderSizePixel = 0
    titleBar.Parent = main

    local titleCorner = Instance.new("UICorner")
    titleCorner.CornerRadius = UDim.new(0, 12)
    titleCorner.Parent = titleBar

    local titleFix = Instance.new("Frame")
    titleFix.Size = UDim2.new(1, 0, 0, 12)
    titleFix.Position = UDim2.new(0, 0, 1, -12)
    titleFix.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    titleFix.BorderSizePixel = 0
    titleFix.Parent = titleBar

    local titleText = Instance.new("TextLabel")
    titleText.Size = UDim2.new(1, -100, 1, 0)
    titleText.BackgroundTransparency = 1
    titleText.Text = "🌐 Server Browser"
    titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleText.Font = Enum.Font.GothamBold
    titleText.TextSize = isMobile and 18 or 16
    titleText.TextXAlignment = Enum.TextXAlignment.Left
    titleText.Position = UDim2.new(0, 15, 0, 0)
    titleText.Parent = titleBar

    local btnClose = Instance.new("TextButton")
    btnClose.Size = UDim2.new(0, isMobile and 45 or 35, 0, isMobile and 40 or 30)
    btnClose.Position = UDim2.new(1, isMobile and -55 or -35, 0, isMobile and 5 or 7.5)
    btnClose.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
    btnClose.Text = "x"
    btnClose.TextColor3 = Color3.fromRGB(255, 255, 255)
    btnClose.Font = Enum.Font.GothamBold
    btnClose.TextSize = isMobile and 18 or 16
    btnClose.BorderSizePixel = 0
    btnClose.Parent = titleBar

    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(0, 6)
    closeCorner.Parent = btnClose

    local topControls = Instance.new("Frame")
    topControls.Size = UDim2.new(1, -20, 0, isMobile and 45 or 45)
    topControls.Position = UDim2.new(0, 10, 0, isMobile and 58 or 55)
    topControls.BackgroundTransparency = 1
    topControls.Parent = main

    local infoBar = Instance.new("Frame")
    infoBar.Size = UDim2.new(0.58, -5, 1, 0)
    infoBar.Position = UDim2.new(0, 0, 0, 0)
    infoBar.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
    infoBar.BorderSizePixel = 0
    infoBar.Parent = topControls

    local infoCorner = Instance.new("UICorner")
    infoCorner.CornerRadius = UDim.new(0, 8)
    infoCorner.Parent = infoBar

    local infoLabel = Instance.new("TextLabel")
    infoLabel.Size = UDim2.new(1, -20, 1, 0)
    infoLabel.Position = UDim2.new(0, 10, 0, 0)
    infoLabel.BackgroundTransparency = 1
    infoLabel.Text = "📊 Loading servers..."
    infoLabel.TextColor3 = Color3.fromRGB(200, 200, 210)
    infoLabel.Font = Enum.Font.Gotham
    infoLabel.TextSize = isMobile and 11 or 12
    infoLabel.TextXAlignment = Enum.TextXAlignment.Left
    infoLabel.TextWrapped = true
    infoLabel.Parent = infoBar

    local btnRefresh = Instance.new("TextButton")
    btnRefresh.Size = UDim2.new(0.42, -5, 1, 0)
    btnRefresh.Position = UDim2.new(0.58, 5, 0, 0)
    btnRefresh.BackgroundColor3 = Color3.fromRGB(60, 120, 200)
    btnRefresh.Text = "🔄 Refresh"
    btnRefresh.TextColor3 = Color3.fromRGB(255, 255, 255)
    btnRefresh.Font = Enum.Font.GothamBold
    btnRefresh.TextSize = isMobile and 14 or 14
    btnRefresh.BorderSizePixel = 0
    btnRefresh.Parent = topControls

    local refreshCorner = Instance.new("UICorner")
    refreshCorner.CornerRadius = UDim.new(0, 8)
    refreshCorner.Parent = btnRefresh

    local refreshGrad = Instance.new("UIGradient")
    refreshGrad.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(70, 130, 210)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(50, 110, 190))
    }
    refreshGrad.Rotation = 90
    refreshGrad.Parent = btnRefresh

    local listFrame = Instance.new("ScrollingFrame")
    listFrame.Size = UDim2.new(1, -20, 1, isMobile and -113 or -110)
    listFrame.Position = UDim2.new(0, 10, 0, isMobile and 108 or 110)
    listFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    listFrame.BorderSizePixel = 0
    listFrame.ScrollBarThickness = isMobile and 8 or 6
    listFrame.ScrollBarImageColor3 = Color3.fromRGB(80, 120, 200)
    listFrame.Parent = main

    local listCorner = Instance.new("UICorner")
    listCorner.CornerRadius = UDim.new(0, 8)
    listCorner.Parent = listFrame

    local listLayout = Instance.new("UIListLayout")
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listLayout.Padding = UDim.new(0, isMobile and 5 or 6)
    listLayout.Parent = listFrame

    local listPadding = Instance.new("UIPadding")
    listPadding.PaddingTop = UDim.new(0, 5)
    listPadding.PaddingBottom = UDim.new(0, 5)
    listPadding.PaddingLeft = UDim.new(0, 5)
    listPadding.PaddingRight = UDim.new(0, 5)
    listPadding.Parent = listFrame

    local placeId = game.PlaceId
    local serverAges = {}

    local function clearList()
        for _, child in ipairs(listFrame:GetChildren()) do
            if child:IsA("Frame") then child:Destroy() end
        end
    end

    local function getServers()
        local servers = {}
        local cursor = ""
        repeat
            local success, result = pcall(function()
                local url = string.format("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Asc&limit=100&cursor=%s", placeId, cursor)
                return HttpService:JSONDecode(game:HttpGet(url))
            end)
            if success and result then
                for _, server in ipairs(result.data) do
                    table.insert(servers, server)
                    if not serverAges[server.id] then serverAges[server.id] = os.time() end
                end
                cursor = result.nextPageCursor or ""
            else
                break
            end
        until cursor == "" or #servers >= 500
        return servers
    end

    local function updateServerList()
        clearList()
        btnRefresh.Text = "⏳ Loading..."
        btnRefresh.BackgroundColor3 = Color3.fromRGB(100, 100, 120)
        infoLabel.Text = "📡 Fetching servers..."
        
        task.spawn(function()
            local servers = getServers()
            
            for i, server in ipairs(servers) do
                local entry = Instance.new("Frame")
                entry.Size = UDim2.new(1, -10, 0, isMobile and 70 or 80)
                entry.BackgroundColor3 = Color3.fromRGB(50, 50, 65)
                entry.BorderSizePixel = 0
                entry.Parent = listFrame
                
                local entryCorner = Instance.new("UICorner")
                entryCorner.CornerRadius = UDim.new(0, 6)
                entryCorner.Parent = entry
                
                local entryGrad = Instance.new("UIGradient")
                entryGrad.Color = ColorSequence.new{
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(55, 55, 70)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(45, 45, 60))
                }
                entryGrad.Rotation = 90
                entryGrad.Parent = entry
                
                local lblNum = Instance.new("TextLabel")
                lblNum.Size = UDim2.new(0, isMobile and 40 or 45, 0, isMobile and 40 or 45)
                lblNum.Position = UDim2.new(0, 8, 0.5, isMobile and -20 or -22.5)
                lblNum.BackgroundColor3 = Color3.fromRGB(60, 120, 200)
                lblNum.Text = tostring(i)
                lblNum.TextColor3 = Color3.fromRGB(255, 255, 255)
                lblNum.Font = Enum.Font.GothamBold
                lblNum.TextSize = isMobile and 16 or 18
                lblNum.BorderSizePixel = 0
                lblNum.Parent = entry
                
                local numCorner = Instance.new("UICorner")
                numCorner.CornerRadius = UDim.new(0.5, 0)
                numCorner.Parent = lblNum
                
                local lblPlayers = Instance.new("TextLabel")
                lblPlayers.Size = UDim2.new(1, isMobile and -160 or -170, 0, isMobile and 17 or 19)
                lblPlayers.Position = UDim2.new(0, isMobile and 54 or 62, 0, isMobile and 5 or 7)
                lblPlayers.BackgroundTransparency = 1
                lblPlayers.Text = string.format("👥 %d/%d Players", server.playing, server.maxPlayers)
                lblPlayers.TextColor3 = Color3.fromRGB(255, 255, 255)
                lblPlayers.Font = Enum.Font.GothamBold
                lblPlayers.TextSize = isMobile and 13 or 13
                lblPlayers.TextXAlignment = Enum.TextXAlignment.Left
                lblPlayers.Parent = entry
                
                local lblPing = Instance.new("TextLabel")
                lblPing.Size = UDim2.new(0.5, isMobile and -80 or -85, 0, isMobile and 14 or 15)
                lblPing.Position = UDim2.new(0, isMobile and 54 or 62, 0, isMobile and 24 or 28)
                lblPing.BackgroundTransparency = 1
                lblPing.Text = string.format("📡 %dms", server.ping or 0)
                lblPing.TextColor3 = Color3.fromRGB(180, 180, 200)
                lblPing.Font = Enum.Font.Gotham
                lblPing.TextSize = isMobile and 11 or 11
                lblPing.TextXAlignment = Enum.TextXAlignment.Left
                lblPing.Parent = entry
                
                local lblId = Instance.new("TextLabel")
                lblId.Size = UDim2.new(1, isMobile and -160 or -170, 0, isMobile and 13 or 14)
                lblId.Position = UDim2.new(0, isMobile and 54 or 62, 0, isMobile and 40 or 45)
                lblId.BackgroundTransparency = 1
                lblId.Text = string.format("🔑 %s", string.sub(server.id, 1, isMobile and 20 or 28))
                lblId.TextColor3 = Color3.fromRGB(150, 150, 170)
                lblId.Font = Enum.Font.Gotham
                lblId.TextSize = isMobile and 9 or 9
                lblId.TextXAlignment = Enum.TextXAlignment.Left
                lblId.Parent = entry
                
                local lblFps = Instance.new("TextLabel")
                lblFps.Size = UDim2.new(1, isMobile and -160 or -170, 0, isMobile and 13 or 14)
                lblFps.Position = UDim2.new(0, isMobile and 54 or 62, 0, isMobile and 54 or 61)
                lblFps.BackgroundTransparency = 1
                lblFps.Text = string.format("⚡ FPS: %.1f", server.fps or 60)
                lblFps.TextColor3 = Color3.fromRGB(150, 150, 170)
                lblFps.Font = Enum.Font.Gotham
                lblFps.TextSize = isMobile and 9 or 9
                lblFps.TextXAlignment = Enum.TextXAlignment.Left
                lblFps.Parent = entry
                
                local btnJoin = Instance.new("TextButton")
                btnJoin.Size = UDim2.new(0, isMobile and 80 or 85, 0, isMobile and 55 or 60)
                btnJoin.Position = UDim2.new(1, isMobile and -87 or -93, 0.5, isMobile and -27.5 or -30)
                btnJoin.BackgroundColor3 = Color3.fromRGB(60, 200, 120)
                btnJoin.Text = "JOIN"
                btnJoin.TextColor3 = Color3.fromRGB(255, 255, 255)
                btnJoin.Font = Enum.Font.GothamBold
                btnJoin.TextSize = isMobile and 14 or 13
                btnJoin.BorderSizePixel = 0
                btnJoin.Parent = entry
                
                local joinCorner = Instance.new("UICorner")
                joinCorner.CornerRadius = UDim.new(0, 6)
                joinCorner.Parent = btnJoin
                
                local joinGrad = Instance.new("UIGradient")
                joinGrad.Color = ColorSequence.new{
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(70, 210, 130)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(50, 190, 110))
                }
                joinGrad.Rotation = 90
                joinGrad.Parent = btnJoin
                
                btnJoin.MouseButton1Click:Connect(function()
                    btnJoin.Text = "JOINING..."
                    btnJoin.BackgroundColor3 = Color3.fromRGB(100, 100, 120)
                    TeleportService:TeleportToPlaceInstance(placeId, server.id, LocalPlayer)
                end)
            end
            
            listFrame.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 10)
            btnRefresh.Text = "🔄 Refresh"
            btnRefresh.BackgroundColor3 = Color3.fromRGB(60, 120, 200)
            infoLabel.Text = string.format("Found %d servers • Select one to join", #servers)
        end)
    end

    btnClose.Activated:Connect(function()
        gui:Destroy()
    end)

    btnRefresh.Activated:Connect(function()
        updateServerList()
    end)

    makeDraggable(titleBar)
    updateServerList()
end

-- Script Hubs GUI
local function createHubsGUI()
    if hubsGui then hubsGui:Destroy() end
    
    local screen = Instance.new("ScreenGui", player.PlayerGui)
    screen.Name = "HubsGUI"
    screen.ResetOnSpawn = false
    screen.DisplayOrder = 2000
    
    local frame = Instance.new("Frame", screen)
    frame.Size = UDim2.new(0, 300, 0, 400)
    frame.Position = UDim2.new(0.5, -150, 0.5, -200)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    frame.ZIndex = 10
    makeDraggable(frame)
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)
    
    local title = Instance.new("TextLabel", frame)
    title.Text = "Script Hubs"
    title.Size = UDim2.new(1, -40, 0, 40)
    title.Position = UDim2.new(0, 10, 0, 0)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 18
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.BackgroundTransparency = 1
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.ZIndex = 11
    
    local closeBtn = Instance.new("TextButton", frame)
    closeBtn.Text = "X"
    closeBtn.Size = UDim2.new(0, 30, 0, 30)
    closeBtn.Position = UDim2.new(1, -35, 0, 5)
    closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.ZIndex = 11
    Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 6)
    closeBtn.MouseButton1Click:Connect(function() screen:Destroy() end)
    
    local scroll = Instance.new("ScrollingFrame", frame)
    scroll.Size = UDim2.new(1, -20, 1, -50)
    scroll.Position = UDim2.new(0, 10, 0, 45)
    scroll.BackgroundTransparency = 1
    scroll.ScrollBarThickness = 6
    scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    scroll.ZIndex = 11
    
    local layout = Instance.new("UIListLayout", scroll)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 5)
    
    for i, hub in ipairs(scriptHubs) do
        local row = Instance.new("Frame", scroll)
        row.Size = UDim2.new(1, -10, 0, 40)
        row.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
        row.ZIndex = 12
        Instance.new("UICorner", row).CornerRadius = UDim.new(0, 6)
        
        local nameLbl = Instance.new("TextLabel", row)
        nameLbl.Text = hub.name
        nameLbl.Size = UDim2.new(0.6, 0, 1, 0)
        nameLbl.Position = UDim2.new(0, 10, 0, 0)
        nameLbl.Font = Enum.Font.GothamBold
        nameLbl.TextColor3 = Color3.fromRGB(200, 200, 200)
        nameLbl.BackgroundTransparency = 1
        nameLbl.TextXAlignment = Enum.TextXAlignment.Left
        nameLbl.ZIndex = 13
        
        local execBtn = Instance.new("TextButton", row)
        execBtn.Text = "EXECUTE"
        execBtn.Size = UDim2.new(0, 80, 0, 30)
        execBtn.Position = UDim2.new(1, -85, 0.5, -15)
        execBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 60)
        execBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        execBtn.Font = Enum.Font.GothamBold
        execBtn.TextSize = 12
        execBtn.ZIndex = 13
        Instance.new("UICorner", execBtn).CornerRadius = UDim.new(0, 6)
        
        execBtn.MouseButton1Click:Connect(function()
            local s, e = pcall(function() loadstring(hub.script)() end)
            if not s then notify("Error", "Failed to load hub", 3) 
            else notify("Success", "Loaded " .. hub.name, 3) end
        end)
    end
    
    hubsGui = screen
    return screen
end

-- TEAM NOTIFICATION LISTENER
local function setupTeamListener(p)
    if p == player then return end
    p:GetPropertyChangedSignal("Team"):Connect(function()
        if isTeamNoti then
            local tName = p.Team and p.Team.Name or "Neutral"
            notify("Team Swap", p.DisplayName .. " switched to team " .. tName .. ".", 5)
        end
    end)
end

for _, p in ipairs(Players:GetPlayers()) do setupTeamListener(p) end
Players.PlayerAdded:Connect(setupTeamListener)

-- DAMAGE NOTIFICATION LISTENER
local function setupDamageListener()
    local hum = getHumanoid()
    if not hum then return end
    
    lastHealth = hum.MaxHealth 
    hum.HealthChanged:Connect(function(health)
        if not isDamageNoti then lastHealth = health; return end
        if health < lastHealth then
            local dmg = lastHealth - health
            local creator = hum:FindFirstChild("creator") or hum:FindFirstChild("Creator")
            local attackerName = "Unknown"
            if creator and creator.Value and creator.Value:IsA("Player") then attackerName = creator.Value.DisplayName end
            notify("Damage", attackerName .. " hit you for " .. math.floor(dmg + 0.5) .. " hp!", 3)
        end
        lastHealth = health
    end)
end

-- CHAT LOGGER
local function logChat(p, msg)
    if p ~= player and checkDangerWord(msg) then
        serverHop()
        return
    end

    if not isRecording then return end
    local shouldLog = false
    
    if recordingMode == "all" then
        shouldLog = true
    elseif recordingMode == "player" and recordingTarget then
        if p.Name:lower() == recordingTarget:lower() or p.DisplayName:lower() == recordingTarget:lower() then shouldLog = true end
    elseif recordingMode == "team" and recordingTarget then
        if p.Team and p.Team.Name:lower() == recordingTarget:lower() then shouldLog = true end
    end
    
    if shouldLog then
        table.insert(recordedChats, "[" .. os.date("%X") .. "] " .. p.DisplayName .. " (@" .. p.Name .. "): " .. msg)
    end
end

-- HANDLE TEXT CHAT SERVICE MESSAGES
TextChatService.MessageReceived:Connect(function(msg)
    if not msg.TextSource then return end
    local speaker = Players:GetPlayerByUserId(msg.TextSource.UserId)
    
    if speaker == player and msg.Text:sub(1,1) == "/" then 
        handleCommand(msg.Text) 
    end
    
    if speaker then
        logChat(speaker, msg.Text)
    end
end)

-- Command Handler
function handleCommand(txt)
    local args = txt:split(" ")
    local cmd = args[1]:lower()
    
    if cmd == "/q" then
        notify("Stopped", "Script stopped.", 3)
    
    elseif cmd == "/resize" then
        if args[2] and tonumber(args[2]) then
            local newH = tonumber(args[2])
            if newH < 200 then newH = 200 end
            if newH > 1000 then newH = 1000 end
            if guiMainFrame then
                guiMainFrame.Size = UDim2.new(0, 220, 0, newH)
                guiMainFrame.Position = UDim2.new(0, 70, 0.5, -(newH/2))
                notify("Settings", "GUI Resized to " .. newH, 3)
            end
        else
            notify("Error", "Usage: /resize [number]", 5)
        end
    
    elseif cmd == "/dtscroll" then
        if args[2] == "off" then 
            isDtScrollable = false
        else 
            isDtScrollable = true 
        end
        
        if player.PlayerGui:FindFirstChild("DevToolsGUI") then
            local wasOpen = player.PlayerGui.DevToolsGUI.Enabled
            createDevTools()
            if wasOpen then openDevTools() end
        end
        
        notify("Settings", "DevTools Scroll: " .. tostring(isDtScrollable), 3)

    elseif cmd == "/sendcoords" then
        local hrp = getHRP()
        if hrp then
            local pos = hrp.Position
            local msg = string.format("My location: %.1f, %.1f, %.1f", pos.X, pos.Y, pos.Z)
            sendChatMessage(msg)
        end
    
    elseif cmd == "/esp" then
        if args[2] == "off" then isESP = true toggleESP() 
        else if not isESP then toggleESP() end end
    elseif cmd == "/fly" then
        if args[2] and tonumber(args[2]) then flySpeed = tonumber(args[2]) end
        toggleFly()
    elseif cmd == "/noclip" then
        if args[2] == "off" then isNoclip = true toggleNoclip()
        else if not isNoclip then toggleNoclip() end end
    elseif cmd == "/reset" then
        local hum = getHumanoid()
        if hum then hum.Health = 0 end
    elseif cmd == "/devtools" then
        openDevTools()
    elseif cmd == "/aimbot" then
        if isAimbot then disableAimbot()
        else 
            if args[2] then
                if args[2] == "all" then
                    aimbotMode = "all"
                    aimbotTarget = nil
                elseif args[2] == "user" and args[3] then
                    aimbotMode = "user"
                    aimbotTarget = args[3]
                elseif args[2] == "team" and args[3] then
                    aimbotMode = "team"
                    aimbotTarget = args[3]
                end
            end
            enableAimbot() 
        end
    elseif cmd == "/wcab" then 
        if args[2] == "on" then 
            isWallCheck = true 
            notify("Aimbot", "WallCheck: ON", 3)
        elseif args[2] == "off" then 
            isWallCheck = false 
            notify("Aimbot", "WallCheck: OFF", 3)
        else
            isWallCheck = not isWallCheck
            notify("Aimbot", "WallCheck: " .. tostring(isWallCheck), 3)
        end

    elseif cmd == "/crosshair" then 
        if args[2] == "on" then 
            toggleCrosshair(true) 
            notify("Crosshair", "Enabled", 3)
        elseif args[2] == "off" then 
            toggleCrosshair(false) 
            notify("Crosshair", "Disabled", 3)
        else
            if crosshairGui and crosshairGui.Enabled then
                toggleCrosshair(false)
                notify("Crosshair", "Disabled", 3)
            else
                toggleCrosshair(true)
                notify("Crosshair", "Enabled", 3)
            end
        end
    
    elseif cmd == "/dwords" then
        if args[2] == "on" then 
            isDangerCheck = true
            notify("Security", "Danger Words: ON", 3)
        elseif args[2] == "off" then 
            isDangerCheck = false
            notify("Security", "Danger Words: OFF", 3)
        else 
            isDangerCheck = not isDangerCheck 
            notify("Security", "Danger Words: " .. tostring(isDangerCheck), 3)
        end

    elseif cmd == "/check" then
        if args[2] == "off" then stopChecking()
        else startChecking(args[2]) end
        
    elseif cmd == "/teamnoti" then
        if args[2] == "off" then isTeamNoti = false; notify("Spy", "Team notifications OFF.", 3)
        else isTeamNoti = true; notify("Spy", "Team notifications ON.", 3) end
    
    elseif cmd == "/damagenoti" then
        if args[2] == "off" then isDamageNoti = false; notify("Spy", "Damage notifications OFF.", 3)
        else isDamageNoti = true; notify("Spy", "Damage notifications ON.", 3) end

    elseif cmd == "/recordchat" then
        local mode = args[2] and args[2]:lower()
        local target = nil
        if #args >= 3 then target = table.concat(args, " ", 3) end

        if mode == "all" then
            isRecording = true; recordingMode = "all"; recordingTarget = nil; recordedChats = {}; notify("Recording", "Logging ALL chat.", 3)
        elseif mode == "team" and target then
            isRecording = true; recordingMode = "team"; recordingTarget = target; recordedChats = {}; notify("Recording", "Logging team: " .. target, 3)
        elseif mode == "player" and target then
            isRecording = true; recordingMode = "player"; recordingTarget = target; recordedChats = {}; notify("Recording", "Logging player: " .. target, 3)
        else
            notify("Error", "Usage: /recordchat [all/team/player] [name]", 5)
        end
        
    elseif cmd == "/copyrc" then
        if #recordedChats == 0 then notify("Error", "No logs recorded.", 3) return end
        local fullLog = table.concat(recordedChats, "\n")
        local success, err = pcall(function()
            if setclipboard then setclipboard(fullLog)
            elseif toclipboard then toclipboard(fullLog)
            else error("No clipboard support") end
        end)
        if success then notify("Success", "Copied logs to clipboard!", 5)
        else
            print("--- CHAT LOGS (CLIPBOARD FAILED) ---")
            print(fullLog)
            notify("Warning", "Clipboard failed. Printed to console (F9).", 5)
        end
        
    elseif cmd == "/addblab" then
        if args[2] then
             aimbotBlacklist[args[2]:lower()] = true
             notify("Blacklist", "Added: " .. args[2], 3)
        end
    elseif cmd == "/rmblab" then
        if args[2] then
             aimbotBlacklist[args[2]:lower()] = nil
             notify("Blacklist", "Removed: " .. args[2], 3)
        end

    elseif cmd == "/stoprc" then
        recordingTarget = nil; isRecording = false; notify("Recording", "Stopped logging.", 3)
    elseif cmd == "/printrc" then
        print("--- CHAT LOGS ---")
        if #recordedChats == 0 then print("No logs.") else for _, line in ipairs(recordedChats) do print(line) end end
        notify("Logs", "Printed to console.", 3)
        
    elseif cmd == "/tp" then
        if args[2] == "spawn" then
             local spawns = {}
             for _,v in pairs(workspace:GetDescendants()) do if v:IsA("SpawnLocation") then table.insert(spawns, v) end end
             if #spawns > 0 then teleportTo(spawns[math.random(1,#spawns)].Position) else teleportTo(Vector3.new(0,50,0)) end
             notify("TP", "Teleported to spawn.", 3)
        elseif tpPresets[args[2]] then
            teleportTo(tpPresets[args[2]])
            notify("TP", "Teleported to " .. args[2], 3)
        elseif args[2] and args[3] and args[4] then
            local x, y, z = tonumber(args[2]), tonumber(args[3]), tonumber(args[4])
            if x and y and z then
                teleportTo(Vector3.new(x,y,z))
                notify("TP", "Teleported to coords.", 3)
            end
        else
            notify("Error", "Usage: /tp [x y z] or [preset]", 5)
        end
        
    elseif cmd == "/teamcheck" then
        local targetP = nil
        local searchName = args[2]
        if searchName then
            for _, p in ipairs(Players:GetPlayers()) do
                if p.Name:lower():sub(1, #searchName) == searchName:lower() or p.DisplayName:lower():sub(1, #searchName) == searchName:lower() then
                    targetP = p; break
                end
            end
            if targetP then
                local teamName = targetP.Team and targetP.Team.Name or "Neutral"
                notify("Team Check", targetP.DisplayName .. " is on Team: " .. teamName, 5)
            else notify("Error", "Player not found.", 3) end
        else notify("Error", "Usage: /teamcheck [name]", 3) end

    elseif cmd == "/profile" then
        showProfile()
    elseif cmd == "/servers" then
        openServerBrowser()
        notify("Servers", "Browser opened.", 3)
    elseif cmd == "/hubs" then
        createHubsGUI()
        notify("Hubs", "List opened.", 3)
    elseif cmd == "/info" and args[2] then
        fetchUserInfo(args[2])
    end
end

-- GUI Creation
local function createGui()
    local existing = player:WaitForChild("PlayerGui"):FindFirstChild("UtiliTizeGui")
    if existing then existing:Destroy() end

    local gui = Instance.new("ScreenGui")
    gui.Name = "UtiliTizeGui"; gui.ResetOnSpawn = false; gui.Parent = player:WaitForChild("PlayerGui")
    gui.DisplayOrder = 1000
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local toggleBtn = Instance.new("ImageButton")
    toggleBtn.Size = UDim2.new(0, 50, 0, 50); toggleBtn.Position = UDim2.new(0, 10, 0.5, -25)
    toggleBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    toggleBtn.Image = "rbxassetid://80439987920750" 
    toggleBtn.Parent = gui
    toggleBtn.ZIndex = 2 
    Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(0, 8)

    guiMainFrame = Instance.new("Frame")
    guiMainFrame.Size = UDim2.new(0, 220, 0, 350); guiMainFrame.Position = UDim2.new(0, 70, 0.5, -175)
    guiMainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25); guiMainFrame.Visible = false; guiMainFrame.Parent = gui
    guiMainFrame.ZIndex = 1
    Instance.new("UICorner", guiMainFrame).CornerRadius = UDim.new(0, 8)
    makeDraggable(guiMainFrame) 
    
    local title = Instance.new("TextLabel")
    title.Text = "UTILITIZE V" .. VERSION; title.Size = UDim2.new(1,0,0,30); title.BackgroundTransparency = 1
    title.TextColor3 = Color3.fromRGB(200, 200, 200); title.Font = Enum.Font.GothamBold; title.Parent = guiMainFrame
    title.ZIndex = 2 

    local cmdBar = Instance.new("TextBox")
    cmdBar.Size = UDim2.new(1,-20,0,35); cmdBar.Position = UDim2.new(0,10,1,-45)
    cmdBar.BackgroundColor3 = Color3.fromRGB(40,40,40); cmdBar.TextColor3 = Color3.fromRGB(255,255,255); cmdBar.PlaceholderText = "Type command..."
    cmdBar.Parent = guiMainFrame
    cmdBar.ZIndex = 2 
    Instance.new("UICorner", cmdBar).CornerRadius = UDim.new(0, 6)

    local scroll = Instance.new("ScrollingFrame")
    scroll.Size = UDim2.new(1,-10,1,-85); scroll.Position = UDim2.new(0,5,0,35)
    scroll.BackgroundTransparency = 1; scroll.CanvasSize = UDim2.new(0,0,0,0)
    scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y; scroll.Parent = guiMainFrame
    scroll.ZIndex = 2 
    
    local listLayout = Instance.new("UIListLayout"); listLayout.Padding = UDim.new(0,5); listLayout.Parent = scroll
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    
    local layoutOrderCounter = 0 

    for _, sectionName in ipairs(sectionOrder) do
        local commands = commandSections[sectionName]
        if commands then
            local header = Instance.new("TextLabel")
            header.Text = "  " .. sectionName; header.Size = UDim2.new(1, 0, 0, 25); header.BackgroundTransparency = 1
            header.TextColor3 = Color3.fromRGB(255, 255, 255); header.Font = Enum.Font.GothamBlack
            header.TextSize = 18; header.TextXAlignment = Enum.TextXAlignment.Left; header.LayoutOrder = layoutOrderCounter
            layoutOrderCounter = layoutOrderCounter + 1; header.Parent = scroll
            header.ZIndex = 2 
            
            local isConfig = (sectionName == "CONFIG" or sectionName == "DEVTOOLS" or sectionName == "SPY / MOD")
            for _, data in ipairs(commands) do
                local btn = Instance.new("TextButton")
                btn.Size = UDim2.new(1, -10, 0, 25); btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                btn.TextColor3 = Color3.fromRGB(200, 200, 255); btn.Text = " " .. data.cmd
                btn.TextXAlignment = Enum.TextXAlignment.Left; btn.Font = Enum.Font.GothamBold; btn.TextSize = 12
                btn.LayoutOrder = layoutOrderCounter; layoutOrderCounter = layoutOrderCounter + 1; btn.Parent = scroll
                btn.ZIndex = 3 
                
                local desc = Instance.new("TextLabel", btn)
                desc.Text = ""; desc.Size = UDim2.new(0,0,0,0); desc.Visible = false
                
                btn.MouseButton1Click:Connect(function() 
                    if isConfig then cmdBar.Text = data.cmd:split(" ")[1] .. " " else cmdBar.Text = data.cmd:split(" ")[1] .. " " end
                    cmdBar:CaptureFocus() 
                end)
            end
            local spacer = Instance.new("Frame", scroll); spacer.Size = UDim2.new(1,0,0,5); spacer.BackgroundTransparency = 1
            spacer.LayoutOrder = layoutOrderCounter; layoutOrderCounter = layoutOrderCounter + 1
        end
    end

    local isOpen = false
    toggleBtn.MouseButton1Click:Connect(function() isOpen = not isOpen; guiMainFrame.Visible = isOpen end)
    cmdBar.FocusLost:Connect(function(enter) if enter and cmdBar.Text ~= "" then handleCommand(cmdBar.Text); cmdBar.Text = "" end end)
end

-- CHARACTER RESPAWN HANDLER (CLEANUP)
local function onCharacterAdded(newChar)
    character = newChar
    humanoidRootPart = newChar:WaitForChild("HumanoidRootPart")
    humanoid = newChar:WaitForChild("Humanoid")
    
    -- Clean up connections
    if flyConnection then flyConnection:Disconnect(); flyConnection = nil end
    if noclipConnection then noclipConnection:Disconnect(); noclipConnection = nil end
    
    -- Reset states
    isFlying = false
    isNoclip = false
    
    -- Unbind RenderStep
    RunService:UnbindFromRenderStep("AimbotStep")
    if aimbotHighlight then aimbotHighlight:Destroy(); aimbotHighlight = nil end
    
    -- Reapply fly if it was enabled
    if isFlying then enableFly() end
    
    -- Setup damage listener
    setupDamageListener()
end

player.CharacterAdded:Connect(onCharacterAdded)

-- INITIALIZATION
local function initialize()
    -- Set character references
    if player.Character then
        onCharacterAdded(player.Character)
    end
    
    -- Create main GUI
    createGui()
    
    -- Initialize DevTools (but keep hidden)
    createDevTools()
    
    notify("Loaded", "UtiliTize V" .. VERSION .. " Loaded Successfully.", 5)
end

initialize()