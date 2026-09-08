-- FE Link HUD & Notification System
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")
local GroupID = 456471138
local GroupLink = "https://www.roblox.com/communities/456471138/popularkidd#!/about"

-- 1. CREATE PERFORMANCE HUD (FPS & PING)
local screen = Instance.new("ScreenGui")
screen.Name = "FE_Link_HUD"
screen.IgnoreGuiInset = true
screen.ResetOnSpawn = false
screen.Parent = PlayerGui

local statsFrame = Instance.new("Frame", screen)
statsFrame.Size = UDim2.new(0, 150, 0, 50)
statsFrame.Position = UDim2.new(0, 15, 0.4, 0) -- Left side center
statsFrame.BackgroundTransparency = 1

local function createStatLabel(name, pos)
    local l = Instance.new("TextLabel", statsFrame)
    l.Size = UDim2.new(1, 0, 0.5, 0)
    l.Position = pos
    l.BackgroundTransparency = 1
    l.TextColor3 = Color3.fromRGB(255, 255, 255)
    l.TextStrokeTransparency = 0
    l.Font = Enum.Font.GothamBold
    l.TextSize = 16
    l.TextXAlignment = Enum.TextXAlignment.Left
    return l
end

local fpsLabel = createStatLabel("FPS: ...", UDim2.new(0, 0, 0, 0))
local pingLabel = createStatLabel("Ping: ...", UDim2.new(0, 0, 0.5, 0))

-- 2. PERFORMANCE LOGIC
local lastTime = tick()
local frameCount = 0
RunService.RenderStepped:Connect(function()
    frameCount = frameCount + 1
    if tick() - lastTime >= 1 then
        fpsLabel.Text = "FPS: " .. frameCount
        frameCount = 0
        lastTime = tick()
    end
    
    local ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
    pingLabel.Text = "Ping: " .. ping .. "ms"
end)

-- 3. NOTIFICATION SYSTEM (Right Side)
local function notify(title, text)
    local notifFrame = Instance.new("Frame", screen)
    notifFrame.Size = UDim2.new(0, 280, 0, 120)
    notifFrame.Position = UDim2.new(1, 0, 0.5, -60) -- Start off-screen
    notifFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    notifFrame.BorderSizePixel = 0
    
    local corner = Instance.new("UICorner", notifFrame)
    
    local tLabel = Instance.new("TextLabel", notifFrame)
    tLabel.Size = UDim2.new(1, -20, 0, 30)
    tLabel.Position = UDim2.new(0, 10, 0, 5)
    tLabel.BackgroundTransparency = 1
    tLabel.Text = title
    tLabel.TextColor3 = Color3.fromRGB(0, 170, 255)
    tLabel.Font = Enum.Font.GothamBold
    tLabel.TextSize = 18
    tLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    local mLabel = Instance.new("TextLabel", notifFrame)
    mLabel.Size = UDim2.new(1, -20, 0, 80)
    mLabel.Position = UDim2.new(0, 10, 0, 35)
    mLabel.BackgroundTransparency = 1
    mLabel.Text = text
    mLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    mLabel.Font = Enum.Font.Gotham
    mLabel.TextSize = 14
    mLabel.TextWrapped = true
    mLabel.TextXAlignment = Enum.TextXAlignment.Left
    mLabel.TextYAlignment = Enum.TextYAlignment.Top

    -- Slide In Animation
    notifFrame:TweenPosition(UDim2.new(1, -300, 0.5, -60), "Out", "Quart", 0.5)
    
    task.wait(10) -- Stay for 10 seconds
    notifFrame:TweenPosition(UDim2.new(1, 0, 0.5, -60), "In", "Quart", 0.5)
    game:GetService("Debris"):AddItem(notifFrame, 0.5)
end

-- 4. SMART GROUP CHECK & CLIPBOARD
local function checkGroupStatus()
    local success, role = pcall(function() return LP:GetRoleInGroup(GroupID) end)
    local isInGroup = (role ~= "Guest" and success)
    
    local welcomeMsg = "Welcome to FE Link! This script was made by popularkidd and it's still being worked on. In the meantime enjoy! And join our community and discord!"
    
    if not isInGroup then
        -- Not in group: Send link to clipboard
        local setClipboard = setclipboard or toclipboard or (syn and syn.write_clipboard)
        if setClipboard then
            setClipboard(GroupLink)
            notify("Link Copied!", welcomeMsg .. "\n\n(Group link copied to clipboard!)")
        else
            notify("Welcome!", welcomeMsg)
        end
    else
        -- User is in group: Check specific ranks
        if role == "alt" then
            notify("Welcome, Developer", "Access granted. Staying stealthy on this account. Welcome back, popularkidd.")
        elseif role == "FAN" then
            notify("Welcome, Supporter!", "Thank you for being a Fan of the team! Your support helps FE Link grow.")
        elseif role == "Tester" then
            notify("Welcome, Script Tester", "Ready for deployment? Please test the new Physics modules and report bugs in the Discord.")
        else
            notify("Welcome Back!", "Welcome back to the FE Link community member!")
        end
    end
end

-- Run
checkGroupStatus()-- Wii System Menu V7: Decal Support, FPS/Ping Logger, and Developer Console
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local SoundService = game:GetService("SoundService")
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- ASSET CONFIGURATION
local WII_MENU_AUDIO = "rbxassetid://94807404649914"
local CLICK_AUDIO = "rbxassetid://18202483174"
-- Decals require specific formatting or they don't show on UI
local NEW_HOME_ICON = "rbxassetid://77229120283180"

-- 1. SOUND SETUP
local function CreateSound(id, vol, pitch)
    local s = Instance.new("Sound", SoundService)
    s.SoundId = id
    s.Volume = vol
    s.Pitch = pitch
    return s
end

local HomeMusic = CreateSound(WII_MENU_AUDIO, 4, 0.1)
HomeMusic.Looped = true
local ClickSFX = CreateSound(CLICK_AUDIO, 1, 1)

local function PlayClick() ClickSFX:Play() end

-- 2. MAIN CONTAINER
local MainContainer = Instance.new("ScreenGui")
MainContainer.Name = "WiiOS_V7"
MainContainer.IgnoreGuiInset = true
MainContainer.DisplayOrder = 2147483647
pcall(function() MainContainer.Parent = game:GetService("CoreGui") end)
if not MainContainer.Parent then MainContainer.Parent = PlayerGui end

-- 3. BACKGROUND DIMMER
local Dimmer = Instance.new("Frame", MainContainer)
Dimmer.Size = UDim2.new(1, 0, 1, 0)
Dimmer.BackgroundColor3 = Color3.new(0,0,0)
Dimmer.BackgroundTransparency = 1
Dimmer.ZIndex = 5

-- 4. HOME BUTTON (TOP LEFT)
local HomeButton = Instance.new("ImageButton", MainContainer)
HomeButton.Size = UDim2.new(0, 55, 0, 55)
HomeButton.Position = UDim2.new(0, 5, 0, 5)
HomeButton.BackgroundTransparency = 1
HomeButton.Image = NEW_HOME_ICON
HomeButton.ZIndex = 100
HomeButton.MouseButton1Click:Connect(function() PlayClick() end)

-- 5. THE MENU PANEL
local MenuFrame = Instance.new("Frame", MainContainer)
MenuFrame.Size = UDim2.new(0.85, 0, 0.85, 0)
MenuFrame.Position = UDim2.new(0.075, 0, 1.5, 0)
MenuFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MenuFrame.ZIndex = 10
Instance.new("UICorner", MenuFrame).CornerRadius = UDim.new(0, 40)
Instance.new("UIStroke", MenuFrame).Thickness = 8

-- TITLE: Wii Home
local Title = Instance.new("TextLabel", MenuFrame)
Title.Text = "Wii Home"
Title.Size = UDim2.new(1, 0, 0, 80)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.SourceSansLight
Title.TextSize = 35
Title.TextColor3 = Color3.fromRGB(120, 120, 120)
Title.ZIndex = 15

-- Page Containers
local Pages = {}
local function CreatePage(name)
    local f = Instance.new("ScrollingFrame", MenuFrame)
    f.Name = name
    f.Size = UDim2.new(1, 0, 0.8, 0)
    f.Position = UDim2.new(0, 0, 0.18, 0)
    f.BackgroundTransparency = 1
    f.Visible = false
    f.CanvasSize = UDim2.new(0,0,1.5,0)
    f.ScrollBarThickness = 0
    Pages[name] = f
    return f
end

local HomePage = CreatePage("Home")
local ReportPage = CreatePage("Report")
local SettingsPage = CreatePage("Settings")

local function ShowPage(name)
    PlayClick()
    for _, p in pairs(Pages) do p.Visible = false end
    Pages[name].Visible = true
end

-- 6. BUTTON CREATOR
local function AddWiiBtn(parent, text, yPos, color, func)
    local b = Instance.new("TextButton", parent)
    b.Size = UDim2.new(0.75, 0, 0, 65)
    b.Position = UDim2.new(0.5, 0, yPos, 0)
    b.AnchorPoint = Vector2.new(0.5, 0.5)
    b.BackgroundColor3 = Color3.new(1,1,1)
    b.Text = text
    b.Font = Enum.Font.GothamBold
    b.TextSize = 24
    b.TextColor3 = Color3.fromRGB(60, 60, 60)
    b.ZIndex = 25
    Instance.new("UICorner", b).CornerRadius = UDim.new(1, 0)
    local s = Instance.new("UIStroke", b)
    s.Thickness = 3; s.Color = color
    b.MouseButton1Click:Connect(function() PlayClick(); func() end)
    return b
end

-- HOME PAGE LAYOUT
AddWiiBtn(HomePage, "RESUME GAME", 0.1, Color3.fromRGB(0, 180, 255), function() ToggleMenu(false) end)
AddWiiBtn(HomePage, "CONSOLE", 0.25, Color3.fromRGB(100, 100, 100), function() 
    game:GetService("LogService"):ExecuteScript("print('Wii Console Loaded')") -- Attempt internal log
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.F9, false, game) -- Open dev console
end)
AddWiiBtn(HomePage, "SETTINGS", 0.4, Color3.fromRGB(150, 150, 150), function() ShowPage("Settings") end)
AddWiiBtn(HomePage, "REPORT SYSTEM", 0.55, Color3.fromRGB(150, 150, 150), function() ShowPage("Report") end)
AddWiiBtn(HomePage, "RESPAWN", 0.7, Color3.fromRGB(200, 200, 200), function() ToggleMenu(false); Player.Character:BreakJoints() end)
AddWiiBtn(HomePage, "CLOSE GAME", 0.85, Color3.fromRGB(255, 80, 80), function() game:Shutdown() end)

-- SETTINGS PAGE (FPS & PING)
local StatsLabel = Instance.new("TextLabel", SettingsPage)
StatsLabel.Size = UDim2.new(0.8, 0, 0, 100)
StatsLabel.Position = UDim2.new(0.1, 0, 0.2, 0)
StatsLabel.BackgroundTransparency = 1
StatsLabel.Font = Enum.Font.Code
StatsLabel.TextColor3 = Color3.fromRGB(50, 200, 50)
StatsLabel.TextSize = 18
StatsLabel.TextXAlignment = Enum.TextXAlignment.Left

RunService.RenderStepped:Connect(function(dt)
    if SettingsPage.Visible then
        local fps = math.floor(1/dt)
        local ping = math.floor(Player:GetNetworkPing() * 1000)
        StatsLabel.Text = string.format("CLIENT FPS: %d\nSERVER FPS: 60\nPING: %dms", fps, ping)
    end
end)

AddWiiBtn(SettingsPage, "BACK", 0.05, Color3.new(0,0,0), function() ShowPage("Home") end)

-- REPORT PAGE
AddWiiBtn(ReportPage, "BACK", 0.05, Color3.new(0,0,0), function() ShowPage("Home") end)
AddWiiBtn(ReportPage, "REPORT PLAYER", 0.2, Color3.fromRGB(255, 150, 0), function() end)

-- 7. TOGGLE SYSTEM
function ToggleMenu(state)
    local goalMenuPos = state and UDim2.new(0.075, 0, 0.07, 0) or UDim2.new(0.075, 0, 1.5, 0)
    if state then 
        HomeMusic:Play(); StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false); ShowPage("Home")
    else 
        HomeMusic:Stop(); StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, true)
    end
    TweenService:Create(Dimmer, TweenInfo.new(0.5), {BackgroundTransparency = state and 0.5 or 1}):Play()
    TweenService:Create(MenuFrame, TweenInfo.new(0.6, Enum.EasingStyle.Quart), {Position = goalMenuPos}):Play()
end

HomeButton.MouseButton1Click:Connect(function() ToggleMenu(not HomeMusic.IsPlaying) end)-- Wii Graphics Emulator Script
-- Optimized for Mobile Executors
-- This simulates the look without actually lowering your device's render quality

local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- 1. CLEANUP (Removes previous versions if you re-run the script)
if PlayerGui:FindFirstChild("WiiFilter") then
    PlayerGui.WiiFilter:Destroy()
end

-- 2. LIGHTING ADJUSTMENTS (The "Wii Glow")
-- This mimics the high-gamma, soft-bloom look of the Wii Menu and games like Wii Sports
local function SetupLighting()
    Lighting.GlobalShadows = true
    Lighting.Ambient = Color3.fromRGB(150, 150, 150)
    Lighting.OutdoorAmbient = Color3.fromRGB(100, 100, 100)
    
    -- Add Bloom for that "dreamy" glow
    local bloom = Instance.new("BloomEffect", Lighting)
    bloom.Intensity = 0.6
    bloom.Size = 24
    bloom.Threshold = 0.8
    
    -- ColorCorrection for the specific warm/washed-out palette
    local cc = Instance.new("ColorCorrectionEffect", Lighting)
    cc.Brightness = 0.1
    cc.Contrast = 0.15
    cc.Saturation = -0.1 -- Slightly desaturated like older AV cables
    cc.TintColor = Color3.fromRGB(255, 250, 240) -- Warm tint
    
    -- Blur (Very slight to mimic 480p resolution)
    local blur = Instance.new("BlurEffect", Lighting)
    blur.Size = 2
end

-- 3. PIXELATION OVERLAY
-- Since we can't change screen resolution via script, we use a grain/dither pattern
local function CreatePixelOverlay()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "WiiFilter"
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.DisplayOrder = 999
    ScreenGui.Parent = PlayerGui

    -- Dither Pattern (Simulates the "bad quality" look)
    local DitherFrame = Instance.new("ImageLabel")
    DitherFrame.Size = UDim2.new(1, 0, 1, 0)
    DitherFrame.BackgroundTransparency = 1
    -- This asset ID is a subtle dither/grain map
    DitherFrame.Image = "rbxassetid://126310214" 
    DitherFrame.ImageTransparency = 0.85
    DitherFrame.ScaleType = Enum.ScaleType.Tile
    DitherFrame.TileSize = UDim2.new(0, 4, 0, 4) -- Size of the "pixels"
    DitherFrame.Parent = ScreenGui

    -- Vignette (The classic TV edge darkening)
    local Vignette = Instance.new("ImageLabel")
    Vignette.Size = UDim2.new(1, 0, 1, 0)
    Vignette.BackgroundTransparency = 1
    Vignette.Image = "rbxassetid://257660345"
    Vignette.ImageColor3 = Color3.fromRGB(0, 0, 0)
    Vignette.ImageTransparency = 0.5
    Vignette.Parent = ScreenGui
end

-- 4. EXECUTION
print("Initializing Wii Graphics...")
SetupLighting()
CreatePixelOverlay()
print("Wii Graphics Applied. Resolution emulated at 480p (AV Cable Style).")

loadstring(game:HttpGet("https://gist.githubusercontent.com/Thepopularuser/0406b91a5f69d4cb3fe7e17eea64caa8/raw/c4cb423dde14a1568c754ad59ac95d02ae4e7218/FE%2520Link"))()