if game.CoreGui:FindFirstChild("FishyHubReplica") then
    game.CoreGui.FishyHubReplica:Destroy()
end

--========================================================--
-- JUNKIE KEY SYSTEM SETUP
--========================================================--

local Junkie = loadstring(game:HttpGet("https://jnkie.com/sdk/library.lua"))()
Junkie.service = "Key"
Junkie.identifier = "1161164"
Junkie.provider = "Fishy"

--========================================================--
-- SERVICES
--========================================================--

local TweenService       = game:GetService("TweenService")
local UserInputService   = game:GetService("UserInputService")
local Players            = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local RunService         = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

--========================================================--
-- KEY PERSISTENCE
--========================================================--

local function hasFileSystemSupport()
    local hasWritefile = pcall(function()
        return type(writefile) == "function"
    end)

    local hasReadfile = pcall(function()
        return type(readfile) == "function"
    end)

    local hasIsfile = pcall(function()
        return type(isfile) == "function"
    end)

    return hasWritefile and hasReadfile and hasIsfile
end

local fileSystemSupported = hasFileSystemSupport()

local function saveVerifiedKey(key)
    if not fileSystemSupported then
        return false
    end

    local ok = pcall(function()
        writefile("verified_key.txt", key)
    end)

    return ok
end

local function loadVerifiedKey()
    if not fileSystemSupported then
        return nil
    end

    local ok, content = pcall(function()
        return readfile("verified_key.txt")
    end)

    if not ok or not content or content == "" then
        return nil
    end

    return content
end

local function clearSavedKey()
    if not fileSystemSupported then
        return false
    end

    local ok = pcall(function()
        if isfile("verified_key.txt") then
            delfile("verified_key.txt")
        end
    end)

    return ok
end

--========================================================--
-- JUNKIE STARTUP VALIDATION
--========================================================--

local savedKey = loadVerifiedKey()

local keyToCheck = savedKey

if not keyToCheck then
    keyToCheck = getgenv().SCRIPT_KEY
end

local initialResult = nil

if keyToCheck and keyToCheck ~= "" then
    local ok, result = pcall(function()
        return Junkie.check_key(keyToCheck)
    end)

    if ok then
        initialResult = result
    end
end

local StartupKeyValid = false
local StartupKeyless = false

if initialResult and initialResult.valid then

    if initialResult.message == "KEYLESS" then
        getgenv().SCRIPT_KEY = "KEYLESS"
        StartupKeyValid = true
        StartupKeyless = true

    elseif initialResult.message == "KEY_VALID" then

        if not savedKey and keyToCheck then
            saveVerifiedKey(keyToCheck)
        end

        getgenv().SCRIPT_KEY = keyToCheck
        StartupKeyValid = true
    end

elseif savedKey and initialResult and not initialResult.key_valid then
    clearSavedKey()
    getgenv().SCRIPT_KEY = nil
end

--========================================================--
-- CONSTANTS
--========================================================--

local SidebarWidth    = 0.305
local MinSidebarWidth = 0.115
local MaxSidebarWidth = 0.42

-- Reserved space between the sidebar and main content.
-- The Size slider lives inside this gutter.
local ControlGutterWidth = 42

local SidebarOpen = true
local Resizing    = false
local Alive       = true

local Purple       = Color3.fromRGB(157, 91, 255)
local PurpleBright = Color3.fromRGB(205, 145, 255)
local PurpleDark   = Color3.fromRGB(72, 35, 130)
local PurpleDeep   = Color3.fromRGB(37, 17, 68)
local PurpleSoft   = Color3.fromRGB(125, 78, 210)

local MonoBlack     = Color3.fromRGB(0, 0, 0)
local MonoDark      = Color3.fromRGB(18, 18, 18)
local MonoGray      = Color3.fromRGB(80, 80, 80)
local MonoLightGray = Color3.fromRGB(160, 160, 160)
local MonoWhite     = Color3.fromRGB(255, 255, 255)

local Smooth = TweenInfo.new(
    0.35,
    Enum.EasingStyle.Quart,
    Enum.EasingDirection.Out
)

local Fast = TweenInfo.new(
    0.16,
    Enum.EasingStyle.Quart,
    Enum.EasingDirection.Out
)

--========================================================--
-- RESPONSIVE LAYOUT
--========================================================--

local function GetViewport()
    local camera = workspace.CurrentCamera

    if camera then
        return camera.ViewportSize
    end

    return Vector2.new(1280, 720)
end

local function IsMobileDevice()
    return UserInputService.TouchEnabled
        and not UserInputService.KeyboardEnabled
end

local function GetLayoutProfile()
    local viewport = GetViewport()

    local isMobile = IsMobileDevice()
    local isSmall  = viewport.X < 900 or viewport.Y < 620
    local isTablet = isMobile and viewport.X >= 768

    local gutter =
        if isMobile
        then 38
        else 42

    return {
        isMobile = isMobile,
        isSmall = isSmall,
        isTablet = isTablet,
        viewport = viewport,

        sidebarWidth =
            if isMobile
            then (isTablet and 0.34 or 0.42)
            else (isSmall and 0.34 or 0.305),

        controlGutterWidth = gutter,

        headerHeight =
            if isMobile
            then 72
            else (isSmall and 84 or 96),

        contentPadding =
            if isMobile
            then 18
            else (isSmall and 24 or 35),

        keyBoxHeight =
            if isMobile
            then 58
            else 70,

        titleSize =
            if isMobile
            then 22
            else (isSmall and 24 or 27),

        subtitleSize =
            if isMobile
            then 10
            else 11,

        mainTransparency =
            if isMobile
            then 0.22
            else 0.18,

        backdropTransparency =
            if isMobile
            then 0.52
            else 0.48,
    }
end

local Layout = GetLayoutProfile()

SidebarWidth =
    Layout.sidebarWidth

ControlGutterWidth =
    Layout.controlGutterWidth

--========================================================--
-- HELPERS
--========================================================--

local function New(class, properties, parent)
    local object = Instance.new(class)

    for property, value in pairs(properties or {}) do
        object[property] = value
    end

    object.Parent = parent

    return object
end

local function Tween(object, info, properties)
    local tween = TweenService:Create(
        object,
        info,
        properties
    )

    tween:Play()

    return tween
end

local function Corner(parent, radius)
    return New(
        "UICorner",
        {
            CornerRadius = UDim.new(0, radius)
        },
        parent
    )
end

local function Label(parent, text, size, color, font)
    return New(
        "TextLabel",
        {
            BackgroundTransparency = 1,
            Text = text,
            TextSize = size or 14,
            TextColor3 = color or Color3.new(1,1,1),
            Font = font or Enum.Font.GothamBold,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Center
        },
        parent
    )
end

--========================================================--
-- INTRO ANIMATION REGISTRY
--========================================================--

local IntroTextElements = {}
local IntroButtonElements = {}

local function RegisterText(label, direction, delay)
    table.insert(
        IntroTextElements,
        {
            label = label,
            direction = direction or "left",
            delay = delay or 0
        }
    )
end

local function RegisterButton(button, delay)
    table.insert(
        IntroButtonElements,
        {
            button = button,
            delay = delay or 0
        }
    )
end

--========================================================--
-- TEXT SLIDE ANIMATION
--========================================================--

local function AnimateTextSlide(label, direction, delay)
    local fullText = label.Text

    if fullText == "" then
        return
    end

    label.Text = ""
    label.TextTransparency = 0

    task.spawn(function()

        task.wait(delay or 0)

        local offsetPx = 28
        local originalPos = label.Position

        local startOffset

        if direction == "left" then
            startOffset =
                UDim2.new(
                    0,
                    -offsetPx,
                    0,
                    0
                )

        elseif direction == "right" then
            startOffset =
                UDim2.new(
                    0,
                    offsetPx,
                    0,
                    0
                )

        elseif direction == "top" then
            startOffset =
                UDim2.new(
                    0,
                    0,
                    0,
                    -offsetPx
                )

        elseif direction == "bottom" then
            startOffset =
                UDim2.new(
                    0,
                    0,
                    0,
                    offsetPx
                )

        else
            startOffset =
                UDim2.new(
                    0,
                    -offsetPx,
                    0,
                    0
                )
        end

        label.Position =
            UDim2.new(
                originalPos.X.Scale
                + startOffset.X.Scale,

                originalPos.X.Offset
                + startOffset.X.Offset,

                originalPos.Y.Scale
                + startOffset.Y.Scale,

                originalPos.Y.Offset
                + startOffset.Y.Offset
            )

        label.TextTransparency = 0.85

        Tween(
            label,
            TweenInfo.new(
                0.38,
                Enum.EasingStyle.Quart,
                Enum.EasingDirection.Out
            ),
            {
                Position = originalPos,
                TextTransparency = 0
            }
        )

        task.wait(0.06)

        local chars = #fullText

        local interval =
            math.clamp(
                0.28 / chars,
                0.016,
                0.055
            )

        for i = 1, chars do

            if not Alive
            or not label.Parent then
                break
            end

            label.Text =
                string.sub(
                    fullText,
                    1,
                    i
                )

            task.wait(interval)
        end

        label.Text =
            fullText
    end)
end

--========================================================--
-- BUTTON INTRO
--========================================================--

local function AnimateButtonIntro(button, delay)

    task.spawn(function()

        task.wait(delay or 0)

        local origBgTrans =
            button.BackgroundTransparency

        button.BackgroundTransparency = 1

        for _, child in ipairs(
            button:GetDescendants()
        ) do

            if child:IsA("TextLabel")
            or child:IsA("TextButton") then

                child.TextTransparency = 1
            end

            if child:IsA("Frame") then

                child:SetAttribute(
                    "_origBT",
                    child.BackgroundTransparency
                )

                child.BackgroundTransparency = 1
            end

            if child:IsA("UIStroke") then
                child.Transparency = 1
            end
        end

        local blinkInfo =
            TweenInfo.new(
                0.09,
                Enum.EasingStyle.Linear
            )

        Tween(
            button,
            blinkInfo,
            {
                BackgroundTransparency =
                    origBgTrans
            }
        )

        task.wait(0.09)

        Tween(
            button,
            blinkInfo,
            {
                BackgroundTransparency = 1
            }
        )

        task.wait(0.09)

        Tween(
            button,
            blinkInfo,
            {
                BackgroundTransparency =
                    origBgTrans
            }
        )

        task.wait(0.09)

        Tween(
            button,
            blinkInfo,
            {
                BackgroundTransparency = 1
            }
        )

        task.wait(0.09)

        local fadeInfo =
            TweenInfo.new(
                0.32,
                Enum.EasingStyle.Quart,
                Enum.EasingDirection.Out
            )

        Tween(
            button,
            fadeInfo,
            {
                BackgroundTransparency =
                    origBgTrans
            }
        )

        for _, child in ipairs(
            button:GetDescendants()
        ) do

            if child:IsA("TextLabel") then

                Tween(
                    child,
                    fadeInfo,
                    {
                        TextTransparency = 0
                    }
                )
            end

            if child:IsA("Frame") then

                local orig =
                    child:GetAttribute(
                        "_origBT"
                    )

                if orig then

                    Tween(
                        child,
                        fadeInfo,
                        {
                            BackgroundTransparency =
                                orig
                        }
                    )
                end
            end

            if child:IsA("UIStroke") then

                Tween(
                    child,
                    fadeInfo,
                    {
                        Transparency = 0.45
                    }
                )
            end
        end
    end)
end

--========================================================--
-- HACKER SCRAMBLE
--========================================================--

local HackerChars = {
    "0","1","A","B","C","D","E","F","G","H","I","J","K","L","M",
    "N","O","P","Q","R","S","T","U","V","W","X","Y","Z",
    "#","@","$","%","&","*","!","?","<",">","/","\\","|","-","_","=","+"
}

local function RandomHackerChar()
    return HackerChars[
        math.random(
            1,
            #HackerChars
        )
    ]
end

local function HackerScramble(
    textBox,
    originalText,
    duration
)

    if not originalText
    or originalText == "" then
        return
    end

    local len =
        #originalText

    local endTime =
        os.clock()
        + duration

    local revealed = {}
    local chars = {}

    for i = 1, len do

        revealed[i] = false

        chars[i] =
            string.sub(
                originalText,
                i,
                i
            )
    end

    task.spawn(function()

        while os.clock() < endTime do

            if not textBox
            or not textBox.Parent then
                break
            end

            local display = ""

            for i = 1, len do

                if revealed[i] then

                    display =
                        display
                        .. chars[i]

                else

                    local roll =
                        math.random(
                            1,
                            4
                        )

                    if roll == 1 then

                        display =
                            display
                            .. " "

                    elseif roll == 2 then

                        display =
                            display
                            .. chars[i]

                    else

                        display =
                            display
                            .. RandomHackerChar()
                    end
                end
            end

            textBox.Text =
                display

            local timeLeft =
                endTime
                - os.clock()

            if timeLeft <
                duration * 0.35 then

                local idx =
                    math.random(
                        1,
                        len
                    )

                if not revealed[idx] then
                    revealed[idx] = true
                end
            end

            task.wait(0.045)
        end

        if textBox
        and textBox.Parent then

            textBox.Text =
                originalText
        end
    end)
end

--========================================================--
-- GUI ROOT
--========================================================--

local GUI =
    Instance.new(
        "ScreenGui"
    )

GUI.Name =
    "FishyHubReplica"

GUI.ResetOnSpawn =
    false

GUI.IgnoreGuiInset =
    true

GUI.ZIndexBehavior =
    Enum.ZIndexBehavior.Sibling

GUI.Parent =
    game.CoreGui

local Backdrop =
    New(
        "Frame",
        {
            Size =
                UDim2.fromScale(
                    1,
                    1
                ),

            BackgroundColor3 =
                Color3.fromRGB(
                    9,
                    3,
                    18
                ),

            BackgroundTransparency = 1,

            BorderSizePixel = 0
        },
        GUI
    )

local Main =
    New(
        "Frame",
        {
            Name =
                "MainWindow",

            AnchorPoint =
                Vector2.new(
                    0.5,
                    0.5
                ),

            Position =
                UDim2.fromScale(
                    0.5,
                    0.5
                ),

            Size =
                UDim2.fromScale(
                    1,
                    1
                ),

            BackgroundColor3 =
                Color3.fromRGB(
                    13,
                    8,
                    24
                ),

            BackgroundTransparency = 1,

            BorderSizePixel = 0,

            ClipsDescendants = true
        },
        GUI
    )

--========================================================--
-- GLOBAL UI SCALE
--========================================================--

local UI_SCALE_MIN =
    0.50

local UI_SCALE_MAX =
    1.00

local UI_SCALE_DEFAULT =
    1 / 1.5

local UIScale =
    New(
        "UIScale",
        {
            Scale =
                UI_SCALE_DEFAULT
        },
        Main
    )

Corner(
    Main,
    if Layout.isMobile
    then 0
    else 18
)

New(
    "UIGradient",
    {
        Rotation = 115,

        Color =
            ColorSequence.new({
                ColorSequenceKeypoint.new(
                    0,
                    Color3.fromRGB(
                        38,
                        22,
                        66
                    )
                ),

                ColorSequenceKeypoint.new(
                    0.5,
                    Color3.fromRGB(
                        15,
                        9,
                        27
                    )
                ),

                ColorSequenceKeypoint.new(
                    1,
                    Color3.fromRGB(
                        7,
                        3,
                        15
                    )
                )
            }),

        Transparency =
            NumberSequence.new({
                NumberSequenceKeypoint.new(
                    0,
                    0.08
                ),

                NumberSequenceKeypoint.new(
                    1,
                    0.18
                )
            })
    },
    Main
)

--========================================================--
-- BORDER FACTORIES
--========================================================--

local function CreateAnimatedBorder(
    parent,
    thickness
)

    local stroke =
        New(
            "UIStroke",
            {
                ApplyStrokeMode =
                    Enum.ApplyStrokeMode.Border,

                Thickness =
                    thickness,

                Transparency =
                    0.18,

                Color =
                    Purple,

                LineJoinMode =
                    Enum.LineJoinMode.Round
            },
            parent
        )

    local gradient =
        New(
            "UIGradient",
            {
                Rotation = 0,

                Color =
                    ColorSequence.new({
                        ColorSequenceKeypoint.new(
                            0.00,
                            PurpleDark
                        ),

                        ColorSequenceKeypoint.new(
                            0.28,
                            PurpleDark
                        ),

                        ColorSequenceKeypoint.new(
                            0.40,
                            Purple
                        ),

                        ColorSequenceKeypoint.new(
                            0.48,
                            Color3.fromRGB(
                                255,
                                245,
                                255
                            )
                        ),

                        ColorSequenceKeypoint.new(
                            0.56,
                            PurpleBright
                        ),

                        ColorSequenceKeypoint.new(
                            0.70,
                            PurpleDark
                        ),

                        ColorSequenceKeypoint.new(
                            1.00,
                            PurpleDark
                        )
                    }),

                Transparency =
                    NumberSequence.new({
                        NumberSequenceKeypoint.new(
                            0.00,
                            0.55
                        ),

                        NumberSequenceKeypoint.new(
                            0.34,
                            0.55
                        ),

                        NumberSequenceKeypoint.new(
                            0.43,
                            0.04
                        ),

                        NumberSequenceKeypoint.new(
                            0.50,
                            0.04
                        ),

                        NumberSequenceKeypoint.new(
                            0.57,
                            0.55
                        ),

                        NumberSequenceKeypoint.new(
                            1.00,
                            0.55
                        )
                    })
            },
            stroke
        )

    return stroke, gradient
end

local function CreateMonoBorder(
    parent,
    thickness
)

    local stroke =
        New(
            "UIStroke",
            {
                ApplyStrokeMode =
                    Enum.ApplyStrokeMode.Border,

                Thickness =
                    thickness,

                Transparency = 0,

                Color =
                    Color3.fromRGB(
                        200,
                        200,
                        200
                    ),

                LineJoinMode =
                    Enum.LineJoinMode.Round
            },
            parent
        )

    local gradient =
        New(
            "UIGradient",
            {
                Rotation = 0,

                Color =
                    ColorSequence.new({
                        ColorSequenceKeypoint.new(
                            0.00,
                            Color3.fromRGB(
                                30,
                                30,
                                30
                            )
                        ),

                        ColorSequenceKeypoint.new(
                            0.28,
                            Color3.fromRGB(
                                120,
                                120,
                                120
                            )
                        ),

                        ColorSequenceKeypoint.new(
                            0.42,
                            Color3.fromRGB(
                                255,
                                255,
                                255
                            )
                        ),

                        ColorSequenceKeypoint.new(
                            0.50,
                            Color3.fromRGB(
                                255,
                                255,
                                255
                            )
                        ),

                        ColorSequenceKeypoint.new(
                            0.58,
                            Color3.fromRGB(
                                255,
                                255,
                                255
                            )
                        ),

                        ColorSequenceKeypoint.new(
                            0.72,
                            Color3.fromRGB(
                                120,
                                120,
                                120
                            )
                        ),

                        ColorSequenceKeypoint.new(
                            1.00,
                            Color3.fromRGB(
                                30,
                                30,
                                30
                            )
                        )
                    }),

                Transparency =
                    NumberSequence.new({
                        NumberSequenceKeypoint.new(
                            0.00,
                            0.80
                        ),

                        NumberSequenceKeypoint.new(
                            0.28,
                            0.30
                        ),

                        NumberSequenceKeypoint.new(
                            0.42,
                            0
                        ),

                        NumberSequenceKeypoint.new(
                            0.50,
                            0
                        ),

                        NumberSequenceKeypoint.new(
                            0.58,
                            0
                        ),

                        NumberSequenceKeypoint.new(
                            0.72,
                            0.30
                        ),

                        NumberSequenceKeypoint.new(
                            1.00,
                            0.80
                        )
                    })
            },
            stroke
        )

    return stroke, gradient
end

local MainBorder, MainSweep =
    CreateAnimatedBorder(
        Main,
        2.2
    )

--========================================================--
-- STARS
--========================================================--

local Stars =
    New(
        "Frame",
        {
            Name = "Stars",

            BackgroundTransparency = 1,

            Size =
                UDim2.fromScale(
                    1,
                    1
                ),

            ClipsDescendants = true,

            ZIndex = 50
        },
        Main
    )

local StarData = {
    { x=0.08, y=0.12, s=8, d=0.2 },
    { x=0.18, y=0.78, s=6, d=1.0 },
    { x=0.31, y=0.17, s=7, d=1.8 },
    { x=0.43, y=0.88, s=5, d=0.6 },
    { x=0.57, y=0.12, s=6, d=2.2 },
    { x=0.69, y=0.78, s=8, d=1.3 },
    { x=0.79, y=0.19, s=5, d=0.4 },
    { x=0.89, y=0.68, s=7, d=2.0 },
    { x=0.95, y=0.31, s=5, d=1.1 },
    { x=0.13, y=0.48, s=4, d=2.6 },
    { x=0.51, y=0.53, s=4, d=1.7 },
    { x=0.74, y=0.46, s=4, d=0.8 }
}

for _, data in ipairs(
    StarData
) do

    local Star =
        New(
            "TextLabel",
            {
                BackgroundTransparency = 1,

                Text = "*",

                TextSize =
                    data.s * 2.5,

                Font =
                    Enum.Font.GothamBlack,

                TextColor3 =
                    PurpleBright,

                TextTransparency =
                    0.55,

                AnchorPoint =
                    Vector2.new(
                        0.5,
                        0.5
                    ),

                Position =
                    UDim2.fromScale(
                        data.x,
                        data.y
                    ),

                Size =
                    UDim2.fromOffset(
                        data.s * 5,
                        data.s * 5
                    ),

                ZIndex = 51
            },
            Stars
        )

    local InnerStar =
        New(
            "TextLabel",
            {
                BackgroundTransparency = 1,

                Text = "+",

                TextSize =
                    data.s * 1.4,

                Font =
                    Enum.Font.GothamBold,

                TextColor3 =
                    Color3.fromRGB(
                        255,
                        245,
                        255
                    ),

                TextTransparency =
                    0.75,

                AnchorPoint =
                    Vector2.new(
                        0.5,
                        0.5
                    ),

                Position =
                    UDim2.fromScale(
                        data.x,
                        data.y
                    ),

                Size =
                    UDim2.fromOffset(
                        data.s * 4,
                        data.s * 4
                    ),

                ZIndex = 52
            },
            Stars
        )

    task.spawn(function()

        task.wait(
            data.d
        )

        while Alive
        and GUI.Parent do

            Tween(
                Star,
                TweenInfo.new(
                    0.8,
                    Enum.EasingStyle.Sine,
                    Enum.EasingDirection.InOut
                ),
                {
                    TextTransparency = 0.02,
                    TextSize = data.s * 3.2
                }
            )

            Tween(
                InnerStar,
                TweenInfo.new(
                    0.8,
                    Enum.EasingStyle.Sine,
                    Enum.EasingDirection.InOut
                ),
                {
                    TextTransparency = 0.05,
                    TextSize = data.s * 1.9
                }
            )

            task.wait(
                0.8
            )

            Tween(
                Star,
                TweenInfo.new(
                    1.1,
                    Enum.EasingStyle.Sine,
                    Enum.EasingDirection.InOut
                ),
                {
                    TextTransparency = 0.78,
                    TextSize = data.s * 2.2
                }
            )

            Tween(
                InnerStar,
                TweenInfo.new(
                    1.1,
                    Enum.EasingStyle.Sine,
                    Enum.EasingDirection.InOut
                ),
                {
                    TextTransparency = 0.9,
                    TextSize = data.s * 1.2
                }
            )

            task.wait(
                1.1
                + math.random() * 1.5
            )
        end
    end)
end

--========================================================--
-- HEADER
--========================================================--

local Header =
    New(
        "Frame",
        {
            BackgroundTransparency = 1,

            Size =
                UDim2.new(
                    1,
                    0,
                    0,
                    Layout.headerHeight
                ),

            ZIndex = 60
        },
        Main
    )

New(
    "Frame",
    {
        Position =
            UDim2.new(
                0,
                Layout.contentPadding,
                1,
                -1
            ),

        Size =
            UDim2.new(
                1,
                -Layout.contentPadding * 2,
                0,
                1
            ),

        BackgroundColor3 =
            Color3.fromRGB(
                255,
                255,
                255
            ),

        BackgroundTransparency =
            0.92,

        BorderSizePixel = 0
    },
    Header
)

local UserInfoBadge =
    New(
        "Frame",
        {
            BackgroundColor3 =
                PurpleDeep,

            BackgroundTransparency =
                0.45,

            BorderSizePixel = 0,

            Position =
                UDim2.new(
                    0,
                    Layout.contentPadding,
                    0,
                    Layout.headerHeight * 0.28
                ),

            Size =
                UDim2.fromOffset(
                    48,
                    28
                ),

            ZIndex = 61
        },
        Header
    )

Corner(
    UserInfoBadge,
    8
)

New(
    "UIStroke",
    {
        Color =
            PurpleBright,

        Thickness = 1,

        Transparency = 0.55
    },
    UserInfoBadge
)

local UserInfoBadgeText =
    Label(
        UserInfoBadge,
        "USR",
        10,
        PurpleBright,
        Enum.Font.GothamBold
    )

UserInfoBadgeText.Size =
    UDim2.fromScale(
        1,
        1
    )

UserInfoBadgeText.TextXAlignment =
    Enum.TextXAlignment.Center

local UserInfo =
    Label(
        Header,
        "USER INFO",
        13,
        PurpleBright,
        Enum.Font.GothamBold
    )

UserInfo.Position =
    UDim2.new(
        0,
        Layout.contentPadding + 58,
        0,
        Layout.headerHeight * 0.28
    )

UserInfo.Size =
    UDim2.new(
        0.28,
        0,
        0,
        30
    )

RegisterText(
    UserInfo,
    "left",
    0.55
)

local Title =
    Label(
        Header,
        "Welcome to Fishy Hub",
        Layout.titleSize,
        Color3.fromRGB(
            245,
            247,
            251
        ),
        Enum.Font.GothamBold
    )

Title.AnchorPoint =
    Vector2.new(
        0.5,
        0
    )

Title.Position =
    UDim2.new(
        0.5,
        0,
        0,
        Layout.headerHeight * 0.18
    )

Title.Size =
    UDim2.new(
        0.38,
        0,
        0,
        35
    )

Title.TextXAlignment =
    Enum.TextXAlignment.Center

RegisterText(
    Title,
    "top",
    0.42
)

local Subtitle =
    Label(
        Header,
        "Updated v2.1 2026",
        Layout.subtitleSize,
        Color3.fromRGB(
            130,
            112,
            155
        ),
        Enum.Font.GothamBold
    )

Subtitle.AnchorPoint =
    Vector2.new(
        0.5,
        0
    )

Subtitle.Position =
    UDim2.new(
        0.5,
        0,
        0,
        Layout.headerHeight * 0.52
    )

Subtitle.Size =
    UDim2.new(
        0.4,
        0,
        0,
        20
    )

Subtitle.TextXAlignment =
    Enum.TextXAlignment.Center

RegisterText(
    Subtitle,
    "bottom",
    0.52
)

--========================================================--
-- HEADER BUTTONS
--========================================================--

local Minimize =
    New(
        "TextButton",
        {
            Text = "-",
            TextSize = 18,
            Font = Enum.Font.GothamBold,

            TextColor3 =
                Color3.fromRGB(
                    215,
                    198,
                    235
                ),

            BackgroundColor3 =
                PurpleDeep,

            BackgroundTransparency =
                0.35,

            BorderSizePixel = 0,

            Position =
                UDim2.new(
                    1,
                    -125,
                    0,
                    Layout.headerHeight * 0.28
                ),

            Size =
                UDim2.fromOffset(
                    44,
                    44
                ),

            AutoButtonColor = false,
            ZIndex = 65
        },
        Header
    )

Corner(
    Minimize,
    13
)

RegisterButton(
    Minimize,
    0.70
)

local Close =
    New(
        "TextButton",
        {
            Text = "X",
            TextSize = 18,
            Font = Enum.Font.GothamBold,

            TextColor3 =
                Color3.fromRGB(
                    215,
                    198,
                    235
                ),

            BackgroundColor3 =
                PurpleDeep,

            BackgroundTransparency =
                0.35,

            BorderSizePixel = 0,

            Position =
                UDim2.new(
                    1,
                    -72,
                    0,
                    Layout.headerHeight * 0.28
                ),

            Size =
                UDim2.fromOffset(
                    44,
                    44
                ),

            AutoButtonColor = false,
            ZIndex = 65
        },
        Header
    )

Corner(
    Close,
    13
)

RegisterButton(
    Close,
    0.76
)

--========================================================--
-- CONTENT
--========================================================--

local Content =
    New(
        "Frame",
        {
            BackgroundTransparency = 1,

            Position =
                UDim2.new(
                    0,
                    0,
                    0,
                    Layout.headerHeight
                ),

            Size =
                UDim2.new(
                    1,
                    0,
                    1,
                    -Layout.headerHeight
                ),

            ClipsDescendants = true,
            ZIndex = 5
        },
        Main
    )

--========================================================--
-- SIDEBAR
--========================================================--

local Sidebar =
    New(
        "Frame",
        {
            Name = "Sidebar",

            BackgroundColor3 =
                Color3.fromRGB(
                    9,
                    5,
                    17
                ),

            BackgroundTransparency =
                0.32,

            BorderSizePixel = 0,

            Size =
                UDim2.new(
                    SidebarWidth,
                    0,
                    1,
                    0
                ),

            ClipsDescendants = true,
            ZIndex = 10
        },
        Content
    )

New(
    "Frame",
    {
        Position =
            UDim2.new(
                0,
                0,
                1,
                -28
            ),

        Size =
            UDim2.new(
                1,
                0,
                0,
                28
            ),

        BackgroundColor3 =
            Color3.fromRGB(
                9,
                5,
                17
            ),

        BackgroundTransparency =
            0.25,

        BorderSizePixel = 0,
        ZIndex = 10
    },
    Sidebar
)

New(
    "Frame",
    {
        AnchorPoint =
            Vector2.new(
                1,
                0
            ),

        Position =
            UDim2.new(
                1,
                0,
                0,
                0
            ),

        Size =
            UDim2.new(
                0,
                1,
                1,
                0
            ),

        BackgroundColor3 =
            PurpleBright,

        BackgroundTransparency =
            0.9,

        BorderSizePixel = 0,
        ZIndex = 20
    },
    Sidebar
)

--========================================================--
-- PROFILE
--========================================================--

local ProfileToggle =
    New(
        "TextButton",
        {
            BackgroundTransparency = 1,
            Text = "",

            Size =
                UDim2.new(
                    1,
                    0,
                    0,
                    210
                ),

            AutoButtonColor = false,
            ZIndex = 30
        },
        Sidebar
    )

local Avatar =
    New(
        "Frame",
        {
            AnchorPoint =
                Vector2.new(
                    0.5,
                    0
                ),

            Position =
                UDim2.new(
                    0.5,
                    0,
                    0,
                    30
                ),

            Size =
                UDim2.fromOffset(
                    108,
                    108
                ),

            BackgroundColor3 =
                Purple,

            BackgroundTransparency =
                0.25,

            BorderSizePixel = 0,
            ZIndex = 15
        },
        Sidebar
    )

Corner(
    Avatar,
    100
)

New(
    "UIStroke",
    {
        Color =
            PurpleBright,

        Thickness = 2,

        Transparency = 0.25
    },
    Avatar
)

local AvatarImage =
    New(
        "ImageLabel",
        {
            AnchorPoint =
                Vector2.new(
                    0.5,
                    0.5
                ),

            Position =
                UDim2.fromScale(
                    0.5,
                    0.5
                ),

            Size =
                UDim2.fromOffset(
                    100,
                    100
                ),

            BackgroundColor3 =
                Color3.fromRGB(
                    24,
                    14,
                    38
                ),

            BackgroundTransparency =
                0.15,

            BorderSizePixel = 0,

            ZIndex = 16,

            Image = ""
        },
        Avatar
    )

Corner(
    AvatarImage,
    100
)

local AvatarFallback =
    Label(
        AvatarImage,
        "AV",
        28,
        PurpleBright,
        Enum.Font.GothamBlack
    )

AvatarFallback.Size =
    UDim2.fromScale(
        1,
        1
    )

AvatarFallback.TextXAlignment =
    Enum.TextXAlignment.Center

AvatarFallback.ZIndex = 17

task.spawn(function()

    local content, isReady =
        Players:GetUserThumbnailAsync(
            LocalPlayer.UserId,
            Enum.ThumbnailType.HeadShot,
            Enum.ThumbnailSize.Size420x420
        )

    if isReady then

        AvatarImage.Image =
            content

        AvatarFallback.Visible =
            false
    end
end)

local Online =
    New(
        "Frame",
        {
            AnchorPoint =
                Vector2.new(
                    1,
                    1
                ),

            Position =
                UDim2.new(
                    1,
                    -1,
                    1,
                    -1
                ),

            Size =
                UDim2.fromOffset(
                    18,
                    18
                ),

            BackgroundColor3 =
                Color3.fromRGB(
                    55,
                    225,
                    174
                ),

            BorderSizePixel = 0,
            ZIndex = 20
        },
        Avatar
    )

Corner(
    Online,
    100
)

New(
    "UIStroke",
    {
        Color =
            Color3.fromRGB(
                7,
                14,
                23
            ),

        Thickness = 3
    },
    Online
)

local Username =
    Label(
        Sidebar,
        LocalPlayer.DisplayName,
        18,
        Color3.fromRGB(
            243,
            246,
            250
        ),
        Enum.Font.GothamBold
    )

Username.AnchorPoint =
    Vector2.new(
        0.5,
        0
    )

Username.Position =
    UDim2.new(
        0.5,
        0,
        0,
        150
    )

Username.Size =
    UDim2.new(
        1,
        -20,
        0,
        27
    )

Username.TextXAlignment =
    Enum.TextXAlignment.Center

Username.TextScaled =
    true

RegisterText(
    Username,
    "left",
    0.60
)

local Handle =
    Label(
        Sidebar,
        "@" .. LocalPlayer.Name,
        12,
        Color3.fromRGB(
            130,
            112,
            155
        ),
        Enum.Font.GothamBold
    )

Handle.AnchorPoint =
    Vector2.new(
        0.5,
        0
    )

Handle.Position =
    UDim2.new(
        0.5,
        0,
        0,
        178
    )

Handle.Size =
    UDim2.new(
        1,
        -20,
        0,
        20
    )

Handle.TextXAlignment =
    Enum.TextXAlignment.Center

Handle.TextTruncate =
    Enum.TextTruncate.AtEnd

RegisterText(
    Handle,
    "right",
    0.65
)

--========================================================--
-- SIDEBAR RESIZE HANDLE
--========================================================--

local ResizeHandle =
    New(
        "TextButton",
        {
            Name =
                "SidebarResizeHandle",

            AnchorPoint =
                Vector2.new(
                    0.5,
                    0.5
                ),

            Position =
                UDim2.new(
                    1,
                    0,
                    0.5,
                    0
                ),

            Size =
                UDim2.fromOffset(
                    12,
                    78
                ),

            BackgroundColor3 =
                PurpleDeep,

            BackgroundTransparency =
                0.45,

            BorderSizePixel = 0,

            Text = "||",

            TextSize = 9,

            Font =
                Enum.Font.GothamBold,

            TextColor3 =
                PurpleBright,

            AutoButtonColor = false,

            ZIndex = 100
        },
        Sidebar
    )

Corner(
    ResizeHandle,
    6
)

local ResizeLine =
    New(
        "Frame",
        {
            AnchorPoint =
                Vector2.new(
                    0.5,
                    0.5
                ),

            Position =
                UDim2.fromScale(
                    0.5,
                    0.5
                ),

            Size =
                UDim2.fromOffset(
                    2,
                    38
                ),

            BackgroundColor3 =
                PurpleBright,

            BackgroundTransparency =
                0.25,

            BorderSizePixel = 0,

            ZIndex = 101
        },
        ResizeHandle
    )

Corner(
    ResizeLine,
    3
)

--========================================================--
-- MAIN AREA
--
-- IMPORTANT:
-- Main content begins AFTER the reserved gutter.
-- This guarantees the Size slider has dedicated space.
--========================================================--

local MainArea =
    New(
        "Frame",
        {
            BackgroundTransparency = 1,

            Position =
                UDim2.new(
                    SidebarWidth,
                    ControlGutterWidth,
                    0,
                    0
                ),

            Size =
                UDim2.new(
                    1 - SidebarWidth,
                    -ControlGutterWidth,
                    1,
                    0
                ),

            ZIndex = 2
        },
        Content
    )

--========================================================--
-- UI SIZE SLIDER
-- Small, compact, dedicated gutter.
--========================================================--

local SizeControl =
    New(
        "Frame",
        {
            Name =
                "SizeControl",

            Size =
                UDim2.fromOffset(
                    38,
                    124
                ),

            BackgroundTransparency = 1,

            BorderSizePixel = 0,

            ZIndex = 500
        },
        GUI
    )

local SizeLabel =
    Label(
        SizeControl,
        "Size",
        9,
        PurpleBright,
        Enum.Font.GothamBold
    )

SizeLabel.AnchorPoint =
    Vector2.new(
        0.5,
        0
    )

SizeLabel.Position =
    UDim2.new(
        0.5,
        0,
        0,
        0
    )

SizeLabel.Size =
    UDim2.fromOffset(
        34,
        18
    )

SizeLabel.TextXAlignment =
    Enum.TextXAlignment.Center

SizeLabel.ZIndex = 501

local SizeTrack =
    New(
        "Frame",
        {
            AnchorPoint =
                Vector2.new(
                    0.5,
                    0
                ),

            Position =
                UDim2.new(
                    0.5,
                    0,
                    0,
                    23
                ),

            Size =
                UDim2.fromOffset(
                    6,
                    80
                ),

            BackgroundColor3 =
                PurpleDeep,

            BackgroundTransparency =
                0.18,

            BorderSizePixel = 0,

            ZIndex = 501
        },
        SizeControl
    )

Corner(
    SizeTrack,
    8
)

New(
    "UIStroke",
    {
        Color =
            PurpleBright,

        Thickness = 1,

        Transparency = 0.50
    },
    SizeTrack
)

local SizeFill =
    New(
        "Frame",
        {
            AnchorPoint =
                Vector2.new(
                    0.5,
                    1
                ),

            Position =
                UDim2.new(
                    0.5,
                    0,
                    1,
                    0
                ),

            Size =
                UDim2.new(
                    0,
                    3,
                    0,
                    27
                ),

            BackgroundColor3 =
                PurpleBright,

            BackgroundTransparency =
                0.15,

            BorderSizePixel = 0,

            ZIndex = 502
        },
        SizeTrack
    )

Corner(
    SizeFill,
    4
)

local SizeKnob =
    New(
        "TextButton",
        {
            AnchorPoint =
                Vector2.new(
                    0.5,
                    0.5
                ),

            Position =
                UDim2.new(
                    0.5,
                    0,
                    1 - (
                        (
                            UI_SCALE_DEFAULT
                            - UI_SCALE_MIN
                        )
                        /
                        (
                            UI_SCALE_MAX
                            - UI_SCALE_MIN
                        )
                    ),
                    0
                ),

            Size =
                UDim2.fromOffset(
                    16,
                    16
                ),

            BackgroundColor3 =
                Purple,

            BackgroundTransparency = 0,

            BorderSizePixel = 0,

            Text = "",

            AutoButtonColor = false,

            ZIndex = 504
        },
        SizeTrack
    )

Corner(
    SizeKnob,
    100
)

New(
    "UIStroke",
    {
        Color =
            Color3.fromRGB(
                245,
                235,
                255
            ),

        Thickness = 1.2,

        Transparency = 0.20
    },
    SizeKnob
)

local SizeValue =
    Label(
        SizeControl,
        tostring(
            math.round(
                UI_SCALE_DEFAULT
                * 100
            )
        )
        .. "%",
        8,
        Color3.fromRGB(
            180,
            160,
            205
        ),
        Enum.Font.GothamBold
    )

SizeValue.AnchorPoint =
    Vector2.new(
        0.5,
        0
    )

SizeValue.Position =
    UDim2.new(
        0.5,
        0,
        1,
        -16
    )

SizeValue.Size =
    UDim2.fromOffset(
        38,
        16
    )

SizeValue.TextXAlignment =
    Enum.TextXAlignment.Center

SizeValue.ZIndex = 501

--========================================================--
-- SIZE SLIDER STATE
--========================================================--

local CurrentUIScale =
    UI_SCALE_DEFAULT

local TargetUIScale =
    UI_SCALE_DEFAULT

local SizeDragging =
    false

--========================================================--
-- POSITION SIZE SLIDER
--
-- It is centered inside the reserved gutter.
-- It therefore never sits over MainArea.
--========================================================--

local function PositionSizeControl()

    if not GUI
    or not GUI.Parent
    or not ResizeHandle
    or not ResizeHandle.Parent
    or not MainArea
    or not MainArea.Parent then
        return
    end

    local viewport =
        GetViewport()

    local contentPosition =
        Content.AbsolutePosition

    local gutterStart =
        contentPosition.X
        + (
            SidebarWidth
            * Content.AbsoluteSize.X
        )

    local gutterWidth =
        ControlGutterWidth

    local controlWidth =
        SizeControl.AbsoluteSize.X

    local controlHeight =
        SizeControl.AbsoluteSize.Y

    -- Center the compact Size control
    -- inside the reserved gutter.
    local targetX =
        gutterStart
        + (
            gutterWidth
            - controlWidth
        ) / 2

    local resizePosition =
        ResizeHandle.AbsolutePosition

    local resizeSize =
        ResizeHandle.AbsoluteSize

    local targetY =
        resizePosition.Y
        + (
            resizeSize.Y
            / 2
        )
        - (
            controlHeight
            / 2
        )

    -- Screen bounds.
    targetX =
        math.clamp(
            targetX,
            2,
            math.max(
                2,
                viewport.X
                - controlWidth
                - 2
            )
        )

    targetY =
        math.clamp(
            targetY,
            2,
            math.max(
                2,
                viewport.Y
                - controlHeight
                - 2
            )
        )

    local roundedX =
        math.floor(
            targetX + 0.5
        )

    local roundedY =
        math.floor(
            targetY + 0.5
        )

    local currentPosition =
        SizeControl.Position

    local currentX =
        currentPosition.X.Offset

    local currentY =
        currentPosition.Y.Offset

    -- Tiny dead-zone prevents subpixel jitter.
    if math.abs(
        currentX - roundedX
    ) >= 1

    or math.abs(
        currentY - roundedY
    ) >= 1 then

        SizeControl.Position =
            UDim2.fromOffset(
                roundedX,
                roundedY
            )
    end
end

--========================================================--
-- SLIDER VISUALS
--========================================================--

local function UpdateSliderVisuals(scale)

    local percent =
        (
            scale
            - UI_SCALE_MIN
        )
        /
        (
            UI_SCALE_MAX
            - UI_SCALE_MIN
        )

    percent =
        math.clamp(
            percent,
            0,
            1
        )

    local y =
        1 - percent

    SizeKnob.Position =
        UDim2.new(
            0.5,
            0,
            y,
            0
        )

    SizeFill.Size =
        UDim2.new(
            0,
            3,
            0,
            math.clamp(
                percent * 80,
                0,
                80
            )
        )

    SizeValue.Text =
        tostring(
            math.round(
                scale * 100
            )
        )
        .. "%"
end

--========================================================--
-- TARGET SCALE
--========================================================--

local function SetUIScale(scale)

    TargetUIScale =
        math.clamp(
            scale,
            UI_SCALE_MIN,
            UI_SCALE_MAX
        )

    UpdateSliderVisuals(
        TargetUIScale
    )
end

SetUIScale(
    UI_SCALE_DEFAULT
)

--========================================================--
-- SMOOTH SCALE LOOP
--========================================================--

RunService.RenderStepped:Connect(
    function()

        if not Alive
        or not GUI.Parent then
            return
        end

        local difference =
            TargetUIScale
            - CurrentUIScale

        if math.abs(
            difference
        ) > 0.0001 then

            CurrentUIScale =
                CurrentUIScale
                + (
                    difference
                    * 0.22
                )

            UIScale.Scale =
                CurrentUIScale

        else

            CurrentUIScale =
                TargetUIScale

            UIScale.Scale =
                TargetUIScale
        end

        PositionSizeControl()
    end
)

--========================================================--
-- SIZE SLIDER INPUT
--========================================================--

local function UpdateSizeFromY(y)

    local trackPosition =
        SizeTrack.AbsolutePosition

    local trackSize =
        SizeTrack.AbsoluteSize

    if trackSize.Y <= 0 then
        return
    end

    local normalized =
        math.clamp(
            (
                y
                - trackPosition.Y
            )
            /
            trackSize.Y,
            0,
            1
        )

    local percent =
        1 - normalized

    local scale =
        UI_SCALE_MIN
        + (
            UI_SCALE_MAX
            - UI_SCALE_MIN
        )
        * percent

    SetUIScale(
        scale
    )
end

SizeTrack.InputBegan:Connect(
    function(input)

        if input.UserInputType ==
            Enum.UserInputType.MouseButton1

        or input.UserInputType ==
            Enum.UserInputType.Touch then

            SizeDragging =
                true

            UpdateSizeFromY(
                input.Position.Y
            )

            Tween(
                SizeKnob,
                Fast,
                {
                    Size =
                        UDim2.fromOffset(
                            20,
                            20
                        ),

                    BackgroundColor3 =
                        PurpleBright
                }
            )
        end
    end
)

SizeKnob.InputBegan:Connect(
    function(input)

        if input.UserInputType ==
            Enum.UserInputType.MouseButton1

        or input.UserInputType ==
            Enum.UserInputType.Touch then

            SizeDragging =
                true

            Tween(
                SizeKnob,
                Fast,
                {
                    Size =
                        UDim2.fromOffset(
                            20,
                            20
                        ),

                    BackgroundColor3 =
                        PurpleBright
                }
            )
        end
    end
)

UserInputService.InputChanged:Connect(
    function(input)

        if SizeDragging
        and (
            input.UserInputType ==
                Enum.UserInputType.MouseMovement

            or input.UserInputType ==
                Enum.UserInputType.Touch
        ) then

            UpdateSizeFromY(
                input.Position.Y
            )
        end
    end
)

UserInputService.InputEnded:Connect(
    function(input)

        if input.UserInputType ==
            Enum.UserInputType.MouseButton1

        or input.UserInputType ==
            Enum.UserInputType.Touch then

            if SizeDragging then

                SizeDragging =
                    false

                Tween(
                    SizeKnob,
                    Fast,
                    {
                        Size =
                            UDim2.fromOffset(
                                16,
                                16
                            ),

                        BackgroundColor3 =
                            Purple
                    }
                )
            end
        end
    end
)

SizeTrack.MouseEnter:Connect(
    function()

        if not SizeDragging then

            Tween(
                SizeKnob,
                Fast,
                {
                    BackgroundColor3 =
                        PurpleBright
                }
            )
        end
    end
)

SizeTrack.MouseLeave:Connect(
    function()

        if not SizeDragging then

            Tween(
                SizeKnob,
                Fast,
                {
                    BackgroundColor3 =
                        Purple
                }
            )
        end
    end
)

PositionSizeControl()

--========================================================--
-- SIDEBAR DETAILS
--========================================================--

local Details =
    New(
        "Frame",
        {
            BackgroundTransparency = 1,

            Position =
                UDim2.new(
                    0,
                    0,
                    0,
                    220
                ),

            Size =
                UDim2.new(
                    1,
                    0,
                    1,
                    -220
                ),

            ClipsDescendants = true
        },
        Sidebar
    )

local function InfoRow(
    y,
    badgeText,
    title,
    value,
    color
)

    local Row =
        New(
            "Frame",
            {
                BackgroundTransparency = 1,

                Position =
                    UDim2.new(
                        0,
                        23,
                        0,
                        y
                    ),

                Size =
                    UDim2.new(
                        1,
                        -46,
                        0,
                        48
                    )
            },
            Details
        )

    local Badge =
        New(
            "Frame",
            {
                BackgroundColor3 =
                    PurpleDeep,

                BackgroundTransparency =
                    0.5,

                BorderSizePixel = 0,

                Position =
                    UDim2.new(
                        0,
                        0,
                        0,
                        4
                    ),

                Size =
                    UDim2.fromOffset(
                        34,
                        28
                    ),

                ZIndex = 2
            },
            Row
        )

    Corner(
        Badge,
        8
    )

    New(
        "UIStroke",
        {
            Color =
                PurpleBright,

            Thickness = 1,

            Transparency =
                0.55
        },
        Badge
    )

    local BText =
        Label(
            Badge,
            badgeText,
            9,
            PurpleBright,
            Enum.Font.GothamBold
        )

    BText.Size =
        UDim2.fromScale(
            1,
            1
        )

    BText.TextXAlignment =
        Enum.TextXAlignment.Center

    local T =
        Label(
            Row,
            title,
            10,
            Color3.fromRGB(
                125,
                107,
                145
            )
        )

    T.Position =
        UDim2.new(
            0,
            42,
            0,
            0
        )

    T.Size =
        UDim2.new(
            1,
            -42,
            0,
            18
        )

    local VText =
        New(
            "TextLabel",
            {
                BackgroundTransparency = 1,

                Text = value,

                TextSize = 13,

                TextColor3 =
                    color
                    or Color3.fromRGB(
                        220,
                        225,
                        233
                    ),

                Font =
                    Enum.Font.GothamBold,

                TextXAlignment =
                    Enum.TextXAlignment.Left,

                TextYAlignment =
                    Enum.TextYAlignment.Center,

                Position =
                    UDim2.new(
                        0,
                        42,
                        0,
                        18
                    ),

                Size =
                    UDim2.new(
                        1,
                        -42,
                        0,
                        22
                    ),

                TextTruncate =
                    Enum.TextTruncate.AtEnd
            },
            Row
        )

    New(
        "Frame",
        {
            Position =
                UDim2.new(
                    0,
                    42,
                    1,
                    -1
                ),

            Size =
                UDim2.new(
                    1,
                    -42,
                    0,
                    1
                ),

            BackgroundColor3 =
                PurpleBright,

            BackgroundTransparency =
                0.955,

            BorderSizePixel = 0
        },
        Row
    )

    return VText
end

--========================================================--
-- HWID
--========================================================--

local function GetHWID()

    if gethwid then

        local ok, r =
            pcall(
                gethwid
            )

        if ok and r then
            return tostring(r)
        end
    end

    if get_hwid then

        local ok, r =
            pcall(
                get_hwid
            )

        if ok and r then
            return tostring(r)
        end
    end

    return "FHW-"
        .. tostring(
            LocalPlayer.UserId
        )
        .. "-"
        .. string.sub(
            tostring(game.PlaceId),
            1,
            6
        )
end

local hwidString =
    GetHWID()

local HWIDRow =
    New(
        "Frame",
        {
            BackgroundTransparency = 1,

            Position =
                UDim2.new(
                    0,
                    23,
                    0,
                    147
                ),

            Size =
                UDim2.new(
                    1,
                    -46,
                    0,
                    48
                )
        },
        Details
    )

local HWIDBadge =
    New(
        "Frame",
        {
            BackgroundColor3 =
                PurpleDeep,

            BackgroundTransparency =
                0.5,

            BorderSizePixel = 0,

            Position =
                UDim2.new(
                    0,
                    0,
                    0,
                    4
                ),

            Size =
                UDim2.fromOffset(
                    34,
                    28
                ),

            ZIndex = 2
        },
        HWIDRow
    )

Corner(
    HWIDBadge,
    8
)

New(
    "UIStroke",
    {
        Color =
            PurpleBright,

        Thickness = 1,

        Transparency =
            0.55
    },
    HWIDBadge
)

local HWIDBadgeText =
    Label(
        HWIDBadge,
        "PC",
        9,
        PurpleBright,
        Enum.Font.GothamBold
    )

HWIDBadgeText.Size =
    UDim2.fromScale(
        1,
        1
    )

HWIDBadgeText.TextXAlignment =
    Enum.TextXAlignment.Center

local HWIDTitle =
    Label(
        HWIDRow,
        "HWID",
        10,
        Color3.fromRGB(
            125,
            107,
            145
        )
    )

HWIDTitle.Position =
    UDim2.new(
        0,
        42,
        0,
        0
    )

HWIDTitle.Size =
    UDim2.new(
        1,
        -42,
        0,
        18
    )

local HWIDValue =
    New(
        "TextLabel",
        {
            BackgroundTransparency = 1,

            Text = hwidString,

            TextSize = 13,

            TextColor3 =
                Color3.fromRGB(
                    220,
                    225,
                    233
                ),

            Font =
                Enum.Font.GothamBold,

            TextXAlignment =
                Enum.TextXAlignment.Left,

            TextYAlignment =
                Enum.TextYAlignment.Center,

            Position =
                UDim2.new(
                    0,
                    42,
                    0,
                    18
                ),

            Size =
                UDim2.new(
                    1,
                    -42,
                    0,
                    22
                ),

            TextTruncate =
                Enum.TextTruncate.AtEnd
        },
        HWIDRow
    )

New(
    "Frame",
    {
        Position =
            UDim2.new(
                0,
                42,
                1,
                -1
            ),

        Size =
            UDim2.new(
                1,
                -42,
                0,
                1
            ),

        BackgroundColor3 =
            PurpleBright,

        BackgroundTransparency =
            0.955,

        BorderSizePixel = 0
    },
    HWIDRow
)

local HWIDButton =
    New(
        "TextButton",
        {
            BackgroundTransparency = 1,
            Text = "",

            Size =
                UDim2.fromScale(
                    1,
                    1
                ),

            Position =
                UDim2.fromScale(
                    0,
                    0
                ),

            AutoButtonColor = false,
            ZIndex = 10
        },
        HWIDRow
    )

local function CopyHWID()

    pcall(function()

        if setclipboard then

            setclipboard(
                hwidString
            )
        end
    end)

    Tween(
        HWIDValue,
        Fast,
        {
            TextTransparency = 1
        }
    )

    task.wait(
        0.18
    )

    HWIDValue.Text =
        "Copied!"

    Tween(
        HWIDValue,
        Fast,
        {
            TextTransparency = 0
        }
    )

    task.wait(
        1.2
    )

    Tween(
        HWIDValue,
        Fast,
        {
            TextTransparency = 1
        }
    )

    task.wait(
        0.18
    )

    HWIDValue.Text =
        hwidString

    Tween(
        HWIDValue,
        Fast,
        {
            TextTransparency = 0
        }
    )
end

HWIDButton.MouseButton1Click:Connect(
    function()
        task.spawn(
            CopyHWID
        )
    end
)

HWIDButton.MouseEnter:Connect(
    function()

        Tween(
            HWIDValue,
            Fast,
            {
                TextColor3 =
                    PurpleBright
            }
        )
    end
)

HWIDButton.MouseLeave:Connect(
    function()

        Tween(
            HWIDValue,
            Fast,
            {
                TextColor3 =
                    Color3.fromRGB(
                        220,
                        225,
                        233
                    )
            }
        )
    end
)

--========================================================--
-- OTHER INFO ROWS
--========================================================--

local ExecutorName =
    "Unknown"

if identifyexecutor then

    pcall(function()

        ExecutorName =
            identifyexecutor()
    end)
end

local DeviceType =
    "PC"

if UserInputService.TouchEnabled
and not UserInputService.KeyboardEnabled then

    DeviceType =
        "Mobile"

elseif UserInputService.GamepadEnabled
and not UserInputService.KeyboardEnabled then

    DeviceType =
        "Console"
end

InfoRow(
    0,
    "EXE",
    "Executor",
    ExecutorName
)

InfoRow(
    49,
    "DEV",
    "Device",
    DeviceType
)

InfoRow(
    98,
    "AGE",
    "Account Age",
    tostring(
        LocalPlayer.AccountAge
    )
    .. " Days"
)

local GameRowText =
    InfoRow(
        196,
        "GAM",
        "Game",
        game.Name,
        Color3.fromRGB(
            60,
            215,
            175
        )
    )

task.spawn(function()

    pcall(function()

        if game.PlaceId > 0 then

            local info =
                MarketplaceService:GetProductInfo(
                    game.PlaceId
                )

            GameRowText.Text =
                info.Name
        end
    end)
end)

--========================================================--
-- SESSION + PING
--========================================================--

local Stats =
    New(
        "Frame",
        {
            BackgroundTransparency = 1,

            Position =
                UDim2.new(
                    0,
                    23,
                    0,
                    256
                ),

            Size =
                UDim2.new(
                    1,
                    -46,
                    0,
                    58
                )
        },
        Details
    )

local TimerBadge =
    New(
        "Frame",
        {
            BackgroundColor3 =
                PurpleDeep,

            BackgroundTransparency =
                0.5,

            BorderSizePixel = 0,

            Position =
                UDim2.new(
                    0,
                    0,
                    0.5,
                    -14
                ),

            Size =
                UDim2.fromOffset(
                    34,
                    28
                )
        },
        Stats
    )

Corner(
    TimerBadge,
    8
)

New(
    "UIStroke",
    {
        Color =
            PurpleBright,

        Thickness = 1,

        Transparency =
            0.55
    },
    TimerBadge
)

local TBT =
    Label(
        TimerBadge,
        "TMR",
        8,
        PurpleBright,
        Enum.Font.GothamBold
    )

TBT.Size =
    UDim2.fromScale(
        1,
        1
    )

TBT.TextXAlignment =
    Enum.TextXAlignment.Center

local Session =
    Label(
        Stats,
        "Session\n00:00",
        11,
        Color3.fromRGB(
            130,
            112,
            155
        )
    )

Session.Position =
    UDim2.new(
        0,
        42,
        0,
        0
    )

Session.Size =
    UDim2.new(
        0.5,
        -42,
        1,
        0
    )

local PingBadge =
    New(
        "Frame",
        {
            BackgroundColor3 =
                PurpleDeep,

            BackgroundTransparency =
                0.5,

            BorderSizePixel = 0,

            Position =
                UDim2.new(
                    0.52,
                    0,
                    0.5,
                    -14
                ),

            Size =
                UDim2.fromOffset(
                    34,
                    28
                )
        },
        Stats
    )

Corner(
    PingBadge,
    8
)

New(
    "UIStroke",
    {
        Color =
            PurpleBright,

        Thickness = 1,

        Transparency =
            0.55
    },
    PingBadge
)

local PBT =
    Label(
        PingBadge,
        "SIG",
        8,
        PurpleBright,
        Enum.Font.GothamBold
    )

PBT.Size =
    UDim2.fromScale(
        1,
        1
    )

PBT.TextXAlignment =
    Enum.TextXAlignment.Center

local Ping =
    Label(
        Stats,
        "Ping\n0 ms",
        11,
        Color3.fromRGB(
            130,
            112,
            155
        )
    )

Ping.Position =
    UDim2.new(
        0.52,
        42,
        0,
        0
    )

Ping.Size =
    UDim2.new(
        0.48,
        -42,
        1,
        0
    )

local StartTime =
    os.clock()

task.spawn(function()

    while Alive
    and GUI.Parent do

        local elapsed =
            os.clock()
            - StartTime

        Session.Text =
            string.format(
                "Session\n%02d:%02d",
                math.floor(
                    elapsed / 60
                ),
                math.floor(
                    elapsed % 60
                )
            )

        local currentPing =
            0

        pcall(function()

            currentPing =
                math.round(
                    LocalPlayer:GetNetworkPing()
                    * 1000
                )
        end)

        Ping.Text =
            string.format(
                "Ping\n%d ms",
                currentPing
            )

        task.wait(
            1
        )
    end
end)

--========================================================--
-- CONNECTION INDICATOR
--========================================================--

local Connection =
    New(
        "Frame",
        {
            BackgroundTransparency = 1,

            Position =
                UDim2.new(
                    0,
                    23,
                    1,
                    -65
                ),

            Size =
                UDim2.new(
                    1,
                    -46,
                    0,
                    50
                )
        },
        Sidebar
    )

local ConnectionDot =
    New(
        "Frame",
        {
            Position =
                UDim2.new(
                    0,
                    0,
                    0.5,
                    -6
                ),

            Size =
                UDim2.fromOffset(
                    12,
                    12
                ),

            BackgroundColor3 =
                Color3.fromRGB(
                    55,
                    220,
                    174
                ),

            BorderSizePixel = 0
        },
        Connection
    )

Corner(
    ConnectionDot,
    100
)

local ConnectionText =
    Label(
        Connection,
        "Connected to Fishy Hub",
        12,
        Color3.fromRGB(
            60,
            215,
            175
        ),
        Enum.Font.GothamBold
    )

ConnectionText.Position =
    UDim2.new(
        0,
        22,
        0,
        0
    )

ConnectionText.Size =
    UDim2.new(
        1,
        -22,
        0,
        23
    )

local ConnectionSub =
    Label(
        Connection,
        "Fishy Hub is ready",
        10,
        Color3.fromRGB(
            125,
            107,
            145
        ),
        Enum.Font.GothamBold
    )

ConnectionSub.Position =
    UDim2.new(
        0,
        22,
        0,
        23
    )

ConnectionSub.Size =
    UDim2.new(
        1,
        -22,
        0,
        20
    )

RegisterText(
    ConnectionText,
    "left",
    0.80
)

RegisterText(
    ConnectionSub,
    "bottom",
    0.85
)

--========================================================--
-- SERVICE HEADER
--========================================================--

local ServiceImage =
    New(
        "ImageLabel",
        {
            Position =
                UDim2.new(
                    0,
                    Layout.contentPadding,
                    0,
                    18
                ),

            Size =
                UDim2.fromOffset(
                    96,
                    56
                ),

            BackgroundTransparency = 1,
            BorderSizePixel = 0,

            Image =
                "rbxassetid://80533585242529",

            ScaleType =
                Enum.ScaleType.Fit,

            ZIndex = 5
        },
        MainArea
    )

Corner(
    ServiceImage,
    10
)

local Active =
    Label(
        MainArea,
        "ACTIVE SERVICE",
        10,
        Color3.fromRGB(
            190,
            125,
            255
        ),
        Enum.Font.GothamBold
    )

Active.Position =
    UDim2.new(
        0,
        Layout.contentPadding + 112,
        0,
        34
    )

Active.Size =
    UDim2.new(
        0.4,
        0,
        0,
        18
    )

RegisterText(
    Active,
    "top",
    0.40
)

local ServiceName =
    Label(
        MainArea,
        "Fishy Hub",
        19,
        Color3.fromRGB(
            237,
            241,
            247
        ),
        Enum.Font.GothamBold
    )

ServiceName.Position =
    UDim2.new(
        0,
        Layout.contentPadding + 112,
        0,
        55
    )

ServiceName.Size =
    UDim2.new(
        0.5,
        0,
        0,
        27
    )

RegisterText(
    ServiceName,
    "left",
    0.45
)

local Delivery =
    Label(
        MainArea,
        "Verified: Satisfaction Guaranteed",
        12,
        Color3.fromRGB(
            130,
            112,
            155
        ),
        Enum.Font.GothamBold
    )

Delivery.Position =
    UDim2.new(
        0,
        Layout.contentPadding + 112,
        0,
        83
    )

Delivery.Size =
    UDim2.new(
        0.5,
        0,
        0,
        22
    )

RegisterText(
    Delivery,
    "bottom",
    0.50
)

--========================================================--
-- ACCESS PANEL
--========================================================--

local Access =
    New(
        "Frame",
        {
            BackgroundTransparency = 1,

            Position =
                UDim2.new(
                    0,
                    Layout.contentPadding,
                    0,
                    145
                ),

            Size =
                UDim2.new(
                    1,
                    -Layout.contentPadding * 2,
                    1,
                    -310
                )
        },
        MainArea
    )

local AccessTitle =
    Label(
        Access,
        "SECURE ACCESS",
        11,
        PurpleBright,
        Enum.Font.GothamBold
    )

AccessTitle.Position =
    UDim2.new(
        0,
        0,
        0,
        0
    )

AccessTitle.Size =
    UDim2.new(
        1,
        0,
        0,
        20
    )

RegisterText(
    AccessTitle,
    "left",
    0.55
)

local AccessDesc =
    Label(
        Access,
        "One Key. All Features. All Supported Games.",
        12,
        Color3.fromRGB(
            130,
            112,
            155
        ),
        Enum.Font.GothamBold
    )

AccessDesc.Position =
    UDim2.new(
        0,
        0,
        0,
        23
    )

AccessDesc.Size =
    UDim2.new(
        1,
        0,
        0,
        22
    )

RegisterText(
    AccessDesc,
    "right",
    0.58
)

--========================================================--
-- KEY BOX
--========================================================--

local KeyBox =
    New(
        "Frame",
        {
            Position =
                UDim2.new(
                    0,
                    0,
                    0,
                    61
                ),

            Size =
                UDim2.new(
                    1,
                    0,
                    0,
                    Layout.keyBoxHeight
                ),

            BackgroundColor3 =
                MonoBlack,

            BackgroundTransparency =
                0.08,

            BorderSizePixel = 0
        },
        Access
    )

Corner(
    KeyBox,
    16
)

local KeyBorder, KeySweep =
    CreateMonoBorder(
        KeyBox,
        2.0
    )

local KeyBadge =
    New(
        "Frame",
        {
            BackgroundColor3 =
                PurpleDeep,

            BackgroundTransparency =
                0.4,

            BorderSizePixel = 0,

            Position =
                UDim2.new(
                    0,
                    16,
                    0.5,
                    -16
                ),

            Size =
                UDim2.fromOffset(
                    42,
                    32
                ),

            ZIndex = 6
        },
        KeyBox
    )

Corner(
    KeyBadge,
    8
)

New(
    "UIStroke",
    {
        Color =
            PurpleBright,

        Thickness = 1,

        Transparency =
            0.55
    },
    KeyBadge
)

local KeyBadgeText =
    Label(
        KeyBadge,
        "KEY",
        9,
        PurpleBright,
        Enum.Font.GothamBold
    )

KeyBadgeText.Size =
    UDim2.fromScale(
        1,
        1
    )

KeyBadgeText.TextXAlignment =
    Enum.TextXAlignment.Center

KeyBadgeText.ZIndex =
    7

local KeyText =
    New(
        "TextBox",
        {
            BackgroundTransparency = 1,

            Text = "",

            PlaceholderText =
                "Enter your key here...",

            PlaceholderColor3 =
                MonoLightGray,

            TextSize =
                if Layout.isMobile
                then 12
                else 13,

            TextColor3 =
                MonoWhite,

            Font =
                Enum.Font.GothamBold,

            TextXAlignment =
                Enum.TextXAlignment.Left,

            TextYAlignment =
                Enum.TextYAlignment.Center,

            ClearTextOnFocus = false,

            MultiLine = false,

            Position =
                UDim2.new(
                    0,
                    68,
                    0,
                    0
                ),

            Size =
                UDim2.new(
                    1,
                    -80,
                    1,
                    0
                ),

            ClipsDescendants = true,

            ZIndex = 5
        },
        KeyBox
    )

--========================================================--
-- PREFILL CURRENT KEY
--========================================================--

local prefilledKey =
    savedKey
    or getgenv().SCRIPT_KEY
    or ""

if prefilledKey ~= ""
and prefilledKey ~= "KEYLESS" then

    KeyText.Text =
        prefilledKey
end

--========================================================--
-- KEY STATUS
--========================================================--

local initialStatusText
local initialStatusColor

if StartupKeyless then

    initialStatusText =
        "Keyless access granted."

    initialStatusColor =
        Color3.fromRGB(
            100,
            255,
            100
        )

elseif StartupKeyValid then

    initialStatusText =
        "Key loaded — verified."

    initialStatusColor =
        Color3.fromRGB(
            100,
            255,
            100
        )

elseif savedKey then

    initialStatusText =
        "Saved key is invalid — please verify again."

    initialStatusColor =
        Color3.fromRGB(
            255,
            100,
            100
        )

else

    initialStatusText =
        "Awaiting key verification..."

    initialStatusColor =
        MonoLightGray
end

local StatusLabel =
    New(
        "TextLabel",
        {
            BackgroundTransparency = 1,

            Text =
                initialStatusText,

            TextSize = 11,

            TextColor3 =
                initialStatusColor,

            Font =
                Enum.Font.GothamBold,

            TextXAlignment =
                Enum.TextXAlignment.Left,

            Position =
                UDim2.new(
                    0,
                    0,
                    0,
                    Layout.keyBoxHeight + 62
                ),

            Size =
                UDim2.new(
                    1,
                    0,
                    0,
                    20
                )
        },
        Access
    )

RegisterText(
    StatusLabel,
    "bottom",
    0.68
)

local function SetStatus(
    text,
    color
)

    StatusLabel.Text =
        text

    StatusLabel.TextColor3 =
        color
        or MonoLightGray
end

--========================================================--
-- BUTTON FACTORY
--========================================================--

local function ActionButton(
    parent,
    badgeText,
    text,
    pos,
    size,
    primary,
    mono
)

    local bgColor =
        mono
        and MonoDark
        or primary
        and Color3.fromRGB(
            126,
            62,
            215
        )
        or Color3.fromRGB(
            42,
            25,
            68
        )

    local bgTrans =
        mono
        and 0.10
        or primary
        and 0.28
        or 0.28

    local borderColor =
        mono
        and MonoGray
        or primary
        and PurpleBright
        or Color3.fromRGB(
            112,
            78,
            150
        )

    local borderTrans =
        mono
        and 0.55
        or primary
        and 0.90
        or 0.90

    local textColor =
        mono
        and MonoWhite
        or Color3.fromRGB(
            240,
            245,
            250
        )

    local Button =
        New(
            "TextButton",
            {
                Text = "",

                BackgroundColor3 =
                    bgColor,

                BackgroundTransparency =
                    bgTrans,

                BorderSizePixel = 0,

                Position =
                    pos,

                Size =
                    size,

                AutoButtonColor = false
            },
            parent
        )

    Corner(
        Button,
        14
    )

    local Border =
        New(
            "UIStroke",
            {
                Color =
                    borderColor,

                Transparency =
                    borderTrans,

                Thickness = 1
            },
            Button
        )

    local BadgeFrame =
        New(
            "Frame",
            {
                BackgroundColor3 =
                    PurpleDeep,

                BackgroundTransparency =
                    mono
                    and 0.80
                    or (
                        primary
                        and 0.55
                        or 0.65
                    ),

                BorderSizePixel = 0,

                Position =
                    UDim2.new(
                        0,
                        12,
                        0.5,
                        -13
                    ),

                Size =
                    UDim2.fromOffset(
                        30,
                        26
                    ),

                ZIndex =
                    (Button.ZIndex or 1)
                    + 1
            },
            Button
        )

    Corner(
        BadgeFrame,
        7
    )

    local BadgeLbl =
        Label(
            BadgeFrame,
            badgeText,
            8,
            PurpleBright,
            Enum.Font.GothamBold
        )

    BadgeLbl.Size =
        UDim2.fromScale(
            1,
            1
        )

    BadgeLbl.TextXAlignment =
        Enum.TextXAlignment.Center

    BadgeLbl.ZIndex =
        (BadgeFrame.ZIndex or 1)
        + 1

    local ButtonText =
        Label(
            Button,
            text,
            14,
            textColor,
            Enum.Font.GothamBold
        )

    ButtonText.Position =
        UDim2.new(
            0,
            48,
            0,
            0
        )

    ButtonText.Size =
        UDim2.new(
            1,
            -54,
            1,
            0
        )

    local hoverBg =
        mono
        and 0.00
        or 0.12

    local defaultBg =
        bgTrans

    local hoverBd =
        mono
        and 0.30
        or 0.35

    local defaultBd =
        borderTrans

    Button.MouseEnter:Connect(
        function()

            Tween(
                Button,
                Fast,
                {
                    BackgroundTransparency =
                        hoverBg
                }
            )

            Tween(
                Border,
                Fast,
                {
                    Transparency =
                        hoverBd
                }
            )
        end
    )

    Button.MouseLeave:Connect(
        function()

            Tween(
                Button,
                Fast,
                {
                    BackgroundTransparency =
                        defaultBg
                }
            )

            Tween(
                Border,
                Fast,
                {
                    Transparency =
                        defaultBd
                }
            )
        end
    )

    return Button
end

local buttonRowY =
    Layout.keyBoxHeight
    + 83

local buttonRow2Y =
    buttonRowY
    + 67

local GetKeyBtn =
    ActionButton(
        Access,
        "KEY",
        "Get Key",

        UDim2.new(
            0,
            0,
            0,
            buttonRowY
        ),

        UDim2.new(
            0.49,
            -6,
            0,
            59
        ),

        true,
        false
    )

local VerifyBtn =
    ActionButton(
        Access,
        "OK",
        "Verify",

        UDim2.new(
            0.51,
            6,
            0,
            buttonRowY
        ),

        UDim2.new(
            0.49,
            -6,
            0,
            59
        ),

        false,
        true
    )

local ScriptbloxBtn =
    ActionButton(
        Access,
        "SBX",
        "Scriptblox",

        UDim2.new(
            0,
            0,
            0,
            buttonRow2Y
        ),

        UDim2.new(
            0.32,
            -7,
            0,
            54
        ),

        false,
        true
    )

local GamesBtn =
    ActionButton(
        Access,
        "GAM",
        "Supported Games",

        UDim2.new(
            0.34,
            3,
            0,
            buttonRow2Y
        ),

        UDim2.new(
            0.32,
            -7,
            0,
            54
        ),

        false,
        true
    )

local SettingsBtn =
    ActionButton(
        Access,
        "CFG",
        "Settings",

        UDim2.new(
            0.68,
            6,
            0,
            buttonRow2Y
        ),

        UDim2.new(
            0.32,
            -6,
            0,
            54
        ),

        false,
        true
    )

RegisterButton(
    GetKeyBtn,
    0.72
)

RegisterButton(
    VerifyBtn,
    0.76
)

RegisterButton(
    ScriptbloxBtn,
    0.80
)

RegisterButton(
    GamesBtn,
    0.83
)

RegisterButton(
    SettingsBtn,
    0.86
)

--========================================================--
-- SETTINGS POPUP
--========================================================--

local SettingsOverlay =
    New(
        "Frame",
        {
            Name =
                "SettingsOverlay",

            Size =
                UDim2.fromScale(
                    1,
                    1
                ),

            BackgroundColor3 =
                Color3.fromRGB(
                    0,
                    0,
                    0
                ),

            BackgroundTransparency = 1,

            BorderSizePixel = 0,

            ZIndex = 200,

            Visible = false
        },
        Main
    )

local SettingsCard =
    New(
        "Frame",
        {
            Name =
                "SettingsCard",

            AnchorPoint =
                Vector2.new(
                    0.5,
                    0.5
                ),

            Position =
                UDim2.fromScale(
                    0.5,
                    0.5
                ),

            Size =
                UDim2.fromOffset(
                    360,
                    250
                ),

            BackgroundColor3 =
                Color3.fromRGB(
                    14,
                    9,
                    26
                ),

            BackgroundTransparency =
                0.05,

            BorderSizePixel = 0,

            ZIndex = 201
        },
        SettingsOverlay
    )

Corner(
    SettingsCard,
    20
)

New(
    "UIStroke",
    {
        Color =
            Purple,

        Thickness = 1.5,

        Transparency =
            0.45
    },
    SettingsCard
)

New(
    "UIGradient",
    {
        Rotation = 130,

        Color =
            ColorSequence.new({
                ColorSequenceKeypoint.new(
                    0,
                    Color3.fromRGB(
                        38,
                        22,
                        66
                    )
                ),

                ColorSequenceKeypoint.new(
                    0.6,
                    Color3.fromRGB(
                        14,
                        8,
                        24
                    )
                ),

                ColorSequenceKeypoint.new(
                    1,
                    Color3.fromRGB(
                        7,
                        3,
                        15
                    )
                )
            }),

        Transparency =
            NumberSequence.new({
                NumberSequenceKeypoint.new(
                    0,
                    0.05
                ),

                NumberSequenceKeypoint.new(
                    1,
                    0.15
                )
            })
    },
    SettingsCard
)

local SettingsDotClose =
    New(
        "TextButton",
        {
            Text = "x",
            TextSize = 9,
            Font =
                Enum.Font.GothamBold,

            TextColor3 =
                Color3.fromRGB(
                    140,
                    40,
                    30
                ),

            Size =
                UDim2.fromOffset(
                    14,
                    14
                ),

            Position =
                UDim2.new(
                    0,
                    18,
                    0,
                    18
                ),

            BackgroundColor3 =
                Color3.fromRGB(
                    255,
                    95,
                    86
                ),

            BackgroundTransparency = 0,

            BorderSizePixel = 0,

            AutoButtonColor = false,

            ZIndex = 205
        },
        SettingsCard
    )

Corner(
    SettingsDotClose,
    100
)

New(
    "Frame",
    {
        Size =
            UDim2.fromOffset(
                14,
                14
            ),

        Position =
            UDim2.new(
                0,
                40,
                0,
                18
            ),

        BackgroundColor3 =
            Color3.fromRGB(
                255,
                189,
                46
            ),

        BorderSizePixel = 0,

        ZIndex = 205
    },
    SettingsCard
)

New(
    "Frame",
    {
        Size =
            UDim2.fromOffset(
                14,
                14
            ),

        Position =
            UDim2.new(
                0,
                62,
                0,
                18
            ),

        BackgroundColor3 =
            Color3.fromRGB(
                40,
                205,
                65
            ),

        BorderSizePixel = 0,

        ZIndex = 205
    },
    SettingsCard
)

local SettingsPopupTitle =
    Label(
        SettingsCard,
        "Settings",
        16,
        Color3.fromRGB(
            240,
            235,
            255
        ),
        Enum.Font.GothamBold
    )

SettingsPopupTitle.AnchorPoint =
    Vector2.new(
        0.5,
        0
    )

SettingsPopupTitle.Position =
    UDim2.new(
        0.5,
        0,
        0,
        12
    )

SettingsPopupTitle.Size =
    UDim2.new(
        1,
        -20,
        0,
        28
    )

SettingsPopupTitle.TextXAlignment =
    Enum.TextXAlignment.Center

local SettingsPopupSub =
    Label(
        SettingsCard,
        "1 option available",
        11,
        Color3.fromRGB(
            125,
            107,
            145
        ),
        Enum.Font.GothamBold
    )

SettingsPopupSub.AnchorPoint =
    Vector2.new(
        0.5,
        0
    )

SettingsPopupSub.Position =
    UDim2.new(
        0.5,
        0,
        0,
        40
    )

SettingsPopupSub.Size =
    UDim2.new(
        1,
        -20,
        0,
        18
    )

SettingsPopupSub.TextXAlignment =
    Enum.TextXAlignment.Center

New(
    "Frame",
    {
        Position =
            UDim2.new(
                0,
                24,
                0,
                65
            ),

        Size =
            UDim2.new(
                1,
                -48,
                0,
                1
            ),

        BackgroundColor3 =
            PurpleBright,

        BackgroundTransparency =
            0.82,

        BorderSizePixel = 0,

        ZIndex = 206
    },
    SettingsCard
)

local ScriptbloxSettingsButton =
    New(
        "TextButton",
        {
            Text =
                "Copy Scriptblox Profile",

            TextSize = 12,

            Font =
                Enum.Font.GothamBold,

            TextColor3 =
                PurpleBright,

            AnchorPoint =
                Vector2.new(
                    0.5,
                    0.5
                ),

            Position =
                UDim2.new(
                    0.5,
                    0,
                    0.5,
                    0
                ),

            Size =
                UDim2.new(
                    1,
                    -48,
                    0,
                    48
                ),

            BackgroundColor3 =
                PurpleDeep,

            BackgroundTransparency =
                0.28,

            BorderSizePixel = 0,

            AutoButtonColor = false,

            ZIndex = 207
        },
        SettingsCard
    )

Corner(
    ScriptbloxSettingsButton,
    12
)

New(
    "UIStroke",
    {
        Color =
            PurpleBright,

        Thickness = 1,

        Transparency =
            0.55
    },
    ScriptbloxSettingsButton
)

ScriptbloxSettingsButton.MouseButton1Click:Connect(
    function()

        pcall(function()

            if setclipboard then

                setclipboard(
                    "https://scriptblox.com/u/fishylvl"
                )
            end
        end)

        ScriptbloxSettingsButton.Text =
            "Copied!"

        task.wait(
            1.2
        )

        ScriptbloxSettingsButton.Text =
            "Copy Scriptblox Profile"
    end
)

local settingsOpen =
    false

local function OpenSettings()

    if settingsOpen then
        return
    end

    settingsOpen =
        true

    SettingsOverlay.Visible =
        true

    SettingsCard.Position =
        UDim2.new(
            0.5,
            0,
            0.42,
            0
        )

    SettingsCard.BackgroundTransparency =
        1

    SettingsOverlay.BackgroundTransparency =
        1

    Tween(
        SettingsOverlay,
        Smooth,
        {
            BackgroundTransparency =
                0.55
        }
    )

    Tween(
        SettingsCard,
        Smooth,
        {
            BackgroundTransparency =
                0.05,

            Position =
                UDim2.fromScale(
                    0.5,
                    0.5
                )
        }
    )
end

local function CloseSettings()

    if not settingsOpen then
        return
    end

    settingsOpen =
        false

    Tween(
        SettingsOverlay,
        Fast,
        {
            BackgroundTransparency = 1
        }
    )

    Tween(
        SettingsCard,
        Fast,
        {
            BackgroundTransparency = 1,

            Position =
                UDim2.new(
                    0.5,
                    0,
                    0.56,
                    0
                )
        }
    )

    task.wait(
        0.22
    )

    if not settingsOpen then

        SettingsOverlay.Visible =
            false

        SettingsCard.Position =
            UDim2.new(
                0.5,
                0,
                0.42,
                0
            )
    end
end

SettingsDotClose.MouseButton1Click:Connect(
    CloseSettings
)

SettingsOverlay.InputBegan:Connect(
    function(input)

        if input.UserInputType ==
            Enum.UserInputType.MouseButton1

        or input.UserInputType ==
            Enum.UserInputType.Touch then

            local cp =
                SettingsCard.AbsolutePosition

            local cs =
                SettingsCard.AbsoluteSize

            local mx =
                input.Position.X

            local my =
                input.Position.Y

            if mx < cp.X
            or mx > cp.X + cs.X
            or my < cp.Y
            or my > cp.Y + cs.Y then

                CloseSettings()
            end
        end
    end
)

SettingsBtn.MouseButton1Click:Connect(
    function()

        if settingsOpen then
            CloseSettings()
        else
            OpenSettings()
        end
    end
)

--========================================================--
-- SUPPORTED GAMES POPUP
--========================================================--

local SupportedGames = {
    {
        name = "Blox Fruits",
        badge = "BF"
    },

    {
        name = "Pet Simulator 99",
        badge = "PS"
    },

    {
        name = "Brookhaven RP",
        badge = "BH"
    },

    {
        name = "Adopt Me!",
        badge = "AM"
    },

    {
        name = "Da Hood",
        badge = "DH"
    },

    {
        name = "Arsenal",
        badge = "AR"
    },

    {
        name = "Anime Adventures",
        badge = "AA"
    },

    {
        name = "Muscle Legends",
        badge = "ML"
    },
}

local PopupOverlay =
    New(
        "Frame",
        {
            Name =
                "PopupOverlay",

            Size =
                UDim2.fromScale(
                    1,
                    1
                ),

            BackgroundColor3 =
                Color3.fromRGB(
                    0,
                    0,
                    0
                ),

            BackgroundTransparency =
                1,

            BorderSizePixel = 0,

            ZIndex = 200,

            Visible = false
        },
        Main
    )

local PopupCard =
    New(
        "Frame",
        {
            Name =
                "PopupCard",

            AnchorPoint =
                Vector2.new(
                    0.5,
                    0.5
                ),

            Position =
                UDim2.fromScale(
                    0.5,
                    0.5
                ),

            Size =
                UDim2.fromOffset(
                    340,
                    420
                ),

            BackgroundColor3 =
                Color3.fromRGB(
                    14,
                    9,
                    26
                ),

            BackgroundTransparency =
                0.05,

            BorderSizePixel = 0,

            ZIndex = 201
        },
        PopupOverlay
    )

Corner(
    PopupCard,
    20
)

New(
    "UIStroke",
    {
        Color =
            Purple,

        Thickness = 1.5,

        Transparency =
            0.45
    },
    PopupCard
)

New(
    "UIGradient",
    {
        Rotation = 130,

        Color =
            ColorSequence.new({
                ColorSequenceKeypoint.new(
                    0,
                    Color3.fromRGB(
                        38,
                        22,
                        66
                    )
                ),

                ColorSequenceKeypoint.new(
                    0.6,
                    Color3.fromRGB(
                        14,
                        8,
                        24
                    )
                ),

                ColorSequenceKeypoint.new(
                    1,
                    Color3.fromRGB(
                        7,
                        3,
                        15
                    )
                )
            }),

        Transparency =
            NumberSequence.new({
                NumberSequenceKeypoint.new(
                    0,
                    0.05
                ),

                NumberSequenceKeypoint.new(
                    1,
                    0.15
                )
            })
    },
    PopupCard
)

local PopupDotClose =
    New(
        "TextButton",
        {
            Text = "x",

            TextSize = 9,

            Font =
                Enum.Font.GothamBold,

            TextColor3 =
                Color3.fromRGB(
                    140,
                    40,
                    30
                ),

            Size =
                UDim2.fromOffset(
                    14,
                    14
                ),

            Position =
                UDim2.new(
                    0,
                    18,
                    0,
                    18
                ),

            BackgroundColor3 =
                Color3.fromRGB(
                    255,
                    95,
                    86
                ),

            BackgroundTransparency = 0,

            BorderSizePixel = 0,

            AutoButtonColor = false,

            ZIndex = 205
        },
        PopupCard
    )

Corner(
    PopupDotClose,
    100
)

New(
    "Frame",
    {
        Size =
            UDim2.fromOffset(
                14,
                14
            ),

        Position =
            UDim2.new(
                0,
                40,
                0,
                18
            ),

        BackgroundColor3 =
            Color3.fromRGB(
                255,
                189,
                46
            ),

        BorderSizePixel = 0,

        ZIndex = 205
    },
    PopupCard
)

New(
    "Frame",
    {
        Size =
            UDim2.fromOffset(
                14,
                14
            ),

        Position =
            UDim2.new(
                0,
                62,
                0,
                18
            ),

        BackgroundColor3 =
            Color3.fromRGB(
                40,
                205,
                65
            ),

        BorderSizePixel = 0,

        ZIndex = 205
    },
    PopupCard
)

local PopupTitle =
    Label(
        PopupCard,
        "Supported Games",
        16,
        Color3.fromRGB(
            240,
            235,
            255
        ),
        Enum.Font.GothamBold
    )

PopupTitle.AnchorPoint =
    Vector2.new(
        0.5,
        0
    )

PopupTitle.Position =
    UDim2.new(
        0.5,
        0,
        0,
        12
    )

PopupTitle.Size =
    UDim2.new(
        1,
        -20,
        0,
        28
    )

PopupTitle.TextXAlignment =
    Enum.TextXAlignment.Center

local PopupSub =
    Label(
        PopupCard,
        tostring(
            #SupportedGames
        )
        .. " games currently active",
        11,
        Color3.fromRGB(
            125,
            107,
            145
        ),
        Enum.Font.GothamBold
    )

PopupSub.AnchorPoint =
    Vector2.new(
        0.5,
        0
    )

PopupSub.Position =
    UDim2.new(
        0.5,
        0,
        0,
        40
    )

PopupSub.Size =
    UDim2.new(
        1,
        -20,
        0,
        18
    )

PopupSub.TextXAlignment =
    Enum.TextXAlignment.Center

New(
    "Frame",
    {
        Position =
            UDim2.new(
                0,
                24,
                0,
                65
            ),

        Size =
            UDim2.new(
                1,
                -48,
                0,
                1
            ),

        BackgroundColor3 =
            PurpleBright,

        BackgroundTransparency =
            0.82,

        BorderSizePixel = 0,

        ZIndex = 206
    },
    PopupCard
)

local GameScroll =
    New(
        "ScrollingFrame",
        {
            Position =
                UDim2.new(
                    0,
                    0,
                    0,
                    73
                ),

            Size =
                UDim2.new(
                    1,
                    0,
                    1,
                    -85
                ),

            BackgroundTransparency = 1,

            BorderSizePixel = 0,

            ScrollBarThickness = 3,

            ScrollBarImageColor3 =
                PurpleSoft,

            CanvasSize =
                UDim2.fromOffset(
                    0,
                    0
                ),

            AutomaticCanvasSize =
                Enum.AutomaticSize.Y,

            ZIndex = 206,

            ClipsDescendants = true
        },
        PopupCard
    )

New(
    "UIPadding",
    {
        PaddingLeft =
            UDim.new(
                0,
                20
            ),

        PaddingRight =
            UDim.new(
                0,
                20
            ),

        PaddingTop =
            UDim.new(
                0,
                6
            ),

        PaddingBottom =
            UDim.new(
                0,
                10
            )
    },
    GameScroll
)

New(
    "UIListLayout",
    {
        FillDirection =
            Enum.FillDirection.Vertical,

        SortOrder =
            Enum.SortOrder.LayoutOrder,

        Padding =
            UDim.new(
                0,
                4
            )
    },
    GameScroll
)

for i, gameEntry in ipairs(
    SupportedGames
) do

    local Row =
        New(
            "Frame",
            {
                Name =
                    "GameRow_" .. i,

                Size =
                    UDim2.new(
                        1,
                        0,
                        0,
                        46
                    ),

                BackgroundColor3 =
                    Color3.fromRGB(
                        26,
                        15,
                        44
                    ),

                BackgroundTransparency =
                    0.35,

                BorderSizePixel = 0,

                ZIndex = 207,

                LayoutOrder = i
            },
            GameScroll
        )

    Corner(
        Row,
        10
    )

    New(
        "UIStroke",
        {
            Color =
                PurpleDark,

            Thickness = 1,

            Transparency =
                0.55
        },
        Row
    )

    local IconFrame =
        New(
            "Frame",
            {
                Position =
                    UDim2.new(
                        0,
                        8,
                        0.5,
                        -14
                    ),

                Size =
                    UDim2.fromOffset(
                        36,
                        28
                    ),

                BackgroundColor3 =
                    PurpleDeep,

                BackgroundTransparency =
                    0.35,

                BorderSizePixel = 0,

                ZIndex = 208
            },
            Row
        )

    Corner(
        IconFrame,
        8
    )

    local IconLabel =
        Label(
            IconFrame,
            gameEntry.badge,
            9,
            PurpleBright,
            Enum.Font.GothamBold
        )

    IconLabel.Size =
        UDim2.fromScale(
            1,
            1
        )

    IconLabel.TextXAlignment =
        Enum.TextXAlignment.Center

    local NameLabel =
        Label(
            Row,
            gameEntry.name,
            14,
            Color3.fromRGB(
                230,
                225,
                245
            ),
            Enum.Font.GothamBold
        )

    NameLabel.Position =
        UDim2.new(
            0,
            52,
            0,
            0
        )

    NameLabel.Size =
        UDim2.new(
            1,
            -66,
            1,
            0
        )

    local Dot =
        New(
            "Frame",
            {
                AnchorPoint =
                    Vector2.new(
                        1,
                        0.5
                    ),

                Position =
                    UDim2.new(
                        1,
                        -8,
                        0.5,
                        0
                    ),

                Size =
                    UDim2.fromOffset(
                        8,
                        8
                    ),

                BackgroundColor3 =
                    Color3.fromRGB(
                        55,
                        225,
                        174
                    ),

                BorderSizePixel = 0,

                ZIndex = 208
            },
            Row
        )

    Corner(
        Dot,
        100
    )

    Row.MouseEnter:Connect(
        function()

            Tween(
                Row,
                Fast,
                {
                    BackgroundTransparency =
                        0.12
                }
            )
        end
    )

    Row.MouseLeave:Connect(
        function()

            Tween(
                Row,
                Fast,
                {
                    BackgroundTransparency =
                        0.35
                }
            )
        end
    )
end

local popupOpen =
    false

local function OpenPopup()

    if popupOpen then
        return
    end

    popupOpen =
        true

    PopupOverlay.Visible =
        true

    PopupCard.Position =
        UDim2.new(
            0.5,
            0,
            0.42,
            0
        )

    PopupCard.BackgroundTransparency =
        1

    PopupOverlay.BackgroundTransparency =
        1

    Tween(
        PopupOverlay,
        Smooth,
        {
            BackgroundTransparency =
                0.55
        }
    )

    Tween(
        PopupCard,
        Smooth,
        {
            BackgroundTransparency =
                0.05,

            Position =
                UDim2.fromScale(
                    0.5,
                    0.5
                )
        }
    )
end

local function ClosePopup()

    if not popupOpen then
        return
    end

    popupOpen =
        false

    Tween(
        PopupOverlay,
        Fast,
        {
            BackgroundTransparency =
                1
        }
    )

    Tween(
        PopupCard,
        Fast,
        {
            BackgroundTransparency =
                1,

            Position =
                UDim2.new(
                    0.5,
                    0,
                    0.56,
                    0
                )
        }
    )

    task.wait(
        0.22
    )

    if not popupOpen then

        PopupOverlay.Visible =
            false

        PopupCard.Position =
            UDim2.new(
                0.5,
                0,
                0.42,
                0
            )
    end
end

PopupDotClose.MouseButton1Click:Connect(
    ClosePopup
)

PopupOverlay.InputBegan:Connect(
    function(input)

        if input.UserInputType ==
            Enum.UserInputType.MouseButton1

        or input.UserInputType ==
            Enum.UserInputType.Touch then

            local cp =
                PopupCard.AbsolutePosition

            local cs =
                PopupCard.AbsoluteSize

            local mx =
                input.Position.X

            local my =
                input.Position.Y

            if mx < cp.X
            or mx > cp.X + cs.X
            or my < cp.Y
            or my > cp.Y + cs.Y then

                ClosePopup()
            end
        end
    end
)

GamesBtn.MouseButton1Click:Connect(
    function()

        if popupOpen then
            ClosePopup()
        else
            OpenPopup()
        end
    end
)

--========================================================--
-- KEY BUTTON LOGIC
--========================================================--

GetKeyBtn.MouseButton1Click:Connect(
    function()

        pcall(function()

            if setclipboard then

                setclipboard(
                    "https://discord.gg/rajeZXgYdT"
                )
            end
        end)

        SetStatus(
            "Discord link copied! Join to get your key.",
            Color3.fromRGB(
                205,
                145,
                255
            )
        )
    end
)

VerifyBtn.MouseButton1Click:Connect(
    function()

        local key =
            KeyText.Text:gsub(
                "%s+",
                ""
            )

        if key == "" then

            SetStatus(
                "Please enter a key.",
                Color3.fromRGB(
                    255,
                    100,
                    100
                )
            )

            return
        end

        SetStatus(
            "Verifying...",
            MonoWhite
        )

        task.spawn(function()

            local ok, res =
                pcall(function()

                    return Junkie.check_key(
                        key
                    )
                end)

            if not ok then

                SetStatus(
                    "Verification failed. Check your key.",
                    Color3.fromRGB(
                        255,
                        100,
                        100
                    )
                )

                return
            end

            if res
            and res.valid then

                if res.message ==
                    "KEYLESS" then

                    getgenv().SCRIPT_KEY =
                        "KEYLESS"

                    clearSavedKey()

                    SetStatus(
                        "Keyless access granted!",
                        Color3.fromRGB(
                            100,
                            255,
                            100
                        )
                    )

                elseif res.message ==
                    "KEY_VALID" then

                    saveVerifiedKey(
                        key
                    )

                    getgenv().SCRIPT_KEY =
                        key

                    SetStatus(
                        "Key approved! Loading...",
                        Color3.fromRGB(
                            100,
                            255,
                            100
                        )
                    )

                else

                    clearSavedKey()

                    getgenv().SCRIPT_KEY =
                        nil

                    SetStatus(
                        "Key invalid. Please try again.",
                        Color3.fromRGB(
                            255,
                            100,
                            100
                        )
                    )

                    return
                end

                task.wait(
                    1.5
                )

                Alive =
                    false

                getgenv().UI_CLOSED =
                    true

                Tween(
                    Main,
                    Smooth,
                    {
                        BackgroundTransparency =
                            1
                    }
                )

                Tween(
                    Backdrop,
                    Smooth,
                    {
                        BackgroundTransparency =
                            1
                    }
                )

                task.wait(
                    0.15
                )

                if GUI then
                    GUI:Destroy()
                end

            else

                SetStatus(
                    "Incorrect key. Please try again.",
                    Color3.fromRGB(
                        255,
                        100,
                        100
                    )
                )
            end
        end)
    end
)

ScriptbloxBtn.MouseButton1Click:Connect(
    function()

        pcall(function()

            if setclipboard then

                setclipboard(
                    "https://scriptblox.com/u/fishylvl"
                )
            end
        end)

        SetStatus(
            "Scriptblox profile link copied!",
            Color3.fromRGB(
                205,
                145,
                255
            )
        )
    end
)

--========================================================--
-- READY
--========================================================--

local Ready =
    New(
        "Frame",
        {
            BackgroundTransparency = 1,

            AnchorPoint =
                Vector2.new(
                    0,
                    1
                ),

            Position =
                UDim2.new(
                    0,
                    Layout.contentPadding,
                    1,
                    -180
                ),

            Size =
                UDim2.new(
                    1,
                    -Layout.contentPadding * 2,
                    0,
                    42
                )
        },
        MainArea
    )

New(
    "Frame",
    {
        BackgroundColor3 =
            Purple,

        BorderSizePixel = 0,

        Size =
            UDim2.fromOffset(
                4,
                42
            )
    },
    Ready
)

local ReadyText =
    Label(
        Ready,
        "Ready.",
        13,
        PurpleBright,
        Enum.Font.GothamBold
    )

ReadyText.Position =
    UDim2.new(
        0,
        12,
        0,
        0
    )

ReadyText.Size =
    UDim2.new(
        1,
        -12,
        1,
        0
    )

RegisterText(
    ReadyText,
    "left",
    0.92
)

--========================================================--
-- PREMIUM
--========================================================--

local Premium =
    New(
        "Frame",
        {
            BackgroundTransparency = 1,

            AnchorPoint =
                Vector2.new(
                    0,
                    1
                ),

            Position =
                UDim2.new(
                    0,
                    Layout.contentPadding,
                    1,
                    -Layout.contentPadding
                ),

            Size =
                UDim2.new(
                    1,
                    -Layout.contentPadding * 2,
                    0,
                    155
                )
        },
        MainArea
    )

New(
    "Frame",
    {
        Position =
            UDim2.new(
                0,
                0,
                0,
                0
            ),

        Size =
            UDim2.new(
                1,
                0,
                0,
                1
            ),

        BackgroundColor3 =
            Color3.fromRGB(
                255,
                255,
                255
            ),

        BackgroundTransparency =
            0.94,

        BorderSizePixel = 0
    },
    Premium
)

local PBadge =
    New(
        "TextLabel",
        {
            Text =
                "Fishy Hub",

            TextSize = 9,

            Font =
                Enum.Font.GothamBold,

            TextColor3 =
                PurpleBright,

            BackgroundColor3 =
                PurpleDeep,

            BackgroundTransparency =
                0.45,

            BorderSizePixel = 0,

            Position =
                UDim2.new(
                    0,
                    0,
                    0,
                    15
                ),

            Size =
                UDim2.fromOffset(
                    83,
                    26
                )
        },
        Premium
    )

Corner(
    PBadge,
    8
)

local PremiumTitle =
    Label(
        Premium,
        "Premium+ Access",
        18,
        Color3.fromRGB(
            239,
            243,
            248
        ),
        Enum.Font.GothamBold
    )

PremiumTitle.Position =
    UDim2.new(
        0,
        0,
        0,
        47
    )

PremiumTitle.Size =
    UDim2.new(
        0.6,
        0,
        0,
        27
    )

RegisterText(
    PremiumTitle,
    "left",
    0.95
)

local PremiumDesc =
    Label(
        Premium,
        "unlock even more of Fishy Hub",
        12,
        Color3.fromRGB(
            130,
            112,
            155
        ),
        Enum.Font.GothamBold
    )

PremiumDesc.Position =
    UDim2.new(
        0,
        0,
        0,
        75
    )

PremiumDesc.Size =
    UDim2.new(
        0.7,
        0,
        0,
        22
    )

RegisterText(
    PremiumDesc,
    "bottom",
    0.98
)

local Pricing =
    Label(
        Premium,
        "discord.gg/...",
        12,
        PurpleBright,
        Enum.Font.GothamBold
    )

Pricing.Position =
    UDim2.new(
        0,
        0,
        0,
        102
    )

Pricing.Size =
    UDim2.new(
        0.6,
        0,
        0,
        20
    )

RegisterText(
    Pricing,
    "right",
    1.01
)

local Perks =
    Label(
        Premium,
        "priority support  |  early access  |  customs  |  giveaways  |  special access",
        11,
        Color3.fromRGB(
            130,
            112,
            155
        ),
        Enum.Font.GothamBold
    )

Perks.Position =
    UDim2.new(
        0,
        0,
        0,
        126
    )

Perks.Size =
    UDim2.new(
        0.7,
        0,
        0,
        20
    )

RegisterText(
    Perks,
    "bottom",
    1.04
)

local PremiumViewBtn =
    ActionButton(
        Premium,
        "VIP",
        "View Options",

        UDim2.new(
            1,
            -170,
            0,
            53
        ),

        UDim2.fromOffset(
            165,
            56
        ),

        false,
        true
    )

RegisterButton(
    PremiumViewBtn,
    1.06
)

--========================================================--
-- RESPONSIVE RESIZE
--========================================================--

local function ApplyResponsiveLayout()

    Layout =
        GetLayoutProfile()

    ControlGutterWidth =
        Layout.controlGutterWidth

    Header.Size =
        UDim2.new(
            1,
            0,
            0,
            Layout.headerHeight
        )

    Content.Position =
        UDim2.new(
            0,
            0,
            0,
            Layout.headerHeight
        )

    Content.Size =
        UDim2.new(
            1,
            0,
            1,
            -Layout.headerHeight
        )

    Access.Position =
        UDim2.new(
            0,
            Layout.contentPadding,
            0,
            145
        )

    Access.Size =
        UDim2.new(
            1,
            -Layout.contentPadding * 2,
            1,
            -310
        )

    KeyBox.Size =
        UDim2.new(
            1,
            0,
            0,
            Layout.keyBoxHeight
        )

    KeyText.TextSize =
        if Layout.isMobile
        then 12
        else 13

    Title.TextSize =
        Layout.titleSize

    Subtitle.TextSize =
        Layout.subtitleSize

    Backdrop.BackgroundTransparency =
        Layout.backdropTransparency

    Main.BackgroundTransparency =
        Layout.mainTransparency

    if SidebarOpen then

        SidebarWidth =
            Layout.sidebarWidth

        Sidebar.Size =
            UDim2.new(
                SidebarWidth,
                0,
                1,
                0
            )

        MainArea.Position =
            UDim2.new(
                SidebarWidth,
                ControlGutterWidth,
                0,
                0
            )

        MainArea.Size =
            UDim2.new(
                1 - SidebarWidth,
                -ControlGutterWidth,
                1,
                0
            )
    end

    PositionSizeControl()
end

local camera =
    workspace.CurrentCamera

if camera then

    camera:GetPropertyChangedSignal(
        "ViewportSize"
    ):Connect(
        function()

            if Alive
            and GUI.Parent then

                ApplyResponsiveLayout()
            end
        end
    )
end

--========================================================--
-- SIDEBAR OPEN / CLOSE
--========================================================--

local function SetSidebar(open)

    SidebarOpen =
        open

    if open then

        Tween(
            Sidebar,
            Smooth,
            {
                Size =
                    UDim2.new(
                        SidebarWidth,
                        0,
                        1,
                        0
                    )
            }
        )

        Tween(
            MainArea,
            Smooth,
            {
                Position =
                    UDim2.new(
                        SidebarWidth,
                        ControlGutterWidth,
                        0,
                        0
                    ),

                Size =
                    UDim2.new(
                        1 - SidebarWidth,
                        -ControlGutterWidth,
                        1,
                        0
                    )
            }
        )

        Tween(
            Username,
            Smooth,
            {
                TextTransparency = 0
            }
        )

        Tween(
            Handle,
            Smooth,
            {
                TextTransparency = 0
            }
        )

        Tween(
            ConnectionText,
            Smooth,
            {
                TextTransparency = 0
            }
        )

        Tween(
            ConnectionSub,
            Smooth,
            {
                TextTransparency = 0
            }
        )

    else

        Tween(
            Sidebar,
            Smooth,
            {
                Size =
                    UDim2.new(
                        MinSidebarWidth,
                        0,
                        1,
                        0
                    )
            }
        )

        Tween(
            MainArea,
            Smooth,
            {
                Position =
                    UDim2.new(
                        MinSidebarWidth,
                        ControlGutterWidth,
                        0,
                        0
                    ),

                Size =
                    UDim2.new(
                        1 - MinSidebarWidth,
                        -ControlGutterWidth,
                        1,
                        0
                    )
            }
        )

        Tween(
            Username,
            Smooth,
            {
                TextTransparency = 1
            }
        )

        Tween(
            Handle,
            Smooth,
            {
                TextTransparency = 1
            }
        )

        Tween(
            ConnectionText,
            Smooth,
            {
                TextTransparency = 1
            }
        )

        Tween(
            ConnectionSub,
            Smooth,
            {
                TextTransparency = 1
            }
        )
    end
end

ProfileToggle.MouseButton1Click:Connect(
    function()

        SetSidebar(
            not SidebarOpen
        )
    end
)

Minimize.MouseButton1Click:Connect(
    function()

        SetSidebar(
            not SidebarOpen
        )
    end
)

--========================================================--
-- RESIZE SIDEBAR
--========================================================--

local function UpdateSidebarWidth(
    mouseX
)

    if not Resizing
    or not SidebarOpen then
        return
    end

    local contentLeft =
        Content.AbsolutePosition.X

    local contentWidth =
        Content.AbsoluteSize.X

    SidebarWidth =
        math.clamp(
            (
                mouseX
                - contentLeft
            )
            /
            contentWidth,

            MinSidebarWidth,
            MaxSidebarWidth
        )

    Sidebar.Size =
        UDim2.new(
            SidebarWidth,
            0,
            1,
            0
        )

    MainArea.Position =
        UDim2.new(
            SidebarWidth,
            ControlGutterWidth,
            0,
            0
        )

    MainArea.Size =
        UDim2.new(
            1 - SidebarWidth,
            -ControlGutterWidth,
            1,
            0
        )
end

ResizeHandle.InputBegan:Connect(
    function(input)

        if input.UserInputType ==
            Enum.UserInputType.MouseButton1

        or input.UserInputType ==
            Enum.UserInputType.Touch then

            Resizing =
                true

            Tween(
                ResizeHandle,
                Fast,
                {
                    BackgroundColor3 =
                        PurpleSoft,

                    BackgroundTransparency =
                        0.15
                }
            )

            Tween(
                ResizeLine,
                Fast,
                {
                    BackgroundTransparency =
                        0
                }
            )
        end
    end
)

UserInputService.InputChanged:Connect(
    function(input)

        if Resizing
        and (
            input.UserInputType ==
                Enum.UserInputType.MouseMovement

            or input.UserInputType ==
                Enum.UserInputType.Touch
        ) then

            UpdateSidebarWidth(
                input.Position.X
            )
        end
    end
)

UserInputService.InputEnded:Connect(
    function(input)

        if input.UserInputType ==
            Enum.UserInputType.MouseButton1

        or input.UserInputType ==
            Enum.UserInputType.Touch then

            Resizing =
                false

            Tween(
                ResizeHandle,
                Fast,
                {
                    BackgroundColor3 =
                        PurpleDeep,

                    BackgroundTransparency =
                        0.45
                }
            )

            Tween(
                ResizeLine,
                Fast,
                {
                    BackgroundTransparency =
                        0.25
                }
            )
        end
    end
)

ResizeHandle.MouseEnter:Connect(
    function()

        if not Resizing then

            Tween(
                ResizeHandle,
                Fast,
                {
                    BackgroundTransparency =
                        0.25
                }
            )

            Tween(
                ResizeLine,
                Fast,
                {
                    BackgroundTransparency =
                        0
                }
            )
        end
    end
)

ResizeHandle.MouseLeave:Connect(
    function()

        if not Resizing then

            Tween(
                ResizeHandle,
                Fast,
                {
                    BackgroundTransparency =
                        0.45
                }
            )

            Tween(
                ResizeLine,
                Fast,
                {
                    BackgroundTransparency =
                        0.25
                }
            )
        end
    end
)

--========================================================--
-- HEADER HOVER + CLOSE
--========================================================--

Minimize.MouseEnter:Connect(
    function()

        Tween(
            Minimize,
            Fast,
            {
                BackgroundColor3 =
                    Color3.fromRGB(
                        74,
                        42,
                        110
                    )
            }
        )
    end
)

Minimize.MouseLeave:Connect(
    function()

        Tween(
            Minimize,
            Fast,
            {
                BackgroundColor3 =
                    PurpleDeep
            }
        )
    end
)

Close.MouseEnter:Connect(
    function()

        Tween(
            Close,
            Fast,
            {
                BackgroundColor3 =
                    Color3.fromRGB(
                        130,
                        48,
                        100
                    )
            }
        )
    end
)

Close.MouseLeave:Connect(
    function()

        Tween(
            Close,
            Fast,
            {
                BackgroundColor3 =
                    PurpleDeep
            }
        )
    end
)

Close.MouseButton1Click:Connect(
    function()

        Alive =
            false

        Tween(
            Main,
            Smooth,
            {
                BackgroundTransparency =
                    1
            }
        )

        Tween(
            Backdrop,
            Smooth,
            {
                BackgroundTransparency =
                    1
            }
        )

        task.wait(
            0.4
        )

        if GUI then
            GUI:Destroy()
        end
    end
)

--========================================================--
-- OPEN ANIMATION
--========================================================--

Tween(
    Backdrop,
    Smooth,
    {
        BackgroundTransparency =
            Layout.backdropTransparency
    }
)

Tween(
    Main,
    Smooth,
    {
        BackgroundTransparency =
            Layout.mainTransparency
    }
)

--========================================================--
-- INTRO ANIMATIONS
--========================================================--

task.spawn(function()

    task.wait(
        0.30
    )

    for _, entry in ipairs(
        IntroTextElements
    ) do

        AnimateTextSlide(
            entry.label,
            entry.direction,
            entry.delay
        )
    end

    for _, entry in ipairs(
        IntroButtonElements
    ) do

        AnimateButtonIntro(
            entry.button,
            entry.delay
        )
    end
end)

--========================================================--
-- KEY BOX GLOW
--========================================================--

local keyGlowUp =
    true

task.spawn(function()

    while Alive
    and GUI.Parent do

        if keyGlowUp then

            Tween(
                KeyBorder,
                TweenInfo.new(
                    0.7,
                    Enum.EasingStyle.Sine,
                    Enum.EasingDirection.InOut
                ),
                {
                    Thickness = 3.8,
                    Transparency = 0
                }
            )

        else

            Tween(
                KeyBorder,
                TweenInfo.new(
                    0.9,
                    Enum.EasingStyle.Sine,
                    Enum.EasingDirection.InOut
                ),
                {
                    Thickness = 2,
                    Transparency = 0.12
                }
            )
        end

        keyGlowUp =
            not keyGlowUp

        task.wait(
            keyGlowUp
            and 0.9
            or 0.7
        )
    end
end)

--========================================================--
-- MAIN + KEY SWEEP
--========================================================--

task.spawn(function()

    local rotation =
        0

    while Alive
    and GUI.Parent do

        rotation =
            (
                rotation
                + 2.2
            )
            % 360

        MainSweep.Rotation =
            rotation

        KeySweep.Rotation =
            rotation

        task.wait()
    end
end)

--========================================================--
-- HACKER SCRAMBLE ONLY FOR PREFILLED SAVED KEY
--========================================================--

task.spawn(function()

    task.wait(
        1.65
    )

    local key =
        KeyText.Text

    if key
    and key ~= ""
    and key ~= KeyText.PlaceholderText then

        Tween(
            KeyBorder,
            TweenInfo.new(
                0.12,
                Enum.EasingStyle.Linear
            ),
            {
                Transparency = 0,
                Thickness = 4.5
            }
        )

        Tween(
            KeyBox,
            TweenInfo.new(
                0.12,
                Enum.EasingStyle.Linear
            ),
            {
                BackgroundColor3 =
                    Color3.fromRGB(
                        18,
                        18,
                        18
                    )
            }
        )

        task.wait(
            0.12
        )

        HackerScramble(
            KeyText,
            key,
            1.5
        )

        task.wait(
            1.5
        )

        Tween(
            KeyBox,
            TweenInfo.new(
                0.3,
                Enum.EasingStyle.Quart,
                Enum.EasingDirection.Out
            ),
            {
                BackgroundColor3 =
                    MonoBlack
            }
        )
    end
end)

--========================================================--
-- CONNECTION DOT PULSE
--========================================================--

task.spawn(function()

    while Alive
    and GUI.Parent do

        Tween(
            ConnectionDot,
            TweenInfo.new(
                1.4,
                Enum.EasingStyle.Sine,
                Enum.EasingDirection.InOut
            ),
            {
                BackgroundTransparency =
                    0.18
            }
        )

        task.wait(
            1.4
        )

        Tween(
            ConnectionDot,
            TweenInfo.new(
                1.4,
                Enum.EasingStyle.Sine,
                Enum.EasingDirection.InOut
            ),
            {
                BackgroundTransparency =
                    0
            }
        )

        task.wait(
            1.4
        )
    end
end)

--========================================================--
-- FINAL UI-CLOSED WAIT
--========================================================--

while not getgenv().UI_CLOSED do
    task.wait(
        0.7
    )
end

local result =
    getgenv().SCRIPT_KEY

do ("JNKIE Loader - Unauthorized tampering or debugging of protected scripts is strictly prohibited and may result in a global blacklist from JNKIE protected scripts."):sub(1,1);local k=getgenv().SCRIPT_KEY or SCRIPT_KEY;local m="Failed to load script, please try later again!";local function v(h)warn(h);task.spawn(function()pcall(function()game:GetService("Players").LocalPlayer:Kick(h)end);task.wait();pcall(function()local p=game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ErrorPrompt;p.TitleFrame.ErrorTitle.Text="JNKIE";p.MessageArea.ErrorFrame.ErrorMessage.Text=h end)end)end;local r=(type(syn)=="table" and type(syn.request)=="function" and syn.request)or(type(request)=="function" and request)or(type(http_request)=="function" and http_request)or(type(http)=="table" and type(http.request)=="function" and http.request);if type(k)~="string" then v("Key verification failed");return end;if type(r)~="function" then warn(m);return end;local function q(o)local d,a,x;task.spawn(function()a,x=pcall(r,o);d=true end);local s=os.clock();repeat task.wait()until d or os.clock()-s>15;if not d then return false,nil end;return a,x end;local a,x=q({Url="https://api.jnkie.com/api/v1/luascripts/delivery/6ce30b27ad3302098254fa1e31765b4a7b65c4c078fc34c30ef6d7f11a50bbbf?v=2",Method="POST",Headers={["Content-Type"]="text/plain"},Body=k});local h=a and type(x)=="table" and type(x.Body)=="string" and(x.StatusCode==400 or x.StatusCode==401 or x.StatusCode==403)and x.Body;if h and(h=="LDR-DENIED" or h:match("^LDR%-DENIED:[A-Z_]+$"))then v("Key verification failed ("..h..")");return end;if a and type(x)=="table" and x.StatusCode==200 and type(x.Body)=="string" and string.sub(x.Body,1,22)=="https://cdn.jnkie.com/" then a,x=q({Url=x.Body,Method="GET"})end;if a and type(x)=="table" and(x.StatusCode==302 or x.StatusCode==303)then local h=x.Headers or x.headers;local l=type(h)=="table" and(h.Location or h.location);if type(l)=="string" and string.sub(l,1,22)=="https://cdn.jnkie.com/" then a,x=q({Url=l,Method="GET"})end end;if not a or type(x)~="table" or x.StatusCode~=200 or type(x.Body)~="string" or#x.Body==0 then warn(m);return end;local b=x.Body;x=nil;local f=loadstring(b);b=nil;if type(f)~="function" then warn(m);return end;f()end