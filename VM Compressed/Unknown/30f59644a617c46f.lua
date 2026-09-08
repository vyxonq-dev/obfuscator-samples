    do
    local secActive = true
    local lastChk = tick()
    local function safeChk()
        if tick() - lastChk < 5 then return true end
        lastChk = tick()
        local badNames = {"HttpSpy", "DexExplorer", "SimpleSpy", "ScriptDumper", "HookFunction", "RemoteSpy", "NetworkSpy", "PacketSniffer"}
        local cg = game:GetService("CoreGui")
        for _, o in pairs(cg:GetChildren()) do
            if o:IsA("ScreenGui") then
                local n = o.Name:lower()
                if n:find("spy") or n:find("dex") or n:find("hook") then return false end
            end
        end
        for _, n in ipairs(badNames) do
            if rawget(_G, n) ~= nil then return false end
        end
        return true
    end
    local function chkHooks()
        local safe = true
        pcall(function()
            local mt = getrawmetatable(game)
            if mt and rawget(mt, "__index") then
                local idx = mt.__index
                if type(idx) == "function" then
                    local info = debug.info(idx, "n")
                    if info and (info:lower():find("hook") or info:lower():find("spy")) then safe = false end
                end
            end
        end)
        return safe
    end
    if not safeChk() or not chkHooks() then
        secActive = false
        game:GetService("Players").LocalPlayer:Kick("Security violation")
        return
    end
    spawn(function()
        wait(0.5)
        if setclipboard then
            pcall(function()
                setclipboard("starlight.cc | " .. os.date("%Y-%m-%d %H:%M:%S"))
            end)
        end
    end)

local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/Library.lua"))()
local TM = loadstring(game:HttpGet("https://raw.githubusercontent.com/eradicator2/starlight-criminality/refs/heads/main/ThemeManager.lua"))()
local SM = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/addons/SaveManager.lua"))()

local Plrs = game:GetService("Players")
local RepSt = game:GetService("ReplicatedStorage")
local RS = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local VU = game:GetService("VirtualUser")
local Ws = game:GetService("Workspace")
local Lt = game:GetService("Lighting")

local LP = Plrs.LocalPlayer
local Cam = workspace.CurrentCamera

local EvFolder = RepSt:WaitForChild("Events")
local GNX = EvFolder:WaitForChild("GNX_S")
local ZFK = EvFolder:WaitForChild("ZFKLF__H")
local deathEv = EvFolder:WaitForChild("DeathRespawn")

S = {
    Farm = {Enabled = false, Target = nil, TeleConn = nil, EConn = nil, DmgConn = nil, RespawnCD = false, MaxHP = 115, Respawning = false},
    ESP = {On = false, HlOn = false, ArmsOn = false, Conn = nil, VMConn = nil, CharConn = nil, HlCol = Color3.fromRGB(255, 204, 204), ArmsCol = Color3.fromRGB(255, 204, 204)},
    Collect = {On = false, Sig = nil, Task = nil},
    Fly = {On = false, Method = "Ragdoll", InpConn = nil},
    Rage = {On = false, Target = nil, Task = nil, UseList = false, List = {}},
    Noclip = {On = false, Conn = nil},
    StopNeck = {On = false, Conn = nil},
    Unbreak = {On = false, Conns = {}},
    FakeDown = {On = false, Conn = nil, OrigVal = nil, StatObj = nil},
    NoFall = {On = false, Conns = {}},
    NoSpike = {On = false, Conn = nil},
    InstReload = {On = false, Conns = {}},
    MeleeA = {On = false, Conn = nil},
    Shadow = {Active = false, Usable = true},
    AdminChk = {On = false, Conn = nil},
    AntiAFK = {On = false, IdleConn = nil, Coro = nil},
    FullBright = {On = false, Conn = nil, OrigVals = {ClockTime = Lt.ClockTime, Brightness = Lt.Brightness, Ambient = Lt.Ambient, OutdoorAmbient = Lt.OutdoorAmbient, ColorShift_Top = Lt.ColorShift_Top, FogStart = Lt.FogStart, FogEnd = Lt.FogEnd}},
    FOV = {On = false, Val = 80, OrigVal = Cam.FieldOfView, Conn = nil},
    Sky = {On = false, Custom = nil, Orig = nil, Selected = "Nebula"},
    Cam = {NoclipOn = false, MaxDistOn = false, OrigMaxDist = LP.CameraMaxZoomDistance},
    UI = {TxtFocused = false, TxtRefocused = false, FarmCharConn = nil},
    SafeESP = {On = false, Coroutine = nil, Highlights = {}, Billboards = {}, ResetTimers = {}, FrozenPositions = {}, LastUpdateTime = tick()},
    LockpickScale = {On = false, Connection = nil},
    InfStamina = {On = false, Connection = nil},
    AimBot = {Enabled = false, AimKey = Enum.UserInputType.MouseButton2, Smoothness = 0.1, FOV = 100, ShowFOV = true, FOVColor = Color3.fromRGB(255, 255, 255), FOVTransparency = 0.5, WallCheck = true, DownedCheck = true, Prediction = 100, TargetPart = "Head", Connection = nil, Target = nil, FOVCircle = nil, FOVUpdateConnection = nil, FOVPosition = Vector2.new(Cam.ViewportSize.X/2, Cam.ViewportSize.Y/2), Sticky = true},
    ChinaHat = {Enabled = false, Color = Color3.fromRGB(255, 105, 180), Hat = nil, Connection = nil},
    PlayerChams = {Enabled = false, VisibleColor = Color3.fromRGB(255, 0, 0), OccludedColor = Color3.fromRGB(255, 255, 255), WallColor = Color3.fromRGB(0, 255, 255), Adornments = {}, Connection = nil},
    ESPDistance = {Value = 100, Min = 50, Max = 1000},
    Blur = {Enabled = false, BlurEffect = nil, Connection = nil, LastLookVector = nil, CurrentLookVector = nil, RotationSpeed = 0},
    Freecam = {Enabled = false, Speed = 50, Connection = nil, KeysDown = {}, Rotating = false, OnMobile = not UIS.KeyboardEnabled},
    NoRecoil = {Enabled = false, Connections = {}, WeaponCache = {}, OriginalValues = {}, Settings = {GunMods = {NoRecoil = true, Spread = true, SpreadAmount = 0}}}
}


-- ==================== MAP LIGHTING SYSTEM ====================

local MapLighting = {
    Enabled = false,
    OriginalLighting = {},
    ProtectionConnection = nil,
    LightingConnection = nil,
    CurrentColorIndex = 1,
    LightingColors = {
        {Name = "Purple", MainColor = Color3.fromRGB(180, 100, 255), AmbientColor = Color3.fromRGB(80, 40, 120)},
        {Name = "Blue", MainColor = Color3.fromRGB(100, 150, 255), AmbientColor = Color3.fromRGB(40, 60, 120)},
        {Name = "Red", MainColor = Color3.fromRGB(255, 80, 80), AmbientColor = Color3.fromRGB(120, 30, 30)},
        {Name = "Green", MainColor = Color3.fromRGB(80, 255, 80), AmbientColor = Color3.fromRGB(30, 120, 30)},
        {Name = "Pink", MainColor = Color3.fromRGB(255, 120, 180), AmbientColor = Color3.fromRGB(120, 50, 80)},
        {Name = "Orange", MainColor = Color3.fromRGB(255, 160, 50), AmbientColor = Color3.fromRGB(120, 70, 20)}
    }
}

function MapLighting:SaveOriginalLighting()
    self.OriginalLighting = {
        Brightness = Lt.Brightness,
        Ambient = Lt.Ambient,
        OutdoorAmbient = Lt.OutdoorAmbient,
        ColorShift_Top = Lt.ColorShift_Top,
        ColorShift_Bottom = Lt.ColorShift_Bottom,
        FogColor = Lt.FogColor,
        FogEnd = Lt.FogEnd,
        ClockTime = Lt.ClockTime,
        ExposureCompensation = Lt.ExposureCompensation,
        GlobalShadows = Lt.GlobalShadows,
        ShadowSoftness = Lt.ShadowSoftness,
        EnvironmentDiffuseScale = Lt.EnvironmentDiffuseScale,
        EnvironmentSpecularScale = Lt.EnvironmentSpecularScale
    }
end

function MapLighting:ApplyLighting()
    if not self.Enabled then return end
    
    local colorInfo = self.LightingColors[self.CurrentColorIndex]
    
    Lt.Ambient = colorInfo.AmbientColor
    Lt.OutdoorAmbient = colorInfo.MainColor
    Lt.ColorShift_Top = colorInfo.MainColor
    Lt.ColorShift_Bottom = colorInfo.AmbientColor
    Lt.FogColor = colorInfo.MainColor
    Lt.FogEnd = 10000
    Lt.ClockTime = 14
    Lt.Brightness = 2.5
    Lt.ExposureCompensation = 0
    Lt.GlobalShadows = true
    Lt.ShadowSoftness = 0.5
    Lt.EnvironmentDiffuseScale = 1
    Lt.EnvironmentSpecularScale = 1
end

function MapLighting:RestoreLighting()
    for property, value in pairs(self.OriginalLighting) do
        pcall(function()
            Lt[property] = value
        end)
    end
end

function MapLighting:CreateProtectionSystem()
    local propertiesToProtect = {
        "Ambient",
        "OutdoorAmbient", 
        "ColorShift_Top",
        "ColorShift_Bottom",
        "Brightness",
        "FogColor",
        "FogEnd",
        "ClockTime"
    }
    
    local lastCheck = tick()
    local targetValues = {}
    
    local colorInfo = self.LightingColors[self.CurrentColorIndex]
    targetValues = {
        Ambient = colorInfo.AmbientColor,
        OutdoorAmbient = colorInfo.MainColor,
        ColorShift_Top = colorInfo.MainColor,
        ColorShift_Bottom = colorInfo.AmbientColor,
        Brightness = 2.5,
        FogColor = colorInfo.MainColor,
        FogEnd = 10000,
        ClockTime = 14
    }
    
    self.ProtectionConnection = RS.Heartbeat:Connect(function()
        local now = tick()
        if now - lastCheck > 0.05 then
            lastCheck = now
            
            if self.Enabled then
                for _, property in ipairs(propertiesToProtect) do
                    if targetValues[property] then
                        local current = Lt[property]
                        local target = targetValues[property]
                        
                        if current ~= target then
                            pcall(function()
                                if typeof(current) == "Color3" then
                                    Lt[property] = target
                                else
                                    Lt[property] = target
                                end
                            end)
                        end
                    end
                end
            end
        end
    end)
end

function MapLighting:Enable()
    if self.Enabled then return end
    
    self.Enabled = true
    self:SaveOriginalLighting()
    self:ApplyLighting()
    
    if self.LightingConnection then
        self.LightingConnection:Disconnect()
    end
    
    self.LightingConnection = RS.Heartbeat:Connect(function()
        if self.Enabled then
            self:ApplyLighting()
        end
    end)
    
    if self.ProtectionConnection then
        self.ProtectionConnection:Disconnect()
    end
    
    self:CreateProtectionSystem()
end

function MapLighting:Disable()
    if not self.Enabled then return end
    
    self.Enabled = false
    
    if self.LightingConnection then
        self.LightingConnection:Disconnect()
        self.LightingConnection = nil
    end
    
    if self.ProtectionConnection then
        self.ProtectionConnection:Disconnect()
        self.ProtectionConnection = nil
    end
    
    self:RestoreLighting()
end

function MapLighting:Toggle()
    if self.Enabled then
        self:Disable()
    else
        self:Enable()
    end
end

function MapLighting:SetColor(index)
    if index < 1 or index > #self.LightingColors then return end
    self.CurrentColorIndex = index
    if self.Enabled then
        self:ApplyLighting()
    end
end

-- Initialize
MapLighting:SaveOriginalLighting()

-- ==================== MAP BLUR SYSTEM ====================

local MapBlur = {
    Active = false,
    Components = {},
    Connections = {},
    VisualTime = 0,
    OriginalLightingSettings = {}
}

local VISION_CONFIG = {
    COLOR_MASTER = {
        NEUTRAL_NIGHT = Color3.fromRGB(20, 25, 35),
        CLEAR_BLUE = Color3.fromRGB(120, 140, 180),
        SOFT_WHITE = Color3.fromRGB(230, 225, 210),
        SHADOW_GRAY = Color3.fromRGB(35, 35, 40)
    },
    
    VISUAL_MAGIC = {
        ANIMATION_GRACE = 0.15,
        LIGHT_DANCE = 0.08
    },
    
    POSTPROCESS_ART = {
        BLOOM_GENTLE = {INTENSITY = 0.45, SIZE = 24, THRESHOLD = 0.85},
        COLOR_HARMONY = {BRIGHTNESS = 0.05, CONTRAST = 0.2, SATURATION = 0.65}
    }
}

function MapBlur:SaveOriginalSettings()
    self.OriginalLightingSettings = {
        Brightness = Lt.Brightness,
        ClockTime = Lt.ClockTime,
        TimeOfDay = Lt.TimeOfDay,
        ExposureCompensation = Lt.ExposureCompensation,
        ShadowSoftness = Lt.ShadowSoftness,
        ShadowColor = Lt.ShadowColor,
        Ambient = Lt.Ambient,
        OutdoorAmbient = Lt.OutdoorAmbient,
        ColorShift_Top = Lt.ColorShift_Top,
        ColorShift_Bottom = Lt.ColorShift_Bottom,
        FogStart = Lt.FogStart,
        FogEnd = Lt.FogEnd,
        FogColor = Lt.FogColor,
        GlobalShadows = Lt.GlobalShadows,
        EnvironmentDiffuseScale = Lt.EnvironmentDiffuseScale,
        EnvironmentSpecularScale = Lt.EnvironmentSpecularScale,
        GeographicLatitude = Lt.GeographicLatitude
    }
    
    self.OriginalLightingSettings.PostEffects = {}
    for _, effect in pairs(Lt:GetChildren()) do
        if effect:IsA("PostEffect") then
            self.OriginalLightingSettings.PostEffects[effect.Name] = {
                Object = effect:Clone(),
                Parent = effect.Parent
            }
        end
    end
end

function MapBlur:RestoreOriginalSettings()
    for setting, value in pairs(self.OriginalLightingSettings) do
        if setting ~= "PostEffects" and Lt[setting] ~= nil then
            pcall(function()
                Lt[setting] = value
            end)
        end
    end
    
    for _, effect in pairs(Lt:GetChildren()) do
        if effect:IsA("PostEffect") then
            pcall(function() effect:Destroy() end)
        end
    end
    
    if self.OriginalLightingSettings.PostEffects then
        for name, effectData in pairs(self.OriginalLightingSettings.PostEffects) do
            pcall(function()
                local effect = effectData.Object:Clone()
                effect.Name = name
                effect.Parent = Lt
            end)
        end
    end
end

function MapBlur:Toggle()
    self.Active = not self.Active
    
    if self.Active then
        self:InitializeVision()
    else
        self:StopVision()
    end
end

function MapBlur:InitializeVision()
    if self.Active then return end
    
    self:CleanVision()
    self:SetupCustomLighting()
    self:CreateVisualEnhancements()
    self:StartVisualSymphony()
    
    self.Active = true
    self.VisualTime = 0
end

function MapBlur:CleanVision()
    for _, conn in pairs(self.Connections) do
        if conn then pcall(function() conn:Disconnect() end) end
    end
    
    for _, comp in pairs(self.Components) do
        if comp and comp.Parent then
            pcall(function() comp:Destroy() end)
        end
    end
    
    self.Components = {}
    self.Connections = {}
end

function MapBlur:SetupCustomLighting()
    Lt.TimeOfDay = "02:00:00"
    Lt.ClockTime = 2.0
    Lt.GlobalShadows = true
    Lt.ShadowSoftness = 0.4
    Lt.ShadowColor = VISION_CONFIG.COLOR_MASTER.SHADOW_GRAY
    Lt.FogStart = 0
    Lt.FogEnd = 100000
    Lt.FogColor = Color3.fromRGB(255, 255, 255)
    Lt.Ambient = VISION_CONFIG.COLOR_MASTER.NEUTRAL_NIGHT
    Lt.OutdoorAmbient = VISION_CONFIG.COLOR_MASTER.CLEAR_BLUE
    Lt.ColorShift_Top = VISION_CONFIG.COLOR_MASTER.SOFT_WHITE
    Lt.ColorShift_Bottom = VISION_CONFIG.COLOR_MASTER.CLEAR_BLUE
    Lt.Brightness = 0.45
    Lt.ExposureCompensation = 0.15
    Lt.EnvironmentDiffuseScale = 0.8
    Lt.EnvironmentSpecularScale = 0.35
end

function MapBlur:CreateVisualEnhancements()
    local enhancements = {}
    
    local success, bloom = pcall(function()
        local gentleBloom = Instance.new("BloomEffect")
        gentleBloom.Name = "SWILL_GentleBloom"
        gentleBloom.Intensity = VISION_CONFIG.POSTPROCESS_ART.BLOOM_GENTLE.INTENSITY
        gentleBloom.Size = VISION_CONFIG.POSTPROCESS_ART.BLOOM_GENTLE.SIZE
        gentleBloom.Threshold = VISION_CONFIG.POSTPROCESS_ART.BLOOM_GENTLE.THRESHOLD
        gentleBloom.Parent = Lt
        return gentleBloom
    end)
    
    if success then
        enhancements.Bloom = bloom
    end
    
    local success2, color = pcall(function()
        local harmony = Instance.new("ColorCorrectionEffect")
        harmony.Name = "SWILL_ColorHarmony"
        harmony.Brightness = VISION_CONFIG.POSTPROCESS_ART.COLOR_HARMONY.BRIGHTNESS
        harmony.Contrast = VISION_CONFIG.POSTPROCESS_ART.COLOR_HARMONY.CONTRAST
        harmony.Saturation = VISION_CONFIG.POSTPROCESS_ART.COLOR_HARMONY.SATURATION
        harmony.TintColor = Color3.fromRGB(255, 250, 245)
        harmony.Parent = Lt
        return harmony
    end)
    
    if success2 then
        enhancements.ColorCorrection = color
    end
    
    local success3, dof = pcall(function()
        local depth = Instance.new("DepthOfFieldEffect")
        depth.Name = "SWILL_VisionDepth"
        depth.FarIntensity = 0.15
        depth.FocusDistance = 25
        depth.InFocusRadius = 30
        depth.NearIntensity = 0.3
        depth.Parent = Lt
        return depth
    end)
    
    if success3 and dof then
        enhancements.DepthOfField = dof
    end
    
    self.Components.Enhancements = enhancements
end

function MapBlur:StartVisualSymphony()
    self.Connections.VisualMaster = RS.RenderStepped:Connect(function(delta)
        self:UpdateVisualMasterpiece(delta)
    end)
end

function MapBlur:UpdateVisualMasterpiece(delta)
    if not self.Active then return end
    
    self.VisualTime = self.VisualTime + delta * VISION_CONFIG.VISUAL_MAGIC.ANIMATION_GRACE
    
    local time = self.VisualTime
    local waveA = math.sin(time * 0.2)
    local waveB = math.cos(time * 0.3)
    local waveC = math.sin(time * 0.5)
    
    local ambientBlend = (waveA + 1) / 2
    Lt.Ambient = Color3.fromRGB(
        20 + ambientBlend * 10,
        25 + ambientBlend * 8,
        35 + ambientBlend * 5
    )
    
    Lt.Brightness = 0.45 + waveB * 0.02
    Lt.ShadowSoftness = 0.4 + waveC * 0.08
    
    local enhancements = self.Components.Enhancements or {}
    
    if enhancements.Bloom then
        local bloomWave = (math.sin(time * 0.7) + 1) / 2
        enhancements.Bloom.Intensity = 0.4 + bloomWave * 0.1
        enhancements.Bloom.Size = 22 + waveB * 6
    end
    
    if enhancements.ColorCorrection then
        local tintWave = 0.98 + math.sin(time * 0.4) * 0.02
        enhancements.ColorCorrection.TintColor = Color3.fromRGB(
            255 * tintWave,
            250 * tintWave,
            245 * tintWave
        )
        
        enhancements.ColorCorrection.Saturation = 0.65 + waveA * 0.08
        enhancements.ColorCorrection.Contrast = 0.2 + waveC * 0.05
    end
    
    if enhancements.DepthOfField then
        enhancements.DepthOfField.FocusDistance = 24 + waveB * 8
        enhancements.DepthOfField.FarIntensity = 0.12 + waveA * 0.06
    end
end

function MapBlur:StopVision()
    if not self.Active then return end
    
    self.Active = false
    
    task.wait(0.5)
    self:CleanVision()
    self:RestoreOriginalSettings()
end

-- Initialize
MapBlur:SaveOriginalSettings()
getgenv().SWILL_Vision = MapBlur

-- ==================== CHINA HAT ФУНКЦИИ (ТОЛЬКО НА СЕБЯ) ====================

local function CreateChinaHat(character)
    if S.ChinaHat.Hat then
        S.ChinaHat.Hat:Destroy()
        S.ChinaHat.Hat = nil
    end

    local head = character:FindFirstChild("Head")
    if not head then return end

    local cone = Instance.new("Part")
    cone.Size = Vector3.new(1, 1, 1)
    cone.BrickColor = BrickColor.new("White")
    cone.Transparency = 0.3
    cone.Anchored = false
    cone.CanCollide = false

    local mesh = Instance.new("SpecialMesh", cone)
    mesh.MeshType = Enum.MeshType.FileMesh
    mesh.MeshId = "rbxassetid://1033714"
    mesh.Scale = Vector3.new(1.7, 1.1, 1.7)

    local weld = Instance.new("Weld")
    weld.Part0 = head
    weld.Part1 = cone
    weld.C0 = CFrame.new(0, 0.9, 0)

    cone.Parent = character
    weld.Parent = cone

    local highlight = Instance.new("Highlight", cone)
    highlight.FillColor = S.ChinaHat.Color
    highlight.FillTransparency = 0.5
    highlight.OutlineColor = S.ChinaHat.Color
    highlight.OutlineTransparency = 0

    S.ChinaHat.Hat = cone
end

local function UpdateChinaHat()
    if not S.ChinaHat.Enabled then
        if S.ChinaHat.Hat then
            S.ChinaHat.Hat:Destroy()
            S.ChinaHat.Hat = nil
        end
        return
    end

    local character = LP.Character
    if character and character:FindFirstChild("Head") and character:FindFirstChild("Humanoid") then
        local humanoid = character.Humanoid
        if humanoid.Health > 0 then
            if not S.ChinaHat.Hat then
                CreateChinaHat(character)
            else
                local highlight = S.ChinaHat.Hat:FindFirstChildOfClass("Highlight")
                if highlight then
                    highlight.FillColor = S.ChinaHat.Color
                    highlight.OutlineColor = S.ChinaHat.Color
                end
            end
        elseif S.ChinaHat.Hat then
            S.ChinaHat.Hat:Destroy()
            S.ChinaHat.Hat = nil
        end
    elseif S.ChinaHat.Hat then
        S.ChinaHat.Hat:Destroy()
        S.ChinaHat.Hat = nil
    end
end

local function setupChinaHat()
    if S.ChinaHat.Connection then
        S.ChinaHat.Connection:Disconnect()
    end
    
    S.ChinaHat.Connection = RS.Heartbeat:Connect(function()
        UpdateChinaHat()
    end)
    
    if LP.Character then
        CreateChinaHat(LP.Character)
    end
end

local function toggleChinaHat(state)
    S.ChinaHat.Enabled = state
    
    if state then
        setupChinaHat()
        Lib:Notify("China Hat enabled", 2)
    else
        if S.ChinaHat.Connection then
            S.ChinaHat.Connection:Disconnect()
            S.ChinaHat.Connection = nil
        end
        
        if S.ChinaHat.Hat then
            S.ChinaHat.Hat:Destroy()
            S.ChinaHat.Hat = nil
        end
        
        Lib:Notify("China Hat disabled", 2)
    end
end

-- ==================== PLAYER CHAMS ФУНКЦИИ ====================

local function CreateAdornments(part)
    local Adornments = {}
    for vis = 1, 2 do
        if part.Name == "Head" then
            Adornments[vis] = Instance.new("CylinderHandleAdornment")
            Adornments[vis].Height = 1.2
            Adornments[vis].Radius = 0.78
            Adornments[vis].CFrame = CFrame.new(Vector3.new(), Vector3.new(0, 1, 0))
            if vis == 1 then
                Adornments[vis].Radius = Adornments[vis].Radius - 0.15
                Adornments[vis].Height = Adornments[vis].Height - 0.15
            end
        else
            Adornments[vis] = Instance.new("BoxHandleAdornment")
            Adornments[vis].Size = part.Size + Vector3.new(0.2, 0.2, 0.2)
            if vis == 1 then
                Adornments[vis].Size = Adornments[vis].Size - Vector3.new(0.15, 0.15, 0.15)
            end
        end
        Adornments[vis].Parent = game:GetService("CoreGui")
        Adornments[vis].Adornee = part
        Adornments[vis].Name = vis == 1 and "Occluded" or "Visible"
        Adornments[vis].ZIndex = vis == 1 and 2 or 1
        Adornments[vis].AlwaysOnTop = vis == 1
    end
    return Adornments
end

local function UpdatePlayerChams()
    if not S.PlayerChams.Enabled then
        for _, playerData in pairs(S.PlayerChams.Adornments) do
            for _, adornmentsTable in pairs(playerData) do
                for _, adornment in pairs(adornmentsTable) do
                    adornment.Visible = false
                end
            end
        end
        return
    end

    local localRoot = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if not localRoot then return end

    for _, player in pairs(Plrs:GetPlayers()) do
        if player == LP then continue end

        if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
            if S.PlayerChams.Adornments[player] then
                for _, adornmentsTable in pairs(S.PlayerChams.Adornments[player]) do
                    for _, adornment in pairs(adornmentsTable) do
                        adornment.Visible = false
                    end
                end
            end
            continue
        end

        local distance = (player.Character.HumanoidRootPart.Position - localRoot.Position).Magnitude
        if distance > S.ESPDistance.Value then
            if S.PlayerChams.Adornments[player] then
                for _, adornmentsTable in pairs(S.PlayerChams.Adornments[player]) do
                    for _, adornment in pairs(adornmentsTable) do
                        adornment.Visible = false
                    end
                end
            end
            continue
        end

        if not S.PlayerChams.Adornments[player] then
            S.PlayerChams.Adornments[player] = {}
        end

        for _, part in pairs(player.Character:GetChildren()) do
            if part:IsA("BasePart") and table.find({"Head", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg"}, part.Name) then
                if not S.PlayerChams.Adornments[player][part] then
                    S.PlayerChams.Adornments[player][part] = CreateAdornments(part)
                end
                
                S.PlayerChams.Adornments[player][part][1].Visible = true
                S.PlayerChams.Adornments[player][part][1].Color3 = S.PlayerChams.OccludedColor
                S.PlayerChams.Adornments[player][part][1].Transparency = 0
                
                S.PlayerChams.Adornments[player][part][2].Visible = true
                S.PlayerChams.Adornments[player][part][2].Color3 = S.PlayerChams.VisibleColor
                S.PlayerChams.Adornments[player][part][2].Transparency = 0.5
                S.PlayerChams.Adornments[player][part][2].AlwaysOnTop = false
                S.PlayerChams.Adornments[player][part][2].ZIndex = 1
            end
        end
    end
end

local function setupPlayerChams()
    if S.PlayerChams.Connection then
        S.PlayerChams.Connection:Disconnect()
    end
    
    S.PlayerChams.Connection = RS.Heartbeat:Connect(function()
        UpdatePlayerChams()
    end)
end

local function togglePlayerChams(state)
    S.PlayerChams.Enabled = state
    
    if state then
        setupPlayerChams()
        Lib:Notify("Player Chams enabled", 2)
    else
        if S.PlayerChams.Connection then
            S.PlayerChams.Connection:Disconnect()
            S.PlayerChams.Connection = nil
        end
        
        for _, playerData in pairs(S.PlayerChams.Adornments) do
            for _, adornmentsTable in pairs(playerData) do
                for _, adornment in pairs(adornmentsTable) do
                    adornment:Destroy()
                end
            end
        end
        S.PlayerChams.Adornments = {}
        
        Lib:Notify("Player Chams disabled", 2)
    end
end

-- ==================== AIMBOT ФУНКЦИИ ====================

local function CreateFOVCircle()
    if S.AimBot.FOVCircle then
        S.AimBot.FOVCircle:Remove()
        S.AimBot.FOVCircle = nil
    end
    
    if S.AimBot.ShowFOV and Drawing then
        S.AimBot.FOVCircle = Drawing.new("Circle")
        S.AimBot.FOVCircle.Color = S.AimBot.FOVColor
        S.AimBot.FOVCircle.Filled = false
        S.AimBot.FOVCircle.Thickness = 2
        S.AimBot.FOVCircle.Radius = S.AimBot.FOV
        S.AimBot.FOVCircle.Visible = S.AimBot.Enabled and S.AimBot.ShowFOV
        S.AimBot.FOVCircle.Transparency = S.AimBot.FOVTransparency
        S.AimBot.FOVCircle.Position = S.AimBot.FOVPosition
    end
end

local function UpdateFOVCircle()
    if S.AimBot.FOVCircle and S.AimBot.ShowFOV then
        S.AimBot.FOVCircle.Position = Vector2.new(Cam.ViewportSize.X/2, Cam.ViewportSize.Y/2)
        S.AimBot.FOVCircle.Radius = S.AimBot.FOV
        S.AimBot.FOVCircle.Visible = S.AimBot.Enabled and S.AimBot.ShowFOV
        S.AimBot.FOVCircle.Color = S.AimBot.FOVColor
    end
end

local function GetClosestPlayer()
    if not S.AimBot.Enabled then return nil end

    local closestPlayer = nil
    local shortestDistance = S.AimBot.FOV
    local centerPosition = Vector2.new(Cam.ViewportSize.X/2, Cam.ViewportSize.Y/2)
    
    -- Проходим по всем игрокам и ищем ближайшего в FOV
    for _, player in ipairs(Plrs:GetPlayers()) do
        if player ~= LP and player.Character then
            local character = player.Character
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            local head = character:FindFirstChild("Head")

            -- Проверка на живость
            if S.AimBot.DownedCheck and humanoid then
                if humanoid.Health <= 0 or humanoid:GetState() == Enum.HumanoidStateType.Dead then
                    continue
                end
            end

            if humanoidRootPart and head then
                -- Wall Check
                if S.AimBot.WallCheck then
                    local ray = Ray.new(
                        Cam.CFrame.Position,
                        (head.Position - Cam.CFrame.Position).Unit * 1000
                    )
                    local hit, position = Ws:FindPartOnRayWithIgnoreList(
                        ray,
                        {LP.Character, Cam}
                    )

                    if hit and not hit:IsDescendantOf(character) then
                        continue
                    end
                end

                local targetPart = character:FindFirstChild(S.AimBot.TargetPart)
                if not targetPart then
                    targetPart = humanoidRootPart
                end

                local screenPoint, onScreen = Cam:WorldToViewportPoint(targetPart.Position)

                if onScreen then
                    local screenPosition = Vector2.new(screenPoint.X, screenPoint.Y)
                    local distance = (centerPosition - screenPosition).Magnitude

                    if distance < shortestDistance then
                        shortestDistance = distance
                        closestPlayer = player
                    end
                end
            end
        end
    end
    
    return closestPlayer
end

local function GetTargetPosition(character)
    if not character then return nil end
    
    local targetPart = character:FindFirstChild(S.AimBot.TargetPart)
    if not targetPart then
        targetPart = character:FindFirstChild("HumanoidRootPart")
        if not targetPart then
            targetPart = character:FindFirstChild("Head")
        end
    end
    
    if not targetPart then return nil end
    
    local position = targetPart.Position
    
    if S.AimBot.Prediction > 0 then
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            local velocity = humanoidRootPart.Velocity
            local predictionMultiplier = S.AimBot.Prediction / 100
            position = position + (velocity * predictionMultiplier * 0.1)
        end
    end
    
    return position
end

local function SmoothAim(targetPosition)
    if not targetPosition then return end
    
    local currentCFrame = Cam.CFrame
    local targetCFrame = CFrame.lookAt(
        currentCFrame.Position,
        targetPosition
    )
    
    local smoothCFrame = currentCFrame:Lerp(
        targetCFrame,
        S.AimBot.Smoothness
    )
    
    Cam.CFrame = smoothCFrame
end

local function AimLoop()
    if not S.AimBot.Enabled then return end
    
    local currentTarget = nil
    
    -- Если Sticky Aim включен, используем сохраненную цель
    if S.AimBot.Sticky then
        currentTarget = S.AimBot.Target
        -- Проверяем, валидна ли сохраненная цель
        if currentTarget then
            local character = currentTarget.Character
            if not character then
                currentTarget = nil
                S.AimBot.Target = nil
            else
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if not humanoid or humanoid.Health <= 0 or (S.AimBot.DownedCheck and humanoid:GetState() == Enum.HumanoidStateType.Dead) then
                    currentTarget = nil
                    S.AimBot.Target = nil
                end
            end
        end
        
        -- Если нет валидной сохраненной цели, ищем новую
        if not currentTarget then
            currentTarget = GetClosestPlayer()
            S.AimBot.Target = currentTarget
        end
    else
        -- Если Sticky Aim выключен, всегда ищем новую цель и НЕ сохраняем её
        currentTarget = GetClosestPlayer()
        -- Важно: НЕ сохраняем в S.AimBot.Target!
    end
    
    -- Если есть цель, наводимся на неё
    if currentTarget and currentTarget.Character then
        local targetPosition = GetTargetPosition(currentTarget.Character)
        if targetPosition then
            SmoothAim(targetPosition)
        end
    end
end

local function toggleAimBot(state)
    S.AimBot.Enabled = state
    
    if state then
        CreateFOVCircle()
        
        if S.AimBot.FOVUpdateConnection then
            S.AimBot.FOVUpdateConnection:Disconnect()
        end
        
        S.AimBot.FOVUpdateConnection = RS.RenderStepped:Connect(UpdateFOVCircle)
        
        if not S.AimBot.Connection then
    -- Переменная для хранения соединения рендера
    local renderConnection = nil
    
    S.AimBot.Connection = UIS.InputBegan:Connect(function(input)
        if input.UserInputType == S.AimBot.AimKey then
            -- При нажатии клавиши, если Sticky включен, находим цель и сохраняем
            if S.AimBot.Sticky then
                S.AimBot.Target = GetClosestPlayer()
            end
            
            -- Запускаем рендер луп, если еще не запущен
            if not renderConnection then
                renderConnection = RS.RenderStepped:Connect(function()
                    if not S.AimBot.Enabled then
                        if renderConnection then
                            renderConnection:Disconnect()
                            renderConnection = nil
                        end
                        return
                    end
                    AimLoop()
                end)
            end
        end
    end)
    
    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == S.AimBot.AimKey then
            -- При отпускании клавиши сбрасываем цель
            S.AimBot.Target = nil
            
            -- Останавливаем рендер луп
            if renderConnection then
                renderConnection:Disconnect()
                renderConnection = nil
            end
        end
    end)
end
        
        Lib:Notify("Aimbot enabled", 2)
    else
        if S.AimBot.FOVCircle then
            S.AimBot.FOVCircle:Remove()
            S.AimBot.FOVCircle = nil
        end
        
        if S.AimBot.FOVUpdateConnection then
            S.AimBot.FOVUpdateConnection:Disconnect()
            S.AimBot.FOVUpdateConnection = nil
        end
        
        if S.AimBot.Connection then
            S.AimBot.Connection:Disconnect()
            S.AimBot.Connection = nil
        end
        
        S.AimBot.Target = nil
        Lib:Notify("Aimbot disabled", 2)
    end
end

local function cleanupAimBot()
    if S.AimBot.Enabled then
        toggleAimBot(false)
    end
    
    if S.AimBot.FOVCircle then
        S.AimBot.FOVCircle:Remove()
        S.AimBot.FOVCircle = nil
    end
    
    if S.AimBot.FOVUpdateConnection then
        S.AimBot.FOVUpdateConnection:Disconnect()
        S.AimBot.FOVUpdateConnection = nil
    end
    
    if S.AimBot.Connection then
        S.AimBot.Connection:Disconnect()
        S.AimBot.Connection = nil
    end
    
    S.AimBot.Target = nil
end

-- ==================== BLUR ФУНКЦИИ ====================

local function setupBlur()
    if not S.Blur.BlurEffect then
        S.Blur.BlurEffect = Instance.new("BlurEffect", Lt)
        S.Blur.BlurEffect.Size = 0
    end
    
    if S.Blur.Connection then
        S.Blur.Connection:Disconnect()
        S.Blur.Connection = nil
    end
    
    S.Blur.Connection = RS.RenderStepped:Connect(function()
        if not S.Blur.Enabled or not S.Blur.BlurEffect then return end
        
        S.Blur.CurrentLookVector = Cam.CFrame.LookVector
        S.Blur.RotationSpeed = (S.Blur.CurrentLookVector - (S.Blur.LastLookVector or S.Blur.CurrentLookVector)).Magnitude * 130
        S.Blur.BlurEffect.Size = math.clamp(S.Blur.RotationSpeed, 0, 20)
        S.Blur.LastLookVector = S.Blur.CurrentLookVector
    end)
end

local function disableBlur()
    if S.Blur.Connection then
        S.Blur.Connection:Disconnect()
        S.Blur.Connection = nil
    end
    
    if S.Blur.BlurEffect then
        S.Blur.BlurEffect.Size = 0
        S.Blur.BlurEffect:Destroy()
        S.Blur.BlurEffect = nil
    end
end

local function toggleBlur(state)
    S.Blur.Enabled = state
    
    if state then
        setupBlur()
        Lib:Notify("Blur enabled", 2)
    else
        disableBlur()
        Lib:Notify("Blur disabled", 2)
    end
end

-- ==================== FREECAM ФУНКЦИИ ====================

local function setupFreecam()
    local function handleInput(input, gameProcessed)
        if gameProcessed then return end
        
        if S.Freecam.Enabled then
            if input.UserInputType == Enum.UserInputType.Keyboard then
                if input.UserInputState == Enum.UserInputState.Begin then
                    S.Freecam.KeysDown[input.KeyCode] = true
                elseif input.UserInputState == Enum.UserInputState.End then
                    S.Freecam.KeysDown[input.KeyCode] = nil
                end
            elseif input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton2 then
                if input.UserInputState == Enum.UserInputState.Begin then
                    S.Freecam.Rotating = true
                elseif input.UserInputState == Enum.UserInputState.End then
                    S.Freecam.Rotating = false
                end
            end
        end
    end

    UIS.InputBegan:Connect(handleInput)
    UIS.InputEnded:Connect(handleInput)

    if S.Freecam.OnMobile then
        UIS.TouchMoved:Connect(function(touchPos, gameProcessed)
            if gameProcessed or not S.Freecam.Enabled or not S.Freecam.Rotating then return end
            local delta = touchPos.Delta
            Cam.CFrame = Cam.CFrame * CFrame.Angles(0, -delta.X * 0.005, 0) * CFrame.Angles(-delta.Y * 0.005, 0, 0)
        end)
    else
        UIS.InputChanged:Connect(function(input, gameProcessed)
            if gameProcessed or not S.Freecam.Enabled or not S.Freecam.Rotating then return end
            if input.UserInputType == Enum.UserInputType.MouseMovement then
                local delta = input.Delta
                Cam.CFrame = Cam.CFrame * CFrame.Angles(0, -delta.X * 0.005, 0) * CFrame.Angles(-delta.Y * 0.005, 0, 0)
            end
        end)
    end

    S.Freecam.Connection = RS.RenderStepped:Connect(function()
        if not S.Freecam.Enabled or not LP.Character or not LP.Character:FindFirstChild("Humanoid") or LP.Character.Humanoid.Health <= 0 then 
            if S.Freecam.Enabled then
                S.Freecam.Enabled = false
                if Toggles and Toggles.FreecamToggle then
                    Toggles.FreecamToggle:SetValue(false)
                end
                Cam.CameraType = Enum.CameraType.Custom
                if LP.Character then
                    local hrp = LP.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        hrp.Anchored = false
                    end
                end
            end
            return
        end
        
        local moveVector = Vector3.new(0, 0, 0)
        
        if S.Freecam.KeysDown[Enum.KeyCode.W] then
            moveVector = moveVector + Cam.CFrame.LookVector
        end
        if S.Freecam.KeysDown[Enum.KeyCode.S] then
            moveVector = moveVector - Cam.CFrame.LookVector
        end
        if S.Freecam.KeysDown[Enum.KeyCode.A] then
            moveVector = moveVector - Cam.CFrame.RightVector
        end
        if S.Freecam.KeysDown[Enum.KeyCode.D] then
            moveVector = moveVector + Cam.CFrame.RightVector
        end
        if S.Freecam.KeysDown[Enum.KeyCode.E] or S.Freecam.KeysDown[Enum.KeyCode.Space] then
            moveVector = moveVector + Vector3.new(0, 1, 0)
        end
        if S.Freecam.KeysDown[Enum.KeyCode.Q] or S.Freecam.KeysDown[Enum.KeyCode.LeftShift] then
            moveVector = moveVector + Vector3.new(0, -1, 0)
        end
        
        if moveVector.Magnitude > 0 then
            moveVector = moveVector.Unit * S.Freecam.Speed
            Cam.CFrame = Cam.CFrame + moveVector * RS.RenderStepped:Wait()
        end
    end)
end

local function disableFreecam()
    if S.Freecam.Connection then
        S.Freecam.Connection:Disconnect()
        S.Freecam.Connection = nil
    end
    
    Cam.CameraType = Enum.CameraType.Custom
    if LP.Character then
        local hrp = LP.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.Anchored = false
        end
    end
    
    S.Freecam.KeysDown = {}
    S.Freecam.Rotating = false
end

local function toggleFreecam(state)
    S.Freecam.Enabled = state
    
    if state then
        setupFreecam()
        Cam.CameraType = Enum.CameraType.Scriptable
        if LP.Character then
            local hrp = LP.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.Anchored = true
            end
        end
        Lib:Notify("Freecam enabled", 2)
    else
        disableFreecam()
        Lib:Notify("Freecam disabled", 2)
    end
end

local function setFreecamSpeed(speed)
    S.Freecam.Speed = speed
    Lib:Notify("Freecam Speed: " .. speed, 2)
end

-- ==================== NO RECOIL FUNCTIONS ====================

local function cacheWeapons_NR()
    S.NoRecoil.WeaponCache = {}
    for _, v in pairs(getgc(true)) do
        if type(v) == 'table' and rawget(v, 'EquipTime') then
            table.insert(S.NoRecoil.WeaponCache, v)
            if not S.NoRecoil.OriginalValues[v] then
                S.NoRecoil.OriginalValues[v] = {
                    Recoil = v.Recoil,
                    CameraRecoilingEnabled = v.CameraRecoilingEnabled,
                    AngleX_Min = v.AngleX_Min,
                    AngleX_Max = v.AngleX_Max,
                    AngleY_Min = v.AngleY_Min,
                    AngleY_Max = v.AngleY_Max,
                    AngleZ_Min = v.AngleZ_Min,
                    AngleZ_Max = v.AngleZ_Max,
                    Spread = v.Spread
                }
            end
        end
    end
end

local function applyGunMods_NR()
    for _, weapon in ipairs(S.NoRecoil.WeaponCache) do
        if S.NoRecoil.Settings.GunMods.NoRecoil then
            weapon.Recoil = 0
            weapon.CameraRecoilingEnabled = false
            weapon.AngleX_Min = 0
            weapon.AngleX_Max = 0
            weapon.AngleY_Min = 0
            weapon.AngleY_Max = 0
            weapon.AngleZ_Min = 0
            weapon.AngleZ_Max = 0
        end
        if S.NoRecoil.Settings.GunMods.Spread then
            weapon.Spread = S.NoRecoil.Settings.GunMods.SpreadAmount
        end
    end
end

local function resetGunMods_NR()
    for weapon, values in pairs(S.NoRecoil.OriginalValues) do
        if weapon then
            pcall(function()
                weapon.Recoil = values.Recoil
                weapon.CameraRecoilingEnabled = values.CameraRecoilingEnabled
                weapon.AngleX_Min = values.AngleX_Min
                weapon.AngleX_Max = values.AngleX_Max
                weapon.AngleY_Min = values.AngleY_Min
                weapon.AngleY_Max = values.AngleY_Max
                weapon.AngleZ_Min = values.AngleZ_Min
                weapon.AngleZ_Max = values.AngleZ_Max
                weapon.Spread = values.Spread
            end)
        end
    end
end

local function handleWeapon_NR(weapon)
    if S.NoRecoil.Enabled then
        task.wait(0.1)
        cacheWeapons_NR()
        applyGunMods_NR()
    end
end

local function onCharacterAdded_NR(character)
    for _, child in ipairs(character:GetChildren()) do
        if child:IsA("Tool") then
            handleWeapon_NR(child)
        end
    end
    
    local childConn = character.ChildAdded:Connect(function(child)
        if child:IsA("Tool") then
            handleWeapon_NR(child)
        end
    end)
    table.insert(S.NoRecoil.Connections, childConn)
    
    local humanoid = character:WaitForChild("Humanoid", 2)
    if humanoid then
        local diedConn = humanoid.Died:Connect(function()
            if S.NoRecoil.Enabled then
                task.wait(1.5)
                cacheWeapons_NR()
                applyGunMods_NR()
            end
        end)
        table.insert(S.NoRecoil.Connections, diedConn)
    end
end

local function enableNoRecoil()
    if S.NoRecoil.Enabled then return end
    S.NoRecoil.Enabled = true
    S.NoRecoil.WeaponCache = {}
    S.NoRecoil.OriginalValues = {}
    
    cacheWeapons_NR()
    applyGunMods_NR()
    
    local charConn = LP.CharacterAdded:Connect(onCharacterAdded_NR)
    table.insert(S.NoRecoil.Connections, charConn)
    
    if LP.Character then
        onCharacterAdded_NR(LP.Character)
    end
    
    Lib:Notify("No Recoil enabled", 2)
end

local function disableNoRecoil()
    if not S.NoRecoil.Enabled then return end
    S.NoRecoil.Enabled = false
    
    resetGunMods_NR()
    
    for _, conn in ipairs(S.NoRecoil.Connections) do
        conn:Disconnect()
    end
    S.NoRecoil.Connections = {}
    
    Lib:Notify("No Recoil disabled", 2)
end

local function toggleNoRecoil(state)
    if state then
        enableNoRecoil()
    else
        disableNoRecoil()
    end
end

-- ==================== WORLD EFFECTS SYSTEM ====================

local WorldEffects = {
    Enabled = false,
    CurrentEffect = "None",
    OriginalSettings = {},
    Connections = {},
    Effects = {}
}

function WorldEffects:SaveOriginal()
    if next(self.OriginalSettings) ~= nil then return end
    
    self.OriginalSettings = {
        Brightness = Lt.Brightness,
        ClockTime = Lt.ClockTime,
        Ambient = Lt.Ambient,
        OutdoorAmbient = Lt.OutdoorAmbient,
        ColorShift_Top = Lt.ColorShift_Top,
        ColorShift_Bottom = Lt.ColorShift_Bottom,
        FogColor = Lt.FogColor,
        FogStart = Lt.FogStart,
        FogEnd = Lt.FogEnd,
        ExposureCompensation = Lt.ExposureCompensation,
        GlobalShadows = Lt.GlobalShadows,
        ShadowSoftness = Lt.ShadowSoftness,
        EnvironmentDiffuseScale = Lt.EnvironmentDiffuseScale,
        EnvironmentSpecularScale = Lt.EnvironmentSpecularScale,
        PostEffects = {}
    }
    
    for _, effect in pairs(Lt:GetChildren()) do
        if effect:IsA("PostEffect") then
            self.OriginalSettings.PostEffects[effect.Name] = {
                Object = effect:Clone(),
                Parent = effect.Parent
            }
        end
    end
end

function WorldEffects:RestoreOriginal()
    for property, value in pairs(self.OriginalSettings) do
        if property ~= "PostEffects" and Lt[property] ~= nil then
            pcall(function()
                Lt[property] = value
            end)
        end
    end
    
    for _, effect in pairs(Lt:GetChildren()) do
        if effect:IsA("PostEffect") and not self.OriginalSettings.PostEffects[effect.Name] then
            pcall(function() effect:Destroy() end)
        end
    end
    
    if self.OriginalSettings.PostEffects then
        for name, effectData in pairs(self.OriginalSettings.PostEffects) do
            local existing = Lt:FindFirstChild(name)
            if not existing then
                pcall(function()
                    local effect = effectData.Object:Clone()
                    effect.Name = name
                    effect.Parent = Lt
                end)
            end
        end
    end
end

function WorldEffects:ClearEffects()
    for _, conn in pairs(self.Connections) do
        if conn then pcall(function() conn:Disconnect() end) end
    end
    self.Connections = {}
    
    for _, effect in pairs(Lt:GetChildren()) do
        if effect:IsA("PostEffect") and effect.Name:find("WE_") then
            pcall(function() effect:Destroy() end)
        end
    end
end

function WorldEffects:ApplyEffect(effectName)
    self:ClearEffects()
    
    if effectName == "None" then
        self:RestoreOriginal()
        return
    end
    
    local effect = self.Effects[effectName]
    if not effect then return end
    
    effect.Apply()
end

WorldEffects.Effects["Sunset Paradise"] = {
    Apply = function()
        Lt.ClockTime = 17.5
        Lt.Brightness = 2.8
        Lt.Ambient = Color3.fromRGB(255, 140, 100)
        Lt.OutdoorAmbient = Color3.fromRGB(255, 180, 120)
        Lt.ColorShift_Top = Color3.fromRGB(255, 200, 150)
        Lt.ColorShift_Bottom = Color3.fromRGB(255, 120, 80)
        Lt.FogColor = Color3.fromRGB(255, 160, 100)
        Lt.FogStart = 100
        Lt.FogEnd = 8000
        Lt.ExposureCompensation = 0.3
        
        local bloom = Instance.new("BloomEffect")
        bloom.Name = "WE_Bloom"
        bloom.Intensity = 0.8
        bloom.Size = 32
        bloom.Threshold = 0.6
        bloom.Parent = Lt
        
        local cc = Instance.new("ColorCorrectionEffect")
        cc.Name = "WE_ColorCorrection"
        cc.Brightness = 0.1
        cc.Contrast = 0.15
        cc.Saturation = 0.3
        cc.TintColor = Color3.fromRGB(255, 240, 220)
        cc.Parent = Lt
    end
}

WorldEffects.Effects["Neon City"] = {
    Apply = function()
        Lt.ClockTime = 0
        Lt.Brightness = 1.5
        Lt.Ambient = Color3.fromRGB(80, 40, 120)
        Lt.OutdoorAmbient = Color3.fromRGB(120, 60, 180)
        Lt.ColorShift_Top = Color3.fromRGB(180, 100, 255)
        Lt.ColorShift_Bottom = Color3.fromRGB(100, 50, 150)
        Lt.FogColor = Color3.fromRGB(140, 80, 200)
        Lt.FogStart = 50
        Lt.FogEnd = 5000
        Lt.ExposureCompensation = 0.2
        
        local bloom = Instance.new("BloomEffect")
        bloom.Name = "WE_Bloom"
        bloom.Intensity = 1.2
        bloom.Size = 40
        bloom.Threshold = 0.4
        bloom.Parent = Lt
        
        local cc = Instance.new("ColorCorrectionEffect")
        cc.Name = "WE_ColorCorrection"
        cc.Brightness = 0
        cc.Contrast = 0.3
        cc.Saturation = 0.5
        cc.TintColor = Color3.fromRGB(200, 180, 255)
        cc.Parent = Lt
        
        local time = 0
        table.insert(WorldEffects.Connections, RS.Heartbeat:Connect(function(dt)
            time = time + dt
            local wave = math.sin(time * 2) * 0.5 + 0.5
            Lt.ColorShift_Top = Color3.fromRGB(
                180 + wave * 75,
                100 + wave * 100,
                255
            )
        end))
    end
}

WorldEffects.Effects["Arctic Frost"] = {
    Apply = function()
        Lt.ClockTime = 12
        Lt.Brightness = 3.5
        Lt.Ambient = Color3.fromRGB(200, 220, 255)
        Lt.OutdoorAmbient = Color3.fromRGB(220, 240, 255)
        Lt.ColorShift_Top = Color3.fromRGB(240, 250, 255)
        Lt.ColorShift_Bottom = Color3.fromRGB(180, 200, 230)
        Lt.FogColor = Color3.fromRGB(220, 235, 255)
        Lt.FogStart = 0
        Lt.FogEnd = 6000
        Lt.ExposureCompensation = 0.4
        
        local bloom = Instance.new("BloomEffect")
        bloom.Name = "WE_Bloom"
        bloom.Intensity = 0.6
        bloom.Size = 28
        bloom.Threshold = 0.8
        bloom.Parent = Lt
        
        local cc = Instance.new("ColorCorrectionEffect")
        cc.Name = "WE_ColorCorrection"
        cc.Brightness = 0.15
        cc.Contrast = 0.1
        cc.Saturation = -0.1
        cc.TintColor = Color3.fromRGB(230, 240, 255)
        cc.Parent = Lt
    end
}

WorldEffects.Effects["Toxic Wasteland"] = {
    Apply = function()
        Lt.ClockTime = 14
        Lt.Brightness = 2
        Lt.Ambient = Color3.fromRGB(100, 120, 40)
        Lt.OutdoorAmbient = Color3.fromRGB(140, 180, 60)
        Lt.ColorShift_Top = Color3.fromRGB(180, 220, 80)
        Lt.ColorShift_Bottom = Color3.fromRGB(100, 140, 40)
        Lt.FogColor = Color3.fromRGB(150, 200, 70)
        Lt.FogStart = 20
        Lt.FogEnd = 4000
        Lt.ExposureCompensation = 0.1
        
        local bloom = Instance.new("BloomEffect")
        bloom.Name = "WE_Bloom"
        bloom.Intensity = 0.9
        bloom.Size = 35
        bloom.Threshold = 0.5
        bloom.Parent = Lt
        
        local cc = Instance.new("ColorCorrectionEffect")
        cc.Name = "WE_ColorCorrection"
        cc.Brightness = -0.05
        cc.Contrast = 0.25
        cc.Saturation = 0.4
        cc.TintColor = Color3.fromRGB(200, 255, 150)
        cc.Parent = Lt
    end
}

WorldEffects.Effects["Blood Moon"] = {
    Apply = function()
        Lt.ClockTime = 0
        Lt.Brightness = 1.2
        Lt.Ambient = Color3.fromRGB(120, 20, 20)
        Lt.OutdoorAmbient = Color3.fromRGB(180, 30, 30)
        Lt.ColorShift_Top = Color3.fromRGB(255, 50, 50)
        Lt.ColorShift_Bottom = Color3.fromRGB(150, 20, 20)
        Lt.FogColor = Color3.fromRGB(200, 40, 40)
        Lt.FogStart = 30
        Lt.FogEnd = 5000
        Lt.ExposureCompensation = 0
        
        local bloom = Instance.new("BloomEffect")
        bloom.Name = "WE_Bloom"
        bloom.Intensity = 1
        bloom.Size = 38
        bloom.Threshold = 0.45
        bloom.Parent = Lt
        
        local cc = Instance.new("ColorCorrectionEffect")
        cc.Name = "WE_ColorCorrection"
        cc.Brightness = -0.1
        cc.Contrast = 0.35
        cc.Saturation = 0.3
        cc.TintColor = Color3.fromRGB(255, 200, 200)
        cc.Parent = Lt
        
        local time = 0
        table.insert(WorldEffects.Connections, RS.Heartbeat:Connect(function(dt)
            time = time + dt
            local pulse = math.sin(time * 3) * 0.3 + 0.7
            bloom.Intensity = pulse * 1.2
        end))
    end
}

WorldEffects.Effects["Deep Ocean"] = {
    Apply = function()
        Lt.ClockTime = 6
        Lt.Brightness = 1
        Lt.Ambient = Color3.fromRGB(20, 60, 100)
        Lt.OutdoorAmbient = Color3.fromRGB(30, 90, 150)
        Lt.ColorShift_Top = Color3.fromRGB(50, 120, 200)
        Lt.ColorShift_Bottom = Color3.fromRGB(20, 70, 120)
        Lt.FogColor = Color3.fromRGB(40, 100, 160)
        Lt.FogStart = 10
        Lt.FogEnd = 3000
        Lt.ExposureCompensation = -0.2
        
        local bloom = Instance.new("BloomEffect")
        bloom.Name = "WE_Bloom"
        bloom.Intensity = 0.5
        bloom.Size = 25
        bloom.Threshold = 0.7
        bloom.Parent = Lt
        
        local cc = Instance.new("ColorCorrectionEffect")
        cc.Name = "WE_ColorCorrection"
        cc.Brightness = -0.15
        cc.Contrast = 0.2
        cc.Saturation = 0.2
        cc.TintColor = Color3.fromRGB(180, 200, 255)
        cc.Parent = Lt
        
        local blur = Instance.new("BlurEffect")
        blur.Name = "WE_Blur"
        blur.Size = 3
        blur.Parent = Lt
    end
}

WorldEffects.Effects["Golden Hour"] = {
    Apply = function()
        Lt.ClockTime = 16
        Lt.Brightness = 3
        Lt.Ambient = Color3.fromRGB(255, 200, 120)
        Lt.OutdoorAmbient = Color3.fromRGB(255, 220, 150)
        Lt.ColorShift_Top = Color3.fromRGB(255, 240, 180)
        Lt.ColorShift_Bottom = Color3.fromRGB(255, 180, 100)
        Lt.FogColor = Color3.fromRGB(255, 210, 140)
        Lt.FogStart = 150
        Lt.FogEnd = 9000
        Lt.ExposureCompensation = 0.35
        
        local bloom = Instance.new("BloomEffect")
        bloom.Name = "WE_Bloom"
        bloom.Intensity = 0.7
        bloom.Size = 30
        bloom.Threshold = 0.65
        bloom.Parent = Lt
        
        local cc = Instance.new("ColorCorrectionEffect")
        cc.Name = "WE_ColorCorrection"
        cc.Brightness = 0.12
        cc.Contrast = 0.12
        cc.Saturation = 0.25
        cc.TintColor = Color3.fromRGB(255, 245, 220)
        cc.Parent = Lt
        
        local sr = Instance.new("SunRaysEffect")
        sr.Name = "WE_SunRays"
        sr.Intensity = 0.15
        sr.Spread = 0.5
        sr.Parent = Lt
    end
}

WorldEffects.Effects["Cyberpunk"] = {
    Apply = function()
        Lt.ClockTime = 22
        Lt.Brightness = 1.8
        Lt.Ambient = Color3.fromRGB(100, 40, 120)
        Lt.OutdoorAmbient = Color3.fromRGB(150, 60, 180)
        Lt.ColorShift_Top = Color3.fromRGB(255, 0, 200)
        Lt.ColorShift_Bottom = Color3.fromRGB(0, 200, 255)
        Lt.FogColor = Color3.fromRGB(180, 50, 200)
        Lt.FogStart = 40
        Lt.FogEnd = 4500
        Lt.ExposureCompensation = 0.15
        
        local bloom = Instance.new("BloomEffect")
        bloom.Name = "WE_Bloom"
        bloom.Intensity = 1.5
        bloom.Size = 45
        bloom.Threshold = 0.3
        bloom.Parent = Lt
        
        local cc = Instance.new("ColorCorrectionEffect")
        cc.Name = "WE_ColorCorrection"
        cc.Brightness = 0.05
        cc.Contrast = 0.4
        cc.Saturation = 0.6
        cc.TintColor = Color3.fromRGB(255, 150, 255)
        cc.Parent = Lt
        
        local time = 0
        table.insert(WorldEffects.Connections, RS.Heartbeat:Connect(function(dt)
            time = time + dt
            local wave1 = math.sin(time * 2.5) * 0.5 + 0.5
            local wave2 = math.cos(time * 3) * 0.5 + 0.5
            Lt.ColorShift_Top = Color3.fromRGB(
                255 * wave1,
                0,
                200 + 55 * wave2
            )
            Lt.ColorShift_Bottom = Color3.fromRGB(
                0,
                200 * wave2,
                255 * wave1
            )
        end))
    end
}

WorldEffects.Effects["Volcanic Ash"] = {
    Apply = function()
        Lt.ClockTime = 15
        Lt.Brightness = 1.5
        Lt.Ambient = Color3.fromRGB(120, 60, 40)
        Lt.OutdoorAmbient = Color3.fromRGB(160, 80, 50)
        Lt.ColorShift_Top = Color3.fromRGB(255, 120, 60)
        Lt.ColorShift_Bottom = Color3.fromRGB(180, 70, 30)
        Lt.FogColor = Color3.fromRGB(140, 80, 50)
        Lt.FogStart = 20
        Lt.FogEnd = 3500
        Lt.ExposureCompensation = 0
        
        local bloom = Instance.new("BloomEffect")
        bloom.Name = "WE_Bloom"
        bloom.Intensity = 0.85
        bloom.Size = 33
        bloom.Threshold = 0.55
        bloom.Parent = Lt
        
        local cc = Instance.new("ColorCorrectionEffect")
        cc.Name = "WE_ColorCorrection"
        cc.Brightness = -0.08
        cc.Contrast = 0.28
        cc.Saturation = 0.15
        cc.TintColor = Color3.fromRGB(255, 200, 180)
        cc.Parent = Lt
        
        local time = 0
        table.insert(WorldEffects.Connections, RS.Heartbeat:Connect(function(dt)
            time = time + dt
            local flicker = math.sin(time * 5) * 0.1 + 0.9
            Lt.Brightness = 1.5 * flicker
        end))
    end
}

WorldEffects.Effects["Mystic Forest"] = {
    Apply = function()
        Lt.ClockTime = 8
        Lt.Brightness = 2.2
        Lt.Ambient = Color3.fromRGB(60, 120, 80)
        Lt.OutdoorAmbient = Color3.fromRGB(80, 160, 100)
        Lt.ColorShift_Top = Color3.fromRGB(120, 220, 140)
        Lt.ColorShift_Bottom = Color3.fromRGB(60, 140, 80)
        Lt.FogColor = Color3.fromRGB(100, 180, 120)
        Lt.FogStart = 50
        Lt.FogEnd = 5500
        Lt.ExposureCompensation = 0.1
        
        local bloom = Instance.new("BloomEffect")
        bloom.Name = "WE_Bloom"
        bloom.Intensity = 0.65
        bloom.Size = 27
        bloom.Threshold = 0.7
        bloom.Parent = Lt
        
        local cc = Instance.new("ColorCorrectionEffect")
        cc.Name = "WE_ColorCorrection"
        cc.Brightness = 0.05
        cc.Contrast = 0.18
        cc.Saturation = 0.35
        cc.TintColor = Color3.fromRGB(200, 255, 220)
        cc.Parent = Lt
        
        local sr = Instance.new("SunRaysEffect")
        sr.Name = "WE_SunRays"
        sr.Intensity = 0.08
        sr.Spread = 0.3
        sr.Parent = Lt
    end
}

WorldEffects.Effects["Desert Storm"] = {
    Apply = function()
        Lt.ClockTime = 13
        Lt.Brightness = 2.5
        Lt.Ambient = Color3.fromRGB(200, 160, 100)
        Lt.OutdoorAmbient = Color3.fromRGB(240, 200, 120)
        Lt.ColorShift_Top = Color3.fromRGB(255, 230, 150)
        Lt.ColorShift_Bottom = Color3.fromRGB(220, 180, 100)
        Lt.FogColor = Color3.fromRGB(230, 190, 130)
        Lt.FogStart = 100
        Lt.FogEnd = 4000
        Lt.ExposureCompensation = 0.25
        
        local bloom = Instance.new("BloomEffect")
        bloom.Name = "WE_Bloom"
        bloom.Intensity = 0.55
        bloom.Size = 26
        bloom.Threshold = 0.75
        bloom.Parent = Lt
        
        local cc = Instance.new("ColorCorrectionEffect")
        cc.Name = "WE_ColorCorrection"
        cc.Brightness = 0.08
        cc.Contrast = 0.15
        cc.Saturation = 0.1
        cc.TintColor = Color3.fromRGB(255, 240, 200)
        cc.Parent = Lt
        
        local blur = Instance.new("BlurEffect")
        blur.Name = "WE_Blur"
        blur.Size = 2
        blur.Parent = Lt
    end
}

WorldEffects.Effects["Aurora Night"] = {
    Apply = function()
        Lt.ClockTime = 1
        Lt.Brightness = 1.3
        Lt.Ambient = Color3.fromRGB(40, 80, 120)
        Lt.OutdoorAmbient = Color3.fromRGB(60, 120, 180)
        Lt.ColorShift_Top = Color3.fromRGB(100, 200, 255)
        Lt.ColorShift_Bottom = Color3.fromRGB(150, 100, 200)
        Lt.FogColor = Color3.fromRGB(80, 140, 200)
        Lt.FogStart = 80
        Lt.FogEnd = 6000
        Lt.ExposureCompensation = 0.05
        
        local bloom = Instance.new("BloomEffect")
        bloom.Name = "WE_Bloom"
        bloom.Intensity = 1.1
        bloom.Size = 36
        bloom.Threshold = 0.5
        bloom.Parent = Lt
        
        local cc = Instance.new("ColorCorrectionEffect")
        cc.Name = "WE_ColorCorrection"
        cc.Brightness = 0
        cc.Contrast = 0.22
        cc.Saturation = 0.45
        cc.TintColor = Color3.fromRGB(200, 220, 255)
        cc.Parent = Lt
        
        local time = 0
        table.insert(WorldEffects.Connections, RS.Heartbeat:Connect(function(dt)
            time = time + dt
            local wave1 = math.sin(time * 1.5) * 0.5 + 0.5
            local wave2 = math.cos(time * 2) * 0.5 + 0.5
            Lt.ColorShift_Top = Color3.fromRGB(
                100 + wave1 * 100,
                200 * wave2,
                255
            )
            Lt.ColorShift_Bottom = Color3.fromRGB(
                150 * wave2,
                100 + wave1 * 100,
                200
            )
        end))
    end
}

WorldEffects.Effects["Retro Wave"] = {
    Apply = function()
        Lt.ClockTime = 20
        Lt.Brightness = 2
        Lt.Ambient = Color3.fromRGB(120, 40, 100)
        Lt.OutdoorAmbient = Color3.fromRGB(180, 60, 150)
        Lt.ColorShift_Top = Color3.fromRGB(255, 100, 200)
        Lt.ColorShift_Bottom = Color3.fromRGB(100, 50, 200)
        Lt.FogColor = Color3.fromRGB(200, 80, 180)
        Lt.FogStart = 60
        Lt.FogEnd = 5000
        Lt.ExposureCompensation = 0.2
        
        local bloom = Instance.new("BloomEffect")
        bloom.Name = "WE_Bloom"
        bloom.Intensity = 1.3
        bloom.Size = 42
        bloom.Threshold = 0.4
        bloom.Parent = Lt
        
        local cc = Instance.new("ColorCorrectionEffect")
        cc.Name = "WE_ColorCorrection"
        cc.Brightness = 0.03
        cc.Contrast = 0.32
        cc.Saturation = 0.55
        cc.TintColor = Color3.fromRGB(255, 180, 240)
        cc.Parent = Lt
        
        local time = 0
        table.insert(WorldEffects.Connections, RS.Heartbeat:Connect(function(dt)
            time = time + dt
            local grid = math.sin(time * 4) * 0.3 + 0.7
            bloom.Intensity = grid * 1.5
        end))
    end
}

WorldEffects.Effects["Apocalypse"] = {
    Apply = function()
        Lt.ClockTime = 16.5
        Lt.Brightness = 1.4
        Lt.Ambient = Color3.fromRGB(100, 80, 60)
        Lt.OutdoorAmbient = Color3.fromRGB(140, 100, 70)
        Lt.ColorShift_Top = Color3.fromRGB(200, 140, 80)
        Lt.ColorShift_Bottom = Color3.fromRGB(120, 80, 50)
        Lt.FogColor = Color3.fromRGB(150, 110, 70)
        Lt.FogStart = 30
        Lt.FogEnd = 3000
        Lt.ExposureCompensation = -0.05
        
        local bloom = Instance.new("BloomEffect")
        bloom.Name = "WE_Bloom"
        bloom.Intensity = 0.75
        bloom.Size = 31
        bloom.Threshold = 0.6
        bloom.Parent = Lt
        
        local cc = Instance.new("ColorCorrectionEffect")
        cc.Name = "WE_ColorCorrection"
        cc.Brightness = -0.12
        cc.Contrast = 0.3
        cc.Saturation = -0.2
        cc.TintColor = Color3.fromRGB(200, 180, 160)
        cc.Parent = Lt
        
        local blur = Instance.new("BlurEffect")
        blur.Name = "WE_Blur"
        blur.Size = 4
        blur.Parent = Lt
    end
}

WorldEffects.Effects["Crystal Cave"] = {
    Apply = function()
        Lt.ClockTime = 10
        Lt.Brightness = 2.8
        Lt.Ambient = Color3.fromRGB(150, 200, 255)
        Lt.OutdoorAmbient = Color3.fromRGB(180, 220, 255)
        Lt.ColorShift_Top = Color3.fromRGB(200, 240, 255)
        Lt.ColorShift_Bottom = Color3.fromRGB(140, 180, 230)
        Lt.FogColor = Color3.fromRGB(170, 210, 255)
        Lt.FogStart = 70
        Lt.FogEnd = 5500
        Lt.ExposureCompensation = 0.3
        
        local bloom = Instance.new("BloomEffect")
        bloom.Name = "WE_Bloom"
        bloom.Intensity = 1.4
        bloom.Size = 38
        bloom.Threshold = 0.35
        bloom.Parent = Lt
        
        local cc = Instance.new("ColorCorrectionEffect")
        cc.Name = "WE_ColorCorrection"
        cc.Brightness = 0.15
        cc.Contrast = 0.2
        cc.Saturation = 0.4
        cc.TintColor = Color3.fromRGB(220, 240, 255)
        cc.Parent = Lt
        
        local time = 0
        table.insert(WorldEffects.Connections, RS.Heartbeat:Connect(function(dt)
            time = time + dt
            local sparkle = math.sin(time * 6) * 0.4 + 1
            bloom.Intensity = sparkle * 1.2
        end))
    end
}

function WorldEffects:Enable(effectName)
    if self.Enabled and self.CurrentEffect == effectName then return end
    
    self:SaveOriginal()
    self:ClearEffects()
    
    self.Enabled = true
    self.CurrentEffect = effectName
    
    self:ApplyEffect(effectName)
end

function WorldEffects:Disable()
    if not self.Enabled then return end
    
    self.Enabled = false
    self.CurrentEffect = "None"
    
    self:ClearEffects()
    self:RestoreOriginal()
end

WorldEffects:SaveOriginal()

-- ==================== КОНЕЦ ДОБАВЛЕННЫХ ФУНКЦИЙ ====================

-- Конфигурации Safe ESP
local SafeNames = {
    "MediumSafe_HO_24","MediumSafe_HO_39","MediumSafe_HO_41","MediumSafe_SEW_2",
    "MediumSafe_SEW_8","MediumSafe_SU_32","MediumSafe_SW_9","MediumSafe_TS_20",
    "MediumSafe_T_45","MediumSafe_T_46","MediumSafe_VC_21","MediumSafe_VC_30",
    "MediumSafe_VC_38","SmallSafe_BD_12","SmallSafe_BD_18","SmallSafe_C_3",
    "SmallSafe_FA_34","SmallSafe_FA_35","SmallSafe_FA_36","SmallSafe_HO_37",
    "SmallSafe_M_17","SmallSafe_SU_15","SmallSafe_SU_22","SmallSafe_SW_11",
    "SmallSafe_SW_26","SmallSafe_TO_42","SmallSafe_TO_43","SmallSafe_TO_44",
    "SmallSafe_WH_28"
}
local RegisterNames = {
    "Register_BS_29","Register_B_10","Register_B_19","Register_B_33",
    "Register_B_40","Register_B_7","Register_C_1","Register_GS_16",
    "Register_HO_23","Register_M_25","Register_M_31","Register_M_5",
    "Register_M_6","Register_P_13","Register_P_14","Register_TS_27",
    "Register_TS_4","Register_VI_47"
}
local previousSafeBrokenStates = {}
local previousRegisterBrokenStates = {}

local RSett = {
    MaxDist = 200,
    MinHP = 15,
    FireDelay = 0.5 - ((50 - 1) / 99) * (0.5 - 0.01),
    On = false,
    Hitmarkers = true
}

local HitSounds = {
    ["Boink"] = "rbxassetid://5451260445",
    ["TF2"] = "rbxassetid://5650646664",
    ["Rust"] = "rbxassetid://5043539486",
    ["CSGO"] = "rbxassetid://8679627751",
    ["Hitmarker"] = "rbxassetid://160432334",
    ["Fortnite"] = "rbxassetid://296102734"
}

local HSett = {
    On = true,
    SoundId = HitSounds["Rust"],
    Vol = 1
}

local HSound = Instance.new("Sound")
HSound.Volume = HSett.Vol
HSound.SoundId = HSett.SoundId
HSound.Parent = workspace

local function UpdHSound()
    HSound.SoundId = HSett.SoundId
    HSound.Volume = HSett.Vol
end

local function PlayHSound()
    if not HSett.On then return end
    pcall(function() HSound:Play() end)
end

local BB = {
    On = false,
    Col = Color3.fromRGB(255, 0, 0),
    Thick = 0.1,
    Life = 2,
    Type = "Beam",
    Trans = 0.7,
    Active = {},
    Texs = {
        Classic = "rbxassetid://446111271",
        Lightning = "rbxassetid://4896581936",
        Rainbow = "rbxassetid://2490624870",
        Smoke = "rbxassetid://291213448",
        Energy = "rbxassetid://371296774",
        Glitch = "rbxassetid://2490624875"
    },
    CurTex = "Classic",
    CustomTex = "rbxassetid://446111271",
    Conns = {}
}

local TTexs = {
    ["Classic"] = {Tex = "rbxassetid://446111271", Len = 1, Spd = 1, Mode = "Wrap"},
    ["Lightning"] = {Tex = "rbxassetid://4896581936", Len = 2, Spd = 5, Mode = "Wrap"},
    ["Rainbow"] = {Tex = "rbxassetid://2490624870", Len = 3, Spd = 2, Mode = "Wrap"},
    ["Neon"] = {Tex = "rbxassetid://2969628765", Len = 2, Spd = 1, Mode = "Wrap"},
    ["Plasma"] = {Tex = "rbxassetid://3193472519", Len = 3, Spd = 2, Mode = "Wrap"},
    ["Fire"] = {Tex = "rbxassetid://511127721", Len = 4, Spd = 3, Mode = "Wrap"},
    ["Custom"] = {Tex = "rbxassetid://446111271", Len = 1, Spd = 1, Mode = "Wrap"}
}

local function findMzl(gun)
    if not gun or gun.Parent == nil then return nil end
    local names = {"Muzzle", "Flash", "FirePoint", "Handle", "WeaponHandle"}
    for _, n in pairs(names) do
        local p = gun:FindFirstChild(n)
        if p and p:IsA("BasePart") then return p end
    end
    return gun:FindFirstChildWhichIsA("BasePart") or gun
end

local function crBeam(sPos, ePos, col)
    if not BB.On or not sPos or not ePos then return nil end
    local bm, a0, a1
    local suc, err = pcall(function()
        bm = Instance.new("Beam")
        a0 = Instance.new("Attachment")
        a1 = Instance.new("Attachment")
        local par = workspace:FindFirstChild("Terrain") or workspace
        a0.Position = sPos; a0.Parent = par
        a1.Position = ePos; a1.Parent = par
        bm.Attachment0 = a0; bm.Attachment1 = a1
        bm.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, col), ColorSequenceKeypoint.new(1, col)})
        bm.Width0 = BB.Thick; bm.Width1 = BB.Thick * 0.5
        local tData = TTexs[BB.CurTex] or TTexs["Classic"]
        if BB.CurTex == "Custom" then bm.Texture = BB.CustomTex else bm.Texture = tData.Tex end
        bm.TextureLength = tData.Len; bm.TextureSpeed = tData.Spd; bm.TextureMode = tData.Mode
        bm.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, BB.Trans * 0.5),
            NumberSequenceKeypoint.new(0.5, BB.Trans),
            NumberSequenceKeypoint.new(1, 1)
        })
        bm.FaceCamera = true; bm.LightEmission = 0.5; bm.LightInfluence = 0.1; bm.Parent = par
    end)
    if not suc then
        if bm then bm:Destroy() end
        if a0 then a0:Destroy() end
        if a1 then a1:Destroy() end
        return nil
    end
    local id = #BB.Active + 1
    BB.Active[id] = {Beam = bm, Atts = {a0, a1}, Created = tick(), Type = "Beam"}
    task.delay(BB.Life, function()
        if BB.Active[id] then
            pcall(function()
                if bm and bm.Parent then bm:Destroy() end
                for _, a in ipairs(BB.Active[id].Atts) do
                    if a and a.Parent then a:Destroy() end
                end
            end)
            BB.Active[id] = nil
        end
    end)
    return id
end

local function crLine(sPos, ePos, col)
    if not BB.On or not sPos or not ePos then return nil end
    local line
    local suc, err = pcall(function()
        if not Drawing then error("Drawing lib not available") end
        line = Drawing.new("Line")
        line.Visible = true
        line.From = Vector2.new(sPos.X, sPos.Y)
        line.To = Vector2.new(ePos.X, ePos.Y)
        line.Color = col
        line.Thickness = math.floor(BB.Thick * 10)
        line.Transparency = BB.Trans
        line.ZIndex = 999
    end)
    if not suc then warn("Line tracer fail:", err); return nil end
    local id = #BB.Active + 1
    BB.Active[id] = {Line = line, Created = tick(), Type = "Line"}
    local st = tick()
    task.spawn(function()
        while tick() - st < BB.Life do
            if BB.Active[id] and BB.Active[id].Line then
                local el = tick() - st
                local a = 1 - (el / BB.Life)
                pcall(function() BB.Active[id].Line.Transparency = 1 - (a * (1 - BB.Trans)) end)
            end
            task.wait(0.01)
        end
        if BB.Active[id] and BB.Active[id].Line then
            pcall(function() BB.Active[id].Line:Remove() end)
            BB.Active[id] = nil
        end
    end)
    return id
end

local function crTracer(sPos, ePos, col)
    if not BB.On then return nil end
    if not sPos or not ePos then return nil end
    if BB.Type == "Beam" then return crBeam(sPos, ePos, col)
    elseif BB.Type == "Line" and Drawing then return crLine(sPos, ePos, col) end
    return nil
end

local function clrTracers()
    for id, t in pairs(BB.Active) do
        pcall(function()
            if t.Beam then t.Beam:Destroy()
            elseif t.Line then t.Line:Remove() end
            if t.Atts then for _, a in ipairs(t.Atts) do if a and a.Parent then a:Destroy() end end end
        end)
        BB.Active[id] = nil
    end
    BB.Active = {}
end

local function setupBB()
    local ev2 = RepSt:FindFirstChild("Events2")
    if ev2 then
        local viz = ev2:FindFirstChild("Visualize")
        if viz then
            local c = viz.Event:Connect(function(_, sc, _, gun, _, sPos, bps)
                if not BB.On or not bps then return end
                local char = LP.Character; if not char then return end
                local myTool = char:FindFirstChildOfClass("Tool"); if myTool ~= gun then return end
                local mzl = findMzl(gun); local mzlPos = mzl and mzl.Position or sPos
                for _, bDir in pairs(bps) do
                    local ray = Ray.new(mzlPos, bDir * 1000)
                    local hit, hitPos = workspace:FindPartOnRayWithIgnoreList(ray, {Cam, char, gun})
                    local ePos = hit and hitPos or mzlPos + (bDir * 500)
                    crTracer(mzlPos, ePos, BB.Col)
                end
            end)
            table.insert(BB.Conns, c)
        end
    end
    local ev = RepSt:FindFirstChild("Events")
    if ev then
        local fire = ev:FindFirstChild("GNX_S")
        if fire then
            local c = fire.OnClientEvent:Connect(function(st, sc, gun, ft, sPos, dirs, silenced)
                if not BB.On or not dirs then return end
                local char = LP.Character; if not char then return end
                local tool = char:FindFirstChildOfClass("Tool"); if tool ~= gun then return end
                local mzl = findMzl(gun); local mzlPos = mzl and mzl.Position or sPos
                for _, dir in pairs(dirs) do
                    local ray = Ray.new(mzlPos, dir * 1000)
                    local hit, hitPos = workspace:FindPartOnRayWithIgnoreList(ray, {Cam, char, gun})
                    local ePos = hit and hitPos or mzlPos + (dir * 500)
                    crTracer(mzlPos, ePos, BB.Col)
                end
            end)
            table.insert(BB.Conns, c)
        end
    end
end

local function toggleBB(state)
    BB.On = state
    if BB.On then
        clrTracers()
        for _, c in pairs(BB.Conns) do if c then c:Disconnect() end end
        BB.Conns = {}
        local suc, err = pcall(setupBB)
        if not suc then warn("BB setup fail:", err) end
        local charC = LP.CharacterAdded:Connect(function()
            if not BB.On then return end
            clrTracers()
            task.wait(1); pcall(setupBB)
        end)
        table.insert(BB.Conns, charC)
        local remC = LP.CharacterRemoving:Connect(function() if BB.On then clrTracers() end end)
        table.insert(BB.Conns, remC)
        Lib:Notify("BulletBeam on", 2)
    else
        clrTracers()
        for _, c in pairs(BB.Conns) do if c then c:Disconnect() end end
        BB.Conns = {}
        Lib:Notify("BulletBeam off", 2)
    end
end

local function setBBCol(r,g,b) BB.Col = Color3.new(r,g,b) end

hlCols = {
    Red = Color3.fromRGB(255,50,50), Orange = Color3.fromRGB(255,165,0),
    Yellow = Color3.fromRGB(255,255,0), Green = Color3.fromRGB(50,255,50),
    Blue = Color3.fromRGB(50,150,255), Indigo = Color3.fromRGB(75,0,130),
    Violet = Color3.fromRGB(238,130,238), White = Color3.fromRGB(255,255,255)
}

binds = {Ragebot = Enum.KeyCode.V, Invisible = Enum.KeyCode.T, Noclip = Enum.KeyCode.B, MeleeAura = Enum.KeyCode.Y, Fly = Enum.KeyCode.Z}

SAVE_CUBE = Vector3.new(-4185.1, 102.6, 283.6)
UNDER = Vector3.new(-5048.8, -258.8, -129.8)
SAVE_VIBE = Vector3.new(-4878.1, -165.5, -921.2)

_G.InvPersist = false; _G.FlyPersist = false; _G.MeleePersist = false; _G.NoclipPersist = false
_G.AFKPersist = false; _G.FBPersist = false; _G.FOVPersist = false; _G.BBPersist = false

Set = {IsDead = false}
CDs = {Pick = {MoneyCD = false}}

me = LP
hrp = nil
RUNS = {Rag = nil, Old = nil}
evFolderFly = RepSt:FindFirstChild("Events")
flyEv = evFolderFly and evFolderFly:FindFirstChild("RZDONL")
ragEv = evFolderFly and evFolderFly:FindFirstChild("__RZDONL")
flySpd = 60

UIS.TextBoxFocused:Connect(function() S.UI.TxtFocused = true; S.UI.TxtRefocused = true; task.wait(0.1); S.UI.TxtRefocused = false end)
UIS.TextBoxFocusReleased:Connect(function() S.UI.TxtFocused = false; S.UI.TxtRefocused = false end)

local function canBind()
    if S.UI.TxtFocused then return false end
    if S.UI.TxtRefocused then return false end
    local pg = LP:FindFirstChild("PlayerGui")
    if pg then for _, g in pairs(pg:GetChildren()) do
        if g:IsA("ScreenGui") and (g.Name:find("Chat") or g.Name:find("chat")) then
            for _, f in pairs(g:GetDescendants()) do
                if f:IsA("TextBox") and f.Visible and f.Active then return false end
            end
        end
    end end
    return true
end

local function randStr(len)
    local res = ""
    for i=1,len do res = res .. string.char(math.random(97,122)) end
    return res
end

-- ==================== НОВЫЕ ФУНКЦИИ: SAFE ESP ====================

local function createHighlight(obj, objName, isRegister)
    local highlights = isRegister and S.SafeESP.RegisterHighlights or S.SafeESP.Highlights
    local billboards = isRegister and S.SafeESP.RegisterBillboards or S.SafeESP.Billboards
    
    if highlights[objName] then highlights[objName]:Destroy() end
    if billboards[objName] then billboards[objName]:Destroy() end
    
    local highlight = Instance.new("Highlight")
    highlight.Parent = game:GetService("CoreGui")
    highlight.Adornee = obj
    highlight.FillTransparency = 0.7
    highlight.OutlineTransparency = 1
    highlights[objName] = highlight
    
    local billboard = Instance.new("BillboardGui")
    billboard.Name = isRegister and "RegisterInfo" or "SafeInfo"
    billboard.Adornee = obj
    billboard.Size = UDim2.new(0, 200, 0, 60)
    billboard.StudsOffset = Vector3.new(0, 6, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = game:GetService("CoreGui")
    
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.TextStrokeTransparency = 0
    textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    textLabel.TextSize = 10
    textLabel.TextScaled = false
    textLabel.Font = Enum.Font.GothamBold
    textLabel.Parent = billboard
    
    billboards[objName] = billboard
    
    obj.AncestryChanged:Connect(function()
        if not obj:IsDescendantOf(workspace) then
            if highlights[objName] then highlights[objName].Enabled = false end
            if billboards[objName] then billboards[objName].Enabled = false end
        end
    end)
end

local function setupSafeESP()
    if S.SafeESP.Coroutine then return end
    
    S.SafeESP.LastUpdateTime = tick()
    S.SafeESP.Coroutine = coroutine.create(function()
        while S.SafeESP.On do
            local delta = tick() - S.SafeESP.LastUpdateTime
            S.SafeESP.LastUpdateTime = tick()
            
            for _, safeName in ipairs(SafeNames) do
                local success, safe = pcall(function()
                    return workspace.Map.BredMakurz:FindFirstChild(safeName)
                end)
                
                if not success or not safe then
                    if S.SafeESP.Highlights[safeName] then S.SafeESP.Highlights[safeName].Enabled = false end
                    if S.SafeESP.Billboards[safeName] then S.SafeESP.Billboards[safeName].Enabled = false end
                    continue
                end
                
                local adornee = safe
                local skip = false
                
                if safeName == "SmallSafe_M_17" then
                    local canHit = safe:FindFirstChild("CanHit")
                    local isOpen = canHit and canHit.Value == true
                    if isOpen then
                        if S.SafeESP.Highlights[safeName] then S.SafeESP.Highlights[safeName].Enabled = false end
                        if S.SafeESP.Billboards[safeName] then S.SafeESP.Billboards[safeName].Enabled = false end
                        skip = true
                    else
                        local mainPart = safe:FindFirstChild("MainPart") or safe
                        adornee = mainPart
                        if not S.SafeESP.Highlights[safeName] or not S.SafeESP.Highlights[safeName].Parent then
                            createHighlight(mainPart, safeName, false)
                        end
                        if S.SafeESP.Highlights[safeName] then
                            S.SafeESP.Highlights[safeName].Adornee = mainPart
                            S.SafeESP.Highlights[safeName].Enabled = true
                        end
                    end
                else
                    if not S.SafeESP.Highlights[safeName] or not S.SafeESP.Highlights[safeName].Parent then
                        createHighlight(adornee, safeName, false)
                    end
                    if S.SafeESP.Highlights[safeName] then
                        S.SafeESP.Highlights[safeName].Adornee = adornee
                        S.SafeESP.Highlights[safeName].Enabled = true
                    end
                end
                
                local billboard = S.SafeESP.Billboards[safeName]
                if billboard and billboard.Parent then
                    billboard.Adornee = adornee
                    if not S.SafeESP.FrozenPositions[safeName] then
                        billboard.StudsOffset = Vector3.new(0, 6, 0)
                    end
                    billboard.Enabled = true
                end
                
                if skip then continue end
                
                local isBroken = false
                local resetTime = 0
                
                pcall(function()
                    local values = safe:FindFirstChild("Values")
                    if values then
                        local broken = values:FindFirstChild("Broken")
                        if broken then isBroken = broken.Value end
                    end
                    
                    if not isBroken then
                        local interact = safe:FindFirstChild("Interact")
                        if interact then isBroken = interact:GetAttribute("Broken") or false end
                    end
                    
                    local wasBroken = previousSafeBrokenStates[safeName] or false
                    if isBroken and not wasBroken then
                        S.SafeESP.ResetTimers[safeName] = 720
                        if S.SafeESP.Billboards[safeName] and S.SafeESP.Billboards[safeName].Parent then
                            S.SafeESP.FrozenPositions[safeName] = S.SafeESP.Billboards[safeName].StudsOffset
                        end
                    end
                    
                    previousSafeBrokenStates[safeName] = isBroken
                    
                    if isBroken and S.SafeESP.ResetTimers[safeName] then
                        S.SafeESP.ResetTimers[safeName] = math.max(S.SafeESP.ResetTimers[safeName] - delta, 0)
                        resetTime = S.SafeESP.ResetTimers[safeName]
                    else
                        S.SafeESP.ResetTimers[safeName] = nil
                        S.SafeESP.FrozenPositions[safeName] = nil
                    end
                end)
                
                local highlight = S.SafeESP.Highlights[safeName]
                local billboard = S.SafeESP.Billboards[safeName]
                
                if highlight and billboard and billboard.Parent and billboard:FindFirstChild("TextLabel") then
                    highlight.FillColor = isBroken and Color3.fromRGB(255, 80, 80) or Color3.fromRGB(80, 255, 80)
                    highlight.Enabled = true
                    
                    local minutes = math.floor(resetTime / 60)
                    local seconds = math.floor(resetTime % 60)
                    local timeText = isBroken and string.format("%d:%02d", minutes, seconds) or ""
                    billboard:FindFirstChild("TextLabel").Text = timeText
                    billboard.Enabled = isBroken and resetTime > 0
                end
            end
            
            for _, registerName in ipairs(RegisterNames) do
                local success, register = pcall(function()
                    return workspace.Map.BredMakurz:FindFirstChild(registerName)
                end)
                
                if not success or not register then
                    if S.SafeESP.RegisterHighlights[registerName] then S.SafeESP.RegisterHighlights[registerName].Enabled = false end
                    if S.SafeESP.RegisterBillboards[registerName] then S.SafeESP.RegisterBillboards[registerName].Enabled = false end
                    continue
                end
                
                if not S.SafeESP.RegisterHighlights[registerName] or not S.SafeESP.RegisterHighlights[registerName].Parent then
                    createHighlight(register, registerName, true)
                end
                
                if S.SafeESP.RegisterHighlights[registerName] then
                    S.SafeESP.RegisterHighlights[registerName].Adornee = register
                    S.SafeESP.RegisterHighlights[registerName].Enabled = true
                end
                
                local billboard = S.SafeESP.RegisterBillboards[registerName]
                if billboard and billboard.Parent then
                    billboard.Adornee = register
                    if not S.SafeESP.FrozenPositions[registerName] then
                        billboard.StudsOffset = Vector3.new(0, 6, 0)
                    end
                    billboard.Enabled = true
                end
                
                local isBroken = false
                local resetTime = 0
                
                pcall(function()
                    local values = register:FindFirstChild("Values")
                    if values then
                        local broken = values:FindFirstChild("Broken")
                        if broken then isBroken = broken.Value end
                    end
                    
                    if not isBroken then
                        local interact = register:FindFirstChild("Interact")
                        if interact then isBroken = interact:GetAttribute("Broken") or false end
                    end
                    
                    local wasBroken = previousRegisterBrokenStates[registerName] or false
                    if isBroken and not wasBroken then
                        S.SafeESP.ResetTimers[registerName] = 600
                        if billboard and billboard.Parent then
                            S.SafeESP.FrozenPositions[registerName] = billboard.StudsOffset
                        end
                    end
                    
                    previousRegisterBrokenStates[registerName] = isBroken
                    
                    if isBroken and S.SafeESP.ResetTimers[registerName] then
                        S.SafeESP.ResetTimers[registerName] = math.max(S.SafeESP.ResetTimers[registerName] - delta, 0)
                        resetTime = S.SafeESP.ResetTimers[registerName]
                    else
                        S.SafeESP.ResetTimers[registerName] = nil
                        S.SafeESP.FrozenPositions[registerName] = nil
                    end
                end)
                
                local highlight = S.SafeESP.RegisterHighlights[registerName]
                if highlight and billboard and billboard.Parent and billboard:FindFirstChild("TextLabel") then
                    highlight.FillColor = isBroken and Color3.fromRGB(255, 80, 80) or Color3.fromRGB(80, 255, 80)
                    highlight.Enabled = true
                    
                    local minutes = math.floor(resetTime / 60)
                    local seconds = math.floor(resetTime % 60)
                    local timeText = isBroken and string.format("%d:%02d", minutes, seconds) or ""
                    billboard:FindFirstChild("TextLabel").Text = timeText
                    billboard.Enabled = isBroken and resetTime > 0
                end
            end
            
            task.wait(1)
        end
    end)
    
    coroutine.resume(S.SafeESP.Coroutine)
    Lib:Notify("Safe ESP enabled", 2)
end

local function disableSafeESP()
    S.SafeESP.On = false
    
    for _, h in pairs(S.SafeESP.Highlights) do if h then h:Destroy() end end
    for _, b in pairs(S.SafeESP.Billboards) do if b then b:Destroy() end end
    for _, h in pairs(S.SafeESP.RegisterHighlights) do if h then h:Destroy() end end
    for _, b in pairs(S.SafeESP.RegisterBillboards) do if b then b:Destroy() end end
    
    S.SafeESP.Highlights = {}
    S.SafeESP.Billboards = {}
    S.SafeESP.ResetTimers = {}
    S.SafeESP.FrozenPositions = {}
    S.SafeESP.RegisterHighlights = {}
    S.SafeESP.RegisterBillboards = {}
    previousSafeBrokenStates = {}
    previousRegisterBrokenStates = {}
    
    S.SafeESP.Coroutine = nil
    Lib:Notify("Safe ESP disabled", 2)
end

local function toggleSafeESP(state)
    if state then
        S.SafeESP.On = true
        S.SafeESP.Highlights = {}
        S.SafeESP.Billboards = {}
        S.SafeESP.ResetTimers = {}
        S.SafeESP.FrozenPositions = {}
        S.SafeESP.RegisterHighlights = {}
        S.SafeESP.RegisterBillboards = {}
        setupSafeESP()
    else
        disableSafeESP()
    end
end

-- ==================== НОВЫЕ ФУНКЦИИ: LOCKPICK SCALE ====================

local function setupLockpickScale()
    if S.LockpickScale.Connection then return end
    
    S.LockpickScale.Connection = RS.Heartbeat:Connect(function()
        if not S.LockpickScale.On then return end
        
        local gui = LP.PlayerGui:FindFirstChild("LockpickGUI")
        if not gui then return end
        
        local mf = gui:FindFirstChild("MF")
        if not mf then return end
        
        local lpFrame = mf:FindFirstChild("LP_Frame")
        if not lpFrame then return end
        
        local frames = lpFrame:FindFirstChild("Frames")
        if not frames then return end
        
        for _, barName in ipairs({"B1", "B2", "B3"}) do
            local b = frames:FindFirstChild(barName)
            if b then
                local bar = b:FindFirstChild("Bar")
                if bar then
                    local uiScale = bar:FindFirstChild("UIScale")
                    if uiScale then uiScale.Scale = 10 end
                end
            end
        end
    end)
    
    Lib:Notify("Lockpick Scale enabled", 2)
end

local function disableLockpickScale()
    if S.LockpickScale.Connection then 
        S.LockpickScale.Connection:Disconnect() 
        S.LockpickScale.Connection = nil 
    end
    
    local gui = LP.PlayerGui:FindFirstChild("LockpickGUI")
    if gui then
        local mf = gui:FindFirstChild("MF")
        if mf then
            local lpFrame = mf:FindFirstChild("LP_Frame")
            if lpFrame then
                local frames = lpFrame:FindFirstChild("Frames")
                if frames then
                    for _, barName in ipairs({"B1", "B2", "B3"}) do
                        local b = frames:FindFirstChild(barName)
                        if b then
                            local bar = b:FindFirstChild("Bar")
                            if bar then
                                local uiScale = bar:FindFirstChild("UIScale")
                                if uiScale then uiScale.Scale = 1 end
                            end
                        end
                    end
                end
            end
        end
    end
    
    Lib:Notify("Lockpick Scale disabled", 2)
end

local function toggleLockpickScale(state)
    S.LockpickScale.On = state
    if state then
        setupLockpickScale()
    else
        disableLockpickScale()
    end
end

-- ==================== НОВЫЕ ФУНКЦИИ: INFINITE STAMINA ====================

local function setupInfStamina()
    if S.InfStamina.Connection then return end
    
    S.InfStamina.Connection = RS.RenderStepped:Connect(function()
        if not S.InfStamina.On then return end
        
        local char = LP.Character
        if not char then return end
        
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum and not hum:GetAttribute("ZSPRN_M") then
            hum:SetAttribute("ZSPRN_M", true)
        end
    end)
    
    Lib:Notify("Infinite Stamina enabled", 2)
end

local function disableInfStamina()
    if S.InfStamina.Connection then 
        S.InfStamina.Connection:Disconnect() 
        S.InfStamina.Connection = nil 
    end
    
    local char = LP.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then hum:SetAttribute("ZSPRN_M", nil) end
    end
    
    Lib:Notify("Infinite Stamina disabled", 2)
end

local function toggleInfStamina(state)
    S.InfStamina.On = state
    if state then
        setupInfStamina()
    else
        disableInfStamina()
    end
end

-- ==================== ОБНОВЛЕННАЯ ESP СИСТЕМА ====================

local function updESP()
    for _, p in pairs(Plrs:GetPlayers()) do
        if p ~= LP then
            local c = p.Character; if c then
                local hl = c:FindFirstChild("Highlight")
                if S.ESP.HlOn and S.ESP.On then
                    local localRoot = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
                    local targetRoot = c:FindFirstChild("HumanoidRootPart")
                    
                    if localRoot and targetRoot then
                        local distance = (localRoot.Position - targetRoot.Position).Magnitude
                        if distance > S.ESPDistance.Value then
                            if hl then hl:Destroy() end
                            continue
                        end
                    end
                    
                    if not hl then hl = Instance.new("Highlight"); hl.Parent = c; hl.FillTransparency = 1; hl.OutlineTransparency = 0 end
                    hl.OutlineColor = S.ESP.HlCol
                    hl.Enabled = true
                else 
                    if hl then hl:Destroy() end 
                end
            end
        end
    end
end

local function updAllHL()
    for _, p in pairs(Plrs:GetPlayers()) do
        if p ~= LP then 
            local c = p.Character; if c then 
                local hl = c:FindFirstChild("Highlight")
                if hl and S.ESP.HlOn and S.ESP.On then 
                    local localRoot = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
                    local targetRoot = c:FindFirstChild("HumanoidRootPart")
                    
                    if localRoot and targetRoot then
                        local distance = (localRoot.Position - targetRoot.Position).Magnitude
                        if distance > S.ESPDistance.Value then
                            hl.Enabled = false
                        else
                            hl.Enabled = true
                            hl.OutlineColor = S.ESP.HlCol 
                        end
                    end
                end 
            end 
        end 
    end
end

local function updArms()
    local cam = Ws.CurrentCamera; local vf = cam:FindFirstChild("ViewModel"); if not vf then return end
    local la = vf:FindFirstChild("Left Arm"); local ra = vf:FindFirstChild("Right Arm")
    if la and ra then
        if S.ESP.ArmsOn and S.ESP.On then
            if not la:GetAttribute("OrigMat") then la:SetAttribute("OrigMat", la.Material); la:SetAttribute("OrigCol", la.Color) end
            if not ra:GetAttribute("OrigMat") then ra:SetAttribute("OrigMat", ra.Material); ra:SetAttribute("OrigCol", ra.Color) end
            la.Material = Enum.Material.ForceField; ra.Material = Enum.Material.ForceField
            la.Color = S.ESP.ArmsCol; ra.Color = S.ESP.ArmsCol
        else
            local lom = la:GetAttribute("OrigMat"); local loc = la:GetAttribute("OrigCol")
            local rom = ra:GetAttribute("OrigMat"); local roc = ra:GetAttribute("OrigCol")
            la.Material = lom or Enum.Material.Plastic; la.Color = loc or Color3.fromRGB(255,255,255)
            ra.Material = rom or Enum.Material.Plastic; ra.Color = roc or Color3.fromRGB(255,255,255)
        end
    end
end

local function setArmsCol(cName)
    if hlCols[cName] then S.ESP.ArmsCol = hlCols[cName]; updArms(); Lib:Notify("Arms col: "..cName, 2) end
end

local function toggleArms(state)
    if not S.ESP.On then Lib:Notify("ESP system must be enabled first!", 2); return false end
    S.ESP.ArmsOn = state
    if state then
        updArms()
        if not S.ESP.VMConn then
            S.ESP.VMConn = Ws.CurrentCamera.ChildAdded:Connect(function(ch)
                if ch.Name == "ViewModel" then task.wait(0.5); if S.ESP.ArmsOn and S.ESP.On then updArms() end end
            end)
        end
        if not S.ESP.CharConn then
            S.ESP.CharConn = LP.CharacterAdded:Connect(function() task.wait(1); if S.ESP.ArmsOn and S.ESP.On then updArms() end end)
        end
        Lib:Notify("Arms on", 2)
    else
        updArms()
        if S.ESP.VMConn then S.ESP.VMConn:Disconnect(); S.ESP.VMConn = nil end
        if S.ESP.CharConn then S.ESP.CharConn:Disconnect(); S.ESP.CharConn = nil end
        Lib:Notify("Arms off", 2)
    end
    return S.ESP.ArmsOn
end

local function setHLCol(cName)
    if hlCols[cName] then S.ESP.HlCol = hlCols[cName]; updAllHL(); Lib:Notify("HL col: "..cName, 2) end
end

local function toggleHL(state)
    if not S.ESP.On then Lib:Notify("ESP system must be enabled first!", 2); return false end
    S.ESP.HlOn = state
    if S.ESP.HlOn then
        updESP()
        if not S.ESP.Conn then S.ESP.Conn = RS.Heartbeat:Connect(updESP) end
        Plrs.PlayerAdded:Connect(function(p) p.CharacterAdded:Connect(function(c) if S.ESP.On and S.ESP.HlOn then task.wait(0.5); updESP() end end) end)
        Lib:Notify("HL on", 2)
    else
        for _, p in pairs(Plrs:GetPlayers()) do if p ~= LP then local c = p.Character; if c then local hl = c:FindFirstChild("Highlight"); if hl then hl:Destroy() end end end end
        Lib:Notify("HL off", 2)
    end
    return S.ESP.HlOn
end

local function toggleSys(state)
    S.ESP.On = state
    if S.ESP.On then
        if S.ESP.HlOn then updESP(); S.ESP.Conn = RS.Heartbeat:Connect(updESP)
            Plrs.PlayerAdded:Connect(function(p) p.CharacterAdded:Connect(function(c) if S.ESP.On and S.ESP.HlOn then task.wait(0.5); updESP() end end) end) end
        if S.ESP.ArmsOn then updArms() end
        Lib:Notify("ESP on", 2)
    else
        if S.ChinaHat.Enabled then toggleChinaHat(false) end
        if S.PlayerChams.Enabled then togglePlayerChams(false) end
        
        if S.ESP.Conn then S.ESP.Conn:Disconnect(); S.ESP.Conn = nil end
        if S.ESP.VMConn then S.ESP.VMConn:Disconnect(); S.ESP.VMConn = nil end
        if S.ESP.CharConn then S.ESP.CharConn:Disconnect(); S.ESP.CharConn = nil end
        for _, p in pairs(Plrs:GetPlayers()) do if p ~= LP then local c = p.Character; if c then local hl = c:FindFirstChild("Highlight"); if hl then hl:Destroy() end end end end
        updArms()
        Lib:Notify("ESP off", 2)
    end
end

-- ==================== ОСНОВНОЕ ОКНО И НАСТРОЙКИ ====================

Win = Lib:CreateWindow({Title = "starlight.cc", Center = true, AutoShow = true})

StartSnd = Instance.new("Sound")
StartSnd.SoundId = "rbxassetid://9072301639"; StartSnd.Volume = 1.5; StartSnd.Parent = Win.API and Win.API.Container or game:GetService("CoreGui")
task.defer(function() pcall(function() StartSnd:Play() end) end)

-- ==================== ВКЛАДКА ABOUT (ПЕРВАЯ) ====================

Tabs = {
    About = Win:AddTab("About"),
    Combat = Win:AddTab("Combat"),
    Visuals = Win:AddTab("Visuals"),
    Player = Win:AddTab("Player"),
    Skin = Win:AddTab("SkinChanger"),
    Misc = Win:AddTab("Misc"),
    Farm = Win:AddTab("Farm"),
    Settings = Win:AddTab("Settings")
}


-- Левая часть вкладки About: Coders
local AboutLeftGroup = Tabs.About:AddLeftGroupbox("Coders")
AboutLeftGroup:AddLabel("cw.yw")
AboutLeftGroup:AddLabel("7wk5")
AboutLeftGroup:AddDivider()
AboutLeftGroup:AddLabel("starlight.cc Script")
AboutLeftGroup:AddLabel("Version: 1.2.0")
AboutLeftGroup:AddLabel("Updated: 26.02.2026")

local AboutLeftGroup = Tabs.About:AddLeftGroupbox("ChangeLogs")
AboutLeftGroup:AddLabel("Added:Aimbot System ")
AboutLeftGroup:AddLabel("Added:Map Lighting")
AboutLeftGroup:AddLabel("Updated:ESP")
AboutLeftGroup:AddLabel("Infinite stamina")
AboutLeftGroup:AddLabel("Free cam and blur")
AboutLeftGroup:AddLabel("Added Sticky Aim")

-- Правая часть вкладки About: Discord
local AboutRightGroup = Tabs.About:AddRightGroupbox("Discord")
AboutRightGroup:AddButton({
    Text = "Discord",
    Func = function()
        local discordLink = "https://discord.gg/qUHPc66JXJ"
        if setclipboard then
            setclipboard(discordLink)
            Lib:Notify("Discord link copied to clipboard!", 3)
        end
        -- Открываем ссылку в браузере
        pcall(function()
            local HttpService = game:GetService("HttpService")
            local success, result = pcall(function()
                HttpService:RequestAsync({
                    Url = "http://localhost:6463/rpc?v=1",
                    Method = "POST",
                    Headers = {
                        ["Content-Type"] = "application/json",
                        ["Origin"] = "https://discord.com"
                    },
                    Body = HttpService:JSONEncode({
                        cmd = "INVITE_BROWSER",
                        args = {
                            code = "qUHPc66JXJ"
                        },
                        nonce = HttpService:GenerateGUID(false)
                    })
                })
            end)
            
            if not success then
                -- Если Discord не установлен или не запущен, открываем в веб-браузере
                game:GetService("StarterGui"):SetCore("OpenBrowserWindow", {
                    Url = discordLink
                })
            end
        end)
    end,
    DoubleClick = false
})
AboutRightGroup:AddLabel("Join our Discord server")
AboutRightGroup:AddLabel("Click to get a link")
AboutRightGroup:AddLabel("for updates and support")
AboutRightGroup:AddDivider()
AboutRightGroup:AddLabel("Features:")
AboutRightGroup:AddLabel("- ESP System")
AboutRightGroup:AddLabel("- Silent Aim & Aimbot")
AboutRightGroup:AddLabel("- Safe ESP & Auto Farm")
AboutRightGroup:AddLabel("- Player Chams & China Hat")
AboutRightGroup:AddLabel("- Skin Changer")
AboutRightGroup:AddLabel("- And much more...")

-- ==================== AIMBOT UI ====================

local AimBotGroup = Tabs.Combat:AddLeftGroupbox("Aimbot")

AimBotGroup:AddToggle("AimBotToggle", {
    Text = "Enable Aimbot",
    Default = false,
    Callback = function(state)
        toggleAimBot(state)
    end
})

AimBotGroup:AddDropdown("AimBotTargetPart", {
    Values = {"Head", "Torso", "HumanoidRootPart", "LeftArm", "RightArm", "LeftLeg", "RightLeg"},
    Default = "Head",
    Multi = false,
    Text = "Target Part",
    Callback = function(value)
        S.AimBot.TargetPart = value
        Lib:Notify("Target Part: " .. value, 2)
    end
})

AimBotGroup:AddSlider("AimBotSmoothness", {
    Text = "Smoothness",
    Default = 0.1,
    Min = 0.01,
    Max = 1,
    Rounding = 2,
    Compact = false,
    Callback = function(value)
        S.AimBot.Smoothness = value
        Lib:Notify("Smoothness: " .. string.format("%.2f", value), 2)
    end
})

AimBotGroup:AddSlider("AimBotPrediction", {
    Text = "Prediction",
    Default = 100,
    Min = 1,
    Max = 500,
    Rounding = 0,
    Compact = false,
    Callback = function(value)
        S.AimBot.Prediction = value
        Lib:Notify("Prediction: " .. value, 2)
    end
})

AimBotGroup:AddSlider("AimBotFOV", {
    Text = "FOV Circle",
    Default = 100,
    Min = 10,
    Max = 500,
    Rounding = 0,
    Compact = false,
    Callback = function(value)
        S.AimBot.FOV = value
        Lib:Notify("FOV: " .. value, 2)
    end
})

AimBotGroup:AddToggle("AimBotShowFOV", {
    Text = "Show FOV Circle",
    Default = true,
    Callback = function(state)
        S.AimBot.ShowFOV = state
        if state then
            CreateFOVCircle()
            Lib:Notify("FOV Circle shown", 2)
        else
            if S.AimBot.FOVCircle then
                S.AimBot.FOVCircle:Remove()
                S.AimBot.FOVCircle = nil
            end
            Lib:Notify("FOV Circle hidden", 2)
        end
    end
})

AimBotGroup:AddLabel("FOV Color:"):AddColorPicker("AimBotFOVColor", {
    Default = S.AimBot.FOVColor,
    Title = "FOV Circle Color",
    Callback = function(color)
        S.AimBot.FOVColor = color
        if S.AimBot.FOVCircle then
            S.AimBot.FOVCircle.Color = color
        end
        Lib:Notify("FOV Color changed", 2)
    end
})

AimBotGroup:AddSlider("AimBotFOVTransparency", {
    Text = "FOV Transparency",
    Default = 0.5,
    Min = 0,
    Max = 1,
    Rounding = 2,
    Compact = false,
    Callback = function(value)
        S.AimBot.FOVTransparency = value
        if S.AimBot.FOVCircle then
            S.AimBot.FOVCircle.Transparency = value
        end
        Lib:Notify("FOV Transparency: " .. string.format("%.2f", value), 2)
    end
})

AimBotGroup:AddToggle("AimBotWallCheck", {
    Text = "Wall Check",
    Default = true,
    Callback = function(state)
        S.AimBot.WallCheck = state
        Lib:Notify("Wall Check: " .. tostring(state), 2)
    end
})

AimBotGroup:AddToggle("AimBotSticky", {
    Text = "Sticky Aim",
    Default = true,
    Tooltip = "Sticky aim here",
    Callback = function(state)
        S.AimBot.Sticky = state
        if not state then
            -- Если Sticky выключили, сбрасываем текущую цель, чтобы аимбот мог свободно переключаться.
            S.AimBot.Target = nil
        end
        Lib:Notify("Sticky Aim: " .. tostring(state), 2)
    end
})

AimBotGroup:AddToggle("AimBotDownedCheck", {
    Text = "Downed Check",
    Default = true,
    Callback = function(state)
        S.AimBot.DownedCheck = state
        Lib:Notify("Downed Check: " .. tostring(state), 2)
    end
})

AimBotGroup:AddDivider()
AimBotGroup:AddLabel("FOV is fixed at screen center")

-- ==================== ОСНОВНОЙ КОД ПРОДОЛЖАЕТСЯ ====================

local function noclipLoop()
    while S.Noclip.On do
        if LP.Character then for _, p in pairs(LP.Character:GetDescendants()) do if p:IsA("BasePart") and p.CanCollide then p.CanCollide = false end end end
        RS.RenderStepped:Wait()
    end
end

local function toggleNoclip(state)
    S.Noclip.On = state; _G.NoclipPersist = state
    if S.Noclip.On then
        Lib:Notify("Noclip on", 2); noclipLoop()
        local function onChar(c) task.wait(0.5); if S.Noclip.On then noclipLoop() end end
        if LP.Character then onChar(LP.Character) end
        LP.CharacterAdded:Connect(onChar)
    else
        if S.Noclip.Conn then S.Noclip.Conn:Disconnect(); S.Noclip.Conn = nil end
        Lib:Notify("Noclip off", 2)
    end
end

local function stopNeck()
    if LP.Character then LP.Character:SetAttribute("NoNeckMove", true) end
end

local function restNeck()
    if LP.Character then LP.Character:SetAttribute("NoNeckMove", false) end
end

local function toggleStopNeck(state)
    S.StopNeck.On = state
    if S.StopNeck.On then
        stopNeck(); Lib:Notify("StopNeck on", 2)
        local c = LP.CharacterAdded:Connect(function(c) task.wait(0.5); if S.StopNeck.On then stopNeck() end end)
        if S.StopNeck.Conn then S.StopNeck.Conn:Disconnect() end
        S.StopNeck.Conn = c
    else
        restNeck()
        if S.StopNeck.Conn then S.StopNeck.Conn:Disconnect(); S.StopNeck.Conn = nil end
        Lib:Notify("StopNeck off", 2)
    end
end

local function setupUnbreak()
    local cs = RepSt.CharStats; if not cs then return end
    local ms = cs:FindFirstChild(LP.Name); if not ms then return end
    local lf = ms:FindFirstChild("HealthValues"); if not lf then return end
    local function unbreakAll()
        for _, l in pairs(lf:GetChildren()) do
            local bv = l:FindFirstChild("Broken"); if bv then
                bv.Value = false
                local c = bv:GetPropertyChangedSignal("Value"):Connect(function() bv.Value = false end)
                table.insert(S.Unbreak.Conns, c)
            end
        end
    end
    unbreakAll()
    local c = lf.ChildAdded:Connect(function() task.wait(0.1); if S.Unbreak.On then unbreakAll() end end)
    table.insert(S.Unbreak.Conns, c)
end

local function toggleUnbreak(state)
    S.Unbreak.On = state
    if S.Unbreak.On then
        setupUnbreak(); Lib:Notify("Unbreak on", 2)
        LP.CharacterAdded:Connect(function() task.wait(1); if S.Unbreak.On then setupUnbreak() end end)
    else
        for _, c in pairs(S.Unbreak.Conns) do if c then c:Disconnect() end end
        S.Unbreak.Conns = {}; Lib:Notify("Unbreak off", 2)
    end
end

local function setupFakeD()
    if not LP.Character then return end
    local cs = RepSt.CharStats; if not cs then return end
    local ms = cs:FindFirstChild(LP.Name); if not ms then return end
    local dv = ms:FindFirstChild("Downed"); if not dv then return end
    S.FakeDown.StatObj = dv; S.FakeDown.OrigVal = dv.Value
    if dv.Value ~= true then dv.Value = true end
    S.FakeDown.Conn = dv:GetPropertyChangedSignal("Value"):Connect(function() if dv.Value ~= true then dv.Value = true end end)
end

local function restFakeD()
    if S.FakeDown.StatObj and S.FakeDown.OrigVal ~= nil then
        if S.FakeDown.Conn then S.FakeDown.Conn:Disconnect(); S.FakeDown.Conn = nil end
        S.FakeDown.StatObj.Value = S.FakeDown.OrigVal
        S.FakeDown.StatObj = nil; S.FakeDown.OrigVal = nil
    end
end

local function toggleFakeD(state)
    S.FakeDown.On = state
    if S.FakeDown.On then
        setupFakeD(); Lib:Notify("FakeDown on", 2)
        LP.CharacterAdded:Connect(function() task.wait(1); if S.FakeDown.On then setupFakeD() end end)
    else
        restFakeD(); Lib:Notify("FakeDown off", 2)
    end
end

local function addFF(char)
    if char then
        for _, o in pairs(char:GetChildren()) do if o:IsA("ForceField") and o.Visible == false then o:Destroy() end end
        local ff = Instance.new("ForceField"); ff.Parent = char; ff.Visible = false
        local c = char.ChildAdded:Connect(function(ch) if ch:IsA("ForceField") and ch.Visible == false then task.wait(0.1); if S.NoFall.On then ch.Visible = false end end end)
        table.insert(S.NoFall.Conns, c)
    end
end

local function toggleNoFall(state)
    S.NoFall.On = state
    if S.NoFall.On then
        if LP.Character then addFF(LP.Character) end
        Lib:Notify("NoFall on", 2)
        local c = LP.CharacterAdded:Connect(function(c) task.wait(0.5); if S.NoFall.On then addFF(c) end end)
        table.insert(S.NoFall.Conns, c)
    else
        for _, c in pairs(S.NoFall.Conns) do if c then c:Disconnect() end end
        S.NoFall.Conns = {}
        if LP.Character then for _, o in pairs(LP.Character:GetChildren()) do if o:IsA("ForceField") and o.Visible == false then o:Destroy() end end end
        Lib:Notify("NoFall off", 2)
    end
end

local function disBarriers()
    local ff = Ws:FindFirstChild("Filter"); if not ff then return end
    local pf = ff:FindFirstChild("Parts"); if not pf then return end
    local fp = pf:FindFirstChild("F_Parts"); if not fp then return end
    for _, d in pairs(fp:GetDescendants()) do if d:IsA("Part") or d:IsA("MeshPart") then d.CanTouch = false end end
    S.NoSpike.Conn = fp.DescendantAdded:Connect(function(d) if d:IsA("Part") or d:IsA("MeshPart") then d.CanTouch = false end end)
end

local function toggleNoSpike(state)
    S.NoSpike.On = state
    if S.NoSpike.On then
        if Ws:FindFirstChild("Filter") then disBarriers()
        else local c = Ws.ChildAdded:Connect(function(ch) if ch.Name == "Filter" then task.wait(0.5); if S.NoSpike.On then disBarriers() end; c:Disconnect() end end) end
        Lib:Notify("NoSpike on", 2)
    else
        if S.NoSpike.Conn then S.NoSpike.Conn:Disconnect(); S.NoSpike.Conn = nil end
        local ff = Ws:FindFirstChild("Filter"); if ff then
            local pf = ff:FindFirstChild("Parts"); if pf then
                local fp = pf:FindFirstChild("F_Parts"); if fp then
                    for _, d in pairs(fp:GetDescendants()) do if d:IsA("Part") or d:IsA("MeshPart") then d.CanTouch = true end end
                end
            end
        end
        Lib:Notify("NoSpike off", 2)
    end
end

local function updCamSet()
    if S.Cam.NoclipOn then LP.DevCameraOcclusionMode = Enum.DevCameraOcclusionMode.Invisicam
    else LP.DevCameraOcclusionMode = Enum.DevCameraOcclusionMode.Zoom end
end

local function findTP(name)
    for _, p in pairs(Plrs:GetPlayers()) do
        if string.lower(p.Name) == string.lower(name) or string.lower(p.DisplayName) == string.lower(name) then return p end
    end
    return nil
end

local function getHRP(c) return c and c:FindFirstChild("HumanoidRootPart") end

local function toggleFists()
    local c = LP.Character; if not c then return end
    local bp = LP:FindFirstChild("Backpack"); if not bp then return end
    for _, t in pairs(bp:GetChildren()) do if t:IsA("Tool") then t.Parent = bp; task.wait(0.2); t.Parent = c; break end end
end

local function enNoClip(c) if not c then return end; for _, p in pairs(c:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide = false end end end

local function startESpam()
    if S.Farm.EConn then S.Farm.EConn:Disconnect() end
    S.Farm.EConn = RS.Heartbeat:Connect(function()
        if Lib.Unloaded then if S.Farm.EConn then S.Farm.EConn:Disconnect(); S.Farm.EConn = nil end return end
        if not S.Farm.Enabled or S.Farm.Respawning then return end
        local c = LP.Character; if c then
            local vi = game:GetService("VirtualInputManager")
            vi:SendKeyEvent(true, Enum.KeyCode.E, false, game); task.wait(0.05); vi:SendKeyEvent(false, Enum.KeyCode.E, false, game)
        end
    end)
end

local function forceRespawn()
    if S.Farm.RespawnCD or S.Farm.Respawning then return end
    S.Farm.RespawnCD = true; S.Farm.Respawning = true
    local c = LP.Character; if c then local h = c:FindFirstChild("Humanoid"); if h then h.Health = 0 end end
    local vi = game:GetService("VirtualInputManager")
    vi:SendKeyEvent(true, Enum.KeyCode.E, false, game); task.wait(0.05); vi:SendKeyEvent(false, Enum.KeyCode.E, false, game)
    task.wait(0.3); vi:SendKeyEvent(true, Enum.KeyCode.E, false, game); task.wait(0.05); vi:SendKeyEvent(false, Enum.KeyCode.E, false, game)
    task.wait(0.2); vi:SendKeyEvent(true, Enum.KeyCode.E, false, game); task.wait(0.05); vi:SendKeyEvent(false, Enum.KeyCode.E, false, game)
    task.wait(0.5); S.Farm.RespawnCD = false; S.Farm.Respawning = false
end

local function startDmgDetect()
    if S.Farm.DmgConn then S.Farm.DmgConn:Disconnect() end
    S.Farm.DmgConn = RS.Heartbeat:Connect(function()
        if Lib.Unloaded then if S.Farm.DmgConn then S.Farm.DmgConn:Disconnect(); S.Farm.DmgConn = nil end return end
        if not S.Farm.Enabled or S.Farm.Respawning then return end
        local c = LP.Character; if not c then return end
        local h = c:FindFirstChild("Humanoid"); if not h then return end
        if h.MaxHealth > S.Farm.MaxHP then S.Farm.MaxHP = h.MaxHealth end
        if h.Health < S.Farm.MaxHP then forceRespawn() end
    end)
end

local function teleToTarget()
    if Lib.Unloaded then return end
    if not S.Farm.Enabled or S.Farm.Respawning then return end
    local myC = LP.Character; if not myC or not S.Farm.Target then return end
    local tC = S.Farm.Target.Character; if not tC then return end
    local myR = getHRP(myC); if not myR then return end
    enNoClip(myC)
    local tR = getHRP(tC); if not tR then return end
    local lv = tR.CFrame.LookVector
    local tPos = tR.Position + (lv * 2.5) + Vector3.new(0, 0.5, 0)
    local bCF = CFrame.new(tPos) * CFrame.Angles(0, math.pi, 0)
    myR.CFrame = bCF
end

local function teleToCube() if Lib.Unloaded then return end; local c = LP.Character; if not c then return end; local rp = getHRP(c); if not rp then return end; rp.CFrame = CFrame.new(SAVE_CUBE); Lib:Notify("To SaveCube", 2) end
local function teleToUnder() if Lib.Unloaded then return end; local c = LP.Character; if not c then return end; local rp = getHRP(c); if not rp then return end; rp.CFrame = CFrame.new(UNDER); Lib:Notify("To Underground", 2) end
local function teleToVibe() if Lib.Unloaded then return end; local c = LP.Character; if not c then return end; local rp = getHRP(c); if not rp then return end; rp.CFrame = CFrame.new(SAVE_VIBE); Lib:Notify("To SaveVibe", 2) end

local function CollectCore()
    local function runCollect()
        if not S.Collect.On or Set.IsDead then return end
        local bc = Ws.Filter:FindFirstChild("SpawnedBread"); if not bc then return end
        local pr = RepSt.Events:FindFirstChild("CZDPZUS"); if not pr then return end
        local c = LP.Character; local rp = c and c:FindFirstChild("HumanoidRootPart"); if not rp or CDs.Pick.MoneyCD then return end
        local cp = rp.Position
        for _, i in ipairs(bc:GetChildren()) do
            local dsq = (cp - i.Position).Magnitude^2
            if dsq < 25 and not CDs.Pick.MoneyCD then
                CDs.Pick.MoneyCD = true
                pcall(function() pr:FireServer(i) end)
                task.wait(1.1); CDs.Pick.MoneyCD = false; break
            end
        end
    end
    S.Collect.Sig = RS.RenderStepped:Connect(runCollect)
end

local function CollectOn()
    if S.Collect.On then return end; S.Collect.On = true
    if S.Collect.Sig then S.Collect.Sig:Disconnect(); S.Collect.Sig = nil end
    if S.Collect.Task then coroutine.close(S.Collect.Task); S.Collect.Task = nil end
    S.Collect.Task = coroutine.create(CollectCore); coroutine.resume(S.Collect.Task)
    Lib:Notify("AutoPick on!", 3)
end

local function CollectOff()
    if not S.Collect.On then return end; S.Collect.On = false
    if S.Collect.Sig then S.Collect.Sig:Disconnect(); S.Collect.Sig = nil end
    if CDs and CDs.Pick then CDs.Pick.MoneyCD = false end
    Lib:Notify("AutoPick off!", 3)
end

local function stopRagLoop() if RUNS.Rag then RUNS.Rag:Disconnect(); RUNS.Rag = nil end end
local function stopOldFly() if RUNS.Old then RUNS.Old:Disconnect(); RUNS.Old = nil end end
local function stopAllFly() stopRagLoop(); stopOldFly(); if hrp then hrp.Velocity = Vector3.new(0,0,0) end end

local function startRagLoop()
    if not ragEv or not hrp then return end
    stopRagLoop()
    RUNS.Rag = RS.RenderStepped:Connect(function()
        if not hrp or not S.Fly.On or S.Fly.Method ~= "Ragdoll" then stopAllFly(); return end
        ragEv:FireServer("__---r", Vector3.new(0,0,0), hrp.CFrame, false)
    end)
end

local function enRagFly()
    local c = me.Character or me.CharacterAdded:Wait(); hrp = c:FindFirstChild("HumanoidRootPart"); if not hrp then return end
    stopAllFly(); startRagLoop()
    RUNS.Old = RS.RenderStepped:Connect(function()
        if not hrp or not S.Fly.On or S.Fly.Method ~= "Ragdoll" then stopAllFly(); return end
        local cam = workspace.CurrentCamera; local mv = Vector3.new(0,0,0)
        if UIS:IsKeyDown(Enum.KeyCode.W) then mv = mv + cam.CFrame.LookVector * flySpd end
        if UIS:IsKeyDown(Enum.KeyCode.S) then mv = mv - cam.CFrame.LookVector * flySpd end
        if UIS:IsKeyDown(Enum.KeyCode.A) then mv = mv - cam.CFrame.RightVector * flySpd end
        if UIS:IsKeyDown(Enum.KeyCode.D) then mv = mv + cam.CFrame.RightVector * flySpd end
        hrp.Velocity = mv
        if flyEv then flyEv:FireServer("---r", Vector3.new(0,0,0), hrp.CFrame, false) end
    end)
end

local function enOldFly()
    stopAllFly()
    RUNS.Old = RS.RenderStepped:Connect(function()
        if not S.Fly.On or S.Fly.Method ~= "Old" then stopAllFly(); return end
        local p = me; local c = p.Character or p.CharacterAdded:Wait(); local rp = c:FindFirstChild("HumanoidRootPart")
        if rp then
            local cam = workspace.CurrentCamera; local md = Vector3.zero
            if UIS:IsKeyDown(Enum.KeyCode.W) then md = md + cam.CFrame.LookVector end
            if UIS:IsKeyDown(Enum.KeyCode.S) then md = md - cam.CFrame.LookVector end
            if UIS:IsKeyDown(Enum.KeyCode.A) then md = md - cam.CFrame.RightVector end
            if UIS:IsKeyDown(Enum.KeyCode.D) then md = md + cam.CFrame.RightVector end
            if UIS:IsKeyDown(Enum.KeyCode.Space) then md = md + Vector3.new(0,1,0) end
            if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then md = md - Vector3.new(0,1,0) end
            rp.CFrame = rp.CFrame + (md * 50 * RS.RenderStepped:Wait())
        end
    end)
end

local function applyFly()
    stopAllFly(); if not S.Fly.On then return end
    if S.Fly.Method == "Ragdoll" then enRagFly() else enOldFly() end
end

local function onCharAdd(c)
    if not S.Fly.On then return end; task.wait(0.5); c:WaitForChild("HumanoidRootPart"); task.wait(0.1)
    if S.Fly.On then applyFly() end
end

local function toggleFly(state)
    S.Fly.On = state; _G.FlyPersist = state
    if S.Fly.On then
        if LP.Character then applyFly() end
        Lib:Notify("Fly on ("..S.Fly.Method..")", 2)
    else stopAllFly(); Lib:Notify("Fly off", 2) end
end

local function AFKAction()
    pcall(function() VU:CaptureController(); VU:SetKeyDown('0x20'); task.wait(0.1); VU:SetKeyUp('0x20') end)
    pcall(function()
        local cam = workspace.CurrentCamera
        cam.CFrame = cam.CFrame * CFrame.Angles(math.rad(0.5),0,0)
        task.wait(0.1); cam.CFrame = cam.CFrame * CFrame.Angles(math.rad(-0.5),0,0)
    end)
end

local function toggleAFK(state)
    S.AntiAFK.On = state; _G.AFKPersist = state
    if S.AntiAFK.On then
        S.AntiAFK.IdleConn = LP.Idled:Connect(function() if S.AntiAFK.On then AFKAction() end end)
        S.AntiAFK.Coro = coroutine.create(function() while S.AntiAFK.On do AFKAction(); task.wait(30) end end)
        coroutine.resume(S.AntiAFK.Coro); Lib:Notify("AntiAFK on", 2)
    else
        if S.AntiAFK.IdleConn then S.AntiAFK.IdleConn:Disconnect(); S.AntiAFK.IdleConn = nil end
        S.AntiAFK.Coro = nil; Lib:Notify("AntiAFK off", 2)
    end
end

local staff = {
    groups = {
        [4165692] = {["Tester"]=true,["Contributor"]=true,["Tester+"]=true,["Developer"]=true,["Developer+"]=true,["Community Manager"]=true,["Manager"]=true,["Owner"]=true},
        [32406137] = {["Junior"]=true,["Moderator"]=true,["Senior"]=true,["Administrator"]=true,["Manager"]=true,["Holder"]=true},
        [14927228] = {["♞"]=true}
    },
    users = {3294804378,93676120,54087314,81275825,140837601,1229486091,46567801,418086275,29706395,3717066084,1424338327,5046662686,5046661126,5046659439,418199326,1024216621,1810535041,63238912,111250044,63315426,730176906,141193516,194512073,193945439,412741116,195538733,102045519,955294,957835150,25689921,366613818,281593651,455275714,208929505,96783330,156152502,93281166,959606619,142821118,632886139,175931803,122209625,278097946,142989311,1517131734,446849296,87189764,67180844,9212846,47352513,48058122,155413858,10497435,513615792,55893752,55476024,151691292,136584758,16983447,3111449,94693025,271400893,5005262660,295331237,64489098,244844600,114332275,25048901,69262878,50801509,92504899,42066711,50585425,31365111,166406495,2457253857,29761878,21831137,948293345,439942262,38578487,1163048,7713309208,3659305297,15598614,34616594,626833004,198610386,153835477,3923114296,3937697838,102146039,119861460,371665775,1206543842,93428604,1863173316,90814576,374665997,423005063,140172831,42662179,9066859,438805620,14855669,727189337,1871290386,608073286}
}

local function hasTrack(p)
    if not p or not p:IsA("Player") then return false, nil end
    for _, ch in pairs(p:GetChildren()) do
        if typeof(ch.Name) == "string" and string.sub(ch.Name, -8) == "Tracker$" then
            local tn = string.sub(ch.Name, 1, -9)
            if Plrs:FindFirstChild(tn) then return true, tn end
        end
    end
    return false, nil
end

local function isStaff(p)
    if not p or not p:IsA("Player") then return false end
    for gid, roles in pairs(staff.groups) do
        local suc, rank = pcall(function() return p:GetRankInGroup(gid) end)
        if suc and rank and rank > 0 then
            local suc2, role = pcall(function() return p:GetRoleInGroup(gid) end)
            if suc2 and role and roles[role] then return true, role, gid end
        end
    end
    for _, uid in ipairs(staff.users) do if p.UserId == uid then return true, "UserID", p.UserId end end
    return false
end

local function kickFmt(sInfo)
    if not sInfo or not sInfo.Staff then return "Staff found." end
    local msg = "Staff:\n"
    for i, s in ipairs(sInfo.Staff) do
        local idType = "Role"; local idVal = s.Role or "?"
        if s.Role == "UserID" then idType = "UserID"; idVal = s.GroupId or "?"
        elseif s.Role == "Tracker User" then idType = "Tracker"; idVal = "Active" end
        msg = msg .. string.format("- %s (%s: %s)%s", s.Name or "?", idType, idVal, s.TrackedP and " - Tracking: "..s.TrackedP or "")
        if i < #sInfo.Staff then msg = msg .. "\n" end
    end
    return msg
end

local function kickWithInfo(sInfo) local msg = kickFmt(sInfo); if LP then LP:Kick("Staff\n\n"..msg) end end

local function chkCurStaff()
    local found = {}; local cur = Plrs:GetPlayers()
    for i=1,#cur do local op = cur[i]; if op ~= LP then
        local isSt, role, gid = isStaff(op); local hasT, trackP = hasTrack(op)
        if isSt or hasT then table.insert(found, {Name=op.Name, Role=hasT and "Tracker User" or role, GroupId=gid, TrackedP=trackP}) end
    end end
    if #found > 0 then kickWithInfo({Staff=found}); return true end; return false
end

local function onPlayerJoin(op)
    if not S.AdminChk.On then return end
    local isSt, role, gid = isStaff(op); local hasT, trackP = hasTrack(op)
    if isSt or hasT then kickWithInfo({Staff={{Name=op.Name, Role=hasT and "Tracker User" or role, GroupId=gid, TrackedP=trackP}}}) end
end

local function toggleAdminChk(state)
    S.AdminChk.On = state
    if S.AdminChk.On then
        if S.AdminChk.Conn then S.AdminChk.Conn:Disconnect() end
        S.AdminChk.Conn = Plrs.PlayerAdded:Connect(onPlayerJoin)
        task.spawn(function() local found = chkCurStaff(); if found then S.AdminChk.On = false; if S.AdminChk.Conn then S.AdminChk.Conn:Disconnect(); S.AdminChk.Conn = nil end end end)
        Lib:Notify("AdminChk on", 2)
    else
        if S.AdminChk.Conn then S.AdminChk.Conn:Disconnect(); S.AdminChk.Conn = nil end
        Lib:Notify("AdminChk off", 2)
    end
end

local function enFB()
    if S.FullBright.On then return end
    S.FullBright.On = true; _G.FBPersist = true
    Lt.Brightness = 5; Lt.ClockTime = 14; Lt.Ambient = Color3.new(1,1,1); Lt.OutdoorAmbient = Color3.new(1,1,1)
    Lt.ColorShift_Top = Color3.new(0,0,0); Lt.FogStart = 100000; Lt.FogEnd = 100000
    S.FullBright.Conn = RS.RenderStepped:Connect(function()
        if not S.FullBright.On then if S.FullBright.Conn then S.FullBright.Conn:Disconnect(); S.FullBright.Conn = nil end return end
        if Lt.Brightness ~= 5 then Lt.Brightness = 5 end
        if Lt.ClockTime ~= 14 then Lt.ClockTime = 14 end
        if Lt.Ambient ~= Color3.new(1,1,1) then Lt.Ambient = Color3.new(1,1,1) end
        if Lt.OutdoorAmbient ~= Color3.new(1,1,1) then Lt.OutdoorAmbient = Color3.new(1,1,1) end
        if Lt.ColorShift_Top ~= Color3.new(0,0,0) then Lt.ColorShift_Top = Color3.new(0,0,0) end
        if Lt.FogStart ~= 100000 then Lt.FogStart = 100000 end
        if Lt.FogEnd ~= 100000 then Lt.FogEnd = 100000 end
    end)
    Lib:Notify("FullBright on!", 2)
end

local function disFB()
    if not S.FullBright.On then return end
    S.FullBright.On = false; _G.FBPersist = false
    if S.FullBright.Conn then S.FullBright.Conn:Disconnect(); S.FullBright.Conn = nil end
    Lt.Brightness = S.FullBright.OrigVals.Brightness; Lt.ClockTime = S.FullBright.OrigVals.ClockTime
    Lt.Ambient = S.FullBright.OrigVals.Ambient; Lt.OutdoorAmbient = S.FullBright.OrigVals.OutdoorAmbient
    Lt.ColorShift_Top = S.FullBright.OrigVals.ColorShift_Top; Lt.FogStart = S.FullBright.OrigVals.FogStart; Lt.FogEnd = S.FullBright.OrigVals.FogEnd
    Lib:Notify("FullBright off!", 2)
end

local function toggleFB(state) if state then enFB() else disFB() end end

task.spawn(function()
    while true do
        task.wait(10)
        if not S.FullBright.On then
            S.FullBright.OrigVals = {
                ClockTime = Lt.ClockTime, Brightness = Lt.Brightness, Ambient = Lt.Ambient,
                OutdoorAmbient = Lt.OutdoorAmbient, ColorShift_Top = Lt.ColorShift_Top,
                FogStart = Lt.FogStart, FogEnd = Lt.FogEnd,
            }
        end
    end
end)

local function FOV_on()
    if S.FOV.On then return end; S.FOV.On = true; _G.FOVPersist = true
    if S.FOV.Conn then S.FOV.Conn:Disconnect() end
    S.FOV.Conn = RS.RenderStepped:Connect(function() if S.FOV.On then Cam.FieldOfView = S.FOV.Val end end)
    Lib:Notify("FOV on", 2)
end

local function FOV_off()
    if not S.FOV.On then return end; S.FOV.On = false; _G.FOVPersist = false
    if S.FOV.Conn then S.FOV.Conn:Disconnect(); S.FOV.Conn = nil end
    Cam.FieldOfView = S.FOV.OrigVal; Lib:Notify("FOV off", 2)
end

local function toggleFOV(state) if state then FOV_on() else FOV_off() end end

local skyboxes = {
    ["Nebula"] = {MoonTex="rbxassetid://1075087760", SkyBk="rbxassetid://2118763079", SkyDn="rbxassetid://2118766919", SkyFt="rbxassetid://2118765204", SkyLf="rbxassetid://2118764070", SkyRt="rbxassetid://2118761853", SkyUp="rbxassetid://2118766003", Stars=0},
    ["Red Nebula"] = {MoonTex="rbxassetid://1075087760", SkyBk="rbxassetid://75202130006087", SkyDn="rbxassetid://84899615600068", SkyFt="rbxassetid://123583852168685", SkyLf="rbxassetid://91852061002963", SkyRt="rbxassetid://138329424663418", SkyUp="rbxassetid://98269626597694", Stars=0},
    ["Nebula Pink"] = {MoonTex="rbxasset://sky/moon.jpg", SkyBk="rbxassetid://13581437029", SkyDn="rbxassetid://13581439832", SkyFt="rbxassetid://13581447312", SkyLf="rbxassetid://13581443463", SkyRt="rbxassetid://13581452875", SkyUp="rbxassetid://13581450222", Stars=3000},
    ["White Galaxy"] = {MoonTex="rbxasset://sky/moon.jpg", SkyBk="rbxassetid://5540798456", SkyDn="rbxassetid://5540799894", SkyFt="rbxassetid://5540801779", SkyLf="rbxassetid://5540801192", SkyRt="rbxassetid://5540799108", SkyUp="rbxassetid://5540800635", Stars=5000, SunSize=1, SunTex="rbxasset://sky/sun.jpg"},
    ["Purple Nebula"] = {MoonTex="rbxasset://sky/moon.jpg", SkyBk="rbxassetid://94797807540176", SkyDn="rbxassetid://135040133024386", SkyFt="rbxassetid://134956217810021", SkyLf="rbxassetid://77274943792368", SkyRt="rbxassetid://86193107896056", SkyUp="rbxassetid://72286287669628", Stars=3000, SunSize=11, SunTex="rbxasset://sky/sun.jpg"}
}

local function enSky(sName)
    if not skyboxes[sName] then Lib:Notify("Invalid sky!", 2); return false end
    local data = skyboxes[sName]
    if not S.Sky.Orig then
        local ex = Lt:FindFirstChildOfClass("Sky")
        if ex then S.Sky.Orig = ex:Clone() end
    end
    for _, ch in pairs(Lt:GetChildren()) do if ch:IsA("Sky") then ch:Destroy() end end
    local sk = Instance.new("Sky"); sk.Name = "CustomSky"; sk.Parent = Lt
    sk.MoonTextureId = data.MoonTex; sk.SkyboxBk = data.SkyBk; sk.SkyboxDn = data.SkyDn
    sk.SkyboxFt = data.SkyFt; sk.SkyboxLf = data.SkyLf; sk.SkyboxRt = data.SkyRt; sk.SkyboxUp = data.SkyUp
    sk.SkyboxOrientation = Vector3.new(0,0,0); sk.StarCount = data.Stars
    if data.SunSize then sk.SunAngularSize = data.SunSize end
    if data.SunTex then sk.SunTextureId = data.SunTex end
    S.Sky.Custom = sk; S.Sky.Selected = sName; S.Sky.On = true
    Lib:Notify(sName.." sky on!", 2); return true
end

local function disSky()
    for _, ch in pairs(Lt:GetChildren()) do if ch:IsA("Sky") then ch:Destroy() end end
    if S.Sky.Custom then S.Sky.Custom:Destroy(); S.Sky.Custom = nil end
    if S.Sky.Orig then S.Sky.Orig:Clone().Parent = Lt; Lib:Notify("Orig sky back", 2) else Lib:Notify("Sky off", 2) end
    S.Sky.On = false; S.Sky.Selected = nil
end

local function setFOVVal(v) S.FOV.Val = v; if S.FOV.On then Cam.FieldOfView = v end; Lib:Notify("FOV: "..v, 2) end

local function getClosest()
    local closest = nil; local minD = RSett.MaxDist; local myC = LP.Character; local myR = getHRP(myC); if not myR then return nil end
    if S.Rage.UseList then
        local cnt = 0; for _ in pairs(S.Rage.List) do cnt=cnt+1 end; if cnt==0 then return nil end
        for _, p in ipairs(Plrs:GetPlayers()) do
            if p ~= LP then
                local should = false
                for tn, _ in pairs(S.Rage.List) do if p.Name == tn then should = true; break end end
                if should then
                    local eC = p.Character; local eR = eC and eC:FindFirstChild("HumanoidRootPart"); local eH = eC and eC:FindFirstChildOfClass("Humanoid")
                    if eR and eH and eH.Health > RSett.MinHP and not eC:FindFirstChildOfClass("ForceField") then
                        local d = (myR.Position - eR.Position).Magnitude
                        if d < minD then minD = d; closest = p end
                    end
                end
            end
        end
    else
        for _, p in ipairs(Plrs:GetPlayers()) do
            if p ~= LP then
                local eC = p.Character; local eR = eC and eC:FindFirstChild("HumanoidRootPart"); local eH = eC and eC:FindFirstChildOfClass("Humanoid")
                if eR and eH and eH.Health > RSett.MinHP and not eC:FindFirstChildOfClass("ForceField") then
                    local d = (myR.Position - eR.Position).Magnitude
                    if d < minD then minD = d; closest = p end
                end
            end
        end
    end
    return closest
end

local function Shoot(t)
    if Lib.Unloaded or not S.Rage.On then return end
    if not t or not t.Character then return end
    local tp = t.Character:FindFirstChild("Head") or t.Character:FindFirstChild("HumanoidRootPart")
    if not tp then return end
    local myC = LP.Character
    local tool = myC and myC:FindFirstChildOfClass("Tool")
    if not tool then return end
    local myR = myC:FindFirstChild("HumanoidRootPart")
    local eR = t.Character:FindFirstChild("HumanoidRootPart")
    if myR and eR then
        local d = (myR.Position - eR.Position).Magnitude
        if d > RSett.MaxDist then return end
    end
    local cam = workspace.CurrentCamera
    local hitPos = tp.Position
    local hitDir = (hitPos - cam.CFrame.Position).Unit
    
    -- Добавляем предсказание и случайное смещение как в Silent Aim
    if S.AimBot.Prediction > 0 then
        local velocity = eR and eR.Velocity or Vector3.new(0,0,0)
        local predictionMultiplier = S.AimBot.Prediction / 100
        hitPos = hitPos + (velocity * predictionMultiplier * 0.1)
    end
    
    local rOff = Vector3.new((math.random()-0.5)*0.5, (math.random()-0.5)*0.5, (math.random()-0.5)*0.5)
    hitPos = hitPos + rOff
    hitDir = (hitPos - cam.CFrame.Position).Unit
    
    local rKey = randStr(30) .. "0"
    if not GNX or not ZFK then return end
    
    pcall(function() GNX:FireServer(tick(), rKey, tool, "FDS9I83", cam.CFrame.Position, {hitDir}, false) end)
    pcall(function() ZFK:FireServer("🧈", tool, rKey, 1, tp, hitPos, hitDir, nil, nil) end)
    
    -- Добавляем трейсер для BulletBeam при стрельбе с Ragebot
    if BB.On then
        local mzl = findMzl(tool)
        local mzlPos = mzl and mzl.Position or cam.CFrame.Position
        crTracer(mzlPos, hitPos, BB.Col)
    end
    
    if tp and tp.Name == "Head" then
        PlayHSound()
    end
end

local function RageLoop()
    while S.Rage.On do
        local myC = LP.Character; if myC and myC:FindFirstChildOfClass("Tool") then
            local t = getClosest(); S.Rage.Target = t; if t then Shoot(t) end
        else S.Rage.Target = nil end
        task.wait(RSett.FireDelay)
    end
    S.Rage.Target = nil
end

local function Rage_setDist(v) RSett.MaxDist = v end
local function Rage_setMinHP(v) RSett.MinHP = v end
local function Rage_setFR(v) local t = math.clamp(v,1,100); RSett.FireDelay = 0.5 - ((t-1)/99)*(0.5-0.01) end
local function Rage_setHM(v) RSett.Hitmarkers = v end

local function Rage_on()
    if S.Rage.On then return end; S.Rage.On = true
    if not S.Rage.Task then S.Rage.Task = task.spawn(RageLoop) end
    Lib:Notify("Rage on", 3)
end

local function Rage_off()
    S.Rage.On = false; if S.Rage.Task then task.cancel(S.Rage.Task); S.Rage.Task = nil end
    Lib:Notify("Rage off", 3)
end

local gunR = RepSt.Events:FindFirstChild("GNX_R")

local function setupInstReload(c)
    if not c or not S.InstReload.On then return end
    local function setupTool(t)
        if not t or not t:FindFirstChild("IsGun") then return end
        local vals = t:FindFirstChild("Values"); if not vals then return end
        local ammo = vals:FindFirstChild("SERVER_Ammo"); local stored = vals:FindFirstChild("SERVER_StoredAmmo")
        if not ammo or not stored then return end
        local c1 = stored:GetPropertyChangedSignal("Value"):Connect(function() if stored.Value ~= 0 then gunR:FireServer(tick(), "KLWE89U0", t) end end)
        local c2 = ammo:GetPropertyChangedSignal("Value"):Connect(function() if stored.Value ~= 0 then gunR:FireServer(tick(), "KLWE89U0", t) end end)
        table.insert(S.InstReload.Conns, c1); table.insert(S.InstReload.Conns, c2)
        if stored.Value ~= 0 then gunR:FireServer(tick(), "KLWE89U0", t) end
    end
    for _, t in pairs(c:GetChildren()) do if t:IsA("Tool") and t:FindFirstChild("IsGun") then setupTool(t) end end
    local c3 = c.ChildAdded:Connect(function(t) if t:IsA("Tool") and t:FindFirstChild("IsGun") then wait(0.1); setupTool(t) end end)
    table.insert(S.InstReload.Conns, c3)
end

local function toggleInstReload(state)
    S.InstReload.On = state
    if S.InstReload.On then
        for _, c in pairs(S.InstReload.Conns) do if c then c:Disconnect() end end
        S.InstReload.Conns = {}
        if LP.Character then setupInstReload(LP.Character) end
        local c = LP.CharacterAdded:Connect(function(c) wait(0.5); if S.InstReload.On then setupInstReload(c) end end)
        table.insert(S.InstReload.Conns, c)
        Lib:Notify("InstReload on", 2)
    else
        for _, c in pairs(S.InstReload.Conns) do if c then c:Disconnect() end end
        S.InstReload.Conns = {}; Lib:Notify("InstReload off", 2)
    end
end

local function MeleeA_on()
    if S.MeleeA.On then return end
    local plrs = game:GetService("Players"); local me = plrs.LocalPlayer; local run = RS
    local rep = RepSt; local evf = rep:WaitForChild("Events")
    local rf = evf:WaitForChild("XMHH.2"); local re = evf:WaitForChild("XMHH2.2")
    local maxd = 5
    local function Attack(t)
        if not (t and t:FindFirstChild("Head")) then return end
        local c = me.Character; local tool = c and c:FindFirstChildOfClass("Tool"); local hrp = c and c:FindFirstChild("HumanoidRootPart")
        if not rf or not rf:IsA("RemoteFunction") then warn("MeleeA err: no RF"); return end
        if not re or not re:IsA("RemoteEvent") then warn("MeleeA err: no RE"); return end
        local a1 = {[1]="🍞",[2]=tick(),[3]=tool,[4]="43TRFWX",[5]="Normal",[6]=tick(),[7]=true}
        local suc, res = pcall(function() return rf:InvokeServer(unpack(a1)) end)
        if not suc then warn("MeleeA invoke fail:", res); return end
        task.wait(0.1)
        local h = tool and (tool:FindFirstChild("WeaponHandle") or tool:FindFirstChild("Handle")) or (c and c:FindFirstChild("Right Arm"))
        local head = t:FindFirstChild("Head")
        if h and head and hrp then
            local a2 = {[1]="🍞",[2]=tick(),[3]=tool,[4]="2389ZFX34",[5]=res,[6]=false,[7]=h,[8]=head,[9]=t,[10]=hrp.Position,[11]=head.Position}
            local suc2, err2 = pcall(function() re:FireServer(unpack(a2)) end)
            if not suc2 then warn("MeleeA fire fail:", err2) end
        end
    end
    S.MeleeA.On = true; _G.MeleePersist = true
    S.MeleeA.Conn = run.RenderStepped:Connect(function()
        if not S.MeleeA.On then return end
        local c = me.Character; local hrp = c and c:FindFirstChild("HumanoidRootPart")
        if hrp then for _, p in ipairs(plrs:GetPlayers()) do
            if p ~= me then
                local ec = p.Character; local ehrp = ec and ec:FindFirstChild("HumanoidRootPart"); local eh = ec and ec:FindFirstChildOfClass("Humanoid")
                if ehrp and eh then
                    local d = (hrp.Position - ehrp.Position).Magnitude
                    if d < maxd and eh.Health > 15 and not ec:FindFirstChildOfClass("ForceField") then Attack(ec) end
                end
            end
        end end
    end)
    Lib:Notify("MeleeA on", 2)
end

local function MeleeA_off()
    if not S.MeleeA.On then return end; S.MeleeA.On = false; _G.MeleePersist = false
    if S.MeleeA.Conn then S.MeleeA.Conn:Disconnect(); S.MeleeA.Conn = nil end
    Lib:Notify("MeleeA off", 2)
end

local function toggleMeleeA(state) if state then MeleeA_on() else MeleeA_off() end end

_G.ActivateShadow = function() if S.Shadow.Active or not S.Shadow.Usable then return end; S.Shadow.Active = true; _G.InvPersist = true; Lib:Notify("Inv on", 2) end
_G.DeactivateShadow = function() if not S.Shadow.Active then return end; S.Shadow.Active = false; _G.InvPersist = false; Lib:Notify("Inv off", 2) end
_G.IsShadowActive = function() return S.Shadow.Active end
local function toggleInv(state) if state then _G.ActivateShadow() else _G.DeactivateShadow() end end

task.spawn(function()
    repeat task.wait() until game:IsLoaded()
    local svc_ref = cloneref or function(...) return ... end
    local GS = setmetatable({}, {__index = function(_,k) return svc_ref(game:GetService(k)) end})
    local P = Plrs.LocalPlayer; local C = P.Character or P.CharacterAdded:Wait(); local H; local HRP
    local function refresh() C = P.Character; if C then HRP = C:FindFirstChild("HumanoidRootPart"); H = C:FindFirstChildOfClass("Humanoid") else HRP=nil; H=nil end end
    refresh()
    local animCache = nil; local camoAnim = Instance.new("Animation", nil); camoAnim.AnimationId = "rbxassetid://215384594"
    local RS2 = GS.RunService; local UpdF = RS2.Heartbeat; local WaitR = RS2.RenderStepped
    local CG = GS.CoreGui; local SG = GS.StarterGui
    local HUD = Instance.new("ScreenGui"); HUD.Name = "ShadowWarningHUD"; HUD.Parent = CG; HUD.ResetOnSpawn = false; HUD.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    local WarnTxt = Instance.new("TextLabel", HUD); WarnTxt.Text = "⚠️Visible⚠️"; WarnTxt.Visible = false
    WarnTxt.Size = UDim2.new(0,200,0,30); WarnTxt.Position = UDim2.new(0.5,-100,0.85,0); WarnTxt.BackgroundTransparency = 1
    WarnTxt.Font = Enum.Font.GothamSemibold; WarnTxt.TextSize = 24; WarnTxt.TextColor3 = Color3.fromRGB(255,255,0); WarnTxt.TextStrokeTransparency = 0.5; WarnTxt.ZIndex = 10
    if C and not C:FindFirstChild("Torso") then
        pcall(function() SG:SetCore("SendNotification", {Title="Shadow FAIL", Text="Need R6", Duration=5}) end)
        S.Shadow.Usable = false
    end
    local function chkGround() return H and H:IsDescendantOf(workspace) and H.FloorMaterial ~= Enum.Material.Air end
    local function cacheAnim()
        if animCache then pcall(function() animCache:Stop() end); animCache = nil end
        if H then local suc, res = pcall(function() return H:LoadAnimation(camoAnim) end); if suc then animCache = res; animCache.Priority = Enum.AnimationPriority.Action4 else animCache = nil end
        else animCache = nil end
    end
    local function applyShadow(dt)
        if not S.Shadow.Active or not S.Shadow.Usable then return end
        if not C or not H or not HRP or not H:IsDescendantOf(workspace) or H.Health <= 0 then WarnTxt.Visible = false; return end
        WarnTxt.Visible = not chkGround()
        local initCF = HRP.CFrame; local initCamOff = H.CameraOffset
        local _, yaw = workspace.CurrentCamera.CFrame:ToOrientation()
        HRP.CFrame = CFrame.new(HRP.CFrame.Position) * CFrame.fromOrientation(0,yaw,0)
        HRP.CFrame = HRP.CFrame * CFrame.Angles(math.rad(90),0,0); H.CameraOffset = Vector3.new(0,1.44,0)
        if animCache then local suc = pcall(function() if not animCache.IsPlaying then animCache:Play() end; animCache:AdjustSpeed(0); animCache.TimePosition = 0.3 end)
            if not suc then cacheAnim() end
        elseif H and H.Health > 0 then cacheAnim() end
        WaitR:Wait()
        if H and H:IsDescendantOf(workspace) then H.CameraOffset = initCamOff end
        if HRP and HRP:IsDescendantOf(workspace) then HRP.CFrame = initCF end
        if H and H:IsDescendantOf(workspace) and H.MoveDirection.Magnitude > 0 then
            local ws = 12; local vo = H.MoveDirection * ws * dt; HRP.CFrame = HRP.CFrame + vo
        end
        if animCache then pcall(function() animCache:Stop() end) end
        if HRP and HRP:IsDescendantOf(workspace) then
            local lv = workspace.CurrentCamera.CFrame.LookVector; local flat = Vector3.new(lv.X,0,lv.Z).Unit
            if flat.Magnitude > 0.1 then local fCF = CFrame.new(HRP.Position, HRP.Position+flat); HRP.CFrame = fCF end
        end
        if C then for _, v in pairs(C:GetDescendants()) do if v:IsA("BasePart") and v.Transparency ~= 1 then v.Transparency = 0.5 end end end
    end
    local shadowConn = UpdF:Connect(function(dt)
        if not S.Shadow.Active or not S.Shadow.Usable then
            if not S.Shadow.Active and C then for _, v in pairs(C:GetDescendants()) do if v:IsA("BasePart") and v.Transparency == 0.5 then v.Transparency = 0 end end end
            WarnTxt.Visible = false; return
        end
        applyShadow(dt)
    end)
    P.CharacterAdded:Connect(function(nc)
        if animCache then pcall(function() animCache:Stop() end); animCache = nil end
        task.wait(0.5); refresh()
        if not H then task.wait(0.5); refresh(); if not H then S.Shadow.Usable = false; if S.Shadow.Active then _G.DeactivateShadow() end
            pcall(function() SG:SetCore("SendNotification", {Title="Shadow Err", Text="No char type", Duration=5}) end) return end end
        if H.RigType ~= Enum.HumanoidRigType.R6 then
            S.Shadow.Usable = false; if S.Shadow.Active then _G.DeactivateShadow() end
            pcall(function() SG:SetCore("SendNotification", {Title="Shadow Warn", Text="Non-R6 ("..tostring(H.RigType)..")", Duration=5}) end)
            return
        else S.Shadow.Usable = true end
        if _G.InvPersist and S.Shadow.Usable then task.wait(1); _G.ActivateShadow(); Lib:Notify("Inv restored", 2) end
    end)
    P.CharacterRemoving:Connect(function(oc) if animCache then pcall(function() animCache:Stop() end); animCache = nil end; WarnTxt.Visible = false end)
    if _G.InvPersist and S.Shadow.Usable then task.wait(2); _G.ActivateShadow() end
end)

SA = {
    On = false, DrawCircle = true, DrawSize = 120, ChkDowned = true, ChkTeam = true, VisChk = false,
    MaxDist = 300, AutoWall = true, HitChance = 80, UseFOV = true, Debug = false,
    FOVCol = Color3.fromRGB(255,0,0), TMode = "Head",
    Parts = {["Head"]={"Head"}, ["Torso"]={"UpperTorso","LowerTorso","HumanoidRootPart"}, ["Random"]={"Head","UpperTorso","LowerTorso","HumanoidRootPart","LeftUpperArm","RightUpperArm","LeftUpperLeg","RightUpperLeg"}}
}

SACircle = nil
local function crFOVCircle()
    if SACircle then SACircle:Remove(); SACircle = nil end
    if SA.DrawCircle and Drawing then
        SACircle = Drawing.new("Circle"); SACircle.Color = SA.FOVCol; SACircle.Filled = false
        SACircle.Thickness = 2; SACircle.Radius = SA.DrawSize; SACircle.Visible = true; SACircle.Transparency = 1
    end
end

local function getValidT()
    if not SA.On then return nil end
    local t = nil; local minD = math.huge; local centerPos = Vector2.new(Cam.ViewportSize.X/2, Cam.ViewportSize.Y/2)
    for _, p in pairs(Plrs:GetPlayers()) do
        if p == LP then continue end; if not p.Character then continue end
        if SA.ChkTeam and p.Team == LP.Team then continue end
        local c = p.Character; local h = c:FindFirstChildOfClass("Humanoid")
        if not h or h.Health <= 0 then continue end
        local validP = SA.Parts[SA.TMode]; if not validP then validP = {"Head"} end
        local avail = {}; for _, pn in ipairs(validP) do local pt = c:FindFirstChild(pn); if pt then table.insert(avail, {Part=pt, Name=pn}) end end
        if #avail == 0 then continue end
        local sel = nil
        if SA.TMode == "Head" then sel = avail[1]
        elseif SA.TMode == "Torso" then sel = avail[math.random(1,#avail)]
        elseif SA.TMode == "Random" then sel = avail[math.random(1,#avail)]
        else sel = avail[1] end
        if not sel then continue end
        local tp = sel.Part; local pPos = tp.Position
        local myC = LP.Character; local myR = myC and myC:FindFirstChild("HumanoidRootPart")
        if myR then local d = (myR.Position - pPos).Magnitude; if d > SA.MaxDist then continue end end
        local sPos, onSc = Cam:WorldToViewportPoint(pPos); if not onSc then continue end
        if SA.UseFOV then
            local sPt = Vector2.new(sPos.X, sPos.Y); local dToM = (centerPos - sPt).Magnitude
            if dToM > SA.DrawSize then continue end
            if dToM < minD then minD = dToM; t = {Player=p, Char=c, Part=tp, PName=sel.Name, Pos=pPos, Dist=dToM, ScPos=sPos, WDist=(myR and (myR.Position-pPos).Magnitude) or 0} end
        else
            if myR then local wd = (myR.Position - pPos).Magnitude; if wd < minD then minD = wd; t = {Player=p, Char=c, Part=tp, PName=sel.Name, Pos=pPos, Dist=0, ScPos=sPos, WDist=wd} end end
        end
    end
    if t then local ch = math.random(1,100); if ch > SA.HitChance then return nil end end
    return t
end

local function canFire(t) if not t then return false end; if SA.UseFOV and t.Dist > SA.DrawSize then return false end; return true end

SALoopConn = nil
local function updFOVCircle()
    if SACircle and SA.DrawCircle then
        SACircle.Position = Vector2.new(Cam.ViewportSize.X/2, Cam.ViewportSize.Y/2)
        SACircle.Radius = SA.DrawSize; SACircle.Visible = SA.On; SACircle.Color = SA.FOVCol
    end
end

local function startSALoop()
    if SALoopConn then SALoopConn:Disconnect() end
    SALoopConn = RS.Heartbeat:Connect(function() updFOVCircle(); _G.CurSATarget = getValidT() end)
end

SAConns = {}; local lastT = nil; local lastDmg = false

local function hookShoot()
    for _, c in pairs(SAConns) do if c then c:Disconnect() end end; SAConns = {}
    local ev2 = RepSt:FindFirstChild("Events2")
    if ev2 then
        local viz = ev2:FindFirstChild("Visualize")
        if viz then
            local c = viz.Event:Connect(function(_, sc, _, gun, _, sPos, bps)
                if not SA.On then return end
                local t = getValidT(); if not t or not canFire(t) then lastT = nil; lastDmg = false; return end
                lastT = t; local c = LP.Character; if not c then return end
                local myG = c:FindFirstChildOfClass("Tool"); if not myG or myG ~= gun then return end
                local h = t.Char:FindFirstChildOfClass("Humanoid"); if not h or h.Health <= 0 then return end
                local tp = t.Part; local pPos = tp.Position
                local rOff = Vector3.new((math.random()-0.5)*0.5,(math.random()-0.5)*0.5,(math.random()-0.5)*0.5)
                local hitPos = pPos + rOff
                local newB = {}; for i=1,#bps do
                    local dir = (hitPos - sPos).Unit; local spAmt = (100 - SA.HitChance)/500
                    local sp = Vector3.new((math.random()-0.5)*spAmt,(math.random()-0.5)*spAmt,(math.random()-0.5)*spAmt)
                    table.insert(newB, dir+sp)
                end
                lastDmg = true
                local function playHit() if not HSett.On then return end; PlayHSound() end
                task.spawn(function()
                    for i=1,#newB do task.wait(0.01); pcall(function() ZFK:FireServer("🧈", gun, sc, i, tp, hitPos, newB[i]) end) end
                    playHit(); Lib:Notify(string.format("Hit: %s (%s)", t.Player.Name, t.PName), 2)
                end)
                if BB.On and lastDmg then local mzl = findMzl(gun); local mzlPos = mzl and mzl.Position or sPos; for _, dir in pairs(newB) do crTracer(mzlPos, hitPos, Color3.fromRGB(0,255,0)) end end
                if gun:FindFirstChild("Hitmarker") and lastDmg then gun.Hitmarker:Fire(tp) end
                if lastDmg then return _, sc, _, gun, _, sPos, newB end
                return _, sc, _, gun, _, sPos, bps
            end)
            table.insert(SAConns, c)
        end
    end
    if GNX then
        local c = GNX.OnClientEvent:Connect(function(st, sc, gun, ft, sPos, dirs, silenced)
            if not SA.On then return end
            local t = getValidT(); if not t or not canFire(t) then lastT = nil; lastDmg = false; return end
            lastT = t; local c = LP.Character; if not c then return end
            local myG = c:FindFirstChildOfClass("Tool"); if not myG or myG ~= gun then return end
            local h = t.Char:FindFirstChildOfClass("Humanoid"); if not h or h.Health <= 0 then return end
            local tp = t.Part; local pPos = tp.Position
            local rOff = Vector3.new((math.random()-0.5)*0.5,(math.random()-0.5)*0.5,(math.random()-0.5)*0.5)
            local hitPos = pPos + rOff
            local newD = {}; for i=1,#dirs do
                local dir = (hitPos - sPos).Unit; local spAmt = (100 - SA.HitChance)/400
                local sp = Vector3.new((math.random()-0.5)*spAmt,(math.random()-0.5)*spAmt,(math.random()-0.5)*spAmt)
                table.insert(newD, dir+sp)
            end
            lastDmg = true
            local function playHit() if not HSett.On then return end; PlayHSound() end
            task.spawn(function()
                for i=1,#newD do task.wait(0.01); pcall(function() ZFK:FireServer("🧈", gun, sc, i, tp, hitPos, newD[i]) end) end
                playHit(); Lib:Notify(string.format("Hit: %s (%s)", t.Player.Name, t.PName), 2)
            end)
            if BB.On and lastDmg then local mzl = findMzl(gun); local mzlPos = mzl and mzl.Position or sPos; for _, dir in pairs(newD) do crTracer(mzlPos, hitPos, Color3.fromRGB(0,255,0)) end end
            if gun:FindFirstChild("Hitmarker") and lastDmg then gun.Hitmarker:Fire(tp) end
            if lastDmg then return st, sc, gun, ft, sPos, newD, silenced end
            return st, sc, gun, ft, sPos, dirs, silenced
        end)
        table.insert(SAConns, c)
    end
end

local function toggleSA(state)
    if state and SA.On then return end; if not state and not SA.On then return end
    SA.On = state
    if state then
        crFOVCircle(); startSALoop(); hookShoot(); Lib:Notify("SA on", 2)
    else
        if SALoopConn then SALoopConn:Disconnect(); SALoopConn = nil end
        if SACircle then SACircle:Remove(); SACircle = nil end
        for _, c in pairs(SAConns) do if c then c:Disconnect() end end; SAConns = {}
        _G.CurSATarget = nil; lastT = nil; lastDmg = false; Lib:Notify("SA off", 2)
    end
end

local function cleanupSA()
    if SA.On then toggleSA(false) end
    if SACircle then SACircle:Remove(); SACircle = nil end
    for _, c in pairs(SAConns) do if c then c:Disconnect() end end; SAConns = {}
    if SALoopConn then SALoopConn:Disconnect(); SALoopConn = nil end
    _G.CurSATarget = nil; lastT = nil; lastDmg = false
    SA = {On=false, DrawCircle=true, DrawSize=120, ChkDowned=true, ChkTeam=true, VisChk=false, MaxDist=300, AutoWall=true, HitChance=80, UseFOV=true, Debug=false, FOVCol=Color3.fromRGB(255,0,0), TMode="Head", Parts={["Head"]={"Head"},["Torso"]={"UpperTorso","LowerTorso","HumanoidRootPart"},["Random"]={"Head","UpperTorso","LowerTorso","HumanoidRootPart"}}}
    if Toggles and Toggles.SAToggle then Toggles.SAToggle:SetValue(false) end
end

local function setupPersist()
    LP.CharacterAdded:Connect(function(c)
        task.wait(1)
        if _G.FlyPersist then task.wait(0.5); toggleFly(true); Lib:Notify("Fly restored", 2) end
        if _G.InvPersist then task.wait(1); toggleInv(true) end
        if _G.MeleePersist then task.wait(1.5); toggleMeleeA(true); Lib:Notify("MeleeA restored", 2) end
        if _G.NoclipPersist then task.wait(2); toggleNoclip(true); Lib:Notify("Noclip restored", 2) end
        if _G.AFKPersist then task.wait(2.5); toggleAFK(true); Lib:Notify("AFK restored", 2) end
        if _G.FBPersist then task.wait(3); toggleFB(true); Lib:Notify("FB restored", 2) end
        if _G.FOVPersist then task.wait(3.5); toggleFOV(true); Lib:Notify("FOV restored", 2) end
        if _G.BBPersist then task.wait(4); toggleBB(true); Lib:Notify("BB restored", 2) end
    end)
end

setupPersist()

SkinState = {
    On = false, Auto = false, Class = "Pistols", Weapon = nil, Skin = nil, Equipped = {}, Conns = {}, Loaded = false,
    Classes = {"Armors","Melees","GrenadeLaunchers","Pistols","Snipers","SMGS","Rifles","Shotguns"}
}

local function G17Sights(tool, mat, col)
    for _, v in pairs(tool:GetDescendants()) do
        if v.Name == "FrontSightColorPart" or v.Name == "RearSightColorPart" then
            v.Transparency = 0; if mat then v.Material = mat end; v.Color = col
        end
    end
    return true
end

local function Balisong(tool, tex)
    if tool:IsA("Tool") then
        local dir = game:GetService("ReplicatedStorage"):WaitForChild("Storage"):FindFirstChild("SkinVariants"):FindFirstChild("Melees")
        local cl = dir.balisong_stilleto:Clone(); local h = tool:WaitForChild("WeaponHandle"); local ch = cl.WeaponHandle
        ch.WeaponHandle2.BladeMesh.TextureID = tex; ch.WeaponHandle2.HandleMesh.TextureID = tex
        h.WeaponHandle2:Destroy(); h.Handle6D:Destroy()
        ch.WeaponHandle2.Parent = h; ch.Handle6D.Parent = h; h.Handle6D.Part0 = h; cl:Destroy()
    end
    return true
end

local function Bat(tool, tex)
    local bat = tool:FindFirstChild("Bat", true); if not bat then return false end
    bat.MeshId = "rbxassetid://15447781718"; bat.TextureID = tex; bat.Size = Vector3.new(0.002,0.027,0.002); return true
end

local function Chainsaw(tool)
    if tool.ClassName == "Tool" then
        local dir = game:GetService("ReplicatedStorage"):WaitForChild("Storage"):WaitForChild("SkinVariants")
        local rep = dir.Melees.chainsaw_rip:Clone(); local h = tool:WaitForChild("WeaponHandle")
        for _, v in pairs(rep.WeaponHandle:GetChildren()) do
            if h:FindFirstChild(v.Name) then h:FindFirstChild(v.Name):Destroy() end
            if v:IsA("Motor6D") then v.Part0 = h end; v.Parent = h
        end
        rep:Destroy()
    end
    return true
end

local function Fireaxe(tool, tex)
    if tool:IsA("Tool") then
        local dir = game:GetService("ReplicatedStorage"):WaitForChild("Storage"):FindFirstChild("SkinVariants"):FindFirstChild("Melees")
        local cl = dir.fireaxe_tactical:Clone(); local h = tool:WaitForChild("WeaponHandle"); local ch = cl.WeaponHandle
        ch.TacticalFireAxeMesh.TextureID = tex
        for _, v in cl:GetChildren() do if h:FindFirstChild(v.Name) then h:FindFirstChild(v.Name):Destroy() end; v.Parent = h end
        h.ManualWeld.Part1 = ch.TacticalFireAxeMesh; h.ManualWeld.Part0 = h; h.ManualWeld.C0 = ch.ManualWeld.C0; h.ManualWeld.C1 = ch.ManualWeld.C1
        cl:Destroy()
    end
    return true
end

local function Machete(tool, tex)
    if tool:IsA("Tool") then
        local dir = game:GetService("ReplicatedStorage"):WaitForChild("Storage"):FindFirstChild("SkinVariants"):FindFirstChild("Melees")
        local cl = dir.machete_zk:Clone(); local h = tool:WaitForChild("WeaponHandle"); local ch = cl.WeaponHandle
        ch.MacheteMesh.TextureID = tex
        for _, v in cl:GetChildren() do if h:FindFirstChild(v.Name) then h:FindFirstChild(v.Name):Destroy() end; v.Parent = h end
        h.ManualWeld.Part1 = ch.MacheteMesh; h.ManualWeld.Part0 = h; h.ManualWeld.C0 = ch.ManualWeld.C0; h.ManualWeld.C1 = ch.ManualWeld.C1
        cl:Destroy()
    end
    return true
end

local function Rambo(tool, tex)
    if tool:IsA("Tool") then
        local dir = game:GetService("ReplicatedStorage"):WaitForChild("Storage"):FindFirstChild("SkinVariants"):FindFirstChild("Melees")
        local cl = dir.rambo_bowie:Clone(); local h = tool:WaitForChild("WeaponHandle"); local ch = cl.WeaponHandle
        ch.BowieMesh.TextureID = tex
        for _, v in cl:GetChildren() do if h:FindFirstChild(v.Name) then h:FindFirstChild(v.Name):Destroy() end; v.Parent = h end
        h.ManualWeld.Part1 = ch.BowieMesh; h.ManualWeld.Part0 = h; h.ManualWeld.C0 = ch.ManualWeld.C0; h.ManualWeld.C1 = ch.ManualWeld.C1
        cl:Destroy()
    end
    return true
end

local function Wrench(tool, tex)
    if tool:IsA("Tool") then
        local dir = game:GetService("ReplicatedStorage"):WaitForChild("Storage"):FindFirstChild("SkinVariants"):FindFirstChild("Melees")
        local cl = dir.wrench_hammer:Clone(); local h = tool:WaitForChild("WeaponHandle"); local ch = cl.WeaponHandle
        ch.HammerMesh.TextureID = tex
        for _, v in cl:GetChildren() do if h:FindFirstChild(v.Name) then h:FindFirstChild(v.Name):Destroy() end; v.Parent = h end
        h.ManualWeld.Part1 = ch.HammerMesh; h.ManualWeld.Part0 = h; h.ManualWeld.C0 = ch.ManualWeld.C0; h.ManualWeld.C1 = ch.ManualWeld.C1
        cl:Destroy()
    end
    return true
end

SkinsDB = {
    Armors = {
        ["VestB_1"] = {["Darkheart"]={id="rbxassetid://18279008251"},["Zigger"]={id="rbxassetid://7360021631"}},
        ["HelmetB_2"] = {["Darkened"]={id="rbxassetid://18282214426"},["Bluesteel"]={id="rbxassetid://18282601194"}},
        ["VestB_2"] = {["SWAT"]={id="rbxassetid://18281835229"}},
        ["VestB_3"] = {["DarkHeart"]={id="rbxassetid://18306509071"}},
        ["Necromancer"] = {["Bloodust"]={id="rbxassetid://18275618320"}},
        ["SlayerArmour"] = {["While"]={id="rbxassetid://18308700171"}},
    },
    Melees = {
        ["Balisong"] = {["Default"]={id="rbxassetid://0"},["Gold"]={id="rbxassetid://13715204837"},["Camo"]={id="rbxassetid://13388377781"}},
        ["Katana"] = {["Default"]={id="rbxassetid://0"},["Golden"]={id="rbxassetid://15012855048"},["Voidedge"]={id="rbxassetid://15653919187"},["Dragon"]={id="rbxassetid://17519365000"},["Neo-blade"]={id="rbxassetid://15653919187"}},
        ["Scythe"] = {["Bloodust"]={id="rbxassetid://16551103097"},["Golden"]={id="rbxassetid://16571711832"}},
        ["SlayerSword"] = {["Angelic"]={id="rbxassetid://16549614598"},["Overcharged"]={id="rbxassetid://8770131341"}},
        ["Shiv"] = {["Golden"]={id="rbxassetid://15421623693"}},
        ["ERADICATOR"] = {["Default"]={id="rbxassetid://0"},["Gold"]={id="rbxassetid://18338493787"}},
        ["Bat"] = {["Default"]={id="rbxassetid://15447781718"},["Cash Cane"]={id="rbxassetid://16482015134"},["Opium Cane"]={id="rbxassetid://17727652050"}},
        ["Chainsaw"] = {["Default"]={id="rbxassetid://0"},["Gold"]={id="rbxassetid://13715204837"}},
        ["Fire-Axe"] = {["Default"]={id="rbxassetid://0"},["FireAxe"]={id="rbxassetid://333816720"}},
        ["Machete"] = {["Default"]={id="rbxassetid://0"},["Gold"]={id="rbxassetid://13715204837"}},
        ["Rambo"] = {["Default"]={id="rbxassetid://0"},["Gold"]={id="rbxassetid://13715204837"}},
        ["Wrench"] = {["Default"]={id="rbxassetid://0"},["Gold"]={id="rbxassetid://13715204837"}},
    },
    GrenadeLaunchers = {
        ["RPG-7"] = {["Gold"]={id="rbxassetid://13715204837"},["Twotone"]={id="rbxassetid://13388377781"},["Boom"]={id="rbxassetid://10959329950"},["MATI"]={id="rbxassetid://15507994427"},["Vibrant"]={id="rbxassetid://15645944609"},["PumpkinlLauncher"]={id="rbxassetid://90439639128347"},["John Pork"]={id="rbxassetid://15336726016"},["MESSER"]={id="rbxassetid://15268970718"}},
        ["M320-1"] = {["Paintball"]={id="rbxassetid://13842613980"}},
    },
    Pistols = {
        ["M1911"] = {["Ironsight"]={id="rbxassetid://13388236414"},["Rebel"]={id="rbxassetid://13410196884"},["Stainless"]={id="rbxassetid://13842569053"},["Oldglory"]={id="rbxassetid://13948805827"},["Darkheart"]={id="rbxassetid://13564716720"},["Sandwaves"]={id="rbxassetid://15998637813"},["Unity"]={id="rbxassetid://18149758418"},["Lunar"]={id="rbxassetid://128273297919691"},["Galaxy"]={id="rbxassetid://15646150196"},["Lazy Jester"]={id="rbxassetid://15321145643"},["Lava"]={id="rbxassetid://15264400015"}},
        ["FNP-45"] = {["Bloodshot"]={id="rbxassetid://13566118019"},["Tan"]={id="rbxassetid://15998535930"},["Pulse"]={id="rbxassetid://16355357985"},["Pulse (New)"]={id="rbxassetid://16355357614"},["G59"]={id="rbxassetid://17525744923"},["Desert Camo"]={id="rbxassetid://15320173660"},["Shattered Heart"]={id="rbxassetid://15280020776"},["Treachery"]={id="rbxassetid://15362308196"},["Sunrise"]={id="rbxassetid://15264245774"}},
        ["TEC-9"] = {["Diner"]={id="rbxassetid://13712979305"},["Cottoncloud"]={id="rbxassetid://15998727136"},["Liberty"]={id="rbxassetid://13935385791"},["Lilac"]={id="rbxassetid://13841531857"},["Import"]={id="rbxassetid://13556231753"},["Snakeskin"]={id="rbxassetid://13566186022"},["Star9"]={id="rbxassetid://13387502788"},["Iced"]={id="rbxassetid://15264655453"},["Darkmatter"]={id="rbxassetid://15282521824"}},
        ["Magnum"] = {["Inferno"]={id="rbxassetid://13565647644"},["Abstract"]={id="rbxassetid://13851638932"},["Bronze"]={id="rbxassetid://13388529824"},["Arcticapex"]={id="rbxassetid://15710939034"},["Ironhammer"]={id="rbxassetid://18319380961"},["Bills"]={id="rbxassetid://13935343468"},["Grandpa"]={id="rbxassetid://10946557133"},["Amour"]={id="rbxassetid://16355308299"},["404"]={id="rbxassetid://1786123392"},["Limbo"]={id="rbxassetid://15370830129"},["456"]={id="rbxassetid://74041893391960"}},
        ["G-17"] = {
            ["Gleagle"]={id="rbxassetid://16911006388"},
            ["Hotpink"]={id="rbxassetid://15998559023", customApply=function(t) return G17Sights(t, Enum.Material.Neon, Color3.fromRGB(211,157,188)) end},
            ["Warhawk"]={id="rbxassetid://10898489161", customApply=function(t) return G17Sights(t, nil, Color3.fromRGB(197,189,106)) end},
            ["Amethyst"]={id="rbxassetid://9344554991", customApply=function(t) return G17Sights(t, Enum.Material.Neon, Color3.fromRGB(121,113,163)) end},
            ["Digital Green"]={id="rbxassetid://9422494421", customApply=function(t) return G17Sights(t, nil, Color3.fromRGB(161,179,98)) end},
            ["Sage"]={id="rbxassetid://10898771076", customApply=function(t) return G17Sights(t, nil, Color3.fromRGB(116,121,98)) end},
            ["Benjamin"]={id="rbxassetid://18198687338"},
            ["Oxide"]={id="rbxassetid://13556385916", customApply=function(t) return G17Sights(t, nil, Color3.fromRGB(145,190,197)) end},
            ["Tan"]={id="rbxassetid://13841571102", customApply=function(t) return G17Sights(t, nil, Color3.fromRGB(121,108,98)) end},
            ["Night"]={id="rbxassetid://10899178487", customApply=function(t) return G17Sights(t, nil, Color3.fromRGB(104,117,121)) end},
            ["Yosei"]={id="rbxassetid://15707661222"},["GRUNCH"]={id="rbxassetid://125445752675439"},["Sigma"]={id="rbxassetid://17861230617"},
            ["ELIMINATION"]={id="rbxassetid://94164067871562"},["Photon"]={id="rbxassetid://94317587382863"},["ToyBlaster"]={id="rbxassetid://15345210370"},
            ["Tomato"]={id="rbxassetid://17861211063"},["Bombim"]={id="rbxassetid://1564600185"},["Dragon Power"]={id="rbxassetid://15297949359"},
            ["Hells Angel"]={id="rbxassetid://15257750130"},["Fall"]={id="rbxassetid://15264245774"},["Toy"]={id="rbxassetid://15342068894"}
        },
        ["G-18"] = {
            ["Gleagle"]={id="rbxassetid://16911006388"},
            ["Hotpink"]={id="rbxassetid://15998559023", customApply=function(t) return G17Sights(t, Enum.Material.Neon, Color3.fromRGB(211,157,188)) end},
            ["Warhawk"]={id="rbxassetid://10898489161", customApply=function(t) return G17Sights(t, nil, Color3.fromRGB(197,189,106)) end},
            ["Amethyst"]={id="rbxassetid://9344554991", customApply=function(t) return G17Sights(t, Enum.Material.Neon, Color3.fromRGB(121,113,163)) end},
            ["Digital Green"]={id="rbxassetid://9422494421", customApply=function(t) return G17Sights(t, nil, Color3.fromRGB(161,179,98)) end},
            ["Sage"]={id="rbxassetid://10898771076", customApply=function(t) return G17Sights(t, nil, Color3.fromRGB(116,121,98)) end},
            ["Benjamin"]={id="rbxassetid://18198687338"},
            ["Oxide"]={id="rbxassetid://13556385916", customApply=function(t) return G17Sights(t, nil, Color3.fromRGB(145,190,197)) end},
            ["Tan"]={id="rbxassetid://13841571102", customApply=function(t) return G17Sights(t, nil, Color3.fromRGB(121,108,98)) end},
            ["Night"]={id="rbxassetid://10899178487", customApply=function(t) return G17Sights(t, nil, Color3.fromRGB(104,117,121)) end},
            ["Yosei"]={id="rbxassetid://15707661222"},["GRUNCH"]={id="rbxassetid://125445752675439"},["Sigma"]={id="rbxassetid://17861230617"},
            ["ELIMINATION"]={id="rbxassetid://94164067871562"},["Photon"]={id="rbxassetid://94317587382863"},["ToyBlaster"]={id="rbxassetid://15345210370"},
            ["Tomato"]={id="rbxassetid://17861211063"},["Dragon Power"]={id="rbxassetid://15297949359"},
            ["Hells Angel"]={id="rbxassetid://15257750130"},["Fall"]={id="rbxassetid://15264245774"},["Toy"]={id="rbxassetid://15342068894"}
        },
        ["G-18-X"] = {
            ["Gleagle"]={id="rbxassetid://16911006388"},
            ["Hotpink"]={id="rbxassetid://15998559023", customApply=function(t) return G17Sights(t, Enum.Material.Neon, Color3.fromRGB(211,157,188)) end},
            ["Warhawk"]={id="rbxassetid://10898489161", customApply=function(t) return G17Sights(t, nil, Color3.fromRGB(197,189,106)) end},
            ["Amethyst"]={id="rbxassetid://9344554991", customApply=function(t) return G17Sights(t, Enum.Material.Neon, Color3.fromRGB(121,113,163)) end},
            ["Digital Green"]={id="rbxassetid://9422494421", customApply=function(t) return G17Sights(t, nil, Color3.fromRGB(161,179,98)) end},
            ["Sage"]={id="rbxassetid://10898771076", customApply=function(t) return G17Sights(t, nil, Color3.fromRGB(116,121,98)) end},
            ["Benjamin"]={id="rbxassetid://18198687338"},
            ["Oxide"]={id="rbxassetid://13556385916", customApply=function(t) return G17Sights(t, nil, Color3.fromRGB(145,190,197)) end},
            ["Tan"]={id="rbxassetid://13841571102", customApply=function(t) return G17Sights(t, nil, Color3.fromRGB(121,108,98)) end},
            ["Night"]={id="rbxassetid://10899178487", customApply=function(t) return G17Sights(t, nil, Color3.fromRGB(104,117,121)) end},
            ["Yosei"]={id="rbxassetid://15707661222"},["GRUNCH"]={id="rbxassetid://125445752675439"},["Sigma"]={id="rbxassetid://17861230617"},
            ["ELIMINATION"]={id="rbxassetid://94164067871562"},["Photon"]={id="rbxassetid://94317587382863"},["ToyBlaster"]={id="rbxassetid://15345210370"},
            ["Tomato"]={id="rbxassetid://17861211063"},["Dragon Power"]={id="rbxassetid://15297949359"},
            ["Hells Angel"]={id="rbxassetid://15257750130"},["Fall"]={id="rbxassetid://15264245774"},["Toy"]={id="rbxassetid://15342068894"}
        },
        ["Deagle"] = {["Plasma"]={id="rbxassetid://13567908266"},["Mountain Sunset"]={id="rbxassetid://16018334320"},["Mashed"]={id="rbxassetid://15645853435"},["Hydration"]={id="rbxassetid://15311299274"},["Gingerbread"]={id="rbxassetid://15695335671"},["Federation"]={id="rbxassetid://13841710519"},["Presidential"]={id="rbxassetid://18198669148"},["Presidential (New)"]={id="rbxassetid://18198670122"},["ExoticTest"]={id="rbxassetid://15445293206"},["Golden"]={id="rbxassetid://9422465914"},["Eagleeye"]={id="rbxassetid://13937646988"},["Nacho"]={id="rbxassetid://16942393059"},["Acrylic"]={id="rbxassetid://13714048705"},["Ember"]={id="rbxassetid://16041800350"},["Reaper"]={id="rbxassetid://88948471438774"},["OMORI"]={id="rbxassetid://136460482192003"},["Red Skull"]={id="rbxassetid://17861203454"},["Achievent"]={id="rbxassetid://11934375653"},["Illuminated"]={id="rbxassetid://16018590682"},["SKIBIDIGLE"]={id="rbxassetid://18761552696"},["Winter"]={id="rbxassetid://15293726993"},["Hydration"]={id="rbxassetid://15311368659"},["Inferno"]={id="rbxassetid://16065242678"},["Nigger"]={id="rbxassetid://60484592"},["Emerald"]={id="rbxassetid://1690495361"}},
        ["Beretta"] = {["Wooden"]={id="rbxassetid://15695411633"},["Clef"]={id="rbxassetid://13387587315"},["Silvered"]={id="rbxassetid://15998401350"},["Urbanred"]={id="rbxassetid://13841595045"},["Moss"]={id="rbxassetid://13443011965"},["Digital"]={id="rbxassetid://9341791793"},["Walker"]={id="rbxassetid://15177179442"},["Tiger"]={id="rbxassetid://13704088639"},["Gold"]={id="rbxassetid://15039167103"},["GoldenClouds"]={id="rbxassetid://15645965487"},["Kitten"]={id="rbxassetid://15319888022"},["Haresy"]={id="rbxassetid://15357016361"},["Blue Coat"]={id="rbxassetid://16591545350"}},
    },
    Snipers = {
        ["Mare"] = {["Maritime"]={id="rbxassetid://15998688712"},["Rust"]={id="rbxassetid://16560187868"},["Frostecho"]={id="rbxassetid://15695474241"},["Stallion"]={id="rbxassetid://13556460890"},["Gold"]={id="rbxassetid://16560241772"},["TrickShot"]={id="rbxassetid://16907785827"},["BlipBlop"]={id="rbxassetid://15507973306"},["Paintball Mare"]={id="rbxassetid://15250631049"},["Azurite"]={id="rbxassetid://15264608175"}},
        ["Scout"] = {["SUnseemly Virescent"]={id="rbxassetid://15297464039"}},
        ["BFG-1"] = {["Savior"]={id="rbxassetid://18316883517"},["Federal"]={id="rbxassetid://13948416273"},["Cupid"]={id="rbxassetid://16355412948"},["Inferno"]={id="rbxassetid://16648247101"},["Nerf"]={id="rbxassetid://17861264834"},["Grapes"]={id="rbxassetid://15718105579"},["Vibrant"]={id="rbxassetid://15646150196"},["Blue Fade"]={id="rbxassetid://15322769646"},["Bloodied"]={id="rbxassetid://13948416273"},["USA"]={id="rbxassetid://941761111"}},
    },
    SMGS = {
        ["Uzi"] = {["Rust"]={id="rbxassetid://13715502850"},["Grape2"]={id="rbxassetid://16952083915"},["Smiley"]={id="rbxassetid://13841666943"},["Pumpkinspice"]={id="rbxassetid://15177118472"},["Guilded"]={id="rbxassetid://15998742287"},["Grape"]={id="rbxassetid://13387917991"},["Hallowed"]={id="rbxassetid://15264802296"},["Sparkle Time"]={id="rbxassetid://15320329589"},["Rusted Highlighter"]={id="rbxassetid://15283257255"},["TZZV"]={id="rbxassetid://13387917991"}},
        ["Uzi-S"] = {["Rust"]={id="rbxassetid://13715502850"},["Grape2"]={id="rbxassetid://16952083915"},["Smiley"]={id="rbxassetid://13841666943"},["Pumpkinspice"]={id="rbxassetid://15177118472"},["Guilded"]={id="rbxassetid://15998742287"},["Grape"]={id="rbxassetid://13387917991"},["Hallowed"]={id="rbxassetid://15264802296"},["Sparkle Time"]={id="rbxassetid://15320329589"},["TZZV"]={id="rbxassetid://13387917991"}},
        ["UMP-45"] = {["Lesion"]={id="rbxassetid://15177224638"},["Honeycomb"]={id="rbxassetid://13713087658"},["Burntumber"]={id="rbxassetid://13842574571"},["Dragon"]={id="rbxassetid://15264844741"}},
        ["MP7"] = {["Nixerious"]={id="rbxassetid://113877254258956"},["Navy"]={id="rbxassetid://13714362770"},["Digital"]={id="rbxassetid://13703243112"},["Hellrazor"]={id="rbxassetid://13842812065"},["Zombified"]={id="rbxassetid://15334894800"},["Olive"]={id="rbxassetid://13404159306"},["Left4Dead"]={id="rbxassetid://15334894800"},["Italiano✨"]={id="rbxassetid://15334630306"}},
        ["MP7-S"] = {["Navy"]={id="rbxassetid://13714362770"},["Digital"]={id="rbxassetid://13703243112"},["Hellrazor"]={id="rbxassetid://13842812065"},["Zombified"]={id="rbxassetid://15334894800"},["Olive"]={id="rbxassetid://13404159306"},["Left4Dead"]={id="rbxassetid://15334894800"},["Italiano✨"]={id="rbxassetid://15334630306"}},
        ["Tommy"] = {["Mafia"]={id="rbxassetid://13387532472"},["Currant"]={id="rbxassetid://13841583772"},["Gold"]={id="rbxassetid://15039147920"},["Plum"]={id="rbxassetid://13388349585"},["Leatherworks"]={id="rbxassetid://13556313114"},["Unclesam"]={id="rbxassetid://13936670325"},["Headstone"]={id="rbxassetid://15177096261"},["Stained"]={id="rbxassetid://16037741369"},["Candy Pop"]={id="rbxassetid://15264694906"},["Doodle"]={id="rbxassetid://15297763963"},["Greed"]={id="rbxassetid://15362065880"}},
        ["Tommy-S"] = {["Mafia"]={id="rbxassetid://13387532472"},["Currant"]={id="rbxassetid://13841583772"},["Gold"]={id="rbxassetid://15039147920"},["Plum"]={id="rbxassetid://13388349585"},["Leatherworks"]={id="rbxassetid://13556313114"},["Unclesam"]={id="rbxassetid://13936670325"},["Headstone"]={id="rbxassetid://15177096261"},["Stained"]={id="rbxassetid://16037741369"},["Candy Pop"]={id="rbxassetid://15264694906"},["Doodle"]={id="rbxassetid://15297763963"},["Greed"]={id="rbxassetid://15362065880"}},
        ["MAC-10"] = {["Sunrise"]={id="rbxassetid://13387823798"},["Cheese"]={id="rbxassetid://13556188816"},["Digital"]={id="rbxassetid://13388148081"},["Lostnfound"]={id="rbxassetid://13841544929"},["Freedom"]={id="rbxassetid://13935272075"},["Tropical"]={id="rbxassetid://13712964810"},["Urbandispatch"]={id="rbxassetid://15998655169"},["Gold Brick"]={id="rbxassetid://15653126777"},["Sunset"]={id="rbxassetid://15321332214"},["Luxurious"]={id="rbxassetid://15248514127"}},
        ["MAC-10-S"] = {["Sunrise"]={id="rbxassetid://13387823798"},["Cheese"]={id="rbxassetid://13556188816"},["Digital"]={id="rbxassetid://13388148081"},["Lostnfound"]={id="rbxassetid://13841544929"},["Freedom"]={id="rbxassetid://13935272075"},["Tropical"]={id="rbxassetid://13712964810"},["Urbandispatch"]={id="rbxassetid://15998655169"},["Gold Brick"]={id="rbxassetid://15653126777"},["Sunset"]={id="rbxassetid://15321332214"},["Luxurious"]={id="rbxassetid://15248514127"}},
    },
    Rifles = {
        ["AKS-74U"] = {["Draco"]={id="rbxassetid://13388090322"},["Skulled"]={id="rbxassetid://15645829822"},["Crimcola"]={id="rbxassetid://13387556541"},["Cherish"]={id="rbxassetid://16355375052"},["Formula"]={id="rbxassetid://16010501274"},["Mire"]={id="rbxassetid://15177307123"},["Battleworncamo"]={id="rbxassetid://13842104374"},["Sharkbite"]={id="rbxassetid://11684759812"},["Gravebound"]={id="rbxassetid://75395134245084"},["JadeStone"]={id="rbxassetid://13712930979"},["PLUTO"]={id="rbxassetid://119124175056081"},["OPM"]={id="rbxassetid://17517217348"},["Gold"]={id="rbxassetid://15303808080"},["Case Hardened"]={id="rbxassetid://15646024746"},["Soda"]={id="rbxassetid://13387566361"},["Holy Crap!"]={id="rbxassetid://86193260671473"},["Achromic"]={id="rbxassetid://15296578778"},["Pixel Whiteout"]={id="rbxassetid://15290670950"},["Wrath"]={id="rbxassetid://15362065880"},["Red Lore"]={id="rbxassetid://16591533890"},["MESSER"]={id="rbxassetid://15268970718"}},
        ["AKS-74U-X"] = {["Draco"]={id="rbxassetid://13388090322"},["Skulled"]={id="rbxassetid://15645829822"},["Crimcola"]={id="rbxassetid://13387556541"},["Cherish"]={id="rbxassetid://16355375052"},["Formula"]={id="rbxassetid://16010501274"},["Mire"]={id="rbxassetid://15177307123"},["Battleworncamo"]={id="rbxassetid://13842104374"},["Sharkbite"]={id="rbxassetid://11684759812"},["Gravebound"]={id="rbxassetid://75395134245084"},["JadeStone"]={id="rbxassetid://13712930979"},["PLUTO"]={id="rbxassetid://119124175056081"},["OPM"]={id="rbxassetid://17517217348"},["Gold"]={id="rbxassetid://15303808080"},["Case Hardened"]={id="rbxassetid://15646024746"},["Soda"]={id="rbxassetid://13387566361"},["Holy Crap!"]={id="rbxassetid://86193260671473"},["Achromic"]={id="rbxassetid://15296578778"},["Pixel Whiteout"]={id="rbxassetid://15290670950"},["Wrath"]={id="rbxassetid://15362065880"},["Red Lore"]={id="rbxassetid://16591533890"},["MESSER"]={id="rbxassetid://15268970718"}},
        ["FN-FAL"] = {["Majesty"]={id="rbxassetid://12268008265"},["Purpleheart"]={id="rbxassetid://16040566709"},["Merlot"]={id="rbxassetid://13566072355"},["Wintermaroon"]={id="rbxassetid://15710689660"},["OPM"]={id="rbxassetid://17528070377"},["Goldified"]={id="rbxassetid://15264820986"}},
        ["FN-FAL-S"] = {["Majesty"]={id="rbxassetid://12268008265"},["Purpleheart"]={id="rbxassetid://16040566709"},["Merlot"]={id="rbxassetid://13566072355"},["Wintermaroon"]={id="rbxassetid://15710689660"},["OPM"]={id="rbxassetid://17528070377"},["Goldified"]={id="rbxassetid://15264820986"}},
        ["SKS"] = {["Paragon"]={id="rbxassetid://15998710650"},["Digital"]={id="rbxassetid://9341995268"},["Jacko"]={id="rbxassetid://15177206758"},["Copper"]={id="rbxassetid://13394135741"},["Umbrella"]={id="rbxassetid://13841605579"},["Modern"]={id="rbxassetid://13388175991"},["Jester"]={id="rbxassetid://13343167267"},["Gold"]={id="rbxassetid://16300596462"},["Second Circle"]={id="rbxassetid://15362065880"}},
        ["SCAR-H-1"] = {["Torchbearer"]={id="rbxassetid://18167599401"},["Gridlines"]={id="rbxassetid://16010528228"},["Poison"]={id="rbxassetid://15264664685"},["Yellow"]={id="rbxassetid://15250623811"},["Paintball"]={id="rbxassetid://15250631049"}},
        ["SCAR-H-X"] = {["Torchbearer"]={id="rbxassetid://18167599401"},["Gridlines"]={id="rbxassetid://16010528228"},["Poison"]={id="rbxassetid://15264664685"},["Yellow"]={id="rbxassetid://15250623811"},["Paintball"]={id="rbxassetid://15250631049"}},
        ["M4A1-1"] = {["Pumpkin Eater"]={id="rbxassetid://81794945540744"},["Colacamo"]={id="rbxassetid://16910928732"},["Circuit"]={id="rbxassetid://13841654362"},["Frostbite"]={id="rbxassetid://15695458963"},["Monochrome"]={id="rbxassetid://13388682540"},["Aureus"]={id="rbxassetid://13714578814"},["Patriot"]={id="rbxassetid://13945985275"},["Tiles"]={id="rbxassetid://13387870685"},["Yellowstone"]={id="rbxassetid://15998612264"},["Gold"]={id="rbxassetid://18231287937"},["Heritage"]={id="rbxassetid://18312055711"},["Inferno"]={id="rbxassetid://15417229857"},["Meltdown"]={id="rbxassetid://105367863967017"},["Subzero"]={id="rbxassetid://109664302456309"},["OPM"]={id="rbxassetid://16932839206"},["BlueGem"]={id="rbxassetid://15646272873"},["Case Hardened"]={id="rbxassetid://15645898166"},["PrintStream"]={id="rbxassetid://17838832952"},["SpecOps"]={id="rbxassetid://15344576855"},["Jahibiulous the Greatest"]={id="rbxassetid://15253071974"},["Sourse Missing"]={id="rbxassetid://15264453961"},["Battle Worn"]={id="rbxassetid://15320008608"},["Kitty Hawk"]={id="rbxassetid://15319237497"},["Durimane"]={id="rbxassetid://133507596932655"},["Overprice"]={id="rbxassetid://127016861780202"},["Yaga"]={id="rbxassetid://123580251586008"},["Overload"]={id="rbxassetid://107223728256464"},["Growdown"]={id="rbxassetid://116269420981187"},["PinkDown"]={id="rbxassetid://103518507606964"},["OPMW"]={id="rbxassetid://88211645734166"},["Firebite"]={id="rbxassetid://134888597234636"},["Galasia"]={id="rbxassetid://99374399268601"},["Yellowdump"]={id="rbxassetid://86026762960005"},["Penstick"]={id="rbxassetid://77467662272084"},["Dangerous"]={id="rbxassetid://73627422059849"},["Gasattack"]={id="rbxassetid://80075675951194"},["Pinkform"]={id="rbxassetid://132432316629885"},["HelloKitty"]={id="rbxassetid://81238933089769"},["Ivan Olin"]={id="rbxassetid://104337061217190"},["Steel"]={id="rbxassetid://128592228174287"},["Tugarin"]={id="rbxassetid://137901888336824"},["Dark Essence"]={id="rbxassetid://94848190129550"},["Growess"]={id="rbxassetid://84483564242316"},["Sakura"]={id="rbxassetid://103211071204546"},["Bloodrain"]={id="rbxassetid://116950613843071"},["Iced"]={id="rbxassetid://87976754296141"},["Iron breaker"]={id="rbxassetid://125406237941852"},["GPTprompt"]={id="rbxassetid://89878321896846"},["Memory"]={id="rbxassetid://138602414261870"},["Miamoree"]={id="rbxassetid://89179425357864"},["Minions"]={id="rbxassetid://87686543174255"},["Arabian"]={id="rbxassetid://78086707910549"},["RidenGI"]={id="rbxassetid://105686184306746"},["Sakurain"]={id="rbxassetid://84441518736003"},["Hellaida"]={id="rbxassetid://123113137075758"},["PIXELMAIN"]={id="rbxassetid://103895362425333"},["Azimov"]={id="rbxassetid://87797063560328"},["Neo noir"]={id="rbxassetid://114859231452954"},["Marvelous"]={id="rbxassetid://16502823677"}},
        ["M4A1-S"] = {["Colacamo"]={id="rbxassetid://16910928732"},["Circuit"]={id="rbxassetid://13841654362"},["Frostbite"]={id="rbxassetid://15695458963"},["Monochrome"]={id="rbxassetid://13388682540"},["Aureus"]={id="rbxassetid://13714578814"},["Patriot"]={id="rbxassetid://13945985275"},["Tiles"]={id="rbxassetid://13387870685"},["Yellowstone"]={id="rbxassetid://15998612264"},["Gold"]={id="rbxassetid://18231287937"},["Heritage"]={id="rbxassetid://18312055711"},["Inferno"]={id="rbxassetid://15417229857"},["Meltdown"]={id="rbxassetid://105367863967017"},["Subzero"]={id="rbxassetid://109664302456309"},["OPM"]={id="rbxassetid://16932839206"},["BlueGem"]={id="rbxassetid://15646272873"},["Case Hardened"]={id="rbxassetid://15645898166"},["PrintStream"]={id="rbxassetid://17838832952"},["SpecOps"]={id="rbxassetid://15344576855"},["Jahibiulous the Greatest"]={id="rbxassetid://15253071974"},["Sourse Missing"]={id="rbxassetid://15264453961"},["Battle Worn"]={id="rbxassetid://15320008608"},["Kitty Hawk"]={id="rbxassetid://15319237497"},["Durimane"]={id="rbxassetid://133507596932655"},["Overprice"]={id="rbxassetid://127016861780202"},["Yaga"]={id="rbxassetid://123580251586008"},["Overload"]={id="rbxassetid://107223728256464"},["Growdown"]={id="rbxassetid://116269420981187"},["PinkDown"]={id="rbxassetid://103518507606964"},["OPMW"]={id="rbxassetid://88211645734166"},["Firebite"]={id="rbxassetid://134888597234636"},["Galasia"]={id="rbxassetid://99374399268601"},["Yellowdump"]={id="rbxassetid://86026762960005"},["Penstick"]={id="rbxassetid://77467662272084"},["Dangerous"]={id="rbxassetid://73627422059849"},["Gasattack"]={id="rbxassetid://80075675951194"},["Ivan Olin"]={id="rbxassetid://104337061217190"},["Steel"]={id="rbxassetid://128592228174287"},["Tugarin"]={id="rbxassetid://137901888336824"},["Dark Essence"]={id="rbxassetid://94848190129550"},["Growess"]={id="rbxassetid://84483564242316"},["Sakura"]={id="rbxassetid://103211071204546"},["Bloodrain"]={id="rbxassetid://116950613843071"},["Iced"]={id="rbxassetid://87976754296141"},["Iron breaker"]={id="rbxassetid://125406237941852"},["GPTprompt"]={id="rbxassetid://89878321896846"},["Memory"]={id="rbxassetid://138602414261870"},["Miamoree"]={id="rbxassetid://89179425357864"},["Minions"]={id="rbxassetid://87686543174255"},["Arabian"]={id="rbxassetid://78086707910549"},["RidenGI"]={id="rbxassetid://105686184306746"},["Sakurain"]={id="rbxassetid://84441518736003"},["Hellaida"]={id="rbxassetid://123113137075758"},["PIXELMAIN"]={id="rbxassetid://103895362425333"},["Azimov"]={id="rbxassetid://87797063560328"},["Neo noir"]={id="rbxassetid://114859231452954"}},
        ["AKM"] = {["Whitestring"]={id="rbxassetid://15282661456"},["Gildedfury"]={id="rbxassetid://15282807876"},["Stars"]={id="rbxassetid://16090684967"},["Insurgent"]={id="rbxassetid://15282115851"},["Lab Grown"]={id="rbxassetid://16591522484"}},
    },
    Shotguns = {
        ["Sawn-Off"] = {["Multicam"]={id="rbxassetid://15998421683"},["Webs"]={id="rbxassetid://15177076142"},["Banana"]={id="rbxassetid://13387455222"},["Glacial"]={id="rbxassetid://13030805318"},["Grandprix"]={id="rbxassetid://13841748041"},["Caution"]={id="rbxassetid://10959371093"},["Logs"]={id="rbxassetid://13556252494"},["Gold"]={id="rbxassetid://13714495559"},["Eros"]={id="rbxassetid://124136583812651"},["Grapey"]={id="rbxassetid://15303443830"}},
        ["Ithaca-37"] = {["Homedefense"]={id="rbxassetid://13935302367"},["Sightings"]={id="rbxassetid://15183702458"},["Reserve"]={id="rbxassetid://13841781874"},["Darkmatter"]={id="rbxassetid://15998588320"},["Blaze"]={id="rbxassetid://13703922904"},["Ithcuh"]={id="rbxassetid://16910987164"},["Engraved"]={id="rbxassetid://13388409062"},["Hellfire"]={id="rbxassetid://88337624827127"},["Platinum"]={id="rbxassetid://15344307680"}},
        ["Super-Shorty"] = {["Firecracker"]={id="rbxassetid://18149800264"},["Checkmate"]={id="rbxassetid://13713146952"},["Steel"]={id="rbxassetid://13394161570"},["Loveletter"]={id="rbxassetid://16355340290"},["Fade"]={id="rbxassetid://15645983643"},["Hell Burner"]={id="rbxassetid://15093033212"}},
    }
}

local function getWepsInClass(cls) if not SkinsDB[cls] then return {} end; local w = {}; for wn, _ in pairs(SkinsDB[cls]) do table.insert(w, wn) end; table.sort(w); return w end
local function getSkinsForWep(cls, wn) if not SkinsDB[cls] or not SkinsDB[cls][wn] then return {} end; local s = {}; for sn, _ in pairs(SkinsDB[cls][wn]) do table.insert(s, sn) end; table.sort(s); return s end

local function applySkin()
    if not SkinState.On then Lib:Notify("Enable SkinChanger first!", 2); return false end
    if not SkinState.Weapon or not SkinState.Skin then Lib:Notify("Select weapon and skin!", 2); return false end
    local c = LP.Character; if not c then Lib:Notify("No char!", 2); return false end
    local t = c:FindFirstChild(SkinState.Weapon); if not t then Lib:Notify("Equip "..SkinState.Weapon.." first!", 2); return false end
    local sData = SkinsDB[SkinState.Class][SkinState.Weapon][SkinState.Skin]; if not sData then Lib:Notify("No skin data!", 2); return false end
    local suc, err = pcall(function()
        for _, d in pairs(t:GetDescendants()) do if d:IsA("MeshPart") then d.TextureID = sData.id; if d:FindFirstChildOfClass("SurfaceAppearance") then d:FindFirstChildOfClass("SurfaceAppearance"):Destroy() end end end
        if sData.customApply then sData.customApply(t) end
    end)
    if suc then Lib:Notify("Skin to "..SkinState.Weapon, 2); return true else warn("Skin err:", err); Lib:Notify("Skin fail!", 2); return false end
end

local function setupAutoApply()
    for _, c in pairs(SkinState.Conns) do if c then c:Disconnect() end end; SkinState.Conns = {}
    if SkinState.On and SkinState.Auto then
        local function chkAndApply()
            if not SkinState.Auto or not SkinState.On then return end
            local c = LP.Character; if not c then return end
            local t = c:FindFirstChild(SkinState.Weapon); if not t then return end
            if SkinState.Weapon and SkinState.Skin then task.wait(0.5); applySkin() end
        end
        if LP.Character then local t = LP.Character:FindFirstChild(SkinState.Weapon); if t then task.spawn(function() task.wait(1); chkAndApply() end) end end
        local c1 = LP.CharacterAdded:Connect(function(c) task.wait(2); chkAndApply() end)
        local function setupCharMon(c) local c2 = c.ChildAdded:Connect(function(ch) if ch:IsA("Tool") and ch.Name == SkinState.Weapon then task.wait(0.5); chkAndApply() end end); table.insert(SkinState.Conns, c2) end
        if LP.Character then setupCharMon(LP.Character) end
        local c3 = LP.CharacterAdded:Connect(function(c) task.wait(1); setupCharMon(c); chkAndApply() end)
        table.insert(SkinState.Conns, c1); table.insert(SkinState.Conns, c3)
    end
end

local function saveSkins() if writefile then pcall(function() writefile("starlight_skins.json", game:GetService("HttpService"):JSONEncode(SkinState.Equipped)) end) else Lib:Notify("No writefile", 2) end end
local function loadSkins() if readfile and isfile then pcall(function() if isfile("starlight_skins.json") then SkinState.Equipped = game:GetService("HttpService"):JSONDecode(readfile("starlight_skins.json")) end end) end end

task.spawn(function()
    repeat task.wait() until Tabs and Win; task.wait(2)
    if not Tabs.Skin then Tabs.Skin = Win:AddTab("SkinChanger") end
    local SkinTab = Tabs.Skin; local SkinL = SkinTab:AddLeftGroupbox("Skin Changer"); local SkinR = SkinTab:AddRightGroupbox("Controls")
-- ==================== CUSTOM MODELS SYSTEM ====================

local CustomModelsGroup = SkinTab:AddLeftGroupbox("Custom Models")

local currentCMType = "M4:Subzero"
local isCMEnabled = false
local cmConnections = {}
local cmHeartbeatConnection = nil

-- Subzero
local cmSubzeroModel = nil
local cmSubzeroCurrentSkinClone = nil
local cmSubzeroLastWeapon = nil
local cmSubzeroIsApplyingSkin = false
local cmSubzeroOriginalPartsTransparency = {}
local cmSubzeroOriginalEffectsProperties = {}
local CM_SUBZERO_BLUE_COLOR = Color3.fromRGB(0, 150, 255)
local cmSubzeroLastCheckTime = 0
local CM_SUBZERO_CHECK_INTERVAL = 0.3
local CM_SUBZERO_FIRE_SOUND_ID = "rbxassetid://747238556"
local cmSubzeroCreatedFFireSoundTWO = nil

-- Dragon (УПРОЩЕННАЯ ВЕРСИЯ БЕЗ ОГНЯ)
local cmDragonModel = nil
local cmDragonCurrentSkinClone = nil
local cmDragonLastWeapon = nil
local cmDragonIsApplyingSkin = false
local cmDragonOriginalPartsTransparency = {}
local cmDragonOriginalFireSounds = {}
local cmDragonLastCheckTime = 0
local CM_DRAGON_CHECK_INTERVAL = 0.3
local CM_DRAGON_FIRE_SOUND_TWO_ID = "rbxassetid://4547663256"
local cmDragonCreatedFFireSoundTWO = nil
local CM_DRAGON_RED_COLOR = Color3.fromRGB(255, 50, 50)
local CM_DRAGON_ORANGE_COLOR = Color3.fromRGB(255, 150, 50)

-- Cryogen
local cmCryogenModel = nil
local cmCryogenCurrentSkinClone = nil
local cmCryogenLastWeapon = nil
local cmCryogenIsApplyingSkin = false
local cmCryogenOriginalPartsTransparency = {}
local cmCryogenLastCheckTime = 0
local CM_CRYOGEN_CHECK_INTERVAL = 0.1

-- Heritage
local cmHeritageModel = nil
local cmHeritageCurrentSkinClone = nil
local cmHeritageLastWeapon = nil
local cmHeritageIsApplyingSkin = false
local cmHeritageOriginalPartsTransparency = {}
local cmHeritageOriginalColors = {}
local cmHeritageOriginalBrightness = {}
local cmHeritageOriginalParticleColors = {}
local cmHeritageOriginalFireSounds = {}
local CM_HERITAGE_TEXTURE_ID = "rbxassetid://18312058779"
local cmHeritageLastCheckTime = 0
local CM_HERITAGE_CHECK_INTERVAL = 0.3

-- WOGW
local cmWogwModel = nil
local cmWogwCurrentSkinClone = nil
local cmWogwLastWeapon = nil
local cmWogwIsApplyingSkin = false
local cmWogwOriginalPartsTransparency = {}
local cmWogwOriginalColors = {}
local cmWogwOriginalBrightness = {}
local cmWogwOriginalParticleColors = {}
local cmWogwOriginalFireSounds = {}
local CM_WOGW_TEXTURE_ID = "rbxassetid://18447364551"
local CM_WOGW_RED_COLOR = Color3.fromRGB(255, 0, 0)
local cmWogwLastCheckTime = 0
local CM_WOGW_CHECK_INTERVAL = 0.3

-- OPM
local cmOpmModel = nil
local cmOpmCurrentSkinClone = nil
local cmOpmLastWeapon = nil
local cmOpmIsApplyingSkin = false
local cmOpmOriginalPartsTransparency = {}
local cmOpmLastCheckTime = 0
local CM_OPM_CHECK_INTERVAL = 0.3
local CM_M4A1_TEXTURE_ID = "rbxassetid://17517217348"
local CM_WINGS_TEXTURE_ID = "rbxassetid://16932839206"

-- Showdown
local cmShowdownModel = nil
local cmShowdownCurrentSkinClone = nil
local cmShowdownLastWeapon = nil
local cmShowdownIsApplyingSkin = false
local cmShowdownOriginalPartsTransparency = {}
local cmShowdownOriginalSoundEffects = {}
local cmShowdownLastCheckTime = 0
local CM_SHOWDOWN_CHECK_INTERVAL = 0.3
local CM_SHOWDOWN_TEXTURE_ID = "rbxassetid://92440380770170"
local CM_STEELDOWN_TEXTURE_ID = "rbxassetid://84378650452943"
local CM_GHOST_GREY_COLOR = Color3.fromRGB(163, 162, 165)
local CM_FIRE_SOUND_IDS = {
    "rbxassetid://101102493447462",
    "rbxassetid://82242797766568"
}

-- Eros
local cmErosModel = nil
local cmErosCurrentSkinClone = nil
local cmErosLastWeapon = nil
local cmErosIsApplyingSkin = false
local cmErosOriginalPartsTransparency = {}
local cmErosOriginalEffectsProperties = {}
local CM_EROS_PINK_COLOR = Color3.fromRGB(255, 105, 180)
local CM_EROS_TEXTURE_ID = "rbxassetid://94543327437589"
local cmErosLastCheckTime = 0
local CM_EROS_CHECK_INTERVAL = 0.3

-- Mare (TrickShot & White)
local cmMareModel = nil
local cmMareCurrentSkinClone = nil
local cmMareLastWeapon = nil
local cmMareIsApplyingSkin = false
local cmMareOriginalPartsTransparency = {}
local cmMareOriginalMaterials = {}
local cmMareOriginalColors = {}
local cmMareOriginalEffectsProperties = {}
local cmMareLastCheckTime = 0
local CM_MARE_CHECK_INTERVAL = 0.3
local CM_MARE_FIRE_SOUND_ID = "rbxassetid://5033272182"
local cmMareCreatedFFireSoundTWO = nil

-- Массив скинов для Mare
local cmMareSkins = {
    ["TrickShot"] = {
        texture = "rbxassetid://16907785827",
        color = Color3.fromRGB(0, 255, 0),
        brightColor = Color3.fromRGB(100, 255, 100),
        effectColor = Color3.fromRGB(0, 255, 0),
        smokeColor = Color3.new(0.5, 1, 0.5)
    },
    ["White"] = {
        texture = "rbxassetid://16907786165",
        color = Color3.fromRGB(255, 255, 255),
        brightColor = Color3.fromRGB(255, 255, 255),
        effectColor = Color3.fromRGB(255, 255, 255),
        smokeColor = Color3.new(0.9, 0.9, 0.9)
    }
}

local currentMareSkin = "TrickShot"

local function changeCMFireSoundsPlaybackSpeed(weapon, soundEffectsTable)
    if not weapon then return end
    local weaponHandle = weapon:FindFirstChild("WeaponHandle") or weapon:FindFirstChild("Handle")
    if not weaponHandle then return end
    local muzzle = weaponHandle:FindFirstChild("Muzzle")
    if muzzle then
        for i = 1, 3 do
            local fireSound = muzzle:FindFirstChild("FireSound" .. i)
            if fireSound and fireSound:IsA("Sound") then
                soundEffectsTable[fireSound] = {PlaybackSpeed = fireSound.PlaybackSpeed, SoundId = fireSound.SoundId}
                fireSound.PlaybackSpeed = 0.952
            end
        end
        local alternativeSoundNames = {"Fire", "Shoot", "Gunshot", "Shot", "FireSound"}
        for _, soundName in pairs(alternativeSoundNames) do
            local sound = muzzle:FindFirstChild(soundName)
            if sound and sound:IsA("Sound") and not soundEffectsTable[sound] then
                soundEffectsTable[sound] = {PlaybackSpeed = sound.PlaybackSpeed, SoundId = sound.SoundId}
                sound.PlaybackSpeed = 0.8
            end
        end
    end
    for _, sound in pairs(weaponHandle:GetChildren()) do
        if sound:IsA("Sound") and not soundEffectsTable[sound] then
            local soundName = sound.Name:lower()
            if string.find(soundName, "fire") or string.find(soundName, "shoot") or string.find(soundName, "shot") or string.find(soundName, "firesound") then
                soundEffectsTable[sound] = {PlaybackSpeed = sound.PlaybackSpeed, SoundId = sound.SoundId}
                sound.PlaybackSpeed = 0.8
            end
        end
    end
    for _, sound in pairs(weapon:GetDescendants()) do
        if sound:IsA("Sound") and not soundEffectsTable[sound] then
            local soundName = sound.Name:lower()
            if string.find(soundName, "fire") or string.find(soundName, "shoot") or string.find(soundName, "shot") or string.find(soundName, "firesound") then
                soundEffectsTable[sound] = {PlaybackSpeed = sound.PlaybackSpeed, SoundId = sound.SoundId}
                sound.PlaybackSpeed = 0.8
            end
        end
    end
end

local function restoreCMFireSoundsPlaybackSpeed(soundEffectsTable)
    for sound, originalData in pairs(soundEffectsTable) do
        if sound and sound.Parent then
            pcall(function() sound.PlaybackSpeed = originalData.PlaybackSpeed end)
        end
    end
    soundEffectsTable = {}
end

-- Subzero функции
local function hideCMSubzeroOriginalParts(weapon)
    if not weapon then return end
    cmSubzeroOriginalPartsTransparency = {}
    for _, part in ipairs(weapon:GetDescendants()) do
        if (part:IsA("BasePart") or part:IsA("MeshPart")) and part.Transparency < 1 then
            cmSubzeroOriginalPartsTransparency[part] = part.Transparency
            part.Transparency = 1
        end
    end
end

local function restoreCMSubzeroOriginalParts()
    for part, transparency in pairs(cmSubzeroOriginalPartsTransparency) do
        if part and part.Parent then part.Transparency = transparency end
    end
    cmSubzeroOriginalPartsTransparency = {}
end

local function addCMSubzeroFFireSoundTWO(weapon)
    if not weapon then return nil end
    local weaponHandle = weapon:FindFirstChild("WeaponHandle") or weapon:FindFirstChild("Handle")
    if not weaponHandle then return nil end
    local muzzle = weaponHandle:FindFirstChild("Muzzle")
    if not muzzle then
        muzzle = Instance.new("Part")
        muzzle.Name = "Muzzle"
        muzzle.Size = Vector3.new(0.2, 0.2, 0.2)
        muzzle.Transparency = 1
        muzzle.CanCollide = false
        muzzle.CanTouch = false
        muzzle.Anchored = false
        muzzle.Massless = true
        muzzle.Parent = weaponHandle
        local weld = Instance.new("Weld")
        weld.Part0 = weaponHandle
        weld.Part1 = muzzle
        weld.C0 = CFrame.new(0, 0, 1.5)
        weld.Parent = muzzle
    end
    local existingSound = muzzle:FindFirstChild("FFireSoundTWO")
    if existingSound then
        existingSound.SoundId = CM_SUBZERO_FIRE_SOUND_ID
        existingSound.Volume = 0.5
        existingSound.PlaybackSpeed = 3
        cmSubzeroCreatedFFireSoundTWO = existingSound
        return existingSound
    end
    local newFireSound = Instance.new("Sound")
    newFireSound.Name = "FFireSoundTWO"
    newFireSound.SoundId = CM_SUBZERO_FIRE_SOUND_ID
    newFireSound.Volume = 0.5
    newFireSound.MaxDistance = 200
    newFireSound.RollOffMode = Enum.RollOffMode.Linear
    newFireSound.PlaybackSpeed = 3
    newFireSound.Looped = false
    newFireSound.Parent = muzzle
    pcall(function() newFireSound:SetAttribute("Priority", 1) end)
    cmSubzeroCreatedFFireSoundTWO = newFireSound
    return newFireSound
end

local function removeCMSubzeroFFireSoundTWO()
    if cmSubzeroCreatedFFireSoundTWO and cmSubzeroCreatedFFireSoundTWO.Parent then
        pcall(function() cmSubzeroCreatedFFireSoundTWO:Destroy() end)
        cmSubzeroCreatedFFireSoundTWO = nil
    end
    local player = game.Players.LocalPlayer
    if player and player.Character then
        for _, tool in ipairs(player.Character:GetChildren()) do
            if tool:IsA("Tool") then
                local weaponHandle = tool:FindFirstChild("WeaponHandle") or tool:FindFirstChild("Handle")
                if weaponHandle then
                    local muzzle = weaponHandle:FindFirstChild("Muzzle")
                    if muzzle then
                        local sound = muzzle:FindFirstChild("FFireSoundTWO")
                        if sound then pcall(function() sound:Destroy() end) end
                    end
                end
            end
        end
    end
end

local function changeCMSubzeroEffectsToBlue(weapon)
    if not weapon then return end
    local weaponHandle = weapon:FindFirstChild("WeaponHandle") or weapon:FindFirstChild("Handle")
    if not weaponHandle then return end
    local muzzle = weaponHandle:FindFirstChild("Muzzle")
    if not muzzle then return end
    local effectNames = {"Barrel Smoke","FlashEmitter","Gas","Gas2","Lens Flare","Muzzle Flash 1","SmokeEmitter","Sparkles"}
    cmSubzeroOriginalEffectsProperties = {}
    for _, effectName in ipairs(effectNames) do
        local effect = muzzle:FindFirstChild(effectName)
        if effect then
            cmSubzeroOriginalEffectsProperties[effect] = {}
            if effect:IsA("ParticleEmitter") then
                cmSubzeroOriginalEffectsProperties[effect].Color = effect.Color
                effect.Color = ColorSequence.new(CM_SUBZERO_BLUE_COLOR)
            elseif effect:IsA("Beam") then
                cmSubzeroOriginalEffectsProperties[effect].Color = effect.Color
                effect.Color = ColorSequence.new(CM_SUBZERO_BLUE_COLOR)
            elseif effect:IsA("PointLight") then
                cmSubzeroOriginalEffectsProperties[effect].Color = effect.Color
                effect.Color = CM_SUBZERO_BLUE_COLOR
            elseif effect:IsA("Sparkles") then
                cmSubzeroOriginalEffectsProperties[effect].SparkleColor = effect.SparkleColor
                effect.SparkleColor = CM_SUBZERO_BLUE_COLOR
            elseif effect:IsA("Smoke") then
                cmSubzeroOriginalEffectsProperties[effect].Color = effect.Color
                effect.Color = Color3.new(0.6, 0.8, 1)
            elseif effect:IsA("Fire") then
                cmSubzeroOriginalEffectsProperties[effect].Color = effect.Color
                cmSubzeroOriginalEffectsProperties[effect].SecondaryColor = effect.SecondaryColor
                effect.Color = CM_SUBZERO_BLUE_COLOR
                effect.SecondaryColor = CM_SUBZERO_BLUE_COLOR
            end
        end
    end
    for _, child in ipairs(muzzle:GetChildren()) do
        if (child:IsA("ParticleEmitter") or child:IsA("Beam") or child:IsA("PointLight") or child:IsA("Sparkles") or child:IsA("Smoke") or child:IsA("Fire")) and not cmSubzeroOriginalEffectsProperties[child] then
            cmSubzeroOriginalEffectsProperties[child] = {}
            if child:IsA("ParticleEmitter") then
                cmSubzeroOriginalEffectsProperties[child].Color = child.Color
                child.Color = ColorSequence.new(CM_SUBZERO_BLUE_COLOR)
            elseif child:IsA("Beam") then
                cmSubzeroOriginalEffectsProperties[child].Color = child.Color
                child.Color = ColorSequence.new(CM_SUBZERO_BLUE_COLOR)
            elseif child:IsA("PointLight") then
                cmSubzeroOriginalEffectsProperties[child].Color = child.Color
                child.Color = CM_SUBZERO_BLUE_COLOR
            elseif child:IsA("Sparkles") then
                cmSubzeroOriginalEffectsProperties[child].SparkleColor = child.SparkleColor
                child.SparkleColor = CM_SUBZERO_BLUE_COLOR
            elseif child:IsA("Smoke") then
                cmSubzeroOriginalEffectsProperties[child].Color = child.Color
                child.Color = Color3.new(0.6, 0.8, 1)
            elseif child:IsA("Fire") then
                cmSubzeroOriginalEffectsProperties[child].Color = child.Color
                cmSubzeroOriginalEffectsProperties[child].SecondaryColor = child.SecondaryColor
                child.Color = CM_SUBZERO_BLUE_COLOR
                child.SecondaryColor = CM_SUBZERO_BLUE_COLOR
            end
        end
    end
end

local function restoreCMSubzeroOriginalEffects()
    for effect, properties in pairs(cmSubzeroOriginalEffectsProperties) do
        if effect and effect.Parent then
            pcall(function()
                if properties.Color then effect.Color = properties.Color end
                if properties.SparkleColor then effect.SparkleColor = properties.SparkleColor end
                if properties.SecondaryColor then effect.SecondaryColor = properties.SecondaryColor end
            end)
        end
    end
    cmSubzeroOriginalEffectsProperties = {}
end

local function loadCMSubzeroModel()
    local success = pcall(function()
        local possibleNames = {"subzero","m4a1_subzero","m4_subzero","subzero_m4","subzero_m4a1","ice","frost","frozen"}
        local searchLocations = {game:GetService("ReplicatedStorage"),game:GetService("Workspace"),game:GetService("Lighting"),game:GetService("StarterPack"),game:GetService("StarterGui"),game:GetService("ServerStorage")}
        local storage = game:GetService("ReplicatedStorage"):FindFirstChild("Storage")
        if storage then
            for _, child in ipairs(storage:GetChildren()) do
                local childName = child.Name:lower()
                for _, name in ipairs(possibleNames) do
                    if string.find(childName, name) then
                        cmSubzeroModel = child:Clone()
                        return true
                    end
                end
            end
        end
        for _, location in ipairs(searchLocations) do
            if location then
                local function searchInContainer(container, depth)
                    if depth > 3 then return false end
                    for _, item in ipairs(container:GetChildren()) do
                        local itemName = item.Name:lower()
                        for _, name in ipairs(possibleNames) do
                            if string.find(itemName, name) then
                                if item:IsA("Model") or item:IsA("BasePart") or item:IsA("MeshPart") then
                                    cmSubzeroModel = item:Clone()
                                    return true
                                end
                            end
                        end
                        if #item:GetChildren() > 0 then
                            if searchInContainer(item, depth + 1) then return true end
                        end
                    end
                    return false
                end
                if searchInContainer(location, 0) then return true end
            end
        end
        local function findAnyWeaponModel(container)
            for _, item in ipairs(container:GetChildren()) do
                local itemName = item.Name:lower()
                if string.find(itemName, "weapon") or string.find(itemName, "gun") or string.find(itemName, "rifle") or string.find(itemName, "m4") then
                    if item:IsA("Model") or item:IsA("BasePart") then
                        cmSubzeroModel = item:Clone()
                        return true
                    end
                end
                if #item:GetChildren() > 0 then
                    if findAnyWeaponModel(item) then return true end
                end
            end
            return false
        end
        if storage and findAnyWeaponModel(storage) then return true end
        return false
    end)
    if success and cmSubzeroModel then
        for _, obj in ipairs(cmSubzeroModel:GetDescendants()) do
            if obj:IsA("BasePart") then
                obj.CanCollide = false
                obj.Massless = true
                obj.CastShadow = false
                obj.CanQuery = false
                local complexMaterials = {Enum.Material.Neon,Enum.Material.Glass,Enum.Material.Foil,Enum.Material.ForceField}
                for _, material in ipairs(complexMaterials) do
                    if obj.Material == material then obj.Material = Enum.Material.Plastic end
                end
            end
        end
        return true
    else
        return false
    end
end

local function applyCMSubzeroSkin(weapon)
    if not weapon or not cmSubzeroModel or cmSubzeroIsApplyingSkin then return false end
    cmSubzeroIsApplyingSkin = true
    if cmSubzeroCurrentSkinClone then
        pcall(function() cmSubzeroCurrentSkinClone:Destroy() end)
        cmSubzeroCurrentSkinClone = nil
    end
    hideCMSubzeroOriginalParts(weapon)
    changeCMSubzeroEffectsToBlue(weapon)
    addCMSubzeroFFireSoundTWO(weapon)
    local success = pcall(function()
        local skinClone = cmSubzeroModel:Clone()
        local handle = weapon:FindFirstChild("Handle") or weapon:FindFirstChildWhichIsA("BasePart")
        if not handle then skinClone:Destroy(); return false end
        local skinPrimary
        if skinClone:IsA("BasePart") then
            skinPrimary = skinClone
        else
            skinPrimary = skinClone:FindFirstChildWhichIsA("BasePart")
        end
        if not skinPrimary then
            skinPrimary = skinClone:FindFirstChildWhichIsA("Model")
            if skinPrimary then skinPrimary = skinPrimary:FindFirstChildWhichIsA("BasePart") end
        end
        if skinPrimary then
            skinPrimary.CFrame = handle.CFrame
            local weld = Instance.new("Weld")
            weld.Part0 = handle
            weld.Part1 = skinPrimary
            weld.C0 = CFrame.new()
            weld.C1 = CFrame.new()
            weld.Parent = skinPrimary
            for _, part in ipairs(skinClone:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Massless = true
                    part.CanCollide = false
                    part.CastShadow = false
                    part.CanQuery = false
                end
            end
            skinClone.Parent = weapon
            cmSubzeroCurrentSkinClone = skinClone
            cmSubzeroLastWeapon = weapon
            return true
        else
            skinClone:Destroy()
            return false
        end
    end)
    cmSubzeroIsApplyingSkin = false
    return success
end

local function removeCMSubzeroSkin()
    restoreCMSubzeroOriginalEffects()
    removeCMSubzeroFFireSoundTWO()
    if cmSubzeroCurrentSkinClone then
        pcall(function() cmSubzeroCurrentSkinClone:Destroy(); cmSubzeroCurrentSkinClone = nil end)
    end
    restoreCMSubzeroOriginalParts()
    cmSubzeroLastWeapon = nil
end

-- Dragon функции (УПРОЩЕННЫЕ БЕЗ ЭФФЕКТОВ ОГНЯ)
local function processCMDragonModelParts(model)
    if not model then return nil end
    local partsToRemove = {"LaserPart","OpticPart","SuppressorPart"}
    local partsToHide = {"Bolt","ChargingHandle","Dustcover","HoloSightPart"}
    for _, descendant in pairs(model:GetDescendants()) do
        if descendant:IsA("BasePart") or descendant:IsA("MeshPart") then
            local partName = descendant.Name
            for _, unwantedName in pairs(partsToRemove) do
                if partName == unwantedName then descendant:Destroy(); break end
            end
            for _, hideName in pairs(partsToHide) do
                if partName == hideName then descendant.Transparency = 1; descendant.CanCollide = false; descendant.CanTouch = false; break end
            end
        end
    end
    return true
end

local function loadCMDragonModel()
    local isSearching = false
    if isSearching then return nil end
    isSearching = true
    local foundModel = nil
    local searchLocations = {game:GetService("ReplicatedStorage"),game:GetService("ServerStorage"),game:GetService("Workspace"),game:GetService("StarterPack"),game:GetService("StarterGui"),game:GetService("Lighting")}
    local storage = game:GetService("ReplicatedStorage"):FindFirstChild("Storage")
    if storage then
        for _, child in ipairs(storage:GetChildren()) do
            if string.lower(child.Name) == "m4a1_c_sm" then foundModel = child; break end
        end
    end
    if not foundModel then
        for _, location in ipairs(searchLocations) do
            if location then
                local function searchInContainer(container, depth)
                    if depth > 3 then return false end
                    for _, item in ipairs(container:GetChildren()) do
                        if string.lower(item.Name) == "m4a1_c_sm" then
                            if item:IsA("Model") or item:IsA("BasePart") or item:IsA("MeshPart") then foundModel = item; return true end
                        end
                        if #item:GetChildren() > 0 then if searchInContainer(item, depth + 1) then return true end end
                    end
                    return false
                end
                if searchInContainer(location, 0) then break end
            end
        end
    end
    if foundModel then
        cmDragonModel = foundModel:Clone()
        processCMDragonModelParts(cmDragonModel)
        for _, part in pairs(cmDragonModel:GetDescendants()) do
            if part:IsA("BasePart") or part:IsA("MeshPart") then
                part.CastShadow = false
                part.CanCollide = false
                part.CanTouch = false
                part.Massless = true
                part.Locked = true
                if part.Material == Enum.Material.Plastic or part.Material == Enum.Material.SmoothPlastic then 
                    part.Color = CM_DRAGON_RED_COLOR 
                end
            end
        end
    end
    isSearching = false
    return cmDragonModel ~= nil
end

local function hideCMDragonOriginalParts(weapon)
    if not weapon then return end
    cmDragonOriginalPartsTransparency = {}
    for _, part in ipairs(weapon:GetDescendants()) do
        if (part:IsA("BasePart") or part:IsA("MeshPart")) and part.Transparency < 1 then
            cmDragonOriginalPartsTransparency[part] = part.Transparency
            part.Transparency = 1
        end
    end
end

local function restoreCMDragonOriginalParts()
    for part, transparency in pairs(cmDragonOriginalPartsTransparency) do
        if part and part.Parent then pcall(function() part.Transparency = transparency end) end
    end
    cmDragonOriginalPartsTransparency = {}
end

local function addCMDragonFFireSoundTWO(weapon)
    if not weapon then return nil end
    local weaponHandle = weapon:FindFirstChild("WeaponHandle") or weapon:FindFirstChild("Handle")
    if not weaponHandle then return nil end
    local muzzle = weaponHandle:FindFirstChild("Muzzle")
    if not muzzle then
        muzzle = Instance.new("Part")
        muzzle.Name = "Muzzle"
        muzzle.Size = Vector3.new(0.2, 0.2, 0.2)
        muzzle.Transparency = 1
        muzzle.CanCollide = false
        muzzle.CanTouch = false
        muzzle.Anchored = false
        muzzle.Massless = true
        muzzle.Parent = weaponHandle
        local weld = Instance.new("Weld")
        weld.Part0 = weaponHandle
        weld.Part1 = muzzle
        weld.C0 = CFrame.new(0, 0, 1.5)
        weld.Parent = muzzle
    end
    local existingSound = muzzle:FindFirstChild("FFireSoundTWO")
    if existingSound then
        existingSound.SoundId = CM_DRAGON_FIRE_SOUND_TWO_ID
        existingSound.Volume = 0.5
        existingSound.PlaybackSpeed = 1
        cmDragonCreatedFFireSoundTWO = existingSound
        return existingSound
    end
    local newFireSound = Instance.new("Sound")
    newFireSound.Name = "FFireSoundTWO"
    newFireSound.SoundId = CM_DRAGON_FIRE_SOUND_TWO_ID
    newFireSound.Volume = 0.5
    newFireSound.MaxDistance = 200
    newFireSound.RollOffMode = Enum.RollOffMode.Linear
    newFireSound.PlaybackSpeed = 0.8
    newFireSound.Looped = false
    newFireSound.Parent = muzzle
    pcall(function() newFireSound:SetAttribute("Priority", 1) end)
    cmDragonCreatedFFireSoundTWO = newFireSound
    return newFireSound
end

local function removeCMDragonFFireSoundTWO()
    if cmDragonCreatedFFireSoundTWO and cmDragonCreatedFFireSoundTWO.Parent then
        pcall(function() cmDragonCreatedFFireSoundTWO:Destroy() end)
        cmDragonCreatedFFireSoundTWO = nil
    end
    local player = game.Players.LocalPlayer
    if player and player.Character then
        for _, tool in ipairs(player.Character:GetChildren()) do
            if tool:IsA("Tool") then
                local weaponHandle = tool:FindFirstChild("WeaponHandle") or tool:FindFirstChild("Handle")
                if weaponHandle then
                    local muzzle = weaponHandle:FindFirstChild("Muzzle")
                    if muzzle then
                        local sound = muzzle:FindFirstChild("FFireSoundTWO")
                        if sound then pcall(function() sound:Destroy() end) end
                    end
                end
            end
        end
    end
end

local function changeCMDragonFireSoundsPlaybackSpeed(weapon)
    if not weapon then return end
    cmDragonOriginalFireSounds = {}
    local weaponHandle = weapon:FindFirstChild("WeaponHandle") or weapon:FindFirstChild("Handle")
    if weaponHandle then
        local muzzle = weaponHandle:FindFirstChild("Muzzle")
        if muzzle then
            for i = 1, 3 do
                local fireSound = muzzle:FindFirstChild("FireSound" .. i)
                if fireSound and fireSound:IsA("Sound") then
                    cmDragonOriginalFireSounds[fireSound] = {PlaybackSpeed = fireSound.PlaybackSpeed,SoundId = fireSound.SoundId}
                    fireSound.PlaybackSpeed = 0.952
                end
            end
        end
    end
end

local function restoreCMDragonFireSounds()
    for sound, originalData in pairs(cmDragonOriginalFireSounds) do
        if sound and sound.Parent then pcall(function() sound.PlaybackSpeed = originalData.PlaybackSpeed end) end
    end
    cmDragonOriginalFireSounds = {}
end

local function applyCMDragonSkin(weapon)
    if not weapon or not cmDragonModel or cmDragonIsApplyingSkin then return false end
    cmDragonIsApplyingSkin = true
    if cmDragonCurrentSkinClone then
        pcall(function() cmDragonCurrentSkinClone:Destroy() end)
        cmDragonCurrentSkinClone = nil
    end
    hideCMDragonOriginalParts(weapon)
    changeCMDragonFireSoundsPlaybackSpeed(weapon)
    addCMDragonFFireSoundTWO(weapon)
    
    local success = pcall(function()
        local skinClone = cmDragonModel:Clone()
        local handle = weapon:FindFirstChild("Handle") or weapon:FindFirstChildWhichIsA("BasePart")
        if not handle then skinClone:Destroy(); return false end
        local skinPrimary
        if skinClone:IsA("BasePart") then skinPrimary = skinClone
        else skinPrimary = skinClone:FindFirstChildWhichIsA("BasePart") end
        if not skinPrimary then
            skinPrimary = skinClone:FindFirstChildWhichIsA("Model")
            if skinPrimary then skinPrimary = skinPrimary:FindFirstChildWhichIsA("BasePart") end
        end
        if skinPrimary then
            skinPrimary.CFrame = handle.CFrame
            local weld = Instance.new("Weld")
            weld.Part0 = handle
            weld.Part1 = skinPrimary
            weld.C0 = CFrame.new()
            weld.C1 = CFrame.new()
            weld.Parent = skinPrimary
            for _, part in ipairs(skinClone:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Massless = true
                    part.CanCollide = false
                    part.CastShadow = false
                    part.CanQuery = false
                    part.LocalTransparencyModifier = 0
                end
            end
            skinClone.Parent = weapon
            cmDragonCurrentSkinClone = skinClone
            cmDragonLastWeapon = weapon
            return true
        else
            skinClone:Destroy()
            return false
        end
    end)
    cmDragonIsApplyingSkin = false
    return success
end

local function removeCMDragonSkin()
    restoreCMDragonFireSounds()
    removeCMDragonFFireSoundTWO()
    if cmDragonCurrentSkinClone then
        pcall(function() cmDragonCurrentSkinClone:Destroy(); cmDragonCurrentSkinClone = nil end)
    end
    restoreCMDragonOriginalParts()
    cmDragonLastWeapon = nil
end

-- Cryogen функции
local function hideCMPartCompletely(part)
    if part:IsA("BasePart") or part:IsA("MeshPart") then
        part.Transparency = 1
        part.LocalTransparencyModifier = 1
        part.CastShadow = false
        part.CanCollide = false
        part.CanTouch = false
        part.Massless = true
        part.Material = Enum.Material.ForceField
        for _, child in ipairs(part:GetChildren()) do
            if child:IsA("Decal") or child:IsA("Texture") or child:IsA("SurfaceAppearance") then child:Destroy() end
        end
    end
end

local function processCMCryogenModelParts(model)
    if not model then return nil end
    local partsToRemove = {"LaserPart","OpticPart","SuppressorPart"}
    local partsToHide = {"Bolt","ChargingHandle","Dustcover","HoloSightPart","OpticLensPart","OpticLensPart2","Neonpart","HandlePart","WeaponHandle"}
    for _, descendant in pairs(model:GetDescendants()) do
        if descendant:IsA("BasePart") or descendant:IsA("MeshPart") then
            local partName = descendant.Name
            for _, unwantedName in pairs(partsToRemove) do
                if partName == unwantedName then descendant:Destroy(); break end
            end
            for _, hideName in pairs(partsToHide) do
                if partName == hideName then hideCMPartCompletely(descendant); break end
            end
        end
    end
    for _, obj in pairs(model:GetDescendants()) do
        if obj.Name == "ParticleParts" then
            for _, part in pairs(obj:GetDescendants()) do
                if part:IsA("BasePart") or part:IsA("MeshPart") then hideCMPartCompletely(part) end
            end
        end
    end
    return true
end

local function loadCMCryogenModel()
    local isSearching = false
    if isSearching then return nil end
    isSearching = true
    local foundModel = nil
    local searchLocations = {game:GetService("ReplicatedStorage"),game:GetService("ServerStorage"),game:GetService("Workspace"),game:GetService("StarterPack"),game:GetService("StarterGui"),game:GetService("Lighting")}
    local storage = game:GetService("ReplicatedStorage"):FindFirstChild("Storage")
    if storage then
        for _, child in ipairs(storage:GetChildren()) do
            if string.lower(child.Name) == "mp7_cryogen" then foundModel = child; break end
        end
    end
    if not foundModel then
        for _, location in ipairs(searchLocations) do
            if location then
                local function searchInContainer(container, depth)
                    if depth > 3 then return false end
                    for _, item in ipairs(container:GetChildren()) do
                        if string.lower(item.Name) == "mp7_cryogen" then
                            if item:IsA("Model") or item:IsA("BasePart") or item:IsA("MeshPart") then foundModel = item; return true end
                        end
                        if #item:GetChildren() > 0 then if searchInContainer(item, depth + 1) then return true end end
                    end
                    return false
                end
                if searchInContainer(location, 0) then break end
            end
        end
    end
    if foundModel then
        cmCryogenModel = foundModel:Clone()
        processCMCryogenModelParts(cmCryogenModel)
        for _, part in pairs(cmCryogenModel:GetDescendants()) do
            if part:IsA("BasePart") or part:IsA("MeshPart") then
                local shouldHide = false
                local hideNames = {"Bolt","ChargingHandle","Dustcover","HoloSightPart","OpticLensPart","OpticLensPart2","Neonpart","HandlePart","WeaponHandle"}
                for _, hideName in pairs(hideNames) do if part.Name == hideName then shouldHide = true; break end end
                if not shouldHide then
                    local ancestor = part.Parent
                    while ancestor do if ancestor.Name == "ParticleParts" then shouldHide = true; break end; ancestor = ancestor.Parent end
                end
                if shouldHide then hideCMPartCompletely(part) else part.Transparency = 0; part.LocalTransparencyModifier = 0 end
                part.CastShadow = false; part.CanCollide = false; part.CanTouch = false; part.Massless = true; part.Locked = true
            end
        end
    end
    isSearching = false
    return cmCryogenModel ~= nil
end

local function hideCMCryogenOriginalParts(weapon)
    if not weapon then return end
    cmCryogenOriginalPartsTransparency = {}
    for _, part in ipairs(weapon:GetDescendants()) do
        if (part:IsA("BasePart") or part:IsA("MeshPart")) and part.Transparency < 1 then
            cmCryogenOriginalPartsTransparency[part] = part.Transparency
            part.Transparency = 1
            part.LocalTransparencyModifier = 1
        end
    end
end

local function restoreCMCryogenOriginalParts()
    for part, transparency in pairs(cmCryogenOriginalPartsTransparency) do
        if part and part.Parent then pcall(function() part.Transparency = transparency; part.LocalTransparencyModifier = 0 end) end
    end
    cmCryogenOriginalPartsTransparency = {}
end

local function applyCMCryogenSkin(weapon)
    if not weapon or not cmCryogenModel or cmCryogenIsApplyingSkin then return false end
    cmCryogenIsApplyingSkin = true
    if cmCryogenCurrentSkinClone then
        pcall(function() cmCryogenCurrentSkinClone:Destroy() end)
        cmCryogenCurrentSkinClone = nil
    end
    hideCMCryogenOriginalParts(weapon)
    local success = pcall(function()
        local skinClone = cmCryogenModel:Clone()
        local handle = weapon:FindFirstChild("Handle") or weapon:FindFirstChildWhichIsA("BasePart")
        if not handle then skinClone:Destroy(); return false end
        local primaryPart = skinClone.PrimaryPart
        if not primaryPart and skinClone:IsA("Model") then
            for _, part in ipairs(skinClone:GetDescendants()) do
                if part:IsA("BasePart") and part.Name:lower():find("handle") then primaryPart = part; break end
            end
            if not primaryPart then primaryPart = skinClone:FindFirstChildWhichIsA("BasePart") end
        elseif not primaryPart and skinClone:IsA("BasePart") then primaryPart = skinClone end
        if not primaryPart then skinClone:Destroy(); return false end
        if skinClone:IsA("Model") then skinClone.PrimaryPart = primaryPart; skinClone:SetPrimaryPartCFrame(handle.CFrame)
        else primaryPart.CFrame = handle.CFrame end
        local weld = Instance.new("WeldConstraint")
        weld.Part0 = handle; weld.Part1 = primaryPart; weld.Parent = primaryPart
        if skinClone:IsA("Model") then
            for _, part in ipairs(skinClone:GetDescendants()) do
                if part:IsA("BasePart") and part ~= primaryPart then
                    local partWeld = Instance.new("WeldConstraint")
                    partWeld.Part0 = primaryPart; partWeld.Part1 = part; partWeld.Parent = part
                end
            end
        end
        for _, part in ipairs(skinClone:GetDescendants()) do
            if part:IsA("BasePart") or part:IsA("MeshPart") then
                part.Massless = true; part.CanCollide = false; part.CastShadow = false; part.CanQuery = false
                local shouldHide = false
                local hideNames = {"Bolt","ChargingHandle","Dustcover","HoloSightPart","OpticLensPart","OpticLensPart2","Neonpart","HandlePart","WeaponHandle"}
                for _, hideName in pairs(hideNames) do if part.Name == hideName then shouldHide = true; break end end
                if not shouldHide then
                    local ancestor = part.Parent
                    while ancestor do if ancestor.Name == "ParticleParts" then shouldHide = true; break end; ancestor = ancestor.Parent end
                end
                if shouldHide then hideCMPartCompletely(part) else part.Transparency = 0; part.LocalTransparencyModifier = 0 end
            end
        end
        skinClone.Parent = weapon
        cmCryogenCurrentSkinClone = skinClone
        cmCryogenLastWeapon = weapon
        return true
    end)
    cmCryogenIsApplyingSkin = false
    return success
end

local function removeCMCryogenSkin()
    if cmCryogenCurrentSkinClone then pcall(function() cmCryogenCurrentSkinClone:Destroy(); cmCryogenCurrentSkinClone = nil end) end
    restoreCMCryogenOriginalParts()
    cmCryogenLastWeapon = nil
end

-- Heritage функции
local function findAndLoadCMHeritageModel()
    if cmHeritageModel then return true end
    local foundModel = nil
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local storage = replicatedStorage:FindFirstChild("Storage")
    if storage then
        for _, child in ipairs(storage:GetChildren()) do
            local childName = child.Name:lower()
            if childName == "m4a1_heritage" then foundModel = child; break end
        end
        if not foundModel then
            for _, child in ipairs(storage:GetChildren()) do
                local childName = child.Name:lower()
                if string.find(childName, "heritage") and (string.find(childName, "m4") or string.find(childName, "rifle")) then foundModel = child; break end
            end
        end
    end
    if not foundModel then
        local function searchDeep(container, depth) if depth > 5 then return nil end
            for _, item in ipairs(container:GetChildren()) do
                local itemName = item.Name:lower()
                if itemName == "m4a1_heritage" then return item end
                if #item:GetChildren() > 0 then local result = searchDeep(item, depth + 1); if result then return result end end
            end
            return nil
        end
        foundModel = searchDeep(replicatedStorage, 0)
    end
    if not foundModel then
        local serverStorage = game:GetService("ServerStorage")
        if serverStorage then
            for _, item in ipairs(serverStorage:GetChildren()) do
                local itemName = item.Name:lower()
                if itemName == "m4a1_heritage" then foundModel = item; break end
            end
        end
    end
    if foundModel then
        cmHeritageModel = foundModel:Clone()
        for _, part in pairs(cmHeritageModel:GetDescendants()) do
            if part:IsA("BasePart") or part:IsA("MeshPart") then
                part.CanCollide = false; part.Anchored = false; part.Massless = true; part.CanTouch = false; part.CastShadow = false; part.CanQuery = false; part.Locked = true; part.Transparency = 0; part.LocalTransparencyModifier = 0
                if part:IsA("MeshPart") then part.CollisionFidelity = Enum.CollisionFidelity.Box end
            end
        end
        if cmHeritageModel:IsA("Model") then
            local primaryPart = cmHeritageModel.PrimaryPart
            if not primaryPart then
                for _, part in pairs(cmHeritageModel:GetDescendants()) do
                    if part:IsA("BasePart") or part:IsA("MeshPart") then cmHeritageModel.PrimaryPart = part; break end
                end
            end
        end
    end
    return cmHeritageModel ~= nil
end

local function hideCMHeritageOriginalParts(weapon)
    if not weapon then return end
    cmHeritageOriginalPartsTransparency = {}
    local yellowParts = {"BarrelSmore","FlashEmitter","Gas","Gas2","Lens flare","Muzzle Flash 1","Smoke Emitter","Sparkless"}
    for _, part in ipairs(weapon:GetDescendants()) do
        if (part:IsA("BasePart") or part:IsA("MeshPart")) and part.Transparency < 1 then
            local isYellowPart = false
            for _, yellowPartName in ipairs(yellowParts) do if part.Name == yellowPartName then isYellowPart = true; break end end
            if not isYellowPart then
                cmHeritageOriginalPartsTransparency[part] = part.Transparency
                part.Transparency = 1
            end
        end
    end
end

local function restoreCMHeritageOriginalParts()
    for part, transparency in pairs(cmHeritageOriginalPartsTransparency) do
        if part and part.Parent then pcall(function() part.Transparency = transparency; part.LocalTransparencyModifier = 0 end) end
    end
    cmHeritageOriginalPartsTransparency = {}
end

local function removeCMUnwantedParts(model)
    if not model then return end
    local partsToRemove = {"OpticPart","SuppressorPart","LaserPart","UpperRailPart"}
    for _, partName in ipairs(partsToRemove) do
        local part = model:FindFirstChild(partName, true)
        if part then pcall(function() part:Destroy() end) end
    end
end

local function hideCMSpecificParts(model)
    if not model then return end
    local partsToHide = {"WeaponHandle","Bolt","ChargingHandle","Dustcover","HandlePart"}
    for _, partName in ipairs(partsToHide) do
        local part = model:FindFirstChild(partName, true)
        if part and (part:IsA("BasePart") or part:IsA("MeshPart")) then
            pcall(function() part.Transparency = 1; part.LocalTransparencyModifier = 1 end)
        end
    end
    local handlePart = model:FindFirstChild("HandlePart")
    if handlePart and (handlePart:IsA("BasePart") or handlePart:IsA("MeshPart")) then pcall(function() handlePart.Transparency = 1; handlePart.LocalTransparencyModifier = 1 end) end
end

local function makeCMPartsYellow(weapon)
    if not weapon then return end
    cmHeritageOriginalColors = {}; cmHeritageOriginalBrightness = {}; cmHeritageOriginalParticleColors = {}
    local yellowColor = Color3.fromRGB(255, 255, 0); local brightYellow = Color3.fromRGB(255, 255, 100)
    local weaponHandle = weapon:FindFirstChild("WeaponHandle") or weapon:FindFirstChild("Handle")
    if not weaponHandle then return end
    local muzzle = weaponHandle:FindFirstChild("Muzzle"); if not muzzle then return end
    local partsToColor = {"BarrelSmore","FlashEmitter","Gas","Gas2","Lens flare","Muzzle Flash 1","Smoke Emitter","Sparkless"}
    for _, partName in ipairs(partsToColor) do
        local part = muzzle:FindFirstChild(partName)
        if part then
            pcall(function()
                if part:IsA("BasePart") or part:IsA("MeshPart") then
                    cmHeritageOriginalColors[part] = part.Color
                    part.Color = yellowColor
                    part.Material = Enum.Material.Neon
                elseif part:IsA("ParticleEmitter") then
                    if part.Color then cmHeritageOriginalParticleColors[part] = {Color = part.Color}; part.Color = ColorSequence.new(yellowColor) end
                elseif part:IsA("PointLight") or part:IsA("SpotLight") then
                    cmHeritageOriginalColors[part] = part.Color; cmHeritageOriginalBrightness[part] = part.Brightness
                    part.Color = brightYellow; part.Brightness = 10; part.Range = 20
                elseif part:IsA("LensFlare") then cmHeritageOriginalColors[part] = part.Color; part.Color = yellowColor; part.Brightness = 5
                elseif part:IsA("Fire") then
                    cmHeritageOriginalColors[part] = part.Color; cmHeritageOriginalBrightness[part] = part.Heat
                    part.Color = yellowColor; part.Heat = 15; part.Size = 5
                elseif part:IsA("Smoke") then cmHeritageOriginalColors[part] = part.Color; part.Color = Color3.new(1, 1, 0.5); part.Opacity = 0.8; part.Size = 3
                elseif part:IsA("Sparkles") then cmHeritageOriginalColors[part] = part.SparkleColor; part.SparkleColor = yellowColor end
            end)
        end
    end
end

local function restoreCMHeritageOriginalColors()
    for part, color in pairs(cmHeritageOriginalColors) do
        if part and part.Parent then
            pcall(function()
                if part:IsA("BasePart") or part:IsA("MeshPart") then part.Color = color; part.Material = Enum.Material.Plastic
                elseif part:IsA("PointLight") or part:IsA("SpotLight") then
                    part.Color = color; if cmHeritageOriginalBrightness[part] then part.Brightness = cmHeritageOriginalBrightness[part] end; part.Range = 10
                elseif part:IsA("LensFlare") then part.Color = color; part.Brightness = 2
                elseif part:IsA("Fire") then part.Color = color; if cmHeritageOriginalBrightness[part] then part.Heat = cmHeritageOriginalBrightness[part] end; part.Size = 2
                elseif part:IsA("Smoke") then part.Color = color; part.Opacity = 0.5; part.Size = 1
                elseif part:IsA("Sparkles") then part.SparkleColor = color end
            end)
        end
    end
    for emitter, colors in pairs(cmHeritageOriginalParticleColors) do
        if emitter and emitter.Parent then pcall(function() if colors.Color then emitter.Color = colors.Color end end) end
    end
    cmHeritageOriginalColors = {}; cmHeritageOriginalBrightness = {}; cmHeritageOriginalParticleColors = {}
end

local function applyCMHeritageSkin(weapon)
    if not weapon or not cmHeritageModel or cmHeritageIsApplyingSkin then return false end
    cmHeritageIsApplyingSkin = true
    if cmHeritageCurrentSkinClone then pcall(function() cmHeritageCurrentSkinClone:Destroy() end); cmHeritageCurrentSkinClone = nil end
    hideCMHeritageOriginalParts(weapon)
    makeCMPartsYellow(weapon)
    changeCMFireSoundsPlaybackSpeed(weapon, cmHeritageOriginalFireSounds)
    local success = pcall(function()
        local skinClone = cmHeritageModel:Clone()
        removeCMUnwantedParts(skinClone)
        local weaponHandle = weapon:FindFirstChild("Handle")
        if not weaponHandle then
            for _, part in ipairs(weapon:GetDescendants()) do
                if (part:IsA("BasePart") or part:IsA("MeshPart")) and part.Name:lower():find("handle") then weaponHandle = part; break end
            end
            if not weaponHandle then weaponHandle = weapon:FindFirstChildWhichIsA("BasePart") end
        end
        if not weaponHandle then skinClone:Destroy(); return false end
        for _, part in ipairs(skinClone:GetDescendants()) do
            if part:IsA("BasePart") or part:IsA("MeshPart") then
                part.CanCollide = false; part.Anchored = false; part.Massless = true; part.CanTouch = false; part.CastShadow = false; part.CanQuery = false; part.Transparency = 0; part.LocalTransparencyModifier = 0
                if part:IsA("MeshPart") then part.CollisionFidelity = Enum.CollisionFidelity.Box end
            end
        end
        hideCMSpecificParts(skinClone)
        local partsFolder = skinClone:FindFirstChild("parts")
        if partsFolder then for _, meshPart in ipairs(partsFolder:GetDescendants()) do if meshPart:IsA("MeshPart") then meshPart.TextureID = CM_HERITAGE_TEXTURE_ID end end
        else for _, meshPart in ipairs(skinClone:GetDescendants()) do if meshPart:IsA("MeshPart") then meshPart.TextureID = CM_HERITAGE_TEXTURE_ID end end end
        local skinPrimary = nil
        if skinClone:IsA("BasePart") then skinPrimary = skinClone
        else
            if skinClone:IsA("Model") then
                skinPrimary = skinClone.PrimaryPart
                if not skinPrimary then for _, part in ipairs(skinClone:GetDescendants()) do if part:IsA("BasePart") or part:IsA("MeshPart") then skinPrimary = part; break end end end
            else skinPrimary = skinClone:FindFirstChildWhichIsA("BasePart") end
        end
        if skinPrimary then
            skinPrimary.CFrame = weaponHandle.CFrame
            local weld = Instance.new("Weld"); weld.Name = "HeritageSkinWeld"; weld.Part0 = weaponHandle; weld.Part1 = skinPrimary; weld.C0 = CFrame.new(); weld.C1 = CFrame.new(); weld.Parent = skinPrimary
            skinClone.Parent = weapon
            cmHeritageCurrentSkinClone = skinClone; cmHeritageLastWeapon = weapon
            return true
        else skinClone:Destroy(); return false end
    end)
    cmHeritageIsApplyingSkin = false
    return success
end

local function removeCMHeritageSkin()
    restoreCMFireSoundsPlaybackSpeed(cmHeritageOriginalFireSounds)
    restoreCMHeritageOriginalColors()
    if cmHeritageCurrentSkinClone then pcall(function() cmHeritageCurrentSkinClone:Destroy() end); cmHeritageCurrentSkinClone = nil end
    restoreCMHeritageOriginalParts()
    cmHeritageLastWeapon = nil
end

-- WOGW функции
local function findAndLoadCMWogwModel()
    if cmWogwModel then return true end
    local foundModel = nil
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local storage = replicatedStorage:FindFirstChild("Storage")
    if storage then
        for _, child in ipairs(storage:GetChildren()) do
            local childName = child.Name:lower()
            if childName == "m4a1_heritage" then foundModel = child; break end
        end
        if not foundModel then
            for _, child in ipairs(storage:GetChildren()) do
                local childName = child.Name:lower()
                if string.find(childName, "heritage") and (string.find(childName, "m4") or string.find(childName, "rifle")) then foundModel = child; break end
            end
        end
    end
    if not foundModel then
        local function searchDeep(container, depth) if depth > 5 then return nil end
            for _, item in ipairs(container:GetChildren()) do
                local itemName = item.Name:lower()
                if itemName == "m4a1_heritage" then return item end
                if #item:GetChildren() > 0 then local result = searchDeep(item, depth + 1); if result then return result end end
            end
            return nil
        end
        foundModel = searchDeep(replicatedStorage, 0)
    end
    if not foundModel then
        local serverStorage = game:GetService("ServerStorage")
        if serverStorage then
            for _, item in ipairs(serverStorage:GetChildren()) do
                local itemName = item.Name:lower()
                if itemName == "m4a1_heritage" then foundModel = item; break end
            end
        end
    end
    if foundModel then
        cmWogwModel = foundModel:Clone()
        for _, part in pairs(cmWogwModel:GetDescendants()) do
            if part:IsA("BasePart") or part:IsA("MeshPart") then
                part.CanCollide = false; part.Anchored = false; part.Massless = true; part.CanTouch = false; part.CastShadow = false; part.CanQuery = false; part.Locked = true; part.Transparency = 0; part.LocalTransparencyModifier = 0
                if part:IsA("MeshPart") then part.CollisionFidelity = Enum.CollisionFidelity.Box end
            end
        end
        if cmWogwModel:IsA("Model") then
            local primaryPart = cmWogwModel.PrimaryPart
            if not primaryPart then for _, part in pairs(cmWogwModel:GetDescendants()) do if part:IsA("BasePart") or part:IsA("MeshPart") then cmWogwModel.PrimaryPart = part; break end end end
        end
    else if cmHeritageModel then cmWogwModel = cmHeritageModel:Clone(); return true end end
    return cmWogwModel ~= nil
end

local function hideCMWogwOriginalParts(weapon)
    if not weapon then return end
    cmWogwOriginalPartsTransparency = {}
    local redParts = {"BarrelSmore","FlashEmitter","Gas","Gas2","Lens flare","Muzzle Flash 1","Smoke Emitter","Sparkless"}
    for _, part in ipairs(weapon:GetDescendants()) do
        if (part:IsA("BasePart") or part:IsA("MeshPart")) and part.Transparency < 1 then
            local isRedPart = false
            for _, redPartName in ipairs(redParts) do if part.Name == redPartName then isRedPart = true; break end end
            if not isRedPart then cmWogwOriginalPartsTransparency[part] = part.Transparency; part.Transparency = 1 end
        end
    end
end

local function restoreCMWogwOriginalParts()
    for part, transparency in pairs(cmWogwOriginalPartsTransparency) do
        if part and part.Parent then pcall(function() part.Transparency = transparency; part.LocalTransparencyModifier = 0 end) end
    end
    cmWogwOriginalPartsTransparency = {}
end

local function makeCMPartsRed(weapon)
    if not weapon then return end
    cmWogwOriginalColors = {}; cmWogwOriginalBrightness = {}; cmWogwOriginalParticleColors = {}
    local redColor = CM_WOGW_RED_COLOR; local brightRed = Color3.fromRGB(255, 100, 100)
    local weaponHandle = weapon:FindFirstChild("WeaponHandle") or weapon:FindFirstChild("Handle")
    if not weaponHandle then return end
    local muzzle = weaponHandle:FindFirstChild("Muzzle"); if not muzzle then return end
    local partsToColor = {"BarrelSmore","FlashEmitter","Gas","Gas2","Lens flare","Muzzle Flash 1","Smoke Emitter","Sparkless"}
    for _, partName in ipairs(partsToColor) do
        local part = muzzle:FindFirstChild(partName)
        if part then
            pcall(function()
                if part:IsA("BasePart") or part:IsA("MeshPart") then
                    cmWogwOriginalColors[part] = part.Color; part.Color = redColor; part.Material = Enum.Material.Neon
                elseif part:IsA("ParticleEmitter") then
                    if part.Color then cmWogwOriginalParticleColors[part] = {Color = part.Color}; part.Color = ColorSequence.new(redColor) end
                elseif part:IsA("PointLight") or part:IsA("SpotLight") then
                    cmWogwOriginalColors[part] = part.Color; cmWogwOriginalBrightness[part] = part.Brightness
                    part.Color = brightRed; part.Brightness = 10; part.Range = 20
                elseif part:IsA("LensFlare") then cmWogwOriginalColors[part] = part.Color; part.Color = redColor; part.Brightness = 5
                elseif part:IsA("Fire") then
                    cmWogwOriginalColors[part] = part.Color; cmWogwOriginalBrightness[part] = part.Heat
                    part.Color = redColor; part.Heat = 15; part.Size = 5
                elseif part:IsA("Smoke") then cmWogwOriginalColors[part] = part.Color; part.Color = Color3.new(1, 0.5, 0.5); part.Opacity = 0.8; part.Size = 3
                elseif part:IsA("Sparkles") then cmWogwOriginalColors[part] = part.SparkleColor; part.SparkleColor = redColor end
            end)
        end
    end
    for _, child in ipairs(muzzle:GetChildren()) do
        if (child:IsA("ParticleEmitter") or child:IsA("Beam") or child:IsA("PointLight") or child:IsA("Sparkles") or child:IsA("Smoke") or child:IsA("Fire")) and not cmWogwOriginalColors[child] and not cmWogwOriginalParticleColors[child] then
            if child:IsA("ParticleEmitter") then cmWogwOriginalParticleColors[child] = {Color = child.Color}; child.Color = ColorSequence.new(redColor)
            elseif child:IsA("Beam") then cmWogwOriginalColors[child] = child.Color; child.Color = ColorSequence.new(redColor)
            elseif child:IsA("PointLight") then
                cmWogwOriginalColors[child] = child.Color; cmWogwOriginalBrightness[child] = child.Brightness
                child.Color = brightRed; child.Brightness = 10
            elseif child:IsA("Sparkles") then cmWogwOriginalColors[child] = child.SparkleColor; child.SparkleColor = redColor
            elseif child:IsA("Smoke") then cmWogwOriginalColors[child] = child.Color; child.Color = Color3.new(1, 0.5, 0.5)
            elseif child:IsA("Fire") then
                cmWogwOriginalColors[child] = child.Color; cmWogwOriginalBrightness[child] = child.Heat
                child.Color = redColor; child.SecondaryColor = redColor end
        end
    end
end

local function restoreCMWogwOriginalColors()
    for part, color in pairs(cmWogwOriginalColors) do
        if part and part.Parent then
            pcall(function()
                if part:IsA("BasePart") or part:IsA("MeshPart") then part.Color = color; part.Material = Enum.Material.Plastic
                elseif part:IsA("PointLight") or part:IsA("SpotLight") then
                    part.Color = color; if cmWogwOriginalBrightness[part] then part.Brightness = cmWogwOriginalBrightness[part] end; part.Range = 10
                elseif part:IsA("LensFlare") then part.Color = color; part.Brightness = 2
                elseif part:IsA("Fire") then part.Color = color; if cmWogwOriginalBrightness[part] then part.Heat = cmWogwOriginalBrightness[part] end; part.Size = 2
                elseif part:IsA("Smoke") then part.Color = color; part.Opacity = 0.5; part.Size = 1
                elseif part:IsA("Sparkles") then part.SparkleColor = color
                elseif part:IsA("Beam") then part.Color = color end
            end)
        end
    end
    for emitter, colors in pairs(cmWogwOriginalParticleColors) do
        if emitter and emitter.Parent then pcall(function() if colors.Color then emitter.Color = colors.Color end end) end
    end
    cmWogwOriginalColors = {}; cmWogwOriginalBrightness = {}; cmWogwOriginalParticleColors = {}
end

local function applyCMWogwSkin(weapon)
    if not weapon or not cmWogwModel or cmWogwIsApplyingSkin then return false end
    cmWogwIsApplyingSkin = true
    if cmWogwCurrentSkinClone then pcall(function() cmWogwCurrentSkinClone:Destroy() end); cmWogwCurrentSkinClone = nil end
    hideCMWogwOriginalParts(weapon)
    makeCMPartsRed(weapon)
    changeCMFireSoundsPlaybackSpeed(weapon, cmWogwOriginalFireSounds)
    local success = pcall(function()
        local skinClone = cmWogwModel:Clone()
        removeCMUnwantedParts(skinClone)
        local weaponHandle = weapon:FindFirstChild("Handle")
        if not weaponHandle then
            for _, part in ipairs(weapon:GetDescendants()) do
                if (part:IsA("BasePart") or part:IsA("MeshPart")) and part.Name:lower():find("handle") then weaponHandle = part; break end
            end
            if not weaponHandle then weaponHandle = weapon:FindFirstChildWhichIsA("BasePart") end
        end
        if not weaponHandle then skinClone:Destroy(); return false end
        for _, part in ipairs(skinClone:GetDescendants()) do
            if part:IsA("BasePart") or part:IsA("MeshPart") then
                part.CanCollide = false; part.Anchored = false; part.Massless = true; part.CanTouch = false; part.CastShadow = false; part.CanQuery = false; part.Transparency = 0; part.LocalTransparencyModifier = 0
                if part:IsA("MeshPart") then part.CollisionFidelity = Enum.CollisionFidelity.Box end
            end
        end
        hideCMSpecificParts(skinClone)
        local partsFolder = skinClone:FindFirstChild("parts")
        if partsFolder then for _, meshPart in ipairs(partsFolder:GetDescendants()) do if meshPart:IsA("MeshPart") then meshPart.TextureID = CM_WOGW_TEXTURE_ID end end
        else for _, meshPart in ipairs(skinClone:GetDescendants()) do if meshPart:IsA("MeshPart") then meshPart.TextureID = CM_WOGW_TEXTURE_ID end end end
        local skinPrimary = nil
        if skinClone:IsA("BasePart") then skinPrimary = skinClone
        else
            if skinClone:IsA("Model") then
                skinPrimary = skinClone.PrimaryPart
                if not skinPrimary then for _, part in ipairs(skinClone:GetDescendants()) do if part:IsA("BasePart") or part:IsA("MeshPart") then skinPrimary = part; break end end end
            else skinPrimary = skinClone:FindFirstChildWhichIsA("BasePart") end
        end
        if skinPrimary then
            skinPrimary.CFrame = weaponHandle.CFrame
            local weld = Instance.new("Weld"); weld.Name = "WOGWSkinWeld"; weld.Part0 = weaponHandle; weld.Part1 = skinPrimary; weld.C0 = CFrame.new(); weld.C1 = CFrame.new(); weld.Parent = skinPrimary
            skinClone.Parent = weapon; cmWogwCurrentSkinClone = skinClone; cmWogwLastWeapon = weapon
            return true
        else skinClone:Destroy(); return false end
    end)
    cmWogwIsApplyingSkin = false
    return success
end

local function removeCMWogwSkin()
    restoreCMFireSoundsPlaybackSpeed(cmWogwOriginalFireSounds)
    restoreCMWogwOriginalColors()
    if cmWogwCurrentSkinClone then pcall(function() cmWogwCurrentSkinClone:Destroy() end); cmWogwCurrentSkinClone = nil end
    restoreCMWogwOriginalParts()
    cmWogwLastWeapon = nil
end

-- OPM функции
local function findAndLoadCMOpmModel()
    if cmOpmModel then return true end
    local foundModel = nil
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local storage = replicatedStorage:FindFirstChild("Storage")
    if storage then
        for _, child in ipairs(storage:GetChildren()) do
            local childName = child.Name:lower()
            if childName == "m4a1_opm" then foundModel = child; break end
        end
        if not foundModel then
            for _, child in ipairs(storage:GetChildren()) do
                local childName = child.Name:lower()
                if string.find(childName, "opm") and (string.find(childName, "m4") or string.find(childName, "rifle")) then foundModel = child; break end
            end
        end
    end
    if not foundModel then
        local function searchDeep(container, depth) if depth > 5 then return nil end
            for _, item in ipairs(container:GetChildren()) do
                local itemName = item.Name:lower()
                if itemName == "m4a1_opm" then return item end
                if #item:GetChildren() > 0 then local result = searchDeep(item, depth + 1); if result then return result end end
            end
            return nil
        end
        foundModel = searchDeep(replicatedStorage, 0)
    end
    if not foundModel then
        local serverStorage = game:GetService("ServerStorage")
        if serverStorage then
            for _, item in ipairs(serverStorage:GetChildren()) do
                local itemName = item.Name:lower()
                if itemName == "m4a1_opm" then foundModel = item; break end
            end
        end
    end
    if foundModel then
        cmOpmModel = foundModel:Clone()
        for _, descendant in pairs(cmOpmModel:GetDescendants()) do
            if descendant:IsA("Sound") then descendant:Destroy()
            elseif descendant:IsA("ParticleEmitter") or descendant:IsA("Fire") or descendant:IsA("Smoke") or descendant:IsA("Sparkles") then descendant:Destroy()
            elseif descendant:IsA("Beam") then descendant:Destroy()
            elseif descendant:IsA("PointLight") or descendant:IsA("SpotLight") then descendant:Destroy()
            elseif descendant:IsA("Script") or descendant:IsA("LocalScript") then descendant:Destroy() end
            if descendant:IsA("BasePart") or descendant:IsA("MeshPart") then
                descendant.CanCollide = false; descendant.Anchored = false; descendant.Massless = true; descendant.CanTouch = false; descendant.CastShadow = false; descendant.CanQuery = false; descendant.Locked = true; descendant.Transparency = 0; descendant.LocalTransparencyModifier = 0
                if descendant:IsA("MeshPart") then descendant.CollisionFidelity = Enum.CollisionFidelity.Box end
            end
        end
        if cmOpmModel:IsA("Model") then
            local primaryPart = cmOpmModel.PrimaryPart
            if not primaryPart then for _, part in pairs(cmOpmModel:GetDescendants()) do if part:IsA("BasePart") or part:IsA("MeshPart") then cmOpmModel.PrimaryPart = part; break end end end
        end
    end
    return cmOpmModel ~= nil
end

local function hideCMOpmOriginalParts(weapon)
    if not weapon then return end
    cmOpmOriginalPartsTransparency = {}
    for _, part in ipairs(weapon:GetDescendants()) do
        if (part:IsA("BasePart") or part:IsA("MeshPart")) and part.Transparency < 1 then
            cmOpmOriginalPartsTransparency[part] = part.Transparency
            part.Transparency = 1
        end
    end
end

local function restoreCMOpmOriginalParts()
    for part, transparency in pairs(cmOpmOriginalPartsTransparency) do
        if part and part.Parent then pcall(function() part.Transparency = transparency end) end
    end
    cmOpmOriginalPartsTransparency = {}
end

local function removeCMOpmUnwantedParts(model)
    if not model then return end
    local partsToRemove = {"OpticPart","SuppressorPart","LaserPart","UpperRailPart"}
    for _, partName in ipairs(partsToRemove) do
        local part = model:FindFirstChild(partName, true)
        if part then pcall(function() part:Destroy() end) end
    end
end

local function applyCMOpmTextures(model)
    if not model then return end
    for _, descendant in ipairs(model:GetDescendants()) do
        if descendant:IsA("MeshPart") then
            local descendantName = descendant.Name:lower()
            local isWing = false
            local wingKeywords = {"wing","wingpart","wings","wingspart"}
            for _, keyword in ipairs(wingKeywords) do if string.find(descendantName, keyword) then isWing = true; break end end
            if isWing then descendant.TextureID = CM_WINGS_TEXTURE_ID else descendant.TextureID = CM_M4A1_TEXTURE_ID end
        end
    end
    local function checkSpecialParts(parent)
        for _, child in ipairs(parent:GetChildren()) do
            local childName = child.Name:lower()
            if string.find(childName, "wing") then if child:IsA("Model") or child:IsA("Folder") then checkSpecialParts(child) end end
            if child:IsA("MeshPart") and child.TextureID == "" then child.TextureID = CM_M4A1_TEXTURE_ID end
        end
    end
    checkSpecialParts(model)
end

local function applyCMOpmSkin(weapon)
    if not weapon or not cmOpmModel or cmOpmIsApplyingSkin then return false end
    cmOpmIsApplyingSkin = true
    if cmOpmCurrentSkinClone then pcall(function() cmOpmCurrentSkinClone:Destroy() end); cmOpmCurrentSkinClone = nil end
    local success = pcall(function()
        local skinClone = cmOpmModel:Clone()
        removeCMOpmUnwantedParts(skinClone)
        applyCMOpmTextures(skinClone)
        local weaponHandle = weapon:FindFirstChild("Handle")
        if not weaponHandle then
            for _, part in ipairs(weapon:GetDescendants()) do
                if (part:IsA("BasePart") or part:IsA("MeshPart")) and part.Name:lower():find("handle") then weaponHandle = part; break end
            end
            if not weaponHandle then weaponHandle = weapon:FindFirstChildWhichIsA("BasePart") end
        end
        if not weaponHandle then skinClone:Destroy(); return false end
        for _, part in ipairs(skinClone:GetDescendants()) do
            if part:IsA("BasePart") or part:IsA("MeshPart") then
                part.CanCollide = false; part.Anchored = false; part.Massless = true; part.CanTouch = false; part.CastShadow = false; part.CanQuery = false; part.Transparency = 0; part.LocalTransparencyModifier = 0
                if part:IsA("MeshPart") then part.CollisionFidelity = Enum.CollisionFidelity.Box end
            end
        end
        local skinPrimary = nil
        if skinClone:IsA("BasePart") then skinPrimary = skinClone
        else
            if skinClone:IsA("Model") then
                skinPrimary = skinClone.PrimaryPart
                if not skinPrimary then for _, part in ipairs(skinClone:GetDescendants()) do if part:IsA("BasePart") or part:IsA("MeshPart") then skinPrimary = part; break end end end
            else skinPrimary = skinClone:FindFirstChildWhichIsA("BasePart") end
        end
        if skinPrimary then
            skinPrimary.CFrame = weaponHandle.CFrame
            local weld = Instance.new("Weld"); weld.Name = "OPMSkinWeld"; weld.Part0 = weaponHandle; weld.Part1 = skinPrimary; weld.C0 = CFrame.new(); weld.C1 = CFrame.new(); weld.Parent = skinPrimary
            skinClone.Parent = weapon; cmOpmCurrentSkinClone = skinClone; cmOpmLastWeapon = weapon
            return true
        else skinClone:Destroy(); return false end
    end)
    cmOpmIsApplyingSkin = false
    return success
end

local function removeCMOpmSkin()
    if cmOpmCurrentSkinClone then pcall(function() cmOpmCurrentSkinClone:Destroy(); cmOpmCurrentSkinClone = nil end) end
    restoreCMOpmOriginalParts()
    cmOpmLastWeapon = nil
end

-- Showdown функции
local function cleanCMShowdownSkinTextures(model)
    if not model then return end
    
    for _, descendant in ipairs(model:GetDescendants()) do
        if descendant.Name == "MagnumSkinTexture" then
            descendant:Destroy()
        end
    end
end

local function applyCMSurfaceAppearanceToPart(part, textureId)
    if not part then return end
    
    if part.Transparency == 1 or part.LocalTransparencyModifier == 1 then
        return
    end
    
    if part.Name == "OverlayPart" or part.Name == "L1" then
        return
    end
    
    for _, child in ipairs(part:GetChildren()) do
        if child:IsA("SurfaceAppearance") then
            child:Destroy()
        end
    end
    
    local surfaceAppearance = Instance.new("SurfaceAppearance")
    surfaceAppearance.Name = "MagnumSurfaceAppearance"
    surfaceAppearance.ColorMap = textureId or CM_SHOWDOWN_TEXTURE_ID
    surfaceAppearance.Parent = part
    
    part.Material = Enum.Material.SmoothPlastic
    part.Color = Color3.fromRGB(255, 255, 255)
end

local function processCMShowdownSpecialParts(model)
    if not model then return end
    
    for _, descendant in ipairs(model:GetDescendants()) do
        if (descendant:IsA("BasePart") or descendant:IsA("MeshPart")) and 
           (descendant.Name == "OverlayPart" or descendant.Name == "L1") then
            
            for _, child in ipairs(descendant:GetChildren()) do
                if child:IsA("SurfaceAppearance") then
                    child:Destroy()
                end
            end
            
            descendant.Material = Enum.Material.Neon
            descendant.Color = CM_GHOST_GREY_COLOR
            descendant.Transparency = 0
            descendant.LocalTransparencyModifier = 0
        end
    end
end

local function loadCMShowdownModel()
    local success = pcall(function()
        local targetName = "magnum_ind"
        
        local searchLocations = {
            game:GetService("ReplicatedStorage"),
            game:GetService("ServerStorage"),
            game:GetService("Workspace")
        }
        
        local storage = game:GetService("ReplicatedStorage"):FindFirstChild("Storage")
        if storage then
            for _, child in ipairs(storage:GetChildren()) do
                if string.lower(child.Name) == targetName then
                    cmShowdownModel = child:Clone()
                    
                    cleanCMShowdownSkinTextures(cmShowdownModel)
                    
                    for _, part in ipairs(cmShowdownModel:GetDescendants()) do
                        if (part:IsA("BasePart") or part:IsA("MeshPart")) and part.Transparency < 1 then
                            applyCMSurfaceAppearanceToPart(part)
                        end
                    end
                    
                    processCMShowdownSpecialParts(cmShowdownModel)
                    return true
                end
            end
        end
        
        for _, location in ipairs(searchLocations) do
            if location then
                local function searchInContainer(container, depth)
                    if depth > 3 then return false end
                    
                    for _, item in ipairs(container:GetChildren()) do
                        if string.lower(item.Name) == targetName then
                            if item:IsA("Model") or item:IsA("BasePart") or item:IsA("MeshPart") then
                                cmShowdownModel = item:Clone()
                                
                                cleanCMShowdownSkinTextures(cmShowdownModel)
                                
                                for _, part in ipairs(cmShowdownModel:GetDescendants()) do
                                    if (part:IsA("BasePart") or part:IsA("MeshPart")) and part.Transparency < 1 then
                                        applyCMSurfaceAppearanceToPart(part)
                                    end
                                end
                                
                                processCMShowdownSpecialParts(cmShowdownModel)
                                return true
                            end
                        end
                        
                        if #item:GetChildren() > 0 then
                            if searchInContainer(item, depth + 1) then
                                return true
                            end
                        end
                    end
                    return false
                end
                
                if searchInContainer(location, 0) then
                    return true
                end
            end
        end
        return false
    end)
    
    if success and cmShowdownModel then
        for _, obj in ipairs(cmShowdownModel:GetDescendants()) do
            if obj:IsA("BasePart") or obj:IsA("MeshPart") then
                obj.CanCollide = false
                obj.Massless = true
                obj.CastShadow = false
                obj.CanQuery = false
                obj.Transparency = 0
                obj.LocalTransparencyModifier = 0
                
                if obj:IsA("MeshPart") then
                    obj.CollisionFidelity = Enum.CollisionFidelity.Box
                end
            end
        end
        return true
    else
        return false
    end
end

local function hideCMShowdownOriginalParts(weapon)
    if not weapon then return end
    
    cmShowdownOriginalPartsTransparency = {}
    
    for _, part in ipairs(weapon:GetDescendants()) do
        if (part:IsA("BasePart") or part:IsA("MeshPart")) and part.Transparency < 1 then
            cmShowdownOriginalPartsTransparency[part] = part.Transparency
            part.Transparency = 1
        end
    end
end

local function restoreCMShowdownOriginalParts()
    for part, transparency in pairs(cmShowdownOriginalPartsTransparency) do
        if part and part.Parent then
            pcall(function()
                part.Transparency = transparency
                part.LocalTransparencyModifier = 0
            end)
        end
    end
    cmShowdownOriginalPartsTransparency = {}
end

local function hideCMShowdownSpecificPartsInSkin(model)
    if not model then return end
    
    local partsToHide = {
        "BulletRealPart", "BulletsReal",
        "Hammer",
        "HandlePart", "Handle",
        "Thing", "ThingPart",
        "DrumPart", "Drumpart",
        "SouvenirPart",
        "WeaponHandle"
    }
    
    local hideTable = {}
    for _, name in ipairs(partsToHide) do
        hideTable[name:lower()] = true
    end
    
    local function processObject(obj)
        if obj:IsA("BasePart") or obj:IsA("MeshPart") then
            if hideTable[obj.Name:lower()] then
                pcall(function()
                    obj.Transparency = 1
                    obj.LocalTransparencyModifier = 1
                end)
            end
        end
        
        for _, child in ipairs(obj:GetChildren()) do
            processObject(child)
        end
    end
    
    processObject(model)
end

local function modifyCMShowdownWeaponSounds(weapon)
    if not weapon then return end
    
    cmShowdownOriginalSoundEffects = {}
    
    for _, descendant in ipairs(weapon:GetDescendants()) do
        if descendant:IsA("Sound") then
            local soundName = descendant.Name:lower()
            
            if soundName == "firesound1" or soundName == "firesound2" or soundName == "firesound3" then
                cmShowdownOriginalSoundEffects[descendant] = {
                    PlaybackSpeed = descendant.PlaybackSpeed,
                    SoundId = descendant.SoundId
                }
                descendant.PlaybackSpeed = 0.9
            end
        end
    end
    
    local weaponHandle = weapon:FindFirstChild("WeaponHandle") or weapon:FindFirstChild("Handle")
    if not weaponHandle then return end
    
    local muzzle = weaponHandle:FindFirstChild("Muzzle")
    if not muzzle then
        muzzle = Instance.new("Part")
        muzzle.Name = "Muzzle"
        muzzle.Size = Vector3.new(0.2, 0.2, 0.2)
        muzzle.Transparency = 1
        muzzle.CanCollide = false
        muzzle.CanTouch = false
        muzzle.Anchored = false
        muzzle.Massless = true
        muzzle.Parent = weaponHandle
        
        local weld = Instance.new("Weld")
        weld.Part0 = weaponHandle
        weld.Part1 = muzzle
        weld.C0 = CFrame.new(0, 0, 1.5)
        weld.Parent = muzzle
    end
    
    local existingSound = muzzle:FindFirstChild("FFireSoundTWO")
    if existingSound then
        existingSound:Destroy()
    end
    
    local randomSoundId = CM_FIRE_SOUND_IDS[math.random(1, #CM_FIRE_SOUND_IDS)]
    
    local newFireSound = Instance.new("Sound")
    newFireSound.Name = "FFireSoundTWO"
    newFireSound.SoundId = randomSoundId
    newFireSound.Volume = 1
    newFireSound.MaxDistance = 500
    newFireSound.RollOffMode = Enum.RollOffMode.InverseTapered
    newFireSound.PlaybackSpeed = 1
    newFireSound.Looped = false
    newFireSound.Parent = muzzle
    
    local equalizer = Instance.new("EqualizerSoundEffect")
    equalizer.HighGain = 0
    equalizer.MidGain = 0
    equalizer.LowGain = 0
    equalizer.Enabled = true
    equalizer.Parent = newFireSound
    
    cmShowdownOriginalSoundEffects[newFireSound] = true
    
    task.spawn(function()
        while true do
            task.wait(0.1)
            if not newFireSound or not newFireSound.Parent then break end
            
            if not newFireSound.IsPlaying then
                local newRandomSoundId = CM_FIRE_SOUND_IDS[math.random(1, #CM_FIRE_SOUND_IDS)]
                if newFireSound.SoundId ~= newRandomSoundId then
                    newFireSound.SoundId = newRandomSoundId
                end
            end
        end
    end)
end

local function removeCMShowdownModifiedSounds()
    for sound, _ in pairs(cmShowdownOriginalSoundEffects) do
        if sound and sound.Parent then
            pcall(function()
                if sound.Name == "FFireSoundTWO" then
                    sound:Destroy()
                elseif sound.Name:lower():find("firesound") then
                    local originalData = cmShowdownOriginalSoundEffects[sound]
                    if originalData and type(originalData) == "table" then
                        sound.PlaybackSpeed = originalData.PlaybackSpeed
                    end
                end
            end)
        end
    end
    cmShowdownOriginalSoundEffects = {}
    
    local player = game.Players.LocalPlayer
    if player and player.Character then
        for _, tool in ipairs(player.Character:GetChildren()) do
            if tool:IsA("Tool") then
                local weaponHandle = tool:FindFirstChild("WeaponHandle") or tool:FindFirstChild("Handle")
                if weaponHandle then
                    local muzzle = weaponHandle:FindFirstChild("Muzzle")
                    if muzzle then
                        local sound = muzzle:FindFirstChild("FFireSoundTWO")
                        if sound then
                            pcall(function()
                                sound:Destroy()
                            end)
                        end
                    end
                end
            end
        end
    end
end

local function applyCMShowdownTextureToModel(model, isSteeldown)
    if not model then return end
    
    for _, descendant in ipairs(model:GetDescendants()) do
        if descendant:IsA("MeshPart") then
            local descendantName = descendant.Name:lower()
            if descendantName ~= "overlaypart" and descendantName ~= "l1" then
                if descendant:FindFirstChildOfClass("SurfaceAppearance") then
                    for _, surfaceApp in ipairs(descendant:GetChildren()) do
                        if surfaceApp:IsA("SurfaceAppearance") then
                            surfaceApp.ColorMap = isSteeldown and CM_STEELDOWN_TEXTURE_ID or CM_SHOWDOWN_TEXTURE_ID
                        end
                    end
                else
                    descendant.TextureID = isSteeldown and CM_STEELDOWN_TEXTURE_ID or CM_SHOWDOWN_TEXTURE_ID
                end
            end
        end
    end
end

local function applyCMShowdownSkin(weapon, isSteeldown)
    if not weapon or not cmShowdownModel or cmShowdownIsApplyingSkin then return false end
    
    cmShowdownIsApplyingSkin = true
    
    if cmShowdownCurrentSkinClone then
        pcall(function() cmShowdownCurrentSkinClone:Destroy() end)
        cmShowdownCurrentSkinClone = nil
    end
    
    removeCMShowdownModifiedSounds()
    hideCMShowdownOriginalParts(weapon)
    
    local success = pcall(function()
        modifyCMShowdownWeaponSounds(weapon)
        
        local skinClone = cmShowdownModel:Clone()
        hideCMShowdownSpecificPartsInSkin(skinClone)
        applyCMShowdownTextureToModel(skinClone, isSteeldown)
        
        local weaponHandle = weapon:FindFirstChild("Handle")
        if not weaponHandle then
            weaponHandle = weapon:FindFirstChildWhichIsA("BasePart")
        end
        
        if not weaponHandle then
            skinClone:Destroy()
            cmShowdownIsApplyingSkin = false
            return false
        end
        
        for _, part in ipairs(skinClone:GetDescendants()) do
            if part:IsA("BasePart") or part:IsA("MeshPart") then
                part.CanCollide = false
                part.Anchored = false
                part.Massless = true
                part.CanTouch = false
                part.CastShadow = false
                part.CanQuery = false
                
                if part.Transparency == 1 then
                    part.LocalTransparencyModifier = 1
                else
                    part.Transparency = 0
                    part.LocalTransparencyModifier = 0
                end
                
                if part:IsA("MeshPart") then
                    part.CollisionFidelity = Enum.CollisionFidelity.Box
                end
            end
        end
        
        local skinPrimary = nil
        if skinClone:IsA("BasePart") then
            skinPrimary = skinClone
        else
            if skinClone:IsA("Model") then
                skinPrimary = skinClone.PrimaryPart
                if not skinPrimary then
                    for _, part in ipairs(skinClone:GetDescendants()) do
                        if part:IsA("BasePart") or part:IsA("MeshPart") and part.Transparency < 1 then
                            skinPrimary = part
                            break
                        end
                    end
                end
            else
                skinPrimary = skinClone:FindFirstChildWhichIsA("BasePart")
            end
        end
        
        if skinPrimary then
            skinPrimary.CFrame = weaponHandle.CFrame
            
            local weld = Instance.new("Weld")
            weld.Name = "ShowdownSkinWeld"
            weld.Part0 = weaponHandle
            weld.Part1 = skinPrimary
            weld.C0 = CFrame.new()
            weld.C1 = CFrame.new()
            weld.Parent = skinPrimary
            
            skinClone.Parent = weapon
            cmShowdownCurrentSkinClone = skinClone
            cmShowdownLastWeapon = weapon
            cmShowdownIsApplyingSkin = false
            return true
        else
            skinClone:Destroy()
            cmShowdownIsApplyingSkin = false
            return false
        end
    end)
    
    if not success then
        cmShowdownIsApplyingSkin = false
    end
    
    return success
end

local function removeCMShowdownSkin()
    removeCMShowdownModifiedSounds()
    
    if cmShowdownCurrentSkinClone then
        pcall(function()
            cmShowdownCurrentSkinClone:Destroy()
        end)
        cmShowdownCurrentSkinClone = nil
    end
    
    restoreCMShowdownOriginalParts()
    
    cmShowdownLastWeapon = nil
end

-- Eros функции
local function cleanCMErosSkinTextures(model)
    if not model then return end
    for _, descendant in ipairs(model:GetDescendants()) do if descendant.Name == "SawnoffSkinTexture" then descendant:Destroy() end end
end

local function applyCMErosSurfaceAppearanceToPart(part)
    if not part then return end
    if part.Name == "GlowPart" or part.Name == "WeaponHandle" or part.Name == "HandlePart" then part.Transparency = 1; part.LocalTransparencyModifier = 1; return end
    if part.Transparency == 1 or part.LocalTransparencyModifier == 1 then return end
    for _, child in ipairs(part:GetChildren()) do if child:IsA("SurfaceAppearance") then child:Destroy() end end
    local surfaceAppearance = Instance.new("SurfaceAppearance")
    surfaceAppearance.Name = "SawnoffSurfaceAppearance"
    surfaceAppearance.ColorMap = CM_EROS_TEXTURE_ID
    surfaceAppearance.Parent = part
    part.Material = Enum.Material.SmoothPlastic
    part.Color = Color3.fromRGB(255, 255, 255)
end

local function modifyCMErosGlowParts(model)
    if not model then return end
    local partsToHide = {"GlowPart","WeaponHandle","HandlePart"}
    for _, partName in ipairs(partsToHide) do
        local part = model:FindFirstChild(partName)
        if part and (part:IsA("BasePart") or part:IsA("MeshPart")) then
            part.Transparency = 1; part.LocalTransparencyModifier = 1
            for _, child in ipairs(part:GetChildren()) do
                if child:IsA("PointLight") then child.Enabled = false
                elseif child:IsA("ParticleEmitter") then child.Enabled = false
                elseif child:IsA("Beam") then child.Enabled = false
                elseif child:IsA("SurfaceAppearance") then child:Destroy() end
            end
        end
    end
end

local function loadCMErosModel()
    local success = pcall(function()
        local targetName = "sawnoff_eros"
        local searchLocations = {game:GetService("ReplicatedStorage"),game:GetService("ServerStorage"),game:GetService("Workspace")}
        local storage = game:GetService("ReplicatedStorage"):FindFirstChild("Storage")
        if storage then
            for _, child in ipairs(storage:GetChildren()) do
                if string.lower(child.Name) == targetName then
                    cmErosModel = child:Clone()
                    cleanCMErosSkinTextures(cmErosModel)
                    for _, part in ipairs(cmErosModel:GetDescendants()) do
                        if (part:IsA("BasePart") or part:IsA("MeshPart")) and part.Transparency < 1 then applyCMErosSurfaceAppearanceToPart(part) end
                    end
                    modifyCMErosGlowParts(cmErosModel)
                    return true
                end
            end
        end
        for _, location in ipairs(searchLocations) do
            if location then
                local function searchInContainer(container, depth) if depth > 3 then return false end
                    for _, item in ipairs(container:GetChildren()) do
                        if string.lower(item.Name) == targetName then
                            if item:IsA("Model") or item:IsA("BasePart") or item:IsA("MeshPart") then
                                cmErosModel = item:Clone()
                                cleanCMErosSkinTextures(cmErosModel)
                                for _, part in ipairs(cmErosModel:GetDescendants()) do
                                    if (part:IsA("BasePart") or part:IsA("MeshPart")) and part.Transparency < 1 then applyCMErosSurfaceAppearanceToPart(part) end
                                end
                                modifyCMErosGlowParts(cmErosModel)
                                return true
                            end
                        end
                        if #item:GetChildren() > 0 then if searchInContainer(item, depth + 1) then return true end end
                    end
                    return false
                end
                if searchInContainer(location, 0) then return true end
            end
        end
        return false
    end)
    if success and cmErosModel then
        for _, obj in ipairs(cmErosModel:GetDescendants()) do
            if obj:IsA("BasePart") or obj:IsA("MeshPart") then
                obj.CanCollide = false; obj.Massless = true; obj.CastShadow = false; obj.CanQuery = false
                if obj.Name == "GlowPart" or obj.Name == "WeaponHandle" or obj.Name == "HandlePart" then
                    obj.Transparency = 1; obj.LocalTransparencyModifier = 1
                else obj.Transparency = 0; obj.LocalTransparencyModifier = 0 end
                if obj:IsA("MeshPart") then obj.CollisionFidelity = Enum.CollisionFidelity.Box end
            end
        end
        return true
    else return false end
end

local function hideCMErosOriginalParts(weapon)
    if not weapon then return end
    cmErosOriginalPartsTransparency = {}
    for _, part in ipairs(weapon:GetDescendants()) do
        if (part:IsA("BasePart") or part:IsA("MeshPart")) and part.Transparency < 1 then
            cmErosOriginalPartsTransparency[part] = part.Transparency
            part.Transparency = 1
            part.LocalTransparencyModifier = 1
        end
    end
end

local function restoreCMErosOriginalParts()
    for part, transparency in pairs(cmErosOriginalPartsTransparency) do
        if part and part.Parent then pcall(function() part.Transparency = transparency; part.LocalTransparencyModifier = 0 end) end
    end
    cmErosOriginalPartsTransparency = {}
end

local function changeCMEffectsToPink(weapon)
    if not weapon then return end
    local weaponHandle = weapon:FindFirstChild("WeaponHandle") or weapon:FindFirstChild("Handle")
    if not weaponHandle then return end
    local muzzle = weaponHandle:FindFirstChild("Muzzle")
    if not muzzle then return end
    local effectNames = {"Barrel Smoke","FlashEmitter","Gas","Gas2","Lens Flare","Muzzle Flash 1","SmokeEmitter","Sparkles"}
    cmErosOriginalEffectsProperties = {}
    for _, effectName in ipairs(effectNames) do
        local effect = muzzle:FindFirstChild(effectName)
        if effect then
            cmErosOriginalEffectsProperties[effect] = {}
            if effect:IsA("ParticleEmitter") then
                cmErosOriginalEffectsProperties[effect].Color = effect.Color
                effect.Color = ColorSequence.new(CM_EROS_PINK_COLOR)
            elseif effect:IsA("Beam") then
                cmErosOriginalEffectsProperties[effect].Color = effect.Color
                effect.Color = ColorSequence.new(CM_EROS_PINK_COLOR)
            elseif effect:IsA("PointLight") then
                cmErosOriginalEffectsProperties[effect].Color = effect.Color
                effect.Color = CM_EROS_PINK_COLOR
            elseif effect:IsA("Sparkles") then
                cmErosOriginalEffectsProperties[effect].SparkleColor = effect.SparkleColor
                effect.SparkleColor = CM_EROS_PINK_COLOR
            elseif effect:IsA("Smoke") then
                cmErosOriginalEffectsProperties[effect].Color = effect.Color
                effect.Color = Color3.new(1, 0.7, 0.9)
            elseif effect:IsA("Fire") then
                cmErosOriginalEffectsProperties[effect].Color = effect.Color
                cmErosOriginalEffectsProperties[effect].SecondaryColor = effect.SecondaryColor
                effect.Color = CM_EROS_PINK_COLOR
                effect.SecondaryColor = CM_EROS_PINK_COLOR
            end
        end
    end
    for _, child in ipairs(muzzle:GetChildren()) do
        if (child:IsA("ParticleEmitter") or child:IsA("Beam") or child:IsA("PointLight") or child:IsA("Sparkles") or child:IsA("Smoke") or child:IsA("Fire")) and not cmErosOriginalEffectsProperties[child] then
            cmErosOriginalEffectsProperties[child] = {}
            if child:IsA("ParticleEmitter") then
                cmErosOriginalEffectsProperties[child].Color = child.Color
                child.Color = ColorSequence.new(CM_EROS_PINK_COLOR)
            elseif child:IsA("Beam") then
                cmErosOriginalEffectsProperties[child].Color = child.Color
                child.Color = ColorSequence.new(CM_EROS_PINK_COLOR)
            elseif child:IsA("PointLight") then
                cmErosOriginalEffectsProperties[child].Color = child.Color
                child.Color = CM_EROS_PINK_COLOR
            elseif child:IsA("Sparkles") then
                cmErosOriginalEffectsProperties[child].SparkleColor = child.SparkleColor
                child.SparkleColor = CM_EROS_PINK_COLOR
            elseif child:IsA("Smoke") then
                cmErosOriginalEffectsProperties[child].Color = child.Color
                child.Color = Color3.new(1, 0.7, 0.9)
            elseif child:IsA("Fire") then
                cmErosOriginalEffectsProperties[child].Color = child.Color
                cmErosOriginalEffectsProperties[child].SecondaryColor = child.SecondaryColor
                child.Color = CM_EROS_PINK_COLOR
                child.SecondaryColor = CM_EROS_PINK_COLOR
            end
        end
    end
end

local function restoreCMErosOriginalEffects()
    for effect, properties in pairs(cmErosOriginalEffectsProperties) do
        if effect and effect.Parent then
            pcall(function()
                if properties.Color then effect.Color = properties.Color end
                if properties.SparkleColor then effect.SparkleColor = properties.SparkleColor end
                if properties.SecondaryColor then effect.SecondaryColor = properties.SecondaryColor end
            end)
        end
    end
    cmErosOriginalEffectsProperties = {}
end

local function hideCMErosSpecificPartsInSkin(model)
    if not model then return end
    local partsToHide = {"GlowPart","WeaponHandle","HandlePart"}
    for _, partName in ipairs(partsToHide) do
        local part = model:FindFirstChild(partName, true)
        if part and (part:IsA("BasePart") or part:IsA("MeshPart")) then pcall(function() part.Transparency = 1; part.LocalTransparencyModifier = 1 end) end
    end
end

local function applyCMErosSkin(weapon)
    if not weapon or not cmErosModel or cmErosIsApplyingSkin then return false end
    cmErosIsApplyingSkin = true
    if cmErosCurrentSkinClone then pcall(function() cmErosCurrentSkinClone:Destroy() end); cmErosCurrentSkinClone = nil end
    hideCMErosOriginalParts(weapon)
    changeCMEffectsToPink(weapon)
    local success = pcall(function()
        local skinClone = cmErosModel:Clone()
        hideCMErosSpecificPartsInSkin(skinClone)
        local weaponHandle = weapon:FindFirstChild("Handle")
        if not weaponHandle then weaponHandle = weapon:FindFirstChildWhichIsA("BasePart") end
        if not weaponHandle then skinClone:Destroy(); cmErosIsApplyingSkin = false; return false end
        for _, part in ipairs(skinClone:GetDescendants()) do
            if part:IsA("BasePart") or part:IsA("MeshPart") then
                part.CanCollide = false; part.Anchored = false; part.Massless = true; part.CanTouch = false; part.CastShadow = false; part.CanQuery = false
                if part.Name == "GlowPart" or part.Name == "WeaponHandle" or part.Name == "HandlePart" then
                    part.Transparency = 1; part.LocalTransparencyModifier = 1
                else
                    if part.Transparency == 1 then part.LocalTransparencyModifier = 1 else part.Transparency = 0; part.LocalTransparencyModifier = 0 end
                end
                if part:IsA("MeshPart") then part.CollisionFidelity = Enum.CollisionFidelity.Box end
            end
        end
        local skinPrimary = nil
        if skinClone:IsA("BasePart") then skinPrimary = skinClone
        else
            if skinClone:IsA("Model") then
                skinPrimary = skinClone.PrimaryPart
                if not skinPrimary then for _, part in ipairs(skinClone:GetDescendants()) do if part:IsA("BasePart") or part:IsA("MeshPart") and part.Transparency < 1 then skinPrimary = part; break end end end
            else skinPrimary = skinClone:FindFirstChildWhichIsA("BasePart") end
        end
        if skinPrimary then
            skinPrimary.CFrame = weaponHandle.CFrame
            local weld = Instance.new("Weld"); weld.Name = "SawnoffErosSkinWeld"; weld.Part0 = weaponHandle; weld.Part1 = skinPrimary; weld.C0 = CFrame.new(); weld.C1 = CFrame.new(); weld.Parent = skinPrimary
            skinClone.Parent = weapon; cmErosCurrentSkinClone = skinClone; cmErosLastWeapon = weapon; cmErosIsApplyingSkin = false
            return true
        else skinClone:Destroy(); cmErosIsApplyingSkin = false; return false end
    end)
    if not success then cmErosIsApplyingSkin = false end
    return success
end

local function removeCMErosSkin()
    restoreCMErosOriginalEffects()
    if cmErosCurrentSkinClone then pcall(function() cmErosCurrentSkinClone:Destroy(); cmErosCurrentSkinClone = nil end) end
    restoreCMErosOriginalParts()
    cmErosLastWeapon = nil
end

-- Mare функции (TrickShot & White)
local function loadCMMareModel()
    local success = pcall(function()
        local targetName = "mare_trickshot"
        
        local searchLocations = {
            game:GetService("ReplicatedStorage"),
            game:GetService("ServerStorage"),
            game:GetService("Workspace")
        }
        
        local storage = game:GetService("ReplicatedStorage"):FindFirstChild("Storage")
        if storage then
            for _, child in ipairs(storage:GetChildren()) do
                if string.lower(child.Name) == targetName then
                    cmMareModel = child:Clone()
                    return true
                end
            end
        end
        
        for _, location in ipairs(searchLocations) do
            if location then
                local function searchInContainer(container, depth)
                    if depth > 3 then return false end
                    
                    for _, item in ipairs(container:GetChildren()) do
                        if string.lower(item.Name) == targetName then
                            if item:IsA("Model") or item:IsA("BasePart") or item:IsA("MeshPart") then
                                cmMareModel = item:Clone()
                                return true
                            end
                        end
                        
                        if #item:GetChildren() > 0 then
                            if searchInContainer(item, depth + 1) then
                                return true
                            end
                        end
                    end
                    return false
                end
                
                if searchInContainer(location, 0) then
                    return true
                end
            end
        end
        
        return false
    end)
    
    if success and cmMareModel then
        for _, obj in ipairs(cmMareModel:GetDescendants()) do
            if obj:IsA("BasePart") or obj:IsA("MeshPart") then
                obj.CanCollide = false
                obj.Massless = true
                obj.CastShadow = false
                obj.CanQuery = false
                
                if obj:IsA("MeshPart") then
                    obj.CollisionFidelity = Enum.CollisionFidelity.Box
                end
            end
        end
        return true
    else
        return false
    end
end

local function getCMCurrentWeapon()
    local player = game.Players.LocalPlayer
    if not player or not player.Character then return nil end
    
    for _, child in ipairs(player.Character:GetChildren()) do
        if child:IsA("Tool") then
            return child
        end
    end
    
    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        return humanoid:GetEquippedTool()
    end
    
    return nil
end

local function isCMMareWeapon(weapon)
    if not weapon then return false end
    
    if weapon.Name == "Mare's Leg" then
        return true
    end
    
    local weaponName = weapon.Name:lower()
    local keywords = {
        "mare",
        "mares",
        "mare's",
        "mareleg",
        "mare leg",
        "mare's leg",
        "lever",
        "rifle",
        "cowboy",
        "western"
    }
    
    for _, keyword in ipairs(keywords) do
        if string.find(weaponName, keyword) then
            return true
        end
    end
    
    return false
end

local function hideCMMareOriginalParts(weapon)
    if not weapon then return end
    
    cmMareOriginalPartsTransparency = {}
    cmMareOriginalMaterials = {}
    cmMareOriginalColors = {}
    
    for _, part in ipairs(weapon:GetDescendants()) do
        if (part:IsA("BasePart") or part:IsA("MeshPart")) and part.Transparency < 1 then
            cmMareOriginalPartsTransparency[part] = part.Transparency
            cmMareOriginalMaterials[part] = part.Material
            cmMareOriginalColors[part] = part.Color
            
            part.Transparency = 1
            part.LocalTransparencyModifier = 1
        end
    end
end

local function restoreCMMareOriginalParts()
    for part, transparency in pairs(cmMareOriginalPartsTransparency) do
        if part and part.Parent then
            pcall(function()
                part.Transparency = transparency
                part.LocalTransparencyModifier = 0
                
                if cmMareOriginalMaterials[part] then
                    part.Material = cmMareOriginalMaterials[part]
                end
                
                if cmMareOriginalColors[part] then
                    part.Color = cmMareOriginalColors[part]
                end
            end)
        end
    end
    cmMareOriginalPartsTransparency = {}
    cmMareOriginalMaterials = {}
    cmMareOriginalColors = {}
end

local function addCMMareFFireSoundTWO(weapon)
    if not weapon then return nil end
    
    local handle = weapon:FindFirstChild("Handle")
    if not handle then
        handle = weapon:FindFirstChildWhichIsA("BasePart")
        if not handle then
            return nil
        end
    end
    
    local muzzle = handle:FindFirstChild("Muzzle")
    if not muzzle then
        muzzle = Instance.new("Part")
        muzzle.Name = "Muzzle"
        muzzle.Size = Vector3.new(0.2, 0.2, 0.2)
        muzzle.Transparency = 1
        muzzle.CanCollide = false
        muzzle.CanTouch = false
        muzzle.Anchored = false
        muzzle.Massless = true
        muzzle.Parent = handle
        
        local weld = Instance.new("Weld")
        weld.Part0 = handle
        weld.Part1 = muzzle
        weld.C0 = CFrame.new(0, 0, 1.5)
        weld.Parent = muzzle
    end
    
    local existingSound = muzzle:FindFirstChild("FFireSoundTWO")
    if existingSound then
        existingSound.SoundId = CM_MARE_FIRE_SOUND_ID
        cmMareCreatedFFireSoundTWO = existingSound
        return existingSound
    end
    
    local newFireSound = Instance.new("Sound")
    newFireSound.Name = "FFireSoundTWO"
    newFireSound.SoundId = CM_MARE_FIRE_SOUND_ID
    newFireSound.Volume = 1.0
    newFireSound.MaxDistance = 200
    newFireSound.RollOffMode = Enum.RollOffMode.Linear
    newFireSound.PlaybackSpeed = 1.0
    newFireSound.Looped = false
    newFireSound.Parent = muzzle
    
    cmMareCreatedFFireSoundTWO = newFireSound
    return newFireSound
end

local function removeCMMareFFireSoundTWO()
    if cmMareCreatedFFireSoundTWO and cmMareCreatedFFireSoundTWO.Parent then
        pcall(function()
            cmMareCreatedFFireSoundTWO:Destroy()
        end)
        cmMareCreatedFFireSoundTWO = nil
    end
    
    local player = game.Players.LocalPlayer
    if player and player.Character then
        for _, tool in ipairs(player.Character:GetChildren()) do
            if tool:IsA("Tool") then
                local handle = tool:FindFirstChild("Handle")
                if handle then
                    local muzzle = handle:FindFirstChild("Muzzle")
                    if muzzle then
                        local sound = muzzle:FindFirstChild("FFireSoundTWO")
                        if sound then
                            pcall(function()
                                sound:Destroy()
                            end)
                        end
                    end
                end
            end
        end
    end
end

local function makeCMMarePartsColored(weapon)
    if not weapon then return end
    
    cmMareOriginalEffectsProperties = {}
    
    local weaponHandle = weapon:FindFirstChild("Handle")
    if not weaponHandle then return end
    
    local muzzle = weaponHandle:FindFirstChild("Muzzle")
    if not muzzle then
        return
    end
    
    local skinData = cmMareSkins[currentMareSkin]
    if not skinData then return end
    
    local partsToColor = {
        "BarrelSmore",
        "FlashEmitter", 
        "Gas",
        "Gas2",
        "Lens flare",
        "Muzzle Flash 1", 
        "Smoke Emitter",
        "Sparkless"
    }
    
    for _, partName in ipairs(partsToColor) do
        local part = muzzle:FindFirstChild(partName)
        if part then
            pcall(function()
                if part:IsA("BasePart") or part:IsA("MeshPart") then
                    cmMareOriginalEffectsProperties[part] = {Color = part.Color}
                    part.Color = skinData.color
                    part.Material = Enum.Material.Neon
                    
                elseif part:IsA("ParticleEmitter") then
                    if part.Color then
                        cmMareOriginalEffectsProperties[part] = {Color = part.Color}
                        part.Color = ColorSequence.new(skinData.effectColor)
                    end
                    
                elseif part:IsA("PointLight") or part:IsA("SpotLight") then
                    cmMareOriginalEffectsProperties[part] = {
                        Color = part.Color,
                        Brightness = part.Brightness
                    }
                    part.Color = skinData.brightColor
                    part.Brightness = 10
                    part.Range = 20
                    
                elseif part:IsA("LensFlare") then
                    cmMareOriginalEffectsProperties[part] = {Color = part.Color}
                    part.Color = skinData.color
                    part.Brightness = 5
                    
                elseif part:IsA("Fire") then
                    cmMareOriginalEffectsProperties[part] = {
                        Color = part.Color,
                        Heat = part.Heat
                    }
                    part.Color = skinData.color
                    part.Heat = 15
                    part.Size = 5
                    
                elseif part:IsA("Smoke") then
                    cmMareOriginalEffectsProperties[part] = {Color = part.Color}
                    part.Color = skinData.smokeColor
                    part.Opacity = 0.8
                    part.Size = 3
                    
                elseif part:IsA("Sparkles") then
                    cmMareOriginalEffectsProperties[part] = {SparkleColor = part.SparkleColor}
                    part.SparkleColor = skinData.color
                end
            end)
        end
    end
    
    for _, child in ipairs(muzzle:GetChildren()) do
        if (child:IsA("ParticleEmitter") or child:IsA("Beam") or child:IsA("PointLight") or 
            child:IsA("Sparkles") or child:IsA("Smoke") or child:IsA("Fire")) and
            not cmMareOriginalEffectsProperties[child] then
            
            cmMareOriginalEffectsProperties[child] = {}
            
            if child:IsA("ParticleEmitter") then
                cmMareOriginalEffectsProperties[child].Color = child.Color
                child.Color = ColorSequence.new(skinData.effectColor)
                
            elseif child:IsA("Beam") then
                cmMareOriginalEffectsProperties[child].Color = child.Color
                child.Color = ColorSequence.new(skinData.effectColor)
                
            elseif child:IsA("PointLight") then
                cmMareOriginalEffectsProperties[child].Color = child.Color
                cmMareOriginalEffectsProperties[child].Brightness = child.Brightness
                child.Color = skinData.brightColor
                child.Brightness = 10
                
            elseif child:IsA("Sparkles") then
                cmMareOriginalEffectsProperties[child].SparkleColor = child.SparkleColor
                child.SparkleColor = skinData.color
                
            elseif child:IsA("Smoke") then
                cmMareOriginalEffectsProperties[child].Color = child.Color
                child.Color = skinData.smokeColor
                
            elseif child:IsA("Fire") then
                cmMareOriginalEffectsProperties[child].Color = child.Color
                cmMareOriginalEffectsProperties[child].SecondaryColor = child.SecondaryColor
                child.Color = skinData.color
                child.SecondaryColor = skinData.color
            end
        end
    end
end

local function restoreCMMareOriginalEffects()
    for effect, properties in pairs(cmMareOriginalEffectsProperties) do
        if effect and effect.Parent then
            pcall(function()
                if properties.Color then
                    effect.Color = properties.Color
                end
                if properties.Brightness then
                    effect.Brightness = properties.Brightness
                end
                if properties.Heat then
                    effect.Heat = properties.Heat
                end
                if properties.SparkleColor then
                    effect.SparkleColor = properties.SparkleColor
                end
                if properties.SecondaryColor then
                    effect.SecondaryColor = properties.SecondaryColor
                end
            end)
        end
    end
    cmMareOriginalEffectsProperties = {}
end

local function applyCMMareSkin(weapon)
    if not weapon or not cmMareModel or cmMareIsApplyingSkin then return false end
    
    cmMareIsApplyingSkin = true
    
    if cmMareCurrentSkinClone then
        pcall(function()
            cmMareCurrentSkinClone:Destroy()
        end)
        cmMareCurrentSkinClone = nil
    end
    
    hideCMMareOriginalParts(weapon)
    
    makeCMMarePartsColored(weapon)
    
    addCMMareFFireSoundTWO(weapon)
    
    local success = pcall(function()
        local skinClone = cmMareModel:Clone()
        
        local weaponHandle = weapon:FindFirstChild("Handle")
        if not weaponHandle then
            weaponHandle = weapon:FindFirstChildWhichIsA("BasePart")
        end
        
        if not weaponHandle then
            skinClone:Destroy()
            cmMareIsApplyingSkin = false
            return false
        end
        
        local skinData = cmMareSkins[currentMareSkin]
        if not skinData then
            skinClone:Destroy()
            cmMareIsApplyingSkin = false
            return false
        end
        
        for _, part in ipairs(skinClone:GetDescendants()) do
            if part:IsA("BasePart") or part:IsA("MeshPart") then
                part.CanCollide = false
                part.Anchored = false
                part.Massless = true
                part.CanTouch = false
                part.CastShadow = false
                part.CanQuery = false
                
                if part:IsA("MeshPart") then
                    part.CollisionFidelity = Enum.CollisionFidelity.Box
                    part.TextureID = skinData.texture
                end
            end
        end
        
        local partsFolder = skinClone:FindFirstChild("parts")
        if partsFolder then
            for _, meshPart in ipairs(partsFolder:GetDescendants()) do
                if meshPart:IsA("MeshPart") then
                    meshPart.TextureID = skinData.texture
                end
            end
        else
            for _, meshPart in ipairs(skinClone:GetDescendants()) do
                if meshPart:IsA("MeshPart") then
                    meshPart.TextureID = skinData.texture
                end
            end
        end
        
        local skinPrimary = nil
        if skinClone:IsA("BasePart") then
            skinPrimary = skinClone
        else
            if skinClone:IsA("Model") then
                skinPrimary = skinClone.PrimaryPart
                if not skinPrimary then
                    for _, part in ipairs(skinClone:GetDescendants()) do
                        if part:IsA("BasePart") or part:IsA("MeshPart") then
                            skinPrimary = part
                            break
                        end
                    end
                end
            else
                skinPrimary = skinClone:FindFirstChildWhichIsA("BasePart")
            end
        end
        
        if skinPrimary then
            skinPrimary.CFrame = weaponHandle.CFrame
            
            local weld = Instance.new("Weld")
            weld.Name = "MareSkinWeld"
            weld.Part0 = weaponHandle
            weld.Part1 = skinPrimary
            weld.C0 = CFrame.new()
            weld.C1 = CFrame.new()
            weld.Parent = skinPrimary
            
            skinClone.Parent = weapon
            
            cmMareCurrentSkinClone = skinClone
            cmMareLastWeapon = weapon
            cmMareIsApplyingSkin = false
            return true
        else
            skinClone:Destroy()
            cmMareIsApplyingSkin = false
            return false
        end
    end)
    
    if not success then
        cmMareIsApplyingSkin = false
    end
    
    return success
end

local function removeCMMareSkin()
    restoreCMMareOriginalEffects()
    
    removeCMMareFFireSoundTWO()
    
    if cmMareCurrentSkinClone then
        pcall(function()
            cmMareCurrentSkinClone:Destroy()
        end)
        cmMareCurrentSkinClone = nil
    end
    
    restoreCMMareOriginalParts()
    
    cmMareLastWeapon = nil
end

-- Common functions
local function isCMSubzeroWeapon(weapon)
    if not weapon then return false end
    local weaponName = weapon.Name:lower()
    local keywords = {"m4a1","m4","rifle","assault","ak47","ar15"}
    for _, keyword in ipairs(keywords) do if string.find(weaponName, keyword) then return true end end
    return false
end

local function isCMDragonWeapon(weapon)
    if not weapon then return false end
    local weaponName = weapon.Name:lower()
    local keywords = {"m4a1","m4","rifle","assault","ar15","ak47"}
    for _, keyword in ipairs(keywords) do if string.find(weaponName, keyword) then return true end end
    return false
end

local function isCMCryogenWeapon(weapon)
    if not weapon then return false end
    local weaponName = weapon.Name:lower()
    local keywords = {"mp7","smg","submachine","uzi","p90","vector"}
    for _, keyword in ipairs(keywords) do if string.find(weaponName, keyword) then return true end end
    return false
end

local function isCMHeritageWeapon(weapon)
    if not weapon then return false end
    local weaponName = weapon.Name:lower()
    local keywords = {"m4a1","m4","rifle","assault","ar15","ak47"}
    for _, keyword in ipairs(keywords) do if string.find(weaponName, keyword) then return true end end
    return false
end

local function isCMWogwWeapon(weapon)
    if not weapon then return false end
    local weaponName = weapon.Name:lower()
    local keywords = {"m4a1","m4","rifle","assault","ar15","ak47"}
    for _, keyword in ipairs(keywords) do if string.find(weaponName, keyword) then return true end end
    return false
end

local function isCMOpmWeapon(weapon)
    if not weapon then return false end
    local weaponName = weapon.Name:lower()
    local keywords = {"m4a1-1","m4a1","m4","rifle","assault","ar15"}
    for _, keyword in ipairs(keywords) do if string.find(weaponName, keyword) then return true end end
    return false
end

local function isCMShowdownWeapon(weapon)
    if not weapon then return false end
    
    local weaponName = weapon.Name:lower()
    local keywords = {
        "magnum",
        "revolver",
        "pistol",
        "handgun",
        "357",
        "44",
        "deagle",
        "desert eagle"
    }
    
    for _, keyword in ipairs(keywords) do
        if string.find(weaponName, keyword) then
            return true
        end
    end
    
    return false
end

local function isCMErosWeapon(weapon)
    if not weapon then return false end
    if weapon.Name == "Sawn-Off" then return true end
    local weaponName = weapon.Name:lower()
    local keywords = {"sawnoff","sawedoff","sawed-off","sawn-off","shotgun","double barrel","double-barrel","db"}
    for _, keyword in ipairs(keywords) do if string.find(weaponName, keyword) then return true end end
    return false
end

local function removeCMAllSkins()
    removeCMSubzeroSkin()
    removeCMDragonSkin()
    removeCMCryogenSkin()
    removeCMHeritageSkin()
    removeCMWogwSkin()
    removeCMOpmSkin()
    removeCMShowdownSkin()
    removeCMErosSkin()
    removeCMMareSkin()
end

local function checkCMWeapon()
    if not isCMEnabled then return end
    
    local weapon = getCMCurrentWeapon()
    
    if currentCMType == "M4:Subzero" then
        local currentTime = tick()
        if currentTime - cmSubzeroLastCheckTime < CM_SUBZERO_CHECK_INTERVAL then return end
        cmSubzeroLastCheckTime = currentTime
        if weapon and isCMSubzeroWeapon(weapon) then
            if weapon ~= cmSubzeroLastWeapon then
                removeCMSubzeroSkin()
                task.wait(0.1)
                applyCMSubzeroSkin(weapon)
            end
        else
            removeCMSubzeroSkin()
        end
    elseif currentCMType == "M4:Dragon" then
        local currentTime = tick()
        if currentTime - cmDragonLastCheckTime < CM_DRAGON_CHECK_INTERVAL then return end
        cmDragonLastCheckTime = currentTime
        if weapon and isCMDragonWeapon(weapon) then
            if weapon ~= cmDragonLastWeapon then
                removeCMDragonSkin()
                applyCMDragonSkin(weapon)
            end
        else
            removeCMDragonSkin()
        end
    elseif currentCMType == "MP7:Cryogen" then
        local currentTime = tick()
        if currentTime - cmCryogenLastCheckTime < CM_CRYOGEN_CHECK_INTERVAL then return end
        cmCryogenLastCheckTime = currentTime
        if weapon and isCMCryogenWeapon(weapon) then
            if weapon ~= cmCryogenLastWeapon then
                removeCMCryogenSkin()
                applyCMCryogenSkin(weapon)
            end
        else
            removeCMCryogenSkin()
        end
    elseif currentCMType == "M4:Heritage" then
        local currentTime = tick()
        if currentTime - cmHeritageLastCheckTime < CM_HERITAGE_CHECK_INTERVAL then return end
        cmHeritageLastCheckTime = currentTime
        if weapon and isCMHeritageWeapon(weapon) then
            if weapon ~= cmHeritageLastWeapon then
                removeCMHeritageSkin()
                task.wait(0.1)
                applyCMHeritageSkin(weapon)
            end
        else
            removeCMHeritageSkin()
        end
    elseif currentCMType == "M4:Heritage FullBlood" then
        local currentTime = tick()
        if currentTime - cmWogwLastCheckTime < CM_WOGW_CHECK_INTERVAL then return end
        cmWogwLastCheckTime = currentTime
        if weapon and isCMWogwWeapon(weapon) then
            if weapon ~= cmWogwLastWeapon then
                removeCMWogwSkin()
                task.wait(0.1)
                applyCMWogwSkin(weapon)
            end
        else
            removeCMWogwSkin()
        end
    elseif currentCMType == "M4:OPM" then
        local currentTime = tick()
        if currentTime - cmOpmLastCheckTime < CM_OPM_CHECK_INTERVAL then return end
        cmOpmLastCheckTime = currentTime
        if weapon and isCMOpmWeapon(weapon) then
            if weapon ~= cmOpmLastWeapon then
                removeCMOpmSkin()
                task.wait(0.1)
                applyCMOpmSkin(weapon)
            end
        else
            removeCMOpmSkin()
        end
    elseif currentCMType == "Magnum:Showdown" then
        local currentTime = tick()
        if currentTime - cmShowdownLastCheckTime < CM_SHOWDOWN_CHECK_INTERVAL then return end
        cmShowdownLastCheckTime = currentTime
        if weapon and isCMShowdownWeapon(weapon) then
            if weapon ~= cmShowdownLastWeapon then
                removeCMShowdownSkin()
                task.wait(0.1)
                applyCMShowdownSkin(weapon, false) -- false = не Steeldown
            end
        else
            removeCMShowdownSkin()
        end
    elseif currentCMType == "Magnum:Steeldown" then
        local currentTime = tick()
        if currentTime - cmShowdownLastCheckTime < CM_SHOWDOWN_CHECK_INTERVAL then return end
        cmShowdownLastCheckTime = currentTime
        if weapon and isCMShowdownWeapon(weapon) then
            if weapon ~= cmShowdownLastWeapon then
                removeCMShowdownSkin()
                task.wait(0.1)
                applyCMShowdownSkin(weapon, true) -- true = Steeldown
            end
        else
            removeCMShowdownSkin()
        end
    elseif currentCMType == "Sawn-Off:Eros" then
        local currentTime = tick()
        if currentTime - cmErosLastCheckTime < CM_EROS_CHECK_INTERVAL then return end
        cmErosLastCheckTime = currentTime
        if weapon and isCMErosWeapon(weapon) then
            if weapon ~= cmErosLastWeapon then
                removeCMErosSkin()
                task.wait(0.1)
                applyCMErosSkin(weapon)
            end
        else
            removeCMErosSkin()
        end
    elseif currentCMType == "Mare:TrickShot" or currentCMType == "Mare:White" then
        local currentTime = tick()
        if currentTime - cmMareLastCheckTime < CM_MARE_CHECK_INTERVAL then return end
        cmMareLastCheckTime = currentTime
        
        -- Обновляем текущий скин Mare в зависимости от выбранного типа
        if currentCMType == "Mare:TrickShot" then
            currentMareSkin = "TrickShot"
        elseif currentCMType == "Mare:White" then
            currentMareSkin = "White"
        end
        
        if weapon and isCMMareWeapon(weapon) then
            if weapon ~= cmMareLastWeapon then
                removeCMMareSkin()
                task.wait(0.1)
                applyCMMareSkin(weapon)
            end
        else
            removeCMMareSkin()
        end
    end
end

local function loadCMSelectedModel()
    if currentCMType == "M4:Subzero" then
        if not cmSubzeroModel then loadCMSubzeroModel() end
    elseif currentCMType == "M4:Dragon" then
        if not cmDragonModel then loadCMDragonModel() end
    elseif currentCMType == "MP7:Cryogen" then
        if not cmCryogenModel then loadCMCryogenModel() end
    elseif currentCMType == "M4:Heritage" then
        if not cmHeritageModel then findAndLoadCMHeritageModel() end
    elseif currentCMType == "M4:Heritage FullBlood" then
        if not cmWogwModel then findAndLoadCMWogwModel() end
    elseif currentCMType == "M4:OPM" then
        if not cmOpmModel then findAndLoadCMOpmModel() end
    elseif currentCMType == "Magnum:Showdown" or currentCMType == "Magnum:Steeldown" then
        if not cmShowdownModel then loadCMShowdownModel() end
    elseif currentCMType == "Sawn-Off:Eros" then
        if not cmErosModel then loadCMErosModel() end
    elseif currentCMType == "Mare:TrickShot" or currentCMType == "Mare:White" then
        if not cmMareModel then loadCMMareModel() end
    end
end

local function startCMSkinChecking()
    if cmHeartbeatConnection then
        cmHeartbeatConnection:Disconnect()
        cmHeartbeatConnection = nil
    end
    
    cmHeartbeatConnection = game:GetService("RunService").Heartbeat:Connect(function()
        pcall(checkCMWeapon)
    end)
    
    local player = game.Players.LocalPlayer
    if player then
        local charConn = player.CharacterAdded:Connect(function()
            task.wait(1.5)
            removeCMAllSkins()
            pcall(checkCMWeapon)
        end)
        table.insert(cmConnections, charConn)
    end
end

local function stopCMSkinChecking()
    if cmHeartbeatConnection then
        cmHeartbeatConnection:Disconnect()
        cmHeartbeatConnection = nil
    end
    
    removeCMAllSkins()
end

-- UI Elements
local CMDropdown = CustomModelsGroup:AddDropdown("CMType", {
    Text = "Select Model",
    Default = "M4:Subzero",
    Values = {
        "M4:Subzero",
        "M4:Dragon", 
        "M4:Heritage",
        "M4:Heritage FullBlood",
        "M4:OPM",
        "MP7:Cryogen",
        "Magnum:Showdown",
        "Magnum:Steeldown",
        "Sawn-Off:Eros",
        "Mare:TrickShot",
        "Mare:White"
    },
    Tooltip = "Choose which custom model to apply",
})

local CMToggle = CustomModelsGroup:AddToggle("CMEnable", {
    Text = "Enable Custom Model",
    Default = false,
    Tooltip = "Enable/disable custom model application",
})

CMDropdown:OnChanged(function(value)
    local skinMap = {
        ["M4:Subzero"] = "M4:Subzero",
        ["M4:Dragon"] = "M4:Dragon",
        ["M4:Heritage"] = "M4:Heritage",
        ["M4:Heritage FullBlood"] = "M4:Heritage FullBlood",
        ["M4:OPM"] = "M4:OPM",
        ["MP7:Cryogen"] = "MP7:Cryogen",
        ["Magnum:Showdown"] = "Magnum:Showdown",
        ["Magnum:Steeldown"] = "Magnum:Steeldown",
        ["Sawn-Off:Eros"] = "Sawn-Off:Eros",
        ["Mare:TrickShot"] = "Mare:TrickShot",
        ["Mare:White"] = "Mare:White"
    }
    
    local newCMType = skinMap[value]
    if newCMType == currentCMType then return end
    
    if isCMEnabled then
        stopCMSkinChecking()
    end
    
    currentCMType = newCMType
    loadCMSelectedModel()
    
    if isCMEnabled then
        startCMSkinChecking()
    end
end)

CMToggle:OnChanged(function(value)
    isCMEnabled = value
    
    for _, conn in ipairs(cmConnections) do
        if conn then
            pcall(function() conn:Disconnect() end)
        end
    end
    cmConnections = {}
    
    if value then
        loadCMSelectedModel()
        
        local modelLoaded = false
        if currentCMType == "M4:Subzero" and cmSubzeroModel then modelLoaded = true
        elseif currentCMType == "M4:Dragon" and cmDragonModel then modelLoaded = true
        elseif currentCMType == "MP7:Cryogen" and cmCryogenModel then modelLoaded = true
        elseif currentCMType == "M4:Heritage" and cmHeritageModel then modelLoaded = true
        elseif currentCMType == "M4:Heritage FullBlood" and cmWogwModel then modelLoaded = true
        elseif currentCMType == "M4:OPM" and cmOpmModel then modelLoaded = true
        elseif (currentCMType == "Magnum:Showdown" or currentCMType == "Magnum:Steeldown") and cmShowdownModel then modelLoaded = true
        elseif currentCMType == "Sawn-Off:Eros" and cmErosModel then modelLoaded = true
        elseif (currentCMType == "Mare:TrickShot" or currentCMType == "Mare:White") and cmMareModel then modelLoaded = true end
        
        if modelLoaded then
            startCMSkinChecking()
        else
            isCMEnabled = false
            CMToggle:SetValue(false)
        end
    else
        stopCMSkinChecking()
    end
end)

task.spawn(function()
    task.wait(2)
    loadCMSelectedModel()
end)
    local initWeps = getWepsInClass("Pistols"); local initSkins = {}; if #initWeps > 0 then initSkins = getSkinsForWep("Pistols", initWeps[1]) end
    local clsDrop, wepDrop, skinDrop
    SkinL:AddToggle("EnableSkinChanger", {Text="Enable SkinChanger", Default=false, Callback=function(s)
        SkinState.On = s; Lib:Notify(s and "SkinChanger on" or "SkinChanger off", 2)
        if s then if SkinState.Auto then setupAutoApply() end else for _, c in pairs(SkinState.Conns) do if c then c:Disconnect() end end; SkinState.Conns = {} end
    end})
    clsDrop = SkinL:AddDropdown("WeaponClass", {Text="Weapon Class", Values=SkinState.Classes, Default="Pistols", Multi=false, Callback=function(v)
        SkinState.Class = v; SkinState.Weapon = nil; SkinState.Skin = nil; local w = getWepsInClass(v)
        if wepDrop then
            wepDrop:SetValues(w)
            if #w > 0 then wepDrop:SetValue(w[1]); SkinState.Weapon = w[1]; local s = getSkinsForWep(v, w[1])
                if skinDrop then skinDrop:SetValues(s); if #s > 0 then skinDrop:SetValue(s[1]); SkinState.Skin = s[1] else skinDrop:SetValue(""); SkinState.Skin = nil end end
            else wepDrop:SetValue(""); if skinDrop then skinDrop:SetValues({}); skinDrop:SetValue("") end end
        end
        Lib:Notify("Class: "..v, 1)
    end})
    wepDrop = SkinL:AddDropdown("WeaponSelect", {Text="Weapon", Values=initWeps, Default=#initWeps>0 and initWeps[1] or "", Multi=false, Callback=function(v)
        if v == "" or not v then SkinState.Weapon = nil; SkinState.Skin = nil; if skinDrop then skinDrop:SetValues({}); skinDrop:SetValue("") end; return end
        SkinState.Weapon = v; if SkinState.Class then local s = getSkinsForWep(SkinState.Class, v)
            if skinDrop then skinDrop:SetValues(s); if #s > 0 then skinDrop:SetValue(s[1]); SkinState.Skin = s[1] else skinDrop:SetValue(""); SkinState.Skin = nil end end
        end
        Lib:Notify("Weapon: "..v, 1)
    end})
    skinDrop = SkinL:AddDropdown("SkinSelect", {Text="Skin", Values=initSkins, Default=#initSkins>0 and initSkins[1] or "", Multi=false, Callback=function(v)
        if v == "" or not v then SkinState.Skin = nil; return end
        SkinState.Skin = v; if SkinState.Class and SkinState.Weapon and v then
            local sInfo = SkinsDB[SkinState.Class][SkinState.Weapon][v]; if sInfo then
                SkinState.Equipped[SkinState.Weapon] = {class=SkinState.Class, name=v, id=sInfo.id, customApply=sInfo.customApply}
                if SkinState.Auto and SkinState.On then task.wait(0.5); applySkin() else Lib:Notify("Skin: "..v, 1) end
            end
        end
    end})
    SkinR:AddButton({Text="Apply Skin", Func=applySkin})
    SkinR:AddToggle("AutoApply", {Text="Auto Apply", Default=false, Callback=function(s)
        SkinState.Auto = s; setupAutoApply()
        if s and SkinState.On and SkinState.Weapon and SkinState.Skin then task.wait(0.5); applySkin() end
        Lib:Notify(s and "Auto on" or "Auto off", 2)
    end})
    SkinR:AddButton({Text="Save Skins", Func=saveSkins})
    SkinR:AddButton({Text="Load Skins", Func=loadSkins})
    SkinR:AddButton({Text="Clear All Skins", Func=function() SkinState.Equipped = {}; Lib:Notify("Skins cleared", 2) end})
    local status = SkinR:AddLabel("Status: Init...")
    if #initWeps > 0 then SkinState.Weapon = initWeps[1]; if #initSkins > 0 then SkinState.Skin = initSkins[1] end end
    loadSkins()
    task.spawn(function() task.wait(0.5); if clsDrop and clsDrop.Callback then clsDrop.Callback("Pistols") end end)
    SkinState.Loaded = true; status:SetText("Status: Ready"); Lib:Notify("SkinChanger loaded!", 2)
end)

FarmL = Tabs.Farm:AddLeftGroupbox("Auto Farm")
FarmR = Tabs.Farm:AddRightGroupbox("Auto Pick Money")

targetIn = FarmL:AddInput("TargetName", {Text="Target Name", Placeholder="Enter username...", Default="", Callback=function(v) end})

FarmL:AddToggle("AutoFarm", {Text="Auto Farm", Default=false, Callback=function(s)
    S.Farm.Enabled = s
    if s then
        local tn = targetIn.Value; if tn == "" then Toggles.AutoFarm:SetValue(false); Lib:Notify("Enter name!", 3); return end
        S.Farm.Target = findTP(tn); if not S.Farm.Target then Toggles.AutoFarm:SetValue(false); Lib:Notify("Player not found!", 3); return end
        toggleFists()
        if not S.UI.FarmCharConn then S.UI.FarmCharConn = LP.CharacterAdded:Connect(function(c) task.wait(0.2); if S.Farm.Enabled then toggleFists(); Lib:Notify("Fists after death", 2) end end) end
        startESpam(); startDmgDetect(); S.Farm.TeleConn = RS.Heartbeat:Connect(teleToTarget); Lib:Notify("Farm started!", 3)
    else
        if S.Farm.TeleConn then S.Farm.TeleConn:Disconnect() end; if S.Farm.EConn then S.Farm.EConn:Disconnect() end; if S.Farm.DmgConn then S.Farm.DmgConn:Disconnect() end
        if S.UI.FarmCharConn then S.UI.FarmCharConn:Disconnect(); S.UI.FarmCharConn = nil end
        S.Farm.Target = nil; S.Farm.RespawnCD = false; S.Farm.Respawning = false; S.Farm.MaxHP = 115; Lib:Notify("Farm stopped!", 3)
    end
end})

FarmL:AddDivider(); FarmL:AddLabel("Teleports:")
FarmL:AddButton({Text="SaveCube", Func=teleToCube})
FarmL:AddButton({Text="Underground", Func=teleToUnder})
FarmL:AddButton({Text="SaveVibecheck", Func=teleToVibe})

FarmR:AddToggle("AutoPickMoney", {Text="Auto Pick Money", Default=false, Callback=function(v) if v then CollectOn() else CollectOff() end end})

local FarmToolsR = Tabs.Farm:AddRightGroupbox("Tools")

FarmToolsR:AddToggle("SafeESPToggle", {Text="Safe ESP", Default=false, Callback=function(v)
    toggleSafeESP(v)
end})

FarmToolsR:AddToggle("LockpickScaleToggle", {Text="Lockpick Scale", Default=false, Callback=function(v)
    toggleLockpickScale(v)
end})

RageL = Tabs.Combat:AddLeftGroupbox("Ragebot")
RageR = Tabs.Combat:AddRightGroupbox("Rage settings")

RageL:AddToggle("RagebotToggle", {Text="Enable Ragebot", Default=false, Callback=function(v) if v then Rage_on() else Rage_off() end end}):AddKeyPicker("RagebotKey", {Default="None", SyncToggleState=false, Mode="Toggle", Text="Ragebot key", NoUI=false, Callback=function(k) if not canBind() then return end; Toggles.RagebotToggle:SetValue(not Toggles.RagebotToggle.Value) end})

RageL:AddSlider("RageDistance", {Text="Max distance", Default=200, Min=0, Max=1000, Rounding=0, Compact=false, Callback=function(v) Rage_setDist(v) end})
RageL:AddSlider("RageMinHP", {Text="Min enemy HP", Default=15, Min=1, Max=115, Rounding=0, Compact=false, Callback=function(v) Rage_setMinHP(v) end})
RageL:AddSlider("RageFireRate", {Text="Fire rate (1-100)", Default=50, Min=1, Max=100, Rounding=0, Compact=false, Callback=function(v) Rage_setFR(v) end})

RageR:AddToggle("RageUseTargetListToggle", {Text="Target specific players", Default=false, Callback=function(v)
    S.Rage.UseList = v
    if v then if #S.Rage.List == 0 then Lib:Notify("List empty - no attack", 2) else Lib:Notify("List on - attack selected", 2) end
    else Lib:Notify("List off - attack all", 2) end
end})

RageR:AddDropdown("RageTargetDropdown", {SpecialType="Player", Multi=true, Text="Select targets", Callback=function(v) S.Rage.List = v; if #v > 0 then Lib:Notify(#v.." target(s)", 2) else Lib:Notify("List cleared", 2) end end})

RageR:AddDivider(); RageR:AddLabel("Hitsounds:")
RageR:AddToggle("RageSoundsToggle", {Text="Enable hitsounds", Default=true, Tooltip="Sound on headshot", Callback=function(v) HSett.On = v; Lib:Notify(v and "Hitsounds ON" or "Hitsounds OFF", 2) end})
RageR:AddDropdown("RageSoundType", {Values={"Boink","TF2","Rust","CSGO","Hitmarker","Fortnite"}, Default="Rust", Multi=false, Text="Sound type", Callback=function(v) HSett.SoundId = HitSounds[v] or HitSounds["Rust"]; UpdHSound(); Lib:Notify("Sound: "..v, 2) end})
RageR:AddSlider("RageSoundVolume", {Text="Volume", Default=1, Min=0, Max=10, Rounding=1, Compact=false, Callback=function(v) HSett.Vol = v; UpdHSound() end})

SAGroup = Tabs.Combat:AddRightGroupbox("Silent Aim")
SAGroup:AddToggle("SAToggle", {Text="Enable Silent Aim", Default=false, Callback=function(s) toggleSA(s) end})
SAGroup:AddDropdown("SATargetMode", {Values={"Head","Torso","Random"}, Default="Head", Multi=false, Text="Target Mode", Callback=function(v) SA.TMode = v; Lib:Notify("Mode: "..v, 2); if SA.On then _G.CurSATarget = getValidT() end end})
SAGroup:AddLabel("Mode: "..SA.TMode)
SAGroup:AddSlider("SAFOV", {Text="FOV Circle Size", Default=120, Min=10, Max=500, Rounding=0, Compact=false, Callback=function(v) SA.DrawSize = v; if SACircle then SACircle.Radius = v end end})
SAGroup:AddLabel("FOV Color:"):AddColorPicker("FOVColor", {Default=SA.FOVCol, Title="FOV Circle Color", Callback=function(v) SA.FOVCol = v; if SACircle then SACircle.Color = v end; Lib:Notify("FOV color changed", 2) end})
SAGroup:AddSlider("SAHitChance", {Text="Hit Chance %", Default=80, Min=10, Max=100, Rounding=0, Compact=false, Callback=function(v) SA.HitChance = v; Lib:Notify("HC: "..v.."%", 2) end})
SAGroup:AddToggle("SAShowFOV", {Text="Show FOV Circle", Default=true, Callback=function(s) SA.DrawCircle = s; if s and SA.On then crFOVCircle() elseif not s and SACircle then SACircle:Remove(); SACircle = nil end end})
SAGroup:AddSlider("SAMaxDist", {Text="Max Distance", Default=300, Min=50, Max=1000, Rounding=0, Compact=false, Callback=function(v) SA.MaxDist = v end})
SAGroup:AddToggle("SATeamCheck", {Text="Team Check", Default=true, Callback=function(s) SA.ChkTeam = s end})
SAGroup:AddToggle("SAAutoWall", {Text="Auto Wall", Default=true, Callback=function(s) SA.AutoWall = s end})
tInd = SAGroup:AddLabel("Target: None | Mode: "..SA.TMode.." | HC: "..SA.HitChance.."%")
task.spawn(function() while task.wait(0.3) do if SA.On then local t = _G.CurSATarget; if t then local can = canFire(t); if can then tInd:SetText(string.format("Target: %s (%s) | Mode: %s | HC: %d%%", t.Player.Name, t.PName, SA.TMode, SA.HitChance)); tInd.TextColor3 = Color3.fromRGB(0,255,0) else tInd:SetText(string.format("Target: %s (Out) | Mode: %s | HC: %d%%", t.Player.Name, t.PName, SA.TMode, SA.HitChance)); tInd.TextColor3 = Color3.fromRGB(255,50,50) end else tInd:SetText("Target: None | Mode: "..SA.TMode.." | HC: "..SA.HitChance.."%"); tInd.TextColor3 = Color3.fromRGB(255,255,255) end end end end)

FeatL = Tabs.Combat:AddLeftGroupbox("Features")
FeatL:AddToggle("InstReload", {Text="Instant Reload", Default=false, Callback=function(v) toggleInstReload(v) end})
FeatL:AddToggle("MeleeAura", {Text="Melee Aura", Default=false, Callback=function(v) toggleMeleeA(v) end}):AddKeyPicker("MeleeAuraKey", {Default="None", SyncToggleState=false, Mode="Toggle", Text="Melee Aura key", NoUI=false, Callback=function(k) if not canBind() then return end; Toggles.MeleeAura:SetValue(not Toggles.MeleeAura.Value) end})

PlayerL = Tabs.Player:AddLeftGroupbox("Movement")
PlayerL:AddDropdown("FlyMethod", {Values={"Ragdoll","Old"}, Default="Ragdoll", Multi=false, Text="Fly method", Callback=function(v) S.Fly.Method = v; if S.Fly.On then applyFly() end end})
PlayerL:AddToggle("FlyToggle", {Text="Fly", Default=false, Callback=function(v) toggleFly(v) end}):AddKeyPicker("FlyKey", {Default="None", SyncToggleState=false, Mode="Toggle", Text="Fly key", NoUI=false, Callback=function(k) if not canBind() then return end; Toggles.FlyToggle:SetValue(not Toggles.FlyToggle.Value) end})



PlayerR = Tabs.Player:AddRightGroupbox("Player Info")
PlayerR:AddLabel("Player Information:"); PlayerR:AddLabel("Username: "..LP.Name)
if LP.DisplayName then PlayerR:AddLabel("Display Name: "..LP.DisplayName) end
PlayerR:AddLabel("Account Age: "..LP.AccountAge.." days")

-- ==================== KEY STROKES ====================

Tabs.Player:AddRightGroupbox("Key Strokes"):AddToggle("KeyStrokesToggle", {
    Text = "Enable Key Strokes",
    Default = false,
    Tooltip = "Shows WASD, FPS, CPS and Ping on screen",
    Callback = function(state)
        if state then
            pcall(function()
                -- Сначала удаляем все старые GUI с WASD
                local coreGui = game:GetService("CoreGui")
                for _, gui in pairs(coreGui:GetChildren()) do
                    if gui:IsA("ScreenGui") then
                        for _, child in pairs(gui:GetDescendants()) do
                            if child:IsA("TextLabel") and child.Text == "W" then
                                gui:Destroy()
                                break
                            end
                        end
                    end
                end
                
                -- Небольшая задержка чтобы гарантированно удалить
                task.wait(0.1)
                
                -- Загружаем новый
                getgenv().k1 = "W"
                getgenv().k2 = "A"
                getgenv().k3 = "S"
                getgenv().k4 = "D"
                getgenv().backdrop = false
                getgenv().showms = true
                getgenv().showfps = true
                getgenv().showkps = true
                getgenv().animated = true
                getgenv().showarrows = false
                getgenv().keydrag = false
                
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Zirmith/Util-Tools/main/keyStrokes.lua"))()
                Lib:Notify("Key Strokes enabled", 2)
            end)
        else
            pcall(function()
                local coreGui = game:GetService("CoreGui")
                for _, gui in pairs(coreGui:GetChildren()) do
                    if gui:IsA("ScreenGui") then
                        for _, child in pairs(gui:GetDescendants()) do
                            if child:IsA("TextLabel") and child.Text == "W" then
                                gui:Destroy()
                                break
                            end
                        end
                    end
                end
            end)
            Lib:Notify("Key Strokes disabled", 2)
        end
    end
})

Crosshair = {On=false, Size=12, Thick=1, Gap=5, Col=Color3.fromRGB(255,255,255), Outline=true, OutlineCol=Color3.fromRGB(0,0,0), Style="Cross", Dynamic=false, ShowTarget=false, Hitmarker=true}
CLLines = {}; CLDot = nil; CLCircle = nil; TargInd = nil; HitInd = nil

function Crosshair:Setup()
    self:Remove()
    for i=1,4 do CLLines[i] = Drawing.new("Line"); CLLines[i].Visible = false; CLLines[i].Color = self.Col; CLLines[i].Thickness = self.Thick; CLLines[i].ZIndex = 999 end
    CLDot = Drawing.new("Circle"); CLDot.Visible = false; CLDot.Color = self.Col; CLDot.Thickness = self.Thick; CLDot.Filled = true; CLDot.NumSides = 12; CLDot.Radius = 2; CLDot.ZIndex = 999
    TargInd = Drawing.new("Circle"); TargInd.Visible = false; TargInd.Color = Color3.fromRGB(255,0,0); TargInd.Thickness = 2; TargInd.Filled = false; TargInd.NumSides = 24; TargInd.Radius = 20; TargInd.ZIndex = 998
    HitInd = Drawing.new("Square"); HitInd.Visible = false; HitInd.Color = Color3.fromRGB(255,255,255); HitInd.Thickness = 2; HitInd.Filled = false; HitInd.Size = Vector2.new(10,10); HitInd.ZIndex = 1000
    Lib:Notify("Crosshair init", 2)
end

function Crosshair:Update()
    if not self.On then for i=1,4 do if CLLines[i] then CLLines[i].Visible = false end end; if CLDot then CLDot.Visible = false end; if CLCircle then CLCircle.Visible = false end; if TargInd then TargInd.Visible = false end; return end
    local sc = Vector2.new(Cam.ViewportSize.X/2, Cam.ViewportSize.Y/2)
    if self.Style == "Cross" then
        CLLines[1].From = Vector2.new(sc.X, sc.Y - self.Gap - self.Size); CLLines[1].To = Vector2.new(sc.X, sc.Y - self.Gap); CLLines[1].Visible = true
        CLLines[2].From = Vector2.new(sc.X, sc.Y + self.Gap); CLLines[2].To = Vector2.new(sc.X, sc.Y + self.Gap + self.Size); CLLines[2].Visible = true
        CLLines[3].From = Vector2.new(sc.X - self.Gap - self.Size, sc.Y); CLLines[3].To = Vector2.new(sc.X - self.Gap, sc.Y); CLLines[3].Visible = true
        CLLines[4].From = Vector2.new(sc.X + self.Gap, sc.Y); CLLines[4].To = Vector2.new(sc.X + self.Gap + self.Size, sc.Y); CLLines[4].Visible = true
        if CLDot then CLDot.Visible = false end; if CLCircle then CLCircle.Visible = false end
    elseif self.Style == "Dot" then
        for i=1,4 do if CLLines[i] then CLLines[i].Visible = false end end; if CLCircle then CLCircle.Visible = false end
        if CLDot then CLDot.Position = sc; CLDot.Visible = true end
    elseif self.Style == "Circle" then
        for i=1,4 do if CLLines[i] then CLLines[i].Visible = false end end; if CLDot then CLDot.Visible = false end
        if not CLCircle then CLCircle = Drawing.new("Circle"); CLCircle.Visible = true; CLCircle.Color = self.Col; CLCircle.Thickness = self.Thick; CLCircle.Filled = false; CLCircle.NumSides = 24; CLCircle.Radius = self.Size; CLCircle.ZIndex = 999 end
        CLCircle.Position = sc; CLCircle.Visible = true
    end
    if self.ShowTarget then
        local t = self:GetAimT(); if t then local sp = Cam:WorldToViewportPoint(t.Position); if sp.Z > 0 then TargInd.Position = Vector2.new(sp.X, sp.Y); TargInd.Visible = true else TargInd.Visible = false end else TargInd.Visible = false end
    end
end

function Crosshair:GetAimT()
    local maxD = 1000; local mPos = UIS:GetMouseLocation(); local ur = Cam:ViewportPointToRay(mPos.X, mPos.Y)
    local rp = RaycastParams.new(); rp.FilterType = Enum.RaycastFilterType.Blacklist; rp.FilterDescendantsInstances = {LP.Character}
    local rr = workspace:Raycast(ur.Origin, ur.Direction * maxD, rp)
    if rr and rr.Instance then local hp = rr.Instance; local c = hp.Parent; if c and c:FindFirstChild("Humanoid") then return c end end
    return nil
end

function Crosshair:ShowHit() if not self.Hitmarker then return end; if not HitInd then return end
    HitInd.Position = Vector2.new(Cam.ViewportSize.X/2-5, Cam.ViewportSize.Y/2-5); HitInd.Visible = true
    task.spawn(function() task.wait(0.1); if HitInd then HitInd.Visible = false end end) end

function Crosshair:Remove()
    for i=1,4 do if CLLines[i] then CLLines[i]:Remove() end end
    if CLDot then CLDot:Remove(); CLDot = nil end
    if CLCircle then CLCircle:Remove(); CLCircle = nil end
    if TargInd then TargInd:Remove(); TargInd = nil end
    if HitInd then HitInd:Remove(); HitInd = nil end
end

task.spawn(function() task.wait(2); Crosshair:Setup() end)

CLGroup = Tabs.Visuals:AddLeftGroupbox("Crosshair")
CLGroup:AddToggle("CLToggle", {Text="Enable Crosshair", Default=false, Callback=function(v) Crosshair.On = v; Crosshair:Update() end})
CLGroup:AddDropdown("CLStyle", {Values={"Cross","Dot","Circle"}, Default="Cross", Multi=false, Text="Style", Callback=function(v) Crosshair.Style = v; Crosshair:Setup(); Crosshair:Update() end})
CLGroup:AddLabel("Color:"):AddColorPicker("CLColor", {Default=Crosshair.Col, Title="Color", Callback=function(v) Crosshair.Col = v; for i=1,4 do if CLLines[i] then CLLines[i].Color = v end end; if CLDot then CLDot.Color = v end; if CLCircle then CLCircle.Color = v end end})
CLGroup:AddSlider("CLSize", {Text="Size", Default=12, Min=1, Max=50, Rounding=0, Compact=false, Callback=function(v) Crosshair.Size = v; Crosshair:Update() end})
CLGroup:AddSlider("CLGap", {Text="Gap", Default=5, Min=0, Max=20, Rounding=0, Compact=false, Callback=function(v) Crosshair.Gap = v; Crosshair:Update() end})
CLGroup:AddSlider("CLThick", {Text="Thickness", Default=1, Min=1, Max=5, Rounding=0, Compact=false, Callback=function(v) Crosshair.Thick = v; for i=1,4 do if CLLines[i] then CLLines[i].Thickness = v end end; if CLDot then CLDot.Thickness = v end; if CLCircle then CLCircle.Thickness = v end end})
CLGroup:AddToggle("CLShowTarget", {Text="Show Target", Default=false, Callback=function(v) Crosshair.ShowTarget = v end})
CLGroup:AddToggle("CLHitmarker", {Text="Hitmarker", Default=true, Callback=function(v) Crosshair.Hitmarker = v end})
CLGroup:AddToggle("CLDynamic", {Text="Dynamic Crosshair", Default=false, Callback=function(v) Crosshair.Dynamic = v end})

CLConn = RS.RenderStepped:Connect(function() if Crosshair.On then Crosshair:Update() end end)

task.spawn(function()
    task.wait(3)
    if GNX then GNX.OnClientEvent:Connect(function(st,sc,gun,ft,sPos,dirs,silenced) if Crosshair.Hitmarker then Crosshair:ShowHit() end end) end
end)

_G.CleanupCL = function() if CLConn then CLConn:Disconnect() end; Crosshair:Remove() end

-- ==================== VIEW VISUALS SECTION ====================

local ViewVisualsGroup = Tabs.Visuals:AddRightGroupbox("View Visuals")

-- Map Lighting Button with Color Picker
local MapLightingToggle = ViewVisualsGroup:AddToggle("MapLightingToggle", {
    Text = "Map Lighting",
    Default = false,
    Callback = function(state)
        if state then
            MapLighting:Enable()
            Lib:Notify("Map Lighting enabled", 2)
        else
            MapLighting:Disable()
            Lib:Notify("Map Lighting disabled", 2)
        end
    end
})

-- Color Picker for Map Lighting
MapLightingToggle:AddColorPicker("MapLightingColor", {
    Default = MapLighting.LightingColors[1].MainColor,
    Title = "Map Lighting Color",
    Callback = function(color)
        -- Find the closest color in our table
        local closestIndex = 1
        local closestDistance = math.huge
        
        for i, colorInfo in ipairs(MapLighting.LightingColors) do
            local distance = math.sqrt(
                (color.R - colorInfo.MainColor.R)^2 +
                (color.G - colorInfo.MainColor.G)^2 +
                (color.B - colorInfo.MainColor.B)^2
            )
            
            if distance < closestDistance then
                closestDistance = distance
                closestIndex = i
            end
        end
        
        MapLighting.CurrentColorIndex = closestIndex
        if MapLighting.Enabled then
            MapLighting:ApplyLighting()
            Lib:Notify("Map Lighting color changed to " .. MapLighting.LightingColors[closestIndex].Name, 2)
        end
    end
})

-- Map Blur Button
ViewVisualsGroup:AddToggle("MapBlurToggle", {
    Text = "Map Blur",
    Default = false,
    Callback = function(state)
        if state then
            MapBlur:Toggle()
            Lib:Notify("Map Blur enabled", 2)
        else
            MapBlur:Toggle()
            Lib:Notify("Map Blur disabled", 2)
        end
    end
})

-- ==================== ОБНОВЛЕННЫЙ ESP SECTION ====================

VisL = Tabs.Visuals:AddLeftGroupbox("ESP")
VisL:AddToggle("ESPSys", {Text="ESP", Default=false, Callback=function(v) toggleSys(v) end})
VisL:AddToggle("PlayerHL", {Text="Player Highlight", Default=false, Callback=function(v) 
    local ns = toggleHL(v); 
    if ns ~= v then 
        Toggles.PlayerHL:SetValue(ns) 
    end 
end}):AddColorPicker("PlayerHLColor", {
    Default = S.ESP.HlCol,
    Title = "HL Color",
    Callback = function(v) 
        S.ESP.HlCol = v
        updAllHL()
        Lib:Notify("HL Color changed", 2)
    end
})

VisL:AddToggle("ArmsChams", {Text="Arms Chams", Default=false, Callback=function(v) 
    local ns = toggleArms(v); 
    if ns ~= v then 
        Toggles.ArmsChams:SetValue(ns) 
    end 
end}):AddColorPicker("ArmsCol", {
    Default = S.ESP.ArmsCol,
    Title = "Arms Color",
    Callback = function(v) 
        S.ESP.ArmsCol = v
        if S.ESP.ArmsOn and S.ESP.On then 
            updArms() 
        end
        Lib:Notify("Arms Color changed", 2)
    end
})

-- China Hat (только на себя)
VisL:AddToggle("ChinaHatToggle", {
    Text = "China Hat",
    Default = false,
    Callback = function(v)
        if v and not S.ESP.On then
            Toggles.ChinaHatToggle:SetValue(false)
            Lib:Notify("ESP system must be enabled first!", 2)
            return
        end
        toggleChinaHat(v)
    end
}):AddColorPicker("ChinaHatColor", {
    Default = S.ChinaHat.Color,
    Title = "China Hat Color",
    Callback = function(v)
        S.ChinaHat.Color = v
        if S.ChinaHat.Hat then
            local highlight = S.ChinaHat.Hat:FindFirstChildOfClass("Highlight")
            if highlight then
                highlight.FillColor = v
                highlight.OutlineColor = v
            end
        end
        Lib:Notify("China Hat Color changed", 2)
    end
})

-- Player Chams
local ChamsToggle = VisL:AddToggle("PlayerChamsToggle", {
    Text = "Player Chams",
    Default = false,
    Callback = function(v)
        if v and not S.ESP.On then
            Toggles.PlayerChamsToggle:SetValue(false)
            Lib:Notify("ESP system must be enabled first!", 2)
            return
        end
        togglePlayerChams(v)
    end
})

ChamsToggle:AddColorPicker("PlayerChamsVisibleColor", {
    Default = S.PlayerChams.VisibleColor,
    Title = "Visible Color",
    Transparency = 0.5,
    Callback = function(v)
        S.PlayerChams.VisibleColor = v
        for _, playerData in pairs(S.PlayerChams.Adornments) do
            for _, adornmentsTable in pairs(playerData) do
                if adornmentsTable[2] then
                    adornmentsTable[2].Color3 = v
                end
            end
        end
        Lib:Notify("Visible Color changed", 2)
    end
})

ChamsToggle:AddColorPicker("PlayerChamsOccludedColor", {
    Default = S.PlayerChams.OccludedColor,
    Title = "Occluded Color",
    Transparency = 0,
    Callback = function(v)
        S.PlayerChams.OccludedColor = v
        for _, playerData in pairs(S.PlayerChams.Adornments) do
            for _, adornmentsTable in pairs(playerData) do
                if adornmentsTable[1] then
                    adornmentsTable[1].Color3 = v
                end
            end
        end
        Lib:Notify("Occluded Color changed", 2)
    end
})

-- ESP Distance Slider
VisL:AddSlider("ESPDistance", {
    Text = "ESP Distance",
    Default = S.ESPDistance.Value,
    Min = S.ESPDistance.Min,
    Max = S.ESPDistance.Max,
    Rounding = 0,
    Compact = false,
    Callback = function(v)
        S.ESPDistance.Value = v
        Lib:Notify("ESP Distance: " .. v, 2)
    end
})

GunsVisR = Tabs.Visuals:AddRightGroupbox("Guns Visuals")
GunsVisR:AddToggle("BBToggle", {Text="BulletBeam", Default=false, Callback=function(s) _G.BBPersist = s; toggleBB(s) end})
GunsVisR:AddLabel("Beam Color:"):AddColorPicker("BBColor", {Default=BB.Col, Title="BB Color", Callback=function(v) setBBCol(v.r,v.g,v.b); Lib:Notify("BB color changed", 2) end})
GunsVisR:AddSlider("BBThick", {Text="Thickness", Default=0.1, Min=0.01, Max=0.5, Rounding=2, Compact=false, Suffix=" studs", Callback=function(v) BB.Thick = v; Lib:Notify("Thick: "..v, 2) end})
GunsVisR:AddSlider("BBLife", {Text="Lifetime", Default=2, Min=0.1, Max=5, Rounding=1, Compact=false, Suffix="s", Callback=function(v) BB.Life = v; Lib:Notify("Life: "..v.."s", 2) end})
GunsVisR:AddSlider("BBTrans", {Text="Transparency", Default=0.7, Min=0, Max=1, Rounding=2, Compact=false, Callback=function(v) BB.Trans = v; Lib:Notify("Trans: "..math.round(v*100).."%", 2) end})
GunsVisR:AddDropdown("BBType", {Values={"Beam","Line"}, Default="Beam", Multi=false, Text="Type", Callback=function(v) BB.Type = v; clrTracers(); Lib:Notify("Type: "..v, 2) end})
GunsVisR:AddDropdown("BBTex", {Values={"Classic","Lightning","Rainbow","Smoke","Energy","Glitch","Custom"}, Default="Classic", Multi=false, Text="Texture", Callback=function(v) BB.CurTex = v; Lib:Notify("Tex: "..v, 2) end})
GunsVisR:AddInput("CustomTexIn", {Text="Custom Texture ID", Placeholder="rbxassetid://...", Default="", Callback=function(v) if v ~= "" and v:match("^rbxassetid://%d+$") then BB.CustomTex = v; if BB.CurTex == "Custom" then Lib:Notify("Custom tex updated", 2) end elseif v ~= "" then Lib:Notify("Invalid ID", 2) end end})
GunsVisR:AddButton({Text="Clear Tracers", Func=function() clrTracers(); Lib:Notify("Tracers cleared", 2) end, DoubleClick=false})
tcLabel = GunsVisR:AddLabel("Active: 0")
task.spawn(function() while task.wait(0.5) do local cnt=0; for _ in pairs(BB.Active) do cnt=cnt+1 end; tcLabel:SetText("Active: "..cnt) end end)

ViewG = Tabs.Visuals:AddRightGroupbox("View")
ViewG:AddToggle("FBToggle", {Text="Full Bright", Default=false, Callback=function(v) toggleFB(v) end})
ViewG:AddToggle("FOVToggle", {Text="FOV Changer", Default=false, Callback=function(v) toggleFOV(v) end})
ViewG:AddSlider("FOVVal", {Text="FOV Value", Default=80, Min=1, Max=120, Rounding=0, Compact=false, Callback=function(v) setFOVVal(v) end})

-- ==================== VIEW GROUP IN MISC ====================

local ViewGroup = Tabs.Misc:AddRightGroupbox("View")

ViewGroup:AddToggle("BlurToggle", {
    Text = "Blur",
    Default = false,
    Callback = function(value)
        toggleBlur(value)
    end
})

local FreecamToggle = ViewGroup:AddToggle("FreecamToggle", {
    Text = "Freecam",
    Default = false,
    Callback = function(value)
        toggleFreecam(value)
    end
})

FreecamToggle:AddKeyPicker("FreecamKey", {
    Default = "None", 
    SyncToggleState = true,
    Mode = "Toggle",
    Text = "Freecam Key",
    Callback = function() end,
})

ViewGroup:AddSlider("FreecamSpeed", {
    Text = "Freecam Speed",
    Default = 50,
    Min = 50,
    Max = 500,
    Rounding = 1,
    Callback = function(value)
        setFreecamSpeed(value)
    end
})

SkyG = Tabs.Visuals:AddLeftGroupbox("Skybox")
SkyG:AddToggle("SkyToggle", {Text="Enable Skybox", Default=false, Callback=function(v) if v then local cs = Options.SkyDropdown.Value or "Nebula"; enSky(cs) else disSky() end end})
SkyG:AddDropdown("SkyDropdown", {Values={"Nebula","Red Nebula","Nebula Pink","White Galaxy","Purple Nebula"}, Default="Nebula", Multi=false, Text="Skybox Type", Callback=function(v) S.Sky.Selected = v; if Toggles.SkyToggle.Value then enSky(v) end end})

VisL2 = Tabs.Visuals:AddLeftGroupbox("Camera")
VisL2:AddToggle("CamNoclip", {Text="Camera noclip", Default=false, Callback=function(v)
    S.Cam.NoclipOn = v; if v then LP.DevCameraOcclusionMode = Enum.DevCameraOcclusionMode.Invisicam; Lib:Notify("Cam noclip on", 2)
    else LP.DevCameraOcclusionMode = Enum.DevCameraOcclusionMode.Zoom; Lib:Notify("Cam noclip off", 2) end
end})
VisL2:AddToggle("CamMaxDist", {Text="Camera max distance", Default=false, Callback=function(v)
    S.Cam.MaxDistOn = v; if not v then LP.CameraMaxZoomDistance = S.Cam.OrigMaxDist; Lib:Notify("Cam max off", 2)
    else Lib:Notify("Cam max on", 2) end
end})
VisL2:AddSlider("CamMaxDistVal", {Text="Distance", Default=100, Min=10, Max=250, Rounding=0, Compact=false, Callback=function(v) if S.Cam.MaxDistOn then LP.CameraMaxZoomDistance = v end end})

VisVis = Tabs.Visuals:AddRightGroupbox("Visible")
VisVis:AddToggle("InvToggle", {Text="Invisible", Default=false, Callback=function(v) toggleInv(v) end}):AddKeyPicker("InvKey", {Default="None", SyncToggleState=false, Mode="Toggle", Text="Inv key", NoUI=false, Callback=function(k) if not canBind() then return end; Toggles.InvToggle:SetValue(not Toggles.InvToggle.Value) end})

MiscL = Tabs.Misc:AddLeftGroupbox("Character")
MiscL:AddToggle("NoclipToggle", {Text="Noclip", Default=false, Callback=function(v) toggleNoclip(v) end}):AddKeyPicker("NoclipKey", {Default="None", SyncToggleState=false, Mode="Toggle", Text="Noclip key", NoUI=false, Callback=function(k) if not canBind() then return end; Toggles.NoclipToggle:SetValue(not Toggles.NoclipToggle.Value) end})
MiscL:AddToggle("StopNeckToggle", {Text="Stop Neck Move", Default=false, Callback=function(v) toggleStopNeck(v) end})
MiscL:AddToggle("UnbreakToggle", {Text="Unbreak Limbs", Default=false, Callback=function(v) toggleUnbreak(v) end})
MiscL:AddToggle("FakeDownToggle", {Text="Fake Downed", Default=false, Callback=function(v) toggleFakeD(v) end})
MiscL:AddToggle("NoFallToggle", {Text="No Fall Damage", Default=false, Callback=function(v) toggleNoFall(v) end})
MiscL:AddToggle("NoSpikeToggle", {Text="No Spike", Default=false, Callback=function(v) toggleNoSpike(v) end})

MiscL:AddToggle("InfStaminaToggle", {Text="Infinite Stamina", Default=false, Callback=function(v)
    toggleInfStamina(v)
end})

MiscL:AddToggle("NoRecoilToggle", {
    Text = "No Recoil",
    Default = false,
    Callback = function(state)
        toggleNoRecoil(state)
    end
})

MiscR = Tabs.Misc:AddRightGroupbox("Security")
MiscR:AddToggle("AFKToggle", {Text="Anti AFK", Default=false, Callback=function(v) toggleAFK(v) end})
MiscR:AddToggle("AdminChkToggle", {Text="Admin Check", Default=false, Risky=true, Callback=function(v) toggleAdminChk(v) end})

-- ==================== WORLD EFFECTS UI ====================

local WorldEffectsGroup = Tabs.Misc:AddLeftGroupbox("World Effects")

local effectNames = {
    "None",
    "Sunset Paradise",
    "Neon City",
    "Arctic Frost",
    "Toxic Wasteland",
    "Blood Moon",
    "Deep Ocean",
    "Golden Hour",
    "Cyberpunk",
    "Volcanic Ash",
    "Mystic Forest",
    "Desert Storm",
    "Aurora Night",
    "Retro Wave",
    "Apocalypse",
    "Crystal Cave"
}

WorldEffectsGroup:AddDropdown("WorldEffectSelect", {
    Values = effectNames,
    Default = "None",
    Multi = false,
    Text = "Select Effect",
    Callback = function(value)
        if value == "None" then
            WorldEffects:Disable()
            Lib:Notify("World Effect disabled", 2)
        else
            WorldEffects:Enable(value)
            Lib:Notify("Applied: " .. value, 2)
        end
    end
})

WorldEffectsGroup:AddButton({
    Text = "Clear Effect",
    Func = function()
        WorldEffects:Disable()
        if Options.WorldEffectSelect then
            Options.WorldEffectSelect:SetValue("None")
        end
        Lib:Notify("World Effect cleared", 2)
    end,
    DoubleClick = false
})

-- ==================== END WORLD EFFECTS UI ====================

SetL = Tabs.Settings:AddLeftGroupbox("Configuration")
TM:SetLibrary(Lib); SM:SetLibrary(Lib)
SM:SetIgnoreIndexes({'MenuKeybind'}); SM:IgnoreThemeSettings(); SM:SetFolder('Starlight/configs')
SetR = Tabs.Settings:AddRightGroupbox("Theme")
TM:ApplyToTab(Tabs.Settings); SM:BuildConfigSection(Tabs.Settings)

SetL:AddDivider(); SetL:AddLabel("Script Management")
SetL:AddButton({Text="Unload Script", Func=function()
    for _, t in pairs(Toggles) do if t and t.Keypicker then pcall(function() t.Keypicker:Destroy() end) end end
    if S.Rage.On then Rage_off() end; if S.Farm.Enabled then Toggles.AutoFarm:SetValue(false) end
    if S.Collect.On then CollectOff() end; if S.Fly.On then toggleFly(false) end
    if S.Noclip.On then toggleNoclip(false) end; if S.StopNeck.On then toggleStopNeck(false) end
    if S.Unbreak.On then toggleUnbreak(false) end; if S.FakeDown.On then toggleFakeD(false) end
    if S.NoFall.On then toggleNoFall(false) end; if S.NoSpike.On then toggleNoSpike(false) end
    if S.InstReload.On then toggleInstReload(false) end; if S.MeleeA.On then toggleMeleeA(false) end
    if S.Shadow.Active then _G.DeactivateShadow() end; if S.AdminChk.On then toggleAdminChk(false) end
    if S.AntiAFK.On then toggleAFK(false) end; if S.FullBright.On then disFB() end
    if S.FOV.On then FOV_off() end; if S.ESP.On then toggleSys(false) end
    if S.Sky.On then disSky() end; if BB.On then toggleBB(false) end
    if SA.On then cleanupSA() end
    if S.SafeESP.On then disableSafeESP() end
    if S.LockpickScale.On then disableLockpickScale() end
    if S.InfStamina.On then disableInfStamina() end
    if S.ChinaHat.Enabled then toggleChinaHat(false) end
    if S.PlayerChams.Enabled then togglePlayerChams(false) end
    if S.AimBot.Enabled then cleanupAimBot() end
    if S.Blur.Enabled then disableBlur() end
    if S.Freecam.Enabled then disableFreecam() end
    if S.NoRecoil.Enabled then disableNoRecoil() end -- ДОБАВЛЕНО: отключаем No Recoil
    if MapLighting.Enabled then MapLighting:Disable() end
    if MapBlur.Active then MapBlur:Toggle() end
    if WorldEffects.Enabled then WorldEffects:Disable() end
    if Toggles.KeyStrokesToggle and Toggles.KeyStrokesToggle.Value then
        Toggles.KeyStrokesToggle:SetValue(false)
    end
    
    _G.InvPersist = false; _G.FlyPersist = false; _G.MeleePersist = false; _G.NoclipPersist = false
    _G.AFKPersist = false; _G.FBPersist = false; _G.FOVPersist = false; _G.BBPersist = false
    if S.Cam.NoclipOn then LP.DevCameraOcclusionMode = Enum.DevCameraOcclusionMode.Zoom end
    if S.Cam.MaxDistOn then LP.CameraMaxZoomDistance = S.Cam.OrigMaxDist end
    _G.CleanupCL()
    if HSound then HSound:Stop(); HSound:Destroy() end
    clrTracers()
    S = {
        Farm = {Enabled=false, Target=nil},
        ESP = {On=false, HlOn=false},
        Collect = {On=false},
        Fly = {On=false},
        Rage = {On=false, List={}},
        Noclip = {On=false},
        StopNeck = {On=false},
        Unbreak = {On=false, Conns={}},
        FakeDown = {On=false},
        NoFall = {On=false, Conns={}},
        NoSpike = {On=false},
        InstReload = {On=false, Conns={}},
        MeleeA = {On=false},
        Shadow = {Active=false, Usable=true},
        AdminChk = {On=false},
        AntiAFK = {On=false},
        FullBright = {On=false},
        FOV = {On=false},
        Sky = {On=false},
        SafeESP = {On=false, Highlights={}, Billboards={}, ResetTimers={}, FrozenPositions={}},
        LockpickScale = {On=false, Connection=nil},
        InfStamina = {On=false, Connection=nil},
        ChinaHat = {Enabled=false, Color=Color3.fromRGB(255,105,180), Hat=nil, Connection=nil},
        PlayerChams = {Enabled=false, VisibleColor=Color3.fromRGB(255,0,0), OccludedColor=Color3.fromRGB(255,255,255), WallColor=Color3.fromRGB(0,255,255), Adornments={}, Connection=nil},
        ESPDistance = {Value=100, Min=50, Max=1000},
        AimBot = {Enabled=false, Connection=nil, Target=nil, FOVCircle=nil, FOVUpdateConnection=nil, FOVPosition=Vector2.new(Cam.ViewportSize.X/2, Cam.ViewportSize.Y/2)},
        Blur = {Enabled=false, BlurEffect=nil, Connection=nil, LastLookVector=nil, CurrentLookVector=nil, RotationSpeed=0},
        Freecam = {Enabled=false, Speed=50, Connection=nil, KeysDown={}, Rotating=false, OnMobile=not UIS.KeyboardEnabled},
        NoRecoil = {Enabled=false, Connections={}, WeaponCache={}, OriginalValues={}, Settings={GunMods={NoRecoil=true, Spread=true, SpreadAmount=0}}}
    }
    Lib:Notify("Script fully unloaded!", 3); task.wait(1)
    if Lib.Unload then Lib:Unload() end
end, DoubleClick=false})

S.Cam.OrigMaxDist = LP.CameraMaxZoomDistance; updCamSet()
Lib:Notify("Starlight.cc loaded!", 3)

task.spawn(function()
    task.wait(2)
    if _G.FlyPersist then toggleFly(true) end
    if _G.InvPersist then toggleInv(true) end
    if _G.MeleePersist then toggleMeleeA(true) end
    if _G.NoclipPersist then toggleNoclip(true) end
    if _G.AFKPersist then toggleAFK(true) end
    if _G.FBPersist then toggleFB(true) end
    if _G.FOVPersist then toggleFOV(true) end
    if _G.BBPersist then task.wait(4); toggleBB(true) end
end)

LP.CharacterAdded:Connect(function(c)
    task.wait(1)
    if S.ESP.ArmsOn and S.ESP.On then updArms() end
    onCharAdd(c)
end)

task.spawn(function()
    while task.wait(1) do
        local ct = tick(); local toRem = {}
        for id, t in pairs(BB.Active) do if ct - t.Created > BB.Life + 2 then table.insert(toRem, id) end end
        for _, id in ipairs(toRem) do
            if BB.Active[id] then pcall(function()
                if BB.Active[id].Beam then BB.Active[id].Beam:Destroy()
                elseif BB.Active[id].Line then BB.Active[id].Line:Remove() end
                if BB.Active[id].Atts then for _, a in ipairs(BB.Active[id].Atts) do if a and a.Parent then a:Destroy() end end end
            end) BB.Active[id] = nil end
        end
    end
end)

game:GetService("ScriptContext").Error:Connect(function(m, t, s) if m:find("Silent") or m:find("Aim") then warn("[SA] Error, clearing..."); pcall(cleanupSA) end end)
game:BindToClose(function() cleanupSA(); cleanupAimBot() end)

_G.CleanupAll = function()
    cleanupSA()
    cleanupAimBot()
    if BB.On then toggleBB(false) end
    if S.Rage.On then Rage_off() end
    toggleSys(false)
    Lib:Notify("All cleared", 3)
end

_G.SAAPI = {
    Toggle = toggleSA,
    Settings = SA,
    GetTarget = getValidT,
    Cleanup = cleanupSA,
    IsEnabled = function() return SA.On end
}

Lib:Notify("SA Ready!", 3)
end


