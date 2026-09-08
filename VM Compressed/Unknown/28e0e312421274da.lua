repeat task.wait() until game:IsLoaded()
local API = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
local tween_service = game:GetService("TweenService")
local user_input_service = game:GetService("UserInputService")
local core_gui = game:GetService("CoreGui")
local players = game:GetService("Players")
local local_player = players.LocalPlayer

local function create_instance(class_name, properties, children)
    local instance = Instance.new(class_name)
    for key, value in pairs(properties) do instance[key] = value end
    if children then for _, child in pairs(children) do child.Parent = instance end end
    return instance
end

local function create_tween(instance, properties, duration, easing_style, easing_direction)
    local info = TweenInfo.new(
        duration or 0.3,
        easing_style or Enum.EasingStyle.Quart,
        easing_direction or Enum.EasingDirection.Out
    )
    local tween = tween_service:Create(instance, info, properties)
    tween:Play()
    return tween
end

local function create_bounce_tween(instance, properties, duration)
    local info = TweenInfo.new(
        duration or 0.5,
        Enum.EasingStyle.Back,
        Enum.EasingDirection.Out
    )
    local tween = tween_service:Create(instance, info, properties)
    tween:Play()
    return tween
end

local function create_smooth_tween(instance, properties, duration)
    local info = TweenInfo.new(
        duration or 0.4,
        Enum.EasingStyle.Exponential,
        Enum.EasingDirection.Out
    )
    local tween = tween_service:Create(instance, info, properties)
    tween:Play()
    return tween
end

local GAME_SCRIPTS = {
    ["Rivals"] = "f734cbc6d30b72abe044a3fb60543345",
    ["Flick"] = "9a65bec4c321b3f25f47a860831e9b2d",
    ["BladeBall"] = "f4b067ed49f105456b6b3900bc1a4ef9",
    ["SailorPiece"] = "66387fa15569b822d2ea55a5faabe87c",
    ["SlimeRNG"] = "7a8b76f35bce8a800da3cd7aad830bcd",
    ["TypeSoul"] = "5f6af3cb21fee478aa17493db9e1853b",
    ["Default"] = "18fa0aa2984290b5582813fe581dd4cf"
}

local function get_script_id()
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
    end
    return GAME_SCRIPTS["Default"]
end

API.script_id = get_script_id()

local ACTOR_RUN = rawget(getfenv(0), "run_on_actor")
local ACTOR_GET = rawget(getfenv(0), "getactors") or rawget(getfenv(0), "get_actors")
local ACTOR_AVAILABLE = typeof(ACTOR_RUN) == "function" and typeof(ACTOR_GET) == "function"

local function pick_actor()
    if not ACTOR_AVAILABLE then return nil end
    local ok, actors = pcall(ACTOR_GET)
    if not ok or type(actors) ~= "table" then return nil end
    for _, actor in ipairs(actors) do
        if typeof(actor) == "Instance" and actor:IsA("Actor") and actor.Parent then
            return actor
        end
    end
    return nil
end

local function run_on_actor(source, key)
    if not source or source == "" then return false, "empty source" end
    local actor = pick_actor()
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
        ACTOR_RUN(actor, wrapper, source, key or "")
    end)
    if ok then return true end
    return false, tostring(err)
end

local function fetch_script_source(hash)
    if not hash or hash == "" then return nil, "empty hash" end
    local url = "https://api.luarmor.net/files/v3/loaders/" .. tostring(hash) .. ".lua"
    local ok, source = pcall(function() return game:HttpGet(url) end)
    if ok and type(source) == "string" and #source > 0 then
        return source
    end
    return nil, tostring(source)
end

local function load_script(key)
    local hash = API.script_id
    local source = fetch_script_source(hash)
    if source then
        local actor_ok = run_on_actor(source, key)
        if actor_ok then return true end

        if key and key ~= "" then
            pcall(function() getgenv().script_key = key end)
        end
        local direct_ok = pcall(function()
            local chunk = loadstring(source)
            if chunk then chunk() end
        end)
        if direct_ok then return true end
    end

    local ok = pcall(function() API.load_script() end)
    return ok
end

local KEY_FOLDER = "KEY"
local KEY_FILE = KEY_FOLDER .. "/key.txt"

local function has_file_api()
    return typeof(isfile) == "function"
        and typeof(readfile) == "function"
        and typeof(writefile) == "function"
        and typeof(isfolder) == "function"
        and typeof(makefolder) == "function"
end

local function ensure_key_folder()
    if not has_file_api() then return end
    pcall(function()
        if not isfolder(KEY_FOLDER) then makefolder(KEY_FOLDER) end
    end)
end

local function save_key(key)
    if not has_file_api() or not key or key == "" then return end
    pcall(function()
        ensure_key_folder()
        writefile(KEY_FILE, key)
    end)
end

local function load_saved_key()
    if not has_file_api() then return nil end
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

local function delete_saved_key()
    if not has_file_api() then return end
    pcall(function()
        if isfile(KEY_FILE) and typeof(delfile) == "function" then
            delfile(KEY_FILE)
        end
    end)
end

ensure_key_folder()

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

local is_mobile = user_input_service.TouchEnabled
local MAIN_SIZE = is_mobile and UDim2.new(0, 420, 0, 250) or UDim2.new(0, 600, 0, 350)
local SHADOW_SIZE = is_mobile and UDim2.new(0, 354, 0, 249) or UDim2.new(0, 504, 0, 349)
local SUCCESS_SIZE = is_mobile and UDim2.new(0, 360, 0, 260) or UDim2.new(0, 520, 0, 360)
local SIDEBAR_WIDTH = is_mobile and 110 or 160
local padding = is_mobile and 15 or 30
local btn_height = is_mobile and 28 or 38

local y_username = is_mobile and 65 or 110
local y_key = is_mobile and 100 or 158
local y_login = is_mobile and 135 or 205
local y_getkey = is_mobile and 170 or 253
local y_buy = is_mobile and 205 or 299

local function typewriter(label, full_text, base_delay)
    local d = base_delay or 0.035
    for i = 1, #full_text do
        if not label or not label.Parent then return end
        label.Text = string.sub(full_text, 1, i)
        local c = string.sub(full_text, i, i)
        if c == " " then
            task.wait(d * 0.5)
        elseif c == "," or c == "." then
            task.wait(d * 2.5)
        else
            task.wait(d + (math.random() * 0.012))
        end
    end
end

local function show_notification(title_text, message_text, display_duration)
    local screen = core_gui:FindFirstChild("PhantomLoader")
    if not screen then return end

    local container = screen:FindFirstChild("NotifContainer")
    if not container then
        container = create_instance("Frame", {
            Name = "NotifContainer",
            Parent = screen,
            BackgroundTransparency = 1,
            Position = UDim2.new(1, -20, 1, -20),
            Size = UDim2.new(0, 300, 1, 0),
            AnchorPoint = Vector2.new(1, 1)
        }, {
            create_instance("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Bottom,
                Padding = UDim.new(0, 8)
            })
        })
    end

    local dur = display_duration or 3

    local notif = create_instance("Frame", {
        Parent = container,
        BackgroundColor3 = Theme.Background,
        Size = UDim2.new(1, 0, 0, 0),
        BorderSizePixel = 0,
        ClipsDescendants = true,
        BackgroundTransparency = 0.3
    }, {
        create_instance("UICorner", {CornerRadius = UDim.new(0, 6)}),
        create_instance("UIStroke", {Color = Theme.Border, Thickness = 1, Transparency = 0.5}),
        create_instance("Frame", {
            Name = "AccentBar",
            BackgroundColor3 = Theme.Accent,
            Position = UDim2.new(0, 0, 0, 0),
            Size = UDim2.new(0, 3, 0, 0),
            BorderSizePixel = 0
        }),
        create_instance("Frame", {
            Name = "TimerBar",
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 0.75,
            Position = UDim2.new(0, 0, 1, -2),
            Size = UDim2.new(1, 0, 0, 2),
            BorderSizePixel = 0
        }),
        create_instance("TextLabel", {
            Name = "Title",
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 14, 0, 10),
            Size = UDim2.new(1, -26, 0, 20),
            Font = Enum.Font.GothamBold,
            Text = title_text or "Notification",
            TextColor3 = Theme.Text,
            TextSize = 13,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextTransparency = 1
        }),
        create_instance("TextLabel", {
            Name = "Desc",
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 14, 0, 28),
            Size = UDim2.new(1, -26, 0, 20),
            Font = Enum.Font.Gotham,
            Text = message_text or "",
            TextColor3 = Theme.Text,
            TextSize = 12,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextTransparency = 1
        })
    })

    create_smooth_tween(notif, {Size = UDim2.new(1, 0, 0, 60), BackgroundTransparency = 0}, 0.4)

    local title_el = notif:FindFirstChild("Title")
    local desc_el = notif:FindFirstChild("Desc")
    local accent_bar = notif:FindFirstChild("AccentBar")
    local timer_bar = notif:FindFirstChild("TimerBar")
    local stroke = notif:FindFirstChild("UIStroke")

    task.delay(0.15, function()
        if title_el and title_el.Parent then
            create_smooth_tween(title_el, {TextTransparency = 0}, 0.35)
        end
    end)
    task.delay(0.22, function()
        if desc_el and desc_el.Parent then
            create_smooth_tween(desc_el, {TextTransparency = 0}, 0.35)
        end
    end)
    task.delay(0.1, function()
        if accent_bar and accent_bar.Parent then
            create_smooth_tween(accent_bar, {Size = UDim2.new(0, 3, 1, 0)}, 0.6)
        end
    end)
    if stroke then
        create_smooth_tween(stroke, {Transparency = 0}, 0.4)
    end

    task.delay(0.4, function()
        if timer_bar and timer_bar.Parent then
            local ti = TweenInfo.new(dur - 0.4, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
            tween_service:Create(timer_bar, ti, {Size = UDim2.new(0, 0, 0, 2)}):Play()
        end
    end)

    task.delay(dur, function()
        if notif and notif.Parent then
            if title_el and title_el.Parent then
                create_tween(title_el, {TextTransparency = 1}, 0.2)
            end
            if desc_el and desc_el.Parent then
                create_tween(desc_el, {TextTransparency = 1}, 0.2)
            end
            if accent_bar and accent_bar.Parent then
                create_tween(accent_bar, {Size = UDim2.new(0, 3, 0, 0), BackgroundTransparency = 1}, 0.25)
            end

            task.wait(0.12)

            if notif and notif.Parent then
                create_tween(notif, {BackgroundTransparency = 1}, 0.2)
                if stroke and stroke.Parent then
                    create_tween(stroke, {Transparency = 1}, 0.2)
                end

                task.wait(0.1)

                if notif and notif.Parent then
                    create_smooth_tween(notif, {Size = UDim2.new(1, 0, 0, 0)}, 0.3)
                    task.wait(0.35)
                    if notif and notif.Parent then
                        notif:Destroy()
                    end
                end
            end
        end
    end)
end

if core_gui:FindFirstChild("PhantomLoader") then
    core_gui.PhantomLoader:Destroy()
end

local screen_gui = create_instance("ScreenGui", {
    Name = "PhantomLoader",
    Parent = core_gui
})

local shadow = create_instance("Frame", {
    Name = "Shadow",
    Parent = screen_gui,
    BackgroundColor3 = Color3.fromRGB(0, 0, 0),
    Position = UDim2.new(0.5, 4, 0.5, 24),
    Size = UDim2.new(0, 0, 0, 0),
    AnchorPoint = Vector2.new(0.5, 0.5),
    BorderSizePixel = 0,
    BackgroundTransparency = 1
}, {
    create_instance("UICorner", {CornerRadius = UDim.new(0, 12)})
})

local main_frame = create_instance("Frame", {
    Name = "MainFrame",
    Parent = screen_gui,
    BackgroundColor3 = Theme.Background,
    Position = UDim2.new(0.5, 0, 0.5, 20),
    Size = UDim2.new(0, 0, 0, 0),
    AnchorPoint = Vector2.new(0.5, 0.5),
    BorderSizePixel = 0,
    BackgroundTransparency = 1,
    ClipsDescendants = true
}, {
    create_instance("UICorner", {CornerRadius = UDim.new(0, 10)}),
    create_instance("UIStroke", {Color = Theme.Border, Thickness = 1.5, Transparency = 1})
})

local sidebar = create_instance("Frame", {
    Name = "Sidebar",
    Parent = main_frame,
    BackgroundColor3 = Theme.Sidebar,
    Size = UDim2.new(0, SIDEBAR_WIDTH, 1, 0),
    BorderSizePixel = 0,
    BackgroundTransparency = 1
}, {
    create_instance("UICorner", {CornerRadius = UDim.new(0, 10)}),
    create_instance("Frame", {
        Name = "Divider",
        BackgroundColor3 = Theme.TitleBarLine,
        Position = UDim2.new(1, -1, 0, 10),
        Size = UDim2.new(0, 1, 1, -20),
        BorderSizePixel = 0,
        BackgroundTransparency = 1
    })
})

local avatar_container = create_instance("Frame", {
    Parent = sidebar,
    BackgroundTransparency = 1,
    Position = UDim2.new(0, 0, 0, is_mobile and 15 or 40),
    Size = UDim2.new(1, 0, 0, is_mobile and 70 or 100)
}, {
    create_instance("ImageLabel", {
        Name = "Avatar",
        BackgroundTransparency = 1,
        Position = is_mobile and UDim2.new(0.5, -20, 0, 0) or UDim2.new(0.5, -30, 0, 0),
        Size = is_mobile and UDim2.new(0, 40, 0, 40) or UDim2.new(0, 60, 0, 60),
        Image = "rbxassetid://0",
        ImageTransparency = 1
    }, {
        create_instance("UICorner", {CornerRadius = UDim.new(1, 0)}),
        create_instance("UIStroke", {Color = Theme.TitleBarLine, Thickness = 2, Transparency = 1})
    })
})

task.spawn(function()
    local success, thumb = pcall(function()
        return players:GetUserThumbnailAsync(
            local_player.UserId,
            Enum.ThumbnailType.AvatarBust,
            Enum.ThumbnailSize.Size420x420
        )
    end)
    if success then avatar_container.Avatar.Image = thumb end
end)

local content = create_instance("Frame", {
    Parent = main_frame,
    BackgroundTransparency = 1,
    Position = UDim2.new(0, SIDEBAR_WIDTH, 0, 0),
    Size = UDim2.new(1, -SIDEBAR_WIDTH, 1, 0)
})

local title_label = create_instance("TextLabel", {
    Name = "TitleLabel",
    Parent = content,
    BackgroundTransparency = 1,
    Position = UDim2.new(0, padding, 0, is_mobile and 12 or 40),
    Size = UDim2.new(1, -padding*2, 0, is_mobile and 20 or 30),
    Font = Enum.Font.GothamBold,
    Text = "",
    TextColor3 = Theme.Text,
    TextSize = is_mobile and 15 or 20,
    TextXAlignment = Enum.TextXAlignment.Left
})

local welcome_label = create_instance("TextLabel", {
    Name = "WelcomeLabel",
    Parent = content,
    BackgroundTransparency = 1,
    Position = UDim2.new(0, padding, 0, is_mobile and 34 or 65),
    Size = UDim2.new(1, -padding*2, 0, 20),
    Font = Enum.Font.Gotham,
    Text = "",
    TextColor3 = Theme.Text,
    TextSize = is_mobile and 11 or 13,
    TextXAlignment = Enum.TextXAlignment.Left
})

local function create_styled_input(placeholder, y_pos, is_password)
    local input_container = create_instance("Frame", {
        Parent = content,
        BackgroundColor3 = Theme.Input,
        Position = UDim2.new(0, padding, 0, y_pos),
        Size = UDim2.new(1, -padding*2, 0, btn_height),
        BorderSizePixel = 0,
        BackgroundTransparency = 1
    }, {
        create_instance("UICorner", {CornerRadius = UDim.new(0, 6)}),
        create_instance("UIStroke", {Color = Theme.ElementBorder, Thickness = 1, Transparency = 1})
    })

    local textbox = create_instance("TextBox", {
        Parent = input_container,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 12, 0, 0),
        Size = UDim2.new(1, -24, 1, 0),
        Font = Enum.Font.Gotham,
        Text = "",
        PlaceholderText = placeholder,
        PlaceholderColor3 = Theme.Placeholder,
        TextColor3 = Theme.Text,
        TextSize = is_mobile and 11 or 13,
        TextXAlignment = Enum.TextXAlignment.Left,
        ClearTextOnFocus = false
    })

    if is_password then
        local mask = create_instance("TextLabel", {
            Parent = input_container,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 12, 0, 0),
            Size = UDim2.new(1, -24, 1, 0),
            Font = Enum.Font.GothamBold,
            Text = "",
            TextColor3 = Theme.Text,
            TextSize = is_mobile and 12 or 14,
            TextXAlignment = Enum.TextXAlignment.Left,
            ZIndex = 2
        })
        textbox.TextTransparency = 1
        textbox:GetPropertyChangedSignal("Text"):Connect(function()
            mask.Text = string.rep("\226\128\162", #textbox.Text)
        end)
    end

    local focus_line = create_instance("Frame", {
        Name = "FocusLine",
        Parent = input_container,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 0.6,
        Position = UDim2.new(0.5, 0, 1, -2),
        AnchorPoint = Vector2.new(0.5, 0),
        Size = UDim2.new(0, 0, 0, 2),
        BorderSizePixel = 0
    })

    textbox.Focused:Connect(function()
        create_smooth_tween(input_container:FindFirstChild("UIStroke"), {Color = Color3.fromRGB(80, 80, 80), Thickness = 1.5}, 0.25)
        create_smooth_tween(input_container, {BackgroundColor3 = Theme.InputFocus}, 0.25)
        create_smooth_tween(focus_line, {Size = UDim2.new(0.9, 0, 0, 2)}, 0.35)
    end)
    textbox.FocusLost:Connect(function()
        create_smooth_tween(input_container:FindFirstChild("UIStroke"), {Color = Theme.ElementBorder, Thickness = 1}, 0.35)
        create_smooth_tween(input_container, {BackgroundColor3 = Theme.Input}, 0.35)
        create_smooth_tween(focus_line, {Size = UDim2.new(0, 0, 0, 2)}, 0.3)
    end)

    return textbox, input_container
end

local user_input, user_input_container = create_styled_input("Username", y_username, false)
user_input.Text = local_player.Name
local key_input, key_input_container = create_styled_input("Enter License Key", y_key, true)

local function create_button(text, y_pos, is_primary)
    local btn = create_instance("TextButton", {
        Parent = content,
        BackgroundColor3 = is_primary and Theme.Accent or Theme.Background,
        Position = UDim2.new(0, padding, 0, y_pos),
        Size = UDim2.new(1, -padding*2, 0, btn_height),
        AutoButtonColor = false,
        Text = text,
        Font = Enum.Font.GothamBold,
        TextColor3 = Theme.Text,
        TextSize = is_mobile and 11 or 13,
        BackgroundTransparency = 1,
        TextTransparency = 1,
        ClipsDescendants = true
    }, {
        create_instance("UICorner", {CornerRadius = UDim.new(0, 6)}),
        not is_primary and create_instance("UIStroke", {Color = Theme.ElementBorder, Thickness = 1, Transparency = 1}) or nil
    })

    local underline = create_instance("Frame", {
        Name = "Underline",
        Parent = btn,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 0.5,
        Position = UDim2.new(0, 0, 1, -2),
        Size = UDim2.new(0, 0, 0, 2),
        BorderSizePixel = 0
    })

    btn.MouseEnter:Connect(function()
        if is_primary then
            create_smooth_tween(btn, {BackgroundTransparency = 0.15}, 0.2)
        else
            local s = btn:FindFirstChild("UIStroke")
            if s then create_smooth_tween(s, {Color = Color3.fromRGB(90, 90, 90)}, 0.25) end
        end
        create_smooth_tween(underline, {Size = UDim2.new(1, 0, 0, 2)}, 0.3)
    end)

    btn.MouseLeave:Connect(function()
        if is_primary then
            create_smooth_tween(btn, {BackgroundTransparency = 0}, 0.25)
        else
            local s = btn:FindFirstChild("UIStroke")
            if s then create_smooth_tween(s, {Color = Theme.ElementBorder}, 0.3) end
        end
        create_smooth_tween(underline, {Size = UDim2.new(0, 0, 0, 2)}, 0.25)
    end)

    return btn
end

local login_btn = create_button("Check Key", y_login, true)
local get_key_btn = create_button("Get your free key", y_getkey, false)
local buy_btn = create_button("Buy Premium", y_buy, false)

task.spawn(function()
    while buy_btn and buy_btn.Parent do
        create_smooth_tween(buy_btn, {BackgroundColor3 = Color3.fromRGB(180, 30, 45), BackgroundTransparency = 0}, 1.5)
        task.wait(1.5)
        if not buy_btn or not buy_btn.Parent then break end
        create_smooth_tween(buy_btn, {BackgroundColor3 = Color3.fromRGB(60, 5, 12), BackgroundTransparency = 0}, 1.5)
        task.wait(1.5)
    end
end)

local scan_bar = create_instance("Frame", {
    Name = "ScanBar",
    Parent = login_btn,
    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    BackgroundTransparency = 1,
    Position = UDim2.new(-0.3, 0, 0, 0),
    Size = UDim2.new(0.3, 0, 1, 0),
    BorderSizePixel = 0,
    ZIndex = 2
}, {
    create_instance("UICorner", {CornerRadius = UDim.new(0, 6)})
})

local discord_btn = create_instance("TextButton", {
    Parent = sidebar,
    BackgroundColor3 = Theme.Dialog,
    BackgroundTransparency = 1,
    Position = UDim2.new(0, 10, 0, is_mobile and 70 or 115),
    Size = UDim2.new(1, -20, 0, is_mobile and 25 or 30),
    Text = "Join Our Discord",
    Font = Enum.Font.GothamBold,
    TextColor3 = Theme.Text,
    TextSize = is_mobile and 10 or 12,
    AutoButtonColor = false,
    TextTransparency = 1
}, {
    create_instance("UICorner", {CornerRadius = UDim.new(0, 6)})
})

discord_btn.MouseEnter:Connect(function()
    create_smooth_tween(discord_btn, {BackgroundTransparency = 0.2}, 0.25)
end)
discord_btn.MouseLeave:Connect(function()
    create_smooth_tween(discord_btn, {BackgroundTransparency = 0}, 0.3)
end)

local function open_discord()
    if setclipboard then
        setclipboard("https://discord.gg/6S7gHAPg3A")
    end
    show_notification("Discord", "Invite link copied to clipboard", 5)
    pcall(function()
        local inviter = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Discord%20Inviter/Source.lua"))()
        inviter.Join("https://discord.gg/6S7gHAPg3A")
    end)
end

discord_btn.MouseButton1Click:Connect(open_discord)

local function handle_error()
    local stroke = main_frame:FindFirstChild("UIStroke")
    if stroke then create_tween(stroke, {Color = Theme.Error, Thickness = 2.5}, 0.08) end

    local original_pos = main_frame.Position
    for i = 1, 8 do
        local intensity = 6 * (1 - (i / 9))
        local shift = (i % 2 == 0) and intensity or -intensity
        create_tween(main_frame, {
            Position = UDim2.new(
                original_pos.X.Scale, original_pos.X.Offset + shift,
                original_pos.Y.Scale, original_pos.Y.Offset + (math.abs(shift) * 0.3)
            )
        }, 0.035, Enum.EasingStyle.Sine)
        task.wait(0.035)
    end
    create_bounce_tween(main_frame, {Position = original_pos}, 0.4)

    task.wait(0.6)
    if stroke then create_smooth_tween(stroke, {Color = Theme.Border, Thickness = 1.5}, 0.6) end
end

local function open_url(url)
    if setclipboard then
        setclipboard(url)
    end

    local success = false

    if type(openBrowser) == "function" then
        pcall(function() openBrowser(url); success = true end)
    elseif type(open_browser) == "function" then
        pcall(function() open_browser(url); success = true end)
    end

    if not success then
        pcall(function()
            game:GetService("GuiService"):OpenBrowserWindow(url)
            success = true
        end)
    end

    if not success and type(os) == "table" and type(os.execute) == "function" then
        pcall(function()
            os.execute('start "" "' .. url .. '"')
            success = true
        end)
    end
end

buy_btn.MouseButton1Click:Connect(function()
    open_url("https://phantomarket.org")
    show_notification("Premium Shop", "Shop link copied. Paste in your browser", 5)
end)

get_key_btn.MouseButton1Click:Connect(function()
    open_url("https://ads.luarmor.net/get_key?for=Checkpoints_Lootlabs-ImvwfHuyshbf")
    show_notification("Get Key", "Key link copied. Paste in your browser", 5)
end)

local auth_in_progress = false

local function perform_key_check(key, is_auto)
    if auth_in_progress then return end
    if not key or key == "" then
        handle_error()
        show_notification("Warning", "Key is required", 2)
        return
    end
    auth_in_progress = true

    login_btn.Text = "Authenticating..."

    local scan_active = true
    task.spawn(function()
        scan_bar.BackgroundTransparency = 0.82
        while scan_active do
            if scan_bar and scan_bar.Parent then
                scan_bar.Position = UDim2.new(-0.3, 0, 0, 0)
                local si = TweenInfo.new(1.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
                local st = tween_service:Create(scan_bar, si, {Position = UDim2.new(1, 0, 0, 0)})
                st:Play()
                st.Completed:Wait()
                task.wait(0.15)
            else
                break
            end
        end
        if scan_bar and scan_bar.Parent then
            scan_bar.BackgroundTransparency = 1
        end
    end)

    task.spawn(function()
        local status = API.check_key(key)
        scan_active = false

        if status.code == "KEY_VALID" then
            getgenv().script_key = key
            save_key(key)
            show_notification("Success", "Key Validated! Loading...", 3)

            if scan_bar and scan_bar.Parent then
                create_smooth_tween(scan_bar, {Size = UDim2.new(1, 0, 1, 0), Position = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 0.7}, 0.3)
                task.wait(0.2)
                create_smooth_tween(scan_bar, {BackgroundTransparency = 1}, 0.3)
            end

            local stroke = main_frame:FindFirstChild("UIStroke")
            if stroke then
                create_smooth_tween(stroke, {Color = Color3.fromRGB(80, 80, 80), Thickness = 2.5}, 0.3)
            end

            task.wait(0.4)

            for _, child in pairs(main_frame:GetDescendants()) do
                pcall(function()
                    if child:IsA("TextLabel") or child:IsA("TextButton") or child:IsA("TextBox") then
                        create_smooth_tween(child, {TextTransparency = 1}, 0.35)
                    end
                    if child:IsA("ImageLabel") then
                        create_smooth_tween(child, {ImageTransparency = 1}, 0.35)
                    end
                    if child:IsA("Frame") or child:IsA("TextButton") then
                        create_smooth_tween(child, {BackgroundTransparency = 1}, 0.35)
                    end
                    if child:IsA("UIStroke") then
                        create_smooth_tween(child, {Transparency = 1}, 0.35)
                    end
                end)
            end

            task.wait(0.2)

            create_smooth_tween(main_frame, {
                Size = SUCCESS_SIZE,
                BackgroundTransparency = 1
            }, 0.5)
            create_smooth_tween(shadow, {BackgroundTransparency = 1}, 0.4)
            if stroke then
                create_smooth_tween(stroke, {Transparency = 1}, 0.4)
            end

            task.wait(0.55)
            screen_gui:Destroy()
            load_script(key)
        else
            login_btn.Text = "Check Key"
            if scan_bar and scan_bar.Parent then
                scan_bar.BackgroundTransparency = 1
            end
            create_tween(login_btn, {BackgroundTransparency = 0, BackgroundColor3 = Theme.Accent}, 0.2)

            local is_expired = status.code == "KEY_EXPIRED"
            if is_auto and is_expired then
                delete_saved_key()
                show_notification("Key Expired", "Saved key is no longer valid. Need a new key.", 4)
            elseif is_auto then
                delete_saved_key()
                local err_msg = "Saved key invalid. Need a new key."
                if status.code == "KEY_HWID_LOCKED" then
                    err_msg = "HWID Locked! Reset in Discord"
                end
                show_notification("Auth Error", err_msg, 4)
            else
                handle_error()
                local err_msg = "Invalid Key"
                if status.code == "KEY_HWID_LOCKED" then
                    err_msg = "HWID Locked! Reset in Discord"
                elseif is_expired then
                    err_msg = "Key Expired. Need a new key."
                    delete_saved_key()
                end
                show_notification("Auth Error", err_msg, 3)
            end
            auth_in_progress = false
        end
    end)
end

login_btn.MouseButton1Click:Connect(function()
    local key = key_input.Text:gsub("%s+", "")
    perform_key_check(key, false)
end)

local function make_draggable(frame)
    local dragging, drag_input, drag_start, start_pos
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            drag_start = input.Position
            start_pos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            drag_input = input
        end
    end)
    user_input_service.InputChanged:Connect(function(input)
        if input == drag_input and dragging then
            local delta = input.Position - drag_start
            create_tween(frame, {
                Position = UDim2.new(
                    start_pos.X.Scale, start_pos.X.Offset + delta.X,
                    start_pos.Y.Scale, start_pos.Y.Offset + delta.Y
                )
            }, 0.06, Enum.EasingStyle.Sine)
            if shadow and shadow.Parent then
                create_tween(shadow, {
                    Position = UDim2.new(
                        start_pos.X.Scale, start_pos.X.Offset + delta.X + 4,
                        start_pos.Y.Scale, start_pos.Y.Offset + delta.Y + 4
                    )
                }, 0.08, Enum.EasingStyle.Sine)
            end
        end
    end)
end

make_draggable(main_frame)

task.spawn(function()
    create_smooth_tween(shadow, {BackgroundTransparency = 0.6, Position = UDim2.new(0.5, 4, 0.5, 4), Size = SHADOW_SIZE}, 0.6)

    create_smooth_tween(main_frame, {BackgroundTransparency = 0, Position = UDim2.new(0.5, 0, 0.5, 0)}, 0.5)
    local main_stroke = main_frame:FindFirstChild("UIStroke")
    if main_stroke then
        create_smooth_tween(main_stroke, {Transparency = 0}, 0.5)
    end
    create_bounce_tween(main_frame, {Size = MAIN_SIZE}, 0.8)

    task.wait(0.25)

    create_smooth_tween(sidebar, {BackgroundTransparency = 0}, 0.45)
    local divider = sidebar:FindFirstChild("Divider")
    if divider then
        create_smooth_tween(divider, {BackgroundTransparency = 0}, 0.5)
    end

    task.wait(0.12)

    local avatar = avatar_container:FindFirstChild("Avatar")
    if avatar then
        create_smooth_tween(avatar, {ImageTransparency = 0}, 0.45)
        local avatar_stroke = avatar:FindFirstChild("UIStroke")
        if avatar_stroke then
            create_smooth_tween(avatar_stroke, {Transparency = 0}, 0.45)
        end
    end

    task.wait(0.06)

    create_smooth_tween(discord_btn, {BackgroundTransparency = 0, TextTransparency = 0}, 0.4)

    task.wait(0.18)

    typewriter(title_label, "Phantom Softworks", 0.045)

    task.wait(0.08)

    typewriter(welcome_label, "Welcome, " .. local_player.DisplayName, 0.028)

    task.wait(0.12)

    create_smooth_tween(user_input_container, {BackgroundTransparency = 0}, 0.35)
    local user_stroke = user_input_container:FindFirstChild("UIStroke")
    if user_stroke then create_smooth_tween(user_stroke, {Transparency = 0}, 0.35) end

    task.wait(0.1)

    create_smooth_tween(key_input_container, {BackgroundTransparency = 0}, 0.35)
    local key_stroke = key_input_container:FindFirstChild("UIStroke")
    if key_stroke then create_smooth_tween(key_stroke, {Transparency = 0}, 0.35) end

    task.wait(0.12)

    create_smooth_tween(login_btn, {BackgroundTransparency = 0, TextTransparency = 0}, 0.35)

    task.spawn(function()
        task.wait(0.2)

        local saved = load_saved_key()
        if saved and saved ~= "" then
            key_input.Text = saved
            show_notification("Auto Login", "Checking saved key...", 2)
            perform_key_check(saved, true)
        end
    end)

    task.wait(0.1)

    create_smooth_tween(get_key_btn, {BackgroundTransparency = 1, TextTransparency = 0}, 0.35)
    local getkey_stroke = get_key_btn:FindFirstChild("UIStroke")
    if getkey_stroke then create_smooth_tween(getkey_stroke, {Transparency = 0}, 0.35) end

    task.wait(0.1)

    create_smooth_tween(buy_btn, {TextTransparency = 0}, 0.35)
    local buy_stroke = buy_btn:FindFirstChild("UIStroke")
    if buy_stroke then create_smooth_tween(buy_stroke, {Transparency = 0}, 0.35) end

    task.wait(0.3)

    task.spawn(function()
        local av = avatar_container:FindFirstChild("Avatar")
        if not av then return end
        local av_stroke = av:FindFirstChild("UIStroke")
        if not av_stroke then return end
        while av and av.Parent and av_stroke and av_stroke.Parent do
            create_tween(av_stroke, {Thickness = 3, Color = Color3.fromRGB(120, 120, 120)}, 1.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
            task.wait(1.8)
            if not av or not av.Parent then break end
            create_tween(av_stroke, {Thickness = 2, Color = Theme.TitleBarLine}, 1.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
            task.wait(1.8)
        end
    end)

    task.spawn(function()
        while main_frame and main_frame.Parent do
            local ms = main_frame:FindFirstChild("UIStroke")
            if ms then
                create_tween(ms, {Color = Color3.fromRGB(65, 65, 65)}, 2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
                task.wait(2)
                if not main_frame or not main_frame.Parent then break end
                create_tween(ms, {Color = Theme.Border}, 2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
                task.wait(2)
            else
                break
            end
        end
    end)
end)
