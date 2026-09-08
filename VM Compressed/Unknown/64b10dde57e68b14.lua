-- ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ
-- â           NUKE AUTO UPGRADE  â  Wind UI  â¢  LocalScript            â
-- ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ

local cloneref = (cloneref or clonereference or function(i) return i end)

-- ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ
-- â  Wind UI Ð·Ð°Ð³ÑÑÐ·ÐºÐ°                                                    â
-- ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ
local WindUI
do
    local ok, result = pcall(function()
        return require("./src/Init")
    end)
    if ok then
        WindUI = result
    else
        if cloneref(game:GetService("RunService")):IsStudio() then
            WindUI = require(cloneref(
                game:GetService("ReplicatedStorage")
                    :WaitForChild("WindUI")
                    :WaitForChild("Init")
            ))
        else
            WindUI = loadstring(game:HttpGet(
                "https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"
            ))()
        end
    end
end

-- ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ
-- â  REMOTE                                                              â
-- ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ
local PurchaseUpgrade = game:GetService("ReplicatedStorage")
    :WaitForChild("NukeRemotes")
    :WaitForChild("PurchaseUpgrade")

local RequestLockBase = game:GetService("ReplicatedStorage")
    :WaitForChild("NukeRemotes")
    :WaitForChild("RequestLockBase")

-- ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ
-- â  Ð¡ÐÐ¡Ð¢ÐÐ¯ÐÐÐ                                                           â
-- ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ
local State = {
    running    = false,
    thread     = nil,
    interval   = 100,
    doLockbase        = true,
    doTier            = true,
    doMax             = true,
    doRequestLockBase = true,
    totalFires        = 0,
}

-- ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ
-- â  ÐÐÐÐÐÐ ÐÐÐÐ ÐÐÐÐÐ                                                    â
-- ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ
local function fireUpgrades()
    if State.doLockbase then
        PurchaseUpgrade:FireServer("LOCKBASE")
        State.totalFires += 1
    end
    if State.doTier then
        PurchaseUpgrade:FireServer("TIER")
        State.totalFires += 1
    end
    if State.doMax then
        PurchaseUpgrade:FireServer("MAX")
        State.totalFires += 1
    end
    if State.doRequestLockBase then
        RequestLockBase:FireServer()
        State.totalFires += 1
    end
end

local statusLabel  -- Ð·Ð°Ð¿Ð¾Ð»Ð½Ð¸ÑÑÑ Ð¿Ð¾ÑÐ»Ðµ ÑÐ¾Ð·Ð´Ð°Ð½Ð¸Ñ UI

local function runLoop()
    while State.running do
        fireUpgrades()
        if statusLabel then
            statusLabel:SetDesc("ÐÑÐµÐ³Ð¾ Ð¾ÑÐ¿ÑÐ°Ð²Ð»ÐµÐ½Ð¾: " .. State.totalFires)
        end
        task.wait(State.interval / 1000)
    end
end

local function startLoop()
    if State.running then return end
    if not (State.doLockbase or State.doTier or State.doMax or State.doRequestLockBase) then
        WindUI:Notify({
            Title   = "ÐÐ¸ÑÐµÐ³Ð¾ Ð½Ðµ Ð²ÑÐ±ÑÐ°Ð½Ð¾",
            Content = "ÐÑÐ±ÐµÑÐ¸ ÑÐ¾ÑÑ Ð±Ñ Ð¾Ð´Ð¸Ð½ Ð°Ð¿Ð³ÑÐµÐ¹Ð´.",
            Icon    = "triangle-alert",
            Duration = 3,
        })
        return
    end
    State.running = true
    State.thread  = task.spawn(runLoop)
end

local function stopLoop()
    State.running = false
    if State.thread then
        task.cancel(State.thread)
        State.thread = nil
    end
end

-- ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ
-- â  Ð¡ÐÐ Ð«Ð¢ÐÐ NotifFrame                                                  â
-- ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ
local function hideNotifFrames()
    local playerGui = game:GetService("Players").LocalPlayer
        :WaitForChild("PlayerGui")

    -- Ð¡ÐºÑÑÑÑ ÑÐ¶Ðµ ÑÑÑÐµÑÑÐ²ÑÑÑÐ¸Ðµ
    for _, obj in ipairs(playerGui:GetDescendants()) do
        if obj:IsA("Frame") and obj.Name:lower():find("notif") then
            obj.Visible = false
        end
    end

    -- Ð¡ÐºÑÑÐ²Ð°ÑÑ Ð½Ð¾Ð²ÑÐµ Ð¿ÑÐ¸ Ð¿Ð¾ÑÐ²Ð»ÐµÐ½Ð¸Ð¸
    playerGui.DescendantAdded:Connect(function(obj)
        if obj:IsA("Frame") and obj.Name:lower():find("notif") then
            task.defer(function()
                obj.Visible = false
            end)
        end
    end)
end

task.spawn(hideNotifFrames)

-- ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ
-- â  ÐÐÐÐ                                                                â
-- ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ
local Window = WindUI:CreateWindow({
    Title  = "Nuke Auto Upgrade",
    Author = "AutoScript",
    Folder = "NukeAutoUpgrade",
    Icon   = "zap",
    NewElements = true,
    OpenButton = {
        Title        = "Nuke Upgrade",
        CornerRadius = UDim.new(1, 0),
        StrokeThickness = 2,
        Enabled      = true,
        Draggable    = true,
        OnlyMobile   = false,
        Scale        = 0.5,
        Color        = ColorSequence.new(
            Color3.fromHex("#a855f7"),
            Color3.fromHex("#6366f1")
        ),
    },
    Topbar = {
        Height      = 44,
        ButtonsType = "Mac",
    },
})

-- ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ
-- â  ÐÐÐÐÐÐÐ                                                             â
-- ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ
local MainTab = Window:Tab({
    Title = "Main",
    Icon  = "zap",
})

local SettTab = Window:Tab({
    Title = "Settings",
    Icon  = "settings",
})

-- ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ
--  MAIN TAB
-- ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ

-- ââ Ð¡ÐµÐºÑÐ¸Ñ: Ð²ÑÐ±Ð¾Ñ Ð°Ð¿Ð³ÑÐµÐ¹Ð´Ð¾Ð² ââââââââââââââââââââââââââââââ
local TargetsSection = MainTab:Section({
    Title  = "Upgrade Targets",
    Opened = true,
})

TargetsSection:Toggle({
    Title   = "LOCKBASE",
    Desc    = "FireServer(\"LOCKBASE\") ÐºÐ°Ð¶Ð´ÑÐ¹ ÑÐ¸Ðº",
    Value   = true,
    Callback = function(v)
        State.doLockbase = v
    end,
})

TargetsSection:Space()

TargetsSection:Toggle({
    Title   = "TIER",
    Desc    = "FireServer(\"TIER\") ÐºÐ°Ð¶Ð´ÑÐ¹ ÑÐ¸Ðº",
    Value   = true,
    Callback = function(v)
        State.doTier = v
    end,
})

TargetsSection:Space()

TargetsSection:Toggle({
    Title   = "MAX",
    Desc    = "FireServer(\"MAX\") ÐºÐ°Ð¶Ð´ÑÐ¹ ÑÐ¸Ðº",
    Value   = true,
    Callback = function(v)
        State.doMax = v
    end,
})

TargetsSection:Space()

TargetsSection:Toggle({
    Title   = "RequestLockBase",
    Desc    = "NukeRemotes.RequestLockBase:FireServer()",
    Value   = true,
    Callback = function(v)
        State.doRequestLockBase = v
    end,
})

MainTab:Space()

-- ââ Ð¡ÐµÐºÑÐ¸Ñ: ÑÐ¿ÑÐ°Ð²Ð»ÐµÐ½Ð¸Ðµ âââââââââââââââââââââââââââââââââââ
local ControlSection = MainTab:Section({
    Title  = "Control",
    Opened = true,
})

-- ÐÐ½Ð¾Ð¿ÐºÐ° Start/Stop (Ð¼ÐµÐ½ÑÐµÑ ÑÐµÐºÑÑ ÑÐ°Ð¼Ð° ÑÐµÐ±Ñ)
local startStopBtn
startStopBtn = ControlSection:Button({
    Title    = "â¶  Start Auto Upgrade",
    Desc     = "ÐÐ°Ð¿ÑÑÑÐ¸ÑÑ ÑÐ¸ÐºÐ» Ð°Ð¿Ð³ÑÐµÐ¹Ð´Ð¾Ð²",
    Color    = Color3.fromHex("#a855f7"),
    Icon     = "play",
    Justify  = "Left",
    Callback = function()
        if State.running then
            stopLoop()
            startStopBtn:SetTitle("â¶  Start Auto Upgrade")
            startStopBtn:SetDesc("ÐÐ°Ð¿ÑÑÑÐ¸ÑÑ ÑÐ¸ÐºÐ» Ð°Ð¿Ð³ÑÐµÐ¹Ð´Ð¾Ð²")
            startStopBtn:SetIcon("play")
            startStopBtn:SetColor(Color3.fromHex("#a855f7"))
            WindUI:Notify({
                Title    = "ÐÑÑÐ°Ð½Ð¾Ð²Ð»ÐµÐ½Ð¾",
                Content  = "Ð¦Ð¸ÐºÐ» Ð°Ð¿Ð³ÑÐµÐ¹Ð´Ð¾Ð² Ð¾ÑÑÐ°Ð½Ð¾Ð²Ð»ÐµÐ½.",
                Icon     = "square",
                Duration = 2,
            })
        else
            startLoop()
            if State.running then
                startStopBtn:SetTitle("â¹  Stop Auto Upgrade")
                startStopBtn:SetDesc("ÐÐ°Ð¶Ð¼Ð¸ ÑÑÐ¾Ð±Ñ Ð¾ÑÑÐ°Ð½Ð¾Ð²Ð¸ÑÑ")
                startStopBtn:SetIcon("square")
                startStopBtn:SetColor(Color3.fromHex("#ef4444"))
                WindUI:Notify({
                    Title    = "ÐÐ°Ð¿ÑÑÐµÐ½Ð¾",
                    Content  = "Ð¦Ð¸ÐºÐ» Ð°Ð¿Ð³ÑÐµÐ¹Ð´Ð¾Ð² Ð°ÐºÑÐ¸Ð²ÐµÐ½!",
                    Icon     = "zap",
                    Duration = 2,
                })
            end
        end
    end,
})

ControlSection:Space()

ControlSection:Button({
    Title    = "ÐÐ´Ð½Ð¾ÐºÑÐ°ÑÐ½ÑÐ¹ Ð·Ð°Ð¿ÑÑÐº",
    Desc     = "ÐÑÐ¿Ð¾Ð»Ð½Ð¸ÑÑ Ð²ÑÐ±ÑÐ°Ð½Ð½ÑÐµ Ð°Ð¿Ð³ÑÐµÐ¹Ð´Ñ Ð¾Ð´Ð¸Ð½ ÑÐ°Ð·",
    Icon     = "mouse-pointer-click",
    Callback = function()
        local before = State.totalFires
        fireUpgrades()
        local fired = State.totalFires - before
        WindUI:Notify({
            Title    = "ÐÑÐ¿Ð¾Ð»Ð½ÐµÐ½Ð¾",
            Content  = "ÐÑÐ¿ÑÐ°Ð²Ð»ÐµÐ½Ð¾ " .. fired .. " Ð·Ð°Ð¿ÑÐ¾Ñ(Ð¾Ð²).",
            Icon     = "check",
            Duration = 2,
        })
        if statusLabel then
            statusLabel:SetDesc("ÐÑÐµÐ³Ð¾ Ð¾ÑÐ¿ÑÐ°Ð²Ð»ÐµÐ½Ð¾: " .. State.totalFires)
        end
    end,
})

MainTab:Space()

-- ââ Ð¡ÐµÐºÑÐ¸Ñ: ÑÑÐ°ÑÑÑ ââââââââââââââââââââââââââââââââââââââââ
local StatusSection = MainTab:Section({
    Title  = "Status",
    Opened = true,
})

statusLabel = StatusSection:Section({
    Title    = "ÐÐ¶Ð¸Ð´Ð°Ð½Ð¸Ðµ Ð·Ð°Ð¿ÑÑÐºÐ°...",
    Desc     = "ÐÑÐµÐ³Ð¾ Ð¾ÑÐ¿ÑÐ°Ð²Ð»ÐµÐ½Ð¾: 0",
    TextSize = 14,
})

StatusSection:Space()

StatusSection:Section({
    Title    = "NotifFrame",
    Desc     = "Ð¡ÐºÑÑÐ²Ð°ÐµÑÑÑ Ð°Ð²ÑÐ¾Ð¼Ð°ÑÐ¸ÑÐµÑÐºÐ¸ â",
    TextSize = 14,
})

-- ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ
--  SETTINGS TAB
-- ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ

local IntervalSection = SettTab:Section({
    Title  = "Interval",
    Opened = true,
})

IntervalSection:Slider({
    Title = "Delay (Ð¼Ñ)",
    Desc  = "ÐÐ°Ð´ÐµÑÐ¶ÐºÐ° Ð¼ÐµÐ¶Ð´Ñ ÑÐ¸ÐºÐ°Ð¼Ð¸ ÑÐ¸ÐºÐ»Ð°",
    Step  = 50,
    Value = {
        Min     = 50,
        Max     = 2000,
        Default = 100,
    },
    Callback = function(v)
        State.interval = v
    end,
})

SettTab:Space()

local NotifSection = SettTab:Section({
    Title  = "Notifications",
    Opened = true,
})

NotifSection:Toggle({
    Title    = "Ð¡ÐºÑÑÐ²Ð°ÑÑ NotifFrame",
    Desc     = "ÐÐ²ÑÐ¾-ÑÐºÑÑÑÐ¸Ðµ ÑÐ²ÐµÐ´Ð¾Ð¼Ð»ÐµÐ½Ð¸Ð¹ Ð¸Ð³ÑÑ",
    Value    = true,
    Callback = function(v)
        if v then
            task.spawn(hideNotifFrames)
        end
    end,
})

NotifSection:Space()

NotifSection:Button({
    Title    = "Ð¡ÐºÑÑÑÑ NotifFrame ÑÐµÐ¹ÑÐ°Ñ",
    Desc     = "ÐÑÐ¸Ð½ÑÐ´Ð¸ÑÐµÐ»ÑÐ½Ð¾ ÑÐºÑÑÑÑ Ð²ÑÐµ ÑÑÐµÐ¹Ð¼Ñ",
    Icon     = "eye-off",
    Callback = function()
        local count = 0
        for _, obj in ipairs(game:GetService("Players").LocalPlayer
            :WaitForChild("PlayerGui"):GetDescendants()) do
            if obj:IsA("Frame") and obj.Name:lower():find("notif") then
                obj.Visible = false
                count += 1
            end
        end
        WindUI:Notify({
            Title    = "NotifFrame",
            Content  = "Ð¡ÐºÑÑÑÐ¾ ÑÑÐµÐ¹Ð¼Ð¾Ð²: " .. count,
            Icon     = "eye-off",
            Duration = 3,
        })
    end,
})

SettTab:Space()

local ResetSection = SettTab:Section({
    Title  = "Misc",
    Opened = true,
})

ResetSection:Button({
    Title    = "Ð¡Ð±ÑÐ¾ÑÐ¸ÑÑ ÑÑÑÑÑÐ¸Ðº",
    Icon     = "rotate-ccw",
    Callback = function()
        State.totalFires = 0
        if statusLabel then
            statusLabel:SetDesc("ÐÑÐµÐ³Ð¾ Ð¾ÑÐ¿ÑÐ°Ð²Ð»ÐµÐ½Ð¾: 0")
        end
        WindUI:Notify({
            Title    = "Ð¡Ð±ÑÐ¾ÑÐµÐ½Ð¾",
            Content  = "Ð¡ÑÑÑÑÐ¸Ðº Ð¾Ð±Ð½ÑÐ»ÑÐ½.",
            Icon     = "check",
            Duration = 2,
        })
    end,
})

-- ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ
-- â  Ð¡Ð¢ÐÐ Ð¢ Ð£ÐÐÐÐÐÐÐÐÐÐ                                                   â
-- ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ
WindUI:Notify({
    Title    = "Nuke Auto Upgrade",
    Content  = "Ð¡ÐºÑÐ¸Ð¿Ñ Ð·Ð°Ð³ÑÑÐ¶ÐµÐ½. ÐÑÐ±ÐµÑÐ¸ ÑÐµÐ»Ð¸ â Start.",
    Icon     = "zap",
    Duration = 4,
})
