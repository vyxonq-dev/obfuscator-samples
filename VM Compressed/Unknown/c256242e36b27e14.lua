repeat task.wait() until game:IsLoaded()

local sdk = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local me = Players.LocalPlayer

local function new(class, props, kids)
    local obj = Instance.new(class)
    for k, v in pairs(props) do
        obj[k] = v
    end
    if kids then
        for _, kid in pairs(kids) do
            kid.Parent = obj
        end
    end
    return obj
end

local function tween(obj, props, dur, ease, dir)
    local info = TweenInfo.new(
        dur or 0.3,
        ease or Enum.EasingStyle.Quart,
        dir or Enum.EasingDirection.Out
    )
    local t = TweenService:Create(obj, info, props)
    t:Play()
    return t
end

local GAME_SCRIPTS = {
    ["Rivals"] = "f734cbc6d30b72abe044a3fb60543345",
    ["Flick"] = "9a65bec4c321b3f25f47a860831e9b2d",
    ["BladeBall"] = "f4b067ed49f105456b6b3900bc1a4ef9",
    ["SailorPiece"] = "66387fa15569b822d2ea55a5faabe87c",
    ["SlimeRNG"] = "7a8b76f35bce8a800da3cd7aad830bcd",
    ["TypeSoul"] = "5f6af3cb21fee478aa17493db9e1853b",
    ["Violence District"] = "b788ceefa4a0c32bd78003c2d3618109",
    ["Default"] = "18fa0aa2984290b5582813fe581dd4cf"
}

local function detectGame()
    local pid = game.PlaceId
    if pid == 17625359962 or pid == 18126510175 or pid == 71874690745115 or pid == 117398147513099 or pid == 129604661913557 then
        return GAME_SCRIPTS["Rivals"]
    elseif pid == 136801880565837 or pid == 4902182837 then
        return GAME_SCRIPTS["Flick"]
    elseif pid == 13772394625 or pid == 14368557094 or pid == 14732610803 or pid == 14915220621
        or pid == 15131065025 or pid == 15144787112 or pid == 15185247558 or pid == 15234596844
        or pid == 15264892126 or pid == 15509350986 or pid == 15517169103 or pid == 15552588346
        or pid == 15582821022 or pid == 15582823307 or pid == 16044264830 or pid == 16281300371
        or pid == 16331595046 or pid == 16331596518 or pid == 16331598816 or pid == 16331600459
        or pid == 16456370330 or pid == 16581637217 or pid == 16581648071 or pid == 17757592456
        or pid == 92458008626219 or pid == 111661204337143 then
        return GAME_SCRIPTS["BladeBall"]
    elseif pid == 77747658251236 or pid == 123955125827131 or pid == 75159314259063
        or pid == 99684056491472 or pid == 96767841099256 or pid == 138368689293913
        or pid == 130167267952199 or pid == 98826438856089 or pid == 75982168454032 then
        return GAME_SCRIPTS["SailorPiece"]
    elseif pid == 92416421522960 then
        return GAME_SCRIPTS["SlimeRNG"]
    elseif pid == 130996985148664 or pid == 18567652860 or pid == 14069122388
        or pid == 14069678431 or pid == 14069956183 or pid == 14070029709
        or pid == 14067600077 or pid == 14067606919 or pid == 14069866342
        or pid == 16845411199 or pid == 18413381799 or pid == 14071822972
        or pid == 99658992953850 or pid == 14282768170 or pid == 15126191380
        or pid == 15176590855 or pid == 15214773359 or pid == 15336080245
        or pid == 16787374647 or pid == 17078737609 or pid == 16722271122
        or pid == 16883972004 or pid == 16883976493 or pid == 16795663529
        or pid == 17206327946 or pid == 18363155549 or pid == 18301446679
        or pid == 88570549485653 or pid == 18214402201 or pid == 17497925847
        or pid == 85663041002311 or pid == 126276657485357 or pid == 116052447681870
        or pid == 79007765026427 or pid == 121766282797354 or pid == 115509275831248
        or pid == 108123877604820 or pid == 122291183918016 or pid == 138059541435332 or pid == 18637069183 then
        return GAME_SCRIPTS["TypeSoul"]
    elseif pid == 93978595733734 then
        return GAME_SCRIPTS["Violence District"]
    end
    return GAME_SCRIPTS["Default"]
end

sdk.script_id = detectGame()

local actorRun = rawget(getfenv(0), "run_on_actor")
local actorGet = rawget(getfenv(0), "getactors") or rawget(getfenv(0), "get_actors")
local hasActors = typeof(actorRun) == "function" and typeof(actorGet) == "function"

local function findActor()
    if not hasActors then return nil end
    local ok, list = pcall(actorGet)
    if not ok or type(list) ~= "table" then return nil end
    for _, a in ipairs(list) do
        if typeof(a) == "Instance" and a:IsA("Actor") and a.Parent then
            return a
        end
    end
    return nil
end

local function runOnActor(src, key)
    if not src or src == "" then return false, "empty source" end
    local actor = findActor()
    if not actor then return false, "no actor" end
    local wrapper = [[
        local src, key = ...
        if key and key ~= "" then
            pcall(function() getgenv().script_key = key end)
        end
        local ok, err = pcall(function()
            local chunk = loadstring(src)
            if chunk then chunk() end
        end)
        if not ok then warn("[Loader][Actor] " .. tostring(err)) end
    ]]
    local ok, err = pcall(function()
        actorRun(actor, wrapper, src, key or "")
    end)
    if ok then return true end
    return false, tostring(err)
end

local function fetchSource(hash)
    if not hash or hash == "" then return nil, "empty hash" end
    local url = "https://api.luarmor.net/files/v3/loaders/" .. tostring(hash) .. ".lua"
    local ok, src = pcall(function() return game:HttpGet(url) end)
    if ok and type(src) == "string" and #src > 0 then
        return src
    end
    return nil, tostring(src)
end

local function loadScript(key)
    local hash = sdk.script_id
    local src = fetchSource(hash)
    if src then
        local actorOk = runOnActor(src, key)
        if actorOk then return true end

        if key and key ~= "" then
            pcall(function() getgenv().script_key = key end)
        end
        local directOk = pcall(function()
            local chunk = loadstring(src)
            if chunk then chunk() end
        end)
        if directOk then return true end
    end

    local ok = pcall(function() sdk.load_script() end)
    return ok
end

local KEY_FOLDER = "KEY"
local KEY_FILE = KEY_FOLDER .. "/key.txt"

local function hasFileApi()
    return typeof(isfile) == "function"
        and typeof(readfile) == "function"
        and typeof(writefile) == "function"
        and typeof(isfolder) == "function"
        and typeof(makefolder) == "function"
end

local function ensureKeyFolder()
    if not hasFileApi() then return end
    pcall(function()
        if not isfolder(KEY_FOLDER) then makefolder(KEY_FOLDER) end
    end)
end

local function saveKey(key)
    if not hasFileApi() or not key or key == "" then return end
    pcall(function()
        ensureKeyFolder()
        writefile(KEY_FILE, key)
    end)
end

local function loadSavedKey()
    if not hasFileApi() then return nil end
    local ok, content = pcall(function()
        if isfile(KEY_FILE) then return readfile(KEY_FILE) end
        return nil
    end)
    if ok and content then
        local trimmed = content:gsub("%s+", "")
        if trimmed ~= "" then return trimmed end
    end
    return nil
end

local function deleteSavedKey()
    if not hasFileApi() then return end
    pcall(function()
        if isfile(KEY_FILE) and typeof(delfile) == "function" then
            delfile(KEY_FILE)
        end
    end)
end

ensureKeyFolder()

local Theme = {
    Background = Color3.fromRGB(14, 4, 6),
    Sidebar = Color3.fromRGB(20, 6, 10),
    Border = Color3.fromRGB(45, 45, 45),
    Accent = Color3.fromRGB(101, 3, 22),
    AccentHover = Color3.fromRGB(130, 15, 35),
    AccentGlow = Color3.fromRGB(150, 25, 40),
    Text = Color3.fromRGB(255, 255, 255),
    Muted = Color3.fromRGB(255, 255, 255),
    Placeholder = Color3.fromRGB(200, 200, 200),
    Input = Color3.fromRGB(18, 5, 8),
    InputFocus = Color3.fromRGB(28, 10, 16),
    ElementBorder = Color3.fromRGB(55, 8, 16),
    Dialog = Color3.fromRGB(75, 12, 24),
    TitleBarLine = Color3.fromRGB(85, 16, 28),
    Error = Color3.fromRGB(255, 40, 40)
}

local isMobile = UserInputService.TouchEnabled
local MAIN_SIZE = isMobile and UDim2.new(0, 420, 0, 250) or UDim2.new(0, 600, 0, 350)
local SHADOW_SIZE = isMobile and UDim2.new(0, 420, 0, 250) or UDim2.new(0, 600, 0, 350)
local SUCCESS_SIZE = isMobile and UDim2.new(0, 360, 0, 260) or UDim2.new(0, 520, 0, 360)
local SIDEBAR_WIDTH = isMobile and 110 or 160
local pad = isMobile and 15 or 30
local btnHeight = isMobile and 28 or 38

local yUsername = isMobile and 65 or 110
local yKey = isMobile and 100 or 158
local yLogin = isMobile and 135 or 205
local yGetKey = isMobile and 170 or 253
local yBuy = isMobile and 205 or 299

local function typeText(label, fullText, baseDelay)
    local delay = baseDelay or 0.035
    for i = 1, #fullText do
        if not label or not label.Parent then return end
        label.Text = string.sub(fullText, 1, i)
        local c = string.sub(fullText, i, i)
        if c == " " then
            task.wait(delay * 0.5)
        elseif c == "," or c == "." then
            task.wait(delay * 2.5)
        else
            task.wait(delay + (math.random() * 0.012))
        end
    end
end

local function notify(title, msg, time)
    local screen = CoreGui:FindFirstChild("PhantomLoader")
    if not screen then return end

    local container = screen:FindFirstChild("NotifContainer")
    if not container then
        container = new("Frame", {
            Name = "NotifContainer",
            Parent = screen,
            BackgroundTransparency = 1,
            Position = UDim2.new(1, -20, 1, -20),
            Size = UDim2.new(0, 300, 1, 0),
            AnchorPoint = Vector2.new(1, 1)
        }, {
            new("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Bottom,
                Padding = UDim.new(0, 8)
            })
        })
    end

    local duration = time or 3

    local card = new("Frame", {
        Parent = container,
        BackgroundColor3 = Theme.Background,
        Size = UDim2.new(1, 0, 0, 0),
        BorderSizePixel = 0,
        ClipsDescendants = true,
        BackgroundTransparency = 0.3
    }, {
        new("UICorner", {CornerRadius = UDim.new(0, 6)}),
        new("UIStroke", {Color = Theme.Border, Thickness = 1, Transparency = 0.5}),
        new("Frame", {
            Name = "AccentBar",
            BackgroundColor3 = Theme.Accent,
            Position = UDim2.new(0, 0, 0, 0),
            Size = UDim2.new(0, 3, 0, 0),
            BorderSizePixel = 0
        }),
        new("Frame", {
            Name = "TimerBar",
            BackgroundColor3 = Theme.AccentGlow,
            BackgroundTransparency = 0.75,
            Position = UDim2.new(0, 0, 1, -2),
            Size = UDim2.new(1, 0, 0, 2),
            BorderSizePixel = 0
        }),
        new("TextLabel", {
            Name = "Title",
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 14, 0, 10),
            Size = UDim2.new(1, -26, 0, 20),
            Font = Enum.Font.GothamBold,
            Text = title or "Notification",
            TextColor3 = Theme.Text,
            TextSize = 13,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextTransparency = 1
        }),
        new("TextLabel", {
            Name = "Desc",
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 14, 0, 28),
            Size = UDim2.new(1, -26, 0, 20),
            Font = Enum.Font.Gotham,
            Text = msg or "",
            TextColor3 = Theme.Text,
            TextSize = 12,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextTransparency = 1
        })
    })

    tween(card, {Size = UDim2.new(1, 0, 0, 60), BackgroundTransparency = 0}, 0.4, Enum.EasingStyle.Exponential)

    local titleLabel = card:FindFirstChild("Title")
    local descLabel = card:FindFirstChild("Desc")
    local accentBar = card:FindFirstChild("AccentBar")
    local timerBar = card:FindFirstChild("TimerBar")
    local stroke = card:FindFirstChild("UIStroke")

    task.delay(0.15, function()
        if titleLabel and titleLabel.Parent then
            tween(titleLabel, {TextTransparency = 0}, 0.35, Enum.EasingStyle.Exponential)
        end
    end)
    task.delay(0.22, function()
        if descLabel and descLabel.Parent then
            tween(descLabel, {TextTransparency = 0}, 0.35, Enum.EasingStyle.Exponential)
        end
    end)
    task.delay(0.1, function()
        if accentBar and accentBar.Parent then
            tween(accentBar, {Size = UDim2.new(0, 3, 1, 0)}, 0.6, Enum.EasingStyle.Exponential)
        end
    end)
    if stroke then
        tween(stroke, {Transparency = 0}, 0.4, Enum.EasingStyle.Exponential)
    end

    task.delay(0.4, function()
        if timerBar and timerBar.Parent then
            local info = TweenInfo.new(duration - 0.4, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
            TweenService:Create(timerBar, info, {Size = UDim2.new(0, 0, 0, 2)}):Play()
        end
    end)

    task.delay(duration, function()
        if card and card.Parent then
            if titleLabel and titleLabel.Parent then
                tween(titleLabel, {TextTransparency = 1}, 0.2)
            end
            if descLabel and descLabel.Parent then
                tween(descLabel, {TextTransparency = 1}, 0.2)
            end
            if accentBar and accentBar.Parent then
                tween(accentBar, {Size = UDim2.new(0, 3, 0, 0), BackgroundTransparency = 1}, 0.25)
            end

            task.wait(0.12)

            if card and card.Parent then
                tween(card, {BackgroundTransparency = 1}, 0.2)
                if stroke and stroke.Parent then
                    tween(stroke, {Transparency = 1}, 0.2)
                end

                task.wait(0.1)

                if card and card.Parent then
                    tween(card, {Size = UDim2.new(1, 0, 0, 0)}, 0.3, Enum.EasingStyle.Exponential)
                    task.wait(0.35)
                    if card and card.Parent then
                        card:Destroy()
                    end
                end
            end
        end
    end)
end

if CoreGui:FindFirstChild("PhantomLoader") then
    CoreGui.PhantomLoader:Destroy()
end

local screenGui = new("ScreenGui", {
    Name = "PhantomLoader",
    Parent = CoreGui
})

local shadow = new("Frame", {
    Name = "Shadow",
    Parent = screenGui,
    BackgroundColor3 = Color3.fromRGB(0, 0, 0),
    BackgroundTransparency = 1,
    Position = UDim2.new(0.5, 0, 0.5, 6),
    Size = MAIN_SIZE,
    AnchorPoint = Vector2.new(0.5, 0.5),
    BorderSizePixel = 0,
    ZIndex = 0
}, {
    new("UICorner", {CornerRadius = UDim.new(0, 8)})
})

local mainFrame = new("Frame", {
    Name = "MainFrame",
    Parent = screenGui,
    BackgroundColor3 = Theme.Background,
    Position = UDim2.new(0.5, 0, 0.5, 20),
    Size = UDim2.new(0, 0, 0, 0),
    AnchorPoint = Vector2.new(0.5, 0.5),
    BorderSizePixel = 0,
    BackgroundTransparency = 1,
    ZIndex = 1
}, {
    new("UICorner", {CornerRadius = UDim.new(0, 6)}),
    new("UIStroke", {Color = Theme.Border, Thickness = 1.5, Transparency = 1})
})

local sidebar = new("Frame", {
    Name = "Sidebar",
    Parent = mainFrame,
    BackgroundColor3 = Theme.Sidebar,
    Size = UDim2.new(0, SIDEBAR_WIDTH, 1, 0),
    BorderSizePixel = 0,
    BackgroundTransparency = 1
}, {
    new("UICorner", {CornerRadius = UDim.new(0, 6)}),
    new("Frame", {
        Name = "Divider",
        BackgroundColor3 = Theme.TitleBarLine,
        Position = UDim2.new(1, -1, 0, 10),
        Size = UDim2.new(0, 1, 1, -20),
        BorderSizePixel = 0,
        BackgroundTransparency = 1
    })
})

local avatarContainer = new("Frame", {
    Parent = sidebar,
    BackgroundTransparency = 1,
    Position = UDim2.new(0, 0, 0, isMobile and 15 or 40),
    Size = UDim2.new(1, 0, 0, isMobile and 70 or 100)
}, {
    new("ImageLabel", {
        Name = "Avatar",
        BackgroundTransparency = 1,
        Position = isMobile and UDim2.new(0.5, -20, 0, 0) or UDim2.new(0.5, -30, 0, 0),
        Size = isMobile and UDim2.new(0, 40, 0, 40) or UDim2.new(0, 60, 0, 60),
        Image = "rbxassetid://0",
        ImageTransparency = 1
    }, {
        new("UICorner", {CornerRadius = UDim.new(1, 0)}),
        new("UIStroke", {Color = Theme.TitleBarLine, Thickness = 2, Transparency = 1})
    })
})

task.spawn(function()
    local ok, thumb = pcall(function()
        return Players:GetUserThumbnailAsync(
            me.UserId,
            Enum.ThumbnailType.AvatarBust,
            Enum.ThumbnailSize.Size420x420
        )
    end)
    if ok then avatarContainer.Avatar.Image = thumb end
end)

local content = new("Frame", {
    Parent = mainFrame,
    BackgroundTransparency = 1,
    Position = UDim2.new(0, SIDEBAR_WIDTH, 0, 0),
    Size = UDim2.new(1, -SIDEBAR_WIDTH, 1, 0)
})

local titleLabel = new("TextLabel", {
    Name = "TitleLabel",
    Parent = content,
    BackgroundTransparency = 1,
    Position = UDim2.new(0, pad, 0, isMobile and 12 or 40),
    Size = UDim2.new(1, -pad * 2, 0, isMobile and 20 or 30),
    Font = Enum.Font.GothamBold,
    Text = "",
    TextColor3 = Theme.Text,
    TextSize = isMobile and 15 or 20,
    TextXAlignment = Enum.TextXAlignment.Left
})

local welcomeLabel = new("TextLabel", {
    Name = "WelcomeLabel",
    Parent = content,
    BackgroundTransparency = 1,
    Position = UDim2.new(0, pad, 0, isMobile and 34 or 65),
    Size = UDim2.new(1, -pad * 2, 0, 20),
    Font = Enum.Font.Gotham,
    Text = "",
    TextColor3 = Theme.Text,
    TextSize = isMobile and 11 or 13,
    TextXAlignment = Enum.TextXAlignment.Left
})

local function buildInput(placeholder, yPos, isPassword)
    local container = new("Frame", {
        Parent = content,
        BackgroundColor3 = Theme.Input,
        Position = UDim2.new(0, pad, 0, yPos),
        Size = UDim2.new(1, -pad * 2, 0, btnHeight),
        BorderSizePixel = 0,
        BackgroundTransparency = 1
    }, {
        new("UICorner", {CornerRadius = UDim.new(0, 4)}),
        new("UIStroke", {Color = Theme.ElementBorder, Thickness = 1, Transparency = 1})
    })

    local input = new("TextBox", {
        Parent = container,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 12, 0, 0),
        Size = UDim2.new(1, isPassword and -54 or -24, 1, 0),
        Font = Enum.Font.Gotham,
        Text = "",
        PlaceholderText = placeholder,
        PlaceholderColor3 = Theme.Placeholder,
        TextColor3 = Theme.Text,
        TextSize = isMobile and 11 or 13,
        TextXAlignment = Enum.TextXAlignment.Left,
        ClearTextOnFocus = false
    })

    local mask
    if isPassword then
        mask = new("TextLabel", {
            Parent = container,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 12, 0, 0),
            Size = UDim2.new(1, -54, 1, 0),
            Font = Enum.Font.GothamBold,
            Text = "",
            TextColor3 = Theme.Text,
            TextSize = isMobile and 12 or 14,
            TextXAlignment = Enum.TextXAlignment.Left,
            ZIndex = 2
        })
        input.TextTransparency = 1
        input:GetPropertyChangedSignal("Text"):Connect(function()
            mask.Text = string.rep("\226\128\162", #input.Text)
        end)
    end

    local focusLine = new("Frame", {
        Name = "FocusLine",
        Parent = container,
        BackgroundColor3 = Theme.AccentGlow,
        BackgroundTransparency = 0,
        Position = UDim2.new(0.5, 0, 1, -2),
        AnchorPoint = Vector2.new(0.5, 0),
        Size = UDim2.new(0, 0, 0, 2),
        BorderSizePixel = 0
    })

    input.Focused:Connect(function()
        tween(container:FindFirstChild("UIStroke"), {Color = Color3.fromRGB(150, 25, 40), Thickness = 1.5}, 0.25, Enum.EasingStyle.Exponential)
        tween(container, {BackgroundColor3 = Theme.InputFocus}, 0.25, Enum.EasingStyle.Exponential)
        tween(focusLine, {Size = UDim2.new(0.9, 0, 0, 2)}, 0.35, Enum.EasingStyle.Exponential)
    end)
    input.FocusLost:Connect(function()
        tween(container:FindFirstChild("UIStroke"), {Color = Theme.ElementBorder, Thickness = 1}, 0.35, Enum.EasingStyle.Exponential)
        tween(container, {BackgroundColor3 = Theme.Input}, 0.35, Enum.EasingStyle.Exponential)
        tween(focusLine, {Size = UDim2.new(0, 0, 0, 2)}, 0.3, Enum.EasingStyle.Exponential)
    end)

    return input, container, mask
end

local userInput, userInputContainer = buildInput("Username", yUsername, false)
userInput.Text = me.Name
local keyInput, keyInputContainer, keyMask = buildInput("Enter your key", yKey, true)

local function showKey(visible)
    keyInput.TextTransparency = visible and 0 or 1
    if keyMask then keyMask.TextTransparency = visible and 1 or 0 end
    tween(keyInputContainer:FindFirstChild("UIStroke"), {Color = visible and Theme.AccentGlow or Theme.ElementBorder, Thickness = visible and 1.5 or 1}, 0.2, Enum.EasingStyle.Exponential)
end

local EYE_CLOSED = "rbxassetid://138900484054687"
local EYE_OPEN = "rbxassetid://122998546023164"

local eyeBtn = new("ImageButton", {
    Parent = keyInputContainer,
    BackgroundTransparency = 1,
    Position = UDim2.new(1, -36, 0.5, 0),
    Size = UDim2.new(0, 24, 0, 24),
    AnchorPoint = Vector2.new(0, 0.5),
    Image = EYE_CLOSED,
    ImageTransparency = 1,
    ScaleType = Enum.ScaleType.Fit,
    AutoButtonColor = false,
    ZIndex = 3
})

eyeBtn.MouseEnter:Connect(function()
    tween(eyeBtn, {ImageColor3 = Theme.AccentGlow}, 0.2, Enum.EasingStyle.Exponential)
end)
eyeBtn.MouseLeave:Connect(function()
    tween(eyeBtn, {ImageColor3 = Color3.fromRGB(255, 255, 255)}, 0.2, Enum.EasingStyle.Exponential)
end)

local keyVisible = false
eyeBtn.MouseButton1Click:Connect(function()
    keyVisible = not keyVisible
    showKey(keyVisible)
    eyeBtn.Image = keyVisible and EYE_OPEN or EYE_CLOSED
end)

local function buildButton(text, yPos, isPrimary)
    local btn = new("TextButton", {
        Parent = content,
        BackgroundColor3 = isPrimary and Theme.Accent or Theme.Background,
        Position = UDim2.new(0, pad, 0, yPos),
        Size = UDim2.new(1, -pad * 2, 0, btnHeight),
        AutoButtonColor = false,
        Text = text,
        Font = Enum.Font.GothamBold,
        TextColor3 = Theme.Text,
        TextSize = isMobile and 11 or 13,
        BackgroundTransparency = 1,
        TextTransparency = 1,
        ClipsDescendants = true
    }, {
        new("UICorner", {CornerRadius = UDim.new(0, 4)}),
        not isPrimary and new("UIStroke", {Color = Theme.ElementBorder, Thickness = 1, Transparency = 1}) or nil
    })

    local underline = new("Frame", {
        Name = "Underline",
        Parent = btn,
        BackgroundColor3 = Theme.AccentGlow,
        BackgroundTransparency = 0.5,
        Position = UDim2.new(0, 0, 1, -2),
        Size = UDim2.new(0, 0, 0, 2),
        BorderSizePixel = 0
    })

    btn.MouseEnter:Connect(function()
        if isPrimary then
            tween(btn, {BackgroundTransparency = 0.15}, 0.2, Enum.EasingStyle.Exponential)
        else
            local s = btn:FindFirstChild("UIStroke")
            if s then tween(s, {Color = Theme.AccentGlow}, 0.25, Enum.EasingStyle.Exponential) end
        end
        tween(underline, {Size = UDim2.new(1, 0, 0, 2)}, 0.3, Enum.EasingStyle.Exponential)
    end)

    btn.MouseLeave:Connect(function()
        if isPrimary then
            tween(btn, {BackgroundTransparency = 0}, 0.25, Enum.EasingStyle.Exponential)
        else
            local s = btn:FindFirstChild("UIStroke")
            if s then tween(s, {Color = Theme.ElementBorder}, 0.3, Enum.EasingStyle.Exponential) end
        end
        tween(underline, {Size = UDim2.new(0, 0, 0, 2)}, 0.25, Enum.EasingStyle.Exponential)
    end)

    return btn
end

local loginBtn = buildButton("Check Key", yLogin, true)
local getKeyBtn = buildButton("Get your free key", yGetKey, false)
local buyBtn = buildButton("Buy Premium", yBuy, false)

task.spawn(function()
    while buyBtn and buyBtn.Parent do
        tween(buyBtn, {BackgroundColor3 = Color3.fromRGB(180, 30, 45), BackgroundTransparency = 0}, 1.5, Enum.EasingStyle.Exponential)
        task.wait(1.5)
        if not buyBtn or not buyBtn.Parent then break end
        tween(buyBtn, {BackgroundColor3 = Color3.fromRGB(60, 5, 12), BackgroundTransparency = 0}, 1.5, Enum.EasingStyle.Exponential)
        task.wait(1.5)
    end
end)

local scanBar = new("Frame", {
    Name = "ScanBar",
    Parent = loginBtn,
    BackgroundColor3 = Theme.AccentGlow,
    BackgroundTransparency = 1,
    Position = UDim2.new(-0.3, 0, 0, 0),
    Size = UDim2.new(0.3, 0, 1, 0),
    BorderSizePixel = 0,
    ZIndex = 2
}, {
    new("UICorner", {CornerRadius = UDim.new(0, 4)})
})

local discordBtn = new("TextButton", {
    Parent = sidebar,
    BackgroundColor3 = Theme.Dialog,
    BackgroundTransparency = 1,
    Position = UDim2.new(0, 10, 0, isMobile and 70 or 115),
    Size = UDim2.new(1, -20, 0, isMobile and 25 or 30),
    Text = "Join Our Discord",
    Font = Enum.Font.GothamBold,
    TextColor3 = Theme.Text,
    TextSize = isMobile and 10 or 12,
    AutoButtonColor = false,
    TextTransparency = 1
}, {
    new("UICorner", {CornerRadius = UDim.new(0, 4)})
})

discordBtn.MouseEnter:Connect(function()
    tween(discordBtn, {BackgroundTransparency = 0.2}, 0.25, Enum.EasingStyle.Exponential)
end)
discordBtn.MouseLeave:Connect(function()
    tween(discordBtn, {BackgroundTransparency = 0}, 0.3, Enum.EasingStyle.Exponential)
end)

local function openDiscord()
    if setclipboard then
        setclipboard("https://discord.gg/6S7gHAPg3A")
    end
    notify("Discord", "Invite link copied to clipboard", 5)
    pcall(function()
        local inviter = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Discord%20Inviter/Source.lua"))()
        inviter.Join("https://discord.gg/6S7gHAPg3A")
    end)
end

discordBtn.MouseButton1Click:Connect(openDiscord)

local function errorShake()
    local stroke = mainFrame:FindFirstChild("UIStroke")
    if stroke then tween(stroke, {Color = Theme.Error, Thickness = 2.5}, 0.08) end

    local start = mainFrame.Position
    for i = 1, 8 do
        local intensity = 6 * (1 - (i / 9))
        local shift = (i % 2 == 0) and intensity or -intensity
        tween(mainFrame, {
            Position = UDim2.new(
                start.X.Scale, start.X.Offset + shift,
                start.Y.Scale, start.Y.Offset + (math.abs(shift) * 0.3)
            )
        }, 0.035, Enum.EasingStyle.Sine)
        task.wait(0.035)
    end
    tween(mainFrame, {Position = start}, 0.4, Enum.EasingStyle.Back)

    task.wait(0.6)
    if stroke then tween(stroke, {Color = Theme.Border, Thickness = 1.5}, 0.6, Enum.EasingStyle.Exponential) end
end

local function openUrl(url)
    if setclipboard then
        setclipboard(url)
    end

    local opened = false

    if type(openBrowser) == "function" then
        pcall(function() openBrowser(url); opened = true end)
    elseif type(open_browser) == "function" then
        pcall(function() open_browser(url); opened = true end)
    end

    if not opened then
        pcall(function()
            game:GetService("GuiService"):OpenBrowserWindow(url)
            opened = true
        end)
    end

    if not opened and type(os) == "table" and type(os.execute) == "function" then
        pcall(function()
            os.execute('start "" "' .. url .. '"')
            opened = true
        end)
    end
end

buyBtn.MouseButton1Click:Connect(function()
    openUrl("https://phantomarket.org")
    notify("Premium Shop", "Shop link copied. Paste it in your browser", 5)
end)

getKeyBtn.MouseButton1Click:Connect(function()
    openUrl("https://ads.luarmor.net/get_key?for=Checkpoints_Linkvertise-HSVJWPYAuoAP")
    notify("Key System", "Key link copied. Paste it in your browser", 5)
end)

local authInProgress = false

local function checkKey(key, isAuto)
    if authInProgress then return end
    if not key or key == "" then
        errorShake()
        notify("Warning", "Key is required", 2)
        return
    end
    authInProgress = true

    loginBtn.Text = "Authenticating..."

    local scanActive = true
    task.spawn(function()
        scanBar.BackgroundTransparency = 0.82
        while scanActive do
            if scanBar and scanBar.Parent then
                scanBar.Position = UDim2.new(-0.3, 0, 0, 0)
                local info = TweenInfo.new(1.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
                local sweep = TweenService:Create(scanBar, info, {Position = UDim2.new(1, 0, 0, 0)})
                sweep:Play()
                sweep.Completed:Wait()
                task.wait(0.15)
            else
                break
            end
        end
        if scanBar and scanBar.Parent then
            scanBar.BackgroundTransparency = 1
        end
    end)

    task.spawn(function()
        local status = sdk.check_key(key)
        scanActive = false

        if status.code == "KEY_VALID" then
            getgenv().script_key = key
            saveKey(key)
            notify("Success", "Key Validated! Loading...", 3)

            if scanBar and scanBar.Parent then
                tween(scanBar, {Size = UDim2.new(1, 0, 1, 0), Position = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 0.7}, 0.3, Enum.EasingStyle.Exponential)
                task.wait(0.2)
                tween(scanBar, {BackgroundTransparency = 1}, 0.3, Enum.EasingStyle.Exponential)
            end

            local stroke = mainFrame:FindFirstChild("UIStroke")
            if stroke then
                tween(stroke, {Color = Theme.AccentGlow, Thickness = 2.5}, 0.3, Enum.EasingStyle.Exponential)
            end

            task.wait(0.4)

            for _, child in pairs(mainFrame:GetDescendants()) do
                pcall(function()
                    if child:IsA("TextLabel") or child:IsA("TextButton") or child:IsA("TextBox") then
                        tween(child, {TextTransparency = 1}, 0.35, Enum.EasingStyle.Exponential)
                    end
                    if child:IsA("ImageLabel") then
                        tween(child, {ImageTransparency = 1}, 0.35, Enum.EasingStyle.Exponential)
                    end
                    if child:IsA("Frame") or child:IsA("TextButton") then
                        tween(child, {BackgroundTransparency = 1}, 0.35, Enum.EasingStyle.Exponential)
                    end
                    if child:IsA("UIStroke") then
                        tween(child, {Transparency = 1}, 0.35, Enum.EasingStyle.Exponential)
                    end
                end)
            end

            task.wait(0.2)

            tween(mainFrame, {
                Size = SUCCESS_SIZE,
                BackgroundTransparency = 1
            }, 0.5, Enum.EasingStyle.Exponential)
            tween(shadow, {BackgroundTransparency = 1}, 0.4, Enum.EasingStyle.Exponential)
            if stroke then
                tween(stroke, {Transparency = 1}, 0.4, Enum.EasingStyle.Exponential)
            end

            task.wait(0.55)
            screenGui:Destroy()
            loadScript(key)
        else
            loginBtn.Text = "Check Key"
            if scanBar and scanBar.Parent then
                scanBar.BackgroundTransparency = 1
            end
            tween(loginBtn, {BackgroundTransparency = 0, BackgroundColor3 = Theme.Accent}, 0.2)

            local expired = status.code == "KEY_EXPIRED"
            if isAuto and expired then
                deleteSavedKey()
                notify("Key Expired", "Saved key is no longer valid. Need a new key.", 4)
            elseif isAuto then
                deleteSavedKey()
                local msg = "Saved key invalid. Need a new key."
                if status.code == "KEY_HWID_LOCKED" then
                    msg = "HWID Locked! Reset in Discord"
                end
                notify("Auth Error", msg, 4)
            else
                errorShake()
                local msg = "Invalid Key"
                if status.code == "KEY_HWID_LOCKED" then
                    msg = "HWID Locked! Reset in Discord"
                elseif expired then
                    msg = "Key Expired. Need a new key."
                    deleteSavedKey()
                end
                notify("Auth Error", msg, 3)
            end
            authInProgress = false
        end
    end)
end

loginBtn.MouseButton1Click:Connect(function()
    local key = keyInput.Text:gsub("%s+", "")
    checkKey(key, false)
end)

local function makeDraggable(frame)
    local dragging, dragInput, dragStart, startPos
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            local x = startPos.X.Offset + delta.X
            local y = startPos.Y.Offset + delta.Y
            tween(frame, {
                Position = UDim2.new(startPos.X.Scale, x, startPos.Y.Scale, y)
            }, 0.06, Enum.EasingStyle.Sine)
            tween(shadow, {
                Position = UDim2.new(startPos.X.Scale, x, startPos.Y.Scale, y + 6)
            }, 0.08, Enum.EasingStyle.Sine)
        end
    end)
end

makeDraggable(mainFrame)

task.spawn(function()
    tween(shadow, {BackgroundTransparency = 0.5, Position = UDim2.new(0.5, 0, 0.5, 6), Size = SHADOW_SIZE}, 0.6, Enum.EasingStyle.Exponential)

    tween(mainFrame, {BackgroundTransparency = 0, Position = UDim2.new(0.5, 0, 0.5, 0)}, 0.5, Enum.EasingStyle.Exponential)
    local mainStroke = mainFrame:FindFirstChild("UIStroke")
    if mainStroke then
        tween(mainStroke, {Transparency = 0}, 0.5, Enum.EasingStyle.Exponential)
    end
    tween(mainFrame, {Size = MAIN_SIZE}, 0.8, Enum.EasingStyle.Back)

    task.wait(0.25)

    tween(sidebar, {BackgroundTransparency = 0}, 0.45, Enum.EasingStyle.Exponential)
    local divider = sidebar:FindFirstChild("Divider")
    if divider then
        tween(divider, {BackgroundTransparency = 0}, 0.5, Enum.EasingStyle.Exponential)
    end

    task.wait(0.12)

    local avatar = avatarContainer:FindFirstChild("Avatar")
    if avatar then
        tween(avatar, {ImageTransparency = 0}, 0.45, Enum.EasingStyle.Exponential)
        local avatarStroke = avatar:FindFirstChild("UIStroke")
        if avatarStroke then
            tween(avatarStroke, {Transparency = 0}, 0.45, Enum.EasingStyle.Exponential)
        end
    end

    task.wait(0.06)

    tween(discordBtn, {BackgroundTransparency = 0, TextTransparency = 0}, 0.4, Enum.EasingStyle.Exponential)

    task.wait(0.18)

    typeText(titleLabel, "Phantom Softworks", 0.045)

    task.wait(0.08)

    typeText(welcomeLabel, "Welcome, " .. me.DisplayName, 0.028)

    task.wait(0.12)

    tween(userInputContainer, {BackgroundTransparency = 0}, 0.35, Enum.EasingStyle.Exponential)
    local userStroke = userInputContainer:FindFirstChild("UIStroke")
    if userStroke then tween(userStroke, {Transparency = 0}, 0.35, Enum.EasingStyle.Exponential) end

    task.wait(0.1)

    tween(keyInputContainer, {BackgroundTransparency = 0}, 0.35, Enum.EasingStyle.Exponential)
    local keyStroke = keyInputContainer:FindFirstChild("UIStroke")
    if keyStroke then tween(keyStroke, {Transparency = 0}, 0.35, Enum.EasingStyle.Exponential) end
    tween(eyeBtn, {ImageTransparency = 0}, 0.35, Enum.EasingStyle.Exponential)

    task.wait(0.12)

    tween(loginBtn, {BackgroundTransparency = 0, TextTransparency = 0}, 0.35, Enum.EasingStyle.Exponential)

    task.spawn(function()
        task.wait(0.2)

        local saved = loadSavedKey()
        if saved and saved ~= "" then
            keyInput.Text = saved
            notify("Auto Login", "Checking saved key...", 2)
            checkKey(saved, true)
        end
    end)

    task.wait(0.1)

    tween(getKeyBtn, {BackgroundTransparency = 1, TextTransparency = 0}, 0.35, Enum.EasingStyle.Exponential)
    local getKeyStroke = getKeyBtn:FindFirstChild("UIStroke")
    if getKeyStroke then tween(getKeyStroke, {Transparency = 0}, 0.35, Enum.EasingStyle.Exponential) end

    task.wait(0.1)

    tween(buyBtn, {TextTransparency = 0}, 0.35, Enum.EasingStyle.Exponential)
    local buyStroke = buyBtn:FindFirstChild("UIStroke")
    if buyStroke then tween(buyStroke, {Transparency = 0}, 0.35, Enum.EasingStyle.Exponential) end

    task.wait(0.3)

    task.spawn(function()
        local av = avatarContainer:FindFirstChild("Avatar")
        if not av then return end
        local avStroke = av:FindFirstChild("UIStroke")
        if not avStroke then return end
        while av and av.Parent and avStroke and avStroke.Parent do
            tween(avStroke, {Thickness = 3, Color = Theme.AccentGlow}, 1.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
            task.wait(1.8)
            if not av or not av.Parent then break end
            tween(avStroke, {Thickness = 2, Color = Theme.TitleBarLine}, 1.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
            task.wait(1.8)
        end
    end)

    task.spawn(function()
        while mainFrame and mainFrame.Parent do
            local ms = mainFrame:FindFirstChild("UIStroke")
            if ms then
                tween(ms, {Color = Theme.AccentGlow}, 2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
                task.wait(2)
                if not mainFrame or not mainFrame.Parent then break end
                tween(ms, {Color = Theme.Border}, 2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
                task.wait(2)
            else
                break
            end
        end
    end)
end)
