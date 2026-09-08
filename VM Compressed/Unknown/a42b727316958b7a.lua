-- // NEBUBLOX : ANIME CREATURES FINAL MASTERPIECE //
-- // Merged with Anime_Creatures_Anui.lua logic //

local Configuration = {
    SettingsFile = "nebublox_creatures_key.data",
    Discord = "https://discord.gg/nebublox",
    LanyardKey = "3b8e9dc   de3778edb11fdd6c421a4bf5f",
    DiscordID = "1474223570656956538"
}

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local Lighting = game:GetService("Lighting")
local VirtualUser = game:GetService("VirtualUser")
local VIM = game:GetService("VirtualInputManager")
local player = Players.LocalPlayer

local Junkie = nil
local function initializeJunkie()
    local junkieSuccess, junkieInstance = pcall(function()
        return loadstring(game:HttpGet("https://jnkie.com/sdk/library.lua"))()
    end)
    
    if junkieSuccess then
        Junkie = junkieInstance
        Junkie.service = "Fremium"
        Junkie.identifier = "12010"
        Junkie.provider = "LootLabs"
    else
        warn("Failed to load Junkie SDK.")
    end
end
initializeJunkie()

local NebuUI = Instance.new("ScreenGui")
NebuUI.Name = "NebubloxBigBang"
NebuUI.IgnoreGuiInset = true; NebuUI.ResetOnSpawn = false
pcall(function() NebuUI.Parent = CoreGui end)
if not NebuUI.Parent then NebuUI.Parent = player:WaitForChild("PlayerGui", 5) end

local Background = Instance.new("Frame")
Background.Size = UDim2.new(1, 0, 1, 0)
Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Background.BorderSizePixel = 0
Background.Parent = NebuUI

local WelcomeText = Instance.new("TextLabel")
WelcomeText.Size = UDim2.new(1, 0, 1, 0)
WelcomeText.BackgroundTransparency = 1
WelcomeText.Font = Enum.Font.Michroma
WelcomeText.Text = "NEBUBLOX IS FORMING..."
WelcomeText.TextColor3 = Color3.fromRGB(170, 0, 255)
WelcomeText.TextSize = 24
WelcomeText.TextTransparency = 1
WelcomeText.ZIndex = 10
WelcomeText.Parent = Background

local KeyContainer = Instance.new("Frame")
KeyContainer.Size = UDim2.new(0, 400, 0, 250)
KeyContainer.Position = UDim2.new(0.5, -200, 0.5, -125)
KeyContainer.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
KeyContainer.BorderSizePixel = 0
KeyContainer.BackgroundTransparency = 1
KeyContainer.ClipsDescendants = true
KeyContainer.Parent = Background
local KeyCorner = Instance.new("UICorner")
KeyCorner.CornerRadius = UDim.new(0, 10)
KeyCorner.Parent = KeyContainer
local KeyStroke = Instance.new("UIStroke")
KeyStroke.Color = Color3.fromRGB(170, 0, 255)
KeyStroke.Thickness = 2
KeyStroke.Transparency = 1
KeyStroke.Parent = KeyContainer

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 60)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.Michroma
Title.TextSize = 25
Title.Text = "NEBUBLOX"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextTransparency = 1
Title.Parent = KeyContainer
local TitleGradient = Instance.new("UIGradient")
TitleGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(170, 0, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 204))
}
TitleGradient.Parent = Title

local StatusText = Instance.new("TextLabel")
StatusText.Size = UDim2.new(1, 0, 0, 30)
StatusText.Position = UDim2.new(0, 0, 0, 50)
StatusText.BackgroundTransparency = 1
StatusText.Font = Enum.Font.Gotham
StatusText.Text = "Awaiting Key Verification..."
StatusText.TextColor3 = Color3.fromRGB(180, 180, 180)
StatusText.TextSize = 14
StatusText.TextTransparency = 1
StatusText.Parent = KeyContainer

local KeyBox = Instance.new("TextBox")
KeyBox.Size = UDim2.new(0.8, 0, 0, 40)
KeyBox.Position = UDim2.new(0.1, 0, 0.45, 0)
KeyBox.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.PlaceholderText = "Paste Junkie Key Here..."
KeyBox.Font = Enum.Font.Michroma
KeyBox.TextSize = 14
KeyBox.TextTransparency = 1
KeyBox.BackgroundTransparency = 1
KeyBox.Text = ""
KeyBox.Parent = KeyContainer
local BoxCorner = Instance.new("UICorner")
BoxCorner.CornerRadius = UDim.new(0, 6)
BoxCorner.Parent = KeyBox

local VerifyBtn = Instance.new("TextButton")
VerifyBtn.Size = UDim2.new(0.35, 0, 0, 40)
VerifyBtn.Position = UDim2.new(0.1, 0, 0.7, 0)
VerifyBtn.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
VerifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
VerifyBtn.Font = Enum.Font.Michroma
VerifyBtn.Text = "VERIFY"
VerifyBtn.TextSize = 14
VerifyBtn.TextTransparency = 1
VerifyBtn.BackgroundTransparency = 1
VerifyBtn.Parent = KeyContainer
local VerifyCorner = Instance.new("UICorner")
VerifyCorner.CornerRadius = UDim.new(0, 6)
VerifyCorner.Parent = VerifyBtn

local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Size = UDim2.new(0.35, 0, 0, 40)
GetKeyBtn.Position = UDim2.new(0.55, 0, 0.7, 0)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
GetKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKeyBtn.Font = Enum.Font.Michroma
GetKeyBtn.Text = "GET KEY"
GetKeyBtn.TextSize = 14
GetKeyBtn.TextTransparency = 1
GetKeyBtn.BackgroundTransparency = 1
GetKeyBtn.Parent = KeyContainer
local GetKeyCorner = Instance.new("UICorner")
GetKeyCorner.CornerRadius = UDim.new(0, 6)
GetKeyCorner.Parent = GetKeyBtn

local function playBigBang()
    local void = Instance.new("Frame")
    void.Size = UDim2.new(0, 0, 0, 0)
    void.Position = UDim2.new(0.5, 0, 0.5, 0)
    void.AnchorPoint = Vector2.new(0.5, 0.5)
    void.BackgroundColor3 = Color3.fromRGB(10, 0, 20)
    void.Parent = Background
    local voidCorner = Instance.new("UICorner")
    voidCorner.CornerRadius = UDim.new(1, 0)
    voidCorner.Parent = void
    local voidStroke = Instance.new("UIStroke")
    voidStroke.Color = Color3.fromRGB(170, 0, 255)
    voidStroke.Thickness = 3
    voidStroke.Parent = void

    -- Big Bang Animation
    TweenService:Create(WelcomeText, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
    TweenService:Create(void, TweenInfo.new(1.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = UDim2.new(0, 80, 0, 80)}):Play()
    task.wait(1.2)

    -- Add Meteor Effect
    local corners = {
        UDim2.new(-0.2, 0, -0.2, 0),
        UDim2.new(1.2, 0, -0.2, 0),
        UDim2.new(-0.2, 0, 1.2, 0),
        UDim2.new(1.2, 0, 1.2, 0)
    }
    local meteors = {}
    for i, startPos in ipairs(corners) do
        local meteor = Instance.new("Frame")
        meteor.Size = UDim2.new(0, 15, 0, 15)
        meteor.Position = startPos
        meteor.AnchorPoint = Vector2.new(0.5, 0.5)
        meteor.BackgroundColor3 = (i % 2 == 0) and Color3.fromRGB(0, 255, 204) or Color3.fromRGB(255, 0, 128)
        meteor.Parent = Background
        local mCorner = Instance.new("UICorner")
        mCorner.CornerRadius = UDim.new(1, 0)
        mCorner.Parent = meteor
        local mGlow = Instance.new("UIStroke")
        mGlow.Color = meteor.BackgroundColor3
        mGlow.Thickness = 4
        mGlow.Transparency = 0.5
        mGlow.Parent = meteor
        table.insert(meteors, meteor)

        -- Meteor Animation
        TweenService:Create(meteor, TweenInfo.new(0.6, Enum.EasingStyle.Cubic, Enum.EasingDirection.In), {
            Position = UDim2.new(0.5, 0, 0.5, 0),
            Size = UDim2.new(0, 5, 0, 5)
        }):Play()
    end

    task.wait(0.6)
    for _, m in ipairs(meteors) do m:Destroy() end
    TweenService:Create(WelcomeText, TweenInfo.new(0.2), {TextTransparency = 1}):Play()

    -- Flash Animation
    local flash = Instance.new("Frame")
    flash.Size = UDim2.new(0, 50, 0, 50)
    flash.Position = UDim2.new(0.5, 0, 0.5, 0)
    flash.AnchorPoint = Vector2.new(0.5, 0.5)
    flash.BackgroundColor3 = Color3.fromRGB(0, 255, 204)
    flash.ZIndex = 5
    flash.Parent = Background
    local fCorner = Instance.new("UICorner")
    fCorner.CornerRadius = UDim.new(1, 0)
    fCorner.Parent = flash

    local explosionSize = math.max(Background.AbsoluteSize.X, Background.AbsoluteSize.Y) * 1.5
    local flashTween = TweenService:Create(flash, TweenInfo.new(0.8, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, explosionSize, 0, explosionSize),
        BackgroundTransparency = 1,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    })
    flashTween:Play()

    -- Cleanup
    TweenService:Create(void, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 0, 0, 0)
    }):Play()
    task.delay(0.3, function() void:Destroy() end)

    -- Fade Background
    TweenService:Create(Background, TweenInfo.new(1), {BackgroundTransparency = 0.3}):Play()
    KeyContainer.Size = UDim2.new(0, 0, 0, 0)
    KeyContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
    KeyContainer.AnchorPoint = Vector2.new(0.5, 0.5)
    local uiElements = {KeyContainer, KeyBox, VerifyBtn, GetKeyBtn}
    for _, el in ipairs(uiElements) do TweenService:Create(el, TweenInfo.new(0.1), {BackgroundTransparency = 0}):Play() end
    TweenService:Create(KeyStroke, TweenInfo.new(0.1), {Transparency = 0}):Play()
    local textElements = {Title, StatusText, KeyBox, VerifyBtn, GetKeyBtn}
    for _, txt in ipairs(textElements) do TweenService:Create(txt, TweenInfo.new(0.1), {TextTransparency = 0}):Play() end
    TweenService:Create(KeyContainer, TweenInfo.new(0.7, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {Size = UDim2.new(0, 400, 0, 250)}):Play()
    task.wait(0.8)

    pcall(function() flash:Destroy() end)

    local function verifyKey(inputKey)
        if not inputKey or inputKey == "" then
            StatusText.Text = "Please enter a key!"
            return false
        end
        
        if not Junkie then
            StatusText.Text = "DEBUG: Junkie SDK not loaded!"
            StatusText.TextColor3 = Color3.fromRGB(255, 68, 68)
            return false
        end
        
        local isValid, result = pcall(function() return Junkie.check_key(inputKey) end)
        
        -- DEBUG: Show raw response
        local debugInfo = "pcall=" .. tostring(isValid)
        if type(result) == "table" then
            for k, v in pairs(result) do
                debugInfo = debugInfo .. " | " .. tostring(k) .. "=" .. tostring(v)
            end
        else
            debugInfo = debugInfo .. " | raw=" .. tostring(result)
        end
        warn("[NEBUBLOX DEBUG] check_key result: " .. debugInfo)
        
        if isValid and result and result.valid then
            StatusText.Text = "Key Verified! Access Granted!"
            StatusText.TextColor3 = Color3.fromRGB(50, 205, 50)
            pcall(function() writefile(Configuration.SettingsFile, inputKey) end)
            return true
        else
            -- Show debug info on screen so user can report it
            StatusText.Text = "FAIL: " .. debugInfo
            StatusText.TextColor3 = Color3.fromRGB(255, 68, 68)
            if result and result.error == "KEY_INVALID" then
                pcall(function() if isfile(Configuration.SettingsFile) then delfile(Configuration.SettingsFile) end end)
            end
            return false
        end
    end

    -- Key Check

end

GetKeyBtn.MouseButton1Click:Connect(function()
    if Junkie then
        warn("[NEBUBLOX DEBUG] service=" .. tostring(Junkie.service) .. " identifier=" .. tostring(Junkie.identifier) .. " provider=" .. tostring(Junkie.provider) .. " api_key=" .. tostring(Junkie.api_key):sub(1,10))
        local link, err = Junkie.get_key_link()
        warn("[NEBUBLOX DEBUG] get_key_link=" .. tostring(link) .. " err=" .. tostring(err))
        if link then
            setclipboard(link)
            StatusText.Text = "Link: " .. tostring(link):sub(1, 80)
            StatusText.TextColor3 = Color3.fromRGB(0, 255, 204)
        else
            StatusText.Text = "get_key_link err: " .. tostring(err)
            StatusText.TextColor3 = Color3.fromRGB(255, 68, 68)
        end
    else
        StatusText.Text = "DEBUG: Junkie is nil!"
        StatusText.TextColor3 = Color3.fromRGB(255, 68, 68)
    end
end)

VerifyBtn.MouseButton1Click:Connect(function()
    local inputKey = KeyBox.Text:gsub("%s+", "")
    if verifyKey(inputKey) then
        task.wait(1)
        NebuUI:Destroy()
        InitializeApp()
    end
end)

function InitializeApp()
    -- // 0. SESSION & CLEANUP //
    local SessionID = tostring(math.random(1, 1000000)) .. tostring(tick())
    getgenv().NebuBlox_SessionID = SessionID
    
    local g = getgenv and getgenv() or shared
    if g.NebuState_AnimeCreatures then
        pcall(function() g.NebuState_AnimeCreatures.Running = false end)
        task.wait(0.25)
    end
    g.NebuState_AnimeCreatures = { Running = true, Connections = {}, SessionID = SessionID }
    local NebuState = g.NebuState_AnimeCreatures

    -- // 0.1 UTILS //
    local function IsValid() return NebuState.Running and NebuState.SessionID == getgenv().NebuBlox_SessionID end
    
    -- ═══════════════════════════════════════
    --  HIDDEN VISUAL ENHANCER (Fixes Blurry Issue)
    -- ═══════════════════════════════════════
    task.spawn(function()
        while task.wait(1) do
            if not IsValid() then break end
            pcall(function()
                for _, v in ipairs(Lighting:GetChildren()) do
                    if v:IsA("BlurEffect") or v:IsA("DepthOfFieldEffect") or v:IsA("SunRaysEffect") then v.Enabled = false end
                end
            end)
        end
    end)

    -- // 0.2 STATE & FLAGS //
    local Flags = {
        SmartFarm = false, AutoCapture = false, AutoEquip = false, AutoRebirth = false,
        AutoFreeGifts = false, AutoDailyRewards = false, AutoSpin = false, 
        AutoAchievements = false, SelectedMobs = {}, SelectedGachaId = "201", 
        AutoRollSelected = false, AutoLeafRaid = false, AutoStartRaid = false, AutoResetRaid = false,
        AntiAfkEnabled = false, Noclip = false, FPSBoost = false
    }

    local BossNameMap = {
        ["MapBoss1001"] = "World Boss 1", ["MapBoss1002"] = "World Boss 2",
        ["MapBoss1003"] = "World Boss 3", ["MapBoss1004"] = "World Boss 4",
        ["MapBoss1005"] = "World Boss 5", ["MapBoss1006"] = "World Boss 6",
        ["MapBoss1007"] = "World Boss 7", ["MapBoss1008"] = "World Boss 8"
    }

    -- // 0.3 TARGETING ENGINE //
    local function GetSmartTarget()
        local char = player.Character; local myRoot = char and char:FindFirstChild("HumanoidRootPart")
        if not myRoot then return nil end
        local bestTarget, shortestDist = nil, 1000
        
        local function CheckMob(mob)
            if mob and mob:FindFirstChild("HumanoidRootPart") and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                local rawName = mob.Name; local prettyName = BossNameMap[rawName] or rawName
                if next(Flags.SelectedMobs) ~= nil and not Flags.SelectedMobs[rawName] and not Flags.SelectedMobs[prettyName] then return end
                local dist = (mob.HumanoidRootPart.Position - myRoot.Position).Magnitude
                if dist < shortestDist then shortestDist = dist; bestTarget = mob end
            end
        end

        pcall(function()
            if Flags.AutoLeafRaid and workspace:FindFirstChild("enemy") then
                for _, m in ipairs(workspace.enemy:GetDescendants()) do 
                    if m:IsA("Model") and m.Name == "MapMonster_92" and m:FindFirstChild("Humanoid") and m.Humanoid.Health > 0 then bestTarget = m; return end 
                end
            end
            if workspace:FindFirstChild("enemy") then for _, mob in ipairs(workspace.enemy:GetChildren()) do CheckMob(mob) end end
            if not bestTarget and workspace:FindFirstChild("common") and workspace.common:FindFirstChild("Up") then
                for _, island in ipairs(workspace.common.Up:GetChildren()) do
                    local npc = island:FindFirstChild("NPC")
                    if npc then for _, mob in ipairs(npc:GetChildren()) do CheckMob(mob) end end
                end
            end
        end)
        return bestTarget
    end

    -- // 0.4 MOVEMENT & COMBAT ENGINE //
    RunService.Heartbeat:Connect(function()
        if not IsValid() then return end
        if Flags.BigBangFix then return end -- Shield during intro
        
        if Flags.AutoCapture or Flags.SmartFarm or Flags.AutoLeafRaid then
            pcall(function()
                VIM:SendKeyEvent(true, Enum.KeyCode.E, false, game); VIM:SendKeyEvent(false, Enum.KeyCode.E, false, game)
                ReplicatedStorage.Events.SetStatEvent:FireServer("AutoCatchFollow", true)
            end)
        end
        if Flags.SmartFarm or Flags.AutoLeafRaid then
            pcall(function()
                local char = player.Character; local myRoot = char and char:FindFirstChild("HumanoidRootPart")
                if myRoot then
                    local target = GetSmartTarget()
                    if target and target:FindFirstChild("HumanoidRootPart") then
                        myRoot.Velocity = Vector3.zero
                        myRoot.CFrame = target.HumanoidRootPart.CFrame * CFrame.new(0, 0, 4)
                        ReplicatedStorage.Events.Battle.AttackEvent:FireServer(target)
                    end
                end
            end)
        end
        if Flags.Noclip and player.Character then
            for _, v in ipairs(player.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide = false end end
        end
    end)

    -- // 0.5 AUTOMATIONS //
    task.spawn(function()
        while task.wait(0.5) do
            if not IsValid() then break end
            if Flags.AutoRollSelected then pcall(function() ReplicatedStorage.Events.NewLotto.RollOne:FireServer(true, tonumber(Flags.SelectedGachaId)) end) end
            if Flags.AutoAchievements then pcall(function() ReplicatedStorage.Events.Achievement.GetAllEvent:FireServer() end) end
            if Flags.AutoStartRaid then pcall(function() ReplicatedStorage.Events.Dungeon.LeafRaid.EnterEvent:FireServer(player, true) end) end
            if Flags.AutoResetRaid then pcall(function() ReplicatedStorage.Events.Dungeon.LeafRaid.ExitEvent:FireServer() end) end
        end
    end)

    task.spawn(function()
        while task.wait(5) do
            if not IsValid() then break end
            if Flags.AutoEquip then pcall(function() ReplicatedStorage.Events.Equip.EquipBestEvent:FireServer(1) end) end
            if Flags.AutoRebirth then pcall(function() ReplicatedStorage.Events.Rebirth.RebirthEvent:FireServer() end) end
            if Flags.AutoFreeGifts then for i=1,12 do pcall(function() ReplicatedStorage.Events.Rewards.ClaimeTaskEvent:FireServer(i) end) end end
        end
    end)

    -- ═══════════════════════════════════════
    --  UI INITIALIZATION
    -- ═══════════════════════════════════════
    local function Load()
        local url = "https://raw.githubusercontent.com/LilNugOfWisdom/NebubloxUI/main/NebubloxUI.lua"
        local success, content = pcall(game.HttpGet, game, url .. "?t=" .. tick())
        if not success then return warn("[NEBUBLOX]: HTTP GET Failed") end
        local fn, err = loadstring(content)
        if not fn then return warn("[NEBUBLOX]: UI Load Crash (Syntax): " .. tostring(err)) end
        return fn()
    end
    
    local Nebublox = Load()
    if not Nebublox then return end
    local Window = Nebublox:MakeWindow({
        Title = "NEBUBLOX", Subtitle = "Anime Creatures 🌌", Size = UDim2.new(0.85, 0, 0.85, 0),
        Profile = true, CyberBackground = true, TitleGradient = true, Acrylic = true
    })

    -- Sidebar Stats
    task.spawn(function()
        while task.wait(5) do
            if not IsValid() then break end
            pcall(function() local ping = tonumber(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString():match("%d+")) or 0; Window._ping.Text = "Stable â€¢ " .. ping .. "ms" end)
        end
    end)

    -- ═══════════════════════════════════════
    --  TAB 1: HOME (Standardized)
    -- ═══════════════════════════════════════
    local HomeTab = Window:MakeTab({Name = "Home", Icon = "🏠"})
    local DashSec = HomeTab:MakeSection({Name = "The Core"})
    local welcomeRow = DashSec:AddRow({Columns = 1})
    welcomeRow[1]:AddParagraph({Title = "<font size='36'>WELCOME TO NEBUBLOX</font>", Content = "<font size='22'>Good Afternoon, " .. player.DisplayName .. "!</font>", Center = true})
    
    local InfoSec = HomeTab:MakeSection({Name = "Information"})
    local InfoTabs = InfoSec:AddSubTabs({Tabs = {"API Logs", "OVERLORD"}})
    
    InfoTabs[1]:AddParagraph({
        Title = "STATUS UPDATE", 
        Content = "• Nebublox UI Framework v3.0\n• Masterpiece Feature Injection\n• Visual Enhancer Active (Anti-Blur)\n• Free Access Mode Enabled"
    })
    
    InfoTabs[2]:AddParagraph({
        Title = "MEET THE OVERLORD", 
        Content = "Pay no attention to the developer behind the multiverse...\n\nJust kidding. I control the gravity, the change of time, and the bugs (which are definitely features). Thanks for choosing Nebublox. Please join discord if you have any questions!"
    })
    
    local dBtn = InfoTabs[2]:AddButton({
        Name = "OVERLORD Discord", 
        Icon = "user", 
        Primary = true, 
        Callback = function() 
            setclipboard(Configuration.Discord) 
            Window:Notify({Title="Discord", Content="Invite link copied!", Type="info"}) 
        end
    })

    -- Lanyard Status
    pcall(function()
        if Configuration.DiscordID ~= "" then
            local lanLbl = Instance.new("TextLabel")
            lanLbl.Size = UDim2.new(1, -160, 1, 0) 
            lanLbl.Position = UDim2.new(0, 150, 0, 0)
            lanLbl.BackgroundTransparency = 1
            lanLbl.TextColor3 = Color3.fromRGB(240, 240, 240)
            lanLbl.TextSize = 12
            lanLbl.Font = Enum.Font.FredokaOne
            lanLbl.TextXAlignment = Enum.TextXAlignment.Right
            lanLbl.Parent = dBtn

            task.spawn(function()
                while task.wait(5) do
                    if not NebuState.Running or not lanLbl.Parent then break end
                    pcall(function()
                        local res = game:HttpGet("https://api.lanyard.rest/v1/users/" .. Configuration.DiscordID)
                        if res then
                            local data = game:GetService("HttpService"):JSONDecode(res)
                            if data.success and data.data then
                                local status = data.data.discord_status or "offline"
                                local emoji = status == "online" and "🟢" or (status == "idle" and "🌙" or (status == "dnd" and "🔴" or "⚫"))
                                local activity = "No Activity"
                                if data.data.activities and #data.data.activities > 0 then
                                    for _, act in ipairs(data.data.activities) do
                                        if act.type == 0 then
                                            activity = "Playing: " .. act.name
                                            break
                                        end
                                    end
                                end
                                lanLbl.Text = emoji .. " " .. data.data.discord_user.username .. " | " .. activity
                            end
                        end
                    end)
                end
            end)
        end
    end)

    -- ═══════════════════════════════════════
    --  TAB 2: ACTIVITIES
    -- ═══════════════════════════════════════
    local ActivityTab = Window:MakeTab({Name = "Activities", Icon = "âœ¨"})
    local RaidSec = ActivityTab:MakeSection({Name = "Endless Dungeon"})
    RaidSec:AddToggle({Name = "Auto Dungeon Kill", Default = false, Callback = function(s) Flags.AutoLeafRaid = s end})
    RaidSec:AddToggle({Name = "Auto Start Dungeon", Default = false, Callback = function(s) Flags.AutoStartRaid = s end})
    RaidSec:AddToggle({Name = "Auto Reset Dungeon", Default = false, Callback = function(s) Flags.AutoResetRaid = s end})

    -- ═══════════════════════════════════════
    --  TAB 3: FARMING
    -- ═══════════════════════════════════════
    local FarmTab = Window:MakeTab({Name = "Farming", Icon = "âš”ï¸"})
    local CombatSec = FarmTab:MakeSection({Name = "Combat Engine"})
    CombatSec:AddToggle({Name = "God-Mode Auto Farm", Default = false, Callback = function(s) Flags.SmartFarm = s end})
    CombatSec:AddToggle({Name = "Auto Capture (Hyper-Spam)", Default = false, Callback = function(s) Flags.AutoCapture = s end})

    local PrioritySec = FarmTab:MakeSection({Name = "Target Priority"})
    local TargetDrop = PrioritySec:AddMultiDropdown({Name = "Selected Mobs", Options = {"Refresh List..."}, Callback = function(val)
        Flags.SelectedMobs = {}
        for k, v in pairs(val) do if type(k) == "string" and v == true then Flags.SelectedMobs[k] = true elseif type(v) == "string" then Flags.SelectedMobs[v] = true end end
    end})
    PrioritySec:AddButton({Name = "Refresh Nearby Targets", Callback = function()
        local list = {}; local seen = {}; pcall(function() if workspace:FindFirstChild("enemy") then for _, m in ipairs(workspace.enemy:GetChildren()) do if m:IsA("Model") and m:FindFirstChild("Humanoid") then local n = BossNameMap[m.Name] or m.Name; if not seen[n] then seen[n] = true; table.insert(list, n) end end end end end); TargetDrop:Refresh(list, true)
    end})

    -- ═══════════════════════════════════════
    --  TAB 4: AUTOMATION
    -- ═══════════════════════════════════════
    local AutoTab = Window:MakeTab({Name = "Automation", Icon = "🤖"})
    local GachaSec = AutoTab:MakeSection({Name = "Auto Roll"})
    local GachaList = {["Shock Fruit"] = "201", ["Flame Fruit"] = "202", ["Sharingan"] = "203", ["Tessen"] = "204", ["Scouter"] = "221"}
    GachaSec:AddDropdown({Name = "Select Machine", Options = {"Shock Fruit", "Flame Fruit", "Sharingan", "Tessen", "Scouter"}, Callback = function(v) Flags.SelectedGachaId = GachaList[v] end})
    GachaSec:AddToggle({Name = "Start Auto Roll", Default = false, Callback = function(s) Flags.AutoRollSelected = s end})

    local RewardSec = AutoTab:MakeSection({Name = "Rewards"})
    RewardSec:AddToggle({Name = "Auto Claim Achievements", Default = false, Callback = function(s) Flags.AutoAchievements = s end})
    RewardSec:AddToggle({Name = "Auto Equip Best", Default = false, Callback = function(s) Flags.AutoEquip = s end})
    RewardSec:AddToggle({Name = "Auto Rebirth", Default = false, Callback = function(s) Flags.AutoRebirth = s end})
    RewardSec:AddToggle({Name = "Auto Free Gifts", Default = false, Callback = function(s) Flags.AutoFreeGifts = s end})

    -- ═══════════════════════════════════════
    --  TAB 5: TRAVEL
    -- ═══════════════════════════════════════
    local TravelTab = Window:MakeTab({Name = "Worlds", Icon = "🌎"})
    local TravelSec = TravelTab:MakeSection({Name = "Fast Travel"})
    local Islands = {{Name = "Seaside Town", Id = 0}, {Name = "Pirate Village", Id = 1}, {Name = "Ninja Village", Id = 2}, {Name = "Shirayuki Village", Id = 3}, {Name = "Cursed Arts", Id = 4}}
    for _, isl in ipairs(Islands) do TravelSec:AddButton({Name = isl.Name, Callback = function() ReplicatedStorage.Events.Map.PortalEvent:FireServer(isl.Id) end}) end

    -- ═══════════════════════════════════════
    --  TAB 6: SETTINGS (Standardized)
    -- ═══════════════════════════════════════
    local SettTab = Window:MakeTab({Name = "Settings", Icon = "⚙️"})
    local UtilSec = SettTab:MakeSection({Name = "Utility Hacks"})
    
    UtilSec:AddToggle({Name = "Anti-AFK", Default = false, Callback = function(s)
        if s then
            NebuState.AntiAfkConnection = player.Idled:Connect(function()
                local vu = game:GetService("VirtualUser")
                vu:CaptureController()
                vu:ClickButton2(Vector2.new())
            end)
        else
            if NebuState.AntiAfkConnection then 
                NebuState.AntiAfkConnection:Disconnect()
                NebuState.AntiAfkConnection = nil 
            end
        end
    end})

    UtilSec:AddToggle({Name = "Noclip", Default = false, Callback = function(s) 
        NebuState.Noclip = s
        if s and not NebuState.NoclipLoopConn then
            NebuState.NoclipLoopConn = RunService.Stepped:Connect(function()
                if not NebuState.Noclip then 
                    NebuState.NoclipLoopConn:Disconnect()
                    NebuState.NoclipLoopConn = nil 
                    return 
                end
                if player.Character then
                    for _, v in ipairs(player.Character:GetDescendants()) do
                        if v:IsA("BasePart") and v.CanCollide then v.CanCollide = false end
                    end
                end
            end)
        end
    end})

    UtilSec:AddButton({Name = "FPS Boost", Icon = "zap", Callback = function()
        task.spawn(function() pcall(function()
            local terrain = Workspace:WaitForChild("Terrain", 5)
            terrain.WaterWaveSize = 0; terrain.WaterWaveSpeed = 0; terrain.WaterReflectance = 0; terrain.WaterTransparency = 0
            Lighting.GlobalShadows = false; Lighting.FogEnd = 9e9; Lighting.Brightness = 0
            for _, c in ipairs(Lighting:GetChildren()) do 
                if c:IsA("PostEffect") or c:IsA("Atmosphere") or c:IsA("Sky") then c:Destroy() end 
            end
            for _, descendant in ipairs(Workspace:GetDescendants()) do
                if descendant:IsA("BasePart") then descendant.Material = Enum.Material.Plastic; descendant.Reflectance = 0; descendant.CastShadow = false
                elseif descendant:IsA("Decal") or descendant:IsA("Texture") then descendant.Transparency = 1
                elseif descendant:IsA("ParticleEmitter") or descendant:IsA("Trail") then descendant.Lifetime = NumberRange.new(0, 0)
                end
            end
            settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        end); Window:Notify({Title="Settings", Content="FPS Boost Enabled!", Type="info"}) end)
    end})

    UtilSec:AddButton({Name = "Destroy Script", Icon = "power", Danger = true, Callback = function()
        Window:Destroy()
        NebuState.Running = false
    end})

    local SetSec = SettTab:MakeSection({Name = "Configuration Management"})
    local FolderName = "Nebublox"
    local ConfigsFolder = FolderName .. "/Configs"
    pcall(function() if not isfolder(FolderName) then makefolder(FolderName) end; if not isfolder(ConfigsFolder) then makefolder(ConfigsFolder) end end)

    local ConfName = ""
    local function GetConfigs() local files = {"None"}; pcall(function() for _, f in ipairs(listfiles(ConfigsFolder)) do if f:match("%.json$") then table.insert(files, f:match("([^/\\\\]+)%.json$")) end end end); return files end

    local confRow1 = SetSec:AddRow({Columns = 2, Widths = {0.8, 0.2}})
    local ConfDrop = confRow1[1]:AddDropdown({Name = "Saved Profiles", Options = GetConfigs(), Default = "None", Callback = function(v) if v ~= "None" then ConfName = v end end})
    confRow1[2]:AddButton({Name = "🔄", Primary = true, Center = true, Callback = function()
        local files = GetConfigs()
        if ConfDrop and ConfDrop.Refresh then ConfDrop:Refresh(files, files[1]) end
    end})

    SetSec:AddDivider()
    SetSec:AddTextbox({Name = "Profile Name", Placeholder = "Enter config name...", Callback = function(t) ConfName = t end})
    SetSec:AddDivider()

    local confRow2 = SetSec:AddRow({Columns = 3, Widths = {0.33, 0.33, 0.33}})
    confRow2[1]:AddButton({Name = "Save", Primary = true, Center = true, Callback = function() 
        if ConfName ~= "" and ConfName ~= "None" then 
            pcall(function() writefile(ConfigsFolder.."/"..ConfName..".json", game:GetService("HttpService"):JSONEncode(NebuState or {})) end)
            Window:Notify({Title="Config",Content="Saved: "..ConfName,Type="success"}) 
        end 
    end})
    confRow2[2]:AddButton({Name = "Load", Center = true, Callback = function() 
        if ConfName ~= "" and ConfName ~= "None" then 
            pcall(function() local p = ConfigsFolder.."/"..ConfName..".json"; if isfile(p) then for k,v in pairs(game:GetService("HttpService"):JSONDecode(readfile(p))) do NebuState[k] = v end end end)
            Window:Notify({Title="Config",Content="Loaded: "..ConfName,Type="success"}) 
        end 
    end})
    confRow2[3]:AddButton({Name = "Delete", Danger = true, Center = true, Callback = function() 
        if ConfName ~= "" and ConfName ~= "None" then 
            pcall(function() delfile(ConfigsFolder.."/"..ConfName..".json") end)
            Window:Notify({Title="Config",Content="Deleted: "..ConfName,Type="error"}) 
        end 
    end})

    -- ═_═_═_═_═_═_═_═_═_═_═_═_═_═_═_═_═_═_═_═_═_═_═_═_═_═_═_═_═_═_
    --  TAB 7: ELITE PREVIEW (NEBUBLOX 4.0)
    -- ═_═_═_═_═_═_═_═_═_═_═_═_═_═_═_═_═_═_═_═_═_═_═_═_═_═_═_═_═_═_
    -- ═══════════════════════════════════════
    --  TAB: INVENTORY (Advanced Framework)
    -- ═══════════════════════════════════════
    local InvTab = Window:MakeTab({Name = "Inventory", Icon = "🎒"})

    -- ════ Inventory State Tracker ════
    NebuState.InventoryTracker = {
    Gear = {
    {Name = "Nebula Blade",    Icon = "⚔️", Qty = 3,  MaxQty = 10, Category = "Gear"},
    {Name = "Void Gauntlet",   Icon = "🥊", Qty = 7,  MaxQty = 10, Category = "Gear"},
    {Name = "Astral Staff",    Icon = "🪄", Qty = 10, MaxQty = 10, Category = "Gear"},
    {Name = "Gravity Hammer",  Icon = "🔨", Qty = 1,  MaxQty = 5,  Category = "Gear"},
    },
    Accessories = {
    {Name = "Void Crystal",    Icon = "🔮", Qty = 5,  MaxQty = 15, Category = "Accessories"},
    {Name = "Star Fragment",   Icon = "⭐", Qty = 9,  MaxQty = 10, Category = "Accessories"},
    {Name = "Dark Matter",     Icon = "🌌", Qty = 2,  MaxQty = 5,  Category = "Accessories"},
    {Name = "Scroll of Binding", Icon = "📜", Qty = 0, MaxQty = 10, Category = "Accessories"},
    }
    }

    -- ════ CheckItemMaxed ════
    local function CheckItemMaxed(item)
    return item.Qty and item.MaxQty and item.Qty >= item.MaxQty
    end

    -- ════ GetPlayerInventory (all categories flattened) ════
    local function GetPlayerInventory()
    local all = {}
    for _, catItems in pairs(NebuState.InventoryTracker) do
    for _, item in ipairs(catItems) do
    table.insert(all, item)
    end
    end
    return all
    end

    -- ════ Gear Section ════
    local GearSec = InvTab:MakeSection({Name = "⚔️ Gear"})
    local GearHandle = GearSec:AddInventory({
    Items = NebuState.InventoryTracker.Gear,
    Callback = function(item)
    if CheckItemMaxed(item) then
    Window:Notify({Title = "Maxed", Content = item.Name .. " is already Maxed!", Type = "error"})
    else
    Window:Notify({Title = "Grinding", Content = "Grinding for " .. item.Name .. "...", Type = "info"})
    end
    end
    })

    -- ════ Accessories Section ════
    local AccSec = InvTab:MakeSection({Name = "🎩 Accessories"})
    local AccHandle = AccSec:AddInventory({
    Items = NebuState.InventoryTracker.Accessories,
    Callback = function(item)
    if CheckItemMaxed(item) then
    Window:Notify({Title = "Maxed", Content = item.Name .. " is already Maxed!", Type = "error"})
    else
    Window:Notify({Title = "Grinding", Content = "Grinding for " .. item.Name .. "...", Type = "info"})
    end
    end
    })

    -- ════ Auto-Grind Background Loop ════
    task.spawn(function()
    while task.wait(4) do
    if not NebuState.Nebublox_Running then break end
    local gearUpdated, accUpdated = false, false

    for _, item in ipairs(NebuState.InventoryTracker.Gear) do
    if not CheckItemMaxed(item) and math.random() > 0.5 then
    item.Qty = math.min(item.Qty + 1, item.MaxQty)
    gearUpdated = true
    if CheckItemMaxed(item) then
    Window:Notify({Title = "⚡ MAXED", Content = item.Name .. " is now MAXED!", Type = "success"})
    end
    end
    end

    for _, item in ipairs(NebuState.InventoryTracker.Accessories) do
    if not CheckItemMaxed(item) and math.random() > 0.5 then
    item.Qty = math.min(item.Qty + 1, item.MaxQty)
    accUpdated = true
    if CheckItemMaxed(item) then
    Window:Notify({Title = "⚡ MAXED", Content = item.Name .. " is now MAXED!", Type = "success"})
    end
    end
    end

    if gearUpdated and GearHandle and GearHandle.UpdateInventory then
    pcall(function() GearHandle:UpdateInventory(NebuState.InventoryTracker.Gear) end)
    end
    if accUpdated and AccHandle and AccHandle.UpdateInventory then
    pcall(function() AccHandle:UpdateInventory(NebuState.InventoryTracker.Accessories) end)
    end
    end
    end)


    local EliteTab = Window:MakeTab({Name = "Elite Preview", Icon = "💎", Premium = true})
    local EliteSec = EliteTab:MakeSection({Name = "Nebula UI 4.0 Components"})
    
    EliteSec:AddImage({
        Height = 150,
        Image = "rbxassetid://9968344105"
    })

    EliteSec:AddColorPicker({
        Name = "Primary UI Theme",
        Default = Color3.fromRGB(170, 0, 255),
        Callback = function(col)
            Nebublox:SetTheme({PrimaryAccent = col, Accent = col, Purple = col})
        end
    })

    local InvSec = EliteTab:MakeSection({Name = "Inventory Syncing"})
    InvSec:AddInventory({
        Height = 200,
        Items = {
            {Name = "Sword of Cosmos", Qty = 1, Icon = "rbxassetid://7733717857"},
            {Name = "Star Fragment", Qty = 99, Icon = "rbxassetid://7733658504"},
            {Name = "Void Crystal", Qty = 5, Icon = "rbxassetid://7733680589"},
            {Name = "Health Potion", Qty = 10, Icon = "rbxassetid://7733715400"}
        },
        Callback = function(item)
            Window:Notify({Title = "Inventory Checked", Content = "Selected: "..item.Name.." (x"..tostring(item.Qty)..")", Type = "info"})
        end
    })

    Window:Notify({Title = "Nebublox", Content = "Anime Creatures Final Masterpiece Loaded!", Type = "success"})
    
    -- Aesthetics Engine
    task.spawn(function()
        task.wait(3)
        local cViolet = Color3.fromRGB(170, 0, 255)
        local cBlue   = Color3.fromRGB(0, 255, 204)
        local function ApplyGradient(instance, c1, c2)
            if not instance or not instance:IsA("GuiObject") then return end
            for _, child in ipairs(instance:GetChildren()) do if child:IsA("UIGradient") then child:Destroy() end end
            local grad = Instance.new("UIGradient")
            grad.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, c1), ColorSequenceKeypoint.new(1, c2)}
            grad.Parent = instance
        end
        local rootUi = nil
        for _, v in pairs(game:GetService("CoreGui"):GetChildren()) do if string.find(v.Name, "Nebublox") or v:FindFirstChild("Main") then rootUi = v break end end
        if rootUi then
            local function styleElement(v)
                if v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("TextBox") then
                    v.Font = Enum.Font.FredokaOne
                    local text = v.Text
                    if text == "NEBUBLOX" or text == "Home" or text == "Farming" or text == "Activities" or text == "Automation" or text == "Worlds" or text == "Settings" then 
                        ApplyGradient(v, cViolet, cBlue)
                    elseif string.find(text, "Anime") then 
                        ApplyGradient(v, Color3.fromRGB(255, 170, 0), Color3.fromRGB(255, 50, 0))
                    end
                end
            end
            for _, v in ipairs(rootUi:GetDescendants()) do styleElement(v) end
            rootUi.DescendantAdded:Connect(styleElement)
        end
    end)
end -- END InitializeApp()

-- ═══════════════════════════════════════
--  KEY VERIFICATION & LAUNCH
-- ═══════════════════════════════════════
local function trySavedKey()
    if isfile and isfile(Configuration.SettingsFile) then
        local savedKey = readfile(Configuration.SettingsFile):gsub("%s+", "")
        if savedKey and savedKey ~= "" then
            StatusText.Text = "Auto-Verifying Saved Key..."
            if verifyKey(savedKey) then
                task.wait(1.5)
                NebuUI:Destroy()
                InitializeApp()
                return true
            end
        end
    end
    return false
end

if not trySavedKey() then playBigBang() end
