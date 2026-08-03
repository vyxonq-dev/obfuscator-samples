--[[


    License:
    This project is open source and free to use. You are permitted to modify,
    reuse, and redistribute this script for any purpose. Credit is appreciated but
    not required. Authored by the SouljaWitchSrc community.

]]

--================================================================================--
--[[ SERVICES ]]--
--================================================================================--
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local HttpService = game:GetService("HttpService")

--================================================================================--
--[[ SINGLETON & ENVIRONMENT CHECK ]]--
--================================================================================--
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local existingLoader = playerGui:FindFirstChild("SoujaHubLoader")
if existingLoader then
    warn("[SoujaHub] Found a lingering loader instance. Destroying it to ensure a clean execution.")
    existingLoader:Destroy()
    task.wait(0.1)
end

--================================================================================--
--[[ CONFIGURATION ]]--
--================================================================================--
local Config = {
    HubName = "SOUJA HUB",
    Subtitle = "Public Version",
    LogoLetter = "S",
    ImageLogo = "",
    LoadTime = 8,
    MinLoadTime = 2,
    Version = "2.3",
    ActiveTheme = "Discord",
    ThemeURL = "https://raw.githubusercontent.com/DozeIsOkLol/Soulja/refs/heads/main/loader/themes.json",
    Themes = {},
    StatusCheckEnabled = true,
    WhitelistEnabled = false,
    VersionCheckEnabled = true,
    ChangelogEnabled = true,
    AudioVisEnabled = true,
    HttpRetries = 3, -- How many times to retry a failed HTTP request.
    StatusURL = "https://raw.githubusercontent.com/DozeIsOkLol/Soulja/refs/heads/main/loader/status.json",
    WhitelistURL = "https://raw.githubusercontent.com/DozeIsOkLol/Soulja/refs/heads/main/loader/Whitelist.txt",
    VersionCheckURL = "https://raw.githubusercontent.com/DozeIsOkLol/Soulja/refs/heads/main/loader/Version.txt",
    ChangelogURL = "https://raw.githubusercontent.com/DozeIsOkLol/Soulja/refs/heads/main/loader/Changelog.txt",
    Scripts = {
        [142823291] = "https://raw.githubusercontent.com/KuniX99/MurderMystery2/refs/heads/main/main.lua",
        [920587237] = "https://raw.githubusercontent.com/KuniX99/AdoptMe/refs/heads/main/main.lua",
        Default = "https://raw.githubusercontent.com/Sabscripterhahaha/Universal/refs/heads/main/Universal",
    },
    Messages = {"Connecting...","Authenticating...","Downloading assets...","Configuring environment...","Building interface...","Finalizing..."},
    Tips = {"Did you know? You can customize the settings in the hub.","Check out our community for support and updates!","New features are added regularly!"},
    TipDisplayChance = 0.3,
    Sounds = { Open = "rbxassetid/913363037", Update = "rbxassetid/6823769213", Success = "rbxassetid/10895847421", Failure = "rbxassetid/142642633", TipPing = "rbxassetid/5151558373" },
    SoundVolume = 0.7,
    IntroAnimationTime = 0.6, OutroAnimationTime = 0.5, TextFadeTime = 0.4, TipAnimationSpeed = 0.3, ProgressShineSpeed = 1.5, ProgressShimmerSpeed = 1.0, LogoHoverTime = 0.2,
    LoaderWidth = 420, LoaderHeight = 260, LogoCircleSize = 70, LogoInnerSize = 58, LogoHoverScale = 1.07, LogoCircleCornerRadius = 15, LogoInnerCornerRadius = 12, ProgressBarHeight = 7, ProgressBarCornerRadius = 1, ContainerCornerRadius = 20, ContainerBorderThickness = 3,
    ThemeValues = {
        SuccessFlashTransparency = 0.4, SuccessFlashThickness = 4, ProgressBarShineColor = Color3.fromRGB(255, 255, 255),
        ProgressBarShineTransparency = NumberSequence.new{ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.5, 0.6), NumberSequenceKeypoint.new(1, 1) },
        ProgressBarShimmerTransparency = NumberSequence.new{ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.4, 0.8), NumberSequenceKeypoint.new(0.5, 0.7), NumberSequenceKeypoint.new(0.6, 0.8), NumberSequenceKeypoint.new(1, 1) }
    },
    Fonts = { Main = Enum.Font.GothamBold, Secondary = Enum.Font.Gotham, Code = Enum.Font.Code },
    InitialBlurSize = 12
}

--================================================================================--
--[[ STATE & UI MANAGEMENT ]]--
--================================================================================--
local State = {
    currentPercent = 0,
    loadingFinished = false,
    baseStatusText = "Initializing...",
    tipDebounce = false,
    isChangelogBusy = false
}
local UI = {}

--================================================================================--
--[[ HELPER FUNCTIONS ]]--
--================================================================================--
--- Performs a robust HttpGet request with a specified number of retries.
--- @param url string The URL to request.
--- @return boolean success, string|nil result
local function RobustHttpGet(url)
    for i = 1, Config.HttpRetries do
        local success, result = pcall(function() return game:HttpGet(url) end)
        if success and type(result) == "string" and #result > 0 then
            return true, result
        end
        warn(("[SoujaHub] HTTP request to '%s' failed (Attempt %d/%d). Retrying..."):format(tostring(url), i, Config.HttpRetries))
        task.wait(0.5) -- Wait before retrying
    end
    return false, ("Failed to fetch content from '%s' after %d attempts."):format(tostring(url), Config.HttpRetries)
end

local function CreateBrighterColor(color, increaseFactor)
    increaseFactor = increaseFactor or 1.3
    local h, s, v = Color3.toHSV(color)
    return Color3.fromHSV(h, s, math.min(1, v * increaseFactor))
end

--================================================================================--
--[[ THEME LOADER ]]--
--================================================================================--
local function LoadThemes()
    local success, rawJson = RobustHttpGet(Config.ThemeURL)
    if success then
        local decodeSuccess, decodedThemes = pcall(function() return HttpService:JSONDecode(rawJson) end)
        if decodeSuccess and type(decodedThemes) == "table" then
            local count = 0
            for themeName, themeData in pairs(decodedThemes) do
                local newTheme = {}; for colorName, colorArray in pairs(themeData) do if type(colorArray) == "table" and #colorArray == 3 then newTheme[colorName] = Color3.fromRGB(colorArray[1], colorArray[2], colorArray[3]) end end
                Config.Themes[themeName] = newTheme; count = count + 1
            end
            warn("[SoujaHub] Successfully loaded " .. count .. " external themes.")
            return
        else warn("[SoujaHub] Failed to decode external themes JSON.") end
    else warn("[SoujaHub] Could not fetch external themes from URL: " .. tostring(rawJson)) end

    warn("[SoujaHub] Using failsafe default theme.")
    Config.Themes["DefaultPurple"] = { Primary = Color3.fromRGB(170, 70, 255), Background = Color3.fromRGB(20, 20, 30), BackgroundGradient = Color3.fromRGB(35, 35, 50), Text = Color3.fromRGB(255, 255, 255), MutedText = Color3.fromRGB(120, 125, 135), ProgressBackground = Color3.fromRGB(30, 32, 38), Failure = Color3.fromRGB(255, 80, 80), SuccessFlash = Color3.fromRGB(255, 255, 255) }
end

LoadThemes()
local ActiveTheme = Config.Themes[Config.ActiveTheme] or Config.Themes.DefaultPurple or Config.Themes[next(Config.Themes)]
if not ActiveTheme then error("[SoujaHub] CRITICAL: No themes could be loaded.") end

--================================================================================--
--[[ SCRIPT SETUP & PRE-CHECKS ]]--
--================================================================================--
local function runPreChecks()
    if Config.StatusCheckEnabled then
        local success, rawJson = RobustHttpGet(Config.StatusURL)
        if success then local decodeSuccess, statusData = pcall(function() return HttpService:JSONDecode(rawJson) end); if decodeSuccess and statusData and statusData.allow_load == false then return false, statusData.message or "The hub is currently offline." end end
    end
    if Config.WhitelistEnabled then
        if not Config.WhitelistURL or Config.WhitelistURL == "" then return true end
        local success, userListText = RobustHttpGet(Config.WhitelistURL)
        if not success then return false, "Could not connect to the authentication server." end
        local isWhitelisted = false; for line in userListText:gmatch("[^\r\n]+") do if line:gsub("%s+", "") == tostring(player.UserId) then isWhitelisted = true; break end end
        if not isWhitelisted then return false, "You are not authorized to use this script." end
    end
    return true
end

local isAuthorized, authMessage = runPreChecks()
if not isAuthorized then
    local authFailedGui = Instance.new("ScreenGui", playerGui); local frame = Instance.new("Frame", authFailedGui); frame.Size = UDim2.new(0, 400, 0, 100); frame.AnchorPoint = Vector2.new(0.5, 0.5); frame.Position = UDim2.new(0.5, 0, 0.5, 0); frame.BackgroundColor3 = ActiveTheme.Background; Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10); local textLabel = Instance.new("TextLabel", frame); textLabel.Size = UDim2.new(1, 0, 1, 0); textLabel.BackgroundTransparency = 1; textLabel.Text = "SoujaHub\n\nAuthentication Failed:\n" .. (authMessage or "An unknown error occurred."); textLabel.TextColor3 = ActiveTheme.Failure; textLabel.Font = Config.Fonts.Main; textLabel.TextSize = 16; textLabel.TextWrapped = true
    return
end

local SoundPlayer = {}; for name, id in pairs(Config.Sounds) do if id and id ~= "" then local sound = Instance.new("Sound"); sound.SoundId = id; sound.Volume = Config.SoundVolume; sound.Parent = SoundService; SoundPlayer[name] = sound end end
local function PlaySound(name) if SoundPlayer[name] then SoundPlayer[name]:Play() end end

--================================================================================--
--[[ UI ELEMENT CREATION ]]--
--================================================================================--
UI.Blur = Instance.new("BlurEffect", game:GetService("Lighting")); UI.Blur.Size = 0; UI.Blur.Enabled = true
UI.ScreenGui = Instance.new("ScreenGui"); UI.ScreenGui.Name = "SoujaHubLoader"; UI.ScreenGui.ResetOnSpawn = false; UI.ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling; UI.ScreenGui.DisplayOrder = 999
-- [IMPROVEMENT] Parent the ScreenGui immediately to prevent engine race conditions.
UI.ScreenGui.Parent = playerGui

UI.Container = Instance.new("Frame", UI.ScreenGui); UI.Container.Name = "Container"; UI.Container.AnchorPoint = Vector2.new(0.5, 0.5); UI.Container.Size = UDim2.new(0, 0, 0, 0); UI.Container.Position = UDim2.new(0.5, 0, 0.5, 0); UI.Container.BackgroundColor3 = ActiveTheme.Background; UI.Container.BorderSizePixel = 0; Instance.new("UICorner", UI.Container).CornerRadius = UDim.new(0, Config.ContainerCornerRadius)
UI.ContainerGradient = Instance.new("UIGradient", UI.Container); UI.ContainerGradient.Color = ColorSequence.new{ ColorSequenceKeypoint.new(0, ActiveTheme.Background), ColorSequenceKeypoint.new(1, ActiveTheme.BackgroundGradient) }; UI.ContainerGradient.Rotation = 90
UI.BorderStroke = Instance.new("UIStroke", UI.Container); UI.BorderStroke.Color = ActiveTheme.Primary; UI.BorderStroke.Thickness = Config.ContainerBorderThickness; UI.BorderStroke.Transparency = 0.2; UI.BorderStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UI.LogoCircle = Instance.new("Frame", UI.Container); UI.LogoCircle.Name = "Logo"; UI.LogoCircle.AnchorPoint = Vector2.new(0.5, 0); UI.LogoCircle.Size = UDim2.new(0, Config.LogoCircleSize, 0, Config.LogoCircleSize); UI.LogoCircle.Position = UDim2.new(0.5, 0, 0, 25); UI.LogoCircle.BackgroundColor3 = ActiveTheme.Primary; UI.LogoCircle.BorderSizePixel = 0; UI.LogoCircle.ClipsDescendants = true; Instance.new("UICorner", UI.LogoCircle).CornerRadius = UDim.new(0, Config.LogoCircleCornerRadius)
UI.LogoInner = Instance.new("Frame", UI.LogoCircle); UI.LogoInner.AnchorPoint = Vector2.new(0.5, 0.5); UI.LogoInner.Size = UDim2.new(0, Config.LogoInnerSize, 0, Config.LogoInnerSize); UI.LogoInner.Position = UDim2.new(0.5, 0, 0.5, 0); UI.LogoInner.BackgroundColor3 = ActiveTheme.Background; UI.LogoInner.BorderSizePixel = 0; Instance.new("UICorner", UI.LogoInner).CornerRadius = UDim.new(0, Config.LogoInnerCornerRadius)
if Config.ImageLogo and Config.ImageLogo ~= "" then local i = Instance.new("ImageLabel", UI.LogoInner); i.Size = UDim2.new(1,0,1,0); i.BackgroundTransparency = 1; i.Image = Config.ImageLogo else local t = Instance.new("TextLabel", UI.LogoInner); t.Size = UDim2.new(1,0,1,0); t.BackgroundTransparency = 1; t.Text = Config.LogoLetter; t.TextColor3 = ActiveTheme.Primary; t.TextSize = 36; t.Font = Config.Fonts.Main end
UI.LogoClickDetector = Instance.new("TextButton", UI.LogoCircle); UI.LogoClickDetector.Name = "ClickDetector"; UI.LogoClickDetector.Size = UDim2.new(1, 0, 1, 0); UI.LogoClickDetector.BackgroundTransparency = 1; UI.LogoClickDetector.Text = ""
UI.Title = Instance.new("TextLabel", UI.Container); UI.Title.Size = UDim2.new(1, -40, 0, 35); UI.Title.Position = UDim2.new(0, 20, 0, 105); UI.Title.BackgroundTransparency = 1; UI.Title.Text = Config.HubName; UI.Title.TextColor3 = ActiveTheme.Text; UI.Title.TextSize = 28; UI.Title.Font = Config.Fonts.Main; UI.Title.TextXAlignment = Enum.TextXAlignment.Center
UI.VersionText = Instance.new("TextLabel", UI.Container); UI.VersionText.Size = UDim2.new(1, -40, 0, 18); UI.VersionText.Position = UDim2.new(0, 20, 0, 140); UI.VersionText.BackgroundTransparency = 1; UI.VersionText.Text = Config.Subtitle; UI.VersionText.TextColor3 = ActiveTheme.MutedText; UI.VersionText.TextSize = 13; UI.VersionText.Font = Config.Fonts.Secondary; UI.VersionText.TextXAlignment = Enum.TextXAlignment.Center
UI.ProgressBg = Instance.new("Frame", UI.Container); UI.ProgressBg.Name = "progressBg"; UI.ProgressBg.Size = UDim2.new(1, -60, 0, Config.ProgressBarHeight); UI.ProgressBg.Position = UDim2.new(0, 30, 0, 175); UI.ProgressBg.BackgroundColor3 = ActiveTheme.ProgressBackground; UI.ProgressBg.BorderSizePixel = 0; Instance.new("UICorner", UI.ProgressBg).CornerRadius = UDim.new(Config.ProgressBarCornerRadius, 0)
UI.SuccessGlowStroke = Instance.new("UIStroke", UI.ProgressBg); UI.SuccessGlowStroke.Color = ActiveTheme.SuccessFlash; UI.SuccessGlowStroke.Thickness = Config.ThemeValues.SuccessFlashThickness; UI.SuccessGlowStroke.Transparency = 1
UI.ProgressFill = Instance.new("Frame", UI.ProgressBg); UI.ProgressFill.Name = "progressFill"; UI.ProgressFill.Size = UDim2.new(0, 0, 1, 0); UI.ProgressFill.BackgroundColor3 = ActiveTheme.Primary; UI.ProgressFill.BorderSizePixel = 0; UI.ProgressFill.ClipsDescendants = true; Instance.new("UICorner", UI.ProgressFill).CornerRadius = UDim.new(Config.ProgressBarCornerRadius, 0)
Instance.new("UIGradient", UI.ProgressFill).Color = ColorSequence.new{ColorSequenceKeypoint.new(0, ActiveTheme.Primary), ColorSequenceKeypoint.new(1, CreateBrighterColor(ActiveTheme.Primary))}
UI.ProgressShine = Instance.new("Frame", UI.ProgressFill); UI.ProgressShine.Name = "progressShine"; UI.ProgressShine.Size = UDim2.new(0.4, 0, 1, 0); UI.ProgressShine.Position = UDim2.new(-1, 0, 0, 0); UI.ProgressShine.BackgroundColor3 = Config.ThemeValues.ProgressBarShineColor; UI.ProgressShine.BackgroundTransparency = 0.6; UI.ProgressShine.BorderSizePixel = 0; Instance.new("UICorner", UI.ProgressShine).CornerRadius = UDim.new(Config.ProgressBarCornerRadius, 0)
Instance.new("UIGradient", UI.ProgressShine).Transparency = Config.ThemeValues.ProgressBarShineTransparency
UI.ProgressShimmer = Instance.new("UIGradient", UI.ProgressFill); UI.ProgressShimmer.Rotation = 90; UI.ProgressShimmer.Offset = Vector2.new(0, -1); UI.ProgressShimmer.Transparency = Config.ThemeValues.ProgressBarShimmerTransparency
UI.PercentText = Instance.new("TextLabel", UI.Container); UI.PercentText.Size = UDim2.new(0, 100, 0, 28); UI.PercentText.Position = UDim2.new(0.5, -50, 0, 192); UI.PercentText.BackgroundTransparency = 1; UI.PercentText.Text = "0%"; UI.PercentText.TextColor3 = ActiveTheme.Primary; UI.PercentText.TextSize = 20; UI.PercentText.Font = Config.Fonts.Main
UI.StatusText = Instance.new("TextLabel", UI.Container); UI.StatusText.Size = UDim2.new(1, -40, 0, 20); UI.StatusText.Position = UDim2.new(0, 20, 0, 230); UI.StatusText.BackgroundTransparency = 1; UI.StatusText.Text = "Initializing..."; UI.StatusText.TextColor3 = ActiveTheme.MutedText; UI.StatusText.TextSize = 12; UI.StatusText.Font = Config.Fonts.Code; UI.StatusText.TextXAlignment = Enum.TextXAlignment.Center

if Config.ChangelogEnabled then
    local changelogButton = Instance.new("TextButton", UI.Container); changelogButton.Name = "ChangelogButton"; changelogButton.Size = UDim2.new(0, 80, 0, 20); changelogButton.Position = UDim2.new(1, -90, 0, 5); changelogButton.BackgroundTransparency = 1; changelogButton.Text = "What's New?"; changelogButton.Font = Config.Fonts.Code; changelogButton.TextSize = 12; changelogButton.TextColor3 = ActiveTheme.MutedText; changelogButton.TextXAlignment = Enum.TextXAlignment.Right
    changelogButton.MouseEnter:Connect(function() TweenService:Create(changelogButton, TweenInfo.new(0.2), {TextColor3 = ActiveTheme.Text}):Play() end)
    changelogButton.MouseLeave:Connect(function() TweenService:Create(changelogButton, TweenInfo.new(0.2), {TextColor3 = ActiveTheme.MutedText}):Play() end)
    changelogButton.MouseButton1Click:Connect(function()
        if State.isChangelogBusy then return end; State.isChangelogBusy = true
        local existingPanel = UI.Container:FindFirstChild("ChangelogPanel")
        if existingPanel then
            local outroTween = TweenService:Create(existingPanel, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Size = UDim2.new(0.9, 0, 0, 0), Position = UDim2.new(0.5, 0, 1, 0)})
            outroTween:Play(); outroTween.Completed:Wait(); existingPanel:Destroy()
            return
        end
        local success, text = RobustHttpGet(Config.ChangelogURL); local panel = Instance.new("Frame", UI.Container); panel.Name = "ChangelogPanel"; panel.ClipsDescendants = true; panel.Size = UDim2.new(0.9, 0, 0, 0); panel.Position = UDim2.new(0.5, 0, 0, UI.Container.AbsoluteSize.Y); panel.AnchorPoint = Vector2.new(0.5, 0.5); panel.BackgroundColor3 = ActiveTheme.Background; panel.ZIndex = 10; Instance.new("UICorner", panel).CornerRadius = UDim.new(0, 10); Instance.new("UIStroke", panel).Color = ActiveTheme.Primary
        local scroll = Instance.new("ScrollingFrame", panel); scroll.Size = UDim2.new(1, -10, 1, -30); scroll.Position = UDim2.fromOffset(5, 5); scroll.BackgroundTransparency = 1; scroll.BorderSizePixel = 0; scroll.CanvasSize = UDim2.new(0,0,0,0); scroll.ScrollBarThickness = 6
        local label = Instance.new("TextLabel", scroll); label.Size = UDim2.new(1, 0, 0, 0); label.AutomaticSize = Enum.AutomaticSize.Y; label.BackgroundTransparency = 1; label.Text = success and text or "Could not load changelog."; label.TextColor3 = ActiveTheme.Text; label.Font = Config.Fonts.Secondary; label.TextSize = 14; label.TextXAlignment = Enum.TextXAlignment.Left; label.TextYAlignment = Enum.TextYAlignment.Top; label.TextWrapped = true
        local closeButton = Instance.new("TextButton", panel); closeButton.Size = UDim2.new(1, -10, 0, 20); closeButton.Position = UDim2.new(0, 5, 1, -25); closeButton.BackgroundTransparency = 1; closeButton.Text = "Close"; closeButton.Font = Config.Fonts.Main; closeButton.TextSize = 14; closeButton.TextColor3 = ActiveTheme.MutedText
        TweenService:Create(panel, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0.9, 0, 0.7, 0), Position = UDim2.new(0.5, 0, 0.5, 0)}):Play()
        closeButton.MouseButton1Click:Connect(function() changelogButton.MouseButton1Click:Fire() end); closeButton.MouseEnter:Connect(function() TweenService:Create(closeButton, TweenInfo.new(0.2), {TextColor3 = ActiveTheme.Text}):Play() end); closeButton.MouseLeave:Connect(function() TweenService:Create(closeButton, TweenInfo.new(0.2), {TextColor3 = ActiveTheme.MutedText}):Play() end); panel.Destroying:Connect(function() State.isChangelogBusy = false end)
    end)
end

--================================================================================--
--[[ CORE FUNCTIONS & ANIMATIONS ]]--
--================================================================================--
local function updateProgress(target, duration) local startPercent = State.currentPercent; local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out); local fillTween = TweenService:Create(UI.ProgressFill, tweenInfo, {Size = UDim2.new(target / 100, 0, 1, 0)}); fillTween:Play(); local tempNumber = Instance.new("NumberValue"); tempNumber.Value = startPercent; local textTween = TweenService:Create(tempNumber, tweenInfo, {Value = target}); textTween:Play(); local connection; connection = tempNumber.Changed:Connect(function() local newPercent = math.clamp(tempNumber.Value, 0, 100); UI.PercentText.Text = math.floor(newPercent) .. "%"; State.currentPercent = newPercent; if newPercent >= target then tempNumber:Destroy(); connection:Disconnect() end end) end
local function updateStatus(text, instant) State.baseStatusText = text; if instant then UI.StatusText.Text = text; return end; if not State.tipDebounce and #Config.Tips > 0 and math.random() < Config.TipDisplayChance then State.tipDebounce = true; local textToRestore = text; task.spawn(function() task.wait(1.5); PlaySound("TipPing"); local outTween = TweenService:Create(UI.StatusText, TweenInfo.new(Config.TipAnimationSpeed), {TextTransparency = 1}); outTween:Play(); outTween.Completed:Wait(); UI.StatusText.Text = Config.Tips[math.random(1, #Config.Tips)]; local inTween = TweenService:Create(UI.StatusText, TweenInfo.new(Config.TipAnimationSpeed), {TextTransparency = 0}); inTween:Play(); inTween.Completed:Wait(); task.wait(3); local outTween2 = TweenService:Create(UI.StatusText, TweenInfo.new(Config.TipAnimationSpeed), {TextTransparency = 1}); outTween2:Play(); outTween2.Completed:Wait(); UI.StatusText.Text = textToRestore; State.baseStatusText = textToRestore; local inTween2 = TweenService:Create(UI.StatusText, TweenInfo.new(Config.TipAnimationSpeed), {TextTransparency = 0}); inTween2:Play(); task.wait(3); State.tipDebounce = false end) else PlaySound("Update"); local outTween = TweenService:Create(UI.StatusText, TweenInfo.new(0.15), {TextTransparency = 1}); outTween:Play(); outTween.Completed:Wait(); UI.StatusText.Text = text; local inTween = TweenService:Create(UI.StatusText, TweenInfo.new(0.15), {TextTransparency = 0}); inTween:Play() end end
local function displayFatalError(userFriendlyMessage, technicalMessage) State.loadingFinished = true; updateStatus(userFriendlyMessage, true); PlaySound("Failure"); TweenService:Create(UI.BorderStroke, TweenInfo.new(0.3), {Color = ActiveTheme.Failure}):Play(); TweenService:Create(UI.ProgressFill, TweenInfo.new(0.3), {BackgroundColor3 = ActiveTheme.Failure}):Play(); local grad = UI.ProgressFill:FindFirstChildOfClass("UIGradient"); if grad then TweenService:Create(grad, TweenInfo.new(0.3), {Color = ColorSequence.new(ActiveTheme.Failure)}):Play() end; UI.PercentText.TextColor3 = ActiveTheme.Failure; local copyButton = Instance.new("TextButton", UI.Container); copyButton.Name = "CopyErrorButton"; copyButton.Size = UDim2.new(0, 100, 0, 20); copyButton.Position = UDim2.new(0, 5, 1, -25); copyButton.BackgroundTransparency = 1; copyButton.Text = "[Copy Error]"; copyButton.Font = Config.Fonts.Code; copyButton.TextSize = 12; copyButton.TextColor3 = ActiveTheme.MutedText; copyButton.TextXAlignment = Enum.TextXAlignment.Left; copyButton.MouseEnter:Connect(function() TweenService:Create(copyButton, TweenInfo.new(0.2), {TextColor3 = ActiveTheme.Text}):Play() end); copyButton.MouseLeave:Connect(function() TweenService:Create(copyButton, TweenInfo.new(0.2), {TextColor3 = ActiveTheme.MutedText}):Play() end); copyButton.MouseButton1Click:Connect(function() if setclipboard then setclipboard(technicalMessage or userFriendlyMessage); copyButton.Text = "[Copied!]"; PlaySound("Success"); task.wait(2); copyButton.Text = "[Copy Error]" else warn("[SoujaHub] Clipboard access not available.") end end) end
local function runVersionCheck() if not Config.VersionCheckEnabled then return end; task.spawn(function() local success, latestVersion = RobustHttpGet(Config.VersionCheckURL); if success and latestVersion:gsub("%s+", "") ~= Config.Version:gsub("%s+", "") then warn("[SoujaHub] Outdated! Latest: " .. latestVersion); PlaySound("TipPing"); local updateText = Instance.new("TextLabel", UI.Container); updateText.AnchorPoint = Vector2.new(0, 0); updateText.Size = UDim2.new(0, 150, 0, 20); updateText.Position = UDim2.new(0, 10, 0, 5); updateText.BackgroundTransparency = 1; updateText.Text = "Update Available! (v" .. latestVersion:gsub("%s+", "") .. ")"; updateText.TextColor3 = ActiveTheme.SuccessFlash; updateText.Font = Config.Fonts.Code; updateText.TextSize = 12; updateText.TextXAlignment = Enum.TextXAlignment.Left end end) end

--================================================================================--
--[[ MAIN EXECUTION SEQUENCE ]]--
--================================================================================--
for _, child in ipairs(UI.Container:GetDescendants()) do if child:IsA("GuiObject") then child.Transparency = 1; if child:IsA("UIStroke") then child.Transparency = 1 else child.BackgroundTransparency = 1 end; if child:IsA("TextLabel") or child:IsA("TextButton") then child.TextTransparency = 1 end; if child:IsA("ImageLabel") then child.ImageTransparency = 1 end end end
UI.LogoCircle.MouseEnter:Connect(function() TweenService:Create(UI.LogoCircle, TweenInfo.new(Config.LogoHoverTime), {Size = UDim2.new(0, Config.LogoCircleSize * Config.LogoHoverScale, 0, Config.LogoCircleSize * Config.LogoHoverScale)}):Play() end)
UI.LogoCircle.MouseLeave:Connect(function() TweenService:Create(UI.LogoCircle, TweenInfo.new(Config.LogoHoverTime), {Size = UDim2.new(0, Config.LogoCircleSize, 0, Config.LogoCircleSize)}):Play() end)
UI.LogoClickDetector.MouseButton1Click:Connect(function() PlaySound("Update") end)

PlaySound("Open"); TweenService:Create(UI.Blur, TweenInfo.new(Config.IntroAnimationTime), {Size = Config.InitialBlurSize}):Play(); local introTween = TweenService:Create(UI.Container, TweenInfo.new(Config.IntroAnimationTime, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, Config.LoaderWidth, 0, Config.LoaderHeight)}); introTween:Play(); introTween.Completed:Wait()
for _, child in ipairs(UI.Container:GetDescendants()) do if child:IsA("TextLabel") or child:IsA("TextButton") then TweenService:Create(child, TweenInfo.new(Config.TextFadeTime), {TextTransparency = 0}):Play() elseif child:IsA("ImageLabel") then TweenService:Create(child, TweenInfo.new(Config.TextFadeTime), {ImageTransparency = 0}):Play() elseif child:IsA("Frame") then local targetTransparency = (child.Name == "progressShine") and 0.6 or 0; TweenService:Create(child, TweenInfo.new(Config.TextFadeTime), {BackgroundTransparency = targetTransparency}):Play() elseif child:IsA("UIStroke") then local targetTransparency = (child == UI.SuccessGlowStroke) and 1 or 0.2; TweenService:Create(child, TweenInfo.new(Config.TextFadeTime), {Transparency = targetTransparency}):Play() end; task.wait(0.02) end

runVersionCheck()

task.spawn(function() while UI.Container.Parent and not State.loadingFinished do UI.ProgressShine.Position = UDim2.new(-0.4, 0, 0, 0); TweenService:Create(UI.ProgressShine, TweenInfo.new(Config.ProgressShineSpeed, Enum.EasingStyle.Linear), {Position = UDim2.new(1.4, 0, 0, 0)}):Play(); task.wait(Config.ProgressShineSpeed + 0.5) end end)
task.spawn(function() while UI.Container.Parent and not State.loadingFinished do UI.ProgressShimmer.Offset = Vector2.new(0, -1); TweenService:Create(UI.ProgressShimmer, TweenInfo.new(Config.ProgressShimmerSpeed, Enum.EasingStyle.Linear), {Offset = Vector2.new(0, 1)}):Play(); task.wait(Config.ProgressShimmerSpeed + 0.5) end end)
task.spawn(function() while UI.Container.Parent and not State.loadingFinished do TweenService:Create(UI.BorderStroke, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Transparency = 0.05}):Play(); task.wait(1.5); if State.loadingFinished then break end; TweenService:Create(UI.BorderStroke, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Transparency = 0.2}):Play(); task.wait(1.5) end; UI.BorderStroke.Transparency = 0.2 end)
task.spawn(function() local dotCount = 0; while UI.Container.Parent and not State.loadingFinished do if not State.tipDebounce and State.baseStatusText:find("...") then dotCount = (dotCount % 3) + 1; UI.StatusText.Text = State.baseStatusText:gsub("...", string.rep(".", dotCount)) end; task.wait(0.5) end end)

if Config.AudioVisEnabled then local audioVisualizerConnection; audioVisualizerConnection = RunService.RenderStepped:Connect(function() if State.loadingFinished or not UI.Container.Parent then audioVisualizerConnection:Disconnect(); return end; local targetThickness = Config.ContainerBorderThickness; if SoundPlayer.Update and SoundPlayer.Update.IsPlaying then targetThickness = Config.ContainerBorderThickness + (SoundPlayer.Update.PlaybackLoudness / 1000) * 2 end; UI.BorderStroke.Thickness = UI.BorderStroke.Thickness + (targetThickness - UI.BorderStroke.Thickness) * 0.2 end) end

task.spawn(function()
    local startTime = tick(); local stepDuration = Config.LoadTime / #Config.Messages
    for i, msg in ipairs(Config.Messages) do updateStatus(msg, false); updateProgress((i / #Config.Messages) * 100, stepDuration * 0.9); task.wait(stepDuration) end
    local timeElapsed = tick() - startTime; if timeElapsed < Config.MinLoadTime then task.wait(Config.MinLoadTime - timeElapsed) end

    State.loadingFinished = true; UI.LogoClickDetector.Active = false; TweenService:Create(UI.ProgressShine, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
    if UI.Container:FindFirstChild("ChangelogPanel") then UI.Container.ChangelogPanel:Destroy() end
    
    local placeId = game.PlaceId; local scriptToLoadUrl = Config.Scripts[placeId]; local statusMessage = ""
    if scriptToLoadUrl then statusMessage = "Game Found: " .. game.Name else scriptToLoadUrl = Config.Scripts.Default; statusMessage = "No Game Found: Loading Universal" end
    
    updateStatus(statusMessage, false); task.wait(1.5)

    if not scriptToLoadUrl or scriptToLoadUrl == "" then displayFatalError("FATAL: No script found!", "No script URL for PlaceID " .. placeId .. " and no Default script was configured."); return end

    local success, result = pcall(function()
        local scriptSuccess, scriptContent = RobustHttpGet(scriptToLoadUrl)
        if not scriptSuccess then error(("Failed to download script from %s. Error: %s"):format(tostring(scriptToLoadUrl), tostring(scriptContent))) end
        loadstring(scriptContent)()
    end)

    if success then
        PlaySound("Success"); updateStatus("Launched!", true); local flashIn = TweenService:Create(UI.SuccessGlowStroke, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Transparency = Config.ThemeValues.SuccessFlashTransparency}); local flashOut = TweenService:Create(UI.SuccessGlowStroke, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {Transparency = 1}); flashIn:Play(); flashIn.Completed:Connect(function() task.wait(0.1); flashOut:Play() end)
        flashOut.Completed:Connect(function()
            task.wait(0.5); TweenService:Create(UI.Blur, TweenInfo.new(Config.OutroAnimationTime), {Size = 0}):Play(); local outroTween = TweenService:Create(UI.Container, TweenInfo.new(Config.OutroAnimationTime, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0)}); outroTween:Play()
            for _, child in ipairs(UI.Container:GetDescendants()) do if child:IsA("GuiObject") then local tweenInfo = TweenInfo.new(Config.OutroAnimationTime * 0.8); if child:IsA("UIStroke") then TweenService:Create(child, tweenInfo, {Transparency = 1}):Play() else TweenService:Create(child, tweenInfo, {BackgroundTransparency = 1}):Play() end; if child:IsA("TextLabel") or child:IsA("TextButton") then TweenService:Create(child, tweenInfo, {TextTransparency = 1}):Play() end; if child:IsA("ImageLabel") then TweenService:Create(child, tweenInfo, {ImageTransparency = 1}):Play() end end end
            outroTween.Completed:Wait(); UI.ScreenGui:Destroy(); UI.Blur:Destroy()
        end)
    else displayFatalError("Error: Script failed to execute.", tostring(result)); warn("[SoujaHub] Critical Error: The main script failed to load.", result) end
end)
