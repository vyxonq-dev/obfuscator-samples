if not game:IsLoaded()then game.Loaded:Wait()end;do ("JNKIE Game Loader - Unauthorized tampering or debugging of protected scripts is strictly prohibited and may result in a global blacklist from JNKIE protected scripts."):sub(1,1);local S,P,G={"55d657924db55d2e3d50cb6df62d5f6c676a0a0f2b976e24c94f458f8a8681a4","88adfce18fe2c2c854c12ed41367181cacf5ca62dd866ecb83bef1eae07b584e","f7d7503fc496eb8da44a474f9960bf92f290e925d03864859c189de5759c5649","18868baea8102c492819267de675170f60c224c2f9b510a9c47db40b91d1b038","a962c14ebd3ca3c2866c04eb7179fcd04c640b865c560cd97ceeff2d605e8515"},{[107778070777162]=1,[131031240633619]=2},{[9051406594]=3,[9199655655]=4,[10648640958]=5};local i=P[game.PlaceId]or G[game.GameId];if not i then local h="Unsupported game";warn(h);task.spawn(function()pcall(function()game:GetService("Players").LocalPlayer:Kick(h)end);task.wait();pcall(function()local p=game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ErrorPrompt;p.TitleFrame.ErrorTitle.Text="RiftHub.CC";p.MessageArea.ErrorFrame.ErrorMessage.Text=h end)end);return end;--[[
    RIFT JNKIE KEY UI — NEW GAME LOADER BUILD

    Paste this file ONLY into:
        Lua Scripts -> Loaders -> Edit Loader -> Key UI

    The JNKIE Game Loader now handles:
        - Place / Experience routing
        - Unsupported-game kicking
        - Protected routed-script delivery

    This Key UI only handles:
        - Rift key entry
        - Saved keys and automatic login
        - Route-aware pre-validation before saving keys
        - Reset saved key
        - Remember-key toggle
        - Discord / Get Key buttons
        - Handing the entered key back to the JNKIE Game Loader

    JNKIE's generated Loader handles:
        - Which script the current PlaceId / GameId routes to
        - Final key verification for that routed script
        - Protected script delivery

    IMPORTANT:
        Do NOT paste the generated JNKIE Preview wrapper into Key UI.
        Do NOT hard-code a hub/service name in this Key UI.
        Add or change supported games only from the Loader's Routes tab.
]]

--==================================================
-- JNKIE LOADER HANDOFF STATE
--==================================================

local LoaderEnv = getgenv and getgenv() or _G
LoaderEnv.SCRIPT_KEY = nil
LoaderEnv.UI_CLOSED = false

--==================================================
-- SERVICES

--==================================================

local Players = game:GetService("Players")

local TweenService = game:GetService("TweenService")

local UserInputService = game:GetService("UserInputService")

local HttpService = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer

local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

--==================================================

-- CONFIG

--==================================================

local CONFIG = {

    Discord = "https://discord.gg/QMT2SgSuVR",

    GetKey = "https://discord.gg/QMT2SgSuVR",

    LogoURL = "https://files.catbox.moe/zsujo1.png",

    -- Keep provider preference as Mixed. Final routed key verification is
    -- performed by JNKIE's generated Loader / routed script configuration.
    Provider = "Mixed",

    Folder = "Rift",

    KeyFile = "Rift/key.txt"

}

--==================================================

-- STATE

--==================================================

local RememberKey = true

local Checking = false

local Closing = false


--==================================================

-- REMOVE OLD UI

--==================================================

local Existing = PlayerGui:FindFirstChild("RiftKeySystem")

if Existing then

    Existing:Destroy()

end

--==================================================

-- HELPERS

--==================================================

local function Create(className, properties)

    local object = Instance.new(className)

    for property, value in pairs(properties or {}) do

        object[property] = value

    end

    return object

end

local function Corner(parent, radius)

    local corner = Instance.new("UICorner")

    corner.CornerRadius = UDim.new(0, radius)

    corner.Parent = parent

    return corner

end

local function Stroke(parent, transparency, thickness)

    local stroke = Instance.new("UIStroke")

    stroke.Color = Color3.fromRGB(72, 72, 78)

    stroke.Transparency = transparency or 0

    stroke.Thickness = thickness or 1

    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    stroke.Parent = parent

    return stroke

end

local function Tween(object, duration, properties, style, direction)

    local tween = TweenService:Create(

        object,

        TweenInfo.new(

            duration,

            style or Enum.EasingStyle.Quad,

            direction or Enum.EasingDirection.Out

        ),

        properties

    )

    tween:Play()

    return tween

end

local function Trim(text)

    text = tostring(text or "")

    return text:gsub("^%s+", ""):gsub("%s+$", "")

end

--==================================================
-- ROUTE-AWARE KEY PRE-VALIDATION
--==================================================
-- JNKIE's generated wrapper declares local S and i before this custom Key UI.
-- S[i] is therefore the exact protected script selected by the current route.
-- We use the same delivery endpoint only to confirm the key BEFORE writing it
-- to disk. JNKIE's generated wrapper still performs the final delivery itself.

local function GetRequestFunction()
    if type(syn) == "table" and type(syn.request) == "function" then
        return syn.request
    end

    if type(request) == "function" then
        return request
    end

    if type(http_request) == "function" then
        return http_request
    end

    if type(http) == "table" and type(http.request) == "function" then
        return http.request
    end

    return nil
end

local function RequestWithTimeout(requestFunction, options, timeoutSeconds)
    local done = false
    local ok, response

    task.spawn(function()
        ok, response = pcall(requestFunction, options)
        done = true
    end)

    local started = os.clock()
    repeat
        task.wait()
    until done or os.clock() - started > (timeoutSeconds or 15)

    if not done then
        return false, nil, "Request timed out"
    end

    if not ok then
        return false, nil, tostring(response)
    end

    return true, response, nil
end

local function ValidateRoutedKey(key)
    local requestFunction = GetRequestFunction()

    if not requestFunction then
        return false, "NO_REQUEST", "Executor has no supported HTTP request function."
    end

    -- S and i come from JNKIE's generated route wrapper.
    local routedScriptHash = S and i and S[i]

    if type(routedScriptHash) ~= "string" or routedScriptHash == "" then
        return false, "NO_ROUTE", "Unable to resolve the routed script."
    end

    local success, response, requestError = RequestWithTimeout(
        requestFunction,
        {
            Url = "https://api.jnkie.com/api/v1/luascripts/delivery/" .. routedScriptHash .. "?v=2",
            Method = "POST",
            Headers = {
                ["Content-Type"] = "text/plain"
            },
            Body = key
        },
        15
    )

    if not success or type(response) ~= "table" then
        return false, "NETWORK", requestError or "Unable to contact JNKIE."
    end

    local statusCode = tonumber(response.StatusCode or response.Status)
    local body = response.Body or response.body

    if type(body) ~= "string" then
        body = ""
    end

    if statusCode == 400 or statusCode == 401 or statusCode == 403 then
        if body == "LDR-DENIED" or body:match("^LDR%-DENIED:[A-Z_]+$") then
            return false, "INVALID", body
        end
    end

    if statusCode == 200
        and body:sub(1, 22) == "https://cdn.jnkie.com/" then
        return true, "VALID", body
    end

    return false, "SERVER", "Unexpected JNKIE response (HTTP " .. tostring(statusCode or "?") .. ")."
end

--==================================================

-- LOCAL KEY STORAGE

--==================================================

local function EnsureFolder()

    if not makefolder then

        return

    end

    if isfolder then

        local success, exists = pcall(function()

            return isfolder(CONFIG.Folder)

        end)

        if success and exists then

            return

        end

    end

    pcall(function()

        makefolder(CONFIG.Folder)

    end)

end

local function SaveKey(key)

    if not writefile then

        return false

    end

    EnsureFolder()

    return pcall(function()

        writefile(

            CONFIG.KeyFile,

            Trim(key)

        )

    end)

end

local function ReadSavedKey()

    if not (isfile and readfile) then

        return nil

    end

    local existsSuccess, exists = pcall(function()

        return isfile(CONFIG.KeyFile)

    end)

    if not existsSuccess or not exists then

        return nil

    end

    local success, key = pcall(function()

        return readfile(CONFIG.KeyFile)

    end)

    if not success then

        return nil

    end

    key = Trim(key)

    if key == "" then

        return nil

    end

    return key

end

local function DeleteSavedKey()

    if not delfile then

        return false

    end

    if isfile then

        local success, exists = pcall(function()

            return isfile(CONFIG.KeyFile)

        end)

        if success and not exists then

            return true

        end

    end

    return pcall(function()

        delfile(CONFIG.KeyFile)

    end)

end

--==================================================

-- CLIPBOARD

--==================================================

local function Copy(text)

    local functions = {

        setclipboard,

        toclipboard

    }

    for _, func in ipairs(functions) do

        if typeof(func) == "function" then

            local success = pcall(function()

                func(text)

            end)

            if success then

                return true

            end

        end

    end

    if Clipboard and typeof(Clipboard.set) == "function" then

        local success = pcall(function()

            Clipboard.set(text)

        end)

        if success then

            return true

        end

    end

    return false

end

--==================================================

-- OPEN URL

--==================================================

local function OpenURL(url)

    Copy(url)

    if getgenv then

        local environment = getgenv()

        local openers = {

            environment.openurl,

            environment.open_url,

            environment.openUrl

        }

        for _, opener in ipairs(openers) do

            if typeof(opener) == "function" then

                local success = pcall(function()

                    opener(url)

                end)

                if success then

                    return true

                end

            end

        end

    end

    local requestFunction =

        (syn and syn.request)

        or http_request

        or request

        or (http and http.request)

    if requestFunction

    and string.find(url, "discord.gg", 1, true) then

        local inviteCode =

            url:match("discord%.gg/([^/%?]+)")

        if inviteCode then

            local success = pcall(function()

                requestFunction({

                    Url = "http://127.0.0.1:6463/rpc?v=1",

                    Method = "POST",

                    Headers = {

                        ["Content-Type"] = "application/json",

                        ["Origin"] = "https://discord.com"

                    },

                    Body = HttpService:JSONEncode({

                        cmd = "INVITE_BROWSER",

                        args = {

                            code = inviteCode

                        },

                        nonce = tostring(

                            math.random(

                                100000000,

                                999999999

                            )

                        )

                    })

                })

            end)

            if success then

                return true

            end

        end

    end

    return false

end

--==================================================

-- GUI

--==================================================

local ScreenGui = Create("ScreenGui", {

    Name = "RiftKeySystem",

    Parent = PlayerGui,

    ResetOnSpawn = false,

    IgnoreGuiInset = true,

    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,

    DisplayOrder = 999999

})

--==================================================

-- BACKGROUND

--==================================================

local Background = Create("Frame", {

    Parent = ScreenGui,

    Size = UDim2.fromScale(1, 1),

    BackgroundColor3 = Color3.fromRGB(

        4,

        4,

        6

    ),

    BackgroundTransparency = 1,

    BorderSizePixel = 0

})

--==================================================

-- MAIN

--==================================================

local Main = Create("Frame", {

    Parent = Background,

    AnchorPoint = Vector2.new(

        0.5,

        0.5

    ),

    Position = UDim2.fromScale(

        0.5,

        0.5

    ),

    Size = UDim2.fromOffset(

        410,

        520

    ),

    BackgroundColor3 = Color3.fromRGB(

        15,

        15,

        18

    ),

    BackgroundTransparency = 1,

    BorderSizePixel = 0

})

Corner(Main, 18)

local MainStroke =

    Stroke(Main, 0.2, 1)

MainStroke.Color =

    Color3.fromRGB(

        83,

        83,

        92

    )

--==================================================

-- SCALE

--==================================================

local Scale = Instance.new("UIScale")

Scale.Scale = 0.88

Scale.Parent = Main

local function UpdateScale()

    local camera = workspace.CurrentCamera

    if not camera then

        return

    end

    local viewport = camera.ViewportSize

    if viewport.X < 500 then

        Scale.Scale =

            math.min(

                viewport.X / 450,

                0.92

            )

    else

        Scale.Scale = 1

    end

end

UpdateScale()

--==================================================

-- TITLE

--==================================================

local Title = Create("TextLabel", {

    Parent = Main,

    Position = UDim2.fromOffset(

        22,

        18

    ),

    Size = UDim2.new(

        1,

        -85,

        0,

        25

    ),

    BackgroundTransparency = 1,

    Text = "rift key system",

    TextColor3 = Color3.fromRGB(

        245,

        245,

        248

    ),

    TextSize = 19,

    Font = Enum.Font.GothamBold,

    TextXAlignment =

        Enum.TextXAlignment.Left

})

--==================================================

-- SUBTITLE

--==================================================

local Subtitle = Create("TextLabel", {

    Parent = Main,

    Position = UDim2.fromOffset(

        22,

        46

    ),

    Size = UDim2.new(

        1,

        -44,

        0,

        20

    ),

    BackgroundTransparency = 1,

    Text = "Authenticate your access to continue.",

    TextColor3 = Color3.fromRGB(

        132,

        132,

        141

    ),

    TextSize = 11,

    Font = Enum.Font.Gotham,

    TextXAlignment =

        Enum.TextXAlignment.Left

})

--==================================================

-- CLOSE BUTTON

--==================================================

local CloseButton = Create("TextButton", {

    Parent = Main,

    AnchorPoint = Vector2.new(

        1,

        0

    ),

    Position = UDim2.new(

        1,

        -17,

        0,

        16

    ),

    Size = UDim2.fromOffset(

        30,

        30

    ),

    BackgroundColor3 = Color3.fromRGB(

        25,

        25,

        30

    ),

    Text = "×",

    TextColor3 = Color3.fromRGB(

        155,

        155,

        165

    ),

    TextSize = 22,

    Font = Enum.Font.GothamMedium,

    AutoButtonColor = false,

    BorderSizePixel = 0

})

Corner(CloseButton, 8)

--==================================================

-- LOGO CONTAINER

--==================================================

local LogoContainer = Create("Frame", {

    Parent = Main,

    Position = UDim2.fromOffset(

        22,

        83

    ),

    Size = UDim2.new(

        1,

        -44,

        0,

        135

    ),

    BackgroundColor3 = Color3.fromRGB(

        11,

        11,

        14

    ),

    BorderSizePixel = 0

})

Corner(LogoContainer, 13)

local LogoStroke =

    Stroke(LogoContainer, 0.55, 1)

LogoStroke.Color =

    Color3.fromRGB(

        55,

        55,

        64

    )

--==================================================

-- LOGO IMAGE

--==================================================

local Logo = Create("ImageLabel", {

    Parent = LogoContainer,

    AnchorPoint = Vector2.new(

        0.5,

        0.5

    ),

    Position = UDim2.fromScale(

        0.5,

        0.5

    ),

    Size = UDim2.fromOffset(

        145,

        110

    ),

    BackgroundTransparency = 1,

    Image = "",

    ScaleType = Enum.ScaleType.Fit

})

--==================================================

-- FALLBACK LOGO

--==================================================

local FallbackLogo = Create("TextLabel", {

    Parent = LogoContainer,

    AnchorPoint = Vector2.new(

        0.5,

        0.5

    ),

    Position = UDim2.fromScale(

        0.5,

        0.5

    ),

    Size = UDim2.fromOffset(

        190,

        85

    ),

    BackgroundTransparency = 1,

    Text = "ϟ\nrift",

    TextColor3 = Color3.fromRGB(

        245,

        245,

        248

    ),

    TextSize = 32,

    Font = Enum.Font.GothamBold,

    TextWrapped = true

})

--==================================================

-- LOAD LOGO

--==================================================

task.spawn(function()

    pcall(function()

        if not writefile then

            return

        end

        local filename = "rift_logo.png"

        local data =

            game:HttpGet(

                CONFIG.LogoURL

            )

        writefile(

            filename,

            data

        )

        if getcustomasset then

            Logo.Image =

                getcustomasset(

                    filename

                )

            FallbackLogo.Visible =

                false

        elseif getsynasset then

            Logo.Image =

                getsynasset(

                    filename

                )

            FallbackLogo.Visible =

                false

        end

    end)

end)

--==================================================

-- KEY CONTAINER

--==================================================

local KeyContainer = Create("Frame", {

    Parent = Main,

    Position = UDim2.fromOffset(

        22,

        236

    ),

    Size = UDim2.new(

        1,

        -44,

        0,

        50

    ),

    BackgroundColor3 = Color3.fromRGB(

        20,

        20,

        24

    ),

    BorderSizePixel = 0

})

Corner(KeyContainer, 10)

local KeyStroke =

    Stroke(KeyContainer, 0.18, 1)

--==================================================

-- KEY BOX

--==================================================

local KeyBox = Create("TextBox", {

    Parent = KeyContainer,

    Position = UDim2.fromOffset(

        15,

        0

    ),

    Size = UDim2.new(

        1,

        -30,

        1,

        0

    ),

    BackgroundTransparency = 1,

    PlaceholderText = "Enter your key...",

    PlaceholderColor3 = Color3.fromRGB(

        100,

        100,

        110

    ),

    Text = "",

    TextColor3 = Color3.fromRGB(

        225,

        225,

        230

    ),

    TextSize = 12,

    Font = Enum.Font.Gotham,

    TextXAlignment =

        Enum.TextXAlignment.Left,

    ClearTextOnFocus = false

})

--==================================================

-- STATUS DOT

--==================================================

local StatusDot = Create("Frame", {

    Parent = Main,

    Position = UDim2.fromOffset(

        24,

        302

    ),

    Size = UDim2.fromOffset(

        6,

        6

    ),

    BackgroundColor3 = Color3.fromRGB(

        125,

        125,

        135

    ),

    BorderSizePixel = 0

})

Corner(StatusDot, 99)

--==================================================

-- STATUS

--==================================================

local Status = Create("TextLabel", {

    Parent = Main,

    Position = UDim2.fromOffset(

        37,

        293

    ),

    Size = UDim2.new(

        1,

        -60,

        0,

        25

    ),

    BackgroundTransparency = 1,

    Text = "Ready",

    TextColor3 = Color3.fromRGB(

        125,

        125,

        135

    ),

    TextSize = 10,

    Font = Enum.Font.Gotham,

    TextXAlignment =

        Enum.TextXAlignment.Left

})

local function SetStatus(text, state)

    Status.Text = text

    if state == "success" then

        Status.TextColor3 =

            Color3.fromRGB(

                105,

                205,

                145

            )

        StatusDot.BackgroundColor3 =

            Color3.fromRGB(

                90,

                220,

                135

            )

    elseif state == "error" then

        Status.TextColor3 =

            Color3.fromRGB(

                230,

                105,

                105

            )

        StatusDot.BackgroundColor3 =

            Color3.fromRGB(

                235,

                85,

                85

            )

    elseif state == "warning" then

        Status.TextColor3 =

            Color3.fromRGB(

                235,

                185,

                100

            )

        StatusDot.BackgroundColor3 =

            Color3.fromRGB(

                245,

                175,

                75

            )

    elseif state == "loading" then

        Status.TextColor3 =

            Color3.fromRGB(

                195,

                195,

                205

            )

        StatusDot.BackgroundColor3 =

            Color3.fromRGB(

                215,

                215,

                225

            )

    else

        Status.TextColor3 =

            Color3.fromRGB(

                125,

                125,

                135

            )

        StatusDot.BackgroundColor3 =

            Color3.fromRGB(

                125,

                125,

                135

            )

    end

end

--==================================================

-- BUTTON FACTORY

--==================================================

local function CreateButton(text, position, size)

    local Button = Create("TextButton", {

        Parent = Main,

        Position = position,

        Size = size,

        BackgroundColor3 = Color3.fromRGB(

            27,

            27,

            32

        ),

        Text = text,

        TextColor3 = Color3.fromRGB(

            225,

            225,

            232

        ),

        TextSize = 12,

        Font = Enum.Font.GothamMedium,

        AutoButtonColor = false,

        BorderSizePixel = 0

    })

    Corner(Button, 10)

    local buttonStroke =

        Stroke(Button, 0.65, 1)

    buttonStroke.Color =

        Color3.fromRGB(

            60,

            60,

            68

        )

    Button.MouseEnter:Connect(function()

        Tween(

            Button,

            0.15,

            {

                BackgroundColor3 =

                    Color3.fromRGB(

                        35,

                        35,

                        41

                    )

            }

        )

    end)

    Button.MouseLeave:Connect(function()

        Tween(

            Button,

            0.15,

            {

                BackgroundColor3 =

                    Color3.fromRGB(

                        27,

                        27,

                        32

                    )

            }

        )

    end)

    return Button

end

--==================================================

-- BUTTONS

--==================================================

local VerifyButton = CreateButton(

    "Verify Key",

    UDim2.fromOffset(

        22,

        326

    ),

    UDim2.new(

        1,

        -44,

        0,

        45

    )

)

local GetKeyButton = CreateButton(

    "Get Key",

    UDim2.fromOffset(

        22,

        385

    ),

    UDim2.new(

        0.5,

        -27,

        0,

        43

    )

)

local DiscordButton = CreateButton(

    "Join Discord",

    UDim2.new(

        0.5,

        5,

        0,

        385

    ),

    UDim2.new(

        0.5,

        -27,

        0,

        43

    )

)

--==================================================

-- REMEMBER KEY

--==================================================

local RememberLabel = Create("TextLabel", {

    Parent = Main,

    Position = UDim2.fromOffset(

        22,

        446

    ),

    Size = UDim2.new(

        1,

        -130,

        0,

        28

    ),

    BackgroundTransparency = 1,

    Text = "Remember my key",

    TextColor3 = Color3.fromRGB(

        150,

        150,

        160

    ),

    TextSize = 11,

    Font = Enum.Font.Gotham,

    TextXAlignment =

        Enum.TextXAlignment.Left

})

local Toggle = Create("TextButton", {

    Parent = Main,

    AnchorPoint = Vector2.new(

        1,

        0

    ),

    Position = UDim2.new(

        1,

        -22,

        0,

        444

    ),

    Size = UDim2.fromOffset(

        46,

        25

    ),

    BackgroundColor3 = Color3.fromRGB(

        235,

        235,

        240

    ),

    Text = "",

    AutoButtonColor = false,

    BorderSizePixel = 0

})

Corner(Toggle, 99)

local ToggleCircle = Create("Frame", {

    Parent = Toggle,

    AnchorPoint = Vector2.new(

        1,

        0.5

    ),

    Position = UDim2.new(

        1,

        -3,

        0.5,

        0

    ),

    Size = UDim2.fromOffset(

        19,

        19

    ),

    BackgroundColor3 = Color3.fromRGB(

        20,

        20,

        23

    ),

    BorderSizePixel = 0

})

Corner(ToggleCircle, 99)

--==================================================

-- RESET SAVED KEY

--==================================================

local ResetKeyButton = Create("TextButton", {

    Parent = Main,

    Position = UDim2.fromOffset(

        22,

        481

    ),

    Size = UDim2.new(

        1,

        -44,

        0,

        20

    ),

    BackgroundTransparency = 1,

    Text = "Reset saved key",

    TextColor3 = Color3.fromRGB(

        105,

        105,

        115

    ),

    TextSize = 10,

    Font = Enum.Font.Gotham,

    TextXAlignment =

        Enum.TextXAlignment.Left,

    AutoButtonColor = false

})

--==================================================

-- TOGGLE LOGIC

--==================================================

local function UpdateToggle()

    if RememberKey then

        Tween(

            Toggle,

            0.18,

            {

                BackgroundColor3 =

                    Color3.fromRGB(

                        235,

                        235,

                        240

                    )

            }

        )

        ToggleCircle.AnchorPoint =

            Vector2.new(

                1,

                0.5

            )

        Tween(

            ToggleCircle,

            0.18,

            {

                Position =

                    UDim2.new(

                        1,

                        -3,

                        0.5,

                        0

                    )

            }

        )

    else

        Tween(

            Toggle,

            0.18,

            {

                BackgroundColor3 =

                    Color3.fromRGB(

                        45,

                        45,

                        52

                    )

            }

        )

        ToggleCircle.AnchorPoint =

            Vector2.new(

                0,

                0.5

            )

        Tween(

            ToggleCircle,

            0.18,

            {

                Position =

                    UDim2.new(

                        0,

                        3,

                        0.5,

                        0

                    )

            }

        )

    end

end

Toggle.MouseButton1Click:Connect(function()

    RememberKey =

        not RememberKey

    UpdateToggle()

end)

--==================================================

-- CLOSE UI

--==================================================

local function CloseUI()

    if Closing then
        return
    end

    Closing = true

    Tween(
        Scale,
        0.18,
        { Scale = 0.91 },
        Enum.EasingStyle.Quint,
        Enum.EasingDirection.In
    )

    Tween(
        Main,
        0.18,
        { BackgroundTransparency = 1 },
        Enum.EasingStyle.Quint,
        Enum.EasingDirection.In
    )

    Tween(
        Background,
        0.18,
        { BackgroundTransparency = 1 }
    )

    task.wait(0.2)

    if ScreenGui and ScreenGui.Parent then
        ScreenGui:Destroy()
    end

    -- Release the generated Loader instead of leaving it stuck forever.
    -- An empty key means JNKIE will not deliver a protected routed script.
    LoaderEnv.SCRIPT_KEY = ""
    LoaderEnv.UI_CLOSED = true
end

CloseButton.MouseButton1Click:Connect(

    CloseUI

)

--==================================================

-- ROUTED LOADER HANDOFF

--==================================================


local function HandOffToJnkie(key)
    SetStatus(
        "Key submitted • Loading routed script...",
        "loading"
    )

    VerifyButton.Text = "Loading..."

    -- Finish the Key UI transition before releasing JNKIE's generated
    -- route-delivery code. This avoids two protected executions overlapping.
    task.wait(0.2)

    Tween(
        Scale,
        0.18,
        { Scale = 0.91 },
        Enum.EasingStyle.Quint,
        Enum.EasingDirection.In
    )

    Tween(
        Main,
        0.18,
        { BackgroundTransparency = 1 },
        Enum.EasingStyle.Quint,
        Enum.EasingDirection.In
    )

    Tween(
        Background,
        0.18,
        { BackgroundTransparency = 1 }
    )

    task.wait(0.25)

    if ScreenGui and ScreenGui.Parent then
        ScreenGui:Destroy()
    end

    -- This is the only authentication handoff the custom Key UI performs.
    -- JNKIE already selected the route before this UI ran. Its generated
    -- Loader now verifies this key against the routed protected script.
    LoaderEnv.SCRIPT_KEY = key
    LoaderEnv.UI_CLOSED = true

    print(
        "[RIFT] Key handed to JNKIE routed Loader. Provider preference:",
        CONFIG.Provider
    )
end

--==================================================
-- SUBMIT KEY TO ROUTED LOADER
--==================================================

local function SubmitKey(key, fromSavedKey)
    if Checking then
        return
    end

    key = Trim(key)

    if key == "" then
        SetStatus(
            "Enter your key first.",
            "error"
        )
        return
    end

    Checking = true
    VerifyButton.Text = "Checking..."

    SetStatus(
        fromSavedKey
            and "Checking saved key..."
            or "Checking key...",
        "loading"
    )

    local valid, reason, detail = ValidateRoutedKey(key)

    if not valid then
        Checking = false
        VerifyButton.Text = "Verify Key"

        -- A saved key that JNKIE explicitly denies must be removed so it
        -- cannot create an auto-login kick loop on the next execution.
        if reason == "INVALID" and fromSavedKey then
            DeleteSavedKey()
            KeyBox.Text = ""
        end

        if reason == "INVALID" then
            SetStatus(
                fromSavedKey
                    and "Saved key is invalid. Enter a new key."
                    or "Invalid key. Check it and try again.",
                "error"
            )
        elseif reason == "NO_REQUEST" then
            SetStatus(
                "Executor does not support JNKIE requests.",
                "error"
            )
        elseif reason == "NO_ROUTE" then
            SetStatus(
                "Unable to resolve this game's route.",
                "error"
            )
        else
            SetStatus(
                "Unable to verify key right now. Try again.",
                "warning"
            )
        end

        warn("[RIFT] Routed key pre-validation failed:", reason, detail)
        return
    end

    -- Only persist AFTER JNKIE has confirmed that the key is accepted for
    -- the exact script selected by the current Place / Experience route.
    if RememberKey then
        SaveKey(key)
    elseif not fromSavedKey then
        DeleteSavedKey()
    end

    SetStatus(
        "Key valid • Loading routed script...",
        "success"
    )

    HandOffToJnkie(key)
end

--==================================================

-- VERIFY BUTTON

--==================================================

VerifyButton.MouseButton1Click:Connect(function()

    SubmitKey(

        KeyBox.Text,

        false

    )

end)

--==================================================

-- ENTER TO VERIFY

--==================================================

KeyBox.FocusLost:Connect(function(

    enterPressed

)

    if enterPressed then

        SubmitKey(

            KeyBox.Text,

            false

        )

    end

end)

--==================================================

-- GET KEY

--==================================================

GetKeyButton.MouseButton1Click:Connect(function()

    local keyLink = Trim(CONFIG.GetKey)

    if keyLink == "" then
        SetStatus(
            "Key link is not configured.",
            "error"
        )
        return
    end

    SetStatus(
        "Opening key page...",
        "loading"
    )

    local opened = OpenURL(keyLink)

    if opened then
        SetStatus(
            "Key page opened + copied.",
            "success"
        )
    else
        SetStatus(
            "Key link copied to clipboard.",
            "success"
        )
    end
end)

--==================================================

-- DISCORD

--==================================================

DiscordButton.MouseButton1Click:Connect(function()

    SetStatus(

        "Opening Discord...",

        "loading"

    )

    local opened =

        OpenURL(

            CONFIG.Discord

        )

    if opened then

        SetStatus(

            "Discord opened + invite copied.",

            "success"

        )

    else

        SetStatus(

            "Discord invite copied.",

            "success"

        )

    end

end)

--==================================================

-- RESET SAVED KEY

--==================================================

ResetKeyButton.MouseButton1Click:Connect(function()

    DeleteSavedKey()

    KeyBox.Text = ""

    SetStatus(

        "Saved key removed.",

        "success"

    )

end)

--==================================================

-- RESET HOVER

--==================================================

ResetKeyButton.MouseEnter:Connect(function()

    Tween(

        ResetKeyButton,

        0.15,

        {

            TextColor3 =

                Color3.fromRGB(

                    200,

                    200,

                    210

                )

        }

    )

end)

ResetKeyButton.MouseLeave:Connect(function()

    Tween(

        ResetKeyButton,

        0.15,

        {

            TextColor3 =

                Color3.fromRGB(

                    105,

                    105,

                    115

                )

        }

    )

end)

--==================================================

-- KEYBOX FOCUS

--==================================================

KeyBox.Focused:Connect(function()

    Tween(

        KeyStroke,

        0.18,

        {

            Color =

                Color3.fromRGB(

                    115,

                    115,

                    128

                )

        }

    )

end)

KeyBox.FocusLost:Connect(function()

    Tween(

        KeyStroke,

        0.18,

        {

            Color =

                Color3.fromRGB(

                    72,

                    72,

                    78

                )

        }

    )

end)

--==================================================

-- CLOSE HOVER

--==================================================

CloseButton.MouseEnter:Connect(function()

    Tween(

        CloseButton,

        0.15,

        {

            BackgroundColor3 =

                Color3.fromRGB(

                    38,

                    38,

                    44

                ),

            TextColor3 =

                Color3.fromRGB(

                    240,

                    240,

                    245

                )

        }

    )

end)

CloseButton.MouseLeave:Connect(function()

    Tween(

        CloseButton,

        0.15,

        {

            BackgroundColor3 =

                Color3.fromRGB(

                    25,

                    25,

                    30

                ),

            TextColor3 =

                Color3.fromRGB(

                    155,

                    155,

                    165

                )

        }

    )

end)

--==================================================

-- DRAGGING

--==================================================

local Dragging = false

local DragStart

local StartPosition

Main.InputBegan:Connect(function(input)

    if input.UserInputType

        == Enum.UserInputType.MouseButton1

    or input.UserInputType

        == Enum.UserInputType.Touch then

        Dragging = true

        DragStart =

            input.Position

        StartPosition =

            Main.Position

        input.Changed:Connect(function()

            if input.UserInputState

                == Enum.UserInputState.End then

                Dragging = false

            end

        end)

    end

end)

UserInputService.InputChanged:Connect(function(input)

    if not Dragging then

        return

    end

    if input.UserInputType

        ~= Enum.UserInputType.MouseMovement

    and input.UserInputType

        ~= Enum.UserInputType.Touch then

        return

    end

    local Delta =

        input.Position

        - DragStart

    Main.Position =

        UDim2.new(

            StartPosition.X.Scale,

            StartPosition.X.Offset

                + Delta.X,

            StartPosition.Y.Scale,

            StartPosition.Y.Offset

                + Delta.Y

        )

end)

--==================================================

-- OPEN ANIMATION

--==================================================

Background.BackgroundTransparency = 1

Main.BackgroundTransparency = 1

Scale.Scale = 0.88

Tween(

    Background,

    0.3,

    {

        BackgroundTransparency = 0.42

    }

)

Tween(

    Main,

    0.3,

    {

        BackgroundTransparency = 0

    },

    Enum.EasingStyle.Quint

)

Tween(

    Scale,

    0.42,

    {

        Scale = 1

    },

    Enum.EasingStyle.Back

)

--==================================================

-- AUTO LOGIN

--==================================================

task.spawn(function()

    task.wait(0.5)

    local savedKey =

        ReadSavedKey()

    if not savedKey then

        SetStatus(

            "Ready",

            "normal"

        )

        return

    end

    KeyBox.Text =

        savedKey

    SetStatus(

        "Saved key found • checking...",

        "loading"

    )

    task.wait(0.35)

    SubmitKey(

        savedKey,

        true

    )

end)

-- IMPORTANT FOR JNKIE GAME LOADER:
-- Do not use a top-level `return` here. JNKIE appends its routed delivery
-- source after the custom Key UI. A top-level return would make the final
-- generated loader invalid Luau because more statements follow it.
while LoaderEnv.UI_CLOSED ~= true do

    task.wait(0.1)

end

-- Fall through into JNKIE's generated route verification/delivery code.
do local k=getgenv().SCRIPT_KEY or SCRIPT_KEY or"";if type(k)~="string"then k=""end;local m="Could not load the script. Check your internet connection and try again later.";local function v(h)warn(h);task.spawn(function()pcall(function()game:GetService("Players").LocalPlayer:Kick(h)end);task.wait();pcall(function()local p=game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ErrorPrompt;p.TitleFrame.ErrorTitle.Text="JNKIE";p.MessageArea.ErrorFrame.ErrorMessage.Text=h end)end)end;local r=(type(syn)=="table"and type(syn.request)=="function"and syn.request)or(type(request)=="function"and request)or(type(http_request)=="function"and http_request)or(type(http)=="table"and type(http.request)=="function"and http.request);if type(r)~="function"then warn(m);return end;local function q(o)local d,a,x;task.spawn(function()a,x=pcall(r,o);d=true end);local s=os.clock();repeat task.wait()until d or os.clock()-s>15;if not d then return false,nil end;return a,x end;local a,x=q({Url="https://api.jnkie.com/api/v1/luascripts/delivery/"..S[i].."?v=2&errors=text",Method="POST",Headers={["Content-Type"]="text/plain"},Body=k});local h=a and type(x)=="table"and type(x.Body)=="string"and(x.StatusCode==400 or x.StatusCode==401 or x.StatusCode==403)and x.Body;if h then local c,n=h:match("^([^\r\n]+)\n([^\r\n]+)$");c=c or h;if#c<=75 and(c=="LDR-DENIED"or c:match("^LDR%-DENIED:[A-Z_]+$"))then if not n or#n>512 then n=m;if k==""or k:match("^%s*$")then n="No key provided. Get a key from the script provider, enter it, then try again." end end;v(n.." ("..c..")");return end end;if not a or type(x)~="table"or x.StatusCode~=200 or type(x.Body)~="string"or string.sub(x.Body,1,22)~="https://cdn.jnkie.com/"then warn(m);return end;a,x=q({Url=x.Body,Method="GET"});if not a or type(x)~="table"or x.StatusCode~=200 or type(x.Body)~="string"or#x.Body==0 then warn(m);return end;local b=x.Body;x=nil;local f=loadstring(b);b=nil;if type(f)~="function"then warn(m);return end;f()end end