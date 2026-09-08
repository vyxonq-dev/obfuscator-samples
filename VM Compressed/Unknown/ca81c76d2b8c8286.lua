if _G.EmoteFling_GlobalCleanup then
    pcall(function() _G.EmoteFling_GlobalCleanup() end)
end

local success, VaporLens = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/noicer/vapor-lib/refs/heads/main/vapor.lua"))()
end)

if not success or not VaporLens then
    warn("EmoteFling | Failed to load Vapor Library")
    return
end

-- ============================================================================
-- SERVICES & STATE
-- ============================================================================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local MarketplaceService = game:GetService("MarketplaceService")
local LocalPlayer = Players.LocalPlayer

local ModuleState = _G.ModuleState or { EmoteFlingActive = false, TurboFlingActive = false }
_G.ModuleState = ModuleState

local EmoteFlingConfig = {
    Armed = true,
    AnimId = "133566007754001",
    Speed = 16,
    Active = false,
    Resolving = false,
    UseCustomId = false,
    CustomId = "",
    ToggleKey = Enum.KeyCode.X,
    QuickFireKey = Enum.KeyCode.T,
    NotificationsEnabled = true,
    FloatingButtonsEnabled = true,
    FloatingButtonScale = 0.7,
    antiFallEnabled = true,
    godEnabled = true,
    antiFlingEnabled = true,
    noclipEnabled = true,
}

local EmoteFlingTrack = nil
local lastFireTime = 0
local FIRE_COOLDOWN = 1
local UI_Loaded = false

local PresetAnimations = {
    ["Dropkick"] = "133566007754001",
    ["Dropkicking [TRENDY]"] = "90717656419568",
    ["Tenna Kick"] = "118139885865308",
    ["MMA Kick"] = "88347541858075",
    ["Slap"] = "108225134235478",
    ["Slap2"] = "78221709455150",
    ["Push"] = "135890160317037",
    ["Push2"] = "82070755455634",

}

local PresetNames = { "Dropkick", "Dropkicking [TRENDY]", "Tenna Kick","MMA Kick", "Slap", "Slap2", "Push", "Push2" }
local CONFIG_FILE = "emote_fling_aura.json"

-- Global Connection Tracker to prevent memory leaks
local EventConnections = {}
local function RegisterConnection(name, conn)
    -- Big O: O(1) hash map insertion
    if EventConnections[name] then
        pcall(function() EventConnections[name]:Disconnect() end)
    end
    EventConnections[name] = conn
end

local function DisconnectConnection(name)
    -- Big O: O(1) hash map deletion
    if EventConnections[name] then
        pcall(function() EventConnections[name]:Disconnect() end)
        EventConnections[name] = nil
    end
end

local function Notify(data)
    if not EmoteFlingConfig.NotificationsEnabled then return end
    if VaporLens and VaporLens.Notify then
        VaporLens:Notify(data)
    end
end

local function SaveConfig()
    -- Big O: O(n) for JSON encoding where n is the config size
    local config = {
        Armed = EmoteFlingConfig.Armed,
        AnimId = EmoteFlingConfig.AnimId,
        Speed = EmoteFlingConfig.Speed,
        UseCustomId = EmoteFlingConfig.UseCustomId,
        CustomId = EmoteFlingConfig.CustomId,
        NotificationsEnabled = EmoteFlingConfig.NotificationsEnabled,
        FloatingButtonsEnabled = EmoteFlingConfig.FloatingButtonsEnabled,
        FloatingButtonScale = EmoteFlingConfig.FloatingButtonScale,
        antiFallEnabled = EmoteFlingConfig.antiFallEnabled,
        godEnabled = EmoteFlingConfig.godEnabled,
        antiFlingEnabled = EmoteFlingConfig.antiFlingEnabled,
        noclipEnabled = EmoteFlingConfig.noclipEnabled,
        ToggleKey = (EmoteFlingConfig.ToggleKey and typeof(EmoteFlingConfig.ToggleKey) == "EnumItem") and EmoteFlingConfig.ToggleKey.Name or "K",
        QuickFireKey = (EmoteFlingConfig.QuickFireKey and typeof(EmoteFlingConfig.QuickFireKey) == "EnumItem") and EmoteFlingConfig.QuickFireKey.Name or nil,
    }

    local jsonStr = HttpService:JSONEncode(config)
    pcall(function() writefile(CONFIG_FILE, jsonStr) end)
end

local function LoadConfig()
    -- Big O: O(n) for JSON decoding
    local fileExists = false
    if type(isfile) == "function" then
        pcall(function() fileExists = isfile(CONFIG_FILE) end)
    else
        local ok, _ = pcall(function() return readfile(CONFIG_FILE) end)
        fileExists = ok
    end

    if not fileExists then
        SaveConfig()
        return false
    end

    local ok, content = pcall(function() return readfile(CONFIG_FILE) end)

    if ok and content and content ~= "" then
        local decodeOk, config = pcall(function() return HttpService:JSONDecode(content) end)

        if decodeOk and type(config) == "table" then
            EmoteFlingConfig.Armed = config.Armed or false
            EmoteFlingConfig.AnimId = config.AnimId or "133566007754001"
            EmoteFlingConfig.Speed = config.Speed or 16
            EmoteFlingConfig.UseCustomId = config.UseCustomId or false
            EmoteFlingConfig.CustomId = config.CustomId or ""
            EmoteFlingConfig.NotificationsEnabled = config.NotificationsEnabled ~= false
            EmoteFlingConfig.FloatingButtonsEnabled = config.FloatingButtonsEnabled or false
            EmoteFlingConfig.antiFallEnabled = config.antiFallEnabled or false
            EmoteFlingConfig.godEnabled = config.godEnabled or false
            EmoteFlingConfig.antiFlingEnabled = config.antiFlingEnabled or false
            EmoteFlingConfig.noclipEnabled = config.noclipEnabled or false
            EmoteFlingConfig.FloatingButtonScale = math.clamp(tonumber(config.FloatingButtonScale) or 1.0, 0.5, 3.0)
             
            if config.ToggleKey then
                pcall(function() EmoteFlingConfig.ToggleKey = Enum.KeyCode[config.ToggleKey] end)
            end
            if config.QuickFireKey then
                pcall(function() EmoteFlingConfig.QuickFireKey = Enum.KeyCode[config.QuickFireKey] end)
            end
            
            return true
        end
    end
    
    SaveConfig()
    return false
end

local ConfigLoaded = LoadConfig()

local function GetPresetNameFromId(id)
    -- Big O: O(n) where n is the number of presets
    for name, presetId in pairs(PresetAnimations) do
        if presetId == id then return name end
    end
    return "Dropkick"
end

-- ============================================================================
-- STRICT ANIMATION ID RESOLUTION & VALIDATION
-- ============================================================================
local function ResolveAnimationId(rawId)
    -- Big O: O(1) for pattern matching and remote query resolution
    if not rawId or type(rawId) ~= "string" or rawId == "" or rawId:match("^%s*$") then return nil end
    local numStr = rawId:match("%d+")
    if not numStr then return nil end

    local numId = tonumber(numStr)
    
    local ok, info = pcall(function() return MarketplaceService:GetProductInfo(numId) end)
    if ok and info then
        if info.AssetTypeId ~= 24 and info.AssetTypeId ~= 61 then
            return nil 
        end
    end

    local getOk, objects = pcall(function() return game:GetObjects("rbxassetid://" .. numStr) end)
    if getOk and type(objects) == "table" then
        for _, obj in pairs(objects) do
            if typeof(obj) == "Instance" then
                if obj:IsA("Animation") then return obj.AnimationId end
                local childAnim = obj:FindFirstChildWhichIsA("Animation", true)
                if childAnim then return childAnim.AnimationId end
            end
        end
    end

    return "rbxassetid://" .. numStr
end

-- ============================================================================
-- CLEANUP
-- ============================================================================
local function EmoteFlingCleanup()
    EmoteFlingConfig.Active = false
    ModuleState.EmoteFlingActive = false

    if EmoteFlingTrack then
        pcall(function() EmoteFlingTrack:Stop() end)
        EmoteFlingTrack = nil
    end

    local char = LocalPlayer.Character
    if char then
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.AssemblyLinearVelocity = Vector3.zero
            hrp.AssemblyAngularVelocity = Vector3.zero
            hrp.Velocity = Vector3.zero
            hrp.RotVelocity = Vector3.zero
        end
    end
end

-- ============================================================================
-- FIRE EMOTE FLING
-- ============================================================================
local function FireEmoteFling()
    local now = tick()
    if now - lastFireTime < FIRE_COOLDOWN then return end
    lastFireTime = now

    if EmoteFlingConfig.Resolving then
        Notify({ Title = "Emote Fling", Content = "Please wait, resolving animation...", Duration = 2, Icon = "loader" })
        return
    end

    if EmoteFlingConfig.Active then
        EmoteFlingConfig.Active = false 
        return
    end

    if not EmoteFlingConfig.Armed then
        Notify({ Title = "Emote Fling", Content = "Fling is not armed. Enable it first.", Duration = 2, Icon = "alert-circle" })
        return
    end

    local targetId = EmoteFlingConfig.AnimId
    if type(targetId) ~= "string" or targetId == "" or targetId:match("^%s*$") then
        Notify({ Title = "Emote Fling", Content = "No valid Animation ID set.", Duration = 2, Icon = "alert-circle" })
        return
    end

    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    local hum = char and char:FindFirstChildWhichIsA("Humanoid")

    if not (hrp and hum) then
        Notify({ Title = "Emote Fling", Content = "Character not found.", Duration = 2, Icon = "alert-circle" })
        return
    end

    EmoteFlingConfig.Resolving = true
    Notify({ Title = "Emote Fling", Content = "Resolving animation...", Duration = 1.5, Icon = "loader" })

    task.spawn(function()
        local finalAnimId = ResolveAnimationId(targetId)
        EmoteFlingConfig.Resolving = false

        if not finalAnimId then
            Notify({ Title = "Emote Fling", Content = "Invalid ID! Ensure it's an Animation or Emote.", Duration = 3, Icon = "x-circle" })
            return
        end

        char = LocalPlayer.Character
        hrp = char and char:FindFirstChild("HumanoidRootPart")
        hum = char and char:FindFirstChildWhichIsA("Humanoid")
        if not (hrp and hum) then return end

        local anim = Instance.new("Animation")
        anim.AnimationId = finalAnimId

        local trackOk, track = pcall(function() return hum:LoadAnimation(anim) end)

        if not trackOk or not track then
            Notify({ Title = "Emote Fling", Content = "Failed to load animation track.", Duration = 2, Icon = "x-circle" })
            return
        end

        EmoteFlingConfig.Active = true
        ModuleState.EmoteFlingActive = true
        EmoteFlingTrack = track

        local animStopped = false
        local trackStoppedConn
        trackStoppedConn = track.Stopped:Once(function()
            animStopped = true
            if trackStoppedConn then pcall(function() trackStoppedConn:Disconnect() end) end
        end)

        track.Priority = Enum.AnimationPriority.Action
        track.Looped = false
        track:Play()

        Notify({ Title = "Emote Fling", Content = "Active! Press Fling Keybind or execute again to STOP.", Duration = 2, Icon = "zap" })

        local flip = 1
        local timeout = tick() + 300 

        -- Big O: O(1) constant time execution per engine frame
        while EmoteFlingConfig.Active and not animStopped do
            if tick() > timeout then break end
            
            RunService.Heartbeat:Wait()

            local c = LocalPlayer.Character
            local r = c and c:FindFirstChild("HumanoidRootPart")
            local h = c and c:FindFirstChildWhichIsA("Humanoid")

            if r and h then
                local dir = h.MoveDirection
                flip = flip * -1
                r.AssemblyLinearVelocity = Vector3.new(100000 * flip, 0, 100000 * flip)
                r.AssemblyAngularVelocity = Vector3.new(100000 * flip, 100000 * flip, 100000 * flip)

                RunService.RenderStepped:Wait()

                if not EmoteFlingConfig.Active then break end

                if dir.Magnitude > 0 then
                    local spd = EmoteFlingConfig.Speed
                    r.AssemblyLinearVelocity = Vector3.new(dir.X * spd, -2, dir.Z * spd)
                    r.Velocity = Vector3.new(dir.X * spd, -2, dir.Z * spd)
                else
                    r.AssemblyLinearVelocity = Vector3.new(0, -2, 0)
                    r.Velocity = Vector3.new(0, -2, 0)
                end
                r.AssemblyAngularVelocity = Vector3.zero
                r.RotVelocity = Vector3.zero
            else
                break
            end
        end

        EmoteFlingCleanup()
        Notify({ Title = "Emote Fling", Content = "Physics restored to normal.", Duration = 2, Icon = "shield-off" })
    end)
end

-- ============================================================================
-- UI
-- ============================================================================
VaporLens:SetTheme({
	-- Window
	Glass = Color3.fromRGB(8, 12, 20),
	GlassTransp = 0.35,
	Border = Color3.fromRGB(25, 40, 65),
	BorderTransp = 0.45,

	-- Accent
	Glow = Color3.fromRGB(0, 130, 255),

	-- Text
	Primary = Color3.fromRGB(235, 245, 255),
	Secondary = Color3.fromRGB(145, 165, 185),
	SecTransp = 0,

	-- Elements
	ElemBg = Color3.fromRGB(15, 22, 35),
	ElemTransp = 0.50,
	ElemHoverTransp = 0.25,
	ElemBdrTransp = 0.70,

	-- Controls
	ToggleOff = Color3.fromRGB(25, 35, 50),
	SliderTrack = Color3.fromRGB(10, 15, 25),
	InputBg = Color3.fromRGB(6, 8, 14),

	-- Section label
	SectionTransp = 0.35,

	-- Notification
	NotifBg = Color3.fromRGB(4, 6, 10),
})

local uiWindow = VaporLens:CreateWindow({
    Title = "Emote Fling",
    Subtitle = "i love flings",
    Icon = "plane",
    Width = 340,
    Height = 520,
    ToggleKey = EmoteFlingConfig.ToggleKey,
})

local flingTab = uiWindow:CreateTab({ Title = "Emote Fling", Icon = "zap" })

flingTab:CreateSection("Settings")

flingTab:CreateToggle({
    Name = "Enable Emote Fling",
    CurrentValue = EmoteFlingConfig.Armed,
    Callback = function(state)
        EmoteFlingConfig.Armed = state
        if not state and EmoteFlingConfig.Active then
            EmoteFlingConfig.Active = false 
        end
        SaveConfig()
    end,
})

flingTab:CreateDropdown({
    Name = "Preset Animations",
    Options = PresetNames,
    CurrentOption = GetPresetNameFromId(EmoteFlingConfig.AnimId),
    Callback = function(selected)
        if EmoteFlingConfig.UseCustomId then return end
        EmoteFlingConfig.AnimId = PresetAnimations[selected] or "133566007754001"
        SaveConfig()
    end,
})

flingTab:CreateToggle({
    Name = "Use Custom Animation ID",
    CurrentValue = EmoteFlingConfig.UseCustomId,
    Callback = function(state)
        EmoteFlingConfig.UseCustomId = state
        if state then
            EmoteFlingConfig.AnimId = EmoteFlingConfig.CustomId or ""
        else
            EmoteFlingConfig.AnimId = PresetAnimations["Dropkick"] or "133566007754001" 
        end
        SaveConfig()
    end,
})

flingTab:CreateInput({
    Name = "Animation ID",
    PlaceholderText = "Enter Asset ID...",
    CurrentValue = EmoteFlingConfig.CustomId,
    Callback = function(text)
        EmoteFlingConfig.CustomId = text
        if EmoteFlingConfig.UseCustomId then
            EmoteFlingConfig.AnimId = text
        end
        SaveConfig()
    end,
})

flingTab:CreateSlider({
    Name = "Walk Speed",
    Range = { 16, 200 },
    CurrentValue = EmoteFlingConfig.Speed,
    Callback = function(val)
        EmoteFlingConfig.Speed = val
        SaveConfig()
    end,
})

flingTab:CreateButton({
    Name = "Execute / Stop Fling",
    Callback = function()
        FireEmoteFling()
    end,
})

flingTab:CreateKeybind({
    Name = "Fling Keybind",
    CurrentKeybind = EmoteFlingConfig.QuickFireKey,
    CallOnChange = false,
    Callback = function(key)
        EmoteFlingConfig.QuickFireKey = key
        SaveConfig()
    end,
})

local flingInputConn = UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.Unknown then return end 
    
    if EmoteFlingConfig.QuickFireKey and input.KeyCode == EmoteFlingConfig.QuickFireKey then
        FireEmoteFling()
    end
end)
RegisterConnection("FlingInputConn", flingInputConn)

flingTab:CreateToggle({
    Name = "Enable Notifications",
    CurrentValue = EmoteFlingConfig.NotificationsEnabled,
    Callback = function(state)
        EmoteFlingConfig.NotificationsEnabled = state
        SaveConfig()
    end,
})

uiWindow:CreateToggleKeybind(flingTab, {
    Name = "Toggle UI Visibility",
    CurrentKeybind = EmoteFlingConfig.ToggleKey,
    Callback = function(key)
        EmoteFlingConfig.ToggleKey = key
        SaveConfig()
    end
})

-- ============================================================================
-- SUPPLEMENT: SHOW FLOATING BUTTONS TOGGLE & FLOATING BUTTONS
-- ============================================================================
local floatingButtons = {}

local function fireWithSpecificId(animId)
    if type(animId) ~= "string" or animId == "" or animId:match("^%s*$") then return end

    local savedId = EmoteFlingConfig.AnimId
    EmoteFlingConfig.AnimId = animId
    FireEmoteFling()
    EmoteFlingConfig.AnimId = savedId
end

local function destroyFloatingButtons()
    -- Big O: O(n) where n is the number of active floating buttons
    for _, fab in ipairs(floatingButtons) do
        if fab.Instance and fab.Instance.Parent then
            pcall(function() fab.Instance:Destroy() end)
        end
    end
    floatingButtons = {}
end

local function createFloatingButtons()
    if #floatingButtons > 0 then return end

    local scale = EmoteFlingConfig.FloatingButtonScale
    local BTN_SZ = math.max(44, math.floor(48 * scale))
    local GAP = math.floor(8 * scale)
    local PAD = math.floor(80 * scale)

    local buttonInfos = {}

    for _, presetName in ipairs(PresetNames) do
        table.insert(buttonInfos, {
            Text = presetName,
            id = PresetAnimations[presetName]
        })
    end
    table.insert(buttonInfos, { Text = "Custom animID", id = nil })

    for i, info in ipairs(buttonInfos) do
        local clickHandler
        if info.id then
            clickHandler = function() fireWithSpecificId(info.id) end
        else
            clickHandler = function()
                local customId = EmoteFlingConfig.CustomId
                if not customId or customId == "" or customId:match("^%s*$") then
                    Notify({ Title = "Floating Fling", Content = "Custom Animation ID is not set.", Duration = 3, Icon = "alert-circle" })
                    return
                end
                fireWithSpecificId(customId)
            end
        end

        local fab = uiWindow:CreateFloatingButton({
            Text = info.Text,
            Icon = "hand-metal",
            Size = BTN_SZ,
            Position = UDim2.new(1, -150, 0, 0),
            ClickCallback = clickHandler,
            DragEnabled = true,
            DragThreshold = 4,
            SnapToEdges = false,
            PulseOnClick = false,
            ZIndex = 100
        })

        task.defer(function()
            local instance = fab.Instance
            if not instance or not instance.Parent then return end
            local width = instance.AbsoluteSize.X
            local yOffset = PAD + (i - 1) * (BTN_SZ + GAP)
            fab:SetPosition(UDim2.new(1, -PAD - width, 0, yOffset))
        end)

        table.insert(floatingButtons, fab)
    end
end

flingTab:CreateSection("Floating Buttons")

flingTab:CreateToggle({
    Name = "Show Floating Buttons",
    CurrentValue = EmoteFlingConfig.FloatingButtonsEnabled,
    Callback = function(state)
        EmoteFlingConfig.FloatingButtonsEnabled = state
        if state then
            createFloatingButtons()
        else
            destroyFloatingButtons()
        end
        SaveConfig()
    end,
})

flingTab:CreateSlider({
    Name = "Floating Button Scale",
    Range = {0.5, 3.0},
    Increment = 0.1,
    CurrentValue = EmoteFlingConfig.FloatingButtonScale,
    Flag = "FloatingButtonScale",
    Callback = function(value)
        EmoteFlingConfig.FloatingButtonScale = math.clamp(value, 0.5, 3.0)
        SaveConfig()
        if EmoteFlingConfig.FloatingButtonsEnabled then
            destroyFloatingButtons()
            createFloatingButtons()
        end
    end,
})

-- ============================================================================
-- SECTION: GODMODE & ANTI-FALL
-- ============================================================================
flingTab:CreateSection("Godmode & Anti-Fall")

local function HookAntiFall(char)
    task.spawn(function()
        local r = char:WaitForChild("HumanoidRootPart", 10)
        if r and EmoteFlingConfig.antiFallEnabled then
            local rs = game:GetService("RunService")
            local hb = rs.Heartbeat
            local rsd = rs.RenderStepped
            local z = Vector3.zero
            
            DisconnectConnection("antiFallLoopConn")
            local conn = hb:Connect(function()
                if not EmoteFlingConfig.antiFallEnabled or not r.Parent then
                    DisconnectConnection("antiFallLoopConn")
                    return
                end
                local v = r.AssemblyLinearVelocity
                r.AssemblyLinearVelocity = z
                rsd:Wait()
                r.AssemblyLinearVelocity = v
            end)
            RegisterConnection("antiFallLoopConn", conn)
        end
    end)
end

local antiFallToggle
local function OnAntiFallToggle(Value, isInitialization)
    EmoteFlingConfig.antiFallEnabled = Value

    if EmoteFlingConfig.antiFallEnabled then
        if game.PlaceId ~= 189707 then
            if not isInitialization then
                Notify({ Title = "Error", Content = "You are not in Natural Disasters!", Duration = 5, Icon = "circle-x" })
            end
            EmoteFlingConfig.antiFallEnabled = false
            if antiFallToggle then pcall(function() antiFallToggle:Set(false) end) end
            SaveConfig()
            return
        end

        if LocalPlayer.Character then HookAntiFall(LocalPlayer.Character) end

        DisconnectConnection("antiFallRespawnConn")
        local connRespawn = LocalPlayer.CharacterAdded:Connect(function(char)
            if EmoteFlingConfig.antiFallEnabled then HookAntiFall(char) end
        end)
        RegisterConnection("antiFallRespawnConn", connRespawn)

        if not isInitialization then
            Notify({ Title = "Anti-Fall", Content = "Enabled (NDS) - Persistent Protection", Duration = 3, Icon = "shield" })
        end
    else
        DisconnectConnection("antiFallLoopConn")
        DisconnectConnection("antiFallRespawnConn")
        if not isInitialization then
            Notify({ Title = "Anti-Fall", Content = "Disabled and Physics Normalized.", Duration = 3, Icon = "shield-off" })
        end
    end
    SaveConfig()
end

antiFallToggle = flingTab:CreateToggle({
    Name = "Anti-Fall Damage",
    CurrentValue = EmoteFlingConfig.antiFallEnabled,
    Callback = function(Value) OnAntiFallToggle(Value, not UI_Loaded) end,
})

local function RestoreGodProperties(char)
    local hum = char and char:FindFirstChildWhichIsA("Humanoid")
    if hum then
        pcall(function()
            hum:SetStateEnabled(Enum.HumanoidStateType.Dead, true)
            hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
            hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
            hum:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
        end)
    end
end

local function ApplyGodProperties(char)
    task.spawn(function()
        local hum = char:WaitForChild("Humanoid", 10)
        if hum and EmoteFlingConfig.godEnabled then
            pcall(function()
                hum.MaxHealth = 100
                hum.Health = 100
                hum:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
                hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
                hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
            end)
        end
    end)
end

local godToggle
local function OnGodToggle(Value, isInitialization)
    EmoteFlingConfig.godEnabled = Value

    if EmoteFlingConfig.godEnabled then
        DisconnectConnection("godLoopConn")
        local connLoop = game:GetService("RunService").Heartbeat:Connect(function()
            local char = LocalPlayer.Character
            if char and EmoteFlingConfig.godEnabled then
                local hum = char:FindFirstChildWhichIsA("Humanoid")
                if hum then hum.Health = 100 end
            end
        end)
        RegisterConnection("godLoopConn", connLoop)

        if LocalPlayer.Character then ApplyGodProperties(LocalPlayer.Character) end

        DisconnectConnection("godRespawnConn")
        local connRespawn = LocalPlayer.CharacterAdded:Connect(function(char)
            if EmoteFlingConfig.godEnabled then ApplyGodProperties(char) end
        end)
        RegisterConnection("godRespawnConn", connRespawn)

        if not isInitialization then
            Notify({ Title = "Godmode", Content = "Immortality enabled and persistent!", Duration = 3, Icon = "heart-pulse" })
        end
    else
        DisconnectConnection("godLoopConn")
        DisconnectConnection("godRespawnConn")
        if LocalPlayer.Character then RestoreGodProperties(LocalPlayer.Character) end
        if not isInitialization then
            Notify({ Title = "Godmode", Content = "Physics and Mortality restored.", Duration = 3, Icon = "heart-crack" })
        end
    end
    SaveConfig()
end

godToggle = flingTab:CreateToggle({
    Name = "Godmode (Anti-Instakill)",
    CurrentValue = EmoteFlingConfig.godEnabled,
    Callback = function(Value) OnGodToggle(Value, not UI_Loaded) end,
})

flingTab:CreateSection("Anti-Fling")

local lastSafeCFrameFling = nil
local lastNotifyTimeFling = 0
local isRecoveringFling = false

local function OnAntiFlingToggle(Value, isInitialization)
    EmoteFlingConfig.antiFlingEnabled = Value
    
    if EmoteFlingConfig.antiFlingEnabled then
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            lastSafeCFrameFling = char.HumanoidRootPart.CFrame
        end

        DisconnectConnection("antiFlingLoopConn")
        
        -- Big O: O(1) mathematical vector magnitude evaluations
        local conn = RunService.Stepped:Connect(function(_, dt)
            if not EmoteFlingConfig.antiFlingEnabled then return end
            
            char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            local humanoid = char and char:FindFirstChild("Humanoid")
            
            if hrp and humanoid and humanoid.Health > 0 then
                local velocity = hrp.AssemblyLinearVelocity
                local rotVelocity = hrp.AssemblyAngularVelocity
                local mag = velocity.Magnitude
                local rotMag = rotVelocity.Magnitude
                
                if not lastSafeCFrameFling then lastSafeCFrameFling = hrp.CFrame end
                
                local isControlledMotion = rotMag < 60 
                local currentState = humanoid:GetState()
                local isFalling = velocity.Y < -50 and (currentState == Enum.HumanoidStateType.Freefall or currentState == Enum.HumanoidStateType.FallingDown)
                
                local maxLinear = EmoteFlingConfig.Active and 250 or 150
                local maxVerticalUp = 250
                local maxVerticalDown = -350
                
                if isControlledMotion then
                    maxLinear = 1000 
                    maxVerticalUp = 800 
                    if isFalling then
                        maxVerticalDown = -5000 
                    else
                        maxVerticalDown = -800 
                    end
                end
                
                local isFlinged = rotMag > 120 
                               or velocity.Y > maxVerticalUp 
                               or velocity.Y < maxVerticalDown 
                               or mag > maxLinear 
                
                if isFlinged then
                    isRecoveringFling = true
                    hrp.AssemblyLinearVelocity = Vector3.zero
                    hrp.AssemblyAngularVelocity = Vector3.zero
                    
                    if lastSafeCFrameFling then
                        hrp.CFrame = lastSafeCFrameFling
                    end
                    
                    if currentState == Enum.HumanoidStateType.Physics or currentState == Enum.HumanoidStateType.Ragdoll or currentState == Enum.HumanoidStateType.FallingDown then
                        humanoid:ChangeState(Enum.HumanoidStateType.Running)
                        humanoid.PlatformStand = false
                        humanoid.Sit = false
                    end
                    
                    if tick() - lastNotifyTimeFling > 2.0 then
                        Notify({Title = "Anti-Fling", Content = "Anomalia cinética suprimida.", Duration = 1.5, Icon = "shield"})
                        lastNotifyTimeFling = tick()
                    end
                else
                    local distance = (hrp.Position - lastSafeCFrameFling.Position).Magnitude
                    
                    if distance > 50 and mag < 100 and not isRecoveringFling then
                        lastSafeCFrameFling = hrp.CFrame
                    end

                    if isControlledMotion and mag < 900 then
                        lastSafeCFrameFling = hrp.CFrame
                        isRecoveringFling = false
                    end
                end
            end
        end)
        RegisterConnection("antiFlingLoopConn", conn)

        if not isInitialization then
            Notify({Title = "Anti-Fling", Content = "Proteção Absoluta e Fly Bypass sincronizados.", Duration = 2.5, Icon = "check-circle"})
        end
    else
        DisconnectConnection("antiFlingLoopConn")
        lastSafeCFrameFling = nil
        isRecoveringFling = false
        if not isInitialization then
            Notify({Title = "Anti-Fling", Content = "Desativado.", Duration = 2.5, Icon = "x-circle"})
        end
    end
    SaveConfig()
end

antiFlingToggle = flingTab:CreateToggle({
    Name = "Anti-Fling Protection",
    CurrentValue = EmoteFlingConfig.antiFlingEnabled,
    Callback = function(Value) OnAntiFlingToggle(Value, not UI_Loaded) end,
})

local NoClipStates = setmetatable({}, {__mode = "k"})

local function RestoreNoClip(char)
    if not char then return end
    for part, state in pairs(NoClipStates) do
        if part and part.Parent then part.CanCollide = state end
    end
    for k in pairs(NoClipStates) do NoClipStates[k] = nil end
end

local function HookNoClip(char)
    DisconnectConnection("noclipLoopConn")
    DisconnectConnection("noclipAddedConn")
    if not EmoteFlingConfig.noclipEnabled then return end
    
    local parts = {}
    for k in pairs(NoClipStates) do NoClipStates[k] = nil end
    
    local function registerPart(part)
        if part:IsA("BasePart") then
            table.insert(parts, part)
            if NoClipStates[part] == nil then
                NoClipStates[part] = part.CanCollide
            end
        end
    end

    -- Big O: O(n) part iteration during setup
    for _, part in ipairs(char:GetDescendants()) do
        registerPart(part)
    end

    local addedConn = char.DescendantAdded:Connect(registerPart)
    RegisterConnection("noclipAddedConn", addedConn)
    
    local conn = RunService.Stepped:Connect(function()
        if not EmoteFlingConfig.noclipEnabled or not char.Parent then
            DisconnectConnection("noclipLoopConn")
            DisconnectConnection("noclipAddedConn")
            return
        end
        -- Big O: O(n) per frame for state enforcement where n is BasePart count
        for i = 1, #parts do
            local part = parts[i]
            if part.Parent and part.CanCollide then
                part.CanCollide = false
            end
        end
    end)
    RegisterConnection("noclipLoopConn", conn)
end

local noclipToggle
local function OnNoClipToggle(Value, isInitialization)
    EmoteFlingConfig.noclipEnabled = Value

    if EmoteFlingConfig.noclipEnabled then
        if LocalPlayer.Character then HookNoClip(LocalPlayer.Character) end

        DisconnectConnection("noclipRespawnConn")
        local connRespawn = LocalPlayer.CharacterAdded:Connect(function(char)
            if EmoteFlingConfig.noclipEnabled then HookNoClip(char) end
        end)
        RegisterConnection("noclipRespawnConn", connRespawn)

        if not isInitialization then
            Notify({ Title = "NoClip", Content = "Enabled.", Duration = 3, Icon = "ghost" })
        end
    else
        DisconnectConnection("noclipLoopConn")
        DisconnectConnection("noclipRespawnConn")
        DisconnectConnection("noclipAddedConn")
        
        if LocalPlayer.Character then RestoreNoClip(LocalPlayer.Character) end

        if not isInitialization then
            Notify({ Title = "NoClip", Content = "Disabled - Collisions restored.", Duration = 3, Icon = "box" })
        end
    end
    SaveConfig()
end

noclipToggle = flingTab:CreateToggle({
    Name = "NoClip",
    CurrentValue = EmoteFlingConfig.noclipEnabled,
    Callback = function(Value) OnNoClipToggle(Value, not UI_Loaded) end,
})

-- ============================================================================
-- CHARACTER RESPAWN SAFETY & GLOBAL CLEANUP
-- ============================================================================
DisconnectConnection("charAddedConn")
local connCharAdded = LocalPlayer.CharacterAdded:Connect(function(newChar)
    if EmoteFlingConfig.Active then
        EmoteFlingConfig.Active = false
        Notify({ Title = "Emote Fling", Content = "Interrupted (respawn).", Duration = 2, Icon = "shield-off" })
    end
end)
RegisterConnection("charAddedConn", connCharAdded)

local isCleaningUp = false
_G.EmoteFling_GlobalCleanup = function()
    if isCleaningUp then return end
    isCleaningUp = true

    for name, _ in pairs(EventConnections) do
        DisconnectConnection(name)
    end
    
    pcall(function() destroyFloatingButtons() end)
    
    if EmoteFlingConfig.Active then
        EmoteFlingConfig.Active = false
    end
    
    if uiWindow and type(uiWindow.Destroy) == "function" then
        pcall(function() uiWindow:Destroy() end)
    end
end

-- UI Destruction Hook
if uiWindow and typeof(uiWindow) == "table" and type(uiWindow.Destroy) == "function" then
    local originalDestroy = uiWindow.Destroy
    uiWindow.Destroy = function(self, ...)
        if not isCleaningUp then
            _G.EmoteFling_GlobalCleanup()
        end
        return originalDestroy(self, ...)
    end
end

UI_Loaded = true

if EmoteFlingConfig.antiFallEnabled and not EventConnections["antiFallRespawnConn"] then
    OnAntiFallToggle(true, true)
end

if EmoteFlingConfig.godEnabled and not EventConnections["godRespawnConn"] then
    OnGodToggle(true, true)
end

if EmoteFlingConfig.antiFlingEnabled and not EventConnections["antiFlingLoopConn"] then
    OnAntiFlingToggle(true, true)
end

if EmoteFlingConfig.noclipEnabled and not EventConnections["noclipLoopConn"] then
    OnNoClipToggle(true, true)
end

if EmoteFlingConfig.FloatingButtonsEnabled and #floatingButtons == 0 then
    createFloatingButtons()
end

if ConfigLoaded then
    Notify({ Title = "Emote Fling", Content = "Config loaded and synced.", Duration = 2, Icon = "check-circle" })
else
    Notify({ Title = "Emote Fling", Content = "Module loaded (Defaults).", Duration = 3, Icon = "check-circle" })
end