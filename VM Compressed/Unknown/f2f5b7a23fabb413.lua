-- Teleport Control Center (LocalScript)
-- - Spam teleporting (starts immediately), interval = 2s by default
-- - Centered card UI with TWO LARGE CENTER BUTTONS:
--     * "Toggle Teleports" (toggles spam teleport)
--     * "Copy Discord Invite" (copies invite to clipboard)
-- - Rain overlay
-- - Player avatar restored
-- - Credit: "Made by cattosbored" with cattosbored avatar (fetched by username)
-- - Keys: P = toggle spam ON/OFF, [ / ] adjust interval, C = copy Discord invite

local Players      = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInput    = game:GetService("UserInputService")
local TextService  = game:GetService("TextService")

local player = Players.LocalPlayer

-- ===== CONFIG =====
local DISCORD_INVITE = "https://discord.gg/BR6jyxfUEw"
local DEFAULT_INTERVAL = 2.0   -- 2 seconds between teleports
local MIN_INTERVAL = 0.25
local MAX_INTERVAL = 10
local TELEPORT_TARGETS = {
    Vector3.new(148.37, 2739.52, -98.07),
    Vector3.new(112.56, 67.92, -268.69),
    Vector3.new(173.76, 49.58, 1727.13),
    Vector3.new(207.48, 69.12, -213.23),
    Vector3.new(459.27, 298.78, 24.37),
    Vector3.new(119.34, 47.73, 167.36),
    Vector3.new(36.03, 856.40, 96.80),
    Vector3.new(56.66, 66.06, -273.07),
}
-- Rain config
local RAIN_ENABLED = true
local RAIN_SPAWN_INTERVAL = 0.06
local RAIN_MAX_DROPS = 60

-- credit config
local CREATOR_USERNAME = "cattosbored" -- username to fetch avatar for credit
-- ===================

local interval = DEFAULT_INTERVAL
local spamEnabled = true        -- START SPAMMING IMMEDIATELY
local sessionStart = tick()
local teleportIndex = 1

-- helpers
local function getRootPart(char)
    if not char then return nil end
    return char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso")
end

local function formatDuration(secondsTotal)
    local sec = math.floor(secondsTotal % 60)
    local mins = math.floor((secondsTotal / 60) % 60)
    local hours = math.floor((secondsTotal / 3600) % 24)
    local days = math.floor(secondsTotal / 86400)
    return days, hours, mins, sec
end

local function trySetClipboard(text)
    local ok = false
    pcall(function()
        if setclipboard then setclipboard(text); ok = true; return end
        if syn and syn.set_clipboard then syn.set_clipboard(text); ok = true; return end
        if TextService and TextService.SetClipboard then TextService:SetClipboard(text); ok = true; return end
    end)
    return ok
end

-- Build UI (centered) and return references
local function createUI()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "TeleportControlCenter"
    screenGui.ResetOnSpawn = false
    screenGui.IgnoreGuiInset = true
    screenGui.Parent = player:WaitForChild("PlayerGui")

    -- shadow
    local Shadow = Instance.new("Frame", screenGui)
    Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
    Shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
    Shadow.Size = UDim2.new(0.64, 0, 0.48, 0)
    Shadow.BackgroundColor3 = Color3.fromRGB(0,0,0)
    Shadow.BackgroundTransparency = 0.72
    Shadow.BorderSizePixel = 0
    local sc = Instance.new("UICorner", Shadow); sc.CornerRadius = UDim.new(0, 18)

    -- card
    local Card = Instance.new("Frame", screenGui)
    Card.AnchorPoint = Vector2.new(0.5, 0.5)
    Card.Position = UDim2.new(0.5, 0, 0.5, 0)
    Card.Size = UDim2.new(0.6, 0, 0.44, 0)
    Card.BackgroundColor3 = Color3.fromRGB(16,16,16)
    Card.BackgroundTransparency = 0.05
    Card.BorderSizePixel = 0
    local cc = Instance.new("UICorner", Card); cc.CornerRadius = UDim.new(0, 18)

    -- top header area
    local Top = Instance.new("Frame", Card)
    Top.Size = UDim2.new(1, 0, 0, 78)
    Top.Position = UDim2.new(0, 0, 0, 0)
    Top.BackgroundTransparency = 1
    local grad = Instance.new("UIGradient", Top)
    grad.Color = ColorSequence.new(Color3.fromRGB(36,36,36), Color3.fromRGB(20,20,20)); grad.Rotation = 90

    -- avatar (player)
    local Avatar = Instance.new("ImageLabel", Top)
    Avatar.Name = "Avatar"
    Avatar.Size = UDim2.new(0, 56, 0, 56)
    Avatar.Position = UDim2.new(0, 14, 0, 10)
    Avatar.BackgroundTransparency = 1
    Avatar.ScaleType = Enum.ScaleType.Crop
    local avCorner = Instance.new("UICorner", Avatar); avCorner.CornerRadius = UDim.new(0,8)

    -- welcome name
    local NameLabel = Instance.new("TextLabel", Top)
    NameLabel.Position = UDim2.new(0, 80, 0, 10)
    NameLabel.Size = UDim2.new(0.6, -80, 0, 26)
    NameLabel.BackgroundTransparency = 1
    NameLabel.Font = Enum.Font.GothamBold
    NameLabel.TextSize = 18
    NameLabel.TextColor3 = Color3.fromRGB(245,245,245)
    NameLabel.TextXAlignment = Enum.TextXAlignment.Left
    NameLabel.Text = "Welcome " .. (player.DisplayName or player.Name)

    local SubLabel = Instance.new("TextLabel", Top)
    SubLabel.Position = UDim2.new(0, 80, 0, 36)
    SubLabel.Size = UDim2.new(0.6, -80, 0, 20)
    SubLabel.BackgroundTransparency = 1
    SubLabel.Font = Enum.Font.Gotham
    SubLabel.TextSize = 13
    SubLabel.TextColor3 = Color3.fromRGB(170,170,170)
    SubLabel.TextXAlignment = Enum.TextXAlignment.Left
    SubLabel.Text = "--:--:--  |  --/--/--"

    -- right-side status / interval
    local Right = Instance.new("Frame", Top)
    Right.AnchorPoint = Vector2.new(1,0)
    Right.Position = UDim2.new(1, -12, 0, 8)
    Right.Size = UDim2.new(0.36, 0, 1, -16)
    Right.BackgroundTransparency = 1

    -- STATUS DOT: positioned to right to avoid overlap
    local StatusDot = Instance.new("Frame", Right)
    StatusDot.Position = UDim2.new(1, -12, 0, 12)
    StatusDot.Size = UDim2.new(0, 12, 0, 12)
    StatusDot.AnchorPoint = Vector2.new(1,0)
    StatusDot.BackgroundColor3 = Color3.fromRGB(70,200,120)
    StatusDot.BorderSizePixel = 0
    local sdc = Instance.new("UICorner", StatusDot); sdc.CornerRadius = UDim.new(0,6)

    local StatusLabel = Instance.new("TextLabel", Right)
    StatusLabel.Position = UDim2.new(1, -108, 0, 6)
    StatusLabel.Size = UDim2.new(0, 108, 0, 20)
    StatusLabel.AnchorPoint = Vector2.new(1,0)
    StatusLabel.BackgroundTransparency = 1
    StatusLabel.Font = Enum.Font.Gotham
    StatusLabel.TextSize = 14
    StatusLabel.TextColor3 = Color3.fromRGB(220,220,220)
    StatusLabel.Text = "Teleport: ON"

    local IntervalLabel = Instance.new("TextLabel", Right)
    IntervalLabel.Position = UDim2.new(1, -108, 0, 28)
    IntervalLabel.Size = UDim2.new(0,108,0,18)
    IntervalLabel.AnchorPoint = Vector2.new(1,0)
    IntervalLabel.BackgroundTransparency = 1
    IntervalLabel.Font = Enum.Font.Gotham
    IntervalLabel.TextSize = 13
    IntervalLabel.TextColor3 = Color3.fromRGB(175,175,175)
    IntervalLabel.Text = "Interval: " .. string.format("%.2f", interval) .. "s"

    -- body (timer + big buttons)
    local Body = Instance.new("Frame", Card)
    Body.Size = UDim2.new(1, -28, 1, -128)
    Body.Position = UDim2.new(0, 14, 0, 98)
    Body.BackgroundTransparency = 1

    local TitleBig = Instance.new("TextLabel", Body)
    TitleBig.Size = UDim2.new(1,0,0,30)
    TitleBig.Position = UDim2.new(0,0,0,0)
    TitleBig.BackgroundTransparency = 1
    TitleBig.Font = Enum.Font.Gotham
    TitleBig.TextSize = 18
    TitleBig.TextColor3 = Color3.fromRGB(210,210,210)
    TitleBig.Text = "Time been in game:"

    local TimerLarge = Instance.new("TextLabel", Body)
    TimerLarge.Name = "TimerLarge"
    TimerLarge.Size = UDim2.new(1,0,0,56)
    TimerLarge.Position = UDim2.new(0,0,0,34)
    TimerLarge.BackgroundTransparency = 1
    TimerLarge.Font = Enum.Font.Gotham
    TimerLarge.TextSize = 24
    TimerLarge.TextColor3 = Color3.fromRGB(190,190,190)
    TimerLarge.Text = "Day: 0 | Hour: 0 | Min: 0 | Sec: 0"
    TimerLarge.TextXAlignment = Enum.TextXAlignment.Center

    -- BIG CENTER BUTTONS container (centered horizontally below the timer)
    local ButtonsFrame = Instance.new("Frame", Body)
    ButtonsFrame.Size = UDim2.new(0.8, 0, 0, 120)
    ButtonsFrame.Position = UDim2.new(0.5, 0, 0, 110)
    ButtonsFrame.AnchorPoint = Vector2.new(0.5, 0)
    ButtonsFrame.BackgroundTransparency = 1

    -- Large Toggle Teleports button
    local ToggleLarge = Instance.new("TextButton", ButtonsFrame)
    ToggleLarge.Size = UDim2.new(1, 0, 0, 50)
    ToggleLarge.Position = UDim2.new(0, 0, 0, 0)
    ToggleLarge.BackgroundColor3 = Color3.fromRGB(52, 58, 64)
    ToggleLarge.BorderSizePixel = 0
    ToggleLarge.Font = Enum.Font.GothamBold
    ToggleLarge.TextSize = 20
    ToggleLarge.TextColor3 = Color3.fromRGB(245,245,245)
    ToggleLarge.Text = "Toggle Teleports: ON"
    local tcorner = Instance.new("UICorner", ToggleLarge); tcorner.CornerRadius = UDim.new(0, 10)

    -- spacer
    local spacer = Instance.new("Frame", ButtonsFrame)
    spacer.Size = UDim2.new(1, 0, 0, 12)
    spacer.Position = UDim2.new(0, 0, 0, 56)
    spacer.BackgroundTransparency = 1

    -- Large Discord button
    local DiscordLarge = Instance.new("TextButton", ButtonsFrame)
    DiscordLarge.Size = UDim2.new(1, 0, 0, 50)
    DiscordLarge.Position = UDim2.new(0, 0, 0, 68)
    DiscordLarge.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
    DiscordLarge.BorderSizePixel = 0
    DiscordLarge.Font = Enum.Font.GothamBold
    DiscordLarge.TextSize = 20
    DiscordLarge.TextColor3 = Color3.fromRGB(255,255,255)
    DiscordLarge.Text = "Copy Discord Invite"
    local dcorner = Instance.new("UICorner", DiscordLarge); dcorner.CornerRadius = UDim.new(0, 10)

    -- footer helper text
    local Footer = Instance.new("TextLabel", Body)
    Footer.Position = UDim2.new(0,8,1,-28)
    Footer.Size = UDim2.new(1,-16,0,24)
    Footer.BackgroundTransparency = 1
    Footer.Font = Enum.Font.Gotham
    Footer.TextSize = 12
    Footer.TextColor3 = Color3.fromRGB(155,155,155)
    Footer.Text = "P = Toggle Spam Teleport  •  [ / ] = Interval  •  C = Copy Discord"

    -- rain overlay container (covers card)
    local RainLayer = Instance.new("Frame", Card)
    RainLayer.Name = "RainLayer"
    RainLayer.Size = UDim2.new(1, 0, 1, 0)
    RainLayer.Position = UDim2.new(0, 0, 0, 0)
    RainLayer.BackgroundTransparency = 1
    RainLayer.ZIndex = 10

    -- CREDIT AREA (bottom-left): avatar + "Made by cattosbored"
    local CreditFrame = Instance.new("Frame", Card)
    CreditFrame.AnchorPoint = Vector2.new(0, 1)
    CreditFrame.Position = UDim2.new(0, 12, 1, -12)
    CreditFrame.Size = UDim2.new(0, 240, 0, 36)
    CreditFrame.BackgroundTransparency = 1

    local CreatorAvatar = Instance.new("ImageLabel", CreditFrame)
    CreatorAvatar.Size = UDim2.new(0, 34, 0, 34)
    CreatorAvatar.Position = UDim2.new(0, 0, 0, 0)
    CreatorAvatar.BackgroundTransparency = 1
    CreatorAvatar.ScaleType = Enum.ScaleType.Crop
    local caCorner = Instance.new("UICorner", CreatorAvatar); caCorner.CornerRadius = UDim.new(0, 8)

    local CreatorLabel = Instance.new("TextLabel", CreditFrame)
    CreatorLabel.Position = UDim2.new(0, 40, 0, 4)
    CreatorLabel.Size = UDim2.new(1, -40, 0, 28)
    CreatorLabel.BackgroundTransparency = 1
    CreatorLabel.Font = Enum.Font.Gotham
    CreatorLabel.TextSize = 14
    CreatorLabel.TextColor3 = Color3.fromRGB(200,200,200)
    CreatorLabel.Text = "Made by " .. CREATOR_USERNAME

    -- small copy helper label (re-using footer region for feedback)
    local CopyHint = Instance.new("TextLabel", Right)
    CopyHint.Position = UDim2.new(1, -44, 0, 66)
    CopyHint.Size = UDim2.new(0, 140, 0, 16)
    CopyHint.AnchorPoint = Vector2.new(1,0)
    CopyHint.BackgroundTransparency = 1
    CopyHint.Font = Enum.Font.Gotham
    CopyHint.TextSize = 12
    CopyHint.TextColor3 = Color3.fromRGB(200,200,200)
    CopyHint.Text = "Discord invite"

    -- small copy helper used by big discord button
    local function copyDiscordInvite(feedbackLabel)
        local ok = trySetClipboard(DISCORD_INVITE)
        if ok then
            if feedbackLabel then
                feedbackLabel.Text = "Copied! ✅"
                delay(1.2, function() if feedbackLabel then feedbackLabel.Text = "Discord invite" end end)
            end
        else
            if feedbackLabel then
                feedbackLabel.Text = "Fallback: press Ctrl+C"
                delay(1.6, function() if feedbackLabel then feedbackLabel.Text = "Discord invite" end end)
            end
        end
    end

    -- button behaviors
    ToggleLarge.MouseButton1Click:Connect(function()
        spamEnabled = not spamEnabled
        local targetCol = spamEnabled and Color3.fromRGB(70,200,120) or Color3.fromRGB(200,80,80)
        TweenService:Create(ToggleLarge, TweenInfo.new(0.12, Enum.EasingStyle.Quad), {BackgroundColor3 = targetCol}):Play()
        delay(0.2, function()
            TweenService:Create(ToggleLarge, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {BackgroundColor3 = Color3.fromRGB(52,58,64)}):Play()
        end)
    end)

    DiscordLarge.MouseButton1Click:Connect(function()
        copyDiscordInvite(CopyHint)
        TweenService:Create(DiscordLarge, TweenInfo.new(0.12, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(1, 6, 0, 52)}):Play()
        delay(0.12, function()
            TweenService:Create(DiscordLarge, TweenInfo.new(0.18, Enum.EasingStyle.Quad), {Size = UDim2.new(1, 0, 0, 50)}):Play()
        end)
    end)

    -- UI update loop
    spawn(function()
        while Card and Card.Parent do
            local now = os.date("*t")
            SubLabel.Text = string.format("%02d:%02d:%02d  |  %02d/%02d/%02d", now.hour, now.min, now.sec, now.month, now.day, now.year % 100)
            local d,h,m,s = formatDuration(tick() - sessionStart)
            TimerLarge.Text = string.format("Day: %d | Hour: %d | Min: %d | Sec: %d", d, h, m, s)
            IntervalLabel.Text = "Interval: " .. string.format("%.2f", interval) .. "s"
            StatusLabel.Text = spamEnabled and "Teleport: ON" or "Teleport: OFF"
            StatusDot.BackgroundColor3 = spamEnabled and Color3.fromRGB(70,200,120) or Color3.fromRGB(200,80,80)
            ToggleLarge.Text = "Toggle Teleports: " .. (spamEnabled and "ON" or "OFF")
            wait(0.8)
        end
    end)

    -- expose important refs (and CreatorAvatar/CreatorLabel for later population)
    return {
        Gui = screenGui,
        RainLayer = RainLayer,
        AvatarImage = Avatar,
        CreatorAvatar = CreatorAvatar,
        CreatorLabel = CreatorLabel,
        copyDiscordInvite = copyDiscordInvite,
    }
end

local ui = createUI()

-- fetch and set player's avatar (safe)
spawn(function()
    local ok, img = pcall(function()
        return Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size60x60)
    end)
    if ok and img and img ~= "" then
        ui.AvatarImage.Image = img
    else
        -- placeholder: grey background with '?' handled by earlier logic
        ui.AvatarImage.Image = ""
        ui.AvatarImage.BackgroundColor3 = Color3.fromRGB(36,36,36)
        local q = Instance.new("TextLabel", ui.AvatarImage)
        q.Size = UDim2.new(1,0,1,0)
        q.BackgroundTransparency = 1
        q.Font = Enum.Font.GothamBold
        q.TextSize = 22
        q.TextColor3 = Color3.fromRGB(160,160,160)
        q.Text = "?"
    end
end)

-- fetch creator avatar by username (best-effort)
spawn(function()
    local success, uid = pcall(function()
        return Players:GetUserIdFromNameAsync(CREATOR_USERNAME)
    end)
    if success and uid then
        local ok2, img2 = pcall(function()
            return Players:GetUserThumbnailAsync(uid, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size60x60)
        end)
        if ok2 and img2 and img2 ~= "" then
            ui.CreatorAvatar.Image = img2
            ui.CreatorLabel.Text = "Made by " .. CREATOR_USERNAME
        else
            ui.CreatorAvatar.Image = ""
            ui.CreatorAvatar.BackgroundColor3 = Color3.fromRGB(36,36,36)
            ui.CreatorLabel.Text = "Made by " .. CREATOR_USERNAME
        end
    else
        -- username lookup failed; show placeholder and still show label
        ui.CreatorAvatar.Image = ""
        ui.CreatorAvatar.BackgroundColor3 = Color3.fromRGB(36,36,36)
        ui.CreatorLabel.Text = "Made by " .. CREATOR_USERNAME
        warn("Could not fetch user id for '" .. tostring(CREATOR_USERNAME) .. "': " .. tostring(uid))
    end
end)

-- Rain spawner (simple)
if RAIN_ENABLED then
    spawn(function()
        local active = {}
        while ui and ui.RainLayer and ui.RainLayer.Parent do
            if #active < RAIN_MAX_DROPS then
                local drop = Instance.new("Frame", ui.RainLayer)
                drop.Size = UDim2.new(0, 2, 0, 18)
                local x = math.random()
                drop.Position = UDim2.new(x, 0, 0, -20)
                drop.BackgroundColor3 = Color3.fromRGB(170, 190, 220)
                drop.BorderSizePixel = 0
                drop.BackgroundTransparency = 0.45
                local dropCorner = Instance.new("UICorner", drop)
                dropCorner.CornerRadius = UDim.new(0, 1)

                table.insert(active, drop)

                local fallTime = 0.9 + math.random() * 0.8
                local endY = 1.06
                local tween = TweenService:Create(drop, TweenInfo.new(fallTime, Enum.EasingStyle.Linear), {Position = UDim2.new(x, 0, endY, 0), BackgroundTransparency = 0.8})
                tween:Play()
                spawn(function()
                    tween.Completed:Wait()
                    pcall(function() drop:Destroy() end)
                    for i,v in ipairs(active) do
                        if v == drop then table.remove(active, i); break end
                    end
                end)
            end
            task.wait(RAIN_SPAWN_INTERVAL)
        end
    end)
end

-- Spam teleport loop (robust)
spawn(function()
    while true do
        if spamEnabled then
            if #TELEPORT_TARGETS >= 1 then
                local char = player.Character
                if not char then char = player.CharacterAdded:Wait() end
                local root = getRootPart(char)
                if not root then root = char:WaitForChild("HumanoidRootPart", 5) end
                if root and TELEPORT_TARGETS[teleportIndex] then
                    local target = TELEPORT_TARGETS[teleportIndex]
                    pcall(function()
                        local _, y, _ = root.CFrame:ToOrientation()
                        root.CFrame = CFrame.new(target) * CFrame.Angles(0, y, 0)
                    end)
                    teleportIndex = teleportIndex + 1
                    if teleportIndex > #TELEPORT_TARGETS then teleportIndex = 1 end
                end
            else
                warn("Teleport targets empty.")
            end
        end
        task.wait(interval)
    end
end)

-- keybinds (P toggles spam, [/] interval, C copy discord)
UserInput.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.UserInputType == Enum.UserInputType.Keyboard then
        local k = input.KeyCode
        if k == Enum.KeyCode.P then
            spamEnabled = not spamEnabled
        elseif k == Enum.KeyCode.LeftBracket then
            interval = math.max(MIN_INTERVAL, interval - 0.25)
        elseif k == Enum.KeyCode.RightBracket then
            interval = math.min(MAX_INTERVAL, interval + 0.25)
        elseif k == Enum.KeyCode.C then
            ui.copyDiscordInvite()
        end
    end
end)

-- ensure working after respawn
player.CharacterAdded:Connect(function(char)
    char:WaitForChild("HumanoidRootPart", 5)
end)

-- Anti-AFK (keeps previous anti-afk)
pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/hassanxzayn-lua/Anti-afk/main/antiafkbyhassanxzyn"))()
end)

-- subtle fade-in for text
if ui and ui.Gui then
    for _,v in pairs(ui.Gui:GetDescendants()) do
        if (v:IsA("TextLabel") or v:IsA("TextButton")) then
            v.TextTransparency = 1
            TweenService:Create(v, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
        end
    end
end

print("[TeleportControlCenter] loaded — spam teleport STARTED at interval " .. tostring(interval) .. "s. Press P to toggle, C to copy Discord.")
