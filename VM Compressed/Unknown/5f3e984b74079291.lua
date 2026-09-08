-- // NEBUBLOX : ANIME DESTROYERS //
-- // Game: Anime Destroyers //

local Configuration = {
    SettingsFile = "nebublox_destroyers_key.data",
    Discord = "https://discord.gg/nebublox",
    LanyardKey = "3b8e9dcde3778edb11fdd6c421a4bf5f",
    DiscordID = "1474223570656956538"
}

-- ═══════════════════════════════════════
--  BIG BANG INTRO & KEY SYSTEM
-- ═══════════════════════════════════════
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local player = Players.LocalPlayer
local InitializeApp

    local Junkie = nil
    local function initializeJunkie()
        local junkieSuccess, junkieInstance = pcall(function()
            return loadstring(game:HttpGet("https://jnkie.com/sdk/library.lua"))()
        end)
        
        if junkieSuccess then
            Junkie = junkieInstance
            Junkie.service = "Fremium"
            Junkie.identifier = "6331"
            Junkie.provider = "Nebublox Freemium Key"
        else
            warn("Failed to load Junkie SDK.")
        end
    end
    initializeJunkie()

local NebuUI = Instance.new("ScreenGui")
NebuUI.Name = "NebubloxBigBang"
NebuUI.IgnoreGuiInset = true
NebuUI.ResetOnSpawn = false
pcall(function() NebuUI.Parent = CoreGui end)
if not NebuUI.Parent then NebuUI.Parent = player:WaitForChild("PlayerGui", 5) end

local Background = Instance.new("Frame")
Background.Size = UDim2.new(1, 0, 1, 0)
Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Background.BorderSizePixel = 0
Background.Parent = NebuUI

local Singularity = Instance.new("Frame")
Singularity.Size = UDim2.new(0, 2, 0, 2)
Singularity.Position = UDim2.new(0.5, -1, 0.5, -1)
Singularity.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Singularity.BorderSizePixel = 0
Singularity.AnchorPoint = Vector2.new(0.5, 0.5)
Singularity.Parent = Background
local SingularityCorner = Instance.new("UICorner")
SingularityCorner.CornerRadius = UDim.new(1, 0)
SingularityCorner.Parent = Singularity

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
Title.TextSize = 30
Title.Text = "NEBUBLOX"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextTransparency = 1
Title.Parent = KeyContainer
local TitleGradient = Instance.new("UIGradient")
TitleGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(170, 0, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 204))}
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
    void.Size = UDim2.new(0, 0, 0, 0); void.Position = UDim2.new(0.5, 0, 0.5, 0); void.AnchorPoint = Vector2.new(0.5, 0.5); void.BackgroundColor3 = Color3.fromRGB(10, 0, 20); void.Parent = Background
    local voidCorner = Instance.new("UICorner"); voidCorner.CornerRadius = UDim.new(1, 0); voidCorner.Parent = void
    local voidStroke = Instance.new("UIStroke"); voidStroke.Color = Color3.fromRGB(170, 0, 255); voidStroke.Thickness = 3; voidStroke.Parent = void
    
    TweenService:Create(WelcomeText, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
    TweenService:Create(void, TweenInfo.new(1.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = UDim2.new(0, 80, 0, 80)}):Play()
    task.wait(1.2)

    local corners = { UDim2.new(-0.2, 0, -0.2, 0), UDim2.new(1.2, 0, -0.2, 0), UDim2.new(-0.2, 0, 1.2, 0), UDim2.new(1.2, 0, 1.2, 0) }
    local meteors = {}
    for i, startPos in ipairs(corners) do
        local meteor = Instance.new("Frame")
        meteor.Size = UDim2.new(0, 15, 0, 15); meteor.Position = startPos; meteor.AnchorPoint = Vector2.new(0.5, 0.5); meteor.BackgroundColor3 = (i % 2 == 0) and Color3.fromRGB(0, 255, 204) or Color3.fromRGB(255, 0, 128); meteor.Parent = Background
        local mCorner = Instance.new("UICorner"); mCorner.CornerRadius = UDim.new(1, 0); mCorner.Parent = meteor
        local mGlow = Instance.new("UIStroke"); mGlow.Color = meteor.BackgroundColor3; mGlow.Thickness = 4; mGlow.Transparency = 0.5; mGlow.Parent = meteor
        table.insert(meteors, meteor)
        TweenService:Create(meteor, TweenInfo.new(0.6, Enum.EasingStyle.Cubic, Enum.EasingDirection.In), { Position = UDim2.new(0.5, 0, 0.5, 0), Size = UDim2.new(0, 5, 0, 5) }):Play()
    end
    task.wait(0.6)
    for _, m in ipairs(meteors) do m:Destroy() end
    TweenService:Create(WelcomeText, TweenInfo.new(0.2), {TextTransparency = 1}):Play()
    
    local flash = Instance.new("Frame")
    flash.Size = UDim2.new(0, 50, 0, 50); flash.Position = UDim2.new(0.5, 0, 0.5, 0); flash.AnchorPoint = Vector2.new(0.5, 0.5); flash.BackgroundColor3 = Color3.fromRGB(0, 255, 204); flash.ZIndex = 5; flash.Parent = Background
    local fCorner = Instance.new("UICorner"); fCorner.CornerRadius = UDim.new(1, 0); fCorner.Parent = flash

    local explosionSize = math.max(Background.AbsoluteSize.X, Background.AbsoluteSize.Y) * 1.5
    local flashTween = TweenService:Create(flash, TweenInfo.new(0.8, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, explosionSize, 0, explosionSize), BackgroundTransparency = 1, BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    })
    flashTween:Play()
    
    TweenService:Create(void, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0)}):Play()
    task.delay(0.3, function() void:Destroy() end)
    TweenService:Create(Background, TweenInfo.new(1), {BackgroundTransparency = 0.3}):Play()
    KeyContainer.Size = UDim2.new(0, 0, 0, 0); KeyContainer.Position = UDim2.new(0.5, 0, 0.5, 0); KeyContainer.AnchorPoint = Vector2.new(0.5, 0.5)
    local uiElements = {KeyContainer, KeyBox, VerifyBtn, GetKeyBtn}
    for _, el in ipairs(uiElements) do TweenService:Create(el, TweenInfo.new(0.1), {BackgroundTransparency = 0}):Play() end
    TweenService:Create(KeyStroke, TweenInfo.new(0.1), {Transparency = 0}):Play()
    local textElements = {Title, StatusText, KeyBox, VerifyBtn, GetKeyBtn}
    for _, txt in ipairs(textElements) do TweenService:Create(txt, TweenInfo.new(0.1), {TextTransparency = 0}):Play() end
    TweenService:Create(KeyContainer, TweenInfo.new(0.7, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), { Size = UDim2.new(0, 400, 0, 250) }):Play()
    task.wait(0.8); pcall(function() flash:Destroy() end)

    local function verifyKey(inputKey)
        if not inputKey or inputKey == "" then
            StatusText.Text = "Please enter a key!"
            return false
        end
        
        local isValid, result = pcall(function() return Junkie.check_key(inputKey) end)
        
        if isValid and result and result.valid then
            StatusText.Text = "Key Verified! Access Granted!"
            StatusText.TextColor3 = Color3.fromRGB(50, 205, 50)
            pcall(function() writefile(Configuration.SettingsFile, inputKey) end)
            return true
        else
            local errMsg = (result and result.message) or "Invalid key"
            if errMsg == "KEY_EXPIRED" then
                StatusText.Text = "Key expired! Get a new one."
            elseif errMsg == "HWID_BANNED" then
                StatusText.Text = "Hardware banned."
                pcall(function() game.Players.LocalPlayer:Kick("Hardware banned from Nebublox.") end)
            elseif errMsg == "SERVICE_MISMATCH" then
                StatusText.Text = "Key is for a different service."
            elseif errMsg == "HWID_MISMATCH" then
                StatusText.Text = "HWID limit reached for this key."
            else
                StatusText.Text = "Invalid Key: " .. tostring(errMsg)
            end
            StatusText.TextColor3 = Color3.fromRGB(255, 68, 68)
            return false
        end
    end

    task.spawn(function()
        if isfile and isfile(Configuration.SettingsFile) then
            local savedKey = readfile(Configuration.SettingsFile)
            if savedKey and savedKey ~= "" and Junkie then
                StatusText.Text = "Auto-Verifying Saved Key..."
                if verifyKey(savedKey) then
                    task.wait(0.5)
                    TweenService:Create(Background, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
                    task.wait(1.2)
                    NebuUI:Destroy()
                    InitializeApp()
                end
            end
        end
    end)
end

GetKeyBtn.MouseButton1Click:Connect(function()
    if Junkie then
        local link = Junkie.get_key_link()
        if link then
            setclipboard(link)
            StatusText.Text = "Key link copied to clipboard!"
            StatusText.TextColor3 = Color3.fromRGB(0, 255, 204)
        else
            StatusText.Text = "Please wait before generating a new link."
            StatusText.TextColor3 = Color3.fromRGB(255, 68, 68)
        end
    end
end)

VerifyBtn.MouseButton1Click:Connect(function()
    local inputKey = KeyBox.Text:gsub("%s+", "")
    if verifyKey(inputKey) then
        task.wait(1)
        TweenService:Create(Background, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
        task.wait(1.2)
        NebuUI:Destroy()
        InitializeApp()
    end
end)

function InitializeApp()
    local g = getgenv and getgenv() or shared
    if g.NebuState_AnimeDestroyers then pcall(function() g.NebuState_AnimeDestroyers.Running = false end); task.wait(0.2) end
    g.NebuState_AnimeDestroyers = { Running = true, Connections = {} }
    local NebuState = g.NebuState_AnimeDestroyers
    local function IsValid() return NebuState.Running end

    local Flags = {
        SmartFarm = false, SelectedMob = {"All"}, AutoHatch = false, SelectedStar = nil, AutoClicker = false,
        AutoRollDragon = false, AutoRollSaiyan = false, AutoRollChakra = false, AutoRollHaki = false,
        AutoRollDevilFruit = false, AutoRollReiatsu = false, AutoRollBreathing = false,
        AutoBossRush1 = false, AutoBossRush2 = false, AutoProgressionRaid = false, AutoDemonDefense = false,
        SelectedCraft = "Black Nichirin", AutoBlacksmith = false
    }

    local function GetKnitService(serviceName)
        local Packages = ReplicatedStorage:FindFirstChild("Packages"); local KnitPkg = Packages and Packages:FindFirstChild("_Index")
        if KnitPkg then for _, folder in ipairs(KnitPkg:GetChildren()) do if folder.Name:find("knit") and folder:FindFirstChild("knit") then local Services = folder.knit:FindFirstChild("Services"); if Services and Services:FindFirstChild(serviceName) then return Services[serviceName] end end end end
        return nil
    end

    local function GetRealEnemyName(model)
        local hrp = model:FindFirstChild("HumanoidRootPart"); if hrp then local ov = hrp:FindFirstChild("EnemyOverhead"); if ov then local lbl = ov:FindFirstChild("Enemy"); if lbl and (lbl:IsA("TextLabel") or lbl:IsA("TextButton")) then return lbl.Text:gsub("%s*%[.*%]", "") end end end
        local hum = model:FindFirstChild("Humanoid"); if hum then return hum.DisplayName:gsub("%s*%[.*%]", "") end
        return "Unknown"
    end

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
        Title = "NEBUBLOX",
        Subtitle = "Anime Destroyers 🌀",
        Size = UDim2.new(0.85, 0, 0.85, 0),
        Profile = true,
        CyberBackground = true,
        TitleGradient = true
    })

    -- Sidebar Stats
    task.spawn(function()
        while task.wait(5) do
            if not IsValid() then break end
            pcall(function() local ping = tonumber(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString():match("%d+")) or 0; Window._ping.Text = "Stable â€¢ " .. ping .. "ms" end)
        end
    end)

    -- ═══════════════════════════════════════
    --  TAB 1: HOME
    -- ═══════════════════════════════════════
    local HomeTab = Window:MakeTab({Name = "Home", Icon = "ðŸ "})
    local DashSec = HomeTab:MakeSection({Name = "The Core"})
    local welcomeRow = DashSec:AddRow({Columns = 1})
    welcomeRow[1]:AddParagraph({Title = "<font size='36'>WELCOME TO NEBUBLOX</font>", Content = "<font size='22'>Good Afternoon, " .. player.DisplayName .. "!</font>", Center = true})
    
    local InfoSec = HomeTab:MakeSection({Name = "Information"})
    local InfoTabs = InfoSec:AddSubTabs({Tabs = {"API Logs", "OVERLORD"}})
    
    InfoTabs[1]:AddParagraph({
        Title = "STATUS UPDATE", 
        Content = "• Nebublox UI Framework v3.0\n• Masterpiece Feature Injection\n• Big Bang Intro Native\n• Free Access Mode Enabled"
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
    --  TAB 2: FARMING
    -- ═══════════════════════════════════════
    local FarmTab = Window:MakeTab({Name = "Farming", Icon = "âš”ï¸"})
    local SmartFarmSec = FarmTab:MakeSection({Name = "Smart Farm"})
    SmartFarmSec:AddToggle({Name = "Auto Farm", Default = false, Callback = function(v) Flags.SmartFarm = v end})
    local MobDrop = SmartFarmSec:AddMultiDropdown({Name = "Target Mobs", Options = {"All"}, Callback = function(v) Flags.SelectedMob = v end})
    SmartFarmSec:AddButton({Name = "Scan Mobs", Callback = function()
        local found = {"All"}; local unique = {["All"] = true}
        for _, f in ipairs({Workspace:FindFirstChild("Mobs"), Workspace:FindFirstChild("mobs")}) do if f then for _, v in ipairs(f:GetChildren()) do local n = GetRealEnemyName(v); if n ~= "Unknown" and not unique[n] then unique[n] = true; table.insert(found, n) end end end end
        MobDrop:Refresh(found, true)
    end})
    
    local AutoSec = FarmTab:MakeSection({Name = "Automations"})
    AutoSec:AddToggle({Name = "Auto Clicker", Default = false, Callback = function(s) Flags.AutoClicker = s end})

    -- ══════════════════_═════════════_══════════
    --  TAB 3: STARS & GACHA
    -- ══════════════════_═══_════════════════════
    local LuckTab = Window:MakeTab({Name = "Luck", Icon = "🍀"})
    local HatchSec = LuckTab:MakeSection({Name = "Stars"})
    HatchSec:AddDropdown({Name = "Select Star", Options = {"Dragon Star", "Ninja Star", "Pirate Star"}, Callback = function(v) Flags.SelectedStar = v end})
    HatchSec:AddToggle({Name = "Auto Hatch", Default = false, Callback = function(s) Flags.AutoHatch = s end})

    local MachineSec = LuckTab:MakeSection({Name = "Gacha Machines"})
    local machines = {"Dragon", "Saiyan", "Chakra", "Haki", "DevilFruit", "Reiatsu", "Breathing"}
    for _, name in ipairs(machines) do MachineSec:AddToggle({Name = "Roll " .. name, Default = false, Callback = function(s) Flags["AutoRoll"..name] = s end}) end

    -- ══════════════════_═════════_══════════════
    --  TAB 4: GAMEMODES
    -- ════════════════_═══════_═════════════_════
    local ModesTab = Window:MakeTab({Name = "Gamemodes", Icon = "🏆"})
    local PlaySec = ModesTab:MakeSection({Name = "Raids & Events"})
    PlaySec:AddToggle({Name = "Boss Rush I", Default = false, Callback = function(s) Flags.AutoBossRush1 = s end})
    PlaySec:AddToggle({Name = "Boss Rush II", Default = false, Callback = function(s) Flags.AutoBossRush2 = s end})
    PlaySec:AddToggle({Name = "Progression Raid", Default = false, Callback = function(s) Flags.AutoProgressionRaid = s end})
    PlaySec:AddToggle({Name = "Demon Defense", Default = false, Callback = function(s) Flags.AutoDemonDefense = s end})

    -- ══════════════════_═══════_═══════════_════
    --  TAB 5: SETTINGS
    -- ═════════_══════════════_═════════════════
    local SettTab = Window:MakeTab({Name = "Settings", Icon = "⚙️"})
    local SysSec = SettTab:MakeSection({Name = "Utility Hacks"})
    
    SysSec:AddToggle({Name = "Anti-AFK", Default = false, Callback = function(s)
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

    SysSec:AddToggle({Name = "Noclip", Default = false, Callback = function(s) 
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

    SysSec:AddButton({Name = "FPS Boost", Icon = "zap", Callback = function()
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

    SysSec:AddButton({Name = "Unlock FPS", Icon = "zap", Callback = function()
        if setfpscap then
            setfpscap(999); Window:Notify({Title="FPS", Content="FPS Cap removed!", Type="success"})
        else
            Window:Notify({Title="Error", Content="Executor does not support setfpscap", Type="error"})
        end
    end})

    SysSec:AddButton({Name = "Destroy Script", Icon = "power", Danger = true, Callback = function()
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
            pcall(function() writefile(ConfigsFolder.."/"..ConfName..".json", game:GetService("HttpService"):JSONEncode(Flags or {})) end)
            Window:Notify({Title="Config",Content="Saved: "..ConfName,Type="success"}) 
        end 
    end})
    confRow2[2]:AddButton({Name = "Load", Center = true, Callback = function() 
        if ConfName ~= "" and ConfName ~= "None" then 
            pcall(function() local p = ConfigsFolder.."/"..ConfName..".json"; if isfile(p) then for k,v in pairs(game:GetService("HttpService"):JSONDecode(readfile(p))) do Flags[k] = v end end end)
            Window:Notify({Title="Config",Content="Loaded: "..ConfName,Type="success"}) 
        end 
    end})
    confRow2[3]:AddButton({Name = "Delete", Danger = true, Center = true, Callback = function() 
        if ConfName ~= "" and ConfName ~= "None" then 
            pcall(function() delfile(ConfigsFolder.."/"..ConfName..".json") end)
            Window:Notify({Title="Config",Content="Deleted: "..ConfName,Type="error"}) 
        end 
    end})

    -- ═══════════════════════════════════════
    --  LOGIC LOOPS
    -- ═══════════════════════════════════════
    task.spawn(function()
        while task.wait(0.5) do
            if not IsValid() then break end
            if Flags.SmartFarm then
                local target; local dist = 9e9; local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                if root then
                    for _, f in ipairs({Workspace:FindFirstChild("Mobs"), Workspace:FindFirstChild("mobs")}) do
                        if f then for _, v in ipairs(f:GetChildren()) do
                            if v:IsA("Model") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") then
                                local n = GetRealEnemyName(v)
                                if table.find(Flags.SelectedMob, "All") or table.find(Flags.SelectedMob, n) then
                                    local d = (v.HumanoidRootPart.Position - root.Position).Magnitude
                                    if d < dist then dist = d; target = v end
                                end
                            end
                        end end
                    end
                end
                if target then
                    root.AssemblyLinearVelocity = Vector3.zero
                    root.CFrame = CFrame.lookAt(target.HumanoidRootPart.Position + target.HumanoidRootPart.CFrame.LookVector * 2, target.HumanoidRootPart.Position)
                    local tool = player.Character:FindFirstChildWhichIsA("Tool"); if tool then tool:Activate() end
                end
            end
            local machineMap = {Dragon="Dragon", Saiyan="Saiyan", Chakra="Chakra", Haki="Haki", DevilFruit="Devil Fruit", Reiatsu="Reiatsu", Breathing="Breathing"}
            for flag, name in pairs(machineMap) do if Flags["AutoRoll"..flag] then pcall(function() local s = GetKnitService("RerollableService"); if s then s.RF.Reroll:InvokeServer(name) end end) end end
        end
    end)

    task.spawn(function()
        while task.wait(0.1) do
            if not IsValid() then break end
            if Flags.AutoHatch and Flags.SelectedStar then pcall(function() local s = GetKnitService("StarService"); if s then s.RF.OpenStar:InvokeServer(Flags.SelectedStar, 4) end end) end
            if Flags.AutoClicker then pcall(function() local s = GetKnitService("ClickService"); if s then s.RF.Click:InvokeServer() end end) end
        end
    end)

    Window:Notify({Title = "Nebublox", Content = "Anime Destroyers Ready!", Type = "success"})
    
    -- Aesthetics Engine (DYNAMIC SYNC)
    task.spawn(function()
        task.wait(2)
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
                    if text == "NEBUBLOX" or text == "Home" or text == "Farming" or text == "Luck" or text == "Gamemodes" or text == "Settings" then 
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
    if isfile(Configuration.SettingsFile) then
        local savedKey = readfile(Configuration.SettingsFile):gsub("%s+", "")
        if savedKey ~= "" then
            task.spawn(function()
                repeat task.wait(0.1) until Junkie
                local s, result = pcall(function() return Junkie.check_key(savedKey) end)
                if s and result and result.valid then
                    StatusText.Text = "Saved key valid! Launching..."; StatusText.TextColor3 = Color3.fromRGB(50, 205, 50)
                    task.wait(1.5); TweenService:Create(Background, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
                    task.wait(1.2); NebuUI:Destroy(); InitializeApp()
                else
                    playBigBang()
                end
            end)
            return true
        end
    end
    return false
end

if not trySavedKey() then playBigBang() end
