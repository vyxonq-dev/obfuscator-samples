-- 🔑 KONFIGURATION & ECHTE REPO (deividcomsono/Obsidian) 
local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"

local Library = loadstring(game:HttpGet(repo .. "Library.lua"))() 
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))() 
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local Options = Library.Options 
local Toggles = Library.Toggles

-- KEYS & LINKS 
local correctKey = "everyone loves poland" 
local premiumKey = "we are p2w" 
local discordLink = "https://discord.gg/VjRDS3MFBw" 
local keyFileName = "UniversalRailHub_Key.txt"

-- SERVICES 
local Players = game:GetService("Players") 
local Teams = game:GetService("Teams") 
local RunService = game:GetService("RunService") 
local Lighting = game:GetService("Lighting") 
local UserInputService = game:GetService("UserInputService") 
local VirtualInputManager = game:GetService("VirtualInputManager") 
local CoreGui = game:GetService("CoreGui") 
local PathfindingService = game:GetService("PathfindingService") 
local player = Players.LocalPlayer

local keyVerified = false

-- 💾 KEY SPEICHER-FUNKTIONEN 
local function saveKeyLocally(key) 
    if writefile then 
        pcall(function() 
            writefile(keyFileName, key) 
        end) 
    end 
end

local function checkSavedKey() 
    if isfile and readfile and isfile(keyFileName) then 
        local success, savedKey = pcall(readfile, keyFileName) 
        if success and (savedKey == correctKey or savedKey == premiumKey) then 
            keyVerified = true 
            task.spawn(function() 
                repeat task.wait() until Library and Library.Notify 
                Library:Notify({ 
                    Title = "Auto-Login", 
                    Description = "Saved key verified successfully!", 
                    Time = 4 
                }) 
            end) 
        end 
    end 
end

local function getRoot(char) 
    return char and char:FindFirstChild("HumanoidRootPart") 
end

-- 📂 TABS VERZEICHNIS 
local Tabs = {}

-- 🖼️ CREATE WINDOW 
Window = Library:CreateWindow({ 
    Title = "Obsidian", 
    Footer = "Universal Rail Hub v4.1", 
    Center = true, 
    AutoShow = true, 
    NotifySide = "Right", 
    ShowCustomCursor = false 
})

-- ❌ HIER WERDEN DIE STÖRENDEN UI-ELEMENTE DEAKTIVIERT 
Library:SetWatermarkVisibility(false) 
if Library.KeybindFrame then 
    Library.KeybindFrame.Visible = false 
end

Tabs.KeyTab = Window:AddTab("Key System", "key") 
Tabs.Player = Window:AddTab("Player", "user") 
Tabs.Esp = Window:AddTab("ESP", "eye") 
Tabs.Teleports = Window:AddTab("Teleportation", "map") 
Tabs.AutoClicker = Window:AddTab("Auto Clicker", "mouse") 
Tabs.Fullbright = Window:AddTab("Fullbright", "sun") 
Tabs.Misc = Window:AddTab("Miscellaneous", "briefcase") 
Tabs.Settings = Window:AddTab("Settings", "settings")

-- 🌍 GLOBALE PRÜFUNG 
local function checkKeyGlobal() 
    if not keyVerified then 
        Library:Notify({ 
            Title = "Access Denied!", 
            Description = "Please verify your key in the 'Key System' tab first!", 
            Time = 4 
        }) 
        return false 
    end 
    return true 
end

-- 📱 MOBILE SHORTCUT ENGINE 
local shortcutGui = Instance.new("ScreenGui") 
shortcutGui.Name = "Obsidian_MobileShortcuts" 
shortcutGui.ResetOnSpawn = false 
local successSc = pcall(function() shortcutGui.Parent = CoreGui end) 
if not successSc then shortcutGui.Parent = player:WaitForChild("PlayerGui") end

local function createShortcut(labelName, toggleKey, actionFunc) 
    local container = Instance.new("Frame") 
    container.Size = UDim2.new(0, 180, 0, 40) 
    container.Position = UDim2.new(0.5, -90, 0.2 + (#shortcutGui:GetChildren() * 0.04), 0) 
    container.BackgroundColor3 = Color3.fromRGB(20, 20, 20) 
    container.BorderSizePixel = 0 
    container.Active = true 
    container.Parent = shortcutGui

    local stroke = Instance.new("UIStroke") 
    stroke.Color = Color3.fromRGB(45, 45, 45) 
    stroke.Thickness = 1 
    stroke.Parent = container 

    local corner = Instance.new("UICorner") 
    corner.CornerRadius = UDim.new(0, 6) 
    corner.Parent = container 

    local actBtn = Instance.new("TextButton") 
    actBtn.Size = UDim2.new(1, -75, 1, 0) 
    actBtn.Position = UDim2.new(0, 4, 0, 0) 
    actBtn.BackgroundTransparency = 1 
    actBtn.Text = labelName 
    actBtn.TextColor3 = Color3.fromRGB(255, 255, 255) 
    actBtn.Font = Enum.Font.SourceSansBold 
    actBtn.TextSize = 13 
    actBtn.TextWrapped = true 
    actBtn.Parent = container 

    local keyInput = Instance.new("TextBox") 
    keyInput.Size = UDim2.new(0, 40, 0, 20) 
    keyInput.Position = UDim2.new(0, 112, 0, 10) 
    keyInput.BackgroundColor3 = Color3.fromRGB(30, 30, 30) 
    keyInput.Text = "" 
    keyInput.PlaceholderText = "Bind" 
    keyInput.TextColor3 = Color3.fromRGB(0, 170, 255) 
    keyInput.PlaceholderColor3 = Color3.fromRGB(100, 100, 100) 
    keyInput.Font = Enum.Font.SourceSansBold 
    keyInput.TextSize = 11 
    keyInput.ClearTextOnFocus = true 
    keyInput.Parent = container 

    local keyCorner = Instance.new("UICorner") 
    keyCorner.CornerRadius = UDim.new(0, 4) 
    keyCorner.Parent = keyInput 

    local keyStroke = Instance.new("UIStroke") 
    keyStroke.Color = Color3.fromRGB(50, 50, 50) 
    keyStroke.Thickness = 1 
    keyStroke.Parent = keyInput 

    local closeBtn = Instance.new("TextButton") 
    closeBtn.Size = UDim2.new(0, 20, 0, 20) 
    closeBtn.Position = UDim2.new(0, 156, 0, 10) 
    closeBtn.BackgroundTransparency = 1 
    closeBtn.Text = "×" 
    closeBtn.TextColor3 = Color3.fromRGB(150, 150, 150) 
    closeBtn.Font = Enum.Font.SourceSansBold 
    closeBtn.TextSize = 18 
    closeBtn.Parent = container 

    local currentHotkey = "" 
    keyInput.FocusLost:Connect(function() 
        currentHotkey = keyInput.Text:gsub("%s+", ""):lower() 
    end) 

    local dragStart, startPos 
    local dragging = false 
    local hasMoved = false 
    local activeDragInput = nil 

    local function onInputBegan(input) 
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and not dragging then 
            dragging = true 
            activeDragInput = input 
            hasMoved = false 
            dragStart = input.Position 
            startPos = container.Position 
        end 
    end 

    container.InputBegan:Connect(onInputBegan) 
    actBtn.InputBegan:Connect(onInputBegan) 

    UserInputService.InputChanged:Connect(function(input) 
        if dragging and input == activeDragInput then 
            local delta = input.Position - dragStart 
            if delta.Magnitude > 8 then hasMoved = true end 
            container.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y) 
        end 
    end) 

    local function triggerAction() 
        if not checkKeyGlobal() then return end 
        if toggleKey then 
            local toggleObj = Toggles[toggleKey] 
            if toggleObj then toggleObj:SetValue(not toggleObj.Value) end 
        elseif actionFunc then 
            actionFunc() 
            stroke.Color = Color3.fromRGB(0, 170, 255) 
            task.spawn(function() 
                task.wait(0.1) 
                if stroke and stroke.Parent then stroke.Color = Color3.fromRGB(45, 45, 45) end 
            end) 
        end 
    end 

    UserInputService.InputEnded:Connect(function(input) 
        if input == activeDragInput then 
            dragging = false 
            activeDragInput = nil 
            if not hasMoved then triggerAction() end 
        end 
    end) 

    local inputConnection 
    inputConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed) 
        if gameProcessed or currentHotkey == "" then return end 
        if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode.Name:lower() == currentHotkey then 
            triggerAction() 
        end 
    end) 

    closeBtn.MouseButton1Click:Connect(function() 
        if inputConnection then inputConnection:Disconnect() end 
        container:Destroy() 
    end) 

    if toggleKey then 
        task.spawn(function() 
            while container and container.Parent do 
                local toggleObj = Toggles[toggleKey] 
                if toggleObj then 
                    if toggleObj.Value and keyVerified then 
                        stroke.Color = Color3.fromRGB(0, 170, 255) 
                        actBtn.TextColor3 = Color3.fromRGB(0, 170, 255) 
                    else 
                        stroke.Color = Color3.fromRGB(45, 45, 45) 
                        actBtn.TextColor3 = Color3.fromRGB(255, 255, 255) 
                    end 
                end 
                task.wait(0.1) 
            end 
        end) 
    end 
end

-- 🔑 KEY SYSTEM MECHANIC 
local InfoBox = Tabs.KeyTab:AddLeftGroupbox("Information") 
InfoBox:AddLabel("⚠️ IMPORTANT INFO ⚠️") 
InfoBox:AddLabel(" ") 
InfoBox:AddLabel("The script will not start\nwithout a valid key!") 
InfoBox:AddLabel("Join discord for a\nfree key") 
InfoBox:AddLabel(" ") 
InfoBox:AddDivider() 
InfoBox:AddButton({ 
    Text = "Copy discord link", 
    Func = function() 
        if setclipboard then 
            setclipboard(discordLink) 
            Library:Notify({ Title = "Copied", Description = "Copied discord link", Time = 3 }) 
        end 
    end 
})

local KeyBox = Tabs.KeyTab:AddRightGroupbox("Key Verification") 
KeyBox:AddInput("KeyInputBox", { 
    Default = "", 
    Numeric = false, 
    Finished = false, 
    Text = "Enter your Key:", 
    Placeholder = "Type key here..." 
}) 
KeyBox:AddDivider() 
KeyBox:AddButton({ 
    Text = "Verify Key", 
    Func = function() 
        local ReceivedKey = Options.KeyInputBox.Value 
        if ReceivedKey == correctKey or ReceivedKey == premiumKey then 
            keyVerified = true 
            saveKeyLocally(ReceivedKey) 
            Library:Notify({ Title = "Success!", Description = "Access Granted! Key saved.", Time = 3 }) 
        else 
            Library:Notify({ Title = "Error", Description = "Invalid key entered.", Time = 3 }) 
        end 
    end 
})

-- 🏃‍♂️ PLAYER TAB 
local SpeedBox = Tabs.Player:AddLeftGroupbox("Movement Speed") 
SpeedBox:AddToggle("SpeedToggle", { Text = "Enable Speed", Default = false, Callback = function(V) if V and not checkKeyGlobal() then task.spawn(function() Toggles.SpeedToggle:SetValue(false) end) end end }) 
SpeedBox:AddButton({ Text = "📱 Create Speed Shortcut", Func = function() createShortcut("Speed", "SpeedToggle") end }) 
SpeedBox:AddSlider("SpeedSlider", { Text = "Speed Power", Default = 16, Min = 16, Max = 500, Rounding = 0 }) 
SpeedBox:AddInput("SpeedTextBox", { Text = "Custom Speed Box", Default = "16", Numeric = true, Finished = true, Placeholder = "Enter exact speed...", Callback = function(V) local num = tonumber(V) if num then Options.SpeedSlider:SetValue(num) end end }) 
Options.SpeedSlider:OnChanged(function() Options.SpeedTextBox:SetValue(tostring(Options.SpeedSlider.Value)) end)

local JumpBox = Tabs.Player:AddRightGroupbox("Jump Boost") 
JumpBox:AddToggle("JumpToggle", { Text = "Enable Jump", Default = false, Callback = function(V) if V and not checkKeyGlobal() then task.spawn(function() Toggles.JumpToggle:SetValue(false) end) end end }) 
JumpBox:AddButton({ Text = "📱 Create Jump Shortcut", Func = function() createShortcut("Jump Boost", "JumpToggle") end }) 
JumpBox:AddSlider("JumpSlider", { Text = "Jump Power", Default = 50, Min = 50, Max = 500, Rounding = 0 }) 
JumpBox:AddInput("JumpTextBox", { Text = "Custom Jump Box", Default = "50", Numeric = true, Finished = true, Placeholder = "Enter exact jump...", Callback = function(V) local num = tonumber(V) if num then Options.JumpSlider:SetValue(num) end end }) 
Options.JumpSlider:OnChanged(function() Options.JumpTextBox:SetValue(tostring(Options.JumpSlider.Value)) end)

local FlyBox = Tabs.Player:AddLeftGroupbox("Fly") 
FlyBox:AddToggle("FlyToggle", { Text = "Enable Fly", Default = false, Callback = function(V) if V and not checkKeyGlobal() then task.spawn(function() Toggles.FlyToggle:SetValue(false) end) end end }) 
FlyBox:AddButton({ Text = "📱 Create Fly Shortcut", Func = function() createShortcut("Fly", "FlyToggle") end }) 
FlyBox:AddSlider("FlySpeedSlider", { Text = "Fly Speed", Default = 50, Min = 10, Max = 300, Rounding = 0 }) 
FlyBox:AddInput("FlySpeedTextBox", { Text = "Custom Fly Box", Default = "50", Numeric = true, Finished = true, Placeholder = "Enter exact fly speed...", Callback = function(V) local num = tonumber(V) if num then Options.FlySpeedSlider:SetValue(num) end end }) 
Options.FlySpeedSlider:OnChanged(function() Options.FlySpeedTextBox:SetValue(tostring(Options.FlySpeedSlider.Value)) end) 
FlyBox:AddToggle("FlyAnimToggle", { Text = "Fly Animation", Default = false, Callback = function(V) if V and not checkKeyGlobal() then task.spawn(function() Toggles.FlyAnimToggle:SetValue(false) end) end end })

local NoclipBox = Tabs.Player:AddRightGroupbox("Noclip") 
NoclipBox:AddToggle("NoclipToggle", { Text = "Enable Noclip", Default = false, Callback = function(V) if V and not checkKeyGlobal() then task.spawn(function() Toggles.NoclipToggle:SetValue(false) end) end end }) 
NoclipBox:AddButton({ Text = "📱 Create Noclip Shortcut", Func = function() createShortcut("Noclip", "NoclipToggle") end })

-- MOVEMENT OVERRIDE 
local function enforceMovement() 
    if not keyVerified then return end 
    local char = player.Character 
    local hum = char and char:FindFirstChildOfClass("Humanoid") 
    if hum then 
        if Toggles.SpeedToggle and Toggles.SpeedToggle.Value then 
            local targetSpeed = tonumber(Options.SpeedSlider.Value) or 16 
            if hum.WalkSpeed ~= targetSpeed then hum.WalkSpeed = targetSpeed end 
        else 
            if hum.WalkSpeed ~= 16 then hum.WalkSpeed = 16 end 
        end

        if Toggles.JumpToggle and Toggles.JumpToggle.Value then 
            local targetJump = tonumber(Options.JumpSlider.Value) or 50 
            hum.UseJumpPower = true 
            if hum.JumpPower ~= targetJump then hum.JumpPower = targetJump end 
        else 
            if hum.JumpPower ~= 50 then hum.JumpPower = 50 end 
        end 
    end 
end

RunService.RenderStepped:Connect(enforceMovement)

-- 🛠️ NOCLIP LOGIK ENGINE
RunService.Stepped:Connect(function()
    if keyVerified and Toggles.NoclipToggle and Toggles.NoclipToggle.Value then
        local char = player.Character
        if char then
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end
end)

local function watchHumanoid(char) 
    local hum = char:WaitForChild("Humanoid", 5) 
    if hum then 
        hum:GetPropertyChangedSignal("WalkSpeed"):Connect(enforceMovement) 
        hum:GetPropertyChangedSignal("JumpPower"):Connect(enforceMovement) 
    end 
end 
if player.Character then watchHumanoid(player.Character) end

local FLYING = false 
local animTrack = nil

local function sFLY() 
    local char = player.Character or player.CharacterAdded:Wait() 
    local hum = char:FindFirstChildOfClass("Humanoid") 
    local root = getRoot(char) 
    local cam = workspace.CurrentCamera 
    local BG = Instance.new("BodyGyro", root) 
    local BV = Instance.new("BodyVelocity", root) 
    BG.P = 9e4 
    BG.MaxTorque = Vector3.new(9e9, 9e9, 9e9) 
    BV.MaxForce = Vector3.new(9e9, 9e9, 9e9)

    if hum then hum.PlatformStand = true end 
    FLYING = true 
    local moveModule = require(player.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")) 

    task.spawn(function() 
        while FLYING and Toggles.FlyToggle and Toggles.FlyToggle.Value and keyVerified do 
            RunService.RenderStepped:Wait() 
            local speed = Options.FlySpeedSlider.Value 
            local move = moveModule:GetMoveVector() 
            local dir = cam.CFrame.RightVector * move.X - cam.CFrame.LookVector * move.Z 
            if dir.Magnitude > 0 then dir = dir.Unit * speed end 
            BV.Velocity = dir 
            BG.CFrame = cam.CFrame 
        end 
        BG:Destroy() 
        BV:Destroy() 
        if hum then hum.PlatformStand = false end 
        if animTrack then animTrack:Stop(); animTrack = nil end 
    end) 
end

Toggles.FlyToggle:OnChanged(function() 
    if not keyVerified then return end 
    if Toggles.FlyToggle.Value then sFLY() else FLYING = false end 
end)

Toggles.FlyAnimToggle:OnChanged(function() 
    if not keyVerified then return end 
    local char = player.Character 
    local hum = char and char:FindFirstChildOfClass("Humanoid") 
    if not hum then return end 
    local animator = hum:FindFirstChildOfClass("Animator") or Instance.new("Animator", hum)

    if animTrack then animTrack:Stop(); animTrack = nil end 
    if Toggles.FlyAnimToggle.Value and FLYING then 
        local fallAnim = char:WaitForChild("Animate"):WaitForChild("fall"):WaitForChild("FallAnim") 
        animTrack = animator:LoadAnimation(fallAnim) 
        animTrack.Priority = Enum.AnimationPriority.Action 
        animTrack:Play() 
    end 
end)

-- 👁️ ESP TAB 
local EspBox = Tabs.Esp:AddLeftGroupbox("Player ESP Settings") 
EspBox:AddToggle("EspMasterToggle", { Text = "Enable Highlight ESP", Default = false, Callback = function(V) if V and not checkKeyGlobal() then task.spawn(function() Toggles.EspMasterToggle:SetValue(false) end) end end }) 
EspBox:AddButton({ Text = "📱 Create ESP Shortcut", Func = function() createShortcut("ESP Master", "EspMasterToggle") end })

local EspVisualsBox = Tabs.Esp:AddLeftGroupbox("ESP Visuals Customization") 
EspVisualsBox:AddToggle("TracerToggle", { Text = "Show Tracers", Default = false, Callback = function(V) if V and not checkKeyGlobal() then task.spawn(function() Toggles.TracerToggle:SetValue(false) end) end end }) 
EspVisualsBox:AddButton({ Text = "📱 Create Tracer Shortcut", Func = function() createShortcut("Tracers", "TracerToggle") end }) 
EspVisualsBox:AddToggle("HealthBarToggle", { Text = "Show Health Bar", Default = false }) 
EspVisualsBox:AddToggle("BoxToggle", { Text = "Show Box ESP", Default = false }) 
EspVisualsBox:AddToggle("SkeletonToggle", { Text = "Show Skeleton ESP", Default = false })

local TracerSettingsBox = Tabs.Esp:AddRightGroupbox("Tracer Settings") 
TracerSettingsBox:AddDropdown("TracerOriginDropdown", { Values = {"Default", "Bottom", "Bottom Right"}, Default = 1, Multi = false, Text = "Tracer Origin Point" })

local teamSettings = {} 
local playerDrawingData = {}

local function clearESP() 
    for _, plr in pairs(Players:GetPlayers()) do 
        if plr.Character then 
            local e = plr.Character:FindFirstChild("railhub_esp") 
            if e then e:Destroy() end 
        end 
    end 
end

local function createDrawingObjects(plr) 
    if playerDrawingData[plr] then return playerDrawingData[plr] end 
    local data = { 
        tracer = Drawing.new("Line"), 
        box = Drawing.new("Square"), 
        healthOutline = Drawing.new("Square"), 
        healthBar = Drawing.new("Square"), 
        skeleton = { 
            Drawing.new("Line"), Drawing.new("Line"), Drawing.new("Line"), 
            Drawing.new("Line"), Drawing.new("Line") 
        } 
    }

    data.tracer.Thickness = 2 
    data.box.Thickness = 1 
    data.box.Filled = false 

    data.healthOutline.Filled = true 
    data.healthOutline.Thickness = 0 
    data.healthOutline.ZIndex = 1 

    data.healthBar.Filled = true 
    data.healthBar.Thickness = 0 
    data.healthBar.ZIndex = 2 

    for _, line in ipairs(data.skeleton) do 
        line.Thickness = 1.5 
    end 

    playerDrawingData[plr] = data 
    return data 
end

local function removeDrawingObjects(plr) 
    local data = playerDrawingData[plr] 
    if data then 
        data.tracer:Remove() 
        data.box:Remove() 
        data.healthOutline:Remove() 
        data.healthBar:Remove() 
        for _, line in ipairs(data.skeleton) do line:Remove() end 
        playerDrawingData[plr] = nil 
    end 
end

function applyESP() 
    if not keyVerified or not Toggles.EspMasterToggle or not Toggles.EspMasterToggle.Value then clearESP(); return end

    for _, plr in pairs(Players:GetPlayers()) do 
        if plr ~= player and plr.Character then 
            local team = plr.Team and plr.Team.Name or "ALL" 
            local data = teamSettings[team] 
            
            if data and data.enabled then 
                local existing = plr.Character:FindFirstChild("railhub_esp") 
                if not existing then 
                    local h = Instance.new("Highlight") 
                    h.Name = "railhub_esp" 
                    h.FillColor = data.color 
                    h.OutlineColor = data.color 
                    h.FillTransparency = 0.5 
                    h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop 
                    h.Parent = plr.Character 
                else 
                    existing.FillColor = data.color 
                    existing.OutlineColor = data.color 
                end 
            else 
                local existing = plr.Character:FindFirstChild("railhub_esp") 
                if existing then existing:Destroy() end 
            end 
        end 
    end 
end

Toggles.EspMasterToggle:OnChanged(applyESP)

RunService.RenderStepped:Connect(function() 
    local camera = workspace.CurrentCamera

    local highlightEsp = Toggles.EspMasterToggle and Toggles.EspMasterToggle.Value
    local tracerEsp = Toggles.TracerToggle and Toggles.TracerToggle.Value
    local boxEsp = Toggles.BoxToggle and Toggles.BoxToggle.Value
    local healthEsp = Toggles.HealthBarToggle and Toggles.HealthBarToggle.Value
    local skeletonEsp = Toggles.SkeletonToggle and Toggles.SkeletonToggle.Value

    if not keyVerified or (not highlightEsp and not tracerEsp and not boxEsp and not healthEsp and not skeletonEsp) then 
        for plr, data in pairs(playerDrawingData) do 
            data.tracer.Visible = false 
            data.box.Visible = false 
            data.healthOutline.Visible = false 
            data.healthBar.Visible = false 
            for _, l in ipairs(data.skeleton) do l.Visible = false end 
        end 
        return 
    end

    local viewX, viewY = camera.ViewportSize.X, camera.ViewportSize.Y 
    local screenCenter = Vector2.new(viewX / 2, viewY / 2) 

    local originMode = Options.TracerOriginDropdown and Options.TracerOriginDropdown.Value or "Default" 
    local startX, startY 
    if originMode == "Bottom" then 
        startX = viewX / 2 
        startY = viewY 
    elseif originMode == "Bottom Right" then 
        startX = viewX 
        startY = viewY 
    else 
        startX = viewX / 2 
        startY = viewY - 120 
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then 
            local myRootPos, myCharOnScreen = camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position) 
            if myCharOnScreen then startX = myRootPos.X; startY = myRootPos.Y end 
        end 
    end 

    for _, plr in pairs(Players:GetPlayers()) do 
        if plr ~= player then 
            local char = plr.Character 
            local root = char and char:FindFirstChild("HumanoidRootPart") 
            local hum = char and char:FindFirstChildOfClass("Humanoid") 
            local team = plr.Team and plr.Team.Name or "ALL" 
            local teamData = teamSettings[team] 

            if root and hum and teamData and teamData.enabled then 
                local data = createDrawingObjects(plr) 
                local enemyPos, onScreen = camera:WorldToViewportPoint(root.Position) 
                local color = teamData.color 

                if onScreen then 
                    local topPos = camera:WorldToViewportPoint(root.Position + Vector3.new(0, 3, 0)) 
                    local bottomPos = camera:WorldToViewportPoint(root.Position + Vector3.new(0, -3.5, 0)) 
                    local boxHeight = math.abs(topPos.Y - bottomPos.Y) 
                    local boxWidth = boxHeight * 0.6 
                    local boxX = enemyPos.X - (boxWidth / 2) 
                    local boxY = topPos.Y 
                    
                    -- BOX ESP
                    if boxEsp then 
                        data.box.Position = Vector2.new(boxX, boxY) 
                        data.box.Size = Vector2.new(boxWidth, boxHeight) 
                        data.box.Color = color 
                        data.box.Visible = true 
                    else 
                        data.box.Visible = false 
                    end 

                    -- HEALTH BAR ESP
                    if healthEsp then 
                        local maxHealth = (hum.MaxHealth > 0) and hum.MaxHealth or 100 
                        local healthPct = math.clamp(hum.Health / maxHealth, 0, 1) 
                        local barHeight = math.floor(boxHeight * healthPct) 
                        
                        data.healthOutline.Position = Vector2.new(boxX - 6, boxY - 1) 
                        data.healthOutline.Size = Vector2.new(3, boxHeight + 2) 
                        data.healthOutline.Color = Color3.fromRGB(0, 0, 0) 
                        data.healthOutline.Visible = true 
                        
                        data.healthBar.Position = Vector2.new(boxX - 5, boxY + (boxHeight - barHeight)) 
                        data.healthBar.Size = Vector2.new(1, barHeight) 
                        data.healthBar.Color = Color3.fromRGB(255, 0, 0):Lerp(Color3.fromRGB(0, 255, 0), healthPct) 
                        data.healthBar.Visible = true 
                    else 
                        data.healthOutline.Visible = false 
                        data.healthBar.Visible = false 
                    end 

                    -- SKELETON ESP
                    if skeletonEsp then 
                        local joints = { 
                            Head = char:FindFirstChild("Head"), 
                            Torso = char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso"), 
                            LeftArm = char:FindFirstChild("Left Arm") or char:FindFirstChild("LeftUpperArm"), 
                            RightArm = char:FindFirstChild("Right Arm") or char:FindFirstChild("RightUpperArm"), 
                            LeftLeg = char:FindFirstChild("Left Leg") or char:FindFirstChild("LeftUpperLeg"), 
                            RightLeg = char:FindFirstChild("Right Leg") or char:FindFirstChild("RightUpperLeg") 
                        } 
                        local connections = { 
                            {joints.Head, joints.Torso}, 
                            {joints.Torso, joints.LeftArm}, 
                            {joints.Torso, joints.RightArm}, 
                            {joints.Torso, joints.LeftLeg}, 
                            {joints.Torso, joints.RightLeg} 
                        } 
                        for idx, conn in ipairs(connections) do 
                            local p1, p2 = conn[1], conn[2] 
                            local line = data.skeleton[idx] 
                            if p1 and p2 then 
                                local pos1, os1 = camera:WorldToViewportPoint(p1.Position) 
                                local pos2, os2 = camera:WorldToViewportPoint(p2.Position) 
                                if os1 or os2 then 
                                    line.From = Vector2.new(pos1.X, pos1.Y) 
                                    line.To = Vector2.new(pos2.X, pos2.Y) 
                                    line.Color = color 
                                    line.Visible = true 
                                else line.Visible = false end 
                            else line.Visible = false end 
                        end 
                    else 
                        for _, l in ipairs(data.skeleton) do l.Visible = false end 
                    end

                    -- TRACER ESP (On Screen)
                    if tracerEsp then
                        data.tracer.From = Vector2.new(startX, startY) 
                        data.tracer.To = Vector2.new(enemyPos.X, enemyPos.Y) 
                        data.tracer.Color = color 
                        data.tracer.Visible = true 
                    else
                        data.tracer.Visible = false
                    end
                else 
                    data.box.Visible = false 
                    data.healthOutline.Visible = false 
                    data.healthBar.Visible = false 
                    for _, l in ipairs(data.skeleton) do l.Visible = false end 

                    -- TRACER ESP (Off Screen)
                    if tracerEsp then
                        local targetPos = Vector2.new(enemyPos.X, enemyPos.Y) 
                        if enemyPos.Z < 0 then targetPos = screenCenter + (screenCenter - targetPos) end 
                        local direction = (targetPos - screenCenter).Unit 
                        local tMaxX = direction.X > 0 and (viewX - screenCenter.X) / direction.X or (0 - screenCenter.X) / direction.X 
                        local tMaxY = direction.Y > 0 and (viewY - screenCenter.Y) / direction.Y or (0 - screenCenter.Y) / direction.Y 
                        local tMin = math.min(math.abs(tMaxX), math.abs(tMaxY)) 
                        local edgePos = screenCenter + direction * tMin 
                        
                        data.tracer.From = Vector2.new(startX, startY) 
                        data.tracer.To = Vector2.new(edgePos.X, edgePos.Y) 
                        data.tracer.Color = color 
                        data.tracer.Visible = true 
                    else
                        data.tracer.Visible = false
                    end
                end 
            else 
                local data = playerDrawingData[plr] 
                if data then 
                    data.tracer.Visible = false 
                    data.box.Visible = false 
                    data.healthOutline.Visible = false 
                    data.healthBar.Visible = false 
                    for _, l in ipairs(data.skeleton) do l.Visible = false end 
                end 
            end 
        end 
    end 
end)

Players.PlayerRemoving:Connect(function(plr) removeDrawingObjects(plr) end)

local function listenToCharacter(plr) plr.CharacterAdded:Connect(function() task.wait(0.5); applyESP() end) end 
for _, plr in pairs(Players:GetPlayers()) do if plr ~= player then listenToCharacter(plr) end end 
Players.PlayerAdded:Connect(function(plr) if plr ~= player then listenToCharacter(plr) end end)

task.spawn(function() while true do task.wait(1); if keyVerified and Toggles.EspMasterToggle and Toggles.EspMasterToggle.Value then applyESP() end end end)

local TeamBox = Tabs.Esp:AddRightGroupbox("Team Toggles & Colors")

local function createTeamUI(name) 
    teamSettings[name] = { enabled = true, color = Color3.fromRGB(255, 0, 0) } 
    local teamToggle = TeamBox:AddToggle("Team_"..name, { 
        Text = "Show " .. name, 
        Default = true, 
        Callback = function(V) 
            if V and not checkKeyGlobal() then task.spawn(function() Toggles["Team_"..name]:SetValue(false) end); return end 
            teamSettings[name].enabled = V; applyESP() 
        end 
    }) 
    teamToggle:AddColorPicker("Color_"..name, { Default = teamSettings[name].color, Title = name .. " Color", Callback = function(V) teamSettings[name].color = V; applyESP() end }) 
    TeamBox:AddButton({ Text = "📱 Shortcut " .. name, Func = function() createShortcut(name, "Team_"..name) end }) 
end

createTeamUI("ALL") 
for _, t in pairs(Teams:GetTeams()) do createTeamUI(t.Name) end

-- 🗺️ TELEPORTATION & PATHFINDING TAB 
local WaypointEspBox = Tabs.Teleports:AddLeftGroupbox("Waypoint ESP Settings") 
local WaypointGroupsBox = Tabs.Teleports:AddLeftGroupbox("Waypoint Groups & Management") 
local AutoTpBox = Tabs.Teleports:AddRightGroupbox("Auto Teleport") 
local PathfindingBox = Tabs.Teleports:AddRightGroupbox("Pathfinding Settings")

local waypointGroups = { 
    ["Default"] = { color = Color3.fromRGB(0, 170, 255), waypoints = {} } 
} 
local waypointIndex = 1 
local pathfindingActive = false 
local currentPathThread = nil

local function applyWaypointESP() 
    for groupName, groupData in pairs(waypointGroups) do 
        for _, wp in ipairs(groupData.waypoints) do 
            if wp.marker then 
                wp.marker.Color = groupData.color 
                local highlight = wp.marker:FindFirstChild("WpHighlight")

                if Toggles.WaypointEspToggle and Toggles.WaypointEspToggle.Value and keyVerified then 
                    if not highlight then 
                        highlight = Instance.new("Highlight") 
                        highlight.Name = "WpHighlight" 
                        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop 
                        highlight.FillTransparency = 0.4 
                        highlight.OutlineTransparency = 0 
                        highlight.Parent = wp.marker 
                    end 
                    highlight.FillColor = groupData.color 
                    highlight.OutlineColor = groupData.color 
                else 
                    if highlight then highlight:Destroy() end 
                end 
            end 
        end 
    end 
end

local function refreshGroupDropdown() 
    local groupNames = {} 
    for name, _ in pairs(waypointGroups) do table.insert(groupNames, name) end 
    Options.GroupDropdown:SetValues(groupNames) 
end

local function refreshWaypointDropdown() 
    local names = {} 
    local selGroup = Options.GroupDropdown.Value or "Default" 
    if waypointGroups[selGroup] then 
        for i, wp in ipairs(waypointGroups[selGroup].waypoints) do 
            table.insert(names, wp.name) 
        end 
    end 
    if #names == 0 then table.insert(names, "None") end 
    Options.WaypointDropdown:SetValues(names) 
    Options.WaypointDropdown:SetValue(names[1]) 
end

local function getActiveWaypoints() 
    if Toggles.UseGroupTpToggle and Toggles.UseGroupTpToggle.Value then 
        local selGroup = Options.GroupDropdown.Value or "Default" 
        return waypointGroups[selGroup] and waypointGroups[selGroup].waypoints or {} 
    else 
        local allWps = {} 
        for _, groupData in pairs(waypointGroups) do 
            for _, wp in ipairs(groupData.waypoints) do 
                table.insert(allWps, wp) 
            end 
        end 
        return allWps 
    end 
end

local function stopPathfinding() 
    pathfindingActive = false 
    if currentPathThread then 
        task.cancel(currentPathThread) 
        currentPathThread = nil 
    end 
    local char = player.Character 
    local hum = char and char:FindFirstChildOfClass("Humanoid") 
    local root = getRoot(char) 
    if hum and root then hum:MoveTo(root.Position) end 
end

local function walkToPosition(targetPos) 
    stopPathfinding() 
    pathfindingActive = true

    currentPathThread = task.spawn(function() 
        local char = player.Character 
        local hum = char and char:FindFirstChildOfClass("Humanoid") 
        local root = getRoot(char) 
        if not hum or not root then pathfindingActive = false return end 

        local rayParams = RaycastParams.new() 
        rayParams.FilterType = Enum.RaycastFilterType.Exclude 
        rayParams.FilterDescendantsInstances = {char, workspace.CurrentCamera} 

        while pathfindingActive do 
            local distToTarget = (root.Position * Vector3.new(1,0,1) - targetPos * Vector3.new(1,0,1)).Magnitude 
            if distToTarget < 2 then break end  

            local path = PathfindingService:CreatePath({ AgentRadius = 2, AgentHeight = 5, AgentCanJump = true, AgentWalkableClimb = 3 }) 
            local success = pcall(function() path:ComputeAsync(root.Position, targetPos) end) 
            local waypointsToFollow = {} 

            if success and path.Status == Enum.PathStatus.Success then 
                waypointsToFollow = path:GetWaypoints() 
            else 
                waypointsToFollow = { {Position = root.Position, Action = Enum.PathWaypointAction.Walk}, {Position = targetPos, Action = Enum.PathWaypointAction.Walk} } 
            end 

            local isStuck = false 
            for i = 2, #waypointsToFollow do 
                if not pathfindingActive then break end 
                local wp = waypointsToFollow[i] 
                hum:MoveTo(wp.Position) 
                if wp.Action == Enum.PathWaypointAction.Jump then hum.Jump = true end 

                local startTime = tick() 
                while pathfindingActive do 
                    task.wait(0.05) 
                    if (root.Position * Vector3.new(1,0,1) - wp.Position * Vector3.new(1,0,1)).Magnitude < 2 then break end  

                    local fwd = hum.MoveDirection 
                    if fwd.Magnitude > 0 then 
                        local lookAhead = root.Position + (fwd * 4.5) 
                        local rayDown = workspace:Raycast(lookAhead, Vector3.new(0, -15, 0), rayParams) 
                        if not rayDown then hum.Jump = true  
                        elseif rayDown.Instance then 
                            local instName = string.lower(rayDown.Instance.Name) 
                            if string.find(instName, "kill") or string.find(instName, "lava") or rayDown.Instance.BrickColor.Name == "Bright red" then 
                                hum.Jump = true  
                            end 
                        end 
                        if workspace:Raycast(root.Position, fwd * 3, rayParams) then hum.Jump = true end 
                    end 
                    if tick() - startTime > 2.5 then isStuck = true break end 
                end 
                if isStuck then break end 
            end 
            if isStuck and pathfindingActive then hum.Jump = true task.wait(0.5) end 
        end 
        pathfindingActive = false 
    end) 
end

local function moveToTarget(targetPos) 
    if not checkKeyGlobal() then return end 
    if Toggles.UsePathfinding and Toggles.UsePathfinding.Value then 
        walkToPosition(targetPos) 
    else 
        stopPathfinding() 
        local root = getRoot(player.Character) 
        if root then root.CFrame = CFrame.new(targetPos) end 
    end 
end

local function createMarker(pos, color) 
    local p = Instance.new("Part") 
    p.Shape = Enum.PartType.Ball; p.Size = Vector3.new(2,2,2); p.Anchored = true; p.CanCollide = false 
    p.Material = Enum.Material.Neon; p.Color = color; p.Position = pos + Vector3.new(0,2,0) 
    p.Parent = workspace; return p 
end

local function doTeleportNext() 
    if not checkKeyGlobal() then return end 
    local activeWps = getActiveWaypoints() 
    if #activeWps == 0 then return end

    if waypointIndex > #activeWps then waypointIndex = 1 end 
    local target = activeWps[waypointIndex] 
    moveToTarget(target.pos) 

    waypointIndex = waypointIndex + 1 
    if waypointIndex > #activeWps then waypointIndex = 1 end 
end

WaypointEspBox:AddToggle("WaypointEspToggle", { 
    Text = "Enable Waypoint ESP", 
    Default = false, 
    Callback = function(V) 
        if V and not checkKeyGlobal() then task.spawn(function() Toggles.WaypointEspToggle:SetValue(false) end) return end 
        applyWaypointESP() 
    end 
})

WaypointGroupsBox:AddDropdown("GroupDropdown", { Values = {"Default"}, Default = 1, Multi = false, Text = "Select Active Group" }) 
WaypointGroupsBox:AddInput("GroupNameInput", { Default = "", Numeric = false, Finished = true, Text = "Create/Rename Group Name", Placeholder = "Type group name..." }) 
WaypointGroupsBox:AddLabel("Group Color Picker"):AddColorPicker("GroupColorPicker", { 
    Default = Color3.fromRGB(0, 170, 255), 
    Title = "Group Color", 
    Callback = function(V) 
        local selGroup = Options.GroupDropdown.Value or "Default" 
        if waypointGroups[selGroup] then 
            waypointGroups[selGroup].color = V 
            applyWaypointESP() 
        end 
    end 
})

WaypointGroupsBox:AddButton({ 
    Text = "Create Group", 
    Func = function() 
        if not checkKeyGlobal() then return end 
        local name = Options.GroupNameInput.Value 
        if name == "" then return end 
        if not waypointGroups[name] then 
            waypointGroups[name] = { color = Options.GroupColorPicker.Value, waypoints = {} } 
            refreshGroupDropdown() 
            Options.GroupDropdown:SetValue(name) 
            Library:Notify({ Title = "Success", Description = "Group '"..name.."' created!", Time = 2 }) 
        else 
            Options.GroupDropdown:SetValue(name) 
        end 
    end 
})

WaypointGroupsBox:AddDivider() 
WaypointGroupsBox:AddInput("WaypointNameInput", { Default = "", Numeric = false, Finished = false, Text = "Waypoint Name", Placeholder = "Optional name..." }) 
WaypointGroupsBox:AddButton({ 
    Text = "Add Waypoint", 
    Func = function() 
        if not checkKeyGlobal() then return end 
        local root = getRoot(player.Character) 
        if not root then return end 
        local selGroup = Options.GroupDropdown.Value or "Default" 
        local name = Options.WaypointNameInput.Value 
        if name == "" then name = "Waypoint " .. (#waypointGroups[selGroup].waypoints + 1) end

        local marker = createMarker(root.Position, waypointGroups[selGroup].color)  
        table.insert(waypointGroups[selGroup].waypoints, {name = name, pos = root.Position, marker = marker})  
        
        refreshWaypointDropdown()  
        applyWaypointESP() 
        Library:Notify({ Title = "Success!", Description = "Waypoint added to " .. selGroup, Time = 2 })  
    end  
}) 
WaypointGroupsBox:AddButton({ Text = "Teleport Next", Func = doTeleportNext }) 
WaypointGroupsBox:AddButton({ Text = "📱 Create TP Next Shortcut", Func = function() createShortcut("TP Next", nil, doTeleportNext) end })

WaypointGroupsBox:AddButton({ 
    Text = "Delete Last In Group", 
    Func = function() 
        if not checkKeyGlobal() then return end 
        local selGroup = Options.GroupDropdown.Value or "Default" 
        local wps = waypointGroups[selGroup].waypoints 
        if #wps == 0 then return end 
        local last = wps[#wps] 
        if last.marker then last.marker:Destroy() end 
        table.remove(wps, #wps) 
        if waypointIndex > #wps then waypointIndex = 1 end 
        refreshWaypointDropdown() 
    end 
}) 
WaypointGroupsBox:AddDivider() 
WaypointGroupsBox:AddDropdown("WaypointDropdown", { Values = {"None"}, Default = 1, Multi = false, Text = "Select Waypoint" }) 
WaypointGroupsBox:AddButton({ 
    Text = "Teleport to Selected", 
    Func = function() 
        if not checkKeyGlobal() then return end 
        local selected = Options.WaypointDropdown.Value 
        local selGroup = Options.GroupDropdown.Value or "Default" 
        for _, wp in ipairs(waypointGroups[selGroup].waypoints) do 
            if wp.name == selected then moveToTarget(wp.pos); break end 
        end 
    end 
}) 
WaypointGroupsBox:AddButton({ 
    Text = "Delete Selected", 
    Func = function() 
        if not checkKeyGlobal() then return end 
        local selected = Options.WaypointDropdown.Value 
        local selGroup = Options.GroupDropdown.Value or "Default" 
        local wps = waypointGroups[selGroup].waypoints 
        for i, wp in ipairs(wps) do 
            if wp.name == selected then 
                if wp.marker then wp.marker:Destroy() end 
                table.remove(wps, i) 
                break 
            end 
        end 
        if waypointIndex > #wps then waypointIndex = 1 end 
        refreshWaypointDropdown() 
    end 
})

Options.GroupDropdown:OnChanged(function() 
    local selGroup = Options.GroupDropdown.Value or "Default" 
    if waypointGroups[selGroup] then 
        Options.GroupColorPicker:SetValue(waypointGroups[selGroup].color) 
        refreshWaypointDropdown() 
        waypointIndex = 1 
    end 
end)

AutoTpBox:AddToggle("AutoTpToggle", { 
    Text = "Enable Auto TP", 
    Default = false, 
    Callback = function(V) 
        if V and not checkKeyGlobal() then task.spawn(function() Toggles.AutoTpToggle:SetValue(false) end) elseif not V then stopPathfinding() end 
    end 
}) 
AutoTpBox:AddToggle("UseGroupTpToggle", { 
    Text = "Use selected Waypoint Group", 
    Default = false, 
    Callback = function(V) 
        if V and not checkKeyGlobal() then task.spawn(function() Toggles.UseGroupTpToggle:SetValue(false) end) return end 
        waypointIndex = 1 
    end 
}) 
AutoTpBox:AddButton({ Text = "📱 Create Auto TP Shortcut", Func = function() createShortcut("Auto TP", "AutoTpToggle") end }) 
AutoTpBox:AddInput("AutoTpDelay", { Default = "2", Numeric = true, Finished = true, Text = "Delay (Seconds)", Placeholder = "Seconds between TP" })

PathfindingBox:AddToggle("UsePathfinding", { Text = "Use Pathfinding for TP", Default = false, Callback = function(Value) if not Value then stopPathfinding() end end })

task.spawn(function() 
    while true do 
        task.wait(tonumber(Options.AutoTpDelay.Value) or 2) 
        if keyVerified and Toggles.AutoTpToggle and Toggles.AutoTpToggle.Value then 
            local activeWps = getActiveWaypoints() 
            if #activeWps > 0 then 
                if Toggles.UsePathfinding.Value then 
                    if not pathfindingActive then 
                        if waypointIndex > #activeWps then waypointIndex = 1 end 
                        local target = activeWps[waypointIndex] 
                        moveToTarget(target.pos) 
                        waypointIndex = waypointIndex + 1 
                        if waypointIndex > #activeWps then waypointIndex = 1 end 
                    end 
                else 
                    if waypointIndex > #activeWps then waypointIndex = 1 end 
                    local target = activeWps[waypointIndex] 
                    moveToTarget(target.pos) 
                    waypointIndex = waypointIndex + 1 
                    if waypointIndex > #activeWps then waypointIndex = 1 end 
                end 
            end 
        end 
    end 
end)

-- DEFAULT HIPHEIGHT ERFASSUNG 
local defaultHipHeight = 0 
local function onCharacterAdded(char) 
    task.wait(1)

    -- Waypoints neu setzen
    for groupName, groupData in pairs(waypointGroups) do  
        for _, wp in ipairs(groupData.waypoints) do  
            if wp.marker then wp.marker:Destroy() end  
            wp.marker = createMarker(wp.pos, groupData.color)  
        end  
    end  
    applyWaypointESP()  

    -- Originale HipHeight speichern
    local hum = char:WaitForChild("Humanoid", 5) 
    if hum then 
        defaultHipHeight = hum.HipHeight 
    end 
    watchHumanoid(char) 
end

player.CharacterAdded:Connect(onCharacterAdded) 
if player.Character then 
    task.spawn(function() onCharacterAdded(player.Character) end) 
end

-- 📱 MOBILE CONTROLS GUI GENERATOR 
local mobileGui = Instance.new("ScreenGui") 
mobileGui.Name = "AC_MobileControls" 
mobileGui.Enabled = false 
local successParent = pcall(function() mobileGui.Parent = CoreGui end) 
if not successParent then mobileGui.Parent = player:WaitForChild("PlayerGui") end

local function createControlBtn(name, pos, size, text, keycode) 
    local btn = Instance.new("TextButton", mobileGui) 
    btn.Name = name; btn.Position = pos; btn.Size = size; btn.Text = text; btn.TextScaled = true 
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30); btn.TextColor3 = Color3.fromRGB(255, 255, 255); btn.BackgroundTransparency = 0.5 
    local corner = Instance.new("UICorner", btn) 
    corner.CornerRadius = UDim.new(0.3, 0) 
    btn.MouseButton1Down:Connect(function() if keyVerified then VirtualInputManager:SendKeyEvent(true, keycode, false, game) end end) 
    btn.MouseButton1Up:Connect(function() if keyVerified then VirtualInputManager:SendKeyEvent(false, keycode, false, game) end end) 
    return btn 
end

local btnW = createControlBtn("BtnW", UDim2.new(0, 80, 1, -160), UDim2.new(0, 60, 0, 60), "W", Enum.KeyCode.W) 
local btnA = createControlBtn("BtnA", UDim2.new(0, 10, 1, -90), UDim2.new(0, 60, 0, 60), "A", Enum.KeyCode.A) 
local btnS = createControlBtn("BtnS", UDim2.new(0, 80, 1, -90), UDim2.new(0, 60, 0, 60), "S", Enum.KeyCode.S) 
local btnD = createControlBtn("BtnD", UDim2.new(0, 150, 1, -90), UDim2.new(0, 60, 0, 60), "D", Enum.KeyCode.D) 
local btnJump = createControlBtn("BtnJump", UDim2.new(1, -120, 1, -120), UDim2.new(0, 90, 0, 90), "JUMP", Enum.KeyCode.Space) 
btnJump.BackgroundColor3 = Color3.fromRGB(0, 150, 255)

-- 🖱️ AUTO CLICKER TAB 
local AutoClickerBox = Tabs.AutoClicker:AddLeftGroupbox("Auto Clicker Settings") 
local TesterBox = Tabs.AutoClicker:AddRightGroupbox("Auto Clicker Real CPS")

AutoClickerBox:AddDropdown("AC_Mode", { Values = {"Left Click", "Right Click", "Keyboard Key"}, Default = 1, Multi = false, Text = "Input Mode" }) 
AutoClickerBox:AddInput("AC_Key", { Default = "E", Numeric = false, Finished = true, Text = "Target Key (If Keyboard)", Placeholder = "E, Space, LeftShift..." }) 
AutoClickerBox:AddSlider("AC_CPS", { Text = "Clicks/Presses per Second", Default = 10, Min = 1, Max = 1000000, Rounding = 0 })

AutoClickerBox:AddLabel("⚠️ WARNING: HIGH CPS = LAG / CRASH ⚠️")

local lastACToggle = 0 
local acEnabledTime = 0 
local isRevertingAC = false 
local lockedMousePos = nil

AutoClickerBox:AddToggle("AC_Toggle", { 
    Text = "Enable Auto Clicker", 
    Default = false 
}):OnChanged(function(Value) 
    if isRevertingAC then return end 
    if Value and not checkKeyGlobal() then 
        isRevertingAC = true 
        Toggles.AC_Toggle:SetValue(false) 
        isRevertingAC = false 
        return 
    end 
    if tick() - lastACToggle < 1 then 
        Library:Notify({ Title = "Cooldown", Description = "Please wait 1 second between toggles.", Time = 1.5 }) 
        isRevertingAC = true 
        Toggles.AC_Toggle:SetValue(not Value) 
        isRevertingAC = false 
        return 
    end 
    lastACToggle = tick() 
    if Value then 
        acEnabledTime = tick() 
        mobileGui.Enabled = true 
        lockedMousePos = nil 
    else 
        mobileGui.Enabled = false 
        lockedMousePos = nil 
    end 
end) 
AutoClickerBox:AddButton({ Text = "📱 Create Clicker Shortcut", Func = function() createShortcut("Autoclick", "AC_Toggle") end })

local actualAutoClicks = 0 
local realCpsLabel = TesterBox:AddLabel("Bot is clicking: 0 CPS")

task.spawn(function() 
    while true do 
        task.wait(1) 
        if realCpsLabel and realCpsLabel.SetText then 
            if Toggles.AC_Toggle and Toggles.AC_Toggle.Value and (tick() - acEnabledTime >= 1) and keyVerified then 
                realCpsLabel:SetText("Bot is clicking: " .. tostring(actualAutoClicks) .. " CPS") 
            else 
                realCpsLabel:SetText("Bot is clicking: 0 CPS") 
            end 
        end 
        actualAutoClicks = 0 
    end 
end)

local function getRobustKeyCode(keyString) 
    if type(keyString) ~= "string" or keyString == "" then return nil end 
    local searchStr = keyString:gsub("%s+", ""):lower() 
    for _, key in pairs(Enum.KeyCode:GetEnumItems()) do 
        if key.Name:lower() == searchStr then return key end 
    end 
    return nil 
end

task.spawn(function() 
    while true do 
        local targetCps = Options.AC_CPS.Value or 10 
        local mode = Options.AC_Mode.Value 
        if targetCps <= 60 then task.wait(1 / targetCps) else task.wait() end

        if keyVerified and Toggles.AC_Toggle and Toggles.AC_Toggle.Value then 
            if tick() - acEnabledTime >= 1 then 
                if not lockedMousePos then lockedMousePos = UserInputService:GetMouseLocation() end 
                local clicksThisFrame = targetCps <= 60 and 1 or math.floor(targetCps / 60) 
                
                for i = 1, clicksThisFrame do 
                    if mode == "Left Click" then 
                        VirtualInputManager:SendMouseButtonEvent(lockedMousePos.X, lockedMousePos.Y, 0, true, game, 0) 
                        VirtualInputManager:SendMouseButtonEvent(lockedMousePos.X, lockedMousePos.Y, 0, false, game, 0) 
                    elseif mode == "Right Click" then 
                        VirtualInputManager:SendMouseButtonEvent(lockedMousePos.X, lockedMousePos.Y, 1, true, game, 0) 
                        VirtualInputManager:SendMouseButtonEvent(lockedMousePos.X, lockedMousePos.Y, 1, false, game, 0) 
                    elseif mode == "Keyboard Key" then 
                        local keyCode = getRobustKeyCode(Options.AC_Key.Value) 
                        if keyCode then 
                            VirtualInputManager:SendKeyEvent(true, keyCode, false, game) 
                            if targetCps <= 60 then task.wait(0.01) end 
                            VirtualInputManager:SendKeyEvent(false, keyCode, false, game) 
                        end 
                    end 
                    actualAutoClicks = actualAutoClicks + 1 
                end 
            end 
        else 
            lockedMousePos = nil 
        end 
    end 
end)

-- ☀️ FULLBRIGHT TAB 
local FbBox = Tabs.Fullbright:AddLeftGroupbox("Fullbright Settings") 
FbBox:AddToggle("FbMasterToggle", { Text = "Enable Fullbright", Default = false, Callback = function(V) if V and not checkKeyGlobal() then task.spawn(function() Toggles.FbMasterToggle:SetValue(false) end) end end }) 
FbBox:AddToggle("AutoFbToggle", { Text = "Auto Fullbright (Night)", Default = false, Callback = function(V) if V and not checkKeyGlobal() then task.spawn(function() Toggles.AutoFbToggle:SetValue(false) end) end end }) 
FbBox:AddToggle("NoShadowsToggle", { Text = "Disable Shadows", Default = false, Callback = function(V) if V and not checkKeyGlobal() then task.spawn(function() Toggles.NoShadowsToggle:SetValue(false) end) end end }) 
FbBox:AddToggle("NoFogToggle", { Text = "Disable Fog", Default = false, Callback = function(V) if V and not checkKeyGlobal() then task.spawn(function() Toggles.NoFogToggle:SetValue(false) end) end end }) 
FbBox:AddButton({ Text = "📱 Create Fullbright Shortcut", Func = function() createShortcut("Fullbright", "FbMasterToggle") end }) 
FbBox:AddButton({ Text = "📱 Create Auto Bright Shortcut", Func = function() createShortcut("Auto Bright", "AutoFbToggle") end })

RunService.RenderStepped:Connect(function() 
    if not keyVerified then return end 
    if Toggles.FbMasterToggle and Toggles.FbMasterToggle.Value then 
        Lighting.Brightness = 3; Lighting.Ambient = Color3.new(1,1,1); Lighting.OutdoorAmbient = Color3.new(1,1,1); Lighting.ClockTime = 14 
    elseif Toggles.AutoFbToggle and Toggles.AutoFbToggle.Value then 
        if Lighting.ClockTime <= 6 or Lighting.ClockTime >= 18 then 
            Lighting.Brightness = 3; Lighting.Ambient = Color3.new(1,1,1); Lighting.OutdoorAmbient = Color3.new(1,1,1) 
        end 
    end 
    if Toggles.NoShadowsToggle and Toggles.NoShadowsToggle.Value then Lighting.GlobalShadows = false end 
    if Toggles.NoFogToggle and Toggles.NoFogToggle.Value then Lighting.FogEnd = 100000 end 
end)

-- 🧰 MISCELLANEOUS TAB 
local WalkflingBox = Tabs.Misc:AddLeftGroupbox("Walkfling") 
local NoVoidBox = Tabs.Misc:AddLeftGroupbox("No Void") 
local GodModeBox = Tabs.Misc:AddRightGroupbox("God Mode")

-- 1. Walkfling (IY-Style) 
local isFlinging = false

local function doIYWalkFling() 
    local c, hrp, vel, movel = nil, nil, nil, 0.1 
    while isFlinging do 
        RunService.Heartbeat:Wait() 
        c = player.Character 
        hrp = c and c:FindFirstChild("HumanoidRootPart") 
        if hrp then 
            vel = hrp.Velocity 
            hrp.Velocity = Vector3.new(0, 10000, 0) * 100 
            RunService.RenderStepped:Wait() 
            hrp.Velocity = vel 
            RunService.Stepped:Wait() 
            hrp.Velocity = vel + Vector3.new(0, movel, 0) 
            movel = -movel 
        end 
    end 
end

WalkflingBox:AddToggle("WalkflingToggle", { 
    Text = "Walkfling", 
    Default = false 
}):OnChanged(function(V) 
    if V and not checkKeyGlobal() then 
        task.spawn(function() Toggles.WalkflingToggle:SetValue(false) end) 
        return 
    end 
    isFlinging = V 
    if V then 
        task.spawn(doIYWalkFling) 
    end 
end) 
WalkflingBox:AddButton({ Text = "📱 Create Walkfling Shortcut", Func = function() createShortcut("Walkfling", "WalkflingToggle") end })

-- 2. No Void (Part / Unsichtbarer Boden) 
local voidPart = nil

NoVoidBox:AddToggle("NoVoidToggle", { 
    Text = "No Void", 
    Default = false 
}):OnChanged(function(V) 
    if V and not checkKeyGlobal() then 
        task.spawn(function() Toggles.NoVoidToggle:SetValue(false) end) 
        return 
    end 
    
    if V then 
        if not voidPart then 
            voidPart = Instance.new("Part") 
            voidPart.Name = "RailHub_NoVoid" 
            voidPart.Anchored = true 
            voidPart.CanCollide = true 
            voidPart.Transparency = 1 
            voidPart.Size = Vector3.new(100000, 5, 100000) 
            
            local destroyHeight = workspace.FallenPartsDestroyHeight 
            voidPart.Position = Vector3.new(0, destroyHeight + 50, 0) 
            voidPart.Parent = workspace 
        end 
    else 
        if voidPart then 
            voidPart:Destroy() 
            voidPart = nil 
        end 
    end 
end) 
NoVoidBox:AddButton({ Text = "📱 Create No Void Shortcut", Func = function() createShortcut("No Void", "NoVoidToggle") end })

-- 3. God Mode + HipHeight & Slider-Automatisierung (Key-geschützt) 
local godModeFirstRun = true

GodModeBox:AddToggle("GodModeToggle", { 
    Text = "God Mode (Anti-Void/Kill)", 
    Default = false 
}):OnChanged(function(V) 
    if V and not checkKeyGlobal() then 
        task.spawn(function() Toggles.GodModeToggle:SetValue(false) end) 
        return 
    end 
    if not keyVerified then return end

    if V and godModeFirstRun and Options.HipHeightSlider then 
        Options.HipHeightSlider:SetValue(2) 
        godModeFirstRun = false 
    end

    local char = player.Character 
    local hum = char and char:FindFirstChildOfClass("Humanoid") 
    if hum then 
        if not V then 
            hum:SetStateEnabled(Enum.HumanoidStateType.Dead, true) 
            hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true) 
            hum.HipHeight = defaultHipHeight 
        end 
    end 
end) 
GodModeBox:AddButton({ Text = "📱 Create God Mode Shortcut", Func = function() createShortcut("God Mode", "GodModeToggle") end }) 
GodModeBox:AddSlider("HipHeightSlider", { Text = "Hip Height", Default = 0, Min = 0, Max = 50, Rounding = 1 })

RunService.RenderStepped:Connect(function() 
    if not keyVerified then return end 
    if Toggles.GodModeToggle and Toggles.GodModeToggle.Value then 
        local char = player.Character 
        local hum = char and char:FindFirstChildOfClass("Humanoid") 
        if hum then 
            hum:SetStateEnabled(Enum.HumanoidStateType.Dead, false) 
            hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)

            if Options.HipHeightSlider then 
                hum.HipHeight = Options.HipHeightSlider.Value 
            end 
        end 
    end 
end)

-- ⚙️ SETTINGS TAB & THEME MANAGER FIX 
local MenuGroup = Tabs.Settings:AddLeftGroupbox("Menu") 
MenuGroup:AddButton("Unload", function() Library:Unload() end) 
MenuGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", { Default = "RightShift", NoUI = true, Text = "Menu keybind" })

MenuGroup:AddDivider() 
MenuGroup:AddButton("Delete Saved Key", function() 
    if isfile and isfile(keyFileName) then 
        if delfile then 
            pcall(function() delfile(keyFileName) end) 
            Library:Notify({ Title = "Key System", Description = "Key deleted! Restart script to apply.", Time = 4 }) 
        elseif writefile then 
            pcall(function() writefile(keyFileName, "") end) 
            Library:Notify({ Title = "Key System", Description = "Key cleared! Restart script to apply.", Time = 4 }) 
        end 
    else 
        Library:Notify({ Title = "Key System", Description = "No saved key found.", Time = 3 }) 
    end 
end)

Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library) 
SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings() 
SaveManager:SetIgnoreIndexes({"MenuKeybind"}) 
ThemeManager:SetFolder("UniversalRailHub") 
SaveManager:SetFolder("UniversalRailHub/configs")

SaveManager:BuildConfigSection(Tabs.Settings) 
ThemeManager:ApplyToTab(Tabs.Settings)

-- 🚀 AUTO LOGIN 
task.spawn(function() 
    task.wait(2) 
    checkSavedKey() 
end)

