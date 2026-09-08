if _G.L_HUB_LOADED then return end
_G.L_HUB_LOADED = true

local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer

local function create(class, props)
    local inst = Instance.new(class)
    for i, v in next, props do
        inst[i] = v
    end
    return inst
end

local function safeLoad(url)
    local success, result = pcall(function()
        return loadstring(game:HttpGet(url))()
    end)
    return success and result or nil
end

local api = safeLoad("https://sdkapi-public.luarmor.net/library.lua")

local PROJECTS = {
    [75992362647444] = { Name = "Tap Simulator", ID = "08a453c1aa8f63abbae4ff5dc4b458cb" },
    [124311897657957] = { Name = "Break a Lucky Block", ID = "b12a11c21c2bccb5112270bcc5253fa4" },
}
local FALLBACK = { 
    Name = "L-HUB MAIN", 
    ID = "0c2754c64404c836e710a66dc4dfd3a5", 
    Discord = "https://discord.gg/DTDybHJjNr",
    Linkvertise = "https://ads.luarmor.net/get_key?for=LHUB_Key-QhPjLgTFwBSW",
    WorkInk = "https://ads.luarmor.net/get_key?for=LHUB_Key_WorkInk-bhXOvTwNQUhn"
}
local CURRENT = PROJECTS[game.PlaceId] or FALLBACK

local KEY_FILE = "L-HUB/key_" .. CURRENT.ID .. ".dat"
local function saveKey(key)
    pcall(function()
        if not isfolder("L-HUB") then makefolder("L-HUB") end
        writefile(KEY_FILE, key)
    end)
end

local function loadKey()
    if isfile and isfile(KEY_FILE) then return readfile(KEY_FILE) end
    return nil
end

local function deleteKey()
    if isfile and isfile(KEY_FILE) then pcall(function() delfile(KEY_FILE) end) end
end

local function launchDiscord(code)
    local inviteCode = code or "DTDybHJjNr"
    local req = (syn and syn.request) or (http and http.request) or http_request or (Fluxus and Fluxus.request) or request
    if req then
        pcall(function()
            req({
                Url = "http://127.0.0.1:6463/rpc?v=1",
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json",
                    ["Origin"] = "https://discord.com"
                },
                Body = HttpService:JSONEncode({
                    cmd = "INVITE_BROWSER",
                    args = { code = inviteCode },
                    nonce = HttpService:GenerateGUID(false)
                }),
            })
        end)
    end
    setclipboard("https://discord.gg/" .. inviteCode)
end


local function createKeySystemUI(onSuccess)
    if not api then return end
    if CoreGui:FindFirstChild("L-HUB_Auth") then CoreGui["L-HUB_Auth"]:Destroy() end
    
    local Gui = create("ScreenGui", { Name = "L-HUB_Auth", IgnoreGuiInset = true, ZIndexBehavior = Enum.ZIndexBehavior.Sibling, Parent = CoreGui })
    
    local Bg = create("Frame", { Size = UDim2.new(1, 0, 1, 0), BackgroundColor3 = Color3.fromRGB(8, 8, 15), Parent = Gui })
    create("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 10, 30)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(8, 8, 20)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 10, 35))
        }), Rotation = 45, Parent = Bg
    })

    local ParticleContainer = create("Frame", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, ClipsDescendants = true, Parent = Bg })
    task.spawn(function()
        while Gui.Parent do
            local p = create("Frame", {
                Size = UDim2.new(0, math.random(3, 8), 0, math.random(3, 8)),
                Position = UDim2.new(math.random(), 0, 1.1, 0),
                BackgroundColor3 = Color3.fromHSV(0.75 + math.random()*0.1, 0.6, 0.8),
                BackgroundTransparency = 0.5, BorderSizePixel = 0, Parent = ParticleContainer
            })
            create("UICorner", { CornerRadius = UDim.new(1,0), Parent = p })
            TweenService:Create(p, TweenInfo.new(math.random(8,15)), {
                Position = UDim2.new(p.Position.X.Scale, 0, -0.1, 0),
                BackgroundTransparency = 1
            }):Play()
            task.wait(0.3)
        end
    end)

    local Main = create("Frame", {
        Name = "MainFrame", Size = UDim2.new(0, 480, 0, 430),
        Position = UDim2.new(0.5, -240, 0.5, -215),
        BackgroundColor3 = Color3.fromRGB(20, 20, 35), BackgroundTransparency = 0.15,
        Active = true, Parent = Gui
    })
    create("UICorner", { CornerRadius = UDim.new(0, 20), Parent = Main })

    local Border = create("Frame", {
        Size = UDim2.new(1, 4, 1, 4), Position = UDim2.new(0, -2, 0, -2),
        BackgroundColor3 = Color3.new(1,1,1), ZIndex = -1, Parent = Main
    })
    create("UICorner", { CornerRadius = UDim.new(0, 22), Parent = Border })
    local BorderGrad = create("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(180, 100, 255)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 100, 200)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(180, 100, 255))
        }), Parent = Border
    })
    task.spawn(function()
        local r = 0; while Gui.Parent do r = (r + 2) % 360; BorderGrad.Rotation = r; task.wait(0.02) end
    end)

    local Content = create("Frame", {
        Size = UDim2.new(1, -4, 1, -4), Position = UDim2.new(0, 2, 0, 2),
        BackgroundColor3 = Color3.fromRGB(18, 18, 30), BackgroundTransparency = 0.1, Parent = Main
    })
    create("UICorner", { CornerRadius = UDim.new(0, 18), Parent = Content })

    create("TextLabel", {
        Text = "L-HUB", Size = UDim2.new(1, 0, 0, 40), Position = UDim2.new(0, 0, 0, 35),
        TextColor3 = Color3.new(1, 1, 1), Font = Enum.Font.GothamBlack, TextSize = 32, BackgroundTransparency = 1, Parent = Content
    })
    create("TextLabel", {
        Text = "Enter your license key to continue", Size = UDim2.new(1, 0, 0, 20), Position = UDim2.new(0, 0, 0, 75),
        TextColor3 = Color3.fromRGB(140, 140, 170), Font = Enum.Font.Gotham, TextSize = 14, BackgroundTransparency = 1, Parent = Content
    })

    local InputFrame = create("Frame", {
        Size = UDim2.new(1, -60, 0, 50), Position = UDim2.new(0, 30, 0, 115),
        BackgroundColor3 = Color3.fromRGB(30, 30, 50), Parent = Content
    })
    create("UICorner", { CornerRadius = UDim.new(0, 12), Parent = InputFrame })
    local InputBox = create("TextBox", {
        Size = UDim2.new(1, -20, 1, 0), Position = UDim2.new(0, 10, 0, 0),
        BackgroundTransparency = 1, Text = "", PlaceholderText = "Paste key here...",
        Active = true, TextEditable = true, ClearTextOnFocus = false,
        TextColor3 = Color3.new(1, 1, 1), Font = Enum.Font.GothamMedium, TextSize = 16, Parent = InputFrame
    })

    local Status = create("TextLabel", {
        Text = "", Size = UDim2.new(1, -60, 0, 30), Position = UDim2.new(0, 30, 0, 170),
        TextColor3 = Color3.fromRGB(255, 100, 100), Font = Enum.Font.GothamMedium, TextSize = 13, BackgroundTransparency = 1, Parent = Content
    })

    local ValidateBtn = create("TextButton", {
        Name = "Validate", Text = "VALIDATE KEY", Size = UDim2.new(1, -60, 0, 50), Position = UDim2.new(0, 30, 0, 195),
        BackgroundColor3 = Color3.fromRGB(120, 80, 220), TextColor3 = Color3.new(1, 1, 1), Font = Enum.Font.GothamBold, TextSize = 16, Parent = Content
    })
    create("UICorner", { CornerRadius = UDim.new(0, 12), Parent = ValidateBtn })

    local LinkvertiseBtn = create("TextButton", {
        Name = "Linkvertise", Text = "🔗 Linkvertise", Size = UDim2.new(0.5, -35, 0, 40), Position = UDim2.new(0, 30, 0, 255),
        BackgroundColor3 = Color3.fromRGB(230, 70, 70), TextColor3 = Color3.new(1, 1, 1), Font = Enum.Font.GothamMedium, TextSize = 13, Parent = Content
    })
    create("UICorner", { CornerRadius = UDim.new(0, 10), Parent = LinkvertiseBtn })

    local WorkInkBtn = create("TextButton", {
        Name = "WorkInk", Text = "🔗 WorkInk", Size = UDim2.new(0.5, -35, 0, 40), Position = UDim2.new(0.5, 5, 0, 255),
        BackgroundColor3 = Color3.fromRGB(0, 180, 216), TextColor3 = Color3.new(1, 1, 1), Font = Enum.Font.GothamMedium, TextSize = 13, Parent = Content
    })
    create("UICorner", { CornerRadius = UDim.new(0, 10), Parent = WorkInkBtn })

    local DiscordBtn = create("TextButton", {
        Name = "Discord", Text = "💬 JOIN DISCORD", Size = UDim2.new(1, -60, 0, 45), Position = UDim2.new(0, 30, 0, 305),
        BackgroundColor3 = Color3.fromRGB(88, 101, 242), TextColor3 = Color3.new(1, 1, 1), Font = Enum.Font.GothamMedium, TextSize = 14, Parent = Content
    })
    create("UICorner", { CornerRadius = UDim.new(0, 12), Parent = DiscordBtn })

    local isValidating = false
    local function startValidation()
        if isValidating or not api then return end
        local key = InputBox.Text:gsub("%s+", "")
        if key == "" then Status.Text = "⚠️ Key required!"; return end

        isValidating = true
        Status.Text = "⏳ Validating..."
        
        task.spawn(function()
            api.script_id = CURRENT.ID
            local status = api.check_key(key)
            if status.code == "KEY_VALID" then
                Status.Text = "✅ Success!"; saveKey(key)
                _G.script_key = key
                if getgenv then getgenv().script_key = key end
                task.wait(0.5); Gui:Destroy(); onSuccess()
            else
                Status.Text = "❌ " .. (status.message or "Invalid Key")
                deleteKey(); isValidating = false
            end
        end)
    end

    ValidateBtn.MouseButton1Click:Connect(startValidation)
    
    LinkvertiseBtn.MouseButton1Click:Connect(function() 
        setclipboard(FALLBACK.Linkvertise)
        Status.Text = "📋 Linkvertise link copied!" 
    end)

    WorkInkBtn.MouseButton1Click:Connect(function() 
        setclipboard(FALLBACK.WorkInk)
        Status.Text = "📋 WorkInk link copied!" 
    end)

    DiscordBtn.MouseButton1Click:Connect(function() 
        launchDiscord("DTDybHJjNr")
        Status.Text = "📋 Invitation sent & Link copied!" 
    end)

    local saved = loadKey()
    if saved then InputBox.Text = saved; task.wait(0.5); startValidation() end

    TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Back), {
        Size = UDim2.new(0, 480, 0, 430), Position = UDim2.new(0.5, -240, 0.5, -215)
    }):Play()
end


local function start()
    local key = _G.script_key or (getgenv and getgenv().script_key) or shared.script_key or loadKey()
    
    local function proceed()
        local loaderUrl = "https://api.luarmor.net/files/v4/loaders/" .. CURRENT.ID .. ".lua"
        loadstring(game:HttpGet(loaderUrl))()
    end

    if key and type(key) == "string" and #key > 10 then
        api.script_id = CURRENT.ID
        local status = api.check_key(key)
        if status.code == "KEY_VALID" then
            warn("[L-HUB] Bypass: Valid key detected. Loading...")
            _G.script_key = key
            if getgenv then getgenv().script_key = key end
            proceed()
            return
        end
    end
    
    createKeySystemUI(proceed)
end

start()
