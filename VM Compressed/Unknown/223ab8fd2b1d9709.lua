local UIS = game:GetService("UserInputService")
if UIS.TouchEnabled and not UIS.MouseEnabled and not UIS.KeyboardEnabled then
    getgenv().bypass_adonis = true
    loadstring(game:HttpGet('https://raw.githubusercontent.com/FakeAngles/PasteWare-v2/refs/heads/main/PasteWareV2LegacyMobile.lua'))() return
end

if not game:IsLoaded() then
    game.Loaded:Wait()
end

if not syn or not protectgui then
    getgenv().protectgui = function() end
end

if bypass_adonis then
    task.spawn(function()
        local g = getinfo or debug.getinfo
        local d = false
        local h = {}
        local x, y
        setthreadidentity(2)
        for i, v in getgc(true) do
            if typeof(v) == "table" then
                local a = rawget(v, "Detected")
                local b = rawget(v, "Kill")

                if typeof(a) == "function" and not x then
                    x = a
                    local o; o = hookfunction(x, function(c, f, n)
                        if c ~= "_" then
                            if d then
                            end
                        end
                        return true
                    end)
                    table.insert(h, x)
                end

                if rawget(v, "Variables") and rawget(v, "Process") and typeof(b) == "function" and not y then
                    y = b
                    local o; o = hookfunction(y, function(f)
                        if d then
                        end
                    end)
                    table.insert(h, y)
                end
            end
        end
        local o; o = hookfunction(getrenv().debug.info, newcclosure(function(...)
            local a, f = ...
            if x and a == x then
                return coroutine.yield(coroutine.running())
            end
            return o(...)
        end))
        setthreadidentity(7)
    end)
end

if not getgenv().ScriptState then
    getgenv().ScriptState = {
        isLockedOn = false,
        targetPlayer = nil,
        lockEnabled = false,
        aimLockKeyMode = "Toggle",
        aimLockVisibleCheck = false,
        aimLockAliveCheck = false,
        aimLockTeamCheck = false,
        smoothingFactor = 0.1,
        predictionFactor = 0.0,
        bodyPartSelected = "Head",
        ClosestHitPart = nil,
        previousHighlight = nil,
        lockedTime = 12,
        reverseResolveIntensity = 5,
        Desync = false,
        antiLockEnabled = false,
        resolverIntensity = 1.0,
        resolverMethod = "Recalculate",
        fovEnabled = false,
        fovMode = "Mouse",
        nebulaEnabled = false,
        fovValue = 70,
        SelfChamsEnabled = false,
        RainbowChamsEnabled = false,
        SelfChamsColor = Color3.fromRGB(255, 255, 255),
        ChamsEnabled = false,
        isSpeedActive = false,
        isFlyActive = false,
        isNoClipActive = false,
        flySpeed = 1,
        Cmultiplier = 1,
        strafeEnabled = false,
        strafeSpeed = 50,
        strafeRadius = 5,
        strafeMode = "Horizontal",
        strafeTargetPart = nil,
        originalCameraMode = nil,
    }
end

local SilentAimSettings = {
    Enabled = false,

    ClassName = "PasteWare  |  github.com/FakeAngles",
    ToggleKey = "None",
    KeyMode = "Toggle",

    TeamCheck = false,
    VisibleCheck = false,
    AliveCheck = false,
    TargetPart = "HumanoidRootPart",
    SilentAimMethod = "Raycast",

    FOVRadius = 130,
    FOVVisible = false,
    ShowSilentAimTarget = false,

    HitChance = 100,
    MultiplyUnitBy = 1000,
    BlockedMethods = {},
    Include = { Character = true, Camera = true },
    Origin = { Camera = true },
    BulletTP = false,
    CheckForFireFunc = false,
}

getgenv().SilentAimSettings = SilentAimSettings

local Services = {
    Players = game:GetService("Players"),
    RunService = game:GetService("RunService"),
    GuiService = game:GetService("GuiService"),
    UserInputService = game:GetService("UserInputService"),
    HttpService = game:GetService("HttpService"),
    ReplicatedStorage = game:GetService("ReplicatedStorage"),
    Lighting = game:GetService("Lighting"),
    SoundService = game:GetService("SoundService")
}

local Players = Services.Players
local RunService = Services.RunService
local GuiService = Services.GuiService
local UserInputService = Services.UserInputService
local HttpService = Services.HttpService
local ReplicatedStorage = Services.ReplicatedStorage
local SoundService = Services.SoundService
local Camera = workspace.CurrentCamera

local LocalPlayer = Players.LocalPlayer
local Client = LocalPlayer

local GetChildren = game.GetChildren
local GetPlayers = Players.GetPlayers
local WorldToScreen = Camera.WorldToScreenPoint
local WorldToViewportPoint = Camera.WorldToViewportPoint
local GetPartsObscuringTarget = Camera.GetPartsObscuringTarget
local FindFirstChild = game.FindFirstChild
local RenderStepped = RunService.RenderStepped
local GuiInset = GuiService.GetGuiInset
local GetMouseLocation = UserInputService.GetMouseLocation

local ValidTargetParts = {"Head", "HumanoidRootPart"}
local PredictionAmount = 0.165

local fov_circle = Drawing.new("Circle")
fov_circle.Thickness = 1
fov_circle.NumSides = 100
fov_circle.Radius = 180
fov_circle.Filled = false
fov_circle.Visible = false
fov_circle.ZIndex = 999
fov_circle.Transparency = 1
fov_circle.Color = Color3.fromRGB(54, 57, 241)

local ExpectedArguments = {
    ViewportPointToRay = {
        ArgCountRequired = 2,
        Args = { "number", "number" }
    },
    ScreenPointToRay = {
        ArgCountRequired = 2,
        Args = { "number", "number" }
    },
    Raycast = {
        ArgCountRequired = 3,
        Args = { "Instance", "Vector3", "Vector3", "RaycastParams" }
    },
    FindPartOnRay = {
        ArgCountRequired = 2,
        Args = { "Ray", "Instance?", "boolean?", "boolean?" }
    },
    FindPartOnRayWithIgnoreList = {
        ArgCountRequired = 2,
        Args = { "Ray", "table", "boolean?", "boolean?" }
    },
    FindPartOnRayWithWhitelist = {
        ArgCountRequired = 2,
        Args = { "Ray", "table", "boolean?" }
    }
}

function CalculateChance(Percentage)

    Percentage = math.floor(Percentage)


    local chance = math.floor(Random.new().NextNumber(Random.new(), 0, 1) * 100) / 100


    return chance <= Percentage / 100
end


local function getPositionOnScreen(Vector)
    local Vec3, OnScreen = WorldToScreen(Camera, Vector)
    return Vector2.new(Vec3.X, Vec3.Y), OnScreen
end

local function ValidateArguments(Args, RayMethod)
    local Matches = 0
    if #Args < RayMethod.ArgCountRequired then
        return false
    end

    for Pos, Argument in next, Args do
        local Expected = RayMethod.Args[Pos]
        if not Expected then
            break
        end

        local IsOptional = Expected:sub(-1) == "?"
        local BaseType = IsOptional and Expected:sub(1, -2) or Expected

        if typeof(Argument) == BaseType then
            Matches = Matches + 1
        elseif IsOptional and Argument == nil then
            Matches = Matches + 1
        end
    end

    return Matches >= RayMethod.ArgCountRequired
end

local function getDirection(Origin, Position)
    return (Position - Origin).Unit
end

local function getMousePosition()
    return GetMouseLocation(UserInputService)
end

local function getFovOrigin()
    if ScriptState.fovMode == "Center" then
        local viewportSize = Camera.ViewportSize
        return Vector2.new(viewportSize.X / 2, viewportSize.Y / 2)
    end

    return getMousePosition()
end

local function getTeamComparisonOption()
    local esp = rawget(getgenv(), "ExunysDeveloperESP")
    if esp and esp.DeveloperSettings and esp.DeveloperSettings.TeamCheckOption then
        return esp.DeveloperSettings.TeamCheckOption
    end
end

local function playersOnSameTeam(player)
    if not player then
        return false
    end

    local option = getTeamComparisonOption()
    if option then
        local okLocal, localValue = pcall(function()
            return LocalPlayer[option]
        end)
        local okTarget, targetValue = pcall(function()
            return player[option]
        end)

        if okLocal and okTarget and localValue ~= nil and targetValue ~= nil then
            return targetValue == localValue
        end
    end

    local okLocalTeam, localTeam = pcall(function()
        return LocalPlayer.Team
    end)
    local okTargetTeam, targetTeam = pcall(function()
        return player.Team
    end)

    if okLocalTeam and okTargetTeam and localTeam and targetTeam then
        return targetTeam == localTeam
    end

    local okLocalColor, localColor = pcall(function()
        return LocalPlayer.TeamColor
    end)
    local okTargetColor, targetColor = pcall(function()
        return player.TeamColor
    end)

    if okLocalColor and okTargetColor and localColor and targetColor then
        return targetColor == localColor
    end

    return false
end

local function IsPlayerVisible(Player)
    local PlayerCharacter = Player and Player.Character
    local LocalPlayerCharacter = LocalPlayer.Character

    if not (PlayerCharacter and LocalPlayerCharacter) then
        return false
    end

    local targetPartOption = (Options and Options.TargetPart and Options.TargetPart.Value) or SilentAimSettings.TargetPart or "HumanoidRootPart"
    local PlayerRoot = FindFirstChild(PlayerCharacter, targetPartOption) or FindFirstChild(PlayerCharacter, "HumanoidRootPart")

    if not PlayerRoot then
        return false
    end

    local CastPoints, IgnoreList = { PlayerRoot.Position, LocalPlayerCharacter, PlayerCharacter }, { LocalPlayerCharacter, PlayerCharacter }
    local ObscuringObjects = #GetPartsObscuringTarget(Camera, CastPoints, IgnoreList)

    return ObscuringObjects == 0
end

local function normalizeSelection(selection)
    if not selection then
        return {}
    end

    local normalized = {}

    if type(selection) ~= "table" then
        normalized[selection] = true
        return normalized
    end

    local hasNumericKeys = false
    for key in pairs(selection) do
        if type(key) == "number" then
            hasNumericKeys = true
            break
        end
    end

    if hasNumericKeys then
        for _, value in ipairs(selection) do
            normalized[value] = true
        end
    else
        for key, value in pairs(selection) do
            if type(key) == "string" then
                if value == true then
                    normalized[key] = true
                elseif type(value) == "string" then
                    normalized[value] = true
                end
            end
        end
    end

    return normalized
end

local function isSelectionActive(selection, option)
    return selection and selection[option] or false
end

SilentAimSettings.BlockedMethods = normalizeSelection(SilentAimSettings.BlockedMethods)
SilentAimSettings.Include = normalizeSelection(SilentAimSettings.Include)
SilentAimSettings.Origin = normalizeSelection(SilentAimSettings.Origin)

local function getClosestPlayer(config)
    config = config or {}

    local targetPartOption = config.targetPart or (Options and Options.TargetPart and Options.TargetPart.Value) or SilentAimSettings.TargetPart
    if not targetPartOption then
        return nil, nil
    end

    local ignoredPlayers = config.ignoredPlayers or (Options and Options.PlayerDropdown and Options.PlayerDropdown.Value)
    local radiusOption = config.radius or (Options and Options.Radius and Options.Radius.Value) or SilentAimSettings.FOVRadius or 2000
    local visibleCheck = config.visibleCheck
    if visibleCheck == nil then
        visibleCheck = SilentAimSettings.VisibleCheck
    end
    local aliveCheck = config.aliveCheck
    if aliveCheck == nil then
        aliveCheck = SilentAimSettings.AliveCheck
    end
    local teamCheck = config.teamCheck
    if teamCheck == nil then
        local silentAimTeamCheck = SilentAimSettings.TeamCheck
        local aimLockTeamCheck = ScriptState and ScriptState.aimLockTeamCheck
        local toggleValue = Toggles and Toggles.TeamCheck and Toggles.TeamCheck.Value
        teamCheck = (toggleValue ~= nil and toggleValue) or silentAimTeamCheck or aimLockTeamCheck or false
    end

    local teamEvaluator = config.teamEvaluator
    if type(teamEvaluator) ~= "function" then
        teamEvaluator = playersOnSameTeam
    end

    local originPosition = config.origin
    if typeof(originPosition) == "function" then
        originPosition = originPosition()
    end
    originPosition = originPosition or getFovOrigin()

    local ClosestPart
    local ClosestPlayer
    local DistanceToMouse

    for _, Player in next, GetPlayers(Players) do
        if Player == LocalPlayer then
            continue
        end

        if ignoredPlayers and ignoredPlayers[Player.Name] then
            continue
        end

        if teamCheck and teamEvaluator(Player) then
            continue
        end

        if visibleCheck and not IsPlayerVisible(Player) then
            continue
        end

        local Character = Player.Character
        if not Character then
            continue
        end

        local HumanoidRootPart = FindFirstChild(Character, "HumanoidRootPart")
        local Humanoid = FindFirstChild(Character, "Humanoid")

        if not HumanoidRootPart or not Humanoid then
            continue
        end

        if aliveCheck and Humanoid.Health <= 0 then
            continue
        end

        local ScreenPosition, OnScreen = getPositionOnScreen(HumanoidRootPart.Position)
        if not OnScreen then
            continue
        end

        local Distance = (originPosition - ScreenPosition).Magnitude
        if Distance <= (DistanceToMouse or radiusOption) then
            local targetPartName
            if targetPartOption == "Random" then
                targetPartName = ValidTargetParts[math.random(1, #ValidTargetParts)]
            else
                targetPartName = targetPartOption
            end

            local candidatePart = Character[targetPartName]
            if candidatePart then
                ClosestPart = candidatePart
                ClosestPlayer = Player
                DistanceToMouse = Distance
            end
        end
    end

    return ClosestPart, ClosestPlayer
end
local function getBodyPart(character, part)
    return character:FindFirstChild(part) and part or "Head"
end

local function getNearestPlayerToMouse()
    local _, player = getClosestPlayer({
        targetPart = ScriptState.bodyPartSelected,
        visibleCheck = ScriptState.aimLockVisibleCheck,
        aliveCheck = ScriptState.aimLockAliveCheck,
        teamCheck = ScriptState.aimLockTeamCheck
    })
    if player and player ~= LocalPlayer then
        return player
    end

    return nil
end

local function acquireLockTarget()
    local player = getNearestPlayerToMouse()
    if player and player.Character then
        local partName = getBodyPart(player.Character, ScriptState.bodyPartSelected)
        local targetPart = player.Character:FindFirstChild(partName)

        if targetPart then
            ScriptState.isLockedOn = true
            ScriptState.targetPlayer = player
            return true
        end
    end

    ScriptState.isLockedOn = false
    ScriptState.targetPlayer = nil
    return false
end

local function toggleLockOnPlayer(forceState)
    local desiredState = forceState
    if desiredState == nil then
        desiredState = not ScriptState.lockEnabled
    end

    ScriptState.lockEnabled = desiredState

    if desiredState then
        acquireLockTarget()
    else
        ScriptState.isLockedOn = false
        ScriptState.targetPlayer = nil
    end

    if Toggles.aimLockKeyToggle and Toggles.aimLockKeyToggle.Value ~= desiredState then
        Toggles.aimLockKeyToggle:SetValue(desiredState)
    end
end


RunService.RenderStepped:Connect(function()
    if ScriptState.lockEnabled and not ScriptState.isLockedOn then
        acquireLockTarget()
    end

    if ScriptState.lockEnabled and ScriptState.isLockedOn and ScriptState.targetPlayer and ScriptState.targetPlayer.Character then
        if ScriptState.aimLockTeamCheck and ScriptState.targetPlayer.Team == LocalPlayer.Team then
            ScriptState.isLockedOn = false
            ScriptState.targetPlayer = nil
            return
        end

        if ScriptState.aimLockVisibleCheck and not IsPlayerVisible(ScriptState.targetPlayer) then
            ScriptState.isLockedOn = false
            ScriptState.targetPlayer = nil
            return
        end

        local partName = getBodyPart(ScriptState.targetPlayer.Character, ScriptState.bodyPartSelected)
        local part = ScriptState.targetPlayer.Character:FindFirstChild(partName)

        if part and ScriptState.targetPlayer.Character:FindFirstChildOfClass("Humanoid").Health > 0 then
            local predictedPosition = part.Position + (part.AssemblyLinearVelocity * ScriptState.predictionFactor)
            local currentCameraPosition = Camera.CFrame.Position

            Camera.CFrame = CFrame.new(currentCameraPosition, predictedPosition) * CFrame.new(0, 0, ScriptState.smoothingFactor)
        else
            ScriptState.isLockedOn = false
            ScriptState.targetPlayer = nil
        end
    end
end)



local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/FakeAngles/PasteWareUI-Lib/refs/heads/main/PasteWareUIlib.lua"))()
local ThemeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/FakeAngles/PasteWareUI-Lib/refs/heads/main/manage2.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/FakeAngles/PasteWareUI-Lib/refs/heads/main/manager.lua"))()
local Window = Library:CreateWindow({
    Title = 'PasteWare  |  github.com/FakeAngles',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

local GeneralTab = Window:AddTab("Main")
local aimbox = GeneralTab:AddRightGroupbox("AimLock")
local velbox = GeneralTab:AddRightGroupbox("Anti Lock")
local frabox = GeneralTab:AddRightGroupbox("Movement")
local ExploitTab = Window:AddTab("Exploits")
local ACSEngineBox = ExploitTab:AddLeftGroupbox("ACS Engine")
local VisualsTab = Window:AddTab("Visuals")
local settingsTab = Window:AddTab("Settings")
local MenuGroup = settingsTab:AddLeftGroupbox("Menu")
MenuGroup:AddButton("Unload", function() Library:Unload() end)
MenuGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", { Default = "None", NoUI = true, Text = "Menu keybind" })
MenuGroup:AddToggle("ShowKeybinds", {
    Text = "Show Keybinds",
    Default = Library.KeybindFrame and Library.KeybindFrame.Visible or false,
    Callback = function(value)
        Library:SetKeybindListVisible(value)
    end,
})

if Library.KeybindFrame and Toggles.ShowKeybinds then
    Library:SetKeybindListVisible(Toggles.ShowKeybinds.Value)
end

Library.ToggleKeybind = Options.MenuKeybind
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
ThemeManager:ApplyToTab(settingsTab)
SaveManager:BuildConfigSection(settingsTab)

local lastAimLockKeyState = false
local lastAimLockKeyMode = ScriptState.aimLockKeyMode

aimbox:AddToggle("aimLockKeyToggle", {
    Text = "aimlock",
    Default = false,
    Tooltip = "Toggle AimLock on or off.",
    Callback = function(value)
        if ScriptState.lockEnabled == value then
            return
        end
        toggleLockOnPlayer(value)
    end,
}):AddKeyPicker("aimLock_KeyPicker", {
    Default = "None",
    SyncToggleState = true,
    Mode = ScriptState.aimLockKeyMode,
    Text = "AimLock",
    Tooltip = "Keybind for AimLock",
    Callback = function()
        if Options.aimLock_KeyPicker.Mode == "Toggle" then
            toggleLockOnPlayer(Options.aimLock_KeyPicker:GetState())
        end
    end,
    ChangedCallback = function()
        lastAimLockKeyState = Options.aimLock_KeyPicker:GetState()
    end
})

lastAimLockKeyState = Options.aimLock_KeyPicker:GetState()
lastAimLockKeyMode = Options.aimLock_KeyPicker.Mode or lastAimLockKeyMode
ScriptState.aimLockKeyMode = lastAimLockKeyMode

RunService.RenderStepped:Connect(function()
    local keyPicker = Options.aimLock_KeyPicker
    if not keyPicker then
        return
    end

    local currentMode = keyPicker.Mode or "Toggle"
    if currentMode ~= lastAimLockKeyMode then
        ScriptState.aimLockKeyMode = currentMode
        lastAimLockKeyMode = currentMode
        lastAimLockKeyState = keyPicker:GetState()
        if lastAimLockKeyState then
            toggleLockOnPlayer(true)
        elseif ScriptState.lockEnabled and not lastAimLockKeyState then
            toggleLockOnPlayer(false)
        end
    end

    if currentMode ~= "Toggle" then
        local currentState = keyPicker:GetState()
        if currentState ~= lastAimLockKeyState then
            toggleLockOnPlayer(currentState)
            lastAimLockKeyState = currentState
        elseif currentMode == "Always" and not ScriptState.lockEnabled then
            toggleLockOnPlayer(true)
            lastAimLockKeyState = keyPicker:GetState()
        elseif currentMode == "Hold" and currentState then
            toggleLockOnPlayer(true)
        end
    else
        lastAimLockKeyState = keyPicker:GetState()
    end
end)

aimbox:AddSlider("Smoothing", {
    Text = "Camera Smoothing",
    Default = 0.1,
    Min = 0,
    Max = 1,
    Rounding = 2,
    Tooltip = "Adjust camera smoothing factor.",
    Callback = function(value)
        ScriptState.smoothingFactor = value
    end,
})


aimbox:AddSlider("Prediction", {
    Text = "Prediction Factor",
    Default = 0.0,
    Min = 0,
    Max = 2,
    Rounding = 2,
    Tooltip = "Adjust prediction for target movement.",
    Callback = function(value)
        ScriptState.predictionFactor = value
    end,
})

aimbox:AddToggle("aimLockVisibleCheck", {
    Text = "Visible Check",
    Default = ScriptState.aimLockVisibleCheck,
    Tooltip = "Skip targets blocked by objects.",
    Callback = function(value)
        ScriptState.aimLockVisibleCheck = value
    end
})

aimbox:AddToggle("aimLockAliveCheck", {
    Text = "Alive Check",
    Default = ScriptState.aimLockAliveCheck,
    Tooltip = "Ignore eliminated targets.",
    Callback = function(value)
        ScriptState.aimLockAliveCheck = value
    end
})

aimbox:AddToggle("aimLockTeamCheck", {
    Text = "Team Check",
    Default = ScriptState.aimLockTeamCheck,
    Tooltip = "Avoid locking teammates.",
    Callback = function(value)
        ScriptState.aimLockTeamCheck = value
        if value and ScriptState.lockEnabled and ScriptState.targetPlayer and ScriptState.targetPlayer.Team == LocalPlayer.Team then
            acquireLockTarget()
        end
    end
})

aimbox:AddDropdown("BodyParts", {
    Values = {"Head", "UpperTorso", "RightUpperArm", "LeftUpperLeg", "RightUpperLeg", "LeftUpperArm"},
    Default = "Head",
    Multi = false,
    Text = "Target Body Part",
    Tooltip = "Select which body part to lock onto.",
    Callback = function(value)
        ScriptState.bodyPartSelected = value
    end,
})

getgenv().ScriptState.Desync = false

RunService.Heartbeat:Connect(function()
    if getgenv().ScriptState.Desync then
        local player = game.Players.LocalPlayer
        local character = player.Character
        if not character then return end
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if not humanoidRootPart then return end
        local originalVelocity = humanoidRootPart.Velocity

        local randomOffset = Vector3.new(
            math.random(-1, 1) * ScriptState.reverseResolveIntensity * 1000,
            math.random(-1, 1) * ScriptState.reverseResolveIntensity * 1000,
            math.random(-1, 1) * ScriptState.reverseResolveIntensity * 1000
        )
        humanoidRootPart.Velocity = randomOffset
        humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.Angles(
            0,
            math.random(-1, 1) * ScriptState.reverseResolveIntensity * 0.001,
            0
        )
        RunService.RenderStepped:Wait()
        humanoidRootPart.Velocity = originalVelocity
    end
end)


velbox:AddToggle("desyncEnabled", {
    Text = "Desync",
    Default = false,
    Tooltip = "Enable or disable reverse resolve desync.",
    Callback = function(value)
        getgenv().ScriptState.Desync = value
    end
}):AddKeyPicker("desyncToggleKey", {
    Default = "None",
    SyncToggleState = true,
    Mode = "Toggle",
    Text = "Desync Toggle Key",
    Tooltip = "Toggle to enable/disable velocity desync.",
    Callback = function(value)
        getgenv().ScriptState.Desync = value
    end
})


velbox:AddSlider("ReverseResolveIntensity", {
    Text = "velocity intensity",
    Default = 5,
    Min = 1,
    Max = 10,
    Rounding = 0,
    Tooltip = "Adjust the intensity of the reverse resolve effect.",
    Callback = function(value)
        ScriptState.reverseResolveIntensity = value
    end
})



RunService.RenderStepped:Connect(function()
    if ScriptState.isLockedOn and ScriptState.targetPlayer and ScriptState.targetPlayer.Character then
        local partName = getBodyPart(ScriptState.targetPlayer.Character, ScriptState.bodyPartSelected)
        local part = ScriptState.targetPlayer.Character:FindFirstChild(partName)

        if part and ScriptState.targetPlayer.Character:FindFirstChildOfClass("Humanoid").Health > 0 then
            local predictedPosition = part.Position + (part.AssemblyLinearVelocity * ScriptState.predictionFactor)

            if ScriptState.antiLockEnabled then
                if ScriptState.resolverMethod == "Recalculate" then

                    predictedPosition = predictedPosition + (part.AssemblyLinearVelocity * ScriptState.resolverIntensity)
                elseif ScriptState.resolverMethod == "Randomize" then

                    predictedPosition = predictedPosition + Vector3.new(
                        math.random() * ScriptState.resolverIntensity - (ScriptState.resolverIntensity / 2),
                        math.random() * ScriptState.resolverIntensity - (ScriptState.resolverIntensity / 2),
                        math.random() * ScriptState.resolverIntensity - (ScriptState.resolverIntensity / 2)
                    )
                elseif ScriptState.resolverMethod == "Invert" then

                    predictedPosition = predictedPosition - (part.AssemblyLinearVelocity * ScriptState.resolverIntensity * 2)
                end
            end

            local currentCameraPosition = Camera.CFrame.Position
            Camera.CFrame = CFrame.new(currentCameraPosition, predictedPosition) * CFrame.new(0, 0, ScriptState.smoothingFactor)
        else
            ScriptState.isLockedOn = false
            ScriptState.targetPlayer = nil
        end
    end
end)

aimbox:AddToggle("antiLock_Enabled", {
    Text = "Anti Lock Resolver",
    Default = false,
    Tooltip = "Toggle the Anti Lock Resolver on or off.",
    Callback = function(value)
        ScriptState.antiLockEnabled = value
    end,
})

aimbox:AddSlider("ResolverIntensity", {
    Text = "Resolver Intensity",
    Default = 1.0,
    Min = 0,
    Max = 5,
    Rounding = 2,
    Tooltip = "Adjust the intensity of the Anti Lock Resolver.",
    Callback = function(value)
        ScriptState.resolverIntensity = value
    end,
})

aimbox:AddDropdown("ResolverMethods", {
    Values = {"Recalculate", "Randomize", "Invert"},
    Default = "Recalculate",
    Multi = false,
    Text = "Resolver Method",
    Tooltip = "Select the method used by the Anti Lock Resolver.",
    Callback = function(value)
        ScriptState.resolverMethod = value
    end,
})


local MainBOX = GeneralTab:AddLeftTabbox("Silent Aim")
local Main = MainBOX:AddTab("Silent Aim")

local silentAimToggle = Main:AddToggle("silentAimEnabled", {
    Text = "Silent Aim",
    Default = SilentAimSettings.Enabled,
    Callback = function(value)
        SilentAimSettings.Enabled = value
    end
})

silentAimToggle:AddKeyPicker("silentAim_KeyPicker", {
    Default = SilentAimSettings.ToggleKey or "None",
    SyncToggleState = true,
    Mode = SilentAimSettings.KeyMode or "Toggle",
    Text = "Enabled",
    NoUI = false,
    Callback = function(state)
        if silentAimToggle.Value ~= state then
            silentAimToggle:SetValue(state)
        end
    end,
    ChangedCallback = function()
        SilentAimSettings.ToggleKey = Options.silentAim_KeyPicker.Value
        SilentAimSettings.KeyMode = Options.silentAim_KeyPicker.Mode
    end
})

SilentAimSettings.ToggleKey = Options.silentAim_KeyPicker.Value

Main:AddToggle("TeamCheck", {
    Text = "Team Check",
    Default = SilentAimSettings.TeamCheck
}):OnChanged(function()
    SilentAimSettings.TeamCheck = Toggles.TeamCheck.Value
end)

Main:AddToggle("VisibleCheck", {
    Text = "Visible Check",
    Default = SilentAimSettings.VisibleCheck,
    Tooltip = "Only target players that are visible"
}):OnChanged(function()
    SilentAimSettings.VisibleCheck = Toggles.VisibleCheck.Value
end)

Main:AddToggle("AliveCheck", {
    Text = "Alive Check",
    Default = SilentAimSettings.AliveCheck,
    Tooltip = "Ignore players with zero health"
}):OnChanged(function()
    SilentAimSettings.AliveCheck = Toggles.AliveCheck.Value
end)

Main:AddToggle("BulletTP", {
    Text = "Bullet Teleport",
    Default = SilentAimSettings.BulletTP,
    Tooltip = "Teleports bullet origin to target"
}):OnChanged(function()
    SilentAimSettings.BulletTP = Toggles.BulletTP.Value
end)

Main:AddToggle("CheckForFireFunc", {
    Text = "Check For Fire Function",
    Default = SilentAimSettings.CheckForFireFunc,
    Tooltip = "Checks if the method is called from a fire function"
}):OnChanged(function()
    SilentAimSettings.CheckForFireFunc = Toggles.CheckForFireFunc.Value
end)

Main:AddDropdown("TargetPart", {
    AllowNull = true,
    Text = "Target Part",
    Default = SilentAimSettings.TargetPart,
    Values = {"Head", "HumanoidRootPart", "Random"}
}):OnChanged(function()
    SilentAimSettings.TargetPart = Options.TargetPart.Value
end)

Main:AddDropdown("Method", {
    AllowNull = true,
    Text = "Silent Aim Method",
    Default = SilentAimSettings.SilentAimMethod,
    Values = {
        "ViewportPointToRay",
        "ScreenPointToRay",
        "Raycast",
        "FindPartOnRay",
        "FindPartOnRayWithIgnoreList",
        "FindPartOnRayWithWhitelist",
        "CounterBlox"
    }
}):OnChanged(function()
    SilentAimSettings.SilentAimMethod = Options.Method.Value
end)

if not SilentAimSettings.BlockedMethods then
    SilentAimSettings.BlockedMethods = {}
end

Main:AddDropdown("Blocked Methods", {
    AllowNull = true,
    Multi = true,
    Text = "Blocked Methods",
    Default = SilentAimSettings.BlockedMethods,
    Values = {
        "BulkMoveTo",
        "PivotTo",
        "TranslateBy",
        "SetPrimaryPartCFrame"
    }
}):OnChanged(function()
    SilentAimSettings.BlockedMethods = normalizeSelection(Options["Blocked Methods"].Value)
end)

Main:AddDropdown("Include", {
    AllowNull = true,
    Multi = true,
    Text = "Include",
    Default = SilentAimSettings.Include,
    Values = {"Camera", "Character"},
    Tooltip = "Includes these objects in the ignore list"
}):OnChanged(function()
    SilentAimSettings.Include = normalizeSelection(Options.Include.Value)
end)

Main:AddDropdown("Origin", {
    AllowNull = true,
    Multi = true,
    Text = "Origin",
    Default = SilentAimSettings.Origin,
    Values = {"Camera"},
    Tooltip = "Sets the origin of the bullet"
}):OnChanged(function()
    SilentAimSettings.Origin = normalizeSelection(Options.Origin.Value)
end)

Main:AddSlider("MultiplyUnitBy", {
    Text = "Multiply Unit By",
    Default = SilentAimSettings.MultiplyUnitBy,
    Min = 1,
    Max = 10000,
    Rounding = 0,
    Compact = false,
    Tooltip = "Multiplies the direction vector by this value"
}):OnChanged(function()
    SilentAimSettings.MultiplyUnitBy = Options.MultiplyUnitBy.Value
end)

Main:AddSlider("HitChance", {
    Text = "Hit Chance",
    Default = 100,
    Min = 0,
    Max = 100,
    Rounding = 1,
    Compact = false,
}):OnChanged(function()
    SilentAimSettings.HitChance = Options.HitChance.Value
end)

local FieldOfViewBOX = GeneralTab:AddLeftTabbox("Field Of View") do
    local Main = FieldOfViewBOX:AddTab("Visuals")

    Main:AddToggle("Visible", {Text = "Show FOV Circle"})
        :AddColorPicker("Color", {Default = Color3.fromRGB(54, 57, 241)})
        :OnChanged(function()
            fov_circle.Visible = Toggles.Visible.Value
            SilentAimSettings.FOVVisible = Toggles.Visible.Value
        end)

    Main:AddSlider("Radius", {
        Text = "FOV Circle Radius",
        Min = 0,
        Max = 360,
        Default = 130,
        Rounding = 0
    }):OnChanged(function()
        fov_circle.Radius = Options.Radius.Value
        SilentAimSettings.FOVRadius = Options.Radius.Value
    end)

    Main:AddDropdown("FovMode", {
        Values = {"Mouse", "Center"},
        Default = ScriptState.fovMode,
        Text = "FOV Origin",
        Tooltip = "Choose whether the FOV stays centered or follows the cursor."
    }):OnChanged(function()
        ScriptState.fovMode = Options.FovMode.Value
    end)

    Main:AddToggle("MousePosition", {Text = "Show Silent Aim Target"})
        :AddColorPicker("MouseVisualizeColor", {Default = Color3.fromRGB(54, 57, 241)})
        :OnChanged(function()
            SilentAimSettings.ShowSilentAimTarget = Toggles.MousePosition.Value
        end)

    Main:AddDropdown("PlayerDropdown", {
        SpecialType = "Player",
        Text = "Ignore Player",
        Tooltip = "Friend list",
        Multi = true
    })
end

local function removeOldHighlight()
    if ScriptState.previousHighlight then
        ScriptState.previousHighlight:Destroy()
        ScriptState.previousHighlight = nil
    end
end

task.spawn(function()
    RenderStepped:Connect(function()
        if Toggles.MousePosition.Value then
            local visibleCheckActive = SilentAimSettings.VisibleCheck or ScriptState.aimLockVisibleCheck
            local teamCheckActive = SilentAimSettings.TeamCheck or ScriptState.aimLockTeamCheck
            local aliveCheckActive = SilentAimSettings.AliveCheck or ScriptState.aimLockAliveCheck

            local closestPart, closestPlayer = getClosestPlayer({
                visibleCheck = visibleCheckActive,
                teamCheck = teamCheckActive,
                aliveCheck = aliveCheckActive
            })
            if closestPart and closestPlayer then
                local char = closestPlayer.Character or closestPart.Parent
                if char and char:FindFirstChild("Humanoid") and char:FindFirstChild("HumanoidRootPart") then
                    if teamCheckActive and playersOnSameTeam(closestPlayer) then
                        removeOldHighlight()
                        return
                    end
                    if visibleCheckActive and not IsPlayerVisible(closestPlayer) then
                        removeOldHighlight()
                        return
                    end
                    if SilentAimSettings.VisibleCheck and not IsPlayerVisible(closestPlayer) then
                        removeOldHighlight()
                        return
                    end
                    local Root = char.PrimaryPart or char:FindFirstChild("HumanoidRootPart")
                    if Root then
                        local RootToViewportPoint, IsOnScreen = WorldToViewportPoint(Camera, Root.Position)
                        removeOldHighlight()
                        if IsOnScreen then
                            local highlight = char:FindFirstChildOfClass("Highlight")
                            if not highlight then
                                highlight = Instance.new("Highlight")
                                highlight.Parent = char
                                highlight.Adornee = char
                            end
                            highlight.FillColor = Options.MouseVisualizeColor.Value
                            highlight.FillTransparency = 0.5
                            highlight.OutlineColor = Options.MouseVisualizeColor.Value
                            highlight.OutlineTransparency = 0
                            ScriptState.previousHighlight = highlight
                        end
                    end
                end
            else
                removeOldHighlight()
            end
        end
        if Toggles.Visible.Value then
            fov_circle.Visible = Toggles.Visible.Value
            fov_circle.Color = Options.Color.Value
            fov_circle.Position = getFovOrigin()
        end
    end)
end)
local sounds = {
    ["RIFK7"] = "rbxassetid://9102080552",
    ["Bubble"] = "rbxassetid://9102092728",
    ["Minecraft"] = "rbxassetid://5869422451",
    ["Cod"] = "rbxassetid://160432334",
    ["Bameware"] = "rbxassetid://6565367558",
    ["Neverlose"] = "rbxassetid://6565370984",
    ["Gamesense"] = "rbxassetid://4817809188",
    ["Rust"] = "rbxassetid://6565371338",
}

local hitSound = Instance.new("Sound")
hitSound.Volume = 3
hitSound.Parent = SoundService

local HitSoundBox = GeneralTab:AddRightTabbox("HitSound") do
    local Main = HitSoundBox:AddTab("HitSound [beta]")

    Main:AddToggle("HitSoundEnabled", {Text = "Enable HitSound", Default = false})

    Main:AddDropdown("HitSoundSelect", {
        Values = {"RIFK7","Bubble","Minecraft","Cod","Bameware","Neverlose","Gamesense","Rust"},
        Default = "Neverlose",
        Text = "HitSound",
        Tooltip = "Choose sound"
    }):OnChanged(function()
        local id = sounds[Options.HitSoundSelect.Value]
        if id then
            hitSound.SoundId = id
        end
    end)
end

hitSound.SoundId = sounds[Options.HitSoundSelect.Value]


local soundPool = {}
local soundIndex = 1

local function getNextSound()
    if soundIndex > #soundPool then
        local s = hitSound:Clone()
        s.Parent = workspace
        s.Looped = false
        table.insert(soundPool, s)
    end
    local s = soundPool[soundIndex]
    soundIndex = soundIndex + 1
    return s
end

local function playHitSound()
    local s = getNextSound()
    s:Stop()
    s:Play()
end

local function trackPlayer(plr)
    if plr == LocalPlayer then return end

    plr.CharacterAdded:Connect(function(char)
        local hum = char:WaitForChild("Humanoid", 10)
        if not hum then return end

        local lastHealth = hum.Health

        hum.HealthChanged:Connect(function(newHp)
            if Toggles.HitSoundEnabled.Value then
                local closestPart, closestPlayer = getClosestPlayer()
                if closestPart and closestPlayer and closestPlayer == plr then
                    if newHp < lastHealth then
                        playHitSound()
                    end
                    if lastHealth > 0 and newHp <= 0 then
                        playHitSound()
                    end
                end
            end
            lastHealth = newHp
        end)
    end)
end

for _, plr in ipairs(Players:GetPlayers()) do
    trackPlayer(plr)
end
Players.PlayerAdded:Connect(trackPlayer)

RunService.Heartbeat:Connect(function()
    if Toggles.silentAimEnabled and Toggles.silentAimEnabled.Value then
        local closestPart = getClosestPlayer()
        ScriptState.ClosestHitPart = closestPart
    else
        ScriptState.ClosestHitPart = nil
    end
end)

local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(...)
    local Method, Arguments = getnamecallmethod(), {...}
    local self, chance = Arguments[1], CalculateChance(SilentAimSettings.HitChance)

    local BlockedMethods = SilentAimSettings.BlockedMethods or {}
    if Method == "Destroy" and self == Client then
        return
    end
    if BlockedMethods[Method] then
        return
    end

    local function getIgnoredList()
        if Method == "Raycast" then
            local params = Arguments[4]
            if typeof(params) == "RaycastParams" then
                return params.FilterDescendantsInstances
            end
        elseif Method == "FindPartOnRayWithIgnoreList" then
            return Arguments[3]
        end
    end

    local function getOriginalOrigin()
        if Method == "Raycast" then
            return Arguments[2]
        end

        if Method == "FindPartOnRayWithIgnoreList" or Method == "FindPartOnRayWithWhitelist" or Method == "FindPartOnRay" or Method == "findPartOnRay" then
            local ray = Arguments[2]
            if typeof(ray) == "Ray" then
                return ray.Origin
            end
        end

        return nil
    end

    local allowedFireCall = true
    if SilentAimSettings.CheckForFireFunc and (Method == "FindPartOnRay" or Method == "findPartOnRay" or Method == "FindPartOnRayWithWhitelist" or Method == "FindPartOnRayWithIgnoreList" or Method == "Raycast" or Method == "ViewportPointToRay" or Method == "ScreenPointToRay") then
        local trace = tostring(debug.traceback()):lower()
        if trace:find("bullet") or trace:find("gun") or trace:find("fire") then
            allowedFireCall = true
        else
            return oldNamecall(...)
        end
    end

    if Toggles.silentAimEnabled and Toggles.silentAimEnabled.Value and self == workspace and not checkcaller() and chance and allowedFireCall then
        local HitPart = ScriptState.ClosestHitPart or getClosestPlayer()
        if HitPart then
            local ignoredList = getIgnoredList()
            local originOptions = SilentAimSettings.Origin
            local includeOptions = SilentAimSettings.Include
            local originalOrigin = getOriginalOrigin()

            if originalOrigin and originOptions and next(originOptions) then
                local matchesOrigin = false
                if isSelectionActive(originOptions, "Camera") and originalOrigin == Camera.CFrame.p then
                    matchesOrigin = true
                end

                if not matchesOrigin then
                    return oldNamecall(...)
                end
            end

            if ignoredList and includeOptions and next(includeOptions) then
                if isSelectionActive(includeOptions, "Camera") and not table.find(ignoredList, Camera) then
                    return oldNamecall(...)
                end

                local character = LocalPlayer.Character
                if character and isSelectionActive(includeOptions, "Character") and not table.find(ignoredList, character) then
                    return oldNamecall(...)
                end
            end

            local function computeRay(origin)
                local adjustedOrigin = origin
                if SilentAimSettings.BulletTP then
                    adjustedOrigin = (HitPart.CFrame * CFrame.new(0, 0, 1)).p
                end

                local multiplier = SilentAimSettings.MultiplyUnitBy or 1000
                local direction = getDirection(adjustedOrigin, HitPart.Position) * multiplier
                return adjustedOrigin, direction
            end

            if Method == "FindPartOnRayWithIgnoreList" and SilentAimSettings.SilentAimMethod == Method then
                if ValidateArguments(Arguments, ExpectedArguments.FindPartOnRayWithIgnoreList) then
                    local Origin, Direction = computeRay(Arguments[2].Origin)
                    Arguments[2] = Ray.new(Origin, Direction)
                    return oldNamecall(unpack(Arguments))
                end
            elseif Method == "FindPartOnRayWithWhitelist" and SilentAimSettings.SilentAimMethod == Method then
                if ValidateArguments(Arguments, ExpectedArguments.FindPartOnRayWithWhitelist) then
                    local Origin, Direction = computeRay(Arguments[2].Origin)
                    Arguments[2] = Ray.new(Origin, Direction)
                    return oldNamecall(unpack(Arguments))
                end
            elseif (Method == "FindPartOnRay" or Method == "findPartOnRay") and SilentAimSettings.SilentAimMethod:lower() == Method:lower() then
                if ValidateArguments(Arguments, ExpectedArguments.FindPartOnRay) then
                    local Origin, Direction = computeRay(Arguments[2].Origin)
                    Arguments[2] = Ray.new(Origin, Direction)
                    return oldNamecall(unpack(Arguments))
                end
            elseif Method == "Raycast" and SilentAimSettings.SilentAimMethod == Method then
                if ValidateArguments(Arguments, ExpectedArguments.Raycast) then
                    local Origin, Direction = computeRay(Arguments[2])
                    Arguments[2], Arguments[3] = Origin, Direction
                    return oldNamecall(unpack(Arguments))
                end
            elseif Method == "ViewportPointToRay" and SilentAimSettings.SilentAimMethod == Method then
                if ValidateArguments(Arguments, ExpectedArguments.ViewportPointToRay) then
                    local Origin = Camera.CFrame.p
                    local NewOrigin, Direction = computeRay(Origin)
                    return Ray.new(NewOrigin, Direction)
                end
            elseif Method == "ScreenPointToRay" and SilentAimSettings.SilentAimMethod == Method then
                if ValidateArguments(Arguments, ExpectedArguments.ScreenPointToRay) then
                    local Origin = Camera.CFrame.p
                    local NewOrigin, Direction = computeRay(Origin)
                    return Ray.new(NewOrigin, Direction)
                end
            elseif Method == "FindPartOnRayWithIgnoreList" and SilentAimSettings.SilentAimMethod == "CounterBlox" then
                local Origin, Direction = computeRay(Arguments[2].Origin)
                Arguments[2] = Ray.new(Origin, Direction)
                return oldNamecall(unpack(Arguments))
            end
        end
    end

    return oldNamecall(...)
end))


local worldbox = VisualsTab:AddRightGroupbox("World")

local lighting = Services.Lighting
ScriptState.lockedTime, ScriptState.fovValue, ScriptState.nebulaEnabled = 12, 70, false
local originalAmbient, originalOutdoorAmbient = lighting.Ambient, lighting.OutdoorAmbient
local originalFogStart, originalFogEnd, originalFogColor = lighting.FogStart, lighting.FogEnd, lighting.FogColor
local nebulaThemeColor = Color3.fromRGB(173, 216, 230)

worldbox:AddSlider("world_time", {
    Text = "Clock Time", Default = 12, Min = 0, Max = 24, Rounding = 1,
    Callback = function(v)
        ScriptState.lockedTime = v
        if ScriptState.lockTimeEnabled then
            lighting.ClockTime = v
        end
    end
})

local oldNewIndex
oldNewIndex = hookmetamethod(game, "__newindex", function(self, property, value)
    if not checkcaller() and self == lighting and property == "ClockTime" then
        if ScriptState.lockTimeEnabled then
            value = ScriptState.lockedTime
        end
    end
    return oldNewIndex(self, property, value)
end)

worldbox:AddSlider("fov_slider", {
    Text = "FOV", Default = 70, Min = 30, Max = 120, Rounding = 2,
    Callback = function(v) ScriptState.fovValue = v end,
})

worldbox:AddToggle("lock_time_toggle", {
    Text = "Lock Time",
    Default = false,
    Callback = function(v)
        ScriptState.lockTimeEnabled = v
        if v then
            lighting.ClockTime = ScriptState.lockedTime
        end
    end
})

worldbox:AddToggle("fov_toggle", {
    Text = "FOV Change", Default = false,
    Callback = function(state) ScriptState.fovEnabled = state end,
})

RunService.RenderStepped:Connect(function()
    if ScriptState.fovEnabled then
        Camera.FieldOfView = ScriptState.fovValue
    end
end)


worldbox:AddToggle("nebula_theme", {
    Text = "Nebula Theme", Default = false,
    Callback = function(state)
        ScriptState.nebulaEnabled = state
        if state then
            local b = Instance.new("BloomEffect", lighting) b.Intensity, b.Size, b.Threshold, b.Name = 0.7, 24, 1, "NebulaBloom"
            local c = Instance.new("ColorCorrectionEffect", lighting) c.Saturation, c.Contrast, c.TintColor, c.Name = 0.5, 0.2, nebulaThemeColor, "NebulaColorCorrection"
            local a = Instance.new("Atmosphere", lighting) a.Density, a.Offset, a.Glare, a.Haze, a.Color, a.Decay, a.Name = 0.4, 0.25, 1, 2, nebulaThemeColor, Color3.fromRGB(25, 25, 112), "NebulaAtmosphere"
            lighting.Ambient, lighting.OutdoorAmbient = nebulaThemeColor, nebulaThemeColor
            lighting.FogStart, lighting.FogEnd = 100, 500
            lighting.FogColor = nebulaThemeColor
        else
            for _, v in pairs({"NebulaBloom", "NebulaColorCorrection", "NebulaAtmosphere"}) do
                local obj = lighting:FindFirstChild(v) if obj then obj:Destroy() end
            end
            lighting.Ambient, lighting.OutdoorAmbient = originalAmbient, originalOutdoorAmbient
            lighting.FogStart, lighting.FogEnd = originalFogStart, originalFogEnd
            lighting.FogColor = originalFogColor
        end
    end,
}):AddColorPicker("nebula_color_picker", {
    Text = "Nebula Color", Default = Color3.fromRGB(173, 216, 230),
    Callback = function(c)
        nebulaThemeColor = c
        if ScriptState.nebulaEnabled then
            local nc = lighting:FindFirstChild("NebulaColorCorrection") if nc then nc.TintColor = c end
            local na = lighting:FindFirstChild("NebulaAtmosphere") if na then na.Color = c end
            lighting.Ambient, lighting.OutdoorAmbient = c, c
            lighting.FogColor = c
        end
    end,
})


local Lighting = Services.Lighting
local Visuals = {}
local Skyboxes = {}

function Visuals:NewSky(Data)
    local Name = Data.Name
    Skyboxes[Name] = {
        SkyboxBk = Data.SkyboxBk,
        SkyboxDn = Data.SkyboxDn,
        SkyboxFt = Data.SkyboxFt,
        SkyboxLf = Data.SkyboxLf,
        SkyboxRt = Data.SkyboxRt,
        SkyboxUp = Data.SkyboxUp,
        MoonTextureId = Data.Moon or "rbxasset://sky/moon.jpg",
        SunTextureId = Data.Sun or "rbxasset://sky/sun.jpg"
    }
end

function Visuals:SwitchSkybox(Name)
    local OldSky = Lighting:FindFirstChildOfClass("Sky")
    if OldSky then OldSky:Destroy() end

    local Sky = Instance.new("Sky", Lighting)
    for Index, Value in pairs(Skyboxes[Name]) do
        Sky[Index] = Value
    end
end

if Lighting:FindFirstChildOfClass("Sky") then
    local OldSky = Lighting:FindFirstChildOfClass("Sky")
    Visuals:NewSky({
        Name = "Game's Default Sky",
        SkyboxBk = OldSky.SkyboxBk,
        SkyboxDn = OldSky.SkyboxDn,
        SkyboxFt = OldSky.SkyboxFt,
        SkyboxLf = OldSky.SkyboxLf,
        SkyboxRt = OldSky.SkyboxRt,
        SkyboxUp = OldSky.SkyboxUp
    })
end

Visuals:NewSky({
    Name = "Sunset",
    SkyboxBk = "rbxassetid://600830446",
    SkyboxDn = "rbxassetid://600831635",
    SkyboxFt = "rbxassetid://600832720",
    SkyboxLf = "rbxassetid://600886090",
    SkyboxRt = "rbxassetid://600833862",
    SkyboxUp = "rbxassetid://600835177"
})

Visuals:NewSky({
    Name = "Arctic",
    SkyboxBk = "http://www.roblox.com/asset/?id=225469390",
    SkyboxDn = "http://www.roblox.com/asset/?id=225469395",
    SkyboxFt = "http://www.roblox.com/asset/?id=225469403",
    SkyboxLf = "http://www.roblox.com/asset/?id=225469450",
    SkyboxRt = "http://www.roblox.com/asset/?id=225469471",
    SkyboxUp = "http://www.roblox.com/asset/?id=225469481"
})

Visuals:NewSky({
    Name = "Space",
    SkyboxBk = "http://www.roblox.com/asset/?id=166509999",
    SkyboxDn = "http://www.roblox.com/asset/?id=166510057",
    SkyboxFt = "http://www.roblox.com/asset/?id=166510116",
    SkyboxLf = "http://www.roblox.com/asset/?id=166510092",
    SkyboxRt = "http://www.roblox.com/asset/?id=166510131",
    SkyboxUp = "http://www.roblox.com/asset/?id=166510114"
})

Visuals:NewSky({
    Name = "Roblox Default",
    SkyboxBk = "rbxasset://textures/sky/sky512_bk.tex",
    SkyboxDn = "rbxasset://textures/sky/sky512_dn.tex",
    SkyboxFt = "rbxasset://textures/sky/sky512_ft.tex",
    SkyboxLf = "rbxasset://textures/sky/sky512_lf.tex",
    SkyboxRt = "rbxasset://textures/sky/sky512_rt.tex",
    SkyboxUp = "rbxasset://textures/sky/sky512_up.tex"
})

Visuals:NewSky({
    Name = "Red Night",
    SkyboxBk = "http://www.roblox.com/Asset/?ID=401664839";
    SkyboxDn = "http://www.roblox.com/Asset/?ID=401664862";
    SkyboxFt = "http://www.roblox.com/Asset/?ID=401664960";
    SkyboxLf = "http://www.roblox.com/Asset/?ID=401664881";
    SkyboxRt = "http://www.roblox.com/Asset/?ID=401664901";
    SkyboxUp = "http://www.roblox.com/Asset/?ID=401664936";
})

Visuals:NewSky({
    Name = "Deep Space",
    SkyboxBk = "http://www.roblox.com/asset/?id=149397692";
    SkyboxDn = "http://www.roblox.com/asset/?id=149397686";
    SkyboxFt = "http://www.roblox.com/asset/?id=149397697";
    SkyboxLf = "http://www.roblox.com/asset/?id=149397684";
    SkyboxRt = "http://www.roblox.com/asset/?id=149397688";
    SkyboxUp = "http://www.roblox.com/asset/?id=149397702";
})

Visuals:NewSky({
    Name = "Pink Skies",
    SkyboxBk = "http://www.roblox.com/asset/?id=151165214";
    SkyboxDn = "http://www.roblox.com/asset/?id=151165197";
    SkyboxFt = "http://www.roblox.com/asset/?id=151165224";
    SkyboxLf = "http://www.roblox.com/asset/?id=151165191";
    SkyboxRt = "http://www.roblox.com/asset/?id=151165206";
    SkyboxUp = "http://www.roblox.com/asset/?id=151165227";
})

Visuals:NewSky({
    Name = "Purple Sunset",
    SkyboxBk = "rbxassetid://264908339";
    SkyboxDn = "rbxassetid://264907909";
    SkyboxFt = "rbxassetid://264909420";
    SkyboxLf = "rbxassetid://264909758";
    SkyboxRt = "rbxassetid://264908886";
    SkyboxUp = "rbxassetid://264907379";
})

Visuals:NewSky({
    Name = "Blue Night",
    SkyboxBk = "http://www.roblox.com/Asset/?ID=12064107";
    SkyboxDn = "http://www.roblox.com/Asset/?ID=12064152";
    SkyboxFt = "http://www.roblox.com/Asset/?ID=12064121";
    SkyboxLf = "http://www.roblox.com/Asset/?ID=12063984";
    SkyboxRt = "http://www.roblox.com/Asset/?ID=12064115";
    SkyboxUp = "http://www.roblox.com/Asset/?ID=12064131";
})

Visuals:NewSky({
    Name = "Blossom Daylight",
    SkyboxBk = "http://www.roblox.com/asset/?id=271042516";
    SkyboxDn = "http://www.roblox.com/asset/?id=271077243";
    SkyboxFt = "http://www.roblox.com/asset/?id=271042556";
    SkyboxLf = "http://www.roblox.com/asset/?id=271042310";
    SkyboxRt = "http://www.roblox.com/asset/?id=271042467";
    SkyboxUp = "http://www.roblox.com/asset/?id=271077958";
})

Visuals:NewSky({
    Name = "Blue Nebula",
    SkyboxBk = "http://www.roblox.com/asset?id=135207744";
    SkyboxDn = "http://www.roblox.com/asset?id=135207662";
    SkyboxFt = "http://www.roblox.com/asset?id=135207770";
    SkyboxLf = "http://www.roblox.com/asset?id=135207615";
    SkyboxRt = "http://www.roblox.com/asset?id=135207695";
    SkyboxUp = "http://www.roblox.com/asset?id=135207794";
})

Visuals:NewSky({
    Name = "Blue Planet",
    SkyboxBk = "rbxassetid://218955819";
    SkyboxDn = "rbxassetid://218953419";
    SkyboxFt = "rbxassetid://218954524";
    SkyboxLf = "rbxassetid://218958493";
    SkyboxRt = "rbxassetid://218957134";
    SkyboxUp = "rbxassetid://218950090";
})

Visuals:NewSky({
    Name = "Deep Space",
    SkyboxBk = "http://www.roblox.com/asset/?id=159248188";
    SkyboxDn = "http://www.roblox.com/asset/?id=159248183";
    SkyboxFt = "http://www.roblox.com/asset/?id=159248187";
    SkyboxLf = "http://www.roblox.com/asset/?id=159248173";
    SkyboxRt = "http://www.roblox.com/asset/?id=159248192";
    SkyboxUp = "http://www.roblox.com/asset/?id=159248176";
})

local SkyboxNames = {}
for Name, _ in pairs(Skyboxes) do
    table.insert(SkyboxNames, Name)
end

local worldbox = VisualsTab:AddRightGroupbox("SkyBox")
local SkyboxDropdown = worldbox:AddDropdown("SkyboxSelector", {
    AllowNull = false,
    Text = "Select Skybox",
    Default = "Game's Default Sky",
    Values = SkyboxNames
}):OnChanged(function(SelectedSkybox)
    if Skyboxes[SelectedSkybox] then
        Visuals:SwitchSkybox(SelectedSkybox)
    end
end)

local VisualsEx = VisualsTab:AddLeftGroupbox("ESP")

if not _G.ExunysESPLoaded then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FakeAngles/PasteWare-v2/refs/heads/main/ExLib.lua"))()
end

local ESP = getgenv().ExunysDeveloperESP
if not ESP then return end

local function ensurePath(path)
    local ref = ESP
    for index = 1, #path - 1 do
        local key = path[index]
        if type(ref[key]) ~= "table" then
            ref[key] = {}
        end
        ref = ref[key]
    end
    return ref, path[#path]
end

local function getProperty(path)
    local ref = ESP
    for index = 1, #path do
        if not ref then return nil end
        ref = ref[path[index]]
    end
    return ref
end

local function updateProperty(path, value)
    local ref, key = ensurePath(path)
    if ref and key then
        ref[key] = value
    end
end

local function makeId(path, suffix)
    local id = table.concat(path, "_")
    if suffix then
        id = id .. "_" .. suffix
    end
    return id
end

local function refreshESPConfiguration()
    if ESP and ESP.UpdateConfiguration then
        pcall(function()
            ESP.UpdateConfiguration(ESP.DeveloperSettings, ESP.Settings, ESP.Properties)
        end)
    end
end

local function refreshChams()
    if UpdateAllChams then
        pcall(UpdateAllChams)
    end
end

local function addDefinitionControls(group, definitions)
    for _, def in ipairs(definitions) do
        local getValue = def.Get or function()
            return getProperty(def.Path)
        end

        local setValue = def.Set or function(value)
            updateProperty(def.Path, value)
        end

        local id = def.Id or makeId(def.Path, def.Suffix)

        if def.Type == "toggle" then
            group:AddToggle(id, {
                Text = def.Name,
                Default = def.Default ~= nil and def.Default or (getValue() or false),
                Callback = function(val)
                    setValue(val)
                    if def.OnChange then def.OnChange(val) end
                end
            })
        elseif def.Type == "slider" then
            group:AddSlider(id, {
                Text = def.Name,
                Min = def.Min,
                Max = def.Max,
                Rounding = def.Rounding or 1,
                Default = getValue() or def.Default or def.Min or 0,
                Callback = function(val)
                    setValue(val)
                    if def.OnChange then def.OnChange(val) end
                end
            })
        elseif def.Type == "color" then
            local label = group:AddLabel(def.Name)
            label:AddColorPicker(id, {
                Default = getValue() or def.Default or Color3.new(1, 1, 1),
                Callback = function(val)
                    setValue(val)
                    if def.OnChange then def.OnChange(val) end
                end
            })
        elseif def.Type == "dropdown" then
            local values = def.Values
            if not values and def.Map then
                values = {}
                for option in pairs(def.Map) do
                    table.insert(values, option)
                end
                table.sort(values)
            end

            local current = getValue()
            if def.Map then
                local mapped
                for option, mappedValue in pairs(def.Map) do
                    if mappedValue == current then
                        mapped = option
                        break
                    end
                end
                current = mapped
            end

            local dropdown = group:AddDropdown(id, {
                AllowNull = false,
                Text = def.Name,
                Values = values,
                Default = current or def.Default or (values and values[1])
            })

            dropdown:OnChanged(function(value)
                local finalValue = def.Map and def.Map[value] or value
                setValue(finalValue)
                if def.OnChange then def.OnChange(finalValue, value) end
            end)
        elseif def.Type == "input" then
            group:AddInput(id, {
                Text = def.Name,
                Default = tostring(getValue() or def.Default or ""),
                Numeric = def.Numeric,
                Finished = def.Finished,
                Placeholder = def.Placeholder,
                Callback = function(val)
                    local finalValue = def.Numeric and tonumber(val) or val
                    setValue(finalValue)
                    if def.OnChange then def.OnChange(finalValue) end
                end
            })
        end
    end
end

VisualsEx:AddToggle("espEnabled", {
    Text = "Enable ESP",
    Default = ESP.Settings and ESP.Settings.Enabled or false,
    Callback = function(value)
        if value and ESP and not ESP.Loaded and ESP.Load then
            pcall(function()
                ESP:Load()
            end)
        end

        updateProperty({"Settings", "Enabled"}, value)
        refreshESPConfiguration()
    end
})

local DrawingFonts = Drawing and Drawing.Fonts
local fontMap = {
    Plex = DrawingFonts and DrawingFonts.Plex or "Plex",
    System = DrawingFonts and DrawingFonts.System or "System",
    UI = DrawingFonts and DrawingFonts.UI or "UI",
    Monospace = DrawingFonts and DrawingFonts.Monospace or "Monospace"
}
local fontValues = {"Plex", "System", "UI", "Monospace"}

local tracerPositionMap = {Bottom = 1, Center = 2, Mouse = 3}
local tracerPositions = {"Bottom", "Center", "Mouse"}

local healthBarPositionMap = {Top = 1, Bottom = 2, Left = 3, Right = 4}
local healthBarPositions = {"Top", "Bottom", "Left", "Right"}

local ESPSettingsGroup = VisualsTab:AddRightGroupbox("ESP Settings")
addDefinitionControls(ESPSettingsGroup, {
    {Type = "toggle", Name = "Parts Only", Path = {"Settings", "PartsOnly"}},
    {Type = "toggle", Name = "Team Check", Path = {"Settings", "TeamCheck"}, OnChange = function()
        refreshESPConfiguration()
        refreshChams()
    end},
    {Type = "toggle", Name = "Alive Check", Path = {"Settings", "AliveCheck"}, OnChange = refreshESPConfiguration},
    {Type = "toggle", Name = "Enable Team Colors", Path = {"Settings", "EnableTeamColors"}, OnChange = function()
        refreshESPConfiguration()
        refreshChams()
    end},
    {Type = "toggle", Name = "Entity ESP", Path = {"Settings", "EntityESP"}}
})

local DeveloperSettingsGroup = VisualsTab:AddRightGroupbox("ESP Developer")
addDefinitionControls(DeveloperSettingsGroup, {
    {Type = "toggle", Name = "Unwrap On Character Absence", Path = {"DeveloperSettings", "UnwrapOnCharacterAbsence"}, OnChange = refreshESPConfiguration},
    {Type = "dropdown", Name = "Update Mode", Path = {"DeveloperSettings", "UpdateMode"}, Values = {"RenderStepped", "Heartbeat", "Stepped"}, OnChange = refreshESPConfiguration},
    {Type = "dropdown", Name = "Team Check Option", Path = {"DeveloperSettings", "TeamCheckOption"}, Values = {"TeamColor", "Team"}, OnChange = refreshESPConfiguration},
    {Type = "slider", Name = "Rainbow Speed", Path = {"DeveloperSettings", "RainbowSpeed"}, Min = 0.1, Max = 10, Rounding = 1, OnChange = refreshESPConfiguration},
    {Type = "slider", Name = "Width Boundary", Path = {"DeveloperSettings", "WidthBoundary"}, Min = 0.5, Max = 5, Rounding = 2, OnChange = refreshESPConfiguration},
    {Type = "input", Name = "Config Path", Path = {"DeveloperSettings", "Path"}}
})

local ESPVisualGroup = VisualsTab:AddLeftGroupbox("ESP Text")
addDefinitionControls(ESPVisualGroup, {
    {Type = "toggle", Name = "Enabled", Path = {"Properties", "ESP", "Enabled"}},
    {Type = "toggle", Name = "Rainbow Color", Path = {"Properties", "ESP", "RainbowColor"}},
    {Type = "toggle", Name = "Rainbow Outline", Path = {"Properties", "ESP", "RainbowOutlineColor"}},
    {Type = "slider", Name = "Offset", Path = {"Properties", "ESP", "Offset"}, Min = 0, Max = 50, Rounding = 0},
    {Type = "color", Name = "Color", Path = {"Properties", "ESP", "Color"}},
    {Type = "slider", Name = "Transparency", Path = {"Properties", "ESP", "Transparency"}, Min = 0, Max = 1, Rounding = 2},
    {Type = "slider", Name = "Size", Path = {"Properties", "ESP", "Size"}, Min = 10, Max = 30, Rounding = 0},
    {Type = "dropdown", Name = "Font", Path = {"Properties", "ESP", "Font"}, Values = fontValues, Map = fontMap, OnChange = refreshESPConfiguration},
    {Type = "color", Name = "Outline Color", Path = {"Properties", "ESP", "OutlineColor"}},
    {Type = "toggle", Name = "Outline", Path = {"Properties", "ESP", "Outline"}},
    {Type = "toggle", Name = "Display Distance", Path = {"Properties", "ESP", "DisplayDistance"}},
    {Type = "toggle", Name = "Display Health", Path = {"Properties", "ESP", "DisplayHealth"}},
    {Type = "toggle", Name = "Display Name", Path = {"Properties", "ESP", "DisplayName"}},
    {Type = "toggle", Name = "Display DisplayName", Path = {"Properties", "ESP", "DisplayDisplayName"}},
    {Type = "toggle", Name = "Display Tool", Path = {"Properties", "ESP", "DisplayTool"}}
})

local TracerGroup = VisualsTab:AddRightGroupbox("ESP Tracer")
addDefinitionControls(TracerGroup, {
    {Type = "toggle", Name = "Enabled", Path = {"Properties", "Tracer", "Enabled"}},
    {Type = "toggle", Name = "Rainbow Color", Path = {"Properties", "Tracer", "RainbowColor"}},
    {Type = "toggle", Name = "Rainbow Outline", Path = {"Properties", "Tracer", "RainbowOutlineColor"}},
    {Type = "dropdown", Name = "Position", Path = {"Properties", "Tracer", "Position"}, Values = tracerPositions, Map = tracerPositionMap},
    {Type = "slider", Name = "Transparency", Path = {"Properties", "Tracer", "Transparency"}, Min = 0, Max = 1, Rounding = 2},
    {Type = "slider", Name = "Thickness", Path = {"Properties", "Tracer", "Thickness"}, Min = 0, Max = 5, Rounding = 2},
    {Type = "color", Name = "Color", Path = {"Properties", "Tracer", "Color"}},
    {Type = "toggle", Name = "Outline", Path = {"Properties", "Tracer", "Outline"}},
    {Type = "color", Name = "Outline Color", Path = {"Properties", "Tracer", "OutlineColor"}}
})

local HeadDotGroup = VisualsTab:AddLeftGroupbox("ESP Head Dot")
addDefinitionControls(HeadDotGroup, {
    {Type = "toggle", Name = "Enabled", Path = {"Properties", "HeadDot", "Enabled"}},
    {Type = "toggle", Name = "Rainbow Color", Path = {"Properties", "HeadDot", "RainbowColor"}},
    {Type = "toggle", Name = "Rainbow Outline", Path = {"Properties", "HeadDot", "RainbowOutlineColor"}},
    {Type = "color", Name = "Color", Path = {"Properties", "HeadDot", "Color"}},
    {Type = "slider", Name = "Transparency", Path = {"Properties", "HeadDot", "Transparency"}, Min = 0, Max = 1, Rounding = 2},
    {Type = "slider", Name = "Thickness", Path = {"Properties", "HeadDot", "Thickness"}, Min = 0, Max = 5, Rounding = 2},
    {Type = "slider", Name = "Num Sides", Path = {"Properties", "HeadDot", "NumSides"}, Min = 3, Max = 60, Rounding = 0},
    {Type = "toggle", Name = "Filled", Path = {"Properties", "HeadDot", "Filled"}},
    {Type = "color", Name = "Outline Color", Path = {"Properties", "HeadDot", "OutlineColor"}},
    {Type = "toggle", Name = "Outline", Path = {"Properties", "HeadDot", "Outline"}}
})

local BoxGroup = VisualsTab:AddRightGroupbox("ESP Box")
addDefinitionControls(BoxGroup, {
    {Type = "toggle", Name = "Enabled", Path = {"Properties", "Box", "Enabled"}},
    {Type = "toggle", Name = "Rainbow Color", Path = {"Properties", "Box", "RainbowColor"}},
    {Type = "toggle", Name = "Rainbow Outline", Path = {"Properties", "Box", "RainbowOutlineColor"}},
    {Type = "color", Name = "Color", Path = {"Properties", "Box", "Color"}},
    {Type = "slider", Name = "Transparency", Path = {"Properties", "Box", "Transparency"}, Min = 0, Max = 1, Rounding = 2},
    {Type = "slider", Name = "Thickness", Path = {"Properties", "Box", "Thickness"}, Min = 0, Max = 5, Rounding = 2},
    {Type = "toggle", Name = "Filled", Path = {"Properties", "Box", "Filled"}},
    {Type = "color", Name = "Outline Color", Path = {"Properties", "Box", "OutlineColor"}},
    {Type = "toggle", Name = "Outline", Path = {"Properties", "Box", "Outline"}}
})

local HealthBarGroup = VisualsTab:AddLeftGroupbox("ESP Health Bar")
addDefinitionControls(HealthBarGroup, {
    {Type = "toggle", Name = "Enabled", Path = {"Properties", "HealthBar", "Enabled"}},
    {Type = "toggle", Name = "Rainbow Outline", Path = {"Properties", "HealthBar", "RainbowOutlineColor"}},
    {Type = "slider", Name = "Offset", Path = {"Properties", "HealthBar", "Offset"}, Min = 0, Max = 20, Rounding = 0},
    {Type = "slider", Name = "Blue", Path = {"Properties", "HealthBar", "Blue"}, Min = 0, Max = 255, Rounding = 0},
    {Type = "dropdown", Name = "Position", Path = {"Properties", "HealthBar", "Position"}, Values = healthBarPositions, Map = healthBarPositionMap},
    {Type = "slider", Name = "Thickness", Path = {"Properties", "HealthBar", "Thickness"}, Min = 0, Max = 5, Rounding = 2},
    {Type = "slider", Name = "Transparency", Path = {"Properties", "HealthBar", "Transparency"}, Min = 0, Max = 1, Rounding = 2},
    {Type = "color", Name = "Outline Color", Path = {"Properties", "HealthBar", "OutlineColor"}},
    {Type = "toggle", Name = "Outline", Path = {"Properties", "HealthBar", "Outline"}}
})

updateProperty({"Properties", "Crosshair", "Enabled"}, false)
updateProperty({"Properties", "Crosshair", "CenterDot", "Enabled"}, false)
refreshESPConfiguration()
local originalProperties = {}

local function HSVToRGB(h, s, v)
    local c = v * s
    local x = c * (1 - math.abs((h / 60) % 2 - 1))
    local m = v - c
    local r, g, b = 0, 0, 0

    if h < 60 then r, g, b = c, x, 0
    elseif h < 120 then r, g, b = x, c, 0
    elseif h < 180 then r, g, b = 0, c, x
    elseif h < 240 then r, g, b = 0, x, c
    elseif h < 300 then r, g, b = x, 0, c
    else r, g, b = c, 0, x end

    return Color3.new(r + m, g + m, b + m)
end

local function applyChams(char)
    if not char then return end
    originalProperties = {}
    for _, part in ipairs(char:GetDescendants()) do
        if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
            originalProperties[part] = {
                Color = part.Color,
                Material = part.Material
            }
            part.Material = Enum.Material.ForceField
            part.Color = ScriptState.SelfChamsColor
        end
    end
end

local function restoreChams()
    for part, props in pairs(originalProperties) do
        if part and part.Parent then
            part.Color = props.Color
            part.Material = props.Material
        end
    end
    originalProperties = {}
end

local function updateChams()
    if not ScriptState.SelfChamsEnabled then return end
    for part, _ in pairs(originalProperties) do
        if part and part.Parent then
            if ScriptState.RainbowChamsEnabled then
                local hue = (tick() * 120) % 360
                part.Color = HSVToRGB(hue, 1, 1)
            else
                part.Color = ScriptState.SelfChamsColor
            end
        end
    end
end

RunService.RenderStepped:Connect(updateChams)

LocalPlayer.CharacterAdded:Connect(function(char)
    if ScriptState.SelfChamsEnabled then
        task.wait(1)
        applyChams(char)
    end
end)

VisualsEx:AddToggle("selfChamsEnabled", {
    Text = "Self Chams",
    Default = false,
    Callback = function(val)
        ScriptState.SelfChamsEnabled = val
        if val then
            if LocalPlayer.Character then
                applyChams(LocalPlayer.Character)
            end
        else
            restoreChams()
        end
    end
})

VisualsEx:AddToggle("rainbowChams", {
    Text = "Rainbow Chams",
    Default = false,
    Callback = function(val)
        ScriptState.RainbowChamsEnabled = val
    end
})

VisualsEx:AddLabel("Self Chams Color"):AddColorPicker("selfChamsColor", {
    Default = ScriptState.SelfChamsColor,
    Callback = function(val)
        ScriptState.SelfChamsColor = val
    end
})

local ChamsOccludedColor = {Color3.fromRGB(128, 0, 128), 0.7}
local ChamsVisibleColor = {Color3.fromRGB(255, 0, 255), 0.3}

local AdornmentsCache = {}
local IgnoreNames = {["HumanoidRootPart"] = true}

local function CreateAdornment(part, isHead, vis)
    local adorn
    if isHead then
        adorn = Instance.new("CylinderHandleAdornment")
        adorn.Height = vis == 1 and 0.87 or 1.02
        adorn.Radius = vis == 1 and 0.5 or 0.65
    else
        adorn = Instance.new("BoxHandleAdornment")
        local offset = vis == 1 and -0.05 or 0.05
        adorn.Size = part.Size + Vector3.new(offset, offset, offset)
    end
    adorn.Adornee = part
    adorn.Parent = part
    adorn.ZIndex = vis == 1 and 2 or 1
    adorn.AlwaysOnTop = vis == 1
    adorn.Visible = false
    return adorn
end

local function IsEnemy(player)
    if ESP and ESP.Settings and ESP.Settings.TeamCheck then
        return player.Team ~= LocalPlayer.Team
    end
    return true
end

local function ApplyChams(player)
    if player ~= LocalPlayer and player.Character then
        for _, part in pairs(player.Character:GetChildren()) do
            if part:IsA("BasePart") and not IgnoreNames[part.Name] then
                if not AdornmentsCache[part] then
                    AdornmentsCache[part] = {
                        CreateAdornment(part, part.Name=="Head", 1),
                        CreateAdornment(part, part.Name=="Head", 2)
                    }
                end
                local ad = AdornmentsCache[part]
                local visible = ScriptState.ChamsEnabled and IsEnemy(player)

                ad[1].Visible = visible
                ad[1].Color3 = ChamsOccludedColor[1]
                ad[1].Transparency = ChamsOccludedColor[2]

                ad[2].Visible = visible
                ad[2].AlwaysOnTop = true
                ad[2].ZIndex = 9e9
                ad[2].Color3 = ChamsVisibleColor[1]
                ad[2].Transparency = ChamsVisibleColor[2]
            end
        end
    end
end

local function UpdateAllChams()
    for _, player in pairs(Players:GetPlayers()) do
        ApplyChams(player)
    end
end

local function TrackPlayer(player)
    player:GetPropertyChangedSignal("Team"):Connect(function()
        if AdornmentsCache[player] then
            for _, ad in pairs(AdornmentsCache[player]) do
                ad.Visible = ScriptState.ChamsEnabled and IsEnemy(player)
            end
        end
    end)
end

Players.PlayerAdded:Connect(TrackPlayer)
for _, plr in pairs(Players:GetPlayers()) do
    if plr ~= LocalPlayer then
        TrackPlayer(plr)
    end
end

RunService.RenderStepped:Connect(UpdateAllChams)

VisualsEx:AddToggle("chamsEnabled", {
    Text = "Chams",
    Default = ScriptState.ChamsEnabled,
    Callback = function(val)
        ScriptState.ChamsEnabled = val
        for part, ad in pairs(AdornmentsCache) do
            ad[1].Visible = val
            ad[2].Visible = val
        end
    end
})

VisualsEx:AddLabel("Chams Occluded Color"):AddColorPicker("chamsOccludedColor", {
    Default = ChamsOccludedColor[1],
    Callback = function(val)
        ChamsOccludedColor[1] = val
    end
})

VisualsEx:AddLabel("Chams Visible Color"):AddColorPicker("chamsVisibleColor", {
    Default = ChamsVisibleColor[1],
    Callback = function(val)
        ChamsVisibleColor[1] = val
    end
})

VisualsEx:AddSlider("chamsOccludedTransparency", {
    Text = "Occluded Transparency",
    Default = ChamsOccludedColor[2],
    Min = 0,
    Max = 1,
    Rounding = 2,
    Callback = function(val)
        ChamsOccludedColor[2] = val
    end
})

VisualsEx:AddSlider("chamsVisibleTransparency", {
    Text = "Visible Transparency",
    Default = ChamsVisibleColor[2],
    Min = 0,
    Max = 1,
    Rounding = 2,
    Callback = function(val)
        ChamsVisibleColor[2] = val
    end
})

local humanoid = nil

frabox:AddToggle("speedEnabled", {
    Text = "Speed Toggle",
    Default = false,
    Tooltip = "It makes you go fast.",
    Callback = function(value)
        ScriptState.isSpeedActive = value
    end
}):AddKeyPicker("speedToggleKey", {
    Default = "None",
    SyncToggleState = true,
    Mode = "Toggle",
    Text = "Speed Toggle Key",
    Tooltip = "CFrame keybind.",
    Callback = function(value)
        ScriptState.isSpeedActive = value
    end
})

frabox:AddSlider("cframespeed", {
    Text = "CFrame Multiplier",
    Default = 1,
    Min = 1,
    Max = 20,
    Rounding = 1,
    Tooltip = "The CFrame speed.",
    Callback = function(value)
        ScriptState.Cmultiplier = value
    end,
})

frabox:AddToggle("flyEnabled", {
    Text = "CFly Toggle",
    Default = false,
    Tooltip = "Toggle CFrame Fly functionality.",
    Callback = function(value)
        ScriptState.isFlyActive = value
    end
}):AddKeyPicker("flyToggleKey", {
    Default = "None",
    SyncToggleState = true,
    Mode = "Toggle",
    Text = "CFly Toggle Key",
    Tooltip = "CFrame Fly keybind.",
    Callback = function(value)
        ScriptState.isFlyActive = value
    end
})

frabox:AddSlider("flySpeed", {
    Text = "CFly Speed",
    Default = 1,
    Min = 1,
    Max = 50,
    Rounding = 1,
    Tooltip = "The CFrame Fly speed.",
    Callback = function(value)
        ScriptState.flySpeed = value
    end,
})

frabox:AddToggle("noClipEnabled", {
    Text = "NoClip Toggle",
    Default = false,
    Tooltip = "Enable or disable NoClip.",
    Callback = function(value)
        ScriptState.isNoClipActive = value
    end
}):AddKeyPicker("noClipToggleKey", {
    Default = "None",
    SyncToggleState = true,
    Mode = "Toggle",
    Text = "NoClip Toggle Key",
    Tooltip = "Keybind to toggle NoClip.",
    Callback = function(value)
        ScriptState.isNoClipActive = value
    end
})

getgenv().WeaponOnHands = getgenv().WeaponOnHands or false
getgenv().WeaponModifyMethod = getgenv().WeaponModifyMethod or "Attribute"

local function findSettingsModuleForWeapon(weapon, property)
    if not (weapon and weapon:IsA("Tool")) then
        return nil
    end

    local function moduleSupportsProperty(moduleScript)
        local success, module = pcall(require, moduleScript)
        if success and type(module) == "table" and module[property] ~= nil then
            return true
        end
        return false
    end

    for _, moduleScript in ipairs(weapon:GetDescendants()) do
        if moduleScript:IsA("ModuleScript") and moduleSupportsProperty(moduleScript) then
            return moduleScript
        end
    end

    local weaponName = weapon.Name
    local searchFolders = {}

    local configurations = ReplicatedStorage:FindFirstChild("Configurations")
    if configurations then
        table.insert(searchFolders, configurations)
    end

    local acsFolder = ReplicatedStorage:FindFirstChild("ACS_Guns", true)
    if acsFolder then
        table.insert(searchFolders, acsFolder)
    end

    table.insert(searchFolders, ReplicatedStorage)

    for _, container in ipairs(searchFolders) do
        if typeof(container) == "Instance" then
            local candidate = container:FindFirstChild(weaponName, true)
            if candidate then
                if candidate:IsA("ModuleScript") and moduleSupportsProperty(candidate) then
                    return candidate
                end

                for _, moduleScript in ipairs(candidate:GetDescendants()) do
                    if moduleScript:IsA("ModuleScript") and moduleSupportsProperty(moduleScript) then
                        return moduleScript
                    end
                end
            end
        end
    end

    return nil
end

local function modifyWeaponSettings(property, value)
    local player = Players.LocalPlayer
    local backpack = player:WaitForChild("Backpack")
    local character = player.Character or player.CharacterAdded:Wait()

    local function applyAttribute(weapon)
        if weapon and weapon:IsA("Tool") then
            pcall(function()
                weapon:SetAttribute(property, value)
            end)
        end
    end

    local function applyRequireModule(weapon)
        local settingsModule = findSettingsModuleForWeapon(weapon, property)
        if settingsModule then
            local success, module = pcall(require, settingsModule)
            if success and type(module) == "table" and module[property] ~= nil then
                module[property] = value
            end
        end
    end

    local function processWeapon(weapon)
        if not (weapon and weapon:IsA("Tool")) then
            return
        end

        if (getgenv().WeaponModifyMethod or "Attribute") == "Attribute" then
            applyAttribute(weapon)
        else
            applyRequireModule(weapon)
        end
    end

    local handledEquippedWeapon = false

    if getgenv().WeaponOnHands then
        local toolInHand = character:FindFirstChildOfClass("Tool")
        if toolInHand then
            processWeapon(toolInHand)
            handledEquippedWeapon = true
        end
    end

    if not handledEquippedWeapon then
        for _, item in ipairs(backpack:GetChildren()) do
            processWeapon(item)
        end

        local equippedTool = character:FindFirstChildOfClass("Tool")
        if equippedTool and equippedTool.Parent ~= backpack then
            processWeapon(equippedTool)
        end
    end
end

ACSEngineBox:AddToggle("WeaponOnHands", {
    Text = "Weapon In Hands",
    Default = false,
    Tooltip = "Apply changes only to the weapon in hands if enabled.",
    Callback = function(value)
        getgenv().WeaponOnHands = value
    end
})

ACSEngineBox:AddDropdown("WeaponModifyMethod", {
    Text = "Weapon Modify Method",
    Default = "Attribute",
    Values = {"Attribute", "Require"},
    Tooltip = "Choose how to modify weapon settings",
    Callback = function(value)
        getgenv().WeaponModifyMethod = value
    end
})

ACSEngineBox:AddButton('INF AMMO', function()
    modifyWeaponSettings("Ammo", math.huge)
end)

ACSEngineBox:AddButton('NO RECOIL | NO SPREAD', function()
    if getgenv().WeaponModifyMethod == "Attribute" then
        modifyWeaponSettings("VRecoil", Vector2.new(0, 0))
        modifyWeaponSettings("HRecoil", Vector2.new(0, 0))
    else
        modifyWeaponSettings("VRecoil", {0, 0})
        modifyWeaponSettings("HRecoil", {0, 0})
    end
    modifyWeaponSettings("MinSpread", 0)
    modifyWeaponSettings("MaxSpread", 0)
    modifyWeaponSettings("RecoilPunch", 0)
    modifyWeaponSettings("AimRecoilReduction", 0)
end)

ACSEngineBox:AddButton('INF BULLET DISTANCE', function()
    modifyWeaponSettings("Distance", 25000)
end)

ACSEngineBox:AddInput("BulletSpeedInput", {
    Text = "Bullet Speed",
    Default = "10000",
    Tooltip = "Set the bullet speed",
    Callback = function(value)
        getgenv().bulletSpeedValue = tonumber(value) or 10000
    end
})

ACSEngineBox:AddButton('CHANGE BULLET SPEED', function()
    modifyWeaponSettings("BSpeed", getgenv().bulletSpeedValue or 10000)
    modifyWeaponSettings("MuzzleVelocity", getgenv().bulletSpeedValue or 10000)
end)

local fireRateInput = ACSEngineBox:AddInput('FireRateInput', {
    Text = 'Enter Fire Rate',
    Default = '8888',
    Tooltip = 'Type the fire rate value you want to apply.',
})

ACSEngineBox:AddButton('CHANGE FIRE RATE', function()
    local rate = tonumber(fireRateInput.Value) or 8888
    modifyWeaponSettings("FireRate", rate)
    modifyWeaponSettings("ShootRate", rate)
end)

local bulletsInput = ACSEngineBox:AddInput('BulletsInput', {
    Text = 'Enter Bullets',
    Default = '50',
    Tooltip = 'Type the number of bullets you want to apply.',
    Numeric = true
})

ACSEngineBox:AddButton('MULTI BULLETS', function()
    local bulletsValue = tonumber(bulletsInput.Value) or 50
    modifyWeaponSettings("Bullets", bulletsValue)
end)

local inputField = ACSEngineBox:AddInput('FireModeInput', {
    Text = 'Enter Fire Mode',
    Default = 'Auto',
    Tooltip = 'Type the fire mode you want to apply.',
})

ACSEngineBox:AddButton('CHANGE FIRE MODE', function()
    modifyWeaponSettings("Mode", inputField.Value or 'Auto')
end)

local targetStrafe = GeneralTab:AddLeftGroupbox("Target Strafe")
ScriptState.strafeSpeed, ScriptState.strafeRadius = 50, 5
ScriptState.strafeMode, ScriptState.strafeTargetPart = "Horizontal", nil
local function startTargetStrafe()
    local targetPart = getClosestPlayer()
    ScriptState.strafeTargetPart = targetPart
    if ScriptState.strafeTargetPart and ScriptState.strafeTargetPart.Parent then
        ScriptState.originalCameraMode = Players.LocalPlayer.CameraMode
        Players.LocalPlayer.CameraMode = Enum.CameraMode.Classic
        local targetPos = ScriptState.strafeTargetPart.Position
        LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(targetPos))
        Camera.CameraSubject = ScriptState.strafeTargetPart.Parent:FindFirstChild("Humanoid")
    end
end

local function strafeAroundTarget()
    if not (ScriptState.strafeTargetPart and ScriptState.strafeTargetPart.Parent) then return end
    local targetPos = ScriptState.strafeTargetPart.Position
    local angle = tick() * (ScriptState.strafeSpeed / 10)
    local offset = ScriptState.strafeMode == "Horizontal"
        and Vector3.new(math.cos(angle) * ScriptState.strafeRadius, 0, math.sin(angle) * ScriptState.strafeRadius)
        or Vector3.new(math.cos(angle) * ScriptState.strafeRadius, ScriptState.strafeRadius, math.sin(angle) * ScriptState.strafeRadius)
    LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(targetPos + offset))
    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position, targetPos)
end

local function stopTargetStrafe()
    Players.LocalPlayer.CameraMode = ScriptState.originalCameraMode or Enum.CameraMode.Classic
    Camera.CameraSubject = LocalPlayer.Character.Humanoid
    ScriptState.strafeEnabled, ScriptState.strafeTargetPart = false, nil
end
targetStrafe:AddToggle("strafeToggle", {
    Text = "Target Strafe",
    Default = false,
    Tooltip = "Enable or disable Target Strafe.",
    Callback = function(value)
        ScriptState.strafeEnabled = value
        if ScriptState.strafeEnabled then
            startTargetStrafe()
        else
            stopTargetStrafe()
        end
    end
}):AddKeyPicker("strafeToggleKey", {
    Default = "None",
    SyncToggleState = true,
    Mode = "Toggle",
    Text = "Target Strafe",
    Tooltip = "Key to toggle Target Strafe",
    Callback = function(value)
        ScriptState.strafeEnabled = value
        if ScriptState.strafeEnabled then
            startTargetStrafe()
        else
            stopTargetStrafe()
        end
    end
})

targetStrafe:AddDropdown("strafeModeDropdown", {
    AllowNull = false,
    Text = "Target Strafe Mode",
    Default = "Horizontal",
    Values = {"Horizontal", "UP"},
    Tooltip = "Select the strafing mode.",
    Callback = function(value) ScriptState.strafeMode = value end
})

targetStrafe:AddSlider("strafeRadiusSlider", {
    Text = "Strafe Radius",
    Default = 5,
    Min = 1,
    Max = 20,
    Rounding = 1,
    Tooltip = "Set the radius of movement around the target.",
    Callback = function(value) ScriptState.strafeRadius = value end
})

targetStrafe:AddSlider("strafeSpeedSlider", {
    Text = "Strafe Speed",
    Default = 50,
    Min = 10,
    Max = 200,
    Rounding = 1,
    Tooltip = "Set the speed of strafing around the target.",
    Callback = function(value) ScriptState.strafeSpeed = value end
})

local keybindWatchers = {}

local function registerKeybindWatcher(toggleId, keyPickerId, handlers)
    local toggle = Toggles[toggleId]
    local keyPicker = Options[keyPickerId]

    if not (toggle and keyPicker) then
        return
    end

    local watcher = {
        toggle = toggle,
        keyPicker = keyPicker,
        lastState = keyPicker:GetState(),
        lastMode = keyPicker.Mode,
        modeChanged = handlers and handlers.onModeChanged,
        stateChanged = handlers and handlers.onStateChanged,
    }

    if toggle.Value ~= watcher.lastState then
        toggle:SetValue(watcher.lastState)
    elseif watcher.stateChanged then
        watcher.stateChanged(watcher.lastState)
    end

    if watcher.modeChanged then
        watcher.modeChanged(watcher.lastMode)
    end

    keyPicker:OnChanged(function()
        watcher.lastMode = keyPicker.Mode
        watcher.lastState = keyPicker:GetState()
        if watcher.modeChanged then
            watcher.modeChanged(watcher.lastMode)
        end
        if toggle.Value ~= watcher.lastState then
            toggle:SetValue(watcher.lastState)
        elseif watcher.stateChanged then
            watcher.stateChanged(watcher.lastState)
        end
    end)

    table.insert(keybindWatchers, watcher)
end

registerKeybindWatcher("silentAimEnabled", "silentAim_KeyPicker", {
    onModeChanged = function(mode)
        SilentAimSettings.KeyMode = mode or "Toggle"
    end,
    onStateChanged = function(state)
        SilentAimSettings.Enabled = state
        if silentAimToggle.Value ~= state then
            silentAimToggle:SetValue(state)
        end
    end,
})

registerKeybindWatcher("speedEnabled", "speedToggleKey")
registerKeybindWatcher("flyEnabled", "flyToggleKey")
registerKeybindWatcher("noClipEnabled", "noClipToggleKey")
registerKeybindWatcher("strafeToggle", "strafeToggleKey")

RunService.RenderStepped:Connect(function()
    for _, watcher in ipairs(keybindWatchers) do
        local state = watcher.keyPicker:GetState()

        if watcher.keyPicker.Mode ~= watcher.lastMode then
            watcher.lastMode = watcher.keyPicker.Mode
            if watcher.modeChanged then
                watcher.modeChanged(watcher.lastMode)
            end
            state = watcher.keyPicker:GetState()
        end

        if state ~= watcher.lastState then
            watcher.lastState = state
            if watcher.toggle.Value ~= state then
                watcher.toggle:SetValue(state)
            elseif watcher.stateChanged then
                watcher.stateChanged(state)
            end
        end
    end
end)

RunService.RenderStepped:Connect(function()
    if ScriptState.strafeEnabled then
        strafeAroundTarget()
    end
end)

while true do
    task.wait()

    if ScriptState.isSpeedActive or ScriptState.isFlyActive or ScriptState.isNoClipActive then
        local character = LocalPlayer.Character
        local rootPart = character and character:FindFirstChild("HumanoidRootPart")

        if character and rootPart then
            humanoid = character:FindFirstChild("Humanoid")

            if ScriptState.isSpeedActive and humanoid and humanoid.MoveDirection.Magnitude > 0 then
                local moveDirection = humanoid.MoveDirection.Unit
                rootPart.CFrame = rootPart.CFrame + moveDirection * ScriptState.Cmultiplier
            end

            if ScriptState.isFlyActive then
                local flyDirection = Vector3.zero

                if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                    flyDirection = flyDirection + Camera.CFrame.LookVector
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                    flyDirection = flyDirection - Camera.CFrame.LookVector
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                    flyDirection = flyDirection - Camera.CFrame.RightVector
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                    flyDirection = flyDirection + Camera.CFrame.RightVector
                end

                if flyDirection.Magnitude > 0 then
                    flyDirection = flyDirection.Unit
                end

                local newPosition = rootPart.Position + flyDirection * ScriptState.flySpeed
                rootPart.CFrame = CFrame.new(newPosition)
                rootPart.Velocity = Vector3.new(0, 0, 0)
            end

            if ScriptState.isNoClipActive then
                for _, v in pairs(character:GetDescendants()) do
                    if v:IsA("BasePart") and v.CanCollide then
                        v.CanCollide = false
                    end
                end
            end
        end
    end
end

ThemeManager:LoadDefaultTheme()
