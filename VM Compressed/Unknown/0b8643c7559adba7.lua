-- ChronosHUB Key System Library
-- Universal multi-game key system with per-game theming, providers, and executor detection

local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Library = {}

-- ─────────────────────────────────────────────────────────────────────────────
-- Executor Detection (cleaned — dead executors removed)
-- ─────────────────────────────────────────────────────────────────────────────
local function GetExecutor()
    local name = "Unknown"
    pcall(function()
        if identifyexecutor then
            name = identifyexecutor()
        elseif getexecutorname then
            name = getexecutorname()
        end
    end)
    return name
end

-- ─────────────────────────────────────────────────────────────────────────────
-- Defaults
-- ─────────────────────────────────────────────────────────────────────────────
local DEFAULTS = {
    Title          = "ChronosHUB",
    Subtitle       = "Secure Authentication",
    Welcome        = "Welcome!",
    ButtonText     = "VERIFY KEY",
    GetKeyText     = "GET KEY LINK",
    VersionText    = "©2025 | Junkie-Developments",
    SavePrefix     = "ChronosHUB",
    DiscordLink    = "https://discord.com/invite/fu9fH2trGT",

    -- Icon names (lucide by default; prefix with pack: for other packs)
    Icons   = {"key", "key-round", "lock", "star", "moon"},
    BGIcons = {"key", "shield", "lock", "fingerprint", "scan"},

    Debug          = false,
    BannedExecutors = {},

    -- Animation speed multiplier exposed to the loader (1 = default, 0.5 = twice as fast)
    AnimSpeed = 1,

    BanMessage = {
        Title        = "ACCESS DENIED",
        Subtitle     = "Incompatible Executor",
        Body         = "Your executor is not supported by this script.",
        Redirect     = "https://whatexpsare.online/",
        RedirectText = "Find a better executor",
        KickMessage  = "Your executor is not supported by ChronosHUB.",
    },

    Theme = {
        Primary    = Color3.fromHex("#FFD700"),
        Secondary  = Color3.fromHex("#C0A763"),
        Accent     = Color3.fromHex("#E3C56D"),
        GradStart  = Color3.fromHex("#0A0A0F"),
        GradMid    = Color3.fromHex("#120a20"),
        GradEnd    = Color3.fromHex("#1A0533"),
        GradAngle  = 135,
        Card       = Color3.fromHex("#0D0D12"),
        CardLight  = Color3.fromHex("#14141B"),
        InputBG    = Color3.fromHex("#0A0A0F"),
        ButtonSec  = Color3.fromHex("#1A1A24"),
        Text       = Color3.fromHex("#FFFFFF"),
        TextDim    = Color3.fromHex("#888888"),
        TextMuted  = Color3.fromHex("#666666"),
        Success    = Color3.fromHex("#4ADE80"),
        Error      = Color3.fromHex("#EF4444"),
        Warning    = Color3.fromHex("#FBBF24"),
        Premium    = Color3.fromHex("#FFD700"),
    },

    Particles = {
        StarMin    = 0.08,  StarMax    = 0.15,
        CrystalMin = 0.2,   CrystalMax = 0.4,
        BGCount    = 15,    BGRotSpeed = 0.8,
    },
}

-- ─────────────────────────────────────────────────────────────────────────────
-- Utilities
-- ─────────────────────────────────────────────────────────────────────────────
local function DeepMerge(base, override)
    local result = {}
    for k, v in pairs(base) do
        if type(v) == "table" and type(override[k]) == "table" then
            result[k] = DeepMerge(v, override[k])
        elseif override[k] ~= nil then
            result[k] = override[k]
        else
            result[k] = v
        end
    end
    for k, v in pairs(override) do
        if result[k] == nil then result[k] = v end
    end
    return result
end

-- ─────────────────────────────────────────────────────────────────────────────
-- Icon system — Footagues IconsV2 (Main-v2.lua)
-- ─────────────────────────────────────────────────────────────────────────────
local IconsV2 = nil
do
    local ok, result = pcall(function()
        return loadstring(game:HttpGetAsync(
            "https://raw.githubusercontent.com/Footagesus/Icons/main/Main-v2.lua"
        ))()
    end)
    if ok and result then
        IconsV2 = result
        IconsV2.SetIconsType("lucide")
    end
end

-- Applies an icon to an ImageLabel. Supports "pack:name" or plain "name" (lucide default).
local function ApplyIcon(img, name)
    if not IconsV2 or not name then return false end
    local data = IconsV2.GetIcon(name)   -- returns Image string or nil
    if not data then return false end

    if type(data) == "string" then
        -- Plain asset id
        img.Image = data
        img.ImageRectSize   = Vector2.new(0, 0)
        img.ImageRectOffset = Vector2.new(0, 0)
    elseif type(data) == "table" and data[1] then
        -- Spritesheet entry
        img.Image = data[1]
        if data[2] then
            img.ImageRectSize   = data[2].ImageRectSize     or Vector2.new(0, 0)
            img.ImageRectOffset = data[2].ImageRectPosition or Vector2.new(0, 0)
        end
    else
        return false
    end
    return true
end

-- ─────────────────────────────────────────────────────────────────────────────
-- Tween helpers
-- ─────────────────────────────────────────────────────────────────────────────
local function Tween(obj, props, dur, style, dir)
    local tw = TweenService:Create(obj,
        TweenInfo.new(dur or 0.25, style or Enum.EasingStyle.Quint, dir or Enum.EasingDirection.Out),
        props
    )
    tw:Play()
    return tw
end

local function MakeCorner(parent, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = radius or UDim.new(0, 12)
    c.Parent = parent
    return c
end

local function MakeStroke(parent, color, thickness, transparency)
    local s = Instance.new("UIStroke")
    s.Color       = color        or Color3.new(1, 1, 1)
    s.Thickness   = thickness    or 1
    s.Transparency = transparency or 0
    s.Parent      = parent
    return s
end

-- ─────────────────────────────────────────────────────────────────────────────
-- File helpers
-- ─────────────────────────────────────────────────────────────────────────────
local function SaveKey(file, key)
    pcall(function() if writefile then writefile(file, key) end end)
end

local function LoadSavedKey(file)
    local key
    pcall(function()
        if isfile and isfile(file) then key = readfile(file) end
    end)
    return (key and key ~= "") and key or nil
end

local function DeleteSavedKey(file)
    pcall(function()
        if isfile and isfile(file) then delfile(file) end
    end)
end

local function FormatTimeLeft(ts)
    if not ts then return nil end
    local left = ts - os.time()
    if left <= 0 then return "Expired" end
    local d = math.floor(left / 86400)
    local h = math.floor((left % 86400) / 3600)
    local m = math.floor((left % 3600) / 60)
    if d > 0 then return d .. "d " .. h .. "h remaining"
    elseif h > 0 then return h .. "h " .. m .. "m remaining"
    else return m .. "m remaining" end
end

-- ─────────────────────────────────────────────────────────────────────────────
-- Toast notification (top of screen, auto-dismisses)
-- ─────────────────────────────────────────────────────────────────────────────
local function ShowToast(GUI, T, message, duration, iconName, color)
    duration = duration or 3
    color    = color    or T.TextDim

    -- Remove any existing toast first
    local existing = GUI:FindFirstChild("ChronosToast")
    if existing then existing:Destroy() end

    local Toast = Instance.new("Frame")
    Toast.Name             = "ChronosToast"
    Toast.Size             = UDim2.new(0, 320, 0, 44)
    Toast.Position         = UDim2.new(0.5, 0, 0, -60)
    Toast.AnchorPoint      = Vector2.new(0.5, 0)
    Toast.BackgroundColor3 = Color3.fromHex("#0D0D12")
    Toast.BorderSizePixel  = 0
    Toast.ZIndex           = 200
    Toast.ClipsDescendants = true
    Toast.Parent           = GUI
    MakeCorner(Toast, UDim.new(0, 14))
    local ToastStroke = MakeStroke(Toast, color, 1.2, 0.3)

    -- Mobile scaling
    local ToastScale = Instance.new("UIScale")
    do
        local vp = workspace.CurrentCamera.ViewportSize
        ToastScale.Scale = math.min(vp.X / 380, 1)
    end
    ToastScale.Parent = Toast

    local ToastRow = Instance.new("Frame")
    ToastRow.Size                = UDim2.fromScale(1, 1)
    ToastRow.BackgroundTransparency = 1
    ToastRow.ZIndex              = 201
    ToastRow.Parent              = Toast

    local RowLayout = Instance.new("UIListLayout")
    RowLayout.FillDirection      = Enum.FillDirection.Horizontal
    RowLayout.VerticalAlignment  = Enum.VerticalAlignment.Center
    RowLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    RowLayout.Padding            = UDim.new(0, 8)
    RowLayout.Parent             = ToastRow

    if iconName then
        local ToastIcon = Instance.new("ImageLabel")
        ToastIcon.Size                = UDim2.fromOffset(16, 16)
        ToastIcon.BackgroundTransparency = 1
        ToastIcon.ImageColor3         = color
        ToastIcon.ZIndex              = 202
        ToastIcon.LayoutOrder         = 1
        ToastIcon.Parent              = ToastRow
        ApplyIcon(ToastIcon, iconName)
    end

    local ToastLabel = Instance.new("TextLabel")
    ToastLabel.Size               = UDim2.fromOffset(0, 30)
    ToastLabel.AutomaticSize      = Enum.AutomaticSize.X
    ToastLabel.BackgroundTransparency = 1
    ToastLabel.Text               = message
    ToastLabel.TextColor3         = T.Text
    ToastLabel.TextSize           = 13
    ToastLabel.Font               = Enum.Font.GothamSemibold
    ToastLabel.TextTransparency   = 0
    ToastLabel.ZIndex             = 202
    ToastLabel.LayoutOrder        = 2
    ToastLabel.Parent             = ToastRow

    -- Slide in
    Tween(Toast, {Position = UDim2.new(0.5, 0, 0, 16)}, 0.4, Enum.EasingStyle.Back)

    task.delay(duration, function()
        if not Toast or not Toast.Parent then return end
        Tween(Toast, {Position = UDim2.new(0.5, 0, 0, -60)}, 0.35, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
        task.delay(0.4, function()
            if Toast and Toast.Parent then Toast:Destroy() end
        end)
    end)

    return Toast
end

-- ─────────────────────────────────────────────────────────────────────────────
-- Ban screen
-- ─────────────────────────────────────────────────────────────────────────────
local function ShowBanScreen(T, banMsg, execName)
    for _, g in ipairs(CoreGui:GetChildren()) do
        if g.Name == "ChronosKeySystem" then g:Destroy() end
    end

    local GUI = Instance.new("ScreenGui")
    GUI.Name              = "ChronosKeySystem"
    GUI.IgnoreGuiInset    = true
    GUI.ResetOnSpawn      = false
    GUI.ZIndexBehavior    = Enum.ZIndexBehavior.Sibling
    GUI.DisplayOrder      = 999
    GUI.Parent            = CoreGui

    local BG = Instance.new("Frame")
    BG.Size                  = UDim2.fromScale(1, 1)
    BG.BackgroundColor3      = T.GradStart
    BG.BorderSizePixel       = 0
    BG.BackgroundTransparency = 1
    BG.Parent                = GUI

    local BGGrad = Instance.new("UIGradient")
    BGGrad.Color    = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   T.GradStart),
        ColorSequenceKeypoint.new(0.5, T.GradMid),
        ColorSequenceKeypoint.new(1,   T.GradEnd),
    })
    BGGrad.Rotation = T.GradAngle
    BGGrad.Parent   = BG

    local redirects = {}
    if banMsg.Redirect  and banMsg.RedirectText  then table.insert(redirects, {url = banMsg.Redirect,  text = banMsg.RedirectText})  end
    if banMsg.Redirect2 and banMsg.RedirectText2 then table.insert(redirects, {url = banMsg.Redirect2, text = banMsg.RedirectText2}) end
    if banMsg.Redirect3 and banMsg.RedirectText3 then table.insert(redirects, {url = banMsg.Redirect3, text = banMsg.RedirectText3}) end

    local cardHeight = 245 + (#redirects * 58)

    local Card = Instance.new("Frame")
    Card.Size                  = UDim2.fromOffset(380, cardHeight)
    Card.Position              = UDim2.fromScale(0.5, 0.5)
    Card.AnchorPoint           = Vector2.new(0.5, 0.5)
    Card.BackgroundColor3      = T.Card
    Card.BackgroundTransparency = 1
    Card.BorderSizePixel       = 0
    Card.ClipsDescendants      = true
    Card.ZIndex                = 10
    Card.Parent                = BG
    MakeCorner(Card, UDim.new(0, 28))
    local CardBorder = MakeStroke(Card, T.Error, 1.5, 1)

    local function GetScale()
        local vp = workspace.CurrentCamera.ViewportSize
        return math.min(vp.X / 420, vp.Y / (cardHeight + 40), 1)
    end
    local UIScale = Instance.new("UIScale")
    UIScale.Scale  = GetScale()
    UIScale.Parent = Card
    workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
        Tween(UIScale, {Scale = GetScale()}, 0.3)
    end)

    local IconHolder = Instance.new("Frame")
    IconHolder.Size                  = UDim2.fromOffset(70, 70)
    IconHolder.Position              = UDim2.new(0.5, 0, 0, 40)
    IconHolder.AnchorPoint           = Vector2.new(0.5, 0)
    IconHolder.BackgroundColor3      = T.Error
    IconHolder.BackgroundTransparency = 1
    IconHolder.BorderSizePixel       = 0
    IconHolder.ZIndex                = 11
    IconHolder.Parent                = Card
    MakeCorner(IconHolder, UDim.new(1, 0))

    local WarnIcon = Instance.new("ImageLabel")
    WarnIcon.Size                  = UDim2.fromOffset(36, 36)
    WarnIcon.Position              = UDim2.fromScale(0.5, 0.5)
    WarnIcon.AnchorPoint           = Vector2.new(0.5, 0.5)
    WarnIcon.BackgroundTransparency = 1
    WarnIcon.ImageColor3           = T.Error
    WarnIcon.ImageTransparency     = 1
    WarnIcon.ZIndex                = 12
    WarnIcon.Parent                = IconHolder
    ApplyIcon(WarnIcon, "shield-x")

    local BanTitle = Instance.new("TextLabel")
    BanTitle.Size                  = UDim2.new(0.85, 0, 0, 30)
    BanTitle.Position              = UDim2.new(0.5, 0, 0, 120)
    BanTitle.AnchorPoint           = Vector2.new(0.5, 0)
    BanTitle.BackgroundTransparency = 1
    BanTitle.Text                  = banMsg.Title or "ACCESS DENIED"
    BanTitle.TextColor3            = T.Error
    BanTitle.Font                  = Enum.Font.GothamBlack
    BanTitle.TextSize              = 24
    BanTitle.TextTransparency      = 1
    BanTitle.ZIndex                = 11
    BanTitle.Parent                = Card

    local BanSub = Instance.new("TextLabel")
    BanSub.Size                  = UDim2.new(0.85, 0, 0, 20)
    BanSub.Position              = UDim2.new(0.5, 0, 0, 152)
    BanSub.AnchorPoint           = Vector2.new(0.5, 0)
    BanSub.BackgroundTransparency = 1
    BanSub.Text                  = (banMsg.Subtitle or "Incompatible Executor") .. " — " .. execName
    BanSub.TextColor3            = T.TextDim
    BanSub.Font                  = Enum.Font.GothamMedium
    BanSub.TextSize              = 13
    BanSub.TextTransparency      = 1
    BanSub.ZIndex                = 11
    BanSub.Parent                = Card

    local BanBody = Instance.new("TextLabel")
    BanBody.Size                  = UDim2.new(0.85, 0, 0, 40)
    BanBody.Position              = UDim2.new(0.5, 0, 0, 185)
    BanBody.AnchorPoint           = Vector2.new(0.5, 0)
    BanBody.BackgroundTransparency = 1
    BanBody.Text                  = banMsg.Body or "Your executor is not supported."
    BanBody.TextColor3            = T.TextMuted
    BanBody.Font                  = Enum.Font.Gotham
    BanBody.TextSize              = 12
    BanBody.TextWrapped           = true
    BanBody.RichText              = true
    BanBody.TextTransparency      = 1
    BanBody.ZIndex                = 11
    BanBody.Parent                = Card

    local buttonRefs = {}
    for i, redirect in ipairs(redirects) do
        local yPos = 235 + ((i - 1) * 58)
        local btn = Instance.new("TextButton")
        btn.Size                  = UDim2.new(0.85, 0, 0, 48)
        btn.Position              = UDim2.new(0.5, 0, 0, yPos)
        btn.AnchorPoint           = Vector2.new(0.5, 0)
        btn.BackgroundColor3      = i == 1 and T.Error or T.ButtonSec
        btn.BackgroundTransparency = 1
        btn.BorderSizePixel       = 0
        btn.Text                  = ""
        btn.AutoButtonColor       = false
        btn.ZIndex                = 11
        btn.Parent                = Card
        MakeCorner(btn, UDim.new(0, 16))
        local btnStroke = MakeStroke(btn, i == 1 and T.Error or T.TextMuted, 1, 1)

        local btnIcon = Instance.new("ImageLabel")
        btnIcon.Size                  = UDim2.fromOffset(18, 18)
        btnIcon.Position              = UDim2.new(0.5, -70, 0.5, 0)
        btnIcon.AnchorPoint           = Vector2.new(0.5, 0.5)
        btnIcon.BackgroundTransparency = 1
        btnIcon.ImageColor3           = T.Text
        btnIcon.ImageTransparency     = 1
        btnIcon.ZIndex                = 12
        btnIcon.Parent                = btn
        ApplyIcon(btnIcon, "external-link")

        local btnText = Instance.new("TextLabel")
        btnText.Size                  = UDim2.new(1, -40, 1, 0)
        btnText.Position              = UDim2.new(0.5, 5, 0, 0)
        btnText.AnchorPoint           = Vector2.new(0.5, 0)
        btnText.BackgroundTransparency = 1
        btnText.Text                  = redirect.text
        btnText.TextColor3            = T.Text
        btnText.Font                  = Enum.Font.GothamBold
        btnText.TextSize              = 14
        btnText.TextTransparency      = 1
        btnText.ZIndex                = 12
        btnText.Parent                = btn

        btn.MouseEnter:Connect(function()
            Tween(btn,      {BackgroundTransparency = 0}, 0.2)
            Tween(btnStroke, {Transparency = 0}, 0.2)
        end)
        btn.MouseLeave:Connect(function()
            Tween(btn,      {BackgroundTransparency = 0.15}, 0.2)
            Tween(btnStroke, {Transparency = 0.5}, 0.2)
        end)
        btn.MouseButton1Click:Connect(function()
            pcall(function() if setclipboard then setclipboard(redirect.url) end end)
            task.wait(0.5)
            pcall(function()
                LocalPlayer:Kick("\n[ChronosHUB]\n" .. (banMsg.KickMessage or "Unsupported executor.") .. "\n\nLink copied: " .. redirect.url)
            end)
        end)

        table.insert(buttonRefs, {btn = btn, stroke = btnStroke, icon = btnIcon, text = btnText})
    end

    -- Entrance animation
    task.spawn(function()
        task.wait(0.2)
        Tween(BG, {BackgroundTransparency = 0}, 0.5)
        task.wait(0.1)
        Tween(Card,       {BackgroundTransparency = 0.02}, 0.5)
        Tween(CardBorder, {Transparency = 0.3}, 0.5)
        task.wait(0.15)
        Tween(IconHolder, {BackgroundTransparency = 0.85}, 0.5)
        Tween(WarnIcon,   {ImageTransparency = 0}, 0.5)
        task.wait(0.1)
        Tween(BanTitle, {TextTransparency = 0}, 0.5)
        Tween(BanSub,   {TextTransparency = 0}, 0.4)
        task.wait(0.1)
        Tween(BanBody, {TextTransparency = 0}, 0.4)
        for _, ref in ipairs(buttonRefs) do
            task.wait(0.08)
            Tween(ref.btn,    {BackgroundTransparency = 0.15}, 0.5)
            Tween(ref.stroke, {Transparency = 0.5}, 0.5)
            Tween(ref.icon,   {ImageTransparency = 0}, 0.5)
            Tween(ref.text,   {TextTransparency = 0}, 0.5)
        end
    end)

    task.spawn(function()
        while GUI and GUI.Parent do
            Tween(IconHolder, {BackgroundTransparency = 0.75}, 1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
            task.wait(1)
            if not GUI or not GUI.Parent then break end
            Tween(IconHolder, {BackgroundTransparency = 0.9}, 1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
            task.wait(1)
        end
    end)
end

-- ─────────────────────────────────────────────────────────────────────────────
-- Main Init
-- ─────────────────────────────────────────────────────────────────────────────
function Library:Init(userConfig)
    assert(userConfig,        "[ChronosHUB] No config provided")
    assert(userConfig.Games,  "[ChronosHUB] No Games table provided")

    local gameConfig = userConfig.Games[game.PlaceId]
    if not gameConfig then
        warn("[ChronosHUB] Game not supported: " .. tostring(game.PlaceId))
        -- Toast notification rather than kicking the player
        task.spawn(function()
            task.wait(2) -- wait for CoreGui to be usable
            local ToastGUI = Instance.new("ScreenGui")
            ToastGUI.Name           = "ChronosHUBToast"
            ToastGUI.IgnoreGuiInset = true
            ToastGUI.ResetOnSpawn   = false
            ToastGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            ToastGUI.DisplayOrder   = 1000
            ToastGUI.Parent         = CoreGui

            local fakeT = DEFAULTS.Theme
            ShowToast(ToastGUI, fakeT,
                "ChronosHUB doesn't support this game.",
                3, "moon-star", fakeT.Warning)

            task.delay(4, function()
                if ToastGUI and ToastGUI.Parent then ToastGUI:Destroy() end
            end)
        end)
        return
    end

    assert(gameConfig.Script,  "[ChronosHUB] No Script URL for game "  .. tostring(game.PlaceId))
    assert(gameConfig.Junkie,  "[ChronosHUB] No Junkie config for game " .. tostring(game.PlaceId))

    local CFG = DeepMerge(DEFAULTS, gameConfig)
    local T   = CFG.Theme
    local P   = CFG.Particles
    -- AnimSpeed: multiplier applied to all tween durations.  1 = default, 0.5 = snappier.
    local AS  = math.max(0.1, CFG.AnimSpeed or 1)

    local function AT(dur) return (dur or 0.25) * AS end   -- AnimatedTime helper

    -- Executor ban check (runs BEFORE key system loads)
    local currentExec = GetExecutor():lower()
    for _, banned in ipairs(CFG.BannedExecutors or {}) do
        if currentExec:find(banned:lower()) then
            ShowBanScreen(T, CFG.BanMessage, GetExecutor())
            return
        end
    end

    local SAVE_FILE = CFG.SavePrefix .. "_" .. tostring(game.PlaceId) .. "_Key.txt"

    local State = {
        minimized   = false,
        verifying   = false,
        rememberKey = false,
        sdkReady    = false,
        attempts    = 0,
        maxAttempts = 5,
        locked      = false,
    }

    local Junkie = nil

    local ERROR_MAP = {
        KEY_INVALID        = {msg = "Key not found.",                  color = T.Error,   icon = "x-circle"},
        KEY_EXPIRED        = {msg = "Key expired. Get a new one.",     color = T.Error,   icon = "clock"},
        HWID_BANNED        = {msg = "Hardware banned.",                color = T.Error,   icon = "ban",          kick = true},
        KEY_INVALIDATED    = {msg = "Key was manually disabled.",      color = T.Error,   icon = "x-circle"},
        ALREADY_USED       = {msg = "One-time key already used.",      color = T.Error,   icon = "x-circle"},
        HWID_MISMATCH      = {msg = "HWID limit reached.",             color = T.Warning, icon = "alert-triangle"},
        SERVICE_NOT_FOUND  = {msg = "Service not found.",              color = T.Error,   icon = "alert-circle"},
        SERVICE_MISMATCH   = {msg = "Key is for a different service.", color = T.Error,   icon = "alert-circle"},
        PREMIUM_REQUIRED   = {msg = "Premium key required.",           color = T.Warning, icon = "crown"},
        ERROR              = {msg = "Network error. Try again.",       color = T.Error,   icon = "wifi-off"},
    }

    -- Cleanup previous instances
    for _, g in ipairs(CoreGui:GetChildren()) do
        if g.Name == "ChronosKeySystem" then g:Destroy() end
    end

    -- ── GUI Root ──────────────────────────────────────────────────────────────
    local GUI = Instance.new("ScreenGui")
    GUI.Name           = "ChronosKeySystem"
    GUI.IgnoreGuiInset = true
    GUI.ResetOnSpawn   = false
    GUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    GUI.DisplayOrder   = 999
    GUI.Parent         = CoreGui

    -- ── Background ────────────────────────────────────────────────────────────
    local Background = Instance.new("Frame")
    Background.Name            = "BG"
    Background.Size            = UDim2.fromScale(1, 1)
    Background.BackgroundColor3 = T.GradStart
    Background.BorderSizePixel = 0
    Background.Parent          = GUI

    local GradientOverlay = Instance.new("Frame")
    GradientOverlay.Size             = UDim2.fromScale(1, 1)
    GradientOverlay.BackgroundColor3 = T.GradEnd
    GradientOverlay.BorderSizePixel  = 0
    GradientOverlay.Parent           = Background

    local BGGradient = Instance.new("UIGradient")
    BGGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   T.GradStart),
        ColorSequenceKeypoint.new(0.5, T.GradMid),
        ColorSequenceKeypoint.new(1,   T.GradEnd),
    })
    BGGradient.Rotation = T.GradAngle
    BGGradient.Parent   = GradientOverlay

    local Vignette = Instance.new("ImageLabel")
    Vignette.Size               = UDim2.fromScale(1, 1)
    Vignette.BackgroundTransparency = 1
    Vignette.Image              = "rbxassetid://1526405635"
    Vignette.ImageColor3        = Color3.new(0, 0, 0)
    Vignette.ImageTransparency  = 0.15
    Vignette.ScaleType          = Enum.ScaleType.Stretch
    Vignette.ZIndex             = 2
    Vignette.Parent             = Background

    local ScanlineFrame = Instance.new("Frame")
    ScanlineFrame.Size             = UDim2.fromScale(1, 1)
    ScanlineFrame.BackgroundTransparency = 1
    ScanlineFrame.ZIndex           = 3
    ScanlineFrame.Parent           = Background

    for i = 1, 100 do
        local line = Instance.new("Frame")
        line.Size             = UDim2.new(1, 0, 0, 1)
        line.Position         = UDim2.fromScale(0, i / 100)
        line.BackgroundColor3 = Color3.new(0, 0, 0)
        line.BackgroundTransparency = 0.97
        line.BorderSizePixel  = 0
        line.Parent           = ScanlineFrame
    end

    local ParticleContainer = Instance.new("Frame")
    ParticleContainer.Size             = UDim2.fromScale(1, 1)
    ParticleContainer.BackgroundTransparency = 1
    ParticleContainer.ClipsDescendants = true
    ParticleContainer.ZIndex           = 4
    ParticleContainer.Parent           = Background

    local BGCrystalContainer = Instance.new("Frame")
    BGCrystalContainer.Size             = UDim2.fromScale(1, 1)
    BGCrystalContainer.BackgroundTransparency = 1
    BGCrystalContainer.ZIndex           = 1
    BGCrystalContainer.Parent           = Background

    -- ── Particles ─────────────────────────────────────────────────────────────
    local function SpawnCrystal()
        if not GUI or not GUI.Parent or State.minimized then return end
        local size   = math.random(25, 50)
        local holder = Instance.new("Frame")
        holder.Size             = UDim2.fromOffset(size, size)
        holder.Position         = UDim2.fromScale(math.random(), 1.1)
        holder.BackgroundTransparency = 1
        holder.Rotation         = math.random(-30, 30)
        holder.ZIndex           = 4
        holder.Parent           = ParticleContainer

        local icon = Instance.new("ImageLabel")
        icon.Size               = UDim2.fromScale(1, 1)
        icon.BackgroundTransparency = 1
        icon.ImageColor3        = T.Primary
        icon.ImageTransparency  = math.random(55, 80) / 100
        icon.ScaleType          = Enum.ScaleType.Fit
        icon.ZIndex             = 4
        icon.Parent             = holder
        ApplyIcon(icon, CFG.Icons[math.random(1, #CFG.Icons)])

        if math.random() > 0.6 then
            local glow = Instance.new("ImageLabel")
            glow.Size             = UDim2.fromScale(2.2, 2.2)
            glow.Position         = UDim2.fromScale(0.5, 0.5)
            glow.AnchorPoint      = Vector2.new(0.5, 0.5)
            glow.BackgroundTransparency = 1
            glow.Image            = "rbxassetid://5028857084"
            glow.ImageColor3      = T.Primary
            glow.ImageTransparency = 0.88
            glow.ZIndex           = 3
            glow.Parent           = holder
        end

        local dur   = math.random(12, 20)
        local drift = (math.random() - 0.5) * 0.3
        Tween(holder, {
            Position = UDim2.fromScale(holder.Position.X.Scale + drift, -0.15),
            Rotation = holder.Rotation + math.random(-90, 90),
        }, dur, Enum.EasingStyle.Linear)
        Tween(icon, {ImageTransparency = 1}, dur * 0.85, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
        task.delay(dur, function() if holder and holder.Parent then holder:Destroy() end end)
    end

    local function SpawnStar()
        if not GUI or not GUI.Parent or State.minimized then return end
        local size = math.random(2, 6)
        local p    = Instance.new("Frame")
        p.Size             = UDim2.fromOffset(size, size)
        p.Position         = UDim2.fromScale(math.random(), 1.05)
        p.BackgroundColor3 = T.Accent
        p.BackgroundTransparency = math.random(60, 85) / 100
        p.BorderSizePixel  = 0
        p.ZIndex           = 4
        p.Parent           = ParticleContainer
        MakeCorner(p, UDim.new(1, 0))

        local dur   = math.random(8, 15)
        local drift = (math.random() - 0.5) * 0.4
        Tween(p, {
            Position = UDim2.fromScale(p.Position.X.Scale + drift, -0.1),
            BackgroundTransparency = 1,
        }, dur, Enum.EasingStyle.Linear)
        task.delay(dur, function() if p and p.Parent then p:Destroy() end end)
    end

    local bgCrystals = {}
    for i = 1, P.BGCount do
        local size  = math.random(50, 100)
        local frame = Instance.new("Frame")
        frame.Size             = UDim2.fromOffset(size, size)
        frame.Position         = UDim2.fromScale(math.random() * 1.1 - 0.05, math.random() * 1.1 - 0.05)
        frame.BackgroundTransparency = 1
        frame.Rotation         = math.random(0, 360)
        frame.ZIndex           = 1
        frame.Parent           = BGCrystalContainer

        local icon = Instance.new("ImageLabel")
        icon.Size             = UDim2.fromScale(1, 1)
        icon.BackgroundTransparency = 1
        icon.ImageColor3      = T.Primary
        icon.ImageTransparency = math.random(92, 97) / 100
        icon.ScaleType        = Enum.ScaleType.Fit
        icon.ZIndex           = 1
        icon.Parent           = frame
        ApplyIcon(icon, CFG.BGIcons[math.random(1, #CFG.BGIcons)])

        bgCrystals[i] = frame
        task.spawn(function()
            local speed = (math.random() - 0.5) * 0.04 * P.BGRotSpeed
            while frame and frame.Parent and GUI and GUI.Parent do
                if not State.minimized then frame.Rotation = frame.Rotation + speed end
                task.wait(0.03)
            end
        end)
    end

    task.spawn(function()
        while GUI and GUI.Parent do
            SpawnCrystal()
            task.wait(math.random(P.CrystalMin * 100, P.CrystalMax * 100) / 100)
        end
    end)
    task.spawn(function()
        while GUI and GUI.Parent do
            SpawnStar()
            task.wait(math.random(P.StarMin * 100, P.StarMax * 100) / 100)
        end
    end)
    task.spawn(function()
        local r = T.GradAngle
        while GUI and GUI.Parent do
            if not State.minimized then r = (r + 0.08) % 360; BGGradient.Rotation = r end
            task.wait(0.03)
        end
    end)

    -- ── Card container ────────────────────────────────────────────────────────
    local CardContainer = Instance.new("Frame")
    CardContainer.Name            = "CardContainer"
    CardContainer.Size            = UDim2.fromOffset(380, 520)
    CardContainer.Position        = UDim2.fromScale(0.5, 0.55)
    CardContainer.AnchorPoint     = Vector2.new(0.5, 0.5)
    CardContainer.BackgroundTransparency = 1
    CardContainer.ZIndex          = 10
    CardContainer.Parent          = Background

    local function GetScale()
        local vp = workspace.CurrentCamera.ViewportSize
        return math.min(vp.X / 420, vp.Y / 560, 1)
    end
    local UIScale = Instance.new("UIScale")
    UIScale.Scale  = GetScale()
    UIScale.Parent = CardContainer
    workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
        Tween(UIScale, {Scale = GetScale()}, 0.3)
    end)

    -- Shadows
    local ShadowDefs = {
        {extra = 70, transp = 0.82, radius = 36, yOff = 0.52},
        {extra = 45, transp = 0.72, radius = 32, yOff = 0.51},
        {extra = 22, transp = 0.62, radius = 30, yOff = 0.505},
    }
    local ShadowFrames = {}
    for i, def in ipairs(ShadowDefs) do
        local sh = Instance.new("Frame")
        sh.Size             = UDim2.new(1, def.extra, 1, def.extra)
        sh.Position         = UDim2.fromScale(0.5, def.yOff)
        sh.AnchorPoint      = Vector2.new(0.5, 0.5)
        sh.BackgroundColor3 = Color3.new(0, 0, 0)
        sh.BackgroundTransparency = 1
        sh.BorderSizePixel  = 0
        sh.ZIndex           = 7 + i
        sh.Parent           = CardContainer
        MakeCorner(sh, UDim.new(0, def.radius))
        ShadowFrames[i] = {frame = sh, target = def.transp}
    end

    -- Main card
    local Card = Instance.new("Frame")
    Card.Name             = "Card"
    Card.Size             = UDim2.fromScale(1, 1)
    Card.Position         = UDim2.fromScale(0.5, 0.5)
    Card.AnchorPoint      = Vector2.new(0.5, 0.5)
    Card.BackgroundColor3 = T.Card
    Card.BackgroundTransparency = 1
    Card.BorderSizePixel  = 0
    Card.ClipsDescendants = true
    Card.ZIndex           = 10
    Card.Parent           = CardContainer
    MakeCorner(Card, UDim.new(0, 28))
    local CardBorder = MakeStroke(Card, T.Primary, 1.5, 1)

    -- NOTE: InnerGlow removed per request (the weird top gradient)

    -- ── Minimize button ───────────────────────────────────────────────────────
    local MinBtn = Instance.new("TextButton")
    MinBtn.Size             = UDim2.fromOffset(36, 36)
    MinBtn.Position         = UDim2.new(1, -12, 0, 12)
    MinBtn.AnchorPoint      = Vector2.new(1, 0)
    MinBtn.BackgroundColor3 = T.ButtonSec
    MinBtn.BackgroundTransparency = 1
    MinBtn.BorderSizePixel  = 0
    MinBtn.Text             = ""
    MinBtn.AutoButtonColor  = false
    MinBtn.ZIndex           = 15
    MinBtn.Parent           = Card
    MakeCorner(MinBtn, UDim.new(0, 10))
    local MinBtnStroke = MakeStroke(MinBtn, T.TextMuted, 1, 1)

    local MinBtnIcon = Instance.new("ImageLabel")
    MinBtnIcon.Size               = UDim2.fromOffset(18, 18)
    MinBtnIcon.Position           = UDim2.fromScale(0.5, 0.5)
    MinBtnIcon.AnchorPoint        = Vector2.new(0.5, 0.5)
    MinBtnIcon.BackgroundTransparency = 1
    MinBtnIcon.ImageColor3        = T.TextDim
    MinBtnIcon.ImageTransparency  = 1
    MinBtnIcon.ZIndex             = 16
    MinBtnIcon.Parent             = MinBtn
    ApplyIcon(MinBtnIcon, "eye")

    MinBtn.MouseEnter:Connect(function()
        Tween(MinBtn,       {BackgroundTransparency = 0.1}, 0.2)
        Tween(MinBtnIcon,   {ImageColor3 = T.Primary}, 0.2)
        Tween(MinBtnStroke, {Color = T.Primary, Transparency = 0.3}, 0.2)
    end)
    MinBtn.MouseLeave:Connect(function()
        Tween(MinBtn,       {BackgroundTransparency = 0.3}, 0.2)
        Tween(MinBtnIcon,   {ImageColor3 = T.TextDim}, 0.2)
        Tween(MinBtnStroke, {Color = T.TextMuted, Transparency = 0.7}, 0.2)
    end)

    -- ── Discord copy button (top left) ────────────────────────────────────────
    local DiscordBtn = Instance.new("TextButton")
    DiscordBtn.Size             = UDim2.fromOffset(36, 36)
    DiscordBtn.Position         = UDim2.new(0, 12, 0, 12)
    DiscordBtn.AnchorPoint      = Vector2.new(0, 0)
    DiscordBtn.BackgroundColor3 = T.ButtonSec
    DiscordBtn.BackgroundTransparency = 1
    DiscordBtn.BorderSizePixel  = 0
    DiscordBtn.Text             = ""
    DiscordBtn.AutoButtonColor  = false
    DiscordBtn.ZIndex           = 15
    DiscordBtn.Parent           = Card
    MakeCorner(DiscordBtn, UDim.new(0, 10))
    local DiscordBtnStroke = MakeStroke(DiscordBtn, T.TextMuted, 1, 1)

    local DiscordBtnIcon = Instance.new("ImageLabel")
    DiscordBtnIcon.Size               = UDim2.fromOffset(18, 18)
    DiscordBtnIcon.Position           = UDim2.fromScale(0.5, 0.5)
    DiscordBtnIcon.AnchorPoint        = Vector2.new(0.5, 0.5)
    DiscordBtnIcon.BackgroundTransparency = 1
    DiscordBtnIcon.ImageColor3        = T.TextDim
    DiscordBtnIcon.ImageTransparency  = 1
    DiscordBtnIcon.ZIndex             = 16
    DiscordBtnIcon.Parent             = DiscordBtn
    -- craft pack has a clean discord icon
    ApplyIcon(DiscordBtnIcon, "craft:discord-stroke")

    DiscordBtn.MouseEnter:Connect(function()
        Tween(DiscordBtn,       {BackgroundTransparency = 0.1}, 0.2)
        Tween(DiscordBtnIcon,   {ImageColor3 = Color3.fromHex("#5865F2")}, 0.2)
        Tween(DiscordBtnStroke, {Color = Color3.fromHex("#5865F2"), Transparency = 0.3}, 0.2)
    end)
    DiscordBtn.MouseLeave:Connect(function()
        Tween(DiscordBtn,       {BackgroundTransparency = 0.3}, 0.2)
        Tween(DiscordBtnIcon,   {ImageColor3 = T.TextDim}, 0.2)
        Tween(DiscordBtnStroke, {Color = T.TextMuted, Transparency = 0.7}, 0.2)
    end)

    

    -- ── Minimised pill indicator ──────────────────────────────────────────────
    local MiniIndicator = Instance.new("TextButton")
    MiniIndicator.Size             = UDim2.fromOffset(50, 50)
    MiniIndicator.Position         = UDim2.new(1, -20, 0.5, 0)
    MiniIndicator.AnchorPoint      = Vector2.new(1, 0.5)
    MiniIndicator.BackgroundColor3 = T.Primary
    MiniIndicator.BackgroundTransparency = 0.15
    MiniIndicator.BorderSizePixel  = 0
    MiniIndicator.Text             = ""
    MiniIndicator.AutoButtonColor  = false
    MiniIndicator.Visible          = false
    MiniIndicator.ZIndex           = 100
    MiniIndicator.Parent           = GUI
    MakeCorner(MiniIndicator, UDim.new(1, 0))
    local MiniStroke = MakeStroke(MiniIndicator, T.Accent, 2, 0.3)

    local MiniIcon = Instance.new("ImageLabel")
    MiniIcon.Size               = UDim2.fromOffset(24, 24)
    MiniIcon.Position           = UDim2.fromScale(0.5, 0.5)
    MiniIcon.AnchorPoint        = Vector2.new(0.5, 0.5)
    MiniIcon.BackgroundTransparency = 1
    MiniIcon.ImageColor3        = T.Text
    MiniIcon.ZIndex             = 101
    MiniIcon.Parent             = MiniIndicator
    ApplyIcon(MiniIcon, "eye-off")

    MiniIndicator.MouseEnter:Connect(function()
        Tween(MiniIndicator, {Size = UDim2.fromOffset(55, 55)}, 0.2, Enum.EasingStyle.Back)
        Tween(MiniStroke,    {Transparency = 0}, 0.2)
    end)
    MiniIndicator.MouseLeave:Connect(function()
        Tween(MiniIndicator, {Size = UDim2.fromOffset(50, 50)}, 0.2)
        Tween(MiniStroke,    {Transparency = 0.3}, 0.2)
    end)

    task.spawn(function()
        while GUI and GUI.Parent do
            if MiniIndicator.Visible then
                Tween(MiniIndicator, {BackgroundTransparency = 0.3}, 0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
                task.wait(0.8)
                if MiniIndicator.Visible then
                    Tween(MiniIndicator, {BackgroundTransparency = 0.1}, 0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
                end
                task.wait(0.8)
            else task.wait(0.1) end
        end
    end)

    -- ── Minimize / Restore ────────────────────────────────────────────────────
    local function HideEverything(onDone)
        -- Shared hide animation (used by both minimize and success close)
        local FADE = AT(0.4)
        Tween(Background,      {BackgroundTransparency = 1}, FADE)
        Tween(GradientOverlay, {BackgroundTransparency = 1}, FADE)
        Tween(Vignette,        {ImageTransparency = 1},      FADE)
        for _, line in ipairs(ScanlineFrame:GetChildren()) do
            if line:IsA("Frame") then Tween(line, {BackgroundTransparency = 1}, FADE) end
        end
        Tween(CardContainer, {Position = UDim2.new(0.5, 0, -0.5, 0)}, AT(0.5), Enum.EasingStyle.Back, Enum.EasingDirection.In)
        for _, sd in ipairs(ShadowFrames) do Tween(sd.frame, {BackgroundTransparency = 1}, FADE) end
        for _, c in ipairs(bgCrystals) do
            if c and c.Parent then
                for _, ch in ipairs(c:GetChildren()) do
                    if ch:IsA("ImageLabel") then Tween(ch, {ImageTransparency = 1}, FADE) end
                end
            end
        end
        for _, ch in ipairs(ParticleContainer:GetChildren()) do
            if ch:IsA("Frame") then
                Tween(ch, {BackgroundTransparency = 1}, FADE)
                for _, sub in ipairs(ch:GetChildren()) do
                    if sub:IsA("ImageLabel") then Tween(sub, {ImageTransparency = 1}, FADE) end
                end
            end
        end
        if onDone then task.delay(FADE, onDone) end
    end

    local function ShowEverything()
        local FADE = AT(0.4)
        Tween(Background,      {BackgroundTransparency = 0},    FADE)
        Tween(GradientOverlay, {BackgroundTransparency = 0},    FADE)
        Tween(Vignette,        {ImageTransparency = 0.15},      FADE)
        for _, line in ipairs(ScanlineFrame:GetChildren()) do
            if line:IsA("Frame") then Tween(line, {BackgroundTransparency = 0.97}, FADE) end
        end
        Tween(CardContainer, {Position = UDim2.fromScale(0.5, 0.5)}, AT(0.5), Enum.EasingStyle.Back)
        task.delay(AT(0.2), function()
            for _, sd in ipairs(ShadowFrames) do Tween(sd.frame, {BackgroundTransparency = sd.target}, FADE) end
        end)
        for _, c in ipairs(bgCrystals) do
            if c and c.Parent then
                for _, ch in ipairs(c:GetChildren()) do
                    if ch:IsA("ImageLabel") then
                        Tween(ch, {ImageTransparency = math.random(92, 97) / 100}, FADE)
                    end
                end
            end
        end
    end

    local function ToggleMinimize()
        State.minimized = not State.minimized
        if State.minimized then
            ApplyIcon(MinBtnIcon, "eye-off")
            HideEverything()
            task.delay(AT(0.3), function()
                MiniIndicator.Visible  = true
                MiniIndicator.Position = UDim2.new(1, 20, 0.5, 0)
                Tween(MiniIndicator, {Position = UDim2.new(1, -20, 0.5, 0)}, AT(0.3), Enum.EasingStyle.Back)
            end)
        else
            ApplyIcon(MinBtnIcon, "eye")
            Tween(MiniIndicator, {Position = UDim2.new(1, 20, 0.5, 0)}, AT(0.2))
            task.delay(AT(0.2), function() MiniIndicator.Visible = false end)
            ShowEverything()
        end
    end

    MinBtn.MouseButton1Click:Connect(ToggleMinimize)
    MiniIndicator.MouseButton1Click:Connect(ToggleMinimize)

    -- ── Welcome text ──────────────────────────────────────────────────────────
    local WelcomeText = Instance.new("TextLabel")
    WelcomeText.Size               = UDim2.new(1, 0, 0, 18)
    WelcomeText.Position           = UDim2.new(0, 0, 0, 12.5)
    WelcomeText.BackgroundTransparency = 1
    WelcomeText.Text               = CFG.Welcome
    WelcomeText.TextColor3         = T.TextDim
    WelcomeText.TextSize           = 11
    WelcomeText.Font               = Enum.Font.GothamMedium
    WelcomeText.TextTransparency   = 1
    WelcomeText.ZIndex             = 11
    WelcomeText.Parent             = Card

    -- ── Logo ──────────────────────────────────────────────────────────────────
    local LogoContainer = Instance.new("Frame")
    LogoContainer.Size             = UDim2.fromOffset(80, 80)
    LogoContainer.Position         = UDim2.new(0.5, 0, 0, 50)
    LogoContainer.AnchorPoint      = Vector2.new(0.5, 0)
    LogoContainer.BackgroundTransparency = 1
    LogoContainer.ZIndex           = 11
    LogoContainer.Parent           = Card

    local OuterGlow = Instance.new("Frame")
    OuterGlow.Size             = UDim2.fromOffset(90, 90)
    OuterGlow.Position         = UDim2.fromScale(0.5, 0.5)
    OuterGlow.AnchorPoint      = Vector2.new(0.5, 0.5)
    OuterGlow.BackgroundColor3 = T.Primary
    OuterGlow.BackgroundTransparency = 1
    OuterGlow.BorderSizePixel  = 0
    OuterGlow.ZIndex           = 10
    OuterGlow.Parent           = LogoContainer
    MakeCorner(OuterGlow, UDim.new(1, 0))

    local LogoRing = Instance.new("Frame")
    LogoRing.Size             = UDim2.fromOffset(72, 72)
    LogoRing.Position         = UDim2.fromScale(0.5, 0.5)
    LogoRing.AnchorPoint      = Vector2.new(0.5, 0.5)
    LogoRing.BackgroundColor3 = Color3.fromHex("#18182a")
    LogoRing.BackgroundTransparency = 1
    LogoRing.BorderSizePixel  = 0
    LogoRing.ZIndex           = 11
    LogoRing.Parent           = LogoContainer
    MakeCorner(LogoRing, UDim.new(1, 0))
    local LogoRingBorder = MakeStroke(LogoRing, T.Primary, 2.5, 1)

    local KeyIconHolder = Instance.new("Frame")
    KeyIconHolder.Size             = UDim2.fromOffset(36, 36)
    KeyIconHolder.Position         = UDim2.fromScale(0.5, 0.5)
    KeyIconHolder.AnchorPoint      = Vector2.new(0.5, 0.5)
    KeyIconHolder.BackgroundTransparency = 1
    KeyIconHolder.ZIndex           = 12
    KeyIconHolder.Parent           = LogoRing

    local KeyIcon = Instance.new("ImageLabel")
    KeyIcon.Size               = UDim2.fromScale(1, 1)
    KeyIcon.BackgroundTransparency = 1
    KeyIcon.ImageColor3        = T.Primary
    KeyIcon.ImageTransparency  = 1
    KeyIcon.ScaleType          = Enum.ScaleType.Fit
    KeyIcon.ZIndex             = 12
    KeyIcon.Parent             = KeyIconHolder
    ApplyIcon(KeyIcon, "key-round")

    local DecoDots = {}
    for i = 1, 8 do
        local angle  = math.rad((i - 1) * 45 - 90)
        local radius = 48
        local ds     = 4
        local dot    = Instance.new("Frame")
        dot.Size             = UDim2.fromOffset(ds, ds)
        dot.Position         = UDim2.new(0.5, math.cos(angle) * radius - ds / 2, 0.5, math.sin(angle) * radius - ds / 2)
        dot.BackgroundColor3 = T.Primary
        dot.BackgroundTransparency = 1
        dot.BorderSizePixel  = 0
        dot.ZIndex           = 10
        dot.Parent           = LogoContainer
        MakeCorner(dot, UDim.new(1, 0))
        DecoDots[i] = dot
    end

    -- ── Title ─────────────────────────────────────────────────────────────────
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size               = UDim2.new(1, 0, 0, 36)
    TitleLabel.Position           = UDim2.new(0, 0, 0, 140)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text               = CFG.Title
    TitleLabel.TextColor3         = T.Text
    TitleLabel.Font               = Enum.Font.GothamBlack
    TitleLabel.TextSize           = 26
    TitleLabel.TextTransparency   = 1
    TitleLabel.ZIndex             = 11
    TitleLabel.Parent             = Card

    local TitleGradient = Instance.new("UIGradient")
    TitleGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,    Color3.fromHex("#FFFFFF")),
        ColorSequenceKeypoint.new(0.35, T.Primary),
        ColorSequenceKeypoint.new(0.65, T.Primary),
        ColorSequenceKeypoint.new(1,    Color3.fromHex("#FFFFFF")),
    })
    TitleGradient.Parent = TitleLabel

    local SubtitleLabel = Instance.new("TextLabel")
    SubtitleLabel.Size               = UDim2.new(1, 0, 0, 18)
    SubtitleLabel.Position           = UDim2.new(0, 0, 0, 172)
    SubtitleLabel.BackgroundTransparency = 1
    SubtitleLabel.Text               = CFG.Subtitle
    SubtitleLabel.TextColor3         = T.Accent
    SubtitleLabel.Font               = Enum.Font.GothamMedium
    SubtitleLabel.TextSize           = 13
    SubtitleLabel.TextTransparency   = 1
    SubtitleLabel.ZIndex             = 11
    SubtitleLabel.Parent             = Card

    -- ── Input ─────────────────────────────────────────────────────────────────
    local InputLabel = Instance.new("TextLabel")
    InputLabel.Size               = UDim2.new(0.85, 0, 0, 22)
    InputLabel.Position           = UDim2.new(0.5, 0, 0, 205)
    InputLabel.AnchorPoint        = Vector2.new(0.5, 0)
    InputLabel.BackgroundTransparency = 1
    InputLabel.Text               = "Enter Your Access Key"
    InputLabel.TextColor3         = T.Text
    InputLabel.TextSize           = 14
    InputLabel.Font               = Enum.Font.GothamSemibold
    InputLabel.TextXAlignment     = Enum.TextXAlignment.Left
    InputLabel.TextTransparency   = 1
    InputLabel.ZIndex             = 11
    InputLabel.Parent             = Card

    local InputContainer = Instance.new("Frame")
    InputContainer.Size             = UDim2.new(0.85, 0, 0, 56)
    InputContainer.Position         = UDim2.new(0.5, 0, 0, 232)
    InputContainer.AnchorPoint      = Vector2.new(0.5, 0)
    InputContainer.BackgroundColor3 = T.InputBG
    InputContainer.BackgroundTransparency = 1
    InputContainer.BorderSizePixel  = 0
    InputContainer.ZIndex           = 11
    InputContainer.Parent           = Card
    MakeCorner(InputContainer, UDim.new(0, 16))
    local InputStroke = MakeStroke(InputContainer, T.ButtonSec, 1.5, 1)

    local InputIcon = Instance.new("ImageLabel")
    InputIcon.Size               = UDim2.fromOffset(20, 20)
    InputIcon.Position           = UDim2.new(0, 16, 0.5, 0)
    InputIcon.AnchorPoint        = Vector2.new(0, 0.5)
    InputIcon.BackgroundTransparency = 1
    InputIcon.ImageColor3        = T.TextDim
    InputIcon.ImageTransparency  = 1
    InputIcon.ZIndex             = 12
    InputIcon.Parent             = InputContainer
    ApplyIcon(InputIcon, "key")

    local KeyInput = Instance.new("TextBox")
    KeyInput.Size             = UDim2.new(1, -55, 1, 0)
    KeyInput.Position         = UDim2.new(0, 45, 0, 0)
    KeyInput.BackgroundTransparency = 1
    KeyInput.Text             = ""
    KeyInput.PlaceholderText  = "Paste or type your key here..."
    KeyInput.PlaceholderColor3 = T.TextMuted
    KeyInput.TextColor3       = T.Text
    KeyInput.TextSize         = 14
    KeyInput.Font             = Enum.Font.GothamMedium
    KeyInput.TextXAlignment   = Enum.TextXAlignment.Left
    KeyInput.ClearTextOnFocus = false
    KeyInput.TextTransparency = 1
    KeyInput.ZIndex           = 12
    KeyInput.Parent           = InputContainer

    local VerifyKey  -- forward-declared below

    KeyInput.Focused:Connect(function()
        Tween(InputStroke,    {Color = T.Primary, Transparency = 0}, 0.25)
        Tween(InputContainer, {BackgroundColor3 = Color3.fromHex("#14141f")}, 0.25)
        Tween(InputIcon,      {ImageColor3 = T.Primary, ImageTransparency = 0}, 0.25)
    end)
    KeyInput.FocusLost:Connect(function(enter)
        Tween(InputStroke,    {Color = T.ButtonSec, Transparency = 0.3}, 0.25)
        Tween(InputContainer, {BackgroundColor3 = T.InputBG}, 0.25)
        Tween(InputIcon,      {ImageColor3 = T.TextDim, ImageTransparency = 0.3}, 0.25)
        if enter and not State.verifying and not State.locked then
            task.spawn(VerifyKey, KeyInput.Text, false)
        end
    end)

    -- ── Status ────────────────────────────────────────────────────────────────
    local StatusContainer = Instance.new("Frame")
    StatusContainer.Size             = UDim2.new(0.85, 0, 0, 24)
    StatusContainer.Position         = UDim2.new(0.5, 0, 0, 291)
    StatusContainer.AnchorPoint      = Vector2.new(0.5, 0)
    StatusContainer.BackgroundTransparency = 1
    StatusContainer.ZIndex           = 11
    StatusContainer.Parent           = Card

    local StatusLay = Instance.new("UIListLayout")
    StatusLay.FillDirection       = Enum.FillDirection.Horizontal
    StatusLay.HorizontalAlignment = Enum.HorizontalAlignment.Center
    StatusLay.VerticalAlignment   = Enum.VerticalAlignment.Center
    StatusLay.Padding             = UDim.new(0, 6)
    StatusLay.Parent              = StatusContainer

    local StatusIcon = Instance.new("ImageLabel")
    StatusIcon.Size               = UDim2.fromOffset(14, 14)
    StatusIcon.BackgroundTransparency = 1
    StatusIcon.ImageColor3        = T.Accent
    StatusIcon.ImageTransparency  = 1
    StatusIcon.LayoutOrder        = 1
    StatusIcon.ZIndex             = 12
    StatusIcon.Parent             = StatusContainer

    local StatusLabel = Instance.new("TextLabel")
    StatusLabel.Size               = UDim2.fromOffset(0, 20)
    StatusLabel.AutomaticSize      = Enum.AutomaticSize.X
    StatusLabel.BackgroundTransparency = 1
    StatusLabel.Text               = ""
    StatusLabel.TextColor3         = T.Accent
    StatusLabel.TextSize           = 12
    StatusLabel.Font               = Enum.Font.GothamSemibold
    StatusLabel.TextTransparency   = 1
    StatusLabel.LayoutOrder        = 2
    StatusLabel.ZIndex             = 11
    StatusLabel.Parent             = StatusContainer

    local function ShowStatus(msg, color, duration, iconName)
        StatusLabel.Text       = msg
        StatusLabel.TextColor3 = color or T.Accent
        Tween(StatusLabel, {TextTransparency = 0}, 0.2)
        if iconName then
            ApplyIcon(StatusIcon, iconName)
            StatusIcon.ImageColor3 = color or T.Accent
            StatusIcon.Size        = UDim2.fromOffset(14, 14)
            Tween(StatusIcon, {ImageTransparency = 0}, 0.2)
        else
            StatusIcon.Size = UDim2.fromOffset(0, 0)
            Tween(StatusIcon, {ImageTransparency = 1}, 0.2)
        end
        if duration then
            task.delay(duration, function()
                Tween(StatusLabel, {TextTransparency = 1}, 0.4)
                Tween(StatusIcon,  {ImageTransparency = 1}, 0.4)
            end)
        end
    end

    local function HideStatus()
        Tween(StatusLabel, {TextTransparency = 1}, 0.3)
        Tween(StatusIcon,  {ImageTransparency = 1}, 0.3)
    end

    DiscordBtn.MouseButton1Click:Connect(function()
        local discordUrl = CFG.DiscordLink or "https://discord.com/invite/fu9fH2trGT"
        local copied = false
        pcall(function()
            if setclipboard then setclipboard(discordUrl); copied = true end
        end)
        if copied then
            ShowStatus("Copied server link to clipboard!", Color3.fromHex("#5865F2"), 3, "craft:discord-stroke")
        else
            ShowStatus(discordUrl, Color3.fromHex("#5865F2"), 4, "craft:discord-stroke")
        end
    end)

    -- ── Verify button ─────────────────────────────────────────────────────────
    local VerifyBtn = Instance.new("TextButton")
    VerifyBtn.Size             = UDim2.new(0.85, 0, 0, 52)
    VerifyBtn.Position         = UDim2.new(0.5, 0, 0, 320)
    VerifyBtn.AnchorPoint      = Vector2.new(0.5, 0)
    VerifyBtn.BackgroundColor3 = T.Secondary
    VerifyBtn.BackgroundTransparency = 1
    VerifyBtn.BorderSizePixel  = 0
    VerifyBtn.Text             = ""
    VerifyBtn.AutoButtonColor  = false
    VerifyBtn.ZIndex           = 11
    VerifyBtn.Parent           = Card
    MakeCorner(VerifyBtn, UDim.new(0, 16))

    local VerifyGradient = Instance.new("UIGradient")
    VerifyGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, T.Secondary),
        ColorSequenceKeypoint.new(1, T.Primary),
    })
    VerifyGradient.Rotation = 45
    VerifyGradient.Parent   = VerifyBtn

    local VerifyStroke = MakeStroke(VerifyBtn, T.Accent, 1, 1)

    local VerifyContent = Instance.new("Frame")
    VerifyContent.Size             = UDim2.fromScale(1, 1)
    VerifyContent.BackgroundTransparency = 1
    VerifyContent.ZIndex           = 12
    VerifyContent.Parent           = VerifyBtn

    local VerifyIcon = Instance.new("ImageLabel")
    VerifyIcon.Size               = UDim2.fromOffset(20, 20)
    VerifyIcon.Position           = UDim2.new(0.5, -50, 0.5, 0)
    VerifyIcon.AnchorPoint        = Vector2.new(0.5, 0.5)
    VerifyIcon.BackgroundTransparency = 1
    VerifyIcon.ImageColor3        = T.Text
    VerifyIcon.ImageTransparency  = 1
    VerifyIcon.ZIndex             = 13
    VerifyIcon.Parent             = VerifyContent
    ApplyIcon(VerifyIcon, "shield-check")

    local VerifyText = Instance.new("TextLabel")
    VerifyText.Size               = UDim2.new(1, -40, 1, 0)
    VerifyText.Position           = UDim2.new(0.5, 10, 0, 0)
    VerifyText.AnchorPoint        = Vector2.new(0.5, 0)
    VerifyText.BackgroundTransparency = 1
    VerifyText.Text               = CFG.ButtonText
    VerifyText.TextColor3         = T.Text
    VerifyText.TextSize           = 14
    VerifyText.Font               = Enum.Font.GothamBlack
    VerifyText.TextTransparency   = 1
    VerifyText.ZIndex             = 13
    VerifyText.Parent             = VerifyContent

    VerifyBtn.MouseEnter:Connect(function()
        Tween(VerifyBtn,    {Size = UDim2.new(0.88, 0, 0, 56), Position = UDim2.new(0.5, 0, 0, 318)}, 0.2, Enum.EasingStyle.Back)
        Tween(VerifyStroke, {Transparency = 0.3}, 0.2)
    end)
    VerifyBtn.MouseLeave:Connect(function()
        Tween(VerifyBtn,    {Size = UDim2.new(0.85, 0, 0, 52), Position = UDim2.new(0.5, 0, 0, 320)}, 0.2)
        Tween(VerifyStroke, {Transparency = 0.7}, 0.2)
    end)

    -- ── Get key button ────────────────────────────────────────────────────────
    local GetKeyBtn = Instance.new("TextButton")
    GetKeyBtn.Size             = UDim2.new(0.85, 0, 0, 48)
    GetKeyBtn.Position         = UDim2.new(0.5, 0, 0, 382)
    GetKeyBtn.AnchorPoint      = Vector2.new(0.5, 0)
    GetKeyBtn.BackgroundColor3 = T.ButtonSec
    GetKeyBtn.BackgroundTransparency = 1
    GetKeyBtn.BorderSizePixel  = 0
    GetKeyBtn.Text             = ""
    GetKeyBtn.AutoButtonColor  = false
    GetKeyBtn.ZIndex           = 11
    GetKeyBtn.Parent           = Card
    MakeCorner(GetKeyBtn, UDim.new(0, 16))
    local GetKeyStroke = MakeStroke(GetKeyBtn, T.TextMuted, 1, 1)

    local GetKeyContent = Instance.new("Frame")
    GetKeyContent.Size             = UDim2.fromScale(1, 1)
    GetKeyContent.BackgroundTransparency = 1
    GetKeyContent.ZIndex           = 12
    GetKeyContent.Parent           = GetKeyBtn

    local GetKeyIcon = Instance.new("ImageLabel")
    GetKeyIcon.Size               = UDim2.fromOffset(18, 18)
    GetKeyIcon.Position           = UDim2.new(0.5, -55, 0.5, 0)
    GetKeyIcon.AnchorPoint        = Vector2.new(0.5, 0.5)
    GetKeyIcon.BackgroundTransparency = 1
    GetKeyIcon.ImageColor3        = T.TextDim
    GetKeyIcon.ImageTransparency  = 1
    GetKeyIcon.ZIndex             = 13
    GetKeyIcon.Parent             = GetKeyContent
    ApplyIcon(GetKeyIcon, "external-link")

    local GetKeyText = Instance.new("TextLabel")
    GetKeyText.Size               = UDim2.new(1, -40, 1, 0)
    GetKeyText.Position           = UDim2.new(0.5, 5, 0, 0)
    GetKeyText.AnchorPoint        = Vector2.new(0.5, 0)
    GetKeyText.BackgroundTransparency = 1
    GetKeyText.Text               = CFG.GetKeyText
    GetKeyText.TextColor3         = T.TextDim
    GetKeyText.TextSize           = 13
    GetKeyText.Font               = Enum.Font.GothamBold
    GetKeyText.TextTransparency   = 1
    GetKeyText.ZIndex             = 13
    GetKeyText.Parent             = GetKeyContent

    local GetKeyUnderline = Instance.new("Frame")
    GetKeyUnderline.Size             = UDim2.new(0, 0, 0, 2)
    GetKeyUnderline.Position         = UDim2.new(0.5, 0, 1, -8)
    GetKeyUnderline.AnchorPoint      = Vector2.new(0.5, 0)
    GetKeyUnderline.BackgroundColor3 = T.Primary
    GetKeyUnderline.BorderSizePixel  = 0
    GetKeyUnderline.ZIndex           = 13
    GetKeyUnderline.Parent           = GetKeyBtn
    MakeCorner(GetKeyUnderline, UDim.new(1, 0))

    GetKeyBtn.MouseEnter:Connect(function()
        Tween(GetKeyUnderline, {Size = UDim2.new(0.5, 0, 0, 2)}, 0.3)
        Tween(GetKeyText,      {TextColor3 = T.Text}, 0.2)
        Tween(GetKeyIcon,      {ImageColor3 = T.Primary}, 0.2)
    end)
    GetKeyBtn.MouseLeave:Connect(function()
        Tween(GetKeyUnderline, {Size = UDim2.new(0, 0, 0, 2)}, 0.3)
        Tween(GetKeyText,      {TextColor3 = T.TextDim}, 0.2)
        Tween(GetKeyIcon,      {ImageColor3 = T.TextDim}, 0.2)
    end)

    -- ── Remember-key toggle ───────────────────────────────────────────────────
    local RememberSection = Instance.new("Frame")
    RememberSection.Size             = UDim2.new(0.85, 0, 0, 40)
    RememberSection.Position         = UDim2.new(0.5, 0, 0, 440)
    RememberSection.AnchorPoint      = Vector2.new(0.5, 0)
    RememberSection.BackgroundTransparency = 1
    RememberSection.Visible          = false
    RememberSection.ZIndex           = 11
    RememberSection.Parent           = Card

    local RememberIcon = Instance.new("ImageLabel")
    RememberIcon.Size               = UDim2.fromOffset(16, 16)
    RememberIcon.Position           = UDim2.new(0, 0, 0.5, 0)
    RememberIcon.AnchorPoint        = Vector2.new(0, 0.5)
    RememberIcon.BackgroundTransparency = 1
    RememberIcon.ImageColor3        = T.TextDim
    RememberIcon.ZIndex             = 12
    RememberIcon.Parent             = RememberSection
    ApplyIcon(RememberIcon, "bookmark")

    local RememberLabel = Instance.new("TextLabel")
    RememberLabel.Size               = UDim2.new(0.6, 0, 1, 0)
    RememberLabel.Position           = UDim2.new(0, 24, 0, 0)
    RememberLabel.BackgroundTransparency = 1
    RememberLabel.Text               = "Remember Key"
    RememberLabel.TextColor3         = T.TextDim
    RememberLabel.TextSize           = 13
    RememberLabel.Font               = Enum.Font.GothamMedium
    RememberLabel.TextXAlignment     = Enum.TextXAlignment.Left
    RememberLabel.ZIndex             = 12
    RememberLabel.Parent             = RememberSection

    local ToggleTrack = Instance.new("Frame")
    ToggleTrack.Size             = UDim2.fromOffset(50, 28)
    ToggleTrack.Position         = UDim2.new(1, 0, 0.5, 0)
    ToggleTrack.AnchorPoint      = Vector2.new(1, 0.5)
    ToggleTrack.BackgroundColor3 = Color3.fromHex("#2a2a3a")
    ToggleTrack.BorderSizePixel  = 0
    ToggleTrack.ZIndex           = 12
    ToggleTrack.Parent           = RememberSection
    MakeCorner(ToggleTrack, UDim.new(1, 0))

    local ToggleKnob = Instance.new("Frame")
    ToggleKnob.Size             = UDim2.fromOffset(22, 22)
    ToggleKnob.Position         = UDim2.new(0, 3, 0.5, 0)
    ToggleKnob.AnchorPoint      = Vector2.new(0, 0.5)
    ToggleKnob.BackgroundColor3 = T.Text
    ToggleKnob.BorderSizePixel  = 0
    ToggleKnob.ZIndex           = 13
    ToggleKnob.Parent           = ToggleTrack
    MakeCorner(ToggleKnob, UDim.new(1, 0))
    MakeStroke(ToggleKnob, Color3.new(0, 0, 0), 1, 0.85)

    local ToggleHitbox = Instance.new("TextButton")
    ToggleHitbox.Size             = UDim2.fromScale(1, 1)
    ToggleHitbox.BackgroundTransparency = 1
    ToggleHitbox.Text             = ""
    ToggleHitbox.ZIndex           = 14
    ToggleHitbox.Parent           = ToggleTrack

    local function SetRemember(on)
        State.rememberKey = on
        if on then
            Tween(ToggleKnob,  {Position = UDim2.new(1, -25, 0.5, 0)}, 0.25, Enum.EasingStyle.Back)
            Tween(ToggleTrack, {BackgroundColor3 = T.Primary}, 0.25)
            Tween(RememberIcon, {ImageColor3 = T.Primary}, 0.2)
        else
            Tween(ToggleKnob,  {Position = UDim2.new(0, 3, 0.5, 0)}, 0.25, Enum.EasingStyle.Back)
            Tween(ToggleTrack, {BackgroundColor3 = Color3.fromHex("#2a2a3a")}, 0.25)
            Tween(RememberIcon, {ImageColor3 = T.TextDim}, 0.2)
            DeleteSavedKey(SAVE_FILE)
        end
    end

    ToggleHitbox.MouseButton1Click:Connect(function() SetRemember(not State.rememberKey) end)

    -- ── Version ───────────────────────────────────────────────────────────────
    local VersionLabel = Instance.new("TextLabel")
    VersionLabel.Size               = UDim2.new(1, 0, 0, 16)
    VersionLabel.Position           = UDim2.new(0, 0, 1, -20)
    VersionLabel.BackgroundTransparency = 1
    VersionLabel.Text               = CFG.VersionText
    VersionLabel.TextColor3         = Color3.fromHex("#3a3a4a")
    VersionLabel.Font               = Enum.Font.Gotham
    VersionLabel.TextSize           = 10
    VersionLabel.TextTransparency   = 1
    VersionLabel.ZIndex             = 11
    VersionLabel.Parent             = Card

    -- ── Shake ─────────────────────────────────────────────────────────────────
    local function ShakeCard()
        local orig = CardContainer.Position
        for _ = 1, 6 do
            CardContainer.Position = UDim2.new(0.5, math.random(-10, 10), 0.5, math.random(-4, 4))
            task.wait(0.04)
        end
        Tween(CardContainer, {Position = orig}, 0.15)
    end

    -- ── Success close — clean unified exit animation ───────────────────────────
    -- Card border pulses green, then the whole thing slides up & fades like minimize.
    local function SuccessClose()
        -- Step 1: card border flashes green
        Tween(CardBorder, {Color = T.Success, Transparency = 0, Thickness = 2.5},
            AT(0.35), Enum.EasingStyle.Sine)
        Tween(LogoRingBorder, {Color = T.Success, Transparency = 0},
            AT(0.35), Enum.EasingStyle.Sine)
        Tween(OuterGlow, {BackgroundColor3 = T.Success, BackgroundTransparency = 0.7},
            AT(0.35), Enum.EasingStyle.Sine)

        task.wait(AT(0.55))

        -- Step 2: pulse the border once more for a nice beat
        Tween(CardBorder, {Transparency = 0.55}, AT(0.3), Enum.EasingStyle.Sine)
        task.wait(AT(0.3))
        Tween(CardBorder, {Transparency = 0},    AT(0.25), Enum.EasingStyle.Sine)
        task.wait(AT(0.3))

        -- Step 3: use the exact same hide animation as the minimize button
        HideEverything(function()
            -- After the slide, destroy the GUI and load the game script
            if GUI and GUI.Parent then GUI:Destroy() end
            task.wait(0.1)

            local ok, err = pcall(function()
                if type(gameConfig.Script) == "function" then
                    gameConfig.Script()
                elseif type(gameConfig.Script) == "string" then
                    local gameUrl = gameConfig.Script
                    if not gameUrl:find("%?") then gameUrl = gameUrl .. "?v=" .. tick() end
                    loadstring(game:HttpGet(gameUrl))()
                end
            end)
            if not ok then warn("[ChronosHUB] Script load error: " .. tostring(err)) end
        end)
    end

    -- ── Handle check result ───────────────────────────────────────────────────
    local function HandleCheckResult(result, key, isAuto)
        if type(result) ~= "table" then
            warn("[ChronosHUB] check_key returned: " .. tostring(result))
            if not isAuto then ShowStatus("Unexpected response.", T.Error, 4, "alert-circle"); ShakeCard() end
            return false
        end

        if result.valid == true then
            local isKeyless     = (result.message == "KEYLESS")
            local isPremium, expiresAt, discordName
            pcall(function() isPremium   = getgenv().JD_IS_PREMIUM         end)
            pcall(function() expiresAt   = getgenv().JD_EXPIRES_AT         end)
            pcall(function() discordName = getgenv().JD_DISCORD_USERNAME   end)

            local msg, col, ico
            if isKeyless then
                msg = "Keyless mode active!"
                col = T.Success
                ico = "sparkles"
            elseif isPremium then
                msg = "Premium Access Granted!"
                col = T.Premium
                ico = "crown"
            else
                msg = "Access Granted!"
                col = T.Success
                ico = "check-circle"
            end

            if expiresAt and type(expiresAt) == "number" then
                local tl = FormatTimeLeft(expiresAt)
                if tl then msg = msg .. "  (" .. tl .. ")" end
            end
            if discordName and type(discordName) == "string" and discordName ~= "" then
                msg = msg .. "  · " .. discordName
            end

            ShowStatus(msg, col, nil, ico)
            VerifyText.Text = "SUCCESS"
            ApplyIcon(VerifyIcon, "check")
            VerifyGradient.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, isPremium and T.Premium or T.Success),
                ColorSequenceKeypoint.new(1, isPremium and Color3.fromHex("#f59e0b") or Color3.fromHex("#22c55e")),
            })

            if State.rememberKey and not isKeyless then SaveKey(SAVE_FILE, key) end
            getgenv().SCRIPT_KEY = isKeyless and "KEYLESS" or key

            task.wait(AT(1.5))
            SuccessClose()
            return true
        end

        State.attempts = State.attempts + 1
        local errorCode = result.error or "ERROR"
        local mapped    = ERROR_MAP[errorCode]

        if mapped then
            ShowStatus(mapped.msg, mapped.color, nil, mapped.icon)
            if mapped.kick then
                task.wait(1.5)
                pcall(function() LocalPlayer:Kick("[ChronosHUB] " .. mapped.msg) end)
                return false
            end
        elseif type(errorCode) == "string" and errorCode:match("^http %d+") then
            ShowStatus("Server error: " .. errorCode, T.Error, 4, "alert-circle")
        else
            ShowStatus("Error: " .. tostring(errorCode), T.Error, 4, "x-circle")
        end

        VerifyGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, T.Error),
            ColorSequenceKeypoint.new(1, Color3.fromHex("#dc2626")),
        })
        ShakeCard()
        task.wait(0.4)
        VerifyGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, T.Secondary),
            ColorSequenceKeypoint.new(1, T.Primary),
        })

        VerifyText.Text = CFG.ButtonText
        ApplyIcon(VerifyIcon, "shield-check")

        if State.attempts >= State.maxAttempts then
            ShowStatus("Too many failed attempts.", T.Error, nil, "lock")
            VerifyText.Text = "LOCKED"
            State.locked    = true
        end

        return false
    end

    -- ── Verify ────────────────────────────────────────────────────────────────
    VerifyKey = function(key, isAuto)
        if State.verifying or State.locked then return end
        key = key and key:match("^%s*(.-)%s*$") or ""

        if key == "" then
            if not isAuto then ShowStatus("Please enter a key!", T.Warning, 2.5, "alert-triangle"); ShakeCard() end
            return
        end

        if State.attempts >= State.maxAttempts then
            ShowStatus("Too many failed attempts.", T.Error, nil, "lock")
            VerifyText.Text = "LOCKED"
            State.locked    = true
            return
        end

        if not Junkie or not State.sdkReady then
            ShowStatus("SDK not ready. Please wait...", T.Warning, 3, "loader-2")
            return
        end

        State.verifying = true
        VerifyText.Text = "VERIFYING..."
        ApplyIcon(VerifyIcon, "loader-2")
        ShowStatus("Checking key...", T.Accent, nil, "loader-2")
        task.wait(0.3)

        local result
        local callOk, callErr = pcall(function() result = Junkie.check_key(key) end)
        if not callOk then
            warn("[ChronosHUB] check_key error: " .. tostring(callErr))
            ShowStatus("Request failed: " .. tostring(callErr), T.Error, 4, "wifi-off")
            VerifyText.Text = CFG.ButtonText
            ApplyIcon(VerifyIcon, "shield-check")
            State.verifying = false
            ShakeCard()
            return
        end

        HandleCheckResult(result, key, isAuto)
        State.verifying = false
    end

    -- ── Button connections ────────────────────────────────────────────────────
    VerifyBtn.MouseButton1Click:Connect(function()
        if not State.verifying and not State.locked then
            task.spawn(VerifyKey, KeyInput.Text, false)
        end
    end)

    GetKeyBtn.MouseButton1Click:Connect(function()
        if not Junkie or not State.sdkReady then
            ShowStatus("SDK not ready.", T.Warning, 3, "alert-triangle")
            return
        end

        ShowStatus("Generating key link...", T.Accent, nil, "link")
        task.spawn(function()
            local link, linkErr
            local callOk, callErrMsg = pcall(function() link, linkErr = Junkie.get_key_link() end)
            if not callOk then
                warn("[ChronosHUB] get_key_link error: " .. tostring(callErrMsg))
                ShowStatus("Request failed.", T.Error, 4, "wifi-off")
                return
            end

            if link and type(link) == "string" and link ~= "" then
                local copied = false
                pcall(function() if setclipboard then setclipboard(link); copied = true end end)
                if copied then
                    ShowStatus("Key link copied!", T.Success, 4, "clipboard-check")
                else
                    ShowStatus("Link: " .. link, T.Accent, 10, "link")
                end
            else
                local errStr = tostring(linkErr or "unknown")
                if errStr == "RATE_LIMITTED" then
                    ShowStatus("Rate limited. Wait 5 minutes.", T.Warning, 5, "clock")
                else
                    ShowStatus("Failed: " .. errStr, T.Error, 4, "alert-circle")
                end
            end
        end)
    end)

    -- ── Ambient animations ─────────────────────────────────────────────────────
    task.spawn(function()
        while GUI and GUI.Parent do
            if not State.minimized then
                Tween(LogoContainer, {Position = UDim2.new(0.5, 0, 0, 48)}, AT(2), Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
                task.wait(AT(2))
                if not GUI or not GUI.Parent or State.minimized then break end
                Tween(LogoContainer, {Position = UDim2.new(0.5, 0, 0, 52)}, AT(2), Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
                task.wait(AT(2))
            else task.wait(0.1) end
        end
    end)

    task.spawn(function()
        while GUI and GUI.Parent do
            if not State.minimized then
                Tween(KeyIconHolder, {Size = UDim2.fromOffset(39, 39)}, AT(1.2), Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
                task.wait(AT(1.2))
                if not GUI or not GUI.Parent or State.minimized then break end
                Tween(KeyIconHolder, {Size = UDim2.fromOffset(34, 34)}, AT(1.2), Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
                task.wait(AT(1.2))
            else task.wait(0.1) end
        end
    end)

    task.spawn(function()
        local off = 0
        while GUI and GUI.Parent do
            if not State.minimized then off = (off + 0.005) % 1; TitleGradient.Offset = Vector2.new(off - 0.5, 0) end
            task.wait(0.03)
        end
    end)

    task.spawn(function()
        while GUI and GUI.Parent do
            if not State.minimized then
                Tween(CardBorder, {Transparency = 0.6}, AT(1.8), Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
                task.wait(AT(1.8))
                if not GUI or not GUI.Parent or State.minimized then break end
                Tween(CardBorder, {Transparency = 0.25}, AT(1.8), Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
                task.wait(AT(1.8))
            else task.wait(0.1) end
        end
    end)

    task.spawn(function()
        while GUI and GUI.Parent do
            if not State.minimized then
                Tween(OuterGlow, {BackgroundTransparency = 0.82}, AT(1.5), Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
                task.wait(AT(1.5))
                if not GUI or not GUI.Parent or State.minimized then break end
                Tween(OuterGlow, {BackgroundTransparency = 0.92}, AT(1.5), Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
                task.wait(AT(1.5))
            else task.wait(0.1) end
        end
    end)

    task.spawn(function()
        while GUI and GUI.Parent do
            if not State.minimized then
                for i, dot in ipairs(DecoDots) do
                    task.delay(i * 0.08, function()
                        if not GUI or not GUI.Parent or State.minimized then return end
                        Tween(dot, {BackgroundTransparency = 0.25}, AT(0.4))
                        task.wait(AT(0.4))
                        if not GUI or not GUI.Parent or State.minimized then return end
                        Tween(dot, {BackgroundTransparency = 0.65}, AT(0.4))
                    end)
                end
                task.wait(AT(1.5))
            else task.wait(0.1) end
        end
    end)

    -- ── Entrance animation ─────────────────────────────────────────────────────
    task.spawn(function()
        task.wait(0.2)

        Tween(CardContainer, {Position = UDim2.fromScale(0.5, 0.5)}, AT(0.9), Enum.EasingStyle.Back)
        Tween(Card, {BackgroundTransparency = 0.02}, AT(0.7))

        for i, sd in ipairs(ShadowFrames) do
            task.delay(i * 0.05, function() Tween(sd.frame, {BackgroundTransparency = sd.target}, AT(0.7)) end)
        end

        Tween(CardBorder, {Transparency = 0.4}, AT(0.7))

        task.wait(AT(0.1))
        Tween(LogoRing,       {BackgroundTransparency = 0.2}, AT(0.5))
        Tween(LogoRingBorder, {Transparency = 0.15}, AT(0.5))
        Tween(OuterGlow,      {BackgroundTransparency = 0.88}, AT(0.5))
        Tween(KeyIcon,        {ImageTransparency = 0}, AT(0.6))

        Tween(MinBtn,       {BackgroundTransparency = 0.3}, AT(0.5))
        Tween(MinBtnIcon,   {ImageTransparency = 0}, AT(0.5))
        Tween(MinBtnStroke, {Transparency = 0.7}, AT(0.5))

        Tween(DiscordBtn,       {BackgroundTransparency = 0.3}, AT(0.5))
        Tween(DiscordBtnIcon,   {ImageTransparency = 0}, AT(0.5))
        Tween(DiscordBtnStroke, {Transparency = 0.7}, AT(0.5))

        for i, dot in ipairs(DecoDots) do
            task.delay(i * 0.05, function() Tween(dot, {BackgroundTransparency = 0.5}, AT(0.4)) end)
        end

        task.wait(AT(0.15))
        Tween(WelcomeText,   {TextTransparency = 0}, AT(0.5))
        Tween(TitleLabel,    {TextTransparency = 0}, AT(0.6))
        Tween(SubtitleLabel, {TextTransparency = 0}, AT(0.5))

        task.wait(AT(0.1))
        Tween(InputLabel,     {TextTransparency = 0}, AT(0.5))
        Tween(InputContainer, {BackgroundTransparency = 0}, AT(0.5))
        Tween(InputStroke,    {Transparency = 0.3}, AT(0.5))
        Tween(InputIcon,      {ImageTransparency = 0.3}, AT(0.5))
        Tween(KeyInput,       {TextTransparency = 0}, AT(0.5))

        task.wait(AT(0.1))
        Tween(VerifyBtn,    {BackgroundTransparency = 0}, AT(0.5))
        Tween(VerifyStroke, {Transparency = 0.7}, AT(0.5))
        Tween(VerifyIcon,   {ImageTransparency = 0}, AT(0.5))
        Tween(VerifyText,   {TextTransparency = 0}, AT(0.5))

        task.wait(AT(0.08))
        Tween(GetKeyBtn,    {BackgroundTransparency = 0}, AT(0.5))
        Tween(GetKeyStroke, {Transparency = 0.7}, AT(0.5))
        Tween(GetKeyIcon,   {ImageTransparency = 0}, AT(0.5))
        Tween(GetKeyText,   {TextTransparency = 0}, AT(0.5))

        task.wait(AT(0.1))
        RememberSection.Visible = true
        Tween(VersionLabel, {TextTransparency = 0}, AT(0.5))
    end)

    -- ── SDK load + auto verify ────────────────────────────────────────────────
    task.spawn(function()
        if CFG.Debug == true then
            ShowStatus("Debug mode — bypassing key check...", T.Warning, nil, "bug")
            task.wait(AT(1))
            ShowStatus("Loading script...", T.Success, nil, "check-circle")
            VerifyText.Text = "DEBUG MODE"
            ApplyIcon(VerifyIcon, "bug")
            VerifyGradient.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, T.Warning),
                ColorSequenceKeypoint.new(1, Color3.fromHex("#f59e0b")),
            })
            task.wait(AT(1))
            SuccessClose()
            return
        end

        ShowStatus("Loading SDK...", T.Accent, nil, "download")

        local sdkOk = false
        local loadOk, loadErr = pcall(function()
            local lib = loadstring(game:HttpGet("https://jnkie.com/sdk/library.lua"))()
            if lib then
                lib.service    = gameConfig.Junkie.Service
                lib.identifier = gameConfig.Junkie.Identifier
                lib.provider   = gameConfig.Junkie.Provider
                Junkie         = lib
                State.sdkReady = true
                sdkOk          = true
            end
        end)

        if not sdkOk then
            warn("[ChronosHUB] SDK load failed: " .. tostring(loadErr))
            ShowStatus("SDK failed to load.", T.Error, nil, "alert-triangle")
            return
        end

        ShowStatus("SDK loaded.", T.Success, AT(1), "check-circle")
        task.wait(AT(0.5))

        ShowStatus("Checking access mode...", T.Accent, nil, "unlock")
        task.wait(0.3)

        local probeResult
        local probeOk, probeErr = pcall(function() probeResult = Junkie.check_key("KEYLESS") end)

        if probeOk and type(probeResult) == "table" and probeResult.valid == true then
            HandleCheckResult(probeResult, "KEYLESS", true)
            return
        end

        if probeOk then
            warn("[ChronosHUB] Keyless probe: valid=" .. tostring(probeResult and probeResult.valid) ..
                " error=" .. tostring(probeResult and probeResult.error))
        else
            warn("[ChronosHUB] Keyless probe error: " .. tostring(probeErr))
        end

        State.attempts = 0

        local saved = LoadSavedKey(SAVE_FILE)
        if saved and saved ~= "" then
            ShowStatus("Found saved key. Verifying...", T.Accent, nil, "key")
            KeyInput.Text = saved
            SetRemember(true)
            task.wait(0.3)
            VerifyKey(saved, true)
        else
            HideStatus()
        end
    end)
end

return Library