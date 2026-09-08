local api = loadstring(game:HttpGet("https://pastefy.app/YZjZf0R4/raw"))()

__JUNKIE_EXECUTION_HASH__ = "78751ccdee4e5868a1679e42478492791a6a2442b2385779c8965f484f6fb48e"
__JUNKIE_REVERSE_HASH__ = "1a6171cec974c5b95e567f4f0f2651c9b3c3682634854d60a063ce318eef6dd5"
local encodedB64 = "LOADSTRING"

if encodedB64 ~= 'LOADSTRING' then
	api.crack(true, encodedB64);
else
	api.crack();
	-- script
	(function(...)
		


if not JunkieCore then
    error("JunkieCore not available in environment! Check Loader setup.", 0)
end





local config = {
    api_key = "3473c680-f271-4532-b8ef-ab677f9599df",
    provider = "Keyprovider",
    service = "Komodo's Script ",
    hash = "ed85c0f9f5c0b0f4218d2161b5736877",
    _lv = {
        cs = "a9735b625735b70aec337efc5503ac8f",
        ck = "24e35e88d674f61f",
        eh = "78751ccdee4e5868a1679e42478492791a6a2442b2385779c8965f484f6fb48e",
        rh = "1a6171cec974c5b95e567f4f0f2651c9b3c3682634854d60a063ce318eef6dd5"
    }
}

local JunkieProtected = JunkieCore.initialize(config)
config = nil




local function _usPNnKlAcv()
    --============================================================--
    -- WizardHub Complete â€“ Enhanced Auto Block Integration
    --  â€¢ Advanced Auto Block with Animation Detection
    --  â€¢ Perfect Auto Release â€¢ Anti-Contest â€¢ Dribble Macros
    --  â€¢ OPTIMIZED Guard Assist â€¢ WalkSpeed Modifier
    --  â€¢ Name/OVR/Badge Spoofer (CLIENT-SIDED)
    --============================================================--
    
    --// Services
    local Players             = game:GetService("Players")
    local RunService          = game:GetService("RunService")
    local UserInputService    = game:GetService("UserInputService")
    local ReplicatedStorage   = game:GetService("ReplicatedStorage")
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local Stats               = game:GetService("Stats")
    
    local bindHumanoidHooks
    
    local LP   = Players.LocalPlayer
    local NAME = LP.Name
    
    --============================================================--
    -- Character binding
    --============================================================--
    local Char, Hum, HRP
    local function resolveCharacter()
        local m = workspace:FindFirstChild(NAME) or LP.Character or LP.CharacterAdded:Wait()
        Char = m
        Hum  = m:WaitForChild("Humanoid")
        HRP  = m:WaitForChild("HumanoidRootPart")
    end
    resolveCharacter()
    
    LP.CharacterAdded:Connect(function()
        task.defer(function()
            task.wait()
            resolveCharacter()
            if bindHumanoidHooks then bindHumanoidHooks() end
        end)
    end)
    
    --============================================================--
    -- Load Maclib + Window with Custom Banner
    --============================================================--
    local MacLib = loadstring(game:HttpGet(
      "https://raw.githubusercontent.com/defnotaskidder/libraryui/refs/heads/main/maclib"
    ))()
    
    local isMobile = UserInputService.TouchEnabled
    local uiSize   = isMobile and UDim2.fromOffset(700, 350) or UDim2.fromOffset(800, 500)
    local Window   = MacLib:Window({
        Title = '<font color="rgb(138, 43, 226)">WizardHub</font> <font color="rgb(138, 43, 226)">Complete</font>',
        Subtitle = '<font color="rgb(138, 43, 226)">Enhanced Edition</font>',
        Size = uiSize,
        DragStyle = 2,
        DisabledWindowControls = {},
        ShowUserInfo = false,
        Keybind = Enum.KeyCode.RightControl,
        AcrylicBlur = true,
    })
    
    -- Add Wizard Banner
    task.spawn(function()
        task.wait(0.5)
        local success, err = pcall(function()
            local gui = LP.PlayerGui:FindFirstChild("MacLib") or LP.PlayerGui:FindFirstChildWhichIsA("ScreenGui")
            if gui then
                local mainFrame = gui:FindFirstChildWhichIsA("Frame", true)
                if mainFrame then
                    local banner = Instance.new("ImageLabel")
                    banner.Name = "WizardBanner"
                    banner.Image = "rbxassetid://139146185930076"
                    banner.Size = UDim2.new(1, 0, 0, 100)
                    banner.Position = UDim2.new(0, 0, 0, 0)
                    banner.BackgroundTransparency = 1
                    banner.ScaleType = Enum.ScaleType.Fit
                    banner.ZIndex = 999
                    banner.Parent = mainFrame
                    
                    for _, child in ipairs(mainFrame:GetChildren()) do
                        if child ~= banner and child:IsA("GuiObject") then
                            local currentPos = child.Position
                            child.Position = UDim2.new(currentPos.X.Scale, currentPos.X.Offset, currentPos.Y.Scale, currentPos.Y.Offset + 100)
                        end
                    end
                    
                    print("[WizardHub] Banner loaded successfully!")
                end
            end
        end)
        if not success then
            warn("[WizardHub] Banner load failed:", err)
        end
    end)
    
    Window:GlobalSetting({ Name="UI Blur",        Default=Window:GetAcrylicBlurState(),  Callback=function(b) Window:SetAcrylicBlurState(b) end })
    Window:GlobalSetting({ Name="Notifications",  Default=Window:GetNotificationsState(), Callback=function(b) Window:SetNotificationsState(b) end })
    Window:GlobalSetting({ Name="Show User Info", Default=Window:GetUserInfoState(),     Callback=function(b) Window:SetUserInfoState(b) end })
    
    --============================================================--
    -- Tabs / Sections
    --============================================================--
    local TabGroup   = Window:TabGroup()
    local TabShoot   = TabGroup:Tab({ Name="Shooting",  Image="rbxassetid://82741456353014" })
    local TabDefense = TabGroup:Tab({ Name="Defense",   Image="rbxassetid://10734950309" })
    local TabDribble = TabGroup:Tab({ Name="Dribble",   Image="rbxassetid://10747373176" })
    local TabSpoof   = TabGroup:Tab({ Name="Spoofer",   Image="rbxassetid://10734950309" })
    local TabMisc    = TabGroup:Tab({ Name="Misc",      Image="rbxassetid://10709769841" })
    local TabConfig  = TabGroup:Tab({ Name="Settings",  Image="rbxassetid://10734950309" })
    
    local SecAutoRel   = TabShoot:Section({ Side="Left" })
    local SecAntiCon   = TabShoot:Section({ Side="Right" })
    local SecGuard     = TabDefense:Section({ Side="Left" })
    local SecAutoBlock = TabDefense:Section({ Side="Right" })
    local SecDribBoost = TabDribble:Section({ Side="Left" })
    local SecDribMacro = TabDribble:Section({ Side="Right" })
    local SecSpoof     = TabSpoof:Section({ Side="Left" })
    local SecWalk      = TabMisc:Section({ Side="Left" })
    local SecAnti      = TabMisc:Section({ Side="Right" })
    
    MacLib:SetFolder("PlaygroundBasketball")
    TabConfig:InsertConfigSection("Left")
    
    --============================================================--
    -- Utils
    --============================================================--
    local function idFromAnim(anim)
        if not (anim and anim.AnimationId) then return nil end
        local s = tostring(anim.AnimationId)
        local n = s:match("(%d+)$")
        return n and tonumber(n) or nil
    end
    
    local function releaseKey(keyCode)
        pcall(function()
            VirtualInputManager:SendKeyEvent(false, keyCode, false, nil)
            VirtualInputManager:SendKeyEvent(false, keyCode, false, nil)
        end)
    end
    
    local UI = {
        DB_Enable = nil,
        DB_Force  = nil,
        AR_Enable = nil,
        AR_PingMode = nil,
        AR_TimingAdjust = nil,
    }
    
    --============================================================--
    -- MISC TAB: WALKSPEED CONTROL
    --============================================================--
    SecWalk:Header({ Name="WalkSpeed Control" })
    
    local WS = {
        Enabled = false,
        Value = 30,
    }
    
    local wsConn = nil
    local originalWS = nil
    
    local function getHumanoid()
        local char = workspace:FindFirstChild(NAME)
        if not char then return nil end
        return char:FindFirstChildOfClass("Humanoid")
    end
    
    local function startWSUpdating()
        if wsConn then return end
        
        local hum = getHumanoid()
        if hum and originalWS == nil then
            originalWS = hum.WalkSpeed
        end
        
        wsConn = RunService.RenderStepped:Connect(function()
            if not WS.Enabled then return end
            local h = getHumanoid()
            if not h then return end
            h.WalkSpeed = WS.Value
        end)
    end
    
    local function stopWSUpdating(restore)
        if wsConn then
            wsConn:Disconnect()
            wsConn = nil
        end
        if restore then
            local h = getHumanoid()
            if h and originalWS then
                h.WalkSpeed = originalWS
            end
        end
    end
    
    SecWalk:Toggle({
        Name = "Enable WalkSpeed",
        Default = false,
        Callback = function(state)
            WS.Enabled = state
            if WS.Enabled then
                startWSUpdating()
            else
                stopWSUpdating(true)
            end
        end
    }, "WS_Enable")
    
    SecWalk:Slider({
        Name = "WalkSpeed",
        Default = WS.Value,
        Minimum = 6,
        Maximum = 50,
        Precision = 0,
        DisplayMethod = "Value",
        Callback = function(v)
            WS.Value = tonumber(v) or 30
        end
    }, "WS_Value")
    
    LP.CharacterAdded:Connect(function()
        task.defer(function()
            originalWS = nil
            if WS.Enabled then
                task.wait(0.5)
                startWSUpdating()
            end
        end)
    end)
    
    --============================================================--
    -- MISC TAB: ANTI-SYSTEMS (Stun, Ankle Break, Out of Bounds)
    --============================================================--
    SecAnti:Header({ Name="Anti-Systems" })
    
    local ANTI = {
        Stun = false,
        AnkleBreak = false,
        OutOfBounds = false,
    }
    
    -- Anti-Stun System
    SecAnti:Toggle({
        Name = "Anti Stun",
        Default = false,
        Callback = function(state)
            ANTI.Stun = state
        end
    }, "Anti_Stun")
    
    -- Anti-Ankle Break System
    SecAnti:Toggle({
        Name = "Anti Ankle Break",
        Default = false,
        Callback = function(state)
            ANTI.AnkleBreak = state
        end
    }, "Anti_AnkleBreak")
    
    -- Anti-Out of Bounds System
    SecAnti:Toggle({
        Name = "Anti Out of Bounds",
        Default = false,
        Callback = function(state)
            ANTI.OutOfBounds = state
            
            -- Toggle OOB parts
            for _, part in pairs(workspace:GetDescendants()) do
                if part:IsA("Part") then
                    if part.Name:lower():find("bottom") or 
                       part.Name:lower():find("left") or 
                       part.Name:lower():find("right") or 
                       part.Name:lower():find("top") or 
                       part.Name:lower():find("halfcourt") or 
                       part.Parent.Name == 'OutOfBounds' then
                        part.CanTouch = not state
                        part.CanCollide = not state
                    end
                end
            end
        end
    }, "Anti_OOB")
    
    -- Monitor character attributes for anti-stun
    coroutine.wrap(function()
        while task.wait(0.1) do
            if not Char then continue end
            
            -- Anti-Stun
            if ANTI.Stun then
                local stunned = Char:GetAttribute("Stunned")
                if stunned then
                    Char:SetAttribute("Stunned", false)
                end
                
                local pushStun = Char:GetAttribute("PushStun")
                if pushStun then
                    Char:SetAttribute("PushStun", false)
                end
            end
        end
    end)()
    
    -- Monitor animations for anti-ankle break
    local function setupAnkleBreakProtection()
        if not Hum then return end
        
        Hum.AnimationPlayed:Connect(function(track)
            if not ANTI.AnkleBreak then return end
            
            -- Check if it's an ankle break animation
            local animId = track and track.Animation and idFromAnim(track.Animation)
            if not animId then return end
            
            -- Check against ankle break animations in ReplicatedStorage
            local ok, ankleFolder = pcall(function()
                return RS:WaitForChild("Animations", 2):WaitForChild("Ankles", 2)
            end)
            
            if ok and ankleFolder then
                for _, anim in ipairs(ankleFolder:GetChildren()) do
                    if anim:IsA("Animation") then
                        local ankleId = idFromAnim(anim)
                        if ankleId and ankleId == animId then
                            -- Stop the ankle break animation immediately
                            track:Stop()
                            
                            -- Remove stunned attribute
                            if Char then
                                Char:SetAttribute("Stunned", false)
                            end
                            return
                        end
                    end
                end
            end
        end)
    end
    
    -- Setup ankle break protection on character load
    setupAnkleBreakProtection()
    
    -- Re-setup on respawn
    LP.CharacterAdded:Connect(function()
        task.wait(0.5)
        setupAnkleBreakProtection()
    end)
    
    --============================================================--
    -- SHOOTING: AUTO RELEASE + ANTI-CONTEST
    --============================================================--
    SecAutoRel:Header({ Name="Perfect Auto Release (Ping-Based)" })
    
    UI.AR_Enable = SecAutoRel:Toggle({
        Name = "Enable Auto Release",
        Default = false,
        Callback = function(_) end
    }, "AR_Enable")
    
    UI.AR_PingMode = SecAutoRel:Toggle({
        Name = "Use Ping-Based Timing",
        Default = true,
        Callback = function(_) end
    }, "AR_PingMode")
    
    UI.AR_TimingAdjust = SecAutoRel:Slider({
        Name = "Timing Adjustment (ms)",
        Default = 0,
        Minimum = -50,
        Maximum = 50,
        Precision = 1,
        DisplayMethod = "Value",
        Callback = function(_) end
    }, "AR_TimingAdjust")
    
    SecAntiCon:Header({ Name="Anti-Contest System" })
    
    local ANTICONTEST = {
        Enabled = false,
        Method = "Teleport",
        RemoveDistance = 15,
    }
    
    SecAntiCon:Toggle({
        Name = "Enable Anti-Contest",
        Default = false,
        Callback = function(b)
            ANTICONTEST.Enabled = b
        end
    }, "AntiContest_Enable")
    
    SecAntiCon:Dropdown({
        Name = "Prevention Method",
        Options = {"Teleport", "Invisible"},
        Default = "Teleport",
        Callback = function(choice)
            ANTICONTEST.Method = choice
        end
    }, "AntiContest_Method")
    
    SecAntiCon:Slider({
        Name = "Clear Distance (studs)",
        Default = 15,
        Minimum = 10,
        Maximum = 30,
        Precision = 0,
        DisplayMethod = "Value",
        Callback = function(v)
            ANTICONTEST.RemoveDistance = tonumber(v) or 15
        end
    }, "AntiContest_Distance")
    
    local RS = ReplicatedStorage
    local RemoteAction do
        local ok, rem = pcall(function()
            return RS:WaitForChild("Remotes", 5)
                     :WaitForChild("Server", 5)
                     :WaitForChild("Action", 5)
        end)
        RemoteAction = ok and rem or nil
    end
    
    local function fireShootRemote()
        if not RemoteAction then return end
        local args = { { Shoot = false, Type = "Shoot" } }
        RemoteAction:FireServer(unpack(args))
    end
    
    local CATEGORY_PRESETS = {
        JUMPS   = { p80 = 0.348, p120 = 0.268 },
        POST    = { p80 = 0.308, p120 = 0.252 },
        FLOATER = { p80 = 0.308, p120 = 0.290 },
        DUNK    = { p80 = 0.345, p120 = 0.295 },
    }
    
    local function getPingMs()
        local net = Stats:FindFirstChild("Network")
        local item = net and net:FindFirstChild("ServerStatsItem")
        local pingObj = item and item:FindFirstChild("Data Ping")
        if pingObj then
            local ok, s = pcall(function() return pingObj:GetValueString() end)
            if ok and s then
                local n = tonumber((s:match("([%d%.]+)")))
                if n and n > 0 then return n end
            end
        end
        return 100
    end
    
    local function lerpFromAnchors(ping, p80, p120)
        ping = math.clamp(ping, 70, 130)
        local m = (p120 - p80) / (120 - 80)
        return p80 + m * (ping - 80)
    end
    
    local function detectCategory(name, isDunk)
        if isDunk then return "DUNK" end
        name = string.lower(name or "")
        if name:find("jump") or name:find("moving") or name:find("pull") or name:find("step") then
            return "JUMPS"
        elseif name:find("post") or name:find("fade") or name:find("hook") then
            return "POST"
        elseif name:find("float") or name:find("tear") then
            return "FLOATER"
        end
        return "JUMPS"
    end
    
    local ID_TO_META = {}
    
    local function indexTree(root, isDunk)
        for _, obj in ipairs(root:GetDescendants()) do
            if obj:IsA("Animation") then
                local id = idFromAnim(obj)
                if id then
                    ID_TO_META[id] = { name = obj.Name or "", isDunk = isDunk }
                end
            end
        end
    end
    
    local function initAnimIndex()
        local paths = {
            function() return RS:WaitForChild("Animations",5):WaitForChild("Shooting",5) end,
            function() return RS:WaitForChild("Client",5):WaitForChild("Assets",5)
                                :WaitForChild("Animations",5):WaitForChild("Shooting",5) end,
            function() return RS:WaitForChild("Animations",5):WaitForChild("Dunks",5) end,
            function() return RS:WaitForChild("Client",5):WaitForChild("Assets",5)
                                :WaitForChild("Animations",5):WaitForChild("Dunks",5) end,
        }
        for i, getter in ipairs(paths) do
            local ok, node = pcall(getter)
            if ok and node then indexTree(node, i >= 3) end
        end
    end
    initAnimIndex()
    
    local function clamp01_05(t) return math.clamp(t, 0, 0.5) end
    
    local function computeShotAction(id)
        local meta = ID_TO_META[id]
        if not meta then return nil end
    
        local adjustment = (UI.AR_TimingAdjust and tonumber(UI.AR_TimingAdjust:GetValue()) or 0) / 1000
    
        if UI.AR_PingMode and UI.AR_PingMode:GetState() then
            local cat = detectCategory(meta.name, meta.isDunk)
            local anchor = CATEGORY_PRESETS[cat] or CATEGORY_PRESETS.JUMPS
            local baseTime = lerpFromAnchors(getPingMs(), anchor.p80, anchor.p120)
            local t = clamp01_05(baseTime + adjustment)
            return { tsec = t, kind = meta.isDunk and "dunk" or "shot" }
        else
            local t = meta.isDunk and (0.200 + adjustment) or (0.200 + adjustment)
            return { tsec = clamp01_05(t), kind = meta.isDunk and "dunk" or "shot" }
        end
    end
    
    local originalTransparencies = {}
    
    local function getAllPlayerCharacters()
        local chars = {}
        
        local world = workspace:FindFirstChild("World")
        local playersFolder = world and world:FindFirstChild("Players")
        if playersFolder then
            for _, char in ipairs(playersFolder:GetChildren()) do
                if char ~= Char and char:FindFirstChild("HumanoidRootPart") then
                    table.insert(chars, char)
                end
            end
        end
        
        local charsFolder = workspace:FindFirstChild("Characters")
        if charsFolder then
            for _, char in ipairs(charsFolder:GetChildren()) do
                if char ~= Char and char:FindFirstChild("HumanoidRootPart") then
                    table.insert(chars, char)
                end
            end
        end
        
        if #chars == 0 then
            for _, char in ipairs(workspace:GetChildren()) do
                if char ~= Char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("Humanoid") then
                    table.insert(chars, char)
                end
            end
        end
        
        return chars
    end
    
    local function makeDefenderInvisible(defenderChar)
        if not defenderChar then return end
        
        for _, part in ipairs(defenderChar:GetDescendants()) do
            if part:IsA("BasePart") or part:IsA("Decal") then
                if not originalTransparencies[part] then
                    originalTransparencies[part] = part.Transparency
                end
                part.Transparency = 1
            end
        end
        
        task.delay(1, function()
            for _, part in ipairs(defenderChar:GetDescendants()) do
                if part:IsA("BasePart") or part:IsA("Decal") then
                    if originalTransparencies[part] then
                        part.Transparency = originalTransparencies[part]
                    end
                end
            end
        end)
    end
    
    local function teleportDefendersAway()
        if not HRP or not ANTICONTEST.Enabled then return end
        
        local myPos = HRP.Position
        local defenders = getAllPlayerCharacters()
        
        for _, defenderChar in ipairs(defenders) do
            local defHRP = defenderChar:FindFirstChild("HumanoidRootPart")
            if defHRP then
                local distance = (defHRP.Position - myPos).Magnitude
                
                if distance < ANTICONTEST.RemoveDistance then
                    if ANTICONTEST.Method == "Teleport" then
                        local awayDir = (defHRP.Position - myPos).Unit
                        local newPos = myPos + (awayDir * ANTICONTEST.RemoveDistance * 2.5)
                        
                        pcall(function()
                            defHRP.CFrame = CFrame.new(newPos)
                        end)
                    elseif ANTICONTEST.Method == "Invisible" then
                        makeDefenderInvisible(defenderChar)
                    end
                end
            end
        end
    end
    
    local currentToken = 0
    
    function bindHumanoidHooks()
        if not Hum then return end
        Hum.AnimationPlayed:Connect(function(track)
            local id = track and track.Animation and idFromAnim(track.Animation)
            if not id then return end
    
            local action = computeShotAction(id)
            if not action then return end
    
            if ANTICONTEST.Enabled and action.kind == "shot" then
                teleportDefendersAway()
            end
    
            if not (UI.AR_Enable and UI.AR_Enable:GetState()) then return end
    
            currentToken += 1
            local my = currentToken
    
            track.Stopped:Connect(function()
                if my == currentToken then currentToken += 1 end
            end)
    
            task.spawn(function()
                task.wait(action.tsec)
                if my ~= currentToken or not UI.AR_Enable:GetState() then return end
    
                if action.kind == "dunk" then
                    releaseKey(Enum.KeyCode.Space)
                else
                    fireShootRemote()
                end
            end)
        end)
    end
    bindHumanoidHooks()
    
    --============================================================--
    -- DEFENSE: OPTIMIZED GUARD ASSIST
    --============================================================--
    SecGuard:Header({ Name = "Camera-Relative Guard Assist (Optimized)" })
    
    local GA = {
      Enabled        = false,
      Stick          = 3.0,
      Arrive         = 0.35,
      Deadzone       = 0.08,
      RetargetEvery  = 0.25,
      ForwardGateDeg = 50,
      Debug          = false,
    }
    
    SecGuard:Toggle({
      Name="Guard Assist", Default=false,
      Callback=function(b) GA.Enabled=b end
    }, "GA_Enable")
    
    SecGuard:Slider({
      Name="Stick Distance", Default=GA.Stick, Minimum=2, Maximum=15, Precision=1,
      Callback=function(v) GA.Stick = tonumber(v) or GA.Stick end
    }, "GA_Stick")
    
    SecGuard:Slider({
      Name="Forward Gate (deg)", Default=GA.ForwardGateDeg, Minimum=0, Maximum=180, Precision=1,
      Callback=function(v) GA.ForwardGateDeg = tonumber(v) or GA.ForwardGateDeg end
    }, "GA_ForwardGateDeg")
    
    local DEFENSE_IDS = {}
    local GuardFolder
    
    local function scanGuardFolder(folder)
      table.clear(DEFENSE_IDS)
      if not folder then return end
      for _, obj in ipairs(folder:GetDescendants()) do
        if obj:IsA("Animation") and obj.AnimationId and obj.AnimationId ~= "" then
          local id = tostring(obj.AnimationId):match("%d+")
          if id then DEFENSE_IDS[id] = true end
        end
      end
    end
    
    local function resolveGuardFolder()
      if not Char then return nil end
      local animate = Char:FindFirstChild("Animate")
      if not animate then return nil end
      local move = animate:FindFirstChild("MovementAnimations")
      if not move then return nil end
      return move:FindFirstChild("GuardAnimations")
    end
    
    GuardFolder = resolveGuardFolder()
    scanGuardFolder(GuardFolder)
    
    local isGuardingCache = false
    local lastGuardCheck = 0
    local GUARD_CHECK_INTERVAL = 0.1
    
    local function IsGuarding()
      local now = tick()
      if now - lastGuardCheck < GUARD_CHECK_INTERVAL then
        return isGuardingCache
      end
      lastGuardCheck = now
      
      if not Hum then 
        isGuardingCache = false
        return false 
      end
      
      local hasIds = next(DEFENSE_IDS) ~= nil
      for _, tr in ipairs(Hum:GetPlayingAnimationTracks()) do
        local anim = tr.Animation
        local id = anim and tostring(anim.AnimationId):match("%d+")
        if hasIds and id and DEFENSE_IDS[id] then
          isGuardingCache = true
          return true
        end
      end
      
      isGuardingCache = false
      return false
    end
    
    local cachedCharacters = {}
    local lastCharacterScan = 0
    local CHAR_SCAN_INTERVAL = 0.5
    
    local function AllCandidateCharacters()
      local now = tick()
      if now - lastCharacterScan < CHAR_SCAN_INTERVAL then
        return cachedCharacters
      end
      lastCharacterScan = now
      
      local list = {}
    
      local world = workspace:FindFirstChild("World")
      local pf = world and world:FindFirstChild("Players")
      if pf then for _, ch in ipairs(pf:GetChildren()) do list[#list+1] = ch end end
    
      local chars = workspace:FindFirstChild("Characters")
      if chars then for _, ch in ipairs(chars:GetChildren()) do list[#list+1] = ch end end
    
      if #list == 0 then
        for _, ch in ipairs(workspace:GetChildren()) do
          if ch ~= Char and ch:FindFirstChild("HumanoidRootPart") and ch:FindFirstChild("Humanoid") then
            list[#list+1] = ch
          end
        end
      end
      
      cachedCharacters = list
      return list
    end
    
    local function NearestPerson(origin, maxD)
      local best, bestD = nil, (maxD or math.huge)
      for _, ch in ipairs(AllCandidateCharacters()) do
        if ch ~= Char then
          local hrp = ch:FindFirstChild("HumanoidRootPart")
          if hrp then
            local d = (hrp.Position - origin).Magnitude
            if d < bestD then best, bestD = ch, d end
          end
        end
      end
      return best, bestD
    end
    
    local down = {W=false,A=false,S=false,D=false}
    local function press(k)   if not down[k] then VirtualInputManager:SendKeyEvent(true,  Enum.KeyCode[k], false, game); down[k]=true  end end
    local function release(k) if     down[k] then VirtualInputManager:SendKeyEvent(false, Enum.KeyCode[k], false, game); down[k]=false end end
    local function releaseAll() for k in pairs(down) do release(k) end end
    
    local function planarUnit(v)
      local x,z = v.X, v.Z
      local m = math.sqrt(x*x + z*z)
      if m < 1e-9 then return Vector3.zero end
      return Vector3.new(x/m, 0, z/m)
    end
    
    local function ShadePoint(thrp)
      local tPos, tLook = thrp.Position, thrp.CFrame.LookVector
      local myY = HRP.Position.Y
      return Vector3.new(tPos.X + tLook.X*GA.Stick, myY, tPos.Z + tLook.Z*GA.Stick)
    end
    
    local invertForward, invertRight = false, false
    local CameraObj = workspace.CurrentCamera
    
    local function camAxes()
      local cf = (CameraObj and CameraObj.CFrame) or HRP.CFrame
      local f  = planarUnit(cf.LookVector)
      local r  = planarUnit(cf.RightVector)
      if f.Magnitude < 0.5 or r.Magnitude < 0.5 then
        cf = HRP.CFrame; f = planarUnit(cf.LookVector); r = planarUnit(cf.RightVector)
      end
      return f, r
    end
    
    local function IsFacingMe(thrp)
      if GA.ForwardGateDeg <= 0 then return true end
      local tLook = planarUnit(thrp.CFrame.LookVector)
      local toMe  = planarUnit(Vector3.new(HRP.Position.X - thrp.Position.X, 0, HRP.Position.Z - thrp.Position.Z))
      local dot   = math.clamp(tLook:Dot(toMe), -1, 1)
      local ang   = math.deg(math.acos(dot))
      return ang <= GA.ForwardGateDeg
    end
    
    local function driveCameraRelative(thrp)
      local des = ShadePoint(thrp)
      local toDes = Vector3.new(des.X - HRP.Position.X, 0, des.Z - HRP.Position.Z)
      local dist  = toDes.Magnitude
      if dist <= GA.Arrive then releaseAll(); return dist end
    
      local fwd, right = camAxes()
      local ux = toDes.Unit
      local fComp = fwd:Dot(ux)
      local rComp = right:Dot(ux)
    
      local want = {W=false,A=false,S=false,D=false}
    
      if math.abs(fComp) > GA.Deadzone then
        if fComp > 0 then
          if IsFacingMe(thrp) then
            want[invertForward and "S" or "W"] = true
          end
        else
          want[invertForward and "W" or "S"] = true
        end
      end
    
      if math.abs(rComp) > GA.Deadzone then
        if rComp > 0 then
          want[invertRight and "A" or "D"] = true
        else
          want[invertRight and "D" or "A"] = true
        end
      end
    
      for k,_ in pairs(down) do if want[k] then press(k) else release(k) end end
      return dist
    end
    
    local target, lastRetarget = nil, 0
    
    RunService.Heartbeat:Connect(function()
      if not GA.Enabled then 
        releaseAll()
        target = nil
        return 
      end
      
      if not Char or not HRP or not Hum then releaseAll(); return end
    
      if not IsGuarding() then
        releaseAll()
        target = nil
        return
      end
    
      local needAcquire = (target == nil) or (not target.Parent) or (not target:FindFirstChild("HumanoidRootPart"))
      if needAcquire or (tick() - lastRetarget) >= GA.RetargetEvery then
        local best, d = NearestPerson(HRP.Position, 140)
        if best then
          target = best
        else
          target = nil
        end
        lastRetarget = tick()
      end
    
      if not target then releaseAll(); return end
      local thrp = target:FindFirstChild("HumanoidRootPart")
      if not thrp then releaseAll(); target=nil; return end
    
      driveCameraRelative(thrp)
    end)
    
    LP.CharacterAdded:Connect(function()
      task.defer(function()
        GuardFolder = resolveGuardFolder()
        scanGuardFolder(GuardFolder)
        releaseAll()
        target = nil
        invertForward, invertRight = false, false
        cachedCharacters = {}
      end)
    end)
    
    --============================================================--
    -- ENHANCED AUTO BLOCK SYSTEM (From Original Script)
    --============================================================--
    SecAutoBlock:Header({ Name="Enhanced Auto Block System" })
    
    local AB = {
        Enabled = false,
        Range = 20,
    }
    
    -- Animation type detection system from original script
    local animationTypes = {
        jumpshots = {94886667916959, 116322977967759, 113977528329811, 76166448806690, 102293441327154, 131180048539633, 108759926700411, 93241263435675, 110544095049521, 136784835707528, 125793698395912, 115142710502902, 98614940329155, 18527132295},
        movingShots = {16247060979, 16247080711, 16205020756, 16246923753},
        fadeaways = {16247513358, 16104888271},
        closeShots = {16145346328, 16143619816, 16145343052, 16143612725, 95782467897683, 107778200710432},
        layups = {15997669966, 15997667717, 18624174223, 85255344390990, 83353063234065, 17398145127, 18491579001},
        OffOneOneHandedLebronSlam = {128426529653122, 88955983589184},
        offOneOneHandedSlam = {128426529653122},
        oneHandedOffOneRimGrazer = {17309609704, 17309613278},
        oneHandedOffOneZionSlam = {109084161206360, 81035097077274},
        oneHandedOffTwoBetweenTheLegs = {102841354389155, 90249361833464},
        oneHandedOffTwoTomahawk = {128261304943026, 17808751814},
        twoHandedOffOneReverseWindmill = {104294863820136, 109619690600949},
        twoHandedOffOneRimGrazer = {138932071140330, 84063020888988},
        twoHandedOffTwoBackScratcher = {16318441299, 93987183141020},
        twoHandedOffTwoWestbrookSlam = {130294784152405},
        twoHandedOffTwoKobe360Slam1LR = {130691515862869},
        offOneOneHandedWindmill1 = {79939733238322, 96032826688625},
        offTwoOneHandedPaul1 = {73552263643582},
        floater = {73312396340408, 18479327091}
    }
    
    local releaseTimes = {
        jumpshots = 0.44,
        movingShots = 0.44,
        fadeaways = 0.35,
        closeShots = 0.35,
        layups = 0.395,
        offOneOneHandedSlam = 0.38,
        oneHandedOffOneRimGrazer = 0.38,
        oneHandedOffOneZionSlam = 0.38,
        oneHandedOffTwoBetweenTheLegs = 0.37,
        oneHandedOffTwoTomahawk = 0.38,
        twoHandedOffOneReverseWindmill = 0.39,
        twoHandedOffOneRimGrazer = 0.365,
        twoHandedOffTwoBackScratcher = 0.38,
        twoHandedOffTwoWestbrookSlam = 0.38,
        twoHandedOffTwoKobe360Slam1LR = 0.41,
        offOneOneHandedWindmill1 = 0.362,
        offTwoOneHandedPaul1 = 0.38,
        OffOneOneHandedLebronSlam = 0.383,
        floater = 0.35
    }
    
    -- Build animation index for block system
    local BLOCK_ANIM_IDS = {}
    for animType, ids in pairs(animationTypes) do
        for _, id in ipairs(ids) do
            BLOCK_ANIM_IDS[id] = {
                type = animType,
                releaseTime = releaseTimes[animType] or 0.4
            }
        end
    end
    
    -- Index shooting animations from ReplicatedStorage
    local function indexShootingAnimations()
        local paths = {
            {"Animations", "Shooting"},
            {"Client", "Assets", "Animations", "Shooting"},
            {"Animations", "Shooting", "Jumpshots"},
            {"Animations", "Shooting", "Layups"},
            {"Animations", "Shooting", "MovingShots"},
            {"Animations", "Shooting", "PostFades"},
            {"Animations", "Shooting", "PostHooks"},
        }
        
        for _, pathParts in ipairs(paths) do
            local ok, folder = pcall(function()
                local current = RS
                for _, part in ipairs(pathParts) do
                    current = current:WaitForChild(part, 2)
                end
                return current
            end)
            
            if ok and folder then
                for _, obj in ipairs(folder:GetDescendants()) do
                    if obj:IsA("Animation") then
                        local id = idFromAnim(obj)
                        if id and not BLOCK_ANIM_IDS[id] then
                            BLOCK_ANIM_IDS[id] = {
                                type = "shot",
                                releaseTime = 0.4
                            }
                        end
                    end
                end
            end
        end
    end
    indexShootingAnimations()
    
    UI.AB_Enable = SecAutoBlock:Toggle({
        Name = "Enable Auto Block",
        Default = false,
        Callback = function(state)
            AB.Enabled = state
        end
    }, "AB_Enable")
    
    UI.AB_Range = SecAutoBlock:Slider({
        Name = "Block Range (studs)",
        Default = AB.Range,
        Minimum = 5,
        Maximum = 50,
        Precision = 1,
        DisplayMethod = "Value",
        Callback = function(v)
            AB.Range = tonumber(v) or 20
        end
    }, "AB_Range")
    
    -- Helper function to check if animation is a shooting animation
    local function isShootingAnim(animId)
        return BLOCK_ANIM_IDS[animId] ~= nil
    end
    
    -- Helper function to perform block jump
    local function performBlockJump()
        if not Hum then return end
        
        pcall(function()
            Hum:ChangeState(Enum.HumanoidStateType.Jumping)
        end)
        
        pcall(function()
            Hum.Jump = true
        end)
        
        task.spawn(function()
            pcall(function()
                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
                task.wait(0.1)
                VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
            end)
        end)
    end
    
    -- Monitor players for shooting animations
    local monitoredPlayers = {}
    local blockCooldowns = {}
    
    local function monitorPlayerForBlock(character)
        if monitoredPlayers[character] then return end
        
        local hum = character:FindFirstChild("Humanoid")
        local hrp = character:FindFirstChild("HumanoidRootPart")
        if not hum or not hrp then return end
        
        local conn = hum.AnimationPlayed:Connect(function(track)
            if not AB.Enabled or not HRP then return end
            
            local animId = track and track.Animation and idFromAnim(track.Animation)
            if not animId or not isShootingAnim(animId) then return end
            
            -- Check range
            local distance = (hrp.Position - HRP.Position).Magnitude
            if distance > AB.Range then return end
            
            -- Cooldown check
            local now = tick()
            if blockCooldowns[character] and (now - blockCooldowns[character]) < 0.5 then
                return
            end
            blockCooldowns[character] = now
            
            -- Get animation info with lower delay for faster blocks
            local animInfo = BLOCK_ANIM_IDS[animId]
            local blockDelay = (animInfo.releaseTime or 0.4) - (getPingMs() / 1000) - 0.15
            blockDelay = math.max(0.01, blockDelay)
            
            -- Schedule block
            task.spawn(function()
                task.wait(blockDelay)
                
                if not AB.Enabled or not hrp.Parent then return end
                
                -- Final range check
                if (hrp.Position - HRP.Position).Magnitude <= AB.Range then
                    performBlockJump()
                end
            end)
        end)
        
        monitoredPlayers[character] = conn
        
        character.AncestryChanged:Connect(function()
            if not character.Parent and monitoredPlayers[character] then
                monitoredPlayers[character]:Disconnect()
                monitoredPlayers[character] = nil
                blockCooldowns[character] = nil
            end
        end)
    end
    
    -- Monitor all players continuously
    RunService.Heartbeat:Connect(function()
        if not AB.Enabled then return end
        
        for _, char in ipairs(getAllPlayerCharacters()) do
            if not monitoredPlayers[char] then
                monitorPlayerForBlock(char)
            end
        end
    end)
    
    -- Cleanup on respawn
    LP.CharacterAdded:Connect(function()
        for char, conn in pairs(monitoredPlayers) do
            if conn then conn:Disconnect() end
        end
        monitoredPlayers = {}
        blockCooldowns = {}
    end)
    
    --============================================================--
    -- DRIBBLE: BOOST + MACROS
    --============================================================--
    SecDribBoost:Header({ Name="Universal Dribble Boost" })
    
    UI.DB_Enable = SecDribBoost:Toggle({
        Name = "Enable Boost",
        Default = false,
        Callback = function(_) end
    }, "DB_Enable")
    
    UI.DB_Force = SecDribBoost:Slider({
        Name = "Boost Force",
        Default = 10.0,
        Minimum = 0.1,
        Maximum = 15.0,
        DisplayMethod = "Value",
        Precision = 2,
        Callback = function(_) end
    }, "DB_Force")
    
    local DRIB_IDS = {}
    local function indexAnimSet(rootFolder)
        for _,o in ipairs(rootFolder:GetDescendants()) do
            if o:IsA("Animation") then
                local id = idFromAnim(o)
                if id then DRIB_IDS[id] = true end
            end
        end
        rootFolder.DescendantAdded:Connect(function(o)
            if o:IsA("Animation") then
                local id = idFromAnim(o)
                if id then DRIB_IDS[id] = true end
            end
        end)
        rootFolder.DescendantRemoving:Connect(function(o)
            if o:IsA("Animation") then
                local id = idFromAnim(o)
                if id then DRIB_IDS[id] = nil end
            end
        end)
    end
    
    local function initDribbleIndex()
        local ok, dr = pcall(function()
            return ReplicatedStorage:WaitForChild("Animations",2):WaitForChild("Dribbling",2)
        end)
        if ok and dr then indexAnimSet(dr) end
    
        local ok2, legacy = pcall(function()
            return ReplicatedStorage:WaitForChild("Client",2):WaitForChild("Assets",2)
                :WaitForChild("Animations",2):WaitForChild("Server",2):WaitForChild("Dribbling",2)
        end)
        if ok2 and legacy then indexAnimSet(legacy) end
    end
    initDribbleIndex()
    
    RunService.RenderStepped:Connect(function(dt)
        if not (Hum and HRP) then return end
        if not (UI.DB_Enable and UI.DB_Enable:GetState()) then return end
    
        local active = false
        for _,tr in ipairs(Hum:GetPlayingAnimationTracks()) do
            local id = tr and tr.Animation and idFromAnim(tr.Animation)
            if id and DRIB_IDS[id] then active = true break end
        end
        if not active then return end
    
        local force = UI.DB_Force and tonumber(UI.DB_Force:GetValue()) or 10.0
        if force <= 0 then return end
    
        local v  = HRP.Velocity
        local pv = Vector3.new(v.X, 0, v.Z)
        if pv.Magnitude < 0.05 then return end
    
        local cf = HRP.CFrame
        local r  = cf.RightVector
        local f  = cf.LookVector
        local useRight = math.abs(r:Dot(pv)) > math.abs(f:Dot(pv))
        local dir = useRight and ((r:Dot(pv) >= 0) and r or -r) or ((f:Dot(pv) >= 0) and f or -f)
    
        HRP.CFrame = cf + (dir.Unit * force * dt)
    end)
    
    --============================================================--
    -- DRIBBLE MACROS
    --============================================================--
    SecDribMacro:Header({ Name="Dribble Macros" })
    
    local MACRO = {
        Enabled = false,
        Speed = 0.12,
        Delay = 0.08,
        KeyB_Macro = "None",
        KeyV_Macro = "None",
        KeyG_Macro = "None",
        Running = false,
        SpamEnabled = false,
        SpamDelay = 0.5,
    }
    
    local MacroSequences = {
        ["Stepback"] = {"X"},
        ["Crossover Right"] = {"Z"},
        ["Crossover Left"] = {"C"},
        ["Hesitation Right"] = {"C", "Z"},
        ["Hesitation Left"] = {"Z", "C"},
        ["Spin Right"] = {"Z", "Z", "C", "C"},
        ["Spin Left"] = {"C", "C", "Z", "Z"},
        ["Behind Back Right"] = {"C", "X", "Z", "X"},
        ["Behind Back Left"] = {"Z", "X", "C", "X"},
        ["Half Spin Right"] = {"C", "X", "C", "Z", "X", "Z"},
        ["Half Spin Left"] = {"Z", "X", "Z", "C", "X", "C"},
        ["Snatchback"] = {"X", "X"},
        ["Combo"] = {"V", "V"},
        ["Ankle Breaker"] = {"Z", "X", "C", "Z", "X"},
        ["Elite Combo"] = {"C", "X", "Z", "Z", "C", "C", "X"},
        ["Speed Demon"] = {"Z", "C", "X", "X", "Z", "C"},
        ["Iso God"] = {"X", "Z", "X", "C", "X", "Z", "C"},
        ["Quick Handles"] = {"Z", "Z", "X", "C", "C"},
        ["Shake N Bake"] = {"C", "Z", "X", "Z", "C", "X"},
        ["Pro Hesitation"] = {"C", "Z", "X", "C", "Z"},
        ["Curry Slide"] = {"Z", "C", "Z", "X", "C"},
    }
    
    local function pressKey(key)
        pcall(function()
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode[key], false, game)
        end)
    end
    
    local function releaseKeyMacro(key)
        pcall(function()
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode[key], false, game)
        end)
    end
    
    local function executeMacro(sequence)
        if MACRO.Running then return end
        MACRO.Running = true
        task.spawn(function()
            for i, key in ipairs(sequence) do
                if not MACRO.Enabled or not MACRO.Running then break end
                
                pressKey(key)
                task.wait(MACRO.Speed)
                releaseKeyMacro(key)
                
                if i < #sequence then
                    task.wait(MACRO.Delay)
                end
            end
            task.wait(0.05)
            MACRO.Running = false
        end)
    end
    
    local SpamCombos = {
        {"Z", "C", "X"},
        {"C", "Z", "X", "Z"},
        {"X", "Z", "C"},
        {"Z", "X", "C", "X"},
        {"C", "X", "Z"},
        {"Z", "Z", "C", "C"},
    }
    
    local function executeRandomCombo()
        if MACRO.Running then return end
        local randomCombo = SpamCombos[math.random(1, #SpamCombos)]
        executeMacro(randomCombo)
    end
    
    SecDribMacro:Toggle({
        Name = "Enable Dribble Macros",
        Default = false,
        Callback = function(b)
            MACRO.Enabled = b
            if not b then
                MACRO.Running = false
                MACRO.SpamEnabled = false
            end
        end
    }, "Macro_Enable")
    
    SecDribMacro:Dropdown({
        Name = "B Key Macro",
        Options = {"None", "Stepback", "Crossover Right", "Crossover Left", "Ankle Breaker", "Elite Combo", "Speed Demon", "Iso God", "Quick Handles", "Shake N Bake", "Pro Hesitation", "Curry Slide"},
        Default = "None",
        Callback = function(choice)
            MACRO.KeyB_Macro = choice
        end
    }, "Macro_KeyB")
    
    SecDribMacro:Dropdown({
        Name = "V Key Macro",
        Options = {"None", "Stepback", "Crossover Right", "Crossover Left", "Ankle Breaker", "Elite Combo", "Speed Demon", "Iso God", "Quick Handles", "Shake N Bake", "Pro Hesitation", "Curry Slide"},
        Default = "None",
        Callback = function(choice)
            MACRO.KeyV_Macro = choice
        end
    }, "Macro_KeyV")
    
    SecDribMacro:Dropdown({
        Name = "G Key Macro",
        Options = {"None", "Stepback", "Crossover Right", "Crossover Left", "Ankle Breaker", "Elite Combo", "Speed Demon", "Iso God", "Quick Handles", "Shake N Bake", "Pro Hesitation", "Curry Slide"},
        Default = "None",
        Callback = function(choice)
            MACRO.KeyG_Macro = choice
        end
    }, "Macro_KeyG")
    
    SecDribMacro:Slider({
        Name = "Key Hold Time (seconds)",
        Default = 0.12,
        Minimum = 0.05,
        Maximum = 0.3,
        Precision = 2,
        DisplayMethod = "Value",
        Callback = function(v)
            MACRO.Speed = tonumber(v) or 0.12
        end
    }, "Macro_Speed")
    
    SecDribMacro:Slider({
        Name = "Move Delay (seconds)",
        Default = 0.08,
        Minimum = 0.01,
        Maximum = 0.3,
        Precision = 2,
        DisplayMethod = "Value",
        Callback = function(v)
            MACRO.Delay = tonumber(v) or 0.08
        end
    }, "Macro_Delay")
    
    SecDribMacro:Toggle({
        Name = "Auto Spam Random Combos",
        Default = false,
        Callback = function(b)
            MACRO.SpamEnabled = b
            if b and MACRO.Enabled then
                task.spawn(function()
                    while MACRO.SpamEnabled and MACRO.Enabled do
                        if not MACRO.Running then
                            executeRandomCombo()
                        end
                        task.wait(MACRO.SpamDelay)
                    end
                end)
            end
        end
    }, "Macro_Spam")
    
    SecDribMacro:Slider({
        Name = "Spam Delay (seconds)",
        Default = 0.5,
        Minimum = 0.2,
        Maximum = 2.0,
        Precision = 1,
        DisplayMethod = "Value",
        Callback = function(v)
            MACRO.SpamDelay = tonumber(v) or 0.5
        end
    }, "Macro_SpamDelay")
    
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed or not MACRO.Enabled or MACRO.Running then return end
        
        local macroToExecute = nil
        
        if input.KeyCode == Enum.KeyCode.B and MACRO.KeyB_Macro ~= "None" then
            macroToExecute = MACRO.KeyB_Macro
        elseif input.KeyCode == Enum.KeyCode.V and MACRO.KeyV_Macro ~= "None" then
            macroToExecute = MACRO.KeyV_Macro
        elseif input.KeyCode == Enum.KeyCode.G and MACRO.KeyG_Macro ~= "None" then
            macroToExecute = MACRO.KeyG_Macro
        end
        
        if macroToExecute then
            local sequence = MacroSequences[macroToExecute]
            if sequence then
                executeMacro(sequence)
            end
        end
    end)
    
    --============================================================--
    -- SPOOFER: CLIENT-SIDED NAME + OVR + BADGE
    --============================================================--
    SecSpoof:Header({ Name="Client-Sided Identity Spoofer" })
    
    local SPOOF = {
        NameEnabled = false,
        OVREnabled = false,
        BadgeEnabled = false,
        SpoofedName = "ProPlayer",
        SpoofedOVR = 99,
        SpoofedBadge = "Legend",
    }
    
    local NameInputHandle = nil
    
    local function getPlayerBanner()
        if not Char then return nil end
        return Char:FindFirstChild("PlayerBanner")
    end
    
    local function updateBannerName()
        local banner = getPlayerBanner()
        if not banner then return false end
        
        local nameLabel = banner:FindFirstChild("Background") 
            and banner.Background:FindFirstChild("PlayerName")
        
        if nameLabel and nameLabel:IsA("TextLabel") then
            nameLabel.Text = SPOOF.SpoofedName
            return true
        end
        return false
    end
    
    local function updateBannerOVR()
        local banner = getPlayerBanner()
        if not banner then return false end
        
        local ovrLabel = banner:FindFirstChild("Background")
            and banner.Background:FindFirstChild("OvrBackground")
            and banner.Background.OvrBackground:FindFirstChild("OvrStroke")
            and banner.Background.OvrBackground.OvrStroke:FindFirstChild("Overall")
        
        if ovrLabel and ovrLabel:IsA("TextLabel") then
            ovrLabel.Text = tostring(SPOOF.SpoofedOVR)
            
            local bgStroke = banner.Background:FindFirstChild("BackgroundStroke")
            local ovrStroke = banner.Background.OvrBackground:FindFirstChild("OvrStroke")
            local lowerStroke = banner:FindFirstChild("LowerBackground") 
                and banner.LowerBackground:FindFirstChild("LowerBackgroundStroke")
            
            if bgStroke and ovrStroke and lowerStroke then
                local color
                if SPOOF.SpoofedOVR >= 91 then
                    color = Color3.fromRGB(181, 21, 255)
                elseif SPOOF.SpoofedOVR >= 80 then
                    color = Color3.fromRGB(255, 219, 128)
                elseif SPOOF.SpoofedOVR >= 70 then
                    color = Color3.fromRGB(165, 165, 165)
                else
                    color = Color3.fromRGB(105, 73, 52)
                end
                
                bgStroke.ImageColor3 = color
                ovrStroke.ImageColor3 = color
                lowerStroke.ImageColor3 = color
            end
            
            return true
        end
        return false
    end
    
    local function updateBannerBadge()
        local banner = getPlayerBanner()
        if not banner then return false end
        
        local background = banner:FindFirstChild("Background")
        if not background then return false end
        
        for _, v in pairs(background:GetChildren()) do
            if v:IsA("ImageLabel") and v.Name:find("Rep") then
                v.Visible = false
            end
        end
        
        local targetBadge = background:FindFirstChild(SPOOF.SpoofedBadge .. "Rep")
        if targetBadge and targetBadge:IsA("ImageLabel") then
            targetBadge.Visible = true
            return true
        end
        
        return false
    end
    
    SecSpoof:Toggle({
        Name = "Enable Name Spoof",
        Default = false,
        Callback = function(b)
            SPOOF.NameEnabled = b
            if b then
                if NameInputHandle then
                    local currentValue = NameInputHandle:GetValue()
                    if currentValue and currentValue ~= "" then
                        SPOOF.SpoofedName = currentValue
                    end
                end
                
                if updateBannerName() then
                    Window:Notify({
                        Title = "Name Spoofer",
                        Description = "Spoofing as: " .. SPOOF.SpoofedName,
                        Duration = 3
                    })
                else
                    Window:Notify({
                        Title = "Name Spoofer",
                        Description = "Banner not found - will apply when loaded",
                        Duration = 3
                    })
                end
            end
        end
    }, "Spoof_Name_Enable")
    
    NameInputHandle = SecSpoof:Input({
        Name = "Spoofed Name",
        Placeholder = "Enter name...",
        Default = "ProPlayer",
        Callback = function(txt)
            if txt and txt ~= "" then
                SPOOF.SpoofedName = txt
                if SPOOF.NameEnabled then
                    updateBannerName()
                end
            end
        end
    }, "Spoof_Name_Value")
    
    SecSpoof:Toggle({
        Name = "Enable OVR Spoof",
        Default = false,
        Callback = function(b)
            SPOOF.OVREnabled = b
            if b then
                if updateBannerOVR() then
                    Window:Notify({
                        Title = "OVR Spoofer",
                        Description = "OVR set to: " .. SPOOF.SpoofedOVR,
                        Duration = 3
                    })
                else
                    Window:Notify({
                        Title = "OVR Spoofer",
                        Description = "Banner not found - will apply when loaded",
                        Duration = 3
                    })
                end
            end
        end
    }, "Spoof_OVR_Enable")
    
    SecSpoof:Slider({
        Name = "Spoofed OVR",
        Default = 99,
        Minimum = 60,
        Maximum = 99,
        Precision = 0,
        DisplayMethod = "Value",
        Callback = function(v)
            SPOOF.SpoofedOVR = tonumber(v) or 99
            if SPOOF.OVREnabled then
                updateBannerOVR()
            end
        end
    }, "Spoof_OVR_Value")
    
    SecSpoof:Toggle({
        Name = "Enable Badge Spoof",
        Default = false,
        Callback = function(b)
            SPOOF.BadgeEnabled = b
            if b then
                if updateBannerBadge() then
                    Window:Notify({
                        Title = "Badge Spoofer",
                        Description = "Badge set to: " .. SPOOF.SpoofedBadge,
                        Duration = 3
                    })
                else
                    Window:Notify({
                        Title = "Badge Spoofer",
                        Description = "Banner not found - will apply when loaded",
                        Duration = 3
                    })
                end
            end
        end
    }, "Spoof_Badge_Enable")
    
    SecSpoof:Dropdown({
        Name = "Spoofed Rank",
        Options = {"Rookie", "Pro", "Allstar", "Elite", "Superstar", "Legend"},
        Default = "Legend",
        Callback = function(choice)
            SPOOF.SpoofedBadge = choice
            if SPOOF.BadgeEnabled then
                updateBannerBadge()
            end
        end
    }, "Spoof_Badge_Value")
    
    task.spawn(function()
        while task.wait(0.3) do
            if not Char then continue end
            
            local banner = getPlayerBanner()
            if not banner then continue end
            
            if SPOOF.NameEnabled then
                updateBannerName()
            end
            
            if SPOOF.OVREnabled then
                updateBannerOVR()
            end
            
            if SPOOF.BadgeEnabled then
                updateBannerBadge()
            end
        end
    end)
    
    LP.CharacterAdded:Connect(function()
        task.wait(2)
        
        if SPOOF.NameEnabled then
            updateBannerName()
        end
        
        if SPOOF.OVREnabled then
            updateBannerOVR()
        end
        
        if SPOOF.BadgeEnabled then
            updateBannerBadge()
        end
    end)
    
    print("[WizardHub] Complete script loaded successfully!")
    print("[WizardHub] â€¢ Enhanced Auto Block with animation detection")
    print("[WizardHub] â€¢ Perfect Auto Release with ping compensation")
    print("[WizardHub] â€¢ Optimized Guard Assist")
    print("[WizardHub] â€¢ All features ready!")
end

local function _rujTSUVcuo()
  if __GamelistLoader then
      __GamelistLoader:Destroy()
  end
    if true then
      -- Use local JunkieProtected (initialized above)
      if _G.SCRIPT_KEY and JunkieProtected.ValidateKey({Key=_G.SCRIPT_KEY}) == "valid" then
            pcall(_usPNnKlAcv)
      else
        -- Use local JunkieProtected (initialized above)
        JunkieProtected.QuickStartUI({
          provider="Keyprovider",
          title="Wizard Hub",
          subtitle="Key Verification Required",
          service="Komodo's Script ",
          description="Please verify your key to use this script",
          onSuccess=function(result)
                    pcall(_usPNnKlAcv)
          end,
          onError=function(err) end
        })
    end
  else
        pcall(_usPNnKlAcv)
  end
end

_rujTSUVcuo()

	end)()
end;