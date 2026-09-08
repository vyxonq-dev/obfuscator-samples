local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local TweenService = game:GetService("TweenService")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")
local Lighting = game:GetService("Lighting")

repeat
    task.wait()
until game:IsLoaded()

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

WindUI:AddTheme({
    Name = "Dark",
    Accent = "#18181b",
    Dialog = "#18181b",
    Outline = "#FFFFFF",
    Text = "#FFFFFF",
    Placeholder = "#999999",
    Background = "#0e0e10",
    Button = "#52525b",
    Icon = "#a1a1aa",
})
WindUI:AddTheme({
    Name = "Light",
    Accent = "#f4f4f5",
    Dialog = "#f4f4f5",
    Outline = "#000000",
    Text = "#000000",
    Placeholder = "#666666",
    Background = "#ffffff",
    Button = "#e4e4e7",
    Icon = "#52525b",
})
WindUI:AddTheme({
    Name = "Gray",
    Accent = "#374151",
    Dialog = "#374151",
    Outline = "#d1d5db",
    Text = "#f9fafb",
    Placeholder = "#9ca3af",
    Background = "#1f2937",
    Button = "#4b5563",
    Icon = "#d1d5db",
})
WindUI:AddTheme({
    Name = "Blue",
    Accent = "#1e40af",
    Dialog = "#1e3a8a",
    Outline = "#93c5fd",
    Text = "#f0f9ff",
    Placeholder = "#60a5fa",
    Background = "#1e293b",
    Button = "#3b82f6",
    Icon = "#93c5fd",
})
WindUI:AddTheme({
    Name = "Green",
    Accent = "#059669",
    Dialog = "#047857",
    Outline = "#6ee7b7",
    Text = "#ecfdf5",
    Placeholder = "#34d399",
    Background = "#064e3b",
    Button = "#10b981",
    Icon = "#6ee7b7",
})
WindUI:AddTheme({
    Name = "Purple",
    Accent = "#7c3aed",
    Dialog = "#6d28d9",
    Outline = "#c4b5fd",
    Text = "#faf5ff",
    Placeholder = "#a78bfa",
    Background = "#581c87",
    Button = "#8b5cf6",
    Icon = "#c4b5fd",
})

WindUI:SetNotificationLower(true)

local ThemeList = {
    "Dark",
    "Light",
    "Gray",
    "Blue",
    "Green",
    "Purple"
}
local ThemeIndex = 1

if not getgenv().TransparencyEnabled then
    getgenv().TransparencyEnabled = false
end

StarterGui:SetCore("SendNotification", {
    Title = "Fenthub",
    Text = "Toggle Keybind: ( R )",
    Duration = 30,
    Icon = "rbxassetid://139609729426886",
})

loadstring(game:HttpGet("https://pastefy.app/ZQtMnR66/raw"))()

local MainWindow = WindUI:CreateWindow({
    Title = "Fenthub",
    Icon = "zap",
    Author = "The Strongest Battle Grounds",
    Folder = "Fenthub",
    Size = UDim2.fromOffset(500, 350),
    Transparent = getgenv().TransparencyEnabled,
    Theme = "Dark",
    Resizable = true,
    SideBarWidth = 150,
    BackgroundImageTransparency = 0.8,
    HideSearchBar = false,
    ScrollBarEnabled = true,
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function()
            ThemeIndex = ThemeIndex + 1
            if ThemeIndex > #ThemeList then
                ThemeIndex = 1
            end
            local newTheme = ThemeList[ThemeIndex]
            WindUI:SetTheme(newTheme)
            WindUI:Notify({
                Title = "Theme Changed",
                Content = "Switched to " .. newTheme .. " theme!",
                Duration = 2,
                Icon = "palette",
            })
            print("Switched to " .. newTheme .. " theme")
        end,
    },
})

pcall(function()
    MainWindow:CreateTopbarButton("TransparencyToggle", "eye", function()
        if getgenv().TransparencyEnabled then
            getgenv().TransparencyEnabled = false
            pcall(function()
                MainWindow:ToggleTransparency(false)
            end)
            WindUI:Notify({
                Title = "Transparency",
                Content = "Transparency disabled",
                Duration = 3,
                Icon = "eye",
            })
            print("Transparency = false")
        else
            getgenv().TransparencyEnabled = true
            pcall(function()
                MainWindow:ToggleTransparency(true)
            end)
            WindUI:Notify({
                Title = "Transparency",
                Content = "Transparency enabled",
                Duration = 3,
                Icon = "eye-off",
            })
            print(" Transparency = true")
        end
        print("Debug - Current Transparency state:", getgenv().TransparencyEnabled)
    end, 990)
end)

loadstring(game:HttpGet("https://pastefy.app/hcVkWhQF/raw"))()

MainWindow:EditOpenButton({
    Title = "Fenthub",
    CornerRadius = UDim.new(0, 6),
    StrokeThickness = 2,
    Color = ColorSequence.new(Color3.fromRGB(30, 30, 30), Color3.fromRGB(255, 255, 255)),
    Draggable = true,
})
MainWindow.ToggleKey = Enum.KeyCode.R

local Tabs = {
    Main = MainWindow:Tab({ Title = "Main", Icon = "eye", Desc = "Fenthub" }),
    Misc = MainWindow:Tab({ Title = "Misc", Icon = "sparkles", Desc = "Fenthub" }),
    Fight = MainWindow:Tab({ Title = "Fighting", Icon = "sword", Desc = "Fenthub" }),
    Tech = MainWindow:Tab({ Title = "Tech", Icon = "wrench", Desc = "Fenthub" }),
    Lag = MainWindow:Tab({ Title = "Lag-Ping", Icon = "leaf", Desc = "Fenthub" }),
    Anim = MainWindow:Tab({ Title = "Animations", Icon = "package", Desc = "Fenthub" }),
    Place = MainWindow:Tab({ Title = "Places", Icon = "map", Desc = "Fenthub" }),
    Moveset = MainWindow:Tab({ Title = "Moveset", Icon = "star", Desc = "Fenthub" }),
    Fling = MainWindow:Tab({ Title = "Fling", Icon = "user", Desc = "Fenthub" }),
    Info = MainWindow:Tab({ Title = "Information", Icon = "badge-info", Desc = "Fenthub" }),
}
MainWindow:SelectTab(10)

Tabs.Main:Button({
    Title = "Copy Discord Link (join for more info)",
    Locked = false,
    Callback = function()
        setclipboard("https://discord.gg/xpSsT7GVM4")
    end,
})

Tabs.Main:Section({ Title = "Autos", Icon = "star" })

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local Animator = Humanoid:FindFirstChildOfClass("Animator")

local VoidTargetPosition = Vector3.new(150, -495, 30)
local AutoVoidEnabled = false
local IsVoiding = false
local ReturnOldPos = false
local AutoWhirlwindDunk = false
local AutoWallCombo = false
local AntiInvisibility = false
local EspDeathCounter = false
local EspUltBar = false
local EspEveryone = false
local SpeedEnabled = false
local FakeDownslam = false
local SpeedValue = 9
local JumpValue = 200

local WallComboAddedConnection = nil
local WallComboAnimConnection = nil
local AntiAfkConnection = nil
local SpeedLoop = nil
local JumpLoop = nil
local EspConnections = {}

local WhirlwindAnimationId = "rbxassetid://12296113986"
local InvisibilityAnimIds = {
    ["136370737633649"] = true,
    ["18182425133"] = true,
    ["18236605028"] = true,
}
local WallComboAnimIds = {
    ["rbxassetid://17325537719"] = true,
    ["rbxassetid://10469643643"] = true,
    ["rbxassetid://13294471966"] = true,
    ["rbxassetid://13295936866"] = true,
    ["rbxassetid://13378708199"] = true,
    ["rbxassetid://14136436157"] = true,
    ["rbxassetid://15162694192"] = true,
    ["rbxassetid://16552234590"] = true,
    ["rbxassetid://17889290569"] = true,
}
local RoastMessages = {
    "Pathetic", "Nice try, loser", "Git gud", "You're a noob", "Did you even try?",
    "Keep dying, it's amusing", "Too easy", "Better luck next time", "That was embarrassing",
    "You're just feeding my kills", "Can't handle the pressure?", "You call that playing?",
    "LOL, what a scrub", "Go cry to your mommy", "Just uninstall.", "I'm not even trying.",
    "Get rekt, scrub", "You're a joke", "Just stop trying.", "Noob alert",
    "Stay in the kiddie pool", "Did someone forget their skills?", "Do you need a tutorial?",
    "You make this too easy.", "You're not even worth my time.", "I've seen toddlers play better.",
    "You're a respawn machine", "You're like a training dummy.", "Did you pay to be this bad?",
    "Even the NPCs play better than you.", "You must be allergic to victory.",
    "Your gameplay is a tutorial on how not to play.", "I bet you're proud of that death streak.",
    "You're the MVP of feeding kills.", "You're like a pinata... full of free kills.",
    "You're like a legend... in dying.", "Do you think dying is a tactic?", "What The Sigma.",
    "Ez Kill LOL", "hehe cry more"
}

local function UpdateCharacter(newCharacter)
    Character = newCharacter
    Humanoid = Character:WaitForChild("Humanoid")
    Animator = Humanoid:FindFirstChildOfClass("Animator")
end

local AutoVoidAnimations = {
    { id = "12273188754", timewait = 0.5 },
    { id = "12296113986", timewait = 0.5 },
    { id = "15145462680", timewait = 1.5 },
    { id = "16139108718", timewait = 0.1 },
    { id = "17889080495", timewait = 0 },
    { id = "14705929107", timewait = 1.3 },
    { id = "14701242661", timewait = 3 },
    { id = "14920779925", timewait = 0.2 },
    { id = "16062712948", timewait = 1 }
}

local function onAnimationPlayed_AutoVoid(animTrack)
    if not AutoVoidEnabled or IsVoiding then return end
    local animation = animTrack.Animation
    if not animation then return end
    
    for _, animData in ipairs(AutoVoidAnimations) do
        if animation.AnimationId == "rbxassetid://" .. animData.id then
            IsVoiding = true
            if not Character or not Character.Parent or not Humanoid or Humanoid.Health <= 0 then
                IsVoiding = false
                return
            end
            local rootPart = Character:FindFirstChild("HumanoidRootPart")
            if not rootPart then
                IsVoiding = false
                return
            end
            local oldCFrame = rootPart.CFrame
            task.wait(animData.timewait)
            if Character and Character.Parent and AutoVoidEnabled and Humanoid.Health > 0 then
                rootPart.CFrame = CFrame.new(VoidTargetPosition)
                animTrack.Stopped:Wait()
                if Character and Character.Parent and AutoVoidEnabled and ReturnOldPos and Humanoid.Health > 0 then
                    rootPart.CFrame = oldCFrame
                end
            end
            IsVoiding = false
            break
        end
    end
end

local function InitAutoVoid(char)
    Character = char
    Humanoid = Character:WaitForChild("Humanoid")
    Animator = Humanoid:FindFirstChildOfClass("Animator")
    if Animator then
        Animator.AnimationPlayed:Connect(onAnimationPlayed_AutoVoid)
    end
end

LocalPlayer.CharacterAdded:Connect(InitAutoVoid)
Workspace.FallenPartsDestroyHeight = -math.huge

Tabs.Main:Dropdown({
    Title = "Select Place",
    Desc = "Where Do You Want It To Auto Place To?",
    Value = "Void",
    Multi = false,
    Callback = function(value)
        if value == "Map" then VoidTargetPosition = Vector3.new(150, 505, 30)
        elseif value == "Pixel" then VoidTargetPosition = Vector3.new(30000000, 30000000, 30000000)
        elseif value == "Void" then VoidTargetPosition = Vector3.new(150, -495, 30)
        elseif value == "Darkness" then VoidTargetPosition = Vector3.new(0, 900000000002, 0)
        elseif value == "Mountain" then VoidTargetPosition = Vector3.new(155.577392578125, 628.742431640625, -447.93841552734375)
        elseif value == "Counter" then VoidTargetPosition = Vector3.new(-68, 29, 20346)
        elseif value == "Atomic Base" then VoidTargetPosition = Vector3.new(1063, 30, 23006)
        elseif value == "Atomic Base Up" then VoidTargetPosition = Vector3.new(1063, 405, 23006)
        elseif value == "Atomic Slash" then VoidTargetPosition = Vector3.new(1063, 131, 23006)
        elseif value == "Prison" then VoidTargetPosition = Vector3.new(438, 439, -376)
        end
    end,
    Options = { "Map", "Pixel", "Void", "Darkness", "Mountain", "Counter", "Atomic Base", "Atomic Base Up", "Atomic Slash", "Prison" }
})

Tabs.Main:Toggle({
    Title = "Auto Void/Place",
    Value = false,
    Callback = function(state)
        AutoVoidEnabled = state
    end
})

Tabs.Main:Toggle({
    Title = "Tp Back Old Pos",
    Value = false,
    Callback = function(state)
        ReturnOldPos = state
    end
})

if Animator then
    Animator.AnimationPlayed:Connect(onAnimationPlayed_AutoVoid)
end

Tabs.Main:Toggle({
    Title = "Auto Whirlwind Dunk",
    Value = false,
    Callback = function(state)
        AutoWhirlwindDunk = state
    end
})

local function onAnimationPlayed_Whirlwind(track)
    if AutoWhirlwindDunk and track.Animation.AnimationId == WhirlwindAnimationId then
        task.wait(1.2)
        local root = Character:FindFirstChild("HumanoidRootPart")
        if root then
            local pos = root.Position
            root.CFrame = CFrame.new(pos.X, pos.Y + 100, pos.Z)
        end
    end
end

local function TriggerWallComboQ()
    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Q, false, game)
    task.wait(0.1)
    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Q, false, game)
end

local function HandleWallComboAnim(track, char)
    if not AutoWallCombo or not track.Animation then return end
    if WallComboAnimIds[track.Animation.AnimationId] then
        local root = char:FindFirstChild("HumanoidRootPart")
        if root then
            local originalCF = root.CFrame
            local startTime = tick()
            local connection
            connection = RunService.Heartbeat:Connect(function()
                if not AutoWallCombo or tick() - startTime >= 0.3 then
                    if root and root.Parent then
                        root.CFrame = originalCF
                    end
                    connection:Disconnect()
                elseif root and root.Parent then
                    root.CFrame = originalCF * CFrame.Angles(math.rad(-25), 0, 0)
                end
            end)
        end
    end
end

local function SetupWallComboDetection(char)
    if WallComboAddedConnection then WallComboAddedConnection:Disconnect() end
    if WallComboAnimConnection then WallComboAnimConnection:Disconnect() end

    WallComboAddedConnection = char.DescendantAdded:Connect(function(descendant)
        if descendant:IsA("ObjectValue") and descendant.Name:lower() == "wallcombo" and AutoWallCombo then
            local startTime = tick()
            while true do
                TriggerWallComboQ()
                task.wait()
                if descendant.Parent then
                    local parent = descendant.Parent
                    if parent == char then
                        local elapsed = tick() - startTime
                        if elapsed >= (descendant:GetAttribute("DeleteMe") or 0.6) then
                            break
                        end
                    else
                        break
                    end
                else
                    break
                end
            end
        end
    end)

    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then
        WallComboAnimConnection = hum.AnimationPlayed:Connect(function(track)
            HandleWallComboAnim(track, char)
        end)
    end
end

Tabs.Main:Toggle({
    Title = "Auto WallCombo + WallCombo Everywhere",
    Value = false,
    Callback = function(state)
        AutoWallCombo = state
        if state then
            if LocalPlayer.Character then
                SetupWallComboDetection(LocalPlayer.Character)
            end
        else
            if WallComboAddedConnection then WallComboAddedConnection:Disconnect() end
            if WallComboAnimConnection then WallComboAnimConnection:Disconnect() end
        end
    end
})

Tabs.Main:Section({ Title = "Antis", Icon = "settings" })

Tabs.Main:Toggle({
    Title = "Anti Invisibility",
    Value = false,
    Callback = function(state)
        AntiInvisibility = state
    end
})

RunService.RenderStepped:Connect(function()
    if not AntiInvisibility then return end
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local hum = player.Character:FindFirstChildOfClass("Humanoid")
            local animator = hum and hum:FindFirstChildOfClass("Animator")
            if animator then
                for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
                    local id = track.Animation and track.Animation.AnimationId:gsub("rbxassetid://", "")
                    if id and InvisibilityAnimIds[id] then
                        track:Stop()
                    end
                end
            end
        end
    end
end)

local DeathCounterAnimId = "rbxassetid://1234567890"
local AntiDeathCounterEnabled = false

local function StartAntiDeathCounter()
    AntiDeathCounterEnabled = true
    task.spawn(function()
        local isTeleporting = false
        local originalPos = nil
        local safePos = Vector3.new(1000, -499, 1000)
        local cam = Workspace.CurrentCamera
        
        while AntiDeathCounterEnabled do
            task.wait()
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                local animator = char:FindFirstChildOfClass("Animator")
                if animator then
                    for _, track in pairs(animator:GetPlayingAnimationTracks()) do
                        if track.Animation.AnimationId == DeathCounterAnimId and not isTeleporting then
                            task.wait(0.5)
                            isTeleporting = true
                            originalPos = char.HumanoidRootPart.Position
                            track.Stopped:Connect(function()
                                isTeleporting = false
                            end)
                            
                            repeat
                                task.wait()
                                char.HumanoidRootPart.CFrame = CFrame.new(safePos)
                                task.wait(4)
                                char.HumanoidRootPart.CFrame = CFrame.new(originalPos)
                                task.wait(0.1)
                            until not isTeleporting
                            
                            cam.CameraType = Enum.CameraType.Custom
                            LocalPlayer.CameraMode = Enum.CameraMode.Classic
                        end
                    end
                end
            end
        end
    end)
end

Tabs.Main:Toggle({
    Title = "Anti Death Counter",
    Value = false,
    Callback = function(state)
        if state then
            StartAntiDeathCounter()
        else
            AntiDeathCounterEnabled = false
        end
    end
})

Tabs.Main:Toggle({
    Title = "Anti-AFK",
    Value = false,
    Callback = function(state)
        if state then
            if AntiAfkConnection then AntiAfkConnection:Disconnect() end
            AntiAfkConnection = LocalPlayer.Idled:Connect(function()
                VirtualUser:Button2Down(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
                task.wait(10)
                VirtualUser:Button2Up(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
            end)
        elseif AntiAfkConnection then
            AntiAfkConnection:Disconnect()
            AntiAfkConnection = nil
        end
    end
})

Tabs.Main:Section({ Title = "OP", Icon = "eye" })

Tabs.Main:Button({
    Title = "Fenthub Mini",
    Desc = "First version of the Fenthub but rly usefull",
    Locked = true,
    Callback = function()
        loadstring(game:HttpGet("https://pandadevelopment.net/virtual/file/187a02764b1ad1a4"))()
    end,
})

Tabs.Main:Button({
    Title = "Free Private Server",
    Desc = "you can farm kills in this Private server when you invite your frends",
    Locked = true,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/JYJEBr16/raw"))()
    end,
})

Tabs.Main:Toggle({
    Title = "No Dash Cool Down",
    Value = true,
    Callback = function(state)
        local value = state and 0 or 1
        Workspace:SetAttribute("EffectAffects", value)
        Workspace:SetAttribute("NoDashCooldown", state)
    end
})

local InvisiblePlayer = Players.LocalPlayer
local InvisibleChar = InvisiblePlayer.Character or InvisiblePlayer.CharacterAdded:Wait()
local InvisibleHum = InvisibleChar:WaitForChild("Humanoid")
local InvisibleAnimator = InvisibleHum:FindFirstChildOfClass("Animator")
local InvisAnimId = "rbxassetid://136370737633649"
local InvisTrack = nil
local InvisibilityEnabled = false

local function SetCharacterTransparency(transparency)
    if InvisibleChar then
        for _, partName in ipairs({"Head", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg"}) do
            local part = InvisibleChar:FindFirstChild(partName)
            if part and part:IsA("BasePart") then
                part.Transparency = transparency
            end
        end
    end
end

local function PlayInvisAnim()
    if not InvisTrack or not InvisTrack.IsPlaying then
        local anim = Instance.new("Animation")
        anim.AnimationId = InvisAnimId
        InvisTrack = InvisibleAnimator:LoadAnimation(anim)
        InvisTrack:Play()
        InvisTrack.TimePosition = 4.56
        InvisTrack:AdjustSpeed(0)
    end
end

local function StopInvisAnim()
    if InvisTrack and InvisTrack.IsPlaying then
        InvisTrack:Stop()
        InvisTrack = nil
    end
end

Tabs.Main:Toggle({
    Title = "Invisiblity",
    Value = false,
    Callback = function(state)
        InvisibilityEnabled = state
        if InvisibilityEnabled then
            SetCharacterTransparency(0.5)
        else
            SetCharacterTransparency(0)
            StopInvisAnim()
        end
    end
})

RunService.RenderStepped:Connect(function()
    if InvisibilityEnabled and InvisTrack and InvisTrack.IsPlaying then
        StopInvisAnim()
    end
end)

RunService.Heartbeat:Connect(function()
    if InvisibilityEnabled then
        PlayInvisAnim()
    end
end)

InvisiblePlayer.CharacterAdded:Connect(function(char)
    InvisibleChar = char
    InvisibleHum = InvisibleChar:WaitForChild("Humanoid")
    InvisibleAnimator = InvisibleHum:FindFirstChildOfClass("Animator")
    InvisibleHum.Died:Connect(function()
        if InvisibilityEnabled then StopInvisAnim() end
    end)
    if InvisibilityEnabled then
        SetCharacterTransparency(0.5)
        PlayInvisAnim()
    end
end)

Tabs.Main:Section({ Title = "ESP", Icon = "package" })

local function UpdateDeathCounterEsp()
    for _, player in pairs(Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("Counter") and not player:FindFirstChild("SkullBillboard") then
            local head = player.Character:FindFirstChild("Head")
            if head then
                local bg = Instance.new("BillboardGui", head)
                bg.Size = UDim2.new(5, 0, 5, 0)
                bg.Adornee = head
                bg.AlwaysOnTop = true
                
                local label = Instance.new("TextLabel", bg)
                label.Size = UDim2.new(1, 0, 1, 0)
                label.Text = "💀"
                label.TextSize = 50
                label.BackgroundTransparency = 1
                label.TextColor3 = Color3.fromRGB(200, 200, 200)
                
                local tag = Instance.new("ObjectValue", player)
                tag.Name = "SkullBillboard"
                tag.Value = bg
            end
        elseif player:FindFirstChild("SkullBillboard") then
            player.SkullBillboard.Value:Destroy()
            player.SkullBillboard:Destroy()
        end
    end
end

Tabs.Main:Toggle({
    Title = "Esp Death Counter",
    Value = false,
    Callback = function(state)
        EspDeathCounter = state
        if state then
            task.spawn(function()
                while EspDeathCounter do
                    UpdateDeathCounterEsp()
                    task.wait(1)
                end
            end)
        end
    end
})

local function AddUltTag(char, player)
    if not EspUltBar then return end
    local head = char:FindFirstChild("Head")
    if not head or head:FindFirstChild("UltimateTag") then return end
    
    local bg = Instance.new("BillboardGui", head)
    bg.Name = "UltimateTag"
    bg.Size = UDim2.new(0, 150, 0, 70)
    bg.StudsOffset = Vector3.new(0, 4, 0)
    bg.AlwaysOnTop = true
    bg.Adornee = head
    
    local label = Instance.new("TextLabel", bg)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 0.8
    label.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    label.TextColor3 = Color3.fromRGB(255, 255, 0)
    label.TextScaled = true
    label.Font = Enum.Font.FredokaOne
    label.TextStrokeTransparency = 0.5
    label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    
    local function UpdateUltText()
        local ultValue = player:GetAttribute("Ultimate")
        label.Text = ultValue and ("ULT: " .. tostring(math.floor(ultValue))) or "ULT: N/A"
    end
    
    UpdateUltText()
    player:GetAttributeChangedSignal("Ultimate"):Connect(UpdateUltText)
end

local function InitUltEsp(player)
    player.CharacterAdded:Connect(function(char)
        task.wait(1)
        if char then AddUltTag(char, player) end
    end)
    if player.Character then AddUltTag(player.Character, player) end
end

Tabs.Main:Toggle({
    Title = "Esp Ult Bar",
    Value = false,
    Callback = function(state)
        EspUltBar = state
        for _, player in pairs(Players:GetPlayers()) do
            if player.Character then
                if state then
                    AddUltTag(player.Character, player)
                else
                    local tag = player.Character:FindFirstChild("Head") and player.Character.Head:FindFirstChild("UltimateTag")
                    if tag then tag:Destroy() end
                end
            end
        end
    end
})

local function CreatePlayerEsp(player, char)
    if not EspEveryone then return end
    local hum = char:WaitForChild("Humanoid")
    local head = char:WaitForChild("Head")
    
    local textDrawing = Drawing.new("Text")
    textDrawing.Visible = false
    textDrawing.Center = true
    textDrawing.Outline = true
    textDrawing.Font = 3
    textDrawing.Size = 18
    textDrawing.Color = Color3.fromRGB(255, 255, 255)
    
    local function GetEspText()
        local ping = math.floor(player:GetAttribute("Ping") or 0)
        local device = player:GetAttribute("Mobile") and "Mobile" or "PC"
        local streak = 0
        local liveFolder = Workspace.Live:FindFirstChild(player.Name)
        if liveFolder then
            streak = Workspace.Live[player.Name]:GetAttribute("CurrentStreak") or 0
        end
        return string.format("[ %s | Ping: %s | %s | Streak: %s ]", player.Name, tostring(ping), device, tostring(streak))
    end
    
    local connections = {}
    
    local function cleanup()
        textDrawing:Remove()
        for _, conn in ipairs(connections) do conn:Disconnect() end
        EspConnections[player] = nil
    end
    
    table.insert(connections, char.AncestryChanged:Connect(function(_, parent)
        if not parent then cleanup() end
    end))
    
    table.insert(connections, hum.Died:Connect(cleanup))
    
    table.insert(connections, RunService.RenderStepped:Connect(function()
        if not EspEveryone or not head or not head.Parent then
            cleanup()
            return
        end
        
        local screenPos, onScreen = Workspace.CurrentCamera:WorldToViewportPoint(head.Position)
        if onScreen then
            textDrawing.Position = Vector2.new(screenPos.X, screenPos.Y - 27)
            textDrawing.Text = GetEspText()
            textDrawing.Visible = true
        else
            textDrawing.Visible = false
        end
    end))
    
    EspConnections[player] = { cleanup }
end

local function CleanupAllEsp()
    for _, data in pairs(EspConnections) do
        if data[1] then data[1]() end
    end
    EspConnections = {}
end

local function InitPlayerEsp(player)
    if player ~= LocalPlayer then
        if player.Character then CreatePlayerEsp(player, player.Character) end
        player.CharacterAdded:Connect(function(char)
            CreatePlayerEsp(player, char)
        end)
    end
end

Tabs.Main:Toggle({
    Title = "ESP Everyone",
    Value = false,
    Callback = function(state)
        EspEveryone = state
        if EspEveryone then
            for _, player in pairs(Players:GetPlayers()) do
                InitPlayerEsp(player)
            end
        else
            CleanupAllEsp()
        end
    end
})

Tabs.Main:Section({ Title = "Movement", Icon = "settings" })

local function ToggleSpeed(state)
    SpeedEnabled = state
    getgenv().WalkspeedBypass = SpeedEnabled
    if SpeedEnabled then
        task.spawn(function()
            while getgenv().WalkspeedBypass do
                local char = LocalPlayer.Character
                if char and char.Parent then
                    local hum = char:FindFirstChildOfClass("Humanoid")
                    if hum and hum.MoveDirection.Magnitude > 0 then
                        char:TranslateBy(hum.MoveDirection * SpeedValue * RunService.Heartbeat:Wait() * 7)
                    end
                    task.wait()
                else
                    break
                end
            end
        end)
    end
end

Tabs.Main:Toggle({
    Title = "Speed (V Key On/Off)",
    Value = false,
    Callback = ToggleSpeed
})

Tabs.Main:Slider({
    Title = "Speed Boost Value",
    Value = { Min = 1, Max = 100, Default = 9 },
    Callback = function(val) SpeedValue = val end
})

UserInputService.InputBegan:Connect(function(input, processed)
    if input.KeyCode == Enum.KeyCode.V and not processed then
        ToggleSpeed(not SpeedEnabled)
    end
end)

Tabs.Main:Toggle({
    Title = "Jump",
    Value = false,
    Callback = function(state)
        getgenv().JumpPowerBypass = state
        if state then
            task.spawn(function()
                while getgenv().JumpPowerBypass do
                    local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
                    if hum and hum:GetState() == Enum.HumanoidStateType.Jumping then
                        local root = LocalPlayer.Character.HumanoidRootPart
                        root.CFrame = root.CFrame * CFrame.new(0, JumpValue, 0)
                    end
                    task.wait()
                end
            end)
        end
    end
})

Tabs.Main:Slider({
    Title = "Jump Boost Value",
    Value = { Min = 1, Max = 1000, Default = 200 },
    Callback = function(val) JumpValue = val end
})

Tabs.Main:Toggle({
    Title = "No Stun",
    Value = false,
    Callback = function(state)
        getgenv().AutoNoSlow = state
        task.spawn(function()
            local connection
            connection = RunService.RenderStepped:Connect(function()
                if getgenv().AutoNoSlow then
                    pcall(function()
                        LocalPlayer.Character.Humanoid.WalkSpeed = 25
                    end)
                else
                    connection:Disconnect()
                end
            end)
        end)
    end
})

Tabs.Main:Section({ Title = "Character", Icon = "box" })

Tabs.Main:Toggle({
    Title = "Fake Downslam",
    Value = false,
    Callback = function(state)
        FakeDownslam = state
    end
})

local function OnStateChanged_FakeDownslam(old, new)
    if FakeDownslam and new == Enum.HumanoidStateType.Jumping then
        local anim = Instance.new("Animation")
        anim.AnimationId = "rbxassetid://10470104242"
        if Humanoid then
            local track = Humanoid:LoadAnimation(anim)
            task.wait(0.3)
            track:Play()
        end
    end
end

Tabs.Main:Toggle({
    Title = "Auto Safe Zone",
    Value = false,
    Callback = function(state)
        getgenv().AutoReturnSafeZone = state
        if state then
            local inZone = false
            task.spawn(function()
                while getgenv().AutoReturnSafeZone do
                    local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
                    if hum then
                        if hum.Health < 45 then
                            if not inZone then
                                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(150, 705, 30)
                                inZone = true
                            end
                        elseif hum.Health == 50 then
                            if inZone then
                                inZone = false
                            end
                        end
                    end
                    task.wait(0.15)
                end
            end)
        end
    end
})

Tabs.Main:Toggle({
    Title = "Spawn Fe Stone Effects",
    Value = false,
    Callback = function(state)
        getgenv().AutoDashEffect = state
        if state then
            task.spawn(function()
                while getgenv().AutoDashEffect do
                    local char = LocalPlayer.Character
                    if char then
                        local comm = char:FindFirstChild("Communicate")
                        if comm then
                            comm:FireServer(unpack({ { Dash = Enum.KeyCode.S, Key = Enum.KeyCode.Q, Goal = "KeyPress" } }))
                            task.wait(0.15)
                        else
                            break
                        end
                    else
                        break
                    end
                end
            end)
        end
    end
})

Tabs.Main:Toggle({
    Title = "Roast Dead Players",
    Value = false,
    Callback = function(state)
        getgenv().AutoMocking = state
        if state then
            task.spawn(function()
                while getgenv().AutoMocking do
                    local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if myRoot then
                        local closestDist = 65
                        local targetRoot = nil
                        for _, obj in ipairs(Workspace.Live:GetChildren()) do
                            local h = obj:FindFirstChildOfClass("Humanoid")
                            local r = obj:FindFirstChild("HumanoidRootPart")
                            if h and r and obj ~= LocalPlayer.Character and h.Health == 0 then
                                local d = (myRoot.Position - r.Position).magnitude
                                if d < closestDist then
                                    closestDist = d
                                    targetRoot = r
                                end
                            end
                        end
                        if targetRoot then
                            ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(RoastMessages[math.random(#RoastMessages)], "All")
                        end
                    end
                    task.wait(2.85)
                end
            end)
        end
    end
})

LocalPlayer.CharacterAdded:Connect(function(newChar)
    InitAutoVoid(newChar)
    if AutoWallCombo then SetupWallComboDetection(newChar) end
    Humanoid.AnimationPlayed:Connect(onAnimationPlayed_AutoVoid)
    Humanoid.AnimationPlayed:Connect(onAnimationPlayed_Whirlwind)
    Humanoid.StateChanged:Connect(OnStateChanged_FakeDownslam)
end)

Humanoid.AnimationPlayed:Connect(onAnimationPlayed_AutoVoid)
Humanoid.AnimationPlayed:Connect(onAnimationPlayed_Whirlwind)
Humanoid.StateChanged:Connect(OnStateChanged_FakeDownslam)

if AutoWallCombo then SetupWallComboDetection(Character) end

Players.PlayerAdded:Connect(InitUltEsp)
Players.PlayerAdded:Connect(InitPlayerEsp)
for _, p in pairs(Players:GetPlayers()) do
    InitUltEsp(p)
    InitPlayerEsp(p)
end

Players.PlayerRemoving:Connect(function(p)
    if EspConnections[p] and EspConnections[p][1] then
        EspConnections[p][1]()
    end
end)

Tabs.Main:Toggle({
    Title = "Grape Dummy :>",
    Value = false,
    Callback = function(state)
        getgenv().AutoFuckingGoku = state
        task.spawn(function()
            if getgenv().AutoFuckingGoku then
                local anim = Instance.new("Animation")
                anim.AnimationId = "rbxassetid://148840371"
                local track = LocalPlayer.Character.Humanoid:LoadAnimation(anim)
                track:Play()
                track:AdjustSpeed(6)
                
                local s1 = Instance.new("Sound")
                s1.SoundId = "http://www.roblox.com/asset/?id=8448213216"
                s1.Volume = 10
                s1.Parent = Workspace
                s1:Play()
                
                local s2 = Instance.new("Sound")
                s2.SoundId = "http://www.roblox.com/asset/?id=9114758204"
                s2.Volume = 10
                s2.Looped = true
                s2.Parent = Workspace
                s2:Play()
            else
                local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid") or LocalPlayer.Character:FindFirstChildOfClass("AnimationController")
                for _, track in ipairs(hum:GetPlayingAnimationTracks()) do
                    track:Stop()
                end
                for _, child in ipairs(Workspace:GetChildren()) do
                    if child:IsA("Sound") and (child.SoundId:find("8448213216") or child.SoundId:find("9114758204")) then
                        child:Destroy()
                    end
                end
            end
        end)
        
        task.spawn(function()
            while getgenv().AutoFuckingGoku do
                pcall(function()
                    local dummy = Workspace.Live["Weakest Dummy"]
                    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(dummy.HumanoidRootPart.Position - dummy.HumanoidRootPart.CFrame.LookVector * 1, dummy.HumanoidRootPart.Position)
                end)
                task.wait()
            end
        end)
    end
})

Tabs.Misc:Button({
    Title = "Copy Discord Link (join for more info)",
    Locked = false,
    Callback = function()
        setclipboard("https://discord.gg/xpSsT7GVM4")
    end,
})

Tabs.Misc:Section({ Title = "Universal Scripts", Icon = "flame" })

Tabs.Misc:Button({
    Title = "Inf Yield",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end,
})

Tabs.Misc:Button({
    Title = "Dex Explorer",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Classic-Dex-Explorer-21009"))()
    end,
})

Tabs.Misc:Button({
    Title = "Remote Spy",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua"))()
    end,
})

Tabs.Misc:Button({
    Title = "Keyboard",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
    end,
})

Tabs.Misc:Button({
    Title = "Anim Logger",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/juBGMpCZ/raw"))()
    end,
})

Tabs.Misc:Button({
    Title = "f3x",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/refs/heads/main/f3x.lua"))()
    end,
})

Tabs.Misc:Button({
    Title = "Fly V3",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/xuSMWfDu"))()
    end,
})

Tabs.Misc:Button({
    Title = "VFX Logger",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/2uXfJqdU"))()
    end,
})

Tabs.Misc:Button({
    Title = "Auto Block V10",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Cyborg883/TSB/refs/heads/main/CombatGui"))()
    end,
})

Tabs.Misc:Section({ Title = "Player", Icon = "star" })

Tabs.Misc:Button({
    Title = "ServerHop",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/uTXUoORd/raw"))()
    end,
})

Tabs.Misc:Button({
    Title = "Rejoin",
    Locked = false,
    Callback = function()
        TeleportService:Teleport(game.PlaceId)
    end,
})

Tabs.Misc:Button({
    Title = "Reset",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/YPv8xrYN/raw"))()
    end,
})

Tabs.Misc:Button({
    Title = "Fixcam V1",
    Locked = false,
    Callback = function()
        Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
        LocalPlayer.CameraMode = Enum.CameraMode.Classic
    end,
})

Tabs.Misc:Button({
    Title = "Fixcam V2",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/IrvnCaF2/raw"))()
    end,
})

Tabs.Misc:Section({ Title = "Random", Icon = "utensils" })

Tabs.Misc:Button({
    Title = "Buy limited Emotes",
    Desc = "(You can buy limited emotes that have been removed from the game with robux idrl is this patched or not)",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/UiPAjkB4/raw"))()
    end,
})

Tabs.Misc:Button({
    Title = "Strange Character Mod",
    Desc = "(WallCombo Everywhere + Ragdoll Hit + NoVelocity Dash + Upsitedown)",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/dwPwscTr/raw"))()
    end,
})

Tabs.Misc:Button({
    Title = "Strange Attacks",
    Desc = "(All moves fall from above)",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/jP73sWh8/raw"))()
    end,
})

Tabs.Misc:Button({
    Title = "Baldy Dummy",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/b1matovZ/raw"))()
    end,
})

Tabs.Misc:Button({
    Title = "Crazy Spin",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/BFB6IlAQ/raw"))()
    end,
})

Tabs.Misc:Button({
    Title = "Crazy Dance",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/I5eLfnge/raw"))()
    end,
})

Tabs.Misc:Toggle({
    Title = "Anti Fly Bypass",
    Value = false,
    Callback = function(state)
        Workspace:SetAttribute("VIPServer", state)
    end
})

Tabs.Misc:Section({ Title = "Tools", Icon = "eye" })

local function GivePlaceTool(name, position)
    local tool = Instance.new("Tool")
    tool.Name = name
    tool.RequiresHandle = false
    tool.Parent = LocalPlayer.Backpack
    
    local oldPos = nil
    tool.Equipped:Connect(function()
        if LocalPlayer.Character and LocalPlayer.Character.HumanoidRootPart then
            oldPos = LocalPlayer.Character.HumanoidRootPart.Position
            LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(position))
        end
    end)
    tool.Unequipped:Connect(function()
        if oldPos and LocalPlayer.Character then
            LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(oldPos))
        end
    end)
end

Tabs.Misc:Dropdown({
    Title = "Place Tools",
    Desc = "What Place Tool Do You Want?",
    Multi = false,
    AllowNone = false,
    Callback = function(val)
        local places = {
            Map = { name = "Map Tool", position = Vector3.new(150, 440, 30) },
            SafeZone1 = { name = "SafeZone1 Tool", position = Vector3.new(150, 505, 30) },
            SafeZone2 = { name = "SafeZone2 Tool", position = Vector3.new(150, 705, 30) },
            Pixel = { name = "Pixel Tool", position = Vector3.new(30000000, 30000000, 30000000) },
            Void = { name = "Void Tool", position = Vector3.new(150, -495, 30) },
            DarkNess = { name = "DarkNess Tool", position = Vector3.new(0, 900000000002, 0) },
            Montain = { name = "Mountain Tool", position = Vector3.new(155.577, 628.742, -447.938) },
            Counter = { name = "Counter Tool", position = Vector3.new(-68, 29, 20346) },
            ["Counter Up"] = { name = "CounterUp Tool", position = Vector3.new(-68, 84, 20354) },
            ["Atomic Base"] = { name = "AtomicBase Tool", position = Vector3.new(1063, 30, 23006) },
            ["Atomic Base Up"] = { name = "AtomicBaseUp Tool", position = Vector3.new(1063, 405, 23006) },
            ["Atomic Slash"] = { name = "AtomicSlash Tool", position = Vector3.new(1063, 131, 23006) },
            Prison = { name = "Prison Tool", position = Vector3.new(438, 439, -376) },
        }
        local data = places[val]
        if data then GivePlaceTool(data.name, data.position) end
    end,
    Options = { "Map", "SafeZone1", "SafeZone2", "Pixel", "Void", "DarkNess", "Montain", "Counter", "Counter Up", "Atomic Base", "Atomic Base Up", "Atomic Slash", "Prison" }
})

Tabs.Misc:Button({
    Title = "TrashCan Tool",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/ffnvee4X/raw"))()
    end,
})

Tabs.Misc:Button({
    Title = "Fake 20-20-20 Dropkick",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/Ja7L18CD/raw"))()
    end,
})

Tabs.Misc:Button({
    Title = "Dodge",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/XB1ykQuc/raw"))()
    end,
})

Tabs.Misc:Button({
    Title = "TP Tool (Anim)",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/yEwya3MR/raw"))()
    end,
})

Tabs.Misc:Button({
    Title = "TP Tool (Normal)",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/ZLpXLAeF/raw"))()
    end,
})

Tabs.Misc:Button({
    Title = "Run Tool",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/6DahLoA3/raw"))()
    end,
})

Tabs.Misc:Button({
    Title = "Super Run Tool",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/uN8jb9GF/raw"))()
    end,
})

Tabs.Misc:Button({
    Title = "Jerk Of Tool",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/LcC6ZrhN/raw"))()
    end,
})

Tabs.Misc:Button({
    Title = "Invis Block Tool (Buggy)",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/sl5RToWq/raw"))()
    end,
})

Tabs.Tech:Button({
    Title = "Copy Discord Link (join for more info)",
    Locked = false,
    Callback = function()
        setclipboard("https://discord.gg/xpSsT7GVM4")
    end,
})

Tabs.Tech:Section({ Title = "Tech Scripts", Icon = "box" })

Tabs.Tech:Button({
    Title = "M1 Reset Script",
    Locked = false,
    Callback = function()
        getgenv().keybinds = { m1reset = Enum.KeyCode.R, emotedash = Enum.KeyCode.T, rotation = Enum.KeyCode.H }
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Slaphello/M1-Reset-And-Emote-Dash-TSB-OLD-/refs/heads/main/M1R%26ED%20TSB"))()
    end,
})

Tabs.Tech:Button({
    Title = "Auto Kyoto Script",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Kietba/Kietba/refs/heads/main/Auto%20kyoto%20ma%20hoa"))()
    end,
})

Tabs.Tech:Button({
    Title = "Loop Dash Script",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Kietba/Kietba/refs/heads/main/Loop%20Dash%20Rework%20Script%20Real"))()
    end,
})

Tabs.Tech:Button({
    Title = "Oreo Dash Script",
    Locked = false,
    Callback = function()
        loadstring("loadstring(game:HttpGet(\"https://raw.githubusercontent.com/Kietba/Kietba/refs/heads/main/Oreo%20Tech%20Script\"))()")()
    end,
})

Tabs.Tech:Button({
    Title = "Tornado Dash Script",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Kietba/Kietba/refs/heads/main/Idk%20lolololol"))()
    end,
})

Tabs.Tech:Button({
    Title = "Supa Dash Script",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Kietba/Kietba/refs/heads/main/Supa%20tech%20script"))()
    end,
})

Tabs.Tech:Button({
    Title = "BackDash Script (MOBILE)",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Kietba/Kietba/refs/heads/main/BackDash%20Tech"))()
    end,
})

Tabs.Tech:Button({
    Title = "Backdash Script (PC)",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Kietba/Kietba/refs/heads/main/BackDash%20For%20Pc"))()
    end,
})

Tabs.Tech:Section({ Title = "Auto Techs", Icon = "sword" })

local TrueDownslamLoop = nil
Tabs.Tech:Toggle({
    Title = "True DownSlam",
    Value = false,
    Callback = function(state)
        local normalSlamIds = {
            ["rbxassetid://13532600125"] = true, ["rbxassetid://10469630950"] = true,
            ["rbxassetid://13296577783"] = true, ["rbxassetid://13370310513"] = true,
            ["rbxassetid://15240216931"] = true, ["rbxassetid://16515520431"] = true,
            ["rbxassetid://17889461810"] = true,
        }
        local sideSlamIds = {
            ["rbxassetid://13532604085"] = true, ["rbxassetid://10469639222"] = true,
            ["rbxassetid://13295919399"] = true, ["rbxassetid://13378751717"] = true,
            ["rbxassetid://15240176873"] = true, ["rbxassetid://16515448089"] = true,
            ["rbxassetid://17889471098"] = true,
        }
        local lastSlamTime = {}
        local char, hum = nil, nil
        
        local function GetChar()
            local c = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local h = c:WaitForChild("Humanoid")
            c.PrimaryPart = c:WaitForChild("HumanoidRootPart")
            return c, h
        end
        
        local function DoSlam()
            if not char or not char.PrimaryPart then return end
            local cam = Workspace.CurrentCamera
            local subject = cam.CameraSubject
            cam.CameraSubject = nil
            local pivot = char:GetPivot()
            local target = pivot + Vector3.new(0, 7, 0)
            local steps = 10
            for i = 1, steps do
                char:PivotTo(pivot:Lerp(target, i / steps))
                task.wait(0.1 / steps)
            end
            cam.CameraSubject = subject
        end
        
        if state then
            if TrueDownslamLoop then TrueDownslamLoop:Disconnect() end
            char, hum = GetChar()
            TrueDownslamLoop = RunService.RenderStepped:Connect(function()
                if LocalPlayer.Character ~= char then char, hum = GetChar() end
                for _, track in pairs(hum:GetPlayingAnimationTracks()) do
                    local id = tostring(track.Animation.AnimationId)
                    local now = tick()
                    if normalSlamIds[id] and (not lastSlamTime[id] or now - lastSlamTime[id] > 0.5) then
                        lastSlamTime[id] = now
                        task.delay(0.15, DoSlam)
                    elseif sideSlamIds[id] and (not lastSlamTime[id] or now - lastSlamTime[id] > 0.5) then
                        lastSlamTime[id] = now
                        task.delay(0.15, function() hum:ChangeState(Enum.HumanoidStateType.Jumping) end)
                    end
                end
            end)
        elseif TrueDownslamLoop then
            TrueDownslamLoop:Disconnect()
            TrueDownslamLoop = nil
        end
    end
})

local TwistedTechActive = false
local TwistedTechConn = nil
local TwistedTechAnimId = "rbxassetid://13294471966"
local TwistedTechDelay = 0.23

local function DoTwistedTechDash()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Communicate") then
        char.Communicate:FireServer(unpack({ { Dash = Enum.KeyCode.W, Key = Enum.KeyCode.Q, Goal = "KeyPress" } }))
    end
end

local function OffsetTwistedTech()
    local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if root then
        root.CFrame = root.CFrame * CFrame.new(0, 0, 3)
    end
end

local function SetupAutoTwisted()
    TwistedTechConn = (LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()):WaitForChild("Humanoid").AnimationPlayed:Connect(function(track)
        if track.Animation and track.Animation.AnimationId == TwistedTechAnimId and not TwistedTechActive then
            TwistedTechActive = true
            task.delay(TwistedTechDelay, function()
                OffsetTwistedTech()
                DoTwistedTechDash()
            end)
            task.delay(5, function() TwistedTechActive = false end)
        end
    end)
end

Tabs.Tech:Toggle({
    Title = "Auto Twisted Tech",
    Value = false,
    Callback = function(state)
        if state then
            SetupAutoTwisted()
            LocalPlayer.CharacterAdded:Connect(function()
                task.wait(1)
                SetupAutoTwisted()
            end)
        elseif TwistedTechConn then
            TwistedTechConn:Disconnect()
            TwistedTechConn = nil
        end
    end
})

local InstantTwistedActive = false
local InstantTwistedAnimConn = nil
local InstantTwistedCharConn = nil

local function DoInstantTwistedCam()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Communicate") then
        char.Communicate:FireServer(unpack({ { Dash = Enum.KeyCode.W, Key = Enum.KeyCode.Q, Goal = "KeyPress" } }))
    end
    
    local cam = Workspace.CurrentCamera
    local currentCF = cam.CFrame
    cam.CameraType = Enum.CameraType.Scriptable
    
    local t1 = TweenService:Create(cam, TweenInfo.new(0.1, Enum.EasingStyle.Sine), { CFrame = currentCF * CFrame.Angles(40, math.rad(-90), 180) })
    t1:Play()
    t1.Completed:Wait()
    wait(0.00001)
    
    local t2 = TweenService:Create(cam, TweenInfo.new(0.001, Enum.EasingStyle.Sine), { CFrame = currentCF })
    t2:Play()
    t2.Completed:Wait()
    wait(0.1)
    
    local t3 = TweenService:Create(cam, TweenInfo.new(0.0001, Enum.EasingStyle.Sine), { CFrame = currentCF * CFrame.Angles(math.rad(-6), math.rad(20), 0) })
    t3:Play()
    t3.Completed:Wait()
    
    cam.CameraType = Enum.CameraType.Custom
end

local function HandleInstantTwisted(animator)
    InstantTwistedAnimConn = animator.AnimationPlayed:Connect(function(track)
        if track.Animation and track.Animation.AnimationId == TwistedTechAnimId and not InstantTwistedActive then
            InstantTwistedActive = true
            local char = LocalPlayer.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            if root then
                root.CFrame = root.CFrame + root.CFrame.LookVector * -1
            end
            task.delay(0.25, function()
                DoInstantTwistedCam()
                wait(5)
                InstantTwistedActive = false
            end)
        end
    end)
end

local function SetupInstantTwisted()
    local hum = (LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()):WaitForChild("Humanoid")
    local animator = hum:FindFirstChildOfClass("Animator")
    if animator then
        HandleInstantTwisted(animator)
    else
        hum.ChildAdded:Connect(function(child)
            if child:IsA("Animator") then HandleInstantTwisted(child) end
        end)
    end
end

Tabs.Tech:Toggle({
    Title = "Instant Twisted Tech",
    Value = false,
    Callback = function(state)
        if state then
            SetupInstantTwisted()
            InstantTwistedCharConn = LocalPlayer.CharacterAdded:Connect(SetupInstantTwisted)
        else
            if InstantTwistedAnimConn then InstantTwistedAnimConn:Disconnect() InstantTwistedAnimConn = nil end
            if InstantTwistedCharConn then InstantTwistedCharConn:Disconnect() InstantTwistedCharConn = nil end
        end
    end
})

local SupaStreamAnimId = "rbxassetid://12296113986"
local SupaStreamActive = false
local SupaStreamAnimConn = nil
local SupaStreamCharConn = nil

local function PerformSupaStreamTech(hum)
    SupaStreamAnimConn = hum.AnimationPlayed:Connect(function(track)
        if track.Animation and track.Animation.AnimationId == SupaStreamAnimId and not SupaStreamActive then
            SupaStreamActive = true
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid.Jump = true
            end
            
            task.delay(2, function()
                local char = LocalPlayer.Character
                if char and char:FindFirstChild("Communicate") then
                    char.Communicate:FireServer(unpack({ { Dash = Enum.KeyCode.W, Key = Enum.KeyCode.Q, Goal = "KeyPress" } }))
                end
                
                task.delay(0.26, function()
                    local root = char and char:FindFirstChild("HumanoidRootPart")
                    if root then
                        local cf = root.CFrame
                        local backVector = -cf.LookVector
                        root.CFrame = CFrame.lookAt(cf.Position, cf.Position + backVector)
                        Workspace.CurrentCamera.CFrame = CFrame.lookAt(Workspace.CurrentCamera.CFrame.Position, Workspace.CurrentCamera.CFrame.Position + backVector)
                    end
                    if char and char:FindFirstChild("Humanoid") then char.Humanoid.Jump = false end
                    SupaStreamActive = false
                end)
            end)
        end
    end)
end

local function SetupSupaStream()
    PerformSupaStreamTech((LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()):WaitForChild("Humanoid"))
end

Tabs.Tech:Toggle({
    Title = "Auto Supa Stream",
    Value = false,
    Callback = function(state)
        if state then
            SetupSupaStream()
            SupaStreamCharConn = LocalPlayer.CharacterAdded:Connect(SetupSupaStream)
        else
            if SupaStreamAnimConn then SupaStreamAnimConn:Disconnect() SupaStreamAnimConn = nil end
            if SupaStreamCharConn then SupaStreamCharConn:Disconnect() SupaStreamCharConn = nil end
        end
    end
})

local SupaUppercutAnimId = "rbxassetid://10503381238"
local SupaUppercutActive = false
local SupaUppercutAnimConn = nil
local SupaUppercutCharConn = nil

local function PerformSupaUppercutTech(hum)
    SupaUppercutAnimConn = hum.AnimationPlayed:Connect(function(track)
        if track.Animation and track.Animation.AnimationId == SupaUppercutAnimId and not SupaUppercutActive then
            SupaUppercutActive = true
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid.Jump = true
            end
            
            task.delay(1, function()
                local char = LocalPlayer.Character
                if char and char:FindFirstChild("Communicate") then
                    char.Communicate:FireServer(unpack({ { Dash = Enum.KeyCode.W, Key = Enum.KeyCode.Q, Goal = "KeyPress" } }))
                end
                
                task.delay(0.26, function()
                    local root = char and char:FindFirstChild("HumanoidRootPart")
                    if root then
                        local cf = root.CFrame
                        local backVector = -cf.LookVector
                        root.CFrame = CFrame.lookAt(cf.Position, cf.Position + backVector)
                        Workspace.CurrentCamera.CFrame = CFrame.lookAt(Workspace.CurrentCamera.CFrame.Position, Workspace.CurrentCamera.CFrame.Position + backVector)
                    end
                    if char and char:FindFirstChild("Humanoid") then char.Humanoid.Jump = false end
                    SupaUppercutActive = false
                end)
            end)
        end
    end)
end

local function SetupSupaUppercut()
    PerformSupaUppercutTech((LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()):WaitForChild("Humanoid"))
end

Tabs.Tech:Toggle({
    Title = "Auto Supa Uppercut",
    Value = false,
    Callback = function(state)
        if state then
            SetupSupaUppercut()
            SupaUppercutCharConn = LocalPlayer.CharacterAdded:Connect(SetupSupaUppercut)
        else
            if SupaUppercutAnimConn then SupaUppercutAnimConn:Disconnect() SupaUppercutAnimConn = nil end
            if SupaUppercutCharConn then SupaUppercutCharConn:Disconnect() SupaUppercutCharConn = nil end
        end
    end
})

local FlowingGraspEnabled = false
local FlowingGraspConn = nil
local FlowingAnimId = "rbxassetid://12273188754"

Tabs.Tech:Toggle({
    Title = "Flowing + Grasp",
    Value = false,
    Callback = function(state)
        FlowingGraspEnabled = state
        if FlowingGraspConn then FlowingGraspConn:Disconnect() FlowingGraspConn = nil end
        if not FlowingGraspEnabled then return end
        
        local executed = false
        local detected = false
        FlowingGraspConn = RunService.RenderStepped:Connect(function()
            local char = LocalPlayer.Character
            if not char then return end
            local hum = char:FindFirstChild("Humanoid")
            local root = char:FindFirstChild("HumanoidRootPart")
            if not hum or not root then return end
            
            local playing = false
            for _, track in ipairs(hum:GetPlayingAnimationTracks()) do
                if track.Animation and track.Animation.AnimationId == FlowingAnimId then
                    playing = true
                    break
                end
            end
            
            if playing and not executed and not detected then
                executed = true
                detected = true
                task.delay(1.8, function()
                    local tween = TweenService:Create(root, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { CFrame = root.CFrame + root.CFrame.LookVector * 24 })
                    tween:Play()
                    tween.Completed:Wait()
                    
                    local grasp = LocalPlayer.Backpack:FindFirstChild("Hunter's Grasp")
                    local comm = char:FindFirstChild("Communicate")
                    if grasp and comm then
                        comm:FireServer(unpack({ { Tool = grasp, Goal = "Console Move" } }))
                    end
                    executed = false
                end)
            elseif not playing then
                detected = false
            end
        end)
    end
})

local UpperGraspEnabled = false
local UpperGraspConn = nil
local UpperAnimId = "rbxassetid://10503381238"

Tabs.Tech:Toggle({
    Title = "Upper + Grasp",
    Value = false,
    Callback = function(state)
        UpperGraspEnabled = state
        if UpperGraspConn then UpperGraspConn:Disconnect() UpperGraspConn = nil end
        if not UpperGraspEnabled then return end
        
        local executed = false
        local detected = false
        local cooldown = false
        
        UpperGraspConn = RunService.RenderStepped:Connect(function()
            local char = LocalPlayer.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            local hum = char and char:FindFirstChild("Humanoid")
            if not char or not root or not hum then return end
            
            local playing = false
            for _, track in ipairs(hum:GetPlayingAnimationTracks()) do
                if track.Animation and track.Animation.AnimationId == UpperAnimId then
                    playing = true
                    break
                end
            end
            
            if playing and not executed and not detected and not cooldown then
                executed = true
                detected = true
                cooldown = true
                
                task.delay(0.18, function()
                    local closestDist = 7
                    local targetTorso = nil
                    
                    if Workspace:FindFirstChild("Live") then
                        for _, obj in ipairs(Workspace.Live:GetChildren()) do
                            if obj:IsA("Model") and obj ~= char then
                                local t = obj:FindFirstChild("Torso") or obj:FindFirstChild("UpperTorso")
                                if t then
                                    local d = (root.Position - t.Position).Magnitude
                                    if d <= closestDist then
                                        closestDist = d
                                        targetTorso = t
                                    end
                                end
                            end
                        end
                    end
                    
                    if targetTorso then
                        local tween = TweenService:Create(root, TweenInfo.new(0.1, Enum.EasingStyle.Linear), { CFrame = CFrame.new(targetTorso.Position + Vector3.new(0, 8, 0)) })
                        tween:Play()
                        tween.Completed:Wait()
                    end
                    
                    local grasp = LocalPlayer.Backpack:FindFirstChild("Hunter's Grasp")
                    local comm = char:FindFirstChild("Communicate")
                    if grasp and comm then
                        comm:FireServer(unpack({ { Tool = grasp, Goal = "Console Move" } }))
                    end
                    
                    executed = false
                    task.delay(15, function() cooldown = false end)
                end)
            elseif not playing then
                detected = false
            end
        end)
    end
})

Tabs.Lag:Button({
    Title = "Copy Discord Link (join for more info)",
    Locked = false,
    Callback = function()
        setclipboard("https://discord.gg/xpSsT7GVM4")
    end,
})

Tabs.Lag:Section({ Title = "Anti Lag", Icon = "heart" })

Tabs.Lag:Button({
    Title = "Destroy Spawned Stones (By Fent)",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/louismich4el/ItsLouisPlayz-Scripts/main/TSB%20Anti%20Lag.lua"))()
    end,
})

Tabs.Lag:Toggle({
    Title = "Low Graphics",
    Value = false,
    Callback = function(state)
        if state then
            local decalsGone = true
            local terrain = Workspace.Terrain
            
            sethiddenproperty(Lighting, "Technology", 2)
            sethiddenproperty(terrain, "Decoration", false)
            terrain.WaterWaveSize = 0
            terrain.WaterWaveSpeed = 0
            terrain.WaterReflectance = 0
            terrain.WaterTransparency = 0
            Lighting.GlobalShadows = 0
            Lighting.FogEnd = 9e9
            Lighting.Brightness = 0
            settings().Rendering.QualityLevel = "Level01"
            
            local function ProcessObject(obj)
                if obj:IsA("BasePart") and not obj:IsA("MeshPart") then
                    obj.Material = "Plastic"
                    obj.Reflectance = 0
                elseif (obj:IsA("Decal") or obj:IsA("Texture")) and decalsGone then
                    obj.Transparency = 1
                elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") then
                    obj.Lifetime = NumberRange.new(0)
                elseif obj:IsA("Explosion") then
                    obj.BlastPressure = 1
                    obj.BlastRadius = 1
                elseif obj:IsA("Fire") or obj:IsA("SpotLight") or obj:IsA("Smoke") or obj:IsA("Sparkles") then
                    obj.Enabled = false
                elseif obj:IsA("MeshPart") and decalsGone then
                    obj.Material = "Plastic"
                    obj.Reflectance = 0
                    obj.TextureID = 10385902758728956
                elseif obj:IsA("SpecialMesh") and decalsGone then
                    obj.TextureId = 0
                elseif obj:IsA("ShirtGraphic") and decalsGone then
                    obj.Graphic = 0
                elseif (obj:IsA("Shirt") or obj:IsA("Pants")) and decalsGone then
                    obj[obj.ClassName .. "Template"] = 0
                end
            end
            
            for _, v in pairs(Workspace:GetDescendants()) do ProcessObject(v) end
            for _, v in pairs(Lighting:GetChildren()) do
                if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
                    v.Enabled = false
                end
            end
            
            Workspace.DescendantAdded:Connect(function(v)
                task.wait()
                ProcessObject(v)
            end)
        end
    end
})

Tabs.Lag:Section({ Title = "Hide Parts", Icon = "package" })

local MapFolder = Workspace:FindFirstChild("Map")
if MapFolder then
    local HiddenParts = {}
    
    local function TogglePartVisibility(name, visible)
        local part = MapFolder:FindFirstChild(name)
        if visible and not part and HiddenParts[name] then
            HiddenParts[name].Parent = MapFolder
        elseif part then
            HiddenParts[name] = part
            part.Parent = nil
        end
    end
    
    Tabs.Lag:Toggle({ Title = "Trees", Value = true, Callback = function(v) TogglePartVisibility("Trees", v) end })
    Tabs.Lag:Toggle({ Title = "Walls", Value = true, Callback = function(v) TogglePartVisibility("Walls", v) end })
    Tabs.Lag:Toggle({ Title = "Grass", Value = true, Callback = function(v) TogglePartVisibility("Grass", v) TogglePartVisibility("GrassBottom", v) end })
    Tabs.Lag:Toggle({ Title = "Benches", Value = true, Callback = function(v) TogglePartVisibility("Benchs", v) end })
    
    TogglePartVisibility("Trees", true)
    TogglePartVisibility("Walls", true)
    TogglePartVisibility("Grass", true)
    TogglePartVisibility("GrassBottom", true)
    TogglePartVisibility("Benchs", true)
end

Tabs.Anim:Button({
    Title = "Copy Discord Link (join for more info)",
    Locked = false,
    Callback = function()
        setclipboard("https://discord.gg/xpSsT7GVM4")
    end,
})

Tabs.Anim:Section({ Title = "Play/Stop", Icon = "eye" })

Tabs.Anim:Input({
    Title = "Play Animation",
    Desc = "Use Anim Ids To Play Anim",
    Placeholder = "Anim Id Here",
    Numeric = true,
    Callback = function(val)
        if tonumber(val) then
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://" .. val
            local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if hum then
                (hum:FindFirstChildOfClass("Animator") or Instance.new("Animator", hum)):LoadAnimation(anim):Play()
            end
        end
    end,
})

local StopAnimConn = nil
local StopAnimDiedConn = nil

local function SetupStopAnim()
    local hum = LocalPlayer.Character:WaitForChild("Humanoid")
    local idToIgnore = "136370737633649"
    
    if StopAnimConn then StopAnimConn:Disconnect() end
    StopAnimConn = hum.AnimationPlayed:Connect(function(track)
        if track.Animation.AnimationId:match("%d+") ~= idToIgnore then
            track:Stop()
        end
    end)
    
    if StopAnimDiedConn then StopAnimDiedConn:Disconnect() end
    StopAnimDiedConn = hum.Died:Connect(SetupStopAnim)
end

Tabs.Anim:Toggle({
    Title = "No Animation",
    Value = false,
    Callback = function(state)
        if state then
            SetupStopAnim()
        else
            if StopAnimConn then StopAnimConn:Disconnect() end
            if StopAnimDiedConn then StopAnimDiedConn:Disconnect() end
        end
    end
})

Tabs.Anim:Section({ Title = "Characters", Icon = "user" })

local AnimScripts = {
    { "KJ/Gojo/Dummy", "Special Animations", "https://pastefy.app/qfu9PA3v/raw" },
    { "Saitama", "Saitama Animations", "https://pastefy.app/77H3wRXO/raw" },
    { "Garou", "Garou Animations", "https://pastefy.app/VY6onISD/raw" },
    { "Genos", "Genos Animations", "https://pastefy.app/0EPn6woL/raw" },
    { "Sonic", "Sonic Animations", "https://pastefy.app/KaiJDJHg/raw" },
    { "MetalBat", "MetalBat Animations", "https://pastefy.app/mObEgCqc/raw" },
    { "Atomic Samurai", "Atomic Samurai Animations", "https://pastefy.app/9bllab1z/raw" },
    { "Tatsumaki", "Tatsumaki Animations", "https://pastefy.app/qhJrd1zw/raw" },
    { "Suiryu", "Suiryu Animations", "https://pastefy.app/AKyKbIt0/raw" }
}

for _, scriptData in ipairs(AnimScripts) do
    Tabs.Anim:Button({
        Title = scriptData[2],
        Locked = false,
        Callback = function() loadstring(game:HttpGet(scriptData[3]))() end
    })
end

Tabs.Fight:Button({
    Title = "Copy Discord Link (join for more info)",
    Locked = false,
    Callback = function()
        setclipboard("https://discord.gg/xpSsT7GVM4")
    end,
})

Tabs.Fight:Section({ Title = "Farm", Icon = "map" })

Tabs.Fight:Button({
    Title = "TrashCan Kill Farmer",
    Locked = false,
    Callback = function()
        getgenv().Settings = { TargetHealth = 50, CharacterHeight = 8, ResetStreak = false, AntiDC = false }
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DiosDi/VexonHub/refs/heads/main/TrashCan-Farm"))()
    end,
})

Tabs.Fight:Button({
    Title = "Auto Get Emotes",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/bqVKWKRG/raw"))()
    end,
})

Tabs.Fight:Toggle({
    Title = "Auto Reset Streak",
    Value = false,
    Callback = function(state)
        getgenv().ResetStreak = state
        if state then
            task.spawn(function()
                while getgenv().ResetStreak do
                    local live = Workspace:FindFirstChild("Live")
                    if live then
                        local plrData = live:FindFirstChild(LocalPlayer.Name)
                        if plrData and (plrData:GetAttribute("CurrentStreak") or 0) >= 9 then
                            local char = LocalPlayer.Character
                            local hum = char and char:FindFirstChildOfClass("Humanoid")
                            if hum then hum.Health = 0 end
                        end
                    end
                    task.wait(1)
                end
            end)
        end
    end
})

Tabs.Fight:Toggle({
    Title = "Auto Farm Lowest Health",
    Value = false,
    Callback = function(state)
        getgenv().AutoKillLowestHealthPlr = state
        getgenv().TeleportDistance = 5
        
        local rootPart = nil
        local function GetRoot()
            if LocalPlayer.Character then
                rootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart") or LocalPlayer.Character:WaitForChild("HumanoidRootPart")
            end
        end
        
        task.spawn(function()
            while getgenv().AutoKillLowestHealthPlr do
                pcall(function()
                    GetRoot()
                    if rootPart then
                        local lowestHealth = math.huge
                        local target = nil
                        for _, obj in pairs(Workspace.Live:GetChildren()) do
                            if Players:GetPlayerFromCharacter(obj) then
                                local h = obj:FindFirstChildOfClass("Humanoid")
                                local r = obj:FindFirstChild("HumanoidRootPart")
                                if h and r and obj ~= LocalPlayer.Character and h.Health > 0 and h.Health <= 35 then
                                    if h.Health < lowestHealth then
                                        lowestHealth = h.Health
                                        target = r
                                    end
                                end
                            end
                        end
                        
                        if target then
                            LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(target.Position - Vector3.new(0, target.Size.Y/2, 0) - target.CFrame.LookVector * getgenv().TeleportDistance + Vector3.new(0, -6, 0), target.Position - Vector3.new(0, target.Size.Y/2, 0)))
                            
                            local liveFolder = Workspace.Live:FindFirstChild(target.Parent.Name)
                            if not liveFolder:FindFirstChild("RagdollSim") and not liveFolder:FindFirstChild("AbsoluteImmortal") then
                                task.spawn(function()
                                    LocalPlayer.Character.Communicate:FireServer(unpack({{Goal = "LeftClick", Mobile = true}}))
                                    LocalPlayer.Character.Communicate:FireServer(unpack({{Goal = "LeftClickRelease", Mobile = true}}))
                                end)
                                
                                for _, item in pairs(LocalPlayer.Backpack:GetChildren()) do
                                    if item:IsA("Tool") and item.Name ~= "Prey's Peril" and item.Name ~= "Split Second Counter" then
                                        LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(item)
                                        item:Activate()
                                        LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
                                    end
                                end
                            end
                        else
                            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(150, 705, 30)
                        end
                    end
                end)
                task.wait(0.015)
            end
        end)
        
        LocalPlayer.CharacterAdded:Connect(function() task.wait(1.5) GetRoot() end)
    end
})

Tabs.Fight:Toggle({
    Title = "Auto Farm Nearest",
    Value = false,
    Callback = function(state)
        getgenv().AutoKillNearestPlr = state
        getgenv().TeleportDistance = 5
        
        if not state then
            LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 20, -20)
        end
        
        local rootPart = nil
        local function GetRoot()
            if LocalPlayer.Character then
                rootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart") or LocalPlayer.Character:WaitForChild("HumanoidRootPart")
            end
        end
        
        task.spawn(function()
            while getgenv().AutoKillNearestPlr do
                pcall(function()
                    GetRoot()
                    if rootPart then
                        local closestDist = math.huge
                        local target = nil
                        for _, obj in pairs(Workspace.Live:GetChildren()) do
                            if Players:GetPlayerFromCharacter(obj) then
                                local h = obj:FindFirstChildOfClass("Humanoid")
                                local r = obj:FindFirstChild("HumanoidRootPart")
                                if h and r and obj ~= LocalPlayer.Character and h.Health > 0 then
                                    local dist = (rootPart.Position - r.Position).magnitude
                                    if dist < closestDist then
                                        closestDist = dist
                                        target = r
                                    end
                                end
                            end
                        end
                        
                        if target then
                            LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(target.Position - Vector3.new(0, target.Size.Y/2, 0) - target.CFrame.LookVector * getgenv().TeleportDistance + Vector3.new(0, -6, 0), target.Position - Vector3.new(0, target.Size.Y/2, 0)))
                            
                            local liveFolder = Workspace.Live:FindFirstChild(target.Parent.Name)
                            if not liveFolder:FindFirstChild("RagdollSim") and not liveFolder:FindFirstChild("AbsoluteImmortal") then
                                task.spawn(function()
                                    LocalPlayer.Character.Communicate:FireServer(unpack({{Goal = "LeftClick", Mobile = true}}))
                                    LocalPlayer.Character.Communicate:FireServer(unpack({{Goal = "LeftClickRelease", Mobile = true}}))
                                end)
                                
                                for _, item in pairs(LocalPlayer.Backpack:GetChildren()) do
                                    if item:IsA("Tool") and item.Name ~= "Prey's Peril" and item.Name ~= "Split Second Counter" then
                                        LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(item)
                                        item:Activate()
                                        LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
                                    end
                                end
                            end
                        end
                    end
                end)
                task.wait(0.015)
            end
        end)
        LocalPlayer.CharacterAdded:Connect(function() task.wait(1.5) GetRoot() end)
    end
})

Tabs.Fight:Toggle({
    Title = "Auto Give Kills",
    Value = false,
    Callback = function(state)
        getgenv().AutoGiveKills = state
        task.spawn(function()
            while getgenv().AutoGiveKills do
                pcall(function()
                    local myData = Workspace.Live[LocalPlayer.Name]
                    local h = myData:FindFirstChild("Humanoid")
                    if h.MaxHealth ~= h.Health then
                        LocalPlayer.Character.Humanoid.Health = 0
                    end
                end)
                task.wait(0.35)
            end
        end)
    end
})

Tabs.Fight:Section({ Title = "Fighting", Icon = "sword" })

getgenv().CamKey = "Z"
getgenv().CharacterKey = "X"
local AimLockCam = false
local AimLockChar = false
local AimTarget = nil

local function GetClosestPlayer()
    local closest = math.huge
    local target = nil
    local center = Vector2.new(Workspace.CurrentCamera.ViewportSize.X / 2, Workspace.CurrentCamera.ViewportSize.Y / 2)
    
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local h = p.Character:FindFirstChild("Humanoid")
            if h and h.Health > 0 then
                local pos, visible = Workspace.CurrentCamera:WorldToViewportPoint(p.Character.HumanoidRootPart.Position)
                if visible then
                    local dist = (center - Vector2.new(pos.X, pos.Y)).Magnitude
                    if dist < closest then
                        closest = dist
                        target = p.Character.HumanoidRootPart
                    end
                end
            end
        end
    end
    return target
end

local function UpdateAimTarget()
    if AimLockCam or AimLockChar then
        AimTarget = GetClosestPlayer()
    else
        AimTarget = nil
    end
end

RunService.Heartbeat:Connect(function()
    if not AimTarget or not AimTarget.Parent then return end
    local h = AimTarget.Parent:FindFirstChild("Humanoid")
    if not h or h.Health <= 0 then AimTarget = nil return end
    
    local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not myRoot then return end
    
    local predPos = AimTarget.Position + AimTarget.Velocity * 0.016
    if AimLockCam then
        Workspace.CurrentCamera.CFrame = CFrame.new(Workspace.CurrentCamera.CFrame.Position, predPos)
    end
    if AimLockChar then
        myRoot.CFrame = CFrame.new(myRoot.Position, Vector3.new(predPos.X, myRoot.Position.Y, predPos.Z))
    end
end)

UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode.Name == getgenv().CamKey then
            AimLockCam = not AimLockCam
            AimLockChar = false
            UpdateAimTarget()
        elseif input.KeyCode.Name == getgenv().CharacterKey then
            AimLockChar = not AimLockChar
            AimLockCam = false
            UpdateAimTarget()
        end
    end
end)

Tabs.Fight:Toggle({
    Title = "AimLock Cam",
    Value = false,
    Callback = function(state)
        AimLockCam = state
        AimLockChar = false
        UpdateAimTarget()
    end
})

Tabs.Fight:Toggle({
    Title = "AimLock Character",
    Value = false,
    Callback = function(state)
        AimLockChar = state
        AimLockCam = false
        UpdateAimTarget()
    end
})

Tabs.Fight:Toggle({
    Title = "M1 Click Reach",
    Value = false,
    Callback = function(state)
        getgenv().AutoTeleportPunching = state
        getgenv().DetectionDistance = 999999
        getgenv().TeleportDistance = 3
        
        local rootPart = nil
        local function GetRoot()
            if LocalPlayer.Character then
                rootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart") or LocalPlayer.Character:WaitForChild("HumanoidRootPart")
            end
        end
        
        local function GetTarget()
            local minDist = getgenv().DetectionDistance
            local target = nil
            for _, obj in pairs(Workspace.Live:GetChildren()) do
                local h = obj:FindFirstChildOfClass("Humanoid")
                local r = obj:FindFirstChild("HumanoidRootPart")
                if h and r and obj ~= LocalPlayer.Character and h.Health > 0 then
                    local dist = (rootPart.Position - r.Position).magnitude
                    if dist < minDist then
                        minDist = dist
                        target = r
                    end
                end
            end
            return target
        end
        
        task.spawn(function()
            while getgenv().AutoTeleportPunching do
                pcall(function()
                    GetRoot()
                    if Workspace.Live[LocalPlayer.Name]:FindFirstChild("M1ing") and rootPart then
                        local target = GetTarget()
                        if target then
                            local dest = target.Position + -target.CFrame.LookVector * getgenv().TeleportDistance
                            LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(dest, dest + (target.Position - dest).unit))
                        end
                    end
                end)
                task.wait(0.015)
            end
        end)
        LocalPlayer.CharacterAdded:Connect(function() task.wait(3) GetRoot() end)
    end
})

local AutoHitEnabled = false
local function StartAutoHit()
    task.spawn(function()
        while AutoHitEnabled do
            local char = LocalPlayer.Character
            if char then
                local root = char:FindFirstChild("HumanoidRootPart")
                if root then
                    for _, p in pairs(Players:GetPlayers()) do
                        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and (root.Position - p.Character.HumanoidRootPart.Position).Magnitude < 10 then
                            char.Communicate:FireServer(unpack({{Goal = "LeftClick", Mobile = true}}))
                            task.wait(0.1)
                            char.Communicate:FireServer(unpack({{Goal = "LeftClickRelease", Mobile = true}}))
                        end
                    end
                end
            end
            task.wait(0.1)
        end
    end)
end

Tabs.Fight:Toggle({
    Title = "Auto Hit",
    Value = false,
    Callback = function(state)
        AutoHitEnabled = state
        if state then StartAutoHit() end
    end
})

LocalPlayer.CharacterAdded:Connect(function()
    if AutoHitEnabled then task.wait(1) StartAutoHit() end
end)

Tabs.Fight:Toggle({
    Title = "Auto Dodge Players",
    Value = false,
    Callback = function(state)
        getgenv().AutoDodging = state
        local dodgeAnims = {
            10479335397, 13380255751, 10468665991, 10466974800, 10471336737, 12510170988, 12272894215, 12296882427, 12307656616
        }
        
        task.spawn(function()
            local conn
            conn = RunService.RenderStepped:Connect(function()
                if getgenv().AutoDodging then
                    pcall(function()
                        for _, obj in ipairs(Workspace.Live:GetChildren()) do
                            if obj:IsA("Model") and obj:FindFirstChild("Head") and obj.Head:IsA("Part") and obj.Head.Name == "Head" and obj.Head ~= LocalPlayer.Character.Head and (obj.Head.Position - LocalPlayer.Character.Head.Position).magnitude <= 25 and obj:FindFirstChildOfClass("Humanoid") and obj:FindFirstChildOfClass("Humanoid").Health > 0 then
                                local dodging = false
                                for _, track in pairs(obj:FindFirstChildOfClass("Humanoid"):GetPlayingAnimationTracks()) do
                                    if table.find(dodgeAnims, tonumber(track.Animation.AnimationId:match("%d+"))) then
                                        dodging = true
                                        break
                                    end
                                end
                                if obj:FindFirstChild("M1ing") or dodging then
                                    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(obj.Head.Position + obj.Head.CFrame.lookVector * -5, obj.Head.Position)
                                end
                            end
                        end
                    end)
                else
                    conn:Disconnect()
                end
            end)
        end)
    end
})

Tabs.Fight:Button({
    Title = "Easy Kill Player panel",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/7qmTI84P/raw"))()
    end,
})

local SelectedFlingTarget = nil
local FlingDeathConn = nil
local FlingEspLoop = nil
local FlingEspObjects = {}
local FlingEspEnabled = false
local FlingFlags = {
    teleport = false,
    fling = false,
    view = false,
    aimLockCam = false,
    aimLockChar = false,
    orbit = false,
    notifyOnDeath = false,
}

local function ShowNotification(title, text, icon, duration)
    StarterGui:SetCore("SendNotification", {
        Title = title or "Fenthub",
        Text = text,
        Icon = icon or "rbxassetid://139609729426886",
        Duration = duration or 5,
    })
end

local function AimCameraAtTarget(target)
    local tChar = target and target.Character
    local tHead = tChar and tChar:FindFirstChild("Head")
    if tHead then
        Workspace.CurrentCamera.CFrame = CFrame.new(Workspace.CurrentCamera.CFrame.Position, tHead.Position)
    end
end

local function AimCharacterAtTarget(target)
    local myChar = LocalPlayer.Character
    local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
    local tChar = target and target.Character
    local tRoot = tChar and tChar:FindFirstChild("HumanoidRootPart")
    if myRoot and tRoot then
        myRoot.CFrame = CFrame.new(myRoot.Position, tRoot.Position)
    end
end

local function UpdateFlingDeathNotify()
    if FlingDeathConn then FlingDeathConn:Disconnect() FlingDeathConn = nil end
    if FlingFlags.notifyOnDeath and SelectedFlingTarget then
        local char = SelectedFlingTarget.Character or SelectedFlingTarget.CharacterAdded:Wait()
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then
            FlingDeathConn = hum.Died:Connect(function()
                ShowNotification("Fenthub", SelectedFlingTarget.DisplayName .. " Died")
            end)
        end
    end
end

local function SelectFlingTarget(name)
    if FlingDeathConn then FlingDeathConn:Disconnect() FlingDeathConn = nil end
    SelectedFlingTarget = nil
    if not name or name == "" then
        ShowNotification("Fenthub", "No One Selected")
        return
    end
    
    local target = nil
    local lowerName = string.lower(name)
    for _, p in ipairs(Players:GetPlayers()) do
        if string.find(string.lower(p.Name), lowerName, 1, true) or string.find(string.lower(p.DisplayName), lowerName, 1, true) then
            target = p
            break
        end
    end
    
    if target then
        SelectedFlingTarget = target
        ShowNotification("Fenthub", "Selected: " .. target.DisplayName, "https://www.roblox.com/headshot-thumbnail/image?userId=" .. target.UserId .. "&width=420&height=420&format=png", 10)
        UpdateFlingDeathNotify()
    else
        ShowNotification("Fenthub", "Player Not Found...")
    end
end

local function CreateFlingEsp(player)
    local head = player.Character and player.Character:FindFirstChild("Head")
    if not head then return end
    
    local bg = Instance.new("BillboardGui")
    bg.Name = "ESP_Billboard"
    bg.Size = UDim2.new(0, 200, 0, 50)
    bg.Adornee = head
    bg.AlwaysOnTop = true
    
    local frame = Instance.new("Frame", bg)
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundColor3 = Color3.new(0.8, 0, 0)
    frame.BackgroundTransparency = 0.6
    
    local corner = Instance.new("UICorner", frame)
    corner.CornerRadius = UDim.new(0, 8)
    
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.new(1, 1, 1)
    label.Text = player.DisplayName
    label.Font = Enum.Font.SourceSansBold
    label.TextSize = 16
    
    FlingEspObjects[player] = { billboard = bg }
    bg.Parent = LocalPlayer.PlayerGui
end

local function UpdateFlingEsp(player)
    local data = FlingEspObjects[player]
    if not data or not data.billboard then return end
    local head = player.Character and player.Character:FindFirstChild("Head")
    if head and data.billboard.Adornee ~= head then
        data.billboard.Adornee = head
    end
end

local function RemoveFlingEsp(player)
    if FlingEspObjects[player] then
        if FlingEspObjects[player].billboard then
            FlingEspObjects[player].billboard:Destroy()
        end
        FlingEspObjects[player] = nil
    end
end

local function RunFlingEspLoop()
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") then
            if not FlingEspObjects[p] then CreateFlingEsp(p) else UpdateFlingEsp(p) end
        elseif FlingEspObjects[p] then
            RemoveFlingEsp(p)
        end
    end
end

Tabs.Fling:Button({
    Title = "Copy Discord Link",
    Callback = function()
        setclipboard("https://discord.gg/xpSsT7GVM4")
        ShowNotification("Fenthub", "Discord link copied to clipboard!")
    end,
})

Tabs.Fling:Section({ Title = "Player Selection", Icon = "eye" })

Tabs.Fling:Input({
    Title = "Select Player",
    Desc = "Enter Player Name To Select Target",
    Placeholder = "PlayerName",
    Callback = function(val) SelectFlingTarget(val) end
})

Tabs.Fling:Section({ Title = "Player Actions" })

Tabs.Fling:Button({
    Title = "Teleport to Player",
    Callback = function()
        if not SelectedFlingTarget then ShowNotification("Fenthub", "No One Selected") return end
        local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local tRoot = SelectedFlingTarget.Character and SelectedFlingTarget.Character:FindFirstChild("HumanoidRootPart")
        if myRoot and tRoot then
            myRoot.CFrame = tRoot.CFrame
        else
            ShowNotification("Fenthub", "Could not find character to teleport.")
        end
    end,
})

Tabs.Fling:Toggle({
    Title = "Loop Teleport",
    Value = false,
    Callback = function(state)
        FlingFlags.teleport = state
        if not state then return end
        if not SelectedFlingTarget then ShowNotification("Fenthub", "No One Selected") FlingFlags.teleport = false return end
        task.spawn(function()
            while FlingFlags.teleport do
                if SelectedFlingTarget and SelectedFlingTarget.Parent and LocalPlayer.Character and SelectedFlingTarget.Character then
                    local myRoot = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    local tRoot = SelectedFlingTarget.Character:FindFirstChild("HumanoidRootPart")
                    if myRoot and tRoot then
                        myRoot.CFrame = tRoot.CFrame
                        task.wait()
                    else
                        FlingFlags.teleport = false
                        break
                    end
                else
                    break
                end
            end
        end)
    end
})

Tabs.Fling:Button({
    Title = "Fling Player",
    Callback = function()
        if not SelectedFlingTarget then ShowNotification("Fenthub", "No One Selected") return end
        miniFling(SelectedFlingTarget)
    end,
})

Tabs.Fling:Toggle({
    Title = "Loop Fling",
    Value = false,
    Callback = function(state)
        FlingFlags.fling = state
        if not state then return end
        if not SelectedFlingTarget then ShowNotification("Fenthub", "No One Selected") FlingFlags.fling = false return end
        task.spawn(function()
            while FlingFlags.fling do
                if SelectedFlingTarget and SelectedFlingTarget.Parent then
                    miniFling(SelectedFlingTarget)
                    task.wait(0.5)
                else
                    break
                end
            end
        end)
    end
})

Tabs.Fling:Button({
    Title = "View Player (3 sec)",
    Callback = function()
        if not SelectedFlingTarget then ShowNotification("Fenthub", "No One Selected") return end
        local hum = SelectedFlingTarget.Character and SelectedFlingTarget.Character:FindFirstChildOfClass("Humanoid")
        if hum then
            Workspace.CurrentCamera.CameraSubject = hum
            task.delay(3, function()
                if Workspace.CurrentCamera.CameraSubject == hum then
                    Workspace.CurrentCamera.CameraSubject = LocalPlayer.Character.Humanoid
                end
            end)
        else
            ShowNotification("Fenthub", "Could not find the player's character to view.")
        end
    end,
})

Tabs.Fling:Toggle({
    Title = "Loop View",
    Value = false,
    Callback = function(state)
        FlingFlags.view = state
        if not state then Workspace.CurrentCamera.CameraSubject = LocalPlayer.Character.Humanoid return end
        if not SelectedFlingTarget then ShowNotification("Fenthub", "No One Selected") FlingFlags.view = false return end
        task.spawn(function()
            while FlingFlags.view do
                if SelectedFlingTarget and SelectedFlingTarget.Parent then
                    local hum = SelectedFlingTarget.Character and SelectedFlingTarget.Character:FindFirstChildOfClass("Humanoid")
                    if hum then Workspace.CurrentCamera.CameraSubject = hum end
                    task.wait(0.1)
                else
                    break
                end
            end
            Workspace.CurrentCamera.CameraSubject = LocalPlayer.Character.Humanoid
        end)
    end
})

Tabs.Fling:Toggle({
    Title = "AimLock (Camera)",
    Value = false,
    Callback = function(state)
        FlingFlags.aimLockCam = state
        if not state then return end
        if not SelectedFlingTarget then ShowNotification("Fenthub", "No One Selected") FlingFlags.aimLockCam = false return end
        task.spawn(function()
            while FlingFlags.aimLockCam do
                if SelectedFlingTarget and SelectedFlingTarget.Parent then
                    AimCameraAtTarget(SelectedFlingTarget)
                    RunService.RenderStepped:Wait()
                else
                    break
                end
            end
        end)
    end
})

Tabs.Fling:Toggle({
    Title = "AimLock (Character)",
    Value = false,
    Callback = function(state)
        FlingFlags.aimLockChar = state
        if not state then return end
        if not SelectedFlingTarget then ShowNotification("Fenthub", "No One Selected") FlingFlags.aimLockChar = false return end
        task.spawn(function()
            while FlingFlags.aimLockChar do
                if SelectedFlingTarget and SelectedFlingTarget.Parent then
                    AimCharacterAtTarget(SelectedFlingTarget)
                    RunService.Heartbeat:Wait()
                else
                    break
                end
            end
        end)
    end
})

Tabs.Fling:Toggle({
    Title = "ESP",
    Value = false,
    Callback = function(state)
        FlingEspEnabled = state
        if state then
            if not FlingEspLoop then FlingEspLoop = RunService.RenderStepped:Connect(RunFlingEspLoop) end
        else
            if FlingEspLoop then FlingEspLoop:Disconnect() FlingEspLoop = nil end
            for p, _ in pairs(FlingEspObjects) do RemoveFlingEsp(p) end
            table.clear(FlingEspObjects)
        end
    end
})

local OrbitHeartbeat = nil
local OrbitRender = nil

Tabs.Fling:Toggle({
    Title = "Orbit Player",
    Value = false,
    Callback = function(state)
        FlingFlags.orbit = state
        if OrbitHeartbeat then OrbitHeartbeat:Disconnect() OrbitHeartbeat = nil end
        if OrbitRender then OrbitRender:Disconnect() OrbitRender = nil end
        if not state then return end
        if not SelectedFlingTarget then ShowNotification("Fenthub", "No One Selected") FlingFlags.orbit = false return end
        
        task.spawn(function()
            local angle = 0
            local speed = 8
            local radius = 10
            OrbitHeartbeat = RunService.Heartbeat:Connect(function()
                if not FlingFlags.orbit or not SelectedFlingTarget or not SelectedFlingTarget.Parent then
                    if OrbitHeartbeat then OrbitHeartbeat:Disconnect() end
                    if OrbitRender then OrbitRender:Disconnect() end
                    return
                end
                local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                local tRoot = SelectedFlingTarget.Character and SelectedFlingTarget.Character:FindFirstChild("HumanoidRootPart")
                if not myRoot or not tRoot then FlingFlags.orbit = false return end
                angle = angle + speed
                myRoot.CFrame = CFrame.new(tRoot.Position) * CFrame.Angles(0, math.rad(angle), 0) * CFrame.new(radius, 0, 0)
            end)
            
            OrbitRender = RunService.RenderStepped:Connect(function()
                if not FlingFlags.orbit or not SelectedFlingTarget or not SelectedFlingTarget.Parent then return end
                local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                local tRoot = SelectedFlingTarget.Character and SelectedFlingTarget.Character:FindFirstChild("HumanoidRootPart")
                if not myRoot or not tRoot then FlingFlags.orbit = false return end
                myRoot.CFrame = CFrame.new(myRoot.Position, tRoot.Position)
            end)
        end)
    end
})

Tabs.Fling:Toggle({
    Title = "Notify On Death",
    Value = false,
    Callback = function(state)
        FlingFlags.notifyOnDeath = state
        UpdateFlingDeathNotify()
    end
})

Players.PlayerRemoving:Connect(function(p)
    if SelectedFlingTarget and p == SelectedFlingTarget then
        ShowNotification("Fenthub", p.DisplayName .. " left the game")
        SelectedFlingTarget = nil
        for k in pairs(FlingFlags) do FlingFlags[k] = false end
    end
    RemoveFlingEsp(p)
end)

Tabs.Fling:Section({ Title = "Fling", Icon = "utensils" })

local FlingAuraEnabled = false
Tabs.Fling:Toggle({
    Title = "Fling Aura",
    Value = false,
    Callback = function(state)
        FlingAuraEnabled = state
        if state then
            task.spawn(function()
                while FlingAuraEnabled do
                    local char = LocalPlayer.Character
                    if char and char:FindFirstChild("HumanoidRootPart") then
                        for _, p in pairs(Players:GetPlayers()) do
                            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and (char.HumanoidRootPart.Position - p.Character.HumanoidRootPart.Position).Magnitude <= 15 then
                                pcall(function() miniFling(p) end)
                            end
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    end
})

LocalPlayer.CharacterAdded:Connect(function() FlingAuraEnabled = false end)

local ClickFlingEnabled = false
local Mouse = LocalPlayer:GetMouse()

Tabs.Fling:Toggle({
    Title = "Click Fling",
    Value = false,
    Callback = function(state)
        ClickFlingEnabled = state
    end
})

Mouse.Button1Down:Connect(function()
    if not ClickFlingEnabled then return end
    local target = Mouse.Target
    if target and target.Parent and target.Parent:IsA("Model") then
        local p = Players:GetPlayerFromCharacter(target.Parent)
        if p and p ~= LocalPlayer then miniFling(p) end
    end
end)

UserInputService.TouchTap:Connect(function(pos, processed)
    if not ClickFlingEnabled or processed then return end
    local location = pos[1]
    local ray = Workspace.CurrentCamera:ViewportPointToRay(location.X, location.Y)
    local result = Workspace:Raycast(ray.Origin, ray.Direction * 500, RaycastParams.new())
    if result and result.Instance and result.Instance.Parent and result.Instance.Parent:IsA("Model") then
        local p = Players:GetPlayerFromCharacter(result.Instance.Parent)
        if p and p ~= LocalPlayer then miniFling(p) end
    end
end)

local FlingAllEnabled = false
local FlingAllOriginalCF = nil

Tabs.Fling:Toggle({
    Title = "Fling All (Buggy?)",
    Value = false,
    Callback = function(state)
        FlingAllEnabled = state
        if state then
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                FlingAllOriginalCF = LocalPlayer.Character.HumanoidRootPart.CFrame
            end
            task.spawn(function()
                while FlingAllEnabled do
                    for _, p in pairs(Players:GetPlayers()) do
                        if p ~= LocalPlayer then miniFling(p) end
                    end
                    task.wait(0.5)
                end
            end)
        elseif FlingAllOriginalCF and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.CFrame = FlingAllOriginalCF
        end
    end
})

local TouchFlingEnabled = false
local TouchFlingDecal = nil
if not ReplicatedStorage:FindFirstChild("juisdfj0i32i0eidsuf0iok") then
    TouchFlingDecal = Instance.new("Decal")
    TouchFlingDecal.Name = "juisdfj0i32i0eidsuf0iok"
    TouchFlingDecal.Parent = ReplicatedStorage
end

local function TouchFlingLoop(strength)
    local dir = 0.1
    while TouchFlingEnabled do
        RunService.Heartbeat:Wait()
        local root = nil
        while true do
            if TouchFlingEnabled then
                if LocalPlayer.Character then
                    root = LocalPlayer.Character:FindFirstChild("HumanoidRootPart") or LocalPlayer.Character:FindFirstChild("Torso") or LocalPlayer.Character:FindFirstChild("UpperTorso")
                    if root then break end
                end
                RunService.Heartbeat:Wait()
            else
                break
            end
        end
        
        if TouchFlingEnabled and root then
            local vel = root.Velocity
            root.Velocity = vel * (strength or 10000) + Vector3.new(0, (strength and 100 or 10000), 0)
            RunService.RenderStepped:Wait()
            if root and root.Parent then root.Velocity = vel end
            RunService.Stepped:Wait()
            if root and root.Parent then
                root.Velocity = vel + Vector3.new(0, dir, 0)
                dir = dir * -1
            end
        end
    end
end

Tabs.Fling:Toggle({
    Title = "Touch Fling",
    Value = false,
    Callback = function(state)
        TouchFlingEnabled = state
        if state then coroutine.wrap(TouchFlingLoop)(nil) end
    end
})

local AntiFlingEnabled = false
local AntiFlingConns = {}

local function DisableCollisions(player)
    if AntiFlingEnabled and player.Character then
        for _, part in pairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide then
                part.CanCollide = false
            end
        end
    end
end

local function EnableCollisions()
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            for _, part in pairs(p.Character:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = true end
            end
        end
    end
end

Tabs.Fling:Toggle({
    Title = "Anti Fling",
    Value = false,
    Callback = function(state)
        AntiFlingEnabled = state
        if state then
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= LocalPlayer then
                    table.insert(AntiFlingConns, RunService.Stepped:Connect(function() DisableCollisions(p) end))
                end
            end
            Players.PlayerAdded:Connect(function(p)
                if p ~= LocalPlayer then
                    table.insert(AntiFlingConns, RunService.Stepped:Connect(function() DisableCollisions(p) end))
                end
            end)
        else
            for _, conn in pairs(AntiFlingConns) do conn:Disconnect() end
            table.clear(AntiFlingConns)
            EnableCollisions()
        end
    end
})

local CustomFlingPower = 1000
Tabs.Fling:Toggle({
    Title = "Costum Touch Fling Power",
    Value = false,
    Callback = function(state)
        TouchFlingEnabled = state
        if state then coroutine.wrap(TouchFlingLoop)(CustomFlingPower) end
    end
})

Tabs.Fling:Slider({
    Title = "Fling Power Value",
    Value = { Min = 1, Max = 10000, Default = 100 },
    Callback = function(val) CustomFlingPower = val end
})

Tabs.Place:Button({
    Title = "Copy Discord Link (join for more info)",
    Locked = false,
    Callback = function()
        setclipboard("https://discord.gg/xpSsT7GVM4")
    end,
})

Tabs.Place:Section({ Title = "TP Stuff", Icon = "eye" })

Tabs.Place:Button({
    Title = "Teleport Panel",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/uiTL0dfO/raw"))()
    end,
})

Tabs.Place:Button({
    Title = "TP Frozen Lock",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/yxXqDjA2/raw"))()
    end,
})

Tabs.Place:Button({
    Title = "TP Dummy",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/oJwPZY4a/raw"))()
    end,
})

Tabs.Place:Section({ Title = "Teleport Places", Icon = "map" })

local TeleportLocations = {
    { "Middle Of Map", 139, 440, 32 },
    { "Prison", 438, 439, -376 },
    { "Montain", 155, 628, -447 },
    { "Door 1", 17, 440, -301 },
    { "Door 2", 290, 440, 361 },
    { "Corner 1", 29, 442, 488 },
    { "Corner 2", -261, 442, -248 },
    { "Corner 3", 263, 442, -456 },
    { "Corner 4", 566, 442, 274 },
    { "Counter", -68, 29, 20346 },
    { "Counter Up", -78, 84, 20354 },
    { "Atomic Base", 1063, 30, 23006 },
    { "Atomic Base Up", 1063, 405, 23006 },
    { "Atomic Slash", 1063, 131, 23006 },
    { "Atomic Slash Up", 1063, 190, 23006 },
    { "Little SafeZone", 150, 505, 30 },
    { "Big SafeZone", 150, 705, 30 },
    { "Void", 150, -495, 30 },
    { "Darkness", 0, 9e11, 0 },
    { "Smoke", 0, -1, 0 },
    { "Pixel", 30000000, 30000000, 30000000 },
}

for _, loc in ipairs(TeleportLocations) do
    Tabs.Place:Button({
        Title = loc[1],
        Locked = false,
        Callback = function()
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.CFrame = CFrame.new(loc[2], loc[3], loc[4])
            end
        end
    })
end

Tabs.Moveset:Button({
    Title = "Copy Discord Link (join for more info)",
    Locked = false,
    Callback = function()
        setclipboard("https://discord.gg/xpSsT7GVM4")
    end,
})

Tabs.Moveset:Section({ Title = "Characther Movesets", Icon = "box" })

local MovesetScripts = {
    { "The Garbage Ghost (Universal)", "https://raw.githubusercontent.com/DiosDi/VexonHub/refs/heads/main/TheGarbageGhost" },
    { "Trash-Can Man (Universal)", "https://raw.githubusercontent.com/yes1nt/yes/refs/heads/main/Trashcan%20Man" },
    { "StarGlicher (Universal)", "https://raw.githubusercontent.com/Reapvitalized/TSB/refs/heads/main/SG_DEMO.lua" },
    { "JK (Saitama)", "https://rawscripts.net/raw/The-Strongest-Battlegrounds-JK-Moveset-24889" },
    { "Kenjihin (Saitama)", "https://raw.githubusercontent.com/Kenjihin69/Kenjihin69/refs/heads/main/Tp%20exploit%20saitama%20to%20jun" },
    { "Gojo 1 (Saitama)", "https://raw.githubusercontent.com/Nova2ezz/jjs-gojo-/refs/heads/main/SaitamaToGojoV3_SOURCE-obfuscated_2.txt" },
    { "Gojo 3 (Saitama)", "https://pastebin.com/raw/3Cz8kF8M" },
    { "Mahito (Saitama)", "https://raw.githubusercontent.com/dendendenver1/mahitotsbthing/refs/heads/main/main.lua" },
    { "Yuji/Sukuna (Saitama)", "https://pastebin.com/raw/1yaXL0rA" },
    { "Ichigo Kurosaki (Saitama)", "https://raw.githubusercontent.com/grest0n/CustomMovesets/refs/heads/main/Ichigo%20Kurosaki" },
    { "JJS Gojo (Saitama)", "https://gist.githubusercontent.com/JcBoomin/a63e9ac3e90cef03ecf37e997fd21632/raw/98b567b81f61bb30042e0078b78f3fb24685fb8d/Gojo" },
    { "Hakari (Saitama)", "https://raw.githubusercontent.com/dendendenver1/HakariTSB/refs/heads/main/HakariTSB.lua" },
    { "KJ (Garou)", "https://rawscripts.net/raw/KJ-The-Strongest-Battlegrounds-Garou-to-kj-27085" },
    { "Chainsaw Man (Garou)", "https://gist.githubusercontent.com/GoldenHeads2/0fd8d36993c850f3fac89e5adf793076/raw/ab4f5a42bd0b2e24a32a46301d533ea849ca771c/gistfile1.txt" },
    { "Okarun (Garou)", "https://rawscripts.net/raw/The-Strongest-Battlegrounds-Garou-to-OKARUN-24065" },
    { "Sukuna (Garou)", "https://rawscripts.net/raw/The-Strongest-Battlegrounds-Garou-to-Sukuna-24081" },
    { "Gojo (Garou)", "https://pastebin.com/raw/3Cz8kF8M" },
    { "Cyber Psycho (Garou)", "https://pastebin.com/raw/7V1mUBtQ" },
    { "Suriyu (Garou)", "https://rawscripts.net/raw/he-Strongest-Battlegrounds-Garou-to-Suiryu-script-18098" },
    { "Goku V2 (Garou)", "https://rawscripts.net/raw/The-Strongest-Battlegrounds-Goku-Moveset-V2-17977" },
    { "Toji (Atomic Samurai)", "https://rawscripts.net/raw/The-Strongest-Battlegrounds-Toji-moveset-for-Atomic-Samurai-22498" },
    { "Toji 2 (Atomic Samurai)", "https://paste.ee/r/0uIxM" },
    { "Sukuna (Atomic Samurai)", "https://pastebin.com/raw/gUrBYsGK" },
    { "Toji (Sonic)", "https://rawscripts.net/raw/The-Strongest-Battlegrounds-Toji-moveset-21449" },
    { "Voltra (Sonic)", "https://raw.githubusercontent.com/Reapvitalized/TSB/refs/heads/main/VOLTA.lua" },
}

for _, ms in ipairs(MovesetScripts) do
    Tabs.Moveset:Button({
        Title = ms[1],
        Locked = false,
        Callback = function() loadstring(game:HttpGet(ms[2], true))() end
    })
end

Tabs.Moveset:Button({
    Title = "Gojo 2 (Saitama)",
    Locked = false,
    Callback = function()
        getgenv().morph = true
        loadstring(game:HttpGet("https://raw.githubusercontent.com/skibiditoiletfan2007/BaldyToSorcerer/refs/heads/main/LatestV2.lua"))()
    end,
})

Tabs.Moveset:Button({
    Title = "Arcaura (Garou)",
    Locked = false,
    Callback = function()
        getgenv().OptimizeUltimate = false
        getgenv().ReduceUltFlash = true
        getgenv().Move1Insta = false
        getgenv().LowQualityMode = true
        getgenv().BetaConsole = true
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Reapvitalized/TSB/refs/heads/main/ARCAURA.lua"))()
    end,
})

Tabs.Moveset:Button({
    Title = "Minos Prime (Garou)",
    Locked = false,
    Callback = function()
        _G.SkipIntro = true
        _G.Night = false
        loadstring(game:HttpGet("https://raw.githubusercontent.com/S1gmaGuy/MinosPrimeFixed/refs/heads/main/ThefixIsSoSigma"))()
    end,
})

Tabs.Moveset:Button({
    Title = "APOPHENIA (Metal Bat)",
    Locked = false,
    Callback = function()
        getgenv().Music = false
        getgenv().AttackQuality = "High"
        getgenv().ConstantSpeed = false
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Reapvitalized/TSB/main/APOPHENIA.lua"))()
    end,
})

local function HttpRequest(req)
    if HttpService.RequestAsync then
        local response = HttpService:RequestAsync({
            Url = req.Url,
            Method = req.Method or "GET",
            Headers = req.Headers or {},
        })
        return { Body = response.Body, StatusCode = response.StatusCode, Success = response.Success }
    end
    return { Body = HttpService:GetAsync(req.Url), StatusCode = 200, Success = true }
end

local DiscordCode = "xpSsT7GVM4"
local DiscordApiUrl = "https://discord.com/api/v10/invites/" .. DiscordCode .. "?with_counts=true&with_expiration=true"

task.spawn(function()
    local success, response = pcall(function()
        return HttpService:JSONDecode(HttpRequest({
            Url = DiscordApiUrl,
            Method = "GET",
            Headers = { ["User-Agent"] = "RobloxBot/1.0", Accept = "application/json" }
        }).Body)
    end)
    
    if success and response and response.guild then
        local guild = response.guild
        local stats = Tabs.Info:Paragraph({
            Title = guild.name,
            Desc = " <font color=\"#52525b\">●</font> Member Count : " .. tostring(response.approximate_member_count) .. "\n <font color=\"#16a34a\">●</font> Online Count : " .. tostring(response.approximate_presence_count),
            Image = "https://cdn.discordapp.com/icons/" .. guild.id .. "/" .. guild.icon .. ".png?size=1024",
            ImageSize = 42,
        })
        
        Tabs.Info:Button({
            Title = "Update Info",
            Callback = function()
                local s, r = pcall(function()
                    return HttpService:JSONDecode(HttpRequest({ Url = DiscordApiUrl, Method = "GET" }).Body)
                end)
                if s and r and r.guild then
                    stats:SetDesc(" <font color=\"#52525b\">●</font> Member Count : " .. tostring(r.approximate_member_count) .. "\n <font color=\"#16a34a\">●</font> Online Count : " .. tostring(r.approximate_presence_count))
                    WindUI:Notify({ Title = "Discord Info Updated", Content = "Successfully refreshed Discord statistics", Duration = 2, Icon = "refresh-cw" })
                else
                    WindUI:Notify({ Title = "Update Failed", Content = "Could not refresh Discord info", Duration = 3, Icon = "alert-triangle" })
                end
            end,
        })
        
        Tabs.Info:Button({
            Title = "Copy Discord Invite",
            Callback = function()
                setclipboard("https://discord.gg/xpSsT7GVM4" .. DiscordCode)
                WindUI:Notify({ Title = "Copied!", Content = "Discord invite copied to clipboard", Duration = 2, Icon = "clipboard-check" })
            end,
        })
    else
        Tabs.Info:Paragraph({
            Title = "Error fetching Discord Info",
            Desc = "Unable to load Discord information. Check your internet connection.",
            Image = "triangle-alert",
            ImageSize = 26,
            Color = "Red",
        })
        print("Discord API Error:", response)
    end
end)

Tabs.Info:Divider()
Tabs.Info:Section({ Title = "Fenthub", TextXAlignment = "Center", TextSize = 17 })
Tabs.Info:Divider()

Tabs.Info:Paragraph({
    Title = "Owner:",
    Desc = "Fent/muh",
    Image = "rbxassetid://139609729426886",
    ImageSize = 30,
    Thumbnail = "",
    ThumbnailSize = 0,
    Locked = false,
})

Tabs.Info:Paragraph({
    Title = "Discord",
    Desc = "Join our discord for more info and stuff",
    Image = "rbxassetid://139609729426886",
    ImageSize = 30,
    Thumbnail = "",
    ThumbnailSize = 0,
    Locked = false,
    Buttons = {
        {
            Icon = "copy",
            Title = "Copy Link",
            Callback = function()
                setclipboard("https://discord.gg/xpSsT7GVM4")
            end,
        }
    },
})
